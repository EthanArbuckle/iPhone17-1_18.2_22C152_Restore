@interface EntitlementABCIssue
- (BOOL)isFinalResult:(int)a3;
- (BOOL)shouldBeReportedNow;
- (EntitlementABCIssue)initWithClient:(id)a3 forReporter:(id)a4;
- (EntitlementABCIssueReporter)reporter;
- (NSDate)nextAction;
- (NSString)clientName;
- (id)context;
- (id)tag;
- (unint64_t)abcReason;
- (unint64_t)reportCounter;
- (void)handleABCResult:(int)a3;
- (void)report;
- (void)reportIfNeeded;
- (void)setClientName:(id)a3;
- (void)setNextAction:(id)a3;
- (void)setReportCounter:(unint64_t)a3;
- (void)setReporter:(id)a3;
@end

@implementation EntitlementABCIssue

- (EntitlementABCIssue)initWithClient:(id)a3 forReporter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EntitlementABCIssue;
  v8 = [(EntitlementABCIssue *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(EntitlementABCIssue *)v8 setClientName:v6];
    [(EntitlementABCIssue *)v9 setReporter:v7];
  }

  return v9;
}

- (id)tag
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"You must override %@ in a subclass", v4 format];

  return 0;
}

- (unint64_t)abcReason
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"You must override %@ in a subclass", v4 format];

  return 0;
}

- (id)context
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"You must override %@ in a subclass", v4 format];

  return 0;
}

- (BOOL)isFinalResult:(int)a3
{
  return *MEMORY[0x263F7C0E0] == a3
      || *MEMORY[0x263F7C0B8] == a3
      || *MEMORY[0x263F7C0E8] == a3
      || *MEMORY[0x263F7C100] == a3;
}

- (BOOL)shouldBeReportedNow
{
  uint64_t v3 = [(EntitlementABCIssue *)self nextAction];

  if (!v3) {
    return 0;
  }
  v4 = [(EntitlementABCIssue *)self nextAction];
  [v4 timeIntervalSinceNow];
  BOOL v6 = v5 < 0.0;

  return v6;
}

- (void)handleABCResult:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  double v5 = [(EntitlementABCIssue *)self reporter];
  objc_sync_enter(v5);
  BOOL v6 = [(EntitlementABCIssue *)self isFinalResult:v3];
  id v7 = (void *)&_os_log_internal;
  if (!v6)
  {
    v13 = (void *)__osLog;
    if (!__osLog) {
      v13 = (void *)&_os_log_internal;
    }
    v14 = v13;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = [(EntitlementABCIssue *)self tag];
      int v27 = 138412546;
      v28 = v15;
      __int16 v29 = 1024;
      int v30 = v3;
      _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "Entitlement issue %@ encountered temporary error %d while being reported.\n", (uint8_t *)&v27, 0x12u);
    }
    if (*MEMORY[0x263F7C0A8] == v3)
    {
      v16 = (void *)__osLog;
      if (!__osLog) {
        v16 = v7;
      }
      v17 = v16;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = [(EntitlementABCIssue *)self tag];
        int v27 = 138412290;
        v28 = v18;
        _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_INFO, "Entitlement issue %@ rescheduled for next day\n", (uint8_t *)&v27, 0xCu);
      }
      v19 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:86400.0];
      [(EntitlementABCIssue *)self setNextAction:v19];

      v20 = [(EntitlementABCIssue *)self reporter];
      [v20 rescheduleTimer];
    }
    else
    {
      if (*MEMORY[0x263F7C0D0] != v3) {
        goto LABEL_27;
      }
      v23 = (void *)__osLog;
      if (!__osLog) {
        v23 = v7;
      }
      v24 = v23;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = [(EntitlementABCIssue *)self tag];
        int v27 = 138412290;
        v28 = v25;
        _os_log_impl(&dword_21FFF3000, v24, OS_LOG_TYPE_INFO, "Entitlement issue %@ rescheduled for next hour\n", (uint8_t *)&v27, 0xCu);
      }
      v26 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:3600.0];
      [(EntitlementABCIssue *)self setNextAction:v26];

      v20 = [(EntitlementABCIssue *)self reporter];
      [v20 rescheduleTimer];
    }

    goto LABEL_27;
  }
  int v8 = *MEMORY[0x263F7C0E0];
  v9 = (void *)__osLog;
  if (!__osLog) {
    v9 = (void *)&_os_log_internal;
  }
  v10 = v9;
  objc_super v11 = v10;
  if (v8 == v3)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = [(EntitlementABCIssue *)self tag];
      int v27 = 138412290;
      v28 = v12;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_INFO, "Entitlement issue %@ successfully reported\n", (uint8_t *)&v27, 0xCu);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v21 = [(EntitlementABCIssue *)self tag];
    int v27 = 138412546;
    v28 = v21;
    __int16 v29 = 1024;
    int v30 = v3;
    _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_ERROR, "Entitlement issue %@ will not be reported due to error code %d\n", (uint8_t *)&v27, 0x12u);
  }
  [(EntitlementABCIssue *)self setNextAction:0];
  v22 = [(EntitlementABCIssue *)self reporter];
  [v22 rescheduleTimer];

  [(EntitlementABCIssue *)self setReporter:0];
LABEL_27:
  objc_sync_exit(v5);
}

- (void)report
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([(EntitlementABCIssue *)self reportCounter] < 0x1F4)
  {
    [(EntitlementABCIssue *)self setReportCounter:[(EntitlementABCIssue *)self reportCounter] + 1];
    BOOL v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:(double)(arc4random_uniform(0x258u) + 600)];
    [(EntitlementABCIssue *)self setNextAction:v6];

    if (__osLog) {
      id v7 = __osLog;
    }
    else {
      id v7 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = v7;
      v9 = [(EntitlementABCIssue *)self tag];
      v10 = [(EntitlementABCIssue *)self nextAction];
      *(_DWORD *)buf = 138412546;
      v18 = v9;
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_INFO, "Entitlement issue %@ will be reported, nextAction=%@\n", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    objc_super v11 = [(EntitlementABCIssue *)self reporter];
    v12 = [v11 biometricABC];
    unint64_t v13 = [(EntitlementABCIssue *)self abcReason];
    v14 = [(EntitlementABCIssue *)self context];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __29__EntitlementABCIssue_report__block_invoke;
    v15[3] = &unk_26454E588;
    objc_copyWeak(&v16, (id *)buf);
    [v12 sendAutoBugCaptureEvent:v13 withContext:v14 replyBlock:v15];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (__osLog) {
      uint64_t v3 = __osLog;
    }
    else {
      uint64_t v3 = &_os_log_internal;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      double v5 = [(EntitlementABCIssue *)self tag];
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_ERROR, "Giving up Entitlement issue %@ reporting due to maximum attempts limit\n", buf, 0xCu);
    }
    [(EntitlementABCIssue *)self setNextAction:0];
    [(EntitlementABCIssue *)self setReporter:0];
  }
}

void __29__EntitlementABCIssue_report__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleABCResult:a2];
}

- (void)reportIfNeeded
{
  if ([(EntitlementABCIssue *)self shouldBeReportedNow])
  {
    [(EntitlementABCIssue *)self report];
  }
}

- (NSDate)nextAction
{
  return self->_nextAction;
}

- (void)setNextAction:(id)a3
{
}

- (EntitlementABCIssueReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
}

- (unint64_t)reportCounter
{
  return self->_reportCounter;
}

- (void)setReportCounter:(unint64_t)a3
{
  self->_reportCounter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_nextAction, 0);
}

@end