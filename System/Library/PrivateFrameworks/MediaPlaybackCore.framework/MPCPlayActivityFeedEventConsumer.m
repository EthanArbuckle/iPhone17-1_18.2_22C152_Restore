@interface MPCPlayActivityFeedEventConsumer
+ (NSString)identifier;
- (BOOL)_finalizePAFEvents:(id)a3;
- (BOOL)_handleApplicationTerminationEvent:(id)a3 cursor:(id)a4;
- (BOOL)_handleItemEndEvent:(id)a3 cursor:(id)a4;
- (BOOL)_handleItemPauseEvent:(id)a3 cursor:(id)a4;
- (BOOL)_handleItemPositionJumpEvent:(id)a3 cursor:(id)a4;
- (BOOL)_handleItemResumeEvent:(id)a3 cursor:(id)a4;
- (BOOL)_itemIsPlaceholderFromQueueSectionIdentifier:(id)a3 itemIdentifier:(id)a4 cursor:(id)a5;
- (BOOL)_itemIsPlayingFromQueueSectionIdentifier:(id)a3 itemIdentifier:(id)a4 cursor:(id)a5;
- (BOOL)_itemWithinHLSTimedMetadataBeginFromQueueSection:(id)a3 itemIdentifier:(id)a4 cursor:(id)a5;
- (BOOL)_vocalControlIsOnForEvent:(id)a3;
- (MPCPlayActivityFeedEventConsumer)init;
- (MPCPlaybackEngineEventStreamSubscription)subscription;
- (NSMutableArray)radioPlayActivityEvents;
- (double)_getPlaybackDurationForHLSStreamFromStartEvent:(id)a3 toEndEvent:(id)a4 withLimitedCursor:(id)a5;
- (double)_getStartTimeForMostRecentPlaybackStart:(id)a3 withItemBeginEvent:(id)a4 containerBeginEvent:(id)a5 cursor:(id)a6;
- (id)_findRecentPlaybackStartFromTypes:(id)a3 matchingPayload:(id)a4 cursor:(id)a5;
- (id)_generateAggregateNoncatalogEndEventForCursor:(id)a3;
- (id)_generatePlaybackEndEventFromEvent:(id)a3 withQueueSectionIdentifier:(id)a4 itemIdentifier:(id)a5 cursor:(id)a6;
- (void)_clampTimeValuesForPAFEvent:(id)a3 withDuration:(double)a4;
- (void)_handleURLBagProviderDidUpdateBagNotification:(id)a3;
- (void)_sendPlayEndNotificationWithStartTime:(double)a3 endTime:(double)a4 pafEvent:(id)a5 cursor:(id)a6;
- (void)_updateAllowedBundleIdsIfNecessary:(id)a3;
- (void)_updatePAFEvent:(id)a3 withAccountIdentifier:(id)a4 cursor:(id)a5;
- (void)_updatePAFEvent:(id)a3 withAudioChangeEvent:(id)a4;
- (void)_updatePAFEvent:(id)a3 withDeviceInfoFromCursor:(id)a4;
- (void)_updatePAFEvent:(id)a3 withEnqueuerAccountIdentifier:(id)a4 queueAddEvent:(id)a5 cursor:(id)a6;
- (void)_updatePAFEvent:(id)a3 withItemBeginEvent:(id)a4 containerBeginPayload:(id)a5 cursor:(id)a6 forEventType:(id)a7;
- (void)_updatePAFEvent:(id)a3 withQueueAddEvent:(id)a4 queueSectionIdentifier:(id)a5 cursor:(id)a6;
- (void)_updatePAFEvent:(id)a3 withSharedListeningInfoFromCursor:(id)a4;
- (void)_updatePAFEvent:(id)a3 withVocalAttenuationInfoForEndEvent:(id)a4 cursor:(id)a5;
- (void)subscribeToEventStream:(id)a3;
- (void)unsubscribeFromEventStream:(id)a3;
@end

@implementation MPCPlayActivityFeedEventConsumer

+ (NSString)identifier
{
  return (NSString *)@"com.apple.MediaPlaybackCore/PAF";
}

uint64_t __71__MPCPlayActivityFeedEventConsumer__updateAllowedBundleIdsIfNecessary___block_invoke()
{
  return _NSIsNSString();
}

- (void)subscribeToEventStream:(id)a3
{
  objc_storeStrong((id *)&self->_subscription, a3);
  id v5 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__MPCPlayActivityFeedEventConsumer_subscribeToEventStream___block_invoke;
  v10[3] = &unk_2643C5258;
  v10[4] = self;
  [v5 subscribeToEventType:@"item-resume" handler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__MPCPlayActivityFeedEventConsumer_subscribeToEventStream___block_invoke_2;
  v9[3] = &unk_2643C5258;
  v9[4] = self;
  [v5 subscribeToEventType:@"item-position-jump" handler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__MPCPlayActivityFeedEventConsumer_subscribeToEventStream___block_invoke_3;
  v8[3] = &unk_2643C5258;
  v8[4] = self;
  [v5 subscribeToEventType:@"item-pause" handler:v8];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__MPCPlayActivityFeedEventConsumer_subscribeToEventStream___block_invoke_4;
  v7[3] = &unk_2643C5258;
  v7[4] = self;
  [v5 subscribeToEventType:@"item-end" handler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__MPCPlayActivityFeedEventConsumer_subscribeToEventStream___block_invoke_5;
  v6[3] = &unk_2643C5258;
  v6[4] = self;
  [v5 subscribeToEventType:@"application-termination" handler:v6];
}

- (MPCPlayActivityFeedEventConsumer)init
{
  v10.receiver = self;
  v10.super_class = (Class)MPCPlayActivityFeedEventConsumer;
  v2 = [(MPCPlayActivityFeedEventConsumer *)&v10 init];
  allowedBundleIds = v2->_allowedBundleIds;
  v2->_allowedBundleIds = 0;

  v4 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__MPCPlayActivityFeedEventConsumer_init__block_invoke;
  block[3] = &unk_2643C5FC8;
  id v5 = v2;
  v9 = v5;
  dispatch_async(v4, block);

  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:v5 selector:sel__handleURLBagProviderDidUpdateBagNotification_ name:*MEMORY[0x263F89078] object:0];

  return v5;
}

void __40__MPCPlayActivityFeedEventConsumer_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_ERROR, "[MPCPlayActivityFeedEventConsumer] Failed to fetch the bag. error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  [*(id *)(a1 + 32) _updateAllowedBundleIdsIfNecessary:v5];
}

- (void)_updateAllowedBundleIdsIfNecessary:(id)a3
{
  id v12 = a3;
  v4 = [v12 dictionaryForBagKey:@"metrics"];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 valueForKeyPath:@"treatmentProfiles.bundleIdAllowList.treatments"];
    if (v6 && _NSIsNSArray())
    {
      v7 = [v6 objectAtIndexedSubscript:0];
      if (v7 && _NSIsNSDictionary())
      {
        int v8 = [v7 valueForKeyPath:@"fieldActions.bundle-id.allowedValues"];
        if (v8 && _NSIsNSArray())
        {
          id v9 = self;
          objc_sync_enter(v9);
          uint64_t v10 = objc_msgSend(v8, "msv_filter:", &__block_literal_global_14817);
          allowedBundleIds = v9->_allowedBundleIds;
          v9->_allowedBundleIds = (NSArray *)v10;

          objc_sync_exit(v9);
        }
      }
    }
  }
}

void __40__MPCPlayActivityFeedEventConsumer_init__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F89360]);
  v3 = [MEMORY[0x263F893C0] activeAccount];
  v4 = (void *)[v2 initWithIdentity:v3];

  id v5 = [MEMORY[0x263F893A0] sharedBagProvider];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__MPCPlayActivityFeedEventConsumer_init__block_invoke_2;
  v6[3] = &unk_2643C1AC0;
  id v7 = *(id *)(a1 + 32);
  [v5 getBagForRequestContext:v4 withCompletionHandler:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioPlayActivityEvents, 0);
  objc_storeStrong((id *)&self->_subscription, 0);

  objc_storeStrong((id *)&self->_allowedBundleIds, 0);
}

- (NSMutableArray)radioPlayActivityEvents
{
  return self->_radioPlayActivityEvents;
}

- (MPCPlaybackEngineEventStreamSubscription)subscription
{
  return self->_subscription;
}

- (BOOL)_finalizePAFEvents:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F89258] shared];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__MPCPlayActivityFeedEventConsumer__finalizePAFEvents___block_invoke;
  v8[3] = &unk_2643C4B00;
  id v9 = v4;
  uint64_t v10 = self;
  id v6 = v4;
  [v5 recordPlayActivityEvents:v6 shouldFlush:0 withCompletionHandler:v8];

  return 1;
}

void __55__MPCPlayActivityFeedEventConsumer__finalizePAFEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_DEFAULT, "[MPCPlayActivityFeedEventConsumer] Failed to record play activity events.", v9, 2u);
    }
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x263F89360]);
    id v5 = [MEMORY[0x263F893C0] activeAccount];
    id v2 = [v4 initWithIdentity:v5];

    id v6 = [MEMORY[0x263F893A0] sharedBagProvider];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __55__MPCPlayActivityFeedEventConsumer__finalizePAFEvents___block_invoke_2;
    v10[3] = &unk_2643C1C70;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v11 = v7;
    uint64_t v12 = v8;
    [v6 getBagForRequestContext:v2 withCompletionHandler:v10];
  }
}

void __55__MPCPlayActivityFeedEventConsumer__finalizePAFEvents___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[MPCPlayActivityFeedEventConsumer] Failed to fetch the bag.", buf, 2u);
    }
  }
  uint64_t v8 = [v5 numberForBagKey:@"play-activity-feed-post-all-play-starts"];
  if (objc_opt_respondsToSelector()) {
    char v36 = [v8 BOOLValue];
  }
  else {
    char v36 = 0;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v9 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (!v9)
  {

    goto LABEL_37;
  }
  uint64_t v10 = v9;
  uint64_t v31 = a1;
  v32 = v8;
  id v33 = v6;
  id v34 = v5;
  char v11 = 0;
  int v12 = 0;
  char v39 = 0;
  uint64_t v13 = *(void *)v44;
  uint64_t v35 = *MEMORY[0x263F54E80];
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v44 != v13) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v43 + 1) + 8 * v14);
      uint64_t v16 = [v15 eventType];
      if ([v15 systemReleaseType] == 4)
      {
        [v15 itemEndTime];
        double v18 = v17;
        [v15 itemStartTime];
        if (v18 - v19 > 43200.0)
        {
          int v37 = v12;
          v20 = (void *)MEMORY[0x263F54EC8];
          v48 = @"PAF Event";
          v21 = [v15 description];
          v49 = v21;
          [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
          v23 = uint64_t v22 = v13;
          v50 = v23;
          v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
          v25 = v20;
          int v12 = v37;
          [v25 snapshotWithDomain:v35 type:@"Bug" subType:@"PAFDurationBug" context:@"Playback greater than 12 hours" triggerThresholdValues:&stru_26CBCA930 events:v24 completion:0];

          uint64_t v13 = v22;
        }
      }
      switch(v16)
      {
        case 2:
          goto LABEL_23;
        case 1:
          BOOL v28 = [v15 reasonHintType] == 1;
          v39 |= v28;
          v12 |= [v15 containerType] == 1;
          v11 |= v36 | v28 & v12;
          if ((v11 & 1) == 0) {
            goto LABEL_27;
          }
          goto LABEL_25;
        case 0:
          unint64_t v26 = [v15 endReasonType];
          if (v26 <= 0xF && ((1 << v26) & 0x8872) != 0) {
LABEL_23:
          }
            char v11 = 1;
          break;
      }
      if ((v11 & 1) == 0) {
        goto LABEL_27;
      }
LABEL_25:
      if (v39 & 1) != 0 && (v12)
      {

        char v39 = 1;
        LOBYTE(v12) = 1;
        id v6 = v33;
        id v5 = v34;
        uint64_t v8 = v32;
        goto LABEL_35;
      }
LABEL_27:
      ++v14;
    }
    while (v10 != v14);
    uint64_t v29 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
    uint64_t v10 = v29;
  }
  while (v29);

  id v6 = v33;
  id v5 = v34;
  uint64_t v8 = v32;
  if ((v11 & 1) == 0) {
    goto LABEL_37;
  }
LABEL_35:
  v30 = [MEMORY[0x263F89258] shared];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __55__MPCPlayActivityFeedEventConsumer__finalizePAFEvents___block_invoke_113;
  v40[3] = &unk_2643C1C48;
  v40[4] = *(void *)(v31 + 40);
  char v41 = v39 & 1;
  char v42 = v12 & 1;
  [v30 flushPendingPlayActivityEventsWithCompletionHandler:v40];

LABEL_37:
}

void __55__MPCPlayActivityFeedEventConsumer__finalizePAFEvents___block_invoke_113(uint64_t a1, uint64_t a2)
{
  v11[2] = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Reporting");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_21BB87000, v2, OS_LOG_TYPE_DEFAULT, "[MPCPlayActivityFeedEventConsumer] Failed to flush play activity events.", v9, 2u);
    }
  }
  else
  {
    id v2 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v4 = *(void *)(a1 + 32);
    v10[0] = @"MPCJinglePlayActivityReportingControllerUserInfoKeyDidIncludeContainerChangeEvent";
    id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    v10[1] = @"MPCJinglePlayActivityReportingControllerUserInfoDidIncludeRadioStationStartEvent";
    v11[0] = v5;
    if (*(unsigned char *)(a1 + 41)) {
      uint64_t v6 = *(unsigned __int8 *)(a1 + 40);
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = [NSNumber numberWithInt:v6];
    v11[1] = v7;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
    [v2 postNotificationName:@"MPCJinglePlayActivityReportingControllerDidFlushEventsNotification" object:v4 userInfo:v8];
  }
}

- (void)_clampTimeValuesForPAFEvent:(id)a3 withDuration:(double)a4
{
  id v11 = a3;
  [v11 itemStartTime];
  double v6 = v5;
  [v11 itemEndTime];
  double v8 = 0.0;
  if (v6 >= 0.0) {
    double v9 = v6;
  }
  else {
    double v9 = 0.0;
  }
  if (v7 >= 0.0) {
    double v8 = v7;
  }
  if (v9 >= a4) {
    double v10 = a4;
  }
  else {
    double v10 = v9;
  }
  if (v8 < a4) {
    a4 = v8;
  }
  [v11 setItemStartTime:v10];
  [v11 setItemEndTime:a4];
}

