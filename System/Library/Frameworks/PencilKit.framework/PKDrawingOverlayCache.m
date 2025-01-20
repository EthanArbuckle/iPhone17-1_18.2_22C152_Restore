@interface PKDrawingOverlayCache
+ (id)sharedCache;
- (PKDrawingOverlayCache)init;
- (id)cacheDirectory;
- (id)cachePathForDrawingUUID:(uint64_t)a1;
- (void)clearMemoryCache;
- (void)overlayDrawingForDrawingUUID:(id)a3 tintColor:(id)a4 completion:(id)a5;
- (void)setOverlayDrawing:(void *)a3 forDrawingUUID:;
@end

@implementation PKDrawingOverlayCache

+ (id)sharedCache
{
  if (_MergedGlobals_141 != -1) {
    dispatch_once(&_MergedGlobals_141, &__block_literal_global_54);
  }
  v2 = (void *)qword_1EB3C6018;

  return v2;
}

void __36__PKDrawingOverlayCache_sharedCache__block_invoke()
{
  v0 = objc_alloc_init(PKDrawingOverlayCache);
  v1 = (void *)qword_1EB3C6018;
  qword_1EB3C6018 = (uint64_t)v0;
}

- (PKDrawingOverlayCache)init
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)PKDrawingOverlayCache;
  v2 = [(PKDrawingOverlayCache *)&v19 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.pencilkit.overlaydrawingqueue", v4);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v5;

    v7 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    memoryCache = v2->_memoryCache;
    v2->_memoryCache = v7;

    [(NSCache *)v2->_memoryCache setCountLimit:4];
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    v10 = -[PKDrawingOverlayCache cacheDirectory]();
    id v18 = 0;
    char v11 = [v9 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:&v18];
    id v12 = v18;

    os_log_t v13 = os_log_create("com.apple.pencilkit", "Math");
    v14 = v13;
    if (v11)
    {
      v15 = v13;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = -[PKDrawingOverlayCache cacheDirectory]();
        *(_DWORD *)buf = 138412290;
        v21 = v16;
        _os_log_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_DEFAULT, "Create drawing overlay cache directory at: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C44F8000, v14, OS_LOG_TYPE_ERROR, "Error creating cache directory", buf, 2u);
    }
  }
  return v2;
}

- (id)cacheDirectory
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v0 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v1 = [v0 firstObject];

  v2 = (void *)MEMORY[0x1E4F1CB10];
  v6[0] = v1;
  v6[1] = @"com.apple.pencilkit.overlaydrawings";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  v4 = [v2 fileURLWithPathComponents:v3];

  return v4;
}

- (id)cachePathForDrawingUUID:(uint64_t)a1
{
  v10[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [a2 uniqueCacheFilePath];
    v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v4 = [v3 firstObject];

    dispatch_queue_t v5 = 0;
    if (v4 && v2)
    {
      v6 = [v2 stringByAppendingPathExtension:@".drawing"];
      v7 = (void *)MEMORY[0x1E4F1CB10];
      v10[0] = v4;
      v10[1] = @"com.apple.pencilkit.overlaydrawings";
      v10[2] = v6;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
      dispatch_queue_t v5 = [v7 fileURLWithPathComponents:v8];
    }
  }
  else
  {
    dispatch_queue_t v5 = 0;
  }

  return v5;
}

- (void)overlayDrawingForDrawingUUID:(id)a3 tintColor:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  char v11 = [v10 uniqueCacheFilePath];
  id v12 = -[PKDrawingOverlayCache cachePathForDrawingUUID:]((uint64_t)self, v10);
  os_log_t v13 = [v12 path];
  v14 = [v10 AES128Key];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PKDrawingOverlayCache_overlayDrawingForDrawingUUID_tintColor_completion___block_invoke;
  block[3] = &unk_1E64C9258;
  block[4] = self;
  id v23 = v11;
  id v24 = v13;
  id v25 = v12;
  id v26 = v14;
  id v27 = v8;
  id v28 = v9;
  id v16 = v9;
  id v17 = v8;
  id v18 = v14;
  id v19 = v12;
  id v20 = v13;
  id v21 = v11;
  dispatch_async(accessQueue, block);
}

