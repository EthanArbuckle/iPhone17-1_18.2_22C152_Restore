@interface CWFInterface
+ (BOOL)logRedactionDisabled;
+ (unsigned)logRedactionSetting;
+ (void)setLogRedactionDisabled:(BOOL)a3;
+ (void)setLogRedactionSetting:(unsigned __int8)a3;
- (AWDLServiceDiscoveryManager)awdlServiceManager;
- (BOOL)addKnownBSS:(id)a3 knownNetworkProfile:(id)a4 error:(id *)a5;
- (BOOL)addKnownNetworkProfile:(id)a3 error:(id *)a4;
- (BOOL)applyUserSettings:(id)a3 properties:(id)a4 error:(id *)a5;
- (BOOL)associateWithParameters:(id)a3 error:(id *)a4;
- (BOOL)beginActivity:(id)a3 error:(id *)a4;
- (BOOL)beginActivityType:(int64_t)a3 reason:(id)a4 error:(id *)a5;
- (BOOL)cancelRequestsWithUUID:(id)a3 error:(id *)a4;
- (BOOL)isActivated;
- (BOOL)isNetworkServiceEnabled;
- (BOOL)isQuickProbeRequiredForNetworkProfile:(id)a3;
- (BOOL)performAutoJoinWithParameters:(id)a3 error:(id *)a4;
- (BOOL)powerOn;
- (BOOL)removeKnownBSS:(id)a3 knownNetworkProfile:(id)a4 error:(id *)a5;
- (BOOL)removeKnownNetworkProfile:(id)a3 reason:(int64_t)a4 error:(id *)a5;
- (BOOL)reportQuickProbeResult:(BOOL)a3 networkProfile:(id)a4 error:(id *)a5;
- (BOOL)setAWDLPeerTrafficRegistration:(id)a3 error:(id *)a4;
- (BOOL)setAutoHotspotMode:(int64_t)a3 error:(id *)a4;
- (BOOL)setBackgroundScanConfiguration:(id)a3 error:(id *)a4;
- (BOOL)setBlockedBands:(id)a3 error:(id *)a4;
- (BOOL)setChannel:(id)a3 error:(id *)a4;
- (BOOL)setCompanionCountryCode:(id)a3 error:(id *)a4;
- (BOOL)setLinkQualityMetricConfiguration:(id)a3 error:(id *)a4;
- (BOOL)setPassword:(id)a3 knownNetworkProfile:(id)a4 error:(id *)a5;
- (BOOL)setPower:(BOOL)a3 error:(id *)a4;
- (BOOL)setPrivateMACAddressMode:(int64_t)a3 networkProfile:(id)a4 error:(id *)a5;
- (BOOL)setPrivateMACAddressModeSystemSetting:(int64_t)a3 error:(id *)a4;
- (BOOL)setRangeable:(BOOL)a3 peerList:(id)a4 error:(id *)a5;
- (BOOL)setRangingIdentifier:(id)a3 error:(id *)a4;
- (BOOL)setThermalIndex:(int64_t)a3 error:(id *)a4;
- (BOOL)setUserAutoJoinDisabled:(BOOL)a3 error:(id *)a4;
- (BOOL)startAWDLPeerAssistedDiscoveryWithParameters:(id)a3 error:(id *)a4;
- (BOOL)startHostAPModeWithConfiguration:(id)a3 error:(id *)a4;
- (BOOL)startMonitoringEvent:(id)a3 error:(id *)a4;
- (BOOL)startMonitoringEventType:(int64_t)a3 error:(id *)a4;
- (BOOL)updateKnownBSS:(id)a3 knownNetworkProfile:(id)a4 properties:(id)a5 OSSpecificKeys:(id)a6 error:(id *)a7;
- (BOOL)updateKnownBSS:(id)a3 knownNetworkProfile:(id)a4 properties:(id)a5 error:(id *)a6;
- (BOOL)updateKnownNetworkProfile:(id)a3 properties:(id)a4 OSSpecificKeys:(id)a5 error:(id *)a6;
- (BOOL)updateKnownNetworkProfile:(id)a3 properties:(id)a4 error:(id *)a5;
- (BOOL)userAutoJoinDisabled;
- (BOOL)wakeOnWirelessEnabled;
- (CWFInterface)init;
- (CWFInterface)initWithServiceType:(int64_t)a3;
- (CWFInterface)initWithServiceType:(int64_t)a3 endpoint:(id)a4;
- (CWFInterface)initWithXPCClient:(id)a3 requestParameters:(id)a4;
- (CWFRequestParameters)requestParameters;
- (CWFXPCClient)XPCClient;
- (double)rxRate;
- (double)txPower;
- (double)txRate;
- (id)AWDL;
- (id)AWDLAFTxMode;
- (id)AWDLAvailabilityWindowAPAlignment;
- (id)AWDLBTLEStateParameters;
- (id)AWDLContinuousElectionAlgorithmEnabled;
- (id)AWDLElectionID;
- (id)AWDLElectionMetric;
- (id)AWDLElectionParameters;
- (id)AWDLElectionRSSIThresholds;
- (id)AWDLEncryptionType;
- (id)AWDLExtensionStateMachineParameters;
- (id)AWDLGuardTime;
- (id)AWDLMasterChannel;
- (id)AWDLOpMode;
- (id)AWDLPeerDatabase;
- (id)AWDLPeerTrafficRegistration;
- (id)AWDLPreferredChannels;
- (id)AWDLPresenceMode;
- (id)AWDLSecondaryMasterChannel;
- (id)AWDLSidecarDiagnostics;
- (id)AWDLSocialTimeSlots;
- (id)AWDLStatistics;
- (id)AWDLStrategy;
- (id)AWDLSyncChannelSequence;
- (id)AWDLSyncEnabled;
- (id)AWDLSyncParameters;
- (id)AWDLSyncState;
- (id)BSSID;
- (id)BSSIDForVendor;
- (id)DHCPLeaseExpiresAt;
- (id)DHCPLeaseStartedAt;
- (id)DHCPServerID;
- (id)DHCPv6ServerID;
- (id)DNSServerAddresses;
- (id)IO80211ControllerInfo;
- (id)IO80211InterfaceInfo;
- (id)IPv4ARPResolvedHardwareAddress;
- (id)IPv4ARPResolvedIPAddress;
- (id)IPv4Addresses;
- (id)IPv4NetworkSignature;
- (id)IPv4RouterAddress;
- (id)IPv4SubnetMasks;
- (id)IPv6Addresses;
- (id)IPv6NetworkSignature;
- (id)IPv6RouterAddress;
- (id)LQMSummary;
- (id)MACAddress;
- (id)NANData;
- (id)SSID;
- (id)SSIDForVendor;
- (id)__adjustedRequestParameters;
- (id)activities;
- (id)authType;
- (id)autoJoinStatistics;
- (id)auxiliaryInterface;
- (id)background;
- (id)backgroundScanCache;
- (id)backgroundScanConfiguration;
- (id)beaconCache;
- (id)blockedBands;
- (id)bluetoothCoexistenceConfig;
- (id)bluetoothCoexistenceProfiles2GHz;
- (id)bluetoothCoexistenceProfiles5GHz;
- (id)cachedAutoJoinMetric;
- (id)cachedAutoJoinStatus;
- (id)cachedJoinStatus;
- (id)cachedLinkDownStatus;
- (id)cachedLinkQualityMetric;
- (id)cachedRoamStatus;
- (id)capabilities;
- (id)chainAck;
- (id)channel;
- (id)clearAutoJoinDenyListForNetwork:(id)a3 reason:(unint64_t)a4;
- (id)countryCode;
- (id)currentKnownNetworkProfile;
- (id)currentScanResult;
- (id)desense;
- (id)desenseLevel;
- (id)deviceUUID;
- (id)eventHandler;
- (id)eventHandlerWithEventID:(id)a3;
- (id)eventIDs;
- (id)getAutoJoinDenyList;
- (id)globalDNSServerAddresses;
- (id)globalIPv4Addresses;
- (id)globalIPv4InterfaceName;
- (id)globalIPv4NetworkServiceID;
- (id)globalIPv4NetworkServiceName;
- (id)globalIPv4RouterAddress;
- (id)globalIPv6Addresses;
- (id)globalIPv6InterfaceName;
- (id)globalIPv6NetworkServiceID;
- (id)globalIPv6NetworkServiceName;
- (id)globalIPv6RouterAddress;
- (id)hardwareMACAddress;
- (id)hardwareSupportedChannels;
- (id)highPriority;
- (id)hostAPStationList;
- (id)interfaceName;
- (id)interfaceNames;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)knownNetworkInfoForLocalNetworkPromptWithOptions:(id)a3;
- (id)knownNetworkProfileMatchingNetworkProfile:(id)a3;
- (id)knownNetworkProfileMatchingScanResult:(id)a3;
- (id)knownNetworkProfilesWithProperties:(id)a3;
- (id)leakyAPStats;
- (id)linkQualityMetricConfiguration;
- (id)lowPriority;
- (id)maxPHYModeDescription;
- (id)networkName;
- (id)networkServiceID;
- (id)networkServiceName;
- (id)parentInterfaceName;
- (id)passwordForKnownNetworkProfile:(id)a3 error:(id *)a4;
- (id)perAntennaRSSI;
- (id)performANQPWithParameters:(id)a3 error:(id *)a4;
- (id)performNearbyDeviceDiscovery:(id)a3;
- (id)performRangingWithPeerList:(id)a3 timeout:(unint64_t)a4 error:(id *)a5;
- (id)performScanWithParameters:(id)a3 error:(id *)a4;
- (id)performSensingWithParameters:(id)a3 error:(id *)a4;
- (id)powerDebugInfo;
- (id)powerState;
- (id)privateMACAddressForNetworkProfile:(id)a3;
- (id)rangingCapabilities;
- (id)setAutoJoinDenyListForNetwork:(id)a3 reason:(unint64_t)a4;
- (id)supportedChannel:(unint64_t)a3 band:(unsigned int)a4 width:(int)a5 countryCode:(id)a6;
- (id)supportedChannelsWithCountryCode:(id)a3;
- (id)systemActivities;
- (id)systemEventIDs;
- (id)targetQueue;
- (id)txChainPower;
- (id)userInitiated;
- (id)userInteractive;
- (id)userSettings;
- (id)utility;
- (id)veryHighPriority;
- (id)veryLowPriority;
- (id)virtualInterfaceNames;
- (id)wifiAssistOverrideReasons;
- (int)EAP8021XClientStatus;
- (int)PHYMode;
- (int)bluetoothCoexistenceMode;
- (int)opMode;
- (int)powersave;
- (int)state;
- (int)supportedPHYModes;
- (int)virtualInterfaceRole;
- (int64_t)RSSI;
- (int64_t)WAPISubtype;
- (int64_t)WEPSubtype;
- (int64_t)autoHotspotMode;
- (int64_t)countryBandSupport;
- (int64_t)noise;
- (int64_t)privateMACAddressModeForNetworkProfile:(id)a3;
- (int64_t)privateMACAddressModeSystemSetting;
- (int64_t)serviceType;
- (int64_t)thermalIndex;
- (unint64_t)CCA;
- (unint64_t)DTIMInterval;
- (unint64_t)MCSIndex;
- (unint64_t)guardInterval;
- (unint64_t)maxLinkSpeed;
- (unint64_t)maxNSSForAP;
- (unint64_t)numberOfSpatialStreams;
- (unint64_t)securityType;
- (unint64_t)txNSS;
- (unint64_t)wifiUIStateFlags;
- (unsigned)EAP8021XControlMode;
- (unsigned)EAP8021XControlState;
- (unsigned)EAP8021XSupplicantState;
- (unsigned)__flagsForChannelBand:(unsigned int)a3 width:(int)a4;
- (unsigned)reachabilityFlags;
- (void)activate;
- (void)associateWithParameters:(id)a3 reply:(id)a4;
- (void)clearAllEventHandlers;
- (void)disassociateWithReason:(int64_t)a3;
- (void)endActivity:(id)a3;
- (void)endActivityType:(int64_t)a3;
- (void)endAllActivities;
- (void)invalidate;
- (void)performANQPWithParameters:(id)a3 reply:(id)a4;
- (void)performActivity:(id)a3 usingBlock:(id)a4;
- (void)performAutoJoinWithParameters:(id)a3 reply:(id)a4;
- (void)performRangingWithPeerList:(id)a3 timeout:(unint64_t)a4 reply:(id)a5;
- (void)performScanWithParameters:(id)a3 reply:(id)a4;
- (void)performSensingWithParameters:(id)a3 reply:(id)a4;
- (void)resetAutoJoinStatistics;
- (void)resume;
- (void)setActivated:(BOOL)a3;
- (void)setAwdlServiceManager:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setEventHandler:(id)a3 eventID:(id)a4;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPrivateMACAddressUserJoinFailureUIState:(BOOL)a3 networkProfile:(id)a4;
- (void)setTargetQueue:(id)a3;
- (void)stopAWDLPeerAssistedDiscovery;
- (void)stopHostAPMode;
- (void)stopMonitoringAllEvents;
- (void)stopMonitoringEvent:(id)a3;
- (void)stopMonitoringEventType:(int64_t)a3;
- (void)suspend;
- (void)updateSoftAPBand:(unsigned int)a3;
@end

@implementation CWFInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awdlServiceManager, 0);
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_XPCClient, 0);
}

