@interface MTRClusterChannel
- (MTRClusterChannel)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue;
- (NSDictionary)readAttributeAcceptedCommandListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAttributeListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeChannelListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeClusterRevisionWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeCurrentChannelWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeFeatureMapWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeGeneratedCommandListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeLineupWithParams:(MTRReadParams *)params;
- (id)readAttributeEventListWithParams:(id)a3;
- (void)cancelRecordProgramWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)changeChannelByNumberWithParams:(MTRChannelClusterChangeChannelByNumberParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)changeChannelByNumberWithParams:(MTRChannelClusterChangeChannelByNumberParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)changeChannelWithParams:(MTRChannelClusterChangeChannelParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion;
- (void)changeChannelWithParams:(MTRChannelClusterChangeChannelParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler;
- (void)getProgramGuideWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5;
- (void)getProgramGuideWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)recordProgramWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)skipChannelWithParams:(MTRChannelClusterSkipChannelParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)skipChannelWithParams:(MTRChannelClusterSkipChannelParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
@end

@implementation MTRClusterChannel

- (void)changeChannelWithParams:(MTRChannelClusterChangeChannelParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  v10 = params;
  v33 = expectedDataValueDictionaries;
  v11 = expectedValueIntervalMs;
  v12 = completion;
  v32 = v12;
  if (!v10) {
    v10 = objc_alloc_init(MTRChannelClusterChangeChannelParams);
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_244C528B8;
  v34[3] = &unk_265198C08;
  id v13 = v12;
  id v35 = v13;
  v14 = (void *)MEMORY[0x2456969D0](v34);
  v17 = objc_msgSend_timedInvokeTimeoutMs(v10, v15, v16);
  v20 = objc_msgSend_device(self, v18, v19);
  v23 = objc_msgSend_endpointID(self, v21, v22);
  v26 = objc_msgSend_serverSideProcessingTimeout(v10, v24, v25);
  uint64_t v27 = objc_opt_class();
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_26F9CCEC8, &unk_26F9CB500, v10, v33, v11, v17, v26, v27, v30, v14, v32);
}

- (void)changeChannelByNumberWithParams:(MTRChannelClusterChangeChannelByNumberParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRChannelClusterChangeChannelByNumberParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C52AD4;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCEC8, &unk_26F9CB5A8, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)skipChannelWithParams:(MTRChannelClusterSkipChannelParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRChannelClusterSkipChannelParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C52CF4;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCEC8, &unk_26F9CB5C0, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)getProgramGuideWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5
{
}

- (void)getProgramGuideWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRChannelClusterGetProgramGuideParams *)a3;
  id v33 = a4;
  id v11 = a5;
  id v12 = a6;
  id v32 = v12;
  if (!v10) {
    v10 = objc_alloc_init(MTRChannelClusterGetProgramGuideParams);
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_244C52F40;
  v34[3] = &unk_265198C08;
  id v13 = v12;
  id v35 = v13;
  id v14 = (void *)MEMORY[0x2456969D0](v34);
  uint64_t v17 = objc_msgSend_timedInvokeTimeoutMs(v10, v15, v16);
  uint64_t v20 = objc_msgSend_device(self, v18, v19);
  uint64_t v23 = objc_msgSend_endpointID(self, v21, v22);
  uint64_t v26 = objc_msgSend_serverSideProcessingTimeout(v10, v24, v25);
  uint64_t v27 = objc_opt_class();
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_26F9CCEC8, &unk_26F9CB5D8, v10, v33, v11, v17, v26, v27, v30, v14, v32);
}

- (void)recordProgramWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRChannelClusterRecordProgramParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTRChannelClusterRecordProgramParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C5315C;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCEC8, &unk_26F9CB6F8, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)cancelRecordProgramWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTRChannelClusterCancelRecordProgramParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTRChannelClusterCancelRecordProgramParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C5337C;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCEC8, &unk_26F9CB710, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (NSDictionary)readAttributeChannelListWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCEE0, &unk_26F9CB440, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeLineupWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCEE0, &unk_26F9CB548, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeCurrentChannelWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCEE0, &unk_26F9CB758, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeGeneratedCommandListWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCEE0, &unk_26F9CB458, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcceptedCommandListWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCEE0, &unk_26F9CB470, v4);

  return (NSDictionary *)v12;
}

- (id)readAttributeEventListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCEE0, &unk_26F9CB560, v4);

  return v12;
}

- (NSDictionary)readAttributeAttributeListWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCEE0, &unk_26F9CB488, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeFeatureMapWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCEE0, &unk_26F9CB4A0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeClusterRevisionWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCEE0, &unk_26F9CB4B8, v4);

  return (NSDictionary *)v12;
}

- (MTRClusterChannel)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6 = endpoint;
  v8 = device;
  uint64_t v9 = queue;
  id v11 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v10, v6);
  id v13 = (MTRClusterChannel *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

- (void)changeChannelWithParams:(MTRChannelClusterChangeChannelParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler
{
  id v10 = completionHandler;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_244C53BC4;
  v13[3] = &unk_2651991A8;
  id v14 = v10;
  id v11 = v10;
  objc_msgSend_changeChannelWithParams_expectedValues_expectedValueInterval_completion_(self, v12, (uint64_t)params, expectedDataValueDictionaries, expectedValueIntervalMs, v13);
}

- (void)changeChannelByNumberWithParams:(MTRChannelClusterChangeChannelByNumberParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)skipChannelWithParams:(MTRChannelClusterSkipChannelParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

@end