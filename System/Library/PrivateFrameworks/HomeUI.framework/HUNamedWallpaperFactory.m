@interface HUNamedWallpaperFactory
+ (id)_defaultBlackWallpaperImage;
+ (id)_gradientWallpaperImageForIdentifier:(id)a3;
- (id)allWallpaperThumbnailsForCollection:(int64_t)a3;
- (id)allWallpapersForCollection:(int64_t)a3;
- (id)defaultWallpaperForCollection:(int64_t)a3;
- (id)imageForWallpaper:(id)a3;
@end

@implementation HUNamedWallpaperFactory

- (id)allWallpapersForCollection:(int64_t)a3
{
  v11[9] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 > 1)
  {
    NSLog(&cfstr_UnknownCollect.isa, a2, a3);
    v8 = 0;
  }
  else
  {
    v11[0] = @"HUBaseColorLightBlue_Blur";
    v11[1] = @"HUBaseColorDarkBlue_Blur";
    v11[2] = @"HUBaseColorLightGreen_Blur";
    v11[3] = @"HUGradientColorGreen_Blur";
    v11[4] = @"HUBaseColorDarkGreen_Blur";
    v11[5] = @"HUGradientColorOrange_Blur";
    v11[6] = @"HUGradientColorBlue_Blur";
    v11[7] = @"HUBaseColorRed_Blur";
    v11[8] = @"HUBaseColorOrange_Blur";
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:9];
    v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_41);
    v5 = (void *)[v4 mutableCopy];

    v10[0] = @"HUSunrise";
    v10[1] = @"HUWildflowers";
    v10[2] = @"HUArchitectural";
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
    v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_100);
    v8 = (void *)[v7 mutableCopy];

    objc_msgSend(v8, "na_safeAddObjectsFromArray:", v5);
  }

  return v8;
}

id __54__HUNamedWallpaperFactory_allWallpapersForCollection___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F69778];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithType:4 assetIdentifier:v3 cropInfo:0];

  return v4;
}

id __54__HUNamedWallpaperFactory_allWallpapersForCollection___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F69778];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithType:5 assetIdentifier:v3 cropInfo:0];

  return v4;
}

- (id)allWallpaperThumbnailsForCollection:(int64_t)a3
{
  v11[9] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 > 1)
  {
    v8 = 0;
  }
  else
  {
    v11[0] = @"HUBaseColorLightBlue_Blur_Thumbnail";
    v11[1] = @"HUBaseColorDarkBlue_Blur_Thumbnail";
    v11[2] = @"HUBaseColorLightGreen_Blur_Thumbnail";
    v11[3] = @"HUGradientColorGreen_Blur_Thumbnail";
    v11[4] = @"HUBaseColorDarkGreen_Blur_Thumbnail";
    v11[5] = @"HUGradientColorOrange_Blur_Thumbnail";
    v11[6] = @"HUGradientColorBlue_Blur_Thumbnail";
    v11[7] = @"HUBaseColorRed_Blur_Thumbnail";
    v11[8] = @"HUBaseColorOrange_Blur_Thumbnail";
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:9];
    v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_105);
    v5 = (void *)[v4 mutableCopy];

    v10[0] = @"HUSunrise_Thumbnail";
    v10[1] = @"HUWildflowers_Thumbnail";
    v10[2] = @"HUArchitectural_Thumbnail";
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
    v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_107);
    v8 = (void *)[v7 mutableCopy];

    objc_msgSend(v8, "na_safeAddObjectsFromArray:", v5);
  }

  return v8;
}

id __63__HUNamedWallpaperFactory_allWallpaperThumbnailsForCollection___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F69778];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithType:4 assetIdentifier:v3 cropInfo:0];

  return v4;
}

id __63__HUNamedWallpaperFactory_allWallpaperThumbnailsForCollection___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F69778];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithType:5 assetIdentifier:v3 cropInfo:0];

  return v4;
}

- (id)defaultWallpaperForCollection:(int64_t)a3
{
  if ((unint64_t)a3 > 1)
  {
    NSLog(&cfstr_UnknownCollect.isa, a2, a3);
    id v3 = 0;
  }
  else
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F69778]) initWithType:5 assetIdentifier:@"HUSunrise" cropInfo:0];
  }

  return v3;
}

- (id)imageForWallpaper:(id)a3
{
  id v3 = a3;
  if ([v3 type] != 2
    || (v4 = objc_opt_class(),
        [v3 assetIdentifier],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v4 _gradientWallpaperImageForIdentifier:v5],
        v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    v7 = [v3 assetIdentifier];
    v6 = HUImageNamed(v7);

    if (!v6)
    {
      NSLog(&cfstr_UnableToFindNa.isa, v3);
      v6 = [(id)objc_opt_class() _defaultBlackWallpaperImage];
    }
  }

  return v6;
}

