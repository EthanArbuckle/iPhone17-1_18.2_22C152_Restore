@interface SGDManagerForCTS
+ (SGDManagerForCTS)defaultInstance;
+ (id)sharedSingletonInstance;
+ (void)_logCallInteractions:(id)a3;
- (BOOL)_processMessage:(id)a3 pipeline:(id)a4 context:(id)a5 harvestMetrics:(id)a6;
- (BOOL)_shouldDissectContentWithUniqueIdentifier:(id)a3 domainIdentifier:(id)a4 bundleIdentifier:(id)a5 headers:(id)a6 accountIdentifier:(id)a7;
- (BOOL)hasAlreadyHarvestedSearchableItem:(id)a3;
- (BOOL)processMailMessage:(id)a3 headers:(id)a4 pipeline:(id)a5 context:(id)a6 harvestMetrics:(id)a7;
- (BOOL)processSearchableItem:(id)a3 pipeline:(id)a4 context:(id)a5;
- (BOOL)processSearchableItem:(id)a3 pipeline:(id)a4 context:(id)a5 harvestMetrics:(id)a6;
- (BOOL)processSearchableItemForTesting:(id)a3;
- (BOOL)processTextMessage:(id)a3 pipeline:(id)a4 context:(id)a5 harvestMetrics:(id)a6;
- (SGDManagerForCTS)initWithHarvestStoreGetter:(id)a3 xpcActivityManager:(id)a4;
- (id)serviceContext;
- (void)_performAnalyticsHeartbeatActivity:(id)a3;
- (void)_performCollectWeeklyStats:(id)a3;
- (void)_performHarvestedURLMetricUploadAcitivity:(id)a3;
- (void)_performIdentityAnalysisActivity:(id)a3;
- (void)_performMailIntelligenceTasksActivity:(id)a3;
- (void)_performMobileAssetMetadataDownloadActivity:(id)a3;
- (void)_performProcessPendingGeocodesActivity:(id)a3;
- (void)_performProcessPendingVerificationActivity:(id)a3 overrideVerificationStatus:(id)a4;
- (void)_performSendRTCActivity:(id)a3;
- (void)_performTrimActivity:(id)a3;
- (void)_performVacuumActivity;
- (void)_registerAnalyticsHeartbeatActivity;
- (void)_registerForCTSIdentityAnalysisActivity;
- (void)_registerForCTSSendRTCActivity;
- (void)_registerForCTSTrimActivity;
- (void)_registerForCTSVacuumActivity;
- (void)_registerForCollectWeeklyStats;
- (void)_registerForContactDetailCacheRebuildActivity;
- (void)_registerHarvestedURLMetricUploadActivity;
- (void)_registerMailIntelligenceTasksActivity;
- (void)_registerMobileAssetMetadataDownloadActivity;
- (void)_registerProcessPendingGeocodesActivity;
- (void)_registerProcessPendingVerificationActivity;
- (void)dealloc;
- (void)performContactDetailCacheRebuildActivity:(id)a3;
- (void)registerForCTS;
@end

@implementation SGDManagerForCTS

+ (id)sharedSingletonInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SGDManagerForCTS_sharedSingletonInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedSingletonInstance_onceToken != -1) {
    dispatch_once(&sharedSingletonInstance_onceToken, block);
  }
  v2 = (void *)sharedSingletonInstance_singletonInstance;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_harvestStoreGetter, 0);
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_geocodeLock);
  pthread_mutex_destroy(&self->_verificationLock);
  v3.receiver = self;
  v3.super_class = (Class)SGDManagerForCTS;
  [(SGDManagerForCTS *)&v3 dealloc];
}

- (BOOL)_shouldDissectContentWithUniqueIdentifier:(id)a3 domainIdentifier:(id)a4 bundleIdentifier:(id)a5 headers:(id)a6 accountIdentifier:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v15)
  {
    v17 = (void *)MEMORY[0x1CB79B230]();
    v18 = [MEMORY[0x1E4F93790] messageIdHeaderValuesFromHeaders:v15];
    if (v18)
    {
      v19 = [[SGDuplicateKey alloc] initWithMessageIdHeaderValues:v18 accountIdentifier:v16];
      if (v19)
      {
        v28 = v17;
        v20 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
        v21 = [(SGDuplicateKey *)v19 emailKey];
        int v22 = [v20 addSpotlightReferenceToEmailIfFullyDownloaded:v21 withBundleIdentifier:v14 uniqueIdentifier:v12 domainIdentifier:v13];

        if (v22)
        {
          v23 = sgLogHandle();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v24 = [(SGDuplicateKey *)v19 emailKey];
            *(_DWORD *)buf = 138413058;
            id v30 = v12;
            __int16 v31 = 2112;
            id v32 = v13;
            __int16 v33 = 2112;
            id v34 = v14;
            __int16 v35 = 2112;
            v36 = v24;
            _os_log_impl(&dword_1CA650000, v23, OS_LOG_TYPE_DEFAULT, "_shouldDissectContentWithUniqueIdentifier:%@ domainIdentifier:%@ bundleIdentifier:%@ added an additional Spotlight reference to existing harvested email record %@", buf, 0x2Au);
          }
          int v22 = 1;
        }
        v17 = v28;
      }
      else
      {
        int v22 = 1;
      }

      BOOL v26 = v19 == 0;
    }
    else
    {
      int v22 = 1;
      BOOL v26 = 1;
    }

    if (v22) {
      BOOL v25 = v26;
    }
    else {
      BOOL v25 = 1;
    }
  }
  else
  {
    BOOL v25 = 1;
  }

  return v25;
}

- (BOOL)hasAlreadyHarvestedSearchableItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueIdentifier];
  v6 = [v4 domainIdentifier];
  v7 = [v4 bundleID];
  v8 = [v4 attributeSet];
  v9 = [v8 emailHeaders];
  v10 = [v4 attributeSet];

  v11 = [v10 accountIdentifier];
  LOBYTE(self) = ![(SGDManagerForCTS *)self _shouldDissectContentWithUniqueIdentifier:v5 domainIdentifier:v6 bundleIdentifier:v7 headers:v9 accountIdentifier:v11];

  return (char)self;
}

- (BOOL)processSearchableItemForTesting:(id)a3
{
  id v4 = a3;
  v5 = [[SGRequestContext alloc] initWithServiceContext:self->_context concurrencyBehavior:0 backpressureHazard:0];
  v6 = +[SGPipeline emptyPipeline];
  LOBYTE(self) = [(SGDManagerForCTS *)self processSearchableItem:v4 pipeline:v6 context:v5];

  return (char)self;
}

- (BOOL)processSearchableItem:(id)a3 pipeline:(id)a4 context:(id)a5
{
  return [(SGDManagerForCTS *)self processSearchableItem:a3 pipeline:a4 context:a5 harvestMetrics:0];
}

