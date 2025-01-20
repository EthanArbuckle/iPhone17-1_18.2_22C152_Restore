@interface UIImage
@end

@implementation UIImage

uint64_t __45__UIImage_AVAdditions___avkit_textImageCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)_avkit_textImageCache_AVMobileTextImageCache;
  _avkit_textImageCache_AVMobileTextImageCache = (uint64_t)v0;

  [(id)_avkit_textImageCache_AVMobileTextImageCache setCountLimit:10];
  v2 = (void *)_avkit_textImageCache_AVMobileTextImageCache;

  return [v2 setName:@"com.apple.avkit.UIKit_AVAdditions.AVMobileTextImageCache"];
}

void __48__UIImage_AVAdditions___avkit_imageLoadingQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.avkit.UIKit_AVAdditions.AVMobileImageLoadingQueue", v2);
  v1 = (void *)_avkit_imageLoadingQueue_AVMobileImageLoadingQueue;
  _avkit_imageLoadingQueue_AVMobileImageLoadingQueue = (uint64_t)v0;
}

void __79__UIImage_AVAdditions__avkit_imageWithSize_ofText_font_scaleFactor_completion___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1818], "_avkit_imageWithSize:ofText:font:scaleFactor:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__UIImage_AVAdditions__avkit_imageWithSize_ofText_font_scaleFactor_completion___block_invoke_2;
  v4[3] = &unk_1E5FC45E0;
  id v5 = *(id *)(a1 + 48);
  id v6 = v2;
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  id v3 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __79__UIImage_AVAdditions__avkit_imageWithSize_ofText_font_scaleFactor_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v2();
}

void __67__UIImage_AVAdditions__avkit_imageWithSymbolNamed_font_completion___block_invoke(uint64_t a1)
{
  v2 = +[AVImage imageWithConfiguration:*(void *)(a1 + 32)];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__UIImage_AVAdditions__avkit_imageWithSymbolNamed_font_completion___block_invoke_2;
  block[3] = &unk_1E5FC3890;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  id v8 = v3;
  uint64_t v12 = v4;
  id v9 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  id v10 = v2;
  id v11 = v5;
  id v6 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __67__UIImage_AVAdditions__avkit_imageWithSymbolNamed_font_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = objc_msgSend(*(id *)(a1 + 64), "avkit_loadedImageConfigurations");
    [v2 addObject:*(void *)(a1 + 40)];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v3();
}

void __52__UIImage_AVAdditions__avkit_imageNamed_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = AVBundle();
  uint64_t v4 = +[AVImage imageNamed:v2 inBundle:v3 compatibleWithTraitCollection:0];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__UIImage_AVAdditions__avkit_imageNamed_completion___block_invoke_3;
  block[3] = &unk_1E5FC3890;
  id v9 = v4;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v10 = v5;
  uint64_t v13 = v6;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  id v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __52__UIImage_AVAdditions__avkit_imageNamed_completion___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (*(void *)(a1 + 40))
    {
      uint64_t v2 = objc_msgSend(*(id *)(a1 + 64), "avkit_loadedImageConfigurations");
      [v2 addObject:*(void *)(a1 + 48)];
    }
    id v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 56);
    id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

void __52__UIImage_AVAdditions__avkit_imageNamed_completion___block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.avkit.images", v2);
  v1 = (void *)avkit_imageNamed_completion__imageQueue;
  avkit_imageNamed_completion__imageQueue = (uint64_t)v0;
}

void __61__UIImage_AVAdditions__avkit_flatWhiteResizableTemplateImage__block_invoke()
{
  id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", 1.0, 1.0);
  dispatch_queue_t v0 = [v4 imageWithActions:&__block_literal_global_127];
  v1 = objc_msgSend(v0, "resizableImageWithCapInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  uint64_t v2 = [v1 imageWithRenderingMode:2];
  id v3 = (void *)avkit_flatWhiteResizableTemplateImage_solidWhitePixelTemplateImage;
  avkit_flatWhiteResizableTemplateImage_solidWhitePixelTemplateImage = v2;
}

void __61__UIImage_AVAdditions__avkit_flatWhiteResizableTemplateImage__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB1618];
  id v4 = a2;
  id v3 = [v2 whiteColor];
  [v3 setFill];

  objc_msgSend(v4, "fillRect:", 0.0, 0.0, 1.0, 1.0);
}

uint64_t __55__UIImage_AVAdditions__avkit_loadedImageConfigurations__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v1 = avkit_loadedImageConfigurations_avkit_loadedImageConfigurations;
  avkit_loadedImageConfigurations_avkit_loadedImageConfigurations = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end