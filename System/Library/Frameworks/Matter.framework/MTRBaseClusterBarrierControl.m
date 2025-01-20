@interface MTRBaseClusterBarrierControl
+ (void)readAttributeAcceptedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAcceptedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAttributeListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAttributeListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeBarrierCapabilitiesWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeBarrierCapabilitiesWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeBarrierCloseEventsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeBarrierCloseEventsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeBarrierClosePeriodWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeBarrierClosePeriodWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeBarrierCommandCloseEventsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeBarrierCommandCloseEventsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeBarrierCommandOpenEventsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeBarrierCommandOpenEventsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeBarrierMovingStateWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeBarrierMovingStateWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeBarrierOpenEventsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeBarrierOpenEventsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeBarrierOpenPeriodWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeBarrierOpenPeriodWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeBarrierPositionWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeBarrierPositionWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeBarrierSafetyStatusWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeBarrierSafetyStatusWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeClusterRevisionWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeClusterRevisionWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeFeatureMapWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeFeatureMapWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeGeneratedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeGeneratedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
- (MTRBaseClusterBarrierControl)initWithDevice:(MTRBaseDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue;
- (void)barrierControlGoToPercentWithParams:(MTRBarrierControlClusterBarrierControlGoToPercentParams *)params completion:(MTRStatusCompletion)completion;
- (void)barrierControlGoToPercentWithParams:(MTRBarrierControlClusterBarrierControlGoToPercentParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)barrierControlStopWithCompletion:(MTRStatusCompletion)completion;
- (void)barrierControlStopWithCompletionHandler:(MTRStatusCompletion)completionHandler;
- (void)barrierControlStopWithParams:(MTRBarrierControlClusterBarrierControlStopParams *)params completion:(MTRStatusCompletion)completion;
- (void)barrierControlStopWithParams:(MTRBarrierControlClusterBarrierControlStopParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)readAttributeAcceptedCommandListWithCompletion:(void *)completion;
- (void)readAttributeAcceptedCommandListWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAttributeListWithCompletion:(void *)completion;
- (void)readAttributeAttributeListWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeBarrierCapabilitiesWithCompletion:(void *)completion;
- (void)readAttributeBarrierCapabilitiesWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeBarrierCloseEventsWithCompletion:(void *)completion;
- (void)readAttributeBarrierCloseEventsWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeBarrierClosePeriodWithCompletion:(void *)completion;
- (void)readAttributeBarrierClosePeriodWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeBarrierCommandCloseEventsWithCompletion:(void *)completion;
- (void)readAttributeBarrierCommandCloseEventsWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeBarrierCommandOpenEventsWithCompletion:(void *)completion;
- (void)readAttributeBarrierCommandOpenEventsWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeBarrierMovingStateWithCompletion:(void *)completion;
- (void)readAttributeBarrierMovingStateWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeBarrierOpenEventsWithCompletion:(void *)completion;
- (void)readAttributeBarrierOpenEventsWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeBarrierOpenPeriodWithCompletion:(void *)completion;
- (void)readAttributeBarrierOpenPeriodWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeBarrierPositionWithCompletion:(void *)completion;
- (void)readAttributeBarrierPositionWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeBarrierSafetyStatusWithCompletion:(void *)completion;
- (void)readAttributeBarrierSafetyStatusWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeClusterRevisionWithCompletion:(void *)completion;
- (void)readAttributeClusterRevisionWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeFeatureMapWithCompletion:(void *)completion;
- (void)readAttributeFeatureMapWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeGeneratedCommandListWithCompletion:(void *)completion;
- (void)readAttributeGeneratedCommandListWithCompletionHandler:(void *)completionHandler;
- (void)subscribeAttributeAcceptedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcceptedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAttributeListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAttributeListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBarrierCapabilitiesWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBarrierCapabilitiesWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBarrierCloseEventsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBarrierCloseEventsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBarrierClosePeriodWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBarrierClosePeriodWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBarrierCommandCloseEventsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBarrierCommandCloseEventsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBarrierCommandOpenEventsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBarrierCommandOpenEventsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBarrierMovingStateWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBarrierMovingStateWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBarrierOpenEventsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBarrierOpenEventsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBarrierOpenPeriodWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBarrierOpenPeriodWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBarrierPositionWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBarrierPositionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBarrierSafetyStatusWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBarrierSafetyStatusWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeClusterRevisionWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeClusterRevisionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeFeatureMapWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeFeatureMapWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeGeneratedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeGeneratedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)writeAttributeBarrierCloseEventsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeBarrierCloseEventsWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeBarrierCloseEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeBarrierCloseEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeBarrierClosePeriodWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeBarrierClosePeriodWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeBarrierClosePeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeBarrierClosePeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeBarrierCommandCloseEventsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeBarrierCommandCloseEventsWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeBarrierCommandCloseEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeBarrierCommandCloseEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeBarrierCommandOpenEventsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeBarrierCommandOpenEventsWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeBarrierCommandOpenEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeBarrierCommandOpenEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeBarrierOpenEventsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeBarrierOpenEventsWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeBarrierOpenEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeBarrierOpenEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeBarrierOpenPeriodWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeBarrierOpenPeriodWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler;
- (void)writeAttributeBarrierOpenPeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeBarrierOpenPeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
@end