- (BOOL)_processMessage:(id)a3 pipeline:(id)a4 context:(id)a5 harvestMetrics:(id)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v43 = a4;
  id v44 = a5;
  id v11 = a6;
  context = (void *)MEMORY[0x1CB79B230]();
  v39 = v11;
  [v10 setHarvestMetrics:v11];
  +[SGDPowerLog startDissectionOfMessage:v10 inContext:1];
  id v12 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
  [v12 incStatsCounterWithKey:@"dissected_items"];

  id v13 = [[SGPipelineEntity alloc] initWithMessage:v10];
  [(SGPipelineEntity *)v13 setHarvestMetrics:v39];
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3810000000;
  uint64_t v61 = 0;
  uint64_t v62 = 0;
  v60[3] = "";
  v60[4] = @"backgroundDissectAndWrite";
  uint64_t v61 = mach_absolute_time();
  uint64_t v62 = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3810000000;
  uint64_t v58 = 0;
  uint64_t v59 = 0;
  v57[3] = "";
  v57[4] = @"backgroundDissect";
  uint64_t v58 = mach_absolute_time();
  uint64_t v59 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v43 dissectOperationsForMailMessage:v10 entity:v13 inContext:v44];
  }
  else {
  id v14 = [v43 dissectOperationsForTextMessage:v10 entity:v13 inContext:v44];
  }
  id v15 = (void *)[v14 mutableCopy];
  id v16 = [(SGEntity *)v13 duplicateKey];
  BOOL v17 = [v16 entityType] == 5;

  if (v17) {
    [v43 verificationOperation:v13 withDependencies:v15];
  }
  else {
  v42 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:&__block_literal_global_142];
  }
  [v15 addObject:v42];
  if ([MEMORY[0x1E4F5DAF0] shouldHarvestEvents]) {
    [v43 geocodeOperation:v13 withDependencies:v15];
  }
  else {
  v41 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:&__block_literal_global_144];
  }
  [v15 addObject:v41];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __68__SGDManagerForCTS__processMessage_pipeline_context_harvestMetrics___block_invoke_3;
  v56[3] = &unk_1E65C0148;
  v56[4] = v57;
  v18 = [MEMORY[0x1E4F28B48] blockOperationWithBlock:v56];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v19 = v14;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v52 objects:v73 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v53;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v53 != v21) {
          objc_enumerationMutation(v19);
        }
        [v18 addDependency:*(void *)(*((void *)&v52 + 1) + 8 * v22++)];
      }
      while (v20 != v22);
      uint64_t v20 = [v19 countByEnumeratingWithState:&v52 objects:v73 count:16];
    }
    while (v20);
  }

  [v15 addObject:v18];
  v40 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
  v23 = sgLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = [v10 spotlightBundleIdentifier];
    BOOL v25 = [v10 spotlightUniqueIdentifier];
    BOOL v26 = [v10 spotlightDomainIdentifier];
    *(_DWORD *)buf = 138413315;
    v64 = v24;
    __int16 v65 = 2112;
    v66 = v25;
    __int16 v67 = 2112;
    v68 = v26;
    __int16 v69 = 2112;
    v70 = v40;
    __int16 v71 = 2117;
    v72 = v13;
    _os_log_impl(&dword_1CA650000, v23, OS_LOG_TYPE_DEFAULT, "Constructing store op for bid:%@ uid:%@ did:%@ store:%@ entity:%{sensitive}@", buf, 0x34u);
  }
  v27 = [v10 spotlightBundleIdentifier];
  v28 = [v10 spotlightUniqueIdentifier];
  v29 = [v10 spotlightDomainIdentifier];
  id v30 = [v43 storeOperation:v13 spotlightBundleIdentifier:v27 spotlightUniqueIdentifier:v28 spotlightDomainIdentifier:v29 withStore:v40 dependencies:v15];

  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __68__SGDManagerForCTS__processMessage_pipeline_context_harvestMetrics___block_invoke_145;
  v48[3] = &unk_1E65BE4B8;
  v50 = v60;
  __int16 v31 = v13;
  v49 = v31;
  v51 = v57;
  [v30 setCompletionBlock:v48];
  id v32 = [v44 processingQueue];
  [v32 addOperations:v19 waitUntilFinished:0];

  __int16 v33 = [v44 processingQueue];
  [v33 addOperation:v42];

  id v34 = [v44 processingQueue];
  [v34 addOperation:v41];

  __int16 v35 = [v44 processingQueue];
  [v35 addOperation:v18];

  if ([v44 backpressureHazard])
  {
    v36 = [v44 storageQueue];
    [v36 addOperation:v30];
  }
  else
  {
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __68__SGDManagerForCTS__processMessage_pipeline_context_harvestMetrics___block_invoke_2_148;
    v45[3] = &unk_1E65BFD88;
    id v46 = v44;
    id v47 = v30;
    +[SGSpotlightContactsAdapter notifyWhenFlushed:v45];

    v36 = v46;
  }

  [v30 waitUntilFinished];
  +[SGDPowerLog endDissectionOfMessage:v10 inContext:1];

  _Block_object_dispose(v57, 8);
  _Block_object_dispose(v60, 8);

  return 1;
}

uint64_t __68__SGDManagerForCTS__processMessage_pipeline_context_harvestMetrics___block_invoke_3(uint64_t a1)
{
  return SGRecordMeasurementState((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
}

uint64_t __68__SGDManagerForCTS__processMessage_pipeline_context_harvestMetrics___block_invoke_145(void *a1)
{
  SGRecordMeasurementState((void *)(*(void *)(a1[5] + 8) + 32));
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 48);
  return +[SGAggregateLogging harvestedEntity:v2 withElapsedTime:v3];
}

void __68__SGDManagerForCTS__processMessage_pipeline_context_harvestMetrics___block_invoke_2_148(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) storageQueue];
  [v2 addOperation:*(void *)(a1 + 40)];
}

- (BOOL)processMailMessage:(id)a3 headers:(id)a4 pipeline:(id)a5 context:(id)a6 harvestMetrics:(id)a7
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v38 = v15;
  if ([v12 isSent])
  {
    BOOL v17 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
    [v17 registerSentMailMessage:v12];
LABEL_7:

    goto LABEL_8;
  }
  BOOL v17 = [v12 from];
  uint64_t v18 = [v17 emailAddress];
  if (!v18) {
    goto LABEL_7;
  }
  id v19 = (void *)v18;
  uint64_t v20 = [v12 accountHandles];
  [v12 from];
  id v21 = v13;
  id v22 = v16;
  v24 = id v23 = v14;
  BOOL v25 = [v24 emailAddress];
  int v37 = [v20 containsObject:v25];

  id v14 = v23;
  id v16 = v22;
  id v13 = v21;

  if (v37)
  {
    BOOL v26 = sgLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [v12 uniqueIdentifier];
      *(_DWORD *)buf = 138412290;
      v40 = v27;
      v28 = "SGSimpleMailMessage %@ appears to be a sent email not in the sent mail folder, so it will be dropped from th"
            "e dissector pipeline.";
LABEL_12:
      _os_log_impl(&dword_1CA650000, v26, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
    }
LABEL_13:

    BOOL v35 = 0;
    id v34 = v38;
    goto LABEL_14;
  }
LABEL_8:
  v29 = [v12 spotlightUniqueIdentifier];
  id v30 = [v12 spotlightDomainIdentifier];
  __int16 v31 = [v12 spotlightBundleIdentifier];
  id v32 = [v12 source];
  BOOL v33 = [(SGDManagerForCTS *)self _shouldDissectContentWithUniqueIdentifier:v29 domainIdentifier:v30 bundleIdentifier:v31 headers:v13 accountIdentifier:v32];

  if (!v33)
  {
    BOOL v26 = sgLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [v12 uniqueIdentifier];
      *(_DWORD *)buf = 138412290;
      v40 = v27;
      v28 = "SGSimpleMailMessage %@ has been processed without dissection, so it will be dropped from the dissector pipeline.";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  id v34 = v38;
  BOOL v35 = [(SGDManagerForCTS *)self _processMessage:v12 pipeline:v14 context:v38 harvestMetrics:v16];
LABEL_14:

  return v35;
}

