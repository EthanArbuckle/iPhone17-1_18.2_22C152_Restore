@interface HKAnalyticsEnvironmentDataSource
- (HKAnalyticsEnvironmentDataSource)init;
- (HKCalendarCache)calendarCache;
- (NSDate)currentDate;
- (NSString)activePairedDeviceHousingColor;
- (NSString)activePairedDeviceModelNumber;
- (NSString)activePairedDeviceOSBuildNumber;
- (NSString)activePairedDeviceProductType;
- (NSString)activePairedDeviceRegionInfo;
- (id)bucketedNumberOfDaysSinceDate:(id)a3;
- (id)bucketedNumberOfWeeksSinceDate:(id)a3;
- (id)bucketedNumberOfWeeksSinceDate:(id)a3 minimumBinningValue:(int64_t)a4;
@end

@implementation HKAnalyticsEnvironmentDataSource

- (HKAnalyticsEnvironmentDataSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKAnalyticsEnvironmentDataSource;
  v2 = [(HKAnalyticsEnvironmentDataSource *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(HKCalendarCache);
    calendarCache = v2->_calendarCache;
    v2->_calendarCache = v3;
  }
  return v2;
}

- (NSDate)currentDate
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] now];
}

- (NSString)activePairedDeviceModelNumber
{
  return +[HKNanoRegistryDeviceUtility activePairedDeviceModelNumber];
}

- (NSString)activePairedDeviceOSBuildNumber
{
  return (NSString *)+[HKNanoRegistryDeviceUtility activePairedDeviceSystemBuildVersion];
}

- (NSString)activePairedDeviceProductType
{
  return (NSString *)+[HKNanoRegistryDeviceUtility activePairedDeviceProductType];
}

- (NSString)activePairedDeviceRegionInfo
{
  return +[HKNanoRegistryDeviceUtility activePairedDeviceRegionInfo];
}

- (NSString)activePairedDeviceHousingColor
{
  return +[HKNanoRegistryDeviceUtility activePairedDeviceHousingColor];
}

- (id)bucketedNumberOfDaysSinceDate:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(HKAnalyticsEnvironmentDataSource *)self calendarCache];
    objc_super v6 = [v5 currentCalendar];

    v7 = [(HKAnalyticsEnvironmentDataSource *)self currentDate];
    v8 = [v6 components:16 fromDate:v4 toDate:v7 options:0];

    if (v8 && (uint64_t v9 = [v8 day], v9 != 0x7FFFFFFFFFFFFFFFLL))
    {
      v11 = [NSNumber numberWithInteger:v9];
      v10 = HKAnalyticsSigFigBinnedValue(v11, 2, &unk_1EECE5F90);
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)bucketedNumberOfWeeksSinceDate:(id)a3
{
  return [(HKAnalyticsEnvironmentDataSource *)self bucketedNumberOfWeeksSinceDate:a3 minimumBinningValue:100];
}

- (id)bucketedNumberOfWeeksSinceDate:(id)a3 minimumBinningValue:(int64_t)a4
{
  if (a3)
  {
    id v6 = a3;
    v7 = [(HKAnalyticsEnvironmentDataSource *)self calendarCache];
    v8 = [v7 currentCalendar];

    uint64_t v9 = [(HKAnalyticsEnvironmentDataSource *)self currentDate];
    v10 = [v8 components:0x2000 fromDate:v6 toDate:v9 options:0];

    if (v10 && (uint64_t v11 = [v10 weekOfYear], v11 != 0x7FFFFFFFFFFFFFFFLL))
    {
      v13 = [NSNumber numberWithInteger:v11];
      v14 = [NSNumber numberWithInteger:a4];
      v12 = HKAnalyticsSigFigBinnedValue(v13, 2, v14);
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (HKCalendarCache)calendarCache
{
  return self->_calendarCache;
}

- (void).cxx_destruct
{
}

@end