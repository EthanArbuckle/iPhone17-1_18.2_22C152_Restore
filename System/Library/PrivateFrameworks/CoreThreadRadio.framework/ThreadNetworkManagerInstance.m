@interface ThreadNetworkManagerInstance
- (BOOL)alreadyOnTheSameNetwork:(id)a3;
- (BOOL)areTwoNetworksSame:(id)a3 nwname:(id)a4 creds_xpan:(id)a5 xpan:(id)a6;
- (BOOL)checkAndUpdateNetworkParamsFromMdnsScan:(id)a3 borderAgentID:(id)a4 leaderBorderAgentID:(id)a5 isNwFound:(BOOL *)a6 numAppleBRs:(int *)a7 numThirdPartyBRs:(int *)a8 isLeaderAppleDevice:(BOOL *)a9 numThreadNwsFound:(int *)a10 shouldRunPeriodicTdm:(BOOL *)a11;
- (BOOL)checkIfDuplicateWedAttachRequest:(const char *)a3;
- (BOOL)checkIfMdnsIsPublishedForBAID;
- (BOOL)checkIfNetworkIsFoundInMDNSScan:(id)a3 borderAgentID:(id)a4;
- (BOOL)clearThreadCredentials;
- (BOOL)commissioningCore:(id)a3 PSKd:(id)a4 server:(id)a5 index:(int)a6;
- (BOOL)createNetwork;
- (BOOL)foundAdvDuringPairing;
- (BOOL)foundAdvDuringWedConnectionAttempt;
- (BOOL)generateThreadSessionEvent:(BOOL)a3;
- (BOOL)geoAvailable;
- (BOOL)getBTAudioCallStatus;
- (BOOL)getDefaultChildNode;
- (BOOL)getFWUpdateStatus;
- (BOOL)getIsAssociatedFirstTimeAfterThreadStart;
- (BOOL)getPairingStatus;
- (BOOL)getThreadSessionStatus;
- (BOOL)isAudioNoThreadFeatureEnabled;
- (BOOL)isCurrentBTCoExLoadAvailable;
- (BOOL)isCurrentNetworkSameAsOneToStart:(id)a3;
- (BOOL)isDiscoveryScanAllowed;
- (BOOL)isFWUpdateInProgress;
- (BOOL)isGeoAvailable;
- (BOOL)isNetworkSame:(Ctr_attachToNetwork *)a3 nwname:(void *)a4 xpan:(void *)a5;
- (BOOL)isNonWedFWUpdateProgressInChildRole;
- (BOOL)isPairing;
- (BOOL)isPeriodicCaCollectionMeshcopRunning;
- (BOOL)isPeriodicDiscoveryScanInProgress;
- (BOOL)isStateMachineWedEnabled;
- (BOOL)isThreadAlwaysOnFeatureEnabled;
- (BOOL)isWedFWUpdateProgressInChildRole;
- (BOOL)isWedSessionEnabled;
- (BOOL)lastIsLeaderThirdParty;
- (BOOL)modeChangeInProgress;
- (BOOL)networkNodeTypeChangeNotify;
- (BOOL)stopPairingRequest;
- (BOOL)tnm_internalInstall;
- (BOOL)updateMeshcopRelatedParams:(BOOL *)a3 numAppleBRs:(int *)a4 numThirdPartyBRs:(int *)a5 isLeaderAppleDevice:(BOOL *)a6 numThreadNwsFound:(int *)a7 shouldRunPeriodicTdm:(BOOL *)a8;
- (BOOL)updatePreferredNetworkForDatasetChange;
- (BOOL)validateDataSetTLVs:(id)a3;
- (BOOL)validateDataSetTLVs:(id)a3 creds:(id *)a4;
- (BOOL)waitForSync;
- (BOOL)wakeOnDeviceChangeNotify;
- (BOOL)wedAttachRequest;
- (CtrInternalClient)CtrInternalClientPtr;
- (NSString)deviceName;
- (NSString)hwAddr;
- (OS_dispatch_queue)checkPreferredThreadNetworkTimerQueue;
- (OS_dispatch_queue)fQueue;
- (OS_dispatch_queue)periodicStatsQueue;
- (OS_dispatch_queue)tnmNodeTypeChangeQueue;
- (OS_dispatch_queue)tnmWedStatusChangeQueue;
- (OS_dispatch_queue)tnm_scan_queue;
- (OS_dispatch_semaphore)semaphoreNetworkNodeTypeChange;
- (OS_dispatch_semaphore)semaphoreWakeOnDeviceChange;
- (OS_dispatch_source)checkPreferredThreadNetworkTimer;
- (OS_dispatch_source)tnm_nw_topology_fetch_timer;
- (Result)getNCPNetworkInfo:(Result *__return_ptr)retstr;
- (Result)getPskc:(Result *__return_ptr)retstr pskc_str:;
- (Result)saveThreadConfiguration:(Result *__return_ptr)retstr;
- (Result)saveThreadConfiguration:(Result *__return_ptr)retstr passPhrase:;
- (Result)saveThreadConfiguration:(Result *__return_ptr)retstr passPhrase:uuid:;
- (Result)saveThreadConfigurationAOD:(Result *__return_ptr)retstr passPhrase:;
- (Result)updateKeychainWithThreadActiveDataSet;
- (THThreadNetworkCredentialsActiveDataSetRecord)lastKnownJoinedNetworkRecord;
- (THThreadNetworkCredentialsStoreLocalClient)keyChainStore;
- (ThreadNetworkfinder)BAFinder;
- (basic_string<char,)getNCPPropertyAsString:(std::allocator<char>> *__return_ptr)retstr;
- (basic_string<char,)getPersistedWedAddr;
- (basic_string<char,)getPersistedWedMleid;
- (const)defaultChildNode;
- (const)validateExtendedMACAddress:(const char *)a3;
- (dict)threadNetworkManagerInstance_MsgHandler:()basic_string<char message:()std:(std::allocator<char>> *)a3 :char_traits<char>;
- (id)CAgetPrevValidDeviceRole;
- (id)dataFromHexString:(id)a3;
- (id)getCurrentBorderAgent;
- (id)getCurrentCredentialsDataSet;
- (id)getCurrentNetworkCredentials;
- (id)getCurrentNetworkCredentialsActiveDataSetRecord;
- (id)getCurrentNetworkNameAndXpanid;
- (id)getHardwareAddress;
- (id)getNCPPreferredNetworkInDict:(id)a3;
- (id)getNCPProperties;
- (id)getNCPPropertyInDict:(const char *)a3;
- (id)getNCPStatusInDict;
- (id)getPreferredNetwork;
- (id)getPreferredNetworkWithNoScan;
- (id)getRCPProperties;
- (id)init:(id)a3 statsQueue:(id)a4;
- (int)attachToNetwork:(dict)a3 output:(dict *)a4;
- (int)attachWithAllCreds:(const char *)a3 credentialsRecord_t:(id)a4 output:(dict *)a5;
- (int)checkPreferredAndJoin:(dict *)a3;
- (int)commission:(dict *)a3;
- (int)commissionOrFormNetwork:(dict)a3 is_attaching:(BOOL)a4 cfg_attach:(Ctr_attachToNetwork *)a5 output:(dict *)a6;
- (int)commissionToSpecifNetwork:(const char *)a3 credentialsRecord_t:(id)a4 output:(dict *)a5;
- (int)deleteCredentialsForThisNetwork:(id)a3;
- (int)deviceNode;
- (int)formNetworkWithAOD:(const char *)a3 record:(id)a4 output:(dict *)a5;
- (int)formNetworkWithAODForPrimaryOrSharedUser:(const char *)a3 isPrimaryUser:(BOOL)a4 routerMode:(BOOL)a5 geoAvailable:(BOOL)a6 defaultChildNode:(BOOL)a7 output:(dict *)a8;
- (int)formNetworkWithCreds:(const char *)a3 credentialsRecord_t:(id)a4 output:(dict *)a5;
- (int)formNewNetwork:(dict)a3;
- (int)getMeCredentialsForThisNetwork:(id)a3 credentialsRecord_t:(id *)a4;
- (int)getMePassPhraseForThisNetwork:(id)a3 passPhrase:(id *)a4;
- (int)howToGetOnTheNetwork:(id)a3;
- (int)howToStartThreadNetwork:(const char *)a3 credentialsRecord_t:(id *)a4;
- (int)initializeKeyChainStore;
- (int)joinerAttach:(const char *)a3 output:(dict *)a4;
- (int)lastKnownNCPState;
- (int)lastKnownNodeType;
- (int)lastKnownValidNodeType;
- (int)prevKnownNCPState;
- (int)provideExtendedMACAddress:(const char *)a3 output:(dict *)a4;
- (int)retrieveActiveDataSetRecordForUniqueId:(const char *)a3 record:(id *)a4;
- (int)retrieveCredentialsForUniqueId:(const char *)a3 credentialsRecord_t:(id *)a4;
- (int)setChannel:(dict)a3;
- (int)setChannelUsingChannelManger:(dict)a3;
- (int)setLogTimestampBase;
- (int)startFWUpdate:(const char *)a3 isWED:(BOOL)a4 output:(dict *)a5;
- (int)startPairing:(const char *)a3 isWED:(BOOL)a4 output:(dict *)a5;
- (int)stopFWUpdate:(dict *)a3;
- (int)stopPairing:(dict *)a3;
- (int)threadLeave;
- (int)threadStart:(const char *)a3 activeOperationalDataset:(const char *)a4 isPrimaryUser:(BOOL)a5 routerMode:(BOOL)a6 geoAvailable:(BOOL)a7 defaultChildNode:(BOOL)a8 output:(dict *)a9;
- (int)threadStart:(const char *)a3 output:(dict *)a4;
- (int)threadStop;
- (int)updatePrimaryResident:(const char *)a3 isPrimaryResident:(BOOL)a4 isPrimaryResidentThreadCapable:(BOOL)a5;
- (int)wedStatus;
- (unint64_t)getCountOfAvailableNetworksForCommissioning;
- (unint64_t)getCountOfThreadBorderRoutersWithMdns:(id)a3;
- (unint64_t)lastTimeInLeaderRole;
- (unsigned)getCounterThreadSessionStoppedDueToAPOff;
- (unsigned)getCounterThreadSessionStoppedDueToBluetoothOff;
- (unsigned)getCounterThreadSessionStoppedDueToEscoOn;
- (unsigned)getCounterThreadStartFailDueToBluetoothOff;
- (unsigned)getCounterThreadStartFailDueToEscoOn;
- (unsigned)lastHostConfiguredChannel;
- (unsigned)lastUpdatedNCPChannel;
- (unsigned)numAdvDuringPairing;
- (void)CAgetCoexCounter;
- (void)CAincrementStartProcessCount:(BOOL)a3;
- (void)CAincrementStartProcessSuccessCount:(BOOL)a3;
- (void)CAincrementStopProcessCount:(BOOL)a3;
- (void)CAincrementStopProcessSuccessCount:(BOOL)a3;
- (void)CAnoteStartProcessReqTime:(BOOL)a3;
- (void)CAnoteStopProcessReqTimeSuccessOrFail:(BOOL)a3 isProcessPairing:(BOOL)a4;
- (void)UpdateOutputWithBackOffTimerValue:(const char *)a3 output:(dict *)a4;
- (void)addCommonDimensions:(id)a3;
- (void)appendValMapToDict:(id)a3 value:(any)a4;
- (void)captureNCPStateInformation:(id *)a3;
- (void)checkAndResumeNW;
- (void)checkIfMdnsIsPublishedForBAID;
- (void)checkMeshcopMdns;
- (void)checkPreferredThreadNetworkTimerHandler;
- (void)clearProvideEmacTracker;
- (void)clearWedDevice;
- (void)coexCounterCollection:(BOOL)a3;
- (void)configureCAMetrics:(BOOL)a3;
- (void)configureRCP2PeriodicEvents;
- (void)createDriverInterface:(id)a3;
- (void)deleteCurrentNetwork:(id)a3;
- (void)disconnectActiveWedConnection;
- (void)eraseKeyFromProvideEmacTracker:()basic_string<char;
- (void)fillupThreadCredentialsToSelfHealThreadNetwork:(id)a3 store:(id)a4;
- (void)generateAPLifeInfoMetrics;
- (void)generateStateInfoEventMetrics;
- (void)getAllMacMetrics;
- (void)getBTWifiLoadInfoEvent:(any)a3;
- (void)getCurrentBTWifiLoad:(id)a3;
- (void)getCurrentCredentialsDataSet;
- (void)getCurrentNetworkCredentials;
- (void)getCurrentNetworkCredentialsActiveDataSetRecord;
- (void)getCurrentNetworkNameAndXpanid;
- (void)getCurrentWEDInfoMetrics;
- (void)getDaemonAndVendorVersions;
- (void)getEngagementMetrics;
- (void)getHardwareAddress;
- (void)getIPMLEMetrics:(id)a3;
- (void)getMetricsBetweenRoleChanges;
- (void)getNCPChannel;
- (void)getNCPState:(BOOL)a3;
- (void)getNetworkRadioHistogramMetrics:(BOOL)a3;
- (void)getNetworkRadioMetrics;
- (void)getPowerMetrics;
- (void)getPreferredNetwork;
- (void)getPreferredNetworkWithNoScan;
- (void)getRCP2CoexMetrics:(BOOL)a3;
- (void)getStreamRawResponseHistogramMetric:(BOOL)a3;
- (void)getThreadSessionRejectInfoMetrics:(id)a3;
- (void)getThreadSessionWEDConnectionHistory:(id)a3;
- (void)getTopologyMetrics;
- (void)handleAdv;
- (void)handleRouterModeFailSafeTrigger;
- (void)incrementCounterThreadSessionStoppedDueToAPOff;
- (void)incrementCounterThreadSessionStoppedDueToBluetoothOff;
- (void)incrementCounterThreadSessionStoppedDueToEscoOn;
- (void)incrementCounterThreadStartFailDueToBluetoothOff;
- (void)incrementCounterThreadStartFailDueToEscoOn;
- (void)incrementNumberOfRoleChangeInCurrentThreadSession;
- (void)initCheckPreferredTimer;
- (void)initSyslogDumpInfo;
- (void)nodeChangeToChildStatus:(unsigned __int8)a3;
- (void)noteTimeAPOn;
- (void)noteTimeWhenAttachDetachCompleteSuccessOrFail:(BOOL)a3;
- (void)noteTimeWhenWEDAttachCompleteSuccessOrFail:(BOOL)a3;
- (void)noteTimeWhenWEDAttachStart:(id)a3;
- (void)noteTimeWhenWEDDetachCompleteSuccessOrFail:(BOOL)a3;
- (void)noteTimeWhenWEDDetachStart;
- (void)notifyHK:()basic_string<char wedMleid:()std:(std::allocator<char>> *)a3 :char_traits<char> discReason:;
- (void)notifyOnNodeStatusChange;
- (void)notifyOnWedStatusChange:(int)a3;
- (void)notifyWedUnsolictedDisconnect;
- (void)onThreadStartPerformDiscoveryScan;
- (void)persistDefaultChildNode:(BOOL)a3;
- (void)persistGeoAvailable:(BOOL)a3;
- (void)persistThreadSession:(BOOL)a3;
- (void)persistWedSession:()basic_string<char wedMleid:()std:(std::allocator<char>> *)a3 :char_traits<char>;
- (void)printProvideEmacTracker;
- (void)registerStateMachineWedEventHandlers;
- (void)reset;
- (void)resetCounterThreadSessionStoppedDueToAPOff;
- (void)resetCounterThreadSessionStoppedDueToBluetoothOff;
- (void)resetCounterThreadSessionStoppedDueToEscoOn;
- (void)resetCounterThreadStartFailDueToBluetoothOff;
- (void)resetCounterThreadStartFailDueToEscoOn;
- (void)resetCurrentWEDInfoMetrics;
- (void)resetEngagementMetrics;
- (void)resetFWUpdateStatus;
- (void)resetFoundAdvFlags;
- (void)resetIPMLEMetrics;
- (void)resetMacMetrics;
- (void)resetMetricsBetweenRoleChanges;
- (void)resetNetworkRadioHistogramMetrics;
- (void)resetNetworkRadioMetrics;
- (void)resetPairingStatus;
- (void)resetPeriodicRCP2_threadSessionMetrics;
- (void)resetPowerMetrics;
- (void)resetRCP2CoexMetrics;
- (void)resetStreamRawResponseHistogramMetrics;
- (void)resetThreadSessionMetrics;
- (void)resetThreadSessionWEDConnectionHistory;
- (void)resetTopologyMetrics;
- (void)resumeNetwork;
- (void)retrieveAndPostThirdPartyInfo;
- (void)saveLastKnownJoinedNetwork:(const char *)a3 datasetRecord:(id)a4;
- (void)sendThirdPartyMetricsInfo:(unsigned int)a3 prefNws:(unsigned int)a4 prefNwsByApple:(unsigned int)a5;
- (void)setBAFinder:(id)a3;
- (void)setCheckPreferredThreadNetworkTimer:(id)a3;
- (void)setCheckPreferredThreadNetworkTimerQueue:(id)a3;
- (void)setCreateNetwork:(BOOL)a3;
- (void)setCtrInternalClientPtr:(id)a3;
- (void)setDefaultChildNode:(const char *)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceNode:(BOOL)a3 geoAvailable:(BOOL)a4 defaultChildNode:(BOOL)a5;
- (void)setDeviceNode:(int)a3;
- (void)setFQueue:(id)a3;
- (void)setFoundAdvDuringPairing:(BOOL)a3;
- (void)setFoundAdvDuringWedConnectionAttempt:(BOOL)a3;
- (void)setFoundAdvFlags;
- (void)setGeoAvailable:(BOOL)a3;
- (void)setHwAddr:(id)a3;
- (void)setIsAssociatedFirstTimeAfterThreadStart;
- (void)setIsFWUpdateInProgress:(BOOL)a3;
- (void)setIsNonWedFWUpdateProgressInChildRole:(BOOL)a3;
- (void)setIsPairing:(BOOL)a3;
- (void)setIsPeriodicCaCollectionMeshcopRunning:(BOOL)a3;
- (void)setIsWedFWUpdateProgressInChildRole:(BOOL)a3;
- (void)setKeyChainStore:(id)a3;
- (void)setLastHostConfiguredChannel:(unsigned __int8)a3;
- (void)setLastIsLeaderThirdParty:(BOOL)a3;
- (void)setLastKnownJoinedNetworkRecord:(id)a3;
- (void)setLastKnownNCPState:(int)a3;
- (void)setLastKnownNodeType:(int)a3;
- (void)setLastKnownValidNodeType:(int)a3;
- (void)setLastTimeInLeaderRole:(unint64_t)a3;
- (void)setLastUpdatedNCPChannel:(unsigned __int8)a3;
- (void)setModeChangeInProgress:(BOOL)a3;
- (void)setNetworkNodeTypeChangeNotify:(BOOL)a3;
- (void)setNumAdvDuringPairing:(unsigned __int8)a3;
- (void)setPeriodicStatsQueue:(id)a3;
- (void)setPrevKnownNCPState:(int)a3;
- (void)setSemaphoreNetworkNodeTypeChange:(id)a3;
- (void)setSemaphoreWakeOnDeviceChange:(id)a3;
- (void)setStopPairingRequest:(BOOL)a3;
- (void)setTnmNodeTypeChangeQueue:(id)a3;
- (void)setTnmWedStatusChangeQueue:(id)a3;
- (void)setTnm_nw_topology_fetch_timer:(id)a3;
- (void)setTnm_scan_queue:(id)a3;
- (void)setWaitForSync:(BOOL)a3;
- (void)setWakeOnDeviceChangeNotify:(BOOL)a3;
- (void)setWedAttachRequest:(BOOL)a3;
- (void)setWedStatus:(int)a3;
- (void)startFWUpdateHelper:(const char *)a3;
- (void)startNetworkTopologyBuilder;
- (void)startPeriodicDiscoveryScanInSRMode;
- (void)startQuickDiscoveryScanInSRMode;
- (void)stopPeriodicDiscoveryScanInSRMode;
- (void)threadLeave;
- (void)threadStop;
- (void)transitionToChildNode:(dict *)a3;
- (void)transitionToChildNodeHelper;
- (void)triggerBTWifiLoadInfoEvent;
- (void)triggerScan;
- (void)updateInternalDBForCommonDimensions:(id)a3 coexCntrsDict:(id)a4 coexDict:(id)a5;
- (void)updateLinkFailureCount;
- (void)updatePreferredNetworkForDatasetChange;
- (void)updateThreadSessionStartTime;
- (void)updateThreadSessionStopReason:(id)a3;
- (void)updateThreadSessionmetrics:(id)a3 previousNodeType:(id)a4;
- (void)updateWEDConnectionCount;
- (void)upgradeCredentials;
@end

@implementation ThreadNetworkManagerInstance

- (const)validateExtendedMACAddress:(const char *)a3
{
  v3 = a3;
  if (a3)
  {
    size_t v4 = strlen(a3);
    v5 = __p;
    std::string::basic_string[abi:ne180100](__p, v4, 48);
    char v6 = v12;
    if (v12 < 0) {
      v5 = (void **)__p[0];
    }
    size_t v7 = strlen(v3);
    int v8 = strncmp(v3, (const char *)v5, v7);
    if (v7 == 16 && v8)
    {
      if ((v6 & 0x80) == 0) {
        return v3;
      }
LABEL_11:
      operator delete(__p[0]);
      return v3;
    }
    v10 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance(SM_extension) validateExtendedMACAddress:](v3, v10);
    }

    v3 = 0;
    if (v12 < 0) {
      goto LABEL_11;
    }
  }
  return v3;
}

- (int)startPairing:(const char *)a3 isWED:(BOOL)a4 output:(dict *)a5
{
  BOOL v6 = a4;
  id v9 = objc_initWeak(&location, self);
  uint64_t v82 = 0;
  int v80 = 0;
  memset(&__p, 0, sizeof(__p));
  [(ThreadNetworkManagerInstance *)self reset];
  [(ThreadNetworkManagerInstance *)self getNCPState:0];
  [(ThreadNetworkManagerInstance *)self CAincrementStartProcessCount:1];
  v10 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = &v90;
    nl::wpantund::ncp_state_to_string((char *)[(ThreadNetworkManagerInstance *)self lastKnownNCPState], (uint64_t)&v90);
    if (SBYTE7(v91) < 0) {
      v11 = (long long *)v90;
    }
    if (a3) {
      char v12 = a3;
    }
    else {
      char v12 = "nil";
    }
    if (a3) {
      size_t v13 = strlen(a3);
    }
    else {
      size_t v13 = 0;
    }
    *(_DWORD *)buf = 136316418;
    *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) startPairing:isWED:output:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 52;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = v11;
    *(_WORD *)&buf[28] = 2080;
    *(void *)&buf[30] = v12;
    __int16 v93 = 2048;
    size_t v94 = v13;
    __int16 v95 = 1024;
    BOOL v96 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s:%d Start Pairing Cmd received in state %s, extendedMACAddress : %s, Length = %ld, isWED : %d", buf, 0x36u);
    if (SBYTE7(v91) < 0) {
      operator delete((void *)v90);
    }
  }

  v14 = [(ThreadNetworkManagerInstance *)self validateExtendedMACAddress:a3];
  v15 = v14;
  if (v6 && !v14 || [(ThreadNetworkManagerInstance *)self lastKnownNCPState] == 4)
  {
    v16 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v23 = &v90;
      nl::wpantund::ncp_state_to_string((char *)[(ThreadNetworkManagerInstance *)self lastKnownNCPState], (uint64_t)&v90);
      if (SBYTE7(v91) < 0) {
        v23 = (long long *)v90;
      }
      if (v15) {
        v24 = v15;
      }
      else {
        v24 = "nil";
      }
      if (v15) {
        size_t v25 = strlen(v15);
      }
      else {
        size_t v25 = 0;
      }
      *(_DWORD *)buf = 136316418;
      *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) startPairing:isWED:output:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 61;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v23;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = v24;
      __int16 v93 = 2048;
      size_t v94 = v25;
      __int16 v95 = 1024;
      BOOL v96 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s:%d Returning error :  Failed to start pairing, state %s, extendedMACAddress : %s, Length = %ld, isWED : %d", buf, 0x36u);
      if (SBYTE7(v91) < 0) {
        operator delete((void *)v90);
      }
    }
LABEL_16:

    int v17 = 1;
    [(ThreadNetworkManagerInstance *)self CAnoteStopProcessReqTimeSuccessOrFail:0 isProcessPairing:1];
    goto LABEL_17;
  }
  v19 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(v78, "Network:NodeType");
  if (v19) {
    [v19 getProperty:v78 output:&v82];
  }
  else {
    memset(buf, 0, 32);
  }
  int v20 = *CtrXPC::Result::operator=(&v80, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v79 < 0) {
    operator delete(v78[0]);
  }

  if (v20)
  {
    v16 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance(SM_extension) startPairing:isWED:output:].cold.4();
    }
    goto LABEL_16;
  }
  any_to_string((const boost::any *)&v82, (uint64_t)buf);
  unsigned int v21 = nl::wpantund::string_to_node_type(buf);
  if ((buf[23] & 0x80000000) != 0)
  {
    operator delete(*(void **)buf);
    if (v6)
    {
LABEL_34:
      if (v21 - 3 > 1)
      {
        if (v21 == 8)
        {
          v32 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) startPairing:isWED:output:]";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 93;
            *(_WORD *)&buf[18] = 2080;
            *(void *)&buf[20] = "true";
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s:%d isWed = [%s] Current Node is already sleepy router", buf, 0x1Cu);
          }
        }
        else
        {
          v38 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            nl::wpantund::node_type_to_string(v21, (std::string *)&v90);
            int v39 = SBYTE7(v91);
            v40 = (long long *)v90;
            nl::wpantund::node_type_to_string(8u, &v77);
            v41 = &v90;
            if (v39 < 0) {
              v41 = v40;
            }
            if ((v77.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              v42 = &v77;
            }
            else {
              v42 = (std::string *)v77.__r_.__value_.__r.__words[0];
            }
            *(_DWORD *)buf = 136316162;
            *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) startPairing:isWED:output:]";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 86;
            *(_WORD *)&buf[18] = 2080;
            *(void *)&buf[20] = "true";
            *(_WORD *)&buf[28] = 2080;
            *(void *)&buf[30] = v41;
            __int16 v93 = 2080;
            size_t v94 = (size_t)v42;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%s:%d isWed = [%s] Current Node = [%s], transition to New Node = [%s]", buf, 0x30u);
            if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v77.__r_.__value_.__l.__data_);
            }
            if (SBYTE7(v91) < 0) {
              operator delete((void *)v90);
            }
          }

          v43 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
          std::string::basic_string[abi:ne180100]<0>(v75, "Network:NodeType");
          if (v43) {
            objc_msgSend(v43, "setProperty:property_val:", v75, "sleepy-router");
          }
          else {
            memset(buf, 0, 32);
          }
          CtrXPC::Result::operator=(&v80, (uint64_t)buf);
          if ((buf[31] & 0x80000000) != 0) {
            operator delete(*(void **)&buf[8]);
          }
          if (v76 < 0) {
            operator delete(v75[0]);
          }
        }
      }
      else
      {
        v22 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          nl::wpantund::node_type_to_string(v21, &v77);
          -[ThreadNetworkManagerInstance(SM_extension) startPairing:isWED:output:]();
        }
      }
LABEL_133:
      v56 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
      std::string::basic_string[abi:ne180100]<0>(v61, "Thread:Pairing:Status");
      if (v56)
      {
        objc_msgSend(v56, "setProperty:property_val:", v61, "1");
      }
      else
      {
        long long v90 = 0u;
        long long v91 = 0u;
      }
      int v57 = *CtrXPC::Result::operator=(&v80, (uint64_t)&v90);
      if (SHIBYTE(v91) < 0) {
        operator delete(*((void **)&v90 + 1));
      }
      if (v62 < 0) {
        operator delete(v61[0]);
      }

      if (v57)
      {
        v58 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string(&v60, &__p);
          -[ThreadNetworkManagerInstance(SM_extension) startPairing:isWED:output:]();
        }
      }
      [(ThreadNetworkManagerInstance *)self setIsPairing:1];
      [(ThreadNetworkManagerInstance *)self triggerBTWifiLoadInfoEvent];
      [(ThreadNetworkManagerInstance *)self CAincrementStartProcessSuccessCount:1];
      int v17 = 0;
      goto LABEL_145;
    }
  }
  else if (v6)
  {
    goto LABEL_34;
  }
  if (v21 <= 8)
  {
    if (((1 << v21) & 0x18) != 0)
    {
      if (v15)
      {
        xpc_object_t v33 = xpc_string_create(v15);
        id v63 = v33;
        if (!v33)
        {
          id v63 = xpc_null_create();
        }
        *(void *)buf = a5;
        *(void *)&buf[8] = "extendedMACAddress";
        xpc::dict::object_proxy::operator=((uint64_t)buf, &v63, &v64);
        id v34 = v64;
        id v64 = 0;

        id v35 = v63;
        id v63 = 0;
      }
      v36 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        nl::wpantund::node_type_to_string(v21, &v77);
        -[ThreadNetworkManagerInstance(SM_extension) startPairing:isWED:output:]();
      }

      goto LABEL_133;
    }
    if (((1 << v21) & 0x82) != 0)
    {
      if (v15)
      {
        v37 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
        std::string::basic_string[abi:ne180100]<0>(v67, "Thread:EmacId");
        if (v37) {
          objc_msgSend(v37, "setProperty:property_val:", v67, v15);
        }
        else {
          memset(buf, 0, 32);
        }
        CtrXPC::Result::operator=(&v80, (uint64_t)buf);
        if ((buf[31] & 0x80000000) != 0) {
          operator delete(*(void **)&buf[8]);
        }
        if (v68 < 0) {
          operator delete(v67[0]);
        }

        xpc_object_t v44 = xpc_string_create(v15);
        id v65 = v44;
        if (!v44)
        {
          id v65 = xpc_null_create();
        }
        *(void *)buf = a5;
        *(void *)&buf[8] = "extendedMACAddress";
        xpc::dict::object_proxy::operator=((uint64_t)buf, &v65, &v66);
        id v45 = v66;
        id v66 = 0;

        id v46 = v65;
        id v65 = 0;
      }
      resetRouterModeStatusTimerCounter();
      v47 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) startPairing:isWED:output:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 135;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%s:%d Already Router/Leader", buf, 0x12u);
      }

      if ([(ThreadNetworkManagerInstance *)self isThreadAlwaysOnFeatureEnabled])
      {
        v48 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) startPairing:isWED:output:]";
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%s: Start Power assertion in pairing mode as router", buf, 0xCu);
        }

        ThreadPowerAssertDispatchTask((unsigned __int8 *)&power_assertion_n);
      }
      goto LABEL_133;
    }
    if (((1 << v21) & 0x101) != 0)
    {
      v26 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        nl::wpantund::node_type_to_string(v21, (std::string *)&v90);
        int v27 = SBYTE7(v91);
        v28 = (long long *)v90;
        nl::wpantund::node_type_to_string(1u, &v77);
        v29 = &v90;
        if (v27 < 0) {
          v29 = v28;
        }
        if ((v77.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v30 = &v77;
        }
        else {
          v30 = (std::string *)v77.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)buf = 136316162;
        *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) startPairing:isWED:output:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 104;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = "false";
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v29;
        __int16 v93 = 2080;
        size_t v94 = (size_t)v30;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s:%d isWed = [%s] Current Node = [%s], transition to New Node = [%s]", buf, 0x30u);
        if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v77.__r_.__value_.__l.__data_);
        }
        if (SBYTE7(v91) < 0) {
          operator delete((void *)v90);
        }
      }

      if (v15)
      {
        v31 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
        std::string::basic_string[abi:ne180100]<0>(v73, "Thread:EmacId");
        if (v31) {
          objc_msgSend(v31, "setProperty:property_val:", v73, v15);
        }
        else {
          memset(buf, 0, 32);
        }
        CtrXPC::Result::operator=(&v80, (uint64_t)buf);
        if ((buf[31] & 0x80000000) != 0) {
          operator delete(*(void **)&buf[8]);
        }
        if (v74 < 0) {
          operator delete(v73[0]);
        }

        xpc_object_t v49 = xpc_string_create(v15);
        id v71 = v49;
        if (!v49)
        {
          id v71 = xpc_null_create();
        }
        *(void *)buf = a5;
        *(void *)&buf[8] = "extendedMACAddress";
        xpc::dict::object_proxy::operator=((uint64_t)buf, &v71, &v72);
        id v50 = v72;
        id v72 = 0;

        id v51 = v71;
        id v71 = 0;
      }
      v52 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
      std::string::basic_string[abi:ne180100]<0>(v69, "Network:NodeType");
      if (v52) {
        objc_msgSend(v52, "setProperty:property_val:", v69, "router");
      }
      else {
        memset(buf, 0, 32);
      }
      CtrXPC::Result::operator=(&v80, (uint64_t)buf);
      if ((buf[31] & 0x80000000) != 0) {
        operator delete(*(void **)&buf[8]);
      }
      if (v70 < 0) {
        operator delete(v69[0]);
      }

      resetRouterModeStatusTimerCounter();
      v53 = (RcpHostContext *)[(ThreadNetworkManagerInstance *)self isThreadAlwaysOnFeatureEnabled];
      if (v53)
      {
        v54 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) startPairing:isWED:output:]";
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%s: Start Power assertion in pairing mode as router", buf, 0xCu);
        }

        ThreadPowerAssertDispatchTask((unsigned __int8 *)&power_assertion_n);
      }
      RcpHostContext = (RcpHostContext *)RcpHostContext::GetRcpHostContext(v53);
      RcpHostContext::signalNodeStatusChange(RcpHostContext);
    }
  }
  int v17 = 1;
  [(ThreadNetworkManagerInstance *)self CAnoteStopProcessReqTimeSuccessOrFail:0 isProcessPairing:1];
LABEL_145:
  v59 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v84 = 136315650;
    v85 = "-[ThreadNetworkManagerInstance(SM_extension) startPairing:isWED:output:]";
    __int16 v86 = 1024;
    int v87 = 181;
    __int16 v88 = 1024;
    int v89 = v17;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%s:%d Exiting ret : %d", v84, 0x18u);
  }

LABEL_17:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v82) {
    (*(void (**)(uint64_t))(*(void *)v82 + 8))(v82);
  }

  objc_destroyWeak(&location);
  return v17;
}

- (int)stopPairing:(dict *)a3
{
  id v4 = objc_initWeak(&location, self);
  uint64_t v37 = 0;
  int v35 = 0;
  memset(&v36, 0, sizeof(v36));
  [(ThreadNetworkManagerInstance *)self getNCPState:0];
  [(ThreadNetworkManagerInstance *)self CAincrementStopProcessCount:1];
  [(ThreadNetworkManagerInstance *)self CAnoteStopProcessReqTimeSuccessOrFail:1 isProcessPairing:1];
  v5 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    nl::wpantund::ncp_state_to_string((char *)[(ThreadNetworkManagerInstance *)self lastKnownNCPState], (uint64_t)v42);
    BOOL v6 = v43 >= 0 ? v42 : (void **)v42[0];
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) stopPairing:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 199;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d Stop Pairing received in state %s", buf, 0x1Cu);
    if (v43 < 0) {
      operator delete(v42[0]);
    }
  }

  size_t v7 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(__p, "Thread:Pairing:Status");
  if (v7) {
    objc_msgSend(v7, "setProperty:property_val:", __p, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v8 = *CtrXPC::Result::operator=(&v35, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v34 < 0) {
    operator delete(__p[0]);
  }

  if (v8)
  {
    id v9 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string(&v32, &v36);
      -[ThreadNetworkManagerInstance(SM_extension) stopPairing:].cold.5();
    }
  }
  [(ThreadNetworkManagerInstance *)self setIsPairing:0];
  if ([(ThreadNetworkManagerInstance *)self lastKnownNCPState] == 4)
  {
    v10 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance(SM_extension) stopPairing:]();
    }
LABEL_31:
    int v13 = 1;
    goto LABEL_32;
  }
  v11 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(v30, "Network:NodeType");
  if (v11) {
    [v11 getProperty:v30 output:&v37];
  }
  else {
    memset(buf, 0, 32);
  }
  int v12 = *CtrXPC::Result::operator=(&v35, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v31 < 0) {
    operator delete(v30[0]);
  }

  if (v12)
  {
    v10 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance(SM_extension) startPairing:isWED:output:].cold.4();
    }
    goto LABEL_31;
  }
  any_to_string((const boost::any *)&v37, (uint64_t)buf);
  unsigned int v15 = nl::wpantund::string_to_node_type(buf);
  if ((buf[23] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  if (v15 <= 7 && ((1 << v15) & 0x83) != 0)
  {
    v16 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
    std::string::basic_string[abi:ne180100]<0>(v28, "Thread:EmacId");
    if (v16) {
      objc_msgSend(v16, "setProperty:property_val:", v28, "");
    }
    else {
      memset(buf, 0, 32);
    }
    CtrXPC::Result::operator=(&v35, (uint64_t)buf);
    if ((buf[31] & 0x80000000) != 0) {
      operator delete(*(void **)&buf[8]);
    }
    if (v29 < 0) {
      operator delete(v28[0]);
    }

    if ([(ThreadNetworkManagerInstance *)self foundAdvDuringPairing]
      && [(ThreadNetworkManagerInstance *)self numAdvDuringPairing] >= 0xA)
    {
      [(ThreadNetworkManagerInstance *)self reset];
      int v17 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = &v27;
        nl::wpantund::node_type_to_string(v15, &v27);
        if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          v18 = (std::string *)v27.__r_.__value_.__r.__words[0];
        }
        v19 = [(ThreadNetworkManagerInstance *)self defaultChildNode];
        unsigned int v20 = [(ThreadNetworkManagerInstance *)self numAdvDuringPairing];
        *(_DWORD *)buf = 136316162;
        *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) stopPairing:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 230;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = v18;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v19;
        __int16 v40 = 1024;
        unsigned int v41 = v20;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s:%d Current Node = [%s], transition to New Node = [%s], num ADV Rx During Pairing = [%d]", buf, 0x2Cu);
        if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v27.__r_.__value_.__l.__data_);
        }
      }

      unsigned int v21 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
      std::string::basic_string[abi:ne180100]<0>(v25, "Network:NodeType");
      v22 = [(ThreadNetworkManagerInstance *)self defaultChildNode];
      if (v21) {
        objc_msgSend(v21, "setProperty:property_val:", v25, v22);
      }
      else {
        memset(buf, 0, 32);
      }
      CtrXPC::Result::operator=(&v35, (uint64_t)buf);
      if ((buf[31] & 0x80000000) != 0) {
        operator delete(*(void **)&buf[8]);
      }
      if (v26 < 0) {
        operator delete(v25[0]);
      }

      if (v35)
      {
        v24 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[ThreadNetworkManagerInstance(SM_extension) stopPairing:]();
        }

        int v13 = 1;
        goto LABEL_61;
      }
    }
    else
    {
      v23 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance(SM_extension) stopPairing:]();
      }

      [(ThreadNetworkManagerInstance *)self setStopPairingRequest:1];
    }
  }
  [(ThreadNetworkManagerInstance *)self setIsPairing:0];
  int v13 = 0;
LABEL_61:
  v10 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) stopPairing:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 254;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s:%d Exiting ret : %d", buf, 0x18u);
  }
LABEL_32:

  if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v36.__r_.__value_.__l.__data_);
  }
  if (v37) {
    (*(void (**)(uint64_t))(*(void *)v37 + 8))(v37);
  }

  objc_destroyWeak(&location);
  return v13;
}

- (int)startFWUpdate:(const char *)a3 isWED:(BOOL)a4 output:(dict *)a5
{
  BOOL v6 = a4;
  id v9 = objc_initWeak(&location, self);
  uint64_t v111 = 0;
  int v109 = 0;
  memset(&__p, 0, sizeof(__p));
  [(ThreadNetworkManagerInstance *)self reset];
  [(ThreadNetworkManagerInstance *)self getNCPState:0];
  [(ThreadNetworkManagerInstance *)self CAincrementStartProcessCount:0];
  v10 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = &v119;
    nl::wpantund::ncp_state_to_string((char *)[(ThreadNetworkManagerInstance *)self lastKnownNCPState], (uint64_t)&v119);
    if ((v119.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      v11 = (std::string *)v119.__r_.__value_.__r.__words[0];
    }
    if (a3) {
      int v12 = a3;
    }
    else {
      int v12 = "nil";
    }
    if (a3) {
      size_t v13 = strlen(a3);
    }
    else {
      size_t v13 = 0;
    }
    *(_DWORD *)buf = 136316418;
    *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) startFWUpdate:isWED:output:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 272;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = v11;
    *(_WORD *)&buf[28] = 2080;
    *(void *)&buf[30] = v12;
    __int16 v121 = 2048;
    size_t v122 = v13;
    __int16 v123 = 1024;
    int v124 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s:%d Start FW Update Cmd received in state %s, extendedMACAddress : %s, Length = %ld, isWED : %d", buf, 0x36u);
    if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v119.__r_.__value_.__l.__data_);
    }
  }

  v14 = [(ThreadNetworkManagerInstance *)self validateExtendedMACAddress:a3];
  unsigned int v15 = v14;
  if (v6 && !v14 || [(ThreadNetworkManagerInstance *)self lastKnownNCPState] == 4)
  {
    v16 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v28 = &v119;
      nl::wpantund::ncp_state_to_string((char *)[(ThreadNetworkManagerInstance *)self lastKnownNCPState], (uint64_t)&v119);
      if ((v119.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        v28 = (std::string *)v119.__r_.__value_.__r.__words[0];
      }
      if (v15) {
        char v29 = v15;
      }
      else {
        char v29 = "nil";
      }
      if (v15) {
        size_t v30 = strlen(v15);
      }
      else {
        size_t v30 = 0;
      }
      *(_DWORD *)buf = 136316418;
      *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) startFWUpdate:isWED:output:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 281;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v28;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = v29;
      __int16 v121 = 2048;
      size_t v122 = v30;
      __int16 v123 = 1024;
      int v124 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s:%d Returning error :  Failed to start FW Update, state %s, extendedMACAddress : %s, Length = %ld, isWED : %d", buf, 0x36u);
      if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v119.__r_.__value_.__l.__data_);
      }
    }
LABEL_16:

    [(ThreadNetworkManagerInstance *)self CAnoteStopProcessReqTimeSuccessOrFail:0 isProcessPairing:0];
LABEL_17:
    int v17 = 1;
    goto LABEL_18;
  }
  v19 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(v107, "Network:NodeType");
  if (v19) {
    [v19 getProperty:v107 output:&v111];
  }
  else {
    memset(buf, 0, 32);
  }
  int v20 = *CtrXPC::Result::operator=(&v109, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v108 < 0) {
    operator delete(v107[0]);
  }

  if (v20)
  {
    v16 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance(SM_extension) startPairing:isWED:output:].cold.4();
    }
    goto LABEL_16;
  }
  any_to_string((const boost::any *)&v111, (uint64_t)buf);
  unsigned int v21 = nl::wpantund::string_to_node_type(buf);
  if ((buf[23] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  int v17 = 1;
  switch(v21)
  {
    case 0u:
      if (v6)
      {
        int v35 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          nl::wpantund::node_type_to_string(0, &v119);
          int v36 = SHIBYTE(v119.__r_.__value_.__r.__words[2]);
          std::string::size_type v37 = v119.__r_.__value_.__r.__words[0];
          nl::wpantund::node_type_to_string(8u, &v102);
          v38 = &v119;
          if (v36 < 0) {
            v38 = (std::string *)v37;
          }
          if ((v102.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            int v39 = &v102;
          }
          else {
            int v39 = (std::string *)v102.__r_.__value_.__r.__words[0];
          }
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) startFWUpdate:isWED:output:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 337;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = "true";
          *(_WORD *)&buf[28] = 2080;
          *(void *)&buf[30] = v38;
          __int16 v121 = 2080;
          size_t v122 = (size_t)v39;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s:%d isWed = [%s] Current Node = [%s], transition to New Node = [%s]", buf, 0x30u);
          if (SHIBYTE(v102.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v102.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v119.__r_.__value_.__l.__data_);
          }
        }

        __int16 v40 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
        std::string::basic_string[abi:ne180100]<0>(v99, "Network:NodeType");
        if (v40) {
          objc_msgSend(v40, "setProperty:property_val:", v99, "sleepy-router");
        }
        else {
          memset(buf, 0, 32);
        }
        int v68 = *CtrXPC::Result::operator=(&v109, (uint64_t)buf);
        if ((buf[31] & 0x80000000) != 0) {
          operator delete(*(void **)&buf[8]);
        }
        if (v100 < 0) {
          operator delete(v99[0]);
        }

        if (!v68)
        {
          if (v15)
          {
            v69 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
            std::string::basic_string[abi:ne180100]<0>(v97, "Thread:EmacId");
            if (v69) {
              objc_msgSend(v69, "setProperty:property_val:", v97, v15);
            }
            else {
              memset(buf, 0, 32);
            }
            int v81 = *CtrXPC::Result::operator=(&v109, (uint64_t)buf);
            if ((buf[31] & 0x80000000) != 0) {
              operator delete(*(void **)&buf[8]);
            }
            if (v98 < 0) {
              operator delete(v97[0]);
            }

            if (v81)
            {
              uint64_t v82 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
              if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
              {
                std::string::basic_string(&v102, &__p);
                -[ThreadNetworkManagerInstance(SM_extension) startFWUpdate:isWED:output:]();
              }
            }
          }
          v83 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
          {
            v84 = &v101;
            nl::wpantund::ncp_state_to_string((char *)[(ThreadNetworkManagerInstance *)self lastKnownNCPState], (uint64_t)&v101);
            if ((v101.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
              v84 = (std::string *)v101.__r_.__value_.__r.__words[0];
            }
            if (v15) {
              v85 = v15;
            }
            else {
              v85 = "nil";
            }
            if (v15) {
              size_t v86 = strlen(v15);
            }
            else {
              size_t v86 = 0;
            }
            *(_DWORD *)buf = 136316418;
            *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) startFWUpdate:isWED:output:]";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 351;
            *(_WORD *)&buf[18] = 2080;
            *(void *)&buf[20] = v84;
            *(_WORD *)&buf[28] = 2080;
            *(void *)&buf[30] = v85;
            __int16 v121 = 2048;
            size_t v122 = v86;
            __int16 v123 = 1024;
            int v124 = 1;
            _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "%s:%d Calling  provideExtendedMACAddress from start FW Updating, state %s, extendedMACAddress : %s, Length = %ld, isWED : %d", buf, 0x36u);
            if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v101.__r_.__value_.__l.__data_);
            }
          }

          [(ThreadNetworkManagerInstance *)self provideExtendedMACAddress:v15 output:a5];
          goto LABEL_222;
        }
LABEL_170:
        [(ThreadNetworkManagerInstance *)self CAnoteStopProcessReqTimeSuccessOrFail:0 isProcessPairing:0];
        goto LABEL_17;
      }
      v47 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        nl::wpantund::node_type_to_string(0, &v119);
        int v48 = SHIBYTE(v119.__r_.__value_.__r.__words[2]);
        std::string::size_type v49 = v119.__r_.__value_.__r.__words[0];
        nl::wpantund::node_type_to_string(1u, &v102);
        id v50 = &v119;
        if (v48 < 0) {
          id v50 = (std::string *)v49;
        }
        if ((v102.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          id v51 = &v102;
        }
        else {
          id v51 = (std::string *)v102.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)buf = 136316162;
        *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) startFWUpdate:isWED:output:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 356;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = "false";
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v50;
        __int16 v121 = 2080;
        size_t v122 = (size_t)v51;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%s:%d isWed = [%s] Current Node = [%s], transitioning to New Node = [%s]", buf, 0x30u);
        if (SHIBYTE(v102.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v102.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v119.__r_.__value_.__l.__data_);
        }
      }

      v52 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
      std::string::basic_string[abi:ne180100]<0>(v95, "Network:NodeType");
      if (v52) {
        objc_msgSend(v52, "setProperty:property_val:", v95, "router");
      }
      else {
        memset(buf, 0, 32);
      }
      int v70 = *CtrXPC::Result::operator=(&v109, (uint64_t)buf);
      if ((buf[31] & 0x80000000) != 0) {
        operator delete(*(void **)&buf[8]);
      }
      if (v96 < 0) {
        operator delete(v95[0]);
      }

      if (!v70) {
        goto LABEL_222;
      }
      id v71 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        std::string::basic_string(&v119, &__p);
        -[ThreadNetworkManagerInstance(SM_extension) startFWUpdate:isWED:output:].cold.4();
      }
      goto LABEL_169;
    case 1u:
    case 7u:
      if (!v6)
      {
        unsigned int v41 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          nl::wpantund::node_type_to_string(v21, &v119);
          v42 = (v119.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
              ? &v119
              : (std::string *)v119.__r_.__value_.__r.__words[0];
          *(_DWORD *)buf = 136315906;
          *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) startFWUpdate:isWED:output:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 454;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = "false";
          *(_WORD *)&buf[28] = 2080;
          *(void *)&buf[30] = v42;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%s:%d isWed = [%s] Current Node = [%s], no need to set to Router mode again, ", buf, 0x26u);
          if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v119.__r_.__value_.__l.__data_);
          }
        }

        [(ThreadNetworkManagerInstance *)self startFWUpdateHelper:v15];
        goto LABEL_223;
      }
      v22 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        nl::wpantund::node_type_to_string(v21, &v119);
        int v23 = SHIBYTE(v119.__r_.__value_.__r.__words[2]);
        std::string::size_type v24 = v119.__r_.__value_.__r.__words[0];
        nl::wpantund::node_type_to_string(8u, &v102);
        size_t v25 = &v119;
        if (v23 < 0) {
          size_t v25 = (std::string *)v24;
        }
        if ((v102.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          char v26 = &v102;
        }
        else {
          char v26 = (std::string *)v102.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)buf = 136316162;
        *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) startFWUpdate:isWED:output:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 435;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = "true";
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v25;
        __int16 v121 = 2080;
        size_t v122 = (size_t)v26;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s:%d isWed = [%s] Current Node = [%s], transition to New Node = [%s]", buf, 0x30u);
        if (SHIBYTE(v102.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v102.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v119.__r_.__value_.__l.__data_);
        }
      }

      std::string v27 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
      std::string::basic_string[abi:ne180100]<0>(v91, "Network:NodeType");
      if (v27) {
        objc_msgSend(v27, "setProperty:property_val:", v91, "sleepy-router");
      }
      else {
        memset(buf, 0, 32);
      }
      int v66 = *CtrXPC::Result::operator=(&v109, (uint64_t)buf);
      if ((buf[31] & 0x80000000) != 0) {
        operator delete(*(void **)&buf[8]);
      }
      if (v92 < 0) {
        operator delete(v91[0]);
      }

      if (v66) {
        goto LABEL_170;
      }
      if (v15)
      {
        v67 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
        std::string::basic_string[abi:ne180100]<0>(v89, "Thread:EmacId");
        if (v67) {
          objc_msgSend(v67, "setProperty:property_val:", v89, v15);
        }
        else {
          memset(buf, 0, 32);
        }
        int v74 = *CtrXPC::Result::operator=(&v109, (uint64_t)buf);
        if ((buf[31] & 0x80000000) != 0) {
          operator delete(*(void **)&buf[8]);
        }
        if (v90 < 0) {
          operator delete(v89[0]);
        }

        if (v74)
        {
          v75 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          {
            std::string::basic_string(&v102, &__p);
            -[ThreadNetworkManagerInstance(SM_extension) startFWUpdate:isWED:output:].cold.6();
          }
        }
      }
      char v43 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        char v76 = &v101;
        nl::wpantund::ncp_state_to_string((char *)[(ThreadNetworkManagerInstance *)self lastKnownNCPState], (uint64_t)&v101);
        if ((v101.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          char v76 = (std::string *)v101.__r_.__value_.__r.__words[0];
        }
        std::string v77 = v15 ? (char *)v15 : "nil";
        size_t v78 = v15 ? strlen(v15) : 0;
        *(_DWORD *)buf = 136316418;
        *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) startFWUpdate:isWED:output:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 449;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = v76;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v77;
        __int16 v121 = 2048;
        size_t v122 = v78;
        __int16 v123 = 1024;
        int v124 = 1;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%s:%d Calling  provideExtendedMACAddress from start FW Updating, state %s, extendedMACAddress : %s, Length = %ld, isWED : %d", buf, 0x36u);
        if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0)
        {
          v73 = (void *)v101.__r_.__value_.__r.__words[0];
          goto LABEL_194;
        }
      }
      goto LABEL_195;
    case 3u:
    case 4u:
      if (v15)
      {
        xpc_object_t v31 = xpc_string_create(v15);
        id v105 = v31;
        if (!v31)
        {
          id v105 = xpc_null_create();
        }
        *(void *)buf = a5;
        *(void *)&buf[8] = "extendedMACAddress";
        xpc::dict::object_proxy::operator=((uint64_t)buf, &v105, &v106);
        id v32 = v106;
        id v106 = 0;

        id v33 = v105;
        id v105 = 0;

        char v34 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
        std::string::basic_string[abi:ne180100]<0>(v103, "Thread:EmacId");
        if (v34) {
          objc_msgSend(v34, "setProperty:property_val:", v103, v15);
        }
        else {
          memset(buf, 0, 32);
        }
        int v59 = *CtrXPC::Result::operator=(&v109, (uint64_t)buf);
        if ((buf[31] & 0x80000000) != 0) {
          operator delete(*(void **)&buf[8]);
        }
        if (v104 < 0) {
          operator delete(v103[0]);
        }

        if (v59)
        {
          std::string v60 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            std::string::basic_string(&v102, &__p);
            -[ThreadNetworkManagerInstance(SM_extension) startFWUpdate:isWED:output:]();
          }
        }
      }
      if (v6)
      {
        [(ThreadNetworkManagerInstance *)self setIsWedFWUpdateProgressInChildRole:1];
        [(ThreadNetworkManagerInstance *)self setIsNonWedFWUpdateProgressInChildRole:0];
        v61 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
        if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          goto LABEL_132;
        }
        unsigned int v62 = [(ThreadNetworkManagerInstance *)self isWedFWUpdateProgressInChildRole];
        id v63 = "nil";
        if (v15) {
          id v63 = v15;
        }
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v62;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = v63;
        id v64 = "isWedFWUpdateProgressInChildRole = %d and extaddr = %s";
      }
      else
      {
        [(ThreadNetworkManagerInstance *)self setIsNonWedFWUpdateProgressInChildRole:1];
        [(ThreadNetworkManagerInstance *)self setIsWedFWUpdateProgressInChildRole:0];
        v61 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
        if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          goto LABEL_132;
        }
        unsigned int v79 = [(ThreadNetworkManagerInstance *)self isNonWedFWUpdateProgressInChildRole];
        int v80 = "nil";
        if (v15) {
          int v80 = v15;
        }
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v79;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = v80;
        id v64 = "isNonWedFWUpdateProgressInChildRole = %d and extaddr = %s";
      }
      _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, v64, buf, 0x12u);
LABEL_132:

      id v65 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        nl::wpantund::node_type_to_string(v21, &v101);
        -[ThreadNetworkManagerInstance(SM_extension) startFWUpdate:isWED:output:](v6, (uint64_t)&v101, (uint64_t)buf);
      }

      goto LABEL_223;
    case 8u:
      if (!v6)
      {
        [(ThreadNetworkManagerInstance *)self disconnectActiveWedConnection];
        v53 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          nl::wpantund::node_type_to_string(8u, &v119);
          int v54 = SHIBYTE(v119.__r_.__value_.__r.__words[2]);
          std::string::size_type v55 = v119.__r_.__value_.__r.__words[0];
          nl::wpantund::node_type_to_string(1u, &v102);
          v56 = &v119;
          if (v54 < 0) {
            v56 = (std::string *)v55;
          }
          if ((v102.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            int v57 = &v102;
          }
          else {
            int v57 = (std::string *)v102.__r_.__value_.__r.__words[0];
          }
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) startFWUpdate:isWED:output:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 404;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = "false";
          *(_WORD *)&buf[28] = 2080;
          *(void *)&buf[30] = v56;
          __int16 v121 = 2080;
          size_t v122 = (size_t)v57;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%s:%d isWed = [%s] Current Node = [%s], transitioning to New Node = [%s]", buf, 0x30u);
          if (SHIBYTE(v102.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v102.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v119.__r_.__value_.__l.__data_);
          }
        }

        v58 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
        std::string::basic_string[abi:ne180100]<0>(v93, "Network:NodeType");
        if (v58) {
          objc_msgSend(v58, "setProperty:property_val:", v93, "router");
        }
        else {
          memset(buf, 0, 32);
        }
        int v72 = *CtrXPC::Result::operator=(&v109, (uint64_t)buf);
        if ((buf[31] & 0x80000000) != 0) {
          operator delete(*(void **)&buf[8]);
        }
        if (v94 < 0) {
          operator delete(v93[0]);
        }

        if (!v72)
        {
LABEL_222:
          RcpHostContext = (RcpHostContext *)RcpHostContext::GetRcpHostContext((RcpHostContext *)[(ThreadNetworkManagerInstance *)self startFWUpdateHelper:v15]);
          RcpHostContext::signalNodeStatusChange(RcpHostContext);
        }
        id v71 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          std::string::basic_string(&v119, &__p);
          -[ThreadNetworkManagerInstance(SM_extension) startFWUpdate:isWED:output:].cold.5();
        }
LABEL_169:

        disableFWUpdateFlag();
        goto LABEL_170;
      }
      char v43 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        xpc_object_t v44 = &v119;
        nl::wpantund::ncp_state_to_string((char *)[(ThreadNetworkManagerInstance *)self lastKnownNCPState], (uint64_t)&v119);
        if ((v119.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          xpc_object_t v44 = (std::string *)v119.__r_.__value_.__r.__words[0];
        }
        id v45 = v15 ? (char *)v15 : "nil";
        size_t v46 = v15 ? strlen(v15) : 0;
        *(_DWORD *)buf = 136316418;
        *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) startFWUpdate:isWED:output:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 388;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = v44;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v45;
        __int16 v121 = 2048;
        size_t v122 = v46;
        __int16 v123 = 1024;
        int v124 = 1;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%s:%d Calling  provideExtendedMACAddress from start FW Updating, state %s, extendedMACAddress : %s, Length = %ld, isWED : %d", buf, 0x36u);
        if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0)
        {
          v73 = (void *)v119.__r_.__value_.__r.__words[0];
LABEL_194:
          operator delete(v73);
        }
      }
LABEL_195:

      int v17 = [(ThreadNetworkManagerInstance *)self provideExtendedMACAddress:v15 output:a5];
      if (v17)
      {
LABEL_196:
        [(ThreadNetworkManagerInstance *)self CAnoteStopProcessReqTimeSuccessOrFail:0 isProcessPairing:0];
      }
      else
      {
LABEL_223:
        [(ThreadNetworkManagerInstance *)self setIsFWUpdateInProgress:1];
        [(ThreadNetworkManagerInstance *)self CAincrementStartProcessSuccessCount:0];
        int v17 = 0;
      }
      __int16 v88 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v113 = 136315650;
        v114 = "-[ThreadNetworkManagerInstance(SM_extension) startFWUpdate:isWED:output:]";
        __int16 v115 = 1024;
        int v116 = 477;
        __int16 v117 = 1024;
        int v118 = v17;
        _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "%s:%d Exiting ret : %d", v113, 0x18u);
      }

LABEL_18:
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v111) {
        (*(void (**)(uint64_t))(*(void *)v111 + 8))(v111);
      }

      objc_destroyWeak(&location);
      return v17;
    default:
      goto LABEL_196;
  }
}

- (void)startFWUpdateHelper:(const char *)a3
{
  id v5 = objc_initWeak(&location, self);
  int v21 = 0;
  memset(&v22, 0, sizeof(v22));
  BOOL v6 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    size_t v7 = "nil";
    if (a3) {
      size_t v7 = a3;
    }
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Start FwUpdate extendedMACAddress : %s", (uint8_t *)&buf, 0xCu);
  }

  enableFWUpdateFlag();
  if ([(ThreadNetworkManagerInstance *)self isThreadAlwaysOnFeatureEnabled])
  {
    int v8 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[ThreadNetworkManagerInstance(SM_extension) startFWUpdateHelper:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Start Power assertion in FW update mode", (uint8_t *)&buf, 0xCu);
    }

    ThreadPowerAssertDispatchTask((unsigned __int8 *)&power_assertion_n);
  }
  id v9 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(__p, "Thread:FWUpdate");
  if (v9)
  {
    objc_msgSend(v9, "setProperty:property_val:", __p, "1");
  }
  else
  {
    long long buf = 0u;
    long long v27 = 0u;
  }
  int v10 = *CtrXPC::Result::operator=(&v21, (uint64_t)&buf);
  if (SHIBYTE(v27) < 0) {
    operator delete(*((void **)&buf + 1));
  }
  if (v20 < 0) {
    operator delete(__p[0]);
  }

  if (v10)
  {
    v11 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string(&v18, &v22);
      -[ThreadNetworkManagerInstance(SM_extension) startFWUpdateHelper:]();
    }
  }
  if (a3)
  {
    int v12 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
    std::string::basic_string[abi:ne180100]<0>(v16, "Thread:EmacId");
    if (v12)
    {
      objc_msgSend(v12, "setProperty:property_val:", v16, a3);
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
    }
    int v13 = *CtrXPC::Result::operator=(&v21, (uint64_t)&v24);
    if (SHIBYTE(v25) < 0) {
      operator delete(*((void **)&v24 + 1));
    }
    if (v17 < 0) {
      operator delete(v16[0]);
    }

    if (v13)
    {
      v14 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        std::string::basic_string(&v15, &v22);
        -[ThreadNetworkManagerInstance(SM_extension) startFWUpdateHelper:]();
      }
    }
  }
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }

  objc_destroyWeak(&location);
}

- (int)stopFWUpdate:(dict *)a3
{
  id v4 = objc_initWeak(&location, self);
  int v21 = 0;
  memset(&v22, 0, sizeof(v22));
  [(ThreadNetworkManagerInstance *)self getNCPState:0];
  [(ThreadNetworkManagerInstance *)self CAincrementStopProcessCount:0];
  id v5 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    nl::wpantund::ncp_state_to_string((char *)[(ThreadNetworkManagerInstance *)self lastKnownNCPState], (uint64_t)&v30);
    BOOL v6 = (SBYTE7(v31) & 0x80u) == 0 ? &v30 : (long long *)v30;
    *(_DWORD *)long long buf = 136315650;
    *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) stopFWUpdate:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 526;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d Stop FW Update received in state %s", buf, 0x1Cu);
    if (SBYTE7(v31) < 0) {
      operator delete((void *)v30);
    }
  }

  if ([(ThreadNetworkManagerInstance *)self isWedFWUpdateProgressInChildRole]) {
    [(ThreadNetworkManagerInstance *)self disconnectActiveWedConnection];
  }
  [(ThreadNetworkManagerInstance *)self setIsNonWedFWUpdateProgressInChildRole:0];
  [(ThreadNetworkManagerInstance *)self setIsWedFWUpdateProgressInChildRole:0];
  disableFWUpdateFlag();
  size_t v7 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(__p, "Thread:FWUpdate");
  if (v7) {
    objc_msgSend(v7, "setProperty:property_val:", __p, "0");
  }
  else {
    memset(buf, 0, 32);
  }
  int v8 = *CtrXPC::Result::operator=(&v21, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v20 < 0) {
    operator delete(__p[0]);
  }

  if (v8)
  {
    id v9 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string(&v18, &v22);
      -[ThreadNetworkManagerInstance(SM_extension) stopFWUpdate:]();
    }
  }
  [(ThreadNetworkManagerInstance *)self resetFWUpdateStatus];
  int v10 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(v16, "Thread:EmacId");
  if (v10)
  {
    objc_msgSend(v10, "setProperty:property_val:", v16, "");
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
  }
  int v11 = *CtrXPC::Result::operator=(&v21, (uint64_t)&v30);
  if (SHIBYTE(v31) < 0) {
    operator delete(*((void **)&v30 + 1));
  }
  if (v17 < 0) {
    operator delete(v16[0]);
  }

  if (v11)
  {
    int v12 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string(&v15, &v22);
      -[ThreadNetworkManagerInstance(SM_extension) stopFWUpdate:]();
    }
  }
  int v13 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long v24 = 136315650;
    long long v25 = "-[ThreadNetworkManagerInstance(SM_extension) stopFWUpdate:]";
    __int16 v26 = 1024;
    int v27 = 555;
    __int16 v28 = 1024;
    int v29 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s:%d Exiting ret : %d", v24, 0x18u);
  }

  [(ThreadNetworkManagerInstance *)self CAnoteStopProcessReqTimeSuccessOrFail:1 isProcessPairing:0];
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }

  objc_destroyWeak(&location);
  return 0;
}

- (void)registerStateMachineWedEventHandlers
{
  id v3 = objc_initWeak(&location, self);
  id v4 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(v26, "TNMWakeOnDeviceConnectionStatus");
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = __82__ThreadNetworkManagerInstance_SM_extension__registerStateMachineWedEventHandlers__block_invoke;
  v24[3] = &unk_10049BFE8;
  objc_copyWeak(&v25, &location);
  id v5 = [(ThreadNetworkManagerInstance *)self tnmWedStatusChangeQueue];
  id v23 = v5;
  [v4 setEventHandler:v26 InternalClientEventBlock:v24 dqueue:&v23];
  id v6 = v23;
  id v23 = 0;

  if (v27 < 0) {
    operator delete(v26[0]);
  }

  size_t v7 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(__p, "ReceivedAdv");
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __82__ThreadNetworkManagerInstance_SM_extension__registerStateMachineWedEventHandlers__block_invoke_24;
  v19[3] = &unk_10049BFE8;
  objc_copyWeak(&v20, &location);
  id v8 = [(ThreadNetworkManagerInstance *)self tnmNodeTypeChangeQueue];
  id v18 = v8;
  [v7 setEventHandler:__p InternalClientEventBlock:v19 dqueue:&v18];
  id v9 = v18;
  id v18 = 0;

  if (v22 < 0) {
    operator delete(__p[0]);
  }

  int v10 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(v16, "AttachRetryAttemptsComplete");
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __82__ThreadNetworkManagerInstance_SM_extension__registerStateMachineWedEventHandlers__block_invoke_26;
  v14[3] = &unk_10049BFE8;
  objc_copyWeak(&v15, &location);
  id v11 = [(ThreadNetworkManagerInstance *)self tnmNodeTypeChangeQueue];
  id v13 = v11;
  [v10 setEventHandler:v16 InternalClientEventBlock:v14 dqueue:&v13];
  id v12 = v13;
  id v13 = 0;

  if (v17 < 0) {
    operator delete(v16[0]);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v25);

  objc_destroyWeak(&location);
}

void __82__ThreadNetworkManagerInstance_SM_extension__registerStateMachineWedEventHandlers__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v26 = 0;
  [WeakRetained getNCPState:0];
  if (WeakRetained && [WeakRetained lastKnownNodeType] == 8)
  {
    uint64_t v4 = boost::any_cast<unsigned char>(a2);
    id v5 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unsigned int v6 = [WeakRetained lastKnownNCPState];
      nl::wpantund::ncp_wed_status_to_string(v4, (char *)__p);
      size_t v7 = SHIBYTE(__p[2]) >= 0 ? __p : (void **)__p[0];
      LODWORD(buf.__r_.__value_.__l.__data_) = 67109378;
      HIDWORD(buf.__r_.__value_.__r.__words[0]) = v6;
      LOWORD(buf.__r_.__value_.__r.__words[1]) = 2080;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 2) = (std::string::size_type)v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "ThreadConnection: kWPANTUNDEvent_TNMWakeOnDevice_Connected setEventHandler state = %d, child Status = %s \n", (uint8_t *)&buf, 0x12u);
      if (SHIBYTE(__p[2]) < 0) {
        operator delete(__p[0]);
      }
    }

    id v8 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      nl::wpantund::node_type_to_string([WeakRetained lastKnownNodeType], &buf);
      id v9 = (buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
         ? &buf
         : (std::string *)buf.__r_.__value_.__r.__words[0];
      LODWORD(__p[0]) = 136315650;
      *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance(SM_extension) registerStateMachineWedEventHandlers]_block_invoke";
      WORD2(__p[1]) = 1024;
      *(_DWORD *)((char *)&__p[1] + 6) = 581;
      WORD1(__p[2]) = 2080;
      *(void **)((char *)&__p[2] + 4) = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:%d Notify Wed Status Change, lastKnownNodeType = [%s]", (uint8_t *)__p, 0x1Cu);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf.__r_.__value_.__l.__data_);
      }
    }

    [WeakRetained notifyOnWedStatusChange:v4];
  }
  else
  {
    int v10 = boost::any_cast<unsigned char>(a2);
    id v11 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      nl::wpantund::node_type_to_string([WeakRetained lastKnownNodeType], &buf);
      id v12 = (buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &buf
          : (std::string *)buf.__r_.__value_.__r.__words[0];
      LODWORD(__p[0]) = 136315906;
      *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance(SM_extension) registerStateMachineWedEventHandlers]_block_invoke";
      WORD2(__p[1]) = 1024;
      *(_DWORD *)((char *)&__p[1] + 6) = 586;
      WORD1(__p[2]) = 2080;
      *(void **)((char *)&__p[2] + 4) = v12;
      WORD2(__p[3]) = 1024;
      *(_DWORD *)((char *)&__p[3] + 6) = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s:%d Ignore Wed Status Change, lastKnownNodeType = [%s], child Status = [%d]", (uint8_t *)__p, 0x22u);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf.__r_.__value_.__l.__data_);
      }
    }

    if (v10 == 1)
    {
      id v13 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(__p[0]) = 136315138;
        *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance(SM_extension) registerStateMachineWedEventHandlers]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Make fetch request to get neighbor MLEID", (uint8_t *)__p, 0xCu);
      }

      v14 = [WeakRetained CtrInternalClientPtr];
      std::string::basic_string[abi:ne180100]<0>(v24, "Thread:NeighborMeshLocalAddress");
      if (v14)
      {
        [v14 getProperty:v24 output:&v26];
        BOOL v15 = LODWORD(__p[0]) == 0;
        if (SHIBYTE(__p[3]) < 0) {
          operator delete(__p[1]);
        }
      }
      else
      {
        memset(__p, 0, 32);
        BOOL v15 = 1;
      }
      if (v25 < 0) {
        operator delete(v24[0]);
      }

      if (!v15)
      {
        v16 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          __82__ThreadNetworkManagerInstance_SM_extension__registerStateMachineWedEventHandlers__block_invoke_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
        }
      }
    }
  }
  if (v26) {
    (*(void (**)(uint64_t))(*(void *)v26 + 8))(v26);
  }
}

void __82__ThreadNetworkManagerInstance_SM_extension__registerStateMachineWedEventHandlers__block_invoke_24(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "ThreadConnection: kWPANTUNDEvent_ReceivedAdv setEventHandler\n ", (uint8_t *)v6, 2u);
  }

  if (WeakRetained)
  {
    id v3 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v4 = [WeakRetained lastKnownNCPState];
      unsigned int v5 = [WeakRetained modeChangeInProgress];
      v6[0] = 67109376;
      v6[1] = v4;
      __int16 v7 = 1024;
      unsigned int v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ThreadConnection: kWPANTUNDEvent_ReceivedAdv setEventHandler state = %d, modeChangeInProgress = %d\n ", (uint8_t *)v6, 0xEu);
    }

    [WeakRetained handleAdv];
  }
}

void __82__ThreadNetworkManagerInstance_SM_extension__registerStateMachineWedEventHandlers__block_invoke_26(uint64_t a1, const boost::any *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained getNCPState:0];
  unsigned int v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ThreadConnection: kWPANTUNDEvent_AttachRetryAttemptsComplete setEventHandler\n ", (uint8_t *)v9, 2u);
  }

  unsigned __int8 v5 = any_to_int(a2);
  unsigned int v6 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [WeakRetained lastKnownNCPState];
    unsigned int v8 = "full router/sleepy router";
    if (v5 == 9) {
      unsigned int v8 = "child";
    }
    v9[0] = 67109378;
    v9[1] = v7;
    __int16 v10 = 2080;
    id v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ThreadConnection: kWPANTUNDEvent_AttachRetryAttemptsComplete setEventHandler state = %d, NewNode = %s \n", (uint8_t *)v9, 0x12u);
  }

  if (WeakRetained) {
    [WeakRetained nodeChangeToChildStatus:v5];
  }
}

- (void)notifyWedUnsolictedDisconnect
{
  id v3 = objc_initWeak(&location, self);
  std::string::basic_string[abi:ne180100]<0>(&__str, "");
  std::string::basic_string[abi:ne180100]<0>(&v8, "");
  unsigned int v4 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ThreadNetworkManagerInstance(SM_extension) notifyWedUnsolictedDisconnect]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  if ([(ThreadNetworkManagerInstance *)self isWedSessionEnabled])
  {
    unsigned __int8 v5 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[ThreadNetworkManagerInstance(SM_extension) notifyWedUnsolictedDisconnect]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Daemon Crashed during active Wed Connection, Notify HK", (uint8_t *)&buf, 0xCu);
    }

    [(ThreadNetworkManagerInstance *)self setWedStatus:0];
    if (self)
    {
      [(ThreadNetworkManagerInstance *)self getPersistedWedAddr];
    }
    else
    {
      long long buf = 0uLL;
      uint64_t v12 = 0;
    }
    std::string::operator=[abi:ne180100]((uint64_t)&__str, &buf);
    if (SHIBYTE(v12) < 0)
    {
      operator delete((void *)buf);
      if (self) {
        goto LABEL_11;
      }
    }
    else if (self)
    {
LABEL_11:
      [(ThreadNetworkManagerInstance *)self getPersistedWedMleid];
LABEL_14:
      std::string::operator=[abi:ne180100]((uint64_t)&v8, &buf);
      if (SHIBYTE(v12) < 0) {
        operator delete((void *)buf);
      }
      std::string::basic_string(&v7, &__str);
      std::string::basic_string(&v6, &v8);
      [(ThreadNetworkManagerInstance *)self notifyHK:&v7 wedMleid:&v6 discReason:2];
      if (SHIBYTE(v6.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v6.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v7.__r_.__value_.__l.__data_);
      }
      [(ThreadNetworkManagerInstance *)self clearWedDevice];
      goto LABEL_21;
    }
    long long buf = 0uLL;
    uint64_t v12 = 0;
    goto LABEL_14;
  }
LABEL_21:
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }

  objc_destroyWeak(&location);
}

- (void)persistWedSession:()basic_string<char wedMleid:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  unsigned int v4 = v3;
  uint64_t RcpHostContext = RcpHostContext::GetRcpHostContext((RcpHostContext *)self);
  std::string::basic_string(&v8, (const std::string *)a3);
  std::string::basic_string(&__p, v4);
  RcpHostContext::persistWedSession(RcpHostContext, (uint64_t)&v8, (const char *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
}

- (void)persistDefaultChildNode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t RcpHostContext = (RcpHostContext *)RcpHostContext::GetRcpHostContext((RcpHostContext *)self);

  RcpHostContext::persistDefaultChildNode(RcpHostContext, v3);
}

- (BOOL)getDefaultChildNode
{
  uint64_t RcpHostContext = (RcpHostContext *)RcpHostContext::GetRcpHostContext((RcpHostContext *)self);

  return RcpHostContext::getDefaultChildNodeFlag(RcpHostContext);
}

- (void)persistGeoAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t RcpHostContext = (RcpHostContext *)RcpHostContext::GetRcpHostContext((RcpHostContext *)self);

  RcpHostContext::persistGeoAvailable(RcpHostContext, v3);
}

- (BOOL)isGeoAvailable
{
  uint64_t RcpHostContext = (RcpHostContext *)RcpHostContext::GetRcpHostContext((RcpHostContext *)self);

  return RcpHostContext::getPersistedGeoAvailableFlag(RcpHostContext);
}

- (basic_string<char,)getPersistedWedAddr
{
  RcpHostContext::GetRcpHostContext(v1);

  RcpHostContext::getPersistedWedAddr((std::string *)retstr);
  return result;
}

- (basic_string<char,)getPersistedWedMleid
{
  RcpHostContext::GetRcpHostContext(v1);

  RcpHostContext::getPersistedWedMleid((std::string *)retstr);
  return result;
}

- (BOOL)isWedSessionEnabled
{
  uint64_t RcpHostContext = (RcpHostContext *)RcpHostContext::GetRcpHostContext((RcpHostContext *)self);

  return RcpHostContext::isWedSessionEnabled(RcpHostContext);
}

- (BOOL)isStateMachineWedEnabled
{
  uint64_t RcpHostContext = (RcpHostContext *)RcpHostContext::GetRcpHostContext((RcpHostContext *)self);

  return RcpHostContext::isStateMachineEnabled(RcpHostContext);
}

- (void)nodeChangeToChildStatus:(unsigned __int8)a3
{
  int v3 = a3;
  id v5 = objc_initWeak(&location, self);
  uint64_t v40 = 0;
  v38[0] = 0;
  v38[1] = 0;
  uint64_t v39 = 0;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v7 = v6;
  if (!v6) {
    xpc_object_t v7 = xpc_null_create();
  }

  id v8 = v7;
  id v9 = v8;
  id v37 = v8;
  if (!v8 || xpc_get_type(v8) != (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t v10 = xpc_null_create();
    id v11 = v37;
    id v37 = v10;
  }
  uint64_t v12 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ThreadNetworkManagerInstance(SM_extension) nodeChangeToChildStatus:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ThreadConnection: kWPANTUNDEvent_AttachRetryAttemptsComplete setEventHandler %s", (uint8_t *)&buf, 0xCu);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "Command Error");
  int v35 = 3;
  *(_OWORD *)&v36.__r_.__value_.__l.__data_ = buf;
  v36.__r_.__value_.__r.__words[2] = v43;
  if ([(ThreadNetworkManagerInstance *)self lastKnownNCPState] == 8)
  {
    if (v3 == 9)
    {
      id v13 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        v14 = "ThreadConnection: kWPANTUNDEvent_AttachRetryAttemptsComplete Mode change successfully to NodeType:child, Notify HK";
LABEL_35:
        uint64_t v23 = v13;
        uint32_t v24 = 2;
        goto LABEL_36;
      }
    }
    else
    {
      id v13 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v22 = [(ThreadNetworkManagerInstance *)self lastKnownNCPState];
        LODWORD(buf) = 67109120;
        DWORD1(buf) = v22;
        v14 = "ThreadConnection: kWPANTUNDEvent_AttachRetryAttemptsComplete unexpected in state = %d";
        uint64_t v23 = v13;
        uint32_t v24 = 8;
LABEL_36:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&buf, v24);
        goto LABEL_51;
      }
    }
    goto LABEL_51;
  }
  [(ThreadNetworkManagerInstance *)self setModeChangeInProgress:0];
  BOOL v15 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "ThreadConnection: kWPANTUNDEvent_AttachRetryAttemptsComplete Mode change to child", (uint8_t *)&buf, 2u);
  }

  if ([(ThreadNetworkManagerInstance *)self isNonWedFWUpdateProgressInChildRole]
    || [(ThreadNetworkManagerInstance *)self isWedFWUpdateProgressInChildRole])
  {
    v16 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v17 = [(ThreadNetworkManagerInstance *)self isNonWedFWUpdateProgressInChildRole];
      unsigned int v18 = [(ThreadNetworkManagerInstance *)self isWedFWUpdateProgressInChildRole];
      LODWORD(buf) = 67109376;
      DWORD1(buf) = v17;
      WORD4(buf) = 1024;
      *(_DWORD *)((char *)&buf + 10) = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "ThreadConnection: Start FW Update: isNonWedFWUpdateProgressInChildRole [%d], isWedFWUpdateProgressInChildRole [%d]", (uint8_t *)&buf, 0xEu);
    }

    BOOL v19 = [(ThreadNetworkManagerInstance *)self isWedFWUpdateProgressInChildRole];
    uint64_t v20 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
    std::string::basic_string[abi:ne180100]<0>(__p, "Thread:EmacId");
    if (v20)
    {
      [v20 getProperty:__p output:&v40];
      BOOL v21 = buf == 0;
      if (SHIBYTE(v43) < 0) {
        operator delete(*((void **)&buf + 1));
      }
    }
    else
    {
      long long buf = 0u;
      long long v43 = 0u;
      BOOL v21 = 1;
    }
    if (v34 < 0) {
      operator delete(__p[0]);
    }

    if (!v21)
    {
      id v13 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance(SM_extension) nodeChangeToChildStatus:]();
      }
      goto LABEL_51;
    }
    boost::any_cast<std::string>((uint64_t)&v40, (std::string *)&buf);
    std::string::operator=[abi:ne180100]((uint64_t)v38, &buf);
    if (SBYTE7(v43) < 0) {
      operator delete((void *)buf);
    }
    if (v39 >= 0) {
      char v25 = v38;
    }
    else {
      char v25 = (void **)v38[0];
    }
    if ([(ThreadNetworkManagerInstance *)self startFWUpdate:v25 isWED:v19 output:&v37])
    {
      id v13 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        v14 = "ThreadConnection: Implicit Start FW Update not successful";
        goto LABEL_35;
      }
LABEL_51:
    }
  }
  else
  {
    uint64_t v26 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "ThreadConnection: kWPANTUNDEvent_AttachRetryAttemptsComplete Mode change not successful, fallback to Sleepy Router Node", (uint8_t *)&buf, 2u);
    }

    char v27 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
    std::string::basic_string[abi:ne180100]<0>(v31, "Network:NodeType");
    if (v27)
    {
      objc_msgSend(v27, "setProperty:property_val:", v31, "sleepy-router");
    }
    else
    {
      long long buf = 0u;
      long long v43 = 0u;
    }
    int v28 = *CtrXPC::Result::operator=(&v35, (uint64_t)&buf);
    if (SHIBYTE(v43) < 0) {
      operator delete(*((void **)&buf + 1));
    }
    if (v32 < 0) {
      operator delete(v31[0]);
    }

    if (v28)
    {
      id v13 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        std::string::basic_string(&v30, &v36);
        -[ThreadNetworkManagerInstance(SM_extension) nodeChangeToChildStatus:]();
      }
      goto LABEL_51;
    }
  }
  if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v36.__r_.__value_.__l.__data_);
  }
  id v29 = v37;
  id v37 = 0;

  if (SHIBYTE(v39) < 0) {
    operator delete(v38[0]);
  }
  if (v40) {
    (*(void (**)(uint64_t))(*(void *)v40 + 8))(v40);
  }

  objc_destroyWeak(&location);
}

- (void)handleRouterModeFailSafeTrigger
{
  id v3 = objc_initWeak(&location, self);
  uint64_t v24 = 0;
  std::string::basic_string[abi:ne180100]<0>(v27, "Command Error");
  int v21 = 3;
  *(_OWORD *)unsigned int v22 = *(_OWORD *)v27;
  uint64_t v23 = *(void *)&v27[16];
  unsigned int v4 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(__p, "Network:NodeType");
  if (v4) {
    [v4 getProperty:__p output:&v24];
  }
  else {
    memset(v27, 0, 32);
  }
  int v5 = *CtrXPC::Result::operator=(&v21, (uint64_t)v27);
  if ((v27[31] & 0x80000000) != 0) {
    operator delete(*(void **)&v27[8]);
  }
  if (v20 < 0) {
    operator delete(__p[0]);
  }

  if (v5)
  {
    xpc_object_t v6 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance(SM_extension) handleRouterModeFailSafeTrigger]();
    }
  }
  else
  {
    any_to_string((const boost::any *)&v24, (uint64_t)v27);
    unsigned int v7 = nl::wpantund::string_to_node_type(v27);
    if ((v27[23] & 0x80000000) != 0) {
      operator delete(*(void **)v27);
    }
    id v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      nl::wpantund::node_type_to_string(v7, (std::string *)v27);
      id v9 = v27[23] >= 0 ? v27 : *(unsigned char **)v27;
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"-[ThreadNetworkManagerInstance(SM_extension) handleRouterModeFailSafeTrigger]";
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2080;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: current node type: %s", (uint8_t *)&buf, 0x16u);
      if ((v27[23] & 0x80000000) != 0) {
        operator delete(*(void **)v27);
      }
    }

    if (v7 == 7 || v7 == 1)
    {
      [(ThreadNetworkManagerInstance *)self reset];
      xpc_object_t v10 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        nl::wpantund::node_type_to_string(v7, &buf);
        int v11 = SHIBYTE(buf.__r_.__value_.__r.__words[2]);
        std::string::size_type v12 = buf.__r_.__value_.__r.__words[0];
        id v13 = [(ThreadNetworkManagerInstance *)self defaultChildNode];
        *(void *)&v27[4] = "-[ThreadNetworkManagerInstance(SM_extension) handleRouterModeFailSafeTrigger]";
        *(_WORD *)&v27[12] = 1024;
        p_std::string buf = &buf;
        *(_DWORD *)char v27 = 136315906;
        if (v11 < 0) {
          p_std::string buf = (std::string *)v12;
        }
        *(_DWORD *)&v27[14] = 811;
        *(_WORD *)&v27[18] = 2080;
        *(void *)&v27[20] = p_buf;
        *(_WORD *)&v27[28] = 2080;
        *(void *)&v27[30] = v13;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s:%d Current Node = [%s], transition to New Node = [%s]", v27, 0x26u);
        if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(buf.__r_.__value_.__l.__data_);
        }
      }

      BOOL v15 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
      std::string::basic_string[abi:ne180100]<0>(v17, "Network:NodeType");
      v16 = [(ThreadNetworkManagerInstance *)self defaultChildNode];
      if (v15) {
        objc_msgSend(v15, "setProperty:property_val:", v17, v16);
      }
      else {
        memset(v27, 0, 32);
      }
      CtrXPC::Result::operator=(&v21, (uint64_t)v27);
      if ((v27[31] & 0x80000000) != 0) {
        operator delete(*(void **)&v27[8]);
      }
      if (v18 < 0) {
        operator delete(v17[0]);
      }
    }
  }
  if (SHIBYTE(v23) < 0) {
    operator delete(v22[0]);
  }
  if (v24) {
    (*(void (**)(uint64_t))(*(void *)v24 + 8))(v24);
  }

  objc_destroyWeak(&location);
}

- (void)handleAdv
{
  id v3 = objc_initWeak(&location, self);
  uint64_t v39 = 0;
  unsigned int v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) handleAdv]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  int v36 = 3;
  *(_OWORD *)id v37 = *(_OWORD *)buf;
  uint64_t v38 = *(void *)&buf[16];
  int v5 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(__p, "Network:NodeType");
  if (v5) {
    [v5 getProperty:__p output:&v39];
  }
  else {
    memset(buf, 0, 32);
  }
  int v6 = *CtrXPC::Result::operator=(&v36, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v35 < 0) {
    operator delete(__p[0]);
  }

  if (v6)
  {
    unsigned int v7 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance(SM_extension) handleAdv]();
    }

    goto LABEL_14;
  }
  any_to_string((const boost::any *)&v39, (uint64_t)buf);
  unsigned int v8 = nl::wpantund::string_to_node_type(buf);
  if ((buf[23] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  if (v8 != 7 && v8 != 1)
  {
    int v21 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      unsigned int v22 = [(ThreadNetworkManagerInstance *)self lastKnownNCPState];
      unsigned int v23 = [(ThreadNetworkManagerInstance *)self modeChangeInProgress];
      unsigned int v24 = [(ThreadNetworkManagerInstance *)self wedStatus];
      unsigned int v25 = [(ThreadNetworkManagerInstance *)self wedAttachRequest];
      *(_DWORD *)std::string buf = 136316418;
      *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) handleAdv]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 847;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v22;
      *(_WORD *)&buf[24] = 1024;
      *(_DWORD *)&buf[26] = v23;
      *(_WORD *)&buf[30] = 1024;
      *(_DWORD *)&buf[32] = v24;
      *(_WORD *)&buf[36] = 1024;
      LODWORD(v42) = v25;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s:%d ThreadConnection: lastKnownNCPState=[%d], modeChangeInProgress=[%d], wedStatus=[%d], wedAttachRequest=[%d]", buf, 0x2Au);
    }

    if ([(ThreadNetworkManagerInstance *)self lastKnownNCPState] != 8
      || [(ThreadNetworkManagerInstance *)self modeChangeInProgress]
      || [(ThreadNetworkManagerInstance *)self wedStatus]
      || [(ThreadNetworkManagerInstance *)self wedAttachRequest])
    {
      if (([(ThreadNetworkManagerInstance *)self wedAttachRequest]
         || [(ThreadNetworkManagerInstance *)self wedStatus] == 1)
        && ![(ThreadNetworkManagerInstance *)self modeChangeInProgress])
      {
        uint64_t v26 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)std::string buf = 136315394;
          *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) handleAdv]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 858;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s:%d ThreadConnection: Use the ADV as a hint to transition to Child Role ", buf, 0x12u);
        }

        [(ThreadNetworkManagerInstance *)self setFoundAdvFlags];
      }
      v16 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        unsigned int v27 = [(ThreadNetworkManagerInstance *)self lastKnownNCPState];
        unsigned int v28 = [(ThreadNetworkManagerInstance *)self modeChangeInProgress];
        unsigned int v29 = [(ThreadNetworkManagerInstance *)self wedStatus];
        unsigned int v30 = [(ThreadNetworkManagerInstance *)self wedAttachRequest];
        *(_DWORD *)std::string buf = 136316418;
        *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) handleAdv]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 861;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v27;
        *(_WORD *)&buf[24] = 1024;
        *(_DWORD *)&buf[26] = v28;
        *(_WORD *)&buf[30] = 1024;
        *(_DWORD *)&buf[32] = v29;
        *(_WORD *)&buf[36] = 1024;
        LODWORD(v42) = v30;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s:%d ThreadConnection: lastKnownNCPState = [%d], modeChangeInProgress = [%d], wedStatus = [%d], wedAttachRequest = [%d]", buf, 0x2Au);
      }
    }
    else
    {
      if (v8 == 8)
      {
        [(ThreadNetworkManagerInstance *)self transitionToChildNodeHelper];
        goto LABEL_14;
      }
      v16 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)std::string buf = 136315650;
        *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) handleAdv]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 852;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s:%d ThreadConnection: Ignore ADV, network Node Type:[%d]", buf, 0x18u);
      }
    }
    goto LABEL_61;
  }
  if (![(ThreadNetworkManagerInstance *)self stopPairingRequest]
    && [(ThreadNetworkManagerInstance *)self isPairing]
    || [(ThreadNetworkManagerInstance *)self numAdvDuringPairing] < 9)
  {
    [(ThreadNetworkManagerInstance *)self setFoundAdvDuringPairing:1];
    [(ThreadNetworkManagerInstance *)self setNumAdvDuringPairing:([(ThreadNetworkManagerInstance *)self numAdvDuringPairing] + 1)];
    v16 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      unsigned int v17 = [(ThreadNetworkManagerInstance *)self numAdvDuringPairing];
      unsigned int v18 = [(ThreadNetworkManagerInstance *)self stopPairingRequest];
      unsigned int v19 = [(ThreadNetworkManagerInstance *)self isPairing];
      char v20 = [(ThreadNetworkManagerInstance *)self defaultChildNode];
      *(_DWORD *)std::string buf = 136316418;
      *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) handleAdv]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 842;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v17;
      *(_WORD *)&buf[24] = 1024;
      *(_DWORD *)&buf[26] = v18;
      *(_WORD *)&buf[30] = 1024;
      *(_DWORD *)&buf[32] = v19;
      *(_WORD *)&buf[36] = 2080;
      v42 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s:%d foundAdvDuringPairing [%d], stopPairingRequest [%d], isPairing [%d], ready to transition to %s", buf, 0x2Eu);
    }
LABEL_61:

    goto LABEL_14;
  }
  [(ThreadNetworkManagerInstance *)self reset];
  id v9 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    nl::wpantund::node_type_to_string(v8, &v33);
    int v10 = SHIBYTE(v33.__r_.__value_.__r.__words[2]);
    std::string::size_type v11 = v33.__r_.__value_.__r.__words[0];
    std::string::size_type v12 = [(ThreadNetworkManagerInstance *)self defaultChildNode];
    *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) handleAdv]";
    id v13 = &v33;
    *(_DWORD *)std::string buf = 136315906;
    if (v10 < 0) {
      id v13 = (std::string *)v11;
    }
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 836;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = v13;
    *(_WORD *)&buf[28] = 2080;
    *(void *)&buf[30] = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s:%d Current Node = [%s], transition to New Node = [%s]", buf, 0x26u);
    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v33.__r_.__value_.__l.__data_);
    }
  }

  v14 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(v31, "Network:NodeType");
  BOOL v15 = [(ThreadNetworkManagerInstance *)self defaultChildNode];
  if (v14) {
    objc_msgSend(v14, "setProperty:property_val:", v31, v15);
  }
  else {
    memset(buf, 0, 32);
  }
  CtrXPC::Result::operator=(&v36, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v32 < 0) {
    operator delete(v31[0]);
  }

LABEL_14:
  if (SHIBYTE(v38) < 0) {
    operator delete(v37[0]);
  }
  if (v39) {
    (*(void (**)(uint64_t))(*(void *)v39 + 8))(v39);
  }

  objc_destroyWeak(&location);
}

- (void)notifyOnWedStatusChange:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_initWeak(&location, self);
  int v6 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ThreadNetworkManagerInstance(SM_extension) notifyOnWedStatusChange:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  std::string::basic_string[abi:ne180100]<0>(&buf, "Command Error");
  unsigned int v7 = (void *)buf;
  int v8 = SBYTE7(v45);
  if ([(ThreadNetworkManagerInstance *)self lastKnownNCPState] == 8)
  {
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    id v9 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
    std::string::basic_string[abi:ne180100]<0>(v36, "NCP:WedExtendedAddress");
    if (v9)
    {
      [v9 getProperty:v36 output:&v39];
      BOOL v10 = buf == 0;
      if (SHIBYTE(v45) < 0) {
        operator delete(*((void **)&buf + 1));
      }
    }
    else
    {
      long long buf = 0u;
      long long v45 = 0u;
      BOOL v10 = 1;
    }
    if (v37 < 0) {
      operator delete(v36[0]);
    }

    if (v10)
    {
      std::string::size_type v11 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
      std::string::basic_string[abi:ne180100]<0>(__p, "NCP:WedMleId");
      if (v11)
      {
        [v11 getProperty:__p output:&v38];
        BOOL v12 = buf == 0;
        if (SHIBYTE(v45) < 0) {
          operator delete(*((void **)&buf + 1));
        }
      }
      else
      {
        long long buf = 0u;
        long long v45 = 0u;
        BOOL v12 = 1;
      }
      if (v35 < 0) {
        operator delete(__p[0]);
      }

      if (v12)
      {
        std::string::basic_string[abi:ne180100]<0>(&buf, "");
        std::string::basic_string[abi:ne180100]<0>(&__str, "");
        if (v3)
        {
          if (v3 == 1)
          {
            [(ThreadNetworkManagerInstance *)self setWedStatus:1];
            any_to_string((const boost::any *)&v39, (uint64_t)v43);
            std::string::operator=[abi:ne180100]((uint64_t)&buf, (long long *)v43);
            if ((char)v43[23] < 0) {
              operator delete(*(void **)v43);
            }
            any_to_string((const boost::any *)&v38, (uint64_t)v43);
            std::string::operator=[abi:ne180100]((uint64_t)&__str, (long long *)v43);
            if ((char)v43[23] < 0) {
              operator delete(*(void **)v43);
            }
            v14 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              p_long long buf = &buf;
              if (SBYTE7(v45) < 0) {
                p_long long buf = (long long *)buf;
              }
              p_str = &__str;
              if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
              }
              *(_DWORD *)long long v43 = 136315394;
              *(void *)&v43[4] = p_buf;
              *(_WORD *)&v43[12] = 2080;
              *(void *)&v43[14] = p_str;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "WED added, wedAddr = %s, wedMleid = %s\n", v43, 0x16u);
            }

            std::string::basic_string(&v32, (const std::string *)&buf);
            std::string::basic_string(&v31, &__str);
            [(ThreadNetworkManagerInstance *)self persistWedSession:&v32 wedMleid:&v31];
            if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v31.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v32.__r_.__value_.__l.__data_);
            }
LABEL_71:
            if ([(ThreadNetworkManagerInstance *)self wakeOnDeviceChangeNotify])
            {
              unsigned int v22 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)long long v43 = 0;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Dispatch semaphoreWakeOnDeviceChange\n", v43, 2u);
              }

              unsigned int v23 = [(ThreadNetworkManagerInstance *)self semaphoreWakeOnDeviceChange];
              dispatch_semaphore_signal(v23);

              if (v3 > 1) {
                goto LABEL_89;
              }
              std::string::basic_string(&v30, (const std::string *)&buf);
              [(ThreadNetworkManagerInstance *)self eraseKeyFromProvideEmacTracker:&v30];
              if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v30.__r_.__value_.__l.__data_);
              }
              std::string::basic_string(&v29, (const std::string *)&buf);
              std::string::basic_string(&v28, &__str);
              [(ThreadNetworkManagerInstance *)self notifyHK:&v29 wedMleid:&v28 discReason:0];
              if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v28.__r_.__value_.__l.__data_);
              }
              if ((SHIBYTE(v29.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
                goto LABEL_89;
              }
              unsigned int v24 = &v29;
            }
            else
            {
              if ([(ThreadNetworkManagerInstance *)self wedStatus]) {
                goto LABEL_89;
              }
              unsigned int v25 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long v43 = 136315138;
                *(void *)&v43[4] = "-[ThreadNetworkManagerInstance(SM_extension) notifyOnWedStatusChange:]";
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s Link Loss during active Wed Connection, Notify HK", v43, 0xCu);
              }

              std::string::basic_string(&v27, (const std::string *)&buf);
              std::string::basic_string(&v26, &__str);
              [(ThreadNetworkManagerInstance *)self notifyHK:&v27 wedMleid:&v26 discReason:1];
              if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v26.__r_.__value_.__l.__data_);
              }
              if ((SHIBYTE(v27.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
                goto LABEL_89;
              }
              unsigned int v24 = &v27;
            }
            operator delete(v24->__r_.__value_.__l.__data_);
LABEL_89:
            if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__str.__r_.__value_.__l.__data_);
            }
            if (SBYTE7(v45) < 0) {
              operator delete((void *)buf);
            }
            goto LABEL_39;
          }
          [(ThreadNetworkManagerInstance *)self setWedStatus:v3];
          unsigned int v17 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            nl::wpantund::ncp_wed_status_to_string(v3, (char *)v43);
            unsigned int v18 = (v43[23] & 0x80u) == 0 ? v43 : *(uint8_t **)v43;
            *(_DWORD *)unsigned int v41 = 136315138;
            v42 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "WED Connection Failure = %s\n", v41, 0xCu);
            if ((char)v43[23] < 0) {
              operator delete(*(void **)v43);
            }
          }
        }
        else
        {
          [(ThreadNetworkManagerInstance *)self setWedStatus:0];
          if (self) {
            [(ThreadNetworkManagerInstance *)self getPersistedWedAddr];
          }
          else {
            memset(v43, 0, 24);
          }
          std::string::operator=[abi:ne180100]((uint64_t)&buf, (long long *)v43);
          if ((char)v43[23] < 0) {
            operator delete(*(void **)v43);
          }
          if (self) {
            [(ThreadNetworkManagerInstance *)self getPersistedWedMleid];
          }
          else {
            memset(v43, 0, 24);
          }
          std::string::operator=[abi:ne180100]((uint64_t)&__str, (long long *)v43);
          if ((char)v43[23] < 0) {
            operator delete(*(void **)v43);
          }
          unsigned int v19 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            char v20 = &buf;
            if (SBYTE7(v45) < 0) {
              char v20 = (long long *)buf;
            }
            int v21 = &__str;
            if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
              int v21 = (std::string *)__str.__r_.__value_.__r.__words[0];
            }
            *(_DWORD *)long long v43 = 136315394;
            *(void *)&v43[4] = v20;
            *(_WORD *)&v43[12] = 2080;
            *(void *)&v43[14] = v21;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "WED removed, wedAddr = %s, wedMleid = %s\n", v43, 0x16u);
          }

          [(ThreadNetworkManagerInstance *)self clearWedDevice];
        }
        [(ThreadNetworkManagerInstance *)self startQuickDiscoveryScanInSRMode];
        goto LABEL_71;
      }
      id v13 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance(SM_extension) notifyOnWedStatusChange:]();
      }
    }
    else
    {
      id v13 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance(SM_extension) notifyOnWedStatusChange:]();
      }
    }

LABEL_39:
    if (v38) {
      (*(void (**)(uint64_t))(*(void *)v38 + 8))(v38);
    }
    if (v39) {
      (*(void (**)(uint64_t))(*(void *)v39 + 8))(v39);
    }
  }
  if (v8 < 0) {
    operator delete(v7);
  }

  objc_destroyWeak(&location);
}

- (void)notifyOnNodeStatusChange
{
  id v3 = objc_initWeak(&location, self);
  uint64_t v23 = 0;
  unsigned int v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    unsigned int v5 = [(ThreadNetworkManagerInstance *)self lastKnownNodeType];
    *(_DWORD *)long long buf = 136315394;
    *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) notifyOnNodeStatusChange]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s, lastKnownNodeType = [%d]", buf, 0x12u);
  }

  if (![(ThreadNetworkManagerInstance *)self isStateMachineWedEnabled])
  {
    unsigned int v7 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) notifyOnNodeStatusChange]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 940;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "ThreadConnection: %s:%d State Machine Disabled notifyOnNodeStatusChange ignored", buf, 0x12u);
    }
    goto LABEL_35;
  }
  if (![(ThreadNetworkManagerInstance *)self lastKnownNodeType])
  {
    int v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "ThreadConnection: Mode Uknown, Notify HK \n", buf, 2u);
    }

    [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
    objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100]<0>(&v22, "ThreadNetworkConnectionStatus");
    operator new();
  }
  if ([(ThreadNetworkManagerInstance *)self lastKnownNodeType] == 1
    || [(ThreadNetworkManagerInstance *)self lastKnownNodeType] == 7)
  {
    [(ThreadNetworkManagerInstance *)self setModeChangeInProgress:0];
    int v6 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ThreadConnection: Mode Full Router, Notify HK \n", buf, 2u);
    }

    [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
    objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100]<0>(&v21, "ThreadNetworkConnectionStatus");
    operator new();
  }
  if ([(ThreadNetworkManagerInstance *)self lastKnownNodeType] == 8)
  {
    [(ThreadNetworkManagerInstance *)self setModeChangeInProgress:0];
    if ([(ThreadNetworkManagerInstance *)self networkNodeTypeChangeNotify])
    {
      id v13 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ThreadConnection: Dispatch _semaphoreNetworkNodeTypeChange \n", buf, 2u);
      }

      v14 = [(ThreadNetworkManagerInstance *)self semaphoreNetworkNodeTypeChange];
      dispatch_semaphore_signal(v14);
    }
    BOOL v15 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "ThreadConnection: Mode Sleepy Router, Notify HK \n", buf, 2u);
    }

    [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
    objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100]<0>(&v20, "ThreadNetworkConnectionStatus");
    operator new();
  }
  if ([(ThreadNetworkManagerInstance *)self lastKnownNodeType] == 3
    || [(ThreadNetworkManagerInstance *)self lastKnownNodeType] == 4)
  {
    [(ThreadNetworkManagerInstance *)self setModeChangeInProgress:0];
    [(ThreadNetworkManagerInstance *)self resetFoundAdvFlags];
    v16 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "ThreadConnection: Mode SED/SSED, Notify HK \n", buf, 2u);
    }

    [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
    objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100]<0>(&v19, "ThreadNetworkConnectionStatus");
    operator new();
  }
  if ([(ThreadNetworkManagerInstance *)self lastKnownNodeType] == 8)
  {
    if ([(ThreadNetworkManagerInstance *)self isGeoAvailable])
    {
      [(ThreadNetworkManagerInstance *)self startPeriodicDiscoveryScanInSRMode];
    }
    else
    {
      id v9 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ThreadConnection: Not Starting SR Discovery Scan as GEO is off in Thread Start \n", buf, 2u);
      }
    }
  }
  else
  {
    [(ThreadNetworkManagerInstance *)self stopPeriodicDiscoveryScanInSRMode];
  }
  if ([(ThreadNetworkManagerInstance *)self lastKnownNodeType] == 3
    || [(ThreadNetworkManagerInstance *)self lastKnownNodeType] == 4)
  {
    BOOL v10 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ThreadConnection: Mode SED/SSED, fetch Parent MLEID \n", buf, 2u);
    }

    std::string::size_type v11 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
    std::string::basic_string[abi:ne180100]<0>(__p, "Thread:NeighborMeshLocalAddress");
    if (v11)
    {
      [v11 getProperty:__p output:&v23];
      BOOL v12 = *(_DWORD *)buf == 0;
      if ((char)buf[31] < 0) {
        operator delete(*(void **)&buf[8]);
      }
    }
    else
    {
      memset(buf, 0, 32);
      BOOL v12 = 1;
    }
    if (v18 < 0) {
      operator delete(__p[0]);
    }

    if (!v12)
    {
      unsigned int v7 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance(SM_extension) notifyOnNodeStatusChange]();
      }
LABEL_35:
    }
  }
  if (v23) {
    (*(void (**)(uint64_t))(*(void *)v23 + 8))(v23);
  }

  objc_destroyWeak(&location);
}

- (void)notifyHK:()basic_string<char wedMleid:()std:(std::allocator<char>> *)a3 :char_traits<char> discReason:
{
  id v3 = objc_initWeak(&location, self);
  v5[0] = 0;
  v5[1] = 0;
  unsigned int v4 = v5;
  std::string::basic_string[abi:ne180100]<0>(buf, "mleid");
  std::map<std::string,boost::any>::operator[](&v4, buf);
  boost::any::operator=<std::string &>();
}

- (void)reset
{
  id v3 = objc_initWeak(&location, self);
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  [(ThreadNetworkManagerInstance *)self setSemaphoreNetworkNodeTypeChange:v4];

  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  [(ThreadNetworkManagerInstance *)self setSemaphoreWakeOnDeviceChange:v5];

  [(ThreadNetworkManagerInstance *)self setWedAttachRequest:0];
  [(ThreadNetworkManagerInstance *)self setStopPairingRequest:0];
  [(ThreadNetworkManagerInstance *)self setFoundAdvDuringPairing:0];
  [(ThreadNetworkManagerInstance *)self setNumAdvDuringPairing:0];
  if ([(ThreadNetworkManagerInstance *)self wedStatus] == 2)
  {
    int v6 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      id v9 = "-[ThreadNetworkManagerInstance(SM_extension) reset]";
      __int16 v10 = 1024;
      int v11 = 1038;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s:%d Reset WedStatus to allow ADV handling", buf, 0x12u);
    }

    [(ThreadNetworkManagerInstance *)self setWedStatus:0];
  }

  objc_destroyWeak(&location);
}

- (void)clearWedDevice
{
  id v3 = objc_initWeak(&location, self);
  std::string::basic_string[abi:ne180100]<0>(v6, "");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  [(ThreadNetworkManagerInstance *)self persistWedSession:v6 wedMleid:__p];
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  if (v7 < 0) {
    operator delete(v6[0]);
  }

  objc_destroyWeak(&location);
}

- (BOOL)getPairingStatus
{
  id v3 = objc_initWeak(&location, self);
  BOOL v4 = [(ThreadNetworkManagerInstance *)self isPairing];

  objc_destroyWeak(&location);
  return v4;
}

- (void)resetPairingStatus
{
  id v3 = objc_initWeak(&location, self);
  [(ThreadNetworkManagerInstance *)self setIsPairing:0];

  objc_destroyWeak(&location);
}

- (void)setFoundAdvFlags
{
}

- (void)resetFoundAdvFlags
{
  id v3 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315650;
    char v5 = "-[ThreadNetworkManagerInstance(SM_extension) resetFoundAdvFlags]";
    __int16 v6 = 1024;
    int v7 = 1074;
    __int16 v8 = 1024;
    unsigned int v9 = [(ThreadNetworkManagerInstance *)self foundAdvDuringWedConnectionAttempt];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d Reset ADV flags [%d]", (uint8_t *)&v4, 0x18u);
  }

  [(ThreadNetworkManagerInstance *)self setFoundAdvDuringWedConnectionAttempt:0];
}

- (void)transitionToChildNodeHelper
{
  int v11 = 0;
  memset(&v12, 0, sizeof(v12));
  [(ThreadNetworkManagerInstance *)self resetFoundAdvFlags];
  [(ThreadNetworkManagerInstance *)self setModeChangeInProgress:1];
  id v3 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) transitionToChildNodeHelper]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1085;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = [(ThreadNetworkManagerInstance *)self defaultChildNode];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d ThreadConnection: kWPANTUNDEvent_ReceivedAdv setEventHandler : Received ADV , transition to Child Node = [%s]\n", buf, 0x1Cu);
  }

  int v4 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(__p, "Network:NodeType");
  char v5 = [(ThreadNetworkManagerInstance *)self defaultChildNode];
  if (v4) {
    objc_msgSend(v4, "setProperty:property_val:", __p, v5);
  }
  else {
    memset(buf, 0, 32);
  }
  int v6 = *CtrXPC::Result::operator=(&v11, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v10 < 0) {
    operator delete(__p[0]);
  }

  if (v6)
  {
    int v7 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string(&v8, &v12);
      -[ThreadNetworkManagerInstance(SM_extension) transitionToChildNodeHelper]();
    }
  }
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
}

- (void)transitionToChildNode:(dict *)a3
{
  char v5 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"-[ThreadNetworkManagerInstance(SM_extension) transitionToChildNode:]";
    WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 1097;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d Check if possible to transition to Child role", (uint8_t *)&buf, 0x12u);
  }

  if ([(ThreadNetworkManagerInstance *)self foundAdvDuringWedConnectionAttempt]
    && [(ThreadNetworkManagerInstance *)self wedStatus] != 1)
  {
    std::to_string(&buf, 3000);
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_std::string buf = &buf;
    }
    else {
      p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    }
    xpc_object_t v8 = xpc_string_create((const char *)p_buf);
    id v12 = v8;
    if (!v8) {
      id v12 = xpc_null_create();
    }

    v11[0] = a3;
    v11[1] = "delayWedConnectionRetryRequest";
    xpc::dict::object_proxy::operator=((uint64_t)v11, &v12, &v13);
    id v9 = v13;
    id v13 = 0;

    id v10 = v12;
    id v12 = 0;

    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    [(ThreadNetworkManagerInstance *)self transitionToChildNodeHelper];
  }
  else
  {
    int v6 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)"-[ThreadNetworkManagerInstance(SM_extension) transitionToChildNode:]";
      WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
      *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = 1103;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s:%d Not possible to transition to Child role as no ADV found/or Wed connected", (uint8_t *)&buf, 0x12u);
    }
  }
}

- (void)clearProvideEmacTracker
{
  [(ThreadNetworkManagerInstance *)self printProvideEmacTracker];
  v2 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[ThreadNetworkManagerInstance(SM_extension) clearProvideEmacTracker](v2);
  }

  std::__tree<std::__value_type<std::string,trackerInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,trackerInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,trackerInfo>>>::clear((uint64_t)&ProvideEmacTracker);
}

- (void)printProvideEmacTracker
{
  for (uint64_t i = ProvideEmacTracker;
        (uint64_t *)i != &qword_1004B62B0;
        std::__tree_const_iterator<std::__value_type<std::string,boost::any>,std::__tree_node<std::__value_type<std::string,boost::any>,void *> *,long>::operator++[abi:ne180100]((uint64_t)&i))
  {
    v2 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      id v3 = (void *)(i + 32);
      if (*(char *)(i + 55) < 0) {
        id v3 = (void *)*v3;
      }
      int v4 = *(_DWORD *)(i + 56);
      *(_DWORD *)std::string buf = 136315650;
      int v7 = "-[ThreadNetworkManagerInstance(SM_extension) printProvideEmacTracker]";
      __int16 v8 = 2080;
      id v9 = v3;
      __int16 v10 = 1024;
      int v11 = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s: key=[%s], value=[%d]", buf, 0x1Cu);
    }
  }
}

- (void)eraseKeyFromProvideEmacTracker:()basic_string<char
{
  stringToLowercase((std::string *)a3, &__p);
  if ((uint64_t *)std::__tree<std::__value_type<std::string,trackerInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,trackerInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,trackerInfo>>>::find<std::string>((uint64_t)&ProvideEmacTracker, (const void **)&__p.__r_.__value_.__l.__data_) == &qword_1004B62B0)
  {
    int v6 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      nl::wpantund::ncp_wed_status_to_string([(ThreadNetworkManagerInstance *)self wedStatus], v8);
      -[ThreadNetworkManagerInstance(SM_extension) eraseKeyFromProvideEmacTracker:](v8, buf, (uint64_t)p_p, v6);
    }
  }
  else
  {
    int v4 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      char v5 = &__p;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        char v5 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string buf = 136315394;
      int v11 = "-[ThreadNetworkManagerInstance(SM_extension) eraseKeyFromProvideEmacTracker:]";
      __int16 v12 = 2080;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: erase wedAddr=[%s]", buf, 0x16u);
    }

    std::__tree<std::__value_type<std::string,trackerInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,trackerInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,trackerInfo>>>::__erase_unique<std::string>((uint64_t)&ProvideEmacTracker, (const void **)&__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (BOOL)getFWUpdateStatus
{
  id v3 = objc_initWeak(&location, self);
  BOOL v4 = [(ThreadNetworkManagerInstance *)self isFWUpdateInProgress];

  objc_destroyWeak(&location);
  return v4;
}

- (void)resetFWUpdateStatus
{
  id v3 = objc_initWeak(&location, self);
  [(ThreadNetworkManagerInstance *)self setIsFWUpdateInProgress:0];

  objc_destroyWeak(&location);
}

- (void)disconnectActiveWedConnection
{
  id v3 = objc_initWeak(&location, self);
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v5 = v4;
  if (!v4) {
    xpc_object_t v5 = xpc_null_create();
  }

  id v6 = v5;
  int v7 = v6;
  id v10 = v6;
  if (v6)
  {
    if (xpc_get_type(v6) != (xpc_type_t)&_xpc_type_dictionary)
    {
      id v10 = xpc_null_create();
    }
  }
  else
  {
    id v10 = xpc_null_create();
  }

  if ([(ThreadNetworkManagerInstance *)self lastKnownNCPState] == 8
    && [(ThreadNetworkManagerInstance *)self lastKnownNodeType] == 8
    && [(ThreadNetworkManagerInstance *)self wedStatus] == 1)
  {
    __int16 v8 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::string buf = 136315394;
      id v13 = "-[ThreadNetworkManagerInstance(SM_extension) disconnectActiveWedConnection]";
      __int16 v14 = 1024;
      int v15 = 1168;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:%d Thread session Close: Disconnect active Wed Connection ", buf, 0x12u);
    }

    [(ThreadNetworkManagerInstance *)self provideExtendedMACAddress:0 output:&v10];
  }
  id v9 = v10;
  id v10 = 0;

  objc_destroyWeak(&location);
}

- (BOOL)checkIfDuplicateWedAttachRequest:(const char *)a3
{
  id v5 = objc_initWeak(&location, self);
  std::string::basic_string[abi:ne180100]<0>(&v19, (char *)a3);
  uint64_t v18 = 0;
  id v6 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(__p, "NCP:WedExtendedAddress");
  if (v6)
  {
    [v6 getProperty:__p output:&v18];
    BOOL v7 = *(_DWORD *)buf == 0;
    if ((char)buf[31] < 0) {
      operator delete(*(void **)&buf[8]);
    }
  }
  else
  {
    memset(buf, 0, 32);
    BOOL v7 = 1;
  }
  if (v17 < 0) {
    operator delete(__p[0]);
  }

  if (v7)
  {
    any_to_string((const boost::any *)&v18, (uint64_t)&v15);
    unsigned int v8 = stringEqualCaseInsensitive(&v15, &v19);
    if (v8)
    {
      id v9 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      id v10 = &v15;
      if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        id v10 = (std::string *)v15.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) checkIfDuplicateWedAttachRequest:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1188;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = a3;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = v10;
      int v11 = "%s:%d Duplicate wed attach request found, input extendedMACAddress : %s, stored MAC addr :%s";
    }
    else
    {
      id v9 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      id v13 = &v15;
      if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        id v13 = (std::string *)v15.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) checkIfDuplicateWedAttachRequest:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1193;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = a3;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = v13;
      int v11 = "%s:%d Not a Duplicate wed attach request, input extendedMACAddress : %s, stored MAC addr :%s";
    }
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 0x26u);
LABEL_21:

    if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v15.__r_.__value_.__l.__data_);
    }
    goto LABEL_23;
  }
  __int16 v12 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[ThreadNetworkManagerInstance(SM_extension) notifyOnWedStatusChange:]();
  }

  LOBYTE(v8) = 0;
LABEL_23:
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  }
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v19.__r_.__value_.__l.__data_);
  }

  objc_destroyWeak(&location);
  return v8;
}

- (void)UpdateOutputWithBackOffTimerValue:(const char *)a3 output:(dict *)a4
{
  id v7 = objc_initWeak(&location, self);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)a3);
  stringToLowercase((std::string *)__p, &v61);
  if (SBYTE3(v67) < 0) {
    operator delete(*(void **)__p);
  }
  if (![(ThreadNetworkManagerInstance *)self isPairing])
  {
    v14.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_ / 1000;
    if ((uint64_t *)std::__tree<std::__value_type<std::string,trackerInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,trackerInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,trackerInfo>>>::find<std::string>((uint64_t)&ProvideEmacTracker, (const void **)&v61.__r_.__value_.__l.__data_) == &qword_1004B62B0)
    {
      *(_DWORD *)std::map<std::string,trackerInfo>::operator[]((uint64_t **)&ProvideEmacTracker, &v61) = 1;
      std::map<std::string,trackerInfo>::operator[]((uint64_t **)&ProvideEmacTracker, &v61)[1] = (void *)v14.__d_.__rep_;
      std::to_string((std::string *)__p, 500);
      if (SBYTE3(v67) >= 0) {
        uint64_t v22 = __p;
      }
      else {
        uint64_t v22 = *(const char **)__p;
      }
      xpc_object_t v23 = xpc_string_create(v22);
      id v47 = v23;
      if (!v23) {
        id v47 = xpc_null_create();
      }

      int v59 = a4;
      std::string v60 = "delayWedConnectionRetryRequest";
      xpc::dict::object_proxy::operator=((uint64_t)&v59, &v47, &v48);
      id v24 = v48;
      id v48 = 0;

      id v25 = v47;
      id v47 = 0;

      if (SBYTE3(v67) < 0) {
        operator delete(*(void **)__p);
      }
      goto LABEL_60;
    }
    std::string v15 = std::map<std::string,trackerInfo>::operator[]((uint64_t **)&ProvideEmacTracker, &v61);
    if (*(_DWORD *)v15 == -1)
    {
      __break(0x5500u);
    }
    else
    {
      ++*(_DWORD *)v15;
      v16 = std::map<std::string,trackerInfo>::operator[]((uint64_t **)&ProvideEmacTracker, &v61)[1];
      std::map<std::string,trackerInfo>::operator[]((uint64_t **)&ProvideEmacTracker, &v61)[1] = (void *)v14.__d_.__rep_;
      unint64_t v17 = v14.__d_.__rep_ - (void)v16;
      if (v14.__d_.__rep_ >= (unint64_t)v16)
      {
        if (v17 >= 0x493E1)
        {
          *(_DWORD *)std::map<std::string,trackerInfo>::operator[]((uint64_t **)&ProvideEmacTracker, &v61) = 1;
          std::to_string((std::string *)__p, 500);
          if (SBYTE3(v67) >= 0) {
            uint64_t v18 = __p;
          }
          else {
            uint64_t v18 = *(const char **)__p;
          }
          xpc_object_t v19 = xpc_string_create(v18);
          id v55 = v19;
          if (!v19)
          {
            id v55 = xpc_null_create();
          }
          int v59 = a4;
          std::string v60 = "delayWedConnectionRetryRequest";
          xpc::dict::object_proxy::operator=((uint64_t)&v59, &v55, &v56);
          id v20 = v56;
          id v56 = 0;

          id v21 = v55;
          id v55 = 0;

LABEL_52:
          if (SBYTE3(v67) < 0) {
            operator delete(*(void **)__p);
          }
          uint64_t v39 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              uint64_t v40 = &v61;
            }
            else {
              uint64_t v40 = (std::string *)v61.__r_.__value_.__r.__words[0];
            }
            int v41 = *(_DWORD *)std::map<std::string,trackerInfo>::operator[]((uint64_t **)&ProvideEmacTracker, &v61);
            int v59 = a4;
            std::string v60 = "delayWedConnectionRetryRequest";
            v42 = xpc::dict::object_proxy::operator*((uint64_t)&v59);
            *(_DWORD *)std::string __p = 136316418;
            *(void *)&__p[4] = "-[ThreadNetworkManagerInstance(SM_extension) UpdateOutputWithBackOffTimerValue:output:]";
            __int16 v64 = 1024;
            int v65 = 1246;
            __int16 v66 = 2080;
            v67 = v40;
            __int16 v68 = 1024;
            int v69 = v41;
            __int16 v70 = 2112;
            id v71 = v42;
            __int16 v72 = 2048;
            unint64_t v73 = v17 / 0x3E8;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%s:%d: ProvideEmacTracker[%s] = %d, output[DELAY_WED_CONNECTION_RETRY_REQUEST_KEY] = %@, diff_sec(%llu)", __p, 0x36u);
          }
LABEL_60:
          long long v43 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              xpc_object_t v44 = &v61;
            }
            else {
              xpc_object_t v44 = (std::string *)v61.__r_.__value_.__r.__words[0];
            }
            int v45 = *(_DWORD *)std::map<std::string,trackerInfo>::operator[]((uint64_t **)&ProvideEmacTracker, &v61);
            int v59 = a4;
            std::string v60 = "delayWedConnectionRetryRequest";
            size_t v46 = xpc::dict::object_proxy::operator*((uint64_t)&v59);
            *(_DWORD *)std::string __p = 136316162;
            *(void *)&__p[4] = "-[ThreadNetworkManagerInstance(SM_extension) UpdateOutputWithBackOffTimerValue:output:]";
            __int16 v64 = 1024;
            int v65 = 1259;
            __int16 v66 = 2080;
            v67 = v44;
            __int16 v68 = 1024;
            int v69 = v45;
            __int16 v70 = 2112;
            id v71 = v46;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%s:%d ProvideEmacTracker[%s] = %d, output[DELAY_WED_CONNECTION_RETRY_REQUEST_KEY] = %@", __p, 0x2Cu);
          }
          goto LABEL_66;
        }
        if (*(_DWORD *)std::map<std::string,trackerInfo>::operator[]((uint64_t **)&ProvideEmacTracker, &v61) <= 2u)
        {
          std::to_string((std::string *)__p, 500);
          if (SBYTE3(v67) >= 0) {
            std::string v26 = __p;
          }
          else {
            std::string v26 = *(const char **)__p;
          }
          xpc_object_t v27 = xpc_string_create(v26);
          id v53 = v27;
          if (!v27)
          {
            id v53 = xpc_null_create();
          }
          int v59 = a4;
          std::string v60 = "delayWedConnectionRetryRequest";
          xpc::dict::object_proxy::operator=((uint64_t)&v59, &v53, &v54);
          id v28 = v54;
          id v54 = 0;

          id v29 = v53;
          id v53 = 0;

          goto LABEL_52;
        }
        if (*(_DWORD *)std::map<std::string,trackerInfo>::operator[]((uint64_t **)&ProvideEmacTracker, &v61) < 3u
          || *(_DWORD *)std::map<std::string,trackerInfo>::operator[]((uint64_t **)&ProvideEmacTracker, &v61) > 0x14u)
        {
          std::to_string((std::string *)__p, 10000);
          if (SBYTE3(v67) >= 0) {
            char v35 = __p;
          }
          else {
            char v35 = *(const char **)__p;
          }
          xpc_object_t v36 = xpc_string_create(v35);
          id v49 = v36;
          if (!v36)
          {
            id v49 = xpc_null_create();
          }
          int v59 = a4;
          std::string v60 = "delayWedConnectionRetryRequest";
          xpc::dict::object_proxy::operator=((uint64_t)&v59, &v49, &v50);
          id v37 = v50;
          id v50 = 0;

          id v38 = v49;
          id v49 = 0;

          goto LABEL_52;
        }
        uint64_t v30 = 500
            * *(unsigned int *)std::map<std::string,trackerInfo>::operator[]((uint64_t **)&ProvideEmacTracker, &v61);
        if ((v30 & 0xFFFFFFFF00000000) == 0)
        {
          std::to_string((std::string *)__p, v30);
          if (SBYTE3(v67) >= 0) {
            std::string v31 = __p;
          }
          else {
            std::string v31 = *(const char **)__p;
          }
          xpc_object_t v32 = xpc_string_create(v31);
          id v51 = v32;
          if (!v32)
          {
            id v51 = xpc_null_create();
          }
          int v59 = a4;
          std::string v60 = "delayWedConnectionRetryRequest";
          xpc::dict::object_proxy::operator=((uint64_t)&v59, &v51, &v52);
          id v33 = v52;
          id v52 = 0;

          id v34 = v51;
          id v51 = 0;

          goto LABEL_52;
        }
LABEL_71:
        __break(0x550Cu);
        return;
      }
    }
    __break(0x5515u);
    goto LABEL_71;
  }
  unsigned int v8 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v59 = a4;
    std::string v60 = "delayWedConnectionRetryRequest";
    xpc::dict::object_proxy::operator*((uint64_t)&v59);
    id v9 = (std::string *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)std::string __p = 136315650;
    *(void *)&__p[4] = "-[ThreadNetworkManagerInstance(SM_extension) UpdateOutputWithBackOffTimerValue:output:]";
    __int16 v64 = 1024;
    int v65 = 1209;
    __int16 v66 = 2112;
    v67 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:%d PairingInProgress output[DELAY_WED_CONNECTION_RETRY_REQUEST_KEY] = %@", __p, 0x1Cu);
  }
  std::to_string((std::string *)__p, 500);
  if (SBYTE3(v67) >= 0) {
    id v10 = __p;
  }
  else {
    id v10 = *(const char **)__p;
  }
  xpc_object_t v11 = xpc_string_create(v10);
  id v57 = v11;
  if (!v11) {
    id v57 = xpc_null_create();
  }

  int v59 = a4;
  std::string v60 = "delayWedConnectionRetryRequest";
  xpc::dict::object_proxy::operator=((uint64_t)&v59, &v57, &v58);
  id v12 = v58;
  id v58 = 0;

  id v13 = v57;
  id v57 = 0;

  if (SBYTE3(v67) < 0) {
    operator delete(*(void **)__p);
  }
LABEL_66:
  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v61.__r_.__value_.__l.__data_);
  }

  objc_destroyWeak(&location);
}

- (int)provideExtendedMACAddress:(const char *)a3 output:(dict *)a4
{
  id v7 = objc_initWeak(&location, self);
  [(ThreadNetworkManagerInstance *)self reset];
  [(ThreadNetworkManagerInstance *)self getNCPState:0];
  unsigned int v8 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1273;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:%d: Entered", buf, 0x12u);
  }

  if ([(ThreadNetworkManagerInstance *)self lastKnownNCPState] == 4
    || [(ThreadNetworkManagerInstance *)self lastKnownNodeType] == 1
    || [(ThreadNetworkManagerInstance *)self lastKnownNodeType] == 7)
  {
    id v9 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      nl::wpantund::ncp_state_to_string((char *)[(ThreadNetworkManagerInstance *)self lastKnownNCPState], (uint64_t)&v124);
      int v13 = v125.__r_.__value_.__s.__data_[15];
      std::chrono::system_clock::time_point v14 = (void **)v124;
      unsigned int v15 = [(ThreadNetworkManagerInstance *)self lastKnownNodeType];
      v16 = &v124;
      *(_DWORD *)std::string buf = 136316162;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:]";
      if (v13 < 0) {
        v16 = v14;
      }
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1278;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v16;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v15;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = 1;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s:%d Cmd received in state=[%s], Node=[%d], Error=[%d]", buf, 0x28u);
      if (v125.__r_.__value_.__s.__data_[15] < 0) {
        operator delete(v124);
      }
    }

    if ([(ThreadNetworkManagerInstance *)self lastKnownNodeType] == 1
      || [(ThreadNetworkManagerInstance *)self lastKnownNodeType] == 7)
    {
      [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
      objc_claimAutoreleasedReturnValue();
      std::string::basic_string[abi:ne180100]<0>(&__p, "ThreadNetworkConnectionStatus");
      operator new();
    }
    goto LABEL_10;
  }
  if ([(ThreadNetworkManagerInstance *)self lastKnownNodeType] == 4
    || [(ThreadNetworkManagerInstance *)self lastKnownNodeType] == 3)
  {
    id v12 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v28 = &v124;
      nl::wpantund::ncp_state_to_string((char *)[(ThreadNetworkManagerInstance *)self lastKnownNCPState], (uint64_t)&v124);
      if (v125.__r_.__value_.__s.__data_[15] < 0) {
        id v28 = v124;
      }
      nl::wpantund::node_type_to_string([(ThreadNetworkManagerInstance *)self lastKnownNodeType], &v132);
      if ((v132.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        id v29 = &v132;
      }
      else {
        id v29 = (std::string *)v132.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string buf = 136316162;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1289;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v28;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = v29;
      *(_WORD *)&unsigned char buf[38] = 1024;
      *(_DWORD *)&uint8_t buf[40] = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s:%d Cmd received in state=[%s], Node=[%s], no-op=[%d]", buf, 0x2Cu);
      if (SHIBYTE(v132.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v132.__r_.__value_.__l.__data_);
      }
      if (v125.__r_.__value_.__s.__data_[15] < 0) {
        operator delete(v124);
      }
    }

    [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
    objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100]<0>(&v128, "ThreadNetworkConnectionStatus");
    operator new();
  }
  unint64_t v17 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (![(ThreadNetworkManagerInstance *)self isStateMachineWedEnabled])
  {
    uint64_t v22 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      nl::wpantund::ncp_state_to_string((char *)[(ThreadNetworkManagerInstance *)self lastKnownNCPState], (uint64_t)&v124);
      [(ThreadNetworkManagerInstance(SM_extension) *)(char *)&v124 provideExtendedMACAddress:(uint64_t)buf output:v22];
    }
    goto LABEL_32;
  }
  if ([(ThreadNetworkManagerInstance *)self modeChangeInProgress])
  {
    std::to_string((std::string *)buf, 3000);
    if (buf[23] >= 0) {
      uint64_t v18 = buf;
    }
    else {
      uint64_t v18 = *(const char **)buf;
    }
    xpc_object_t v19 = xpc_string_create(v18);
    id v126 = v19;
    if (!v19) {
      id v126 = xpc_null_create();
    }

    int v124 = a4;
    v125.__r_.__value_.__r.__words[0] = (std::string::size_type)"delayWedConnectionRetryRequest";
    xpc::dict::object_proxy::operator=((uint64_t)&v124, &v126, &v127);
    id v20 = v127;
    id v127 = 0;

    id v21 = v126;
    id v126 = 0;

    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    uint64_t v22 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      nl::wpantund::ncp_state_to_string((char *)[(ThreadNetworkManagerInstance *)self lastKnownNCPState], (uint64_t)&v124);
      int v38 = v125.__r_.__value_.__s.__data_[15];
      uint64_t v39 = (void **)v124;
      v132.__r_.__value_.__r.__words[0] = (std::string::size_type)a4;
      v132.__r_.__value_.__l.__size_ = (std::string::size_type)"delayWedConnectionRetryRequest";
      uint64_t v40 = xpc::dict::object_proxy::operator*((uint64_t)&v132);
      int v41 = (void *)v40;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:]";
      v42 = &v124;
      *(_DWORD *)std::string buf = 136316162;
      if (v38 < 0) {
        v42 = v39;
      }
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1307;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v42;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = a3;
      *(_WORD *)&unsigned char buf[38] = 2112;
      *(void *)&uint8_t buf[40] = v40;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s:%d Mode change is in progress in state %s, extendedMACAddress : %s Backoff by output[DELAY_WED_CONNECTION_RETRY_REQUEST_KEY] = %@", buf, 0x30u);
      if (v125.__r_.__value_.__s.__data_[15] < 0) {
        operator delete(v124);
      }
    }
LABEL_32:

LABEL_10:
    int v10 = 1;
    goto LABEL_11;
  }
  std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  LODWORD(v124) = 3;
  std::string v125 = *(std::string *)buf;
  uint64_t v123 = 0;
  xpc_object_t v23 = [(ThreadNetworkManagerInstance *)self validateExtendedMACAddress:a3];
  id v24 = v23;
  if (!v23)
  {
    if (![(ThreadNetworkManagerInstance *)self wedStatus])
    {
      char v35 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        nl::wpantund::ncp_state_to_string((char *)[(ThreadNetworkManagerInstance *)self lastKnownNCPState], (uint64_t)&v132);
        -[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:]();
      }
      int v10 = 0;
      goto LABEL_226;
    }
LABEL_54:
    uint64_t v30 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
    std::string::basic_string[abi:ne180100]<0>(v121, "Network:NodeType");
    if (v30) {
      [v30 getProperty:v121 output:&v123];
    }
    else {
      memset(buf, 0, 32);
    }
    int v31 = *CtrXPC::Result::operator=(&v124, (uint64_t)buf);
    if ((buf[31] & 0x80000000) != 0) {
      operator delete(*(void **)&buf[8]);
    }
    if (v122 < 0) {
      operator delete(v121[0]);
    }

    if (v31)
    {
      xpc_object_t v32 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Failed to get the network Node Type", buf, 2u);
      }

      [(ThreadNetworkManagerInstance *)self setWedAttachRequest:0];
      goto LABEL_65;
    }
    any_to_string((const boost::any *)&v123, (uint64_t)buf);
    int v33 = nl::wpantund::string_to_node_type(buf);
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    if (!v33)
    {
      xpc_object_t v36 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Curent Node Type is unknown, switch to Sleepy router mode ", buf, 2u);
      }

      [(ThreadNetworkManagerInstance *)self setModeChangeInProgress:1];
      id v37 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
      std::string::basic_string[abi:ne180100]<0>(v119, "Network:NodeType");
      if (v37) {
        objc_msgSend(v37, "setProperty:property_val:", v119, "sleepy-router");
      }
      else {
        memset(buf, 0, 32);
      }
      CtrXPC::Result::operator=(&v124, (uint64_t)buf);
      if ((buf[31] & 0x80000000) != 0) {
        operator delete(*(void **)&buf[8]);
      }
      if (v120 < 0) {
        operator delete(v119[0]);
      }

      [(ThreadNetworkManagerInstance *)self setNetworkNodeTypeChangeNotify:1];
      dispatch_time_t v43 = dispatch_time(0, 15000000000);
      xpc_object_t v44 = [(ThreadNetworkManagerInstance *)self semaphoreNetworkNodeTypeChange];
      intptr_t v45 = dispatch_semaphore_wait(v44, v43);

      if (v45)
      {
        [(ThreadNetworkManagerInstance *)self setModeChangeInProgress:0];
        size_t v46 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          -[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:].cold.6(v46, v47, v48, v49, v50, v51, v52, v53);
        }
      }
      else
      {
        size_t v46 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)std::string buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Dispatch signal semaphoreNetworkNodeTypeChange Received\n", buf, 2u);
        }
      }

      [(ThreadNetworkManagerInstance *)self setNetworkNodeTypeChangeNotify:0];
      if (v45) {
        goto LABEL_132;
      }
    }
    if ([(ThreadNetworkManagerInstance *)self wedStatus] == 1
      && [(ThreadNetworkManagerInstance *)self wedAttachRequest])
    {
      id v34 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1373;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%s:%d Already attached to WED , check for Duplicate Wed Attach request", buf, 0x12u);
      }

      if ([(ThreadNetworkManagerInstance *)self checkIfDuplicateWedAttachRequest:v24])
      {
        int v10 = 0;
        goto LABEL_227;
      }
      [(ThreadNetworkManagerInstance *)self setWakeOnDeviceChangeNotify:1];
      [(ThreadNetworkManagerInstance *)self noteTimeWhenWEDDetachStart];
      id v54 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
      id v55 = v54;
      if (v54) {
        [v54 wedStop];
      }
      else {
        memset(buf, 0, 32);
      }
      CtrXPC::Result::operator=(&v124, (uint64_t)buf);
      if ((buf[31] & 0x80000000) != 0) {
        operator delete(*(void **)&buf[8]);
      }

      if (v124)
      {
        id v56 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          uint64_t v111 = &v132;
          CtrXPC::Result::toString(v124, &v132);
          if ((v132.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            uint64_t v111 = (std::string *)v132.__r_.__value_.__r.__words[0];
          }
          std::string::basic_string(&v118, &v125);
          if ((v118.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            v112 = &v118;
          }
          else {
            v112 = (std::string *)v118.__r_.__value_.__r.__words[0];
          }
          nl::wpantund::ncp_wed_status_to_string([(ThreadNetworkManagerInstance *)self wedStatus], (char *)v116);
          if (v117 >= 0) {
            v113 = v116;
          }
          else {
            v113 = (void **)v116[0];
          }
          *(_DWORD *)std::string buf = 136315906;
          *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:]";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v111;
          *(_WORD *)&buf[22] = 2080;
          *(void *)&buf[24] = v112;
          *(_WORD *)&buf[32] = 2080;
          *(void *)&buf[34] = v113;
          _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%s : TNM got the Failed Result for provideExtendedMACAddress as = %s, Error Info: %s, Wed Status=[%s]", buf, 0x2Au);
          if (v117 < 0) {
            operator delete(v116[0]);
          }
          if (SHIBYTE(v118.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v118.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v132.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v132.__r_.__value_.__l.__data_);
          }
        }

        if (v124 == 14) {
          [(ThreadNetworkManagerInstance *)self UpdateOutputWithBackOffTimerValue:v24 output:a4];
        }
        goto LABEL_131;
      }
      id v57 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        CtrXPC::Result::toString(v124, &v132);
        int v58 = SHIBYTE(v132.__r_.__value_.__r.__words[2]);
        std::string::size_type v59 = v132.__r_.__value_.__r.__words[0];
        std::string::basic_string(&v118, &v125);
        std::string v60 = &v132;
        if (v58 < 0) {
          std::string v60 = (std::string *)v59;
        }
        if ((v118.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string v61 = &v118;
        }
        else {
          std::string v61 = (std::string *)v118.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)std::string buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:]";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v60;
        *(_WORD *)&buf[22] = 2080;
        *(void *)&buf[24] = v61;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%s : TNM got the Success Result for provideExtendedMACAddress detach request as = %s, Error Info: %s", buf, 0x20u);
        if (SHIBYTE(v118.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v118.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v132.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v132.__r_.__value_.__l.__data_);
        }
      }

      dispatch_time_t v62 = dispatch_time(0, 10000000000);
      id v63 = [(ThreadNetworkManagerInstance *)self semaphoreWakeOnDeviceChange];
      LOBYTE(v62) = dispatch_semaphore_wait(v63, v62) == 0;

      if ((v62 & 1) == 0)
      {
        __int16 v64 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
          -[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:].cold.5(v64, v65, v66, v67, v68, v69, v70, v71);
        }
LABEL_130:

LABEL_131:
        [(ThreadNetworkManagerInstance *)self noteTimeWhenWEDDetachCompleteSuccessOrFail:0];
LABEL_132:
        int v10 = 1;
        goto LABEL_224;
      }
      __int16 v72 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Dispatch signal semaphoreWakeOnDeviceChange Received for detach\n", buf, 2u);
      }

      [(ThreadNetworkManagerInstance *)self setWakeOnDeviceChangeNotify:0];
      if ([(ThreadNetworkManagerInstance *)self wedStatus] == 2)
      {
        [(ThreadNetworkManagerInstance *)self UpdateOutputWithBackOffTimerValue:v24 output:a4];
        __int16 v64 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          nl::wpantund::ncp_wed_status_to_string([(ThreadNetworkManagerInstance *)self wedStatus], buf);
          unint64_t v73 = buf[23] >= 0 ? buf : *(unsigned char **)buf;
          LODWORD(v132.__r_.__value_.__l.__data_) = 136315394;
          *(std::string::size_type *)((char *)v132.__r_.__value_.__r.__words + 4) = (std::string::size_type)"-[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:]";
          WORD2(v132.__r_.__value_.__r.__words[1]) = 2080;
          *(std::string::size_type *)((char *)&v132.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v73;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%s: wed connection failure, Wed Status=[%s]", (uint8_t *)&v132, 0x16u);
          if ((buf[23] & 0x80000000) != 0) {
            operator delete(*(void **)buf);
          }
        }
        goto LABEL_130;
      }
      int v74 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
      {
        nl::wpantund::ncp_wed_status_to_string([(ThreadNetworkManagerInstance *)self wedStatus], buf);
        v75 = buf[23] >= 0 ? buf : *(unsigned char **)buf;
        LODWORD(v132.__r_.__value_.__l.__data_) = 136315394;
        *(std::string::size_type *)((char *)v132.__r_.__value_.__r.__words + 4) = (std::string::size_type)"-[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:]";
        WORD2(v132.__r_.__value_.__r.__words[1]) = 2080;
        *(std::string::size_type *)((char *)&v132.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v75;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "%s: wedStop Successful, Wed Status=[%s]", (uint8_t *)&v132, 0x16u);
        if ((buf[23] & 0x80000000) != 0) {
          operator delete(*(void **)buf);
        }
      }

      [(ThreadNetworkManagerInstance *)self noteTimeWhenWEDDetachCompleteSuccessOrFail:1];
    }
    char v76 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      std::string v77 = [(ThreadNetworkManagerInstance *)self wedAttachRequest] ? "wedStart" : "wedStop";
      nl::wpantund::ncp_state_to_string((char *)[(ThreadNetworkManagerInstance *)self lastKnownNCPState], (uint64_t)&v132);
      size_t v78 = (v132.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &v132
          : (std::string *)v132.__r_.__value_.__r.__words[0];
      *(_DWORD *)std::string buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1430;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v77;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = v78;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%s:%d Cmd:%s received in state %s", buf, 0x26u);
      if (SHIBYTE(v132.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v132.__r_.__value_.__l.__data_);
      }
    }

    [(ThreadNetworkManagerInstance *)self setWakeOnDeviceChangeNotify:1];
    if ([(ThreadNetworkManagerInstance *)self wedAttachRequest])
    {
      unsigned int v79 = +[NSString stringWithUTF8String:v24];
      [(ThreadNetworkManagerInstance *)self noteTimeWhenWEDAttachStart:v79];
    }
    else
    {
      [(ThreadNetworkManagerInstance *)self noteTimeWhenWEDDetachStart];
    }
    if ([(ThreadNetworkManagerInstance *)self wedAttachRequest])
    {
      int v80 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
      int v81 = v80;
      if (v80) {
        [v80 wedStart:v24];
      }
      else {
        memset(buf, 0, 32);
      }
      CtrXPC::Result::operator=(&v124, (uint64_t)buf);
      if ((buf[31] & 0x80000000) != 0) {
        operator delete(*(void **)&buf[8]);
      }
    }
    else
    {
      uint64_t v82 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
      int v81 = v82;
      if (v82) {
        [v82 wedStop];
      }
      else {
        memset(buf, 0, 32);
      }
      CtrXPC::Result::operator=(&v124, (uint64_t)buf);
      if ((buf[31] & 0x80000000) != 0) {
        operator delete(*(void **)&buf[8]);
      }
    }

    if (v124)
    {
      v83 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      {
        v107 = &v132;
        CtrXPC::Result::toString(v124, &v132);
        if ((v132.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          v107 = (std::string *)v132.__r_.__value_.__r.__words[0];
        }
        std::string::basic_string(&v118, &v125);
        if ((v118.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          char v108 = &v118;
        }
        else {
          char v108 = (std::string *)v118.__r_.__value_.__r.__words[0];
        }
        nl::wpantund::ncp_wed_status_to_string([(ThreadNetworkManagerInstance *)self wedStatus], (char *)v116);
        if (v117 >= 0) {
          int v109 = v116;
        }
        else {
          int v109 = (void **)v116[0];
        }
        *(_DWORD *)std::string buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:]";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v107;
        *(_WORD *)&buf[22] = 2080;
        *(void *)&buf[24] = v108;
        *(_WORD *)&buf[32] = 2080;
        *(void *)&buf[34] = v109;
        _os_log_error_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "%s : TNM got the Failed Result for provideExtendedMACAddress as = %s, Error Info: %s, Wed Status=[%s]", buf, 0x2Au);
        if (v117 < 0) {
          operator delete(v116[0]);
        }
        if (SHIBYTE(v118.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v118.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v132.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v132.__r_.__value_.__l.__data_);
        }
      }

      if (v124 == 14) {
        [(ThreadNetworkManagerInstance *)self UpdateOutputWithBackOffTimerValue:v24 output:a4];
      }
      BOOL v84 = 0;
      int v10 = 1;
      goto LABEL_223;
    }
    v85 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      CtrXPC::Result::toString(v124, &v132);
      int v86 = SHIBYTE(v132.__r_.__value_.__r.__words[2]);
      std::string::size_type v87 = v132.__r_.__value_.__r.__words[0];
      std::string::basic_string(&v118, &v125);
      __int16 v88 = &v132;
      if (v86 < 0) {
        __int16 v88 = (std::string *)v87;
      }
      if ((v118.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int v89 = &v118;
      }
      else {
        int v89 = (std::string *)v118.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v88;
      *(_WORD *)&buf[22] = 2080;
      *(void *)&buf[24] = v89;
      _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "%s : TNM got the Success Result for provideExtendedMACAddress as = %s, Error Info: %s", buf, 0x20u);
      if (SHIBYTE(v118.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v118.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v132.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v132.__r_.__value_.__l.__data_);
      }
    }

    dispatch_time_t v90 = dispatch_time(0, 10000000000);
    long long v91 = [(ThreadNetworkManagerInstance *)self semaphoreWakeOnDeviceChange];
    BOOL v84 = dispatch_semaphore_wait(v91, v90) == 0;

    if (!v84)
    {
      char v92 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:].cold.4(v92, v93, v94, v95, v96, v97, v98, v99);
      }
      int v10 = 1;
      goto LABEL_221;
    }
    char v100 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "Dispatch signal semaphoreWakeOnDeviceChange Received\n", buf, 2u);
    }

    if ([(ThreadNetworkManagerInstance *)self wedStatus] == 2)
    {
      [(ThreadNetworkManagerInstance *)self UpdateOutputWithBackOffTimerValue:v24 output:a4];
      std::string v101 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:]";
        _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "%s: wed connection failure", buf, 0xCu);
      }

      if ([(ThreadNetworkManagerInstance *)self wedAttachRequest]) {
        [(ThreadNetworkManagerInstance *)self noteTimeWhenWEDDetachCompleteSuccessOrFail:0];
      }
      BOOL v84 = 0;
      int v10 = 1;
      goto LABEL_222;
    }
    if ([(ThreadNetworkManagerInstance *)self wedAttachRequest])
    {
      xpc_object_t v102 = xpc_string_create(v24);
      id v114 = v102;
      if (!v102)
      {
        id v114 = xpc_null_create();
      }
      *(void *)std::string buf = a4;
      *(void *)&buf[8] = "extendedMACAddress";
      xpc::dict::object_proxy::operator=((uint64_t)buf, &v114, &v115);
      id v103 = v115;
      id v115 = 0;

      id v104 = v114;
      id v114 = 0;

      char v92 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (!os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_220;
      }
      nl::wpantund::ncp_wed_status_to_string([(ThreadNetworkManagerInstance *)self wedStatus], buf);
      if (buf[23] >= 0) {
        id v105 = buf;
      }
      else {
        id v105 = *(unsigned char **)buf;
      }
      LODWORD(v132.__r_.__value_.__l.__data_) = 136315394;
      *(std::string::size_type *)((char *)v132.__r_.__value_.__r.__words + 4) = (std::string::size_type)"-[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:]";
      WORD2(v132.__r_.__value_.__r.__words[1]) = 2080;
      *(std::string::size_type *)((char *)&v132.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v105;
      id v106 = "%s: wedStart Successful, Wed Status=[%s]";
    }
    else
    {
      char v92 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (!os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
      {
LABEL_220:
        int v10 = 0;
LABEL_221:

LABEL_222:
        [(ThreadNetworkManagerInstance *)self setWakeOnDeviceChangeNotify:0];
LABEL_223:
        [(ThreadNetworkManagerInstance *)self noteTimeWhenAttachDetachCompleteSuccessOrFail:v84];
LABEL_224:
        [(ThreadNetworkManagerInstance *)self reset];
        char v35 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)std::string buf = 136315650;
          *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 1495;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v10;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s:%d: Exiting, ret : %d", buf, 0x18u);
        }
LABEL_226:

        goto LABEL_227;
      }
      nl::wpantund::ncp_wed_status_to_string([(ThreadNetworkManagerInstance *)self wedStatus], buf);
      if (buf[23] >= 0) {
        v110 = buf;
      }
      else {
        v110 = *(unsigned char **)buf;
      }
      LODWORD(v132.__r_.__value_.__l.__data_) = 136315394;
      *(std::string::size_type *)((char *)v132.__r_.__value_.__r.__words + 4) = (std::string::size_type)"-[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:]";
      WORD2(v132.__r_.__value_.__r.__words[1]) = 2080;
      *(std::string::size_type *)((char *)&v132.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v110;
      id v106 = "%s: wedStop Successful, Wed Status=[%s]";
    }
    _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, v106, (uint8_t *)&v132, 0x16u);
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    goto LABEL_220;
  }
  if (strlen(v23) == 16)
  {
    id v25 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      std::string v26 = &v132;
      nl::wpantund::ncp_state_to_string((char *)[(ThreadNetworkManagerInstance *)self lastKnownNCPState], (uint64_t)&v132);
      if ((v132.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string v26 = (std::string *)v132.__r_.__value_.__r.__words[0];
      }
      size_t v27 = strlen(v24);
      *(_DWORD *)std::string buf = 136316162;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(SM_extension) provideExtendedMACAddress:output:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1324;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = v26;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = v24;
      *(_WORD *)&unsigned char buf[38] = 2048;
      *(void *)&uint8_t buf[40] = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s:%d Cmd received in state %s, extendedMACAddress : %s extendedMACAddress Length = %ld", buf, 0x30u);
      if (SHIBYTE(v132.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v132.__r_.__value_.__l.__data_);
      }
    }

    [(ThreadNetworkManagerInstance *)self setWedAttachRequest:1];
    [(ThreadNetworkManagerInstance *)self updateWEDConnectionCount];
    goto LABEL_54;
  }
LABEL_65:
  int v10 = 1;
LABEL_227:
  if (v123) {
    (*(void (**)(uint64_t))(*(void *)v123 + 8))(v123);
  }
  if (SHIBYTE(v125.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v125.__r_.__value_.__l.__data_);
  }
LABEL_11:

  objc_destroyWeak(&location);
  return v10;
}

- (void)startQuickDiscoveryScanInSRMode
{
  id v3 = objc_initWeak(&location, self);
  int v15 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  v16 = 0;
  xpc_object_t v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ThreadConnection: Peform Quick SR Discovery scan \n", buf, 2u);
  }

  if ([(ThreadNetworkManagerInstance *)self isGeoAvailable]
    && [(ThreadNetworkManagerInstance *)self lastKnownNodeType] == 8)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "Command Error");
    *(_DWORD *)std::string buf = 3;
    *(_OWORD *)&buf[8] = *(_OWORD *)__p;
    *(void **)&buf[24] = __p[2];
    memset(__p, 0, 24);
    CtrXPC::Result::operator=(&v15, (uint64_t)buf);
    if ((buf[31] & 0x80000000) != 0) {
      operator delete(*(void **)&buf[8]);
    }
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
    if ([(ThreadNetworkManagerInstance *)self wedStatus] == 1)
    {
      id v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v6 = [(ThreadNetworkManagerInstance *)self wedAttachRequest];
        unsigned int v7 = [(ThreadNetworkManagerInstance *)self wedStatus];
        *(_DWORD *)std::string buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = v6;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ThreadConnection: Avoid quick network SR Discovery scan as WED conenction is ongoing, wedAttachRequest = %d, wedStatus = %d \n", buf, 0xEu);
      }
    }
    else
    {
      xpc_object_t v11 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ThreadConnection: Peform quick network SR Discovery scan \n", buf, 2u);
      }

      id v12 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
      std::string::basic_string[abi:ne180100]<0>(v13, "StartCurrentNetworkDiscoveryScan");
      if (v12) {
        objc_msgSend(v12, "setProperty:property_val:", v13, "NA");
      }
      else {
        memset(buf, 0, sizeof(buf));
      }
      CtrXPC::Result::operator=(&v15, (uint64_t)buf);
      if ((buf[31] & 0x80000000) != 0) {
        operator delete(*(void **)&buf[8]);
      }
      if (v14 < 0) {
        operator delete(v13[0]);
      }
    }
  }
  else
  {
    unsigned int v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = [(ThreadNetworkManagerInstance *)self geoAvailable];
      nl::wpantund::node_type_to_string([(ThreadNetworkManagerInstance *)self lastKnownNodeType], (std::string *)buf);
      int v10 = buf[23] >= 0 ? buf : *(unsigned char **)buf;
      LODWORD(__p[0]) = 67109378;
      HIDWORD(__p[0]) = v9;
      LOWORD(__p[1]) = 2080;
      *(void **)((char *)&__p[1] + 2) = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ThreadConnection: Avoid quick network SR Discovery scan as Geo(%d) is not enabled, or Node type is non SR, node: %s", (uint8_t *)__p, 0x12u);
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
    }
  }
  if (SHIBYTE(v18) < 0) {
    operator delete(v16);
  }

  objc_destroyWeak(&location);
}

- (void)startPeriodicDiscoveryScanInSRMode
{
  id v3 = tnm_discoveryScanQ;
  if (!tnm_discoveryScanQ)
  {
    xpc_object_t v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v5 = dispatch_queue_create("TNM.SR.DiscoveryScanQ", v4);
    unsigned int v6 = (void *)tnm_discoveryScanQ;
    tnm_discoveryScanQ = (uint64_t)v5;

    unsigned int v7 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ThreadConnection: Created SR Periodic Discovery Scan Q \n", buf, 2u);
    }

    id v3 = tnm_discoveryScanQ;
  }
  if (discoveryScanTimer) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v3 == 0;
  }
  if (v8)
  {
    if (discoveryScanTimer) {
      BOOL v9 = v3 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9 && (on_going_discovery_scan & 1) == 0)
    {
      dispatch_time_t v10 = dispatch_time(0, 10000000000);
      dispatch_source_set_timer((dispatch_source_t)discoveryScanTimer, v10, 0x2540BE400uLL, 0);
      dispatch_resume((dispatch_object_t)discoveryScanTimer);
      xpc_object_t v11 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ThreadConnection: Started SR Periodic Discovery Scan\n", buf, 2u);
      }

      on_going_discovery_scan = 1;
    }
  }
  else
  {
    dispatch_source_t v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
    int v13 = (void *)discoveryScanTimer;
    discoveryScanTimer = (uint64_t)v12;

    dispatch_time_t v14 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer((dispatch_source_t)discoveryScanTimer, v14, 0x2540BE400uLL, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = __80__ThreadNetworkManagerInstance_SM_extension__startPeriodicDiscoveryScanInSRMode__block_invoke;
    handler[3] = &unk_10049C010;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)discoveryScanTimer, handler);
    int v15 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 67109120;
      int v19 = 10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "ThreadConnection: Created SR Periodic Discovery Scan Timer=[%d]sec \n", buf, 8u);
    }

    dispatch_activate((dispatch_object_t)discoveryScanTimer);
    on_going_discovery_scan = 1;
  }
}

void __80__ThreadNetworkManagerInstance_SM_extension__startPeriodicDiscoveryScanInSRMode__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) wedAttachRequest] & 1) != 0
    || [*(id *)(a1 + 32) wedStatus] == 1)
  {
    v2 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v3 = [*(id *)(a1 + 32) wedAttachRequest];
      unsigned int v4 = [*(id *)(a1 + 32) wedStatus];
      *(_DWORD *)std::string buf = 67109376;
      int v12 = v3;
      LOWORD(v13[0]) = 1024;
      *(_DWORD *)((char *)v13 + 2) = v4;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "ThreadConnection: Avoid current network SR Periodic Discovery scan as WED conenction is ongoing, wedAttachRequest = %d, wedStatus = %d \n", buf, 0xEu);
    }
  }
  else
  {
    dispatch_queue_t v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 67109120;
      int v12 = 10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "ThreadConnection: SR Periodic Discovery Scan timer=[%d]sec elapsed, Peform current network SR Discovery scan \n", buf, 8u);
    }

    std::string::basic_string[abi:ne180100]<0>(__p, "Command Error");
    *(_DWORD *)std::string buf = 3;
    *(_OWORD *)int v13 = *(_OWORD *)__p;
    uint64_t v14 = v10;
    unsigned int v6 = [*(id *)(a1 + 32) CtrInternalClientPtr];
    std::string::basic_string[abi:ne180100]<0>(v7, "StartCurrentNetworkDiscoveryScan");
    if (v6)
    {
      objc_msgSend(v6, "setProperty:property_val:", v7, "NA");
    }
    else
    {
      *(_OWORD *)std::string __p = 0u;
      long long v10 = 0u;
    }
    CtrXPC::Result::operator=(buf, (uint64_t)__p);
    if (SHIBYTE(v10) < 0) {
      operator delete(__p[1]);
    }
    if (v8 < 0) {
      operator delete(v7[0]);
    }

    if (SHIBYTE(v14) < 0) {
      operator delete(v13[0]);
    }
  }
}

- (void)stopPeriodicDiscoveryScanInSRMode
{
  if (discoveryScanTimer && on_going_discovery_scan == 1)
  {
    dispatch_suspend((dispatch_object_t)discoveryScanTimer);
    v2 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "ThreadConnection: Stopped SR Discovery Scan\n", v3, 2u);
    }

    on_going_discovery_scan = 0;
  }
}

- (void)onThreadStartPerformDiscoveryScan
{
  unsigned int v3 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    BOOL v9 = "-[ThreadNetworkManagerInstance(SM_extension) onThreadStartPerformDiscoveryScan]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Perform SR Discovery Scan\n", (uint8_t *)&v8, 0xCu);
  }

  if ([(ThreadNetworkManagerInstance *)self isDiscoveryScanAllowed]
    && ![(ThreadNetworkManagerInstance *)self isPeriodicDiscoveryScanInProgress])
  {
    unsigned int v6 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      BOOL v9 = "-[ThreadNetworkManagerInstance(SM_extension) onThreadStartPerformDiscoveryScan]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: startPeriodicDiscoveryScanInSRMode\n", (uint8_t *)&v8, 0xCu);
    }

    [(ThreadNetworkManagerInstance *)self startPeriodicDiscoveryScanInSRMode];
  }
  else if ([(ThreadNetworkManagerInstance *)self isDiscoveryScanAllowed] {
         || ![(ThreadNetworkManagerInstance *)self isPeriodicDiscoveryScanInProgress])
  }
  {
    dispatch_queue_t v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      BOOL v9 = "-[ThreadNetworkManagerInstance(SM_extension) onThreadStartPerformDiscoveryScan]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: pass through\n", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    unsigned int v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      BOOL v9 = "-[ThreadNetworkManagerInstance(SM_extension) onThreadStartPerformDiscoveryScan]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: stopPeriodicDiscoveryScanInSRMode\n", (uint8_t *)&v8, 0xCu);
    }

    [(ThreadNetworkManagerInstance *)self stopPeriodicDiscoveryScanInSRMode];
  }
  if ([(ThreadNetworkManagerInstance *)self isThreadAlwaysOnFeatureEnabled])
  {
    unsigned int v7 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      BOOL v9 = "-[ThreadNetworkManagerInstance(SM_extension) onThreadStartPerformDiscoveryScan]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: startQuickDiscoveryScanInSRMode\n", (uint8_t *)&v8, 0xCu);
    }

    [(ThreadNetworkManagerInstance *)self startQuickDiscoveryScanInSRMode];
  }
}

- (BOOL)isDiscoveryScanAllowed
{
  return [(ThreadNetworkManagerInstance *)self isGeoAvailable]
      && [(ThreadNetworkManagerInstance *)self lastKnownNodeType] == 8;
}

- (BOOL)isPeriodicDiscoveryScanInProgress
{
  return discoveryScanTimer && (on_going_discovery_scan & 1) != 0;
}

void __82__ThreadNetworkManagerInstance_SM_extension__registerStateMachineWedEventHandlers__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (id)getRCPProperties
{
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [(ThreadNetworkManagerInstance *)self getNCPState:0];
  [(ThreadNetworkManagerInstance *)self getNCPPropertyAsString:"NCP:State"];
  if (v33 >= 0) {
    dispatch_queue_t v5 = v32;
  }
  else {
    dispatch_queue_t v5 = (void **)v32[0];
  }
  unsigned int v6 = +[NSString stringWithUTF8String:v5];
  [v4 setObject:v6 forKeyedSubscript:@"NCP:State"];

  if ([(ThreadNetworkManagerInstance *)self lastKnownNCPState] == 8)
  {
    [(ThreadNetworkManagerInstance *)self getNCPPropertyAsString:"Thread:Health:Metrics"];
    std::string::operator=[abi:ne180100]((uint64_t)v32, (long long *)__p);
    if (v35 < 0) {
      operator delete(__p[0]);
    }
    if (v33 >= 0) {
      unsigned int v7 = v32;
    }
    else {
      unsigned int v7 = (void **)v32[0];
    }
    int v8 = +[NSString stringWithUTF8String:v7];
    [v4 setObject:v8 forKeyedSubscript:@"Thread:Health:Metrics"];

    BOOL v9 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      long long v10 = v32;
      if (v33 < 0) {
        long long v10 = (void **)v32[0];
      }
      LODWORD(__p[0]) = 136315138;
      *(void **)((char *)__p + 4) = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Thread:Health:Metrics=%s", (uint8_t *)__p, 0xCu);
    }

    [(ThreadNetworkManagerInstance *)self getNCPPropertyAsString:"Network:Key"];
    std::string::operator=[abi:ne180100]((uint64_t)v32, (long long *)__p);
    if (v35 < 0) {
      operator delete(__p[0]);
    }
    if (v33 >= 0) {
      xpc_object_t v11 = v32;
    }
    else {
      xpc_object_t v11 = (void **)v32[0];
    }
    int v12 = +[NSString stringWithUTF8String:v11];
    [v4 setObject:v12 forKeyedSubscript:@"Network:Key"];

    int v13 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = v32;
      if (v33 < 0) {
        uint64_t v14 = (void **)v32[0];
      }
      LODWORD(__p[0]) = 136315138;
      *(void **)((char *)__p + 4) = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Network::Key=%s", (uint8_t *)__p, 0xCu);
    }

    [(ThreadNetworkManagerInstance *)self getNCPPropertyAsString:"Network:KeyIndex"];
    std::string::operator=[abi:ne180100]((uint64_t)v32, (long long *)__p);
    if (v35 < 0) {
      operator delete(__p[0]);
    }
    if (v33 >= 0) {
      int v15 = v32;
    }
    else {
      int v15 = (void **)v32[0];
    }
    v16 = +[NSString stringWithUTF8String:v15];
    [v4 setObject:v16 forKeyedSubscript:@"Network:KeyIndex"];

    uint64_t v17 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = v32;
      if (v33 < 0) {
        uint64_t v18 = (void **)v32[0];
      }
      LODWORD(__p[0]) = 136315138;
      *(void **)((char *)__p + 4) = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Network::KeyIndex=%s", (uint8_t *)__p, 0xCu);
    }

    int v19 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"Thread:Services"];
    if (v19) {
      [v4 setObject:v19 forKey:@"Thread:Services"];
    }
    uint64_t v20 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"Thread:OffMeshRoutes"];

    id v21 = (void *)v20;
    if (v20) {
      [v4 setObject:v20 forKey:@"Thread:OffMeshRoutes"];
    }
    uint64_t v22 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"Thread:OnMeshPrefixes"];

    xpc_object_t v23 = (void *)v22;
    if (v22) {
      [v4 setObject:v22 forKey:@"Thread:OnMeshPrefixes"];
    }
    uint64_t v24 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"vendor:ncp:state:dump"];

    id v25 = (void *)v24;
    if (v24) {
      [v4 setObject:v24 forKey:@"vendor:ncp:state:dump"];
    }
    uint64_t v26 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"Thread:RouterTable"];

    size_t v27 = (void *)v26;
    if (v26) {
      [v4 setObject:v26 forKey:@"Thread:RouterTable"];
    }
    id v28 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"Thread:EidCache"];

    if (v28) {
      [v4 setObject:v28 forKey:@"Thread:EidCache"];
    }
    id v29 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"Thread:MessageBufferStats"];

    if (v29) {
      [v4 setObject:v29 forKey:@"Thread:MessageBufferStats"];
    }
  }
  else
  {
    uint64_t v30 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance(syslog_extension) getRCPProperties](v30);
    }

    id v29 = 0;
  }
  if (v33 < 0) {
    operator delete(v32[0]);
  }

  return v4;
}

- (id)getNCPStatusInDict
{
  uint64_t v14 = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "Command Error");
  int v11 = 3;
  *(_OWORD *)int v12 = *(_OWORD *)__p;
  uint64_t v13 = v16;
  unsigned int v3 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  id v4 = v3;
  if (v3)
  {
    [v3 getNCPStatus:&v14];
  }
  else
  {
    *(_OWORD *)std::string __p = 0u;
    long long v16 = 0u;
  }
  CtrXPC::Result::operator=(&v11, (uint64_t)__p);
  if (SHIBYTE(v16) < 0) {
    operator delete(__p[1]);
  }

  if (v11)
  {
    dispatch_queue_t v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p[0]) = 136315138;
      *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance(syslog_extension) getNCPStatusInDict]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s : Failed to get the NCP status", (uint8_t *)__p, 0xCu);
    }

    unsigned int v6 = 0;
  }
  else
  {
    unsigned int v7 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p[0]) = 136315138;
      *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance(syslog_extension) getNCPStatusInDict]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s : got the NCP status, now go for decoding", (uint8_t *)__p, 0xCu);
    }

    uint64_t v8 = v14;
    if (v14) {
      uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)v14 + 24))(v14);
    }
    uint64_t v10 = v8;
    unsigned int v6 = InternalClientIPCHelper::decodeComplexValToDict(&v10);
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
    }
  }
  if (SHIBYTE(v13) < 0) {
    operator delete(v12[0]);
  }
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  }

  return v6;
}

- (id)getNCPPropertyInDict:(const char *)a3
{
  uint64_t v16 = 0;
  std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  int v13 = 3;
  *(_OWORD *)uint64_t v14 = *(_OWORD *)buf;
  uint64_t v15 = *(void *)&buf[16];
  dispatch_queue_t v5 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)a3);
  if (v5) {
    [v5 getProperty:__p output:&v16];
  }
  else {
    memset(buf, 0, 32);
  }
  CtrXPC::Result::operator=(&v13, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v12 < 0) {
    operator delete(__p[0]);
  }

  if (v13)
  {
    unsigned int v6 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(syslog_extension) getNCPPropertyInDict:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s : Failed to get the NCP Property %s", buf, 0x16u);
    }

    unsigned int v7 = 0;
  }
  else
  {
    uint64_t v8 = v16;
    if (v16) {
      uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)v16 + 24))(v16);
    }
    uint64_t v10 = v8;
    unsigned int v7 = InternalClientIPCHelper::decodeComplexValToDict(&v10);
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
    }
  }
  if (SHIBYTE(v15) < 0) {
    operator delete(v14[0]);
  }
  if (v16) {
    (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
  }

  return v7;
}

- (basic_string<char,)getNCPPropertyAsString:(std::allocator<char>> *__return_ptr)retstr
{
  unsigned int v3 = v2;
  id v4 = v1;
  uint64_t v14 = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "Command Error");
  int v11 = 3;
  *(_OWORD *)char v12 = *(_OWORD *)__p;
  int v13 = __p[2];
  unsigned int v6 = [v4 CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(v9, v3);
  if (v6) {
    [v6 getProperty:v9 output:&v14];
  }
  else {
    memset(__p, 0, 32);
  }
  CtrXPC::Result::operator=(&v11, (uint64_t)__p);
  if (SHIBYTE(__p[3]) < 0) {
    operator delete(__p[1]);
  }
  if (v10 < 0) {
    operator delete(v9[0]);
  }

  if (v11)
  {
    unsigned int v7 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p[0]) = 136315394;
      *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance(syslog_extension) getNCPPropertyAsString:]";
      WORD2(__p[1]) = 2080;
      *(void **)((char *)&__p[1] + 6) = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s : Failed to get the NCP Property %s", (uint8_t *)__p, 0x16u);
    }

    std::string::basic_string[abi:ne180100]<0>(retstr, "");
  }
  else
  {
    any_to_string((const boost::any *)&v14, (uint64_t)retstr);
  }
  if (SHIBYTE(v13) < 0) {
    operator delete(v12[0]);
  }
  result = v14;
  if (v14) {
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)(*((uint64_t (**)(basic_string<char, std::char_traits<char>, std::allocator<char>> *))v14->var0.var0.var0.var1.var0
  }
                                                                                + 1))(v14);
  return result;
}

- (id)getNCPProperties
{
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [(ThreadNetworkManagerInstance *)self getNCPPropertyAsString:"NCP:State"];
  if (v59 >= 0) {
    dispatch_queue_t v5 = v58;
  }
  else {
    dispatch_queue_t v5 = (void **)v58[0];
  }
  unsigned int v6 = +[NSString stringWithUTF8String:v5];
  [v4 setObject:v6 forKeyedSubscript:@"NCP:State"];

  [(ThreadNetworkManagerInstance *)self getNCPState:0];
  if ([(ThreadNetworkManagerInstance *)self lastKnownNCPState] == 8)
  {
    [(ThreadNetworkManagerInstance *)self getNCPPropertyAsString:"Thread:Leader:Address"];
    std::string::operator=[abi:ne180100]((uint64_t)v58, (long long *)__p);
    if (v57 < 0) {
      operator delete(__p[0]);
    }
    if (v59 >= 0) {
      unsigned int v7 = v58;
    }
    else {
      unsigned int v7 = (void **)v58[0];
    }
    uint64_t v8 = +[NSString stringWithUTF8String:v7];
    [v4 setObject:v8 forKeyedSubscript:@"Thread:Leader:Address"];

    [(ThreadNetworkManagerInstance *)self getNCPPropertyAsString:"Thread:Leader:RouterID"];
    std::string::operator=[abi:ne180100]((uint64_t)v58, (long long *)__p);
    if (v57 < 0) {
      operator delete(__p[0]);
    }
    if (v59 >= 0) {
      BOOL v9 = v58;
    }
    else {
      BOOL v9 = (void **)v58[0];
    }
    char v10 = +[NSString stringWithUTF8String:v9];
    [v4 setObject:v10 forKeyedSubscript:@"Thread:Leader:RouterID"];

    [(ThreadNetworkManagerInstance *)self getNCPPropertyAsString:"Thread:Leader:Weight"];
    std::string::operator=[abi:ne180100]((uint64_t)v58, (long long *)__p);
    if (v57 < 0) {
      operator delete(__p[0]);
    }
    if (v59 >= 0) {
      int v11 = v58;
    }
    else {
      int v11 = (void **)v58[0];
    }
    char v12 = +[NSString stringWithUTF8String:v11];
    [v4 setObject:v12 forKeyedSubscript:@"Thread:Leader:Weight"];

    [(ThreadNetworkManagerInstance *)self getNCPPropertyAsString:"Thread:Leader:LocalWeight"];
    std::string::operator=[abi:ne180100]((uint64_t)v58, (long long *)__p);
    if (v57 < 0) {
      operator delete(__p[0]);
    }
    if (v59 >= 0) {
      int v13 = v58;
    }
    else {
      int v13 = (void **)v58[0];
    }
    uint64_t v14 = +[NSString stringWithUTF8String:v13];
    [v4 setObject:v14 forKeyedSubscript:@"Thread:Leader:LocalWeight"];

    [(ThreadNetworkManagerInstance *)self getNCPPropertyAsString:"IPv6:LinkLocalAddress"];
    std::string::operator=[abi:ne180100]((uint64_t)v58, (long long *)__p);
    if (v57 < 0) {
      operator delete(__p[0]);
    }
    if (v59 >= 0) {
      uint64_t v15 = v58;
    }
    else {
      uint64_t v15 = (void **)v58[0];
    }
    uint64_t v16 = +[NSString stringWithUTF8String:v15];
    [v4 setObject:v16 forKeyedSubscript:@"IPv6:LinkLocalAddress"];

    [(ThreadNetworkManagerInstance *)self getNCPPropertyAsString:"IPv6:MeshLocalAddress"];
    std::string::operator=[abi:ne180100]((uint64_t)v58, (long long *)__p);
    if (v57 < 0) {
      operator delete(__p[0]);
    }
    if (v59 >= 0) {
      uint64_t v17 = v58;
    }
    else {
      uint64_t v17 = (void **)v58[0];
    }
    uint64_t v18 = +[NSString stringWithUTF8String:v17];
    [v4 setObject:v18 forKeyedSubscript:@"IPv6:MeshLocalAddress"];

    [(ThreadNetworkManagerInstance *)self getNCPPropertyAsString:"IPv6:MeshLocalPrefix"];
    std::string::operator=[abi:ne180100]((uint64_t)v58, (long long *)__p);
    if (v57 < 0) {
      operator delete(__p[0]);
    }
    if (v59 >= 0) {
      int v19 = v58;
    }
    else {
      int v19 = (void **)v58[0];
    }
    uint64_t v20 = +[NSString stringWithUTF8String:v19];
    [v4 setObject:v20 forKeyedSubscript:@"IPv6:MeshLocalPrefix"];

    [(ThreadNetworkManagerInstance *)self getNCPPropertyAsString:"Thread:RLOC16"];
    std::string::operator=[abi:ne180100]((uint64_t)v58, (long long *)__p);
    if (v57 < 0) {
      operator delete(__p[0]);
    }
    if (v59 >= 0) {
      id v21 = v58;
    }
    else {
      id v21 = (void **)v58[0];
    }
    uint64_t v22 = +[NSString stringWithUTF8String:v21];
    [v4 setObject:v22 forKeyedSubscript:@"Thread:RLOC16"];

    xpc_object_t v23 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"IPv6:AllAddresses"];
    if (v23) {
      [v4 setObject:v23 forKey:@"IPv6:AllAddresses"];
    }
    uint64_t v24 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"IPv6:MulticastAddresses"];

    if (v24) {
      [v4 setObject:v24 forKey:@"IPv6:MulticastAddresses"];
    }
    id v25 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"Thread:ChildTable:AsValMap"];

    if (v25) {
      [v4 setObject:v25 forKey:@"Thread:ChildTable:AsValMap"];
    }
    uint64_t v26 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"Thread:RouterTable:AsValMap"];

    if (v26) {
      [v4 setObject:v26 forKey:@"Thread:RouterTable:AsValMap"];
    }
    size_t v27 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"Thread:NeighborTable:AsValMap"];

    if (v27) {
      [v4 setObject:v27 forKey:@"Thread:NeighborTable:AsValMap"];
    }
    id v28 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"Stat:Long"];

    if (v28) {
      [v4 setObject:v28 forKey:@"Stat:Long"];
    }
    id v29 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"OpenThread:MsgBufferCounters"];

    if (v29) {
      [v4 setObject:v29 forKey:@"OpenThread:MsgBufferCounters"];
    }
    uint64_t v30 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"Thread:Services"];

    if (v30) {
      [v4 setObject:v30 forKey:@"Thread:Services"];
    }
    int v31 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"IPv6:Routes"];

    if (v31) {
      [v4 setObject:v31 forKey:@"IPv6:Routes"];
    }
    xpc_object_t v32 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"NCP:Counter:AllMac:AsValMap"];

    if (v32) {
      [v4 setObject:v32 forKey:@"NCP:Counter:AllMac:AsValMap"];
    }
    char v33 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"NCP:Counter:AllIPv6:AsValMap"];

    if (v33) {
      [v4 setObject:v33 forKey:@"NCP:Counter:AllIPv6:AsValMap"];
    }
    id v34 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"vendor:radio:counters:asvalmap"];

    if (v34) {
      [v4 setObject:v34 forKey:@"vendor:radio:counters:asvalmap"];
    }
    char v35 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"NCP:Counter:Thread:Mle:AsValMap"];

    if (v35) {
      [v4 setObject:v35 forKey:@"NCP:Counter:Thread:Mle:AsValMap"];
    }
    xpc_object_t v36 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"Thread:Leader:Services:AsValMap"];

    if (v36) {
      [v4 setObject:v36 forKey:@"Thread:Leader:Services:AsValMap"];
    }
    id v37 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"vendor:ncp:state:dump"];

    if (v37) {
      [v4 setObject:v37 forKey:@"vendor:ncp:state:dump"];
    }
    [(ThreadNetworkManagerInstance *)self getNCPPropertyAsString:"Thread:Leader:NetworkData"];
    std::string::operator=[abi:ne180100]((uint64_t)v58, (long long *)__p);
    if (v57 < 0) {
      operator delete(__p[0]);
    }
    if (v59 >= 0) {
      int v38 = v58;
    }
    else {
      int v38 = (void **)v58[0];
    }
    uint64_t v39 = +[NSString stringWithUTF8String:v38];
    [v4 setObject:v39 forKeyedSubscript:@"Thread:Leader:NetworkData"];

    [(ThreadNetworkManagerInstance *)self getNCPPropertyAsString:"Thread:Leader:StableNetworkData"];
    std::string::operator=[abi:ne180100]((uint64_t)v58, (long long *)__p);
    if (v57 < 0) {
      operator delete(__p[0]);
    }
    if (v59 >= 0) {
      uint64_t v40 = v58;
    }
    else {
      uint64_t v40 = (void **)v58[0];
    }
    int v41 = +[NSString stringWithUTF8String:v40];
    [v4 setObject:v41 forKeyedSubscript:@"Thread:Leader:StableNetworkData"];

    [(ThreadNetworkManagerInstance *)self getNCPPropertyAsString:"Thread:StableNetworkData"];
    std::string::operator=[abi:ne180100]((uint64_t)v58, (long long *)__p);
    if (v57 < 0) {
      operator delete(__p[0]);
    }
    if (v59 >= 0) {
      v42 = v58;
    }
    else {
      v42 = (void **)v58[0];
    }
    dispatch_time_t v43 = +[NSString stringWithUTF8String:v42];
    [v4 setObject:v43 forKeyedSubscript:@"Thread:StableNetworkData"];

    [(ThreadNetworkManagerInstance *)self getNCPPropertyAsString:"Thread:NetworkData"];
    std::string::operator=[abi:ne180100]((uint64_t)v58, (long long *)__p);
    if (v57 < 0) {
      operator delete(__p[0]);
    }
    if (v59 >= 0) {
      xpc_object_t v44 = v58;
    }
    else {
      xpc_object_t v44 = (void **)v58[0];
    }
    intptr_t v45 = +[NSString stringWithUTF8String:v44];
    [v4 setObject:v45 forKeyedSubscript:@"Thread:NetworkData"];

    size_t v46 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"Thread:OffMeshRoutes"];

    if (v46) {
      [v4 setObject:v46 forKey:@"Thread:OffMeshRoutes"];
    }
    uint64_t v47 = [(ThreadNetworkManagerInstance *)self getNCPPropertyInDict:"Thread:OnMeshPrefixes"];

    if (v47) {
      [v4 setObject:v47 forKey:@"Thread:OnMeshPrefixes"];
    }
    [(ThreadNetworkManagerInstance *)self getNCPPropertyAsString:"NCP:TXPower"];
    std::string::operator=[abi:ne180100]((uint64_t)v58, (long long *)__p);
    if (v57 < 0) {
      operator delete(__p[0]);
    }
    if (v59 >= 0) {
      uint64_t v48 = v58;
    }
    else {
      uint64_t v48 = (void **)v58[0];
    }
    uint64_t v49 = +[NSString stringWithUTF8String:v48];
    [v4 setObject:v49 forKeyedSubscript:@"NCP:TXPower"];

    [(ThreadNetworkManagerInstance *)self getNCPPropertyAsString:"vendor:current:power:info"];
    std::string::operator=[abi:ne180100]((uint64_t)v58, (long long *)__p);
    if (v57 < 0) {
      operator delete(__p[0]);
    }
    if (v59 >= 0) {
      uint64_t v50 = v58;
    }
    else {
      uint64_t v50 = (void **)v58[0];
    }
    uint64_t v51 = +[NSString stringWithUTF8String:v50];
    [v4 setObject:v51 forKeyedSubscript:@"vendor:current:power:info"];

    [(ThreadNetworkManagerInstance *)self getNCPPropertyAsString:"TPC:Mode"];
    std::string::operator=[abi:ne180100]((uint64_t)v58, (long long *)__p);
    if (v57 < 0) {
      operator delete(__p[0]);
    }
    if (v59 >= 0) {
      uint64_t v52 = v58;
    }
    else {
      uint64_t v52 = (void **)v58[0];
    }
    uint64_t v53 = +[NSString stringWithUTF8String:v52];
    [v4 setObject:v53 forKeyedSubscript:@"TPC:Mode"];
  }
  id v54 = v4;
  if (v59 < 0) {
    operator delete(v58[0]);
  }

  return v54;
}

- (id)getNCPPreferredNetworkInDict:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  dispatch_queue_t v5 = [v3 network];
  unsigned int v6 = [v5 extendedPANID];
  if (v6)
  {
    unsigned int v7 = [v3 network];
    id v8 = [v7 extendedPANID];
    BOOL v9 = (ctu *)[v8 bytes];
    char v10 = [v3 network];
    int v11 = [v10 extendedPANID];
    id v12 = [v11 length];
    ctu::hex((uint64_t *)v123, v9, v12, v13);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(v123, "(unknown)");
  }

  uint64_t v14 = [v3 borderAgent];
  uint64_t v15 = [v14 discriminatorId];
  if (v15)
  {
    uint64_t v16 = [v3 borderAgent];
    id v17 = [v16 discriminatorId];
    uint64_t v18 = (ctu *)[v17 bytes];
    int v19 = [v3 borderAgent];
    uint64_t v20 = [v19 discriminatorId];
    id v21 = [v20 length];
    ctu::hex((uint64_t *)v121, v18, v21, v22);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(v121, "(unknown)");
  }

  xpc_object_t v23 = [v3 credentialsDataSet];
  uint64_t v24 = [v23 dataSetArray];
  if (v24)
  {
    id v25 = [v3 credentialsDataSet];
    id v26 = [v25 dataSetArray];
    size_t v27 = (ctu *)[v26 bytes];
    id v28 = [v3 credentialsDataSet];
    id v29 = [v28 dataSetArray];
    id v30 = [v29 length];
    ctu::hex((uint64_t *)v119, v27, v30, v31);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(v119, "(unknown)");
  }

  xpc_object_t v32 = [v3 uniqueIdentifier];

  char v33 = &exit_ptr;
  if (v32)
  {
    id v34 = [v3 uniqueIdentifier];
    id v35 = [v34 UUIDString];
    xpc_object_t v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", [v35 UTF8String], context);

    [v4 setObject:v36 forKey:@"UUID"];
  }
  else
  {
    xpc_object_t v36 = 0;
  }
  id v37 = v121;
  if (v122 < 0) {
    id v37 = (void **)v121[0];
  }
  int v38 = +[NSString stringWithFormat:@"%s", v37];

  [v4 setObject:v38 forKey:@"borderAgentDiscriminatorID"];
  uint64_t v39 = [v3 network];
  uint64_t v40 = [v39 networkName];
  int v41 = v40;
  if (!v40) {
    uint64_t v40 = @"(unknown)";
  }
  v42 = +[NSString stringWithFormat:@"%s", [(__CFString *)v40 UTF8String]];

  [v4 setObject:v42 forKey:@"networkName"];
  dispatch_time_t v43 = v123;
  if (v124 < 0) {
    dispatch_time_t v43 = (void **)v123[0];
  }
  xpc_object_t v44 = +[NSString stringWithFormat:@"%s", v43];

  [v4 setObject:v44 forKey:@"xpanid"];
  intptr_t v45 = [v3 credentials];
  size_t v46 = [v45 PANID];

  if (v46)
  {
    uint64_t v47 = [v3 credentials];
    id v48 = [v47 PANID];
    uint64_t v49 = (ctu *)[v48 bytes];
    uint64_t v50 = [v3 credentials];
    uint64_t v51 = [v50 PANID];
    id v52 = [v51 length];
    ctu::hex((uint64_t *)__p, v49, v52, v53);
    if (v118 >= 0) {
      id v54 = __p;
    }
    else {
      id v54 = (void **)__p[0];
    }
    id v55 = +[NSString stringWithFormat:@"%s", v54];

    char v33 = &exit_ptr;
    if (v118 < 0) {
      operator delete(__p[0]);
    }

    [v4 setObject:v55 forKey:@"panid"];
  }
  else
  {
    id v55 = v44;
  }
  id v56 = [v3 credentials];
  char v57 = [v56 masterKey];

  if (v57)
  {
    int v58 = v33[325];
    char v59 = [v3 credentials];
    id v60 = [v59 masterKey];
    std::string v61 = (ctu *)[v60 bytes];
    dispatch_time_t v62 = [v3 credentials];
    id v63 = [v62 masterKey];
    id v64 = [v63 length];
    ctu::hex((uint64_t *)__p, v61, v64, v65);
    if (v118 >= 0) {
      uint64_t v66 = __p;
    }
    else {
      uint64_t v66 = (void **)__p[0];
    }
    uint64_t v67 = objc_msgSend(v58, "stringWithFormat:", @"%{sensitive}s", v66);

    char v33 = &exit_ptr;
    if (v118 < 0) {
      operator delete(__p[0]);
    }

    [v4 setObject:v67 forKey:@"masterKey"];
  }
  else
  {
    uint64_t v67 = v55;
  }
  uint64_t v68 = [v3 credentials];
  uint64_t v69 = [v68 PSKc];

  if (v69)
  {
    uint64_t v70 = v33[325];
    uint64_t v71 = [v3 credentials];
    id v72 = [v71 PSKc];
    unint64_t v73 = (ctu *)[v72 bytes];
    int v74 = [v3 credentials];
    v75 = [v74 PSKc];
    id v76 = [v75 length];
    ctu::hex((uint64_t *)__p, v73, v76, v77);
    if (v118 >= 0) {
      size_t v78 = __p;
    }
    else {
      size_t v78 = (void **)__p[0];
    }
    unsigned int v79 = objc_msgSend(v70, "stringWithFormat:", @"%{sensitive}s", v78);

    char v33 = &exit_ptr;
    if (v118 < 0) {
      operator delete(__p[0]);
    }

    [v4 setObject:v79 forKey:@"PSKc"];
  }
  else
  {
    unsigned int v79 = v67;
  }
  int v80 = [v3 credentials];
  int v81 = [v80 passPhrase];

  if (v81)
  {
    uint64_t v82 = v33[325];
    v83 = [v3 credentials];
    id v84 = [v83 passPhrase];
    uint64_t v85 = objc_msgSend(v82, "stringWithFormat:", @"%s", objc_msgSend(v84, "UTF8String"));

    unsigned int v79 = (void *)v85;
    [v4 setObject:v85 forKey:@"passPhrase"];
  }
  int v86 = [v3 credentials];
  unsigned int v87 = [v86 channel];
  int v88 = kTHNetworkChannel_None;

  if (v87 == v88)
  {
    int v89 = &exit_ptr;
  }
  else
  {
    int v89 = &exit_ptr;
    dispatch_time_t v90 = [v3 credentials];
    uint64_t v91 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%u", [v90 channel]);

    unsigned int v79 = (void *)v91;
    [v4 setObject:v91 forKey:@"channel"];
  }
  char v92 = v119;
  if (v120 < 0) {
    char v92 = (void **)v119[0];
  }
  uint64_t v93 = objc_msgSend(v89[325], "stringWithFormat:", @"%{sensitive}s", v92);

  [v4 setObject:v93 forKey:@"datasetCredentials"];
  uint64_t v94 = [v3 credentials];
  uint64_t v95 = [v94 userInfo];

  if (v95)
  {
    uint64_t v96 = v89[325];
    uint64_t v97 = [v3 credentials];
    id v98 = [v97 userInfo];
    uint64_t v99 = objc_msgSend(v96, "stringWithFormat:", @"%s", objc_msgSend(v98, "UTF8String"));

    [v4 setObject:v99 forKey:@"datasetUserInfo"];
  }
  else
  {
    uint64_t v99 = v93;
  }
  char v100 = [v3 keychainAccessGroup];

  if (v100)
  {
    std::string v101 = v89[325];
    id v102 = [v3 keychainAccessGroup];
    uint64_t v103 = objc_msgSend(v101, "stringWithFormat:", @"%s", objc_msgSend(v102, "UTF8String"));

    uint64_t v99 = (void *)v103;
    [v4 setObject:v103 forKey:@"accessGroup"];
  }
  id v104 = [v3 creationDate];

  if (v104)
  {
    id v105 = v89[325];
    id v106 = [v3 creationDate];
    id v107 = [v106 description];
    uint64_t v108 = objc_msgSend(v105, "stringWithFormat:", @"%s", objc_msgSend(v107, "UTF8String"));

    uint64_t v99 = (void *)v108;
    [v4 setObject:v108 forKey:@"createdOn"];
  }
  int v109 = [v3 lastModificationDate];

  if (v109)
  {
    v110 = v89[325];
    uint64_t v111 = [v3 lastModificationDate];
    id v112 = [v111 description];
    uint64_t v113 = objc_msgSend(v110, "stringWithFormat:", @"%s", objc_msgSend(v112, "UTF8String"));

    uint64_t v99 = (void *)v113;
    [v4 setObject:v113 forKey:@"lastModifiedOn"];
  }
  id v114 = v4;
  if (v120 < 0) {
    operator delete(v119[0]);
  }
  if (v122 < 0) {
    operator delete(v121[0]);
  }
  if (v124 < 0) {
    operator delete(v123[0]);
  }

  return v114;
}

- (void)captureNCPStateInformation:(id *)a3
{
  id v8 = *a3;
  id v4 = [(ThreadNetworkManagerInstance *)self getNCPStatusInDict];
  if (v4) {
    [v8 setObject:v4 forKey:@"NCP Status"];
  }
  dispatch_queue_t v5 = [(ThreadNetworkManagerInstance *)self getPreferredNetwork];
  if (v5)
  {
    unsigned int v6 = [(ThreadNetworkManagerInstance *)self getNCPPreferredNetworkInDict:v5];
    if (v6) {
      [v8 setObject:v6 forKey:@"NCP PreferredNetwork"];
    }
  }
  unsigned int v7 = [(ThreadNetworkManagerInstance *)self getRCPProperties];
  if (v7) {
    [v8 setObject:v7 forKey:@"RCP Properties"];
  }
}

- (void)initSyslogDumpInfo
{
  v2 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "TNM: initSyslogDumpInfo : Starting", buf, 2u);
  }

  id v3 = dispatch_get_global_queue(0, 0);
  os_state_add_handler();
}

_DWORD *__68__ThreadNetworkManagerInstance_syslog_extension__initSyslogDumpInfo__block_invoke(uint64_t a1)
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  if (!v3)
  {
    unsigned int v6 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "TNM: state info dictionary is NULL", buf, 2u);
    }
    char v10 = 0;
    goto LABEL_22;
  }
  id v4 = v3;
  dispatch_queue_t v5 = *(void **)(a1 + 32);
  id v21 = v4;
  [v5 captureNCPStateInformation:&v21];
  unsigned int v6 = v21;

  id v20 = 0;
  unsigned int v7 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:200 options:0 error:&v20];
  id v8 = v20;
  if (v8)
  {
    BOOL v9 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::string buf = 138412290;
      id v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Error serializing dictionary for State Capture: %@", buf, 0xCu);
    }
    char v10 = 0;
LABEL_21:

LABEL_22:
    return v10;
  }
  result = [v7 length];
  size_t v12 = (size_t)result;
  size_t v13 = (size_t)(result + 50);
  if ((unint64_t)result < 0xFFFFFFFFFFFFFF38)
  {
    result = malloc_type_calloc(1uLL, v13, 0x802FD364uLL);
    char v10 = result;
    if (!result)
    {
LABEL_19:
      BOOL v9 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Done logging NCP state", buf, 2u);
      }
      goto LABEL_21;
    }
    if (v13 >= 4)
    {
      _DWORD *result = 1;
      if ((v13 & 0xFFFFFFFFFFFFFFFCLL) != 4)
      {
        result[1] = v12;
        uint64_t v14 = [@"NCP::State Information" dataUsingEncoding:4];
        uint64_t v15 = v14;
        if (v14)
        {
          id v16 = v14;
          id v17 = [v16 bytes];
          id v18 = [v16 length];
          if ((unint64_t)v18 >= 0x3F) {
            size_t v19 = 63;
          }
          else {
            size_t v19 = (size_t)v18;
          }
          memcpy(v10 + 34, v17, v19);
        }
        memcpy(v10 + 50, [v7 bytes], v12);

        goto LABEL_19;
      }
    }
    __break(1u);
  }
  __break(0x5500u);
  return result;
}

- (id)init:(id)a3 statsQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ThreadNetworkManagerInstance;
  BOOL v9 = [(ThreadNetworkManagerInstance *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fQueue, a3);
    objc_storeStrong(p_isa + 21, a4);
    [p_isa createDriverInterface:v7];
  }

  return p_isa;
}

- (unint64_t)getCountOfAvailableNetworksForCommissioning
{
  objc_initWeak(&location, self);
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  BAFinder = self->_BAFinder;
  if (!BAFinder)
  {
    dispatch_queue_t v5 = (ThreadNetworkfinder *)[(id)objc_opt_new() init];
    unsigned int v6 = self->_BAFinder;
    self->_BAFinder = v5;

    BAFinder = self->_BAFinder;
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __75__ThreadNetworkManagerInstance_getCountOfAvailableNetworksForCommissioning__block_invoke;
  v12[3] = &unk_10049C208;
  objc_copyWeak(&v14, &location);
  id v7 = v3;
  size_t v13 = v7;
  [(ThreadNetworkfinder *)BAFinder startScan:v12 queue:&_dispatch_main_q timeInSec:5];
  id v8 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315138;
    id v17 = "-[ThreadNetworkManagerInstance getCountOfAvailableNetworksForCommissioning]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s : Finding networks to commission...", buf, 0xCu);
  }

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  unint64_t v9 = [(ThreadNetworkfinder *)self->_BAFinder findNWs];
  char v10 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    id v17 = "-[ThreadNetworkManagerInstance getCountOfAvailableNetworksForCommissioning]";
    __int16 v18 = 2048;
    unint64_t v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s : Found networks : %lu", buf, 0x16u);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v9;
}

void __75__ThreadNetworkManagerInstance_getCountOfAvailableNetworksForCommissioning__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained[9] stopScan];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)isAudioNoThreadFeatureEnabled
{
  uint64_t RcpHostContext = (RcpHostContext *)RcpHostContext::GetRcpHostContext((RcpHostContext *)self);

  return RcpHostContext::isAudioNoThreadFeatureEnabled(RcpHostContext);
}

- (BOOL)isThreadAlwaysOnFeatureEnabled
{
  uint64_t RcpHostContext = (RcpHostContext *)RcpHostContext::GetRcpHostContext((RcpHostContext *)self);

  return RcpHostContext::isThreadAlwaysOnFeatureEnabled(RcpHostContext);
}

- (void)createDriverInterface:(id)a3
{
  id v60 = a3;
  id v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "TNM creating DriverInterface", buf, 2u);
  }

  dispatch_queue_t v5 = [[CtrInternalClient alloc] init:"TNM-Internal"];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  self->_CtrInternalClientPtr = v5;

  id v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  id v8 = (OS_dispatch_queue *)dispatch_queue_create("wpantund.TNMScan.Queue", v7);
  tnm_scan_queue = self->_tnm_scan_queue;
  self->_tnm_scan_queue = v8;

  char v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  int v11 = (OS_dispatch_queue *)dispatch_queue_create("wpantund.TNMNodeTypeChange.Queue", v10);
  tnmNodeTypeChangeQueue = self->_tnmNodeTypeChangeQueue;
  self->_tnmNodeTypeChangeQueue = v11;

  size_t v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  id v14 = (OS_dispatch_queue *)dispatch_queue_create("wpantund.TNMWedStatusChange.Queue", v13);
  tnmWedStatusChangeQueue = self->_tnmWedStatusChangeQueue;
  self->_tnmWedStatusChangeQueue = v14;

  id v16 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Initializing srp_mdns_proxyd interface", buf, 2u);
  }

  srputil_srp_mdns_proxyd_interface_init();
  unsigned int v17 = [(ThreadNetworkManagerInstance *)self getDefaultChildNode];
  __int16 v18 = "sleepy-end-device";
  if (v17) {
    __int16 v18 = "synchronized-sleepy-end-device";
  }
  self->_defaultChildNode = v18;
  unint64_t v19 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    defaultChildNode = self->_defaultChildNode;
    *(_DWORD *)std::string buf = 136315138;
    id v112 = defaultChildNode;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Init Default Child Node = %s", buf, 0xCu);
  }

  self->_lastTimeInLeaderRole = 0;
  [(ThreadNetworkManagerInstance *)self resetThreadSessionMetrics];
  int IntValue = getIntValue("lastHostConfiguredChannel");
  if (IntValue) {
    unsigned __int8 v22 = IntValue;
  }
  else {
    unsigned __int8 v22 = 25;
  }
  self->_lastHostConfiguredChannel = v22;
  self->_prevKnownNCPState = 0;
  self->_lastKnownNCPState = 0;
  self->_lastIsLeaderThirdParty = 1;
  objc_initWeak(&location, self);
  if ([(ThreadNetworkManagerInstance *)self initializeKeyChainStore])
  {
    id v23 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance createDriverInterface:]();
    }
  }
  std::string v61 = objc_alloc_init(ThreadNetworkManagerSelfHealHandler);
  uint64_t v24 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v108, "ActiveDataSetChanged");
  v106[0] = _NSConcreteStackBlock;
  v106[1] = 3221225472;
  v106[2] = __54__ThreadNetworkManagerInstance_createDriverInterface___block_invoke;
  v106[3] = &unk_10049BFE8;
  objc_copyWeak(&v107, &location);
  id v25 = v60;
  id v105 = v25;
  [(CtrInternalClient *)v24 setEventHandler:v108 InternalClientEventBlock:v106 dqueue:&v105];
  id v26 = v105;
  id v105 = 0;

  if (v109 < 0) {
    operator delete(v108[0]);
  }
  size_t v27 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v103, "NCP:State");
  v101[0] = _NSConcreteStackBlock;
  v101[1] = 3221225472;
  v101[2] = __54__ThreadNetworkManagerInstance_createDriverInterface___block_invoke_24;
  v101[3] = &unk_10049BFE8;
  objc_copyWeak(&v102, &location);
  id v28 = v25;
  id v100 = v28;
  [(CtrInternalClient *)v27 setEventHandler:v103 InternalClientEventBlock:v101 dqueue:&v100];
  id v29 = v100;
  id v100 = 0;

  if (v104 < 0) {
    operator delete(v103[0]);
  }
  id v30 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(__p, "Network:NodeType");
  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472;
  v96[2] = __54__ThreadNetworkManagerInstance_createDriverInterface___block_invoke_26;
  v96[3] = &unk_10049BFE8;
  objc_copyWeak(&v97, &location);
  uint64_t v95 = self->_tnmNodeTypeChangeQueue;
  [(CtrInternalClient *)v30 setEventHandler:__p InternalClientEventBlock:v96 dqueue:&v95];
  unint64_t v31 = v95;
  uint64_t v95 = 0;

  if (v99 < 0) {
    operator delete(__p[0]);
  }
  xpc_object_t v32 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v93, "coex:rcp2:btwifi:load");
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = __54__ThreadNetworkManagerInstance_createDriverInterface___block_invoke_29;
  v91[3] = &unk_10049BFE8;
  objc_copyWeak(&v92, &location);
  id v33 = v28;
  id v90 = v33;
  [(CtrInternalClient *)v32 setEventHandler:v93 InternalClientEventBlock:v91 dqueue:&v90];
  id v34 = v90;
  id v90 = 0;

  if (v94 < 0) {
    operator delete(v93[0]);
  }
  id v35 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v88, "bt_state_change");
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = __54__ThreadNetworkManagerInstance_createDriverInterface___block_invoke_31;
  v86[3] = &unk_10049BFE8;
  objc_copyWeak(&v87, &location);
  id v36 = v33;
  id v85 = v36;
  [(CtrInternalClient *)v35 setEventHandler:v88 InternalClientEventBlock:v86 dqueue:&v85];
  id v37 = v85;
  id v85 = 0;

  if (v89 < 0) {
    operator delete(v88[0]);
  }
  if ([(ThreadNetworkManagerInstance *)self isThreadAlwaysOnFeatureEnabled])
  {
    int v38 = self->_CtrInternalClientPtr;
    std::string::basic_string[abi:ne180100]<0>(v83, "ap_state");
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = __54__ThreadNetworkManagerInstance_createDriverInterface___block_invoke_35;
    v81[3] = &unk_10049BFE8;
    objc_copyWeak(&v82, &location);
    id v80 = v36;
    [(CtrInternalClient *)v38 setEventHandler:v83 InternalClientEventBlock:v81 dqueue:&v80];
    id v39 = v80;
    id v80 = 0;

    if (v84 < 0) {
      operator delete(v83[0]);
    }
    objc_destroyWeak(&v82);
  }
  uint64_t v40 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v78, "bt_airpod_esco");
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = __54__ThreadNetworkManagerInstance_createDriverInterface___block_invoke_37;
  v76[3] = &unk_10049BFE8;
  objc_copyWeak(&v77, &location);
  id v41 = v36;
  id v75 = v41;
  [(CtrInternalClient *)v40 setEventHandler:v78 InternalClientEventBlock:v76 dqueue:&v75];
  id v42 = v75;
  id v75 = 0;

  if (v79 < 0) {
    operator delete(v78[0]);
  }
  dispatch_time_t v43 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v73, "router_mode_safe_timeout");
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = __54__ThreadNetworkManagerInstance_createDriverInterface___block_invoke_41;
  v71[3] = &unk_10049BFE8;
  objc_copyWeak(&v72, &location);
  id v44 = v41;
  id v70 = v44;
  [(CtrInternalClient *)v43 setEventHandler:v73 InternalClientEventBlock:v71 dqueue:&v70];
  id v45 = v70;
  id v70 = 0;

  if (v74 < 0) {
    operator delete(v73[0]);
  }
  size_t v46 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v68, "Beacon");
  uint64_t v67 = self->_tnm_scan_queue;
  [(CtrInternalClient *)v46 setEventHandler:v68 InternalClientEventBlock:&__block_literal_global_11 dqueue:&v67];
  uint64_t v47 = v67;
  uint64_t v67 = 0;

  if (v69 < 0) {
    operator delete(v68[0]);
  }
  id v48 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v65, "NCP:Reset");
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = __54__ThreadNetworkManagerInstance_createDriverInterface___block_invoke_46;
  v63[3] = &unk_10049BFE8;
  objc_copyWeak(&v64, &location);
  id v49 = v44;
  id v62 = v49;
  [(CtrInternalClient *)v48 setEventHandler:v65 InternalClientEventBlock:v63 dqueue:&v62];
  id v50 = v62;
  id v62 = 0;

  if (v66 < 0) {
    operator delete(v65[0]);
  }
  [(ThreadNetworkManagerInstance *)self registerStateMachineWedEventHandlers];
  [(ThreadNetworkManagerInstance *)self getNCPState:1];
  [(ThreadNetworkManagerInstance *)self getNCPChannel];
  int v51 = isNetworkConnected();
  id v52 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 67109120;
    LODWORD(v112) = v51;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "WiFi Status is: %d", buf, 8u);
  }

  unint64_t v53 = [(ThreadNetworkManagerInstance *)self getHardwareAddress];
  hwAddr = self->_hwAddr;
  self->_hwAddr = v53;

  id v55 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
  {
    id v56 = self->_hwAddr;
    *(_DWORD *)std::string buf = 136315395;
    id v112 = "-[ThreadNetworkManagerInstance createDriverInterface:]";
    __int16 v113 = 2117;
    id v114 = v56;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "%s : HW Address of this device is %{sensitive}@, \n", buf, 0x16u);
  }

  char v57 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
  {
    deviceName = self->_deviceName;
    *(_DWORD *)std::string buf = 136315394;
    id v112 = "-[ThreadNetworkManagerInstance createDriverInterface:]";
    __int16 v113 = 2112;
    id v114 = deviceName;
    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "%s : Current Device Name : %@", buf, 0x16u);
  }

  [(ThreadNetworkManagerInstance *)self setLogTimestampBase];
  [(ThreadNetworkManagerInstance *)self initSyslogDumpInfo];
  *(_WORD *)&self->_waitForSync = 0;
  [(ThreadNetworkManagerSelfHealHandler *)v61 initSelfHealThreadNetworkTimer];
  if ([(ThreadNetworkManagerInstance *)self getThreadSessionStatus]) {
    [(ThreadNetworkManagerInstance *)self updateThreadSessionStartTime];
  }
  [(ThreadNetworkManagerInstance *)self configureRCP2PeriodicEvents];
  [(ThreadNetworkManagerInstance *)self getDaemonAndVendorVersions];
  objc_destroyWeak(&v64);
  objc_destroyWeak(&v72);
  objc_destroyWeak(&v77);
  objc_destroyWeak(&v87);
  objc_destroyWeak(&v92);
  objc_destroyWeak(&v97);
  objc_destroyWeak(v59);
  objc_destroyWeak(&v107);

  objc_destroyWeak(&location);
}

void __54__ThreadNetworkManagerInstance_createDriverInterface___block_invoke(uint64_t a1)
{
  std::string::basic_string[abi:ne180100]<0>(buf, "Commond is successful");
  int v13 = 0;
  *(_OWORD *)id v14 = *(_OWORD *)buf;
  uint64_t v15 = *(void *)&buf[16];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_semaphore_t v3 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "kWPANTUNDEvent_ThreadNetwork_ActiveDataSetChanged setEventHandler \n", buf, 2u);
  }

  if (WeakRetained
    && WeakRetained[8] == 8
    && [WeakRetained updatePreferredNetworkForDatasetChange])
  {
    id v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance createDriverInterface:]_block_invoke";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 196;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:%d: Successfully updated the keychain", buf, 0x12u);
    }

    uint64_t v12 = 0;
    dispatch_queue_t v5 = [WeakRetained CtrInternalClientPtr];
    std::string::basic_string[abi:ne180100]<0>(__p, "Thread:ActiveDataset:Bytes");
    if (v5) {
      [v5 getProperty:__p output:&v12];
    }
    else {
      memset(buf, 0, 32);
    }
    int v6 = *CtrXPC::Result::operator=(&v13, (uint64_t)buf);
    if ((char)buf[31] < 0) {
      operator delete(*(void **)&buf[8]);
    }
    if (v11 < 0) {
      operator delete(__p[0]);
    }

    if (v6)
    {
      id v7 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __54__ThreadNetworkManagerInstance_createDriverInterface___block_invoke_cold_1();
      }
    }
    else
    {
      id v7 = [WeakRetained CtrInternalClientPtr];
      std::string::basic_string[abi:ne180100]<0>(v8, "PreferredNetworkUpdated");
      [v7 signal_property_changed:v8 value:&v12];
      if (v9 < 0) {
        operator delete(v8[0]);
      }
    }

    if (v12) {
      (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
    }
  }

  if (SHIBYTE(v15) < 0) {
    operator delete(v14[0]);
  }
}

void __54__ThreadNetworkManagerInstance_createDriverInterface___block_invoke_24(uint64_t a1, const boost::any *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string __p = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "kWPANTUNDEvent_NCPState setEventHandler \n", __p, 2u);
  }

  if (WeakRetained)
  {
    WeakRetained[7] = WeakRetained[8];
    any_to_string(a2, (uint64_t)__p);
    WeakRetained[8] = nl::wpantund::string_to_ncp_state(__p);
    if (SHIBYTE(v16) < 0) {
      operator delete(*(void **)__p);
    }
    dispatch_queue_t v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = WeakRetained[7];
      int v7 = WeakRetained[8];
      *(_DWORD *)std::string __p = 136315650;
      *(void *)&__p[4] = "NCP:State";
      __int16 v13 = 1024;
      int v14 = v6;
      __int16 v15 = 1024;
      int v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s TNM-Internal got event Data: NCP State: %d -> %d\n", __p, 0x18u);
    }

    if (WeakRetained[7] != 8 && WeakRetained[8] == 8)
    {
      id v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = WeakRetained[7];
        int v10 = WeakRetained[8];
        *(_DWORD *)std::string __p = 136315650;
        *(void *)&__p[4] = "NCP:State";
        __int16 v13 = 1024;
        int v14 = v9;
        __int16 v15 = 1024;
        int v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Calling notifyWedUnsolictedDisconnect... NCP State: %d -> %d\n", __p, 0x18u);
      }

      [WeakRetained notifyWedUnsolictedDisconnect];
    }
    [WeakRetained getNCPState:0];
    srputil_set_ncp_state(WeakRetained[8]);
    int v11 = WeakRetained[8];
    if (v11 == 1)
    {
      postFollowUpNotification();
      int v11 = WeakRetained[8];
    }
    if (v11 == 8 || v11 == 4) {
      clearFollowUpNotification();
    }
    [WeakRetained checkAndResumeNW];
  }
}

void __54__ThreadNetworkManagerInstance_createDriverInterface___block_invoke_26(uint64_t a1, const boost::any *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "kWPANTUNDEvent_NetworkNodeType setEventHandler \n", (uint8_t *)v16, 2u);
  }

  if (WeakRetained)
  {
    nl::wpantund::node_type_to_string(*((_DWORD *)WeakRetained + 10), &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    std::string::basic_string[abi:ne180100]<0>(v16, (char *)p_p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    any_to_string(a2, (uint64_t)&__p);
    int v6 = nl::wpantund::string_to_node_type((char *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (*((_DWORD *)WeakRetained + 9) == 7 && v6 != 7)
    {
      *((void *)WeakRetained + 17) = getSystemUptimeInSec();
      int v7 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        std::string::size_type v8 = *((void *)WeakRetained + 17);
        LODWORD(__p.__r_.__value_.__l.__data_) = 136315394;
        *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)"-[ThreadNetworkManagerInstance createDriverInterface:]_block_invoke";
        WORD2(__p.__r_.__value_.__r.__words[1]) = 2048;
        *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Device was last in Leader role at: %llu ", (uint8_t *)&__p, 0x16u);
      }
    }
    *((_DWORD *)WeakRetained + 9) = v6;
    [WeakRetained notifyOnNodeStatusChange];
    any_to_string(a2, (uint64_t)&__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int v9 = &__p;
    }
    else {
      int v9 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    int v10 = +[NSString stringWithUTF8String:v9];
    if (v17 >= 0) {
      int v11 = v16;
    }
    else {
      int v11 = (void **)v16[0];
    }
    uint64_t v12 = +[NSString stringWithUTF8String:v11];
    [WeakRetained updateThreadSessionmetrics:v10 previousNodeType:v12];

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v6) {
      *((_DWORD *)WeakRetained + 10) = v6;
    }
    __int16 v13 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = *((_DWORD *)WeakRetained + 9);
      int v15 = *((_DWORD *)WeakRetained + 10);
      LODWORD(__p.__r_.__value_.__l.__data_) = 136315650;
      *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)"Network:NodeType";
      WORD2(__p.__r_.__value_.__r.__words[1]) = 1024;
      *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = v14;
      WORD1(__p.__r_.__value_.__r.__words[2]) = 1024;
      HIDWORD(__p.__r_.__value_.__r.__words[2]) = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s TNM-Internal got event Data: Last known Node-Type-Value: %d, Last known valid Node-Type-Value: %d", (uint8_t *)&__p, 0x18u);
    }

    if (v17 < 0) {
      operator delete(v16[0]);
    }
  }
}

void __54__ThreadNetworkManagerInstance_createDriverInterface___block_invoke_29(uint64_t a1, uint64_t *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "kWPANTUNDEvent_BTWIFI_Load_Update setEventHandler \n", buf, 2u);
  }

  if (WeakRetained)
  {
    uint64_t v5 = *a2;
    if (*a2) {
      uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 24))(v5);
    }
    uint64_t v6 = v5;
    [WeakRetained getBTWifiLoadInfoEvent:&v6];
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
    }
  }
}

void __54__ThreadNetworkManagerInstance_createDriverInterface___block_invoke_31(uint64_t a1, const boost::any *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "kWPANTUNDEvent_BTStatusNotification setEventHandler \n", v10, 2u);
  }

  if (WeakRetained)
  {
    BOOL v5 = any_to_BOOL(a2);
    uint64_t v6 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = "DOWN";
      *(void *)&v10[4] = "bt_state_change";
      int v8 = WeakRetained[8];
      *(_DWORD *)int v10 = 136315650;
      if (v5) {
        int v7 = "UP";
      }
      *(_WORD *)&v10[12] = 2080;
      *(void *)&v10[14] = v7;
      __int16 v11 = 1024;
      int v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s TNM-Internal got event Data: BT Status is now: [%s] in State: [%d] \n", v10, 0x1Cu);
    }

    int v9 = WeakRetained[8];
    if (v5)
    {
      if (v9 != 4) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    if (v9 == 8 || v9 == 6)
    {
      objc_msgSend(WeakRetained, "incrementCounterThreadSessionStoppedDueToBluetoothOff", *(_OWORD *)v10);
LABEL_14:
      objc_msgSend(WeakRetained, "threadStop", *(void *)v10);
    }
  }
LABEL_15:
}

void __54__ThreadNetworkManagerInstance_createDriverInterface___block_invoke_35(uint64_t a1, const boost::any *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "kWPANTUNDEvent_APStateNotification setEventHandler \n", v10, 2u);
  }

  if (WeakRetained)
  {
    BOOL v5 = any_to_BOOL(a2);
    uint64_t v6 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = "DOWN";
      *(void *)&v10[4] = "bt_state_change";
      int v8 = WeakRetained[8];
      *(_DWORD *)int v10 = 136315650;
      if (v5) {
        int v7 = "UP";
      }
      *(_WORD *)&v10[12] = 2080;
      *(void *)&v10[14] = v7;
      __int16 v11 = 1024;
      int v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s TNM-Internal got event Data: AP Status is now: [%s] in State: [%d] \n", v10, 0x1Cu);
    }

    int v9 = WeakRetained[8];
    if (v5)
    {
      if (v9 == 4) {
        [WeakRetained threadStop];
      }
      objc_msgSend(WeakRetained, "noteTimeAPOn", *(_OWORD *)v10);
    }
    else
    {
      if (v9 == 8 || v9 == 6)
      {
        objc_msgSend(WeakRetained, "incrementCounterThreadSessionStoppedDueToAPOff", *(void *)v10, *(void *)&v10[8]);
        [WeakRetained threadStop];
      }
      objc_msgSend(WeakRetained, "generateAPLifeInfoMetrics", *(void *)v10);
    }
  }
}

void __54__ThreadNetworkManagerInstance_createDriverInterface___block_invoke_37(uint64_t a1, const boost::any *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "kWPANTUNDEvent_BTAirPodEscoNotification setEventHandler \n", v11, 2u);
  }

  if (WeakRetained)
  {
    BOOL v5 = any_to_BOOL(a2);
    uint64_t v6 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = "OFF";
      *(void *)&v11[4] = "bt_airpod_esco";
      int v8 = WeakRetained[8];
      *(_DWORD *)__int16 v11 = 136315650;
      if (v5) {
        int v7 = "ON";
      }
      *(_WORD *)&v11[12] = 2080;
      *(void *)&v11[14] = v7;
      __int16 v12 = 1024;
      int v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s BT Load, Audio detection: TNM-Internal got event Data: eSCO Status is now: [%s] in State: [%d] \n", v11, 0x1Cu);
    }

    int v9 = WeakRetained[8];
    if (v5)
    {
      if (v9 == 8 || v9 == 6)
      {
        int v10 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v11 = 136315138;
          *(void *)&v11[4] = "-[ThreadNetworkManagerInstance createDriverInterface:]_block_invoke";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s, BT Load, Audio detection: ThreadStop duo to airpod+eSCO\n", v11, 0xCu);
        }

        [WeakRetained incrementCounterThreadSessionStoppedDueToEscoOn];
        goto LABEL_15;
      }
    }
    else if (v9 == 4)
    {
LABEL_15:
      objc_msgSend(WeakRetained, "threadStop", *(_OWORD *)v11);
    }
  }
}

void __54__ThreadNetworkManagerInstance_createDriverInterface___block_invoke_41(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "router_mode_safe_timeout";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: EventHandler \n", (uint8_t *)&v7, 0xCu);
  }

  if (WeakRetained)
  {
    unsigned int v3 = [WeakRetained getPairingStatus];
    if (v3)
    {
      id v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315650;
        int v8 = "router_mode_safe_timeout";
        __int16 v9 = 1024;
        int v10 = router_mode_status_timer_m;
        __int16 v11 = 1024;
        unsigned int v12 = v3;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: TNM-Internal got event Data, but defering Thread Stop as pairing is ongoing: routerModeTime is %d, pairing status: %d\n", (uint8_t *)&v7, 0x18u);
      }
    }
    else if ([WeakRetained isThreadAlwaysOnFeatureEnabled])
    {
      BOOL v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315650;
        int v8 = "router_mode_safe_timeout";
        __int16 v9 = 1024;
        int v10 = router_mode_status_timer_m;
        __int16 v11 = 1024;
        unsigned int v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: TNM-Internal got event Data: routerModeTime is %d, pairing status: %d, SWITCHING THREAD ROLE NOW \n", (uint8_t *)&v7, 0x18u);
      }

      [WeakRetained handleRouterModeFailSafeTrigger];
    }
    else
    {
      uint64_t v6 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315650;
        int v8 = "router_mode_safe_timeout";
        __int16 v9 = 1024;
        int v10 = router_mode_status_timer_m;
        __int16 v11 = 1024;
        unsigned int v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: TNM-Internal got event Data: routerModeTime is %d, pairing status: %d, STOPPING THREAD NOW \n", (uint8_t *)&v7, 0x18u);
      }

      [WeakRetained threadStop];
    }
  }
}

void __54__ThreadNetworkManagerInstance_createDriverInterface___block_invoke_43(id a1, any a2)
{
  unsigned int v3 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "kWPANTUNDEvent_Beacon setEventHandler \n", (uint8_t *)v10, 2u);
  }

  boost::any_cast<std::map<std::string,boost::any>>((uint64_t *)a2.var0, (uint64_t)v10);
  std::string::basic_string[abi:ne180100]<0>(__p, "kWPANTUNDProperty_NetworkPANID");
  id v4 = std::map<std::string,boost::any>::operator[](v10, __p);
  unsigned __int16 v5 = any_to_uint64((const boost::any *)v4, 0);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v6 = scannedNetworkCount;
  if (scannedNetworkCount < 1) {
    goto LABEL_10;
  }
  uint64_t v7 = 0;
  char v8 = 0;
  do
  {
    if (v7 == 100) {
      goto LABEL_16;
    }
    v8 |= (unsigned __int16)scannedNetworks[v7++] == v5;
  }
  while (scannedNetworkCount != v7);
  if ((v8 & 1) == 0)
  {
LABEL_10:
    if (scannedNetworkCount <= 99)
    {
      ++scannedNetworkCount;
      if (v6 > 0x63) {
LABEL_16:
      }
        __break(0x5512u);
      scannedNetworks[v6] = v5;
      __int16 v9 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LODWORD(__p[0]) = 67109376;
        HIDWORD(__p[0]) = scannedNetworkCount;
        LOWORD(__p[1]) = 1024;
        *(_DWORD *)((char *)&__p[1] + 2) = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "TNM-Internal got new beacon(%d) with PANID: 0x%x", (uint8_t *)__p, 0xEu);
      }
    }
  }
  std::__tree<std::__value_type<std::string,boost::any>,std::__map_value_compare<std::string,std::__value_type<std::string,boost::any>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,boost::any>>>::~__tree((uint64_t)v10);
}

void __54__ThreadNetworkManagerInstance_createDriverInterface___block_invoke_46(uint64_t a1, const boost::any *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      any_to_string(a2, (uint64_t)__p);
      if (v7 >= 0) {
        unsigned __int16 v5 = __p;
      }
      else {
        unsigned __int16 v5 = (void **)__p[0];
      }
      *(_DWORD *)std::string buf = 136315394;
      __int16 v9 = "NCP:Reset";
      __int16 v10 = 2080;
      __int16 v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s TNM-Internal got Reset Event: %s\n", buf, 0x16u);
      if (v7 < 0) {
        operator delete(__p[0]);
      }
    }

    [WeakRetained setLogTimestampBase];
  }
}

- (BOOL)getThreadSessionStatus
{
  std::string::basic_string[abi:ne180100]<0>(__p, "Command error");
  int v12 = 0;
  long long v13 = *(_OWORD *)__p;
  uint64_t v14 = v10;
  uint64_t v11 = 0;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v7, "is_threadsession_on");
  if (CtrInternalClientPtr)
  {
    [CtrInternalClientPtr getProperty:v7 output:&v11];
  }
  else
  {
    *(_OWORD *)std::string __p = 0u;
    long long v10 = 0u;
  }
  int v4 = *CtrXPC::Result::operator=(&v12, (uint64_t)__p);
  if (SHIBYTE(v10) < 0) {
    operator delete(__p[1]);
  }
  if (v8 < 0)
  {
    operator delete(v7[0]);
    if (v4) {
      goto LABEL_8;
    }
  }
  else if (v4)
  {
LABEL_8:
    BOOL v5 = 0;
    goto LABEL_11;
  }
  BOOL v5 = any_to_BOOL((const boost::any *)&v11);
LABEL_11:
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  if (SHIBYTE(v14) < 0) {
    operator delete((void *)v13);
  }
  return v5;
}

- (BOOL)getBTAudioCallStatus
{
  std::string::basic_string[abi:ne180100]<0>(__p, "Command error");
  int v12 = 0;
  *(_OWORD *)long long v13 = *(_OWORD *)__p;
  uint64_t v14 = __p[2];
  uint64_t v11 = 0;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v9, "is_bt_audioCall_on");
  if (CtrInternalClientPtr) {
    [CtrInternalClientPtr getProperty:v9 output:&v11];
  }
  else {
    memset(__p, 0, 32);
  }
  int v4 = *CtrXPC::Result::operator=(&v12, (uint64_t)__p);
  if (SHIBYTE(__p[3]) < 0) {
    operator delete(__p[1]);
  }
  if (v10 < 0)
  {
    operator delete(v9[0]);
    if (v4) {
      goto LABEL_8;
    }
  }
  else if (v4)
  {
LABEL_8:
    BOOL v5 = 0;
    goto LABEL_13;
  }
  uint64_t v6 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = any_to_BOOL((const boost::any *)&v11);
    LODWORD(__p[0]) = 136315394;
    *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance getBTAudioCallStatus]";
    WORD2(__p[1]) = 1024;
    *(_DWORD *)((char *)&__p[1] + 6) = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BT Load, Audio detection: %s get isBTAirpodEscoOn as %d", (uint8_t *)__p, 0x12u);
  }

  BOOL v5 = any_to_BOOL((const boost::any *)&v11);
LABEL_13:
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  if (SHIBYTE(v14) < 0) {
    operator delete(v13[0]);
  }
  return v5;
}

- (BOOL)isCurrentBTCoExLoadAvailable
{
  std::string::basic_string[abi:ne180100]<0>(buf, "Command error");
  int v12 = 0;
  *(_OWORD *)long long v13 = *(_OWORD *)buf;
  uint64_t v14 = v16;
  uint64_t v11 = 0;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(__p, "vendor:coex:radioload");
  if (CtrInternalClientPtr)
  {
    [CtrInternalClientPtr getProperty:__p output:&v11];
  }
  else
  {
    *(_OWORD *)std::string buf = 0u;
    long long v16 = 0u;
  }
  int v4 = *CtrXPC::Result::operator=(&v12, (uint64_t)buf);
  if (SHIBYTE(v16) < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v10 < 0)
  {
    operator delete(__p[0]);
    if (v4) {
      goto LABEL_8;
    }
  }
  else if (v4)
  {
LABEL_8:
    BOOL v5 = 0;
    goto LABEL_13;
  }
  unint64_t v6 = any_to_uint64((const boost::any *)&v11, 1);
  BOOL v7 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    operator new();
  }

  BOOL v5 = v6 != -1;
LABEL_13:
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  if (SHIBYTE(v14) < 0) {
    operator delete(v13[0]);
  }
  return v5;
}

- (void)setDeviceNode:(BOOL)a3 geoAvailable:(BOOL)a4 defaultChildNode:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  unint64_t SystemUptimeInSec = getSystemUptimeInSec();
  char v10 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t lastTimeInLeaderRole = self->_lastTimeInLeaderRole;
    *(_DWORD *)std::string buf = 136316418;
    uint64_t v24 = "-[ThreadNetworkManagerInstance setDeviceNode:geoAvailable:defaultChildNode:]";
    __int16 v25 = 1024;
    *(_DWORD *)id v26 = v7;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = v6;
    LOWORD(v27) = 1024;
    *(_DWORD *)((char *)&v27 + 2) = v5;
    HIWORD(v27) = 2048;
    unint64_t v28 = SystemUptimeInSec;
    __int16 v29 = 2048;
    unint64_t v30 = lastTimeInLeaderRole;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Calling %s routerMode = %d, geoAvailable = %d, defaultChildNode = %d, UpTimeNow = %llu, unint64_t lastTimeInLeaderRole = %llu", buf, 0x32u);
  }

  if (![(ThreadNetworkManagerInstance *)self isStateMachineWedEnabled])
  {
    if (!v7)
    {
      int v18 = 9;
      goto LABEL_20;
    }
LABEL_17:
    int v18 = 1;
LABEL_20:
    self->_deviceNode = v18;
    goto LABEL_21;
  }
  self->_wedStatus = 0;
  self->_wedAttachRequest = 0;
  self->_geoAvailable = v6;
  if (v7) {
    goto LABEL_17;
  }
  if (!v6)
  {
    int v18 = 8;
    goto LABEL_20;
  }
  int v12 = "sleepy-end-device";
  if (v5) {
    int v12 = "synchronized-sleepy-end-device";
  }
  self->_defaultChildNode = v12;
  self->_deviceNode = 9;
  unint64_t v13 = self->_lastTimeInLeaderRole;
  if (v13 && self->_lastKnownValidNodeType == 7)
  {
    BOOL v14 = SystemUptimeInSec >= v13;
    unint64_t v15 = SystemUptimeInSec - v13;
    if (!v14)
    {
      __break(0x5515u);
      return;
    }
    if (v15 <= 0x78)
    {
      self->_deviceNode = 1;
      long long v16 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v17 = self->_lastTimeInLeaderRole;
        *(_DWORD *)std::string buf = 136315650;
        uint64_t v24 = "-[ThreadNetworkManagerInstance setDeviceNode:geoAvailable:defaultChildNode:]";
        __int16 v25 = 2048;
        *(void *)id v26 = SystemUptimeInSec;
        *(_WORD *)&v26[8] = 2048;
        unint64_t v27 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s : Overwriting device role to be set as Router/Leader, UpTimeNow = %llu, unint64_t lastTimeInLeaderRole = %llu", buf, 0x20u);
      }
    }
  }
LABEL_21:
  unint64_t v19 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    nl::wpantund::node_type_to_string(self->_deviceNode, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    defaultChildNode = self->_defaultChildNode;
    *(_DWORD *)std::string buf = 136315650;
    uint64_t v24 = "-[ThreadNetworkManagerInstance setDeviceNode:geoAvailable:defaultChildNode:]";
    __int16 v25 = 2080;
    *(void *)id v26 = p_p;
    *(_WORD *)&v26[8] = 2080;
    unint64_t v27 = (unint64_t)defaultChildNode;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s : deviceNode = %s, defaultChildNode = %s", buf, 0x20u);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

- (dict)threadNetworkManagerInstance_MsgHandler:()basic_string<char message:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  BOOL v5 = v3;
  char v8 = v4;
  __int16 v9 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    var0 = a3;
    if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0) {
      var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a3->var0.var0.var0.var1.var0;
    }
    *(_DWORD *)std::string buf = 136315138;
    char v94 = var0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Message received from client %s", buf, 0xCu);
  }

  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v12 = v11;
  if (!v11) {
    xpc_object_t v12 = xpc_null_create();
  }

  id v13 = v12;
  BOOL v14 = v13;
  id v92 = v13;
  if (!v13 || xpc_get_type(v13) != (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t v15 = xpc_null_create();
    id v16 = v92;
    id v92 = v15;
  }
  dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
  dispatch_time(0, 5000000000);
  uint64_t v104 = 0;
  id v105 = 0;
  __int16 v106 = 256;
  int v18 = xpc::object::operator*(v5);
  string = (char *)xpc_dictionary_get_string(v18, "method");
  std::string::basic_string[abi:ne180100]<0>(&v91, string);

  id v20 = xpc::object::operator*(v5);
  id v21 = (char *)xpc_dictionary_get_string(v20, "property_name");
  std::string::basic_string[abi:ne180100]<0>(__p, v21);

  if (!std::string::compare(&v91, "setChannel"))
  {
    xpc::dict::dict((xpc::dict *)&v88, v5);
    signed int v23 = [(ThreadNetworkManagerInstance *)self setChannelUsingChannelManger:&v88];
    uint64_t v24 = v88;
    int v88 = 0;

    unsigned __int8 v22 = v88;
LABEL_41:

    goto LABEL_42;
  }
  if (!std::string::compare(&v91, "attachToNetwork"))
  {
    xpc::dict::dict((xpc::dict *)&v87, v5);
    signed int v23 = [(ThreadNetworkManagerInstance *)self attachToNetwork:&v87 output:&v92];
    __int16 v25 = v87;
    id v87 = 0;

    unsigned __int8 v22 = v87;
    goto LABEL_41;
  }
  if (!std::string::compare(&v91, "commissionOrFormNetwork"))
  {
    xpc::dict::dict((xpc::dict *)&v86, v5);
    signed int v23 = [(ThreadNetworkManagerInstance *)self commissionOrFormNetwork:&v86 is_attaching:0 cfg_attach:&v104 output:&v92];
    id v26 = v86;
    int v86 = 0;

    unsigned __int8 v22 = v86;
    goto LABEL_41;
  }
  if (!std::string::compare(&v91, "threadStart"))
  {
    unint64_t v27 = xpc::object::operator*(v5);
    unint64_t v28 = xpc_dictionary_get_string(v27, "uniqueNetworkId");

    __int16 v29 = xpc::object::operator*(v5);
    self->_BOOL waitForSync = xpc_dictionary_get_BOOL(v29, "wait_for_sync");

    unint64_t v30 = xpc::object::operator*(v5);
    unint64_t v31 = xpc_dictionary_get_string(v30, "activeOperationalDataset");

    xpc_object_t v32 = xpc::object::operator*(v5);
    BOOL v33 = xpc_dictionary_get_BOOL(v32, "defaultMode");

    [(ThreadNetworkManagerInstance *)self persistDefaultChildNode:v33];
    id v34 = xpc::object::operator*(v5);
    BOOL v35 = xpc_dictionary_get_BOOL(v34, "geoAvailable");

    [(ThreadNetworkManagerInstance *)self persistGeoAvailable:v35];
    id v36 = xpc::object::operator*(v5);
    BOOL v37 = xpc_dictionary_get_BOOL(v36, "routerMode");

    int v38 = xpc::object::operator*(v5);
    BOOL v39 = xpc_dictionary_get_BOOL(v38, "isPrimaryUser");

    uint64_t v40 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      BOOL waitForSync = self->_waitForSync;
      *(_DWORD *)std::string buf = 136316930;
      char v94 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)"-[ThreadNetworkManagerInstance threadNet"
                                                                                "workManagerInstance_MsgHandler:message:]";
      __int16 v95 = 2080;
      *(void *)uint64_t v96 = v28;
      *(_WORD *)&v96[8] = 1024;
      *(_DWORD *)&v96[10] = waitForSync;
      *(_WORD *)&v96[14] = 1024;
      *(_DWORD *)&v96[16] = v35;
      *(_WORD *)id v97 = 2080;
      *(void *)&v97[2] = v31;
      __int16 v98 = 1024;
      BOOL v99 = v37;
      __int16 v100 = 1024;
      BOOL v101 = v33;
      __int16 v102 = 1024;
      BOOL v103 = v39;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%s: Calling threadStart, Got the Unique Network ID : %s, waitForSync flag : %d, geoAvailable flag : %d, activeOperationalDataset : %s routerMode : %d defaultChildNode : %d, isPrimaryUser : %d", buf, 0x3Eu);
    }

    self->_createNetwork = 1;
    signed int v23 = [(ThreadNetworkManagerInstance *)self threadStart:v28 activeOperationalDataset:v31 isPrimaryUser:v39 routerMode:v37 geoAvailable:v35 defaultChildNode:v33 output:&v92];
    self->_BOOL waitForSync = 0;
    uint64_t SystemUptimeInSec = getSystemUptimeInSec();
    __darwin_time_t DaemonUptimeInSec = getDaemonUptimeInSec();
    gettimeofday((timeval *)&threadStartMsgTime, 0);
    unsigned __int8 v22 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134218754;
      char v94 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)SystemUptimeInSec;
      __int16 v95 = 2048;
      *(void *)uint64_t v96 = DaemonUptimeInSec;
      *(_WORD *)&v96[8] = 2080;
      *(void *)&v96[10] = "-[ThreadNetworkManagerInstance threadNetworkManagerInstance_MsgHandler:message:]";
      *(_WORD *)&v96[18] = 1024;
      *(_DWORD *)id v97 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[%llu, %llu] %s: threadStart finished with ret : %d", buf, 0x26u);
    }
    goto LABEL_41;
  }
  if (!std::string::compare(&v91, "threadLeave"))
  {
    id v44 = xpc::object::operator*(v5);
    BOOL v45 = xpc_dictionary_get_BOOL(v44, "threadStop");

    size_t v46 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0) {
        a3 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a3->var0.var0.var0.var1.var0;
      }
      uint64_t v47 = &v91;
      if ((v91.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        uint64_t v47 = (std::string *)v91.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string buf = 136315650;
      char v94 = a3;
      __int16 v95 = 2080;
      *(void *)uint64_t v96 = v47;
      *(_WORD *)&v96[8] = 1024;
      *(_DWORD *)&v96[10] = v45;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Got command from \"%s\" for method \"%s\", threadStop flag : %d", buf, 0x1Cu);
    }

    if (v45)
    {
      id v48 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Calling threadStop", buf, 2u);
      }

      signed int v23 = [(ThreadNetworkManagerInstance *)self threadStop];
      unsigned __int8 v22 = xpc::object::operator*(&v92);
      xpc_dictionary_set_BOOL(v22, "threadStop", 1);
      goto LABEL_41;
    }
    id v63 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Calling threadLeave", buf, 2u);
    }

    signed int v23 = [(ThreadNetworkManagerInstance *)self threadLeave];
    [(ThreadNetworkManagerInstance *)self resetMetricsBetweenRoleChanges];
  }
  else if (!std::string::compare(&v91, "provideEmac"))
  {
    int v58 = xpc::object::operator*(v5);
    char v59 = xpc_dictionary_get_string(v58, "extendedMACAddress");

    id v60 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 136315650;
      char v94 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)"-[ThreadNetworkManagerInstance threadNet"
                                                                                "workManagerInstance_MsgHandler:message:]";
      __int16 v95 = 1024;
      *(_DWORD *)uint64_t v96 = 799;
      *(_WORD *)&void v96[4] = 2080;
      *(void *)&v96[6] = v59;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%s:%d: Calling provideEMACAddress, Got the eMAC : 0x%s, ", buf, 0x1Cu);
    }

    signed int v23 = [(ThreadNetworkManagerInstance *)self provideExtendedMACAddress:v59 output:&v92];
    std::string v61 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v62 = [(ThreadNetworkManagerInstance *)self modeChangeInProgress];
      *(_DWORD *)std::string buf = 136315906;
      char v94 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)"-[ThreadNetworkManagerInstance threadNet"
                                                                                "workManagerInstance_MsgHandler:message:]";
      __int16 v95 = 1024;
      *(_DWORD *)uint64_t v96 = 803;
      *(_WORD *)&void v96[4] = 1024;
      *(_DWORD *)&v96[6] = v62;
      *(_WORD *)&v96[10] = 1024;
      *(_DWORD *)&v96[12] = v23;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%s:%d: Check if possible to transition to child Node, modeChangeInProgress = %d, ret = %d", buf, 0x1Eu);
    }

    if ((v23 == 1 || !v59) && ![(ThreadNetworkManagerInstance *)self modeChangeInProgress]) {
      [(ThreadNetworkManagerInstance *)self transitionToChildNode:&v92];
    }
  }
  else
  {
    if (!std::string::compare(&v91, "startPairing"))
    {
      id v64 = xpc::object::operator*(v5);
      unint64_t v65 = xpc_dictionary_get_string(v64, "extendedMACAddress");

      char v66 = xpc::object::operator*(v5);
      BOOL v67 = xpc_dictionary_get_BOOL(v66, "isWED");

      uint64_t v68 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315906;
        char v94 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)"-[ThreadNetworkManagerInstance threadN"
                                                                                  "etworkManagerInstance_MsgHandler:message:]";
        __int16 v95 = 1024;
        *(_DWORD *)uint64_t v96 = 817;
        *(_WORD *)&void v96[4] = 2080;
        *(void *)&v96[6] = v65;
        *(_WORD *)&v96[14] = 1024;
        *(_DWORD *)&v96[16] = v67;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%s:%d: Calling startPairing, Got the eMAC : 0x%s, isWED : %d", buf, 0x22u);
      }

      unsigned int v69 = [(ThreadNetworkManagerInstance *)self startPairing:v65 isWED:v67 output:&v92];
    }
    else if (!std::string::compare(&v91, "stopPairing"))
    {
      id v70 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315394;
        char v94 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)"-[ThreadNetworkManagerInstance threadN"
                                                                                  "etworkManagerInstance_MsgHandler:message:]";
        __int16 v95 = 1024;
        *(_DWORD *)uint64_t v96 = 827;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%s:%d: Calling Stop Pairing", buf, 0x12u);
      }

      unsigned int v69 = [(ThreadNetworkManagerInstance *)self stopPairing:&v92];
    }
    else if (!std::string::compare(&v91, "startFWUpdate"))
    {
      uint64_t v71 = xpc::object::operator*(v5);
      id v72 = xpc_dictionary_get_string(v71, "extendedMACAddress");

      unint64_t v73 = xpc::object::operator*(v5);
      BOOL v74 = xpc_dictionary_get_BOOL(v73, "isWED");

      id v75 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315906;
        char v94 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)"-[ThreadNetworkManagerInstance threadN"
                                                                                  "etworkManagerInstance_MsgHandler:message:]";
        __int16 v95 = 1024;
        *(_DWORD *)uint64_t v96 = 839;
        *(_WORD *)&void v96[4] = 2080;
        *(void *)&v96[6] = v72;
        *(_WORD *)&v96[14] = 1024;
        *(_DWORD *)&v96[16] = v74;
        _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "%s:%d: Calling startFWUpdate, Got the eMAC : 0x%s, isWED : %d", buf, 0x22u);
      }

      unsigned int v69 = [(ThreadNetworkManagerInstance *)self startFWUpdate:v72 isWED:v74 output:&v92];
    }
    else if (!std::string::compare(&v91, "stopFWUpdate"))
    {
      id v76 = log_get_logging_obg("com.apple.wpantund.tnm", "Wed");
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315394;
        char v94 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)"-[ThreadNetworkManagerInstance threadN"
                                                                                  "etworkManagerInstance_MsgHandler:message:]";
        __int16 v95 = 1024;
        *(_DWORD *)uint64_t v96 = 849;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%s:%d: Calling stop FW Update", buf, 0x12u);
      }

      unsigned int v69 = [(ThreadNetworkManagerInstance *)self stopFWUpdate:&v92];
    }
    else
    {
      if (std::string::compare(&v91, "updatePrimaryResident"))
      {
        unsigned __int8 v22 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[ThreadNetworkManagerInstance threadNetworkManagerInstance_MsgHandler:message:]();
        }
        signed int v23 = 1;
        goto LABEL_41;
      }
      id v77 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
      {
        if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0) {
          a3 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a3->var0.var0.var0.var1.var0;
        }
        size_t v78 = &v91;
        if ((v91.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          size_t v78 = (std::string *)v91.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)std::string buf = 136315394;
        char v94 = a3;
        __int16 v95 = 2080;
        *(void *)uint64_t v96 = v78;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "Got command from \"%s\" for method \"%s\"", buf, 0x16u);
      }

      char v79 = xpc::object::operator*(v5);
      id v80 = xpc_dictionary_get_string(v79, "primaryResidentInfo");

      int v81 = xpc::object::operator*(v5);
      BOOL v82 = xpc_dictionary_get_BOOL(v81, "isPrimaryResident");

      v83 = xpc::object::operator*(v5);
      BOOL v84 = xpc_dictionary_get_BOOL(v83, "isPrimaryResidentThreadCapable");

      id v85 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)std::string buf = 136315906;
        char v94 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)"-[ThreadNetworkManagerInstance threadN"
                                                                                  "etworkManagerInstance_MsgHandler:message:]";
        __int16 v95 = 2080;
        *(void *)uint64_t v96 = v80;
        *(_WORD *)&v96[8] = 1024;
        *(_DWORD *)&v96[10] = v82;
        *(_WORD *)&v96[14] = 1024;
        *(_DWORD *)&v96[16] = v84;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "%s: Calling updatePrimaryResident, primaryInfo=%s, isPrimaryResident=%d, isPrimaryResidentThreadCapable=%d", buf, 0x22u);
      }

      unsigned int v69 = [(ThreadNetworkManagerInstance *)self updatePrimaryResident:v80 isPrimaryResident:v82 isPrimaryResidentThreadCapable:v84];
    }
    signed int v23 = v69;
  }
LABEL_42:
  id v49 = xpc::object::operator*(&v92);
  id v50 = v49;
  if ((v91.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v51 = &v91;
  }
  else {
    int v51 = (std::string *)v91.__r_.__value_.__r.__words[0];
  }
  xpc_dictionary_set_string(v49, "method", (const char *)v51);

  id v52 = xpc::object::operator*(&v92);
  unint64_t v53 = v52;
  if (v90 >= 0) {
    id v54 = __p;
  }
  else {
    id v54 = (void **)__p[0];
  }
  xpc_dictionary_set_string(v52, "property_name", (const char *)v54);

  id v55 = xpc::object::operator*(&v92);
  xpc_dictionary_set_int64(v55, "ret", v23);

  xpc::dict::dict(v8, &v92);
  if (v90 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v91.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v91.__r_.__value_.__l.__data_);
  }

  id v56 = v92;
  id v92 = 0;

  return v57;
}

- (void)appendValMapToDict:(id)a3 value:(any)a4
{
  id v5 = a3;
  boost::any_cast<std::map<std::string,boost::any>>((uint64_t *)a4.var0, (uint64_t)&v11);
  BOOL v6 = v11;
  for (i = v11; i != v12; BOOL v6 = i)
  {
    BOOL v7 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)boost::any_cast<unsigned int const&>((uint64_t)(v6 + 56))];
    char v8 = i + 32;
    if ((char)i[55] < 0) {
      char v8 = (void *)*v8;
    }
    __int16 v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8, i);
    [v5 setObject:v7 forKey:v9];

    std::__tree_const_iterator<std::__value_type<std::string,boost::any>,std::__tree_node<std::__value_type<std::string,boost::any>,void *> *,long>::operator++[abi:ne180100]((uint64_t)&i);
  }
  std::__tree<std::__value_type<std::string,boost::any>,std::__map_value_compare<std::string,std::__value_type<std::string,boost::any>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,boost::any>>>::~__tree((uint64_t)&v11);
}

- (void)updateInternalDBForCommonDimensions:(id)a3 coexCntrsDict:(id)a4 coexDict:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  std::string::basic_string[abi:ne180100]<0>(buf, "Command error");
  int v37 = 0;
  *(_OWORD *)int v38 = *(_OWORD *)buf;
  uint64_t v39 = *(void *)&buf[16];
  BOOL v35 = 0;
  id v36 = xpc_null_create();
  self->_isPeriodicCaCollectionMeshcopRunning = 0;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(__p, "NCP:Counter:AllIPv6:AsValMap");
  if (CtrInternalClientPtr) {
    [CtrInternalClientPtr getProperty:__p output:&v35];
  }
  else {
    memset(buf, 0, 32);
  }
  int v12 = *CtrXPC::Result::operator=(&v37, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v34 < 0)
  {
    operator delete(__p[0]);
    if (v12) {
      goto LABEL_17;
    }
  }
  else if (v12)
  {
    goto LABEL_17;
  }
  id v13 = v35;
  if (v35) {
    id v13 = (placeholder *)(*(uint64_t (**)(placeholder *))(*(void *)v35 + 24))(v35);
  }
  v32.var0 = v13;
  convert_ValMap_to_xpc_object(&v32, "NCP:Counter:AllIPv6:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v14 = *(id *)buf;
  xpc_object_t v15 = xpc_null_create();

  id v16 = v36;
  id v36 = v14;

  if (v32.var0) {
    (*(void (**)(placeholder *))(*(void *)v32.var0 + 8))(v32.var0);
  }
  dispatch_semaphore_t v17 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance updateInternalDBForCommonDimensions:coexCntrsDict:coexDict:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 962;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s:%d: kWPANTUNDProperty_NCPCounterAllIPv6AsValMap Property", buf, 0x12u);
  }

  *(void *)std::string buf = &v36;
  *(void *)&buf[8] = "value";
  int v18 = xpc::dict::object_proxy::operator*((uint64_t)buf);
  CAMetricsHandlers_handle_getprop_allipv6(v18, v8);

LABEL_17:
  unint64_t v31 = 0;
  unint64_t v19 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v29, "NCP:Counter:Thread:Mle:AsValMap");
  if (v19) {
    [(CtrInternalClient *)v19 getProperty:v29 output:&v31];
  }
  else {
    memset(buf, 0, 32);
  }
  int v20 = *CtrXPC::Result::operator=(&v37, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v30 < 0)
  {
    operator delete(v29[0]);
    if (v20) {
      goto LABEL_33;
    }
  }
  else if (v20)
  {
    goto LABEL_33;
  }
  id v21 = v31;
  if (v31) {
    id v21 = (placeholder *)(*(uint64_t (**)(placeholder *))(*(void *)v31 + 24))(v31);
  }
  v28.var0 = v21;
  convert_ValMap_to_xpc_object(&v28, "NCP:Counter:Thread:Mle:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v22 = *(id *)buf;
  xpc_object_t v23 = xpc_null_create();

  id v24 = v36;
  id v36 = v22;

  if (v28.var0) {
    (*(void (**)(placeholder *))(*(void *)v28.var0 + 8))(v28.var0);
  }
  __int16 v25 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance updateInternalDBForCommonDimensions:coexCntrsDict:coexDict:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 971;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s:%d: kWPANTUNDProperty_NCPCounterThreadMleAsValMap Property", buf, 0x12u);
  }

  *(void *)std::string buf = &v36;
  *(void *)&buf[8] = "value";
  id v26 = xpc::dict::object_proxy::operator*((uint64_t)buf);
  CAMetricsHandlers_handle_getprop_threadmle(v26, v8);

LABEL_33:
  if (v31) {
    (*(void (**)(placeholder *))(*(void *)v31 + 8))(v31);
  }
  if (v35) {
    (*(void (**)(placeholder *))(*(void *)v35 + 8))(v35);
  }
  id v27 = v36;
  id v36 = 0;

  if (SHIBYTE(v39) < 0) {
    operator delete(v38[0]);
  }
}

- (void)addCommonDimensions:(id)a3
{
  int v4 = (NSMutableDictionary *)a3;
  std::string::basic_string[abi:ne180100]<0>(buf, "Command error");
  int v91 = 0;
  long long v92 = *(_OWORD *)buf;
  uint64_t v93 = *(void *)&buf[16];
  uint64_t v89 = 0;
  uint64_t v90 = 0;
  uint64_t v87 = 0;
  uint64_t v88 = 0;
  uint64_t v86 = 0;
  [(ThreadNetworkManagerInstance *)self getNCPState:0];
  id v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int lastKnownNCPState = self->_lastKnownNCPState;
    *(_DWORD *)std::string buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance addCommonDimensions:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1011;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = lastKnownNCPState;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Radio mode %d", buf, 0x18u);
  }

  if (self->_lastKnownNCPState == 8) {
    +[NSNumber numberWithBool:1];
  }
  else {
  BOOL v7 = +[NSNumber numberWithBool:0];
  }
  [(NSMutableDictionary *)v4 setObject:v7 forKey:@"is_state_associated"];

  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(__p, "thread_version");
  if (CtrInternalClientPtr) {
    [CtrInternalClientPtr getProperty:__p output:&v88];
  }
  else {
    memset(buf, 0, 32);
  }
  int v9 = *CtrXPC::Result::operator=(&v91, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v85 < 0)
  {
    operator delete(__p[0]);
    if (v9) {
      goto LABEL_20;
    }
  }
  else if (v9)
  {
    goto LABEL_20;
  }
  unsigned int v10 = any_to_int((const boost::any *)&v88);
  std::to_string((std::string *)buf, v10);
  int v11 = buf[23];
  int v12 = *(unsigned char **)buf;
  NSStringEncoding v13 = +[NSString defaultCStringEncoding];
  if (v11 >= 0) {
    id v14 = buf;
  }
  else {
    id v14 = v12;
  }
  xpc_object_t v15 = +[NSString stringWithCString:v14 encoding:v13];
  [(NSMutableDictionary *)v4 setObject:v15 forKey:@"thread_version"];

  if ((buf[23] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
LABEL_20:
  id v16 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v82, "NetdataFull:NoUnicastService");
  if (v16) {
    [(CtrInternalClient *)v16 getProperty:v82 output:&v87];
  }
  else {
    memset(buf, 0, 32);
  }
  dispatch_semaphore_t v17 = (RcpHostContext *)CtrXPC::Result::operator=(&v91, (uint64_t)buf);
  int v18 = *(_DWORD *)v17;
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v83 < 0)
  {
    operator delete(v82[0]);
    if (v18) {
      goto LABEL_33;
    }
  }
  else if (v18)
  {
    goto LABEL_33;
  }
  if (any_to_int((const boost::any *)&v87)) {
    +[NSNumber numberWithBool:1];
  }
  else {
  unint64_t v19 = +[NSNumber numberWithBool:0];
  }
  [(NSMutableDictionary *)v4 setObject:v19 forKey:@"is_network_data_full_no_unicast_service"];

LABEL_33:
  if (*(_DWORD *)(RcpHostContext::GetRcpHostContext(v17) + 784)) {
    +[NSNumber numberWithBool:1];
  }
  else {
  int v20 = +[NSNumber numberWithBool:0];
  }
  [(NSMutableDictionary *)v4 setObject:v20 forKey:@"is_radio_tx_timeout"];

  if (*(unsigned char *)(RcpHostContext::GetRcpHostContext(v21) + 788)) {
    +[NSNumber numberWithBool:1];
  }
  else {
  id v22 = +[NSNumber numberWithBool:0];
  }
  [(NSMutableDictionary *)v4 setObject:v22 forKey:@"is_buffer_limit_exceeded"];

  if (*(unsigned char *)(RcpHostContext::GetRcpHostContext(v23) + 789)) {
    +[NSNumber numberWithBool:1];
  }
  else {
  id v24 = +[NSNumber numberWithBool:0];
  }
  [(NSMutableDictionary *)v4 setObject:v24 forKey:@"is_non_converging_prefix"];

  if (*(unsigned char *)(RcpHostContext::GetRcpHostContext(v25) + 790)) {
    +[NSNumber numberWithBool:1];
  }
  else {
  id v26 = +[NSNumber numberWithBool:0];
  }
  [(NSMutableDictionary *)v4 setObject:v26 forKey:@"is_non_converging_unicast_srp_service"];

  if (*(unsigned char *)(RcpHostContext::GetRcpHostContext(v27) + 791)) {
    +[NSNumber numberWithBool:1];
  }
  else {
  any v28 = +[NSNumber numberWithBool:0];
  }
  [(NSMutableDictionary *)v4 setObject:v28 forKey:@"is_network_data_full"];

  __int16 v29 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v80, "numOnMeshPrefixes");
  if (v29) {
    [(CtrInternalClient *)v29 getProperty:v80 output:&v90];
  }
  else {
    memset(buf, 0, 32);
  }
  int v30 = *CtrXPC::Result::operator=(&v91, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v81 < 0)
  {
    operator delete(v80[0]);
    if (v30) {
      goto LABEL_61;
    }
  }
  else if (v30)
  {
    goto LABEL_61;
  }
  if (any_to_int((const boost::any *)&v90) < 2) {
    +[NSNumber numberWithBool:0];
  }
  else {
  unint64_t v31 = +[NSNumber numberWithBool:1];
  }
  [(NSMutableDictionary *)v4 setObject:v31 forKey:@"is_multiple_prefix_detected"];

LABEL_61:
  any v32 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v78, "numRouters");
  if (v32) {
    [(CtrInternalClient *)v32 getProperty:v78 output:&v89];
  }
  else {
    memset(buf, 0, 32);
  }
  int v33 = *CtrXPC::Result::operator=(&v91, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v79 < 0)
  {
    operator delete(v78[0]);
    if (v33) {
      goto LABEL_78;
    }
  }
  else if (v33)
  {
    goto LABEL_78;
  }
  unsigned int v34 = any_to_int((const boost::any *)&v89);
  if (v34 >= 4)
  {
    if (v34 >= 0xA)
    {
      if (v34 >= 0xF) {
        CFStringRef v35 = @"very large";
      }
      else {
        CFStringRef v35 = @"large";
      }
    }
    else
    {
      CFStringRef v35 = @"medium";
    }
  }
  else
  {
    CFStringRef v35 = @"small";
  }
  [(NSMutableDictionary *)v4 setObject:v35 forKey:@"thread_mesh_size"];
LABEL_78:
  id v36 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v76, "Network:NodeType");
  if (v36) {
    [(CtrInternalClient *)v36 getProperty:v76 output:&v86];
  }
  else {
    memset(buf, 0, 32);
  }
  int v37 = *CtrXPC::Result::operator=(&v91, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v77 < 0)
  {
    operator delete(v76[0]);
    if (v37) {
      goto LABEL_92;
    }
  }
  else if (v37)
  {
    goto LABEL_92;
  }
  any_to_string((const boost::any *)&v86, (uint64_t)buf);
  int v38 = buf[23];
  uint64_t v39 = *(unsigned char **)buf;
  NSStringEncoding v40 = +[NSString defaultCStringEncoding];
  if (v38 >= 0) {
    id v41 = buf;
  }
  else {
    id v41 = v39;
  }
  id v42 = +[NSString stringWithCString:v41 encoding:v40];
  [(NSMutableDictionary *)v4 setObject:v42 forKey:@"last_known_device_role"];

  if ((buf[23] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
LABEL_92:
  dispatch_time_t v43 = [(ThreadNetworkManagerInstance *)self CAgetPrevValidDeviceRole];
  [(NSMutableDictionary *)v4 setObject:v43 forKey:@"prev_device_role"];

  uint64_t v75 = 0;
  id v44 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v73, "cametrics_periodic_stability_data");
  if (v44) {
    [(CtrInternalClient *)v44 getProperty:v73 output:&v75];
  }
  else {
    memset(buf, 0, 32);
  }
  int v45 = *CtrXPC::Result::operator=(&v91, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v74 < 0)
  {
    operator delete(v73[0]);
    if (v45) {
      goto LABEL_115;
    }
  }
  else if (v45)
  {
    goto LABEL_115;
  }
  uint64_t v46 = v75;
  if (v75) {
    uint64_t v46 = (*(uint64_t (**)(uint64_t))(*(void *)v75 + 24))(v75);
  }
  uint64_t v72 = v46;
  uint64_t v47 = InternalClientIPCHelper::decodeComplexValToDict(&v72);
  if (v72) {
    (*(void (**)(uint64_t))(*(void *)v72 + 8))(v72);
  }
  id v48 = [v47 objectForKey:@"num_firmware_resets"];
  int v49 = [v48 intValue];
  id v50 = [v47 objectForKey:@"num_daemon_restart_due_to_crashes_or_jetsams"];
  int v51 = [v50 intValue];
  id v52 = [v47 objectForKey:@"num_daemon_restart_due_to_reboots"];
  int v53 = [v52 intValue];
  if (v49 < 1) {
    +[NSNumber numberWithBool:0];
  }
  else {
  id v54 = +[NSNumber numberWithBool:1];
  }
  [(NSMutableDictionary *)v4 setObject:v54 forKey:@"is_fwreset_detected"];

  if (v51 < 1) {
    +[NSNumber numberWithBool:0];
  }
  else {
  id v55 = +[NSNumber numberWithBool:1];
  }
  [(NSMutableDictionary *)v4 setObject:v55 forKey:@"is_daemon_crash_jetsam_detected"];

  if (v53 < 1) {
    +[NSNumber numberWithBool:0];
  }
  else {
  id v56 = +[NSNumber numberWithBool:1];
  }
  [(NSMutableDictionary *)v4 setObject:v56 forKey:@"is_daemon_reboot_detected"];

LABEL_115:
  uint64_t v71 = 0;
  dict v57 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v69, "primary_resident_data");
  if (v57) {
    [(CtrInternalClient *)v57 getProperty:v69 output:&v71];
  }
  else {
    memset(buf, 0, 32);
  }
  int v58 = *CtrXPC::Result::operator=(&v91, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v70 < 0)
  {
    operator delete(v69[0]);
    if (v58) {
      goto LABEL_137;
    }
  }
  else if (v58)
  {
    goto LABEL_137;
  }
  uint64_t v59 = v71;
  if (v71) {
    uint64_t v59 = (*(uint64_t (**)(uint64_t))(*(void *)v71 + 24))(v71);
  }
  uint64_t v68 = v59;
  id v60 = InternalClientIPCHelper::decodeComplexValToDict(&v68);
  if (v68) {
    (*(void (**)(uint64_t))(*(void *)v68 + 8))(v68);
  }
  std::string v61 = [v60 objectForKey:@"is_primary_resident"];
  int v62 = [v61 intValue];
  id v63 = [v60 objectForKey:@"is_primary_resident_thread_capable"];
  int v64 = [v63 intValue];
  unint64_t v65 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136316418;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance addCommonDimensions:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1207;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v61;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v62;
    __int16 v95 = 2112;
    uint64_t v96 = v63;
    __int16 v97 = 1024;
    int v98 = v64;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "%s:%d: is_primary_resident=%@ %d is_primary_resident_thread_capable=%@ %d", buf, 0x32u);
  }

  if (v62 < 1) {
    +[NSNumber numberWithBool:0];
  }
  else {
  char v66 = +[NSNumber numberWithBool:1];
  }
  [(NSMutableDictionary *)v4 setObject:v66 forKey:@"is_primary_resident"];

  if (v64 < 1) {
    +[NSNumber numberWithBool:0];
  }
  else {
  BOOL v67 = +[NSNumber numberWithBool:1];
  }
  [(NSMutableDictionary *)v4 setObject:v67 forKey:@"is_primary_resident_thread_capable"];

LABEL_137:
  CAMetricsHandlers_handle_common_dimensions(v4);
  if (v71) {
    (*(void (**)(uint64_t))(*(void *)v71 + 8))(v71);
  }
  if (v75) {
    (*(void (**)(uint64_t))(*(void *)v75 + 8))(v75);
  }
  if (v86) {
    (*(void (**)(uint64_t))(*(void *)v86 + 8))(v86);
  }
  if (v87) {
    (*(void (**)(uint64_t))(*(void *)v87 + 8))(v87);
  }
  if (v88) {
    (*(void (**)(uint64_t))(*(void *)v88 + 8))(v88);
  }
  if (v89) {
    (*(void (**)(uint64_t))(*(void *)v89 + 8))(v89);
  }
  if (v90) {
    (*(void (**)(uint64_t))(*(void *)v90 + 8))(v90);
  }
  if (SHIBYTE(v93) < 0) {
    operator delete((void *)v92);
  }
}

- (void)getNetworkRadioMetrics
{
  std::string::basic_string[abi:ne180100]<0>(buf, "Command error");
  int v124 = 0;
  long long v125 = *(_OWORD *)buf;
  uint64_t v126 = *(void *)&buf[16];
  char v122 = 0;
  id v123 = xpc_null_create();
  unsigned int v3 = +[NSMutableDictionary dictionary];
  if (byte_1004B6447 >= 0) {
    int v4 = &mDaemonVersion;
  }
  else {
    int v4 = (uint64_t *)mDaemonVersion;
  }
  id v5 = +[NSString stringWithUTF8String:v4];
  [(NSMutableDictionary *)v3 setObject:v5 forKey:@"header_daemon_version"];

  if (byte_1004B645F >= 0) {
    BOOL v6 = &mVendorVersion;
  }
  else {
    BOOL v6 = (uint64_t *)mVendorVersion;
  }
  BOOL v7 = +[NSString stringWithUTF8String:v6];
  [(NSMutableDictionary *)v3 setObject:v7 forKey:@"header_vendor_version"];

  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v120, "vendor:MAC:packet:RSSIHistogram:AsValMap");
  if (CtrInternalClientPtr) {
    [CtrInternalClientPtr getProperty:v120 output:&v122];
  }
  else {
    memset(buf, 0, 32);
  }
  int v9 = *CtrXPC::Result::operator=(&v124, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v121 < 0)
  {
    operator delete(v120[0]);
    if (v9) {
      goto LABEL_23;
    }
  }
  else if (v9)
  {
    goto LABEL_23;
  }
  unsigned int v10 = v122;
  if (v122) {
    unsigned int v10 = (placeholder *)(*(uint64_t (**)(placeholder *))(*(void *)v122 + 24))(v122);
  }
  v119.var0 = v10;
  convert_ValMap_to_xpc_object(&v119, "vendor:MAC:packet:RSSIHistogram:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v11 = *(id *)buf;
  xpc_object_t v12 = xpc_null_create();

  id v13 = v123;
  id v123 = v11;

  if (v119.var0) {
    (*(void (**)(placeholder *))(*(void *)v119.var0 + 8))(v119.var0);
  }
  id v14 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1245;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s:%d: kWPANTUNDVendor_Neighbor_RSSI_HistogramAsValMap Property", buf, 0x12u);
  }

  *(void *)std::string buf = &v123;
  *(void *)&buf[8] = "value";
  xpc_object_t v15 = xpc::dict::object_proxy::operator*((uint64_t)buf);
  CAMetricsHandlers_handle_getprop_nbrRssi(v15, v3);

LABEL_23:
  CAMetricsHandlers_handle_get_channelSelectionData(v3);
  char v118 = 0;
  id v16 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v116, "vendor:MAC:packet:LQIHistogram:AsValMap");
  if (v16) {
    [(CtrInternalClient *)v16 getProperty:v116 output:&v118];
  }
  else {
    memset(buf, 0, 32);
  }
  int v17 = *CtrXPC::Result::operator=(&v124, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v117 < 0)
  {
    operator delete(v116[0]);
    if (v17) {
      goto LABEL_39;
    }
  }
  else if (v17)
  {
    goto LABEL_39;
  }
  int v18 = v118;
  if (v118) {
    int v18 = (placeholder *)(*(uint64_t (**)(placeholder *))(*(void *)v118 + 24))(v118);
  }
  v115.var0 = v18;
  convert_ValMap_to_xpc_object(&v115, "vendor:MAC:packet:LQIHistogram:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v19 = *(id *)buf;
  xpc_object_t v20 = xpc_null_create();

  id v21 = v123;
  id v123 = v19;

  if (v115.var0) {
    (*(void (**)(placeholder *))(*(void *)v115.var0 + 8))(v115.var0);
  }
  id v22 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1257;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s:%d: kWPANTUNDVendor_MAC_Packet_LQI_HistogramAsValMap Property", buf, 0x12u);
  }

  *(void *)std::string buf = &v123;
  *(void *)&buf[8] = "value";
  xpc_object_t v23 = xpc::dict::object_proxy::operator*((uint64_t)buf);
  CAMetricsHandlers_handle_getprop_macPktLqi(v23, v3);

LABEL_39:
  id v114 = 0;
  id v24 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(__p, "TPC:FrameTxPowerHistogram");
  if (v24) {
    [(CtrInternalClient *)v24 getProperty:__p output:&v114];
  }
  else {
    memset(buf, 0, 32);
  }
  int v25 = *CtrXPC::Result::operator=(&v124, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v113 < 0)
  {
    operator delete(__p[0]);
    if (v25) {
      goto LABEL_55;
    }
  }
  else if (v25)
  {
    goto LABEL_55;
  }
  id v26 = v114;
  if (v114) {
    id v26 = (placeholder *)(*(uint64_t (**)(placeholder *))(*(void *)v114 + 24))(v114);
  }
  v111.var0 = v26;
  convert_ValMap_to_xpc_object(&v111, "TPC:FrameTxPowerHistogram", "PropGet", (xpc_object_t *)buf);
  id v27 = *(id *)buf;
  xpc_object_t v28 = xpc_null_create();

  id v29 = v123;
  id v123 = v27;

  if (v111.var0) {
    (*(void (**)(placeholder *))(*(void *)v111.var0 + 8))(v111.var0);
  }
  int v30 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1265;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%s:%d: kWPANTUNDProperty_Tpc_FrameTxPowerHistogram Property", buf, 0x12u);
  }

  *(void *)std::string buf = &v123;
  *(void *)&buf[8] = "value";
  unint64_t v31 = xpc::dict::object_proxy::operator*((uint64_t)buf);
  CAMetricsHandlers_handle_getprop_frameTxPowerHist(v31, v3);

LABEL_55:
  v110 = 0;
  any v32 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v108, "TPC:NeighborTxPowerHistogram");
  if (v32) {
    [(CtrInternalClient *)v32 getProperty:v108 output:&v110];
  }
  else {
    memset(buf, 0, 32);
  }
  int v33 = *CtrXPC::Result::operator=(&v124, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v109 < 0)
  {
    operator delete(v108[0]);
    if (v33) {
      goto LABEL_71;
    }
  }
  else if (v33)
  {
    goto LABEL_71;
  }
  unsigned int v34 = v110;
  if (v110) {
    unsigned int v34 = (placeholder *)(*(uint64_t (**)(placeholder *))(*(void *)v110 + 24))(v110);
  }
  v107.var0 = v34;
  convert_ValMap_to_xpc_object(&v107, "TPC:NeighborTxPowerHistogram", "PropGet", (xpc_object_t *)buf);
  id v35 = *(id *)buf;
  xpc_object_t v36 = xpc_null_create();

  id v37 = v123;
  id v123 = v35;

  if (v107.var0) {
    (*(void (**)(placeholder *))(*(void *)v107.var0 + 8))(v107.var0);
  }
  int v38 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1273;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s:%d: kWPANTUNDProperty_Tpc_NeighborTxPowerHistogram Property", buf, 0x12u);
  }

  *(void *)std::string buf = &v123;
  *(void *)&buf[8] = "value";
  uint64_t v39 = xpc::dict::object_proxy::operator*((uint64_t)buf);
  CAMetricsHandlers_handle_getprop_neighborTxPowerHist(v39, v3);

LABEL_71:
  __int16 v106 = 0;
  NSStringEncoding v40 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v104, "TPC:NeighborEnergySavingsFactorHistogram");
  if (v40) {
    [(CtrInternalClient *)v40 getProperty:v104 output:&v106];
  }
  else {
    memset(buf, 0, 32);
  }
  int v41 = *CtrXPC::Result::operator=(&v124, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v105 < 0)
  {
    operator delete(v104[0]);
    if (v41) {
      goto LABEL_87;
    }
  }
  else if (v41)
  {
    goto LABEL_87;
  }
  id v42 = v106;
  if (v106) {
    id v42 = (placeholder *)(*(uint64_t (**)(placeholder *))(*(void *)v106 + 24))(v106);
  }
  v103.var0 = v42;
  convert_ValMap_to_xpc_object(&v103, "TPC:NeighborEnergySavingsFactorHistogram", "PropGet", (xpc_object_t *)buf);
  id v43 = *(id *)buf;
  xpc_object_t v44 = xpc_null_create();

  id v45 = v123;
  id v123 = v43;

  if (v103.var0) {
    (*(void (**)(placeholder *))(*(void *)v103.var0 + 8))(v103.var0);
  }
  uint64_t v46 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1281;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "%s:%d: kWPANTUNDProperty_Tpc_NeighborEnergySavingsFactorHistogram Property", buf, 0x12u);
  }

  *(void *)std::string buf = &v123;
  *(void *)&buf[8] = "value";
  uint64_t v47 = xpc::dict::object_proxy::operator*((uint64_t)buf);
  CAMetricsHandlers_handle_getprop_neighborEnergySavingsFactorHist(v47, v3);

LABEL_87:
  [(ThreadNetworkManagerInstance *)self addCommonDimensions:v3];
  v102[1] = _NSConcreteStackBlock;
  v102[2] = 3221225472;
  v102[3] = __54__ThreadNetworkManagerInstance_getNetworkRadioMetrics__block_invoke;
  v102[4] = &unk_100495710;
  id v48 = v3;
  v102[5] = v48;
  AnalyticsSendExplodingEventLazy();

  [(NSMutableDictionary *)v48 removeAllObjects];
  if (byte_1004B6447 >= 0) {
    int v49 = &mDaemonVersion;
  }
  else {
    int v49 = (uint64_t *)mDaemonVersion;
  }
  id v50 = +[NSString stringWithUTF8String:v49];
  [(NSMutableDictionary *)v48 setObject:v50 forKey:@"header_daemon_version"];

  if (byte_1004B645F >= 0) {
    int v51 = &mVendorVersion;
  }
  else {
    int v51 = (uint64_t *)mVendorVersion;
  }
  id v52 = +[NSString stringWithUTF8String:v51];
  [(NSMutableDictionary *)v48 setObject:v52 forKey:@"header_vendor_version"];

  v102[0] = 0;
  int v53 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v100, "vendor:radio:counters:asvalmap");
  if (v53) {
    [(CtrInternalClient *)v53 getProperty:v100 output:v102];
  }
  else {
    memset(buf, 0, 32);
  }
  int v54 = *CtrXPC::Result::operator=(&v124, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v101 < 0)
  {
    operator delete(v100[0]);
    if (v54) {
      goto LABEL_109;
    }
  }
  else if (v54)
  {
    goto LABEL_109;
  }
  id v55 = (placeholder *)v102[0];
  if (v102[0]) {
    id v55 = (placeholder *)(*(uint64_t (**)(void))(*(void *)v102[0] + 24))(v102[0]);
  }
  v99.var0 = v55;
  convert_ValMap_to_xpc_object(&v99, "vendor:radio:counters:asvalmap", "PropGet", (xpc_object_t *)buf);
  id v56 = *(id *)buf;
  xpc_object_t v57 = xpc_null_create();

  id v58 = v123;
  id v123 = v56;

  if (v99.var0) {
    (*(void (**)(placeholder *))(*(void *)v99.var0 + 8))(v99.var0);
  }
  uint64_t v59 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1306;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "%s:%d: kWPANTUNDVendor_Radio_Counters_AsValMap Property", buf, 0x12u);
  }

  *(void *)std::string buf = &v123;
  *(void *)&buf[8] = "value";
  id v60 = xpc::dict::object_proxy::operator*((uint64_t)buf);
  CAMetricsHandlers_handle_getprop_radiocounters(v60, v48);

LABEL_109:
  int v98 = 0;
  std::string v61 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v96, "vendor:radio:stats:asvalmap");
  if (v61) {
    [(CtrInternalClient *)v61 getProperty:v96 output:&v98];
  }
  else {
    memset(buf, 0, 32);
  }
  int v62 = *CtrXPC::Result::operator=(&v124, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v97 < 0)
  {
    operator delete(v96[0]);
    if (v62) {
      goto LABEL_125;
    }
  }
  else if (v62)
  {
    goto LABEL_125;
  }
  id v63 = v98;
  if (v98) {
    id v63 = (placeholder *)(*(uint64_t (**)(placeholder *))(*(void *)v98 + 24))(v98);
  }
  v95.var0 = v63;
  convert_ValMap_to_xpc_object(&v95, "vendor:radio:stats:asvalmap", "PropGet", (xpc_object_t *)buf);
  id v64 = *(id *)buf;
  xpc_object_t v65 = xpc_null_create();

  id v66 = v123;
  id v123 = v64;

  if (v95.var0) {
    (*(void (**)(placeholder *))(*(void *)v95.var0 + 8))(v95.var0);
  }
  BOOL v67 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1315;
    _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "%s:%d: kWPANTUNDVendor_RadioStats_AsValMap Property", buf, 0x12u);
  }

  *(void *)std::string buf = &v123;
  *(void *)&buf[8] = "value";
  uint64_t v68 = xpc::dict::object_proxy::operator*((uint64_t)buf);
  CAMetricsHandlers_handle_getprop_radiostat(v68, v48);

LABEL_125:
  char v94 = 0;
  unsigned int v69 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v92, "vendor:openthread:radio:counters:AsValMap");
  if (v69) {
    [(CtrInternalClient *)v69 getProperty:v92 output:&v94];
  }
  else {
    memset(buf, 0, 32);
  }
  int v70 = *CtrXPC::Result::operator=(&v124, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v93 < 0)
  {
    operator delete(v92[0]);
    if (v70) {
      goto LABEL_141;
    }
  }
  else if (v70)
  {
    goto LABEL_141;
  }
  uint64_t v71 = v94;
  if (v94) {
    uint64_t v71 = (placeholder *)(*(uint64_t (**)(placeholder *))(*(void *)v94 + 24))(v94);
  }
  v91.var0 = v71;
  convert_ValMap_to_xpc_object(&v91, "vendor:openthread:radio:counters:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v72 = *(id *)buf;
  xpc_object_t v73 = xpc_null_create();

  id v74 = v123;
  id v123 = v72;

  if (v91.var0) {
    (*(void (**)(placeholder *))(*(void *)v91.var0 + 8))(v91.var0);
  }
  uint64_t v75 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1324;
    _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_INFO, "%s:%d: kWPANTUNDVendor_Openthread_Radio_Counters_AsValMap Property", buf, 0x12u);
  }

  *(void *)std::string buf = &v123;
  *(void *)&buf[8] = "value";
  id v76 = xpc::dict::object_proxy::operator*((uint64_t)buf);
  CAMetricsHandlers_handle_getprop_generic_function(v76, v48, @"vendor:openthread:radio:counters:AsValMap");

LABEL_141:
  uint64_t v90 = 0;
  char v77 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v88, "vendor:streaming:stats");
  if (v77) {
    [(CtrInternalClient *)v77 getProperty:v88 output:&v90];
  }
  else {
    memset(buf, 0, 32);
  }
  int v78 = *CtrXPC::Result::operator=(&v124, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v89 < 0)
  {
    operator delete(v88[0]);
    if (v78) {
      goto LABEL_157;
    }
  }
  else if (v78)
  {
    goto LABEL_157;
  }
  char v79 = v90;
  if (v90) {
    char v79 = (placeholder *)(*(uint64_t (**)(placeholder *))(*(void *)v90 + 24))(v90);
  }
  v87.var0 = v79;
  convert_ValMap_to_xpc_object(&v87, "vendor:streaming:stats", "PropGet", (xpc_object_t *)buf);
  id v80 = *(id *)buf;
  xpc_object_t v81 = xpc_null_create();

  id v82 = v123;
  id v123 = v80;

  if (v87.var0) {
    (*(void (**)(placeholder *))(*(void *)v87.var0 + 8))(v87.var0);
  }
  char v83 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1335;
    _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_INFO, "%s:%d: kWPANTUNDVendor_StreamingStats Property", buf, 0x12u);
  }

  *(void *)std::string buf = &v123;
  *(void *)&buf[8] = "value";
  BOOL v84 = xpc::dict::object_proxy::operator*((uint64_t)buf);
  CAMetricsHandlers_handle_getprop_generic_function(v84, v48, @"vendor:streaming:stats");

LABEL_157:
  [(ThreadNetworkManagerInstance *)self addCommonDimensions:v48];
  char v85 = v48;
  AnalyticsSendEventLazy();
  [(ThreadNetworkManagerInstance *)self resetNetworkRadioMetrics];

  if (v90) {
    (*(void (**)(placeholder *))(*(void *)v90 + 8))(v90);
  }
  if (v94) {
    (*(void (**)(placeholder *))(*(void *)v94 + 8))(v94);
  }
  if (v98) {
    (*(void (**)(placeholder *))(*(void *)v98 + 8))(v98);
  }
  if (v102[0]) {
    (*(void (**)(void))(*(void *)v102[0] + 8))(v102[0]);
  }
  if (v106) {
    (*(void (**)(placeholder *))(*(void *)v106 + 8))(v106);
  }
  if (v110) {
    (*(void (**)(placeholder *))(*(void *)v110 + 8))(v110);
  }
  if (v114) {
    (*(void (**)(placeholder *))(*(void *)v114 + 8))(v114);
  }
  if (v118) {
    (*(void (**)(placeholder *))(*(void *)v118 + 8))(v118);
  }

  if (v122) {
    (*(void (**)(placeholder *))(*(void *)v122 + 8))(v122);
  }
  id v86 = v123;
  id v123 = 0;

  if (SHIBYTE(v126) < 0) {
    operator delete((void *)v125);
  }
}

id __54__ThreadNetworkManagerInstance_getNetworkRadioMetrics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __54__ThreadNetworkManagerInstance_getNetworkRadioMetrics__block_invoke_190(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)resetNetworkRadioMetrics
{
  std::string::basic_string[abi:ne180100]<0>(buf, "Command success");
  int v48 = 0;
  long long v49 = *(_OWORD *)buf;
  uint64_t v50 = *(void *)&buf[16];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v46, "vendor:MAC:packet:RSSIHistogram");
  if (CtrInternalClientPtr) {
    [CtrInternalClientPtr setProperty:v46 property_val:"0"];
  }
  else {
    memset(buf, 0, 32);
  }
  int v4 = *CtrXPC::Result::operator=(&v48, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v47 < 0)
  {
    operator delete(v46[0]);
    if (v4) {
      goto LABEL_13;
    }
  }
  else if (v4)
  {
    goto LABEL_13;
  }
  id v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1359;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Reset kWPANTUNDVendor_Neighbor_RSSI_Histogram stats", buf, 0x12u);
  }

LABEL_13:
  BOOL v6 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v44, "vendor:MAC:packet:LQIHistogram");
  if (v6) {
    [(CtrInternalClient *)v6 setProperty:v44 property_val:"0"];
  }
  else {
    memset(buf, 0, 32);
  }
  int v7 = *CtrXPC::Result::operator=(&v48, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v45 < 0)
  {
    operator delete(v44[0]);
    if (v7) {
      goto LABEL_25;
    }
  }
  else if (v7)
  {
    goto LABEL_25;
  }
  id v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1363;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:%d: Reset kWPANTUNDVendor_MAC_Packet_LQI_Histogram stats", buf, 0x12u);
  }

LABEL_25:
  int v9 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(__p, "TPC:FrameTxPowerHistogram");
  if (v9) {
    [(CtrInternalClient *)v9 setProperty:__p property_val:"0"];
  }
  else {
    memset(buf, 0, 32);
  }
  int v10 = *CtrXPC::Result::operator=(&v48, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v43 < 0)
  {
    operator delete(__p[0]);
    if (v10) {
      goto LABEL_37;
    }
  }
  else if (v10)
  {
    goto LABEL_37;
  }
  id v11 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1367;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s:%d: Reset kWPANTUNDProperty_Tpc_FrameTxPowerHistogram stats", buf, 0x12u);
  }

LABEL_37:
  xpc_object_t v12 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v40, "TPC:NeighborTxPowerHistogram");
  if (v12) {
    [(CtrInternalClient *)v12 setProperty:v40 property_val:"0"];
  }
  else {
    memset(buf, 0, 32);
  }
  int v13 = *CtrXPC::Result::operator=(&v48, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v41 < 0)
  {
    operator delete(v40[0]);
    if (v13) {
      goto LABEL_49;
    }
  }
  else if (v13)
  {
    goto LABEL_49;
  }
  id v14 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1371;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s:%d: Reset kWPANTUNDProperty_Tpc_NeighborTxPowerHistogram stats", buf, 0x12u);
  }

LABEL_49:
  xpc_object_t v15 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v38, "TPC:NeighborEnergySavingsFactorHistogram");
  if (v15) {
    [(CtrInternalClient *)v15 setProperty:v38 property_val:"0"];
  }
  else {
    memset(buf, 0, 32);
  }
  int v16 = *CtrXPC::Result::operator=(&v48, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v39 < 0)
  {
    operator delete(v38[0]);
    if (v16) {
      goto LABEL_61;
    }
  }
  else if (v16)
  {
    goto LABEL_61;
  }
  int v17 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1375;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s:%d: Reset kWPANTUNDProperty_Tpc_NeighborEnergySavingsFactorHistogram stats", buf, 0x12u);
  }

LABEL_61:
  int v18 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v36, "vendor:radio:counters");
  if (v18) {
    [(CtrInternalClient *)v18 setProperty:v36 property_val:"0"];
  }
  else {
    memset(buf, 0, 32);
  }
  int v19 = *CtrXPC::Result::operator=(&v48, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v37 < 0)
  {
    operator delete(v36[0]);
    if (v19) {
      goto LABEL_73;
    }
  }
  else if (v19)
  {
    goto LABEL_73;
  }
  xpc_object_t v20 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1379;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s:%d: Reset kWPANTUNDVendor_Radio_Counters stats", buf, 0x12u);
  }

LABEL_73:
  id v21 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v34, "vendor:radio:stats");
  if (v21) {
    [(CtrInternalClient *)v21 setProperty:v34 property_val:"0"];
  }
  else {
    memset(buf, 0, 32);
  }
  int v22 = *CtrXPC::Result::operator=(&v48, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v35 < 0)
  {
    operator delete(v34[0]);
    if (v22) {
      goto LABEL_85;
    }
  }
  else if (v22)
  {
    goto LABEL_85;
  }
  xpc_object_t v23 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1383;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s:%d: Reset kWPANTUNDVendor_RadioStats stats", buf, 0x12u);
  }

LABEL_85:
  id v24 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v32, "vendor:openthread:radio:counters");
  if (v24) {
    [(CtrInternalClient *)v24 setProperty:v32 property_val:"0"];
  }
  else {
    memset(buf, 0, 32);
  }
  int v25 = *CtrXPC::Result::operator=(&v48, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v33 < 0)
  {
    operator delete(v32[0]);
    if (v25) {
      goto LABEL_97;
    }
  }
  else if (v25)
  {
    goto LABEL_97;
  }
  id v26 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1387;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s:%d: Reset kWPANTUNDVendor_Openthread_Radio_Counters stats", buf, 0x12u);
  }

LABEL_97:
  id v27 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v30, "vendor:streaming:stats");
  if (v27) {
    [(CtrInternalClient *)v27 setProperty:v30 property_val:"0"];
  }
  else {
    memset(buf, 0, 32);
  }
  int v28 = *CtrXPC::Result::operator=(&v48, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v31 < 0)
  {
    operator delete(v30[0]);
    if (v28) {
      goto LABEL_109;
    }
  }
  else if (v28)
  {
    goto LABEL_109;
  }
  id v29 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetNetworkRadioMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1392;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s:%d: Reset kWPANTUNDVendor_StreamingStats stats", buf, 0x12u);
  }

LABEL_109:
  CAMetricsHandlers_handle_reset_channelSelectionData();
  if (SHIBYTE(v50) < 0) {
    operator delete((void *)v49);
  }
}

- (void)getAllMacMetrics
{
  std::string::basic_string[abi:ne180100]<0>(buf, "Command success");
  int v65 = 0;
  long long v66 = *(_OWORD *)buf;
  uint64_t v67 = *(void *)&buf[16];
  id v63 = 0;
  id v64 = xpc_null_create();
  unsigned int v3 = +[NSMutableDictionary dictionary];
  if (byte_1004B6447 >= 0) {
    int v4 = &mDaemonVersion;
  }
  else {
    int v4 = (uint64_t *)mDaemonVersion;
  }
  id v5 = +[NSString stringWithUTF8String:v4];
  [v3 setObject:v5 forKey:@"header_daemon_version"];

  if (byte_1004B645F >= 0) {
    BOOL v6 = &mVendorVersion;
  }
  else {
    BOOL v6 = (uint64_t *)mVendorVersion;
  }
  int v7 = +[NSString stringWithUTF8String:v6];
  [v3 setObject:v7 forKey:@"header_vendor_version"];

  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(__p, "NCP:Counter:AllMac:AsValMap");
  if (CtrInternalClientPtr) {
    [CtrInternalClientPtr getProperty:__p output:&v63];
  }
  else {
    memset(buf, 0, 32);
  }
  int v9 = *CtrXPC::Result::operator=(&v65, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v62 < 0)
  {
    operator delete(__p[0]);
    if (v9) {
      goto LABEL_23;
    }
  }
  else if (v9)
  {
    goto LABEL_23;
  }
  int v10 = v63;
  if (v63) {
    int v10 = (placeholder *)(*(uint64_t (**)(placeholder *))(*(void *)v63 + 24))(v63);
  }
  v60.var0 = v10;
  convert_ValMap_to_xpc_object(&v60, "NCP:Counter:AllMac:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v11 = *(id *)buf;
  xpc_object_t v12 = xpc_null_create();

  id v13 = v64;
  id v64 = v11;

  if (v60.var0) {
    (*(void (**)(placeholder *))(*(void *)v60.var0 + 8))(v60.var0);
  }
  id v14 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getAllMacMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1410;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s:%d: kWPANTUNDProperty_NCPCounterAllMacAsValMap Property", buf, 0x12u);
  }

  *(void *)std::string buf = &v64;
  *(void *)&buf[8] = "value";
  xpc_object_t v15 = xpc::dict::object_proxy::operator*((uint64_t)buf);
  CAMetricsHandlers_handle_getprop_allmac(v15, v3);

LABEL_23:
  [(ThreadNetworkManagerInstance *)self addCommonDimensions:v3];
  v58[1] = _NSConcreteStackBlock;
  v58[2] = 3221225472;
  v58[3] = __48__ThreadNetworkManagerInstance_getAllMacMetrics__block_invoke;
  v58[4] = &unk_100495710;
  id v16 = v3;
  id v59 = v16;
  AnalyticsSendEventLazy();
  [v16 removeAllObjects];
  if (byte_1004B6447 >= 0) {
    int v17 = &mDaemonVersion;
  }
  else {
    int v17 = (uint64_t *)mDaemonVersion;
  }
  int v18 = +[NSString stringWithUTF8String:v17];
  [v16 setObject:v18 forKey:@"header_daemon_version"];

  if (byte_1004B645F >= 0) {
    int v19 = &mVendorVersion;
  }
  else {
    int v19 = (uint64_t *)mVendorVersion;
  }
  xpc_object_t v20 = +[NSString stringWithUTF8String:v19];
  [v16 setObject:v20 forKey:@"header_vendor_version"];

  v58[0] = 0;
  id v21 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v56, "vendor:MAC:packet:SizeHistogram:AsValMap");
  if (v21) {
    [(CtrInternalClient *)v21 getProperty:v56 output:v58];
  }
  else {
    memset(buf, 0, 32);
  }
  int v22 = *CtrXPC::Result::operator=(&v65, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v57 < 0)
  {
    operator delete(v56[0]);
    if (v22) {
      goto LABEL_45;
    }
  }
  else if (v22)
  {
    goto LABEL_45;
  }
  xpc_object_t v23 = (placeholder *)v58[0];
  if (v58[0]) {
    xpc_object_t v23 = (placeholder *)(*(uint64_t (**)(void))(*(void *)v58[0] + 24))(v58[0]);
  }
  v55.var0 = v23;
  convert_ValMap_to_xpc_object(&v55, "vendor:MAC:packet:SizeHistogram:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v24 = *(id *)buf;
  xpc_object_t v25 = xpc_null_create();

  id v26 = v64;
  id v64 = v24;

  if (v55.var0) {
    (*(void (**)(placeholder *))(*(void *)v55.var0 + 8))(v55.var0);
  }
  id v27 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getAllMacMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1430;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s:%d: kWPANTUNDVendor_MAC_Packet_Size_HistogramAsValMap Property", buf, 0x12u);
  }

  *(void *)std::string buf = &v64;
  *(void *)&buf[8] = "value";
  int v28 = xpc::dict::object_proxy::operator*((uint64_t)buf);
  CAMetricsHandlers_handle_getprop_macPktSize(v28, v16);

LABEL_45:
  int v54 = 0;
  id v29 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v52, "NCP:MacRetryHistogram:AsValMap");
  if (v29) {
    [(CtrInternalClient *)v29 getProperty:v52 output:&v54];
  }
  else {
    memset(buf, 0, 32);
  }
  int v30 = *CtrXPC::Result::operator=(&v65, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v53 < 0)
  {
    operator delete(v52[0]);
    if (v30) {
      goto LABEL_61;
    }
  }
  else if (v30)
  {
    goto LABEL_61;
  }
  char v31 = v54;
  if (v54) {
    char v31 = (placeholder *)(*(uint64_t (**)(placeholder *))(*(void *)v54 + 24))(v54);
  }
  v51.var0 = v31;
  convert_ValMap_to_xpc_object(&v51, "NCP:MacRetryHistogram:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v32 = *(id *)buf;
  xpc_object_t v33 = xpc_null_create();

  id v34 = v64;
  id v64 = v32;

  if (v51.var0) {
    (*(void (**)(placeholder *))(*(void *)v51.var0 + 8))(v51.var0);
  }
  char v35 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getAllMacMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1438;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%s:%d: kWPANTUNDProperty_NCPMacRetryHistogramAsValMap Property", buf, 0x12u);
  }

  *(void *)std::string buf = &v64;
  *(void *)&buf[8] = "value";
  xpc_object_t v36 = xpc::dict::object_proxy::operator*((uint64_t)buf);
  CAMetricsHandlers_handle_getprop_macretry(v36, v16);

LABEL_61:
  uint64_t v50 = 0;
  char v37 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v48, "vendor:MAC:packet:ErrorHistogram:AsValMap");
  if (v37) {
    [(CtrInternalClient *)v37 getProperty:v48 output:&v50];
  }
  else {
    memset(buf, 0, 32);
  }
  int v38 = *CtrXPC::Result::operator=(&v65, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v49 < 0)
  {
    operator delete(v48[0]);
    if (v38) {
      goto LABEL_77;
    }
  }
  else if (v38)
  {
    goto LABEL_77;
  }
  char v39 = v50;
  if (v50) {
    char v39 = (placeholder *)(*(uint64_t (**)(placeholder *))(*(void *)v50 + 24))(v50);
  }
  v47.var0 = v39;
  convert_ValMap_to_xpc_object(&v47, "vendor:MAC:packet:ErrorHistogram:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v40 = *(id *)buf;
  xpc_object_t v41 = xpc_null_create();

  id v42 = v64;
  id v64 = v40;

  if (v47.var0) {
    (*(void (**)(placeholder *))(*(void *)v47.var0 + 8))(v47.var0);
  }
  char v43 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getAllMacMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1446;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%s:%d: kWPANTUNDVendor_MAC_Packet_Error_HistogramAsValMap Property", buf, 0x12u);
  }

  *(void *)std::string buf = &v64;
  *(void *)&buf[8] = "value";
  xpc_object_t v44 = xpc::dict::object_proxy::operator*((uint64_t)buf);
  CAMetricsHandlers_handle_getprop_macerror(v44, v16);

LABEL_77:
  [(ThreadNetworkManagerInstance *)self addCommonDimensions:v16];
  id v45 = v16;
  AnalyticsSendExplodingEventLazy();

  [(ThreadNetworkManagerInstance *)self resetMacMetrics];
  if (v50) {
    (*(void (**)(placeholder *))(*(void *)v50 + 8))(v50);
  }
  if (v54) {
    (*(void (**)(placeholder *))(*(void *)v54 + 8))(v54);
  }
  if (v58[0]) {
    (*(void (**)(void))(*(void *)v58[0] + 8))(v58[0]);
  }

  if (v63) {
    (*(void (**)(placeholder *))(*(void *)v63 + 8))(v63);
  }
  id v46 = v64;
  id v64 = 0;

  if (SHIBYTE(v67) < 0) {
    operator delete((void *)v66);
  }
}

id __48__ThreadNetworkManagerInstance_getAllMacMetrics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __48__ThreadNetworkManagerInstance_getAllMacMetrics__block_invoke_208(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)resetMacMetrics
{
  std::string::basic_string[abi:ne180100]<0>(buf, "Command success");
  int v23 = 0;
  *(_OWORD *)id v24 = *(_OWORD *)buf;
  uint64_t v25 = *(void *)&buf[16];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(__p, "NCP:Counter:AllMac");
  if (CtrInternalClientPtr) {
    [CtrInternalClientPtr setProperty:__p property_val:"0"];
  }
  else {
    memset(buf, 0, 32);
  }
  int v4 = *CtrXPC::Result::operator=(&v23, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v22 < 0) {
    operator delete(__p[0]);
  }
  if (!v4)
  {
    id v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetMacMetrics]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1499;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Reset kWPANTUNDProperty_NCPCounterAllMac stats", buf, 0x12u);
    }
  }
  BOOL v6 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v19, "vendor:MAC:packet:SizeHistogram");
  if (v6) {
    [(CtrInternalClient *)v6 setProperty:v19 property_val:"0"];
  }
  else {
    memset(buf, 0, 32);
  }
  int v7 = *CtrXPC::Result::operator=(&v23, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v20 < 0)
  {
    operator delete(v19[0]);
    if (v7) {
      goto LABEL_24;
    }
  }
  else if (v7)
  {
    goto LABEL_24;
  }
  id v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetMacMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1504;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:%d: Reset kWPANTUNDVendor_MAC_Packet_Size_Histogram stats", buf, 0x12u);
  }

LABEL_24:
  int v9 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v17, "NCP:MacRetryHistogram");
  if (v9) {
    [(CtrInternalClient *)v9 setProperty:v17 property_val:"0"];
  }
  else {
    memset(buf, 0, 32);
  }
  int v10 = *CtrXPC::Result::operator=(&v23, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v18 < 0)
  {
    operator delete(v17[0]);
    if (v10) {
      goto LABEL_36;
    }
  }
  else if (v10)
  {
    goto LABEL_36;
  }
  id v11 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetMacMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1509;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s:%d: Reset kWPANTUNDProperty_NCPMacRetryHistogram stats", buf, 0x12u);
  }

LABEL_36:
  xpc_object_t v12 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v15, "vendor:MAC:packet:ErrorHistogram");
  if (v12) {
    [(CtrInternalClient *)v12 setProperty:v15 property_val:"0"];
  }
  else {
    memset(buf, 0, 32);
  }
  int v13 = *CtrXPC::Result::operator=(&v23, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v16 < 0)
  {
    operator delete(v15[0]);
    if (v13) {
      goto LABEL_48;
    }
  }
  else if (v13)
  {
    goto LABEL_48;
  }
  id v14 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetMacMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1514;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s:%d: Reset kWPANTUNDVendor_MAC_Packet_Error_Histogram stats", buf, 0x12u);
  }

LABEL_48:
  if (SHIBYTE(v25) < 0) {
    operator delete(v24[0]);
  }
}

- (void)getIPMLEMetrics:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(v13, "Command success");
  xpc_object_t v5 = v13[0];
  int v6 = v14;
  xpc_object_t v7 = xpc_null_create();
  v13[0] = v7;
  if (byte_1004B6447 >= 0) {
    id v8 = &mDaemonVersion;
  }
  else {
    id v8 = (uint64_t *)mDaemonVersion;
  }
  int v9 = +[NSString stringWithUTF8String:v8];
  [v4 setObject:v9 forKey:@"header_daemon_version"];

  if (byte_1004B645F >= 0) {
    int v10 = &mVendorVersion;
  }
  else {
    int v10 = (uint64_t *)mVendorVersion;
  }
  id v11 = +[NSString stringWithUTF8String:v10];
  [v4 setObject:v11 forKey:@"header_vendor_version"];

  [(ThreadNetworkManagerInstance *)self addCommonDimensions:v4];
  id v12 = v4;
  AnalyticsSendEventLazy();
  [(ThreadNetworkManagerInstance *)self resetIPMLEMetrics];

  if (v6 < 0) {
    operator delete(v5);
  }
}

id __48__ThreadNetworkManagerInstance_getIPMLEMetrics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)resetIPMLEMetrics
{
  std::string::basic_string[abi:ne180100]<0>(buf, "Command success");
  int v13 = 0;
  *(_OWORD *)char v14 = *(_OWORD *)buf;
  uint64_t v15 = *(void *)&buf[16];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(__p, "NCP:Counter:AllIPv6");
  if (CtrInternalClientPtr) {
    [CtrInternalClientPtr setProperty:__p property_val:"0"];
  }
  else {
    memset(buf, 0, 32);
  }
  int v4 = *CtrXPC::Result::operator=(&v13, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v12 < 0)
  {
    operator delete(__p[0]);
    if (v4) {
      goto LABEL_13;
    }
  }
  else if (v4)
  {
    goto LABEL_13;
  }
  xpc_object_t v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetIPMLEMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1622;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Reset kWPANTUNDProperty_NCPCounterAllIPv6 stats", buf, 0x12u);
  }

LABEL_13:
  int v6 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v9, "NCP:Counter:Thread:Mle");
  if (v6) {
    [(CtrInternalClient *)v6 setProperty:v9 property_val:"0"];
  }
  else {
    memset(buf, 0, 32);
  }
  int v7 = *CtrXPC::Result::operator=(&v13, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v10 < 0)
  {
    operator delete(v9[0]);
    if (v7) {
      goto LABEL_25;
    }
  }
  else if (v7)
  {
    goto LABEL_25;
  }
  id v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetIPMLEMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1627;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:%d: Reset kWPANTUNDProperty_NCPCounterThreadMle stats", buf, 0x12u);
  }

LABEL_25:
  if (SHIBYTE(v15) < 0) {
    operator delete(v14[0]);
  }
}

- (void)getEngagementMetrics
{
  std::string::basic_string[abi:ne180100]<0>(buf, "Command success");
  int v52 = 0;
  long long v53 = *(_OWORD *)buf;
  uint64_t v54 = *(void *)&buf[16];
  id v51 = xpc_null_create();
  unsigned int v3 = +[NSMutableDictionary dictionary];
  if (byte_1004B6447 >= 0) {
    int v4 = &mDaemonVersion;
  }
  else {
    int v4 = (uint64_t *)mDaemonVersion;
  }
  xpc_object_t v5 = +[NSString stringWithUTF8String:v4];
  [(NSMutableDictionary *)v3 setObject:v5 forKey:@"header_daemon_version"];

  if (byte_1004B645F >= 0) {
    int v6 = &mVendorVersion;
  }
  else {
    int v6 = (uint64_t *)mVendorVersion;
  }
  int v7 = +[NSString stringWithUTF8String:v6];
  [(NSMutableDictionary *)v3 setObject:v7 forKey:@"header_vendor_version"];

  uint64_t v50 = 0;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(__p, "vendor:neighbor:count:histogram:AsValMap");
  if (CtrInternalClientPtr) {
    [CtrInternalClientPtr getProperty:__p output:&v50];
  }
  else {
    memset(buf, 0, 32);
  }
  int v9 = *CtrXPC::Result::operator=(&v52, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v49 < 0)
  {
    operator delete(__p[0]);
    if (v9) {
      goto LABEL_23;
    }
  }
  else if (v9)
  {
    goto LABEL_23;
  }
  char v10 = v50;
  if (v50) {
    char v10 = (placeholder *)(*(uint64_t (**)(placeholder *))(*(void *)v50 + 24))(v50);
  }
  v47.var0 = v10;
  convert_ValMap_to_xpc_object(&v47, "vendor:neighbor:count:histogram:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v11 = *(id *)buf;
  xpc_object_t v12 = xpc_null_create();

  id v13 = v51;
  id v51 = v11;

  if (v47.var0) {
    (*(void (**)(placeholder *))(*(void *)v47.var0 + 8))(v47.var0);
  }
  char v14 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getEngagementMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1645;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s:%d: kWPANTUNDVendor_Connected_Neighbors_HistogramAsValMap Property", buf, 0x12u);
  }

  *(void *)std::string buf = &v51;
  *(void *)&buf[8] = "value";
  uint64_t v15 = xpc::dict::object_proxy::operator*((uint64_t)buf);
  CAMetricsHandlers_handle_getprop_connectednodes(v15, v3);

LABEL_23:
  id v46 = 0;
  char v16 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v44, "vendor:joiner:RSSIHistogram:AsValMap");
  if (v16) {
    [(CtrInternalClient *)v16 getProperty:v44 output:&v46];
  }
  else {
    memset(buf, 0, 32);
  }
  int v17 = *CtrXPC::Result::operator=(&v52, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v45 < 0)
  {
    operator delete(v44[0]);
    if (v17) {
      goto LABEL_39;
    }
  }
  else if (v17)
  {
    goto LABEL_39;
  }
  char v18 = v46;
  if (v46) {
    char v18 = (placeholder *)(*(uint64_t (**)(placeholder *))(*(void *)v46 + 24))(v46);
  }
  v43.var0 = v18;
  convert_ValMap_to_xpc_object(&v43, "vendor:joiner:RSSIHistogram:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v19 = *(id *)buf;
  xpc_object_t v20 = xpc_null_create();

  id v21 = v51;
  id v51 = v19;

  if (v43.var0) {
    (*(void (**)(placeholder *))(*(void *)v43.var0 + 8))(v43.var0);
  }
  char v22 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getEngagementMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1653;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s:%d: kWPANTUNDVendor_Joiner_RSSI_HistogramAsValMap Property", buf, 0x12u);
  }

  *(void *)std::string buf = &v51;
  *(void *)&buf[8] = "value";
  int v23 = xpc::dict::object_proxy::operator*((uint64_t)buf);
  CAMetricsHandlers_handle_getprop_joinerRssi(v23, v3);

LABEL_39:
  CAMetricsHandlers_handle_get_joinCountersData(v3);
  [(ThreadNetworkManagerInstance *)self addCommonDimensions:v3];
  v42[1] = _NSConcreteStackBlock;
  v42[2] = 3221225472;
  v42[3] = __52__ThreadNetworkManagerInstance_getEngagementMetrics__block_invoke;
  v42[4] = &unk_100495710;
  id v24 = v3;
  v42[5] = v24;
  AnalyticsSendExplodingEventLazy();

  [(NSMutableDictionary *)v24 removeAllObjects];
  if (byte_1004B6447 >= 0) {
    uint64_t v25 = &mDaemonVersion;
  }
  else {
    uint64_t v25 = (uint64_t *)mDaemonVersion;
  }
  id v26 = +[NSString stringWithUTF8String:v25];
  [(NSMutableDictionary *)v24 setObject:v26 forKey:@"header_daemon_version"];

  if (byte_1004B645F >= 0) {
    id v27 = &mVendorVersion;
  }
  else {
    id v27 = (uint64_t *)mVendorVersion;
  }
  int v28 = +[NSString stringWithUTF8String:v27];
  [(NSMutableDictionary *)v24 setObject:v28 forKey:@"header_vendor_version"];

  v42[0] = 0;
  id v29 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v40, "vendor:linkloss:counters:AsValMap");
  if (v29) {
    [(CtrInternalClient *)v29 getProperty:v40 output:v42];
  }
  else {
    memset(buf, 0, 32);
  }
  int v30 = *CtrXPC::Result::operator=(&v52, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v41 < 0)
  {
    operator delete(v40[0]);
    if (v30) {
      goto LABEL_61;
    }
  }
  else if (v30)
  {
    goto LABEL_61;
  }
  char v31 = (placeholder *)v42[0];
  if (v42[0]) {
    char v31 = (placeholder *)(*(uint64_t (**)(void))(*(void *)v42[0] + 24))(v42[0]);
  }
  v39.var0 = v31;
  convert_ValMap_to_xpc_object(&v39, "vendor:linkloss:counters:AsValMap", "PropGet", (xpc_object_t *)buf);
  id v32 = *(id *)buf;
  xpc_object_t v33 = xpc_null_create();

  id v34 = v51;
  id v51 = v32;

  if (v39.var0) {
    (*(void (**)(placeholder *))(*(void *)v39.var0 + 8))(v39.var0);
  }
  char v35 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getEngagementMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1680;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%s:%d: kWPANTUNDVendor_Link_Loss_Counters_AsValMap Property", buf, 0x12u);
  }

  *(void *)std::string buf = &v51;
  *(void *)&buf[8] = "value";
  xpc_object_t v36 = xpc::dict::object_proxy::operator*((uint64_t)buf);
  CAMetricsHandlers_handle_getprop_linkLossCounters(v36, v24);

LABEL_61:
  [(ThreadNetworkManagerInstance *)self addCommonDimensions:v24];
  char v37 = v24;
  AnalyticsSendEventLazy();
  [(ThreadNetworkManagerInstance *)self resetEngagementMetrics];

  if (v42[0]) {
    (*(void (**)(void))(*(void *)v42[0] + 8))(v42[0]);
  }
  if (v46) {
    (*(void (**)(placeholder *))(*(void *)v46 + 8))(v46);
  }
  if (v50) {
    (*(void (**)(placeholder *))(*(void *)v50 + 8))(v50);
  }

  id v38 = v51;
  id v51 = 0;

  if (SHIBYTE(v54) < 0) {
    operator delete((void *)v53);
  }
}

id __52__ThreadNetworkManagerInstance_getEngagementMetrics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __52__ThreadNetworkManagerInstance_getEngagementMetrics__block_invoke_227(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)resetEngagementMetrics
{
  std::string::basic_string[abi:ne180100]<0>(buf, "Command success");
  int v18 = 0;
  *(_OWORD *)id v19 = *(_OWORD *)buf;
  uint64_t v20 = *(void *)&buf[16];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(__p, "vendor:neighbor:count:histogram");
  if (CtrInternalClientPtr) {
    [CtrInternalClientPtr setProperty:__p property_val:"0"];
  }
  else {
    memset(buf, 0, 32);
  }
  int v4 = *CtrXPC::Result::operator=(&v18, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v17 < 0)
  {
    operator delete(__p[0]);
    if (v4) {
      goto LABEL_13;
    }
  }
  else if (v4)
  {
    goto LABEL_13;
  }
  xpc_object_t v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetEngagementMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1701;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Reset kWPANTUNDVendor_Connected_Neighbors_Histogram stats", buf, 0x12u);
  }

LABEL_13:
  int v6 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v14, "vendor:joiner:RSSIHistogram");
  if (v6) {
    [(CtrInternalClient *)v6 setProperty:v14 property_val:"0"];
  }
  else {
    memset(buf, 0, 32);
  }
  int v7 = *CtrXPC::Result::operator=(&v18, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v15 < 0)
  {
    operator delete(v14[0]);
    if (v7) {
      goto LABEL_25;
    }
  }
  else if (v7)
  {
    goto LABEL_25;
  }
  id v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetEngagementMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1705;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:%d: Reset kWPANTUNDVendor_Joiner_RSSI_Histogram stats", buf, 0x12u);
  }

LABEL_25:
  CAMetricsHandlers_handle_reset_joinCountersData();
  int v9 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v12, "vendor:linkloss:counters");
  if (v9) {
    [(CtrInternalClient *)v9 setProperty:v12 property_val:"0"];
  }
  else {
    memset(buf, 0, 32);
  }
  int v10 = *CtrXPC::Result::operator=(&v18, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v13 < 0)
  {
    operator delete(v12[0]);
    if (v10) {
      goto LABEL_37;
    }
  }
  else if (v10)
  {
    goto LABEL_37;
  }
  id v11 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance resetEngagementMetrics]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1712;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s:%d: Reset kWPANTUNDVendor_Link_Loss_Counters stats", buf, 0x12u);
  }

LABEL_37:
  if (SHIBYTE(v20) < 0) {
    operator delete(v19[0]);
  }
}

- (void)getPowerMetrics
{
  unsigned int v3 = +[NSMutableDictionary dictionary];
  if (byte_1004B6447 >= 0) {
    int v4 = &mDaemonVersion;
  }
  else {
    int v4 = (uint64_t *)mDaemonVersion;
  }
  xpc_object_t v5 = +[NSString stringWithUTF8String:v4];
  [(NSMutableDictionary *)v3 setObject:v5 forKey:@"header_daemon_version"];

  if (byte_1004B645F >= 0) {
    int v6 = &mVendorVersion;
  }
  else {
    int v6 = (uint64_t *)mVendorVersion;
  }
  int v7 = +[NSString stringWithUTF8String:v6];
  [(NSMutableDictionary *)v3 setObject:v7 forKey:@"header_vendor_version"];

  CAMetricsHandlers_handle_get_PowerCountersData(v3);
  [(ThreadNetworkManagerInstance *)self addCommonDimensions:v3];
  id v8 = v3;
  AnalyticsSendEventLazy();
  int v9 = +[NSMutableDictionary dictionary];
  if (byte_1004B6447 >= 0) {
    int v10 = &mDaemonVersion;
  }
  else {
    int v10 = (uint64_t *)mDaemonVersion;
  }
  id v11 = +[NSString stringWithUTF8String:v10];
  [(NSMutableDictionary *)v9 setObject:v11 forKey:@"header_daemon_version"];

  if (byte_1004B645F >= 0) {
    xpc_object_t v12 = &mVendorVersion;
  }
  else {
    xpc_object_t v12 = (uint64_t *)mVendorVersion;
  }
  char v13 = +[NSString stringWithUTF8String:v12];
  [(NSMutableDictionary *)v9 setObject:v13 forKey:@"header_vendor_version"];

  CAMetricsHandlers_handle_get_PowerHistogramData(v9);
  [(ThreadNetworkManagerInstance *)self addCommonDimensions:v9];
  char v14 = v9;
  AnalyticsSendExplodingEventLazy();

  [(ThreadNetworkManagerInstance *)self resetPowerMetrics];
}

id __47__ThreadNetworkManagerInstance_getPowerMetrics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __47__ThreadNetworkManagerInstance_getPowerMetrics__block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)resetPowerMetrics
{
  v2 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315394;
    int v4 = "-[ThreadNetworkManagerInstance resetPowerMetrics]";
    __int16 v5 = 1024;
    int v6 = 1833;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:%d: Reset Power Metrics", (uint8_t *)&v3, 0x12u);
  }

  CAMetricsHandlers_handle_reset_PowerCountersData();
}

- (void)getTopologyMetrics
{
  std::string::basic_string[abi:ne180100]<0>(v10, "Command success");
  xpc_object_t v2 = v10[0];
  int v3 = v11;
  xpc_object_t v4 = xpc_null_create();
  v10[0] = v4;
  __int16 v5 = +[NSMutableDictionary dictionary];
  if (byte_1004B6447 >= 0) {
    int v6 = &mDaemonVersion;
  }
  else {
    int v6 = (uint64_t *)mDaemonVersion;
  }
  int v7 = +[NSString stringWithUTF8String:v6];
  [v5 setObject:v7 forKey:@"header_daemon_version"];

  if (byte_1004B645F >= 0) {
    id v8 = &mVendorVersion;
  }
  else {
    id v8 = (uint64_t *)mVendorVersion;
  }
  int v9 = +[NSString stringWithUTF8String:v8];
  [v5 setObject:v9 forKey:@"header_vendor_version"];

  if (v3 < 0) {
    operator delete(v2);
  }
}

- (void)resetTopologyMetrics
{
  std::string::basic_string[abi:ne180100]<0>(&__p, "Command success");
  if (v3 < 0) {
    operator delete(__p);
  }
}

- (void)configureRCP2PeriodicEvents
{
  id v4 = [objc_alloc((Class)NSBackgroundActivityScheduler) initWithIdentifier:@"com.apple.metrics.rcp2.threadradiod"];
  [v4 setRepeats:1];
  [v4 setInterval:86400.0];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = __59__ThreadNetworkManagerInstance_configureRCP2PeriodicEvents__block_invoke;
  v6[3] = &unk_10049C298;
  v6[4] = self;
  id v5 = v4;
  id v7 = v5;
  [v5 scheduleWithBlock:v6];
}

void __59__ThreadNetworkManagerInstance_configureRCP2PeriodicEvents__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) configureCAMetrics:1];
  if ([*(id *)(a1 + 40) shouldDefer])
  {
    uint64_t v3 = 2;
  }
  else
  {
    dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 168), &__block_literal_global_242);
    uint64_t v3 = 1;
  }
  v4[2](v4, v3);
}

- (void)getDaemonAndVendorVersions
{
  std::string::basic_string[abi:ne180100]<0>(buf, "Command success");
  int v15 = 0;
  *(_OWORD *)char v16 = *(_OWORD *)buf;
  uint64_t v17 = *(void *)&buf[16];
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(__p, "DaemonMorty:Version");
  if (CtrInternalClientPtr) {
    [CtrInternalClientPtr getProperty:__p output:&v14];
  }
  else {
    memset(buf, 0, 32);
  }
  int v4 = *CtrXPC::Result::operator=(&v15, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v12 < 0)
  {
    operator delete(__p[0]);
    if (v4) {
      goto LABEL_13;
    }
  }
  else if (v4)
  {
    goto LABEL_13;
  }
  id v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getDaemonAndVendorVersions]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2184;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Failed to get kWPANTUNDProperty_DaemonMortyVersion Property", buf, 0x12u);
  }

LABEL_13:
  any_to_string((const boost::any *)&v14, (uint64_t)buf);
  std::string::operator=[abi:ne180100]((uint64_t)&mDaemonVersion, (long long *)buf);
  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }
  int v6 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v9, "vendor:version");
  if (v6) {
    [(CtrInternalClient *)v6 getProperty:v9 output:&v13];
  }
  else {
    memset(buf, 0, 32);
  }
  int v7 = *CtrXPC::Result::operator=(&v15, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v10 < 0)
  {
    operator delete(v9[0]);
    if (v7) {
      goto LABEL_27;
    }
  }
  else if (v7)
  {
    goto LABEL_27;
  }
  id v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance getDaemonAndVendorVersions]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2189;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:%d: Failed to get kWPANTUNDVendor_Version Property", buf, 0x12u);
  }

LABEL_27:
  any_to_string((const boost::any *)&v13, (uint64_t)buf);
  std::string::operator=[abi:ne180100]((uint64_t)&mVendorVersion, (long long *)buf);
  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }
  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
  }
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  }
  if (SHIBYTE(v17) < 0) {
    operator delete(v16[0]);
  }
}

- (int)initializeKeyChainStore
{
  keyChainStore = self->_keyChainStore;
  if (!keyChainStore)
  {
    int v4 = +[THThreadNetworkCredentialsKeychainBackingStore defaultBackingStore];
    id v5 = [[THThreadNetworkCredentialsStoreLocalClient alloc] initApplePrivateStoreWithBackingStore:v4];
    int v6 = self->_keyChainStore;
    self->_keyChainStore = v5;

    keyChainStore = self->_keyChainStore;
  }
  return keyChainStore == 0;
}

- (int)retrieveActiveDataSetRecordForUniqueId:(const char *)a3 record:(id *)a4
{
  uint64_t v59 = 0;
  any v60 = &v59;
  uint64_t v61 = 0x2020000000;
  int v62 = 1;
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x3032000000;
  id v56 = __Block_byref_object_copy__0;
  char v57 = __Block_byref_object_dispose__0;
  id v58 = 0;
  uint64_t v47 = 0;
  int v48 = &v47;
  uint64_t v49 = 0x3032000000;
  uint64_t v50 = __Block_byref_object_copy__0;
  id v51 = __Block_byref_object_dispose__0;
  id v52 = 0;
  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x3032000000;
  xpc_object_t v44 = __Block_byref_object_copy__0;
  char v45 = __Block_byref_object_dispose__0;
  id v46 = 0;
  if (!self->_keyChainStore)
  {
    id v24 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance retrieveActiveDataSetRecordForUniqueId:record:](v24, v25, v26, v27, v28, v29, v30, v31);
    }
    goto LABEL_15;
  }
  if (!a3)
  {
    id v24 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance retrieveActiveDataSetRecordForUniqueId:record:]();
    }
LABEL_15:

    int v6 = 0;
    goto LABEL_16;
  }
  int v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:v6];
  id v8 = (void *)v54[5];
  v54[5] = (uint64_t)v7;

  if (v54[5])
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    char v10 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = v54[5];
      *(_DWORD *)std::string buf = 136315394;
      id v64 = "-[ThreadNetworkManagerInstance retrieveActiveDataSetRecordForUniqueId:record:]";
      __int16 v65 = 2112;
      uint64_t v66 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s: NSUUID :  unique Network Id is %@", buf, 0x16u);
    }

    keyChainStore = self->_keyChainStore;
    uint64_t v13 = v54[5];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = __78__ThreadNetworkManagerInstance_retrieveActiveDataSetRecordForUniqueId_record___block_invoke;
    v35[3] = &unk_10049C2C0;
    char v37 = &v53;
    id v38 = &v41;
    any v39 = &v59;
    id v40 = &v47;
    uint64_t v14 = v9;
    xpc_object_t v36 = v14;
    [(THThreadNetworkCredentialsStoreLocalClient *)keyChainStore retrieveActiveDataSetRecordWithUniqueIdentifier:v13 completion:v35];
    dispatch_time_t v15 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v14, v15))
    {
      char v16 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance retrieveActiveDataSetRecordForUniqueId:record:].cold.4(v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }
    else if (!v48[5])
    {
      *a4 = (id) v42[5];
      int v32 = *((_DWORD *)v60 + 6);
      goto LABEL_22;
    }
    int v32 = 1;
    *((_DWORD *)v60 + 6) = 1;
LABEL_22:

    goto LABEL_23;
  }
  xpc_object_t v33 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    -[ThreadNetworkManagerInstance retrieveActiveDataSetRecordForUniqueId:record:]();
  }

LABEL_16:
  int v32 = *((_DWORD *)v60 + 6);
LABEL_23:
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  return v32;
}

void __78__ThreadNetworkManagerInstance_retrieveActiveDataSetRecordForUniqueId_record___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __78__ThreadNetworkManagerInstance_retrieveActiveDataSetRecordForUniqueId_record___block_invoke_cold_1();
    }
  }
  else
  {
    dispatch_semaphore_t v9 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v14 = 138412290;
      uint64_t v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Got the Credentials Record, for the Network : %@", (uint8_t *)&v14, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  char v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v7;
  id v13 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int)retrieveCredentialsForUniqueId:(const char *)a3 credentialsRecord_t:(id *)a4
{
  uint64_t v59 = 0;
  any v60 = &v59;
  uint64_t v61 = 0x2020000000;
  int v62 = 1;
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x3032000000;
  id v56 = __Block_byref_object_copy__0;
  char v57 = __Block_byref_object_dispose__0;
  id v58 = 0;
  uint64_t v47 = 0;
  int v48 = &v47;
  uint64_t v49 = 0x3032000000;
  uint64_t v50 = __Block_byref_object_copy__0;
  id v51 = __Block_byref_object_dispose__0;
  id v52 = 0;
  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x3032000000;
  xpc_object_t v44 = __Block_byref_object_copy__0;
  char v45 = __Block_byref_object_dispose__0;
  id v46 = 0;
  if (!self->_keyChainStore)
  {
    id v24 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance retrieveCredentialsForUniqueId:credentialsRecord_t:](v24, v25, v26, v27, v28, v29, v30, v31);
    }
    goto LABEL_15;
  }
  if (!a3)
  {
    id v24 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance retrieveCredentialsForUniqueId:credentialsRecord_t:]();
    }
LABEL_15:

    id v6 = 0;
    goto LABEL_16;
  }
  id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:v6];
  id v8 = (void *)v54[5];
  v54[5] = (uint64_t)v7;

  if (v54[5])
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    uint64_t v10 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = v54[5];
      *(_DWORD *)std::string buf = 136315394;
      id v64 = "-[ThreadNetworkManagerInstance retrieveCredentialsForUniqueId:credentialsRecord_t:]";
      __int16 v65 = 2112;
      uint64_t v66 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s: NSUUID :  unique Network Id is %@", buf, 0x16u);
    }

    keyChainStore = self->_keyChainStore;
    uint64_t v13 = v54[5];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = __83__ThreadNetworkManagerInstance_retrieveCredentialsForUniqueId_credentialsRecord_t___block_invoke;
    v35[3] = &unk_10049C2E8;
    char v37 = &v53;
    id v38 = &v41;
    any v39 = &v59;
    id v40 = &v47;
    int v14 = v9;
    xpc_object_t v36 = v14;
    [(THThreadNetworkCredentialsStoreLocalClient *)keyChainStore retrieveRecordWithUniqueIdentifier:v13 completion:v35];
    dispatch_time_t v15 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v14, v15))
    {
      char v16 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance retrieveCredentialsForUniqueId:credentialsRecord_t:].cold.4(v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }
    else if (!v48[5])
    {
      *a4 = (id) v42[5];
      int v32 = *((_DWORD *)v60 + 6);
      goto LABEL_22;
    }
    int v32 = 1;
    *((_DWORD *)v60 + 6) = 1;
LABEL_22:

    goto LABEL_23;
  }
  xpc_object_t v33 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    -[ThreadNetworkManagerInstance retrieveCredentialsForUniqueId:credentialsRecord_t:]();
  }

LABEL_16:
  int v32 = *((_DWORD *)v60 + 6);
LABEL_23:
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  return v32;
}

void __83__ThreadNetworkManagerInstance_retrieveCredentialsForUniqueId_credentialsRecord_t___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __78__ThreadNetworkManagerInstance_retrieveActiveDataSetRecordForUniqueId_record___block_invoke_cold_1();
    }
  }
  else
  {
    dispatch_semaphore_t v9 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v14 = 138412290;
      uint64_t v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Got the Credentials Record, for the Network : %@", (uint8_t *)&v14, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  char v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v7;
  id v13 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)validateDataSetTLVs:(id)a3
{
  uint64_t v4 = 0;
  return [(ThreadNetworkManagerInstance *)self validateDataSetTLVs:a3 creds:&v4];
}

- (BOOL)validateDataSetTLVs:(id)a3 creds:(id *)a4
{
  id v89 = a3;
  uint64_t v4 = (unsigned __int8 *)[v89 bytes];
  unsigned int v5 = [v89 length];
  id v6 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]7();
  }

  encode_data_into_string(v4, v5, __b, 0x3E8uLL, 0);
  id v7 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]6((uint64_t)__b, v7, v8, v9, v10, v11, v12, v13);
  }

  if (!v5)
  {
    LOBYTE(v14) = 0;
    long long v92 = 0;
    char v93 = 0;
    uint64_t v90 = 0;
    any v91 = 0;
    char v94 = 0;
LABEL_82:
    if (v94 && v90 && v93 && v92 && v91 && (_BYTE)v14)
    {
      uint64_t v43 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:].cold.7();
      }

      LOBYTE(v85) = 1;
      xpc_object_t v44 = [objc_alloc((Class)THThreadNetworkCredentials) initWithMasterKey:v93 passPhrase:0 PSKc:v92 channel:v14 PANID:v91 userInfo:0 credentialDataSet:0 isActiveDevice:v85];
      if (v44)
      {
        char v45 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:].cold.6();
        }

        id v46 = [objc_alloc((Class)THThreadNetwork) initWithName:v94 extendedPANID:v90];
        if (v46)
        {
          id v47 = [objc_alloc((Class)THThreadNetworkCredentialsDataSet) initWithDataSetArray:v89 userInfo:0];
          if (v47)
          {
            int v48 = v47;
            id v49 = objc_alloc((Class)THThreadNetworkBorderAgent);
            uint64_t v50 = getUUIDAsStr();
            id v51 = [v50 substringToIndex:16];
            id v52 = [(ThreadNetworkManagerInstance *)self dataFromHexString:v51];
            id v53 = [v49 initWithBaDiscrId:v52];

            if (v53)
            {
              id v54 = [objc_alloc((Class)THThreadNetworkCredentialsActiveDataSetRecord) initWithBorderAgent:v53 credentialsDataSet:v48 network:v46 credentials:v44 uniqueIdentifier:0 keychainAccessGroup:@"000000000000" creationDate:0 lastModificationDate:0];
              *a4 = v54;
              if (v54)
              {
                uint64_t v55 = [v54 credentials];
                [v55 setIsActiveDevice:1];

                id v56 = objc_alloc((Class)THThreadNetworkCredentialsDataSet);
                any v87 = [*a4 credentialsDataSet];
                uint64_t v57 = [v87 dataSetArray];
                id v58 = [*a4 credentials];
                uint64_t v59 = [v58 userInfo];
                any v60 = (void *)v57;
                id v61 = [v56 initWithDataSetArray:v57 userInfo:v59];
                int v62 = [*a4 credentials];
                [v62 setCredentialsDataSet:v61];

                BOOL v63 = 1;
LABEL_150:

                return v63;
              }
              unsigned int v69 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
              if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
                -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:].cold.5();
              }
            }
            else
            {
              uint64_t v68 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
                -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:].cold.4();
              }
            }
          }
          else
          {
            uint64_t v67 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
              -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]();
            }
          }
        }
        else
        {
          id v64 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
            -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]();
          }
        }
      }
      else
      {
        xpc_object_t v44 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]();
        }
      }
    }
    else
    {
      xpc_object_t v44 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:].cold.8();
      }
    }
LABEL_149:
    BOOL v63 = 0;
    goto LABEL_150;
  }
  char v93 = 0;
  char v94 = 0;
  uint64_t v90 = 0;
  any v91 = 0;
  long long v92 = 0;
  LOBYTE(v14) = 0;
  unsigned int v15 = 0;
  while (2)
  {
    uint64_t v16 = v15 + 1;
    if (v16 >= v5)
    {
      __int16 v65 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]5();
      }
LABEL_147:

      xpc_object_t v44 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:].cold.9();
      }
      goto LABEL_149;
    }
    unint64_t v17 = v15 + 2;
    if (v15 >= 0xFFFFFFFE || (uint64_t v18 = v4[v16], v19 = (v17 + v18), __CFADD__(v17, v18))) {
LABEL_151:
    }
      __break(0x5500u);
    if (v19 > v5)
    {
      __int16 v65 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]0();
      }
      goto LABEL_147;
    }
    int v20 = v4[v15];
    switch(v4[v15])
    {
      case 0u:
        uint64_t v21 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::string buf = 136315394;
          uint64_t v96 = "-[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]";
          __int16 v97 = 1024;
          *(_DWORD *)int v98 = 2516;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded channel Line : %d", buf, 0x12u);
        }

        if (v18 != 3)
        {
          __int16 v65 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
            -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]7();
          }
          goto LABEL_147;
        }
        if (v4[v17])
        {
          __int16 v65 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
            -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]6();
          }
          goto LABEL_147;
        }
        if (v15 >= 0xFFFFFFFC) {
          goto LABEL_151;
        }
        uint64_t v14 = v4[v15 + 4];
        if ((v14 - 27) <= 0xEFu)
        {
          __int16 v65 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
            -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]5(v14, v65, v78, v79, v80, v81, v82, v83);
          }
          goto LABEL_147;
        }
        uint64_t v22 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          goto LABEL_75;
        }
        *(_DWORD *)std::string buf = 136315394;
        uint64_t v96 = "-[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]";
        __int16 v97 = 1024;
        *(_DWORD *)int v98 = v14;
        uint64_t v23 = v22;
        id v24 = "%s: #MOS : Channel : %d";
        uint32_t v25 = 18;
        goto LABEL_33;
      case 1u:
        xpc_object_t v33 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::string buf = 136315394;
          uint64_t v96 = "-[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]";
          __int16 v97 = 1024;
          *(_DWORD *)int v98 = 2550;
          _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded pan id Line : %d", buf, 0x12u);
        }

        if (v18 != 2)
        {
          __int16 v65 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
            -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]8();
          }
          goto LABEL_147;
        }
        uint64_t v34 = +[NSData dataWithBytes:&v4[v17] length:2];

        uint64_t v22 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::string buf = 136315394;
          uint64_t v96 = "-[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]";
          __int16 v97 = 2112;
          *(void *)int v98 = v34;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: #MOS : PANID : %@", buf, 0x16u);
        }
        any v91 = (void *)v34;
        goto LABEL_75;
      case 2u:
        uint64_t v31 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::string buf = 136315394;
          uint64_t v96 = "-[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]";
          __int16 v97 = 1024;
          *(_DWORD *)int v98 = 2565;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded XPAN ID : %d", buf, 0x12u);
        }

        if (v18 != 8)
        {
          __int16 v65 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
            -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]9();
          }
          goto LABEL_147;
        }
        uint64_t v32 = +[NSData dataWithBytes:&v4[v17] length:8];

        uint64_t v22 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::string buf = 136315394;
          uint64_t v96 = "-[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]";
          __int16 v97 = 2112;
          *(void *)int v98 = v32;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: #MOS : XPAN ID: %@", buf, 0x16u);
        }
        uint64_t v90 = (void *)v32;
        goto LABEL_75;
      case 3u:
        BOOL result = memcpy(__dst, &v4[v17], v4[v16]);
        if (v18 != 255)
        {
          __dst[v18] = 0;
          id v38 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)std::string buf = 136315394;
            uint64_t v96 = "-[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]";
            __int16 v97 = 1024;
            *(_DWORD *)int v98 = 2505;
            _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded Network Name Line : %d", buf, 0x12u);
          }

          uint64_t v39 = +[NSString stringWithUTF8String:__dst];

          if (!v39)
          {
            __int16 v65 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
              -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]4(v65, v71, v72, v73, v74, v75, v76, v77);
            }
            char v94 = 0;
            goto LABEL_147;
          }
          uint64_t v22 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)std::string buf = 136315394;
            uint64_t v96 = "-[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]";
            __int16 v97 = 2112;
            *(void *)int v98 = v39;
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s : #MOS : Network Name : %@", buf, 0x16u);
          }
LABEL_76:

          char v94 = (void *)v39;
LABEL_77:
          unsigned int v42 = v15 + v18;
          if (__CFADD__(v15, v18)) {
            goto LABEL_151;
          }
          unsigned int v15 = v42 + 2;
          if (v42 >= 0xFFFFFFFE) {
            goto LABEL_151;
          }
          if (v15 >= v5) {
            goto LABEL_82;
          }
          continue;
        }
        __break(0x5512u);
        return result;
      case 4u:
        char v35 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::string buf = 136315394;
          uint64_t v96 = "-[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]";
          __int16 v97 = 1024;
          *(_DWORD *)int v98 = 2580;
          _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded pskc Line : %d", buf, 0x12u);
        }

        if (v18 != 16)
        {
          __int16 v65 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
            -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]0();
          }
          goto LABEL_147;
        }
        uint64_t v36 = +[NSData dataWithBytes:&v4[v17] length:16];

        uint64_t v22 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::string buf = 136315395;
          uint64_t v96 = "-[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]";
          __int16 v97 = 2117;
          *(void *)int v98 = v36;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: #MOS : PSKc : %{sensitive}@", buf, 0x16u);
        }
        long long v92 = (void *)v36;
        goto LABEL_75;
      case 5u:
        id v40 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::string buf = 136315394;
          uint64_t v96 = "-[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]";
          __int16 v97 = 1024;
          *(_DWORD *)int v98 = 2596;
          _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded master key Line : %d", buf, 0x12u);
        }

        if (v18 != 16)
        {
          __int16 v65 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
            -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]1();
          }
          goto LABEL_147;
        }
        uint64_t v41 = +[NSData dataWithBytes:&v4[v17] length:16];

        uint64_t v22 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::string buf = 136315395;
          uint64_t v96 = "-[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]";
          __int16 v97 = 2117;
          *(void *)int v98 = v41;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: #MOS : Master Key: %{sensitive}@", buf, 0x16u);
        }
        char v93 = (void *)v41;
        goto LABEL_75;
      case 6u:
      case 8u:
      case 9u:
      case 0xAu:
      case 0xBu:
        goto LABEL_31;
      case 7u:
        uint64_t v30 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::string buf = 136315394;
          uint64_t v96 = "-[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]";
          __int16 v97 = 1024;
          *(_DWORD *)int v98 = 2626;
          _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded mesh local prefix Line : %d", buf, 0x12u);
        }

        if (v18 == 8) {
          goto LABEL_77;
        }
        __int16 v65 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
          -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]4();
        }
        goto LABEL_147;
      case 0xCu:
        uint64_t v29 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::string buf = 136315394;
          uint64_t v96 = "-[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]";
          __int16 v97 = 1024;
          *(_DWORD *)int v98 = 2611;
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded security policy Line : %d", buf, 0x12u);
        }

        if ((v18 - 3) >= 2)
        {
          __int16 v65 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
            -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]3();
          }
          goto LABEL_147;
        }
        if (!v4[v17])
        {
          if (v15 >= 0xFFFFFFFD) {
            goto LABEL_151;
          }
          if (!v4[v15 + 3])
          {
            __int16 v65 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
              -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]2();
            }
            goto LABEL_147;
          }
        }
        goto LABEL_77;
      default:
        if (v20 != 53)
        {
LABEL_31:
          uint64_t v22 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)std::string buf = 136315650;
            uint64_t v96 = "-[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]";
            __int16 v97 = 1024;
            *(_DWORD *)int v98 = v20;
            *(_WORD *)&v98[4] = 1024;
            *(_DWORD *)&v98[6] = 2636;
            uint64_t v23 = v22;
            id v24 = "%s: #MOS : ==> Unknown type : %d, Line : %d";
            uint32_t v25 = 24;
LABEL_33:
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v24, buf, v25);
          }
LABEL_75:
          uint64_t v39 = (uint64_t)v94;
          goto LABEL_76;
        }
        uint64_t v26 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::string buf = 136315394;
          uint64_t v96 = "-[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]";
          __int16 v97 = 1024;
          *(_DWORD *)int v98 = 2467;
          _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s: #MOS : ==> Decoded Channel Mask TLV Line : %d", buf, 0x12u);
        }

        unsigned int v27 = v15 + 8;
        while (1)
        {
          if (v17 >= v19) {
            goto LABEL_77;
          }
          if (v17 + 1 >= v19) {
            break;
          }
          if (v17 > 0xFFFFFFF9) {
            goto LABEL_151;
          }
          if (v19 < v27) {
            break;
          }
          if ((v4[v17] & 0xFD) != 0)
          {
            __int16 v65 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
              -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]3();
            }
            goto LABEL_147;
          }
          int v28 = v4[v17 + 1];
          v27 += 6;
          v17 += 6;
          if (v28 != 4)
          {
            __int16 v65 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
              -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]2();
            }
            goto LABEL_147;
          }
        }
        __int16 v65 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
          -[ThreadNetworkManagerInstance validateDataSetTLVs:creds:]1();
        }
        goto LABEL_147;
    }
  }
}

- (int)howToGetOnTheNetwork:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 network];
  unsigned int v5 = [v3 credentials];
  if (_os_feature_enabled_impl())
  {
    id v6 = [v4 networkName];
    if (v6)
    {
      id v7 = [v4 extendedPANID];
      if (v7)
      {
        uint64_t v8 = [v5 credentialsDataSet];
        uint64_t v9 = [v8 dataSetArray];

        if (v9)
        {
          int v10 = 7;
          goto LABEL_21;
        }
      }
      else
      {
      }
    }
  }
  uint64_t v11 = [v5 masterKey];
  if (v11)
  {
    uint64_t v12 = [v5 PANID];
    if (v12
      && [v5 channel] != 255
      && ([v4 networkName], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v14 = [v4 extendedPANID];

      if (v14)
      {
        int v10 = 0;
        goto LABEL_21;
      }
    }
    else
    {
    }
  }
  unsigned int v15 = [v5 passPhrase];
  if (!v15)
  {
LABEL_20:
    int v10 = 8;
    goto LABEL_21;
  }
  uint64_t v16 = [v4 networkName];
  if (!v16)
  {

    goto LABEL_20;
  }
  unint64_t v17 = [v4 extendedPANID];

  if (v17) {
    int v10 = 2;
  }
  else {
    int v10 = 8;
  }
LABEL_21:

  return v10;
}

- (int)howToStartThreadNetwork:(const char *)a3 credentialsRecord_t:(id *)a4
{
  id v7 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  uint64_t v8 = v7;
  if (a3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315394;
      uint64_t v22 = "-[ThreadNetworkManagerInstance howToStartThreadNetwork:credentialsRecord_t:]";
      __int16 v23 = 2080;
      id v24 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s: unique Network Id is %s", (uint8_t *)&v21, 0x16u);
    }

    if ([(ThreadNetworkManagerInstance *)self retrieveActiveDataSetRecordForUniqueId:a3 record:a4])
    {
      uint64_t v9 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance howToStartThreadNetwork:credentialsRecord_t:]();
      }

      return 8;
    }
    else
    {
      tnmDumpRecord((THThreadNetworkCredentialsActiveDataSetRecord *)*a4);
      if ([(ThreadNetworkManagerInstance *)self alreadyOnTheSameNetwork:*a4])
      {
        uint64_t v18 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v21 = 136315394;
          uint64_t v22 = "-[ThreadNetworkManagerInstance howToStartThreadNetwork:credentialsRecord_t:]";
          __int16 v23 = 2080;
          id v24 = a3;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s: Already on the same network %s", (uint8_t *)&v21, 0x16u);
        }

        int v10 = 5;
      }
      else
      {
        int v10 = [(ThreadNetworkManagerInstance *)self howToGetOnTheNetwork:*a4];
      }
      unint64_t v19 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v21 = 136315394;
        uint64_t v22 = "-[ThreadNetworkManagerInstance howToStartThreadNetwork:credentialsRecord_t:]";
        __int16 v23 = 1024;
        LODWORD(v24) = v10;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s: ret is  %d", (uint8_t *)&v21, 0x12u);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance howToStartThreadNetwork:credentialsRecord_t:](v8, v11, v12, v13, v14, v15, v16, v17);
    }

    [(ThreadNetworkManagerInstance *)self threadLeave];
    if (_os_feature_enabled_impl()) {
      return 3;
    }
    else {
      return 1;
    }
  }
  return v10;
}

- (BOOL)alreadyOnTheSameNetwork:(id)a3
{
  id v4 = a3;
  unsigned int v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    nl::wpantund::ncp_state_to_string((char *)self->_lastKnownNCPState, (uint64_t)__p);
    id v6 = v22 >= 0 ? __p : *(unsigned char **)__p;
    *(_DWORD *)std::string buf = 136315394;
    id v24 = "-[ThreadNetworkManagerInstance alreadyOnTheSameNetwork:]";
    __int16 v25 = 2080;
    uint64_t v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: called in state %s", buf, 0x16u);
    if (v22 < 0) {
      operator delete(*(void **)__p);
    }
  }

  if (self->_lastKnownNCPState == 4)
  {
    [self->_CtrInternalClientPtr reset:0];
    if (v18 < 0) {
      operator delete(v17);
    }
    sleep(5u);
LABEL_18:
    BOOL v11 = 0;
    goto LABEL_19;
  }
  if (![(ThreadNetworkManagerInstance *)self isCurrentNetworkSameAsOneToStart:v4])
  {
    uint64_t v12 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [v4 network];
      id v14 = [v13 networkName];
      id v15 = [v14 UTF8String];
      *(_DWORD *)std::string __p = 136315138;
      *(void *)&__p[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Not on the same network ID : %s", __p, 0xCu);
    }
    [(ThreadNetworkManagerInstance *)self threadLeave];
    goto LABEL_18;
  }
  id v7 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v4 network];
    id v9 = [v8 networkName];
    id v10 = [v9 UTF8String];
    *(_DWORD *)std::string __p = 136315394;
    *(void *)&__p[4] = "-[ThreadNetworkManagerInstance alreadyOnTheSameNetwork:]";
    __int16 v20 = 2080;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s : Already joined on the same network : Unique ID : %s", __p, 0x16u);
  }
  BOOL v11 = 1;
LABEL_19:

  return v11;
}

- (void)deleteCurrentNetwork:(id)a3
{
  id v5 = a3;
  uint64_t v34 = 0;
  char v35 = &v34;
  uint64_t v36 = 0x3032000000;
  char v37 = __Block_byref_object_copy__0;
  id v38 = __Block_byref_object_dispose__0;
  id v39 = 0;
  if (self->_keyChainStore)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    keyChainStore = self->_keyChainStore;
    int v28 = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472;
    uint64_t v30 = __53__ThreadNetworkManagerInstance_deleteCurrentNetwork___block_invoke;
    uint64_t v31 = &unk_10049C310;
    xpc_object_t v33 = &v34;
    uint64_t v8 = v6;
    uint64_t v32 = v8;
    [(THThreadNetworkCredentialsStoreLocalClient *)keyChainStore deleteActiveDataSetRecordForThreadBorderAgent:v5 completion:&v28];
    dispatch_time_t v9 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v8, v9))
    {
      id v10 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance deleteCurrentNetwork:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    else
    {
      if (!v35[5])
      {
LABEL_10:

        goto LABEL_11;
      }
      id v10 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v35[5], "description", v28, v29, v30, v31);
        id v25 = objc_claimAutoreleasedReturnValue();
        id v26 = [v25 UTF8String];
        if (v26)
        {
          id v3 = [(id)v35[5] description];
          unsigned int v27 = (const char *)[v3 UTF8String];
        }
        else
        {
          unsigned int v27 = "(unknown error)";
        }
        *(_DWORD *)std::string buf = 136315394;
        uint64_t v41 = "-[ThreadNetworkManagerInstance deleteCurrentNetwork:]";
        __int16 v42 = 2080;
        uint64_t v43 = v27;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s : Error: failed to delete (%s)\n", buf, 0x16u);
        if (v26) {
      }
        }
    }

    goto LABEL_10;
  }
  uint64_t v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[ThreadNetworkManagerInstance deleteCurrentNetwork:](v8, v18, v19, v20, v21, v22, v23, v24);
  }
LABEL_11:

  _Block_object_dispose(&v34, 8);
}

void __53__ThreadNetworkManagerInstance_deleteCurrentNetwork___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    dispatch_time_t v9 = "-[ThreadNetworkManagerInstance deleteCurrentNetwork:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Inside : %s : ", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int)updatePrimaryResident:(const char *)a3 isPrimaryResident:(BOOL)a4 isPrimaryResidentThreadCapable:(BOOL)a5
{
  std::string::basic_string[abi:ne180100]<0>(__p, "Command Error");
  int v18 = 3;
  *(_OWORD *)uint64_t v19 = *(_OWORD *)__p;
  uint64_t v20 = v17;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  v13[0] = a4;
  v13[1] = a5;
  uint64_t v14 = a3;
  uint64_t v15 = 0;
  if (CtrInternalClientPtr)
  {
    [CtrInternalClientPtr updatePrimaryResident:v13];
  }
  else
  {
    *(_OWORD *)std::string __p = 0u;
    long long v17 = 0u;
  }
  CtrXPC::Result::operator=(&v18, (uint64_t)__p);
  if (SHIBYTE(v17) < 0) {
    operator delete(__p[1]);
  }
  if (v18)
  {
    id v10 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance updatePrimaryResident:isPrimaryResident:isPrimaryResidentThreadCapable:]();
    }

    int v11 = 1;
  }
  else
  {
    int v11 = 0;
  }
  if (SHIBYTE(v20) < 0) {
    operator delete(v19[0]);
  }
  return v11;
}

- (int)threadStop
{
  id v3 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    nl::wpantund::ncp_state_to_string((char *)self->_lastKnownNCPState, (uint64_t)__p);
    id v4 = v13 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)std::string buf = 136315650;
    uint64_t v15 = "-[ThreadNetworkManagerInstance threadStop]";
    __int16 v16 = 1024;
    int v17 = 2902;
    __int16 v18 = 2080;
    uint64_t v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d Cmd received in state %s", buf, 0x1Cu);
    if (v13 < 0) {
      operator delete(__p[0]);
    }
  }

  [(ThreadNetworkManagerInstance *)self disconnectActiveWedConnection];
  [(ThreadNetworkManagerInstance *)self CAgetCoexCounter];
  [(ThreadNetworkManagerInstance *)self configureCAMetrics:0];
  if (self->_lastKnownNCPState == 8 && (srputil_set_stop() & 1) == 0)
  {
    uint64_t v5 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance threadStop]();
    }
  }
  [(ThreadNetworkManagerInstance *)self persistThreadSession:0];
  if (self->_lastKnownNCPState == 8)
  {
    dispatch_semaphore_t v6 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance threadStop]();
    }

    usleep(0x30D40u);
    [self->_CtrInternalClientPtr stop];
    if ((v11[31] & 0x80000000) != 0)
    {
      id v7 = (void **)v11;
LABEL_19:
      operator delete(v7[1]);
    }
  }
  else
  {
    [self->_CtrInternalClientPtr stop];
    if ((v10[31] & 0x80000000) != 0)
    {
      id v7 = (void **)v10;
      goto LABEL_19;
    }
  }
  [(ThreadNetworkManagerInstance *)self generateThreadSessionEvent:0];
  lastKnownJoinedNetworkRecord = self->_lastKnownJoinedNetworkRecord;
  self->_lastKnownJoinedNetworkRecord = 0;

  return 0;
}

- (int)threadLeave
{
  id v3 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    nl::wpantund::ncp_state_to_string((char *)self->_lastKnownNCPState, (uint64_t)__p);
    id v4 = v11 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)std::string buf = 136315394;
    char v13 = "-[ThreadNetworkManagerInstance threadLeave]";
    __int16 v14 = 2080;
    uint64_t v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Cmd received in state %s", buf, 0x16u);
    if (v11 < 0) {
      operator delete(__p[0]);
    }
  }

  [(ThreadNetworkManagerInstance *)self CAgetCoexCounter];
  [(ThreadNetworkManagerInstance *)self disconnectActiveWedConnection];
  if (self->_lastKnownNCPState == 8 && (srputil_set_stop() & 1) == 0)
  {
    uint64_t v5 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance threadLeave]();
    }
  }
  [(ThreadNetworkManagerInstance *)self configureCAMetrics:0];
  [(ThreadNetworkManagerInstance *)self persistThreadSession:0];
  [self->_CtrInternalClientPtr leave];
  if (v9 < 0) {
    operator delete(v8);
  }
  sleep(2u);
  lastKnownJoinedNetworkRecord = self->_lastKnownJoinedNetworkRecord;
  self->_lastKnownJoinedNetworkRecord = 0;

  [(ThreadNetworkManagerInstance *)self generateThreadSessionEvent:0];
  return 0;
}

- (int)threadStart:(const char *)a3 activeOperationalDataset:(const char *)a4 isPrimaryUser:(BOOL)a5 routerMode:(BOOL)a6 geoAvailable:(BOOL)a7 defaultChildNode:(BOOL)a8 output:(dict *)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v12 = a5;
  __int16 v16 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int lastKnownNCPState = self->_lastKnownNCPState;
    *(_DWORD *)std::string buf = 136316418;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance threadStart:activeOperationalDataset:isPrimaryUser:routerMode:ge"
                         "oAvailable:defaultChildNode:output:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 2975;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = lastKnownNCPState;
    __int16 v55 = 2080;
    *(void *)id v56 = a3;
    *(_WORD *)&v56[8] = 2080;
    uint64_t v57 = a4;
    __int16 v58 = 1024;
    BOOL v59 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s:%d: Entering : Cmd received in state %d, uniqueNetworkId : %s, activeOperationalDataset : %s, isPrimaryUser : %d", buf, 0x32u);
  }

  if (!checkBluetoothStateAndNotifyUser())
  {
    [(ThreadNetworkManagerInstance *)self incrementCounterThreadStartFailDueToBluetoothOff];
    uint64_t v19 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance threadStart:activeOperationalDataset:isPrimaryUser:routerMode:geoAvailable:defaultChildNode:output:].cold.6();
    }
    goto LABEL_14;
  }
  if ([(ThreadNetworkManagerInstance *)self isAudioNoThreadFeatureEnabled])
  {
    if (![(ThreadNetworkManagerInstance *)self isCurrentBTCoExLoadAvailable])
    {
      __int16 v18 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance threadStart:activeOperationalDataset:isPrimaryUser:routerMod"
                             "e:geoAvailable:defaultChildNode:output:]";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: BT Load, Audio detection: Frist time call threadStart, notify WRM to start to send coex load value.", buf, 0xCu);
      }

      wcm_notify(1);
      usleep(0x493E0u);
    }
    if ([(ThreadNetworkManagerInstance *)self getBTAudioCallStatus])
    {
      [(ThreadNetworkManagerInstance *)self incrementCounterThreadStartFailDueToEscoOn];
      uint64_t v19 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      int v20 = 1;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)std::string buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance threadStart:activeOperationalDataset:isPrimaryUser:routerMod"
                             "e:geoAvailable:defaultChildNode:output:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s: BT Load, Audio detection: threadStart rejected as BT Aduio call(2EV3/2EV5)is ongoing with ret : %d", buf, 0x12u);
      }
LABEL_19:
      uint64_t v21 = 0;
      goto LABEL_20;
    }
  }
  int v20 = [(ThreadNetworkManagerInstance *)self initializeKeyChainStore];
  if (v20)
  {
    uint64_t v19 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance createDriverInterface:]();
    }
    goto LABEL_19;
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v19 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance threadStart:activeOperationalDataset:isPrimaryUser:routerMode:geoAvailable:defaultChildNode:output:].cold.4();
    }
    goto LABEL_14;
  }
  if (a4)
  {
    int v20 = [(ThreadNetworkManagerInstance *)self formNetworkWithAODForPrimaryOrSharedUser:a4 isPrimaryUser:v12 routerMode:v11 geoAvailable:v10 defaultChildNode:v9 output:a9];
    unsigned __int8 v34 = [(ThreadNetworkManagerInstance *)self getThreadSessionStatus];
    if (v20) {
      char v35 = 1;
    }
    else {
      char v35 = v34;
    }
    if (v35)
    {
      uint64_t v21 = 0;
      if (v20) {
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v21 = 0;
      [(ThreadNetworkManagerInstance *)self updateThreadSessionStartTime];
    }
    goto LABEL_41;
  }
  if (!a3)
  {
    uint64_t v19 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance threadStart:activeOperationalDataset:isPrimaryUser:routerMode:geoAvailable:defaultChildNode:output:]();
    }
    goto LABEL_14;
  }
  id v53 = 0;
  unsigned int v36 = [(ThreadNetworkManagerInstance *)self retrieveActiveDataSetRecordForUniqueId:a3 record:&v53];
  char v37 = (THThreadNetworkCredentialsActiveDataSetRecord *)v53;
  uint64_t v21 = v37;
  if (v36)
  {
    uint64_t v19 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance threadStart:activeOperationalDataset:isPrimaryUser:routerMode:geoAvailable:defaultChildNode:output:]();
    }
    goto LABEL_15;
  }
  tnmDumpRecord(v37);
  if (self->_lastKnownNCPState != 4)
  {
    if ([(ThreadNetworkManagerInstance *)self isCurrentNetworkSameAsOneToStart:v21])
    {
      id v38 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        id v39 = [(THThreadNetworkCredentialsActiveDataSetRecord *)v21 network];
        id v40 = [v39 networkName];
        id v41 = [v40 UTF8String];
        *(_DWORD *)std::string buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance threadStart:activeOperationalDataset:isPrimaryUser:routerMod"
                             "e:geoAvailable:defaultChildNode:output:]";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v41;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%s : Already joined on the same network : Network name : %s", buf, 0x16u);
      }
      __int16 v42 = [(THThreadNetworkCredentialsActiveDataSetRecord *)v21 uniqueIdentifier];
      id v43 = [v42 UUIDString];
      xpc_object_t v44 = (const char *)[v43 UTF8String];

      xpc_object_t v45 = xpc_string_create(v44);
      id v51 = v45;
      if (!v45) {
        id v51 = xpc_null_create();
      }

      *(void *)std::string buf = a9;
      *(void *)&buf[8] = "outputUniqueNetworkId";
      xpc::dict::object_proxy::operator=((uint64_t)buf, &v51, &v52);
      id v46 = v52;
      id v52 = 0;

      id v47 = v51;
      id v51 = 0;

      goto LABEL_41;
    }
    int v48 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance threadStart:activeOperationalDataset:isPrimaryUser:routerMode:"
                           "geoAvailable:defaultChildNode:output:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3062;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%s : %d : Leaving the existing Network...\n", buf, 0x12u);
    }

    [(ThreadNetworkManagerInstance *)self threadStop];
  }
  [(ThreadNetworkManagerInstance *)self setDeviceNode:v11 geoAvailable:v10 defaultChildNode:v9];
  if (!v21)
  {
    uint64_t v19 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance threadStart:activeOperationalDataset:isPrimaryUser:routerMode:geoAvailable:defaultChildNode:output:]();
    }
LABEL_14:
    uint64_t v21 = 0;
LABEL_15:
    int v20 = 1;
LABEL_20:

    goto LABEL_21;
  }
  id v49 = [(THThreadNetworkCredentialsActiveDataSetRecord *)v21 uniqueIdentifier];
  id v50 = [v49 UUIDString];
  int v20 = -[ThreadNetworkManagerInstance formNetworkWithAOD:record:output:](self, "formNetworkWithAOD:record:output:", [v50 UTF8String], v21, a9);

  if (!v20)
  {
    [(ThreadNetworkManagerInstance *)self updateThreadSessionStartTime];
LABEL_41:
    [(ThreadNetworkManagerInstance *)self persistThreadSession:1];
    [(ThreadNetworkManagerInstance *)self onThreadStartPerformDiscoveryScan];
    int v20 = 0;
  }
LABEL_21:
  uint64_t v22 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v23)
  {
    uint64_t RcpHostContext = (RcpHostContext *)RcpHostContext::GetRcpHostContext((RcpHostContext *)v23);
    BOOL isThreadAlwaysOnFeatureEnabled = RcpHostContext::isThreadAlwaysOnFeatureEnabled(RcpHostContext);
    BOOL v26 = isThreadAlwaysOnFeatureEnabled;
    unsigned int v27 = (RcpHostContext *)RcpHostContext::GetRcpHostContext((RcpHostContext *)isThreadAlwaysOnFeatureEnabled);
    BOOL isStateMachineEnabled = RcpHostContext::isStateMachineEnabled(v27);
    BOOL v29 = isStateMachineEnabled;
    uint64_t v30 = (RcpHostContext *)RcpHostContext::GetRcpHostContext((RcpHostContext *)isStateMachineEnabled);
    BOOL isAudioNoThreadFeatureEnabled = RcpHostContext::isAudioNoThreadFeatureEnabled(v30);
    *(_DWORD *)std::string buf = 136316162;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance threadStart:activeOperationalDataset:isPrimaryUser:routerMode:ge"
                         "oAvailable:defaultChildNode:output:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 3093;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v26;
    __int16 v55 = 1024;
    *(_DWORD *)id v56 = v29;
    *(_WORD *)&v56[4] = 1024;
    *(_DWORD *)&v56[6] = isAudioNoThreadFeatureEnabled;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s:%d: Feature flag: threadAlwaysOnFeatureEnabled = [%d], stateMachineEnabled = [%d], audioNoThreadFeatureEnabled = [%d]", buf, 0x24u);
  }

  uint64_t v32 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance threadStart:activeOperationalDataset:isPrimaryUser:routerMode:ge"
                         "oAvailable:defaultChildNode:output:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 3095;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v20;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s:%d: Returning threadstart with ret : %d", buf, 0x18u);
  }

  return v20;
}

- (void)persistThreadSession:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    uint64_t v5 = "ON";
  }
  else {
    uint64_t v5 = "OFF";
  }
  saveStringValue("threadSession", v5);
  if (v3)
  {
    uint64_t RcpHostContext = (RcpHostContext *)RcpHostContext::GetRcpHostContext(v6);
    RcpHostContext::clear_healthinfo_metrics(RcpHostContext);
    wcm_notify(1);
    std::string::basic_string[abi:ne180100]<0>(&v23, "ThreadThrottled");
    operator new();
  }
  if (self->_isWedFWUpdateProgressInChildRole) {
    [(ThreadNetworkManagerInstance *)self disconnectActiveWedConnection];
  }
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(__p, "Thread:Pairing:Status");
  [CtrInternalClientPtr setProperty:__p property_val:"0"];
  if (v22 < 0) {
    operator delete(v21);
  }
  if (v20 < 0) {
    operator delete(__p[0]);
  }
  BOOL v9 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v15, "Thread:FWUpdate");
  [(CtrInternalClient *)v9 setProperty:v15 property_val:"0"];
  if (v18 < 0) {
    operator delete(v17);
  }
  if (v16 < 0) {
    operator delete(v15[0]);
  }
  BOOL v10 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v11, "Thread:EmacId");
  [(CtrInternalClient *)v10 setProperty:v11 property_val:""];
  if (v14 < 0) {
    operator delete(v13);
  }
  if (v12 < 0) {
    operator delete(v11[0]);
  }
  [(ThreadNetworkManagerInstance *)self resetPairingStatus];
  [(ThreadNetworkManagerInstance *)self resetFWUpdateStatus];
  [(ThreadNetworkManagerInstance *)self resetFoundAdvFlags];
  *(_WORD *)&self->_isNonWedFWUpdateProgressInChildRole = 0;
  disableFWUpdateFlag();
  [(ThreadNetworkManagerInstance *)self persistGeoAvailable:0];
  [(ThreadNetworkManagerInstance *)self clearProvideEmacTracker];
  power_assertion_n = 0;
  Thread_DeassertPower();
  router_mode_status_timer_m = 0;
  [(ThreadNetworkManagerInstance *)self coexCounterCollection:v3];
}

- (void)coexCounterCollection:(BOOL)a3
{
  if (a3)
  {
    CtrInternalClientPtr = self->_CtrInternalClientPtr;
    std::string::basic_string[abi:ne180100]<0>(v10, "vendor:coex:rcp2:state:collection");
    if (CtrInternalClientPtr)
    {
      [CtrInternalClientPtr setProperty:v10 property_val:"1"];
      BOOL v4 = LODWORD(__p[0]) == 0;
      if (SHIBYTE(__p[3]) < 0) {
        operator delete(__p[1]);
      }
    }
    else
    {
      memset(__p, 0, 32);
      BOOL v4 = 1;
    }
    if (v11 < 0)
    {
      operator delete(v10[0]);
      if (v4) {
        return;
      }
    }
    else if (v4)
    {
      return;
    }
    id v7 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p[0]) = 136315394;
      *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance coexCounterCollection:]";
      WORD2(__p[1]) = 1024;
      *(_DWORD *)((char *)&__p[1] + 6) = 3140;
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s:%d: Failed to set kWPANTUNDVendor_CoEx_RCP2_State_Collection Property", (uint8_t *)__p, 0x12u);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  uint64_t v5 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v8, "vendor:coex:rcp2:state:collection");
  if (v5)
  {
    [(CtrInternalClient *)v5 setProperty:v8 property_val:"0"];
    BOOL v6 = LODWORD(__p[0]) == 0;
    if (SHIBYTE(__p[3]) < 0) {
      operator delete(__p[1]);
    }
  }
  else
  {
    memset(__p, 0, 32);
    BOOL v6 = 1;
  }
  if (v9 < 0)
  {
    operator delete(v8[0]);
    if (v6) {
      return;
    }
LABEL_20:
    id v7 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p[0]) = 136315394;
      *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance coexCounterCollection:]";
      WORD2(__p[1]) = 1024;
      *(_DWORD *)((char *)&__p[1] + 6) = 3145;
      goto LABEL_22;
    }
LABEL_23:

    return;
  }
  if (!v6) {
    goto LABEL_20;
  }
}

- (int)threadStart:(const char *)a3 output:(dict *)a4
{
  id v7 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int lastKnownNCPState = self->_lastKnownNCPState;
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance threadStart:output:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = lastKnownNCPState;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: Cmd received in state %d", buf, 0x12u);
  }

  int v9 = [(ThreadNetworkManagerInstance *)self initializeKeyChainStore];
  if (v9)
  {
    BOOL v10 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance createDriverInterface:]();
    }
LABEL_20:

    id v16 = 0;
    goto LABEL_33;
  }
  if (!_os_feature_enabled_impl())
  {
    id v38 = 0;
    unsigned int v20 = [(ThreadNetworkManagerInstance *)self howToStartThreadNetwork:a3 credentialsRecord_t:&v38];
    id v16 = v38;
    if (v20 - 1 < 2)
    {
      xpc::dict::dict((xpc::dict *)&v35, &a4->var0.var0);
      int v9 = [(ThreadNetworkManagerInstance *)self formNewNetwork:&v35];
      uint64_t v24 = v35;
      char v35 = 0;

      int v18 = 0;
      id v19 = v35;
    }
    else
    {
      if (!v20)
      {
        if ([(ThreadNetworkManagerInstance *)self attachWithAllCreds:a3 credentialsRecord_t:v16 output:a4])
        {
          int v9 = [(ThreadNetworkManagerInstance *)self formNetworkWithCreds:a3 credentialsRecord_t:v16 output:a4];
        }
        else
        {
          int v9 = 0;
        }
        int v18 = 0;
        goto LABEL_31;
      }
      if (v20 != 5)
      {
        int v18 = 0;
        int v9 = 1;
        goto LABEL_31;
      }
      xpc_object_t v21 = xpc_string_create(a3);
      id v36 = v21;
      if (!v21) {
        id v36 = xpc_null_create();
      }

      *(void *)std::string buf = a4;
      *(void *)&buf[8] = "outputUniqueNetworkId";
      xpc::dict::object_proxy::operator=((uint64_t)buf, &v36, &v37);
      id v22 = v37;
      id v37 = 0;

      id v23 = v36;
      id v36 = 0;

      int v9 = 0;
      int v18 = 0;
      id v19 = v36;
    }
LABEL_22:

LABEL_31:
    BOOL v26 = (RcpHostContext *)gettimeofday(&v44, &v43);
    int v27 = 0;
LABEL_32:
    uint64_t RcpHostContext = (RcpHostContext *)RcpHostContext::GetRcpHostContext(v26);
    RcpHostContext::update_threadstart_metrics(RcpHostContext, v45, v44, v27, v18);
    goto LABEL_33;
  }
  char v11 = (RcpHostContext *)isNetworkConnected();
  if ((v11 & 1) == 0)
  {
    BOOL v10 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance threadStart:output:]();
    }
    int v9 = 1;
    goto LABEL_20;
  }
  char v12 = (RcpHostContext *)RcpHostContext::GetRcpHostContext(v11);
  RcpHostContext::init_threadstart_metrics(v12);
  unsigned int v13 = [(ThreadNetworkManagerInstance *)self checkPreferredAndJoin:a4];
  gettimeofday(&v45, &v43);
  if (!v13)
  {
    id v25 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance threadStart:output:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3189;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s : %d :  Joined the Preferred Network\n", buf, 0x12u);
    }

    int v18 = 0;
    int v9 = 0;
    id v16 = 0;
    timeval v44 = v45;
    int v27 = 1;
    goto LABEL_32;
  }
  id v42 = 0;
  unsigned int v14 = [(ThreadNetworkManagerInstance *)self howToStartThreadNetwork:a3 credentialsRecord_t:&v42];
  id v15 = v42;
  id v16 = v15;
  int v9 = 1;
  switch(v14)
  {
    case 0u:
      id v15 = (id)[(ThreadNetworkManagerInstance *)self formNetworkWithCreds:a3 credentialsRecord_t:v15 output:a4];
      int v9 = (int)v15;
      break;
    case 1u:
    case 2u:
    case 3u:
      xpc::dict::dict((xpc::dict *)&v39, &a4->var0.var0);
      int v9 = [(ThreadNetworkManagerInstance *)self formNewNetwork:&v39];
      int v17 = v39;
      id v39 = 0;

      int v18 = 0;
      id v19 = v39;
      goto LABEL_22;
    case 5u:
      xpc_object_t v30 = xpc_string_create(a3);
      id v40 = v30;
      if (!v30) {
        id v40 = xpc_null_create();
      }

      *(void *)std::string buf = a4;
      *(void *)&buf[8] = "outputUniqueNetworkId";
      xpc::dict::object_proxy::operator=((uint64_t)buf, &v40, &v41);
      id v31 = v41;
      id v41 = 0;

      id v32 = v40;
      id v40 = 0;

      int v9 = 0;
      break;
    case 7u:
      id v19 = [v15 uniqueIdentifier];
      id v34 = [v19 UUIDString];
      int v9 = -[ThreadNetworkManagerInstance formNetworkWithAOD:record:output:](self, "formNetworkWithAOD:record:output:", [v34 UTF8String], v16, a4);

      int v18 = 1;
      goto LABEL_22;
    default:
      break;
  }
  xpc_object_t v33 = (RcpHostContext *)RcpHostContext::GetRcpHostContext((RcpHostContext *)v15);
  RcpHostContext::clear_threadstart_metrics(v33);
LABEL_33:

  return v9;
}

- (int)deleteCredentialsForThisNetwork:(id)a3
{
  id v5 = a3;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = __Block_byref_object_copy__0;
  id v40 = __Block_byref_object_dispose__0;
  id v41 = 0;
  if (self->_keyChainStore)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    keyChainStore = self->_keyChainStore;
    xpc_object_t v30 = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472;
    id v32 = __64__ThreadNetworkManagerInstance_deleteCredentialsForThisNetwork___block_invoke;
    xpc_object_t v33 = &unk_10049C310;
    char v35 = &v36;
    int v8 = v6;
    id v34 = v8;
    [(THThreadNetworkCredentialsStoreLocalClient *)keyChainStore deleteRecordForNetwork:v5 completion:&v30];
    dispatch_time_t v9 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v8, v9))
    {
      BOOL v10 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance deleteCredentialsForThisNetwork:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
    else
    {
      if (!v37[5])
      {
        int v25 = 0;
        goto LABEL_11;
      }
      BOOL v10 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)v37[5], "description", v30, v31, v32, v33);
        id v27 = objc_claimAutoreleasedReturnValue();
        id v28 = [v27 UTF8String];
        if (v28)
        {
          id v3 = [(id)v37[5] description];
          BOOL v29 = (const char *)[v3 UTF8String];
        }
        else
        {
          BOOL v29 = "(unknown error)";
        }
        *(_DWORD *)std::string buf = 136315394;
        char v43 = "-[ThreadNetworkManagerInstance deleteCredentialsForThisNetwork:]";
        __int16 v44 = 2080;
        timeval v45 = v29;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s : Error: failed to delete (%s)\n", buf, 0x16u);
        if (v28) {
      }
        }
    }

    int v25 = 1;
LABEL_11:

    goto LABEL_12;
  }
  int v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[ThreadNetworkManagerInstance deleteCredentialsForThisNetwork:](v8, v18, v19, v20, v21, v22, v23, v24);
  }
  int v25 = 0;
LABEL_12:

  _Block_object_dispose(&v36, 8);
  return v25;
}

void __64__ThreadNetworkManagerInstance_deleteCredentialsForThisNetwork___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    dispatch_time_t v9 = "-[ThreadNetworkManagerInstance deleteCredentialsForThisNetwork:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Inside : %s : ", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int)getMeCredentialsForThisNetwork:(id)a3 credentialsRecord_t:(id *)a4
{
  id v7 = a3;
  uint64_t v55 = 0;
  id v56 = &v55;
  uint64_t v57 = 0x3032000000;
  __int16 v58 = __Block_byref_object_copy__0;
  BOOL v59 = __Block_byref_object_dispose__0;
  id v60 = 0;
  uint64_t v49 = 0;
  id v50 = &v49;
  uint64_t v51 = 0x3032000000;
  id v52 = __Block_byref_object_copy__0;
  id v53 = __Block_byref_object_dispose__0;
  id v54 = 0;
  if (self->_keyChainStore)
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    keyChainStore = self->_keyChainStore;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = __83__ThreadNetworkManagerInstance_getMeCredentialsForThisNetwork_credentialsRecord_t___block_invoke;
    v45[3] = &unk_10049C338;
    id v47 = &v55;
    int v48 = &v49;
    BOOL v10 = v8;
    id v46 = v10;
    [(THThreadNetworkCredentialsStoreLocalClient *)keyChainStore retrieveAllRecordsForNetwork:v7 completion:v45];
    dispatch_time_t v11 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v10, v11))
    {
      uint64_t v12 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance getMeCredentialsForThisNetwork:credentialsRecord_t:](v12, v13, v14, v15, v16, v17, v18, v19);
      }
      int v20 = 1;
    }
    else
    {
      if (v50[5])
      {
        id v28 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          id v35 = [(id)v50[5] description];
          id v36 = [v35 UTF8String];
          if (v36)
          {
            id v4 = [(id)v50[5] description];
            id v37 = (const char *)[v4 UTF8String];
          }
          else
          {
            id v37 = "(unknown error)";
          }
          *(_DWORD *)std::string buf = 136315394;
          BOOL v63 = "-[ThreadNetworkManagerInstance getMeCredentialsForThisNetwork:credentialsRecord_t:]";
          __int16 v64 = 2080;
          __int16 v65 = v37;
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s : Error: failed to retrieve (%s)\n", buf, 0x16u);
          if (v36) {
        }
          }
        int v20 = 1;
      }
      else
      {
        int v20 = 0;
      }
      if (![(id)v56[5] count])
      {
        BOOL v29 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          id v38 = [(id)v50[5] description];
          id v39 = [v38 UTF8String];
          if (v39)
          {
            id v4 = [(id)v50[5] description];
            id v40 = (const char *)[v4 UTF8String];
          }
          else
          {
            id v40 = "(unknown error)";
          }
          *(_DWORD *)std::string buf = 136315394;
          BOOL v63 = "-[ThreadNetworkManagerInstance getMeCredentialsForThisNetwork:credentialsRecord_t:]";
          __int16 v64 = 2080;
          __int16 v65 = v40;
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s : Error: failed to retrieve (%s), zero records found\n", buf, 0x16u);
          if (v39) {
        }
          }
        int v20 = 1;
      }
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      uint64_t v12 = (id)v56[5];
      id v30 = [v12 countByEnumeratingWithState:&v41 objects:v61 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v42;
        while (2)
        {
          for (uint64_t i = 0; i != v30; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v42 != v31) {
              objc_enumerationMutation(v12);
            }
            xpc_object_t v33 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            if (v33)
            {
              *a4 = v33;
              goto LABEL_26;
            }
          }
          id v30 = [v12 countByEnumeratingWithState:&v41 objects:v61 count:16];
          if (v30) {
            continue;
          }
          break;
        }
      }
    }
LABEL_26:
  }
  else
  {
    BOOL v10 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance getMeCredentialsForThisNetwork:credentialsRecord_t:](v10, v21, v22, v23, v24, v25, v26, v27);
    }
    int v20 = 0;
  }

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

  return v20;
}

void __83__ThreadNetworkManagerInstance_getMeCredentialsForThisNetwork_credentialsRecord_t___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    uint64_t v15 = "-[ThreadNetworkManagerInstance getMeCredentialsForThisNetwork:credentialsRecord_t:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Inside : %s : ", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_time_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
  id v13 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fillupThreadCredentialsToSelfHealThreadNetwork:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ThreadNetworkManagerInstance *)self getNCPState:0];
  uint64_t v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int lastKnownNCPState = self->_lastKnownNCPState;
    *(_DWORD *)std::string buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance fillupThreadCredentialsToSelfHealThreadNetwork:store:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 3360;
    *(_WORD *)&unsigned char buf[18] = 1024;
    *(_DWORD *)&buf[20] = lastKnownNCPState;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:%d: Radio mode %d", buf, 0x18u);
  }

  int v10 = self->_lastKnownNCPState;
  if (v10 != 8)
  {
    if (v10 == 4)
    {
      uint64_t v11 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance fillupThreadCredentialsToSelfHealThreadNetwork:store:]();
      }

      *(void *)std::string buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      *(void *)&unsigned char buf[24] = __Block_byref_object_copy__0;
      *(void *)&unsigned char buf[32] = __Block_byref_object_dispose__0;
      id v62 = 0;
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = __85__ThreadNetworkManagerInstance_fillupThreadCredentialsToSelfHealThreadNetwork_store___block_invoke;
      v60[3] = &unk_10049C310;
      v60[4] = self;
      v60[5] = buf;
      [v7 deletePreferredNetworkEntryWithCompletion:v6 completion:v60];
      _Block_object_dispose(buf, 8);
    }
    goto LABEL_57;
  }
  std::string::basic_string[abi:ne180100]<0>(buf, "Commond is successful");
  int v57 = 0;
  long long v58 = *(_OWORD *)buf;
  uint64_t v59 = *(void *)&buf[16];
  uint64_t v12 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance fillupThreadCredentialsToSelfHealThreadNetwork:store:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 3382;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s:%d: Entered to fillup the preferred network entry", buf, 0x12u);
  }

  uint64_t v56 = 0;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(__p, "Network:Name");
  if (CtrInternalClientPtr) {
    [CtrInternalClientPtr getProperty:__p output:&v56];
  }
  else {
    memset(buf, 0, 32);
  }
  int v14 = *CtrXPC::Result::operator=(&v57, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v55 < 0)
  {
    operator delete(__p[0]);
    if (v14) {
      goto LABEL_17;
    }
LABEL_21:
    any_to_string((const boost::any *)&v56, (uint64_t)v52);
    if (v53 >= 0) {
      uint64_t v16 = v52;
    }
    else {
      uint64_t v16 = (void **)v52[0];
    }
    uint64_t v17 = +[NSString stringWithUTF8String:v16];
    uint64_t v51 = 0;
    uint64_t v18 = self->_CtrInternalClientPtr;
    std::string::basic_string[abi:ne180100]<0>(v49, "Network:XPANID");
    if (v18) {
      [(CtrInternalClient *)v18 getProperty:v49 output:&v51];
    }
    else {
      memset(buf, 0, 32);
    }
    int v19 = *CtrXPC::Result::operator=(&v57, (uint64_t)buf);
    if ((buf[31] & 0x80000000) != 0) {
      operator delete(*(void **)&buf[8]);
    }
    if (v50 < 0) {
      operator delete(v49[0]);
    }
    if (v19)
    {
      int v20 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Failed to get the Network XPANID Property", buf, 2u);
      }

      goto LABEL_49;
    }
    unint64_t v48 = bswap64(any_to_uint64((const boost::any *)&v51, 0));
    id v38 = +[NSData dataWithBytes:&v48 length:8];
    uint64_t v41 = 0;
    long long v42 = &v41;
    uint64_t v43 = 0x3812000000;
    long long v44 = __Block_byref_object_copy__278;
    timeval v45 = __Block_byref_object_dispose__279;
    uint64_t v46 = 256;
    xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v22 = v21;
    if (!v21) {
      xpc_object_t v22 = xpc_null_create();
    }

    id v23 = v22;
    uint64_t v24 = v23;
    id v47 = v23;
    if (!v23 || xpc_get_type(v23) != (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_object_t v25 = xpc_null_create();
      id v26 = v47;
      id v47 = v25;
    }
    uint64_t v27 = [v6 network];
    id v28 = [v27 networkName];
    if ([v28 isEqualToString:v17])
    {
      BOOL v29 = [v6 network];
      id v30 = [v29 extendedPANID];
      unsigned int v31 = [v30 isEqualToData:v38];

      if (v31)
      {
        id v32 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          xpc_object_t v33 = [v6 network];
          id v34 = [v33 networkName];
          id v35 = [v6 network];
          id v36 = [v35 extendedPANID];
          *(_DWORD *)std::string buf = 136316418;
          *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance fillupThreadCredentialsToSelfHealThreadNetwork:store:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3410;
          *(_WORD *)&unsigned char buf[18] = 2112;
          *(void *)&buf[20] = v34;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v36;
          *(_WORD *)&unsigned char buf[38] = 2112;
          id v62 = v17;
          __int16 v63 = 2112;
          __int16 v64 = v38;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%s:%d:Preferred network entry exists (name : %@, xpanid : %@)  ! And device is on same netowrk (name : %@, xpanid : %@) storing the credentials again..", buf, 0x3Au);
        }
        [(ThreadNetworkManagerInstance *)self saveThreadConfiguration:v42 + 6];
        if (v40 < 0) {
          operator delete((void *)v39[8]);
        }
        goto LABEL_48;
      }
    }
    else
    {
    }
    *(void *)std::string buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    *(void *)&unsigned char buf[24] = __Block_byref_object_copy__0;
    *(void *)&unsigned char buf[32] = __Block_byref_object_dispose__0;
    id v62 = 0;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = __85__ThreadNetworkManagerInstance_fillupThreadCredentialsToSelfHealThreadNetwork_store___block_invoke_280;
    v39[3] = &unk_10049C360;
    v39[4] = self;
    v39[5] = buf;
    v39[6] = &v41;
    [v7 deletePreferredNetworkEntryWithCompletion:v6 completion:v39];
    _Block_object_dispose(buf, 8);

LABEL_48:
    _Block_object_dispose(&v41, 8);
    id v37 = v47;
    id v47 = 0;

LABEL_49:
    if (v51) {
      (*(void (**)(uint64_t))(*(void *)v51 + 8))(v51);
    }

    if (v53 < 0) {
      operator delete(v52[0]);
    }
    goto LABEL_53;
  }
  if (!v14) {
    goto LABEL_21;
  }
LABEL_17:
  uint64_t v15 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance fillupThreadCredentialsToSelfHealThreadNetwork:store:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 3388;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s:%d: Failed to get the Network Name Property", buf, 0x12u);
  }

LABEL_53:
  if (v56) {
    (*(void (**)(uint64_t))(*(void *)v56 + 8))(v56);
  }
  if (SHIBYTE(v59) < 0) {
    operator delete((void *)v58);
  }
LABEL_57:
}

void __85__ThreadNetworkManagerInstance_fillupThreadCredentialsToSelfHealThreadNetwork_store___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (v4)
  {
    id v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __85__ThreadNetworkManagerInstance_fillupThreadCredentialsToSelfHealThreadNetwork_store___block_invoke_cold_1();
    }
  }
  else
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v7 = v6;
    if (!v6) {
      xpc_object_t v7 = xpc_null_create();
    }

    id v8 = v7;
    dispatch_time_t v9 = v8;
    id v15 = v8;
    if (v8)
    {
      if (xpc_get_type(v8) != (xpc_type_t)&_xpc_type_dictionary)
      {
        id v15 = xpc_null_create();
      }
    }
    else
    {
      id v15 = xpc_null_create();
    }

    int v10 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::string buf = 136315394;
      uint64_t v17 = "-[ThreadNetworkManagerInstance fillupThreadCredentialsToSelfHealThreadNetwork:store:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 3374;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s:%d: NCP is offline, Creating a new network and saving thread configuration again, this will be marked as new preferred network...", buf, 0x12u);
    }

    uint64_t v11 = *(void **)(a1 + 32);
    xpc::dict::dict((xpc::dict *)&v14, &v15);
    [v11 formNewNetwork:&v14];
    id v12 = v14;
    id v14 = 0;

    id v13 = v15;
    id v15 = 0;
  }
}

void __85__ThreadNetworkManagerInstance_fillupThreadCredentialsToSelfHealThreadNetwork_store___block_invoke_280(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (v4)
  {
    id v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __85__ThreadNetworkManagerInstance_fillupThreadCredentialsToSelfHealThreadNetwork_store___block_invoke_280_cold_1();
    }
  }
  else
  {
    xpc_object_t v6 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::string buf = 136315394;
      int v10 = "-[ThreadNetworkManagerInstance fillupThreadCredentialsToSelfHealThreadNetwork:store:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 3422;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s:%d: Saving thread configuration again, this will be marked as new preferred network...", buf, 0x12u);
    }

    [*(id *)(a1 + 32) saveThreadConfiguration:*(void *)(*(void *)(a1 + 48) + 8) + 48];
    if (v8 < 0) {
      operator delete(__p);
    }
  }
}

- (id)getPreferredNetworkWithNoScan
{
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = __Block_byref_object_copy__0;
  char v40 = __Block_byref_object_dispose__0;
  id v41 = 0;
  uint64_t v30 = 0;
  unsigned int v31 = &v30;
  uint64_t v32 = 0x3032000000;
  xpc_object_t v33 = __Block_byref_object_copy__0;
  id v34 = __Block_byref_object_dispose__0;
  id v35 = 0;
  if (self->_keyChainStore)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    keyChainStore = self->_keyChainStore;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = __61__ThreadNetworkManagerInstance_getPreferredNetworkWithNoScan__block_invoke;
    v26[3] = &unk_10049C388;
    id v28 = &v36;
    BOOL v29 = &v30;
    id v5 = v3;
    uint64_t v27 = v5;
    [(THThreadNetworkCredentialsStoreLocalClient *)keyChainStore retrievePreferredNetworkWithNoScanWithCompletion:v26];
    dispatch_time_t v6 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v5, v6))
    {
      xpc_object_t v7 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(ThreadNetworkManagerInstance *)v7 getPreferredNetworkWithNoScan];
      }
    }
    else if (!v31[5])
    {
      uint64_t v24 = (THThreadNetworkCredentialsActiveDataSetRecord *)v37[5];
      if (v24)
      {
        tnmDumpRecord(v24);
        xpc_object_t v25 = (void *)v37[5];
      }
      else
      {
        xpc_object_t v25 = 0;
      }
      id v22 = v25;
      goto LABEL_11;
    }
    id v22 = 0;
LABEL_11:

    goto LABEL_12;
  }
  id v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    [(ThreadNetworkManagerInstance *)v5 getPreferredNetworkWithNoScan];
  }
  id v22 = 0;
LABEL_12:

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v22;
}

void __61__ThreadNetworkManagerInstance_getPreferredNetworkWithNoScan__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    xpc_object_t v7 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __61__ThreadNetworkManagerInstance_getPreferredNetworkWithNoScan__block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v8 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Got the Credentials Record, for the PreferredNetwork", v14, 2u);
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = v5;
    xpc_object_t v7 = *(NSObject **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
  id v13 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)getPreferredNetwork
{
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = __Block_byref_object_copy__0;
  char v40 = __Block_byref_object_dispose__0;
  id v41 = 0;
  uint64_t v30 = 0;
  unsigned int v31 = &v30;
  uint64_t v32 = 0x3032000000;
  xpc_object_t v33 = __Block_byref_object_copy__0;
  id v34 = __Block_byref_object_dispose__0;
  id v35 = 0;
  if (self->_keyChainStore)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    keyChainStore = self->_keyChainStore;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = __51__ThreadNetworkManagerInstance_getPreferredNetwork__block_invoke;
    v26[3] = &unk_10049C388;
    id v28 = &v36;
    BOOL v29 = &v30;
    id v5 = v3;
    uint64_t v27 = v5;
    [(THThreadNetworkCredentialsStoreLocalClient *)keyChainStore retrievePreferredNetworkOfAnyDSFormatWithCompletion:v26];
    dispatch_time_t v6 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v5, v6))
    {
      xpc_object_t v7 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(ThreadNetworkManagerInstance *)v7 getPreferredNetwork];
      }
    }
    else if (!v31[5])
    {
      uint64_t v24 = (THThreadNetworkCredentialsActiveDataSetRecord *)v37[5];
      if (v24)
      {
        tnmDumpRecord(v24);
        xpc_object_t v25 = (void *)v37[5];
      }
      else
      {
        xpc_object_t v25 = 0;
      }
      id v22 = v25;
      goto LABEL_11;
    }
    id v22 = 0;
LABEL_11:

    goto LABEL_12;
  }
  id v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    [(ThreadNetworkManagerInstance *)v5 getPreferredNetwork];
  }
  id v22 = 0;
LABEL_12:

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v22;
}

void __51__ThreadNetworkManagerInstance_getPreferredNetwork__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    xpc_object_t v7 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __61__ThreadNetworkManagerInstance_getPreferredNetworkWithNoScan__block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v8 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Got the Credentials Record, for the PreferredNetwork", v14, 2u);
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = v5;
    xpc_object_t v7 = *(NSObject **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
  id v13 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int)checkPreferredAndJoin:(dict *)a3
{
  id v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance checkPreferredAndJoin:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 3511;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Checking for Preferred network availability to join", buf, 0x12u);
  }

  id v6 = [(ThreadNetworkManagerInstance *)self getPreferredNetwork];
  if (!v6)
  {
    uint64_t v20 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    int v17 = 1;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance checkPreferredAndJoin:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3516;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s:%d: No Preferred Network found ", buf, 0x12u);
    }
    goto LABEL_18;
  }
  if (self->_lastKnownNCPState == 4
    || ![(ThreadNetworkManagerInstance *)self isCurrentNetworkSameAsOneToStart:v6])
  {
    uint64_t v18 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance checkPreferredAndJoin:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3532;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s : %d :  Leaving the existing Network...\n", buf, 0x12u);
    }

    [(ThreadNetworkManagerInstance *)self threadLeave];
    uint64_t v19 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance checkPreferredAndJoin:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 3536;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s : %d :  Joining the Preferred Network...\n", buf, 0x12u);
    }

    uint64_t v20 = [v6 uniqueIdentifier];
    id v21 = [v20 UUIDString];
    int v17 = -[ThreadNetworkManagerInstance formNetworkWithAOD:record:output:](self, "formNetworkWithAOD:record:output:", [v21 UTF8String], v6, a3);

LABEL_18:
    goto LABEL_19;
  }
  xpc_object_t v7 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v6 network];
    id v9 = [v8 networkName];
    id v10 = [v9 UTF8String];
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance checkPreferredAndJoin:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s : Already joined on the same network : Network name : %s", buf, 0x16u);
  }
  uint64_t v11 = [v6 uniqueIdentifier];
  id v12 = [v11 UUIDString];
  id v13 = (const char *)[v12 UTF8String];

  xpc_object_t v14 = xpc_string_create(v13);
  id v23 = v14;
  if (!v14) {
    id v23 = xpc_null_create();
  }

  *(void *)std::string buf = a3;
  *(void *)&buf[8] = "outputUniqueNetworkId";
  xpc::dict::object_proxy::operator=((uint64_t)buf, &v23, &v24);
  id v15 = v24;
  id v24 = 0;

  id v16 = v23;
  id v23 = 0;

  [(ThreadNetworkManagerInstance *)self saveLastKnownJoinedNetwork:v13 datasetRecord:v6];
  int v17 = 0;
LABEL_19:

  return v17;
}

- (int)getMePassPhraseForThisNetwork:(id)a3 passPhrase:(id *)a4
{
  id v7 = a3;
  uint64_t v56 = 0;
  int v57 = &v56;
  uint64_t v58 = 0x3032000000;
  uint64_t v59 = __Block_byref_object_copy__0;
  id v60 = __Block_byref_object_dispose__0;
  id v61 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x3032000000;
  char v53 = __Block_byref_object_copy__0;
  id v54 = __Block_byref_object_dispose__0;
  id v55 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  keyChainStore = self->_keyChainStore;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = __73__ThreadNetworkManagerInstance_getMePassPhraseForThisNetwork_passPhrase___block_invoke;
  v46[3] = &unk_10049C338;
  unint64_t v48 = &v56;
  uint64_t v49 = &v50;
  id v10 = v8;
  id v47 = v10;
  [(THThreadNetworkCredentialsStoreLocalClient *)keyChainStore retrieveAllRecordsForNetwork:v7 completion:v46];
  dispatch_time_t v11 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v10, v11))
  {
    id v12 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance getMePassPhraseForThisNetwork:passPhrase:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
LABEL_19:
    int v29 = 1;
    goto LABEL_23;
  }
  if (v51[5])
  {
    uint64_t v20 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v33 = [(id)v51[5] description];
      id v34 = [v33 UTF8String];
      if (v34)
      {
        id v4 = [(id)v51[5] description];
        id v35 = (const char *)[v4 UTF8String];
      }
      else
      {
        id v35 = "(unknown error)";
      }
      *(_DWORD *)std::string buf = 136315138;
      __int16 v63 = v35;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Error: failed to retrieve (%s)\n", buf, 0xCu);
      if (v34) {
    }
      }
  }
  if (![(id)v57[5] count])
  {
    id v21 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v39 = [(id)v51[5] description];
      id v40 = [v39 UTF8String];
      if (v40)
      {
        id v4 = [(id)v51[5] description];
        id v41 = (const char *)[v4 UTF8String];
      }
      else
      {
        id v41 = "(unknown error)";
      }
      *(_DWORD *)std::string buf = 136315138;
      __int16 v63 = v41;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Error: failed to retrieve (%s), zero records found\n", buf, 0xCu);
      if (v40) {
    }
      }
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v12 = (id)v57[5];
  id v22 = [v12 countByEnumeratingWithState:&v42 objects:v66 count:16];
  if (!v22) {
    goto LABEL_19;
  }
  uint64_t v23 = *(void *)v43;
  while (2)
  {
    for (uint64_t i = 0; i != v22; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v43 != v23) {
        objc_enumerationMutation(v12);
      }
      xpc_object_t v25 = *(void **)(*((void *)&v42 + 1) + 8 * i);
      id v26 = objc_msgSend(v25, "credentials", (void)v42);
      uint64_t v27 = [v26 passPhrase];
      BOOL v28 = v27 == 0;

      if (!v28)
      {
        uint64_t v30 = [v25 credentials];
        *a4 = [v30 passPhrase];

        unsigned int v31 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          uint64_t v36 = (const char *)*a4;
          id v37 = [v25 credentials];
          uint64_t v38 = [v37 passPhrase];
          *(_DWORD *)std::string buf = 138412546;
          __int16 v63 = v36;
          __int16 v64 = 2112;
          __int16 v65 = v38;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "**passPhrase : %@, passphrase  : %@ : ", buf, 0x16u);
        }
        int v29 = 0;
        goto LABEL_23;
      }
    }
    id v22 = [v12 countByEnumeratingWithState:&v42 objects:v66 count:16];
    int v29 = 1;
    if (v22) {
      continue;
    }
    break;
  }
LABEL_23:

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  return v29;
}

void __73__ThreadNetworkManagerInstance_getMePassPhraseForThisNetwork_passPhrase___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v21 = 136315138;
    id v22 = "-[ThreadNetworkManagerInstance getMePassPhraseForThisNetwork:passPhrase:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Inside : %s : ", (uint8_t *)&v21, 0xCu);
  }

  if (v5)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = v5;
    id v10 = *(NSObject **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }
  else
  {
    id v10 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __73__ThreadNetworkManagerInstance_getMePassPhraseForThisNetwork_passPhrase___block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v6;
  id v20 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int)commission:(dict *)a3
{
  return 0;
}

- (BOOL)commissioningCore:(id)a3 PSKd:(id)a4 server:(id)a5 index:(int)a6
{
  return 0;
}

- (BOOL)tnm_internalInstall
{
  return _os_variant_has_internal_diagnostics(0, a2);
}

- (id)dataFromHexString:(id)a3
{
  id v3 = a3;
  id v4 = [v3 lowercaseString];

  id v5 = objc_opt_new();
  __int16 v13 = 0;
  id result = [v4 length];
  int v7 = result - 1;
  if (__OFSUB__(result, 1))
  {
LABEL_14:
    __break(0x5515u);
  }
  else
  {
    if (v7 >= 1)
    {
      int v8 = 0;
      do
      {
        id result = [v4 characterAtIndex:v8];
        int v9 = v8 + 1;
        if ((char)result >= 48
          && result <= 0x66u
          && result - 58 >= 0x27)
        {
          __str[0] = (char)result;
          BOOL v10 = __OFADD__(v8, 2);
          int v11 = v8 + 2;
          if (v10)
          {
            __break(0x5500u);
            goto LABEL_14;
          }
          __str[1] = [v4 characterAtIndex:v9];
          HIBYTE(v13) = strtol(__str, 0, 16);
          [v5 appendBytes:(char *)&v13 + 1 length:1];
          int v9 = v11;
        }
        int v8 = v9;
      }
      while (v9 < v7);
    }

    return v5;
  }
  return result;
}

- (int)commissionToSpecifNetwork:(const char *)a3 credentialsRecord_t:(id)a4 output:(dict *)a5
{
  return 0;
}

- (int)joinerAttach:(const char *)a3 output:(dict *)a4
{
  std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  int v26 = 3;
  long long v27 = *(_OWORD *)buf;
  uint64_t v28 = *(void *)&buf[16];
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  id v20 = "JoinerAttach";
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v24 = "Thread:Joiner:State";
  char v25 = 0;
  if (CtrInternalClientPtr) {
    [CtrInternalClientPtr joiner:&v20];
  }
  else {
    memset(buf, 0, 32);
  }
  CtrXPC::Result::operator=(&v26, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v26)
  {
    int v8 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance joinerAttach:output:](&v26, v8);
    }

    CAMetricsHandlers_joinattempt_status(1, 0);
    [self->_CtrInternalClientPtr leave];
    if (v14 < 0) {
      operator delete(__p);
    }
    int v9 = 1;
  }
  else
  {
    BOOL v10 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::string buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v26;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Joiner return code %u", buf, 8u);
    }

    CAMetricsHandlers_joinattempt_status(1, 1);
    sleep(2u);
    std::string::basic_string[abi:ne180100]<0>(v17, "Command is Successful");
    *(_DWORD *)std::string buf = 0;
    *(_OWORD *)&buf[8] = *(_OWORD *)v17;
    *(void *)&unsigned char buf[24] = v18;
    [(ThreadNetworkManagerInstance *)self saveThreadConfiguration:a4 passPhrase:a3];
    CtrXPC::Result::operator=(buf, (uint64_t)v17);
    if (v19 < 0) {
      operator delete(v17[1]);
    }
    if (*(_DWORD *)buf)
    {
      int v11 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance joinerAttach:output:]();
      }

      [self->_CtrInternalClientPtr leave];
      if (v16 < 0) {
        operator delete(v15);
      }
      int v9 = 1;
    }
    else
    {
      int v9 = 0;
    }
    if ((char)buf[31] < 0) {
      operator delete(*(void **)&buf[8]);
    }
  }
  if (SHIBYTE(v28) < 0) {
    operator delete((void *)v27);
  }
  return v9;
}

- (void)sendThirdPartyMetricsInfo:(unsigned int)a3 prefNws:(unsigned int)a4 prefNwsByApple:(unsigned int)a5
{
  if (CAMetricsHandlers_ctcsmetrics_update(a3, a4, a5))
  {
    *(void *)long long v21 = 0;
    unsigned int v20 = 0;
    id v5 = +[NSMutableDictionary dictionary];
    id v6 = +[NSMutableDictionary dictionary];
    CAMetricsHandlers_handle_get_CTCSNumberOfPreferredNWs(&v21[1], v21);
    CAMetricsHandlers_handle_get_CTCSNumberOfThirdPartyBRs(&v20);
    if (byte_1004B6447 >= 0) {
      int v7 = &mDaemonVersion;
    }
    else {
      int v7 = (uint64_t *)mDaemonVersion;
    }
    int v8 = +[NSString stringWithUTF8String:v7];
    [v5 setObject:v8 forKey:@"header_daemon_version"];

    if (byte_1004B645F >= 0) {
      int v9 = &mVendorVersion;
    }
    else {
      int v9 = (uint64_t *)mVendorVersion;
    }
    BOOL v10 = +[NSString stringWithUTF8String:v9];
    [v5 setObject:v10 forKey:@"header_vendor_version"];

    int v11 = +[NSNumber numberWithUnsignedInt:v20];
    [v5 setObject:v11 forKey:@"number_of_third_party_border_routers"];

    id v12 = v5;
    AnalyticsSendEventLazy();
    if (byte_1004B6447 >= 0) {
      __int16 v13 = &mDaemonVersion;
    }
    else {
      __int16 v13 = (uint64_t *)mDaemonVersion;
    }
    char v14 = +[NSString stringWithUTF8String:v13];
    [v6 setObject:v14 forKey:@"header_daemon_version"];

    if (byte_1004B645F >= 0) {
      uint64_t v15 = &mVendorVersion;
    }
    else {
      uint64_t v15 = (uint64_t *)mVendorVersion;
    }
    char v16 = +[NSString stringWithUTF8String:v15];
    [v6 setObject:v16 forKey:@"header_vendor_version"];

    uint64_t v17 = +[NSNumber numberWithUnsignedInt:v21[0]];
    [v6 setObject:v17 forKey:@"number_of_preferred_nw_by_Apple_border_routers"];

    uint64_t v18 = +[NSNumber numberWithUnsignedInt:v21[1]];
    [v6 setObject:v18 forKey:@"number_of_preferred_nw_by_third_party_border_routers"];

    id v19 = v6;
    AnalyticsSendEventLazy();
  }
}

id __81__ThreadNetworkManagerInstance_sendThirdPartyMetricsInfo_prefNws_prefNwsByApple___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __81__ThreadNetworkManagerInstance_sendThirdPartyMetricsInfo_prefNws_prefNwsByApple___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)retrieveAndPostThirdPartyInfo
{
  keyChainStore = self->_keyChainStore;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __61__ThreadNetworkManagerInstance_retrieveAndPostThirdPartyInfo__block_invoke;
  v3[3] = &unk_10049C3B0;
  v3[4] = self;
  [(THThreadNetworkCredentialsStoreLocalClient *)keyChainStore retrieveThirdPartyInfo:v3];
}

id __61__ThreadNetworkManagerInstance_retrieveAndPostThirdPartyInfo__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v8 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315906;
    int v11 = "-[ThreadNetworkManagerInstance retrieveAndPostThirdPartyInfo]_block_invoke";
    __int16 v12 = 2048;
    uint64_t v13 = a2;
    __int16 v14 = 2048;
    uint64_t v15 = a3;
    __int16 v16 = 2048;
    uint64_t v17 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s : numThirdPartyBRs : %lu numPrefNwByThirdPartyBRs : %lu numPrefNwByAppleBRs : %lu", (uint8_t *)&v10, 0x2Au);
  }

  AWDMetricsClient_UpdateMetrics_CTCS(a2, a3, a4);
  return [*(id *)(a1 + 32) sendThirdPartyMetricsInfo:a2 prefNws:a3 prefNwsByApple:a4];
}

- (int)formNetworkWithAODForPrimaryOrSharedUser:(const char *)a3 isPrimaryUser:(BOOL)a4 routerMode:(BOOL)a5 geoAvailable:(BOOL)a6 defaultChildNode:(BOOL)a7 output:(dict *)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  BOOL v10 = a5;
  BOOL v84 = a4;
  uint64_t v13 = std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  unsigned int v115 = 3;
  std::string v116 = *(std::string *)buf;
  std::string::basic_string[abi:ne180100]<0>(v13, "Command is Successful");
  uint64_t v85 = *(void **)buf;
  int v86 = (char)buf[23];
  id v112 = 0;
  uint64_t v113 = 0;
  uint64_t v114 = 0;
  __int16 v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", a3, +[NSString defaultCStringEncoding]);
  uint64_t v111 = 0;
  if (!v14)
  {
    long long v21 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance formNetworkWithAODForPrimaryOrSharedUser:isPrimaryUser:routerMode:geoAvailable:defaultChildNode:output:]();
    }

    uint64_t v15 = 0;
    goto LABEL_24;
  }
  uint64_t v15 = [(ThreadNetworkManagerInstance *)self dataFromHexString:v14];
  __int16 v16 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAODForPrimaryOrSharedUser:isPrimaryUser:routerMod"
                         "e:geoAvailable:defaultChildNode:output:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4015;
    *(_WORD *)&unsigned char buf[18] = 2112;
    *(void *)&buf[20] = v15;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v84;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s:%d: dsString Data: %@, isPrimaryUser : %d ", buf, 0x22u);
  }

  if (v15)
  {
    id v17 = v15;
    uint64_t v18 = (ctu *)[v17 bytes];
    id v19 = [v17 length];
    ctu::hex((uint64_t *)buf, v18, v19, v20);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(buf, "");
  }
  std::string::operator=[abi:ne180100]((uint64_t)&v112, (long long *)buf);
  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }
  uint64_t v23 = HIBYTE(v114);
  if (v114 < 0) {
    uint64_t v23 = v113;
  }
  if (!v23)
  {
    unsigned int v31 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance formNetworkWithAODForPrimaryOrSharedUser:isPrimaryUser:routerMode:geoAvailable:defaultChildNode:output:]();
    }

LABEL_24:
    id v25 = 0;
    goto LABEL_120;
  }
  id v110 = 0;
  unsigned __int8 v24 = [(ThreadNetworkManagerInstance *)self validateDataSetTLVs:v15 creds:&v110];
  id v25 = v110;
  if ((v24 & 1) == 0)
  {
    uint64_t v32 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance formNetworkWithAODForPrimaryOrSharedUser:isPrimaryUser:routerMode:geoAvailable:defaultChildNode:output:].cold.4();
    }

    goto LABEL_120;
  }
  if (self->_lastKnownNCPState != 4)
  {
    if ([(ThreadNetworkManagerInstance *)self isCurrentNetworkSameAsOneToStart:v25])
    {
      int v26 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        long long v27 = [v25 network];
        id v28 = [v27 networkName];
        id v29 = [v28 UTF8String];
        *(_DWORD *)std::string buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAODForPrimaryOrSharedUser:isPrimaryUser:route"
                             "rMode:geoAvailable:defaultChildNode:output:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 4036;
        *(_WORD *)&unsigned char buf[18] = 2080;
        *(void *)&buf[20] = v29;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s : %d : Already joined on the same network : Network name : %s", buf, 0x1Cu);
      }
      int v30 = 0;
      goto LABEL_129;
    }
    id v33 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAODForPrimaryOrSharedUser:isPrimaryUser:routerM"
                           "ode:geoAvailable:defaultChildNode:output:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 4041;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s : %d : Leaving the existing Network...\n", buf, 0x12u);
    }

    [(ThreadNetworkManagerInstance *)self threadStop];
  }
  [(ThreadNetworkManagerInstance *)self setDeviceNode:v10 geoAvailable:v9 defaultChildNode:v8];
  id v34 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    id v35 = (void **)&v112;
    if (v114 < 0) {
      id v35 = v112;
    }
    *(_DWORD *)std::string buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAODForPrimaryOrSharedUser:isPrimaryUser:routerMod"
                         "e:geoAvailable:defaultChildNode:output:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4048;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = v35;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%s:%d: dataset: %s ", buf, 0x1Cu);
  }

  CAMetricsHandlers_joinattempt_start();
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v108, "Thread:ActiveDataset:Bytes");
  if (CtrInternalClientPtr)
  {
    if (v114 >= 0) {
      id v37 = (void **)&v112;
    }
    else {
      id v37 = v112;
    }
    [CtrInternalClientPtr setProperty:v108 property_val:v37];
  }
  else
  {
    memset(buf, 0, 32);
  }
  CtrXPC::Result::operator=(&v115, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v109 < 0) {
    operator delete(v108[0]);
  }
  uint64_t v38 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    CtrXPC::Result::toString(v115, __p);
    int v39 = v107;
    id v40 = (void **)__p[0];
    std::string::basic_string(&v105, &v116);
    id v41 = __p;
    if (v39 < 0) {
      id v41 = v40;
    }
    if ((v105.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      long long v42 = &v105;
    }
    else {
      long long v42 = (std::string *)v105.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)std::string buf = 136316162;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAODForPrimaryOrSharedUser:isPrimaryUser:routerMod"
                         "e:geoAvailable:defaultChildNode:output:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4062;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = "Thread:ActiveDataset:Bytes";
    *(_WORD *)&buf[28] = 2080;
    *(void *)&buf[30] = v41;
    *(_WORD *)&unsigned char buf[38] = 2080;
    *(void *)&uint8_t buf[40] = v42;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%s:%d: Set Result for %s = %s, Error Info: %s", buf, 0x30u);
    if (SHIBYTE(v105.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v105.__r_.__value_.__l.__data_);
    }
    if (v107 < 0) {
      operator delete(__p[0]);
    }
  }

  if (v115)
  {
    long long v43 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      CtrXPC::Result::toString(v115, __p);
      int v44 = v107;
      long long v45 = (void **)__p[0];
      std::string::basic_string(&v105, &v116);
      uint64_t v46 = __p;
      if (v44 < 0) {
        uint64_t v46 = v45;
      }
      if ((v105.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        id v47 = &v105;
      }
      else {
        id v47 = (std::string *)v105.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAODForPrimaryOrSharedUser:isPrimaryUser:routerM"
                           "ode:geoAvailable:defaultChildNode:output:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "Thread:ActiveDataset:Bytes";
      *(_WORD *)&unsigned char buf[22] = 2080;
      *(void *)&unsigned char buf[24] = v46;
      *(_WORD *)&unsigned char buf[32] = 2080;
      *(void *)&unsigned char buf[34] = v47;
      unint64_t v48 = "%s : Set kWPANTUNDProperty_ThreadActiveDatasetBytes Result for %s = %s, Error Info: %s";
      uint64_t v49 = v43;
      uint32_t v50 = 42;
LABEL_169:
      _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, v48, buf, v50);
      if (SHIBYTE(v105.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v105.__r_.__value_.__l.__data_);
      }
      if (v107 < 0) {
        operator delete(__p[0]);
      }
      goto LABEL_119;
    }
    goto LABEL_119;
  }
  uint64_t v51 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v103, "wasDeviceEverAChildInCurrentNetwork");
  if (v51) {
    [(CtrInternalClient *)v51 getProperty:v103 output:&v111];
  }
  else {
    memset(buf, 0, 32);
  }
  int v52 = *CtrXPC::Result::operator=(&v115, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v104 < 0) {
    operator delete(v103[0]);
  }
  if (v52)
  {
    char v53 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance formNetworkWithAODForPrimaryOrSharedUser:isPrimaryUser:routerMode:geoAvailable:defaultChildNode:output:]();
    }
    LOBYTE(v54) = 0;
  }
  else
  {
    BOOL v54 = any_to_BOOL((const boost::any *)&v111);
    char v53 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAODForPrimaryOrSharedUser:isPrimaryUser:routerM"
                           "ode:geoAvailable:defaultChildNode:output:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 4077;
      *(_WORD *)&unsigned char buf[18] = 1024;
      *(_DWORD *)&buf[20] = v54;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%s:%d: wasChildStatus: %d ", buf, 0x18u);
    }
  }

  int deviceNode = self->_deviceNode;
  char v56 = deviceNode != 9 || v54;
  if ((v56 & 1) == 0)
  {
    self->_int deviceNode = 8;
    int v57 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAODForPrimaryOrSharedUser:isPrimaryUser:routerM"
                           "ode:geoAvailable:defaultChildNode:output:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 4083;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%s:%d: Overriding Device Status from CHILD to SLEEPY ROUTER ", buf, 0x12u);
    }

    int deviceNode = self->_deviceNode;
  }
  if (deviceNode == 1)
  {
    uint64_t v59 = self->_CtrInternalClientPtr;
    std::string::basic_string[abi:ne180100]<0>(v99, "Network:NodeType");
    if (v59) {
      [(CtrInternalClient *)v59 setProperty:v99 property_val:"router"];
    }
    else {
      memset(buf, 0, 32);
    }
    CtrXPC::Result::operator=(&v115, (uint64_t)buf);
    if ((char)buf[31] < 0) {
      operator delete(*(void **)&buf[8]);
    }
    if ((v100 & 0x80000000) == 0) {
      goto LABEL_107;
    }
    id v61 = (void *)v99[0];
  }
  else if (deviceNode == 9)
  {
    uint64_t v58 = self->_CtrInternalClientPtr;
    std::string::basic_string[abi:ne180100]<0>(v101, "Network:NodeType");
    if (v58) {
      [(CtrInternalClient *)v58 setProperty:v101 property_val:self->_defaultChildNode];
    }
    else {
      memset(buf, 0, 32);
    }
    CtrXPC::Result::operator=(&v115, (uint64_t)buf);
    if ((char)buf[31] < 0) {
      operator delete(*(void **)&buf[8]);
    }
    if ((v102 & 0x80000000) == 0) {
      goto LABEL_107;
    }
    id v61 = (void *)v101[0];
  }
  else
  {
    id v60 = self->_CtrInternalClientPtr;
    std::string::basic_string[abi:ne180100]<0>(v97, "Network:NodeType");
    if (v60) {
      [(CtrInternalClient *)v60 setProperty:v97 property_val:"sleepy-router"];
    }
    else {
      memset(buf, 0, 32);
    }
    CtrXPC::Result::operator=(&v115, (uint64_t)buf);
    if ((char)buf[31] < 0) {
      operator delete(*(void **)&buf[8]);
    }
    if ((v98 & 0x80000000) == 0) {
      goto LABEL_107;
    }
    id v61 = v97[0];
  }
  operator delete(v61);
LABEL_107:
  id v62 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    CtrXPC::Result::toString(v115, __p);
    int v63 = v107;
    __int16 v64 = (void **)__p[0];
    std::string::basic_string(&v105, &v116);
    __int16 v65 = __p;
    if (v63 < 0) {
      __int16 v65 = v64;
    }
    if ((v105.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v66 = &v105;
    }
    else {
      uint64_t v66 = (std::string *)v105.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)std::string buf = 136316162;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAODForPrimaryOrSharedUser:isPrimaryUser:routerMod"
                         "e:geoAvailable:defaultChildNode:output:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4104;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = "Network:NodeType";
    *(_WORD *)&buf[28] = 2080;
    *(void *)&buf[30] = v65;
    *(_WORD *)&unsigned char buf[38] = 2080;
    *(void *)&uint8_t buf[40] = v66;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%s : %d Set Result for %s = %s, Error Info: %s", buf, 0x30u);
    if (SHIBYTE(v105.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v105.__r_.__value_.__l.__data_);
    }
    if (v107 < 0) {
      operator delete(__p[0]);
    }
  }

  if (v115)
  {
    long long v43 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      CtrXPC::Result::toString(v115, __p);
      int v76 = v107;
      uint64_t v77 = (void **)__p[0];
      std::string::basic_string(&v105, &v116);
      uint64_t v78 = __p;
      if (v76 < 0) {
        uint64_t v78 = v77;
      }
      if ((v105.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v79 = &v105;
      }
      else {
        uint64_t v79 = (std::string *)v105.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string buf = 136316162;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAODForPrimaryOrSharedUser:isPrimaryUser:routerM"
                           "ode:geoAvailable:defaultChildNode:output:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 4107;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = "Network:NodeType";
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = v78;
      *(_WORD *)&unsigned char buf[38] = 2080;
      *(void *)&uint8_t buf[40] = v79;
      unint64_t v48 = "%s:%d: Set kWPANTUNDProperty_NetworkNodeType Result for %s = %s, Error Info: %s";
      uint64_t v49 = v43;
      uint32_t v50 = 48;
      goto LABEL_169;
    }
LABEL_119:

    CAMetricsHandlers_joinattempt_status(0, 0);
    goto LABEL_120;
  }
  unsigned int v69 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v95, "Interface:Up");
  if (v69) {
    [(CtrInternalClient *)v69 setProperty:v95 property_val:"1"];
  }
  else {
    memset(buf, 0, 32);
  }
  CtrXPC::Result::operator=(&v115, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v96 < 0) {
    operator delete(v95[0]);
  }
  int v70 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    CtrXPC::Result::toString(v115, __p);
    int v71 = v107;
    uint64_t v72 = (void **)__p[0];
    std::string::basic_string(&v105, &v116);
    uint64_t v73 = __p;
    if (v71 < 0) {
      uint64_t v73 = v72;
    }
    if ((v105.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v74 = &v105;
    }
    else {
      uint64_t v74 = (std::string *)v105.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)std::string buf = 136316162;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAODForPrimaryOrSharedUser:isPrimaryUser:routerMod"
                         "e:geoAvailable:defaultChildNode:output:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4123;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = "Interface:Up";
    *(_WORD *)&buf[28] = 2080;
    *(void *)&buf[30] = v73;
    *(_WORD *)&unsigned char buf[38] = 2080;
    *(void *)&uint8_t buf[40] = v74;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%s:%d: Set Result for %s = %s, Error Info: %s", buf, 0x30u);
    if (SHIBYTE(v105.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v105.__r_.__value_.__l.__data_);
    }
    if (v107 < 0) {
      operator delete(__p[0]);
    }
  }

  if (!v115)
  {
    if (v84)
    {
      [(ThreadNetworkManagerInstance *)self saveLastKnownJoinedNetwork:0 datasetRecord:v25];
      CAMetricsHandlers_joinattempt_status(0, 1);
    }
    int v30 = 0;
    goto LABEL_127;
  }
  uint64_t v75 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
  if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
  {
    CtrXPC::Result::toString(v115, __p);
    int v80 = v107;
    uint64_t v81 = (void **)__p[0];
    std::string::basic_string(&v105, &v116);
    uint64_t v82 = __p;
    if (v80 < 0) {
      uint64_t v82 = v81;
    }
    if ((v105.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v83 = &v105;
    }
    else {
      uint64_t v83 = (std::string *)v105.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)std::string buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAODForPrimaryOrSharedUser:isPrimaryUser:routerMod"
                         "e:geoAvailable:defaultChildNode:output:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "Interface:Up";
    *(_WORD *)&unsigned char buf[22] = 2080;
    *(void *)&unsigned char buf[24] = v82;
    *(_WORD *)&unsigned char buf[32] = 2080;
    *(void *)&unsigned char buf[34] = v83;
    _os_log_error_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "%s : Set kWPANTUNDProperty_InterfaceUp Result for %s = %s, Error Info: %s", buf, 0x2Au);
    if (SHIBYTE(v105.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v105.__r_.__value_.__l.__data_);
    }
    if (v107 < 0) {
      operator delete(__p[0]);
    }
  }

  CAMetricsHandlers_joinattempt_status(0, 0);
  long long v22 = [self->_CtrInternalClientPtr leave];
  if (v94 < 0) {
    operator delete(v93);
  }
LABEL_120:
  uint64_t RcpHostContext = RcpHostContext::GetRcpHostContext((RcpHostContext *)v22);
  std::string::basic_string[abi:ne180100]<0>(v91, "Error");
  std::string::basic_string[abi:ne180100]<0>(v89, "Form Failed");
  std::string::basic_string[abi:ne180100]<0>(v87, "Failed to form a specific network using AOD for shared admin, active operational dataset in RCP");
  RcpHostContext::captureABC(RcpHostContext, (uint64_t)v91, (uint64_t)v89, (uint64_t)v87, 0, 1);
  if (v88 < 0) {
    operator delete(v87[0]);
  }
  if (v90 < 0) {
    operator delete(v89[0]);
  }
  if (v92 < 0) {
    operator delete(v91[0]);
  }
  int v30 = 1;
LABEL_127:
  int v26 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAODForPrimaryOrSharedUser:isPrimaryUser:routerMod"
                         "e:geoAvailable:defaultChildNode:output:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4151;
    *(_WORD *)&unsigned char buf[18] = 1024;
    *(_DWORD *)&buf[20] = v30;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s:%d: Exiting, ret : %d", buf, 0x18u);
  }
LABEL_129:

  if (v111) {
    (*(void (**)(uint64_t))(*(void *)v111 + 8))(v111);
  }

  if (SHIBYTE(v114) < 0) {
    operator delete(v112);
  }
  if (v86 < 0) {
    operator delete(v85);
  }
  if (SHIBYTE(v116.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v116.__r_.__value_.__l.__data_);
  }

  return v30;
}

- (int)formNetworkWithAOD:(const char *)a3 record:(id)a4 output:(dict *)a5
{
  id v6 = a4;
  int v7 = std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  unsigned int v101 = 3;
  std::string v102 = *(std::string *)buf;
  std::string::basic_string[abi:ne180100]<0>(v7, "Command is Successful");
  uint64_t v75 = *(void **)buf;
  int v76 = (char)buf[23];
  BOOL v8 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = [v6 credentialsDataSet];
    BOOL v10 = [v9 dataSetArray];
    *(_DWORD *)std::string buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAOD:record:output:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4162;
    *(_WORD *)&unsigned char buf[18] = 2112;
    *(void *)&buf[20] = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:%d: dsString Data: %@ ", buf, 0x1Cu);
  }
  int v11 = [v6 credentialsDataSet];
  __int16 v12 = [v11 dataSetArray];
  if (v12)
  {
    uint64_t v13 = [v6 credentialsDataSet];
    id v14 = [v13 dataSetArray];
    uint64_t v15 = (ctu *)[v14 bytes];
    __int16 v16 = [v6 credentialsDataSet];
    id v17 = [v16 dataSetArray];
    id v18 = [v17 length];
    ctu::hex((uint64_t *)v99, v15, v18, v19);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(v99, "");
  }

  unint64_t v20 = v100;
  if ((v100 & 0x80u) != 0) {
    unint64_t v20 = (unint64_t)v99[1];
  }
  if (!v20)
  {
    id v28 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance formNetworkWithAOD:record:output:]();
    }

    goto LABEL_85;
  }
  long long v21 = [v6 credentialsDataSet];
  long long v22 = [v21 dataSetArray];
  unsigned __int8 v23 = [(ThreadNetworkManagerInstance *)self validateDataSetTLVs:v22];

  if ((v23 & 1) == 0)
  {
    int v30 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance formNetworkWithAOD:record:output:]();
    }

    int v31 = [(ThreadNetworkManagerInstance *)self formNetworkWithCreds:a3 credentialsRecord_t:v6 output:a5];
    goto LABEL_92;
  }
  unsigned __int8 v24 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    id v25 = v99;
    if ((v100 & 0x80u) != 0) {
      id v25 = (void **)v99[0];
    }
    *(_DWORD *)std::string buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAOD:record:output:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4181;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s:%d: dataset: %s ", buf, 0x1Cu);
  }

  CAMetricsHandlers_joinattempt_start();
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v97, "Thread:ActiveDataset:Bytes");
  if (CtrInternalClientPtr)
  {
    if ((v100 & 0x80u) == 0) {
      long long v27 = v99;
    }
    else {
      long long v27 = (void **)v99[0];
    }
    [CtrInternalClientPtr setProperty:v97 property_val:v27];
  }
  else
  {
    memset(buf, 0, 32);
  }
  CtrXPC::Result::operator=(&v101, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v98 < 0) {
    operator delete(v97[0]);
  }
  uint64_t v32 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    CtrXPC::Result::toString(v101, __p);
    int v33 = v96;
    id v34 = (void **)__p[0];
    std::string::basic_string(&v94, &v102);
    id v35 = __p;
    if (v33 < 0) {
      id v35 = v34;
    }
    if ((v94.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v36 = &v94;
    }
    else {
      uint64_t v36 = (std::string *)v94.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)std::string buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAOD:record:output:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "Thread:ActiveDataset:Bytes";
    *(_WORD *)&unsigned char buf[22] = 2080;
    *(void *)&unsigned char buf[24] = v35;
    *(_WORD *)&unsigned char buf[32] = 2080;
    *(void *)&unsigned char buf[34] = v36;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%s : Set Result for %s = %s, Error Info: %s", buf, 0x2Au);
    if (SHIBYTE(v94.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v94.__r_.__value_.__l.__data_);
    }
    if (v96 < 0) {
      operator delete(__p[0]);
    }
  }

  if (v101)
  {
    id v37 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      CtrXPC::Result::toString(v101, __p);
      int v38 = v96;
      int v39 = (void **)__p[0];
      std::string::basic_string(&v94, &v102);
      id v40 = __p;
      if (v38 < 0) {
        id v40 = v39;
      }
      if ((v94.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        id v41 = &v94;
      }
      else {
        id v41 = (std::string *)v94.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAOD:record:output:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "Thread:ActiveDataset:Bytes";
      *(_WORD *)&unsigned char buf[22] = 2080;
      *(void *)&unsigned char buf[24] = v40;
      *(_WORD *)&unsigned char buf[32] = 2080;
      *(void *)&unsigned char buf[34] = v41;
      long long v42 = "%s : Set kWPANTUNDProperty_ThreadActiveDatasetBytes Result for %s = %s, Error Info: %s";
LABEL_129:
      _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, v42, buf, 0x2Au);
      if (SHIBYTE(v94.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v94.__r_.__value_.__l.__data_);
      }
      if (v96 < 0) {
        operator delete(__p[0]);
      }
      goto LABEL_84;
    }
    goto LABEL_84;
  }
  int deviceNode = self->_deviceNode;
  if (deviceNode == 1)
  {
    long long v45 = self->_CtrInternalClientPtr;
    std::string::basic_string[abi:ne180100]<0>(v90, "Network:NodeType");
    if (v45) {
      [(CtrInternalClient *)v45 setProperty:v90 property_val:"router"];
    }
    else {
      memset(buf, 0, 32);
    }
    CtrXPC::Result::operator=(&v101, (uint64_t)buf);
    if ((char)buf[31] < 0) {
      operator delete(*(void **)&buf[8]);
    }
    if ((v91 & 0x80000000) == 0) {
      goto LABEL_72;
    }
    id v47 = (void *)v90[0];
  }
  else if (deviceNode == 9)
  {
    int v44 = self->_CtrInternalClientPtr;
    std::string::basic_string[abi:ne180100]<0>(v92, "Network:NodeType");
    if (v44) {
      [(CtrInternalClient *)v44 setProperty:v92 property_val:self->_defaultChildNode];
    }
    else {
      memset(buf, 0, 32);
    }
    CtrXPC::Result::operator=(&v101, (uint64_t)buf);
    if ((char)buf[31] < 0) {
      operator delete(*(void **)&buf[8]);
    }
    if ((v93 & 0x80000000) == 0) {
      goto LABEL_72;
    }
    id v47 = (void *)v92[0];
  }
  else
  {
    uint64_t v46 = self->_CtrInternalClientPtr;
    std::string::basic_string[abi:ne180100]<0>(v88, "Network:NodeType");
    if (v46) {
      [(CtrInternalClient *)v46 setProperty:v88 property_val:"sleepy-router"];
    }
    else {
      memset(buf, 0, 32);
    }
    CtrXPC::Result::operator=(&v101, (uint64_t)buf);
    if ((char)buf[31] < 0) {
      operator delete(*(void **)&buf[8]);
    }
    if ((v89 & 0x80000000) == 0) {
      goto LABEL_72;
    }
    id v47 = v88[0];
  }
  operator delete(v47);
LABEL_72:
  unint64_t v48 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    CtrXPC::Result::toString(v101, __p);
    int v49 = v96;
    uint32_t v50 = (void **)__p[0];
    std::string::basic_string(&v94, &v102);
    uint64_t v51 = __p;
    if (v49 < 0) {
      uint64_t v51 = v50;
    }
    if ((v94.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int v52 = &v94;
    }
    else {
      int v52 = (std::string *)v94.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)std::string buf = 136316162;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAOD:record:output:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4222;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = "Network:NodeType";
    *(_WORD *)&buf[28] = 2080;
    *(void *)&buf[30] = v51;
    *(_WORD *)&unsigned char buf[38] = 2080;
    *(void *)&uint8_t buf[40] = v52;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "%s : %d Set Result for %s = %s, Error Info: %s", buf, 0x30u);
    if (SHIBYTE(v94.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v94.__r_.__value_.__l.__data_);
    }
    if (v96 < 0) {
      operator delete(__p[0]);
    }
  }

  if (v101)
  {
    id v37 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      CtrXPC::Result::toString(v101, __p);
      int v65 = v96;
      uint64_t v66 = (void **)__p[0];
      std::string::basic_string(&v94, &v102);
      uint64_t v67 = __p;
      if (v65 < 0) {
        uint64_t v67 = v66;
      }
      if ((v94.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v68 = &v94;
      }
      else {
        uint64_t v68 = (std::string *)v94.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAOD:record:output:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "Network:NodeType";
      *(_WORD *)&unsigned char buf[22] = 2080;
      *(void *)&unsigned char buf[24] = v67;
      *(_WORD *)&unsigned char buf[32] = 2080;
      *(void *)&unsigned char buf[34] = v68;
      long long v42 = "%s : Set kWPANTUNDProperty_NetworkNodeType Result for %s = %s, Error Info: %s";
      goto LABEL_129;
    }
LABEL_84:

    CAMetricsHandlers_joinattempt_status(0, 0);
LABEL_85:
    uint64_t RcpHostContext = RcpHostContext::GetRcpHostContext(v29);
    std::string::basic_string[abi:ne180100]<0>(v81, "Error");
    std::string::basic_string[abi:ne180100]<0>(v79, "Form Failed");
    std::string::basic_string[abi:ne180100]<0>(v77, "Failed to form a specific network using AOD, active operational dataset in RCP");
    RcpHostContext::captureABC(RcpHostContext, (uint64_t)v81, (uint64_t)v79, (uint64_t)v77, 0, 1);
    if (v78 < 0) {
      operator delete(v77[0]);
    }
    if (v80 < 0) {
      operator delete(v79[0]);
    }
    if (v82 < 0) {
      operator delete(v81[0]);
    }
    int v31 = 1;
    goto LABEL_92;
  }
  id v55 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v86, "Interface:Up");
  if (v55) {
    [(CtrInternalClient *)v55 setProperty:v86 property_val:"1"];
  }
  else {
    memset(buf, 0, 32);
  }
  CtrXPC::Result::operator=(&v101, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v87 < 0) {
    operator delete(v86[0]);
  }
  char v56 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
  if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
  {
    CtrXPC::Result::toString(v101, __p);
    int v57 = v96;
    uint64_t v58 = (void **)__p[0];
    std::string::basic_string(&v94, &v102);
    uint64_t v59 = __p;
    if (v57 < 0) {
      uint64_t v59 = v58;
    }
    if ((v94.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      id v60 = &v94;
    }
    else {
      id v60 = (std::string *)v94.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)std::string buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAOD:record:output:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "Interface:Up";
    *(_WORD *)&unsigned char buf[22] = 2080;
    *(void *)&unsigned char buf[24] = v59;
    *(_WORD *)&unsigned char buf[32] = 2080;
    *(void *)&unsigned char buf[34] = v60;
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "%s : Set Result for %s = %s, Error Info: %s", buf, 0x2Au);
    if (SHIBYTE(v94.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v94.__r_.__value_.__l.__data_);
    }
    if (v96 < 0) {
      operator delete(__p[0]);
    }
  }

  if (v101)
  {
    id v61 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      CtrXPC::Result::toString(v101, __p);
      int v69 = v96;
      int v70 = (void **)__p[0];
      std::string::basic_string(&v94, &v102);
      int v71 = __p;
      if (v69 < 0) {
        int v71 = v70;
      }
      if ((v94.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v72 = &v94;
      }
      else {
        uint64_t v72 = (std::string *)v94.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithAOD:record:output:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "Interface:Up";
      *(_WORD *)&unsigned char buf[22] = 2080;
      *(void *)&unsigned char buf[24] = v71;
      *(_WORD *)&unsigned char buf[32] = 2080;
      *(void *)&unsigned char buf[34] = v72;
      _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%s : Set kWPANTUNDProperty_InterfaceUp Result for %s = %s, Error Info: %s", buf, 0x2Au);
      if (SHIBYTE(v94.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v94.__r_.__value_.__l.__data_);
      }
      if (v96 < 0) {
        operator delete(__p[0]);
      }
    }

    CAMetricsHandlers_joinattempt_status(0, 0);
    id v29 = [self->_CtrInternalClientPtr leave];
    if (v85 < 0) {
      operator delete(v84[2]);
    }
    goto LABEL_85;
  }
  [(ThreadNetworkManagerInstance *)self saveLastKnownJoinedNetwork:a3 datasetRecord:v6];
  xpc_object_t v62 = xpc_string_create(a3);
  id v83 = v62;
  if (!v62) {
    id v83 = xpc_null_create();
  }

  *(void *)std::string buf = a5;
  *(void *)&buf[8] = "outputUniqueNetworkId";
  xpc::dict::object_proxy::operator=((uint64_t)buf, &v83, v84);
  id v63 = v84[0];
  v84[0] = 0;

  id v64 = v83;
  id v83 = 0;

  CAMetricsHandlers_joinattempt_status(0, 1);
  int v31 = 0;
LABEL_92:
  if ((char)v100 < 0) {
    operator delete(v99[0]);
  }
  if (v76 < 0) {
    operator delete(v75);
  }
  if (SHIBYTE(v102.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v102.__r_.__value_.__l.__data_);
  }

  return v31;
}

- (int)formNetworkWithCreds:(const char *)a3 credentialsRecord_t:(id)a4 output:(dict *)a5
{
  id v7 = a4;
  v131[0] = 0;
  v131[1] = 0;
  uint64_t v132 = 0;
  int v165 = 0;
  memset(__b, 0, sizeof(__b));
  std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  unsigned int v123 = 3;
  std::string v124 = *(std::string *)buf;
  int deviceNode = self->_deviceNode;
  if (deviceNode == 1)
  {
    defaultChildNode = "router";
  }
  else if (deviceNode == 9)
  {
    defaultChildNode = self->_defaultChildNode;
  }
  else
  {
    defaultChildNode = "sleepy-router";
  }
  BOOL v10 = [v7 credentials];
  unsigned __int16 v109 = (unsigned __int16)[v10 channel];

  int v11 = [v7 credentials];
  id v12 = [v11 PANID];
  unsigned int v108 = *(unsigned __int16 *)[v12 bytes];

  uint64_t v13 = [v7 network];
  id v14 = [v13 extendedPANID];
  unint64_t v15 = *(void *)[v14 bytes];

  __int16 v16 = [v7 network];
  id v17 = [v16 networkName];
  id v18 = [v17 UTF8String];

  unint64_t v19 = [v7 credentials];
  id v20 = [v19 masterKey];
  long long v21 = (long long *)[v20 bytes];

  long long v163 = *v21;
  long long v22 = [v7 credentials];
  unsigned __int8 v23 = [v22 PSKc];
  LODWORD(v20) = v23 == 0;

  unint64_t v24 = bswap64(v15);
  if (v20)
  {
    int v33 = [v7 credentials];
    id v34 = [v33 passPhrase];
    BOOL v35 = v34 == 0;

    if (v35)
    {
      id v64 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance formNetworkWithCreds:credentialsRecord_t:output:](v64, v65, v66, v67, v68, v69, v70, v71);
      }

      goto LABEL_62;
    }
    *(void *)std::string buf = v18;
    *(void *)&buf[8] = 0;
    *(void *)&uint8_t buf[16] = 0;
    *(void *)&unsigned char buf[24] = v24;
    uint64_t v36 = [v7 credentials];
    id v37 = [v36 passPhrase];
    *(void *)&uint8_t buf[16] = [v37 UTF8String];

    [(ThreadNetworkManagerInstance *)self getPskc:buf pskc_str:v131];
    CtrXPC::Result::operator=(&v123, (uint64_t)v160);
    if (v162 < 0) {
      operator delete(*(void **)&v160[8]);
    }
    if (v123)
    {
      int v38 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance formNetworkWithCreds:credentialsRecord_t:output:](v38, v39, v40, v41, v42, v43, v44, v45);
      }

      goto LABEL_62;
    }
    char v96 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
    if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
    {
      __int16 v97 = v131;
      if (v132 < 0) {
        __int16 v97 = (void **)v131[0];
      }
      *(_DWORD *)v160 = 136315394;
      *(void *)&v160[4] = "-[ThreadNetworkManagerInstance formNetworkWithCreds:credentialsRecord_t:output:]";
      *(_WORD *)&v160[12] = 2080;
      *(void *)&v160[14] = v97;
      _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_INFO, "%s : generated pskc string : %s", v160, 0x16u);
    }

    if (v132 >= 0) {
      int v30 = v131;
    }
    else {
      int v30 = (void **)v131[0];
    }
  }
  else
  {
    id v25 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      int v26 = [v7 credentials];
      long long v27 = [v26 PSKc];
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithCreds:credentialsRecord_t:output:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s: Creds PSKC : %@", buf, 0x16u);
    }
    *(void *)std::string buf = 0;
    *(void *)&buf[8] = 0;
    id v28 = [v7 credentials];
    id v29 = [v28 PSKc];
    *(_OWORD *)std::string buf = *(_OWORD *)[v29 bytes];

    encode_data_into_string(buf, 16, (char *)__b, 0x24uLL, 0);
    int v30 = (void **)__b;
  }
  int v31 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithCreds:credentialsRecord_t:output:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v30;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%s : pskc string : %s", buf, 0x16u);
  }

  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(__p, "Network:PSKc");
  if (CtrInternalClientPtr) {
    [CtrInternalClientPtr setProperty:__p property_val:v30];
  }
  else {
    memset(buf, 0, sizeof(buf));
  }
  CtrXPC::Result::operator=(&v123, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v122 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v46 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    unint64_t v47 = v24;
    id v48 = v18;
    int v49 = a3;
    CtrXPC::Result::toString(v123, v160);
    int v50 = v161;
    uint64_t v51 = *(unsigned char **)v160;
    std::string::basic_string(&v120, &v124);
    int v52 = v160;
    if (v50 < 0) {
      int v52 = v51;
    }
    if ((v120.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      char v53 = &v120;
    }
    else {
      char v53 = (std::string *)v120.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)std::string buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithCreds:credentialsRecord_t:output:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "Network:PSKc";
    *(_WORD *)&unsigned char buf[22] = 2080;
    *(void *)&unsigned char buf[24] = v52;
    __int16 v158 = 2080;
    v159 = v53;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "%s : Set Result for %s = %s, Error Info: %s", buf, 0x2Au);
    if (SHIBYTE(v120.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v120.__r_.__value_.__l.__data_);
    }
    a3 = v49;
    id v18 = v48;
    if (v161 < 0) {
      operator delete(*(void **)v160);
    }
    unint64_t v24 = v47;
  }

  if (v123)
  {
    BOOL v54 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      goto LABEL_61;
    }
    CtrXPC::Result::toString(v123, v160);
    int v99 = v161;
    unsigned __int8 v100 = *(unsigned char **)v160;
    std::string::basic_string(&v120, &v124);
    unsigned int v101 = v160;
    if (v99 < 0) {
      unsigned int v101 = v100;
    }
    if ((v120.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string v102 = &v120;
    }
    else {
      std::string v102 = (std::string *)v120.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)std::string buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithCreds:credentialsRecord_t:output:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "Network:PSKc";
    *(_WORD *)&unsigned char buf[22] = 2080;
    *(void *)&unsigned char buf[24] = v101;
    __int16 v158 = 2080;
    v159 = v102;
    _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%s : Set PSKC Result for %s = %s, Error Info: %s", buf, 0x2Au);
    if (SHIBYTE(v120.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v120.__r_.__value_.__l.__data_);
    }
    if ((v161 & 0x80000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_125;
  }
  id v55 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
  if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
  {
    unint64_t v56 = v24;
    id v57 = v18;
    uint64_t v58 = a3;
    CtrXPC::Result::toString(v123, v160);
    int v59 = v161;
    id v60 = *(unsigned char **)v160;
    std::string::basic_string(&v120, &v124);
    id v61 = v160;
    if (v59 < 0) {
      id v61 = v60;
    }
    if ((v120.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      xpc_object_t v62 = &v120;
    }
    else {
      xpc_object_t v62 = (std::string *)v120.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)std::string buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithCreds:credentialsRecord_t:output:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "Network:PSKc";
    *(_WORD *)&unsigned char buf[22] = 2080;
    *(void *)&unsigned char buf[24] = v61;
    __int16 v158 = 2080;
    v159 = v62;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "%s : Set PSKC Result for %s = %s, Error Info: %s", buf, 0x2Au);
    if (SHIBYTE(v120.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v120.__r_.__value_.__l.__data_);
    }
    a3 = v58;
    id v18 = v57;
    if (v161 < 0) {
      operator delete(*(void **)v160);
    }
    unint64_t v24 = v56;
  }

  id v63 = self->_CtrInternalClientPtr;
  id v133 = v18;
  char v134 = 1;
  unsigned __int16 v135 = v109;
  char v136 = 0;
  __int16 v137 = v129;
  char v138 = v130;
  int v139 = 0;
  char v140 = 1;
  __int16 v141 = bswap32(v108) >> 16;
  char v142 = 1;
  *(_DWORD *)v143 = *(_DWORD *)v128;
  *(_DWORD *)&v143[3] = *(_DWORD *)&v128[3];
  unint64_t v144 = v24;
  char v145 = 1;
  long long v146 = v163;
  char v147 = 0;
  int v148 = 0;
  char v149 = 0;
  *(_DWORD *)v150 = *(_DWORD *)v127;
  *(_DWORD *)&v150[3] = *(_DWORD *)&v127[3];
  v151 = defaultChildNode;
  char v152 = 0;
  char v153 = 0;
  char v154 = 1;
  char v156 = v126;
  int v155 = v125;
  if (v63) {
    [(CtrInternalClient *)v63 form:&v133];
  }
  else {
    memset(buf, 0, sizeof(buf));
  }
  CtrXPC::Result::operator=(&v123, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v123)
  {
    BOOL v54 = log_get_logging_obg("com.apple.wpantund.tnm", "join");
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      goto LABEL_61;
    }
    CtrXPC::Result::toString(v123, v160);
    int v103 = v161;
    char v104 = *(unsigned char **)v160;
    std::string::basic_string(&v120, &v124);
    std::string v105 = v160;
    if (v103 < 0) {
      std::string v105 = v104;
    }
    if ((v120.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      __int16 v106 = &v120;
    }
    else {
      __int16 v106 = (std::string *)v120.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)std::string buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithCreds:credentialsRecord_t:output:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v105;
    *(_WORD *)&unsigned char buf[22] = 2080;
    *(void *)&unsigned char buf[24] = v106;
    _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%s : TNM got the Failed Result for Form as = %s, Error Info: %s", buf, 0x20u);
    if (SHIBYTE(v120.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v120.__r_.__value_.__l.__data_);
    }
    if ((v161 & 0x80000000) == 0) {
      goto LABEL_61;
    }
LABEL_125:
    operator delete(*(void **)v160);
LABEL_61:

LABEL_62:
    BOOL v72 = 0;
LABEL_63:
    int v73 = 1;
    goto LABEL_64;
  }
  uint64_t v77 = log_get_logging_obg("com.apple.wpantund.tnm", "join");
  if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
  {
    char v78 = a3;
    CtrXPC::Result::toString(v123, v160);
    int v79 = v161;
    char v80 = *(unsigned char **)v160;
    std::string::basic_string(&v120, &v124);
    uint64_t v81 = v160;
    if (v79 < 0) {
      uint64_t v81 = v80;
    }
    if ((v120.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      char v82 = &v120;
    }
    else {
      char v82 = (std::string *)v120.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)std::string buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNetworkWithCreds:credentialsRecord_t:output:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v81;
    *(_WORD *)&unsigned char buf[22] = 2080;
    *(void *)&unsigned char buf[24] = v82;
    _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "%s : TNM got the Success Result for Form as = %s, Error Info: %s", buf, 0x20u);
    if (SHIBYTE(v120.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v120.__r_.__value_.__l.__data_);
    }
    a3 = v78;
    if (v161 < 0) {
      operator delete(*(void **)v160);
    }
  }

  xpc_object_t v83 = xpc_string_create(a3);
  id v118 = v83;
  if (!v83)
  {
    id v118 = xpc_null_create();
  }
  *(void *)std::string buf = a5;
  *(void *)&buf[8] = "outputUniqueNetworkId";
  xpc::dict::object_proxy::operator=((uint64_t)buf, &v118, &v119);
  id v84 = v119;
  id v119 = 0;

  id v85 = v118;
  id v118 = 0;

  int v86 = [v7 credentials];
  id v87 = [v86 passPhrase];
  -[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:](self, "saveThreadConfiguration:passPhrase:", a5, [v87 UTF8String]);
  CtrXPC::Result::operator=(&v123, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }

  if (v123)
  {
    char v88 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance formNetworkWithCreds:credentialsRecord_t:output:](v88, v89, v90, v91, v92, v93, v94, v95);
    }

    [self->_CtrInternalClientPtr leave];
    if (v117 < 0) {
      operator delete(v116);
    }
    BOOL v72 = v123 == 13;
    goto LABEL_63;
  }
  [(ThreadNetworkManagerInstance *)self saveLastKnownJoinedNetwork:a3 datasetRecord:v7];
  char v98 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_INFO, "formNetworkWithCreds: Retrieve Third Party Info", buf, 2u);
  }

  [(ThreadNetworkManagerInstance *)self retrieveAndPostThirdPartyInfo];
  BOOL v72 = 0;
  int v73 = 0;
LABEL_64:
  if ((v73 & (!v72 | isNetworkConnected())) == 1)
  {
    BOOL IsGreaterThan = isSystemUpTimeIsGreaterThan(0x12CuLL);
    if (IsGreaterThan)
    {
      uint64_t RcpHostContext = RcpHostContext::GetRcpHostContext((RcpHostContext *)IsGreaterThan);
      std::string::basic_string[abi:ne180100]<0>(v114, "Error");
      std::string::basic_string[abi:ne180100]<0>(v112, "Form Failed");
      std::string::basic_string[abi:ne180100]<0>(v110, "Failed to form a specific network in RCP");
      RcpHostContext::captureABC(RcpHostContext, (uint64_t)v114, (uint64_t)v112, (uint64_t)v110, 0, 1);
      if (v111 < 0) {
        operator delete(v110[0]);
      }
      if (v113 < 0) {
        operator delete(v112[0]);
      }
      if (v115 < 0) {
        operator delete(v114[0]);
      }
    }
  }
  if (SHIBYTE(v124.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v124.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v132) < 0) {
    operator delete(v131[0]);
  }

  return v73;
}

- (int)attachWithAllCreds:(const char *)a3 credentialsRecord_t:(id)a4 output:(dict *)a5
{
  id v6 = a4;
  std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  unsigned int v48 = 3;
  std::string v49 = *(std::string *)buf;
  id v7 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int lastKnownNCPState = self->_lastKnownNCPState;
    *(_DWORD *)std::string buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = lastKnownNCPState;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "\"attachWithAllCreds\" Cmd received in state %d", buf, 8u);
  }

  BOOL v9 = [v6 credentials];
  unsigned __int16 v10 = (unsigned __int16)[v9 channel];

  int v11 = [v6 credentials];
  id v12 = [v11 PANID];
  unsigned int v13 = *(unsigned __int16 *)[v12 bytes];

  id v14 = [v6 network];
  id v15 = [v14 extendedPANID];
  unint64_t v16 = *(void *)[v15 bytes];

  id v17 = [v6 network];
  id v18 = [v17 networkName];
  id v19 = [v18 UTF8String];

  id v20 = [v6 credentials];
  id v21 = [v20 masterKey];
  long long v22 = (long long *)[v21 bytes];

  long long v57 = *v22;
  CAMetricsHandlers_joinattempt_start();
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  v50[0] = v19;
  v50[1] = "router";
  unsigned __int16 v51 = v10;
  __int16 v52 = bswap32(v13) >> 16;
  unint64_t v53 = bswap64(v16);
  long long v54 = v57;
  int v55 = 16843009;
  if (CtrInternalClientPtr) {
    [CtrInternalClientPtr join:v50];
  }
  else {
    memset(buf, 0, sizeof(buf));
  }
  CtrXPC::Result::operator=(&v48, (uint64_t)buf);
  if ((buf[31] & 0x80000000) != 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v48)
  {
    unint64_t v24 = log_get_logging_obg("com.apple.wpantund.tnm", "join");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      CtrXPC::Result::toString(v48, v46);
      int v35 = v47;
      uint64_t v36 = (void **)v46[0];
      std::string::basic_string(&v45, &v49);
      id v37 = v46;
      if (v35 < 0) {
        id v37 = v36;
      }
      if ((v45.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int v38 = &v45;
      }
      else {
        int v38 = (std::string *)v45.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance attachWithAllCreds:credentialsRecord_t:output:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v37;
      *(_WORD *)&unsigned char buf[22] = 2080;
      *(void *)&unsigned char buf[24] = v38;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s : TNM got the Failed Result for Join as = %s, Error Info: %s", buf, 0x20u);
      if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v45.__r_.__value_.__l.__data_);
      }
      if (v47 < 0) {
        operator delete(v46[0]);
      }
    }

    CAMetricsHandlers_joinattempt_status(0, 0);
    [self->_CtrInternalClientPtr leave];
    if (v42 < 0) {
      operator delete(__p);
    }
    sleep(2u);
    int v25 = 1;
  }
  else
  {
    int v26 = log_get_logging_obg("com.apple.wpantund.tnm", "join");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      CtrXPC::Result::toString(v48, v46);
      int v27 = v47;
      id v28 = (void **)v46[0];
      std::string::basic_string(&v45, &v49);
      id v29 = v46;
      if (v27 < 0) {
        id v29 = v28;
      }
      if ((v45.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        int v30 = &v45;
      }
      else {
        int v30 = (std::string *)v45.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)std::string buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance attachWithAllCreds:credentialsRecord_t:output:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v29;
      *(_WORD *)&unsigned char buf[22] = 2080;
      *(void *)&unsigned char buf[24] = v30;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s : TNM got the Success Result for Join as = %s, Error Info: %s", buf, 0x20u);
      if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v45.__r_.__value_.__l.__data_);
      }
      if (v47 < 0) {
        operator delete(v46[0]);
      }
    }

    xpc_object_t v31 = xpc_string_create(a3);
    id v43 = v31;
    if (!v31) {
      id v43 = xpc_null_create();
    }

    *(void *)std::string buf = a5;
    *(void *)&buf[8] = "outputUniqueNetworkId";
    xpc::dict::object_proxy::operator=((uint64_t)buf, &v43, &v44);
    id v32 = v44;
    id v44 = 0;

    id v33 = v43;
    id v43 = 0;

    CAMetricsHandlers_joinattempt_status(0, 1);
    int v25 = 0;
  }
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v49.__r_.__value_.__l.__data_);
  }

  return v25;
}

- (int)commissionOrFormNetwork:(dict)a3 is_attaching:(BOOL)a4 cfg_attach:(Ctr_attachToNetwork *)a5 output:(dict *)a6
{
  return 0;
}

- (BOOL)isNetworkSame:(Ctr_attachToNetwork *)a3 nwname:(void *)a4 xpan:(void *)a5
{
  BOOL v8 = +[NSMutableString stringWithCapacity:0];
  BOOL v9 = +[NSString stringWithFormat:@"%08llX", a3->var6];
  [v8 appendString:v9];

  std::string::basic_string[abi:ne180100]<0>(&__s1, a3->var0);
  id v10 = v8;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v10 UTF8String]);
  int v11 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    var0 = a3->var0;
    if (*((char *)a4 + 23) >= 0) {
      unsigned int v13 = (unsigned __int8 *)a4;
    }
    else {
      unsigned int v13 = *(unsigned __int8 **)a4;
    }
    if (*((char *)a5 + 23) >= 0) {
      id v14 = (unsigned __int8 *)a5;
    }
    else {
      id v14 = *(unsigned __int8 **)a5;
    }
    p_p = &__p;
    if ((v31 & 0x80u) != 0) {
      p_p = __p;
    }
    *(_DWORD *)std::string buf = 136315906;
    uint64_t v36 = v13;
    __int16 v37 = 2080;
    int v38 = var0;
    __int16 v39 = 2080;
    uint64_t v40 = v14;
    __int16 v41 = 2080;
    char v42 = p_p;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "  Network Name : %s, Network to attach : %s, XPAN : %s, XPAN to attach : %s", buf, 0x2Au);
  }

  if ((v34 & 0x80u) == 0) {
    size_t v16 = v34;
  }
  else {
    size_t v16 = __n;
  }
  uint64_t v17 = *((unsigned __int8 *)a4 + 23);
  int v18 = (char)v17;
  if ((v17 & 0x80u) != 0) {
    uint64_t v17 = *((void *)a4 + 1);
  }
  if (v16 != v17) {
    goto LABEL_45;
  }
  if (v18 >= 0) {
    id v19 = (unsigned __int8 *)a4;
  }
  else {
    id v19 = *(unsigned __int8 **)a4;
  }
  if ((v34 & 0x80) != 0)
  {
    if (memcmp(__s1, v19, __n)) {
      goto LABEL_45;
    }
  }
  else if (v34)
  {
    unint64_t v20 = 0;
    while (v20 <= 0x17)
    {
      if (*((unsigned __int8 *)&__s1 + v20) != v19[v20]) {
        goto LABEL_45;
      }
      if (v34 == ++v20) {
        goto LABEL_28;
      }
    }
LABEL_54:
    __break(1u);
  }
LABEL_28:
  if ((v31 & 0x80u) == 0) {
    size_t v21 = v31;
  }
  else {
    size_t v21 = v30;
  }
  uint64_t v22 = *((unsigned __int8 *)a5 + 23);
  int v23 = (char)v22;
  if ((v22 & 0x80u) != 0) {
    uint64_t v22 = *((void *)a5 + 1);
  }
  if (v21 != v22) {
    goto LABEL_45;
  }
  if (v23 >= 0) {
    unint64_t v24 = (unsigned __int8 *)a5;
  }
  else {
    unint64_t v24 = *(unsigned __int8 **)a5;
  }
  if ((v31 & 0x80) == 0)
  {
    if (v31)
    {
      unint64_t v25 = 0;
      while (v25 <= 0x17)
      {
        if (*((unsigned __int8 *)&__p + v25) != v24[v25]) {
          goto LABEL_45;
        }
        if (v31 == ++v25) {
          goto LABEL_51;
        }
      }
      goto LABEL_54;
    }
    goto LABEL_51;
  }
  if (memcmp(__p, v24, v30))
  {
LABEL_45:
    BOOL v26 = 0;
    goto LABEL_46;
  }
LABEL_51:
  id v28 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, " Networks are same ", buf, 2u);
  }

  BOOL v26 = 1;
LABEL_46:
  if ((char)v31 < 0) {
    operator delete(__p);
  }
  if ((char)v34 < 0) {
    operator delete(__s1);
  }

  return v26;
}

- (BOOL)areTwoNetworksSame:(id)a3 nwname:(id)a4 creds_xpan:(id)a5 xpan:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 isEqualToString:v10] && objc_msgSend(v11, "isEqualToData:", v12))
  {
    unsigned int v13 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      uint64_t v17 = "-[ThreadNetworkManagerInstance areTwoNetworksSame:nwname:creds_xpan:xpan:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, " %s : Networks are same ", (uint8_t *)&v16, 0xCu);
    }

    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)clearThreadCredentials
{
  id v3 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315138;
    BOOL v8 = "-[ThreadNetworkManagerInstance clearThreadCredentials]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Entered in %s", buf, 0xCu);
  }

  [self->_CtrInternalClientPtr leave];
  if (v6 < 0) {
    operator delete(__p);
  }
  return clearThreadConfiguration();
}

- (BOOL)isCurrentNetworkSameAsOneToStart:(id)a3
{
  id v4 = a3;
  long long v54 = 0;
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  __int16 v46 = 0;
  unint64_t v45 = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, "Commond is successful");
  int v43 = 0;
  std::string v44 = *(std::string *)__p;
  [(ThreadNetworkManagerInstance *)self getNCPNetworkInfo:v53];
  CtrXPC::Result::operator=(&v43, (uint64_t)__p);
  if (SBYTE1(v48) < 0) {
    operator delete(*(void **)&__p[8]);
  }
  if (v43)
  {
    id v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      std::string::basic_string((std::string *)__p, &v44);
      char v6 = __p[23] >= 0 ? __p : *(unsigned char **)__p;
      *(_DWORD *)std::string buf = 136315394;
      int v50 = "-[ThreadNetworkManagerInstance isCurrentNetworkSameAsOneToStart:]";
      __int16 v51 = 2080;
      __int16 v52 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: Failed to get the NCP Network Info : %s", buf, 0x16u);
      if ((__p[23] & 0x80000000) != 0) {
        operator delete(*(void **)__p);
      }
    }
    goto LABEL_28;
  }
  __int16 v46 = bswap32(v53[1]) >> 16;
  unint64_t v45 = bswap64(v58);
  id v7 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = [v4 network];
    id v9 = [v8 networkName];
    id v10 = +[NSString stringWithUTF8String:v57];
    *(_DWORD *)std::string __p = 136315906;
    *(void *)&__p[4] = "-[ThreadNetworkManagerInstance isCurrentNetworkSameAsOneToStart:]";
    *(_WORD *)&unsigned char __p[12] = 1024;
    *(_DWORD *)&__p[14] = 4645;
    *(_WORD *)&__p[18] = 2112;
    *(void *)&__p[20] = v9;
    *(_WORD *)&__p[28] = 2112;
    unsigned int v48 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s : %d : cnwname : %@, cfgnwname : %@", __p, 0x26u);
  }
  id v11 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [v4 network];
    unsigned int v13 = [v12 extendedPANID];
    BOOL v14 = +[NSData dataWithBytes:&v45 length:8];
    *(_DWORD *)std::string __p = 136315906;
    *(void *)&__p[4] = "-[ThreadNetworkManagerInstance isCurrentNetworkSameAsOneToStart:]";
    *(_WORD *)&unsigned char __p[12] = 1024;
    *(_DWORD *)&__p[14] = 4646;
    *(_WORD *)&__p[18] = 2112;
    *(void *)&__p[20] = v13;
    *(_WORD *)&__p[28] = 2112;
    unsigned int v48 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s : %d : cxpan : %@, cfgxpan : %@", __p, 0x26u);
  }
  id v15 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v16 = [v4 credentials];
    uint64_t v17 = [v16 masterKey];
    int v18 = +[NSData dataWithBytes:v59 length:16];
    *(_DWORD *)std::string __p = 136315906;
    *(void *)&__p[4] = "-[ThreadNetworkManagerInstance isCurrentNetworkSameAsOneToStart:]";
    *(_WORD *)&unsigned char __p[12] = 1024;
    *(_DWORD *)&__p[14] = 4647;
    *(_WORD *)&__p[18] = 2112;
    *(void *)&__p[20] = v17;
    *(_WORD *)&__p[28] = 2112;
    unsigned int v48 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s : %d : ckey : %@, cfgkey : %@", __p, 0x26u);
  }
  id v19 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    unint64_t v20 = [v4 credentials];
    size_t v21 = [v20 PANID];
    uint64_t v22 = +[NSData dataWithBytes:&v46 length:2];
    *(_DWORD *)std::string __p = 136315906;
    *(void *)&__p[4] = "-[ThreadNetworkManagerInstance isCurrentNetworkSameAsOneToStart:]";
    *(_WORD *)&unsigned char __p[12] = 1024;
    *(_DWORD *)&__p[14] = 4648;
    *(_WORD *)&__p[18] = 2112;
    *(void *)&__p[20] = v21;
    *(_WORD *)&__p[28] = 2112;
    unsigned int v48 = v22;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s : %d : cpan : %@, cfgpan : %@", __p, 0x26u);
  }
  int v23 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    unint64_t v24 = [v4 credentials];
    unsigned int v25 = [v24 channel];
    *(_DWORD *)std::string __p = 136315906;
    *(void *)&__p[4] = "-[ThreadNetworkManagerInstance isCurrentNetworkSameAsOneToStart:]";
    *(_WORD *)&unsigned char __p[12] = 1024;
    *(_DWORD *)&__p[14] = 4649;
    *(_WORD *)&__p[18] = 1024;
    *(_DWORD *)&__p[20] = v25;
    *(_WORD *)&__p[24] = 1024;
    *(_DWORD *)&__p[26] = v53[0];
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%s : %d : cchannel : %d, cfgchannel : %d", __p, 0x1Eu);
  }
  id v5 = [v4 network];
  BOOL v26 = [v5 networkName];
  int v27 = +[NSString stringWithUTF8String:v57];
  if (([v26 isEqualToString:v27] & 1) == 0)
  {

LABEL_28:
    BOOL v36 = 0;
LABEL_29:

    goto LABEL_30;
  }
  id v28 = [v4 network];
  id v29 = [v28 extendedPANID];
  size_t v30 = +[NSData dataWithBytes:&v45 length:8];
  if (![v29 isEqualToData:v30])
  {

    goto LABEL_28;
  }
  __int16 v41 = [v4 credentials];
  char v42 = [v41 masterKey];
  unsigned __int8 v31 = +[NSData dataWithBytes:v59 length:16];
  if (![v42 isEqualToData:v31])
  {

    goto LABEL_28;
  }
  int v38 = [v4 credentials];
  __int16 v39 = v28;
  uint64_t v40 = [v38 PANID];
  id v32 = +[NSData dataWithBytes:&v46 length:2];
  if ([v40 isEqualToData:v32])
  {
    id v33 = [v4 credentials];
    unsigned int v34 = [v33 channel];
    BOOL v35 = v53[0] == v34;
  }
  else
  {
    BOOL v35 = 0;
  }

  if (v35)
  {
    id v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    BOOL v36 = 1;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::string __p = 136315394;
      *(void *)&__p[4] = "-[ThreadNetworkManagerInstance isCurrentNetworkSameAsOneToStart:]";
      *(_WORD *)&unsigned char __p[12] = 1024;
      *(_DWORD *)&__p[14] = 4657;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s : %d : Returning true..", __p, 0x12u);
    }
    goto LABEL_29;
  }
  BOOL v36 = 0;
LABEL_30:
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v44.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v56) < 0) {
    operator delete(v54);
  }

  return v36;
}

- (BOOL)updatePreferredNetworkForDatasetChange
{
  uint64_t v44 = 0;
  unint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  char v47 = __Block_byref_object_copy__0;
  unsigned int v48 = __Block_byref_object_dispose__0;
  id v49 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__0;
  v42[4] = __Block_byref_object_dispose__0;
  id v43 = 0;
  if (self->_lastKnownJoinedNetworkRecord)
  {
    if (self->_keyChainStore)
    {
      id v4 = [(ThreadNetworkManagerInstance *)self getPreferredNetworkWithNoScan];
      if (!v4)
      {
        unsigned int v13 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[ThreadNetworkManagerInstance updatePreferredNetworkForDatasetChange]();
        }
        goto LABEL_17;
      }
      lastKnownJoinedNetworkRecord = self->_lastKnownJoinedNetworkRecord;
      if (lastKnownJoinedNetworkRecord)
      {
        char v6 = [(THThreadNetworkCredentialsActiveDataSetRecord *)lastKnownJoinedNetworkRecord credentialsDataSet];
        id v7 = [v6 dataSetArray];
        if ([v7 length])
        {
          __int16 v37 = [v4 credentialsDataSet];
          BOOL v8 = [v37 dataSetArray];
          if ([v8 length])
          {
            uint64_t v2 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self->_lastKnownJoinedNetworkRecord credentialsDataSet];
            id v9 = [(id)v2 dataSetArray];
            id v10 = [v4 credentialsDataSet];
            id v11 = [v10 dataSetArray];
            unsigned __int8 v12 = [v9 isEqualToData:v11];

            if ((v12 & 1) == 0)
            {
              unsigned int v13 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)std::string buf = 136315394;
                __int16 v51 = "-[ThreadNetworkManagerInstance updatePreferredNetworkForDatasetChange]";
                __int16 v52 = 1024;
                int v53 = 4691;
                _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, " %s:%d _lastKnownJoinedNetwork is not matching to the preferred network!", buf, 0x12u);
              }
LABEL_17:
              LOBYTE(v2) = 0;
LABEL_56:

              goto LABEL_57;
            }
            goto LABEL_20;
          }
        }
      }
LABEL_20:
      BOOL v14 = [(ThreadNetworkManagerInstance *)self getCurrentCredentialsDataSet];
      unsigned int v13 = v14;
      if (v14)
      {
        id v15 = [v14 dataSetArray];
        BOOL v16 = [v15 length] == 0;

        if (!v16)
        {
          uint64_t v17 = [v13 dataSetArray];
          if ([v17 length])
          {
            int v18 = [v4 credentialsDataSet];
            id v19 = [v18 dataSetArray];
            if ([v19 length])
            {
              uint64_t v2 = [v13 dataSetArray];
              unint64_t v20 = [v4 credentialsDataSet];
              size_t v21 = [v20 dataSetArray];
              unsigned int v22 = [(id)v2 isEqualToData:v21];

              if (v22)
              {
                int v23 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
                LOBYTE(v2) = 1;
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)std::string buf = 136315394;
                  __int16 v51 = "-[ThreadNetworkManagerInstance updatePreferredNetworkForDatasetChange]";
                  __int16 v52 = 1024;
                  int v53 = 4710;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, " %s:%d No need to update preferred network !", buf, 0x12u);
                }
                goto LABEL_55;
              }
LABEL_34:
              int v23 = [(ThreadNetworkManagerInstance *)self getCurrentBorderAgent];
              if (v23)
              {
                unint64_t v24 = [(ThreadNetworkManagerInstance *)self getCurrentNetworkNameAndXpanid];
                if (v24)
                {
                  char v25 = 1;
                  while (1)
                  {
                    char v26 = v25;
                    if (self->_lastKnownNCPState == 8)
                    {
                      int v27 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)std::string buf = 136315394;
                        __int16 v51 = "-[ThreadNetworkManagerInstance updatePreferredNetworkForDatasetChange]";
                        __int16 v52 = 1024;
                        int v53 = 4732;
                        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s:%d: Active DataSet change event - Updating keychain store\n", buf, 0x12u);
                      }

                      dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
                      keyChainStore = self->_keyChainStore;
                      v38[0] = _NSConcreteStackBlock;
                      v38[1] = 3221225472;
                      v38[2] = __70__ThreadNetworkManagerInstance_updatePreferredNetworkForDatasetChange__block_invoke;
                      v38[3] = &unk_10049C3D8;
                      __int16 v41 = v42;
                      uint64_t v40 = &v44;
                      v38[4] = self;
                      size_t v30 = v28;
                      __int16 v39 = v30;
                      [(THThreadNetworkCredentialsStoreLocalClient *)keyChainStore updatePreferredNetworkWithNewDataset:v23 network:v24 credentialsDataSet:v13 completion:v38];
                      dispatch_time_t v31 = dispatch_time(0, 150000000000);
                      if (dispatch_semaphore_wait(v30, v31))
                      {
                        id v32 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
                        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)std::string buf = 136315394;
                          __int16 v51 = "-[ThreadNetworkManagerInstance updatePreferredNetworkForDatasetChange]";
                          __int16 v52 = 1024;
                          int v53 = 4754;
                          _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s:%d:  Error, semaphore wait timed out ", buf, 0x12u);
                        }

                        BOOL v33 = 0;
                        LOBYTE(v2) = 0;
                      }
                      else
                      {
                        uint64_t v34 = v45[5];
                        BOOL v33 = v34 != 0;
                        LOBYTE(v2) = (v34 == 0) | v2;
                      }

                      if (!v33) {
                        goto LABEL_54;
                      }
                    }
                    char v25 = 0;
                    if ((v26 & 1) == 0)
                    {
                      LOBYTE(v2) = 0;
                      goto LABEL_54;
                    }
                  }
                }
                BOOL v35 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
                  -[ThreadNetworkManagerInstance updatePreferredNetworkForDatasetChange].cold.7();
                }
              }
              else
              {
                unint64_t v24 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                  -[ThreadNetworkManagerInstance updatePreferredNetworkForDatasetChange].cold.6();
                }
              }
              LOBYTE(v2) = 0;
LABEL_54:

              goto LABEL_55;
            }
          }
          goto LABEL_34;
        }
        int v23 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[ThreadNetworkManagerInstance updatePreferredNetworkForDatasetChange].cold.5();
        }
      }
      else
      {
        int v23 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[ThreadNetworkManagerInstance updatePreferredNetworkForDatasetChange].cold.4();
        }
      }
      LOBYTE(v2) = 0;
LABEL_55:

      goto LABEL_56;
    }
    id v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance updatePreferredNetworkForDatasetChange]();
    }
  }
  else
  {
    id v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance updatePreferredNetworkForDatasetChange]();
    }
  }
  LOBYTE(v2) = 0;
LABEL_57:

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(&v44, 8);

  return v2 & 1;
}

void __70__ThreadNetworkManagerInstance_updatePreferredNetworkForDatasetChange__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a4);
  if (v10)
  {
    id v11 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __70__ThreadNetworkManagerInstance_updatePreferredNetworkForDatasetChange__block_invoke_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    unsigned __int8 v12 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v16 = 136315650;
      uint64_t v17 = "-[ThreadNetworkManagerInstance updatePreferredNetworkForDatasetChange]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 4740;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s:%d: Got the Active DataSet unique Id : %@ on updating the preferred network", (uint8_t *)&v16, 0x1Cu);
    }

    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = v9;
    id v11 = *(NSObject **)(v14 + 192);
    *(void *)(v14 + 192) = v15;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (Result)saveThreadConfiguration:(Result *__return_ptr)retstr
{
  return (Result *)objc_msgSend(v1, "saveThreadConfiguration:passPhrase:");
}

- (id)getCurrentNetworkNameAndXpanid
{
  memset(&v28, 0, sizeof(v28));
  std::string::basic_string[abi:ne180100]<0>(__p, "Commond is successful");
  int v24 = 0;
  *(_OWORD *)char v25 = *(_OWORD *)__p;
  char v26 = __p[2];
  uint64_t v23 = 0;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v21, "Network:Name");
  if (CtrInternalClientPtr) {
    [CtrInternalClientPtr getProperty:v21 output:&v23];
  }
  else {
    memset(__p, 0, sizeof(__p));
  }
  int v4 = *CtrXPC::Result::operator=(&v24, (uint64_t)__p);
  if (SHIBYTE(__p[3]) < 0) {
    operator delete(__p[1]);
  }
  if (v22 < 0)
  {
    operator delete(v21[0]);
    if (v4) {
      goto LABEL_8;
    }
  }
  else if (v4)
  {
LABEL_8:
    id v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Failed to get the Network Name Property", (uint8_t *)__p, 2u);
    }

    id v6 = 0;
    goto LABEL_39;
  }
  any_to_string((const boost::any *)&v23, (uint64_t)__p);
  std::string::append[abi:ne180100](&v28, (const std::string::value_type *)__p);
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  if ((v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    id v7 = &v28;
  }
  else {
    id v7 = (std::string *)v28.__r_.__value_.__r.__words[0];
  }
  id v29 = v7;
  id v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LODWORD(__p[0]) = 136315394;
    *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance getCurrentNetworkNameAndXpanid]";
    WORD2(__p[1]) = 2080;
    *(void **)((char *)&__p[1] + 6) = v29;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s : cfg network name %s", (uint8_t *)__p, 0x16u);
  }

  uint64_t v20 = 0;
  id v9 = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v18, "Network:XPANID");
  if (v9) {
    [(CtrInternalClient *)v9 getProperty:v18 output:&v20];
  }
  else {
    memset(__p, 0, sizeof(__p));
  }
  int v10 = *CtrXPC::Result::operator=(&v24, (uint64_t)__p);
  if (SHIBYTE(__p[3]) < 0) {
    operator delete(__p[1]);
  }
  if (v19 < 0)
  {
    operator delete(v18[0]);
    if (v10) {
      goto LABEL_26;
    }
LABEL_30:
    size_t v30 = (void *)any_to_uint64((const boost::any *)&v20, 0);
    unsigned __int8 v12 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p[0]) = 136315394;
      *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance getCurrentNetworkNameAndXpanid]";
      WORD2(__p[1]) = 2048;
      *(void **)((char *)&__p[1] + 6) = v30;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s : xpaid from NCP : 0x%llX", (uint8_t *)__p, 0x16u);
    }

    id v11 = +[NSString stringWithUTF8String:v29];
    uint64_t v13 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p[0]) = 136315394;
      *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance getCurrentNetworkNameAndXpanid]";
      WORD2(__p[1]) = 2112;
      *(void **)((char *)&__p[1] + 6) = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s : Storing to keychain nw_name : %@", (uint8_t *)__p, 0x16u);
    }

    unint64_t v17 = bswap64((unint64_t)v30);
    uint64_t v14 = +[NSData dataWithBytes:&v17 length:8];
    id v15 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p[0]) = 136315394;
      *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance getCurrentNetworkNameAndXpanid]";
      WORD2(__p[1]) = 2112;
      *(void **)((char *)&__p[1] + 6) = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s : Storing to keychain xpaid : %@", (uint8_t *)__p, 0x16u);
    }

    id v6 = [objc_alloc((Class)THThreadNetwork) initWithName:v11 extendedPANID:v14];
    goto LABEL_37;
  }
  if (!v10) {
    goto LABEL_30;
  }
LABEL_26:
  id v11 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[ThreadNetworkManagerInstance getCurrentNetworkNameAndXpanid]();
  }
  id v6 = 0;
LABEL_37:

  if (v20) {
    (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
  }
LABEL_39:
  if (v23) {
    (*(void (**)(uint64_t))(*(void *)v23 + 8))(v23);
  }
  if (SHIBYTE(v26) < 0) {
    operator delete(v25[0]);
  }
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v28.__r_.__value_.__l.__data_);
  }

  return v6;
}

- (id)getCurrentNetworkCredentials
{
  id v3 = [(ThreadNetworkManagerInstance *)self getCurrentNetworkNameAndXpanid];
  if (!v3)
  {
    id v8 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(ThreadNetworkManagerInstance *)v8 getCurrentNetworkCredentials];
    }

    id v6 = 0;
    goto LABEL_9;
  }
  id v19 = 0;
  unsigned int v4 = [(ThreadNetworkManagerInstance *)self getMeCredentialsForThisNetwork:v3 credentialsRecord_t:&v19];
  id v5 = v19;
  id v6 = v5;
  if (v4)
  {
    id v7 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [v3 networkName];
      objc_claimAutoreleasedReturnValue();
      [v3 extendedPANID];
      objc_claimAutoreleasedReturnValue();
      -[ThreadNetworkManagerInstance getCurrentNetworkCredentials]();
    }

LABEL_9:
    int v16 = 0;
    goto LABEL_15;
  }
  if (!v5)
  {
    unint64_t v17 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      [v3 networkName];
      objc_claimAutoreleasedReturnValue();
      [v3 extendedPANID];
      objc_claimAutoreleasedReturnValue();
      -[ThreadNetworkManagerInstance getCurrentNetworkCredentials]();
    }
  }
  id v6 = v6;
  int v16 = v6;
LABEL_15:

  return v16;
}

- (id)getCurrentNetworkCredentialsActiveDataSetRecord
{
  uint64_t v47 = 0;
  unsigned int v48 = &v47;
  uint64_t v49 = 0x3032000000;
  int v50 = __Block_byref_object_copy__0;
  __int16 v51 = __Block_byref_object_dispose__0;
  id v52 = 0;
  uint64_t v41 = 0;
  char v42 = &v41;
  uint64_t v43 = 0x3032000000;
  uint64_t v44 = __Block_byref_object_copy__0;
  unint64_t v45 = __Block_byref_object_dispose__0;
  id v46 = 0;
  unsigned int v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    [(ThreadNetworkManagerInstance *)v4 getCurrentNetworkCredentialsActiveDataSetRecord];
  }

  uint64_t v12 = [(ThreadNetworkManagerInstance *)self getCurrentBorderAgent];
  if (!v12)
  {
    id v25 = 0;
    goto LABEL_18;
  }
  if (!self->_keyChainStore)
  {
    uint64_t v15 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      [(ThreadNetworkManagerInstance *)v15 getCurrentNetworkCredentialsActiveDataSetRecord];
    }
    id v25 = 0;
    goto LABEL_17;
  }
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  keyChainStore = self->_keyChainStore;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = __79__ThreadNetworkManagerInstance_getCurrentNetworkCredentialsActiveDataSetRecord__block_invoke;
  v37[3] = &unk_10049C388;
  __int16 v39 = &v47;
  uint64_t v40 = &v41;
  uint64_t v15 = v13;
  int v38 = v15;
  [(THThreadNetworkCredentialsStoreLocalClient *)keyChainStore retrieveActiveDataSetRecordWithTLVsForThreadBorderAgent:v12 completion:v37];
  dispatch_time_t v16 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v15, v16))
  {
    unint64_t v17 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      [(ThreadNetworkManagerInstance *)v17 getCurrentNetworkCredentialsActiveDataSetRecord];
    }
  }
  else
  {
    if (!v42[5])
    {
      id v25 = (id)v48[5];
      goto LABEL_16;
    }
    unint64_t v17 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v34 = [(id)v42[5] description];
      id v35 = [v34 UTF8String];
      if (v35)
      {
        id v2 = [(id)v42[5] description];
        BOOL v36 = (const char *)[v2 UTF8String];
      }
      else
      {
        BOOL v36 = "(unknown error)";
      }
      *(_DWORD *)std::string buf = 136315394;
      long long v54 = "-[ThreadNetworkManagerInstance getCurrentNetworkCredentialsActiveDataSetRecord]";
      __int16 v55 = 2080;
      uint64_t v56 = v36;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s : Error: failed to retrieve (%s)\n", buf, 0x16u);
      if (v35) {
    }
      }
  }

  id v25 = 0;
LABEL_16:

LABEL_17:
LABEL_18:

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  return v25;
}

void __79__ThreadNetworkManagerInstance_getCurrentNetworkCredentialsActiveDataSetRecord__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)upgradeCredentials
{
  id v3 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    uint64_t v7 = "-[ThreadNetworkManagerInstance upgradeCredentials]";
    __int16 v8 = 1024;
    int v9 = 4896;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s:%d: Upgrading Credentials", buf, 0x12u);
  }

  if (_os_feature_enabled_impl())
  {
    [(ThreadNetworkManagerInstance *)self updateKeychainWithThreadActiveDataSet];
    if (v5 < 0) {
      operator delete(__p);
    }
  }
}

- (Result)updateKeychainWithThreadActiveDataSet
{
  id v2 = v1;
  id v11 = xpc_null_create();
  std::string::basic_string[abi:ne180100]<0>(buf, "Commond is successful");
  retstr->var0 = 0;
  *(_OWORD *)retstr->var1.var0.var0.var0.var0.var0 = *(_OWORD *)buf;
  *((void *)&retstr->var1.var0.var0.var0.var1 + 2) = *(void *)&buf[16];
  unsigned int v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance updateKeychainWithThreadActiveDataSet]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 4906;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s:%d: Updating Credentials", buf, 0x12u);
  }

  id v10 = 0;
  [v2 saveThreadConfiguration:&v11 passPhrase:0 uuid:&v10];
  id v5 = v10;
  CtrXPC::Result::operator=(retstr, (uint64_t)buf);
  if (v13 < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (retstr->var0)
  {
    id v6 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance joinerAttach:output:]();
    }
  }
  else
  {
    uint64_t v7 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance updateKeychainWithThreadActiveDataSet]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 4913;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s:%d: Successfully formed new network", buf, 0x12u);
    }

    objc_msgSend(v2, "saveLastKnownJoinedNetwork:datasetRecord:", objc_msgSend(v5, "UTF8String"), 0);
  }
  id v8 = v11;
  id v11 = 0;

  return result;
}

- (id)getCurrentBorderAgent
{
  std::string::basic_string[abi:ne180100]<0>(__p, "Commond is successful");
  int v15 = 0;
  *(_OWORD *)dispatch_time_t v16 = *(_OWORD *)__p;
  unint64_t v17 = __p[2];
  uint64_t v14 = 0;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v12, "NCP:ExtendedAddress");
  if (CtrInternalClientPtr) {
    [CtrInternalClientPtr getProperty:v12 output:&v14];
  }
  else {
    memset(__p, 0, 32);
  }
  int v4 = *CtrXPC::Result::operator=(&v15, (uint64_t)__p);
  if (SHIBYTE(__p[3]) < 0) {
    operator delete(__p[1]);
  }
  if (v13 < 0)
  {
    operator delete(v12[0]);
    if (v4) {
      goto LABEL_8;
    }
  }
  else if (v4)
  {
LABEL_8:
    id v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance(SM_extension) nodeChangeToChildStatus:]();
    }

    id v6 = 0;
    goto LABEL_15;
  }
  uint64_t v7 = (void *)any_to_uint64((const boost::any *)&v14, 0);
  unint64_t v11 = bswap64((unint64_t)v7);
  id v8 = +[NSData dataWithBytes:&v11 length:8];
  int v9 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LODWORD(__p[0]) = 136315650;
    *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance getCurrentBorderAgent]";
    WORD2(__p[1]) = 2048;
    *(void **)((char *)&__p[1] + 6) = v7;
    HIWORD(__p[2]) = 2112;
    __p[3] = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s : Got Extended MAC Addess as: 0x%llx, %@", (uint8_t *)__p, 0x20u);
  }

  id v6 = [objc_alloc((Class)THThreadNetworkBorderAgent) initWithBaDiscrId:v8];
LABEL_15:
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  }
  if (SHIBYTE(v17) < 0) {
    operator delete(v16[0]);
  }

  return v6;
}

- (id)getCurrentCredentialsDataSet
{
  std::string::basic_string[abi:ne180100]<0>(__p, "Commond is successful");
  int v18 = 0;
  long long v19 = *(_OWORD *)__p;
  uint64_t v20 = v16;
  uint64_t v17 = 0;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v13, "Thread:ActiveDataset:Bytes");
  if (CtrInternalClientPtr)
  {
    [CtrInternalClientPtr getProperty:v13 output:&v17];
  }
  else
  {
    *(_OWORD *)std::string __p = 0u;
    long long v16 = 0u;
  }
  int v4 = *CtrXPC::Result::operator=(&v18, (uint64_t)__p);
  if (SHIBYTE(v16) < 0) {
    operator delete(__p[1]);
  }
  if (v14 < 0)
  {
    operator delete(v13[0]);
    if (v4)
    {
LABEL_8:
      id v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance getCurrentCredentialsDataSet]();
      }
      goto LABEL_20;
    }
  }
  else if (v4)
  {
    goto LABEL_8;
  }
  any_to_data((const boost::any *)&v17, __p);
  id v6 = __p[0];
  uint64_t v7 = __p[1];
  any_to_data((const boost::any *)&v17, v12);
  if (v6 == v7) {
    id v8 = 0;
  }
  else {
    id v8 = v6;
  }
  id v5 = +[NSData dataWithBytes:v8 length:(char *)v12[1] - (char *)v12[0]];
  uint64_t v21 = v12;
  std::vector<unsigned char>::__destroy_vector::operator()[abi:ne180100]((void ***)&v21);
  v12[0] = __p;
  std::vector<unsigned char>::__destroy_vector::operator()[abi:ne180100](v12);
  if (v5 && [v5 length])
  {
    id v9 = [objc_alloc((Class)THThreadNetworkCredentialsDataSet) initWithDataSetArray:v5 userInfo:0];
    goto LABEL_21;
  }
  id v10 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[ThreadNetworkManagerInstance getCurrentCredentialsDataSet]();
  }

LABEL_20:
  id v9 = 0;
LABEL_21:

  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
  }
  if (SHIBYTE(v20) < 0) {
    operator delete((void *)v19);
  }

  return v9;
}

- (Result)saveThreadConfigurationAOD:(Result *__return_ptr)retstr passPhrase:
{
  uint64_t v4 = v3;
  id v5 = v2;
  uint64_t v6 = v1;
  std::string::basic_string[abi:ne180100]<0>(&v111, "Commond is successful");
  int v99 = 0;
  __rep __p = v111;
  *(_OWORD *)&v111.var0.var1.var1 = 0uLL;
  uint64_t v112 = 0;
  uint64_t v93 = 0;
  uint64_t v94 = &v93;
  uint64_t v95 = 0x3032000000;
  char v96 = __Block_byref_object_copy__0;
  __int16 v97 = __Block_byref_object_dispose__0;
  id v98 = 0;
  [(id)v6 getNCPNetworkInfo:&v111];
  CtrXPC::Result::operator=(&v99, (uint64_t)v103);
  if ((v103[31] & 0x80000000) != 0) {
    operator delete(*(void **)&v103[8]);
  }
  if (v99)
  {
    id v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string((std::string *)v103, (const std::string *)&__p);
      -[ThreadNetworkManagerInstance saveThreadConfigurationAOD:passPhrase:]();
    }

LABEL_7:
    retstr->var0 = v99;
    retstr->var1.var0.var0 = __p;
    memset(&__p, 0, sizeof(__p));
    goto LABEL_75;
  }
  id v9 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int v103 = 136316931;
    *(void *)&v103[4] = "-[ThreadNetworkManagerInstance saveThreadConfigurationAOD:passPhrase:]";
    *(_WORD *)&v103[12] = 1024;
    *(_DWORD *)&v103[14] = WORD1(v111.var0.var1.var0);
    *(_WORD *)&v103[18] = 2048;
    *(void *)&v103[20] = v114;
    *(_WORD *)&v103[28] = 2080;
    *(void *)&v103[30] = v113;
    *(_WORD *)&v103[38] = 2085;
    char v104 = v115;
    __int16 v105 = 2085;
    __int16 v106 = v117;
    __int16 v107 = 1024;
    int v108 = *(unsigned __int16 *)v111.var0.var0.var0;
    __int16 v109 = 2080;
    uint64_t v110 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s : #mOS Saving TC  - PANID: %d, XPANID: %llu, NWName: %s, key: %{sensitive}s, PSKc: %{sensitive}s, ch = %d passPhrase : %s", v103, 0x4Au);
  }

  if (xpc::dict::operator BOOL(v5))
  {
    xpc_object_t v10 = xpc_int64_create(*(unsigned __int16 *)v111.var0.var0.var0);
    id v91 = v10;
    if (!v10)
    {
      id v91 = xpc_null_create();
    }
    *(void *)int v103 = v5;
    *(void *)&v103[8] = "channel";
    xpc::dict::object_proxy::operator=((uint64_t)v103, &v91, &v92);
    id v11 = v92;
    id v92 = 0;

    id v12 = v91;
    id v91 = 0;

    char v13 = xpc::object::operator*(v5);
    xpc_dictionary_set_uint64(v13, "panid", WORD1(v111.var0.var1.var0));

    xpc_object_t v14 = xpc_string_create(v113);
    id v89 = v14;
    if (!v14)
    {
      id v89 = xpc_null_create();
    }
    *(void *)int v103 = v5;
    *(void *)&v103[8] = "networkName";
    xpc::dict::object_proxy::operator=((uint64_t)v103, &v89, &v90);
    id v15 = v90;
    id v90 = 0;

    id v16 = v89;
    id v89 = 0;

    xpc_object_t v17 = xpc_uint64_create(v114);
    id v87 = v17;
    if (!v17)
    {
      id v87 = xpc_null_create();
    }
    *(void *)int v103 = v5;
    *(void *)&v103[8] = "xpanid";
    xpc::dict::object_proxy::operator=((uint64_t)v103, &v87, &v88);
    id v18 = v88;
    id v88 = 0;

    id v19 = v87;
    id v87 = 0;

    uint64_t v20 = xpc::object::operator*(v5);
    xpc_dictionary_set_data(v20, "masterKey", v115, 0x10uLL);

    xpc_object_t v21 = xpc_string_create(v117);
    id v85 = v21;
    if (!v21)
    {
      id v85 = xpc_null_create();
    }
    *(void *)int v103 = v5;
    *(void *)&v103[8] = "PSKc";
    xpc::dict::object_proxy::operator=((uint64_t)v103, &v85, &v86);
    id v22 = v86;
    id v86 = 0;

    id v23 = v85;
    id v85 = 0;

    uint64_t v24 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      xpc::dict::to_debug_string(v5, v103);
      id v25 = v103[23] >= 0 ? v103 : *(unsigned char **)v103;
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfigurationAOD:passPhrase:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s : output: %s", buf, 0x16u);
      if ((v103[23] & 0x80000000) != 0) {
        operator delete(*(void **)v103);
      }
    }
  }
  uint64_t v26 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int v103 = 136316931;
    *(void *)&v103[4] = "-[ThreadNetworkManagerInstance saveThreadConfigurationAOD:passPhrase:]";
    *(_WORD *)&v103[12] = 1024;
    *(_DWORD *)&v103[14] = WORD1(v111.var0.var1.var0);
    *(_WORD *)&v103[18] = 2048;
    *(void *)&v103[20] = v114;
    *(_WORD *)&v103[28] = 2080;
    *(void *)&v103[30] = v113;
    *(_WORD *)&v103[38] = 2085;
    char v104 = v115;
    __int16 v105 = 2085;
    __int16 v106 = v117;
    __int16 v107 = 1024;
    int v108 = *(unsigned __int16 *)v111.var0.var0.var0;
    __int16 v109 = 2080;
    uint64_t v110 = v4;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s : #mOS  Saving TC in commissionOrFormNetwork - PANID: %d, XPANID: %llu, NWName: %s, key: %{sensitive}s, PSKc: %{sensitive}s, ch = %d passPhrase : %s", v103, 0x4Au);
  }

  if (!*(void *)(v6 + 88))
  {
    uint64_t v56 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance saveThreadConfigurationAOD:passPhrase:](v56, v57, v58, v59, v60, v61, v62, v63);
    }

    goto LABEL_7;
  }
  uint64_t v27 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int v103 = 136315394;
    *(void *)&v103[4] = "-[ThreadNetworkManagerInstance saveThreadConfigurationAOD:passPhrase:]";
    *(_WORD *)&v103[12] = 2080;
    *(void *)&v103[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s : Storing to keychain now .... %s", v103, 0x16u);
  }

  *(void *)int v103 = 0;
  *(void *)&v103[8] = v103;
  *(void *)&v103[16] = 0x3032000000;
  *(void *)&v103[24] = __Block_byref_object_copy__0;
  *(void *)&v103[32] = __Block_byref_object_dispose__0;
  char v104 = 0;
  int v76 = +[NSString stringWithUTF8String:v113];
  uint64_t v28 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfigurationAOD:passPhrase:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v76;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s : Storing to keychain nw_name : %@", buf, 0x16u);
  }

  unint64_t v84 = bswap64(v114);
  uint64_t v29 = +[NSData dataWithBytes:&v84 length:8];
  uint64_t v30 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfigurationAOD:passPhrase:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v29;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%s : Storing to keychain xpaid : %@", buf, 0x16u);
  }

  id v71 = [objc_alloc((Class)THThreadNetwork) initWithName:v76 extendedPANID:v29];
  uint64_t v75 = +[NSData dataWithBytes:v115 length:16];
  uint64_t v31 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315395;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfigurationAOD:passPhrase:]";
    *(_WORD *)&buf[12] = 2117;
    *(void *)&buf[14] = v75;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%s : Storing to keychain master key %{sensitive}@", buf, 0x16u);
  }

  uint64_t v74 = +[NSData dataWithBytes:&v116 length:16];
  BOOL v72 = (void *)v29;
  uint64_t v32 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315395;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfigurationAOD:passPhrase:]";
    *(_WORD *)&buf[12] = 2117;
    *(void *)&buf[14] = v74;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%s : Storing to keychain pskc %{sensitive}@", buf, 0x16u);
  }

  int v33 = v111.var0.var0.var0[0];
  id v34 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfigurationAOD:passPhrase:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v33;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%s : Storing to keychain channel %d", buf, 0x12u);
  }

  id v35 = v72;
  __int16 v83 = bswap32(WORD1(v111.var0.var1.var0)) >> 16;
  int v73 = +[NSData dataWithBytes:&v83 length:2];
  BOOL v36 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfigurationAOD:passPhrase:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v73;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%s : Storing to keychain panid %@ ", buf, 0x16u);
  }

  __int16 v37 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    int v38 = *(unsigned __int8 *)(v6 + 10);
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfigurationAOD:passPhrase:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v38;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s : Storing to keychain wait for sync : %d", buf, 0x12u);
  }

  dispatch_semaphore_t v39 = dispatch_semaphore_create(0);
  uint64_t v40 = [(id)v6 getCurrentBorderAgent];
  if (v40)
  {
    uint64_t v41 = [(id)v6 getCurrentCredentialsDataSet];
    if (!v41)
    {
      retstr->var0 = 1;
      retstr->var1.var0.var0.var0.var1.var1 = 0;
      *((void *)&retstr->var1.var0.var0.var0.var1 + 2) = 0;
      retstr->var1.var0.var0.var0.var1.var0 = 0;
LABEL_73:

      goto LABEL_74;
    }
    char v42 = *(void **)(v6 + 88);
    uint64_t v43 = *(unsigned __int8 *)(v6 + 10);
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = __70__ThreadNetworkManagerInstance_saveThreadConfigurationAOD_passPhrase___block_invoke;
    v79[3] = &unk_10049C400;
    uint64_t v81 = v103;
    char v82 = &v93;
    uint64_t v44 = v39;
    char v80 = v44;
    [v42 storeThreadNetworkCredentialActiveDataSet:v40 network:v71 credentialsDataSet:v41 waitForSync:v43 completion:v79];
    id v35 = v72;
    unint64_t v45 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::string buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfigurationAOD:passPhrase:]";
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "%s :#mOS: Waiting for the store credentials keychain completion to finish...  ", buf, 0xCu);
    }

    dispatch_time_t v46 = dispatch_time(0, 150000000000);
    if (dispatch_semaphore_wait(v44, v46))
    {
      uint64_t v47 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance saveThreadConfigurationAOD:passPhrase:](v47, v48, v49, v50, v51, v52, v53, v54);
      }

      int v55 = 1;
    }
    else
    {
      if (!v94[5])
      {
        id v64 = [*(id *)(*(void *)&v103[8] + 40) UUIDString];
        if (xpc::dict::operator BOOL(v5))
        {
          xpc_object_t v65 = xpc_string_create((const char *)[v64 UTF8String]);
          id v77 = v65;
          if (!v65)
          {
            id v77 = xpc_null_create();
          }
          *(void *)std::string buf = v5;
          *(void *)&buf[8] = "outputUniqueNetworkId";
          xpc::dict::object_proxy::operator=((uint64_t)buf, &v77, &v78);
          id v66 = v78;
          id v78 = 0;

          id v67 = v77;
          id v77 = 0;
        }
        uint64_t v68 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          id v69 = [v64 UTF8String];
          *(_DWORD *)std::string buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfigurationAOD:passPhrase:]";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v69;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "%s : #mOS: uniqueNetworkId: %s", buf, 0x16u);
        }

        goto LABEL_72;
      }
      *(_DWORD *)std::string buf = 1;
      *(void *)&uint8_t buf[16] = 0;
      uint64_t v102 = 0;
      *(void *)&buf[8] = 0;
      CtrXPC::Result::operator=(&v99, (uint64_t)buf);
      if (SHIBYTE(v102) < 0) {
        operator delete(*(void **)&buf[8]);
      }
      if ([(id)v94[5] code] != (id)6)
      {
LABEL_72:
        retstr->var0 = v99;
        retstr->var1.var0.var0 = __p;
        memset(&__p, 0, sizeof(__p));

        goto LABEL_73;
      }
      int v55 = 13;
    }
    *(_DWORD *)std::string buf = v55;
    *(void *)&uint8_t buf[16] = 0;
    uint64_t v102 = 0;
    *(void *)&buf[8] = 0;
    CtrXPC::Result::operator=(&v99, (uint64_t)buf);
    if (SHIBYTE(v102) < 0) {
      operator delete(*(void **)&buf[8]);
    }
    goto LABEL_72;
  }
  retstr->var0 = 1;
  retstr->var1.var0.var0.var0.var1.var1 = 0;
  *((void *)&retstr->var1.var0.var0.var0.var1 + 2) = 0;
  retstr->var1.var0.var0.var0.var1.var0 = 0;
LABEL_74:

  _Block_object_dispose(v103, 8);
LABEL_75:
  _Block_object_dispose(&v93, 8);

  if (SHIBYTE(v112) < 0) {
    operator delete((void *)v111.var0.var1.var1);
  }
  if (*((char *)&__p.var0.var1 + 23) < 0) {
    operator delete(__p.var0.var1.var0);
  }
  return result;
}

void __70__ThreadNetworkManagerInstance_saveThreadConfigurationAOD_passPhrase___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __70__ThreadNetworkManagerInstance_saveThreadConfigurationAOD_passPhrase___block_invoke_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v13 = 138412290;
      uint64_t v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#mOS: Got the Active DataSet unique Id : %@", (uint8_t *)&v13, 0xCu);
    }
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v12 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (Result)saveThreadConfiguration:(Result *__return_ptr)retstr passPhrase:
{
  uint64_t v3 = 0;
  return (Result *)objc_msgSend(v1, "saveThreadConfiguration:passPhrase:uuid:");
}

- (Result)saveThreadConfiguration:(Result *__return_ptr)retstr passPhrase:uuid:
{
  id v91 = v4;
  uint64_t v5 = v3;
  id v6 = v2;
  uint64_t v7 = v1;
  std::string::basic_string[abi:ne180100]<0>(&v132, "Commond is successful");
  int v120 = 0;
  __rep __p = v132;
  *(_OWORD *)&v132.var0.var1.var1 = 0uLL;
  uint64_t v133 = 0;
  uint64_t v114 = 0;
  char v115 = &v114;
  uint64_t v116 = 0x3032000000;
  char v117 = __Block_byref_object_copy__0;
  id v118 = __Block_byref_object_dispose__0;
  id v119 = 0;
  [(id)v7 getNCPNetworkInfo:&v132];
  CtrXPC::Result::operator=(&v120, (uint64_t)v124);
  if ((v124[31] & 0x80000000) != 0) {
    operator delete(*(void **)&v124[8]);
  }
  if (v120)
  {
    uint64_t v9 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string((std::string *)v124, (const std::string *)&__p);
      -[ThreadNetworkManagerInstance saveThreadConfigurationAOD:passPhrase:]();
    }

    goto LABEL_7;
  }
  id v11 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string v124 = 136316931;
    *(void *)&v124[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
    *(_WORD *)&v124[12] = 1024;
    *(_DWORD *)&v124[14] = WORD1(v132.var0.var1.var0);
    *(_WORD *)&v124[18] = 2048;
    *(void *)&v124[20] = v135;
    *(_WORD *)&v124[28] = 2080;
    *(void *)&v124[30] = v134;
    *(_WORD *)&v124[38] = 2085;
    int v125 = v136;
    __int16 v126 = 2085;
    id v127 = v138;
    __int16 v128 = 1024;
    int v129 = *(unsigned __int16 *)v132.var0.var0.var0;
    __int16 v130 = 2080;
    uint64_t v131 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s : #mOS Saving TC  - PANID: %d, XPANID: %llu, NWName: %s, key: %{sensitive}s, PSKc: %{sensitive}s, ch = %d passPhrase : %s", v124, 0x4Au);
  }

  if (xpc::dict::operator BOOL(v6))
  {
    xpc_object_t v12 = xpc_int64_create(*(unsigned __int16 *)v132.var0.var0.var0);
    id v112 = v12;
    if (!v12)
    {
      id v112 = xpc_null_create();
    }
    *(void *)std::string v124 = v6;
    *(void *)&v124[8] = "channel";
    xpc::dict::object_proxy::operator=((uint64_t)v124, &v112, &v113);
    id v13 = v113;
    id v113 = 0;

    id v14 = v112;
    id v112 = 0;

    id v15 = xpc::object::operator*(v6);
    xpc_dictionary_set_uint64(v15, "panid", WORD1(v132.var0.var1.var0));

    xpc_object_t v16 = xpc_string_create(v134);
    id v110 = v16;
    if (!v16)
    {
      id v110 = xpc_null_create();
    }
    *(void *)std::string v124 = v6;
    *(void *)&v124[8] = "networkName";
    xpc::dict::object_proxy::operator=((uint64_t)v124, &v110, &v111);
    id v17 = v111;
    id v111 = 0;

    id v18 = v110;
    id v110 = 0;

    xpc_object_t v19 = xpc_uint64_create(v135);
    id v108 = v19;
    if (!v19)
    {
      id v108 = xpc_null_create();
    }
    *(void *)std::string v124 = v6;
    *(void *)&v124[8] = "xpanid";
    xpc::dict::object_proxy::operator=((uint64_t)v124, &v108, &v109);
    id v20 = v109;
    id v109 = 0;

    id v21 = v108;
    id v108 = 0;

    id v22 = xpc::object::operator*(v6);
    xpc_dictionary_set_data(v22, "masterKey", v136, 0x10uLL);

    xpc_object_t v23 = xpc_string_create(v138);
    id v106 = v23;
    if (!v23)
    {
      id v106 = xpc_null_create();
    }
    *(void *)std::string v124 = v6;
    *(void *)&v124[8] = "PSKc";
    xpc::dict::object_proxy::operator=((uint64_t)v124, &v106, &v107);
    id v24 = v107;
    id v107 = 0;

    id v25 = v106;
    id v106 = 0;

    uint64_t v26 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      xpc::dict::to_debug_string(v6, v124);
      uint64_t v27 = v124[23] >= 0 ? v124 : *(unsigned char **)v124;
      *(_DWORD *)std::string buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s : output: %s", buf, 0x16u);
      if ((v124[23] & 0x80000000) != 0) {
        operator delete(*(void **)v124);
      }
    }
  }
  uint64_t v28 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string v124 = 136316931;
    *(void *)&v124[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
    *(_WORD *)&v124[12] = 1024;
    *(_DWORD *)&v124[14] = WORD1(v132.var0.var1.var0);
    *(_WORD *)&v124[18] = 2048;
    *(void *)&v124[20] = v135;
    *(_WORD *)&v124[28] = 2080;
    *(void *)&v124[30] = v134;
    *(_WORD *)&v124[38] = 2085;
    int v125 = v136;
    __int16 v126 = 2085;
    id v127 = v138;
    __int16 v128 = 1024;
    int v129 = *(unsigned __int16 *)v132.var0.var0.var0;
    __int16 v130 = 2080;
    uint64_t v131 = v5;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s : #mOS  Saving TC in commissionOrFormNetwork - PANID: %d, XPANID: %llu, NWName: %s, key: %{sensitive}s, PSKc: %{sensitive}s, ch = %d passPhrase : %s", v124, 0x4Au);
  }

  if (!*(void *)(v7 + 88))
  {
    uint64_t v31 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:](v31, v39, v40, v41, v42, v43, v44, v45);
    }
    goto LABEL_42;
  }
  uint64_t v29 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string v124 = 136315394;
    *(void *)&v124[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
    *(_WORD *)&v124[12] = 2080;
    *(void *)&v124[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s : Storing to keychain now .... %s", v124, 0x16u);
  }

  if (v5)
  {
    id v90 = +[NSString stringWithUTF8String:v5];
    uint64_t v30 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::string v124 = 136315394;
      *(void *)&v124[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
      *(_WORD *)&v124[12] = 2080;
      *(void *)&v124[14] = v5;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%s : Storing to keychain passphrase %s", v124, 0x16u);
    }

    if (!v90)
    {
      uint64_t v31 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:](v31, v32, v33, v34, v35, v36, v37, v38);
      }
LABEL_42:

LABEL_7:
      retstr->var0 = v120;
      retstr->var1.var0.var0 = __p;
      memset(&__p, 0, sizeof(__p));
      goto LABEL_8;
    }
  }
  else
  {
    id v90 = 0;
  }
  *(void *)std::string v124 = 0;
  *(void *)&v124[8] = v124;
  *(void *)&v124[16] = 0x3032000000;
  *(void *)&v124[24] = __Block_byref_object_copy__0;
  *(void *)&v124[32] = __Block_byref_object_dispose__0;
  int v125 = 0;
  id v89 = +[NSString stringWithUTF8String:v134];
  dispatch_time_t v46 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v89;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "%s : Storing to keychain nw_name : %@", buf, 0x16u);
  }

  unint64_t v105 = bswap64(v135);
  id v88 = +[NSData dataWithBytes:&v105 length:8];
  uint64_t v47 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v88;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%s : Storing to keychain xpaid : %@", buf, 0x16u);
  }

  id v84 = [objc_alloc((Class)THThreadNetwork) initWithName:v89 extendedPANID:v88];
  id v87 = +[NSData dataWithBytes:v136 length:16];
  uint64_t v48 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315395;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
    *(_WORD *)&buf[12] = 2117;
    *(void *)&buf[14] = v87;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "%s : Storing to keychain master key %{sensitive}@", buf, 0x16u);
  }

  id v86 = +[NSData dataWithBytes:&v137 length:16];
  uint64_t v49 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315395;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
    *(_WORD *)&buf[12] = 2117;
    *(void *)&buf[14] = v86;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "%s : Storing to keychain pskc %{sensitive}@", buf, 0x16u);
  }

  uint64_t v50 = v132.var0.var0.var0[0];
  uint64_t v51 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v50;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "%s : Storing to keychain channel %d", buf, 0x12u);
  }

  __int16 v104 = bswap32(WORD1(v132.var0.var1.var0)) >> 16;
  id v85 = +[NSData dataWithBytes:&v104 length:2];
  uint64_t v52 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v85;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "%s : Storing to keychain panid %@ ", buf, 0x16u);
  }

  uint64_t v53 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    int v54 = *(unsigned __int8 *)(v7 + 10);
    *(_DWORD *)std::string buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v54;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "%s : Storing to keychain wait for sync : %d", buf, 0x12u);
  }

  int v55 = dispatch_semaphore_create(0);
  if (!_os_feature_enabled_impl())
  {
    id v59 = [objc_alloc((Class)THThreadNetworkCredentials) initWithMasterKey:v87 passPhrase:v90 PSKc:v86 channel:v50 PANID:v85 userInfo:0];
    if (v59)
    {
      uint64_t v60 = *(void **)(v7 + 88);
      uint64_t v61 = v55;
      uint64_t v62 = *(unsigned __int8 *)(v7 + 10);
      v94[0] = _NSConcreteStackBlock;
      v94[1] = 3221225472;
      v94[2] = __72__ThreadNetworkManagerInstance_saveThreadConfiguration_passPhrase_uuid___block_invoke_328;
      v94[3] = &unk_10049C400;
      char v96 = v124;
      __int16 v97 = &v114;
      uint64_t v63 = v61;
      uint64_t v95 = v61;
      [v60 storeCredentials:v59 waitForSync:v62 forNetwork:v84 completion:v94];
      uint64_t v57 = v95;
      int v55 = v63;
LABEL_68:

      id v64 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)std::string buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "%s :#mOS: Waiting for the store credentials keychain completion to finish...  ", buf, 0xCu);
      }

      dispatch_time_t v65 = dispatch_time(0, 150000000000);
      if (dispatch_semaphore_wait(v55, v65))
      {
        id v66 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
          -[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:](v66, v67, v68, v69, v70, v71, v72, v73);
        }

        int v74 = 1;
      }
      else
      {
        if (!v115[5])
        {
          id v75 = [*(id *)(*(void *)&v124[8] + 40) UUIDString];
          *id v91 = v75;
          if (xpc::dict::operator BOOL(v6))
          {
            xpc_object_t v76 = xpc_string_create((const char *)[v75 UTF8String]);
            id v92 = v76;
            if (!v76)
            {
              id v92 = xpc_null_create();
            }
            *(void *)std::string buf = v6;
            *(void *)&buf[8] = "outputUniqueNetworkId";
            xpc::dict::object_proxy::operator=((uint64_t)buf, &v92, &v93);
            id v77 = v93;
            id v93 = 0;

            id v78 = v92;
            id v92 = 0;
          }
          int v79 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
          if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
          {
            id v80 = [v75 UTF8String];
            *(_DWORD *)std::string buf = 136315394;
            *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = v80;
            _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_INFO, "%s : #mOS: uniqueNetworkId: %s", buf, 0x16u);
          }

          goto LABEL_91;
        }
        *(_DWORD *)std::string buf = 1;
        *(void *)&uint8_t buf[16] = 0;
        uint64_t v123 = 0;
        *(void *)&buf[8] = 0;
        CtrXPC::Result::operator=(&v120, (uint64_t)buf);
        if (SHIBYTE(v123) < 0) {
          operator delete(*(void **)&buf[8]);
        }
        if ([(id)v115[5] code] != (id)6)
        {
LABEL_91:
          retstr->var0 = v120;
          retstr->var1.var0.var0 = __p;
          memset(&__p, 0, sizeof(__p));
          goto LABEL_92;
        }
        int v74 = 13;
      }
      *(_DWORD *)std::string buf = v74;
      *(void *)&uint8_t buf[16] = 0;
      uint64_t v123 = 0;
      *(void *)&buf[8] = 0;
      CtrXPC::Result::operator=(&v120, (uint64_t)buf);
      if (SHIBYTE(v123) < 0) {
        operator delete(*(void **)&buf[8]);
      }
      goto LABEL_91;
    }
    goto LABEL_76;
  }
  uint64_t v56 = [(id)v7 getCurrentBorderAgent];
  if (!v56)
  {
LABEL_76:
    retstr->var0 = 1;
    retstr->var1.var0.var0.var0.var1.var1 = 0;
    *((void *)&retstr->var1.var0.var0.var0.var1 + 2) = 0;
    retstr->var1.var0.var0.var0.var1.var0 = 0;
    goto LABEL_92;
  }
  uint64_t v57 = [(id)v7 getCurrentCredentialsDataSet];
  if (v57)
  {
    LOBYTE(v81) = 1;
    id v58 = [objc_alloc((Class)THThreadNetworkCredentials) initWithMasterKey:v87 passPhrase:v90 PSKc:v86 channel:v50 PANID:v85 userInfo:0 credentialDataSet:v57 isActiveDevice:v81];
    if (v58)
    {
      char v82 = *(void **)(v7 + 88);
      unsigned int v83 = *(unsigned __int8 *)(v7 + 10);
      v98[0] = _NSConcreteStackBlock;
      v98[1] = 3221225472;
      v98[2] = __72__ThreadNetworkManagerInstance_saveThreadConfiguration_passPhrase_uuid___block_invoke;
      v98[3] = &unk_10049C428;
      uint64_t v102 = v124;
      v98[4] = v7;
      id v99 = v84;
      id v59 = v56;
      id v100 = v59;
      int v103 = &v114;
      unsigned int v101 = v55;
      [v82 storeThreadNetworkCredentialActiveDataSet:v59 network:v99 credentials:v58 credentialsDataSet:v57 waitForSync:v83 completion:v98];

      goto LABEL_68;
    }
    retstr->var0 = 1;
    retstr->var1.var0.var0.var0.var1.var1 = 0;
    *((void *)&retstr->var1.var0.var0.var0.var1 + 2) = 0;
    retstr->var1.var0.var0.var0.var1.var0 = 0;
  }
  else
  {
    retstr->var0 = 1;
    retstr->var1.var0.var0.var0.var1.var1 = 0;
    *((void *)&retstr->var1.var0.var0.var0.var1 + 2) = 0;
    retstr->var1.var0.var0.var0.var1.var0 = 0;
  }
LABEL_92:

  _Block_object_dispose(v124, 8);
LABEL_8:
  _Block_object_dispose(&v114, 8);

  if (SHIBYTE(v133) < 0) {
    operator delete((void *)v132.var0.var1.var1);
  }
  if (*((char *)&__p.var0.var1 + 23) < 0) {
    operator delete(__p.var0.var1.var0);
  }
  return result;
}

void __72__ThreadNetworkManagerInstance_saveThreadConfiguration_passPhrase_uuid___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v28 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __72__ThreadNetworkManagerInstance_saveThreadConfiguration_passPhrase_uuid___block_invoke_cold_1();
    }
    goto LABEL_16;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
  id v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(const char **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    *(_DWORD *)std::string buf = 138412290;
    uint64_t v32 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#mOS: Got the Active DataSet unique Id : %@", buf, 0xCu);
  }

  uint64_t v10 = [*(id *)(a1 + 32) getPreferredNetwork];
  uint64_t v7 = v10;
  if (!v10)
  {
LABEL_9:
    id v6 = 0;
    goto LABEL_16;
  }
  id v11 = [v10 network];
  xpc_object_t v12 = [v11 networkName];
  id v13 = [*(id *)(a1 + 40) networkName];
  if ([v12 isEqualToString:v13])
  {
    id v14 = [v7 network];
    id v15 = [v14 extendedPANID];
    xpc_object_t v16 = [*(id *)(a1 + 40) extendedPANID];
    unsigned __int8 v17 = [v15 isEqualToData:v16];

    if (v17) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v18 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    id v22 = [v7 network];
    xpc_object_t v23 = [v22 networkName];
    id v24 = [v7 network];
    id v25 = [v24 extendedPANID];
    uint64_t v26 = [*(id *)(a1 + 40) networkName];
    uint64_t v27 = [*(id *)(a1 + 40) extendedPANID];
    *(_DWORD *)std::string buf = 136316418;
    uint64_t v32 = "-[ThreadNetworkManagerInstance saveThreadConfiguration:passPhrase:uuid:]_block_invoke";
    __int16 v33 = 1024;
    int v34 = 5205;
    __int16 v35 = 2112;
    uint64_t v36 = v23;
    __int16 v37 = 2112;
    uint64_t v38 = v25;
    __int16 v39 = 2112;
    uint64_t v40 = v26;
    __int16 v41 = 2112;
    uint64_t v42 = v27;
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s:%d: Error, Preferred network exists (name : %@, xpanid : %@)  ! But newly created netowrk (name : %@, xpanid : %@) doesn't match with it, let's leave the network and delete this new network credentials..", buf, 0x3Au);
  }
  [*(id *)(*(void *)(a1 + 32) + 56) leave];
  if (v30 < 0) {
    operator delete(__p);
  }
  [*(id *)(a1 + 32) deleteCurrentNetwork:*(void *)(a1 + 48)];
  id v6 = +[NSError storeError:6 description:@"Thread network sync failure"];
LABEL_16:

  uint64_t v19 = *(void *)(*(void *)(a1 + 72) + 8);
  id v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v6;
  id v21 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void __72__ThreadNetworkManagerInstance_saveThreadConfiguration_passPhrase_uuid___block_invoke_328(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __72__ThreadNetworkManagerInstance_saveThreadConfiguration_passPhrase_uuid___block_invoke_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v13 = 138412290;
      uint64_t v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#mOS: Got the Active DataSet unique Id : %@", (uint8_t *)&v13, 0xCu);
    }
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v12 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (Result)getPskc:(Result *__return_ptr)retstr pskc_str:
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  std::string::basic_string[abi:ne180100]<0>(&buf, "Commond is successful");
  unsigned int v24 = 0;
  *(__n128 *)__p.var0.var0.var0 = buf;
  *((void *)&__p.var0.var1 + 2) = v30;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v20 = 0;
  id v6 = *(void **)(v4 + 56);
  id v7 = *(void **)(v3 + 8);
  v18[0] = *(void *)v3;
  id v8 = v7;
  v18[1] = v8;
  long long v19 = *(_OWORD *)(v3 + 16);
  if (v6)
  {
    [v6 generatePSKc:v18 output:&v20];
  }
  else
  {

    __n128 buf = 0u;
    long long v30 = 0u;
  }
  CtrXPC::Result::operator=(&v24, (uint64_t)&buf);
  if (SHIBYTE(v30) < 0) {
    operator delete((void *)buf.n128_u64[1]);
  }
  if (v24)
  {
    uint64_t v9 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      CtrXPC::Result::toString(v24, &buf);
      int v13 = SBYTE7(v30);
      unint64_t v14 = buf.n128_u64[0];
      std::string::basic_string(&v17, (const std::string *)&__p);
      p___n128 buf = &buf;
      if (v13 < 0) {
        p___n128 buf = (__n128 *)v14;
      }
      if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        xpc_object_t v16 = &v17;
      }
      else {
        xpc_object_t v16 = (std::string *)v17.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)uint64_t v26 = 136315394;
      *(void *)&void v26[4] = p_buf;
      __int16 v27 = 2080;
      id v28 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Result for generatePSKc = %s, Error Info: %s", v26, 0x16u);
      if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v17.__r_.__value_.__l.__data_);
      }
      if (SBYTE7(v30) < 0) {
        operator delete((void *)buf.n128_u64[0]);
      }
    }

    retstr->var0 = v24;
    retstr->var1.var0.var0 = __p;
    memset(&__p, 0, sizeof(__p));
  }
  else
  {
    any_to_data((const boost::any *)&v20, &buf);
    std::vector<unsigned char>::__move_assign((uint64_t)&v21, &buf);
    v17.__r_.__value_.__r.__words[0] = (std::string::size_type)&buf;
    std::vector<unsigned char>::__destroy_vector::operator()[abi:ne180100]((void ***)&v17);
    if (v21 != v22 && v21)
    {
      any_to_data((const boost::any *)&v20, &v17);
      if (v17.__r_.__value_.__r.__words[0] == v17.__r_.__value_.__l.__size_) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = (const void *)v17.__r_.__value_.__r.__words[0];
      }
      *(void *)&long long v30 = 0;
      __n128 buf = 0uLL;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(&buf, v10, (uint64_t)v10 + 16, 0x10uLL);
      std::vector<unsigned char>::__move_assign((uint64_t)&v21, &buf);
      *(void *)uint64_t v26 = &buf;
      std::vector<unsigned char>::__destroy_vector::operator()[abi:ne180100]((void ***)v26);
      *(void *)uint64_t v26 = &v17;
      std::vector<unsigned char>::__destroy_vector::operator()[abi:ne180100]((void ***)v26);
      boost::any::any<nl::Data &>();
    }
    id v12 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      buf.n128_u16[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Error : Pskc array is NULL", (uint8_t *)&buf, 2u);
    }

    std::string::basic_string[abi:ne180100]<0>(&buf, "pskc array is NULL");
    retstr->var0 = 3;
    *(__n128 *)retstr->var1.var0.var0.var0.var0.var0 = buf;
    *((void *)&retstr->var1.var0.var0.var0.var1 + 2) = v30;
  }
  if (v20) {
    (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
  }
  buf.n128_u64[0] = (unint64_t)&v21;
  std::vector<unsigned char>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  if (*((char *)&__p.var0.var1 + 23) < 0) {
    operator delete(__p.var0.var1.var0);
  }
  return result;
}

- (void)saveLastKnownJoinedNetwork:(const char *)a3 datasetRecord:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    objc_storeStrong((id *)&self->_lastKnownJoinedNetworkRecord, a4);
    id v8 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__n128 buf = 136315394;
      std::string v17 = "-[ThreadNetworkManagerInstance saveLastKnownJoinedNetwork:datasetRecord:]";
      __int16 v18 = 1024;
      int v19 = 5343;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:%d last known joined network record", buf, 0x12u);
    }

    tnmDumpRecord(self->_lastKnownJoinedNetworkRecord);
    goto LABEL_5;
  }
  if (!a3)
  {
LABEL_5:
    id v9 = 0;
    goto LABEL_6;
  }
  id v15 = 0;
  unsigned int v10 = [(ThreadNetworkManagerInstance *)self retrieveActiveDataSetRecordForUniqueId:a3 record:&v15];
  id v11 = v15;
  id v9 = v15;
  if (v10)
  {
    id v12 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance saveLastKnownJoinedNetwork:datasetRecord:]();
    }
  }
  else
  {
    p_lastKnownJoinedNetworkRecord = &self->_lastKnownJoinedNetworkRecord;
    objc_storeStrong((id *)&self->_lastKnownJoinedNetworkRecord, v11);
    unint64_t v14 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__n128 buf = 136315394;
      std::string v17 = "-[ThreadNetworkManagerInstance saveLastKnownJoinedNetwork:datasetRecord:]";
      __int16 v18 = 1024;
      int v19 = 5352;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s:%d last known joined network record read from uuid", buf, 0x12u);
    }

    tnmDumpRecord(*p_lastKnownJoinedNetworkRecord);
  }
LABEL_6:
}

- (int)formNewNetwork:(dict)a3
{
  std::string::basic_string[abi:ne180100]<0>(&v53, "Command Error");
  unsigned int v55 = 3;
  std::string v56 = v53;
  std::string::basic_string[abi:ne180100]<0>(buf, "Command is Successful");
  LODWORD(v53.__r_.__value_.__l.__data_) = 0;
  *(_OWORD *)&v53.__r_.__value_.__r.__words[1] = *(_OWORD *)buf;
  uint64_t v54 = *(void *)&buf[16];
  uint64_t v5 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int lastKnownNCPState = self->_lastKnownNCPState;
    *(_DWORD *)__n128 buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = lastKnownNCPState;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Form NW Cmd received in state %d", buf, 8u);
  }

  int deviceNode = self->_deviceNode;
  if (deviceNode == 1)
  {
    defaultChildNode = "router";
  }
  else if (deviceNode == 9)
  {
    defaultChildNode = self->_defaultChildNode;
  }
  else
  {
    defaultChildNode = "sleepy-router";
  }
  if (self->_lastKnownNCPState != 4)
  {
    [self->_CtrInternalClientPtr leave];
    if (v52 < 0) {
      operator delete(__p);
    }
    sleep(0);
  }
  char v9 = 1;
  if (!self->_createNetwork)
  {
    self->_createNetwork = 1;
    char v9 = 0;
  }
  unsigned int v10 = generatreNewPANIDAsInt();
  unint64_t NewXPANIDAsInt = generateNewXPANIDAsInt();
  generateNewMasterKeyAsByteArray();
  id v12 = objc_claimAutoreleasedReturnValue();
  long long v80 = *(_OWORD *)[v12 bytes];

  generatreNewNetworkName();
  id v13 = objc_claimAutoreleasedReturnValue();
  id v14 = [v13 cStringUsingEncoding:4];

  generateCommisonerCredentialAsString();
  id v15 = objc_claimAutoreleasedReturnValue();
  id v16 = [v15 cStringUsingEncoding:4];

  __int16 lastHostConfiguredChannel = self->_lastHostConfiguredChannel;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  id v61 = v14;
  char v62 = 1;
  __int16 v63 = lastHostConfiguredChannel;
  char v64 = 0;
  int v65 = 0;
  char v66 = 1;
  __int16 v67 = v10;
  char v68 = 1;
  unint64_t v69 = NewXPANIDAsInt;
  char v70 = 1;
  long long v71 = v80;
  char v72 = 0;
  int v73 = 0;
  char v74 = 0;
  id v75 = defaultChildNode;
  char v76 = 0;
  char v77 = 0;
  char v78 = v9;
  if (CtrInternalClientPtr) {
    [CtrInternalClientPtr form:&v61];
  }
  else {
    memset(buf, 0, sizeof(buf));
  }
  CtrXPC::Result::operator=(&v55, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v55)
  {
    int v19 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      CtrXPC::Result::toString(v55, buf);
      int v38 = (char)buf[23];
      __int16 v39 = *(uint8_t **)buf;
      std::string::basic_string(&v50, &v56);
      uint64_t v40 = buf;
      if (v38 < 0) {
        uint64_t v40 = v39;
      }
      if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        __int16 v41 = &v50;
      }
      else {
        __int16 v41 = (std::string *)v50.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)uint64_t v57 = 136315394;
      id v58 = v40;
      __int16 v59 = 2080;
      uint64_t v60 = v41;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Set Result for FORM = %s, Error Info: %s", v57, 0x16u);
      if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v50.__r_.__value_.__l.__data_);
      }
      if ((char)buf[23] < 0) {
        operator delete(*(void **)buf);
      }
    }

    BOOL v20 = 0;
LABEL_40:
    int v32 = 1;
    goto LABEL_41;
  }
  uint64_t v21 = log_get_logging_obg("com.apple.wpantund.tnm", "form");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    id var0 = a3.var0.var0;
    CtrXPC::Result::toString(v55, buf);
    int v23 = (char)buf[23];
    unsigned int v24 = *(uint8_t **)buf;
    std::string::basic_string(&v50, &v56);
    id v25 = buf;
    if (v23 < 0) {
      id v25 = v24;
    }
    if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v26 = &v50;
    }
    else {
      uint64_t v26 = (std::string *)v50.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)uint64_t v57 = 136315394;
    id v58 = v25;
    __int16 v59 = 2080;
    uint64_t v60 = v26;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Set Result for FORM = %s, Error Info: %s", v57, 0x16u);
    if (SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v50.__r_.__value_.__l.__data_);
    }
    a3.var0.id var0 = var0;
    if ((char)buf[23] < 0) {
      operator delete(*(void **)buf);
    }
  }

  __int16 v27 = +[NSMutableString stringWithCapacity:0];
  id v28 = +[NSString stringWithFormat:@"0x%04X", v10];
  [v27 appendString:v28];

  uint64_t v29 = +[NSMutableString stringWithCapacity:0];
  long long v30 = +[NSString stringWithFormat:@"%08llX", NewXPANIDAsInt];
  [v29 appendString:v30];

  sleep(2u);
  [(ThreadNetworkManagerInstance *)self saveThreadConfigurationAOD:a3.var0.var0 passPhrase:v16];
  CtrXPC::Result::operator=(&v53, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (LODWORD(v53.__r_.__value_.__l.__data_))
  {
    uint64_t v31 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance formNewNetwork:]();
    }

    [self->_CtrInternalClientPtr leave];
    if (v49 < 0) {
      operator delete(v48);
    }
    BOOL v20 = LODWORD(v53.__r_.__value_.__l.__data_) == 13;
    goto LABEL_40;
  }
  uint64_t v36 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__n128 buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance formNewNetwork:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 5477;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%s:%d: Successfully formed new network", buf, 0x12u);
  }

  -[ThreadNetworkManagerInstance saveLastKnownJoinedNetwork:datasetRecord:](self, "saveLastKnownJoinedNetwork:datasetRecord:", [0 UTF8String], 0);
  __int16 v37 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__n128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "formNewNetwork:Retrieve Third Party Info", buf, 2u);
  }

  [(ThreadNetworkManagerInstance *)self retrieveAndPostThirdPartyInfo];
  BOOL v20 = 0;
  int v32 = 0;
LABEL_41:
  if ((v32 & (!v20 | isNetworkConnected())) == 1)
  {
    BOOL IsGreaterThan = isSystemUpTimeIsGreaterThan(0x12CuLL);
    if (IsGreaterThan)
    {
      uint64_t RcpHostContext = RcpHostContext::GetRcpHostContext((RcpHostContext *)IsGreaterThan);
      std::string::basic_string[abi:ne180100]<0>(v46, "Error");
      std::string::basic_string[abi:ne180100]<0>(v44, "Form Failed");
      std::string::basic_string[abi:ne180100]<0>(v42, "Failed to form a new network in RCP");
      RcpHostContext::captureABC(RcpHostContext, (uint64_t)v46, (uint64_t)v44, (uint64_t)v42, 0, 1);
      if (v43 < 0) {
        operator delete(v42[0]);
      }
      if (v45 < 0) {
        operator delete(v44[0]);
      }
      if (v47 < 0) {
        operator delete(v46[0]);
      }
    }
  }
  if (SHIBYTE(v54) < 0) {
    operator delete((void *)v53.__r_.__value_.__l.__size_);
  }
  if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v56.__r_.__value_.__l.__data_);
  }
  return v32;
}

- (int)attachToNetwork:(dict)a3 output:(dict *)a4
{
  string = 0;
  id v83 = 0;
  __int16 v84 = 256;
  size_t length = 0;
  std::string::basic_string[abi:ne180100]<0>(&__p, "Command Error");
  unsigned int v48 = 3;
  std::string v49 = __p;
  std::string::basic_string[abi:ne180100]<0>(&buf, "Command is Successful");
  LODWORD(__p.__r_.__value_.__l.__data_) = 0;
  *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = buf;
  uint64_t v47 = v81;
  id v7 = log_get_logging_obg("com.apple.wpantund.tnm", "join");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int lastKnownNCPState = self->_lastKnownNCPState;
    LODWORD(buf) = 67109120;
    DWORD1(buf) = lastKnownNCPState;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Attach NW Cmd received in state %d", (uint8_t *)&buf, 8u);
  }

  char v9 = xpc::object::operator*((id *)a3.var0.var0);
  BOOL v10 = xpc_dictionary_get_BOOL(v9, "clearThreadCredentials");
  LOBYTE(v84) = v10;

  if (v10)
  {
    [(ThreadNetworkManagerInstance *)self clearThreadCredentials];
    sleep(1u);
    [(ThreadNetworkManagerInstance *)self getNCPState:0];
    id v11 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = self->_lastKnownNCPState;
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "\"AttachTNetwork\" New state is %d", (uint8_t *)&buf, 8u);
    }
  }
  if (self->_lastKnownNCPState != 4) {
    goto LABEL_32;
  }
  id v13 = xpc::object::operator*((id *)a3.var0.var0);
  BOOL v14 = xpc_dictionary_get_BOOL(v13, "hasNetworkKey");
  HIBYTE(v84) = v14;

  id v15 = xpc::object::operator*((id *)a3.var0.var0);
  id v16 = v15;
  if (!v14)
  {
    LOBYTE(v85) = xpc_dictionary_get_uint64(v15, "channel");
    __int16 v85 = v85;

    __int16 v27 = xpc::object::operator*((id *)a3.var0.var0);
    __int16 uint64 = xpc_dictionary_get_uint64(v27, "panid");

    id v28 = xpc::object::operator*((id *)a3.var0.var0);
    uint64_t v87 = xpc_dictionary_get_uint64(v28, "xpanid");

    uint64_t v29 = xpc::object::operator*((id *)a3.var0.var0);
    string = xpc_dictionary_get_string(v29, "network_name");

    xpc::dict::dict((xpc::dict *)&v45, (id *)a3.var0.var0);
    int v30 = [(ThreadNetworkManagerInstance *)self commissionOrFormNetwork:&v45 is_attaching:1 cfg_attach:&string output:a4];
    id v31 = v45;
    id v45 = 0;

    goto LABEL_33;
  }
  unsigned __int8 v17 = xpc_dictionary_get_uint64(v15, "channel");

  __int16 v18 = xpc::object::operator*((id *)a3.var0.var0);
  __int16 v19 = xpc_dictionary_get_uint64(v18, "panid");

  BOOL v20 = xpc::object::operator*((id *)a3.var0.var0);
  uint64_t v21 = xpc_dictionary_get_uint64(v20, "xpanid");

  uint64_t v22 = xpc::object::operator*((id *)a3.var0.var0);
  int v23 = xpc_dictionary_get_string(v22, "network_name");

  unsigned int v24 = xpc::object::operator*((id *)a3.var0.var0);
  data = (long long *)xpc_dictionary_get_data(v24, "network_key", &length);

  long long v88 = *data;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  v74[0] = v23;
  v74[1] = "router";
  __int16 v44 = v17;
  __int16 v75 = v17;
  __int16 v76 = v19;
  uint64_t v77 = v21;
  long long v78 = v88;
  int v79 = 16843009;
  if (CtrInternalClientPtr)
  {
    [CtrInternalClientPtr join:v74];
  }
  else
  {
    long long buf = 0u;
    long long v81 = 0u;
  }
  CtrXPC::Result::operator=(&v48, (uint64_t)&buf);
  if (SHIBYTE(v81) < 0) {
    operator delete(*((void **)&buf + 1));
  }
  int v32 = log_get_logging_obg("com.apple.wpantund.tnm", "join");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    __int16 v33 = v23;
    uint64_t v34 = v21;
    __int16 v35 = a4;
    CtrXPC::Result::toString(v48, &buf);
    int v36 = SBYTE7(v81);
    __int16 v37 = (long long *)buf;
    std::string::basic_string(&v69, &v49);
    p_long long buf = &buf;
    if (v36 < 0) {
      p_long long buf = v37;
    }
    if ((v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      __int16 v39 = &v69;
    }
    else {
      __int16 v39 = (std::string *)v69.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)char v70 = 136315394;
    long long v71 = p_buf;
    __int16 v72 = 2080;
    int v73 = v39;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "TNM got the Result for Join as = %s, Error Info: %s", v70, 0x16u);
    if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v69.__r_.__value_.__l.__data_);
    }
    a4 = v35;
    uint64_t v21 = v34;
    if (SBYTE7(v81) < 0) {
      operator delete((void *)buf);
    }
    int v23 = v33;
  }

  if (!v48) {
    goto LABEL_42;
  }
  [(ThreadNetworkManagerInstance *)self clearThreadCredentials];
  sleep(1u);
  [(ThreadNetworkManagerInstance *)self getNCPState:0];
  uint64_t v40 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
    -[ThreadNetworkManagerInstance attachToNetwork:output:](&self->_lastKnownNCPState, v40);
  }

  if (self->_lastKnownNCPState != 4)
  {
LABEL_32:
    int v30 = 4;
    goto LABEL_33;
  }
  *(_OWORD *)&v69.__r_.__value_.__l.__data_ = *data;
  __int16 v41 = self->_CtrInternalClientPtr;
  uint64_t v51 = v23;
  char v52 = 1;
  __int16 v53 = v44;
  char v54 = 0;
  int v55 = 0;
  char v56 = 1;
  __int16 v57 = v19;
  char v58 = 1;
  uint64_t v59 = v21;
  char v60 = 1;
  long long v61 = *(_OWORD *)&v69.__r_.__value_.__l.__data_;
  char v62 = 0;
  int v63 = 0;
  char v64 = 0;
  int v65 = "router";
  char v66 = 0;
  char v67 = 0;
  char v68 = 1;
  if (v41)
  {
    [(CtrInternalClient *)v41 form:&v51];
  }
  else
  {
    long long buf = 0u;
    long long v81 = 0u;
  }
  CtrXPC::Result::operator=(&v48, (uint64_t)&buf);
  if (SHIBYTE(v81) < 0) {
    operator delete(*((void **)&buf + 1));
  }
  if (v48) {
    goto LABEL_48;
  }
LABEL_42:
  [(ThreadNetworkManagerInstance *)self saveThreadConfiguration:a4];
  CtrXPC::Result::operator=(&__p, (uint64_t)&buf);
  if (SHIBYTE(v81) < 0) {
    operator delete(*((void **)&buf + 1));
  }
  if (LODWORD(__p.__r_.__value_.__l.__data_))
  {
    char v43 = log_get_logging_obg("com.apple.wpantund.tnm", "join");
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance joinerAttach:output:]();
    }

    [(ThreadNetworkManagerInstance *)self clearThreadCredentials];
LABEL_48:
    int v30 = 1;
    goto LABEL_33;
  }
  int v30 = 0;
LABEL_33:
  if (SHIBYTE(v47) < 0) {
    operator delete((void *)__p.__r_.__value_.__l.__size_);
  }
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v49.__r_.__value_.__l.__data_);
  }

  return v30;
}

- (int)setChannelUsingChannelManger:(dict)a3
{
  uint64_t v4 = xpc::object::operator*((id *)a3.var0.var0);
  string = xpc_dictionary_get_string(v4, "property_value");

  id v6 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int lastKnownNCPState = self->_lastKnownNCPState;
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)__int16 v37 = lastKnownNCPState;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SetChannel Cmd received in state %d", buf, 8u);
  }

  [(ThreadNetworkManagerInstance *)self getNCPChannel];
  int lastUpdatedNCPChannel = self->_lastUpdatedNCPChannel;
  if (atoi(string) == lastUpdatedNCPChannel)
  {
    char v9 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = self->_lastUpdatedNCPChannel;
      *(_DWORD *)long long buf = 136315394;
      *(void *)__int16 v37 = string;
      *(_WORD *)&v37[8] = 1024;
      *(_DWORD *)&v37[10] = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "SetChannel Cmd received: Channel rcvd(%s) is same the one configred in NCP(%d)", buf, 0x12u);
    }

    return 0;
  }
  else
  {
    int lastKnownNodeType = self->_lastKnownNodeType;
    if (lastKnownNodeType == 1 || lastKnownNodeType == 7)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "Command Error");
      *(_DWORD *)long long buf = 3;
      *(_OWORD *)&void v37[4] = *(_OWORD *)__p;
      int v38 = __p[2];
      CtrInternalClientPtr = self->_CtrInternalClientPtr;
      std::string::basic_string[abi:ne180100]<0>(v33, "ChannelManager:Delay");
      if (CtrInternalClientPtr) {
        [CtrInternalClientPtr setProperty:v33 property_val:"120"];
      }
      else {
        memset(__p, 0, sizeof(__p));
      }
      CtrXPC::Result::operator=(buf, (uint64_t)__p);
      if (SHIBYTE(__p[3]) < 0) {
        operator delete(__p[1]);
      }
      if (v34 < 0) {
        operator delete(v33[0]);
      }
      id v15 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        CtrXPC::Result::toString(*(unsigned int *)buf, v31);
        int v16 = SHIBYTE(v32);
        unsigned __int8 v17 = (void **)v31[0];
        std::string::basic_string(&v30, (const std::string *)&v37[4]);
        __int16 v18 = v31;
        if (v16 < 0) {
          __int16 v18 = v17;
        }
        if ((v30.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          __int16 v19 = &v30;
        }
        else {
          __int16 v19 = (std::string *)v30.__r_.__value_.__r.__words[0];
        }
        LODWORD(__p[0]) = 136315650;
        *(void **)((char *)__p + 4) = "ChannelManager:Delay";
        WORD2(__p[1]) = 2080;
        *(void **)((char *)&__p[1] + 6) = v18;
        HIWORD(__p[2]) = 2080;
        __p[3] = v19;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Get Result for set %s, %s, Error Info: %s", (uint8_t *)__p, 0x20u);
        if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v30.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v32) < 0) {
          operator delete(v31[0]);
        }
      }

      if (*(_DWORD *)buf) {
        goto LABEL_52;
      }
      std::string::basic_string[abi:ne180100]<0>(v31, "Command Error");
      LODWORD(__p[0]) = 3;
      *(_OWORD *)&__p[1] = *(_OWORD *)v31;
      __p[3] = v32;
      v31[0] = 0;
      v31[1] = 0;
      int v32 = 0;
      CtrXPC::Result::operator=(buf, (uint64_t)__p);
      if (SHIBYTE(__p[3]) < 0) {
        operator delete(__p[1]);
      }
      if (SHIBYTE(v32) < 0) {
        operator delete(v31[0]);
      }
      BOOL v20 = self->_CtrInternalClientPtr;
      std::string::basic_string[abi:ne180100]<0>(v28, "ChannelManager:NewChannel");
      if (v20) {
        [(CtrInternalClient *)v20 setProperty:v28 property_val:string];
      }
      else {
        memset(__p, 0, sizeof(__p));
      }
      CtrXPC::Result::operator=(buf, (uint64_t)__p);
      if (SHIBYTE(__p[3]) < 0) {
        operator delete(__p[1]);
      }
      if (v29 < 0) {
        operator delete(v28[0]);
      }
      uint64_t v21 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        CtrXPC::Result::toString(*(unsigned int *)buf, v31);
        int v22 = SHIBYTE(v32);
        int v23 = (void **)v31[0];
        std::string::basic_string(&v30, (const std::string *)&v37[4]);
        unsigned int v24 = v31;
        if (v22 < 0) {
          unsigned int v24 = v23;
        }
        if ((v30.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          id v25 = &v30;
        }
        else {
          id v25 = (std::string *)v30.__r_.__value_.__r.__words[0];
        }
        LODWORD(__p[0]) = 136315650;
        *(void **)((char *)__p + 4) = "ChannelManager:NewChannel";
        WORD2(__p[1]) = 2080;
        *(void **)((char *)&__p[1] + 6) = v24;
        HIWORD(__p[2]) = 2080;
        __p[3] = v25;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Get Result for set %s, %s, Error Info: %s", (uint8_t *)__p, 0x20u);
        if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v30.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v32) < 0) {
          operator delete(v31[0]);
        }
      }

      if (*(_DWORD *)buf)
      {
LABEL_52:
        int v11 = 1;
      }
      else
      {
        self->___int16 lastHostConfiguredChannel = atoi(string);
        int v27 = atoi(string);
        saveIntValue("lastHostConfiguredChannel", v27);
        int v11 = 0;
      }
      if (SHIBYTE(v38) < 0) {
        operator delete(*(void **)&v37[4]);
      }
    }
    else
    {
      BOOL v14 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance setChannelUsingChannelManger:]();
      }

      return 1;
    }
  }
  return v11;
}

- (int)setLogTimestampBase
{
}

- (int)setChannel:(dict)a3
{
  uint64_t v4 = xpc::object::operator*((id *)a3.var0.var0);
  string = xpc_dictionary_get_string(v4, "property_value");

  id v6 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int lastKnownNCPState = self->_lastKnownNCPState;
    LODWORD(buf[0]) = 67109120;
    HIDWORD(buf[0]) = lastKnownNCPState;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SetChannel Cmd received in state %d", (uint8_t *)buf, 8u);
  }

  [(ThreadNetworkManagerInstance *)self getNCPChannel];
  int lastUpdatedNCPChannel = self->_lastUpdatedNCPChannel;
  if (atoi(string) != lastUpdatedNCPChannel)
  {
    int v12 = self->_lastKnownNCPState;
    if (v12 == 4)
    {
      std::string::basic_string[abi:ne180100]<0>(v179, "Command Error");
      LODWORD(buf[0]) = 3;
      *(_OWORD *)&buf[1] = *(_OWORD *)v179;
      buf[3] = v179[2];
      CtrInternalClientPtr = self->_CtrInternalClientPtr;
      std::string::basic_string[abi:ne180100]<0>(v173, "NCP:Channel");
      if (CtrInternalClientPtr) {
        [CtrInternalClientPtr setProperty:v173 property_val:string];
      }
      else {
        memset(v179, 0, 32);
      }
      CtrXPC::Result::operator=(buf, (uint64_t)v179);
      if (SHIBYTE(v179[3]) < 0) {
        operator delete((void *)v179[1]);
      }
      if (v174 < 0) {
        operator delete(v173[0]);
      }
      if (LODWORD(buf[0]))
      {
        int v27 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          CtrXPC::Result::toString(buf[0], &v178);
          int v68 = SHIBYTE(v178.__r_.__value_.__r.__words[2]);
          std::string::size_type v69 = v178.__r_.__value_.__r.__words[0];
          std::string::basic_string(&v172, (const std::string *)&buf[1]);
          char v70 = &v178;
          if (v68 < 0) {
            char v70 = (std::string *)v69;
          }
          if ((v172.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            long long v71 = &v172;
          }
          else {
            long long v71 = (std::string *)v172.__r_.__value_.__r.__words[0];
          }
          LODWORD(v179[0]) = 136315650;
          *(void *)((char *)v179 + 4) = "NCP:Channel";
          WORD2(v179[1]) = 2080;
          *(void *)((char *)&v179[1] + 6) = v70;
          HIWORD(v179[2]) = 2080;
          v179[3] = v71;
          _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Get Result for set %s, %s, Error Info: %s", (uint8_t *)v179, 0x20u);
          if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v172.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v178.__r_.__value_.__l.__data_);
          }
        }

        int v11 = 1;
      }
      else
      {
        id v28 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          CtrXPC::Result::toString(buf[0], &v178);
          int v29 = SHIBYTE(v178.__r_.__value_.__r.__words[2]);
          std::string::size_type v30 = v178.__r_.__value_.__r.__words[0];
          std::string::basic_string(&v172, (const std::string *)&buf[1]);
          id v31 = &v178;
          if (v29 < 0) {
            id v31 = (std::string *)v30;
          }
          if ((v172.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            int v32 = &v172;
          }
          else {
            int v32 = (std::string *)v172.__r_.__value_.__r.__words[0];
          }
          LODWORD(v179[0]) = 136315650;
          *(void *)((char *)v179 + 4) = "NCP:Channel";
          WORD2(v179[1]) = 2080;
          *(void *)((char *)&v179[1] + 6) = v31;
          HIWORD(v179[2]) = 2080;
          v179[3] = v32;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Get Result for set %s, %s, Error Info: %s", (uint8_t *)v179, 0x20u);
          if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v172.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v178.__r_.__value_.__l.__data_);
          }
        }

        self->___int16 lastHostConfiguredChannel = atoi(string);
        int v33 = atoi(string);
        saveIntValue("lastHostConfiguredChannel", v33);
        int v11 = 0;
      }
      if (SHIBYTE(buf[3]) < 0) {
        operator delete((void *)buf[1]);
      }
      goto LABEL_80;
    }
    if (v12 != 5 && v12 != 8)
    {
      __int16 v18 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v53 = self->_lastUpdatedNCPChannel;
        int v54 = self->_lastKnownNCPState;
        LODWORD(buf[0]) = 136315650;
        *(void *)((char *)buf + 4) = string;
        WORD2(buf[1]) = 1024;
        *(_DWORD *)((char *)&buf[1] + 6) = v53;
        WORD1(buf[2]) = 1024;
        HIDWORD(buf[2]) = v54;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "SetChannel Cmd received: Channel rcvd(%s), NCP channel is : (%d) in state in appropriate : %d, returning error.", (uint8_t *)buf, 0x18u);
      }

      int v11 = 1;
      goto LABEL_80;
    }
    xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v14 = v13;
    if (!v13) {
      xpc_object_t v14 = xpc_null_create();
    }

    id v15 = v14;
    int v16 = v15;
    id v171 = v15;
    if (v15)
    {
      if (xpc_get_type(v15) != (xpc_type_t)&_xpc_type_dictionary)
      {
        id v171 = xpc_null_create();
      }
    }
    else
    {
      id v171 = xpc_null_create();
    }

    std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
    LODWORD(v179[0]) = 3;
    *(_OWORD *)&v179[1] = *(_OWORD *)buf;
    v179[3] = buf[2];
    __int16 v19 = self->_CtrInternalClientPtr;
    std::string::basic_string[abi:ne180100]<0>(__p, "Dataset:Command");
    if (v19) {
      [(CtrInternalClient *)v19 setProperty:__p property_val:"Erase"];
    }
    else {
      memset(buf, 0, sizeof(buf));
    }
    CtrXPC::Result::operator=(v179, (uint64_t)buf);
    if (SHIBYTE(buf[3]) < 0) {
      operator delete((void *)buf[1]);
    }
    if (v170 < 0) {
      operator delete(__p[0]);
    }
    if (LODWORD(v179[0]))
    {
      BOOL v20 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        CtrXPC::Result::toString(v179[0], &v178);
        int v49 = SHIBYTE(v178.__r_.__value_.__r.__words[2]);
        std::string::size_type v50 = v178.__r_.__value_.__r.__words[0];
        std::string::basic_string(&v172, (const std::string *)&v179[1]);
        uint64_t v51 = &v178;
        if (v49 < 0) {
          uint64_t v51 = (std::string *)v50;
        }
        if ((v172.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          char v52 = &v172;
        }
        else {
          char v52 = (std::string *)v172.__r_.__value_.__r.__words[0];
        }
        LODWORD(buf[0]) = 136315906;
        *(void *)((char *)buf + 4) = "Dataset:Command";
        WORD2(buf[1]) = 2080;
        *(void *)((char *)&buf[1] + 6) = "Erase";
        HIWORD(buf[2]) = 2080;
        buf[3] = v51;
        __int16 v176 = 2080;
        v177 = v52;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Set Result for %s --> %s, %s, Error Info: %s", (uint8_t *)buf, 0x2Au);
        if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v172.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v178.__r_.__value_.__l.__data_);
        }
      }

LABEL_76:
      int v11 = 1;
LABEL_77:
      if (SHIBYTE(v179[3]) < 0) {
        operator delete((void *)v179[1]);
      }

      goto LABEL_80;
    }
    uint64_t v21 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      CtrXPC::Result::toString(v179[0], &v178);
      int v22 = SHIBYTE(v178.__r_.__value_.__r.__words[2]);
      std::string::size_type v23 = v178.__r_.__value_.__r.__words[0];
      std::string::basic_string(&v172, (const std::string *)&v179[1]);
      unsigned int v24 = &v178;
      if (v22 < 0) {
        unsigned int v24 = (std::string *)v23;
      }
      if ((v172.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        id v25 = &v172;
      }
      else {
        id v25 = (std::string *)v172.__r_.__value_.__r.__words[0];
      }
      LODWORD(buf[0]) = 136315906;
      *(void *)((char *)buf + 4) = "Dataset:Command";
      WORD2(buf[1]) = 2080;
      *(void *)((char *)&buf[1] + 6) = "Erase";
      HIWORD(buf[2]) = 2080;
      buf[3] = v24;
      __int16 v176 = 2080;
      v177 = v25;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Set Result for %s --> %s, %s, Error Info: %s", (uint8_t *)buf, 0x2Au);
      if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v172.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v178.__r_.__value_.__l.__data_);
      }
    }

    std::string::basic_string[abi:ne180100]<0>(&v178, "Command Error");
    LODWORD(buf[0]) = 3;
    *(std::string *)&buf[1] = v178;
    memset(&v178, 0, sizeof(v178));
    CtrXPC::Result::operator=(v179, (uint64_t)buf);
    if (SHIBYTE(buf[3]) < 0) {
      operator delete((void *)buf[1]);
    }
    if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v178.__r_.__value_.__l.__data_);
    }
    uint64_t v26 = self->_CtrInternalClientPtr;
    std::string::basic_string[abi:ne180100]<0>(v167, "Dataset:Command");
    if (v26) {
      [(CtrInternalClient *)v26 setProperty:v167 property_val:"GetActive"];
    }
    else {
      memset(buf, 0, sizeof(buf));
    }
    CtrXPC::Result::operator=(v179, (uint64_t)buf);
    if (SHIBYTE(buf[3]) < 0) {
      operator delete((void *)buf[1]);
    }
    if (v168 < 0) {
      operator delete(v167[0]);
    }
    if (LODWORD(v179[0]))
    {
      char v34 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        CtrXPC::Result::toString(v179[0], &v178);
        int v72 = SHIBYTE(v178.__r_.__value_.__r.__words[2]);
        std::string::size_type v73 = v178.__r_.__value_.__r.__words[0];
        std::string::basic_string(&v172, (const std::string *)&v179[1]);
        char v74 = &v178;
        if (v72 < 0) {
          char v74 = (std::string *)v73;
        }
        if ((v172.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          __int16 v75 = &v172;
        }
        else {
          __int16 v75 = (std::string *)v172.__r_.__value_.__r.__words[0];
        }
        LODWORD(buf[0]) = 136315906;
        *(void *)((char *)buf + 4) = "Dataset:Command";
        WORD2(buf[1]) = 2080;
        *(void *)((char *)&buf[1] + 6) = "GetActive";
        HIWORD(buf[2]) = 2080;
        buf[3] = v74;
        __int16 v176 = 2080;
        v177 = v75;
        _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Set Result for %s --> %s, %s, Error Info: %s", (uint8_t *)buf, 0x2Au);
        if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v172.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v178.__r_.__value_.__l.__data_);
        }
      }

      goto LABEL_76;
    }
    int v36 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      CtrXPC::Result::toString(v179[0], &v178);
      int v37 = SHIBYTE(v178.__r_.__value_.__r.__words[2]);
      std::string::size_type v38 = v178.__r_.__value_.__r.__words[0];
      std::string::basic_string(&v172, (const std::string *)&v179[1]);
      __int16 v39 = &v178;
      if (v37 < 0) {
        __int16 v39 = (std::string *)v38;
      }
      if ((v172.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v40 = &v172;
      }
      else {
        uint64_t v40 = (std::string *)v172.__r_.__value_.__r.__words[0];
      }
      LODWORD(buf[0]) = 136315906;
      *(void *)((char *)buf + 4) = "Dataset:Command";
      WORD2(buf[1]) = 2080;
      *(void *)((char *)&buf[1] + 6) = "GetActive";
      HIWORD(buf[2]) = 2080;
      buf[3] = v39;
      __int16 v176 = 2080;
      v177 = v40;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Set Result for %s --> %s, %s, Error Info: %s", (uint8_t *)buf, 0x2Au);
      if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v172.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v178.__r_.__value_.__l.__data_);
      }
    }

    uint64_t v166 = 0;
    __int16 v41 = self->_CtrInternalClientPtr;
    std::string::basic_string[abi:ne180100]<0>(v164, "Dataset");
    if (v41) {
      [(CtrInternalClient *)v41 getProperty:v164 output:&v166];
    }
    else {
      memset(buf, 0, sizeof(buf));
    }
    CtrXPC::Result::operator=(v179, (uint64_t)buf);
    if (SHIBYTE(buf[3]) < 0) {
      operator delete((void *)buf[1]);
    }
    if (v165 < 0) {
      operator delete(v164[0]);
    }
    if (LODWORD(v179[0]))
    {
      uint64_t v42 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        CtrXPC::Result::toString(v179[0], &v178);
        int v89 = SHIBYTE(v178.__r_.__value_.__r.__words[2]);
        std::string::size_type v90 = v178.__r_.__value_.__r.__words[0];
        std::string::basic_string(&v172, (const std::string *)&v179[1]);
        id v91 = &v178;
        if (v89 < 0) {
          id v91 = (std::string *)v90;
        }
        if ((v172.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          id v92 = &v172;
        }
        else {
          id v92 = (std::string *)v172.__r_.__value_.__r.__words[0];
        }
        LODWORD(buf[0]) = 136315650;
        *(void *)((char *)buf + 4) = "Dataset";
        WORD2(buf[1]) = 2080;
        *(void *)((char *)&buf[1] + 6) = v91;
        HIWORD(buf[2]) = 2080;
        buf[3] = v92;
        _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Get Result for get %s, %s, Error Info: %s", (uint8_t *)buf, 0x20u);
        if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v172.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v178.__r_.__value_.__l.__data_);
        }
      }

      int v11 = 1;
LABEL_339:
      if (v166) {
        (*(void (**)(uint64_t))(*(void *)v166 + 8))(v166);
      }
      goto LABEL_77;
    }
    char v43 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      CtrXPC::Result::toString(v179[0], &v178);
      int v44 = SHIBYTE(v178.__r_.__value_.__r.__words[2]);
      std::string::size_type v45 = v178.__r_.__value_.__r.__words[0];
      std::string::basic_string(&v172, (const std::string *)&v179[1]);
      dispatch_time_t v46 = &v178;
      if (v44 < 0) {
        dispatch_time_t v46 = (std::string *)v45;
      }
      if ((v172.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v47 = &v172;
      }
      else {
        uint64_t v47 = (std::string *)v172.__r_.__value_.__r.__words[0];
      }
      LODWORD(buf[0]) = 136315650;
      *(void *)((char *)buf + 4) = "Dataset";
      WORD2(buf[1]) = 2080;
      *(void *)((char *)&buf[1] + 6) = v46;
      HIWORD(buf[2]) = 2080;
      buf[3] = v47;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Get Result for get %s, %s, Error Info: %s", (uint8_t *)buf, 0x20u);
      if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v172.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v178.__r_.__value_.__l.__data_);
      }
    }

    std::string::basic_string[abi:ne180100]<0>(&v178, "Command Error");
    LODWORD(buf[0]) = 3;
    *(std::string *)&buf[1] = v178;
    memset(&v178, 0, sizeof(v178));
    CtrXPC::Result::operator=(v179, (uint64_t)buf);
    if (SHIBYTE(buf[3]) < 0) {
      operator delete((void *)buf[1]);
    }
    if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v178.__r_.__value_.__l.__data_);
    }
    uint64_t v163 = 0;
    unsigned int v48 = self->_CtrInternalClientPtr;
    std::string::basic_string[abi:ne180100]<0>(v161, "Dataset:ActiveTimestamp");
    if (v48) {
      [(CtrInternalClient *)v48 getProperty:v161 output:&v163];
    }
    else {
      memset(buf, 0, sizeof(buf));
    }
    CtrXPC::Result::operator=(v179, (uint64_t)buf);
    if (SHIBYTE(buf[3]) < 0) {
      operator delete((void *)buf[1]);
    }
    if (v162 < 0) {
      operator delete(v161[0]);
    }
    int v55 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      CtrXPC::Result::toString(v179[0], &v178);
      int v56 = SHIBYTE(v178.__r_.__value_.__r.__words[2]);
      std::string::size_type v57 = v178.__r_.__value_.__r.__words[0];
      std::string::basic_string(&v172, (const std::string *)&v179[1]);
      char v58 = &v178;
      if (v56 < 0) {
        char v58 = (std::string *)v57;
      }
      if ((v172.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v59 = &v172;
      }
      else {
        uint64_t v59 = (std::string *)v172.__r_.__value_.__r.__words[0];
      }
      LODWORD(buf[0]) = 136315650;
      *(void *)((char *)buf + 4) = "Dataset:ActiveTimestamp";
      WORD2(buf[1]) = 2080;
      *(void *)((char *)&buf[1] + 6) = v58;
      HIWORD(buf[2]) = 2080;
      buf[3] = v59;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Get Result for get %s, %s, Error Info: %s", (uint8_t *)buf, 0x20u);
      if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v172.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v178.__r_.__value_.__l.__data_);
      }
    }

    char v60 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      any_to_string((const boost::any *)&v163, (uint64_t)buf);
      long long v61 = buf[2] >= 0 ? buf : (void *)buf[0];
      LODWORD(v178.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)v178.__r_.__value_.__r.__words + 4) = (std::string::size_type)v61;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "PTS => %s", (uint8_t *)&v178, 0xCu);
      if (SHIBYTE(buf[2]) < 0) {
        operator delete((void *)buf[0]);
      }
    }

    unint64_t v62 = any_to_uint64((const boost::any *)&v163, 0);
    if (LODWORD(v179[0]))
    {
      int v63 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        CtrXPC::Result::toString(v179[0], &v178);
        int v101 = SHIBYTE(v178.__r_.__value_.__r.__words[2]);
        std::string::size_type v102 = v178.__r_.__value_.__r.__words[0];
        std::string::basic_string(&v172, (const std::string *)&v179[1]);
        int v103 = &v178;
        if (v101 < 0) {
          int v103 = (std::string *)v102;
        }
        if ((v172.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          __int16 v104 = &v172;
        }
        else {
          __int16 v104 = (std::string *)v172.__r_.__value_.__r.__words[0];
        }
        LODWORD(buf[0]) = 136315650;
        *(void *)((char *)buf + 4) = "Dataset:ActiveTimestamp";
        WORD2(buf[1]) = 2080;
        *(void *)((char *)&buf[1] + 6) = v103;
        HIWORD(buf[2]) = 2080;
        buf[3] = v104;
        _os_log_error_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "Get Result for get %s, %s, Error Info: %s", (uint8_t *)buf, 0x20u);
        if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v172.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v178.__r_.__value_.__l.__data_);
        }
      }

      int v11 = 1;
LABEL_337:
      if (v163) {
        (*(void (**)(uint64_t))(*(void *)v163 + 8))(v163);
      }
      goto LABEL_339;
    }
    unint64_t v64 = v62;
    int v65 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf[0]) = 134217984;
      *(void *)((char *)buf + 4) = v64;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "Got PTS value of 0x%llx", (uint8_t *)buf, 0xCu);
    }

    unint64_t v35 = v64 + 0x10000;
    if (v64 >= 0xFFFFFFFFFFFF0000)
    {
      __break(0x5500u);
      return v35;
    }
    std::to_string(&v178, v35);
    std::string::basic_string[abi:ne180100]<0>(&v172, "Command Error");
    LODWORD(buf[0]) = 3;
    *(std::string *)&buf[1] = v172;
    memset(&v172, 0, sizeof(v172));
    CtrXPC::Result::operator=(v179, (uint64_t)buf);
    if (SHIBYTE(buf[3]) < 0) {
      operator delete((void *)buf[1]);
    }
    if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v172.__r_.__value_.__l.__data_);
    }
    char v66 = self->_CtrInternalClientPtr;
    std::string::basic_string[abi:ne180100]<0>(v159, "Dataset:PendingTimestamp");
    if (v66)
    {
      if ((v178.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        char v67 = &v178;
      }
      else {
        char v67 = (std::string *)v178.__r_.__value_.__r.__words[0];
      }
      [(CtrInternalClient *)v66 setProperty:v159 property_val:v67];
    }
    else
    {
      memset(buf, 0, sizeof(buf));
    }
    CtrXPC::Result::operator=(v179, (uint64_t)buf);
    if (SHIBYTE(buf[3]) < 0) {
      operator delete((void *)buf[1]);
    }
    if (v160 < 0) {
      operator delete(v159[0]);
    }
    if (LODWORD(v179[0]))
    {
      __int16 v76 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
      {
        CtrXPC::Result::toString(v179[0], &v172);
        int v77 = SHIBYTE(v172.__r_.__value_.__r.__words[2]);
        std::string::size_type v78 = v172.__r_.__value_.__r.__words[0];
        std::string::basic_string(&v158, (const std::string *)&v179[1]);
        int v79 = &v172;
        if (v77 < 0) {
          int v79 = (std::string *)v78;
        }
        if ((v158.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          long long v80 = &v158;
        }
        else {
          long long v80 = (std::string *)v158.__r_.__value_.__r.__words[0];
        }
LABEL_192:
        LODWORD(buf[0]) = 136315650;
        *(void *)((char *)buf + 4) = "Dataset:ActiveTimestamp";
        WORD2(buf[1]) = 2080;
        *(void *)((char *)&buf[1] + 6) = v79;
        HIWORD(buf[2]) = 2080;
        buf[3] = v80;
        long long v81 = "Get Result for set %s, %s, Error Info: %s";
LABEL_329:
        int v129 = v76;
        uint32_t v130 = 32;
LABEL_330:
        _os_log_error_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_ERROR, v81, (uint8_t *)buf, v130);
        if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v158.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v172.__r_.__value_.__l.__data_);
        }
      }
    }
    else
    {
      char v82 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
      {
        CtrXPC::Result::toString(v179[0], &v172);
        int v83 = SHIBYTE(v172.__r_.__value_.__r.__words[2]);
        std::string::size_type v84 = v172.__r_.__value_.__r.__words[0];
        std::string::basic_string(&v158, (const std::string *)&v179[1]);
        __int16 v85 = &v172;
        if (v83 < 0) {
          __int16 v85 = (std::string *)v84;
        }
        if ((v158.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          id v86 = &v158;
        }
        else {
          id v86 = (std::string *)v158.__r_.__value_.__r.__words[0];
        }
        LODWORD(buf[0]) = 136315650;
        *(void *)((char *)buf + 4) = "Dataset:ActiveTimestamp";
        WORD2(buf[1]) = 2080;
        *(void *)((char *)&buf[1] + 6) = v85;
        HIWORD(buf[2]) = 2080;
        buf[3] = v86;
        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "Get Result for set %s, %s, Error Info: %s", (uint8_t *)buf, 0x20u);
        if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v158.__r_.__value_.__l.__data_);
        }
        if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v172.__r_.__value_.__l.__data_);
        }
      }

      std::string::basic_string[abi:ne180100]<0>(&v172, "Command Error");
      LODWORD(buf[0]) = 3;
      *(std::string *)&buf[1] = v172;
      memset(&v172, 0, sizeof(v172));
      CtrXPC::Result::operator=(v179, (uint64_t)buf);
      if (SHIBYTE(buf[3]) < 0) {
        operator delete((void *)buf[1]);
      }
      if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v172.__r_.__value_.__l.__data_);
      }
      uint64_t v87 = self->_CtrInternalClientPtr;
      std::string::basic_string[abi:ne180100]<0>(v156, "Dataset:ActiveTimestamp");
      if (v87)
      {
        if ((v178.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          long long v88 = &v178;
        }
        else {
          long long v88 = (std::string *)v178.__r_.__value_.__r.__words[0];
        }
        [(CtrInternalClient *)v87 setProperty:v156 property_val:v88];
      }
      else
      {
        memset(buf, 0, sizeof(buf));
      }
      CtrXPC::Result::operator=(v179, (uint64_t)buf);
      if (SHIBYTE(buf[3]) < 0) {
        operator delete((void *)buf[1]);
      }
      if (v157 < 0) {
        operator delete(v156[0]);
      }
      if (LODWORD(v179[0]))
      {
        __int16 v76 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          CtrXPC::Result::toString(v179[0], &v172);
          int v93 = SHIBYTE(v172.__r_.__value_.__r.__words[2]);
          std::string::size_type v94 = v172.__r_.__value_.__r.__words[0];
          std::string::basic_string(&v158, (const std::string *)&v179[1]);
          int v79 = &v172;
          if (v93 < 0) {
            int v79 = (std::string *)v94;
          }
          if ((v158.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            long long v80 = &v158;
          }
          else {
            long long v80 = (std::string *)v158.__r_.__value_.__r.__words[0];
          }
          goto LABEL_192;
        }
      }
      else
      {
        uint64_t v95 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
        if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
        {
          CtrXPC::Result::toString(v179[0], &v172);
          int v96 = SHIBYTE(v172.__r_.__value_.__r.__words[2]);
          std::string::size_type v97 = v172.__r_.__value_.__r.__words[0];
          std::string::basic_string(&v158, (const std::string *)&v179[1]);
          id v98 = &v172;
          if (v96 < 0) {
            id v98 = (std::string *)v97;
          }
          if ((v158.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            id v99 = &v158;
          }
          else {
            id v99 = (std::string *)v158.__r_.__value_.__r.__words[0];
          }
          LODWORD(buf[0]) = 136315650;
          *(void *)((char *)buf + 4) = "Dataset:ActiveTimestamp";
          WORD2(buf[1]) = 2080;
          *(void *)((char *)&buf[1] + 6) = v98;
          HIWORD(buf[2]) = 2080;
          buf[3] = v99;
          _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_INFO, "Get Result for set %s, %s, Error Info: %s", (uint8_t *)buf, 0x20u);
          if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v158.__r_.__value_.__l.__data_);
          }
          if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v172.__r_.__value_.__l.__data_);
          }
        }

        std::string::basic_string[abi:ne180100]<0>(&v172, "Command Error");
        LODWORD(buf[0]) = 3;
        *(std::string *)&buf[1] = v172;
        memset(&v172, 0, sizeof(v172));
        CtrXPC::Result::operator=(v179, (uint64_t)buf);
        if (SHIBYTE(buf[3]) < 0) {
          operator delete((void *)buf[1]);
        }
        if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v172.__r_.__value_.__l.__data_);
        }
        id v100 = self->_CtrInternalClientPtr;
        std::string::basic_string[abi:ne180100]<0>(v154, "Dataset:Channel");
        if (v100) {
          [(CtrInternalClient *)v100 setProperty:v154 property_val:string];
        }
        else {
          memset(buf, 0, sizeof(buf));
        }
        CtrXPC::Result::operator=(v179, (uint64_t)buf);
        if (SHIBYTE(buf[3]) < 0) {
          operator delete((void *)buf[1]);
        }
        if (v155 < 0) {
          operator delete(v154[0]);
        }
        if (LODWORD(v179[0]))
        {
          __int16 v76 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          {
            CtrXPC::Result::toString(v179[0], &v172);
            int v105 = SHIBYTE(v172.__r_.__value_.__r.__words[2]);
            std::string::size_type v106 = v172.__r_.__value_.__r.__words[0];
            std::string::basic_string(&v158, (const std::string *)&v179[1]);
            id v107 = &v172;
            if (v105 < 0) {
              id v107 = (std::string *)v106;
            }
            if ((v158.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              id v108 = &v158;
            }
            else {
              id v108 = (std::string *)v158.__r_.__value_.__r.__words[0];
            }
            LODWORD(buf[0]) = 136315650;
            *(void *)((char *)buf + 4) = "Dataset:Channel";
            WORD2(buf[1]) = 2080;
            *(void *)((char *)&buf[1] + 6) = v107;
            HIWORD(buf[2]) = 2080;
            buf[3] = v108;
            long long v81 = "Get Result for set %s, %s, Error Info: %s";
            goto LABEL_329;
          }
        }
        else
        {
          id v109 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
          if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
          {
            CtrXPC::Result::toString(v179[0], &v172);
            int v110 = SHIBYTE(v172.__r_.__value_.__r.__words[2]);
            std::string::size_type v111 = v172.__r_.__value_.__r.__words[0];
            std::string::basic_string(&v158, (const std::string *)&v179[1]);
            id v112 = &v172;
            if (v110 < 0) {
              id v112 = (std::string *)v111;
            }
            if ((v158.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              id v113 = &v158;
            }
            else {
              id v113 = (std::string *)v158.__r_.__value_.__r.__words[0];
            }
            LODWORD(buf[0]) = 136315650;
            *(void *)((char *)buf + 4) = "Dataset:Channel";
            WORD2(buf[1]) = 2080;
            *(void *)((char *)&buf[1] + 6) = v112;
            HIWORD(buf[2]) = 2080;
            buf[3] = v113;
            _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_INFO, "Get Result for set %s, %s, Error Info: %s", (uint8_t *)buf, 0x20u);
            if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v158.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v172.__r_.__value_.__l.__data_);
            }
          }

          std::string::basic_string[abi:ne180100]<0>(&v172, "Command Error");
          LODWORD(buf[0]) = 3;
          *(std::string *)&buf[1] = v172;
          memset(&v172, 0, sizeof(v172));
          CtrXPC::Result::operator=(v179, (uint64_t)buf);
          if (SHIBYTE(buf[3]) < 0) {
            operator delete((void *)buf[1]);
          }
          if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v172.__r_.__value_.__l.__data_);
          }
          uint64_t v114 = self->_CtrInternalClientPtr;
          std::string::basic_string[abi:ne180100]<0>(v152, "Dataset:Delay");
          if (v114) {
            [(CtrInternalClient *)v114 setProperty:v152 property_val:"120000"];
          }
          else {
            memset(buf, 0, sizeof(buf));
          }
          CtrXPC::Result::operator=(v179, (uint64_t)buf);
          if (SHIBYTE(buf[3]) < 0) {
            operator delete((void *)buf[1]);
          }
          if (v153 < 0) {
            operator delete(v152[0]);
          }
          if (LODWORD(v179[0]))
          {
            __int16 v76 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
            if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
            {
              CtrXPC::Result::toString(v179[0], &v172);
              int v115 = SHIBYTE(v172.__r_.__value_.__r.__words[2]);
              std::string::size_type v116 = v172.__r_.__value_.__r.__words[0];
              std::string::basic_string(&v158, (const std::string *)&v179[1]);
              char v117 = &v172;
              if (v115 < 0) {
                char v117 = (std::string *)v116;
              }
              if ((v158.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                id v118 = &v158;
              }
              else {
                id v118 = (std::string *)v158.__r_.__value_.__r.__words[0];
              }
              LODWORD(buf[0]) = 136315650;
              *(void *)((char *)buf + 4) = "Dataset:Delay";
              WORD2(buf[1]) = 2080;
              *(void *)((char *)&buf[1] + 6) = v117;
              HIWORD(buf[2]) = 2080;
              buf[3] = v118;
              long long v81 = "Get Result for set %s, %s, Error Info: %s";
              goto LABEL_329;
            }
          }
          else
          {
            id v119 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
            if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
            {
              CtrXPC::Result::toString(v179[0], &v172);
              int v120 = SHIBYTE(v172.__r_.__value_.__r.__words[2]);
              std::string::size_type v121 = v172.__r_.__value_.__r.__words[0];
              std::string::basic_string(&v158, (const std::string *)&v179[1]);
              char v122 = &v172;
              if (v120 < 0) {
                char v122 = (std::string *)v121;
              }
              if ((v158.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                uint64_t v123 = &v158;
              }
              else {
                uint64_t v123 = (std::string *)v158.__r_.__value_.__r.__words[0];
              }
              LODWORD(buf[0]) = 136315650;
              *(void *)((char *)buf + 4) = "Dataset:Delay";
              WORD2(buf[1]) = 2080;
              *(void *)((char *)&buf[1] + 6) = v122;
              HIWORD(buf[2]) = 2080;
              buf[3] = v123;
              _os_log_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_INFO, "Get Result for set %s, %s, Error Info: %s", (uint8_t *)buf, 0x20u);
              if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v158.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v172.__r_.__value_.__l.__data_);
              }
            }

            std::string::basic_string[abi:ne180100]<0>(&v172, "Command Error");
            LODWORD(buf[0]) = 3;
            *(std::string *)&buf[1] = v172;
            memset(&v172, 0, sizeof(v172));
            CtrXPC::Result::operator=(v179, (uint64_t)buf);
            if (SHIBYTE(buf[3]) < 0) {
              operator delete((void *)buf[1]);
            }
            if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v172.__r_.__value_.__l.__data_);
            }
            std::string v124 = self->_CtrInternalClientPtr;
            std::string::basic_string[abi:ne180100]<0>(v150, "Dataset");
            if (v124) {
              [(CtrInternalClient *)v124 getProperty:v150 output:&v166];
            }
            else {
              memset(buf, 0, sizeof(buf));
            }
            CtrXPC::Result::operator=(v179, (uint64_t)buf);
            if (SHIBYTE(buf[3]) < 0) {
              operator delete((void *)buf[1]);
            }
            if (v151 < 0) {
              operator delete(v150[0]);
            }
            if (LODWORD(v179[0]))
            {
              __int16 v76 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
              if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
              {
                CtrXPC::Result::toString(v179[0], &v172);
                int v125 = SHIBYTE(v172.__r_.__value_.__r.__words[2]);
                std::string::size_type v126 = v172.__r_.__value_.__r.__words[0];
                std::string::basic_string(&v158, (const std::string *)&v179[1]);
                id v127 = &v172;
                if (v125 < 0) {
                  id v127 = (std::string *)v126;
                }
                if ((v158.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  __int16 v128 = &v158;
                }
                else {
                  __int16 v128 = (std::string *)v158.__r_.__value_.__r.__words[0];
                }
                LODWORD(buf[0]) = 136315650;
                *(void *)((char *)buf + 4) = "Dataset";
                WORD2(buf[1]) = 2080;
                *(void *)((char *)&buf[1] + 6) = v127;
                HIWORD(buf[2]) = 2080;
                buf[3] = v128;
                long long v81 = "Get Result for get %s, %s, Error Info: %s";
                goto LABEL_329;
              }
            }
            else
            {
              uint64_t v131 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
              if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
              {
                CtrXPC::Result::toString(v179[0], &v172);
                int v132 = SHIBYTE(v172.__r_.__value_.__r.__words[2]);
                std::string::size_type v133 = v172.__r_.__value_.__r.__words[0];
                std::string::basic_string(&v158, (const std::string *)&v179[1]);
                char v134 = &v172;
                if (v132 < 0) {
                  char v134 = (std::string *)v133;
                }
                if ((v158.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  uint64_t v135 = &v158;
                }
                else {
                  uint64_t v135 = (std::string *)v158.__r_.__value_.__r.__words[0];
                }
                LODWORD(buf[0]) = 136315650;
                *(void *)((char *)buf + 4) = "Dataset";
                WORD2(buf[1]) = 2080;
                *(void *)((char *)&buf[1] + 6) = v134;
                HIWORD(buf[2]) = 2080;
                buf[3] = v135;
                _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_INFO, "Get Result for get %s, %s, Error Info: %s", (uint8_t *)buf, 0x20u);
                if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v158.__r_.__value_.__l.__data_);
                }
                if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v172.__r_.__value_.__l.__data_);
                }
              }

              std::string::basic_string[abi:ne180100]<0>(&v172, "Command Error");
              LODWORD(buf[0]) = 3;
              *(std::string *)&buf[1] = v172;
              memset(&v172, 0, sizeof(v172));
              CtrXPC::Result::operator=(v179, (uint64_t)buf);
              if (SHIBYTE(buf[3]) < 0) {
                operator delete((void *)buf[1]);
              }
              if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v172.__r_.__value_.__l.__data_);
              }
              char v136 = self->_CtrInternalClientPtr;
              std::string::basic_string[abi:ne180100]<0>(v148, "Dataset:Command");
              if (v136) {
                [(CtrInternalClient *)v136 setProperty:v148 property_val:"SetPending"];
              }
              else {
                memset(buf, 0, sizeof(buf));
              }
              CtrXPC::Result::operator=(v179, (uint64_t)buf);
              if (SHIBYTE(buf[3]) < 0) {
                operator delete((void *)buf[1]);
              }
              if (v149 < 0) {
                operator delete(v148[0]);
              }
              if (!LODWORD(v179[0]))
              {
                __int16 v141 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
                if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
                {
                  CtrXPC::Result::toString(v179[0], &v172);
                  int v142 = SHIBYTE(v172.__r_.__value_.__r.__words[2]);
                  std::string::size_type v143 = v172.__r_.__value_.__r.__words[0];
                  std::string::basic_string(&v158, (const std::string *)&v179[1]);
                  unint64_t v144 = &v172;
                  if (v142 < 0) {
                    unint64_t v144 = (std::string *)v143;
                  }
                  if ((v158.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                    char v145 = &v158;
                  }
                  else {
                    char v145 = (std::string *)v158.__r_.__value_.__r.__words[0];
                  }
                  LODWORD(buf[0]) = 136315906;
                  *(void *)((char *)buf + 4) = "Dataset:Command";
                  WORD2(buf[1]) = 2080;
                  *(void *)((char *)&buf[1] + 6) = "SetPending";
                  HIWORD(buf[2]) = 2080;
                  buf[3] = v144;
                  __int16 v176 = 2080;
                  v177 = v145;
                  _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_INFO, "Set Result for %s --> %s, %s, Error Info: %s", (uint8_t *)buf, 0x2Au);
                  if (SHIBYTE(v158.__r_.__value_.__r.__words[2]) < 0) {
                    operator delete(v158.__r_.__value_.__l.__data_);
                  }
                  if (SHIBYTE(v172.__r_.__value_.__r.__words[2]) < 0) {
                    operator delete(v172.__r_.__value_.__l.__data_);
                  }
                }

                self->___int16 lastHostConfiguredChannel = atoi(string);
                int v146 = atoi(string);
                saveIntValue("lastHostConfiguredChannel", v146);
                int v11 = 0;
                goto LABEL_335;
              }
              __int16 v76 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
              if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
              {
                CtrXPC::Result::toString(v179[0], &v172);
                int v137 = SHIBYTE(v172.__r_.__value_.__r.__words[2]);
                std::string::size_type v138 = v172.__r_.__value_.__r.__words[0];
                std::string::basic_string(&v158, (const std::string *)&v179[1]);
                int v139 = &v172;
                if (v137 < 0) {
                  int v139 = (std::string *)v138;
                }
                if ((v158.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  char v140 = &v158;
                }
                else {
                  char v140 = (std::string *)v158.__r_.__value_.__r.__words[0];
                }
                LODWORD(buf[0]) = 136315906;
                *(void *)((char *)buf + 4) = "Dataset:Command";
                WORD2(buf[1]) = 2080;
                *(void *)((char *)&buf[1] + 6) = "SetPending";
                HIWORD(buf[2]) = 2080;
                buf[3] = v139;
                __int16 v176 = 2080;
                v177 = v140;
                long long v81 = "Set Result for %s --> %s, %s, Error Info: %s";
                int v129 = v76;
                uint32_t v130 = 42;
                goto LABEL_330;
              }
            }
          }
        }
      }
    }

    int v11 = 1;
LABEL_335:
    if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v178.__r_.__value_.__l.__data_);
    }
    goto LABEL_337;
  }
  char v9 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = self->_lastUpdatedNCPChannel;
    LODWORD(buf[0]) = 136315394;
    *(void *)((char *)buf + 4) = string;
    WORD2(buf[1]) = 1024;
    *(_DWORD *)((char *)&buf[1] + 6) = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "SetChannel Cmd received: Channel rcvd(%s) is same the one configred in NCP(%d)", (uint8_t *)buf, 0x12u);
  }

  int v11 = 0;
LABEL_80:
  LODWORD(v35) = v11;
  return v35;
}

- (void)getNCPState:(BOOL)a3
{
  BOOL v3 = a3;
  std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  int v22 = 3;
  *(timeval *)std::string::size_type v23 = buf[0];
  __darwin_time_t tv_sec = buf[1].tv_sec;
  uint64_t v21 = 0;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(__p, "NCP:State");
  if (CtrInternalClientPtr) {
    [CtrInternalClientPtr getProperty:__p output:&v21];
  }
  else {
    memset(buf, 0, sizeof(buf));
  }
  CtrXPC::Result::operator=(&v22, (uint64_t)buf);
  if (*((char *)&buf[1].tv_usec + 7) < 0) {
    operator delete(*(void **)&buf[0].tv_usec);
  }
  if (v20 < 0) {
    operator delete(__p[0]);
  }
  if (v22)
  {
    id v6 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf[0].tv_sec) = 136315138;
      *(__darwin_time_t *)((char *)&buf[0].tv_sec + 4) = (__darwin_time_t)"-[ThreadNetworkManagerInstance getNCPState:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s : Failed to get the NCP State Property", (uint8_t *)buf, 0xCu);
    }
  }
  else
  {
    __darwin_time_t SystemUptimeInSec = getSystemUptimeInSec();
    __darwin_time_t DaemonUptimeInSec = getDaemonUptimeInSec();
    char v9 = (char *)v17;
    any_to_string((const boost::any *)&v21, (uint64_t)v17);
    if (v18 < 0) {
      char v9 = (char *)v17[0];
    }
    int v10 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf[0].tv_sec) = 134218498;
      *(__darwin_time_t *)((char *)&buf[0].tv_sec + 4) = SystemUptimeInSec;
      *((_WORD *)&buf[0].tv_usec + 2) = 2048;
      *(void *)((char *)&buf[0].tv_usec + 6) = DaemonUptimeInSec;
      HIWORD(buf[1].tv_sec) = 2080;
      *(void *)&buf[1].tv_usec = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%llu, %llu] %s : NCP State Property", (uint8_t *)buf, 0x20u);
    }

    self->_prevKnownNCPState = self->_lastKnownNCPState;
    int v11 = std::string::basic_string[abi:ne180100]<0>(buf, v9);
    int lastKnownNCPState = nl::wpantund::string_to_ncp_state(v11);
    self->_int lastKnownNCPState = lastKnownNCPState;
    if (SHIBYTE(buf[1].tv_sec) < 0)
    {
      operator delete((void *)buf[0].tv_sec);
      int lastKnownNCPState = self->_lastKnownNCPState;
    }
    srputil_set_ncp_state(lastKnownNCPState);
    if (self->_lastKnownNCPState == 8 && threadStartMsgTime)
    {
      gettimeofday(buf, 0);
      __darwin_time_t v13 = buf[0].tv_sec;
      if (buf[0].tv_sec)
      {
        xpc_object_t v14 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          if (__OFSUB__(v13, threadStartMsgTime))
          {
            __break(0x5515u);
            return;
          }
          *(_DWORD *)id v25 = 134217984;
          __darwin_time_t v26 = v13 - threadStartMsgTime;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Associated: %ld sec since threadStartMsg\n", v25, 0xCu);
        }
      }
      threadStartMsgTime = 0;
      dword_1004FC410 = 0;
    }
    id v15 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = self->_lastKnownNCPState;
      LODWORD(buf[0].tv_sec) = 136315394;
      *(__darwin_time_t *)((char *)&buf[0].tv_sec + 4) = (__darwin_time_t)v9;
      *((_WORD *)&buf[0].tv_usec + 2) = 1024;
      *(__darwin_suseconds_t *)((char *)&buf[0].tv_usec + 6) = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "TNM read NCP state as: %s, %d \n", (uint8_t *)buf, 0x12u);
    }

    if (v3) {
      [(ThreadNetworkManagerInstance *)self checkAndResumeNW];
    }
    if (v18 < 0) {
      operator delete(v17[0]);
    }
  }
  if (v21) {
    (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
  }
  if (SHIBYTE(tv_sec) < 0) {
    operator delete(v23[0]);
  }
}

- (void)checkPreferredThreadNetworkTimerHandler
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: PeriodicCaCollectionMeshcop is Running , So skipping checkPreferredThreadNetworkTimerHandler functionality", v2, v3, v4, v5, v6);
}

- (void)initCheckPreferredTimer
{
}

void __55__ThreadNetworkManagerInstance_initCheckPreferredTimer__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[NSDate date];
  [v2 timeIntervalSince1970];
  double v4 = v3;

  uint64_t v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    id v7 = "-[ThreadNetworkManagerInstance initCheckPreferredTimer]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 6066;
    __int16 v10 = 2048;
    double v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Self heal thread network timer triggered : Timer Triggered timestamp :%f", (uint8_t *)&v6, 0x1Cu);
  }

  if (v4 > 1657720000.0 && saveDoubleValue("CheckPreferredTimeStamp", v4)) {
    [*(id *)(a1 + 32) checkPreferredThreadNetworkTimerHandler];
  }
}

- (id)getHardwareAddress
{
  std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  int v20 = 3;
  *(_OWORD *)uint64_t v21 = *(_OWORD *)buf;
  uint64_t v22 = v26;
  uint64_t v19 = 0;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(__p, "vendor:assigned:hw:mac");
  if (CtrInternalClientPtr)
  {
    [CtrInternalClientPtr getProperty:__p output:&v19];
  }
  else
  {
    *(_OWORD *)long long buf = 0u;
    long long v26 = 0u;
  }
  CtrXPC::Result::operator=(&v20, (uint64_t)buf);
  if (SHIBYTE(v26) < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v18 < 0) {
    operator delete(__p[0]);
  }
  if (v20)
  {
    double v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(ThreadNetworkManagerInstance *)v4 getHardwareAddress];
    }

    int v12 = 0;
  }
  else
  {
    __darwin_time_t v13 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "TNM successfully got Hardware Address", buf, 2u);
    }

    any_to_data((const boost::any *)&v19, buf);
    uint64_t v24 = **(void **)buf;
    *(void *)std::string::size_type v23 = buf;
    std::vector<unsigned char>::__destroy_vector::operator()[abi:ne180100]((void ***)v23);
    encode_data_into_string((unsigned __int8 *)&v24, 8, (char *)buf, 0x14uLL, 0);
    xpc_object_t v14 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::string::size_type v23 = 136642819;
      *(void *)&v23[4] = buf;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "TNM read HW address string: %{sensitive}s", v23, 0xCu);
    }

    int v12 = +[NSString stringWithUTF8String:buf];
    id v15 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)std::string::size_type v23 = 138739971;
      *(void *)&v23[4] = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "TNM read HW address as: %{sensitive}@", v23, 0xCu);
    }
  }
  if (v19) {
    (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
  }
  if (SHIBYTE(v22) < 0) {
    operator delete(v21[0]);
  }

  return v12;
}

- (Result)getNCPNetworkInfo:(Result *__return_ptr)retstr
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  std::string::basic_string[abi:ne180100]<0>(buf, "Commond is successful");
  retstr->id var0 = 0;
  *(_OWORD *)retstr->var1.var0.var0.var0.var0.id var0 = *(_OWORD *)buf;
  *((void *)&retstr->var1.var0.var0.var0.var1 + 2) = *(void *)&buf[16];
  int v55 = 0;
  uint64_t v6 = *(void **)(v4 + 56);
  std::string::basic_string[abi:ne180100]<0>(v53, "NCP:Channel");
  if (v6) {
    [v6 getProperty:v53 output:&v55];
  }
  else {
    memset(buf, 0, 32);
  }
  int v7 = *CtrXPC::Result::operator=(retstr, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v54 < 0)
  {
    operator delete(v53[0]);
    if (v7) {
      goto LABEL_8;
    }
  }
  else if (v7)
  {
LABEL_8:
    uint64_t v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Failed to get the Channel Property", buf, 2u);
    }

    goto LABEL_102;
  }
  *(_WORD *)uint64_t v3 = any_to_int((const boost::any *)&v55);
  uint64_t v52 = 0;
  uint64_t v9 = *(void **)(v4 + 56);
  std::string::basic_string[abi:ne180100]<0>(__p, "Network:Name");
  if (v9) {
    [v9 getProperty:__p output:&v52];
  }
  else {
    memset(buf, 0, 32);
  }
  int v10 = *CtrXPC::Result::operator=(retstr, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v51 < 0)
  {
    operator delete(__p[0]);
    if (v10) {
      goto LABEL_19;
    }
LABEL_23:
    any_to_string((const boost::any *)&v52, (uint64_t)buf);
    std::string::append[abi:ne180100]((std::string *)(v3 + 8), (const std::string::value_type *)buf);
    if ((char)buf[23] < 0) {
      operator delete(*(void **)buf);
    }
    if (*(char *)(v3 + 31) >= 0) {
      uint64_t v12 = v3 + 8;
    }
    else {
      uint64_t v12 = *(void *)(v3 + 8);
    }
    *(void *)(v3 + 32) = v12;
    __darwin_time_t v13 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(v3 + 32);
      *(_DWORD *)long long buf = 136315394;
      *(void *)&void buf[4] = "-[ThreadNetworkManagerInstance getNCPNetworkInfo:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s : cfg network name %s", buf, 0x16u);
    }

    uint64_t v49 = 0;
    id v15 = *(void **)(v4 + 56);
    std::string::basic_string[abi:ne180100]<0>(v47, "Network:XPANID");
    if (v15) {
      [v15 getProperty:v47 output:&v49];
    }
    else {
      memset(buf, 0, 32);
    }
    int v16 = *CtrXPC::Result::operator=(retstr, (uint64_t)buf);
    if ((char)buf[31] < 0) {
      operator delete(*(void **)&buf[8]);
    }
    if (v48 < 0)
    {
      operator delete(v47[0]);
      if (v16) {
        goto LABEL_37;
      }
    }
    else if (v16)
    {
LABEL_37:
      unsigned __int8 v17 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Failed to get the Network XPANID Property", buf, 2u);
      }

LABEL_98:
      if (v49) {
        (*(void (**)(uint64_t))(*(void *)v49 + 8))(v49);
      }
      goto LABEL_100;
    }
    *(void *)(v3 + 40) = any_to_uint64((const boost::any *)&v49, 0);
    char v18 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(v3 + 40);
      *(_DWORD *)long long buf = 136315394;
      *(void *)&void buf[4] = "-[ThreadNetworkManagerInstance getNCPNetworkInfo:]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s : xpanid from NCP : 0x%llX", buf, 0x16u);
    }

    uint64_t v46 = 0;
    int v20 = *(void **)(v4 + 56);
    std::string::basic_string[abi:ne180100]<0>(v44, "Network:PANID");
    if (v20) {
      [v20 getProperty:v44 output:&v46];
    }
    else {
      memset(buf, 0, 32);
    }
    int v21 = *CtrXPC::Result::operator=(retstr, (uint64_t)buf);
    if ((char)buf[31] < 0) {
      operator delete(*(void **)&buf[8]);
    }
    if (v45 < 0) {
      operator delete(v44[0]);
    }
    if (v21)
    {
      uint64_t v22 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Failed to get the PANID Property", buf, 2u);
      }
    }
    else
    {
      *(_WORD *)(v3 + 2) = any_to_int((const boost::any *)&v46);
      uint64_t v43 = 0;
      std::string::size_type v23 = *(void **)(v4 + 56);
      std::string::basic_string[abi:ne180100]<0>(v41, "Network:PartitionId");
      if (v23) {
        [v23 getProperty:v41 output:&v43];
      }
      else {
        memset(buf, 0, 32);
      }
      int v24 = *CtrXPC::Result::operator=(retstr, (uint64_t)buf);
      if ((char)buf[31] < 0) {
        operator delete(*(void **)&buf[8]);
      }
      if (v42 < 0) {
        operator delete(v41[0]);
      }
      if (v24)
      {
        id v25 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Failed to get the Network Partition Id", buf, 2u);
        }
      }
      else
      {
        int v26 = any_to_int((const boost::any *)&v43);
        int v27 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 67109120;
          *(_DWORD *)&void buf[4] = v26;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Network Partition Id: %d", buf, 8u);
        }

        uint64_t v40 = 0;
        id v28 = *(void **)(v4 + 56);
        std::string::basic_string[abi:ne180100]<0>(v38, "Network:Key");
        if (v28) {
          [v28 getProperty:v38 output:&v40];
        }
        else {
          memset(buf, 0, 32);
        }
        int v29 = *CtrXPC::Result::operator=(retstr, (uint64_t)buf);
        if ((char)buf[31] < 0) {
          operator delete(*(void **)&buf[8]);
        }
        if (v39 < 0) {
          operator delete(v38[0]);
        }
        if (v29)
        {
          std::string::size_type v30 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Failed to get the Network Key Property", buf, 2u);
          }
        }
        else
        {
          any_to_data((const boost::any *)&v40, buf);
          *(_OWORD *)(v3 + 48) = **(_OWORD **)buf;
          int v56 = buf;
          std::vector<unsigned char>::__destroy_vector::operator()[abi:ne180100]((void ***)&v56);
          uint64_t v37 = 0;
          id v31 = *(void **)(v4 + 56);
          std::string::basic_string[abi:ne180100]<0>(v35, "Network:PSKc");
          if (v31) {
            [v31 getProperty:v35 output:&v37];
          }
          else {
            memset(buf, 0, 32);
          }
          int v32 = *CtrXPC::Result::operator=(retstr, (uint64_t)buf);
          if ((char)buf[31] < 0) {
            operator delete(*(void **)&buf[8]);
          }
          if (v36 < 0) {
            operator delete(v35[0]);
          }
          if (v32)
          {
            int v33 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Failed to get the Network PSKC Property", buf, 2u);
            }
          }
          else
          {
            any_to_data((const boost::any *)&v37, buf);
            *(_OWORD *)(v3 + 64) = **(_OWORD **)buf;
            int v56 = buf;
            std::vector<unsigned char>::__destroy_vector::operator()[abi:ne180100]((void ***)&v56);
            encode_data_into_string((unsigned __int8 *)(v3 + 64), 16, (char *)(v3 + 80), 0x24uLL, 0);
          }
          if (v37) {
            (*(void (**)(uint64_t))(*(void *)v37 + 8))(v37);
          }
        }
        if (v40) {
          (*(void (**)(uint64_t))(*(void *)v40 + 8))(v40);
        }
      }
      if (v43) {
        (*(void (**)(uint64_t))(*(void *)v43 + 8))(v43);
      }
    }
    if (v46) {
      (*(void (**)(uint64_t))(*(void *)v46 + 8))(v46);
    }
    goto LABEL_98;
  }
  if (!v10) {
    goto LABEL_23;
  }
LABEL_19:
  uint64_t v11 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Failed to get the Network Name Property", buf, 2u);
  }

LABEL_100:
  if (v52) {
    (*(void (**)(uint64_t))(*(void *)v52 + 8))(v52);
  }
LABEL_102:
  id result = v55;
  if (v55) {
    return (Result *)(*(uint64_t (**)(Result *))(*(void *)&v55->var0 + 8))(v55);
  }
  return result;
}

- (void)getNCPChannel
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to get the Channel Property", v2, v3, v4, v5, v6);
}

- (void)resumeNetwork
{
  std::string::basic_string[abi:ne180100]<0>(__p, "Command Error");
  unsigned int v15 = 3;
  *(_OWORD *)&v16.__r_.__value_.__l.__data_ = *(_OWORD *)__p;
  v16.__r_.__value_.__r.__words[2] = v14;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  if (CtrInternalClientPtr)
  {
    [CtrInternalClientPtr resume];
  }
  else
  {
    *(_OWORD *)std::string __p = 0u;
    long long v14 = 0u;
  }
  CtrXPC::Result::operator=(&v15, (uint64_t)__p);
  if (SHIBYTE(v14) < 0) {
    operator delete(__p[1]);
  }
  uint64_t v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    CtrXPC::Result::toString(v15, __p);
    int v5 = SBYTE7(v14);
    uint8_t v6 = (void **)__p[0];
    std::string::basic_string(&v12, &v16);
    int v7 = __p;
    if (v5 < 0) {
      int v7 = v6;
    }
    if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v8 = &v12;
    }
    else {
      uint64_t v8 = (std::string *)v12.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)long long buf = 136315394;
    char v18 = v7;
    __int16 v19 = 2080;
    int v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "TNM request for Resume NW ==> res = %s, Error Info: %s \n", buf, 0x16u);
    if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v12.__r_.__value_.__l.__data_);
    }
    if (SBYTE7(v14) < 0) {
      operator delete(__p[0]);
    }
  }

  sleep(0xAu);
  objc_initWeak(__p, self);
  fQueue = self->_fQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  xpc_object_t v10[2] = __45__ThreadNetworkManagerInstance_resumeNetwork__block_invoke;
  v10[3] = &unk_10049C230;
  objc_copyWeak(&v11, __p);
  dispatch_async(fQueue, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(__p);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__r_.__value_.__l.__data_);
  }
}

void __45__ThreadNetworkManagerInstance_resumeNetwork__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained getNCPState:1];
    if (*((_DWORD *)v2 + 8) != 8)
    {
      [v2[7] reset:1];
      if (v4 < 0) {
        operator delete(__p);
      }
    }
  }
}

- (void)triggerScan
{
  uint64_t v3 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int lastKnownNCPState = self->_lastKnownNCPState;
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = lastKnownNCPState;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "TNM Triggering scan in state \"%d\" \n", buf, 8u);
  }

  std::string::basic_string[abi:ne180100]<0>(buf, "Command Error");
  int v5 = 0;
  unsigned int v25 = 3;
  *((void *)&v6 + 1) = *(void *)&buf[8];
  std::string v26 = *(std::string *)buf;
  scannedNetworkCount = 0;
  char v7 = 1;
  uint64_t v8 = "Command Error";
  *(void *)&long long v6 = 67109890;
  long long v19 = v6;
  do
  {
    char v9 = v7;
    std::string::basic_string[abi:ne180100]<0>(__p, v8);
    *(_DWORD *)long long buf = 3;
    *(_OWORD *)&buf[8] = *(_OWORD *)__p;
    *(void *)&unsigned char buf[24] = v24;
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v24 = 0;
    CtrXPC::Result::operator=(&v25, (uint64_t)buf);
    if ((char)buf[31] < 0) {
      operator delete(*(void **)&buf[8]);
    }
    if (SHIBYTE(v24) < 0) {
      operator delete(__p[0]);
    }
    int v10 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
    id v11 = v10;
    v21[0] = 60;
    v21[1] = 0xFFFF000000000000;
    int v22 = 2;
    if (v10) {
      [v10 scan:v21];
    }
    else {
      memset(buf, 0, 32);
    }
    CtrXPC::Result::operator=(&v25, (uint64_t)buf);
    if ((char)buf[31] < 0) {
      operator delete(*(void **)&buf[8]);
    }

    std::string v12 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __darwin_time_t v13 = v8;
      CtrXPC::Result::toString(v25, __p);
      int v14 = SHIBYTE(v24);
      unsigned int v15 = (void **)__p[0];
      unsigned int v16 = v25;
      std::string::basic_string(&v20, &v26);
      unsigned __int8 v17 = __p;
      if (v14 < 0) {
        unsigned __int8 v17 = v15;
      }
      char v18 = &v20;
      if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        char v18 = (std::string *)v20.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)long long buf = v19;
      *(_DWORD *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = v17;
      *(_WORD *)&unsigned char buf[18] = 1024;
      *(_DWORD *)&buf[20] = v16;
      *(_WORD *)&unsigned char buf[24] = 2080;
      *(void *)&buf[26] = v18;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "TNM Scan(%d) Result = %s, Error Code: %d, Error Info: %s \n", buf, 0x22u);
      if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v20.__r_.__value_.__l.__data_);
      }
      uint64_t v8 = v13;
      if (SHIBYTE(v24) < 0) {
        operator delete(__p[0]);
      }
    }

    char v7 = 0;
    int v5 = 1;
  }
  while ((v9 & 1) != 0);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
}

- (void)checkAndResumeNW
{
  objc_initWeak(&location, self);
  fQueue = self->_fQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __48__ThreadNetworkManagerInstance_checkAndResumeNW__block_invoke;
  v4[3] = &unk_10049C230;
  objc_copyWeak(&v5, &location);
  dispatch_async(fQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __48__ThreadNetworkManagerInstance_checkAndResumeNW__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[8] == 5) {
    [WeakRetained resumeNetwork];
  }
}

- (void)startNetworkTopologyBuilder
{
  uint64_t v3 = dispatch_get_global_queue(25, 0);
  char v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  tnm_nw_topology_fetch_timer = self->_tnm_nw_topology_fetch_timer;
  self->_tnm_nw_topology_fetch_timer = v4;

  dispatch_time_t v6 = dispatch_time(0, 3600000000000);
  dispatch_source_set_timer((dispatch_source_t)self->_tnm_nw_topology_fetch_timer, v6, 0x34630B8A000uLL, 0);
  char v7 = self->_tnm_nw_topology_fetch_timer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __59__ThreadNetworkManagerInstance_startNetworkTopologyBuilder__block_invoke;
  handler[3] = &unk_10049C010;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_activate((dispatch_object_t)self->_tnm_nw_topology_fetch_timer);
  uint64_t v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)char v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "TNM: startNetworkTopologyBuilder : Starting", v9, 2u);
  }
}

void __59__ThreadNetworkManagerInstance_startNetworkTopologyBuilder__block_invoke(uint64_t a1)
{
  std::string::basic_string[abi:ne180100]<0>(&v15, "Command Error");
  int v18 = 3;
  long long v19 = v15;
  uint64_t v20 = v16;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v17 = 0;
  uint64_t v3 = [v2 CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(__p, "Thread:ChildTable:AsValMap");
  if (v3)
  {
    [v3 getProperty:__p output:&v17];
  }
  else
  {
    long long v16 = 0u;
    long long v15 = 0u;
  }
  CtrXPC::Result::operator=(&v18, (uint64_t)&v15);
  if (SHIBYTE(v16) < 0) {
    operator delete(*((void **)&v15 + 1));
  }
  if (v14 < 0) {
    operator delete(__p[0]);
  }

  if (v18)
  {
    char v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __59__ThreadNetworkManagerInstance_startNetworkTopologyBuilder__block_invoke_cold_3();
    }
  }
  else
  {
    uint64_t v5 = v17;
    if (v17) {
      uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 24))(v17);
    }
    uint64_t v11 = v5;
    ThreadNetworkManagerTopologyHandler_Update_ChildTable(&v11, v12);
    std::__list_imp<std::map<std::string,boost::any>>::clear(v12);
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
    }
    dispatch_time_t v6 = [*(id *)(a1 + 32) CtrInternalClientPtr];
    std::string::basic_string[abi:ne180100]<0>(v9, "Thread:ChildTable:Addresses:AsValMap");
    if (v6)
    {
      [v6 getProperty:v9 output:&v17];
    }
    else
    {
      long long v16 = 0u;
      long long v15 = 0u;
    }
    CtrXPC::Result::operator=(&v18, (uint64_t)&v15);
    if (SHIBYTE(v16) < 0) {
      operator delete(*((void **)&v15 + 1));
    }
    if (v10 < 0) {
      operator delete(v9[0]);
    }

    if (!v18)
    {
      uint64_t v7 = v17;
      if (v17) {
        uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)v17 + 24))(v17);
      }
      uint64_t v8 = v7;
      ThreadNetworkManagerTopologyHandler_Update_ChildTableAddresses(&v8, (uint64_t *)&v15);
      operator new();
    }
    char v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __59__ThreadNetworkManagerInstance_startNetworkTopologyBuilder__block_invoke_cold_1();
    }
  }

  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
  }
  if (SHIBYTE(v20) < 0) {
    operator delete((void *)v19);
  }
}

- (unint64_t)getCountOfThreadBorderRoutersWithMdns:(id)a3
{
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  std::string v26 = __Block_byref_object_copy__0;
  int v27 = __Block_byref_object_dispose__0;
  id v3 = a3;
  id v28 = v3;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__0;
  int v21 = __Block_byref_object_dispose__0;
  getUUIDAsStr();
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  if (v18[5])
  {
    uint64_t v5 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = v18[5];
      *(_DWORD *)long long buf = 136315650;
      std::string::size_type v30 = "-[ThreadNetworkManagerInstance getCountOfThreadBorderRoutersWithMdns:]";
      __int16 v31 = 1024;
      int v32 = 6441;
      __int16 v33 = 2112;
      uint64_t v34 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Starting Scan Tag : %@", buf, 0x1Cu);
    }
  }
  uint64_t v7 = (void *)v24[5];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  xpc_object_t v13[2] = __70__ThreadNetworkManagerInstance_getCountOfThreadBorderRoutersWithMdns___block_invoke;
  v13[3] = &unk_10049C450;
  long long v15 = &v17;
  long long v16 = &v23;
  uint64_t v8 = v4;
  char v14 = v8;
  [v7 startScan:v13 queue:&_dispatch_main_q timeInSec:5];
  char v9 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    std::string::size_type v30 = "-[ThreadNetworkManagerInstance getCountOfThreadBorderRoutersWithMdns:]";
    __int16 v31 = 1024;
    int v32 = 6449;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s:%d: Finding Thread network Border Routers around", buf, 0x12u);
  }

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = [(id)v24[5] findNWs];
  uint64_t v11 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[ThreadNetworkManagerInstance getCountOfThreadBorderRoutersWithMdns:]();
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return (unint64_t)v10;
}

intptr_t __70__ThreadNetworkManagerInstance_getCountOfThreadBorderRoutersWithMdns___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = log_get_logging_obg("com.apple.wpantund.tnm", "commissioning");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v5 = 136315650;
      uint64_t v6 = "-[ThreadNetworkManagerInstance getCountOfThreadBorderRoutersWithMdns:]_block_invoke";
      __int16 v7 = 1024;
      int v8 = 6444;
      __int16 v9 = 2112;
      uint64_t v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s:%d: Stopping Scan Tag : %@", (uint8_t *)&v5, 0x1Cu);
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) stopScan];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)checkIfNetworkIsFoundInMDNSScan:(id)a3 borderAgentID:(id)a4
{
  id v59 = a3;
  id v58 = a4;
  uint64_t v6 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  char v66 = self;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    int v68 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
    __int16 v69 = 1024;
    *(_DWORD *)char v70 = 6459;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s:%d: Entered. Checking if Network matches with Mdns", buf, 0x12u);
  }

  __int16 v7 = self;
  if (!self->_BAFinder)
  {
    int v8 = (ThreadNetworkfinder *)[(id)objc_opt_new() init];
    BAFinder = self->_BAFinder;
    self->_BAFinder = v8;

    __int16 v7 = self;
    if (!self->_BAFinder)
    {
      int v55 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315394;
        int v68 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
        __int16 v69 = 1024;
        *(_DWORD *)char v70 = 6465;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%s:%d: baFinder is nil..", buf, 0x12u);
      }

      goto LABEL_85;
    }
  }
  unint64_t v65 = [(ThreadNetworkManagerInstance *)v7 getCountOfThreadBorderRoutersWithMdns:"getCountOfThreadBorderRoutersWithMdns:"];
  if (!v65)
  {
LABEL_82:
    uint64_t v52 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      int v53 = [v59 networkName];
      -[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:](v53, (uint64_t)buf, v52);
    }

    [(ThreadNetworkfinder *)v66->_BAFinder clear];
LABEL_85:
    BOOL v56 = 0;
    goto LABEL_86;
  }
  uint64_t v11 = 0;
  *(void *)&long long v10 = 136315906;
  long long v57 = v10;
  while (1)
  {
    std::string v12 = -[ThreadNetworkfinder getBorderAgentForIndex:](v7->_BAFinder, "getBorderAgentForIndex:", v11, v57);
    __darwin_time_t v13 = v12;
    if (v12) {
      break;
    }
LABEL_24:
    uint64_t v25 = 0;
    std::string v26 = 0;
    int v27 = 0;
    id v28 = 0;
LABEL_25:

LABEL_26:
    int v29 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      __break(0x5500u);
    }
    uint64_t v11 = v29;
    __int16 v7 = v66;
    if (v65 <= v29) {
      goto LABEL_82;
    }
  }
  char v14 = [v12 addresses];
  BOOL v15 = v14 == 0;

  if (v15)
  {
    int v21 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_23:

      goto LABEL_24;
    }
    *(_DWORD *)long long buf = 136315394;
    int v68 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
    __int16 v69 = 2112;
    *(void *)char v70 = v13;
    id v22 = v21;
    uint64_t v23 = "%s : No IP address is available for the server : %@, continue to next BR";
    uint32_t v24 = 22;
LABEL_63:
    _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v23, buf, v24);
    goto LABEL_23;
  }
  long long v16 = [v13 TXTRecordData];
  unint64_t v64 = +[NSNetService dictionaryFromTXTRecordData:v16];

  if (!v64)
  {
    int v21 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_DWORD *)long long buf = 136315650;
    int v68 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
    __int16 v69 = 1024;
    *(_DWORD *)char v70 = 6488;
    *(_WORD *)&uint8_t v70[4] = 2112;
    *(void *)&v70[6] = v13;
    id v22 = v21;
    uint64_t v23 = "%s : %d No text record data available for the server : %@, continue to next network";
    uint32_t v24 = 28;
    goto LABEL_63;
  }
  long long v61 = [v64 objectForKey:@"nn"];
  int v63 = [v64 objectForKey:@"xp"];
  unint64_t v62 = [v64 objectForKey:@"xa"];
  uint64_t v17 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    int v68 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
    __int16 v69 = 1024;
    *(_DWORD *)char v70 = 6496;
    *(_WORD *)&uint8_t v70[4] = 2112;
    *(void *)&v70[6] = v64;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s:%d BorderAgent MDNS Text Record Data : %@", buf, 0x1Cu);
  }

  if (!v61 || !v63 || !v62)
  {
    log = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
LABEL_46:
      uint64_t v25 = 0;
      std::string v26 = 0;
      int v27 = 0;
      id v28 = 0;
      int v42 = 4;
      goto LABEL_74;
    }
    *(_DWORD *)long long buf = 136315650;
    int v68 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
    __int16 v69 = 1024;
    *(_DWORD *)char v70 = 6499;
    *(_WORD *)&uint8_t v70[4] = 2112;
    *(void *)&v70[6] = v13;
    std::string::size_type v30 = log;
    __int16 v31 = "%s : %d cannot parse dictionary data for server : %@, continue to next network";
    uint32_t v32 = 28;
LABEL_78:
    _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, v31, buf, v32);
    goto LABEL_46;
  }
  if ([v63 length] == (id)16 && objc_msgSend(v62, "length") == (id)16)
  {
    int v18 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = [v63 length];
      *(_DWORD *)long long buf = 136315650;
      int v68 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
      __int16 v69 = 1024;
      *(_DWORD *)char v70 = 6504;
      *(_WORD *)&uint8_t v70[4] = 2048;
      *(void *)&v70[6] = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s:%d BorderAgent ID and XpanID are of OLD format (string based) with length : %lu", buf, 0x1Cu);
    }
    char v20 = 0;
    goto LABEL_35;
  }
  if ([v63 length] != (id)8 || objc_msgSend(v62, "length") != (id)8)
  {
    log = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      goto LABEL_46;
    }
    id v50 = [v63 length];
    char v51 = [v62 length];
    *(_DWORD *)long long buf = v57;
    int v68 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
    __int16 v69 = 1024;
    *(_DWORD *)char v70 = 6512;
    *(_WORD *)&uint8_t v70[4] = 2048;
    *(void *)&v70[6] = v50;
    __int16 v71 = 2048;
    int v72 = v51;
    std::string::size_type v30 = log;
    __int16 v31 = "%s:%d Continuing... BorderAgent ID and XpanID length mismatch !!! xpan id length : %lu, border agent id length : %lu";
    uint32_t v32 = 38;
    goto LABEL_78;
  }
  int v18 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  char v20 = 1;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v33 = [v63 length];
    *(_DWORD *)long long buf = 136315650;
    int v68 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
    __int16 v69 = 1024;
    *(_DWORD *)char v70 = 6508;
    *(_WORD *)&uint8_t v70[4] = 2048;
    *(void *)&v70[6] = v33;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s:%d BorderAgent ID and XpanID are of NEW format (binary based) with length : %lu", buf, 0x1Cu);
  }
LABEL_35:

  log = [objc_alloc((Class)NSString) initWithData:v61 encoding:4];
  if (!log)
  {
    uint64_t v37 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315650;
      int v68 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
      __int16 v69 = 1024;
      *(_DWORD *)char v70 = 6519;
      *(_WORD *)&uint8_t v70[4] = 2112;
      *(void *)&v70[6] = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s : %d network name nsstring conversion failure for server : %@, continue to next network", buf, 0x1Cu);
    }
    uint64_t v25 = 0;
    std::string v26 = 0;
    int v27 = 0;
    id v28 = 0;
    goto LABEL_69;
  }
  if (v20)
  {
    uint64_t v34 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      unint64_t v35 = [v59 networkName];
      char v36 = [v59 extendedPANID];
      *(_DWORD *)long long buf = 136316930;
      int v68 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
      __int16 v69 = 1024;
      *(_DWORD *)char v70 = 6550;
      *(_WORD *)&uint8_t v70[4] = 2112;
      *(void *)&v70[6] = v35;
      __int16 v71 = 2112;
      int v72 = v36;
      __int16 v73 = 2112;
      id v74 = v58;
      __int16 v75 = 2112;
      __int16 v76 = log;
      __int16 v77 = 2112;
      std::string::size_type v78 = v63;
      __int16 v79 = 2112;
      id v80 = v62;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%s:%d: Comparing  => storing(network name:%@, xpanid :%@, baid : %@), mdns (network name:%@, xpanid:%@, baid : %@)", buf, 0x4Eu);
    }
    uint64_t v37 = [v59 networkName];
    if ([v37 isEqualToString:log])
    {
      std::string::size_type v38 = [v59 extendedPANID];
      if ([v38 isEqualToData:v63])
      {
        unsigned int v39 = [v58 isEqualToData:v62];

        if (v39)
        {
          uint64_t v40 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            __int16 v41 = [v59 networkName];
            *(_DWORD *)long long buf = v57;
            int v68 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
            __int16 v69 = 1024;
            *(_DWORD *)char v70 = 6555;
            *(_WORD *)&uint8_t v70[4] = 2112;
            *(void *)&v70[6] = v41;
            __int16 v71 = 2112;
            int v72 = log;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%s : %d: Network :%@ matches with mdns record :%@", buf, 0x26u);
          }
          [(ThreadNetworkfinder *)v66->_BAFinder clear];
          int v42 = 1;
          uint64_t v25 = 0;
          std::string v26 = 0;
          int v27 = 0;
          id v28 = 0;
          goto LABEL_74;
        }
        uint64_t v25 = 0;
        std::string v26 = 0;
        int v27 = 0;
        id v28 = 0;
LABEL_80:
        int v42 = 0;
        goto LABEL_74;
      }
    }
    uint64_t v25 = 0;
    std::string v26 = 0;
    int v27 = 0;
    id v28 = 0;
LABEL_72:
    int v42 = 0;
LABEL_73:

    goto LABEL_74;
  }
  id v28 = [objc_alloc((Class)NSString) initWithData:v63 encoding:4];
  id v43 = [objc_alloc((Class)NSString) initWithData:v62 encoding:4];
  int v27 = v43;
  if (!v28 || !v43)
  {
    uint64_t v37 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315650;
      int v68 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
      __int16 v69 = 1024;
      *(_DWORD *)char v70 = 6527;
      *(_WORD *)&uint8_t v70[4] = 2112;
      *(void *)&v70[6] = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s : %d xpanid and baid nsstring conversion failure, server : %@, continue to next network", buf, 0x1Cu);
    }
    uint64_t v25 = 0;
    std::string v26 = 0;
    goto LABEL_69;
  }
  std::string v26 = [(ThreadNetworkManagerInstance *)v66 dataFromHexString:v28];
  uint64_t v44 = [(ThreadNetworkManagerInstance *)v66 dataFromHexString:v27];
  uint64_t v25 = (void *)v44;
  if (!v26 || !v44)
  {
    uint64_t v37 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315650;
      int v68 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
      __int16 v69 = 1024;
      *(_DWORD *)char v70 = 6535;
      *(_WORD *)&uint8_t v70[4] = 2112;
      *(void *)&v70[6] = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s : %d hex string conversion to nsdata failure for server : %@, continue to next network", buf, 0x1Cu);
    }
LABEL_69:
    int v42 = 4;
    goto LABEL_73;
  }
  char v45 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136316930;
    int v68 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
    __int16 v69 = 1024;
    *(_DWORD *)char v70 = 6539;
    *(_WORD *)&uint8_t v70[4] = 2112;
    *(void *)&v70[6] = log;
    __int16 v71 = 2112;
    int v72 = v28;
    __int16 v73 = 2112;
    id v74 = v27;
    __int16 v75 = 2112;
    __int16 v76 = v26;
    __int16 v77 = 2112;
    std::string::size_type v78 = v25;
    __int16 v79 = 2112;
    id v80 = v58;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "%s:%d: network name str : %@, xpan id str : %@, baid str : %@, foundxpanid : %@, foundbaid : %@, borderAgentID : %@", buf, 0x4Eu);
  }

  uint64_t v37 = [v59 networkName];
  if (![v37 isEqualToString:log]) {
    goto LABEL_72;
  }
  uint64_t v46 = [v59 extendedPANID];
  if (([v46 isEqualToData:v26] & 1) == 0)
  {

    goto LABEL_72;
  }
  unsigned int v47 = [v58 isEqualToData:v25];

  if (!v47) {
    goto LABEL_80;
  }
  char v48 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    uint64_t v49 = [v59 networkName];
    *(_DWORD *)long long buf = v57;
    int v68 = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
    __int16 v69 = 1024;
    *(_DWORD *)char v70 = 6544;
    *(_WORD *)&uint8_t v70[4] = 2112;
    *(void *)&v70[6] = v49;
    __int16 v71 = 2112;
    int v72 = log;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "%s : %d: Network :%@ matches with mdns record :%@", buf, 0x26u);
  }
  [(ThreadNetworkfinder *)v66->_BAFinder clear];
  int v42 = 1;
LABEL_74:

  if (!v42) {
    goto LABEL_25;
  }

  if (v42 == 4) {
    goto LABEL_26;
  }
  BOOL v56 = 1;
LABEL_86:

  return v56;
}

- (BOOL)checkAndUpdateNetworkParamsFromMdnsScan:(id)a3 borderAgentID:(id)a4 leaderBorderAgentID:(id)a5 isNwFound:(BOOL *)a6 numAppleBRs:(int *)a7 numThirdPartyBRs:(int *)a8 isLeaderAppleDevice:(BOOL *)a9 numThreadNwsFound:(int *)a10 shouldRunPeriodicTdm:(BOOL *)a11
{
  id v112 = a3;
  id v106 = a4;
  id v107 = a5;
  __darwin_time_t v13 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    int v137 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:isNw"
           "Found:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
    __int16 v138 = 1024;
    int v139 = 6572;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s:%d: Entered. Check and update network parameters from meshcop mDNS scan ", buf, 0x12u);
  }

  *a6 = 0;
  *a8 = 0;
  *a7 = 0;
  *a9 = 0;
  *a10 = 0;
  *a11 = 0;
  id v114 = v106;
  encode_data_into_string((unsigned __int8 *)[v114 bytes], (uint64_t)objc_msgSend(v114, "length"), (char *)buf, 0x100uLL, 0);
  id v113 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", buf, +[NSString defaultCStringEncoding]);
  char v14 = self;
  if (!self->_BAFinder)
  {
    BOOL v15 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__b = 136315394;
      char v122 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:is"
             "NwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
      __int16 v123 = 1024;
      LODWORD(v124) = 6596;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s:%d: Initialize new ThreadNetworkFinder instance ", __b, 0x12u);
    }

    long long v16 = (ThreadNetworkfinder *)[(id)objc_opt_new() init];
    BAFinder = self->_BAFinder;
    self->_BAFinder = v16;

    char v14 = self;
    if (!self->_BAFinder)
    {
      std::string::size_type v94 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      id v108 = v94;
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__b = 136315394;
        char v122 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:"
               "isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
        __int16 v123 = 1024;
        LODWORD(v124) = 6602;
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "%s:%d: baFinder is nil..", __b, 0x12u);
      }
      BOOL v83 = 0;
      goto LABEL_128;
    }
  }
  unint64_t v18 = [(ThreadNetworkManagerInstance *)v14 getCountOfThreadBorderRoutersWithMdns:"getCountOfThreadBorderRoutersWithMdns:"];
  if (!v18)
  {
    __int16 v75 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:](v75, v76, v77, v78, v79, v80, v81, v82);
    }

    [(ThreadNetworkfinder *)self->_BAFinder clear];
    BOOL v83 = 0;
    goto LABEL_129;
  }
  id v108 = +[NSMutableSet set];
  unint64_t v119 = v18;
  id v116 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v19 = 0;
  do
  {
    char v20 = [(ThreadNetworkfinder *)self->_BAFinder getBorderAgentForIndex:v19];
    int v21 = v20;
    if (!v20) {
      goto LABEL_100;
    }
    id v22 = [v20 addresses];
    BOOL v23 = v22 == 0;

    if (v23)
    {
      uint64_t v25 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__b = 136315394;
        char v122 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:"
               "isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
        __int16 v123 = 2112;
        *(void *)&long long v124 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s : No IP address is available for the server : %@, continue to next BR", __b, 0x16u);
      }
      goto LABEL_99;
    }
    uint32_t v24 = [v21 TXTRecordData];
    uint64_t v25 = +[NSNetService dictionaryFromTXTRecordData:v24];

    if (!v25)
    {
      std::string v26 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__b = 136315650;
        char v122 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:"
               "isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
        __int16 v123 = 1024;
        LODWORD(v124) = 6638;
        WORD2(v124) = 2112;
        *(void *)((char *)&v124 + 6) = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s : %d No text record data available for the server : %@, continue to next network", __b, 0x1Cu);
      }
      goto LABEL_98;
    }
    std::string v26 = [v25 objectForKey:@"nn"];
    id v118 = [v25 objectForKey:@"xp"];
    id v117 = [v25 objectForKey:@"xa"];
    int v115 = [v25 objectForKey:@"vn"];
    int v27 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__b = 136315650;
      char v122 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:is"
             "NwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
      __int16 v123 = 1024;
      LODWORD(v124) = 6647;
      WORD2(v124) = 2112;
      *(void *)((char *)&v124 + 6) = v25;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s:%d BorderAgent MDNS Text Record Data : %@", __b, 0x1Cu);
    }

    if (v26 && v118 && v117)
    {
      if ([v118 length] == (id)16 && objc_msgSend(v117, "length") == (id)16)
      {
        id v28 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          id v29 = [v118 length];
          *(_DWORD *)__b = 136315650;
          char v122 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentI"
                 "D:isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
          __int16 v123 = 1024;
          LODWORD(v124) = 6655;
          WORD2(v124) = 2048;
          *(void *)((char *)&v124 + 6) = v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s:%d BorderAgent ID and XpanID are of OLD format (string based) with length : %lu", __b, 0x1Cu);
        }
        char v30 = 0;
        goto LABEL_32;
      }
      if ([v118 length] == (id)8 && objc_msgSend(v117, "length") == (id)8)
      {
        id v28 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        char v30 = 1;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          id v35 = [v118 length];
          *(_DWORD *)__b = 136315650;
          char v122 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentI"
                 "D:isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
          __int16 v123 = 1024;
          LODWORD(v124) = 6659;
          WORD2(v124) = 2048;
          *(void *)((char *)&v124 + 6) = v35;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s:%d BorderAgent ID and XpanID are of NEW format (binary based) with length : %lu", __b, 0x1Cu);
        }
LABEL_32:

        __int16 v31 = [objc_alloc((Class)NSString) initWithData:v26 encoding:4];
        if (!v31)
        {
          uint64_t v40 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__b = 136315650;
            char v122 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgen"
                   "tID:isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
            __int16 v123 = 1024;
            LODWORD(v124) = 6670;
            WORD2(v124) = 2112;
            *(void *)((char *)&v124 + 6) = v21;
            _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%s : %d network name nsstring conversion failure for server : %@, continue to next network", __b, 0x1Cu);
          }
          goto LABEL_96;
        }
        int v105 = [objc_alloc((Class)NSString) initWithData:v115 encoding:4];
        if (!v105)
        {
          log = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__b = 136315650;
            char v122 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgen"
                   "tID:isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
            __int16 v123 = 1024;
            LODWORD(v124) = 6676;
            WORD2(v124) = 2112;
            *(void *)((char *)&v124 + 6) = v21;
            _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s : %d vendor name nsstring conversion failure for server : %@, continue to next network", __b, 0x1Cu);
          }
          goto LABEL_95;
        }
        [v108 addObject:v31];
        if ([v105 isEqualToString:@"Apple Inc."])
        {
          int v36 = *a7 + 1;
          if (__OFADD__(*a7, 1)) {
            goto LABEL_138;
          }
          uint64_t v37 = a7;
        }
        else
        {
          int v36 = *a8 + 1;
          if (__OFADD__(*a8, 1)) {
            goto LABEL_138;
          }
          uint64_t v37 = a8;
        }
        int *v37 = v36;
        if ((v30 & 1) == 0)
        {
          uint64_t v46 = [objc_alloc((Class)NSString) initWithData:v118 encoding:4];
          id v47 = [objc_alloc((Class)NSString) initWithData:v117 encoding:4];
          log = v46;
          int v103 = v47;
          if (v46 && (id v48 = v47) != 0)
          {
            uint64_t v49 = [(ThreadNetworkManagerInstance *)self dataFromHexString:v46];
            uint64_t v50 = [(ThreadNetworkManagerInstance *)self dataFromHexString:v48];
            char v51 = (void *)v50;
            std::string::size_type v102 = v49;
            if (v49 && v50)
            {
              if ([v107 isEqualToData:v50]
                && ([v112 networkName],
                    uint64_t v52 = objc_claimAutoreleasedReturnValue(),
                    unsigned int v53 = [v52 isEqualToString:v31],
                    v52,
                    v53))
              {
                int v101 = 1;
                if ([v105 isEqualToString:@"Apple Inc."]) {
                  *a9 = 1;
                }
              }
              else
              {
                int v101 = 0;
              }
              char v66 = [v112 networkName];
              if ([v66 isEqualToString:v31])
              {
                char v67 = [v112 extendedPANID];
                if ([v67 isEqualToData:v102])
                {
                  unsigned int v68 = [v114 isEqualToData:v51];

                  if (v68)
                  {
                    __int16 v69 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
                    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
                    {
                      char v70 = [v112 networkName];
                      *(_DWORD *)__b = 136315906;
                      char v122 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leader"
                             "BorderAgentID:isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:"
                             "shouldRunPeriodicTdm:]";
                      __int16 v123 = 1024;
                      LODWORD(v124) = 6718;
                      WORD2(v124) = 2112;
                      *(void *)((char *)&v124 + 6) = v70;
                      HIWORD(v124) = 2112;
                      *(void *)int v125 = v31;
                      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "%s : %d: Network :%@ matches with mdns record :%@", __b, 0x26u);
                    }
                    *a6 = 1;
                  }
                }
                else
                {
                }
              }
              else
              {
              }
              __int16 v71 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
              if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)__b = 136317442;
                char v122 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorder"
                       "AgentID:isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
                __int16 v123 = 1024;
                LODWORD(v124) = 6722;
                WORD2(v124) = 2112;
                *(void *)((char *)&v124 + 6) = v31;
                HIWORD(v124) = 2112;
                *(void *)int v125 = v46;
                *(_WORD *)&v125[8] = 2112;
                *(void *)&v125[10] = v103;
                __int16 v126 = 2112;
                id v127 = v102;
                __int16 v128 = 2112;
                int v129 = v51;
                __int16 v130 = 2112;
                id v131 = v114;
                __int16 v132 = 2112;
                std::string::size_type v133 = v115;
                __int16 v134 = 1024;
                int v135 = v101;
                _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "%s:%d: network name str : %@, xpan id str : %@, baid str : %@, foundxpanid : %@, foundbaid : %@ nwFound:true, borderAgentID : %@, vendorName:%@, isLeader:%d", __b, 0x5Eu);
              }
            }
            else
            {
              int v63 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
              if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)__b = 136315650;
                char v122 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorder"
                       "AgentID:isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
                __int16 v123 = 1024;
                LODWORD(v124) = 6703;
                WORD2(v124) = 2112;
                *(void *)((char *)&v124 + 6) = v21;
                _os_log_error_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "%s : %d hex string conversion to nsdata failure for server : %@, continue to next network", __b, 0x1Cu);
              }
            }
          }
          else
          {
            char v54 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)__b = 136315650;
              char v122 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAg"
                     "entID:isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
              __int16 v123 = 1024;
              LODWORD(v124) = 6695;
              WORD2(v124) = 2112;
              *(void *)((char *)&v124 + 6) = v21;
              _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%s : %d xpanid and baid nsstring conversion failure, server : %@, continue to next network", __b, 0x1Cu);
            }
          }
          goto LABEL_95;
        }
        __int16 v41 = [v112 networkName];
        if ([v41 isEqualToString:v31])
        {
          int v42 = [v112 extendedPANID];
          if ([v42 isEqualToData:v118])
          {
            unsigned int v43 = [v114 isEqualToData:v117];

            if (v43)
            {
              uint64_t v44 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
              if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
              {
                char v45 = [v112 networkName];
                *(_DWORD *)__b = 136315906;
                char v122 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorder"
                       "AgentID:isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
                __int16 v123 = 1024;
                LODWORD(v124) = 6728;
                WORD2(v124) = 2112;
                *(void *)((char *)&v124 + 6) = v45;
                HIWORD(v124) = 2112;
                *(void *)int v125 = v31;
                _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%s : %d: Network :%@ matches with mdns record :%@", __b, 0x26u);
              }
              *a6 = 1;
            }
          }
          else
          {
          }
        }
        else
        {
        }
        int v55 = [v112 networkName];
        if ([v55 isEqualToString:v31])
        {
          unsigned int v56 = [v107 isEqualToData:v117];

          if (v56)
          {
            int v57 = 1;
            if ([v105 isEqualToString:@"Apple Inc."]) {
              *a9 = 1;
            }
            goto LABEL_72;
          }
        }
        else
        {
        }
        int v57 = 0;
LABEL_72:
        id v58 = [v112 networkName];
        if ([v58 isEqualToString:v31])
        {
          id v59 = [v112 extendedPANID];
          if ([v59 isEqualToData:v118])
          {
            unsigned int v60 = [v105 isEqualToString:@"Apple Inc."];

            if (v60)
            {
              id v61 = v117;
              encode_data_into_string((unsigned __int8 *)[v61 bytes], (uint64_t)objc_msgSend(v61, "length"), (char *)__b, 0x100uLL, 0);
              unint64_t v62 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", __b, +[NSString defaultCStringEncoding]);
              [v116 addObject:v62];
            }
          }
          else
          {
          }
        }
        else
        {
        }
        log = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          unint64_t v64 = [v112 networkName];
          unint64_t v65 = [v112 extendedPANID];
          *(_DWORD *)__b = 136317442;
          char v122 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentI"
                 "D:isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
          __int16 v123 = 1024;
          LODWORD(v124) = 6761;
          WORD2(v124) = 2112;
          *(void *)((char *)&v124 + 6) = v64;
          HIWORD(v124) = 2112;
          *(void *)int v125 = v65;
          *(_WORD *)&v125[8] = 2112;
          *(void *)&v125[10] = v114;
          __int16 v126 = 2112;
          id v127 = v31;
          __int16 v128 = 2112;
          int v129 = v118;
          __int16 v130 = 2112;
          id v131 = v117;
          __int16 v132 = 2112;
          std::string::size_type v133 = v115;
          __int16 v134 = 1024;
          int v135 = v57;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s:%d: Comparing  => storing(network name:%@, xpanid :%@, baid : %@), mdns (network name:%@, xpanid:%@, baid : %@, vendorName:%@, isLeader:%d)", __b, 0x5Eu);
        }
LABEL_95:

        uint64_t v40 = v105;
LABEL_96:

        goto LABEL_97;
      }
      __int16 v31 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        id v38 = [v118 length];
        id v39 = [v117 length];
        *(_DWORD *)__b = 136315906;
        char v122 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:"
               "isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
        __int16 v123 = 1024;
        LODWORD(v124) = 6663;
        WORD2(v124) = 2048;
        *(void *)((char *)&v124 + 6) = v38;
        HIWORD(v124) = 2048;
        *(void *)int v125 = v39;
        uint32_t v32 = v31;
        id v33 = "%s:%d Continuing... BorderAgent ID and XpanID length mismatch !!! xpan id length : %lu, border agent id length : %lu";
        uint32_t v34 = 38;
        goto LABEL_39;
      }
    }
    else
    {
      __int16 v31 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__b = 136315650;
        char v122 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:"
               "isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
        __int16 v123 = 1024;
        LODWORD(v124) = 6650;
        WORD2(v124) = 2112;
        *(void *)((char *)&v124 + 6) = v21;
        uint32_t v32 = v31;
        id v33 = "%s : %d cannot parse dictionary data for server : %@, continue to next network";
        uint32_t v34 = 28;
LABEL_39:
        _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, v33, __b, v34);
      }
    }
LABEL_97:

LABEL_98:
LABEL_99:

LABEL_100:
    int v72 = v19 + 1;
    if (__OFADD__(v19, 1)) {
LABEL_138:
    }
      __break(0x5500u);
    uint64_t v19 = v72;
  }
  while (v119 > v72);
  if ([v116 count])
  {
    if ([v116 count] == (id)1)
    {
      __int16 v73 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG)) {
        -[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]();
      }
      BOOL v74 = 1;
      goto LABEL_113;
    }
    if ((unint64_t)[v116 count] >= 2)
    {
      [v116 sortUsingSelector:"localizedCaseInsensitiveCompare:"];
      for (uint64_t i = 0; i < (int)[v116 count]; ++i)
      {
        id v92 = [v116 objectAtIndex:i];
        if (v119 <= 4)
        {
          int v93 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)__b = 136316162;
            char v122 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgen"
                   "tID:isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
            __int16 v123 = 1024;
            LODWORD(v124) = 6803;
            WORD2(v124) = 2112;
            *(void *)((char *)&v124 + 6) = v113;
            HIWORD(v124) = 1024;
            *(_DWORD *)int v125 = i;
            *(_WORD *)&v125[4] = 2112;
            *(void *)&v125[6] = v92;
            _os_log_debug_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEBUG, "%s:%d: currentBAIdStr=%@, index=%d baIdStrArray=%@ ", __b, 0x2Cu);
          }
        }
      }
      int v96 = [v116 count];
      if (v96 >= 1)
      {
        uint64_t v97 = 0;
        if (v96 == 1) {
          uint64_t v98 = 1;
        }
        else {
          uint64_t v98 = 2;
        }
        do
        {
          id v99 = [v116 objectAtIndexedSubscript:v97];
          unsigned int v100 = [v113 isEqualToString:v99];

          if (v100) {
            *a11 = 1;
          }
          ++v97;
        }
        while (v98 != v97);
      }
    }
  }
  else
  {
    __int16 v73 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]();
    }
    BOOL v74 = 0;
LABEL_113:

    *a11 = v74;
  }
  *a10 = [v108 count];
  std::string::size_type v84 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
  {
    int v85 = *a7;
    int v86 = *a8;
    BOOL v87 = *a9;
    int v88 = *a10;
    BOOL v89 = *a6;
    BOOL v90 = *a11;
    *(_DWORD *)__b = 136316930;
    char v122 = "-[ThreadNetworkManagerInstance checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:isNw"
           "Found:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]";
    __int16 v123 = 1024;
    LODWORD(v124) = 6818;
    WORD2(v124) = 1024;
    *(_DWORD *)((char *)&v124 + 6) = v85;
    WORD5(v124) = 1024;
    HIDWORD(v124) = v86;
    *(_WORD *)int v125 = 1024;
    *(_DWORD *)&v125[2] = v87;
    *(_WORD *)&v125[6] = 1024;
    *(_DWORD *)&v125[8] = v88;
    *(_WORD *)&v125[12] = 1024;
    *(_DWORD *)&v125[14] = v89;
    __int16 v126 = 1024;
    LODWORD(v127) = v90;
    _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_INFO, "%s:%d: numAppleBRs=%d, numThirdPartyBRs=%d, isLeaderAppleDevice=%d, numThreadNetworks=%d isCurrentNodeMeshcopEntryFound=%d shouldRunTdm=%d", __b, 0x36u);
  }

  [(ThreadNetworkfinder *)self->_BAFinder clear];
  BOOL v83 = 1;
LABEL_128:

LABEL_129:
  return v83;
}

- (BOOL)updateMeshcopRelatedParams:(BOOL *)a3 numAppleBRs:(int *)a4 numThirdPartyBRs:(int *)a5 isLeaderAppleDevice:(BOOL *)a6 numThreadNwsFound:(int *)a7 shouldRunPeriodicTdm:(BOOL *)a8
{
  __int16 v9 = [(ThreadNetworkManagerInstance *)self getCurrentNetworkNameAndXpanid];
  uint64_t v38 = 0;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v36, "NCP:ExtendedAddress");
  if (CtrInternalClientPtr)
  {
    [CtrInternalClientPtr getProperty:v36 output:&v38];
    BOOL v11 = LODWORD(__p[0]) == 0;
    if (SHIBYTE(v42) < 0) {
      operator delete(__p[1]);
    }
  }
  else
  {
    *(_OWORD *)std::string __p = 0u;
    long long v42 = 0u;
    BOOL v11 = 1;
  }
  if (v37 < 0)
  {
    operator delete(v36[0]);
    if (v11)
    {
LABEL_7:
      any_to_string((const boost::any *)&v38, (uint64_t)__p);
      int v12 = SBYTE7(v42);
      __darwin_time_t v13 = (void **)__p[0];
      NSStringEncoding v14 = +[NSString defaultCStringEncoding];
      if (v12 >= 0) {
        BOOL v15 = __p;
      }
      else {
        BOOL v15 = v13;
      }
      long long v16 = +[NSString stringWithCString:v15 encoding:v14];
      uint64_t v17 = [(ThreadNetworkManagerInstance *)self dataFromHexString:v16];

      if (SBYTE7(v42) < 0) {
        operator delete(__p[0]);
      }
      uint64_t v35 = 0;
      unint64_t v18 = self->_CtrInternalClientPtr;
      std::string::basic_string[abi:ne180100]<0>(v33, "Thread:Leader:ExtendedAddress");
      if (v18)
      {
        [(CtrInternalClient *)v18 getProperty:v33 output:&v35];
        BOOL v19 = LODWORD(__p[0]) == 0;
        if (SHIBYTE(v42) < 0) {
          operator delete(__p[1]);
        }
      }
      else
      {
        *(_OWORD *)std::string __p = 0u;
        long long v42 = 0u;
        BOOL v19 = 1;
      }
      if (v34 < 0)
      {
        operator delete(v33[0]);
        if (v19) {
          goto LABEL_22;
        }
      }
      else if (v19)
      {
LABEL_22:
        any_to_data((const boost::any *)&v35, __p);
        uint64_t v40 = *(void *)__p[0];
        __b[0] = __p;
        std::vector<unsigned char>::__destroy_vector::operator()[abi:ne180100](__b);
        encode_data_into_string((unsigned __int8 *)&v40, 8, (char *)__b, 0x14uLL, 0);
        int v21 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          LODWORD(__p[0]) = 136315138;
          *(void **)((char *)__p + 4) = __b;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "retrieved leader_ext_addr: %s", (uint8_t *)__p, 0xCu);
        }

        any_to_string((const boost::any *)&v35, (uint64_t)__p);
        int v22 = SBYTE7(v42);
        BOOL v23 = (void **)__p[0];
        NSStringEncoding v24 = +[NSString defaultCStringEncoding];
        if (v22 >= 0) {
          uint64_t v25 = __p;
        }
        else {
          uint64_t v25 = v23;
        }
        std::string v26 = +[NSString stringWithCString:v25 encoding:v24];
        int v27 = [(ThreadNetworkManagerInstance *)self dataFromHexString:v26];

        if (SBYTE7(v42) < 0) {
          operator delete(__p[0]);
        }
        id v28 = +[NSData dataWithBytes:"FF" length:8];
        unsigned int v29 = [v27 isEqualToData:v28];

        if (v29)
        {
          char v30 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            -[ThreadNetworkManagerInstance updateMeshcopRelatedParams:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]();
          }
        }
        char v20 = v29 ^ 1;
LABEL_38:
        if (v35) {
          (*(void (**)(uint64_t))(*(void *)v35 + 8))(v35);
        }
        goto LABEL_40;
      }
      __int16 v31 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance updateMeshcopRelatedParams:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:]();
      }

      char v20 = 0;
      goto LABEL_38;
    }
  }
  else if (v11)
  {
    goto LABEL_7;
  }
  uint64_t v17 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[ThreadNetworkManagerInstance(SM_extension) nodeChangeToChildStatus:]();
  }
  char v20 = 0;
LABEL_40:

  if (v38) {
    (*(void (**)(uint64_t))(*(void *)v38 + 8))(v38);
  }

  return v20;
}

- (BOOL)checkIfMdnsIsPublishedForBAID
{
  uint64_t v3 = [(ThreadNetworkManagerInstance *)self getCurrentNetworkNameAndXpanid];
  uint64_t v19 = 0;
  CtrInternalClientPtr = self->_CtrInternalClientPtr;
  std::string::basic_string[abi:ne180100]<0>(v15, "NCP:ExtendedAddress");
  if (CtrInternalClientPtr)
  {
    [CtrInternalClientPtr getProperty:v15 output:&v19];
    BOOL v5 = LODWORD(__p[0]) == 0;
    if (SHIBYTE(v18) < 0) {
      operator delete(__p[1]);
    }
  }
  else
  {
    *(_OWORD *)std::string __p = 0u;
    long long v18 = 0u;
    BOOL v5 = 1;
  }
  if (v16 < 0)
  {
    operator delete(v15[0]);
    if (v5) {
      goto LABEL_7;
    }
  }
  else if (v5)
  {
LABEL_7:
    any_to_string((const boost::any *)&v19, (uint64_t)__p);
    int v6 = SBYTE7(v18);
    __int16 v7 = (void **)__p[0];
    NSStringEncoding v8 = +[NSString defaultCStringEncoding];
    if (v6 >= 0) {
      __int16 v9 = __p;
    }
    else {
      __int16 v9 = v7;
    }
    long long v10 = +[NSString stringWithCString:v9 encoding:v8];
    BOOL v11 = [(ThreadNetworkManagerInstance *)self dataFromHexString:v10];

    if (SBYTE7(v18) < 0) {
      operator delete(__p[0]);
    }
    BOOL v12 = [(ThreadNetworkManagerInstance *)self checkIfNetworkIsFoundInMDNSScan:v3 borderAgentID:v11];
    if (v12)
    {
      __darwin_time_t v13 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(__p[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "mDNS record is published", (uint8_t *)__p, 2u);
      }
    }
    else
    {
      __darwin_time_t v13 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ThreadNetworkManagerInstance checkIfMdnsIsPublishedForBAID]();
      }
    }

    goto LABEL_22;
  }
  BOOL v11 = log_get_logging_obg("com.apple.wpantund.tnm", "threadStart");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[ThreadNetworkManagerInstance(SM_extension) nodeChangeToChildStatus:]();
  }
  LOBYTE(v12) = 0;
LABEL_22:

  if (v19) {
    (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
  }

  return v12;
}

- (void)checkMeshcopMdns
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s : %d : mDNS record not found after successful threadstart", v2, v3, v4, v5, v6);
}

- (CtrInternalClient)CtrInternalClientPtr
{
  return (CtrInternalClient *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCtrInternalClientPtr:(id)a3
{
}

- (unsigned)lastUpdatedNCPChannel
{
  return self->_lastUpdatedNCPChannel;
}

- (void)setLastUpdatedNCPChannel:(unsigned __int8)a3
{
  self->_int lastUpdatedNCPChannel = a3;
}

- (unsigned)lastHostConfiguredChannel
{
  return self->_lastHostConfiguredChannel;
}

- (void)setLastHostConfiguredChannel:(unsigned __int8)a3
{
  self->___int16 lastHostConfiguredChannel = a3;
}

- (int)prevKnownNCPState
{
  return self->_prevKnownNCPState;
}

- (void)setPrevKnownNCPState:(int)a3
{
  self->_prevKnownNCPState = a3;
}

- (int)lastKnownNCPState
{
  return self->_lastKnownNCPState;
}

- (void)setLastKnownNCPState:(int)a3
{
  self->_int lastKnownNCPState = a3;
}

- (int)lastKnownNodeType
{
  return self->_lastKnownNodeType;
}

- (void)setLastKnownNodeType:(int)a3
{
  self->_int lastKnownNodeType = a3;
}

- (int)lastKnownValidNodeType
{
  return self->_lastKnownValidNodeType;
}

- (void)setLastKnownValidNodeType:(int)a3
{
  self->_lastKnownValidNodeType = a3;
}

- (OS_dispatch_queue)fQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFQueue:(id)a3
{
}

- (ThreadNetworkfinder)BAFinder
{
  return (ThreadNetworkfinder *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBAFinder:(id)a3
{
}

- (OS_dispatch_queue)tnm_scan_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTnm_scan_queue:(id)a3
{
}

- (THThreadNetworkCredentialsStoreLocalClient)keyChainStore
{
  return (THThreadNetworkCredentialsStoreLocalClient *)objc_getProperty(self, a2, 88, 1);
}

- (void)setKeyChainStore:(id)a3
{
}

- (NSString)hwAddr
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setHwAddr:(id)a3
{
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDeviceName:(id)a3
{
}

- (BOOL)waitForSync
{
  return self->_waitForSync;
}

- (void)setWaitForSync:(BOOL)a3
{
  self->_BOOL waitForSync = a3;
}

- (BOOL)isPeriodicCaCollectionMeshcopRunning
{
  return self->_isPeriodicCaCollectionMeshcopRunning;
}

- (void)setIsPeriodicCaCollectionMeshcopRunning:(BOOL)a3
{
  self->_isPeriodicCaCollectionMeshcopRunning = a3;
}

- (BOOL)createNetwork
{
  return self->_createNetwork;
}

- (void)setCreateNetwork:(BOOL)a3
{
  self->_createNetwork = a3;
}

- (int)deviceNode
{
  return self->_deviceNode;
}

- (void)setDeviceNode:(int)a3
{
  self->_int deviceNode = a3;
}

- (BOOL)modeChangeInProgress
{
  return self->_modeChangeInProgress;
}

- (void)setModeChangeInProgress:(BOOL)a3
{
  self->_modeChangeInProgress = a3;
}

- (BOOL)networkNodeTypeChangeNotify
{
  return self->_networkNodeTypeChangeNotify;
}

- (void)setNetworkNodeTypeChangeNotify:(BOOL)a3
{
  self->_networkNodeTypeChangeNotify = a3;
}

- (BOOL)wakeOnDeviceChangeNotify
{
  return self->_wakeOnDeviceChangeNotify;
}

- (void)setWakeOnDeviceChangeNotify:(BOOL)a3
{
  self->_wakeOnDeviceChangeNotify = a3;
}

- (BOOL)wedAttachRequest
{
  return self->_wedAttachRequest;
}

- (void)setWedAttachRequest:(BOOL)a3
{
  self->_wedAttachRequest = a3;
}

- (int)wedStatus
{
  return self->_wedStatus;
}

- (void)setWedStatus:(int)a3
{
  self->_wedStatus = a3;
}

- (BOOL)geoAvailable
{
  return self->_geoAvailable;
}

- (void)setGeoAvailable:(BOOL)a3
{
  self->_geoAvailable = a3;
}

- (BOOL)foundAdvDuringPairing
{
  return self->_foundAdvDuringPairing;
}

- (void)setFoundAdvDuringPairing:(BOOL)a3
{
  self->_foundAdvDuringPairing = a3;
}

- (unsigned)numAdvDuringPairing
{
  return self->_numAdvDuringPairing;
}

- (void)setNumAdvDuringPairing:(unsigned __int8)a3
{
  self->_numAdvDuringPairing = a3;
}

- (BOOL)foundAdvDuringWedConnectionAttempt
{
  return self->_foundAdvDuringWedConnectionAttempt;
}

- (void)setFoundAdvDuringWedConnectionAttempt:(BOOL)a3
{
  self->_foundAdvDuringWedConnectionAttempt = a3;
}

- (BOOL)stopPairingRequest
{
  return self->_stopPairingRequest;
}

- (void)setStopPairingRequest:(BOOL)a3
{
  self->_stopPairingRequest = a3;
}

- (BOOL)isPairing
{
  return self->_isPairing;
}

- (void)setIsPairing:(BOOL)a3
{
  self->_isPairing = a3;
}

- (BOOL)isFWUpdateInProgress
{
  return self->_isFWUpdateInProgress;
}

- (void)setIsFWUpdateInProgress:(BOOL)a3
{
  self->_isFWUpdateInProgress = a3;
}

- (BOOL)isNonWedFWUpdateProgressInChildRole
{
  return self->_isNonWedFWUpdateProgressInChildRole;
}

- (void)setIsNonWedFWUpdateProgressInChildRole:(BOOL)a3
{
  self->_isNonWedFWUpdateProgressInChildRole = a3;
}

- (BOOL)isWedFWUpdateProgressInChildRole
{
  return self->_isWedFWUpdateProgressInChildRole;
}

- (void)setIsWedFWUpdateProgressInChildRole:(BOOL)a3
{
  self->_isWedFWUpdateProgressInChildRole = a3;
}

- (OS_dispatch_semaphore)semaphoreNetworkNodeTypeChange
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSemaphoreNetworkNodeTypeChange:(id)a3
{
}

- (OS_dispatch_semaphore)semaphoreWakeOnDeviceChange
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSemaphoreWakeOnDeviceChange:(id)a3
{
}

- (const)defaultChildNode
{
  return self->_defaultChildNode;
}

- (void)setDefaultChildNode:(const char *)a3
{
  self->_defaultChildNode = a3;
}

- (unint64_t)lastTimeInLeaderRole
{
  return self->_lastTimeInLeaderRole;
}

- (void)setLastTimeInLeaderRole:(unint64_t)a3
{
  self->_unint64_t lastTimeInLeaderRole = a3;
}

- (OS_dispatch_source)tnm_nw_topology_fetch_timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 144, 1);
}

- (void)setTnm_nw_topology_fetch_timer:(id)a3
{
}

- (OS_dispatch_source)checkPreferredThreadNetworkTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 152, 1);
}

- (void)setCheckPreferredThreadNetworkTimer:(id)a3
{
}

- (OS_dispatch_queue)checkPreferredThreadNetworkTimerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCheckPreferredThreadNetworkTimerQueue:(id)a3
{
}

- (OS_dispatch_queue)periodicStatsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 168, 1);
}

- (void)setPeriodicStatsQueue:(id)a3
{
}

- (OS_dispatch_queue)tnmNodeTypeChangeQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 176, 1);
}

- (void)setTnmNodeTypeChangeQueue:(id)a3
{
}

- (OS_dispatch_queue)tnmWedStatusChangeQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 184, 1);
}

- (void)setTnmWedStatusChangeQueue:(id)a3
{
}

- (BOOL)lastIsLeaderThirdParty
{
  return self->_lastIsLeaderThirdParty;
}

- (void)setLastIsLeaderThirdParty:(BOOL)a3
{
  self->_lastIsLeaderThirdParty = a3;
}

- (THThreadNetworkCredentialsActiveDataSetRecord)lastKnownJoinedNetworkRecord
{
  return (THThreadNetworkCredentialsActiveDataSetRecord *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLastKnownJoinedNetworkRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownJoinedNetworkRecord, 0);
  objc_storeStrong((id *)&self->_tnmWedStatusChangeQueue, 0);
  objc_storeStrong((id *)&self->_tnmNodeTypeChangeQueue, 0);
  objc_storeStrong((id *)&self->_periodicStatsQueue, 0);
  objc_storeStrong((id *)&self->_checkPreferredThreadNetworkTimerQueue, 0);
  objc_storeStrong((id *)&self->_checkPreferredThreadNetworkTimer, 0);
  objc_storeStrong((id *)&self->_tnm_nw_topology_fetch_timer, 0);
  objc_storeStrong((id *)&self->_semaphoreWakeOnDeviceChange, 0);
  objc_storeStrong((id *)&self->_semaphoreNetworkNodeTypeChange, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_hwAddr, 0);
  objc_storeStrong((id *)&self->_keyChainStore, 0);
  objc_storeStrong((id *)&self->_tnm_scan_queue, 0);
  objc_storeStrong((id *)&self->_BAFinder, 0);
  objc_storeStrong((id *)&self->_fQueue, 0);

  objc_storeStrong((id *)&self->_CtrInternalClientPtr, 0);
}

- (void)createDriverInterface:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to allocate keychain store", v2, v3, v4, v5, v6);
}

void __54__ThreadNetworkManagerInstance_createDriverInterface___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d:: Failed to get the Network DataSet", v2, v3, v4, v5, v6);
}

- (void)threadNetworkManagerInstance_MsgHandler:message:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_10_0((void *)&_mh_execute_header, v0, v1, "Wrong message received from client \"%s\" for method \"%s\" ", v2, v3);
}

- (void)retrieveActiveDataSetRecordForUniqueId:(uint64_t)a3 record:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)retrieveActiveDataSetRecordForUniqueId:record:.cold.2()
{
  v2[0] = 136315394;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_11_3((void *)&_mh_execute_header, v0, v1, "%s: NSUUID :  unique Network Id is %s", (uint8_t *)v2);
}

- (void)retrieveActiveDataSetRecordForUniqueId:record:.cold.3()
{
  int v2 = 136315394;
  uint64_t v3 = "-[ThreadNetworkManagerInstance retrieveActiveDataSetRecordForUniqueId:record:]";
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_11_3((void *)&_mh_execute_header, v0, v1, "%s: NSUUID :  unique Network Id is %@", (uint8_t *)&v2);
}

- (void)retrieveActiveDataSetRecordForUniqueId:(uint64_t)a3 record:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __78__ThreadNetworkManagerInstance_retrieveActiveDataSetRecordForUniqueId_record___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_24_0(__stack_chk_guard);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_10_0((void *)&_mh_execute_header, v1, v2, "error in getting Credentials Record : %@, for the Network : %@", (void)v3, DWORD2(v3));
}

- (void)retrieveCredentialsForUniqueId:(uint64_t)a3 credentialsRecord_t:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)retrieveCredentialsForUniqueId:credentialsRecord_t:.cold.2()
{
  v2[0] = 136315394;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_11_3((void *)&_mh_execute_header, v0, v1, "%s: NSUUID :  unique Network Id is %s", (uint8_t *)v2);
}

- (void)retrieveCredentialsForUniqueId:credentialsRecord_t:.cold.3()
{
  int v2 = 136315394;
  long long v3 = "-[ThreadNetworkManagerInstance retrieveCredentialsForUniqueId:credentialsRecord_t:]";
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_11_3((void *)&_mh_execute_header, v0, v1, "%s: NSUUID :  unique Network Id is %@", (uint8_t *)&v2);
}

- (void)retrieveCredentialsForUniqueId:(uint64_t)a3 credentialsRecord_t:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)validateDataSetTLVs:creds:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "creds could not be parsed", v2, v3, v4, v5, v6);
}

- (void)validateDataSetTLVs:creds:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "#MOS network could not be parsed", v2, v3, v4, v5, v6);
}

- (void)validateDataSetTLVs:creds:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "#MOS credDataset could not be allocated", v2, v3, v4, v5, v6);
}

- (void)validateDataSetTLVs:creds:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "#MOS borderAgent could not be allocated", v2, v3, v4, v5, v6);
}

- (void)validateDataSetTLVs:creds:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "#MOS Credentials record could not be parsed", v2, v3, v4, v5, v6);
}

- (void)validateDataSetTLVs:creds:.cold.6()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "creds master_key :%{sensitive}@ : Line : %d", v2, v3, v4, v5, v6);
}

- (void)validateDataSetTLVs:creds:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: %d: Parsed dataset tlvs successfully", v2, v3, v4, v5, v6);
}

- (void)validateDataSetTLVs:creds:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: %d: Can not parse dataset tlvs", v2, v3, v4, v5, v6);
}

- (void)validateDataSetTLVs:creds:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: %d: Not a dataset tlv", v2, v3, v4, v5, v6);
}

- (void)validateDataSetTLVs:creds:.cold.10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded TLV, format is invalid, current position goes out of bound, Line : %d", v2, v3, v4, v5, v6);
}

- (void)validateDataSetTLVs:creds:.cold.11()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded Channel mask, mask entry format is invalid, Line : %d", v2, v3, v4, v5, v6);
}

- (void)validateDataSetTLVs:creds:.cold.12()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> error : Decoded entry length is not matching,  Line : %d", v2, v3, v4, v5, v6);
}

- (void)validateDataSetTLVs:creds:.cold.13()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> error : Decoded Channel page is neither zero nor 2,  Line : %d", v2, v3, v4, v5, v6);
}

- (void)validateDataSetTLVs:(uint64_t)a3 creds:(uint64_t)a4 .cold.14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)validateDataSetTLVs:(uint64_t)a3 creds:(uint64_t)a4 .cold.15(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)validateDataSetTLVs:creds:.cold.16()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s : #MOS : Channel Page is not Zero : %d", v2, v3, v4, v5, 2u);
}

- (void)validateDataSetTLVs:creds:.cold.17()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded channel Len : %d", v2, v3, v4, v5, v6);
}

- (void)validateDataSetTLVs:creds:.cold.18()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid pan id length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)validateDataSetTLVs:creds:.cold.19()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid extended pan id length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)validateDataSetTLVs:creds:.cold.20()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid pskc length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)validateDataSetTLVs:creds:.cold.21()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid network key length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)validateDataSetTLVs:creds:.cold.22()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid rotation time, Line : %d", v2, v3, v4, v5, v6);
}

- (void)validateDataSetTLVs:creds:.cold.23()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid Security Policy length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)validateDataSetTLVs:creds:.cold.24()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Invalid Mesh local prefix length %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)validateDataSetTLVs:creds:.cold.25()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: #MOS : ==> Decoded TLV, format is invalid, current position goes out of bound, Line : %d", v2, v3, v4, v5, v6);
}

- (void)validateDataSetTLVs:(uint64_t)a3 creds:(uint64_t)a4 .cold.26(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)validateDataSetTLVs:creds:.cold.27()
{
  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s: #TNM : data_len : %d, Line : %d", v2, v3, v4, v5, 2u);
}

- (void)howToStartThreadNetwork:(uint64_t)a3 credentialsRecord_t:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)howToStartThreadNetwork:credentialsRecord_t:.cold.2()
{
  v2[0] = 136315394;
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_11_3((void *)&_mh_execute_header, v0, v1, "%s: Error getting records for unique Network ID : %s", (uint8_t *)v2);
}

- (void)deleteCurrentNetwork:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)deleteCurrentNetwork:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updatePrimaryResident:isPrimaryResident:isPrimaryResidentThreadCapable:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d Failed to update primary resident", v2, v3, v4, v5, v6);
}

- (void)threadStop
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to stop srp from threadstop", v2, v3, v4, v5, v6);
}

- (void)threadLeave
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to stop srp from threadleave", v2, v3, v4, v5, v6);
}

- (void)threadStart:activeOperationalDataset:isPrimaryUser:routerMode:geoAvailable:defaultChildNode:output:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d unique Network Id is NULL, returning error", v2, v3, v4, v5, v6);
}

- (void)threadStart:activeOperationalDataset:isPrimaryUser:routerMode:geoAvailable:defaultChildNode:output:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to formNetworkWithAOD", v2, v3, v4, v5, v6);
}

- (void)threadStart:activeOperationalDataset:isPrimaryUser:routerMode:geoAvailable:defaultChildNode:output:.cold.3()
{
  v2[0] = 136315394;
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_11_3((void *)&_mh_execute_header, v0, v1, "%s: Error getting records for unique Network ID : %s", (uint8_t *)v2);
}

- (void)threadStart:activeOperationalDataset:isPrimaryUser:routerMode:geoAvailable:defaultChildNode:output:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Error : Thread commissioning service is disabled", v2, v3, v4, v5, v6);
}

- (void)threadStart:activeOperationalDataset:isPrimaryUser:routerMode:geoAvailable:defaultChildNode:output:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s: threadStart rejected as BT is OFF with ret : %d", v2, v3, v4, v5, v6);
}

- (void)threadStart:output:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to start thread network, device is not connected to the internet", v2, v3, v4, v5, v6);
}

- (void)deleteCredentialsForThisNetwork:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)deleteCredentialsForThisNetwork:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getMeCredentialsForThisNetwork:(uint64_t)a3 credentialsRecord_t:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getMeCredentialsForThisNetwork:(uint64_t)a3 credentialsRecord_t:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fillupThreadCredentialsToSelfHealThreadNetwork:store:.cold.1()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v0, v1, "%s:%d: NCP is not in associated mode %d", v2, v3, v4, v5, 2u);
}

void __85__ThreadNetworkManagerInstance_fillupThreadCredentialsToSelfHealThreadNetwork_store___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to delete the preferred network entry when ncp is offline", v2, v3, v4, v5, v6);
}

void __85__ThreadNetworkManagerInstance_fillupThreadCredentialsToSelfHealThreadNetwork_store___block_invoke_280_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to delete the preferred network entry", v2, v3, v4, v5, v6);
}

- (void)getPreferredNetworkWithNoScan
{
}

void __61__ThreadNetworkManagerInstance_getPreferredNetworkWithNoScan__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v0, v1, "error in getting Credentials Record : %@, for PreferredNetwork", v2, v3, v4, v5, v6);
}

- (void)getPreferredNetwork
{
}

- (void)getMePassPhraseForThisNetwork:(uint64_t)a3 passPhrase:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __73__ThreadNetworkManagerInstance_getMePassPhraseForThisNetwork_passPhrase___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)joinerAttach:output:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Error in saving thread configuration", v2, v3, v4, v5, v6);
}

- (void)joinerAttach:(int *)a1 output:(NSObject *)a2 .cold.2(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Joiner Attach failed, return code %u", (uint8_t *)v3, 8u);
}

- (void)formNetworkWithAODForPrimaryOrSharedUser:isPrimaryUser:routerMode:geoAvailable:defaultChildNode:output:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d: Failed to encode dataset ", v2, v3, v4, v5, v6);
}

- (void)formNetworkWithAODForPrimaryOrSharedUser:isPrimaryUser:routerMode:geoAvailable:defaultChildNode:output:.cold.2()
{
  OUTLINED_FUNCTION_5_1(__stack_chk_guard);
  LODWORD(v2) = 136315394;
  *(void *)((char *)&v2 + 4) = "-[ThreadNetworkManagerInstance formNetworkWithAODForPrimaryOrSharedUser:isPrimaryUser:r"
                                 "outerMode:geoAvailable:defaultChildNode:output:]";
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_10_0((void *)&_mh_execute_header, v0, v1, "%s: Dataset is empty (%s) Throw Error", (const char *)v2, DWORD2(v2));
}

- (void)formNetworkWithAODForPrimaryOrSharedUser:isPrimaryUser:routerMode:geoAvailable:defaultChildNode:output:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to get wasChildStatus for the network corresponding to current Data Set", v2, v3, v4, v5, v6);
}

- (void)formNetworkWithAODForPrimaryOrSharedUser:isPrimaryUser:routerMode:geoAvailable:defaultChildNode:output:.cold.4()
{
  OUTLINED_FUNCTION_5_1(__stack_chk_guard);
  v2[0] = 136315650;
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_18_1((void *)&_mh_execute_header, v0, v1, "%s:%d Dataset is not of TLV format (%s), returning failure", (uint8_t *)v2);
}

- (void)formNetworkWithAOD:record:output:.cold.1()
{
  OUTLINED_FUNCTION_5_1(__stack_chk_guard);
  LODWORD(v2) = 136315394;
  *(void *)((char *)&v2 + 4) = "-[ThreadNetworkManagerInstance formNetworkWithAOD:record:output:]";
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_10_0((void *)&_mh_execute_header, v0, v1, "%s: Dataset is empty (%s) Throw Error", (const char *)v2, DWORD2(v2));
}

- (void)formNetworkWithAOD:record:output:.cold.2()
{
  OUTLINED_FUNCTION_5_1(__stack_chk_guard);
  v2[0] = 136315650;
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_18_1((void *)&_mh_execute_header, v0, v1, "%s:%d Dataset is not of TLV format (%s), calling formNetworkWithCreds", (uint8_t *)v2);
}

- (void)formNetworkWithCreds:(uint64_t)a3 credentialsRecord_t:(uint64_t)a4 output:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, a1, a3, "%s: Passphrase is nil, unable to generate PSKc, returning failure..", a5, a6, a7, a8, 2u);
}

- (void)formNetworkWithCreds:(uint64_t)a3 credentialsRecord_t:(uint64_t)a4 output:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)formNetworkWithCreds:(uint64_t)a3 credentialsRecord_t:(uint64_t)a4 output:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updatePreferredNetworkForDatasetChange
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, " %s:%d No current network found !", v2, v3, v4, v5, v6);
}

void __70__ThreadNetworkManagerInstance_updatePreferredNetworkForDatasetChange__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, " %s:%d: Failed to update preferred network dataset Error : %@", v2, v3, v4, v5, 2u);
}

- (void)getCurrentNetworkNameAndXpanid
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to get the Network XPANID Property", v2, v3, v4, v5, v6);
}

- (void)getCurrentNetworkCredentials
{
  OUTLINED_FUNCTION_25_0();
  _DWORD *v2 = 136315650;
  OUTLINED_FUNCTION_17_0(v3, v4, (uint64_t)v2);
  _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, " %s: No Credential Record found for the network : %@, xpan : %@", v5, 0x20u);
}

- (void)getCurrentNetworkCredentialsActiveDataSetRecord
{
}

- (void)getCurrentCredentialsDataSet
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d:: #mOS:Failed to get the Network Data Set Property", v2, v3, v4, v5, v6);
}

- (void)saveThreadConfigurationAOD:(uint64_t)a3 passPhrase:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)saveThreadConfigurationAOD:(uint64_t)a3 passPhrase:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)saveThreadConfigurationAOD:passPhrase:.cold.3()
{
  OUTLINED_FUNCTION_7_3();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to get NCP Network Info : %s", v4, 0xCu);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void __70__ThreadNetworkManagerInstance_saveThreadConfigurationAOD_passPhrase___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v0, v1, "Failed to save thread credentials, Error : %@", v2, v3, v4, v5, v6);
}

- (void)saveThreadConfiguration:(uint64_t)a3 passPhrase:(uint64_t)a4 uuid:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)saveThreadConfiguration:(uint64_t)a3 passPhrase:(uint64_t)a4 uuid:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)saveThreadConfiguration:(uint64_t)a3 passPhrase:(uint64_t)a4 uuid:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__ThreadNetworkManagerInstance_saveThreadConfiguration_passPhrase_uuid___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0((void *)&_mh_execute_header, v0, v1, " Failed to save thread credentials, Error : %@", v2, v3, v4, v5, v6);
}

- (void)saveLastKnownJoinedNetwork:datasetRecord:.cold.1()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s:%d Error getting records for unique Network ID : %s", v2, v3, v4, v5, 2u);
}

- (void)formNewNetwork:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "%s:%d:Error in saving thread configuration", v2, v3, v4, v5, v6);
}

- (void)attachToNetwork:(int *)a1 output:(NSObject *)a2 .cold.2(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Join failed, will form network, \"AttachTNetwork\" New state is %d", (uint8_t *)v3, 8u);
}

- (void)setChannelUsingChannelManger:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "SetChannel Cmd received when node is neither a router nor a leader.", v2, v3, v4, v5, v6);
}

- (void)getHardwareAddress
{
}

void __59__ThreadNetworkManagerInstance_startNetworkTopologyBuilder__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to get the Network Topology ChildTableAddresses", v2, v3, v4, v5, v6);
}

void __59__ThreadNetworkManagerInstance_startNetworkTopologyBuilder__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to get the Network Topology ChildTable", v2, v3, v4, v5, v6);
}

- (void)getCountOfThreadBorderRoutersWithMdns:.cold.1()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s : %d :  Found networks : %lu", v2, v3, v4, v5, 2u);
}

- (void)checkIfNetworkIsFoundInMDNSScan:(NSObject *)a3 borderAgentID:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315650;
  *(void *)(a2 + 4) = "-[ThreadNetworkManagerInstance checkIfNetworkIsFoundInMDNSScan:borderAgentID:]";
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = 6565;
  *(_WORD *)(a2 + 18) = 2112;
  *(void *)(a2 + 20) = a1;
  OUTLINED_FUNCTION_18_1((void *)&_mh_execute_header, a2, a3, "%s : %d: Network :%@ not found", (uint8_t *)a2);
}

- (void)checkAndUpdateNetworkParamsFromMdnsScan:(uint64_t)a3 borderAgentID:(uint64_t)a4 leaderBorderAgentID:(uint64_t)a5 isNwFound:(uint64_t)a6 numAppleBRs:(uint64_t)a7 numThirdPartyBRs:(uint64_t)a8 isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:.cold.2()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v0, v1, "%s:%d: baIdStrArray is empty, current device is not advertising meshcop? currentBAIdStr=%@", v2, v3, v4, v5, 2u);
}

- (void)checkAndUpdateNetworkParamsFromMdnsScan:borderAgentID:leaderBorderAgentID:isNwFound:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:.cold.3()
{
  v1[0] = 136315650;
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_6_1();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s:%d: currentBAIdStr=%@ is the only apple device advertising meshcop", (uint8_t *)v1, 0x1Cu);
}

- (void)updateMeshcopRelatedParams:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Cannot obtain the leader's extended address", v2, v3, v4, v5, v6);
}

- (void)updateMeshcopRelatedParams:numAppleBRs:numThirdPartyBRs:isLeaderAppleDevice:numThreadNwsFound:shouldRunPeriodicTdm:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "Failed to get the Leader's Extended Address Property", v2, v3, v4, v5, v6);
}

- (void)checkIfMdnsIsPublishedForBAID
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "mDNS record is not discovered", v2, v3, v4, v5, v6);
}

- (void)resetThreadSessionMetrics
{
  threadSessionMetrics = 0;
  qword_1004B6470 = 0;
  *(uint64_t *)((char *)&qword_1004B6478 + 5) = 0;
  qword_1004B6478 = 0;
  xmmword_1004B6488 = 0u;
  *(_OWORD *)&qword_1004B6498 = 0u;
  xmmword_1004B64A8 = 0u;
  uint64_t v3 = (void *)qword_1004B64E8;
  qword_1004B64E8 = @"Regular-Stop";

  xmmword_1004B64C8 = 0u;
  *(_OWORD *)&qword_1004B64D8 = 0u;
  xmmword_1004B64B8 = 0u;
  if (![(ThreadNetworkManagerInstance *)self getThreadSessionStatus])
  {
    [(ThreadNetworkManagerInstance *)self resetMetricsBetweenRoleChanges];
  }
}

- (BOOL)getIsAssociatedFirstTimeAfterThreadStart
{
  return byte_1004B6484;
}

- (void)updateThreadSessionStartTime
{
  threadSessionMetrics = time_ms();
  dword_1004B6480 = 0;
  byte_1004B6484 = 0;
  [(ThreadNetworkManagerInstance *)self resetMetricsBetweenRoleChanges];
  uint64_t v3 = (void *)qword_1004B6510;
  qword_1004B6510 = @"Thread-Session-Start";

  qword_1004B6470 = time_ms();
  qword_1004B6478 = 0;
  mObjectWEDHistory = 0;
  dword_1004B6590 = 0;
  uint64_t v4 = (void *)qword_1004B64E8;
  qword_1004B64E8 = @"Regular-Stop";
}

- (void)setIsAssociatedFirstTimeAfterThreadStart
{
  if ([(ThreadNetworkManagerInstance *)self lastKnownNCPState] == 8
    && ![(ThreadNetworkManagerInstance *)self getIsAssociatedFirstTimeAfterThreadStart])
  {
    qword_1004B6470 = time_ms();
    byte_1004B6484 = 1;
  }
}

- (void)incrementNumberOfRoleChangeInCurrentThreadSession
{
  if (dword_1004B6480 == -1) {
    __break(0x5500u);
  }
  else {
    ++dword_1004B6480;
  }
}

- (BOOL)generateThreadSessionEvent:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(ThreadNetworkManagerInstance *)self getIsAssociatedFirstTimeAfterThreadStart])
  {
LABEL_10:
    uint64_t v5 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = qword_1004B6470 - threadSessionMetrics;
  if (qword_1004B6470 <= (unint64_t)threadSessionMetrics || threadSessionMetrics == 0)
  {
    char v7 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance(RCP2CAMetrics_extension) generateThreadSessionEvent:](v7, v8, v9, v10, v11, v12, v13, v14);
    }

    goto LABEL_10;
  }
LABEL_11:
  unint64_t v15 = time_ms();
  qword_1004B6478 = v15;
  if (v15 <= threadSessionMetrics || threadSessionMetrics == 0) {
    unint64_t v17 = 0;
  }
  else {
    unint64_t v17 = (v15 - threadSessionMetrics) / 0x3E8;
  }
  long long v18 = +[NSMutableDictionary dictionary];
  if (byte_1004B6447 >= 0) {
    uint64_t v19 = &mDaemonVersion;
  }
  else {
    uint64_t v19 = (uint64_t *)mDaemonVersion;
  }
  char v20 = +[NSString stringWithUTF8String:v19];
  [v18 setObject:v20 forKey:@"header_daemon_version"];

  if (byte_1004B645F >= 0) {
    int v21 = &mVendorVersion;
  }
  else {
    int v21 = (uint64_t *)mVendorVersion;
  }
  int v22 = +[NSString stringWithUTF8String:v21];
  [v18 setObject:v22 forKey:@"header_vendor_version"];

  BOOL v23 = +[NSNumber numberWithUnsignedLong:v5];
  [v18 setObject:v23 forKey:@"duration_first_association"];

  NSStringEncoding v24 = +[NSNumber numberWithUnsignedLong:v17];
  [v18 setObject:v24 forKey:@"duration_thread_session"];

  uint64_t v25 = +[NSNumber numberWithUnsignedLong:dword_1004B6480];
  [v18 setObject:v25 forKey:@"role_change_count"];

  [(ThreadNetworkManagerInstance *)self getThreadSessionWEDConnectionHistory:v18];
  std::string v26 = +[NSNumber numberWithUnsignedLongLong:dword_1004B6590];
  [v18 setObject:v26 forKey:@"wed_link_failure_count"];

  if (v3)
  {
    [v18 setObject:@"timer" forKey:@"trigger_type"];
    int v27 = +[NSNumber numberWithUnsignedInt:[(ThreadNetworkManagerInstance *)self getCounterThreadStartFailDueToBluetoothOff]];
    [v18 setObject:v27 forKey:@"BTOff_threadStart_count"];

    id v28 = +[NSNumber numberWithUnsignedInt:[(ThreadNetworkManagerInstance *)self getCounterThreadSessionStoppedDueToBluetoothOff]];
    [v18 setObject:v28 forKey:@"BTOff_threadStop_count"];

    unsigned int v29 = +[NSNumber numberWithUnsignedInt:[(ThreadNetworkManagerInstance *)self getCounterThreadStartFailDueToEscoOn]];
    [v18 setObject:v29 forKey:@"EscoOn_threadStart_count"];

    char v30 = +[NSNumber numberWithUnsignedInt:[(ThreadNetworkManagerInstance *)self getCounterThreadSessionStoppedDueToEscoOn]];
    [v18 setObject:v30 forKey:@"EscoOn_threadStop_count"];

    __int16 v31 = +[NSNumber numberWithUnsignedInt:[(ThreadNetworkManagerInstance *)self getCounterThreadSessionStoppedDueToAPOff]];
    [v18 setObject:v31 forKey:@"APOff_threadStop_count"];
  }
  else
  {
    [v18 setObject:@"event" forKey:@"trigger_type"];
    [v18 setObject:qword_1004B64E8 forKey:@"threadstop_reason"];
    [(ThreadNetworkManagerInstance *)self getCurrentBTWifiLoad:v18];
  }
  uint32_t v32 = +[NSNumber numberWithUnsignedLong:xmmword_1004B6488];
  [v18 setObject:v32 forKey:@"start_pairing_total_count"];

  id v33 = +[NSNumber numberWithUnsignedLong:DWORD1(xmmword_1004B6488)];
  [v18 setObject:v33 forKey:@"start_pairing_success_count"];

  if (xmmword_1004B6488 >= DWORD1(xmmword_1004B6488)) {
    uint64_t v34 = (xmmword_1004B6488 - DWORD1(xmmword_1004B6488));
  }
  else {
    uint64_t v34 = 0;
  }
  uint64_t v35 = +[NSNumber numberWithUnsignedLong:v34];
  [v18 setObject:v35 forKey:@"start_pairing_failure_count"];

  int v36 = +[NSNumber numberWithUnsignedLong:DWORD2(xmmword_1004B6488)];
  [v18 setObject:v36 forKey:@"stop_pairing_total_count"];

  char v37 = +[NSNumber numberWithUnsignedLong:qword_1004B6498 / 0x3E8uLL];
  [v18 setObject:v37 forKey:@"duration_pairing_total"];

  uint64_t v38 = +[NSNumber numberWithUnsignedLong:qword_1004B64A0 / 0x3E8uLL];
  [v18 setObject:v38 forKey:@"duration_pairing_success"];

  id v39 = +[NSNumber numberWithUnsignedLong:xmmword_1004B64B8];
  [v18 setObject:v39 forKey:@"start_fwupdate_total_count"];

  uint64_t v40 = +[NSNumber numberWithUnsignedLong:DWORD1(xmmword_1004B64B8)];
  [v18 setObject:v40 forKey:@"start_fwupdate_success_count"];

  if (xmmword_1004B64B8 >= DWORD1(xmmword_1004B64B8)) {
    uint64_t v41 = (xmmword_1004B64B8 - DWORD1(xmmword_1004B64B8));
  }
  else {
    uint64_t v41 = 0;
  }
  long long v42 = +[NSNumber numberWithUnsignedLong:v41];
  [v18 setObject:v42 forKey:@"start_fwupdate_failure_count"];

  unsigned int v43 = +[NSNumber numberWithUnsignedLong:DWORD2(xmmword_1004B64B8)];
  [v18 setObject:v43 forKey:@"stop_fwupdate_total_count"];

  uint64_t v44 = +[NSNumber numberWithUnsignedLong:(unint64_t)xmmword_1004B64C8 / 0x3E8];
  [v18 setObject:v44 forKey:@"duration_fwupdate_total"];

  char v45 = +[NSNumber numberWithUnsignedLong:*((void *)&xmmword_1004B64C8 + 1) / 0x3E8uLL];
  [v18 setObject:v45 forKey:@"duration_fwupdate_success"];

  [(ThreadNetworkManagerInstance *)self addCommonDimensions:v18];
  id v46 = v18;
  AnalyticsSendEventLazy();
  [(ThreadNetworkManagerInstance *)self resetThreadSessionMetrics];
  [(ThreadNetworkManagerInstance *)self resetThreadSessionWEDConnectionHistory];
  if (v3)
  {
    [(ThreadNetworkManagerInstance *)self resetPeriodicRCP2_threadSessionMetrics];
    threadSessionMetrics = time_ms();
  }

  return 1;
}

id __84__ThreadNetworkManagerInstance_RCP2CAMetrics_extension__generateThreadSessionEvent___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)generateStateInfoEventMetrics
{
  [(ThreadNetworkManagerInstance *)self getNCPState:0];
  if ([(ThreadNetworkManagerInstance *)self lastKnownNCPState] != 8)
  {
    BOOL v3 = +[NSMutableDictionary dictionary];
    if (byte_1004B6447 >= 0) {
      uint64_t v4 = &mDaemonVersion;
    }
    else {
      uint64_t v4 = (uint64_t *)mDaemonVersion;
    }
    uint64_t v5 = +[NSString stringWithUTF8String:v4];
    [v3 setObject:v5 forKey:@"header_daemon_version"];

    if (byte_1004B645F >= 0) {
      uint8_t v6 = &mVendorVersion;
    }
    else {
      uint8_t v6 = (uint64_t *)mVendorVersion;
    }
    char v7 = +[NSString stringWithUTF8String:v6];
    [v3 setObject:v7 forKey:@"header_vendor_version"];

    nl::wpantund::ncp_state_to_string((char *)[(ThreadNetworkManagerInstance *)self lastKnownNCPState], (uint64_t)__p);
    if (v17 >= 0) {
      uint64_t v8 = __p;
    }
    else {
      uint64_t v8 = (void **)__p[0];
    }
    id v9 = +[NSString stringWithUTF8String:v8];
    uint64_t v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", [v9 UTF8String], +[NSString defaultCStringEncoding](NSString, "defaultCStringEncoding"));

    if (v17 < 0) {
      operator delete(__p[0]);
    }
    [v3 setObject:v10 forKey:@"thread_nw_state"];
    uint64_t v11 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      nl::wpantund::ncp_state_to_string((char *)[(ThreadNetworkManagerInstance *)self lastKnownNCPState], (uint64_t)__p);
      if (v17 >= 0) {
        uint64_t v12 = __p;
      }
      else {
        uint64_t v12 = (void **)__p[0];
      }
      id v13 = +[NSString stringWithUTF8String:v12];
      id v14 = [v13 UTF8String];
      *(_DWORD *)long long buf = 136315138;
      id v19 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "TNM:NCPState:%s is not associated.", buf, 0xCu);

      if (v17 < 0) {
        operator delete(__p[0]);
      }
    }

    id v15 = v3;
    AnalyticsSendEventLazy();
  }
}

id __86__ThreadNetworkManagerInstance_RCP2CAMetrics_extension__generateStateInfoEventMetrics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)getCurrentBTWifiLoad:(id)a3
{
  id v4 = a3;
  int v27 = 0;
  std::string::basic_string[abi:ne180100]<0>(buf, "Command success");
  int v24 = 0;
  *(_OWORD *)uint64_t v25 = *(_OWORD *)buf;
  uint64_t v26 = *(void *)&buf[16];
  uint64_t v5 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = v6;

  if (v7)
  {
    uint64_t v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(RCP2CAMetrics_extension) getCurrentBTWifiLoad:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 289;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, " %s:%d: couldn't  get BTWifiLoadinfo as input is Null", buf, 0x12u);
    }
  }
  else
  {
    id v9 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
    std::string::basic_string[abi:ne180100]<0>(__p, "coex:rcp2:btwifi:load");
    if (v9) {
      [v9 getProperty:__p output:&v27];
    }
    else {
      memset(buf, 0, 32);
    }
    int v10 = *CtrXPC::Result::operator=(&v24, (uint64_t)buf);
    if ((char)buf[31] < 0) {
      operator delete(*(void **)&buf[8]);
    }
    if (v23 < 0) {
      operator delete(__p[0]);
    }

    if (!v10)
    {
      if (v27)
      {
        id v21 = xpc_null_create();
        uint64_t v11 = v27;
        if (v27) {
          uint64_t v11 = (placeholder *)(*(uint64_t (**)(placeholder *))(*(void *)v27 + 24))(v27);
        }
        v20.id var0 = v11;
        convert_ValMap_to_xpc_object(&v20, "coex:rcp2:btwifi:load", "PropGet", (xpc_object_t *)buf);
        id v12 = *(id *)buf;
        xpc_object_t v13 = xpc_null_create();
        id v14 = *(void **)buf;
        *(void *)long long buf = v13;

        id v15 = v21;
        id v21 = v12;

        char v16 = *(void **)buf;
        *(void *)long long buf = 0;

        if (v20.var0) {
          (*(void (**)(placeholder *))(*(void *)v20.var0 + 8))(v20.var0);
        }
        *(void *)long long buf = &v21;
        *(void *)&buf[8] = "value";
        char v17 = xpc::dict::object_proxy::operator*((uint64_t)buf);
        CAMetricsHandlers_handle_getprop_BTWifiLoadInfo(v17, v4);

        id v18 = v21;
        id v21 = 0;
      }
      else
      {
        id v19 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(RCP2CAMetrics_extension) getCurrentBTWifiLoad:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 303;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, " %s:%d: couldn't  get BTWifiLoadinfo as ValMap is empty", buf, 0x12u);
        }
      }
    }
  }
  if (SHIBYTE(v26) < 0) {
    operator delete(v25[0]);
  }
  if (v27) {
    (*(void (**)(placeholder *))(*(void *)v27 + 8))(v27);
  }
}

- (void)CAgetCoexCounter
{
  uint64_t v7 = 0;
  uint64_t v2 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(v5, "vendor:coex:rcp2:counters");
  if (v2)
  {
    [v2 getProperty:v5 output:&v7];
    BOOL v3 = LODWORD(__p[0]) == 0;
    if (SHIBYTE(__p[3]) < 0) {
      operator delete(__p[1]);
    }
  }
  else
  {
    memset(__p, 0, 32);
    BOOL v3 = 1;
  }
  if (v6 < 0) {
    operator delete(v5[0]);
  }

  if (!v3)
  {
    id v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p[0]) = 136315394;
      *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance(RCP2CAMetrics_extension) CAgetCoexCounter]";
      WORD2(__p[1]) = 1024;
      *(_DWORD *)((char *)&__p[1] + 6) = 314;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, " %s:%d: fail to get coex state counters", (uint8_t *)__p, 0x12u);
    }
  }
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
}

- (void)updateThreadSessionmetrics:(id)a3 previousNodeType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(RCP2CAMetrics_extension) updateThreadSessionmetrics:previousNodeType:]";
    __int16 v26 = 1024;
    int v27 = 322;
    __int16 v28 = 2080;
    id v29 = [v7 UTF8String];
    __int16 v30 = 2080;
    id v31 = [v6 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s:%d:previous role : %s, current role : %s.", buf, 0x26u);
  }

  [(ThreadNetworkManagerInstance *)self getNCPState:0];
  id v9 = v6;
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)[v9 UTF8String]);
  int v10 = nl::wpantund::string_to_node_type(buf);
  if (SBYTE3(v29) < 0) {
    operator delete(*(void **)buf);
  }
  [(ThreadNetworkManagerInstance *)self setIsAssociatedFirstTimeAfterThreadStart];
  [(ThreadNetworkManagerInstance *)self generateStateInfoEventMetrics];
  [(ThreadNetworkManagerInstance *)self getNCPState:0];
  if ([(ThreadNetworkManagerInstance *)self lastKnownNCPState] == 8 && v10)
  {
    if ([(ThreadNetworkManagerInstance *)self lastKnownNCPState] != 8) {
      goto LABEL_21;
    }
    if (byte_1004B6500)
    {
      uint64_t v11 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = [v7 UTF8String];
        id v13 = [v9 UTF8String];
        *(_DWORD *)long long buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(RCP2CAMetrics_extension) updateThreadSessionmetrics:previousNodeType:]";
        __int16 v26 = 1024;
        int v27 = 362;
        __int16 v28 = 2080;
        id v29 = v12;
        __int16 v30 = 2080;
        id v31 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s:%d:Because of no intermediate transition notification, skipping role transition CA event where previous role : %s, current role : %s.", buf, 0x26u);
      }
    }
    else
    {
      mThreadInfoBetweenRoles = time_ms();
      v24[0] = qword_1004B6510;
      v24[1] = @"->";
      v24[2] = v9;
      id v18 = +[NSArray arrayWithObjects:v24 count:3];
      uint64_t v19 = [v18 componentsJoinedByString:@" "];
      any v20 = (void *)qword_1004B6508;
      qword_1004B6508 = v19;

      [(ThreadNetworkManagerInstance *)self getMetricsBetweenRoleChanges];
      byte_1004B6500 = 1;
    }
    objc_storeStrong((id *)&qword_1004B6518, (id)qword_1004B6510);
    id v23 = v9;
    char v17 = +[NSArray arrayWithObjects:&v23 count:1];
    uint64_t v21 = [v17 componentsJoinedByString:&stru_1004A31D0];
    int v22 = (void *)qword_1004B6510;
    qword_1004B6510 = v21;
  }
  else
  {
    if (byte_1004B6500)
    {
      unint64_t v14 = time_ms();
      unint64_t v15 = 0;
      qword_1004B64F8 = v14;
      byte_1004B6500 = 0;
      if (v14 > mThreadInfoBetweenRoles && mThreadInfoBetweenRoles) {
        unint64_t v15 = (v14 - mThreadInfoBetweenRoles) / 0x3E8;
      }
      qword_1004B6520 = v15;
      mThreadInfoBetweenRoles = 0;
    }
    id v16 = (id)qword_1004B6510;
    char v17 = (void *)qword_1004B6518;
    qword_1004B6518 = (uint64_t)v16;
  }

LABEL_21:
  if ((v10 & 0xFFFFFFFD) != 0)
  {
    [(ThreadNetworkManagerInstance *)self CAgetCoexCounter];
    [(ThreadNetworkManagerInstance *)self configureCAMetrics:0];
    [(ThreadNetworkManagerInstance *)self incrementNumberOfRoleChangeInCurrentThreadSession];
  }
}

- (id)CAgetPrevValidDeviceRole
{
  if (qword_1004B6518) {
    uint64_t v2 = (__CFString *)(id)qword_1004B6518;
  }
  else {
    uint64_t v2 = @"NA";
  }

  return v2;
}

- (void)configureCAMetrics:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = 0;
  uint64_t v5 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(v12, "ca:reporting:enabled");
  if (v5)
  {
    [v5 getProperty:v12 output:&v14];
    BOOL v6 = LODWORD(__p[0]) == 0;
    if (SHIBYTE(__p[3]) < 0) {
      operator delete(__p[1]);
    }
  }
  else
  {
    memset(__p, 0, 32);
    BOOL v6 = 1;
  }
  if (v13 < 0) {
    operator delete(v12[0]);
  }

  if (!v6)
  {
    id v7 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p[0]) = 136315394;
      *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance(RCP2CAMetrics_extension) configureCAMetrics:]";
      WORD2(__p[1]) = 1024;
      *(_DWORD *)((char *)&__p[1] + 6) = 394;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s:%d: Failed to get kWPANTUNDProperty_CoreAnalyticsReporting Property", (uint8_t *)__p, 0x12u);
    }
  }
  if (any_to_BOOL((const boost::any *)&v14))
  {
    if ([(ThreadNetworkManagerInstance *)self getThreadSessionStatus])
    {
      uint64_t v8 = +[NSMutableDictionary dictionary];
      id v9 = +[NSMutableDictionary dictionary];
      int v10 = +[NSMutableDictionary dictionary];
      [(ThreadNetworkManagerInstance *)self updateInternalDBForCommonDimensions:v8 coexCntrsDict:v10 coexDict:v9];
      [(ThreadNetworkManagerInstance *)self getAllMacMetrics];
      [(ThreadNetworkManagerInstance *)self getIPMLEMetrics:v8];
      [(ThreadNetworkManagerInstance *)self getRCP2CoexMetrics:v3];
      [(ThreadNetworkManagerInstance *)self getStreamRawResponseHistogramMetric:v3];
      [(ThreadNetworkManagerInstance *)self getNetworkRadioHistogramMetrics:v3];
      [(ThreadNetworkManagerInstance *)self resetMacMetrics];
      [(ThreadNetworkManagerInstance *)self resetIPMLEMetrics];
      [(ThreadNetworkManagerInstance *)self resetRCP2CoexMetrics];
      [(ThreadNetworkManagerInstance *)self resetStreamRawResponseHistogramMetrics];
    }
    if (v3) {
      [(ThreadNetworkManagerInstance *)self generateThreadSessionEvent:1];
    }
  }
  else
  {
    uint64_t v11 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "CA Reporting Disabled ", (uint8_t *)__p, 2u);
    }
  }
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  }
}

- (void)resetRCP2CoexMetrics
{
  std::string::basic_string[abi:ne180100]<0>(__p, "Command success");
  int v8 = 0;
  *(_OWORD *)id v9 = *(_OWORD *)__p;
  int v10 = __p[2];
  BOOL v3 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(v6, "vendor:coex:rcp2:state:table:reset");
  if (v3) {
    objc_msgSend(v3, "setProperty:property_val:", v6, "0");
  }
  else {
    memset(__p, 0, 32);
  }
  int v4 = *CtrXPC::Result::operator=(&v8, (uint64_t)__p);
  if (SHIBYTE(__p[3]) < 0) {
    operator delete(__p[1]);
  }
  if (v7 < 0) {
    operator delete(v6[0]);
  }

  if (!v4)
  {
    uint64_t v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p[0]) = 136315394;
      *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance(RCP2CAMetrics_extension) resetRCP2CoexMetrics]";
      WORD2(__p[1]) = 1024;
      *(_DWORD *)((char *)&__p[1] + 6) = 440;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Reset kWPANTUNDVendor_CoEx_RCP2_State_Table_Reset stats", (uint8_t *)__p, 0x12u);
    }
  }
  if (SHIBYTE(v10) < 0) {
    operator delete(v9[0]);
  }
}

- (void)getRCP2CoexMetrics:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[NSMutableDictionary dictionary];
  std::string::basic_string[abi:ne180100]<0>(buf, "Command success");
  int v28 = 0;
  *(_OWORD *)id v29 = *(_OWORD *)buf;
  uint64_t v30 = *(void *)&buf[16];
  id v27 = xpc_null_create();
  if (byte_1004B6447 >= 0) {
    BOOL v6 = &mDaemonVersion;
  }
  else {
    BOOL v6 = (uint64_t *)mDaemonVersion;
  }
  char v7 = +[NSString stringWithUTF8String:v6];
  [v5 setObject:v7 forKey:@"header_daemon_version"];

  if (byte_1004B645F >= 0) {
    int v8 = &mVendorVersion;
  }
  else {
    int v8 = (uint64_t *)mVendorVersion;
  }
  id v9 = +[NSString stringWithUTF8String:v8];
  [v5 setObject:v9 forKey:@"header_vendor_version"];

  __int16 v26 = 0;
  int v10 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(__p, "coex:rcp2:coex:counters:asvalmap");
  if (v10) {
    [v10 getProperty:__p output:&v26];
  }
  else {
    memset(buf, 0, 32);
  }
  int v11 = *CtrXPC::Result::operator=(&v28, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v25 < 0) {
    operator delete(__p[0]);
  }

  if (!v11)
  {
    id v12 = v26;
    if (v26) {
      id v12 = (placeholder *)(*(uint64_t (**)(placeholder *))(*(void *)v26 + 24))(v26);
    }
    v23.id var0 = v12;
    convert_ValMap_to_xpc_object(&v23, "coex:rcp2:coex:counters:asvalmap", "PropGet", (xpc_object_t *)buf);
    id v13 = *(id *)buf;
    xpc_object_t v14 = xpc_null_create();
    unint64_t v15 = *(void **)buf;
    *(void *)long long buf = v14;

    id v16 = v27;
    id v27 = v13;

    char v17 = *(void **)buf;
    *(void *)long long buf = 0;

    if (v23.var0) {
      (*(void (**)(placeholder *))(*(void *)v23.var0 + 8))(v23.var0);
    }
    id v18 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(RCP2CAMetrics_extension) getRCP2CoexMetrics:]";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 458;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, " %s:%d: kWPANTUNDValueMapKey_CoEx_RCP2_Counters_AsValMap Property", buf, 0x12u);
    }

    *(void *)long long buf = &v27;
    *(void *)&buf[8] = "value";
    uint64_t v19 = xpc::dict::object_proxy::operator*((uint64_t)buf);
    CAMetricsHandlers_handle_getprop_vendorcoex_RCP2_counters(v19, v5);
  }
  if (v3) {
    CFStringRef v20 = @"timer";
  }
  else {
    CFStringRef v20 = @"event";
  }
  [v5 setObject:v20 forKey:@"trigger_type"];
  [(ThreadNetworkManagerInstance *)self addCommonDimensions:v5];
  id v21 = v5;
  AnalyticsSendEventLazy();

  [(ThreadNetworkManagerInstance *)self resetRCP2CoexMetrics];
  if (v26) {
    (*(void (**)(placeholder *))(*(void *)v26 + 8))(v26);
  }
  id v22 = v27;
  id v27 = 0;

  if (SHIBYTE(v30) < 0) {
    operator delete(v29[0]);
  }
}

id __76__ThreadNetworkManagerInstance_RCP2CAMetrics_extension__getRCP2CoexMetrics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)resetMetricsBetweenRoleChanges
{
  mThreadInfoBetweenRoles = 0;
  qword_1004B64F8 = 0;
  byte_1004B6500 = 0;
  uint64_t v2 = (void *)qword_1004B6518;
  qword_1004B6518 = @"unknown";
  qword_1004B6520 = 0;

  BOOL v3 = (void *)qword_1004B6510;
  qword_1004B6510 = @"unknown";
}

- (void)getMetricsBetweenRoleChanges
{
  BOOL v3 = +[NSMutableDictionary dictionary];
  if (byte_1004B6447 >= 0) {
    int v4 = &mDaemonVersion;
  }
  else {
    int v4 = (uint64_t *)mDaemonVersion;
  }
  uint64_t v5 = +[NSString stringWithUTF8String:v4];
  [v3 setObject:v5 forKey:@"header_daemon_version"];

  if (byte_1004B645F >= 0) {
    BOOL v6 = &mVendorVersion;
  }
  else {
    BOOL v6 = (uint64_t *)mVendorVersion;
  }
  char v7 = +[NSString stringWithUTF8String:v6];
  [v3 setObject:v7 forKey:@"header_vendor_version"];

  if (mThreadInfoBetweenRoles < (unint64_t)qword_1004B64F8)
  {
    __break(0x5515u);
    return;
  }
  if (mThreadInfoBetweenRoles == qword_1004B64F8 || qword_1004B64F8 == 0) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = mThreadInfoBetweenRoles - qword_1004B64F8;
  }
  int v10 = +[NSNumber numberWithUnsignedLongLong:v9];
  [v3 setObject:v10 forKey:@"duration_role_detach_to_attach"];

  int v11 = +[NSNumber numberWithUnsignedLongLong:qword_1004B6520];
  [v3 setObject:v11 forKey:@"duration_prev_role"];

  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[(id)qword_1004B6508 UTF8String]);
  if (v23 < 0)
  {
    if (__p[1])
    {
      id v12 = (void **)__p[0];
      goto LABEL_19;
    }
LABEL_20:
    [v3 setObject:@"NA" forKey:@"from_to_role"];
    id v13 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(ThreadNetworkManagerInstance(RCP2CAMetrics_extension) *)v13 getMetricsBetweenRoleChanges];
    }
    goto LABEL_22;
  }
  if (!v23) {
    goto LABEL_20;
  }
  id v12 = __p;
LABEL_19:
  id v13 = +[NSString stringWithUTF8String:v12];
  [v3 setObject:v13 forKey:@"from_to_role"];
LABEL_22:

  [(ThreadNetworkManagerInstance *)self addCommonDimensions:v3];
  id v21 = v3;
  AnalyticsSendEventLazy();

  if (v23 < 0) {
    operator delete(__p[0]);
  }
}

id __85__ThreadNetworkManagerInstance_RCP2CAMetrics_extension__getMetricsBetweenRoleChanges__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (unsigned)getCounterThreadStartFailDueToBluetoothOff
{
  return mCountThreadStartFailBTOff;
}

- (void)incrementCounterThreadStartFailDueToBluetoothOff
{
  if (mCountThreadStartFailBTOff == -1)
  {
    __break(0x5500u);
  }
  else
  {
    ++mCountThreadStartFailBTOff;
    [(ThreadNetworkManagerInstance *)self getThreadSessionRejectInfoMetrics:@"BT-Off"];
  }
}

- (void)resetCounterThreadStartFailDueToBluetoothOff
{
  mCountThreadStartFailBTOff = 0;
}

- (unsigned)getCounterThreadStartFailDueToEscoOn
{
  return mCountThreadStartFailEscoOn;
}

- (void)incrementCounterThreadStartFailDueToEscoOn
{
  if (mCountThreadStartFailEscoOn == -1)
  {
    __break(0x5500u);
  }
  else
  {
    ++mCountThreadStartFailEscoOn;
    [(ThreadNetworkManagerInstance *)self getThreadSessionRejectInfoMetrics:@"BT-AudioCall"];
  }
}

- (void)resetCounterThreadStartFailDueToEscoOn
{
  mCountThreadStartFailEscoOn = 0;
}

- (unsigned)getCounterThreadSessionStoppedDueToBluetoothOff
{
  return mCountThreadSessionStoppedBTOff;
}

- (void)incrementCounterThreadSessionStoppedDueToBluetoothOff
{
  if (mCountThreadSessionStoppedBTOff == -1)
  {
    __break(0x5500u);
  }
  else
  {
    ++mCountThreadSessionStoppedBTOff;
    [(ThreadNetworkManagerInstance *)self updateThreadSessionStopReason:@"BT-Off"];
  }
}

- (void)resetCounterThreadSessionStoppedDueToBluetoothOff
{
  mCountThreadSessionStoppedBTOff = 0;
}

- (unsigned)getCounterThreadSessionStoppedDueToEscoOn
{
  return mCountThreadSessionStopEscoOn;
}

- (void)incrementCounterThreadSessionStoppedDueToEscoOn
{
  if (mCountThreadSessionStopEscoOn == -1)
  {
    __break(0x5500u);
  }
  else
  {
    ++mCountThreadSessionStopEscoOn;
    [(ThreadNetworkManagerInstance *)self updateThreadSessionStopReason:@"BT-AudioCall"];
  }
}

- (void)resetCounterThreadSessionStoppedDueToEscoOn
{
  mCountThreadSessionStopEscoOn = 0;
}

- (unsigned)getCounterThreadSessionStoppedDueToAPOff
{
  return mCountThreadSessionStopAPOff;
}

- (void)incrementCounterThreadSessionStoppedDueToAPOff
{
  if (mCountThreadSessionStopAPOff == -1)
  {
    __break(0x5500u);
  }
  else
  {
    ++mCountThreadSessionStopAPOff;
    [(ThreadNetworkManagerInstance *)self updateThreadSessionStopReason:@"AP-Down"];
  }
}

- (void)resetCounterThreadSessionStoppedDueToAPOff
{
  mCountThreadSessionStopAPOff = 0;
}

- (void)resetPeriodicRCP2_threadSessionMetrics
{
  [(ThreadNetworkManagerInstance *)self resetCounterThreadSessionStoppedDueToBluetoothOff];
  [(ThreadNetworkManagerInstance *)self resetCounterThreadStartFailDueToBluetoothOff];
  [(ThreadNetworkManagerInstance *)self resetCounterThreadSessionStoppedDueToEscoOn];
  [(ThreadNetworkManagerInstance *)self resetCounterThreadStartFailDueToEscoOn];

  [(ThreadNetworkManagerInstance *)self resetCounterThreadSessionStoppedDueToAPOff];
}

- (void)getThreadSessionWEDConnectionHistory:(id)a3
{
  id v7 = a3;
  BOOL v3 = +[NSNumber numberWithUnsignedInt:mObjectWEDHistory];
  [v7 setObject:v3 forKey:@"wed_total_conn_req_count"];

  int v4 = +[NSNumber numberWithUnsignedInt:HIDWORD(mObjectWEDHistory)];
  [v7 setObject:v4 forKey:@"wed_conn_req_success_count"];

  if (mObjectWEDHistory >= HIDWORD(mObjectWEDHistory)) {
    uint64_t v5 = (mObjectWEDHistory - HIDWORD(mObjectWEDHistory));
  }
  else {
    uint64_t v5 = 0;
  }
  BOOL v6 = +[NSNumber numberWithUnsignedInt:v5];
  [v7 setObject:v6 forKey:@"wed_conn_req_fail_count"];
}

- (void)resetThreadSessionWEDConnectionHistory
{
  mObjectWEDHistory = 0;
  dword_1004B6590 = 0;
}

- (void)resetStreamRawResponseHistogramMetrics
{
  std::string::basic_string[abi:ne180100]<0>(__p, "Command success");
  int v8 = 0;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)__p;
  int v10 = __p[2];
  BOOL v3 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(v6, "streamRawRespTimeHistReset");
  if (v3) {
    objc_msgSend(v3, "setProperty:property_val:", v6, "0");
  }
  else {
    memset(__p, 0, 32);
  }
  int v4 = *CtrXPC::Result::operator=(&v8, (uint64_t)__p);
  if (SHIBYTE(__p[3]) < 0) {
    operator delete(__p[1]);
  }
  if (v7 < 0) {
    operator delete(v6[0]);
  }

  if (!v4)
  {
    uint64_t v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p[0]) = 136315394;
      *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance(RCP2CAMetrics_extension) resetStreamRawResponseHistogramMetrics]";
      WORD2(__p[1]) = 1024;
      *(_DWORD *)((char *)&__p[1] + 6) = 686;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Reset kWPANTUNDProperty_StreamRawResponseTime_Histogram_Reset stats", (uint8_t *)__p, 0x12u);
    }
  }
  if (SHIBYTE(v10) < 0) {
    operator delete(v9[0]);
  }
}

- (void)getStreamRawResponseHistogramMetric:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[NSMutableDictionary dictionary];
  std::string::basic_string[abi:ne180100]<0>(buf, "Command success");
  int v28 = 0;
  *(_OWORD *)id v29 = *(_OWORD *)buf;
  uint64_t v30 = *(void *)&buf[16];
  id v27 = xpc_null_create();
  if (byte_1004B6447 >= 0) {
    BOOL v6 = &mDaemonVersion;
  }
  else {
    BOOL v6 = (uint64_t *)mDaemonVersion;
  }
  char v7 = +[NSString stringWithUTF8String:v6];
  [v5 setObject:v7 forKey:@"header_daemon_version"];

  if (byte_1004B645F >= 0) {
    int v8 = &mVendorVersion;
  }
  else {
    int v8 = (uint64_t *)mVendorVersion;
  }
  uint64_t v9 = +[NSString stringWithUTF8String:v8];
  [v5 setObject:v9 forKey:@"header_vendor_version"];

  __int16 v26 = 0;
  int v10 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(__p, "streamRawRespTimeHist");
  if (v10) {
    [v10 getProperty:__p output:&v26];
  }
  else {
    memset(buf, 0, 32);
  }
  int v11 = *CtrXPC::Result::operator=(&v28, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v25 < 0) {
    operator delete(__p[0]);
  }

  if (!v11)
  {
    id v12 = v26;
    if (v26) {
      id v12 = (placeholder *)(*(uint64_t (**)(placeholder *))(*(void *)v26 + 24))(v26);
    }
    v23.id var0 = v12;
    convert_ValMap_to_xpc_object(&v23, "streamRawRespTimeHist", "PropGet", (xpc_object_t *)buf);
    id v13 = *(id *)buf;
    xpc_object_t v14 = xpc_null_create();
    uint64_t v15 = *(void **)buf;
    *(void *)long long buf = v14;

    id v16 = v27;
    id v27 = v13;

    uint64_t v17 = *(void **)buf;
    *(void *)long long buf = 0;

    if (v23.var0) {
      (*(void (**)(placeholder *))(*(void *)v23.var0 + 8))(v23.var0);
    }
    uint64_t v18 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(RCP2CAMetrics_extension) getStreamRawResponseHistogramMetric:]";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 704;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, " %s:%d: kWPANTUNDProperty_StreamRawResponseTime_Histogram Property", buf, 0x12u);
    }

    *(void *)long long buf = &v27;
    *(void *)&buf[8] = "value";
    uint64_t v19 = xpc::dict::object_proxy::operator*((uint64_t)buf);
    CAMetricsHandlers_handle_getprop_streamraw_respTime_RCP2_hist(v19, v5);
  }
  if (v3) {
    CFStringRef v20 = @"timer";
  }
  else {
    CFStringRef v20 = @"event";
  }
  [v5 setObject:v20 forKey:@"trigger_type"];
  [(ThreadNetworkManagerInstance *)self addCommonDimensions:v5];
  id v21 = v5;
  AnalyticsSendExplodingEventLazy();

  [(ThreadNetworkManagerInstance *)self resetStreamRawResponseHistogramMetrics];
  if (v26) {
    (*(void (**)(placeholder *))(*(void *)v26 + 8))(v26);
  }
  id v22 = v27;
  id v27 = 0;

  if (SHIBYTE(v30) < 0) {
    operator delete(v29[0]);
  }
}

id __93__ThreadNetworkManagerInstance_RCP2CAMetrics_extension__getStreamRawResponseHistogramMetric___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)getNetworkRadioHistogramMetrics:(BOOL)a3
{
  int v4 = +[NSMutableDictionary dictionary];
  std::string::basic_string[abi:ne180100]<0>(buf, "Command success");
  int v26 = 0;
  *(_OWORD *)id v27 = *(_OWORD *)buf;
  uint64_t v28 = *(void *)&buf[16];
  id v25 = xpc_null_create();
  if (byte_1004B6447 >= 0) {
    uint64_t v5 = &mDaemonVersion;
  }
  else {
    uint64_t v5 = (uint64_t *)mDaemonVersion;
  }
  BOOL v6 = +[NSString stringWithUTF8String:v5];
  [v4 setObject:v6 forKey:@"header_daemon_version"];

  if (byte_1004B645F >= 0) {
    char v7 = &mVendorVersion;
  }
  else {
    char v7 = (uint64_t *)mVendorVersion;
  }
  int v8 = +[NSString stringWithUTF8String:v7];
  [v4 setObject:v8 forKey:@"header_vendor_version"];

  int v24 = 0;
  uint64_t v9 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(__p, "vendor:MAC:packet:RSSIHistogram:AsValMap");
  if (v9) {
    [v9 getProperty:__p output:&v24];
  }
  else {
    memset(buf, 0, 32);
  }
  int v10 = *CtrXPC::Result::operator=(&v26, (uint64_t)buf);
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  if (v23 < 0) {
    operator delete(__p[0]);
  }

  if (!v10)
  {
    int v11 = v24;
    if (v24) {
      int v11 = (placeholder *)(*(uint64_t (**)(placeholder *))(*(void *)v24 + 24))(v24);
    }
    v21.id var0 = v11;
    convert_ValMap_to_xpc_object(&v21, "vendor:MAC:packet:RSSIHistogram:AsValMap", "PropGet", (xpc_object_t *)buf);
    id v12 = *(id *)buf;
    xpc_object_t v13 = xpc_null_create();
    xpc_object_t v14 = *(void **)buf;
    *(void *)long long buf = v13;

    id v15 = v25;
    id v25 = v12;

    id v16 = *(void **)buf;
    *(void *)long long buf = 0;

    if (v21.var0) {
      (*(void (**)(placeholder *))(*(void *)v21.var0 + 8))(v21.var0);
    }
    uint64_t v17 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(RCP2CAMetrics_extension) getNetworkRadioHistogramMetrics:]";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 747;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s:%d: kWPANTUNDVendor_Neighbor_RSSI_HistogramAsValMap Property", buf, 0x12u);
    }

    *(void *)long long buf = &v25;
    *(void *)&buf[8] = "value";
    uint64_t v18 = xpc::dict::object_proxy::operator*((uint64_t)buf);
    CAMetricsHandlers_handle_getprop_nbrRssi(v18, v4);
  }
  [(ThreadNetworkManagerInstance *)self addCommonDimensions:v4];
  id v19 = v4;
  AnalyticsSendExplodingEventLazy();

  [(ThreadNetworkManagerInstance *)self resetNetworkRadioHistogramMetrics];
  if (v24) {
    (*(void (**)(placeholder *))(*(void *)v24 + 8))(v24);
  }
  id v20 = v25;
  id v25 = 0;

  if (SHIBYTE(v28) < 0) {
    operator delete(v27[0]);
  }
}

id __89__ThreadNetworkManagerInstance_RCP2CAMetrics_extension__getNetworkRadioHistogramMetrics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)resetNetworkRadioHistogramMetrics
{
  std::string::basic_string[abi:ne180100]<0>(__p, "Command success");
  int v8 = 0;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)__p;
  int v10 = __p[2];
  BOOL v3 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
  std::string::basic_string[abi:ne180100]<0>(v6, "vendor:MAC:packet:RSSIHistogram");
  if (v3) {
    objc_msgSend(v3, "setProperty:property_val:", v6, "0");
  }
  else {
    memset(__p, 0, 32);
  }
  int v4 = *CtrXPC::Result::operator=(&v8, (uint64_t)__p);
  if (SHIBYTE(__p[3]) < 0) {
    operator delete(__p[1]);
  }
  if (v7 < 0) {
    operator delete(v6[0]);
  }

  if (!v4)
  {
    uint64_t v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p[0]) = 136315394;
      *(void **)((char *)__p + 4) = "-[ThreadNetworkManagerInstance(RCP2CAMetrics_extension) resetNetworkRadioHistogramMetrics]";
      WORD2(__p[1]) = 1024;
      *(_DWORD *)((char *)&__p[1] + 6) = 774;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s:%d: Reset kWPANTUNDVendor_Neighbor_RSSI_Histogram stats", (uint8_t *)__p, 0x12u);
    }
  }
  if (SHIBYTE(v10) < 0) {
    operator delete(v9[0]);
  }
}

- (void)noteTimeWhenWEDAttachStart:(id)a3
{
  id v4 = a3;
  if ((id)qword_1004B6580 != v4 && byte_1004B6578 == 0)
  {
    id v6 = v4;
    byte_1004B6578 = 0;
    *(void *)&currentWEDInfo = time_ms();
    objc_storeStrong((id *)&qword_1004B6580, a3);
    id v4 = v6;
  }
}

- (void)noteTimeWhenWEDAttachCompleteSuccessOrFail:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v4 = time_ms();
  *((void *)&currentWEDInfo + 1) = v4;
  if (!v3)
  {
    byte_1004B6578 = 0;
    qword_1004B6560 = 0;
    if (v4 >= (unint64_t)currentWEDInfo)
    {
      qword_1004B6568 = v4 - currentWEDInfo;
      uint64_t v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v8 = 136315394;
        uint64_t v9 = "-[ThreadNetworkManagerInstance(RCP2CAMetrics_extension) noteTimeWhenWEDAttachCompleteSuccessOrFail:]";
        __int16 v10 = 1024;
        int v11 = 823;
        id v6 = "%s:%d: WED Attach failed";
        goto LABEL_8;
      }
LABEL_9:

      return;
    }
    __break(0x5515u);
    goto LABEL_15;
  }
  if (v4 < (unint64_t)currentWEDInfo)
  {
    uint64_t v5 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[ThreadNetworkManagerInstance(RCP2CAMetrics_extension) noteTimeWhenWEDAttachCompleteSuccessOrFail:]";
      __int16 v10 = 1024;
      int v11 = 814;
      id v6 = "%s:%d: WED Attach Sucessfull time less than Attach time.";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v8, 0x12u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  qword_1004B6560 = v4 - currentWEDInfo;
  qword_1004B6568 = 0;
  int v7 = 1;
  byte_1004B6578 = 1;
  if (HIDWORD(mObjectWEDHistory))
  {
    int v7 = HIDWORD(mObjectWEDHistory) + 1;
    if (HIDWORD(mObjectWEDHistory) == -1)
    {
LABEL_15:
      __break(0x5500u);
      return;
    }
  }
  HIDWORD(mObjectWEDHistory) = v7;
}

- (void)noteTimeWhenWEDDetachStart
{
  if ((void)currentWEDInfo) {
    qword_1004B6550 = time_ms();
  }
}

- (void)noteTimeWhenWEDDetachCompleteSuccessOrFail:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = time_ms();
  qword_1004B6558 = v5;
  if (v5 < qword_1004B6550)
  {
    id v6 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      int v8 = "-[ThreadNetworkManagerInstance(RCP2CAMetrics_extension) noteTimeWhenWEDDetachCompleteSuccessOrFail:]";
      __int16 v9 = 1024;
      int v10 = 856;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s:%d: WED Detach time less than Attach time.", (uint8_t *)&v7, 0x12u);
    }

    goto LABEL_10;
  }
  byte_1004B6578 = 0;
  if (v3)
  {
    if (v5 >= (unint64_t)currentWEDInfo)
    {
      qword_1004B6570 = v5 - currentWEDInfo;
LABEL_10:
      [(ThreadNetworkManagerInstance *)self getCurrentWEDInfoMetrics];
      return;
    }
  }
  else if (v5 >= (unint64_t)currentWEDInfo)
  {
    qword_1004B6568 = v5 - currentWEDInfo;
    goto LABEL_10;
  }
  __break(0x5515u);
}

- (void)noteTimeWhenAttachDetachCompleteSuccessOrFail:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ThreadNetworkManagerInstance *)self wedAttachRequest])
  {
    [(ThreadNetworkManagerInstance *)self noteTimeWhenWEDAttachCompleteSuccessOrFail:v3];
  }
  else
  {
    [(ThreadNetworkManagerInstance *)self noteTimeWhenWEDDetachCompleteSuccessOrFail:v3];
  }
}

- (void)updateLinkFailureCount
{
  if (!dword_1004B6590) {
    goto LABEL_4;
  }
  int v2 = dword_1004B6590 + 1;
  if (dword_1004B6590 == -1)
  {
    __break(0x5500u);
LABEL_4:
    int v2 = 1;
  }
  dword_1004B6590 = v2;
}

- (void)updateWEDConnectionCount
{
  if (!mObjectWEDHistory) {
    goto LABEL_4;
  }
  int v2 = mObjectWEDHistory + 1;
  if (mObjectWEDHistory == -1)
  {
    __break(0x5500u);
LABEL_4:
    int v2 = 1;
  }
  LODWORD(mObjectWEDHistory) = v2;
}

- (void)resetCurrentWEDInfoMetrics
{
  qword_1004B6560 = 0;
  qword_1004B6568 = 0;
  byte_1004B6578 = 0;
  qword_1004B6570 = 0;
  int v2 = (void *)qword_1004B6580;
  qword_1004B6580 = 0;

  currentWEDInfo = 0u;
  *(_OWORD *)&qword_1004B6550 = 0u;
}

- (void)getCurrentWEDInfoMetrics
{
  BOOL v3 = +[NSMutableDictionary dictionary];
  if (byte_1004B6447 >= 0) {
    unint64_t v4 = &mDaemonVersion;
  }
  else {
    unint64_t v4 = (uint64_t *)mDaemonVersion;
  }
  unint64_t v5 = +[NSString stringWithUTF8String:v4];
  [v3 setObject:v5 forKey:@"header_daemon_version"];

  if (byte_1004B645F >= 0) {
    id v6 = &mVendorVersion;
  }
  else {
    id v6 = (uint64_t *)mVendorVersion;
  }
  int v7 = +[NSString stringWithUTF8String:v6];
  [v3 setObject:v7 forKey:@"header_vendor_version"];

  int v8 = +[NSNumber numberWithUnsignedLongLong:qword_1004B6560];
  [v3 setObject:v8 forKey:@"wed_duration_to_attach"];

  __int16 v9 = +[NSNumber numberWithUnsignedLongLong:qword_1004B6570 / 0x3E8uLL];
  [v3 setObject:v9 forKey:@"wed_duration_attach_to_detach"];

  int v10 = +[NSNumber numberWithUnsignedLongLong:qword_1004B6568];
  [v3 setObject:v10 forKey:@"wed_duration_attach_connectionfail"];

  [(ThreadNetworkManagerInstance *)self addCommonDimensions:v3];
  id v11 = v3;
  AnalyticsSendEventLazy();
  [(ThreadNetworkManagerInstance *)self resetCurrentWEDInfoMetrics];
}

id __81__ThreadNetworkManagerInstance_RCP2CAMetrics_extension__getCurrentWEDInfoMetrics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)getBTWifiLoadInfoEvent:(any)a3
{
  unint64_t v5 = +[NSMutableDictionary dictionary];
  if (byte_1004B6447 >= 0) {
    id v6 = &mDaemonVersion;
  }
  else {
    id v6 = (uint64_t *)mDaemonVersion;
  }
  int v7 = +[NSString stringWithUTF8String:v6];
  [v5 setObject:v7 forKey:@"header_daemon_version"];

  if (byte_1004B645F >= 0) {
    int v8 = &mVendorVersion;
  }
  else {
    int v8 = (uint64_t *)mVendorVersion;
  }
  __int16 v9 = +[NSString stringWithUTF8String:v8];
  [v5 setObject:v9 forKey:@"header_vendor_version"];

  id v21 = xpc_null_create();
  if (*(void *)a3.var0)
  {
    v20.id var0 = (placeholder *)(*(uint64_t (**)(void))(**(void **)a3.var0 + 24))(*(void *)a3.var0);
    convert_ValMap_to_xpc_object(&v20, "coex:rcp2:btwifi:load", "PropGet", (xpc_object_t *)buf);
    id v10 = *(id *)buf;
    xpc_object_t v11 = xpc_null_create();
    id v12 = *(void **)buf;
    *(void *)long long buf = v11;

    id v13 = v21;
    id v21 = v10;

    xpc_object_t v14 = *(void **)buf;
    *(void *)long long buf = 0;

    if (v20.var0) {
      (*(void (**)(placeholder *))(*(void *)v20.var0 + 8))(v20.var0);
    }
    id v15 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(RCP2CAMetrics_extension) getBTWifiLoadInfoEvent:]";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 963;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, " %s:%d: kWPANTUNDValueMapKey_Bt_Wifi_Load Property", buf, 0x12u);
    }

    *(void *)long long buf = &v21;
    *(void *)&buf[8] = "value";
    id v16 = xpc::dict::object_proxy::operator*((uint64_t)buf);
    CAMetricsHandlers_handle_getprop_BTWifiLoadInfo(v16, v5);
  }
  uint64_t v17 = +[NSNumber numberWithBool:[(ThreadNetworkManagerInstance *)self getPairingStatus]];
  [v5 setObject:v17 forKey:@"is_pairing"];

  [(ThreadNetworkManagerInstance *)self addCommonDimensions:v5];
  id v19 = v5;
  AnalyticsSendEventLazy();

  id v18 = v21;
  id v21 = 0;
}

id __80__ThreadNetworkManagerInstance_RCP2CAMetrics_extension__getBTWifiLoadInfoEvent___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)triggerBTWifiLoadInfoEvent
{
  uint64_t v13 = 0;
  std::string::basic_string[abi:ne180100]<0>(buf, "Command success");
  int v10 = 0;
  *(_OWORD *)xpc_object_t v11 = *(_OWORD *)buf;
  uint64_t v12 = *(void *)&buf[16];
  if (self)
  {
    BOOL v3 = [(ThreadNetworkManagerInstance *)self CtrInternalClientPtr];
    std::string::basic_string[abi:ne180100]<0>(__p, "coex:rcp2:btwifi:load");
    if (v3) {
      [v3 getProperty:__p output:&v13];
    }
    else {
      memset(buf, 0, 32);
    }
    int v5 = *CtrXPC::Result::operator=(&v10, (uint64_t)buf);
    if ((char)buf[31] < 0) {
      operator delete(*(void **)&buf[8]);
    }
    if (v9 < 0) {
      operator delete(__p[0]);
    }

    if (!v5)
    {
      uint64_t v6 = v13;
      if (v13) {
        uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v13 + 24))(v13);
      }
      uint64_t v7 = v6;
      [(ThreadNetworkManagerInstance *)self getBTWifiLoadInfoEvent:&v7];
      if (v7) {
        (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
      }
    }
  }
  else
  {
    unint64_t v4 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[ThreadNetworkManagerInstance(RCP2CAMetrics_extension) triggerBTWifiLoadInfoEvent]";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 996;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, " %s:%d: couldn't  trigger com.apple.Bluestone.bluestoneBTWifiLoadinfo event  ", buf, 0x12u);
    }
  }
  if (SHIBYTE(v12) < 0) {
    operator delete(v11[0]);
  }
  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
  }
}

- (void)updateThreadSessionStopReason:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4 && ![v4 isEqualToString:&stru_1004A31D0])
  {
    objc_storeStrong((id *)&qword_1004B64E8, a3);
  }
  else
  {
    uint64_t v6 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance(RCP2CAMetrics_extension) updateThreadSessionStopReason:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (void)getThreadSessionRejectInfoMetrics:(id)a3
{
  id v4 = a3;
  int v5 = +[NSMutableDictionary dictionary];
  if (v5)
  {
    if (byte_1004B6447 >= 0) {
      uint64_t v6 = &mDaemonVersion;
    }
    else {
      uint64_t v6 = (uint64_t *)mDaemonVersion;
    }
    uint64_t v7 = +[NSString stringWithUTF8String:v6];
    [v5 setObject:v7 forKey:@"header_daemon_version"];

    if (byte_1004B645F >= 0) {
      uint64_t v8 = &mVendorVersion;
    }
    else {
      uint64_t v8 = (uint64_t *)mVendorVersion;
    }
    uint64_t v9 = +[NSString stringWithUTF8String:v8];
    [v5 setObject:v9 forKey:@"header_vendor_version"];

    [v5 setObject:v4 forKey:@"threadstart_rejected"];
    [(ThreadNetworkManagerInstance *)self getCurrentBTWifiLoad:v5];
    [(ThreadNetworkManagerInstance *)self addCommonDimensions:v5];
    id v18 = v5;
    AnalyticsSendEventLazy();
    uint64_t v10 = v18;
  }
  else
  {
    uint64_t v10 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ThreadNetworkManagerInstance(RCP2CAMetrics_extension) getThreadSessionRejectInfoMetrics:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

id __91__ThreadNetworkManagerInstance_RCP2CAMetrics_extension__getThreadSessionRejectInfoMetrics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)noteTimeAPOn
{
  mAPInfo = time_ms();
  qword_1004B65A0 = mAPInfo;
}

- (void)generateAPLifeInfoMetrics
{
  BOOL v3 = +[NSMutableDictionary dictionary];
  if (v3)
  {
    if (byte_1004B6447 >= 0) {
      id v4 = &mDaemonVersion;
    }
    else {
      id v4 = (uint64_t *)mDaemonVersion;
    }
    int v5 = +[NSString stringWithUTF8String:v4];
    [v3 setObject:v5 forKey:@"header_daemon_version"];

    if (byte_1004B645F >= 0) {
      uint64_t v6 = &mVendorVersion;
    }
    else {
      uint64_t v6 = (uint64_t *)mVendorVersion;
    }
    uint64_t v7 = +[NSString stringWithUTF8String:v6];
    [v3 setObject:v7 forKey:@"header_vendor_version"];

    unint64_t v8 = time_ms();
    qword_1004B65A0 = v8;
    if (v8 > mAPInfo && mAPInfo && v8 - mAPInfo > 0x3E7)
    {
      int v24 = +[NSNumber numberWithUnsignedLong:(v8 - mAPInfo) / 0x3E8];
      [v3 setObject:v24 forKey:@"duration_ap_on"];

      id v25 = +[NSNumber numberWithUnsignedInt:[(ThreadNetworkManagerInstance *)self getCounterThreadStartFailDueToBluetoothOff]];
      [v3 setObject:v25 forKey:@"BTOff_threadStart_count"];

      int v26 = +[NSNumber numberWithUnsignedInt:[(ThreadNetworkManagerInstance *)self getCounterThreadSessionStoppedDueToBluetoothOff]];
      [v3 setObject:v26 forKey:@"BTOff_threadStop_count"];

      id v27 = +[NSNumber numberWithUnsignedInt:[(ThreadNetworkManagerInstance *)self getCounterThreadStartFailDueToEscoOn]];
      [v3 setObject:v27 forKey:@"EscoOn_threadStart_count"];

      uint64_t v28 = +[NSNumber numberWithUnsignedInt:[(ThreadNetworkManagerInstance *)self getCounterThreadSessionStoppedDueToEscoOn]];
      [v3 setObject:v28 forKey:@"EscoOn_threadStop_count"];

      id v29 = +[NSNumber numberWithUnsignedInt:[(ThreadNetworkManagerInstance *)self getCounterThreadSessionStoppedDueToAPOff]];
      [v3 setObject:v29 forKey:@"APOff_threadStop_count"];

      [(ThreadNetworkManagerInstance *)self addCommonDimensions:v3];
      uint64_t v30 = v3;
      AnalyticsSendEventLazy();
      [(ThreadNetworkManagerInstance *)self resetPeriodicRCP2_threadSessionMetrics];
      mAPInfo = 0;
      qword_1004B65A0 = 0;
      uint64_t v9 = v30;
    }
    else
    {
      uint64_t v9 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        [(ThreadNetworkManagerInstance(RCP2CAMetrics_extension) *)v9 generateAPLifeInfoMetrics];
      }
    }
  }
  else
  {
    uint64_t v9 = log_get_logging_obg("com.apple.wpantund.tnm", "default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(ThreadNetworkManagerInstance(RCP2CAMetrics_extension) *)v9 generateAPLifeInfoMetrics];
    }
  }
}

id __82__ThreadNetworkManagerInstance_RCP2CAMetrics_extension__generateAPLifeInfoMetrics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)CAincrementStartProcessCount:(BOOL)a3
{
  if (a3) {
    BOOL v3 = &xmmword_1004B6488;
  }
  else {
    BOOL v3 = &xmmword_1004B64B8;
  }
  if (*(_DWORD *)v3 == -1)
  {
    __break(0x5500u);
  }
  else
  {
    ++*(_DWORD *)v3;
    -[ThreadNetworkManagerInstance CAnoteStartProcessReqTime:](self, "CAnoteStartProcessReqTime:");
  }
}

- (void)CAincrementStartProcessSuccessCount:(BOOL)a3
{
  if (a3) {
    BOOL v3 = (char *)&xmmword_1004B6488 + 4;
  }
  else {
    BOOL v3 = (char *)&xmmword_1004B64B8 + 4;
  }
  if (*(_DWORD *)v3 == -1) {
    __break(0x5500u);
  }
  else {
    ++*(_DWORD *)v3;
  }
}

- (void)CAincrementStopProcessCount:(BOOL)a3
{
  if (a3) {
    BOOL v3 = (char *)&xmmword_1004B6488 + 8;
  }
  else {
    BOOL v3 = (char *)&xmmword_1004B64B8 + 8;
  }
  if (*(_DWORD *)v3 == -1) {
    __break(0x5500u);
  }
  else {
    ++*(_DWORD *)v3;
  }
}

- (void)CAincrementStopProcessSuccessCount:(BOOL)a3
{
  if (a3) {
    BOOL v3 = (char *)&xmmword_1004B6488 + 12;
  }
  else {
    BOOL v3 = (char *)&xmmword_1004B64B8 + 12;
  }
  if (*(_DWORD *)v3 == -1) {
    __break(0x5500u);
  }
  else {
    ++*(_DWORD *)v3;
  }
}

- (void)CAnoteStartProcessReqTime:(BOOL)a3
{
  BOOL v3 = a3;
  __darwin_time_t v4 = time_ms();
  uint64_t v5 = 14;
  if (v3) {
    uint64_t v5 = 8;
  }
  uint64_t v6 = 15;
  if (v3) {
    uint64_t v6 = 9;
  }
  threadSessionMetrics[v5] = v4;
  threadSessionMetrics[v6] = v4;
}

- (void)CAnoteStopProcessReqTimeSuccessOrFail:(BOOL)a3 isProcessPairing:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  unint64_t v6 = time_ms();
  if (v4)
  {
    *((void *)&xmmword_1004B64A8 + 1) = v6;
    if ((void)xmmword_1004B64A8) {
      BOOL v7 = v6 > (unint64_t)xmmword_1004B64A8;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7) {
      uint64_t v8 = v6 - xmmword_1004B64A8;
    }
    else {
      uint64_t v8 = 0;
    }
    if (v5)
    {
      if (__CFADD__(qword_1004B64A0, v8)) {
        goto LABEL_25;
      }
      qword_1004B64A0 += v8;
    }
    BOOL v9 = __CFADD__(qword_1004B6498, v8);
    uint64_t v10 = qword_1004B6498 + v8;
    if (!v9)
    {
      uint64_t v11 = &qword_1004B6498;
LABEL_24:
      uint64_t *v11 = v10;
      void v11[2] = 0;
      v11[3] = 0;
      return;
    }
  }
  else
  {
    qword_1004B64E0 = v6;
    if (qword_1004B64D8) {
      BOOL v12 = v6 > qword_1004B64D8;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12) {
      unint64_t v13 = v6 - qword_1004B64D8;
    }
    else {
      unint64_t v13 = 0;
    }
    if (v5)
    {
      if (__CFADD__(*((void *)&xmmword_1004B64C8 + 1), v13)) {
        goto LABEL_25;
      }
      *((void *)&xmmword_1004B64C8 + 1) += v13;
    }
    BOOL v9 = __CFADD__((void)xmmword_1004B64C8, v13);
    uint64_t v10 = xmmword_1004B64C8 + v13;
    if (!v9)
    {
      uint64_t v11 = (uint64_t *)&xmmword_1004B64C8;
      goto LABEL_24;
    }
  }
LABEL_25:
  __break(0x5500u);
}

@end