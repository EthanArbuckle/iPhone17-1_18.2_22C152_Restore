@interface SGPipeline
+ (id)customPipeline:(id)a3;
+ (id)deliveriesTestingPipeline;
+ (id)dependencyClassesForDissectorClass:(Class)a3;
+ (id)emptyPipeline;
+ (id)fullPipeline;
+ (id)parallelPipeline:(id)a3;
+ (id)remindersTestingPipeline;
+ (id)remindersTestingPipelineWithCustomReminderDissector:(id)a3;
+ (id)retrainingPipeline;
+ (id)sharedBackgroundProcessingQueue;
+ (id)sharedBackgroundStorageQueue;
+ (void)_delayedResetCachesAndModels;
+ (void)_resetCachesAndModels;
+ (void)initialize;
- (id)_dissectOperations:(id)a3 block:(id)a4;
- (id)_dissectOperations:(id)a3 inContext:(id)a4;
- (id)dissectOperationsForInteraction:(id)a3 entity:(id)a4 inContext:(id)a5;
- (id)dissectOperationsForMailMessage:(id)a3 entity:(id)a4 inContext:(id)a5;
- (id)dissectOperationsForTextMessage:(id)a3 entity:(id)a4 inContext:(id)a5;
- (id)dissectors;
- (id)geocodeOperation:(id)a3 withDependencies:(id)a4;
- (id)storeOperation:(id)a3 spotlightBundleIdentifier:(id)a4 spotlightUniqueIdentifier:(id)a5 spotlightDomainIdentifier:(id)a6 withStore:(id)a7 dependencies:(id)a8;
- (id)storeOperation:(id)a3 spotlightBundleIdentifier:(id)a4 spotlightUniqueIdentifier:(id)a5 spotlightDomainIdentifier:(id)a6 withStore:(id)a7 dependencies:(id)a8 originalEnrichmentCount:(unint64_t)a9;
- (id)storeOperation:(id)a3 withStore:(id)a4 dependencies:(id)a5;
- (id)storeOperation:(id)a3 withStore:(id)a4 dependencies:(id)a5 originalEnrichmentCount:(unint64_t)a6;
- (id)verificationOperation:(id)a3 overrideVerificationStatus:(id)a4 withDependencies:(id)a5;
- (id)verificationOperation:(id)a3 withDependencies:(id)a4;
- (void)_dissectEntity:(id)a3 inContext:(id)a4 andThen:(id)a5;
- (void)dissect:(id)a3;
- (void)dissect:(id)a3 andStore:(id)a4;
- (void)dissect:(id)a3 inContext:(id)a4;
- (void)dissectAndStore:(id)a3 inContext:(id)a4;
- (void)dissectAndStoreEntity:(id)a3 inContext:(id)a4;
- (void)dissectAndStoreEntity:(id)a3 inContext:(id)a4 destinationStore:(id)a5;
- (void)dissectAndStoreSpotlightEntity:(id)a3 bundleIdentifier:(id)a4 uniqueIdentifier:(id)a5 domainIdentifier:(id)a6 inContext:(id)a7;
- (void)dissectEntity:(id)a3 andStore:(id)a4;
- (void)logDKIMStatus:(int64_t)a3 forPipelineEntity:(id)a4;
@end

@implementation SGPipeline

- (void).cxx_destruct
{
}

- (id)dissectors
{
  return [(NSDictionary *)self->_dissectorsAndDependencies allKeys];
}

- (void)dissectAndStoreSpotlightEntity:(id)a3 bundleIdentifier:(id)a4 uniqueIdentifier:(id)a5 domainIdentifier:(id)a6 inContext:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __106__SGPipeline_dissectAndStoreSpotlightEntity_bundleIdentifier_uniqueIdentifier_domainIdentifier_inContext___block_invoke;
  v22[3] = &unk_1E65BBB50;
  v22[4] = self;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  id v27 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  [(SGPipeline *)self _dissectEntity:v21 inContext:v17 andThen:v22];
}

id __106__SGPipeline_dissectAndStoreSpotlightEntity_bundleIdentifier_uniqueIdentifier_domainIdentifier_inContext___block_invoke(void *a1, void *a2)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[8];
  v7 = (void *)a1[9];
  id v8 = a2;
  v9 = [v7 serviceContext];
  v10 = [v9 store];
  v11 = [v2 storeOperation:v3 spotlightBundleIdentifier:v4 spotlightUniqueIdentifier:v5 spotlightDomainIdentifier:v6 withStore:v10 dependencies:v8];

  return v11;
}

- (void)dissectAndStoreEntity:(id)a3 inContext:(id)a4
{
}

- (void)dissectAndStoreEntity:(id)a3 inContext:(id)a4 destinationStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 enrichments];
  uint64_t v12 = [v11 count];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__SGPipeline_dissectAndStoreEntity_inContext_destinationStore___block_invoke;
  v16[3] = &unk_1E65BBB28;
  v16[4] = self;
  id v17 = v8;
  id v18 = v10;
  id v19 = v9;
  uint64_t v20 = v12;
  id v13 = v9;
  id v14 = v10;
  id v15 = v8;
  [(SGPipeline *)self _dissectEntity:v15 inContext:v13 andThen:v16];
}

id __63__SGPipeline_dissectAndStoreEntity_inContext_destinationStore___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  id v8 = v7;
  if (!v7)
  {
    v2 = [*(id *)(a1 + 56) serviceContext];
    id v8 = [v2 store];
  }
  id v9 = [v5 storeOperation:v6 withStore:v8 dependencies:v4 originalEnrichmentCount:*(void *)(a1 + 64)];
  if (!v7)
  {
  }
  return v9;
}

