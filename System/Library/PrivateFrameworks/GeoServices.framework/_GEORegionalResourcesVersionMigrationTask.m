@interface _GEORegionalResourcesVersionMigrationTask
+ (id)_resourcesDirectory:(id)a3;
- (GEOActiveTileGroupMigrationTaskOptions)options;
- (NSObject)transaction;
- (NSProgress)progress;
- (_GEORegionalResourcesVersionMigrationTask)init;
- (_GEORegionalResourcesVersionMigrationTask)initWithMigrator:(id)a3 manifestConfiguration:(id)a4 newTileGroup:(id)a5 inResourceManifest:(id)a6 activeScales:(id)a7 activeScenarios:(id)a8;
- (id)_resourcesDirectory;
- (int64_t)estimatedWeight;
- (void)populateTileGroup:(id)a3;
- (void)removeOldData:(id)a3;
- (void)setOptions:(id)a3;
- (void)setTransaction:(id)a3;
- (void)startWithCompletionHandler:(id)a3 callbackQueue:(id)a4;
@end

@implementation _GEORegionalResourcesVersionMigrationTask

- (_GEORegionalResourcesVersionMigrationTask)init
{
  result = (_GEORegionalResourcesVersionMigrationTask *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (_GEORegionalResourcesVersionMigrationTask)initWithMigrator:(id)a3 manifestConfiguration:(id)a4 newTileGroup:(id)a5 inResourceManifest:(id)a6 activeScales:(id)a7 activeScenarios:(id)a8
{
  id v14 = a3;
  id v26 = a4;
  id v25 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v30.receiver = self;
  v30.super_class = (Class)_GEORegionalResourcesVersionMigrationTask;
  v18 = [(_GEORegionalResourcesVersionMigrationTask *)&v30 init];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_migrator, v14);
    objc_storeStrong((id *)&v19->_manifestConfiguration, a4);
    objc_storeStrong((id *)&v19->_newTileGroup, a5);
    objc_storeStrong((id *)&v19->_resourceManifest, a6);
    objc_storeStrong((id *)&v19->_activeScales, a7);
    objc_storeStrong((id *)&v19->_activeScenarios, a8);
    uint64_t v20 = +[GEOReportedProgress progressWithTotalUnitCount:](GEOReportedProgress, "progressWithTotalUnitCount:", -1, v25, v26);
    progress = v19->_progress;
    v19->_progress = (GEOReportedProgress *)v20;

    [(GEOReportedProgress *)v19->_progress setKind:*MEMORY[0x1E4F28898]];
    objc_initWeak(&location, v19);
    v22 = v19->_progress;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __145___GEORegionalResourcesVersionMigrationTask_initWithMigrator_manifestConfiguration_newTileGroup_inResourceManifest_activeScales_activeScenarios___block_invoke;
    v27[3] = &unk_1E53D7B90;
    objc_copyWeak(&v28, &location);
    [(GEOReportedProgress *)v22 setCancellationHandler:v27];
    v23 = v19;
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v19;
}

+ (id)_resourcesDirectory:(id)a3
{
  return GEORegionalResourcesDirectory(a3);
}

- (int64_t)estimatedWeight
{
  return 1;
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
  progress = self->_progress;
  v8 = a4;
  [(GEOReportedProgress *)progress setTotalUnitCount:1];
  [(GEOReportedProgress *)self->_progress setCompletedUnitCount:1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86___GEORegionalResourcesVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke;
  block[3] = &unk_1E53DA028;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, block);
}

- (void)populateTileGroup:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  resourceManifest = self->_resourceManifest;
  activeScales = self->_activeScales;
  activeScenarios = self->_activeScenarios;
  v8 = self->_newTileGroup;
  id v9 = resourceManifest;
  v10 = activeScales;
  id v11 = (void *)[(NSSet *)activeScenarios mutableCopy];
  [v11 addObject:&unk_1ED73E080];
  v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[GEOTileGroup resourceIndexsCount](v8, "resourceIndexsCount"));
  if ([(GEOTileGroup *)v8 resourceIndexsCount])
  {
    unint64_t v13 = 0;
    do
    {
      unsigned int v14 = [(GEOTileGroup *)v8 resourceIndexAtIndex:v13];
      if ([(GEOResources *)v9 resourcesCount] > v14)
      {
        id v15 = [(GEOResources *)v9 resourceAtIndex:v14];
        if ([v15 regionsCount]
          && objc_msgSend(v15, "_geo_isRelevantForScales:scenarios:", v10, v11))
        {
          [v12 addObject:v15];
        }
      }
      ++v13;
    }
    while (v13 < [(GEOTileGroup *)v8 resourceIndexsCount]);
  }

  -[GEOActiveTileGroup populateRegionalResources:](v4, v12);
  id v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __63___GEORegionalResourcesVersionMigrationTask_populateTileGroup___block_invoke;
  v50[3] = &unk_1E53E1550;
  id v34 = v16;
  id v51 = v34;
  id v17 = (void (**)(void, void))MEMORY[0x18C120660](v50);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v12;
  uint64_t v18 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v47 != v20) {
          objc_enumerationMutation(obj);
        }
        v22 = [*(id *)(*((void *)&v46 + 1) + 8 * i) filename];
        ((void (**)(void, void *))v17)[2](v17, v22);
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v19);
  }
  v35 = v4;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v36 = [(GEOResources *)self->_resourceManifest attributions];
  uint64_t v23 = [v36 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v43 != v25) {
          objc_enumerationMutation(v36);
        }
        v27 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        if ([v27 regionsCount])
        {
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v28 = [v27 resources];
          uint64_t v29 = [v28 countByEnumeratingWithState:&v38 objects:v52 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v39;
            do
            {
              for (uint64_t k = 0; k != v30; ++k)
              {
                if (*(void *)v39 != v31) {
                  objc_enumerationMutation(v28);
                }
                v33 = [*(id *)(*((void *)&v38 + 1) + 8 * k) filename];
                ((void (**)(void, void *))v17)[2](v17, v33);
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v38 objects:v52 count:16];
            }
            while (v30);
          }
        }
      }
      uint64_t v24 = [v36 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v24);
  }

  [v35 setRegionalResourceCanonicalNameToFileName:v34];
}