- (BOOL)processTextMessage:(id)a3 pipeline:(id)a4 context:(id)a5 harvestMetrics:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v10 spotlightUniqueIdentifier];
  id v15 = [v10 spotlightDomainIdentifier];
  id v16 = [v10 spotlightBundleIdentifier];
  BOOL v17 = [(SGDManagerForCTS *)self _shouldDissectContentWithUniqueIdentifier:v14 domainIdentifier:v15 bundleIdentifier:v16 headers:0 accountIdentifier:0];

  if (v17)
  {
    BOOL v18 = [(SGDManagerForCTS *)self _processMessage:v10 pipeline:v11 context:v12 harvestMetrics:v13];
  }
  else
  {
    id v19 = sgLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [v10 uniqueIdentifier];
      int v22 = 138412290;
      id v23 = v20;
      _os_log_impl(&dword_1CA650000, v19, OS_LOG_TYPE_DEFAULT, "SGTextMessage %@ has been processed without dissection, so it will be dropped from the dissector pipeline.", (uint8_t *)&v22, 0xCu);
    }
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)processSearchableItem:(id)a3 pipeline:(id)a4 context:(id)a5 harvestMetrics:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v50 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, self, @"SGDManagerForCTS.m", 818, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];
  }
  id v14 = (void *)MEMORY[0x1CB79B230]();
  id v15 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
  id v16 = [v11 bundleID];
  BOOL v17 = [v11 uniqueIdentifier];
  BOOL v18 = [v11 domainIdentifier];
  int v19 = [v15 tombstoneExistsForSpotlightReferenceWithBundleIdentifier:v16 uniqueIdentifier:v17 domainIdentifier:v18];

  if (v19)
  {
    uint64_t v20 = sgLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v20, OS_LOG_TYPE_DEFAULT, "Tombstone exists for queued item; deleting.", buf, 2u);
    }
    BOOL v21 = 0;
    int v22 = v50;
    goto LABEL_25;
  }
  id v23 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
  uint64_t v24 = [v11 bundleID];
  BOOL v25 = [v11 uniqueIdentifier];
  char v26 = [v23 reimportRequestsContainBundleIdentifier:v24 uniqueIdentifier:v25];

  if ((v26 & 1) == 0)
  {
    if ([v12 backpressureHazard])
    {
      if (processSearchableItem_pipeline_context_harvestMetrics___pasOnceToken60 != -1) {
        dispatch_once(&processSearchableItem_pipeline_context_harvestMetrics___pasOnceToken60, &__block_literal_global_124);
      }
      v27 = processSearchableItem_pipeline_context_harvestMetrics___pasExprOnceResult;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__SGDManagerForCTS_processSearchableItem_pipeline_context_harvestMetrics___block_invoke_2;
      block[3] = &unk_1E65BFD88;
      long long v52 = v11;
      id v53 = v13;
      dispatch_async(v27, block);

      v28 = v52;
    }
    else
    {
      v29 = +[SGDPluginManager sharedInstance];
      id v30 = (id)[v29 processSearchableItem:v11 harvestMetrics:v13];

      v28 = sgLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v31 = [v11 uniqueIdentifier];
        *(_DWORD *)buf = 138412290;
        long long v55 = v31;
        _os_log_impl(&dword_1CA650000, v28, OS_LOG_TYPE_DEFAULT, "Plugins finished CSSI processing via CTS: %@", buf, 0xCu);
      }
    }
  }
  if (([MEMORY[0x1E4F93770] searchableItemIsEligibleForDissectorPipeline:v11 targetPluginsCustomAttributeName:@"com_apple_suggestions_targetPlugins"] & 1) == 0)
  {
    uint64_t v20 = sgLogHandle();
    int v22 = v50;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v39 = [v11 uniqueIdentifier];
      *(_DWORD *)buf = 138412290;
      long long v55 = v39;
      _os_log_impl(&dword_1CA650000, v20, OS_LOG_TYPE_INFO, "Dissector pipeline ignoring %@", buf, 0xCu);
    }
    BOOL v21 = 0;
    goto LABEL_25;
  }
  id v32 = [v11 bundleID];
  int v33 = [v32 isEqualToString:*MEMORY[0x1E4F5DC38]];

  int v22 = v50;
  if (v33)
  {
    id v34 = [v11 attributeSet];
    BOOL v35 = [v34 authors];
    uint64_t v36 = [v35 count];

    if (v36)
    {
      int v37 = [v11 attributeSet];
      id v38 = [v37 accountIdentifier];

      if (v38)
      {
        uint64_t v20 = +[SGMessage messageWithSearchableItem:v11];
        BOOL v21 = [(SGDManagerForCTS *)self processTextMessage:v20 pipeline:v50 context:v12 harvestMetrics:v13];
LABEL_25:

        goto LABEL_26;
      }
      v45 = sgLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        id v46 = [v11 uniqueIdentifier];
        *(_DWORD *)buf = 138412290;
        long long v55 = v46;
        v48 = "text message CSSI %@ has no accountIdentifier";
        goto LABEL_33;
      }
    }
    else
    {
      v45 = sgLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        id v46 = [v11 uniqueIdentifier];
        *(_DWORD *)buf = 138412290;
        long long v55 = v46;
        v48 = "text message CSSI %@ has no authors";
LABEL_33:
        _os_log_fault_impl(&dword_1CA650000, v45, OS_LOG_TYPE_FAULT, v48, buf, 0xCu);
        goto LABEL_34;
      }
    }
  }
  else
  {
    v40 = [v11 bundleID];
    int v41 = [v40 isEqualToString:*MEMORY[0x1E4F5DC28]];

    if (v41)
    {
      uint64_t v20 = +[SGMessage messageWithSearchableItem:v11];
      v42 = [v11 attributeSet];
      id v43 = [v42 emailHeaders];
      BOOL v21 = [(SGDManagerForCTS *)self processMailMessage:v20 headers:v43 pipeline:v50 context:v12 harvestMetrics:v13];

      goto LABEL_25;
    }
    v45 = sgLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      id v46 = [v11 uniqueIdentifier];
      id v47 = [v11 bundleID];
      *(_DWORD *)buf = 138412546;
      long long v55 = v46;
      __int16 v56 = 2112;
      v57 = v47;
      _os_log_fault_impl(&dword_1CA650000, v45, OS_LOG_TYPE_FAULT, "Unhandled CSSI %@ from %@ in -[SGDManagerForCTS processSearchableItem:pipeline:context:]", buf, 0x16u);

LABEL_34:
    }
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
    abort();
  }
  BOOL v21 = 0;
LABEL_26:

  return v21;
}

void __74__SGDManagerForCTS_processSearchableItem_pipeline_context_harvestMetrics___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = +[SGDPluginManager sharedInstance];
  id v3 = (id)[v2 processSearchableItem:*(void *)(a1 + 32) harvestMetrics:*(void *)(a1 + 40)];

  id v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [*(id *)(a1 + 32) uniqueIdentifier];
    int v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEFAULT, "Plugins finished async CSSI processing via CTS: %@", (uint8_t *)&v6, 0xCu);
  }
}

void __74__SGDManagerForCTS_processSearchableItem_pipeline_context_harvestMetrics___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"processSearchableItem-plugins" qosClass:9];
  id v2 = (void *)processSearchableItem_pipeline_context_harvestMetrics___pasExprOnceResult;
  processSearchableItem_pipeline_context_harvestMetrics___pasExprOnceResult = v1;
}

- (void)_performHarvestedURLMetricUploadAcitivity:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  int v3 = [MEMORY[0x1E4F93B10] isClassCLocked];
  id v4 = sgLogHandle();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEFAULT, "[HarvestedURLMetric] Can not access entity store. Waiting for later.", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEFAULT, "[HarvestedURLMetric] Performing harvested URL metric upload CTS job.", buf, 2u);
    }

    id v4 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-777600.0];
    int v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:86400.0];
    v7 = [MEMORY[0x1E4FADB70] baseURLStrings];
    uint64_t v8 = [v7 firstObject];
    v9 = (void *)v8;
    id v10 = @"facetime.apple.com/join";
    if (v8) {
      id v10 = (__CFString *)v8;
    }
    id v11 = v10;

    id v12 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
    id v13 = [v12 urlsFoundBetweenStartDate:v4 endDate:v6 excludingBundleIdentifiers:0 containingSubstring:v11 flagFilter:0 limit:100];

    id v14 = sgLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v13 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v62 = v15;
      _os_log_impl(&dword_1CA650000, v14, OS_LOG_TYPE_DEFAULT, "[HarvestedURLMetric] Got %tu URL(s) in the store.", buf, 0xCu);
    }

    if ([(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v47])
    {
      id v16 = sgLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA650000, v16, OS_LOG_TYPE_DEFAULT, "[HarvestedURLMetric] Deferring for later right after getting URLs", buf, 2u);
      }

      [(SGXPCActivityManagerProtocol *)self->_xpcActivityManager setState:v47 state:3];
    }
    else
    {
      v42 = v11;
      id v43 = v6;
      id v44 = v4;
      id v46 = objc_opt_new();
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      int v41 = v13;
      BOOL v17 = v13;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v53 objects:v60 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v54;
        while (2)
        {
          uint64_t v21 = 0;
          uint64_t v45 = v19;
          do
          {
            if (*(void *)v54 != v20) {
              objc_enumerationMutation(v17);
            }
            int v22 = *(void **)(*((void *)&v53 + 1) + 8 * v21);
            id v23 = (void *)MEMORY[0x1CB79B230]();
            if (([v22 flags] & 8) != 0)
            {
              uint64_t v24 = v17;
              BOOL v25 = [v22 bundleIdentifier];
              char v26 = [v46 objectForKeyedSubscript:v25];
              if (!v26)
              {
                v58[0] = @"offeredCount";
                v58[1] = @"acceptedCount";
                v59[0] = &unk_1F2535730;
                v59[1] = &unk_1F2535730;
                v58[2] = @"bundleIdentifier";
                v27 = objc_msgSend(v25, "_pas_stringBackedByUTF8CString");
                v58[3] = @"urlType";
                v59[2] = v27;
                v59[3] = @"FaceTime";
                v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:4];
                char v26 = (void *)[v28 mutableCopy];

                [v46 setObject:v26 forKeyedSubscript:v25];
              }
              v29 = [v26 objectForKeyedSubscript:@"offeredCount"];
              id v30 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v29, "intValue") + 1);
              [v26 setObject:v30 forKeyedSubscript:@"offeredCount"];

              if (([v22 flags] & 2) != 0)
              {
                __int16 v31 = [v26 objectForKeyedSubscript:@"acceptedCount"];
                id v32 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v31, "intValue") + 1);
                [v26 setObject:v32 forKeyedSubscript:@"acceptedCount"];
              }
              if ([(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v47])
              {
                v40 = sgLogHandle();
                id v11 = v42;
                int v6 = v43;
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1CA650000, v40, OS_LOG_TYPE_DEFAULT, "[HarvestedURLMetric] Deferring for later while enumerating URLs", buf, 2u);
                }

                [(SGXPCActivityManagerProtocol *)self->_xpcActivityManager setState:v47 state:3];
                id v4 = v44;
                goto LABEL_43;
              }

              BOOL v17 = v24;
              uint64_t v19 = v45;
            }
            ++v21;
          }
          while (v19 != v21);
          uint64_t v19 = [v17 countByEnumeratingWithState:&v53 objects:v60 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      int v33 = [v46 allValues];
      uint64_t v34 = [v33 countByEnumeratingWithState:&v49 objects:v57 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v50 != v36) {
              objc_enumerationMutation(v33);
            }
            uint64_t v38 = *(void *)(*((void *)&v49 + 1) + 8 * i);
            v39 = sgLogHandle();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v62 = v38;
              _os_log_impl(&dword_1CA650000, v39, OS_LOG_TYPE_DEFAULT, "[HarvestedURLMetric] payload: %@", buf, 0xCu);
            }

            AnalyticsSendEvent();
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v49 objects:v57 count:16];
        }
        while (v35);
      }

      uint64_t v24 = sgLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA650000, v24, OS_LOG_TYPE_DEFAULT, "[HarvestedURLMetric] Done with harvested URL metric upload CTS job.", buf, 2u);
      }
      int v6 = v43;
      id v4 = v44;
      id v11 = v42;
