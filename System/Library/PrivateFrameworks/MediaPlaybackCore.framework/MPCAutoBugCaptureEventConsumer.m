@interface MPCAutoBugCaptureEventConsumer
+ (NSString)identifier;
- (BOOL)shouldReportError:(id)a3;
- (MPCPlaybackEngineEventStreamSubscription)subscription;
- (NSMutableSet)reportedBugSignatures;
- (void)autoBugCaptureWithSubType:(id)a3 context:(id)a4 triggerThresholdValues:(id)a5 events:(id)a6;
- (void)subscribeToEventStream:(id)a3;
- (void)unsubscribeFromEventStream:(id)a3;
@end

@implementation MPCAutoBugCaptureEventConsumer

+ (NSString)identifier
{
  return (NSString *)@"com.apple.MediaPlaybackCore/ABC";
}

- (void)subscribeToEventStream:(id)a3
{
  objc_storeStrong((id *)&self->_subscription, a3);
  id v5 = a3;
  v6 = [MEMORY[0x263EFF9C0] set];
  reportedBugSignatures = self->_reportedBugSignatures;
  self->_reportedBugSignatures = v6;

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__MPCAutoBugCaptureEventConsumer_subscribeToEventStream___block_invoke;
  v12[3] = &unk_2643C5258;
  v12[4] = self;
  [v5 subscribeToEventType:@"remote-control-end" handler:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__MPCAutoBugCaptureEventConsumer_subscribeToEventStream___block_invoke_15;
  v11[3] = &unk_2643C5258;
  v11[4] = self;
  [v5 subscribeToEventType:@"remote-control-timeout" handler:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__MPCAutoBugCaptureEventConsumer_subscribeToEventStream___block_invoke_2;
  v10[3] = &unk_2643C5258;
  v10[4] = self;
  [v5 subscribeToEventType:@"asset-load-end" handler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__MPCAutoBugCaptureEventConsumer_subscribeToEventStream___block_invoke_3;
  v9[3] = &unk_2643C5258;
  v9[4] = self;
  [v5 subscribeToEventType:@"item-rate-changed" handler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__MPCAutoBugCaptureEventConsumer_subscribeToEventStream___block_invoke_4;
  v8[3] = &unk_2643C5258;
  v8[4] = self;
  [v5 subscribeToEventType:@"item-failed" handler:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportedBugSignatures, 0);

  objc_storeStrong((id *)&self->_subscription, 0);
}

- (NSMutableSet)reportedBugSignatures
{
  return self->_reportedBugSignatures;
}

- (MPCPlaybackEngineEventStreamSubscription)subscription
{
  return self->_subscription;
}

- (void)autoBugCaptureWithSubType:(id)a3 context:(id)a4 triggerThresholdValues:(id)a5 events:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [NSString stringWithFormat:@"%@ %@", v10, v11];
  uint64_t v15 = [v14 hash];

  reportedBugSignatures = self->_reportedBugSignatures;
  v17 = [NSNumber numberWithUnsignedInteger:v15];
  LOBYTE(reportedBugSignatures) = [(NSMutableSet *)reportedBugSignatures containsObject:v17];

  if (reportedBugSignatures)
  {
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics_Oversize");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v23 = v10;
      __int16 v24 = 2114;
      id v25 = v11;
      __int16 v26 = 2114;
      id v27 = v13;
      v19 = "PlayPerf ABC [discarded] subtype:%{public}@ context:%{public}@ events:%{public}@";
LABEL_6:
      _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0x20u);
    }
  }
  else
  {
    v20 = self->_reportedBugSignatures;
    v21 = [NSNumber numberWithUnsignedInteger:v15];
    [(NSMutableSet *)v20 addObject:v21];

    [MEMORY[0x263F54EC8] snapshotWithDomain:*MEMORY[0x263F54E80] type:@"Performance" subType:v10 context:v11 triggerThresholdValues:v12 events:v13 completion:0];
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics_Oversize");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v23 = v10;
      __int16 v24 = 2114;
      id v25 = v11;
      __int16 v26 = 2114;
      id v27 = v13;
      v19 = "PlayPerf ABC [reported] subtype:%{public}@ context:%{public}@ events:%{public}@";
      goto LABEL_6;
    }
  }
}

