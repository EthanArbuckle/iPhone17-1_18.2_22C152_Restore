@interface AVTImageStore
+ (id)resourceURLForItem:(id)a3 scope:(id)a4 baseURL:(id)a5 encoder:(id)a6;
+ (void)clearContentAtLocation:(id)a3 logger:(id)a4;
- (AVTImageEncoder)imageEncoder;
- (AVTImageStore)initWithEnvironment:(id)a3 validateImages:(BOOL)a4 location:(id)a5;
- (AVTImageStore)initWithEnvironment:(id)a3 validateImages:(BOOL)a4 location:(id)a5 encoder:(id)a6;
- (AVTUILogger)logger;
- (BOOL)applyFileProtectionForResourceAtURL:(id)a3 error:(id *)a4;
- (BOOL)copyImagesForPersistentIdentifierPrefix:(id)a3 toPersistentIdentifierPrefix:(id)a4 error:(id *)a5;
- (BOOL)createDirectoryIfNeeded:(id *)a3;
- (BOOL)deleteImagesForItemsWithPersistentIdentifierPrefix:(id)a3 error:(id *)a4;
- (BOOL)resourceExistsInCacheForItem:(id)a3 scope:(id)a4;
- (BOOL)saveImage:(id)a3 forItem:(id)a4 scope:(id)a5 error:(id *)a6;
- (BOOL)saveImage:(id)a3 withImageData:(id)a4 forItem:(id)a5 scope:(id)a6 error:(id *)a7;
- (BOOL)validateImages;
- (NSFileManager)fileManager;
- (NSURL)location;
- (OS_dispatch_queue)stateLock;
- (id)_imageForItem:(id)a3 scope:(id)a4 cacheMissHandler:(id)a5;
- (id)imageForItem:(id)a3 scope:(id)a4;
- (id)imageForItem:(id)a3 scope:(id)a4 error:(id *)a5;
- (id)resourceURLForItem:(id)a3 scope:(id)a4;
- (void)performStateWork:(id)a3;
@end

@implementation AVTImageStore

- (id)resourceURLForItem:(id)a3 scope:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_class();
  v9 = [(AVTImageStore *)self location];
  v10 = [(AVTImageStore *)self imageEncoder];
  v11 = [v8 resourceURLForItem:v7 scope:v6 baseURL:v9 encoder:v10];

  return v11;
}

- (OS_dispatch_queue)stateLock
{
  return self->_stateLock;
}

- (BOOL)saveImage:(id)a3 forItem:(id)a4 scope:(id)a5 error:(id *)a6
{
  return [(AVTImageStore *)self saveImage:a3 withImageData:0 forItem:a4 scope:a5 error:a6];
}

- (BOOL)saveImage:(id)a3 withImageData:(id)a4 forItem:(id)a5 scope:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if ([(AVTImageStore *)self createDirectoryIfNeeded:a7])
  {
    v16 = [(AVTImageStore *)self resourceURLForItem:v14 scope:v15];
    v17 = [(AVTImageStore *)self logger];
    v18 = [v16 path];
    [v17 logImageStoreBeginSavingImageForPath:v18];

    if ([(AVTImageStore *)self validateImages])
    {
      v19 = +[AVTImageValidator sharedValidator];
      v20 = v19;
      if (v19)
      {
        id v36 = 0;
        char v21 = [v19 validateImageIsNotTransparent:v12 error:&v36];
        id v22 = v36;
        id v23 = v22;
        if ((v21 & 1) == 0)
        {
          if (a7)
          {
            id v23 = v22;
            char v25 = 0;
            *a7 = v23;
          }
          else
          {
            char v25 = 0;
          }
          goto LABEL_22;
        }
        id v34 = v22;
        char v24 = 0;
        if (v13)
        {
LABEL_12:
          v35 = v20;
          if (objc_opt_respondsToSelector())
          {
            v27 = [v14 persistentDataHashForScope:v15];
            if (v24) {
              goto LABEL_17;
            }
          }
          else
          {
            v27 = 0;
            if (v24) {
              goto LABEL_17;
            }
          }
          v28 = [v16 absoluteString];
          char v29 = [v35 validateImageDataIsNotDuplicate:v13 forFileName:v28 avatarDataHash:v27];

          if ((v29 & 1) == 0)
          {
            if (a7)
            {
              [MEMORY[0x263F29748] errorWithCode:607 userInfo:0];
              char v25 = 0;
              *a7 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              char v25 = 0;
            }
LABEL_21:
            id v23 = v34;

            v20 = v35;
LABEL_22:

            goto LABEL_23;
          }
LABEL_17:
          if ([v14 requiresEncryption]) {
            uint64_t v30 = AVTDefaultFileProtectionDataWritingOptions() | 1;
          }
          else {
            uint64_t v30 = 1;
          }
          char v25 = [v13 writeToURL:v16 options:v30 error:a7];
          v31 = [(AVTImageStore *)self logger];
          v32 = [v16 path];
          [v31 logImageStoreDoneSavingImageForPath:v32];

          goto LABEL_21;
        }
LABEL_11:
        v26 = [(AVTImageStore *)self imageEncoder];
        id v13 = [v26 dataFromImage:v12];

        if (!v13)
        {
          if (a7)
          {
            [MEMORY[0x263F29748] errorWithCode:604 userInfo:0];
            id v13 = 0;
            char v25 = 0;
            *a7 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v13 = 0;
            char v25 = 0;
          }
          id v23 = v34;
          goto LABEL_22;
        }
        goto LABEL_12;
      }
      id v34 = 0;
    }
    else
    {
      id v34 = 0;
      v20 = 0;
    }
    char v24 = 1;
    if (v13) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  char v25 = 0;
LABEL_23:

  return v25;
}