+ (id)_defaultBlackWallpaperImage
{
  if (_MergedGlobals_616 != -1) {
    dispatch_once(&_MergedGlobals_616, &__block_literal_global_113);
  }
  v2 = (void *)qword_1EBA477C8;

  return v2;
}

void __54__HUNamedWallpaperFactory__defaultBlackWallpaperImage__block_invoke()
{
  id v5 = [MEMORY[0x1E4F42D90] mainScreen];
  [v5 bounds];
  double Width = CGRectGetWidth(v8);
  [v5 bounds];
  double Height = CGRectGetHeight(v9);
  if (Width < Height) {
    double Width = Height;
  }
  v7.width = Width;
  v7.height = Width;
  UIGraphicsBeginImageContextWithOptions(v7, 1, 0.0);
  v2 = [MEMORY[0x1E4F428B8] systemBlackColor];
  [v2 setFill];

  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  v10.size.width = Width;
  v10.size.height = Width;
  UIRectFill(v10);
  uint64_t v3 = UIGraphicsGetImageFromCurrentImageContext();
  v4 = (void *)qword_1EBA477C8;
  qword_1EBA477C8 = v3;

  UIGraphicsEndImageContext();
}

+ (id)_gradientWallpaperImageForIdentifier:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F42D90] mainScreen];
  if ([MEMORY[0x1E4F69758] isAMac])
  {
    [v4 scale];
    double Width = 2880.0 / v5;
  }
  else
  {
    [v4 bounds];
    double Width = CGRectGetWidth(v27);
    [v4 bounds];
    double Height = CGRectGetHeight(v28);
    if (Width < Height) {
      double Width = Height;
    }
  }
  if ([v3 isEqualToString:@"HUGradientColorBlue"])
  {
    id v8 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.37254902 blue:1.0 alpha:1.0];
    v23[0] = [v8 CGColor];
    id v9 = [MEMORY[0x1E4F428B8] colorWithRed:0.42745098 green:0.843137255 blue:0.839215686 alpha:1.0];
    CGRect v10 = v23;
LABEL_11:
    v10[1] = [v9 CGColor];
    CFArrayRef v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];

    [v4 scale];
    CGFloat v13 = v12;
    v25.width = 1.0;
    v25.height = Width;
    UIGraphicsBeginImageContextWithOptions(v25, 1, v13);
    CurrentContext = UIGraphicsGetCurrentContext();
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    long long v20 = xmmword_1BEA165B0;
    v16 = CGGradientCreateWithColors(DeviceRGB, v11, (const CGFloat *)&v20);
    v26.x = 0.0;
    v26.y = Width;
    CGContextDrawLinearGradient(CurrentContext, v16, *MEMORY[0x1E4F1DAD8], v26, 0);
    v17 = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(v16);
    CGColorSpaceRelease(DeviceRGB);
    UIGraphicsEndImageContext();

    goto LABEL_12;
  }
  if ([v3 isEqualToString:@"HUGradientColorOrange"])
  {
    id v8 = [MEMORY[0x1E4F428B8] colorWithRed:0.992156863 green:0.580392157 blue:0.0196078431 alpha:1.0];
    uint64_t v22 = [v8 CGColor];
    id v9 = [MEMORY[0x1E4F428B8] colorWithRed:1.0 green:0.921568627 blue:0.439215686 alpha:1.0];
    CGRect v10 = &v22;
    goto LABEL_11;
  }
  if ([v3 isEqualToString:@"HUGradientColorGreen"])
  {
    id v8 = [MEMORY[0x1E4F428B8] colorWithRed:0.176470588 green:0.729411765 blue:0.270588235 alpha:1.0];
    uint64_t v21 = [v8 CGColor];
    id v9 = [MEMORY[0x1E4F428B8] colorWithRed:0.725490196 green:0.811764706 blue:0.392156863 alpha:1.0];
    CGRect v10 = &v21;
    goto LABEL_11;
  }
  v19 = HFLogForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v20) = 138412290;
    *(void *)((char *)&v20 + 4) = v3;
    _os_log_error_impl(&dword_1BE345000, v19, OS_LOG_TYPE_ERROR, "Unknown identifier specified: %@, defaulting to black", (uint8_t *)&v20, 0xCu);
  }

  v17 = [(id)objc_opt_class() _defaultBlackWallpaperImage];
LABEL_12:

  return v17;
}

@end