- (void)_updatePAFEvent:(id)a3 withSharedListeningInfoFromCursor:(id)a4
{
  v30[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  double v7 = [v6 findPreviousEventWithType:@"session-begin" matchingPayload:0];
  double v8 = [v7 payload];
  double v9 = [v8 objectForKeyedSubscript:@"behavior-type"];
  uint64_t v10 = [v9 integerValue];

  v30[0] = @"shared-session-begin";
  v30[1] = @"shared-session-end";
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
  int v12 = [v6 findPreviousEventWithTypes:v11 matchingPayload:0];

  if (v12)
  {
    uint64_t v13 = [v12 type];
    if ([v13 isEqualToString:@"shared-session-begin"])
    {
      uint64_t v14 = [v12 payload];
      v15 = [v14 objectForKeyedSubscript:@"shared-session-type"];
      BOOL v16 = [v15 integerValue] == 2;

      if (v16)
      {
        id v17 = v6;
        BOOL v18 = v10 == 3;
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  id v17 = [v6 cursorUntilEvent:v7];
  if (v10 == 3)
  {
    BOOL v18 = 1;
LABEL_8:
    double v19 = [v17 findPreviousEventWithType:@"shared-session-participants-changed" matchingPayload:0];
    v20 = [v19 payload];
    v21 = [v20 objectForKeyedSubscript:@"shared-session-event-route-type"];

    if (v21)
    {
      [v21 intValue];
      if (MROutputDeviceSubtypeFromGroupSessionRoute() == 14)
      {
LABEL_18:

        goto LABEL_19;
      }
      if (!v18)
      {
        if ([v21 intValue] == 8 || objc_msgSend(v21, "intValue") == 11)
        {
          uint64_t v22 = 6;
        }
        else
        {
          if ([v21 intValue] != 5) {
            goto LABEL_17;
          }
          [v21 intValue];
          if (MROutputDeviceTypeFromGroupSessionRoute() == 1)
          {
            uint64_t v22 = 5;
          }
          else
          {
            [v21 intValue];
            uint64_t v22 = 4 * (MROutputDeviceTypeFromGroupSessionRoute() == 2);
          }
        }
        goto LABEL_16;
      }
    }
    else if (!v18)
    {
LABEL_17:
      v23 = [v19 payload];
      v24 = [v23 objectForKeyedSubscript:@"participants"];

      objc_msgSend(v5, "setSharedActivityGroupSizeCurrent:", objc_msgSend(v24, "count"));
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x2020000000;
      uint64_t v29 = 0;
      uint64_t v29 = [v24 count];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __86__MPCPlayActivityFeedEventConsumer__updatePAFEvent_withSharedListeningInfoFromCursor___block_invoke;
      v25[3] = &unk_2643C62C8;
      v25[4] = &v26;
      [v17 enumeratePreviousEventsWithType:@"shared-session-participants-changed" usingBlock:v25];
      [v5 setSharedActivityGroupSizeMax:v27[3]];
      _Block_object_dispose(&v26, 8);

      goto LABEL_18;
    }
    uint64_t v22 = 1;
LABEL_16:
    [v5 setSharedActivityType:v22];
    goto LABEL_17;
  }
LABEL_19:
}

void __86__MPCPlayActivityFeedEventConsumer__updatePAFEvent_withSharedListeningInfoFromCursor___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 payload];
  id v7 = [v3 objectForKeyedSubscript:@"participants"];

  unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  unint64_t v5 = [v7 count];
  if (v4 <= v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = v4;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
}

- (void)_updatePAFEvent:(id)a3 withAudioChangeEvent:(id)a4
{
  id v5 = a3;
  if (a4)
  {
    id v20 = v5;
    unint64_t v6 = [a4 payload];
    id v7 = [v6 objectForKeyedSubscript:@"item-audio-format-metadata"];

    double v8 = [v7 objectForKeyedSubscript:@"active-format"];
    double v9 = [v7 objectForKeyedSubscript:@"target-format"];
    uint64_t v10 = [v7 objectForKeyedSubscript:@"preferred-tiers"];
    unint64_t v11 = [v10 integerValue];

    if ([v9 codec])
    {
      id v12 = objc_alloc_init(MEMORY[0x263F89228]);
      objc_msgSend(v12, "setBitDepth:", objc_msgSend(v9, "bitDepth"));
      objc_msgSend(v12, "setBitRate:", objc_msgSend(v9, "bitrate"));
      uint64_t v13 = [v9 audioChannelLayoutDescription];
      [v12 setChannelLayoutDescription:v13];

      objc_msgSend(v12, "setCodec:", objc_msgSend(v9, "codec"));
      objc_msgSend(v12, "setSampleRate:", objc_msgSend(v9, "sampleRate"));
      objc_msgSend(v12, "setSpatialized:", objc_msgSend(v9, "isMultiChannel"));
      [v20 setTargetedAudioQuality:v12];
    }
    if ([v8 codec])
    {
      id v14 = objc_alloc_init(MEMORY[0x263F89228]);
      objc_msgSend(v14, "setBitDepth:", objc_msgSend(v8, "bitDepth"));
      objc_msgSend(v14, "setBitRate:", objc_msgSend(v8, "bitrate"));
      v15 = [v8 audioChannelLayoutDescription];
      [v14 setChannelLayoutDescription:v15];

      objc_msgSend(v14, "setCodec:", objc_msgSend(v8, "codec"));
      objc_msgSend(v14, "setSampleRate:", objc_msgSend(v8, "sampleRate"));
      objc_msgSend(v14, "setSpatialized:", objc_msgSend(v8, "isMultiChannel"));
      [v20 setProvidedAudioQuality:v14];
    }
    uint64_t v16 = 2;
    uint64_t v17 = 3;
    if ((v11 & 4) == 0) {
      uint64_t v17 = (v11 >> 1) & 4;
    }
    if ((v11 & 2) == 0) {
      uint64_t v16 = v17;
    }
    if (v11) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = v16;
    }
    [v20 setAudioQualityPreference:v18];
    if ((v11 & 0x10) != 0) {
      uint64_t v19 = 2;
    }
    else {
      uint64_t v19 = 1;
    }
    [v20 setPlaybackFormatPreference:v19];

    id v5 = v20;
  }
}

- (void)_updatePAFEvent:(id)a3 withDeviceInfoFromCursor:(id)a4
{
  v56 = self;
  v70[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v61 = a4;
  v70[0] = @"device-changed";
  unint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:1];
  v58 = [v61 findPreviousEventWithTypes:v6 matchingPayload:0];

  id v7 = [v58 payload];
  v63 = [v7 objectForKeyedSubscript:@"device-metadata"];

  double v8 = [v58 payload];
  double v9 = [v8 objectForKeyedSubscript:@"internal-carry"];
  int v10 = [v9 BOOLValue];

  if (v10)
  {
    v59 = objc_msgSend(&unk_26CC19580, "arrayByAddingObject:", @"CARRY", v56);
  }
  else
  {
    v59 = &unk_26CC19580;
  }
  objc_msgSend(v63, "objectForKeyedSubscript:", @"media-frameworks", v56);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  int v12 = 0;
  int v13 = 0;
  uint64_t v14 = [v11 countByEnumeratingWithState:&v64 objects:v69 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v65 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        v13 |= [v17 isRoot];
        v12 |= [v17 isDebug];
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v64 objects:v69 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [v63 objectForKeyedSubscript:@"application-source-version"];
  v62 = v18;
  if (v18)
  {
    int v19 = [v18 isEqualToString:@"9000"];
    int v20 = [v62 isEqualToString:@"9100"];
    int v21 = [v62 hasSuffix:@"-Debug"];
    int v22 = [v62 hasPrefix:@"9000"];
    v12 |= v21 | v19;
    v13 |= [v62 isEqualToString:@"9999.99.99"] | v22 | v20;
  }
  if ((v10 & 1) != 0 || ((v13 | v12) & 1) == 0)
  {
    v23 = v59;
    if ((v13 & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v23 = [v59 arrayByAddingObject:@"DEV"];

  if (v13)
  {
LABEL_18:
    v24 = v23;
    v23 = [v23 arrayByAddingObject:@"ROOTS"];
  }
LABEL_19:
  if (v12)
  {
    v25 = v23;
    v23 = [v23 arrayByAddingObject:@"DEBUG"];
  }
  v60 = v23;
  [v5 setBuildFeatures:v23];
  uint64_t v26 = [v63 objectForKeyedSubscript:@"user-agent"];
  [v5 setBuildVersion:v26];

  v27 = [v63 objectForKeyedSubscript:@"device-name"];
  [v5 setDeviceName:v27];

  uint64_t v28 = [v5 requestingBundleVersion];
  if (v28) {
    goto LABEL_22;
  }
  uint64_t v29 = [v5 requestingBundleIdentifier];
  BOOL v30 = v29 == 0;

  if (v30)
  {
    uint64_t v28 = [v63 objectForKeyedSubscript:@"application-bundle-id"];
    v50 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
    v51 = (void *)MRMediaRemoteCopyLocalDeviceSystemClassicalRoomApplicationDisplayID();
    v68[0] = v50;
    v68[1] = v51;
    uint64_t v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:2];
    char v53 = [v52 containsObject:v28];

    v54 = v57;
    objc_sync_enter(v54);
    if ((v53 & 1) != 0 || [v54[1] containsObject:v28])
    {
      [v5 setRequestingBundleIdentifier:v28];
      v55 = [v63 objectForKeyedSubscript:@"application-version"];
      [v5 setRequestingBundleVersion:v55];
    }
    objc_sync_exit(v54);

LABEL_22:
  }
  uint64_t v31 = [v63 objectForKeyedSubscript:@"device-software-variant"];
  if ([v31 isEqualToString:@"Carrier"])
  {
    uint64_t v32 = 2;
  }
  else if ([v31 isEqualToString:@"Beta"])
  {
    uint64_t v32 = 3;
  }
  else if ([v31 isEqualToString:@"Internal"])
  {
    uint64_t v32 = 4;
  }
  else
  {
    uint64_t v32 = 1;
  }
  [v5 setSystemReleaseType:v32];
  id v33 = [v61 findPreviousEventWithType:@"network-reachability-changed" matchingPayload:0];
  id v34 = [v33 payload];
  uint64_t v35 = [v34 objectForKeyedSubscript:@"network-reachability"];

  objc_msgSend(v5, "setOffline:", objc_msgSend(v35, "integerValue") == 0);
  char v36 = [v61 findPreviousEventWithType:@"playback-behavior-changed" matchingPayload:0];
  int v37 = [v36 payload];
  v38 = [v37 objectForKeyedSubscript:@"playback-behavior-metadata"];
  char v39 = [v38 objectForKeyedSubscript:@"repeat-type"];
  unsigned int v40 = [v39 intValue];

  if (v40 <= 2) {
    [v5 setRepeatPlayMode:v40 + 1];
  }
  char v41 = [v36 payload];
  char v42 = [v41 objectForKeyedSubscript:@"playback-behavior-metadata"];
  long long v43 = [v42 objectForKeyedSubscript:@"shuffle-type"];
  unsigned int v44 = [v43 intValue];

  if (v44 <= 2) {
    [v5 setShufflePlayMode:qword_21BEF18A8[v44]];
  }
  long long v45 = [v36 payload];
  long long v46 = [v45 objectForKeyedSubscript:@"playback-behavior-metadata"];
  v47 = [v46 objectForKeyedSubscript:@"autoplay-mode"];
  unsigned int v48 = [v47 intValue];

  if (v48 <= 3) {
    [v5 setAutoPlayMode:v48];
  }
  v49 = [MEMORY[0x263EFFA18] systemTimeZone];
  [v5 setEventTimeZone:v49];
}

- (BOOL)_vocalControlIsOnForEvent:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [v5 type];
  if (([v6 isEqualToString:@"item-resume"] & 1) == 0)
  {
    id v7 = [v5 type];
    char v8 = [v7 isEqualToString:@"item-vocal-attenuation-changed"];

    if (v8) {
      goto LABEL_5;
    }
    unint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MPCPlayActivityFeedEventConsumer.m" lineNumber:1452 description:@"Only Item Resume and Vocal Attenuation Changed events contain vocal attenuation fields."];
  }

LABEL_5:
  double v9 = [v5 payload];
  int v10 = [v9 objectForKeyedSubscript:@"vocal-attenuation-available"];
  if ([v10 BOOLValue])
  {
    id v11 = [v5 payload];
    int v12 = [v11 objectForKeyedSubscript:@"vocal-attenuation-configured"];
    if ([v12 BOOLValue])
    {
      int v13 = [v5 payload];
      uint64_t v14 = [v13 objectForKeyedSubscript:@"supports-vocal-attenuation"];
      if ([v14 BOOLValue])
      {
        uint64_t v15 = [v5 payload];
        uint64_t v16 = [v15 objectForKeyedSubscript:@"vocal-attenuation-enabled"];
        char v17 = [v16 BOOLValue];
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (void)_updatePAFEvent:(id)a3 withVocalAttenuationInfoForEndEvent:(id)a4 cursor:(id)a5
{
  v82[2] = *MEMORY[0x263EF8340];
  id v56 = a3;
  id v7 = a4;
  id v8 = a5;
  double v9 = [v7 payload];
  int v10 = [v9 objectForKeyedSubscript:@"queue-section-id"];

  id v11 = [v7 payload];
  int v12 = [v11 objectForKeyedSubscript:@"queue-item-id"];

  v82[0] = @"item-resume";
  v82[1] = @"item-vocal-attenuation-changed";
  int v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:2];
  uint64_t v14 = [v8 findPreviousEventWithTypes:v13 matchingPayload:0];

  if (v14)
  {
    uint64_t v15 = [v14 payload];
    uint64_t v16 = [v15 objectForKeyedSubscript:@"vocal-attenuation-available"];
    uint64_t v17 = [v16 BOOLValue] ? 1 : 2;

    [v56 setVocalAttenuationAvailability:v17];
    if (v10)
    {
      if (v12
        && [(MPCPlayActivityFeedEventConsumer *)self _itemIsPlayingFromQueueSectionIdentifier:v10 itemIdentifier:v12 cursor:v8])
      {
        v80 = @"queue-section-id";
        v81 = v10;
        uint64_t v18 = [NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
        char v53 = [v8 findPreviousEventWithType:@"container-begin" matchingPayload:v18];

        v78 = @"queue-section-id";
        v79 = v10;
        int v19 = [NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
        v54 = [v8 findPreviousEventWithType:@"item-hls-stream-begin" matchingPayload:v19];

        int v20 = [v54 payload];
        int v21 = [v20 objectForKeyedSubscript:@"container-indeterminate-duration"];
        if ([v21 BOOLValue])
        {

LABEL_11:
          objc_msgSend(v56, "setVocalAttenuationDuration:", 0.0, v50);
LABEL_27:

          goto LABEL_28;
        }
        int v22 = [v53 payload];
        v23 = [v22 objectForKeyedSubscript:@"container-metadata"];
        v24 = [v23 objectForKeyedSubscript:@"container-radio-subtype"];
        LODWORD(v50) = [v24 integerValue] == 2;

        if (v50) {
          goto LABEL_11;
        }
        v77[0] = @"item-resume";
        v77[1] = @"item-position-jump";
        v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:2];
        v75[0] = @"queue-section-id";
        v75[1] = @"queue-item-id";
        v76[0] = v10;
        v76[1] = v12;
        uint64_t v26 = [NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:2];
        uint64_t v51 = [(MPCPlayActivityFeedEventConsumer *)self _findRecentPlaybackStartFromTypes:v25 matchingPayload:v26 cursor:v8];

        uint64_t v68 = 0;
        v69 = (double *)&v68;
        uint64_t v70 = 0x2020000000;
        uint64_t v71 = 0;
        v27 = [v7 payload];
        uint64_t v28 = [v27 objectForKeyedSubscript:@"item-end-position"];
        [v28 doubleValue];
        uint64_t v30 = v29;

        uint64_t v71 = v30;
        uint64_t v31 = [v7 type];
        if ([v31 isEqualToString:@"item-end"])
        {
          uint64_t v32 = [v7 payload];
          id v33 = [v32 objectForKeyedSubscript:@"item-did-play-to-end"];
          int v34 = [v33 BOOLValue];

          if (v34)
          {
            v73[0] = @"queue-section-id";
            v73[1] = @"queue-item-id";
            v74[0] = v10;
            v74[1] = v12;
            uint64_t v35 = [NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:2];
            char v36 = [v8 findPreviousEventWithType:@"item-begin" matchingPayload:v35];

            uint64_t v37 = [v36 payload];
            v38 = [(id)v37 objectForKeyedSubscript:@"item-metadata"];

            char v39 = [v38 objectForKeyedSubscript:@"item-end-boundary"];
            LOBYTE(v37) = v39 == 0;

            if (v37) {
              [v38 objectForKeyedSubscript:@"item-duration"];
            }
            else {
            unsigned int v40 = [v38 objectForKeyedSubscript:@"item-end-boundary"];
            }
            [v40 doubleValue];
            *((void *)v69 + 3) = v44;

            goto LABEL_21;
          }
        }
        else
        {
        }
        char v41 = objc_msgSend(v7, "type", v51);
        int v42 = [v41 isEqualToString:@"item-position-jump"];

        if (!v42)
        {
LABEL_22:
          if (objc_msgSend(v14, "isEqual:", v51, v51))
          {
            if ([(MPCPlayActivityFeedEventConsumer *)self _vocalControlIsOnForEvent:v52])
            {
              long long v45 = [v52 payload];
              long long v46 = [v45 objectForKeyedSubscript:@"item-start-position"];
              [v46 doubleValue];
              double v48 = v47;

              [v56 setVocalAttenuationDuration:v69[3] - v48];
            }
          }
          else
          {
            uint64_t v64 = 0;
            long long v65 = (double *)&v64;
            uint64_t v66 = 0x2020000000;
            uint64_t v67 = 0;
            v63[0] = 0;
            v63[1] = v63;
            v63[2] = 0x2020000000;
            v63[3] = 0xBFF0000000000000;
            v72[0] = @"item-resume";
            v72[1] = @"item-vocal-attenuation-changed";
            v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:2];
            v57[0] = MEMORY[0x263EF8330];
            v57[1] = 3221225472;
            v57[2] = __95__MPCPlayActivityFeedEventConsumer__updatePAFEvent_withVocalAttenuationInfoForEndEvent_cursor___block_invoke;
            v57[3] = &unk_2643C1C00;
            id v58 = v52;
            v59 = self;
            v60 = v63;
            id v61 = &v68;
            v62 = &v64;
            [v8 enumeratePreviousEventsWithTypes:v49 usingBlock:v57];

            [v56 setVocalAttenuationDuration:v65[3]];
            _Block_object_dispose(v63, 8);
            _Block_object_dispose(&v64, 8);
          }
          _Block_object_dispose(&v68, 8);

          goto LABEL_27;
        }
        char v36 = [v7 payload];
        v38 = [v36 objectForKeyedSubscript:@"item-start-position"];
        [v38 doubleValue];
        *((void *)v69 + 3) = v43;
LABEL_21:

        goto LABEL_22;
      }
    }
  }
LABEL_28:
}

void __95__MPCPlayActivityFeedEventConsumer__updatePAFEvent_withVocalAttenuationInfoForEndEvent_cursor___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v19 = a2;
  if ([v19 compare:*(void *)(a1 + 32)] == 1)
  {
    int v5 = [*(id *)(a1 + 40) _vocalControlIsOnForEvent:v19];
    unint64_t v6 = [v19 payload];
    id v7 = [v6 objectForKeyedSubscript:@"item-start-position"];
    [v7 doubleValue];
    if (v5)
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;

      double v9 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      if (v9 > 0.0)
      {
        double v10 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        if (v10 > 0.0)
        {
          *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v10
                                                                      - v9
                                                                      + *(double *)(*(void *)(*(void *)(a1 + 64)
                                                                                              + 8)
                                                                                  + 24);
          *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0xBFF0000000000000;
          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0xBFF0000000000000;
        }
      }
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8;
    }
  }
  else
  {
    *a3 = 1;
    if ([*(id *)(a1 + 40) _vocalControlIsOnForEvent:v19])
    {
      id v11 = [*(id *)(a1 + 32) payload];
      int v12 = [v11 objectForKeyedSubscript:@"item-start-position"];
      [v12 doubleValue];
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v13;

      uint64_t v14 = [*(id *)(a1 + 32) type];
      LODWORD(v12) = [v14 isEqualToString:@"item-position-jump"];

      if (v12)
      {
        uint64_t v15 = [*(id *)(a1 + 32) payload];
        uint64_t v16 = [v15 objectForKeyedSubscript:@"item-end-position"];
        [v16 doubleValue];
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v17;
      }
      double v18 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      if (v18 > 0.0) {
        *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v18
      }
                                                                    - *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                                + 24)
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                + 24);
    }
  }
}

- (void)_updatePAFEvent:(id)a3 withEnqueuerAccountIdentifier:(id)a4 queueAddEvent:(id)a5 cursor:(id)a6
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    uint64_t v14 = [v12 payload];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"queue-reporting-metadata"];

    double v47 = v15;
    uint64_t v16 = [v15 objectForKeyedSubscript:@"device-metadata"];
    v50[0] = @"account-update";
    v50[1] = @"account-begin";
    uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:2];
    double v48 = @"account-id";
    id v49 = v11;
    double v18 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    id v19 = [v13 findPreviousEventWithTypes:v17 matchingPayload:v18];

    long long v46 = v19;
    int v20 = [v19 payload];
    int v21 = [v20 objectForKeyedSubscript:@"account-metadata"];

    id v22 = objc_alloc_init(MEMORY[0x263F89230]);
    v23 = [v21 objectForKeyedSubscript:@"store-account-id"];
    objc_msgSend(v22, "setStoreAccountID:", objc_msgSend(v23, "unsignedLongLongValue"));

    long long v45 = v21;
    v24 = [v21 objectForKeyedSubscript:@"store-front-id"];
    [v22 setStoreFrontID:v24];

    v25 = [v16 objectForKeyedSubscript:@"user-agent"];
    [v22 setBuildVersion:v25];

    uint64_t v26 = [v16 objectForKeyedSubscript:@"device-guid"];
    [v22 setDeviceGUID:v26];

    v27 = [v16 objectForKeyedSubscript:@"device-name"];
    [v22 setDeviceName:v27];

    uint64_t v28 = [MEMORY[0x263EFFA18] systemTimeZone];
    [v22 setTimeZone:v28];

    uint64_t v29 = [v12 payload];
    uint64_t v30 = [v29 objectForKeyedSubscript:@"queue-delegated-account-metadata"];
    uint64_t v31 = [v30 objectForKeyedSubscript:@"private-listening-enabled"];

    if (v31) {
      uint64_t v32 = v31;
    }
    else {
      uint64_t v32 = (void *)MEMORY[0x263EFFA88];
    }
    [v22 setPrivateListeningEnabled:v32];
    id v33 = [v12 payload];
    int v34 = [v33 objectForKeyedSubscript:@"private-listening-source"];
    uint64_t v35 = [v34 integerValue];

    if (v35 == 1)
    {
      id v44 = v11;
      id v36 = v10;
      uint64_t v37 = [v13 findPreviousEventWithType:@"device-changed" matchingPayload:0];
      v38 = [v37 payload];
      char v39 = [v38 objectForKeyedSubscript:@"device-metadata"];
      unsigned int v40 = [v39 objectForKeyedSubscript:@"private-listening-enabled"];

      if ([v40 BOOLValue]) {
        [v22 setPrivateListeningEnabled:MEMORY[0x263EFFA88]];
      }

      uint64_t v31 = v40;
      id v10 = v36;
      id v11 = v44;
    }
    char v41 = [v16 objectForKeyedSubscript:@"device-software-variant"];
    int v42 = v47;
    if ([v41 isEqualToString:@"Carrier"])
    {
      uint64_t v43 = 2;
    }
    else if ([v41 isEqualToString:@"Beta"])
    {
      uint64_t v43 = 3;
    }
    else if ([v41 isEqualToString:@"Internal"])
    {
      uint64_t v43 = 4;
    }
    else
    {
      uint64_t v43 = 1;
    }
    [v22 setSystemReleaseType:v43];
    [v22 setSBEnabled:1];
    [v10 setEnqueuerProperties:v22];
  }
  else
  {
    int v42 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v52 = self;
      __int16 v53 = 2114;
      id v54 = v10;
      __int16 v55 = 2114;
      id v56 = v13;
      _os_log_impl(&dword_21BB87000, v42, OS_LOG_TYPE_ERROR, "MPCPlayActivityFeedEventConsumer %p - Unable to update PAF event [missing account identifier for delegated playback] - event:%{public}@ - cursor:%{public}@", buf, 0x20u);
    }
  }
}

