@interface FPFSSQLBackupManager
- (FPFSSQLBackupManager)initWithUserURL:(id)a3 outputUserURL:(id)a4;
- (FPRTCReportingSession)rtcReporting;
- (_TtC9libfssync19FPFSSQLBackupEngine)backupEngine;
- (void)backUpWithCompletionHandler:(id)a3;
- (void)reportCompletionTelemetryWithError:(id)a3;
- (void)setBackupEngine:(id)a3;
@end

@implementation FPFSSQLBackupManager

- (FPFSSQLBackupManager)initWithUserURL:(id)a3 outputUserURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)FPFSSQLBackupManager;
  v8 = [(FPFSSQLBackupManager *)&v15 init];
  if (v8)
  {
    v9 = [[_TtC9libfssync19FPFSSQLBackupEngine alloc] initWithUserURL:v6 outputUserURL:v7];
    backupEngine = v8->_backupEngine;
    v8->_backupEngine = v9;

    v11 = [MEMORY[0x263F3C718] defaultManager];
    uint64_t v12 = [v11 sessionForProviderID:@"d2d_backup_global" version:0];
    rtcReporting = v8->_rtcReporting;
    v8->_rtcReporting = (FPRTCReportingSession *)v12;
  }
  return v8;
}

- (void)backUpWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  backupEngine = self->_backupEngine;
  if (backupEngine)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __52__FPFSSQLBackupManager_backUpWithCompletionHandler___block_invoke;
    v7[3] = &unk_2653072F0;
    v7[4] = self;
    id v8 = v4;
    [(FPFSSQLBackupEngine *)backupEngine backUpWithCompletionHandler:v7];
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __52__FPFSSQLBackupManager_backUpWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 reportCompletionTelemetryWithError:v6];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)reportCompletionTelemetryWithError:(id)a3
{
  id v4 = (__CFString *)a3;
  v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FPFSSQLBackupManager reportCompletionTelemetryWithError:](v4, v5);
  }

  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:@"success" code:0 userInfo:0];
  }
  id v7 = v6;
  [(FPRTCReportingSession *)self->_rtcReporting postReportWithCategory:1 type:1 payload:MEMORY[0x263EFFA78] error:v6];
}

- (FPRTCReportingSession)rtcReporting
{
  return self->_rtcReporting;
}

- (_TtC9libfssync19FPFSSQLBackupEngine)backupEngine
{
  return self->_backupEngine;
}

- (void)setBackupEngine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupEngine, 0);

  objc_storeStrong((id *)&self->_rtcReporting, 0);
}

- (void)reportCompletionTelemetryWithError:(__CFString *)a1 .cold.1(__CFString *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = @"success";
  if (a1) {
    v2 = a1;
  }
  int v3 = 138412290;
  id v4 = v2;
  _os_log_debug_impl(&dword_24D3D0000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] reporting d2d backup telemetry with %@", (uint8_t *)&v3, 0xCu);
}

@end