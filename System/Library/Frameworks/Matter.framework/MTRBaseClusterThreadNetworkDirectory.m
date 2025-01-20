@interface MTRBaseClusterThreadNetworkDirectory
+ (void)readAttributeAcceptedCommandListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeAttributeListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeClusterRevisionWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeEventListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeFeatureMapWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeGeneratedCommandListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributePreferredExtendedPanIDWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeThreadNetworkTableSizeWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeThreadNetworksWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)addNetworkWithParams:(id)a3 completion:(id)a4;
- (void)getOperationalDatasetWithParams:(id)a3 completion:(id)a4;
- (void)readAttributeAcceptedCommandListWithCompletion:(id)a3;
- (void)readAttributeAttributeListWithCompletion:(id)a3;
- (void)readAttributeClusterRevisionWithCompletion:(id)a3;
- (void)readAttributeEventListWithCompletion:(id)a3;
- (void)readAttributeFeatureMapWithCompletion:(id)a3;
- (void)readAttributeGeneratedCommandListWithCompletion:(id)a3;
- (void)readAttributePreferredExtendedPanIDWithCompletion:(id)a3;
- (void)readAttributeThreadNetworkTableSizeWithCompletion:(id)a3;
- (void)readAttributeThreadNetworksWithCompletion:(id)a3;
- (void)removeNetworkWithParams:(id)a3 completion:(id)a4;
- (void)subscribeAttributeAcceptedCommandListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeAttributeListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeClusterRevisionWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeEventListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeFeatureMapWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeGeneratedCommandListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributePreferredExtendedPanIDWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeThreadNetworkTableSizeWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeThreadNetworksWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)writeAttributePreferredExtendedPanIDWithValue:(id)a3 completion:(id)a4;
- (void)writeAttributePreferredExtendedPanIDWithValue:(id)a3 params:(id)a4 completion:(id)a5;
@end

@implementation MTRBaseClusterThreadNetworkDirectory

- (void)addNetworkWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTRThreadNetworkDirectoryClusterAddNetworkParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTRThreadNetworkDirectoryClusterAddNetworkParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A44230;
  v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v26, (uint64_t)v19, &unk_26F9C9FD0, &unk_26F9C87D0, v6, v15, v22, 0, v25, v9, v27, v28, v29, v30);
}

- (void)removeNetworkWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTRThreadNetworkDirectoryClusterRemoveNetworkParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTRThreadNetworkDirectoryClusterRemoveNetworkParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A44428;
  v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v26, (uint64_t)v19, &unk_26F9C9FD0, &unk_26F9C8848, v6, v15, v22, 0, v25, v9, v27, v28, v29, v30);
}

- (void)getOperationalDatasetWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTRThreadNetworkDirectoryClusterGetOperationalDatasetParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTRThreadNetworkDirectoryClusterGetOperationalDatasetParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A44624;
  v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  uint64_t v18 = objc_msgSend_endpointID(self, v16, v17);
  uint64_t v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9C9FD0, &unk_26F9C8860, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)readAttributePreferredExtendedPanIDWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9FD0, &unk_26F9C8710, 0, v12, v14);
}

- (void)writeAttributePreferredExtendedPanIDWithValue:(id)a3 completion:(id)a4
{
}

- (void)writeAttributePreferredExtendedPanIDWithValue:(id)a3 params:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributePreferredExtendedPanIDWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9FD0, &unk_26F9C8710, v20, v18, v9, v8);
}

+ (void)readAttributePreferredExtendedPanIDWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1107, 0, v10, v11);
}

- (void)readAttributeThreadNetworksWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9FD0, &unk_26F9C8800, 0, v12, v14);
}

- (void)subscribeAttributeThreadNetworksWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9FD0, &unk_26F9C8800, v20, v18, v9, v8);
}

+ (void)readAttributeThreadNetworksWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1107, 1, v10, v11);
}

- (void)readAttributeThreadNetworkTableSizeWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9FD0, &unk_26F9C89C8, 0, v12, v14);
}

- (void)subscribeAttributeThreadNetworkTableSizeWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9FD0, &unk_26F9C89C8, v20, v18, v9, v8);
}

+ (void)readAttributeThreadNetworkTableSizeWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1107, 2, v10, v11);
}

- (void)readAttributeGeneratedCommandListWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9FD0, &unk_26F9C8728, 0, v12, v14);
}

- (void)subscribeAttributeGeneratedCommandListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9FD0, &unk_26F9C8728, v20, v18, v9, v8);
}

+ (void)readAttributeGeneratedCommandListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1107, 65528, v10, v11);
}

- (void)readAttributeAcceptedCommandListWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9FD0, &unk_26F9C8740, 0, v12, v14);
}

- (void)subscribeAttributeAcceptedCommandListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9FD0, &unk_26F9C8740, v20, v18, v9, v8);
}

+ (void)readAttributeAcceptedCommandListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1107, 65529, v10, v11);
}

- (void)readAttributeEventListWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9FD0, &unk_26F9C8818, 0, v12, v14);
}

- (void)subscribeAttributeEventListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9FD0, &unk_26F9C8818, v20, v18, v9, v8);
}

+ (void)readAttributeEventListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1107, 65530, v10, v11);
}

- (void)readAttributeAttributeListWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9FD0, &unk_26F9C8758, 0, v12, v14);
}

- (void)subscribeAttributeAttributeListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9FD0, &unk_26F9C8758, v20, v18, v9, v8);
}

+ (void)readAttributeAttributeListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1107, 65531, v10, v11);
}

- (void)readAttributeFeatureMapWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9FD0, &unk_26F9C8770, 0, v12, v14);
}

- (void)subscribeAttributeFeatureMapWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9FD0, &unk_26F9C8770, v20, v18, v9, v8);
}

+ (void)readAttributeFeatureMapWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1107, 65532, v10, v11);
}

- (void)readAttributeClusterRevisionWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C9FD0, &unk_26F9C8788, 0, v12, v14);
}

- (void)subscribeAttributeClusterRevisionWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C9FD0, &unk_26F9C8788, v20, v18, v9, v8);
}

+ (void)readAttributeClusterRevisionWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 1107, 65533, v10, v11);
}

@end