- (void)_updatePAFEvent:(id)a3 withAccountIdentifier:(id)a4 cursor:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    v22[0] = @"account-update";
    v22[1] = @"account-begin";
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    int v20 = @"account-id";
    id v21 = v9;
    id v12 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v13 = [v10 findPreviousEventWithTypes:v11 matchingPayload:v12];

    uint64_t v14 = [v13 payload];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"account-metadata"];

    uint64_t v16 = [v15 objectForKeyedSubscript:@"subscription-status"];
    objc_msgSend(v8, "setSBEnabled:", objc_msgSend(v16, "hasCapability:", 128));
    uint64_t v17 = [v15 objectForKeyedSubscript:@"store-front-id"];
    [v8 setStoreFrontID:v17];

    double v18 = [v15 objectForKeyedSubscript:@"store-account-id"];
    objc_msgSend(v8, "setStoreAccountID:", objc_msgSend(v18, "unsignedLongLongValue"));

    id v19 = [v15 objectForKeyedSubscript:@"household-id"];
    [v8 setHouseholdID:v19];
  }
  else
  {
    id v13 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v24 = self;
      __int16 v25 = 2114;
      id v26 = v8;
      __int16 v27 = 2114;
      id v28 = v10;
      _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_ERROR, "MPCPlayActivityFeedEventConsumer %p - Unable to update PAF event [missing account identifier] - event:%{public}@ - cursor:%{public}@", buf, 0x20u);
    }
  }
}

- (void)_updatePAFEvent:(id)a3 withItemBeginEvent:(id)a4 containerBeginPayload:(id)a5 cursor:(id)a6 forEventType:(id)a7
{
  uint64_t v163 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [v13 payload];
  double v18 = [v17 objectForKeyedSubscript:@"queue-section-id"];

  id v19 = [v13 payload];
  int v20 = [v19 objectForKeyedSubscript:@"queue-item-id"];

  if (v18 && v20)
  {
    v131 = v16;
    v155[0] = @"queue-section-id";
    v155[1] = @"queue-item-id";
    v156[0] = v18;
    v156[1] = v20;
    v134 = v20;
    id v21 = [NSDictionary dictionaryWithObjects:v156 forKeys:v155 count:2];
    v140 = [v15 findPreviousEventWithType:@"item-update" matchingPayload:v21];

    id v22 = [v13 payload];
    v142 = [v14 objectForKeyedSubscript:@"container-metadata"];
    v141 = [v22 objectForKeyedSubscript:@"item-metadata"];
    v153 = @"queue-section-id";
    v139 = v22;
    v23 = [v22 objectForKeyedSubscript:@"queue-section-id"];
    v154 = v23;
    v24 = [NSDictionary dictionaryWithObjects:&v154 forKeys:&v153 count:1];
    __int16 v25 = [v15 findPreviousEventWithType:@"queue-add" matchingPayload:v24];

    v137 = v25;
    id v26 = [v25 payload];
    __int16 v27 = [v26 objectForKeyedSubscript:@"private-listening-source"];
    uint64_t v28 = [v27 integerValue];

    v135 = v18;
    v136 = v15;
    id v132 = v14;
    switch(v28)
    {
      case 0:
        [v12 setPrivateListeningEnabled:MEMORY[0x263EFFA88]];
        goto LABEL_29;
      case 1:
        uint64_t v30 = [v15 findPreviousEventWithType:@"device-changed" matchingPayload:0];
        uint64_t v31 = [v30 payload];
        uint64_t v32 = [v31 objectForKeyedSubscript:@"device-metadata"];
        id v33 = [v32 objectForKeyedSubscript:@"private-listening-enabled"];

        int v34 = [v30 payload];
        uint64_t v35 = [v34 objectForKeyedSubscript:@"device-metadata"];
        id v36 = [v35 objectForKeyedSubscript:@"focus-mode-private-listening-enabled"];
        uint64_t v37 = [v36 integerValue];

        if (v37)
        {
          v38 = [NSNumber numberWithInt:v37 == 1];
          [v12 setPrivateListeningEnabled:v38];
        }
        else
        {
          if (v33) {
            uint64_t v57 = v33;
          }
          else {
            uint64_t v57 = (void *)MEMORY[0x263EFFA88];
          }
          [v12 setPrivateListeningEnabled:v57];
        }

        goto LABEL_29;
      case 2:
        char v39 = [v137 payload];
        unsigned int v40 = [v39 objectForKeyedSubscript:@"account-id"];

        if (v40)
        {
          v152[0] = @"account-begin";
          v152[1] = @"account-update";
          char v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v152 count:2];
          v150 = @"account-id";
          v151 = v40;
          int v42 = [NSDictionary dictionaryWithObjects:&v151 forKeys:&v150 count:1];
          uint64_t v43 = [v15 findPreviousEventWithTypes:v41 matchingPayload:v42];

          id v44 = [v15 findPreviousEventWithType:@"device-changed" matchingPayload:0];
          long long v45 = [v43 payload];
          long long v46 = [v45 objectForKeyedSubscript:@"account-metadata"];
          double v47 = [v46 objectForKeyedSubscript:@"private-listening-enabled"];

          double v48 = [v44 payload];
          id v49 = [v48 objectForKeyedSubscript:@"device-metadata"];
          uint64_t v50 = [v49 objectForKeyedSubscript:@"focus-mode-private-listening-enabled"];
          uint64_t v51 = [v50 integerValue];

          if (v51)
          {
            uint64_t v52 = [NSNumber numberWithInt:v51 == 1];
            [v12 setPrivateListeningEnabled:v52];
          }
          else
          {
            if (v47) {
              v60 = v47;
            }
            else {
              v60 = (void *)MEMORY[0x263EFFA88];
            }
            [v12 setPrivateListeningEnabled:v60];
          }
          id v14 = v132;

LABEL_29:
          id v61 = [v141 objectForKeyedSubscript:@"item-duration"];
          [v61 doubleValue];
          objc_msgSend(v12, "setItemDuration:");

          v62 = [v141 objectForKeyedSubscript:@"item-has-video"];
          unsigned int v63 = [v62 BOOLValue];

          [v12 setMediaType:v63];
          uint64_t v64 = [v139 objectForKeyedSubscript:@"radio-track-info"];
          [v12 setTrackInfo:v64];

          v59 = [v14 objectForKeyedSubscript:@"container-kind"];
          uint64_t v65 = [v59 modelClass];
          if (v65 == objc_opt_class())
          {
            uint64_t v70 = 1;
            uint64_t v67 = v140;
          }
          else
          {
            uint64_t v66 = [v59 modelClass];
            uint64_t v67 = v140;
            if (v66 == objc_opt_class())
            {
              uint64_t v70 = 2;
            }
            else
            {
              uint64_t v68 = [v59 modelClass];
              if (v68 == objc_opt_class())
              {
                uint64_t v70 = 3;
              }
              else
              {
                uint64_t v69 = [v59 modelClass];
                uint64_t v70 = 4 * (v69 == objc_opt_class());
              }
            }
          }
          [v12 setContainerType:v70];
          uint64_t v71 = [v14 objectForKeyedSubscript:@"container-ids"];
          id v72 = objc_alloc_init(MEMORY[0x263F89240]);
          v73 = [v67 payload];
          v74 = [v73 objectForKeyedSubscript:@"item-ids"];
          v75 = v74;
          if (v74)
          {
            id v76 = v74;
          }
          else
          {
            id v76 = [v139 objectForKeyedSubscript:@"item-ids"];
          }
          v77 = v76;

          id v138 = objc_alloc_init(MEMORY[0x263F89248]);
          v78 = [v140 payload];
          v79 = [v78 objectForKeyedSubscript:@"item-kind"];
          v80 = v79;
          if (v79)
          {
            id v81 = v79;
          }
          else
          {
            id v81 = [v139 objectForKeyedSubscript:@"item-kind"];
          }
          v133 = v81;

          v82 = [v71 universalStore];
          objc_msgSend(v72, "setAdamID:", objc_msgSend(v82, "adamID"));

          v83 = [v77 personalizedStore];
          v84 = [v83 cloudAlbumID];
          [v72 setCloudAlbumID:v84];

          v85 = [v71 personalizedStore];
          objc_msgSend(v72, "setCloudPlaylistID:", objc_msgSend(v85, "cloudID"));

          v86 = [v71 universalStore];
          v87 = [v86 globalPlaylistID];
          [v72 setGlobalPlaylistID:v87];

          v88 = [v142 objectForKeyedSubscript:@"container-playlist-version-hash"];
          [v72 setPlaylistVersionHash:v88];

          v89 = [v71 radio];
          objc_msgSend(v72, "setStationID:", objc_msgSend(v89, "stationID"));

          v90 = [v71 radio];
          v91 = [v90 stationHash];
          [v72 setStationHash:v91];

          v92 = [v71 radio];
          v93 = [v92 stationStringID];
          [v72 setStationStringID:v93];

          [v12 setContainerIDs:v72];
          v94 = [v142 objectForKeyedSubscript:@"container-is-collaborative-playlist"];
          objc_msgSend(v12, "setCollaborativePlaylist:", objc_msgSend(v94, "BOOLValue"));

          v95 = [v141 objectForKeyedSubscript:@"item-artist-uploaded"];
          LODWORD(v93) = [v95 BOOLValue];

          if (v93)
          {
            v96 = [v77 universalStore];
            uint64_t v97 = [v96 subscriptionAdamID];
            v98 = v77;
            if (v97)
            {
              [v138 setSubscriptionAdamID:v97];
            }
            else
            {
              v110 = [v77 universalStore];
              objc_msgSend(v138, "setSubscriptionAdamID:", objc_msgSend(v110, "adamID"));
            }
            v107 = v142;

            uint64_t v109 = 6;
          }
          else
          {
            uint64_t v99 = [v59 modelClass];
            uint64_t v100 = objc_opt_class();
            v101 = [v77 universalStore];
            v102 = v101;
            v98 = v77;
            if (v99 == v100)
            {
              uint64_t v111 = [v101 adamID];
              v107 = v142;
              if (v111)
              {
                [v138 setRadioAdamID:v111];
              }
              else
              {
                v112 = [v98 universalStore];
                objc_msgSend(v138, "setRadioAdamID:", objc_msgSend(v112, "subscriptionAdamID"));
              }
              uint64_t v109 = [v138 radioAdamID] != 0;
            }
            else
            {
              objc_msgSend(v138, "setSubscriptionAdamID:", objc_msgSend(v101, "subscriptionAdamID"));

              v103 = [v77 universalStore];
              objc_msgSend(v138, "setPurchasedAdamID:", objc_msgSend(v103, "purchasedAdamID"));

              v104 = [v77 personalizedStore];
              objc_msgSend(v138, "setCloudID:", objc_msgSend(v104, "cloudID"));

              v105 = [v77 universalStore];
              objc_msgSend(v138, "setReportingAdamID:", objc_msgSend(v105, "reportingAdamID"));

              uint64_t v106 = [v133 modelClass];
              v107 = v142;
              if (v106 == objc_opt_class())
              {
                uint64_t v109 = 9;
              }
              else
              {
                uint64_t v108 = [v133 modelClass];
                if (v108 == objc_opt_class()) {
                  uint64_t v109 = 8;
                }
                else {
                  uint64_t v109 = [v138 subscriptionAdamID]
                }
                      || [v138 purchasedAdamID]
                      || [v138 reportingAdamID];
              }
            }
          }
          uint64_t v113 = [v107 objectForKeyedSubscript:@"container-radio-type"];
          if (v113
            && (v114 = (void *)v113,
                [v107 objectForKeyedSubscript:@"container-radio-type"],
                v115 = objc_claimAutoreleasedReturnValue(),
                int v116 = [v115 intValue],
                v115,
                v114,
                v116 == 4))
          {
            id v128 = v12;
            v149[0] = @"item-hls-stream-begin";
            v149[1] = @"item-hls-stream-end";
            v117 = [MEMORY[0x263EFF8C0] arrayWithObjects:v149 count:2];
            v147 = @"queue-section-id";
            v148 = v135;
            uint64_t v118 = [NSDictionary dictionaryWithObjects:&v148 forKeys:&v147 count:1];
            v119 = [v136 findPreviousEventWithTypes:v117 matchingPayload:v118];

            v145[0] = @"queue-section-id";
            v145[1] = @"queue-item-id";
            v146[0] = v135;
            v146[1] = v134;
            v120 = [NSDictionary dictionaryWithObjects:v146 forKeys:v145 count:2];
            uint64_t v129 = [v136 findPreviousEventWithType:@"item-timed-metadata-ping" matchingPayload:v120];

            v130 = v119;
            v121 = [v119 type];
            LOBYTE(v118) = [v121 isEqualToString:@"item-hls-stream-begin"];

            v122 = [v142 objectForKeyedSubscript:@"container-radio-subtype"];
            uint64_t v123 = [v122 integerValue];

            if ((v118 & 1) != 0 || v123 == 2)
            {
              id v16 = v131;
              v127 = (void *)v129;
              if (v129 && ([v131 isEqualToString:@"item-end"] & 1) != 0) {
                uint64_t v109 = 5;
              }
              else {
                uint64_t v109 = 4;
              }
              int v20 = v134;
              id v12 = v128;
            }
            else
            {
              if (v119)
              {
                v124 = [v136 cursorUntilEvent:v13];
                v143 = @"queue-section-id";
                v144 = v135;
                v125 = [NSDictionary dictionaryWithObjects:&v144 forKeys:&v143 count:1];
                v126 = [v124 findPreviousEventWithType:@"item-hls-stream-end" matchingPayload:v125];

                if (v126) {
                  uint64_t v109 = 4;
                }
              }
              id v16 = v131;
              int v20 = v134;
              id v12 = v128;
              v127 = (void *)v129;
            }
          }
          else
          {
            id v16 = v131;
            int v20 = v134;
          }
          [v12 setItemIDs:v138];
          [v12 setItemType:v109];

          id v14 = v132;
          double v18 = v135;
          id v15 = v136;
        }
        else
        {
          id v58 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218498;
            v158 = self;
            __int16 v159 = 2114;
            id v160 = v137;
            __int16 v161 = 2114;
            id v162 = v15;
            _os_log_impl(&dword_21BB87000, v58, OS_LOG_TYPE_ERROR, "PlayActivityFeedEventConsumer %p: _updatePafEvent:withItemBeginEvent:containerBeginPayload:cursor:forEventType: - could not find accountIdentifier event=%{public}@ - cursor:%{public}@", buf, 0x20u);
          }
          id v16 = v131;
          int v20 = v134;
          v59 = v58;
        }
        uint64_t v29 = v140;

        break;
      case 3:
        __int16 v53 = [v137 payload];
        id v54 = [v53 objectForKeyedSubscript:@"queue-reporting-metadata"];
        __int16 v55 = [v54 objectForKeyedSubscript:@"private-listening-enabled"];

        if (v55) {
          id v56 = v55;
        }
        else {
          id v56 = (void *)MEMORY[0x263EFFA88];
        }
        [v12 setPrivateListeningEnabled:v56];

        goto LABEL_29;
      default:
        goto LABEL_29;
    }
  }
  else
  {
    uint64_t v29 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v158 = self;
      __int16 v159 = 2114;
      id v160 = v13;
      __int16 v161 = 2114;
      id v162 = v15;
      _os_log_impl(&dword_21BB87000, v29, OS_LOG_TYPE_ERROR, "PlayActivityFeedEventConsumer %p: _updatePafEvent:withItemBeginEvent:containerBeginPayload:cursor:forEventType: - could not find queueSectionIdentifier/itemIdentifier event=%{public}@ - cursor:%{public}@", buf, 0x20u);
    }
  }
}