- (id)wifiAssistOverrideReasons
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1B4F51C8C;
  v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 236, v2, v3))
  {
    v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA39D0, v6, v7);
    v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FECEFC;
    v18[3] = &unk_1E60BCDF8;
    v18[4] = &v19;
    objc_msgSend_queryWiFiAssistOverrideReasonsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)interfaceName
{
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_1B4F51C8C;
  v32 = sub_1B4F51BF4;
  uint64_t v6 = objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  objc_msgSend_interfaceName(v6, v7, v8, v9, v10);
  id v33 = (id)objc_claimAutoreleasedReturnValue();

  if (!v29[5] && (objc_msgSend_allowRequestType_(self->_XPCClient, v11, 3, v12, v13) & 1) != 0)
  {
    v17 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v14, (uint64_t)&unk_1F0DA2EF0, v15, v16);
    v22 = objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1B4F34734;
    v27[3] = &unk_1E60BCDD0;
    v27[4] = &v28;
    objc_msgSend_queryInterfaceNameWithRequestParams_reply_(v17, v23, (uint64_t)v22, (uint64_t)v27, v24);
  }
  id v25 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v25;
}

- (CWFInterface)initWithServiceType:(int64_t)a3
{
  v5 = [CWFXPCClient alloc];
  uint64_t v9 = objc_msgSend_initWithServiceType_(v5, v6, a3, v7, v8);
  uint64_t v12 = (CWFInterface *)objc_msgSend_initWithXPCClient_requestParameters_(self, v10, (uint64_t)v9, 0, v11);

  return v12;
}

- (CWFInterface)initWithXPCClient:(id)a3 requestParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CWFInterface;
  uint64_t v9 = [(CWFInterface *)&v18 init];
  v14 = v9;
  if (!v7
    || !v9
    || ((objc_storeStrong((id *)&v9->_XPCClient, a3), !v8)
      ? (uint64_t v15 = objc_alloc_init(CWFRequestParameters))
      : (uint64_t v15 = (CWFRequestParameters *)v8),
        requestParameters = v14->_requestParameters,
        v14->_requestParameters = v15,
        requestParameters,
        !v14->_requestParameters))
  {
    objc_msgSend_invalidate(v14, v10, v11, v12, v13);

    v14 = 0;
  }

  return v14;
}

+ (BOOL)logRedactionDisabled
{
  return objc_msgSend_logRedactionSetting(a1, a2, v2, v3, v4) == 1;
}

+ (unsigned)logRedactionSetting
{
  id v2 = a1;
  objc_sync_enter(v2);
  unsigned __int8 v3 = byte_1EB4B25D8;
  objc_sync_exit(v2);

  return v3;
}

- (id)currentKnownNetworkProfile
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1B4F51C8C;
  v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 58, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA32F0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4F348F0;
    v18[3] = &unk_1E60BCEC0;
    v18[4] = &v19;
    objc_msgSend_queryCurrentKnownNetworkProfileWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)__adjustedRequestParameters
{
  v5 = objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_copy(v5, v6, v7, v8, v9);

  return v10;
}

- (CWFRequestParameters)requestParameters
{
  return self->_requestParameters;
}

- (void)activate
{
  obj = self;
  objc_sync_enter(obj);
  if ((objc_msgSend_isActivated(obj, v2, v3, v4, v5) & 1) == 0)
  {
    objc_msgSend_setActivated_(obj, v6, 1, v7, v8);
    objc_msgSend_resume(obj->_XPCClient, v9, v10, v11, v12);
  }
  objc_sync_exit(obj);
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_msgSend_setInvalidationHandler_(self->_XPCClient, a2, (uint64_t)a3, v3, v4);
}

- (void)invalidate
{
  objc_msgSend_invalidate(self->_XPCClient, a2, v2, v3, v4);
}

- (CWFInterface)init
{
  return (CWFInterface *)objc_msgSend_initWithServiceType_(self, a2, 2, v2, v3);
}

+ (void)setLogRedactionSetting:(unsigned __int8)a3
{
  id obj = a1;
  objc_sync_enter(obj);
  byte_1EB4B25D8 = a3;
  objc_sync_exit(obj);
}

+ (void)setLogRedactionDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = a1;
  objc_sync_enter(obj);
  if (v3) {
    objc_msgSend_setLogRedactionSetting_(obj, v4, 1, v5, v6);
  }
  else {
    objc_msgSend_setLogRedactionSetting_(obj, v4, 2, v5, v6);
  }
  objc_sync_exit(obj);
}

- (CWFInterface)initWithServiceType:(int64_t)a3 endpoint:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [CWFXPCClient alloc];
  uint64_t v10 = objc_msgSend_initWithServiceType_endpoint_(v7, v8, a3, (uint64_t)v6, v9);

  uint64_t v13 = (CWFInterface *)objc_msgSend_initWithXPCClient_requestParameters_(self, v11, (uint64_t)v10, 0, v12);
  return v13;
}

- (id)auxiliaryInterface
{
  BOOL v3 = [CWFInterface alloc];
  uint64_t v8 = objc_msgSend_XPCClient(self, v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
  id v16 = objc_msgSend_initWithXPCClient_requestParameters_(v3, v14, (uint64_t)v8, (uint64_t)v13, v15);

  return v16;
}

- (id)AWDL
{
  uint64_t v6 = objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setInterfaceName_(v11, v12, 0, v13, v14);
  objc_msgSend_setVirtualInterfaceRole_(v11, v15, 6, v16, v17);
  objc_super v18 = [CWFInterface alloc];
  v23 = objc_msgSend_XPCClient(self, v19, v20, v21, v22);
  v26 = objc_msgSend_initWithXPCClient_requestParameters_(v18, v24, (uint64_t)v23, (uint64_t)v11, v25);

  return v26;
}

- (id)NANData
{
  uint64_t v6 = objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setInterfaceName_(v11, v12, 0, v13, v14);
  objc_msgSend_setVirtualInterfaceRole_(v11, v15, 10, v16, v17);
  objc_super v18 = [CWFInterface alloc];
  v23 = objc_msgSend_XPCClient(self, v19, v20, v21, v22);
  v26 = objc_msgSend_initWithXPCClient_requestParameters_(v18, v24, (uint64_t)v23, (uint64_t)v11, v25);

  return v26;
}

- (id)veryLowPriority
{
  uint64_t v6 = objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQueuePriority_(v11, v12, -8, v13, v14);
  uint64_t v15 = [CWFInterface alloc];
  uint64_t v20 = objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  v23 = objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (id)lowPriority
{
  uint64_t v6 = objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQueuePriority_(v11, v12, -4, v13, v14);
  uint64_t v15 = [CWFInterface alloc];
  uint64_t v20 = objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  v23 = objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (id)highPriority
{
  uint64_t v6 = objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQueuePriority_(v11, v12, 4, v13, v14);
  uint64_t v15 = [CWFInterface alloc];
  uint64_t v20 = objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  v23 = objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (id)veryHighPriority
{
  uint64_t v6 = objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQueuePriority_(v11, v12, 8, v13, v14);
  uint64_t v15 = [CWFInterface alloc];
  uint64_t v20 = objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  v23 = objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (id)background
{
  uint64_t v6 = objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQualityOfService_(v11, v12, 9, v13, v14);
  uint64_t v15 = [CWFInterface alloc];
  uint64_t v20 = objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  v23 = objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (id)utility
{
  uint64_t v6 = objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQualityOfService_(v11, v12, 17, v13, v14);
  uint64_t v15 = [CWFInterface alloc];
  uint64_t v20 = objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  v23 = objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (id)userInitiated
{
  uint64_t v6 = objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQualityOfService_(v11, v12, 25, v13, v14);
  uint64_t v15 = [CWFInterface alloc];
  uint64_t v20 = objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  v23 = objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (id)userInteractive
{
  uint64_t v6 = objc_msgSend_requestParameters(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_copy(v6, v7, v8, v9, v10);

  objc_msgSend_setQualityOfService_(v11, v12, 33, v13, v14);
  uint64_t v15 = [CWFInterface alloc];
  uint64_t v20 = objc_msgSend_XPCClient(self, v16, v17, v18, v19);
  v23 = objc_msgSend_initWithXPCClient_requestParameters_(v15, v21, (uint64_t)v20, (uint64_t)v11, v22);

  return v23;
}

- (void)resume
{
  objc_msgSend_resume(self->_XPCClient, a2, v2, v3, v4);
}

- (void)suspend
{
  objc_msgSend_suspend(self->_XPCClient, a2, v2, v3, v4);
}

- (id)targetQueue
{
  return (id)objc_msgSend_targetQueue(self->_XPCClient, a2, v2, v3, v4);
}

- (void)setTargetQueue:(id)a3
{
}

- (int64_t)serviceType
{
  return objc_msgSend_serviceType(self->_XPCClient, a2, v2, v3, v4);
}

- (id)invalidationHandler
{
  return (id)objc_msgSend_invalidationHandler(self->_XPCClient, a2, v2, v3, v4);
}

- (id)interruptionHandler
{
  return (id)objc_msgSend_interruptionHandler(self->_XPCClient, a2, v2, v3, v4);
}

- (void)setInterruptionHandler:(id)a3
{
  objc_msgSend_setInterruptionHandler_(self->_XPCClient, a2, (uint64_t)a3, v3, v4);
}

- (id)eventHandler
{
  uint64_t v4 = objc_msgSend_eventIDWithType_interfaceName_(CWFEventID, a2, 0, 0, v2);
  uint64_t v8 = objc_msgSend_eventHandlerWithEventID_(self, v5, (uint64_t)v4, v6, v7);

  return v8;
}

- (void)setEventHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend_eventIDWithType_interfaceName_(CWFEventID, v5, 0, 0, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEventHandler_eventID_(self, v7, (uint64_t)v4, (uint64_t)v9, v8);
}

- (BOOL)cancelRequestsWithUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_1B4F51C8C;
  v27 = sub_1B4F51BF4;
  id v28 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 168, v8, v9))
  {
    XPCClient = self->_XPCClient;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B4FE3838;
    v22[3] = &unk_1E60BCD38;
    v22[4] = &v23;
    uint64_t v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v22, v11, v12);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_1B4FE3848;
    v21[3] = &unk_1E60BCD38;
    v21[4] = &v23;
    objc_msgSend_cancelRequestsWithUUID_reply_(v14, v15, (uint64_t)v6, (uint64_t)v21, v16);
  }
  else
  {
    uint64_t v20 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v10, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v14 = (void *)v24[5];
    v24[5] = v20;
  }

  uint64_t v17 = (void *)v24[5];
  if (a4 && v17)
  {
    *a4 = v17;
    uint64_t v17 = (void *)v24[5];
  }
  BOOL v18 = v17 == 0;
  _Block_object_dispose(&v23, 8);

  return v18;
}

- (int64_t)thermalIndex
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 35, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3FD0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE3968;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryThermalIndexWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  int64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (int64_t)countryBandSupport
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 197, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3470, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE3AB8;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryCountryBandSupport_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  int64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (BOOL)setThermalIndex:(int64_t)a3 error:(id *)a4
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_1B4F51C8C;
  v29 = sub_1B4F51BF4;
  id v30 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 36, (uint64_t)a4, v4))
  {
    XPCClient = self->_XPCClient;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1B4FE3CE0;
    v24[3] = &unk_1E60BCD38;
    v24[4] = &v25;
    uint64_t v12 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v8, (uint64_t)v24, v9, v10);
    uint64_t v17 = objc_msgSend___adjustedRequestParameters(self, v13, v14, v15, v16);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1B4FE3CF0;
    v23[3] = &unk_1E60BCD38;
    v23[4] = &v25;
    objc_msgSend_setThermalIndex_requestParams_reply_(v12, v18, a3, (uint64_t)v17, (uint64_t)v23);
  }
  else
  {
    uint64_t v22 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v8, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v12 = (void *)v26[5];
    v26[5] = v22;
  }

  uint64_t v19 = (void *)v26[5];
  if (a4 && v19)
  {
    *a4 = v19;
    uint64_t v19 = (void *)v26[5];
  }
  BOOL v20 = v19 == 0;
  _Block_object_dispose(&v25, 8);

  return v20;
}

- (id)deviceUUID
{
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 145, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3490, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE3E54;
    v18[3] = &unk_1E60BCDA8;
    v18[4] = &v19;
    objc_msgSend_queryDeviceUUIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)interfaceNames
{
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 1, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3010, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE4018;
    v18[3] = &unk_1E60BCDF8;
    v18[4] = &v19;
    objc_msgSend_queryInterfaceNamesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)virtualInterfaceNames
{
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 2, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3150, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE41D8;
    v18[3] = &unk_1E60BCDF8;
    v18[4] = &v19;
    objc_msgSend_queryVirtualInterfaceNamesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)setPower:(BOOL)a3 error:(id *)a4
{
  BOOL v6 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_1B4F51C8C;
  v29 = sub_1B4F51BF4;
  id v30 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 6, (uint64_t)a4, v4))
  {
    XPCClient = self->_XPCClient;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1B4FE442C;
    v24[3] = &unk_1E60BCD38;
    v24[4] = &v25;
    uint64_t v12 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v8, (uint64_t)v24, v9, v10);
    uint64_t v17 = objc_msgSend___adjustedRequestParameters(self, v13, v14, v15, v16);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1B4FE443C;
    v23[3] = &unk_1E60BCD38;
    v23[4] = &v25;
    objc_msgSend_setPower_requestParams_reply_(v12, v18, v6, (uint64_t)v17, (uint64_t)v23);
  }
  else
  {
    uint64_t v22 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v8, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v12 = (void *)v26[5];
    v26[5] = v22;
  }

  uint64_t v19 = (void *)v26[5];
  if (a4 && v19)
  {
    *a4 = v19;
    uint64_t v19 = (void *)v26[5];
  }
  BOOL v20 = v19 == 0;
  _Block_object_dispose(&v25, 8);

  return v20;
}

