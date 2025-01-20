@interface _GEOResourcesVersionMigrationTask
+ (Class)_resourceLoaderClass;
+ (id)_resourcesDirectory:(id)a3;
- (GEOActiveTileGroupMigrationTaskOptions)options;
- (NSObject)transaction;
- (NSProgress)progress;
- (_GEOResourcesVersionMigrationTask)init;
- (id)_resourcesDirectory;
- (id)_staleResourceForResource:(id)a3;
- (id)initForOpportunisticWithMigrator:(id)a3 manifestConfiguration:(id)a4 newTileGroup:(id)a5 inResourceManifest:(id)a6 dataSet:(id)a7 oldTileGroup:(id)a8 activeNames:(id)a9;
- (id)initForRequiredWithMigrator:(id)a3 manifestConfiguration:(id)a4 newTileGroup:(id)a5 inResourceManifest:(id)a6 dataSet:(id)a7 oldTileGroup:(id)a8 activeScales:(id)a9 activeScenarios:(id)a10;
- (id)initForWithMigrator:(id)a3 manifestConfiguration:(id)a4 newTileGroup:(id)a5 inResourceManifest:(id)a6 dataSet:(id)a7 oldTileGroup:(id)a8 activeScales:(id)a9 activeScenarios:(id)a10 activeNames:(id)a11;
- (int64_t)estimatedWeight;
- (void)_loadImmediateResources:(id)a3 conditionalWifiResources:(id)a4 completionHandler:(id)a5;
- (void)cancel;
- (void)populateTileGroup:(id)a3;
- (void)removeOldData:(id)a3;
- (void)setOptions:(id)a3;
- (void)setTransaction:(id)a3;
- (void)startWithCompletionHandler:(id)a3 callbackQueue:(id)a4;
@end

@implementation _GEOResourcesVersionMigrationTask

