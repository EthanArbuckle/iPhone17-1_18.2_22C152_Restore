@interface DDSTrialClient
+ (id)createWithWorkQueue:(id)a3 query:(id)a4;
- (DDSTRIClient)triClient;
- (DDSTrialClient)initWithWorkQueue:(id)a3 triClient:(id)a4 triNamespaceName:(id)a5;
- (DDSTrialClientDelegate)delegate;
- (NSString)triNamespaceName;
- (OS_dispatch_queue)workQueue;
- (TRINotificationToken)notificationToken;
- (void)dealloc;
- (void)fetchAssetWithCallback:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNotificationToken:(id)a3;
- (void)start;
@end

@implementation DDSTrialClient

+ (id)createWithWorkQueue:(id)a3 query:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(MEMORY[0x1E4FB0098], "clientWithIdentifier:", objc_msgSend(v6, "projectId"));
  if (v7)
  {
    v8 = objc_msgSend(MEMORY[0x1E4FB05B8], "namespaceNameFromId:", objc_msgSend(v6, "namespaceId"));
    if (v8)
    {
      v9 = [[DDSTRIClient alloc] initWithClient:v7];
      v10 = [[DDSTrialClient alloc] initWithWorkQueue:v5 triClient:v9 triNamespaceName:v8];

      goto LABEL_10;
    }
    v11 = DefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[DDSTrialClient createWithWorkQueue:query:](v6);
    }
  }
  else
  {
    v8 = DefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[DDSTrialClient createWithWorkQueue:query:](v6);
    }
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (DDSTrialClient)initWithWorkQueue:(id)a3 triClient:(id)a4 triNamespaceName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DDSTrialClient;
  v12 = [(DDSTrialClient *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workQueue, a3);
    objc_storeStrong((id *)&v13->_triClient, a4);
    uint64_t v14 = [v11 copy];
    triNamespaceName = v13->_triNamespaceName;
    v13->_triNamespaceName = (NSString *)v14;
  }
  return v13;
}

- (void)start
{
  v3 = [(DDSTrialClient *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(DDSTrialClient *)self notificationToken];

  if (!v4)
  {
    objc_initWeak(&location, self);
    id v5 = [(DDSTrialClient *)self triClient];
    id v6 = [(DDSTrialClient *)self triNamespaceName];
    v7 = [(DDSTrialClient *)self workQueue];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __23__DDSTrialClient_start__block_invoke;
    v12 = &unk_1E6E3A8C0;
    objc_copyWeak(&v13, &location);
    v8 = [v5 addUpdateHandlerForNamespaceName:v6 queue:v7 usingBlock:&v9];
    -[DDSTrialClient setNotificationToken:](self, "setNotificationToken:", v8, v9, v10, v11, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __23__DDSTrialClient_start__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v4 = objc_loadWeakRetained(&to);

  if (v4)
  {
    id v5 = objc_loadWeakRetained(&to);
    id v6 = [v5 workQueue];
    dispatch_assert_queue_V2(v6);

    id v7 = objc_loadWeakRetained(&to);
    v8 = [v7 triClient];
    [v8 refresh];

    id v9 = objc_loadWeakRetained(&to);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __23__DDSTrialClient_start__block_invoke_2;
    v10[3] = &unk_1E6E3A898;
    objc_copyWeak(&v11, &to);
    [v9 fetchAssetWithCallback:v10];

    objc_destroyWeak(&v11);
  }
  objc_destroyWeak(&to);
}

void __23__DDSTrialClient_start__block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_loadWeakRetained(v3);
  id v7 = [v6 delegate];
  id v8 = objc_loadWeakRetained(v3);
  if (v9) {
    [v7 trialClient:v8 didReceiveAsset:v9];
  }
  else {
    [v7 trialClientDidStop:v8];
  }
}

- (void)fetchAssetWithCallback:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = [(DDSTrialClient *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(DDSTrialClient *)self triClient];
  id v7 = [(DDSTrialClient *)self triNamespaceName];
  id v8 = [v6 experimentIdentifiersWithNamespaceName:v7];

  if (v8)
  {
    id v9 = [(DDSTrialClient *)self triClient];
    uint64_t v10 = [(DDSTrialClient *)self triNamespaceName];
    id v11 = [v9 levelForFactor:@"languageAsset" withNamespaceName:v10];

    if (v11)
    {
      v12 = [v11 directoryValue];
      if ([v12 hasPath])
      {
        id v13 = [v11 directoryValue];
        char v14 = [v13 hasAsset];

        if (v14)
        {
          v15 = [v11 directoryValue];
          v16 = [v15 path];

          objc_super v17 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v38 = 0;
          v18 = [v17 contentsOfDirectoryAtPath:v16 error:&v38];
          id v19 = v38;

          if (v18)
          {
            if ([v18 count] == 1)
            {
              v20 = [v18 firstObject];
              uint64_t v21 = [v16 stringByAppendingPathComponent:v20];

              v22 = [DDSTrialExperimentIdentifiers alloc];
              v23 = [v8 experimentId];
              uint64_t v24 = [v8 deploymentId];
              v25 = [v8 treatmentId];
              v26 = [(TRIExperimentIdentifiers *)v22 initWithExperimentId:v23 deploymentId:v24 treatmentId:v25];

              v27 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v21];
              v28 = +[DDSTrialAsset createWithExperimentIdentifiers:v26 localURL:v27];
              if (v28)
              {
                v4[2](v4, v28, 0);
              }
              else
              {
                v36 = DefaultLog();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
                  -[DDSTrialClient fetchAssetWithCallback:]();
                }

                v37 = DDSTrialErrorWithCode(4);
                ((void (**)(id, void *, void *))v4)[2](v4, 0, v37);
              }
              v16 = (void *)v21;
              goto LABEL_33;
            }
            v35 = DefaultLog();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
              -[DDSTrialClient fetchAssetWithCallback:](v18, v35);
            }

            uint64_t v34 = 3;
          }
          else
          {
            v33 = DefaultLog();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              -[DDSTrialClient fetchAssetWithCallback:]();
            }

            uint64_t v34 = 5;
          }
          DDSTrialErrorWithCode(v34);
          v26 = (DDSTrialExperimentIdentifiers *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *, DDSTrialExperimentIdentifiers *))v4)[2](v4, 0, v26);
LABEL_33:

          goto LABEL_20;
        }
      }
      else
      {
      }
      v32 = DefaultLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[DDSTrialClient fetchAssetWithCallback:].cold.4((uint64_t)v11, v32);
      }

      uint64_t v31 = 5;
    }
    else
    {
      v30 = DefaultLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v40 = @"languageAsset";
        _os_log_impl(&dword_1E41D6000, v30, OS_LOG_TYPE_INFO, "Missing value for trial parameter: %@", buf, 0xCu);
      }

      uint64_t v31 = 2;
    }
    v16 = DDSTrialErrorWithCode(v31);
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v16);
LABEL_20:

    goto LABEL_21;
  }
  v29 = DefaultLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E41D6000, v29, OS_LOG_TYPE_INFO, "No experiment identifiers found, device is not enrolled in trial experiment", buf, 2u);
  }

  id v11 = DDSTrialErrorWithCode(1);
  ((void (**)(id, void *, void *))v4)[2](v4, 0, v11);