- (void)removeOldData:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_GEORegionalResourcesVersionMigrationTask *)self _resourcesDirectory];
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v46 = (void *)v5;
  v7 = [v6 contentsOfDirectoryAtPath:v5 error:0];

  if ([v7 count])
  {
    long long v41 = v7;
    v8 = [MEMORY[0x1E4F1CA80] setWithArray:v7];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v42 = v4;
    obuint64_t j = [v4 regionalResources];
    uint64_t v9 = [obj countByEnumeratingWithState:&v64 objects:v76 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v65 != v11) {
            objc_enumerationMutation(obj);
          }
          unint64_t v13 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          unsigned int v14 = [v13 resources];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v60 objects:v75 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v61;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v61 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = [*(id *)(*((void *)&v60 + 1) + 8 * j) filename];
                [v8 removeObject:v19];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v60 objects:v75 count:16];
            }
            while (v16);
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v64 objects:v76 count:16];
      }
      while (v10);
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obja = [v42 attributions];
    uint64_t v20 = [obja countByEnumeratingWithState:&v56 objects:v74 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v57;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v57 != v22) {
            objc_enumerationMutation(obja);
          }
          uint64_t v24 = *(void **)(*((void *)&v56 + 1) + 8 * k);
          if ([v24 regionsCount])
          {
            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            uint64_t v25 = [v24 resources];
            uint64_t v26 = [v25 countByEnumeratingWithState:&v52 objects:v73 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v53;
              do
              {
                for (uint64_t m = 0; m != v27; ++m)
                {
                  if (*(void *)v53 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  uint64_t v30 = [*(id *)(*((void *)&v52 + 1) + 8 * m) filename];
                  [v8 removeObject:v30];
                }
                uint64_t v27 = [v25 countByEnumeratingWithState:&v52 objects:v73 count:16];
              }
              while (v27);
            }
          }
        }
        uint64_t v21 = [obja countByEnumeratingWithState:&v56 objects:v74 count:16];
      }
      while (v21);
    }

    if ([v8 count])
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id objb = v8;
      uint64_t v31 = [objb countByEnumeratingWithState:&v48 objects:v72 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v49;
        do
        {
          for (uint64_t n = 0; n != v32; ++n)
          {
            if (*(void *)v49 != v33) {
              objc_enumerationMutation(objb);
            }
            uint64_t v35 = *(void *)(*((void *)&v48 + 1) + 8 * n);
            id v36 = [v46 stringByAppendingPathComponent:v35];
            v37 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v47 = 0;
            char v38 = [v37 removeItemAtPath:v36 error:&v47];
            id v39 = v47;

            if ((v38 & 1) == 0)
            {
              long long v40 = GEOFindOrCreateLog("com.apple.GeoServices", "ResourceManifest");
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                uint64_t v69 = v35;
                __int16 v70 = 2114;
                id v71 = v39;
                _os_log_impl(&dword_188D96000, v40, OS_LOG_TYPE_ERROR, "Could not remove regional resource resource '%{public}@' from disk: %{public}@", buf, 0x16u);
              }
            }
          }
          uint64_t v32 = [objb countByEnumeratingWithState:&v48 objects:v72 count:16];
        }
        while (v32);
      }
    }
    v7 = v41;
    id v4 = v42;
  }
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
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_activeScenarios, 0);
  objc_storeStrong((id *)&self->_activeScales, 0);
  objc_storeStrong((id *)&self->_resourceManifest, 0);
  objc_storeStrong((id *)&self->_newTileGroup, 0);
  objc_storeStrong((id *)&self->_manifestConfiguration, 0);

  objc_destroyWeak((id *)&self->_migrator);
}

@end