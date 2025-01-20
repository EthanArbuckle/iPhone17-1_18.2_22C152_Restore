@interface HDDataAggregationResult
- (HDDataAggregationResult)initWithResultingAggregationState:(id)a3 consumedSensorData:(id)a4 persistenceHandler:(id)a5;
- (HDDataAggregationState)aggregationState;
- (NSArray)consumedSensorData;
- (id)persistenceHandler;
@end

@implementation HDDataAggregationResult

- (HDDataAggregationResult)initWithResultingAggregationState:(id)a3 consumedSensorData:(id)a4 persistenceHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDDataAggregationResult;
  v12 = [(HDDataAggregationResult *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_aggregationState, a3);
    uint64_t v14 = [v10 copy];
    consumedSensorData = v13->_consumedSensorData;
    v13->_consumedSensorData = (NSArray *)v14;

    uint64_t v16 = [v11 copy];
    id persistenceHandler = v13->_persistenceHandler;
    v13->_id persistenceHandler = (id)v16;
  }
  return v13;
}

- (HDDataAggregationState)aggregationState
{
  return self->_aggregationState;
}

- (NSArray)consumedSensorData
{
  return self->_consumedSensorData;
}

- (id)persistenceHandler
{
  return self->_persistenceHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_persistenceHandler, 0);
  objc_storeStrong((id *)&self->_consumedSensorData, 0);

  objc_storeStrong((id *)&self->_aggregationState, 0);
}

@end