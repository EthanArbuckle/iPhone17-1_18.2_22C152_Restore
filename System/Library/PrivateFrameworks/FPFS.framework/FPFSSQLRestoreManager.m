@interface FPFSSQLRestoreManager
- (BOOL)cleanupOnSuccess;
- (FPFSSQLRestoreManager)initWithUserURL:(id)a3;
- (FPFSSQLRestoreManager)initWithUserURL:(id)a3 fromBuild:(id)a4 restoreType:(id)a5 cleanupOnSuccess:(BOOL)a6;
- (FPRTCReportingSession)rtcReporting;
- (_TtC9libfssync20FPFSSQLRestoreEngine)restoreEngine;
- (void)reportCompletionTelemetryWithError:(id)a3 atStep:(id)a4;
- (void)restoreWithCompletionHandler:(id)a3;
- (void)setRestoreEngine:(id)a3;
@end

@implementation FPFSSQLRestoreManager

- (FPFSSQLRestoreManager)initWithUserURL:(id)a3
{
  return [(FPFSSQLRestoreManager *)self initWithUserURL:a3 fromBuild:0 restoreType:0 cleanupOnSuccess:1];
}

- (FPFSSQLRestoreManager)initWithUserURL:(id)a3 fromBuild:(id)a4 restoreType:(id)a5 cleanupOnSuccess:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)FPFSSQLRestoreManager;
  v13 = [(FPFSSQLRestoreManager *)&v20 init];
  if (v13)
  {
    v14 = [[_TtC9libfssync20FPFSSQLRestoreEngine alloc] initWithUserURL:v10];
    restoreEngine = v13->_restoreEngine;
    v13->_restoreEngine = v14;

    v16 = [MEMORY[0x263F3C718] defaultManager];
    uint64_t v17 = [v16 sessionForProviderID:@"d2d_restore_global" version:0];
    rtcReporting = v13->_rtcReporting;
    v13->_rtcReporting = (FPRTCReportingSession *)v17;

    v13->_cleanupOnSuccess = a6;
    objc_storeStrong((id *)&v13->_backupBuild, a4);
    objc_storeStrong((id *)&v13->_restoreType, a5);
  }

  return v13;
}

- (void)restoreWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  restoreEngine = self->_restoreEngine;
  if (restoreEngine)
  {
    BOOL cleanupOnSuccess = self->_cleanupOnSuccess;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __54__FPFSSQLRestoreManager_restoreWithCompletionHandler___block_invoke;
    v8[3] = &unk_265307638;
    v8[4] = self;
    id v9 = v4;
    [(FPFSSQLRestoreEngine *)restoreEngine restoreWithCleanupOnSuccess:cleanupOnSuccess completionHandler:v8];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

void __54__FPFSSQLRestoreManager_restoreWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  v6 = *(void **)(a1 + 32);
  id v7 = a3;
  [v6 reportCompletionTelemetryWithError:v7 atStep:a4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)reportCompletionTelemetryWithError:(id)a3 atStep:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v6 = (__CFString *)a3;
  id v7 = (__CFString *)a4;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v8 = [MEMORY[0x263F087E8] errorWithDomain:@"success" code:0 userInfo:0];
  }
  id v9 = v8;
  id v10 = @"no step";
  if (v7) {
    id v10 = v7;
  }
  id v11 = v10;
  id v12 = fp_current_or_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = @"nil";
    if (v6) {
      uint64_t v17 = v6;
    }
    *(_DWORD *)buf = 138412546;
    v25 = v17;
    __int16 v26 = 2112;
    v27 = v7;
    _os_log_debug_impl(&dword_24D3D0000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] reporting d2d restore telemetry with error %@, step %@", buf, 0x16u);
  }

  v18 = @"operationType";
  v19 = @"reason";
  v13 = @"na";
  backupBuild = (__CFString *)self->_backupBuild;
  restoreType = self->_restoreType;
  if (!backupBuild) {
    backupBuild = @"na";
  }
  v21 = v11;
  v22 = backupBuild;
  objc_super v20 = @"operationSide";
  if (restoreType) {
    v13 = (__CFString *)restoreType;
  }
  v23 = v13;
  v16 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v18 count:3];
  -[FPRTCReportingSession postReportWithCategory:type:payload:error:](self->_rtcReporting, "postReportWithCategory:type:payload:error:", 1, 1, v16, v9, v18, v19, v20, v21, v22);
}

- (FPRTCReportingSession)rtcReporting
{
  return self->_rtcReporting;
}

- (BOOL)cleanupOnSuccess
{
  return self->_cleanupOnSuccess;
}

- (_TtC9libfssync20FPFSSQLRestoreEngine)restoreEngine
{
  return self->_restoreEngine;
}

- (void)setRestoreEngine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoreEngine, 0);
  objc_storeStrong((id *)&self->_rtcReporting, 0);
  objc_storeStrong((id *)&self->_restoreType, 0);

  objc_storeStrong((id *)&self->_backupBuild, 0);
}

@end