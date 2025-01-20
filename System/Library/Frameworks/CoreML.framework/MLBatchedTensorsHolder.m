@interface MLBatchedTensorsHolder
- (MLBatchedTensorsHolder)initWithBatchedTensors:(id)a3 numberOfTensors:(unint64_t)a4;
- (NSDictionary)batchedTensors;
- (unint64_t)numberOfTensors;
@end

@implementation MLBatchedTensorsHolder

- (void).cxx_destruct
{
}

- (unint64_t)numberOfTensors
{
  return self->_numberOfTensors;
}

- (NSDictionary)batchedTensors
{
  return self->_batchedTensors;
}

- (MLBatchedTensorsHolder)initWithBatchedTensors:(id)a3 numberOfTensors:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLBatchedTensorsHolder;
  v8 = [(MLBatchedTensorsHolder *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_batchedTensors, a3);
    v9->_numberOfTensors = a4;
  }

  return v9;
}

@end