@interface MPCAssistantAnalyticsEventConsumer
+ (NSString)identifier;
- (MPCAssistantAnalyticsEventConsumer)initWithPlaybackEngine:(id)a3;
- (MPCPlaybackEngine)playbackEngine;
- (MPCPlaybackEngineEventStreamSubscription)subscription;
- (id)_validateAndBuildContextWithEvent:(id)a3;
- (void)_handleAssetLoadEnd:(id)a3 cursor:(id)a4;
- (void)subscribeToEventStream:(id)a3;
- (void)unsubscribeFromEventStream:(id)a3;
@end

@implementation MPCAssistantAnalyticsEventConsumer

+ (NSString)identifier
{
  return (NSString *)@"com.apple.MediaPlaybackCore/Siri";
}

uint64_t __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  v25[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 payload];
  v8 = [v7 objectForKeyedSubscript:@"item-metadata"];
  v9 = [v8 objectForKeyedSubscript:@"item-is-start-item"];
  int v10 = [v9 BOOLValue];

  if (v10)
  {
    v11 = [v5 payload];
    v12 = [v11 objectForKeyedSubscript:@"queue-section-id"];

    v13 = [v5 payload];
    v14 = [v13 objectForKeyedSubscript:@"queue-item-id"];

    v25[0] = @"asset-load-end";
    v25[1] = @"session-reset";
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
    v16 = [v6 findPreviousEventWithTypes:v15 matchingPayload:0];

    if (v16)
    {
      v17 = [v16 type];
      char v18 = [v17 isEqualToString:@"session-reset"];

      if ((v18 & 1) == 0)
      {
        v19 = [v16 payload];
        v20 = [v19 objectForKeyedSubscript:@"queue-section-id"];
        if ([v20 isEqualToString:v12])
        {
          v21 = [v16 payload];
          v22 = [v21 objectForKeyedSubscript:@"queue-item-id"];
          int v24 = [v22 isEqualToString:v14];

          if (v24) {
            [*(id *)(a1 + 32) _handleAssetLoadEnd:v16 cursor:v6];
          }
        }
        else
        {
        }
      }
    }
  }
  return 1;
}