- (void)_updatePAFEvent:(id)a3 withQueueAddEvent:(id)a4 queueSectionIdentifier:(id)a5 cursor:(id)a6
{
  v38[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v35 = a5;
  id v12 = a6;
  id v13 = [v11 payload];
  id v14 = [v13 objectForKeyedSubscript:@"queue-reporting-metadata"];

  id v15 = [v14 objectForKeyedSubscript:@"feature-name"];
  [v10 setFeatureName:v15];

  id v16 = [v14 objectForKeyedSubscript:@"queue-grouping-id"];
  [v10 setQueueGroupingID:v16];

  uint64_t v17 = [v14 objectForKeyedSubscript:@"reco-data"];
  [v10 setRecommendationData:v17];

  double v18 = NSNumber;
  uint64_t v19 = [v14 objectForKeyedSubscript:@"siri-ref-id"];
  int v20 = [v18 numberWithBool:v19 != 0];
  [v10 setSiriInitiated:v20];

  id v21 = [v14 objectForKeyedSubscript:@"application-bundle-id"];
  id v33 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
  int v34 = (void *)MRMediaRemoteCopyLocalDeviceSystemClassicalRoomApplicationDisplayID();
  v38[0] = v33;
  v38[1] = v34;
  id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];
  LOBYTE(v19) = [v22 containsObject:v21];

  v23 = self;
  objc_sync_enter(v23);
  if ((v19 & 1) != 0 || [(NSArray *)v23->_allowedBundleIds containsObject:v21])
  {
    [v10 setRequestingBundleIdentifier:v21];
    v24 = [v14 objectForKeyedSubscript:@"application-version"];
    [v10 setRequestingBundleVersion:v24];
  }
  objc_sync_exit(v23);

  __int16 v25 = [v11 payload];
  id v26 = [v25 objectForKeyedSubscript:@"account-id"];

  id v36 = @"rectification-section-id";
  id v37 = v35;
  __int16 v27 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  uint64_t v28 = [v12 findPreviousEventWithType:@"account-rectification" matchingPayload:v27];

  if (v28)
  {
    uint64_t v29 = [v28 payload];
    uint64_t v30 = [v29 objectForKeyedSubscript:@"account-id"];

    id v26 = (void *)v30;
  }
  [(MPCPlayActivityFeedEventConsumer *)v23 _updatePAFEvent:v10 withAccountIdentifier:v26 cursor:v12];
  uint64_t v31 = [v11 payload];
  uint64_t v32 = [v31 objectForKeyedSubscript:@"queue-delegated-account-id"];

  if (v32) {
    [(MPCPlayActivityFeedEventConsumer *)v23 _updatePAFEvent:v10 withEnqueuerAccountIdentifier:v32 queueAddEvent:v11 cursor:v12];
  }
}

- (void)_sendPlayEndNotificationWithStartTime:(double)a3 endTime:(double)a4 pafEvent:(id)a5 cursor:(id)a6
{
  v39[2] = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v13 = [v11 findPreviousEventWithType:@"session-begin" matchingPayload:0];
  id v14 = [v13 payload];
  id v15 = [v14 objectForKeyedSubscript:@"behavior-type"];
  uint64_t v16 = [v15 integerValue];

  v39[0] = @"shared-session-begin";
  v39[1] = @"shared-session-end";
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
  double v18 = [v11 findPreviousEventWithTypes:v17 matchingPayload:0];

  if (v18)
  {
    uint64_t v19 = [v18 type];
    if ([v19 isEqualToString:@"shared-session-begin"])
    {
      [v18 payload];
      int v20 = v38 = v10;
      [v20 objectForKeyedSubscript:@"shared-session-type"];
      id v21 = v13;
      v23 = id v22 = self;
      BOOL v24 = [v23 integerValue] == 2;

      self = v22;
      id v13 = v21;

      id v10 = v38;
    }
    else
    {
      BOOL v24 = 0;
    }
  }
  else
  {
    BOOL v24 = 0;
  }
  unint64_t v25 = 0x263F08000;
  if (v16 == 3 || v24)
  {
    id v26 = [v11 findPreviousEventWithType:@"shared-session-participants-changed" matchingPayload:0];
    [v26 payload];
    uint64_t v28 = v27 = v10;
    uint64_t v29 = [v28 objectForKeyedSubscript:@"participants"];

    uint64_t v30 = [v26 payload];
    [v30 objectForKeyedSubscript:@"shared-session-id"];
    uint64_t v31 = v13;
    id v33 = v32 = self;

    int v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v29, "count"));
    [v12 setObject:v34 forKeyedSubscript:@"MPCPlayActivityUtilitiesPlayEndEventSharedSessionParticipantCountKey"];

    id v10 = v27;
    [v12 setObject:v33 forKeyedSubscript:@"MPCPlayActivityUtilitiesPlayEndEventSharedSessionIdKey"];

    self = v32;
    id v13 = v31;
    unint64_t v25 = 0x263F08000uLL;
  }
  if ([v10 endReasonType] == 11) {
    [v12 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"MPCPlayActivityUtilitiesPlayEndEventIsNaturalTransitionKey"];
  }
  id v35 = [*(id *)(v25 + 2584) numberWithDouble:a3];
  [v12 setObject:v35 forKeyedSubscript:@"MPCPlayActivityUtilitiesPlayEndEventStartTimeKey"];

  id v36 = [*(id *)(v25 + 2584) numberWithDouble:a4];
  [v12 setObject:v36 forKeyedSubscript:@"MPCPlayActivityUtilitiesPlayEndEventEndTimeKey"];

  id v37 = [MEMORY[0x263F08A00] defaultCenter];
  [v37 postNotificationName:@"MPCPlayActivityUtilitiesPlayEndNotification" object:self userInfo:v12];
}

- (double)_getPlaybackDurationForHLSStreamFromStartEvent:(id)a3 toEndEvent:(id)a4 withLimitedCursor:(id)a5
{
  v26[3] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v8 timeIntervalSinceEvent:v7];
  double v11 = v10;
  id v12 = [v9 findPreviousEventWithType:@"item-buffer-stall" matchingPayload:0];
  if (v12)
  {
    id v13 = [v9 cursorUntilEvent:v12];
    uint64_t v14 = [v13 countOfPreviousEventsWithType:@"item-buffer-ready" matchingPayload:0];
    uint64_t v22 = 0;
    v23 = (double *)&v22;
    uint64_t v24 = 0x2020000000;
    uint64_t v25 = 0;
    uint64_t v15 = 0;
    if (!v14) {
      objc_msgSend(v8, "timeIntervalSinceEvent:", v12, 0.0);
    }
    uint64_t v25 = v15;
    v26[0] = @"item-pause";
    v26[1] = @"item-end";
    v26[2] = @"item-buffer-ready";
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:3];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __112__MPCPlayActivityFeedEventConsumer__getPlaybackDurationForHLSStreamFromStartEvent_toEndEvent_withLimitedCursor___block_invoke;
    v18[3] = &unk_2643C1BA0;
    id v19 = v9;
    id v20 = v7;
    id v21 = &v22;
    [v19 enumeratePreviousEventsWithTypes:v16 usingBlock:v18];

    if (v11 - v23[3] >= 0.0) {
      double v11 = v11 - v23[3];
    }
    else {
      double v11 = 0.0;
    }

    _Block_object_dispose(&v22, 8);
  }

  return v11;
}

void __112__MPCPlayActivityFeedEventConsumer__getPlaybackDurationForHLSStreamFromStartEvent_toEndEvent_withLimitedCursor___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  int v5 = objc_msgSend(*(id *)(a1 + 32), "cursorFromEvent:untilEvent:");
  unint64_t v6 = [v5 findPreviousEventWithType:@"item-buffer-stall" matchingPayload:0];
  if (v6)
  {
    id v7 = [v5 cursorFromEvent:v6 untilEvent:*(void *)(a1 + 40)];
    id v8 = [v7 findPreviousEventWithType:@"item-buffer-stall" matchingPayload:0];
    if (v8)
    {
      [v10 timeIntervalSinceEvent:v8];
      if (v9 < 0.0) {
        double v9 = 0.0;
      }
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 24);
    }
    else
    {
      *a3 = 1;
    }
  }
  else
  {
    *a3 = 1;
  }
}

- (double)_getStartTimeForMostRecentPlaybackStart:(id)a3 withItemBeginEvent:(id)a4 containerBeginEvent:(id)a5 cursor:(id)a6
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 payload];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"queue-section-id"];

  uint64_t v16 = [v10 payload];
  uint64_t v17 = [v16 objectForKeyedSubscript:@"queue-item-id"];

  v85 = (void *)v17;
  if (v15 && v17)
  {
    v97[0] = @"item-hls-stream-begin";
    v97[1] = @"item-hls-stream-end";
    double v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v97 count:2];
    v95 = @"queue-section-id";
    v96 = v15;
    [NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];
    id v19 = v84 = v12;
    id v20 = [v13 findPreviousEventWithTypes:v18 matchingPayload:v19];

    if (!v84) {
      goto LABEL_12;
    }
    id v21 = [v84 payload];
    uint64_t v22 = [v21 objectForKeyedSubscript:@"container-metadata"];
    v23 = [v22 objectForKeyedSubscript:@"container-radio-type"];
    v82 = v11;
    int v24 = [v23 intValue];

    BOOL v25 = v24 == 4;
    id v11 = v82;
    if (!v25) {
      goto LABEL_12;
    }
    if (v20)
    {
      id v26 = [v20 type];
      if ([v26 isEqualToString:@"item-hls-stream-begin"])
      {
        v80 = [v82 payload];
        v79 = [v80 objectForKeyedSubscript:@"item-metadata"];
        id v27 = [v79 objectForKeyedSubscript:@"item-has-video"];
        if ([v27 BOOLValue])
        {
          int v28 = 0;
        }
        else
        {
          v78 = [v20 payload];
          uint64_t v51 = [v78 objectForKeyedSubscript:@"container-indeterminate-duration"];
          int v28 = [v51 BOOLValue] ^ 1;

          id v11 = v82;
        }
      }
      else
      {
        int v28 = 0;
      }

      uint64_t v30 = [v13 cursorUntilEvent:v11];
      if (v28)
      {
        id v81 = [v13 cursorUntilEvent:v20];
        uint64_t v52 = [v81 countOfPreviousEventsWithType:@"item-resume" matchingPayload:0];
        if (v52)
        {
          unint64_t v53 = 0x263EFF000uLL;
          if (v52 != 1) {
            goto LABEL_40;
          }
          id v54 = [v10 type];
          if ([v54 isEqualToString:@"item-resume"])
          {

            goto LABEL_40;
          }
          uint64_t v58 = [v81 countOfPreviousEventsWithType:@"item-timed-metadata-ping" matchingPayload:0];

          double v29 = 0.0;
          if (v58 >= 2)
          {
LABEL_40:
            v59 = [v10 type];
            int v60 = [v59 isEqualToString:@"item-resume"];

            if (v60)
            {
              id v36 = [v10 payload];
              id v37 = [v36 objectForKeyedSubscript:@"item-start-position"];
              [v37 doubleValue];
              double v29 = v61;
              id v11 = v82;
              goto LABEL_16;
            }
            v94[0] = @"item-resume";
            v94[1] = @"item-begin";
            v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:v94 count:2];
            v92 = @"queue-section-id";
            v93 = v15;
            unsigned int v63 = [*(id *)(v53 + 2352) dictionaryWithObjects:&v93 forKeys:&v92 count:1];
            [v13 findPreviousEventWithTypes:v62 matchingPayload:v63];
            id v36 = v64 = v53;

            v90[0] = @"queue-section-id";
            v90[1] = @"item-jump-user-initiated";
            v91[0] = v15;
            v91[1] = MEMORY[0x263EFFA88];
            uint64_t v65 = [*(id *)(v64 + 2352) dictionaryWithObjects:v91 forKeys:v90 count:2];
            id v37 = [v30 findPreviousEventWithType:@"item-position-jump" matchingPayload:v65];

            if (v37 && (!v36 || [v37 compare:v36] == 1))
            {
              id v66 = v37;

              id v36 = v66;
            }
            uint64_t v67 = [v36 type];
            int v68 = [v67 isEqualToString:@"item-begin"];

            if (v68)
            {
              uint64_t v69 = [v36 payload];
              uint64_t v70 = [v69 objectForKeyedSubscript:@"item-metadata"];
              uint64_t v71 = [v70 objectForKeyedSubscript:@"item-initial-position"];
            }
            else
            {
              id v72 = [v36 type];
              int v73 = [v72 isEqualToString:@"item-resume"];

              if (!v73)
              {
                v75 = [v36 type];
                int v76 = [v75 isEqualToString:@"item-position-jump"];

                id v11 = v82;
                if (!v76)
                {
                  uint64_t v71 = 0;
                  goto LABEL_52;
                }
                uint64_t v69 = [v36 payload];
                uint64_t v71 = [v69 objectForKeyedSubscript:@"item-end-position"];
LABEL_51:

LABEL_52:
                [v71 doubleValue];
                double v29 = v74;

                goto LABEL_16;
              }
              uint64_t v69 = [v36 payload];
              uint64_t v71 = [v69 objectForKeyedSubscript:@"item-start-position"];
            }
            id v11 = v82;
            goto LABEL_51;
          }
        }
        else
        {
          double v29 = 0.0;
          unint64_t v53 = 0x263EFF000;
          if ([v81 countOfPreviousEventsWithType:@"item-timed-metadata-ping" matchingPayload:0] >= 2)goto LABEL_40; {
        }
          }
        id v12 = v84;
        char v41 = v81;
        goto LABEL_35;
      }
    }
    else
    {
LABEL_12:
      uint64_t v30 = [v13 cursorUntilEvent:v11];
    }
    uint64_t v31 = [v10 type];
    int v32 = [v31 isEqualToString:@"item-resume"];

    if (!v32)
    {
      char v39 = [v10 type];
      int v40 = [v39 isEqualToString:@"item-begin"];

      if (v40)
      {
        char v41 = [v11 payload];
        id v36 = [v41 objectForKeyedSubscript:@"item-metadata"];
        int v42 = [v36 objectForKeyedSubscript:@"item-initial-position"];
        [v42 doubleValue];
        double v29 = v43;
      }
      else
      {
        char v41 = [v10 payload];
        id v36 = [v41 objectForKeyedSubscript:@"item-end-position"];
        [v36 doubleValue];
        double v29 = v44;
      }
      id v12 = v84;
      goto LABEL_34;
    }
    id v33 = [v13 cursorFromEvent:v10 untilEvent:v11];
    v88[0] = @"queue-section-id";
    v88[1] = @"queue-item-id";
    v89[0] = v15;
    v89[1] = v85;
    int v34 = [NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:2];
    id v81 = v33;
    uint64_t v35 = [v33 countOfPreviousEventsWithType:@"item-resume" matchingPayload:v34];

    if (!v35)
    {
      v83 = v11;
      v87[0] = MEMORY[0x263EFFA88];
      v86[0] = @"item-jump-user-initiated";
      v86[1] = @"queue-section-id";
      v77 = [v10 payload];
      long long v45 = [v77 objectForKeyedSubscript:@"queue-section-id"];
      v87[1] = v45;
      v86[2] = @"queue-item-id";
      long long v46 = [v10 payload];
      double v47 = [v46 objectForKeyedSubscript:@"queue-item-id"];
      v87[2] = v47;
      double v48 = [NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:3];
      id v36 = [v30 findPreviousEventWithType:@"item-position-jump" matchingPayload:v48];

      if (v36)
      {
        id v37 = [v36 payload];
        id v49 = [v37 objectForKeyedSubscript:@"item-end-position"];
        [v49 doubleValue];
        double v29 = v50;
        id v11 = v83;
      }
      else
      {
        id v11 = v83;
        id v37 = [v83 payload];
        id v49 = [v37 objectForKeyedSubscript:@"item-metadata"];
        __int16 v55 = [v49 objectForKeyedSubscript:@"item-initial-position"];
        [v55 doubleValue];
        double v29 = v56;
      }
      id v12 = v84;

      goto LABEL_33;
    }
    id v36 = [v10 payload];
    id v37 = [v36 objectForKeyedSubscript:@"item-start-position"];
    [v37 doubleValue];
    double v29 = v38;
