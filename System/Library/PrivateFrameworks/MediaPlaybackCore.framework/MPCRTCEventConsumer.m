@interface MPCRTCEventConsumer
+ (NSString)identifier;
+ (id)NSStringFromMPCRTCReportingEventCategory:(int64_t)a3;
+ (id)dateFormatter;
+ (id)identifierStringFromItemIdentifiers:(id)a3 radioIdentifiers:(id)a4;
+ (id)playerServiceNameWithPlayerID:(id)a3;
+ (id)rtcIdentifiersFromRadioIdentifiers:(id)a3;
+ (id)rtcIdentifiersFromUniversalIdentifiers:(id)a3;
- (BOOL)_itemWasPreviouslyLoaded:(id)a3 cursor:(id)a4;
- (BOOL)_shouldReportItemSummary:(void *)a3 forEvent:;
- (MPCPlaybackEngineEventStreamSubscription)subscription;
- (MPCRTCEventConsumer)init;
- (MPCRTCEventConsumerTestingDelegate)testingDelegate;
- (id)_accountSnapshotWithCursor:(id)a3;
- (id)_firstItemAssetLoadEventWithCursor:(void *)a3 fromEvent:(void *)a4 matchingPayload:;
- (id)_itemAssetTypeFromItemAssetLoadEvent:(id)a3 cursor:(id)a4;
- (id)_itemStartIncitingEvent:(id)a3 fromItemStartEvent:(id)a4;
- (id)_mediaIdentifierFromItemAssetLoadEndEvent:(id)a3 cursor:(id)a4;
- (id)_networkSignalPayload:(uint64_t)a1;
- (id)_networkType:(void *)a3 fromEvent:;
- (id)_payloadForItemAssetLoad:(id)a3 fromItemEvent:(id)a4;
- (id)_payloadForItemSummary:(id)a3 fromEvent:(id)a4;
- (id)_payloadForItemSummary:(id)a3 fromItemEvent:(id)a4;
- (id)_payloadForQueueLoad:(id)a3 fromQueueLoadEndEvent:(id)a4;
- (id)_payloadForSessionStart:(id)a3 fromEvent:(id)a4;
- (id)_payloadForSessionSummary:(id)a3 fromEvent:(id)a4;
- (id)_reasonForEndEvent:(id)a3 cursor:(id)a4;
- (id)_rtcSessionInfoWithSamplingUUID:(id)a3;
- (id)_rtcUserInfoWithServiceName:(id)a3;
- (id)_sessionCursorWithCursor:(void *)a3 fromEvent:;
- (id)_tapToPlayMetrics:(id)a3 fromItemStartEvent:(id)a4;
- (id)_underlyingErrorFromPayload:(id)a3;
- (uint64_t)_shouldReportItemAssetLoad:(void *)a3 forItemEvent:;
- (uint64_t)_shouldReportSessionEnd:(void *)a3 forEvent:;
- (void)_addErrors:(void *)a3 toPayload:;
- (void)_generateConfiguredReportingSessionWithSamplingUUID:(id)a3 serviceName:(id)a4 completion:(id)a5;
- (void)_handleReportingForItemStartEvent:(id)a3 event:(id)a4;
- (void)_performABCSnapshotWithPayloadIfNecessary:(id)a3;
- (void)_sendOneMessageWithCategory:(int64_t)a3 type:(int64_t)a4 payload:(id)a5;
- (void)_sendQueueLoadEventIfNeeded:(id)a3 forItemEvent:(id)a4;
- (void)_sendReportForItemAssetLoad:(id)a3 event:(id)a4;
- (void)_sendReportForItemSummary:(id)a3 event:(id)a4;
- (void)_sendReportForItemSummaryWithEndReason:(id)a3 cursor:(id)a4 event:(id)a5;
- (void)_sendReportForSessionStart:(id)a3 event:(id)a4 withType:(int64_t)a5;
- (void)_sendReportForSessionSummary:(id)a3 event:(id)a4 withType:(int64_t)a5;
- (void)_sendReportWithSession:(id)a3 category:(int64_t)a4 type:(int64_t)a5 payload:(id)a6;
- (void)_sendSessionStartIfNeeded:(id)a3 forItemEvent:(id)a4;
- (void)_updateAssetSelectionEvent:(id)a3 fromAssetLoadEndEvent:(id)a4 untilAssetLoadBeginEvent:(id)a5 cursor:(id)a6;
- (void)setTestingDelegate:(id)a3;
- (void)subscribeToEventStream:(id)a3;
- (void)unsubscribeFromEventStream:(id)a3;
@end

@implementation MPCRTCEventConsumer

+ (NSString)identifier
{
  return (NSString *)@"com.apple.MediaPlaybackCore/RTC";
}

uint64_t __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 payload];
  v8 = [v7 objectForKeyedSubscript:@"queue-load-error"];

  if (v8)
  {
    v9 = [*(id *)(a1 + 32) _payloadForQueueLoad:v6 fromQueueLoadEndEvent:v5];
    [*(id *)(a1 + 32) _sendOneMessageWithCategory:1004 type:2 payload:v9];
  }
  return 1;
}

+ (id)playerServiceNameWithPlayerID:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Music"])
  {
    v4 = @"app.music";
  }
  else if ([v3 isEqualToString:@"Podcasts"])
  {
    v4 = @"app.podcasts";
  }
  else if ([v3 isEqualToString:@"com.apple.music.classical"])
  {
    v4 = @"app.music.classical";
  }
  else
  {
    v4 = @"app.musickit";
  }

  return v4;
}

- (void)subscribeToEventStream:(id)a3
{
  objc_storeStrong((id *)&self->_subscription, a3);
  id v5 = a3;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke;
  v16[3] = &unk_2643C5258;
  v16[4] = self;
  [v5 subscribeToEventType:@"session-reset" handler:v16];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_2;
  v15[3] = &unk_2643C5258;
  v15[4] = self;
  [v5 subscribeToEventType:@"session-end" handler:v15];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_3;
  v14[3] = &unk_2643C5258;
  v14[4] = self;
  [v5 subscribeToEventType:@"application-termination" handler:v14];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_4;
  v13[3] = &unk_2643C5258;
  v13[4] = self;
  [v5 subscribeToEventType:@"session-restore-end" handler:v13];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_5;
  v12[3] = &unk_2643C5258;
  v12[4] = self;
  [v5 subscribeToEventType:@"session-migrate-end" handler:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_6;
  v11[3] = &unk_2643C5258;
  v11[4] = self;
  [v5 subscribeToEventType:@"item-first-audio-frame" handler:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_7;
  v10[3] = &unk_2643C5258;
  v10[4] = self;
  [v5 subscribeToEventType:@"item-failed" handler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_8;
  v9[3] = &unk_2643C5258;
  v9[4] = self;
  [v5 subscribeToEventType:@"asset-load-end" handler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_9;
  v8[3] = &unk_2643C5258;
  v8[4] = self;
  [v5 subscribeToEventType:@"item-end" handler:v8];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_10;
  v7[3] = &unk_2643C5258;
  v7[4] = self;
  [v5 subscribeToEventType:@"remote-control-begin" handler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_11;
  v6[3] = &unk_2643C5258;
  v6[4] = self;
  [v5 subscribeToEventType:@"queue-load-end" handler:v6];
}

- (MPCRTCEventConsumer)init
{
  v8.receiver = self;
  v8.super_class = (Class)MPCRTCEventConsumer;
  v2 = [(MPCRTCEventConsumer *)&v8 init];
  if (v2)
  {
    dispatch_group_t v3 = dispatch_group_create();
    rtcGroup = v2->_rtcGroup;
    v2->_rtcGroup = (OS_dispatch_group *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MediaPlayer.MPCRTCEventConsumer", 0);
    rtcQueue = v2->_rtcQueue;
    v2->_rtcQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_destroyWeak((id *)&self->_testingDelegate);
  objc_storeStrong((id *)&self->_cachedFirstItemAssetLoadEvent, 0);
  objc_storeStrong((id *)&self->_rtcQueue, 0);

  objc_storeStrong((id *)&self->_rtcGroup, 0);
}

- (MPCPlaybackEngineEventStreamSubscription)subscription
{
  return self->_subscription;
}

- (MPCRTCEventConsumerTestingDelegate)testingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testingDelegate);

  return (MPCRTCEventConsumerTestingDelegate *)WeakRetained;
}

- (void)_sendOneMessageWithCategory:(int64_t)a3 type:(int64_t)a4 payload:(id)a5
{
  v40[4] = *MEMORY[0x263EF8340];
  id v8 = a5;
  v9 = [v8 objectForKeyedSubscript:@"sessionIdentifier"];
  switch(a3)
  {
    case 1000:
      v10 = @"NetworkInterfaceChange";
      break;
    case 1001:
      v10 = @"SecureKeyLoad";
      break;
    case 1002:
      v10 = @"SessionStart";
      break;
    case 1003:
      v10 = @"SessionSummary";
      break;
    case 1004:
      v10 = @"QueueLoad";
      break;
    case 1005:
      v10 = @"ItemAssetLoad";
      break;
    case 1006:
      v10 = @"ItemSummary";
      break;
    default:
      if (a3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"UnexpectedCategory:%d", a3);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = @"None";
      }
      break;
  }
  v11 = @"error";
  if (a4 == 1) {
    v11 = @"nominal";
  }
  v40[0] = v10;
  v40[1] = v11;
  v32 = v11;
  uint64_t v12 = [v8 objectForKeyedSubscript:@"event"];
  v13 = (void *)v12;
  v14 = @"unknown-event";
  if (v12) {
    v14 = (__CFString *)v12;
  }
  v40[2] = v14;
  uint64_t v15 = [v8 objectForKeyedSubscript:@"analyticSignature"];
  v16 = (void *)v15;
  v17 = &stru_26CBCA930;
  if (v15) {
    v17 = (__CFString *)v15;
  }
  v40[3] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:4];

  if (!v9)
  {
    v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v35 = v8;
      _os_log_impl(&dword_21BB87000, v19, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: missing samplingUID for payload=%{public}@", buf, 0xCu);
    }

    [MEMORY[0x263F54EC8] snapshotWithDomain:*MEMORY[0x263F54E80] type:@"Bug" subType:@"MPCRTCSamplingUUID" context:@"Received nil samplingUUID" triggerThresholdValues:0 events:v18 completion:0];
    v20 = [MEMORY[0x263F08C38] UUID];
    v9 = [v20 UUIDString];
  }
  v21 = [(MPCRTCEventConsumer *)self _rtcSessionInfoWithSamplingUUID:v9];
  v22 = [v8 objectForKeyedSubscript:@"serviceName"];
  if (!v22)
  {
    v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)v35 = v8;
      _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: missing serviceName for payload=%{public}@", buf, 0xCu);
    }

    [MEMORY[0x263F54EC8] snapshotWithDomain:*MEMORY[0x263F54E80] type:@"Bug" subType:@"MPCRTCServiceName" context:@"Payload missing serviceName" triggerThresholdValues:0 events:v18 completion:0];
    v22 = @"app.music.unknown";
  }
  v24 = [(MPCRTCEventConsumer *)self _rtcUserInfoWithServiceName:v22];
  id v33 = 0;
  [MEMORY[0x263F62A08] sendOneMessageWithSessionInfo:v21 userInfo:v24 category:(unsigned __int16)a3 type:(unsigned __int16)a4 payload:v8 error:&v33];
  id v25 = v33;
  v26 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
  v27 = v26;
  if (v25)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v31 = v18;
      switch(a3)
      {
        case 1000:
          v28 = @"NetworkInterfaceChange";
          break;
        case 1001:
          v28 = @"SecureKeyLoad";
          break;
        case 1002:
          v28 = @"SessionStart";
          break;
        case 1003:
          v28 = @"SessionSummary";
          break;
        case 1004:
          v28 = @"QueueLoad";
          break;
        case 1005:
          v28 = @"ItemAssetLoad";
          break;
        case 1006:
          v28 = @"ItemSummary";
          break;
        default:
          if (a3)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"UnexpectedCategory:%d", a3);
            v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v28 = @"None";
          }
          break;
      }
      v30 = objc_msgSend(v25, "msv_description");
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v35 = a3;
      *(_WORD *)&v35[4] = 2114;
      *(void *)&v35[6] = v28;
      __int16 v36 = 2114;
      v37 = v32;
      __int16 v38 = 2114;
      v39 = v30;
      _os_log_impl(&dword_21BB87000, v27, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: Sent one message. category=%d (%{public}@) type=%{public}@ error=%{public}@", buf, 0x26u);

      v18 = v31;
    }
  }
  else if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    switch(a3)
    {
      case 1000:
        v29 = @"NetworkInterfaceChange";
        break;
      case 1001:
        v29 = @"SecureKeyLoad";
        break;
      case 1002:
        v29 = @"SessionStart";
        break;
      case 1003:
        v29 = @"SessionSummary";
        break;
      case 1004:
        v29 = @"QueueLoad";
        break;
      case 1005:
        v29 = @"ItemAssetLoad";
        break;
      case 1006:
        v29 = @"ItemSummary";
        break;
      default:
        if (a3)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"UnexpectedCategory:%d", a3);
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v29 = @"None";
        }
        break;
    }
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v35 = a3;
    *(_WORD *)&v35[4] = 2114;
    *(void *)&v35[6] = v29;
    __int16 v36 = 2114;
    v37 = v32;
    _os_log_impl(&dword_21BB87000, v27, OS_LOG_TYPE_DEBUG, "MPCRTCEventConsumer: Sent one message. category=%d (%{public}@) type=%{public}@", buf, 0x1Cu);
  }
}

