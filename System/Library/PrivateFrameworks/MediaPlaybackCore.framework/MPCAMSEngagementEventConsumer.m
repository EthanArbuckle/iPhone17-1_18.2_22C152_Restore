@interface MPCAMSEngagementEventConsumer
+ (NSString)identifier;
- (AMSEngagement)engagement;
- (BOOL)_enqueueDataForPlaybackChangingEvent:(id)a3 cursor:(id)a4;
- (MPCPlaybackEngineEventStreamSubscription)subscription;
- (id)_JSONEncodableEvent:(id)a3;
- (void)subscribeToEventStream:(id)a3;
- (void)unsubscribeFromEventStream:(id)a3;
@end

@implementation MPCAMSEngagementEventConsumer

+ (NSString)identifier
{
  return (NSString *)@"com.apple.MediaPlaybackCore/AMSEngagement";
}

- (void)subscribeToEventStream:(id)a3
{
  objc_storeStrong((id *)&self->_subscription, a3);
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x263F27C28]);
  v7 = [MEMORY[0x263F27B28] bagForProfile:@"Music" profileVersion:@"1"];
  v8 = (AMSEngagement *)[v6 initWithBag:v7];
  engagement = self->_engagement;
  self->_engagement = v8;

  subscription = self->_subscription;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke;
  v21[3] = &unk_2643C5258;
  v21[4] = self;
  [(MPCPlaybackEngineEventStreamSubscription *)subscription subscribeToEventType:@"item-resume" handler:v21];
  v11 = self->_subscription;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke_2;
  v20[3] = &unk_2643C5258;
  v20[4] = self;
  [(MPCPlaybackEngineEventStreamSubscription *)v11 subscribeToEventType:@"item-position-jump" handler:v20];
  v12 = self->_subscription;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke_3;
  v19[3] = &unk_2643C5258;
  v19[4] = self;
  [(MPCPlaybackEngineEventStreamSubscription *)v12 subscribeToEventType:@"item-pause" handler:v19];
  v13 = self->_subscription;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke_4;
  v18[3] = &unk_2643C5258;
  v18[4] = self;
  [(MPCPlaybackEngineEventStreamSubscription *)v13 subscribeToEventType:@"item-end" handler:v18];
  v14 = self->_subscription;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke_5;
  v17[3] = &unk_2643C5258;
  v17[4] = self;
  [(MPCPlaybackEngineEventStreamSubscription *)v14 subscribeToEventType:@"application-termination" handler:v17];
  v15 = self->_subscription;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke_6;
  v16[3] = &unk_2643C5258;
  v16[4] = self;
  [(MPCPlaybackEngineEventStreamSubscription *)v15 subscribeToEventType:@"remote-control-begin" handler:v16];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagement, 0);

  objc_storeStrong((id *)&self->_subscription, 0);
}

- (AMSEngagement)engagement
{
  return self->_engagement;
}

- (MPCPlaybackEngineEventStreamSubscription)subscription
{
  return self->_subscription;
}

