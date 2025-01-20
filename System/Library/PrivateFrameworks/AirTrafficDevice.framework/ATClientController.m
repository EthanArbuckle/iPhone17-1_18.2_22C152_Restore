@interface ATClientController
+ (id)controllerForDataclasses:(id)a3;
+ (id)sharedInstance;
- (BOOL)_loadClientsForDataclasses:(id)a3;
- (id)allClients;
- (id)clientForDataclass:(id)a3;
- (id)queueForClient:(id)a3;
- (void)_snapShotWithContext:(id)a3 events:(id)a4;
- (void)dealloc;
- (void)resetQueues;
- (void)waitToDrain;
@end

@implementation ATClientController

- (void).cxx_destruct
{
}

- (void)_snapShotWithContext:(id)a3 events:(id)a4
{
}

- (BOOL)_loadClientsForDataclasses:(id)a3
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F1C000uLL;
  v59 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", a3);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v62 = [obj countByEnumeratingWithState:&v82 objects:v107 count:16];
  if (v62)
  {
    uint64_t v61 = *(void *)v83;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v83 != v61) {
          objc_enumerationMutation(obj);
        }
        uint64_t v64 = v5;
        uint64_t v6 = *(void *)(*((void *)&v82 + 1) + 8 * v5);
        v7 = MSVSystemRootDirectory();
        v8 = [v7 stringByAppendingPathComponent:v6];
        v9 = [v8 stringByAppendingPathComponent:@"SyncBundles"];
        v10 = [v9 stringByResolvingSymlinksInPath];

        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        v11 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v77 = 0;
        v12 = [v11 contentsOfDirectoryAtPath:v10 error:&v77];
        id v63 = v77;

        id v69 = v12;
        uint64_t v71 = [v12 countByEnumeratingWithState:&v78 objects:v106 count:16];
        if (v71)
        {
          uint64_t v70 = *(void *)v79;
          v68 = v10;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v79 != v70) {
                objc_enumerationMutation(v69);
              }
              uint64_t v14 = *(void *)(*((void *)&v78 + 1) + 8 * v13);
              v15 = [*(id *)(v3 + 2504) date];
              v16 = [v10 stringByAppendingPathComponent:v14];
              v17 = [v16 pathExtension];
              int v18 = [v17 isEqualToString:@"syncBundle"];

              if (v18)
              {
                v19 = _ATLogCategoryFramework();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v102 = (objc_class *)v16;
                  _os_log_impl(&dword_1D9A2D000, v19, OS_LOG_TYPE_DEFAULT, "Loading bundle at path '%{public}@'", buf, 0xCu);
                }

                v20 = (void *)[objc_alloc(MEMORY[0x1E4F28B50]) initWithPath:v16];
                v21 = v20;
                if (v20)
                {
                  id v76 = 0;
                  int v22 = [v20 loadAndReturnError:&v76];
                  id v23 = v76;
                  if (v22)
                  {
                    v24 = (objc_class *)[v21 principalClass];
                    if (v24)
                    {
                      v25 = v24;
                      if ([(objc_class *)v24 conformsToProtocol:&unk_1F33F05F0])
                      {
                        v65 = v25;
                        v66 = v23;
                        id v26 = objc_alloc_init(v25);
                        long long v72 = 0u;
                        long long v73 = 0u;
                        long long v74 = 0u;
                        long long v75 = 0u;
                        v27 = [v26 supportedDataclasses];
                        uint64_t v28 = [v27 countByEnumeratingWithState:&v72 objects:v105 count:16];
                        if (v28)
                        {
                          uint64_t v29 = v28;
                          uint64_t v30 = *(void *)v73;
                          do
                          {
                            for (uint64_t i = 0; i != v29; ++i)
                            {
                              if (*(void *)v73 != v30) {
                                objc_enumerationMutation(v27);
                              }
                              [v4 setObject:v26 forKey:*(void *)(*((void *)&v72 + 1) + 8 * i)];
                            }
                            uint64_t v29 = [v27 countByEnumeratingWithState:&v72 objects:v105 count:16];
                          }
                          while (v29);
                        }

                        v32 = _ATLogCategoryFramework();
                        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                        {
                          v33 = [MEMORY[0x1E4F1C9C8] date];
                          [v33 timeIntervalSinceDate:v15];
                          *(_DWORD *)buf = 138543618;
                          v102 = v65;
                          __int16 v103 = 2048;
                          id v104 = v34;
                          _os_log_impl(&dword_1D9A2D000, v32, OS_LOG_TYPE_DEFAULT, "Loaded bundle %{public}@ in %.2fs", buf, 0x16u);
                        }
                        unint64_t v3 = 0x1E4F1C000;
                        goto LABEL_40;
                      }
                      v36 = v23;
                      v37 = NSStringFromProtocol((Protocol *)&unk_1F33F05F0);
                      v44 = _ATLogCategoryFramework();
                      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543618;
                        v102 = (objc_class *)v16;
                        __int16 v103 = 2114;
                        id v104 = v37;
                        _os_log_impl(&dword_1D9A2D000, v44, OS_LOG_TYPE_ERROR, "unable to load sync bundle at path %{public}@: principal class does not implement %{public}@ protocol", buf, 0x16u);
                      }

                      v38 = [NSString stringWithFormat:@"principal class does not implement %@ protocol", v37];
                      v98 = @"bundlePath";
                      v99 = v16;
                      v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
                      v100 = v43;
                      v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
                      [(ATClientController *)self _snapShotWithContext:v38 events:v45];

                      unint64_t v3 = 0x1E4F1C000;
LABEL_38:

LABEL_39:
                      [v21 unload];
LABEL_40:

                      v10 = v68;
                      goto LABEL_41;
                    }
                    v36 = v23;
                    v42 = _ATLogCategoryFramework();
                    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543362;
                      v102 = (objc_class *)v16;
                      _os_log_impl(&dword_1D9A2D000, v42, OS_LOG_TYPE_ERROR, "unable to load sync bundle at path %{public}@: no principal class", buf, 0xCu);
                    }

                    v37 = [NSString stringWithFormat:@"no principal class"];
                    v95 = @"bundlePath";
                    v96 = v16;
                    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
                    v97 = v38;
                    v40 = (void *)MEMORY[0x1E4F1C978];
                    v41 = &v97;
                  }
                  else
                  {
                    v39 = _ATLogCategoryFramework();
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543618;
                      v102 = (objc_class *)v16;
                      __int16 v103 = 2114;
                      id v104 = v23;
                      _os_log_impl(&dword_1D9A2D000, v39, OS_LOG_TYPE_ERROR, "unable to load sync bundle at path %{public}@: error %{public}@", buf, 0x16u);
                    }

                    v37 = [NSString stringWithFormat:@"unable to load sync bundle"];
                    v92[0] = @"bundlePath";
                    v92[1] = @"loadError";
                    v93[0] = v16;
                    v93[1] = v23;
                    v36 = v23;
                    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:2];
                    v94 = v38;
                    v40 = (void *)MEMORY[0x1E4F1C978];
                    v41 = &v94;
                  }
                  v43 = [v40 arrayWithObjects:v41 count:1];
                  [(ATClientController *)self _snapShotWithContext:v37 events:v43];
                  goto LABEL_38;
                }
                v35 = _ATLogCategoryFramework();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v102 = (objc_class *)v16;
                  _os_log_impl(&dword_1D9A2D000, v35, OS_LOG_TYPE_ERROR, "unable to load sync bundle at path %{public}@, filesystem error", buf, 0xCu);
                }

                v36 = [NSString stringWithFormat:@"filesystem error"];
                v89 = @"bundlePath";
                v90 = v16;
                v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
                v91 = v37;
                v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];
                [(ATClientController *)self _snapShotWithContext:v36 events:v38];
                goto LABEL_39;
              }