- (BOOL)setChannel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_1B4F51C8C;
  v31 = sub_1B4F51BF4;
  id v32 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 17, v8, v9))
  {
    XPCClient = self->_XPCClient;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B4FE463C;
    v26[3] = &unk_1E60BCD38;
    v26[4] = &v27;
    uint64_t v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v26, v11, v12);
    uint64_t v19 = objc_msgSend___adjustedRequestParameters(self, v15, v16, v17, v18);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B4FE464C;
    v25[3] = &unk_1E60BCD38;
    v25[4] = &v27;
    objc_msgSend_setChannel_requestParams_reply_(v14, v20, (uint64_t)v6, (uint64_t)v19, (uint64_t)v25);
  }
  else
  {
    uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v10, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v14 = (void *)v28[5];
    v28[5] = v24;
  }

  uint64_t v21 = (void *)v28[5];
  if (a4 && v21)
  {
    *a4 = v21;
    uint64_t v21 = (void *)v28[5];
  }
  BOOL v22 = v21 == 0;
  _Block_object_dispose(&v27, 8);

  return v22;
}

- (id)performScanWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_1B4F51C8C;
  v37 = sub_1B4F51BF4;
  id v38 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_1B4F51C8C;
  v31 = sub_1B4F51BF4;
  id v32 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 64, v8, v9))
  {
    XPCClient = self->_XPCClient;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B4FE48BC;
    v26[3] = &unk_1E60BCD38;
    v26[4] = &v27;
    uint64_t v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v26, v11, v12);
    uint64_t v19 = objc_msgSend___adjustedRequestParameters(self, v15, v16, v17, v18);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B4FE48CC;
    v25[3] = &unk_1E60BCE20;
    v25[4] = &v27;
    void v25[5] = &v33;
    objc_msgSend_performScanWithParameters_requestParams_reply_(v14, v20, (uint64_t)v6, (uint64_t)v19, (uint64_t)v25);
  }
  else
  {
    uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v10, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v14 = (void *)v28[5];
    v28[5] = v24;
  }

  if (a4)
  {
    uint64_t v21 = (void *)v28[5];
    if (v21) {
      *a4 = v21;
    }
  }
  id v22 = (id)v34[5];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v22;
}

- (void)performScanWithParameters:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v8, 64, v9, v10))
  {
    XPCClient = self->_XPCClient;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1B4FE4AF4;
    v27[3] = &unk_1E60BCE48;
    id v13 = v7;
    id v28 = v13;
    uint64_t v17 = objc_msgSend_remoteObjectProxyWithErrorHandler_(XPCClient, v14, (uint64_t)v27, v15, v16);
    id v22 = objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B4FE4B10;
    v25[3] = &unk_1E60BCE70;
    id v26 = v13;
    objc_msgSend_performScanWithParameters_requestParams_reply_(v17, v23, (uint64_t)v6, (uint64_t)v22, (uint64_t)v25);
  }
  else if (v7)
  {
    uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v11, *MEMORY[0x1E4F28798], 45, 0);
    (*((void (**)(id, void *, void))v7 + 2))(v7, v24, 0);
  }
}

- (id)performANQPWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_1B4F51C8C;
  v37 = sub_1B4F51BF4;
  id v38 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_1B4F51C8C;
  v31 = sub_1B4F51BF4;
  id v32 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 65, v8, v9))
  {
    XPCClient = self->_XPCClient;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B4FE4D88;
    v26[3] = &unk_1E60BCD38;
    v26[4] = &v27;
    uint64_t v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v26, v11, v12);
    uint64_t v19 = objc_msgSend___adjustedRequestParameters(self, v15, v16, v17, v18);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B4FE4D98;
    v25[3] = &unk_1E60BCE20;
    void v25[4] = &v27;
    void v25[5] = &v33;
    objc_msgSend_performANQPWithParameters_requestParams_reply_(v14, v20, (uint64_t)v6, (uint64_t)v19, (uint64_t)v25);
  }
  else
  {
    uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v10, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v14 = (void *)v28[5];
    v28[5] = v24;
  }

  if (a4)
  {
    uint64_t v21 = (void *)v28[5];
    if (v21) {
      *a4 = v21;
    }
  }
  id v22 = (id)v34[5];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v22;
}

- (void)performANQPWithParameters:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v8, 65, v9, v10))
  {
    XPCClient = self->_XPCClient;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1B4FE4FC0;
    v27[3] = &unk_1E60BCE48;
    id v13 = v7;
    id v28 = v13;
    uint64_t v17 = objc_msgSend_remoteObjectProxyWithErrorHandler_(XPCClient, v14, (uint64_t)v27, v15, v16);
    id v22 = objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B4FE4FDC;
    v25[3] = &unk_1E60BCE70;
    id v26 = v13;
    objc_msgSend_performANQPWithParameters_requestParams_reply_(v17, v23, (uint64_t)v6, (uint64_t)v22, (uint64_t)v25);
  }
  else if (v7)
  {
    uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v11, *MEMORY[0x1E4F28798], 45, 0);
    (*((void (**)(id, void *, void))v7 + 2))(v7, v24, 0);
  }
}

- (BOOL)associateWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_1B4F51C8C;
  v31 = sub_1B4F51BF4;
  id v32 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 62, v8, v9))
  {
    XPCClient = self->_XPCClient;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B4FE51E4;
    v26[3] = &unk_1E60BCD38;
    v26[4] = &v27;
    uint64_t v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v26, v11, v12);
    uint64_t v19 = objc_msgSend___adjustedRequestParameters(self, v15, v16, v17, v18);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B4FE51F4;
    v25[3] = &unk_1E60BCD38;
    void v25[4] = &v27;
    objc_msgSend_associateWithParameters_requestParams_reply_(v14, v20, (uint64_t)v6, (uint64_t)v19, (uint64_t)v25);
  }
  else
  {
    uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v10, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v14 = (void *)v28[5];
    v28[5] = v24;
  }

  uint64_t v21 = (void *)v28[5];
  if (a4 && v21)
  {
    *a4 = v21;
    uint64_t v21 = (void *)v28[5];
  }
  BOOL v22 = v21 == 0;
  _Block_object_dispose(&v27, 8);

  return v22;
}

- (void)associateWithParameters:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v8, 62, v9, v10))
  {
    XPCClient = self->_XPCClient;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1B4FE5398;
    v27[3] = &unk_1E60BCE48;
    id v13 = v7;
    id v28 = v13;
    uint64_t v17 = objc_msgSend_remoteObjectProxyWithErrorHandler_(XPCClient, v14, (uint64_t)v27, v15, v16);
    BOOL v22 = objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B4FE53B0;
    v25[3] = &unk_1E60BCE48;
    id v26 = v13;
    objc_msgSend_associateWithParameters_requestParams_reply_(v17, v23, (uint64_t)v6, (uint64_t)v22, (uint64_t)v25);
  }
  else if (v7)
  {
    uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v11, *MEMORY[0x1E4F28798], 45, 0);
    (*((void (**)(id, void *))v7 + 2))(v7, v24);
  }
}

- (void)disassociateWithReason:(int64_t)a3
{
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 63, v3, v4))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v7, (uint64_t)&unk_1F0DA3190, v8, v9);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = objc_msgSend___adjustedRequestParameters(self, v10, v11, v12, v13);
    objc_msgSend_disassociateWithReason_requestParams_reply_(v16, v15, a3, (uint64_t)v14, (uint64_t)&unk_1F0DA3230);
  }
}

- (void)updateSoftAPBand:(unsigned int)a3
{
  uint64_t v5 = *(void *)&a3;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 219, v3, v4))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v7, (uint64_t)&unk_1F0DA4090, v8, v9);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = objc_msgSend___adjustedRequestParameters(self, v10, v11, v12, v13);
    objc_msgSend_updateSoftAPBand_requestParams_reply_(v16, v15, v5, (uint64_t)v14, (uint64_t)&unk_1F0DA40D0);
  }
}

- (id)currentScanResult
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 57, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA4110, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE5674;
    v18[3] = &unk_1E60BCE98;
    v18[4] = &v19;
    objc_msgSend_queryCurrentScanResultWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)capabilities
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 4, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA4170, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE5838;
    v18[3] = &unk_1E60BCDF8;
    v18[4] = &v19;
    objc_msgSend_queryInterfaceCapabilitiesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)powerOn
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 5, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA4190, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE59B4;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryPowerWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  char v16 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)powerState
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 147, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA41B0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE5B48;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryPowerStateWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)SSID
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 7, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3390, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE5D08;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_querySSIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)networkName
{
  uint64_t v5 = objc_msgSend_SSID(self, a2, v2, v3, v4);
  if (v5)
  {
    id v6 = [NSString alloc];
    uint64_t v9 = objc_msgSend_initWithData_encoding_(v6, v7, (uint64_t)v5, 4, v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)SSIDForVendor
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 8, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA33B0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE5F30;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_querySSIDForVendorWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)BSSID
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 9, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA33D0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE60F0;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_queryBSSIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)BSSIDForVendor
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 10, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA41D0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE62B0;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_queryBSSIDForVendorWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)perAntennaRSSI
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 18, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA41F0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE6470;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryRSSIWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (int64_t)RSSI
{
  uint64_t v5 = objc_msgSend_perAntennaRSSI(self, a2, v2, v3, v4);
  if (objc_msgSend_length(v5, v6, v7, v8, v9) == 52)
  {
    id v10 = v5;
    uint64_t v15 = objc_msgSend_bytes(v10, v11, v12, v13, v14);
    uint64_t v16 = 28;
    if (*(_DWORD *)(v15 + 4) == 1) {
      uint64_t v16 = 12;
    }
    int64_t v17 = *(int *)(v15 + v16);
  }
  else
  {
    int64_t v17 = 0;
  }

  return v17;
}

- (int64_t)noise
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 19, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA33F0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE6654;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryNoiseWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  int64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (unint64_t)CCA
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 178, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA4210, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE67A4;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryCCAWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  unint64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (double)txRate
{
  uint64_t v19 = 0;
  uint64_t v20 = (double *)&v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 20, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3CF0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE68FC;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryTxRateWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  double v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (double)txPower
{
  uint64_t v19 = 0;
  uint64_t v20 = (double *)&v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 21, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3410, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE6A54;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryTxPowerWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  double v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (double)rxRate
{
  uint64_t v19 = 0;
  uint64_t v20 = (double *)&v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 187, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3D10, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE6BAC;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryRxRateWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  double v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)authType
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 11, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3430, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE6D40;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAuthTypeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (unint64_t)securityType
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 12, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3DD0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE6EBC;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_querySecurityWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  unint64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (int64_t)WEPSubtype
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 13, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3450, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE700C;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryWEPSubtypeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  int64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (int64_t)WAPISubtype
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 14, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3DF0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE715C;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryWAPISubtypeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  int64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)countryCode
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 22, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3D30, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE72F0;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_queryCountryCodeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)setCompanionCountryCode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_1B4F51C8C;
  v31 = sub_1B4F51BF4;
  id v32 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 23, v8, v9))
  {
    XPCClient = self->_XPCClient;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B4FE754C;
    v26[3] = &unk_1E60BCD38;
    v26[4] = &v27;
    uint64_t v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v26, v11, v12);
    uint64_t v19 = objc_msgSend___adjustedRequestParameters(self, v15, v16, v17, v18);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B4FE755C;
    v25[3] = &unk_1E60BCD38;
    void v25[4] = &v27;
    objc_msgSend_setCompanionCountryCode_requestParams_reply_(v14, v20, (uint64_t)v6, (uint64_t)v19, (uint64_t)v25);
  }
  else
  {
    uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v10, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v14 = (void *)v28[5];
    v28[5] = v24;
  }

  uint64_t v21 = (void *)v28[5];
  if (a4 && v21)
  {
    *a4 = v21;
    uint64_t v21 = (void *)v28[5];
  }
  BOOL v22 = v21 == 0;
  _Block_object_dispose(&v27, 8);

  return v22;
}