- (id)_JSONEncodableEvent:(id)a3
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x263EFF9A0];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    id v6 = [v4 type];
    [v5 setObject:v6 forKeyedSubscript:@"event-type"];

    v7 = [v4 date];
    v8 = [v7 description];
    [v5 setObject:v8 forKeyedSubscript:@"time"];

    v9 = [v4 identifier];
    v10 = [v9 description];
    [v5 setObject:v10 forKeyedSubscript:@"id"];

    v11 = [v4 payload];

    [v5 setObject:v11 forKeyedSubscript:@"payload"];
    [v5 setObject:&unk_26CC19458 forKeyedSubscript:@"meta"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)_enqueueDataForPlaybackChangingEvent:(id)a3 cursor:(id)a4
{
  v70[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v49 = [(MPCAMSEngagementEventConsumer *)self _JSONEncodableEvent:v6];
  id v41 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v8 = [v6 payload];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"queue-section-id"];

  v10 = [v6 payload];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"queue-item-id"];

  v70[0] = @"device-changed";
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:1];
  v48 = [v7 findPreviousEventWithTypes:v12 matchingPayload:0];

  v43 = (void *)v11;
  v44 = (void *)v9;
  if (v9)
  {
    v68 = @"queue-section-id";
    uint64_t v69 = v9;
    v13 = [NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
    uint64_t v14 = [v7 findPreviousEventWithType:@"queue-add" matchingPayload:v13];

    v66 = @"queue-section-id";
    uint64_t v67 = v9;
    v15 = [NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    v47 = [v7 findPreviousEventWithType:@"container-begin" matchingPayload:v15];

    if (v11)
    {
      v64[0] = @"queue-section-id";
      v64[1] = @"queue-item-id";
      v65[0] = v9;
      v65[1] = v11;
      v16 = [NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:2];
      v46 = [v7 findPreviousEventWithType:@"item-begin" matchingPayload:v16];
    }
    else
    {
      v46 = 0;
    }
    v18 = v7;
    v17 = (void *)v14;
  }
  else
  {
    v46 = 0;
    v47 = 0;
    v17 = 0;
    v18 = v7;
  }
  v19 = [v17 payload];
  uint64_t v20 = [v19 objectForKeyedSubscript:@"account-id"];

  v42 = (void *)v20;
  if (v20)
  {
    v63[0] = @"account-begin";
    v63[1] = @"account-update";
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:2];
    v61 = @"account-id";
    uint64_t v62 = v20;
    v22 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    v45 = [v18 findPreviousEventWithTypes:v21 matchingPayload:v22];
  }
  else
  {
    v45 = 0;
  }
  v23 = [v17 payload];
  v24 = [v23 objectForKeyedSubscript:@"queue-delegated-account-id"];

  if (v24)
  {
    v60[0] = @"account-update";
    v60[1] = @"account-begin";
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:2];
    v58 = @"account-id";
    v59 = v24;
    v26 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    v27 = [v18 findPreviousEventWithTypes:v25 matchingPayload:v26];
  }
  else
  {
    v27 = 0;
  }
  v28 = [(MPCAMSEngagementEventConsumer *)self _JSONEncodableEvent:v48];
  [v41 setObject:v28 forKeyedSubscript:@"device"];

  v29 = [(MPCAMSEngagementEventConsumer *)self _JSONEncodableEvent:v17];
  [v41 setObject:v29 forKeyedSubscript:@"queue-add"];

  v30 = [(MPCAMSEngagementEventConsumer *)self _JSONEncodableEvent:v47];
  [v41 setObject:v30 forKeyedSubscript:@"container-begin"];

  v31 = [(MPCAMSEngagementEventConsumer *)self _JSONEncodableEvent:v46];
  [v41 setObject:v31 forKeyedSubscript:@"item-begin"];

  v32 = [(MPCAMSEngagementEventConsumer *)self _JSONEncodableEvent:v45];
  [v41 setObject:v32 forKeyedSubscript:@"account"];

  v33 = [(MPCAMSEngagementEventConsumer *)self _JSONEncodableEvent:v27];
  [v41 setObject:v33 forKeyedSubscript:@"enqueuer-account"];

  [v49 setObject:v41 forKeyedSubscript:@"related-events"];
  v34 = MPCPlaybackEngineEventPayloadJSONFromPayload(v49);
  v35 = [v6 identifier];
  v36 = [v35 description];

  v37 = os_log_create("com.apple.amp.mediaplaybackcore", "Engagement_Oversize");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v53 = objc_opt_class();
    __int16 v54 = 2114;
    v55 = v36;
    __int16 v56 = 2114;
    v57 = v34;
    _os_log_impl(&dword_21BB87000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: started enqueueing event with id: %{public}@\nEvent: %{public}@", buf, 0x20u);
  }

  v38 = [(AMSEngagement *)self->_engagement enqueueData:v34];
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __77__MPCAMSEngagementEventConsumer__enqueueDataForPlaybackChangingEvent_cursor___block_invoke;
  v50[3] = &unk_2643C32C0;
  v50[4] = self;
  id v51 = v36;
  id v39 = v36;
  [v38 addFinishBlock:v50];

  return 1;
}

void __77__MPCAMSEngagementEventConsumer__enqueueDataForPlaybackChangingEvent_cursor___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Engagement");
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = objc_msgSend(v4, "msv_description");
      int v12 = 138543874;
      uint64_t v13 = v7;
      __int16 v14 = 2114;
      uint64_t v15 = v8;
      __int16 v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Finished enqueueing event with id: %{public}@. error=%{public}@", (uint8_t *)&v12, 0x20u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = *(void *)(a1 + 40);
    int v12 = 138543618;
    uint64_t v13 = v10;
    __int16 v14 = 2114;
    uint64_t v15 = v11;
    _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished enqueueing event with id: %{public}@.", (uint8_t *)&v12, 0x16u);
  }
}

- (void)unsubscribeFromEventStream:(id)a3
{
  subscription = self->_subscription;
  self->_subscription = 0;

  engagement = self->_engagement;
  self->_engagement = 0;
}

uint64_t __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _enqueueDataForPlaybackChangingEvent:a2 cursor:a3];
}

uint64_t __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _enqueueDataForPlaybackChangingEvent:a2 cursor:a3];
}

uint64_t __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _enqueueDataForPlaybackChangingEvent:a2 cursor:a3];
}

uint64_t __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _enqueueDataForPlaybackChangingEvent:a2 cursor:a3];
}

uint64_t __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _enqueueDataForPlaybackChangingEvent:a2 cursor:a3];
}

uint64_t __56__MPCAMSEngagementEventConsumer_subscribeToEventStream___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _enqueueDataForPlaybackChangingEvent:a2 cursor:a3];
}

@end