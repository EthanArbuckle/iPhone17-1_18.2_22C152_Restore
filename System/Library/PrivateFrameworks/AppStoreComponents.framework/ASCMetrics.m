@interface ASCMetrics
+ (ASCMetrics)sharedMetrics;
- (ASCMetrics)initWithConnection:(id)a3;
- (ASCPendingPromises)pendingProcesses;
- (ASCServices)connection;
- (id)processMetricsData:(id)a3 pageFields:(id)a4 activity:(id)a5;
- (id)processMetricsData:(id)a3 withActivity:(id)a4;
- (id)processViewMetrics:(id)a3 atInvocationPoint:(id)a4 withActivity:(id)a5;
- (id)processViewRenderWithPredicate:(id)a3;
- (id)recordCampaignToken:(id)a3 providerToken:(id)a4 withLockup:(id)a5;
- (id)recordQToken:(id)a3 campaignToken:(id)a4 advertisementID:(id)a5 withLockup:(id)a6;
- (void)daemonConnectionWasLost:(id)a3;
- (void)dealloc;
- (void)logErrorMessage:(id)a3;
@end

@implementation ASCMetrics

+ (ASCMetrics)sharedMetrics
{
  if (sharedMetrics_onceToken != -1) {
    dispatch_once(&sharedMetrics_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)sharedMetrics_sharedMetrics;

  return (ASCMetrics *)v2;
}

void __27__ASCMetrics_sharedMetrics__block_invoke()
{
  v0 = [ASCMetrics alloc];
  id v3 = +[ASCServicesConnection sharedConnection];
  uint64_t v1 = [(ASCMetrics *)v0 initWithConnection:v3];
  v2 = (void *)sharedMetrics_sharedMetrics;
  sharedMetrics_sharedMetrics = v1;
}

- (ASCMetrics)initWithConnection:(id)a3
{
  id v5 = a3;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v13.receiver = self;
  v13.super_class = (Class)ASCMetrics;
  v6 = [(ASCMetrics *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = objc_alloc_init(ASCPendingPromises);
    pendingProcesses = v7->_pendingProcesses;
    v7->_pendingProcesses = v8;

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel_daemonConnectionWasLost_ name:0x1F1E052D8 object:v5];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v7 selector:sel_daemonConnectionWasLost_ name:0x1F1E052F8 object:v5];
  }
  return v7;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ASCMetrics;
  [(ASCMetrics *)&v4 dealloc];
}

- (void)daemonConnectionWasLost:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = @"Connection to daemon was lost";
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = (void *)[v4 initWithDomain:0x1F1E046B8 code:1 userInfo:v5];

  v7 = [(ASCMetrics *)self pendingProcesses];
  [v7 finishAllWithError:v6];
}

- (id)processMetricsData:(id)a3 pageFields:(id)a4 activity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(ASCMetrics *)self pendingProcesses];
  objc_initWeak(&location, v11);

  id v12 = objc_alloc_init(MEMORY[0x1E4F4DDA0]);
  objc_super v13 = [(ASCMetrics *)self connection];
  v14 = [v13 metricsService];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __53__ASCMetrics_processMetricsData_pageFields_activity___block_invoke;
  v25[3] = &unk_1E645E538;
  objc_copyWeak(&v30, &location);
  id v15 = v12;
  id v26 = v15;
  id v16 = v8;
  id v27 = v16;
  id v17 = v9;
  id v28 = v17;
  id v18 = v10;
  id v29 = v18;
  [v14 addSuccessBlock:v25];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __53__ASCMetrics_processMetricsData_pageFields_activity___block_invoke_3;
  v23[3] = &unk_1E645D738;
  id v19 = v15;
  id v24 = v19;
  [v14 addErrorBlock:v23];
  v20 = v24;
  id v21 = v19;

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

  return v21;
}

void __53__ASCMetrics_processMetricsData_pageFields_activity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 64);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained addBinaryPromise:*(void *)(a1 + 32)];

  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __53__ASCMetrics_processMetricsData_pageFields_activity___block_invoke_2;
  v9[3] = &unk_1E645D738;
  id v10 = *(id *)(a1 + 32);
  [v4 processMetricsData:v6 pageFields:v7 activity:v8 withReplyHandler:v9];
}

uint64_t __53__ASCMetrics_processMetricsData_pageFields_activity___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithError:a2];
  }
  else {
    return [v2 finishWithSuccess];
  }
}

