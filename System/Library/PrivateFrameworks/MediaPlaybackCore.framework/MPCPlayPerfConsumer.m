@interface MPCPlayPerfConsumer
+ (NSString)identifier;
+ (id)analyticsContentType:(int64_t)a3;
+ (id)analyticsFormat:(id)a3;
+ (id)coreAnalyticsEventNameWithEventType:(id)a3;
- (MPCPlayPerfConsumer)initWithPlaybackEngine:(id)a3;
- (MPCPlaybackEngine)playbackEngine;
- (MPCPlaybackEngineEventStreamSubscription)subscription;
- (void)generatePlayPerfSignposts:(id)a3;
- (void)handleMetrics:(id)a3;
- (void)publishPlaybackMetrics:(id)a3;
- (void)sendMetricsToCoreAnalytics:(id)a3;
- (void)sendMetricsToSiriSelfLogger:(id)a3;
- (void)setupErrorHandlerForEventType:(id)a3 errorKey:(id)a4 prefix:(id)a5;
- (void)subscribeToEventStream:(id)a3;
- (void)unsubscribeFromEventStream:(id)a3;
@end

@implementation MPCPlayPerfConsumer

+ (NSString)identifier
{
  return (NSString *)@"com.apple.MediaPlaybackCore/PlayPerf";
}

uint64_t __69__MPCPlayPerfConsumer_setupErrorHandlerForEventType_errorKey_prefix___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 payload];
  v8 = [v7 objectForKeyedSubscript:a1[4]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = NSString;
    uint64_t v10 = a1[5];
    v11 = objc_msgSend(v8, "msv_analyticSignature");
    v12 = [v9 stringWithFormat:@"%@:%@", v10, v11];

    v13 = (void *)a1[6];
    v14 = +[MPCPlayPerfMetrics playMetricsWithErrorSignature:v12 event:v5 cursor:v6];
    [v13 handleMetrics:v14];
  }
  return 1;
}

- (void)subscribeToEventStream:(id)a3
{
  objc_storeStrong((id *)&self->_subscription, a3);
  id v5 = a3;
  subscription = self->_subscription;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke;
  v19[3] = &unk_2643C5258;
  v19[4] = self;
  [(MPCPlaybackEngineEventStreamSubscription *)subscription subscribeToEventType:@"item-begin" handler:v19];
  v7 = self->_subscription;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_2;
  v18[3] = &unk_2643C5258;
  v18[4] = self;
  [(MPCPlaybackEngineEventStreamSubscription *)v7 subscribeToEventType:@"perf-report" handler:v18];
  v8 = self->_subscription;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_3;
  v17[3] = &unk_2643C5258;
  v17[4] = self;
  [(MPCPlaybackEngineEventStreamSubscription *)v8 subscribeToEventType:@"item-ready-for-metrics" handler:v17];
  v9 = self->_subscription;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_4;
  v16[3] = &unk_2643C5258;
  v16[4] = self;
  [(MPCPlaybackEngineEventStreamSubscription *)v9 subscribeToEventType:@"remote-control-end" handler:v16];
  uint64_t v10 = self->_subscription;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_5;
  v15[3] = &unk_2643C5258;
  v15[4] = self;
  [(MPCPlaybackEngineEventStreamSubscription *)v10 subscribeToEventType:@"remote-control-timeout" handler:v15];
  [(MPCPlayPerfConsumer *)self setupErrorHandlerForEventType:@"asset-load-end" errorKey:@"asset-load-error" prefix:@"AssetLoad"];
  [(MPCPlayPerfConsumer *)self setupErrorHandlerForEventType:@"queue-load-end" errorKey:@"queue-load-error" prefix:@"QueueLoad"];
  [(MPCPlayPerfConsumer *)self setupErrorHandlerForEventType:@"session-migrate-end" errorKey:@"session-migration-error" prefix:@"SessionMigrate"];
  [(MPCPlayPerfConsumer *)self setupErrorHandlerForEventType:@"session-restore-end" errorKey:@"session-restoration-error" prefix:@"SessionRestore"];
  [(MPCPlayPerfConsumer *)self setupErrorHandlerForEventType:@"shared-session-synchronization-end" errorKey:@"shared-sync-error" prefix:@"SharedSessionSynchronization"];
  [(MPCPlayPerfConsumer *)self setupErrorHandlerForEventType:@"session-activation-end" errorKey:@"session-activation-error" prefix:@"SessionActivation"];
  [(MPCPlayPerfConsumer *)self setupErrorHandlerForEventType:@"item-failed" errorKey:@"asset-load-error" prefix:@"PlayToEnd"];
  v11 = self->_subscription;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_6;
  v14[3] = &unk_2643C5258;
  v14[4] = self;
  [(MPCPlaybackEngineEventStreamSubscription *)v11 subscribeToEventType:@"item-pause" handler:v14];
  v12 = self->_subscription;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_7;
  v13[3] = &unk_2643C5258;
  v13[4] = self;
  [(MPCPlaybackEngineEventStreamSubscription *)v12 subscribeToEventType:@"item-rate-changed" handler:v13];
}

- (void)setupErrorHandlerForEventType:(id)a3 errorKey:(id)a4 prefix:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  subscription = self->_subscription;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__MPCPlayPerfConsumer_setupErrorHandlerForEventType_errorKey_prefix___block_invoke;
  v13[3] = &unk_2643C0C40;
  id v14 = v8;
  id v15 = v9;
  v16 = self;
  id v11 = v9;
  id v12 = v8;
  [(MPCPlaybackEngineEventStreamSubscription *)subscription subscribeToEventType:a3 handler:v13];
}

