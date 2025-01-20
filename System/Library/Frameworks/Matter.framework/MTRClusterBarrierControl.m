@interface MTRClusterBarrierControl
- (MTRClusterBarrierControl)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue;
- (NSDictionary)readAttributeAcceptedCommandListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAttributeListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBarrierCapabilitiesWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBarrierCloseEventsWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBarrierClosePeriodWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBarrierCommandCloseEventsWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBarrierCommandOpenEventsWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBarrierMovingStateWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBarrierOpenEventsWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBarrierOpenPeriodWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBarrierPositionWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBarrierSafetyStatusWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeClusterRevisionWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeFeatureMapWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeGeneratedCommandListWithParams:(MTRReadParams *)params;
- (void)barrierControlGoToPercentWithParams:(MTRBarrierControlClusterBarrierControlGoToPercentParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)barrierControlGoToPercentWithParams:(MTRBarrierControlClusterBarrierControlGoToPercentParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)barrierControlStopWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)barrierControlStopWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)barrierControlStopWithParams:(MTRBarrierControlClusterBarrierControlStopParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)barrierControlStopWithParams:(MTRBarrierControlClusterBarrierControlStopParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeBarrierCloseEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeBarrierCloseEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeBarrierClosePeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeBarrierClosePeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeBarrierCommandCloseEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeBarrierCommandCloseEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeBarrierCommandOpenEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeBarrierCommandOpenEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeBarrierOpenEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeBarrierOpenEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
- (void)writeAttributeBarrierOpenPeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs;
- (void)writeAttributeBarrierOpenPeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params;
@end

@implementation MTRClusterBarrierControl

- (void)barrierControlGoToPercentWithParams:(MTRBarrierControlClusterBarrierControlGoToPercentParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v7 = completion;
  v10 = objc_msgSend_callbackQueue(self, v8, v9);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B42AD4;
  block[3] = &unk_265194E00;
  id v13 = v7;
  id v11 = v7;
  dispatch_async(v10, block);
}

- (void)barrierControlStopWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
}

- (void)barrierControlStopWithParams:(MTRBarrierControlClusterBarrierControlStopParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v7 = completion;
  v10 = objc_msgSend_callbackQueue(self, v8, v9);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B42C28;
  block[3] = &unk_265194E00;
  id v13 = v7;
  id v11 = v7;
  dispatch_async(v10, block);
}

- (NSDictionary)readAttributeBarrierMovingStateWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA750, &unk_26F9CA768, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeBarrierSafetyStatusWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA750, &unk_26F9CA780, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeBarrierCapabilitiesWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA750, &unk_26F9CA798, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeBarrierOpenEventsWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA750, &unk_26F9CA678, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeBarrierOpenEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeBarrierOpenEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  v14 = objc_msgSend_device(self, v12, v13);
  v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CA750, &unk_26F9CA678, v19, v8, v11);
}

- (NSDictionary)readAttributeBarrierCloseEventsWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA750, &unk_26F9CA7B0, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeBarrierCloseEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeBarrierCloseEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  v14 = objc_msgSend_device(self, v12, v13);
  v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CA750, &unk_26F9CA7B0, v19, v8, v11);
}

- (NSDictionary)readAttributeBarrierCommandOpenEventsWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA750, &unk_26F9CA7C8, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeBarrierCommandOpenEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeBarrierCommandOpenEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  v14 = objc_msgSend_device(self, v12, v13);
  v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CA750, &unk_26F9CA7C8, v19, v8, v11);
}

- (NSDictionary)readAttributeBarrierCommandCloseEventsWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA750, &unk_26F9CA5A0, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeBarrierCommandCloseEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeBarrierCommandCloseEventsWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  v14 = objc_msgSend_device(self, v12, v13);
  v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CA750, &unk_26F9CA5A0, v19, v8, v11);
}

- (NSDictionary)readAttributeBarrierOpenPeriodWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA750, &unk_26F9CA7E0, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeBarrierOpenPeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeBarrierOpenPeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  v14 = objc_msgSend_device(self, v12, v13);
  v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CA750, &unk_26F9CA7E0, v19, v8, v11);
}

- (NSDictionary)readAttributeBarrierClosePeriodWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA750, &unk_26F9CA7F8, v4);

  return (NSDictionary *)v12;
}

- (void)writeAttributeBarrierClosePeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs
{
}

- (void)writeAttributeBarrierClosePeriodWithValue:(NSDictionary *)dataValueDictionary expectedValueInterval:(NSNumber *)expectedValueIntervalMs params:(MTRWriteParams *)params
{
  v19 = dataValueDictionary;
  v8 = expectedValueIntervalMs;
  id v11 = objc_msgSend_timedWriteTimeout(params, v9, v10);
  v14 = objc_msgSend_device(self, v12, v13);
  v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CA750, &unk_26F9CA7F8, v19, v8, v11);
}

- (NSDictionary)readAttributeBarrierPositionWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA750, &unk_26F9CA810, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeGeneratedCommandListWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA750, &unk_26F9CA5E8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcceptedCommandListWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA750, &unk_26F9CA600, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAttributeListWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA750, &unk_26F9CA618, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeFeatureMapWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA750, &unk_26F9CA630, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeClusterRevisionWithParams:(MTRReadParams *)params
{
  v4 = params;
  MTRStatusCompletion v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CA750, &unk_26F9CA648, v4);

  return (NSDictionary *)v12;
}

- (MTRClusterBarrierControl)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6 = endpoint;
  v8 = device;
  uint64_t v9 = queue;
  id v11 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v10, v6);
  uint64_t v13 = (MTRClusterBarrierControl *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

- (void)barrierControlGoToPercentWithParams:(MTRBarrierControlClusterBarrierControlGoToPercentParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)barrierControlStopWithParams:(MTRBarrierControlClusterBarrierControlStopParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)barrierControlStopWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

@end