LABEL_16:
    id v12 = v84;
LABEL_33:

    char v41 = v81;
LABEL_34:

LABEL_35:
    goto LABEL_36;
  }
  id v20 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
  double v29 = -1.0;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v99 = self;
    __int16 v100 = 2114;
    id v101 = v10;
    __int16 v102 = 2114;
    id v103 = v13;
    _os_log_impl(&dword_21BB87000, v20, OS_LOG_TYPE_ERROR, "PlayActivityFeedEventConsumer %p: _getStartTimeForMostRecentPlaybackStart:withItemBeginEvent:cursor: - could not find queueSectionIdentifier/itemIdentifier event=%{public}@ - cursor:%{public}@", buf, 0x20u);
  }
LABEL_36:

  return v29;
}

- (id)_findRecentPlaybackStartFromTypes:(id)a3 matchingPayload:(id)a4 cursor:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__14795;
  id v20 = __Block_byref_object_dispose__14796;
  id v21 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __93__MPCPlayActivityFeedEventConsumer__findRecentPlaybackStartFromTypes_matchingPayload_cursor___block_invoke;
  v13[3] = &unk_2643C1B70;
  id v10 = v9;
  id v14 = v10;
  uint64_t v15 = &v16;
  [v10 enumeratePreviousEventsWithTypes:v7 matchingPayload:v8 usingBlock:v13];
  id v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v11;
}

void __93__MPCPlayActivityFeedEventConsumer__findRecentPlaybackStartFromTypes_matchingPayload_cursor___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  v16[2] = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = [v6 type];
  int v8 = [v7 isEqualToString:@"item-position-jump"];

  if (!v8) {
    goto LABEL_7;
  }
  id v9 = [*(id *)(a1 + 32) cursorFromEvent:v6 untilEvent:0];
  v16[0] = @"remote-control-begin";
  v16[1] = @"remote-control-end";
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  id v11 = [v9 findPreviousEventWithTypes:v10 matchingPayload:0];

  if (v11)
  {
    id v12 = [v11 type];
    if ([v12 isEqualToString:@"remote-control-end"])
    {

      goto LABEL_5;
    }
    id v13 = [v6 payload];
    id v14 = [v13 objectForKeyedSubscript:@"item-jump-user-initiated"];
    int v15 = [v14 BOOLValue];

    if (!v15) {
      goto LABEL_8;
    }
LABEL_7:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
    goto LABEL_8;
  }
LABEL_5:

LABEL_8:
}

- (id)_generateAggregateNoncatalogEndEventForCursor:(id)a3
{
  v82[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v82[0] = @"item-begin";
  v82[1] = @"item-pause";
  v82[2] = @"item-end";
  int v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:3];
  id v6 = [v4 findPreviousEventWithTypes:v5 matchingPayload:0];

  id v7 = [v6 type];
  int v8 = [v7 isEqualToString:@"item-begin"];

  if (!v8)
  {
    id v28 = 0;
    goto LABEL_30;
  }
  id v9 = v6;
  unint64_t v53 = [v4 cursorUntilEvent:v9];
  id v10 = [v9 payload];
  id v11 = [v10 objectForKeyedSubscript:@"queue-item-id"];
  BOOL v12 = v11 == 0;

  if (v12)
  {
    uint64_t v17 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v4;
      _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_ERROR, "PlayActivityFeedEventConsumer %p: _generateAggregateNoncatalogEndEventForCursor: - could not find queueItemIdentifier - cursor:%{public}@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v13 = MEMORY[0x263EFFA88];
    v80[1] = @"queue-item-id";
    v81[0] = MEMORY[0x263EFFA88];
    v80[0] = @"item-jump-user-initiated";
    id v14 = [v9 payload];
    int v15 = [v14 objectForKeyedSubscript:@"queue-item-id"];
    v81[1] = v15;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];
    uint64_t v17 = [v53 findPreviousEventWithType:@"item-position-jump" matchingPayload:v16];

    if (!v17)
    {
      uint64_t v52 = [v4 cursorFromEvent:v9 untilEvent:0];
      uint64_t v77 = v13;
      v78 = @"item-metadata";
      int v76 = @"requires-mpaf";
      uint64_t v18 = [NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
      v79 = v18;
      id v19 = [NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
      uint64_t v51 = [v52 findPreviousEventWithType:@"item-begin" matchingPayload:v19];

      if (v51)
      {
        id v20 = [v51 payload];
        id v21 = [v20 objectForKeyedSubscript:@"queue-item-id"];
        BOOL v22 = v21 == 0;

        if (v22)
        {
          double v43 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218242;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v4;
            _os_log_impl(&dword_21BB87000, v43, OS_LOG_TYPE_ERROR, "PlayActivityFeedEventConsumer %p: _generateAggregateNoncatalogEndEventForCursor: - could not find queueItemIdentifier - cursor:%{public}@", buf, 0x16u);
          }
          id v27 = 0;
          goto LABEL_21;
        }
        double v74 = @"queue-item-id";
        v23 = [v51 payload];
        int v24 = [v23 objectForKeyedSubscript:@"queue-item-id"];
        v75 = v24;
        BOOL v25 = [NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
        id v26 = [v52 findPreviousEventWithType:@"item-end" matchingPayload:v25];

        id v27 = [v52 cursorUntilEvent:v26];
      }
      else
      {
        id v27 = v52;
      }
      id v72 = @"item-metadata";
      uint64_t v70 = @"requires-mpaf";
      uint64_t v71 = MEMORY[0x263EFFA80];
      double v29 = [NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      int v73 = v29;
      uint64_t v30 = [NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
      BOOL v31 = [v27 countOfPreviousEventsWithType:@"item-begin" matchingPayload:v30] == 0;

      if (v31)
      {
        id v28 = 0;
LABEL_28:

        uint64_t v17 = 0;
        goto LABEL_29;
      }
      double v50 = [v27 findPreviousEventWithType:@"item-resume" matchingPayload:0];
      if (v50)
      {
        id v32 = objc_alloc_init(MEMORY[0x263F89238]);
        [v32 setEventType:0];
        id v33 = [MEMORY[0x263EFF910] date];
        [v32 setEventDate:v33];

        [v32 setItemType:7];
        [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v32 withDeviceInfoFromCursor:v52];
        int v34 = [v50 payload];
        uint64_t v35 = [v34 objectForKeyedSubscript:@"queue-section-id"];

        int v68 = @"queue-section-id";
        uint64_t v69 = v35;
        id v36 = [NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
        id v49 = [v52 findPreviousEventWithType:@"queue-add" matchingPayload:v36];

        id v37 = [v49 payload];
        double v38 = [v37 objectForKeyedSubscript:@"account-id"];

        id v66 = @"rectification-section-id";
        uint64_t v67 = v35;
        char v39 = [NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
        double v48 = [v52 findPreviousEventWithType:@"account-rectification" matchingPayload:v39];

        if (v48)
        {
          int v40 = [v48 payload];
          uint64_t v41 = [v40 objectForKeyedSubscript:@"account-id"];

          int v42 = (void *)v41;
        }
        else
        {
          int v42 = v38;
        }
        -[MPCPlayActivityFeedEventConsumer _updatePAFEvent:withAccountIdentifier:cursor:](self, "_updatePAFEvent:withAccountIdentifier:cursor:", v32, v42);
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        uint64_t v65 = 0;
        uint64_t v59 = 0;
        int v60 = (double *)&v59;
        uint64_t v61 = 0x2020000000;
        uint64_t v62 = 0;
        v63[0] = @"item-position-jump";
        v63[1] = @"item-pause";
        v63[2] = @"item-end";
        double v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:3];
        v54[0] = MEMORY[0x263EF8330];
        v54[1] = 3221225472;
        v54[2] = __82__MPCPlayActivityFeedEventConsumer__generateAggregateNoncatalogEndEventForCursor___block_invoke;
        v54[3] = &unk_2643C1B48;
        v54[4] = self;
        id v55 = v4;
        id v27 = v27;
        id v56 = v27;
        uint64_t v57 = &v59;
        uint64_t v58 = buf;
        [v27 enumeratePreviousEventsWithTypes:v44 usingBlock:v54];

        if (*(double *)(*(void *)&buf[8] + 24) <= 0.0)
        {
          double v43 = v50;
          id v28 = 0;
        }
        else
        {
          [v32 setItemDuration:v60[3]];
          [v32 setItemEndTime:*(double *)(*(void *)&buf[8] + 24)];
          [v32 setHouseholdID:0];
          [v32 setRepeatPlayMode:0];
          [v32 setShufflePlayMode:0];
          [v32 setAutoPlayMode:0];
          long long v45 = [MEMORY[0x263EFFA18] timeZoneWithAbbreviation:@"UTC"];
          [v32 setEventTimeZone:v45];

          [v32 setPrivateListeningEnabled:0];
          id v28 = v32;
          double v43 = v50;
        }

        _Block_object_dispose(&v59, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_27;
      }
      double v43 = 0;
LABEL_21:
      id v28 = 0;
LABEL_27:

      goto LABEL_28;
    }
  }
  id v28 = 0;
LABEL_29:

LABEL_30:

  return v28;
}

void __82__MPCPlayActivityFeedEventConsumer__generateAggregateNoncatalogEndEventForCursor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 payload];
  int v5 = [v4 objectForKeyedSubscript:@"queue-section-id"];

  id v6 = [v3 payload];
  id v7 = [v6 objectForKeyedSubscript:@"queue-item-id"];

  if (v5 && v7)
  {
    int v8 = [*(id *)(a1 + 48) cursorFromEvent:v3 untilEvent:0];
    id v9 = [v3 type];
    int v10 = [v9 isEqualToString:@"item-position-jump"];

    if (!v10) {
      goto LABEL_10;
    }
    v74[0] = @"remote-control-begin";
    v74[1] = @"remote-control-end";
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:2];
    BOOL v12 = [v8 findPreviousEventWithTypes:v11 matchingPayload:0];

    if (v12)
    {
      uint64_t v13 = [v12 type];
      if ([v13 isEqualToString:@"remote-control-end"])
      {

        goto LABEL_30;
      }
      uint64_t v16 = [v3 payload];
      uint64_t v17 = [v16 objectForKeyedSubscript:@"item-jump-user-initiated"];
      int v18 = [v17 BOOLValue];

      if (!v18) {
        goto LABEL_30;
      }
LABEL_10:
      v72[0] = @"queue-section-id";
      v72[1] = @"queue-item-id";
      v73[0] = v5;
      v73[1] = v7;
      id v19 = [NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:2];
      id v20 = [v8 findPreviousEventWithType:@"item-begin" matchingPayload:v19];

      id v21 = [v20 payload];
      BOOL v22 = [v21 objectForKeyedSubscript:@"item-metadata"];
      v23 = [v22 objectForKeyedSubscript:@"item-duration"];
      [v23 doubleValue];
      double v25 = v24;

      unint64_t v26 = 0x263EFF000uLL;
      int v60 = v20;
      id v27 = [*(id *)(a1 + 40) cursorFromEvent:v3 untilEvent:v20];
      v70[0] = @"queue-section-id";
      v70[1] = @"queue-item-id";
      v71[0] = v5;
      v71[1] = v7;
      id v28 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
      uint64_t v29 = [v27 countOfPreviousEventsWithType:@"item-resume" matchingPayload:v28];

      if (v29)
      {
        uint64_t v30 = [v3 type];
        int v31 = [v30 isEqualToString:@"item-end"];

        uint64_t v59 = v27;
        if (!v31) {
          goto LABEL_16;
        }
        *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v25
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                                + 24);
        v68[0] = @"queue-section-id";
        v68[1] = @"queue-item-id";
        v69[0] = v5;
        v69[1] = v7;
        id v32 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2];
        id v33 = [v27 findPreviousEventWithType:@"item-pause" matchingPayload:v32];

        if (v33)
        {
          int v34 = [v27 cursorUntilEvent:v33];
          v66[0] = @"queue-section-id";
          v66[1] = @"queue-item-id";
          v67[0] = v5;
          v67[1] = v7;
          uint64_t v35 = [NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:2];
          id v36 = [v34 findPreviousEventWithType:@"item-resume" matchingPayload:v35];

          if (!v36)
          {
LABEL_28:

            id v27 = v59;
            goto LABEL_29;
          }

          unint64_t v26 = 0x263EFF000;
LABEL_16:
          char v39 = *(void **)(a1 + 32);
          v63[0] = @"item-begin";
          v63[1] = @"item-resume";
          v63[2] = @"item-position-jump";
          int v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:3];
          v61[0] = @"queue-section-id";
          v61[1] = @"queue-item-id";
          v62[0] = v5;
          v62[1] = v7;
          uint64_t v41 = [*(id *)(v26 + 2352) dictionaryWithObjects:v62 forKeys:v61 count:2];
          id v33 = [v39 _findRecentPlaybackStartFromTypes:v40 matchingPayload:v41 cursor:v8];

          if (v33)
          {
            [*(id *)(a1 + 32) _getStartTimeForMostRecentPlaybackStart:v33 withItemBeginEvent:v60 containerBeginEvent:0 cursor:v8];
            double v43 = v42;
            double v44 = [v3 type];
            int v45 = [v44 isEqualToString:@"item-position-jump"];
            long long v46 = @"item-end-position";
            if (v45) {
              long long v46 = @"item-start-position";
            }
            double v47 = v46;

            double v48 = [v3 payload];
            id v49 = [v48 objectForKeyedSubscript:v47];
            [v49 doubleValue];
            double v51 = v50;

            if (v51 >= v25) {
              double v51 = v25;
            }
            uint64_t v52 = [v3 payload];
            unint64_t v53 = [v52 objectForKeyedSubscript:@"item-did-play-to-end"];
            int v54 = [v53 BOOLValue];

            if (v54) {
              double v55 = v25;
            }
            else {
              double v55 = v51;
            }
            double v56 = v55 - v43;
            if (v56 >= 0.0) {
              double v57 = v56;
            }
            else {
              double v57 = 0.0;
            }
            uint64_t v58 = *(void *)(a1 + 64);

            *(double *)(*(void *)(v58 + 8) + 24) = v57 + *(double *)(*(void *)(v58 + 8) + 24);
          }
          goto LABEL_28;
        }
        v64[0] = @"queue-section-id";
        v64[1] = @"queue-item-id";
        v65[0] = v5;
        v65[1] = v7;
        id v37 = [NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:2];
        [v27 findPreviousEventWithType:@"item-resume" matchingPayload:v37];
        v38 = unint64_t v26 = 0x263EFF000uLL;

        if (v38) {
          goto LABEL_16;
        }
      }
LABEL_29:
    }
  }
  else
  {
    int v8 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      uint64_t v76 = v14;
      __int16 v77 = 2114;
      id v78 = v3;
      __int16 v79 = 2114;
      uint64_t v80 = v15;
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_ERROR, "PlayActivityFeedEventConsumer %p: _generateAggregateNoncatalogEndEventForCursor: - could not find queueSectionIdentifier/itemIdentifier event=%{public}@ - cursor:%{public}@", buf, 0x20u);
    }
  }
