@interface UIImagePickerController(AppleAccountUI)
+ (id)aaui_fixedCropRect:()AppleAccountUI forOriginalImage:;
@end

@implementation UIImagePickerController(AppleAccountUI)

+ (id)aaui_fixedCropRect:()AppleAccountUI forOriginalImage:
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  [v5 CGRectValue];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  if (v7 < 0.0)
  {
    v15 = _AAUILogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [NSNumber numberWithDouble:v8];
      int v39 = 138412546;
      v40 = v16;
      __int16 v41 = 2112;
      v42 = &unk_26BD70BF8;
      _os_log_impl(&dword_209754000, v15, OS_LOG_TYPE_DEFAULT, "aaui_fixedCropRect:forOriginalImage: fixing cropRect left %@ outside originalImage left %@", (uint8_t *)&v39, 0x16u);
    }
    double v12 = v12 + v8;
    double v8 = 0.0;
  }
  [v6 size];
  if (v12 + v8 > v17)
  {
    v18 = _AAUILogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [NSNumber numberWithDouble:v12 + v8];
      v20 = NSNumber;
      [v6 size];
      v21 = objc_msgSend(v20, "numberWithDouble:");
      int v39 = 138412546;
      v40 = v19;
      __int16 v41 = 2112;
      v42 = v21;
      _os_log_impl(&dword_209754000, v18, OS_LOG_TYPE_DEFAULT, "aaui_fixedCropRect:forOriginalImage: fixing cropRect right %@ outside originalImage right %@", (uint8_t *)&v39, 0x16u);
    }
    [v6 size];
    double v12 = v22 - v8;
  }
  if (v10 < 0.0)
  {
    v23 = _AAUILogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [NSNumber numberWithDouble:v10];
      int v39 = 138412546;
      v40 = v24;
      __int16 v41 = 2112;
      v42 = &unk_26BD70BF8;
      _os_log_impl(&dword_209754000, v23, OS_LOG_TYPE_DEFAULT, "aaui_fixedCropRect:forOriginalImage: fixing cropRect top %@ outside originalImage top %@", (uint8_t *)&v39, 0x16u);
    }
    double v14 = v14 + v10;
    double v10 = 0.0;
  }
  [v6 size];
  if (v14 + v10 > v25)
  {
    v26 = _AAUILogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [NSNumber numberWithDouble:v14 + v10];
      v28 = NSNumber;
      [v6 size];
      v30 = [v28 numberWithDouble:v29];
      int v39 = 138412546;
      v40 = v27;
      __int16 v41 = 2112;
      v42 = v30;
      _os_log_impl(&dword_209754000, v26, OS_LOG_TYPE_DEFAULT, "aaui_fixedCropRect:forOriginalImage: fixing cropRect bottom %@ outside originalImage bottom %@", (uint8_t *)&v39, 0x16u);
    }
    [v6 size];
    double v14 = v31 - v10;
  }
  [v5 CGRectValue];
  v46.origin.x = v32;
  v46.origin.y = v33;
  v46.size.width = v34;
  v46.size.height = v35;
  v45.origin.x = v8;
  v45.origin.y = v10;
  v45.size.width = v12;
  v45.size.height = v14;
  if (CGRectEqualToRect(v45, v46))
  {
    v36 = v5;
  }
  else
  {
    v36 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v8, v10, v12, v14);

    v37 = _AAUILogSystem();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = 138412290;
      v40 = v36;
      _os_log_impl(&dword_209754000, v37, OS_LOG_TYPE_DEFAULT, "aaui_fixedCropRect:forOriginalImage: returning fixed cropRect %@", (uint8_t *)&v39, 0xCu);
    }
  }
  return v36;
}

@end