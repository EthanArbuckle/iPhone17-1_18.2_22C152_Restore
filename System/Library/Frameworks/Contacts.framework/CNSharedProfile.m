@interface CNSharedProfile
+ (id)log;
- (CGRect)cropRect;
- (CNContact)contact;
- (CNSharedProfile)initWithContact:(id)a3;
- (CNSharedProfile)initWithNickname:(id)a3;
- (CNSharedProfile)initWithRecentContactImage:(id)a3 recentPoster:(id)a4;
- (CNWallpaper)wallpaper;
- (NSData)imageData;
- (NSData)thumbnailImageData;
- (NSData)watchWallpaperImageData;
- (NSString)imageType;
- (id)imageTypeStringFromContactImage:(id)a3;
- (id)thumbnailImageDataFromImageData:(id)a3 cropRect:(CGRect)a4;
- (void)setCropRect:(CGRect)a3;
- (void)setImageData:(id)a3;
- (void)setImageType:(id)a3;
- (void)setThumbnailImageData:(id)a3;
- (void)setWallpaper:(id)a3;
- (void)setWatchWallpaperImageData:(id)a3;
@end

@implementation CNSharedProfile

+ (id)log
{
  if (log_cn_once_token_0_6 != -1) {
    dispatch_once(&log_cn_once_token_0_6, &__block_literal_global_89);
  }
  v2 = (void *)log_cn_once_object_0_6;

  return v2;
}

uint64_t __22__CNSharedProfile_log__block_invoke()
{
  log_cn_once_object_0_6 = (uint64_t)os_log_create("com.apple.contacts", "CNSharedProfile");

  return MEMORY[0x1F41817F8]();
}

- (CNSharedProfile)initWithNickname:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CNSharedProfile;
  v5 = [(CNSharedProfile *)&v28 init];
  if (v5)
  {
    v6 = [v4 avatar];
    uint64_t v7 = [v6 imageData];
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v7;

    v9 = [v4 avatar];
    uint64_t v10 = [v9 imageData];
    thumbnailImageData = v5->_thumbnailImageData;
    v5->_thumbnailImageData = (NSData *)v10;

    CGSize v12 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v5->_cropRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v5->_cropRect.size = v12;
    v13 = [CNWallpaper alloc];
    v14 = [v4 wallpaper];
    v15 = [v14 wallpaperData];
    v16 = [v4 wallpaper];
    v17 = -[CNWallpaper initWithPosterArchiveData:contentIsSensitive:](v13, "initWithPosterArchiveData:contentIsSensitive:", v15, [v16 contentIsSensitive]);

    v18 = [v4 wallpaper];
    v19 = [v18 metadata];

    if (v19)
    {
      uint64_t v20 = [(CNWallpaper *)v17 wallpaperIncludingIMWallpaperMetadata:v19];

      v17 = (CNWallpaper *)v20;
    }
    wallpaper = v5->_wallpaper;
    v5->_wallpaper = v17;
    v22 = v17;

    v23 = [v4 wallpaper];
    uint64_t v24 = [v23 lowResWallpaperData];
    watchWallpaperImageData = v5->_watchWallpaperImageData;
    v5->_watchWallpaperImageData = (NSData *)v24;

    v26 = v5;
  }

  return v5;
}

- (CNSharedProfile)initWithContact:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CNSharedProfile;
  v5 = [(CNSharedProfile *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 imageData];
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v6;

    uint64_t v8 = [v4 thumbnailImageData];
    thumbnailImageData = v5->_thumbnailImageData;
    v5->_thumbnailImageData = (NSData *)v8;

    [v4 cropRect];
    v5->_cropRect.origin.x = v10;
    v5->_cropRect.origin.y = v11;
    v5->_cropRect.size.width = v12;
    v5->_cropRect.size.height = v13;
    uint64_t v14 = [v4 imageType];
    imageType = v5->_imageType;
    v5->_imageType = (NSString *)v14;

    uint64_t v16 = [v4 wallpaper];
    wallpaper = v5->_wallpaper;
    v5->_wallpaper = (CNWallpaper *)v16;

    uint64_t v18 = [v4 watchWallpaperImageData];
    watchWallpaperImageData = v5->_watchWallpaperImageData;
    v5->_watchWallpaperImageData = (NSData *)v18;

    uint64_t v20 = v5;
  }

  return v5;
}

