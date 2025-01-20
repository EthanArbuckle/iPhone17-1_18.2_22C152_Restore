@interface GEOExperimentConfiguration
+ (id)sharedConfiguration;
+ (void)useProxy:(Class)a3;
- (GEOABAssignmentResponse)experimentsInfo;
- (GEOExperimentConfiguration)init;
- (id)_debug_bucketId;
- (id)_debug_configurationDate;
- (id)_debug_customQuerySubstringForType:(int64_t)a3 dispatcherRequestType:(int)a4;
- (id)_debug_datasetId;
- (id)_mapsAbClientMetadata;
- (id)_parsecClientMetadata;
- (id)_reportAProblemClientMetadata;
- (id)_siriClientMetadata;
- (id)clientConfig;
- (id)clientConfigurationValueForKey:(id)a3;
- (id)detailedDescription;
- (id)detailedDescriptionDictionaryRepresentation;
- (id)experimentAssignments;
- (id)experimentURLForURL:(id)a3 requestKind:(id)a4;
- (void)_debug_fetchAllAvailableExperiments:(id)a3;
- (void)_debug_forEachExperimentType:(id)a3;
- (void)_debug_forceUpdate;
- (void)_debug_setActiveExperimentBranch:(id)a3;
- (void)_debug_setBucketIdDictionaryRepresentation:(id)a3;
- (void)_debug_setCustomQuerySubstring:(id)a3 forExperimentType:(int64_t)a4 dispatcherRequestType:(int)a5;
- (void)_fetchAllAvailableExperimentsResponse:(id)a3;
- (void)_setActiveExperimentBranchDictionaryRepresentation:(id)a3;
- (void)abAssignUUIDWithCompletionHandler:(id)a3;
- (void)abAssignUUIDWithSyncCompletionHandler:(id)a3;
- (void)addExperimentObserver:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)forceUpdate:(id)a3;
- (void)refreshDatasetABStatus:(id)a3;
- (void)removeExperimentObserver:(id)a3;
- (void)serverProxy:(id)a3 didChangeExperimentsInfo:(id)a4;
- (void)submitBackgroundTasksNeededDuringDaemonStart;
- (void)updateURLComponents:(id)a3 forRequestKind:(id)a4;
@end

@implementation GEOExperimentConfiguration

+ (id)sharedConfiguration
{
  if (qword_1EB2A0320 != -1) {
    dispatch_once(&qword_1EB2A0320, &__block_literal_global_163);
  }
  v2 = (void *)_MergedGlobals_304;

  return v2;
}

- (id)clientConfigurationValueForKey:(id)a3
{
  p_experimentsInfoLock = &self->_experimentsInfoLock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  v6 = [(GEOABAssignmentResponse *)self->_experimentsInfo _clientConfigValueForKey:v5];

  os_unfair_lock_unlock(p_experimentsInfoLock);

  return v6;
}

- (id)_siriClientMetadata
{
  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  v4 = [(GEOABAssignmentResponse *)self->_experimentsInfo siriClientMetadata];
  os_unfair_lock_unlock(p_experimentsInfoLock);

  return v4;
}

- (void)refreshDatasetABStatus:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v7 = v4;
    int v6 = [v4 hasDatasetId];
    id v5 = v7;
    if (v6)
    {
      [(GEOExperimentServerProxy *)self->_serverProxy refreshDatasetABStatus:v7];
      id v5 = v7;
    }
  }
}

- (id)_parsecClientMetadata
{
  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  id v4 = [(GEOABAssignmentResponse *)self->_experimentsInfo parsecClientMetadata];
  os_unfair_lock_unlock(p_experimentsInfoLock);

  return v4;
}

void __49__GEOExperimentConfiguration_sharedConfiguration__block_invoke()
{
  v0 = objc_alloc_init(GEOExperimentConfiguration);
  v1 = (void *)_MergedGlobals_304;
  _MergedGlobals_304 = (uint64_t)v0;
}