- (void)performStateWork:(id)a3
{
  id v4 = a3;
  v5 = [(AVTImageStore *)self stateLock];
  dispatch_sync(v5, v4);
}

- (AVTImageStore)initWithEnvironment:(id)a3 validateImages:(BOOL)a4 location:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = objc_alloc_init(AVTATXImageIOImageEncoder);
  v11 = [(AVTImageStore *)self initWithEnvironment:v9 validateImages:v5 location:v8 encoder:v10];

  return v11;
}

+ (id)resourceURLForItem:(id)a3 scope:(id)a4 baseURL:(id)a5 encoder:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  v11 = [a3 persistentIdentifierForScope:a4];
  id v12 = [v10 URLByAppendingPathComponent:v11];

  id v13 = [v9 fileExtension];

  id v14 = [v12 URLByAppendingPathExtension:v13];

  return v14;
}

- (NSURL)location
{
  return self->_location;
}

void __41__AVTImageStore_createDirectoryIfNeeded___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) fileManager];
  v3 = [*(id *)(a1 + 32) location];
  id v4 = [v3 path];
  char v5 = [v2 fileExistsAtPath:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = [*(id *)(a1 + 32) fileManager];
    id v7 = [*(id *)(a1 + 32) location];
    id v8 = [v7 path];
    id v12 = 0;
    char v9 = [v6 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v12];
    id v10 = v12;
    id v11 = v12;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;

    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v10);
    }
  }
}

void __54__AVTImageStore__imageForItem_scope_cacheMissHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v21 = 0;
  uint64_t v5 = [v2 imageForItem:v3 scope:v4 error:&v21];
  id v6 = v21;
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v10 = [*(id *)(a1 + 32) logger];
  if (v9)
  {
    id v11 = [*(id *)(a1 + 40) description];
    objc_msgSend(v10, "logImageStoreCacheHitForItemDescription:sizeCost:", v11, objc_msgSend(*(id *)(a1 + 48), "cacheableResourceAssociatedCost"));
  }
  else
  {
    id v12 = NSString;
    id v13 = [*(id *)(a1 + 40) persistentIdentifierForScope:*(void *)(a1 + 48)];
    id v14 = [v12 stringWithFormat:@"source %@ error %@", v13, v6];
    [v10 logImageStoreCacheMiss:v14];

    uint64_t v15 = *(void *)(a1 + 56);
    if (v15)
    {
      uint64_t v16 = (*(void (**)(uint64_t, void, void))(v15 + 16))(v15, *(void *)(a1 + 40), *(void *)(a1 + 48));
      uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
      v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      int v19 = [*(id *)(a1 + 32) resourceExistsInCacheForItem:*(void *)(a1 + 40) scope:*(void *)(a1 + 48)];
      uint64_t v20 = *(void *)(*(void *)(a1 + 72) + 8);
      if (v19) {
        *(unsigned char *)(v20 + 24) = 0;
      }
      else {
        *(unsigned char *)(v20 + 24) = 1;
      }
    }
  }
}

+ (void)clearContentAtLocation:(id)a3 logger:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x263F08850];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  id v13 = 0;
  char v9 = [v8 removeItemAtURL:v7 error:&v13];

  id v10 = v13;
  id v11 = v10;
  if ((v9 & 1) == 0)
  {
    id v12 = [v10 description];
    [v5 logFileSystemError:v12];
  }
}

