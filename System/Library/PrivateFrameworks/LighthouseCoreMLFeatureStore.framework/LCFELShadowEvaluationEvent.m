@interface LCFELShadowEvaluationEvent
- (LCFELBatchProviderInfo)inputBachProviderInfo;
- (NSArray)evaluatedPredictions;
- (NSError)evaluationError;
- (NSNumber)accuracy;
- (NSNumber)succeeded;
- (NSString)modelName;
- (NSUUID)contextId;
- (NSUUID)eventId;
- (id)init:(id)a3 inputBachProviderInfo:(id)a4 evaluatedPredictions:(id)a5 accuracy:(id)a6 succeeded:(id)a7 evaluationError:(id)a8;
@end

@implementation LCFELShadowEvaluationEvent

- (id)init:(id)a3 inputBachProviderInfo:(id)a4 evaluatedPredictions:(id)a5 accuracy:(id)a6 succeeded:(id)a7 evaluationError:(id)a8
{
  id v26 = a3;
  id v25 = a4;
  id v24 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v27.receiver = self;
  v27.super_class = (Class)LCFELShadowEvaluationEvent;
  v18 = [(LCFELShadowEvaluationEvent *)&v27 init];
  if (v18)
  {
    uint64_t v19 = +[LCFFeatureStoreContextId getContextId];
    contextId = v18->_contextId;
    v18->_contextId = (NSUUID *)v19;

    uint64_t v21 = [MEMORY[0x263F08C38] UUID];
    eventId = v18->_eventId;
    v18->_eventId = (NSUUID *)v21;

    objc_storeStrong((id *)&v18->_modelName, a3);
    objc_storeStrong((id *)&v18->_inputBachProviderInfo, a4);
    objc_storeStrong((id *)&v18->_evaluatedPredictions, a5);
    objc_storeStrong((id *)&v18->_succeeded, a7);
    objc_storeStrong((id *)&v18->_evaluationError, a8);
    objc_storeStrong((id *)&v18->_accuracy, a6);
  }

  return v18;
}

- (NSUUID)contextId
{
  return self->_contextId;
}

- (NSUUID)eventId
{
  return self->_eventId;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (LCFELBatchProviderInfo)inputBachProviderInfo
{
  return self->_inputBachProviderInfo;
}

- (NSArray)evaluatedPredictions
{
  return self->_evaluatedPredictions;
}

- (NSNumber)accuracy
{
  return self->_accuracy;
}

- (NSNumber)succeeded
{
  return self->_succeeded;
}

- (NSError)evaluationError
{
  return self->_evaluationError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluationError, 0);
  objc_storeStrong((id *)&self->_succeeded, 0);
  objc_storeStrong((id *)&self->_accuracy, 0);
  objc_storeStrong((id *)&self->_evaluatedPredictions, 0);
  objc_storeStrong((id *)&self->_inputBachProviderInfo, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_contextId, 0);
}

@end