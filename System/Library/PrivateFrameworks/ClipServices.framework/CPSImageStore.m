@interface CPSImageStore
+ (id)_storeDirectoryURL:(id *)a3;
+ (id)keyForGEOStyleAttributes:(id)a3 error:(id *)a4;
+ (id)keyForImageURL:(id)a3 error:(id *)a4;
+ (id)keyForMapsCategoryID:(id)a3 error:(id *)a4;
+ (id)keyForPOIMuid:(unint64_t)a3 error:(id *)a4;
- (id)storeImageData:(id)a3 forKey:(id)a4 error:(id *)a5;
- (id)storedImageForKey:(id)a3;
- (void)_purgeOldFilesInDirectory:(id)a3 timeToLive:(double)a4;
- (void)purgeOldImagesWithCompletionHandler:(id)a3;
@end

@implementation CPSImageStore

+ (id)keyForMapsCategoryID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v12 = 0;
  v6 = +[CPSImageStore _storeDirectoryURL:&v12];
  id v7 = v12;
  v8 = v7;
  if (v6)
  {
    v9 = [NSString stringWithFormat:@"%@.%@", v5, @"png"];
    v10 = [v6 URLByAppendingPathComponent:v9 isDirectory:0];
  }
  else
  {
    v10 = 0;
    if (a4) {
      *a4 = v7;
    }
  }

  return v10;
}

+ (id)keyForImageURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v19 = 0;
  v6 = +[CPSImageStore _storeDirectoryURL:&v19];
  id v7 = v19;
  v8 = v7;
  if (v6)
  {
    v9 = [v5 pathExtension];
    uint64_t v10 = [(__CFString *)v9 length];
    v11 = @"png";
    if (v10) {
      v11 = v9;
    }
    id v12 = v11;

    v13 = NSString;
    v14 = [v5 absoluteString];
    v15 = objc_msgSend(v14, "cps_sha256String");
    v16 = [v13 stringWithFormat:@"%@.%@", v15, v12];

    v17 = [v6 URLByAppendingPathComponent:v16 isDirectory:0];
  }
  else
  {
    v17 = 0;
    if (a4) {
      *a4 = v7;
    }
  }

  return v17;
}

+ (id)keyForGEOStyleAttributes:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v21 = 0;
  v6 = +[CPSImageStore _storeDirectoryURL:&v21];
  id v7 = v21;
  v8 = v7;
  if (v6)
  {
    v9 = [v5 attributes];
    uint64_t v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_8];

    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__6;
    id v19 = __Block_byref_object_dispose__6;
    v20 = &stru_26C629F40;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __48__CPSImageStore_keyForGEOStyleAttributes_error___block_invoke_15;
    v14[3] = &unk_26424F4D0;
    v14[4] = &v15;
    [v10 enumerateObjectsUsingBlock:v14];
    v11 = [NSString stringWithFormat:@"%@.%@", v16[5], @"png"];
    id v12 = [v6 URLByAppendingPathComponent:v11 isDirectory:0];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v12 = 0;
    if (a4) {
      *a4 = v7;
    }
  }

  return v12;
}

uint64_t __48__CPSImageStore_keyForGEOStyleAttributes_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unsigned int v6 = [v4 key];
  if (v6 >= [v5 key])
  {
    unsigned int v8 = [v4 key];
    uint64_t v7 = v8 > [v5 key];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

uint64_t __48__CPSImageStore_keyForGEOStyleAttributes_error___block_invoke_15(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (a3) {
    id v5 = @"_";
  }
  else {
    id v5 = &stru_26C629F40;
  }
  id v6 = a2;
  uint64_t v7 = [v6 key];
  uint64_t v8 = [v6 value];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [v4 stringByAppendingFormat:@"%@%d(%d)", v5, v7, v8];

  return MEMORY[0x270F9A758]();
}

+ (id)keyForPOIMuid:(unint64_t)a3 error:(id *)a4
{
  id v14 = 0;
  id v6 = +[CPSImageStore _storeDirectoryURL:&v14];
  id v7 = v14;
  uint64_t v8 = v7;
  if (v6)
  {
    v9 = NSString;
    uint64_t v10 = [NSNumber numberWithUnsignedLongLong:a3];
    v11 = [v9 stringWithFormat:@"muid_%@.%@", v10, @"png"];

    id v12 = [v6 URLByAppendingPathComponent:v11 isDirectory:0];
  }
  else
  {
    id v12 = 0;
    if (a4) {
      *a4 = v7;
    }
  }

  return v12;
}

- (id)storeImageData:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[CPSImageStore storeImageData:forKey:error:](v12);
      if (a5) {
        goto LABEL_8;
      }
    }
    else if (a5)
    {
LABEL_8:
      objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 1);
      id v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    id v9 = 0;
    goto LABEL_11;
  }
  id v9 = v8;
  id v14 = 0;
  [v7 writeToURL:v9 options:1 error:&v14];
  id v10 = v14;
  v11 = v10;
  if (a5 && v10) {
    *a5 = v10;
  }

