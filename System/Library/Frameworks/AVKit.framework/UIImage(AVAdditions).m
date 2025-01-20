@interface UIImage(AVAdditions)
+ (id)_avkit_imageLoadingQueue;
+ (id)_avkit_imageWithSize:()AVAdditions ofText:font:scaleFactor:;
+ (id)_avkit_textImageCache;
+ (id)avkit_flatWhiteResizableTemplateImage;
+ (id)avkit_imageWithSymbolNamed:()AVAdditions textStyle:scale:;
+ (id)avkit_loadedImageConfigurations;
+ (void)avkit_imageNamed:()AVAdditions completion:;
+ (void)avkit_imageWithSize:()AVAdditions ofText:font:scaleFactor:completion:;
+ (void)avkit_imageWithSymbolNamed:()AVAdditions font:completion:;
@end

@implementation UIImage(AVAdditions)

+ (id)_avkit_textImageCache
{
  if (_avkit_textImageCache_createTextImageCacheOnceToken != -1) {
    dispatch_once(&_avkit_textImageCache_createTextImageCacheOnceToken, &__block_literal_global_146);
  }
  v0 = (void *)_avkit_textImageCache_AVMobileTextImageCache;

  return v0;
}

+ (id)_avkit_imageLoadingQueue
{
  if (_avkit_imageLoadingQueue_createImageLoadingQueueOnceToken != -1) {
    dispatch_once(&_avkit_imageLoadingQueue_createImageLoadingQueueOnceToken, &__block_literal_global_143);
  }
  v0 = (void *)_avkit_imageLoadingQueue_AVMobileImageLoadingQueue;

  return v0;
}

+ (id)_avkit_imageWithSize:()AVAdditions ofText:font:scaleFactor:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  id v12 = a7;
  v13 = _AVLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v11;
    _os_log_impl(&dword_1B05B7000, v13, OS_LOG_TYPE_DEFAULT, "Rendering image with text: \"%@\"", buf, 0xCu);
  }

  [v12 pointSize];
  v15 = [v12 fontWithSize:v14 * a3];

  v16 = objc_msgSend(MEMORY[0x1E4FB1618], "whiteColor", *MEMORY[0x1E4FB06F8], *MEMORY[0x1E4FB0700], v15);
  v30[1] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:2];

  [v11 sizeWithAttributes:v17];
  CGFloat v19 = (a1 - v18) * 0.5;
  CGFloat v21 = (a2 - v20) * 0.5;
  v35.width = a1;
  v35.height = a2;
  UIGraphicsBeginImageContext(v35);
  objc_msgSend(v11, "drawAtPoint:withAttributes:", v17, v19, v21);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetShouldAntialias(CurrentContext, 1);
  v23 = UIGraphicsGetCurrentContext();
  CGContextSetAllowsAntialiasing(v23, 1);
  v24 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v25 = (void *)MEMORY[0x1E4FB1818];
  id v26 = v24;
  v27 = objc_msgSend(v25, "imageWithCGImage:scale:orientation:", objc_msgSend(v26, "CGImage"), objc_msgSend(v26, "imageOrientation"), a3);

  return v27;
}

+ (void)avkit_imageWithSize:()AVAdditions ofText:font:scaleFactor:completion:
{
  id v13 = a6;
  id v14 = a7;
  v15 = a8;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v16 = _AVLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B05B7000, v16, OS_LOG_TYPE_ERROR, "Error: -[UIImage avkit_imageFromString:font:completion:] called off of the main thread. The AVMobileTextImageCache should only be accessed on the main thread.", buf, 2u);
    }
  }
  v17 = [[AVMobileImageConfiguration alloc] initWithString:v13 font:v14];
  double v18 = objc_msgSend(MEMORY[0x1E4FB1818], "_avkit_textImageCache");
  CGFloat v19 = [v18 objectForKey:v17];
  if (v19)
  {
    v15[2](v15, v19);
  }
  else
  {
    double v20 = objc_msgSend(MEMORY[0x1E4FB1818], "_avkit_imageLoadingQueue");
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __79__UIImage_AVAdditions__avkit_imageWithSize_ofText_font_scaleFactor_completion___block_invoke;
    v21[3] = &unk_1E5FC38B8;
    double v27 = a1;
    double v28 = a2;
    id v22 = v13;
    id v23 = v14;
    double v29 = a3;
    id v24 = v18;
    v25 = v17;
    id v26 = v15;
    dispatch_async(v20, v21);
  }
}

+ (id)avkit_imageWithSymbolNamed:()AVAdditions textStyle:scale:
{
  v7 = (void *)MEMORY[0x1E4FB1830];
  id v8 = a3;
  v9 = [v7 configurationWithTextStyle:a4 scale:a5];
  v10 = [MEMORY[0x1E4FB1818] systemImageNamed:v8 withConfiguration:v9];

  return v10;
}

