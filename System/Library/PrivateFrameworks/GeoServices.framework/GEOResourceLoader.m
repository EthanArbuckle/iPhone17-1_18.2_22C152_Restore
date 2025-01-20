@interface GEOResourceLoader
+ (BOOL)validateUnpackedResource:(id)a3 at:(id)a4;
+ (Class)resourceLoadOperationClass;
+ (id)unpackResource:(id)a3 at:(id)a4 log:(id)a5 error:(id *)a6;
- (BOOL)_copyResource:(id)a3 fromPath:(id)a4 allowCreatingHardLink:(BOOL)a5 error:(id *)a6;
- (BOOL)_establishHardLinkIfPossibleForResource:(id)a3 toResource:(id)a4 error:(id *)a5;
- (BOOL)preferDirectNetworking;
- (BOOL)requiresWiFi;
- (GEOResourceLoader)init;
- (GEOResourceLoader)initWithTargetDirectory:(id)a3 auditToken:(id)a4 baseURL:(id)a5 alternateURLs:(id)a6 proxyURL:(id)a7 resources:(id)a8 forceUpdateCheck:(BOOL)a9 maximumConcurrentLoads:(unint64_t)a10 additionalDirectoryToConsider:(id)a11 log:(id)a12 signpostID:(unint64_t)a13;
- (NSProgress)progress;
- (void)_cleanup;
- (void)_loadNextResourceFromNetwork;
- (void)_loadResourcesFromDisk;
- (void)_writeResourceToDisk:(id)a3 withData:(id)a4 orTempFile:(id)a5 checksum:(id)a6 eTag:(id)a7 completionHandler:(id)a8 callbackQueue:(id)a9;
- (void)cancel;
- (void)setPreferDirectNetworking:(BOOL)a3;
- (void)setRequiresWiFi:(BOOL)a3;
- (void)startWithCompletionHandler:(id)a3 callbackQueue:(id)a4;
@end

@implementation GEOResourceLoader

- (void)_loadResourcesFromDisk
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[(NSMutableArray *)self->_resourcesToLoad mutableCopy];
  if ([v3 count])
  {
    *(void *)&long long v4 = 138477827;
    long long v46 = v4;
    v50 = v3;
    while (1)
    {
      v5 = objc_msgSend(v3, "firstObject", v46);
      [v3 removeObjectAtIndex:0];
      directory = self->_directory;
      v7 = [v5 name];
      v8 = [(NSString *)directory stringByAppendingPathComponent:v7];

      v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      LODWORD(v7) = [v9 fileExistsAtPath:v8];

      if (!v7) {
        break;
      }
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      {
        v11 = log;
        v12 = [v5 name];
        *(_DWORD *)buf = v46;
        v65 = v12;
        _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEBUG, "Found matching resource in destination directory for '%{private}@'", buf, 0xCu);

        log = self->_log;
      }
      if (([v5 shouldCheckForUpdateForResourceAtPath:v8 useExtendedAttrs:1 forceUpdateCheck:self->_forceUpdateCheck log:log] & 1) == 0)
      {
        if (![v5 validateResourceAtPath:v8 useExtendedAttrs:1 log:self->_log]) {
          break;
        }
        v48 = v8;
        [(NSMutableArray *)self->_resourcesToLoad removeObject:v5];
        loadedResources = self->_loadedResources;
        v14 = [v5 resource];
        [(NSMutableArray *)loadedResources addObject:v14];

        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        v15 = [v5 equivalentResources];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v59 objects:v68 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v60;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v60 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = *(void **)(*((void *)&v59 + 1) + 8 * i);
              id v58 = 0;
              BOOL v21 = [(GEOResourceLoader *)self _establishHardLinkIfPossibleForResource:v20 toResource:v5 error:&v58];
              id v22 = v58;
              if (v21)
              {
                v23 = self->_loadedResources;
                v24 = [v20 resource];
                [(NSMutableArray *)v23 addObject:v24];
              }
              else
              {
                v25 = self->_log;
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  v26 = v25;
                  v27 = [v20 name];
                  *(_DWORD *)buf = 138478083;
                  v65 = v27;
                  __int16 v66 = 2113;
                  id v67 = v22;
                  _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_DEBUG, "Failed to establish hard link for resource '%{private}@': %{private}@. Loading normally.", buf, 0x16u);
                }
                [(NSMutableArray *)self->_resourcesToLoad addObject:v20];
                [v50 addObject:v20];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v59 objects:v68 count:16];
          }
          while (v17);
        }

        v3 = v50;
        v8 = v48;
      }
LABEL_37:

      if (![v3 count]) {
        goto LABEL_38;
      }
    }
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __43__GEOResourceLoader__loadResourcesFromDisk__block_invoke;
    v55[3] = &unk_1E53E3398;
    v55[4] = self;
    id v28 = v5;
    id v56 = v28;
    id v57 = v3;
    v29 = (uint64_t (**)(void, void, void, void, void))MEMORY[0x18C120660](v55);
    if (![(NSString *)self->_additionalDirectoryToConsider length]) {
      goto LABEL_23;
    }
    additionalDirectoryToConsider = self->_additionalDirectoryToConsider;
    uint64_t v31 = [v28 name];
    v32 = [(NSString *)additionalDirectoryToConsider stringByAppendingPathComponent:v31];

    LOBYTE(v31) = ((uint64_t (**)(void, void *, __CFString *, uint64_t, uint64_t))v29)[2](v29, v32, @"alternate", 1, 1);
    if ((v31 & 1) == 0)
    {
LABEL_23:
      v47 = v29;
      v49 = v8;
      v33 = [v28 name];
      v34 = [v33 stringByDeletingPathExtension];

      v35 = [v28 name];
      v36 = [v35 pathExtension];

      v37 = objc_msgSend(MEMORY[0x1E4F28B50], "__geoBundle");
      v38 = [v37 pathForResource:v34 ofType:v36];

      if (v38)
      {
LABEL_34:
        v45 = [v38 stringByResolvingSymlinksInPath];

        v29 = v47;
        ((uint64_t (**)(void, void *, __CFString *, void, void))v47)[2](v47, v45, @"GeoServices framework", 0, 0);
      }
      else
      {
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        uint64_t v39 = [&unk_1ED73EDE8 countByEnumeratingWithState:&v51 objects:v63 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          uint64_t v41 = *(void *)v52;
          while (2)
          {
            for (uint64_t j = 0; j != v40; ++j)
            {
              if (*(void *)v52 != v41) {
                objc_enumerationMutation(&unk_1ED73EDE8);
              }
              uint64_t v43 = *(void *)(*((void *)&v51 + 1) + 8 * j);
              v44 = objc_msgSend(MEMORY[0x1E4F28B50], "__geoBundle");
              v38 = [v44 pathForResource:v34 ofType:v36 inDirectory:v43];

              if (v38)
              {
                v3 = v50;
                goto LABEL_34;
              }
            }
            uint64_t v40 = [&unk_1ED73EDE8 countByEnumeratingWithState:&v51 objects:v63 count:16];
            v3 = v50;
            v29 = v47;
            if (v40) {
              continue;
            }
            break;
          }
        }
      }

      v8 = v49;
    }

    goto LABEL_37;
  }
