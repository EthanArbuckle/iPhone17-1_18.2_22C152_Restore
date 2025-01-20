@interface GKNetworkImageSource
- (BOOL)imageNeedsRefresh:(id)a3;
- (NSMutableDictionary)loadingGroups;
- (void)loadAndCacheAvatarFromGamedForURLString:(id)a3 useUIImage:(BOOL)a4 cacheSubdirectory:(id)a5 reference:(id)a6 queue:(id)a7 handler:(id)a8;
- (void)loadImageForURLString:(id)a3 loader:(id)a4 reference:(id)a5 queue:(id)a6 handler:(id)a7;
- (void)loadImageForURLString:(id)a3 reference:(id)a4 queue:(id)a5 handler:(id)a6;
- (void)setLoadingGroups:(id)a3;
@end

@implementation GKNetworkImageSource

- (BOOL)imageNeedsRefresh:(id)a3
{
  id v4 = a3;
  id v5 = [(GKImageSource *)self renderedDefaultImage];

  return v5 == v4;
}

- (void)loadImageForURLString:(id)a3 reference:(id)a4 queue:(id)a5 handler:(id)a6
{
  id v10 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __70__GKNetworkImageSource_loadImageForURLString_reference_queue_handler___block_invoke;
  v12[3] = &unk_26478A650;
  id v13 = v10;
  v14 = self;
  id v11 = v10;
  [(GKNetworkImageSource *)self loadImageForURLString:v11 loader:v12 reference:a4 queue:a5 handler:a6];
}

void __70__GKNetworkImageSource_loadImageForURLString_reference_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F1C6B0];
  id v5 = [NSURL URLWithString:*(void *)(a1 + 32)];
  v6 = [(id)objc_opt_class() syncQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__GKNetworkImageSource_loadImageForURLString_reference_queue_handler___block_invoke_2;
  v8[3] = &unk_26478A628;
  id v9 = v3;
  id v7 = v3;
  [v4 _gkloadRemoteImageForURL:v5 queue:v6 withCompletionHandler:v8];
}

uint64_t __70__GKNetworkImageSource_loadImageForURLString_reference_queue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadAndCacheAvatarFromGamedForURLString:(id)a3 useUIImage:(BOOL)a4 cacheSubdirectory:(id)a5 reference:(id)a6 queue:(id)a7 handler:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (!v17)
  {
    id v17 = (id)MEMORY[0x263EF83A0];
    id v19 = MEMORY[0x263EF83A0];
  }
  v20 = (void *)MEMORY[0x263F401C0];
  v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKImageSource.m", 705, "-[GKNetworkImageSource loadAndCacheAvatarFromGamedForURLString:useUIImage:cacheSubdirectory:reference:queue:handler:]");
  v22 = [v20 dispatchGroupWithName:v21];

  if (v14)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke;
    v27[3] = &unk_26478A718;
    v27[4] = self;
    id v28 = v15;
    BOOL v31 = a4;
    id v29 = v22;
    id v30 = v14;
    [v29 perform:v27];
  }
  if (v18)
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_2_259;
    v23[3] = &unk_26478A740;
    id v26 = v18;
    id v24 = v22;
    id v25 = v16;
    [v24 notifyOnQueue:v17 block:v23];
  }
}