- (GEOExperimentConfiguration)init
{
  v13.receiver = self;
  v13.super_class = (Class)GEOExperimentConfiguration;
  v2 = [(GEOExperimentConfiguration *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_experimentsInfoLock._os_unfair_lock_opaque = 0;
    id v4 = [[GEOObserverHashTable alloc] initWithProtocol:&unk_1ED743D88 queue:0];
    experimentObservers = v3->_experimentObservers;
    v3->_experimentObservers = v4;

    int v6 = (objc_class *)_sServerProxyClass;
    if (!_sServerProxyClass) {
      int v6 = (objc_class *)objc_opt_class();
    }
    uint64_t v7 = [[v6 alloc] initWithDelegate:v3];
    serverProxy = v3->_serverProxy;
    v3->_serverProxy = (GEOExperimentServerProxy *)v7;

    os_unfair_lock_lock_with_options();
    uint64_t v9 = [(GEOExperimentServerProxy *)v3->_serverProxy experimentsInfo];
    experimentsInfo = v3->_experimentsInfo;
    v3->_experimentsInfo = (GEOABAssignmentResponse *)v9;

    os_unfair_lock_unlock(&v3->_experimentsInfoLock);
    v11 = v3;
  }

  return v3;
}

- (void)updateURLComponents:(id)a3 forRequestKind:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = v5;
  if (a4.var0 > 1279)
  {
    if (a4.var0 <= 2854)
    {
      if (a4.var0 != 1280 && a4.var0 != 1792) {
        goto LABEL_34;
      }
      goto LABEL_9;
    }
    if (a4.var0 == 2855)
    {
      unint64_t v7 = 2;
      goto LABEL_18;
    }
    if (a4.var0 != 2857) {
      goto LABEL_34;
    }
LABEL_15:
    unint64_t v7 = 0;
    uint64_t v8 = 2;
    goto LABEL_19;
  }
  if (a4.var0 <= 671)
  {
    if (a4.var0 == 256)
    {
      unint64_t v7 = 0;
      uint64_t v8 = 3;
      goto LABEL_19;
    }
    if (a4.var0 != 512) {
      goto LABEL_34;
    }
    goto LABEL_15;
  }
  if ((a4.var0 - 672) < 2) {
    goto LABEL_15;
  }
  if (a4.var0 != 768) {
    goto LABEL_34;
  }
LABEL_9:
  unint64_t v7 = HIDWORD(*(unint64_t *)&a4);
LABEL_18:
  uint64_t v8 = 1;
LABEL_19:
  if (v5)
  {
    uint64_t v9 = _GEOGetQueryForExperimentType(GeoServicesConfig_Experiment, (uint64_t)off_1E9114848, v8, v7);
    if (!v9)
    {
      uint64_t v9 = _GEOGetQueryForExperimentType(GeoServicesConfig_DebugActiveExperimentBranch, (uint64_t)off_1E9114858, v8, v7);
    }
    if ([v9 length])
    {
      v10 = (void *)MEMORY[0x1E4F1CA48];
      v24 = v6;
      v11 = [v6 queryItems];
      v12 = [v10 arrayWithArray:v11];

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v23 = v9;
      objc_super v13 = [v9 componentsSeparatedByString:@"&"];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v26;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = [*(id *)(*((void *)&v25 + 1) + 8 * v17) componentsSeparatedByString:@"="];
            if ([v18 count] == 2)
            {
              v19 = (void *)MEMORY[0x1E4F290C8];
              v20 = [v18 objectAtIndex:0];
              v21 = [v18 objectAtIndex:1];
              v22 = [v19 queryItemWithName:v20 value:v21];

              [v12 addObject:v22];
            }

            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v15);
      }

      int v6 = v24;
      [v24 setQueryItems:v12];

      uint64_t v9 = v23;
    }
  }
LABEL_34:
}

- (void)addExperimentObserver:(id)a3 queue:(id)a4
{
}