- (void)dissectEntity:(id)a3 andStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [SGRequestContext alloc];
  id v9 = [[SGServiceContext alloc] initWithStore:v6];
  id v10 = [(SGRequestContext *)v8 initWithServiceContext:v9 concurrencyBehavior:1 backpressureHazard:0];

  [(SGPipeline *)self dissectAndStoreEntity:v7 inContext:v10 destinationStore:v6];
}

- (void)_dissectEntity:(id)a3 inContext:(id)a4 andThen:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  v11 = (void *)MEMORY[0x1CB79B230]();
  v26[0] = @"dissectEntityAndWrite";
  v26[1] = mach_absolute_time();
  v26[2] = 0;
  v25[0] = @"dissectEntity";
  v25[1] = mach_absolute_time();
  v25[2] = 0;
  uint64_t v12 = [(SGPipeline *)self _dissectOperations:v8 inContext:v9];
  id v13 = v10[2](v10, v12);
  id v14 = [v9 storageQueue];
  [v14 addOperation:v13];

  id v15 = [v9 processingQueue];
  [v15 addOperations:v12 waitUntilFinished:0];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = v12;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v20++), "waitUntilFinished", (void)v21);
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v18);
  }

  +[SGPipeline _delayedResetCachesAndModels];
  SGRecordMeasurementState(v25);
  [v13 waitUntilFinished];
  SGRecordMeasurementState(v26);
}

- (void)dissect:(id)a3 andStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [[SGServiceContext alloc] initWithStore:v6];

  id v8 = [[SGRequestContext alloc] initWithServiceContext:v9 concurrencyBehavior:1 backpressureHazard:0];
  [(SGPipeline *)self dissectAndStore:v7 inContext:v8];
}

- (void)dissectAndStore:(id)a3 inContext:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v33 = a4;
  v47[0] = @"dissectArrayAndWrite";
  v47[1] = mach_absolute_time();
  v47[2] = 0;
  v46[0] = @"dissectArray";
  v46[1] = mach_absolute_time();
  v46[2] = 0;
  v31 = objc_opt_new();
  v32 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v43;
    do
    {
      uint64_t v11 = 0;
      uint64_t v12 = v9;
      do
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v42 + 1) + 8 * v11);
        id v14 = (void *)MEMORY[0x1CB79B230]();
        id v15 = [(SGPipeline *)self _dissectOperations:v13 inContext:v33];
        [v31 addObjectsFromArray:v15];
        id v16 = [v33 serviceContext];
        uint64_t v17 = [v16 store];
        id v9 = [(SGPipeline *)self storeOperation:v13 withStore:v17 dependencies:v15];

        [v32 addObject:v9];
        if (v12) {
          [v9 addDependency:v12];
        }

        ++v11;
        uint64_t v12 = v9;
      }
      while (v8 != v11);
      uint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v8);
  }
  uint64_t v18 = [v33 storageQueue];
  [v18 addOperations:v32 waitUntilFinished:0];

  uint64_t v19 = [v33 processingQueue];
  [v19 addOperations:v31 waitUntilFinished:0];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v20 = v31;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v39 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v38 + 1) + 8 * i) waitUntilFinished];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v38 objects:v49 count:16];
    }
    while (v22);
  }

  SGRecordMeasurementState(v46);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v25 = v32;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v34 objects:v48 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v35 != v28) {
          objc_enumerationMutation(v25);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * j) waitUntilFinished];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v34 objects:v48 count:16];
    }
    while (v27);
  }

  SGRecordMeasurementState(v47);
}

- (void)dissect:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [SGRequestContext alloc];
  id v6 = [SGServiceContext alloc];
  uint64_t v7 = +[SGSqlEntityStore defaultStore];
  uint64_t v8 = [(SGServiceContext *)v6 initWithStore:v7];
  id v9 = [(SGRequestContext *)v5 initWithServiceContext:v8 concurrencyBehavior:1 backpressureHazard:0];

  [(SGPipeline *)self dissect:v4 inContext:v9];
}

- (void)dissect:(id)a3 inContext:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v10[2] = 0;
  v10[0] = @"dissect";
  v10[1] = mach_absolute_time();
  uint64_t v7 = [v6 processingQueue];
  uint64_t v8 = [(SGPipeline *)self _dissectOperations:v9 inContext:v6];
  [v7 addOperations:v8 waitUntilFinished:1];

  SGRecordMeasurementState(v10);
  SGRecordMeasurementState(v10);
}

- (id)storeOperation:(id)a3 spotlightBundleIdentifier:(id)a4 spotlightUniqueIdentifier:(id)a5 spotlightDomainIdentifier:(id)a6 withStore:(id)a7 dependencies:(id)a8 originalEnrichmentCount:(unint64_t)a9
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  unint64_t v18 = (unint64_t)a5;
  unint64_t v19 = (unint64_t)a6;
  id v20 = a7;
  id v21 = a8;
  BOOL v22 = (v18 | v19) == 0;
  if (v17) {
    BOOL v22 = v18 != 0;
  }
  if (!v22)
  {
    long long v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"SGPipeline.m" lineNumber:646 description:@"bundleIdentifier and uniqueIdentifier are required if adding a Spotlight reference."];
  }
  uint64_t v23 = (void *)MEMORY[0x1E4F28B48];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __154__SGPipeline_storeOperation_spotlightBundleIdentifier_spotlightUniqueIdentifier_spotlightDomainIdentifier_withStore_dependencies_originalEnrichmentCount___block_invoke;
  v41[3] = &unk_1E65BBB00;
  id v24 = v16;
  id v42 = v24;
  id v25 = (id)v18;
  id v43 = v25;
  long long v44 = self;
  SEL v48 = a2;
  unint64_t v49 = a9;
  id v26 = v20;
  id v45 = v26;
  id v27 = v17;
  id v46 = v27;
  id v28 = (id)v19;
  id v47 = v28;
  v29 = [v23 blockOperationWithBlock:v41];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v30 = v21;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v38 != v33) {
          objc_enumerationMutation(v30);
        }
        objc_msgSend(v29, "addDependency:", *(void *)(*((void *)&v37 + 1) + 8 * i), (void)v37);
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v32);
  }

  [v29 setName:@"Store"];
  return v29;
}

