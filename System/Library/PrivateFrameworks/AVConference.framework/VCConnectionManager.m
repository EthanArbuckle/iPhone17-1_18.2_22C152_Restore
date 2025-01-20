@interface VCConnectionManager
- ($85B13D066EE34EC5DDC86B20300AB7FA)getConnectionSelectionPolicy;
- (AVCStatisticsCollector)statisticsCollector;
- (BOOL)cellPrimaryInterfaceChangeEnabled;
- (BOOL)duplicateImportantPktsEnabled;
- (BOOL)duplicationEnhancementEnabled;
- (BOOL)enableMotionBasedDuplication;
- (BOOL)enableNetworkConditionMonitoring;
- (BOOL)fastMediaDuplicationEnabled;
- (BOOL)hasSameReportingConfig:(id)a3 oldPrimaryConnection:(id)a4;
- (BOOL)iRATDuplicationEnabled;
- (BOOL)isAudioOnly;
- (BOOL)isBetterConnection:(id)a3 asPrimary:(BOOL)a4;
- (BOOL)isBetterPrimaryConnectionAvailable;
- (BOOL)isConnectedOnIPv6ForActiveConnectionWithQuality:(int)a3;
- (BOOL)isConnectedOnRelayForActiveConnectionWithQuality:(int)a3;
- (BOOL)isDuplicationAllowed;
- (BOOL)isDuplicationAllowedForParticipantID:(id)a3 bucketsToSum:(int)a4 threshold:(double)a5;
- (BOOL)isDuplicationEnabled;
- (BOOL)isGftTLEEnabled;
- (BOOL)isLocalCellularInterfaceUsed;
- (BOOL)isOneToOneModeEnabled;
- (BOOL)isOneToOneScreenEnabled;
- (BOOL)isOptimalConnection:(id)a3 asPrimary:(BOOL)a4 interfaceMask:(int)a5;
- (BOOL)isPreWarmStateEnabled;
- (BOOL)isRemoteMediaQualityDegraded;
- (BOOL)isRemoteNetworkQualityDegraded;
- (BOOL)isUplinkRetransmissionSupported;
- (BOOL)localOrRemoteHasMultipleInterfaceAvailable:(id)a3 remoteInterface:(id)a4;
- (BOOL)lowNetworkModeEnabled;
- (BOOL)optIntoExistingSubscribedStreams;
- (BOOL)preferRelayOverP2PEnabled;
- (BOOL)remotePreWarmStateEnabled;
- (BOOL)shouldAcceptDataFromSourceDestinationInfo:(tagVCSourceDestinationInfo *)a3;
- (BOOL)shouldDropCurrentPrimaryConnectionWithConnectionStats:(id *)a3;
- (BOOL)shouldLimitMultiwayBandwidthWhenConstrained;
- (BOOL)startConnectionHealthMonitoring;
- (BOOL)supportDuplication;
- (BOOL)useMediaDrivenDuplication;
- (NSString)gecoVersion;
- (VCConnectionHealthMonitor)connectionHealthMonitor;
- (VCConnectionManager)init;
- (VCConnectionManagerDelegate)delegate;
- (VCConnectionProtocol)connectionForDuplication;
- (VCConnectionProtocol)lastPrimaryConnectionInUse;
- (VCConnectionProtocol)secondaryConnection;
- (VCStatsRecorder)statsRecorder;
- (double)noRemoteDuplicationThresholdFast;
- (double)noRemotePacketInterval;
- (double)primaryConnHealthAllowedDelay;
- (double)remoteNoRemotePacketInterval;
- (id)getActiveConnectionRegistryAndUpdateDuplicationPossibility;
- (int)addConnection:(id)a3;
- (int)connectionCount;
- (int)getCellularMTUForActiveConnectionWithQuality:(int)a3;
- (int)getCellularTechForActiveConnectionWithQuality:(int)a3 forLocalInterface:(BOOL)a4;
- (int)getConnectionSelectionVersionFromFrameworkVersion:(id)a3;
- (int)getConnectionTypeForActiveConnectionWithQuality:(int)a3 forLocalInterface:(BOOL)a4;
- (int)processConnectionHealthFromControlInfo:(void *)a3;
- (int)processRemoteWRMSuggestion:(int)a3 isRemoteDuplicating:(BOOL)a4;
- (int)relayServerProvider;
- (int)removeConnection:(id)a3;
- (int)setConnectionHealthOnControlInfo:(void *)a3;
- (int)setWRMUpdateCallback:(void *)a3 requestNotificationCallback:(void *)a4 withContext:(void *)a5 completionHandler:(id)a6;
- (int64_t)overlayToken;
- (tagVCOverlaySource)overlaySource;
- (unint64_t)budgetConsumingCellularRxBytes;
- (unint64_t)budgetConsumingCellularTxBytes;
- (unint64_t)mediaCellularRxBytes;
- (unint64_t)mediaCellularTxBytes;
- (unint64_t)mediaExcessiveCellularRxBytes;
- (unint64_t)mediaExcessiveCellularTxBytes;
- (unint64_t)mediaWifiRxBytes;
- (unint64_t)mediaWifiTxBytes;
- (unint64_t)onTheWireTotalBytesReceivedSinceLastCheck;
- (unint64_t)onTheWireTotalBytesSentSinceLastCheck;
- (unint64_t)signalingExcessiveCellularRxBytes;
- (unint64_t)signalingExcessiveCellularTxBytes;
- (unsigned)callID;
- (unsigned)getByteCountWithIndex:(unsigned __int8)a3 isOutgoing:(BOOL)a4;
- (unsigned)getPacketCountWithIndex:(unsigned __int8)a3 isOutgoing:(BOOL)a4;
- (unsigned)linkProbingCapabilityVersion;
- (unsigned)preferredLocalInterfaceForDuplication;
- (unsigned)preferredRemoteInterfaceForDuplication;
- (unsigned)realRATType;
- (unsigned)remoteLinkProbingCapabilityVersion;
- (unsigned)sendFailureCountSinceLastCheck;
- (unsigned)sendSuccessCountSinceLastCheck;
- (void)addDistinctConnectionInterfaceToSet:(id)a3 withInterfaceType:(int)a4;
- (void)addMediaHealthStatsHistoryEntryForParticipantID:(id)a3;
- (void)aggregateStallTimeDuration:(id *)a3 idsParticipantID:(id)a4;
- (void)applyLinkFlags:(unsigned __int16)a3 isCellular:(BOOL)a4;
- (void)applyLinkRecommendation;
- (void)applyRemoteLinkFlags:(unsigned __int16)a3 isCellular:(BOOL)a4;
- (void)checkAndUpdatePrimaryConnection;
- (void)checkForCachedWRMNotification;
- (void)checkMediaQualityDegradedForParticipantID:(id)a3;
- (void)checkpointPrimaryConnection:(id)a3;
- (void)configureNWConnectionMonitor:(id)a3;
- (void)connectionHealthDidUpdate:(int)a3 isLocalConnection:(BOOL)a4;
- (void)copyPersistenPacketCounts:(unsigned int *)a3 isOutgoing:(BOOL)a4 size:(int)a5;
- (void)createNewConnectionStatsCollectorCallback;
- (void)createOverlaySource;
- (void)dealloc;
- (void)deregisterPeriodicTask;
- (void)destroyNWMonitorCellularInternal;
- (void)destroyNWMonitorInternal;
- (void)destroyNWMonitors;
- (void)didChangeWifiAssistAvailable:(BOOL)a3 reason:(unsigned __int8)a4;
- (void)didUpdateMotionActivity:(id)a3;
- (void)disableRemotePreferredInterfaceInference:(BOOL)a3;
- (void)duplicationStateUpdateWithEvent:(id)a3;
- (void)flushLinkProbingStatusWithOptions:(id)a3;
- (void)getSentBytes:(int64_t *)a3 receivedBytes:(int64_t *)a4;
- (void)handleReportingSymptom:(unsigned int)a3;
- (void)invalidateNetworkConditionMonitor;
- (void)periodicTask:(void *)a3;
- (void)primaryConnectionChanged:(id)a3 oldPrimaryConnection:(id)a4;
- (void)processWRMCoexMetrics:(id)a3;
- (void)promoteSecondaryConnectionToPrimary:(id)a3;
- (void)queryProbingResultsWithOptions:(id)a3;
- (void)registerPeriodicTask;
- (void)registerStatisticsHandlers;
- (void)releaseAndRemoveConnectionStatsCollectorCallback;
- (void)removeMediaHealthStatsHistoryEntryForParticipantID:(id)a3;
- (void)renewNWMonitor;
- (void)renewNWMonitorCellular;
- (void)reportConnection:(id)a3 isInitialConnection:(BOOL)a4;
- (void)reportConnectionUpdateWithRespCode:(unsigned __int16)a3;
- (void)reportConnectionUpdateWithResponseCode:(unsigned __int16)a3 delay:(double)a4;
- (void)reportLinkProbingStatsWithDuplicationJustStarted:(BOOL)a3;
- (void)reportLinkSuggestion;
- (void)reportNoPacketUpdateUsingCurrentTime:(double)a3 lastReceivedPacketTime:(double)a4;
- (void)reportSymptomOnLongMediaStallRecovered;
- (void)resetConnectionStatTimers;
- (void)resetMediaHealthStats;
- (void)setCallID:(unsigned int)a3;
- (void)setCellPrimaryInterfaceChangeEnabled:(BOOL)a3;
- (void)setConnectionForDuplication:(id)a3;
- (void)setConnectionPause:(BOOL)a3 isLocalConnection:(BOOL)a4;
- (void)setConnectionSelectionVersionWithLocalFrameworkVersion:(id)a3 remoteFrameworkVersion:(id)a4;
- (void)setDefaultLinkProbingCapabilityVersionForDeviceRole:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setDuplicateImportantPktsEnabled:(BOOL)a3;
- (void)setDuplicationCallback:(void *)a3 withContext:(void *)a4;
- (void)setDuplicationDownlinkCellBitrateCap:(unsigned int)a3 currentBitrate:(unsigned int)a4;
- (void)setDuplicationEnhancementEnabled:(BOOL)a3;
- (void)setFastMediaDuplicationEnabled:(BOOL)a3;
- (void)setGecoVersion:(id)a3;
- (void)setGftTLEEnabled:(BOOL)a3;
- (void)setIsAudioOnly:(BOOL)a3;
- (void)setIsDuplicationAllowed:(BOOL)a3;
- (void)setIsOneToOneModeEnabled:(BOOL)a3;
- (void)setIsOneToOneScreenEnabled:(BOOL)a3;
- (void)setIsRemoteMediaQualityDegraded:(BOOL)a3;
- (void)setIsRemoteNetworkQualityDegraded:(BOOL)a3;
- (void)setIsUplinkRetransmissionSupported:(BOOL)a3;
- (void)setLastPrimaryConnectionInUse:(id)a3;
- (void)setLowNetworkModeEnabled:(BOOL)a3;
- (void)setNWMonitorCellularHandlers;
- (void)setNWMonitorStatisticsHandler;
- (void)setNoRemoteDuplicationThresholdFast:(double)a3;
- (void)setOptIntoExistingSubscribedStreams:(BOOL)a3;
- (void)setOverlayToken:(int64_t)a3;
- (void)setPreferRelayOverP2P:(BOOL)a3 reason:(unsigned __int8)a4;
- (void)setPreferRelayOverP2PEnabled:(BOOL)a3;
- (void)setPreferredLocalInterfaceForDuplication:(unsigned __int8)a3;
- (void)setPreferredRemoteInterfaceForDuplication:(unsigned __int8)a3;
- (void)setRealRATType:(unsigned int)a3;
- (void)setRelayServerProvider:(int)a3;
- (void)setRemoteLinkProbingCapabilityVersion:(unsigned __int8)a3;
- (void)setRemotePreWarmStateEnabled:(BOOL)a3;
- (void)setReportingAgent:(opaqueRTCReporting *)a3;
- (void)setSecondaryConnection:(id)a3;
- (void)setShouldLimitMultiwayBandwidthWhenConstrained:(BOOL)a3;
- (void)setStartConnectionHealthMonitoring:(BOOL)a3;
- (void)setStatisticsCollector:(id)a3;
- (void)setSupportDuplication:(BOOL)a3;
- (void)setUpVTable;
- (void)setUseMediaDrivenDuplication:(BOOL)a3;
- (void)setiRATDuplicationEnabled:(BOOL)a3;
- (void)setupConnectionHealthMonitor;
- (void)setupConnectionHealthMonitorMultiway;
- (void)setupNetworkConditionMonitor;
- (void)start;
- (void)startActiveProbingWithOptions:(id)a3;
- (void)startBrokenNetworkDetection;
- (void)stop;
- (void)stopActiveProbingWithOptions:(id)a3;
- (void)stopBrokenNetworkDetection;
- (void)unregisterStatisticsHandlers;
- (void)updateAllBitrateCapsForConnection:(id)a3;
- (void)updateCellularMTU:(int)a3;
- (void)updateCellularTech:(int)a3 forLocalInterface:(BOOL)a4;
- (void)updateConnectionHealthWithVCStatisticsMessage:(tagVCStatisticsMessage *)a3;
- (void)updateConnectionSelectionPolicyWithPreferE2E:(BOOL)a3;
- (void)updateConnectionStatsWithIndicatorNoPacket:(id *)a3;
- (void)updateConnectionStatsWithIndicatorNone:(id *)a3;
- (void)updateConnectionStatsWithIndicatorOnlyPrimaryNoPacket:(id *)a3;
- (void)updateConnectionStatsWithIndicatorPrimaryImproved:(id *)a3;
- (void)updateDuplicationStateWithEventType:(unsigned __int8)a3;
- (void)updateLinkPreferSuggestion:(id)a3;
- (void)updateMediaDegradedHistoryWithCurrentAudioErasure:(double)a3 idsParticipantID:(id)a4;
- (void)updateMediaDegradedHistoryWithCurrentVideoStallDuration:(double)a3 idsParticipantID:(id)a4;
- (void)updateMediaDegradedHistoryWithValue:(double)a3 idsParticipantID:(id)a4;
- (void)updateMediaHealthStats:(id *)a3 idsParticipantID:(id)a4;
- (void)updateNegotiatedSettingsOnetoOne:(id)a3;
- (void)updateOneToOneBitrateCapsForConnection:(id)a3;
- (void)updateProbingResults:(id)a3;
- (void)updateScreenShareRelaySetting;
- (void)updateSessionStats:(unsigned __int16)a3;
- (void)updateWRMDuplicationForHandover;
- (void)updateWithRemoteMediaHealthDuplication:(BOOL)a3;
- (void)useConnectionAsPrimary:(id)a3;
@end

@implementation VCConnectionManager

- (void)setUpVTable
{
}

- (VCConnectionManager)init
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)VCConnectionManager;
  v2 = [(VCConnectionManager *)&v13 init];
  v3 = v2;
  if (v2)
  {
    [(VCConnectionManager *)v2 setUpVTable];
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v3->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCConnectionManager.delegateQueue", 0, CustomRootQueue);
    v3->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCConnectionManager.callbackQueue", 0, CustomRootQueue);
    v3->_reportingQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCConnectionManager.reportingQueue", 0, CustomRootQueue);
    v3->_nwConnectionMonitorQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCConnectionManager.nwConnectionMonitorQueue", 0, CustomRootQueue);
    pthread_rwlock_init(&v3->_stateRWlock, 0);
    v3->_localConnectionStats.type = 0;
    v3->_remoteConnectionStats.type = 1;
    v3->_localWRMLinkTypeFromDefaults = -1;
    v3->_allowRequestForWRMNotification = 1;
    v3->_duplicationCallback = VCCMDuplicationCallback;
    v3->_duplicationContext = v3;
    v3->_vcWifiAssist = +[VCWifiAssistManager sharedInstance];
    v3->_wrmHandler = objc_alloc_init(VCWRMHandler);
    v3->_duplicationHandler = objc_alloc_init(VCDuplicationHandler);
    v3->_linkProbingHandler = [[VCLinkProbingHandler alloc] initWithDelegate:v3];
    v3->_noRemoteDuplicationThresholdFast = 4.0;
    v3->_connectionArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->_lastDefaultCheckTime = 0.0;
    v3->_localRATTypeOverride = -1;
    v3->_isPrimaryLinkUsable = 1;
    v3->_isDuplicationAllowed = 1;
    v3->_isNWConnectionMonitorEnabled = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:@"vc-nw-connection-monitor-enabled" userDefaultKey:@"useNWConnectionMonitorForVCCM" featureFlagDomain:"AVConference" featureFlagName:"UseNWConnectionMonitorForVCCM"];
    v3->_isNWConnectionMonitorCellularEnabled = VCDefaults_GetBoolValueForKey(@"enableNWConnectionMonitorCellular", 0);
    v3->_aggregateStallTimeDuration = 0;
    v3->_mediaDegradedHistories = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_mediaDegradedHistoryIndices = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3->_aggregateStallTimeDuration = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(VCConnectionManager *)v3 addMediaHealthStatsHistoryEntryForParticipantID:&unk_1F3DC4668];
    v3->_BOOL useMediaDrivenDuplicationFeatureFlag = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:@"vc-duplication-media-driven-duplication-enabled" userDefaultKey:@"duplicationReductionEnabled" featureFlagDomain:"AVConference" featureFlagName:"UseMediaDrivenDuplication"];
    v3->_isDuplicationAllowedForMediaDegraded = 0;
    v3->_isWRMNotificationPending = 0;
    *(_OWORD *)&v3->_savedWRMNotification.applicationType = 0u;
    *(_OWORD *)v3->_savedWRMNotification.linkTypeChangeReasonString = 0u;
    *(_OWORD *)&v3->_savedWRMNotification.linkTypeChangeReasonString[16] = 0u;
    *(_OWORD *)&v3->_savedWRMNotification.linkTypeChangeReasonString[32] = 0u;
    *(_OWORD *)&v3->_savedWRMNotification.linkTypeChangeReasonString[48] = 0u;
    *(_OWORD *)&v3->_savedWRMNotification.linkTypeChangeReasonString[64] = 0u;
    *(_OWORD *)&v3->_savedWRMNotification.linkTypeChangeReasonString[80] = 0u;
    *(_OWORD *)&v3->_savedWRMNotification.linkTypeChangeReasonString[96] = 0u;
    *(_OWORD *)&v3->_savedWRMNotification.linkTypeChangeReasonString[112] = 0u;
    *(_OWORD *)&v3->_savedWRMNotification.linkBandwidthMin = 0u;
    v3->_wrmPendingBitrateCapDelta = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-wrm-pending-bitrate-cap-delta", @"wrmPendingBitrateCapDelta", &unk_1F3DC4668, 0), "intValue");
    objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"gk-p2p-video-near-degraded-threshold", @"videoNearDegradedThreshold", &unk_1F3DC4680, 1), "doubleValue");
    v3->_mediaDegradedThreshold = v5;
    v3->_BOOL enableNetworkConditionMonitoring = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:@"vc-network-condition-detection-enabled" userDefaultKey:@"networkConditionDetectionEnabled" featureFlagDomain:"AVConference" featureFlagName:"EnableNetworkConditionMonitoring"];
    v3->_isUserMoving = VCDefaults_GetIntValueForKey(@"forceUserMoving", 0) != 0;
    if (v3->_enableNetworkConditionMonitoring) {
      [(VCConnectionManager *)v3 setupNetworkConditionMonitor];
    }
    if ((VTP_GetSendRecvStats(&v3->_initialSentBytes, &v3->_initialReceivedBytes) & 0x80000000) != 0)
    {
      v3->_initialSentBytes = -1;
      v3->_initialReceivedBytes = -1;
    }
    v3->_dropLinkRecommendation = 1;
    v3->_BOOL useIDSLinkSuggestionFeatureFlag = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:@"vc-ids-link-suggestion-enabled" userDefaultKey:@"idsLinkSuggestionEnabled" featureFlagDomain:"AVConference" featureFlagName:"UseIDSLinkSuggestion"];
    *(void *)&v3->_sendSuccessCountSinceLastCheck = 0;
    v3->_onTheWireTotalBytesReceivedSinceLastCheck = 0;
    v3->_onTheWireTotalBytesSentSinceLastCheck = 0;
    v3->_int shouldForceRelayLinksWhenScreenEnabled = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-force-relay-when-screen-enabled", @"forceRelayWhenScreenEnabled", &unk_1F3DC4698, 0), "intValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL useIDSLinkSuggestionFeatureFlag = v3->_useIDSLinkSuggestionFeatureFlag;
        BOOL enableNetworkConditionMonitoring = v3->_enableNetworkConditionMonitoring;
        int shouldForceRelayLinksWhenScreenEnabled = v3->_shouldForceRelayLinksWhenScreenEnabled;
        BOOL useMediaDrivenDuplicationFeatureFlag = v3->_useMediaDrivenDuplicationFeatureFlag;
        *(_DWORD *)buf = 136316674;
        uint64_t v15 = v6;
        __int16 v16 = 2080;
        v17 = "-[VCConnectionManager init]";
        __int16 v18 = 1024;
        int v19 = 279;
        __int16 v20 = 1024;
        BOOL v21 = useIDSLinkSuggestionFeatureFlag;
        __int16 v22 = 1024;
        BOOL v23 = enableNetworkConditionMonitoring;
        __int16 v24 = 1024;
        int v25 = shouldForceRelayLinksWhenScreenEnabled;
        __int16 v26 = 1024;
        BOOL v27 = useMediaDrivenDuplicationFeatureFlag;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d useIDSLinkSuggestionFeatureFlag=%d enableNetworkConditionMonitoring=%d shouldForceRelayLinksWhenScreenEnabled=%d, _useMediaDrivenDuplicationFeatureFlag=%d", buf, 0x34u);
      }
    }
    v3->_linkIPPreference = -1;
    v3->_canUseP2PLinks = 1;
    v3->_connectionStatsCollector = objc_alloc_init(VCConnectionStatisticsCollector);
    v3->_mapLinkIDToLinkUUID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((VCConnectionManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      double v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v17 = v4;
        __int16 v18 = 2080;
        int v19 = "-[VCConnectionManager dealloc]";
        __int16 v20 = 1024;
        int v21 = 289;
        uint64_t v6 = " [%s] %s:%d ";
        v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCConnectionManager *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v17 = v9;
        __int16 v18 = 2080;
        int v19 = "-[VCConnectionManager dealloc]";
        __int16 v20 = 1024;
        int v21 = 289;
        __int16 v22 = 2112;
        BOOL v23 = v3;
        __int16 v24 = 2048;
        int v25 = self;
        uint64_t v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  [(VCConnectionManager *)self removeMediaHealthStatsHistoryEntryForParticipantID:&unk_1F3DC4668];
  VCConnectionManager_UseCellPrimaryInterface((uint64_t)self, 0);
  [(VCConnectionManager *)self destroyNWMonitors];
  pthread_rwlock_destroy(&self->_stateRWlock);
  [(VCConnectionManager *)self invalidateNetworkConditionMonitor];
  dispatch_release((dispatch_object_t)self->_delegateQueue);
  dispatch_release((dispatch_object_t)self->_callbackQueue);
  dispatch_release((dispatch_object_t)self->_reportingQueue);

  [(VCConnectionManager *)self deregisterPeriodicTask];
  reportingAgent = self->_reportingAgent;
  if (reportingAgent) {
    CFRelease(reportingAgent);
  }
  objc_storeWeak(&self->_delegate, 0);

  nwConnectionMonitorQueue = self->_nwConnectionMonitorQueue;
  if (nwConnectionMonitorQueue) {
    dispatch_release(nwConnectionMonitorQueue);
  }

  networkConditionMonitor = self->_networkConditionMonitor;
  if (networkConditionMonitor)
  {
    CFRelease(networkConditionMonitor);
    self->_networkConditionMonitor = 0;
  }
  if (self->_overlaySource)
  {
    VCOverlayManager_releaseOverlaySourceWithToken(self->_overlayToken, 2u);
    overlaySource = self->_overlaySource;
    if (overlaySource)
    {
      CFRelease(overlaySource);
      self->_overlaySource = 0;
    }
  }

  v15.receiver = self;
  v15.super_class = (Class)VCConnectionManager;
  [(VCConnectionManager *)&v15 dealloc];
}

- (void)invalidateNetworkConditionMonitor
{
}

- (void)setStatisticsCollector:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VCConnectionManager_setStatisticsCollector___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(callbackQueue, block);
}