LABEL_30:
}

- (BOOL)_itemIsPlaceholderFromQueueSectionIdentifier:(id)a3 itemIdentifier:(id)a4 cursor:(id)a5
{
  v16[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(MPCPlayActivityFeedEventConsumer *)self _itemWithinHLSTimedMetadataBeginFromQueueSection:v8 itemIdentifier:v9 cursor:v10])
  {
    v15[0] = @"queue-section-id";
    v15[1] = @"queue-item-id";
    v16[0] = v8;
    v16[1] = v9;
    id v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    BOOL v12 = [v10 findPreviousEventWithType:@"item-timed-metadata-ping" matchingPayload:v11];

    BOOL v13 = v12 == 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_itemWithinHLSTimedMetadataBeginFromQueueSection:(id)a3 itemIdentifier:(id)a4 cursor:(id)a5
{
  v22[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a5;
  id v21 = @"queue-section-id";
  v22[0] = v6;
  id v8 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
  id v9 = [v7 findPreviousEventWithType:@"item-hls-stream-begin" matchingPayload:v8];

  if (v9)
  {
    v20[0] = @"item-hls-timed-metadata-begin";
    v20[1] = @"item-hls-timed-metadata-end";
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    int v18 = @"item-stream-id";
    id v11 = [v9 payload];
    BOOL v12 = [v11 objectForKeyedSubscript:@"item-stream-id"];
    id v19 = v12;
    BOOL v13 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    uint64_t v14 = [v7 findPreviousEventWithTypes:v10 matchingPayload:v13];

    uint64_t v15 = [v14 type];
    char v16 = [v15 isEqualToString:@"item-hls-timed-metadata-begin"];
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (BOOL)_itemIsPlayingFromQueueSectionIdentifier:(id)a3 itemIdentifier:(id)a4 cursor:(id)a5
{
  v30[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29[0] = @"queue-section-id";
  v29[1] = @"queue-item-id";
  v30[0] = v8;
  v30[1] = v9;
  id v11 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  BOOL v12 = [v10 findPreviousEventWithType:@"item-begin" matchingPayload:v11];

  if (v12)
  {
    BOOL v13 = [v10 cursorFromEvent:v12 untilEvent:0];
    if ([(MPCPlayActivityFeedEventConsumer *)self _itemWithinHLSTimedMetadataBeginFromQueueSection:v8 itemIdentifier:v9 cursor:v13])
    {
      id v14 = v10;
      id v27 = @"queue-section-id";
      id v28 = v8;
      uint64_t v15 = NSDictionary;
      char v16 = &v28;
      uint64_t v17 = &v27;
      uint64_t v18 = 1;
    }
    else
    {
      id v14 = [v10 cursorUntilEvent:v12];
      v25[0] = @"queue-section-id";
      v25[1] = @"queue-item-id";
      v26[0] = v8;
      v26[1] = v9;
      uint64_t v15 = NSDictionary;
      char v16 = (id *)v26;
      uint64_t v17 = (__CFString **)v25;
      uint64_t v18 = 2;
    }
    id v20 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:v18];
    id v21 = [v14 findPreviousEventWithType:@"item-pause" matchingPayload:v20];
    if (v21)
    {
      BOOL v22 = [v14 cursorUntilEvent:v21];
      v23 = [v22 findPreviousEventWithType:@"item-resume" matchingPayload:v20];
    }
    else
    {
      v23 = [v14 findPreviousEventWithType:@"item-resume" matchingPayload:v20];
    }
    BOOL v19 = v23 != 0;
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)_handleApplicationTerminationEvent:(id)a3 cursor:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v9 = [v7 findPreviousEventWithType:@"item-begin" matchingPayload:0];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 payload];
    BOOL v12 = [v11 objectForKeyedSubscript:@"queue-section-id"];

    BOOL v13 = [v10 payload];
    id v14 = [v13 objectForKeyedSubscript:@"queue-item-id"];

    if (v14 && v12)
    {
      v33[0] = @"queue-section-id";
      v33[1] = @"queue-item-id";
      v34[0] = v12;
      v34[1] = v14;
      uint64_t v15 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
      char v16 = [v7 findPreviousEventWithType:@"item-resume" matchingPayload:v15];

      if (v16)
      {
        uint64_t v17 = [(MPCPlayActivityFeedEventConsumer *)self _generatePlaybackEndEventFromEvent:v6 withQueueSectionIdentifier:v12 itemIdentifier:v14 cursor:v7];
        if ([v17 itemType] != 4 || (objc_msgSend(v17, "itemDuration"), v18 != 0.0))
        {
          BOOL v19 = [v6 date];
          [v16 date];
          id v20 = v32 = v6;
          [v19 timeIntervalSinceDate:v20];
          double v22 = v21;

          v23 = [v16 payload];
          double v24 = [v23 objectForKeyedSubscript:@"item-start-position"];
          [v24 doubleValue];
          [v17 setItemEndTime:v22 + v25];

          id v6 = v32;
        }
        if (v17)
        {
          [v17 itemStartTime];
          double v27 = v26;
          [v17 itemEndTime];
          [(MPCPlayActivityFeedEventConsumer *)self _sendPlayEndNotificationWithStartTime:v17 endTime:v7 pafEvent:v27 cursor:v28];
          [v8 addObject:v17];
        }
      }
      uint64_t v29 = [(MPCPlayActivityFeedEventConsumer *)self _generateAggregateNoncatalogEndEventForCursor:v7];
      if (v29) {
        [v8 addObject:v29];
      }
      if ([v8 count]) {
        BOOL v30 = [(MPCPlayActivityFeedEventConsumer *)self _finalizePAFEvents:v8];
      }
      else {
        BOOL v30 = 1;
      }
    }
    else
    {
      char v16 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        id v36 = self;
        __int16 v37 = 2114;
        id v38 = v6;
        __int16 v39 = 2114;
        id v40 = v7;
        _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_ERROR, "PlayActivityFeedEventConsumer %p: _handleApplicationTerminationEvent:cursor: - could not find queueSectionIdentifier/itemIdentifier event=%{public}@ - cursor:%{public}@", buf, 0x20u);
      }
      BOOL v30 = 1;
    }
  }
  else
  {
    BOOL v30 = 1;
  }

  return v30;
}

- (id)_generatePlaybackEndEventFromEvent:(id)a3 withQueueSectionIdentifier:(id)a4 itemIdentifier:(id)a5 cursor:(id)a6
{
  v118[2] = *MEMORY[0x263EF8340];
  id v80 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  __int16 v79 = v11;
  if (![(MPCPlayActivityFeedEventConsumer *)self _itemIsPlayingFromQueueSectionIdentifier:v10 itemIdentifier:v11 cursor:v12]|| [(MPCPlayActivityFeedEventConsumer *)self _itemIsPlaceholderFromQueueSectionIdentifier:v10 itemIdentifier:v11 cursor:v12])
  {
    id v13 = 0;
    goto LABEL_39;
  }
  v117[0] = @"queue-section-id";
  v117[1] = @"queue-item-id";
  v118[0] = v10;
  v118[1] = v11;
  id v14 = [NSDictionary dictionaryWithObjects:v118 forKeys:v117 count:2];
  id v78 = [v12 findPreviousEventWithType:@"item-begin" matchingPayload:v14];

  uint64_t v15 = [v78 payload];
  v75 = [v15 objectForKeyedSubscript:@"item-metadata"];

  id v16 = objc_alloc_init(MEMORY[0x263F89238]);
  uint64_t v17 = [v80 date];
  [v16 setEventDate:v17];

  [v16 setEventType:0];
  v115 = @"queue-section-id";
  id v116 = v10;
  double v18 = [NSDictionary dictionaryWithObjects:&v116 forKeys:&v115 count:1];
  __int16 v77 = [v12 findPreviousEventWithType:@"container-begin" matchingPayload:v18];

  BOOL v19 = [v77 payload];
  id v20 = [v80 type];
  [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v16 withItemBeginEvent:v78 containerBeginPayload:v19 cursor:v12 forEventType:v20];

  uint64_t v113 = @"queue-section-id";
  id v114 = v10;
  double v21 = [NSDictionary dictionaryWithObjects:&v114 forKeys:&v113 count:1];
  double v74 = [v12 findPreviousEventWithType:@"queue-add" matchingPayload:v21];

  [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v16 withQueueAddEvent:v74 queueSectionIdentifier:v10 cursor:v12];
  [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v16 withDeviceInfoFromCursor:v12];
  v112[0] = @"item-begin";
  v112[1] = @"item-resume";
  v112[2] = @"item-position-jump";
  double v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v112 count:3];
  v110[0] = @"queue-section-id";
  v110[1] = @"queue-item-id";
  v111[0] = v10;
  v111[1] = v11;
  v23 = [NSDictionary dictionaryWithObjects:v111 forKeys:v110 count:2];
  uint64_t v76 = [(MPCPlayActivityFeedEventConsumer *)self _findRecentPlaybackStartFromTypes:v22 matchingPayload:v23 cursor:v12];

  [(MPCPlayActivityFeedEventConsumer *)self _getStartTimeForMostRecentPlaybackStart:v76 withItemBeginEvent:v78 containerBeginEvent:v77 cursor:v12];
  double v25 = v24;
  double v26 = [v80 payload];
  double v27 = [v26 objectForKeyedSubscript:@"item-end-position"];
  [v27 doubleValue];
  double v29 = v28;

  [v16 setItemStartTime:v25];
  [v16 setItemEndTime:v29];
  BOOL v30 = [v80 type];
  int v31 = [v30 isEqualToString:@"application-termination"];

  if (v31)
  {
    [v16 setEndReasonType:15];
    goto LABEL_28;
  }
  if ([v16 itemType] == 5)
  {
    [v16 setEndReasonType:0];
    goto LABEL_28;
  }
  id v32 = [v12 cursorUntilEvent:v76];
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x2020000000;
  LOBYTE(v85) = 0;
  uint64_t v97 = 0;
  v98 = &v97;
  uint64_t v99 = 0x2020000000;
  char v100 = 0;
  uint64_t v93 = 0;
  v94 = &v93;
  uint64_t v95 = 0x2020000000;
  char v96 = 0;
  uint64_t v89 = 0;
  v90 = &v89;
  uint64_t v91 = 0x2020000000;
  char v92 = 0;
  v88[0] = MEMORY[0x263EF8330];
  v88[1] = 3221225472;
  void v88[2] = __120__MPCPlayActivityFeedEventConsumer__generatePlaybackEndEventFromEvent_withQueueSectionIdentifier_itemIdentifier_cursor___block_invoke;
  v88[3] = &unk_2643C64F8;
  v88[4] = &v82;
  v88[5] = &v97;
  v88[6] = &v93;
  v88[7] = &v89;
  [v32 enumeratePreviousEventsWithType:@"remote-control-begin" usingBlock:v88];
  if (*((unsigned char *)v83 + 24))
  {
    uint64_t v33 = 3;
  }
  else if (*((unsigned char *)v98 + 24))
  {
    uint64_t v33 = 2;
  }
  else if (*((unsigned char *)v94 + 24))
  {
    uint64_t v33 = 4;
  }
  else
  {
    int v34 = [v80 payload];
    uint64_t v35 = [v34 objectForKeyedSubscript:@"item-did-play-to-end"];
    int v36 = [v35 BOOLValue];

    if (!v36)
    {
      id v40 = [v32 findPreviousEventWithType:@"queue-load-begin" matchingPayload:0];
      if (v40) {
        BOOL v41 = 0;
      }
      else {
        BOOL v41 = *((unsigned char *)v90 + 24) == 0;
      }
      if (v41) {
        uint64_t v42 = 1;
      }
      else {
        uint64_t v42 = 4;
      }
      [v16 setEndReasonType:v42];

      goto LABEL_27;
    }
    __int16 v37 = [v75 objectForKeyedSubscript:@"item-end-boundary"];
    BOOL v38 = v37 == 0;

    if (v38) {
      [v75 objectForKeyedSubscript:@"item-duration"];
    }
    else {
    __int16 v39 = [v75 objectForKeyedSubscript:@"item-end-boundary"];
    }
    [v39 doubleValue];
    objc_msgSend(v16, "setItemEndTime:");

    uint64_t v33 = 11;
  }
  [v16 setEndReasonType:v33];
LABEL_27:
  _Block_object_dispose(&v89, 8);
  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(&v97, 8);
  _Block_object_dispose(&v82, 8);

LABEL_28:
  double v43 = [v78 payload];
  double v44 = [v43 objectForKeyedSubscript:@"item-metadata"];
  int v45 = [v44 objectForKeyedSubscript:@"item-end-boundary"];
  long long v46 = v45;
  if (v45)
  {
    [v45 doubleValue];
    double v48 = v47;
  }
  else
  {
    id v49 = [v78 payload];
    double v50 = [v49 objectForKeyedSubscript:@"item-metadata"];
    double v51 = [v50 objectForKeyedSubscript:@"item-duration"];
    [v51 doubleValue];
    double v48 = v52;
  }
  [(MPCPlayActivityFeedEventConsumer *)self _clampTimeValuesForPAFEvent:v16 withDuration:v48];
  v108[0] = @"queue-section-id";
  v108[1] = @"queue-item-id";
  v109[0] = v10;
  v109[1] = v79;
  unint64_t v53 = [NSDictionary dictionaryWithObjects:v109 forKeys:v108 count:2];
  int v73 = [v12 findPreviousEventWithType:@"item-timed-metadata-ping" matchingPayload:v53];

  int v54 = [v73 payload];
  uint64_t v55 = [v54 objectForKeyedSubscript:@"item-timed-metadata"];
  [v16 setTimedMetadata:v55];

  double v56 = [v75 objectForKeyedSubscript:@"requires-mpaf"];
  LOBYTE(v55) = [v56 BOOLValue];

  if (v55)
  {
    uint64_t v82 = 0;
    v83 = &v82;
    uint64_t v84 = 0x3032000000;
    v85 = __Block_byref_object_copy__14795;
    v86 = __Block_byref_object_dispose__14796;
    id v87 = 0;
    v106[0] = @"queue-section-id";
    v106[1] = @"queue-item-id";
    v107[0] = v10;
    v107[1] = v79;
    double v57 = [NSDictionary dictionaryWithObjects:v107 forKeys:v106 count:2];
    v81[0] = MEMORY[0x263EF8330];
    v81[1] = 3221225472;
    void v81[2] = __120__MPCPlayActivityFeedEventConsumer__generatePlaybackEndEventFromEvent_withQueueSectionIdentifier_itemIdentifier_cursor___block_invoke_2;
    v81[3] = &unk_2643C62C8;
    v81[4] = &v82;
    [v12 enumeratePreviousEventsWithType:@"audio-format-changed" matchingPayload:v57 usingBlock:v81];

    [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v16 withAudioChangeEvent:v83[5]];
    [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v16 withSharedListeningInfoFromCursor:v12];
    [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v16 withVocalAttenuationInfoForEndEvent:v80 cursor:v12];
    uint64_t v104 = @"queue-section-id";
    id v105 = v10;
    uint64_t v58 = [NSDictionary dictionaryWithObjects:&v105 forKeys:&v104 count:1];
    id v72 = [v12 findPreviousEventWithType:@"item-hls-stream-begin" matchingPayload:v58];

    uint64_t v59 = [v72 payload];
    int v60 = [v59 objectForKeyedSubscript:@"container-indeterminate-duration"];
    if ([v60 BOOLValue])
    {
    }
    else
    {
      uint64_t v61 = [v77 payload];
      uint64_t v62 = [v61 objectForKeyedSubscript:@"container-metadata"];
      unsigned int v63 = [v62 objectForKeyedSubscript:@"container-radio-subtype"];
      BOOL v64 = [v63 integerValue] == 2;

      if (!v64)
      {
LABEL_37:
        id v13 = v16;

        _Block_object_dispose(&v82, 8);
        goto LABEL_38;
      }
    }
    v103[0] = @"item-resume";
    v103[1] = @"item-timed-metadata-ping";
    uint64_t v65 = [MEMORY[0x263EFF8C0] arrayWithObjects:v103 count:2];
    id v101 = @"queue-section-id";
    id v102 = v10;
    id v66 = [NSDictionary dictionaryWithObjects:&v102 forKeys:&v101 count:1];
    uint64_t v67 = [v12 findPreviousEventWithTypes:v65 matchingPayload:v66];

    [v16 setItemStartTime:0.0];
    int v68 = [v12 cursorFromEvent:v80 untilEvent:v67];
    [(MPCPlayActivityFeedEventConsumer *)self _getPlaybackDurationForHLSStreamFromStartEvent:v67 toEndEvent:v80 withLimitedCursor:v68];
    double v70 = v69;

    [v16 setItemEndTime:v70];
    [v16 setItemDuration:0.0];

    goto LABEL_37;
  }
  [(MPCPlayActivityFeedEventConsumer *)self _sendPlayEndNotificationWithStartTime:v16 endTime:v12 pafEvent:v25 cursor:v29];
  id v13 = 0;
