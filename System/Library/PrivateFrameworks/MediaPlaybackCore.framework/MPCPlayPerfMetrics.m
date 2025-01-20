@interface MPCPlayPerfMetrics
+ (id)playMetricsWithErrorSignature:(id)a3 event:(id)a4 cursor:(id)a5;
+ (id)playMetricsWithItemReadyForMetricsEvent:(id)a3 cursor:(id)a4;
- (MPCPlayPerfMetrics)init;
- (NSDictionary)AVPlayerItemPerformanceMetrics;
- (NSDictionary)formatInfo;
- (NSDictionary)itemMetadata;
- (NSDictionary)routeInfo;
- (NSMutableDictionary)data;
- (NSNumber)assetCacheAge;
- (NSNumber)assetLoadWaitTime;
- (NSNumber)assetLocation;
- (NSNumber)assetProtectionType;
- (NSNumber)assetSource;
- (NSNumber)assetType;
- (NSNumber)avTime;
- (NSNumber)bagWaitTime;
- (NSNumber)checkpointAssetLoadBegin;
- (NSNumber)checkpointAssetLoadEnd;
- (NSNumber)checkpointFirstAudioFrame;
- (NSNumber)checkpointLikelyToKeepUp;
- (NSNumber)checkpointMRPlay;
- (NSNumber)checkpointMRSetQueueBegin;
- (NSNumber)checkpointPlay;
- (NSNumber)checkpointRateOne;
- (NSNumber)checkpointRateZero;
- (NSNumber)checkpointReadyToPlay;
- (NSNumber)checkpointSetQueueBegin;
- (NSNumber)checkpointSetQueueEnd;
- (NSNumber)endpointType;
- (NSNumber)errorResolution;
- (NSNumber)eventTime;
- (NSNumber)firstAudioFrameWaitTime;
- (NSNumber)hasAccountInfo;
- (NSNumber)hasOfflinePlaybackKeys;
- (NSNumber)hasOnlinePlaybackKeys;
- (NSNumber)hlsMetadataWaitTime;
- (NSNumber)isActiveAccount;
- (NSNumber)isAutoPlayEnabled;
- (NSNumber)isDelegatedPlayback;
- (NSNumber)isFirstPlay;
- (NSNumber)isRemoteSetQueue;
- (NSNumber)isReplacingPlayback;
- (NSNumber)isSharePlay;
- (NSNumber)isShuffled;
- (NSNumber)leaseWaitTime;
- (NSNumber)lookupWaitTime;
- (NSNumber)mediaPlayerTime;
- (NSNumber)mediaRedownloadWaitTime;
- (NSNumber)musicTotalTime;
- (NSNumber)musicWaitTime;
- (NSNumber)networkTime;
- (NSNumber)networkType;
- (NSNumber)nextItemWaitTime;
- (NSNumber)playCommandSendTime;
- (NSNumber)playCommandWaitTime;
- (NSNumber)queueCommandType;
- (NSNumber)queueLoadWaitTime;
- (NSNumber)rateChangeWaitTime;
- (NSNumber)readyToPlayStatusWaitTime;
- (NSNumber)seekBeforePlaying;
- (NSNumber)sessionActivationAVTime;
- (NSNumber)sessionActivationClientTime;
- (NSNumber)sessionActivationWaitTime;
- (NSNumber)setQueueCommandSendTime;
- (NSNumber)subscriptionAssetLoadWaitTime;
- (NSNumber)subscriptionType;
- (NSNumber)suzeLeaseWaitTime;
- (NSNumber)timeSinceBoot;
- (NSNumber)timeSinceLaunch;
- (NSNumber)timeSincePaused;
- (NSNumber)vocalsControlActive;
- (NSString)errorSignature;
- (NSString)eventType;
- (NSString)experimentID;
- (NSString)featureName;
- (NSString)itemIdentifier;
- (NSString)queueType;
- (NSString)sectionIdentifier;
- (NSString)siriRefId;
- (NSString)storefront;
- (NSString)treatmentID;
- (id)_buildSegmentForComponent:(void *)a3 subcomponent:(void *)a4 duration:;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonObject;
- (void)_addComplexityToSegment:(void *)a3 complexity:(int)a4 when:;
- (void)_addOptimizationToSegment:(void *)a3 optimization:(uint64_t)a4 when:;
- (void)_addStepToSegment:(void *)a3 name:(void *)a4 duration:(char)a5 options:;
- (void)addAssetSelectionWithCursor:(id)a3 itemIDPayload:(id)a4;
- (void)addEnvironmentInfoWithCursor:(id)a3;
- (void)addNetworkTimesWithScopedCursor:(id)a3;
- (void)addPlaybackBehaviorWithCursor:(id)a3;
- (void)addQueueMetadata:(id)a3;
- (void)addSessionActivationTimesWithScopedCursor:(id)a3;
- (void)addSharePlayWithCursor:(id)a3;
- (void)setData:(id)a3;
- (void)set_AVPlayerItemPerformanceMetrics:(id)a3;
- (void)set_assetCacheAge:(id)a3;
- (void)set_assetLoadWaitTime:(id)a3;
- (void)set_assetLocation:(id)a3;
- (void)set_assetProtectionType:(id)a3;
- (void)set_assetSource:(id)a3;
- (void)set_assetType:(id)a3;
- (void)set_bagWaitTime:(id)a3;
- (void)set_checkpointAssetLoadBegin:(id)a3;
- (void)set_checkpointAssetLoadEnd:(id)a3;
- (void)set_checkpointFirstAudioFrame:(id)a3;
- (void)set_checkpointLikelyToKeepUp:(id)a3;
- (void)set_checkpointMRPlay:(id)a3;
- (void)set_checkpointMRSetQueueBegin:(id)a3;
- (void)set_checkpointPlay:(id)a3;
- (void)set_checkpointRateOne:(id)a3;
- (void)set_checkpointRateZero:(id)a3;
- (void)set_checkpointReadyToPlay:(id)a3;
- (void)set_checkpointSetQueueBegin:(id)a3;
- (void)set_checkpointSetQueueEnd:(id)a3;
- (void)set_endpointType:(id)a3;
- (void)set_errorResolution:(id)a3;
- (void)set_errorSignature:(id)a3;
- (void)set_eventTime:(id)a3;
- (void)set_eventType:(id)a3;
- (void)set_experimentID:(id)a3;
- (void)set_featureName:(id)a3;
- (void)set_firstAudioFrameWaitTime:(id)a3;
- (void)set_formatInfo:(id)a3;
- (void)set_hasAccountInfo:(id)a3;
- (void)set_hasOfflinePlaybackKeys:(id)a3;
- (void)set_hasOnlinePlaybackKeys:(id)a3;
- (void)set_hlsMetadataWaitTime:(id)a3;
- (void)set_isActiveAccount:(id)a3;
- (void)set_isAutoPlayEnabled:(id)a3;
- (void)set_isDelegatedPlayback:(id)a3;
- (void)set_isFirstPlay:(id)a3;
- (void)set_isRemoteSetQueue:(id)a3;
- (void)set_isReplacingPlayback:(id)a3;
- (void)set_isSharePlay:(id)a3;
- (void)set_isShuffled:(id)a3;
- (void)set_itemIdentifier:(id)a3;
- (void)set_itemMetadata:(id)a3;
- (void)set_leaseWaitTime:(id)a3;
- (void)set_lookupWaitTime:(id)a3;
- (void)set_mediaRedownloadWaitTime:(id)a3;
- (void)set_networkType:(id)a3;
- (void)set_nextItemWaitTime:(id)a3;
- (void)set_playCommandSendTime:(id)a3;
- (void)set_playCommandWaitTime:(id)a3;
- (void)set_queueCommandType:(id)a3;
- (void)set_queueLoadWaitTime:(id)a3;
- (void)set_queueType:(id)a3;
- (void)set_rateChangeWaitTime:(id)a3;
- (void)set_readyToPlayStatusWaitTime:(id)a3;
- (void)set_routeInfo:(id)a3;
- (void)set_sectionIdentifier:(id)a3;
- (void)set_seekBeforePlaying:(id)a3;
- (void)set_sessionActivationAVTime:(id)a3;
- (void)set_sessionActivationClientTime:(id)a3;
- (void)set_sessionActivationWaitTime:(id)a3;
- (void)set_setQueueCommandSendTime:(id)a3;
- (void)set_siriRefId:(id)a3;
- (void)set_storefront:(id)a3;
- (void)set_subscriptionAssetLoadWaitTime:(id)a3;
- (void)set_subscriptionType:(id)a3;
- (void)set_suzeLeaseWaitTime:(id)a3;
- (void)set_timeSinceBoot:(id)a3;
- (void)set_timeSinceLaunch:(id)a3;
- (void)set_timeSincePaused:(id)a3;
- (void)set_treatmentID:(id)a3;
- (void)set_vocalsControlActive:(id)a3;
@end

@implementation MPCPlayPerfMetrics

- (void).cxx_destruct
{
}

- (void)setData:(id)a3
{
}

- (NSMutableDictionary)data
{
  return self->_data;
}

- (void)addEnvironmentInfoWithCursor:(id)a3
{
  id v6 = [a3 findPreviousEventWithType:@"network-type-changed" matchingPayload:0];
  v4 = [v6 payload];
  v5 = [v4 objectForKeyedSubscript:@"network-type"];
  [(MPCPlayPerfMetrics *)self set_networkType:v5];
}

- (void)addAssetSelectionWithCursor:(id)a3 itemIDPayload:(id)a4
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v43 = a3;
  id v44 = a4;
  v42 = objc_msgSend(v43, "findPreviousEventWithType:matchingPayload:", @"asset-selection");
  if (v42)
  {
    id v6 = [v42 payload];
    v7 = [v6 objectForKeyedSubscript:@"asset-load-info"];

    v8 = [v7 objectForKeyedSubscript:@"item-asset-type"];
    [(MPCPlayPerfMetrics *)self set_assetType:v8];

    v9 = [v7 objectForKeyedSubscript:@"item-asset-source"];
    [(MPCPlayPerfMetrics *)self set_assetSource:v9];

    v10 = [v7 objectForKeyedSubscript:@"item-asset-protection-type"];
    [(MPCPlayPerfMetrics *)self set_assetProtectionType:v10];

    v11 = [v7 objectForKeyedSubscript:@"item-asset-location"];
    [(MPCPlayPerfMetrics *)self set_assetLocation:v11];

    v12 = [v7 objectForKeyedSubscript:@"item-asset-cache-age"];
    [(MPCPlayPerfMetrics *)self set_assetCacheAge:v12];

    v13 = [v7 objectForKeyedSubscript:@"item-asset-endpoint-type"];
    [(MPCPlayPerfMetrics *)self set_endpointType:v13];

    v14 = [v7 objectForKeyedSubscript:@"item-asset-is-delegated-playback"];
    [(MPCPlayPerfMetrics *)self set_isDelegatedPlayback:v14];

    v15 = [v7 objectForKeyedSubscript:@"item-asset-has-online-keys"];
    [(MPCPlayPerfMetrics *)self set_hasOnlinePlaybackKeys:v15];

    v16 = [v7 objectForKeyedSubscript:@"item-asset-has-offline-keys"];
    [(MPCPlayPerfMetrics *)self set_hasOfflinePlaybackKeys:v16];

    v17 = [v7 objectForKeyedSubscript:@"experiment-id"];
    [(MPCPlayPerfMetrics *)self set_experimentID:v17];

    v18 = [v7 objectForKeyedSubscript:@"experiment-treatment-id"];
    [(MPCPlayPerfMetrics *)self set_treatmentID:v18];
  }
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__32062;
  v50 = __Block_byref_object_dispose__32063;
  id v51 = 0;
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __64__MPCPlayPerfMetrics_addAssetSelectionWithCursor_itemIDPayload___block_invoke;
  v45[3] = &unk_2643C62C8;
  v45[4] = &v46;
  [v43 enumeratePreviousEventsWithType:@"audio-format-changed" matchingPayload:v44 usingBlock:v45];
  v19 = (void *)v47[5];
  if (v19)
  {
    id v20 = v19;
    v52 = @"tier";
    objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "tier"));
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v60 = v41;
    v53 = @"bitrate";
    v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "bitrate"));
    v61 = v21;
    v54 = @"sampleRate";
    v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "sampleRate"));
    v62 = v22;
    v55 = @"bitDepth";
    v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v20, "bitDepth"));
    v63 = v23;
    v56 = @"codec";
    v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v20, "codec"));
    v64 = v24;
    v57 = @"channelLayout";
    v25 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v20, "channelLayout"));
    v65 = v25;
    v58 = @"spatialized";
    v26 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v20, "isSpatialized"));
    v66 = v26;
    v59 = @"multiChannel";
    v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v20, "isMultiChannel"));
    v67 = v27;
    v28 = [NSDictionary dictionaryWithObjects:&v60 forKeys:&v52 count:8];

    [(MPCPlayPerfMetrics *)self set_formatInfo:v28];
  }
  v29 = [v43 findPreviousEventWithType:@"item-configuration-end" matchingPayload:v44];
  v30 = v29;
  if (v29)
  {
    v31 = [v29 payload];
    v32 = [v31 objectForKeyedSubscript:@"hls-metadata-wait-time"];
    [(MPCPlayPerfMetrics *)self set_hlsMetadataWaitTime:v32];

    v33 = [v30 payload];
    v34 = [v33 objectForKeyedSubscript:@"audio-route"];

    if (v34)
    {
      id v35 = v34;
      v52 = @"name";
      uint64_t v36 = [v35 name];
      v37 = (void *)v36;
      v38 = &stru_26CBCA930;
      if (v36) {
        v38 = (__CFString *)v36;
      }
      v60 = v38;
      v53 = @"type";
      v39 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v35, "type"));
      v61 = v39;
      v40 = [NSDictionary dictionaryWithObjects:&v60 forKeys:&v52 count:2];

      [(MPCPlayPerfMetrics *)self set_routeInfo:v40];
    }
  }
  _Block_object_dispose(&v46, 8);
}