LABEL_11:

  return v9;
}

- (id)storedImageForKey:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [MEMORY[0x263F08850] defaultManager];
    id v6 = [v4 path];
    int v7 = [v5 fileExistsAtPath:v6];

    if (v7) {
      id v8 = v4;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v9 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CPSImageStore storeImageData:forKey:error:](v9);
    }
    id v8 = 0;
  }

  return v8;
}

- (void)purgeOldImagesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(17, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__CPSImageStore_purgeOldImagesWithCompletionHandler___block_invoke;
  v7[3] = &unk_26424E6F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __53__CPSImageStore_purgeOldImagesWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[CPSImageStore _storeDirectoryURL:0];
  [v2 _purgeOldFilesInDirectory:v3 timeToLive:604800.0];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

+ (id)_storeDirectoryURL:(id *)a3
{
  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v5 = [v4 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:a3];

  id v6 = [v5 URLByAppendingPathComponent:@"com.apple.ClipServices/Images" isDirectory:1];
  int v7 = [MEMORY[0x263F08850] defaultManager];
  id v13 = 0;
  char v8 = [v7 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v13];
  id v9 = v13;

  if (v8)
  {
    id v10 = v6;
    goto LABEL_8;
  }
  v11 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    +[CPSImageStore _storeDirectoryURL:](v11, v9);
    if (a3) {
      goto LABEL_5;
    }
  }
  else if (a3)
  {
LABEL_5:
    id v10 = 0;
    *a3 = v9;
    goto LABEL_8;
  }
  id v10 = 0;
LABEL_8:

  return v10;
}

- (void)_purgeOldFilesInDirectory:(id)a3 timeToLive:(double)a4
{
  v37[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v7 = *MEMORY[0x263EFF610];
    uint64_t v8 = *MEMORY[0x263EFF5F8];
    v37[0] = *MEMORY[0x263EFF610];
    v37[1] = v8;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];
    id v10 = [v6 enumeratorAtURL:v5 includingPropertiesForKeys:v9 options:0 errorHandler:0];

    v11 = [MEMORY[0x263EFF910] date];
    [v11 timeIntervalSinceReferenceDate];
    double v13 = v12;

    id v14 = [MEMORY[0x263EFF980] array];
    uint64_t v15 = [v10 nextObject];
    if (v15)
    {
      v16 = (void *)v15;
      do
      {
        id v35 = 0;
        [v16 getResourceValue:&v35 forKey:v7 error:0];
        id v17 = v35;
        id v34 = 0;
        [v16 getResourceValue:&v34 forKey:v8 error:0];
        id v18 = v34;
        [v17 timeIntervalSinceReferenceDate];
        double v20 = v19;
        [v18 timeIntervalSinceReferenceDate];
        double v22 = v21;

        if (v20 >= v22) {
          double v23 = v20;
        }
        else {
          double v23 = v22;
        }
        if (v13 - v23 >= a4) {
          [v14 addObject:v16];
        }

        uint64_t v24 = [v10 nextObject];

        v16 = (void *)v24;
      }
      while (v24);
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v25 = v14;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v31;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v31 != v28) {
            objc_enumerationMutation(v25);
          }
          objc_msgSend(v6, "removeItemAtURL:error:", *(void *)(*((void *)&v30 + 1) + 8 * v29++), 0, (void)v30);
        }
        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v27);
    }
  }
}

- (void)storeImageData:(os_log_t)log forKey:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21559C000, log, OS_LOG_TYPE_ERROR, "Invalid image store key", v1, 2u);
}

+ (void)_storeDirectoryURL:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = objc_msgSend(a2, "cps_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_21559C000, v3, OS_LOG_TYPE_ERROR, "Cannot create image store folder with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end