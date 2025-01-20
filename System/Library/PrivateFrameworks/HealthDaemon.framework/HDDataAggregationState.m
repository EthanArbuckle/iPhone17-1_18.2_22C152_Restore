@interface HDDataAggregationState
- (HDDataAggregationState)init;
- (HDDataAggregationState)initWithRemainingSensorData:(id)a3;
- (HDDataAggregationState)initWithRemainingSensorData:(id)a3 currentSeries:(id)a4;
- (HKSample)openSeries;
- (NSMutableArray)unaggregatedSensorData;
@end

@implementation HDDataAggregationState

- (HDDataAggregationState)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDDataAggregationState)initWithRemainingSensorData:(id)a3
{
  return [(HDDataAggregationState *)self initWithRemainingSensorData:a3 currentSeries:0];
}

- (HDDataAggregationState)initWithRemainingSensorData:(id)a3 currentSeries:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDDataAggregationState;
  v9 = [(HDDataAggregationState *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_unaggregatedSensorData, a3);
    objc_storeStrong((id *)&v10->_openSeries, a4);
  }

  return v10;
}

- (NSMutableArray)unaggregatedSensorData
{
  return self->_unaggregatedSensorData;
}

- (HKSample)openSeries
{
  return self->_openSeries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openSeries, 0);

  objc_storeStrong((id *)&self->_unaggregatedSensorData, 0);
}

@end