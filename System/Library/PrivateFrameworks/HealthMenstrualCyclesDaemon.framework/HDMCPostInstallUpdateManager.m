@interface HDMCPostInstallUpdateManager
- (BOOL)_triggerInitialAnalysisWithError:(id *)a3;
- (BOOL)_updateDeviceScopedStorageWithError:(id *)a3;
- (HDMCPostInstallUpdateManager)initWithProfileExtension:(id)a3;
- (void)daemonReady:(id)a3;
- (void)performPostInstallUpdateTaskForManager:(id)a3 completion:(id)a4;
@end

@implementation HDMCPostInstallUpdateManager

- (HDMCPostInstallUpdateManager)initWithProfileExtension:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDMCPostInstallUpdateManager;
  v5 = [(HDMCPostInstallUpdateManager *)&v11 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_profileExtension, v4);
    v8 = [v4 profile];
    v9 = [v8 daemon];
    [v9 registerDaemonReadyObserver:v6 queue:0];
  }
  return v6;
}

- (void)daemonReady:(id)a3
{
  id v4 = [a3 postInstallUpdateManager];
  [v4 registerUpdateTaskHandler:self queue:0];
}

- (void)performPostInstallUpdateTaskForManager:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, uint64_t, void))a4;
  id v14 = 0;
  BOOL v6 = [(HDMCPostInstallUpdateManager *)self _updateDeviceScopedStorageWithError:&v14];
  id v7 = v14;
  v8 = v7;
  if (v6)
  {
    id v13 = v7;
    BOOL v9 = [(HDMCPostInstallUpdateManager *)self _triggerInitialAnalysisWithError:&v13];
    id v10 = v13;

    if (v9)
    {
      uint64_t v11 = 1;
      id v12 = 0;
    }
    else
    {
      uint64_t v11 = 0;
      id v12 = v10;
    }
    ((void (**)(id, uint64_t, id))v5)[2](v5, v11, v12);
    v8 = v10;
  }
  else
  {
    ((void (**)(id, uint64_t, id))v5)[2](v5, 0, v7);
  }
}

- (BOOL)_triggerInitialAnalysisWithError:(id *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = v5;
    int v12 = 138543362;
    id v13 = (id)objc_opt_class();
    id v7 = v13;
    _os_log_impl(&dword_225722000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analyzing due to post install update task", (uint8_t *)&v12, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  BOOL v9 = [WeakRetained analysisManager];
  id v10 = [v9 analyzeWithError:a3];

  return v10 != 0;
}

- (BOOL)_updateDeviceScopedStorageWithError:(id *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x263F09930];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = v5;
    int v12 = 138543362;
    id v13 = (id)objc_opt_class();
    id v7 = v13;
    _os_log_impl(&dword_225722000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating Device-Scoped Storage due to post install update task", (uint8_t *)&v12, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  BOOL v9 = [WeakRetained deviceScopedStorageManager];
  char v10 = [v9 updateLocalDeviceValuesNowWithError:a3];

  return v10;
}

- (void).cxx_destruct
{
}

@end