LABEL_41:

              ++v13;
            }
            while (v13 != v71);
            uint64_t v46 = [v69 countByEnumeratingWithState:&v78 objects:v106 count:16];
            uint64_t v71 = v46;
          }
          while (v46);
        }

        if (v63)
        {
          uint64_t v47 = [v63 code];
          v48 = _ATLogCategoryFramework();
          v49 = v48;
          if (v47 == 260)
          {
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v102 = (objc_class *)v63;
              _os_log_impl(&dword_1D9A2D000, v49, OS_LOG_TYPE_DEFAULT, "Encountered error loading sync bundles: %{public}@. Ignoring", buf, 0xCu);
            }
          }
          else
          {
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v102 = (objc_class *)v63;
              _os_log_impl(&dword_1D9A2D000, v49, OS_LOG_TYPE_ERROR, "Encountered error loading sync bundles: %{public}@", buf, 0xCu);
            }

            v49 = [NSString stringWithFormat:@"error loading sync bundles"];
            v86 = @"error";
            id v87 = v63;
            v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
            v88 = v50;
            v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v88 count:1];
            [(ATClientController *)self _snapShotWithContext:v49 events:v51];
          }
        }

        uint64_t v5 = v64 + 1;
      }
      while (v64 + 1 != v62);
      uint64_t v62 = [obj countByEnumeratingWithState:&v82 objects:v107 count:16];
    }
    while (v62);
  }

  if (![v4 count])
  {
    v52 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9A2D000, v52, OS_LOG_TYPE_ERROR, "found 0 sync bundle clients.", buf, 2u);
    }

    v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:a2 object:self file:@"ATClientController.m" lineNumber:196 description:@"Failed to load sync bundles"];
  }
  objc_storeStrong((id *)&self->_clientMap, v4);
  [(ATClientController *)self resetQueues];
  v54 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    v55 = [*(id *)(v3 + 2504) date];
    [v55 timeIntervalSinceDate:v59];
    *(_DWORD *)buf = 134217984;
    v102 = v56;
    _os_log_impl(&dword_1D9A2D000, v54, OS_LOG_TYPE_DEFAULT, "Loaded all clients in %.2fs", buf, 0xCu);
  }
  return 1;
}