unsigned char *__46__VCConnectionManager_setStatisticsCollector___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) unregisterStatisticsHandlers];

  *(void *)(*(void *)(a1 + 32) + 2944) = *(id *)(a1 + 40);
  result = *(unsigned char **)(a1 + 32);
  if (result[88])
  {
    return (unsigned char *)[result registerStatisticsHandlers];
  }
  return result;
}

- (void)registerStatisticsHandlers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  statisticsCollector = self->_statisticsCollector;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__VCConnectionManager_registerStatisticsHandlers__block_invoke;
  v11[3] = &unk_1E6DB3FA8;
  v11[4] = self;
  self->_int mediaHealthStatisticsHandlerIndex = [(AVCStatisticsCollector *)statisticsCollector registerStatisticsChangeHandlerWithType:10 handler:v11];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    double v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int mediaHealthStatisticsHandlerIndex = self->_mediaHealthStatisticsHandlerIndex;
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = v4;
      __int16 v14 = 2080;
      objc_super v15 = "-[VCConnectionManager registerStatisticsHandlers]";
      __int16 v16 = 1024;
      int v17 = 377;
      __int16 v18 = 1024;
      int v19 = mediaHealthStatisticsHandlerIndex;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Registered MediaHealthStatisticsHandlerIndex=%d", buf, 0x22u);
    }
  }
  v7 = self->_statisticsCollector;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__VCConnectionManager_registerStatisticsHandlers__block_invoke_62;
  v10[3] = &unk_1E6DB3FA8;
  v10[4] = self;
  self->_endToEndConnectionStatisticsHandlerIndex = [(AVCStatisticsCollector *)v7 registerStatisticsChangeHandlerWithType:2 handler:v10];
  uint32_t v8 = self->_statisticsCollector;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__VCConnectionManager_registerStatisticsHandlers__block_invoke_2;
  v9[3] = &unk_1E6DB3FA8;
  v9[4] = self;
  self->_serverBasedConnectionStatisticsHandlerIndex = [(AVCStatisticsCollector *)v8 registerStatisticsChangeHandlerWithType:5 handler:v9];
}

uint64_t __49__VCConnectionManager_registerStatisticsHandlers__block_invoke(uint64_t result, uint64_t a2)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = result;
  switch(*(_DWORD *)(a2 + 24))
  {
    case 5:
      if (*(unsigned char *)(a2 + 45)) {
        *(void *)(*(void *)(result + 32) + 672) = *(void *)(a2 + 8);
      }
      else {
        *(void *)(*(void *)(result + 32) + 672) = 0;
      }
      break;
    case 6:
      result = *(void *)(result + 32);
      if (!*(unsigned char *)(result + 3180) && *(unsigned char *)(result + 3181))
      {
        [(id)result updateMediaDegradedHistoryWithCurrentAudioErasure:&unk_1F3DC4668 idsParticipantID:*(float *)(a2 + 40)];
        result = *(void *)(v3 + 32);
      }
      if (*(unsigned char *)(result + 3181)) {
        *(void *)(result + 3544) = *(void *)(a2 + 80);
      }
      break;
    case 7:
      v15[0] = 0;
      *(void *)&buf[8] = 1;
      *(void *)buf = *(void *)(a2 + 8);
      *(void *)&buf[16] = fmin(*(double *)(a2 + 48), 1.0);
      uint64_t v4 = *(void **)(result + 32);
      uint64_t v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a2 + 80)];
      uint64_t v6 = (uint64_t *)buf;
      goto LABEL_17;
    case 8:
      uint64_t v12 = 0;
      uint64_t v11 = 1;
      uint64_t v10 = *(void *)(a2 + 8);
      if (*(double *)(a2 + 56) >= 1.0) {
        double v7 = *(double *)(a2 + 56);
      }
      else {
        double v7 = 0.0;
      }
      double v13 = v7;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = v8;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCConnectionManager registerStatisticsHandlers]_block_invoke";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v15[0]) = 373;
          WORD2(v15[0]) = 2048;
          *(double *)((char *)v15 + 6) = v7;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received video stall update videoStallTimeTotal=%.2f", buf, 0x26u);
        }
      }
      uint64_t v4 = *(void **)(v3 + 32);
      uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", *(void *)(a2 + 80), v10, v11, v12, *(void *)&v13);
      uint64_t v6 = &v10;
LABEL_17:
      result = [v4 updateMediaHealthStats:v6 idsParticipantID:v5];
      break;
    default:
      return result;
  }
  return result;
}

uint64_t __49__VCConnectionManager_registerStatisticsHandlers__block_invoke_62(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a2 + 176);
  v10[10] = *(_OWORD *)(a2 + 160);
  v10[11] = v3;
  uint64_t v11 = *(void *)(a2 + 192);
  long long v4 = *(_OWORD *)(a2 + 112);
  v10[6] = *(_OWORD *)(a2 + 96);
  v10[7] = v4;
  long long v5 = *(_OWORD *)(a2 + 144);
  v10[8] = *(_OWORD *)(a2 + 128);
  v10[9] = v5;
  long long v6 = *(_OWORD *)(a2 + 48);
  v10[2] = *(_OWORD *)(a2 + 32);
  v10[3] = v6;
  long long v7 = *(_OWORD *)(a2 + 80);
  v10[4] = *(_OWORD *)(a2 + 64);
  void v10[5] = v7;
  long long v8 = *(_OWORD *)(a2 + 16);
  v10[0] = *(_OWORD *)a2;
  v10[1] = v8;
  return [v2 updateConnectionHealthWithVCStatisticsMessage:v10];
}

uint64_t __49__VCConnectionManager_registerStatisticsHandlers__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a2 + 176);
  v10[10] = *(_OWORD *)(a2 + 160);
  v10[11] = v3;
  uint64_t v11 = *(void *)(a2 + 192);
  long long v4 = *(_OWORD *)(a2 + 112);
  v10[6] = *(_OWORD *)(a2 + 96);
  v10[7] = v4;
  long long v5 = *(_OWORD *)(a2 + 144);
  v10[8] = *(_OWORD *)(a2 + 128);
  v10[9] = v5;
  long long v6 = *(_OWORD *)(a2 + 48);
  v10[2] = *(_OWORD *)(a2 + 32);
  v10[3] = v6;
  long long v7 = *(_OWORD *)(a2 + 80);
  v10[4] = *(_OWORD *)(a2 + 64);
  void v10[5] = v7;
  long long v8 = *(_OWORD *)(a2 + 16);
  v10[0] = *(_OWORD *)a2;
  v10[1] = v8;
  return [v2 updateConnectionHealthWithVCStatisticsMessage:v10];
}

- (void)unregisterStatisticsHandlers
{
  [(AVCStatisticsCollector *)self->_statisticsCollector unregisterStatisticsChangeHandlerWithType:10 handlerIndex:self->_mediaHealthStatisticsHandlerIndex];
  [(AVCStatisticsCollector *)self->_statisticsCollector unregisterStatisticsChangeHandlerWithType:2 handlerIndex:self->_endToEndConnectionStatisticsHandlerIndex];
  statisticsCollector = self->_statisticsCollector;
  uint64_t serverBasedConnectionStatisticsHandlerIndex = self->_serverBasedConnectionStatisticsHandlerIndex;

  [(AVCStatisticsCollector *)statisticsCollector unregisterStatisticsChangeHandlerWithType:5 handlerIndex:serverBasedConnectionStatisticsHandlerIndex];
}

- (void)createNewConnectionStatsCollectorCallback
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__VCConnectionManager_createNewConnectionStatsCollectorCallback__block_invoke;
  v4[3] = &unk_1E6DB6E10;
  v4[4] = self;
  p_stateRWlock = &self->_stateRWlock;
  pthread_rwlock_wrlock(&self->_stateRWlock);
  self->_connectionStatsCollectorCallback = _Block_copy(v4);
  pthread_rwlock_unlock(p_stateRWlock);
}

uint64_t __64__VCConnectionManager_createNewConnectionStatsCollectorCallback__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) copyPersistenPacketCounts:a2 isOutgoing:a3 size:256];
}

- (void)releaseAndRemoveConnectionStatsCollectorCallback
{
  p_stateRWlock = &self->_stateRWlock;
  pthread_rwlock_wrlock(&self->_stateRWlock);
  _Block_release(self->_connectionStatsCollectorCallback);
  self->_connectionStatsCollectorCallback = 0;

  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)setupConnectionHealthMonitorMultiway
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_isOneToOneModeEnabled
    || [(VCConnectionManager *)self useMediaDrivenDuplication])
  {
    if (!self->_connectionHealthMonitor)
    {
      [(VCConnectionManager *)self setupConnectionHealthMonitor];
    }
  }
  else if (self->_startConnectionHealthMonitoring)
  {
    [(VCConnectionManager *)self setStartConnectionHealthMonitoring:0];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      long long v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v10 = 136315650;
        *(void *)&v10[4] = v3;
        *(_WORD *)&_OWORD v10[12] = 2080;
        *(void *)&v10[14] = "-[VCConnectionManager setupConnectionHealthMonitorMultiway]";
        *(_WORD *)&v10[22] = 1024;
        int v11 = 418;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: VCConnectionHealthMonitor stopped", v10, 0x1Cu);
      }
    }
    pthread_rwlock_wrlock(&self->_stateRWlock);
    int v5 = VCDuplicationHandler_DuplicationReason((uint64_t)self->_duplicationHandler);
    if (VCDuplicationHandler_IsDuplicationEnabled((BOOL)self->_duplicationHandler) && (v5 - 1) <= 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        long long v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          long long v8 = "remote-no-remote";
          *(void *)&v10[4] = v6;
          *(_DWORD *)uint64_t v10 = 136315906;
          *(void *)&v10[14] = "-[VCConnectionManager setupConnectionHealthMonitorMultiway]";
          *(_WORD *)&_OWORD v10[12] = 2080;
          if (v5 == 1) {
            long long v8 = "no-remote";
          }
          *(_WORD *)&v10[22] = 1024;
          int v11 = 422;
          __int16 v12 = 2080;
          double v13 = v8;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: stop dupe by %s.", v10, 0x26u);
        }
      }
      if (v5 == 2) {
        uint64_t v9 = 3;
      }
      else {
        uint64_t v9 = 1;
      }
      -[VCConnectionManager updateDuplicationStateWithEventType:](self, "updateDuplicationStateWithEventType:", v9, *(_OWORD *)v10, *(void *)&v10[16]);
    }
    pthread_rwlock_unlock(&self->_stateRWlock);
  }
}

- (void)setupConnectionHealthMonitor
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_alloc_init(VCConnectionHealthMonitor);
  self->_connectionHealthMonitor = v3;
  [(VCConnectionHealthMonitor *)v3 setDelegate:self];
  [(VCConnectionManager *)self setStartConnectionHealthMonitoring:!self->_isOneToOneModeEnabled];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    int v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315650;
      uint64_t v7 = v4;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCConnectionManager setupConnectionHealthMonitor]";
      __int16 v10 = 1024;
      int v11 = 433;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: VCConnectionHealthMonitor is running", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (void)setPreferRelayOverP2PEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v5 = self->_preferRelayOverP2PEnabled || a3;
  self->_BOOL preferRelayOverP2PEnabled = v5;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL preferRelayOverP2PEnabled = self->_preferRelayOverP2PEnabled;
      BOOL dropLinkRecommendation = self->_dropLinkRecommendation;
      int v10 = 136316418;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      double v13 = "-[VCConnectionManager setPreferRelayOverP2PEnabled:]";
      __int16 v14 = 1024;
      int v15 = 439;
      __int16 v16 = 1024;
      BOOL v17 = preferRelayOverP2PEnabled;
      __int16 v18 = 1024;
      BOOL v19 = v3;
      __int16 v20 = 1024;
      BOOL v21 = dropLinkRecommendation;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: _preferRelayOverP2PEnabled=%d preferRelayOverP2PEnabled=%d _dropLinkRecommendation=%d", (uint8_t *)&v10, 0x2Eu);
    }
  }
  if (!self->_dropLinkRecommendation) {
    [(VCConnectionManager *)self updateConnectionSelectionPolicyWithPreferE2E:self->_isOneToOneModeEnabled];
  }
}

- (void)setPreferRelayOverP2P:(BOOL)a3 reason:(unsigned __int8)a4
{
  int v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unsigned __int8 preferRelayOverP2PReason = self->_preferRelayOverP2PReason;
  unsigned __int8 v7 = preferRelayOverP2PReason | a4;
  unsigned __int8 v8 = preferRelayOverP2PReason & ~a4;
  if (a3) {
    unsigned __int8 v8 = v7;
  }
  self->_unsigned __int8 preferRelayOverP2PReason = v8;
  if (a4 == 4)
  {
    if ((v8 & 3) == 0) {
      self->_BOOL preferRelayOverP2PEnabled = a3;
    }
  }
  else
  {
    BOOL v9 = self->_preferRelayOverP2PEnabled || a3;
    self->_BOOL preferRelayOverP2PEnabled = v9;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL preferRelayOverP2PEnabled = self->_preferRelayOverP2PEnabled;
      int v13 = self->_preferRelayOverP2PReason;
      BOOL dropLinkRecommendation = self->_dropLinkRecommendation;
      int v15 = 136316418;
      uint64_t v16 = v10;
      __int16 v17 = 2080;
      __int16 v18 = "-[VCConnectionManager setPreferRelayOverP2P:reason:]";
      __int16 v19 = 1024;
      int v20 = 457;
      __int16 v21 = 1024;
      BOOL v22 = preferRelayOverP2PEnabled;
      __int16 v23 = 1024;
      int v24 = v13;
      __int16 v25 = 1024;
      BOOL v26 = dropLinkRecommendation;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: _preferRelayOverP2PEnabled=%d _preferRelayOverP2PReason=%d _dropLinkRecommendation=%d", (uint8_t *)&v15, 0x2Eu);
    }
  }
  if (v4 != 2 || !self->_dropLinkRecommendation) {
    [(VCConnectionManager *)self checkAndUpdatePrimaryConnection];
  }
}

- (void)setIsOneToOneModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  self->_isOneToOneModeEnabled = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v7 = "disabled";
      *(_DWORD *)unsigned __int8 v8 = 136315906;
      *(void *)&v8[4] = v5;
      *(_WORD *)&v8[12] = 2080;
      *(void *)&v8[14] = "-[VCConnectionManager setIsOneToOneModeEnabled:]";
      if (v3) {
        unsigned __int8 v7 = "enabled";
      }
      *(_WORD *)&v8[22] = 1024;
      int v9 = 468;
      __int16 v10 = 2080;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d oneToOneMode=%s", v8, 0x26u);
    }
  }
  [(VCConnectionManager *)self setupConnectionHealthMonitorMultiway];
  [(VCConnectionManager *)self checkAndUpdatePrimaryConnection];
}

- (void)setIsOneToOneScreenEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  self->_isOneToOneScreenEnabled = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v7 = "disabled";
      uint64_t v9 = v5;
      int v8 = 136315906;
      uint64_t v11 = "-[VCConnectionManager setIsOneToOneScreenEnabled:]";
      __int16 v10 = 2080;
      if (v3) {
        unsigned __int8 v7 = "enabled";
      }
      __int16 v12 = 1024;
      int v13 = 475;
      __int16 v14 = 2080;
      int v15 = v7;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d oneToOneScreenEnabled=%s", (uint8_t *)&v8, 0x26u);
    }
  }
  if (self->_shouldForceRelayLinksWhenScreenEnabled)
  {
    [(VCConnectionSelector *)self->_connectionSelector setCanUseP2PLinks:v3 ^ 1];
    self->_canUseP2PLinks = !v3;
    [(VCConnectionManager *)self setPreferRelayOverP2P:v3 reason:4];
    pthread_rwlock_wrlock(&self->_stateRWlock);
    VCConnectionManager_UpdateConnectionForDuplication((uint64_t)self);
    pthread_rwlock_unlock(&self->_stateRWlock);
  }
}

- (void)setStartConnectionHealthMonitoring:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_startConnectionHealthMonitoring = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      __int16 v10 = "-[VCConnectionManager setStartConnectionHealthMonitoring:]";
      __int16 v11 = 1024;
      int v12 = 488;
      __int16 v13 = 1024;
      BOOL v14 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: startConnectionHealthMonitoring=%d", (uint8_t *)&v7, 0x22u);
    }
  }
  [(VCConnectionManager *)self resetConnectionStatTimers];
  [(VCConnectionManager *)self createOverlaySource];
}

- (unsigned)sendSuccessCountSinceLastCheck
{
  return atomic_exchange((atomic_uint *volatile)&self->_sendSuccessCountSinceLastCheck, 0);
}

- (unsigned)sendFailureCountSinceLastCheck
{
  return atomic_exchange((atomic_uint *volatile)&self->_sendFailureCountSinceLastCheck, 0);
}