- (MPCPlayPerfConsumer)initWithPlaybackEngine:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPCPlayPerfConsumer;
  id v5 = [(MPCPlayPerfConsumer *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_playbackEngine, v4);
  }

  return v6;
}

uint64_t __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke(uint64_t a1)
{
  return 1;
}

- (void)publishPlaybackMetrics:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackEngine);
  id v6 = [WeakRetained mediaRemotePublisher];
  objc_initWeak(&location, v6);

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__MPCPlayPerfConsumer_publishPlaybackMetrics___block_invoke;
  block[3] = &unk_2643C1F60;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __46__MPCPlayPerfConsumer_publishPlaybackMetrics___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained updatePlaybackMetrics:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);

  objc_storeStrong((id *)&self->_lastSiriReferenceIdentifier, 0);
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

- (void)sendMetricsToSiriSelfLogger:(id)a3
{
  id v8 = a3;
  id v4 = [v8 siriRefId];
  char v5 = [v4 isEqualToString:self->_lastSiriReferenceIdentifier];

  if ((v5 & 1) == 0)
  {
    +[MPCSiriSelfLogger sendMetrics:v8];
    id v6 = [v8 siriRefId];
    lastSiriReferenceIdentifier = self->_lastSiriReferenceIdentifier;
    self->_lastSiriReferenceIdentifier = v6;
  }
}

- (void)sendMetricsToCoreAnalytics:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  char v5 = [v3 eventType];
  id v6 = [v4 coreAnalyticsEventNameWithEventType:v5];

  if (v6)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __50__MPCPlayPerfConsumer_sendMetricsToCoreAnalytics___block_invoke;
    v8[3] = &unk_2643C0C68;
    id v9 = v3;
    id v10 = v6;
    id v7 = _Block_copy(v8);
    AnalyticsSendEventLazy();
  }
}

