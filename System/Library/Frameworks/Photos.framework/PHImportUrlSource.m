@interface PHImportUrlSource
+ (BOOL)treatAsReadonlyVolume:(id)a3;
- (BOOL)canReference;
- (BOOL)containsSupportedMediaWithImportExceptions:(id *)a3;
- (BOOL)isAvailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToImportUrlSource:(id)a3;
- (BOOL)isReadonlyVolume;
- (NSArray)baseNames;
- (NSArray)urls;
- (NSDictionary)resourcePathsByIdentifier;
- (PHImportUrlSource)initWithURLs:(id)a3;
- (id)assetsByProcessingItem:(id)a3;
- (id)iconSymbolName;
- (id)name;
- (id)path;
- (id)prefix;
- (id)productKind;
- (id)resourcePathsInUrls:(id)a3;
- (id)rootUrlOfUrls:(id)a3;
- (id)volumePath;
- (unint64_t)hash;
- (void)beginProcessingWithCompletion:(id)a3;
- (void)dealloc;
- (void)dispatchAssetDataRequestAsyncUsingBlock:(id)a3;
- (void)endWork;
- (void)setBaseNames:(id)a3;
- (void)setIsReadonlyVolume:(BOOL)a3;
- (void)setPrefix:(id)a3;
- (void)setResourcePathsByIdentifier:(id)a3;
- (void)setUrls:(id)a3;
@end

@implementation PHImportUrlSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseNames, 0);
  objc_storeStrong((id *)&self->_resourcePathsByIdentifier, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_accessedURLs, 0);
  objc_storeStrong((id *)&self->_concurrentAssetDataRequestSemaphore, 0);
  objc_storeStrong((id *)&self->_activeAssetDataRequestQueue, 0);

  objc_storeStrong((id *)&self->_pendingAssetDataRequestQueue, 0);
}

- (void)setBaseNames:(id)a3
{
}

- (NSArray)baseNames
{
  return self->_baseNames;
}

- (void)setResourcePathsByIdentifier:(id)a3
{
}

- (NSDictionary)resourcePathsByIdentifier
{
  return self->_resourcePathsByIdentifier;
}

- (void)setIsReadonlyVolume:(BOOL)a3
{
  self->_isReadonlyVolume = a3;
}

- (BOOL)isReadonlyVolume
{
  return self->_isReadonlyVolume;
}

- (void)setUrls:(id)a3
{
}

- (NSArray)urls
{
  return self->_urls;
}

- (void)setPrefix:(id)a3
{
}

- (id)prefix
{
  return self->_prefix;
}

- (id)rootUrlOfUrls:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 objectAtIndexedSubscript:0];
  v5 = [v4 path];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count", 0) - 1);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v12 = v5;
        while (1)
        {
          v13 = [v11 path];
          char v14 = [v13 hasPrefix:v12];

          if (v14) {
            break;
          }
          v5 = [v12 stringByDeletingLastPathComponent];

          v12 = v5;
          if ([v5 isEqualToString:@"/"]) {
            goto LABEL_11;
          }
        }
        v5 = v12;
LABEL_11:
        ;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];

  return v15;
}

- (void)dispatchAssetDataRequestAsyncUsingBlock:(id)a3
{
  id v4 = a3;
  pendingAssetDataRequestQueue = self->_pendingAssetDataRequestQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__PHImportUrlSource_dispatchAssetDataRequestAsyncUsingBlock___block_invoke;
  v7[3] = &unk_1E5848790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(pendingAssetDataRequestQueue, v7);
}

void __61__PHImportUrlSource_dispatchAssetDataRequestAsyncUsingBlock___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 344), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 336);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__PHImportUrlSource_dispatchAssetDataRequestAsyncUsingBlock___block_invoke_2;
  v4[3] = &unk_1E5848790;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

intptr_t __61__PHImportUrlSource_dispatchAssetDataRequestAsyncUsingBlock___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 344);

  return dispatch_semaphore_signal(v2);
}

- (BOOL)canReference
{
  return 1;
}

- (id)volumePath
{
  return self->_prefix;
}

- (BOOL)isAvailable
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_prefix];
  id v12 = 0;
  uint64_t v4 = *MEMORY[0x1E4F1C898];
  id v11 = 0;
  char v5 = [v3 getResourceValue:&v12 forKey:v4 error:&v11];
  id v6 = v12;
  id v7 = v11;

  if ((v5 & 1) == 0)
  {
    id v8 = PLImportGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      prefix = self->_prefix;
      *(_DWORD *)buf = 138412290;
      char v14 = prefix;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEBUG, "Volume for path '%@' does not exist", buf, 0xCu);
    }
  }
  return v6 != 0;
}

