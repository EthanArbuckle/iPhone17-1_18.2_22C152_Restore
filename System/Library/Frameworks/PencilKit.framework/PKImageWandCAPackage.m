@interface PKImageWandCAPackage
+ (BOOL)_loadCAPackageViewWithName:(void *)a3 completion:;
+ (BOOL)loadPackageViewsWithHandler:(uint64_t)a1;
@end

@implementation PKImageWandCAPackage

+ (BOOL)loadPackageViewsWithHandler:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  if (!v2)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  uint64_t v4 = v3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__PKImageWandCAPackage_loadPackageViewsWithHandler___block_invoke;
  v11[3] = &unk_1E64CBB08;
  id v5 = v2;
  id v12 = v5;
  if (+[PKImageWandCAPackage _loadCAPackageViewWithName:completion:](v4, @"Image-Wand-Animated-Light", v11))
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__PKImageWandCAPackage_loadPackageViewsWithHandler___block_invoke_2;
    v9[3] = &unk_1E64CBB08;
    id v10 = v5;
    BOOL v6 = +[PKImageWandCAPackage _loadCAPackageViewWithName:completion:](v4, @"Image-Wand-Animated-Dark", v9);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __52__PKImageWandCAPackage_loadPackageViewsWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)_loadCAPackageViewWithName:(void *)a3 completion:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a2;
  self;
  BOOL v6 = PencilKitBundle();
  v7 = [v6 URLForResource:v5 withExtension:@"ca"];

  id v8 = os_log_create("com.apple.pencilkit", "PKImageWandCAPackageView");
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v7 absoluteString];
      v11 = PencilKitBundle();
      *(_DWORD *)buf = 138412546;
      v20 = v10;
      __int16 v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEFAULT, "load ca asset: %@, bundle: %@", buf, 0x16u);
    }
    id v12 = (void *)MEMORY[0x1E4FB2018];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__PKImageWandCAPackage__loadCAPackageViewWithName_completion___block_invoke;
    v16[3] = &unk_1E64CBB30;
    v17 = v7;
    id v18 = v4;
    [v12 loadPackageViewWithContentsOfURL:v17 publishedObjectViewClassMap:0 completion:v16];

    v9 = v17;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v14 = [0 absoluteString];
      v15 = PencilKitBundle();
      *(_DWORD *)buf = 138412546;
      v20 = v14;
      __int16 v21 = 2112;
      v22 = v15;
      _os_log_error_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_ERROR, "ca asset not found: %@, bundle: %@", buf, 0x16u);
    }
  }

  return v7 != 0;
}

uint64_t __52__PKImageWandCAPackage_loadPackageViewsWithHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__PKImageWandCAPackage__loadCAPackageViewWithName_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  v7 = os_log_create("com.apple.pencilkit", "PKImageWandCAPackageView");
  id v8 = v7;
  if (!a2)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    v9 = [*(id *)(a1 + 32) absoluteString];
    id v10 = PencilKitBundle();
    v11 = [v5 localizedDescription];
    int v12 = 138412802;
    v13 = v9;
    __int16 v14 = 2112;
    v15 = v10;
    __int16 v16 = 2112;
    v17 = v11;
    _os_log_error_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_ERROR, "unable to load ca asset: %@, bundle: %@, error: %@", (uint8_t *)&v12, 0x20u);

    goto LABEL_4;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [*(id *)(a1 + 32) absoluteString];
    int v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEFAULT, "ca asset loaded: %@", (uint8_t *)&v12, 0xCu);
LABEL_4:
  }
LABEL_6:

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end