- (void)_sendReportWithSession:(id)a3 category:(int64_t)a4 type:(int64_t)a5 payload:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testingDelegate);
  v13 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained performOnPayload:v11 withCategory:a4 type:a5];
  }
  else
  {
    rtcGroup = self->_rtcGroup;
    rtcQueue = self->_rtcQueue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __68__MPCRTCEventConsumer__sendReportWithSession_category_type_payload___block_invoke;
    v16[3] = &unk_2643C0978;
    id v17 = v10;
    int64_t v19 = a4;
    int64_t v20 = a5;
    id v18 = v11;
    dispatch_group_notify(rtcGroup, rtcQueue, v16);
  }
}

void __68__MPCRTCEventConsumer__sendReportWithSession_category_type_payload___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(unsigned __int16 *)(a1 + 48);
    uint64_t v4 = *(unsigned __int16 *)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 40);
    id v17 = 0;
    int v6 = [v2 sendMessageWithCategory:v3 type:v4 payload:v5 error:&v17];
    v7 = v17;
    id v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    v9 = (__CFString *)v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v10 = *(void *)(a1 + 48);
        switch(v10)
        {
          case 1000:
            id v11 = @"NetworkInterfaceChange";
            break;
          case 1001:
            id v11 = @"SecureKeyLoad";
            break;
          case 1002:
            id v11 = @"SessionStart";
            break;
          case 1003:
            id v11 = @"SessionSummary";
            break;
          case 1004:
            id v11 = @"QueueLoad";
            break;
          case 1005:
            id v11 = @"ItemAssetLoad";
            break;
          case 1006:
            id v11 = @"ItemSummary";
            break;
          default:
            if (v10)
            {
              objc_msgSend(NSString, "stringWithFormat:", @"UnexpectedCategory:%d", *(void *)(a1 + 48));
              id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              id v11 = @"None";
            }
            break;
        }
        uint64_t v15 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 67109634;
        if (v15 == 1) {
          v16 = @"nominal";
        }
        else {
          v16 = @"error";
        }
        int v19 = v10;
        __int16 v20 = 2114;
        v21 = v11;
        __int16 v22 = 2114;
        v23 = v16;
        _os_log_impl(&dword_21BB87000, (os_log_t)v9, OS_LOG_TYPE_DEBUG, "MPCRTCEventConsumer: Sent session message. category=%d (%{public}@) type=%{public}@", buf, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 48);
      switch(v13)
      {
        case 1000:
          v14 = @"NetworkInterfaceChange";
          break;
        case 1001:
          v14 = @"SecureKeyLoad";
          break;
        case 1002:
          v14 = @"SessionStart";
          break;
        case 1003:
          v14 = @"SessionSummary";
          break;
        case 1004:
          v14 = @"QueueLoad";
          break;
        case 1005:
          v14 = @"ItemAssetLoad";
          break;
        case 1006:
          v14 = @"ItemSummary";
          break;
        default:
          if (v13)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"UnexpectedCategory:%d", *(void *)(a1 + 48));
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v14 = @"None";
          }
          break;
      }
      *(_DWORD *)buf = 67109634;
      int v19 = v13;
      __int16 v20 = 2114;
      v21 = v14;
      __int16 v22 = 2114;
      v23 = v7;
      _os_log_impl(&dword_21BB87000, (os_log_t)v9, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: RTC Message send failed. category=%d (%{public}@) error=%{public}@", buf, 0x1Cu);
    }
LABEL_45:

    goto LABEL_46;
  }
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = *(void *)(a1 + 48);
    switch(v12)
    {
      case 1000:
        v9 = @"NetworkInterfaceChange";
        break;
      case 1001:
        v9 = @"SecureKeyLoad";
        break;
      case 1002:
        v9 = @"SessionStart";
        break;
      case 1003:
        v9 = @"SessionSummary";
        break;
      case 1004:
        v9 = @"QueueLoad";
        break;
      case 1005:
        v9 = @"ItemAssetLoad";
        break;
      case 1006:
        v9 = @"ItemSummary";
        break;
      default:
        if (v12)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"UnexpectedCategory:%d", v12);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = @"None";
        }
        break;
    }
    *(_DWORD *)buf = 67109378;
    int v19 = v12;
    __int16 v20 = 2114;
    v21 = v9;
    _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: Can't send RTC message. session=nil. category=%d (%{public}@)", buf, 0x12u);
    goto LABEL_45;
  }
LABEL_46:
}

- (id)_rtcUserInfoWithServiceName:(id)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = *MEMORY[0x263F62AB8];
  uint64_t v3 = (void *)MEMORY[0x263F08AB0];
  id v4 = a3;
  uint64_t v5 = [v3 processInfo];
  int v6 = [v5 processName];
  v9[1] = *MEMORY[0x263F62AC8];
  v10[0] = v6;
  v10[1] = v4;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (id)_rtcSessionInfoWithSamplingUUID:(id)a3
{
  v15[7] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F62A68];
  v14[0] = *MEMORY[0x263F62A60];
  v14[1] = v5;
  v15[0] = &unk_26CC18F48;
  v15[1] = &unk_26CC18F60;
  uint64_t v6 = *MEMORY[0x263F62AA8];
  v14[2] = *MEMORY[0x263F62A40];
  v14[3] = v6;
  v15[2] = MEMORY[0x263EFFA88];
  v15[3] = &unk_26CC18F78;
  v14[4] = *MEMORY[0x263F62A50];
  v7 = [MEMORY[0x263F086E0] mainBundle];
  id v8 = [v7 bundleIdentifier];
  uint64_t v9 = *MEMORY[0x263F62A78];
  v15[4] = v8;
  void v15[5] = MEMORY[0x263EFFA80];
  uint64_t v10 = *MEMORY[0x263F62A98];
  void v14[5] = v9;
  v14[6] = v10;
  id v11 = v4;
  if (!v4)
  {
    uint64_t v3 = [MEMORY[0x263F08C38] UUID];
    id v11 = [v3 UUIDString];
  }
  v15[6] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:7];
  if (!v4)
  {
  }

  return v12;
}

- (void)_generateConfiguredReportingSessionWithSamplingUUID:(id)a3 serviceName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testingDelegate);

  if (WeakRetained)
  {
    v10[2](v10, 0);
  }
  else
  {
    uint64_t v12 = [(MPCRTCEventConsumer *)self _rtcSessionInfoWithSamplingUUID:v8];
    uint64_t v13 = [(MPCRTCEventConsumer *)self _rtcUserInfoWithServiceName:v9];
    v14 = (void *)[objc_alloc(MEMORY[0x263F62A08]) initWithSessionInfo:v12 userInfo:v13 frameworksToCheck:0];
    dispatch_group_enter((dispatch_group_t)self->_rtcGroup);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __98__MPCRTCEventConsumer__generateConfiguredReportingSessionWithSamplingUUID_serviceName_completion___block_invoke;
    v16[3] = &unk_2643C2F48;
    void v16[4] = self;
    id v17 = v14;
    id v18 = v10;
    id v15 = v14;
    [v15 startConfigurationWithCompletionHandler:v16];
  }
}

uint64_t __98__MPCRTCEventConsumer__generateConfiguredReportingSessionWithSamplingUUID_serviceName_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: [RTCReporting startConfigurationWithCompletionHandler:] failed with no backends", v5, 2u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 8));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_updateAssetSelectionEvent:(id)a3 fromAssetLoadEndEvent:(id)a4 untilAssetLoadBeginEvent:(id)a5 cursor:(id)a6
{
  v49[3] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v10 type];
  char v14 = [v13 isEqualToString:@"asset-load-end"];

  if (v14)
  {
    id v15 = [v10 previousItemEventWithCursor:v12 type:@"asset-selection"];
    if (v15)
    {
      v16 = [MEMORY[0x263EFF9A0] dictionary];
      [v12 cursorFromEvent:v10 untilEvent:v11];
      id v17 = v43 = v12;
      v49[0] = MEMORY[0x263EFFA88];
      v48[0] = @"blocks-playback";
      v48[1] = @"queue-section-id";
      id v18 = [v15 payload];
      int v19 = [v18 objectForKeyedSubscript:@"queue-section-id"];
      v49[1] = v19;
      v48[2] = @"queue-item-id";
      __int16 v20 = [v15 payload];
      v21 = [v20 objectForKeyedSubscript:@"queue-item-id"];
      v49[2] = v21;
      [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:3];
      __int16 v22 = v44 = v11;
      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __104__MPCRTCEventConsumer__updateAssetSelectionEvent_fromAssetLoadEndEvent_untilAssetLoadBeginEvent_cursor___block_invoke;
      v45[3] = &unk_2643C0908;
      id v46 = v16;
      id v23 = v16;
      [v17 enumeratePreviousEventsWithType:@"network-operation" matchingPayload:v22 usingBlock:v45];

      uint64_t v24 = [v15 payload];
      id v25 = [v24 objectForKeyedSubscript:@"asset-load-info"];

      v26 = [v25 objectForKeyedSubscript:@"item-asset-has-online-keys"];
      [v9 setObject:v26 forKeyedSubscript:@"hasOnlineKeys"];

      v27 = [v25 objectForKeyedSubscript:@"item-asset-has-offline-keys"];
      [v9 setObject:v27 forKeyedSubscript:@"hasOfflineKeys"];

      v28 = [v25 objectForKeyedSubscript:@"item-asset-url"];
      uint64_t v29 = [v28 host];
      v30 = (void *)v29;
      if (v29) {
        v31 = (__CFString *)v29;
      }
      else {
        v31 = @"localhost";
      }
      [v9 setObject:v31 forKeyedSubscript:@"ContentHostname"];

      v32 = [v23 objectForKeyedSubscript:&unk_26CC18ED0];
      [v9 setObject:v32 forKeyedSubscript:@"suzeLeaseTime"];

      id v33 = [v23 objectForKeyedSubscript:&unk_26CC18EE8];
      [v9 setObject:v33 forKeyedSubscript:@"bagWaitTime"];

      v34 = [v23 objectForKeyedSubscript:&unk_26CC18F00];
      [v9 setObject:v34 forKeyedSubscript:@"leaseWaitTime"];

      v35 = [v23 objectForKeyedSubscript:&unk_26CC18F18];
      [v9 setObject:v35 forKeyedSubscript:@"subscriptionWaitTime"];

      __int16 v36 = [v23 objectForKeyedSubscript:&unk_26CC18F30];
      [v9 setObject:v36 forKeyedSubscript:@"redownloadTime"];

      v37 = [v25 objectForKeyedSubscript:@"item-asset-is-delegated-playback"];
      [v9 setObject:v37 forKeyedSubscript:@"isDelegated"];

      __int16 v38 = [v28 scheme];
      [v9 setObject:v38 forKeyedSubscript:@"urlScheme"];

      v39 = [v25 objectForKeyedSubscript:@"item-asset-is-subscription-content"];
      [v9 setObject:v39 forKeyedSubscript:@"isSubscription"];

      v40 = [v25 objectForKeyedSubscript:@"item-asset-type"];
      [v9 setObject:v40 forKeyedSubscript:@"audioType"];

      v41 = [v25 objectForKeyedSubscript:@"item-asset-endpoint-type"];
      [v9 setObject:v41 forKeyedSubscript:@"endpointType"];

      v42 = [v25 objectForKeyedSubscript:@"item-asset-source"];
      [v9 setObject:v42 forKeyedSubscript:@"assetInfoSource"];

      id v11 = v44;
      id v12 = v43;
    }
  }
  else
  {
    id v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v15, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: _updateAssetLoadInfoEvent requires MPCPlaybackEngineEventTypeItemAssetLoadEnd type", buf, 2u);
    }
  }
}

void __104__MPCRTCEventConsumer__updateAssetSelectionEvent_fromAssetLoadEndEvent_untilAssetLoadBeginEvent_cursor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 payload];
  id v13 = [v4 objectForKeyedSubscript:@"network-operation-type"];

  uint64_t v5 = [v3 payload];

  uint64_t v6 = [v5 objectForKeyedSubscript:@"network-metrics"];

  v7 = NSNumber;
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v13];
  [v8 doubleValue];
  double v10 = v9;
  [v6 networkTime];
  id v12 = [v7 numberWithDouble:v10 + v11];
  [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v13];
}

- (void)_performABCSnapshotWithPayloadIfNecessary:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"errorJSON"];

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263F54EC8];
    uint64_t v7 = *MEMORY[0x263F54E80];
    v16[0] = v4;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    [v6 snapshotWithDomain:v7 type:@"Bug" subType:@"FatalJSONError" context:@"Encountered fatal error with underlying JSON" triggerThresholdValues:0 events:v8 completion:0];
  }
  else
  {
    id v8 = [(MPCRTCEventConsumer *)self _underlyingErrorFromPayload:v4];
    double v9 = [v8 domain];
    int v10 = [v9 isEqual:*MEMORY[0x263F89028]];

    if (v10 && ([v8 code] | 0x800) == 0xBE9)
    {
      double v11 = (void *)MEMORY[0x263F54EC8];
      uint64_t v12 = *MEMORY[0x263F54E80];
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"Code %ld", objc_msgSend(v8, "code"));
      id v15 = v4;
      char v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
      [v11 snapshotWithDomain:v12 type:@"Bug" subType:@"ICStoreServerError" context:v13 triggerThresholdValues:0 events:v14 completion:0];
    }
  }
}

- (id)_underlyingErrorFromPayload:(id)a3
{
  id v3 = a3;
  id v4 = @"errorDomain";
  uint64_t v5 = @"errorCode";
  uint64_t v6 = [v3 objectForKeyedSubscript:@"errorDomain"];

  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 1;
    double v9 = @"errorCode";
    int v10 = @"errorDomain";
    do
    {
      double v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = [v3 objectForKeyedSubscript:v10];
      id v13 = [v3 objectForKeyedSubscript:v9];
      char v14 = objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, objc_msgSend(v13, "integerValue"), 0);

      id v15 = [NSString stringWithFormat:@"%@-%d", @"errorDomain", v8];

      v16 = [NSString stringWithFormat:@"%@-%d", @"errorCode", v8];

      id v17 = [v3 objectForKeyedSubscript:v15];

      uint64_t v8 = (v8 + 1);
      double v9 = v16;
      int v10 = v15;
      uint64_t v7 = v14;
    }
    while (v17);
  }
  else
  {
    char v14 = 0;
    id v15 = @"errorDomain";
    v16 = @"errorCode";
  }

  return v14;
}