- (BOOL)shouldReportError:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = objc_msgSend(a3, "msv_errorByUnwrappingDomain:", @"MPCError");
  uint64_t v4 = [v3 code];

  return v4 != 28 && (v4 & 0xFFFFFFFFFFFFFFDFLL) != 24;
}

- (void)unsubscribeFromEventStream:(id)a3
{
  subscription = self->_subscription;
  self->_subscription = 0;
}

uint64_t __57__MPCAutoBugCaptureEventConsumer_subscribeToEventStream___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v47[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 payload];
  v8 = [v7 objectForKeyedSubscript:@"remote-control-status"];
  v9 = [v8 firstObject];

  if ([v9 type] == 3)
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = [v9 error];
    LODWORD(v10) = [v10 shouldReportError:v11];

    if (v10)
    {
      uint64_t v42 = a1;
      v46 = @"remote-control-id";
      id v12 = [v5 payload];
      id v13 = [v12 objectForKeyedSubscript:@"remote-control-id"];
      v47[0] = v13;
      v14 = [NSDictionary dictionaryWithObjects:v47 forKeys:&v46 count:1];
      uint64_t v15 = [v6 findPreviousEventWithType:@"remote-control-begin" matchingPayload:v14];

      v16 = (void *)v15;
      v17 = [v6 cursorUntilEvent:v15];
      v44 = @"resolution-type";
      v45 = &unk_26CC18F90;
      v18 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      v41 = v17;
      v19 = [v17 findPreviousEventWithType:@"error-resolution" matchingPayload:v18];

      v40 = v19;
      v20 = [v19 payload];
      v21 = [v20 objectForKeyedSubscript:@"error-for-resolution"];

      if (!v21) {
        goto LABEL_5;
      }
      v22 = [v9 error];
      id v23 = [v21 domain];
      __int16 v24 = objc_msgSend(v22, "msv_errorByUnwrappingDomain:code:", v23, objc_msgSend(v21, "code"));

      if (!v24)
      {
        id v25 = objc_msgSend(v21, "msv_analyticSignature");
        v39 = [@"CommandFailure-MissingInnerError-" stringByAppendingString:v25];
      }
      else
      {
LABEL_5:
        v39 = @"CommandFailure";
      }
      __int16 v26 = v16;
      id v27 = [v16 payload];
      uint64_t v28 = [v27 objectForKeyedSubscript:@"remote-control-type"];
      unsigned int v29 = [v28 unsignedIntValue];

      v30 = MPCRemoteCommandDescriptionCopy(v29);
      v31 = NSString;
      v32 = [v9 error];
      v33 = objc_msgSend(v32, "msv_analyticSignature");
      v34 = [v31 stringWithFormat:@"%@:%@", v30, v33];

      v35 = _EVSEventToABCEvent(v26);
      v43[0] = v35;
      v36 = _EVSEventToABCEvent(v5);
      v43[1] = v36;
      v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];

      [*(id *)(v42 + 32) autoBugCaptureWithSubType:v39 context:v34 triggerThresholdValues:0 events:v37];
    }
  }

  return 1;
}