- (_GEOResourcesVersionMigrationTask)init
{
  result = (_GEOResourcesVersionMigrationTask *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (id)initForWithMigrator:(id)a3 manifestConfiguration:(id)a4 newTileGroup:(id)a5 inResourceManifest:(id)a6 dataSet:(id)a7 oldTileGroup:(id)a8 activeScales:(id)a9 activeScenarios:(id)a10 activeNames:(id)a11
{
  id v17 = a3;
  id v34 = a4;
  id v33 = a5;
  id v32 = a6;
  id v31 = a7;
  id v30 = a8;
  id v29 = a9;
  id v28 = a10;
  id v27 = a11;
  v38.receiver = self;
  v38.super_class = (Class)_GEOResourcesVersionMigrationTask;
  v18 = [(_GEOResourcesVersionMigrationTask *)&v38 init];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_migrator, v17);
    objc_storeStrong((id *)&v19->_manifestConfiguration, a4);
    uint64_t v20 = geo_dispatch_queue_create();
    workQueue = v19->_workQueue;
    v19->_workQueue = (OS_dispatch_queue *)v20;

    objc_storeStrong((id *)&v19->_newTileGroup, a5);
    objc_storeStrong((id *)&v19->_resourceManifest, a6);
    objc_storeStrong((id *)&v19->_preferredDataSet, a7);
    objc_storeStrong((id *)&v19->_oldTileGroup, a8);
    objc_storeStrong((id *)&v19->_activeScales, a9);
    objc_storeStrong((id *)&v19->_activeScenarios, a10);
    objc_storeStrong((id *)&v19->_activeNames, a11);
    uint64_t v22 = +[GEOReportedProgress progressWithTotalUnitCount:-1];
    progress = v19->_progress;
    v19->_progress = (GEOReportedProgress *)v22;

    [(GEOReportedProgress *)v19->_progress setKind:*MEMORY[0x1E4F28898]];
    objc_initWeak(&location, v19);
    v24 = v19->_progress;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __173___GEOResourcesVersionMigrationTask_initForWithMigrator_manifestConfiguration_newTileGroup_inResourceManifest_dataSet_oldTileGroup_activeScales_activeScenarios_activeNames___block_invoke;
    v35[3] = &unk_1E53D7B90;
    objc_copyWeak(&v36, &location);
    [(GEOReportedProgress *)v24 setCancellationHandler:v35];
    v25 = v19;
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

  return v19;
}

- (id)initForRequiredWithMigrator:(id)a3 manifestConfiguration:(id)a4 newTileGroup:(id)a5 inResourceManifest:(id)a6 dataSet:(id)a7 oldTileGroup:(id)a8 activeScales:(id)a9 activeScenarios:(id)a10
{
  return [(_GEOResourcesVersionMigrationTask *)self initForWithMigrator:a3 manifestConfiguration:a4 newTileGroup:a5 inResourceManifest:a6 dataSet:a7 oldTileGroup:a8 activeScales:a9 activeScenarios:a10 activeNames:0];
}

- (id)initForOpportunisticWithMigrator:(id)a3 manifestConfiguration:(id)a4 newTileGroup:(id)a5 inResourceManifest:(id)a6 dataSet:(id)a7 oldTileGroup:(id)a8 activeNames:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if ([v21 count])
  {
    self = (_GEOResourcesVersionMigrationTask *)[(_GEOResourcesVersionMigrationTask *)self initForWithMigrator:v15 manifestConfiguration:v16 newTileGroup:v17 inResourceManifest:v18 dataSet:v19 oldTileGroup:v20 activeScales:0 activeScenarios:0 activeNames:v21];
    uint64_t v22 = self;
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

+ (Class)_resourceLoaderClass
{
  return (Class)objc_opt_class();
}

+ (id)_resourcesDirectory:(id)a3
{
  return GEOResourcesPath(a3);
}

- (int64_t)estimatedWeight
{
  return 4;
}

- (NSProgress)progress
{
  return [(GEOReportedProgress *)self->_progress progress];
}

- (id)_resourcesDirectory
{
  v3 = objc_opt_class();
  manifestConfiguration = self->_manifestConfiguration;

  return (id)[v3 _resourcesDirectory:manifestConfiguration];
}

- (void)startWithCompletionHandler:(id)a3 callbackQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  self->_running = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_migrator);
  [WeakRetained _addRunningTask:self];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78___GEOResourcesVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke;
  block[3] = &unk_1E53D8E18;
  id v13 = v7;
  id v14 = v6;
  block[4] = self;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(workQueue, block);
}

- (void)cancel
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43___GEOResourcesVersionMigrationTask_cancel__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)populateTileGroup:(id)a3
{
  id v4 = a3;
  if (!self->_activeNames)
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
    workQueue = self->_workQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55___GEOResourcesVersionMigrationTask_populateTileGroup___block_invoke;
    v6[3] = &unk_1E53D8998;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(workQueue, v6);
  }
}