- (id)_mapsAbClientMetadata
{
  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldPassABClientMetadata, (uint64_t)off_1E9115238))
  {
    p_experimentsInfoLock = &self->_experimentsInfoLock;
    os_unfair_lock_lock_with_options();
    id v4 = [(GEOABAssignmentResponse *)self->_experimentsInfo mapsAbClientMetadata];
    os_unfair_lock_unlock(p_experimentsInfoLock);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (GEOABAssignmentResponse)experimentsInfo
{
  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_experimentsInfo;
  os_unfair_lock_unlock(p_experimentsInfoLock);

  return v4;
}

- (id)clientConfig
{
  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  id v4 = [(GEOABAssignmentResponse *)self->_experimentsInfo clientConfig];
  os_unfair_lock_unlock(p_experimentsInfoLock);

  return v4;
}

+ (void)useProxy:(Class)a3
{
  _sServerProxyClass = (uint64_t)a3;
}

- (void)dealloc
{
  [(GEOExperimentServerProxy *)self->_serverProxy setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)GEOExperimentConfiguration;
  [(GEOExperimentConfiguration *)&v3 dealloc];
}

- (id)detailedDescription
{
  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  id v4 = [(GEOABAssignmentResponse *)self->_experimentsInfo description];
  os_unfair_lock_unlock(p_experimentsInfoLock);

  return v4;
}

- (id)detailedDescriptionDictionaryRepresentation
{
  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = [(GEOABAssignmentResponse *)self->_experimentsInfo dictionaryRepresentation];
  if (v5) {
    [v4 setObject:v5 forKey:@"GEOExperimentConfiguration"];
  }
  os_unfair_lock_unlock(p_experimentsInfoLock);

  return v4;
}

- (id)experimentAssignments
{
  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  id v4 = [(GEOABAssignmentResponse *)self->_experimentsInfo assignments];
  os_unfair_lock_unlock(p_experimentsInfoLock);

  return v4;
}

- (void)abAssignUUIDWithCompletionHandler:(id)a3
{
}

- (void)abAssignUUIDWithSyncCompletionHandler:(id)a3
{
}

- (id)_reportAProblemClientMetadata
{
  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  id v4 = [(GEOABAssignmentResponse *)self->_experimentsInfo rapClientMetadata];
  os_unfair_lock_unlock(p_experimentsInfoLock);

  return v4;
}

- (id)experimentURLForURL:(id)a3 requestKind:(id)a4
{
  id v6 = a3;
  unint64_t v7 = v6;
  if (a4.var0 > 1279)
  {
    if (a4.var0 > 2854)
    {
      if (a4.var0 != 2857 && a4.var0 != 2855) {
        goto LABEL_17;
      }
    }
    else if (a4.var0 != 1280 && a4.var0 != 1792)
    {
      goto LABEL_17;
    }
  }
  else if (a4.var0 <= 671)
  {
    if (a4.var0 != 256 && a4.var0 != 512) {
      goto LABEL_17;
    }
  }
  else if ((a4.var0 - 672) >= 2 && a4.var0 != 768)
  {
    goto LABEL_17;
  }
  if (v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F29088] componentsWithURL:v6 resolvingAgainstBaseURL:1];
    [(GEOExperimentConfiguration *)self updateURLComponents:v8 forRequestKind:a4];
    id v9 = [v8 URL];

    goto LABEL_18;
  }
LABEL_17:
  id v9 = v6;
LABEL_18:

  return v9;
}

- (void)removeExperimentObserver:(id)a3
{
}

- (void)serverProxy:(id)a3 didChangeExperimentsInfo:(id)a4
{
  id v5 = (GEOABAssignmentResponse *)a4;
  os_unfair_lock_lock_with_options();
  experimentsInfo = self->_experimentsInfo;
  self->_experimentsInfo = v5;
  unint64_t v7 = v5;

  os_unfair_lock_unlock(&self->_experimentsInfoLock);
  [(GEOObserverHashTable *)self->_experimentObservers experimentConfigurationDidChange:self];
}

- (void)forceUpdate:(id)a3
{
}

- (void)submitBackgroundTasksNeededDuringDaemonStart
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentObservers, 0);
  objc_storeStrong((id *)&self->_experimentsInfo, 0);

  objc_storeStrong((id *)&self->_serverProxy, 0);
}

- (void)_debug_forceUpdate
{
}

- (id)_debug_configurationDate
{
  p_experimentsInfoLock = &self->_experimentsInfoLock;
  os_unfair_lock_lock_with_options();
  if ([(GEOABAssignmentResponse *)self->_experimentsInfo hasTimestamp])
  {
    id v4 = (void *)MEMORY[0x1E4F1C9C8];
    [(GEOABAssignmentResponse *)self->_experimentsInfo timestamp];
    id v5 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    id v5 = 0;
  }
  os_unfair_lock_unlock(p_experimentsInfoLock);

  return v5;
}

- (id)_debug_customQuerySubstringForType:(int64_t)a3 dispatcherRequestType:(int)a4
{
  return _GEOGetQueryForExperimentType(GeoServicesConfig_Experiment, (uint64_t)off_1E9114848, a3, *(uint64_t *)&a4);
}