void __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class() syncQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_2;
  v7[3] = &unk_26478A6F0;
  id v5 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  char v12 = *(unsigned char *)(a1 + 64);
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v11 = v3;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) keyForImageIdentifier:*(void *)(a1 + 40)];
  id v3 = [v2 cacheKey];
  id v35 = v3;
  id v4 = [*(id *)(a1 + 32) cache];
  id v5 = [v4 objectForKey:v3];

  if (v5)
  {
    [v5 prepareForUsingUIImage:*(unsigned __int8 *)(a1 + 72)];
    [*(id *)(a1 + 48) setResult:v5];
    id v6 = (NSObject **)MEMORY[0x263F40328];
    id v7 = *MEMORY[0x263F40328];
    if (!*MEMORY[0x263F40328])
    {
      id v8 = (id)GKOSLoggers();
      id v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_2_cold_2();
    }
  }
  else
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_252;
    v27[3] = &unk_26478A6C8;
    id v28 = *(id *)(a1 + 48);
    id v29 = *(id *)(a1 + 56);
    id v30 = *(id *)(a1 + 40);
    id v12 = v2;
    char v34 = *(unsigned char *)(a1 + 72);
    uint64_t v13 = *(void *)(a1 + 32);
    id v31 = v12;
    uint64_t v32 = v13;
    id v14 = v3;
    id v33 = v14;
    id v15 = (void (**)(void))MEMORY[0x22A644A10](v27);
    id v16 = [*(id *)(a1 + 32) loadingGroups];

    if (v16)
    {
      id v17 = [*(id *)(a1 + 32) loadingGroups];
      id v18 = [v17 objectForKeyedSubscript:v14];

      if (v18)
      {
        if (!*MEMORY[0x263F40328]) {
          id v19 = (id)GKOSLoggers();
        }
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40308], OS_LOG_TYPE_DEBUG)) {
          __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_2_cold_1();
        }
        v20 = *(void **)(a1 + 48);
        v21 = [(id)objc_opt_class() syncQueue];
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_258;
        v24[3] = &unk_26478A2E8;
        id v25 = *(id *)(a1 + 48);
        id v26 = v18;
        [v20 join:v26 queue:v21 block:v24];
      }
      else
      {
        v23 = [*(id *)(a1 + 32) loadingGroups];
        [v23 setObject:*(void *)(a1 + 48) forKeyedSubscript:v14];

        v15[2](v15);
      }
    }
    else
    {
      v22 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithObjects:a1 + 48 forKeys:&v35 count:1];
      [*(id *)(a1 + 32) setLoadingGroups:v22];

      v15[2](v15);
    }
  }
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v9, v10, v11);
}

void __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_252(uint64_t a1)
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_2_253;
  v6[3] = &unk_26478A6A0;
  v2 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  char v13 = *(unsigned char *)(a1 + 80);
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 64);
  id v5 = *(void **)(a1 + 72);
  id v10 = v3;
  uint64_t v11 = v4;
  id v12 = v5;
  [v2 perform:v6];
}

void __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_2_253(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [NSURL URLWithString:*(void *)(a1 + 32)];
  id v5 = [MEMORY[0x263F401B0] daemonProxy];
  id v6 = [v5 utilityService];
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = [*(id *)(a1 + 48) basename];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_3;
  v13[3] = &unk_26478A678;
  char v19 = *(unsigned char *)(a1 + 80);
  id v9 = *(id *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(void **)(a1 + 72);
  id v14 = v9;
  uint64_t v15 = v10;
  id v16 = v11;
  id v17 = *(id *)(a1 + 32);
  id v18 = v3;
  id v12 = v3;
  [v6 requestImageDataForURL:v4 subdirectory:v7 fileName:v8 handler:v13];
}

void __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 length])
  {
    uint64_t v4 = [[GKAvatarImage alloc] initWithPNGData:v3 useUIImage:*(unsigned __int8 *)(a1 + 72)];
    [*(id *)(a1 + 32) setResult:v4];
    id v5 = [*(id *)(a1 + 40) cache];
    [v5 setObject:v4 forKey:*(void *)(a1 + 48)];

    id v6 = (NSObject **)MEMORY[0x263F40328];
    uint64_t v7 = *MEMORY[0x263F40328];
    if (!*MEMORY[0x263F40328])
    {
      id v8 = (id)GKOSLoggers();
      uint64_t v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_3_cold_2();
    }
  }
  else
  {
    if (!*MEMORY[0x263F40328]) {
      id v9 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40320], OS_LOG_TYPE_ERROR)) {
      __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_3_cold_1();
    }
  }
  uint64_t v10 = [*(id *)(a1 + 40) loadingGroups];
  [v10 removeObjectForKey:*(void *)(a1 + 48)];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_258(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) result];
  [*(id *)(a1 + 32) setResult:v2];
}

void __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_2_259(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) result];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

- (void)loadImageForURLString:(id)a3 loader:(id)a4 reference:(id)a5 queue:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v15)
  {
    id v15 = (id)MEMORY[0x263EF83A0];
    id v17 = MEMORY[0x263EF83A0];
  }
  id v18 = (void *)MEMORY[0x263F401C0];
  char v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKImageSource.m", 788, "-[GKNetworkImageSource loadImageForURLString:loader:reference:queue:handler:]");
  v20 = [v18 dispatchGroupWithName:v19];

  if ([(GKImageSource *)self shouldUseTestImage])
  {
    if (v16)
    {
      v21 = [(GKImageSource *)self renderedTestImage];
      [v20 setResult:v21];

LABEL_9:
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_2_261;
      v22[3] = &unk_26478A740;
      id v25 = v16;
      id v23 = v20;
      id v24 = v14;
      [v23 notifyOnQueue:v15 block:v22];
    }
  }
  else
  {
    if (v12)
    {
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke;
      v26[3] = &unk_26478A808;
      v26[4] = self;
      id v27 = v12;
      id v28 = v20;
      id v29 = v13;
      [v28 perform:v26];
    }
    if (v16) {
      goto LABEL_9;
    }
  }
}