LABEL_43:
      id v13 = v41;
    }
  }
}

- (void)_registerHarvestedURLMetricUploadActivity
{
  id location = 0;
  objc_initWeak(&location, self);
  int v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_INFO, "[HarvestedURLMetric] Registering for harvested URL metrics upload task with CTS", buf, 2u);
  }

  xpcActivityManager = self->_xpcActivityManager;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__SGDManagerForCTS__registerHarvestedURLMetricUploadActivity__block_invoke;
  v5[3] = &unk_1E65B64B8;
  objc_copyWeak(&v6, &location);
  [(SGXPCActivityManagerProtocol *)xpcActivityManager registerForActivity:10 handler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __61__SGDManagerForCTS__registerHarvestedURLMetricUploadActivity__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _performHarvestedURLMetricUploadAcitivity:v3];
}

- (void)_performAnalyticsHeartbeatActivity:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2050000000;
  id v4 = (void *)getPSUSummarizationAnalyticsClass_softClass;
  uint64_t v10 = getPSUSummarizationAnalyticsClass_softClass;
  if (!getPSUSummarizationAnalyticsClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getPSUSummarizationAnalyticsClass_block_invoke;
    v6[3] = &unk_1E65C0148;
    v6[4] = &v7;
    __getPSUSummarizationAnalyticsClass_block_invoke((uint64_t)v6);
    id v4 = (void *)v8[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v7, 8);
  [v5 logHeartbeat];
}

- (void)_registerAnalyticsHeartbeatActivity
{
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_INFO, "Registering for SGXPCActivityAnalyticsHeartbeat with CTS", buf, 2u);
  }

  xpcActivityManager = self->_xpcActivityManager;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__SGDManagerForCTS__registerAnalyticsHeartbeatActivity__block_invoke;
  v5[3] = &unk_1E65B64B8;
  objc_copyWeak(&v6, &location);
  [(SGXPCActivityManagerProtocol *)xpcActivityManager registerForActivity:14 handler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __55__SGDManagerForCTS__registerAnalyticsHeartbeatActivity__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _performAnalyticsHeartbeatActivity:v3];
}

- (void)_performMailIntelligenceTasksActivity:(id)a3
{
  id v5 = a3;
  int v6 = [MEMORY[0x1E4F93B10] lockState];
  uint64_t v7 = sgLogHandle();
  uint64_t v8 = v7;
  if (v6 != 1)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_INFO, "SGDManagerForCTS _performMailIntelligenceTasksActivity: Starting CTS job for Mail Intelligence Tasks", buf, 2u);
    }

    *(void *)buf = 0;
    BOOL v25 = buf;
    uint64_t v26 = 0x2020000000;
    char v27 = 1;
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__SGDManagerForCTS__performMailIntelligenceTasksActivity___block_invoke;
    v16[3] = &unk_1E65B65F8;
    uint64_t v18 = buf;
    id v9 = v5;
    id v17 = v9;
    uint64_t v19 = &v20;
    uint64_t v10 = (void *)MEMORY[0x1CB79B4C0](v16);
    +[SGMIMaintenance executeDailyTasksWithShouldContinue:v10];
    if (v25[24]) {
      goto LABEL_18;
    }
    if (*((unsigned char *)v21 + 24))
    {
      *((unsigned char *)v21 + 24) = 1;
    }
    else
    {
      BOOL should_defer = xpc_activity_should_defer((xpc_activity_t)v9);
      *((unsigned char *)v21 + 24) = should_defer;
      if (!should_defer)
      {
        id v12 = sgLogHandle();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
          goto LABEL_17;
        }
        *(_WORD *)uint64_t v15 = 0;
        id v13 = "Mail Intelligence Task interrupted by device lock state change";
LABEL_16:
        _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_INFO, v13, v15, 2u);
LABEL_17:

LABEL_18:
        _Block_object_dispose(&v20, 8);
        _Block_object_dispose(buf, 8);
        goto LABEL_19;
      }
    }
    if (!xpc_activity_set_state((xpc_activity_t)v9, 3))
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"SGDManagerForCTS.m" lineNumber:708 description:@"Unexpected failure of CTS deferral"];
    }
    id v12 = sgLogHandle();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_17;
    }
    *(_WORD *)uint64_t v15 = 0;
    id v13 = "Mail Intelligence Task deferred by CTS";
    goto LABEL_16;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1CA650000, v8, OS_LOG_TYPE_FAULT, "SGDManagerForCTS _performMailIntelligenceTasksActivity: Activity running even though Class A protected data is unavailable", buf, 2u);
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
    abort();
  }
LABEL_19:
}

uint64_t __58__SGDManagerForCTS__performMailIntelligenceTasksActivity___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
LABEL_5:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    if (([MEMORY[0x1E4F93B10] isUnlocked] & 1) == 0) {
      goto LABEL_5;
    }
  }
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (void)_registerMailIntelligenceTasksActivity
{
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_INFO, "Registering for mail event aggregation processing with CTS", buf, 2u);
  }

  xpcActivityManager = self->_xpcActivityManager;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__SGDManagerForCTS__registerMailIntelligenceTasksActivity__block_invoke;
  v5[3] = &unk_1E65B64B8;
  objc_copyWeak(&v6, &location);
  [(SGXPCActivityManagerProtocol *)xpcActivityManager registerForActivity:9 handler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __58__SGDManagerForCTS__registerMailIntelligenceTasksActivity__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _performMailIntelligenceTasksActivity:v3];
}