- (id)path
{
  return self->_prefix;
}

- (id)productKind
{
  return @"Folder";
}

- (id)iconSymbolName
{
  return @"folder";
}

- (id)name
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = [(PHImportUrlSource *)self prefix];
  char v5 = [v3 displayNameAtPath:v4];

  return v5;
}

- (void)endWork
{
  id v3 = objc_opt_new();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __28__PHImportUrlSource_endWork__block_invoke;
  v12[3] = &unk_1E5848578;
  id v4 = v3;
  id v13 = v4;
  char v5 = [(PHImportSource *)self progress];
  [v5 setCancellationHandler:v12];

  dispatch_time_t v6 = dispatch_time(0, 2000000000);
  id v7 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__PHImportUrlSource_endWork__block_invoke_2;
  block[3] = &unk_1E5848DF0;
  block[4] = self;
  id v11 = v4;
  id v8 = v4;
  dispatch_after(v6, v7, block);

  v9.receiver = self;
  v9.super_class = (Class)PHImportUrlSource;
  [(PHImportSource *)&v9 endWork];
}

uint64_t __28__PHImportUrlSource_endWork__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    *(unsigned char *)(v1 + 8) = 1;
  }
  return result;
}

void __28__PHImportUrlSource_endWork__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) assets];
  unint64_t v3 = [v2 count];
  if (PHImportConcurrencyLimit_onceToken != -1) {
    dispatch_once(&PHImportConcurrencyLimit_onceToken, &__block_literal_global_4867);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__PHImportUrlSource_endWork__block_invoke_3;
  v5[3] = &unk_1E58443B8;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  PHImportDispatchApply(v3, PHImportConcurrencyLimit_concurrencyLimit, v4, v5);
}

void __28__PHImportUrlSource_endWork__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) assets];
  unint64_t v3 = [v4 objectAtIndexedSubscript:a2];
  [v3 loadMetadataSync];
}