- (void)subscribeToEventStream:(id)a3
{
  objc_storeStrong((id *)&self->_subscription, a3);
  id v5 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke;
  v10[3] = &unk_2643C5258;
  v10[4] = self;
  [v5 subscribeToEventType:@"session-will-begin" handler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke_6;
  v9[3] = &unk_2643C5258;
  v9[4] = self;
  [v5 subscribeToEventType:@"item-buffer-ready" handler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke_8;
  v8[3] = &unk_2643C5258;
  v8[4] = self;
  [v5 subscribeToEventType:@"item-first-audio-frame" handler:v8];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke_20;
  v7[3] = &unk_2643C5258;
  v7[4] = self;
  [v5 subscribeToEventType:@"item-begin" handler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke_2;
  v6[3] = &unk_2643C5258;
  v6[4] = self;
  [v5 subscribeToEventType:@"asset-load-end" handler:v6];
}

- (MPCAssistantAnalyticsEventConsumer)initWithPlaybackEngine:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MPCAssistantAnalyticsEventConsumer;
  id v5 = [(MPCAssistantAnalyticsEventConsumer *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_playbackEngine, v4);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.MediaPlayer.MPAssistantAnalyticsReportingController.eventQueue", 0);
    eventQueue = v6->_eventQueue;
    v6->_eventQueue = (OS_dispatch_queue *)v7;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_storeStrong((id *)&self->_lastSiriReferenceIdentifierForPlaybackStart, 0);

  objc_storeStrong((id *)&self->_eventQueue, 0);
}

- (MPCPlaybackEngineEventStreamSubscription)subscription
{
  return self->_subscription;
}

- (MPCPlaybackEngine)playbackEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);

  return (MPCPlaybackEngine *)WeakRetained;
}

- (id)_validateAndBuildContextWithEvent:(id)a3
{
  v21[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 payload];
  id v6 = [v5 objectForKeyedSubscript:@"queue-reporting-metadata"];

  if (v6)
  {
    dispatch_queue_t v7 = [v6 objectForKeyedSubscript:@"siri-ref-id"];
    v8 = v7;
    if (v7 && ([v7 isEqualToString:self->_lastSiriReferenceIdentifierForPlaybackStart] & 1) == 0)
    {
      objc_super v10 = [v6 objectForKeyedSubscript:@"siri-wha-metrics"];
      if ([v10 count])
      {
        v20[0] = @"refId";
        v20[1] = @"endTimeReciever";
        v21[0] = v8;
        v11 = NSNumber;
        v12 = [v4 date];
        [v12 timeIntervalSinceReferenceDate];
        v13 = objc_msgSend(v11, "numberWithDouble:");
        v21[1] = v13;
        v14 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

        v19[0] = v14;
        v19[1] = v10;
        v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
        v9 = AFAnalyticsContextsMerge();
      }
      else
      {
        v17 = @"refId";
        char v18 = v8;
        v9 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      }
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_handleAssetLoadEnd:(id)a3 cursor:(id)a4
{
  v33[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 type];
  int v9 = [v8 isEqualToString:@"asset-load-end"];

  if (v9)
  {
    objc_super v10 = [v6 payload];
    v11 = [v10 objectForKeyedSubscript:@"queue-section-id"];

    v12 = [v6 payload];
    v13 = [v12 objectForKeyedSubscript:@"queue-item-id"];

    v32 = @"queue-section-id";
    v33[0] = v11;
    v14 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
    v15 = [v7 findPreviousEventWithType:@"queue-add" matchingPayload:v14];

    v16 = [(MPCAssistantAnalyticsEventConsumer *)self _validateAndBuildContextWithEvent:v15];
    v17 = (void *)[v16 mutableCopy];

    if (v17)
    {
      v30[0] = @"queue-section-id";
      v30[1] = @"queue-item-id";
      v31[0] = v11;
      v31[1] = v13;
      char v18 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
      v19 = [v7 findPreviousEventWithType:@"asset-load-begin" matchingPayload:v18];

      v20 = NSNumber;
      [v19 durationSinceEvent:v6];
      v22 = [v20 numberWithDouble:v21 * 1000.0];
      [v17 setObject:v22 forKeyedSubscript:@"Duration"];

      v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_DEFAULT, "MPCAssistantAnalyticsEventConsumer: AFAnalyticsEventTypeMusicPlaybackAssetLoad", buf, 2u);
      }

      int v24 = [MEMORY[0x263F283F8] sharedAnalytics];
      if (v6)
      {
        [v6 monotonicTime];
        uint64_t v25 = *((void *)&v26 + 1);
      }
      else
      {
        uint64_t v25 = 0;
        uint64_t v28 = 0;
        long long v26 = 0u;
        long long v27 = 0u;
      }
      objc_msgSend(v24, "logEventWithType:machAbsoluteTime:context:", 2903, v25, v17, v26, v27, v28);
    }
  }
}

- (void)unsubscribeFromEventStream:(id)a3
{
  subscription = self->_subscription;
  self->_subscription = 0;
}

uint64_t __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _validateAndBuildContextWithEvent:v3];
  if (v4)
  {
    id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "MPCAssistantAnalyticsEventConsumer: AFAnalyticsEventTypeMusicPlaybackQueueReceived", buf, 2u);
    }

    id v6 = [MEMORY[0x263F283F8] sharedAnalytics];
    if (v3)
    {
      [v3 monotonicTime];
      uint64_t v7 = *((void *)&v9 + 1);
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v11 = 0;
      long long v9 = 0u;
      long long v10 = 0u;
    }
    objc_msgSend(v6, "logEventWithType:machAbsoluteTime:context:", 2906, v7, v4, v9, v10, v11);
  }
  return 1;
}