void __154__SGPipeline_storeOperation_spotlightBundleIdentifier_spotlightUniqueIdentifier_spotlightDomainIdentifier_withStore_dependencies_originalEnrichmentCount___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v3 = [*(id *)(a1 + 32) harvestMetrics];
  [v3 startTimer:kHarvestMetricsStorageTimer];

  if (*(void *)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 32) enrichments];
    unint64_t v5 = [v4 count];
    unint64_t v6 = *(void *)(a1 + 88);

    if (v5 <= v6)
    {
      char v7 = 0;
      goto LABEL_7;
    }
    [*(id *)(a1 + 56) writeEntity:*(void *)(a1 + 32) withSpotlightReferenceForBundleIdentifier:*(void *)(a1 + 64) uniqueIdentifier:*(void *)(a1 + 40) domainIdentifier:*(void *)(a1 + 72)];
  }
  else
  {
    [*(id *)(a1 + 56) writeEntity:*(void *)(a1 + 32)];
  }
  char v7 = 1;
LABEL_7:
  if ([*(id *)(a1 + 32) hasFullDownloadBeenRequested]
    && [*(id *)(a1 + 56) entityWantsFullDownload:*(void *)(a1 + 32)])
  {
    notify_post("com.apple.suggestions.fulldownloadrequested");
  }
  [*(id *)(a1 + 56) syncNewBlobsIfChanged];
  uint64_t v8 = [*(id *)(a1 + 32) harvestMetrics];
  id v9 = v8;
  uint64_t v10 = kHarvestMetricsStorageTimer;
  if (v7)
  {
    uint64_t v11 = [*(id *)(a1 + 32) enrichments];
    objc_msgSend(v9, "endTimer:significantWork:", v10, objc_msgSend(v11, "count") != 0);
  }
  else
  {
    [v8 endTimer:kHarvestMetricsStorageTimer significantWork:0];
  }
}

- (id)storeOperation:(id)a3 spotlightBundleIdentifier:(id)a4 spotlightUniqueIdentifier:(id)a5 spotlightDomainIdentifier:(id)a6 withStore:(id)a7 dependencies:(id)a8
{
  return [(SGPipeline *)self storeOperation:a3 spotlightBundleIdentifier:a4 spotlightUniqueIdentifier:a5 spotlightDomainIdentifier:a6 withStore:a7 dependencies:a8 originalEnrichmentCount:0];
}

- (id)storeOperation:(id)a3 withStore:(id)a4 dependencies:(id)a5 originalEnrichmentCount:(unint64_t)a6
{
  return [(SGPipeline *)self storeOperation:a3 spotlightBundleIdentifier:0 spotlightUniqueIdentifier:0 spotlightDomainIdentifier:0 withStore:a4 dependencies:a5 originalEnrichmentCount:a6];
}

- (id)storeOperation:(id)a3 withStore:(id)a4 dependencies:(id)a5
{
  return [(SGPipeline *)self storeOperation:a3 spotlightBundleIdentifier:0 spotlightUniqueIdentifier:0 spotlightDomainIdentifier:0 withStore:a4 dependencies:a5];
}

- (id)verificationOperation:(id)a3 withDependencies:(id)a4
{
  return [(SGPipeline *)self verificationOperation:a3 overrideVerificationStatus:0 withDependencies:a4];
}

- (void)logDKIMStatus:(int64_t)a3 forPipelineEntity:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  unint64_t v6 = v5;
  long long v16 = 0u;
  long long v17 = 0u;
  if (a3) {
    unsigned __int16 v7 = 10;
  }
  else {
    unsigned __int16 v7 = 11;
  }
  long long v18 = 0uLL;
  long long v19 = 0uLL;
  uint64_t v8 = objc_msgSend(v5, "enrichments", (void)v16);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v14 = (void *)MEMORY[0x1CB79B230]();
        if ([v13 isEvent])
        {
          id v15 = +[SGRTCLogging defaultLogger];
          [v15 logEventInteractionForEntity:v13 interface:0 actionType:v7];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (id)verificationOperation:(id)a3 overrideVerificationStatus:(id)a4 withDependencies:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x1E4F28B48];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __80__SGPipeline_verificationOperation_overrideVerificationStatus_withDependencies___block_invoke;
  void v25[3] = &unk_1E65C0688;
  id v12 = v8;
  id v26 = v12;
  id v13 = v9;
  id v27 = v13;
  id v28 = self;
  id v14 = [v11 blockOperationWithBlock:v25];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = v10;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(v14, "addDependency:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v17);
  }

  return v14;
}