- (AVTImageStore)initWithEnvironment:(id)a3 validateImages:(BOOL)a4 location:(id)a5 encoder:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)AVTImageStore;
  id v13 = [(AVTImageStore *)&v26 init];
  if (v13)
  {
    id v14 = (NSFileManager *)objc_alloc_init(MEMORY[0x263F08850]);
    fileManager = v13->_fileManager;
    v13->_fileManager = v14;

    uint64_t v16 = [v11 copy];
    location = v13->_location;
    v13->_location = (NSURL *)v16;

    objc_storeStrong((id *)&v13->_imageEncoder, a6);
    v18 = [v10 lockProvider];
    uint64_t v19 = ((void (**)(void, const char *))v18)[2](v18, "com.apple.AvatarUI.AVTImageStore.stateLock");
    stateLock = v13->_stateLock;
    v13->_stateLock = (OS_dispatch_queue *)v19;

    uint64_t v21 = [v10 logger];
    logger = v13->_logger;
    v13->_logger = (AVTUILogger *)v21;

    id v23 = v13->_logger;
    char v24 = [(NSURL *)v13->_location path];
    [(AVTUILogger *)v23 logCreatingImageStoreForPath:v24];

    v13->_validateImages = a4;
  }

  return v13;
}

- (BOOL)createDirectoryIfNeeded:(id *)a3
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__22;
  id v12 = __Block_byref_object_dispose__22;
  id v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__AVTImageStore_createDirectoryIfNeeded___block_invoke;
  v7[3] = &unk_263FF2EE0;
  v7[4] = self;
  v7[5] = &v14;
  v7[6] = &v8;
  [(AVTImageStore *)self performStateWork:v7];
  int v4 = *((unsigned __int8 *)v15 + 24);
  if (a3 && !*((unsigned char *)v15 + 24))
  {
    *a3 = (id) v9[5];
    int v4 = *((unsigned __int8 *)v15 + 24);
  }
  BOOL v5 = v4 != 0;
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

- (BOOL)deleteImagesForItemsWithPersistentIdentifierPrefix:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(AVTImageStore *)self fileManager];
  uint64_t v8 = [(AVTImageStore *)self location];
  char v9 = [v8 path];
  int v10 = [v7 fileExistsAtPath:v9];

  if (v10)
  {
    id v11 = [(AVTImageStore *)self logger];
    [v11 logDeletingImagesWithIdentifierPrefix:v6];

    id v12 = [(AVTImageStore *)self fileManager];
    id v13 = [(AVTImageStore *)self location];
    uint64_t v14 = [v12 contentsOfDirectoryAtURL:v13 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:0 error:a4];

    if (v14)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        v27 = v14;
        uint64_t v18 = *(void *)v29;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v29 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            uint64_t v21 = [v20 lastPathComponent];
            int v22 = [v21 hasPrefix:v6];

            if (v22)
            {
              id v23 = [(AVTImageStore *)self fileManager];
              int v24 = [v23 removeItemAtURL:v20 error:a4];

              if (!v24)
              {
                BOOL v25 = 0;
                goto LABEL_16;
              }
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
          if (v17) {
            continue;
          }
          break;
        }
        BOOL v25 = 1;
LABEL_16:
        uint64_t v14 = v27;
      }
      else
      {
        BOOL v25 = 1;
      }
    }
    else
    {
      BOOL v25 = 0;
    }
  }
  else
  {
    BOOL v25 = 1;
  }

  return v25;
}

- (BOOL)copyImagesForPersistentIdentifierPrefix:(id)a3 toPersistentIdentifierPrefix:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v35 = a4;
  char v9 = [(AVTImageStore *)self fileManager];
  int v10 = [(AVTImageStore *)self location];
  id v11 = [v10 path];
  char v12 = [v9 fileExistsAtPath:v11];

  if (v12)
  {
    id v13 = [(AVTImageStore *)self fileManager];
    uint64_t v14 = [(AVTImageStore *)self location];
    id v15 = [v13 contentsOfDirectoryAtURL:v14 includingPropertiesForKeys:MEMORY[0x263EFFA68] options:0 error:a5];

    if (!v15) {
      goto LABEL_22;
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v33 = v15;
      id v34 = a5;
      char v19 = 0;
      uint64_t v20 = *(void *)v37;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(v16);
          }
          int v22 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          id v23 = [v22 lastPathComponent];
          int v24 = [v23 hasPrefix:v8];

          if (v24)
          {
            BOOL v25 = [v22 lastPathComponent];
            objc_super v26 = [v25 stringByReplacingOccurrencesOfString:v8 withString:v35];

            v27 = [v22 URLByDeletingLastPathComponent];
            long long v28 = [v27 URLByAppendingPathComponent:v26];

            long long v29 = [(AVTImageStore *)self fileManager];
            char v30 = [v29 copyItemAtURL:v22 toURL:v28 error:v34];

            if ((v30 & 1) == 0)
            {

              BOOL v31 = 0;
              id v15 = v33;
              goto LABEL_23;
            }
            char v19 = 1;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (v18) {
          continue;
        }
        break;
      }

      id v15 = v33;
      a5 = v34;
      if (v19)
      {
        BOOL v31 = 1;
        goto LABEL_23;
      }
    }
    else
    {
    }
    if (a5)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4 userInfo:0];
      BOOL v31 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_22:
      BOOL v31 = 0;
    }
