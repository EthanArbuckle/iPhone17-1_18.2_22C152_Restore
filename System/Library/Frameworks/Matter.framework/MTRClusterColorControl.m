@interface MTRClusterColorControl
- (MTRClusterColorControl)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue;
- (NSDictionary)readAttributeAcceptedCommandListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAttributeListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeClusterRevisionWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeColorCapabilitiesWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeColorLoopActiveWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeColorLoopDirectionWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeColorLoopStartEnhancedHueWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeColorLoopStoredEnhancedHueWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeColorLoopTimeWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeColorModeWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeColorPointBIntensityWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeColorPointBXWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeColorPointBYWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeColorPointGIntensityWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeColorPointGXWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeColorPointGYWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeColorPointRIntensityWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeColorPointRXWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeColorPointRYWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeColorTempPhysicalMaxMiredsWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeColorTempPhysicalMinMiredsWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeColorTemperatureMiredsWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeCompensationTextWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeCoupleColorTempToLevelMinMiredsWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeCurrentHueWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeCurrentSaturationWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeCurrentXWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeCurrentYWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDriftCompensationWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeEnhancedColorModeWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeEnhancedCurrentHueWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeFeatureMapWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeGeneratedCommandListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeNumberOfPrimariesWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeOptionsWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePrimary1IntensityWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePrimary1XWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePrimary1YWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePrimary2IntensityWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePrimary2XWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePrimary2YWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePrimary3IntensityWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePrimary3XWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePrimary3YWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePrimary4IntensityWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePrimary4XWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePrimary4YWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePrimary5IntensityWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePrimary5XWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePrimary5YWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePrimary6IntensityWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePrimary6XWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePrimary6YWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRemainingTimeWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeStartUpColorTemperatureMiredsWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeWhitePointXWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeWhitePointYWithParams:(MTRReadParams *)params;
- (id)readAttributeEventListWithParams:(id)a3;
- (void)colorLoopSetWithParams:(MTRColorControlClusterColorLoopSetParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)colorLoopSetWithParams:(MTRColorControlClusterColorLoopSetParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)enhancedMoveHueWithParams:(MTRColorControlClusterEnhancedMoveHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)enhancedMoveHueWithParams:(MTRColorControlClusterEnhancedMoveHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)enhancedMoveToHueAndSaturationWithParams:(MTRColorControlClusterEnhancedMoveToHueAndSaturationParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)enhancedMoveToHueAndSaturationWithParams:(MTRColorControlClusterEnhancedMoveToHueAndSaturationParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)enhancedMoveToHueWithParams:(MTRColorControlClusterEnhancedMoveToHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)enhancedMoveToHueWithParams:(MTRColorControlClusterEnhancedMoveToHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)enhancedStepHueWithParams:(MTRColorControlClusterEnhancedStepHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)enhancedStepHueWithParams:(MTRColorControlClusterEnhancedStepHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)moveColorTemperatureWithParams:(MTRColorControlClusterMoveColorTemperatureParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)moveColorTemperatureWithParams:(MTRColorControlClusterMoveColorTemperatureParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)moveColorWithParams:(MTRColorControlClusterMoveColorParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)moveColorWithParams:(MTRColorControlClusterMoveColorParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)moveHueWithParams:(MTRColorControlClusterMoveHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)moveHueWithParams:(MTRColorControlClusterMoveHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)moveSaturationWithParams:(MTRColorControlClusterMoveSaturationParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)moveSaturationWithParams:(MTRColorControlClusterMoveSaturationParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)moveToColorTemperatureWithParams:(MTRColorControlClusterMoveToColorTemperatureParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)moveToColorTemperatureWithParams:(MTRColorControlClusterMoveToColorTemperatureParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)moveToColorWithParams:(MTRColorControlClusterMoveToColorParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)moveToColorWithParams:(MTRColorControlClusterMoveToColorParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)moveToHueAndSaturationWithParams:(MTRColorControlClusterMoveToHueAndSaturationParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)moveToHueAndSaturationWithParams:(MTRColorControlClusterMoveToHueAndSaturationParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)moveToHueWithParams:(MTRColorControlClusterMoveToHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)moveToHueWithParams:(MTRColorControlClusterMoveToHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)moveToSaturationWithParams:(MTRColorControlClusterMoveToSaturationParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)moveToSaturationWithParams:(MTRColorControlClusterMoveToSaturationParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)stepColorTemperatureWithParams:(MTRColorControlClusterStepColorTemperatureParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)stepColorTemperatureWithParams:(MTRColorControlClusterStepColorTemperatureParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)stepColorWithParams:(MTRColorControlClusterStepColorParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)stepColorWithParams:(MTRColorControlClusterStepColorParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)stepHueWithParams:(MTRColorControlClusterStepHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)stepHueWithParams:(MTRColorControlClusterStepHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)stepSaturationWithParams:(MTRColorControlClusterStepSaturationParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)stepSaturationWithParams:(MTRColorControlClusterStepSaturationParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)stopMoveStepWithParams:(MTRColorControlClusterStopMoveStepParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)stopMoveStepWithParams:(MTRColorControlClusterStopMoveStepParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeColorPointBIntensityWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeColorPointBIntensityWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeColorPointBXWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeColorPointBXWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeColorPointBYWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeColorPointBYWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeColorPointGIntensityWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeColorPointGIntensityWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeColorPointGXWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeColorPointGXWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeColorPointGYWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeColorPointGYWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeColorPointRIntensityWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeColorPointRIntensityWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeColorPointRXWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeColorPointRXWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeColorPointRYWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeColorPointRYWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeOptionsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeOptionsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeStartUpColorTemperatureMiredsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeStartUpColorTemperatureMiredsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeWhitePointXWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeWhitePointXWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeWhitePointYWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeWhitePointYWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
@end

@implementation MTRClusterColorControl

- (void)moveToHueWithParams:(MTRColorControlClusterMoveToHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRColorControlClusterMoveToHueParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C3B588;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCB20, &unk_26F9CB500, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)moveHueWithParams:(MTRColorControlClusterMoveHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRColorControlClusterMoveHueParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C3B7A8;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCB20, &unk_26F9CB590, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)stepHueWithParams:(MTRColorControlClusterStepHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRColorControlClusterStepHueParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C3B9C8;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCB20, &unk_26F9CB5A8, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)moveToSaturationWithParams:(MTRColorControlClusterMoveToSaturationParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRColorControlClusterMoveToSaturationParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C3BBE8;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCB20, &unk_26F9CB5C0, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)moveSaturationWithParams:(MTRColorControlClusterMoveSaturationParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRColorControlClusterMoveSaturationParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C3BE08;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCB20, &unk_26F9CB5D8, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)stepSaturationWithParams:(MTRColorControlClusterStepSaturationParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRColorControlClusterStepSaturationParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C3C028;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCB20, &unk_26F9CB5F0, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)moveToHueAndSaturationWithParams:(MTRColorControlClusterMoveToHueAndSaturationParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRColorControlClusterMoveToHueAndSaturationParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C3C248;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCB20, &unk_26F9CB6F8, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)moveToColorWithParams:(MTRColorControlClusterMoveToColorParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRColorControlClusterMoveToColorParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C3C468;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCB20, &unk_26F9CB710, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)moveColorWithParams:(MTRColorControlClusterMoveColorParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRColorControlClusterMoveColorParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C3C688;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCB20, &unk_26F9CB728, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)stepColorWithParams:(MTRColorControlClusterStepColorParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRColorControlClusterStepColorParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C3C8A8;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCB20, &unk_26F9CB8A8, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)moveToColorTemperatureWithParams:(MTRColorControlClusterMoveToColorTemperatureParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRColorControlClusterMoveToColorTemperatureParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C3CAC8;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCB20, &unk_26F9CB8C0, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)enhancedMoveToHueWithParams:(MTRColorControlClusterEnhancedMoveToHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRColorControlClusterEnhancedMoveToHueParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C3CCE8;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCB20, &unk_26F9CB518, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)enhancedMoveHueWithParams:(MTRColorControlClusterEnhancedMoveHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRColorControlClusterEnhancedMoveHueParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C3CF08;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCB20, &unk_26F9CB638, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)enhancedStepHueWithParams:(MTRColorControlClusterEnhancedStepHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRColorControlClusterEnhancedStepHueParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C3D128;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCB20, &unk_26F9CB650, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)enhancedMoveToHueAndSaturationWithParams:(MTRColorControlClusterEnhancedMoveToHueAndSaturationParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRColorControlClusterEnhancedMoveToHueAndSaturationParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C3D348;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCB20, &unk_26F9CCB38, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)colorLoopSetWithParams:(MTRColorControlClusterColorLoopSetParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRColorControlClusterColorLoopSetParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C3D568;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCB20, &unk_26F9CCB50, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)stopMoveStepWithParams:(MTRColorControlClusterStopMoveStepParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRColorControlClusterStopMoveStepParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C3D788;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCB20, &unk_26F9CCB68, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)moveColorTemperatureWithParams:(MTRColorControlClusterMoveColorTemperatureParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRColorControlClusterMoveColorTemperatureParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C3D9A8;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCB20, &unk_26F9CCB80, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (void)stepColorTemperatureWithParams:(MTRColorControlClusterStepColorTemperatureParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRColorControlClusterStepColorTemperatureParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244C3DBC8;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CCB20, &unk_26F9CCB98, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (NSDictionary)readAttributeCurrentHueWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB440, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeCurrentSaturationWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB548, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRemainingTimeWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB758, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeCurrentXWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB530, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeCurrentYWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB608, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDriftCompensationWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB770, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeCompensationTextWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB668, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeColorTemperatureMiredsWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB950, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeColorModeWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB740, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeOptionsWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB788, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeOptionsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeOptionsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CCBB0, &unk_26F9CB788, v19, v8, v11);
}

- (NSDictionary)readAttributeNumberOfPrimariesWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB7A0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePrimary1XWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB7B8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePrimary1YWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB7D0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePrimary1IntensityWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB7E8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePrimary2XWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB9F8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePrimary2YWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBA10, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePrimary2IntensityWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBB00, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePrimary3XWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBB30, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePrimary3YWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBB48, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePrimary3IntensityWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBB60, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePrimary4XWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBC98, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePrimary4YWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBCB0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePrimary4IntensityWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBCC8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePrimary5XWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBCF8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePrimary5YWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB8F0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePrimary5IntensityWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBD10, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePrimary6XWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB938, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePrimary6YWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBA40, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePrimary6IntensityWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBA70, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeWhitePointXWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBB90, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeWhitePointXWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeWhitePointXWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CCBB0, &unk_26F9CBB90, v19, v8, v11);
}

