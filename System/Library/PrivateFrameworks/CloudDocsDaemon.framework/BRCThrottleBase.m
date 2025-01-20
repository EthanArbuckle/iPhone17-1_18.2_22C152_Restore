@interface BRCThrottleBase
- (BRCThrottleBase)initWithName:(id)a3 andParameters:(id)a4;
- (NSString)name;
- (id)_initWithName:(id)a3;
- (int64_t)nsecsBeforeForgettingCounter;
- (int64_t)nsecsToNextRetry:(int64_t)a3 retryCount:(unsigned int *)a4 now:(int64_t)a5;
- (int64_t)retryBackoff:(unsigned int)a3;
@end

@implementation BRCThrottleBase

- (id)_initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCThrottleBase;
  v6 = [(BRCThrottleBase *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

- (BRCThrottleBase)initWithName:(id)a3 andParameters:(id)a4
{
  id v6 = a4;
  v7 = [(BRCThrottleBase *)self _initWithName:a3];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"start-after"];
    v7->_initialRetryCount = [v8 intValue];

    objc_super v9 = [v6 objectForKeyedSubscript:@"give-up-after"];
    v7->_finalRetryCount = [v9 intValue];

    v10 = [v6 objectForKeyedSubscript:@"wait-at-least"];
    [v10 doubleValue];
    v7->_uint64_t minimumNsecsBetweenRetries = brc_interval_to_nsec();

    v11 = [v6 objectForKeyedSubscript:@"wait-at-most"];
    [v11 doubleValue];
    v7->_uint64_t maximumNsecsBetweenRetries = brc_interval_to_nsec();

    v12 = [v6 objectForKeyedSubscript:@"forget-after"];
    [v12 doubleValue];
    v7->_nsecsBeforeForgettingCounter = brc_interval_to_nsec();

    v13 = [v6 objectForKeyedSubscript:@"max-elemnt-count"];
    v7->_maximumElementCount = [v13 unsignedIntValue];

    if (!v7->_maximumElementCount) {
      v7->_maximumElementCount = 0x7FFFFFFF;
    }
    if (v7->_initialRetryCount > v7->_finalRetryCount)
    {
      v17 = brc_bread_crumbs();
      v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        -[BRCThrottleBase initWithName:andParameters:].cold.5();
      }
    }
    uint64_t minimumNsecsBetweenRetries = v7->_minimumNsecsBetweenRetries;
    if (minimumNsecsBetweenRetries > v7->_maximumNsecsBetweenRetries)
    {
      v19 = brc_bread_crumbs();
      v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        -[BRCThrottleBase initWithName:andParameters:].cold.4();
      }

      uint64_t minimumNsecsBetweenRetries = v7->_minimumNsecsBetweenRetries;
    }
    if (minimumNsecsBetweenRetries <= 0)
    {
      v21 = brc_bread_crumbs();
      v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        -[BRCThrottleBase initWithName:andParameters:]();
      }
    }
    uint64_t maximumNsecsBetweenRetries = v7->_maximumNsecsBetweenRetries;
    if (maximumNsecsBetweenRetries <= 0)
    {
      v23 = brc_bread_crumbs();
      v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        -[BRCThrottleBase initWithName:andParameters:]();
      }

      uint64_t maximumNsecsBetweenRetries = v7->_maximumNsecsBetweenRetries;
    }
    if (v7->_nsecsBeforeForgettingCounter < maximumNsecsBetweenRetries)
    {
      v25 = brc_bread_crumbs();
      v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        -[BRCThrottleBase initWithName:andParameters:]();
      }
    }
  }

  return v7;
}

- (int64_t)retryBackoff:(unsigned int)a3
{
  int64_t result = 0;
  unint64_t minimumNsecsBetweenRetries = self->_minimumNsecsBetweenRetries;
  if (minimumNsecsBetweenRetries)
  {
    unsigned int v6 = a3 - self->_initialRetryCount;
    if ((v6 & 0x80000000) == 0)
    {
      int64_t result = self->_maximumNsecsBetweenRetries;
      if (v6 < __clz(minimumNsecsBetweenRetries) && result >= (uint64_t)(minimumNsecsBetweenRetries << v6)) {
        return minimumNsecsBetweenRetries << v6;
      }
    }
  }
  return result;
}

- (int64_t)nsecsToNextRetry:(int64_t)a3 retryCount:(unsigned int *)a4 now:(int64_t)a5
{
  int64_t maximumNsecsBetweenRetries = self->_maximumNsecsBetweenRetries;
  unsigned int v10 = *a4;
  int64_t v11 = [(BRCThrottleBase *)self retryBackoff:*a4];
  int64_t v12 = a5 - a3;
  if (a5 >= a3)
  {
    if (v10) {
      BOOL v16 = v12 < self->_nsecsBeforeForgettingCounter;
    }
    else {
      BOOL v16 = 1;
    }
    if (v16)
    {
      if (v10 <= self->_initialRetryCount || v11 <= v12)
      {
        if (v10 >= self->_finalRetryCount) {
          return 0x7FFFFFFFFFFFFFFFLL;
        }
        int64_t v21 = 0;
        *a4 = v10 + 1;
      }
      else
      {
        int64_t v21 = v11 - v12;
      }
      if (v21 >= maximumNsecsBetweenRetries) {
        int64_t v21 = maximumNsecsBetweenRetries;
      }
      if (v21 >= 10000000) {
        return v21;
      }
      else {
        return 0;
      }
    }
    else
    {
      v18 = brc_bread_crumbs();
      v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[BRCThrottleBase nsecsToNextRetry:retryCount:now:]();
      }

      int64_t result = 0;
      *a4 = 1;
    }
  }
  else
  {
    v13 = brc_bread_crumbs();
    v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[BRCThrottleBase nsecsToNextRetry:retryCount:now:]();
    }

    return a3 - a5;
  }
  return result;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)nsecsBeforeForgettingCounter
{
  return self->_nsecsBeforeForgettingCounter;
}

- (void).cxx_destruct
{
}

- (void)initWithName:andParameters:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _nsecsBeforeForgettingCounter >= _maximumNsecsBetweenRetries%@", v2, v3, v4, v5, v6);
}

- (void)initWithName:andParameters:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _maximumNsecsBetweenRetries > 0%@", v2, v3, v4, v5, v6);
}

- (void)initWithName:andParameters:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _minimumNsecsBetweenRetries > 0%@", v2, v3, v4, v5, v6);
}

- (void)initWithName:andParameters:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _minimumNsecsBetweenRetries <= _maximumNsecsBetweenRetries%@", v2, v3, v4, v5, v6);
}

- (void)initWithName:andParameters:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _initialRetryCount <= _finalRetryCount%@", v2, v3, v4, v5, v6);
}

- (void)nsecsToNextRetry:retryCount:now:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] We haven't finished the previous throttle%@", v1, 0xCu);
}

- (void)nsecsToNextRetry:retryCount:now:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Forgetting retry counter%@", v1, 0xCu);
}

@end