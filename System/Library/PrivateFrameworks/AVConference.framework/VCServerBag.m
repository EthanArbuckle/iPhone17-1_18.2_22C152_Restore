@interface VCServerBag
+ (BOOL)verifyRequiredKeys:(id *)a3;
+ (BOOL)verifyRequiredKeys:(id)a3 withError:(id *)a4;
+ (BOOL)verifyRequiredVoiceChatKeys:(id *)a3;
+ (id)sharedInstance;
+ (void)checkKeysAgainstHardcodedPrefs:(id)a3;
+ (void)clearBagWithRefreshIntervalInSeconds:(int)a3;
+ (void)pullStoreBagKeys;
+ (void)retrieveBag;
- (VCServerBag)init;
- (void)waitForBagLoad;
@end

@implementation VCServerBag

- (VCServerBag)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCServerBag;
  v2 = [(VCServerBag *)&v4 init];
  pthread_mutex_init(&v2->isLoadedMutex, 0);
  pthread_cond_init(&v2->isLoadedCondition, 0);
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_17 != -1) {
    dispatch_once(&sharedInstance_onceToken_17, &__block_literal_global_94);
  }
  return (id)sharedInstance_bag;
}

VCServerBag *__29__VCServerBag_sharedInstance__block_invoke()
{
  result = objc_alloc_init(VCServerBag);
  sharedInstance_bag = (uint64_t)result;
  return result;
}

- (void)waitForBagLoad
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[MEMORY[0x1E4F6AB80] sharedInstance];
  pthread_mutex_lock(&self->isLoadedMutex);
  v13.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v13.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  if (!self->isLoaded)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v15 = v4;
        __int16 v16 = 2080;
        v17 = "-[VCServerBag waitForBagLoad]";
        __int16 v18 = 1024;
        int v19 = 50;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Waiting for bag load.", buf, 0x1Cu);
      }
    }
    char v6 = [v3 isLoaded];
    self->isLoaded = v6;
    if ((v6 & 1) == 0)
    {
      uint64_t v7 = MEMORY[0x1E4F143A8];
      uint64_t v8 = 3221225472;
      v9 = __29__VCServerBag_waitForBagLoad__block_invoke;
      v10 = &unk_1E6DB3E40;
      v11 = self;
      v12 = v3;
      if (waitForBagLoad_onceToken != -1) {
        dispatch_once(&waitForBagLoad_onceToken, &v7);
      }
      objc_msgSend(v3, "startBagLoad", v7, v8, v9, v10, v11, v12, v13.tv_sec, v13.tv_nsec);
      timespec v13 = (timespec)xmmword_1E25A2A90;
      pthread_cond_timedwait_relative_np(&self->isLoadedCondition, &self->isLoadedMutex, &v13);
    }
  }
  pthread_mutex_unlock(&self->isLoadedMutex);
}

uint64_t __29__VCServerBag_waitForBagLoad__block_invoke(uint64_t a1)
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4F6AA40];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__VCServerBag_waitForBagLoad__block_invoke_2;
  v6[3] = &unk_1E6DB95E8;
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  uint64_t result = [v2 addObserverForName:v3 object:v4 queue:0 usingBlock:v6];
  *(void *)(*(void *)(a1 + 32) + 128) = result;
  return result;
}

uint64_t __29__VCServerBag_waitForBagLoad__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a2) {
        char v6 = (const char *)objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
      }
      else {
        char v6 = "<nil>";
      }
      int v9 = 136315906;
      uint64_t v10 = v4;
      __int16 v11 = 2080;
      v12 = "-[VCServerBag waitForBagLoad]_block_invoke_2";
      __int16 v13 = 1024;
      int v14 = 68;
      __int16 v15 = 2080;
      __int16 v16 = v6;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Bag Load Notification came in %s", (uint8_t *)&v9, 0x26u);
    }
  }
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 56));
  *(unsigned char *)(*(void *)(a1 + 32) + 120) = 1;
  uint64_t v7 = *(void *)(a1 + 32);
  if (*(void *)(v7 + 128))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", *(void *)(*(void *)(a1 + 32) + 128));
    uint64_t v7 = *(void *)(a1 + 32);
  }
  *(void *)(v7 + 128) = 0;
  pthread_cond_broadcast((pthread_cond_t *)(*(void *)(a1 + 32) + 8));
  return pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 56));
}

