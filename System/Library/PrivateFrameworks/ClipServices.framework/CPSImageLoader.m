@interface CPSImageLoader
- (CPSImageDownloader)imageDownloader;
- (CPSImageLoader)init;
- (CPSImageStore)imageStore;
- (CPSMapsImageLoader)mapsImageLoader;
- (void)loadImageForGEOStyleAttributes:(id)a3 completionHandler:(id)a4;
- (void)loadImageForMapItemMUID:(unint64_t)a3 completionHandler:(id)a4;
- (void)loadImageWithURL:(id)a3 completionHandler:(id)a4;
- (void)setImageDownloader:(id)a3;
- (void)setImageStore:(id)a3;
- (void)setMapsImageLoader:(id)a3;
@end

@implementation CPSImageLoader

- (CPSImageLoader)init
{
  v11.receiver = self;
  v11.super_class = (Class)CPSImageLoader;
  v2 = [(CPSImageLoader *)&v11 init];
  if (v2)
  {
    v3 = objc_alloc_init(CPSImageDownloader);
    imageDownloader = v2->_imageDownloader;
    v2->_imageDownloader = v3;

    v5 = [[CPSMapsImageLoader alloc] initWithImageDownloader:v2->_imageDownloader];
    mapsImageLoader = v2->_mapsImageLoader;
    v2->_mapsImageLoader = v5;

    v7 = objc_alloc_init(CPSImageStore);
    imageStore = v2->_imageStore;
    v2->_imageStore = v7;

    v9 = v2;
  }

  return v2;
}

- (void)loadImageWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  v8 = [(CPSImageLoader *)self imageStore];
  id v16 = 0;
  v9 = [(id)objc_opt_class() keyForImageURL:v6 error:&v16];
  id v10 = v16;

  if (v10)
  {
    v7[2](v7, 0, v10);
  }
  else
  {
    objc_super v11 = [(CPSImageLoader *)self imageDownloader];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __53__CPSImageLoader_loadImageWithURL_completionHandler___block_invoke;
    v12[3] = &unk_26424F6C0;
    v15 = v7;
    v12[4] = self;
    id v13 = v9;
    id v14 = v6;
    [v11 downloadImageWithURL:v14 completionHandler:v12];
  }
}

void __53__CPSImageLoader_loadImageWithURL_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) imageStore];
    uint64_t v7 = *(void *)(a1 + 40);
    id v12 = 0;
    v8 = [v6 storeImageData:v5 forKey:v7 error:&v12];
    id v9 = v12;

    if (v9)
    {
      id v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __53__CPSImageLoader_loadImageWithURL_completionHandler___block_invoke_cold_1(a1, v10);
      }
      objc_super v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    else
    {
      objc_super v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    v11();
  }
}

- (void)loadImageForGEOStyleAttributes:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, id))a4;
  v8 = [(CPSImageLoader *)self imageStore];
  id v18 = 0;
  id v9 = [(id)objc_opt_class() keyForGEOStyleAttributes:v6 error:&v18];
  id v10 = v18;

  if (v10)
  {
    v7[2](v7, 0, v10);
  }
  else
  {
    objc_super v11 = [(CPSImageLoader *)self imageStore];
    id v12 = [v11 storedImageForKey:v9];

    if (v12)
    {
      ((void (**)(id, void *, id))v7)[2](v7, v12, 0);
    }
    else
    {
      id v13 = [(CPSImageLoader *)self mapsImageLoader];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __67__CPSImageLoader_loadImageForGEOStyleAttributes_completionHandler___block_invoke;
      v14[3] = &unk_26424F6C0;
      v17 = v7;
      v14[4] = self;
      id v15 = v9;
      id v16 = v6;
      [v13 loadImageForGEOStyleAttributes:v16 completionHandler:v14];
    }
  }
}

void __67__CPSImageLoader_loadImageForGEOStyleAttributes_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) imageStore];
    uint64_t v7 = *(void *)(a1 + 40);
    id v12 = 0;
    v8 = [v6 storeImageData:v5 forKey:v7 error:&v12];
    id v9 = v12;

    if (v9)
    {
      id v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __67__CPSImageLoader_loadImageForGEOStyleAttributes_completionHandler___block_invoke_cold_1(a1, v10);
      }
      objc_super v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    else
    {
      objc_super v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    v11();
  }
}

- (void)loadImageForMapItemMUID:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void, id))a4;
  uint64_t v7 = [(CPSImageLoader *)self imageStore];
  id v17 = 0;
  v8 = [(id)objc_opt_class() keyForPOIMuid:a3 error:&v17];
  id v9 = v17;

  if (v9)
  {
    v6[2](v6, 0, v9);
  }
  else
  {
    id v10 = [(CPSImageLoader *)self imageStore];
    objc_super v11 = [v10 storedImageForKey:v8];

    if (v11)
    {
      ((void (**)(id, void *, id))v6)[2](v6, v11, 0);
    }
    else
    {
      id v12 = [(CPSImageLoader *)self mapsImageLoader];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __60__CPSImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke;
      v13[3] = &unk_26424F6E8;
      id v15 = v6;
      v13[4] = self;
      id v14 = v8;
      unint64_t v16 = a3;
      [v12 loadImageForMapItemMUID:a3 completionHandler:v13];
    }
  }
}

void __60__CPSImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) imageStore];
    uint64_t v7 = *(void *)(a1 + 40);
    id v12 = 0;
    v8 = [v6 storeImageData:v5 forKey:v7 error:&v12];
    id v9 = v12;

    if (v9)
    {
      id v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __60__CPSImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke_cold_1(a1, v10);
      }
      objc_super v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      objc_super v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    v11();
  }
}

- (CPSImageDownloader)imageDownloader
{
  return self->_imageDownloader;
}

- (void)setImageDownloader:(id)a3
{
}

- (CPSMapsImageLoader)mapsImageLoader
{
  return self->_mapsImageLoader;
}

- (void)setMapsImageLoader:(id)a3
{
}

- (CPSImageStore)imageStore
{
  return self->_imageStore;
}

- (void)setImageStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageStore, 0);
  objc_storeStrong((id *)&self->_mapsImageLoader, 0);

  objc_storeStrong((id *)&self->_imageDownloader, 0);
}

void __53__CPSImageLoader_loadImageWithURL_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_msgSend(0, "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_3(&dword_21559C000, v4, v5, "Failed to store image for imageURL %{sensitive}@ - %{public}@", v6, v7, v8, v9, v10);
}

void __67__CPSImageLoader_loadImageForGEOStyleAttributes_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_msgSend(0, "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_3(&dword_21559C000, v4, v5, "Failed to store image for style attributes %@ - %{public}@", v6, v7, v8, v9, v10);
}

void __60__CPSImageLoader_loadImageForMapItemMUID_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_msgSend(0, "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_3(&dword_21559C000, v4, v5, "Failed to store image for map item with MUID %{private}llu - %{public}@", v6, v7, v8, v9, v10);
}

@end