- (void)_performProcessPendingVerificationActivity:(id)a3 overrideVerificationStatus:(id)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  id v44 = a4;
  v68[2] = 0;
  v68[0] = @"com.apple.suggestd.process-pending-verification";
  v68[1] = mach_absolute_time();
  id v5 = sgEventsLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "SGDManagerForCTS _performProcessPendingVerificationActivity: Starting CTS job for document verification.", buf, 2u);
  }

  id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v7 = dispatch_queue_attr_make_with_qos_class(v6, (dispatch_qos_class_t)5u, 0);
  queue = dispatch_queue_create("com.apple.suggestions.verification-write", v7);

  if (pthread_mutex_trylock(&self->_verificationLock))
  {
    log = sgEventsLogHandle();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, log, OS_LOG_TYPE_ERROR, "SGDManagerForCTS _performProcessPendingVerificationActivity: Could not obtain a lock for document verification.", buf, 2u);
    }
  }
  else
  {
    uint64_t v8 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
    id v9 = [v8 emailsPendingVerification];

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    log = v9;
    uint64_t v10 = [log countByEnumeratingWithState:&v64 objects:v72 count:16];
    if (v10)
    {
      uint64_t v47 = *(void *)v65;
      while (2)
      {
        uint64_t v48 = v10;
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v65 != v47) {
            objc_enumerationMutation(log);
          }
          long long v52 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          if (v51
            && [(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v51])
          {
            uint64_t v35 = sgEventsLogHandle();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v36 = [v52 loggingIdentifier];
              *(_DWORD *)buf = 138543362;
              __int16 v71 = v36;
              _os_log_impl(&dword_1CA650000, v35, OS_LOG_TYPE_DEFAULT, "SGDManagerForCTS _performProcessPendingVerificationActivity: Deferring CTS document verification for [SGEntity (%{public}@)]", buf, 0xCu);
            }
            if (([(SGXPCActivityManagerProtocol *)self->_xpcActivityManager setState:v51 state:3] & 1) == 0)
            {
              int v37 = sgEventsLogHandle();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                uint64_t v38 = [v52 loggingIdentifier];
                *(_DWORD *)buf = 138543362;
                __int16 v71 = v38;
                _os_log_error_impl(&dword_1CA650000, v37, OS_LOG_TYPE_ERROR, "SGDManagerForCTS _performProcessPendingVerificationActivity: Could not defer CTS document verification for [SGEntity (%{public}@)]", buf, 0xCu);
              }
            }
            goto LABEL_45;
          }
          id v12 = [v52 duplicateKey];
          id v13 = [v12 entityKey];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            uint64_t v15 = [v52 duplicateKey];
            id v16 = [v15 entityKey];

            long long v49 = [v16 messageId];
            if (v49)
            {
              id v17 = sgEventsLogHandle();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v18 = [v52 loggingIdentifier];
                *(_DWORD *)buf = 138543362;
                __int16 v71 = v18;
                _os_log_impl(&dword_1CA650000, v17, OS_LOG_TYPE_DEFAULT, "SGDManagerForCTS _performProcessPendingVerificationActivity: Starting CTS document verification for [SGEntity (%{public}@)]", buf, 0xCu);
              }
              dispatch_semaphore_t v43 = dispatch_semaphore_create(0);
              uint64_t v19 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
              uint64_t v45 = [v19 loadEntitiesFoundInEmail:v16 entityType:2];

              if (v44)
              {
                uint64_t v42 = [v44 integerValue];
                uint64_t v20 = 0;
              }
              else
              {
                uint64_t v24 = +[SGMailClientUtil sharedInstance];
                id v63 = 0;
                uint64_t v25 = [v24 verifyDKIMSignatureForMailWithIdentifier:v49 error:&v63];
                v40 = v24;
                id v39 = v63;
                uint64_t v42 = v25;
                if (v25) {
                  unsigned __int16 v26 = 10;
                }
                else {
                  unsigned __int16 v26 = 11;
                }
                long long v59 = 0u;
                long long v60 = 0u;
                long long v61 = 0u;
                long long v62 = 0u;
                id v27 = v45;
                uint64_t v28 = [v27 countByEnumeratingWithState:&v59 objects:v69 count:16];
                if (v28)
                {
                  uint64_t v29 = *(void *)v60;
                  do
                  {
                    for (uint64_t j = 0; j != v28; ++j)
                    {
                      if (*(void *)v60 != v29) {
                        objc_enumerationMutation(v27);
                      }
                      uint64_t v31 = *(void *)(*((void *)&v59 + 1) + 8 * j);
                      id v32 = +[SGRTCLogging defaultLogger];
                      [v32 logEventInteractionForEntity:v31 interface:0 actionType:v26];
                    }
                    uint64_t v28 = [v27 countByEnumeratingWithState:&v59 objects:v69 count:16];
                  }
                  while (v28);
                }

                uint64_t v20 = v39;
              }
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __90__SGDManagerForCTS__performProcessPendingVerificationActivity_overrideVerificationStatus___block_invoke;
              block[3] = &unk_1E65B65D0;
              uint64_t v58 = v42;
              void block[4] = v52;
              void block[5] = self;
              long long v54 = v16;
              id v55 = v45;
              id v56 = v20;
              dispatch_semaphore_t v57 = v43;
              uint64_t v22 = v43;
              id v33 = v20;
              id v34 = v45;
              dispatch_async(queue, block);
              dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
            }
            else
            {
              uint64_t v22 = sgEventsLogHandle();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
              {
                char v23 = [v52 loggingIdentifier];
                *(_DWORD *)buf = 138543362;
                __int16 v71 = v23;
                _os_log_fault_impl(&dword_1CA650000, v22, OS_LOG_TYPE_FAULT, "SGDManagerForCTS _performProcessPendingVerificationActivity: Entity pending source verification did not have a message ID. [SGEntity (%{public}@)]", buf, 0xCu);
              }
            }
          }
          else
          {
            id v16 = sgEventsLogHandle();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              uint64_t v21 = [v52 loggingIdentifier];
              *(_DWORD *)buf = 138543362;
              __int16 v71 = v21;
              _os_log_fault_impl(&dword_1CA650000, v16, OS_LOG_TYPE_FAULT, "SGDManagerForCTS _performProcessPendingVerificationActivity: Entity pending source verification did not have an email entity key. [SGEntity (%{public}@)]", buf, 0xCu);
            }
          }
        }
        uint64_t v10 = [log countByEnumeratingWithState:&v64 objects:v72 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_45:

    pthread_mutex_unlock(&self->_verificationLock);
  }

  SGRecordMeasurementState(v68);
  SGRecordMeasurementState(v68);
}

intptr_t __90__SGDManagerForCTS__performProcessPendingVerificationActivity_overrideVerificationStatus___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 80);
  switch(v2)
  {
    case 2:
      id v6 = sgEventsLogHandle();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
LABEL_10:

        id v5 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 8) + 16))();
        uint64_t v10 = (void *)MEMORY[0x1CB79B230]();
        id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", *(void *)(a1 + 48), 0);
        [v5 deleteMessages:v11];

LABEL_11:
        return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
      }
      uint64_t v7 = *(void **)(a1 + 64);
      uint64_t v8 = [*(id *)(a1 + 32) loggingIdentifier];
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      id v17 = v8;
      id v9 = "SGDManagerForCTS _performProcessPendingVerificationActivity: DKIM verification resulted in permanent failure:"
           " %@. [SGEntity (%{public}@)]";
LABEL_14:
      _os_log_error_impl(&dword_1CA650000, v6, OS_LOG_TYPE_ERROR, v9, buf, 0x16u);

      goto LABEL_10;
    case 1:
      id v6 = sgEventsLogHandle();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      id v13 = *(void **)(a1 + 64);
      uint64_t v8 = [*(id *)(a1 + 32) loggingIdentifier];
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v13;
      __int16 v16 = 2114;
      id v17 = v8;
      id v9 = "SGDManagerForCTS _performProcessPendingVerificationActivity: DKIM verification resulted in temporary failure "
           "for 2nd time. Treating as permanent failure: %@. [SGEntity (%{public}@)]";
      goto LABEL_14;
    case 0:
      id v3 = sgEventsLogHandle();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = [*(id *)(a1 + 32) loggingIdentifier];
        *(_DWORD *)buf = 138543362;
        uint64_t v15 = v4;
        _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEFAULT, "SGDManagerForCTS _performProcessPendingVerificationActivity: Successfully verified DKIM signature. [SGEntity (%{public}@)]", buf, 0xCu);
      }
      id v5 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 8) + 16))();
      [v5 writeEmailVerificationResultForEmailWithKey:*(void *)(a1 + 48) eventEntities:*(void *)(a1 + 56)];
      goto LABEL_11;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
}

- (void)_registerProcessPendingVerificationActivity
{
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_INFO, "Registering for pending-verification processing with CTS", buf, 2u);
  }

  xpcActivityManager = self->_xpcActivityManager;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__SGDManagerForCTS__registerProcessPendingVerificationActivity__block_invoke;
  v5[3] = &unk_1E65B64B8;
  objc_copyWeak(&v6, &location);
  [(SGXPCActivityManagerProtocol *)xpcActivityManager registerForActivity:8 handler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __63__SGDManagerForCTS__registerProcessPendingVerificationActivity__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([MEMORY[0x1E4F5DAF0] enableDKIMEnforcement])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _performProcessPendingVerificationActivity:v4 overrideVerificationStatus:0];
  }
}