- (BOOL)_itemWasPreviouslyLoaded:(id)a3 cursor:(id)a4
{
  v34[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 type];
  if ([v7 isEqualToString:@"item-begin"])
  {
    id v8 = v5;
  }
  else
  {
    id v33 = @"queue-item-id";
    double v9 = [v5 payload];
    int v10 = [v9 objectForKeyedSubscript:@"queue-item-id"];
    v34[0] = v10;
    double v11 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
    id v8 = [v6 findPreviousEventWithType:@"item-begin" matchingPayload:v11];
  }
  uint64_t v12 = [MEMORY[0x263EFF980] array];
  v31 = @"queue-item-id";
  id v13 = [v5 payload];
  char v14 = [v13 objectForKeyedSubscript:@"queue-item-id"];
  v32 = v14;
  id v15 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = __55__MPCRTCEventConsumer__itemWasPreviouslyLoaded_cursor___block_invoke;
  uint64_t v29 = &unk_2643C0908;
  id v16 = v12;
  id v30 = v16;
  [v6 enumeratePreviousEventsWithType:@"asset-load-end" matchingPayload:v15 usingBlock:&v26];

  uint64_t v17 = objc_msgSend(v16, "msv_firstWhere:", &__block_literal_global_71, v26, v27, v28, v29);
  id v18 = (void *)v17;
  BOOL v19 = 0;
  if (v8 && v17)
  {
    __int16 v20 = [v8 date];
    [v20 timeIntervalSinceReferenceDate];
    double v22 = v21;
    id v23 = [v18 date];
    [v23 timeIntervalSinceReferenceDate];
    BOOL v19 = v22 > v24;
  }
  return v19;
}

uint64_t __55__MPCRTCEventConsumer__itemWasPreviouslyLoaded_cursor___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) insertObject:a2 atIndex:0];
}

BOOL __55__MPCRTCEventConsumer__itemWasPreviouslyLoaded_cursor___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 payload];
  id v3 = [v2 objectForKeyedSubscript:@"asset-load-error"];
  BOOL v4 = v3 == 0;

  return v4;
}

- (id)_itemAssetTypeFromItemAssetLoadEvent:(id)a3 cursor:(id)a4
{
  v70[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 payload];
  id v8 = [v7 objectForKeyedSubscript:@"item-ids"];

  double v9 = [v5 payload];
  int v10 = [v9 objectForKeyedSubscript:@"item-metadata"];

  double v11 = @"typeUnknown";
  uint64_t v12 = [v5 payload];
  id v13 = [v12 objectForKeyedSubscript:@"item-kind"];

  uint64_t v14 = [v13 modelClass];
  v62 = v10;
  if (v14 == objc_opt_class())
  {
    id v18 = @"song";
    __int16 v20 = @"song";

    double v21 = [v10 objectForKeyedSubscript:@"item-has-video"];
    char v22 = [v21 BOOLValue];

    if (v22)
    {
      BOOL v19 = MPCRTCAssetTypeMusicVideo;
      goto LABEL_11;
    }
LABEL_8:
    v64 = v18;
    goto LABEL_12;
  }
  uint64_t v15 = [v13 modelClass];
  if (v15 == objc_opt_class())
  {
    id v18 = @"typeUnknown";
    BOOL v19 = MPCRTCAssetTypeTVEpisode;
    goto LABEL_11;
  }
  uint64_t v16 = [v13 modelClass];
  if (v16 == objc_opt_class())
  {
    id v18 = @"typeUnknown";
    BOOL v19 = MPCRTCAssetTypeMovie;
    goto LABEL_11;
  }
  uint64_t v17 = [v13 modelClass];
  id v18 = @"typeUnknown";
  if (v17 != objc_opt_class()) {
    goto LABEL_8;
  }
  BOOL v19 = MPCRTCAssetTypePlaylistEntry;
LABEL_11:
  id v23 = *v19;

  v64 = v23;
LABEL_12:
  double v24 = @"originUnknown";
  id v25 = @"originUnknown";
  uint64_t v26 = [v5 payload];
  uint64_t v27 = [v26 objectForKeyedSubscript:@"container-ids"];

  v60 = (void *)v27;
  v61 = v13;
  if (!v27)
  {
    v63 = 0;
    v37 = 0;
    goto LABEL_23;
  }
  v69 = @"container-ids";
  v70[0] = v27;
  v28 = [NSDictionary dictionaryWithObjects:v70 forKeys:&v69 count:1];
  uint64_t v29 = [v6 findPreviousEventWithType:@"container-begin" matchingPayload:v28];

  id v30 = [v29 payload];
  v31 = [v30 objectForKeyedSubscript:@"container-metadata"];

  v32 = [v29 payload];
  id v33 = [v32 objectForKeyedSubscript:@"container-kind"];

  uint64_t v34 = [v33 modelClass];
  if (v34 == objc_opt_class())
  {
    v58 = v8;
    double v24 = @"radio";
    __int16 v38 = @"radio";

    v39 = [v31 objectForKeyedSubscript:@"container-radio-type"];
    [v39 integerValue];

    v40 = NSStringFromMPModelRadioStationType();
    uint64_t v41 = [v40 lowercaseString];

    v42 = [v31 objectForKeyedSubscript:@"container-radio-subtype"];
    uint64_t v43 = [v42 integerValue];

    if (!v43)
    {
      v63 = 0;
      id v8 = v58;
      goto LABEL_22;
    }
    NSStringFromMPModelRadioStationSubtype();
    id v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v63 = [(__CFString *)v44 lowercaseString];
    id v8 = v58;
  }
  else
  {
    v35 = [v8 universalStore];
    uint64_t v36 = [v35 subscriptionAdamID];

    if (v36 < 1) {
      double v24 = @"library";
    }
    else {
      double v24 = @"subscription";
    }
    v45 = v24;
    v63 = 0;
    id v44 = @"originUnknown";
    uint64_t v41 = (uint64_t)v64;
  }

LABEL_22:
  v37 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v24, v41, v63, 0);

  v64 = (void *)v41;
LABEL_23:
  v67 = @"queue-item-id";
  id v46 = [v5 payload];
  v47 = [v46 objectForKeyedSubscript:@"queue-item-id"];
  v68 = v47;
  v48 = [NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
  v49 = [v6 findPreviousEventWithType:@"item-begin" matchingPayload:v48];

  if (v49)
  {
    v59 = v8;
    id v50 = v6;
    v51 = [v6 cursorUntilEvent:v49];
    v65 = @"queue-section-id";
    v52 = [v5 payload];
    v53 = [v52 objectForKeyedSubscript:@"queue-section-id"];
    v66 = v53;
    v54 = [NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    v55 = [v51 findPreviousEventWithType:@"item-hls-stream-begin" matchingPayload:v54];

    if (v55) {
      [v37 addObject:@"hls"];
    }

    id v6 = v50;
    id v8 = v59;
  }
  id v56 = v37;

  return v56;
}

- (id)_mediaIdentifierFromItemAssetLoadEndEvent:(id)a3 cursor:(id)a4
{
  v31[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 payload];
  id v8 = [v7 objectForKeyedSubscript:@"item-ids"];

  double v9 = [v8 universalStore];
  int v10 = +[MPCRTCEventConsumer rtcIdentifiersFromUniversalIdentifiers:v9];

  double v11 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v12 = [v5 payload];
  id v13 = [v12 objectForKeyedSubscript:@"container-ids"];

  if (v13)
  {
    id v30 = @"container-ids";
    v31[0] = v13;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    uint64_t v15 = [v6 findPreviousEventWithType:@"container-begin" matchingPayload:v14];

    uint64_t v16 = [v15 payload];
    uint64_t v17 = [v16 objectForKeyedSubscript:@"container-kind"];

    uint64_t v18 = [v17 modelClass];
    if (v18 == objc_opt_class())
    {
      BOOL v19 = [v15 payload];
      __int16 v20 = [v19 objectForKeyedSubscript:@"container-metadata"];

      uint64_t v29 = v20;
      double v21 = [v20 objectForKeyedSubscript:@"container-radio-type"];
      uint64_t v22 = [v21 integerValue];

      if (v22 != 8)
      {
        if (v22 == 4) {
          [v10 removeAllObjects];
        }
        id v23 = [v5 payload];
        v28 = [v23 objectForKeyedSubscript:@"container-ids"];

        double v24 = [v28 radio];
        id v25 = +[MPCRTCEventConsumer rtcIdentifiersFromRadioIdentifiers:v24];
        [v11 addEntriesFromDictionary:v25];
      }
    }
  }
  uint64_t v26 = +[MPCRTCEventConsumer identifierStringFromItemIdentifiers:v10 radioIdentifiers:v11];

  return v26;
}

- (id)_tapToPlayMetrics:(id)a3 fromItemStartEvent:(id)a4
{
  void v31[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  double v9 = [(MPCRTCEventConsumer *)self _itemStartIncitingEvent:v6 fromItemStartEvent:v7];
  if (v9)
  {
    int v10 = NSNumber;
    [v7 durationSinceEvent:v9];
    double v11 = objc_msgSend(v10, "numberWithDouble:");
    [v8 setObject:v11 forKeyedSubscript:@"perceivedPlayStartTime"];

    uint64_t v12 = [v7 payload];
    id v13 = [v12 objectForKeyedSubscript:@"queue-section-id"];

    v30[0] = @"queue-section-id";
    v30[1] = @"network-operation-type";
    v31[0] = v13;
    v31[1] = &unk_26CC18EB8;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
    uint64_t v15 = [v6 findPreviousEventWithType:@"network-operation" matchingPayload:v14];

    if (v15)
    {
      uint64_t v16 = [v15 payload];
      uint64_t v17 = [v16 objectForKeyedSubscript:@"queueLoadNetworkTime"];
      [v8 setObject:v17 forKeyedSubscript:@"queueLoadNetworkTime"];
    }
    uint64_t v18 = [v9 type];
    int v19 = [v18 isEqual:@"remote-control-begin"];

    if (v19)
    {
      __int16 v20 = [v9 payload];
      double v21 = [v20 objectForKeyedSubscript:@"remote-control-options"];
      uint64_t v22 = [v21 objectForKeyedSubscript:*MEMORY[0x263F54C68]];

      if (v22)
      {
        id v23 = NSNumber;
        double v24 = [v9 date];
        [v24 timeIntervalSinceReferenceDate];
        double v26 = v25;
        [v22 doubleValue];
        v28 = [v23 numberWithDouble:v26 - v27];
        [v8 setObject:v28 forKeyedSubscript:@"commandSendTime"];
      }
    }
  }

  return v8;
}

- (id)_accountSnapshotWithCursor:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = [v3 dictionary];
  v12[0] = @"account-begin";
  v12[1] = @"account-update";
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  id v7 = [v4 findPreviousEventWithTypes:v6 matchingPayload:0];

  if (v7)
  {
    id v8 = [v7 payload];
    double v9 = [v8 objectForKeyedSubscript:@"account-metadata"];

    int v10 = [v9 objectForKeyedSubscript:@"store-front-id"];
    [v5 setObject:v10 forKeyedSubscript:@"StorefrontID"];
  }

  return v5;
}

- (id)_itemStartIncitingEvent:(id)a3 fromItemStartEvent:(id)a4
{
  v21[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v21[0] = @"remote-control-begin";
    v21[1] = @"item-end";
    v21[2] = @"session-reset";
    v21[3] = @"item-failed";
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];
    *(void *)buf = 0;
    uint64_t v16 = buf;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = __Block_byref_object_copy__8025;
    int v19 = __Block_byref_object_dispose__8026;
    id v20 = 0;
    id v8 = [v5 cursorFromEvent:v6 untilEvent:0];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __66__MPCRTCEventConsumer__itemStartIncitingEvent_fromItemStartEvent___block_invoke;
    v14[3] = &unk_2643C62C8;
    v14[4] = buf;
    [v8 enumeratePreviousEventsWithTypes:v7 usingBlock:v14];

    double v9 = (void *)*((void *)v16 + 5);
    if (v9)
    {
      id v10 = v9;
    }
    else
    {
      double v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: _itemStartIncitingEvent: sessionStartEvent=nil", v13, 2u);
      }
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: _itemStartIncitingEvent: itemStartEvent=nil", buf, 2u);
    }
    double v9 = 0;
  }

  return v9;
}

