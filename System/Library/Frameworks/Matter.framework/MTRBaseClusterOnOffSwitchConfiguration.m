@interface MTRBaseClusterOnOffSwitchConfiguration
+ (void)readAttributeAcceptedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAcceptedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAttributeListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAttributeListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeClusterRevisionWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeClusterRevisionWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeFeatureMapWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeFeatureMapWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeGeneratedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeGeneratedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeSwitchActionsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeSwitchActionsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeSwitchTypeWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeSwitchTypeWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
- (MTRBaseClusterOnOffSwitchConfiguration)initWithDevice:(MTRBaseDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue;
- (void)readAttributeAcceptedCommandListWithCompletion:(void *)completion;
- (void)readAttributeAcceptedCommandListWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAttributeListWithCompletion:(void *)completion;
- (void)readAttributeAttributeListWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeClusterRevisionWithCompletion:(void *)completion;
- (void)readAttributeClusterRevisionWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeFeatureMapWithCompletion:(void *)completion;
- (void)readAttributeFeatureMapWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeGeneratedCommandListWithCompletion:(void *)completion;
- (void)readAttributeGeneratedCommandListWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeSwitchActionsWithCompletion:(void *)completion;
- (void)readAttributeSwitchActionsWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeSwitchTypeWithCompletion:(void *)completion;
- (void)readAttributeSwitchTypeWithCompletionHandler:(void *)completionHandler;
- (void)subscribeAttributeAcceptedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcceptedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAttributeListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAttributeListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeClusterRevisionWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeClusterRevisionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeFeatureMapWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeFeatureMapWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeGeneratedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeGeneratedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeSwitchActionsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeSwitchActionsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeSwitchTypeWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeSwitchTypeWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)writeAttributeSwitchActionsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeSwitchActionsWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeSwitchActionsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeSwitchActionsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
@end

@implementation MTRBaseClusterOnOffSwitchConfiguration

- (void)readAttributeSwitchTypeWithCompletion:(void *)completion
{
  v4 = completion;
  v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B2FF34;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeSwitchTypeWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B30078;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeSwitchTypeWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B30194;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeSwitchActionsWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B302D8;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)writeAttributeSwitchActionsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeSwitchActionsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v6 = completion;
  v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B30428;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)subscribeAttributeSwitchActionsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRStatusCompletion v6 = reportHandler;
  v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B30568;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeSwitchActionsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B30684;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeGeneratedCommandListWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B307C8;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeGeneratedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3090C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeGeneratedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B30A28;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAcceptedCommandListWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B30B6C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAcceptedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B30CB0;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAcceptedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B30DCC;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeAttributeListWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B30F10;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAttributeListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B31054;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeAttributeListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B31170;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeFeatureMapWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B312B4;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeFeatureMapWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B313F8;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeFeatureMapWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B31514;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeClusterRevisionWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B31658;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeClusterRevisionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3179C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeClusterRevisionWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B318B8;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeSwitchTypeWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B319EC;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeSwitchTypeWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeSwitchTypeWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B31B6C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeSwitchTypeWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeSwitchTypeWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B31C94;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeSwitchTypeWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeSwitchActionsWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B31D50;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeSwitchActionsWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeSwitchActionsWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeSwitchActionsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeSwitchActionsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B31EE0;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeSwitchActionsWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeSwitchActionsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B32008;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeSwitchActionsWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeGeneratedCommandListWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B320C4;
  v7[3] = &unk_265198C80;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeGeneratedCommandListWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeGeneratedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B32244;
  v26[3] = &unk_265198C80;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeGeneratedCommandListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeGeneratedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B3236C;
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
  v7[2] = sub_244B32428;
  v7[3] = &unk_265198C80;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAcceptedCommandListWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAcceptedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B325A8;
  v26[3] = &unk_265198C80;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAcceptedCommandListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAcceptedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B326D0;
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
  v7[2] = sub_244B3278C;
  v7[3] = &unk_265198C80;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAttributeListWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAttributeListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B3290C;
  v26[3] = &unk_265198C80;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAttributeListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAttributeListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B32A34;
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
  v7[2] = sub_244B32AF0;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeFeatureMapWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeFeatureMapWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B32C70;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeFeatureMapWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeFeatureMapWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B32D98;
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
  v7[2] = sub_244B32E54;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeClusterRevisionWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeClusterRevisionWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  id v12 = minInterval;
  v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_244B32FD4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeClusterRevisionWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeClusterRevisionWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B330FC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeClusterRevisionWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (MTRBaseClusterOnOffSwitchConfiguration)initWithDevice:(MTRBaseDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6 = endpoint;
  id v8 = device;
  v9 = queue;
  v11 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v10, v6);
  v13 = (MTRBaseClusterOnOffSwitchConfiguration *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

@end