- (unint64_t)onTheWireTotalBytesReceivedSinceLastCheck
{
  return atomic_exchange((atomic_ullong *volatile)&self->_onTheWireTotalBytesReceivedSinceLastCheck, 0);
}

- (unint64_t)onTheWireTotalBytesSentSinceLastCheck
{
  return atomic_exchange((atomic_ullong *volatile)&self->_onTheWireTotalBytesSentSinceLastCheck, 0);
}

- (void)resetConnectionStatTimers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_startConnectionHealthMonitoring) {
    double v3 = micro();
  }
  else {
    double v3 = 0.0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v4;
      __int16 v8 = 2080;
      __int16 v9 = "-[VCConnectionManager resetConnectionStatTimers]";
      __int16 v10 = 1024;
      int v11 = 511;
      __int16 v12 = 2048;
      double v13 = v3;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Re-setting connection stat timers to now=%f", (uint8_t *)&v6, 0x26u);
    }
  }
  self->_localConnectionStats.lastReceivedPacketOnPrimaryTime = v3;
  self->_localConnectionStats.lastReceivedPacketTime = v3;
  self->_remoteConnectionStats.lastReceivedPacketOnPrimaryTime = v3;
  self->_remoteConnectionStats.lastReceivedPacketTime = v3;
}

- (VCConnectionProtocol)connectionForDuplication
{
  v2 = self->_connectionForDuplication;

  return v2;
}

- (BOOL)useMediaDrivenDuplication
{
  return self->_useMediaDrivenDuplication || self->_useMediaDrivenDuplicationFeatureFlag;
}

- (void)setUseMediaDrivenDuplication:(BOOL)a3
{
  self->_useMediaDrivenDuplication = a3;
  if ([(VCConnectionManager *)self useMediaDrivenDuplication])
  {
    objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"gk-p2p-media-degraded-threshold", @"mediaDegradedThreshold", &unk_1F3DC46B0, 1), "doubleValue");
    self->_mediaDegradedThreshold = v4;
  }

  [(VCConnectionManager *)self setupConnectionHealthMonitorMultiway];
}

- (void)start
{
  if (!self->_isStarted)
  {
    self->_isStarted = 1;
    [(VCConnectionManager *)self registerStatisticsHandlers];
    [(VCWifiAssistManager *)self->_vcWifiAssist addDelegate:self];
    if (!self->_isOneToOneModeEnabled) {
      [(VCConnectionManager *)self resetConnectionStatTimers];
    }
    [(VCConnectionManager *)self disableRemotePreferredInterfaceInference:0];
    [(VCCoreMotionManager *)self->_coreMotionManager startMonitoringMotionActivity];
    [(VCConnectionManager *)self createNewConnectionStatsCollectorCallback];
  }
}

- (void)stop
{
  if (self->_isStarted)
  {
    self->_isStarted = 0;
    [(VCWifiAssistManager *)self->_vcWifiAssist removeDelegate:self];
    VCConnectionManager_UseCellPrimaryInterface((uint64_t)self, 0);
    [(VCConnectionManager *)self unregisterStatisticsHandlers];
    [(VCConnectionStatisticsCollector *)self->_connectionStatsCollector stopPeriodicHistoryUpdate];
    [(VCConnectionManager *)self releaseAndRemoveConnectionStatsCollectorCallback];
    [(VCCoreMotionManager *)self->_coreMotionManager stopMonitoringMotionActivity];
    [(VCConnectionManager *)self destroyNWMonitors];
  }
}

- (VCConnectionManagerDelegate)delegate
{
  return (VCConnectionManagerDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void)registerPeriodicTask
{
}

uint64_t __43__VCConnectionManager_registerPeriodicTask__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "periodicTask:");
}

- (void)deregisterPeriodicTask
{
}

- (void)createOverlaySource
{
  int64_t overlayToken = self->_overlayToken;
  if (overlayToken)
  {
    if (!self->_overlaySource) {
      self->_overlaySource = (tagVCOverlaySource *)VCOverlayManager_createOverlaySourceForToken(overlayToken, 2u);
    }
  }
}

- (tagVCOverlaySource)overlaySource
{
  return self->_overlaySource;
}

- (void)periodicTask:(void *)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (self->_nwMonitor && !self->_ignoreNWConnectionMonitorNotification)
    {
      uint64_t frequencyBand = self->_lastWiFiNWStatistics.var0.wifi.frequencyBand;
      uint64_t btCoex = self->_lastWiFiNWStatistics.var0.wifi.btCoex;
      uint64_t qualityScoreDelayRx = self->_lastWiFiNWStatistics.var0.wifi.qualityScoreDelayRx;
      uint64_t qualityScoreDelayTx = self->_lastWiFiNWStatistics.var0.wifi.qualityScoreDelayTx;
      unsigned int qualityScoreLossRx = self->_lastWiFiNWStatistics.var0.wifi.qualityScoreLossRx;
      unsigned int qualityScoreLossTx = self->_lastWiFiNWStatistics.var0.wifi.qualityScoreLossTx;
      int qualityScoreChannel = self->_lastWiFiNWStatistics.var0.wifi.qualityScoreChannel;
      float offChannelTimeRatio = self->_lastWiFiNWStatistics.var0.wifi.offChannelTimeRatio;
      uint64_t maxRadioCoex = self->_lastWiFiNWStatistics.var0.wifi.maxRadioCoex;
      int64_t accumulatedOffChannelTime = self->_lastWiFiNWStatistics.var0.wifi.accumulatedOffChannelTime;
      uint64_t maxSingleOutagePeriod = self->_lastWiFiNWStatistics.var0.wifi.maxSingleOutagePeriod;
      float qualityScoreDelayRxAverage = self->_lastWiFiNWStatistics.var0.wifi.qualityScoreDelayRxAverage;
      float qualityScoreDelayTxAverage = self->_lastWiFiNWStatistics.var0.wifi.qualityScoreDelayTxAverage;
      float qualityScoreLossRxAverage = self->_lastWiFiNWStatistics.var0.wifi.qualityScoreLossRxAverage;
      float qualityScoreLossTxAverage = self->_lastWiFiNWStatistics.var0.wifi.qualityScoreLossTxAverage;
      float qualityScoreChannelAverage = self->_lastWiFiNWStatistics.var0.wifi.qualityScoreChannelAverage;
      *(float *)&double v3 = offChannelTimeRatio;
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v3), @"NWOffChannel");
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", btCoex), @"NWBtCoex");
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", frequencyBand), @"NWFreqBand");
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", maxRadioCoex), @"NWRadioCoexMax");
      int64_t v28 = accumulatedOffChannelTime;
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", accumulatedOffChannelTime), @"NWOffChannelTime");
      int v29 = maxSingleOutagePeriod;
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", maxSingleOutagePeriod), @"NWOutagePeriodMax");
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", qualityScoreDelayRx), @"NWQualityDelayRx");
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", qualityScoreDelayTx), @"NWQualityDelayTx");
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", qualityScoreLossRx), @"NWQualityLossRx");
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", qualityScoreLossTx), @"NWQualityLossTx");
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:"), @"NWQualityChannel");
      *(float *)&double v19 = qualityScoreDelayRxAverage;
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v19), @"NWQualityDelayRxAvg");
      *(float *)&double v20 = qualityScoreDelayTxAverage;
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v20), @"NWQualityDelayTxAvg");
      *(float *)&double v21 = qualityScoreLossRxAverage;
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v21), @"NWQualityLossRxAvg");
      *(float *)&double v22 = qualityScoreLossTxAverage;
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v22), @"NWQualityLossTxAvg");
      *(float *)&double v23 = qualityScoreChannelAverage;
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v23), @"NWQualityChannelAvg");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        __int16 v25 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          nwMonitorWiFiInterfaceName = self->_nwMonitorWiFiInterfaceName;
          *(_DWORD *)buf = 136318978;
          *(void *)&uint8_t buf[4] = v24;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCConnectionManager periodicTask:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&unsigned char buf[24] = 646;
          *(_WORD *)&buf[28] = 2048;
          *(void *)&buf[30] = self;
          __int16 v37 = 2112;
          v38 = nwMonitorWiFiInterfaceName;
          __int16 v39 = 2048;
          double v40 = offChannelTimeRatio;
          __int16 v41 = 1024;
          int v42 = btCoex;
          __int16 v43 = 1024;
          int v44 = frequencyBand;
          __int16 v45 = 1024;
          int v46 = qualityScoreDelayRx;
          __int16 v47 = 1024;
          int v48 = qualityScoreDelayTx;
          __int16 v49 = 1024;
          unsigned int v50 = qualityScoreLossRx;
          __int16 v51 = 1024;
          unsigned int v52 = qualityScoreLossTx;
          __int16 v53 = 1024;
          int v54 = qualityScoreChannel;
          __int16 v55 = 1024;
          int v56 = maxRadioCoex;
          __int16 v57 = 2048;
          int64_t v58 = v28;
          __int16 v59 = 1024;
          int v60 = v29;
          _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @=@ Health: VCConnectionManager [%p] interfaceName=%@ offChannelRatio=%2.3f btCoex=%d frequencyBand=%d qualityScoreDelayRx=%d qualityScoreDelayTx=%d qualityScoreLossRx=%d qualityScoreLossTx=%d qualityScoreChannel=%d maxRadioCoex=0x%X accumulatedOffChannelTime=%lld maxSingleOutagePeriod=%u", buf, 0x7Au);
        }
      }
      VCNWConnectionMonitor_ResetWlanStats((uint64_t)self->_nwMonitor);
    }
    memset(buf, 0, 32);
    VTP_GetReportingStats(buf);
    int64_t v33 = *(void *)&buf[16] - self->_lastReceivedReportingStats.totalUplinkIngressPackets;
    int64_t v35 = *(void *)buf - self->_lastReceivedReportingStats.totalDownlinkIngressMediaPackets;
    int64_t v34 = *(void *)&buf[8] - self->_lastReceivedReportingStats.totalDownlinkEgressMediaPackets;
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", *(void *)&buf[24] - self->_lastReceivedReportingStats.totalUplinkEgressPackets), @"VTPUplinkEgressPkts");
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", v33), @"VTPUplinkIngressPkts");
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", v35), @"VTPDownlinkIngressMediaPkts");
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", v34), @"VTPDownlinkEgressMediaPkts");
    long long v27 = *(_OWORD *)buf;
    *(_OWORD *)&self->_lastReceivedReportingStats.totalUplinkIngressPackets = *(_OWORD *)&buf[16];
    *(_OWORD *)&self->_lastReceivedReportingStats.totalDownlinkIngressMediaPackets = v27;
  }
}

- (void)setReportingAgent:(opaqueRTCReporting *)a3
{
  if (a3) {
    CFRetain(a3);
  }
  pthread_rwlock_wrlock(&self->_stateRWlock);
  if (self->_reportingAgent)
  {
    [(VCConnectionManager *)self deregisterPeriodicTask];
    reportingAgent = self->_reportingAgent;
  }
  else
  {
    reportingAgent = 0;
  }
  self->_reportingAgent = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (reportingAgent) {
    CFRelease(reportingAgent);
  }
  if (a3) {
    CFRelease(a3);
  }
  [(VCConnectionManager *)self registerPeriodicTask];

  pthread_rwlock_unlock(&self->_stateRWlock);
}

- (void)setConnectionSelectionVersionWithLocalFrameworkVersion:(id)a3 remoteFrameworkVersion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unsigned int v7 = -[VCConnectionManager getConnectionSelectionVersionFromFrameworkVersion:](self, "getConnectionSelectionVersionFromFrameworkVersion:");
  unsigned int v8 = [(VCConnectionManager *)self getConnectionSelectionVersionFromFrameworkVersion:a4];
  if (v7 >= v8) {
    int v9 = v8;
  }
  else {
    int v9 = v7;
  }
  self->_int connectionSelectionVersion = v9;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    int v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int connectionSelectionVersion = self->_connectionSelectionVersion;
      int v13 = 136316418;
      uint64_t v14 = v10;
      __int16 v15 = 2080;
      uint64_t v16 = "-[VCConnectionManager setConnectionSelectionVersionWithLocalFrameworkVersion:remoteFrameworkVersion:]";
      __int16 v17 = 1024;
      int v18 = 684;
      __int16 v19 = 1024;
      int v20 = connectionSelectionVersion;
      __int16 v21 = 2112;
      id v22 = a3;
      __int16 v23 = 2112;
      id v24 = a4;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: setting connection selection version=%d localFrameworkVersion=%@ remoteFrameworkVersion=%@", (uint8_t *)&v13, 0x36u);
    }
  }
  [(VCConnectionManager *)self updateScreenShareRelaySetting];
  [(VCConnectionManager *)self updateConnectionSelectionPolicyWithPreferE2E:self->_isOneToOneModeEnabled];
  [(VCDuplicationHandler *)self->_duplicationHandler setIsRemotePreAzul:[(VCConnectionManager *)self getConnectionSelectionVersionFromFrameworkVersion:a4] < 3];
  [(VCConnectionManager *)self checkAndUpdatePrimaryConnection];
}

- (void)updateScreenShareRelaySetting
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t connectionSelectionVersion = self->_connectionSelectionVersion;
  if (connectionSelectionVersion <= 6) {
    self->_int shouldForceRelayLinksWhenScreenEnabled = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-force-relay-when-screen-enabled", @"forceRelayWhenScreenEnabled", qword_1E6DB6F10[connectionSelectionVersion], 0), "intValue");
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int shouldForceRelayLinksWhenScreenEnabled = self->_shouldForceRelayLinksWhenScreenEnabled;
      int v7 = 136315906;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCConnectionManager updateScreenShareRelaySetting]";
      __int16 v11 = 1024;
      int v12 = 705;
      __int16 v13 = 1024;
      int v14 = shouldForceRelayLinksWhenScreenEnabled;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: shouldForceRelayLinksWhenScreenEnabled=%d", (uint8_t *)&v7, 0x22u);
    }
  }
}

- (void)checkAndUpdatePrimaryConnection
{
  [(VCConnectionManager *)self updateConnectionSelectionPolicyWithPreferE2E:self->_isOneToOneModeEnabled];
  pthread_rwlock_wrlock(&self->_stateRWlock);
  if ([(VCConnectionManager *)self isBetterPrimaryConnectionAvailable]) {
    [(VCConnectionManager *)self reselectPrimaryConnection];
  }

  pthread_rwlock_unlock(&self->_stateRWlock);
}

- (BOOL)isBetterPrimaryConnectionAvailable
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  connectionArray = self->_connectionArray;
  uint64_t v4 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v12;
  BOOL v7 = 1;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v6) {
      objc_enumerationMutation(connectionArray);
    }
    if ([(VCConnectionManager *)self isBetterConnection:*(void *)(*((void *)&v11 + 1) + 8 * v8) asPrimary:1])
    {
      return v7;
    }
    if (v5 == ++v8)
    {
      uint64_t v5 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v11 objects:v10 count:16];
      if (v5) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)setDuplicationCallback:(void *)a3 withContext:(void *)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  callbackQueue = self->_callbackQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__VCConnectionManager_setDuplicationCallback_withContext___block_invoke;
  v5[3] = &unk_1E6DB4518;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(callbackQueue, v5);
}

void *__58__VCConnectionManager_setDuplicationCallback_withContext___block_invoke(void *result)
{
  *(void *)(result[4] + 456) = result[5];
  *(void *)(result[4] + 488) = result[6];
  return result;
}

- (void)setConnectionPause:(BOOL)a3 isLocalConnection:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double v7 = micro();
  p_stateRWlock = &self->_stateRWlock;
  pthread_rwlock_wrlock(&self->_stateRWlock);
  uint64_t v9 = 576;
  if (v4) {
    uint64_t v9 = 528;
  }
  uint64_t v10 = (char *)self + v9;
  if (!v5 && v10[40])
  {
    double v11 = 0.0;
    if (self->_startConnectionHealthMonitoring) {
      double v11 = v7;
    }
    self->_localConnectionStats.lastReceivedPacketTime = v11;
    self->_localConnectionStats.lastReceivedPacketOnPrimaryTime = v11;
    self->_remoteConnectionStats.lastReceivedPacketTime = v11;
    self->_remoteConnectionStats.lastReceivedPacketOnPrimaryTime = v11;
  }
  v10[40] = v5;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    long long v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136316162;
      uint64_t v15 = v12;
      __int16 v16 = 2080;
      __int16 v17 = "-[VCConnectionManager setConnectionPause:isLocalConnection:]";
      __int16 v18 = 1024;
      int v19 = 744;
      __int16 v20 = 1024;
      BOOL v21 = v4;
      __int16 v22 = 1024;
      BOOL v23 = v5;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d local? %d, audio paused? %d", (uint8_t *)&v14, 0x28u);
    }
  }
  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)setiRATDuplicationEnabled:(BOOL)a3
{
  self->_iRATDuplicationEnabled = a3;
}

- (BOOL)isDuplicationEnabled
{
  return VCDuplicationHandler_IsDuplicationEnabled((BOOL)self->_duplicationHandler);
}

- (void)copyPersistenPacketCounts:(unsigned int *)a3 isOutgoing:(BOOL)a4 size:(int)a5
{
  if (a5 == 256)
  {
    BOOL v5 = a4;
    p_stateRWlock = &self->_stateRWlock;
    pthread_rwlock_wrlock(&self->_stateRWlock);
    uint64_t v9 = 1888;
    if (v5) {
      uint64_t v9 = 864;
    }
    memcpy(a3, (char *)self + v9, 0x400uLL);
    pthread_rwlock_unlock(p_stateRWlock);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCConnectionManager copyPersistenPacketCounts:isOutgoing:size:]();
    }
  }
}

- (int)setWRMUpdateCallback:(void *)a3 requestNotificationCallback:(void *)a4 withContext:(void *)a5 completionHandler:(id)a6
{
  v8[9] = *MEMORY[0x1E4F143B8];
  callbackQueue = self->_callbackQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __102__VCConnectionManager_setWRMUpdateCallback_requestNotificationCallback_withContext_completionHandler___block_invoke;
  v8[3] = &unk_1E6DB6E38;
  v8[6] = a3;
  v8[7] = a4;
  v8[8] = a5;
  v8[4] = self;
  v8[5] = a6;
  dispatch_async(callbackQueue, v8);
  return 0;
}

uint64_t __102__VCConnectionManager_setWRMUpdateCallback_requestNotificationCallback_withContext_completionHandler___block_invoke(void *a1)
{
  *(void *)(a1[4] + 712) = a1[6];
  *(void *)(a1[4] + 720) = a1[7];
  *(void *)(a1[4] + 728) = a1[8];
  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setRemotePreWarmStateEnabled:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_remotePreWarmStateEnabled != a3)
  {
    self->_BOOL remotePreWarmStateEnabled = a3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      BOOL v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL remotePreWarmStateEnabled = self->_remotePreWarmStateEnabled;
        double v7 = "Start";
        *(_DWORD *)buf = 136316162;
        if (!remotePreWarmStateEnabled) {
          double v7 = "Stop";
        }
        uint64_t v11 = v4;
        __int16 v12 = 2080;
        long long v13 = "-[VCConnectionManager setRemotePreWarmStateEnabled:]";
        __int16 v14 = 1024;
        int v15 = 1003;
        __int16 v16 = 1024;
        BOOL v17 = remotePreWarmStateEnabled;
        __int16 v18 = 2080;
        int v19 = v7;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: set remote pre-warm state to %d. %s active probing on links", buf, 0x2Cu);
      }
    }
    pthread_rwlock_wrlock(&self->_stateRWlock);
    VCConnectionManager_SetActiveLinkProbingEnabled((uint64_t)self, self->_remotePreWarmStateEnabled);
    VCConnectionManager_AlertStateUpdated(self, self->_remotePreWarmStateEnabled, 0);
    pthread_rwlock_unlock(&self->_stateRWlock);
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", self->_remotePreWarmStateEnabled, @"WRMRemAlrtUpdate");
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    reportingGenericEvent();
  }
}

- (void)setIsRemoteMediaQualityDegraded:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_BOOL isRemoteMediaQualityDegraded = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    BOOL v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL isRemoteMediaQualityDegraded = self->_isRemoteMediaQualityDegraded;
      int v7 = 136315906;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCConnectionManager setIsRemoteMediaQualityDegraded:]";
      __int16 v11 = 1024;
      int v12 = 1015;
      __int16 v13 = 1024;
      BOOL v14 = isRemoteMediaQualityDegraded;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Set isRemoteMediaQualityDegraded=%d", (uint8_t *)&v7, 0x22u);
    }
  }
  [(VCConnectionManager *)self checkForCachedWRMNotification];
}

