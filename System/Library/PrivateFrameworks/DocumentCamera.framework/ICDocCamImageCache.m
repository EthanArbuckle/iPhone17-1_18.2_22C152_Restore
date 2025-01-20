@interface ICDocCamImageCache
- (BOOL)deleteAllImages;
- (BOOL)deleteImage:(id)a3;
- (BOOL)makeSureScanDirectoryExists:(id *)a3;
- (BOOL)replaceImage:(id)a3 metaData:(id)a4 uuid:(id)a5;
- (BOOL)writeImage:(id)a3 metaData:(id)a4 toURL:(id)a5 error:(id *)a6;
- (CGSize)getImageSize:(id)a3;
- (DCDataCryptorDelegate)dataCryptorDelegate;
- (DCLRUCache)inMemoryImageCache;
- (ICDocCamImageCache)init;
- (ICDocCamImageCache)initWithDataCryptorDelegate:(id)a3;
- (ICDocCamImageCache)initWithDataCryptorDelegate:(id)a3 cachesDirectoryURL:(id)a4;
- (NSMutableDictionary)imageSizeCache;
- (NSURL)cachesDirectoryURL;
- (NSURL)docCamImageDirectoryURL;
- (OS_dispatch_queue)imageCacheQueue;
- (id)createNSDataFrom:(id)a3 metaData:(id)a4;
- (id)getImage:(id)a3;
- (id)getImageURL:(id)a3;
- (id)getImageURL:(id)a3 async:(BOOL)a4;
- (id)imagePropertiesFromMetadata:(id)a3 orientation:(int64_t)a4;
- (id)setImage:(id)a3 metaData:(id)a4;
- (id)setImage:(id)a3 metaData:(id)a4 addToMemoryCache:(BOOL)a5 completion:(id)a6;
- (void)clearInMemoryCache;
- (void)dealloc;
- (void)setDataCryptorDelegate:(id)a3;
- (void)setImageCacheQueue:(id)a3;
- (void)setImageSizeCache:(id)a3;
- (void)setInMemoryImageCache:(id)a3;
@end

@implementation ICDocCamImageCache

- (ICDocCamImageCache)init
{
  return 0;
}

- (ICDocCamImageCache)initWithDataCryptorDelegate:(id)a3
{
  return [(ICDocCamImageCache *)self initWithDataCryptorDelegate:a3 cachesDirectoryURL:0];
}

- (ICDocCamImageCache)initWithDataCryptorDelegate:(id)a3 cachesDirectoryURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)ICDocCamImageCache;
  v9 = [(ICDocCamImageCache *)&v28 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataCryptorDelegate, a3);
    if (!v8)
    {
      v11 = +[DCCachesDirectory sharedCachesDirectory];
      id v8 = [v11 cachesDirectoryURL];
    }
    objc_storeStrong((id *)&v10->_cachesDirectoryURL, v8);
    uint64_t v12 = [v8 URLByAppendingPathComponent:@"Scans"];
    docCamImageDirectoryURL = v10->_docCamImageDirectoryURL;
    v10->_docCamImageDirectoryURL = (NSURL *)v12;

    v14 = [[DCLRUCache alloc] initWithMaxSize:2];
    inMemoryImageCache = v10->_inMemoryImageCache;
    v10->_inMemoryImageCache = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    imageSizeCache = v10->_imageSizeCache;
    v10->_imageSizeCache = v16;

    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.documentcamera.DocCamImageCacheQueue", v18);
    imageCacheQueue = v10->_imageCacheQueue;
    v10->_imageCacheQueue = (OS_dispatch_queue *)v19;

    [(ICDocCamImageCache *)v10 deleteAllImages];
    v21 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v22 = *MEMORY[0x263F1D0E0];
    v23 = [MEMORY[0x263F1C408] sharedApplication];
    [v21 addObserver:v10 selector:sel_applicationWillTerminate_ name:v22 object:v23];

    v24 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v25 = *MEMORY[0x263F1D060];
    v26 = [MEMORY[0x263F1C408] sharedApplication];
    [v24 addObserver:v10 selector:sel_didReceiveMemoryWarning_ name:v25 object:v26];
  }
  return v10;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ICDocCamImageCache;
  [(ICDocCamImageCache *)&v2 dealloc];
}