id __50__MPCPlayPerfConsumer_sendMetricsToCoreAnalytics___block_invoke(uint64_t a1)
{
  uint64_t v147 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  id v3 = [MEMORY[0x263F086E0] mainBundle];
  id v4 = [v3 bundleIdentifier];
  [v2 setObject:v4 forKeyedSubscript:@"app"];

  char v5 = [*(id *)(a1 + 32) assetCacheAge];
  [v2 setObject:v5 forKeyedSubscript:@"assetCacheAge"];

  id v6 = [*(id *)(a1 + 32) assetLoadWaitTime];
  [v2 setObject:v6 forKeyedSubscript:@"assetLoadWaitTime"];

  id v7 = [*(id *)(a1 + 32) assetLocation];
  [v2 setObject:v7 forKeyedSubscript:@"assetLocation"];

  id v8 = [*(id *)(a1 + 32) assetProtectionType];
  [v2 setObject:v8 forKeyedSubscript:@"assetProtectionType"];

  id v9 = [*(id *)(a1 + 32) assetSource];
  [v2 setObject:v9 forKeyedSubscript:@"assetSource"];

  id v10 = [*(id *)(a1 + 32) assetType];
  [v2 setObject:v10 forKeyedSubscript:@"assetType"];

  id v11 = [*(id *)(a1 + 32) avTime];
  [v2 setObject:v11 forKeyedSubscript:@"avTime"];

  id v12 = [*(id *)(a1 + 32) bagWaitTime];
  [v2 setObject:v12 forKeyedSubscript:@"bagWaitTime"];

  v13 = [*(id *)(a1 + 32) endpointType];
  [v2 setObject:v13 forKeyedSubscript:@"endpointType"];

  id v14 = NSNumber;
  id v15 = [*(id *)(a1 + 32) errorResolution];
  v16 = [v14 numberWithInt:v15 != 0];
  [v2 setObject:v16 forKeyedSubscript:@"errorResolutionApplied"];

  v17 = [*(id *)(a1 + 32) errorSignature];
  [v2 setObject:v17 forKeyedSubscript:@"errorSignature"];

  v18 = [*(id *)(a1 + 32) experimentID];
  [v2 setObject:v18 forKeyedSubscript:@"experimentID"];

  v19 = [*(id *)(a1 + 32) featureName];
  [v2 setObject:v19 forKeyedSubscript:@"featureName"];

  v20 = [*(id *)(a1 + 32) firstAudioFrameWaitTime];
  [v2 setObject:v20 forKeyedSubscript:@"firstAudioFrameWaitTime"];

  v21 = [*(id *)(a1 + 32) formatInfo];
  v22 = [v21 objectForKeyedSubscript:@"bitDepth"];
  [v2 setObject:v22 forKeyedSubscript:@"formatInfoBitDepth"];

  v23 = [*(id *)(a1 + 32) formatInfo];
  v24 = [v23 objectForKeyedSubscript:@"bitrate"];
  [v2 setObject:v24 forKeyedSubscript:@"formatInfoBitrate"];

  v25 = [*(id *)(a1 + 32) formatInfo];
  v26 = [v25 objectForKeyedSubscript:@"channelLayout"];
  [v2 setObject:v26 forKeyedSubscript:@"formatInfoChannelLayout"];

  v27 = [*(id *)(a1 + 32) formatInfo];
  v28 = [v27 objectForKeyedSubscript:@"codec"];
  [v2 setObject:v28 forKeyedSubscript:@"formatInfoCodec"];

  v29 = [*(id *)(a1 + 32) formatInfo];
  v30 = [v29 objectForKeyedSubscript:@"multiChannel"];
  [v2 setObject:v30 forKeyedSubscript:@"formatInfoMultiChannel"];

  v31 = [*(id *)(a1 + 32) formatInfo];
  v32 = [v31 objectForKeyedSubscript:@"sampleRate"];
  [v2 setObject:v32 forKeyedSubscript:@"formatInfoSampleRate"];

  v33 = [*(id *)(a1 + 32) formatInfo];
  v34 = [v33 objectForKeyedSubscript:@"spatialized"];
  [v2 setObject:v34 forKeyedSubscript:@"formatInfoSpartialized"];

  v35 = [*(id *)(a1 + 32) formatInfo];
  v36 = [v35 objectForKeyedSubscript:@"tier"];
  [v2 setObject:v36 forKeyedSubscript:@"formatInfoTier"];

  v37 = [*(id *)(a1 + 32) hasAccountInfo];
  [v2 setObject:v37 forKeyedSubscript:@"hasAccountInfo"];

  v38 = NSNumber;
  v39 = [*(id *)(a1 + 32) leaseWaitTime];
  [v39 doubleValue];
  v41 = [v38 numberWithInt:v40 > 0.0];
  [v2 setObject:v41 forKeyedSubscript:@"hasLeaseWaitTime"];

  v42 = NSNumber;
  v43 = [*(id *)(a1 + 32) lookupWaitTime];
  [v43 doubleValue];
  v45 = [v42 numberWithInt:v44 > 0.0];
  [v2 setObject:v45 forKeyedSubscript:@"hasLookupWaitTime"];

  v46 = NSNumber;
  v47 = [*(id *)(a1 + 32) mediaRedownloadWaitTime];
  [v47 doubleValue];
  v49 = [v46 numberWithInt:v48 > 0.0];
  [v2 setObject:v49 forKeyedSubscript:@"hasMediaRedownloadWaitTime"];

  v50 = [*(id *)(a1 + 32) hasOfflinePlaybackKeys];
  [v2 setObject:v50 forKeyedSubscript:@"hasOfflinePlaybackKeys"];

  v51 = [*(id *)(a1 + 32) hasOnlinePlaybackKeys];
  [v2 setObject:v51 forKeyedSubscript:@"hasOnlinePlaybackKeys"];

  v52 = NSNumber;
  v53 = [*(id *)(a1 + 32) subscriptionAssetLoadWaitTime];
  [v53 doubleValue];
  v55 = [v52 numberWithInt:v54 > 0.0];
  [v2 setObject:v55 forKeyedSubscript:@"hasSubscriptionAssetLoadWaitTime"];

  v56 = NSNumber;
  v57 = [*(id *)(a1 + 32) suzeLeaseWaitTime];
  [v57 doubleValue];
  v59 = [v56 numberWithInt:v58 > 0.0];
  [v2 setObject:v59 forKeyedSubscript:@"hasSuzeLeaseWaitTime"];

  v60 = [*(id *)(a1 + 32) hlsMetadataWaitTime];
  [v2 setObject:v60 forKeyedSubscript:@"hlsMetadataWaitTime"];

  v61 = [*(id *)(a1 + 32) isActiveAccount];
  [v2 setObject:v61 forKeyedSubscript:@"isActiveAccount"];

  v62 = [*(id *)(a1 + 32) isAutoPlayEnabled];
  [v2 setObject:v62 forKeyedSubscript:@"isAutoPlayEnabled"];

  v63 = [*(id *)(a1 + 32) isDelegatedPlayback];
  [v2 setObject:v63 forKeyedSubscript:@"isDelegatedPlayback"];

  v64 = [*(id *)(a1 + 32) itemMetadata];
  v65 = [v64 objectForKeyedSubscript:@"item-is-start-item"];
  [v2 setObject:v65 forKeyedSubscript:@"isFirstItem"];

  v66 = [*(id *)(a1 + 32) isFirstPlay];
  [v2 setObject:v66 forKeyedSubscript:@"isFirstPlay"];

  v67 = [*(id *)(a1 + 32) isRemoteSetQueue];
  [v2 setObject:v67 forKeyedSubscript:@"isRemoteSetQueue"];

  v68 = [*(id *)(a1 + 32) isReplacingPlayback];
  [v2 setObject:v68 forKeyedSubscript:@"isReplacingPlayback"];

  v69 = [*(id *)(a1 + 32) isSharePlay];
  [v2 setObject:v69 forKeyedSubscript:@"isSharePlay"];

  v70 = [*(id *)(a1 + 32) isShuffled];
  [v2 setObject:v70 forKeyedSubscript:@"isShuffled"];

  v71 = [*(id *)(a1 + 32) leaseWaitTime];
  [v2 setObject:v71 forKeyedSubscript:@"leaseWaitTime"];

  v72 = [*(id *)(a1 + 32) lookupWaitTime];
  [v2 setObject:v72 forKeyedSubscript:@"lookupWaitTime"];

  v73 = [*(id *)(a1 + 32) mediaPlayerTime];
  [v2 setObject:v73 forKeyedSubscript:@"mediaPlayerTime"];

  v74 = [*(id *)(a1 + 32) mediaRedownloadWaitTime];
  [v2 setObject:v74 forKeyedSubscript:@"mediaRedownloadWaitTime"];

  v75 = [*(id *)(a1 + 32) musicWaitTime];
  [v2 setObject:v75 forKeyedSubscript:@"musicWaitTime"];

  v76 = [*(id *)(a1 + 32) networkType];
  [v2 setObject:v76 forKeyedSubscript:@"networkType"];

  v77 = [*(id *)(a1 + 32) networkTime];
  [v2 setObject:v77 forKeyedSubscript:@"networkTime"];

  v78 = [*(id *)(a1 + 32) playCommandSendTime];
  [v2 setObject:v78 forKeyedSubscript:@"playCommandSendTime"];

  v79 = [*(id *)(a1 + 32) playCommandWaitTime];
  [v2 setObject:v79 forKeyedSubscript:@"playCommandWaitTime"];

  v80 = [*(id *)(a1 + 32) queueCommandType];
  [v2 setObject:v80 forKeyedSubscript:@"queueCommandType"];

  v81 = [*(id *)(a1 + 32) queueLoadWaitTime];
  [v2 setObject:v81 forKeyedSubscript:@"queueLoadWaitTime"];

  v82 = [*(id *)(a1 + 32) queueType];
  [v2 setObject:v82 forKeyedSubscript:@"queueType"];

  v83 = [*(id *)(a1 + 32) rateChangeWaitTime];
  [v2 setObject:v83 forKeyedSubscript:@"rateChangeWaitTime"];

  v84 = [*(id *)(a1 + 32) readyToPlayStatusWaitTime];
  [v2 setObject:v84 forKeyedSubscript:@"readyToPlayStatusWaitTime"];

  v85 = [*(id *)(a1 + 32) routeInfo];
  v86 = [v85 objectForKeyedSubscript:@"type"];
  [v2 setObject:v86 forKeyedSubscript:@"routeInfoType"];

  v87 = [*(id *)(a1 + 32) seekBeforePlaying];
  [v2 setObject:v87 forKeyedSubscript:@"seekBeforePlaying"];

  v88 = [*(id *)(a1 + 32) sessionActivationAVTime];
  [v2 setObject:v88 forKeyedSubscript:@"sessionActivationAVTime"];

  v89 = [*(id *)(a1 + 32) sessionActivationWaitTime];
  [v2 setObject:v89 forKeyedSubscript:@"sessionActivationTime"];

  v90 = [*(id *)(a1 + 32) setQueueCommandSendTime];
  [v2 setObject:v90 forKeyedSubscript:@"setQueueCommandSendTime"];

  v91 = [*(id *)(a1 + 32) storefront];
  [v2 setObject:v91 forKeyedSubscript:@"storefront"];

  v92 = [*(id *)(a1 + 32) subscriptionAssetLoadWaitTime];
  [v2 setObject:v92 forKeyedSubscript:@"subscriptionAssetLoadWaitTime"];

  v93 = [*(id *)(a1 + 32) subscriptionType];
  [v2 setObject:v93 forKeyedSubscript:@"subscriptionType"];

  v94 = [*(id *)(a1 + 32) suzeLeaseWaitTime];
  [v2 setObject:v94 forKeyedSubscript:@"suzeLeaseWaitTime"];

  v95 = [*(id *)(a1 + 32) treatmentID];
  [v2 setObject:v95 forKeyedSubscript:@"treatmentID"];

  v96 = [*(id *)(a1 + 32) timeSinceBoot];
  [v2 setObject:v96 forKeyedSubscript:@"timeSinceBoot"];

  v97 = [*(id *)(a1 + 32) timeSinceLaunch];
  [v2 setObject:v97 forKeyedSubscript:@"timeSinceLaunch"];

  v98 = [*(id *)(a1 + 32) timeSincePaused];
  [v2 setObject:v98 forKeyedSubscript:@"timeSincePaused"];

  v99 = [*(id *)(a1 + 32) musicTotalTime];
  [v2 setObject:v99 forKeyedSubscript:@"totalTime"];

  v100 = [*(id *)(a1 + 32) nextItemWaitTime];
  [v2 setObject:v100 forKeyedSubscript:@"gapTime"];

  v101 = [*(id *)(a1 + 32) vocalsControlActive];
  [v2 setObject:v101 forKeyedSubscript:@"vocalsControlActive"];

  v102 = [*(id *)(a1 + 32) AVPlayerItemPerformanceMetrics];
  v103 = v102;
  if (v102)
  {
    v104 = [v102 objectForKeyedSubscript:@"BufferedAirPlay"];
    [v2 setObject:v104 forKeyedSubscript:@"avBufferedAirPlay"];

    v105 = [v103 objectForKeyedSubscript:@"CKFetchTime"];
    [v2 setObject:v105 forKeyedSubscript:@"avCKFetchTime"];

    v106 = [v103 objectForKeyedSubscript:@"IndexResponseCount"];
    [v2 setObject:v106 forKeyedSubscript:@"avIndexResponseCount"];

    v107 = [v103 objectForKeyedSubscript:@"IndexResponseTime0"];
    [v2 setObject:v107 forKeyedSubscript:@"avIndexResponseTime0"];

    v108 = [v103 objectForKeyedSubscript:@"IndexResponseTimeSum"];
    [v2 setObject:v108 forKeyedSubscript:@"avIndexResponseTimeSum"];

    v109 = [v103 objectForKeyedSubscript:@"indicatedBitrate"];
    [v2 setObject:v109 forKeyedSubscript:@"avIndicatedBitrate"];

    v110 = [v103 objectForKeyedSubscript:@"MediaFile2CKCount"];
    [v2 setObject:v110 forKeyedSubscript:@"avMediaFile2CKCount"];

    v111 = [v103 objectForKeyedSubscript:@"MediaFile2CKTime"];
    [v2 setObject:v111 forKeyedSubscript:@"avMediaFile2CKTime"];

    v112 = [v103 objectForKeyedSubscript:@"MVPResponseCount"];
    [v2 setObject:v112 forKeyedSubscript:@"avMVPResponseCount"];

    v113 = [v103 objectForKeyedSubscript:@"MVPResponseTime0"];
    [v2 setObject:v113 forKeyedSubscript:@"avMVPResponseTime0"];

    v114 = [v103 objectForKeyedSubscript:@"MVPResponseTimeSum"];
    [v2 setObject:v114 forKeyedSubscript:@"avMVPResponseTimeSum"];

    v115 = [v103 objectForKeyedSubscript:@"numberOfBytesTransferred"];
    [v2 setObject:v115 forKeyedSubscript:@"avNumberOfBytesTransferred"];

    v116 = [v103 objectForKeyedSubscript:@"observedBitrate"];
    [v2 setObject:v116 forKeyedSubscript:@"avObservedBitrate"];

    v117 = [v103 objectForKeyedSubscript:@"PPTime"];
    [v2 setObject:v117 forKeyedSubscript:@"avPPTime"];

    v118 = [v103 objectForKeyedSubscript:@"ReadyToPlayTime"];
    [v2 setObject:v118 forKeyedSubscript:@"avReadyToPlayTime"];

    v119 = [v103 objectForKeyedSubscript:@"RequestCount"];
    [v2 setObject:v119 forKeyedSubscript:@"avRequestCount"];

    v120 = [v103 objectForKeyedSubscript:@"RequestTimeSum"];
    [v2 setObject:v120 forKeyedSubscript:@"avRequestTimeSum"];

    v121 = [v103 objectForKeyedSubscript:@"SchedulingDelayCount"];
    [v2 setObject:v121 forKeyedSubscript:@"avSchedulingDelayCount"];

    v122 = [v103 objectForKeyedSubscript:@"SchedulingDelayTimeSum"];
    [v2 setObject:v122 forKeyedSubscript:@"avSchedulingDelayTimeSum"];

    v123 = [v103 objectForKeyedSubscript:@"segmentsDownloadedDuration"];
    [v2 setObject:v123 forKeyedSubscript:@"avSegmentsDownloadedDuration"];

    v124 = [v103 objectForKeyedSubscript:@"startupTime"];
    [v2 setObject:v124 forKeyedSubscript:@"avStartupTime"];

    v125 = [v103 objectForKeyedSubscript:@"tfac2ICreate"];
    [v2 setObject:v125 forKeyedSubscript:@"avTfac2ICreate"];

    v126 = [v103 objectForKeyedSubscript:@"tfac2ICurrent"];
    [v2 setObject:v126 forKeyedSubscript:@"avTfac2ICurrent"];

    v127 = [v103 objectForKeyedSubscript:@"tfac2IEnqueued"];
    [v2 setObject:v127 forKeyedSubscript:@"avTfac2IEnqueued"];

    v128 = [v103 objectForKeyedSubscript:@"tfac2IReady"];
    [v2 setObject:v128 forKeyedSubscript:@"avTfac2IReady"];

    v129 = [v103 objectForKeyedSubscript:@"tfac2NWStart"];
    [v2 setObject:v129 forKeyedSubscript:@"avTfac2NWStart"];

    v130 = [v103 objectForKeyedSubscript:@"tfac2RPCreate"];
    [v2 setObject:v130 forKeyedSubscript:@"avTfac2RPCreate"];

    v131 = [v103 objectForKeyedSubscript:@"tfac2RPCreateEnd"];
    [v2 setObject:v131 forKeyedSubscript:@"avTfac2RPCreateEnd"];

    v132 = [v103 objectForKeyedSubscript:@"tfac2SetRate"];
    [v2 setObject:v132 forKeyedSubscript:@"avTfac2SetRate"];

    v133 = [v103 objectForKeyedSubscript:@"tfac2SetRateEnd"];
    [v2 setObject:v133 forKeyedSubscript:@"avTfac2SetRateEnd"];

    v134 = [v103 objectForKeyedSubscript:@"TimeItemToCurrent"];
    [v2 setObject:v134 forKeyedSubscript:@"avTimeItemToCurrent"];

    v135 = [v103 objectForKeyedSubscript:@"TimeItemToEnqueue"];
    [v2 setObject:v135 forKeyedSubscript:@"avTimeItemToEnqueue"];

    v136 = [v103 objectForKeyedSubscript:@"TimeItemToLTKU"];
    [v2 setObject:v136 forKeyedSubscript:@"avTimeItemToLTKU"];

    v137 = [v103 objectForKeyedSubscript:@"TimeLTKPToStart"];
    [v2 setObject:v137 forKeyedSubscript:@"avTimeLTKPToStart"];

    v138 = [v103 objectForKeyedSubscript:@"TimeLTKUToSTimebaseChange"];
    [v2 setObject:v138 forKeyedSubscript:@"avTimeLTKUToSTimebaseChange"];

    v139 = [v103 objectForKeyedSubscript:@"TimeUntilOutputStart"];
    [v2 setObject:v139 forKeyedSubscript:@"avTimeUntilOutputStart"];
  }
  if (MSVDeviceOSIsInternalInstall())
  {
    v140 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics_Oversize");
    if (os_log_type_enabled(v140, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v141 = *(void *)(a1 + 40);
      int v143 = 138543618;
      uint64_t v144 = v141;
      __int16 v145 = 2114;
      v146 = v2;
      _os_log_impl(&dword_21BB87000, v140, OS_LOG_TYPE_DEBUG, "PlayPerfEvent: Logging CoreAnalytics event %{public}@ with payload:\n%{public}@", (uint8_t *)&v143, 0x16u);
    }
  }

  return v2;
}

- (void)generatePlayPerfSignposts:(id)a3
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 eventType];
  int v5 = [v4 isEqualToString:@"FirstItem"];

  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    os_signpost_id_t v7 = os_signpost_id_generate(v6);

    id v8 = [v3 assetType];
    id v9 = +[MPCPlayPerfConsumer analyticsContentType:](MPCPlayPerfConsumer, "analyticsContentType:", [v8 integerValue]);

    id v10 = [v3 formatInfo];
    id v11 = +[MPCPlayPerfConsumer analyticsFormat:v10];

    uint64_t v12 = mach_continuous_time();
    uint64_t v13 = v12 - mach_absolute_time();
    uint64_t v14 = [v3 checkpointMRSetQueueBegin];
    if (v14)
    {
      id v15 = (void *)v14;
      v16 = [v3 checkpointSetQueueBegin];

      if (v16)
      {
        v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v18 = v17;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
        {
          v19 = [v3 checkpointMRSetQueueBegin];
          int v93 = 134349570;
          uint64_t v94 = [v19 longLongValue] + v13;
          __int16 v95 = 2082;
          uint64_t v96 = [v9 UTF8String];
          __int16 v97 = 2082;
          uint64_t v98 = [v11 UTF8String];
          _os_signpost_emit_with_name_impl(&dword_21BB87000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SendQueue", "%{public, signpost.description:begin_time}llu,contentType=%{public, signpost.telemetry:string1, name=contentType}s format=%{public, signpost.telemetry:string2, name=format}s", (uint8_t *)&v93, 0x20u);
        }
        v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v21 = v20;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
        {
          v22 = [v3 checkpointSetQueueBegin];
          uint64_t v23 = [v22 longLongValue];
          int v93 = 134349056;
          uint64_t v94 = v23 + v13;
          _os_signpost_emit_with_name_impl(&dword_21BB87000, v21, OS_SIGNPOST_INTERVAL_END, v7, "SendQueue", "%{public, signpost.description:end_time}llu,", (uint8_t *)&v93, 0xCu);
        }
      }
    }
    uint64_t v24 = [v3 checkpointSetQueueBegin];
    if (v24)
    {
      v25 = (void *)v24;
      v26 = [v3 checkpointAssetLoadBegin];

      if (v26)
      {
        v27 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v28 = v27;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
        {
          v29 = [v3 checkpointSetQueueBegin];
          uint64_t v30 = [v29 longLongValue] + v13;
          uint64_t v31 = [v9 UTF8String];
          uint64_t v32 = [v11 UTF8String];
          int v93 = 134349570;
          uint64_t v94 = v30;
          __int16 v95 = 2082;
          uint64_t v96 = v31;
          __int16 v97 = 2082;
          uint64_t v98 = v32;
          _os_signpost_emit_with_name_impl(&dword_21BB87000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SetQueue", "%{public, signpost.description:begin_time}llu,contentType=%{public, signpost.telemetry:string1, name=contentType}s format=%{public, signpost.telemetry:string2, name=format}s", (uint8_t *)&v93, 0x20u);
        }
        v33 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v34 = v33;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          v35 = [v3 checkpointAssetLoadBegin];
          uint64_t v36 = [v35 longLongValue];
          int v93 = 134349056;
          uint64_t v94 = v36 + v13;
          _os_signpost_emit_with_name_impl(&dword_21BB87000, v34, OS_SIGNPOST_INTERVAL_END, v7, "SetQueue", "%{public, signpost.description:end_time}llu,", (uint8_t *)&v93, 0xCu);
        }
      }
    }
    uint64_t v37 = [v3 checkpointAssetLoadEnd];
    if (v37)
    {
      v38 = (void *)v37;
      v39 = [v3 checkpointLikelyToKeepUp];

      if (v39)
      {
        double v40 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v41 = v40;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
        {
          v42 = [v3 checkpointAssetLoadEnd];
          uint64_t v43 = [v42 longLongValue] + v13;
          uint64_t v44 = [v9 UTF8String];
          uint64_t v45 = [v11 UTF8String];
          int v93 = 134349570;
          uint64_t v94 = v43;
          __int16 v95 = 2082;
          uint64_t v96 = v44;
          __int16 v97 = 2082;
          uint64_t v98 = v45;
          _os_signpost_emit_with_name_impl(&dword_21BB87000, v41, OS_SIGNPOST_INTERVAL_BEGIN, v7, "WaitForLikelyToKeepUp", "%{public, signpost.description:begin_time}llu,contentType=%{public, signpost.telemetry:string1, name=contentType}s format=%{public, signpost.telemetry:string2, name=format}s", (uint8_t *)&v93, 0x20u);
        }
        v46 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v47 = v46;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
        {
          double v48 = [v3 checkpointLikelyToKeepUp];
          uint64_t v49 = [v48 longLongValue];
          int v93 = 134349056;
          uint64_t v94 = v49 + v13;
          _os_signpost_emit_with_name_impl(&dword_21BB87000, v47, OS_SIGNPOST_INTERVAL_END, v7, "WaitForLikelyToKeepUp", "%{public, signpost.description:end_time}llu,", (uint8_t *)&v93, 0xCu);
        }
      }
    }
    uint64_t v50 = [v3 checkpointAssetLoadEnd];
    if (v50)
    {
      v51 = (void *)v50;
      v52 = [v3 checkpointReadyToPlay];

      if (v52)
      {
        v53 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        double v54 = v53;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
        {
          v55 = [v3 checkpointAssetLoadEnd];
          uint64_t v56 = [v55 longLongValue] + v13;
          uint64_t v57 = [v9 UTF8String];
          uint64_t v58 = [v11 UTF8String];
          int v93 = 134349570;
          uint64_t v94 = v56;
          __int16 v95 = 2082;
          uint64_t v96 = v57;
          __int16 v97 = 2082;
          uint64_t v98 = v58;
          _os_signpost_emit_with_name_impl(&dword_21BB87000, v54, OS_SIGNPOST_INTERVAL_BEGIN, v7, "WaitForReadyToPlay", "%{public, signpost.description:begin_time}llu,contentType=%{public, signpost.telemetry:string1, name=contentType}s format=%{public, signpost.telemetry:string2, name=format}s", (uint8_t *)&v93, 0x20u);
        }
        v59 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v60 = v59;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v59))
        {
          v61 = [v3 checkpointReadyToPlay];
          uint64_t v62 = [v61 longLongValue];
          int v93 = 134349056;
          uint64_t v94 = v62 + v13;
          _os_signpost_emit_with_name_impl(&dword_21BB87000, v60, OS_SIGNPOST_INTERVAL_END, v7, "WaitForReadyToPlay", "%{public, signpost.description:end_time}llu,", (uint8_t *)&v93, 0xCu);
        }
      }
    }
    uint64_t v63 = [v3 checkpointReadyToPlay];
    if (v63)
    {
      v64 = (void *)v63;
      v65 = [v3 checkpointRateOne];

      if (v65)
      {
        v66 = [v3 checkpointReadyToPlay];
        uint64_t v67 = [v66 longLongValue];

        v68 = [v3 checkpointPlay];

        if (v68)
        {
          v69 = [v3 checkpointPlay];
          uint64_t v70 = [v69 longLongValue];

          if (v67 <= v70) {
            uint64_t v67 = v70;
          }
        }
        v71 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v72 = v71;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
        {
          uint64_t v73 = v67 + v13;
          uint64_t v74 = [v9 UTF8String];
          uint64_t v75 = [v11 UTF8String];
          int v93 = 134349570;
          uint64_t v94 = v73;
          __int16 v95 = 2082;
          uint64_t v96 = v74;
          __int16 v97 = 2082;
          uint64_t v98 = v75;
          _os_signpost_emit_with_name_impl(&dword_21BB87000, v72, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PlayToSetRate", "%{public, signpost.description:begin_time}llu,contentType=%{public, signpost.telemetry:string1, name=contentType}s format=%{public, signpost.telemetry:string2, name=format}s", (uint8_t *)&v93, 0x20u);
        }

        v76 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v77 = v76;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v76))
        {
          v78 = [v3 checkpointRateOne];
          uint64_t v79 = [v78 longLongValue];
          int v93 = 134349056;
          uint64_t v94 = v79 + v13;
          _os_signpost_emit_with_name_impl(&dword_21BB87000, v77, OS_SIGNPOST_INTERVAL_END, v7, "PlayToSetRate", "%{public, signpost.description:end_time}llu,", (uint8_t *)&v93, 0xCu);
        }
      }
    }
    uint64_t v80 = [v3 checkpointRateOne];
    if (v80)
    {
      v81 = (void *)v80;
      v82 = [v3 checkpointFirstAudioFrame];

      if (v82)
      {
        v83 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v84 = v83;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v83))
        {
          v85 = [v3 checkpointRateOne];
          uint64_t v86 = [v85 longLongValue] + v13;
          uint64_t v87 = [v9 UTF8String];
          uint64_t v88 = [v11 UTF8String];
          int v93 = 134349570;
          uint64_t v94 = v86;
          __int16 v95 = 2082;
          uint64_t v96 = v87;
          __int16 v97 = 2082;
          uint64_t v98 = v88;
          _os_signpost_emit_with_name_impl(&dword_21BB87000, v84, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SetRateToEffectiveRate", "%{public, signpost.description:begin_time}llu,contentType=%{public, signpost.telemetry:string1, name=contentType}s format=%{public, signpost.telemetry:string2, name=format}s", (uint8_t *)&v93, 0x20u);
        }
        v89 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
        v90 = v89;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v89))
        {
          v91 = [v3 checkpointFirstAudioFrame];
          uint64_t v92 = [v91 longLongValue];
          int v93 = 134349056;
          uint64_t v94 = v92 + v13;
          _os_signpost_emit_with_name_impl(&dword_21BB87000, v90, OS_SIGNPOST_INTERVAL_END, v7, "SetRateToEffectiveRate", "%{public, signpost.description:end_time}llu,", (uint8_t *)&v93, 0xCu);
        }
      }
    }
  }
}

