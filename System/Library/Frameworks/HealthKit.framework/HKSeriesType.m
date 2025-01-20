@interface HKSeriesType
+ (HKSeriesType)heartbeatSeriesType;
+ (HKSeriesType)workoutRouteType;
- (Class)dataObjectClass;
@end

@implementation HKSeriesType

+ (HKSeriesType)workoutRouteType
{
  return (HKSeriesType *)[a1 seriesTypeForIdentifier:@"HKWorkoutRouteTypeIdentifier"];
}

+ (HKSeriesType)heartbeatSeriesType
{
  return (HKSeriesType *)[a1 seriesTypeForIdentifier:@"HKDataTypeIdentifierHeartbeatSeries"];
}

- (Class)dataObjectClass
{
  int64_t v2 = [(HKObjectType *)self code];
  if (v2 == 102 || v2 == 119)
  {
    v3 = objc_opt_class();
  }
  else
  {
    v3 = 0;
  }

  return (Class)v3;
}

@end