LABEL_38:
}

- (void)startWithCompletionHandler:(id)a3 callbackQueue:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id global_queue = a4;
  v8 = (NSMutableArray *)[(NSArray *)self->_resourceInfos mutableCopy];
  resourcesToLoad = self->_resourcesToLoad;
  self->_resourcesToLoad = v8;

  v33 = v6;
  v10 = (void *)[v6 copy];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v10;

  if (!global_queue) {
    id global_queue = (id)geo_get_global_queue();
  }
  id v31 = global_queue;
  objc_storeStrong((id *)&self->_callbackQueue, global_queue);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    resourceInfos = self->_resourceInfos;
    v14 = log;
    uint64_t v15 = [(NSArray *)resourceInfos count];
    uint64_t v16 = self->_resourceInfos;
    *(_DWORD *)buf = 134218243;
    uint64_t v36 = v15;
    __int16 v37 = 2113;
    v38 = v16;
    _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "Starting load of %lu resources: %{private}@", buf, 0x16u);
  }
  if ([(NSMutableArray *)self->_resourcesToLoad count])
  {
    unint64_t v17 = 0;
    do
    {
      uint64_t v18 = [(NSMutableArray *)self->_resourcesToLoad objectAtIndex:v17];
      v19 = [v18 checksum];
      uint64_t v20 = [v19 length];

      ++v17;
      if (v20)
      {
        if (v17 >= [(NSMutableArray *)self->_resourcesToLoad count])
        {
          BOOL v21 = 0;
        }
        else
        {
          BOOL v21 = 0;
          unint64_t v22 = v17;
          do
          {
            v23 = [(NSMutableArray *)self->_resourcesToLoad objectAtIndex:v22];
            v24 = [v23 checksum];
            v25 = [v18 checksum];
            int v26 = [v24 isEqualToData:v25];

            if (v26)
            {
              if (!v21)
              {
                BOOL v21 = [MEMORY[0x1E4F1CA48] array];
              }
              [(NSArray *)v21 addObject:v23];
            }
            ++v22;
          }
          while (v22 < [(NSMutableArray *)self->_resourcesToLoad count]);
        }
        if ([(NSArray *)v21 count])
        {
          v27 = self->_log;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            id v28 = v27;
            v29 = [v18 name];
            *(_DWORD *)buf = 138478083;
            uint64_t v36 = (uint64_t)v29;
            __int16 v37 = 2113;
            v38 = v21;
            _os_log_impl(&dword_188D96000, v28, OS_LOG_TYPE_DEBUG, "Found multiple resources with the same checksum as '%{private}@': %{private}@", buf, 0x16u);
          }
          [v18 setEquivalentResources:v21];
          [(NSMutableArray *)self->_resourcesToLoad removeObjectsInArray:v21];
        }
      }
    }
    while (v17 < [(NSMutableArray *)self->_resourcesToLoad count]);
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__GEOResourceLoader_startWithCompletionHandler_callbackQueue___block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_loadNextResourceFromNetwork
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (self->_canceled) {
    return;
  }
  uint64_t v3 = [(NSMutableArray *)self->_resourcesToLoad count];
  unint64_t numberOfDownloadsInProgress = self->_numberOfDownloadsInProgress;
  if (v3 | numberOfDownloadsInProgress) {
    goto LABEL_6;
  }
  if (self->_numberOfCopiesInProgress)
  {
    unint64_t numberOfDownloadsInProgress = 0;
LABEL_6:
    if (numberOfDownloadsInProgress >= self->_maxConcurrentLoads
      || ![(NSMutableArray *)self->_resourcesToLoad count])
    {
      return;
    }
    id v5 = [(NSMutableArray *)self->_resourcesToLoad objectAtIndex:0];
    [(NSMutableArray *)self->_resourcesToLoad removeObjectAtIndex:0];
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138477827;
      unint64_t v34 = (unint64_t)v5;
      _os_log_impl(&dword_188D96000, log, OS_LOG_TYPE_DEBUG, "Loading next resource: %{private}@", buf, 0xCu);
      log = self->_log;
    }
    ++self->_numberOfDownloadsInProgress;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      v7 = log;
      v8 = [v5 name];
      *(_DWORD *)buf = 138477827;
      unint64_t v34 = (unint64_t)v8;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "Loading resource '%{private}@' from network", buf, 0xCu);
    }
    [(GEOReportedProgress *)self->_progress becomeCurrentWithPendingUnitCount:1];
    id v9 = objc_alloc((Class)[(id)objc_opt_class() resourceLoadOperationClass]);
    v10 = [v5 eTag];
    v11 = (void *)[v9 initWithResource:v5 eTag:v10 auditToken:self->_auditToken baseURL:self->_baseURL alternateURLs:self->_alternateURLs proxyURL:self->_proxyURL log:self->_log];

    if (v11)
    {
      [v11 setRequiresWiFi:self->_requiresWiFi];
      inProgressResourceDownloads = self->_inProgressResourceDownloads;
      if (!inProgressResourceDownloads)
      {
        v13 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:512 capacity:self->_maxConcurrentLoads];
        v14 = self->_inProgressResourceDownloads;
        self->_inProgressResourceDownloads = v13;

        inProgressResourceDownloads = self->_inProgressResourceDownloads;
      }
      [(NSMapTable *)inProgressResourceDownloads setObject:v11 forKey:v5];
      if (self->_signpostID)
      {
        os_signpost_id_t v15 = os_signpost_id_generate((os_log_t)self->_log);
        uint64_t v16 = self->_log;
        unint64_t v17 = v16;
        if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v16))
        {
          unint64_t signpostID = self->_signpostID;
          v19 = [v5 name];
          *(_DWORD *)buf = 134218242;
          unint64_t v34 = signpostID;
          __int16 v35 = 2112;
          uint64_t v36 = v19;
          _os_signpost_emit_with_name_impl(&dword_188D96000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "LoadResource", "parent_signpost=%llu Name=%@", buf, 0x16u);
        }
      }
      else
      {
        os_signpost_id_t v15 = 0;
      }
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __49__GEOResourceLoader__loadNextResourceFromNetwork__block_invoke_61;
      v28[3] = &unk_1E53E33E8;
      v28[4] = self;
      id v5 = v5;
      id v29 = v5;
      os_signpost_id_t v30 = v15;
      [v11 startWithCompletionHandler:v28 callbackQueue:self->_workQueue];
      [(GEOReportedProgress *)self->_progress resignCurrent];
      [(GEOResourceLoader *)self _loadNextResourceFromNetwork];
    }
    else
    {
      v24 = self->_log;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        v25 = v24;
        int v26 = [v5 name];
        *(_DWORD *)buf = 138477827;
        unint64_t v34 = (unint64_t)v26;
        _os_log_impl(&dword_188D96000, v25, OS_LOG_TYPE_FAULT, "Unable to create operation for resource %{private}@", buf, 0xCu);
      }
      unint64_t v27 = self->_numberOfDownloadsInProgress;
      if (v27) {
        self->_unint64_t numberOfDownloadsInProgress = v27 - 1;
      }
      [(GEOReportedProgress *)self->_progress resignCurrent];
      [(GEOResourceLoader *)self _loadNextResourceFromNetwork];
      v11 = 0;
    }
