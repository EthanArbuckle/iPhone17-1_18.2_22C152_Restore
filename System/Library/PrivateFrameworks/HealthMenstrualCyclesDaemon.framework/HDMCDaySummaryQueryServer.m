@interface HDMCDaySummaryQueryServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (BOOL)_queue_surfaceDaySummariesWithError:(id *)a3;
- (HDMCDaySummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)objectTypes;
- (void)_queue_start;
@end

@implementation HDMCDaySummaryQueryServer

- (BOOL)_queue_surfaceDaySummariesWithError:(id *)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__7;
  v55 = __Block_byref_object_dispose__7;
  id v56 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 1;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = 0;
  uint64_t v30 = [(HKMCDaySummaryQueryConfiguration *)self->_configuration limit];
  v4 = [(HDQueryServer *)self clientProxy];
  v5 = [v4 remoteObjectProxy];

  v6 = (void *)MEMORY[0x263F43318];
  v7 = [(HDQueryServer *)self profile];
  v8 = [v7 database];
  id v41 = 0;
  v9 = objc_msgSend(v6, "hdmc_daySummaryAnchorWithHealthDatabase:error:", v8, &v41);
  id v10 = v41;

  if (!v9 && v10)
  {
    _HKInitializeLogging();
    v11 = (id)*MEMORY[0x263F09930];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      -[HDMCDaySummaryQueryServer _queue_surfaceDaySummariesWithError:](v12, (uint64_t)v10, (uint64_t)v57, v11);
    }
  }
  id v13 = objc_alloc_init(MEMORY[0x263F0A130]);
  v14 = [HDMCDaySummaryEnumerator alloc];
  v15 = [(HDQueryServer *)self profile];
  uint64_t v16 = [(HKMCDaySummaryQueryConfiguration *)self->_configuration dayIndexRange];
  LOBYTE(v29) = 0;
  v18 = -[HDMCDaySummaryEnumerator initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:](v14, "initWithProfile:calendarCache:dayIndexRange:ascending:includeFactors:includeWristTemperature:", v15, v13, v16, v17, [(HKMCDaySummaryQueryConfiguration *)self->_configuration ascending], 0, v29);

  id v40 = v10;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __65__HDMCDaySummaryQueryServer__queue_surfaceDaySummariesWithError___block_invoke;
  v32[3] = &unk_264751080;
  v32[4] = self;
  v35 = &v43;
  v36 = &v51;
  id v19 = v5;
  id v33 = v19;
  v37 = &v47;
  id v20 = v9;
  id v34 = v20;
  v38 = v42;
  uint64_t v39 = v30;
  BOOL v21 = [(HDMCDaySummaryEnumerator *)v18 enumerateWithError:&v40 handler:v32];
  id v22 = v40;

  if (!*((unsigned char *)v44 + 24))
  {
    if (v21)
    {
      uint64_t v23 = v52[5];
      int v24 = *((unsigned __int8 *)v48 + 24);
      v25 = [(HDQueryServer *)self queryUUID];
      objc_msgSend(v19, "client_deliverDaySummaries:clearPending:isFinalBatch:daySummaryAnchor:queryUUID:", v23, v24 != 0, 1, v20, v25);
    }
    else
    {
      v25 = [(HDQueryServer *)self queryUUID];
      objc_msgSend(v19, "client_deliverError:forQuery:", v22, v25);
    }
  }
  id v26 = v22;
  v27 = v26;
  if (v26)
  {
    if (a3) {
      *a3 = v26;
    }
    else {
      _HKLogDroppedError();
    }
  }

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  return v21;
}