- (void)handleMetrics:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    goto LABEL_18;
  }
  if (MSVDeviceOSIsInternalInstall() && (MSVDeviceIsInternalCarry() & 1) == 0)
  {
    int v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics_Oversize");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 description];
      *(_DWORD *)buf = 138543362;
      uint64_t v24 = v6;
      _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_DEFAULT, "PlayPerfJSON: %{public}@", buf, 0xCu);
    }
  }
  os_signpost_id_t v7 = [(MPCPlayPerfConsumer *)self playbackEngine];
  id v8 = [v4 eventType];
  if ([v8 isEqualToString:@"FirstItem"])
  {

LABEL_10:
    id v11 = [v7 eventStream];
    uint64_t v12 = objc_msgSend(v4, "jsonObject", @"perf-metrics");
    v22[0] = v12;
    v21[1] = @"queue-section-id";
    uint64_t v13 = [v4 sectionIdentifier];
    v22[1] = v13;
    v21[2] = @"queue-item-id";
    uint64_t v14 = [v4 itemIdentifier];
    v22[2] = v14;
    id v15 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
    [v11 emitEventType:@"perf-report" payload:v15];

    goto LABEL_11;
  }
  id v9 = [v4 eventType];
  int v10 = [v9 isEqualToString:@"NextItem"];

  if (v10) {
    goto LABEL_10;
  }