LABEL_31:

    return;
  }
  uint64_t v20 = self->_log;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_DEBUG, "Finished loading all resources", buf, 2u);
  }
  [(GEOResourceLoader *)self _cleanup];
  if (self->_completionHandler)
  {
    BOOL v21 = (void *)MEMORY[0x18C120660]();
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;

    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__GEOResourceLoader__loadNextResourceFromNetwork__block_invoke;
    block[3] = &unk_1E53D7C50;
    block[4] = self;
    v32 = v21;
    id v5 = v21;
    dispatch_async(callbackQueue, block);
    v11 = v32;
    goto LABEL_31;
  }
}

- (void)_cleanup
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self->_inProgressResourceDownloads;
  inProgressResourceDownloads = self->_inProgressResourceDownloads;
  self->_inProgressResourceDownloads = 0;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = -[NSMapTable objectForKey:](v5, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * v9), (void)v12);
        [v10 cancel];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  resourcesToLoad = self->_resourcesToLoad;
  self->_resourcesToLoad = 0;
}

+ (Class)resourceLoadOperationClass
{
  return (Class)objc_opt_class();
}

void __49__GEOResourceLoader__loadNextResourceFromNetwork__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x18C1203C0]();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_authProxyURL, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_inProgressResourceDownloads, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_loadedResources, 0);
  objc_storeStrong((id *)&self->_resourceInfos, 0);
  objc_storeStrong((id *)&self->_proxyURL, 0);
  objc_storeStrong((id *)&self->_alternateURLs, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_resourcesToLoad, 0);
  objc_storeStrong((id *)&self->_additionalDirectoryToConsider, 0);

  objc_storeStrong((id *)&self->_directory, 0);
}

uint64_t __62__GEOResourceLoader_startWithCompletionHandler_callbackQueue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadResourcesFromDisk];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 152), "setTotalUnitCount:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "count"));
  if (![*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    [*(id *)(*(void *)(a1 + 32) + 152) setTotalUnitCount:1];
    [*(id *)(*(void *)(a1 + 32) + 152) setCompletedUnitCount:1];
  }
  v2 = *(void **)(a1 + 32);

  return [v2 _loadNextResourceFromNetwork];
}

- (GEOResourceLoader)initWithTargetDirectory:(id)a3 auditToken:(id)a4 baseURL:(id)a5 alternateURLs:(id)a6 proxyURL:(id)a7 resources:(id)a8 forceUpdateCheck:(BOOL)a9 maximumConcurrentLoads:(unint64_t)a10 additionalDirectoryToConsider:(id)a11 log:(id)a12 signpostID:(unint64_t)a13
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  id v49 = a4;
  id v54 = a5;
  id v53 = a6;
  obuint64_t j = a7;
  id v52 = a7;
  id v19 = a8;
  id v55 = a11;
  id v50 = a12;
  v65.receiver = self;
  v65.super_class = (Class)GEOResourceLoader;
  uint64_t v20 = [(GEOResourceLoader *)&v65 init];
  if (v20)
  {
    uint64_t v21 = [v56 copy];
    directory = v20->_directory;
    v20->_directory = (NSString *)v21;

    objc_storeStrong((id *)&v20->_log, a12);
    v20->_unint64_t signpostID = a13;
    char v64 = 0;
    long long v51 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v23 = [v51 fileExistsAtPath:v20->_directory isDirectory:&v64];
    if (v64) {
      char v24 = v23;
    }
    else {
      char v24 = 0;
    }
    if ((v24 & 1) == 0)
    {
      uint64_t v67 = *MEMORY[0x1E4F28330];
      v68[0] = &unk_1ED73DD80;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:&v67 count:1];
      [v51 createDirectoryAtPath:v20->_directory withIntermediateDirectories:1 attributes:v25 error:0];
    }
    int v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v19, "count"));
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v27 = v19;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v61 != v29) {
            objc_enumerationMutation(v27);
          }
          id v31 = [[GEOResourceInfo alloc] initWithResource:*(void *)(*((void *)&v60 + 1) + 8 * i)];
          [v26 addObject:v31];
        }
        uint64_t v28 = [v27 countByEnumeratingWithState:&v60 objects:v66 count:16];
      }
      while (v28);
    }

    objc_storeStrong((id *)&v20->_resourceInfos, v26);
    v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    loadedResources = v20->_loadedResources;
    v20->_loadedResources = v32;

    objc_storeStrong((id *)&v20->_auditToken, a4);
    uint64_t v34 = [v54 copy];
    baseURL = v20->_baseURL;
    v20->_baseURL = (NSURL *)v34;

    uint64_t v36 = [v53 copy];
    alternateURLs = v20->_alternateURLs;
    v20->_alternateURLs = (NSArray *)v36;

    uint64_t v38 = [v52 copy];
    proxyURL = v20->_proxyURL;
    v20->_proxyURL = (NSURL *)v38;

    v20->_forceUpdateCheck = a9;
    v20->_maxConcurrentLoads = a10;
    uint64_t v40 = [v55 copy];
    additionalDirectoryToConsider = v20->_additionalDirectoryToConsider;
    v20->_additionalDirectoryToConsider = (NSString *)v40;

    uint64_t v42 = geo_dispatch_queue_create();
    workQueue = v20->_workQueue;
    v20->_workQueue = (OS_dispatch_queue *)v42;

    uint64_t v44 = +[GEOReportedProgress progressWithTotalUnitCount:-1];
    progress = v20->_progress;
    v20->_progress = (GEOReportedProgress *)v44;

    objc_storeStrong((id *)&v20->_proxyURL, obj);
    objc_initWeak(&location, v20);
    long long v46 = v20->_progress;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __182__GEOResourceLoader_initWithTargetDirectory_auditToken_baseURL_alternateURLs_proxyURL_resources_forceUpdateCheck_maximumConcurrentLoads_additionalDirectoryToConsider_log_signpostID___block_invoke;
    v57[3] = &unk_1E53D7B90;
    objc_copyWeak(&v58, &location);
    [(GEOReportedProgress *)v46 setCancellationHandler:v57];
    objc_destroyWeak(&v58);
    objc_destroyWeak(&location);
  }
  return v20;
}

