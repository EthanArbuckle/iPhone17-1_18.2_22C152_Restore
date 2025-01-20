@interface MLPendingPrediction
- (MLPendingPrediction)initWithPredictionRequest:(id)a3 completionHandler:(id)a4;
- (MLPredictionRequest)predictionRequest;
- (id)completionHandler;
@end

@implementation MLPendingPrediction

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_predictionRequest, 0);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (MLPredictionRequest)predictionRequest
{
  return self->_predictionRequest;
}

- (MLPendingPrediction)initWithPredictionRequest:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MLPendingPrediction;
  v9 = [(MLPendingPrediction *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_predictionRequest, a3);
    v11 = _Block_copy(v8);
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = v11;
  }
  return v10;
}

@end