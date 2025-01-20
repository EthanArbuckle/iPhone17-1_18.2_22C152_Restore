@interface AXSSRateLimitingLogger
- (AXSSRateLimitingLogger)initWithLogLevel:(unsigned __int8)a3 categoryLog:(id)a4 timeInterval:(double)a5;
- (BOOL)logString:(id)a3;
- (NSDate)_dateSinceLastLog;
- (OS_os_log)categoryLog;
- (double)timeInterval;
- (unsigned)logLevel;
- (void)_logStringAtProperLevel:(id)a3;
- (void)setCategoryLog:(id)a3;
- (void)set_dateSinceLastLog:(id)a3;
@end

@implementation AXSSRateLimitingLogger

- (AXSSRateLimitingLogger)initWithLogLevel:(unsigned __int8)a3 categoryLog:(id)a4 timeInterval:(double)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AXSSRateLimitingLogger;
  v10 = [(AXSSRateLimitingLogger *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_timeInterval = a5;
    v10->_logLevel = a3;
    objc_storeStrong((id *)&v10->_categoryLog, a4);
  }

  return v11;
}

- (BOOL)logString:(id)a3
{
  id v4 = a3;
  v5 = [(AXSSRateLimitingLogger *)self _dateSinceLastLog];

  v6 = [(AXSSRateLimitingLogger *)self _dateSinceLastLog];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F1C9C8] date];
    v8 = [(AXSSRateLimitingLogger *)self _dateSinceLastLog];
    [v7 timeIntervalSinceDate:v8];
    double v10 = v9;
    [(AXSSRateLimitingLogger *)self timeInterval];
    BOOL v12 = v10 > v11;
  }
  else
  {
    BOOL v12 = 0;
  }

  if (v5) {
    BOOL v13 = v12;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    v14 = [MEMORY[0x1E4F1C9C8] date];
    [(AXSSRateLimitingLogger *)self set_dateSinceLastLog:v14];

    [(AXSSRateLimitingLogger *)self _logStringAtProperLevel:v4];
  }

  return v13;
}

- (void)_logStringAtProperLevel:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(AXSSRateLimitingLogger *)self categoryLog];
  os_log_type_t v6 = [(AXSSRateLimitingLogger *)self logLevel];
  if (os_log_type_enabled(v5, v6))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1B3B9D000, v5, v6, "%@", (uint8_t *)&v7, 0xCu);
  }
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (unsigned)logLevel
{
  return self->_logLevel;
}

- (OS_os_log)categoryLog
{
  return self->_categoryLog;
}

- (void)setCategoryLog:(id)a3
{
}

- (NSDate)_dateSinceLastLog
{
  return self->__dateSinceLastLog;
}

- (void)set_dateSinceLastLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__dateSinceLastLog, 0);

  objc_storeStrong((id *)&self->_categoryLog, 0);
}

@end