void __49__GEOResourceLoader__loadNextResourceFromNetwork__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = v4[21];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v39 = v3;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "Error processing resource: %{public}@", buf, 0xCu);
      long long v4 = *(void **)(a1 + 32);
    }
    uint64_t v6 = (void *)MEMORY[0x18C120660](v4[4]);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 32);
    *(void *)(v7 + 32) = 0;

    [*(id *)(a1 + 32) cancel];
    if (v6)
    {
      uint64_t v9 = *(NSObject **)(*(void *)(a1 + 32) + 144);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__GEOResourceLoader__loadNextResourceFromNetwork__block_invoke_65;
      block[3] = &unk_1E53D95B8;
      id v10 = v6;
      uint64_t v11 = *(void *)(a1 + 32);
      id v32 = v10;
      block[4] = v11;
      id v31 = v3;
      dispatch_async(v9, block);
    }
  }
  else
  {
    long long v12 = (void *)v4[14];
    long long v13 = [*(id *)(a1 + 40) resource];
    [v12 addObject:v13];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v14 = [*(id *)(a1 + 40) equivalentResources];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v20 = *(void **)(a1 + 32);
          uint64_t v21 = *(void *)(a1 + 40);
          id v33 = 0;
          char v22 = [v20 _establishHardLinkIfPossibleForResource:v19 toResource:v21 error:&v33];
          id v23 = v33;
          uint64_t v24 = *(void *)(a1 + 32);
          if (v22)
          {
            v25 = *(void **)(v24 + 112);
            int v26 = [v19 resource];
            [v25 addObject:v26];
          }
          else
          {
            id v27 = *(NSObject **)(v24 + 168);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              uint64_t v28 = v27;
              uint64_t v29 = [v19 name];
              *(_DWORD *)buf = 138543618;
              id v39 = v29;
              __int16 v40 = 2114;
              id v41 = v23;
              _os_log_impl(&dword_188D96000, v28, OS_LOG_TYPE_ERROR, "Failed to establish hard link for resource '%{public}@': %{public}@. Loading normally.", buf, 0x16u);

              uint64_t v24 = *(void *)(a1 + 32);
            }
            [*(id *)(v24 + 24) addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v16);
    }

    [*(id *)(a1 + 32) _loadNextResourceFromNetwork];
    id v3 = 0;
  }
}

uint64_t __108__GEOResourceLoader__writeResourceToDisk_withData_orTempFile_checksum_eTag_completionHandler_callbackQueue___block_invoke_69(void *a1)
{
  return (*(uint64_t (**)(void, void))(a1[6] + 16))(a1[6], a1[5]);
}

void __49__GEOResourceLoader__loadNextResourceFromNetwork__block_invoke_61(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void *)(v13 + 40);
  if (v14)
  {
    *(void *)(v13 + 40) = v14 - 1;
    uint64_t v13 = *(void *)(a1 + 32);
  }
  [*(id *)(v13 + 128) removeObjectForKey:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 48))
  {
    uint64_t v15 = *(id *)(*(void *)(a1 + 32) + 168);
    uint64_t v16 = v15;
    os_signpost_id_t v17 = *(void *)(a1 + 48);
    if (!v12)
    {
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v46 = [v10 length];
        _os_signpost_emit_with_name_impl(&dword_188D96000, v16, OS_SIGNPOST_INTERVAL_END, v17, "LoadResource", "Result=Success Size=%llu", buf, 0xCu);
      }

      if (*(unsigned char *)(*(void *)(a1 + 32) + 56)) {
        goto LABEL_37;
      }
LABEL_16:
      if (v9)
      {
        id v44 = 0;
        id v19 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v9 options:1 error:&v44];
        id v20 = v44;
        uint64_t v21 = v20;
        id v12 = 0;
        if (!v19)
        {
          id v12 = v20;
          char v22 = *(NSObject **)(*(void *)(a1 + 32) + 168);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v46 = (uint64_t)v9;
            __int16 v47 = 2112;
            id v48 = v12;
            _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_ERROR, "Could not read temp resource file at \"%@\": %@", buf, 0x16u);
          }
        }

        if (!v19) {
          goto LABEL_30;
        }
      }
      else
      {
        id v19 = v10;
        id v12 = 0;
        if (!v19)
        {
LABEL_30:

          uint64_t v18 = *(void *)(a1 + 32);
          if (v12) {
            goto LABEL_31;
          }
          long long v35 = *(void **)(a1 + 40);
          long long v36 = [v35 checksum];
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __49__GEOResourceLoader__loadNextResourceFromNetwork__block_invoke_2;
          v38[3] = &unk_1E53E33C0;
          long long v37 = *(void **)(a1 + 40);
          v38[4] = *(void *)(a1 + 32);
          id v39 = v37;
          [(id)v18 _writeResourceToDisk:v35 withData:v10 orTempFile:v9 checksum:v36 eTag:v11 completionHandler:v38 callbackQueue:*(void *)(*(void *)(a1 + 32) + 136)];

LABEL_37:
          id v12 = 0;
          goto LABEL_38;
        }
      }
      if (([*(id *)(a1 + 40) validateResource:v19 log:*(void *)(*(void *)(a1 + 32) + 168)] & 1) == 0)
      {
        if (v9)
        {
          id v23 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v43 = 0;
          char v24 = [v23 removeItemAtURL:v9 error:&v43];
          id v25 = v43;

          if ((v24 & 1) == 0)
          {
            int v26 = *(NSObject **)(*(void *)(a1 + 32) + 168);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v46 = (uint64_t)v9;
              __int16 v47 = 2112;
              id v48 = v25;
              _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_ERROR, "Unable to delete temp file at \"%@\": %@", buf, 0x16u);
            }
          }
        }
        uint64_t v27 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11];

        id v12 = (id)v27;
      }
      goto LABEL_30;
    }
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_188D96000, v16, OS_SIGNPOST_INTERVAL_END, v17, "LoadResource", "Result=Error", buf, 2u);
    }
  }
  uint64_t v18 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v18 + 56)) {
    goto LABEL_38;
  }
  if (!v12) {
    goto LABEL_16;
  }
LABEL_31:
  uint64_t v28 = *(NSObject **)(v18 + 168);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v46 = (uint64_t)v12;
    _os_log_impl(&dword_188D96000, v28, OS_LOG_TYPE_ERROR, "Error downloading resource: %{public}@", buf, 0xCu);
    uint64_t v18 = *(void *)(a1 + 32);
  }
  uint64_t v29 = (void *)MEMORY[0x18C120660](*(void *)(v18 + 32));
  uint64_t v30 = *(void *)(a1 + 32);
  id v31 = *(void **)(v30 + 32);
  *(void *)(v30 + 32) = 0;

  [*(id *)(a1 + 32) cancel];
  if (v29)
  {
    id v32 = *(NSObject **)(*(void *)(a1 + 32) + 144);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__GEOResourceLoader__loadNextResourceFromNetwork__block_invoke_64;
    block[3] = &unk_1E53D95B8;
    id v33 = v29;
    uint64_t v34 = *(void *)(a1 + 32);
    id v42 = v33;
    block[4] = v34;
    id v41 = v12;
    dispatch_async(v32, block);
  }
