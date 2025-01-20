@interface HDSampleQueryServer
+ (BOOL)supportsAnchorBasedAuthorization;
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (BOOL)validateConfiguration:(id *)a3;
- (HDSampleQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)diagnosticDescription;
- (id)objectTypes;
- (void)_queue_start;
@end

@implementation HDSampleQueryServer

- (void)_queue_start
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v44.receiver = self;
  v44.super_class = (Class)HDSampleQueryServer;
  [(HDQueryServer *)&v44 _queue_start];
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 0;
  if (self->_suspended)
  {
    char v43 = 1;
    self->_suspended = 0;
    _HKInitializeLogging();
    v3 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = self;
      _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_INFO, "%{public}@: Resuming from suspend", buf, 0xCu);
    }
  }
  [(HDQueryServer *)self setDataCount:0];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __35__HDSampleQueryServer__queue_start__block_invoke;
  v40[3] = &unk_1E630EA40;
  v40[4] = self;
  v40[5] = v42;
  id v41 = 0;
  v4 = v40;
  if ([(NSArray *)self->_queryDescriptors count] != 1)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F2B438]);
    sortDescriptors = self->_sortDescriptors;
    v23 = self->_queryDescriptors;
    v5 = (void *)[v21 initWithQueryDescriptors:v23 sortDescriptors:sortDescriptors followingAnchor:0 upToAndIncludingAnchor:0 distinctByKeyPaths:0 state:0];

    unint64_t limit = self->_limit;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __58__HDSampleQueryServer_batchObjectsWithError_batchHandler___block_invoke;
    v46 = &unk_1E62FC5E0;
    v47 = v4;
    int64_t v25 = [(HDBatchedQueryServer *)self batchObjectsWithMultitypeQueryCursor:v5 includeDeletedObjects:0 limit:limit error:&v41 batchHandler:buf];
    id v26 = v47;
    goto LABEL_28;
  }
  v5 = v4;
  id v6 = [(HDQueryServer *)self newDataEntityEnumerator];
  v7 = [(HDQueryServer *)self filter];
  [v6 setFilter:v7];

  v8 = [(HDQueryServer *)self sampleAuthorizationFilter];
  [v6 setAuthorizationFilter:v8];

  v9 = [(HDQueryServer *)self sampleType];
  char v10 = [v9 requiresPerObjectAuthorization];

  if ((v10 & 1) == 0) {
    [v6 setLimitCount:self->_limit];
  }
  [v6 setSortDescriptors:self->_sortDescriptors];
  if (self->_includeContributorInformation)
  {
    v11 = [(HDQueryServer *)self client];
    int v12 = [v11 hasEntitlement:*MEMORY[0x1E4F29928]];

    if (v12) {
      [v6 setEncodingOption:MEMORY[0x1E4F1CC38] forKey:@"IncludeContributorInformation"];
    }
  }
  v13 = [(HDQueryServer *)self client];
  v14 = [v13 authorizationOracle];
  v15 = [(HDQueryServer *)self sampleType];
  *(void *)buf = 0;
  v16 = [v14 additionalAuthorizationPredicateForObjectType:v15 error:buf];
  id v17 = *(id *)buf;

  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), sel_enumeratorForSingleSampleTypeWithError_, @"Unable to determine authorization status."");
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27) {
      id v41 = v27;
    }

    id v26 = 0;
    goto LABEL_25;
  }
  [v6 setPredicate:v16];
  if (self->_includeAutomaticTimeZones) {
    [v6 setEncodingOption:MEMORY[0x1E4F1CC38] forKey:@"IncludeAutomaticTimeZone"];
  }
  if ([MEMORY[0x1E4F2B860] isAppleInternalInstall])
  {
    v18 = [MEMORY[0x1E4F2B860] sharedBehavior];
    if ([v18 performsWorkoutCondensation])
    {
      v19 = [(HDQueryServer *)self objectType];
      if ([v19 code] == 79)
      {
        v20 = [(HDQueryServer *)self client];
        int v39 = [v20 hasRequiredEntitlement:*MEMORY[0x1E4F2A548] error:0];

        if (v39) {
          [v6 setEncodingOption:MEMORY[0x1E4F1CC38] forKey:@"IncludeCondenserInfo"];
        }
        goto LABEL_24;
      }
    }
  }
LABEL_24:
  id v26 = v6;
LABEL_25:

  if (v26) {
    int64_t v25 = [(HDBatchedQueryServer *)self batchObjectsWithEnumerator:v26 error:&v41 handler:v5];
  }
  else {
    int64_t v25 = 1;
  }
LABEL_28:

  id v29 = v41;
  v30 = v29;
  if (v25 == 1)
  {
    _HKInitializeLogging();
    v33 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v30;
      _os_log_error_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_ERROR, "%{public}@: Encountered error enumerating results: %{public}@", buf, 0x16u);
    }
    v31 = v30;
    if (!v30)
    {
      v31 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 122, @"Sample enumeration failed without reporting an error.");
    }
    v34 = [(HDQueryServer *)self clientProxy];
    v35 = [(HDQueryServer *)self queryUUID];
    objc_msgSend(v34, "client_deliverError:forQuery:", v31, v35);
  }
  else
  {
    if (v25 == 2)
    {
      _HKInitializeLogging();
      v36 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = self;
        _os_log_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_INFO, "%{public}@: Client no longer authorized.", buf, 0xCu);
      }
      v37 = [(HDQueryServer *)self clientProxy];
      v38 = [(HDQueryServer *)self queryUUID];
      objc_msgSend(v37, "client_deliverSamples:clearPendingSamples:isFinalBatch:queryUUID:", MEMORY[0x1E4F1CBF0], 1, 1, v38);

      goto LABEL_42;
    }
    v31 = v29;
    if (v25 == 3)
    {
      _HKInitializeLogging();
      v32 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = self;
        _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_INFO, "%{public}@: Suspended during enumeration.", buf, 0xCu);
      }
      self->_suspended = 1;