void __64__MPCPlayPerfMetrics_addAssetSelectionWithCursor_itemIDPayload___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  v5 = [a2 payload];
  id v9 = [v5 objectForKeyedSubscript:@"item-audio-format-metadata"];

  uint64_t v6 = [v9 objectForKeyedSubscript:@"active-format"];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (void)addSessionActivationTimesWithScopedCursor:(id)a3
{
  v24[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__32062;
  v22[4] = __Block_byref_object_dispose__32063;
  id v23 = 0;
  uint64_t v18 = 0;
  v19 = (double *)&v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v14 = 0;
  v15 = (double *)&v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v10 = 0;
  v11 = (double *)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v24[0] = @"session-activation-end";
  v24[1] = @"session-activation-begin";
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__MPCPlayPerfMetrics_addSessionActivationTimesWithScopedCursor___block_invoke;
  v9[3] = &unk_2643C64F8;
  v9[4] = v22;
  v9[5] = &v18;
  v9[6] = &v14;
  v9[7] = &v10;
  [v4 enumeratePreviousEventsWithTypes:v5 usingBlock:v9];

  uint64_t v6 = [NSNumber numberWithDouble:v19[3]];
  [(MPCPlayPerfMetrics *)self set_sessionActivationWaitTime:v6];

  uint64_t v7 = [NSNumber numberWithDouble:v15[3]];
  [(MPCPlayPerfMetrics *)self set_sessionActivationAVTime:v7];

  v8 = [NSNumber numberWithDouble:v11[3]];
  [(MPCPlayPerfMetrics *)self set_sessionActivationClientTime:v8];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v22, 8);
}

void __64__MPCPlayPerfMetrics_addSessionActivationTimesWithScopedCursor___block_invoke(void *a1, void *a2)
{
  id v20 = a2;
  v3 = [v20 type];
  int v4 = [v3 isEqualToString:@"session-activation-end"];

  if (v4)
  {
    uint64_t v5 = *(void *)(a1[4] + 8);
    id v6 = v20;
    uint64_t v7 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v6;
  }
  else
  {
    v8 = [v20 type];
    int v9 = [v8 isEqualToString:@"session-activation-begin"];

    uint64_t v10 = v20;
    if (!v9) {
      goto LABEL_9;
    }
    uint64_t v11 = *(void *)(a1[4] + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    if (v12)
    {
      [v12 durationSinceEvent:v20];
      *(double *)(*(void *)(a1[5] + 8) + 24) = v13 + *(double *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v14 = [*(id *)(*(void *)(a1[4] + 8) + 40) payload];
      v15 = [v14 objectForKeyedSubscript:@"session-activation-av-time"];
      [v15 doubleValue];
      *(double *)(*(void *)(a1[6] + 8) + 24) = v16 + *(double *)(*(void *)(a1[6] + 8) + 24);

      uint64_t v17 = [*(id *)(*(void *)(a1[4] + 8) + 40) payload];
      uint64_t v18 = [v17 objectForKeyedSubscript:@"session-activation-client-time"];
      [v18 doubleValue];
      *(double *)(*(void *)(a1[7] + 8) + 24) = v19 + *(double *)(*(void *)(a1[7] + 8) + 24);

      uint64_t v11 = *(void *)(a1[4] + 8);
      uint64_t v7 = *(void **)(v11 + 40);
    }
    else
    {
      uint64_t v7 = 0;
    }
    *(void *)(v11 + 40) = 0;
  }

  uint64_t v10 = v20;
LABEL_9:
}

- (void)addNetworkTimesWithScopedCursor:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  int v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = [v4 dictionary];
  uint64_t v17 = @"blocks-playback";
  v18[0] = MEMORY[0x263EFFA88];
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __54__MPCPlayPerfMetrics_addNetworkTimesWithScopedCursor___block_invoke;
  v15[3] = &unk_2643C64B0;
  v15[4] = self;
  id v16 = v6;
  id v8 = v6;
  [v5 enumeratePreviousEventsWithType:@"network-operation" matchingPayload:v7 usingBlock:v15];

  int v9 = [v8 objectForKeyedSubscript:&unk_26CC19338];
  [(MPCPlayPerfMetrics *)self set_bagWaitTime:v9];

  uint64_t v10 = [v8 objectForKeyedSubscript:&unk_26CC19350];
  [(MPCPlayPerfMetrics *)self set_lookupWaitTime:v10];

  uint64_t v11 = [v8 objectForKeyedSubscript:&unk_26CC19368];
  [(MPCPlayPerfMetrics *)self set_leaseWaitTime:v11];

  uint64_t v12 = [v8 objectForKeyedSubscript:&unk_26CC19380];
  [(MPCPlayPerfMetrics *)self set_suzeLeaseWaitTime:v12];

  double v13 = [v8 objectForKeyedSubscript:&unk_26CC19398];
  [(MPCPlayPerfMetrics *)self set_subscriptionAssetLoadWaitTime:v13];

  uint64_t v14 = [v8 objectForKeyedSubscript:&unk_26CC193B0];
  [(MPCPlayPerfMetrics *)self set_mediaRedownloadWaitTime:v14];
}

void __54__MPCPlayPerfMetrics_addNetworkTimesWithScopedCursor___block_invoke(uint64_t a1, void *a2)
{
  id v24 = a2;
  v3 = [v24 payload];
  int v4 = [v3 objectForKeyedSubscript:@"queue-section-id"];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) sectionIdentifier];
  }
  uint64_t v7 = v6;

  id v8 = [v24 payload];
  int v9 = [v8 objectForKeyedSubscript:@"queue-item-id"];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) itemIdentifier];
  }
  uint64_t v12 = v11;

  double v13 = [*(id *)(a1 + 32) sectionIdentifier];
  if ([v7 isEqualToString:v13])
  {
    int v14 = [v12 isEqualToString:v12];

    if (!v14) {
      goto LABEL_11;
    }
    v15 = [v24 payload];
    double v13 = [v15 objectForKeyedSubscript:@"network-operation-type"];

    id v16 = [v24 payload];
    uint64_t v17 = [v16 objectForKeyedSubscript:@"network-metrics"];

    uint64_t v18 = NSNumber;
    double v19 = [*(id *)(a1 + 40) objectForKeyedSubscript:v13];
    [v19 doubleValue];
    double v21 = v20;
    [v17 networkTime];
    id v23 = [v18 numberWithDouble:v21 + v22];
    [*(id *)(a1 + 40) setObject:v23 forKeyedSubscript:v13];
  }
LABEL_11:
}

- (void)addSharePlayWithCursor:(id)a3
{
  id v8 = [a3 findPreviousEventWithType:@"session-begin" matchingPayload:0];
  int v4 = [v8 payload];
  id v5 = [v4 objectForKeyedSubscript:@"behavior-type"];
  uint64_t v6 = [v5 integerValue];

  uint64_t v7 = [NSNumber numberWithInt:v6 == 3];
  [(MPCPlayPerfMetrics *)self set_isSharePlay:v7];
}

- (void)addPlaybackBehaviorWithCursor:(id)a3
{
  int v4 = [a3 findPreviousEventWithType:@"playback-behavior-changed" matchingPayload:0];
  if (v4)
  {
    id v14 = v4;
    id v5 = [v4 payload];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"playback-behavior-metadata"];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"shuffle-type"];
    int v8 = [v7 intValue];

    int v9 = [NSNumber numberWithInt:v8 != 0];
    [(MPCPlayPerfMetrics *)self set_isShuffled:v9];

    uint64_t v10 = [v14 payload];
    id v11 = [v10 objectForKeyedSubscript:@"playback-behavior-metadata"];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"autoplay-mode"];
    LODWORD(v7) = [v12 intValue];

    double v13 = [NSNumber numberWithInt:v7 == 2];
    [(MPCPlayPerfMetrics *)self set_isAutoPlayEnabled:v13];

    int v4 = v14;
  }
}

- (void)addQueueMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"feature-name"];
  [(MPCPlayPerfMetrics *)self set_featureName:v5];

  id v6 = [v4 objectForKeyedSubscript:@"siri-ref-id"];

  [(MPCPlayPerfMetrics *)self set_siriRefId:v6];
}

