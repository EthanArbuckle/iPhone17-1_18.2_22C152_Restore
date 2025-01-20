@interface MTRBaseClusterSoftwareDiagnostics
+ (void)readAttributeAcceptedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAcceptedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAttributeListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAttributeListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeClusterRevisionWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeClusterRevisionWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeCurrentHeapFreeWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeCurrentHeapFreeWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeCurrentHeapHighWatermarkWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeCurrentHeapHighWatermarkWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeCurrentHeapUsedWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeCurrentHeapUsedWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeEventListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeFeatureMapWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeFeatureMapWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeGeneratedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeGeneratedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeThreadMetricsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeThreadMetricsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
- (MTRBaseClusterSoftwareDiagnostics)initWithDevice:(MTRBaseDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue;
- (void)readAttributeAcceptedCommandListWithCompletion:(void *)completion;
- (void)readAttributeAcceptedCommandListWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAttributeListWithCompletion:(void *)completion;
- (void)readAttributeAttributeListWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeClusterRevisionWithCompletion:(void *)completion;
- (void)readAttributeClusterRevisionWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeCurrentHeapFreeWithCompletion:(void *)completion;
- (void)readAttributeCurrentHeapFreeWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeCurrentHeapHighWatermarkWithCompletion:(void *)completion;
- (void)readAttributeCurrentHeapHighWatermarkWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeCurrentHeapUsedWithCompletion:(void *)completion;
- (void)readAttributeCurrentHeapUsedWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeEventListWithCompletion:(id)a3;
- (void)readAttributeFeatureMapWithCompletion:(void *)completion;
- (void)readAttributeFeatureMapWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeGeneratedCommandListWithCompletion:(void *)completion;
- (void)readAttributeGeneratedCommandListWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeThreadMetricsWithCompletion:(void *)completion;
- (void)readAttributeThreadMetricsWithCompletionHandler:(void *)completionHandler;
- (void)resetWatermarksWithCompletion:(MTRStatusCompletion)completion;
- (void)resetWatermarksWithCompletionHandler:(MTRStatusCompletion)completionHandler;
- (void)resetWatermarksWithParams:(MTRSoftwareDiagnosticsClusterResetWatermarksParams *)params completion:(MTRStatusCompletion)completion;
- (void)resetWatermarksWithParams:(MTRSoftwareDiagnosticsClusterResetWatermarksParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)subscribeAttributeAcceptedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcceptedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAttributeListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAttributeListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeClusterRevisionWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeClusterRevisionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeCurrentHeapFreeWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeCurrentHeapFreeWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeCurrentHeapHighWatermarkWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeCurrentHeapHighWatermarkWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeCurrentHeapUsedWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeCurrentHeapUsedWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeEventListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeFeatureMapWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeFeatureMapWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeGeneratedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeGeneratedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeThreadMetricsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeThreadMetricsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
@end

@implementation MTRBaseClusterSoftwareDiagnostics

- (void)resetWatermarksWithCompletion:(MTRStatusCompletion)completion
{
}

- (void)resetWatermarksWithParams:(MTRSoftwareDiagnosticsClusterResetWatermarksParams *)params completion:(MTRStatusCompletion)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRSoftwareDiagnosticsClusterResetWatermarksParams);
  }
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = sub_2448C63C8;
  v29 = &unk_265198C08;
  id v8 = v7;
  id v30 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v26);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  v24 = objc_msgSend_callbackQueue(self, v22, v23);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_26F9C8E90, &unk_26F9C87D0, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);
}

- (void)readAttributeThreadMetricsWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8E90, &unk_26F9C8710, 0, v12, v14);
}

- (void)subscribeAttributeThreadMetricsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8E90, &unk_26F9C8710, v20, v18, v9, v8);
}

+ (void)readAttributeThreadMetricsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 52, 0, v10, v11);
}

- (void)readAttributeCurrentHeapFreeWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8E90, &unk_26F9C8800, 0, v12, v14);
}

- (void)subscribeAttributeCurrentHeapFreeWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8E90, &unk_26F9C8800, v20, v18, v9, v8);
}

+ (void)readAttributeCurrentHeapFreeWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 52, 1, v10, v11);
}

- (void)readAttributeCurrentHeapUsedWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8E90, &unk_26F9C89C8, 0, v12, v14);
}

- (void)subscribeAttributeCurrentHeapUsedWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8E90, &unk_26F9C89C8, v20, v18, v9, v8);
}

+ (void)readAttributeCurrentHeapUsedWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 52, 2, v10, v11);
}

- (void)readAttributeCurrentHeapHighWatermarkWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8E90, &unk_26F9C89E0, 0, v12, v14);
}

- (void)subscribeAttributeCurrentHeapHighWatermarkWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8E90, &unk_26F9C89E0, v20, v18, v9, v8);
}

