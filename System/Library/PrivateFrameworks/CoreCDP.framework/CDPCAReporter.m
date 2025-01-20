@interface CDPCAReporter
- (CDPCAReporter)initWithEvent:(id)a3;
- (double)machAbsoluteTimeToTimeInterval:(unint64_t)a3;
- (id)__eventNameForTesting;
- (id)debugDescription;
- (id)objectForKeyedSubscript:(id)a3;
- (void)_sendEvent;
- (void)populateUnderlyingErrorsStartingWithRootError:(id)a3 maxDepth:(unsigned int)a4;
- (void)populateUnderlyingErrorsStartingWithRootError:(id)a3 maxDepth:(unsigned int)a4 domainAllowlist:(id)a5;
- (void)populateUnderlyingErrorsStartingWithRootError:(id)a3 maxDepth:(unsigned int)a4 topLevelErrorCodeKey:(id)a5 topLevelErrorDomainKey:(id)a6 errorCodePrefix:(id)a7 errorDomainPrefix:(id)a8 domainAllowlist:(id)a9;
- (void)sendReport;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation CDPCAReporter

- (CDPCAReporter)initWithEvent:(id)a3
{
  id v5 = a3;
  if (getenv("__OSINSTALL_ENVIRONMENT") || getenv("__AKSYNCBUBBLE"))
  {
    v6 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CDPCAReporter;
    v8 = [(CDPCAReporter *)&v12 init];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_eventName, a3);
      uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
      reportData = v9->_reportData;
      v9->_reportData = (NSMutableDictionary *)v10;

      mach_timebase_info(&v9->_clock_timebase);
      v9->_initTime = mach_absolute_time();
    }
    self = v9;
    v6 = self;
  }

  return v6;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_reportData objectForKeyedSubscript:a3];
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
}

- (void)sendReport
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2048;
  double v8 = a3;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  _os_log_debug_impl(&dword_2182AE000, a2, OS_LOG_TYPE_DEBUG, "Sending report %@ (time: %f), data - %@", (uint8_t *)&v5, 0x20u);
}

- (void)_sendEvent
{
  if (MEMORY[0x263F34210]) {
    AnalyticsSendEvent();
  }
}

- (void)populateUnderlyingErrorsStartingWithRootError:(id)a3 maxDepth:(unsigned int)a4
{
}

- (void)populateUnderlyingErrorsStartingWithRootError:(id)a3 maxDepth:(unsigned int)a4 domainAllowlist:(id)a5
{
}

- (void)populateUnderlyingErrorsStartingWithRootError:(id)a3 maxDepth:(unsigned int)a4 topLevelErrorCodeKey:(id)a5 topLevelErrorDomainKey:(id)a6 errorCodePrefix:(id)a7 errorDomainPrefix:(id)a8 domainAllowlist:(id)a9
{
  id v37 = a3;
  id v15 = a5;
  id v16 = a6;
  id v40 = a7;
  id v39 = a8;
  id v17 = a9;
  v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v37, "code"));
  [(CDPCAReporter *)self setObject:v18 forKeyedSubscript:v15];

  v19 = [v37 domain];
  [(CDPCAReporter *)self setObject:v19 forKeyedSubscript:v16];

  v20 = [v37 userInfo];
  uint64_t v21 = *MEMORY[0x263F08608];
  v22 = [v20 objectForKeyedSubscript:*MEMORY[0x263F08608]];

  if (v22) {
    BOOL v23 = a4 == 0;
  }
  else {
    BOOL v23 = 1;
  }
  v35 = v16;
  v36 = v15;
  if (!v23)
  {
    uint64_t v38 = v21;
    unsigned int v25 = 2;
    while (1)
    {
      v26 = [NSString stringWithFormat:@"%@%u", v40, v25 - 1, v35, v36];
      v27 = [NSString stringWithFormat:@"%@%u", v39, v25 - 1];
      v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v22, "code"));
      [(CDPCAReporter *)self setObject:v28 forKeyedSubscript:v26];

      v29 = [v22 domain];
      if (v17)
      {
        if ([v17 containsObject:v29])
        {
          v30 = [v22 domain];
          [(CDPCAReporter *)self setObject:v30 forKeyedSubscript:v27];

          goto LABEL_13;
        }
        v31 = self;
        v32 = @"errorDomainNotInAllowlist";
      }
      else
      {
        v31 = self;
        v32 = v29;
      }
      [(CDPCAReporter *)v31 setObject:v32 forKeyedSubscript:v27];
LABEL_13:

      v33 = [v22 userInfo];
      v24 = [v33 objectForKeyedSubscript:v38];

      if (v24)
      {
        v22 = v24;
        if (v25++ <= a4) {
          continue;
        }
      }
      goto LABEL_16;
    }
  }
  v24 = v22;
LABEL_16:
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"<%@: %p> EventName: [%@], ReportData: %@", objc_opt_class(), self, self->_eventName, self->_reportData];
}

- (double)machAbsoluteTimeToTimeInterval:(unint64_t)a3
{
  return (double)(self->_clock_timebase.numer * a3 / self->_clock_timebase.denom) / 1000000000.0;
}

- (id)__eventNameForTesting
{
  return self->_eventName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportData, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end