- (void)setIsRemoteNetworkQualityDegraded:(BOOL)a3
{
  self->_isRemoteNetworkQualityDegraded = a3;
  VCNetworkConditionMonitor_SetRemoteNetworkQuality((uint64_t)self->_networkConditionMonitor, a3);
}

- (BOOL)isDuplicationAllowed
{
  BOOL v3 = [(VCConnectionManager *)self useMediaDrivenDuplication]
    || !self->_isOneToOneModeEnabled;
  if (([(VCConnectionManager *)self useMediaDrivenDuplication]
     || self->_isOneToOneModeEnabled)
    && !self->_isDuplicationAllowedForMediaDegraded)
  {
    BOOL isRemoteMediaQualityDegraded = self->_isRemoteMediaQualityDegraded;
    if (!self->_isRemoteMediaQualityDegraded || !v3)
    {
      self->_isDuplicationAllowed = isRemoteMediaQualityDegraded;
      if (!isRemoteMediaQualityDegraded) {
        return self->_isUserMoving;
      }
      return 1;
    }
  }
  else if (!v3)
  {
    BOOL result = 1;
    self->_isDuplicationAllowed = 1;
    return result;
  }
  signed int downlinkTargetBitrate = self->_downlinkTargetBitrate;
  signed int v8 = self->_wrmPendingBitrateCapDelta + self->_downlinkTargetCellBitrateCap;
  self->_isDuplicationAllowed = downlinkTargetBitrate <= v8;
  if (downlinkTargetBitrate > v8) {
    return self->_isUserMoving;
  }
  return 1;
}

- (void)setDuplicationDownlinkCellBitrateCap:(unsigned int)a3 currentBitrate:(unsigned int)a4
{
  self->_downlinkTargetCellBitrateCap = a3;
  self->_signed int downlinkTargetBitrate = a4;
  [(VCConnectionManager *)self checkForCachedWRMNotification];
}

- (void)checkForCachedWRMNotification
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL isWRMNotificationPending = self->_isWRMNotificationPending;
      BOOL v6 = [(VCConnectionManager *)self isDuplicationAllowed];
      BOOL isUserMoving = self->_isUserMoving;
      int v17 = 136316418;
      uint64_t v18 = v3;
      __int16 v19 = 2080;
      uint64_t v20 = "-[VCConnectionManager checkForCachedWRMNotification]";
      __int16 v21 = 1024;
      int v22 = 1110;
      __int16 v23 = 1024;
      int v24 = isWRMNotificationPending;
      __int16 v25 = 1024;
      BOOL v26 = v6;
      __int16 v27 = 1024;
      BOOL v28 = isUserMoving;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Checking for cached WRM notification _isWRMNotificationPending=%d isDuplicationAllowed=%d _isUserMoving=%d", (uint8_t *)&v17, 0x2Eu);
    }
  }
  if ([(VCConnectionManager *)self isDuplicationAllowed] && self->_isWRMNotificationPending)
  {
    self->_BOOL isWRMNotificationPending = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      __int16 v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int linkTypeSuggestion = self->_savedWRMNotification.linkTypeSuggestion;
        BOOL isDuplicationAllowedForMediaDegraded = self->_isDuplicationAllowedForMediaDegraded;
        BOOL isRemoteMediaQualityDegraded = self->_isRemoteMediaQualityDegraded;
        unsigned int downlinkTargetBitrate = self->_downlinkTargetBitrate;
        unsigned int downlinkTargetCellBitrateCap = self->_downlinkTargetCellBitrateCap;
        int wrmPendingBitrateCapDelta = self->_wrmPendingBitrateCapDelta;
        BOOL v16 = self->_isUserMoving;
        int v17 = 136317442;
        uint64_t v18 = v8;
        __int16 v19 = 2080;
        uint64_t v20 = "-[VCConnectionManager checkForCachedWRMNotification]";
        __int16 v21 = 1024;
        int v22 = 1115;
        __int16 v23 = 1024;
        int v24 = linkTypeSuggestion;
        __int16 v25 = 1024;
        BOOL v26 = isDuplicationAllowedForMediaDegraded;
        __int16 v27 = 1024;
        BOOL v28 = isRemoteMediaQualityDegraded;
        __int16 v29 = 1024;
        unsigned int v30 = downlinkTargetBitrate;
        __int16 v31 = 1024;
        unsigned int v32 = downlinkTargetCellBitrateCap;
        __int16 v33 = 1024;
        int v34 = wrmPendingBitrateCapDelta;
        __int16 v35 = 1024;
        BOOL v36 = v16;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Processing iRAT notification (cached) WRM suggestion=%d isDuplicationAllowedForMediaDegraded=%d isRemoteMediaQualityDegraded=%d currentTargetBitrate=%d cellBitrateCap=%d bitrateCapDelta=%d isUserMoving=%d", (uint8_t *)&v17, 0x46u);
      }
    }
    VCConnectionManager_ProcessWRMNotification((uint64_t)self, &self->_savedWRMNotification.applicationType);
  }
}

- (void)processWRMCoexMetrics:(id)a3
{
}

- (int)processRemoteWRMSuggestion:(int)a3 isRemoteDuplicating:(BOOL)a4
{
  BOOL v4 = a4;
  int v7 = -[VCWRMHandler processRemoteWRMSuggestion:isRemoteDuplicating:](self->_wrmHandler, "processRemoteWRMSuggestion:isRemoteDuplicating:");
  if (!v7) {
    return -2144796671;
  }
  if (v7 == 3)
  {
    pthread_rwlock_wrlock(&self->_stateRWlock);
    int v8 = [(VCWRMHandler *)self->_wrmHandler remoteWRMLinkTypeSuggestion];
    uint64_t v9 = 0x10000;
    if (!v4) {
      uint64_t v9 = 0;
    }
    unint64_t v10 = v9 | ((unint64_t)(a3 != 0) << 40);
    uint64_t v11 = 6;
    if (v8 == 1) {
      uint64_t v11 = 7;
    }
    if (VCDuplicationHandler_HandleDuplicationStateUpdateEvent(self->_duplicationHandler, v10 | v11, 0)) {
      VCConnectionManager_SetDuplicationEnabledInternal((uint64_t)self, [(VCConnectionManager *)self isDuplicationEnabled]);
    }
    pthread_rwlock_unlock(&self->_stateRWlock);
  }
  return 0;
}

- (int)connectionCount
{
  v2 = (uint64_t (**)(void))self;
  p_stateRWlock = &self->_stateRWlock;
  pthread_rwlock_rdlock(&self->_stateRWlock);
  LODWORD(v2) = VCConnectionManager_GetNumberOfConnectionsInternal(v2);
  pthread_rwlock_unlock(p_stateRWlock);
  return (int)v2;
}

- (void)getSentBytes:(int64_t *)a3 receivedBytes:(int64_t *)a4
{
  if (a3 && a4)
  {
    if ((self->_initialSentBytes & 0x8000000000000000) == 0 && !VTP_GetSendRecvStats(a3, a4))
    {
      *a3 -= self->_initialSentBytes;
      *a4 -= self->_initialReceivedBytes;
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCConnectionManager getSentBytes:receivedBytes:]();
    }
  }
}

- (int)getConnectionTypeForActiveConnectionWithQuality:(int)a3 forLocalInterface:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = (void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self, a3);
  if (!v5) {
    return -1;
  }
  BOOL v6 = v5;
  if (v4) {
    int v7 = [v5 localConnectionType];
  }
  else {
    int v7 = [v5 remoteConnectionType];
  }
  int v8 = v7;
  CFRelease(v6);
  return v8;
}

- (int)getCellularTechForActiveConnectionWithQuality:(int)a3 forLocalInterface:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = VCConnectionManager_CopyConnectionForQuality((uint64_t)self, a3);
  if (!v5) {
    return 0;
  }
  BOOL v6 = (const void *)v5;
  if (v4) {
    int v7 = VCConnection_LocalCellTech(v5);
  }
  else {
    int v7 = VCConnection_RemoteCellTech(v5);
  }
  int v8 = v7;
  CFRelease(v6);
  return v8;
}

- (int)getCellularMTUForActiveConnectionWithQuality:(int)a3
{
  uint64_t v3 = (void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self, a3);
  int v4 = [v3 connectionMTU];
  if (v3) {
    CFRelease(v3);
  }
  return v4;
}

- (BOOL)isConnectedOnIPv6ForActiveConnectionWithQuality:(int)a3
{
  uint64_t v3 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self, a3);
  IsIPBOOL v6 = VCConnection_IsIPv6((uint64_t)v3);
  if (v3) {
    CFRelease(v3);
  }
  return IsIPv6;
}

- (BOOL)isConnectedOnRelayForActiveConnectionWithQuality:(int)a3
{
  uint64_t v3 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self, a3);
  char IsRelay = VCConnection_IsRelay((uint64_t)v3);
  if (v3) {
    CFRelease(v3);
  }
  return IsRelay;
}

- (unsigned)getPacketCountWithIndex:(unsigned __int8)a3 isOutgoing:(BOOL)a4
{
}

- (unsigned)getByteCountWithIndex:(unsigned __int8)a3 isOutgoing:(BOOL)a4
{
}

- (void)updateSessionStats:(unsigned __int16)a3
{
}

- (void)addMediaHealthStatsHistoryEntryForParticipantID:(id)a3
{
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaDegradedHistories, "objectForKeyedSubscript:"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCConnectionManager addMediaHealthStatsHistoryEntryForParticipantID:]();
      }
    }
  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaDegradedHistories, "setObject:forKeyedSubscript:", [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F3DC76F8], a3);
    [(NSMutableDictionary *)self->_mediaDegradedHistoryIndices setObject:&unk_1F3DC4668 forKeyedSubscript:a3];
    aggregateStallTimeDuration = self->_aggregateStallTimeDuration;
    [(NSMutableDictionary *)aggregateStallTimeDuration setObject:&unk_1F3DC8AC0 forKeyedSubscript:a3];
  }
}

- (void)removeMediaHealthStatsHistoryEntryForParticipantID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaDegradedHistories, "objectForKeyedSubscript:"))
  {
    [(NSMutableDictionary *)self->_mediaDegradedHistories removeObjectForKey:a3];
    [(NSMutableDictionary *)self->_mediaDegradedHistoryIndices removeObjectForKey:a3];
    aggregateStallTimeDuration = self->_aggregateStallTimeDuration;
    [(NSMutableDictionary *)aggregateStallTimeDuration removeObjectForKey:a3];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int v7 = *MEMORY[0x1E4F47A50];
    int v8 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315906;
        uint64_t v10 = v6;
        __int16 v11 = 2080;
        int v12 = "-[VCConnectionManager removeMediaHealthStatsHistoryEntryForParticipantID:]";
        __int16 v13 = 1024;
        int v14 = 1466;
        __int16 v15 = 2112;
        id v16 = a3;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d idsParticipantID %@ is not yet added to mediaDegradedHistories!", (uint8_t *)&v9, 0x26u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[VCConnectionManager removeMediaHealthStatsHistoryEntryForParticipantID:]();
    }
  }
}

- (void)duplicationStateUpdateWithEvent:(id)a3
{
  uint64_t v3 = *(void *)&a3.var8;
  uint64_t v4 = *(void *)&a3.var0;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_stateRWlock = &self->_stateRWlock;
  pthread_rwlock_wrlock(&self->_stateRWlock);
  unint64_t updated = VCDuplicationHandler_HandleDuplicationStateUpdateEvent(self->_duplicationHandler, v4, v3);
  if (updated)
  {
    VCConnectionManager_SetDuplicationEnabledInternal((uint64_t)self, [(VCConnectionManager *)self isDuplicationEnabled]);
    if ((updated & 0x100) != 0)
    {
      BOOL v8 = [(VCConnectionManager *)self isDuplicationEnabled];
      delegateQueue = self->_delegateQueue;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __55__VCConnectionManager_duplicationStateUpdateWithEvent___block_invoke;
      v10[3] = &unk_1E6DB45E0;
      v10[4] = self;
      __int16 v11 = updated;
      __int16 v13 = HIWORD(updated);
      int v12 = updated >> 16;
      BOOL v14 = v8;
      dispatch_async(delegateQueue, v10);
    }
  }
  VCConnectionManager_UpdateConnectionForDuplication((uint64_t)self);
  pthread_rwlock_unlock(p_stateRWlock);
}

uint64_t __55__VCConnectionManager_duplicationStateUpdateWithEvent___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = [*(id *)(a1 + 32) preferredLocalInterfaceForDuplication];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 41);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 48);

  return [v2 didUpdatePreferredInterfaceForDuplication:v3 notifyPeer:v4 enableDuplication:v5 isMediaUnrecoverableSignal:1];
}

- (void)aggregateStallTimeDuration:(id *)a3 idsParticipantID:(id)a4
{
  if (a3->var3 <= 0.0)
  {
    aggregateStallTimeDuration = self->_aggregateStallTimeDuration;
    uint64_t v6 = &unk_1F3DC8AC0;
  }
  else
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithDouble:");
    aggregateStallTimeDuration = self->_aggregateStallTimeDuration;
  }

  [(NSMutableDictionary *)aggregateStallTimeDuration setObject:v6 forKeyedSubscript:a4];
}

- (void)checkMediaQualityDegradedForParticipantID:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_aggregateStallTimeDuration, "objectForKeyedSubscript:", a3), "doubleValue");
      double mediaDegradedThreshold = self->_mediaDegradedThreshold;
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = v5;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCConnectionManager checkMediaQualityDegradedForParticipantID:]";
      __int16 v18 = 1024;
      int v19 = 1499;
      __int16 v20 = 2048;
      uint64_t v21 = v8;
      __int16 v22 = 2048;
      double v23 = mediaDegradedThreshold;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Aggregated stall time duration=%.2f Media degraded threshold=%.2f", buf, 0x30u);
    }
  }
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_aggregateStallTimeDuration, "objectForKeyedSubscript:", a3), "doubleValue");
  if (v9 <= self->_mediaDegradedThreshold)
  {
    if (self->_isDuplicationAllowedForMediaDegraded)
    {
      self->_BOOL isDuplicationAllowedForMediaDegraded = 0;
      delegateQueue = self->_delegateQueue;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __65__VCConnectionManager_checkMediaQualityDegradedForParticipantID___block_invoke_2;
      v12[3] = &unk_1E6DB3DC8;
      v12[4] = self;
      dispatch_async(delegateQueue, v12);
    }
  }
  else
  {
    if (!self->_isDuplicationAllowedForMediaDegraded)
    {
      uint64_t v10 = self->_delegateQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__VCConnectionManager_checkMediaQualityDegradedForParticipantID___block_invoke;
      block[3] = &unk_1E6DB3DC8;
      block[4] = self;
      dispatch_async(v10, block);
    }
    self->_BOOL isDuplicationAllowedForMediaDegraded = 1;
    [(VCConnectionManager *)self checkForCachedWRMNotification];
  }
}

uint64_t __65__VCConnectionManager_checkMediaQualityDegradedForParticipantID___block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) delegate];

  return [v1 didMediaQualityDegrade:1];
}

uint64_t __65__VCConnectionManager_checkMediaQualityDegradedForParticipantID___block_invoke_2(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) delegate];

  return [v1 didMediaQualityDegrade:0];
}

- (void)updateMediaHealthStats:(id *)a3 idsParticipantID:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->_mediaDegradedHistories objectForKeyedSubscript:a4])
  {
    if ([(VCConnectionManager *)self useMediaDrivenDuplication])
    {
      if (self->_resetMediaHealthStats)
      {
        [(VCConnectionManager *)self resetMediaHealthStats];
        self->_resetMediaHealthStats = 0;
      }
      BOOL var1 = a3->var1;
      self->_isVideoExpected = var1;
      if (var1)
      {
        [(VCConnectionManager *)self updateMediaDegradedHistoryWithCurrentVideoStallDuration:a4 idsParticipantID:a3->var2];
        [(VCConnectionManager *)self aggregateStallTimeDuration:a3 idsParticipantID:a4];
      }
      if (self->_isOneToOneModeEnabled)
      {
        double lastTransitionToFECTime = self->_lastTransitionToFECTime;
        if (lastTransitionToFECTime == 0.0
          || a3->var0 - lastTransitionToFECTime <= self->_mediaDegradedThreshold
          || (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_aggregateStallTimeDuration, "objectForKeyedSubscript:", a4), "doubleValue"), v9 <= self->_mediaDegradedThreshold))
        {
          if (a3->var1)
          {
            if (a3->var3 != 0.0) {
              return;
            }
          }
          else if (!self->_isPrimaryLinkUsable)
          {
            return;
          }
          uint64_t v10 = self;
          uint64_t v11 = 15;
        }
        else
        {
          uint64_t v10 = self;
          uint64_t v11 = 14;
        }
        -[VCConnectionManager duplicationStateUpdateWithEvent:](v10, "duplicationStateUpdateWithEvent:", v11, 0);
      }
    }
    else if (self->_isOneToOneModeEnabled)
    {
      [(VCConnectionManager *)self aggregateStallTimeDuration:a3 idsParticipantID:a4];
      [(VCConnectionManager *)self checkMediaQualityDegradedForParticipantID:a4];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int16 v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315650;
        uint64_t v15 = v12;
        __int16 v16 = 2080;
        uint64_t v17 = "-[VCConnectionManager updateMediaHealthStats:idsParticipantID:]";
        __int16 v18 = 1024;
        int v19 = 1527;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Ignoring media health stats update", (uint8_t *)&v14, 0x1Cu);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCConnectionManager updateMediaHealthStats:idsParticipantID:]();
    }
  }
}

- (void)updateMediaDegradedHistoryWithValue:(double)a3 idsParticipantID:(id)a4
{
  if (a3 >= 0.0)
  {
    int v8 = (int)(objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaDegradedHistoryIndices, "objectForKeyedSubscript:"), "intValue")+ 1)% 5;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaDegradedHistoryIndices, "setObject:forKeyedSubscript:", [NSNumber numberWithInt:v8], a4);
    uint64_t v9 = [NSNumber numberWithDouble:a3];
    uint64_t v10 = (void *)[(NSMutableDictionary *)self->_mediaDegradedHistories objectForKeyedSubscript:a4];
    [v10 setObject:v9 atIndexedSubscript:v8];
  }
}

- (BOOL)isDuplicationAllowedForParticipantID:(id)a3 bucketsToSum:(int)a4 threshold:(double)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((a4 - 6) > 0xFFFFFFFA)
  {
    int v9 = a4;
  }
  else
  {
    int v9 = 5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136316162;
        uint64_t v18 = v10;
        __int16 v19 = 2080;
        uint64_t v20 = "-[VCConnectionManager isDuplicationAllowedForParticipantID:bucketsToSum:threshold:]";
        __int16 v21 = 1024;
        int v22 = 1577;
        __int16 v23 = 1024;
        int v24 = a4;
        __int16 v25 = 1024;
        int v26 = 5;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Invalid bucketsToSum %d, defaulting to %d", (uint8_t *)&v17, 0x28u);
      }
    }
  }
  signed int v12 = (int)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaDegradedHistoryIndices, "objectForKeyedSubscript:", a3), "intValue")% 5;
  unsigned int v13 = v9 + 1;
  double v14 = 0.0;
  do
  {
    objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaDegradedHistories, "objectForKeyedSubscript:", a3), "objectAtIndexedSubscript:", v12), "doubleValue");
    double v14 = v14 + v15;
    signed int v12 = (v12 + 4) % 5u;
    --v13;
  }
  while (v13 > 1);
  return v14 / (double)v9 * 100.0 > a5;
}

- (void)updateMediaDegradedHistoryWithCurrentVideoStallDuration:(double)a3 idsParticipantID:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(VCConnectionManager *)self updateMediaDegradedHistoryWithValue:a4 idsParticipantID:a3];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_mediaDegradedHistories allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    int v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (([v11 isEqual:&unk_1F3DC4668] & 1) == 0) {
          v9 &= [(VCConnectionManager *)self isDuplicationAllowedForParticipantID:v11 bucketsToSum:4 threshold:50.0];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    LOBYTE(v9) = 1;
  }
  if (self->_isDuplicationAllowedForMediaDegraded != (v9 & 1) && (int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    unsigned int v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      double v14 = "not allowed";
      *(void *)&v15[4] = v12;
      *(_DWORD *)double v15 = 136315906;
      *(void *)&v15[14] = "-[VCConnectionManager updateMediaDegradedHistoryWithCurrentVideoStallDuration:idsParticipantID:]";
      *(_WORD *)&v15[12] = 2080;
      if (v9) {
        double v14 = "allowed";
      }
      *(_WORD *)&v15[22] = 1024;
      int v16 = 1609;
      __int16 v17 = 2080;
      uint64_t v18 = v14;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Per media criteria, duplication is %s!", v15, 0x26u);
    }
  }
  self->_BOOL isDuplicationAllowedForMediaDegraded = v9 & 1;
  [(VCConnectionManager *)self checkForCachedWRMNotification];
}