void __80__SGPipeline_verificationOperation_overrideVerificationStatus_withDependencies___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (![MEMORY[0x1E4F5DAF0] enableDKIMEnforcement]) {
    return;
  }
  v2 = [*(id *)(a1 + 32) harvestMetrics];
  [v2 startTimer:kHarvestMetricsVerificationTimer];

  uint64_t v3 = [*(id *)(a1 + 32) duplicateKey];
  if ([v3 entityType] == 5) {
    int v4 = [*(id *)(a1 + 32) hasEventEnrichment];
  }
  else {
    int v4 = 0;
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __80__SGPipeline_verificationOperation_overrideVerificationStatus_withDependencies___block_invoke_2;
  v19[3] = &unk_1E65BBAB8;
  id v20 = *(id *)(a1 + 32);
  char v21 = v4;
  id v5 = (void (**)(void))MEMORY[0x1CB79B4C0](v19);
  if (v4)
  {
    unint64_t v6 = *(void **)(a1 + 40);
    if (v6)
    {
      uint64_t v7 = [v6 integerValue];
      id v8 = 0;
    }
    else
    {
      id v9 = +[SGMailClientUtil sharedInstance];
      uint64_t v10 = *(void *)(a1 + 32);
      id v18 = 0;
      uint64_t v7 = [v9 verifyDKIMSignatureForPipelineEntity:v10 error:&v18];
      id v8 = v18;
      [*(id *)(a1 + 48) logDKIMStatus:v7 forPipelineEntity:*(void *)(a1 + 32)];
    }
    if (![*(id *)(a1 + 32) needsSourceVerification]) {
      goto LABEL_16;
    }
    if (v7)
    {
      if (v7 != 2)
      {
        if (v7 == 1)
        {
          uint64_t v11 = sgEventsLogHandle();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            id v12 = [*(id *)(a1 + 32) loggingIdentifier];
            *(_DWORD *)buf = 138412546;
            id v23 = v8;
            __int16 v24 = 2114;
            id v25 = v12;
            _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEFAULT, "SGPipeline verificationOperation: DKIM verification resulted in temporary failure: %@. [SGPipelineEntity (%{public}@)]", buf, 0x16u);
          }
          uint64_t v13 = 1;
          goto LABEL_23;
        }
LABEL_16:
        uint64_t v13 = 0;
LABEL_24:
        [*(id *)(a1 + 32) setPendingVerification:v13];

        goto LABEL_25;
      }
      id v15 = sgEventsLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = [*(id *)(a1 + 32) loggingIdentifier];
        *(_DWORD *)buf = 138412546;
        id v23 = v8;
        __int16 v24 = 2114;
        id v25 = v16;
        _os_log_impl(&dword_1CA650000, v15, OS_LOG_TYPE_DEFAULT, "SGPipeline verificationOperation: DKIM verification resulted in permanent failure: %@. [SGPipelineEntity (%{public}@)]", buf, 0x16u);
      }
      uint64_t v11 = [*(id *)(a1 + 32) enrichments];
      uint64_t v17 = sgFilter();
      [*(id *)(a1 + 32) setEnrichments:v17];
    }
    else
    {
      uint64_t v11 = sgEventsLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [*(id *)(a1 + 32) loggingIdentifier];
        *(_DWORD *)buf = 138543362;
        id v23 = v14;
        _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEFAULT, "SGPipeline verificationOperation: Successfully verified DKIM signature. [SGPipelineEntity (%{public}@)]", buf, 0xCu);
      }
    }
    uint64_t v13 = 0;
LABEL_23:

    goto LABEL_24;
  }
LABEL_25:
  if (v5) {
    v5[2](v5);
  }
}

void __80__SGPipeline_verificationOperation_overrideVerificationStatus_withDependencies___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) harvestMetrics];
  [v2 endTimer:kHarvestMetricsVerificationTimer significantWork:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __80__SGPipeline_verificationOperation_overrideVerificationStatus_withDependencies___block_invoke_127(uint64_t a1, void *a2)
{
  return [a2 isEvent] ^ 1;
}

- (id)geocodeOperation:(id)a3 withDependencies:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F28B48];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __48__SGPipeline_geocodeOperation_withDependencies___block_invoke;
  v20[3] = &unk_1E65BEF88;
  id v8 = v5;
  id v21 = v8;
  id v9 = [v7 blockOperationWithBlock:v20];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(v9, "addDependency:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v12);
  }

  return v9;
}

void __48__SGPipeline_geocodeOperation_withDependencies___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1CB79B230]();
  id v2 = [*(id *)(a1 + 32) harvestMetrics];
  [v2 startTimer:kHarvestMetricsGeocodingTimer];

  group = dispatch_group_create();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v19 = a1;
  uint64_t v3 = [*(id *)(a1 + 32) enrichments];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v21 = 0;
    uint64_t v6 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v9 = (void *)MEMORY[0x1CB79B230]();
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v10 = [v8 tags];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v28;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v28 != v13) {
                objc_enumerationMutation(v10);
              }
              if ([*(id *)(*((void *)&v27 + 1) + 8 * j) isExtractedEventCategory])
              {

                if ([MEMORY[0x1E4F5DAF0] allowGeocode])
                {
                  id v15 = +[SGStorageEvent storageEventFromEntity:v8];
                  dispatch_group_enter(group);
                  long long v16 = (void *)MEMORY[0x1E4F5DA10];
                  v23[0] = MEMORY[0x1E4F143A8];
                  v23[1] = 3221225472;
                  v23[2] = __48__SGPipeline_geocodeOperation_withDependencies___block_invoke_2;
                  v23[3] = &unk_1E65BBA90;
                  id v24 = v15;
                  id v25 = v8;
                  uint64_t v26 = group;
                  id v17 = v15;
                  [v16 geocodeEvent:v17 withCallback:v23];

                  char v21 = 1;
                }
                else
                {
                  [v8 setPendingGeocode:1];
                }
                goto LABEL_18;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

LABEL_18:
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v5);
  }
  else
  {
    char v21 = 0;
  }

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  long long v18 = [*(id *)(v19 + 32) harvestMetrics];
  [v18 endTimer:kHarvestMetricsGeocodingTimer significantWork:v21 & 1];
}