- (id)assetsByProcessingItem:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = [(NSDictionary *)self->_resourcePathsByIdentifier objectForKeyedSubscript:a3];
  char v5 = (void *)[v4 mutableCopy];

  long long v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
        id v13 = +[PHImportAsset assetFileForURL:v12 source:self];

        if (v13)
        {
          if ([v13 isSidecar])
          {
            if ([v13 resourceSubType] != 512) {
              [v18 insertObject:v13 atIndex:0];
            }
          }
          else
          {
            [v18 addObject:v13];
          }
        }
        else
        {
          char v14 = [v11 lastPathComponent];
          id v15 = [(PHImportExceptionRecorder *)self addExceptionWithType:1 path:v14 underlyingError:0 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportUrlSource.m" line:252];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  if ([v18 count])
  {
    v16 = [(PHImportSource *)self processAssets:v18];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)beginProcessingWithCompletion:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  char v5 = [(PHImportUrlSource *)self urls];
  uint64_t v6 = [v5 objectAtIndexedSubscript:0];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    _PFAssertFailHandler();
  }
  v25 = (void *)v6;
  [(PHImportUrlSource *)self setIsReadonlyVolume:+[PHImportUrlSource treatAsReadonlyVolume:v6]];
  uint64_t v7 = [(PHImportUrlSource *)self urls];
  uint64_t v8 = [(PHImportUrlSource *)self resourcePathsInUrls:v7];

  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  uint64_t v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v16 = [v15 stringByDeletingPathExtension];
        long long v17 = [(NSDictionary *)v9 objectForKeyedSubscript:v16];
        if (!v17)
        {
          long long v17 = [MEMORY[0x1E4F1CA48] array];
          [(NSDictionary *)v9 setObject:v17 forKeyedSubscript:v16];
        }
        [v17 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  resourcePathsByIdentifier = self->_resourcePathsByIdentifier;
  self->_resourcePathsByIdentifier = v9;
  long long v19 = v9;

  long long v20 = [(NSDictionary *)self->_resourcePathsByIdentifier allKeys];

  long long v21 = (void *)[v20 mutableCopy];
  [(PHImportSource *)self setItems:v21];

  long long v22 = [(PHImportSource *)self items];
  uint64_t v23 = [v22 count];
  uint64_t v24 = [(PHImportSource *)self progress];
  [v24 setTotalUnitCount:v23];

  v4[2](v4);
}

- (id)resourcePathsInUrls:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (char **)malloc_type_malloc(8 * [v3 count] + 8, 0x10040436913F5uLL);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = [*(id *)(*((void *)&v39 + 1) + 8 * i) path];
        (&v4[v8])[i] = (char *)[v11 fileSystemRepresentation];
      }
      v8 += i;
      uint64_t v7 = [v5 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  v4[v8] = 0;
  id v36 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:100000];
  uint64_t v12 = [MEMORY[0x1E4F1CA80] setWithCapacity:100000];
  [(PHImportSource *)self setFolders:v12];

  uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v14 = fts_open(v4, 92, 0);
  uint64_t v34 = *MEMORY[0x1E4F1C658];
  uint64_t v33 = *MEMORY[0x1E4F44420];
  while (1)
  {
    id v15 = fts_read(v14);
    if (!v15) {
      break;
    }
    v16 = v15;
    if (v15->fts_info != 10)
    {
      long long v17 = [v13 stringWithFileSystemRepresentation:v15->fts_path length:strlen(v15->fts_path)];
      long long v18 = v17;
      int fts_info = v16->fts_info;
      if (fts_info == 1)
      {
        long long v22 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v17];
        id v37 = 0;
        id v38 = 0;
        int v23 = [v22 getResourceValue:&v38 forKey:v34 error:&v37];
        id v24 = v38;
        id v25 = v37;
        if (v23)
        {
          if ([v24 BOOLValue])
          {
            fts_set(v14, v16, 4);
            long long v26 = [MEMORY[0x1E4F8CDF8] typeForURL:v22 error:0];
            if (([v26 conformsToType:v33] & 1) != 0
              || ([MEMORY[0x1E4F8CBC0] contentType],
                  long long v27 = objc_claimAutoreleasedReturnValue(),
                  int v32 = [v26 conformsToType:v27],
                  v27,
                  v32))
            {
              long long v28 = v36;
              goto LABEL_27;
            }
            v30 = [(PHImportSource *)self folders];
            [v30 addObject:v18];

LABEL_28:
            goto LABEL_29;
          }
        }
        else
        {
          long long v29 = PLImportGetLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v44 = v22;
            __int16 v45 = 2112;
            id v46 = v25;
            _os_log_impl(&dword_19B043000, v29, OS_LOG_TYPE_DEBUG, "Could not determine if url: %@ is a package. Continuing as folder. Error: %@", buf, 0x16u);
          }
        }
        long long v28 = [(PHImportSource *)self folders];
        long long v26 = v28;
LABEL_27:
        [v28 addObject:v18];
        goto LABEL_28;
      }
      if (fts_info == 11 || fts_info == 8)
      {
        long long v20 = [v17 lastPathComponent];
        char v21 = [v20 hasPrefix:@"."];

        if ((v21 & 1) == 0) {
          [v36 addObject:v18];
        }
      }
LABEL_29:
    }
  }
  fts_close(v14);
  free(v4);

  return v36;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_urls hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PHImportUrlSource *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PHImportUrlSource *)self isEqualToImportUrlSource:v4];
  }

  return v5;
}

- (BOOL)isEqualToImportUrlSource:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  BOOL v5 = [v4 urls];
  uint64_t v6 = [v5 count];
  if (v6 == [(NSArray *)self->_urls count])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__PHImportUrlSource_isEqualToImportUrlSource___block_invoke;
    v9[3] = &unk_1E5844390;
    v9[4] = self;
    v9[5] = &v10;
    [v5 enumerateObjectsUsingBlock:v9];
    BOOL v7 = *((unsigned char *)v11 + 24) != 0;
  }
  else
  {
    BOOL v7 = 0;
    *((unsigned char *)v11 + 24) = 0;
  }

  _Block_object_dispose(&v10, 8);
  return v7;
}

void __46__PHImportUrlSource_isEqualToImportUrlSource___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  BOOL v7 = *(void **)(*(void *)(a1 + 32) + 376);
  id v8 = a2;
  id v11 = [v7 objectAtIndexedSubscript:a3];
  uint64_t v9 = resourceIdentifierForURL(v8);

  uint64_t v10 = resourceIdentifierForURL(v11);
  if (([v9 isEqual:v10] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_accessedURLs;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) stopAccessingSecurityScopedResource];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)PHImportUrlSource;
  [(PHImportUrlSource *)&v8 dealloc];
}