- (int)opMode
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 30, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3E10, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE767C;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryOpModeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  int v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (int)PHYMode
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 29, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3D50, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE77CC;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryPHYModeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  int v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)maxPHYModeDescription
{
  uint64_t v5 = objc_msgSend_PHYMode(self, a2, v2, v3, v4);
  if (v5)
  {
    if ((v5 & 0x200) != 0)
    {
      uint64_t v9 = @"11BE";
    }
    else if ((v5 & 0x100) != 0)
    {
      uint64_t v9 = @"11AX";
    }
    else if ((v5 & 0x80) != 0)
    {
      uint64_t v9 = @"11AC";
    }
    else if ((v5 & 0x10) != 0)
    {
      uint64_t v9 = @"11N";
    }
    else if ((v5 & 8) != 0)
    {
      uint64_t v9 = @"11G";
    }
    else if ((v5 & 0x40) != 0)
    {
      uint64_t v9 = @"TURBO_G";
    }
    else if ((v5 & 2) != 0)
    {
      uint64_t v9 = @"11A";
    }
    else if ((v5 & 0x20) != 0)
    {
      uint64_t v9 = @"TURBO_A";
    }
    else if ((v5 & 4) != 0)
    {
      uint64_t v9 = @"11B";
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, v6, @"(%X)", v7, v8, v5);
      uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (int)supportedPHYModes
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 28, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3AD0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE7A08;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_querySupportedPHYModesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  int v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)channel
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 16, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3D70, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE7B9C;
    v18[3] = &unk_1E60BCF10;
    v18[4] = &v19;
    objc_msgSend_queryChannelWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)supportedChannelsWithCountryCode:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  int v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_1B4F51C8C;
  uint64_t v25 = sub_1B4F51BF4;
  id v26 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v5, 15, v6, v7))
  {
    uint64_t v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_1F0DA2E30, v9, v10);
    id v16 = objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4FE7D74;
    v20[3] = &unk_1E60BCDF8;
    v20[4] = &v21;
    objc_msgSend_querySupportedChannelsWithCountryCode_requestParams_reply_(v11, v17, (uint64_t)v4, (uint64_t)v16, (uint64_t)v20);
  }
  id v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (id)hardwareSupportedChannels
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 210, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2E50, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE7F34;
    v18[3] = &unk_1E60BCDF8;
    v18[4] = &v19;
    objc_msgSend_queryHardwareSupportedChannelsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (unsigned)__flagsForChannelBand:(unsigned int)a3 width:(int)a4
{
  if (a3 - 1 > 2) {
    unsigned int v4 = 0;
  }
  else {
    unsigned int v4 = dword_1B50318A0[a3 - 1];
  }
  unsigned int v5 = v4 | 0x400;
  int v6 = v4 | 0x800;
  if (a4 != 160) {
    int v6 = v4;
  }
  if (a4 != 80) {
    unsigned int v5 = v6;
  }
  int v7 = v4 | 2;
  if (a4 == 40) {
    v4 |= 4u;
  }
  if (a4 == 20) {
    unsigned int v4 = v7;
  }
  if (a4 <= 79) {
    return v4;
  }
  else {
    return v5;
  }
}

- (id)supportedChannel:(unint64_t)a3 band:(unsigned int)a4 width:(int)a5 countryCode:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  int v13 = objc_msgSend___flagsForChannelBand_width_(self, v11, v7, v6, v12);
  objc_msgSend_supportedChannelsWithCountryCode_(self, v14, (uint64_t)v10, v15, v16);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v19)
  {
    uint64_t v24 = v19;
    uint64_t v25 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v17);
        }
        uint64_t v27 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (objc_msgSend_channel(v27, v20, v21, v22, v23, (void)v30) == a3
          && (objc_msgSend_flags(v27, v20, v21, v22, v23) & v13) != 0)
        {
          id v28 = v27;
          goto LABEL_12;
        }
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v30, (uint64_t)v34, 16);
      if (v24) {
        continue;
      }
      break;
    }
  }
  id v28 = 0;
LABEL_12:

  return v28;
}

- (unint64_t)MCSIndex
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 26, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2E70, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE8288;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryMCSIndexWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  unint64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (unint64_t)guardInterval
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 25, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2E90, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE83D8;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryGuardIntervalWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  unint64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (unint64_t)numberOfSpatialStreams
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 27, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2EB0, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE8528;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryNumberOfSpatialStreamsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  unint64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (unint64_t)DTIMInterval
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 24, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2ED0, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE8678;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryDTIMIntervalWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  unint64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)parentInterfaceName
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 32, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2F10, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE880C;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_queryParentInterfaceNameWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (int)virtualInterfaceRole
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 31, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2F30, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE8988;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryVirtualInterfaceRoleWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  int v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)MACAddress
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 33, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2F50, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE8B1C;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_queryMACAddressWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)hardwareMACAddress
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 173, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2F70, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE8CDC;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_queryHardwareMACAddressWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IO80211ControllerInfo
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 114, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2F90, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE8E9C;
    v18[3] = &unk_1E60BCF38;
    v18[4] = &v19;
    objc_msgSend_queryIO80211ControllerInfoWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IO80211InterfaceInfo
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 115, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3AF0, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE905C;
    v18[3] = &unk_1E60BCF38;
    v18[4] = &v19;
    objc_msgSend_queryIO80211InterfaceInfoWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)cachedRoamStatus
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 142, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3D90, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE921C;
    v18[3] = &unk_1E60BCF60;
    v18[4] = &v19;
    objc_msgSend_queryRoamStatusWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)cachedJoinStatus
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 143, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2FB0, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE93DC;
    v18[3] = &unk_1E60BCF88;
    v18[4] = &v19;
    objc_msgSend_queryJoinStatusWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)cachedAutoJoinStatus
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 144, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA4070, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE959C;
    v18[3] = &unk_1E60BCFB0;
    v18[4] = &v19;
    objc_msgSend_queryAutoJoinStatusWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)wakeOnWirelessEnabled
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 38, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2FD0, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE9718;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryWoWEnabledWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  char v16 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)cachedLinkDownStatus
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 37, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2FF0, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE98AC;
    v18[3] = &unk_1E60BCFD8;
    v18[4] = &v19;
    objc_msgSend_queryLinkDownStatusWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)chainAck
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 148, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3DB0, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE9A6C;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryChainAckWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)txChainPower
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 149, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3B10, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE9C2C;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryTxChainPowerWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)desense
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 150, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA38F0, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE9DEC;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryDesenseWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)desenseLevel
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 151, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3B30, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FE9FAC;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryDesenseLevelWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)bluetoothCoexistenceConfig
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 152, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3030, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEA16C;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryBluetoothCoexConfigWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)bluetoothCoexistenceProfiles2GHz
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 153, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3B50, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEA32C;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryBluetoothCoexProfiles2GHzWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)bluetoothCoexistenceProfiles5GHz
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 154, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3050, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEA4EC;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryBluetoothCoexProfiles5GHzWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (int)bluetoothCoexistenceMode
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 155, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3070, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEA668;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryBluetoothCoexModeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  int v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)leakyAPStats
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 156, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3090, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEA7FC;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryLeakyAPStatsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)LQMSummary
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 175, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA30D0, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEA9BC;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryLQMSummaryWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)cachedLinkQualityMetric
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 167, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3110, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEAB7C;
    v18[3] = &unk_1E60BD000;
    v18[4] = &v19;
    objc_msgSend_queryLinkQualityMetricWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)powerDebugInfo
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 176, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3B70, v6, v7);
    int v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEAD3C;
    v18[3] = &unk_1E60BCF38;
    v18[4] = &v19;
    objc_msgSend_queryPowerDebugInfoWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (void)performAutoJoinWithParameters:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v8, 177, v9, v10))
  {
    XPCClient = self->_XPCClient;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1B4FEAF3C;
    v27[3] = &unk_1E60BCE48;
    id v13 = v7;
    id v28 = v13;
    id v17 = objc_msgSend_remoteObjectProxyWithErrorHandler_(XPCClient, v14, (uint64_t)v27, v15, v16);
    int v22 = objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B4FEAF54;
    v25[3] = &unk_1E60BCE48;
    id v26 = v13;
    objc_msgSend_performAutoJoinWithParameters_requestParams_reply_(v17, v23, (uint64_t)v6, (uint64_t)v22, (uint64_t)v25);
  }
  else if (v7)
  {
    id v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v11, *MEMORY[0x1E4F28798], 45, 0);
    (*((void (**)(id, void *))v7 + 2))(v7, v24);
  }
}

- (BOOL)performAutoJoinWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = sub_1B4F51C8C;
  long long v31 = sub_1B4F51BF4;
  id v32 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 177, v8, v9))
  {
    XPCClient = self->_XPCClient;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B4FEB15C;
    v26[3] = &unk_1E60BCD38;
    v26[4] = &v27;
    uint64_t v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v26, v11, v12);
    uint64_t v19 = objc_msgSend___adjustedRequestParameters(self, v15, v16, v17, v18);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B4FEB16C;
    v25[3] = &unk_1E60BCD38;
    void v25[4] = &v27;
    objc_msgSend_performAutoJoinWithParameters_requestParams_reply_(v14, v20, (uint64_t)v6, (uint64_t)v19, (uint64_t)v25);
  }
  else
  {
    uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v10, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v14 = (void *)v28[5];
    v28[5] = v24;
  }

  uint64_t v21 = (void *)v28[5];
  if (a4 && v21)
  {
    *a4 = v21;
    uint64_t v21 = (void *)v28[5];
  }
  BOOL v22 = v21 == 0;
  _Block_object_dispose(&v27, 8);

  return v22;
}

- (BOOL)userAutoJoinDisabled
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 179, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3910, v6, v7);
    id v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEB28C;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryUserAutoJoinStateWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  char v16 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (BOOL)setUserAutoJoinDisabled:(BOOL)a3 error:(id *)a4
{
  BOOL v6 = a3;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_1B4F51C8C;
  uint64_t v29 = sub_1B4F51BF4;
  id v30 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 180, (uint64_t)a4, v4))
  {
    XPCClient = self->_XPCClient;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1B4FEB4B4;
    v24[3] = &unk_1E60BCD38;
    v24[4] = &v25;
    uint64_t v12 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v8, (uint64_t)v24, v9, v10);
    uint64_t v17 = objc_msgSend___adjustedRequestParameters(self, v13, v14, v15, v16);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1B4FEB4C4;
    v23[3] = &unk_1E60BCD38;
    v23[4] = &v25;
    objc_msgSend_setUserAutoJoinState_requestParams_reply_(v12, v18, !v6, (uint64_t)v17, (uint64_t)v23);
  }
  else
  {
    uint64_t v22 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v8, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v12 = (void *)v26[5];
    void v26[5] = v22;
  }

  uint64_t v19 = (void *)v26[5];
  if (a4 && v19)
  {
    *a4 = v19;
    uint64_t v19 = (void *)v26[5];
  }
  BOOL v20 = v19 == 0;
  _Block_object_dispose(&v25, 8);

  return v20;
}

- (int64_t)autoHotspotMode
{
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 182, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3B90, v6, v7);
    id v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEB5E4;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryAutoHotspotModeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  int64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (BOOL)setAutoHotspotMode:(int64_t)a3 error:(id *)a4
{
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_1B4F51C8C;
  uint64_t v29 = sub_1B4F51BF4;
  id v30 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 183, (uint64_t)a4, v4))
  {
    XPCClient = self->_XPCClient;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1B4FEB80C;
    v24[3] = &unk_1E60BCD38;
    v24[4] = &v25;
    uint64_t v12 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v8, (uint64_t)v24, v9, v10);
    uint64_t v17 = objc_msgSend___adjustedRequestParameters(self, v13, v14, v15, v16);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1B4FEB81C;
    v23[3] = &unk_1E60BCD38;
    v23[4] = &v25;
    objc_msgSend_setAutoHotspotMode_requestParams_reply_(v12, v18, a3, (uint64_t)v17, (uint64_t)v23);
  }
  else
  {
    uint64_t v22 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v8, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v12 = (void *)v26[5];
    void v26[5] = v22;
  }

  uint64_t v19 = (void *)v26[5];
  if (a4 && v19)
  {
    *a4 = v19;
    uint64_t v19 = (void *)v26[5];
  }
  BOOL v20 = v19 == 0;
  _Block_object_dispose(&v25, 8);

  return v20;
}

- (unint64_t)wifiUIStateFlags
{
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 185, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3930, v6, v7);
    id v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEB93C;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryWiFiUIStateFlagsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  unint64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (unint64_t)maxLinkSpeed
{
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 211, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3BD0, v6, v7);
    id v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEBA8C;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryMaxLinkSpeedWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  unint64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (int)state
{
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 212, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3950, v6, v7);
    id v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEBBDC;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryStateWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  int v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (int)powersave
{
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 213, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3BF0, v6, v7);
    id v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEBD2C;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryPowersaveWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  int v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (unint64_t)maxNSSForAP
{
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 214, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3970, v6, v7);
    id v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEBE7C;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryMaxNSSForAPWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  unint64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (unint64_t)txNSS
{
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 215, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3C10, v6, v7);
    id v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEBFCC;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryTxNSSWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  unint64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)beaconCache
{
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 216, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3990, v6, v7);
    id v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEC160;
    v18[3] = &unk_1E60BCDF8;
    v18[4] = &v19;
    objc_msgSend_queryBeaconCacheWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)backgroundScanCache
{
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 241, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3770, v6, v7);
    id v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEC320;
    v18[3] = &unk_1E60BCDF8;
    v18[4] = &v19;
    objc_msgSend_queryBackgroundScanCacheWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)setBackgroundScanConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_1B4F51C8C;
  id v30 = sub_1B4F51BF4;
  id v31 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 244, v8, v9))
  {
    XPCClient = self->_XPCClient;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B4FEC548;
    v25[3] = &unk_1E60BCD38;
    void v25[4] = &v26;
    uint64_t v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v25, v11, v12);
    uint64_t v19 = objc_msgSend___adjustedRequestParameters(self, v15, v16, v17, v18);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1B4FEC558;
    v24[3] = &unk_1E60BCD38;
    v24[4] = &v26;
    objc_msgSend_setBackgroundScanConfiguration_requestParams_reply_(v14, v20, (uint64_t)v6, (uint64_t)v19, (uint64_t)v24);
  }
  uint64_t v21 = (void *)v27[5];
  if (a4 && v21)
  {
    *a4 = v21;
    uint64_t v21 = (void *)v27[5];
  }
  BOOL v22 = v21 == 0;
  _Block_object_dispose(&v26, 8);

  return v22;
}