- (NSDictionary)readAttributeWhitePointYWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBBC0, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeWhitePointYWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeWhitePointYWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CCBB0, &unk_26F9CBBC0, v19, v8, v11);
}

- (NSDictionary)readAttributeColorPointRXWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBBF0, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeColorPointRXWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeColorPointRXWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CCBB0, &unk_26F9CBBF0, v19, v8, v11);
}

- (NSDictionary)readAttributeColorPointRYWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBC20, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeColorPointRYWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeColorPointRYWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CCBB0, &unk_26F9CBC20, v19, v8, v11);
}

- (NSDictionary)readAttributeColorPointRIntensityWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBC50, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeColorPointRIntensityWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeColorPointRIntensityWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CCBB0, &unk_26F9CBC50, v19, v8, v11);
}

- (NSDictionary)readAttributeColorPointGXWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBD40, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeColorPointGXWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeColorPointGXWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CCBB0, &unk_26F9CBD40, v19, v8, v11);
}

- (NSDictionary)readAttributeColorPointGYWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBD58, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeColorPointGYWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeColorPointGYWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CCBB0, &unk_26F9CBD58, v19, v8, v11);
}

- (NSDictionary)readAttributeColorPointGIntensityWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBD70, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeColorPointGIntensityWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeColorPointGIntensityWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CCBB0, &unk_26F9CBD70, v19, v8, v11);
}