- (BOOL)makeSureScanDirectoryExists:(id *)a3
{
  v4 = [(ICDocCamImageCache *)self docCamImageDirectoryURL];
  v5 = [MEMORY[0x263F08850] defaultManager];
  char v6 = [v5 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:a3];

  if ((v6 & 1) == 0)
  {
    id v7 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[DCScannedDocument makeSureScanDirectoryExists:]((uint64_t)a3, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  return v6;
}

- (id)setImage:(id)a3 metaData:(id)a4
{
  return [(ICDocCamImageCache *)self setImage:a3 metaData:a4 addToMemoryCache:0 completion:0];
}

- (id)setImage:(id)a3 metaData:(id)a4 addToMemoryCache:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[ICDocCamImageCache setImage:metaData:addToMemoryCache:completion:](v13);
  }

  id v32 = 0;
  BOOL v14 = [(ICDocCamImageCache *)self makeSureScanDirectoryExists:&v32];
  id v15 = v32;
  id v16 = 0;
  if (v14)
  {
    v17 = [MEMORY[0x263F08C38] UUID];
    v18 = [v17 UUIDString];

    dispatch_queue_t v19 = (void *)MEMORY[0x263F08D40];
    [v10 size];
    v20 = objc_msgSend(v19, "valueWithCGSize:");
    v21 = [(ICDocCamImageCache *)self imageSizeCache];
    [v21 setObject:v20 forKeyedSubscript:v18];

    if (v7)
    {
      uint64_t v22 = [(ICDocCamImageCache *)self inMemoryImageCache];
      [v22 setObject:v10 forKey:v18];
    }
    v23 = [(ICDocCamImageCache *)self imageCacheQueue];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __68__ICDocCamImageCache_setImage_metaData_addToMemoryCache_completion___block_invoke;
    v27[3] = &unk_2642A9FE0;
    v27[4] = self;
    id v24 = v18;
    id v28 = v24;
    id v29 = v10;
    id v30 = v11;
    id v31 = v12;
    dispatch_async(v23, v27);

    uint64_t v25 = v31;
    id v16 = v24;
  }

  return v16;
}

void __68__ICDocCamImageCache_setImage_metaData_addToMemoryCache_completion___block_invoke(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) getImageURL:*(void *)(a1 + 40)];
  v3 = [*(id *)(a1 + 32) dataCryptorDelegate];

  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  if (v3)
  {
    BOOL v7 = [v4 createNSDataFrom:v5 metaData:v6];
    uint64_t v8 = [*(id *)(a1 + 32) dataCryptorDelegate];
    uint64_t v9 = [v8 encryptData:v7 identifier:*(void *)(a1 + 40)];

    id v19 = 0;
    char v10 = [v9 writeToURL:v2 options:1 error:&v19];
    id v11 = v19;
  }
  else
  {
    id v18 = 0;
    char v10 = [v4 writeImage:v5 metaData:v6 toURL:v2 error:&v18];
    id v11 = v18;
  }
  id v12 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    __68__ICDocCamImageCache_setImage_metaData_addToMemoryCache_completion___block_invoke_cold_3();
  }

  if (v10)
  {
    uint64_t v13 = [MEMORY[0x263F08850] defaultManager];
    BOOL v14 = [v2 path];
    uint64_t v15 = [v13 fileExistsAtPath:v14];

    if ((v15 & 1) == 0)
    {
      id v16 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[DCScannedDocument copyImageForSaving:toFolderURL:]();
      }
    }
  }
  else
  {
    uint64_t v13 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __68__ICDocCamImageCache_setImage_metaData_addToMemoryCache_completion___block_invoke_cold_2();
    }
    uint64_t v15 = 0;
  }

  uint64_t v17 = *(void *)(a1 + 64);
  if (v17) {
    (*(void (**)(uint64_t, uint64_t))(v17 + 16))(v17, v15);
  }
}