LABEL_38:
}

- (void)_writeResourceToDisk:(id)a3 withData:(id)a4 orTempFile:(id)a5 checksum:(id)a6 eTag:(id)a7 completionHandler:(id)a8 callbackQueue:(id)a9
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  unint64_t v16 = (unint64_t)a4;
  unint64_t v17 = (unint64_t)a5;
  id v29 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  directory = self->_directory;
  uint64_t v28 = v15;
  char v22 = [v15 name];
  id v23 = [(NSString *)directory stringByAppendingPathComponent:v22];

  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  char v24 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(v15) = [v24 fileExistsAtPath:v23];

  char v44 = (char)v15;
  if (v16 | v17 || v18 && *((unsigned char *)v42 + 24))
  {
    ++self->_numberOfCopiesInProgress;
    id v30 = (id)v17;
    uint64_t v38 = &v41;
    id v31 = v23;
    id v32 = self;
    id v33 = (id)v16;
    id v34 = v29;
    id v35 = v18;
    long long v36 = v20;
    id v37 = v19;
    geo_dispatch_async_qos();

    id v25 = &v30;
  }
  else
  {
    int v26 = self->_log;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = [v28 name];
      *(_DWORD *)buf = 138543362;
      uint64_t v46 = v27;
      _os_log_impl(&dword_188D96000, (os_log_t)v26, OS_LOG_TYPE_ERROR, "Can't write resource to disk -- no data/eTag (%{public}@)", buf, 0xCu);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __108__GEOResourceLoader__writeResourceToDisk_withData_orTempFile_checksum_eTag_completionHandler_callbackQueue___block_invoke;
    block[3] = &unk_1E53DA028;
    id v25 = &v40;
    id v40 = v19;
    dispatch_async(v20, block);
  }

  _Block_object_dispose(&v41, 8);
}

void __108__GEOResourceLoader__writeResourceToDisk_withData_orTempFile_checksum_eTag_completionHandler_callbackQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(a1 + 40)];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
    {
      id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v43 = 0;
      char v4 = [v3 removeItemAtURL:v2 error:&v43];
      id v5 = v43;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = v4 ^ 1;

      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
      {
        uint64_t v6 = *(NSObject **)(*(void *)(a1 + 48) + 168);
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          goto LABEL_14;
        }
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "Failed to remove existing file at URL: %@", (uint8_t *)&buf, 0xCu);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
          goto LABEL_14;
        }
      }
    }
    else
    {
      id v5 = 0;
    }
    id v9 = v5;
    id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v11 = *(void *)(a1 + 32);
    id v42 = v5;
    char v12 = [v10 moveItemAtURL:v11 toURL:v2 error:&v42];
    id v5 = v42;

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = *(NSObject **)(*(void *)(a1 + 48) + 168);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "Failed to move downloaded file to final URL: %@", (uint8_t *)&buf, 0xCu);
      }
    }
LABEL_14:

    if (v5) {
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  uint64_t v7 = *(void **)(a1 + 56);
  uint64_t v8 = *(void **)(a1 + 40);
  if (v7)
  {
    id v41 = 0;
    [v7 writeToFile:v8 options:268435457 error:&v41];
    id v5 = v41;
    if (v5) {
      goto LABEL_20;
    }
  }
  else
  {
    utimes((const char *)[v8 fileSystemRepresentation], 0);
  }
LABEL_17:
  uint64_t v14 = *(void **)(a1 + 40);
  id v40 = 0;
  if (v14)
  {
    id v15 = (void *)MEMORY[0x1E4F28CB8];
    id v16 = v14;
    unint64_t v17 = [v15 defaultManager];
    uint64_t v18 = *MEMORY[0x1E4F28370];
    v44[0] = *MEMORY[0x1E4F28330];
    v44[1] = v18;
    uint64_t v19 = *MEMORY[0x1E4F28378];
    *(void *)&long long buf = &unk_1ED73DD98;
    *((void *)&buf + 1) = v19;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:v44 count:2];
    [v17 setAttributes:v20 ofItemAtPath:v16 error:&v40];

    uint64_t v14 = v40;
  }
  id v5 = v14;
LABEL_20:
  if ([*(id *)(a1 + 64) length])
  {
    uint64_t v21 = *(void **)(a1 + 40);
    char v22 = *(void **)(a1 + 64);
    id v39 = 0;
    BOOL v23 = GEOSetSHA1OnExtendedAttribute(v21, v22, &v39);
    id v24 = v39;
    if (!v23)
    {
      id v25 = *(NSObject **)(*(void *)(a1 + 48) + 168);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v24;
        _os_log_impl(&dword_188D96000, v25, OS_LOG_TYPE_ERROR, "Failed to write checksum into extended attributes: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
    if (!*(void *)(a1 + 56) && v24)
    {
      id v26 = v24;

      id v5 = v26;
    }
  }
  if ([*(id *)(a1 + 72) length])
  {
    uint64_t v27 = *(void **)(a1 + 40);
    uint64_t v28 = *(void **)(a1 + 72);
    id v38 = 0;
    BOOL v29 = GEOSetETagOnExtendedAttribute(v27, v28, &v38);
    id v30 = v38;
    if (!v29)
    {
      id v31 = *(NSObject **)(*(void *)(a1 + 48) + 168);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v30;
        _os_log_impl(&dword_188D96000, v31, OS_LOG_TYPE_ERROR, "Failed to write eTag into extended attributes: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
    if (!*(void *)(a1 + 56) && !v5 && v30) {
      id v5 = v30;
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__GEOResourceLoader__writeResourceToDisk_withData_orTempFile_checksum_eTag_completionHandler_callbackQueue___block_invoke_69;
  block[3] = &unk_1E53D8E18;
  void block[4] = *(void *)(a1 + 48);
  id v32 = *(NSObject **)(a1 + 80);
  id v33 = *(id *)(a1 + 88);
  id v36 = v5;
  id v37 = v33;
  id v34 = v5;
  dispatch_async(v32, block);
}

- (GEOResourceLoader)init
{
  result = (GEOResourceLoader *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

void __182__GEOResourceLoader_initWithTargetDirectory_auditToken_baseURL_alternateURLs_proxyURL_resources_forceUpdateCheck_maximumConcurrentLoads_additionalDirectoryToConsider_log_signpostID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

- (NSProgress)progress
{
  return [(GEOReportedProgress *)self->_progress progress];
}

- (BOOL)_establishHardLinkIfPossibleForResource:(id)a3 toResource:(id)a4 error:(id *)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  directory = self->_directory;
  uint64_t v11 = [v9 name];
  char v12 = [(NSString *)directory stringByAppendingPathComponent:v11];

  uint64_t v13 = self->_directory;
  uint64_t v14 = [v8 name];
  id v15 = [(NSString *)v13 stringByAppendingPathComponent:v14];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v17 = log;
    uint64_t v18 = [v8 name];
    uint64_t v19 = [v9 name];
    *(_DWORD *)long long buf = 138478083;
    id v45 = v18;
    __int16 v46 = 2113;
    uint64_t v47 = v19;
    _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_DEBUG, "Resource '%{private}@' should be identical to '%{private}@'. Checking...", buf, 0x16u);
  }
  id v20 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v21 = [v20 fileExistsAtPath:v15];

  if (v21)
  {
    char v22 = self->_log;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      BOOL v23 = v22;
      id v24 = [v8 name];
      *(_DWORD *)long long buf = 138477827;
      id v45 = v24;
      _os_log_impl(&dword_188D96000, v23, OS_LOG_TYPE_DEBUG, "Found matching resource in destination directory for '%{private}@'", buf, 0xCu);

      char v22 = self->_log;
    }
    id v25 = v15;
    id v26 = v22;
    uint64_t v27 = GEOGetSHA1FromExtendedAttributes(v25);
    id v41 = a5;
    if ([v27 length])
    {
      id v28 = v27;
    }
    else
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138477827;
        id v45 = v25;
        _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_DEBUG, "Checksum not found in extended attributes for '%{private}@'. Calculating instead...", buf, 0xCu);
      }
      BOOL v29 = GEOCalculateSHA1ForFile(v25);

      id v43 = 0;
      BOOL v30 = GEOSetSHA1OnExtendedAttribute(v25, v29, &v43);
      id v31 = v43;
      if (!v30 && os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        id v45 = v31;
        _os_log_impl(&dword_188D96000, v26, OS_LOG_TYPE_ERROR, "Failed to write checksum into extended attributes: %{public}@", buf, 0xCu);
      }
      id v28 = v29;
    }
    id v32 = [v9 checksum];
    char v33 = [v32 isEqualToData:v28];

    if (v33)
    {
      id v34 = 0;
      a5 = v41;
      goto LABEL_22;
    }
    id v35 = self->_log;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      id v36 = v35;
      id v37 = [v8 name];
      *(_DWORD *)long long buf = 138543362;
      id v45 = v37;
      _os_log_impl(&dword_188D96000, v36, OS_LOG_TYPE_ERROR, "Incorrect checksum for cached resource %{public}@", buf, 0xCu);
    }
    id v38 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v38 removeItemAtPath:v25 error:0];

    a5 = v41;
  }
  id v39 = self->_log;
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138478083;
    id v45 = v15;
    __int16 v46 = 2113;
    uint64_t v47 = v12;
    _os_log_impl(&dword_188D96000, v39, OS_LOG_TYPE_DEBUG, "Establishing hard link from '%{private}@' to '%{private}@'", buf, 0x16u);
  }
  id v28 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v42 = 0;
  [v28 linkItemAtPath:v12 toPath:v15 error:&v42];
  id v34 = v42;