void __66__MPCRTCEventConsumer__itemStartIncitingEvent_fromItemStartEvent___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v18 = a2;
  id v7 = [v18 type];
  id v8 = (void *)[v7 isEqualToString:@"remote-control-begin"];

  if (v8)
  {
    double v9 = [v18 payload];
    id v10 = [v9 objectForKeyedSubscript:@"remote-control-type"];
    unsigned int v11 = [v10 intValue];

    if ((v11 > 5 || ((1 << v11) & 0x35) == 0) && (v11 - 109 > 0x16 || ((1 << (v11 - 109)) & 0x402003) == 0)) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  uint64_t v12 = [v18 type];
  int v13 = [v12 isEqualToString:@"item-end"];
  char v14 = v13;
  if (v13)
  {
    id v8 = [v18 payload];
    id v3 = [v8 objectForKeyedSubscript:@"item-did-play-to-end"];
    if ([v3 BOOLValue]) {
      goto LABEL_10;
    }
  }
  uint64_t v15 = [v18 type];
  if ([v15 isEqualToString:@"item-failed"])
  {

    if ((v14 & 1) == 0)
    {
LABEL_11:

LABEL_17:
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      *a3 = 1;
      goto LABEL_18;
    }
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v16 = [v18 type];
  char v17 = [v16 isEqualToString:@"session-reset"];

  if (v14)
  {
  }
  if (v17) {
    goto LABEL_17;
  }
LABEL_18:
}

- (id)_reasonForEndEvent:(id)a3 cursor:(id)a4
{
  v38[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = @"unknown";
  id v7 = a4;
  id v8 = [v7 cursorFromEvent:v5 untilEvent:0];
  v37 = @"queue-item-id";
  double v9 = [v5 payload];
  id v10 = [v9 objectForKeyedSubscript:@"queue-item-id"];
  v38[0] = v10;
  unsigned int v11 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
  uint64_t v12 = [v8 findPreviousEventWithType:@"item-begin" matchingPayload:v11];

  int v13 = [v5 identifier];
  char v14 = [v12 identifier];
  if ([v13 isEqual:v14]) {
    [v7 cursorUntilEvent:v12];
  }
  else {
  uint64_t v15 = [v7 cursorFromEvent:v5 untilEvent:v12];
  }

  uint64_t v16 = [v5 type];
  if ([v16 isEqualToString:@"item-failed"])
  {

LABEL_7:
    int v19 = @"fail";
LABEL_8:
    id v20 = v19;
    double v21 = @"unknown";
LABEL_9:

    goto LABEL_10;
  }
  char v17 = [v5 type];
  int v18 = [v17 isEqualToString:@"asset-load-end"];

  if (v18) {
    goto LABEL_7;
  }
  id v23 = [v5 payload];
  double v24 = [v23 objectForKeyedSubscript:@"item-did-play-to-end"];
  int v25 = [v24 BOOLValue];

  if (v25)
  {
    int v19 = @"natural";
    goto LABEL_8;
  }
  if (v12)
  {
    v36[0] = @"session-end";
    v36[1] = @"session-reset";
    double v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
    uint64_t v27 = [v15 countOfPreviousEventsWithTypes:v26 matchingPayload:0];

    if (v27 >= 1)
    {
      int v19 = @"endSession";
      goto LABEL_8;
    }
    v28 = [v15 findPreviousEventWithType:@"remote-control-begin" matchingPayload:0];
    double v21 = v28;
    if (v28)
    {
      uint64_t v29 = [(__CFString *)v28 payload];
      id v30 = [v29 objectForKeyedSubscript:@"remote-control-type"];
      int v31 = [v30 unsignedIntValue];

      int v19 = @"unknown";
      if (v31 > 121)
      {
        if (v31 != 122)
        {
          if (v31 != 131) {
            goto LABEL_9;
          }
          v32 = MPCRTCItemEndReasonPlayItemInQueue;
          goto LABEL_29;
        }
LABEL_28:
        v32 = MPCRTCItemEndReasonEndSession;
        goto LABEL_29;
      }
      if (v31 != 1)
      {
        if (v31 != 4) {
          goto LABEL_9;
        }
        v32 = MPCRTCItemEndReasonSkip;
LABEL_29:
        int v19 = *v32;

        goto LABEL_9;
      }
      id v33 = [(__CFString *)v21 payload];
      uint64_t v34 = [v33 objectForKeyedSubscript:@"remote-control-source"];
      int v35 = [v34 containsString:@"migrationPlaybackSession"];

      if (v35) {
        goto LABEL_28;
      }
    }
    int v19 = @"unknown";
    goto LABEL_9;
  }
  int v19 = @"unknown";
LABEL_10:

  return v19;
}

- (id)_payloadForItemSummary:(id)a3 fromItemEvent:(id)a4
{
  v45[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  v45[0] = @"asset-load-end";
  v45[1] = @"item-failed";
  v45[2] = @"item-first-audio-frame";
  double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:3];
  uint64_t v43 = @"queue-item-id";
  id v10 = [v7 payload];
  unsigned int v11 = [v10 objectForKeyedSubscript:@"queue-item-id"];
  id v44 = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __60__MPCRTCEventConsumer__payloadForItemSummary_fromItemEvent___block_invoke;
  v37[3] = &unk_2643C0930;
  id v13 = v6;
  id v38 = v13;
  v39 = self;
  id v14 = v8;
  id v40 = v14;
  [v13 enumeratePreviousEventsWithTypes:v9 matchingPayload:v12 usingBlock:v37];

  uint64_t v15 = [v7 type];
  [v14 setObject:v15 forKeyedSubscript:@"event"];

  [v14 removeObjectForKey:@"networkType"];
  uint64_t v16 = [v7 type];
  if ([v16 isEqualToString:@"item-begin"])
  {
    id v17 = v7;
  }
  else
  {
    uint64_t v41 = @"queue-item-id";
    int v18 = [v7 payload];
    int v19 = [v18 objectForKeyedSubscript:@"queue-item-id"];
    v42 = v19;
    id v20 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    id v17 = [v13 findPreviousEventWithType:@"item-begin" matchingPayload:v20];
  }
  double v21 = [v13 cursorFromEvent:v7 untilEvent:v17];
  uint64_t v22 = v21;
  if (v17)
  {
    id v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v21, "countOfPreviousEventsWithType:matchingPayload:", @"network-type-changed", 0));
    [v14 setObject:v23 forKeyedSubscript:@"networkChangeCount"];

    double v24 = -[MPCRTCEventConsumer _networkType:fromEvent:](self, v13, v17);
    [v14 setObject:v24 forKeyedSubscript:@"initialNetworkType"];
  }
  int v25 = -[MPCRTCEventConsumer _networkType:fromEvent:](self, v13, 0);
  [v14 setObject:v25 forKeyedSubscript:@"finalNetworkType"];

  double v26 = [(MPCRTCEventConsumer *)self _reasonForEndEvent:v7 cursor:v13];
  if ([v26 isEqualToString:@"fail"])
  {
    uint64_t v27 = [v7 payload];
    v28 = [v27 objectForKeyedSubscript:@"asset-load-error"];
    -[MPCRTCEventConsumer _addErrors:toPayload:]((uint64_t)self, v28, v14);
  }
  [v14 setObject:v26 forKeyedSubscript:@"endReason"];
  uint64_t v29 = [v22 findPreviousEventWithType:@"error-resolution" matchingPayload:0];
  id v30 = v29;
  if (v29)
  {
    int v31 = [v29 payload];
    v32 = [v31 objectForKeyedSubscript:@"error-for-resolution"];
    [v14 setObject:v32 forKeyedSubscript:@"errorResolution"];

    id v33 = [v30 payload];
    uint64_t v34 = [v33 objectForKeyedSubscript:@"resolution-type"];
    [v14 setObject:v34 forKeyedSubscript:@"errorResolutionType"];
  }
  id v35 = v14;

  return v35;
}

void __60__MPCRTCEventConsumer__payloadForItemSummary_fromItemEvent___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  id v5 = [*(id *)(a1 + 32) cursorFromEvent:v8 untilEvent:0];
  if (-[MPCRTCEventConsumer _shouldReportItemAssetLoad:forItemEvent:](*(void *)(a1 + 40), v5, v8))
  {
    id v6 = *(void **)(a1 + 48);
    id v7 = [*(id *)(a1 + 40) _payloadForItemAssetLoad:v5 fromItemEvent:v8];
    [v6 addEntriesFromDictionary:v7];

    *a3 = 1;
  }
}

- (id)_networkType:(void *)a3 fromEvent:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    if (v6)
    {
      uint64_t v8 = [v5 cursorFromEvent:v6 untilEvent:0];

      id v5 = (id)v8;
    }
    double v9 = [v5 findPreviousEventWithType:@"network-type-changed" matchingPayload:0];
    id v10 = v9;
    if (v9)
    {
      unsigned int v11 = [v9 payload];
      a1 = [v11 objectForKeyedSubscript:@"network-type"];
    }
    else
    {
      a1 = &unk_26CC18EA0;
    }
  }

  return a1;
}

- (void)_addErrors:(void *)a3 toPayload:
{
  id v22 = a2;
  id v5 = a3;
  if (a1 && v22)
  {
    id v6 = [v22 domain];
    [v5 setObject:v6 forKeyedSubscript:@"errorDomain"];

    id v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v22, "code"));
    [v5 setObject:v7 forKeyedSubscript:@"errorCode"];

    id v8 = v22;
    id v9 = 0;
    uint64_t v10 = *MEMORY[0x263F08608];
    uint64_t v11 = 1;
    double v21 = v8;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      uint64_t v12 = [v8 userInfo];
      id v13 = [v12 objectForKeyedSubscript:v10];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = [v13 domain];
        uint64_t v15 = objc_msgSend(@"errorDomain", "stringByAppendingFormat:", @"-%d", v11);
        [v5 setObject:v14 forKeyedSubscript:v15];

        uint64_t v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "code"));
        id v17 = objc_msgSend(@"errorCode", "stringByAppendingFormat:", @"-%d", v11);
        [v5 setObject:v16 forKeyedSubscript:v17];
      }
      else if ([MEMORY[0x263F08900] isValidJSONObject:v13])
      {
        int v18 = [MEMORY[0x263F08900] dataWithJSONObject:v13 options:8 error:0];
        int v19 = (void *)[[NSString alloc] initWithData:v18 encoding:4];
        [v5 setObject:v19 forKeyedSubscript:@"errorJSON"];

        id v9 = v8;
        id v8 = 0;
        break;
      }
      id v9 = v13;

      uint64_t v11 = (v11 + 1);
      id v8 = v9;
    }
    while (v9);

    id v20 = objc_msgSend(v21, "msv_analyticSignature");
    [v5 setObject:v20 forKeyedSubscript:@"analyticSignature"];
  }
}

- (uint64_t)_shouldReportItemAssetLoad:(void *)a3 forItemEvent:
{
  v37[3] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v37[0] = @"asset-load-end";
    v37[1] = @"item-failed";
    v37[2] = @"item-first-audio-frame";
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:3];
    id v8 = [v6 type];
    int v9 = [v7 containsObject:v8];

    if (v9)
    {
      id v35 = @"queue-item-id";
      uint64_t v10 = [v6 payload];
      uint64_t v11 = [v10 objectForKeyedSubscript:@"queue-item-id"];
      uint64_t v36 = v11;
      uint64_t v12 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];

      id v13 = [v5 cursorFromEvent:v6 untilEvent:0];
      uint64_t v34 = @"item-begin";
      id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
      uint64_t v15 = [v13 findPreviousEventWithTypes:v14 matchingPayload:0];

      if (!v15) {
        goto LABEL_8;
      }
      uint64_t v16 = [v15 payload];
      id v17 = [v16 objectForKeyedSubscript:@"queue-item-id"];
      int v18 = [v6 payload];
      int v19 = [v18 objectForKeyedSubscript:@"queue-item-id"];
      int v20 = [v17 isEqualToString:v19];

      if (!v20)
      {
LABEL_8:
        uint64_t v22 = 0;
LABEL_12:

        goto LABEL_13;
      }
      double v21 = [v5 cursorFromEvent:v6 untilEvent:v15];
      if ([v21 countOfPreviousEventsWithType:@"item-first-audio-frame" matchingPayload:v12] > 0) {
        goto LABEL_6;
      }
      id v23 = [v6 type];
      char v24 = [v23 isEqualToString:@"item-first-audio-frame"];

      if (v24)
      {
LABEL_10:
        uint64_t v22 = 1;
        goto LABEL_11;
      }
      double v26 = [v6 type];
      int v27 = [v26 isEqualToString:@"item-failed"];

      if (v27)
      {
        v28 = [v21 findPreviousEventWithType:@"asset-load-end" matchingPayload:v12];
        uint64_t v29 = v28;
        if (v28)
        {
          id v30 = [v28 payload];
          int v31 = [v30 objectForKeyedSubscript:@"asset-load-error"];

          if (!v31)
          {

            goto LABEL_10;
          }
        }
      }
      else
      {
        uint64_t v29 = [v6 type];
        if ([v29 isEqualToString:@"asset-load-end"])
        {
          v32 = [v6 payload];
          id v33 = [v32 objectForKeyedSubscript:@"asset-load-error"];

          if (v33) {
            goto LABEL_10;
          }
LABEL_6:
          uint64_t v22 = 0;
LABEL_11:

          goto LABEL_12;
        }
      }

      goto LABEL_6;
    }
  }
  uint64_t v22 = 0;
LABEL_13:

  return v22;
}

- (id)_payloadForItemSummary:(id)a3 fromEvent:(id)a4
{
  v14[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 payload];
  int v9 = [v8 objectForKeyedSubscript:@"queue-item-id"];

  if (v9)
  {
    id v10 = v7;
  }
  else
  {
    v14[0] = @"item-begin";
    v14[1] = @"item-first-audio-frame";
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
    id v10 = [v6 findPreviousEventWithTypes:v11 matchingPayload:0];
  }
  uint64_t v12 = [(MPCRTCEventConsumer *)self _payloadForItemSummary:v6 fromItemEvent:v10];

  return v12;
}