void __48__SGPipeline_geocodeOperation_withDependencies___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (([v11 isEqual:*(void *)(a1 + 32)] & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 40) locations];
    [v3 removeAllObjects];

    uint64_t v4 = [*(id *)(a1 + 40) locations];
    uint64_t v5 = [v11 locations];
    [v4 addObjectsFromArray:v5];

    uint64_t v6 = [v11 when];
    [*(id *)(a1 + 40) setTimeRange:v6];

    uint64_t v7 = [*(id *)(a1 + 40) tags];
    id v8 = [MEMORY[0x1E4F5D9F0] allDay];
    int v9 = [v7 containsObject:v8];

    if (v9)
    {
      id v10 = [*(id *)(a1 + 40) timeRange];
      if (([v10 isValidAllDayRange] & 1) == 0) {
        __assert_rtn("-[SGPipeline geocodeOperation:withDependencies:]_block_invoke_2", "SGPipeline.m", 497, "[enrichment.timeRange isValidAllDayRange]");
      }
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (id)_dissectOperations:(id)a3 inContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [v7 mailMessage];

  if (v9)
  {
    id v10 = [v7 mailMessage];
    uint64_t v11 = [(SGPipeline *)self dissectOperationsForMailMessage:v10 entity:v7 inContext:v8];
  }
  else
  {
    uint64_t v12 = [v7 textMessage];

    if (v12)
    {
      id v10 = [v7 textMessage];
      uint64_t v11 = [(SGPipeline *)self dissectOperationsForTextMessage:v10 entity:v7 inContext:v8];
    }
    else
    {
      uint64_t v13 = [v7 interaction];

      if (!v13)
      {
        long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
        [v16 handleFailureInMethod:a2 object:self file:@"SGPipeline.m" lineNumber:456 description:@"Unknown entity type"];

        __break(1u);
        return result;
      }
      id v10 = [v7 interaction];
      uint64_t v11 = [(SGPipeline *)self dissectOperationsForInteraction:v10 entity:v7 inContext:v8];
    }
  }
  id v14 = (void *)v11;

  return v14;
}

- (id)dissectOperationsForInteraction:(id)a3 entity:(id)a4 inContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__SGPipeline_dissectOperationsForInteraction_entity_inContext___block_invoke;
  v16[3] = &unk_1E65BBA68;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = [(SGPipeline *)self _dissectOperations:v12 block:v16];

  return v14;
}

id __63__SGPipeline_dissectOperationsForInteraction_entity_inContext___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F25637F8])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__SGPipeline_dissectOperationsForInteraction_entity_inContext___block_invoke_2;
    v6[3] = &unk_1E65C0638;
    id v7 = v3;
    id v8 = a1[4];
    id v9 = a1[5];
    id v10 = a1[6];
    uint64_t v4 = (void *)MEMORY[0x1CB79B4C0](v6);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __63__SGPipeline_dissectOperationsForInteraction_entity_inContext___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1CB79B230]();
  [*(id *)(a1 + 32) dissectInteraction:*(void *)(a1 + 40) entity:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
}

- (id)dissectOperationsForTextMessage:(id)a3 entity:(id)a4 inContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__SGPipeline_dissectOperationsForTextMessage_entity_inContext___block_invoke;
  v16[3] = &unk_1E65BBA68;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = [(SGPipeline *)self _dissectOperations:v12 block:v16];

  return v14;
}

id __63__SGPipeline_dissectOperationsForTextMessage_entity_inContext___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F253C6A0])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__SGPipeline_dissectOperationsForTextMessage_entity_inContext___block_invoke_2;
    v6[3] = &unk_1E65C0638;
    id v7 = v3;
    id v8 = a1[4];
    id v9 = a1[5];
    id v10 = a1[6];
    uint64_t v4 = (void *)MEMORY[0x1CB79B4C0](v6);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __63__SGPipeline_dissectOperationsForTextMessage_entity_inContext___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1CB79B230]();
  [*(id *)(a1 + 32) dissectTextMessage:*(void *)(a1 + 40) entity:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
}

- (id)dissectOperationsForMailMessage:(id)a3 entity:(id)a4 inContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__SGPipeline_dissectOperationsForMailMessage_entity_inContext___block_invoke;
  v16[3] = &unk_1E65BBA68;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = [(SGPipeline *)self _dissectOperations:v12 block:v16];

  return v14;
}

id __63__SGPipeline_dissectOperationsForMailMessage_entity_inContext___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F253C618])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__SGPipeline_dissectOperationsForMailMessage_entity_inContext___block_invoke_2;
    v6[3] = &unk_1E65C0638;
    id v7 = v3;
    id v8 = a1[4];
    id v9 = a1[5];
    id v10 = a1[6];
    uint64_t v4 = (void *)MEMORY[0x1CB79B4C0](v6);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __63__SGPipeline_dissectOperationsForMailMessage_entity_inContext___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1CB79B230]();
  [*(id *)(a1 + 32) dissectMailMessage:*(void *)(a1 + 40) entity:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
}