LABEL_22:

  if (a5) {
    *a5 = v34;
  }

  return v34 == 0;
}

uint64_t __43__GEOResourceLoader__loadResourcesFromDisk__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v12 = [v11 fileExistsAtPath:v9];

  if (!v12) {
    goto LABEL_23;
  }
  uint64_t v13 = *(NSObject **)(*(void *)(a1 + 32) + 168);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *(void **)(a1 + 40);
    id v15 = v13;
    id v16 = [v14 name];
    *(_DWORD *)long long buf = 138478083;
    id v51 = v10;
    __int16 v52 = 2113;
    id v53 = v16;
    _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_DEBUG, "Found matching resource in %{private}@ directory for '%{private}@'", buf, 0x16u);

    uint64_t v13 = *(NSObject **)(*(void *)(a1 + 32) + 168);
  }
  if (![*(id *)(a1 + 40) validateResourceAtPath:v9 useExtendedAttrs:a5 log:v13]) {
    goto LABEL_23;
  }
  unint64_t v17 = *(void **)(a1 + 32);
  uint64_t v18 = v17[21];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = *(void **)(a1 + 40);
    id v20 = v18;
    int v21 = [v19 name];
    *(_DWORD *)long long buf = 138478083;
    id v51 = v10;
    __int16 v52 = 2113;
    id v53 = v21;
    _os_log_impl(&dword_188D96000, v20, OS_LOG_TYPE_DEBUG, "Using resource from %{private}@ directory: '%{private}@'", buf, 0x16u);

    unint64_t v17 = *(void **)(a1 + 32);
  }
  if ([v17 _copyResource:*(void *)(a1 + 40) fromPath:v9 allowCreatingHardLink:a4 error:0])
  {
    id v42 = v10;
    id v43 = v9;
    if (([*(id *)(a1 + 40) shouldCheckForUpdateForResourceAtPath:v9 useExtendedAttrs:a5 forceUpdateCheck:*(unsigned __int8 *)(*(void *)(a1 + 32) + 88) log:*(void *)(*(void *)(a1 + 32) + 168)] & 1) == 0)
    {
      [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
      char v22 = *(void **)(*(void *)(a1 + 32) + 112);
      BOOL v23 = [*(id *)(a1 + 40) resource];
      [v22 addObject:v23];
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v24 = [*(id *)(a1 + 40) equivalentResources];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v46 != v27) {
            objc_enumerationMutation(v24);
          }
          BOOL v29 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          BOOL v30 = *(void **)(a1 + 32);
          uint64_t v31 = *(void *)(a1 + 40);
          id v44 = 0;
          char v32 = [v30 _establishHardLinkIfPossibleForResource:v29 toResource:v31 error:&v44];
          id v33 = v44;
          uint64_t v34 = *(void *)(a1 + 32);
          if (v32)
          {
            id v35 = *(void **)(v34 + 112);
            id v36 = [v29 resource];
            [v35 addObject:v36];
          }
          else
          {
            id v37 = *(NSObject **)(v34 + 168);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              id v38 = v37;
              id v39 = [v29 name];
              *(_DWORD *)long long buf = 138543618;
              id v51 = v39;
              __int16 v52 = 2114;
              id v53 = v33;
              _os_log_impl(&dword_188D96000, v38, OS_LOG_TYPE_ERROR, "Failed to establish hard link for resource '%{public}@': %{public}@. Loading normally.", buf, 0x16u);

              uint64_t v34 = *(void *)(a1 + 32);
            }
            [*(id *)(v34 + 24) addObject:v29];
            [*(id *)(a1 + 48) addObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v26);
    }

    uint64_t v40 = 1;
    id v10 = v42;
    id v9 = v43;
  }
  else
  {
LABEL_23:
    uint64_t v40 = 0;
  }

  return v40;
}