- (id)jsonObject
{
  v119[3] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  id v4 = [(MPCPlayPerfMetrics *)self eventType];
  if (v4 == @"FirstItem"
    || (v5 = v4, int v6 = [(__CFString *)v4 isEqual:@"FirstItem"], v5, v5, v6))
  {
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    int v8 = [MEMORY[0x263EFF980] array];
    int v9 = [(MPCPlayPerfMetrics *)self setQueueCommandSendTime];
    uint64_t v10 = -[MPCPlayPerfMetrics _buildSegmentForComponent:subcomponent:duration:]((uint64_t)self, @"MRT", @"SendQueue", v9);

    id v11 = [(MPCPlayPerfMetrics *)self isRemoteSetQueue];
    -[MPCPlayPerfMetrics _addComplexityToSegment:complexity:when:]((uint64_t)self, v10, @"WHA", [v11 BOOLValue]);

    [v7 addObject:v10];
    uint64_t v12 = [(MPCPlayPerfMetrics *)self sessionActivationWaitTime];
    double v13 = -[MPCPlayPerfMetrics _buildSegmentForComponent:subcomponent:duration:]((uint64_t)self, @"AVT", @"SessionActivation", v12);

    id v14 = [(MPCPlayPerfMetrics *)self routeInfo];
    v15 = [v14 objectForKeyedSubscript:@"type"];
    uint64_t v16 = [v15 integerValue];

    -[MPCPlayPerfMetrics _addComplexityToSegment:complexity:when:]((uint64_t)self, v13, @"Bluetooth", (v16 & 0xFFFFFFFFFFFFFFFELL) == 4);
    -[MPCPlayPerfMetrics _addComplexityToSegment:complexity:when:]((uint64_t)self, v13, @"AirPlay", v16 == 9);
    uint64_t v17 = NSNumber;
    uint64_t v18 = [(MPCPlayPerfMetrics *)self sessionActivationWaitTime];
    [v18 doubleValue];
    double v20 = v19;
    double v21 = [(MPCPlayPerfMetrics *)self sessionActivationAVTime];
    [v21 doubleValue];
    double v23 = v20 - v22;
    id v24 = [(MPCPlayPerfMetrics *)self sessionActivationClientTime];
    [v24 doubleValue];
    v26 = [v17 numberWithDouble:v23 - v25];
    -[MPCPlayPerfMetrics _addStepToSegment:name:duration:options:]((uint64_t)self, v13, @"StackInit", v26, 0);

    v27 = [(MPCPlayPerfMetrics *)self sessionActivationAVTime];
    -[MPCPlayPerfMetrics _addStepToSegment:name:duration:options:]((uint64_t)self, v13, @"AVAudioSession", v27, 0);

    v28 = [(MPCPlayPerfMetrics *)self sessionActivationClientTime];
    [v28 doubleValue];
    double v30 = v29;

    if (v30 > 0.0)
    {
      v31 = [(MPCPlayPerfMetrics *)self sessionActivationClientTime];
      -[MPCPlayPerfMetrics _addStepToSegment:name:duration:options:]((uint64_t)self, v13, @"Delegate", v31, 0);
    }
    [v7 addObject:v13];

    v32 = [(MPCPlayPerfMetrics *)self queueLoadWaitTime];
    v33 = -[MPCPlayPerfMetrics _buildSegmentForComponent:subcomponent:duration:]((uint64_t)self, @"MPT", @"QueueLoad", v32);

    v34 = [(MPCPlayPerfMetrics *)self siriRefId];

    if (v34)
    {
      id v35 = [(MPCPlayPerfMetrics *)self assetSource];
      if ([v35 integerValue] <= 2)
      {
        -[MPCPlayPerfMetrics _addOptimizationToSegment:optimization:when:]((uint64_t)self, v33, @"SiriAssetInfo", 0);
      }
      else
      {
        uint64_t v36 = [(MPCPlayPerfMetrics *)self assetSource];
        -[MPCPlayPerfMetrics _addOptimizationToSegment:optimization:when:]((uint64_t)self, v33, @"SiriAssetInfo", [v36 integerValue] < 6);
      }
    }
    v40 = [(MPCPlayPerfMetrics *)self lookupWaitTime];
    -[MPCPlayPerfMetrics _addStepToSegment:name:duration:options:]((uint64_t)self, v33, @"Queue", v40, 1);

    [v7 addObject:v33];
    v41 = [(MPCPlayPerfMetrics *)self assetLoadWaitTime];
    v42 = -[MPCPlayPerfMetrics _buildSegmentForComponent:subcomponent:duration:]((uint64_t)self, @"MPT", @"AssetLoad", v41);

    id v43 = [(MPCPlayPerfMetrics *)self bagWaitTime];
    -[MPCPlayPerfMetrics _addStepToSegment:name:duration:options:]((uint64_t)self, v42, @"Bag", v43, 1);

    id v44 = [(MPCPlayPerfMetrics *)self leaseWaitTime];
    -[MPCPlayPerfMetrics _addStepToSegment:name:duration:options:]((uint64_t)self, v42, @"Lease", v44, 1);

    v45 = [(MPCPlayPerfMetrics *)self suzeLeaseWaitTime];
    -[MPCPlayPerfMetrics _addStepToSegment:name:duration:options:]((uint64_t)self, v42, @"SuzeLease", v45, 1);

    uint64_t v46 = [(MPCPlayPerfMetrics *)self subscriptionAssetLoadWaitTime];
    -[MPCPlayPerfMetrics _addStepToSegment:name:duration:options:]((uint64_t)self, v42, @"MZPlay: SubPlaybackDispatch", v46, 1);

    v47 = [(MPCPlayPerfMetrics *)self mediaRedownloadWaitTime];
    -[MPCPlayPerfMetrics _addStepToSegment:name:duration:options:]((uint64_t)self, v42, @"MZPlay: PaidRedownload", v47, 1);

    uint64_t v48 = [(MPCPlayPerfMetrics *)self hlsMetadataWaitTime];
    v49 = [(MPCPlayPerfMetrics *)self assetLocation];
    -[MPCPlayPerfMetrics _addStepToSegment:name:duration:options:]((uint64_t)self, v42, @"HLS MVP", v48, [v49 integerValue] == 0);

    v50 = [(MPCPlayPerfMetrics *)self assetLocation];
    uint64_t v51 = [v50 integerValue];

    if (v51)
    {
      if (v51 == 3)
      {
        v52 = @"Downloaded";
      }
      else
      {
        if (v51 != 1) {
          goto LABEL_21;
        }
        v52 = @"Cached";
      }
      v53 = self;
      v54 = v42;
      uint64_t v55 = 1;
    }
    else
    {
      v52 = @"Cached";
      v53 = self;
      v54 = v42;
      uint64_t v55 = 0;
    }
    -[MPCPlayPerfMetrics _addOptimizationToSegment:optimization:when:]((uint64_t)v53, v54, v52, v55);
LABEL_21:
    v56 = [(MPCPlayPerfMetrics *)self assetSource];
    uint64_t v57 = [v56 integerValue];

    if ((unint64_t)(v57 - 3) >= 3)
    {
      if (v57 != 6) {
        goto LABEL_29;
      }
      v61 = @"SOD";
      v62 = self;
      v63 = v42;
      uint64_t v64 = 0;
    }
    else
    {
      -[MPCPlayPerfMetrics _addOptimizationToSegment:optimization:when:]((uint64_t)self, v42, @"SOD", 1);
      v58 = [(MPCPlayPerfMetrics *)self assetSource];
      if ([v58 integerValue] != 5)
      {

LABEL_29:
        [v7 addObject:v42];

        v65 = [(MPCPlayPerfMetrics *)self readyToPlayStatusWaitTime];
        v66 = -[MPCPlayPerfMetrics _buildSegmentForComponent:subcomponent:duration:]((uint64_t)self, @"AVT", @"ReadyToPlay", v65);

        v67 = [(MPCPlayPerfMetrics *)self assetType];
        -[MPCPlayPerfMetrics _addComplexityToSegment:complexity:when:]((uint64_t)self, v66, @"HLS", [v67 integerValue] > 1);

        [v7 addObject:v66];
        uint64_t v68 = [(MPCPlayPerfMetrics *)self playCommandSendTime];
        v69 = -[MPCPlayPerfMetrics _buildSegmentForComponent:subcomponent:duration:]((uint64_t)self, @"MRT", @"SendPlay", v68);

        v70 = [(MPCPlayPerfMetrics *)self isRemoteSetQueue];
        -[MPCPlayPerfMetrics _addComplexityToSegment:complexity:when:]((uint64_t)self, v69, @"WHA", [v70 BOOLValue]);

        [v7 addObject:v69];
        v71 = [(MPCPlayPerfMetrics *)self rateChangeWaitTime];
        v72 = -[MPCPlayPerfMetrics _buildSegmentForComponent:subcomponent:duration:]((uint64_t)self, @"MPT", @"ChangeRate", v71);

        v73 = [(MPCPlayPerfMetrics *)self assetLocation];
        uint64_t v74 = [v73 integerValue];

        if (v74 == 3)
        {
          v75 = [(MPCPlayPerfMetrics *)self hasOfflinePlaybackKeys];
          -[MPCPlayPerfMetrics _addComplexityToSegment:complexity:when:]((uint64_t)self, v72, @"No Offline Slot", [v75 BOOLValue] ^ 1);
        }
        [v7 addObject:v72];

        v76 = [(MPCPlayPerfMetrics *)self firstAudioFrameWaitTime];
        v77 = -[MPCPlayPerfMetrics _buildSegmentForComponent:subcomponent:duration:]((uint64_t)self, @"AVT", @"FirstAudioFrame", v76);

        [v7 addObject:v77];
        v78 = [(MPCPlayPerfMetrics *)self endpointType];
        uint64_t v79 = [v78 integerValue];

        if ((unint64_t)(v79 - 1) <= 2) {
          [v8 addObject:off_2643C65C0[v79 - 1]];
        }
        v80 = [(MPCPlayPerfMetrics *)self assetType];
        unint64_t v81 = [v80 integerValue] - 1;
        if (v81 > 4) {
          v82 = @"Unspecified";
        }
        else {
          v82 = off_2643C65D8[v81];
        }
        [v8 addObject:v82];

        v83 = [(MPCPlayPerfMetrics *)self formatInfo];
        v84 = [v83 objectForKeyedSubscript:@"sampleRate"];
        uint64_t v85 = [v84 integerValue];

        if (v85 >= 1)
        {
          v86 = NSString;
          v87 = [(MPCPlayPerfMetrics *)self formatInfo];
          v88 = [v87 objectForKeyedSubscript:@"sampleRate"];
          v89 = objc_msgSend(v86, "stringWithFormat:", @"%ldKHz", objc_msgSend(v88, "integerValue") / 1000);
          [v8 addObject:v89];
        }
        v90 = [(MPCPlayPerfMetrics *)self formatInfo];
        v91 = [v90 objectForKeyedSubscript:@"bitrate"];
        uint64_t v92 = [v91 integerValue];

        if (v92 >= 1)
        {
          v93 = NSString;
          v94 = [(MPCPlayPerfMetrics *)self formatInfo];
          v95 = [v94 objectForKeyedSubscript:@"bitrate"];
          v96 = objc_msgSend(v93, "stringWithFormat:", @"%ldKbps", objc_msgSend(v95, "integerValue") / 1000);
          [v8 addObject:v96];
        }
        v97 = [(MPCPlayPerfMetrics *)self formatInfo];
        v98 = [v97 objectForKeyedSubscript:@"channelLayout"];
        uint64_t v99 = [v98 integerValue];

        if (v99)
        {
          v100 = [(MPCPlayPerfMetrics *)self formatInfo];
          v101 = [v100 objectForKeyedSubscript:@"channelLayout"];
          uint64_t v102 = (unsigned __int16)[v101 integerValue];

          v103 = objc_msgSend(NSString, "stringWithFormat:", @"%ldch", v102);
          [v8 addObject:v103];
        }
        v104 = [(MPCPlayPerfMetrics *)self assetProtectionType];
        uint64_t v105 = [v104 integerValue];

        if (v105)
        {
          if (v105 == 2)
          {
            v107 = [(MPCPlayPerfMetrics *)self assetType];
            uint64_t v108 = [v107 integerValue];

            if (v108 == 1)
            {
              v109 = [(MPCPlayPerfMetrics *)self assetSource];
              uint64_t v110 = [v109 integerValue];

              if (v110 == 5) {
                v106 = @"DRM:miniSINF";
              }
              else {
                v106 = @"DRM:SINF";
              }
            }
            else
            {
              v106 = @"DRM:FPS";
            }
          }
          else
          {
            if (v105 != 1)
            {
LABEL_53:
              v118[0] = @"name";
              v118[1] = @"segments";
              v119[0] = @"MPP";
              v119[1] = v7;
              v118[2] = @"tags";
              v119[2] = v8;
              v111 = [NSDictionary dictionaryWithObjects:v119 forKeys:v118 count:3];
              [v3 addObject:v111];

              goto LABEL_54;
            }
            v106 = @"DRM:Standard";
          }
        }
        else
        {
          v106 = @"DRM:None";
        }
        [v8 addObject:v106];
        goto LABEL_53;
      }
      v59 = [(MPCPlayPerfMetrics *)self assetType];
      uint64_t v60 = [v59 integerValue];

      if (v60 != 1) {
        goto LABEL_29;
      }
      v61 = @"miniSINF";
      v62 = self;
      v63 = v42;
      uint64_t v64 = 1;
    }
    -[MPCPlayPerfMetrics _addOptimizationToSegment:optimization:when:]((uint64_t)v62, v63, v61, v64);
    goto LABEL_29;
  }
  v37 = [(MPCPlayPerfMetrics *)self eventType];
  if (v37 == @"NextItem"
    || (v38 = v37,
        int v39 = [(__CFString *)v37 isEqual:@"NextItem"],
        v38,
        v38,
        v39))
  {
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    v116[0] = @"name";
    v116[1] = @"segments";
    v117[0] = @"GAP";
    v117[1] = v7;
    int v8 = [NSDictionary dictionaryWithObjects:v117 forKeys:v116 count:2];
    [v3 addObject:v8];
LABEL_54:
  }
  v114 = @"metrics";
  v115 = v3;
  v112 = [NSDictionary dictionaryWithObjects:&v115 forKeys:&v114 count:1];

  return v112;
}

- (id)_buildSegmentForComponent:(void *)a3 subcomponent:(void *)a4 duration:
{
  v19[6] = *MEMORY[0x263EF8340];
  if (a1)
  {
    int v6 = (void *)MEMORY[0x263EFF9A0];
    v18[0] = @"component";
    v18[1] = @"subcomponent";
    v19[0] = a2;
    v19[1] = a3;
    uint64_t v7 = &unk_26CC19728;
    if (a4) {
      uint64_t v7 = a4;
    }
    v19[2] = v7;
    void v18[2] = @"duration";
    v18[3] = @"complexities";
    int v8 = (void *)MEMORY[0x263EFF980];
    id v9 = a4;
    id v10 = a3;
    id v11 = a2;
    uint64_t v12 = [v8 array];
    v19[3] = v12;
    v18[4] = @"optimizations";
    double v13 = [MEMORY[0x263EFF9A0] dictionary];
    v19[4] = v13;
    v18[5] = @"steps";
    id v14 = [MEMORY[0x263EFF980] array];
    v19[5] = v14;
    v15 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:6];
    uint64_t v16 = [v6 dictionaryWithDictionary:v15];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (void)_addComplexityToSegment:(void *)a3 complexity:(int)a4 when:
{
  if (a1 && a4)
  {
    id v5 = a3;
    id v6 = [a2 objectForKeyedSubscript:@"complexities"];
    [v6 addObject:v5];
  }
}

- (void)_addStepToSegment:(void *)a3 name:(void *)a4 duration:(char)a5 options:
{
  v14[3] = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (a4)
    {
      id v8 = a4;
      id v9 = a3;
      id v10 = [a2 objectForKeyedSubscript:@"steps"];
      v13[0] = @"name";
      v13[1] = @"duration";
      v14[0] = v9;
      v14[1] = v8;
      v13[2] = @"isNetworkBound";
      id v11 = [NSNumber numberWithBool:a5 & 1];
      v14[2] = v11;
      uint64_t v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

      [v10 addObject:v12];
    }
  }
}