+ (void)pullStoreBagKeys
{
  v77[53] = *MEMORY[0x1E4F143B8];
  id v39 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  [+[VCServerBag sharedInstance] waitForBagLoad];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v77[0] = @"gk-cdx";
  v77[1] = @"gk-commnat-main0";
  v77[2] = @"gk-commnat-main1";
  v77[3] = @"gk-commnat-cohort";
  v77[4] = @"gk-commnat-main0-name";
  v77[5] = @"gk-commnat-main1-name";
  v77[6] = @"gk-commnat-cohort-name";
  v77[7] = @"gk-p2p-ice-timeout";
  v77[8] = @"gk-p2p-nat-type-timeout";
  v77[9] = @"gk-p2p-blob-size-max";
  v77[10] = @"gk-p2p-relay-bitrate-max";
  v77[11] = @"gk-p2p-tcp-relay-bitrate-max";
  v77[12] = @"gk-p2p-pre-relay-timeout";
  v77[13] = @"gk-p2p-remote-packets-timeout";
  v77[14] = @"gk-p2p-network-conditions-timeout";
  v77[15] = @"gk-p2p-video-throttling-timeout";
  v77[16] = @"gk-p2p-startup-timeout";
  v77[17] = @"gk-p2p-tcp-check-url";
  v77[18] = @"gk-p2p-ssl-check-url";
  v77[19] = @"gk-p2p-bitrate-max-2g";
  v77[20] = @"gk-p2p-bitrate-max-3g";
  v77[21] = @"gk-p2p-bitrate-max-lte";
  v77[22] = @"gk-p2p-bitrate-max-lte-v2";
  v77[23] = @"gk-p2p-bitrate-max-5g";
  v77[24] = @"gk-min-jitter-queue-size-5g";
  v77[25] = @"gk-p2p-bitrate-max-wifi";
  v77[26] = @"gk-p2p-video-degraded-threshold";
  v77[27] = @"vc-enable-irat-recommendation";
  v77[28] = @"vc-rate-controller-type";
  v77[29] = @"vc-decryption-timeout-interval";
  v77[30] = @"vc-decryption-mkm-recovery-interval";
  v77[31] = @"vc-new-session-joining-interval";
  v77[32] = @"vc-remote-media-stall-timeout";
  v77[33] = @"vc-no-remote-duplication-threshold-fast";
  v77[34] = @"vc-viewpoint-correction-enabled";
  v77[35] = @"vc-facetime-photos-use-best-videorule";
  v77[36] = @"vc-facetime-jb-high-start";
  v77[37] = @"vc-facetime-jitter-buffer-mode";
  v77[38] = @"vc-facetime-30-fps-support";
  v77[39] = @"vc-primary-conn-health-allowed-delay";
  v77[40] = @"gk-p2p-video-near-degraded-threshold";
  v77[41] = @"gk-p2p-media-degraded-threshold";
  v77[42] = @"vc-wrm-pending-bitrate-cap-delta";
  v77[43] = @"vc-duplication-media-driven-duplication-enabled";
  v77[44] = @"vc-ids-link-suggestion-enabled";
  v77[45] = @"vc-core-motion-detection-enabled";
  v77[46] = @"vc-send-feedback-controller-report";
  v77[47] = @"vc-captions-enabled";
  v77[48] = @"vc-motion-based-duplication-enabled";
  v77[49] = @"vc-force-relay-when-screen-enabled";
  v77[50] = @"vc-server-should-use-second-aggregator";
  v77[51] = @"vc-u-plus-one-auth-tag-enabled";
  v77[52] = @"vc-prefer-wired-over-wifi";
  uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:53];
  v76[0] = @"rtc-ac-bitrate-max-2g";
  v76[1] = @"rtc-ac-bitrate-max-3g";
  v76[2] = @"rtc-ac-bitrate-max-lte";
  v76[3] = @"rtc-ac-relay-bitrate-max";
  v76[4] = @"rtc-ac-tcp-relay-bitrate-max";
  v76[5] = @"rtc-ss-bitrate-max-2g";
  v76[6] = @"rtc-ss-bitrate-max-3g";
  v76[7] = @"rtc-ss-bitrate-max-lte";
  v76[8] = @"vc-enable-evs-audio-codec";
  v76[9] = @"vc-enable-red-audio";
  v76[10] = @"vc-red-state-value-A";
  v76[11] = @"vc-max-bitrate-2g-uplink";
  v76[12] = @"vc-max-bitrate-3g-uplink";
  v76[13] = @"vc-max-bitrate-lte-uplink";
  v76[14] = @"vc-max-bitrate-nonexpensive-uplink";
  v76[15] = @"vc-max-bitrate-wifi-uplink";
  v76[16] = @"vc-max-bitrate-2g-downlink";
  v76[17] = @"vc-max-bitrate-3g-downlink";
  v76[18] = @"vc-max-bitrate-lte-downlink";
  v76[19] = @"vc-max-bitrate-nonexpensive-downlink";
  v76[20] = @"vc-max-bitrate-wifi-downlink";
  uint64_t v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:21];
  v75[0] = @"vc-adaptive-learning-enabled";
  v75[1] = @"vc-short-term-history-length";
  v75[2] = @"vc-long-term-history-length";
  v75[3] = @"vc-adaptive-learning-A";
  v75[4] = @"vc-adjustment-factor-A";
  v75[5] = @"vc-short-term-value-weight-A";
  v75[6] = @"vc-long-term-value-weight-A";
  v75[7] = @"vc-adaptive-learning-B";
  v75[8] = @"vc-adjustment-factor-B";
  v75[9] = @"vc-short-term-value-weight-B";
  v75[10] = @"vc-long-term-value-weight-B";
  v75[11] = @"vc-adjustment-factor-C";
  v75[12] = @"vc-short-term-value-weight-C";
  v75[13] = @"vc-long-term-value-weight-C";
  uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:14];
  v74[0] = @"vc-prefer-relay-over-p2p-threshold";
  v74[1] = @"vc-always-on-audio-redundancy-enable-threshold";
  v74[2] = @"vc-high-fec-enable-threshold";
  v74[3] = @"vc-low-fps-video-enable-threshold";
  v74[4] = @"vc-vplr-fec-enable-threshold";
  v74[5] = @"vc-video-redundancy-percentage-max";
  v74[6] = @"vc-ab-testing-use-video-jitter-for-video-playout";
  v74[7] = @"vc-fast-media-duplication-enable-threshold";
  v74[8] = @"vc-iRAT-rtp-enable-threshold";
  v74[9] = @"vc-pre-warm-cell-enable-threshold";
  v74[10] = @"vc-duplicate-important-pkts-enable-threshold";
  v74[11] = @"vc-allow-bursty-loss-ramp-down-enable-threshold";
  v74[12] = @"vc-hevc-wifi-tiers-enable-threshold";
  v74[13] = @"vc-viewpoint-correction-enable-threshold";
  v74[14] = @"vc-heif-hevc-live-photos-enable-threshold";
  v74[15] = @"vc-wifi-low-tier-redundancy-enable-threshold";
  v74[16] = @"vc-cellular-low-tier-redundancy-enable-threshold";
  v74[17] = @"vc-iRAT-metrics-enable-threshold";
  v74[18] = @"vc-fec-header-v1-enable-threshold";
  v74[19] = @"vc-updated-AFRC-header-enable-threshold";
  v74[20] = @"vc-secure-messaging-enable-threshold";
  v74[21] = @"vc-disable-SIP-enable-threshold";
  v74[22] = @"vc-wifi-assist-duplication-enable-threshold";
  v74[23] = @"vc-wifi-assist-budget-status-enable-threshold";
  v74[24] = @"vc-wifi-assist-status-bar-enable-threshold";
  v74[25] = @"vc-low-network-mode-enable-threshold";
  v74[26] = @"vc-duplication-enhancement-enable-threshold";
  v74[27] = @"vc-video-jb-enable-threshold-v2";
  v74[28] = @"vc-iRAT-duplication-enable-threshold";
  v74[29] = @"vc-wrm-rssi-threshold-enable-threshold";
  v74[30] = @"vc-wrm-rssi-threshold-distribution";
  v74[31] = @"vc-media-driven-duplication-enable-threshold";
  v74[32] = @"vc-ab-test-master-local-switches";
  v74[33] = @"vc-ab-test-audio-enhancement-feature-combinations";
  v74[34] = @"vc-ab-test-video-enhancement-feature-combinations";
  v74[35] = @"vc-ab-test-network-enhancement-feature-combinations";
  v74[36] = @"vc-ab-test-rate-control-enhancement-feature-combinations";
  v74[37] = @"vc-ab-test-media-duplication-enhancement-feature-combinations";
  v74[38] = @"vc-ab-testing-state";
  v74[39] = @"vc-ab-testing-use-rtt-for-fir-throttling";
  v74[40] = @"vc-ab-test-enable-max-camera-bitrate-video-quality-v3-threshold";
  v74[41] = @"vc-limit-multiway-bandwidth-when-constrained";
  v74[42] = @"vc-raise-u-one-bandwidth-limit-when-constrained";
  v74[43] = @"vc-ab-testing-higher-audio-RED-cutover";
  uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:44];
  v73[0] = @"vc-link-probing-capability-version";
  v73[1] = @"vc-link-probing-feature-threshold";
  v73[2] = @"vc-link-probing-interval";
  v73[3] = @"vc-link-probing-timeout";
  v73[4] = @"vc-link-probing-query-results-interval";
  v73[5] = @"vc-link-probing-exponential-moving-mean-factor";
  v73[6] = @"vc-link-probing-envelope-attack-factor";
  v73[7] = @"vc-link-probing-envelope-decay-factor";
  v73[8] = @"vc-link-probing-connection-lockdown-period";
  v73[9] = @"vc-link-probing-plr-buckets";
  v73[10] = @"vc-link-probing-duplication-wait-timeout";
  v73[11] = @"vc-link-probing-identical-query-result-max";
  v73[12] = @"vc-link-probing-lockdown-period";
  v73[13] = @"vc-link-probing-qr-stat-request-frequency";
  v73[14] = @"vc-link-probing-qr-stat-request-max-count";
  v73[15] = @"vc-link-probing-qr-stat-request-max-rtt";
  uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:16];
  v72[0] = @"vc-network-condition-detection-enabled";
  v72[1] = @"vc-bad-wifi-channel-quality-score-threshold";
  v72[2] = @"vc-bad-cell-signal-strength-bars-threshold-factor";
  v72[3] = @"vc-bad-cell-signal-strength-bars-threshold-offset";
  v72[4] = @"vc-wifi-channel-quality-score-envelope-attack-factor";
  v72[5] = @"vc-wifi-channel-quality-score-envelope-decay-factor";
  v72[6] = @"vc-cell-signal-strength-bars-envelope-attack-factor";
  v72[7] = @"vc-cell-signal-strength-bars-envelope-decay-factor";
  v72[8] = @"vc-network-backhaul-detection-trigger-threshold";
  uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:9];
  id v35 = +[VCRateControlServerBag keysWithMode:1];
  id v34 = +[VCRateControlServerBag keysWithMode:6];
  v71[0] = @"vc-mediaQueue-schedule-no-wait";
  v71[1] = @"vc-mediaQueue-min-bitrate-no-throttling";
  v71[2] = @"vc-mediaQueue-min-bitrate-no-throttling-3d";
  uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:3];
  v70[0] = @"vc-cellular-expiration-time-audio";
  v70[1] = @"vc-cellular-expiration-time-video";
  uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
  v69[0] = @"vc-fec-vectorization-enabled";
  v69[1] = @"vc-fec-generator-enabled";
  v69[2] = @"vc-fec-feedback-version";
  v69[3] = @"vc-fec-feedback-analyzer-level-match-percentile";
  v69[4] = @"vc-fec-feedback-analyzer-buffer-max-length";
  v69[5] = @"vc-fec-feedback-analyzer-report-min-period";
  v69[6] = @"vc-fec-feedback-analyzer-vplr-window-size";
  v69[7] = @"vc-fec-feedback-analyzer-interpolation-threshold";
  uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:8];
  v68[0] = @"vc-video-priority-enabled";
  v68[1] = @"vc-low-quality-audio-stream-on-demand";
  v68[2] = @"vc-low-quality-video-stream-on-demand";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:3];
  v67 = @"vc-nw-connection-monitor-enabled";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
  v66[0] = @"vc-video-jitter-buffer-for-video-playout";
  v66[1] = @"vc-video-player-enable-loose-sync-for-facetime";
  v66[2] = @"vc-video-player-enable-reference-frame-for-facetime";
  v66[3] = @"vc-video-enable-late-frame-recovery";
  v66[4] = @"vc-video-transmitter-minimum-key-frame-generation-interval-for-facetime";
  v66[5] = @"vc-video-receiver-deferred-assembly-offset";
  v66[6] = @"vc-middle-tier-ml-enhance-disabled";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:7];
  v65[0] = @"vc-server-video-packet-retransmission-enabled";
  v65[1] = @"vc-nack-generator-population-percentage-with-additional-delay-budget";
  v65[2] = @"vc-nack-generator-nack-bit-rate-limiting-max-ratio";
  v65[3] = @"vc-nack-generator-seq-num-aging-time";
  v65[4] = @"vc-nack-generator-nack-throttling-plr-buckets";
  v65[5] = @"vc-nack-generator-nack-throttling-factor-buckets";
  v65[6] = @"vc-nack-generator-storebag-config-version";
  v65[7] = @"vc-nack-generator-nack-generation-max-plr";
  v65[8] = @"vc-nack-generator-nack-generation-max-rtt";
  v65[9] = @"vc-nack-generator-rtt-for-rtx-fulfillment-wait-time";
  v65[10] = @"vc-nack-generator-rtt-for-rtx-fulfillment-Multiplier";
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:11];
  v64[0] = @"vc-rtcp-psfb-for-loss-feedback";
  v64[1] = @"vc-rtcp-psfb-for-ltr-ack";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
  v63 = @"vc-screen-capture-private-content-capture-disabled";
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
  v62[0] = @"vc-reporting-audio-connection-time-symptom-threshold";
  v62[1] = @"vc-reporting-audio-erasure-percentage-symptom-threshold";
  v62[2] = @"vc-reporting-poor-connection-percentage-symptom-threshold";
  v62[3] = @"vc-reporting-video-connection-time-symptom-threshold";
  v62[4] = @"vc-reporting-video-stall-percentage-symptom-threshold";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:5];
  v61 = @"vc-enhanced-jb-adaptations";
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
  v60[0] = @"vc-out-of-process-video-decoding";
  v60[1] = @"vc-out-of-process-audio-decoding";
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
  [v2 addObjectsFromArray:v43];
  [v2 addObjectsFromArray:v41];
  [v2 addObjectsFromArray:v40];
  [v2 addObjectsFromArray:v38];
  [v2 addObjectsFromArray:v35];
  [v2 addObjectsFromArray:v34];
  [v2 addObjectsFromArray:v33];
  [v2 addObjectsFromArray:v32];
  [v2 addObjectsFromArray:v37];
  [v2 addObjectsFromArray:v31];
  [v2 addObjectsFromArray:v3];
  [v2 addObjectsFromArray:v4];
  [v2 addObjectsFromArray:v5];
  [v2 addObjectsFromArray:v6];
  [v2 addObjectsFromArray:v7];
  [v2 addObjectsFromArray:v36];
  [v2 addObjectsFromArray:v8];
  [v2 addObjectsFromArray:v9];
  [v2 addObjectsFromArray:v10];
  [v2 addObjectsFromArray:v11];
  v12 = v2;
  [v2 addObject:@"vc-enable-hevc-v2"];
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v13 = +[GKSConnectivitySettings getAllSettings];
  int v14 = (void *)[MEMORY[0x1E4F6AB80] sharedInstance];
  v44 = v14;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    __int16 v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (v14)
      {
        uint64_t v17 = (const char *)objc_msgSend((id)objc_msgSend(v14, "description"), "UTF8String");
        if (v13)
        {
LABEL_5:
          __int16 v18 = (const char *)objc_msgSend((id)objc_msgSend(v13, "description"), "UTF8String");
LABEL_8:
          *(_DWORD *)buf = 136316162;
          uint64_t v51 = v15;
          __int16 v52 = 2080;
          v53 = "+[VCServerBag pullStoreBagKeys]";
          __int16 v54 = 1024;
          int v55 = 181;
          __int16 v56 = 2080;
          v57 = v17;
          __int16 v58 = 2080;
          v59 = v18;
          _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Pulling bag to see if we need anything:%s, currentSettings = %s", buf, 0x30u);
          int v14 = v44;
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v17 = "<nil>";
        if (v13) {
          goto LABEL_5;
        }
      }
      __int16 v18 = "<nil>";
      goto LABEL_8;
    }
  }