- (id)queueForClient:(id)a3
{
  id v5 = a3;
  queueMap = self->_queueMap;
  if (!queueMap)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"ATClientController.m" lineNumber:110 description:@"We have no queues!"];

    queueMap = self->_queueMap;
  }
  v7 = CFDictionaryGetValue(queueMap, v5);

  return v7;
}

- (void)waitToDrain
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  CFIndex Count = CFDictionaryGetCount(self->_queueMap);
  id v4 = (const void **)&v9[-((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0)];
  if ((unint64_t)(8 * Count) >= 0x200) {
    size_t v5 = 512;
  }
  else {
    size_t v5 = 8 * Count;
  }
  bzero(&v9[-((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0)], v5);
  CFDictionaryGetKeysAndValues(self->_queueMap, 0, v4);
  uint64_t v6 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9A2D000, v6, OS_LOG_TYPE_DEFAULT, "Waiting for queues to drain...", buf, 2u);
  }

  for (CFIndex i = 0; CFDictionaryGetCount(self->_queueMap) > i; ++i)
    dispatch_barrier_sync((dispatch_queue_t)v4[i], &__block_literal_global_13_2649);
  v8 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D9A2D000, v8, OS_LOG_TYPE_DEFAULT, "Queues drained.", v9, 2u);
  }
}

- (void)resetQueues
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_queueMap)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    unint64_t v3 = [(NSDictionary *)self->_clientMap allValues];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v22;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = CFDictionaryGetValue(self->_queueMap, *(const void **)(*((void *)&v21 + 1) + 8 * v7));
          dispatch_queue_set_specific(v8, @"disabled_queue", (void *)1, 0);

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v5);
    }

    CFRelease(self->_queueMap);
    self->_queueMap = 0;
  }
  self->_queueMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v9 = [(ATClientController *)self allClients];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(const void **)(*((void *)&v17 + 1) + 8 * v13);
        id v15 = [NSString stringWithFormat:@"com.apple.atc-%@", objc_opt_class()];
        dispatch_queue_t v16 = dispatch_queue_create((const char *)[v15 UTF8String], 0);

        CFDictionaryAddValue(self->_queueMap, v14, v16);
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v11);
  }
}

- (id)allClients
{
  return [(NSDictionary *)self->_clientMap allValues];
}

- (id)clientForDataclass:(id)a3
{
  return [(NSDictionary *)self->_clientMap objectForKey:a3];
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D9A2D000, v3, OS_LOG_TYPE_DEFAULT, "ATClientController dealloc", buf, 2u);
  }

  if (self->_queueMap)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [(NSDictionary *)self->_clientMap allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = CFDictionaryGetValue(self->_queueMap, *(const void **)(*((void *)&v11 + 1) + 8 * v8));
          dispatch_queue_set_specific(v9, @"disabled_queue", (void *)1, 0);

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v6);
    }

    CFRelease(self->_queueMap);
    self->_queueMap = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)ATClientController;
  [(ATClientController *)&v10 dealloc];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2664 != -1) {
    dispatch_once(&sharedInstance_onceToken_2664, &__block_literal_global_2665);
  }
  v2 = (void *)sharedInstance___sharedInstance;

  return v2;
}

uint64_t __36__ATClientController_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance = +[ATClientController controllerForDataclasses:0];

  return MEMORY[0x1F41817F8]();
}

+ (id)controllerForDataclasses:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(ATClientController);
  BOOL v5 = [(ATClientController *)v4 _loadClientsForDataclasses:v3];

  if (v5) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

@end