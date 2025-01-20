@interface HKHeartbeatSeriesSample(AFibBurdenControl)
+ (id)_aFibSeriesSampleWithStartDate:()AFibBurdenControl device:metadata:;
+ (id)_nonAFibSeriesSampleWithStartDate:()AFibBurdenControl device:metadata:;
@end

@implementation HKHeartbeatSeriesSample(AFibBurdenControl)

+ (id)_aFibSeriesSampleWithStartDate:()AFibBurdenControl device:metadata:
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [v9 dateByAddingTimeInterval:60.0];
  if (_aFibHeartbeatSeriesData_onceToken != -1) {
    dispatch_once(&_aFibHeartbeatSeriesData_onceToken, &__block_literal_global_9);
  }
  v11 = [MEMORY[0x1E4F2B108] _heartbeatSeriesSampleWithData:_aFibHeartbeatSeriesData___aFibHeartbeatSeriesData startDate:v9 endDate:v10 device:v8 metadata:v7];

  return v11;
}

+ (id)_nonAFibSeriesSampleWithStartDate:()AFibBurdenControl device:metadata:
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [v9 dateByAddingTimeInterval:60.0];
  if (_nonAFibHeartbeatSeriesData_onceToken != -1) {
    dispatch_once(&_nonAFibHeartbeatSeriesData_onceToken, &__block_literal_global_392);
  }
  v11 = [MEMORY[0x1E4F2B108] _heartbeatSeriesSampleWithData:_nonAFibHeartbeatSeriesData___nonAFibHeartbeatSeriesData startDate:v9 endDate:v10 device:v8 metadata:v7];

  return v11;
}

@end