LABEL_9:
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v19 = [v2 countByEnumeratingWithState:&v46 objects:v45 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v47 != v21) {
          objc_enumerationMutation(v12);
        }
        v23 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        if (![v13 objectForKeyedSubscript:v23])
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v24 = VRTraceErrorLogLevelToCSTR();
            v25 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              if (v23) {
                v26 = (const char *)objc_msgSend((id)objc_msgSend(v23, "description"), "UTF8String");
              }
              else {
                v26 = "<nil>";
              }
              *(_DWORD *)buf = 136315906;
              uint64_t v51 = v24;
              __int16 v52 = 2080;
              v53 = "+[VCServerBag pullStoreBagKeys]";
              __int16 v54 = 1024;
              int v55 = 188;
              __int16 v56 = 2080;
              v57 = v26;
              _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Missing bag value for key %s, we'll pull from the store bag ourselves", buf, 0x26u);
            }
          }
          id v27 = (id)[v14 objectForKey:v23];
          if (v27)
          {
            [v42 setObject:v27 forKeyedSubscript:v23];
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v28 = VRTraceErrorLogLevelToCSTR();
            v29 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              if (v23) {
                v30 = (const char *)objc_msgSend((id)objc_msgSend(v23, "description"), "UTF8String");
              }
              else {
                v30 = "<nil>";
              }
              *(_DWORD *)buf = 136315906;
              uint64_t v51 = v28;
              __int16 v52 = 2080;
              v53 = "+[VCServerBag pullStoreBagKeys]";
              __int16 v54 = 1024;
              int v55 = 197;
              __int16 v56 = 2080;
              v57 = v30;
              _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to get store bag value for key = %s", buf, 0x26u);
            }
          }

          int v14 = v44;
        }
      }
      uint64_t v20 = [v12 countByEnumeratingWithState:&v46 objects:v45 count:16];
    }
    while (v20);
  }
  if ([v42 count]) {
    +[GKSConnectivitySettings setServerAddresses:v42];
  }
}