- (BOOL)replaceImage:(id)a3 metaData:(id)a4 uuid:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[ICDocCamImageCache replaceImage:metaData:uuid:](v11);
  }

  id v38 = 0;
  BOOL v12 = [(ICDocCamImageCache *)self makeSureScanDirectoryExists:&v38];
  id v13 = v38;
  if (v12)
  {
    BOOL v14 = (void *)MEMORY[0x263F08D40];
    [v8 size];
    uint64_t v15 = objc_msgSend(v14, "valueWithCGSize:");
    id v16 = [(ICDocCamImageCache *)self imageSizeCache];
    [v16 setObject:v15 forKeyedSubscript:v10];

    uint64_t v17 = [(ICDocCamImageCache *)self inMemoryImageCache];
    id v18 = [v17 objectForKey:v10];

    if (v18)
    {
      id v19 = [(ICDocCamImageCache *)self inMemoryImageCache];
      [v19 setObject:v8 forKey:v10];
    }
    uint64_t v35 = 0;
    v36[0] = &v35;
    v36[1] = 0x2020000000;
    char v37 = 0;
    v20 = [(ICDocCamImageCache *)self imageCacheQueue];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __49__ICDocCamImageCache_replaceImage_metaData_uuid___block_invoke;
    v30[3] = &unk_2642AA008;
    v30[4] = self;
    id v31 = v10;
    id v32 = v8;
    id v33 = v9;
    v34 = &v35;
    dispatch_sync(v20, v30);

    v21 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[ICDocCamImageCache replaceImage:metaData:uuid:]((uint64_t)v36, v21, v22, v23, v24, v25, v26, v27);
    }

    BOOL v28 = *(unsigned char *)(v36[0] + 24) != 0;
    _Block_object_dispose(&v35, 8);
  }
  else
  {
    BOOL v28 = 0;
  }

  return v28;
}

void __49__ICDocCamImageCache_replaceImage_metaData_uuid___block_invoke(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) getImageURL:*(void *)(a1 + 40)];
  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [v2 path];
  char v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) dataCryptorDelegate];

    BOOL v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    if (v6)
    {
      id v10 = [v7 createNSDataFrom:v8 metaData:v9];
      id v11 = [*(id *)(a1 + 32) dataCryptorDelegate];
      BOOL v12 = [v11 encryptData:v10 identifier:*(void *)(a1 + 40)];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v12 writeToURL:v2 atomically:1];
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v7 writeImage:v8 metaData:v9 toURL:v2 error:0];
    }
  }
  else
  {
    id v13 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __49__ICDocCamImageCache_replaceImage_metaData_uuid___block_invoke_cold_1();
    }
  }
}

- (CGSize)getImageSize:(id)a3
{
  id v4 = a3;
  char v5 = [(ICDocCamImageCache *)self imageSizeCache];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    [v6 CGSizeValue];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    id v11 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_217885000, v11, OS_LOG_TYPE_DEFAULT, "Failed to find image size in image size cache. Falling back to asking the image", v19, 2u);
    }

    BOOL v12 = [(ICDocCamImageCache *)self getImage:v4];
    [v12 size];
    double v8 = v13;
    double v10 = v14;

    uint64_t v15 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", v8, v10);
    id v16 = [(ICDocCamImageCache *)self imageSizeCache];
    [v16 setObject:v15 forKeyedSubscript:v4];
  }
  double v17 = v8;
  double v18 = v10;
  result.height = v18;
  result.width = v17;
  return result;
}

- (id)getImageURL:(id)a3
{
  return [(ICDocCamImageCache *)self getImageURL:a3 async:1];
}