- (id)_dissectOperations:(id)a3 block:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (void *)MEMORY[0x1E4F28B48];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __39__SGPipeline__dissectOperations_block___block_invoke;
  v53[3] = &unk_1E65BEF88;
  id v9 = v6;
  id v54 = v9;
  uint64_t v10 = [v8 blockOperationWithBlock:v53];
  id v11 = (void *)MEMORY[0x1E4F28B48];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __39__SGPipeline__dissectOperations_block___block_invoke_2;
  v51[3] = &unk_1E65BEF88;
  id v37 = v9;
  id v52 = v37;
  long long v33 = [v11 blockOperationWithBlock:v51];
  long long v34 = (void *)v10;
  [v33 addDependency:v10];
  long long v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSDictionary count](self->_dissectorsAndDependencies, "count"));
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obuint64_t j = self->_dissectorsAndDependencies;
  uint64_t v12 = [(NSDictionary *)obj countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v48 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        id v17 = (void *)MEMORY[0x1CB79B230]();
        id v18 = v7[2](v7, v16);
        if (v18)
        {
          id v19 = (void *)MEMORY[0x1E4F28B48];
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __39__SGPipeline__dissectOperations_block___block_invoke_3;
          v44[3] = &unk_1E65BFFF0;
          v44[4] = v16;
          id v45 = v37;
          id v46 = v18;
          id v20 = [v19 blockOperationWithBlock:v44];
          char v21 = (objc_class *)objc_opt_class();
          long long v22 = NSStringFromClass(v21);
          [v20 setName:v22];

          [v36 setObject:v20 forKeyedSubscript:v16];
        }
      }
      uint64_t v13 = [(NSDictionary *)obj countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v13);
  }

  dissectorsAndDependencies = self->_dissectorsAndDependencies;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __39__SGPipeline__dissectOperations_block___block_invoke_4;
  v42[3] = &unk_1E65BBA40;
  id v24 = v36;
  id v43 = v24;
  [(NSDictionary *)dissectorsAndDependencies enumerateKeysAndObjectsUsingBlock:v42];
  id v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v24, "count") + 2);
  [v25 addObject:v34];
  [v25 addObject:v33];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v26 = [v24 allValues];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v38 objects:v55 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v39 != v29) {
          objc_enumerationMutation(v26);
        }
        long long v31 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        [v31 addDependency:v34];
        [v33 addDependency:v31];
        [v25 addObject:v31];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v38 objects:v55 count:16];
    }
    while (v28);
  }

  return v25;
}

void __39__SGPipeline__dissectOperations_block___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) harvestMetrics];
  [v1 startTimer:kHarvestMetricsDissectorTimer];
}

void __39__SGPipeline__dissectOperations_block___block_invoke_2(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) harvestMetrics];
  uint64_t v2 = kHarvestMetricsDissectorTimer;
  id v3 = [*(id *)(a1 + 32) enrichments];
  uint64_t v4 = [v3 count];
  uint64_t v5 = [*(id *)(a1 + 32) externalEnrichments];
  objc_msgSend(v6, "endTimer:significantWork:", v2, v4 + objc_msgSend(v5, "count") != 0);
}

void __39__SGPipeline__dissectOperations_block___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1CB79B230]();
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  [*(id *)(a1 + 40) acquireDissectorLock];
  uint64_t v5 = [*(id *)(a1 + 40) harvestMetrics];
  [v5 startTimer:v4];

  id v6 = [*(id *)(a1 + 40) enrichments];
  uint64_t v7 = [v6 count];
  id v8 = [*(id *)(a1 + 40) externalEnrichments];
  uint64_t v9 = [v8 count];

  v16[2] = 0;
  id v15 = v4;
  v16[0] = v15;
  v16[1] = mach_absolute_time();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  SGRecordMeasurementState(v16);
  uint64_t v10 = [*(id *)(a1 + 40) enrichments];
  uint64_t v11 = [v10 count];
  uint64_t v12 = [*(id *)(a1 + 40) externalEnrichments];
  uint64_t v13 = [v12 count];

  uint64_t v14 = [*(id *)(a1 + 40) harvestMetrics];
  [v14 endTimer:v15 significantWork:v9 + v7 < (unint64_t)(v13 + v11)];

  [*(id *)(a1 + 40) releaseDissectorLock];
  SGRecordMeasurementState(v16);
}

void __39__SGPipeline__dissectOperations_block___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12, (void)v15);

          if (v13)
          {
            uint64_t v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
            [v6 addDependency:v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

+ (id)deliveriesTestingPipeline
{
  if (deliveriesTestingPipeline__pasOnceToken8 != -1) {
    dispatch_once(&deliveriesTestingPipeline__pasOnceToken8, &__block_literal_global_60);
  }
  uint64_t v2 = (void *)deliveriesTestingPipeline__pasExprOnceResult;
  return v2;
}

void __39__SGPipeline_deliveriesTestingPipeline__block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1CB79B230]();
  id v1 = objc_opt_new();
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  uint64_t v3 = +[SGPipeline customPipeline:v2];
  uint64_t v4 = (void *)deliveriesTestingPipeline__pasExprOnceResult;
  deliveriesTestingPipeline__pasExprOnceResult = v3;
}

+ (id)remindersTestingPipelineWithCustomReminderDissector:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  id v5 = [v3 arrayWithObjects:&v8 count:1];
  id v6 = +[SGPipeline customPipeline:](SGPipeline, "customPipeline:", v5, v8, v9);

  return v6;
}

+ (id)remindersTestingPipeline
{
  if (remindersTestingPipeline__pasOnceToken7 != -1) {
    dispatch_once(&remindersTestingPipeline__pasOnceToken7, &__block_literal_global_58_31529);
  }
  uint64_t v2 = (void *)remindersTestingPipeline__pasExprOnceResult;
  return v2;
}

void __38__SGPipeline_remindersTestingPipeline__block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1CB79B230]();
  id v1 = objc_opt_new();
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  uint64_t v3 = +[SGPipeline customPipeline:v2];
  id v4 = (void *)remindersTestingPipeline__pasExprOnceResult;
  remindersTestingPipeline__pasExprOnceResult = v3;
}

+ (id)retrainingPipeline
{
  if (retrainingPipeline__pasOnceToken6 != -1) {
    dispatch_once(&retrainingPipeline__pasOnceToken6, &__block_literal_global_56_31532);
  }
  uint64_t v2 = (void *)retrainingPipeline__pasExprOnceResult;
  return v2;
}