LABEL_21:
}

- (void)dealloc
{
  if (self->_notificationToken) {
    -[DDSTRIClient removeUpdateHandlerForToken:](self->_triClient, "removeUpdateHandlerForToken:");
  }
  v3.receiver = self;
  v3.super_class = (Class)DDSTrialClient;
  [(DDSTrialClient *)&v3 dealloc];
}

- (DDSTrialClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DDSTrialClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (DDSTRIClient)triClient
{
  return (DDSTRIClient *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)triNamespaceName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (TRINotificationToken)notificationToken
{
  return (TRINotificationToken *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNotificationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationToken, 0);
  objc_storeStrong((id *)&self->_triNamespaceName, 0);
  objc_storeStrong((id *)&self->_triClient, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (void)createWithWorkQueue:(void *)a1 query:.cold.1(void *a1)
{
  [a1 projectId];
  OUTLINED_FUNCTION_2_1(&dword_1E41D6000, v1, v2, "Failed to create TRI client for project id: %d", v3, v4, v5, v6, 0);
}

+ (void)createWithWorkQueue:(void *)a1 query:.cold.2(void *a1)
{
  [a1 namespaceId];
  OUTLINED_FUNCTION_2_1(&dword_1E41D6000, v1, v2, "Failed to create name space name for namespace id: %d", v3, v4, v5, v6, 0);
}

- (void)fetchAssetWithCallback:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_0(&dword_1E41D6000, v0, v1, "Failed to get contents of directory at path %@:%@");
}

- (void)fetchAssetWithCallback:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_0(&dword_1E41D6000, v0, v1, "Failed to create trial asset with %@:%@");
}

- (void)fetchAssetWithCallback:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_error_impl(&dword_1E41D6000, a2, OS_LOG_TYPE_ERROR, "Directory contents count: %lu is not equal to 1", (uint8_t *)&v3, 0xCu);
}

- (void)fetchAssetWithCallback:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E41D6000, a2, OS_LOG_TYPE_ERROR, "Path for the asset parameter is empty: %@", (uint8_t *)&v2, 0xCu);
}

@end