- (NSDictionary)readAttributeColorPointBXWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBDA0, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeColorPointBXWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeColorPointBXWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CCBB0, &unk_26F9CBDA0, v19, v8, v11);
}

- (NSDictionary)readAttributeColorPointBYWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBDB8, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeColorPointBYWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeColorPointBYWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CCBB0, &unk_26F9CBDB8, v19, v8, v11);
}

- (NSDictionary)readAttributeColorPointBIntensityWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CBDD0, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeColorPointBIntensityWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeColorPointBIntensityWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CCBB0, &unk_26F9CBDD0, v19, v8, v11);
}

- (NSDictionary)readAttributeEnhancedCurrentHueWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB680, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeEnhancedColorModeWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB698, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeColorLoopActiveWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB6B0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeColorLoopDirectionWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB6C8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeColorLoopTimeWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CCBC8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeColorLoopStartEnhancedHueWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CCBE0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeColorLoopStoredEnhancedHueWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CCBF8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeColorCapabilitiesWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CCC10, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeColorTempPhysicalMinMiredsWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CCC28, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeColorTempPhysicalMaxMiredsWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CCC40, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeCoupleColorTempToLevelMinMiredsWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CCC58, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeStartUpColorTemperatureMiredsWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CCC70, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeStartUpColorTemperatureMiredsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeStartUpColorTemperatureMiredsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CCBB0, &unk_26F9CCC70, v19, v8, v11);
}