LABEL_23:
  }
  else if (a5)
  {
    [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4 userInfo:0];
    BOOL v31 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (id)imageForItem:(id)a3 scope:(id)a4 error:(id *)a5
{
  id v8 = a3;
  char v9 = [(AVTImageStore *)self resourceURLForItem:v8 scope:a4];
  int v10 = [v8 requiresEncryption];

  if (v10
    && ![(AVTImageStore *)self applyFileProtectionForResourceAtURL:v9 error:a5])
  {
    char v12 = 0;
  }
  else
  {
    id v11 = [(AVTImageStore *)self imageEncoder];
    char v12 = [v11 imageFromURL:v9 error:a5];
  }
  return v12;
}

- (BOOL)applyFileProtectionForResourceAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(AVTImageStore *)self fileManager];
  id v8 = [v6 path];
  char v9 = [v7 attributesOfItemAtPath:v8 error:a4];

  if (v9)
  {
    uint64_t v10 = *MEMORY[0x263F080A8];
    id v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F080A8]];
    char v12 = AVTDefaultFileProtectionType();
    char v13 = [v11 isEqual:v12];

    if (v13) {
      goto LABEL_4;
    }
    uint64_t v14 = (void *)[v9 mutableCopy];
    id v15 = AVTDefaultFileProtectionType();
    [v14 setObject:v15 forKeyedSubscript:v10];

    id v16 = [(AVTImageStore *)self fileManager];
    uint64_t v17 = [v6 path];
    int v18 = [v16 setAttributes:v14 ofItemAtPath:v17 error:a4];

    if (v18) {
LABEL_4:
    }
      LOBYTE(v18) = 1;
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (id)imageForItem:(id)a3 scope:(id)a4
{
  return [(AVTImageStore *)self _imageForItem:a3 scope:a4 cacheMissHandler:0];
}

- (id)_imageForItem:(id)a3 scope:(id)a4 cacheMissHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    id v34 = __Block_byref_object_copy__22;
    id v35 = __Block_byref_object_dispose__22;
    id v36 = 0;
    uint64_t v27 = 0;
    long long v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __54__AVTImageStore__imageForItem_scope_cacheMissHandler___block_invoke;
    v21[3] = &unk_263FF2F08;
    BOOL v25 = &v31;
    v21[4] = self;
    id v11 = v8;
    id v22 = v11;
    id v12 = v9;
    id v23 = v12;
    id v24 = v10;
    objc_super v26 = &v27;
    [(AVTImageStore *)self performStateWork:v21];
    if (*((unsigned char *)v28 + 24))
    {
      uint64_t v13 = v32[5];
      id v20 = 0;
      BOOL v14 = [(AVTImageStore *)self saveImage:v13 forItem:v11 scope:v12 error:&v20];
      id v15 = v20;
      if (!v14)
      {
        id v16 = [(AVTImageStore *)self logger];
        uint64_t v17 = [v15 description];
        objc_msgSend(v16, "logImageStoreSavingError:code:", v17, objc_msgSend(v15, "code"));
      }
    }
    id v18 = (id)v32[5];

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
  }
  else if (v10)
  {
    (*((void (**)(id, id, id))v10 + 2))(v10, v8, v9);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (BOOL)resourceExistsInCacheForItem:(id)a3 scope:(id)a4
{
  BOOL v5 = [(AVTImageStore *)self resourceURLForItem:a3 scope:a4];
  id v6 = [(AVTImageStore *)self fileManager];
  id v7 = [v5 path];
  char v8 = [v6 fileExistsAtPath:v7];

  return v8;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (AVTImageEncoder)imageEncoder
{
  return self->_imageEncoder;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (BOOL)validateImages
{
  return self->_validateImages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_imageEncoder, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end