@interface HDQuantityAggregationResult
- (HDQuantityAggregationResult)initWithAggregatedSamples:(id)a3 consumedData:(id)a4 remainingData:(id)a5;
- (NSArray)aggregatedSamples;
- (NSArray)consumedSensorData;
- (NSMutableArray)remainingSensorData;
@end

@implementation HDQuantityAggregationResult

- (HDQuantityAggregationResult)initWithAggregatedSamples:(id)a3 consumedData:(id)a4 remainingData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HDQuantityAggregationResult;
  v11 = [(HDQuantityAggregationResult *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    aggregatedSamples = v11->_aggregatedSamples;
    v11->_aggregatedSamples = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    consumedSensorData = v11->_consumedSensorData;
    v11->_consumedSensorData = (NSArray *)v14;

    objc_storeStrong((id *)&v11->_remainingSensorData, a5);
  }

  return v11;
}

- (NSArray)aggregatedSamples
{
  return self->_aggregatedSamples;
}

- (NSArray)consumedSensorData
{
  return self->_consumedSensorData;
}

- (NSMutableArray)remainingSensorData
{
  return self->_remainingSensorData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingSensorData, 0);
  objc_storeStrong((id *)&self->_consumedSensorData, 0);

  objc_storeStrong((id *)&self->_aggregatedSamples, 0);
}

@end