LABEL_38:

LABEL_39:

  return v13;
}

void __120__MPCPlayActivityFeedEventConsumer__generatePlaybackEndEventFromEvent_withQueueSectionIdentifier_itemIdentifier_cursor___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  int v5 = [a2 payload];
  id v6 = [v5 objectForKeyedSubscript:@"remote-control-type"];
  int v7 = [v6 unsignedIntValue];

  if (v7 > 121)
  {
    if (v7 == 122)
    {
      uint64_t v8 = a1 + 56;
    }
    else
    {
      if (v7 != 131) {
        return;
      }
      uint64_t v8 = a1 + 48;
    }
  }
  else if (v7 == 4)
  {
    uint64_t v8 = a1 + 32;
  }
  else
  {
    if (v7 != 5) {
      return;
    }
    uint64_t v8 = a1 + 40;
  }
  *(unsigned char *)(*(void *)(*(void *)v8 + 8) + 24) = 1;
  *a3 = 1;
}

void __120__MPCPlayActivityFeedEventConsumer__generatePlaybackEndEventFromEvent_withQueueSectionIdentifier_itemIdentifier_cursor___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  id v6 = [v9 payload];
  int v7 = [v6 objectForKeyedSubscript:@"item-audio-format-metadata"];

  uint64_t v8 = [v7 objectForKeyedSubscript:@"active-format"];
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (BOOL)_handleItemEndEvent:(id)a3 cursor:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 payload];
  id v9 = [v8 objectForKeyedSubscript:@"queue-section-id"];

  id v10 = [v6 payload];
  id v11 = [v10 objectForKeyedSubscript:@"queue-item-id"];

  if (!v11 || !v9)
  {
    id v13 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      double v28 = self;
      __int16 v29 = 2114;
      id v30 = v6;
      __int16 v31 = 2114;
      id v32 = v7;
      _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_ERROR, "PlayActivityFeedEventConsumer %p: _handleItemEndEvent:cursor: - could not find queueSectionIdentifier/itemIdentifier event=%{public}@ - cursor:%{public}@", buf, 0x20u);
    }
    goto LABEL_8;
  }
  id v12 = [(MPCPlayActivityFeedEventConsumer *)self _generatePlaybackEndEventFromEvent:v6 withQueueSectionIdentifier:v9 itemIdentifier:v11 cursor:v7];
  id v13 = v12;
  if (!v12)
  {
LABEL_8:
    BOOL v22 = 1;
    goto LABEL_11;
  }
  [v12 itemStartTime];
  double v15 = v14;
  [v13 itemEndTime];
  [(MPCPlayActivityFeedEventConsumer *)self _sendPlayEndNotificationWithStartTime:v13 endTime:v7 pafEvent:v15 cursor:v16];
  uint64_t v17 = [(MPCPlayActivityFeedEventConsumer *)self _generateAggregateNoncatalogEndEventForCursor:v7];
  double v18 = (void *)v17;
  if (v17)
  {
    v26[0] = v17;
    v26[1] = v13;
    BOOL v19 = (void *)MEMORY[0x263EFF8C0];
    id v20 = (NSObject **)v26;
    uint64_t v21 = 2;
  }
  else
  {
    double v25 = v13;
    BOOL v19 = (void *)MEMORY[0x263EFF8C0];
    id v20 = &v25;
    uint64_t v21 = 1;
  }
  v23 = [v19 arrayWithObjects:v20 count:v21];
  BOOL v22 = [(MPCPlayActivityFeedEventConsumer *)self _finalizePAFEvents:v23];

LABEL_11:
  return v22;
}

- (BOOL)_handleItemPauseEvent:(id)a3 cursor:(id)a4
{
  v112[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (uint64_t (*)(uint64_t, uint64_t))a4;
  uint64_t v8 = [v6 payload];
  id v9 = [v8 objectForKeyedSubscript:@"queue-section-id"];

  id v10 = [v6 payload];
  id v11 = [v10 objectForKeyedSubscript:@"queue-item-id"];

  if (!v11 || !v9)
  {
    id v13 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2114;
      char v92 = v7;
      _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_ERROR, "PlayActivityFeedEventConsumer %p: _handleItemPauseEvent:cursor: - could not find queueSectionIdentifier/itemIdentifier event=%{public}@ - cursor:%{public}@", buf, 0x20u);
    }
    BOOL v33 = 1;
    goto LABEL_32;
  }
  if ([(MPCPlayActivityFeedEventConsumer *)self _itemIsPlayingFromQueueSectionIdentifier:v9 itemIdentifier:v11 cursor:v7])
  {
    v111[0] = @"queue-section-id";
    v111[1] = @"queue-item-id";
    v112[0] = v9;
    v112[1] = v11;
    id v12 = [NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:2];
    id v13 = [v7 findPreviousEventWithType:@"item-begin" matchingPayload:v12];

    v110[0] = @"item-begin";
    v110[1] = @"item-resume";
    void v110[2] = @"item-position-jump";
    double v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v110 count:3];
    v108[0] = @"queue-section-id";
    v108[1] = @"queue-item-id";
    v109[0] = v9;
    v109[1] = v11;
    double v15 = [NSDictionary dictionaryWithObjects:v109 forKeys:v108 count:2];
    uint64_t v76 = [(MPCPlayActivityFeedEventConsumer *)self _findRecentPlaybackStartFromTypes:v14 matchingPayload:v15 cursor:v7];

    uint64_t v106 = @"queue-section-id";
    v107 = v9;
    double v16 = [NSDictionary dictionaryWithObjects:&v107 forKeys:&v106 count:1];
    __int16 v77 = [v7 findPreviousEventWithType:@"container-begin" matchingPayload:v16];

    [(MPCPlayActivityFeedEventConsumer *)self _getStartTimeForMostRecentPlaybackStart:v76 withItemBeginEvent:v13 containerBeginEvent:v77 cursor:v7];
    double v18 = v17;
    BOOL v19 = [v6 payload];
    id v20 = [v19 objectForKeyedSubscript:@"item-end-position"];
    [v20 doubleValue];
    double v22 = v21;

    v23 = [v13 payload];
    double v24 = [v23 objectForKeyedSubscript:@"item-metadata"];
    double v25 = [v24 objectForKeyedSubscript:@"requires-mpaf"];
    char v26 = [v25 BOOLValue];

    if ((v26 & 1) == 0)
    {
      [(MPCPlayActivityFeedEventConsumer *)self _sendPlayEndNotificationWithStartTime:0 endTime:v7 pafEvent:v18 cursor:v22];
      BOOL v33 = 1;
LABEL_31:

LABEL_32:
      goto LABEL_33;
    }
    id v78 = objc_alloc_init(MEMORY[0x263F89238]);
    double v27 = [v6 date];
    [v78 setEventDate:v27];

    [v78 setEventType:0];
    double v28 = [v77 payload];
    __int16 v29 = [v6 type];
    [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v78 withItemBeginEvent:v13 containerBeginPayload:v28 cursor:v7 forEventType:v29];

    int v73 = [v7 cursorUntilEvent:v13];
    if ([v78 itemType] != 4)
    {
      v104[0] = @"queue-section-id";
      v104[1] = @"queue-item-id";
      v105[0] = v9;
      v105[1] = v11;
      id v30 = [NSDictionary dictionaryWithObjects:v105 forKeys:v104 count:2];
      BOOL v31 = [v73 countOfPreviousEventsWithType:@"item-resume" matchingPayload:v30] == 0;

      if (v31)
      {
        BOOL v33 = 1;
LABEL_30:

        goto LABEL_31;
      }
    }
    id v102 = @"queue-section-id";
    id v103 = v9;
    id v32 = [NSDictionary dictionaryWithObjects:&v103 forKeys:&v102 count:1];
    id v72 = [v7 findPreviousEventWithType:@"queue-add" matchingPayload:v32];

    [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v78 withQueueAddEvent:v72 queueSectionIdentifier:v9 cursor:v7];
    [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v78 withDeviceInfoFromCursor:v7];
    [v78 setItemStartTime:v18];
    [v78 setItemEndTime:v22];
    double v74 = [v7 cursorUntilEvent:v76];
    uint64_t v83 = 0;
    uint64_t v84 = &v83;
    uint64_t v85 = 0x2020000000;
    char v86 = 0;
    v80[0] = MEMORY[0x263EF8330];
    v80[1] = 3221225472;
    void v80[2] = __65__MPCPlayActivityFeedEventConsumer__handleItemPauseEvent_cursor___block_invoke;
    v80[3] = &unk_2643C1B70;
    uint64_t v82 = &v83;
    v75 = v7;
    uint64_t v81 = v75;
    [v74 enumeratePreviousEventsWithType:@"remote-control-begin" usingBlock:v80];
    if (*((unsigned char *)v84 + 24))
    {
      [v78 setEndReasonType:5];
    }
    else
    {
      int v34 = [v74 findPreviousEventWithType:@"interrupt-begin" matchingPayload:0];
      if (v34) {
        uint64_t v35 = 6;
      }
      else {
        uint64_t v35 = 1;
      }
      [v78 setEndReasonType:v35];
    }
    int v36 = [v13 payload];
    __int16 v37 = [v36 objectForKeyedSubscript:@"item-metadata"];
    BOOL v38 = [v37 objectForKeyedSubscript:@"item-end-boundary"];
    __int16 v39 = v38;
    if (!v38)
    {
      double v70 = [v13 payload];
      int v68 = [v70 objectForKeyedSubscript:@"item-metadata"];
      __int16 v39 = [v68 objectForKeyedSubscript:@"item-duration"];
    }
    [v39 doubleValue];
    double v41 = v40;
    if (!v38)
    {
    }
    [(MPCPlayActivityFeedEventConsumer *)self _clampTimeValuesForPAFEvent:v78 withDuration:v41];
    char v100 = @"queue-section-id";
    id v101 = v9;
    uint64_t v42 = [NSDictionary dictionaryWithObjects:&v101 forKeys:&v100 count:1];
    uint64_t v71 = [v75 findPreviousEventWithType:@"item-timed-metadata-ping" matchingPayload:v42];

    double v43 = [v71 payload];
    double v44 = [v43 objectForKeyedSubscript:@"item-timed-metadata"];
    [v78 setTimedMetadata:v44];

    v98 = @"queue-section-id";
    uint64_t v99 = v9;
    int v45 = [NSDictionary dictionaryWithObjects:&v99 forKeys:&v98 count:1];
    double v69 = [v75 findPreviousEventWithType:@"item-hls-stream-begin" matchingPayload:v45];

    long long v46 = [v69 payload];
    double v47 = [v46 objectForKeyedSubscript:@"container-indeterminate-duration"];
    if ([v47 BOOLValue])
    {
    }
    else
    {
      uint64_t v67 = [v77 payload];
      double v48 = [v67 objectForKeyedSubscript:@"container-metadata"];
      id v49 = [v48 objectForKeyedSubscript:@"container-radio-subtype"];
      BOOL v66 = [v49 integerValue] == 2;

      if (!v66)
      {
LABEL_26:
        [v78 itemStartTime];
        double v57 = v56;
        [v78 itemEndTime];
        [(MPCPlayActivityFeedEventConsumer *)self _sendPlayEndNotificationWithStartTime:v78 endTime:v75 pafEvent:v57 cursor:v58];
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        char v92 = __Block_byref_object_copy__14795;
        uint64_t v93 = __Block_byref_object_dispose__14796;
        id v94 = 0;
        v89[0] = @"queue-section-id";
        v89[1] = @"queue-item-id";
        v90[0] = v9;
        v90[1] = v11;
        uint64_t v59 = [NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:2];
        v79[0] = MEMORY[0x263EF8330];
        v79[1] = 3221225472;
        v79[2] = __65__MPCPlayActivityFeedEventConsumer__handleItemPauseEvent_cursor___block_invoke_2;
        v79[3] = &unk_2643C62C8;
        v79[4] = buf;
        [v75 enumeratePreviousEventsWithType:@"audio-format-changed" matchingPayload:v59 usingBlock:v79];

        [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v78 withAudioChangeEvent:*(void *)(*(void *)&buf[8] + 40)];
        [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v78 withSharedListeningInfoFromCursor:v75];
        [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v78 withVocalAttenuationInfoForEndEvent:v6 cursor:v75];
        uint64_t v60 = [(MPCPlayActivityFeedEventConsumer *)self _generateAggregateNoncatalogEndEventForCursor:v75];
        uint64_t v61 = (void *)v60;
        if (v60)
        {
          v88[0] = v60;
          v88[1] = v78;
          uint64_t v62 = (id *)v88;
          uint64_t v63 = 2;
        }
        else
        {
          id v87 = v78;
          uint64_t v62 = &v87;
          uint64_t v63 = 1;
        }
        BOOL v64 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:v63];
        BOOL v33 = [(MPCPlayActivityFeedEventConsumer *)self _finalizePAFEvents:v64];

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(&v83, 8);

        goto LABEL_30;
      }
    }
    v97[0] = @"item-resume";
    v97[1] = @"item-timed-metadata-ping";
    double v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v97 count:2];
    uint64_t v95 = @"queue-section-id";
    char v96 = v9;
    double v51 = [NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];
    double v52 = [v75 findPreviousEventWithTypes:v50 matchingPayload:v51];

    [v78 setItemStartTime:0.0];
    unint64_t v53 = [v75 cursorFromEvent:v6 untilEvent:v52];
    [(MPCPlayActivityFeedEventConsumer *)self _getPlaybackDurationForHLSStreamFromStartEvent:v52 toEndEvent:v6 withLimitedCursor:v53];
    double v55 = v54;

    [v78 setItemEndTime:v55];
    [v78 setItemDuration:0.0];

    goto LABEL_26;
  }
  BOOL v33 = 1;
LABEL_33:

  return v33;
}