LABEL_11:
  [(MPCPlayPerfConsumer *)self generatePlayPerfSignposts:v4];
  [(MPCPlayPerfConsumer *)self sendMetricsToCoreAnalytics:v4];
  v16 = [v4 eventType];
  if ([v16 isEqualToString:@"FirstItem"])
  {
    v17 = [v4 siriRefId];

    if (v17) {
      [(MPCPlayPerfConsumer *)self sendMetricsToSiriSelfLogger:v4];
    }
  }
  else
  {
  }
  v18 = [v4 eventType];
  int v19 = [v18 isEqualToString:@"FirstItem"];

  if (v19)
  {
    v20 = [v7 player];
    [v20 donateMetricsToPlayerItem:v4];
  }
LABEL_18:
}

- (void)unsubscribeFromEventStream:(id)a3
{
  subscription = self->_subscription;
  self->_subscription = 0;
}

uint64_t __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 payload];
  id v4 = [v3 objectForKeyedSubscript:@"perf-metrics"];
  [v2 publishPlaybackMetrics:v4];

  return 1;
}

uint64_t __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = +[MPCPlayPerfMetrics playMetricsWithItemReadyForMetricsEvent:a2 cursor:a3];
  [*(id *)(a1 + 32) handleMetrics:v4];

  return 1;
}