- (void)_addOptimizationToSegment:(void *)a3 optimization:(uint64_t)a4 when:
{
  if (a1)
  {
    id v6 = a3;
    id v8 = [a2 objectForKeyedSubscript:@"optimizations"];
    uint64_t v7 = [NSNumber numberWithBool:a4];
    [v8 setObject:v7 forKeyedSubscript:v6];
  }
}

- (id)description
{
  v3 = [(MPCPlayPerfMetrics *)self data];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [(MPCPlayPerfMetrics *)self musicTotalTime];
  [v4 setObject:v5 forKeyedSubscript:@"totalTime"];

  id v6 = [(MPCPlayPerfMetrics *)self musicWaitTime];
  [v4 setObject:v6 forKeyedSubscript:@"musicWaitTime"];

  uint64_t v7 = [(MPCPlayPerfMetrics *)self mediaPlayerTime];
  [v4 setObject:v7 forKeyedSubscript:@"mediaPlayerTime"];

  id v8 = [(MPCPlayPerfMetrics *)self avTime];
  [v4 setObject:v8 forKeyedSubscript:@"avTime"];

  id v9 = [(MPCPlayPerfMetrics *)self networkTime];
  [v4 setObject:v9 forKeyedSubscript:@"networkTime"];

  id v10 = [MEMORY[0x263F08900] dataWithJSONObject:v4 options:0 error:0];
  id v11 = (void *)[[NSString alloc] initWithData:v10 encoding:4];
  uint64_t v12 = [NSString stringWithFormat:@"<%@:%p %@>", objc_opt_class(), self, v11];

  return v12;
}

- (id)dictionaryRepresentation
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = (void *)[v2 copy];

  return v3;
}

- (NSNumber)avTime
{
  v3 = [(MPCPlayPerfMetrics *)self eventType];
  int v4 = [v3 isEqualToString:@"FirstItem"];

  if (v4)
  {
    id v5 = NSNumber;
    id v6 = [(MPCPlayPerfMetrics *)self readyToPlayStatusWaitTime];
    [v6 doubleValue];
    double v8 = v7;
    id v9 = [(MPCPlayPerfMetrics *)self firstAudioFrameWaitTime];
    [v9 doubleValue];
    double v11 = v8 + v10;
    uint64_t v12 = [(MPCPlayPerfMetrics *)self sessionActivationAVTime];
    [v12 doubleValue];
    id v14 = [v5 numberWithDouble:v11 + v13];
  }
  else
  {
    id v14 = 0;
  }

  return (NSNumber *)v14;
}

- (NSNumber)networkTime
{
  v3 = [(MPCPlayPerfMetrics *)self eventType];
  int v4 = [v3 isEqualToString:@"FirstItem"];

  if (v4)
  {
    id v5 = NSNumber;
    id v6 = [(MPCPlayPerfMetrics *)self lookupWaitTime];
    [v6 doubleValue];
    double v8 = v7;
    id v9 = [(MPCPlayPerfMetrics *)self bagWaitTime];
    [v9 doubleValue];
    double v11 = v8 + v10;
    uint64_t v12 = [(MPCPlayPerfMetrics *)self leaseWaitTime];
    [v12 doubleValue];
    double v14 = v11 + v13;
    v15 = [(MPCPlayPerfMetrics *)self suzeLeaseWaitTime];
    [v15 doubleValue];
    double v17 = v14 + v16;
    uint64_t v18 = [(MPCPlayPerfMetrics *)self subscriptionAssetLoadWaitTime];
    [v18 doubleValue];
    double v20 = v17 + v19;
    double v21 = [(MPCPlayPerfMetrics *)self mediaRedownloadWaitTime];
    [v21 doubleValue];
    double v23 = v20 + v22;
    id v24 = [(MPCPlayPerfMetrics *)self hlsMetadataWaitTime];
    [v24 doubleValue];
    v26 = [v5 numberWithDouble:v23 + v25];
  }
  else
  {
    v26 = 0;
  }

  return (NSNumber *)v26;
}

- (NSNumber)mediaPlayerTime
{
  v3 = [(MPCPlayPerfMetrics *)self eventType];
  int v4 = [v3 isEqualToString:@"FirstItem"];

  if (v4)
  {
    v41 = NSNumber;
    v45 = [(MPCPlayPerfMetrics *)self sessionActivationWaitTime];
    [v45 doubleValue];
    double v6 = v5;
    id v44 = [(MPCPlayPerfMetrics *)self queueLoadWaitTime];
    [v44 doubleValue];
    double v8 = v6 + v7;
    id v43 = [(MPCPlayPerfMetrics *)self assetLoadWaitTime];
    [v43 doubleValue];
    double v10 = v8 + v9;
    v42 = [(MPCPlayPerfMetrics *)self rateChangeWaitTime];
    [v42 doubleValue];
    double v12 = v10 + v11;
    double v13 = [(MPCPlayPerfMetrics *)self sessionActivationAVTime];
    [v13 doubleValue];
    double v15 = v12 - v14;
    double v16 = [(MPCPlayPerfMetrics *)self sessionActivationClientTime];
    [v16 doubleValue];
    double v18 = v15 - v17;
    double v19 = [(MPCPlayPerfMetrics *)self lookupWaitTime];
    [v19 doubleValue];
    double v21 = v18 - v20;
    double v22 = [(MPCPlayPerfMetrics *)self bagWaitTime];
    [v22 doubleValue];
    double v24 = v21 - v23;
    double v25 = [(MPCPlayPerfMetrics *)self leaseWaitTime];
    [v25 doubleValue];
    double v27 = v24 - v26;
    v28 = [(MPCPlayPerfMetrics *)self suzeLeaseWaitTime];
    [v28 doubleValue];
    double v30 = v27 - v29;
    v31 = [(MPCPlayPerfMetrics *)self subscriptionAssetLoadWaitTime];
    [v31 doubleValue];
    double v33 = v30 - v32;
    v34 = [(MPCPlayPerfMetrics *)self mediaRedownloadWaitTime];
    [v34 doubleValue];
    double v36 = v33 - v35;
    v37 = [(MPCPlayPerfMetrics *)self hlsMetadataWaitTime];
    [v37 doubleValue];
    int v39 = [v41 numberWithDouble:v36 - v38];
  }
  else
  {
    int v39 = 0;
  }

  return (NSNumber *)v39;
}

- (NSNumber)musicWaitTime
{
  v3 = [(MPCPlayPerfMetrics *)self eventType];
  int v4 = [v3 isEqualToString:@"FirstItem"];

  if (v4)
  {
    double v5 = [(MPCPlayPerfMetrics *)self playCommandWaitTime];

    if (v5)
    {
      double v6 = NSNumber;
      double v7 = [(MPCPlayPerfMetrics *)self playCommandSendTime];
      [v7 doubleValue];
      double v9 = v8;
      double v10 = [(MPCPlayPerfMetrics *)self rateChangeWaitTime];
      [v10 doubleValue];
      double v12 = v9 + v11;
      double v13 = [(MPCPlayPerfMetrics *)self firstAudioFrameWaitTime];
      [v13 doubleValue];
      double v15 = v12 + v14;
      double v16 = [(MPCPlayPerfMetrics *)self playCommandWaitTime];
      [v16 doubleValue];
      double v18 = v17;

      double v19 = 0.0;
      if (v18 <= 0.0) {
        double v19 = v18;
      }
      double v20 = [v6 numberWithDouble:v15 - v19];
    }
    else
    {
      double v20 = [(MPCPlayPerfMetrics *)self musicTotalTime];
    }
  }
  else
  {
    double v20 = 0;
  }

  return (NSNumber *)v20;
}

- (NSNumber)musicTotalTime
{
  v3 = [(MPCPlayPerfMetrics *)self eventType];
  int v4 = [v3 isEqualToString:@"FirstItem"];

  if (v4)
  {
    double v5 = NSNumber;
    double v6 = [(MPCPlayPerfMetrics *)self setQueueCommandSendTime];
    [v6 doubleValue];
    double v8 = v7;
    double v9 = [(MPCPlayPerfMetrics *)self sessionActivationWaitTime];
    [v9 doubleValue];
    double v11 = v8 + v10;
    double v12 = [(MPCPlayPerfMetrics *)self queueLoadWaitTime];
    [v12 doubleValue];
    double v14 = v11 + v13;
    double v15 = [(MPCPlayPerfMetrics *)self assetLoadWaitTime];
    [v15 doubleValue];
    double v17 = v14 + v16;
    double v18 = [(MPCPlayPerfMetrics *)self readyToPlayStatusWaitTime];
    [v18 doubleValue];
    double v20 = v17 + v19;
    double v21 = [(MPCPlayPerfMetrics *)self rateChangeWaitTime];
    [v21 doubleValue];
    double v23 = v20 + v22;
    double v24 = [(MPCPlayPerfMetrics *)self firstAudioFrameWaitTime];
    [v24 doubleValue];
    double v26 = v23 + v25;
    double v27 = [(MPCPlayPerfMetrics *)self sessionActivationClientTime];
    [v27 doubleValue];
    double v29 = [v5 numberWithDouble:v26 - v28];
  }
  else
  {
    double v29 = 0;
  }

  return (NSNumber *)v29;
}

- (MPCPlayPerfMetrics)init
{
  v5.receiver = self;
  v5.super_class = (Class)MPCPlayPerfMetrics;
  v2 = [(MPCPlayPerfMetrics *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF9A0] dictionary];
    [(MPCPlayPerfMetrics *)v2 setData:v3];
  }
  return v2;
}

- (void)set_checkpointFirstAudioFrame:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"checkpointFirstAudioFrame"];
}

- (NSNumber)checkpointFirstAudioFrame
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"checkpointFirstAudioFrame"];

  return (NSNumber *)v3;
}

- (void)set_checkpointRateOne:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"checkpointRateOne"];
}

- (NSNumber)checkpointRateOne
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"checkpointRateOne"];

  return (NSNumber *)v3;
}

- (void)set_checkpointReadyToPlay:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"checkpointReadyToPlay"];
}

- (NSNumber)checkpointReadyToPlay
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"checkpointReadyToPlay"];

  return (NSNumber *)v3;
}

- (void)set_checkpointLikelyToKeepUp:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"checkpointLikelyToKeepUp"];
}

- (NSNumber)checkpointLikelyToKeepUp
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"checkpointLikelyToKeepUp"];

  return (NSNumber *)v3;
}

- (void)set_checkpointAssetLoadEnd:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"checkpointAssetLoadEnd"];
}

- (NSNumber)checkpointAssetLoadEnd
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"checkpointAssetLoadEnd"];

  return (NSNumber *)v3;
}

- (void)set_checkpointAssetLoadBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"checkpointAssetLoadBegin"];
}

- (NSNumber)checkpointAssetLoadBegin
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"checkpointAssetLoadBegin"];

  return (NSNumber *)v3;
}

- (void)set_checkpointPlay:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"checkpointPlay"];
}

- (NSNumber)checkpointPlay
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"checkpointPlay"];

  return (NSNumber *)v3;
}

- (void)set_checkpointMRPlay:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"checkpointMRPlay"];
}

- (NSNumber)checkpointMRPlay
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"checkpointMRPlay"];

  return (NSNumber *)v3;
}

- (void)set_checkpointSetQueueEnd:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"checkpointSetQueueEnd"];
}

- (NSNumber)checkpointSetQueueEnd
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"checkpointSetQueueEnd"];

  return (NSNumber *)v3;
}

- (void)set_checkpointRateZero:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"checkpointRateZero"];
}

- (NSNumber)checkpointRateZero
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"checkpointRateZero"];

  return (NSNumber *)v3;
}

- (void)set_checkpointSetQueueBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"checkpointSetQueueBegin"];
}

- (NSNumber)checkpointSetQueueBegin
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"checkpointSetQueueBegin"];

  return (NSNumber *)v3;
}

- (void)set_checkpointMRSetQueueBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"checkpointMRSetQueueBegin"];
}

- (NSNumber)checkpointMRSetQueueBegin
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"checkpointMRSetQueueBegin"];

  return (NSNumber *)v3;
}

- (void)set_sessionActivationClientTime:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"sessionActivationClientTime"];
}

- (NSNumber)sessionActivationClientTime
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"sessionActivationClientTime"];

  return (NSNumber *)v3;
}

- (void)set_sessionActivationAVTime:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"sessionActivationAVTime"];
}

- (NSNumber)sessionActivationAVTime
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"sessionActivationAVTime"];

  return (NSNumber *)v3;
}

- (void)set_sessionActivationWaitTime:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"sessionActivationWaitTime"];
}

