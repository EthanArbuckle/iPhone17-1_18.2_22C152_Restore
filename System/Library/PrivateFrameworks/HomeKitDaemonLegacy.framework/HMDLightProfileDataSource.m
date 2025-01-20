@interface HMDLightProfileDataSource
- (NSDate)date;
- (NSDictionary)naturalLightingCurveResourceFileContent;
- (NSTimeZone)localTimeZone;
- (double)naturalLightingCurveUpdateAccessoryTimeDifferenceThreshold;
- (double)naturalLightingCurveUpdateInterval;
- (double)naturalLightingEnabledRetryInterval;
- (int64_t)naturalLightingEnabledMaxRetryCount;
- (unint64_t)millisecondsElapsedSinceStartOfDayWithDate:(id)a3 timeZone:(id)a4;
- (void)dispatchAfterTimeInterval:(double)a3 queue:(id)a4 block:(id)a5;
@end

@implementation HMDLightProfileDataSource

- (double)naturalLightingEnabledRetryInterval
{
  v2 = [MEMORY[0x1E4F65530] sharedPreferences];
  v3 = [v2 preferenceForKey:@"naturalLightingEnabledRetryInterval"];
  v4 = [v3 numberValue];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (int64_t)naturalLightingEnabledMaxRetryCount
{
  v2 = [MEMORY[0x1E4F65530] sharedPreferences];
  v3 = [v2 preferenceForKey:@"naturalLightingEnabledMaxRetryCount"];
  v4 = [v3 numberValue];
  int64_t v5 = [v4 integerValue];

  return v5;
}

- (void)dispatchAfterTimeInterval:(double)a3 queue:(id)a4 block:(id)a5
{
  int64_t v6 = (uint64_t)(a3 * 1000000000.0);
  id v7 = a5;
  queue = a4;
  dispatch_time_t v8 = dispatch_time(0, v6);
  dispatch_after(v8, queue, v7);
}

- (double)naturalLightingCurveUpdateAccessoryTimeDifferenceThreshold
{
  v2 = [MEMORY[0x1E4F65530] sharedPreferences];
  v3 = [v2 preferenceForKey:@"naturalLightingCurveUpdateAccessoryTimeDifferenceThreshold"];
  v4 = [v3 numberValue];

  [v4 doubleValue];
  if (v5 >= 0.0)
  {
    [v4 doubleValue];
    double v6 = v7;
  }
  else
  {
    double v6 = 60.0;
  }

  return v6;
}

- (double)naturalLightingCurveUpdateInterval
{
  v2 = [MEMORY[0x1E4F65530] sharedPreferences];
  v3 = [v2 preferenceForKey:@"naturalLightingCurveUpdateInterval"];
  v4 = [v3 numberValue];

  [v4 doubleValue];
  if (v5 >= 0.0)
  {
    [v4 doubleValue];
    double v6 = v7;
  }
  else
  {
    double v6 = 86400.0;
  }

  return v6;
}

- (NSDictionary)naturalLightingCurveResourceFileContent
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 pathForResource:@"NaturalLightingCurve" ofType:@"plist"];

  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
    id v15 = 0;
    double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v4 error:&v15];
    double v6 = (__CFString *)v15;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      v11 = (void *)MEMORY[0x1D9452090]();
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v17 = v13;
        __int16 v18 = 2112;
        v19 = v4;
        __int16 v20 = 2112;
        v21 = v6;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to create dictionary from file URL %@:%@", buf, 0x20u);
      }
      id v7 = (id)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    dispatch_time_t v8 = (void *)MEMORY[0x1D9452090]();
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v17 = v10;
      __int16 v18 = 2112;
      v19 = @"NaturalLightingCurve";
      __int16 v20 = 2112;
      v21 = @"plist";
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to locate the resource file with name: %@ with extension: %@", buf, 0x20u);
    }
    id v7 = (id)MEMORY[0x1E4F1CC08];
  }

  return (NSDictionary *)v7;
}

- (NSTimeZone)localTimeZone
{
  return (NSTimeZone *)[MEMORY[0x1E4F1CAF0] localTimeZone];
}

- (unint64_t)millisecondsElapsedSinceStartOfDayWithDate:(id)a3 timeZone:(id)a4
{
  double v5 = (void *)MEMORY[0x1E4F1C9A8];
  uint64_t v6 = *MEMORY[0x1E4F1C318];
  id v7 = a4;
  id v8 = a3;
  v9 = [v5 calendarWithIdentifier:v6];
  [v9 setTimeZone:v7];

  v10 = [v9 components:224 fromDate:v8];

  uint64_t v11 = 3600 * [v10 hour];
  uint64_t v12 = v11 + 60 * [v10 minute];
  unint64_t v13 = 1000 * (v12 + [v10 second]);

  return v13;
}

- (NSDate)date
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] date];
}

@end