uint64_t __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_signpost_id_t v7 = [v5 payload];
  id v8 = [v7 objectForKeyedSubscript:@"remote-control-status"];
  id v9 = [v8 firstObject];

  if ([v9 type] == 3)
  {
    int v10 = [v9 error];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v12 = [v5 payload];
      uint64_t v13 = [v12 objectForKeyedSubscript:@"remote-control-type"];
      [v13 unsignedIntValue];

      uint64_t v14 = (void *)MRMediaRemoteCopyCommandDescription();
      id v15 = NSString;
      v16 = [v9 error];
      v17 = objc_msgSend(v16, "msv_analyticSignature");
      v18 = [v15 stringWithFormat:@"Command:%@:%@", v14, v17];

      int v19 = *(void **)(a1 + 32);
      v20 = +[MPCPlayPerfMetrics playMetricsWithErrorSignature:v18 event:v5 cursor:v6];
      [v19 handleMetrics:v20];
    }
  }

  return 1;
}

uint64_t __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  os_signpost_id_t v7 = [v6 payload];
  id v8 = [v7 objectForKeyedSubscript:@"remote-control-type"];
  [v8 unsignedIntValue];

  id v9 = (void *)MRMediaRemoteCopyCommandDescription();
  int v10 = [NSString stringWithFormat:@"Command:%@:Timeout", v9];
  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = +[MPCPlayPerfMetrics playMetricsWithErrorSignature:v10 event:v6 cursor:v5];

  [v11 handleMetrics:v12];
  return 1;
}

