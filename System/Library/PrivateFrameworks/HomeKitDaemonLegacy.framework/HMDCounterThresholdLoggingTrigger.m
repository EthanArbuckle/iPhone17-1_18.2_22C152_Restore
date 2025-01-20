@interface HMDCounterThresholdLoggingTrigger
- (BOOL)uploadImmediately;
- (HMDCounterThresholdLoggingTrigger)initWithThreshold:(int64_t)a3 counterName:(id)a4 ewsLogger:(id)a5;
- (HMDCounterThresholdLoggingTrigger)initWithThreshold:(int64_t)a3 counterName:(id)a4 uploadImmediately:(BOOL)a5 ewsLogger:(id)a6;
- (HMDEWSLogging)ewsLogger;
- (NSString)counterName;
- (int64_t)threshold;
- (void)logThresholdTrigger:(id)a3 triggerValue:(unint64_t)a4;
- (void)updatedCounter:(id)a3 fromOldValue:(int64_t)a4 toNewValue:(int64_t)a5;
@end

@implementation HMDCounterThresholdLoggingTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ewsLogger, 0);
  objc_storeStrong((id *)&self->_counterName, 0);
}

- (HMDEWSLogging)ewsLogger
{
  return self->_ewsLogger;
}

- (BOOL)uploadImmediately
{
  return self->_uploadImmediately;
}

- (NSString)counterName
{
  return self->_counterName;
}

- (int64_t)threshold
{
  return self->_threshold;
}

- (void)logThresholdTrigger:(id)a3 triggerValue:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1D9452090]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    v11 = [(HMDCounterThresholdLoggingTrigger *)v8 counterName];
    *(_DWORD *)buf = 138544130;
    v20 = v10;
    __int16 v21 = 2114;
    id v22 = v6;
    __int16 v23 = 2114;
    v24 = v11;
    __int16 v25 = 2048;
    unint64_t v26 = a4;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@EWS threshold trigger: trigger=%{public}@, counter=%{public}@, value=%lu", buf, 0x2Au);
  }
  v12 = [(HMDCounterThresholdLoggingTrigger *)v8 ewsLogger];
  uint64_t v13 = [(HMDCounterThresholdLoggingTrigger *)v8 uploadImmediately];
  v14 = [(HMDCounterThresholdLoggingTrigger *)v8 counterName];
  v17[1] = @"value";
  v18[0] = v14;
  v15 = [NSNumber numberWithUnsignedInteger:a4];
  v18[1] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  [v12 submitEventWithName:v6 serviceName:@"Counter Trigger" uploadImmediately:v13 payload:v16];
}

- (void)updatedCounter:(id)a3 fromOldValue:(int64_t)a4 toNewValue:(int64_t)a5
{
  if ([(HMDCounterThresholdLoggingTrigger *)self threshold] <= a5
    && [(HMDCounterThresholdLoggingTrigger *)self threshold] > a4)
  {
    [(HMDCounterThresholdLoggingTrigger *)self logThresholdTrigger:@"Trigger threshold met" triggerValue:a5];
  }
  if (!a5 && [(HMDCounterThresholdLoggingTrigger *)self threshold] <= a4)
  {
    [(HMDCounterThresholdLoggingTrigger *)self logThresholdTrigger:@"Max value above threshold" triggerValue:a4];
  }
}

- (HMDCounterThresholdLoggingTrigger)initWithThreshold:(int64_t)a3 counterName:(id)a4 uploadImmediately:(BOOL)a5 ewsLogger:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HMDCounterThresholdLoggingTrigger;
  uint64_t v13 = [(HMDCounterThresholdLoggingTrigger *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_threshold = a3;
    objc_storeStrong((id *)&v13->_counterName, a4);
    v14->_uploadImmediately = a5;
    objc_storeStrong((id *)&v14->_ewsLogger, a6);
  }

  return v14;
}

- (HMDCounterThresholdLoggingTrigger)initWithThreshold:(int64_t)a3 counterName:(id)a4 ewsLogger:(id)a5
{
  return [(HMDCounterThresholdLoggingTrigger *)self initWithThreshold:a3 counterName:a4 uploadImmediately:0 ewsLogger:a5];
}

@end