- (void)_performProcessPendingGeocodesActivity:(id)a3
{
  id v4 = a3;
  v26[2] = 0;
  v26[0] = @"com.apple.suggestd.process-pending-geocodes";
  v26[1] = mach_absolute_time();
  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v6 = dispatch_queue_attr_make_with_qos_class(v5, (dispatch_qos_class_t)5u, 0);
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.suggestions.geocode-write", v6);

  if (!pthread_mutex_trylock(&self->_geocodeLock))
  {
    p_geocodeLock = &self->_geocodeLock;
    id v8 = 0;
    while (1)
    {
      if (![MEMORY[0x1E4F5DAF0] allowGeocode])
      {
        id v11 = v8;
        goto LABEL_15;
      }
      id v9 = (void *)MEMORY[0x1CB79B230]();
      uint64_t v10 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
      id v11 = [v10 nextPendingGeocode];

      if (!v11) {
        goto LABEL_15;
      }
      if (v4
        && [(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v4])
      {
        break;
      }
      id v12 = (void *)MEMORY[0x1CB79B230]();
      id v13 = +[SGStorageEvent storageEventFromEntity:v11];
      dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
      uint64_t v15 = (void *)MEMORY[0x1E4F5DA10];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __59__SGDManagerForCTS__performProcessPendingGeocodesActivity___block_invoke;
      v20[3] = &unk_1E65B65A8;
      uint64_t v21 = v7;
      id v8 = v11;
      id v22 = v8;
      char v23 = self;
      __int16 v16 = v14;
      uint64_t v24 = v16;
      [v15 geocodeEvent:v13 withCallback:v20];
      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    }
    id v17 = sgLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v17, OS_LOG_TYPE_INFO, "Deferring remaining geocodes for later", buf, 2u);
    }

    if (([(SGXPCActivityManagerProtocol *)self->_xpcActivityManager setState:v4 state:3] & 1) == 0)
    {
      uint64_t v18 = sgLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA650000, v18, OS_LOG_TYPE_ERROR, "Invalid state transition to DEFER", buf, 2u);
      }
    }
LABEL_15:
    pthread_mutex_unlock(p_geocodeLock);
  }
  SGRecordMeasurementState(v26);

  SGRecordMeasurementState(v26);
}

void __59__SGDManagerForCTS__performProcessPendingGeocodesActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__SGDManagerForCTS__performProcessPendingGeocodesActivity___block_invoke_2;
  v7[3] = &unk_1E65C0638;
  id v4 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v5 = *(void **)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 48);
  id v11 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

intptr_t __59__SGDManagerForCTS__performProcessPendingGeocodesActivity___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v3 = [*(id *)(a1 + 40) locations];
  id v4 = (void *)[v2 initWithArray:v3];
  [*(id *)(a1 + 32) setLocations:v4];

  id v5 = [*(id *)(a1 + 40) when];
  [*(id *)(a1 + 32) setTimeRange:v5];

  id v6 = [*(id *)(a1 + 32) tags];
  dispatch_queue_t v7 = [MEMORY[0x1E4F5D9F0] allDay];
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
    id v9 = [*(id *)(a1 + 32) timeRange];
    if (([v9 isValidAllDayRange] & 1) == 0) {
      __assert_rtn("-[SGDManagerForCTS _performProcessPendingGeocodesActivity:]_block_invoke_2", "SGDManagerForCTS.m", 550, "[nextGeocode.timeRange isValidAllDayRange]");
    }
  }
  uint64_t v10 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 48) + 8) + 16))();
  [v10 writeEntityGeocodeResultToDb:*(void *)(a1 + 32)];

  id v11 = *(NSObject **)(a1 + 56);
  return dispatch_semaphore_signal(v11);
}

- (void)_registerProcessPendingGeocodesActivity
{
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_INFO, "Registering for pending-geocode processing with CTS", buf, 2u);
  }

  xpcActivityManager = self->_xpcActivityManager;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__SGDManagerForCTS__registerProcessPendingGeocodesActivity__block_invoke;
  v5[3] = &unk_1E65B64B8;
  objc_copyWeak(&v6, &location);
  [(SGXPCActivityManagerProtocol *)xpcActivityManager registerForActivity:7 handler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __59__SGDManagerForCTS__registerProcessPendingGeocodesActivity__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _performProcessPendingGeocodesActivity:v3];
}

- (void)performContactDetailCacheRebuildActivity:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 0;
  id v5 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__SGDManagerForCTS_performContactDetailCacheRebuildActivity___block_invoke;
  v7[3] = &unk_1E65B6508;
  id v6 = v4;
  id v8 = v6;
  id v9 = self;
  uint64_t v10 = v11;
  [v5 rebuildContactDetailsCacheWithShouldContinueBlock:v7];

  _Block_object_dispose(v11, 8);
}

uint64_t __61__SGDManagerForCTS_performContactDetailCacheRebuildActivity___block_invoke(void *a1)
{
  if (!a1[4] || !objc_msgSend(*(id *)(a1[5] + 168), "shouldDefer:")) {
    return 1;
  }
  id v2 = sgLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1CA650000, v2, OS_LOG_TYPE_DEFAULT, "Deferring CD cache rebuild", v4, 2u);
  }

  [*(id *)(a1[5] + 168) setState:a1[4] state:3];
  uint64_t result = 0;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  return result;
}

- (void)_registerForContactDetailCacheRebuildActivity
{
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_INFO, "Registering for contact detail cache rebuilding with CTS", buf, 2u);
  }

  xpcActivityManager = self->_xpcActivityManager;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__SGDManagerForCTS__registerForContactDetailCacheRebuildActivity__block_invoke;
  v5[3] = &unk_1E65B64B8;
  objc_copyWeak(&v6, &location);
  [(SGXPCActivityManagerProtocol *)xpcActivityManager registerForActivity:6 handler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __65__SGDManagerForCTS__registerForContactDetailCacheRebuildActivity__block_invoke(uint64_t a1, void *a2)
{
  v5[2] = 0;
  id v4 = a2;
  v5[0] = @"com.apple.suggestd.cd-cache-rebuild";
  v5[1] = mach_absolute_time();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performContactDetailCacheRebuildActivity:v4];

  SGRecordMeasurementState(v5);
  SGRecordMeasurementState(v5);
}

- (void)_performSendRTCActivity:(id)a3
{
  id v4 = a3;
  v14[2] = 0;
  v14[0] = @"com.apple.suggestd.sendrtc";
  v14[1] = mach_absolute_time();
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = +[SGRTCLogging defaultLogger];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__SGDManagerForCTS__performSendRTCActivity___block_invoke;
  void v11[3] = &unk_1E65B6558;
  id v7 = v4;
  id v12 = v7;
  id v13 = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__SGDManagerForCTS__performSendRTCActivity___block_invoke_59;
  v9[3] = &unk_1E65B6580;
  id v8 = v5;
  uint64_t v10 = v8;
  [v6 sendRTCLogsWithShouldContinueBlock:v11 completion:v9];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  SGRecordMeasurementState(v14);

  SGRecordMeasurementState(v14);
}

uint64_t __44__SGDManagerForCTS__performSendRTCActivity___block_invoke(uint64_t a1)
{
  if (!*(void *)(a1 + 32) || !objc_msgSend(*(id *)(*(void *)(a1 + 40) + 168), "shouldDefer:")) {
    return 1;
  }
  uint64_t v1 = sgLogHandle();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1CA650000, v1, OS_LOG_TYPE_DEFAULT, "Deferring sending of RTC Logs", v3, 2u);
  }

  return 0;
}

intptr_t __44__SGDManagerForCTS__performSendRTCActivity___block_invoke_59(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_registerForCTSSendRTCActivity
{
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_INFO, "Registering for RTC log sending with CTS", buf, 2u);
  }

  xpcActivityManager = self->_xpcActivityManager;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__SGDManagerForCTS__registerForCTSSendRTCActivity__block_invoke;
  void v5[3] = &unk_1E65B64B8;
  objc_copyWeak(&v6, &location);
  [(SGXPCActivityManagerProtocol *)xpcActivityManager registerForActivity:4 handler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __50__SGDManagerForCTS__registerForCTSSendRTCActivity__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _performSendRTCActivity:v3];
}

- (void)_performIdentityAnalysisActivity:(id)a3
{
  v6[2] = 0;
  id v5 = a3;
  v6[0] = @"com.apple.suggestd.identityanalysis";
  v6[1] = mach_absolute_time();
  id v4 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
  [v4 analyzeMergeBlobs:v5];

  SGRecordMeasurementState(v6);
  SGRecordMeasurementState(v6);
}

- (void)_registerForCTSIdentityAnalysisActivity
{
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_INFO, "Registering for identity analysis with CTS", buf, 2u);
  }

  xpcActivityManager = self->_xpcActivityManager;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__SGDManagerForCTS__registerForCTSIdentityAnalysisActivity__block_invoke;
  void v5[3] = &unk_1E65B64B8;
  objc_copyWeak(&v6, &location);
  [(SGXPCActivityManagerProtocol *)xpcActivityManager registerForActivity:3 handler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __59__SGDManagerForCTS__registerForCTSIdentityAnalysisActivity__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _performIdentityAnalysisActivity:v3];
}