void __75__PKDrawingOverlayCache_overlayDrawingForDrawingUUID_tintColor_completion___block_invoke(void *a1)
{
  v1 = a1;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  if (v2) {
    v3 = *(void **)(v2 + 8);
  }
  else {
    v3 = 0;
  }
  v4 = [v3 objectForKey:v1[5]];
  if (!v4)
  {
    if (!v1[6]
      || ([MEMORY[0x1E4F28CB8] defaultManager],
          id v21 = objc_claimAutoreleasedReturnValue(),
          int v22 = [v21 fileExistsAtPath:v1[6]],
          v21,
          !v22))
    {
      v4 = 0;
      goto LABEL_24;
    }
    id v23 = (void *)v1[7];
    id v24 = (void *)v1[8];
    id v39 = 0;
    id v25 = +[PKDataEncryption decryptFile:key:error:]((uint64_t)PKDataEncryption, v23, v24, (uint64_t)&v39);
    id v26 = v39;
    if (v25)
    {
      v4 = [[PKDrawingConcrete alloc] initWithData:v25 error:0];
      id v27 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = v1[5];
        uint64_t v29 = [v25 length];
        v30 = [(PKDrawing *)v4 strokes];
        uint64_t v31 = [v30 count];
        *(_DWORD *)buf = 138412802;
        uint64_t v42 = v28;
        __int16 v43 = 2048;
        uint64_t v44 = v29;
        __int16 v45 = 2048;
        uint64_t v46 = v31;
        _os_log_impl(&dword_1C44F8000, v27, OS_LOG_TYPE_DEFAULT, "Loaded overlay cache for: %@ (%lu) => %lu", buf, 0x20u);
      }
    }
    else
    {
      id v27 = os_log_create("com.apple.pencilkit", "Math");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = v1[5];
        *(_DWORD *)buf = 138412546;
        uint64_t v42 = v32;
        __int16 v43 = 2112;
        uint64_t v44 = (uint64_t)v26;
        _os_log_impl(&dword_1C44F8000, v27, OS_LOG_TYPE_DEFAULT, "Failed to load overlay cache for: %@ %@", buf, 0x16u);
      }
      v4 = 0;
    }
  }
  if (v1[9] && v4)
  {
    dispatch_queue_t v5 = (void *)MEMORY[0x1E4F1CA48];
    v6 = [(PKDrawing *)v4 strokes];
    v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v8 = v4;
    id obj = [(PKDrawing *)v4 strokes];
    uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(obj);
          }
          os_log_t v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          v14 = [v13 ink];
          v15 = v1;
          id v16 = +[PKInk inkFromInk:v14 color:v1[9]];

          id v17 = objc_alloc([(PKDrawingConcrete *)v8 strokeClass]);
          id v18 = [v13 _strokeData];
          if (v13) {
            [v13 transform];
          }
          else {
            memset(v34, 0, sizeof(v34));
          }
          id v19 = [v13 mask];
          id v20 = (void *)[v17 initWithInk:v16 strokePath:v18 transform:v34 mask:v19];

          [v7 addObject:v20];
          v1 = v15;
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v10);
    }

    v4 = (PKDrawingConcrete *)[objc_alloc((Class)objc_opt_class()) initWithStrokes:v7 fromDrawing:v8];
  }
LABEL_24:
  (*(void (**)(void))(v1[10] + 16))();
}

- (void)setOverlayDrawing:(void *)a3 forDrawingUUID:
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (a1)
  {
    id v8 = [v6 uniqueCacheFilePath];
    uint64_t v9 = -[PKDrawingOverlayCache cachePathForDrawingUUID:](a1, v7);
    uint64_t v10 = (void *)[v5 copy];

    uint64_t v11 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__PKDrawingOverlayCache_setOverlayDrawing_forDrawingUUID___block_invoke;
    block[3] = &unk_1E64C9280;
    id v5 = v10;
    id v15 = v5;
    uint64_t v16 = a1;
    id v17 = v8;
    id v18 = v7;
    id v19 = v9;
    id v12 = v9;
    id v13 = v8;
    dispatch_async(v11, block);
  }
}

void __58__PKDrawingOverlayCache_setOverlayDrawing_forDrawingUUID___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    if (v2) {
      v3 = *(void **)(v2 + 8);
    }
    else {
      v3 = 0;
    }
    objc_msgSend(v3, "setObject:forKey:");
  }
  else
  {
    if (v2) {
      v4 = *(void **)(v2 + 8);
    }
    else {
      v4 = 0;
    }
    [v4 removeObjectForKey:*(void *)(a1 + 48)];
  }
  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = [v5 serializeTransiently];
  }
  else
  {
    id v6 = 0;
  }
  if ([v6 length])
  {
    id v7 = [*(id *)(a1 + 56) AES128Key];
    int v8 = +[PKDataEncryption encryptData:to:key:error:]((uint64_t)PKDataEncryption, v6, *(void **)(a1 + 64), v7, 0);
    uint64_t v9 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = [*(id *)(a1 + 32) strokes];
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v10;
      __int16 v23 = 2048;
      uint64_t v24 = [v11 count];
      __int16 v25 = 1024;
      int v26 = v8;
      _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEFAULT, "Updated overlay cache for: %@, %lu => %{BOOL}d", buf, 0x1Cu);
    }
LABEL_15:

    goto LABEL_16;
  }
  id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v13 = [*(id *)(a1 + 64) path];
  int v14 = [v12 fileExistsAtPath:v13];

  if (!v14) {
    goto LABEL_17;
  }
  id v15 = os_log_create("com.apple.pencilkit", "Math");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v16;
    _os_log_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_DEFAULT, "Deleting overlay cache for %@", buf, 0xCu);
  }

  id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v18 = *(void *)(a1 + 64);
  id v20 = 0;
  [v17 removeItemAtURL:v18 error:&v20];
  id v7 = v20;

  if (v7)
  {
    uint64_t v9 = os_log_create("com.apple.pencilkit", "Math");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v19;
      _os_log_error_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_ERROR, "Unable to delete overlay cache for: %@", buf, 0xCu);
    }
    goto LABEL_15;
  }
LABEL_16:

LABEL_17:
}

- (void)clearMemoryCache
{
  if (self) {
    self = (PKDrawingOverlayCache *)self->_memoryCache;
  }
  [(PKDrawingOverlayCache *)self removeAllObjects];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_memoryCache, 0);
}

@end