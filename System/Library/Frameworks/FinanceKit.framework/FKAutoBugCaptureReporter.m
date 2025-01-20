@interface FKAutoBugCaptureReporter
- (BOOL)isExpectedFailureReason:(int)a3;
- (BOOL)isRunningUnitTests;
- (BOOL)shouldReportIssue;
- (void)handleResponse:(id)a3;
- (void)reportIssueWithDomain:(id)a3 type:(id)a4 subtype:(id)a5 subtypeContext:(id)a6 payload:(id)a7;
@end

@implementation FKAutoBugCaptureReporter

- (void)reportIssueWithDomain:(id)a3 type:(id)a4 subtype:(id)a5 subtypeContext:(id)a6 payload:(id)a7
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (![(FKAutoBugCaptureReporter *)self isRunningUnitTests])
  {
    if ([(FKAutoBugCaptureReporter *)self shouldReportIssue])
    {
      v17 = [MEMORY[0x263F08AB0] processInfo];
      v18 = [v17 processName];
      v19 = v18;
      if (v18)
      {
        v20 = v18;
      }
      else
      {
        v21 = [MEMORY[0x263F086E0] mainBundle];
        v20 = [v21 bundleIdentifier];
      }
      id v22 = objc_alloc_init(MEMORY[0x263F7C080]);
      v23 = [v22 signatureWithDomain:v12 type:v13 subType:v14 subtypeContext:v15 detectedProcess:v20 triggerThresholdValues:0];
      v24 = os_log_create("com.apple.FinanceKit", "AutoBugCapture");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        id v27 = v12;
        __int16 v28 = 2112;
        id v29 = v13;
        __int16 v30 = 2112;
        id v31 = v14;
        __int16 v32 = 2112;
        id v33 = v15;
        _os_log_impl(&dword_243363000, v24, OS_LOG_TYPE_INFO, "Submitting snapshot request to ABC for signature: %@.%@.%@.%@", buf, 0x2Au);
      }

      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __86__FKAutoBugCaptureReporter_reportIssueWithDomain_type_subtype_subtypeContext_payload___block_invoke;
      v25[3] = &unk_265180230;
      v25[4] = self;
      [v22 snapshotWithSignature:v23 duration:0 event:v16 payload:v25 reply:0.0];
    }
    else
    {
      v20 = os_log_create("com.apple.FinanceKit", "AutoBugCapture");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        id v27 = v12;
        __int16 v28 = 2112;
        id v29 = v13;
        __int16 v30 = 2112;
        id v31 = v14;
        __int16 v32 = 2112;
        id v33 = v15;
        _os_log_impl(&dword_243363000, v20, OS_LOG_TYPE_INFO, "Not reporting to AutoBugCapture because we are rate limited: %@.%@.%@.%@", buf, 0x2Au);
      }
    }
  }
}

uint64_t __86__FKAutoBugCaptureReporter_reportIssueWithDomain_type_subtype_subtypeContext_payload___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleResponse:a2];
}

- (void)handleResponse:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F7C160]];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F7C150]];
    v8 = os_log_create("com.apple.FinanceKit", "AutoBugCapture");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_243363000, v8, OS_LOG_TYPE_INFO, "Diagnostic reporter snapshot accepted with sessionID %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    v9 = [v4 objectForKeyedSubscript:*MEMORY[0x263F7C128]];
    uint64_t v10 = [v9 intValue];

    v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F7C138]];
    BOOL v11 = [(FKAutoBugCaptureReporter *)self isExpectedFailureReason:v10];
    v8 = os_log_create("com.apple.FinanceKit", "AutoBugCapture");
    BOOL v12 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v11)
    {
      if (v12) {
        -[FKAutoBugCaptureReporter handleResponse:]();
      }
    }
    else if (v12)
    {
      -[FKAutoBugCaptureReporter handleResponse:]();
    }
  }
}

- (BOOL)isExpectedFailureReason:(int)a3
{
  return *MEMORY[0x263F7C0C0] == a3
      || *MEMORY[0x263F7C0C8] == a3
      || *MEMORY[0x263F7C0B0] == a3
      || *MEMORY[0x263F7C0F0] == a3;
}

- (BOOL)shouldReportIssue
{
  v2 = [MEMORY[0x263EFF910] now];
  os_unfair_lock_lock((os_unfair_lock_t)&shouldReportIssue_lock);
  if (shouldReportIssue_lastReportDate && (objc_msgSend(v2, "timeIntervalSinceDate:"), v3 < 86400.0))
  {
    BOOL v4 = 0;
  }
  else
  {
    objc_storeStrong((id *)&shouldReportIssue_lastReportDate, v2);
    BOOL v4 = 1;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&shouldReportIssue_lock);

  return v4;
}

- (BOOL)isRunningUnitTests
{
  return NSClassFromString(&cfstr_Xctest.isa) != 0;
}

- (void)handleResponse:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_243363000, v0, v1, "Diagnostic reporter snapshot rejected with expected reason %d (%@)");
}

- (void)handleResponse:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_243363000, v0, v1, "Diagnostic reporter snapshot rejected with unexpected reason %d (%@)");
}

@end