- (void)updateMediaDegradedHistoryWithCurrentAudioErasure:(double)a3 idsParticipantID:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaDegradedHistories, "objectForKeyedSubscript:"))
  {
    [(VCConnectionManager *)self updateMediaDegradedHistoryWithValue:a4 idsParticipantID:a3];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = (void *)[(NSMutableDictionary *)self->_mediaDegradedHistories allKeys];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      int v11 = 1;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          v11 &= [(VCConnectionManager *)self isDuplicationAllowedForParticipantID:*(void *)(*((void *)&v21 + 1) + 8 * i) bucketsToSum:4 threshold:50.0];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v20 count:16];
      }
      while (v9);
    }
    else
    {
      int v11 = 1;
    }
    if (self->_isDuplicationAllowedForMediaDegraded != v11 && (int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      double v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double v15 = "not allowed";
        *(void *)&v16[4] = v13;
        *(_DWORD *)int v16 = 136315906;
        *(void *)&v16[14] = "-[VCConnectionManager updateMediaDegradedHistoryWithCurrentAudioErasure:idsParticipantID:]";
        *(_WORD *)&v16[12] = 2080;
        if (v11) {
          double v15 = "allowed";
        }
        *(_WORD *)&v16[22] = 1024;
        int v17 = 1628;
        __int16 v18 = 2080;
        __int16 v19 = v15;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Per media criteria, duplication is %s!", v16, 0x26u);
      }
    }
    self->_BOOL isDuplicationAllowedForMediaDegraded = v11;
    [(VCConnectionManager *)self checkForCachedWRMNotification];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCConnectionManager updateMediaDegradedHistoryWithCurrentAudioErasure:idsParticipantID:]();
    }
  }
}

- (void)updateWithRemoteMediaHealthDuplication:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 65552;
  }
  else {
    uint64_t v3 = 16;
  }
  -[VCConnectionManager duplicationStateUpdateWithEvent:](self, "duplicationStateUpdateWithEvent:", v3, 0xAAAA000000000000);
}

- (void)resetMediaHealthStats
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_mediaDegradedHistories allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = (void *)[(NSMutableDictionary *)self->_mediaDegradedHistories objectForKeyedSubscript:v8];
        if ([v9 count])
        {
          uint64_t v10 = 0;
          unsigned int v11 = 1;
          do
          {
            [v9 setObject:&unk_1F3DC8AC0 atIndexedSubscript:v10];
            uint64_t v10 = v11;
          }
          while ([v9 count] > (unint64_t)v11++);
        }
        [(NSMutableDictionary *)self->_aggregateStallTimeDuration setObject:&unk_1F3DC8AC0 forKeyedSubscript:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)addDistinctConnectionInterfaceToSet:(id)a3 withInterfaceType:(int)a4
{
  uint64_t v4 = &unk_1F3DC46C8;
  if (a4 != 87 && a4 != 69)
  {
    if (a4 != 67) {
      return;
    }
    uint64_t v4 = &unk_1F3DC46E0;
  }
  [a3 addObject:v4];
}

- (BOOL)localOrRemoteHasMultipleInterfaceAvailable:(id)a3 remoteInterface:(id)a4
{
  return (unint64_t)[a3 count] > 1 || (unint64_t)objc_msgSend(a4, "count") > 1;
}

- (id)getActiveConnectionRegistryAndUpdateDuplicationPossibility
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v23 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v22 = [MEMORY[0x1E4F1CA80] set];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = self->_connectionArray;
  uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(uint64_t (***)(void))(*((void *)&v31 + 1) + 8 * i);
        if (self->_isOneToOneModeEnabled)
        {
          if (!VCConnection_IsEndToEndLink(*(void *)(*((void *)&v31 + 1) + 8 * i))) {
            continue;
          }
          if (self->_isOneToOneModeEnabled) {
            goto LABEL_10;
          }
        }
        if ((VCConnection_IsEndToEndLink((uint64_t)v8) & 1) == 0)
        {
LABEL_10:
          uint64_t v9 = VCConnection_ReportingConnectionInterface(v8, 1);
          uint64_t v10 = VCConnection_ReportingConnectionInterface(v8, 0);
          unsigned int v11 = NSString;
          uint64_t v12 = VCConnection_ReportingIPVersion((uint64_t)v8);
          uint64_t v13 = objc_msgSend(v11, "stringWithFormat:", @"%c%c%d%c", v9, v10, v12, VCConnection_ReportingConnectionType((uint64_t)v8));
          if ([v3 objectForKeyedSubscript:v13])
          {
            long long v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v13), "unsignedIntValue")+ 1);
            long long v15 = v3;
          }
          else
          {
            long long v15 = v3;
            long long v14 = &unk_1F3DC4698;
          }
          [v15 setObject:v14 forKeyedSubscript:v13];
          [(VCConnectionManager *)self addDistinctConnectionInterfaceToSet:v23 withInterfaceType:v9];
          [(VCConnectionManager *)self addDistinctConnectionInterfaceToSet:v22 withInterfaceType:v10];
        }
      }
      uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v30 count:16];
    }
    while (v5);
  }
  self->_multipleInterfacesAvailable = 0;
  if ([(VCConnectionManager *)self localOrRemoteHasMultipleInterfaceAvailable:v23 remoteInterface:v22])
  {
    self->_multipleInterfacesAvailable = 1;
  }
  long long v16 = (void *)[MEMORY[0x1E4F28E78] string];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v17 = [v3 countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v3);
        }
        [v16 appendFormat:@"%@:%@,", *(void *)(*((void *)&v26 + 1) + 8 * j), objc_msgSend(v3, "objectForKeyedSubscript:", *(void *)(*((void *)&v26 + 1) + 8 * j))];
      }
      uint64_t v18 = [v3 countByEnumeratingWithState:&v26 objects:v25 count:16];
    }
    while (v18);
  }
  if ([v16 length]) {
    objc_msgSend(v16, "deleteCharactersInRange:", objc_msgSend(v16, "length") - 1, 1);
  }

  return v16;
}

- (void)configureNWConnectionMonitor:(id)a3
{
  if (self->_isNWConnectionMonitorEnabled)
  {
    if (VCConnection_IsLocalOnWiFi((uint64_t)a3))
    {
      self->_ignoreNWConnectionMonitorNotification = 0;
      uint64_t v5 = [a3 localInterfaceName];
      if (v5)
      {
        uint64_t v6 = v5;
        if (![(NSString *)self->_nwMonitorWiFiInterfaceName isEqualToString:v5])
        {

          self->_nwMonitorWiFiInterfaceName = (NSString *)[[NSString alloc] initWithString:v6];
          [(VCConnectionManager *)self renewNWMonitor];
        }
      }
    }
    else if (VCConnection_IsLocalOnCellular((uint64_t)a3) && self->_isNWConnectionMonitorCellularEnabled)
    {
      self->_ignoreNWConnectionMonitorNotification = 0;
      uint64_t v7 = [a3 localInterfaceName];
      if (v7)
      {
        uint64_t v8 = v7;
        if (![(NSString *)self->_nwMonitorCellularInterfaceName isEqualToString:v7])
        {

          self->_nwMonitorCellularInterfaceName = (NSString *)[[NSString alloc] initWithString:v8];
          [(VCConnectionManager *)self renewNWMonitorCellular];
        }
      }
    }
    else
    {
      self->_ignoreNWConnectionMonitorNotification = 1;
    }
  }
}

- (void)setupNetworkConditionMonitor
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCConnectionManager setupNetworkConditionMonitor]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCConnectionManager init failed! Failed to createnetwork condition monitor result=%d", v2, *(const char **)v3, (unint64_t)"-[VCConnectionManager setupNetworkConditionMonitor]" >> 16, v4);
}

- (void)startBrokenNetworkDetection
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(VCLinkProbingHandler *)self->_linkProbingHandler startActiveProbingQRLink];
  self->_BOOL brokenBackhaulDetectionStarted = 1;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    int v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL brokenBackhaulDetectionStarted = self->_brokenBackhaulDetectionStarted;
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCConnectionManager startBrokenNetworkDetection]";
      __int16 v10 = 1024;
      int v11 = 1880;
      __int16 v12 = 1024;
      BOOL v13 = brokenBackhaulDetectionStarted;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCCM: _brokenBackhaulDetectionStarted=%d ", (uint8_t *)&v6, 0x22u);
    }
  }
}

- (void)stopBrokenNetworkDetection
{
}

uint64_t __VCConnectionManager_DidUpdateNetworkCondition_block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(unsigned __int8 *)(a1 + 40);
      int v5 = *(unsigned __int8 *)(a1 + 41);
      int v6 = *(unsigned __int8 *)(a1 + 42);
      int v8 = 136316418;
      uint64_t v9 = v2;
      __int16 v10 = 2080;
      int v11 = "VCConnectionManager_DidUpdateNetworkCondition_block_invoke";
      __int16 v12 = 1024;
      int v13 = 1891;
      __int16 v14 = 1024;
      int v15 = v4;
      __int16 v16 = 1024;
      int v17 = v5;
      __int16 v18 = 1024;
      int v19 = v6;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCCM: Received network condition monitor update: isLocalNetworkQualityBad=%d isRemoteNetworkQualityBad=%d didLocalNetworkQualityChange=%d", (uint8_t *)&v8, 0x2Eu);
    }
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    return [*(id *)(*(void *)(a1 + 32) + 440) didLocalNetworkQualityChange:*(unsigned __int8 *)(a1 + 42) isLocalNetworkQualityBad:*(unsigned __int8 *)(a1 + 40) isRemoteNetworkQualityBad:*(unsigned __int8 *)(a1 + 41)];
  }
  return result;
}

- (void)didUpdateMotionActivity:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  p_stateRWlock = &self->_stateRWlock;
  pthread_rwlock_rdlock(&self->_stateRWlock);
  BOOL enableMotionBasedDuplication = self->_enableMotionBasedDuplication;
  BOOL isUserMoving = self->_isUserMoving;
  int v8 = self->_coreMotionManager;
  reportingAgent = self->_reportingAgent;
  if (reportingAgent) {
    CFTypeRef v10 = CFRetain(reportingAgent);
  }
  else {
    CFTypeRef v10 = 0;
  }
  pthread_rwlock_unlock(p_stateRWlock);
  if (enableMotionBasedDuplication)
  {
    int IntValueForKey = VCDefaults_GetIntValueForKey(@"forceUserMoving", 0);
    BOOL v12 = [(VCCoreMotionManager *)v8 getMotionActivityValueForMotionActivity:a3] != 2&& IntValueForKey == 0;
    BOOL v13 = !v12;
    if (isUserMoving != v13)
    {
      pthread_rwlock_wrlock(p_stateRWlock);
      [(VCDuplicationHandler *)self->_duplicationHandler setIsUserMoving:v13];
      self->_BOOL isUserMoving = v13;
      pthread_rwlock_unlock(p_stateRWlock);
      if (v13) {
        [(VCConnectionManager *)self checkForCachedWRMNotification];
      }
    }
  }
  v14[0] = @"CMActivityValue";
  v14[1] = @"CMActivityConfidence";
  v15[0] = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[VCCoreMotionManager getMotionActivityValueForMotionActivity:](v8, "getMotionActivityValueForMotionActivity:", a3));
  v15[1] = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "confidence"));
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  reportingGenericEvent();

  if (v10) {
    CFRelease(v10);
  }
}

- (void)checkpointPrimaryConnection:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    int IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)a3);
    int IsRemoteOnCellular = VCConnection_IsRemoteOnCellular((uint64_t)a3);
    IsLocalOnWiFuint64_t i = VCConnection_IsLocalOnWiFi((uint64_t)a3);
    IsRemoteOnWiFuint64_t i = VCConnection_IsRemoteOnWiFi((uint64_t)a3);
    int IsRelay = VCConnection_IsRelay((uint64_t)a3);
    MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCConnectionManager-primaryConnectionChanged");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      int v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = VCConnection_Priority((uint64_t)a3);
        BOOL v13 = "secondary";
        if (v12 == 2) {
          BOOL v13 = "primary";
        }
        uint64_t v25 = v13;
        __int16 v14 = "wired";
        if (IsLocalOnWiFi) {
          int v15 = "wifi";
        }
        else {
          int v15 = "wired";
        }
        if (IsLocalOnCellular) {
          int v15 = "cellular";
        }
        if (IsRemoteOnWiFi) {
          __int16 v14 = "wifi";
        }
        if (IsRemoteOnCellular) {
          __int16 v14 = "cellular";
        }
        uint64_t v23 = v14;
        long long v24 = v15;
        int v16 = [a3 uplinkBitrateCap];
        int v17 = [a3 downlinkBitrateCap];
        unsigned int callID = self->_callID;
        if (IsRelay) {
          int v19 = "Relay";
        }
        else {
          int v19 = "P2P";
        }
        if (VCConnection_IsIPv6((uint64_t)a3)) {
          uint64_t v20 = "IPV6";
        }
        else {
          uint64_t v20 = "IPV4";
        }
        *(_DWORD *)buf = 136318210;
        uint64_t v27 = v10;
        __int16 v28 = 2080;
        long long v29 = "-[VCConnectionManager checkpointPrimaryConnection:]";
        __int16 v30 = 1024;
        int v31 = 1954;
        __int16 v32 = 2080;
        long long v33 = v25;
        __int16 v34 = 2080;
        uint64_t v35 = v24;
        __int16 v36 = 2080;
        uint64_t v37 = v23;
        __int16 v38 = 1024;
        int v39 = v16;
        __int16 v40 = 1024;
        int v41 = v17;
        __int16 v42 = 1024;
        unsigned int v43 = callID;
        __int16 v44 = 2080;
        __int16 v45 = v19;
        __int16 v46 = 2080;
        __int16 v47 = v20;
        __int16 v48 = 1024;
        int v49 = [a3 isVirtualRelayLink];
        __int16 v50 = 2112;
        uint64_t v51 = [a3 connectionUUID];
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCConnectionManager-primaryConnectionChanged type=%s, localInterface=%s, remoteInterface=%s, uplinkBitrateCap=%u, downlinkBitrateCap=%u, callID=%u, connectionType=%s, addressType=%s, isVirtualRelay=%d, linkUUID=%@", buf, 0x70u);
      }
    }
    if (self->_overlaySource)
    {
      if (VCConnection_Priority((uint64_t)a3) == 2) {
        VCConnectionManager_SetOverlayLinkDetails((uint64_t)self, (uint64_t)a3, 0, 0);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    uint64_t v22 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v27 = v21;
      __int16 v28 = 2080;
      long long v29 = "-[VCConnectionManager checkpointPrimaryConnection:]";
      __int16 v30 = 1024;
      int v31 = 1938;
      _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d nil connection passed", buf, 0x1Cu);
    }
  }
}

- (BOOL)hasSameReportingConfig:(id)a3 oldPrimaryConnection:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = VCConnectionManager_ConnectionInterfaceType((uint64_t)a3, 1);
  uint64_t v8 = VCConnectionManager_ConnectionInterfaceType((uint64_t)a3, 0);
  uint64_t v9 = VCConnectionManager_ConnectionInterfaceType((uint64_t)a4, 1);
  uint64_t v10 = VCConnectionManager_ConnectionInterfaceType((uint64_t)a4, 0);
  int IsRelay = VCConnection_IsRelay((uint64_t)a3);
  int v12 = VCConnection_IsRelay((uint64_t)a4);
  if (v7) {
    BOOL v13 = v9 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  int v14 = !v13;
  if (self->_isOneToOneModeEnabled)
  {
    if (!v8) {
      int v14 = 0;
    }
    if (v14 == 1 && v10 != 0)
    {
      int v16 = v12;
      int v17 = (void *)[NSString stringWithUTF8String:v7];
      int v18 = objc_msgSend(v17, "isEqualToString:", objc_msgSend(NSString, "stringWithUTF8String:", v9));
      int v19 = (void *)[NSString stringWithUTF8String:v8];
      int v20 = objc_msgSend(v19, "isEqualToString:", objc_msgSend(NSString, "stringWithUTF8String:", v10)) & (IsRelay ^ v16 ^ 1);
      if (v18) {
        return v20;
      }
      else {
        return 0;
      }
    }
LABEL_22:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      uint64_t v25 = *MEMORY[0x1E4F47A50];
      BOOL v26 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v26) {
        return result;
      }
      uint64_t v27 = "NO";
      BOOL isOneToOneModeEnabled = self->_isOneToOneModeEnabled;
      int v32 = 136316930;
      uint64_t v33 = v24;
      if (v7) {
        long long v29 = "NO";
      }
      else {
        long long v29 = "YES";
      }
      uint64_t v35 = "-[VCConnectionManager hasSameReportingConfig:oldPrimaryConnection:]";
      int v37 = 1979;
      if (v9) {
        __int16 v30 = "NO";
      }
      else {
        __int16 v30 = "YES";
      }
      __int16 v34 = 2080;
      if (v8) {
        int v31 = "NO";
      }
      else {
        int v31 = "YES";
      }
      __int16 v36 = 1024;
      __int16 v38 = 1024;
      if (!v10) {
        uint64_t v27 = "YES";
      }
      BOOL v39 = isOneToOneModeEnabled;
      __int16 v40 = 2080;
      int v41 = v29;
      __int16 v42 = 2080;
      unsigned int v43 = v30;
      __int16 v44 = 2080;
      __int16 v45 = v31;
      __int16 v46 = 2080;
      __int16 v47 = v27;
      _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d All values do not exist isOneToOne=%d newLocalInterfaceMissing=%s oldlocalInterfaceMissing=%s newRemoteInterfaceMissing=%s oldRemoteInterfaceMissing=%s", (uint8_t *)&v32, 0x4Au);
    }
    return 0;
  }
  if ((v14 & 1) == 0) {
    goto LABEL_22;
  }
  uint64_t v22 = (void *)[NSString stringWithUTF8String:v7];
  uint64_t v23 = [NSString stringWithUTF8String:v9];

  return [v22 isEqualToString:v23];
}

- (void)primaryConnectionChanged:(id)a3 oldPrimaryConnection:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)a3);
  VCConnectionManager_UseCellPrimaryInterface((uint64_t)self, IsLocalOnCellular);
  [(VCConnectionManager *)self updateWRMDuplicationForHandover];
  int v8 = VCConnection_IsLocalOnCellular((uint64_t)a3);
  _VCConnectionManager_ChecklocalRATTypeOverrideDefaultValue((uint64_t)self, v8);
  if (![(VCConnectionManager *)self hasSameReportingConfig:a3 oldPrimaryConnection:a4])
  {
    *(_OWORD *)&self->_mediaCellularTxBytes = 0u;
    *(_OWORD *)&self->_mediaWifiTxBytes = 0u;
    *(_OWORD *)&self->_signalingExcessiveCellularTxBytes = 0u;
    *(_OWORD *)&self->_budgetConsumingCellularTxBytes = 0u;
    *(_OWORD *)&self->_mediaExcessiveCellularTxBytes = 0u;
  }
  [(VCConnectionManager *)self configureNWConnectionMonitor:a3];
  if (VCConnection_IsLocalOnCellular((uint64_t)a3)
    && ![(VCDuplicationHandler *)self->_duplicationHandler allowDuplication])
  {
    [(VCDuplicationHandler *)self->_duplicationHandler setAllowDuplication:1];
  }
  [(VCConnectionManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = _VCConnectionManager_CopyConnectionForQualityInternal(self, 1);
    delegateQueue = self->_delegateQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __69__VCConnectionManager_primaryConnectionChanged_oldPrimaryConnection___block_invoke;
    v14[3] = &unk_1E6DB6740;
    v14[4] = self;
    v14[5] = a3;
    v14[6] = a4;
    v14[7] = v9;
    dispatch_async(delegateQueue, v14);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    int v12 = *MEMORY[0x1E4F47A50];
    BOOL v13 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v16 = v11;
        __int16 v17 = 2080;
        int v18 = "-[VCConnectionManager primaryConnectionChanged:oldPrimaryConnection:]";
        __int16 v19 = 1024;
        int v20 = 2016;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCConnectionManager: Delegate didn't implement primaryConnectionChanged", buf, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      -[VCConnectionManager primaryConnectionChanged:oldPrimaryConnection:]();
    }
  }
}