- (NSNumber)sessionActivationWaitTime
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"sessionActivationWaitTime"];

  return (NSNumber *)v3;
}

- (void)set_hlsMetadataWaitTime:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"hlsMetadataWaitTime"];
}

- (NSNumber)hlsMetadataWaitTime
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"hlsMetadataWaitTime"];

  return (NSNumber *)v3;
}

- (void)set_mediaRedownloadWaitTime:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"mediaRedownloadWaitTime"];
}

- (NSNumber)mediaRedownloadWaitTime
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"mediaRedownloadWaitTime"];

  return (NSNumber *)v3;
}

- (void)set_subscriptionAssetLoadWaitTime:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"subscriptionAssetLoadWaitTime"];
}

- (NSNumber)subscriptionAssetLoadWaitTime
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"subscriptionAssetLoadWaitTime"];

  return (NSNumber *)v3;
}

- (void)set_suzeLeaseWaitTime:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"suzeLeaseWaitTime"];
}

- (NSNumber)suzeLeaseWaitTime
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"suzeLeaseWaitTime"];

  return (NSNumber *)v3;
}

- (void)set_leaseWaitTime:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"leaseWaitTime"];
}

- (NSNumber)leaseWaitTime
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"leaseWaitTime"];

  return (NSNumber *)v3;
}

- (void)set_bagWaitTime:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"bagWaitTime"];
}

- (NSNumber)bagWaitTime
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"bagWaitTime"];

  return (NSNumber *)v3;
}

- (void)set_lookupWaitTime:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"lookupWaitTime"];
}

- (NSNumber)lookupWaitTime
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"lookupWaitTime"];

  return (NSNumber *)v3;
}

- (void)set_nextItemWaitTime:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"nextItemWaitTime"];
}

- (NSNumber)nextItemWaitTime
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"nextItemWaitTime"];

  return (NSNumber *)v3;
}

- (void)set_firstAudioFrameWaitTime:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"firstAudioFrameWaitTime"];
}

- (NSNumber)firstAudioFrameWaitTime
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"firstAudioFrameWaitTime"];

  return (NSNumber *)v3;
}

- (void)set_rateChangeWaitTime:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"rateChangeWaitTime"];
}

- (NSNumber)rateChangeWaitTime
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"rateChangeWaitTime"];

  return (NSNumber *)v3;
}

- (void)set_playCommandWaitTime:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"playCommandWaitTime"];
}

- (NSNumber)playCommandWaitTime
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"playCommandWaitTime"];

  return (NSNumber *)v3;
}

- (void)set_readyToPlayStatusWaitTime:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"readyToPlayStatusWaitTime"];
}

- (NSNumber)readyToPlayStatusWaitTime
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"readyToPlayStatusWaitTime"];

  return (NSNumber *)v3;
}

- (void)set_assetLoadWaitTime:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"assetLoadWaitTime"];
}

- (NSNumber)assetLoadWaitTime
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"assetLoadWaitTime"];

  return (NSNumber *)v3;
}

- (void)set_queueLoadWaitTime:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"queueLoadWaitTime"];
}

- (NSNumber)queueLoadWaitTime
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"queueLoadWaitTime"];

  return (NSNumber *)v3;
}

- (void)set_playCommandSendTime:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"playCommandSendTime"];
}

- (NSNumber)playCommandSendTime
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"playCommandSendTime"];

  return (NSNumber *)v3;
}

- (void)set_setQueueCommandSendTime:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"setQueueCommandSendTime"];
}

- (NSNumber)setQueueCommandSendTime
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"setQueueCommandSendTime"];

  return (NSNumber *)v3;
}

- (void)set_timeSincePaused:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"timeSincePaused"];
}

- (NSNumber)timeSincePaused
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"timeSincePaused"];

  return (NSNumber *)v3;
}

- (void)set_timeSinceLaunch:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"timeSinceLaunch"];
}

- (NSNumber)timeSinceLaunch
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"timeSinceLaunch"];

  return (NSNumber *)v3;
}

- (void)set_timeSinceBoot:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"timeSinceBoot"];
}

- (NSNumber)timeSinceBoot
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"timeSinceBoot"];

  return (NSNumber *)v3;
}

- (void)set_AVPlayerItemPerformanceMetrics:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"AVPlayerItemPerformanceMetrics"];
}

- (NSDictionary)AVPlayerItemPerformanceMetrics
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"AVPlayerItemPerformanceMetrics"];

  return (NSDictionary *)v3;
}

- (void)set_assetProtectionType:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"assetProtectionType"];
}

- (NSNumber)assetProtectionType
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"assetProtectionType"];

  return (NSNumber *)v3;
}

- (void)set_vocalsControlActive:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"vocalsControlActive"];
}

- (NSNumber)vocalsControlActive
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"vocalsControlActive"];

  return (NSNumber *)v3;
}

- (void)set_treatmentID:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"treatmentID"];
}

- (NSString)treatmentID
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"treatmentID"];

  return (NSString *)v3;
}

- (void)set_experimentID:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"experimentID"];
}

- (NSString)experimentID
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"experimentID"];

  return (NSString *)v3;
}

- (void)set_storefront:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"storefront"];
}

- (NSString)storefront
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"storefront"];

  return (NSString *)v3;
}

- (void)set_queueCommandType:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"queueCommandType"];
}

- (NSNumber)queueCommandType
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"queueCommandType"];

  return (NSNumber *)v3;
}

- (void)set_seekBeforePlaying:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"seekBeforePlaying"];
}

- (NSNumber)seekBeforePlaying
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"seekBeforePlaying"];

  return (NSNumber *)v3;
}

- (void)set_isActiveAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"isActiveAccount"];
}

- (NSNumber)isActiveAccount
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"isActiveAccount"];

  return (NSNumber *)v3;
}

- (void)set_hasAccountInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"hasAccountInfo"];
}

- (NSNumber)hasAccountInfo
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"hasAccountInfo"];

  return (NSNumber *)v3;
}

- (void)set_errorSignature:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"errorSignature"];
}

- (NSString)errorSignature
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"errorSignature"];

  return (NSString *)v3;
}

- (void)set_errorResolution:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"errorResolution"];
}

- (NSNumber)errorResolution
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"errorResolution"];

  return (NSNumber *)v3;
}

- (void)set_isReplacingPlayback:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"isReplacingPlayback"];
}

- (NSNumber)isReplacingPlayback
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"isReplacingPlayback"];

  return (NSNumber *)v3;
}

- (void)set_isFirstPlay:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"isFirstPlay"];
}

- (NSNumber)isFirstPlay
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"isFirstPlay"];

  return (NSNumber *)v3;
}

- (void)set_networkType:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"networkType"];
}

- (NSNumber)networkType
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"networkType"];

  return (NSNumber *)v3;
}

- (void)set_routeInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"routeInfo"];
}

- (NSDictionary)routeInfo
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"routeInfo"];

  return (NSDictionary *)v3;
}

- (void)set_formatInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"formatInfo"];
}

- (NSDictionary)formatInfo
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"formatInfo"];

  return (NSDictionary *)v3;
}

- (void)set_hasOfflinePlaybackKeys:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"hasOfflinePlaybackKeys"];
}

- (NSNumber)hasOfflinePlaybackKeys
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"hasOfflinePlaybackKeys"];

  return (NSNumber *)v3;
}

- (void)set_hasOnlinePlaybackKeys:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"hasOnlinePlaybackKeys"];
}

- (NSNumber)hasOnlinePlaybackKeys
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"hasOnlinePlaybackKeys"];

  return (NSNumber *)v3;
}

- (void)set_isDelegatedPlayback:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"isDelegatedPlayback"];
}

- (NSNumber)isDelegatedPlayback
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"isDelegatedPlayback"];

  return (NSNumber *)v3;
}

- (void)set_subscriptionType:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"subscriptionType"];
}

- (NSNumber)subscriptionType
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"subscriptionType"];

  return (NSNumber *)v3;
}

- (void)set_endpointType:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"endpointType"];
}

- (NSNumber)endpointType
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"endpointType"];

  return (NSNumber *)v3;
}

- (void)set_assetCacheAge:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"assetCacheAge"];
}

- (NSNumber)assetCacheAge
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"assetCacheAge"];

  return (NSNumber *)v3;
}

- (void)set_assetLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"assetLocation"];
}

- (NSNumber)assetLocation
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"assetLocation"];

  return (NSNumber *)v3;
}

- (void)set_assetSource:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"assetSource"];
}

- (NSNumber)assetSource
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"assetSource"];

  return (NSNumber *)v3;
}

- (void)set_assetType:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"assetType"];
}

- (NSNumber)assetType
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"assetType"];

  return (NSNumber *)v3;
}

- (void)set_isSharePlay:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"isSharePlay"];
}

- (NSNumber)isSharePlay
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"isSharePlay"];

  return (NSNumber *)v3;
}

- (void)set_isAutoPlayEnabled:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"isAutoPlayEnabled"];
}

- (NSNumber)isAutoPlayEnabled
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"isAutoPlayEnabled"];

  return (NSNumber *)v3;
}

- (void)set_isShuffled:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"isShuffled"];
}

- (NSNumber)isShuffled
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"isShuffled"];

  return (NSNumber *)v3;
}

- (void)set_isRemoteSetQueue:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"isRemoteSetQueue"];
}

- (NSNumber)isRemoteSetQueue
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"isRemoteSetQueue"];

  return (NSNumber *)v3;
}

- (void)set_queueType:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"queueType"];
}

- (NSString)queueType
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"queueType"];

  return (NSString *)v3;
}

- (void)set_siriRefId:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"siriRefId"];
}

- (NSString)siriRefId
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"siriRefId"];

  return (NSString *)v3;
}

- (void)set_featureName:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"featureName"];
}

- (NSString)featureName
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"featureName"];

  return (NSString *)v3;
}

- (void)set_itemMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"itemMetadata"];
}

- (NSDictionary)itemMetadata
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"itemMetadata"];

  return (NSDictionary *)v3;
}

- (void)set_itemIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"itemIdentifier"];
}

- (NSString)itemIdentifier
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"itemIdentifier"];

  return (NSString *)v3;
}

- (void)set_sectionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"sectionIdentifier"];
}

- (NSString)sectionIdentifier
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"sectionIdentifier"];

  return (NSString *)v3;
}

- (void)set_eventTime:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"eventTime"];
}

- (NSNumber)eventTime
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"eventTime"];

  return (NSNumber *)v3;
}

- (void)set_eventType:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCPlayPerfMetrics *)self data];
  [v5 setObject:v4 forKeyedSubscript:@"eventType"];
}

- (NSString)eventType
{
  v2 = [(MPCPlayPerfMetrics *)self data];
  v3 = [v2 objectForKeyedSubscript:@"eventType"];

  return (NSString *)v3;
}