- (void)removeOldData:(id)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = [(_GEOResourcesVersionMigrationTask *)self _resourcesDirectory];
  id v6 = [v4 contentsOfDirectoryAtPath:v5 error:0];

  obuint64_t j = v6;
  uint64_t v60 = [v6 countByEnumeratingWithState:&v80 objects:v92 count:16];
  if (v60)
  {
    uint64_t v59 = *(void *)v81;
    *(void *)&long long v7 = 138543618;
    long long v54 = v7;
    v56 = self;
    do
    {
      for (uint64_t i = 0; i != v60; uint64_t i = v53 + 1)
      {
        if (*(void *)v81 != v59) {
          objc_enumerationMutation(obj);
        }
        uint64_t v62 = i;
        v9 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        id v10 = objc_msgSend(v61, "activeResources", v54);
        id v11 = (void *)[v10 mutableCopy];

        v12 = [v61 explicitResources];
        [v11 addObjectsFromArray:v12];

        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v13 = v11;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v76 objects:v91 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v77;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v77 != v16) {
                objc_enumerationMutation(v13);
              }
              id v18 = *(void **)(*((void *)&v76 + 1) + 8 * j);
              id v19 = [v18 filename];
              char v20 = [v19 isEqualToString:v9];

              if (v20)
              {
                id v29 = v13;
                goto LABEL_50;
              }
              id v21 = [v18 filename];
              uint64_t v22 = [v21 stringByDeletingPathExtension];
              int v23 = [v22 isEqualToString:v9];

              if (v23)
              {
                v24 = [(_GEOResourcesVersionMigrationTask *)self _resourcesDirectory];
                id v25 = [v24 stringByAppendingPathComponent:v9];

                v26 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v25];
                BOOL v27 = +[GEOResourceLoader validateUnpackedResource:v18 at:v26];

                if (v27)
                {
                  id v29 = v13;
                  goto LABEL_53;
                }
                id v28 = GEOGetResourceManifestLog();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v85 = v25;
                  _os_log_impl(&dword_188D96000, v28, OS_LOG_TYPE_ERROR, "Unable to validate unpacked resource at \"%@\", will remove folder", buf, 0xCu);
                }
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v76 objects:v91 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v29 = [v61 staleResources];
        uint64_t v30 = [v29 countByEnumeratingWithState:&v72 objects:v90 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v73;
LABEL_21:
          uint64_t v33 = 0;
          while (1)
          {
            if (*(void *)v73 != v32) {
              objc_enumerationMutation(v29);
            }
            id v34 = [*(id *)(*((void *)&v72 + 1) + 8 * v33) fallbackResource];
            v35 = [v34 filename];
            char v36 = [v35 isEqualToString:v9];

            if (v36) {
              break;
            }
            if (v31 == ++v33)
            {
              uint64_t v31 = [v29 countByEnumeratingWithState:&v72 objects:v90 count:16];
              if (v31) {
                goto LABEL_21;
              }
              goto LABEL_27;
            }
          }
LABEL_50:
          uint64_t v53 = v62;
        }
        else
        {
LABEL_27:

          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          id v29 = [v61 attributions];
          uint64_t v37 = [v29 countByEnumeratingWithState:&v68 objects:v89 count:16];
          if (v37)
          {
            uint64_t v38 = v37;
            uint64_t v39 = *(void *)v69;
            uint64_t v55 = *(void *)v69;
            do
            {
              uint64_t v40 = 0;
              uint64_t v57 = v38;
              do
              {
                if (*(void *)v69 != v39) {
                  objc_enumerationMutation(v29);
                }
                v41 = *(void **)(*((void *)&v68 + 1) + 8 * v40);
                if (![v41 regionsCount])
                {
                  long long v66 = 0u;
                  long long v67 = 0u;
                  long long v64 = 0u;
                  long long v65 = 0u;
                  id v25 = [v41 resources];
                  uint64_t v42 = [v25 countByEnumeratingWithState:&v64 objects:v88 count:16];
                  if (v42)
                  {
                    uint64_t v43 = v42;
                    uint64_t v44 = *(void *)v65;
                    while (2)
                    {
                      for (uint64_t k = 0; k != v43; ++k)
                      {
                        if (*(void *)v65 != v44) {
                          objc_enumerationMutation(v25);
                        }
                        v46 = [*(id *)(*((void *)&v64 + 1) + 8 * k) filename];
                        char v47 = [v46 isEqualToString:v9];

                        if (v47)
                        {
                          self = v56;
                          goto LABEL_53;
                        }
                      }
                      uint64_t v43 = [v25 countByEnumeratingWithState:&v64 objects:v88 count:16];
                      if (v43) {
                        continue;
                      }
                      break;
                    }
                  }

                  uint64_t v39 = v55;
                  self = v56;
                  uint64_t v38 = v57;
                }
                ++v40;
              }
              while (v40 != v38);
              uint64_t v48 = [v29 countByEnumeratingWithState:&v68 objects:v89 count:16];
              uint64_t v38 = v48;
            }
            while (v48);
          }

          v49 = [(_GEOResourcesVersionMigrationTask *)self _resourcesDirectory];
          id v29 = [v49 stringByAppendingPathComponent:v9];

          v50 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v63 = 0;
          char v51 = [v50 removeItemAtPath:v29 error:&v63];
          id v25 = v63;

          if (v51)
          {
LABEL_53:
            uint64_t v53 = v62;
          }
          else
          {
            v52 = GEOGetResourceManifestLog();
            uint64_t v53 = v62;
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v54;
              id v85 = v9;
              __int16 v86 = 2114;
              id v87 = v25;
              _os_log_impl(&dword_188D96000, v52, OS_LOG_TYPE_ERROR, "Could not remove resource '%{public}@' from disk: %{public}@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v60 = [obj countByEnumeratingWithState:&v80 objects:v92 count:16];
    }
    while (v60);
  }
}

- (void)_loadImmediateResources:(id)a3 conditionalWifiResources:(id)a4 completionHandler:(id)a5
{
  id v45 = a4;
  id v8 = a5;
  if (v8)
  {
    id v9 = a3;
    v41 = [(_GEOResourcesVersionMigrationTask *)self _resourcesDirectory];
    if (self->_oldTileGroup) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = 6;
    }
    if ([(GEOResourceManifestConfiguration *)self->_manifestConfiguration isDefaultConfiguration])
    {
      id v11 = 0;
    }
    else
    {
      id v11 = GEOResourcesPath(0);
    }
    uint64_t v43 = v8;
    v12 = (objc_class *)[(id)objc_opt_class() _resourceLoaderClass];
    id v13 = [(GEOResources *)self->_resourceManifest preferedURLSetFor:self->_preferredDataSet];
    uint64_t v14 = [v13 resourcesURL];
    uint64_t v40 = [v14 nsURL];

    uint64_t v39 = [v13 resourcesProxyURL];
    uint64_t v42 = v13;
    uint64_t v38 = [v13 alternateResourcesNSURLs];
    uint64_t v44 = v10;
    if (GEOConfigGetBOOL(GeoServicesConfig_ResourceLoadingShouldTakePowerAssertion, (uint64_t)off_1E9114078))
    {
      double Double = GEOConfigGetDouble(GeoServicesConfig_ResourceLoadingPowerAssertionTimeout, (uint64_t)off_1E9114068);
      uint64_t v16 = [GEOPowerAssertion alloc];
      id v17 = NSString;
      id v18 = [(_GEOResourcesVersionMigrationTask *)self description];
      [MEMORY[0x1E4F29128] UUID];
      char v20 = v19 = v11;
      id v21 = [v20 UUIDString];
      uint64_t v22 = [v17 stringWithFormat:@"%@_%@", v18, v21];
      int v23 = [(GEOPowerAssertion *)v16 initWithType:0 identifier:v22 timeout:Double];
      powerAssertion = self->_powerAssertion;
      self->_powerAssertion = v23;

      id v11 = v19;
      uint64_t v10 = v44;
    }
    -[GEOReportedProgress becomeCurrentWithPendingUnitCount:](self->_progress, "becomeCurrentWithPendingUnitCount:", [v9 count]);
    id v25 = [v12 alloc];
    v26 = +[GEOApplicationAuditToken currentProcessAuditToken];
    BOOL v27 = GEOGetResourceManifestLog();
    LOBYTE(v37) = 0;
    id v28 = (GEOResourceLoader *)[v25 initWithTargetDirectory:v41 auditToken:v26 baseURL:v40 alternateURLs:v38 proxyURL:v39 resources:v9 forceUpdateCheck:v37 maximumConcurrentLoads:v10 additionalDirectoryToConsider:v11 log:v27 signpostID:0];

    immediateResourceLoader = self->_immediateResourceLoader;
    self->_immediateResourceLoader = v28;

    [(GEOReportedProgress *)self->_progress resignCurrent];
    uint64_t v30 = self->_immediateResourceLoader;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __104___GEOResourcesVersionMigrationTask__loadImmediateResources_conditionalWifiResources_completionHandler___block_invoke;
    v46[3] = &unk_1E53E15A0;
    v46[4] = self;
    id v8 = v43;
    id v53 = v43;
    id v47 = v45;
    id v48 = v41;
    id v49 = v40;
    id v50 = v38;
    long long v54 = v12;
    uint64_t v55 = v44;
    id v51 = v39;
    id v52 = v11;
    workQueue = self->_workQueue;
    id v32 = v11;
    id v33 = v39;
    id v34 = v38;
    id v35 = v40;
    id v36 = v41;
    [(GEOResourceLoader *)v30 startWithCompletionHandler:v46 callbackQueue:workQueue];
  }
}