@implementation MTRBaseClusterBarrierControl

- (void)barrierControlGoToPercentWithParams:(MTRBarrierControlClusterBarrierControlGoToPercentParams *)params completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v5 = completion;
  v8 = objc_msgSend_callbackQueue(self, v6, v7);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3B5F4;
  block[3] = &unk_265194E00;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(v8, block);
}

- (void)barrierControlStopWithCompletion:(MTRStatusCompletion)completion
{
}

- (void)barrierControlStopWithParams:(MTRBarrierControlClusterBarrierControlStopParams *)params completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v5 = completion;
  v8 = objc_msgSend_callbackQueue(self, v6, v7);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3B740;
  block[3] = &unk_265194E00;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(v8, block);
}

- (void)readAttributeBarrierMovingStateWithCompletion:(void *)completion
{
  v4 = completion;
  uint64_t v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3B880;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeBarrierMovingStateWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3B9C4;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeBarrierMovingStateWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3BAE0;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeBarrierSafetyStatusWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3BC24;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeBarrierSafetyStatusWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3BD68;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeBarrierSafetyStatusWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3BE84;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeBarrierCapabilitiesWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3BFC8;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeBarrierCapabilitiesWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3C10C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeBarrierCapabilitiesWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3C228;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeBarrierOpenEventsWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3C36C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)writeAttributeBarrierOpenEventsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeBarrierOpenEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v6 = completion;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3C4BC;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)subscribeAttributeBarrierOpenEventsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRStatusCompletion v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3C5FC;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeBarrierOpenEventsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3C718;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeBarrierCloseEventsWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3C85C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)writeAttributeBarrierCloseEventsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeBarrierCloseEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v6 = completion;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3C9AC;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)subscribeAttributeBarrierCloseEventsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRStatusCompletion v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3CAEC;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeBarrierCloseEventsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3CC08;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeBarrierCommandOpenEventsWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3CD4C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)writeAttributeBarrierCommandOpenEventsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeBarrierCommandOpenEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v6 = completion;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3CE9C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)subscribeAttributeBarrierCommandOpenEventsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRStatusCompletion v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3CFDC;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeBarrierCommandOpenEventsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3D0F8;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeBarrierCommandCloseEventsWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3D23C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)writeAttributeBarrierCommandCloseEventsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeBarrierCommandCloseEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v6 = completion;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3D38C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)subscribeAttributeBarrierCommandCloseEventsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRStatusCompletion v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3D4CC;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeBarrierCommandCloseEventsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3D5E8;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeBarrierOpenPeriodWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3D72C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)writeAttributeBarrierOpenPeriodWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeBarrierOpenPeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v6 = completion;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3D87C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)subscribeAttributeBarrierOpenPeriodWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRStatusCompletion v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3D9BC;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeBarrierOpenPeriodWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3DAD8;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeBarrierClosePeriodWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3DC1C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)writeAttributeBarrierClosePeriodWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeBarrierClosePeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  MTRStatusCompletion v6 = completion;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3DD6C;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)subscribeAttributeBarrierClosePeriodWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  MTRStatusCompletion v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3DEAC;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeBarrierClosePeriodWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3DFC8;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)readAttributeBarrierPositionWithCompletion:(void *)completion
{
  v4 = completion;
  id v7 = objc_msgSend_callbackQueue(self, v5, v6);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3E10C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeBarrierPositionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3E250;
  block[3] = &unk_265194E00;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

+ (void)readAttributeBarrierPositionWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v7 = completion;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3E36C;
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
  block[2] = sub_244B3E4B0;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeGeneratedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3E5F4;
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
  block[2] = sub_244B3E710;
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
  block[2] = sub_244B3E854;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAcceptedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3E998;
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
  block[2] = sub_244B3EAB4;
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
  block[2] = sub_244B3EBF8;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeAttributeListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3ED3C;
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
  block[2] = sub_244B3EE58;
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
  block[2] = sub_244B3EF9C;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeFeatureMapWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3F0E0;
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
  block[2] = sub_244B3F1FC;
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
  block[2] = sub_244B3F340;
  block[3] = &unk_265194E00;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

- (void)subscribeAttributeClusterRevisionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v6 = reportHandler;
  id v9 = objc_msgSend_callbackQueue(self, v7, v8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_244B3F484;
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
  block[2] = sub_244B3F5A0;
  block[3] = &unk_265194E00;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(queue, block);
}

- (void)barrierControlGoToPercentWithParams:(MTRBarrierControlClusterBarrierControlGoToPercentParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)barrierControlStopWithParams:(MTRBarrierControlClusterBarrierControlStopParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)barrierControlStopWithCompletionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)readAttributeBarrierMovingStateWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B3F6E8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeBarrierMovingStateWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeBarrierMovingStateWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_244B3F868;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeBarrierMovingStateWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeBarrierMovingStateWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B3F990;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeBarrierMovingStateWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeBarrierSafetyStatusWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B3FA4C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeBarrierSafetyStatusWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeBarrierSafetyStatusWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_244B3FBCC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeBarrierSafetyStatusWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeBarrierSafetyStatusWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B3FCF4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeBarrierSafetyStatusWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeBarrierCapabilitiesWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B3FDB0;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeBarrierCapabilitiesWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeBarrierCapabilitiesWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_244B3FF30;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeBarrierCapabilitiesWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeBarrierCapabilitiesWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B40058;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeBarrierCapabilitiesWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeBarrierOpenEventsWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B40114;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeBarrierOpenEventsWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeBarrierOpenEventsWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeBarrierOpenEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeBarrierOpenEventsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_244B402A4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeBarrierOpenEventsWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeBarrierOpenEventsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B403CC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeBarrierOpenEventsWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeBarrierCloseEventsWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B40488;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeBarrierCloseEventsWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeBarrierCloseEventsWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeBarrierCloseEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeBarrierCloseEventsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_244B40618;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeBarrierCloseEventsWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeBarrierCloseEventsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B40740;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeBarrierCloseEventsWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeBarrierCommandOpenEventsWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B407FC;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeBarrierCommandOpenEventsWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeBarrierCommandOpenEventsWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeBarrierCommandOpenEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeBarrierCommandOpenEventsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_244B4098C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeBarrierCommandOpenEventsWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeBarrierCommandOpenEventsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B40AB4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeBarrierCommandOpenEventsWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeBarrierCommandCloseEventsWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B40B70;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeBarrierCommandCloseEventsWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeBarrierCommandCloseEventsWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeBarrierCommandCloseEventsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeBarrierCommandCloseEventsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_244B40D00;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeBarrierCommandCloseEventsWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeBarrierCommandCloseEventsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B40E28;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeBarrierCommandCloseEventsWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeBarrierOpenPeriodWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B40EE4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeBarrierOpenPeriodWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeBarrierOpenPeriodWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeBarrierOpenPeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeBarrierOpenPeriodWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_244B41074;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeBarrierOpenPeriodWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeBarrierOpenPeriodWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B4119C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeBarrierOpenPeriodWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeBarrierClosePeriodWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B41258;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeBarrierClosePeriodWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)writeAttributeBarrierClosePeriodWithValue:(NSNumber *)value completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)writeAttributeBarrierClosePeriodWithValue:(NSNumber *)value params:(MTRWriteParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)subscribeAttributeBarrierClosePeriodWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_244B413E8;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeBarrierClosePeriodWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeBarrierClosePeriodWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B41510;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeBarrierClosePeriodWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeBarrierPositionWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B415CC;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeBarrierPositionWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeBarrierPositionWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
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
  v26[2] = sub_244B4174C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeBarrierPositionWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeBarrierPositionWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B41874;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeBarrierPositionWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeGeneratedCommandListWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_244B41930;
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
  v26[2] = sub_244B41AB0;
  v26[3] = &unk_265198C80;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeGeneratedCommandListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeGeneratedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B41BD8;
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
  v7[2] = sub_244B41C94;
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
  v26[2] = sub_244B41E14;
  v26[3] = &unk_265198C80;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAcceptedCommandListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAcceptedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B41F3C;
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
  v7[2] = sub_244B41FF8;
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
  v26[2] = sub_244B42178;
  v26[3] = &unk_265198C80;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAttributeListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAttributeListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B422A0;
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
  v7[2] = sub_244B4235C;
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
  v26[2] = sub_244B424DC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeFeatureMapWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeFeatureMapWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B42604;
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
  v7[2] = sub_244B426C0;
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
  v26[2] = sub_244B42840;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeClusterRevisionWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeClusterRevisionWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  id v11 = queue;
  id v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_244B42968;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeClusterRevisionWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (MTRBaseClusterBarrierControl)initWithDevice:(MTRBaseDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6 = endpoint;
  id v8 = device;
  id v9 = queue;
  id v11 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v10, v6);
  v13 = (MTRBaseClusterBarrierControl *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

@end