+ (id)playMetricsWithErrorSignature:(id)a3 event:(id)a4 cursor:(id)a5
{
  v71[2] = *MEMORY[0x263EF8340];
  id v44 = a3;
  id v7 = a4;
  id v8 = a5;
  double v9 = [v7 payload];
  double v10 = [v9 objectForKeyedSubscript:@"queue-section-id"];

  double v11 = [v7 payload];
  v47 = [v11 objectForKeyedSubscript:@"queue-item-id"];

  v45 = 0;
  if (v10 && v47)
  {
    v70[0] = @"queue-section-id";
    v70[1] = @"queue-item-id";
    v71[0] = v10;
    v71[1] = v47;
    v45 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
  }
  uint64_t v46 = [v8 findPreviousEventWithType:@"queue-add" matchingPayload:0];
  if (v46)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v68 = __Block_byref_object_copy__32062;
    *(void *)&long long v69 = __Block_byref_object_dispose__32063;
    *((void *)&v69 + 1) = 0;
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__32062;
    v53 = __Block_byref_object_dispose__32063;
    id v54 = 0;
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __65__MPCPlayPerfMetrics_playMetricsWithErrorSignature_event_cursor___block_invoke;
    v48[3] = &unk_2643C6270;
    v48[4] = buf;
    v48[5] = &v49;
    [v8 enumeratePreviousEventsWithType:@"remote-control-begin" usingBlock:v48];
    id v12 = (id)v50[5];
    if (!v12)
    {
      double v32 = [v8 findPreviousEventWithType:@"session-begin" matchingPayload:0];
      double v33 = [v32 payload];
      v34 = [v33 objectForKeyedSubscript:@"session-id"];

      if (!v34)
      {

        id v12 = 0;
        goto LABEL_17;
      }
      v65 = @"session-id";
      v66 = v34;
      double v35 = [NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
      id v12 = [v8 findPreviousEventWithType:@"session-restore-begin" matchingPayload:v35];

      if (!v12) {
        goto LABEL_17;
      }
    }
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      double v13 = [v8 cursorFromEvent:v7 untilEvent:v12];
      double v14 = objc_alloc_init(MPCPlayPerfMetrics);
      [(MPCPlayPerfMetrics *)v14 set_eventType:@"PlayError"];
      double v15 = NSNumber;
      double v16 = [v7 date];
      [v16 timeIntervalSince1970];
      double v17 = objc_msgSend(v15, "numberWithDouble:");
      [(MPCPlayPerfMetrics *)v14 set_eventTime:v17];

      [(MPCPlayPerfMetrics *)v14 set_sectionIdentifier:v10];
      [(MPCPlayPerfMetrics *)v14 set_itemIdentifier:v47];
      double v18 = [v46 payload];
      id v43 = [v18 objectForKeyedSubscript:@"queue-reporting-metadata"];

      [(MPCPlayPerfMetrics *)v14 addQueueMetadata:v43];
      [(MPCPlayPerfMetrics *)v14 addPlaybackBehaviorWithCursor:v13];
      [(MPCPlayPerfMetrics *)v14 addSharePlayWithCursor:v13];
      [(MPCPlayPerfMetrics *)v14 addEnvironmentInfoWithCursor:v8];
      if (v45)
      {
        [(MPCPlayPerfMetrics *)v14 addAssetSelectionWithCursor:v13 itemIDPayload:v45];
        uint64_t v55 = @"queue-section-id";
        v56 = v10;
        double v19 = [NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
        v41 = [v8 findPreviousEventWithType:@"container-begin" matchingPayload:v19];

        v42 = [v8 findPreviousEventWithType:@"item-begin" matchingPayload:v45];
        double v20 = [v42 payload];
        double v21 = [v20 objectForKeyedSubscript:@"item-metadata"];
        [(MPCPlayPerfMetrics *)v14 set_itemMetadata:v21];

        double v22 = [v41 payload];
        v40 = [v22 objectForKeyedSubscript:@"container-kind"];

        double v23 = [v42 payload];
        int v39 = [v23 objectForKeyedSubscript:@"item-kind"];

        double v24 = NSString;
        double v25 = [v43 objectForKeyedSubscript:@"playback-context-class-name"];
        double v26 = NSStringFromClass((Class)[v40 modelClass]);
        double v27 = NSStringFromClass((Class)[v39 modelClass]);
        double v28 = [v24 stringWithFormat:@"%@-%@-%@", v25, v26, v27];
        [(MPCPlayPerfMetrics *)v14 set_queueType:v28];
      }
      [(MPCPlayPerfMetrics *)v14 set_errorSignature:v44];

LABEL_20:
      _Block_object_dispose(&v49, 8);

      _Block_object_dispose(buf, 8);
      goto LABEL_21;
    }
LABEL_17:
    double v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      double v36 = [v7 type];
      v37 = [v7 identifier];
      *(_DWORD *)uint64_t v57 = 138413058;
      v58 = v36;
      __int16 v59 = 2114;
      uint64_t v60 = v37;
      __int16 v61 = 2114;
      v62 = v10;
      __int16 v63 = 2114;
      uint64_t v64 = v47;
      _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_ERROR, "%@ event doesn't have recognizable preceding SetPlaybackQueue and Play events (eventID:%{public}@ item:%{public}@ %{public}@)", v57, 0x2Au);
    }
    double v14 = 0;
    goto LABEL_20;
  }
  double v29 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    double v30 = [v7 type];
    v31 = [v7 identifier];
    *(_DWORD *)buf = 138413058;
    *(void *)&buf[4] = v30;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v31;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v68 = v10;
    LOWORD(v69) = 2114;
    *(void *)((char *)&v69 + 2) = v47;
    _os_log_impl(&dword_21BB87000, v29, OS_LOG_TYPE_ERROR, "%@ event doesn't have preceding QueueAdd event (eventID:%{public}@ item:%{public}@ %{public}@)", buf, 0x2Au);
  }
  double v14 = 0;
LABEL_21:

  return v14;
}

void __65__MPCPlayPerfMetrics_playMetricsWithErrorSignature_event_cursor___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v15 = a2;
  double v6 = [v15 payload];
  id v7 = [v6 objectForKeyedSubscript:@"remote-control-type"];
  unsigned int v8 = [v7 intValue];

  unsigned int v9 = v8 - 121;
  if ((v8 - 121 > 0xC || ((1 << (v8 - 121)) & 0x1003) == 0) && (v8 & 0xFFFFFFFD) != 0)
  {
    if (v8 <= 0x1A && ((1 << v8) & 0x7080000) != 0 || v8 == 132 || v8 == 135) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v14 = *(void *)(v12 + 40);
  double v13 = (id *)(v12 + 40);
  if (!v14) {
    objc_storeStrong(v13, a2);
  }
  if (v9 <= 0xC && ((1 << v9) & 0x1003) != 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
LABEL_14:
    *a3 = 1;
  }
LABEL_15:
}

+ (id)playMetricsWithItemReadyForMetricsEvent:(id)a3 cursor:(id)a4
{
  v323[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v261 = v7;
  unsigned int v9 = [v7 payload];
  double v10 = [v9 objectForKeyedSubscript:@"queue-section-id"];

  double v11 = [v7 payload];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"queue-item-id"];

  if (v10)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v237 = [MEMORY[0x263F08690] currentHandler];
    [v237 handleFailureInMethod:a2 object:a1 file:@"MPCPlayPerfMetrics.m" lineNumber:321 description:@"Section identifier in first audio frame event can't be nil"];

    if (v12) {
      goto LABEL_3;
    }
  }
  v238 = [MEMORY[0x263F08690] currentHandler];
  [v238 handleFailureInMethod:a2 object:a1 file:@"MPCPlayPerfMetrics.m" lineNumber:322 description:@"Item identifier in first audio frame event can't be nil"];