- (id)backgroundScanConfiguration
{
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 241, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA39B0, v6, v7);
    id v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEC6BC;
    v18[3] = &unk_1E60BD028;
    v18[4] = &v19;
    objc_msgSend_queryBackgroundScanConfigurationWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)blockedBands
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_1B4F51C8C;
  id v24 = sub_1B4F51BF4;
  id v25 = 0;
  if (_os_feature_enabled_impl()
    && (objc_msgSend_allowRequestType_(self->_XPCClient, v3, 217, v4, v5) & 1) != 0)
  {
    uint64_t v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v6, (uint64_t)&unk_1F0DA2870, v7, v8);
    uint64_t v14 = objc_msgSend___adjustedRequestParameters(self, v10, v11, v12, v13);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1B4FEC894;
    v19[3] = &unk_1E60BCDF8;
    v19[4] = &v20;
    objc_msgSend_queryBlockedBandsWithRequestParams_reply_(v9, v15, (uint64_t)v14, (uint64_t)v19, v16);
  }
  id v17 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v17;
}

- (BOOL)setBlockedBands:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_1B4F51C8C;
  id v30 = sub_1B4F51BF4;
  id v31 = 0;
  if (_os_feature_enabled_impl()
    && (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 218, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B4FECB08;
    v25[3] = &unk_1E60BCD38;
    void v25[4] = &v26;
    uint64_t v13 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v7, (uint64_t)v25, v10, v11);
    uint64_t v18 = objc_msgSend___adjustedRequestParameters(self, v14, v15, v16, v17);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1B4FECB18;
    v24[3] = &unk_1E60BCD38;
    v24[4] = &v26;
    objc_msgSend_setBlockedBands_requestParams_reply_(v13, v19, (uint64_t)v6, (uint64_t)v18, (uint64_t)v24);
  }
  else
  {
    uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v7, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v13 = (void *)v27[5];
    void v27[5] = v23;
  }

  uint64_t v20 = (void *)v27[5];
  if (a4 && v20)
  {
    *a4 = v20;
    uint64_t v20 = (void *)v27[5];
  }
  BOOL v21 = v20 == 0;
  _Block_object_dispose(&v26, 8);

  return v21;
}

- (id)linkQualityMetricConfiguration
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 234, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA31B0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FECC7C;
    v18[3] = &unk_1E60BCF38;
    v18[4] = &v19;
    objc_msgSend_queryLQMConfigurationWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)setLinkQualityMetricConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_1B4F51C8C;
  id v31 = sub_1B4F51BF4;
  id v32 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 235, v8, v9))
  {
    XPCClient = self->_XPCClient;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B4FECED8;
    v26[3] = &unk_1E60BCD38;
    v26[4] = &v27;
    uint64_t v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v26, v11, v12);
    uint64_t v19 = objc_msgSend___adjustedRequestParameters(self, v15, v16, v17, v18);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B4FECEE8;
    v25[3] = &unk_1E60BCD38;
    void v25[4] = &v27;
    objc_msgSend_setLQMConfiguration_requestParams_reply_(v14, v20, (uint64_t)v6, (uint64_t)v19, (uint64_t)v25);
  }
  else
  {
    uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v10, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v14 = (void *)v28[5];
    v28[5] = v24;
  }

  uint64_t v21 = (void *)v28[5];
  if (a4 && v21)
  {
    *a4 = v21;
    uint64_t v21 = (void *)v28[5];
  }
  BOOL v22 = v21 == 0;
  _Block_object_dispose(&v27, 8);

  return v22;
}

- (BOOL)beginActivity:(id)a3 error:(id *)a4
{
  XPCClient = self->_XPCClient;
  id v7 = a3;
  uint64_t v12 = objc_msgSend___adjustedRequestParameters(self, v8, v9, v10, v11);
  LOBYTE(a4) = objc_msgSend_beginActivity_requestParameters_error_(XPCClient, v13, (uint64_t)v7, (uint64_t)v12, (uint64_t)a4);

  return (char)a4;
}

- (void)endActivity:(id)a3
{
  XPCClient = self->_XPCClient;
  id v5 = a3;
  objc_msgSend___adjustedRequestParameters(self, v6, v7, v8, v9);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endActivity_requestParameters_(XPCClient, v10, (uint64_t)v5, (uint64_t)v12, v11);
}

- (void)endAllActivities
{
  XPCClient = self->_XPCClient;
  objc_msgSend___adjustedRequestParameters(self, a2, v2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endAllActivities_(XPCClient, v6, (uint64_t)v9, v7, v8);
}

- (void)performActivity:(id)a3 usingBlock:(id)a4
{
  if (a3 && a4)
  {
    id v6 = (void (**)(void))a4;
    id v12 = a3;
    objc_msgSend_beginActivity_error_(self, v7, (uint64_t)v12, 0, v8);
    v6[2](v6);

    objc_msgSend_endActivity_(self, v9, (uint64_t)v12, v10, v11);
  }
}

- (BOOL)beginActivityType:(int64_t)a3 reason:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v13 = objc_msgSend_requestParameters(self, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_UUID(v13, v14, v15, v16, v17);
  uint64_t v20 = objc_msgSend_activityWithType_reason_UUID_(CWFActivity, v19, a3, (uint64_t)v8, (uint64_t)v18);

  XPCClient = self->_XPCClient;
  uint64_t v26 = objc_msgSend___adjustedRequestParameters(self, v22, v23, v24, v25);
  LOBYTE(a5) = objc_msgSend_beginActivity_requestParameters_error_(XPCClient, v27, (uint64_t)v20, (uint64_t)v26, (uint64_t)a5);

  return (char)a5;
}

- (void)endActivityType:(int64_t)a3
{
  uint64_t v7 = objc_msgSend_requestParameters(self, a2, a3, v3, v4);
  uint64_t v12 = objc_msgSend_UUID(v7, v8, v9, v10, v11);
  objc_msgSend_activityWithType_reason_UUID_(CWFActivity, v13, a3, 0, (uint64_t)v12);
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  XPCClient = self->_XPCClient;
  uint64_t v19 = objc_msgSend___adjustedRequestParameters(self, v15, v16, v17, v18);
  objc_msgSend_endActivity_requestParameters_(XPCClient, v20, (uint64_t)v22, (uint64_t)v19, v21);
}

- (id)activities
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 112, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA28B0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FED40C;
    v18[3] = &unk_1E60BCDF8;
    v18[4] = &v19;
    objc_msgSend_queryActivitiesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)systemActivities
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 113, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA31D0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FED5CC;
    v18[3] = &unk_1E60BCDF8;
    v18[4] = &v19;
    objc_msgSend_querySystemActivitiesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)eventIDs
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 98, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3210, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FED78C;
    v18[3] = &unk_1E60BD050;
    v18[4] = &v19;
    objc_msgSend_queryEventIDsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)systemEventIDs
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 99, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3C30, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FED94C;
    v18[3] = &unk_1E60BD050;
    v18[4] = &v19;
    objc_msgSend_querySystemEventIDsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)startMonitoringEventType:(int64_t)a3 error:(id *)a4
{
  uint64_t v7 = objc_msgSend_eventIDWithType_interfaceName_(CWFEventID, a2, a3, 0, v4);
  LOBYTE(a4) = objc_msgSend_startMonitoringEvent_error_(self, v8, (uint64_t)v7, (uint64_t)a4, v9);

  return (char)a4;
}

- (BOOL)startMonitoringEvent:(id)a3 error:(id *)a4
{
  XPCClient = self->_XPCClient;
  id v7 = a3;
  uint64_t v12 = objc_msgSend___adjustedRequestParameters(self, v8, v9, v10, v11);
  LOBYTE(a4) = objc_msgSend_startMonitoringEvent_requestParameters_error_(XPCClient, v13, (uint64_t)v7, (uint64_t)v12, (uint64_t)a4);

  return (char)a4;
}

- (void)stopMonitoringEventType:(int64_t)a3
{
  objc_msgSend_eventIDWithType_interfaceName_(CWFEventID, a2, a3, 0, v3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopMonitoringEvent_(self, v5, (uint64_t)v8, v6, v7);
}

- (void)stopMonitoringEvent:(id)a3
{
  XPCClient = self->_XPCClient;
  id v5 = a3;
  objc_msgSend___adjustedRequestParameters(self, v6, v7, v8, v9);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopMonitoringEvent_requestParameters_(XPCClient, v10, (uint64_t)v5, (uint64_t)v12, v11);
}

- (void)stopMonitoringAllEvents
{
  XPCClient = self->_XPCClient;
  objc_msgSend___adjustedRequestParameters(self, a2, v2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopMonitoringAllEvents_(XPCClient, v6, (uint64_t)v9, v7, v8);
}

- (void)setEventHandler:(id)a3 eventID:(id)a4
{
  objc_msgSend_setEventHandler_eventID_(self->_XPCClient, a2, (uint64_t)a3, (uint64_t)a4, v4);
}

- (id)eventHandlerWithEventID:(id)a3
{
  return (id)objc_msgSend_eventHandlerWithEventID_(self->_XPCClient, a2, (uint64_t)a3, v3, v4);
}

- (void)clearAllEventHandlers
{
}

- (id)knownNetworkProfilesWithProperties:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_1B4F51C8C;
  uint64_t v25 = sub_1B4F51BF4;
  id v26 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v5, 54, v6, v7))
  {
    uint64_t v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_1F0DA28D0, v9, v10);
    id v16 = objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4FEDD30;
    v20[3] = &unk_1E60BCDF8;
    v20[4] = &v21;
    objc_msgSend_queryKnownNetworkProfilesWithProperties_requestParams_reply_(v11, v17, (uint64_t)v4, (uint64_t)v16, (uint64_t)v20);
  }
  id v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (id)knownNetworkProfileMatchingScanResult:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_1B4F51C8C;
  uint64_t v25 = sub_1B4F51BF4;
  id v26 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v5, 56, v6, v7))
  {
    uint64_t v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_1F0DA3610, v9, v10);
    id v16 = objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4FEDF08;
    v20[3] = &unk_1E60BCEC0;
    v20[4] = &v21;
    objc_msgSend_queryKnownNetworkProfileMatchingScanResult_requestParams_reply_(v11, v17, (uint64_t)v4, (uint64_t)v16, (uint64_t)v20);
  }
  id v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (id)knownNetworkProfileMatchingNetworkProfile:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_1B4F51C8C;
  uint64_t v25 = sub_1B4F51BF4;
  id v26 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v5, 55, v6, v7))
  {
    uint64_t v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_1F0DA28F0, v9, v10);
    id v16 = objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4FEE0E0;
    v20[3] = &unk_1E60BCEC0;
    v20[4] = &v21;
    objc_msgSend_queryKnownNetworkProfileMatchingNetworkProfile_requestParams_reply_(v11, v17, (uint64_t)v4, (uint64_t)v16, (uint64_t)v20);
  }
  id v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (BOOL)updateKnownNetworkProfile:(id)a3 properties:(id)a4 OSSpecificKeys:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_1B4F51C8C;
  v37 = sub_1B4F51BF4;
  id v38 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v13, 61, v14, v15))
  {
    XPCClient = self->_XPCClient;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = sub_1B4FEE36C;
    v32[3] = &unk_1E60BCD38;
    v32[4] = &v33;
    uint64_t v20 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v16, (uint64_t)v32, v17, v18);
    uint64_t v25 = objc_msgSend___adjustedRequestParameters(self, v21, v22, v23, v24);
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = sub_1B4FEE37C;
    v31[3] = &unk_1E60BCD38;
    v31[4] = &v33;
    objc_msgSend_updateKnownNetworkProfile_properties_OSSpecificKeys_requestParams_reply_(v20, v26, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, v25, v31);
  }
  else
  {
    uint64_t v30 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v16, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v20 = (void *)v34[5];
    v34[5] = v30;
  }

  uint64_t v27 = (void *)v34[5];
  if (a6 && v27)
  {
    *a6 = v27;
    uint64_t v27 = (void *)v34[5];
  }
  BOOL v28 = v27 == 0;
  _Block_object_dispose(&v33, 8);

  return v28;
}

- (BOOL)updateKnownNetworkProfile:(id)a3 properties:(id)a4 error:(id *)a5
{
  return MEMORY[0x1F4181798](self, sel_updateKnownNetworkProfile_properties_OSSpecificKeys_error_, a3, a4, 0);
}

- (BOOL)addKnownNetworkProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  BOOL v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_1B4F51C8C;
  id v31 = sub_1B4F51BF4;
  id v32 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 59, v8, v9))
  {
    XPCClient = self->_XPCClient;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B4FEE588;
    v26[3] = &unk_1E60BCD38;
    v26[4] = &v27;
    uint64_t v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v26, v11, v12);
    uint64_t v19 = objc_msgSend___adjustedRequestParameters(self, v15, v16, v17, v18);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B4FEE598;
    v25[3] = &unk_1E60BCD38;
    void v25[4] = &v27;
    objc_msgSend_addKnownNetworkProfile_requestParams_reply_(v14, v20, (uint64_t)v6, (uint64_t)v19, (uint64_t)v25);
  }
  else
  {
    uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v10, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v14 = (void *)v28[5];
    v28[5] = v24;
  }

  uint64_t v21 = (void *)v28[5];
  if (a4 && v21)
  {
    *a4 = v21;
    uint64_t v21 = (void *)v28[5];
  }
  BOOL v22 = v21 == 0;
  _Block_object_dispose(&v27, 8);

  return v22;
}