+ (void)readAttributeCurrentHeapHighWatermarkWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 52, 3, v10, v11);
}

- (void)readAttributeGeneratedCommandListWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8E90, &unk_26F9C8728, 0, v12, v14);
}

- (void)subscribeAttributeGeneratedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8E90, &unk_26F9C8728, v20, v18, v9, v8);
}

+ (void)readAttributeGeneratedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 52, 65528, v10, v11);
}

- (void)readAttributeAcceptedCommandListWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8E90, &unk_26F9C8740, 0, v12, v14);
}

- (void)subscribeAttributeAcceptedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8E90, &unk_26F9C8740, v20, v18, v9, v8);
}

+ (void)readAttributeAcceptedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 52, 65529, v10, v11);
}

- (void)readAttributeEventListWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8E90, &unk_26F9C8818, 0, v12, v14);
}

- (void)subscribeAttributeEventListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8E90, &unk_26F9C8818, v20, v18, v9, v8);
}

+ (void)readAttributeEventListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 52, 65530, v10, v11);
}

- (void)readAttributeAttributeListWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8E90, &unk_26F9C8758, 0, v12, v14);
}

- (void)subscribeAttributeAttributeListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8E90, &unk_26F9C8758, v20, v18, v9, v8);
}

+ (void)readAttributeAttributeListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 52, 65531, v10, v11);
}

- (void)readAttributeFeatureMapWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8E90, &unk_26F9C8770, 0, v12, v14);
}

- (void)subscribeAttributeFeatureMapWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8E90, &unk_26F9C8770, v20, v18, v9, v8);
}

+ (void)readAttributeFeatureMapWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 52, 65532, v10, v11);
}

- (void)readAttributeClusterRevisionWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8E90, &unk_26F9C8788, 0, v12, v14);
}

- (void)subscribeAttributeClusterRevisionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8E90, &unk_26F9C8788, v20, v18, v9, v8);
}

+ (void)readAttributeClusterRevisionWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 52, 65533, v10, v11);
}

- (void)resetWatermarksWithParams:(MTRSoftwareDiagnosticsClusterResetWatermarksParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)resetWatermarksWithCompletionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)readAttributeThreadMetricsWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448C8068;
  v7[3] = &unk_265198C80;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeThreadMetricsWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeThreadMetricsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448C81E8;
  v26[3] = &unk_265198C80;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeThreadMetricsWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeThreadMetricsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448C8310;
  v18[3] = &unk_265198C80;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeThreadMetricsWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeCurrentHeapFreeWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448C83CC;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeCurrentHeapFreeWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeCurrentHeapFreeWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448C854C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeCurrentHeapFreeWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeCurrentHeapFreeWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448C8674;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeCurrentHeapFreeWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeCurrentHeapUsedWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448C8730;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeCurrentHeapUsedWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeCurrentHeapUsedWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448C88B0;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeCurrentHeapUsedWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeCurrentHeapUsedWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448C89D8;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeCurrentHeapUsedWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeCurrentHeapHighWatermarkWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448C8A94;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeCurrentHeapHighWatermarkWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeCurrentHeapHighWatermarkWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448C8C14;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeCurrentHeapHighWatermarkWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeCurrentHeapHighWatermarkWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448C8D3C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeCurrentHeapHighWatermarkWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeGeneratedCommandListWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448C8DF8;
  v7[3] = &unk_265198C80;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeGeneratedCommandListWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeGeneratedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448C8F78;
  v26[3] = &unk_265198C80;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeGeneratedCommandListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeGeneratedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448C90A0;
  v18[3] = &unk_265198C80;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeGeneratedCommandListWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAcceptedCommandListWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448C915C;
  v7[3] = &unk_265198C80;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAcceptedCommandListWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAcceptedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448C92DC;
  v26[3] = &unk_265198C80;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAcceptedCommandListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAcceptedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448C9404;
  v18[3] = &unk_265198C80;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAcceptedCommandListWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAttributeListWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448C94C0;
  v7[3] = &unk_265198C80;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAttributeListWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAttributeListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448C9640;
  v26[3] = &unk_265198C80;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAttributeListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAttributeListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448C9768;
  v18[3] = &unk_265198C80;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAttributeListWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeFeatureMapWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448C9824;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeFeatureMapWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeFeatureMapWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448C99A4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeFeatureMapWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeFeatureMapWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448C9ACC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeFeatureMapWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeClusterRevisionWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448C9B88;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeClusterRevisionWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeClusterRevisionWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448C9D08;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeClusterRevisionWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeClusterRevisionWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448C9E30;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeClusterRevisionWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (MTRBaseClusterSoftwareDiagnostics)initWithDevice:(MTRBaseDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6 = endpoint;
  id v8 = device;
  id v9 = queue;
  uint64_t v11 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v10, v6);
  uint64_t v13 = (MTRBaseClusterSoftwareDiagnostics *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

@end