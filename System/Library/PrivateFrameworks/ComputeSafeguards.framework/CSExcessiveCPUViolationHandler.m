@interface CSExcessiveCPUViolationHandler
+ (id)sharedInstance;
- (OS_dispatch_queue)queue;
- (OS_os_log)logger;
- (id)_init;
- (void)handleViolationByProcess:(id)a3 pid:(unint64_t)a4 path:(id)a5 endTime:(mach_timespec)a6 observedValue:(int64_t)a7 observationWindow:(int64_t)a8 limitValue:(int64_t)a9 limitWindow:(int64_t)a10 fatal:(BOOL)a11;
- (void)logCPUViolationToPowerLogWithPayload:(id)a3;
- (void)setLogger:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation CSExcessiveCPUViolationHandler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance__sharedInstance;
  return v2;
}

uint64_t __48__CSExcessiveCPUViolationHandler_sharedInstance__block_invoke()
{
  sharedInstance__sharedInstance = [[CSExcessiveCPUViolationHandler alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)CSExcessiveCPUViolationHandler;
  v2 = [(CSExcessiveCPUViolationHandler *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[CSLogger logForCategory:@"CSExcessiveCPUViolationHandler"];
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.computesafeguards.excessivecpuhandler", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = v2;
  }

  return v2;
}

- (void)handleViolationByProcess:(id)a3 pid:(unint64_t)a4 path:(id)a5 endTime:(mach_timespec)a6 observedValue:(int64_t)a7 observationWindow:(int64_t)a8 limitValue:(int64_t)a9 limitWindow:(int64_t)a10 fatal:(BOOL)a11
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a5;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    v19 = (const char *)&unk_24A6A4E42;
    if (a11) {
      v19 = "(FATAL) ";
    }
    *(_DWORD *)buf = 136317186;
    v41 = v19;
    __int16 v42 = 2112;
    id v43 = v16;
    __int16 v46 = 2112;
    __int16 v52 = 1024;
    __int16 v44 = 2048;
    unint64_t v45 = a4;
    id v47 = v17;
    __int16 v48 = 2048;
    double v49 = (double)a7 / 1000000000.0;
    __int16 v50 = 2048;
    double v51 = (double)a8 / 1000000000.0;
    int v53 = 100 * a7 / a8;
    __int16 v54 = 2048;
    double v55 = (double)a9 / 1000000000.0;
    __int16 v56 = 2048;
    unint64_t v57 = a10 / 0x3B9ACA00uLL;
    _os_log_impl(&dword_24A698000, logger, OS_LOG_TYPE_INFO, "Received %sCPU violation: %@[%llu] (%@) used %.2fs of CPU over %.2f seconds (averaging %d%%), violating a CPU usage limit of %.2fs over %lld seconds.", buf, 0x58u);
  }
  if (v16)
  {
    v20 = +[CSProcessManager sharedInstanceWithEnrolledProcesses:0 andExemptions:0];
    v21 = [v20 identiferForPID:a4];

    if (v21)
    {
      id v36 = v17;
      unsigned int tv_sec = a6.tv_sec;
      v23 = +[CSRestrictionManager sharedInstanceWithDataProvider:0];
      v24 = [v23 determineScenarioForProcess:v21];

      if (!v24)
      {
        v25 = self->_logger;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          -[CSExcessiveCPUViolationHandler handleViolationByProcess:pid:path:endTime:observedValue:observationWindow:limitValue:limitWindow:fatal:](v25);
        }
        v24 = @"Unknown";
        unsigned int tv_sec = a6.tv_sec;
      }
      v38[0] = @"ProcessName";
      v38[1] = @"ScenarioIdentifier";
      v39[0] = v16;
      v39[1] = v24;
      v38[2] = @"timestampEnd";
      v26 = [NSNumber numberWithDouble:(double)tv_sec + (double)a6.tv_nsec * 0.000000001];
      v39[2] = v26;
      v38[3] = @"ThresholdCPUUsage";
      v27 = [NSNumber numberWithUnsignedLongLong:a9 / 0x3B9ACA00uLL];
      v39[3] = v27;
      v38[4] = @"TimeWndowSize";
      v28 = [NSNumber numberWithUnsignedLongLong:a10 / 0x3B9ACA00uLL];
      v39[4] = v28;
      v38[5] = @"ObservedCPUUsage";
      v29 = [NSNumber numberWithDouble:(double)a7 / 1000000000.0];
      v39[5] = v29;
      v38[6] = @"ObservedCPUUsageDuration";
      uint64_t v30 = [NSNumber numberWithDouble:(double)a8 / 1000000000.0];
      v31 = (void *)v30;
      v38[7] = @"Mitigation";
      v32 = &unk_26FE31010;
      if (a11) {
        v32 = &unk_26FE30FF8;
      }
      v39[6] = v30;
      v39[7] = v32;
      v33 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:8];

      [(CSExcessiveCPUViolationHandler *)self logCPUViolationToPowerLogWithPayload:v33];
      id v17 = v36;
    }
    else
    {
      v35 = self->_logger;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        -[CSExcessiveCPUViolationHandler handleViolationByProcess:pid:path:endTime:observedValue:observationWindow:limitValue:limitWindow:fatal:](v35);
      }
    }
  }
  else
  {
    v34 = self->_logger;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
      -[CSExcessiveCPUViolationHandler handleViolationByProcess:pid:path:endTime:observedValue:observationWindow:limitValue:limitWindow:fatal:](v34);
    }
  }
}

