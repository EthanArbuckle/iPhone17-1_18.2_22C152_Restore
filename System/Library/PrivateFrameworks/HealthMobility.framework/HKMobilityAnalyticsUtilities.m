@interface HKMobilityAnalyticsUtilities
+ (id)activeWatchProductType;
+ (id)ageWithHealthStore:(id)a3 error:(id *)a4;
+ (id)biologicalSexWithHealthStore:(id)a3 error:(id *)a4;
+ (id)numberOfDaysBetweenStartDate:(id)a3 endDate:(id)a4;
+ (id)payloadStringForBiologicalSex:(id)a3;
+ (id)payloadValueForAge:(id)a3;
+ (id)yearsBetweenStartDateComponents:(id)a3 endDate:(id)a4;
@end

@implementation HKMobilityAnalyticsUtilities

+ (id)yearsBetweenStartDateComponents:(id)a3 endDate:(id)a4
{
  id v5 = a4;
  v6 = (void *)MEMORY[0x1E4F1C9A8];
  id v7 = a3;
  v8 = objc_msgSend(v6, "hk_gregorianCalendarWithLocalTimeZone");
  v9 = [v8 dateFromComponents:v7];

  if (v9)
  {
    v10 = [v8 components:4 fromDate:v9 toDate:v5 options:0];
    v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "year"));
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)numberOfDaysBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1C9A8];
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(v5, "hk_gregorianCalendarWithLocalTimeZone");
  id v15 = 0;
  [v8 rangeOfUnit:16 startDate:&v15 interval:0 forDate:v7];

  id v9 = v15;
  id v14 = 0;
  [v8 rangeOfUnit:16 startDate:&v14 interval:0 forDate:v6];

  id v10 = v14;
  v11 = [v8 components:16 fromDate:v9 toDate:v10 options:0];
  v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "day"));

  return v12;
}

+ (id)payloadStringForBiologicalSex:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && (unint64_t v5 = [v3 integerValue], v5 <= 3)) {
    id v6 = off_1E6D4D290[v5];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

+ (id)payloadValueForAge:(id)a3
{
  return (id)MEMORY[0x1F40E7A48](a3, &unk_1F3B93F70, &unk_1F3B93F88);
}

+ (id)activeWatchProductType
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F79EF0] sharedInstance];
  v4 = [v3 getActivePairedDevice];

  if (v4)
  {
    unint64_t v5 = [v4 valueForProperty:*MEMORY[0x1E4F79E18]];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      _HKInitializeLogging();
      id v9 = *MEMORY[0x1E4F29F78];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F78], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = a1;
        _os_log_impl(&dword_1E0B16000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]: No watch product type retrieved, returning unavailable", (uint8_t *)&v11, 0xCu);
      }
      id v7 = @"unavailable";
    }
  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E4F29F78];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F78], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = a1;
      _os_log_impl(&dword_1E0B16000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: No active paired device, returning unavailable", (uint8_t *)&v11, 0xCu);
    }
    id v7 = @"unavailable";
  }

  return v7;
}

+ (id)ageWithHealthStore:(id)a3 error:(id *)a4
{
  v4 = [a3 dateOfBirthComponentsWithError:a4];
  if (v4)
  {
    unint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    id v6 = +[HKMobilityAnalyticsUtilities yearsBetweenStartDateComponents:v4 endDate:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)biologicalSexWithHealthStore:(id)a3 error:(id *)a4
{
  v4 = [a3 biologicalSexWithError:a4];
  unint64_t v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "biologicalSex"));
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end