- (id)_staleResourceForResource:(id)a3
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v89 = objc_alloc_init(GEOStaleResource);
  [(GEOStaleResource *)v89 setDesiredResource:v4];
  v94 = v4;
  v5 = [v4 filename];
  id v6 = GEOCanonicalResourceNameForVersionedName(v5);

  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  v95 = self;
  long long v7 = [(GEOActiveTileGroup *)self->_oldTileGroup activeResources];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v110 objects:v124 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v111;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v111 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v110 + 1) + 8 * i);
        if ([v12 hasFilename])
        {
          id v13 = [v12 filename];
          uint64_t v14 = GEOCanonicalResourceNameForVersionedName(v13);

          if ([v14 isEqualToString:v6])
          {
            uint64_t v15 = GEOGetResourceManifestLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              uint64_t v16 = [v94 filename];
              id v17 = [v12 filename];
              *(_DWORD *)buf = 138478083;
              id v121 = v16;
              __int16 v122 = 2113;
              v123 = v17;
              _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_INFO, "Found already-loaded fallback resource: '%{private}@' -> '%{private}@'", buf, 0x16u);
            }
            id v18 = [(_GEOResourcesVersionMigrationTask *)v95 _resourcesDirectory];
            uint64_t v19 = [v12 filename];
            char v20 = [v18 stringByAppendingPathComponent:v19];

            id v21 = [MEMORY[0x1E4F28CB8] defaultManager];
            LOBYTE(v19) = [v21 fileExistsAtPath:v20];

            if (v19)
            {
              [(GEOStaleResource *)v89 setFallbackResource:v12];

              goto LABEL_19;
            }
            uint64_t v22 = GEOGetResourceManifestLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v121 = v20;
              _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_ERROR, "Stale resource does not actually exist on-disk. Ignoring... (%{public}@)", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v110 objects:v124 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  int v23 = v89;
  if (![(GEOStaleResource *)v89 hasFallbackResource])
  {
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    v24 = [(GEOActiveTileGroup *)v95->_oldTileGroup staleResources];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v106 objects:v119 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v107;
      v92 = v24;
      while (2)
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v107 != v27) {
            objc_enumerationMutation(v24);
          }
          id v29 = *(void **)(*((void *)&v106 + 1) + 8 * j);
          uint64_t v30 = [v29 fallbackResource];
          int v31 = [v30 hasFilename];

          if (v31)
          {
            id v32 = [v29 fallbackResource];
            id v33 = [v32 filename];
            id v34 = GEOCanonicalResourceNameForVersionedName(v33);

            if ([v34 isEqualToString:v6])
            {
              id v35 = GEOGetResourceManifestLog();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                id v36 = [v94 filename];
                uint64_t v37 = [v29 fallbackResource];
                uint64_t v38 = [v37 filename];
                *(_DWORD *)buf = 138478083;
                id v121 = v36;
                __int16 v122 = 2113;
                v123 = v38;
                _os_log_impl(&dword_188D96000, v35, OS_LOG_TYPE_INFO, "Found already-loaded (but also stale) fallback resource: '%{private}@' -> '%{private}@'", buf, 0x16u);
              }
              uint64_t v39 = [(_GEOResourcesVersionMigrationTask *)v95 _resourcesDirectory];
              uint64_t v40 = [v29 fallbackResource];
              v41 = [(id)v40 filename];
              uint64_t v42 = [v39 stringByAppendingPathComponent:v41];

              uint64_t v43 = [MEMORY[0x1E4F28CB8] defaultManager];
              LOBYTE(v40) = [v43 fileExistsAtPath:v42];

              if (v40)
              {
                id v45 = [v29 fallbackResource];
                [(GEOStaleResource *)v89 setFallbackResource:v45];

                [v29 originalTimestamp];
                -[GEOStaleResource setOriginalTimestamp:](v89, "setOriginalTimestamp:");

                v24 = v92;
                goto LABEL_38;
              }
              uint64_t v44 = GEOGetResourceManifestLog();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                id v121 = v42;
                _os_log_impl(&dword_188D96000, v44, OS_LOG_TYPE_ERROR, "Stale resource does not actually exist on-disk. Ignoring... (%{public}@)", buf, 0xCu);
              }

              v24 = v92;
            }
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v106 objects:v119 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }
LABEL_38:

    int v23 = v89;
  }
  if (![(GEOStaleResource *)v23 hasFallbackResource])
  {
    v46 = objc_msgSend(MEMORY[0x1E4F28B50], "__geoBundle");
    id v47 = [v46 resourcePath];

    v88 = v47;
    if (v47)
    {
      v118[0] = v47;
      id v48 = [v47 stringByAppendingPathComponent:@"InitialResources@3x"];
      v118[1] = v48;
      id v49 = [v47 stringByAppendingPathComponent:@"InitialResources@2x"];
      v118[2] = v49;
      id v50 = [v47 stringByAppendingPathComponent:@"InitialResources"];
      v118[3] = v50;
      id v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:4];
    }
    else
    {
      id v51 = 0;
    }
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    obuint64_t j = v51;
    uint64_t v93 = [obj countByEnumeratingWithState:&v102 objects:v117 count:16];
    if (v93)
    {
      uint64_t v91 = *(void *)v103;
      unint64_t v52 = 0x1E4F28000uLL;
      while (2)
      {
        for (uint64_t k = 0; k != v93; ++k)
        {
          if (*(void *)v103 != v91) {
            objc_enumerationMutation(obj);
          }
          long long v54 = *(void **)(*((void *)&v102 + 1) + 8 * k);
          uint64_t v55 = [*(id *)(v52 + 3256) defaultManager];
          v56 = [v55 contentsOfDirectoryAtPath:v54 error:0];

          long long v100 = 0u;
          long long v101 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          id v57 = v56;
          uint64_t v58 = [v57 countByEnumeratingWithState:&v98 objects:v116 count:16];
          uint64_t v59 = v57;
          if (v58)
          {
            uint64_t v60 = v58;
            unint64_t v61 = v52;
            uint64_t v62 = *(void *)v99;
LABEL_50:
            uint64_t v63 = 0;
            while (1)
            {
              if (*(void *)v99 != v62) {
                objc_enumerationMutation(v57);
              }
              long long v64 = *(void **)(*((void *)&v98 + 1) + 8 * v63);
              long long v65 = GEOCanonicalResourceNameForVersionedName(v64);
              if ([v65 isEqualToString:v6]) {
                break;
              }

              if (v60 == ++v63)
              {
                uint64_t v60 = [v57 countByEnumeratingWithState:&v98 objects:v116 count:16];
                if (v60) {
                  goto LABEL_50;
                }
                uint64_t v59 = v57;
                goto LABEL_65;
              }
            }
            long long v66 = [v54 stringByAppendingPathComponent:v64];

            unint64_t v52 = v61;
            if (!v66) {
              goto LABEL_67;
            }
            long long v67 = [v66 lastPathComponent];
            long long v68 = GEOGetResourceManifestLog();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
            {
              long long v69 = [v94 filename];
              *(_DWORD *)buf = 138478083;
              id v121 = v69;
              __int16 v122 = 2113;
              v123 = v67;
              _os_log_impl(&dword_188D96000, v68, OS_LOG_TYPE_INFO, "Found fallback resource bundled in GeoServices.framework: '%{private}@' -> '%{private}@'", buf, 0x16u);
            }
            uint64_t v59 = [v66 stringByResolvingSymlinksInPath];

            long long v70 = [(_GEOResourcesVersionMigrationTask *)v95 _resourcesDirectory];
            long long v71 = [v70 stringByAppendingPathComponent:v67];

            long long v72 = [*(id *)(v61 + 3256) defaultManager];
            char v73 = [v72 fileExistsAtPath:v71];

            if ((v73 & 1) == 0)
            {
              long long v74 = [*(id *)(v61 + 3256) defaultManager];
              id v97 = 0;
              char v75 = [v74 copyItemAtPath:v59 toPath:v71 error:&v97];
              id v76 = v97;

              if ((v75 & 1) == 0)
              {
                long long v77 = GEOGetResourceManifestLog();
                if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  id v121 = v76;
                  _os_log_impl(&dword_188D96000, v77, OS_LOG_TYPE_ERROR, "Failed to copy (stale) bundled resource: %{public}@", buf, 0xCu);
                }

LABEL_65:
                unint64_t v52 = v61;
                goto LABEL_66;
              }
              long long v78 = [*(id *)(v61 + 3256) defaultManager];
              uint64_t v79 = *MEMORY[0x1E4F28378];
              uint64_t v80 = *MEMORY[0x1E4F28330];
              v114[0] = *MEMORY[0x1E4F28370];
              v114[1] = v80;
              v115[0] = v79;
              v115[1] = &unk_1ED73DCA8;
              long long v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v115 forKeys:v114 count:2];
              id v96 = 0;
              char v82 = [v78 setAttributes:v81 ofItemAtPath:v71 error:&v96];
              id v83 = v96;

              if ((v82 & 1) == 0)
              {
                v84 = GEOGetResourceManifestLog();
                if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  id v121 = v83;
                  _os_log_impl(&dword_188D96000, v84, OS_LOG_TYPE_ERROR, "Failed to set permissions for resource: %{public}@", buf, 0xCu);
                }
              }
            }
            id v85 = objc_alloc_init(GEOResource);
            [(GEOResource *)v85 setFilename:v67];
            __int16 v86 = GEOCalculateSHA1ForFile(v71);
            [(GEOResource *)v85 setChecksum:v86];

            int v23 = v89;
            [(GEOStaleResource *)v89 setFallbackResource:v85];

            goto LABEL_76;
          }
