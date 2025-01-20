@interface MTRDeviceStorageBehaviorConfiguration
+ (MTRDeviceStorageBehaviorConfiguration)configurationWithDefaultStorageBehavior;
+ (MTRDeviceStorageBehaviorConfiguration)configurationWithReportToPersistenceDelayTime:(double)a3 reportToPersistenceDelayTimeMax:(double)a4 recentReportTimesMaxCount:(unint64_t)a5 timeBetweenReportsTooShortThreshold:(double)a6 timeBetweenReportsTooShortMinThreshold:(double)a7 reportToPersistenceDelayMaxMultiplier:(double)a8 deviceReportingExcessivelyIntervalThreshold:(double)a9;
+ (MTRDeviceStorageBehaviorConfiguration)configurationWithStorageBehaviorOptimizationDisabled;
- (BOOL)disableStorageBehaviorOptimization;
- (double)deviceReportingExcessivelyIntervalThreshold;
- (double)reportToPersistenceDelayMaxMultiplier;
- (double)reportToPersistenceDelayTime;
- (double)reportToPersistenceDelayTimeMax;
- (double)timeBetweenReportsTooShortMinThreshold;
- (double)timeBetweenReportsTooShortThreshold;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)recentReportTimesMaxCount;
- (void)checkValuesAndResetToDefaultIfNecessary;
- (void)setDeviceReportingExcessivelyIntervalThreshold:(double)a3;
- (void)setDisableStorageBehaviorOptimization:(BOOL)a3;
- (void)setRecentReportTimesMaxCount:(unint64_t)a3;
- (void)setReportToPersistenceDelayMaxMultiplier:(double)a3;
- (void)setReportToPersistenceDelayTime:(double)a3;
- (void)setReportToPersistenceDelayTimeMax:(double)a3;
- (void)setTimeBetweenReportsTooShortMinThreshold:(double)a3;
- (void)setTimeBetweenReportsTooShortThreshold:(double)a3;
@end

@implementation MTRDeviceStorageBehaviorConfiguration

+ (MTRDeviceStorageBehaviorConfiguration)configurationWithReportToPersistenceDelayTime:(double)a3 reportToPersistenceDelayTimeMax:(double)a4 recentReportTimesMaxCount:(unint64_t)a5 timeBetweenReportsTooShortThreshold:(double)a6 timeBetweenReportsTooShortMinThreshold:(double)a7 reportToPersistenceDelayMaxMultiplier:(double)a8 deviceReportingExcessivelyIntervalThreshold:(double)a9
{
  v16 = objc_alloc_init(MTRDeviceStorageBehaviorConfiguration);
  objc_msgSend_setReportToPersistenceDelayTime_(v16, v17, v18, a3);
  objc_msgSend_setReportToPersistenceDelayTimeMax_(v16, v19, v20, a4);
  objc_msgSend_setRecentReportTimesMaxCount_(v16, v21, a5);
  objc_msgSend_setTimeBetweenReportsTooShortThreshold_(v16, v22, v23, a6);
  objc_msgSend_setTimeBetweenReportsTooShortMinThreshold_(v16, v24, v25, a7);
  objc_msgSend_setReportToPersistenceDelayMaxMultiplier_(v16, v26, v27, a8);
  objc_msgSend_setDeviceReportingExcessivelyIntervalThreshold_(v16, v28, v29, a9);

  return v16;
}

+ (MTRDeviceStorageBehaviorConfiguration)configurationWithDefaultStorageBehavior
{
  v2 = objc_alloc_init(MTRDeviceStorageBehaviorConfiguration);
  objc_msgSend_checkValuesAndResetToDefaultIfNecessary(v2, v3, v4);

  return v2;
}

+ (MTRDeviceStorageBehaviorConfiguration)configurationWithStorageBehaviorOptimizationDisabled
{
  v2 = objc_alloc_init(MTRDeviceStorageBehaviorConfiguration);
  objc_msgSend_setDisableStorageBehaviorOptimization_(v2, v3, 1);

  return v2;
}

- (id)description
{
  if (self->_disableStorageBehaviorOptimization) {
    return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"<MTRDeviceStorageBehaviorConfiguration(%p): disabled %s reportToPersistenceDelayTime %lf reportToPersistenceDelayTimeMax %lf recentReportTimesMaxCount %lu timeBetweenReportsTooShortThreshold %lf timeBetweenReportsTooShortMinThreshold %lf reportToPersistenceDelayMaxMultiplier %lf deviceReportingExcessivelyIntervalThreshold %lf", self, "YES", *(void *)&self->_reportToPersistenceDelayTime, *(void *)&self->_reportToPersistenceDelayTimeMax, self->_recentReportTimesMaxCount, *(void *)&self->_timeBetweenReportsTooShortThreshold, *(void *)&self->_timeBetweenReportsTooShortMinThreshold, *(void *)&self->_reportToPersistenceDelayMaxMultiplier, *(void *)&self->_deviceReportingExcessivelyIntervalThreshold);
  }
  else {
    return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"<MTRDeviceStorageBehaviorConfiguration(%p): disabled %s reportToPersistenceDelayTime %lf reportToPersistenceDelayTimeMax %lf recentReportTimesMaxCount %lu timeBetweenReportsTooShortThreshold %lf timeBetweenReportsTooShortMinThreshold %lf reportToPersistenceDelayMaxMultiplier %lf deviceReportingExcessivelyIntervalThreshold %lf", self, "NO", *(void *)&self->_reportToPersistenceDelayTime, *(void *)&self->_reportToPersistenceDelayTimeMax, self->_recentReportTimesMaxCount, *(void *)&self->_timeBetweenReportsTooShortThreshold, *(void *)&self->_timeBetweenReportsTooShortMinThreshold, *(void *)&self->_reportToPersistenceDelayMaxMultiplier, *(void *)&self->_deviceReportingExcessivelyIntervalThreshold);
  }
}

