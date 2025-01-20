@interface _MLBatchDataSource
- (BOOL)useForPrediction;
- (MLBatchProvider)batchProvider;
- (MLNeuralNetworkEngine)nnEngine;
- (_MLBatchDataSource)initWithMLBatchProvider:(id)a3 forPrediction:(BOOL)a4 neuralNetworkEngine:(id)a5 error:(id *)a6;
- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4;
- (unint64_t)numberOfDataPoints;
@end

@implementation _MLBatchDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nnEngine, 0);

  objc_storeStrong((id *)&self->_batchProvider, 0);
}

- (BOOL)useForPrediction
{
  return self->_useForPrediction;
}

- (MLNeuralNetworkEngine)nnEngine
{
  return self->_nnEngine;
}

- (MLBatchProvider)batchProvider
{
  return self->_batchProvider;
}

- (unint64_t)numberOfDataPoints
{
  v2 = [(_MLBatchDataSource *)self batchProvider];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4
{
  v7 = [_MLDataSource alloc];
  v8 = [(_MLBatchDataSource *)self batchProvider];
  v9 = [v8 featuresAtIndex:a3];
  BOOL v10 = [(_MLBatchDataSource *)self useForPrediction];
  v11 = [(_MLBatchDataSource *)self nnEngine];
  v12 = [(_MLDataSource *)v7 initWithMLFeatureProvider:v9 forPrediction:v10 neuralNetworkEngine:v11 error:a4];

  if (v12)
  {
    v13 = [(_MLDataSource *)v12 dataPointAtIndex:a3 error:a4];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (_MLBatchDataSource)initWithMLBatchProvider:(id)a3 forPrediction:(BOOL)a4 neuralNetworkEngine:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_MLBatchDataSource;
  v12 = [(_MLBatchDataSource *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_batchProvider, a3);
    objc_storeStrong((id *)&v13->_nnEngine, a5);
    v13->_useForPrediction = a4;
  }

  return v13;
}

@end