LABEL_3:
  v322[0] = @"queue-section-id";
  v322[1] = @"queue-item-id";
  v323[0] = v10;
  v323[1] = v12;
  v263 = [NSDictionary dictionaryWithObjects:v323 forKeys:v322 count:2];
  v262 = [v8 findPreviousEventWithType:@"item-first-audio-frame" matchingPayload:v263];
  if (v262)
  {
    v260 = [v8 cursorFromEvent:v262 untilEvent:0];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v319 = __Block_byref_object_copy__32062;
    v320 = __Block_byref_object_dispose__32063;
    id v321 = 0;
    uint64_t v290 = 0;
    v291 = &v290;
    uint64_t v292 = 0x3032000000;
    v293 = __Block_byref_object_copy__32062;
    v294 = __Block_byref_object_dispose__32063;
    id v295 = 0;
    v289[0] = MEMORY[0x263EF8330];
    v289[1] = 3221225472;
    v289[2] = __69__MPCPlayPerfMetrics_playMetricsWithItemReadyForMetricsEvent_cursor___block_invoke;
    v289[3] = &unk_2643C6270;
    v289[4] = buf;
    v289[5] = &v290;
    [v260 enumeratePreviousEventsWithType:@"remote-control-begin" usingBlock:v289];
    id v13 = (id)v291[5];
    v259 = [v260 findPreviousEventWithType:@"asset-load-begin" matchingPayload:v263];
    if (!v13 && v259)
    {
      uint64_t v14 = [v260 findPreviousEventWithType:@"session-begin" matchingPayload:0];
      id v15 = [v14 payload];
      double v16 = [v15 objectForKeyedSubscript:@"session-id"];

      if (v16)
      {
        v316 = @"session-id";
        v317 = v16;
        double v17 = [NSDictionary dictionaryWithObjects:&v317 forKeys:&v316 count:1];
        id v13 = [v260 findPreviousEventWithType:@"session-restore-begin" matchingPayload:v17];

        if ([v13 compare:v259] == -1)
        {
          double v18 = [v260 cursorFromEvent:v259 untilEvent:v13];
          v314 = @"queue-section-id";
          v315 = v10;
          double v19 = [NSDictionary dictionaryWithObjects:&v315 forKeys:&v314 count:1];
          double v20 = [v18 findPreviousEventWithType:@"queue-load-end" matchingPayload:v19];

          if (v20)
          {
            id v21 = v20;

            v259 = v21;
          }
        }
      }
      else
      {
        id v13 = 0;
      }
    }
    v257 = v13;
    if (!v13 || !v259 || !*(void *)(*(void *)&buf[8] + 40))
    {
      log = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        uint64_t v85 = [v7 identifier];
        *(_DWORD *)v310 = 138543874;
        *(void *)&v310[4] = v85;
        *(_WORD *)&v310[12] = 2114;
        *(void *)&v310[14] = v10;
        *(_WORD *)&v310[22] = 2114;
        v311 = v12;
        _os_log_impl(&dword_21BB87000, log, OS_LOG_TYPE_ERROR, "ItemReadyForMetricsEvent event doesn't have recognizable preceding SetPlaybackQueue and Play events (eventID:%{public}@ item:%{public}@ %{public}@)", v310, 0x20u);
      }
      double v24 = 0;
      goto LABEL_127;
    }
    double v25 = [v260 cursorFromEvent:v262 untilEvent:v13];
    v252 = (void *)[v25 countOfPreviousEventsWithType:@"item-first-audio-frame" matchingPayload:0];
    *(void *)v310 = 0;
    *(void *)&v310[8] = v310;
    *(void *)&v310[16] = 0x3032000000;
    v311 = __Block_byref_object_copy__32062;
    v312 = __Block_byref_object_dispose__32063;
    id v313 = 0;
    v288[0] = MEMORY[0x263EF8330];
    v288[1] = 3221225472;
    v288[2] = __69__MPCPlayPerfMetrics_playMetricsWithItemReadyForMetricsEvent_cursor___block_invoke_265;
    v288[3] = &unk_2643C62C8;
    v288[4] = v310;
    log = v25;
    [v25 enumeratePreviousEventsWithType:@"queue-add" usingBlock:v288];
    if (!*(void *)(*(void *)&v310[8] + 40))
    {
      v86 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        v87 = [v262 identifier];
        *(_DWORD *)v300 = 138543874;
        *(void *)&v300[4] = v87;
        *(_WORD *)&v300[12] = 2114;
        *(void *)&v300[14] = v10;
        *(_WORD *)&v300[22] = 2114;
        v301 = v12;
        _os_log_impl(&dword_21BB87000, v86, OS_LOG_TYPE_ERROR, "ItemReadyForMetricsEvent event doesn't have preceding QueueAdd event (eventID:%{public}@ item:%{public}@ %{public}@)", v300, 0x20u);
      }
      double v24 = 0;
      goto LABEL_126;
    }
    double v26 = objc_alloc_init(MPCPlayPerfMetrics);
    double v27 = v26;
    if (v252) {
      double v28 = @"NextItem";
    }
    else {
      double v28 = @"FirstItem";
    }
    [(MPCPlayPerfMetrics *)v26 set_eventType:v28];
    double v29 = NSNumber;
    double v30 = [v262 date];
    [v30 timeIntervalSince1970];
    v31 = objc_msgSend(v29, "numberWithDouble:");
    [(MPCPlayPerfMetrics *)v27 set_eventTime:v31];

    [(MPCPlayPerfMetrics *)v27 set_sectionIdentifier:v10];
    [(MPCPlayPerfMetrics *)v27 set_itemIdentifier:v12];
    double v32 = [(id)v291[5] payload];
    double v33 = [v32 objectForKeyedSubscript:@"remote-control-options"];
    v34 = [v33 objectForKeyedSubscript:*MEMORY[0x263F54D00]];
    [(MPCPlayPerfMetrics *)v27 set_isRemoteSetQueue:v34];

    double v35 = [(id)v291[5] payload];
    double v36 = [v35 objectForKeyedSubscript:@"remote-control-type"];
    [(MPCPlayPerfMetrics *)v27 set_queueCommandType:v36];

    v37 = [*(id *)(*(void *)&v310[8] + 40) payload];
    v255 = [v37 objectForKeyedSubscript:@"queue-reporting-metadata"];

    [(MPCPlayPerfMetrics *)v27 addQueueMetadata:v255];
    [(MPCPlayPerfMetrics *)v27 addPlaybackBehaviorWithCursor:log];
    [(MPCPlayPerfMetrics *)v27 addSharePlayWithCursor:log];
    [(MPCPlayPerfMetrics *)v27 addEnvironmentInfoWithCursor:v260];
    [(MPCPlayPerfMetrics *)v27 addAssetSelectionWithCursor:log itemIDPayload:v263];
    v308 = @"queue-section-id";
    v309 = v10;
    double v38 = [NSDictionary dictionaryWithObjects:&v309 forKeys:&v308 count:1];
    v251 = [v260 findPreviousEventWithType:@"container-begin" matchingPayload:v38];

    int v39 = [v260 findPreviousEventWithType:@"item-begin" matchingPayload:v263];
    if (!v39)
    {
      v40 = (void *)MEMORY[0x263F54EC8];
      v307[0] = v10;
      v307[1] = v12;
      v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v307 count:2];
      [v40 snapshotWithDomain:*MEMORY[0x263F54E80] type:@"Bug" subType:@"FirstAudioFrameBug" context:@"FirstAudioFrameBeforeItemBegin" triggerThresholdValues:0 events:v41 completion:0];
    }
    v42 = [v39 payload];
    id v43 = [v42 objectForKeyedSubscript:@"item-metadata"];
    [(MPCPlayPerfMetrics *)v27 set_itemMetadata:v43];
    v250 = v39;

    id v44 = [v251 payload];
    v249 = [v44 objectForKeyedSubscript:@"container-kind"];

    v45 = [v39 payload];
    v248 = [v45 objectForKeyedSubscript:@"item-kind"];

    uint64_t v46 = NSString;
    v47 = [v255 objectForKeyedSubscript:@"playback-context-class-name"];
    uint64_t v48 = NSStringFromClass((Class)[v249 modelClass]);
    uint64_t v49 = NSStringFromClass((Class)[v248 modelClass]);
    v50 = [v46 stringWithFormat:@"%@-%@-%@", v47, v48, v49];
    [(MPCPlayPerfMetrics *)v27 set_queueType:v50];

    v256 = [log findPreviousEventWithType:@"item-resume" matchingPayload:v263];
    uint64_t v51 = NSNumber;
    v52 = [v256 payload];
    v53 = [v52 objectForKeyedSubscript:@"item-start-position"];
    [v53 doubleValue];
    uint64_t v55 = [v51 numberWithInt:v54 > 0.0];
    [(MPCPlayPerfMetrics *)v27 set_seekBeforePlaying:v55];

    v56 = [v256 payload];
    uint64_t v57 = [v56 objectForKeyedSubscript:@"supports-vocal-attenuation"];
    LODWORD(v52) = [v57 BOOLValue];

    v58 = [v256 payload];
    __int16 v59 = [v58 objectForKeyedSubscript:@"vocal-attenuation-available"];
    LODWORD(v53) = [v59 BOOLValue];

    uint64_t v60 = [v256 payload];
    __int16 v61 = [v60 objectForKeyedSubscript:@"vocal-attenuation-enabled"];
    v62 = (void *)[v61 BOOLValue];

    __int16 v63 = [v256 payload];
    uint64_t v64 = [v63 objectForKeyedSubscript:@"vocal-attenuation-configured"];
    LODWORD(v61) = [v64 BOOLValue];

    v65 = [NSNumber numberWithInt:v52 & v61 & v53 & v62];
    [(MPCPlayPerfMetrics *)v27 set_vocalsControlActive:v65];

    v66 = [v261 payload];
    v254 = [v66 objectForKeyedSubscript:@"av-player-item-performance-metrics"];

    if (v254)
    {
      v67 = [v254 dataUsingEncoding:4];
      uint64_t v68 = [MEMORY[0x263F08900] JSONObjectWithData:v67 options:0 error:0];
      [(MPCPlayPerfMetrics *)v27 set_AVPlayerItemPerformanceMetrics:v68];
    }
    long long v69 = objc_msgSend(NSNumber, "numberWithDouble:", (double)(unint64_t)objc_msgSend(v262, "monotonicTimeNanoSeconds") / 1000000000.0);
    [(MPCPlayPerfMetrics *)v27 set_timeSinceBoot:v69];

    v70 = NSNumber;
    v71 = [v262 date];
    [v71 timeIntervalSince1970];
    double v73 = v72;
    MSVGetProcessLaunchTime();
    v75 = [v70 numberWithDouble:v73 - v74];
    [(MPCPlayPerfMetrics *)v27 set_timeSinceLaunch:v75];

    if (v252)
    {
      v76 = [log findPreviousEventWithType:@"item-end" matchingPayload:0];
      v77 = v76;
      if (!v76) {
        v77 = *(void **)(*(void *)&buf[8] + 40);
      }
      id v78 = v77;

      uint64_t v79 = [v262 payload];
      v80 = [v79 objectForKeyedSubscript:@"event-time-offset"];
      [v80 doubleValue];
      double v82 = v81;

      [v262 durationSinceEvent:v78];
      v84 = objc_msgSend(NSNumber, "numberWithDouble:", fmax(v82 + v83, 0.0));
      [(MPCPlayPerfMetrics *)v27 set_nextItemWaitTime:v84];
LABEL_125:

      v86 = v27;
      double v24 = v86;
LABEL_126:

      _Block_object_dispose(v310, 8);
LABEL_127:

      _Block_object_dispose(&v290, 8);
      _Block_object_dispose(buf, 8);

      id v8 = v260;
      goto LABEL_128;
    }
    v88 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v260, "countOfPreviousEventsWithType:matchingPayload:", @"item-first-audio-frame", 0) == 0);
    [(MPCPlayPerfMetrics *)v27 set_isFirstPlay:v88];

    v89 = [log findPreviousEventWithType:@"item-end" matchingPayload:0];
    id v78 = v89;
    v90 = NSNumber;
    if (v89)
    {
      v70 = [v89 payload];
      v71 = [v70 objectForKeyedSubscript:@"item-did-play-to-end"];
      if ([v71 BOOLValue])
      {
        int v91 = 0;
        BOOL v92 = 0;
      }
      else
      {
        v62 = [v78 payload];
        v252 = [v62 objectForKeyedSubscript:@"item-end-position"];
        [v252 doubleValue];
        BOOL v92 = v93 > 0.0;
        int v91 = 1;
      }
    }
    else
    {
      int v91 = 0;
      BOOL v92 = 0;
    }
    v94 = [v90 numberWithInt:v92];
    [(MPCPlayPerfMetrics *)v27 set_isReplacingPlayback:v94];

    if (v91)
    {
    }
    if (v78)
    {
    }
    v245 = [log findPreviousEventWithType:@"error-resolution" matchingPayload:0];
    if (v245)
    {
      v95 = [v245 payload];
      v96 = [v95 objectForKeyedSubscript:@"resolution-type"];
      [(MPCPlayPerfMetrics *)v27 set_errorResolution:v96];

      v97 = [v245 payload];
      v98 = [v97 objectForKeyedSubscript:@"error-for-resolution"];

      if (v98)
      {
        uint64_t v99 = objc_msgSend(v98, "msv_analyticSignature");
        [(MPCPlayPerfMetrics *)v27 set_errorSignature:v99];
      }
    }
    v100 = [*(id *)(*(void *)&v310[8] + 40) payload];
    v244 = [v100 objectForKeyedSubscript:@"account-id"];

    v306[0] = @"account-begin";
    v306[1] = @"account-update";
    v101 = [MEMORY[0x263EFF8C0] arrayWithObjects:v306 count:2];
    if (v244)
    {
      v304 = @"account-id";
      v305 = v244;
      uint64_t v102 = [NSDictionary dictionaryWithObjects:&v305 forKeys:&v304 count:1];
    }
    else
    {
      uint64_t v102 = 0;
    }
    v247 = [v260 findPreviousEventWithTypes:v101 matchingPayload:v102];
    if (v244) {

    }
    v103 = [NSNumber numberWithInt:v247 != 0];
    [(MPCPlayPerfMetrics *)v27 set_hasAccountInfo:v103];

    if (v247)
    {
      v104 = [v247 payload];
      uint64_t v105 = [v104 objectForKeyedSubscript:@"account-metadata"];
      v106 = [v105 objectForKeyedSubscript:@"active"];
      [(MPCPlayPerfMetrics *)v27 set_isActiveAccount:v106];

      v107 = [v247 payload];
      uint64_t v108 = [v107 objectForKeyedSubscript:@"account-metadata"];
      v109 = [v108 objectForKeyedSubscript:@"subscription-status"];

      if (v109)
      {
        uint64_t v110 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v109, "statusType"));
        [(MPCPlayPerfMetrics *)v27 set_subscriptionType:v110];
      }
      v111 = [v247 payload];
      v112 = [v111 objectForKeyedSubscript:@"account-metadata"];
      v113 = [v112 objectForKeyedSubscript:@"store-front-id"];
      [(MPCPlayPerfMetrics *)v27 set_storefront:v113];
    }
    [(MPCPlayPerfMetrics *)v27 addNetworkTimesWithScopedCursor:log];
    [(MPCPlayPerfMetrics *)v27 addSessionActivationTimesWithScopedCursor:log];
    id v114 = (id)v291[5];
    v115 = [v114 payload];
    v116 = [v115 objectForKeyedSubscript:@"remote-control-options"];
    uint64_t v240 = *MEMORY[0x263F54C68];
    v117 = objc_msgSend(v116, "objectForKeyedSubscript:");

    if (v117)
    {
      v118 = [v114 date];
      [v118 timeIntervalSinceReferenceDate];
      double v120 = v119;
      [v117 doubleValue];
      double v122 = v121;

      double v123 = v120 - v122;
      if (v120 - v122 <= 0.0)
      {
LABEL_63:
        v124 = NSNumber;
        objc_msgSend(v259, "durationSinceEvent:", v257, v123);
        double v126 = v125;
        v127 = [(MPCPlayPerfMetrics *)v27 sessionActivationWaitTime];
        [v127 doubleValue];
        v129 = [v124 numberWithDouble:v126 - v128];
        [(MPCPlayPerfMetrics *)v27 set_queueLoadWaitTime:v129];

        id v130 = *(id *)(*(void *)&buf[8] + 40);
        v131 = [v130 payload];
        v132 = [v131 objectForKeyedSubscript:@"remote-control-options"];
        v133 = [v132 objectForKeyedSubscript:v240];

        if (v133)
        {
          v134 = [v130 date];
          [v134 timeIntervalSinceReferenceDate];
          double v136 = v135;
          [v133 doubleValue];
          double v138 = v137;

          double v139 = v136 - v138;
        }
        else
        {
          double v139 = 0.0;
        }

        if (v291[5] != *(void *)(*(void *)&buf[8] + 40))
        {
          v140 = [NSNumber numberWithDouble:v139];
          [(MPCPlayPerfMetrics *)v27 set_playCommandSendTime:v140];
        }
        v246 = [log findPreviousEventWithType:@"asset-load-begin" matchingPayload:v263];
        v242 = [log findPreviousEventWithType:@"asset-load-end" matchingPayload:v263];
        v253 = [log findPreviousEventWithType:@"item-ready-to-play" matchingPayload:v263];
        if (v246 && v242 && v253)
        {
          v141 = NSNumber;
          [v242 durationSinceEvent:v246];
          v142 = objc_msgSend(v141, "numberWithDouble:");
          [(MPCPlayPerfMetrics *)v27 set_assetLoadWaitTime:v142];

          v143 = NSNumber;
          [v253 durationSinceEvent:v242];
          v144 = objc_msgSend(v143, "numberWithDouble:");
          [(MPCPlayPerfMetrics *)v27 set_readyToPlayStatusWaitTime:v144];

          v145 = *(void **)(*(void *)&buf[8] + 40);
          if (v145 != (void *)v291[5])
          {
            v146 = NSNumber;
            [v145 durationSinceEvent:v253];
            v147 = objc_msgSend(v146, "numberWithDouble:");
            [(MPCPlayPerfMetrics *)v27 set_playCommandWaitTime:v147];

            v145 = (void *)v291[5];
          }
          v148 = NSNumber;
          if (v145)
          {
            v149 = [(MPCPlayPerfMetrics *)v27 readyToPlayStatusWaitTime];
            [v149 doubleValue];
            double v151 = v150;

            [v253 durationSinceEvent:v291[5]];
            if (v151 < v152) {
              double v152 = v151;
            }
          }
          else
          {
            v153 = [(MPCPlayPerfMetrics *)v27 readyToPlayStatusWaitTime];
            [v153 doubleValue];
            double v155 = v154;

            [v253 durationSinceEvent:*(void *)(*(void *)&buf[8] + 40)];
            if (v155 < v152) {
              double v152 = v155;
            }
          }
          v156 = objc_msgSend(v148, "numberWithDouble:", fmax(v152, 0.0));
          [(MPCPlayPerfMetrics *)v27 set_readyToPlayStatusWaitTime:v156];
        }
        *(void *)v300 = 0;
        *(void *)&v300[8] = v300;
        *(void *)&v300[16] = 0x3032000000;
        v301 = __Block_byref_object_copy__32062;
        v302 = __Block_byref_object_dispose__32063;
        id v303 = 0;
        uint64_t v282 = 0;
        v283 = &v282;
        uint64_t v284 = 0x3032000000;
        v285 = __Block_byref_object_copy__32062;
        v286 = __Block_byref_object_dispose__32063;
        id v287 = 0;
        v277[0] = MEMORY[0x263EF8330];
        v277[1] = 3221225472;
        v277[2] = __69__MPCPlayPerfMetrics_playMetricsWithItemReadyForMetricsEvent_cursor___block_invoke_284;
        v277[3] = &unk_2643C63F8;
        id v278 = v10;
        v280 = v300;
        v279 = v12;
        v281 = &v282;
        [log enumeratePreviousEventsWithType:@"item-rate-changed" usingBlock:v277];
        v157 = (void *)v283[5];
        v158 = v260;
        if (v157)
        {
          [v157 durationSinceEvent:*(void *)(*(void *)&buf[8] + 40)];
          double v160 = v159;
          [(id)v283[5] durationSinceEvent:v253];
          if (v139 + v160 < v161) {
            double v161 = v139 + v160;
          }
          v162 = [NSNumber numberWithDouble:v161];
          [(MPCPlayPerfMetrics *)v27 set_rateChangeWaitTime:v162];

          v163 = [v262 payload];
          v164 = [v163 objectForKeyedSubscript:@"event-time-offset"];
          [v164 doubleValue];
          double v166 = v165;

          v167 = NSNumber;
          [v262 durationSinceEvent:v283[5]];
          v169 = [v167 numberWithDouble:v166 + v168];
          [(MPCPlayPerfMetrics *)v27 set_firstAudioFrameWaitTime:v169];

          v158 = v260;
        }
        v170 = [v158 cursorFromEvent:v257 untilEvent:0];
        v299[0] = @"item-resume";
        v299[1] = @"item-pause";
        v171 = [MEMORY[0x263EFF8C0] arrayWithObjects:v299 count:2];
        v243 = [v170 findPreviousEventWithTypes:v171 matchingPayload:0];

        if (v243)
        {
          v172 = [v243 type];
          int v173 = [v172 isEqualToString:@"item-pause"];

          if (v173)
          {
            v174 = NSNumber;
            [v262 durationSinceEvent:v243];
            v175 = objc_msgSend(v174, "numberWithDouble:");
            [(MPCPlayPerfMetrics *)v27 set_timeSincePaused:v175];
          }
          else
          {
            [(MPCPlayPerfMetrics *)v27 set_timeSincePaused:&unk_26CC19320];
          }
        }
        v176 = (void *)v291[5];
        if (v176)
        {
          v177 = [v176 payload];
          v178 = [v177 objectForKeyedSubscript:@"remote-control-options"];
          v179 = [v178 objectForKeyedSubscript:v240];

          if (v179)
          {
            uint64_t v276 = 0;
            *(_OWORD *)&info[0].numer = 0u;
            long long v275 = 0u;
            v180 = (void *)MEMORY[0x263EFF910];
            [v179 doubleValue];
            v181 = objc_msgSend(v180, "dateWithTimeIntervalSinceReferenceDate:");
            MPCPlaybackEngineEventMonotonicTimeConvertNSDate(v181, (uint64_t)info);

            v182 = [NSNumber numberWithUnsignedLongLong:*(void *)&info[1]];
            [(MPCPlayPerfMetrics *)v27 set_checkpointMRSetQueueBegin:v182];
          }
          v183 = NSNumber;
          v184 = (void *)v291[5];
          if (v184)
          {
            [v184 monotonicTime];
            uint64_t v185 = v273;
          }
          else
          {
            uint64_t v185 = 0;
          }
          v186 = [v183 numberWithUnsignedLongLong:v185];
          [(MPCPlayPerfMetrics *)v27 set_checkpointSetQueueBegin:v186];

          v297 = @"remote-control-id";
          v187 = [(id)v291[5] payload];
          v188 = [v187 objectForKeyedSubscript:@"remote-control-id"];
          v298 = v188;
          v189 = [NSDictionary dictionaryWithObjects:&v298 forKeys:&v297 count:1];
          v190 = [log findPreviousEventWithType:@"remote-control-end" matchingPayload:v189];

          if (v190)
          {
            v191 = NSNumber;
            [v190 monotonicTime];
            v192 = [v191 numberWithUnsignedLongLong:v272];
            [(MPCPlayPerfMetrics *)v27 set_checkpointSetQueueEnd:v192];
          }
        }
        v193 = *(void **)(*(void *)&v300[8] + 40);
        if (v193)
        {
          v194 = NSNumber;
          [v193 monotonicTime];
          v195 = [v194 numberWithUnsignedLongLong:v271];
          [(MPCPlayPerfMetrics *)v27 set_checkpointRateZero:v195];
        }
        v196 = *(void **)(*(void *)&buf[8] + 40);
        if (v196)
        {
          v197 = [v196 payload];
          v198 = [v197 objectForKeyedSubscript:@"remote-control-options"];
          v199 = [v198 objectForKeyedSubscript:v240];

          if (v199)
          {
            uint64_t v276 = 0;
            *(_OWORD *)&info[0].numer = 0u;
            long long v275 = 0u;
            v200 = (void *)MEMORY[0x263EFF910];
            [v199 doubleValue];
            v201 = objc_msgSend(v200, "dateWithTimeIntervalSinceReferenceDate:");
            MPCPlaybackEngineEventMonotonicTimeConvertNSDate(v201, (uint64_t)info);

            v202 = [NSNumber numberWithUnsignedLongLong:*(void *)&info[1]];
            [(MPCPlayPerfMetrics *)v27 set_checkpointMRPlay:v202];
          }
          v203 = NSNumber;
          v204 = *(void **)(*(void *)&buf[8] + 40);
          if (v204)
          {
            [v204 monotonicTime];
            uint64_t v205 = v270;
          }
          else
          {
            uint64_t v205 = 0;
          }
          v206 = [v203 numberWithUnsignedLongLong:v205];
          [(MPCPlayPerfMetrics *)v27 set_checkpointPlay:v206];
        }
        if (v246)
        {
          v207 = NSNumber;
          [v246 monotonicTime];
          v208 = [v207 numberWithUnsignedLongLong:v269];
          [(MPCPlayPerfMetrics *)v27 set_checkpointAssetLoadBegin:v208];
        }
        v241 = [log findPreviousEventWithType:@"asset-load-end" matchingPayload:v263];
        if (v241)
        {
          v209 = NSNumber;
          [v241 monotonicTime];
          v210 = [v209 numberWithUnsignedLongLong:v268];
          [(MPCPlayPerfMetrics *)v27 set_checkpointAssetLoadEnd:v210];
        }
        v239 = [log findPreviousEventWithType:@"item-buffer-ready" matchingPayload:v263];
        v211 = v262;
        if (v239)
        {
          v212 = NSNumber;
          [v239 monotonicTime];
          v213 = [v212 numberWithUnsignedLongLong:v267];
          [(MPCPlayPerfMetrics *)v27 set_checkpointLikelyToKeepUp:v213];

          v211 = v262;
        }
        if (v253)
        {
          v214 = NSNumber;
          [v253 monotonicTime];
          v215 = [v214 numberWithUnsignedLongLong:v266];
          [(MPCPlayPerfMetrics *)v27 set_checkpointReadyToPlay:v215];

          v211 = v262;
        }
        v216 = (void *)v283[5];
        if (v216)
        {
          v217 = NSNumber;
          [v216 monotonicTime];
          v218 = [v217 numberWithUnsignedLongLong:v265];
          [(MPCPlayPerfMetrics *)v27 set_checkpointRateOne:v218];

          v211 = v262;
        }
        v219 = [v211 payload];
        v220 = [v219 objectForKeyedSubscript:@"event-time-offset"];
        [v220 doubleValue];
        double v222 = v221;

        [v262 monotonicTime];
        info[0] = 0;
        mach_timebase_info(info);
        v223 = [NSNumber numberWithUnsignedLongLong:info[0].denom * (uint64_t)(v222 * 1000000000.0) / info[0].numer + v264];
        [(MPCPlayPerfMetrics *)v27 set_checkpointFirstAudioFrame:v223];

        v224 = [(MPCPlayPerfMetrics *)v27 setQueueCommandSendTime];
        [v224 doubleValue];
        double v226 = v225;
        BOOL v227 = v225 > 120.0;

        if (v227) {
          v228 = @"LongSendQueue";
        }
        else {
          v228 = 0;
        }
        v229 = [(MPCPlayPerfMetrics *)v27 musicTotalTime];
        [v229 doubleValue];
        BOOL v231 = v230 > 300.0;

        if (v231) {
          v232 = @"LongMPP";
        }
        else {
          v232 = v228;
        }
        if (v231 || v226 > 120.0)
        {
          v233 = (void *)MEMORY[0x263F54EC8];
          v234 = [(MPCPlayPerfMetrics *)v27 dictionaryRepresentation];
          v296 = v234;
          v235 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v296 count:1];
          [v233 snapshotWithDomain:*MEMORY[0x263F54E80] type:@"Bug" subType:@"PlayPerf" context:v232 triggerThresholdValues:0 events:v235 completion:0];
        }
        _Block_object_dispose(&v282, 8);

        _Block_object_dispose(v300, 8);
        v84 = v245;
        goto LABEL_125;
      }
      id v114 = [NSNumber numberWithDouble:v123];
      [(MPCPlayPerfMetrics *)v27 set_setQueueCommandSendTime:v114];
    }

    goto LABEL_63;
  }
  double v22 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    double v23 = [v7 identifier];
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2114;
    v319 = v12;
    _os_log_impl(&dword_21BB87000, v22, OS_LOG_TYPE_ERROR, "ItemReadyForMetricsEvent event doesn't have recognizable preceding ItemFirstAudioFrameRender event (eventID:%{public}@ item:%{public}@ %{public}@)", buf, 0x20u);
  }
  double v24 = 0;
