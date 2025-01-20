@interface EFAutoBugCaptureReporter
+ (EFAutoBugCaptureReporter)sharedReporter;
+ (OS_os_log)log;
- (EFAutoBugCaptureReporter)init;
- (SDRDiagnosticReporter)diagnosticReporter;
- (void)reportIssueType:(id)a3 description:(id)a4;
- (void)setDiagnosticReporter:(id)a3;
@end

@implementation EFAutoBugCaptureReporter

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__EFAutoBugCaptureReporter_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, block);
  }
  v2 = (void *)log_log;
  return (OS_os_log *)v2;
}

void __31__EFAutoBugCaptureReporter_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;
}

+ (EFAutoBugCaptureReporter)sharedReporter
{
  if (sharedReporter_onceToken != -1) {
    dispatch_once(&sharedReporter_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedReporter_sDiagnosticReporter;
  return (EFAutoBugCaptureReporter *)v2;
}

void __42__EFAutoBugCaptureReporter_sharedReporter__block_invoke()
{
  v0 = objc_alloc_init(EFAutoBugCaptureReporter);
  os_log_t v1 = (void *)sharedReporter_sDiagnosticReporter;
  sharedReporter_sDiagnosticReporter = (uint64_t)v0;
}

- (EFAutoBugCaptureReporter)init
{
  v6.receiver = self;
  v6.super_class = (Class)EFAutoBugCaptureReporter;
  v2 = [(EFAutoBugCaptureReporter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4FA8AF0]) initWithQueue:0];
    diagnosticReporter = v2->_diagnosticReporter;
    v2->_diagnosticReporter = (SDRDiagnosticReporter *)v3;
  }
  return v2;
}

- (void)reportIssueType:(id)a3 description:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[EFDevice currentDevice];
  if ([v8 isInternal])
  {
  }
  else
  {
    char v9 = EFIsSeedBuild();

    if ((v9 & 1) == 0) {
      goto LABEL_7;
    }
  }
  v10 = +[EFAutoBugCaptureReporter log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    -[EFAutoBugCaptureReporter reportIssueType:description:]((uint64_t)v7, v10);
  }

LABEL_7:
  v11 = [(EFAutoBugCaptureReporter *)self diagnosticReporter];
  v12 = [MEMORY[0x1E4F28B50] mainBundle];
  v13 = [v12 bundleIdentifier];
  v14 = [v11 signatureWithDomain:@"MobileMail" type:v6 subType:v7 detectedProcess:v13 triggerThresholdValues:0];

  v15 = [(EFAutoBugCaptureReporter *)self diagnosticReporter];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __56__EFAutoBugCaptureReporter_reportIssueType_description___block_invoke;
  v17[3] = &unk_1E6121D40;
  id v16 = v7;
  id v18 = v16;
  [v15 snapshotWithSignature:v14 duration:0 event:0 payload:v17 reply:0.0];
}

void __56__EFAutoBugCaptureReporter_reportIssueType_description___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[EFAutoBugCaptureReporter log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56__EFAutoBugCaptureReporter_reportIssueType_description___block_invoke_cold_1((uint64_t)v3, a1, v4);
  }
}

- (SDRDiagnosticReporter)diagnosticReporter
{
  return self->_diagnosticReporter;
}

- (void)setDiagnosticReporter:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)reportIssueType:(uint64_t)a1 description:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B5A59000, a2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v2, 0xCu);
}

void __56__EFAutoBugCaptureReporter_reportIssueType_description___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1B5A59000, log, OS_LOG_TYPE_ERROR, "SDRDiagnosticReporter response = %@, issue = %@", (uint8_t *)&v4, 0x16u);
}

@end