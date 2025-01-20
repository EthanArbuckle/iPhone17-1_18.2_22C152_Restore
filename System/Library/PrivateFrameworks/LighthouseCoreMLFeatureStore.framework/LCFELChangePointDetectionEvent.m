@interface LCFELChangePointDetectionEvent
- (LCFELBatchProviderInfo)inputBachProviderInfo;
- (NSArray)results;
- (NSError)analysisError;
- (NSNumber)succeeded;
- (NSUUID)contextId;
- (NSUUID)eventId;
- (id)init:(id)a3 results:(id)a4 succeeded:(id)a5 analysisError:(id)a6;
@end

@implementation LCFELChangePointDetectionEvent

- (id)init:(id)a3 results:(id)a4 succeeded:(id)a5 analysisError:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)LCFELChangePointDetectionEvent;
  v15 = [(LCFELChangePointDetectionEvent *)&v21 init];
  if (v15)
  {
    uint64_t v16 = +[LCFFeatureStoreContextId getContextId];
    contextId = v15->_contextId;
    v15->_contextId = (NSUUID *)v16;

    uint64_t v18 = [MEMORY[0x263F08C38] UUID];
    eventId = v15->_eventId;
    v15->_eventId = (NSUUID *)v18;

    objc_storeStrong((id *)&v15->_inputBachProviderInfo, a3);
    objc_storeStrong((id *)&v15->_results, a4);
    objc_storeStrong((id *)&v15->_succeeded, a5);
    objc_storeStrong((id *)&v15->_analysisError, a6);
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

- (LCFELBatchProviderInfo)inputBachProviderInfo
{
  return self->_inputBachProviderInfo;
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
  objc_storeStrong((id *)&self->_inputBachProviderInfo, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_contextId, 0);
}

@end