uint64_t __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  v43[2] = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  id v6 = [v5 findPreviousEventWithType:@"session-begin" matchingPayload:0];
  uint64_t v7 = [v5 cursorUntilEvent:v6];
  v42[0] = @"queue-section-id";
  v8 = [v4 payload];
  long long v9 = [v8 objectForKeyedSubscript:@"queue-section-id"];
  v42[1] = @"queue-item-id";
  v43[0] = v9;
  long long v10 = [v4 payload];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"queue-item-id"];
  v43[1] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
  v13 = [v7 findPreviousEventWithType:@"item-buffer-ready" matchingPayload:v12];

  v14 = v4;
  if (!v13)
  {
    v34 = v7;
    v40[0] = @"queue-section-id";
    v15 = [v4 payload];
    v16 = [v15 objectForKeyedSubscript:@"queue-section-id"];
    v40[1] = @"queue-item-id";
    v41[0] = v16;
    v17 = [v4 payload];
    char v18 = [v17 objectForKeyedSubscript:@"queue-item-id"];
    v41[1] = v18;
    [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
    v20 = v19 = v4;
    double v21 = [v5 findPreviousEventWithType:@"item-begin" matchingPayload:v20];

    v14 = v19;
    v22 = [v21 payload];
    v23 = [v22 objectForKeyedSubscript:@"item-metadata"];
    int v24 = [v23 objectForKeyedSubscript:@"item-is-start-item"];
    LODWORD(v15) = [v24 BOOLValue];

    if (v15)
    {
      v38 = @"queue-section-id";
      uint64_t v25 = [v19 payload];
      long long v26 = [v25 objectForKeyedSubscript:@"queue-section-id"];
      v39 = v26;
      long long v27 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      uint64_t v28 = [v5 findPreviousEventWithType:@"queue-add" matchingPayload:v27];

      v29 = [*(id *)(a1 + 32) _validateAndBuildContextWithEvent:v28];
      if (v29)
      {
        v30 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_DEFAULT, "MPCAssistantAnalyticsEventConsumer: AFAnalyticsEventTypeMusicPlaybackReady", buf, 2u);
        }

        v31 = [MEMORY[0x263F283F8] sharedAnalytics];
        if (v14)
        {
          [v14 monotonicTime];
          uint64_t v32 = v36;
        }
        else
        {
          uint64_t v32 = 0;
        }
        [v31 logEventWithType:2901 machAbsoluteTime:v32 context:v29];
      }
    }

    uint64_t v7 = v34;
  }

  return 1;
}

uint64_t __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  v50[2] = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 payload];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"queue-section-id"];

  v8 = [v4 payload];
  long long v9 = [v8 objectForKeyedSubscript:@"queue-item-id"];

  v49[0] = @"queue-section-id";
  v49[1] = @"queue-item-id";
  v50[0] = v7;
  v50[1] = v9;
  long long v10 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
  uint64_t v11 = [v5 findPreviousEventWithType:@"item-begin" matchingPayload:v10];

  v12 = [v11 payload];
  v13 = [v12 objectForKeyedSubscript:@"item-metadata"];
  v14 = [v13 objectForKeyedSubscript:@"item-is-start-item"];
  LODWORD(v10) = [v14 BOOLValue];

  if (v10)
  {
    v15 = [v5 cursorUntilEvent:v11];
    if (![v15 countOfPreviousEventsWithType:@"item-first-audio-frame" matchingPayload:0])
    {
      v47 = @"queue-section-id";
      v48 = v7;
      v16 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      v35 = [v5 findPreviousEventWithType:@"queue-add" matchingPayload:v16];

      v17 = [*(id *)(a1 + 32) _validateAndBuildContextWithEvent:v35];
      char v18 = (void *)[v17 mutableCopy];

      if (v18)
      {
        v45[0] = @"queue-section-id";
        v45[1] = @"item-start-item-id";
        v46[0] = v7;
        v46[1] = v9;
        v19 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
        v34 = [v15 findPreviousEventWithType:@"item-hls-stream-begin" matchingPayload:v19];

        if (v34)
        {
          [v18 setObject:@"HLS" forKeyedSubscript:@"contentType"];
          *(void *)info = 0;
          *(void *)&info[8] = info;
          *(void *)&info[16] = 0x3032000000;
          v42 = __Block_byref_object_copy__2076;
          v43 = __Block_byref_object_dispose__2077;
          id v44 = 0;
          v39[0] = @"queue-section-id";
          v39[1] = @"queue-item-id";
          v40[0] = v7;
          v40[1] = v9;
          v20 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
          v38[0] = MEMORY[0x263EF8330];
          v38[1] = 3221225472;
          v38[2] = __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke_15;
          v38[3] = &unk_2643C62C8;
          v38[4] = info;
          [v15 enumeratePreviousEventsWithType:@"audio-format-changed" matchingPayload:v20 usingBlock:v38];

          double v21 = *(void **)(*(void *)&info[8] + 40);
          if (v21)
          {
            v22 = [v21 analyticsFormatInfo];
            [v18 addEntriesFromDictionary:v22];
          }
          _Block_object_dispose(info, 8);
        }
        else
        {
          [v18 setObject:@"CRABS" forKeyedSubscript:@"contentType"];
        }
        v23 = [v4 payload];
        int v24 = [v23 objectForKeyedSubscript:@"event-time-offset"];
        [v24 doubleValue];
        double v26 = v25;

        if (v4) {
          [v4 monotonicTime];
        }
        else {
          long long v37 = 0u;
        }
        *(void *)info = 0;
        mach_timebase_info((mach_timebase_info_t)info);
        uint64_t v27 = *(unsigned int *)&info[4] * (uint64_t)(v26 * 1000000000.0) / *(unsigned int *)info + *((void *)&v37 + 1);
        uint64_t v28 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)info = 134218242;
          *(void *)&info[4] = v27;
          *(_WORD *)&info[12] = 2114;
          *(void *)&info[14] = v18;
          _os_log_impl(&dword_21BB87000, v28, OS_LOG_TYPE_DEFAULT, "MPCAssistantAnalyticsEventConsumer: AFAnalyticsEventTypeMusicPlaybackStart %lld %{public}@", info, 0x16u);
        }

        v29 = [MEMORY[0x263F283F8] sharedAnalytics];
        [v29 logEventWithType:2905 machAbsoluteTime:v27 context:v18];

        uint64_t v30 = [v18 objectForKeyedSubscript:@"refId"];
        uint64_t v31 = *(void *)(a1 + 32);
        uint64_t v32 = *(void **)(v31 + 16);
        *(void *)(v31 + 16) = v30;
      }
    }
  }
  return 1;
}

