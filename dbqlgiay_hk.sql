USE [master]
GO
/****** Object:  Database [QUANLIAOQUAN]    Script Date: 12/19/2022 2:55:12 AM ******/
CREATE DATABASE [QUANLIAOQUAN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quanliaoquan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\quanliaoquan.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'quanliaoquan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\quanliaoquan_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QUANLIAOQUAN] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QUANLIAOQUAN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QUANLIAOQUAN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QUANLIAOQUAN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QUANLIAOQUAN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QUANLIAOQUAN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QUANLIAOQUAN] SET ARITHABORT OFF 
GO
ALTER DATABASE [QUANLIAOQUAN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QUANLIAOQUAN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QUANLIAOQUAN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QUANLIAOQUAN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QUANLIAOQUAN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QUANLIAOQUAN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QUANLIAOQUAN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QUANLIAOQUAN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QUANLIAOQUAN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QUANLIAOQUAN] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QUANLIAOQUAN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QUANLIAOQUAN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QUANLIAOQUAN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QUANLIAOQUAN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QUANLIAOQUAN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QUANLIAOQUAN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QUANLIAOQUAN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QUANLIAOQUAN] SET RECOVERY FULL 
GO
ALTER DATABASE [QUANLIAOQUAN] SET  MULTI_USER 
GO
ALTER DATABASE [QUANLIAOQUAN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QUANLIAOQUAN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QUANLIAOQUAN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QUANLIAOQUAN] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QUANLIAOQUAN] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QUANLIAOQUAN', N'ON'
GO
USE [QUANLIAOQUAN]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/19/2022 2:55:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 12/19/2022 2:55:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ProductID] [int] NULL,
	[BillID] [int] NULL,
	[Amount] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/19/2022 2:55:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 12/19/2022 2:55:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaChiTietHD] [bigint] IDENTITY(1,1) NOT NULL,
	[MaSanPham] [bigint] NOT NULL,
	[SoLuongMua] [int] NOT NULL,
	[MaHoaDon] [bigint] NOT NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 12/19/2022 2:55:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[makh] [int] NULL,
	[NgayMua] [datetime] NOT NULL,
	[damua] [bit] NULL,
 CONSTRAINT [PK_hoadon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product]    Script Date: 12/19/2022 2:55:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[sell_ID] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (1, N'Adam', N'123456', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (2, N'Anjolie', N'SNZ6HE', 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (3, N'Ferris', N'RXH3XJ', 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (4, N'Katell', N'HWV8ZN', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (5, N'Zahir', N'NPX7OF', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (6, N'Conan', N'WIZ5VZ', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (7, N'Cade', N'ZSW2LU', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (8, N'Micah', N'RVV5SR', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (9, N'Rowan', N'VAI6XR', 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (10, N'Kirby', N'DNX6JK', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (11, N'Tanisha', N'XWU7JP', 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (12, N'Howard', N'TSR5MR', 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (13, N'Tana', N'EHS8CM', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (14, N'Hadassah', N'YOY7ZW', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (15, N'Echo', N'IGE8TN', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (16, N'Slade', N'OFO6QS', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (17, N'Devin', N'IBM6RZ', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (18, N'Rowan', N'ZYS9VI', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (19, N'Rafael', N'WZA0IH', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (20, N'Madaline', N'QMW4EN', 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (21, N'Vera', N'CZB2VM', 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (22, N'Declan', N'ZKE7QZ', 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (23, N'Katell', N'SFS0IW', 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (24, N'Summer', N'PSQ7LC', 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (25, N'Robin', N'KIS9AF', 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (26, N'Dominique', N'IKV0IX', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (27, N'admin', N'123', 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (28, N'mra', N'mra', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (29, N'mrb', N'123', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (30, N'Camden', N'123', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (31, N'Van Hieu', N'123', 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (32, N'hieuquatcha', N'111', 0, 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([ProductID], [BillID], [Amount], [id]) VALUES (2, 1, 2, 5)
INSERT [dbo].[Cart] ([ProductID], [BillID], [Amount], [id]) VALUES (3, 1, 2, 6)
INSERT [dbo].[Cart] ([ProductID], [BillID], [Amount], [id]) VALUES (2, 1, 2, 7)
INSERT [dbo].[Cart] ([ProductID], [BillID], [Amount], [id]) VALUES (3, 4, 3, 8)
INSERT [dbo].[Cart] ([ProductID], [BillID], [Amount], [id]) VALUES (2, 3, 4, 9)
INSERT [dbo].[Cart] ([ProductID], [BillID], [Amount], [id]) VALUES (3, 3, 3, 10)
INSERT [dbo].[Cart] ([ProductID], [BillID], [Amount], [id]) VALUES (4, 3, 3, 11)
INSERT [dbo].[Cart] ([ProductID], [BillID], [Amount], [id]) VALUES (4, 5, 5, 12)
INSERT [dbo].[Cart] ([ProductID], [BillID], [Amount], [id]) VALUES (2, 3, 2, 13)
INSERT [dbo].[Cart] ([ProductID], [BillID], [Amount], [id]) VALUES (3, 2, 3, 14)
INSERT [dbo].[Cart] ([ProductID], [BillID], [Amount], [id]) VALUES (4, 6, 4, 15)
INSERT [dbo].[Cart] ([ProductID], [BillID], [Amount], [id]) VALUES (6, 7, 3, 16)
INSERT [dbo].[Cart] ([ProductID], [BillID], [Amount], [id]) VALUES (4, 8, 4, 17)
INSERT [dbo].[Cart] ([ProductID], [BillID], [Amount], [id]) VALUES (5, 9, 3, 18)
INSERT [dbo].[Cart] ([ProductID], [BillID], [Amount], [id]) VALUES (3, 10, 4, 19)
INSERT [dbo].[Cart] ([ProductID], [BillID], [Amount], [id]) VALUES (3, 11, 4, 20)
INSERT [dbo].[Cart] ([ProductID], [BillID], [Amount], [id]) VALUES (9, 12, 4, 21)
INSERT [dbo].[Cart] ([ProductID], [BillID], [Amount], [id]) VALUES (11, 13, 3, 22)
INSERT [dbo].[Cart] ([ProductID], [BillID], [Amount], [id]) VALUES (12, 14, 3, 23)
INSERT [dbo].[Cart] ([ProductID], [BillID], [Amount], [id]) VALUES (3, 15, 2, 24)
INSERT [dbo].[Cart] ([ProductID], [BillID], [Amount], [id]) VALUES (5, 16, 3, 25)
SET IDENTITY_INSERT [dbo].[Cart] OFF
INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'GIÀY ADIDAS')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'GIÀY NIKE')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'GIÀY BITI''S')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'GIÀY CONVERSE')
SET IDENTITY_INSERT [dbo].[hoadon] ON 

INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (1, 20, CAST(N'1989-01-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (2, 21, CAST(N'1945-01-10 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (3, 20, CAST(N'2017-10-10 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (4, 23, CAST(N'2022-11-24 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (5, 23, CAST(N'2022-12-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (6, 23, CAST(N'2022-12-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (7, 23, CAST(N'2022-12-07 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (8, 23, CAST(N'2022-12-07 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (9, 23, CAST(N'2022-12-07 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (10, 23, CAST(N'2022-12-07 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (11, 23, CAST(N'2022-12-07 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (12, 23, CAST(N'2022-12-07 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (13, 31, CAST(N'2022-12-07 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (14, 31, CAST(N'2022-12-07 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (15, 31, CAST(N'2022-12-08 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (16, 31, CAST(N'2022-12-07 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[hoadon] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (2, N'Giày chạy bộ', N'https://canary.contestimg.wish.com/api/webimage/5d5bd678d55c843e49fe3077-normal.jpg?cache_buster=ddfc80fb52c6bd85a67c68ceb94a91d7', 120.0000, N'Giày Adidas Nova Run EE9266
', N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 2, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (3, N'Giày du lịch', N'https://canary.contestimg.wish.com/api/webimage/5da6e559dcf2d00d2fbc707c-normal.jpg?cache_buster=d9139cea7e503395b907432f89e292d6', 130.0000, N'Dép đúc thể thao nam Adidas Adilette Boost Slides Đen - EH2256
', N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 1, 7)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (4, N'Giày adidas 2A', N'https://canary.contestimg.wish.com/api/webimage/5e0db090b6383fa7bb0416ab-large.jpg?cache_buster=92297459781628185d780669109c00d6', 145.0000, N'Giày thể thao nam Adidas Enerergy Falcon EE9844
', N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 1, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (5, N'Giày adidas 2B', N'https://canary.contestimg.wish.com/api/webimage/5da6e559dcf2d00d2fbc707c-normal.jpg?cache_buster=d9139cea7e503395b907432f89e292d6', 150.0000, N'Giày đá bóng nam chính hãng Adidas Predator 18.4 FXG DB2007
', N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 1, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (6, N'Giày adidas 2C', N'https://canary.contestimg.wish.com/api/webimage/5da6e559dcf2d00d2fbc707c-normal.jpg?cache_buster=d9139cea7e503395b907432f89e292d6', 160.0000, N'Giày đá bóng nam chính hãng Adidas Copa Tango 18.3 TF DB2410
', N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 2, 7)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (7, N'Giày adidas 2D', N'https://canary.contestimg.wish.com/api/webimage/5da6e559dcf2d00d2fbc707c-normal.jpg?cache_buster=d9139cea7e503395b907432f89e292d6', 170.0000, N'Giày đá bóng nam chính hãng Adidas X TANGO 18.4 TF DB2479
', N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 1, 14)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (8, N'New Men''s Running Shoes', N'https://canary.contestimg.wish.com/api/webimage/5c4a05a08b26e56dcf17a643-normal.jpg?cache_buster=6d01b751858e14e68932bb234cdc44c1', 150.0000, N'Comfortable Sports Shoes Men Athletic Outdoor Cushioning Sneakers for Walking&Jogging (EUR Size 39-48)', N'New Men''s Running Shoes Comfortable Sports Shoes Men Athletic Outdoor Cushioning Sneakers for Walking&Jogging (EUR Size 39-48)', 4, 15)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (9, N'Men Hiking Shoes Waterproof Non', N'https://canary.contestimg.wish.com/api/webimage/5dc3c309d8b69d0de8949a21-large.jpg?cache_buster=68ad269a9f7b07d0effa9e48c1dc5c0f', 180.0000, N'Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-47 3 Colors
', N'Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-47 3 Colors
', 3, 14)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (10, N'Winter Men''s Snow Boots Plus Velvet', N'https://canary.contestimg.wish.com/api/webimage/5da3d0b594a0f07fdec6c5ac-large.jpg?cache_buster=a2471ea62eba44e7c0b0f4d2b4c64681', 180.0000, N'Winter Men''s Snow Boots Plus Velvet Cotton Shoes Men''s Shoes Martin Cotton Boots Warm Shoes
', N'Winter Men''s Snow Boots Plus Velvet Cotton Shoes Men''s Shoes Martin Cotton Boots Warm Shoes
', 4, 15)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (11, N'New Trend Men Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5df1f07d1fc34e0c50f78eb7-large.jpg?cache_buster=36188c130400df0faa4256aad8e90109', 150.0000, N'New Trend Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-48
', N'New Trend Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-48
', 3, 17)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (12, N'Mens Skid Resistant Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5f3fb6d1b2a7ef003f6bd8a4-large.jpg?cache_buster=c9295f971ce194c1e68f6144f11314c6', 165.0000, N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoor Sport Shoes Fashion Sneakers
', N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoor Sport Shoes Fashion Sneakers
', 3, 19)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (13, N'NEW Spring White Shoes Men', N'https://canary.contestimg.wish.com/api/webimage/5d0235c9ae115f0be32755ef-large.jpg?cache_buster=fd2c105001ca1cbb03795818542906cc', 185.0000, N'NEW Spring White Shoes Men Shoes Men''s Casual Shoes Fashion Sneakers Street Cool Man Footwear
', N'NEW Spring White Shoes Men Shoes Men''s Casual Shoes Fashion Sneakers Street Cool Man Footwear
', 3, 18)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (14, N'Winter Outdoor Waterproof', N'https://canary.contestimg.wish.com/api/webimage/5d70b17d55d5981ab5789f86-large.jpg?cache_buster=19f34456a6b274b940c839db21c2ab51', 200.0000, N'Winter Outdoor Waterproof Non-slip Plus Velvet Warm Snow Boots Cotton Boots Men''s Shoes
', N'Winter Outdoor Waterproof Non-slip Plus Velvet Warm Snow Boots Cotton Boots Men''s Shoes
', 4, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (15, N'Men''s Fashion Casual Shoes', N'https://canary.contestimg.wish.com/api/webimage/5c4a06d9e6a1c62df8877125-large.jpg?cache_buster=d17e757a3f8465edc71812b95b4b1a57', 100.0000, N'Men''s Fashion Casual Shoes Sports Running Shoes Men''s Shoes
', N'Men''s Fashion Casual Shoes Sports Running Shoes Men''s Shoes
', 4, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (16, N'Mens Skid Resistant Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5c4a02d1344e882b1a41bca4-large.jpg?cache_buster=bc4ce4d229ed4e42dbba614acb622899', 120.0000, N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors
', N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors
', 4, 7)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (17, N'Men''s Modern Classic Lace Up Lined', N'https://canary.contestimg.wish.com/api/webimage/5c9543744578cb33ad0f56cd-large.jpg?cache_buster=ed84658c453c742ad13b9d565566ed06', 100.0000, N'Men''s Modern Classic Lace Up Lined Perforated Dress Oxfords Shoes Flexible and Comfort oxfords
', N'Men''s Modern Classic Lace Up Lined Perforated Dress Oxfords Shoes Flexible and Comfort oxfords
', 3, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (18, N'Men''s Outdoors Waterproof Boots Sports Shoes', N'https://canary.contestimg.wish.com/api/webimage/5e0db090b6383fa7bb0416ab-large.jpg?cache_buster=92297459781628185d780669109c00d6', 120.0000, N'Men''s Outdoors Waterproof Boots Sports Shoes Snow Boots Hiking Boots Men''s Winter Warm Boots(No Velvet/Plus Velvet)
', N'Men''s Outdoors Waterproof Boots Sports Shoes Snow Boots Hiking Boots Men''s Winter Warm Boots(No Velvet/Plus Velvet)
', 3, 7)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (19, N'Ginter Outdoor Waterproof', N'https://canary.contestimg.wish.com/api/webimage/5c4a02d1344e882b1a41bca4-large.jpg?cache_buster=bc4ce4d229ed4e42dbba614acb622899', 100.0000, N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors
', N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors
', 2, 4)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (20, N'Giày Nike Advantage', N'https://canary.contestimg.wish.com/api/webimage/5da6e559dcf2d00d2fbc707c-normal.jpg?cache_buster=d9139cea7e503395b907432f89e292d6', 100.0000, N'Giày dá bóng nam chính hãng Adidas Copa Tango 18.3 TF DB2410
', N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 2, 6)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (21, N'Giày Thể Thao Advantage', N'https://canary.contestimg.wish.com/api/webimage/5da6e559dcf2d00d2fbc707c-normal.jpg?cache_buster=d9139cea7e503395b907432f89e292d6', 100.0000, N'Giày dá bóng nam chính hãng Adidas Copa Tango 18.3 TF DB2410
', N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 2, 7)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (22, N'Giày Vans Ðen', N'https://canary.contestimg.wish.com/api/webimage/5da6e559dcf2d00d2fbc707c-normal.jpg?cache_buster=d9139cea7e503395b907432f89e292d6', 100.0000, N'Giày dá bóng nam chính hãng Adidas Copa Tango 18.3 TF DB2410
', N'Giày Vans Ðen Clean s? d?ng ch?t li?u cao c?p, thoáng khí c? m?t trong và m?t ngoài giúp b?n luôn d? ch?u và tho?i mái dù mang trong th?i gian dài. Giày Adidas VS Advantage có b? d? êm ái giúp ngu?i di t?n hu?ng c?m giác tho?i mái cho c? ngày dài v?n d?ng. Th?i trang v?n là s? quay vòng, và thi?t k? don gi?n, c? di?n d?i di?n cho xu hu?ng th?i trang hoài c? dang quay tr? l?i và du?c gi?i tr? dón nh?n n?ng nhi?t hon bao gi? h?t. Không gi?ng nhu nh?ng lo?i giày th? thao thông thu?ng, m?u giày adidas Advantage có ki?u dáng "thon th?" hon, khi?n cho dôi chân không b? tr? nên l?c lõng so v?i dôi giày th? thao v?n b? "mang ti?ng" là thô k?ch, không d?p m?t. Thêm n?a, d? c?a lo?i giày này du?c thi?t k? theo ki?u d? xu?ng 3cm v?a t?o tính dàn h?i cho t?ng bu?c di mà cung "ti?n tay" giúp cho ngu?i di "an gian" chi?u cao khá dáng k?. Và t?t nhiên, di?m c?ng tuy?t v?i nh?t chính là s? ph?i h?p tuy?t v?i t? ki?u dáng d?n màu s?c c?a các nhà thi?t k? tài hoa dã làm cho dôi giày phù h?p v?i m?i gi?i tính, m?i l?a tu?i, mix du?c v?i r?t nhi?u phong cách khác nhau', 2, 7)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (23, N'Giày Vans Ðen', N'https://canary.contestimg.wish.com/api/webimage/5da6e559dcf2d00d2fbc707c-normal.jpg?cache_buster=d9139cea7e503395b907432f89e292d6', 100.0000, N'Giày dá bóng nam chính hãng Adidas Copa Tango 18.3 TF DB2410
', N'Giày Vans Ðen Clean s? d?ng ch?t li?u cao c?p, thoáng khí c? m?t trong và m?t ngoài giúp b?n luôn d? ch?u và tho?i mái dù mang trong th?i gian dài. Giày Adidas VS Advantage có b? d? êm ái giúp ngu?i di t?n hu?ng c?m giác tho?i mái cho c? ngày dài v?n d?ng. Th?i trang v?n là s? quay vòng, và thi?t k? don gi?n, c? di?n d?i di?n cho xu hu?ng th?i trang hoài c? dang quay tr? l?i và du?c gi?i tr? dón nh?n n?ng nhi?t hon bao gi? h?t. Không gi?ng nhu nh?ng lo?i giày th? thao thông thu?ng, m?u giày adidas Advantage có ki?u dáng "thon th?" hon, khi?n cho dôi chân không b? tr? nên l?c lõng so v?i dôi giày th? thao v?n b? "mang ti?ng" là thô k?ch, không d?p m?t. Thêm n?a, d? c?a lo?i giày này du?c thi?t k? theo ki?u d? xu?ng 3cm v?a t?o tính dàn h?i cho t?ng bu?c di mà cung "ti?n tay" giúp cho ngu?i di "an gian" chi?u cao khá dáng k?. Và t?t nhiên, di?m c?ng tuy?t v?i nh?t chính là s? ph?i h?p tuy?t v?i t? ki?u dáng d?n màu s?c c?a các nhà thi?t k? tài hoa dã làm cho dôi giày phù h?p v?i m?i gi?i tính, m?i l?a tu?i, mix du?c v?i r?t nhi?u phong cách khác nhau', 2, 7)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (24, N'Giày Converse Đen ', N'https://cf.shopee.vn/file/d8ee2fdad42693e7b5262bf2ea3f984e', 200.0000, N'Converse đen real ', N'Phong cách trẻ trung năng động', 1, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (25, N'Giày Converse Vàng', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0oZIROh4gdCakZ3yM_fmXonH2geM_GrAerQ&usqp=CAU', 200.0000, N'Giày Converse Vằng', N'Phong cách trẻ trung, năng động', 4, 1)
SET IDENTITY_INSERT [dbo].[product] OFF
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_hoadon] FOREIGN KEY([BillID])
REFERENCES [dbo].[hoadon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_hoadon]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_product]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_Account] FOREIGN KEY([makh])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_Account]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [fk_product_cate] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [fk_product_cate]
GO
USE [master]
GO
ALTER DATABASE [QUANLIAOQUAN] SET  READ_WRITE 
GO
