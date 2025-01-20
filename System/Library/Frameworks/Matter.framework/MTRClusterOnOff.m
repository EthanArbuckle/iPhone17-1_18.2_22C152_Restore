@interface MTRClusterOnOff
- (MTRClusterOnOff)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue;
- (NSDictionary)readAttributeAcceptedCommandListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAttributeListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeClusterRevisionWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeFeatureMapWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeGeneratedCommandListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeGlobalSceneControlWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeOffWaitTimeWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeOnOffWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeOnTimeWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeStartUpOnOffWithParams:(MTRReadParams *)params;
- (id)readAttributeEventListWithParams:(id)a3;
- (void)offWithEffectWithParams:(MTROnOffClusterOffWithEffectParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)offWithEffectWithParams:(MTROnOffClusterOffWithEffectParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)offWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)offWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)offWithParams:(MTROnOffClusterOffParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)offWithParams:(MTROnOffClusterOffParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)onWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)onWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)onWithParams:(MTROnOffClusterOnParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)onWithParams:(MTROnOffClusterOnParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)onWithRecallGlobalSceneWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)onWithRecallGlobalSceneWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)onWithRecallGlobalSceneWithParams:(MTROnOffClusterOnWithRecallGlobalSceneParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)onWithRecallGlobalSceneWithParams:(MTROnOffClusterOnWithRecallGlobalSceneParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)onWithTimedOffWithParams:(MTROnOffClusterOnWithTimedOffParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)onWithTimedOffWithParams:(MTROnOffClusterOnWithTimedOffParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)toggleWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)toggleWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)toggleWithParams:(MTROnOffClusterToggleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)toggleWithParams:(MTROnOffClusterToggleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeOffWaitTimeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeOffWaitTimeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeOnTimeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeOnTimeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeStartUpOnOffWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeStartUpOnOffWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
@end

@implementation MTRClusterOnOff

- (void)offWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
}

- (void)offWithParams:(MTROnOffClusterOffParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTROnOffClusterOffParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244BE1590;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CB620, &unk_26F9CB500, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)onWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
}

- (void)onWithParams:(MTROnOffClusterOnParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTROnOffClusterOnParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244BE17C4;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CB620, &unk_26F9CB590, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)toggleWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
}

- (void)toggleWithParams:(MTROnOffClusterToggleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTROnOffClusterToggleParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244BE19F8;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CB620, &unk_26F9CB5A8, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)offWithEffectWithParams:(MTROnOffClusterOffWithEffectParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTROnOffClusterOffWithEffectParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244BE1C18;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CB620, &unk_26F9CB518, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)onWithRecallGlobalSceneWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
}

- (void)onWithRecallGlobalSceneWithParams:(MTROnOffClusterOnWithRecallGlobalSceneParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTROnOffClusterOnWithRecallGlobalSceneParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244BE1E4C;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CB620, &unk_26F9CB638, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)onWithTimedOffWithParams:(MTROnOffClusterOnWithTimedOffParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTROnOffClusterOnWithTimedOffParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244BE206C;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CB620, &unk_26F9CB650, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (NSDictionary)readAttributeOnOffWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CB668, &unk_26F9CB440, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeGlobalSceneControlWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CB668, &unk_26F9CB680, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeOnTimeWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CB668, &unk_26F9CB698, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeOnTimeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeOnTimeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CB668, &unk_26F9CB698, v19, v8, v11);
}

- (NSDictionary)readAttributeOffWaitTimeWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CB668, &unk_26F9CB6B0, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeOffWaitTimeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeOffWaitTimeWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CB668, &unk_26F9CB6B0, v19, v8, v11);
}

- (NSDictionary)readAttributeStartUpOnOffWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CB668, &unk_26F9CB6C8, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeStartUpOnOffWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeStartUpOnOffWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CB668, &unk_26F9CB6C8, v19, v8, v11);
}

- (NSDictionary)readAttributeGeneratedCommandListWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CB668, &unk_26F9CB458, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcceptedCommandListWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CB668, &unk_26F9CB470, v4);

  return (NSDictionary *)v12;
}

- (id)readAttributeEventListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CB668, &unk_26F9CB560, v4);

  return v12;
}

- (NSDictionary)readAttributeAttributeListWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CB668, &unk_26F9CB488, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeFeatureMapWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CB668, &unk_26F9CB4A0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeClusterRevisionWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CB668, &unk_26F9CB4B8, v4);

  return (NSDictionary *)v12;
}

- (MTRClusterOnOff)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6 = endpoint;
  v8 = device;
  uint64_t v9 = queue;
  v11 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v10, v6);
  uint64_t v13 = (MTRClusterOnOff *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

- (void)offWithParams:(MTROnOffClusterOffParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)offWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)onWithParams:(MTROnOffClusterOnParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)onWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)toggleWithParams:(MTROnOffClusterToggleParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)toggleWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)offWithEffectWithParams:(MTROnOffClusterOffWithEffectParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)onWithRecallGlobalSceneWithParams:(MTROnOffClusterOnWithRecallGlobalSceneParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)onWithRecallGlobalSceneWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)onWithTimedOffWithParams:(MTROnOffClusterOnWithTimedOffParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

@end