- (BOOL)removeKnownNetworkProfile:(id)a3 reason:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_1B4F51C8C;
  uint64_t v33 = sub_1B4F51BF4;
  id v34 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v9, 60, v10, v11))
  {
    XPCClient = self->_XPCClient;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1B4FEE7A0;
    v28[3] = &unk_1E60BCD38;
    v28[4] = &v29;
    uint64_t v16 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v12, (uint64_t)v28, v13, v14);
    uint64_t v21 = objc_msgSend___adjustedRequestParameters(self, v17, v18, v19, v20);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1B4FEE7B0;
    v27[3] = &unk_1E60BCD38;
    void v27[4] = &v29;
    objc_msgSend_removeKnownNetworkProfile_reason_requestParams_reply_(v16, v22, (uint64_t)v8, a4, (uint64_t)v21, v27);
  }
  else
  {
    uint64_t v26 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v12, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v16 = (void *)v30[5];
    v30[5] = v26;
  }

  uint64_t v23 = (void *)v30[5];
  if (a5 && v23)
  {
    *a5 = v23;
    uint64_t v23 = (void *)v30[5];
  }
  BOOL v24 = v23 == 0;
  _Block_object_dispose(&v29, 8);

  return v24;
}

- (BOOL)updateKnownBSS:(id)a3 knownNetworkProfile:(id)a4 properties:(id)a5 OSSpecificKeys:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_1B4F51C8C;
  v40 = sub_1B4F51BF4;
  id v41 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v16, 200, v17, v18))
  {
    XPCClient = self->_XPCClient;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = sub_1B4FEE9F4;
    v35[3] = &unk_1E60BCD38;
    v35[4] = &v36;
    uint64_t v23 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v19, (uint64_t)v35, v20, v21);
    BOOL v28 = objc_msgSend___adjustedRequestParameters(self, v24, v25, v26, v27);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = sub_1B4FEEA04;
    v34[3] = &unk_1E60BCD38;
    v34[4] = &v36;
    objc_msgSend_updateKnownBSS_knownNetworkProfile_properties_OSSpecificKeys_requestParams_reply_(v23, v29, (uint64_t)v12, (uint64_t)v13, (uint64_t)v14, v15, v28, v34);
  }
  else
  {
    uint64_t v33 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v19, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v23 = (void *)v37[5];
    v37[5] = v33;
  }

  uint64_t v30 = (void *)v37[5];
  if (a7 && v30)
  {
    *a7 = v30;
    uint64_t v30 = (void *)v37[5];
  }
  BOOL v31 = v30 == 0;
  _Block_object_dispose(&v36, 8);

  return v31;
}

- (BOOL)updateKnownBSS:(id)a3 knownNetworkProfile:(id)a4 properties:(id)a5 error:(id *)a6
{
  return MEMORY[0x1F4181798](self, sel_updateKnownBSS_knownNetworkProfile_properties_OSSpecificKeys_error_, a3, a4, a5);
}

- (BOOL)addKnownBSS:(id)a3 knownNetworkProfile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  BOOL v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = sub_1B4F51C8C;
  id v34 = sub_1B4F51BF4;
  id v35 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v10, 198, v11, v12))
  {
    XPCClient = self->_XPCClient;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1B4FEEC24;
    v29[3] = &unk_1E60BCD38;
    v29[4] = &v30;
    uint64_t v17 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v13, (uint64_t)v29, v14, v15);
    BOOL v22 = objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1B4FEEC34;
    v28[3] = &unk_1E60BCD38;
    v28[4] = &v30;
    objc_msgSend_addKnownBSS_knownNetworkProfile_requestParams_reply_(v17, v23, (uint64_t)v8, (uint64_t)v9, (uint64_t)v22, v28);
  }
  else
  {
    uint64_t v27 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v13, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v17 = (void *)v31[5];
    void v31[5] = v27;
  }

  BOOL v24 = (void *)v31[5];
  if (a5 && v24)
  {
    *a5 = v24;
    BOOL v24 = (void *)v31[5];
  }
  BOOL v25 = v24 == 0;
  _Block_object_dispose(&v30, 8);

  return v25;
}

- (BOOL)removeKnownBSS:(id)a3 knownNetworkProfile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  BOOL v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = sub_1B4F51C8C;
  id v34 = sub_1B4F51BF4;
  id v35 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v10, 199, v11, v12))
  {
    XPCClient = self->_XPCClient;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1B4FEEE48;
    v29[3] = &unk_1E60BCD38;
    v29[4] = &v30;
    uint64_t v17 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v13, (uint64_t)v29, v14, v15);
    BOOL v22 = objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1B4FEEE58;
    v28[3] = &unk_1E60BCD38;
    v28[4] = &v30;
    objc_msgSend_removeKnownBSS_knownNetworkProfile_requestParams_reply_(v17, v23, (uint64_t)v8, (uint64_t)v9, (uint64_t)v22, v28);
  }
  else
  {
    uint64_t v27 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v13, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v17 = (void *)v31[5];
    void v31[5] = v27;
  }

  BOOL v24 = (void *)v31[5];
  if (a5 && v24)
  {
    *a5 = v24;
    BOOL v24 = (void *)v31[5];
  }
  BOOL v25 = v24 == 0;
  _Block_object_dispose(&v30, 8);

  return v25;
}

- (id)passwordForKnownNetworkProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = sub_1B4F51C8C;
  v37 = sub_1B4F51BF4;
  id v38 = 0;
  uint64_t v27 = 0;
  BOOL v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_1B4F51C8C;
  BOOL v31 = sub_1B4F51BF4;
  id v32 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 201, v8, v9))
  {
    XPCClient = self->_XPCClient;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B4FEF0A8;
    v26[3] = &unk_1E60BCD38;
    v26[4] = &v33;
    uint64_t v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v26, v11, v12);
    uint64_t v19 = objc_msgSend___adjustedRequestParameters(self, v15, v16, v17, v18);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B4FEF0B8;
    v25[3] = &unk_1E60BD078;
    void v25[4] = &v33;
    void v25[5] = &v27;
    objc_msgSend_queryPasswordForKnownNetworkProfile_requestParams_reply_(v14, v20, (uint64_t)v6, (uint64_t)v19, (uint64_t)v25);
  }
  uint64_t v21 = (void *)v34[5];
  if (a4 && v21)
  {
    *a4 = v21;
    uint64_t v21 = (void *)v34[5];
  }
  if (v21) {
    BOOL v22 = 0;
  }
  else {
    BOOL v22 = (void *)v28[5];
  }
  id v23 = v22;
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v23;
}

- (BOOL)setPassword:(id)a3 knownNetworkProfile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  BOOL v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = sub_1B4F51C8C;
  id v34 = sub_1B4F51BF4;
  id v35 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v10, 202, v11, v12))
  {
    XPCClient = self->_XPCClient;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1B4FEF344;
    v29[3] = &unk_1E60BCD38;
    v29[4] = &v30;
    uint64_t v17 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v13, (uint64_t)v29, v14, v15);
    BOOL v22 = objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1B4FEF354;
    v28[3] = &unk_1E60BCD38;
    v28[4] = &v30;
    objc_msgSend_setPassword_knownNetworkProfile_requestParams_reply_(v17, v23, (uint64_t)v8, (uint64_t)v9, (uint64_t)v22, v28);
  }
  else
  {
    uint64_t v27 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v13, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v17 = (void *)v31[5];
    void v31[5] = v27;
  }

  BOOL v24 = (void *)v31[5];
  if (a5 && v24)
  {
    *a5 = v24;
    BOOL v24 = (void *)v31[5];
  }
  BOOL v25 = v24 == 0;
  _Block_object_dispose(&v30, 8);

  return v25;
}

- (id)knownNetworkInfoForLocalNetworkPromptWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  BOOL v22 = &v21;
  uint64_t v23 = 0x3032000000;
  BOOL v24 = sub_1B4F51C8C;
  BOOL v25 = sub_1B4F51BF4;
  id v26 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v5, 248, v6, v7))
  {
    uint64_t v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_1F0DA2910, v9, v10);
    uint64_t v16 = objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4FEF4D0;
    v20[3] = &unk_1E60BCF38;
    v20[4] = &v21;
    objc_msgSend_queryKnownNetworkInfoForLocalNetworkPromptWithOptions_requestParams_reply_(v11, v17, (uint64_t)v4, (uint64_t)v16, (uint64_t)v20);
  }
  id v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (id)networkServiceID
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 120, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3790, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEF690;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_queryNetworkServiceIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)networkServiceName
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 121, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2930, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEF850;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_queryNetworkServiceNameWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)isNetworkServiceEnabled
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 122, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2950, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEF9CC;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryIsNetworkServiceEnabledWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  char v16 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (id)IPv4RouterAddress
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 117, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2990, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEFB60;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_queryIPv4RouterWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv4Addresses
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 116, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3A30, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEFD20;
    v18[3] = &unk_1E60BCDF8;
    v18[4] = &v19;
    objc_msgSend_queryIPv4AddressesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv4SubnetMasks
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 203, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA29B0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FEFEE0;
    v18[3] = &unk_1E60BCDF8;
    v18[4] = &v19;
    objc_msgSend_queryIPv4SubnetMasksWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv4ARPResolvedHardwareAddress
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 204, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3630, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF00A0;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_queryIPv4ARPResolvedHardwareAddressWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv4ARPResolvedIPAddress
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 205, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA37B0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF0260;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_queryIPv4ARPResolvedIPAddressWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv6RouterAddress
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 119, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3E30, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF0420;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_queryIPv6RouterWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv6Addresses
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 118, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA37D0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF05E0;
    v18[3] = &unk_1E60BCDF8;
    v18[4] = &v19;
    objc_msgSend_queryIPv6AddressesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)DNSServerAddresses
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 125, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3A50, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF07A0;
    v18[3] = &unk_1E60BCDF8;
    v18[4] = &v19;
    objc_msgSend_queryDNSServerAddressesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)DHCPLeaseStartedAt
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 123, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3530, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF0960;
    v18[3] = &unk_1E60BD0A0;
    v18[4] = &v19;
    objc_msgSend_queryDHCPLeaseStartTimeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)DHCPLeaseExpiresAt
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 124, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA39F0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF0B20;
    v18[3] = &unk_1E60BD0A0;
    v18[4] = &v19;
    objc_msgSend_queryDHCPLeaseExpirationTimeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)DHCPServerID
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 206, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3290, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF0CE0;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryDHCPServerIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)DHCPv6ServerID
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 207, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA32B0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF0EA0;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryDHCPv6ServerIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv4NetworkSignature
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 208, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA32D0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF1060;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_queryIPv4NetworkSignatureWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)IPv6NetworkSignature
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 209, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA29D0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF1220;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_queryIPv6NetworkSignatureWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv4InterfaceName
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 130, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA29F0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF13E0;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv4InterfaceNameWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv4NetworkServiceID
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 128, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2A10, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF15A0;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv4NetworkServiceIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv4NetworkServiceName
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 129, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2A30, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF1760;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv4NetworkServiceNameWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv4RouterAddress
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 127, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2A50, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF1920;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv4RouterWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv4Addresses
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 126, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2A70, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF1AE0;
    v18[3] = &unk_1E60BCDF8;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv4AddressesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv6InterfaceName
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 135, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2A90, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF1CA0;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv6InterfaceNameWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv6NetworkServiceID
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 133, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2AB0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF1E60;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv6NetworkServiceIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv6NetworkServiceName
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 134, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2AD0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF2020;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv6NetworkServiceNameWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv6RouterAddress
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 132, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2AF0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF21E0;
    v18[3] = &unk_1E60BCDD0;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv6RouterWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalIPv6Addresses
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 131, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3650, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF23A0;
    v18[3] = &unk_1E60BCDF8;
    v18[4] = &v19;
    objc_msgSend_queryGlobalIPv6AddressesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)globalDNSServerAddresses
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 136, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2B10, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF2560;
    v18[3] = &unk_1E60BCDF8;
    v18[4] = &v19;
    objc_msgSend_queryGlobalDNSServerAddressesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (unsigned)reachabilityFlags
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 137, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2B30, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF26DC;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryNetworkReachabilityWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  unsigned int v16 = *((_DWORD *)v20 + 6);
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (unsigned)EAP8021XSupplicantState
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_1B4F51C8C;
  id v24 = sub_1B4F51BF4;
  id v25 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 138, v2, v3))
  {
    uint64_t v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3C50, v7, v8);
    uint64_t v14 = objc_msgSend___adjustedRequestParameters(self, v10, v11, v12, v13);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1B4FF2860;
    v19[3] = &unk_1E60BCD80;
    v19[4] = &v20;
    objc_msgSend_queryEAP8021XSupplicantStateWithRequestParams_reply_(v9, v15, (uint64_t)v14, (uint64_t)v19, v16);
  }
  unsigned int v17 = objc_msgSend_unsignedIntValue((void *)v21[5], v5, v6, v7, v8);
  _Block_object_dispose(&v20, 8);

  return v17;
}

- (unsigned)EAP8021XControlMode
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_1B4F51C8C;
  id v24 = sub_1B4F51BF4;
  id v25 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 139, v2, v3))
  {
    uint64_t v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2B50, v7, v8);
    uint64_t v14 = objc_msgSend___adjustedRequestParameters(self, v10, v11, v12, v13);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1B4FF2A10;
    v19[3] = &unk_1E60BCD80;
    v19[4] = &v20;
    objc_msgSend_queryEAP8021XControlModeWithRequestParams_reply_(v9, v15, (uint64_t)v14, (uint64_t)v19, v16);
  }
  unsigned int v17 = objc_msgSend_unsignedIntValue((void *)v21[5], v5, v6, v7, v8);
  _Block_object_dispose(&v20, 8);

  return v17;
}

- (unsigned)EAP8021XControlState
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_1B4F51C8C;
  id v24 = sub_1B4F51BF4;
  id v25 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 140, v2, v3))
  {
    uint64_t v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2B70, v7, v8);
    uint64_t v14 = objc_msgSend___adjustedRequestParameters(self, v10, v11, v12, v13);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1B4FF2BC0;
    v19[3] = &unk_1E60BCD80;
    v19[4] = &v20;
    objc_msgSend_queryEAP8021XControlStateWithRequestParams_reply_(v9, v15, (uint64_t)v14, (uint64_t)v19, v16);
  }
  unsigned int v17 = objc_msgSend_unsignedIntValue((void *)v21[5], v5, v6, v7, v8);
  _Block_object_dispose(&v20, 8);

  return v17;
}