uint64_t __57__MPCAutoBugCaptureEventConsumer_subscribeToEventStream___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  v23[1] = *MEMORY[0x263EF8340];
  v22 = @"remote-control-id";
  id v5 = a3;
  id v6 = a2;
  v7 = [v6 payload];
  v8 = [v7 objectForKeyedSubscript:@"remote-control-id"];
  v23[0] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
  id v10 = [v5 findPreviousEventWithType:@"remote-control-begin" matchingPayload:v9];

  [v6 durationSinceEvent:v10];
  uint64_t v12 = v11;
  id v13 = [v10 payload];
  v14 = [v13 objectForKeyedSubscript:@"remote-control-type"];
  LODWORD(v7) = [v14 unsignedIntValue];

  uint64_t v15 = MPCRemoteCommandDescriptionCopy(v7);
  v16 = objc_msgSend(NSString, "stringWithFormat:", @"%.3f", v12);
  v17 = _EVSEventToABCEvent(v10);
  v21[0] = v17;
  v18 = _EVSEventToABCEvent(v6);

  v21[1] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];

  [*(id *)(a1 + 32) autoBugCaptureWithSubType:@"CommandTimeout" context:v15 triggerThresholdValues:v16 events:v19];
  return 1;
}

uint64_t __57__MPCAutoBugCaptureEventConsumer_subscribeToEventStream___block_invoke_2(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"asset-load-error"];

  id v6 = [v3 payload];
  v7 = [v6 objectForKeyedSubscript:@"time-control-status"];
  uint64_t v8 = [v7 integerValue];

  if (v8 == 2 && [*(id *)(a1 + 32) shouldReportError:v5])
  {
    v9 = _EVSEventToABCEvent(v3);
    v14[0] = v9;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];

    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = objc_msgSend(v5, "msv_analyticSignature");
    [v11 autoBugCaptureWithSubType:@"ItemLoadFailure" context:v12 triggerThresholdValues:0 events:v10];
  }
  return 1;
}

uint64_t __57__MPCAutoBugCaptureEventConsumer_subscribeToEventStream___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v30[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 payload];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"item-rate"];
  [v8 floatValue];
  float v10 = v9;

  uint64_t v11 = [v5 payload];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"item-rate-change-reason"];

  id v13 = [v5 payload];
  v14 = [v13 objectForKeyedSubscript:@"item-rate-change-participant-id"];

  if (!v14
    && v10 == 0.0
    && ([v12 isEqualToString:*MEMORY[0x263EFA158]] & 1) == 0
    && ([v12 isEqualToString:*MEMORY[0x263EFA128]] & 1) == 0)
  {
    v29[0] = @"queue-section-id";
    uint64_t v15 = [v5 payload];
    v16 = [v15 objectForKeyedSubscript:@"queue-section-id"];
    v29[1] = @"queue-item-id";
    v30[0] = v16;
    v17 = [v5 payload];
    v18 = [v17 objectForKeyedSubscript:@"queue-item-id"];
    v30[1] = v18;
    v19 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];

    v20 = [v6 findPreviousEventWithType:@"item-rate-changed" matchingPayload:v19];
    v21 = [v20 payload];
    v22 = [v21 objectForKeyedSubscript:@"item-rate"];
    [v22 floatValue];
    float v24 = v23;

    if (v24 > 0.0)
    {
      id v25 = _EVSEventToABCEvent(v5);
      uint64_t v28 = v25;
      __int16 v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];

      [*(id *)(a1 + 32) autoBugCaptureWithSubType:@"ItemUnexpectedRate0" context:v12 triggerThresholdValues:0 events:v26];
    }
  }
  return 1;
}

uint64_t __57__MPCAutoBugCaptureEventConsumer_subscribeToEventStream___block_invoke_4(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 payload];
  id v5 = [v4 objectForKeyedSubscript:@"asset-load-error"];

  if ([*(id *)(a1 + 32) shouldReportError:v5])
  {
    id v6 = _EVSEventToABCEvent(v3);
    v11[0] = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];

    uint64_t v8 = *(void **)(a1 + 32);
    float v9 = objc_msgSend(v5, "msv_analyticSignature");
    [v8 autoBugCaptureWithSubType:@"ItemUnexpectedEnding" context:v9 triggerThresholdValues:0 events:v7];
  }
  return 1;
}

@end