void __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() syncQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_2;
  block[3] = &unk_26478A7E0;
  id v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v11 = v3;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cachedImageForIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    [*(id *)(a1 + 48) setResult:v2];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) keyForImageIdentifier:*(void *)(a1 + 40)];
    id v29 = [v6 cacheKey];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_3;
    v23[3] = &unk_26478A7B8;
    id v24 = *(id *)(a1 + 48);
    id v7 = *(id *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    id v28 = v7;
    uint64_t v25 = v8;
    id v26 = v9;
    id v10 = v29;
    id v27 = v10;
    id v11 = (void (**)(void))MEMORY[0x22A644A10](v23);
    id v12 = [*(id *)(a1 + 32) loadingGroups];

    if (v12)
    {
      id v13 = [*(id *)(a1 + 32) loadingGroups];
      id v14 = [v13 objectForKeyedSubscript:v10];

      if (v14)
      {
        if (!*MEMORY[0x263F40328]) {
          id v15 = (id)GKOSLoggers();
        }
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40308], OS_LOG_TYPE_DEBUG)) {
          __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_2_cold_1();
        }
        id v16 = *(void **)(a1 + 48);
        id v17 = [(id)objc_opt_class() syncQueue];
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_260;
        v20[3] = &unk_26478A2E8;
        id v21 = *(id *)(a1 + 48);
        id v22 = v14;
        [v16 join:v22 queue:v17 block:v20];
      }
      else
      {
        char v19 = [*(id *)(a1 + 32) loadingGroups];
        [v19 setObject:*(void *)(a1 + 48) forKeyedSubscript:v10];

        v11[2](v11);
      }
    }
    else
    {
      id v18 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithObjects:a1 + 48 forKeys:&v29 count:1];
      [*(id *)(a1 + 32) setLoadingGroups:v18];

      v11[2](v11);
    }
  }
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v3, v4, v5);
}

void __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_4;
  v6[3] = &unk_26478A790;
  id v3 = *(id *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 48);
  id v10 = v3;
  void v6[4] = v4;
  id v7 = v5;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 56);
  [v2 perform:v6];
}

void __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 64);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_5;
  v8[3] = &unk_26478A768;
  uint64_t v5 = *(void **)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v12 = v3;
  id v6 = *(void (**)(uint64_t, void *))(v4 + 16);
  id v7 = v3;
  v6(v4, v8);
}

void __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) processAndCacheImage:v3 forIdentifier:*(void *)(a1 + 40)];
  }
  else
  {
    if (!*MEMORY[0x263F40328]) {
      id v5 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40308], OS_LOG_TYPE_DEBUG)) {
      __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_5_cold_1();
    }
    uint64_t v4 = [*(id *)(a1 + 32) renderedDefaultImage];
  }
  id v6 = (void *)v4;
  [*(id *)(a1 + 48) setResult:v4];
  id v7 = [*(id *)(a1 + 32) loadingGroups];
  [v7 removeObjectForKey:*(void *)(a1 + 56)];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_260(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) result];
  [*(id *)(a1 + 32) setResult:v2];
}

void __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_2_261(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) result];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

- (NSMutableDictionary)loadingGroups
{
  return self->_loadingGroups;
}

- (void)setLoadingGroups:(id)a3
{
}

- (void).cxx_destruct
{
}

void __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_22600C000, v0, v1, "Queuing duplicate avatar image load request:%@", v2, v3, v4, v5, v6);
}

void __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_22600C000, v0, v1, "Avatar image representation found in in-memory cache for: %@", v2, v3, v4, v5, v6);
}

void __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_3_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_22600C000, v1, OS_LOG_TYPE_ERROR, "Failed to load avatar image from gamed: %@\ncache key: %@", v2, 0x16u);
}

void __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_22600C000, v0, v1, "Loaded avatar image from gamed %@", v2, v3, v4, v5, v6);
}

void __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_22600C000, v0, v1, "Queuing duplicate image load request:%@", v2, v3, v4, v5, v6);
}

void __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_22600C000, v0, v1, "no image received for identifier:%@", v2, v3, v4, v5, v6);
}

@end