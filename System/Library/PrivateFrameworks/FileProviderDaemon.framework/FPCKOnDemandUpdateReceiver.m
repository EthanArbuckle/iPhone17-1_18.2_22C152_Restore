@interface FPCKOnDemandUpdateReceiver
- (FPCKOnDemandUpdateReceiver)initWithDomainBackend:(id)a3;
- (void)saveCheckpointWithReport:(id)a3;
- (void)sendDiagnosticsForItemIDs:(id)a3;
- (void)shouldPauseWithCompletion:(id)a3;
@end

@implementation FPCKOnDemandUpdateReceiver

- (FPCKOnDemandUpdateReceiver)initWithDomainBackend:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FPCKOnDemandUpdateReceiver;
  v5 = [(FPCKOnDemandUpdateReceiver *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_backend, v4);
  }

  return v6;
}

- (void)saveCheckpointWithReport:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1D744C000, v4, OS_LOG_TYPE_INFO, "[INFO] 🧹 Update recevier received a telemetry update: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)shouldPauseWithCompletion:(id)a3
{
}

- (void)sendDiagnosticsForItemIDs:(id)a3
{
  id v4 = a3;
  p_backend = &self->_backend;
  id WeakRetained = objc_loadWeakRetained((id *)p_backend);

  if (WeakRetained)
  {
    uint64_t v7 = objc_loadWeakRetained((id *)p_backend);
    [v7 sendDiagnosticsFromFPCKForItemIDs:v4];
  }
  else
  {
    uint64_t v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[FPCKOnDemandUpdateReceiver sendDiagnosticsForItemIDs:](v7);
    }
  }
}

- (void).cxx_destruct
{
}

- (void)sendDiagnosticsForItemIDs:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] 🧹 No backend for sendDiagnosticsForItemIDs", v1, 2u);
}

@end