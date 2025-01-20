@interface EntitlementABCIssueReporter
- (BiometricAutoBugCapture)biometricABC;
- (EntitlementABCIssueReporter)initWithBiometricABC:(id)a3;
- (NSMutableDictionary)issues;
- (NSTimer)timer;
- (id)issueForTag:(id)a3;
- (void)addIssue:(id)a3;
- (void)reportLegacyClient:(id)a3;
- (void)reportMissingPermission:(int)a3 forClientName:(id)a4;
- (void)rescheduleTimer;
- (void)rescheduleTimerMain;
- (void)setBiometricABC:(id)a3;
- (void)setIssues:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation EntitlementABCIssueReporter

- (EntitlementABCIssueReporter)initWithBiometricABC:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EntitlementABCIssueReporter;
  v5 = [(EntitlementABCIssueReporter *)&v8 init];
  if (v5)
  {
    v6 = objc_opt_new();
    [(EntitlementABCIssueReporter *)v5 setIssues:v6];

    [(EntitlementABCIssueReporter *)v5 setBiometricABC:v4];
  }

  return v5;
}

- (void)reportLegacyClient:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  +[LegacyEntitlementABCIssue reportClient:v5 forReporter:v4];
  objc_sync_exit(v4);
}

- (void)reportMissingPermission:(int)a3 forClientName:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  v6 = self;
  objc_sync_enter(v6);
  +[MissingPermissionABCIssue reportPermission:v4 client:v7 forReporter:v6];
  objc_sync_exit(v6);
}

- (id)issueForTag:(id)a3
{
  id v4 = a3;
  id v5 = [(EntitlementABCIssueReporter *)self issues];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)addIssue:(id)a3
{
  id v4 = a3;
  id v6 = [(EntitlementABCIssueReporter *)self issues];
  id v5 = [v4 tag];
  [v6 setObject:v4 forKeyedSubscript:v5];
}

- (void)rescheduleTimer
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__EntitlementABCIssueReporter_rescheduleTimer__block_invoke;
  block[3] = &unk_26454E2E0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __46__EntitlementABCIssueReporter_rescheduleTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) rescheduleTimerMain];
}

- (void)rescheduleTimerMain
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v3 = &_os_log_internal;
  if (__osLogTrace) {
    id v4 = __osLogTrace;
  }
  else {
    id v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEFAULT, "rescheduleTimer\n", buf, 2u);
  }
  id v5 = self;
  objc_sync_enter(v5);
  obj = v5;
  id v6 = [(EntitlementABCIssueReporter *)v5 timer];
  [v6 invalidate];

  [(EntitlementABCIssueReporter *)v5 setTimer:0];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = [(EntitlementABCIssueReporter *)v5 issues];
  objc_super v8 = [v7 allValues];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v9)
  {
    v10 = 0;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v14 = __osLog;
        if (!__osLog) {
          v14 = v3;
        }
        v15 = v14;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = v3;
          id v17 = [v13 tag];
          v18 = [v13 nextAction];
          *(_DWORD *)buf = 138412546;
          id v38 = v17;
          __int16 v39 = 2112;
          v40 = v18;
          _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_INFO, "rescheduleTimer: examining issue %@ nextAction=%@\n", buf, 0x16u);

          v3 = v16;
        }

        [v13 reportIfNeeded];
        v19 = [v13 nextAction];

        if (v19)
        {
          if (v10)
          {
            v20 = [v13 nextAction];
            BOOL v21 = [v10 compare:v20] == 1;

            if (v21)
            {
              uint64_t v22 = [v13 nextAction];

              v10 = (void *)v22;
            }
          }
          else
          {
            v10 = [v13 nextAction];
          }
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v9);

    if (v10)
    {
      v23 = [MEMORY[0x263EFF910] now];
      [v10 timeIntervalSinceDate:v23];
      double v25 = v24;

      if (__osLog) {
        v26 = __osLog;
      }
      else {
        v26 = v3;
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v38 = v10;
        __int16 v39 = 1024;
        LODWORD(v40) = (int)v25;
        _os_log_impl(&dword_21FFF3000, v26, OS_LOG_TYPE_INFO, "Entitlement issue timer will fire at %@, interval=%d\n", buf, 0x12u);
      }
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __50__EntitlementABCIssueReporter_rescheduleTimerMain__block_invoke;
      v32[3] = &unk_26454E518;
      v32[4] = obj;
      v27 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:0 repeats:v32 block:v25];
      [(EntitlementABCIssueReporter *)obj setTimer:v27];

      v28 = [(EntitlementABCIssueReporter *)obj timer];
      [v28 setTolerance:10.0];

      goto LABEL_36;
    }
  }
  else
  {
  }
  if (__osLog) {
    v29 = __osLog;
  }
  else {
    v29 = v3;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FFF3000, v29, OS_LOG_TYPE_INFO, "Entitlement issue timer not scheduled\n", buf, 2u);
  }
  v10 = 0;
LABEL_36:
  objc_sync_exit(obj);

  if (__osLogTrace) {
    v30 = __osLogTrace;
  }
  else {
    v30 = v3;
  }
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FFF3000, v30, OS_LOG_TYPE_DEFAULT, "rescheduleTimer ->\n", buf, 2u);
  }
}

uint64_t __50__EntitlementABCIssueReporter_rescheduleTimerMain__block_invoke(uint64_t a1)
{
  if (__osLog) {
    v2 = __osLog;
  }
  else {
    v2 = &_os_log_internal;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21FFF3000, v2, OS_LOG_TYPE_INFO, "Entitlement issue timer fired\n", v4, 2u);
  }
  return [*(id *)(a1 + 32) rescheduleTimer];
}

- (BiometricAutoBugCapture)biometricABC
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_biometricABC);
  return (BiometricAutoBugCapture *)WeakRetained;
}

- (void)setBiometricABC:(id)a3
{
}

- (NSMutableDictionary)issues
{
  return self->_issues;
}

- (void)setIssues:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_issues, 0);
  objc_destroyWeak((id *)&self->_biometricABC);
}

@end