void __69__VCConnectionManager_primaryConnectionChanged_oldPrimaryConnection___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "primaryConnectionChanged:oldPrimaryConnection:activeConnection:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 824);
  char IsLocalOnCellular = VCConnection_IsLocalOnCellular(*(void *)(a1 + 56));
  VCNetworkConditionMonitor_SetIsLocalActiveOnCellular(v2, IsLocalOnCellular);
  int v4 = *(const void **)(a1 + 56);
  if (v4)
  {
    CFRelease(v4);
  }
}

- (void)renewNWMonitor
{
  v3[5] = *MEMORY[0x1E4F143B8];
  nwConnectionMonitorQueue = self->_nwConnectionMonitorQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__VCConnectionManager_renewNWMonitor__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(nwConnectionMonitorQueue, v3);
}

uint64_t __37__VCConnectionManager_renewNWMonitor__block_invoke(uint64_t a1)
{
  v7[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) destroyNWMonitorInternal];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 2960) UTF8String];
  unsigned __int16 v4 = [*(id *)(*(void *)(a1 + 32) + 2960) length];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 808);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__VCConnectionManager_renewNWMonitor__block_invoke_2;
  v7[3] = &unk_1E6DB3DC8;
  v7[4] = v2;
  uint64_t result = VCNWConnectionMonitor_CreateWithInterfaceName(v3, v4, 0, v5, (uint64_t)v7);
  *(void *)(*(void *)(a1 + 32) + 784) = result;
  return result;
}

uint64_t __37__VCConnectionManager_renewNWMonitor__block_invoke_2(uint64_t a1)
{
  os_log_t v1 = (void *)[*(id *)(a1 + 32) strong];

  return [v1 setNWMonitorStatisticsHandler];
}

- (void)setNWMonitorStatisticsHandler
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_nwConnectionMonitorQueue);
  nwMonitor = self->_nwMonitor;
  nwConnectionMonitorQueue = self->_nwConnectionMonitorQueue;

  VCNWConnectionMonitor_SetStatisticsHandler(nwMonitor, (uint64_t)nwConnectionMonitorQueue, (uint64_t)self, (uint64_t)_VCConnectionManagerNWConnectionStatisticsCallback);
}

- (void)renewNWMonitorCellular
{
  v3[5] = *MEMORY[0x1E4F143B8];
  nwConnectionMonitorQueue = self->_nwConnectionMonitorQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__VCConnectionManager_renewNWMonitorCellular__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(nwConnectionMonitorQueue, v3);
}

uint64_t __45__VCConnectionManager_renewNWMonitorCellular__block_invoke(uint64_t a1)
{
  v7[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) destroyNWMonitorCellularInternal];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 2968) UTF8String];
  unsigned __int16 v4 = [*(id *)(*(void *)(a1 + 32) + 2968) length];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 808);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__VCConnectionManager_renewNWMonitorCellular__block_invoke_2;
  v7[3] = &unk_1E6DB3DC8;
  v7[4] = v2;
  uint64_t result = VCNWConnectionMonitor_CreateWithInterfaceName(v3, v4, 0, v5, (uint64_t)v7);
  *(void *)(*(void *)(a1 + 32) + 792) = result;
  return result;
}

uint64_t __45__VCConnectionManager_renewNWMonitorCellular__block_invoke_2(uint64_t a1)
{
  os_log_t v1 = (void *)[*(id *)(a1 + 32) strong];

  return [v1 setNWMonitorCellularHandlers];
}

- (void)setNWMonitorCellularHandlers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_nwConnectionMonitorQueue);
  nwMonitorCellular = self->_nwMonitorCellular;
  uint64_t v4 = VTP_NWConnectionQueue();
  VCNWConnectionMonitor_SetStatisticsHandler(nwMonitorCellular, v4, (uint64_t)self, (uint64_t)_VCConnectionManagerNWConnectionStatisticsCallback);
  uint64_t v5 = self->_nwMonitorCellular;
  uint64_t v6 = VTP_NWConnectionQueue();

  VCNWConnectionMonitor_SetPacketEventHandler(v5, v6, (uint64_t)self, (uint64_t)_VCConnectionManagerNWConnectionPacketEventCallback);
}

- (void)destroyNWMonitors
{
  v3[5] = *MEMORY[0x1E4F143B8];
  if (self->_nwMonitor || self->_nwMonitorCellular)
  {
    nwConnectionMonitorQueue = self->_nwConnectionMonitorQueue;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __40__VCConnectionManager_destroyNWMonitors__block_invoke;
    v3[3] = &unk_1E6DB3DC8;
    v3[4] = self;
    dispatch_sync(nwConnectionMonitorQueue, v3);
  }
}

uint64_t __40__VCConnectionManager_destroyNWMonitors__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) destroyNWMonitorInternal];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 destroyNWMonitorCellularInternal];
}

- (void)destroyNWMonitorInternal
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_nwConnectionMonitorQueue);
  nwMonitor = self->_nwMonitor;
  if (nwMonitor)
  {
    VCNWConnectionMonitor_Destroy((uint64_t)nwMonitor);
    self->_nwMonitor = 0;
  }
}

- (void)destroyNWMonitorCellularInternal
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_nwConnectionMonitorQueue);
  nwMonitorCellular = self->_nwMonitorCellular;
  if (nwMonitorCellular)
  {
    VCNWConnectionMonitor_Destroy((uint64_t)nwMonitorCellular);
    self->_nwMonitorCellular = 0;
  }
}

- (void)disableRemotePreferredInterfaceInference:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  self->_disableRemoteInterfaceInference = a3;
  if (self->_duplicateImportantPktsEnabled && (self->_connectionSelectionVersion - 2) <= 4)
  {
    self->_disableRemoteInterfaceInference = 1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315650;
        uint64_t v6 = v3;
        __int16 v7 = 2080;
        int v8 = "-[VCConnectionManager disableRemotePreferredInterfaceInference:]";
        __int16 v9 = 1024;
        int v10 = 2097;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: force to disable remote preferred interface inference", (uint8_t *)&v5, 0x1Cu);
      }
    }
  }
}

- (int)getConnectionSelectionVersionFromFrameworkVersion:(id)a3
{
  if ([a3 compare:@"1476"] == -1) {
    return 1;
  }
  if ([a3 compare:@"1651"] == -1) {
    return 2;
  }
  if ([a3 compare:@"1885"] == -1) {
    return 3;
  }
  if ([a3 compare:@"2005"] == -1) {
    return 4;
  }
  if ([a3 compare:@"2045"] == -1) {
    return 5;
  }
  return 6;
}

- (void)promoteSecondaryConnectionToPrimary:(id)a3
{
  VCConnection_SetPriority((uint64_t)a3, 2);
  [(VCConnectionManager *)self useConnectionAsPrimary:a3];

  [(VCConnectionManager *)self setSecondaryConnection:0];
}

- (BOOL)isBetterConnection:(id)a3 asPrimary:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4) {
    uint64_t v7 = [(VCConnectionManager *)self getPrimaryConnectionToBeCompared];
  }
  else {
    uint64_t v7 = [(VCConnectionManager *)self getSecondaryConnectionToBeCompared];
  }
  uint64_t v8 = v7;
  return (VCConnection_Equal((uint64_t)a3, v7) & 1) == 0
      && objc_msgSend(a3, "compare:isPrimary:selectionPolicy:", v8, v4, -[VCConnectionManager getConnectionSelectionPolicy](self, "getConnectionSelectionPolicy")) == 1;
}

- (BOOL)isOptimalConnection:(id)a3 asPrimary:(BOOL)a4 interfaceMask:(int)a5
{
  char v5 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    IsLocalOnWiFuint64_t i = VCConnection_IsLocalOnWiFi((uint64_t)a3);
    unsigned int v8 = ((v5 & 4) == 0) ^ VCConnection_IsRemoteOnWiFi((uint64_t)a3);
    if (((v5 & 1) == 0) == IsLocalOnWiFi) {
      BOOL v9 = 0;
    }
    else {
      BOOL v9 = v8;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (a3) {
          int v12 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        }
        else {
          int v12 = "<nil>";
        }
        __int16 v17 = "is not";
        int v21 = 136316162;
        uint64_t v22 = v10;
        uint64_t v24 = "-[VCConnectionManager isOptimalConnection:asPrimary:interfaceMask:]";
        __int16 v23 = 2080;
        if (v9) {
          __int16 v17 = "is";
        }
        __int16 v25 = 1024;
        int v26 = 2153;
        __int16 v27 = 2080;
        __int16 v28 = v12;
        __int16 v29 = 2080;
        __int16 v30 = v17;
        int v18 = " [%s] %s:%d HandoverReport: connection %s %s optimal primary connection";
LABEL_24:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v21, 0x30u);
      }
    }
  }
  else
  {
    int IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)a3);
    unsigned int v14 = ((v5 & 8) == 0) ^ VCConnection_IsRemoteOnCellular((uint64_t)a3);
    if (((v5 & 2) == 0) == IsLocalOnCellular) {
      BOOL v9 = 0;
    }
    else {
      BOOL v9 = v14;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (a3) {
          uint64_t v16 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        }
        else {
          uint64_t v16 = "<nil>";
        }
        __int16 v19 = "is not";
        int v21 = 136316162;
        uint64_t v22 = v15;
        uint64_t v24 = "-[VCConnectionManager isOptimalConnection:asPrimary:interfaceMask:]";
        __int16 v23 = 2080;
        if (v9) {
          __int16 v19 = "is";
        }
        __int16 v25 = 1024;
        int v26 = 2162;
        __int16 v27 = 2080;
        __int16 v28 = v16;
        __int16 v29 = 2080;
        __int16 v30 = v19;
        int v18 = " [%s] %s:%d HandoverReport: connection %s %s optimal secondary connection";
        goto LABEL_24;
      }
    }
  }
  return v9;
}

- (void)updateWRMDuplicationForHandover
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v3 = micro();
  int isPrimaryLocalUsingCell = self->_isPrimaryLocalUsingCell;
  char v5 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
  int IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)v5);
  self->_int isPrimaryLocalUsingCell = IsLocalOnCellular;
  if (v5)
  {
    CFRelease(v5);
    int v7 = self->_isPrimaryLocalUsingCell;
  }
  else
  {
    int v7 = IsLocalOnCellular;
  }
  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x3010000000;
  __int16 v19 = "";
  uint64_t v22 = 0;
  if (self->_isAudioOnly) {
    int v8 = 1;
  }
  else {
    int v8 = 2;
  }
  int v20 = v8;
  BOOL v21 = isPrimaryLocalUsingCell == 0;
  if (v7) {
    int v9 = 4;
  }
  else {
    int v9 = 5;
  }
  LODWORD(v22) = v9;
  [(VCWRMHandler *)self->_wrmHandler localLinkTypeSuggestionChangeTime];
  if (v10 == 0.0)
  {
    unsigned int v11 = 0;
  }
  else
  {
    [(VCWRMHandler *)self->_wrmHandler localLinkTypeSuggestionChangeTime];
    unsigned int v11 = ((v3 - v12) * 1000.0);
  }
  *((_DWORD *)v17 + 11) = v11;
  if (isPrimaryLocalUsingCell != v7 && self->_wrmStatusUpdateCallback)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__VCConnectionManager_updateWRMDuplicationForHandover__block_invoke;
    block[3] = &unk_1E6DB3EB8;
    block[4] = self;
    void block[5] = &v16;
    dispatch_async(callbackQueue, block);
  }
  _VCConnectionManager_ProcessDuplicationStateUpdateEvent((uint64_t)self, 10, 0, isPrimaryLocalUsingCell != v7, 0, 0, 0);
  if (![(VCConnectionManager *)self isDuplicationAllowed])
  {
    unsigned int v14 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
    if (VCConnection_IsLocalOnWiFi((uint64_t)v14)
      && self->_savedWRMNotification.applicationType
      && ![(VCWRMHandler *)self->_wrmHandler localWRMLinkTypeSuggestion])
    {
      self->_BOOL isWRMNotificationPending = 1;
      if (!v14) {
        goto LABEL_23;
      }
    }
    else if (!v14)
    {
      goto LABEL_23;
    }
    CFRelease(v14);
    goto LABEL_23;
  }
  _VCConnectionManager_ProcessDuplicationStateUpdateEvent((uint64_t)self, ((unint64_t)([(VCWRMHandler *)self->_wrmHandler remoteWRMLinkTypeSuggestion] != 0) << 40) | ((unint64_t)([(VCWRMHandler *)self->_wrmHandler localWRMLinkTypeSuggestion] != 0) << 32) | ((unint64_t)self->_isPrimaryLocalUsingCell << 24) | 0xB, 0, isPrimaryLocalUsingCell != v7, 0, 1, 0);
LABEL_23:
  _Block_object_dispose(&v16, 8);
}

uint64_t __54__VCConnectionManager_updateWRMDuplicationForHandover__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 712))(*(void *)(*(void *)(a1 + 32) + 728), *(void *)(*(void *)(a1 + 40) + 8) + 32);
}

void __VCConnectionManager_CreatePacketRoutingInfoList_block_invoke(uint64_t a1)
{
}

- (BOOL)isLocalCellularInterfaceUsed
{
  p_stateRWlock = &self->_stateRWlock;
  pthread_rwlock_rdlock(&self->_stateRWlock);
  BOOL v4 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
  char IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)v4);
  if (v4) {
    CFRelease(v4);
  }
  char v6 = VCConnection_IsLocalOnCellular((uint64_t)[(VCConnectionManager *)self secondaryConnection]) | IsLocalOnCellular;
  pthread_rwlock_unlock(p_stateRWlock);
  return v6;
}

- (void)reportConnection:(id)a3 isInitialConnection:(BOOL)a4
{
  [a3 type];
  reportingConnectionType();

  [(VCConnectionManager *)self reportLinkSuggestion];
}

- (void)reportConnectionUpdateWithRespCode:(unsigned __int16)a3
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[1] = @"DuplicationMultiLinkAvailable";
  v5[0] = [(VCConnectionManager *)self getActiveConnectionRegistryAndUpdateDuplicationPossibility];
  v4[0] = @"ACAS";
  v5[1] = [NSNumber numberWithBool:self->_multipleInterfacesAvailable];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  reportingGenericEvent();
}

- (void)reportConnectionUpdateWithResponseCode:(unsigned __int16)a3 delay:(double)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  reportingQueue = self->_reportingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__VCConnectionManager_reportConnectionUpdateWithResponseCode_delay___block_invoke;
  block[3] = &unk_1E6DB4658;
  block[4] = self;
  unsigned __int16 v9 = a3;
  dispatch_after(v6, reportingQueue, block);
}

uint64_t __68__VCConnectionManager_reportConnectionUpdateWithResponseCode_delay___block_invoke(uint64_t a1)
{
  pthread_rwlock_rdlock((pthread_rwlock_t *)(*(void *)(a1 + 32) + 104));
  [*(id *)(a1 + 32) reportConnectionUpdateWithRespCode:*(unsigned __int16 *)(a1 + 40)];
  uint64_t v2 = (pthread_rwlock_t *)(*(void *)(a1 + 32) + 104);

  return pthread_rwlock_unlock(v2);
}

- (void)setDefaultLinkProbingCapabilityVersionForDeviceRole:(int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3
    || (double v4 = (double)arc4random() / 4294967300.0,
        objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-link-probing-feature-threshold", @"linkProbingFeatureThreshold", &unk_1F3DC8B20, 1), "doubleValue"), v4 > v5))
  {
    unsigned __int8 v6 = 0;
  }
  else
  {
    unsigned __int8 v6 = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-link-probing-capability-version", @"linkProbingCapabilityVersion", &unk_1F3DC46F8, 0), "unsignedIntValue");
  }
  self->_int linkProbingCapabilityVersion = v6;
  [(VCLinkProbingHandler *)self->_linkProbingHandler setLinkProbingCapabilityVersion:v6];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    int v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int linkProbingCapabilityVersion = self->_linkProbingCapabilityVersion;
      int v10 = 136315906;
      uint64_t v11 = v7;
      __int16 v12 = 2080;
      BOOL v13 = "-[VCConnectionManager setDefaultLinkProbingCapabilityVersionForDeviceRole:]";
      __int16 v14 = 1024;
      int v15 = 2528;
      __int16 v16 = 1024;
      int v17 = linkProbingCapabilityVersion;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Link probing capability version on local: %d", (uint8_t *)&v10, 0x22u);
    }
  }
}

- (void)setRemoteLinkProbingCapabilityVersion:(unsigned __int8)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  self->_int remoteLinkProbingCapabilityVersion = a3;
  v16[0] = @"lnkPrbVers";
  uint64_t v4 = [NSNumber numberWithUnsignedChar:self->_linkProbingCapabilityVersion];
  v16[1] = @"remLnkPrbVers";
  v17[0] = v4;
  v17[1] = [NSNumber numberWithUnsignedChar:self->_remoteLinkProbingCapabilityVersion];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  reportingGenericEvent();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    unsigned __int8 v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int remoteLinkProbingCapabilityVersion = self->_remoteLinkProbingCapabilityVersion;
      int v8 = 136315906;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      uint64_t v11 = "-[VCConnectionManager setRemoteLinkProbingCapabilityVersion:]";
      __int16 v12 = 1024;
      int v13 = 2537;
      __int16 v14 = 1024;
      int v15 = remoteLinkProbingCapabilityVersion;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Link probing capability version on remote: %d", (uint8_t *)&v8, 0x22u);
    }
  }
}

- (double)primaryConnHealthAllowedDelay
{
  [(VCConnectionHealthMonitor *)self->_connectionHealthMonitor primaryConnHealthAllowedDelay];
  return result;
}

- (int)setConnectionHealthOnControlInfo:(void *)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (self->_startConnectionHealthMonitoring && self->_supportDuplication)
  {
    unsigned int v5 = [(VCConnectionHealthMonitor *)self->_connectionHealthMonitor generateStatsBlob];
    if (v5) {
      VCMediaControlInfoSetInfo(a3, (const char *)2, (uint64_t)&v5, 4);
    }
  }
  return 0;
}

- (int)processConnectionHealthFromControlInfo:(void *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!self->_startConnectionHealthMonitoring
    || !self->_supportDuplication
    || !VCMediaControlInfoHasInfo(a3, (const char *)2))
  {
    return 0;
  }
  unsigned int v7 = -1431655766;
  int Info = VCMediaControlInfoGetInfo(a3, (const char *)2, (uint64_t)&v7, 4, 0);
  if ((Info & 0x80000000) == 0) {
    [(VCConnectionHealthMonitor *)self->_connectionHealthMonitor processPeerStatsBlob:v7];
  }
  return Info;
}

- (void)useConnectionAsPrimary:(id)a3
{
  VCConnectionManager_SetPrimaryConnection((uint64_t)self);

  [(VCConnectionManager *)self setLastPrimaryConnectionInUse:a3];
}

- (int)addConnection:(id)a3
{
}

- (int)removeConnection:(id)a3
{
}

- (void)updateCellularMTU:(int)a3
{
}

- (void)updateCellularTech:(int)a3 forLocalInterface:(BOOL)a4
{
}

- (void)updateOneToOneBitrateCapsForConnection:(id)a3
{
}

- (void)updateAllBitrateCapsForConnection:(id)a3
{
}

- (BOOL)shouldAcceptDataFromSourceDestinationInfo:(tagVCSourceDestinationInfo *)a3
{
}

- (void)reportLinkProbingStatsWithDuplicationJustStarted:(BOOL)a3
{
}

- (void)updateNegotiatedSettingsOnetoOne:(id)a3
{
}

- (void)updateDuplicationStateWithEventType:(unsigned __int8)a3
{
  if (VCDuplicationHandler_HandleDuplicationStateUpdateEvent(self->_duplicationHandler, a3, 0))
  {
    int v4 = [(VCConnectionManager *)self isDuplicationEnabled];
    VCConnectionManager_SetDuplicationEnabledInternal((uint64_t)self, v4);
  }
}

- (void)reportNoPacketUpdateUsingCurrentTime:(double)a3 lastReceivedPacketTime:(double)a4
{
  if (self->_isOneToOneModeEnabled && (a4 != 0.0 || self->_startConnectionHealthMonitoring))
  {
    double v5 = a3 - a4;
    BOOL v6 = v5 > 1.0;
    if (v5 <= 1.0)
    {
      if (self->_previousNoRemoteInProgress) {
LABEL_8:
      }
        reportingNoRemoteChanged();
    }
    else if (!self->_previousNoRemoteInProgress)
    {
      goto LABEL_8;
    }
    self->_previousNoRemoteInProgress = v6;
  }
}

