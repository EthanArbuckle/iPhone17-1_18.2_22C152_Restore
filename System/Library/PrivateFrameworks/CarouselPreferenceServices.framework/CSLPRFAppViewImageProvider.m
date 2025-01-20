@interface CSLPRFAppViewImageProvider
- (void)retrieveImageForLauncherViewMode:(int64_t)a3 size:(CGSize)a4 completion:(id)a5;
@end

@implementation CSLPRFAppViewImageProvider

- (void)retrieveImageForLauncherViewMode:(int64_t)a3 size:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a5;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    v18.double width = width;
    v18.double height = height;
    v9 = NSStringFromCGSize(v18);
    *(_DWORD *)buf = 138412290;
    v16 = v9;
    _os_log_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, ">>>> calling getAppViewListImage %@", buf, 0xCu);
  }
  v10 = [MEMORY[0x263F57788] sharedInstance];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __79__CSLPRFAppViewImageProvider_retrieveImageForLauncherViewMode_size_completion___block_invoke;
  v12[3] = &unk_264A0B268;
  id v13 = v8;
  int64_t v14 = a3;
  id v11 = v8;
  objc_msgSend(v10, "getAppViewListImage:completion:", v12, width, height);
}

void __79__CSLPRFAppViewImageProvider_retrieveImageForLauncherViewMode_size_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_error_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_ERROR, ">>>> could not get app view list image %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)MEMORY[0x230FB9060](*(void *)(a1 + 32));
    *(_DWORD *)buf = 138412546;
    id v16 = v5;
    __int16 v17 = 2112;
    CGSize v18 = v7;
    _os_log_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_INFO, ">>>> got image %@, calling %@", buf, 0x16u);
  }
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__CSLPRFAppViewImageProvider_retrieveImageForLauncherViewMode_size_completion___block_invoke_1;
    block[3] = &unk_264A0B240;
    id v13 = v8;
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 40);
    id v12 = v9;
    uint64_t v14 = v10;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __79__CSLPRFAppViewImageProvider_retrieveImageForLauncherViewMode_size_completion___block_invoke_1(void *a1)
{
  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[6];
  return +[CSLPRFAppViewImageCache storeImage:v2 forLauncherMode:v3];
}

@end