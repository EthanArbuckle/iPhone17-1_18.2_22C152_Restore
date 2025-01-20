@interface EKDiagnosticsCollector
- (BOOL)redactLogs;
- (EKDiagnosticsCollectionDelegate)delegate;
- (EKDiagnosticsCollector)initWithEventStore:(id)a3 delegate:(id)a4;
- (NSArray)files;
- (unint64_t)trafficLogsCollectionMode;
- (void)cancel;
- (void)cancelDiagnosticsCollection;
- (void)collectDiagnostics;
- (void)disconnected;
- (void)receivedBatchResultsFromServer:(id)a3 finished:(BOOL)a4;
- (void)setRedactLogs:(BOOL)a3;
- (void)setTrafficLogsCollectionMode:(unint64_t)a3;
@end

@implementation EKDiagnosticsCollector

- (EKDiagnosticsCollector)initWithEventStore:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EKDiagnosticsCollector;
  v9 = [(EKDiagnosticsCollector *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v10->_trafficLogsCollectionMode = 2;
    v10->_lock._os_unfair_lock_opaque = 0;
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    files = v10->_files;
    v10->_files = v11;
  }
  return v10;
}

- (void)collectDiagnostics
{
  v3 = [(EKEventStore *)self->_store connection];
  self->_uint64_t token = [v3 addCancellableRemoteOperation:self];

  BOOL v4 = !self->_redactLogs;
  v5 = [(EKEventStore *)self->_store connection];
  v6 = [v5 CADOperationProxySync];
  uint64_t token = self->_token;
  unint64_t v8 = [(EKDiagnosticsCollector *)self trafficLogsCollectionMode];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__EKDiagnosticsCollector_collectDiagnostics__block_invoke;
  v9[3] = &unk_1E5B990C8;
  v9[4] = self;
  [v6 CADDiagnosticsCollectWithToken:token options:v4 trafficLogsCollectionMode:v8 reply:v9];
}

void __44__EKDiagnosticsCollector_collectDiagnostics__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    BOOL v4 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __44__EKDiagnosticsCollector_collectDiagnostics__block_invoke_cold_1(v4, a2);
    }
    v5 = [*(id *)(*(void *)(a1 + 32) + 8) connection];
    [v5 removeCancellableRemoteOperation:*(unsigned int *)(*(void *)(a1 + 32) + 16)];
  }
}

- (void)cancelDiagnosticsCollection
{
  id v3 = [(EKEventStore *)self->_store connection];
  [v3 cancelRemoteOperation:self->_token];
}

- (NSArray)files
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = [(NSMutableDictionary *)self->_files allKeys];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (void)cancel
{
  id v4 = [(EKEventStore *)self->_store connection];
  id v3 = [v4 CADOperationProxySync];
  [v3 CADDiagnosticsCancelCollectionWithToken:self->_token reply:&__block_literal_global_62];
}

void __32__EKDiagnosticsCollector_cancel__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      __32__EKDiagnosticsCollector_cancel__block_invoke_cold_1(v3, a2);
    }
  }
}

- (void)disconnected
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_finished)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_finished = 1;
    os_unfair_lock_unlock(p_lock);
    id v5 = [(EKDiagnosticsCollector *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id v4 = [MEMORY[0x1E4F28C58] errorWithCADResult:1015];
      [v5 diagnosticsCollector:self finishedWithError:v4];
    }
  }
}

- (void)receivedBatchResultsFromServer:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_finished)
  {
    os_unfair_lock_unlock(&self->_lock);
    id v7 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
      -[EKDiagnosticsCollector receivedBatchResultsFromServer:finished:]((uint64_t)v6, v7);
    }
  }
  else
  {
    BOOL v28 = v4;
    if (v4) {
      self->_finished = 1;
    }
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_unlock(&self->_lock);
    id v29 = v6;
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v35;
      v11 = @"file";
      do
      {
        uint64_t v12 = 0;
        uint64_t v32 = v9;
        do
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v34 + 1) + 8 * v12);
          objc_super v14 = [v13 objectForKeyedSubscript:v11];
          v15 = [v14 url];
          uint64_t v16 = [v13 objectForKeyedSubscript:@"status"];
          v17 = (void *)v16;
          if (v15) {
            BOOL v18 = v16 == 0;
          }
          else {
            BOOL v18 = 1;
          }
          if (!v18)
          {
            v19 = v11;
            os_unfair_lock_lock(lock);
            v20 = [(NSMutableDictionary *)self->_files objectForKeyedSubscript:v15];
            v21 = self;
            [(NSMutableDictionary *)self->_files setObject:v17 forKeyedSubscript:v15];
            os_unfair_lock_unlock(lock);
            uint64_t v22 = [v20 unsignedIntegerValue];
            uint64_t v23 = [v17 unsignedIntegerValue];
            if (v22) {
              BOOL v24 = 1;
            }
            else {
              BOOL v24 = (unint64_t)(v23 - 1) > 1;
            }
            if (!v24) {
              [v30 addObject:v15];
            }

            self = v21;
            v11 = v19;
            uint64_t v9 = v32;
          }

          ++v12;
        }
        while (v9 != v12);
        uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v9);
    }

    v25 = [(EKDiagnosticsCollector *)self delegate];
    if (!self->_determinedOutputFiles)
    {
      self->_determinedOutputFiles = 1;
      if (objc_opt_respondsToSelector())
      {
        v26 = [(EKDiagnosticsCollector *)self files];
        [v25 diagnosticsCollector:self determinedExpectedOutputFiles:v26];
      }
    }
    if ([v30 count] && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v27 = [v30 allObjects];
      [v25 diagnosticsCollector:self createdOutputFiles:v27];
    }
    id v6 = v29;
    if (v28 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v25 diagnosticsCollector:self finishedWithError:0];
    }
  }
}

- (BOOL)redactLogs
{
  return self->_redactLogs;
}

- (void)setRedactLogs:(BOOL)a3
{
  self->_redactLogs = a3;
}

- (unint64_t)trafficLogsCollectionMode
{
  return self->_trafficLogsCollectionMode;
}

- (void)setTrafficLogsCollectionMode:(unint64_t)a3
{
  self->_trafficLogsCollectionMode = a3;
}

- (EKDiagnosticsCollectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKDiagnosticsCollectionDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_files, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

void __44__EKDiagnosticsCollector_collectDiagnostics__block_invoke_cold_1(void *a1, uint64_t a2)
{
  id v3 = (void *)MEMORY[0x1E4F28C58];
  id v4 = a1;
  id v5 = [v3 errorWithCADResult:a2];
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v6, v7, "Error starting diagnostics collection: %@", v8, v9, v10, v11, 2u);
}

void __32__EKDiagnosticsCollector_cancel__block_invoke_cold_1(void *a1, uint64_t a2)
{
  id v3 = (void *)MEMORY[0x1E4F28C58];
  id v4 = a1;
  id v5 = [v3 errorWithCADResult:a2];
  OUTLINED_FUNCTION_0_3(&dword_1A4E47000, v6, v7, "Error stopping diagnostics collection: %@", v8, v9, v10, v11, 2u);
}

- (void)receivedBatchResultsFromServer:(uint64_t)a1 finished:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_ERROR, "Ignoring new results, because we're already finished: %@", (uint8_t *)&v2, 0xCu);
}

@end