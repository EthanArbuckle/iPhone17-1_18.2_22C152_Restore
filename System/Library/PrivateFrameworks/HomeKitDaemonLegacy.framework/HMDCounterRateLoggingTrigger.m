@interface HMDCounterRateLoggingTrigger
- (BOOL)uploadImmediately;
- (HMDCounterRateLoggingTrigger)initWithThreshold:(int64_t)a3 windowSize:(int64_t)a4 counterName:(id)a5 ewsLogger:(id)a6;
- (HMDCounterRateLoggingTrigger)initWithThreshold:(int64_t)a3 windowSize:(int64_t)a4 counterName:(id)a5 uploadImmediately:(BOOL)a6 ewsLogger:(id)a7;
- (HMDCounterRateLoggingTrigger)initWithThreshold:(int64_t)a3 windowSize:(int64_t)a4 counterName:(id)a5 uploadImmediately:(BOOL)a6 ewsLogger:(id)a7 timeSourceBlock:(id)a8;
- (HMDEWSLogging)ewsLogger;
- (NSString)counterName;
- (id)timeSourceBlock;
- (int64_t)intervalSize;
- (int64_t)windowSize;
- (int64_t)windowThreshold;
- (unint64_t)intervalCounts;
- (unint64_t)lastUpdatedInterval;
- (unint64_t)maxWindowCount;
- (unint64_t)windowCount;
- (void)dealloc;
- (void)logRateTrigger:(id)a3 triggerValue:(unint64_t)a4;
- (void)setIntervalCounts:(unint64_t *)a3;
- (void)setLastUpdatedInterval:(unint64_t)a3;
- (void)setMaxWindowCount:(unint64_t)a3;
- (void)setWindowCount:(unint64_t)a3;
- (void)updatedCounter:(id)a3 fromOldValue:(int64_t)a4 toNewValue:(int64_t)a5;
@end

@implementation HMDCounterRateLoggingTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ewsLogger, 0);
  objc_storeStrong(&self->_timeSourceBlock, 0);
  objc_storeStrong((id *)&self->_counterName, 0);
}

- (void)setLastUpdatedInterval:(unint64_t)a3
{
  self->_lastUpdatedInterval = a3;
}

- (unint64_t)lastUpdatedInterval
{
  return self->_lastUpdatedInterval;
}

- (void)setMaxWindowCount:(unint64_t)a3
{
  self->_maxWindowCount = a3;
}

- (unint64_t)maxWindowCount
{
  return self->_maxWindowCount;
}

- (void)setWindowCount:(unint64_t)a3
{
  self->_windowCount = a3;
}

- (unint64_t)windowCount
{
  return self->_windowCount;
}

- (void)setIntervalCounts:(unint64_t *)a3
{
  self->_intervalCounts = a3;
}

- (unint64_t)intervalCounts
{
  return self->_intervalCounts;
}

- (int64_t)intervalSize
{
  return self->_intervalSize;
}

- (HMDEWSLogging)ewsLogger
{
  return self->_ewsLogger;
}

- (id)timeSourceBlock
{
  return self->_timeSourceBlock;
}

- (BOOL)uploadImmediately
{
  return self->_uploadImmediately;
}

- (NSString)counterName
{
  return self->_counterName;
}

- (int64_t)windowThreshold
{
  return self->_windowThreshold;
}

- (int64_t)windowSize
{
  return self->_windowSize;
}

- (void)logRateTrigger:(id)a3 triggerValue:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1D9452090]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    v11 = [(HMDCounterRateLoggingTrigger *)v8 counterName];
    *(_DWORD *)buf = 138544386;
    v21 = v10;
    __int16 v22 = 2114;
    id v23 = v6;
    __int16 v24 = 2114;
    v25 = v11;
    __int16 v26 = 2048;
    unint64_t v27 = a4;
    __int16 v28 = 2048;
    uint64_t v29 = [(HMDCounterRateLoggingTrigger *)v8 windowSize];
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@EWS rate trigger: trigger=%{public}@, counter=%{public}@, value=%lu, windowSize=%lu", buf, 0x34u);
  }
  v12 = [(HMDCounterRateLoggingTrigger *)v8 ewsLogger];
  uint64_t v13 = [(HMDCounterRateLoggingTrigger *)v8 uploadImmediately];
  v14 = [(HMDCounterRateLoggingTrigger *)v8 counterName];
  v19[0] = v14;
  v18[1] = @"value";
  v15 = [NSNumber numberWithUnsignedInteger:a4];
  v19[1] = v15;
  v18[2] = @"windowSize";
  v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDCounterRateLoggingTrigger windowSize](v8, "windowSize"));
  v19[2] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  [v12 submitEventWithName:v6 serviceName:@"Counter Trigger" uploadImmediately:v13 payload:v17];
}

