@interface DDSTrialManager
- (DDSTrialManager)initWithWorkQueue:(id)a3;
- (DDSTrialManager)initWithWorkQueue:(id)a3 dataSource:(id)a4;
- (DDSTrialManagerDataSource)dataSource;
- (DDSTrialManagerDelegate)delegate;
- (NSMutableDictionary)trialClientByQuery;
- (OS_dispatch_queue)workQueue;
- (void)fetchTrialAssetForQuery:(id)a3 callback:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setUpTrialForQuery:(id)a3;
- (void)trialClient:(id)a3 didReceiveAsset:(id)a4;
- (void)trialClientDidStop:(id)a3;
@end

@implementation DDSTrialManager

- (void)setDelegate:(id)a3
{
}

- (DDSTrialManager)initWithWorkQueue:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(DDSTrialManagerDataSource);
  v6 = [(DDSTrialManager *)self initWithWorkQueue:v4 dataSource:v5];

  return v6;
}

- (DDSTrialManager)initWithWorkQueue:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DDSTrialManager;
  v9 = [(DDSTrialManager *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    objc_storeStrong((id *)&v10->_dataSource, a4);
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    trialClientByQuery = v10->_trialClientByQuery;
    v10->_trialClientByQuery = (NSMutableDictionary *)v11;
  }
  return v10;
}

- (void)setUpTrialForQuery:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(DDSTrialManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(DDSTrialManager *)self dataSource];
  int v7 = [v6 isEnabled];

  if (v7)
  {
    id v8 = [(DDSTrialManager *)self trialClientByQuery];
    v9 = [v8 objectForKey:v4];

    if (!v9)
    {
      v10 = DefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v4;
        _os_log_impl(&dword_1E41D6000, v10, OS_LOG_TYPE_DEFAULT, "Setting up trial for query: %@", (uint8_t *)&v14, 0xCu);
      }

      uint64_t v11 = [(DDSTrialManager *)self dataSource];
      v12 = [(DDSTrialManager *)self workQueue];
      v9 = [v11 createTrialClientWithWorkQueue:v12 query:v4];

      if (v9)
      {
        [v9 setDelegate:self];
        [v9 start];
        v13 = [(DDSTrialManager *)self trialClientByQuery];
        [v13 setObject:v9 forKeyedSubscript:v4];
      }
      else
      {
        v13 = DefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[DDSTrialManager setUpTrialForQuery:]((uint64_t)v4, v13);
        }
        v9 = 0;
      }
    }
  }
}

- (void)fetchTrialAssetForQuery:(id)a3 callback:(id)a4
{
  id v13 = a3;
  v6 = (void (**)(id, void, void *))a4;
  int v7 = [(DDSTrialManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(DDSTrialManager *)self dataSource];
  char v9 = [v8 isEnabled];

  if (v9)
  {
    v10 = [(DDSTrialManager *)self trialClientByQuery];
    uint64_t v11 = [v10 objectForKey:v13];

    if (v11)
    {
      [v11 fetchAssetWithCallback:v6];
    }
    else
    {
      v12 = DDSTrialErrorWithCode(6);
      v6[2](v6, 0, v12);
    }
  }
  else
  {
    uint64_t v11 = DDSTrialErrorWithCode(0);
    v6[2](v6, 0, v11);
  }
}

- (void)trialClient:(id)a3 didReceiveAsset:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DDSTrialManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v9 = [(DDSTrialManager *)self trialClientByQuery];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v20 != v12) {
        objc_enumerationMutation(v9);
      }
      int v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
      id v15 = [(DDSTrialManager *)self trialClientByQuery];
      id v16 = [v15 objectForKey:v14];

      if (v16 == v6) {
        break;
      }

      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v17 = v14;

    if (!v17) {
      goto LABEL_12;
    }
    v18 = [(DDSTrialManager *)self delegate];
    [v18 trialDidReceiveAsset:v7 forQuery:v17];
  }
  else
  {
LABEL_9:

LABEL_12:
    v17 = DefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[DDSTrialManager trialClient:didReceiveAsset:]((uint64_t)v7, (uint64_t)v6, v17);
    }
  }
}

- (void)trialClientDidStop:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(DDSTrialManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(DDSTrialManager *)self trialClientByQuery];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
      uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
      uint64_t v12 = [(DDSTrialManager *)self trialClientByQuery];
      id v13 = [v12 objectForKey:v11];

      if (v13 == v4) {
        break;
      }

      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    int v14 = v11;

    if (!v14) {
      goto LABEL_12;
    }
    id v15 = [(DDSTrialManager *)self delegate];
    [v15 trialDidStopForQuery:v14];
  }
  else
  {
LABEL_9:

LABEL_12:
    int v14 = DefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[DDSTrialManager trialClientDidStop:]((uint64_t)v4, v14);
    }
  }
}

- (DDSTrialManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DDSTrialManagerDelegate *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (DDSTrialManagerDataSource)dataSource
{
  return (DDSTrialManagerDataSource *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)trialClientByQuery
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialClientByQuery, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setUpTrialForQuery:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E41D6000, a2, OS_LOG_TYPE_ERROR, "Failed to create trial client for query: %@", (uint8_t *)&v2, 0xCu);
}

- (void)trialClient:(os_log_t)log didReceiveAsset:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1E41D6000, log, OS_LOG_TYPE_ERROR, "Did not handle did receive asset: %@ for client: %@", (uint8_t *)&v3, 0x16u);
}

- (void)trialClientDidStop:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E41D6000, a2, OS_LOG_TYPE_ERROR, "Did not handle trial client did stop: %@", (uint8_t *)&v2, 0xCu);
}

@end