uint64_t __53__ASCMetrics_processMetricsData_pageFields_activity___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (id)recordCampaignToken:(id)a3 providerToken:(id)a4 withLockup:(id)a5
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v10 offer];

  if (v11)
  {
    id v12 = ASCOfferGetCodableClasses();
    objc_super v13 = [v10 offer];
    char v14 = [v12 containsObject:objc_opt_class()];

    if ((v14 & 1) == 0)
    {
      id v15 = NSString;
      id v16 = [v10 offer];
      id v17 = (objc_class *)objc_opt_class();
      id v18 = NSStringFromClass(v17);
      id v19 = [v15 stringWithFormat:@"Unsupported custom lockup offer type: %@.", v18];

      id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v41 = *MEMORY[0x1E4F28568];
      v42[0] = v19;
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
      v22 = (void *)[v20 initWithDomain:0x1F1E046B8 code:3 userInfo:v21];

      id v23 = [MEMORY[0x1E4F4DBF0] promiseWithError:v22];

      goto LABEL_6;
    }
  }
  else
  {
  }
  id v24 = [(ASCMetrics *)self pendingProcesses];
  objc_initWeak(&location, v24);

  id v25 = objc_alloc_init(MEMORY[0x1E4F4DDA0]);
  id v26 = [(ASCMetrics *)self connection];
  id v27 = [v26 metricsService];

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __59__ASCMetrics_recordCampaignToken_providerToken_withLockup___block_invoke;
  v34[3] = &unk_1E645E538;
  objc_copyWeak(&v39, &location);
  id v28 = v25;
  id v35 = v28;
  id v36 = v8;
  id v37 = v9;
  id v38 = v10;
  [v27 addSuccessBlock:v34];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __59__ASCMetrics_recordCampaignToken_providerToken_withLockup___block_invoke_3;
  v32[3] = &unk_1E645D738;
  id v29 = v28;
  id v33 = v29;
  [v27 addErrorBlock:v32];
  id v30 = v33;
  id v23 = v29;

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
LABEL_6:

  return v23;
}

void __59__ASCMetrics_recordCampaignToken_providerToken_withLockup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 64);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained addBinaryPromise:*(void *)(a1 + 32)];

  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __59__ASCMetrics_recordCampaignToken_providerToken_withLockup___block_invoke_2;
  v9[3] = &unk_1E645D738;
  id v10 = *(id *)(a1 + 32);
  [v4 recordCampaignToken:v6 providerToken:v7 withLockup:v8 withReplyHandler:v9];
}

uint64_t __59__ASCMetrics_recordCampaignToken_providerToken_withLockup___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithError:a2];
  }
  else {
    return [v2 finishWithSuccess];
  }
}

uint64_t __59__ASCMetrics_recordCampaignToken_providerToken_withLockup___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (id)recordQToken:(id)a3 campaignToken:(id)a4 advertisementID:(id)a5 withLockup:(id)a6
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  char v14 = [v13 offer];

  if (v14)
  {
    id v15 = ASCOfferGetCodableClasses();
    id v16 = [v13 offer];
    char v17 = [v15 containsObject:objc_opt_class()];

    if ((v17 & 1) == 0)
    {
      id v18 = NSString;
      id v19 = [v13 offer];
      id v20 = (objc_class *)objc_opt_class();
      id v21 = NSStringFromClass(v20);
      v22 = [v18 stringWithFormat:@"Unsupported custom lockup offer type: %@.", v21];

      id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v45 = *MEMORY[0x1E4F28568];
      v46[0] = v22;
      id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
      id v25 = (void *)[v23 initWithDomain:0x1F1E046B8 code:3 userInfo:v24];

      id v26 = [MEMORY[0x1E4F4DBF0] promiseWithError:v25];

      goto LABEL_6;
    }
  }
  else
  {
  }
  id v27 = [(ASCMetrics *)self pendingProcesses];
  objc_initWeak(&location, v27);

  id v28 = objc_alloc_init(MEMORY[0x1E4F4DDA0]);
  id v29 = [(ASCMetrics *)self connection];
  id v30 = [v29 metricsService];

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __68__ASCMetrics_recordQToken_campaignToken_advertisementID_withLockup___block_invoke;
  v37[3] = &unk_1E645E560;
  objc_copyWeak(&v43, &location);
  id v31 = v28;
  id v38 = v31;
  id v39 = v10;
  id v40 = v11;
  id v41 = v12;
  id v42 = v13;
  [v30 addSuccessBlock:v37];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __68__ASCMetrics_recordQToken_campaignToken_advertisementID_withLockup___block_invoke_3;
  v35[3] = &unk_1E645D738;
  id v32 = v31;
  id v36 = v32;
  [v30 addErrorBlock:v35];
  id v33 = v36;
  id v26 = v32;

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
LABEL_6:

  return v26;
}

