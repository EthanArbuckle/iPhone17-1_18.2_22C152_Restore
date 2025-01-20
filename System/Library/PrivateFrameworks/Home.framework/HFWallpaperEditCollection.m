@interface HFWallpaperEditCollection
- (HFWallpaper)wallpaper;
- (HFWallpaperEditCollection)initWithWallpaper:(id)a3 originalImage:(id)a4 processedImage:(id)a5;
- (UIImage)originalImage;
- (UIImage)processedImage;
- (id)description;
@end

@implementation HFWallpaperEditCollection

- (HFWallpaperEditCollection)initWithWallpaper:(id)a3 originalImage:(id)a4 processedImage:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFWallpaperEditCollection;
  v12 = [(HFWallpaperEditCollection *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_wallpaper, a3);
    objc_storeStrong((id *)&v13->_originalImage, a4);
    objc_storeStrong((id *)&v13->_processedImage, a5);
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(HFWallpaperEditCollection *)self wallpaper];
  v7 = [v3 stringWithFormat:@"<%@: %p, wallpaper = %@>", v5, self, v6];

  return v7;
}

- (HFWallpaper)wallpaper
{
  return self->_wallpaper;
}

- (UIImage)originalImage
{
  return self->_originalImage;
}

- (UIImage)processedImage
{
  return self->_processedImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedImage, 0);
  objc_storeStrong((id *)&self->_originalImage, 0);
  objc_storeStrong((id *)&self->_wallpaper, 0);
}

@end