- (CNSharedProfile)initWithRecentContactImage:(id)a3 recentPoster:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)CNSharedProfile;
  uint64_t v8 = [(CNSharedProfile *)&v28 init];
  if (v8)
  {
    uint64_t v9 = [v6 imageData];
    imageData = v8->_imageData;
    v8->_imageData = (NSData *)v9;

    CGFloat v11 = [v6 imageData];
    [v6 cropRect];
    uint64_t v12 = -[CNSharedProfile thumbnailImageDataFromImageData:cropRect:](v8, "thumbnailImageDataFromImageData:cropRect:", v11);
    thumbnailImageData = v8->_thumbnailImageData;
    v8->_thumbnailImageData = (NSData *)v12;

    [v6 cropRect];
    v8->_cropRect.origin.x = v14;
    v8->_cropRect.origin.y = v15;
    v8->_cropRect.size.width = v16;
    v8->_cropRect.size.height = v17;
    uint64_t v18 = [(CNSharedProfile *)v8 imageTypeStringFromContactImage:v6];
    imageType = v8->_imageType;
    v8->_imageType = (NSString *)v18;

    uint64_t v20 = [CNWallpaper alloc];
    v21 = [v7 posterData];
    objc_super v22 = [(CNWallpaper *)v20 initWithPosterArchiveData:v21];

    wallpaper = v8->_wallpaper;
    v8->_wallpaper = v22;
    uint64_t v24 = v22;

    watchWallpaperImageData = v8->_watchWallpaperImageData;
    v8->_watchWallpaperImageData = 0;

    v26 = v8;
  }

  return v8;
}

- (id)imageTypeStringFromContactImage:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && (uint64_t v5 = [v3 source], (unint64_t)(v5 - 1) <= 3)) {
    id v6 = *off_1E56B7858[v5 - 1];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (NSData)thumbnailImageData
{
  thumbnailImageData = self->_thumbnailImageData;
  if (!thumbnailImageData)
  {
    id v4 = [(CNSharedProfile *)self imageData];
    [(CNSharedProfile *)self cropRect];
    -[CNSharedProfile thumbnailImageDataFromImageData:cropRect:](self, "thumbnailImageDataFromImageData:cropRect:", v4);
    uint64_t v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_thumbnailImageData;
    self->_thumbnailImageData = v5;

    thumbnailImageData = self->_thumbnailImageData;
  }
  id v7 = thumbnailImageData;

  return v7;
}

- (id)thumbnailImageDataFromImageData:(id)a3 cropRect:(CGRect)a4
{
  id v9 = 0;
  id v4 = CNImageUtilsCroppedImageDataFromFullSizeImageData(a3, &v9, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  id v5 = v9;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CNSharedProfile thumbnailImageDataFromImageData:cropRect:](v5, v7);
    }
  }

  return v4;
}

- (CNContact)contact
{
  id v3 = objc_alloc_init(CNMutableContact);
  [(CNMutableContact *)v3 setImageData:self->_imageData];
  [(CNMutableContact *)v3 setThumbnailImageData:self->_thumbnailImageData];
  -[CNMutableContact setCropRect:](v3, "setCropRect:", self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
  [(CNMutableContact *)v3 setWallpaper:self->_wallpaper];
  [(CNMutableContact *)v3 setImageType:self->_imageType];
  [(CNMutableContact *)v3 setWatchWallpaperImageData:self->_watchWallpaperImageData];

  return (CNContact *)v3;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (void)setThumbnailImageData:(id)a3
{
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
}

- (NSString)imageType
{
  return self->_imageType;
}

- (void)setImageType:(id)a3
{
}

- (CNWallpaper)wallpaper
{
  return self->_wallpaper;
}

- (void)setWallpaper:(id)a3
{
}

- (NSData)watchWallpaperImageData
{
  return self->_watchWallpaperImageData;
}

- (void)setWatchWallpaperImageData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchWallpaperImageData, 0);
  objc_storeStrong((id *)&self->_wallpaper, 0);
  objc_storeStrong((id *)&self->_imageType, 0);
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);

  objc_storeStrong((id *)&self->_imageData, 0);
}

- (void)thumbnailImageDataFromImageData:(void *)a1 cropRect:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 localizedDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Failed to generate thumbnailImageData, %@", (uint8_t *)&v4, 0xCu);
}

@end