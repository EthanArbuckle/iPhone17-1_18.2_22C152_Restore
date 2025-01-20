@interface AVTIconImageProvider
+ (void)iconImageForBundleIdentifier:(id)a3 size:(CGSize)a4 scale:(double)a5 completionBlock:(id)a6;
+ (void)prewarmIconImageForBundleIdentifier:(id)a3 size:(CGSize)a4 scale:(double)a5;
@end

@implementation AVTIconImageProvider

+ (void)prewarmIconImageForBundleIdentifier:(id)a3 size:(CGSize)a4 scale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  v13[1] = *MEMORY[0x263EF8340];
  v8 = (objc_class *)MEMORY[0x263F4B558];
  id v9 = a3;
  v10 = objc_msgSend([v8 alloc], "initWithSize:scale:", width, height, a5);
  v11 = (void *)[objc_alloc(MEMORY[0x263F4B540]) initWithBundleIdentifier:v9];

  v13[0] = v10;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [v11 prepareImagesForImageDescriptors:v12];
}

+ (void)iconImageForBundleIdentifier:(id)a3 size:(CGSize)a4 scale:(double)a5 completionBlock:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a6;
  v11 = (objc_class *)MEMORY[0x263F4B558];
  id v12 = a3;
  v13 = objc_msgSend([v11 alloc], "initWithSize:scale:", width, height, a5);
  v14 = (void *)[objc_alloc(MEMORY[0x263F4B540]) initWithBundleIdentifier:v12];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __80__AVTIconImageProvider_iconImageForBundleIdentifier_size_scale_completionBlock___block_invoke;
  v16[3] = &unk_263FF2940;
  id v17 = v10;
  id v15 = v10;
  [v14 getCGImageForImageDescriptor:v13 completion:v16];
}

void __80__AVTIconImageProvider_iconImageForBundleIdentifier_size_scale_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x263F1C6B0] imageWithCGImage:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

@end