void __68__ASCMetrics_recordQToken_campaignToken_advertisementID_withLockup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 72);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained addBinaryPromise:*(void *)(a1 + 32)];

  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__ASCMetrics_recordQToken_campaignToken_advertisementID_withLockup___block_invoke_2;
  v10[3] = &unk_1E645D738;
  id v11 = *(id *)(a1 + 32);
  [v4 recordQToken:v6 campaignToken:v7 advertisementID:v8 withLockup:v9 withReplyHandler:v10];
}

uint64_t __68__ASCMetrics_recordQToken_campaignToken_advertisementID_withLockup___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithError:a2];
  }
  else {
    return [v2 finishWithSuccess];
  }
}

uint64_t __68__ASCMetrics_recordQToken_campaignToken_advertisementID_withLockup___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (id)processMetricsData:(id)a3 withActivity:(id)a4
{
  return [(ASCMetrics *)self processMetricsData:a3 pageFields:0 activity:a4];
}

- (id)processViewMetrics:(id)a3 atInvocationPoint:(id)a4 withActivity:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 dataForInvocationPoint:v9];
  if ([v11 count])
  {
    id v24 = v9;
    id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v23 = v11;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          id v19 = objc_msgSend(v8, "pageFields", v23);
          id v20 = [(ASCMetrics *)self processMetricsData:v18 pageFields:v19 activity:v10];
          [v12 addObject:v20];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v15);
    }

    id v21 = [MEMORY[0x1E4F4DBF0] promiseWithFlattenedPromises:v12];

    id v11 = v23;
    id v9 = v24;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[ASCMetrics processViewMetrics:atInvocationPoint:withActivity:]((uint64_t)v9);
    }
    id v21 = [MEMORY[0x1E4F4DBF0] promiseWithSuccess];
  }

  return v21;
}

- (id)processViewRenderWithPredicate:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEmpty])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = @"View render signpost predicate is empty.";
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    uint64_t v7 = (void *)[v5 initWithDomain:0x1F1E046B8 code:0 userInfo:v6];

    id v8 = [MEMORY[0x1E4F4DBF0] promiseWithError:v7];
  }
  else
  {
    id v9 = [(ASCMetrics *)self pendingProcesses];
    objc_initWeak(&location, v9);

    id v10 = objc_alloc_init(MEMORY[0x1E4F4DDA0]);
    id v11 = [(ASCMetrics *)self connection];
    id v12 = [v11 metricsService];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __45__ASCMetrics_processViewRenderWithPredicate___block_invoke;
    v19[3] = &unk_1E645E588;
    objc_copyWeak(&v22, &location);
    id v13 = v10;
    id v20 = v13;
    id v21 = v4;
    [v12 addSuccessBlock:v19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __45__ASCMetrics_processViewRenderWithPredicate___block_invoke_3;
    v17[3] = &unk_1E645D738;
    id v14 = v13;
    id v18 = v14;
    [v12 addErrorBlock:v17];
    uint64_t v15 = v18;
    id v8 = v14;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __45__ASCMetrics_processViewRenderWithPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained addBinaryPromise:*(void *)(a1 + 32)];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__ASCMetrics_processViewRenderWithPredicate___block_invoke_2;
  v7[3] = &unk_1E645D738;
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  [v4 processViewRenderWithPredicate:v6 withReplyHandler:v7];
}

uint64_t __45__ASCMetrics_processViewRenderWithPredicate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithError:a2];
  }
  else {
    return [v2 finishWithSuccess];
  }
}

uint64_t __45__ASCMetrics_processViewRenderWithPredicate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (void)logErrorMessage:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(ASCMetrics *)self connection];
    uint64_t v6 = [v5 metricsService];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __30__ASCMetrics_logErrorMessage___block_invoke;
    v7[3] = &unk_1E645E5B0;
    id v8 = v4;
    [v6 addSuccessBlock:v7];
  }
}

uint64_t __30__ASCMetrics_logErrorMessage___block_invoke(uint64_t a1, void *a2)
{
  return [a2 logErrorMessage:*(void *)(a1 + 32)];
}

- (ASCServices)connection
{
  return self->_connection;
}

- (ASCPendingPromises)pendingProcesses
{
  return self->_pendingProcesses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingProcesses, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)processViewMetrics:(uint64_t)a1 atInvocationPoint:withActivity:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "No metrics for invocation point %@, skipping XPC call", (uint8_t *)&v1, 0xCu);
}

@end