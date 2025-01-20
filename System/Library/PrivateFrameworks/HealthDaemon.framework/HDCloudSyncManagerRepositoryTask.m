@interface HDCloudSyncManagerRepositoryTask
- (BOOL)runWhenSyncProhibited;
- (HDCloudSyncContext)context;
- (HDCloudSyncManager)manager;
- (HDCloudSyncManagerRepositoryTask)initWithManager:(id)a3 context:(id)a4;
- (HDXPCClient)client;
- (NSArray)repositories;
- (void)main;
- (void)mainWithRepositories:(id)a3 error:(id)a4;
- (void)setClient:(id)a3;
- (void)setContext:(id)a3;
- (void)setManager:(id)a3;
- (void)setRepositories:(id)a3;
- (void)setRunWhenSyncProhibited:(BOOL)a3;
@end

@implementation HDCloudSyncManagerRepositoryTask

- (HDCloudSyncManagerRepositoryTask)initWithManager:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncManagerRepositoryTask;
  v8 = [(HDCloudSyncManagerTask *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_manager, v6);
    uint64_t v10 = [v7 copy];
    context = v9->_context;
    v9->_context = (HDCloudSyncContext *)v10;
  }
  return v9;
}

- (void)main
{
  v3 = [(HDCloudSyncManagerRepositoryTask *)self manager];
  if (!v3)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 100, @"Manager has gone nil before starting task.");
    goto LABEL_7;
  }
  if (![(HDCloudSyncManagerRepositoryTask *)self runWhenSyncProhibited])
  {
    id v9 = 0;
    char v4 = [v3 canPerformCloudSyncWithError:&v9];
    id v5 = v9;
    id v6 = v5;
    if (v4)
    {

      goto LABEL_5;
    }
LABEL_7:
    [(HDCloudSyncManagerRepositoryTask *)self mainWithRepositories:0 error:v6];

    goto LABEL_8;
  }
LABEL_5:
  client = self->_client;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__HDCloudSyncManagerRepositoryTask_main__block_invoke;
  v8[3] = &unk_1E62FBAC8;
  v8[4] = self;
  [v3 cloudSyncRepositoriesForClient:client completion:v8];
LABEL_8:
}

void __40__HDCloudSyncManagerRepositoryTask_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  _HKInitializeLogging();
  id v7 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = v7;
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2048;
    uint64_t v13 = [v5 count];
    _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Fetched %ld repositories.", (uint8_t *)&v10, 0x16u);
  }
  [*(id *)(a1 + 32) mainWithRepositories:v5 error:v6];
}

- (void)mainWithRepositories:(id)a3 error:(id)a4
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (HDCloudSyncManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);

  return (HDCloudSyncManager *)WeakRetained;
}

- (void)setManager:(id)a3
{
}

- (HDCloudSyncContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSArray)repositories
{
  return self->_repositories;
}

- (void)setRepositories:(id)a3
{
}

- (HDXPCClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (BOOL)runWhenSyncProhibited
{
  return self->_runWhenSyncProhibited;
}

- (void)setRunWhenSyncProhibited:(BOOL)a3
{
  self->_runWhenSyncProhibited = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_repositories, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_manager);
}

@end