- (id)getImageURL:(id)a3 async:(BOOL)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  uint64_t v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  if (a4)
  {
    double v7 = [(ICDocCamImageCache *)self docCamImageDirectoryURL];
    uint64_t v8 = [v7 URLByAppendingPathComponent:v6];
    double v9 = (void *)v19[5];
    v19[5] = v8;
  }
  else
  {
    double v10 = [(ICDocCamImageCache *)self imageCacheQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__ICDocCamImageCache_getImageURL_async___block_invoke;
    block[3] = &unk_2642AA030;
    double v17 = &v18;
    block[4] = self;
    id v16 = v6;
    dispatch_sync(v10, block);
  }
  uint64_t v11 = [(id)v19[5] URLByAppendingPathExtension:@"jpg"];
  BOOL v12 = (void *)v19[5];
  v19[5] = v11;

  id v13 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v13;
}

void __40__ICDocCamImageCache_getImageURL_async___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) docCamImageDirectoryURL];
  uint64_t v2 = [v5 URLByAppendingPathComponent:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)getImage:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v6 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ICDocCamImageCache getImage:](v6);
    }
    goto LABEL_7;
  }
  id v28 = 0;
  BOOL v5 = [(ICDocCamImageCache *)self makeSureScanDirectoryExists:&v28];
  id v6 = v28;
  if (!v5)
  {
LABEL_7:
    id v9 = 0;
    goto LABEL_12;
  }
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__3;
  uint64_t v26 = __Block_byref_object_dispose__3;
  double v7 = [(ICDocCamImageCache *)self inMemoryImageCache];
  id v27 = [v7 objectForKey:v4];

  uint64_t v8 = (void *)v23[5];
  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    double v10 = [(ICDocCamImageCache *)self imageCacheQueue];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    double v17 = __31__ICDocCamImageCache_getImage___block_invoke;
    uint64_t v18 = &unk_2642AA058;
    id v19 = self;
    id v11 = v4;
    id v20 = v11;
    v21 = &v22;
    dispatch_sync(v10, &v15);

    BOOL v12 = (void *)v23[5];
    if (v12)
    {
      id v13 = [(ICDocCamImageCache *)self inMemoryImageCache];
      [v13 setObject:v23[5] forKey:v11];

      BOOL v12 = (void *)v23[5];
    }
    id v9 = v12;
  }
  _Block_object_dispose(&v22, 8);

LABEL_12:

  return v9;
}

void __31__ICDocCamImageCache_getImage___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) getImageURL:*(void *)(a1 + 40)];
  uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [v2 path];
  char v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) dataCryptorDelegate];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v2 options:1 error:0];
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        id v9 = [*(id *)(a1 + 32) dataCryptorDelegate];
        double v10 = [v9 decryptEncryptedData:v8 identifier:*(void *)(a1 + 40)];

        if (v10)
        {
          uint64_t v11 = [MEMORY[0x263F1C6B0] imageWithData:v10];
          uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
          id v13 = *(void **)(v12 + 40);
          *(void *)(v12 + 40) = v11;
        }
      }
    }
    else
    {
      uint64_t v15 = (void *)MEMORY[0x263F1C6B0];
      uint64_t v16 = [v2 path];
      uint64_t v17 = [v15 imageWithContentsOfFile:v16];
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      id v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
  }
  else
  {
    double v14 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __31__ICDocCamImageCache_getImage___block_invoke_cold_1();
    }
  }
}