LABEL_128:

  return v24;
}

void __69__MPCPlayPerfMetrics_playMetricsWithItemReadyForMetricsEvent_cursor___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v15 = a2;
  double v6 = [v15 payload];
  id v7 = [v6 objectForKeyedSubscript:@"remote-control-type"];
  unsigned int v8 = [v7 intValue];

  unsigned int v9 = v8 - 121;
  if ((v8 - 121 > 0xC || ((1 << (v8 - 121)) & 0x1003) == 0) && (v8 & 0xFFFFFFFD) != 0)
  {
    if (v8 <= 0x1A && ((1 << v8) & 0x7080000) != 0 || v8 == 132 || v8 == 135) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v14 = *(void *)(v12 + 40);
  id v13 = (id *)(v12 + 40);
  if (!v14) {
    objc_storeStrong(v13, a2);
  }
  if (v9 <= 0xC && ((1 << v9) & 0x1003) != 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
LABEL_14:
    *a3 = 1;
  }
LABEL_15:
}

void __69__MPCPlayPerfMetrics_playMetricsWithItemReadyForMetricsEvent_cursor___block_invoke_265(uint64_t a1, void *a2)
{
}

void __69__MPCPlayPerfMetrics_playMetricsWithItemReadyForMetricsEvent_cursor___block_invoke_284(void *a1, void *a2, unsigned char *a3)
{
  id v28 = a2;
  id v5 = (void *)a1[4];
  double v6 = [v28 payload];
  id v7 = [v6 objectForKeyedSubscript:@"queue-section-id"];
  if ([v5 isEqualToString:v7])
  {
  }
  else
  {
    unsigned int v8 = [v28 payload];
    unsigned int v9 = [v8 objectForKeyedSubscript:@"item-rate"];
    [v9 doubleValue];
    double v11 = v10;

    uint64_t v12 = v28;
    if (v11 != 0.0) {
      goto LABEL_6;
    }
    uint64_t v13 = *(void *)(a1[6] + 8);
    id v14 = v28;
    double v6 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v14;
  }

  uint64_t v12 = v28;
LABEL_6:
  id v15 = (void *)a1[4];
  double v16 = [v12 payload];
  double v17 = [v16 objectForKeyedSubscript:@"queue-section-id"];
  if (([v15 isEqualToString:v17] & 1) == 0)
  {
LABEL_11:

    goto LABEL_12;
  }
  double v18 = (void *)a1[5];
  double v19 = [v28 payload];
  double v20 = [v19 objectForKeyedSubscript:@"queue-item-id"];
  if (![v18 isEqualToString:v20])
  {

    goto LABEL_11;
  }
  id v21 = [v28 payload];
  double v22 = [v21 objectForKeyedSubscript:@"item-rate"];
  [v22 doubleValue];
  double v24 = v23;

  if (v24 <= 0.0) {
    goto LABEL_13;
  }
  uint64_t v25 = *(void *)(a1[7] + 8);
  id v26 = v28;
  double v16 = *(void **)(v25 + 40);
  *(void *)(v25 + 40) = v26;
LABEL_12:

LABEL_13:
  uint64_t v27 = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (v27) {
    LOBYTE(v27) = *(void *)(*(void *)(a1[7] + 8) + 40) != 0;
  }
  *a3 = v27;
}

@end