void __49__GEOResourceLoader__loadNextResourceFromNetwork__block_invoke_64(uint64_t a1)
{
  v2 = (void *)MEMORY[0x18C1203C0]();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __49__GEOResourceLoader__loadNextResourceFromNetwork__block_invoke_65(uint64_t a1)
{
  v2 = (void *)MEMORY[0x18C1203C0]();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __108__GEOResourceLoader__writeResourceToDisk_withData_orTempFile_checksum_eTag_completionHandler_callbackQueue___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)_copyResource:(id)a3 fromPath:(id)a4 allowCreatingHardLink:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  v50[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  directory = self->_directory;
  uint64_t v13 = [v10 name];
  uint64_t v14 = [(NSString *)directory stringByAppendingPathComponent:v13];

  id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v15 fileExistsAtPath:v14]) {
    [v15 removeItemAtPath:v14 error:0];
  }
  if (v7)
  {
    id v46 = 0;
    char v16 = [v15 linkItemAtPath:v11 toPath:v14 error:&v46];
    id v17 = v46;
    if (v16)
    {
      LOBYTE(v18) = 1;
      goto LABEL_25;
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543874;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v14;
      __int16 v48 = 2114;
      id v49 = v17;
      _os_log_impl(&dword_188D96000, log, OS_LOG_TYPE_ERROR, "Failed to create hard link from '%{public}@' to '%{public}@': %{public}@", buf, 0x20u);
    }
  }
  else
  {
    id v17 = 0;
  }
  id v20 = v17;
  id v45 = v17;
  int v18 = [v15 copyItemAtPath:v11 toPath:v14 error:&v45];
  id v17 = v45;

  if (v18)
  {
    id v44 = v17;
    id v21 = v14;
    if (v21)
    {
      [MEMORY[0x1E4F28CB8] defaultManager];
      id v41 = v10;
      id v22 = v11;
      v24 = BOOL v23 = a6;
      uint64_t v25 = *MEMORY[0x1E4F28370];
      v50[0] = *MEMORY[0x1E4F28330];
      v50[1] = v25;
      uint64_t v26 = *MEMORY[0x1E4F28378];
      *(void *)long long buf = &unk_1ED73DD98;
      *(void *)&buf[8] = v26;
      uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v50 count:2];
      [v24 setAttributes:v27 ofItemAtPath:v21 error:&v44];

      a6 = v23;
      id v11 = v22;
      id v10 = v41;
    }

    id v28 = v44;
    id v17 = v28;
  }
  else
  {
    BOOL v29 = self->_log;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      BOOL v30 = v29;
      uint64_t v31 = [v10 name];
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v31;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v17;
      _os_log_impl(&dword_188D96000, v30, OS_LOG_TYPE_ERROR, "Failed to copy resource '%{public}@': %{public}@", buf, 0x16u);
    }
  }
  char v32 = [v10 checksum];
  uint64_t v33 = [v32 length];

  if (v33)
  {
    id v42 = v11;
    uint64_t v34 = a6;
    id v35 = [v10 checksum];
    id v43 = 0;
    BOOL v36 = GEOSetSHA1OnExtendedAttribute(v14, v35, &v43);
    id v37 = v43;

    if (!v36)
    {
      id v38 = self->_log;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v37;
        _os_log_impl(&dword_188D96000, v38, OS_LOG_TYPE_ERROR, "Failed to write checksum into extended attributes: %{public}@", buf, 0xCu);
      }
    }

    a6 = v34;
    id v11 = v42;
  }
  if (a6) {
    char v39 = v18;
  }
  else {
    char v39 = 1;
  }
  if ((v39 & 1) == 0)
  {
    id v17 = v17;
    LOBYTE(v18) = 0;
    *a6 = v17;
  }
LABEL_25:

  return v18;
}

- (void)cancel
{
  self->_canceled = 1;
  [(GEOReportedProgress *)self->_progress cancel];
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__GEOResourceLoader_cancel__block_invoke;
  block[3] = &unk_1E53D79D8;
  void block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __27__GEOResourceLoader_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  char v4 = *(void **)(a1 + 32);

  return [v4 _cleanup];
}

+ (BOOL)validateUnpackedResource:(id)a3 at:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = [v6 path];
  int v9 = [v7 fileExistsAtPath:v8];

  if (v9)
  {
    id v10 = [v6 URLByDeletingPathExtension];
    id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v12 = [v10 path];
    int v13 = [v11 fileExistsAtPath:v12];

    if (v13)
    {
      if ([v5 validationMethod] == 1)
      {
        uint64_t v14 = [v6 path];
        id v15 = GEOGetETagFromExtendedAttributes(v14);

        char v16 = [v10 path];
        id v17 = GEOGetETagFromExtendedAttributes(v16);

        int v18 = v15;
        uint64_t v19 = v17;
      }
      else
      {
        id v20 = [v10 path];
        id v15 = GEOGetSHA1FromExtendedAttributes(v20);

        int v18 = [v5 checksum];
        id v17 = v18;
        uint64_t v19 = v15;
      }
      LOBYTE(v9) = [v18 isEqual:v19];
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

+ (id)unpackResource:(id)a3 at:(id)a4 log:(id)a5 error:(id *)a6
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  int v12 = a5;
  int v13 = [v11 URLByDeletingPathExtension];
  if (![a1 validateUnpackedResource:v10 at:v11])
  {
    uint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v15 = [v13 URLByAppendingPathExtension:@"unpack-folder"];
    char v16 = [v15 path];
    int v17 = [v14 fileExistsAtPath:v16];

    if (v17)
    {
      id v68 = 0;
      char v18 = [v14 removeItemAtURL:v15 error:&v68];
      id v19 = v68;
      id v20 = v19;
      if ((v18 & 1) == 0)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          id v70 = v15;
          __int16 v71 = 2112;
          id v72 = v20;
          _os_log_error_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "Unable to remove old temporary path \"%@\" - %@", buf, 0x16u);
        }
        id v43 = 0;
        if (!a6) {
          goto LABEL_42;
        }
        goto LABEL_36;
      }
      id v57 = a6;
      id v21 = v19;
    }
    else
    {
      id v57 = a6;
      id v21 = 0;
    }
    id v58 = v14;
    if ([v10 validationMethod] != 1)
    {
      uint64_t v33 = v10;
      uint64_t v34 = v13;
      id v24 = v12;
      id v56 = v33;
      id v35 = [v33 checksum];
      uint64_t v36 = [v35 length];

      if (!v36)
      {
        id v43 = 0;
        id v50 = 0;
        int v12 = v24;
        int v13 = v34;
        id v10 = v56;
        uint64_t v14 = v58;
        goto LABEL_43;
      }
      id v64 = v21;
      int v12 = v24;
      BOOL v37 = +[GEOUnarchiver unarchiveDataAtURL:v11 toURL:v15 log:v24 error:&v64];
      id v20 = v64;

      if (v37)
      {
        id v38 = [v15 path];
        char v39 = [v56 checksum];
        id v63 = v20;
        BOOL v40 = GEOSetSHA1OnExtendedAttribute(v38, v39, &v63);
        id v27 = v63;

        a6 = v57;
        if (v40)
        {
          char v32 = v34;
          id v10 = v56;
          goto LABEL_16;
        }
        int v12 = v24;
        int v13 = v34;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          id v70 = v15;
          __int16 v71 = 2112;
          id v72 = v27;
          _os_log_error_impl(&dword_188D96000, v24, OS_LOG_TYPE_ERROR, "Unable to set sha1 on temporary path \"%@\" - %@", buf, 0x16u);
        }
        id v43 = 0;
        id v20 = v27;
      }
      else
      {
        int v13 = v34;
        a6 = v57;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412802;
          id v70 = v11;
          __int16 v71 = 2112;
          id v72 = v15;
          __int16 v73 = 2112;
          id v74 = v20;
          _os_log_error_impl(&dword_188D96000, v24, OS_LOG_TYPE_ERROR, "Unable to unarchive resource \"%@\" to \"%@\" - %@", buf, 0x20u);
        }
        id v43 = 0;
      }
      id v10 = v56;