- (void)_performVacuumActivity
{
  id v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_INFO, "Vacuuming the database", (uint8_t *)&v6, 2u);
  }

  uint64_t v7 = 0;
  uint64_t v8 = 0;
  id v6 = @"com.apple.suggestd.vacuum";
  uint64_t v7 = mach_absolute_time();
  id v4 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
  [v4 vacuum];

  id v5 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
  [v5 clearCaches];

  SGRecordMeasurementState(&v6);
  SGRecordMeasurementState(&v6);
}

- (void)_registerForCTSVacuumActivity
{
  id location = 0;
  objc_initWeak(&location, self);
  xpcActivityManager = self->_xpcActivityManager;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__SGDManagerForCTS__registerForCTSVacuumActivity__block_invoke;
  v4[3] = &unk_1E65B64B8;
  objc_copyWeak(&v5, &location);
  [(SGXPCActivityManagerProtocol *)xpcActivityManager registerForActivity:1 handler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __49__SGDManagerForCTS__registerForCTSVacuumActivity__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performVacuumActivity];
}

- (void)_performTrimActivity:(id)a3
{
  id v4 = a3;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  if ([MEMORY[0x1E4F5DAF0] allowAgeBasedPruning])
  {
    id v5 = sgLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_INFO, "Pruning entities more than a year old", buf, 2u);
    }

    uint64_t v35 = 0;
    uint64_t v36 = 0;
    *(void *)buf = @"com.apple.suggestd.trim";
    uint64_t v35 = mach_absolute_time();
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __41__SGDManagerForCTS__performTrimActivity___block_invoke;
    v31[3] = &unk_1E65B6508;
    v31[4] = self;
    id v6 = v4;
    id v32 = v6;
    id v33 = &v37;
    uint64_t v7 = (void *)MEMORY[0x1CB79B4C0](v31);
    if ([(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v6]) {
      goto LABEL_27;
    }
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __41__SGDManagerForCTS__performTrimActivity___block_invoke_2;
    v30[3] = &unk_1E65B6530;
    v30[4] = self;
    objc_msgSend(MEMORY[0x1E4F25550], "sg_usingSharedStoreForReadingOnly:", v30);
    if ([(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v6]) {
      goto LABEL_27;
    }
    id v12 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
    [v12 pruneEntitiesOlderThanOneYearWithSuspensionHandler:v7];

    if ([(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v6]) {
      goto LABEL_27;
    }
    id v13 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
    [v13 pruneMailIntelligenceOlderThanOneYearWithSuspensionHandler:v7];

    if ([(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v6]) {
      goto LABEL_27;
    }
    dispatch_semaphore_t v14 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
    [v14 deleteInteractionEntitiesExceedingLimit:&unk_1F2535718 withSuspensionHandler:v7];

    if ([(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v6]) {
      goto LABEL_27;
    }
    uint64_t v15 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
    [v15 deleteCompletedReimportRequests];

    if ([(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v6]) {
      goto LABEL_27;
    }
    __int16 v16 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
    id v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-1209600.0];
    [v16 deleteAllReimportRequestsOlderThanDate:v17];

    if ([(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v6]) {
      goto LABEL_27;
    }
    uint64_t v18 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
    [v18 trimURLs];

    if ([(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v6]) {
      goto LABEL_27;
    }
    uint64_t v19 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
    [v19 pruneNLEventEntitiesOlderThanTwoWeeks];

    if ([(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v6]) {
      goto LABEL_27;
    }
    uint64_t v20 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
    [v20 pruneReminders];

    if ([(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v6]) {
      goto LABEL_27;
    }
    uint64_t v21 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
    [v21 analyzeDatabase];

    if (([(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v6] & 1) != 0
      || (+[SGExtractionModel cleanModelAssets],
          ([(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v6] & 1) != 0)
      || ((*((void (**)(void))self->_harvestStoreGetter + 2))(),
          id v22 = objc_claimAutoreleasedReturnValue(),
          [v22 vacuum],
          v22,
          ([(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v6] & 1) != 0))
    {
LABEL_27:
      if (*((unsigned char *)v38 + 24)) {
        [(SGXPCActivityManagerProtocol *)self->_xpcActivityManager setState:v6 state:3];
      }
    }
    else
    {
      uint64_t v25 = (void *)MEMORY[0x1E4F93860];
      unsigned __int16 v26 = +[SGPaths suggestionsDirectory];
      id v27 = [v25 sharedSingletonWithDirectory:v26];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __41__SGDManagerForCTS__performTrimActivity___block_invoke_48;
      v28[3] = &unk_1E65B6558;
      v28[4] = self;
      id v29 = v6;
      [v27 trimDbWithDeferralBlock:v28];
    }
    char v23 = (*((void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t))self->_harvestStoreGetter + 2))(self->_harvestStoreGetter, v8, v9, v10, v11);
    [v23 clearCaches];

    SGRecordMeasurementState(buf);
    SGRecordMeasurementState(buf);
  }
  else
  {
    uint64_t v24 = sgLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v24, OS_LOG_TYPE_INFO, "NOT pruning entities more than a year old, due to preference setting.", buf, 2u);
    }
  }
  _Block_object_dispose(&v37, 8);
}

uint64_t __41__SGDManagerForCTS__performTrimActivity___block_invoke(void *a1)
{
  if (![*(id *)(a1[4] + 168) shouldDefer:a1[5]]) {
    return [MEMORY[0x1E4F93B10] isUnlocked] ^ 1;
  }
  uint64_t result = 1;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  return result;
}

void __41__SGDManagerForCTS__performTrimActivity___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = *(void (**)(uint64_t))(v2 + 16);
  id v4 = a2;
  v3(v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 pruneDuplicateEventExtractions:v4];
}

uint64_t __41__SGDManagerForCTS__performTrimActivity___block_invoke_48(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 168) shouldDefer:*(void *)(a1 + 40)];
  if (v2) {
    [*(id *)(*(void *)(a1 + 32) + 168) setState:*(void *)(a1 + 40) state:3];
  }
  return v2;
}

- (void)_registerForCTSTrimActivity
{
  id location = 0;
  objc_initWeak(&location, self);
  xpcActivityManager = self->_xpcActivityManager;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__SGDManagerForCTS__registerForCTSTrimActivity__block_invoke;
  v4[3] = &unk_1E65B64B8;
  objc_copyWeak(&v5, &location);
  [(SGXPCActivityManagerProtocol *)xpcActivityManager registerForActivity:0 handler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__SGDManagerForCTS__registerForCTSTrimActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _performTrimActivity:v3];
}

- (void)_performCollectWeeklyStats:(id)a3
{
  if (objc_msgSend(MEMORY[0x1E4F93B10], "isClassCLocked", a3))
  {
    id v3 = sgLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_INFO, "Can not harvest items until first unlock. Waiting for later.", buf, 2u);
    }
  }
  else if ((float)((float)arc4random_uniform(0xFFFFFFFF) * 2.3283e-10) < 0.00001)
  {
    id v6 = (id)objc_opt_new();
    id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-604800.0];
    [v6 setLimitingStartDate:v4];

    id v5 = [v6 recentCalls];
    if ([v5 count]) {
      +[SGDManagerForCTS _logCallInteractions:v5];
    }
  }
}

- (void)_registerForCollectWeeklyStats
{
  id location = 0;
  objc_initWeak(&location, self);
  id v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEBUG, "registering _registerForCollectWeeklyStats", buf, 2u);
  }

  xpcActivityManager = self->_xpcActivityManager;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__SGDManagerForCTS__registerForCollectWeeklyStats__block_invoke;
  void v5[3] = &unk_1E65B64B8;
  objc_copyWeak(&v6, &location);
  [(SGXPCActivityManagerProtocol *)xpcActivityManager registerForActivity:5 handler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __50__SGDManagerForCTS__registerForCollectWeeklyStats__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _performCollectWeeklyStats:v3];
}