- (id)_payloadForItemAssetLoad:(id)a3 fromItemEvent:(id)a4
{
  v125[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v100 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v98 = self;
  id v8 = [(MPCRTCEventConsumer *)self _accountSnapshotWithCursor:v6];
  [v7 addEntriesFromDictionary:v8];

  int v9 = [v100 type];
  [v7 setObject:v9 forKeyedSubscript:@"event"];

  id v10 = -[MPCRTCEventConsumer _networkType:fromEvent:](self, v6, 0);
  [v7 setObject:v10 forKeyedSubscript:@"networkType"];

  uint64_t v11 = [v100 payload];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"queue-section-id"];
  [v7 setObject:v12 forKeyedSubscript:@"queueIdentifier"];

  v125[0] = @"session-begin";
  v125[1] = @"session-restore-begin";
  v125[2] = @"session-migrate-begin";
  v125[3] = @"session-reset";
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v125 count:4];
  v95 = [v6 findPreviousEventWithTypes:v13 matchingPayload:0];

  id v14 = [v95 payload];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"session-id"];
  [v7 setObject:v15 forKeyedSubscript:@"sessionIdentifier"];

  uint64_t v16 = [v6 cursorUntilEvent:v95];
  v93 = -[MPCRTCEventConsumer _firstItemAssetLoadEventWithCursor:fromEvent:matchingPayload:]((uint64_t)v98, v16, v100, 0);

  id v17 = NSNumber;
  int v18 = [v93 identifier];
  int v19 = [v100 identifier];
  int v20 = objc_msgSend(v17, "numberWithBool:", objc_msgSend(v18, "isEqual:", v19));
  [v7 setObject:v20 forKeyedSubscript:@"sessionStartItem"];

  v123 = @"queue-item-id";
  double v21 = [v100 payload];
  uint64_t v22 = [v21 objectForKeyedSubscript:@"queue-item-id"];
  v124 = v22;
  v99 = [NSDictionary dictionaryWithObjects:&v124 forKeys:&v123 count:1];

  v97 = [v6 findPreviousEventWithType:@"item-begin" matchingPayload:v99];
  id v23 = [v97 payload];
  char v24 = [v23 objectForKeyedSubscript:@"item-metadata"];
  int v25 = [v24 objectForKeyedSubscript:@"item-is-start-item"];
  [v7 setObject:v25 forKeyedSubscript:@"queueStartItem"];

  v92 = [v6 findPreviousEventWithType:@"item-begin" matchingPayload:0];
  double v26 = NSNumber;
  int v27 = [v92 identifier];
  v28 = [v97 identifier];
  uint64_t v29 = objc_msgSend(v26, "numberWithBool:", objc_msgSend(v27, "isEqual:", v28));
  [v7 setObject:v29 forKeyedSubscript:@"isCurrentItem"];

  v94 = [v6 findPreviousEventWithType:@"item-ready-to-play" matchingPayload:v99];
  if (v94)
  {
    id v30 = NSNumber;
    [v94 durationSinceEvent:v97];
    int v31 = objc_msgSend(v30, "numberWithDouble:");
    [v7 setObject:v31 forKeyedSubscript:@"readyToPlayTime"];
  }
  v96 = [v6 findPreviousEventWithType:@"item-configuration-end" matchingPayload:v99];
  if (v96)
  {
    v32 = [v96 payload];
    id v33 = [v32 objectForKeyedSubscript:@"hls-metadata-wait-time"];
    [v7 setObject:v33 forKeyedSubscript:@"itemConfigHLSWaitTime"];

    uint64_t v34 = [v6 findPreviousEventWithType:@"item-configuration-begin" matchingPayload:v99];
    [v96 durationSinceEvent:v34];
    double v36 = v35;

    v37 = [NSNumber numberWithDouble:v36];
    [v7 setObject:v37 forKeyedSubscript:@"itemConfigWaitTime"];
  }
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x3032000000;
  v111 = __Block_byref_object_copy__8025;
  v112 = __Block_byref_object_dispose__8026;
  id v38 = [v100 type];
  int v39 = [v38 isEqualToString:@"item-first-audio-frame"];
  id v40 = v100;
  if (!v39) {
    id v40 = 0;
  }
  id v113 = v40;

  v91 = [v6 cursorFromEvent:v100 untilEvent:v97];
  v107[0] = MEMORY[0x263EF8330];
  v107[1] = 3221225472;
  v107[2] = __62__MPCRTCEventConsumer__payloadForItemAssetLoad_fromItemEvent___block_invoke;
  v107[3] = &unk_2643C62C8;
  v107[4] = &v108;
  [v91 enumeratePreviousEventsWithType:@"item-first-audio-frame" matchingPayload:v99 usingBlock:v107];
  if (v109[5])
  {
    uint64_t v41 = -[MPCRTCEventConsumer _tapToPlayMetrics:fromItemStartEvent:](v98, "_tapToPlayMetrics:fromItemStartEvent:", v6);
    [v7 addEntriesFromDictionary:v41];
  }
  else
  {
    uint64_t v41 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = [v100 type];
      uint64_t v43 = +[MPCRTCEventConsumer dateFormatter];
      id v44 = [v100 date];
      v45 = [v43 stringFromDate:v44];
      *(_DWORD *)buf = 138412546;
      v120 = v42;
      __int16 v121 = 2112;
      v122 = v45;
      _os_log_impl(&dword_21BB87000, v41, OS_LOG_TYPE_DEFAULT, "MPCRTCEventConsumer: _payloadForItemAssetLoad: firstAudioFrame=nil from item event %@ at %@", buf, 0x16u);
    }
  }

  id v46 = [v100 type];
  if ([v46 isEqualToString:@"asset-load-end"])
  {
    id v47 = v100;
  }
  else
  {
    id v47 = [v6 findPreviousEventWithType:@"asset-load-end" matchingPayload:v99];
  }
  v48 = v47;

  if (v48)
  {
    v49 = [v48 payload];
    uint64_t v88 = [v49 objectForKeyedSubscript:@"rtc-service-id"];

    if (v88)
    {
      [v7 setObject:v88 forKeyedSubscript:@"serviceName"];
    }
    else
    {
      id v50 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        v51 = +[MPCRTCEventConsumer dateFormatter];
        v52 = [v48 date];
        v53 = [v51 stringFromDate:v52];
        *(_DWORD *)buf = 138543362;
        v120 = v53;
        _os_log_impl(&dword_21BB87000, v50, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: _payloadForItemAssetLoad: serviceName=nil for assetLoadEndEvent date=%{public}@", buf, 0xCu);
      }
    }
    v54 = objc_msgSend(v48, "payload", v88);
    v90 = [v54 objectForKeyedSubscript:@"asset-load-error"];
    if (v90)
    {
    }
    else
    {
      v55 = [v100 payload];
      v90 = [v55 objectForKeyedSubscript:@"asset-load-error"];

      if (!v90)
      {
        v90 = 0;
        goto LABEL_24;
      }
    }
    -[MPCRTCEventConsumer _addErrors:toPayload:]((uint64_t)v98, v90, v7);
LABEL_24:
    id v56 = objc_msgSend(NSNumber, "numberWithBool:", -[MPCRTCEventConsumer _itemWasPreviouslyLoaded:cursor:](v98, "_itemWasPreviouslyLoaded:cursor:", v100, v6));
    [v7 setObject:v56 forKeyedSubscript:@"assetPreloaded"];

    v57 = [v6 cursorFromEvent:v48 untilEvent:0];
    v58 = [v57 findPreviousEventWithType:@"asset-load-begin" matchingPayload:v99];

    [(MPCRTCEventConsumer *)v98 _updateAssetSelectionEvent:v7 fromAssetLoadEndEvent:v48 untilAssetLoadBeginEvent:v58 cursor:v6];
    v59 = NSNumber;
    [v48 durationSinceEvent:v58];
    v60 = objc_msgSend(v59, "numberWithDouble:");
    [v7 setObject:v60 forKeyedSubscript:@"createAssetDuration"];

    v61 = [MEMORY[0x263EFF980] array];
    v62 = [v6 cursorUntilEvent:v58];
    v105[0] = MEMORY[0x263EF8330];
    v105[1] = 3221225472;
    v105[2] = __62__MPCRTCEventConsumer__payloadForItemAssetLoad_fromItemEvent___block_invoke_53;
    v105[3] = &unk_2643C0908;
    id v63 = v61;
    id v106 = v63;
    [v62 enumeratePreviousEventsWithType:@"remote-control-begin" usingBlock:v105];

    if ([v63 count]) {
      [v63 componentsJoinedByString:@" "];
    }
    else {
    v64 = [MEMORY[0x263EFF9D0] null];
    }
    [v7 setObject:v64 forKeyedSubscript:@"assetLoadCommandEvents"];

    v65 = [(MPCRTCEventConsumer *)v98 _mediaIdentifierFromItemAssetLoadEndEvent:v48 cursor:v6];
    [v7 setObject:v65 forKeyedSubscript:@"MediaIdentifier"];

    v66 = [(MPCRTCEventConsumer *)v98 _itemAssetTypeFromItemAssetLoadEvent:v48 cursor:v6];
    v67 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v66, "containsObject:", @"hls"));
    [v7 setObject:v67 forKeyedSubscript:@"isHLS"];

    v68 = [v66 componentsJoinedByString:@"."];
    [v7 setObject:v68 forKeyedSubscript:@"assetType"];

    v69 = NSNumber;
    v117 = @"queue-section-id";
    v70 = [v48 payload];
    v71 = [v70 objectForKeyedSubscript:@"queue-section-id"];
    v118 = v71;
    v72 = [NSDictionary dictionaryWithObjects:&v118 forKeys:&v117 count:1];
    v73 = objc_msgSend(v69, "numberWithInteger:", objc_msgSend(v6, "countOfPreviousEventsWithType:matchingPayload:", @"queue-item-add", v72));
    [v7 setObject:v73 forKeyedSubscript:@"itemQueueSize"];
  }
  v74 = [v6 cursorFromEvent:v97 untilEvent:0];
  v75 = [v74 findPreviousEventWithType:0 matchingPayload:0];
  v76 = [v74 cursorFromEvent:v75 untilEvent:0];

  v77 = [v76 findPreviousEventWithType:@"item-begin" matchingPayload:0];
  v78 = v77;
  if (v77)
  {
    v115 = @"queue-item-id";
    v79 = [v77 payload];
    v80 = [v79 objectForKeyedSubscript:@"queue-item-id"];
    v116 = v80;
    v81 = [NSDictionary dictionaryWithObjects:&v116 forKeys:&v115 count:1];
    v82 = [v76 findPreviousEventWithType:@"asset-load-end" matchingPayload:v81];

    if (v82)
    {
      v83 = [(MPCRTCEventConsumer *)v98 _itemAssetTypeFromItemAssetLoadEvent:v82 cursor:v76];
      v84 = [v83 componentsJoinedByString:@"."];
      [v7 setObject:v84 forKeyedSubscript:@"previousItemAssetType"];

      v114[0] = @"application-termination";
      v114[1] = @"item-failed";
      v114[2] = @"item-end";
      v85 = [MEMORY[0x263EFF8C0] arrayWithObjects:v114 count:3];
      v101[0] = MEMORY[0x263EF8330];
      v101[1] = 3221225472;
      v101[2] = __62__MPCRTCEventConsumer__payloadForItemAssetLoad_fromItemEvent___block_invoke_2;
      v101[3] = &unk_2643C0930;
      id v102 = v76;
      v103 = v98;
      id v104 = v7;
      [v102 enumeratePreviousEventsWithTypes:v85 usingBlock:v101];
    }
  }
  id v86 = v7;

  _Block_object_dispose(&v108, 8);

  return v86;
}

- (id)_firstItemAssetLoadEventWithCursor:(void *)a3 fromEvent:(void *)a4 matchingPayload:
{
  v45[3] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v34 = a3;
  id v35 = a4;
  if (a1)
  {
    id v8 = (id *)(a1 + 24);
    if (*(void *)(a1 + 24))
    {
      unint64_t v9 = [v34 monotonicTimeNanoSeconds];
      if (v9 >= [*v8 monotonicTimeNanoSeconds])
      {
        unint64_t v10 = [*v8 monotonicTimeNanoSeconds];
        uint64_t v11 = [v7 endEvent];
        unint64_t v12 = [v11 monotonicTimeNanoSeconds];

        if (v10 >= v12 && (!v35 || ([*v8 matchesPayload:v35] & 1) != 0)) {
          goto LABEL_29;
        }
      }
    }
    v45[0] = @"asset-load-end";
    v45[1] = @"item-failed";
    v45[2] = @"item-first-audio-frame";
    id v13 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v45, 3, v34);
    id v14 = [v7 endEvent];
    uint64_t v15 = [v14 type];
    if ([v13 containsObject:v15])
    {
      uint64_t v16 = [v7 endEvent];
      int v17 = [v16 matchesPayload:v35];

      if (v17)
      {
        uint64_t v18 = [v7 endEvent];
        id v19 = *v8;
        id *v8 = (id)v18;
LABEL_28:

LABEL_29:
        id v32 = *v8;
        goto LABEL_30;
      }
    }
    else
    {
    }
    int v20 = [MEMORY[0x263EFF980] array];
    v44[0] = @"asset-load-end";
    v44[1] = @"item-failed";
    v44[2] = @"item-first-audio-frame";
    double v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:3];
    if (v35) {
      id v22 = v35;
    }
    else {
      id v22 = (id)MEMORY[0x263EFFA78];
    }
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __84__MPCRTCEventConsumer__firstItemAssetLoadEventWithCursor_fromEvent_matchingPayload___block_invoke;
    v40[3] = &unk_2643C0908;
    id v23 = v20;
    id v41 = v23;
    [v7 enumeratePreviousEventsWithTypes:v21 matchingPayload:v22 usingBlock:v40];

    v43[0] = @"asset-load-end";
    v43[1] = @"item-failed";
    v43[2] = @"item-first-audio-frame";
    char v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:3];
    int v25 = [v34 type];
    if ([v24 containsObject:v25]) {
      double v26 = v34;
    }
    else {
      double v26 = 0;
    }
    objc_storeStrong((id *)(a1 + 24), v26);

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v19 = v23;
    uint64_t v27 = [v19 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v37;
      while (2)
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v37 != v29) {
            objc_enumerationMutation(v19);
          }
          int v31 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if (-[MPCRTCEventConsumer _shouldReportItemAssetLoad:forItemEvent:](a1, v7, v31))
          {
            objc_storeStrong((id *)(a1 + 24), v31);
            goto LABEL_27;
          }
        }
        uint64_t v28 = [v19 countByEnumeratingWithState:&v36 objects:v42 count:16];
        if (v28) {
          continue;
        }
        break;
      }
    }
