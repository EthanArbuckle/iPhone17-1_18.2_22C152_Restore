@interface CalABCReporter
- (BOOL)ignoreRateLimiting;
- (BOOL)rateLimitingAllowsABCReport;
- (CalABCReporter)initWithType:(id)a3 subtype:(id)a4 context:(id)a5;
- (NSArray)events;
- (NSString)domain;
- (NSString)subtype;
- (NSString)subtypeContext;
- (NSString)type;
- (void)report;
- (void)report:(BOOL)a3;
- (void)reportSynchronous;
- (void)setEvents:(id)a3;
- (void)setIgnoreRateLimiting:(BOOL)a3;
- (void)setSubtype:(id)a3;
- (void)setSubtypeContext:(id)a3;
- (void)setType:(id)a3;
@end

@implementation CalABCReporter

- (CalABCReporter)initWithType:(id)a3 subtype:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CalABCReporter;
  v11 = [(CalABCReporter *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(CalABCReporter *)v11 setType:v8];
    [(CalABCReporter *)v12 setSubtype:v9];
    [(CalABCReporter *)v12 setSubtypeContext:v10];
  }

  return v12;
}

- (NSString)domain
{
  return (NSString *)@"Calendar";
}

- (void)report
{
}

- (void)reportSynchronous
{
}

- (void)report:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CalABCReporter *)self rateLimitingAllowsABCReport])
  {
    v5 = objc_alloc_init(MEMORY[0x1E4FA8AF0]);
    v6 = [(CalABCReporter *)self domain];
    v7 = [(CalABCReporter *)self type];
    id v8 = [(CalABCReporter *)self subtype];
    id v9 = [(CalABCReporter *)self subtypeContext];
    id v10 = [MEMORY[0x1E4F28F80] processInfo];
    v11 = [v10 processName];
    v12 = [v5 signatureWithDomain:v6 type:v7 subType:v8 subtypeContext:v9 detectedProcess:v11 triggerThresholdValues:0];

    v13 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[CalABCReporter report:](self, v13);
    }

    dispatch_semaphore_t v14 = 0;
    if (v3) {
      dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    }
    events = self->_events;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __25__CalABCReporter_report___block_invoke;
    v18[3] = &unk_1E56CD938;
    BOOL v20 = v3;
    v16 = v14;
    v19 = v16;
    [v5 snapshotWithSignature:v12 delay:events events:0 payload:0 actions:v18 reply:0.0];
    if (v3)
    {
      dispatch_time_t v17 = dispatch_time(0, 900000000000);
      dispatch_semaphore_wait(v16, v17);
    }
  }
  else
  {
    v5 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CalABCReporter report:](self, v5);
    }
  }
}

void __25__CalABCReporter_report___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __25__CalABCReporter_report___block_invoke_cold_1((uint64_t)v3, v4);
  }

  if (*(unsigned char *)(a1 + 40)) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

- (BOOL)rateLimitingAllowsABCReport
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3;
  os_unfair_lock_lock((os_unfair_lock_t)&rateLimitingAllowsABCReport_lock);
  if (*(double *)&rateLimitingAllowsABCReport_lastABCReportTime == 0.0
    || self->_ignoreRateLimiting
    || v4 - *(double *)&rateLimitingAllowsABCReport_lastABCReportTime > 86400.0)
  {
    rateLimitingAllowsABCReport_lastABCReportTime = *(void *)&v4;
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&rateLimitingAllowsABCReport_lock);
  return v5;
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (BOOL)ignoreRateLimiting
{
  return self->_ignoreRateLimiting;
}

- (void)setIgnoreRateLimiting:(BOOL)a3
{
  self->_ignoreRateLimiting = a3;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(id)a3
{
}

- (NSString)subtypeContext
{
  return self->_subtypeContext;
}

- (void)setSubtypeContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtypeContext, 0);
  objc_storeStrong((id *)&self->_subtype, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_events, 0);
}

- (void)report:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v4 = [a1 domain];
  BOOL v5 = [a1 type];
  v6 = [a1 subtype];
  v7 = [a1 subtypeContext];
  OUTLINED_FUNCTION_0();
  v11 = v5;
  __int16 v12 = v8;
  v13 = v6;
  __int16 v14 = v8;
  uint64_t v15 = v9;
  _os_log_debug_impl(&dword_190D88000, a2, OS_LOG_TYPE_DEBUG, "Submitting snapshot request to ABC for signature: %@.%@.%@.%@", v10, 0x2Au);
}

- (void)report:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v4 = [a1 domain];
  BOOL v5 = [a1 type];
  v6 = [a1 subtype];
  v7 = [a1 subtypeContext];
  __int16 v8 = [a1 events];
  OUTLINED_FUNCTION_0();
  __int16 v12 = v5;
  __int16 v13 = v9;
  __int16 v14 = v6;
  __int16 v15 = v9;
  uint64_t v16 = v7;
  __int16 v17 = v9;
  uint64_t v18 = v10;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "Not reporting to ABC because we are rate limited: %@.%@.%@.%@ - %@", v11, 0x34u);
}

void __25__CalABCReporter_report___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_190D88000, a2, OS_LOG_TYPE_DEBUG, "Submitted diagnostic reporter snapshot request with reply: %@", (uint8_t *)&v2, 0xCu);
}

@end