- (NSDictionary)readAttributeGeneratedCommandListWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB458, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcceptedCommandListWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB470, v4);

  return (NSDictionary *)v12;
}

- (id)readAttributeEventListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB560, v4);

  return v12;
}

- (NSDictionary)readAttributeAttributeListWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB488, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeFeatureMapWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB4A0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeClusterRevisionWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCBB0, &unk_26F9CB4B8, v4);

  return (NSDictionary *)v12;
}

- (MTRClusterColorControl)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6 = endpoint;
  v8 = device;
  uint64_t v9 = queue;
  v11 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v10, v6);
  uint64_t v13 = (MTRClusterColorControl *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

- (void)moveToHueWithParams:(MTRColorControlClusterMoveToHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)moveHueWithParams:(MTRColorControlClusterMoveHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)stepHueWithParams:(MTRColorControlClusterStepHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)moveToSaturationWithParams:(MTRColorControlClusterMoveToSaturationParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)moveSaturationWithParams:(MTRColorControlClusterMoveSaturationParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)stepSaturationWithParams:(MTRColorControlClusterStepSaturationParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)moveToHueAndSaturationWithParams:(MTRColorControlClusterMoveToHueAndSaturationParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)moveToColorWithParams:(MTRColorControlClusterMoveToColorParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)moveColorWithParams:(MTRColorControlClusterMoveColorParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)stepColorWithParams:(MTRColorControlClusterStepColorParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)moveToColorTemperatureWithParams:(MTRColorControlClusterMoveToColorTemperatureParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)enhancedMoveToHueWithParams:(MTRColorControlClusterEnhancedMoveToHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)enhancedMoveHueWithParams:(MTRColorControlClusterEnhancedMoveHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)enhancedStepHueWithParams:(MTRColorControlClusterEnhancedStepHueParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)enhancedMoveToHueAndSaturationWithParams:(MTRColorControlClusterEnhancedMoveToHueAndSaturationParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)colorLoopSetWithParams:(MTRColorControlClusterColorLoopSetParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)stopMoveStepWithParams:(MTRColorControlClusterStopMoveStepParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)moveColorTemperatureWithParams:(MTRColorControlClusterMoveColorTemperatureParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)stepColorTemperatureWithParams:(MTRColorControlClusterStepColorTemperatureParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

@end