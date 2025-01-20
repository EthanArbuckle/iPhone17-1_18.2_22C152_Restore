@interface CNUIImageProvider
+ (id)cacheKeyForImageResourceName:(id)a3 template:(BOOL)a4;
+ (id)imageForResource:(id)a3;
+ (id)imageForResource:(id)a3 template:(BOOL)a4;
+ (id)imageForResource:(id)a3 template:(BOOL)a4 onCacheMiss:(id)a5;
+ (id)uncachedImageForResource:(id)a3 template:(BOOL)a4;
@end

@implementation CNUIImageProvider

+ (id)imageForResource:(id)a3 template:(BOOL)a4 onCacheMiss:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v9 = [a1 cacheKeyForImageResourceName:a3 template:v5];
  if (imageForResource_template_onCacheMiss__cn_once_token_1 != -1) {
    dispatch_once(&imageForResource_template_onCacheMiss__cn_once_token_1, &__block_literal_global_76);
  }
  v10 = (void *)imageForResource_template_onCacheMiss__cn_once_object_1;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__CNUIImageProvider_imageForResource_template_onCacheMiss___block_invoke_2;
  v15[3] = &unk_264019628;
  id v16 = v8;
  id v11 = v8;
  id v12 = v10;
  v13 = [v12 objectForKey:v9 onCacheMiss:v15];

  return v13;
}

+ (id)cacheKeyForImageResourceName:(id)a3 template:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = v5;
  v7 = v5;
  if (v4)
  {
    v7 = [v5 stringByAppendingString:@"_template"];
  }
  return v7;
}

uint64_t __59__CNUIImageProvider_imageForResource_template_onCacheMiss___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__CNUIImageProvider_imageForResource_template_onCacheMiss___block_invoke()
{
  imageForResource_template_onCacheMiss__cn_once_object_1 = [MEMORY[0x263F33568] atomicCache];
  return MEMORY[0x270F9A758]();
}

+ (id)uncachedImageForResource:(id)a3 template:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  Class v6 = NSClassFromString(&cfstr_Uiimage.isa);
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [(objc_class *)v6 imageNamed:v5 inBundle:v7 compatibleWithTraitCollection:0];

  if (v4)
  {
    objc_opt_class();
    id v9 = v8;
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;

    id v8 = [v11 imageWithRenderingMode:2];
  }
  return v8;
}

+ (id)imageForResource:(id)a3
{
  return (id)[a1 imageForResource:a3 template:0];
}

+ (id)imageForResource:(id)a3 template:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__CNUIImageProvider_imageForResource_template___block_invoke;
  v10[3] = &unk_264019650;
  id v11 = v6;
  id v12 = a1;
  BOOL v13 = v4;
  id v7 = v6;
  id v8 = [a1 imageForResource:v7 template:v4 onCacheMiss:v10];

  return v8;
}

uint64_t __47__CNUIImageProvider_imageForResource_template___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) uncachedImageForResource:*(void *)(a1 + 32) template:*(unsigned __int8 *)(a1 + 48)];
}

@end