+ (void)clearBagWithRefreshIntervalInSeconds:(int)a3
{
}

+ (void)checkKeysAgainstHardcodedPrefs:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3D0];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFArrayRef v5 = CFPreferencesCopyKeyList(@"com.apple.facetime", (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFDictionaryRef v6 = CFPreferencesCopyMultiple(v5, @"com.apple.facetime", v3, v4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_msgSend((id)objc_msgSend(@"com.apple.facetime", "description"), "UTF8String");
      if (v6) {
        uint64_t v10 = (const char *)objc_msgSend((id)-[__CFDictionary description](v6, "description"), "UTF8String");
      }
      else {
        uint64_t v10 = "<nil>";
      }
      int v11 = 136316162;
      uint64_t v12 = v7;
      __int16 v13 = 2080;
      int v14 = "+[VCServerBag checkKeysAgainstHardcodedPrefs:]";
      __int16 v15 = 1024;
      int v16 = 225;
      __int16 v17 = 2080;
      uint64_t v18 = v9;
      __int16 v19 = 2080;
      uint64_t v20 = v10;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d This is what we are reading in %s = %s", (uint8_t *)&v11, 0x30u);
    }
  }
  if (v5) {
    CFRelease(v5);
  }
  if (v6) {
    CFRelease(v6);
  }
}