- (void)updatedCounter:(id)a3 fromOldValue:(int64_t)a4 toNewValue:(int64_t)a5
{
  unint64_t v8 = [(HMDCounterRateLoggingTrigger *)self windowCount];
  v9 = [(HMDCounterRateLoggingTrigger *)self timeSourceBlock];
  unint64_t v10 = v9[2]();
  unint64_t v11 = v10 / [(HMDCounterRateLoggingTrigger *)self intervalSize];

  if (v11 - [(HMDCounterRateLoggingTrigger *)self lastUpdatedInterval] < 0xA)
  {
    for (;
          [(HMDCounterRateLoggingTrigger *)self lastUpdatedInterval] < v11;
          v13[[(HMDCounterRateLoggingTrigger *)self lastUpdatedInterval] % 0xA] = 0)
    {
      [(HMDCounterRateLoggingTrigger *)self setLastUpdatedInterval:[(HMDCounterRateLoggingTrigger *)self lastUpdatedInterval] + 1];
      [(HMDCounterRateLoggingTrigger *)self setWindowCount:[(HMDCounterRateLoggingTrigger *)self windowCount]- [(HMDCounterRateLoggingTrigger *)self intervalCounts][8* ([(HMDCounterRateLoggingTrigger *)self lastUpdatedInterval]% 0xA)]];
      uint64_t v13 = [(HMDCounterRateLoggingTrigger *)self intervalCounts];
    }
  }
  else
  {
    for (uint64_t i = 0; i != 80; i += 8)
      [(HMDCounterRateLoggingTrigger *)self intervalCounts][i] = 0;
    [(HMDCounterRateLoggingTrigger *)self setLastUpdatedInterval:v11];
    [(HMDCounterRateLoggingTrigger *)self setWindowCount:0];
  }
  if (a5)
  {
    int64_t v14 = a5 - a4;
    v15 = [(HMDCounterRateLoggingTrigger *)self intervalCounts];
    v15[v11 % 0xA] += v14;
    [(HMDCounterRateLoggingTrigger *)self setWindowCount:[(HMDCounterRateLoggingTrigger *)self windowCount] + v14];
    unint64_t v16 = [(HMDCounterRateLoggingTrigger *)self windowCount];
    if (v16 > [(HMDCounterRateLoggingTrigger *)self maxWindowCount]) {
      [(HMDCounterRateLoggingTrigger *)self setMaxWindowCount:[(HMDCounterRateLoggingTrigger *)self windowCount]];
    }
  }
  unint64_t v17 = [(HMDCounterRateLoggingTrigger *)self windowCount];
  if (v17 >= [(HMDCounterRateLoggingTrigger *)self windowThreshold]
    && v8 < [(HMDCounterRateLoggingTrigger *)self windowThreshold])
  {
    [(HMDCounterRateLoggingTrigger *)self logRateTrigger:@"Rate threshold met" triggerValue:[(HMDCounterRateLoggingTrigger *)self windowCount]];
  }
  unint64_t v18 = [(HMDCounterRateLoggingTrigger *)self windowCount];
  if (v18 >= [(HMDCounterRateLoggingTrigger *)self windowThreshold])
  {
    if (a5) {
      return;
    }
  }
  else
  {
    unint64_t v19 = [(HMDCounterRateLoggingTrigger *)self windowThreshold];
    if (a5 && v8 < v19) {
      return;
    }
  }
  unint64_t v20 = [(HMDCounterRateLoggingTrigger *)self maxWindowCount];
  if (v20 >= [(HMDCounterRateLoggingTrigger *)self windowThreshold])
  {
    [(HMDCounterRateLoggingTrigger *)self logRateTrigger:@"Max rate above threshold" triggerValue:[(HMDCounterRateLoggingTrigger *)self maxWindowCount]];
    [(HMDCounterRateLoggingTrigger *)self setMaxWindowCount:0];
  }
}

- (void)dealloc
{
  free(self->_intervalCounts);
  v3.receiver = self;
  v3.super_class = (Class)HMDCounterRateLoggingTrigger;
  [(HMDCounterRateLoggingTrigger *)&v3 dealloc];
}

- (HMDCounterRateLoggingTrigger)initWithThreshold:(int64_t)a3 windowSize:(int64_t)a4 counterName:(id)a5 uploadImmediately:(BOOL)a6 ewsLogger:(id)a7 timeSourceBlock:(id)a8
{
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HMDCounterRateLoggingTrigger;
  unint64_t v18 = [(HMDCounterRateLoggingTrigger *)&v23 init];
  unint64_t v19 = v18;
  if (v18)
  {
    v18->_windowSize = a4;
    v18->_windowThreshold = a3;
    v18->_intervalSize = a4 / 10;
    v18->_intervalCounts = (unint64_t *)malloc_type_malloc(0x50uLL, 0x100004000313F17uLL);
    objc_storeStrong((id *)&v19->_counterName, a5);
    v19->_uploadImmediately = a6;
    objc_storeStrong((id *)&v19->_ewsLogger, a7);
    unint64_t v20 = _Block_copy(v17);
    id timeSourceBlock = v19->_timeSourceBlock;
    v19->_id timeSourceBlock = v20;
  }
  return v19;
}

- (HMDCounterRateLoggingTrigger)initWithThreshold:(int64_t)a3 windowSize:(int64_t)a4 counterName:(id)a5 uploadImmediately:(BOOL)a6 ewsLogger:(id)a7
{
  return [(HMDCounterRateLoggingTrigger *)self initWithThreshold:a3 windowSize:a4 counterName:a5 uploadImmediately:a6 ewsLogger:a7 timeSourceBlock:&__block_literal_global_23789];
}

unint64_t __101__HMDCounterRateLoggingTrigger_initWithThreshold_windowSize_counterName_uploadImmediately_ewsLogger___block_invoke()
{
  v0 = [MEMORY[0x1E4F1C9C8] now];
  [v0 timeIntervalSince1970];
  unint64_t v2 = (unint64_t)v1;

  return v2;
}

- (HMDCounterRateLoggingTrigger)initWithThreshold:(int64_t)a3 windowSize:(int64_t)a4 counterName:(id)a5 ewsLogger:(id)a6
{
  return [(HMDCounterRateLoggingTrigger *)self initWithThreshold:a3 windowSize:a4 counterName:a5 uploadImmediately:0 ewsLogger:a6];
}

@end