- (BOOL)deleteImage:(id)a3
{
  id v4 = a3;
  char v5 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[ICDocCamImageCache deleteImage:]();
  }

  id v25 = 0;
  BOOL v6 = [(ICDocCamImageCache *)self makeSureScanDirectoryExists:&v25];
  id v7 = v25;
  if (v6)
  {
    uint64_t v8 = [(ICDocCamImageCache *)self imageSizeCache];
    [v8 removeObjectForKey:v4];

    id v9 = [(ICDocCamImageCache *)self inMemoryImageCache];
    [v9 removeObjectForKey:v4];

    double v10 = [(ICDocCamImageCache *)self getImageURL:v4];
    uint64_t v11 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    uint64_t v12 = [(ICDocCamImageCache *)self imageCacheQueue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __34__ICDocCamImageCache_deleteImage___block_invoke;
    v17[3] = &unk_2642AA058;
    id v18 = v11;
    id v19 = v10;
    id v20 = &v21;
    id v13 = v10;
    id v14 = v11;
    dispatch_sync(v12, v17);

    BOOL v15 = *((unsigned char *)v22 + 24) != 0;
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

void __34__ICDocCamImageCache_deleteImage___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) path];
  LOBYTE(v3) = [v3 fileExistsAtPath:v4];

  if (v3)
  {
    char v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v16 = 0;
    char v7 = [v5 removeItemAtURL:v6 error:&v16];
    uint64_t v8 = v16;
    if (v7)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      BOOL v15 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[DCScannedDocument deleteImage:]();
      }
    }
  }
  else
  {
    uint64_t v8 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __34__ICDocCamImageCache_deleteImage___block_invoke_cold_2(v2, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (BOOL)deleteAllImages
{
  id v22 = 0;
  BOOL v3 = [(ICDocCamImageCache *)self makeSureScanDirectoryExists:&v22];
  id v4 = v22;
  if (v3)
  {
    char v5 = [(ICDocCamImageCache *)self imageSizeCache];
    [v5 removeAllObjects];

    uint64_t v6 = [(ICDocCamImageCache *)self inMemoryImageCache];
    [v6 removeAllObjects];

    char v7 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v8 = [(ICDocCamImageCache *)self docCamImageDirectoryURL];
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 1;
    uint64_t v9 = [(ICDocCamImageCache *)self imageCacheQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __37__ICDocCamImageCache_deleteAllImages__block_invoke;
    v14[3] = &unk_2642AA058;
    id v15 = v7;
    id v16 = v8;
    uint64_t v17 = &v18;
    id v10 = v8;
    id v11 = v7;
    dispatch_sync(v9, v14);

    BOOL v12 = *((unsigned char *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

void __37__ICDocCamImageCache_deleteAllImages__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 40) path];
  id v18 = 0;
  id v4 = [v2 contentsOfDirectoryAtPath:v3 error:&v18];
  id v5 = v18;

  uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        if (v5)
        {
          uint64_t v14 = os_log_create("com.apple.documentcamera", "");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            __37__ICDocCamImageCache_deleteAllImages__block_invoke_cold_2();
          }

          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
          goto LABEL_17;
        }
        id v10 = [*(id *)(a1 + 40) URLByAppendingPathComponent:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        id v11 = *(void **)(a1 + 32);
        id v17 = 0;
        char v12 = [v11 removeItemAtURL:v10 error:&v17];
        id v5 = v17;
        if ((v12 & 1) == 0)
        {
          uint64_t v13 = os_log_create("com.apple.documentcamera", "");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            __37__ICDocCamImageCache_deleteAllImages__block_invoke_cold_1(&buf, v16, v13);
          }

          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_17:
}

- (void)clearInMemoryCache
{
  id v2 = [(ICDocCamImageCache *)self inMemoryImageCache];
  [v2 removeAllObjects];
}

- (BOOL)writeImage:(id)a3 metaData:(id)a4 toURL:(id)a5 error:(id *)a6
{
  id v9 = a3;
  CFURLRef v10 = (const __CFURL *)a5;
  id v11 = a4;
  char v12 = -[ICDocCamImageCache imagePropertiesFromMetadata:orientation:](self, "imagePropertiesFromMetadata:orientation:", v11, [v9 imageOrientation]);

  uint64_t v13 = (void *)[v12 mutableCopy];
  uint64_t v14 = NSNumber;
  id v15 = +[DCSettings sharedSettings];
  [v15 imageQuality];
  id v16 = objc_msgSend(v14, "numberWithDouble:");
  [v13 setObject:v16 forKeyedSubscript:*MEMORY[0x263F0EFE8]];

  id v17 = [(id)*MEMORY[0x263F1DB40] identifier];
  id v18 = CGImageDestinationCreateWithURL(v10, v17, 1uLL, 0);

  if (v18)
  {
    long long v19 = (CGImage *)objc_msgSend(v9, "dc_CGImage");
    CFDictionaryRef v20 = (const __CFDictionary *)[v13 copy];
    CGImageDestinationAddImage(v18, v19, v20);

    BOOL v21 = CGImageDestinationFinalize(v18);
    if (!v21)
    {
      long long v22 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[ICDocCamImageCache writeImage:metaData:toURL:error:](v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }
    CFRelease(v18);
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (id)createNSDataFrom:(id)a3 metaData:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x263EFF8F8];
  id v7 = a4;
  uint64_t v8 = (UIImage *)a3;
  id v9 = UIImageJPEGRepresentation(v8, 1.0);
  CFDataRef v10 = [v6 dataWithData:v9];

  id v11 = CGImageSourceCreateWithData(v10, 0);
  uint64_t v12 = [(UIImage *)v8 imageOrientation];

  uint64_t v13 = [(ICDocCamImageCache *)self imagePropertiesFromMetadata:v7 orientation:v12];

  uint64_t v14 = (void *)[v13 mutableCopy];
  id v15 = NSNumber;
  id v16 = +[DCSettings sharedSettings];
  [v16 imageQuality];
  id v17 = objc_msgSend(v15, "numberWithDouble:");
  [v14 setObject:v17 forKeyedSubscript:*MEMORY[0x263F0EFE8]];

  CFStringRef Type = CGImageSourceGetType(v11);
  long long v19 = [MEMORY[0x263EFF990] data];
  CFDictionaryRef v20 = CGImageDestinationCreateWithData(v19, Type, 1uLL, 0);
  CFDictionaryRef v21 = (const __CFDictionary *)[v14 copy];
  CGImageDestinationAddImageFromSource(v20, v11, 0, v21);

  if (!CGImageDestinationFinalize(v20))
  {
    long long v22 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[ICDocCamImageCache createNSDataFrom:metaData:](v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }
  CFRelease(v20);
  CFRelease(v11);

  return v19;
}

- (id)imagePropertiesFromMetadata:(id)a3 orientation:(int64_t)a4
{
  id v4 = a3;
  id v21 = v4;
  if (v4)
  {
    id v5 = (void *)[v4 mutableCopy];
  }
  else
  {
    id v5 = [MEMORY[0x263EFF9A0] dictionary];
  }
  uint64_t v6 = v5;
  uint64_t v25 = *MEMORY[0x263F0F248];
  uint64_t v7 = [v5 objectForKey:v21];
  uint64_t v24 = *MEMORY[0x263F0F3C0];
  uint64_t v8 = objc_msgSend(v6, "objectForKey:");
  uint64_t v23 = *MEMORY[0x263F0F518];
  id v9 = objc_msgSend(v6, "objectForKey:");
  uint64_t v10 = *MEMORY[0x263F0F508];
  id v11 = [v6 objectForKey:*MEMORY[0x263F0F508]];
  uint64_t v12 = *MEMORY[0x263F0F498];
  uint64_t v13 = [v6 objectForKey:*MEMORY[0x263F0F498]];
  uint64_t v14 = *MEMORY[0x263F0F370];
  id v15 = [v6 objectForKey:*MEMORY[0x263F0F370]];
  uint64_t v27 = (void *)v7;
  if (!v7)
  {
    uint64_t v27 = [MEMORY[0x263EFF9A0] dictionary];
  }
  id v16 = (void *)v8;
  if (v8)
  {
    if (v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v16 = [MEMORY[0x263EFF9A0] dictionary];
    if (v9)
    {
LABEL_8:
      if (v11) {
        goto LABEL_9;
      }
      goto LABEL_19;
    }
  }
  id v9 = [MEMORY[0x263EFF9A0] dictionary];
  if (v11)
  {
LABEL_9:
    if (v13) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    if (v15) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_19:
  id v11 = [MEMORY[0x263EFF9A0] dictionary];
  if (!v13) {
    goto LABEL_20;
  }
LABEL_10:
  if (v15) {
    goto LABEL_11;
  }
LABEL_21:
  id v15 = [MEMORY[0x263EFF9A0] dictionary];
LABEL_11:
  [v6 setObject:v27 forKey:v25];
  [v6 setObject:v16 forKey:v24];
  [v6 setObject:v9 forKey:v23];
  [v6 setObject:v11 forKey:v10];
  [v6 setObject:v13 forKey:v12];
  [v6 setObject:v15 forKey:v14];
  if ((unint64_t)(a4 - 1) > 2) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = dword_21791AC40[a4 - 1];
  }
  id v18 = [NSNumber numberWithInt:v17];
  [v6 setObject:v18 forKey:@"Orientation"];

  [v6 removeObjectForKey:@"Diagnostic"];
  long long v19 = (void *)[v6 copy];

  return v19;
}

- (DCDataCryptorDelegate)dataCryptorDelegate
{
  return self->_dataCryptorDelegate;
}

- (void)setDataCryptorDelegate:(id)a3
{
}

- (NSURL)cachesDirectoryURL
{
  return self->_cachesDirectoryURL;
}

- (NSURL)docCamImageDirectoryURL
{
  return self->_docCamImageDirectoryURL;
}

- (OS_dispatch_queue)imageCacheQueue
{
  return self->_imageCacheQueue;
}

- (void)setImageCacheQueue:(id)a3
{
}

- (DCLRUCache)inMemoryImageCache
{
  return self->_inMemoryImageCache;
}

- (void)setInMemoryImageCache:(id)a3
{
}

- (NSMutableDictionary)imageSizeCache
{
  return self->_imageSizeCache;
}

- (void)setImageSizeCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSizeCache, 0);
  objc_storeStrong((id *)&self->_inMemoryImageCache, 0);
  objc_storeStrong((id *)&self->_imageCacheQueue, 0);
  objc_storeStrong((id *)&self->_docCamImageDirectoryURL, 0);
  objc_storeStrong((id *)&self->_cachesDirectoryURL, 0);

  objc_storeStrong((id *)&self->_dataCryptorDelegate, 0);
}

- (void)setImage:(os_log_t)log metaData:addToMemoryCache:completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_217885000, log, OS_LOG_TYPE_DEBUG, "setImage:metaData:addToMemoryCache:", v1, 2u);
}

void __68__ICDocCamImageCache_setImage_metaData_addToMemoryCache_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_217885000, v0, v1, "setImage: writeToURL failed: %@", v2, v3, v4, v5, v6);
}

void __68__ICDocCamImageCache_setImage_metaData_addToMemoryCache_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_217885000, v0, v1, "setImage:metaData:addToMemoryCache: writeToURL %@", v2, v3, v4, v5, v6);
}

