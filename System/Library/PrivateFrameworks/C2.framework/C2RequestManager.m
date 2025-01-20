@interface C2RequestManager
+ (id)sharedManager;
+ (void)initialize;
- (C2RequestManager)init;
- (C2SessionPool)sessionPool;
- (id)createDataTaskWithRequest:(id)a3 options:(id)a4 delegate:(id)a5;
- (id)createDataTaskWithRequest:(id)a3 options:(id)a4 delegate:(id)a5 sessionHandle:(id *)a6;
- (id)testUtility_sessionForTask:(id)a3;
- (id)testUtility_sessionTaskForTask:(id)a3;
- (void)_testUtility_forTask:(id)a3 sessionHandle:(id *)a4 taskHandle:(id *)a5;
@end

@implementation C2RequestManager

+ (id)sharedManager
{
  return (id)sharedManager;
}

- (id)createDataTaskWithRequest:(id)a3 options:(id)a4 delegate:(id)a5 sessionHandle:(id *)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [v11 metricOptions];
  [v13 rollReportFrequencyRandomValue];

  v14 = (void *)MEMORY[0x1E01B8AF0]();
  double Current = CFAbsoluteTimeGetCurrent();
  v16 = [(C2RequestManager *)self sessionPool];
  v17 = [v11 identifier];
  v18 = [v16 createDataTaskWithRequestIdentifer:v17 request:v10 options:v11 delegate:v12 sessionHandle:a6];

  double v19 = CFAbsoluteTimeGetCurrent() - Current;
  if (C2_DEFAULT_LOG_BLOCK_6 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_6, &__block_literal_global_16);
  }
  v20 = C2_DEFAULT_LOG_INTERNAL_6;
  if (v19 <= 1.0) {
    os_log_type_t v21 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_6, v21))
  {
    int v23 = 134218498;
    double v24 = v19;
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2112;
    v28 = v18;
    _os_log_impl(&dword_1DD523000, v20, v21, "Creation of data task took %.3f seconds for request %@ resulting in task %@.", (uint8_t *)&v23, 0x20u);
  }

  return v18;
}

- (C2SessionPool)sessionPool
{
  return self->_sessionPool;
}

+ (void)initialize
{
  if (!sharedManager)
  {
    v4 = objc_alloc_init(C2RequestManager);
    v5 = (void *)sharedManager;
    sharedManager = (uint64_t)v4;

    if (!sharedManager)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2, a1, @"C2RequestManager.m", 16, @"Failed to alloc/init C2RequestManager, crash." object file lineNumber description];
    }
  }
}

- (C2RequestManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)C2RequestManager;
  v2 = [(C2RequestManager *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(C2SessionPool);
    sessionPool = v2->_sessionPool;
    v2->_sessionPool = v3;

    if (v2->_sessionPool) {
      return v2;
    }
    if (C2_DEFAULT_LOG_BLOCK_6 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_6, &__block_literal_global_12);
    }
    v5 = C2_DEFAULT_LOG_INTERNAL_6;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1DD523000, v5, OS_LOG_TYPE_ERROR, "failed to create C2SessionPool for C2RequestManager", v8, 2u);
    }
  }
  if (C2_DEFAULT_LOG_BLOCK_6 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_6, &__block_literal_global_14_0);
  }
  id v6 = C2_DEFAULT_LOG_INTERNAL_6;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1DD523000, v6, OS_LOG_TYPE_ERROR, "failed to create C2RequestManager", v8, 2u);
  }

  return 0;
}

uint64_t __24__C2RequestManager_init__block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_6 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __24__C2RequestManager_init__block_invoke_12()
{
  C2_DEFAULT_LOG_INTERNAL_6 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

- (id)createDataTaskWithRequest:(id)a3 options:(id)a4 delegate:(id)a5
{
  return [(C2RequestManager *)self createDataTaskWithRequest:a3 options:a4 delegate:a5 sessionHandle:0];
}

uint64_t __77__C2RequestManager_createDataTaskWithRequest_options_delegate_sessionHandle___block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_6 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

- (id)testUtility_sessionForTask:(id)a3
{
  id v5 = 0;
  [(C2RequestManager *)self _testUtility_forTask:a3 sessionHandle:&v5 taskHandle:0];
  id v3 = v5;
  return v3;
}

- (id)testUtility_sessionTaskForTask:(id)a3
{
  id v5 = 0;
  [(C2RequestManager *)self _testUtility_forTask:a3 sessionHandle:0 taskHandle:&v5];
  id v3 = v5;
  return v3;
}

- (void)_testUtility_forTask:(id)a3 sessionHandle:(id *)a4 taskHandle:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v33, "taskIdentifier"));
  if (!v7)
  {
    double v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"C2RequestManager.m" lineNumber:84 description:@"Task identifier should always be set."];
  }
  v8 = self;
  objc_sync_enter(v8);
  id v26 = v8->_sessionPool;
  objc_sync_enter(v26);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  __int16 v25 = v8;
  objc_super v9 = [(C2SessionPool *)v8->_sessionPool sessionGroupForSessionConfigurationName];
  id v10 = [v9 allValues];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
  id obj = v10;
  if (v11)
  {
    id v12 = 0;
    uint64_t v30 = *(void *)v39;
    uint64_t v31 = v11;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v39 != v30) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        v14 = [v13 sessions];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v35;
LABEL_10:
          uint64_t v17 = 0;
          v18 = v12;
          while (1)
          {
            if (*(void *)v35 != v16) {
              objc_enumerationMutation(v14);
            }
            id v19 = *(id *)(*((void *)&v34 + 1) + 8 * v17);
            objc_sync_enter(v19);
            v20 = [v19 wrappedTaskByTaskIdentifier];
            id v12 = [v20 objectForKeyedSubscript:v7];

            if (v12)
            {
              os_log_type_t v21 = [v12 taskDescription];
              v22 = [v33 taskDescription];
              char v23 = [v21 isEqual:v22];

              if (v23) {
                break;
              }
            }
            objc_sync_exit(v19);

            ++v17;
            v18 = v12;
            if (v15 == v17)
            {
              uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v42 count:16];
              if (v15) {
                goto LABEL_10;
              }
              goto LABEL_17;
            }
          }
          objc_sync_exit(v19);

          if (v19) {
            goto LABEL_23;
          }
        }
        else
        {
LABEL_17:
        }
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v31);
    id v19 = 0;
  }
  else
  {
    id v19 = 0;
    id v12 = 0;
  }
LABEL_23:

  objc_sync_exit(v26);
  objc_sync_exit(v25);

  if (a4) {
    *a4 = v19;
  }
  if (a5) {
    *a5 = v12;
  }
}

- (void).cxx_destruct
{
}

@end