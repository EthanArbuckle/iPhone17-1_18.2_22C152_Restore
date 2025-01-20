@interface CSExtensionJobThrottle
- (CSExtensionJobThrottle)initWithDictionary:(id)a3;
- (NSMutableDictionary)countersByBundleID;
- (int64_t)nextDispatchTimeDeltaForExtension:(id)a3 job:(id)a4 memoryPressure:(BOOL)a5;
- (unint64_t)maxRetryCount;
- (unint64_t)maxSecondsBetweenRetries;
- (unint64_t)maxSecondsBetweenRetriesUnderMemoryPressure;
- (unint64_t)minSecondsBetweenRetries;
- (unint64_t)minSecondsBetweenRetriesUnderMemoryPressure;
- (void)setCountersByBundleID:(id)a3;
- (void)setMaxRetryCount:(unint64_t)a3;
- (void)setMaxSecondsBetweenRetries:(unint64_t)a3;
- (void)setMaxSecondsBetweenRetriesUnderMemoryPressure:(unint64_t)a3;
- (void)setMinSecondsBetweenRetries:(unint64_t)a3;
- (void)setMinSecondsBetweenRetriesUnderMemoryPressure:(unint64_t)a3;
@end

@implementation CSExtensionJobThrottle

- (CSExtensionJobThrottle)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSExtensionJobThrottle;
  v5 = [(CSExtensionJobThrottle *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"maxRetryCount"];
    v5->_maxRetryCount = [v6 unsignedIntegerValue];

    v7 = [v4 objectForKeyedSubscript:@"minSecondsBetweenRetries"];
    v5->_minSecondsBetweenRetries = [v7 unsignedIntegerValue];

    v8 = [v4 objectForKeyedSubscript:@"maxSecondsBetweenRetries"];
    v5->_maxSecondsBetweenRetries = [v8 unsignedIntegerValue];

    v9 = [v4 objectForKeyedSubscript:@"minSecondsBetweenRetriesUnderMemoryPressure"];
    v5->_minSecondsBetweenRetriesUnderMemoryPressure = [v9 unsignedIntegerValue];

    v10 = [v4 objectForKeyedSubscript:@"maxSecondsBetweenRetriesUnderMemoryPressure"];
    v5->_maxSecondsBetweenRetriesUnderMemoryPressure = [v10 unsignedIntegerValue];

    if (v5->_minSecondsBetweenRetries > v5->_maxSecondsBetweenRetries) {
      -[CSExtensionJobThrottle initWithDictionary:]();
    }
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    countersByBundleID = v5->_countersByBundleID;
    v5->_countersByBundleID = v11;
  }
  return v5;
}