- (void)connectionHealthDidUpdate:(int)a3 isLocalConnection:(BOOL)a4
{
  int v4 = 576;
  if (a4) {
    int v4 = 528;
  }
  switch(self + v4)
  {
    case 0:
      -[VCConnectionManager updateConnectionStatsWithIndicatorNone:](self, "updateConnectionStatsWithIndicatorNone:");
      break;
    case 1:
      -[VCConnectionManager updateConnectionStatsWithIndicatorNoPacket:](self, "updateConnectionStatsWithIndicatorNoPacket:");
      break;
    case 2:
      -[VCConnectionManager updateConnectionStatsWithIndicatorOnlyPrimaryNoPacket:](self, "updateConnectionStatsWithIndicatorOnlyPrimaryNoPacket:");
      break;
    case 3:
      -[VCConnectionManager updateConnectionStatsWithIndicatorPrimaryImproved:](self, "updateConnectionStatsWithIndicatorPrimaryImproved:");
      break;
    default:
      return;
  }
}

- (void)updateConnectionStatsWithIndicatorNoPacket:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!self->_localConnectionStats.isConnectionPaused && !self->_remoteConnectionStats.isConnectionPaused)
  {
    int var6 = a3->var6;
    double v6 = micro();
    double noRemoteDuplicationThresholdFast = 4.0;
    if ([(VCWifiAssistManager *)self->_vcWifiAssist isAvailable] && self->_fastMediaDuplicationEnabled) {
      double noRemoteDuplicationThresholdFast = self->_noRemoteDuplicationThresholdFast;
    }
    if (a3->var0 == 0.0 && !self->_startConnectionHealthMonitoring)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        __int16 v25 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int v26 = 136315906;
          *(void *)&v26[4] = v24;
          *(_WORD *)&v26[12] = 2080;
          *(void *)&v26[14] = "-[VCConnectionManager updateConnectionStatsWithIndicatorNoPacket:]";
          *(_WORD *)&v26[22] = 1024;
          int v27 = 2813;
          __int16 v28 = 1024;
          LODWORD(v29) = var6 == 0;
          _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LastReceivedPacketTime has not been set isLocalConnection=%d", v26, 0x22u);
        }
      }
    }
    else
    {
      a3->double var4 = v6 - a3->var0;
      if (!var6) {
        -[VCConnectionManager reportNoPacketUpdateUsingCurrentTime:lastReceivedPacketTime:](self, "reportNoPacketUpdateUsingCurrentTime:lastReceivedPacketTime:", v6);
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          double var4 = a3->var4;
          double v11 = self->_noRemoteDuplicationThresholdFast;
          *(_DWORD *)int v26 = 136316418;
          *(void *)&v26[4] = v8;
          *(_WORD *)&v26[12] = 2080;
          *(void *)&v26[14] = "-[VCConnectionManager updateConnectionStatsWithIndicatorNoPacket:]";
          *(_WORD *)&v26[22] = 1024;
          int v27 = 2822;
          __int16 v28 = 2048;
          double v29 = noRemoteDuplicationThresholdFast;
          __int16 v30 = 2048;
          double v31 = var4;
          __int16 v32 = 2048;
          double v33 = v11;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Using noPacketThreshold=%.2f noPacketInterval:%.2f noRemoteDuplicationThresholdFast:%.2f", v26, 0x3Au);
        }
      }
      double v12 = a3->var4;
      if (var6)
      {
        self->_remoteNoRemotePacketInterval = v12;
        if (a3->var0 != 0.0 && v6 - a3->var2 > 1.0)
        {
          VTP_NotifyRemoteNoRemotePacket(self->_callID, a3->var4);
          a3->var2 = v6;
        }
      }
      else
      {
        self->_noRemotePacketInterval = v12;
      }
      pthread_rwlock_wrlock(&self->_stateRWlock);
      if (VCDuplicationHandler_DuplicationReason((uint64_t)self->_duplicationHandler)
        || a3->var4 <= noRemoteDuplicationThresholdFast
        || a3->var0 == 0.0)
      {
        pthread_rwlock_unlock(&self->_stateRWlock);
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v13 = VRTraceErrorLogLevelToCSTR();
          __int16 v14 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v15 = "remote-no-remote";
            double v16 = a3->var4;
            *(_DWORD *)int v26 = 136316162;
            if (!var6) {
              int v15 = "no-remote";
            }
            *(void *)&v26[4] = v13;
            *(_WORD *)&v26[12] = 2080;
            *(void *)&v26[14] = "-[VCConnectionManager updateConnectionStatsWithIndicatorNoPacket:]";
            *(_WORD *)&v26[22] = 1024;
            int v27 = 2842;
            __int16 v28 = 2080;
            double v29 = *(double *)&v15;
            __int16 v30 = 2048;
            double v31 = v16;
            _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Receive and cache internal suggestion to duplication, %s packets for %.6f seconds.", v26, 0x30u);
          }
        }
        -[VCConnectionManager updateDuplicationStateWithEventType:](self, "updateDuplicationStateWithEventType:", 2 * (var6 != 0), *(void *)v26);
        VCConnectionManager_UpdateConnectionForDuplication((uint64_t)self);
        pthread_rwlock_unlock(&self->_stateRWlock);
        if (self->_startConnectionHealthMonitoring) {
          [(VCConnectionHealthMonitor *)self->_connectionHealthMonitor resetConnectionStats:var6 == 0];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v17 = VRTraceErrorLogLevelToCSTR();
          uint64_t v18 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            __int16 v19 = "remote-no-remote";
            *(_DWORD *)int v26 = 136315906;
            *(void *)&v26[4] = v17;
            *(_WORD *)&v26[12] = 2080;
            *(void *)&v26[14] = "-[VCConnectionManager updateConnectionStatsWithIndicatorNoPacket:]";
            if (!var6) {
              __int16 v19 = "no-remote";
            }
            *(_WORD *)&v26[22] = 1024;
            int v27 = 2853;
            __int16 v28 = 2080;
            double v29 = *(double *)&v19;
            _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: start dupe by %s.", v26, 0x26u);
          }
        }
      }
      if (-[VCConnectionManager shouldDropCurrentPrimaryConnectionWithConnectionStats:](self, "shouldDropCurrentPrimaryConnectionWithConnectionStats:", a3, *(_OWORD *)v26, *(void *)&v26[16]))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v20 = VRTraceErrorLogLevelToCSTR();
          BOOL v21 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            double v22 = a3->var4;
            *(_DWORD *)int v26 = 136315906;
            *(void *)&v26[4] = v20;
            *(_WORD *)&v26[12] = 2080;
            *(void *)&v26[14] = "-[VCConnectionManager updateConnectionStatsWithIndicatorNoPacket:]";
            *(_WORD *)&v26[22] = 1024;
            int v27 = 2859;
            __int16 v28 = 2048;
            double v29 = v22;
            _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Drop and re-select the next candidate as primary connection, since no packet flowing for %f seconds", v26, 0x26u);
          }
        }
        uint64_t v23 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
        [(VCConnectionManager *)self removeConnection:v23];
        if (v23) {
          CFRelease(v23);
        }
      }
    }
  }
}

- (void)updateConnectionStatsWithIndicatorOnlyPrimaryNoPacket:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  double v5 = micro();
  int var6 = a3->var6;
  BOOL startConnectionHealthMonitoring = self->_startConnectionHealthMonitoring;
  if (self->_startConnectionHealthMonitoring) {
    double v8 = v5;
  }
  else {
    double v8 = 0.0;
  }
  a3->var0 = v8;
  if (startConnectionHealthMonitoring || v8 != 0.0)
  {
    if (!var6)
    {
      self->_isPrimaryLinkUsable = 0;
      -[VCConnectionManager reportNoPacketUpdateUsingCurrentTime:lastReceivedPacketTime:](self, "reportNoPacketUpdateUsingCurrentTime:lastReceivedPacketTime:", v5);
    }
    double var1 = a3->var1;
    if (var1 == 0.0 && !self->_startConnectionHealthMonitoring)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        __int16 v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v22 = v18;
          __int16 v23 = 2080;
          uint64_t v24 = "-[VCConnectionManager updateConnectionStatsWithIndicatorOnlyPrimaryNoPacket:]";
          __int16 v25 = 1024;
          int v26 = 2879;
          __int16 v27 = 1024;
          LODWORD(v28) = var6 == 0;
          double v11 = " [%s] %s:%d LastReceivedPacketOnPrimaryTime has not been set isLocalConnection=%d";
          goto LABEL_9;
        }
      }
    }
    else
    {
      double v13 = v5 - var1;
      if (v13 > a3->var3)
      {
        a3->var3 = v13;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v14 = VRTraceErrorLogLevelToCSTR();
          int v15 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            double v16 = "remote";
            *(_DWORD *)buf = 136316162;
            uint64_t v22 = v14;
            __int16 v23 = 2080;
            uint64_t v24 = "-[VCConnectionManager updateConnectionStatsWithIndicatorOnlyPrimaryNoPacket:]";
            if (!var6) {
              double v16 = "local";
            }
            __int16 v25 = 1024;
            int v26 = 2885;
            __int16 v27 = 2080;
            __int16 v28 = v16;
            __int16 v29 = 2048;
            double v30 = v13;
            _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: %s primary connection has no packet (could already have been received over secondary). Max interval: %f", buf, 0x30u);
          }
        }
        delegateQueue = self->_delegateQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __77__VCConnectionManager_updateConnectionStatsWithIndicatorOnlyPrimaryNoPacket___block_invoke;
        block[3] = &unk_1E6DB45E0;
        block[4] = self;
        BOOL v20 = var6 == 0;
        *(double *)&void block[5] = v13;
        dispatch_async(delegateQueue, block);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    __int16 v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v22 = v9;
      __int16 v23 = 2080;
      uint64_t v24 = "-[VCConnectionManager updateConnectionStatsWithIndicatorOnlyPrimaryNoPacket:]";
      __int16 v25 = 1024;
      int v26 = 2871;
      __int16 v27 = 1024;
      LODWORD(v28) = var6 == 0;
      double v11 = " [%s] %s:%d LastReceivedPacketTime has not been set isLocalConnection=%d";
LABEL_9:
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0x22u);
    }
  }
}

uint64_t __77__VCConnectionManager_updateConnectionStatsWithIndicatorOnlyPrimaryNoPacket___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(NSNumber, "numberWithInt:", (int)*(double *)(a1 + 40)), "stringValue"), "cString");

  return reportingLog();
}

- (void)updateConnectionStatsWithIndicatorNone:(id *)a3
{
  double v5 = micro();
  double v6 = 0.0;
  if (self->_startConnectionHealthMonitoring) {
    double v6 = v5;
  }
  a3->var0 = v6;
  a3->double var1 = v6;

  -[VCConnectionManager reportNoPacketUpdateUsingCurrentTime:lastReceivedPacketTime:](self, "reportNoPacketUpdateUsingCurrentTime:lastReceivedPacketTime:");
}

- (void)updateConnectionStatsWithIndicatorPrimaryImproved:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v5 = micro();
  int var6 = a3->var6;
  if (!self->_startConnectionHealthMonitoring) {
    double v5 = 0.0;
  }
  a3->var0 = v5;
  a3->double var1 = v5;
  if (var6)
  {
    int v7 = 2;
  }
  else
  {
    int v7 = 1;
    self->_isPrimaryLinkUsable = 1;
  }
  pthread_rwlock_wrlock(&self->_stateRWlock);
  if (VCDuplicationHandler_DuplicationReason((uint64_t)self->_duplicationHandler) == v7)
  {
    if (var6) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = 1;
    }
    [(VCConnectionManager *)self updateDuplicationStateWithEventType:v8];
    VCConnectionManager_UpdateConnectionForDuplication((uint64_t)self);
    pthread_rwlock_unlock(&self->_stateRWlock);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      __int16 v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double v11 = "remote-no-remote";
        int v12 = 136315906;
        uint64_t v13 = v9;
        __int16 v14 = 2080;
        int v15 = "-[VCConnectionManager updateConnectionStatsWithIndicatorPrimaryImproved:]";
        if (!var6) {
          double v11 = "no-remote";
        }
        __int16 v16 = 1024;
        int v17 = 2922;
        __int16 v18 = 2080;
        __int16 v19 = v11;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: stop dupe by %s.", (uint8_t *)&v12, 0x26u);
      }
    }
  }
  else
  {
    pthread_rwlock_unlock(&self->_stateRWlock);
  }
}

- (void)updateConnectionHealthWithVCStatisticsMessage:(tagVCStatisticsMessage *)a3
{
  void v11[5] = *MEMORY[0x1E4F143B8];
  connectionHealthMonitor = self->_connectionHealthMonitor;
  if (connectionHealthMonitor && self->_startConnectionHealthMonitoring)
  {
    if (a3->type == 5)
    {
      if (a3->var0.baseband.expectedQueuingDelay != 0.0)
      {
        int v7 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
        uint64_t v8 = self->_connectionHealthMonitor;
        int linkID = a3->var0.serverStats.linkID;
        BOOL v10 = VCConnection_ConnectionID((uint64_t)v7) == linkID;
        VCConnectionHealthMonitor_ReceiveServerStats((uint64_t)v8, v10);
        if (v7)
        {
          CFRelease(v7);
        }
      }
    }
    else if (a3->type == 2)
    {
      VCConnectionHealthMonitor_ReceivePacket((uint64_t)connectionHealthMonitor, a3->var0.feedback.connectionStats.isReceivedOnPrimary, a3->var0.feedback.connectionStats.sequenceNumber, a3->var0.feedback.connectionStats.isDuplicatePacket);
      if (a3->var0.feedback.connectionStats.connectionStatsBuffer) {
        -[VCConnectionHealthMonitor processPeerStatsBlob:](self->_connectionHealthMonitor, "processPeerStatsBlob:");
      }
      self->_lastReceivedFeedbackTime = a3->arrivalTime;
      if (self->_networkConditionMonitor)
      {
        callbackQueue = self->_callbackQueue;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __69__VCConnectionManager_updateConnectionHealthWithVCStatisticsMessage___block_invoke;
        v11[3] = &unk_1E6DB3DC8;
        v11[4] = self;
        dispatch_async(callbackQueue, v11);
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCConnectionManager updateConnectionHealthWithVCStatisticsMessage:]();
      }
    }
  }
}

void __69__VCConnectionManager_updateConnectionHealthWithVCStatisticsMessage___block_invoke(uint64_t a1)
{
}

- (BOOL)shouldDropCurrentPrimaryConnectionWithConnectionStats:(id *)a3
{
  return 0;
}

- (void)updateProbingResults:(id)a3
{
}

- (void)updateLinkPreferSuggestion:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([a3 objectForKeyedSubscript:@"lipp"]) {
    self->_int linkIPPreference = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"lipp"), "intValue");
  }
  uint64_t v5 = *MEMORY[0x1E4F6A8D8];
  if ([a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A8D8]])
  {
    uint64_t v6 = *MEMORY[0x1E4F6A8D0];
    if ([a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A8D0]])
    {
      self->_int linkPreferSuggestion = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v5), "intValue");
      self->_int linkConfidenceScore = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v6), "intValue");
      self->_BOOL reportLinkPreferSuggestion = 1;
      if (self->_useIDSLinkSuggestionFeatureFlag)
      {
        if (self->_linkPreferSuggestion == 1) {
          [(VCConnectionManager *)self setPreferRelayOverP2P:1 reason:2];
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 136315650;
          uint64_t v16 = v7;
          __int16 v17 = 2080;
          __int16 v18 = "-[VCConnectionManager updateLinkPreferSuggestion:]";
          __int16 v19 = 1024;
          int v20 = 3036;
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d IDS Link recommendation ignored", (uint8_t *)&v15, 0x1Cu);
        }
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    BOOL v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL reportLinkPreferSuggestion = self->_reportLinkPreferSuggestion;
      int linkPreferSuggestion = self->_linkPreferSuggestion;
      int linkConfidenceScore = self->_linkConfidenceScore;
      int linkIPPreference = self->_linkIPPreference;
      int v15 = 136316674;
      uint64_t v16 = v9;
      __int16 v17 = 2080;
      __int16 v18 = "-[VCConnectionManager updateLinkPreferSuggestion:]";
      __int16 v19 = 1024;
      int v20 = 3044;
      __int16 v21 = 1024;
      BOOL v22 = reportLinkPreferSuggestion;
      __int16 v23 = 1024;
      int v24 = linkPreferSuggestion;
      __int16 v25 = 1024;
      int v26 = linkConfidenceScore;
      __int16 v27 = 1024;
      int v28 = linkIPPreference;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: reportLinkPreferSuggestion=%d linkPreferSuggestion=%d linkConfidenceScore=%d linkIPPreference=%d", (uint8_t *)&v15, 0x34u);
    }
  }
}

- (void)applyLinkRecommendation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_isOneToOneModeEnabled)
  {
    self->_BOOL dropLinkRecommendation = 0;
    [(VCConnectionManager *)self updateConnectionSelectionPolicyWithPreferE2E:1];
    pthread_rwlock_wrlock(&self->_stateRWlock);
    double v3 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
    int IsRelay = VCConnection_IsRelay((uint64_t)v3);
    if (v3) {
      CFRelease(v3);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136316162;
        uint64_t v8 = v5;
        __int16 v9 = 2080;
        BOOL v10 = "-[VCConnectionManager applyLinkRecommendation]";
        __int16 v11 = 1024;
        int v12 = 3057;
        __int16 v13 = 1024;
        int v14 = IsRelay;
        __int16 v15 = 1024;
        BOOL v16 = [(VCConnectionManager *)self preferRelayOverP2PEnabled];
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Check if primary connection needs to be updated - isCurrentPrimaryUsingRelay=%d isPreferRelayOverP2PEnabled=%d", (uint8_t *)&v7, 0x28u);
      }
    }
    if ((IsRelay & 1) == 0)
    {
      if ([(VCConnectionManager *)self preferRelayOverP2PEnabled])
      {
        [(VCConnectionManager *)self reselectPrimaryConnection];
        VCConnectionManager_UpdateConnectionForDuplication((uint64_t)self);
      }
    }
    [(VCConnectionManager *)self reportLinkSuggestion];
    pthread_rwlock_unlock(&self->_stateRWlock);
  }
}

- (void)reportLinkSuggestion
{
  v9[3] = *MEMORY[0x1E4F143B8];
  self->_linkPreferDecision = 0;
  if (self->_linkPreferSuggestion == 1)
  {
    double v3 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
    unsigned __int8 v4 = VCConnection_IsRelay((uint64_t)v3) ? 1 : 2;
    self->_linkPreferDecision = v4;
    if (v3) {
      CFRelease(v3);
    }
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (self->_reportLinkPreferSuggestion)
  {
    v8[0] = @"LnkSug";
    v9[0] = [NSNumber numberWithUnsignedChar:self->_linkPreferSuggestion];
    v8[1] = @"LnkScr";
    v9[1] = [NSNumber numberWithUnsignedChar:self->_linkConfidenceScore];
    v8[2] = @"LnkDec";
    v9[2] = [NSNumber numberWithUnsignedChar:self->_linkPreferDecision];
    objc_msgSend(v5, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, v8, 3));
  }
  if (self->_linkIPPreference != 255)
  {
    uint64_t v6 = @"LnkIp";
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedChar:");
    objc_msgSend(v5, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  }
  if ([v5 count]) {
    reportingGenericEvent();
  }
}

- (void)applyLinkFlags:(unsigned __int16)a3 isCellular:(BOOL)a4
{
  int v4 = a4;
  uint64_t v5 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  p_stateRWlock = &self->_stateRWlock;
  pthread_rwlock_rdlock(&self->_stateRWlock);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    __int16 v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      BOOL v10 = @"WiFi";
      uint64_t v23 = v8;
      __int16 v24 = 2080;
      __int16 v25 = "-[VCConnectionManager applyLinkFlags:isCellular:]";
      __int16 v26 = 1024;
      if (v4) {
        BOOL v10 = @"Cellular";
      }
      int v27 = 3101;
      __int16 v28 = 1024;
      int v29 = v5;
      __int16 v30 = 2112;
      uint64_t v31 = v10;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Applying link flags='%08x' for %@", buf, 0x2Cu);
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  connectionArray = self->_connectionArray;
  uint64_t v12 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(connectionArray);
        }
        BOOL v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (VCConnection_IsLocalOnCellular((uint64_t)v16) == v4)
        {
          [v16 setLinkFlags:v5];
          [(VCConnectionManager *)self updateAllBitrateCapsForConnectionInternal:v16];
        }
      }
      uint64_t v13 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v18 objects:v17 count:16];
    }
    while (v13);
  }
  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)applyRemoteLinkFlags:(unsigned __int16)a3 isCellular:(BOOL)a4
{
  int v4 = a4;
  uint64_t v5 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  p_stateRWlock = &self->_stateRWlock;
  pthread_rwlock_rdlock(&self->_stateRWlock);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    __int16 v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      BOOL v10 = @"WiFi";
      uint64_t v23 = v8;
      __int16 v24 = 2080;
      __int16 v25 = "-[VCConnectionManager applyRemoteLinkFlags:isCellular:]";
      __int16 v26 = 1024;
      if (v4) {
        BOOL v10 = @"Cellular";
      }
      int v27 = 3113;
      __int16 v28 = 1024;
      int v29 = v5;
      __int16 v30 = 2112;
      uint64_t v31 = v10;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Applying remote link flags='%08x' for %@", buf, 0x2Cu);
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  connectionArray = self->_connectionArray;
  uint64_t v12 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(connectionArray);
        }
        BOOL v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (VCConnection_IsLocalOnCellular((uint64_t)v16) == v4
          || VCConnection_IsRemoteOnCellular((uint64_t)v16) == v4)
        {
          [v16 setRemoteLinkFlags:v5];
          [(VCConnectionManager *)self updateAllBitrateCapsForConnectionInternal:v16];
        }
      }
      uint64_t v13 = [(NSMutableArray *)connectionArray countByEnumeratingWithState:&v18 objects:v17 count:16];
    }
    while (v13);
  }
  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)startActiveProbingWithOptions:(id)a3
{
}