LABEL_42:
      v31 = v30;
    }
  }

  _Block_object_dispose(v42, 8);
}

void __35__HDSampleQueryServer__queue_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v5 = [*(id *)(a1 + 32) filteredSamplesForClientWithSamples:a2];
  unint64_t v6 = [v5 count];
  unint64_t v7 = *(void *)(*(void *)(a1 + 32) + 224);
  if (v6 > v7 && v7 != 0)
  {
    uint64_t v9 = [v5 subarrayWithRange:0];

    v5 = (void *)v9;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = objc_msgSend(*(id *)(a1 + 32), "sanitizedSampleForQueryClient:", *(void *)(*((void *)&v25 + 1) + 8 * v15), (void)v25);
        [v10 addObject:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v13);
  }

  _HKInitializeLogging();
  id v17 = (void *)*MEMORY[0x1E4F29F90];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    v19 = v17;
    uint64_t v20 = [v11 count];
    *(_DWORD *)buf = 138543618;
    uint64_t v30 = v18;
    __int16 v31 = 2048;
    uint64_t v32 = v20;
    _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_INFO, "%{public}@ delivering %lu samples to client", buf, 0x16u);
  }
  id v21 = *(void **)(a1 + 32);
  if (v21)
  {
    v22 = [v21 clientProxy];
    id v21 = *(void **)(a1 + 32);
  }
  else
  {
    v22 = 0;
  }
  uint64_t v23 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  v24 = objc_msgSend(v21, "queryUUID", (void)v25);
  objc_msgSend(v22, "client_deliverSamples:clearPendingSamples:isFinalBatch:queryUUID:", v10, v23, a3, v24);

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setDataCount:", objc_msgSend(*(id *)(a1 + 32), "dataCount") + objc_msgSend(v10, "count"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryDescriptors, 0);

  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

- (HDSampleQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDSampleQueryServer;
  id v11 = [(HDQueryServer *)&v17 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    v11->_unint64_t limit = [v10 limit];
    uint64_t v12 = [v10 sortDescriptors];
    sortDescriptors = v11->_sortDescriptors;
    v11->_sortDescriptors = (NSArray *)v12;

    v11->_includeAutomaticTimeZones = [v10 includeAutomaticTimeZones];
    v11->_includeContributorInformation = [v10 includeContributorInformation];
    uint64_t v14 = [v10 queryDescriptors];
    queryDescriptors = v11->_queryDescriptors;
    v11->_queryDescriptors = (NSArray *)v14;
  }
  return v11;
}

- (id)objectTypes
{
  if (self) {
    self = (HDSampleQueryServer *)self->_queryDescriptors;
  }
  return (id)[(HDSampleQueryServer *)self hk_mapToSet:&__block_literal_global_245];
}

uint64_t __34__HDSampleQueryServer_objectTypes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 sampleType];
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)supportsAnchorBasedAuthorization
{
  return 1;
}

- (BOOL)validateConfiguration:(id *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HDSampleQueryServer;
  BOOL v5 = -[HDQueryServer validateConfiguration:](&v13, sel_validateConfiguration_);
  if (v5)
  {
    if (self->_includeAutomaticTimeZones
      && ([(HDQueryServer *)self client],
          unint64_t v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v6 hasPrivateMetadataAccess],
          v6,
          (v7 & 1) == 0))
    {
      v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = @"Unauthorized use of includeAutomaticTimeZones";
      id v10 = a3;
      uint64_t v11 = 4;
    }
    else
    {
      if ([(NSArray *)self->_queryDescriptors count])
      {
        LOBYTE(v5) = 1;
        return v5;
      }
      v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = @"Missing sample type for query";
      id v10 = a3;
      uint64_t v11 = 3;
    }
    objc_msgSend(v8, "hk_assignError:code:description:", v10, v11, v9);
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)diagnosticDescription
{
  if (self->_limit) {
    v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%lu", self->_limit);
  }
  else {
    v3 = @"none";
  }
  if ([(NSArray *)self->_sortDescriptors count])
  {
    v4 = [(NSArray *)self->_sortDescriptors hk_map:&__block_literal_global_296_1];
    BOOL v5 = [v4 componentsJoinedByString:@", "];
  }
  else
  {
    BOOL v5 = @"none";
  }
  v9.receiver = self;
  v9.super_class = (Class)HDSampleQueryServer;
  unint64_t v6 = [(HDQueryServer *)&v9 diagnosticDescription];
  char v7 = [v6 stringByAppendingFormat:@"\n\tlimit: %@ - sort: %@", v3, v5];

  return v7;
}

id __44__HDSampleQueryServer_diagnosticDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 key];
  int v4 = [v2 ascending];

  if (v4) {
    BOOL v5 = @" ASC";
  }
  else {
    BOOL v5 = @" DESC";
  }
  unint64_t v6 = [v3 stringByAppendingString:v5];

  return v6;
}

uint64_t __58__HDSampleQueryServer_batchObjectsWithError_batchHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end