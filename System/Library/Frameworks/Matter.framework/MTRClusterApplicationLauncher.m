@interface MTRClusterApplicationLauncher
- (MTRClusterApplicationLauncher)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue;
- (NSDictionary)readAttributeAcceptedCommandListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAttributeListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeCatalogListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeClusterRevisionWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeCurrentAppWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeFeatureMapWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeGeneratedCommandListWithParams:(MTRReadParams *)params;
- (id)readAttributeEventListWithParams:(id)a3;
- (void)hideAppWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5;
- (void)hideAppWithParams:(MTRApplicationLauncherClusterHideAppParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion;
- (void)hideAppWithParams:(MTRApplicationLauncherClusterHideAppParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler;
- (void)launchAppWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5;
- (void)launchAppWithParams:(MTRApplicationLauncherClusterLaunchAppParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion;
- (void)launchAppWithParams:(MTRApplicationLauncherClusterLaunchAppParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler;
- (void)stopAppWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5;
- (void)stopAppWithParams:(MTRApplicationLauncherClusterStopAppParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion;
- (void)stopAppWithParams:(MTRApplicationLauncherClusterStopAppParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler;
- (void)writeAttributeCurrentAppWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeCurrentAppWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
@end

@implementation MTRClusterApplicationLauncher

- (void)launchAppWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5
{
}

- (void)launchAppWithParams:(MTRApplicationLauncherClusterLaunchAppParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  v10 = params;
  v33 = expectedDataValueDictionaries;
  v11 = expectedValueIntervalMs;
  v12 = completion;
  v32 = v12;
  if (!v10) {
    v10 = objc_alloc_init(MTRApplicationLauncherClusterLaunchAppParams);
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_244C5B6D0;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_26F9CD048, &unk_26F9CB500, v10, v33, v11, v17, v26, v27, v30, v14, v32);
}

- (void)stopAppWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5
{
}

- (void)stopAppWithParams:(MTRApplicationLauncherClusterStopAppParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  v10 = params;
  v33 = expectedDataValueDictionaries;
  v11 = expectedValueIntervalMs;
  v12 = completion;
  v32 = v12;
  if (!v10) {
    v10 = objc_alloc_init(MTRApplicationLauncherClusterStopAppParams);
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_244C5B918;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_26F9CD048, &unk_26F9CB590, v10, v33, v11, v17, v26, v27, v30, v14, v32);
}

- (void)hideAppWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5
{
}

- (void)hideAppWithParams:(MTRApplicationLauncherClusterHideAppParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(void *)completion
{
  v10 = params;
  v33 = expectedDataValueDictionaries;
  v11 = expectedValueIntervalMs;
  v12 = completion;
  v32 = v12;
  if (!v10) {
    v10 = objc_alloc_init(MTRApplicationLauncherClusterHideAppParams);
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_244C5BB60;
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
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v20, v31, (uint64_t)v23, &unk_26F9CD048, &unk_26F9CB5A8, v10, v33, v11, v17, v26, v27, v30, v14, v32);
}

- (NSDictionary)readAttributeCatalogListWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD060, &unk_26F9CB440, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeCurrentAppWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD060, &unk_26F9CB548, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeCurrentAppWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeCurrentAppWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  uint64_t v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  v14 = objc_msgSend_device(self, v12, v13);
  v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CD060, &unk_26F9CB548, v19, v8, v11);
}

- (NSDictionary)readAttributeGeneratedCommandListWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD060, &unk_26F9CB458, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcceptedCommandListWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD060, &unk_26F9CB470, v4);

  return (NSDictionary *)v12;
}

- (id)readAttributeEventListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD060, &unk_26F9CB560, v4);

  return v12;
}

- (NSDictionary)readAttributeAttributeListWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD060, &unk_26F9CB488, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeFeatureMapWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD060, &unk_26F9CB4A0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeClusterRevisionWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CD060, &unk_26F9CB4B8, v4);

  return (NSDictionary *)v12;
}

- (MTRClusterApplicationLauncher)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6 = endpoint;
  v8 = device;
  uint64_t v9 = queue;
  v11 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v10, v6);
  uint64_t v13 = (MTRClusterApplicationLauncher *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

- (void)launchAppWithParams:(MTRApplicationLauncherClusterLaunchAppParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler
{
  id v10 = completionHandler;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_244C5C3F0;
  v13[3] = &unk_2651992E8;
  id v14 = v10;
  id v11 = v10;
  objc_msgSend_launchAppWithParams_expectedValues_expectedValueInterval_completion_(self, v12, (uint64_t)params, expectedDataValueDictionaries, expectedValueIntervalMs, v13);
}

- (void)stopAppWithParams:(MTRApplicationLauncherClusterStopAppParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler
{
  id v10 = completionHandler;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_244C5C4D4;
  v13[3] = &unk_2651992E8;
  id v14 = v10;
  id v11 = v10;
  objc_msgSend_stopAppWithParams_expectedValues_expectedValueInterval_completion_(self, v12, (uint64_t)params, expectedDataValueDictionaries, expectedValueIntervalMs, v13);
}

- (void)hideAppWithParams:(MTRApplicationLauncherClusterHideAppParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(void *)completionHandler
{
  id v10 = completionHandler;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_244C5C5B8;
  v13[3] = &unk_2651992E8;
  id v14 = v10;
  id v11 = v10;
  objc_msgSend_hideAppWithParams_expectedValues_expectedValueInterval_completion_(self, v12, (uint64_t)params, expectedDataValueDictionaries, expectedValueIntervalMs, v13);
}

@end