- (int64_t)nextDispatchTimeDeltaForExtension:(id)a3 job:(id)a4 memoryPressure:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 containerID];
  v11 = (void *)v10;
  int64_t v12 = 0x8000000000000000;
  if (v9 && v10)
  {
    v13 = self;
    objc_sync_enter(v13);
    objc_super v14 = [(CSExtensionJobThrottle *)v13 countersByBundleID];
    v15 = [v14 objectForKeyedSubscript:v11];

    unint64_t v16 = [v15 unsignedIntegerValue];
    unint64_t v17 = v16 + 1;
    v18 = [NSNumber numberWithUnsignedInteger:v16 + 1];
    v19 = [(CSExtensionJobThrottle *)v13 countersByBundleID];
    [v19 setObject:v18 forKeyedSubscript:v11];

    objc_sync_exit(v13);
    if (v5)
    {
      unint64_t v20 = [(CSExtensionJobThrottle *)v13 minSecondsBetweenRetriesUnderMemoryPressure];
      uint64_t v21 = [(CSExtensionJobThrottle *)v13 maxSecondsBetweenRetriesUnderMemoryPressure];
    }
    else
    {
      unint64_t v20 = [(CSExtensionJobThrottle *)v13 minSecondsBetweenRetries];
      uint64_t v21 = [(CSExtensionJobThrottle *)v13 maxSecondsBetweenRetries];
    }
    unint64_t v22 = v21;
    if (v16
      && (v16 >= [(CSExtensionJobThrottle *)v13 maxRetryCount] || v22 >= 0x7FFFFFFFFFFFFFFFLL / v16))
    {
      int64_t v12 = 0x8000000000000000;
    }
    else
    {
      uint64_t v23 = v22 * v16;
      if (0x7FFFFFFFFFFFFFFFuLL >> v16 > v20 && v16 < 0x3F) {
        uint64_t v23 = v20 << v16;
      }
      if (v22 < v23) {
        uint64_t v23 = v22;
      }
      if (v23 <= 1) {
        uint64_t v25 = 1;
      }
      else {
        uint64_t v25 = v23;
      }
      uint64_t v26 = 1000000000 * v25;
      if ((unint64_t)v23 <= 0x225C17D03) {
        int64_t v12 = v26;
      }
      else {
        int64_t v12 = 0x8000000000000000;
      }
    }
    v27 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = [(CSExtensionJobThrottle *)v13 maxRetryCount];
      int v32 = 138414082;
      id v33 = v9;
      unint64_t v30 = v12 / 0x3B9ACA00uLL;
      __int16 v34 = 2112;
      v35 = v11;
      v31 = @"NO";
      if (v12 < 0) {
        unint64_t v30 = -1;
      }
      unint64_t v37 = v17;
      __int16 v36 = 2048;
      __int16 v38 = 2048;
      if (v5) {
        v31 = @"YES";
      }
      uint64_t v39 = v29;
      __int16 v40 = 2048;
      unint64_t v41 = v30;
      __int16 v42 = 2048;
      unint64_t v43 = v20;
      __int16 v44 = 2048;
      unint64_t v45 = v22;
      __int16 v46 = 2112;
      v47 = v31;
      _os_log_debug_impl(&dword_18D0E3000, v27, OS_LOG_TYPE_DEBUG, "job:%@, bundleID:%@, retry:%ld/max:%ld, backoff:%llds/min:%lds/max:%lds, memoryPressure:%@", (uint8_t *)&v32, 0x52u);
    }
  }
  return v12;
}

- (unint64_t)maxRetryCount
{
  return self->_maxRetryCount;
}

- (void)setMaxRetryCount:(unint64_t)a3
{
  self->_maxRetryCount = a3;
}

- (unint64_t)minSecondsBetweenRetries
{
  return self->_minSecondsBetweenRetries;
}

- (void)setMinSecondsBetweenRetries:(unint64_t)a3
{
  self->_minSecondsBetweenRetries = a3;
}

- (unint64_t)maxSecondsBetweenRetries
{
  return self->_maxSecondsBetweenRetries;
}

- (void)setMaxSecondsBetweenRetries:(unint64_t)a3
{
  self->_maxSecondsBetweenRetries = a3;
}

- (unint64_t)minSecondsBetweenRetriesUnderMemoryPressure
{
  return self->_minSecondsBetweenRetriesUnderMemoryPressure;
}

- (void)setMinSecondsBetweenRetriesUnderMemoryPressure:(unint64_t)a3
{
  self->_minSecondsBetweenRetriesUnderMemoryPressure = a3;
}

- (unint64_t)maxSecondsBetweenRetriesUnderMemoryPressure
{
  return self->_maxSecondsBetweenRetriesUnderMemoryPressure;
}

- (void)setMaxSecondsBetweenRetriesUnderMemoryPressure:(unint64_t)a3
{
  self->_maxSecondsBetweenRetriesUnderMemoryPressure = a3;
}

- (NSMutableDictionary)countersByBundleID
{
  return self->_countersByBundleID;
}

- (void)setCountersByBundleID:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithDictionary:.cold.1()
{
  __assert_rtn("-[CSExtensionJobThrottle initWithDictionary:]", "CSExtensionJobThrottle.m", 35, "_minSecondsBetweenRetries <= _maxSecondsBetweenRetries");
}

@end