- (int)EAP8021XClientStatus
{
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_1B4F51C8C;
  id v24 = sub_1B4F51BF4;
  id v25 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 141, v2, v3))
  {
    uint64_t v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3C70, v7, v8);
    uint64_t v14 = objc_msgSend___adjustedRequestParameters(self, v10, v11, v12, v13);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1B4FF2D70;
    v19[3] = &unk_1E60BCD80;
    v19[4] = &v20;
    objc_msgSend_queryEAP8021XClientStatusWithRequestParams_reply_(v9, v15, (uint64_t)v14, (uint64_t)v19, v16);
  }
  int v17 = objc_msgSend_intValue((void *)v21[5], v5, v6, v7, v8);
  _Block_object_dispose(&v20, 8);

  return v17;
}

- (BOOL)startAWDLPeerAssistedDiscoveryWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  BOOL v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_1B4F51C8C;
  BOOL v31 = sub_1B4F51BF4;
  id v32 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 66, v8, v9))
  {
    XPCClient = self->_XPCClient;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B4FF2FCC;
    v26[3] = &unk_1E60BCD38;
    v26[4] = &v27;
    uint64_t v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v26, v11, v12);
    uint64_t v19 = objc_msgSend___adjustedRequestParameters(self, v15, v16, v17, v18);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B4FF2FDC;
    v25[3] = &unk_1E60BCD38;
    void v25[4] = &v27;
    objc_msgSend_startAWDLPeerAssistedDiscoveryWithParameters_requestParams_reply_(v14, v20, (uint64_t)v6, (uint64_t)v19, (uint64_t)v25);
  }
  else
  {
    uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v10, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v14 = (void *)v28[5];
    void v28[5] = v24;
  }

  uint64_t v21 = (void *)v28[5];
  if (a4 && v21)
  {
    *a4 = v21;
    uint64_t v21 = (void *)v28[5];
  }
  BOOL v22 = v21 == 0;
  _Block_object_dispose(&v27, 8);

  return v22;
}

- (void)stopAWDLPeerAssistedDiscovery
{
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 67, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2B90, v6, v7);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend___adjustedRequestParameters(self, v8, v9, v10, v11);
    objc_msgSend_stopAWDLPeerAssistedDiscoveryWithRequestParams_reply_(v15, v13, (uint64_t)v12, (uint64_t)&unk_1F0DA2BB0, v14);
  }
}

- (BOOL)setAWDLPeerTrafficRegistration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!self->_awdlServiceManager)
  {
    uint64_t v7 = (AWDLServiceDiscoveryManager *)objc_alloc_init(MEMORY[0x1E4FB6FA0]);
    awdlServiceManager = self->_awdlServiceManager;
    self->_awdlServiceManager = v7;
  }
  char v24 = 0;
  id v9 = objc_alloc(MEMORY[0x1E4FB6FA8]);
  uint64_t v14 = objc_msgSend_serializedRegistrationInfo(v6, v10, v11, v12, v13);
  isActive = objc_msgSend_initWithDictionary_isActive_(v9, v15, v14, (uint64_t)&v24, v16);
  if (isActive)
  {
    uint64_t v20 = self->_awdlServiceManager;
    if (v24) {
      char v21 = objc_msgSend_setTrafficRegistration_error_(v20, v17, (uint64_t)isActive, (uint64_t)a4, v18);
    }
    else {
      char v21 = objc_msgSend_clearTrafficRegistration_error_(v20, v17, (uint64_t)isActive, (uint64_t)a4, v18);
    }
    BOOL v22 = v21;
  }
  else if (a4)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v17, *MEMORY[0x1E4F28798], 22, 0);
    BOOL v22 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (id)AWDLPreferredChannels
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 40, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2BD0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF32E4;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLPreferredChannelsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLSyncEnabled
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 39, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3670, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF34A4;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLSyncEnabledWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLSyncState
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 41, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA37F0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF3664;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLSyncStateWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLSyncChannelSequence
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 42, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3690, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF3824;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLSyncChannelSequenceWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLStrategy
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 44, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3810, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF39E4;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLStrategyWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLElectionParameters
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 45, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3C90, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF3BA4;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLElectionParametersWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLPeerDatabase
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 48, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3830, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF3D64;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLPeerDatabaseWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLSocialTimeSlots
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 49, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA36B0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF3F24;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLSocialTimeSlotsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLElectionID
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 46, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3850, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF40E4;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLElectionIDWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLElectionRSSIThresholds
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 47, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2BF0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF42A4;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLElectionRSSIThresholdsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLMasterChannel
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 50, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3870, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF4464;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLMasterChannelWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLSecondaryMasterChannel
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 51, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2C10, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF4624;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLSecondaryMasterChannelWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLOpMode
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 52, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2C30, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF47E4;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLOpModeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLSyncParameters
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 43, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3A70, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF49A4;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLSyncParametersWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLStatistics
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 53, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2C50, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF4B64;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLStatisticsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLSidecarDiagnostics
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 146, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2C70, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF4D24;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLSidecarDiagnosticsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLExtensionStateMachineParameters
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 157, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3A90, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF4EE4;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLExtensionStateMachineParamsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLElectionMetric
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 158, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2C90, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF50A4;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLElectionMetricWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLPresenceMode
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 159, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA36D0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF5264;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLPresenceModeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLGuardTime
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 160, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2CB0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF5424;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLGuardTimeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLAvailabilityWindowAPAlignment
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 161, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2CD0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF55E4;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLAvailabilityWindowAPAlignmentWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLContinuousElectionAlgorithmEnabled
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 162, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2CF0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF57A4;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLContinuousElectionAlgorithmEnabledWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLAFTxMode
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 163, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA36F0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF5964;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLAFTxModeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLPeerTrafficRegistration
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 164, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2D10, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF5B24;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLPeerTrafficRegistrationWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLEncryptionType
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 165, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3710, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF5CE4;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLEncryptionTypeWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)AWDLBTLEStateParameters
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 166, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3890, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF5EA4;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryAWDLBTLEStateParamsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)rangingCapabilities
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 34, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3AB0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF6064;
    v18[3] = &unk_1E60BCEE8;
    v18[4] = &v19;
    objc_msgSend_queryRangingCapabilitiesWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)setRangeable:(BOOL)a3 peerList:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_1B4F51C8C;
  uint64_t v33 = sub_1B4F51BF4;
  id v34 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v9, 68, v10, v11))
  {
    XPCClient = self->_XPCClient;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1B4FF62C8;
    v28[3] = &unk_1E60BCD38;
    v28[4] = &v29;
    id v16 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v12, (uint64_t)v28, v13, v14);
    uint64_t v21 = objc_msgSend___adjustedRequestParameters(self, v17, v18, v19, v20);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1B4FF62D8;
    v27[3] = &unk_1E60BCD38;
    void v27[4] = &v29;
    objc_msgSend_setRangeable_peerList_requestParams_reply_(v16, v22, v6, (uint64_t)v8, (uint64_t)v21, v27);
  }
  else
  {
    uint64_t v26 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v12, *MEMORY[0x1E4F28798], 45, 0);
    id v16 = (void *)v30[5];
    v30[5] = v26;
  }

  uint64_t v23 = (void *)v30[5];
  if (a5 && v23)
  {
    *a5 = v23;
    uint64_t v23 = (void *)v30[5];
  }
  BOOL v24 = v23 == 0;
  _Block_object_dispose(&v29, 8);

  return v24;
}

- (void)performRangingWithPeerList:(id)a3 timeout:(unint64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v10, 69, v11, v12))
  {
    XPCClient = self->_XPCClient;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1B4FF6490;
    v29[3] = &unk_1E60BCE48;
    id v15 = v9;
    id v30 = v15;
    uint64_t v19 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v16, (uint64_t)v29, v17, v18);
    BOOL v24 = objc_msgSend___adjustedRequestParameters(self, v20, v21, v22, v23);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1B4FF64AC;
    v27[3] = &unk_1E60BCE70;
    id v28 = v15;
    objc_msgSend_performRangingWithPeerList_timeout_requestParams_reply_(v19, v25, (uint64_t)v8, a4, (uint64_t)v24, v27);
  }
  else if (v9)
  {
    uint64_t v26 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v13, *MEMORY[0x1E4F28798], 45, 0);
    (*((void (**)(id, void *, void))v9 + 2))(v9, v26, 0);
  }
}

- (id)performRangingWithPeerList:(id)a3 timeout:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = sub_1B4F51C8C;
  v39 = sub_1B4F51BF4;
  id v40 = 0;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_1B4F51C8C;
  uint64_t v33 = sub_1B4F51BF4;
  id v34 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v9, 69, v10, v11))
  {
    XPCClient = self->_XPCClient;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1B4FF672C;
    v28[3] = &unk_1E60BCD38;
    v28[4] = &v29;
    id v16 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v12, (uint64_t)v28, v13, v14);
    uint64_t v21 = objc_msgSend___adjustedRequestParameters(self, v17, v18, v19, v20);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1B4FF673C;
    v27[3] = &unk_1E60BCE20;
    void v27[4] = &v29;
    void v27[5] = &v35;
    objc_msgSend_performRangingWithPeerList_timeout_requestParams_reply_(v16, v22, (uint64_t)v8, a4, (uint64_t)v21, v27);
  }
  else
  {
    uint64_t v26 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v12, *MEMORY[0x1E4F28798], 45, 0);
    id v16 = (void *)v30[5];
    v30[5] = v26;
  }

  if (a5)
  {
    uint64_t v23 = (void *)v30[5];
    if (v23) {
      *a5 = v23;
    }
  }
  id v24 = (id)v36[5];
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v24;
}

- (BOOL)setRangingIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = sub_1B4F51C8C;
  uint64_t v31 = sub_1B4F51BF4;
  id v32 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 174, v8, v9))
  {
    XPCClient = self->_XPCClient;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B4FF69B4;
    v26[3] = &unk_1E60BCD38;
    v26[4] = &v27;
    uint64_t v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v26, v11, v12);
    uint64_t v19 = objc_msgSend___adjustedRequestParameters(self, v15, v16, v17, v18);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B4FF69C4;
    v25[3] = &unk_1E60BCD38;
    void v25[4] = &v27;
    objc_msgSend_setRangingIdentifier_requestParams_reply_(v14, v20, (uint64_t)v6, (uint64_t)v19, (uint64_t)v25);
  }
  else
  {
    uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v10, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v14 = (void *)v28[5];
    void v28[5] = v24;
  }

  uint64_t v21 = (void *)v28[5];
  if (a4 && v21)
  {
    *a4 = v21;
    uint64_t v21 = (void *)v28[5];
  }
  BOOL v22 = v21 == 0;
  _Block_object_dispose(&v27, 8);

  return v22;
}

- (id)performSensingWithParameters:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = sub_1B4F51C8C;
  uint64_t v36 = sub_1B4F51BF4;
  id v37 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_1B4F51C8C;
  id v30 = sub_1B4F51BF4;
  id v31 = 0;
  if (_os_feature_enabled_impl()
    && (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 188, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B4FF6C4C;
    v25[3] = &unk_1E60BCD38;
    void v25[4] = &v26;
    uint64_t v13 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v7, (uint64_t)v25, v10, v11);
    uint64_t v18 = objc_msgSend___adjustedRequestParameters(self, v14, v15, v16, v17);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1B4FF6C5C;
    v24[3] = &unk_1E60BD0C8;
    v24[4] = &v26;
    void v24[5] = &v32;
    objc_msgSend_performSensingWithParameters_requestParams_reply_(v13, v19, (uint64_t)v6, (uint64_t)v18, (uint64_t)v24);
  }
  else
  {
    uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v7, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v13 = (void *)v27[5];
    void v27[5] = v23;
  }

  if (a4)
  {
    uint64_t v20 = (void *)v27[5];
    if (v20) {
      *a4 = v20;
    }
  }
  id v21 = (id)v33[5];
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v21;
}

- (void)performSensingWithParameters:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl()
    && objc_msgSend_allowRequestType_(self->_XPCClient, v8, 188, v9, v10))
  {
    XPCClient = self->_XPCClient;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B4FF6E9C;
    v26[3] = &unk_1E60BCE48;
    id v12 = v7;
    id v27 = v12;
    uint64_t v16 = objc_msgSend_remoteObjectProxyWithErrorHandler_(XPCClient, v13, (uint64_t)v26, v14, v15);
    id v21 = objc_msgSend___adjustedRequestParameters(self, v17, v18, v19, v20);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1B4FF6EB8;
    v24[3] = &unk_1E60BD0F0;
    id v25 = v12;
    objc_msgSend_performSensingWithParameters_requestParams_reply_(v16, v22, (uint64_t)v6, (uint64_t)v21, (uint64_t)v24);
  }
  else if (v7)
  {
    uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v8, *MEMORY[0x1E4F28798], 45, 0);
    (*((void (**)(id, void *, void))v7 + 2))(v7, v23, 0);
  }
}