+ (void)retrieveBag
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[MEMORY[0x1E4F6AB80] sharedInstance];
  if (([v2 isLoaded] & 1) == 0) {
    [v2 startBagLoad];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    CFStringRef v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136316674;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "+[VCServerBag retrieveBag]";
      __int16 v9 = 1024;
      int v10 = 238;
      __int16 v11 = 1024;
      int v12 = [v2 isLoaded];
      __int16 v13 = 2048;
      int v14 = v2;
      __int16 v15 = 1024;
      int v16 = [v2 isServerAvailable];
      __int16 v17 = 1024;
      int v18 = [v2 isLoading];
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Retrieving server bag %d, %p, %d, %d", (uint8_t *)&v5, 0x38u);
    }
  }
}

+ (BOOL)verifyRequiredKeys:(id)a3 withError:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = +[GKSConnectivitySettings getAllSettings];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v27 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(a3);
        }
        __int16 v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (![v6 objectForKeyedSubscript:v11])
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
          {
            uint64_t v15 = VRTraceErrorLogLevelToCSTR();
            int v16 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              if (v11) {
                __int16 v17 = (const char *)objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
              }
              else {
                __int16 v17 = "<nil>";
              }
              int v18 = 136315906;
              uint64_t v19 = v15;
              __int16 v20 = 2080;
              uint64_t v21 = "+[VCServerBag verifyRequiredKeys:withError:]";
              __int16 v22 = 1024;
              int v23 = 249;
              __int16 v24 = 2080;
              v25 = v17;
              _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d We don't have the required keys %s.  Please file.", (uint8_t *)&v18, 0x26u);
            }
          }
          +[GKVoiceChatError getNSError:a4 code:32000 detailedCode:112 filePath:0 description:@"No store bag is present so we failed the call." reason:@"Missing required store bag keys."];
          return 0;
        }
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v27 objects:v26 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    __int16 v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315650;
      uint64_t v19 = v12;
      __int16 v20 = 2080;
      uint64_t v21 = "+[VCServerBag verifyRequiredKeys:withError:]";
      __int16 v22 = 1024;
      int v23 = 256;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d verifyRequiredKeys finished.", (uint8_t *)&v18, 0x1Cu);
    }
  }
  return 1;
}

+ (BOOL)verifyRequiredVoiceChatKeys:(id *)a3
{
  int v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"gk-commnat-main0", @"gk-commnat-main1", @"gk-commnat-cohort", 0);
  LOBYTE(a3) = [a1 verifyRequiredKeys:v5 withError:a3];

  return (char)a3;
}

+ (BOOL)verifyRequiredKeys:(id *)a3
{
  int v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"gk-commnat-main0", @"gk-commnat-main1", @"gk-commnat-cohort", @"gk-commnat-main0-name", @"gk-commnat-main1-name", @"gk-commnat-cohort-name", 0);
  char v6 = [a1 verifyRequiredKeys:v5 withError:a3];
  if ((v6 & 1) == 0 && VRTraceIsInternalOSInstalled()) {
    [a1 checkKeysAgainstHardcodedPrefs:v5];
  }

  return v6;
}

@end