@interface HMDXPCActivityRunReportLogEvent
- (BOOL)activityShouldWake;
- (HMDXPCActivityRunReportLogEvent)initWithActivityName:(id)a3 definedInterval:(double)a4 activityShouldWake:(BOOL)a5 timeSinceLastRun:(double)a6;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)activityName;
- (NSString)coreAnalyticsEventName;
- (int64_t)activityDefinedIntervalInMinutes;
- (int64_t)activityRunHourOfDay;
- (int64_t)activityTimeSinceLastRunInMinutes;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDXPCActivityRunReportLogEvent

- (void).cxx_destruct
{
}

- (int64_t)activityTimeSinceLastRunInMinutes
{
  return self->_activityTimeSinceLastRunInMinutes;
}

- (int64_t)activityRunHourOfDay
{
  return self->_activityRunHourOfDay;
}

- (BOOL)activityShouldWake
{
  return self->_activityShouldWake;
}

- (int64_t)activityDefinedIntervalInMinutes
{
  return self->_activityDefinedIntervalInMinutes;
}

- (NSString)activityName
{
  return self->_activityName;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v11[5] = *MEMORY[0x263EF8340];
  v10[0] = @"activityName";
  v3 = [(HMDXPCActivityRunReportLogEvent *)self activityName];
  v11[0] = v3;
  v10[1] = @"activityShouldWake";
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDXPCActivityRunReportLogEvent activityShouldWake](self, "activityShouldWake"));
  v11[1] = v4;
  v10[2] = @"activityDefinedIntervalInMinutes";
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDXPCActivityRunReportLogEvent activityDefinedIntervalInMinutes](self, "activityDefinedIntervalInMinutes"));
  v11[2] = v5;
  v10[3] = @"activityRunHourOfDay";
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDXPCActivityRunReportLogEvent activityRunHourOfDay](self, "activityRunHourOfDay"));
  v11[3] = v6;
  v10[4] = @"activityTimeSinceLastRunInMinutes";
  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDXPCActivityRunReportLogEvent activityTimeSinceLastRunInMinutes](self, "activityTimeSinceLastRunInMinutes"));
  v11[4] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:5];

  return (NSDictionary *)v8;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.homed.HMDXPCActivityRunReport";
}

- (HMDXPCActivityRunReportLogEvent)initWithActivityName:(id)a3 definedInterval:(double)a4 activityShouldWake:(BOOL)a5 timeSinceLastRun:(double)a6
{
  id v11 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDXPCActivityRunReportLogEvent;
  v12 = [(HMMLogEvent *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_activityName, a3);
    v13->_activityDefinedIntervalInMinutes = (uint64_t)(a4 / 3600.0);
    v13->_activityShouldWake = a5;
    v14 = [MEMORY[0x263EFF910] now];
    v15 = objc_msgSend(v14, "hmf_dateComponents");
    v13->_activityRunHourOfDay = [v15 hour];

    v13->_activityTimeSinceLastRunInMinutes = (uint64_t)(a6 / 60.0);
  }

  return v13;
}

@end