LABEL_27:

    goto LABEL_28;
  }
  id v32 = 0;
LABEL_30:

  return v32;
}

void __62__MPCRTCEventConsumer__payloadForItemAssetLoad_fromItemEvent___block_invoke(uint64_t a1, void *a2)
{
}

void __62__MPCRTCEventConsumer__payloadForItemAssetLoad_fromItemEvent___block_invoke_53(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 payload];
  id v3 = [v4 objectForKeyedSubscript:@"remote-control-type"];
  [v2 addObject:v3];
}

void __62__MPCRTCEventConsumer__payloadForItemAssetLoad_fromItemEvent___block_invoke_2(id *a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  id v5 = [a1[4] cursorFromEvent:v7 untilEvent:0];
  if (-[MPCRTCEventConsumer _shouldReportItemSummary:forEvent:]((uint64_t)a1[5], v5, v7))
  {
    id v6 = [a1[5] _reasonForEndEvent:v7 cursor:v5];
    [a1[6] setObject:v6 forKeyedSubscript:@"previousItemEndReason"];

    *a3 = 1;
  }
}

- (BOOL)_shouldReportItemSummary:(void *)a3 forEvent:
{
  v34[4] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!a1)
  {
    BOOL v18 = 0;
    goto LABEL_13;
  }
  id v7 = -[MPCRTCEventConsumer _sessionCursorWithCursor:fromEvent:](a1, v5, v6);
  v34[0] = @"item-begin";
  v34[1] = @"item-first-audio-frame";
  void v34[2] = @"item-failed";
  v34[3] = @"item-end";
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
  unint64_t v9 = [v7 findPreviousEventWithTypes:v8 matchingPayload:0];

  unint64_t v10 = [v6 type];
  int v11 = [v10 isEqualToString:@"item-end"];

  if (!v11)
  {
LABEL_7:
    if (!v9)
    {
LABEL_11:
      BOOL v18 = 0;
      goto LABEL_12;
    }
    id v19 = [v9 type];
    if ([v19 isEqualToString:@"item-end"])
    {
LABEL_9:

      goto LABEL_11;
    }
    int v20 = [v9 type];
    char v21 = [v20 isEqualToString:@"item-failed"];

    if (v21) {
      goto LABEL_11;
    }
    id v23 = [v6 type];
    if ([v23 isEqualToString:@"item-failed"])
    {
      char v24 = [v9 type];
      if ([v24 isEqualToString:@"item-first-audio-frame"])
      {
        int v25 = [v9 payload];
        double v26 = [v25 objectForKeyedSubscript:@"queue-item-id"];
        uint64_t v27 = [v6 payload];
        uint64_t v28 = [v27 objectForKeyedSubscript:@"queue-item-id"];
        char v31 = [v26 isEqualToString:v28];

        if (v31) {
          goto LABEL_22;
        }
        goto LABEL_20;
      }
    }
LABEL_20:
    id v19 = [v6 type];
    if (([v19 isEqualToString:@"application-termination"] & 1) == 0) {
      goto LABEL_9;
    }
    uint64_t v29 = [v9 type];
    char v30 = [v29 isEqualToString:@"item-first-audio-frame"];

    if ((v30 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_22:
    BOOL v18 = 1;
    goto LABEL_12;
  }
  id v32 = @"queue-item-id";
  unint64_t v12 = [v6 payload];
  id v13 = [v12 objectForKeyedSubscript:@"queue-item-id"];
  id v33 = v13;
  id v14 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];

  uint64_t v15 = [v7 findPreviousEventWithType:@"item-begin" matchingPayload:v14];
  uint64_t v16 = [v5 cursorFromEvent:v6 untilEvent:v15];
  int v17 = [v16 findPreviousEventWithType:@"item-failed" matchingPayload:v14];
  BOOL v18 = v17 == 0;

  if (!v17
    && [v16 countOfPreviousEventsWithType:@"item-first-audio-frame" matchingPayload:v14] <= 0)
  {

    goto LABEL_7;
  }

LABEL_12:
LABEL_13:

  return v18;
}

- (id)_sessionCursorWithCursor:(void *)a3 fromEvent:
{
  v14[4] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    if (v6)
    {
      id v8 = [v5 cursorFromEvent:v6 untilEvent:0];
    }
    else
    {
      id v8 = v5;
    }
    unint64_t v9 = v8;
    v14[0] = @"session-begin";
    v14[1] = @"session-restore-begin";
    v14[2] = @"session-migrate-begin";
    void v14[3] = @"session-reset";
    unint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:4];
    int v11 = [v9 findPreviousEventWithTypes:v10 matchingPayload:0];

    unint64_t v12 = [v9 cursorUntilEvent:v11];
  }
  else
  {
    unint64_t v12 = 0;
  }

  return v12;
}

uint64_t __84__MPCRTCEventConsumer__firstItemAssetLoadEventWithCursor_fromEvent_matchingPayload___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) insertObject:a2 atIndex:0];
}

- (id)_payloadForQueueLoad:(id)a3 fromQueueLoadEndEvent:(id)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  unint64_t v9 = [(MPCRTCEventConsumer *)self _accountSnapshotWithCursor:v6];
  [v8 addEntriesFromDictionary:v9];

  unint64_t v10 = [v7 type];
  [v8 setObject:v10 forKeyedSubscript:@"event"];

  int v11 = [v7 payload];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"queue-rtc-service-id"];

  if (v12)
  {
    [v8 setObject:v12 forKeyedSubscript:@"serviceName"];
  }
  else
  {
    id v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = +[MPCRTCEventConsumer dateFormatter];
      uint64_t v15 = [v7 date];
      uint64_t v16 = [v14 stringFromDate:v15];
      *(_DWORD *)buf = 138543362;
      v62 = v16;
      _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: _payloadForSessionStart: serviceName=nil for queueLoadEndEvent date=%{public}@", buf, 0xCu);
    }
  }
  v51 = (void *)v12;
  int v17 = [v6 cursorFromEvent:v7 untilEvent:0];
  BOOL v18 = -[MPCRTCEventConsumer _networkType:fromEvent:](self, v17, 0);
  [v8 setObject:v18 forKeyedSubscript:@"networkType"];

  id v19 = [v7 payload];
  int v20 = [v19 objectForKeyedSubscript:@"queue-section-id"];

  char v21 = [v7 payload];
  id v22 = [v21 objectForKeyedSubscript:@"queue-load-error"];

  if (v22) {
    -[MPCRTCEventConsumer _addErrors:toPayload:]((uint64_t)self, v22, v8);
  }
  v59[0] = @"queue-section-id";
  v59[1] = @"network-operation-type";
  v60[0] = v20;
  v60[1] = &unk_26CC18EB8;
  id v23 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];
  v48 = v6;
  char v24 = [v6 findPreviousEventWithType:@"network-operation" matchingPayload:v23];

  if (v24)
  {
    int v25 = [v24 payload];
    double v26 = [v25 objectForKeyedSubscript:@"queueLoadNetworkTime"];
    [v8 setObject:v26 forKeyedSubscript:@"queueLoadNetworkTime"];
  }
  [v8 setObject:v20 forKeyedSubscript:@"queueIdentifier"];
  v58[0] = @"session-begin";
  v58[1] = @"session-restore-begin";
  v58[2] = @"session-migrate-begin";
  v58[3] = @"session-reset";
  uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:4];
  id v50 = [v17 findPreviousEventWithTypes:v27 matchingPayload:0];

  uint64_t v28 = [v50 payload];
  uint64_t v29 = [v28 objectForKeyedSubscript:@"session-id"];
  [v8 setObject:v29 forKeyedSubscript:@"sessionIdentifier"];

  id v56 = @"queue-section-id";
  v57 = v20;
  char v30 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
  id v47 = [v17 findPreviousEventWithType:@"queue-load-begin" matchingPayload:v30];

  char v31 = NSNumber;
  [v7 durationSinceEvent:v47];
  id v32 = objc_msgSend(v31, "numberWithDouble:");
  [v8 setObject:v32 forKeyedSubscript:@"queueLoadDuration"];

  v54 = @"queue-section-id";
  v55 = v20;
  id v33 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  v49 = v7;
  [v17 findPreviousEventWithType:@"queue-add" matchingPayload:v33];
  v34 = id v46 = v24;

  id v35 = [v34 payload];
  long long v36 = [v35 objectForKeyedSubscript:@"queue-reporting-metadata"];

  long long v37 = [v36 objectForKeyedSubscript:@"feature-name"];
  [v8 setObject:v37 forKeyedSubscript:@"queueEndpoint"];

  long long v38 = [v36 objectForKeyedSubscript:@"application-bundle-id"];
  [v8 setObject:v38 forKeyedSubscript:@"queueBundleID"];

  long long v39 = -[MPCRTCEventConsumer _sessionCursorWithCursor:fromEvent:]((uint64_t)self, v48, v34);
  BOOL v40 = [v39 countOfPreviousEventsWithType:@"queue-add" matchingPayload:0] == 0;
  id v41 = [NSNumber numberWithBool:v40];
  [v8 setObject:v41 forKeyedSubscript:@"initialQueue"];

  v42 = NSNumber;
  v52 = @"queue-section-id";
  v53 = v20;
  uint64_t v43 = [NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
  id v44 = objc_msgSend(v42, "numberWithInteger:", objc_msgSend(v17, "countOfPreviousEventsWithType:matchingPayload:", @"queue-item-add", v43));
  [v8 setObject:v44 forKeyedSubscript:@"items"];

  return v8;
}

- (id)_payloadForSessionSummary:(id)a3 fromEvent:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  unint64_t v9 = -[MPCRTCEventConsumer _sessionCursorWithCursor:fromEvent:]((uint64_t)self, v6, 0);
  unint64_t v10 = -[MPCRTCEventConsumer _firstItemAssetLoadEventWithCursor:fromEvent:matchingPayload:]((uint64_t)self, v9, v7, 0);
  if (v10)
  {
    uint64_t v11 = [(MPCRTCEventConsumer *)self _payloadForSessionStart:v6 fromEvent:v10];

    id v8 = (void *)v11;
  }
  else
  {
    uint64_t v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v25 = [v7 type];
      id v13 = +[MPCRTCEventConsumer dateFormatter];
      id v14 = [v7 date];
      uint64_t v15 = [v13 stringFromDate:v14];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v25;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v15;
      _os_log_impl(&dword_21BB87000, v12, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: _payloadForSessionSummary: sessionStartItemEvent=nil event.type=%{public}@ event.date=%{public}@", buf, 0x16u);
    }
  }
  uint64_t v16 = [v7 type];
  [v8 setObject:v16 forKeyedSubscript:@"event"];

  int v17 = -[MPCRTCEventConsumer _networkType:fromEvent:](self, v6, 0);
  [v8 setObject:v17 forKeyedSubscript:@"networkType"];

  BOOL v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "countOfPreviousEventsWithType:matchingPayload:", @"queue-add", 0));
  [v8 setObject:v18 forKeyedSubscript:@"queuesAdded"];

  id v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "countOfPreviousEventsWithType:matchingPayload:", @"queue-load-error", 0));
  [v8 setObject:v19 forKeyedSubscript:@"queuesFailed"];

  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v30 = 0;
  char v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  v34[0] = @"item-first-audio-frame";
  v34[1] = @"asset-load-end";
  void v34[2] = @"item-failed";
  int v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:3];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __59__MPCRTCEventConsumer__payloadForSessionSummary_fromEvent___block_invoke;
  v26[3] = &unk_2643C63F8;
  v26[4] = self;
  id v21 = v9;
  id v27 = v21;
  uint64_t v28 = buf;
  uint64_t v29 = &v30;
  [v21 enumeratePreviousEventsWithTypes:v20 usingBlock:v26];

  id v22 = [NSNumber numberWithInteger:*(void *)(*(void *)&buf[8] + 24)];
  [v8 setObject:v22 forKeyedSubscript:@"itemsPlayed"];

  id v23 = [NSNumber numberWithInteger:v31[3]];
  [v8 setObject:v23 forKeyedSubscript:@"itemsFailed"];

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(buf, 8);

  return v8;
}

void __59__MPCRTCEventConsumer__payloadForSessionSummary_fromEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  LODWORD(v4) = -[MPCRTCEventConsumer _shouldReportItemAssetLoad:forItemEvent:](v3, v4, v5);
  id v6 = [v5 type];

  if (v4)
  {
    int v7 = [v6 isEqualToString:@"item-first-audio-frame"];

    uint64_t v8 = a1 + 56;
    if (v7) {
      uint64_t v8 = a1 + 48;
    }
  }
  else
  {
    int v9 = [v6 isEqualToString:@"item-failed"];

    if (!v9) {
      return;
    }
    uint64_t v8 = a1 + 56;
  }
  ++*(void *)(*(void *)(*(void *)v8 + 8) + 24);
}

