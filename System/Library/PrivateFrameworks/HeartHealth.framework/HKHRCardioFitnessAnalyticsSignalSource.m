@interface HKHRCardioFitnessAnalyticsSignalSource
- (BOOL)isImproveHealthAndActivityAllowed;
- (NSString)activeWatchProductType;
- (NSString)featureVersion;
- (id)biologicalSexStringForBiologicalSex:(int64_t)a3;
- (id)biologicalSexStringWithError:(id *)a3;
- (int64_t)bucketedAgeForDateOfBirthComponents:(id)a3;
- (int64_t)bucketedAgeWithError:(id *)a3;
@end

@implementation HKHRCardioFitnessAnalyticsSignalSource

- (int64_t)bucketedAgeWithError:(id *)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"HKHRCardioFitnessAnalyticsSignalSource.m" lineNumber:26 description:@"Subclass must implement"];

  return -1;
}

- (id)biologicalSexStringWithError:(id *)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"HKHRCardioFitnessAnalyticsSignalSource.m" lineNumber:31 description:@"Subclass must implement"];

  return &stru_1F3B84F70;
}

- (NSString)activeWatchProductType
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F79EF0] sharedInstance];
  v4 = [v3 getActivePairedDevice];

  if (v4)
  {
    v5 = [v4 valueForProperty:*MEMORY[0x1E4F79E18]];
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E4F29F48];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        v12 = self;
        _os_log_impl(&dword_1E0A83000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]: No watch product type retrieved, returning unavailable", (uint8_t *)&v11, 0xCu);
      }
      v7 = @"unavailable";
    }
  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      v12 = self;
      _os_log_impl(&dword_1E0A83000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: No active paired device, returning unavailable", (uint8_t *)&v11, 0xCu);
    }
    v7 = @"unavailable";
  }

  return (NSString *)v7;
}

- (NSString)featureVersion
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%.1f", 0x3FF0000000000000);
}

- (BOOL)isImproveHealthAndActivityAllowed
{
  return MEMORY[0x1F40E7D50](self, a2);
}

- (int64_t)bucketedAgeForDateOfBirthComponents:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  v5 = objc_msgSend(v3, "hk_gregorianCalendarWithLocalTimeZone");
  v6 = [MEMORY[0x1E4F1C9C8] date];
  v7 = objc_msgSend(v5, "hk_dateOfBirthDateComponentsWithDate:", v6);

  v8 = [v5 components:4 fromDateComponents:v4 toDateComponents:v7 options:0];

  uint64_t v9 = [v8 year];
  v10 = [NSNumber numberWithInteger:v9];
  int v11 = HKAnalyticsDecadeBucketedAgeForAgeWithMinimumAgeAndMaximumAge();
  int64_t v12 = [v11 integerValue];

  return v12;
}

- (id)biologicalSexStringForBiologicalSex:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"male";
  }
  else {
    return off_1E6D4A018[a3];
  }
}

@end