- (void)_queue_start
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v31.receiver = self;
  v31.super_class = (Class)HDMCDaySummaryQueryServer;
  [(HDQueryServer *)&v31 _queue_start];
  v3 = [(HDQueryServer *)self clientProxy];
  v4 = [v3 remoteObjectProxy];

  v5 = [(HDQueryServer *)self client];
  v6 = [v5 authorizationOracle];
  v7 = [(HDMCDaySummaryQueryServer *)self objectTypes];
  id v30 = 0;
  v8 = [v6 readAuthorizationStatusesForTypes:v7 error:&v30];
  id v9 = v30;

  if (!v8)
  {
    id v20 = [(HDQueryServer *)self queryUUID];
    objc_msgSend(v4, "client_deliverError:forQuery:", v9, v20);
    goto LABEL_19;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = [v8 allValues];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (!v11)
  {

LABEL_18:
    id v20 = [MEMORY[0x263F431E0] contextForReadingProtectedData];
    BOOL v21 = [(HDQueryServer *)self profile];
    id v22 = [v21 database];
    v24[4] = self;
    id v25 = v9;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __41__HDMCDaySummaryQueryServer__queue_start__block_invoke;
    v24[3] = &unk_264751058;
    [v22 performTransactionWithContext:v20 error:&v25 block:v24 inaccessibilityHandler:0];
    id v23 = v25;

    id v9 = v23;
    goto LABEL_19;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v27;
  char v14 = 1;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v27 != v13) {
        objc_enumerationMutation(v10);
      }
      if (v14) {
        char v14 = [*(id *)(*((void *)&v26 + 1) + 8 * i) canRead];
      }
      else {
        char v14 = 0;
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v36 count:16];
  }
  while (v12);

  if (v14) {
    goto LABEL_18;
  }
  _HKInitializeLogging();
  uint64_t v16 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = v16;
    v18 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    id v33 = v18;
    __int16 v34 = 2114;
    v35 = v8;
    id v19 = v18;
    _os_log_impl(&dword_225722000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Avoiding exposing health data due to missing authorization: %{public}@", buf, 0x16u);
  }
  id v20 = [(HDQueryServer *)self queryUUID];
  objc_msgSend(v4, "client_deliverDaySummaries:clearPending:isFinalBatch:daySummaryAnchor:queryUUID:", MEMORY[0x263EFFA68], 0, 1, 0, v20);
LABEL_19:
}

void __65__HDMCDaySummaryQueryServer__queue_surfaceDaySummariesWithError___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v14 = a2;
  if (([*(id *)(a1 + 32) _shouldStopProcessingQuery] & 1) != 0
    || [*(id *)(a1 + 32) _shouldSuspendQuery])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
LABEL_4:
    *a3 = 1;
    goto LABEL_5;
  }
  if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count] >= 0x190)
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v6 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    v8 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v9 = [*(id *)(a1 + 32) queryUUID];
    objc_msgSend(v8, "client_deliverDaySummaries:clearPending:isFinalBatch:daySummaryAnchor:queryUUID:", v5, v6, 0, v7, v9);

    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v14];
  ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  uint64_t v13 = *(void *)(a1 + 88);
  if (v13 && *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) >= v13) {
    goto LABEL_4;
  }
LABEL_5:
}

uint64_t __41__HDMCDaySummaryQueryServer__queue_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_surfaceDaySummariesWithError:");
}

- (id)objectTypes
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = HKMCDaySummarySampleTypes();
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (HDMCDaySummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDMCDaySummaryQueryServer;
  uint64_t v12 = [(HDQueryServer *)&v15 initWithUUID:a3 configuration:v11 client:a5 delegate:a6];
  uint64_t v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_configuration, a4);
  }

  return v13;
}

- (void).cxx_destruct
{
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v6 = a4;
  uint64_t v7 = [v6 entitlements];
  uint64_t v8 = *MEMORY[0x263F09BA8];
  char v9 = [v7 hasEntitlement:*MEMORY[0x263F09BA8]];

  if ((v9 & 1) != 0
    || ([v6 entitlements],
        id v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = *MEMORY[0x263F09B98],
        char v12 = [v10 hasPrivateAccessEntitlementWithIdentifier:*MEMORY[0x263F09B98]],
        v10,
        (v12 & 1) != 0))
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a5, 4, @"Missing required entitlement: %@ for core apps or %@ for second-party access.", v8, v11);
    BOOL v13 = 0;
  }

  return v13;
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x263EFFA68];
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_surfaceDaySummariesWithError:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  id v6 = a1;
  _os_log_error_impl(&dword_225722000, a4, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving analysis anchor: %{public}@", (uint8_t *)a3, 0x16u);
}

@end