- (id)performNearbyDeviceDiscovery:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_1B4F51C8C;
  uint64_t v29 = sub_1B4F51BF4;
  uint64_t v5 = *MEMORY[0x1E4F28798];
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v6, *MEMORY[0x1E4F28798], 61, 0);
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl()
    && (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 238, v8, v9) & 1) != 0)
  {
    XPCClient = self->_XPCClient;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1B4FF70E4;
    v24[3] = &unk_1E60BCD38;
    void v24[4] = &v25;
    uint64_t v13 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v7, (uint64_t)v24, v10, v11);
    uint64_t v18 = objc_msgSend___adjustedRequestParameters(self, v14, v15, v16, v17);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1B4FF70F4;
    v23[3] = &unk_1E60BCD38;
    v23[4] = &v25;
    objc_msgSend_performNearbyDeviceDiscovery_requestParams_reply_(v13, v19, (uint64_t)v4, (uint64_t)v18, (uint64_t)v23);
  }
  else
  {
    uint64_t v22 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v7, v5, 45, 0);
    uint64_t v13 = (void *)v26[5];
    void v26[5] = v22;
  }

  id v20 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v20;
}

- (id)cachedAutoJoinMetric
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 193, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA38B0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF7258;
    v18[3] = &unk_1E60BD118;
    v18[4] = &v19;
    objc_msgSend_queryAutoJoinMetricWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)autoJoinStatistics
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 194, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3310, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF7418;
    v18[3] = &unk_1E60BD140;
    v18[4] = &v19;
    objc_msgSend_queryAutoJoinStatisticsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (void)resetAutoJoinStatistics
{
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 195, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3730, v6, v7);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend___adjustedRequestParameters(self, v8, v9, v10, v11);
    objc_msgSend_resetAutoJoinStatisticsWithRequestParams_reply_(v15, v13, (uint64_t)v12, (uint64_t)&unk_1F0DA38D0, v14);
  }
}

- (id)userSettings
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 189, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3750, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF767C;
    v18[3] = &unk_1E60BD168;
    v18[4] = &v19;
    objc_msgSend_queryUserSettingsWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (BOOL)applyUserSettings:(id)a3 properties:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = sub_1B4F51C8C;
  uint64_t v34 = sub_1B4F51BF4;
  id v35 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v10, 190, v11, v12))
  {
    XPCClient = self->_XPCClient;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1B4FF78EC;
    v29[3] = &unk_1E60BCD38;
    void v29[4] = &v30;
    uint64_t v17 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v13, (uint64_t)v29, v14, v15);
    uint64_t v22 = objc_msgSend___adjustedRequestParameters(self, v18, v19, v20, v21);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1B4FF78FC;
    v28[3] = &unk_1E60BCD38;
    v28[4] = &v30;
    objc_msgSend_setUserSettings_properties_requestParams_reply_(v17, v23, (uint64_t)v8, (uint64_t)v9, (uint64_t)v22, v28);
  }
  else
  {
    uint64_t v27 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v13, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v17 = (void *)v31[5];
    void v31[5] = v27;
  }

  id v24 = (void *)v31[5];
  if (a5 && v24)
  {
    *a5 = v24;
    id v24 = (void *)v31[5];
  }
  BOOL v25 = v24 == 0;
  _Block_object_dispose(&v30, 8);

  return v25;
}

- (BOOL)startHostAPModeWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_1B4F51C8C;
  id v31 = sub_1B4F51BF4;
  id v32 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 220, v8, v9))
  {
    XPCClient = self->_XPCClient;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B4FF7AFC;
    v26[3] = &unk_1E60BCD38;
    void v26[4] = &v27;
    uint64_t v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v10, (uint64_t)v26, v11, v12);
    uint64_t v19 = objc_msgSend___adjustedRequestParameters(self, v15, v16, v17, v18);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B4FF7B0C;
    v25[3] = &unk_1E60BCD38;
    void v25[4] = &v27;
    objc_msgSend_startHostAPModeWithConfiguration_requestParams_reply_(v14, v20, (uint64_t)v6, (uint64_t)v19, (uint64_t)v25);
  }
  else
  {
    uint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v10, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v14 = (void *)v28[5];
    void v28[5] = v24;
  }

  uint64_t v21 = (void *)v28[5];
  if (a4 && v21)
  {
    *a4 = v21;
    uint64_t v21 = (void *)v28[5];
  }
  BOOL v22 = v21 == 0;
  _Block_object_dispose(&v27, 8);

  return v22;
}

- (void)stopHostAPMode
{
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 221, v2, v3))
  {
    objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2D30, v6, v7);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend___adjustedRequestParameters(self, v8, v9, v10, v11);
    objc_msgSend_stopHostAPModeWithRequestParams_reply_(v15, v13, (uint64_t)v12, (uint64_t)&unk_1F0DA2D50, v14);
  }
}

- (id)hostAPStationList
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 233, v2, v3))
  {
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA3330, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF7D14;
    v18[3] = &unk_1E60BCDF8;
    v18[4] = &v19;
    objc_msgSend_queryHostAPStationListWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)privateMACAddressForNetworkProfile:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  BOOL v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_1B4F51C8C;
  BOOL v25 = sub_1B4F51BF4;
  id v26 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v5, 222, v6, v7))
  {
    uint64_t v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_1F0DA3350, v9, v10);
    id v16 = objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4FF7EEC;
    v20[3] = &unk_1E60BCDD0;
    v20[4] = &v21;
    objc_msgSend_queryPrivateMACAddressForNetworkProfile_requestParams_reply_(v11, v17, (uint64_t)v4, (uint64_t)v16, (uint64_t)v20);
  }
  id v18 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (int64_t)privateMACAddressModeForNetworkProfile:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  BOOL v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v5, 223, v6, v7))
  {
    uint64_t v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_1F0DA3370, v9, v10);
    id v16 = objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4FF8080;
    v20[3] = &unk_1E60BCD80;
    v20[4] = &v21;
    objc_msgSend_queryPrivateMACAddressModeForNetworkProfile_requestParams_reply_(v11, v17, (uint64_t)v4, (uint64_t)v16, (uint64_t)v20);
  }
  int64_t v18 = v22[3];
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (BOOL)setPrivateMACAddressMode:(int64_t)a3 networkProfile:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_1B4F51C8C;
  uint64_t v33 = sub_1B4F51BF4;
  id v34 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v9, 224, v10, v11))
  {
    XPCClient = self->_XPCClient;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1B4FF82B8;
    v28[3] = &unk_1E60BCD38;
    v28[4] = &v29;
    id v16 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v12, (uint64_t)v28, v13, v14);
    uint64_t v21 = objc_msgSend___adjustedRequestParameters(self, v17, v18, v19, v20);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1B4FF82C8;
    v27[3] = &unk_1E60BCD38;
    void v27[4] = &v29;
    objc_msgSend_setPrivateMACAddressMode_networkProfile_requestParams_reply_(v16, v22, a3, (uint64_t)v8, (uint64_t)v21, v27);
  }
  else
  {
    uint64_t v26 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v12, *MEMORY[0x1E4F28798], 45, 0);
    id v16 = (void *)v30[5];
    v30[5] = v26;
  }

  uint64_t v23 = (void *)v30[5];
  if (a5 && v23)
  {
    *a5 = v23;
    uint64_t v23 = (void *)v30[5];
  }
  BOOL v24 = v23 == 0;
  _Block_object_dispose(&v29, 8);

  return v24;
}

- (int64_t)privateMACAddressModeSystemSetting
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 225, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA2D70, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF83E8;
    v18[3] = &unk_1E60BCD80;
    v18[4] = &v19;
    objc_msgSend_queryPrivateMACAddressModeSystemSettingWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  int64_t v16 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v16;
}

- (BOOL)setPrivateMACAddressModeSystemSetting:(int64_t)a3 error:(id *)a4
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_1B4F51C8C;
  uint64_t v29 = sub_1B4F51BF4;
  id v30 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 226, (uint64_t)a4, v4))
  {
    XPCClient = self->_XPCClient;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1B4FF8610;
    v24[3] = &unk_1E60BCD38;
    void v24[4] = &v25;
    uint64_t v12 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v8, (uint64_t)v24, v9, v10);
    uint64_t v17 = objc_msgSend___adjustedRequestParameters(self, v13, v14, v15, v16);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1B4FF8620;
    v23[3] = &unk_1E60BCD38;
    v23[4] = &v25;
    objc_msgSend_setPrivateMACAddressModeSystemSetting_requestParams_reply_(v12, v18, a3, (uint64_t)v17, (uint64_t)v23);
  }
  else
  {
    uint64_t v22 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v8, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v12 = (void *)v26[5];
    void v26[5] = v22;
  }

  uint64_t v19 = (void *)v26[5];
  if (a4 && v19)
  {
    *a4 = v19;
    uint64_t v19 = (void *)v26[5];
  }
  BOOL v20 = v19 == 0;
  _Block_object_dispose(&v25, 8);

  return v20;
}

- (void)setPrivateMACAddressUserJoinFailureUIState:(BOOL)a3 networkProfile:(id)a4
{
  BOOL v4 = a3;
  id v19 = a4;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v6, 227, v7, v8))
  {
    uint64_t v12 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v9, (uint64_t)&unk_1F0DA2DB0, v10, v11);
    uint64_t v17 = objc_msgSend___adjustedRequestParameters(self, v13, v14, v15, v16);
    objc_msgSend_setPrivateMACAddressUserJoinFailureUIState_networkProfile_requestParams_reply_(v12, v18, v4, (uint64_t)v19, (uint64_t)v17, &unk_1F0DA2DD0);
  }
}

- (BOOL)isQuickProbeRequiredForNetworkProfile:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v5, 228, v6, v7))
  {
    uint64_t v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v8, (uint64_t)&unk_1F0DA2E10, v9, v10);
    uint64_t v16 = objc_msgSend___adjustedRequestParameters(self, v12, v13, v14, v15);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4FF880C;
    v20[3] = &unk_1E60BCD80;
    v20[4] = &v21;
    objc_msgSend_queryIsQuickProbeRequiredForNetworkProfile_requestParams_reply_(v11, v17, (uint64_t)v4, (uint64_t)v16, (uint64_t)v20);
  }
  char v18 = *((unsigned char *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return v18;
}

- (BOOL)reportQuickProbeResult:(BOOL)a3 networkProfile:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_1B4F51C8C;
  uint64_t v33 = sub_1B4F51BF4;
  id v34 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v9, 229, v10, v11))
  {
    XPCClient = self->_XPCClient;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = sub_1B4FF8A44;
    v28[3] = &unk_1E60BCD38;
    v28[4] = &v29;
    uint64_t v16 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(XPCClient, v12, (uint64_t)v28, v13, v14);
    uint64_t v21 = objc_msgSend___adjustedRequestParameters(self, v17, v18, v19, v20);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1B4FF8A54;
    v27[3] = &unk_1E60BCD38;
    void v27[4] = &v29;
    objc_msgSend_reportQuickProbeResult_networkProfile_requestParams_reply_(v16, v22, v6, (uint64_t)v8, (uint64_t)v21, v27);
  }
  else
  {
    uint64_t v26 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v12, *MEMORY[0x1E4F28798], 45, 0);
    uint64_t v16 = (void *)v30[5];
    v30[5] = v26;
  }

  uint64_t v23 = (void *)v30[5];
  if (a5 && v23)
  {
    *a5 = v23;
    uint64_t v23 = (void *)v30[5];
  }
  BOOL v24 = v23 == 0;
  _Block_object_dispose(&v29, 8);

  return v24;
}

- (id)getAutoJoinDenyList
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B4F51C8C;
  uint64_t v23 = sub_1B4F51BF4;
  id v24 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, a2, 245, v2, v3))
  {
    id v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v5, (uint64_t)&unk_1F0DA27B0, v6, v7);
    uint64_t v13 = objc_msgSend___adjustedRequestParameters(self, v9, v10, v11, v12);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B4FF8BB8;
    v18[3] = &unk_1E60BCDF8;
    v18[4] = &v19;
    objc_msgSend_queryAutoJoinDenyListWithRequestParams_reply_(v8, v14, (uint64_t)v13, (uint64_t)v18, v15);
  }
  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

- (id)setAutoJoinDenyListForNetwork:(id)a3 reason:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_1B4F51C8C;
  uint64_t v27 = sub_1B4F51BF4;
  id v28 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 246, v8, v9))
  {
    uint64_t v13 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v10, (uint64_t)&unk_1F0DA3CD0, v11, v12);
    uint64_t v18 = objc_msgSend___adjustedRequestParameters(self, v14, v15, v16, v17);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B4FF8DB4;
    v22[3] = &unk_1E60BCDF8;
    v22[4] = &v23;
    objc_msgSend_setAutoJoinDenyListForNetwork_reason_requestParams_reply_(v13, v19, (uint64_t)v6, a4, (uint64_t)v18, v22);
  }
  id v20 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v20;
}

- (id)clearAutoJoinDenyListForNetwork:(id)a3 reason:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_1B4F51C8C;
  uint64_t v27 = sub_1B4F51BF4;
  id v28 = 0;
  if (objc_msgSend_allowRequestType_(self->_XPCClient, v7, 247, v8, v9))
  {
    uint64_t v13 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self->_XPCClient, v10, (uint64_t)&unk_1F0DA3A10, v11, v12);
    uint64_t v18 = objc_msgSend___adjustedRequestParameters(self, v14, v15, v16, v17);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B4FF8FB0;
    v22[3] = &unk_1E60BCDF8;
    v22[4] = &v23;
    objc_msgSend_clearAutoJoinDenyListForNetwork_reason_requestParams_reply_(v13, v19, (uint64_t)v6, a4, (uint64_t)v18, v22);
  }
  id v20 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v20;
}

- (CWFXPCClient)XPCClient
{
  return self->_XPCClient;
}

- (AWDLServiceDiscoveryManager)awdlServiceManager
{
  return self->_awdlServiceManager;
}

- (void)setAwdlServiceManager:(id)a3
{
}

@end