- (void)replaceImage:(uint64_t)a3 metaData:(uint64_t)a4 uuid:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)replaceImage:(os_log_t)log metaData:uuid:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_217885000, log, OS_LOG_TYPE_DEBUG, "replaceImage:metaData:uuid:", v1, 2u);
}

void __49__ICDocCamImageCache_replaceImage_metaData_uuid___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_217885000, v0, v1, "No file after writing: %@", v2, v3, v4, v5, v6);
}

- (void)getImage:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "ICDocCamImageCache getImage() called with nil uuid", v1, 2u);
}

void __31__ICDocCamImageCache_getImage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_217885000, v0, v1, "getImage: unable to find file: %@", v2, v3, v4, v5, v6);
}

- (void)deleteImage:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_217885000, v0, v1, "deleteImage: %@", v2, v3, v4, v5, v6);
}

void __34__ICDocCamImageCache_deleteImage___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __37__ICDocCamImageCache_deleteAllImages__block_invoke_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "Removal failed", buf, 2u);
}

void __37__ICDocCamImageCache_deleteAllImages__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_217885000, v0, v1, "enumeration failed with error: %@", v2, v3, v4, v5, v6);
}

- (void)writeImage:(uint64_t)a3 metaData:(uint64_t)a4 toURL:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)createNSDataFrom:(uint64_t)a3 metaData:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end