- (void)_debug_setCustomQuerySubstring:(id)a3 forExperimentType:(int64_t)a4 dispatcherRequestType:(int)a5
{
}

- (void)_debug_forEachExperimentType:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void (**)(id, uint64_t, void, void *))a3;
  if (v3)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v19 = [&unk_1ED73EF20 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v19)
    {
      uint64_t v18 = *(void *)v26;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(&unk_1ED73EF20);
          }
          uint64_t v20 = v4;
          uint64_t v5 = [*(id *)(*((void *)&v25 + 1) + 8 * v4) integerValue];
          if (v5 == 1)
          {
            long long v23 = 0u;
            long long v24 = 0u;
            long long v21 = 0u;
            long long v22 = 0u;
            uint64_t v8 = [&unk_1ED73EF38 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v8)
            {
              uint64_t v9 = v8;
              uint64_t v10 = *(void *)v22;
              do
              {
                for (uint64_t i = 0; i != v9; ++i)
                {
                  if (*(void *)v22 != v10) {
                    objc_enumerationMutation(&unk_1ED73EF38);
                  }
                  uint64_t v12 = [*(id *)(*((void *)&v21 + 1) + 8 * i) intValue];
                  uint64_t v13 = v12;
                  uint64_t v14 = NSString;
                  if (v12 >= 0x3F)
                  {
                    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
                    uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    uint64_t v15 = off_1E53EB3B8[(int)v12];
                  }
                  uint64_t v16 = [v14 stringWithFormat:@"%@ - %@", @"Dispatcher", v15];
                  v3[2](v3, 1, v13, v16);
                }
                uint64_t v9 = [&unk_1ED73EF38 countByEnumeratingWithState:&v21 objects:v29 count:16];
              }
              while (v9);
            }
          }
          else
          {
            id v6 = @"Routing";
            if (v5 != 2) {
              id v6 = 0;
            }
            if (v5 == 3) {
              unint64_t v7 = @"Tiles";
            }
            else {
              unint64_t v7 = v6;
            }
            v3[2](v3, v5, 0, v7);
          }
          uint64_t v4 = v20 + 1;
        }
        while (v20 + 1 != v19);
        uint64_t v17 = [&unk_1ED73EF20 countByEnumeratingWithState:&v25 objects:v30 count:16];
        uint64_t v19 = v17;
      }
      while (v17);
    }
  }
}

- (void)_debug_fetchAllAvailableExperiments:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __77__GEOExperimentConfiguration_DebugOnly___debug_fetchAllAvailableExperiments___block_invoke;
    v6[3] = &unk_1E53EB398;
    id v7 = v4;
    [(GEOExperimentConfiguration *)self _fetchAllAvailableExperimentsResponse:v6];
  }
}