void __32__SGPipeline_retrainingPipeline__block_invoke()
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1CB79B230]();
  id v1 = objc_opt_new();
  v6[0] = v1;
  uint64_t v2 = objc_opt_new();
  v6[1] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  uint64_t v4 = +[SGPipeline customPipeline:v3];
  id v5 = (void *)retrainingPipeline__pasExprOnceResult;
  retrainingPipeline__pasExprOnceResult = v4;
}

+ (id)fullPipeline
{
  if (fullPipeline_once != -1) {
    dispatch_once(&fullPipeline_once, &__block_literal_global_54);
  }
  uint64_t v2 = (void *)fullPipeline_pipeline;
  return v2;
}

void __26__SGPipeline_fullPipeline__block_invoke()
{
  v16[13] = *MEMORY[0x1E4F143B8];
  long long v15 = objc_opt_new();
  v16[0] = v15;
  uint64_t v14 = objc_opt_new();
  v16[1] = v14;
  uint64_t v13 = objc_opt_new();
  v16[2] = v13;
  uint64_t v12 = objc_opt_new();
  void v16[3] = v12;
  v0 = objc_opt_new();
  void v16[4] = v0;
  id v1 = objc_opt_new();
  void v16[5] = v1;
  uint64_t v2 = objc_opt_new();
  v16[6] = v2;
  uint64_t v3 = +[SGMessageEventDissector sharedInstance];
  v16[7] = v3;
  uint64_t v4 = +[SGNaturalLanguageDissector sharedInstance];
  v16[8] = v4;
  id v5 = +[SGReminderDissector sharedInstance];
  v16[9] = v5;
  id v6 = objc_opt_new();
  v16[10] = v6;
  id v7 = objc_opt_new();
  v16[11] = v7;
  id v8 = objc_opt_new();
  v16[12] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:13];

  uint64_t v10 = +[SGPipeline parallelPipeline:v9];
  uint64_t v11 = (void *)fullPipeline_pipeline;
  fullPipeline_pipeline = v10;
}

+ (id)emptyPipeline
{
  return (id)[a1 customPipeline:MEMORY[0x1E4F1CBF0]];
}

+ (id)customPipeline:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
        uint64_t v13 = (void *)MEMORY[0x1CB79B230](v6);
        if (v11)
        {
          long long v22 = v11;
          uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
          [v4 setObject:v14 forKeyedSubscript:v12];
        }
        else
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E4F1CBF0], v12, (void)v18);
        }
        id v8 = v12;

        ++v10;
        uint64_t v11 = v8;
      }
      while (v7 != v10);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }
  else
  {
    id v8 = 0;
  }

  long long v15 = objc_opt_new();
  long long v16 = (void *)v15[1];
  v15[1] = v4;

  return v15;
}

+ (id)parallelPipeline:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  id v5 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v13 = (void *)MEMORY[0x1CB79B230]();
        [v6 setObject:v12 forKeyedSubscript:objc_opt_class()];
        [v5 addObject:objc_opt_class()];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v9);
  }

  id v14 = v5;
  long long v15 = objc_opt_new();
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __31__SGPipeline_parallelPipeline___block_invoke;
  v29[3] = &unk_1E65BB9F0;
  id v16 = v6;
  id v30 = v16;
  long long v17 = (void *)MEMORY[0x1CB79B4C0](v29);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __31__SGPipeline_parallelPipeline___block_invoke_2;
  void v26[3] = &unk_1E65BBA18;
  id v18 = v17;
  id v28 = v18;
  id v19 = v15;
  id v27 = v19;
  long long v20 = (void (**)(void, void))MEMORY[0x1CB79B4C0](v26);
  long long v21 = v14;
  if ([v14 count])
  {
    long long v22 = v14;
    do
    {
      long long v21 = ((void (**)(void, void *))v20)[2](v20, v22);

      long long v22 = v21;
    }
    while ([v21 count]);
  }
  uint64_t v23 = (void *)v4[1];
  v4[1] = v19;
  id v24 = v19;

  return v4;
}

id __31__SGPipeline_parallelPipeline___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (!v4)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v4 = objc_opt_new();
    [v5 setObject:v4 forKeyedSubscript:a2];
  }
  return v4;
}

id __31__SGPipeline_parallelPipeline___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v25 = (id)objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v3;
  uint64_t v21 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v31;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v4;
        uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * v4);
        context = (void *)MEMORY[0x1CB79B230]();
        id v5 = +[SGPipeline dependencyClassesForDissectorClass:v22];
        uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v7 = v5;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v27 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * i);
              uint64_t v13 = (void *)MEMORY[0x1CB79B230]();
              id v14 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
              [v6 addObject:v14];
              long long v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:v14];

              if (!v15) {
                [v25 addObject:v12];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v9);
        }

        id v16 = *(void **)(a1 + 32);
        long long v17 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        [v16 setObject:v6 forKeyedSubscript:v17];

        uint64_t v4 = v24 + 1;
      }
      while (v24 + 1 != v21);
      uint64_t v21 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v21);
  }

  return v25;
}

+ (id)dependencyClassesForDissectorClass:(Class)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v26[2] = objc_opt_class();
  void v26[3] = objc_opt_class();
  void v26[4] = objc_opt_class();
  v26[5] = objc_opt_class();
  v26[6] = objc_opt_class();
  v26[7] = objc_opt_class();
  v26[8] = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:9];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v6);
      }
      if ([(objc_class *)a3 isSubclassOfClass:*(void *)(*((void *)&v16 + 1) + 8 * v10)]) {
        goto LABEL_25;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v27 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v12 = v25;
LABEL_15:
    uint64_t v13 = 2;
LABEL_16:
    id v14 = [v11 arrayWithObjects:v12 count:v13];
    goto LABEL_26;
  }
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v12 = v24;
    goto LABEL_15;
  }
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v12 = v23;
    goto LABEL_15;
  }
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v22 = objc_opt_class();
    uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v12 = &v22;