- (id)_payloadForSessionStart:(id)a3 fromEvent:(id)a4
{
  v90[4] = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = (objc_class *)MEMORY[0x263EFF9A0];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  unint64_t v10 = [v6 type];
  [v9 setObject:v10 forKeyedSubscript:@"event"];

  uint64_t v11 = [(MPCRTCEventConsumer *)self _accountSnapshotWithCursor:v8];
  [v9 addEntriesFromDictionary:v11];

  uint64_t v12 = [v8 cursorFromEvent:v6 untilEvent:0];

  v90[0] = @"session-begin";
  v90[1] = @"session-restore-begin";
  v90[2] = @"session-migrate-begin";
  v90[3] = @"session-reset";
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v90 count:4];
  id v14 = [v6 type];
  if ([v13 containsObject:v14])
  {
    id v15 = v6;
  }
  else
  {
    v89[0] = @"session-begin";
    v89[1] = @"session-restore-begin";
    v89[2] = @"session-migrate-begin";
    v89[3] = @"session-reset";
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:4];
    id v15 = [v12 findPreviousEventWithTypes:v16 matchingPayload:0];
  }
  int v17 = [v15 payload];
  BOOL v18 = [v17 objectForKeyedSubscript:@"session-id"];
  [v9 setObject:v18 forKeyedSubscript:@"sessionIdentifier"];

  id v19 = v6;
  int v20 = [v19 type];
  v79 = v15;
  v80 = v9;
  if ([v20 isEqualToString:@"asset-load-end"]) {
    goto LABEL_7;
  }
  id v21 = [v19 type];
  if ([v21 isEqualToString:@"item-first-audio-frame"])
  {

LABEL_7:
    goto LABEL_8;
  }
  uint64_t v43 = [v19 type];
  char v44 = [v43 isEqualToString:@"item-failed"];

  id v42 = v19;
  if (v44)
  {
LABEL_8:
    if (-[MPCRTCEventConsumer _shouldReportItemAssetLoad:forItemEvent:]((uint64_t)self, v12, v19))
    {
      id v22 = [(MPCRTCEventConsumer *)self _payloadForItemAssetLoad:v12 fromItemEvent:v19];
      id v23 = [v22 objectForKeyedSubscript:@"createAssetDuration"];
      [v9 setObject:v23 forKeyedSubscript:@"initialItemLoadDuration"];

      char v24 = [v22 objectForKeyedSubscript:@"perceivedPlayStartTime"];
      [v9 setObject:v24 forKeyedSubscript:@"perceivedPlayStartTime"];

      int v25 = [v22 objectForKeyedSubscript:@"errorCode"];

      if (v25)
      {
        double v26 = [v22 objectForKeyedSubscript:@"errorCode"];
        [v9 setObject:v26 forKeyedSubscript:@"errorCode"];

        id v27 = [v22 objectForKeyedSubscript:@"errorDomain"];
        [v9 setObject:v27 forKeyedSubscript:@"errorDomain"];
      }
    }
    else
    {
      id v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = [v19 type];
        uint64_t v29 = +[MPCRTCEventConsumer dateFormatter];
        uint64_t v30 = [v19 date];
        char v31 = [v29 stringFromDate:v30];
        *(_DWORD *)buf = 138543618;
        id v86 = v28;
        __int16 v87 = 2114;
        uint64_t v88 = v31;
        _os_log_impl(&dword_21BB87000, v22, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: _payloadForSessionStart: Invalid item start event. type=%{public}@ date=%{public}@", buf, 0x16u);

        id v9 = v80;
      }
    }

    v83 = @"queue-section-id";
    uint64_t v32 = [v19 payload];
    uint64_t v33 = [v32 objectForKeyedSubscript:@"queue-section-id"];
    v84 = v33;
    id v34 = [NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
    id v35 = [v12 findPreviousEventWithType:@"queue-load-end" matchingPayload:v34];

    if (v35)
    {
      uint64_t v36 = [v35 payload];
      uint64_t v37 = [v36 objectForKeyedSubscript:@"queue-rtc-service-id"];

      if (v37)
      {
        [v9 setObject:v37 forKeyedSubscript:@"serviceName"];
      }
      else
      {
        v71 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          v72 = +[MPCRTCEventConsumer dateFormatter];
          v73 = [v35 date];
          v74 = [v72 stringFromDate:v73];
          *(_DWORD *)buf = 138543362;
          id v86 = v74;
          _os_log_impl(&dword_21BB87000, v71, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: _payloadForSessionStart: serviceName=nil for queueLoadEndEvent date=%{public}@", buf, 0xCu);

          id v9 = v80;
        }
      }
      id v42 = v35;
    }
    else
    {
      uint64_t v37 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        long long v38 = [v19 type];
        long long v39 = +[MPCRTCEventConsumer dateFormatter];
        BOOL v40 = [v19 date];
        id v41 = [v39 stringFromDate:v40];
        *(_DWORD *)buf = 138543618;
        id v86 = v38;
        __int16 v87 = 2114;
        uint64_t v88 = v41;
        _os_log_impl(&dword_21BB87000, v37, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: _payloadForSessionStart: No QueueLoadEndEvent type=%{public}@ date=%{public}@", buf, 0x16u);

        id v9 = v80;
      }
      id v42 = v19;
    }

    if (!v42) {
      goto LABEL_40;
    }
    goto LABEL_21;
  }
  if (!v19)
  {
LABEL_40:
    v75 = v12;
    v60 = v19;
    v61 = v75;
    goto LABEL_41;
  }
LABEL_21:
  v45 = [v42 type];
  int v46 = [v45 isEqualToString:@"queue-load-end"];

  if (v46)
  {
    id v47 = [(MPCRTCEventConsumer *)self _payloadForQueueLoad:v12 fromQueueLoadEndEvent:v42];
    v48 = [v47 objectForKeyedSubscript:@"queueType"];
    [v9 setObject:v48 forKeyedSubscript:@"initialQueueType"];

    v49 = [v47 objectForKeyedSubscript:@"queueLoadDuration"];
    [v9 setObject:v49 forKeyedSubscript:@"initialQueueLoadDuration"];

    id v50 = [v47 objectForKeyedSubscript:@"queueEndpoint"];
    [v9 setObject:v50 forKeyedSubscript:@"initialQueueFeatureName"];

    v51 = [v47 objectForKeyedSubscript:@"errorCode"];

    if (v51)
    {
      v52 = [v47 objectForKeyedSubscript:@"errorCode"];
      [v9 setObject:v52 forKeyedSubscript:@"errorCode"];

      v53 = [v47 objectForKeyedSubscript:@"errorDomain"];
      [v9 setObject:v53 forKeyedSubscript:@"errorDomain"];
    }
  }
  v54 = [v42 type];
  int v55 = [v54 isEqualToString:@"session-restore-end"];

  if (v55)
  {
    [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"stateRestoration"];
    id v56 = [v42 payload];
    v57 = [v56 objectForKeyedSubscript:@"session-restoration-error"];
    -[MPCRTCEventConsumer _addErrors:toPayload:]((uint64_t)self, v57, v9);

    v58 = v12;
    uint64_t v59 = [v12 findPreviousEventWithType:@"session-restore-begin" matchingPayload:0];

    id v42 = (id)v59;
    if (!v59)
    {
      v60 = v19;
      v61 = v58;
      goto LABEL_41;
    }
  }
  else
  {
    v58 = v12;
  }
  v60 = v19;
  v62 = [v42 type];
  int v63 = [v62 isEqualToString:@"session-migrate-end"];

  if (v63)
  {
    v64 = [v42 payload];
    v65 = [v64 objectForKeyedSubscript:@"session-migration-error"];
    -[MPCRTCEventConsumer _addErrors:toPayload:]((uint64_t)self, v65, v9);

    v61 = v58;
    uint64_t v66 = [v58 findPreviousEventWithType:@"session-migrate-begin" matchingPayload:0];

    id v42 = (id)v66;
    if (!v66) {
      goto LABEL_41;
    }
  }
  else
  {
    v61 = v58;
  }
  v82[0] = @"session-begin";
  v82[1] = @"session-restore-begin";
  v82[2] = @"session-migrate-begin";
  v82[3] = @"session-reset";
  v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:4];
  v68 = [v42 type];
  char v69 = [v67 containsObject:v68];

  v70 = v42;
  if ((v69 & 1) == 0)
  {
LABEL_41:
    v81[0] = @"session-begin";
    v81[1] = @"session-restore-begin";
    v81[2] = @"session-migrate-begin";
    v81[3] = @"session-reset";
    v76 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:4];
    v70 = [v61 findPreviousEventWithTypes:v76 matchingPayload:0];
  }
  v77 = -[MPCRTCEventConsumer _networkType:fromEvent:](self, v61, v70);
  [v80 setObject:v77 forKeyedSubscript:@"initialNetworkType"];

  return v80;
}

- (void)_sendReportForItemSummaryWithEndReason:(id)a3 cursor:(id)a4 event:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = [(MPCRTCEventConsumer *)self _payloadForItemSummary:v8 fromEvent:a5];
  unint64_t v10 = -[MPCRTCEventConsumer _networkSignalPayload:]((uint64_t)self, v8);

  [v9 addEntriesFromDictionary:v10];
  if (v13) {
    [v9 setObject:v13 forKeyedSubscript:@"endReason"];
  }
  [(MPCRTCEventConsumer *)self _performABCSnapshotWithPayloadIfNecessary:v9];
  uint64_t v11 = [v9 objectForKeyedSubscript:@"errorCode"];
  if (v11) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 1;
  }

  [(MPCRTCEventConsumer *)self _sendOneMessageWithCategory:1006 type:v12 payload:v9];
}

- (id)_networkSignalPayload:(uint64_t)a1
{
  v17[2] = *MEMORY[0x263EF8340];
  if (a1)
  {
    v2 = (objc_class *)MEMORY[0x263EFF9A0];
    id v3 = a2;
    id v4 = objc_alloc_init(v2);
    v17[0] = @"network-type-changed";
    v17[1] = @"network-reachability-changed";
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    id v6 = [v3 findPreviousEventWithTypes:v5 matchingPayload:0];

    if (v6)
    {
      int v7 = [v6 payload];
      uint64_t v8 = [v7 objectForKeyedSubscript:@"network-signal-info"];
      id v9 = (void *)v8;
      uint64_t v10 = MEMORY[0x263EFFA78];
      if (v8) {
        uint64_t v11 = v8;
      }
      else {
        uint64_t v11 = MEMORY[0x263EFFA78];
      }
      [v4 addEntriesFromDictionary:v11];

      uint64_t v12 = [v6 payload];
      uint64_t v13 = [v12 objectForKeyedSubscript:@"network-signal-strength"];
      id v14 = (void *)v13;
      if (v13) {
        uint64_t v15 = v13;
      }
      else {
        uint64_t v15 = v10;
      }
      [v4 addEntriesFromDictionary:v15];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_sendReportForItemSummary:(id)a3 event:(id)a4
{
}

- (void)_sendReportForItemAssetLoad:(id)a3 event:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 findPreviousEventWithType:@"item-begin" matchingPayload:0];
  if (v8)
  {
    id v9 = [(MPCRTCEventConsumer *)self _payloadForItemAssetLoad:v6 fromItemEvent:v7];
    uint64_t v10 = -[MPCRTCEventConsumer _networkSignalPayload:]((uint64_t)self, v6);
    [v9 addEntriesFromDictionary:v10];

    uint64_t v11 = [v9 objectForKeyedSubscript:@"errorCode"];
    if (v11) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 1;
    }

    uint64_t v13 = [v7 type];
    int v14 = [v13 isEqualToString:@"asset-load-end"];

    if (v14)
    {
      id v15 = v7;
    }
    else
    {
      int v20 = objc_msgSend(v8, "payload", @"queue-item-id");
      id v21 = [v20 objectForKeyedSubscript:@"queue-item-id"];
      char v24 = v21;
      id v22 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      id v15 = [v6 findPreviousEventWithType:@"asset-load-end" matchingPayload:v22];
    }
    [(MPCRTCEventConsumer *)self _performABCSnapshotWithPayloadIfNecessary:v9];
    [(MPCRTCEventConsumer *)self _sendOneMessageWithCategory:1005 type:v12 payload:v9];
  }
  else
  {
    id v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [v7 type];
      int v17 = +[MPCRTCEventConsumer dateFormatter];
      BOOL v18 = [v7 date];
      id v19 = [v17 stringFromDate:v18];
      *(_DWORD *)buf = 138543618;
      double v26 = v16;
      __int16 v27 = 2114;
      uint64_t v28 = v19;
      _os_log_impl(&dword_21BB87000, v9, OS_LOG_TYPE_ERROR, "MPCRTCEventConsumer: No itemBeginEvent type=%{public}@ date=%{public}@", buf, 0x16u);
    }
  }
}

- (void)_sendQueueLoadEventIfNeeded:(id)a3 forItemEvent:(id)a4
{
  v39[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__8025;
  uint64_t v33 = __Block_byref_object_dispose__8026;
  id v34 = 0;
  uint64_t v8 = [v6 cursorFromEvent:v7 untilEvent:0];
  v39[0] = @"asset-load-end";
  v39[1] = @"item-failed";
  v39[2] = @"item-first-audio-frame";
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:3];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __64__MPCRTCEventConsumer__sendQueueLoadEventIfNeeded_forItemEvent___block_invoke;
  v26[3] = &unk_2643C1BA0;
  v26[4] = self;
  id v10 = v6;
  id v27 = v10;
  uint64_t v28 = &v29;
  [v8 enumeratePreviousEventsWithTypes:v9 usingBlock:v26];

  uint64_t v11 = [v7 payload];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"queue-section-id"];

  uint64_t v13 = [(id)v30[5] payload];
  int v14 = [v13 objectForKeyedSubscript:@"queue-section-id"];
  char v15 = [v12 isEqualToString:v14];

  if ((v15 & 1) == 0)
  {
    uint64_t v37 = @"queue-section-id";
    long long v38 = v12;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    int v17 = [v10 findPreviousEventWithType:@"queue-load-end" matchingPayload:v16];

    BOOL v18 = -[MPCRTCEventConsumer _sessionCursorWithCursor:fromEvent:]((uint64_t)self, v10, v7);
    id v35 = @"queue-section-id";
    uint64_t v36 = v12;
    id v19 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    -[MPCRTCEventConsumer _firstItemAssetLoadEventWithCursor:fromEvent:matchingPayload:]((uint64_t)self, v18, v7, v19);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    if (v17 && v20 == v7)
    {
      id v21 = [(MPCRTCEventConsumer *)self _payloadForQueueLoad:v10 fromQueueLoadEndEvent:v17];
      id v22 = -[MPCRTCEventConsumer _networkSignalPayload:]((uint64_t)self, v10);
      [v21 addEntriesFromDictionary:v22];

      uint64_t v23 = [v17 payload];
      char v24 = [v23 objectForKeyedSubscript:@"queue-load-error"];
      if (v24) {
        uint64_t v25 = 2;
      }
      else {
        uint64_t v25 = 1;
      }

      [(MPCRTCEventConsumer *)self _sendOneMessageWithCategory:1004 type:v25 payload:v21];
    }
  }
  _Block_object_dispose(&v29, 8);
}