- (void)stopActiveProbingWithOptions:(id)a3
{
}

- (void)queryProbingResultsWithOptions:(id)a3
{
}

- (void)flushLinkProbingStatusWithOptions:(id)a3
{
}

- ($85B13D066EE34EC5DDC86B20300AB7FA)getConnectionSelectionPolicy
{
  return ($85B13D066EE34EC5DDC86B20300AB7FA *)&self->_connectionSelectionPolicy;
}

- (void)updateConnectionSelectionPolicyWithPreferE2E:(BOOL)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  p_stateRWlock = &self->_stateRWlock;
  pthread_rwlock_wrlock(&self->_stateRWlock);
  self->_connectionSelectionPolicy.BOOL preferRelayOverP2P = self->_preferRelayOverP2PEnabled;
  *(_WORD *)&self->_connectionSelectionPolicy.preferIPv6OverIPint v4 = 0;
  self->_connectionSelectionPolicy.BOOL e2eCriteriaEnabled = 0;
  self->_connectionSelectionPolicy.BOOL preferE2E = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL preferRelayOverP2P = self->_connectionSelectionPolicy.preferRelayOverP2P;
      preferIPv6OverIPint v4 = self->_connectionSelectionPolicy.preferIPv6OverIPv4;
      BOOL preferNonVPN = self->_connectionSelectionPolicy.preferNonVPN;
      BOOL e2eCriteriaEnabled = self->_connectionSelectionPolicy.e2eCriteriaEnabled;
      BOOL preferE2E = self->_connectionSelectionPolicy.preferE2E;
      int v13 = 136316930;
      uint64_t v14 = v6;
      __int16 v15 = 2080;
      BOOL v16 = "-[VCConnectionManager updateConnectionSelectionPolicyWithPreferE2E:]";
      __int16 v17 = 1024;
      int v18 = 3157;
      __int16 v19 = 1024;
      BOOL v20 = preferRelayOverP2P;
      __int16 v21 = 1024;
      BOOL v22 = preferIPv6OverIPv4;
      __int16 v23 = 1024;
      BOOL v24 = preferNonVPN;
      __int16 v25 = 1024;
      BOOL v26 = e2eCriteriaEnabled;
      __int16 v27 = 1024;
      BOOL v28 = preferE2E;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ConnectionSelectionPolicy updated: preferRelayOverP2P[%d] preferIPv6OverIPv4[%d] preferNonVPN[%d] e2eCriteriaEnabled[%d] preferE2E[%d]", (uint8_t *)&v13, 0x3Au);
    }
  }
  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)reportSymptomOnLongMediaStallRecovered
{
}

- (void)didChangeWifiAssistAvailable:(BOOL)a3 reason:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  BOOL v5 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = "NO";
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = v6;
      __int16 v14 = 2080;
      __int16 v15 = "-[VCConnectionManager didChangeWifiAssistAvailable:reason:]";
      if (v5) {
        uint64_t v8 = "YES";
      }
      __int16 v16 = 1024;
      int v17 = 3168;
      __int16 v18 = 2080;
      __int16 v19 = v8;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Update WifiAssist Available = %s", buf, 0x26u);
    }
  }
  __int16 v9 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", v4, @"WAStateChangeReason");
  objc_msgSend(v9, "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  reportingGenericEvent();
}

- (void)handleReportingSymptom:(unsigned int)a3
{
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionarySetValue(Mutable, @"SymptomReporterOptionalKeyParticipantID", (const void *)[NSNumber numberWithUnsignedLongLong:self->_idsParticipantID]);
  reportingSymptom();
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

- (unsigned)callID
{
  return self->_callID;
}

- (void)setCallID:(unsigned int)a3
{
  self->_unsigned int callID = a3;
}

- (int)relayServerProvider
{
  return self->_relayServerProvider;
}

- (void)setRelayServerProvider:(int)a3
{
  self->_relayServerProvider = a3;
}

- (unsigned)preferredLocalInterfaceForDuplication
{
  return self->_preferredLocalInterfaceForDuplication;
}

- (void)setPreferredLocalInterfaceForDuplication:(unsigned __int8)a3
{
  self->_preferredLocalInterfaceForDuplication = a3;
}

- (unsigned)preferredRemoteInterfaceForDuplication
{
  return self->_preferredRemoteInterfaceForDuplication;
}

- (void)setPreferredRemoteInterfaceForDuplication:(unsigned __int8)a3
{
  self->_preferredRemoteInterfaceForDuplication = a3;
}

- (VCConnectionProtocol)secondaryConnection
{
  return self->_secondaryConnection;
}

- (void)setSecondaryConnection:(id)a3
{
}

- (VCConnectionProtocol)lastPrimaryConnectionInUse
{
  return self->_lastPrimaryConnectionInUse;
}

- (void)setLastPrimaryConnectionInUse:(id)a3
{
}

- (void)setConnectionForDuplication:(id)a3
{
}

- (BOOL)supportDuplication
{
  return self->_supportDuplication;
}

- (void)setSupportDuplication:(BOOL)a3
{
  self->_supportDuplication = a3;
}

- (void)setIsDuplicationAllowed:(BOOL)a3
{
  self->_isDuplicationAllowed = a3;
}

- (unint64_t)mediaExcessiveCellularTxBytes
{
  return self->_mediaExcessiveCellularTxBytes;
}

- (unint64_t)mediaExcessiveCellularRxBytes
{
  return self->_mediaExcessiveCellularRxBytes;
}

- (unint64_t)signalingExcessiveCellularTxBytes
{
  return self->_signalingExcessiveCellularTxBytes;
}

- (unint64_t)signalingExcessiveCellularRxBytes
{
  return self->_signalingExcessiveCellularRxBytes;
}

- (unint64_t)mediaCellularTxBytes
{
  return self->_mediaCellularTxBytes;
}

- (unint64_t)mediaCellularRxBytes
{
  return self->_mediaCellularRxBytes;
}

- (unint64_t)mediaWifiTxBytes
{
  return self->_mediaWifiTxBytes;
}

- (unint64_t)mediaWifiRxBytes
{
  return self->_mediaWifiRxBytes;
}

- (BOOL)isAudioOnly
{
  return self->_isAudioOnly;
}

- (void)setIsAudioOnly:(BOOL)a3
{
  self->_isAudioOnly = a3;
}

- (double)noRemotePacketInterval
{
  return self->_noRemotePacketInterval;
}

- (double)remoteNoRemotePacketInterval
{
  return self->_remoteNoRemotePacketInterval;
}

- (VCStatsRecorder)statsRecorder
{
  return self->_statsRecorder;
}

- (BOOL)isPreWarmStateEnabled
{
  return self->_isPreWarmStateEnabled;
}

- (BOOL)remotePreWarmStateEnabled
{
  return self->_remotePreWarmStateEnabled;
}

- (BOOL)preferRelayOverP2PEnabled
{
  return self->_preferRelayOverP2PEnabled;
}

- (BOOL)fastMediaDuplicationEnabled
{
  return self->_fastMediaDuplicationEnabled;
}

- (void)setFastMediaDuplicationEnabled:(BOOL)a3
{
  self->_fastMediaDuplicationEnabled = a3;
}

- (BOOL)cellPrimaryInterfaceChangeEnabled
{
  return self->_cellPrimaryInterfaceChangeEnabled;
}

- (void)setCellPrimaryInterfaceChangeEnabled:(BOOL)a3
{
  self->_cellPrimaryInterfaceChangeEnabled = a3;
}

- (BOOL)duplicateImportantPktsEnabled
{
  return self->_duplicateImportantPktsEnabled;
}

- (void)setDuplicateImportantPktsEnabled:(BOOL)a3
{
  self->_duplicateImportantPktsEnabled = a3;
}

- (double)noRemoteDuplicationThresholdFast
{
  return self->_noRemoteDuplicationThresholdFast;
}

- (void)setNoRemoteDuplicationThresholdFast:(double)a3
{
  self->_double noRemoteDuplicationThresholdFast = a3;
}

- (BOOL)lowNetworkModeEnabled
{
  return self->_lowNetworkModeEnabled;
}

- (void)setLowNetworkModeEnabled:(BOOL)a3
{
  self->_lowNetworkModeEnabled = a3;
}

- (BOOL)duplicationEnhancementEnabled
{
  return self->_duplicationEnhancementEnabled;
}

- (void)setDuplicationEnhancementEnabled:(BOOL)a3
{
  self->_duplicationEnhancementEnabled = a3;
}

- (BOOL)iRATDuplicationEnabled
{
  return self->_iRATDuplicationEnabled;
}

- (unsigned)realRATType
{
  return self->_realRATType;
}

- (void)setRealRATType:(unsigned int)a3
{
  self->_realRATType = a3;
}

- (unsigned)linkProbingCapabilityVersion
{
  return self->_linkProbingCapabilityVersion;
}

- (unsigned)remoteLinkProbingCapabilityVersion
{
  return self->_remoteLinkProbingCapabilityVersion;
}

- (AVCStatisticsCollector)statisticsCollector
{
  return self->_statisticsCollector;
}

- (VCConnectionHealthMonitor)connectionHealthMonitor
{
  return self->_connectionHealthMonitor;
}

- (BOOL)isOneToOneModeEnabled
{
  return self->_isOneToOneModeEnabled;
}

- (BOOL)startConnectionHealthMonitoring
{
  return self->_startConnectionHealthMonitoring;
}

- (BOOL)isRemoteMediaQualityDegraded
{
  return self->_isRemoteMediaQualityDegraded;
}

- (BOOL)isRemoteNetworkQualityDegraded
{
  return self->_isRemoteNetworkQualityDegraded;
}

- (BOOL)shouldLimitMultiwayBandwidthWhenConstrained
{
  return self->_shouldLimitMultiwayBandwidthWhenConstrained;
}

- (void)setShouldLimitMultiwayBandwidthWhenConstrained:(BOOL)a3
{
  self->_shouldLimitMultiwayBandwidthWhenConstrained = a3;
}

- (BOOL)enableNetworkConditionMonitoring
{
  return self->_enableNetworkConditionMonitoring;
}

- (BOOL)enableMotionBasedDuplication
{
  return self->_enableMotionBasedDuplication;
}

- (BOOL)isUplinkRetransmissionSupported
{
  return self->_isUplinkRetransmissionSupported;
}

- (void)setIsUplinkRetransmissionSupported:(BOOL)a3
{
  self->_isUplinkRetransmissionSupported = a3;
}

- (int64_t)overlayToken
{
  return self->_overlayToken;
}

- (void)setOverlayToken:(int64_t)a3
{
  self->_int64_t overlayToken = a3;
}

- (BOOL)isGftTLEEnabled
{
  return self->_gftTLEEnabled;
}

- (void)setGftTLEEnabled:(BOOL)a3
{
  self->_gftTLEEnabled = a3;
}

- (NSString)gecoVersion
{
  return (NSString *)objc_getProperty(self, a2, 856, 1);
}

- (void)setGecoVersion:(id)a3
{
}

- (unint64_t)budgetConsumingCellularTxBytes
{
  return self->_budgetConsumingCellularTxBytes;
}

- (unint64_t)budgetConsumingCellularRxBytes
{
  return self->_budgetConsumingCellularRxBytes;
}

- (BOOL)optIntoExistingSubscribedStreams
{
  return self->_optIntoExistingSubscribedStreams;
}

- (void)setOptIntoExistingSubscribedStreams:(BOOL)a3
{
  self->_optIntoExistingSubscribedStreams = a3;
}

- (BOOL)isOneToOneScreenEnabled
{
  return self->_isOneToOneScreenEnabled;
}

void ___VCConnectionManager_SetDuplicationEnabledInternal_block_invoke(uint64_t a1)
{
  void v9[4] = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didEnableDuplication:activeConnection:", *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA60];
  v8[0] = @"Reason";
  double v3 = NSString;
  unsigned int v4 = VCDuplicationHandler_DuplicationReason(*(void *)(*(void *)(a1 + 32) + 632));
  if (v4 > 7) {
    BOOL v5 = "Unknown";
  }
  else {
    BOOL v5 = off_1E6DB6F48[(char)v4];
  }
  v9[0] = [v3 stringWithUTF8String:v5];
  v8[1] = @"DuplicationType";
  v9[1] = [NSNumber numberWithUnsignedChar:VCDuplicationHandler_DuplicationReasonForReporting(*(void *)(*(void *)(a1 + 32) + 632))];
  v8[2] = @"sliceStatus";
  v9[2] = [NSNumber numberWithUnsignedChar:VCConnection_ReportingSliceStatus(*(void *)(a1 + 40))];
  void v8[3] = @"RemoteSliceStatus";
  v9[3] = [NSNumber numberWithUnsignedChar:VCConnection_ReportingSliceStatus(*(void *)(a1 + 40))];
  uint64_t v6 = objc_msgSend(v2, "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, v8, 4));
  VCConnectionManager_AddDuplicationSelectionLogicTelemetryForConnection(*(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), v6);
  uint64_t v7 = *(const void **)(a1 + 48);
  if (v7) {
    CFRelease(v7);
  }
  VCConnectionManager_AddTelemetryForPacketHistory(*(void *)(a1 + 32), (uint64_t)v6);
  VCConnectionManager_AddTelemetryForConnection(*(void *)(a1 + 32), *(void *)(a1 + 40), v6);
  VCConnectionManager_AddLinkProbingTelemetry(*(void *)(a1 + 32));
  VCConnection_ReportingQRServerConfig(*(void *)(a1 + 40));
  reportingGenericEvent();
  VCNetworkConditionMonitor_SetIsLocalActiveOnCellular(*(void *)(*(void *)(a1 + 32) + 824), *(unsigned char *)(a1 + 57));
  VCConnectionManager_SetOverlayLinkDetails(*(void *)(a1 + 32), *(void *)(a1 + 40), 1, *(unsigned char *)(a1 + 56));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

uint64_t ___VCConnectionManager_ProcessDuplicationStateUpdateEvent_block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t result = *(void *)(a1 + 32);
  if (*(void *)(result + 456) && *(unsigned char *)(a1 + 41))
  {
    [(id)result setPreferredLocalInterfaceForDuplication:*(_DWORD *)(a1 + 48) != 1];
    if (*(unsigned char *)(a1 + 60)) {
      BOOL v3 = 1;
    }
    else {
      BOOL v3 = *(unsigned char *)(a1 + 61) != 0;
    }
    (*(void (**)(void, BOOL, void, void))(*(void *)(a1 + 32) + 456))(*(void *)(*(void *)(a1 + 32) + 488), v3, *(unsigned int *)(a1 + 48), *(unsigned __int8 *)(a1 + 41));
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = *(NSObject **)(v4 + 448);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___VCConnectionManager_ProcessDuplicationStateUpdateEvent_block_invoke_2;
    block[3] = &unk_1E6DB6EB0;
    uint64_t v6 = *(void *)(a1 + 40);
    block[4] = v4;
    void block[5] = v6;
    __int16 v15 = *(_WORD *)(a1 + 60);
    dispatch_async(v5, block);
    uint64_t result = *(void *)(a1 + 32);
  }
  uint64_t v7 = *(uint64_t (**)(void, _DWORD *))(result + 712);
  if (v7)
  {
    if (*(unsigned char *)(result + 680)) {
      int v8 = 1;
    }
    else {
      int v8 = 2;
    }
    int v9 = *(_DWORD *)(a1 + 52);
    v12[0] = v8;
    v12[1] = v9;
    int v10 = *(_DWORD *)(a1 + 44);
    v12[2] = v10;
    int v13 = 0;
    if (*(unsigned char *)(a1 + 62) == 1)
    {
      if (!v10) {
        return v7(*(void *)(result + 728), v12);
      }
      if (v10 != 2)
      {
        int v11 = 0;
        goto LABEL_20;
      }
    }
    else if (*(unsigned char *)(a1 + 62) || !v10 || !*(unsigned char *)(a1 + 63))
    {
      return result;
    }
    int v11 = *(_DWORD *)(a1 + 56);
LABEL_20:
    int v13 = v11;
    return v7(*(void *)(result + 728), v12);
  }
  return result;
}

uint64_t ___VCConnectionManager_ProcessDuplicationStateUpdateEvent_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = [*(id *)(a1 + 32) preferredLocalInterfaceForDuplication];
  int v4 = *(unsigned __int8 *)(a1 + 41);
  if (*(unsigned char *)(a1 + 48)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = *(unsigned char *)(a1 + 49) != 0;
  }

  return [v2 didUpdatePreferredInterfaceForDuplication:v3 notifyPeer:v4 != 0 enableDuplication:v5 isMediaUnrecoverableSignal:0];
}

uint64_t ___VCConnectionManager_ChecklocalRATTypeOverrideDefaultValue_block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 440) handleRATChanged:*(void *)(a1 + 40)];
}

uint64_t ___VCConnectionManager_RequestWRMNotification_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(uint64_t (**)(void))(v1 + 720);
  if (v2) {
    return v2(*(void *)(v1 + 728));
  }
  return result;
}

void ___VCConnectionManager_GetAndLogSignalStrength_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = 0;
    int v4 = 0;
    if (![*(id *)(*(void *)(a1 + 32) + 440) getSignalStrengthBars:(char *)&v5 + 4 displayBars:&v5 maxDisplayBars:&v4])
    {
      VCNetworkConditionMonitor_SetCellSignalStrengthBars(*(void *)(*(void *)(a1 + 32) + 824), v5, v4);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v2 = VRTraceErrorLogLevelToCSTR();
        uint64_t v3 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v7 = v2;
          __int16 v8 = 2080;
          int v9 = "_VCConnectionManager_GetAndLogSignalStrength_block_invoke";
          __int16 v10 = 1024;
          int v11 = 2471;
          __int16 v12 = 1024;
          int v13 = HIDWORD(v5);
          __int16 v14 = 1024;
          int v15 = v5;
          __int16 v16 = 1024;
          int v17 = v4;
          _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SignalStrength bars=%d displayBars=%d maxDisplayBars=%d", buf, 0x2Eu);
        }
      }
    }
  }
}

- (void)copyPersistenPacketCounts:isOutgoing:size:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Length does not match", v2, v3, v4, v5, v6);
}

- (void)getSentBytes:receivedBytes:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid parameters", v2, v3, v4, v5, v6);
}

- (void)addMediaHealthStatsHistoryEntryForParticipantID:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d idsParticipantID %@ is already part of mediaDegradedHistories!");
}

- (void)removeMediaHealthStatsHistoryEntryForParticipantID:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d idsParticipantID %@ is not yet added to mediaDegradedHistories!");
}

- (void)updateMediaHealthStats:idsParticipantID:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d idsParticipantID %@ is not part of mediaDegradedHistories!");
}

- (void)updateMediaDegradedHistoryWithCurrentAudioErasure:idsParticipantID:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d idsParticipantID %@ is not part of mediaDegradedHistories!");
}

- (void)primaryConnectionChanged:oldPrimaryConnection:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 2016;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d VCConnectionManager: Delegate didn't implement primaryConnectionChanged", v1, 0x1Cu);
}

- (void)updateConnectionHealthWithVCStatisticsMessage:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Wrong type of statistics message received by VCConnectionManager", v2, v3, v4, v5, v6);
}

@end