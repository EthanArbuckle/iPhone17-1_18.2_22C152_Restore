@interface LCFELFeatureImportanceEvent
- (LCFELBatchProviderInfo)inputBachProviderInfo;
- (NSArray)results;
- (NSError)analysisError;
- (NSNumber)succeeded;
- (NSString)targetLabelFeatureName;
- (NSUUID)contextId;
- (NSUUID)eventId;
- (id)init:(id)a3 targetLabelFeatureName:(id)a4 results:(id)a5 succeeded:(id)a6 analysisError:(id)a7;
@end

@implementation LCFELFeatureImportanceEvent

- (id)init:(id)a3 targetLabelFeatureName:(id)a4 results:(id)a5 succeeded:(id)a6 analysisError:(id)a7
{
  id v23 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)LCFELFeatureImportanceEvent;
  v17 = [(LCFELFeatureImportanceEvent *)&v24 init];
  if (v17)
  {
    uint64_t v18 = +[LCFFeatureStoreContextId getContextId];
    contextId = v17->_contextId;
    v17->_contextId = (NSUUID *)v18;

    uint64_t v20 = [MEMORY[0x263F08C38] UUID];
    eventId = v17->_eventId;
    v17->_eventId = (NSUUID *)v20;

    objc_storeStrong((id *)&v17->_inputBachProviderInfo, a3);
    objc_storeStrong((id *)&v17->_targetLabelFeatureName, a4);
    objc_storeStrong((id *)&v17->_results, a5);
    objc_storeStrong((id *)&v17->_succeeded, a6);
    objc_storeStrong((id *)&v17->_analysisError, a7);
  }

  return v17;
}

- (NSUUID)contextId
{
  return self->_contextId;
}

- (NSUUID)eventId
{
  return self->_eventId;
}

- (LCFELBatchProviderInfo)inputBachProviderInfo
{
  return self->_inputBachProviderInfo;
}

- (NSString)targetLabelFeatureName
{
  return self->_targetLabelFeatureName;
}

- (NSArray)results
{
  return self->_results;
}

- (NSNumber)succeeded
{
  return self->_succeeded;
}

- (NSError)analysisError
{
  return self->_analysisError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisError, 0);
  objc_storeStrong((id *)&self->_succeeded, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_targetLabelFeatureName, 0);
  objc_storeStrong((id *)&self->_inputBachProviderInfo, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_contextId, 0);
}

@end