- (void)_performMobileAssetMetadataDownloadActivity:(id)a3
{
  id v4 = a3;
  v25[2] = 0;
  v25[0] = @"com.apple.suggestd.ma-metadata-download";
  v25[1] = mach_absolute_time();
  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  id v6 = [MEMORY[0x1E4F5DFA8] asset];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __64__SGDManagerForCTS__performMobileAssetMetadataDownloadActivity___block_invoke;
  v23[3] = &unk_1E65B64E0;
  uint64_t v7 = v5;
  uint64_t v24 = v7;
  [v6 downloadMetadataWithCompletion:v23];

  SGRecordMeasurementState(v25);
  dispatch_group_enter(v7);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3810000000;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  v20[3] = "";
  void v20[4] = @"com.apple.suggestd.ma-metadata-download";
  uint64_t v21 = mach_absolute_time();
  uint64_t v22 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__SGDManagerForCTS__performMobileAssetMetadataDownloadActivity___block_invoke_30;
  v17[3] = &unk_1E65C0338;
  uint64_t v19 = v20;
  uint64_t v8 = v7;
  uint64_t v18 = v8;
  +[SGAsset downloadMetadataWithCompletion:v17];
  uint64_t v9 = v8;
  dispatch_time_t v10 = dispatch_time(0, 5000000000);
  intptr_t v11 = dispatch_group_wait(v9, v10);

  if (v11)
  {
    [(SGXPCActivityManagerProtocol *)self->_xpcActivityManager setState:v4 state:4];
    id v12 = dispatch_get_global_queue(9, 0);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__SGDManagerForCTS__performMobileAssetMetadataDownloadActivity___block_invoke_31;
    v13[3] = &unk_1E65C0688;
    dispatch_semaphore_t v14 = v9;
    uint64_t v15 = self;
    id v16 = v4;
    dispatch_async(v12, v13);
  }
  _Block_object_dispose(v20, 8);

  SGRecordMeasurementState(v25);
}

void __64__SGDManagerForCTS__performMobileAssetMetadataDownloadActivity___block_invoke(uint64_t a1, int a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_INFO, "CoreSuggestionsModelAssets metadata download success? %d", (uint8_t *)v5, 8u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __64__SGDManagerForCTS__performMobileAssetMetadataDownloadActivity___block_invoke_30(uint64_t a1, int a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = a2;
    _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_INFO, "CoreSuggestionsAssets metadata download success? %d", (uint8_t *)v5, 8u);
  }

  SGRecordMeasurementState((void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __64__SGDManagerForCTS__performMobileAssetMetadataDownloadActivity___block_invoke_31(uint64_t a1)
{
  while (1)
  {
    uint64_t v2 = *(id *)(a1 + 32);
    dispatch_time_t v3 = dispatch_time(0, 1000000000);
    intptr_t v4 = dispatch_group_wait(v2, v3);

    if (!v4) {
      break;
    }
    if ([*(id *)(*(void *)(a1 + 40) + 168) shouldDefer:*(void *)(a1 + 48)])
    {
      id v5 = sgLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_INFO, "CoreSuggestionsAssets metadata download - marking activity as done", v7, 2u);
      }

      return [*(id *)(*(void *)(a1 + 40) + 168) setState:*(void *)(a1 + 48) state:5];
    }
  }
  return [*(id *)(*(void *)(a1 + 40) + 168) setState:*(void *)(a1 + 48) state:5];
}

- (void)_registerMobileAssetMetadataDownloadActivity
{
  id location = 0;
  objc_initWeak(&location, self);
  dispatch_time_t v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_INFO, "Registering for MobileAsset metadata download with CTS", buf, 2u);
  }

  xpcActivityManager = self->_xpcActivityManager;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  _DWORD v5[2] = __64__SGDManagerForCTS__registerMobileAssetMetadataDownloadActivity__block_invoke;
  void v5[3] = &unk_1E65B64B8;
  objc_copyWeak(&v6, &location);
  [(SGXPCActivityManagerProtocol *)xpcActivityManager registerForActivity:11 handler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __64__SGDManagerForCTS__registerMobileAssetMetadataDownloadActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _performMobileAssetMetadataDownloadActivity:v3];
}

- (id)serviceContext
{
  id v3 = [SGServiceContext alloc];
  intptr_t v4 = (*((void (**)(void))self->_harvestStoreGetter + 2))();
  id v5 = [(SGServiceContext *)v3 initWithStore:v4];

  return v5;
}

- (void)registerForCTS
{
  [(SGDManagerForCTS *)self _registerForCTSTrimActivity];
  [(SGDManagerForCTS *)self _registerForCTSVacuumActivity];
  [(SGDManagerForCTS *)self _registerForCTSIdentityAnalysisActivity];
  [(SGDManagerForCTS *)self _registerForCTSSendRTCActivity];
  [(SGDManagerForCTS *)self _registerForCollectWeeklyStats];
  [(SGDManagerForCTS *)self _registerForContactDetailCacheRebuildActivity];
  [(SGDManagerForCTS *)self _registerProcessPendingGeocodesActivity];
  [(SGDManagerForCTS *)self _registerProcessPendingVerificationActivity];
  [(SGDManagerForCTS *)self _registerMailIntelligenceTasksActivity];
  [(SGDManagerForCTS *)self _registerHarvestedURLMetricUploadActivity];
  [(SGDManagerForCTS *)self _registerAnalyticsHeartbeatActivity];
  [(SGDManagerForCTS *)self _registerMobileAssetMetadataDownloadActivity];
}

- (SGDManagerForCTS)initWithHarvestStoreGetter:(id)a3 xpcActivityManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SGDManagerForCTS;
  uint64_t v8 = [(SGDManagerForCTS *)&v15 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_xpcActivityManager, a4);
    pthread_mutex_init(&v9->_geocodeLock, 0);
    pthread_mutex_init(&v9->_verificationLock, 0);
    if (v6) {
      dispatch_time_t v10 = v6;
    }
    else {
      dispatch_time_t v10 = &__block_literal_global_17;
    }
    uint64_t v11 = MEMORY[0x1CB79B4C0](v10);
    id harvestStoreGetter = v9->_harvestStoreGetter;
    v9->_id harvestStoreGetter = (id)v11;

    v9->_ctsCriteriaState = 0;
    if (_os_feature_enabled_impl()) {
      id v13 = +[SGDPluginManager sharedInstance];
    }
  }

  return v9;
}

uint64_t __66__SGDManagerForCTS_initWithHarvestStoreGetter_xpcActivityManager___block_invoke()
{
  return 0;
}

+ (void)_logCallInteractions:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
    int v7 = *MEMORY[0x1E4F57CB0];
    int v8 = *MEMORY[0x1E4F57CC0];
    uint64_t v25 = *MEMORY[0x1E4F57D10];
    uint64_t v22 = (void *)*MEMORY[0x1E4F5DC10];
    uint64_t v23 = *MEMORY[0x1E4F57D08];
    uint64_t v24 = (void *)*MEMORY[0x1E4F5DC50];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        dispatch_time_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        int v11 = v7 & objc_msgSend(v10, "callStatus", v22);
        if (v11 || (v8 & [v10 callStatus]) != 0)
        {
          uint64_t v12 = [v10 callerIdForDisplay];
          if (v12)
          {
            id v13 = (void *)v12;
            dispatch_semaphore_t v14 = [v10 serviceProvider];

            if (v14)
            {
              objc_super v15 = [v10 serviceProvider];
              char v16 = [v15 isEqualToString:v25];

              id v17 = v24;
              if ((v16 & 1) != 0
                || ([v10 serviceProvider],
                    uint64_t v18 = objc_claimAutoreleasedReturnValue(),
                    int v19 = [v18 isEqualToString:v23],
                    v18,
                    id v17 = v22,
                    v19))
              {
                id v20 = v17;
                uint64_t v21 = [v10 callerIdForDisplay];
                +[SGMetricsHelper recordConversationTurnWithDetail:v21 received:v11 != 0 throughApp:v20 withStore:0];
              }
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v5);
  }
}

+ (SGDManagerForCTS)defaultInstance
{
  id v2 = objc_alloc((Class)a1);
  id v3 = +[SGXPCActivityManager sharedInstance];
  uint64_t v4 = (void *)[v2 initWithHarvestStoreGetter:&__block_literal_global_5195 xpcActivityManager:v3];

  return (SGDManagerForCTS *)v4;
}

id __35__SGDManagerForCTS_defaultInstance__block_invoke()
{
  return +[SGSqlEntityStore defaultHarvestStore];
}

uint64_t __43__SGDManagerForCTS_sharedSingletonInstance__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) defaultInstance];
  id v2 = (void *)sharedSingletonInstance_singletonInstance;
  sharedSingletonInstance_singletonInstance = v1;

  id v3 = (void *)sharedSingletonInstance_singletonInstance;
  return [v3 registerForCTS];
}

@end