- (BOOL)containsSupportedMediaWithImportExceptions:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v24 = [MEMORY[0x1E4F1CA48] array];
  [(PHImportUrlSource *)self resourcePathsInUrls:self->_urls];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    int v23 = a3;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        long long v11 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", v10, v23);
        unsigned int v12 = +[PHValidator mediaTypeForURL:v11];

        if (v12 <= 0x20 && ((1 << v12) & 0x100010004) != 0) {
          goto LABEL_21;
        }
        uint64_t v14 = (void *)MEMORY[0x1E4F8CDF8];
        id v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
        v16 = [v14 typeForURL:v15 error:0];

        if ((PFIsLivePhotoBundleType() & 1) != 0
          || ([MEMORY[0x1E4F8CBC0] contentType],
              long long v17 = objc_claimAutoreleasedReturnValue(),
              char v18 = [v16 conformsToType:v17],
              v17,
              (v18 & 1) != 0))
        {

LABEL_21:
          BOOL v21 = 1;
          goto LABEL_22;
        }
        if (v12 <= 1)
        {
          long long v19 = [[PHImportException alloc] initWithType:1 path:v10 underlyingError:0 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportUrlSource.m" line:94];
          [v24 addObject:v19];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
      a3 = v23;
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v20 = [v24 count];
  BOOL v21 = 0;
  if (a3 && v20)
  {
    BOOL v21 = 0;
    *a3 = v24;
  }
LABEL_22:

  return v21;
}

- (PHImportUrlSource)initWithURLs:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(PHImportSource *)self init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      urls = v5->_urls;
      v5->_urls = (NSArray *)v6;

      uint64_t v8 = (void *)[(NSArray *)v5->_urls mutableCopy];
      [(PHImportSource *)v5 setItems:v8];

      uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
      accessedURLs = v5->_accessedURLs;
      v5->_accessedURLs = (NSMutableSet *)v9;

      long long v11 = [(PHImportUrlSource *)v5 rootUrlOfUrls:v5->_urls];
      uint64_t v12 = [v11 path];
      prefix = v5->_prefix;
      v5->_prefix = (NSString *)v12;

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v14 = v4;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v32 != v17) {
              objc_enumerationMutation(v14);
            }
            long long v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            if ((-[NSMutableSet containsObject:](v5->_accessedURLs, "containsObject:", v19, (void)v31) & 1) == 0
              && [v19 startAccessingSecurityScopedResource])
            {
              [(NSMutableSet *)v5->_accessedURLs addObject:v19];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v16);
      }

      uint64_t v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      BOOL v21 = dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_USER_INITIATED, -1);
      dispatch_queue_t v22 = dispatch_queue_create("com.apple.photos.import.urlsource.pendingassetrequests", v21);
      pendingAssetDataRequestQueue = v5->_pendingAssetDataRequestQueue;
      v5->_pendingAssetDataRequestQueue = (OS_dispatch_queue *)v22;

      id v24 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      long long v25 = dispatch_queue_attr_make_with_qos_class(v24, QOS_CLASS_USER_INITIATED, 0);
      dispatch_queue_t v26 = dispatch_queue_create("com.apple.photos.import.urlsource.activeassetrequests", v25);
      activeAssetDataRequestQueue = v5->_activeAssetDataRequestQueue;
      v5->_activeAssetDataRequestQueue = (OS_dispatch_queue *)v26;

      if (PHImportConcurrencyLimit_onceToken != -1) {
        dispatch_once(&PHImportConcurrencyLimit_onceToken, &__block_literal_global_4867);
      }
      dispatch_semaphore_t v28 = dispatch_semaphore_create(PHImportConcurrencyLimit_concurrencyLimit);
      concurrentAssetDataRequestSemaphore = v5->_concurrentAssetDataRequestSemaphore;
      v5->_concurrentAssetDataRequestSemaphore = (OS_dispatch_semaphore *)v28;
    }
  }
  else
  {

    id v5 = 0;
  }

  return v5;
}

+ (BOOL)treatAsReadonlyVolume:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  uint64_t v3 = *MEMORY[0x1E4F1C860];
  id v10 = 0;
  int v4 = [a3 getResourceValue:&v11 forKey:v3 error:&v10];
  id v5 = v11;
  id v6 = v10;
  if (v4)
  {
    char v7 = [v5 BOOLValue];
  }
  else
  {
    uint64_t v8 = PLImportGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "Unable to value for key 'NSURLVolumeIsReadOnlyKey': %@", buf, 0xCu);
    }

    char v7 = 0;
  }

  return v7;
}

@end