- (void)checkValuesAndResetToDefaultIfNecessary
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!self->_disableStorageBehaviorOptimization)
  {
    double reportToPersistenceDelayTime = self->_reportToPersistenceDelayTime;
    if (reportToPersistenceDelayTime <= 0.0
      || ((double reportToPersistenceDelayTimeMax = self->_reportToPersistenceDelayTimeMax,
           reportToPersistenceDelayTimeMax > 0.0)
        ? (BOOL v5 = reportToPersistenceDelayTimeMax < reportToPersistenceDelayTime)
        : (BOOL v5 = 1),
          v5
       || self->_recentReportTimesMaxCount < 2
       || (double timeBetweenReportsTooShortThreshold = self->_timeBetweenReportsTooShortThreshold,
           timeBetweenReportsTooShortThreshold <= 0.0)
       || ((double timeBetweenReportsTooShortMinThreshold = self->_timeBetweenReportsTooShortMinThreshold,
            timeBetweenReportsTooShortMinThreshold > 0.0)
         ? (BOOL v8 = timeBetweenReportsTooShortMinThreshold <= timeBetweenReportsTooShortThreshold)
         : (BOOL v8 = 0),
           !v8
        || self->_reportToPersistenceDelayMaxMultiplier <= 1.0
        || self->_deviceReportingExcessivelyIntervalThreshold <= 0.0)))
    {
      v9 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = self;
        _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_DEFAULT, "%@ storage behavior: MTRDeviceStorageBehaviorConfiguration values out of bounds - resetting to default", buf, 0xCu);
      }

      if (sub_244CC4E58(2u)) {
        sub_244CC4DE0(0, 2);
      }
      *(_OWORD *)&self->_double reportToPersistenceDelayTime = xmmword_244EADBE0;
      self->_recentReportTimesMaxCount = 12;
      *(_OWORD *)&self->_double timeBetweenReportsTooShortThreshold = xmmword_244EADBF0;
      *(_OWORD *)&self->_reportToPersistenceDelayMaxMultiplier = xmmword_244EADC00;
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(MTRDeviceStorageBehaviorConfiguration);
  objc_msgSend_setDisableStorageBehaviorOptimization_(v4, v5, self->_disableStorageBehaviorOptimization);
  objc_msgSend_setReportToPersistenceDelayTime_(v4, v6, v7, self->_reportToPersistenceDelayTime);
  objc_msgSend_setReportToPersistenceDelayTimeMax_(v4, v8, v9, self->_reportToPersistenceDelayTimeMax);
  objc_msgSend_setRecentReportTimesMaxCount_(v4, v10, self->_recentReportTimesMaxCount);
  objc_msgSend_setTimeBetweenReportsTooShortThreshold_(v4, v11, v12, self->_timeBetweenReportsTooShortThreshold);
  objc_msgSend_setTimeBetweenReportsTooShortMinThreshold_(v4, v13, v14, self->_timeBetweenReportsTooShortMinThreshold);
  objc_msgSend_setReportToPersistenceDelayMaxMultiplier_(v4, v15, v16, self->_reportToPersistenceDelayMaxMultiplier);
  objc_msgSend_setDeviceReportingExcessivelyIntervalThreshold_(v4, v17, v18, self->_deviceReportingExcessivelyIntervalThreshold);
  return v4;
}

- (BOOL)disableStorageBehaviorOptimization
{
  return self->_disableStorageBehaviorOptimization;
}

- (void)setDisableStorageBehaviorOptimization:(BOOL)a3
{
  self->_disableStorageBehaviorOptimization = a3;
}

- (double)reportToPersistenceDelayTime
{
  return self->_reportToPersistenceDelayTime;
}

- (void)setReportToPersistenceDelayTime:(double)a3
{
  self->_double reportToPersistenceDelayTime = a3;
}

- (double)reportToPersistenceDelayTimeMax
{
  return self->_reportToPersistenceDelayTimeMax;
}

- (void)setReportToPersistenceDelayTimeMax:(double)a3
{
  self->_double reportToPersistenceDelayTimeMax = a3;
}

- (unint64_t)recentReportTimesMaxCount
{
  return self->_recentReportTimesMaxCount;
}

- (void)setRecentReportTimesMaxCount:(unint64_t)a3
{
  self->_recentReportTimesMaxCount = a3;
}

- (double)timeBetweenReportsTooShortThreshold
{
  return self->_timeBetweenReportsTooShortThreshold;
}

- (void)setTimeBetweenReportsTooShortThreshold:(double)a3
{
  self->_double timeBetweenReportsTooShortThreshold = a3;
}

- (double)timeBetweenReportsTooShortMinThreshold
{
  return self->_timeBetweenReportsTooShortMinThreshold;
}

- (void)setTimeBetweenReportsTooShortMinThreshold:(double)a3
{
  self->_double timeBetweenReportsTooShortMinThreshold = a3;
}

- (double)reportToPersistenceDelayMaxMultiplier
{
  return self->_reportToPersistenceDelayMaxMultiplier;
}

- (void)setReportToPersistenceDelayMaxMultiplier:(double)a3
{
  self->_reportToPersistenceDelayMaxMultiplier = a3;
}

- (double)deviceReportingExcessivelyIntervalThreshold
{
  return self->_deviceReportingExcessivelyIntervalThreshold;
}

- (void)setDeviceReportingExcessivelyIntervalThreshold:(double)a3
{
  self->_deviceReportingExcessivelyIntervalThreshold = a3;
}

@end