- (void)logCPUViolationToPowerLogWithPayload:(id)a3
{
  id v3 = a3;
  if (logCPUViolationToPowerLogWithPayload__onceToken != -1) {
    dispatch_once(&logCPUViolationToPowerLogWithPayload__onceToken, &__block_literal_global_41);
  }
  uint64_t v4 = logCPUViolationToPowerLogWithPayload__streamID;
  id v5 = v3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  dispatch_queue_t v6 = (void (*)(uint64_t, id))getPPSSendTelemetrySymbolLoc_ptr;
  v13 = getPPSSendTelemetrySymbolLoc_ptr;
  if (!getPPSSendTelemetrySymbolLoc_ptr)
  {
    v7 = (void *)PowerLogLibrary();
    v11[3] = (uint64_t)dlsym(v7, "PPSSendTelemetry");
    getPPSSendTelemetrySymbolLoc_ptr = (_UNKNOWN *)v11[3];
    dispatch_queue_t v6 = (void (*)(uint64_t, id))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v6)
  {
    -[CSExcessiveCPUViolationHandler logCPUViolationToPowerLogWithPayload:]();
    v9 = v8;
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v9);
  }
  v6(v4, v5);
}

uint64_t __71__CSExcessiveCPUViolationHandler_logCPUViolationToPowerLogWithPayload___block_invoke()
{
  uint64_t v5 = 0;
  dispatch_queue_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (uint64_t (*)(__CFString *, __CFString *))getPPSCreateTelemetryIdentifierSymbolLoc_ptr;
  v8 = getPPSCreateTelemetryIdentifierSymbolLoc_ptr;
  if (!getPPSCreateTelemetryIdentifierSymbolLoc_ptr)
  {
    v1 = (void *)PowerLogLibrary();
    v6[3] = (uint64_t)dlsym(v1, "PPSCreateTelemetryIdentifier");
    getPPSCreateTelemetryIdentifierSymbolLoc_ptr = (_UNKNOWN *)v6[3];
    v0 = (uint64_t (*)(__CFString *, __CFString *))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    -[CSExcessiveCPUViolationHandler logCPUViolationToPowerLogWithPayload:]();
    uint64_t v4 = v3;
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  uint64_t result = v0(@"XPCMetrics", @"CPUViolations");
  logCPUViolationToPowerLogWithPayload__streamID = result;
  return result;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)handleViolationByProcess:(os_log_t)log pid:path:endTime:observedValue:observationWindow:limitValue:limitWindow:fatal:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_24A698000, log, OS_LOG_TYPE_FAULT, "No procName to use for logging violation.", v1, 2u);
}

- (void)handleViolationByProcess:(os_log_t)log pid:path:endTime:observedValue:observationWindow:limitValue:limitWindow:fatal:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24A698000, log, OS_LOG_TYPE_DEBUG, "ProcessIdentifier lookup failed. Ignoring report since this process isn't tracked by the system.", v1, 2u);
}

- (void)handleViolationByProcess:(os_log_t)log pid:path:endTime:observedValue:observationWindow:limitValue:limitWindow:fatal:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24A698000, log, OS_LOG_TYPE_DEBUG, "No scenarioName to use, logging empty scenario name for violation.", v1, 2u);
}

- (void)logCPUViolationToPowerLogWithPayload:.cold.1()
{
}

@end