uint64_t __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_signpost_id_t v7 = [v5 payload];
  id v8 = [v7 objectForKeyedSubscript:@"item-rate-change-reason"];

  id v9 = [v5 payload];
  int v10 = [v9 objectForKeyedSubscript:@"item-rate-change-source"];

  if ([v8 isEqualToString:@"error"])
  {
    id v11 = [NSString stringWithFormat:@"ItemPause:%@:%@", v8, v10];
    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = +[MPCPlayPerfMetrics playMetricsWithErrorSignature:v11 event:v5 cursor:v6];
    [v12 handleMetrics:v13];
  }
  return 1;
}

uint64_t __46__MPCPlayPerfConsumer_subscribeToEventStream___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_signpost_id_t v7 = [v5 payload];
  id v8 = [v7 objectForKeyedSubscript:@"item-rate-change-reason"];

  id v9 = [v5 payload];
  int v10 = [v9 objectForKeyedSubscript:@"item-rate-change-source"];

  if ([v8 isEqualToString:*MEMORY[0x263EFA160]])
  {
    id v11 = [NSString stringWithFormat:@"ItemRateChange:%@:%@", v8, v10];
    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v13 = +[MPCPlayPerfMetrics playMetricsWithErrorSignature:v11 event:v5 cursor:v6];
    [v12 handleMetrics:v13];
  }
  return 1;
}

