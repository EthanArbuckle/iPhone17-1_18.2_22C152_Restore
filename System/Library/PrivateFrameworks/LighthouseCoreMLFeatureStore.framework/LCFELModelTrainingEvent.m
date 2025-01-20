@interface LCFELModelTrainingEvent
- (LCFELBatchProviderInfo)bachProviderInfo;
- (NSError)trainingError;
- (NSNumber)succeeded;
- (NSString)modelName;
- (NSUUID)contextId;
- (NSUUID)eventId;
- (id)init:(id)a3 batchProviderInfo:(id)a4 succeeded:(id)a5 trainingError:(id)a6;
@end

@implementation LCFELModelTrainingEvent

- (id)init:(id)a3 batchProviderInfo:(id)a4 succeeded:(id)a5 trainingError:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)LCFELModelTrainingEvent;
  v15 = [(LCFELModelTrainingEvent *)&v21 init];
  if (v15)
  {
    uint64_t v16 = +[LCFFeatureStoreContextId getContextId];
    contextId = v15->_contextId;
    v15->_contextId = (NSUUID *)v16;

    uint64_t v18 = [MEMORY[0x263F08C38] UUID];
    eventId = v15->_eventId;
    v15->_eventId = (NSUUID *)v18;

    objc_storeStrong((id *)&v15->_modelName, a3);
    objc_storeStrong((id *)&v15->_bachProviderInfo, a4);
    objc_storeStrong((id *)&v15->_succeeded, a5);
    objc_storeStrong((id *)&v15->_trainingError, a6);
  }

  return v15;
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

- (LCFELBatchProviderInfo)bachProviderInfo
{
  return self->_bachProviderInfo;
}

- (NSNumber)succeeded
{
  return self->_succeeded;
}

- (NSError)trainingError
{
  return self->_trainingError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainingError, 0);
  objc_storeStrong((id *)&self->_succeeded, 0);
  objc_storeStrong((id *)&self->_bachProviderInfo, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_contextId, 0);
}

@end