LABEL_23:
    uint64_t v13 = 1;
    goto LABEL_16;
  }
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v21 = objc_opt_class();
    uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v12 = &v21;
    goto LABEL_23;
  }
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v20 = objc_opt_class();
    uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v12 = &v20;
    goto LABEL_23;
  }
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2, a1, @"SGPipeline.m", 235, @"Dependencies unknown for dissector class: %@", a3 object file lineNumber description];
LABEL_25:

  id v14 = 0;
LABEL_26:
  return v14;
}

+ (id)sharedBackgroundStorageQueue
{
  if (sharedBackgroundStorageQueue_onceToken != -1) {
    dispatch_once(&sharedBackgroundStorageQueue_onceToken, &__block_literal_global_22_31552);
  }
  uint64_t v2 = (void *)sharedBackgroundStorageQueue_queue;
  return v2;
}

uint64_t __42__SGPipeline_sharedBackgroundStorageQueue__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  id v1 = (void *)sharedBackgroundStorageQueue_queue;
  sharedBackgroundStorageQueue_queue = v0;

  [(id)sharedBackgroundStorageQueue_queue setMaxConcurrentOperationCount:1];
  uint64_t v2 = (void *)sharedBackgroundStorageQueue_queue;
  return [v2 setName:@"+[SGPipeline sharedBackgroundStorageQueue]"];
}

+ (id)sharedBackgroundProcessingQueue
{
  if (sharedBackgroundProcessingQueue_onceToken != -1) {
    dispatch_once(&sharedBackgroundProcessingQueue_onceToken, &__block_literal_global_17_31558);
  }
  uint64_t v2 = (void *)sharedBackgroundProcessingQueue_queue;
  return v2;
}

uint64_t __45__SGPipeline_sharedBackgroundProcessingQueue__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  id v1 = (void *)sharedBackgroundProcessingQueue_queue;
  sharedBackgroundProcessingQueue_queue = v0;

  [(id)sharedBackgroundProcessingQueue_queue setMaxConcurrentOperationCount:-1];
  uint64_t v2 = (void *)sharedBackgroundProcessingQueue_queue;
  return [v2 setName:@"+[SGPipeline sharedBackgroundProcessingQueue]"];
}

+ (void)_delayedResetCachesAndModels
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SGPipeline__delayedResetCachesAndModels__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_delayedResetCachesAndModels__pasOnceToken4 != -1) {
    dispatch_once(&_delayedResetCachesAndModels__pasOnceToken4, block);
  }
  uint64_t v2 = (id)_delayedResetCachesAndModels__pasExprOnceResult;
  dispatch_suspend(v2);
  int64_t data = dispatch_source_get_data((dispatch_source_t)memoryPressureSource);
  if (data > 15)
  {
    if (data != 32)
    {
      if (data == 16)
      {
        double v4 = 0.1;
        goto LABEL_13;
      }
      goto LABEL_12;
    }
LABEL_10:
    double v4 = 0.0;
    goto LABEL_13;
  }
  if (data == 2)
  {
    double v4 = 1.0;
    goto LABEL_13;
  }
  if (data == 4) {
    goto LABEL_10;
  }
LABEL_12:
  double v4 = 10.0;
LABEL_13:
  id v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v9 = v4;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "Setting a timer to reset DDNL caches in %f seconds", buf, 0xCu);
  }

  if (v4 <= 0.0) {
    dispatch_time_t v6 = 0;
  }
  else {
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  }
  dispatch_source_set_timer(v2, v6, 0xFFFFFFFFFFFFFFFFLL, 1000000000 * (unint64_t)(v4 / 10.0));
  dispatch_resume(v2);
}

void __42__SGPipeline__delayedResetCachesAndModels__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1CB79B230]();
  id v3 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"SGPipeline-_delayedResetCachesAndModels" qosClass:17];
  double v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v3);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __42__SGPipeline__delayedResetCachesAndModels__block_invoke_2;
  handler[3] = &__block_descriptor_40_e5_v8__0l;
  handler[4] = *(void *)(a1 + 32);
  dispatch_source_set_event_handler(v4, handler);
  dispatch_resume(v4);

  id v5 = (void *)_delayedResetCachesAndModels__pasExprOnceResult;
  _delayedResetCachesAndModels__pasExprOnceResult = (uint64_t)v4;
}

uint64_t __42__SGPipeline__delayedResetCachesAndModels__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetCachesAndModels];
}

+ (void)_resetCachesAndModels
{
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if (initialize__pasOnceToken3 != -1) {
      dispatch_once(&initialize__pasOnceToken3, &__block_literal_global_31567);
    }
    double v4 = (id)initialize__pasExprOnceResult;
    dispatch_source_t v2 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 0x37uLL, v4);
    id v3 = (void *)memoryPressureSource;
    memoryPressureSource = (uint64_t)v2;

    dispatch_source_set_event_handler((dispatch_source_t)memoryPressureSource, &__block_literal_global_12);
    dispatch_resume((dispatch_object_t)memoryPressureSource);
  }
}

uint64_t __24__SGPipeline_initialize__block_invoke_2()
{
  return +[SGPipeline _delayedResetCachesAndModels];
}

void __24__SGPipeline_initialize__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"SGPipeline-_resetCachesAndModels-pressure" qosClass:17];
  dispatch_source_t v2 = (void *)initialize__pasExprOnceResult;
  initialize__pasExprOnceResult = v1;
}

@end