+ (id)coreAnalyticsEventNameWithEventType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FirstItem"])
  {
    id v4 = @"com.apple.amp.mediaplayer.playperf.FirstItem";
  }
  else if ([v3 isEqualToString:@"NextItem"])
  {
    id v4 = @"com.apple.amp.mediaplayer.playperf.NextItem";
  }
  else if ([v3 isEqualToString:@"PlayError"])
  {
    id v4 = @"com.apple.amp.mediaplayer.playperf.PlayError";
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)analyticsFormat:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"codec"];
  unsigned int v5 = [v4 integerValue];

  unsigned int v6 = bswap32(v5);
  os_signpost_id_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", v6, BYTE1(v6), BYTE2(v6), HIBYTE(v6));
  id v8 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  id v9 = [v7 stringByTrimmingCharactersInSet:v8];

  int v10 = [v3 objectForKeyedSubscript:@"bitrate"];
  uint64_t v11 = [v10 integerValue];

  uint64_t v12 = [v3 objectForKeyedSubscript:@"channelLayout"];
  unsigned __int16 v13 = [v12 integerValue];

  uint64_t v14 = [v3 objectForKeyedSubscript:@"sampleRate"];
  uint64_t v15 = [v14 integerValue];

  v16 = [v3 objectForKeyedSubscript:@"bitrate"];

  uint64_t v17 = [v16 integerValue];
  if (v11 >= 1)
  {
    [NSString stringWithFormat:@"%@,%ldkbps,%ld", v9, v11 / 0x3E8uLL, v13];
LABEL_5:
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (v15 >= 1)
  {
    [NSString stringWithFormat:@"%@,%ldkhz,%ld", v9, v15 / 0x3E8uLL, v17];
    goto LABEL_5;
  }
  v21 = &stru_26CBCA930;
  if (v9) {
    v21 = v9;
  }
  v18 = v21;
LABEL_6:
  int v19 = v18;

  return v19;
}

+ (id)analyticsContentType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return &stru_26CBCA930;
  }
  else {
    return off_2643C0C88[a3 - 1];
  }
}

@end