LABEL_41:
      uint64_t v14 = v58;
      if (a6) {
        goto LABEL_36;
      }
      goto LABEL_42;
    }
    id v22 = [v11 path];
    BOOL v23 = GEOGetETagFromExtendedAttributes(v22);

    if (![v23 length])
    {

      id v43 = 0;
      id v50 = 0;
      goto LABEL_43;
    }
    id v24 = v12;
    uint64_t v25 = [v11 path];
    id v67 = v21;
    uint64_t v26 = +[GEOSignedResource loadResourceAtPath:v25 error:&v67];
    id v27 = v67;

    if (v26)
    {
      uint64_t v54 = v13;
      id v66 = v27;
      BOOL v28 = +[GEOUnarchiver unarchiveData:v26 toURL:v15 log:v24 error:&v66];
      id v29 = v66;

      if (v28)
      {
        BOOL v30 = [v15 path];
        id v65 = v29;
        BOOL v31 = GEOSetETagOnExtendedAttribute(v30, v23, &v65);
        id v27 = v65;

        if (v31)
        {

          char v32 = v54;
          a6 = v57;
LABEL_16:
          id v41 = [v32 path];
          int v42 = [v58 fileExistsAtPath:v41];

          id v55 = v32;
          if (!v42)
          {
            id v43 = 0;
            int v12 = v24;
            uint64_t v14 = v58;
            goto LABEL_48;
          }
          id v43 = [v32 URLByAppendingPathExtension:@"exchange-folder"];
          id v44 = [v43 path];
          int v45 = [v58 fileExistsAtPath:v44];

          if (!v45)
          {
LABEL_20:
            int v12 = v24;
            id v61 = v27;
            uint64_t v14 = v58;
            char v47 = objc_msgSend(v58, "moveItemAtURL:toURL:error:", v55, v43, &v61, v55);
            id v20 = v61;

            if ((v47 & 1) == 0)
            {
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412802;
                int v13 = v55;
                id v70 = v55;
                __int16 v71 = 2112;
                id v72 = v43;
                __int16 v73 = 2112;
                id v74 = v20;
LABEL_67:
                _os_log_error_impl(&dword_188D96000, v12, OS_LOG_TYPE_ERROR, "Unable move \"%@\" to \"%@\" - %@", buf, 0x20u);
                if (!a6) {
                  goto LABEL_42;
                }
LABEL_36:
                id v48 = v20;
                id v49 = a6;
                id v21 = v48;
                id v50 = 0;
                id *v49 = v48;
LABEL_43:

                goto LABEL_44;
              }
              goto LABEL_59;
            }
            id v27 = v20;
LABEL_48:
            id v60 = v27;
            char v52 = objc_msgSend(v14, "moveItemAtURL:toURL:error:", v15, v55, &v60, v55);
            id v20 = v60;

            if (v52)
            {
              if (v43)
              {
                id v59 = v20;
                char v53 = [v14 removeItemAtURL:v43 error:&v59];
                id v21 = v59;

                if ((v53 & 1) == 0 && os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)long long buf = 138412546;
                  id v70 = v43;
                  __int16 v71 = 2112;
                  id v72 = v21;
                  _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_DEFAULT, "Unable remove \"%@\" - %@", buf, 0x16u);
                }
              }
              else
              {
                id v21 = v20;
              }
              int v13 = v55;
              id v50 = v55;
              goto LABEL_43;
            }
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412802;
              id v70 = v15;
              __int16 v71 = 2112;
              int v13 = v55;
              id v72 = v55;
              __int16 v73 = 2112;
              id v74 = v20;
              goto LABEL_67;
            }
LABEL_59:
            int v13 = v55;
            if (a6) {
              goto LABEL_36;
            }
            goto LABEL_42;
          }
          id v62 = v27;
          char v46 = [v58 removeItemAtURL:v43 error:&v62];
          id v20 = v62;

          if (v46)
          {
            id v27 = v20;
            goto LABEL_20;
          }
          int v12 = v24;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412546;
            id v70 = v43;
            __int16 v71 = 2112;
            id v72 = v20;
            _os_log_error_impl(&dword_188D96000, v24, OS_LOG_TYPE_ERROR, "Unable remove old swap path \"%@\" - %@", buf, 0x16u);
          }
          int v13 = v55;
          goto LABEL_41;
        }
        int v12 = v24;
        a6 = v57;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          id v70 = v15;
          __int16 v71 = 2112;
          id v72 = v27;
          _os_log_error_impl(&dword_188D96000, v24, OS_LOG_TYPE_ERROR, "Unable to set etag on temporary path \"%@\" - %@", buf, 0x16u);
        }
        int v13 = v54;
        uint64_t v14 = v58;
LABEL_35:

        id v43 = 0;
        id v20 = v27;
        if (a6) {
          goto LABEL_36;
        }
LABEL_42:
        id v50 = 0;
        id v21 = v20;
        goto LABEL_43;
      }
      int v12 = v24;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412802;
        id v70 = v11;
        __int16 v71 = 2112;
        id v72 = v15;
        __int16 v73 = 2112;
        id v74 = v29;
        _os_log_error_impl(&dword_188D96000, v24, OS_LOG_TYPE_ERROR, "Unable to unarchive resource \"%@\" to \"%@\" - %@", buf, 0x20u);
      }
      id v27 = v29;
    }
    else
    {
      int v12 = v24;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        id v70 = v11;
        __int16 v71 = 2112;
        id v72 = v27;
        _os_log_error_impl(&dword_188D96000, v24, OS_LOG_TYPE_ERROR, "Unable to load data from resource at \"%@\" - %@", buf, 0x16u);
      }
    }
    a6 = v57;
    uint64_t v14 = v58;
    goto LABEL_35;
  }
  id v50 = v13;
  id v21 = 0;
LABEL_44:

  return v50;
}

- (BOOL)requiresWiFi
{
  return self->_requiresWiFi;
}

- (void)setRequiresWiFi:(BOOL)a3
{
  self->_requiresWiFuint64_t i = a3;
}

- (BOOL)preferDirectNetworking
{
  return self->_preferDirectNetworking;
}

- (void)setPreferDirectNetworking:(BOOL)a3
{
  self->_preferDirectNetworking = a3;
}

@end