LABEL_66:

LABEL_67:
        }
        int v23 = v89;
        uint64_t v93 = [obj countByEnumeratingWithState:&v102 objects:v117 count:16];
        if (v93) {
          continue;
        }
        break;
      }
    }
LABEL_76:
  }
  if (![(GEOStaleResource *)v23 hasOriginalTimestamp]) {
    [(GEOStaleResource *)v23 setOriginalTimestamp:CFAbsoluteTimeGetCurrent()];
  }

  return v23;
}

- (NSObject)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (GEOActiveTileGroupMigrationTaskOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerAssertion, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_unloadedConditionalResources, 0);
  objc_storeStrong((id *)&self->_loadedResources, 0);
  objc_storeStrong((id *)&self->_wifiOnlyResourceLoader, 0);
  objc_storeStrong((id *)&self->_immediateResourceLoader, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_activeNames, 0);
  objc_storeStrong((id *)&self->_activeScenarios, 0);
  objc_storeStrong((id *)&self->_activeScales, 0);
  objc_storeStrong((id *)&self->_oldTileGroup, 0);
  objc_storeStrong((id *)&self->_preferredDataSet, 0);
  objc_storeStrong((id *)&self->_resourceManifest, 0);
  objc_storeStrong((id *)&self->_newTileGroup, 0);
  objc_storeStrong((id *)&self->_manifestConfiguration, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_destroyWeak((id *)&self->_migrator);
}

@end