@interface MTRBaseClusterDemandResponseLoadControl
+ (void)readAttributeAcceptedCommandListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeActiveEventsWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeAttributeListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeClusterRevisionWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeDefaultRandomDurationWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeDefaultRandomStartWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeEventListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeEventsWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeFeatureMapWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeGeneratedCommandListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeLoadControlProgramsWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeNumberOfEventsPerProgramWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeNumberOfLoadControlProgramsWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeNumberOfTransitionsWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)addLoadControlEventRequestWithParams:(id)a3 completion:(id)a4;
- (void)clearLoadControlEventsRequestWithCompletion:(id)a3;
- (void)clearLoadControlEventsRequestWithParams:(id)a3 completion:(id)a4;
- (void)readAttributeAcceptedCommandListWithCompletion:(id)a3;
- (void)readAttributeActiveEventsWithCompletion:(id)a3;
- (void)readAttributeAttributeListWithCompletion:(id)a3;
- (void)readAttributeClusterRevisionWithCompletion:(id)a3;
- (void)readAttributeDefaultRandomDurationWithCompletion:(id)a3;
- (void)readAttributeDefaultRandomStartWithCompletion:(id)a3;
- (void)readAttributeEventListWithCompletion:(id)a3;
- (void)readAttributeEventsWithCompletion:(id)a3;
- (void)readAttributeFeatureMapWithCompletion:(id)a3;
- (void)readAttributeGeneratedCommandListWithCompletion:(id)a3;
- (void)readAttributeLoadControlProgramsWithCompletion:(id)a3;
- (void)readAttributeNumberOfEventsPerProgramWithCompletion:(id)a3;
- (void)readAttributeNumberOfLoadControlProgramsWithCompletion:(id)a3;
- (void)readAttributeNumberOfTransitionsWithCompletion:(id)a3;
- (void)registerLoadControlProgramRequestWithParams:(id)a3 completion:(id)a4;
- (void)removeLoadControlEventRequestWithParams:(id)a3 completion:(id)a4;
- (void)subscribeAttributeAcceptedCommandListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeActiveEventsWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeAttributeListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeClusterRevisionWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeDefaultRandomDurationWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeDefaultRandomStartWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeEventListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeEventsWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeFeatureMapWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeGeneratedCommandListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeLoadControlProgramsWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeNumberOfEventsPerProgramWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeNumberOfLoadControlProgramsWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeNumberOfTransitionsWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)unregisterLoadControlProgramRequestWithParams:(id)a3 completion:(id)a4;
- (void)writeAttributeDefaultRandomDurationWithValue:(id)a3 completion:(id)a4;
- (void)writeAttributeDefaultRandomDurationWithValue:(id)a3 params:(id)a4 completion:(id)a5;
- (void)writeAttributeDefaultRandomStartWithValue:(id)a3 completion:(id)a4;
- (void)writeAttributeDefaultRandomStartWithValue:(id)a3 params:(id)a4 completion:(id)a5;
@end

@implementation MTRBaseClusterDemandResponseLoadControl

- (void)registerLoadControlProgramRequestWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTRDemandResponseLoadControlClusterRegisterLoadControlProgramRequestParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTRDemandResponseLoadControlClusterRegisterLoadControlProgramRequestParams);
  }
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = sub_2449601E4;
  v29 = &unk_265198C08;
  id v8 = v7;
  id v30 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v26);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  v24 = objc_msgSend_callbackQueue(self, v22, v23);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_26F9C9598, &unk_26F9C87D0, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);
}

- (void)unregisterLoadControlProgramRequestWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTRDemandResponseLoadControlClusterUnregisterLoadControlProgramRequestParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTRDemandResponseLoadControlClusterUnregisterLoadControlProgramRequestParams);
  }
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = sub_2449603D0;
  v29 = &unk_265198C08;
  id v8 = v7;
  id v30 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v26);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  v24 = objc_msgSend_callbackQueue(self, v22, v23);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_26F9C9598, &unk_26F9C8848, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);
}

- (void)addLoadControlEventRequestWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTRDemandResponseLoadControlClusterAddLoadControlEventRequestParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTRDemandResponseLoadControlClusterAddLoadControlEventRequestParams);
  }
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = sub_2449605BC;
  v29 = &unk_265198C08;
  id v8 = v7;
  id v30 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v26);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  v24 = objc_msgSend_callbackQueue(self, v22, v23);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_26F9C9598, &unk_26F9C8860, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);
}

- (void)removeLoadControlEventRequestWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTRDemandResponseLoadControlClusterRemoveLoadControlEventRequestParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTRDemandResponseLoadControlClusterRemoveLoadControlEventRequestParams);
  }
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = sub_2449607A8;
  v29 = &unk_265198C08;
  id v8 = v7;
  id v30 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v26);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  v24 = objc_msgSend_callbackQueue(self, v22, v23);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_26F9C9598, &unk_26F9C8878, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);
}

- (void)clearLoadControlEventsRequestWithCompletion:(id)a3
{
}

- (void)clearLoadControlEventsRequestWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTRDemandResponseLoadControlClusterClearLoadControlEventsRequestParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTRDemandResponseLoadControlClusterClearLoadControlEventsRequestParams);
  }
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = sub_2449609A0;
  v29 = &unk_265198C08;
  id v8 = v7;
  id v30 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v26);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  v24 = objc_msgSend_callbackQueue(self, v22, v23);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_26F9C9598, &unk_26F9C8890, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);
}

- (void)readAttributeLoadControlProgramsWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9598, &unk_26F9C8710, 0, v12, v14);
}

- (void)subscribeAttributeLoadControlProgramsWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9598, &unk_26F9C8710, v20, v18, v9, v8);
}

+ (void)readAttributeLoadControlProgramsWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 150, 0, v10, v11);
}

- (void)readAttributeNumberOfLoadControlProgramsWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9598, &unk_26F9C8800, 0, v12, v14);
}

- (void)subscribeAttributeNumberOfLoadControlProgramsWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9598, &unk_26F9C8800, v20, v18, v9, v8);
}

+ (void)readAttributeNumberOfLoadControlProgramsWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 150, 1, v10, v11);
}

- (void)readAttributeEventsWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9598, &unk_26F9C89C8, 0, v12, v14);
}

- (void)subscribeAttributeEventsWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9598, &unk_26F9C89C8, v20, v18, v9, v8);
}

+ (void)readAttributeEventsWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 150, 2, v10, v11);
}

- (void)readAttributeActiveEventsWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9598, &unk_26F9C89E0, 0, v12, v14);
}

- (void)subscribeAttributeActiveEventsWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9598, &unk_26F9C89E0, v20, v18, v9, v8);
}

+ (void)readAttributeActiveEventsWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 150, 3, v10, v11);
}

- (void)readAttributeNumberOfEventsPerProgramWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9598, &unk_26F9C89F8, 0, v12, v14);
}

- (void)subscribeAttributeNumberOfEventsPerProgramWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9598, &unk_26F9C89F8, v20, v18, v9, v8);
}

+ (void)readAttributeNumberOfEventsPerProgramWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 150, 4, v10, v11);
}

- (void)readAttributeNumberOfTransitionsWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9598, &unk_26F9C8A10, 0, v12, v14);
}

- (void)subscribeAttributeNumberOfTransitionsWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9598, &unk_26F9C8A10, v20, v18, v9, v8);
}

+ (void)readAttributeNumberOfTransitionsWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 150, 5, v10, v11);
}

- (void)readAttributeDefaultRandomStartWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9598, &unk_26F9C8A28, 0, v12, v14);
}

- (void)writeAttributeDefaultRandomStartWithValue:(id)a3 completion:(id)a4
{
}

- (void)writeAttributeDefaultRandomStartWithValue:(id)a3 params:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeDefaultRandomStartWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9598, &unk_26F9C8A28, v20, v18, v9, v8);
}

+ (void)readAttributeDefaultRandomStartWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 150, 6, v10, v11);
}

- (void)readAttributeDefaultRandomDurationWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9598, &unk_26F9C8BC0, 0, v12, v14);
}

- (void)writeAttributeDefaultRandomDurationWithValue:(id)a3 completion:(id)a4
{
}

- (void)writeAttributeDefaultRandomDurationWithValue:(id)a3 params:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeDefaultRandomDurationWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9598, &unk_26F9C8BC0, v20, v18, v9, v8);
}

+ (void)readAttributeDefaultRandomDurationWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 150, 7, v10, v11);
}

- (void)readAttributeGeneratedCommandListWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9598, &unk_26F9C8728, 0, v12, v14);
}

- (void)subscribeAttributeGeneratedCommandListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9598, &unk_26F9C8728, v20, v18, v9, v8);
}

+ (void)readAttributeGeneratedCommandListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 150, 65528, v10, v11);
}

- (void)readAttributeAcceptedCommandListWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9598, &unk_26F9C8740, 0, v12, v14);
}

- (void)subscribeAttributeAcceptedCommandListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9598, &unk_26F9C8740, v20, v18, v9, v8);
}

+ (void)readAttributeAcceptedCommandListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 150, 65529, v10, v11);
}

- (void)readAttributeEventListWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9598, &unk_26F9C8818, 0, v12, v14);
}

- (void)subscribeAttributeEventListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9598, &unk_26F9C8818, v20, v18, v9, v8);
}

+ (void)readAttributeEventListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 150, 65530, v10, v11);
}

- (void)readAttributeAttributeListWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9598, &unk_26F9C8758, 0, v12, v14);
}

- (void)subscribeAttributeAttributeListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9598, &unk_26F9C8758, v20, v18, v9, v8);
}

+ (void)readAttributeAttributeListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 150, 65531, v10, v11);
}

- (void)readAttributeFeatureMapWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9598, &unk_26F9C8770, 0, v12, v14);
}

- (void)subscribeAttributeFeatureMapWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9598, &unk_26F9C8770, v20, v18, v9, v8);
}

+ (void)readAttributeFeatureMapWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 150, 65532, v10, v11);
}

- (void)readAttributeClusterRevisionWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9598, &unk_26F9C8788, 0, v12, v14);
}

- (void)subscribeAttributeClusterRevisionWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9598, &unk_26F9C8788, v20, v18, v9, v8);
}

+ (void)readAttributeClusterRevisionWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 150, 65533, v10, v11);
}

@end