uint64_t __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v26[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 payload];
  v8 = [v7 objectForKeyedSubscript:@"queue-section-id"];

  long long v9 = [v5 payload];
  long long v10 = [v9 objectForKeyedSubscript:@"queue-item-id"];

  v26[0] = @"item-begin";
  v26[1] = @"session-reset";
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  v12 = [v6 findPreviousEventWithTypes:v11 matchingPayload:0];

  if (!v12) {
    goto LABEL_11;
  }
  v13 = [v12 type];
  char v14 = [v13 isEqualToString:@"session-reset"];

  if (v14) {
    goto LABEL_11;
  }
  v15 = [v12 type];
  if (([v15 isEqualToString:@"item-begin"] & 1) == 0)
  {
LABEL_10:

    goto LABEL_11;
  }
  v16 = [v12 payload];
  v17 = [v16 objectForKeyedSubscript:@"queue-section-id"];
  if (([v17 isEqualToString:v8] & 1) == 0)
  {
LABEL_9:

    goto LABEL_10;
  }
  char v18 = [v12 payload];
  double v25 = [v18 objectForKeyedSubscript:@"queue-item-id"];
  if (![v25 isEqualToString:v10])
  {

    goto LABEL_9;
  }
  v23 = [v5 payload];
  double v21 = [v23 objectForKeyedSubscript:@"item-metadata"];
  [v21 objectForKeyedSubscript:@"item-is-start-item"];
  v19 = v22 = v18;
  int v24 = [v19 BOOLValue];

  if (v24) {
    [*(id *)(a1 + 32) _handleAssetLoadEnd:v5 cursor:v6];
  }
LABEL_11:

  return 1;
}

void __61__MPCAssistantAnalyticsEventConsumer_subscribeToEventStream___block_invoke_15(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 payload];
  id v9 = [v5 objectForKeyedSubscript:@"item-audio-format-metadata"];

  id v6 = [v9 objectForKeyedSubscript:@"active-format"];
  uint64_t v7 = [v9 objectForKeyedSubscript:@"target-format"];
  v8 = v7;
  if (v6)
  {
    *a3 = 1;
    v8 = v6;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v8);
}

@end