void __77__GEOExperimentConfiguration_DebugOnly___debug_fetchAllAvailableExperiments___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v48 = a1;
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    v53 = [MEMORY[0x1E4F1CA48] array];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v49 = v5;
    id v7 = [v5 assignments];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v60 objects:v65 count:16];
    v52 = v6;
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v61;
      v50 = v7;
      do
      {
        uint64_t v11 = 0;
        id obj = (id)v9;
        do
        {
          if (*(void *)v61 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v60 + 1) + 8 * v11);
          uint64_t v13 = [v12 debugExperimentBranch];
          if ([v13 hasExperimentId])
          {
            uint64_t v14 = [v13 experimentId];
            uint64_t v15 = [v6 objectForKeyedSubscript:v14];

            if (!v15)
            {
              uint64_t v16 = [GEOAvailableExperiment alloc];
              uint64_t v17 = [v13 experimentId];
              uint64_t v18 = [v13 experimentName];
              uint64_t v15 = [(GEOAvailableExperiment *)v16 initWithIdentifier:v17 name:v18];

              uint64_t v19 = [v13 experimentId];
              [v6 setObject:v15 forKeyedSubscript:v19];

              [v53 addObject:v15];
            }
            uint64_t v20 = [v13 branchLabel];
            long long v21 = [(GEOAvailableExperiment *)v15 _branchForLabel:v20];

            if (!v21)
            {
              long long v22 = [GEOAvailableExperimentBranch alloc];
              long long v23 = [v13 branchLabel];
              [v13 branchName];
              long long v25 = v24 = v10;
              long long v26 = [(GEOAvailableExperiment *)v15 identifier];
              long long v21 = [(GEOAvailableExperimentBranch *)v22 initWithLabel:v23 name:v25 experimentIdentifier:v26];

              id v6 = v52;
              uint64_t v10 = v24;
              uint64_t v9 = (uint64_t)obj;

              id v7 = v50;
              [(GEOAvailableExperiment *)v15 _addBranch:v21];
            }
            [(GEOAvailableExperimentBranch *)v21 _addAssignment:v12];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v60 objects:v65 count:16];
      }
      while (v9);
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v27 = [v49 clientConfig];
    long long v28 = [v27 debugExperimentBranchs];

    id obja = v28;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v57;
      uint64_t v51 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v57 != v31) {
            objc_enumerationMutation(obja);
          }
          v33 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          v34 = [v33 debugExperimentBranch];
          if ([v34 hasExperimentId])
          {
            v35 = [v34 experimentId];
            v36 = [v6 objectForKeyedSubscript:v35];

            if (!v36)
            {
              v37 = [GEOAvailableExperiment alloc];
              v38 = [v34 experimentId];
              v39 = [v34 experimentName];
              v36 = [(GEOAvailableExperiment *)v37 initWithIdentifier:v38 name:v39];

              uint64_t v31 = v51;
              v40 = [v34 experimentId];
              [v6 setObject:v36 forKeyedSubscript:v40];

              [v53 addObject:v36];
            }
            v41 = [v34 branchLabel];
            v42 = [(GEOAvailableExperiment *)v36 _branchForLabel:v41];

            if (!v42)
            {
              v43 = [GEOAvailableExperimentBranch alloc];
              v44 = [v34 branchLabel];
              v45 = [v34 branchName];
              v46 = [(GEOAvailableExperiment *)v36 identifier];
              v42 = [(GEOAvailableExperimentBranch *)v43 initWithLabel:v44 name:v45 experimentIdentifier:v46];

              id v6 = v52;
              uint64_t v31 = v51;
              [(GEOAvailableExperiment *)v36 _addBranch:v42];
            }
            v47 = [v33 configKeyValues];
            [(GEOAvailableExperimentBranch *)v42 _setClientConfig:v47];
          }
        }
        uint64_t v30 = [obja countByEnumeratingWithState:&v56 objects:v64 count:16];
      }
      while (v30);
    }

    [v53 sortUsingComparator:&__block_literal_global_151];
    (*(void (**)(void))(*(void *)(v48 + 32) + 16))();

    id v5 = v49;
  }
}

uint64_t __77__GEOExperimentConfiguration_DebugOnly___debug_fetchAllAvailableExperiments___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 identifier];
  id v6 = [v4 identifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)_debug_setActiveExperimentBranch:(id)a3
{
  id v4 = [a3 _dictionaryRepresentation];
  [(GEOExperimentServerProxy *)self->_serverProxy _debug_setActiveExperimentBranchDictionaryRepresentation:v4];
}

- (id)_debug_bucketId
{
  v2 = NSNumber;
  objc_super v3 = [(GEOExperimentConfiguration *)self _mapsAbClientMetadata];
  id v4 = [v3 clientDatasetMetadata];
  id v5 = objc_msgSend(v2, "numberWithUnsignedInt:", objc_msgSend(v4, "bucketId"));

  return v5;
}

- (void)_debug_setBucketIdDictionaryRepresentation:(id)a3
{
}

- (id)_debug_datasetId
{
  v2 = NSNumber;
  objc_super v3 = [(GEOExperimentConfiguration *)self _mapsAbClientMetadata];
  id v4 = [v3 clientDatasetMetadata];
  id v5 = objc_msgSend(v2, "numberWithUnsignedInt:", objc_msgSend(v4, "datasetId"));

  return v5;
}

- (void)_setActiveExperimentBranchDictionaryRepresentation:(id)a3
{
}

- (void)_fetchAllAvailableExperimentsResponse:(id)a3
{
  if (a3) {
    -[GEOExperimentServerProxy _debug_fetchAllAvailableExperiments:](self->_serverProxy, "_debug_fetchAllAvailableExperiments:");
  }
}

@end