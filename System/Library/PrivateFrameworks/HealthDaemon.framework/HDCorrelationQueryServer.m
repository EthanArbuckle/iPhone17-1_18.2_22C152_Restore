@interface HDCorrelationQueryServer
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (HDCorrelationQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (NSDictionary)dataFilters;
- (void)_queue_start;
@end

@implementation HDCorrelationQueryServer

- (HDCorrelationQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HDCorrelationQueryServer;
  v12 = [(HDQueryServer *)&v18 initWithUUID:a3 configuration:v10 client:v11 delegate:a6];
  if (v12)
  {
    uint64_t v13 = [v10 filterDictionary];
    dataFilters = v12->_dataFilters;
    v12->_dataFilters = (NSDictionary *)v13;

    v15 = [v11 configuration];
    [v15 applicationSDKVersionToken];

    dyld_version_token_get_platform();
    if (dyld_get_base_platform() == 2) {
      char v16 = dyld_version_token_at_least() ^ 1;
    }
    else {
      char v16 = 0;
    }
    v12->_permitPartiallyFilteredCorrelations = v16;
    v12->_suspended = 0;
  }

  return v12;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)_queue_start
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)HDCorrelationQueryServer;
  [(HDQueryServer *)&v26 _queue_start];
  v3 = [(HDQueryServer *)self clientProxy];
  v4 = [v3 remoteObjectProxy];

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  if (self->_suspended)
  {
    char v25 = 1;
    self->_suspended = 0;
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E4F29F90];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v28 = self;
      _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_INFO, "%{public}@ Resuming from suspend.", buf, 0xCu);
    }
  }
  id v6 = [(HDQueryServer *)self newDataEntityEnumerator];
  v7 = [(HDQueryServer *)self filter];
  [v6 setFilter:v7];

  v8 = [(HDQueryServer *)self sampleAuthorizationFilter];
  [v6 setAuthorizationFilter:v8];

  id v23 = 0;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  objc_super v18 = __40__HDCorrelationQueryServer__queue_start__block_invoke;
  v19 = &unk_1E6307C60;
  v20 = self;
  id v9 = v4;
  id v21 = v9;
  v22 = v24;
  int64_t v10 = [(HDBatchedQueryServer *)self batchObjectsWithEnumerator:v6 error:&v23 handler:&v16];
  id v11 = v23;
  switch(v10)
  {
    case 1:
      uint64_t v13 = [(HDQueryServer *)self queryUUID];
      objc_msgSend(v9, "client_deliverError:forQuery:", v11, v13);

      break;
    case 2:
      _HKInitializeLogging();
      v14 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v28 = self;
        _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_INFO, "%{public}@: Client no longer authorized.", buf, 0xCu);
      }
      v15 = [(HDQueryServer *)self queryUUID];
      objc_msgSend(v9, "client_deliverCorrelations:clearPendingSamples:isFinalBatch:queryUUID:", MEMORY[0x1E4F1CBF0], 1, 1, v15);

      break;
    case 3:
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v28 = self;
        _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_INFO, "%{public}@: Suspended during enumeration.", buf, 0xCu);
      }
      self->_suspended = 1;
      break;
  }

  _Block_object_dispose(v24, 8);
}

void __40__HDCorrelationQueryServer__queue_start__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v8) {
    goto LABEL_14;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v19;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
      uint64_t v13 = *(void *)(a1 + 32);
      if (*(unsigned char *)(v13 + 216))
      {
        [*(id *)(*((void *)&v18 + 1) + 8 * v11) _filterCorrelatedObjectsWithFilterDictionary:*(void *)(v13 + 224)];
        if ([v12 _containsObjects]) {
          goto LABEL_11;
        }
      }
      else if (objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v11), "_containsObjects", (void)v18) {
             && [v12 _correlatedObjectsMatchFilterDictionary:*(void *)(*(void *)(a1 + 32) + 224)])
      }
      {
LABEL_11:
        objc_msgSend(v6, "addObject:", v12, (void)v18);
      }
      ++v11;
    }
    while (v9 != v11);
    uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v9);
LABEL_14:

  if ([v6 count]) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = a3 == 0;
  }
  if (!v14)
  {
    v15 = *(void **)(a1 + 40);
    uint64_t v16 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    uint64_t v17 = [*(id *)(a1 + 32) queryUUID];
    objc_msgSend(v15, "client_deliverCorrelations:clearPendingSamples:isFinalBatch:queryUUID:", v6, v16, a3, v17);

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (NSDictionary)dataFilters
{
  return self->_dataFilters;
}

- (void).cxx_destruct
{
}

@end