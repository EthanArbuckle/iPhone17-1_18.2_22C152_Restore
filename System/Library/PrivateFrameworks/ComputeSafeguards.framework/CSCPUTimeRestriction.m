@interface CSCPUTimeRestriction
- (BOOL)_shouldBeFatalOnViolation;
- (BOOL)applyToProcess:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)releaseForProcess:(id)a3;
- (CSCPUTimeRestriction)initWithThreshold:(id)a3 andTimeWindow:(id)a4;
- (NSNumber)cpuThreshold;
- (NSNumber)timeWindow;
- (NSString)description;
- (unint64_t)hash;
@end

@implementation CSCPUTimeRestriction

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_cpuThreshold hash];
  return [(NSNumber *)self->_timeWindow hash] - v3 + 32 * v3 + 961;
}

- (BOOL)applyToProcess:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 currentPID];
  if (v5 == -1)
  {
    v8 = +[CSLogger defaultCategory];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CSCPUTimeRestriction applyToProcess:](v8);
    }
  }
  else
  {
    uint64_t v6 = v5;
    BOOL v7 = ([v4 exemptFromMitigations] & 1) == 0
      && [(CSCPUTimeRestriction *)self _shouldBeFatalOnViolation];
    v9 = +[CSLogger defaultCategory];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      [(CSCPUTimeRestriction *)(uint64_t)self applyToProcess:v9];
    }

    [(NSNumber *)self->_cpuThreshold floatValue];
    int v11 = v10;
    [(NSNumber *)self->_timeWindow floatValue];
    LODWORD(v13) = v12;
    LODWORD(v14) = v11;
    if (!+[CSCPUMonitorHelper setThreshold:v6 overTimeWindow:v7 forPID:v14 withFatalEffect:v13])
    {
      BOOL v15 = 1;
      goto LABEL_14;
    }
    v8 = +[CSLogger defaultCategory];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CSCPUTimeRestriction applyToProcess:](v6, v8);
    }
  }

  BOOL v15 = 0;
LABEL_14:

  return v15;
}

- (void)applyToProcess:(int)a1 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_24A698000, a2, OS_LOG_TYPE_ERROR, "Failed to apply thresholds on PID: %d", (uint8_t *)v2, 8u);
}

- (BOOL)_shouldBeFatalOnViolation
{
  return _os_feature_enabled_impl();
}

- (CSCPUTimeRestriction)initWithThreshold:(id)a3 andTimeWindow:(id)a4
{
  uint64_t v6 = (NSNumber *)a3;
  BOOL v7 = (NSNumber *)a4;
  cpuThreshold = self->_cpuThreshold;
  self->_cpuThreshold = v6;
  v9 = v6;

  timeWindow = self->_timeWindow;
  self->_timeWindow = v7;

  return self;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CSCPUTimeRestriction *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      cpuThreshold = self->_cpuThreshold;
      uint64_t v6 = [(CSCPUTimeRestriction *)v4 cpuThreshold];
      if (cpuThreshold == v6)
      {
        timeWindow = self->_timeWindow;
        v9 = [(CSCPUTimeRestriction *)v4 timeWindow];
        BOOL v7 = timeWindow == v9;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (BOOL)releaseForProcess:(id)a3
{
  return +[CSCPUMonitorHelper clearMonitorForPID:](CSCPUMonitorHelper, "clearMonitorForPID:", [a3 currentPID]) != 0;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"CSCPUTimeRestriction with cpuThreshold: %@, timeWindow: %@", self->_cpuThreshold, self->_timeWindow];
}

- (NSNumber)cpuThreshold
{
  return self->_cpuThreshold;
}

- (NSNumber)timeWindow
{
  return self->_timeWindow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeWindow, 0);
  objc_storeStrong((id *)&self->_cpuThreshold, 0);
}

- (void)applyToProcess:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = -1;
  _os_log_error_impl(&dword_24A698000, log, OS_LOG_TYPE_ERROR, "Attmpted applying thresholds on invalid PID: %d", (uint8_t *)v1, 8u);
}

- (void)applyToProcess:(os_log_t)log .cold.3(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 1024;
  int v10 = a2;
  _os_log_debug_impl(&dword_24A698000, log, OS_LOG_TYPE_DEBUG, "Configuring cpuMonitor with cpuThreshold: %@ and timeWindow:%@ for pid:%d", (uint8_t *)&v5, 0x1Cu);
}

@end