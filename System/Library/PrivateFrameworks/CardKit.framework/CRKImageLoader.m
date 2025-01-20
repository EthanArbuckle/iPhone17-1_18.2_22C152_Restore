@interface CRKImageLoader
@end

@implementation CRKImageLoader

uint64_t __53___CRKImageLoader_sharedInstanceWithInitialDelegate___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(_CRKImageLoader);
  v3 = (void *)sharedInstanceWithInitialDelegate__sImageLoader;
  sharedInstanceWithInitialDelegate__sImageLoader = (uint64_t)v2;

  v4 = (void *)sharedInstanceWithInitialDelegate__sImageLoader;
  uint64_t v5 = *(void *)(a1 + 32);

  return [v4 setDelegate:v5];
}

void __51___CRKImageLoader_loadImage_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = (void *)MEMORY[0x263F678C8];
  id v6 = a3;
  id v8 = [a2 _imageData];
  v7 = [v5 imageWithData:v8];
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v7, v6);
}

void __49___CRKImageLoader__loadSFImageForURL_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v23[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 statusCode];
  if (v7)
  {
    v11 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      _os_log_impl(&dword_224F73000, v11, OS_LOG_TYPE_INFO, "Image fetch success statusCode:%ld URL:%@", buf, 0x16u);
    }
    uint64_t v13 = *(void *)(a1 + 40);
    v14 = [MEMORY[0x263F678C8] imageWithData:v7];
    (*(void (**)(uint64_t, void *, void))(v13 + 16))(v13, v14, 0);
  }
  else
  {
    if (v8)
    {
      v22 = @"NSURLResponse";
      v23[0] = v8;
      v14 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    }
    else
    {
      v14 = 0;
    }
    v15 = (void *)MEMORY[0x263F31670];
    v16 = [NSString stringWithFormat:@"Image fetch failed statusCode:%zd URL:%@", v10, *(void *)(a1 + 32)];
    v17 = [v15 errorWithCode:204 description:v16 underlyingError:v9 userInfo:v14];

    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      -[_CRKImageLoader loadImage:withCompletionHandler:]();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

@end