void __64__MPCRTCEventConsumer__sendQueueLoadEventIfNeeded_forItemEvent___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (-[MPCRTCEventConsumer _shouldReportItemAssetLoad:forItemEvent:](*(void *)(a1 + 32), *(void **)(a1 + 40), v6))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)_sendReportForSessionStart:(id)a3 event:(id)a4 withType:(int64_t)a5
{
  id v8 = a3;
  id v10 = [(MPCRTCEventConsumer *)self _payloadForSessionStart:v8 fromEvent:a4];
  id v9 = -[MPCRTCEventConsumer _networkSignalPayload:]((uint64_t)self, v8);

  [v10 addEntriesFromDictionary:v9];
  [(MPCRTCEventConsumer *)self _sendOneMessageWithCategory:1002 type:a5 payload:v10];
}

- (void)_sendSessionStartIfNeeded:(id)a3 forItemEvent:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = -[MPCRTCEventConsumer _sessionCursorWithCursor:fromEvent:]((uint64_t)self, v11, 0);
  -[MPCRTCEventConsumer _firstItemAssetLoadEventWithCursor:fromEvent:matchingPayload:]((uint64_t)self, v7, v6, 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6)
  {
    id v9 = [v6 type];
    if ([v9 isEqualToString:@"item-first-audio-frame"]) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2;
    }

    [(MPCRTCEventConsumer *)self _sendReportForSessionStart:v11 event:v6 withType:v10];
  }
}

- (void)_sendReportForSessionSummary:(id)a3 event:(id)a4 withType:(int64_t)a5
{
  id v8 = a3;
  id v10 = [(MPCRTCEventConsumer *)self _payloadForSessionSummary:v8 fromEvent:a4];
  id v9 = -[MPCRTCEventConsumer _networkSignalPayload:]((uint64_t)self, v8);

  [v10 addEntriesFromDictionary:v9];
  [(MPCRTCEventConsumer *)self _sendOneMessageWithCategory:1003 type:a5 payload:v10];
}

- (void)_handleReportingForItemStartEvent:(id)a3 event:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (-[MPCRTCEventConsumer _shouldReportItemAssetLoad:forItemEvent:]((uint64_t)self, v7, v6))
  {
    [(MPCRTCEventConsumer *)self _sendSessionStartIfNeeded:v7 forItemEvent:v6];
    [(MPCRTCEventConsumer *)self _sendQueueLoadEventIfNeeded:v7 forItemEvent:v6];
    [(MPCRTCEventConsumer *)self _sendReportForItemAssetLoad:v7 event:v6];
  }
}

- (void)unsubscribeFromEventStream:(id)a3
{
  subscription = self->_subscription;
  self->_subscription = 0;
}

uint64_t __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (-[MPCRTCEventConsumer _shouldReportSessionEnd:forEvent:](*(void *)(a1 + 32), v6, v5)) {
    [*(id *)(a1 + 32) _sendReportForSessionSummary:v6 event:v5 withType:1];
  }

  return 1;
}

uint64_t __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (-[MPCRTCEventConsumer _shouldReportSessionEnd:forEvent:](*(void *)(a1 + 32), v6, v5)) {
    [*(id *)(a1 + 32) _sendReportForSessionSummary:v6 event:v5 withType:1];
  }

  return 1;
}

uint64_t __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (-[MPCRTCEventConsumer _shouldReportSessionEnd:forEvent:](*(void *)(a1 + 32), v6, v5)) {
    [*(id *)(a1 + 32) _sendReportForSessionSummary:v6 event:v5 withType:1];
  }
  if (-[MPCRTCEventConsumer _shouldReportItemSummary:forEvent:](*(void *)(a1 + 32), v6, v5)) {
    [*(id *)(a1 + 32) _sendReportForItemSummaryWithEndReason:@"endSession" cursor:v6 event:v5];
  }

  return 1;
}

uint64_t __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 payload];
  id v8 = [v7 objectForKeyedSubscript:@"session-restoration-error"];

  if (v8) {
    [*(id *)(a1 + 32) _sendReportForSessionStart:v6 event:v5 withType:2];
  }

  return 1;
}

uint64_t __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 payload];
  id v8 = [v7 objectForKeyedSubscript:@"session-migration-error"];

  if (v8) {
    [*(id *)(a1 + 32) _sendReportForSessionStart:v6 event:v5 withType:2];
  }

  return 1;
}

uint64_t __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1;
}

uint64_t __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  BOOL v8 = -[MPCRTCEventConsumer _shouldReportItemSummary:forEvent:](v5, v6, v7);
  id v9 = *(void **)(a1 + 32);
  if (v8) {
    [v9 _sendReportForItemSummaryWithEndReason:@"fail" cursor:v6 event:v7];
  }
  else {
    [v9 _handleReportingForItemStartEvent:v6 event:v7];
  }

  return 1;
}

uint64_t __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1;
}

uint64_t __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (-[MPCRTCEventConsumer _shouldReportItemSummary:forEvent:](*(void *)(a1 + 32), v6, v5)) {
    [*(id *)(a1 + 32) _sendReportForItemSummary:v6 event:v5];
  }

  return 1;
}

uint64_t __46__MPCRTCEventConsumer_subscribeToEventStream___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  v12[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (-[MPCRTCEventConsumer _shouldReportSessionEnd:forEvent:](*(void *)(a1 + 32), v6, v5))
  {
    v12[0] = @"item-begin";
    v12[1] = @"item-first-audio-frame";
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
    BOOL v8 = [v6 findPreviousEventWithTypes:v7 matchingPayload:0];

    if (v8)
    {
      id v9 = [v8 type];
      int v10 = [v9 isEqualToString:@"item-first-audio-frame"];

      if (v10) {
        [*(id *)(a1 + 32) _sendReportForItemSummaryWithEndReason:@"endSession" cursor:v6 event:v5];
      }
    }
    [*(id *)(a1 + 32) _sendReportForSessionSummary:v6 event:v5 withType:1];
  }
  return 1;
}

- (uint64_t)_shouldReportSessionEnd:(void *)a3 forEvent:
{
  v32[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a1)
  {
    id v6 = -[MPCRTCEventConsumer _sessionCursorWithCursor:fromEvent:](a1, a2, 0);
    if ([v6 countOfPreviousEventsWithType:@"item-first-audio-frame" matchingPayload:0])
    {
      id v7 = [v5 type];
      int v8 = [v7 isEqualToString:@"remote-control-begin"];

      if (v8)
      {
        id v9 = [v5 payload];
        int v10 = [v9 objectForKeyedSubscript:@"remote-control-type"];
        if ([v10 unsignedIntValue] == 1)
        {
          id v11 = [v5 payload];
          uint64_t v12 = [v11 objectForKeyedSubscript:@"remote-control-source"];
          char v13 = [v12 containsString:@"migrationPlaybackSession"];

          if (v13) {
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      int v14 = [v5 type];
      if ([v14 isEqualToString:@"session-end"])
      {

LABEL_13:
        a1 = 1;
LABEL_17:

        goto LABEL_18;
      }
      char v15 = [v5 type];
      char v16 = [v15 isEqualToString:@"session-reset"];

      if (v16) {
        goto LABEL_13;
      }
      int v17 = [v5 type];
      int v18 = [v17 isEqualToString:@"application-termination"];

      if (v18)
      {
        v32[0] = @"item-first-audio-frame";
        v32[1] = @"session-end";
        v32[2] = @"session-reset";
        id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:3];
        id v20 = [v6 findPreviousEventWithTypes:v19 matchingPayload:0];

        id v21 = [v20 type];
        char v22 = [v21 isEqualToString:@"item-first-audio-frame"];

        if (v22) {
          goto LABEL_13;
        }
      }
      v31[0] = @"session-begin";
      v31[1] = @"session-migrate-begin";
      void v31[2] = @"session-restore-begin";
      uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:3];
      char v24 = [v5 type];
      int v25 = [v23 containsObject:v24];

      if (v25)
      {
        v30[0] = @"item-first-audio-frame";
        v30[1] = @"session-end";
        void v30[2] = @"session-reset";
        v30[3] = @"application-termination";
        double v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];
        id v27 = [v6 findPreviousEventWithTypes:v26 matchingPayload:0];

        uint64_t v28 = [v27 type];
        a1 = [v28 isEqualToString:@"item-first-audio-frame"];

        goto LABEL_17;
      }
    }
    a1 = 0;
    goto LABEL_17;
  }
LABEL_18:

  return a1;
}

- (void)setTestingDelegate:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "MPCRTCEventConsumer: testingDelegate set. RTC messages will not be sent.", v6, 2u);
  }

  objc_storeWeak((id *)&self->_testingDelegate, v4);
}

+ (id)dateFormatter
{
  if (dateFormatter_onceToken != -1) {
    dispatch_once(&dateFormatter_onceToken, &__block_literal_global_35);
  }
  v2 = (void *)dateFormatter___formatter;

  return v2;
}

uint64_t __36__MPCRTCEventConsumer_dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)dateFormatter___formatter;
  dateFormatter___formatter = (uint64_t)v0;

  v2 = (void *)dateFormatter___formatter;

  return [v2 setDateFormat:@"YYYY-MM-dd HH:mm:ss.SSSXX"];
}

+ (id)NSStringFromMPCRTCReportingEventCategory:(int64_t)a3
{
  switch(a3)
  {
    case 1000:
      id v4 = @"NetworkInterfaceChange";
      break;
    case 1001:
      id v4 = @"SecureKeyLoad";
      break;
    case 1002:
      id v4 = @"SessionStart";
      break;
    case 1003:
      id v4 = @"SessionSummary";
      break;
    case 1004:
      id v4 = @"QueueLoad";
      break;
    case 1005:
      id v4 = @"ItemAssetLoad";
      break;
    case 1006:
      id v4 = @"ItemSummary";
      break;
    default:
      if (a3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"UnexpectedCategory:%d", a3);
        id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v4 = @"None";
      }
      break;
  }
  return v4;
}

+ (id)rtcIdentifiersFromUniversalIdentifiers:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:4];
  id v5 = v4;
  if (v3)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "adamID"));
    [v5 setObject:v6 forKeyedSubscript:@"adamid"];

    id v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "purchasedAdamID"));
    [v5 setObject:v7 forKeyedSubscript:@"padamid"];

    int v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "subscriptionAdamID"));
    [v5 setObject:v8 forKeyedSubscript:@"sadamid"];

    id v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "assetAdamID"));
    [v5 setObject:v9 forKeyedSubscript:@"aadamid"];
  }
  else
  {
    [v4 setObject:&unk_26CC18EA0 forKeyedSubscript:@"adamid"];
    [v5 setObject:&unk_26CC18EA0 forKeyedSubscript:@"padamid"];
    [v5 setObject:&unk_26CC18EA0 forKeyedSubscript:@"sadamid"];
    [v5 setObject:&unk_26CC18EA0 forKeyedSubscript:@"aadamid"];
  }

  return v5;
}

+ (id)rtcIdentifiersFromRadioIdentifiers:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = [v3 dictionaryWithCapacity:2];
  uint64_t v6 = [v4 stationStringID];
  id v7 = (void *)v6;
  if (v6) {
    int v8 = (__CFString *)v6;
  }
  else {
    int v8 = &stru_26CBCA930;
  }
  [v5 setObject:v8 forKeyedSubscript:@"raid"];

  id v9 = [v4 stationEventID];

  if (v9) {
    int v10 = v9;
  }
  else {
    int v10 = &stru_26CBCA930;
  }
  [v5 setObject:v10 forKeyedSubscript:@"raidev"];

  return v5;
}

+ (id)identifierStringFromItemIdentifiers:(id)a3 radioIdentifiers:(id)a4
{
  id v5 = (void *)MEMORY[0x263F089D8];
  id v6 = a4;
  id v7 = a3;
  int v8 = [v5 string];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  void v16[2] = __76__MPCRTCEventConsumer_identifierStringFromItemIdentifiers_radioIdentifiers___block_invoke_2;
  v16[3] = &unk_2643C08E0;
  id v9 = v8;
  id v17 = v9;
  objc_msgSend(v7, "msv_enumerateKeysAndObjectsOrderedByKeyComparator:usingBlock:", &__block_literal_global_8096, v16);

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __76__MPCRTCEventConsumer_identifierStringFromItemIdentifiers_radioIdentifiers___block_invoke_4;
  void v14[3] = &unk_2643C41D0;
  id v10 = v9;
  id v15 = v10;
  objc_msgSend(v6, "msv_enumerateKeysAndObjectsOrderedByKeyComparator:usingBlock:", &__block_literal_global_4, v14);

  id v11 = v15;
  id v12 = v10;

  return v12;
}

void __76__MPCRTCEventConsumer_identifierStringFromItemIdentifiers_radioIdentifiers___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 stringValue];
  [v4 appendFormat:@"%@=%@,", v5, v6];
}

uint64_t __76__MPCRTCEventConsumer_identifierStringFromItemIdentifiers_radioIdentifiers___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@=%@,", a2, a3];
}

uint64_t __76__MPCRTCEventConsumer_identifierStringFromItemIdentifiers_radioIdentifiers___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __76__MPCRTCEventConsumer_identifierStringFromItemIdentifiers_radioIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

@end