+ (void)avkit_imageWithSymbolNamed:()AVAdditions font:completion:
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(void, void))[a5 copy];
  if (v8 == @"gobackward.15" || v8 == @"goforward.15")
  {
    id v8 = v8;
    if (MapImageNameNumberAware_onceToken != -1) {
      dispatch_once(&MapImageNameNumberAware_onceToken, &__block_literal_global_201);
    }
    if ([(id)MapImageNameNumberAware_sDigitAwareSet containsObject:v8])
    {
      id v12 = [MEMORY[0x1E4F1CA20] currentLocale];
      id v13 = [v12 languageCode];

      if (([v13 isEqualToString:@"ar"] & 1) != 0
        || [v13 isEqualToString:@"hi"])
      {
        id v14 = [MEMORY[0x1E4F1CA20] currentLocale];
        v15 = [v14 numberingSystem];

        if ([v15 isEqualToString:@"latn"])
        {
          v16 = [(__CFString *)v8 stringByAppendingFormat:@".westernarabic"];
        }
        else
        {
          v16 = 0;
        }
      }
      else
      {
        v16 = 0;
      }
    }
    else
    {
      v16 = 0;
    }

    v17 = [MEMORY[0x1E4F1CA20] currentLocale];
    double v18 = [v17 languageCode];

    BOOL v11 = v16 != 0;
    if (v16)
    {
      CGFloat v19 = v16;
    }
    else
    {
      if (([v18 isEqualToString:@"ar"] & 1) == 0
        && ![v18 isEqualToString:@"hi"])
      {
        goto LABEL_22;
      }
      CGFloat v19 = [(__CFString *)v8 stringByAppendingFormat:@".%@", v18];
    }
    double v20 = v19;

    id v8 = v20;
LABEL_22:

    goto LABEL_23;
  }
  BOOL v11 = v8 == @"forward.end.fill.tv";
LABEL_23:
  CGFloat v21 = [[AVMobileImageConfiguration alloc] initWithImageName:v8 font:v9 imageContainedInBundle:v11];

  if ([MEMORY[0x1E4F29060] isMainThread]
    && v8
    && (objc_msgSend(a1, "avkit_loadedImageConfigurations"),
        id v22 = objc_claimAutoreleasedReturnValue(),
        int v23 = [v22 containsObject:v21],
        v22,
        v23))
  {
    id v24 = +[AVImage imageWithConfiguration:v21];
    ((void (**)(void, void *))v10)[2](v10, v24);
  }
  else if (v9 && v8)
  {
    v25 = objc_msgSend(MEMORY[0x1E4FB1818], "_avkit_imageLoadingQueue");
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__UIImage_AVAdditions__avkit_imageWithSymbolNamed_font_completion___block_invoke;
    block[3] = &unk_1E5FC3868;
    double v27 = v21;
    double v28 = v8;
    v30 = a1;
    double v29 = v10;
    dispatch_async(v25, block);
  }
}

+ (void)avkit_imageNamed:()AVAdditions completion:
{
  id v6 = a3;
  v7 = (void (**)(void, void))[a4 copy];
  id v8 = [[AVMobileImageConfiguration alloc] initWithImageName:v6 font:0 imageContainedInBundle:0];
  int v9 = [MEMORY[0x1E4F29060] isMainThread];
  if (v6 && v9)
  {
    v10 = objc_msgSend(a1, "avkit_loadedImageConfigurations");
    int v11 = [v10 containsObject:v8];

    if (v11)
    {
      id v12 = AVBundle();
      id v13 = +[AVImage imageNamed:v6 inBundle:v12 compatibleWithTraitCollection:0];
      ((void (**)(void, void *))v7)[2](v7, v13);

      goto LABEL_9;
    }
  }
  else if (!v6)
  {
    goto LABEL_9;
  }
  if (avkit_imageNamed_completion__onceToken != -1) {
    dispatch_once(&avkit_imageNamed_completion__onceToken, &__block_literal_global_133);
  }
  id v14 = avkit_imageNamed_completion__imageQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__UIImage_AVAdditions__avkit_imageNamed_completion___block_invoke_2;
  v15[3] = &unk_1E5FC3868;
  id v16 = v6;
  CGFloat v19 = a1;
  v17 = v8;
  double v18 = v7;
  dispatch_async(v14, v15);

LABEL_9:
}

+ (id)avkit_flatWhiteResizableTemplateImage
{
  if (avkit_flatWhiteResizableTemplateImage_onceToken != -1) {
    dispatch_once(&avkit_flatWhiteResizableTemplateImage_onceToken, &__block_literal_global_123);
  }
  v0 = (void *)avkit_flatWhiteResizableTemplateImage_solidWhitePixelTemplateImage;

  return v0;
}

+ (id)avkit_loadedImageConfigurations
{
  if (avkit_loadedImageConfigurations_onceToken != -1) {
    dispatch_once(&avkit_loadedImageConfigurations_onceToken, &__block_literal_global_17556);
  }
  v0 = (void *)avkit_loadedImageConfigurations_avkit_loadedImageConfigurations;

  return v0;
}

@end