void __65__MPCPlayActivityFeedEventConsumer__handleItemPauseEvent_cursor___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  int v5 = [a2 payload];
  id v6 = [v5 objectForKeyedSubscript:@"remote-control-type"];
  int v7 = [v6 unsignedIntValue];

  if ((v7 - 1) <= 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

void __65__MPCPlayActivityFeedEventConsumer__handleItemPauseEvent_cursor___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  id v6 = [v9 payload];
  int v7 = [v6 objectForKeyedSubscript:@"item-audio-format-metadata"];

  uint64_t v8 = [v7 objectForKeyedSubscript:@"active-format"];
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (BOOL)_handleItemPositionJumpEvent:(id)a3 cursor:(id)a4
{
  void v106[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v106[0] = @"remote-control-begin";
  v106[1] = @"remote-control-end";
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v106 count:2];
  id v9 = [v7 findPreviousEventWithTypes:v8 matchingPayload:0];

  if (v9)
  {
    id v10 = [v9 type];
    if ([v10 isEqualToString:@"remote-control-end"])
    {
      BOOL v11 = 1;
LABEL_30:

      goto LABEL_31;
    }
    id v12 = [v6 payload];
    id v13 = [v12 objectForKeyedSubscript:@"item-jump-user-initiated"];
    int v14 = [v13 BOOLValue];

    if (v14)
    {
      double v15 = [v6 payload];
      id v10 = [v15 objectForKeyedSubscript:@"queue-section-id"];

      double v16 = [v6 payload];
      uint64_t v83 = [v16 objectForKeyedSubscript:@"queue-item-id"];

      if (!v83 || !v10)
      {
        double v18 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218498;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v6;
          *(_WORD *)&buf[22] = 2114;
          v90 = (uint64_t (*)(uint64_t, uint64_t))v7;
          _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_ERROR, "PlayActivityFeedEventConsumer %p: _handleItemPositionJumpEvent:cursor: - could not find queueSectionIdentifier/itemIdentifier event=%{public}@ - cursor:%{public}@", buf, 0x20u);
        }
        BOOL v11 = 1;
        goto LABEL_29;
      }
      v104[0] = @"queue-section-id";
      v104[1] = @"queue-item-id";
      v105[0] = v10;
      v105[1] = v83;
      double v17 = [NSDictionary dictionaryWithObjects:v105 forKeys:v104 count:2];
      double v18 = [v7 findPreviousEventWithType:@"item-begin" matchingPayload:v17];

      v103[0] = @"item-begin";
      v103[1] = @"item-resume";
      void v103[2] = @"item-position-jump";
      v103[3] = @"item-pause";
      BOOL v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v103 count:4];
      v101[0] = @"queue-section-id";
      v101[1] = @"queue-item-id";
      v102[0] = v10;
      v102[1] = v83;
      id v20 = [NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:2];
      __int16 v79 = [(MPCPlayActivityFeedEventConsumer *)self _findRecentPlaybackStartFromTypes:v19 matchingPayload:v20 cursor:v7];

      uint64_t v99 = @"queue-section-id";
      char v100 = v10;
      double v21 = [NSDictionary dictionaryWithObjects:&v100 forKeys:&v99 count:1];
      id v80 = [v7 findPreviousEventWithType:@"container-begin" matchingPayload:v21];

      [(MPCPlayActivityFeedEventConsumer *)self _getStartTimeForMostRecentPlaybackStart:v79 withItemBeginEvent:v18 containerBeginEvent:v80 cursor:v7];
      double v23 = v22;
      double v24 = [v6 payload];
      double v25 = [v24 objectForKeyedSubscript:@"item-start-position"];
      [v25 doubleValue];
      double v27 = v26;

      double v28 = [v18 payload];
      __int16 v29 = [v28 objectForKeyedSubscript:@"item-metadata"];
      id v30 = [v29 objectForKeyedSubscript:@"requires-mpaf"];
      char v31 = [v30 BOOLValue];

      if ((v31 & 1) == 0)
      {
        [(MPCPlayActivityFeedEventConsumer *)self _sendPlayEndNotificationWithStartTime:0 endTime:v7 pafEvent:v23 cursor:v27];
        BOOL v11 = 1;
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
      uint64_t v97 = @"queue-section-id";
      v98 = v10;
      id v32 = [NSDictionary dictionaryWithObjects:&v98 forKeys:&v97 count:1];
      id v78 = [v7 findPreviousEventWithType:@"item-hls-stream-begin" matchingPayload:v32];

      id v82 = [v78 payload];
      id v81 = [v82 objectForKeyedSubscript:@"container-indeterminate-duration"];
      if ([v81 BOOLValue])
      {
        BOOL v11 = 1;
      }
      else
      {
        BOOL v33 = [v80 payload];
        int v34 = [v33 objectForKeyedSubscript:@"container-metadata"];
        uint64_t v35 = [v34 objectForKeyedSubscript:@"container-radio-subtype"];
        BOOL v36 = [v35 integerValue] == 2;

        if (v36)
        {
          BOOL v11 = 1;
LABEL_27:

          goto LABEL_28;
        }
        id v82 = objc_alloc_init(MEMORY[0x263F89238]);
        __int16 v37 = [v6 date];
        [v82 setEventDate:v37];

        [v82 setEventType:0];
        [v82 setEndReasonType:9];
        id v81 = objc_alloc_init(MEMORY[0x263F89238]);
        BOOL v38 = [v6 date];
        [v81 setEventDate:v38];

        [v81 setEventType:0];
        [v81 setEndReasonType:10];
        __int16 v39 = [v80 payload];
        double v40 = [v6 type];
        [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v82 withItemBeginEvent:v18 containerBeginPayload:v39 cursor:v7 forEventType:v40];

        double v41 = [v80 payload];
        uint64_t v42 = [v6 type];
        [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v81 withItemBeginEvent:v18 containerBeginPayload:v41 cursor:v7 forEventType:v42];

        uint64_t v95 = @"queue-section-id";
        char v96 = v10;
        double v43 = [NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];
        double v44 = [v7 findPreviousEventWithType:@"queue-add" matchingPayload:v43];

        [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v82 withQueueAddEvent:v44 queueSectionIdentifier:v10 cursor:v7];
        [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v81 withQueueAddEvent:v44 queueSectionIdentifier:v10 cursor:v7];
        [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v82 withDeviceInfoFromCursor:v7];
        [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v81 withDeviceInfoFromCursor:v7];
        [v82 setItemStartTime:v23];
        int v45 = [v6 payload];
        long long v46 = [v45 objectForKeyedSubscript:@"item-start-position"];
        [v46 doubleValue];
        objc_msgSend(v82, "setItemEndTime:");

        double v47 = [v6 payload];
        double v48 = [v47 objectForKeyedSubscript:@"item-start-position"];
        [v48 doubleValue];
        objc_msgSend(v81, "setItemStartTime:");

        id v49 = [v6 payload];
        double v50 = [v49 objectForKeyedSubscript:@"item-end-position"];
        [v50 doubleValue];
        double v52 = v51;

        [v81 setItemEndTime:v52];
        uint64_t v93 = @"queue-section-id";
        id v94 = v10;
        unint64_t v53 = [NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];
        __int16 v77 = [v7 findPreviousEventWithType:@"item-timed-metadata-ping" matchingPayload:v53];

        if (v77)
        {
          double v54 = [v77 payload];
          double v55 = [v54 objectForKeyedSubscript:@"item-timed-metadata"];
          [v82 setTimedMetadata:v55];

          double v56 = [v77 payload];
          double v57 = [v56 objectForKeyedSubscript:@"item-timed-metadata"];
          [v81 setTimedMetadata:v57];
        }
        uint64_t v76 = [v18 payload];
        v75 = [v76 objectForKeyedSubscript:@"item-metadata"];
        double v58 = [v75 objectForKeyedSubscript:@"item-end-boundary"];
        uint64_t v59 = v58;
        if (v58)
        {
          [v58 doubleValue];
          double v61 = v60;
        }
        else
        {
          double v74 = [v18 payload];
          uint64_t v62 = [v74 objectForKeyedSubscript:@"item-metadata"];
          uint64_t v63 = [v62 objectForKeyedSubscript:@"item-duration"];
          [v63 doubleValue];
          double v61 = v64;
        }
        [(MPCPlayActivityFeedEventConsumer *)self _clampTimeValuesForPAFEvent:v82 withDuration:v61];
        [(MPCPlayActivityFeedEventConsumer *)self _clampTimeValuesForPAFEvent:v81 withDuration:v61];
        [v82 itemStartTime];
        double v66 = v65;
        [v82 itemEndTime];
        [(MPCPlayActivityFeedEventConsumer *)self _sendPlayEndNotificationWithStartTime:v82 endTime:v7 pafEvent:v66 cursor:v67];
        *(void *)buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v90 = __Block_byref_object_copy__14795;
        uint64_t v91 = __Block_byref_object_dispose__14796;
        id v92 = 0;
        v87[0] = @"queue-section-id";
        v87[1] = @"queue-item-id";
        v88[0] = v10;
        v88[1] = v83;
        int v68 = [NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:2];
        v84[0] = MEMORY[0x263EF8330];
        v84[1] = 3221225472;
        v84[2] = __72__MPCPlayActivityFeedEventConsumer__handleItemPositionJumpEvent_cursor___block_invoke;
        v84[3] = &unk_2643C62C8;
        v84[4] = buf;
        [v7 enumeratePreviousEventsWithType:@"audio-format-changed" matchingPayload:v68 usingBlock:v84];

        [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v82 withAudioChangeEvent:*(void *)(*(void *)&buf[8] + 40)];
        [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v81 withAudioChangeEvent:*(void *)(*(void *)&buf[8] + 40)];
        [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v82 withSharedListeningInfoFromCursor:v7];
        [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v81 withSharedListeningInfoFromCursor:v7];
        [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v82 withVocalAttenuationInfoForEndEvent:v6 cursor:v7];
        [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v81 withVocalAttenuationInfoForEndEvent:v6 cursor:v7];
        [v81 setVocalAttenuationDuration:0.0];
        uint64_t v69 = [(MPCPlayActivityFeedEventConsumer *)self _generateAggregateNoncatalogEndEventForCursor:v7];
        double v70 = (void *)v69;
        if (v69)
        {
          v85[1] = v69;
          v85[2] = v82;
          uint64_t v71 = &v86;
        }
        else
        {
          v84[5] = v82;
          uint64_t v71 = v85;
        }
        *uint64_t v71 = (uint64_t)v81;
        id v72 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:");
        BOOL v11 = [(MPCPlayActivityFeedEventConsumer *)self _finalizePAFEvents:v72];

        _Block_object_dispose(buf, 8);
      }

      goto LABEL_27;
    }
  }
  BOOL v11 = 1;
LABEL_31:

  return v11;
}

void __72__MPCPlayActivityFeedEventConsumer__handleItemPositionJumpEvent_cursor___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  id v6 = [v9 payload];
  id v7 = [v6 objectForKeyedSubscript:@"item-audio-format-metadata"];

  uint64_t v8 = [v7 objectForKeyedSubscript:@"active-format"];
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (BOOL)_handleItemResumeEvent:(id)a3 cursor:(id)a4
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 payload];
  id v9 = [v8 objectForKeyedSubscript:@"queue-section-id"];

  __int16 v77 = v6;
  id v10 = [v6 payload];
  BOOL v11 = [v10 objectForKeyedSubscript:@"queue-item-id"];

  if (v11 && v9)
  {
    uint64_t v91 = @"queue-section-id";
    id v92 = v9;
    id v12 = [NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
    uint64_t v75 = [v7 findPreviousEventWithType:@"queue-add" matchingPayload:v12];

    uint64_t v89 = @"queue-section-id";
    v90 = v9;
    id v13 = [NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
    uint64_t v76 = [v7 findPreviousEventWithType:@"item-hls-stream-begin" matchingPayload:v13];

    id v14 = objc_alloc_init(MEMORY[0x263F89238]);
    double v15 = [v6 date];
    [v14 setEventDate:v15];

    [v14 setEventType:1];
    [v14 setEndReasonType:0];
    id v72 = [v7 findPreviousEventWithType:@"item-end" matchingPayload:0];
    double v16 = objc_msgSend(v7, "cursorUntilEvent:");
    v87[0] = @"queue-section-id";
    v87[1] = @"queue-item-id";
    v88[0] = v9;
    v88[1] = v11;
    double v17 = [NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:2];
    uint64_t v74 = [v7 findPreviousEventWithType:@"item-begin" matchingPayload:v17];

    v85[0] = @"queue-section-id";
    v85[1] = @"queue-item-id";
    v86[0] = v9;
    v86[1] = v11;
    uint64_t v69 = v11;
    double v18 = [NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:2];
    uint64_t v19 = [v16 countOfPreviousEventsWithType:@"item-resume" matchingPayload:v18];

    uint64_t v83 = @"remote-control-type";
    uint64_t v84 = &unk_26CC18FC0;
    id v20 = [NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
    int v68 = v16;
    int v73 = [v16 findPreviousEventWithType:@"remote-control-end" matchingPayload:v20];

    uint64_t v71 = [v7 findPreviousEventWithType:@"session-begin" matchingPayload:0];
    double v21 = objc_msgSend(v7, "cursorUntilEvent:");
    double v22 = [v21 findPreviousEventWithType:@"item-resume" matchingPayload:0];
    double v70 = v21;
    if (v22)
    {
      BOOL v23 = 0;
    }
    else
    {
      double v26 = [v21 findPreviousEventWithType:@"session-restore-begin" matchingPayload:0];
      BOOL v23 = v26 != 0;
    }
    if (!v19 && !v23 && !v73)
    {
      double v27 = [v6 payload];
      double v28 = [v27 objectForKeyedSubscript:@"queue-section-id"];
      __int16 v29 = [v72 payload];
      id v30 = [v29 objectForKeyedSubscript:@"queue-section-id"];
      char v31 = [v28 isEqualToString:v30];

      if ((v31 & 1) == 0) {
        [v14 setReasonHintType:1];
      }
    }
    id v81 = @"queue-section-id";
    id v82 = v9;
    id v32 = [NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
    BOOL v33 = [v7 findPreviousEventWithType:@"container-begin" matchingPayload:v32];

    int v34 = [v33 payload];
    uint64_t v35 = [v6 type];
    BOOL v36 = (void *)v74;
    [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v14 withItemBeginEvent:v74 containerBeginPayload:v34 cursor:v7 forEventType:v35];

    [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v14 withQueueAddEvent:v75 queueSectionIdentifier:v9 cursor:v7];
    [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v14 withDeviceInfoFromCursor:v7];
    __int16 v37 = v33;
    [(MPCPlayActivityFeedEventConsumer *)self _getStartTimeForMostRecentPlaybackStart:v77 withItemBeginEvent:v74 containerBeginEvent:v33 cursor:v7];
    objc_msgSend(v14, "setItemStartTime:");
    __int16 v79 = @"queue-section-id";
    id v80 = v9;
    BOOL v38 = [NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
    __int16 v39 = [v7 findPreviousEventWithType:@"item-timed-metadata-ping" matchingPayload:v38];

    double v67 = v39;
    double v40 = [v39 payload];
    double v41 = [v40 objectForKeyedSubscript:@"item-timed-metadata"];
    [v14 setTimedMetadata:v41];

    uint64_t v42 = [v76 payload];
    double v43 = [v42 objectForKeyedSubscript:@"container-indeterminate-duration"];
    if ([v43 BOOLValue])
    {
    }
    else
    {
      double v44 = [v33 payload];
      int v45 = [v44 objectForKeyedSubscript:@"container-metadata"];
      long long v46 = [v45 objectForKeyedSubscript:@"container-radio-subtype"];
      id v65 = v7;
      double v47 = v9;
      double v48 = v37;
      id v49 = self;
      uint64_t v50 = [v46 integerValue];

      BOOL v36 = (void *)v74;
      BOOL v51 = v50 == 2;
      self = v49;
      __int16 v37 = v48;
      id v9 = v47;
      id v7 = v65;
      if (!v51) {
        goto LABEL_19;
      }
    }
    [v14 setItemStartTime:0.0];
    [v14 setItemDuration:0.0];
LABEL_19:
    double v52 = [v36 payload];
    unint64_t v53 = [v52 objectForKeyedSubscript:@"item-metadata"];
    double v54 = [v53 objectForKeyedSubscript:@"item-end-boundary"];
    double v55 = v54;
    if (v54)
    {
      [v54 doubleValue];
      double v57 = v56;
    }
    else
    {
      [v36 payload];
      v58 = double v66 = self;
      uint64_t v59 = [v58 objectForKeyedSubscript:@"item-metadata"];
      double v60 = [v59 objectForKeyedSubscript:@"item-duration"];
      [v60 doubleValue];
      double v57 = v61;

      BOOL v36 = (void *)v74;
      self = v66;
    }

    [(MPCPlayActivityFeedEventConsumer *)self _clampTimeValuesForPAFEvent:v14 withDuration:v57];
    if ([v14 isSBEnabled])
    {
      [(MPCPlayActivityFeedEventConsumer *)self _updatePAFEvent:v14 withSharedListeningInfoFromCursor:v7];
      uint64_t v62 = [MEMORY[0x263F08A00] defaultCenter];
      [v62 postNotificationName:@"MPCPlayActivityUtilitiesPlayStartNotification" object:self];

      id v78 = v14;
      uint64_t v63 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v78 count:1];
      BOOL v25 = [(MPCPlayActivityFeedEventConsumer *)self _finalizePAFEvents:v63];
    }
    else
    {
      BOOL v25 = 1;
    }
    BOOL v11 = v69;
    double v24 = v75;

    goto LABEL_26;
  }
  double v24 = os_log_create("com.apple.amp.mediaplaybackcore", "PAF");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    id v94 = self;
    __int16 v95 = 2114;
    id v96 = v6;
    __int16 v97 = 2114;
    id v98 = v7;
    _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_ERROR, "PlayActivityFeedEventConsumer %p: _handleItemResumeEvent:cursor: - could not find queueSectionIdentifier/itemIdentifier event=%{public}@ - cursor:%{public}@", buf, 0x20u);
  }
  BOOL v25 = 1;
LABEL_26:

  return v25;
}

- (void)_handleURLBagProviderDidUpdateBagNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x263F89080]];

  [(MPCPlayActivityFeedEventConsumer *)self _updateAllowedBundleIdsIfNecessary:v5];
}

- (void)unsubscribeFromEventStream:(id)a3
{
  subscription = self->_subscription;
  self->_subscription = 0;
}

uint64_t __59__MPCPlayActivityFeedEventConsumer_subscribeToEventStream___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleItemResumeEvent:a2 cursor:a3];
}

uint64_t __59__MPCPlayActivityFeedEventConsumer_subscribeToEventStream___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleItemPositionJumpEvent:a2 cursor:a3];
}

uint64_t __59__MPCPlayActivityFeedEventConsumer_subscribeToEventStream___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleItemPauseEvent:a2 cursor:a3];
}

uint64_t __59__MPCPlayActivityFeedEventConsumer_subscribeToEventStream___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleItemEndEvent:a2 cursor:a3];
}

uint64_t __59__MPCPlayActivityFeedEventConsumer_subscribeToEventStream___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleApplicationTerminationEvent:a2 cursor:a3];
}

@end