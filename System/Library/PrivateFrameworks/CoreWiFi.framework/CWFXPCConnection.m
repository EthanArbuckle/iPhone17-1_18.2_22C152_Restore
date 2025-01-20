@interface CWFXPCConnection
+ (int)locationAuthorizationStatusForWiFiNetworking;
- (BOOL)__allowAlreadyPendingRequest:(id)a3;
- (BOOL)__allowXPCRequestWithType:(int64_t)a3 error:(id *)a4;
- (BOOL)__hasPendingRequestWithType:(int64_t)a3;
- (BOOL)__isUserPrivacySensitiveRequestType:(int64_t)a3;
- (BOOL)__shouldCoalesceEventTypeWhileSuspended:(int64_t)a3;
- (BOOL)__shouldDropEventTypeWhileSuspended:(int64_t)a3;
- (BOOL)isCodesignedByApple;
- (BOOL)isLocal;
- (BOOL)isVisible;
- (CWFXPCConnection)init;
- (CWFXPCConnection)initWithServiceType:(int64_t)a3 XPCConnection:(id)a4 bootArgs:(id)a5;
- (CWFXPCConnectionDelegate)delegate;
- (CWFXPCProxyConnection)localXPCProxyConnection;
- (CWFXPCProxyConnection)remoteXPCProxyConnection;
- (NSArray)bootArgs;
- (NSString)bundleID;
- (NSString)codesignID;
- (NSString)processName;
- (NSUUID)UUID;
- (NSXPCConnection)XPCConnection;
- (id)__addXPCRequestWithType:(int64_t)a3 info:(id)a4 requestParams:(id)a5 parentRequestUUID:(id)a6 isParentRequest:(BOOL)a7 reply:(id)a8;
- (id)__bundleIDFromAuditToken:(id *)a3;
- (id)__codesignIDFromAuditToken:(id *)a3;
- (id)__filterScanResultsForPrivacy:(id)a3;
- (id)__locationBundleIDOverride;
- (id)__matchedScanResultsWithKnownNetworkProfiles:(id)a3 scanResults:(id)a4;
- (id)__passpointScanResults:(id)a3;
- (id)__privacyFilteredScanResult:(id)a3 allowSSID:(BOOL)a4 allowBSSID:(BOOL)a5 allowCountryCode:(BOOL)a6;
- (id)__shouldPerformPreAssociation6GHzFollowupScan:(id)a3;
- (id)description;
- (id)invalidationHandler;
- (id)processState;
- (id)registeredActivities;
- (id)registeredEventIDs;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)valueForEntitlement:(id)a3;
- (int)locationAuthorizationStatus;
- (int64_t)serviceType;
- (unint64_t)__defaultTimeoutForRequestType:(int64_t)a3;
- (void)__addXPCGetRequestWithType:(int64_t)a3 requestParams:(id)a4 reply:(id)a5;
- (void)__addXPCRequestWithType:(int64_t)a3 info:(id)a4 requestParams:(id)a5 reply:(id)a6;
- (void)__coalesceAndCacheEvent:(id)a3;
- (void)__didInvalidate;
- (void)__matchKnownNetworksWithScanResults:(id)a3 parentXPCRequest:(id)a4;
- (void)__perform6GHzFollowupScanAndAssociateWithParameters:(id)a3 BSS:(id)a4 parentXPCRequest:(id)a5;
- (void)__performANQPWithParameters:(id)a3 parentXPCRequest:(id)a4;
- (void)__performFollowupANQPForPasspointScanResults:(id)a3 combinedScanResults:(id)a4 parameters:(id)a5 parentXPCRequest:(id)a6;
- (void)__performScanWithParameters:(id)a3 parentXPCRequest:(id)a4;
- (void)__updateXPCTransactionCount;
- (void)addKnownBSS:(id)a3 knownNetworkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6;
- (void)addKnownNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)associateWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)beginActivity:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)cancelRequestsWithUUID:(id)a3 reply:(id)a4;
- (void)clearAutoJoinDenyListForNetwork:(id)a3 reason:(unint64_t)a4 requestParams:(id)a5 reply:(id)a6;
- (void)disassociateWithReason:(int64_t)a3 requestParams:(id)a4 reply:(id)a5;
- (void)endActivityWithUUID:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)endAllActivitiesWithRequestParams:(id)a3 reply:(id)a4;
- (void)invalidate;
- (void)performANQPWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)performAutoJoinWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)performNearbyDeviceDiscovery:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)performRangingWithPeerList:(id)a3 timeout:(unint64_t)a4 requestParams:(id)a5 reply:(id)a6;
- (void)performScanWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)performSensingWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)queryAWDLAFTxModeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLAvailabilityWindowAPAlignmentWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLBTLEStateParamsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLContinuousElectionAlgorithmEnabledWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLElectionIDWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLElectionMetricWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLElectionParametersWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLElectionRSSIThresholdsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLEncryptionTypeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLExtensionStateMachineParamsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLGuardTimeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLMasterChannelWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLOpModeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLPeerDatabaseWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLPeerTrafficRegistrationWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLPreferredChannelsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLPresenceModeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLSecondaryMasterChannelWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLSidecarDiagnosticsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLSocialTimeSlotsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLStatisticsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLStrategyWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLSyncChannelSequenceWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLSyncEnabledWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLSyncParametersWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAWDLSyncStateWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryActivitiesWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAuthTypeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAutoHotspotModeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAutoJoinDenyListWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAutoJoinMetricWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAutoJoinStatisticsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryAutoJoinStatusWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryBSSIDForVendorWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryBSSIDWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryBackgroundScanCacheWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryBackgroundScanConfigurationWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryBeaconCacheWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryBlockedBandsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryBluetoothCoexConfigWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryBluetoothCoexModeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryBluetoothCoexProfiles2GHzWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryBluetoothCoexProfiles5GHzWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryCCAWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryChainAckWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryChannelWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryCountryBandSupport:(id)a3 reply:(id)a4;
- (void)queryCountryCodeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryCurrentKnownNetworkProfileWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryCurrentScanResultWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryDHCPLeaseExpirationTimeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryDHCPLeaseStartTimeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryDHCPServerIDWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryDHCPv6ServerIDWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryDNSServerAddressesWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryDTIMIntervalWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryDesenseLevelWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryDesenseWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryDeviceUUIDWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryEAP8021XClientStatusWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryEAP8021XControlModeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryEAP8021XControlStateWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryEAP8021XSupplicantStateWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryEventIDsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGlobalDNSServerAddressesWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGlobalIPv4AddressesWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGlobalIPv4InterfaceNameWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGlobalIPv4NetworkServiceIDWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGlobalIPv4NetworkServiceNameWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGlobalIPv4RouterWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGlobalIPv6AddressesWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGlobalIPv6InterfaceNameWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGlobalIPv6NetworkServiceIDWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGlobalIPv6NetworkServiceNameWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGlobalIPv6RouterWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryGuardIntervalWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryHardwareMACAddressWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryHardwareSupportedChannelsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryHostAPStationListWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIO80211ControllerInfoWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIO80211InterfaceInfoWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIPv4ARPResolvedHardwareAddressWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIPv4ARPResolvedIPAddressWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIPv4AddressesWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIPv4NetworkSignatureWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIPv4RouterWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIPv4SubnetMasksWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIPv6AddressesWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIPv6NetworkSignatureWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIPv6RouterWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryInterfaceCapabilitiesWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryInterfaceNameWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryInterfaceNamesWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIsNetworkServiceEnabledWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryIsQuickProbeRequiredForNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)queryJoinStatusWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryKnownNetworkInfoForLocalNetworkPromptWithOptions:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)queryKnownNetworkProfileMatchingNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)queryKnownNetworkProfileMatchingScanResult:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)queryKnownNetworkProfilesWithProperties:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)queryLQMConfigurationWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryLQMSummaryWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryLeakyAPStatsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryLinkDownStatusWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryLinkQualityMetricWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryMACAddressWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryMCSIndexWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryMaxLinkSpeedWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryMaxNSSForAPWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryNetworkReachabilityWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryNetworkServiceIDWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryNetworkServiceNameWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryNoiseWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryNumberOfSpatialStreamsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryOpModeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryPHYModeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryParentInterfaceNameWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryPasswordForKnownNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)queryPowerDebugInfoWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryPowerStateWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryPowerWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryPowersaveWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryPrivateMACAddressForNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)queryPrivateMACAddressModeForNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)queryPrivateMACAddressModeSystemSettingWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryRSSIWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryRangingCapabilitiesWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryRoamStatusWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryRxRateWithRequestParams:(id)a3 reply:(id)a4;
- (void)querySSIDForVendorWithRequestParams:(id)a3 reply:(id)a4;
- (void)querySSIDWithRequestParams:(id)a3 reply:(id)a4;
- (void)querySecurityWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryStateWithRequestParams:(id)a3 reply:(id)a4;
- (void)querySupportedChannelsWithCountryCode:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)querySupportedPHYModesWithRequestParams:(id)a3 reply:(id)a4;
- (void)querySystemActivitiesWithRequestParams:(id)a3 reply:(id)a4;
- (void)querySystemEventIDsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryThermalIndexWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryTxChainPowerWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryTxNSSWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryTxPowerWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryTxRateWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryUserAutoJoinStateWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryUserSettingsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryVirtualInterfaceNamesWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryVirtualInterfaceRoleWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryWAPISubtypeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryWEPSubtypeWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryWiFiAssistOverrideReasonsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryWiFiUIStateFlagsWithRequestParams:(id)a3 reply:(id)a4;
- (void)queryWoWEnabledWithRequestParams:(id)a3 reply:(id)a4;
- (void)removeKnownBSS:(id)a3 knownNetworkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6;
- (void)removeKnownNetworkProfile:(id)a3 reason:(int64_t)a4 requestParams:(id)a5 reply:(id)a6;
- (void)reportQuickProbeResult:(BOOL)a3 networkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6;
- (void)resetAutoJoinStatisticsWithRequestParams:(id)a3 reply:(id)a4;
- (void)resume;
- (void)sendXPCEvent:(id)a3 reply:(id)a4;
- (void)setAutoHotspotMode:(int64_t)a3 requestParams:(id)a4 reply:(id)a5;
- (void)setAutoJoinDenyListForNetwork:(id)a3 reason:(unint64_t)a4 requestParams:(id)a5 reply:(id)a6;
- (void)setBackgroundScanConfiguration:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)setBlockedBands:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)setChannel:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)setCompanionCountryCode:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLQMConfiguration:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)setPassword:(id)a3 knownNetworkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6;
- (void)setPower:(BOOL)a3 requestParams:(id)a4 reply:(id)a5;
- (void)setPrivateMACAddressMode:(int64_t)a3 networkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6;
- (void)setPrivateMACAddressModeSystemSetting:(int64_t)a3 requestParams:(id)a4 reply:(id)a5;
- (void)setPrivateMACAddressUserJoinFailureUIState:(BOOL)a3 networkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6;
- (void)setProcessState:(id)a3;
- (void)setRangeable:(BOOL)a3 peerList:(id)a4 requestParams:(id)a5 reply:(id)a6;
- (void)setRangingIdentifier:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)setRemoteXPCProxyConnection:(id)a3;
- (void)setThermalIndex:(int64_t)a3 requestParams:(id)a4 reply:(id)a5;
- (void)setUserAutoJoinState:(BOOL)a3 requestParams:(id)a4 reply:(id)a5;
- (void)setUserSettings:(id)a3 properties:(id)a4 requestParams:(id)a5 reply:(id)a6;
- (void)startAWDLPeerAssistedDiscoveryWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)startHostAPModeWithConfiguration:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)startMonitoringEvent:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)stopAWDLPeerAssistedDiscoveryWithRequestParams:(id)a3 reply:(id)a4;
- (void)stopHostAPModeWithRequestParams:(id)a3 reply:(id)a4;
- (void)stopMonitoringAllEventsWithRequestParams:(id)a3 reply:(id)a4;
- (void)stopMonitoringEvent:(id)a3 requestParams:(id)a4 reply:(id)a5;
- (void)suspend;
- (void)updateKnownBSS:(id)a3 knownNetworkProfile:(id)a4 properties:(id)a5 OSSpecificKeys:(id)a6 requestParams:(id)a7 reply:(id)a8;
- (void)updateKnownNetworkProfile:(id)a3 properties:(id)a4 OSSpecificKeys:(id)a5 requestParams:(id)a6 reply:(id)a7;
- (void)updateSoftAPBand:(unsigned int)a3 requestParams:(id)a4 reply:(id)a5;
@end

@implementation CWFXPCConnection

- (void)__addXPCGetRequestWithType:(int64_t)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1B4F4543C;
  v11[3] = &unk_1E60BBD70;
  id v12 = v8;
  id v9 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v10, a3, 0, (uint64_t)a4, v11);
}

- (void)__addXPCRequestWithType:(int64_t)a3 info:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  id v6 = (id)objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_(self, a2, a3, (uint64_t)a4, (uint64_t)a5, 0, 0, a6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteXPCProxyConnection, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_codesignID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_bootArgs, 0);
  objc_storeStrong((id *)&self->_XPCConnection, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_entitlementsCache, 0);
  objc_storeStrong((id *)&self->_XPCTransaction, 0);
  objc_storeStrong((id *)&self->_coalescedEvents, 0);
  objc_storeStrong((id *)&self->_processState, 0);
  objc_storeStrong((id *)&self->_mutablePendingEventAcknowledgements, 0);
  objc_storeStrong((id *)&self->_mutableEventIDs, 0);
  objc_storeStrong((id *)&self->_mutableActivities, 0);
  objc_storeStrong((id *)&self->_mutablePendingRequestMap, 0);
  objc_storeStrong((id *)&self->_ackQueue, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (id)remoteObjectProxy
{
  remoteXPCProxyConnection = self->_remoteXPCProxyConnection;
  if (!remoteXPCProxyConnection) {
    remoteXPCProxyConnection = self->_XPCConnection;
  }
  v7 = objc_msgSend_remoteObjectProxy(remoteXPCProxyConnection, a2, v2, v3, v4);
  return v7;
}

- (id)__addXPCRequestWithType:(int64_t)a3 info:(id)a4 requestParams:(id)a5 parentRequestUUID:(id)a6 isParentRequest:(BOOL)a7 reply:(id)a8
{
  uint64_t v269 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v219 = a8;
  v15 = objc_alloc_init(CWFXPCRequest);
  objc_msgSend_setType_(v15, v16, a3, v17, v18);
  v223 = v13;
  objc_msgSend_setRequestParameters_(v15, v19, (uint64_t)v13, v20, v21);
  objc_msgSend_setInfo_(v15, v22, (uint64_t)v12, v23, v24);
  v29 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v25, v26, v27, v28);
  objc_msgSend_setReceivedAt_(v15, v30, (uint64_t)v29, v31, v32);

  objc_msgSend_setIsSubrequest_(v15, v33, v14 != 0, v34, v35);
  v40 = objc_msgSend_UUID(v15, v36, v37, v38, v39);
  qos_class_t v216 = qos_class_self();
  v41 = CWFGetOSLog();
  if (v41)
  {
    v42 = CWFGetOSLog();
  }
  else
  {
    v42 = MEMORY[0x1E4F14500];
    id v43 = MEMORY[0x1E4F14500];
  }

  v220 = v14;
  id v221 = v12;
  int64_t v218 = a3;
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v48 = @"REQ";
    if (v14) {
      v48 = @"SUBREQ";
    }
    v210 = v48;
    v213 = sub_1B4F43CD0(a3, v44, v45, v46, v47);
    int v53 = objc_msgSend_processIdentifier(self->_XPCConnection, v49, v50, v51, v52);
    processName = self->_processName;
    bundleID = self->_bundleID;
    codesignID = self->_codesignID;
    v54 = sub_1B4F4B704(self->_serviceType);
    v59 = objc_msgSend_interfaceName(v223, v55, v56, v57, v58);
    v211 = v40;
    v64 = objc_msgSend_UUIDString(v40, v60, v61, v62, v63);
    uint64_t v68 = objc_msgSend_substringToIndex_(v64, v65, 5, v66, v67);
    int64_t v69 = a3;
    v70 = (void *)v68;
    char isUserPrivacySensitiveRequestType = objc_msgSend___isUserPrivacySensitiveRequestType_(self, v71, v69, v72, v73);
    if (isUserPrivacySensitiveRequestType)
    {
      v79 = @"<private>";
    }
    else
    {
      v206 = objc_msgSend_description(v12, v74, v75, v76, v77);
      objc_msgSend_redactedForWiFi(v206, v80, v81, v82, v83);
      v79 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    int v249 = 138545922;
    v250 = v210;
    __int16 v251 = 2114;
    *(void *)v252 = v213;
    *(_WORD *)&v252[8] = 1024;
    *(_DWORD *)&v252[10] = v53;
    __int16 v253 = 2114;
    v254 = processName;
    __int16 v255 = 2114;
    v256 = bundleID;
    __int16 v257 = 2114;
    v258 = codesignID;
    __int16 v259 = 2114;
    v260 = v54;
    __int16 v261 = 1024;
    qos_class_t v262 = v216;
    __int16 v263 = 2114;
    v264 = v59;
    __int16 v265 = 2114;
    v266 = v70;
    __int16 v267 = 2114;
    v268 = v79;
    LODWORD(v204) = 104;
    v202 = &v249;
    _os_log_send_and_compose_impl();
    if ((isUserPrivacySensitiveRequestType & 1) == 0)
    {
    }
    id v14 = v220;
    id v12 = v221;
    v40 = v211;
    a3 = v218;
  }

  __uint64_t v84 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  id v248 = 0;
  int v87 = objc_msgSend___allowXPCRequestWithType_error_(self, v85, a3, (uint64_t)&v248, v86);
  id v88 = v248;
  v93 = v88;
  v217 = v15;
  if (!v87)
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F79CA8;
    block[3] = &unk_1E60BBE38;
    id v225 = v88;
    id v226 = v14;
    int64_t v231 = a3;
    __uint64_t v232 = v84;
    v126 = v14;
    v227 = self;
    id v228 = v223;
    v127 = v219;
    id v229 = v40;
    id v230 = v219;
    id v128 = v40;
    id v129 = v223;
    id v130 = v14;
    id v131 = v93;
    id v132 = v219;
    dispatch_async(replyQueue, block);

    goto LABEL_40;
  }
  v214 = v88;
  v94 = objc_msgSend_requestParameters(v15, v89, v90, v91, v92);
  uint64_t v99 = objc_msgSend_timeout(v94, v95, v96, v97, v98);

  if (!v99)
  {
    int64_t defaultTimeoutOverride = self->_defaultTimeoutOverride;
    if (defaultTimeoutOverride < 0)
    {
      uint64_t v105 = objc_msgSend_type(v15, v100, v101, v102, v103);
      int64_t defaultTimeoutOverride = objc_msgSend___defaultTimeoutForRequestType_(self, v106, v105, v107, v108);
    }
    v109 = objc_msgSend_requestParameters(v15, v100, v101, v102, v103, v202, v204);
    objc_msgSend_setTimeout_(v109, v110, defaultTimeoutOverride, v111, v112);
  }
  __uint64_t v212 = v84;
  uint64_t v113 = objc_msgSend_queuePriority(v223, v100, v101, v102, v103, v202, v204);
  if (v113) {
    objc_msgSend_setQueuePriority_(v15, v114, v113, v116, v117);
  }
  uint64_t v118 = objc_msgSend_qualityOfService(v223, v114, v115, v116, v117);
  if (v118)
  {
    uint64_t v122 = v118;
    v123 = CWFGetOSLog();
    if (v123)
    {
      v124 = CWFGetOSLog();
    }
    else
    {
      v124 = MEMORY[0x1E4F14500];
      id v135 = MEMORY[0x1E4F14500];
    }
    v136 = v40;

    if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
    {
      v141 = objc_msgSend_UUIDString(v40, v137, v138, v139, v140);
      objc_msgSend_substringToIndex_(v141, v142, 5, v143, v144);
      v145 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v150 = objc_msgSend_qualityOfService(v223, v146, v147, v148, v149);
      int v249 = 138543874;
      v250 = v145;
      __int16 v251 = 1024;
      *(_DWORD *)v252 = v216;
      *(_WORD *)&v252[4] = 2048;
      *(void *)&v252[6] = v150;
      LODWORD(v205) = 28;
      v203 = &v249;
      _os_log_send_and_compose_impl();
    }
  }
  else
  {
    if (v216 > 0x14)
    {
      v136 = v40;
      HIDWORD(v155) = v216 - 9;
      LODWORD(v155) = v216 - 9;
      unsigned int v154 = v155 >> 2;
      if (v154 > 6) {
        objc_msgSend_setQualityOfService_(v15, v119, 0, v120, v121, v203, v205);
      }
      else {
        objc_msgSend_setQualityOfService_(v15, v119, qword_1B50316E8[v154], v120, v121, v203, v205);
      }
      goto LABEL_39;
    }
    v133 = CWFGetOSLog();
    if (v133)
    {
      v134 = CWFGetOSLog();
    }
    else
    {
      v134 = MEMORY[0x1E4F14500];
      id v160 = MEMORY[0x1E4F14500];
    }
    v136 = v40;

    if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
    {
      v165 = objc_msgSend_UUIDString(v40, v161, v162, v163, v164);
      objc_msgSend_substringToIndex_(v165, v166, 5, v167, v168);
      v169 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v249 = 138543362;
      v250 = v169;
      LODWORD(v205) = 12;
      v203 = &v249;
      _os_log_send_and_compose_impl();
    }
    uint64_t v122 = -1;
  }
  objc_msgSend_setQualityOfService_(v15, v151, v122, v152, v153, v203, v205);
LABEL_39:
  v170 = NSString;
  v171 = objc_msgSend_UUID(self, v156, v157, v158, v159);
  v176 = objc_msgSend_UUIDString(v171, v172, v173, v174, v175);
  v181 = objc_msgSend_UUIDString(v136, v177, v178, v179, v180);
  v185 = objc_msgSend_stringWithFormat_(v170, v182, @"%@/%@", v183, v184, v176, v181);
  objc_msgSend_setName_(v15, v186, (uint64_t)v185, v187, v188);

  v240[0] = MEMORY[0x1E4F143A8];
  v240[1] = 3221225472;
  v240[2] = sub_1B4F49160;
  v240[3] = &unk_1E60BBDC0;
  v240[4] = self;
  id v241 = v136;
  id v189 = v220;
  v127 = v219;
  int64_t v246 = v218;
  __uint64_t v247 = v212;
  id v242 = v189;
  id v243 = v223;
  v190 = v15;
  id v191 = v219;
  v93 = v214;
  id v244 = v214;
  id v245 = v191;
  id v192 = v136;
  id v193 = v223;
  id v194 = v214;
  objc_msgSend_setResponse_(v15, v195, (uint64_t)v240, v196, v197);
  mutexQueue = self->_mutexQueue;
  v233[0] = MEMORY[0x1E4F143A8];
  v233[1] = 3221225472;
  v233[2] = sub_1B4F492A8;
  v233[3] = &unk_1E60BBE10;
  id v234 = v189;
  v235 = self;
  v126 = v220;
  id v237 = v191;
  int64_t v238 = v218;
  v236 = v190;
  BOOL v239 = a7;
  id v199 = v189;
  id v200 = v191;
  v40 = v136;
  dispatch_async(mutexQueue, v233);

  id v12 = v221;
LABEL_40:

  return v217;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)sendXPCEvent:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v12 = objc_msgSend_interfaceName(v6, v8, v9, v10, v11);
  id v13 = objc_alloc_init(CWFEventID);
  uint64_t v18 = objc_msgSend_type(v6, v14, v15, v16, v17);
  objc_msgSend_setType_(v13, v19, v18, v20, v21);
  if (v12)
  {
    v22 = objc_alloc_init(CWFEventID);
    uint64_t v27 = objc_msgSend_type(v6, v23, v24, v25, v26);
    objc_msgSend_setType_(v22, v28, v27, v29, v30);
    objc_msgSend_setInterfaceName_(v22, v31, (uint64_t)v12, v32, v33);
  }
  else
  {
    v22 = 0;
  }
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F42768;
  block[3] = &unk_1E60BBD48;
  v40 = v22;
  v41 = self;
  v42 = v13;
  id v43 = v6;
  id v44 = v7;
  id v35 = v7;
  id v36 = v6;
  uint64_t v37 = v13;
  uint64_t v38 = v22;
  dispatch_async(mutexQueue, block);
}

- (BOOL)__isUserPrivacySensitiveRequestType:(int64_t)a3
{
  return (unint64_t)(a3 - 201) <= 1 && sub_1B4F558BC(self->_bootArgs) != 1;
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 192, 1);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (CWFXPCConnectionDelegate)delegate
{
  return (CWFXPCConnectionDelegate *)objc_getProperty(self, a2, 136, 1);
}

- (void)__didInvalidate
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v6 = objc_msgSend_registeredEventIDs(self, a2, v2, v3, v4);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v91, (uint64_t)v100, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v92;
    obuint64_t j = v6;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v92 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        id v13 = objc_alloc_init(CWFXPCRequest);
        uint64_t v18 = objc_msgSend_type(v12, v14, v15, v16, v17);
        uint64_t v19 = sub_1B4F5350C(v18);
        objc_msgSend_setType_(v13, v20, v19, v21, v22);
        v98[0] = @"EventID";
        v98[1] = @"Remove";
        v99[0] = v12;
        v99[1] = MEMORY[0x1E4F1CC38];
        uint64_t v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v23, (uint64_t)v99, (uint64_t)v98, 2);
        objc_msgSend_setInfo_(v13, v25, (uint64_t)v24, v26, v27);

        v90[0] = MEMORY[0x1E4F143A8];
        v90[1] = 3221225472;
        v90[2] = sub_1B4F77EE8;
        v90[3] = &unk_1E60BBCD0;
        v90[4] = self;
        v90[5] = v12;
        objc_msgSend_setResponse_(v13, v28, (uint64_t)v90, v29, v30);
        id v35 = objc_msgSend_delegate(self, v31, v32, v33, v34);
        objc_msgSend_XPCConnection_receivedXPCRequest_(v35, v36, (uint64_t)self, (uint64_t)v13, v37);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v38, (uint64_t)&v91, (uint64_t)v100, 16);
    }
    while (v9);

    id v6 = objc_msgSend_delegate(self, v39, v40, v41, v42);
    objc_msgSend_XPCConnection_updatedRegisteredEventIDs_(v6, v43, (uint64_t)self, 0, v44);
  }

  long long v89 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v86 = 0u;
  objc_msgSend_registeredActivities(self, v45, v46, v47, v48);
  id obja = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v49, (uint64_t)&v86, (uint64_t)v97, 16);
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v87;
    do
    {
      for (uint64_t j = 0; j != v51; ++j)
      {
        if (*(void *)v87 != v52) {
          objc_enumerationMutation(obja);
        }
        v54 = *(void **)(*((void *)&v86 + 1) + 8 * j);
        v55 = objc_alloc_init(CWFXPCRequest);
        uint64_t v60 = objc_msgSend_type(v54, v56, v57, v58, v59);
        uint64_t v61 = sub_1B4F534E8(v60);
        objc_msgSend_setType_(v55, v62, v61, v63, v64);
        v95[0] = @"EventID";
        v95[1] = @"Remove";
        v96[0] = v54;
        v96[1] = MEMORY[0x1E4F1CC38];
        uint64_t v66 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v65, (uint64_t)v96, (uint64_t)v95, 2);
        objc_msgSend_setInfo_(v55, v67, (uint64_t)v66, v68, v69);

        v85[0] = MEMORY[0x1E4F143A8];
        v85[1] = 3221225472;
        v85[2] = sub_1B4F77FA8;
        v85[3] = &unk_1E60BBCD0;
        v85[4] = self;
        v85[5] = v54;
        objc_msgSend_setResponse_(v55, v70, (uint64_t)v85, v71, v72);
        uint64_t v77 = objc_msgSend_delegate(self, v73, v74, v75, v76);
        objc_msgSend_XPCConnection_receivedXPCRequest_(v77, v78, (uint64_t)self, (uint64_t)v55, v79);
      }
      uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v80, (uint64_t)&v86, (uint64_t)v97, 16);
    }
    while (v51);
  }

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F362DC;
  block[3] = &unk_1E60BB768;
  void block[4] = self;
  dispatch_async(mutexQueue, block);
}

- (id)registeredEventIDs
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C2C;
  uint64_t v10 = sub_1B4F51BC4;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4F34DC0;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (unint64_t)__defaultTimeoutForRequestType:(int64_t)a3
{
  unint64_t result = 4000000000;
  if (a3 > 180)
  {
    if (a3 > 187)
    {
      if ((unint64_t)(a3 - 192) <= 0x32)
      {
        if (((1 << (a3 + 64)) & 0x5818000000031) != 0) {
          return 20000000000;
        }
        if (a3 == 220 || a3 == 238) {
          return 10000000000;
        }
      }
      BOOL v4 = a3 == 188;
      unint64_t v5 = 60000000000;
LABEL_17:
      if (v4) {
        return v5;
      }
      return result;
    }
    if (a3 != 181 && a3 != 184 && a3 != 186) {
      return result;
    }
    return 20000000000;
  }
  switch(a3)
  {
    case '>':
    case '@':
      unint64_t result = 120000000000;
      break;
    case '?':
    case 'B':
    case 'C':
    case 'D':
    case 'O':
      return result;
    case 'A':
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'J':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'P':
    case 'Q':
    case 'R':
    case 'S':
    case 'T':
    case 'U':
    case 'V':
    case 'W':
    case 'X':
    case 'Y':
    case 'Z':
    case '[':
    case '\\':
    case ']':
    case '^':
      return 20000000000;
    default:
      BOOL v4 = a3 == 6;
      unint64_t v5 = 10000000000;
      goto LABEL_17;
  }
  return result;
}

- (BOOL)__allowXPCRequestWithType:(int64_t)a3 error:(id *)a4
{
  unint64_t v5 = a4;
  uint64_t v235 = *MEMORY[0x1E4F143B8];
  __int16 v230 = 0;
  if ((unint64_t)(a3 - 249) <= 0xFFFFFFFFFFFFFF07)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], a2, *MEMORY[0x1E4F28798], 22, 0);
    id v50 = (id)objc_claimAutoreleasedReturnValue();
    id v78 = 0;
    uint64_t v34 = 0;
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = sub_1B4F4BA0C(self->_serviceType, a2, a3, (uint64_t)a4, v4);
    id v12 = objc_msgSend_numberWithInteger_(NSNumber, v9, a3, v10, v11);
    char v16 = objc_msgSend_containsObject_(v8, v13, (uint64_t)v12, v14, v15);

    if (v16)
    {
      if (objc_msgSend_containsObject_(self->_bootArgs, v17, @"corewifi_api_enforcement_disable=1", v18, v19))
      {
        uint64_t v24 = CWFGetOSLog();
        if (v24)
        {
          uint64_t v25 = CWFGetOSLog();
        }
        else
        {
          uint64_t v25 = MEMORY[0x1E4F14500];
          id v53 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          int v58 = objc_msgSend_processIdentifier(self->_XPCConnection, v54, v55, v56, v57);
          processName = self->_processName;
          bundleID = self->_bundleID;
          codesignID = self->_codesignID;
          uint64_t v62 = sub_1B4F4B704(self->_serviceType);
          sub_1B4F43CD0(a3, v63, v64, v65, v66);
          int v232 = 67110402;
          *(_DWORD *)v233 = v58;
          *(_WORD *)&void v233[4] = 2114;
          *(void *)&v233[6] = processName;
          *(_WORD *)&v233[14] = 2114;
          *(void *)&v233[16] = bundleID;
          *(_WORD *)&v233[24] = 2114;
          *(void *)&v233[26] = codesignID;
          *(_WORD *)&v233[34] = 2114;
          *(void *)&v233[36] = v62;
          *(void *)&v233[46] = *(_WORD *)&v233[44] = 2114;
          _os_log_send_and_compose_impl();
        }
LABEL_33:

        id v50 = 0;
        uint64_t v29 = 0;
        id v78 = 0;
LABEL_34:
        BOOL v79 = 1;
        goto LABEL_35;
      }
      if (objc_msgSend_isLocal(self, v20, v21, v22, v23))
      {
        uint64_t v28 = CWFGetOSLog();
        if (v28)
        {
          uint64_t v25 = CWFGetOSLog();
        }
        else
        {
          uint64_t v25 = MEMORY[0x1E4F14500];
          id v72 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v73 = sub_1B4F4B704(self->_serviceType);
          sub_1B4F43CD0(a3, v74, v75, v76, v77);
          int v232 = 138543618;
          *(void *)v233 = v73;
          *(void *)&v233[10] = *(_WORD *)&v233[8] = 2114;
          _os_log_send_and_compose_impl();
        }
        goto LABEL_33;
      }
      uint64_t v29 = sub_1B4F4E090(self->_serviceType, (const char *)a3, &v230, v26, v27);
      v220 = v5;
      if (objc_msgSend_count(v29, v30, v31, v32, v33))
      {
        long long v228 = 0u;
        long long v229 = 0u;
        long long v226 = 0u;
        long long v227 = 0u;
        uint64_t v34 = v29;
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v226, (uint64_t)v234, 16);
        if (v36)
        {
          uint64_t v40 = v36;
          uint64_t v41 = *(void *)v227;
          while (2)
          {
            for (uint64_t i = 0; i != v40; ++i)
            {
              if (*(void *)v227 != v41) {
                objc_enumerationMutation(v34);
              }
              id v43 = objc_msgSend_valueForEntitlement_(self, v37, *(void *)(*((void *)&v226 + 1) + 8 * i), v38, v39);
              char v48 = objc_msgSend_BOOLValue(v43, v44, v45, v46, v47);

              if (v48)
              {
                uint64_t v67 = v34;
                goto LABEL_25;
              }
            }
            uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v226, (uint64_t)v234, 16);
            if (v40) {
              continue;
            }
            break;
          }
        }

        if ((_BYTE)v230)
        {
          objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v49, *MEMORY[0x1E4F28798], 1, 0);
          id v50 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v51 = CWFGetOSLog();
          unint64_t v5 = v220;
          if (v51)
          {
            uint64_t v52 = CWFGetOSLog();
          }
          else
          {
            uint64_t v52 = MEMORY[0x1E4F14500];
            id v106 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            int v111 = objc_msgSend_processIdentifier(self->_XPCConnection, v107, v108, v109, v110);
            uint64_t v112 = self->_processName;
            uint64_t v113 = self->_bundleID;
            v217 = self->_codesignID;
            v114 = sub_1B4F4B704(self->_serviceType);
            v119 = sub_1B4F43CD0(a3, v115, v116, v117, v118);
            v123 = objc_msgSend_componentsJoinedByString_(v34, v120, @",", v121, v122);
            int v232 = 67110658;
            *(_DWORD *)v233 = v111;
            *(_WORD *)&void v233[4] = 2114;
            *(void *)&v233[6] = v112;
            *(_WORD *)&v233[14] = 2114;
            *(void *)&v233[16] = v113;
            *(_WORD *)&v233[24] = 2114;
            *(void *)&v233[26] = v217;
            *(_WORD *)&v233[34] = 2114;
            *(void *)&v233[36] = v114;
            *(_WORD *)&v233[44] = 2114;
            *(void *)&v233[46] = v119;
            *(_WORD *)&v233[54] = 2114;
            *(void *)&v233[56] = v123;
            _os_log_send_and_compose_impl();

            unint64_t v5 = v220;
          }

          id v78 = 0;
          goto LABEL_56;
        }
        uint64_t v162 = CWFGetOSLog();
        if (v162)
        {
          uint64_t v67 = CWFGetOSLog();
        }
        else
        {
          uint64_t v67 = MEMORY[0x1E4F14500];
          id v186 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v187 = self->_processName;
          uint64_t v188 = sub_1B4F4B704(self->_serviceType);
          id v193 = sub_1B4F43CD0(a3, v189, v190, v191, v192);
          uint64_t v197 = objc_msgSend_componentsJoinedByString_(v34, v194, @",", v195, v196);
          int v232 = 138544130;
          *(void *)v233 = v187;
          *(_WORD *)&v233[8] = 2114;
          *(void *)&v233[10] = v188;
          *(_WORD *)&v233[18] = 2114;
          *(void *)&v233[20] = v193;
          *(_WORD *)&v233[28] = 2114;
          *(void *)&v233[30] = v197;
          LODWORD(v215) = 42;
          v214 = &v232;
          _os_log_send_and_compose_impl();
        }
LABEL_25:
      }
      char v68 = sub_1B4F4AB3C(self->_serviceType, a3, self->_processName, (char *)&v230);
      if ((_BYTE)v230)
      {
        if ((v68 & 1) == 0)
        {
          objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v69, *MEMORY[0x1E4F28798], 1, 0);
          id v50 = (id)objc_claimAutoreleasedReturnValue();
          v70 = CWFGetOSLog();
          if (v70)
          {
            uint64_t v71 = CWFGetOSLog();
          }
          else
          {
            uint64_t v71 = MEMORY[0x1E4F14500];
            id v163 = MEMORY[0x1E4F14500];
          }

          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            int v168 = objc_msgSend_processIdentifier(self->_XPCConnection, v164, v165, v166, v167);
            v169 = self->_processName;
            v170 = self->_bundleID;
            v171 = self->_codesignID;
            v172 = sub_1B4F4B704(self->_serviceType);
            v177 = sub_1B4F43CD0(a3, v173, v174, v175, v176);
            int v232 = 67110402;
            *(_DWORD *)v233 = v168;
            *(_WORD *)&void v233[4] = 2114;
            *(void *)&v233[6] = v169;
            *(_WORD *)&v233[14] = 2114;
            *(void *)&v233[16] = v170;
            *(_WORD *)&v233[24] = 2114;
            *(void *)&v233[26] = v171;
            *(_WORD *)&v233[34] = 2114;
            *(void *)&v233[36] = v172;
            *(_WORD *)&v233[44] = 2114;
            *(void *)&v233[46] = v177;
            _os_log_send_and_compose_impl();
          }
          id v78 = 0;
LABEL_75:
          uint64_t v34 = v29;
          unint64_t v5 = v220;
          goto LABEL_56;
        }
      }
      else if ((v68 & 1) == 0)
      {
        id v160 = CWFGetOSLog();
        if (v160)
        {
          v161 = CWFGetOSLog();
        }
        else
        {
          v161 = MEMORY[0x1E4F14500];
          id v178 = MEMORY[0x1E4F14500];
        }

        if (os_log_type_enabled(v161, OS_LOG_TYPE_FAULT))
        {
          uint64_t v179 = self->_processName;
          uint64_t v180 = sub_1B4F4B704(self->_serviceType);
          v185 = sub_1B4F43CD0(a3, v181, v182, v183, v184);
          int v232 = 138543874;
          *(void *)v233 = v179;
          *(_WORD *)&v233[8] = 2114;
          *(void *)&v233[10] = v180;
          *(_WORD *)&v233[18] = 2114;
          *(void *)&v233[20] = v185;
          LODWORD(v215) = 32;
          v214 = &v232;
          _os_log_send_and_compose_impl();
        }
      }
      bootArgs = self->_bootArgs;
      uint64_t v81 = self->_processName;
      int64_t serviceType = self->_serviceType;
      id v225 = 0;
      int v84 = sub_1B4F4AFD0(serviceType, a3, v81, bootArgs, &v225);
      id v85 = v225;
      id v78 = v85;
      if (v84)
      {
        long long v223 = 0u;
        long long v224 = 0u;
        long long v221 = 0u;
        long long v222 = 0u;
        id v78 = v85;
        uint64_t v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v86, (uint64_t)&v221, (uint64_t)v231, 16);
        if (v87)
        {
          uint64_t v91 = v87;
          uint64_t v92 = *(void *)v222;
          while (2)
          {
            for (uint64_t j = 0; j != v91; ++j)
            {
              if (*(void *)v222 != v92) {
                objc_enumerationMutation(v78);
              }
              long long v94 = objc_msgSend_valueForEntitlement_(self, v88, *(void *)(*((void *)&v221 + 1) + 8 * j), v89, v90, v214, v215);
              char v99 = objc_msgSend_BOOLValue(v94, v95, v96, v97, v98);

              if (v99)
              {

                goto LABEL_51;
              }
            }
            uint64_t v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v78, v88, (uint64_t)&v221, (uint64_t)v231, 16);
            if (v91) {
              continue;
            }
            break;
          }
        }

        if (HIBYTE(v230))
        {
          if (objc_msgSend_isCodesignedByApple(self, v100, v101, v102, v103))
          {
            v104 = CWFGetOSLog();
            if (v104)
            {
              uint64_t v105 = CWFGetOSLog();
            }
            else
            {
              uint64_t v105 = MEMORY[0x1E4F14500];
              id v132 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
            {
              int v137 = objc_msgSend_processIdentifier(self->_XPCConnection, v133, v134, v135, v136);
              uint64_t v138 = self->_processName;
              uint64_t v139 = self->_bundleID;
              uint64_t v140 = self->_codesignID;
              v141 = sub_1B4F4B704(self->_serviceType);
              v146 = sub_1B4F43CD0(a3, v142, v143, v144, v145);
              int v232 = 67110402;
              *(_DWORD *)v233 = v137;
              *(_WORD *)&void v233[4] = 2114;
              *(void *)&v233[6] = v138;
              *(_WORD *)&v233[14] = 2114;
              *(void *)&v233[16] = v139;
              *(_WORD *)&v233[24] = 2114;
              *(void *)&v233[26] = v140;
              *(_WORD *)&v233[34] = 2114;
              *(void *)&v233[36] = v141;
              *(_WORD *)&v233[44] = 2114;
              *(void *)&v233[46] = v146;
              _os_log_send_and_compose_impl();
            }
            goto LABEL_51;
          }
          if (HIBYTE(v230) && objc_msgSend_isCodesignedByApple(self, v100, v101, v102, v103))
          {
            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v100, *MEMORY[0x1E4F28798], 1, 0);
            id v50 = (id)objc_claimAutoreleasedReturnValue();
            v198 = CWFGetOSLog();
            if (v198)
            {
              id v199 = CWFGetOSLog();
            }
            else
            {
              id v199 = MEMORY[0x1E4F14500];
              id v200 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v199, OS_LOG_TYPE_ERROR))
            {
              int v205 = objc_msgSend_processIdentifier(self->_XPCConnection, v201, v202, v203, v204);
              v206 = self->_processName;
              v207 = self->_bundleID;
              id v219 = self->_codesignID;
              v208 = sub_1B4F4B704(self->_serviceType);
              v213 = sub_1B4F43CD0(a3, v209, v210, v211, v212);
              int v232 = 67110402;
              *(_DWORD *)v233 = v205;
              *(_WORD *)&void v233[4] = 2114;
              *(void *)&v233[6] = v206;
              *(_WORD *)&v233[14] = 2114;
              *(void *)&v233[16] = v207;
              *(_WORD *)&v233[24] = 2114;
              *(void *)&v233[26] = v219;
              *(_WORD *)&v233[34] = 2114;
              *(void *)&v233[36] = v208;
              *(_WORD *)&v233[44] = 2114;
              *(void *)&v233[46] = v213;
              _os_log_send_and_compose_impl();
            }
            goto LABEL_75;
          }
        }
        int v124 = objc_msgSend_locationAuthorizationStatus(self, v100, v101, v102, v103, v214, v215);
        if (v124 != 3)
        {
          int v129 = v124;
          if (v124 != 4 || (objc_msgSend_isVisible(self, v125, v126, v127, v128) & 1) == 0)
          {
            objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v125, *MEMORY[0x1E4F28798], 1, 0);
            id v50 = (id)objc_claimAutoreleasedReturnValue();
            id v130 = CWFGetOSLog();
            if (v130)
            {
              id v131 = CWFGetOSLog();
            }
            else
            {
              id v131 = MEMORY[0x1E4F14500];
              id v147 = MEMORY[0x1E4F14500];
            }

            if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
            {
              int v152 = objc_msgSend_processIdentifier(self->_XPCConnection, v148, v149, v150, v151);
              uint64_t v153 = self->_processName;
              qos_class_t v216 = self->_bundleID;
              int64_t v218 = self->_codesignID;
              unsigned int v154 = sub_1B4F4B704(self->_serviceType);
              uint64_t v159 = sub_1B4F43CD0(a3, v155, v156, v157, v158);
              int v232 = 67110658;
              *(_DWORD *)v233 = v129;
              *(_WORD *)&void v233[4] = 1024;
              *(_DWORD *)&v233[6] = v152;
              *(_WORD *)&v233[10] = 2114;
              *(void *)&v233[12] = v153;
              *(_WORD *)&v233[20] = 2114;
              *(void *)&v233[22] = v216;
              *(_WORD *)&v233[30] = 2114;
              *(void *)&v233[32] = v218;
              *(_WORD *)&v233[40] = 2114;
              *(void *)&v233[42] = v154;
              *(_WORD *)&v233[50] = 2114;
              *(void *)&v233[52] = v159;
              _os_log_send_and_compose_impl();
            }
            goto LABEL_75;
          }
        }
      }
LABEL_51:
      id v50 = 0;
      goto LABEL_34;
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v17, *MEMORY[0x1E4F28798], 45, 0);
    id v50 = (id)objc_claimAutoreleasedReturnValue();
    id v78 = 0;
    uint64_t v34 = 0;
  }
LABEL_56:
  BOOL v79 = 0;
  if (v5 && v50)
  {
    id v50 = v50;
    BOOL v79 = 0;
    *unint64_t v5 = v50;
  }
  uint64_t v29 = v34;
LABEL_35:

  return v79;
}

- (BOOL)isLocal
{
  unint64_t v5 = objc_msgSend_remoteXPCProxyConnection(self, a2, v2, v3, v4);
  BOOL v6 = v5 != 0;

  return v6;
}

- (CWFXPCProxyConnection)remoteXPCProxyConnection
{
  return self->_remoteXPCProxyConnection;
}

- (BOOL)__allowAlreadyPendingRequest:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_type(v3, v4, v5, v6, v7) == 64)
  {
    id v12 = objc_msgSend_info(v3, v8, v9, v10, v11);
    char v16 = objc_msgSend_objectForKeyedSubscript_(v12, v13, @"ScanParams", v14, v15);

    BOOL v21 = objc_msgSend_acceptableCacheAge(v16, v17, v18, v19, v20) == -1;
  }
  else
  {
    BOOL v21 = 1;
  }

  return v21;
}

- (void)__updateXPCTransactionCount
{
  XPCTransaction = self->_XPCTransaction;
  if (objc_msgSend_count(self->_mutablePendingRequestMap, a2, v2, v3, v4)
    || objc_msgSend_count(self->_mutableEventIDs, v7, v8, v9, v10)
    || objc_msgSend_count(self->_mutableActivities, v7, v11, v9, v10)
    || objc_msgSend_count(self->_mutablePendingEventAcknowledgements, v7, v12, v9, v10))
  {
    if (XPCTransaction) {
      return;
    }
    objc_msgSend_stringWithFormat_(NSString, v7, @"com.apple.corewifi.xpc-transaction.%@", v9, v10, self->_processName);
    id v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_UTF8String(v20, v13, v14, v15, v16);
    uint64_t v17 = (OS_os_transaction *)os_transaction_create();
    uint64_t v18 = self->_XPCTransaction;
    self->_XPCTransaction = v17;

    uint64_t v19 = (OS_os_transaction *)v20;
  }
  else
  {
    if (!XPCTransaction) {
      return;
    }
    uint64_t v19 = self->_XPCTransaction;
    self->_XPCTransaction = 0;
  }
}

- (void)resume
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  if (self->_XPCConnection)
  {
    sub_1B4F4BA0C(self->_serviceType, a2, v2, v3, v4);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v63, (uint64_t)v69, 16);
    if (v7)
    {
      uint64_t v12 = v7;
      uint64_t v53 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v64 != v53) {
            objc_enumerationMutation(obj);
          }
          int64_t serviceType = self->_serviceType;
          uint64_t v15 = (const char *)objc_msgSend_integerValue(*(void **)(*((void *)&v63 + 1) + 8 * i), v8, v9, v10, v11);
          uint64_t v18 = sub_1B4F4E090(serviceType, v15, 0, v16, v17);
          id v20 = v18;
          if (v18)
          {
            long long v61 = 0u;
            long long v62 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v59, (uint64_t)v68, 16);
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v60;
              do
              {
                for (uint64_t j = 0; j != v22; ++j)
                {
                  if (*(void *)v60 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  uint64_t v25 = *(void *)(*((void *)&v59 + 1) + 8 * j);
                  mutexQueue = self->_mutexQueue;
                  block[0] = MEMORY[0x1E4F143A8];
                  block[1] = 3221225472;
                  block[2] = sub_1B4F47598;
                  block[3] = &unk_1E60BB9F0;
                  void block[4] = self;
                  void block[5] = v25;
                  dispatch_sync(mutexQueue, block);
                }
                uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v27, (uint64_t)&v59, (uint64_t)v68, 16);
              }
              while (v22);
            }
          }
        }
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v63, (uint64_t)v69, 16);
      }
      while (v12);
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v28 = self->_bootArgs;
    uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v54, (uint64_t)v67, 16);
    if (v30)
    {
      uint64_t v34 = v30;
      uint64_t v35 = *(void *)v55;
      while (2)
      {
        for (uint64_t k = 0; k != v34; ++k)
        {
          if (*(void *)v55 != v35) {
            objc_enumerationMutation(v28);
          }
          uint64_t v37 = *(void **)(*((void *)&v54 + 1) + 8 * k);
          if (objc_msgSend_hasPrefix_(v37, v31, @"corewifi_timeout_override=", v32, v33))
          {
            uint64_t v39 = objc_msgSend_length(@"corewifi_timeout_override=", v31, v38, v32, v33);
            id v43 = objc_msgSend_substringFromIndex_(v37, v40, v39, v41, v42);
            self->_int64_t defaultTimeoutOverride = objc_msgSend_integerValue(v43, v44, v45, v46, v47);

            goto LABEL_27;
          }
        }
        uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v54, (uint64_t)v67, 16);
        if (v34) {
          continue;
        }
        break;
      }
    }
LABEL_27:

    objc_msgSend_resume(self->_XPCConnection, v48, v49, v50, v51);
  }
}

- (id)registeredActivities
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C2C;
  uint64_t v10 = sub_1B4F51BC4;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4F4EA70;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (CWFXPCConnection)initWithServiceType:(int64_t)a3 XPCConnection:(id)a4 bootArgs:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v147.receiver = self;
  v147.super_class = (Class)CWFXPCConnection;
  id v11 = [(CWFXPCConnection *)&v147 init];
  uint64_t v16 = v11;
  if ((unint64_t)(a3 - 8) < 0xFFFFFFFFFFFFFFF9 || !v11) {
    goto LABEL_31;
  }
  v11->_int64_t serviceType = a3;
  if (v9)
  {
    p_XPCConnection = (void **)&v11->_XPCConnection;
    objc_storeStrong((id *)&v11->_XPCConnection, a4);
    objc_initWeak(&location, v16);
    v144[0] = MEMORY[0x1E4F143A8];
    v144[1] = 3221225472;
    v144[2] = sub_1B4F77AC0;
    v144[3] = &unk_1E60BBC80;
    objc_copyWeak(&v145, &location);
    objc_msgSend_setInterruptionHandler_(v16->_XPCConnection, v18, (uint64_t)v144, v19, v20);
    v142[0] = MEMORY[0x1E4F143A8];
    v142[1] = 3221225472;
    v142[2] = sub_1B4F483F4;
    v142[3] = &unk_1E60BBC80;
    objc_copyWeak(&v143, &location);
    objc_msgSend_setInvalidationHandler_(*p_XPCConnection, v21, (uint64_t)v142, v22, v23);
    objc_destroyWeak(&v143);
    objc_destroyWeak(&v145);
    objc_destroyWeak(&location);
    if (*p_XPCConnection) {
      objc_msgSend_auditToken(*p_XPCConnection, v24, v25, v26, v27);
    }
    else {
      memset(&v141[2], 0, 32);
    }
    uint64_t v39 = sub_1B4F50F2C();
    uint64_t v44 = objc_msgSend_lastPathComponent(v39, v40, v41, v42, v43);
    processName = v16->_processName;
    v16->_processName = (NSString *)v44;

    if (!v16->_processName) {
      goto LABEL_31;
    }
    if (*p_XPCConnection) {
      objc_msgSend_auditToken(*p_XPCConnection, v46, v47, v48, v49);
    }
    else {
      memset(v141, 0, 32);
    }
    uint64_t v50 = objc_msgSend___bundleIDFromAuditToken_(v16, v46, (uint64_t)v141, v48, v49);
    bundleID = v16->_bundleID;
    v16->_bundleID = (NSString *)v50;

    XPCConnection = v16->_XPCConnection;
    if (XPCConnection) {
      objc_msgSend_auditToken(XPCConnection, v52, v53, v54, v55);
    }
    else {
      memset(v140, 0, sizeof(v140));
    }
    uint64_t v57 = objc_msgSend___codesignIDFromAuditToken_(v16, v52, (uint64_t)v140, v54, v55);
    codesignID = v16->_codesignID;
    v16->_codesignID = (NSString *)v57;
  }
  else
  {
    uint64_t v28 = objc_msgSend_processInfo(MEMORY[0x1E4F28F80], v12, v13, v14, v15);
    uint64_t v33 = objc_msgSend_processName(v28, v29, v30, v31, v32);
    uint64_t v34 = v16->_processName;
    v16->_processName = (NSString *)v33;

    if (!v16->_processName)
    {
LABEL_31:

      uint64_t v16 = 0;
      goto LABEL_30;
    }
  }
  uint64_t v59 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v35, v36, v37, v38);
  UUID = v16->_UUID;
  v16->_UUID = (NSUUID *)v59;

  if (!v16->_UUID) {
    goto LABEL_31;
  }
  uint64_t v65 = objc_msgSend_copy(v10, v61, v62, v63, v64);
  bootArgs = v16->_bootArgs;
  v16->_bootArgs = (NSArray *)v65;

  objc_msgSend_stringWithFormat_(NSString, v67, @"com.apple.corewifi.XPC-connection-request.%@", v68, v69, v16->_processName);
  id v70 = objc_claimAutoreleasedReturnValue();
  uint64_t v75 = (const char *)objc_msgSend_UTF8String(v70, v71, v72, v73, v74);
  uint64_t v76 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v77 = dispatch_queue_create(v75, v76);
  requestQueue = v16->_requestQueue;
  v16->_requestQueue = (OS_dispatch_queue *)v77;

  if (!v16->_requestQueue) {
    goto LABEL_31;
  }
  objc_msgSend_stringWithFormat_(NSString, v79, @"com.apple.corewifi.XPC-connection-reply.%@", v80, v81, v16->_processName);
  id v82 = objc_claimAutoreleasedReturnValue();
  uint64_t v87 = (const char *)objc_msgSend_UTF8String(v82, v83, v84, v85, v86);
  long long v88 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v89 = dispatch_queue_create(v87, v88);
  replyQueue = v16->_replyQueue;
  v16->_replyQueue = (OS_dispatch_queue *)v89;

  if (!v16->_replyQueue) {
    goto LABEL_31;
  }
  objc_msgSend_stringWithFormat_(NSString, v91, @"com.apple.corewifi.XPC-connection-event.%@", v92, v93, v16->_processName);
  id v94 = objc_claimAutoreleasedReturnValue();
  char v99 = (const char *)objc_msgSend_UTF8String(v94, v95, v96, v97, v98);
  v100 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v101 = dispatch_queue_create(v99, v100);
  eventQueue = v16->_eventQueue;
  v16->_eventQueue = (OS_dispatch_queue *)v101;

  if (!v16->_eventQueue) {
    goto LABEL_31;
  }
  objc_msgSend_stringWithFormat_(NSString, v103, @"com.apple.corewifi.XPC-connection-ack.%@", v104, v105, v16->_processName);
  id v106 = objc_claimAutoreleasedReturnValue();
  int v111 = (const char *)objc_msgSend_UTF8String(v106, v107, v108, v109, v110);
  uint64_t v112 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v113 = dispatch_queue_create(v111, v112);
  ackQueue = v16->_ackQueue;
  v16->_ackQueue = (OS_dispatch_queue *)v113;

  if (!v16->_ackQueue) {
    goto LABEL_31;
  }
  objc_msgSend_stringWithFormat_(NSString, v115, @"com.apple.corewifi.XPC-connection-mutex.%@", v116, v117, v16->_processName);
  id v118 = objc_claimAutoreleasedReturnValue();
  v123 = (const char *)objc_msgSend_UTF8String(v118, v119, v120, v121, v122);
  int v124 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v125 = dispatch_queue_create(v123, v124);
  mutexQueue = v16->_mutexQueue;
  v16->_mutexQueue = (OS_dispatch_queue *)v125;

  if (!v16->_mutexQueue) {
    goto LABEL_31;
  }
  uint64_t v127 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  mutableEventIDs = v16->_mutableEventIDs;
  v16->_mutableEventIDs = v127;

  if (!v16->_mutableEventIDs) {
    goto LABEL_31;
  }
  int v129 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  mutablePendingEventAcknowledgements = v16->_mutablePendingEventAcknowledgements;
  v16->_mutablePendingEventAcknowledgements = v129;

  if (!v16->_mutablePendingEventAcknowledgements) {
    goto LABEL_31;
  }
  id v131 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  mutablePendingRequestMap = v16->_mutablePendingRequestMap;
  v16->_mutablePendingRequestMap = v131;

  if (!v16->_mutablePendingRequestMap) {
    goto LABEL_31;
  }
  v133 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  mutableActivities = v16->_mutableActivities;
  v16->_mutableActivities = v133;

  if (!v16->_mutableActivities) {
    goto LABEL_31;
  }
  uint64_t v135 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  coalescedEvents = v16->_coalescedEvents;
  v16->_coalescedEvents = v135;

  if (!v16->_coalescedEvents) {
    goto LABEL_31;
  }
  int v137 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  entitlementsCache = v16->_entitlementsCache;
  v16->_entitlementsCache = v137;

  if (!v16->_entitlementsCache) {
    goto LABEL_31;
  }
  v16->_int64_t defaultTimeoutOverride = -1;
LABEL_30:

  return v16;
}

- (id)__codesignIDFromAuditToken:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)uint64_t v24 = *(_OWORD *)a3->var0;
  *(_OWORD *)&v24[16] = v3;
  uint64_t v7 = sub_1B4F50F2C();
  if (!v7) {
    goto LABEL_14;
  }
  SecStaticCodeRef staticCode = 0;
  CFURLRef v8 = (const __CFURL *)objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v4, (uint64_t)v7, v5, v6);
  OSStatus v9 = SecStaticCodeCreateWithPath(v8, 0, &staticCode);
  if (staticCode)
  {
    CFDictionaryRef information = 0;
    OSStatus v13 = SecCodeCopySigningInformation(staticCode, 2u, &information);
    if (information)
    {
      uint64_t v14 = objc_msgSend_objectForKey_(information, v10, *MEMORY[0x1E4F3B9B8], v11, v12);
      CFRelease(information);
    }
    else
    {
      uint64_t v14 = (void *)SecCopyErrorMessageString(v13, 0);
      uint64_t v17 = CWFGetOSLog();
      if (v17)
      {
        uint64_t v18 = CWFGetOSLog();
      }
      else
      {
        uint64_t v18 = MEMORY[0x1E4F14500];
        id v20 = MEMORY[0x1E4F14500];
      }

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v24 = 138543874;
        *(void *)&v24[4] = v7;
        *(_WORD *)&v24[12] = 1024;
        *(_DWORD *)&v24[14] = v13;
        *(_WORD *)&v24[18] = 2114;
        *(void *)&v24[20] = v14;
        _os_log_send_and_compose_impl();
      }

      if (v14)
      {
        CFRelease(v14);
        uint64_t v14 = 0;
      }
    }
    CFRelease(staticCode);
    goto LABEL_21;
  }
  uint64_t v14 = (void *)SecCopyErrorMessageString(v9, 0);
  uint64_t v15 = CWFGetOSLog();
  if (v15)
  {
    uint64_t v16 = CWFGetOSLog();
  }
  else
  {
    uint64_t v16 = MEMORY[0x1E4F14500];
    id v19 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)uint64_t v24 = 138543874;
    *(void *)&v24[4] = v7;
    *(_WORD *)&v24[12] = 1024;
    *(_DWORD *)&v24[14] = v9;
    *(_WORD *)&v24[18] = 2114;
    *(void *)&v24[20] = v14;
    _os_log_send_and_compose_impl();
  }

  if (v14)
  {
    CFRelease(v14);
LABEL_14:
    uint64_t v14 = 0;
  }
LABEL_21:

  return v14;
}

- (id)__bundleIDFromAuditToken:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v26 = 0;
  if (!sub_1B4F514E8()) {
    goto LABEL_6;
  }
  long long v4 = *(_OWORD *)&a3->var0[4];
  long long v34 = *(_OWORD *)a3->var0;
  long long v35 = v4;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v5 = (void (*)(long long *, void, id *))off_1E9D45BF0;
  uint64_t v33 = off_1E9D45BF0;
  if (!off_1E9D45BF0)
  {
    *(void *)&long long v27 = MEMORY[0x1E4F143A8];
    *((void *)&v27 + 1) = 3221225472;
    *(void *)&long long v28 = sub_1B4F8676C;
    *((void *)&v28 + 1) = &unk_1E60BAFD8;
    uint64_t v29 = &v30;
    sub_1B4F8676C(&v27);
    uint64_t v5 = (void (*)(long long *, void, id *))v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v5)
  {
    id v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v6, v7, v8, v9);
    uint64_t v23 = objc_msgSend_stringWithUTF8String_(NSString, v20, (uint64_t)"Boolean soft_CPCopyBundleIdentifierAndTeamFromAuditToken(audit_token_t, CFStringRef *, CFStringRef *)", v21, v22);
    uint64_t v24 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v19, v25, (uint64_t)v23, @"CWFXPCConnection.m", 42, @"%s", v24);

    __break(1u);
  }
  long long v27 = v34;
  long long v28 = v35;
  v5(&v27, 0, &v26);
  id v10 = v26;
  if (!v26)
  {
LABEL_6:
    long long v11 = *(_OWORD *)&a3->var0[4];
    long long v27 = *(_OWORD *)a3->var0;
    long long v28 = v11;
    sub_1B4F50F2C();
    uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v12
      && (CFURLRef v13 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v12, kCFURLPOSIXPathStyle, 0),
          (CFURLRef v14 = v13) != 0))
    {
      CFDictionaryRef v15 = CFBundleCopyInfoDictionaryForURL(v13);
      CFDictionaryRef v16 = v15;
      if (v15)
      {
        Value = (void *)CFDictionaryGetValue(v15, (const void *)*MEMORY[0x1E4F1CFF8]);
        id v26 = Value;
        if (Value)
        {
          CFRetain(Value);
          id v10 = v26;
        }
        else
        {
          id v10 = 0;
        }
        CFRelease(v16);
      }
      else
      {
        id v10 = 0;
      }
      CFRelease(v14);
    }
    else
    {
      id v10 = 0;
    }
  }
  return v10;
}

- (void)queryCurrentKnownNetworkProfileWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryInterfaceNameWithRequestParams:(id)a3 reply:(id)a4
{
}

- (BOOL)isCodesignedByApple
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  int codesignedByApple = v2->_codesignedByApple;
  if (!v2->_codesignedByApple)
  {
    uint64_t v8 = objc_msgSend_XPCConnection(v2, v3, v4, v5, v6);
    CFURLRef v13 = v8;
    if (v8) {
      objc_msgSend_auditToken(v8, v9, v10, v11, v12);
    }
    v2->_int codesignedByApple = 1;

    int codesignedByApple = v2->_codesignedByApple;
  }
  BOOL v14 = codesignedByApple == 2;
  objc_sync_exit(v2);

  return v14;
}

- (CWFXPCConnection)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"-[CWFXPCConnection init] unavailable", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)valueForEntitlement:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1B4F51C2C;
  uint64_t v23 = sub_1B4F51BC4;
  id v24 = 0;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F77E04;
  block[3] = &unk_1E60BBCA8;
  uint64_t v18 = &v19;
  void block[4] = self;
  id v6 = v4;
  id v17 = v6;
  dispatch_sync(mutexQueue, block);
  uint64_t v7 = (void *)v20[5];
  uint64_t v12 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v8, v9, v10, v11);
  if (v7 == v12) {
    CFURLRef v13 = 0;
  }
  else {
    CFURLRef v13 = (void *)v20[5];
  }
  id v14 = v13;

  _Block_object_dispose(&v19, 8);
  return v14;
}

- (void)suspend
{
  objc_msgSend_suspend(self->_XPCConnection, a2, v2, v3, v4);
}

- (void)invalidate
{
  XPCConnection = self->_XPCConnection;
  if (XPCConnection)
  {
    objc_msgSend_invalidate(XPCConnection, a2, v2, v3, v4);
  }
  else
  {
    uint64_t v7 = objc_msgSend_remoteXPCProxyConnection(self, a2, v2, v3, v4);
    objc_msgSend_invalidate(v7, v8, v9, v10, v11);

    CFDictionaryRef v16 = objc_msgSend_invalidationHandler(self, v12, v13, v14, v15);

    if (v16)
    {
      objc_msgSend_invalidationHandler(self, v17, v18, v19, v20);
      uint64_t v21 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v21[2]();
    }
    objc_msgSend_setInvalidationHandler_(self, v17, 0, v19, v20);
  }
}

- (void)__coalesceAndCacheEvent:(id)a3
{
  id v52 = a3;
  uint64_t v4 = objc_alloc_init(CWFEventID);
  uint64_t v9 = objc_msgSend_type(v52, v5, v6, v7, v8);
  objc_msgSend_setType_(v4, v10, v9, v11, v12);
  id v17 = objc_msgSend_interfaceName(v52, v13, v14, v15, v16);
  objc_msgSend_setInterfaceName_(v4, v18, (uint64_t)v17, v19, v20);

  switch(objc_msgSend_type(v52, v21, v22, v23, v24))
  {
    case 10:
      long long v27 = objc_alloc_init(CWFEventID);
      objc_msgSend_setType_(v27, v28, 11, v29, v30);
      goto LABEL_7;
    case 11:
      long long v27 = objc_alloc_init(CWFEventID);
      objc_msgSend_setType_(v27, v35, 10, v36, v37);
      goto LABEL_7;
    case 15:
      long long v27 = objc_alloc_init(CWFEventID);
      objc_msgSend_setType_(v27, v38, 16, v39, v40);
      goto LABEL_7;
    case 16:
      long long v27 = objc_alloc_init(CWFEventID);
      objc_msgSend_setType_(v27, v41, 15, v42, v43);
LABEL_7:
      uint64_t v44 = objc_msgSend_interfaceName(v4, v31, v32, v33, v34);
      objc_msgSend_setInterfaceName_(v27, v45, (uint64_t)v44, v46, v47);

      objc_msgSend_setObject_forKeyedSubscript_(self->_coalescedEvents, v48, 0, (uint64_t)v27, v49);
      objc_msgSend_setObject_forKeyedSubscript_(self->_coalescedEvents, v50, (uint64_t)v52, (uint64_t)v4, v51);

      break;
    default:
      objc_msgSend_setObject_forKeyedSubscript_(self->_coalescedEvents, v25, (uint64_t)v52, (uint64_t)v4, v26);
      break;
  }
}

- (BOOL)__shouldCoalesceEventTypeWhileSuspended:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 0x25;
}

- (BOOL)__shouldDropEventTypeWhileSuspended:(int64_t)a3
{
  return 0;
}

- (id)processState
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1B4F51C2C;
  uint64_t v10 = sub_1B4F51BC4;
  id v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1B4F78DA8;
  v5[3] = &unk_1E60BB790;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setProcessState:(id)a3
{
  id v4 = a3;
  mutexQueue = self->_mutexQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1B4F78E9C;
  v7[3] = &unk_1E60BB9F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(mutexQueue, v7);
}

- (BOOL)isVisible
{
  uint64_t v5 = (uint64_t *)MEMORY[0x1E4F62710];
  if (MEMORY[0x1E4F62710])
  {
    id v6 = objc_msgSend_processState(self, a2, v2, v3, v4);
    if (objc_msgSend_taskState(v6, v7, v8, v9, v10) == 4)
    {
      uint64_t v15 = objc_msgSend_endowmentNamespaces(v6, v11, v12, v13, v14);
      LOBYTE(v5) = objc_msgSend_containsObject_(v15, v16, *v5, v17, v18);
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return (char)v5;
}

+ (int)locationAuthorizationStatusForWiFiNetworking
{
  uint64_t v4 = objc_msgSend_bundleWithPath_(MEMORY[0x1E4F28B50], a2, @"/System/Library/PrivateFrameworks/MobileWiFi.framework", v2, v3);
  if (v4 && sub_1B4F39964())
  {
    id v5 = sub_1B4F79408();
    int v9 = objc_msgSend_authorizationStatusForBundle_(v5, v6, (uint64_t)v4, v7, v8);
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (id)__locationBundleIDOverride
{
  objc_msgSend_bundleID(self, a2, v2, v3, v4);
  id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v11 = objc_msgSend_bundleID(self, v7, v8, v9, v10);
  if (objc_msgSend_isEqual_(v11, v12, @"com.apple.milod", v13, v14))
  {
  }
  else
  {
    uint64_t v19 = objc_msgSend_processName(self, v15, v16, v17, v18);
    int isEqual = objc_msgSend_isEqual_(v19, v20, @"milod", v21, v22);

    if (!isEqual) {
      goto LABEL_5;
    }
  }

  id v6 = @"/System/Library/LocationBundles/Milod.bundle";
LABEL_5:
  return v6;
}

- (int)locationAuthorizationStatus
{
  if (!sub_1B4F39964()) {
    return 0;
  }
  uint64_t v7 = objc_msgSend___locationBundleIDOverride(self, v3, v4, v5, v6);
  if (v7)
  {
    id v8 = sub_1B4F79408();
    int v12 = objc_msgSend_authorizationStatusForBundleIdentifier_(v8, v9, (uint64_t)v7, v10, v11);
  }
  else
  {
    uint64_t v13 = CWFGetOSLog();
    if (v13)
    {
      uint64_t v14 = CWFGetOSLog();
    }
    else
    {
      uint64_t v14 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_processIdentifier(self->_XPCConnection, v16, v17, v18, v19);
      uint64_t v21 = sub_1B4F4B704(self->_serviceType);
      _os_log_send_and_compose_impl();
    }
    int v12 = 0;
  }

  return v12;
}

- (id)__privacyFilteredScanResult:(id)a3 allowSSID:(BOOL)a4 allowBSSID:(BOOL)a5 allowCountryCode:(BOOL)a6
{
  id v9 = a3;
  uint64_t v14 = objc_msgSend_properties(v9, v10, v11, v12, v13);
  if ((objc_msgSend_containsObject_(v14, v15, (uint64_t)&unk_1F0DC7620, v16, v17) & 1) != 0
    || (objc_msgSend_containsObject_(v14, v18, (uint64_t)&unk_1F0DC7638, v19, v20) & 1) != 0
    || (objc_msgSend_containsObject_(v14, v18, (uint64_t)&unk_1F0DC7650, v19, v20) & 1) != 0
    || objc_msgSend_containsObject_(v14, v18, (uint64_t)&unk_1F0DC7668, v19, v20))
  {
    if (!objc_msgSend_containsObject_(v14, v18, (uint64_t)&unk_1F0DC7668, v19, v20))
    {
      uint64_t v30 = objc_msgSend_mutableCopy(v14, v21, v22, v23, v24);
      if (objc_msgSend_containsObject_(v14, v43, (uint64_t)&unk_1F0DC7620, v44, v45) && !a4) {
        objc_msgSend_removeObject_(v30, v46, (uint64_t)&unk_1F0DC7620, v47, v48);
      }
      if (objc_msgSend_containsObject_(v14, v46, (uint64_t)&unk_1F0DC7638, v47, v48) && !a5) {
        objc_msgSend_removeObject_(v30, v49, (uint64_t)&unk_1F0DC7638, v50, v51);
      }
      if (objc_msgSend_containsObject_(v14, v49, (uint64_t)&unk_1F0DC7650, v50, v51) && !a6) {
        objc_msgSend_removeObject_(v30, v52, (uint64_t)&unk_1F0DC7650, v53, v54);
      }
      objc_msgSend_filteredScanResultWithProperties_(v9, v52, (uint64_t)v30, v53, v54);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    uint64_t v25 = objc_msgSend_scanRecord(v9, v21, v22, v23, v24);
    uint64_t v30 = objc_msgSend_mutableCopy(v25, v26, v27, v28, v29);

    if (a4)
    {
      if (a5) {
        goto LABEL_8;
      }
    }
    else
    {
      objc_msgSend_setObject_forKeyedSubscript_(v30, v31, 0, @"SSID", v32);
      objc_msgSend_setObject_forKeyedSubscript_(v30, v56, 0, @"SSID_STR", v57);
      if (a5)
      {
LABEL_8:
        if (a6)
        {
LABEL_10:
          long long v35 = [CWFScanResult alloc];
          uint64_t v40 = objc_msgSend_matchingKnownNetworkProfile(v9, v36, v37, v38, v39);
          id v42 = (id)objc_msgSend_initWithScanRecord_knownNetworkProfile_includeProperties_(v35, v41, (uint64_t)v30, (uint64_t)v40, 0);

LABEL_21:
          goto LABEL_22;
        }
LABEL_9:
        objc_msgSend_setObject_forKeyedSubscript_(v30, v31, 0, @"80211D_IE", v32);
        objc_msgSend_setObject_forKeyedSubscript_(v30, v33, 0, @"IE", v34);
        goto LABEL_10;
      }
    }
    objc_msgSend_setObject_forKeyedSubscript_(v30, v31, 0, @"BSSID", v32);
    if (a6) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v42 = v9;
LABEL_22:

  return v42;
}

- (BOOL)__hasPendingRequestWithType:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = objc_msgSend_allValues(self->_mutablePendingRequestMap, a2, a3, v3, v4, 0);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v8)
  {
    uint64_t v13 = v8;
    uint64_t v14 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v6);
        }
        uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend_type(v16, v9, v10, v11, v12) == a3
          && !objc_msgSend_isSubrequest(v16, v9, v10, v11, v12))
        {
          BOOL v17 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v19, (uint64_t)v23, 16);
      if (v13) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 0;
LABEL_12:

  return v17;
}

- (CWFXPCProxyConnection)localXPCProxyConnection
{
  uint64_t v3 = [CWFXPCProxyConnection alloc];
  uint64_t v7 = objc_msgSend_initWithForwardingTarget_(v3, v4, (uint64_t)self, v5, v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1B4F79FE4;
  v12[3] = &unk_1E60BB768;
  v12[4] = self;
  objc_msgSend_setInvalidationHandler_(v7, v8, (uint64_t)v12, v9, v10);
  return (CWFXPCProxyConnection *)v7;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  remoteXPCProxyConnection = self->_remoteXPCProxyConnection;
  if (!remoteXPCProxyConnection) {
    remoteXPCProxyConnection = self->_XPCConnection;
  }
  uint64_t v7 = objc_msgSend_remoteObjectProxyWithErrorHandler_(remoteXPCProxyConnection, a2, (uint64_t)a3, v3, v4);
  return v7;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  remoteXPCProxyConnection = self->_remoteXPCProxyConnection;
  if (!remoteXPCProxyConnection) {
    remoteXPCProxyConnection = self->_XPCConnection;
  }
  uint64_t v7 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(remoteXPCProxyConnection, a2, (uint64_t)a3, v3, v4);
  return v7;
}

- (id)description
{
  uint64_t v5 = NSString;
  processName = self->_processName;
  uint64_t v7 = objc_msgSend_processIdentifier(self->_XPCConnection, a2, v2, v3, v4);
  return (id)objc_msgSend_stringWithFormat_(v5, v8, @"%@ (pid=%d)", v9, v10, processName, v7);
}

- (void)startMonitoringEvent:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = CWFGetOSLog();
  if (v11)
  {
    uint64_t v12 = CWFGetOSLog();
  }
  else
  {
    uint64_t v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v18 = objc_msgSend_type(v8, v14, v15, v16, v17);
    uint64_t v23 = sub_1B4F53484(v18, v19, v20, v21, v22);
    int v28 = objc_msgSend_processIdentifier(self->_XPCConnection, v24, v25, v26, v27);
    processName = self->_processName;
    bundleID = self->_bundleID;
    id v42 = v8;
    id v31 = v10;
    codesignID = self->_codesignID;
    uint64_t v33 = sub_1B4F4B704(self->_serviceType);
    objc_msgSend_interfaceName(v9, v34, v35, v36, v37);
    int v47 = 138544898;
    uint64_t v48 = v23;
    __int16 v49 = 1024;
    int v50 = v28;
    __int16 v51 = 2114;
    id v52 = processName;
    __int16 v53 = 2114;
    uint64_t v54 = bundleID;
    __int16 v55 = 2114;
    long long v56 = codesignID;
    id v10 = v31;
    id v8 = v42;
    __int16 v57 = 2114;
    int v58 = v33;
    __int16 v59 = 2114;
    id v60 = (id)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();
  }
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F7A4A0;
  block[3] = &unk_1E60BBF78;
  void block[4] = self;
  id v44 = v8;
  id v45 = v9;
  id v46 = v10;
  id v39 = v10;
  id v40 = v9;
  id v41 = v8;
  dispatch_async(mutexQueue, block);
}

- (void)stopMonitoringEvent:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = CWFGetOSLog();
  if (v11)
  {
    uint64_t v12 = CWFGetOSLog();
  }
  else
  {
    uint64_t v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v18 = objc_msgSend_type(v8, v14, v15, v16, v17);
    uint64_t v23 = sub_1B4F53484(v18, v19, v20, v21, v22);
    int v28 = objc_msgSend_processIdentifier(self->_XPCConnection, v24, v25, v26, v27);
    processName = self->_processName;
    bundleID = self->_bundleID;
    id v42 = v8;
    id v31 = v10;
    codesignID = self->_codesignID;
    uint64_t v33 = sub_1B4F4B704(self->_serviceType);
    objc_msgSend_interfaceName(v9, v34, v35, v36, v37);
    int v47 = 138544898;
    uint64_t v48 = v23;
    __int16 v49 = 1024;
    int v50 = v28;
    __int16 v51 = 2114;
    id v52 = processName;
    __int16 v53 = 2114;
    uint64_t v54 = bundleID;
    __int16 v55 = 2114;
    long long v56 = codesignID;
    id v10 = v31;
    id v8 = v42;
    __int16 v57 = 2114;
    int v58 = v33;
    __int16 v59 = 2114;
    id v60 = (id)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();
  }
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F7ABC0;
  block[3] = &unk_1E60BBF78;
  void block[4] = self;
  id v44 = v8;
  id v45 = v9;
  id v46 = v10;
  id v39 = v10;
  id v40 = v9;
  id v41 = v8;
  dispatch_async(mutexQueue, block);
}

- (void)stopMonitoringAllEventsWithRequestParams:(id)a3 reply:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CWFGetOSLog();
  if (v8)
  {
    id v9 = CWFGetOSLog();
  }
  else
  {
    id v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = objc_msgSend_processIdentifier(self->_XPCConnection, v11, v12, v13, v14);
    processName = self->_processName;
    bundleID = self->_bundleID;
    codesignID = self->_codesignID;
    long long v19 = sub_1B4F4B704(self->_serviceType);
    objc_msgSend_interfaceName(v6, v20, v21, v22, v23);
    int v30 = 67110402;
    int v31 = v15;
    __int16 v32 = 2114;
    uint64_t v33 = processName;
    __int16 v34 = 2114;
    uint64_t v35 = bundleID;
    __int16 v36 = 2114;
    uint64_t v37 = codesignID;
    __int16 v38 = 2114;
    id v39 = v19;
    __int16 v40 = 2114;
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    _os_log_send_and_compose_impl();
  }
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F7B27C;
  block[3] = &unk_1E60BBD20;
  void block[4] = self;
  id v28 = v6;
  id v29 = v7;
  id v25 = v7;
  id v26 = v6;
  dispatch_async(mutexQueue, block);
}

- (void)queryEventIDsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)querySystemEventIDsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)beginActivity:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  mutexQueue = self->_mutexQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1B4F7B748;
  v15[3] = &unk_1E60BBF78;
  id v16 = v8;
  uint64_t v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(mutexQueue, v15);
}

- (void)endActivityWithUUID:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  mutexQueue = self->_mutexQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1B4F7C2E0;
  v15[3] = &unk_1E60BBF78;
  id v16 = v8;
  uint64_t v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(mutexQueue, v15);
}

- (void)endAllActivitiesWithRequestParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F7CA8C;
  block[3] = &unk_1E60BBD20;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(mutexQueue, block);
}

- (void)queryActivitiesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)querySystemActivitiesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)cancelRequestsWithUUID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F7CF0C;
  block[3] = &unk_1E60BBD20;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(mutexQueue, block);
}

- (void)queryMACAddressWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryHardwareMACAddressWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryBSSIDWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryBSSIDForVendorWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryChannelWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryCountryCodeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)setCompanionCountryCode:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    uint64_t v22 = @"CountryCode";
    v23[0] = a3;
    uint64_t v11 = (void *)MEMORY[0x1E4F1C9E8];
    id v12 = a3;
    id v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4F7D4EC;
    v20[3] = &unk_1E60BBD70;
    int v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 23, (uint64_t)v14, (uint64_t)v8, v20);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F7D504;
    block[3] = &unk_1E60BBCF8;
    int v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryCurrentScanResultWithRequestParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B4F7D690;
  v10[3] = &unk_1E60BBFF0;
  objc_copyWeak(&v12, &location);
  id v8 = v7;
  id v11 = v8;
  objc_msgSend___addXPCGetRequestWithType_requestParams_reply_(self, v9, 57, (uint64_t)v6, (uint64_t)v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)queryDTIMIntervalWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGuardIntervalWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryInterfaceCapabilitiesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryInterfaceNamesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryMCSIndexWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryNumberOfSpatialStreamsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryNoiseWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryOpModeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryPHYModeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryParentInterfaceNameWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryPowerWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryRangingCapabilitiesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryRSSIWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)querySSIDWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)querySSIDForVendorWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)querySecurityWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAuthTypeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryWEPSubtypeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryWAPISubtypeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)querySupportedChannelsWithCountryCode:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4F1CA60];
  id v10 = a4;
  id v11 = a3;
  id v16 = objc_msgSend_dictionary(v9, v12, v13, v14, v15);
  objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)v11, @"CountryCode", v18);

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1B4F7D9DC;
  v21[3] = &unk_1E60BBD70;
  id v22 = v8;
  id v19 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v20, 15, (uint64_t)v16, (uint64_t)v10, v21);
}

- (void)queryHardwareSupportedChannelsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)querySupportedPHYModesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryTxPowerWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryTxRateWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryPowerStateWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryChainAckWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryTxChainPowerWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryDesenseWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryDesenseLevelWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryBluetoothCoexConfigWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryBluetoothCoexProfiles2GHzWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryBluetoothCoexProfiles5GHzWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryBluetoothCoexModeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryLeakyAPStatsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryLQMSummaryWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryVirtualInterfaceNamesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryVirtualInterfaceRoleWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLElectionIDWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLElectionParametersWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLElectionRSSIThresholdsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLMasterChannelWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLOpModeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLPeerDatabaseWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLPreferredChannelsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLSecondaryMasterChannelWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLSocialTimeSlotsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLStatisticsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLStrategyWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLSyncChannelSequenceWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLSyncEnabledWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLSyncParametersWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLSyncStateWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLSidecarDiagnosticsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLExtensionStateMachineParamsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLElectionMetricWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLPresenceModeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLGuardTimeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLAvailabilityWindowAPAlignmentWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLContinuousElectionAlgorithmEnabledWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLAFTxModeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLPeerTrafficRegistrationWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLEncryptionTypeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAWDLBTLEStateParamsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (id)__filterScanResultsForPrivacy:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend___allowXPCRequestWithType_error_(self, v5, 7, 0, v6);
  uint64_t v10 = objc_msgSend___allowXPCRequestWithType_error_(self, v8, 9, 0, v9);
  uint64_t v13 = objc_msgSend___allowXPCRequestWithType_error_(self, v11, 22, 0, v12);
  __int16 v38 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v14, v15, v16, v17);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v18 = v4;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v39, (uint64_t)v43, 16);
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v40 != v22) {
          objc_enumerationMutation(v18);
        }
        uint64_t v24 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        id v25 = (void *)MEMORY[0x1BA995D10]();
        int v30 = objc_msgSend___privacyFilteredScanResult_allowSSID_allowBSSID_allowCountryCode_(self, v26, v24, v7, v10, v13);
        if (v30) {
          objc_msgSend_addObject_(v38, v27, (uint64_t)v30, v28, v29);
        }
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v31, (uint64_t)&v39, (uint64_t)v43, 16);
    }
    while (v21);
  }

  __int16 v36 = objc_msgSend_copy(v38, v32, v33, v34, v35);
  return v36;
}

- (id)__matchedScanResultsWithKnownNetworkProfiles:(id)a3 scanResults:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v11 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v7, v8, v9, v10);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v12 = v6;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v35, (uint64_t)v39, 16);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v36;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(v12);
        }
        id v18 = *(void **)(*((void *)&v35 + 1) + 8 * v17);
        id v19 = (void *)MEMORY[0x1BA995D10](v14);
        uint64_t v23 = sub_1B4F542B0(v18, v5);
        if (v23)
        {
          uint64_t v24 = objc_msgSend_scanResultWithMatchingKnownNetworkProfile_(v18, v20, (uint64_t)v23, v21, v22);
          objc_msgSend_addObject_(v11, v25, (uint64_t)v24, v26, v27);
        }
        else
        {
          objc_msgSend_addObject_(v11, v20, (uint64_t)v18, v21, v22, (void)v35);
        }

        ++v17;
      }
      while (v15 != v17);
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v28, (uint64_t)&v35, (uint64_t)v39, 16);
      uint64_t v15 = v14;
    }
    while (v14);
  }

  uint64_t v33 = objc_msgSend_copy(v11, v29, v30, v31, v32);
  return v33;
}

- (void)__matchKnownNetworksWithScanResults:(id)a3 parentXPCRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v12 = objc_msgSend_requestParameters(v7, v8, v9, v10, v11);
  uint64_t v17 = objc_msgSend_UUID(v7, v13, v14, v15, v16);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1B4F7E1F8;
  v22[3] = &unk_1E60BBF28;
  objc_copyWeak(&v25, &location);
  id v18 = v6;
  id v23 = v18;
  id v19 = v7;
  id v24 = v19;
  id v21 = (id)objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_(self, v20, 54, 0, (uint64_t)v12, v17, 0, v22);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)__performFollowupANQPForPasspointScanResults:(id)a3 combinedScanResults:(id)a4 parameters:(id)a5 parentXPCRequest:(id)a6
{
  v66[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = objc_alloc_init(CWFANQPParameters);
  id v19 = objc_msgSend_ANQPElementIDListForPasspointScanResults(v12, v15, v16, v17, v18);
  objc_msgSend_setANQPElementIDList_(v14, v20, (uint64_t)v19, v21, v22);

  uint64_t v27 = objc_msgSend_acceptableANQPCacheAgeForPasspointScanResults(v12, v23, v24, v25, v26);
  objc_msgSend_setAcceptableCacheAge_(v14, v28, v27, v29, v30);
  uint64_t v35 = objc_msgSend_maximumANQPAgeForPasspointScanResults(v12, v31, v32, v33, v34);
  objc_msgSend_setMaximumAge_(v14, v36, v35, v37, v38);
  objc_msgSend_setScanResults_(v14, v39, (uint64_t)v10, v40, v41);
  objc_initWeak(&location, self);
  uint64_t v65 = @"ANQPParams";
  v66[0] = v14;
  uint64_t v43 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v42, (uint64_t)v66, (uint64_t)&v65, 1);
  uint64_t v48 = objc_msgSend_requestParameters(v13, v44, v45, v46, v47);
  __int16 v53 = objc_msgSend_UUID(v13, v49, v50, v51, v52);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = sub_1B4F7E5C0;
  v59[3] = &unk_1E60BC018;
  objc_copyWeak(&v63, &location);
  id v54 = v11;
  id v60 = v54;
  id v55 = v12;
  id v61 = v55;
  id v56 = v13;
  id v62 = v56;
  id v58 = (id)objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_(self, v57, 65, (uint64_t)v43, (uint64_t)v48, v53, 0, v59);

  objc_destroyWeak(&v63);
  objc_destroyWeak(&location);
}

- (id)__passpointScanResults:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v5)
  {
    uint64_t v10 = v5;
    id v11 = 0;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v3);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend_isPasspoint(v14, v6, v7, v8, v9))
        {
          if (!v11)
          {
            id v11 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v6, v7, v8, v9);
          }
          objc_msgSend_addObject_(v11, v6, (uint64_t)v14, v8, v9);
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v17, (uint64_t)v21, 16);
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v15 = objc_msgSend_copy(v11, v6, v7, v8, v9);

  return v15;
}

- (void)__performScanWithParameters:(id)a3 parentXPCRequest:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v29 = @"ScanParams";
  v30[0] = v6;
  uint64_t v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v8, (uint64_t)v30, (uint64_t)&v29, 1);
  uint64_t v14 = objc_msgSend_requestParameters(v7, v10, v11, v12, v13);
  long long v19 = objc_msgSend_UUID(v7, v15, v16, v17, v18);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1B4F7EA78;
  v24[3] = &unk_1E60BBF28;
  objc_copyWeak(&v27, &location);
  id v20 = v6;
  id v25 = v20;
  id v21 = v7;
  id v26 = v21;
  id v23 = (id)objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_(self, v22, 64, (uint64_t)v9, (uint64_t)v14, v19, 0, v24);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)performScanWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v8)
  {
    objc_initWeak(&location, self);
    uint64_t v16 = objc_msgSend_ANQPElementIDListForPasspointScanResults(v8, v12, v13, v14, v15);
    if (v16)
    {
    }
    else if ((objc_msgSend_includeMatchingKnownNetworkProfiles(v8, v17, v18, v19, v20) & 1) == 0)
    {
      uint64_t v40 = @"ScanParams";
      id v41 = v8;
      id v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v21, (uint64_t)&v41, (uint64_t)&v40, 1);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = sub_1B4F7F084;
      v33[3] = &unk_1E60BC040;
      uint64_t v24 = &v35;
      objc_copyWeak(&v35, &location);
      id v34 = v11;
      objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v30, 64, (uint64_t)v26, (uint64_t)v9, v33);
      uint64_t v29 = &v34;
      goto LABEL_7;
    }
    long long v42 = @"ScanParams";
    v43[0] = v8;
    id v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v21, (uint64_t)v43, (uint64_t)&v42, 1);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = sub_1B4F7EF98;
    v36[3] = &unk_1E60BC040;
    uint64_t v24 = &v38;
    objc_copyWeak(&v38, &location);
    id v37 = v11;
    id v26 = objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_(self, v25, 64, (uint64_t)v23, (uint64_t)v9, 0, 1, v36);

    objc_msgSend___performScanWithParameters_parentXPCRequest_(self, v27, (uint64_t)v8, (uint64_t)v26, v28);
    uint64_t v29 = &v37;
LABEL_7:

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
    goto LABEL_8;
  }
  replyQueue = self->_replyQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B4F7F170;
  block[3] = &unk_1E60BBCF8;
  id v32 = v10;
  dispatch_async(replyQueue, block);

LABEL_8:
}

- (void)__performANQPWithParameters:(id)a3 parentXPCRequest:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v29 = @"ANQPParams";
  v30[0] = v6;
  id v9 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v8, (uint64_t)v30, (uint64_t)&v29, 1);
  uint64_t v14 = objc_msgSend_requestParameters(v7, v10, v11, v12, v13);
  uint64_t v19 = objc_msgSend_UUID(v7, v15, v16, v17, v18);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1B4F7F3D0;
  v24[3] = &unk_1E60BBF28;
  objc_copyWeak(&v27, &location);
  id v20 = v6;
  id v25 = v20;
  id v21 = v7;
  id v26 = v21;
  id v23 = (id)objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_(self, v22, 65, (uint64_t)v9, (uint64_t)v14, v19, 0, v24);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)performANQPWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v8)
  {
    objc_initWeak(&location, self);
    if (objc_msgSend_includeMatchingKnownNetworkProfiles(v8, v12, v13, v14, v15))
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = sub_1B4F7F724;
      v29[3] = &unk_1E60BC040;
      uint64_t v16 = &v31;
      objc_copyWeak(&v31, &location);
      id v30 = v11;
      uint64_t v18 = objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_(self, v17, 65, 0, (uint64_t)v9, 0, 1, v29);
      objc_msgSend___performANQPWithParameters_parentXPCRequest_(self, v19, (uint64_t)v8, (uint64_t)v18, v20);
      id v21 = &v30;
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = sub_1B4F7F810;
      v26[3] = &unk_1E60BC040;
      uint64_t v16 = &v28;
      objc_copyWeak(&v28, &location);
      id v27 = v11;
      objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v23, 65, 0, (uint64_t)v9, v26);
      id v21 = &v27;
    }

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
  else
  {
    replyQueue = self->_replyQueue;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1B4F7F8FC;
    v24[3] = &unk_1E60BBCF8;
    id v25 = v10;
    dispatch_async(replyQueue, v24);
  }
}

- (void)setChannel:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    uint64_t v22 = @"Channel";
    v23[0] = a3;
    uint64_t v11 = (void *)MEMORY[0x1E4F1C9E8];
    id v12 = a3;
    uint64_t v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4F7FB28;
    v20[3] = &unk_1E60BBD70;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 17, (uint64_t)v14, (uint64_t)v8, v20);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F7FB40;
    block[3] = &unk_1E60BBCF8;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)setPower:(BOOL)a3 requestParams:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v21 = @"Power";
  id v9 = NSNumber;
  id v10 = a4;
  uint64_t v14 = objc_msgSend_numberWithBool_(v9, v11, v6, v12, v13);
  v22[0] = v14;
  uint64_t v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v22, (uint64_t)&v21, 1);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1B4F7FD18;
  v19[3] = &unk_1E60BBD70;
  id v20 = v8;
  id v17 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v18, 6, (uint64_t)v16, (uint64_t)v10, v19);
}

- (void)setRangeable:(BOOL)a3 peerList:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  BOOL v8 = a3;
  v29[2] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = v11;
  if (a4)
  {
    v28[0] = @"Rangeable";
    uint64_t v13 = NSNumber;
    id v14 = a4;
    uint64_t v18 = objc_msgSend_numberWithBool_(v13, v15, v8, v16, v17);
    v28[1] = @"RangingPeerList";
    v29[0] = v18;
    v29[1] = v14;
    id v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v29, (uint64_t)v28, 2);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B4F7FF0C;
    v26[3] = &unk_1E60BBD70;
    id v21 = &v27;
    id v27 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v22, 68, (uint64_t)v20, (uint64_t)v10, v26);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F7FF24;
    block[3] = &unk_1E60BBCF8;
    id v21 = &v25;
    id v25 = v11;
    dispatch_async(replyQueue, block);
  }
}

- (void)performRangingWithPeerList:(id)a3 timeout:(unint64_t)a4 requestParams:(id)a5 reply:(id)a6
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = v11;
  if (a3)
  {
    v29[0] = a3;
    v28[0] = @"RangingPeerList";
    v28[1] = @"RangingTimeout";
    uint64_t v13 = NSNumber;
    id v14 = a3;
    uint64_t v18 = objc_msgSend_numberWithUnsignedInteger_(v13, v15, a4, v16, v17);
    v29[1] = v18;
    id v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v29, (uint64_t)v28, 2);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B4F80188;
    v26[3] = &unk_1E60BBD70;
    id v21 = &v27;
    id v27 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v22, 69, (uint64_t)v20, (uint64_t)v10, v26);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F8022C;
    block[3] = &unk_1E60BBCF8;
    id v21 = &v25;
    id v25 = v11;
    dispatch_async(replyQueue, block);
  }
}

- (void)setRangingIdentifier:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  if (v8)
  {
    uint64_t v17 = @"RangingIdentifier";
    v18[0] = v8;
    uint64_t v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)v18, (uint64_t)&v17, 1);
  }
  else
  {
    uint64_t v12 = 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1B4F80400;
  v15[3] = &unk_1E60BBD70;
  id v13 = v11;
  id v16 = v13;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v14, 174, (uint64_t)v12, (uint64_t)v9, v15);
  if (v8) {
}
  }

- (void)startAWDLPeerAssistedDiscoveryWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    uint64_t v22 = @"AWDLPeerAssistedDiscoveryParams";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x1E4F1C9E8];
    id v12 = a3;
    id v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4F805B4;
    v20[3] = &unk_1E60BBD70;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 66, (uint64_t)v14, (uint64_t)v8, v20);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F805CC;
    block[3] = &unk_1E60BBCF8;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)stopAWDLPeerAssistedDiscoveryWithRequestParams:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B4F80704;
  v9[3] = &unk_1E60BBD70;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v8, 67, 0, (uint64_t)a3, v9);
}

- (id)__shouldPerformPreAssociation6GHzFollowupScan:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v8 = v3;
  if (!v3
    || (objc_msgSend_isFILSDiscoveryFrame(v3, v4, v5, v6, v7) & 1) != 0
    || (objc_msgSend_channel(v8, v9, v10, v11, v12),
        id v13 = objc_claimAutoreleasedReturnValue(),
        char v18 = objc_msgSend_is6GHz(v13, v14, v15, v16, v17),
        v13,
        (v18 & 1) != 0))
  {
    id v23 = 0;
    goto LABEL_28;
  }
  objc_msgSend_RNRBSSList(v8, v19, v20, v21, v22);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v23, v24, v25, v26, v27))
  {
LABEL_28:
    id v35 = 0;
    goto LABEL_24;
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v23 = v23;
  uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v28, (uint64_t)&v52, (uint64_t)v56, 16);
  if (!v29)
  {
    id v35 = 0;
    goto LABEL_23;
  }
  uint64_t v34 = v29;
  id v35 = 0;
  uint64_t v36 = *(void *)v53;
  while (2)
  {
    for (uint64_t i = 0; i != v34; ++i)
    {
      if (*(void *)v53 != v36) {
        objc_enumerationMutation(v23);
      }
      id v38 = *(void **)(*((void *)&v52 + 1) + 8 * i);
      long long v39 = objc_msgSend_channel(v38, v30, v31, v32, v33, (void)v52);
      int v44 = objc_msgSend_is6GHz(v39, v40, v41, v42, v43);

      if (v44)
      {
        uint64_t v45 = objc_msgSend_shortSSID(v38, v30, v31, v32, v33);
        if (v45)
        {
          if (v45 != objc_msgSend_shortSSID(v8, v46, v47, v48, v49)) {
            continue;
          }
        }
        else if ((objc_msgSend_isSameSSID(v38, v46, v47, v48, v49) & 1) == 0)
        {
          continue;
        }
        if (objc_msgSend_isColocatedAP(v38, v30, v31, v32, v33))
        {
          id v50 = v38;

          id v35 = v50;
          goto LABEL_23;
        }
        if (!v35) {
          id v35 = v38;
        }
      }
    }
    uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v30, (uint64_t)&v52, (uint64_t)v56, 16);
    if (v34) {
      continue;
    }
    break;
  }
LABEL_23:

LABEL_24:
  return v35;
}

- (void)__perform6GHzFollowupScanAndAssociateWithParameters:(id)a3 BSS:(id)a4 parentXPCRequest:(id)a5
{
  v86[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_alloc_init(CWFScanParameters);
  uint64_t v16 = objc_msgSend_scanResult(v8, v12, v13, v14, v15);
  uint64_t v21 = objc_msgSend_shortSSID(v16, v17, v18, v19, v20);
  objc_msgSend_setShortSSID_(v11, v22, v21, v23, v24);

  uint64_t v29 = objc_msgSend_BSSID(v9, v25, v26, v27, v28);
  objc_msgSend_setBSSID_(v11, v30, (uint64_t)v29, v31, v32);

  id v37 = objc_msgSend_channel(v9, v33, v34, v35, v36);
  v86[0] = v37;
  uint64_t v40 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v38, (uint64_t)v86, 1, v39);
  objc_msgSend_setChannels_(v11, v41, (uint64_t)v40, v42, v43);

  objc_msgSend_setBSSType_(v11, v44, 3, v45, v46);
  objc_msgSend_setIncludeHiddenNetworks_(v11, v47, 0, v48, v49);
  objc_msgSend_setAcceptableCacheAge_(v11, v50, 0, v51, v52);
  objc_msgSend_setScanType_(v11, v53, 1, v54, v55);
  if (objc_msgSend_isUPRActive(v9, v56, v57, v58, v59)) {
    objc_msgSend_setScanFlags_(v11, v60, 32, v61, v62);
  }
  else {
    objc_msgSend_setScanFlags_(v11, v60, 1056, v61, v62);
  }
  objc_initWeak(&location, self);
  uint64_t v84 = @"ScanParams";
  uint64_t v85 = v11;
  uint64_t v64 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v63, (uint64_t)&v85, (uint64_t)&v84, 1);
  uint64_t v69 = objc_msgSend_requestParameters(v10, v65, v66, v67, v68);
  uint64_t v74 = objc_msgSend_UUID(v10, v70, v71, v72, v73);
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = sub_1B4F80BE4;
  v79[3] = &unk_1E60BBF28;
  objc_copyWeak(&v82, &location);
  id v75 = v8;
  id v80 = v75;
  id v76 = v10;
  id v81 = v76;
  id v78 = (id)objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_(self, v77, 64, (uint64_t)v64, (uint64_t)v69, v74, 0, v79);

  objc_destroyWeak(&v82);
  objc_destroyWeak(&location);
}

- (void)associateWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = v10;
  if (v8)
  {
    uint64_t v16 = objc_msgSend_scanResult(v8, v11, v12, v13, v14);
    uint64_t v20 = objc_msgSend___shouldPerformPreAssociation6GHzFollowupScan_(self, v17, (uint64_t)v16, v18, v19);

    if (v20)
    {
      id v37 = @"AssocParams";
      v38[0] = v8;
      uint64_t v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v21, (uint64_t)v38, (uint64_t)&v37, 1);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = sub_1B4F81060;
      v33[3] = &unk_1E60BBD70;
      uint64_t v23 = &v34;
      id v34 = v15;
      uint64_t v25 = objc_msgSend___addXPCRequestWithType_info_requestParams_parentRequestUUID_isParentRequest_reply_(self, v24, 62, (uint64_t)v22, (uint64_t)v9, 0, 1, v33);

      objc_msgSend___perform6GHzFollowupScanAndAssociateWithParameters_BSS_parentXPCRequest_(self, v26, (uint64_t)v8, (uint64_t)v20, (uint64_t)v25);
    }
    else
    {
      uint64_t v35 = @"AssocParams";
      id v36 = v8;
      uint64_t v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v21, (uint64_t)&v36, (uint64_t)&v35, 1);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = sub_1B4F81078;
      v31[3] = &unk_1E60BBD70;
      uint64_t v23 = &v32;
      id v32 = v15;
      objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v28, 62, (uint64_t)v25, (uint64_t)v9, v31);
    }
  }
  else
  {
    replyQueue = self->_replyQueue;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1B4F81090;
    void v29[3] = &unk_1E60BBCF8;
    id v30 = v10;
    dispatch_async(replyQueue, v29);
    uint64_t v20 = v30;
  }
}

- (void)disassociateWithReason:(int64_t)a3 requestParams:(id)a4 reply:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v21 = @"DisassocReason";
  id v9 = NSNumber;
  id v10 = a4;
  uint64_t v14 = objc_msgSend_numberWithInteger_(v9, v11, a3, v12, v13);
  v22[0] = v14;
  uint64_t v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v22, (uint64_t)&v21, 1);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1B4F81268;
  v19[3] = &unk_1E60BBD70;
  id v20 = v8;
  id v17 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v18, 63, (uint64_t)v16, (uint64_t)v10, v19);
}

- (void)updateSoftAPBand:(unsigned int)a3 requestParams:(id)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v21 = @"SoftAPBand";
  id v9 = NSNumber;
  id v10 = a4;
  uint64_t v14 = objc_msgSend_numberWithUnsignedInt_(v9, v11, v6, v12, v13);
  v22[0] = v14;
  uint64_t v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v22, (uint64_t)&v21, 1);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1B4F813CC;
  v19[3] = &unk_1E60BBD70;
  id v20 = v8;
  id v17 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v18, 219, (uint64_t)v16, (uint64_t)v10, v19);
}

- (void)queryKnownNetworkProfileMatchingNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    uint64_t v22 = @"NetworkProfile";
    v23[0] = a3;
    uint64_t v11 = (void *)MEMORY[0x1E4F1C9E8];
    id v12 = a3;
    uint64_t v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4F81580;
    v20[3] = &unk_1E60BBD70;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 55, (uint64_t)v14, (uint64_t)v8, v20);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F81624;
    block[3] = &unk_1E60BBCF8;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryKnownNetworkProfileMatchingScanResult:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    uint64_t v22 = @"ScanResult";
    v23[0] = a3;
    uint64_t v11 = (void *)MEMORY[0x1E4F1C9E8];
    id v12 = a3;
    uint64_t v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4F81850;
    v20[3] = &unk_1E60BBD70;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 56, (uint64_t)v14, (uint64_t)v8, v20);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F818F4;
    block[3] = &unk_1E60BBCF8;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryKnownNetworkProfilesWithProperties:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4F1CA60];
  id v10 = a4;
  id v11 = a3;
  uint64_t v16 = objc_msgSend_dictionary(v9, v12, v13, v14, v15);
  objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)v11, @"NetworkProfileProperties", v18);

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1B4F81A8C;
  v21[3] = &unk_1E60BBD70;
  id v22 = v8;
  id v19 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v20, 54, (uint64_t)v16, (uint64_t)v10, v21);
}

- (void)addKnownNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    id v22 = @"NetworkProfile";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x1E4F1C9E8];
    id v12 = a3;
    uint64_t v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4F81CCC;
    v20[3] = &unk_1E60BBD70;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 59, (uint64_t)v14, (uint64_t)v8, v20);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F81CE4;
    block[3] = &unk_1E60BBCF8;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)updateKnownNetworkProfile:(id)a3 properties:(id)a4 OSSpecificKeys:(id)a5 requestParams:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v21 = v16;
  if (v12)
  {
    id v22 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v17, v18, v19, v20);
    objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v12, @"NetworkProfile", v24);
    objc_msgSend_setObject_forKeyedSubscript_(v22, v25, (uint64_t)v13, @"NetworkProfileProperties", v26);
    objc_msgSend_setObject_forKeyedSubscript_(v22, v27, (uint64_t)v14, @"OSSpecificKeys", v28);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = sub_1B4F81F2C;
    v33[3] = &unk_1E60BBD70;
    id v34 = v21;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v29, 61, (uint64_t)v22, (uint64_t)v15, v33);
  }
  else
  {
    replyQueue = self->_replyQueue;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = sub_1B4F81F44;
    v31[3] = &unk_1E60BBCF8;
    id v32 = v16;
    dispatch_async(replyQueue, v31);
    id v22 = v32;
  }
}

- (void)removeKnownNetworkProfile:(id)a3 reason:(int64_t)a4 requestParams:(id)a5 reply:(id)a6
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v12 = v11;
  if (a3)
  {
    v29[0] = a3;
    v28[0] = @"NetworkProfile";
    v28[1] = @"RemoveReason";
    id v13 = NSNumber;
    id v14 = a3;
    uint64_t v18 = objc_msgSend_numberWithInteger_(v13, v15, a4, v16, v17);
    v29[1] = v18;
    uint64_t v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v29, (uint64_t)v28, 2);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1B4F821A8;
    v26[3] = &unk_1E60BBD70;
    id v21 = &v27;
    id v27 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v22, 60, (uint64_t)v20, (uint64_t)v10, v26);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F821C0;
    block[3] = &unk_1E60BBCF8;
    id v21 = &v25;
    id v25 = v11;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryThermalIndexWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryCountryBandSupport:(id)a3 reply:(id)a4
{
}

- (void)setThermalIndex:(int64_t)a3 requestParams:(id)a4 reply:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v21 = @"ThermalIndex";
  id v9 = NSNumber;
  id v10 = a4;
  id v14 = objc_msgSend_numberWithInteger_(v9, v11, a3, v12, v13);
  v22[0] = v14;
  uint64_t v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v22, (uint64_t)&v21, 1);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1B4F823B8;
  v19[3] = &unk_1E60BBD70;
  id v20 = v8;
  id v17 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v18, 36, (uint64_t)v16, (uint64_t)v10, v19);
}

- (void)queryLinkDownStatusWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryWoWEnabledWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryIO80211ControllerInfoWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryIO80211InterfaceInfoWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryIPv4AddressesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryIPv4RouterWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryNetworkServiceNameWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryNetworkServiceIDWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryIsNetworkServiceEnabledWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryIPv6AddressesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryIPv6RouterWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryDNSServerAddressesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryDHCPLeaseStartTimeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryDHCPLeaseExpirationTimeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGlobalIPv4AddressesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGlobalIPv4RouterWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGlobalIPv4InterfaceNameWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGlobalIPv4NetworkServiceNameWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGlobalIPv4NetworkServiceIDWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGlobalIPv6InterfaceNameWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGlobalIPv6NetworkServiceNameWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGlobalIPv6NetworkServiceIDWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGlobalIPv6AddressesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGlobalIPv6RouterWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryGlobalDNSServerAddressesWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryNetworkReachabilityWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryEAP8021XSupplicantStateWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryEAP8021XControlModeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryEAP8021XControlStateWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryEAP8021XClientStatusWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryRoamStatusWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryJoinStatusWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAutoJoinStatusWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryDeviceUUIDWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryLinkQualityMetricWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryPowerDebugInfoWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)performAutoJoinWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v12 = (CWFAutoJoinParameters *)v8;
  uint64_t v13 = v12;
  if (!v12)
  {
    uint64_t v13 = objc_alloc_init(CWFAutoJoinParameters);
    objc_msgSend_setTrigger_(v13, v14, 16, v15, v16);
    objc_msgSend_setMode_(v13, v17, 1, v18, v19);
  }
  id v25 = @"AutoJoinParams";
  v26[0] = v13;
  id v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)v26, (uint64_t)&v25, 1);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = sub_1B4F8277C;
  v23[3] = &unk_1E60BBD70;
  id v24 = v10;
  id v21 = v10;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v22, 177, (uint64_t)v20, (uint64_t)v9, v23);
}

- (void)queryCCAWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryUserAutoJoinStateWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)setUserAutoJoinState:(BOOL)a3 requestParams:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v21 = @"UserAutoJoinState";
  id v9 = NSNumber;
  id v10 = a4;
  id v14 = objc_msgSend_numberWithBool_(v9, v11, v6, v12, v13);
  v22[0] = v14;
  uint64_t v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v22, (uint64_t)&v21, 1);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1B4F82900;
  v19[3] = &unk_1E60BBD70;
  id v20 = v8;
  id v17 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v18, 180, (uint64_t)v16, (uint64_t)v10, v19);
}

- (void)queryAutoHotspotModeWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)setAutoHotspotMode:(int64_t)a3 requestParams:(id)a4 reply:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v21 = @"AutoHotspotMode";
  id v9 = NSNumber;
  id v10 = a4;
  id v14 = objc_msgSend_numberWithInteger_(v9, v11, a3, v12, v13);
  v22[0] = v14;
  uint64_t v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v22, (uint64_t)&v21, 1);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1B4F82A74;
  v19[3] = &unk_1E60BBD70;
  id v20 = v8;
  id v17 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v18, 183, (uint64_t)v16, (uint64_t)v10, v19);
}

- (void)queryWiFiUIStateFlagsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryRxRateWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)performSensingWithParameters:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    id v22 = @"SensingParams";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x1E4F1C9E8];
    id v12 = a3;
    id v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4F82C48;
    v20[3] = &unk_1E60BBD70;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 188, (uint64_t)v14, (uint64_t)v8, v20);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F82CEC;
    block[3] = &unk_1E60BBCF8;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)performNearbyDeviceDiscovery:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    id v22 = @"NDDParams";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x1E4F1C9E8];
    id v12 = a3;
    id v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4F82F18;
    v20[3] = &unk_1E60BBD70;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 238, (uint64_t)v14, (uint64_t)v8, v20);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F82F30;
    block[3] = &unk_1E60BBCF8;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryUserSettingsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)setUserSettings:(id)a3 properties:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (v10)
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_msgSend_setObject_forKey_(v15, v16, (uint64_t)v10, @"UserSettings", v17);
    if (v11) {
      objc_msgSend_setObject_forKey_(v15, v18, (uint64_t)v11, @"UserSettingsProperties", v19);
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1B4F83158;
    v24[3] = &unk_1E60BBD70;
    id v25 = v14;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v20, 190, (uint64_t)v15, (uint64_t)v12, v24);
  }
  else
  {
    replyQueue = self->_replyQueue;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = sub_1B4F83170;
    v22[3] = &unk_1E60BBCF8;
    id v23 = v13;
    dispatch_async(replyQueue, v22);
    id v15 = v23;
  }
}

- (void)queryAutoJoinMetricWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAutoJoinStatisticsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)resetAutoJoinStatisticsWithRequestParams:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B4F832C8;
  v9[3] = &unk_1E60BBD70;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v8, 195, 0, (uint64_t)a3, v9);
}

- (void)queryIPv4SubnetMasksWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryIPv4ARPResolvedHardwareAddressWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryIPv4ARPResolvedIPAddressWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryDHCPServerIDWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryDHCPv6ServerIDWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryIPv4NetworkSignatureWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryIPv6NetworkSignatureWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)updateKnownBSS:(id)a3 knownNetworkProfile:(id)a4 properties:(id)a5 OSSpecificKeys:(id)a6 requestParams:(id)a7 reply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v24 = v19;
  if (v14 && v15)
  {
    id v25 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v20, v21, v22, v23);
    objc_msgSend_setObject_forKeyedSubscript_(v25, v26, (uint64_t)v15, @"NetworkProfile", v27);
    objc_msgSend_setObject_forKeyedSubscript_(v25, v28, (uint64_t)v14, @"BSS", v29);
    objc_msgSend_setObject_forKeyedSubscript_(v25, v30, (uint64_t)v16, @"BSSProperties", v31);
    objc_msgSend_setObject_forKeyedSubscript_(v25, v32, (uint64_t)v17, @"OSSpecificKeys", v33);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    void v38[2] = sub_1B4F83538;
    v38[3] = &unk_1E60BBD70;
    id v39 = v24;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v34, 200, (uint64_t)v25, (uint64_t)v18, v38);
  }
  else
  {
    replyQueue = self->_replyQueue;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = sub_1B4F83550;
    v36[3] = &unk_1E60BBCF8;
    id v37 = v19;
    dispatch_async(replyQueue, v36);
    id v25 = v37;
  }
}

- (void)addKnownBSS:(id)a3 knownNetworkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  void v28[2] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v12 = v11;
  if (a3 && a4)
  {
    v27[0] = @"NetworkProfile";
    v27[1] = @"BSS";
    v28[0] = a4;
    v28[1] = a3;
    id v13 = (void *)MEMORY[0x1E4F1C9E8];
    id v14 = a4;
    id v15 = a3;
    id v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v13, v16, (uint64_t)v28, (uint64_t)v27, 2);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B4F837A8;
    v25[3] = &unk_1E60BBD70;
    id v18 = &v26;
    id v26 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v19, 198, (uint64_t)v17, (uint64_t)v10, v25);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F837C0;
    block[3] = &unk_1E60BBCF8;
    id v18 = &v24;
    id v24 = v11;
    id v21 = a4;
    id v22 = a3;
    dispatch_async(replyQueue, block);
  }
}

- (void)removeKnownBSS:(id)a3 knownNetworkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  void v28[2] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v12 = v11;
  if (a3 && a4)
  {
    v27[0] = @"NetworkProfile";
    v27[1] = @"BSS";
    v28[0] = a4;
    v28[1] = a3;
    id v13 = (void *)MEMORY[0x1E4F1C9E8];
    id v14 = a4;
    id v15 = a3;
    id v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v13, v16, (uint64_t)v28, (uint64_t)v27, 2);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B4F83A18;
    v25[3] = &unk_1E60BBD70;
    id v18 = &v26;
    id v26 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v19, 199, (uint64_t)v17, (uint64_t)v10, v25);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F83A30;
    block[3] = &unk_1E60BBCF8;
    id v18 = &v24;
    id v24 = v11;
    id v21 = a4;
    id v22 = a3;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryPasswordForKnownNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    id v22 = @"NetworkProfile";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x1E4F1C9E8];
    id v12 = a3;
    id v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4F83C58;
    v20[3] = &unk_1E60BBD70;
    id v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 201, (uint64_t)v14, (uint64_t)v8, v20);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F83CFC;
    block[3] = &unk_1E60BBCF8;
    id v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)setPassword:(id)a3 knownNetworkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v18 = v13;
  if (v11)
  {
    id v19 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v14, v15, v16, v17);
    objc_msgSend_setObject_forKeyedSubscript_(v19, v20, (uint64_t)v11, @"NetworkProfile", v21);
    objc_msgSend_setObject_forKeyedSubscript_(v19, v22, (uint64_t)v10, @"Password", v23);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    void v28[2] = sub_1B4F83F18;
    void v28[3] = &unk_1E60BBD70;
    id v29 = v18;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v24, 202, (uint64_t)v19, (uint64_t)v12, v28);
  }
  else
  {
    replyQueue = self->_replyQueue;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    void v26[2] = sub_1B4F83F30;
    v26[3] = &unk_1E60BBCF8;
    id v27 = v13;
    dispatch_async(replyQueue, v26);
    id v19 = v27;
  }
}

- (void)queryMaxLinkSpeedWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryStateWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryPowersaveWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryMaxNSSForAPWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryTxNSSWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryBeaconCacheWithRequestParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B4F84110;
  v10[3] = &unk_1E60BC040;
  objc_copyWeak(&v12, &location);
  id v8 = v7;
  id v11 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v9, 216, 0, (uint64_t)v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)queryBackgroundScanCacheWithRequestParams:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B4F84300;
  v10[3] = &unk_1E60BC040;
  objc_copyWeak(&v12, &location);
  id v8 = v7;
  id v11 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v9, 241, 0, (uint64_t)v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)queryBackgroundScanConfigurationWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)setBackgroundScanConfiguration:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    id v22 = @"BackgroundScanConfiguration";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x1E4F1C9E8];
    id v12 = a3;
    id v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4F84598;
    v20[3] = &unk_1E60BBD70;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 244, (uint64_t)v14, (uint64_t)v8, v20);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F845B0;
    block[3] = &unk_1E60BBCF8;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryBlockedBandsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)setBlockedBands:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    id v22 = @"BlockedBands";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x1E4F1C9E8];
    id v12 = a3;
    id v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4F847E8;
    v20[3] = &unk_1E60BBD70;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 218, (uint64_t)v14, (uint64_t)v8, v20);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F84800;
    block[3] = &unk_1E60BBCF8;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)startHostAPModeWithConfiguration:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    id v22 = @"HostAPConfiguration";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x1E4F1C9E8];
    id v12 = a3;
    id v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4F84A28;
    v20[3] = &unk_1E60BBD70;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 220, (uint64_t)v14, (uint64_t)v8, v20);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F84A40;
    block[3] = &unk_1E60BBCF8;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)stopHostAPModeWithRequestParams:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B4F84B78;
  v9[3] = &unk_1E60BBD70;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v8, 221, 0, (uint64_t)a3, v9);
}

- (void)queryPrivateMACAddressForNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    id v22 = @"NetworkProfile";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x1E4F1C9E8];
    id v12 = a3;
    id v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4F84D2C;
    v20[3] = &unk_1E60BBD70;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 222, (uint64_t)v14, (uint64_t)v8, v20);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F84DD0;
    block[3] = &unk_1E60BBCF8;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryPrivateMACAddressModeForNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    id v22 = @"NetworkProfile";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x1E4F1C9E8];
    id v12 = a3;
    id v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4F84FFC;
    v20[3] = &unk_1E60BBD70;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 223, (uint64_t)v14, (uint64_t)v8, v20);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F850A0;
    block[3] = &unk_1E60BBCF8;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)setPrivateMACAddressMode:(int64_t)a3 networkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v12 = v11;
  if (a4)
  {
    v29[0] = a4;
    v28[0] = @"NetworkProfile";
    v28[1] = @"PrivateMACMode";
    id v13 = NSNumber;
    id v14 = a4;
    id v18 = objc_msgSend_numberWithInteger_(v13, v15, a3, v16, v17);
    v29[1] = v18;
    id v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v29, (uint64_t)v28, 2);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    void v26[2] = sub_1B4F85308;
    v26[3] = &unk_1E60BBD70;
    id v21 = &v27;
    id v27 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v22, 224, (uint64_t)v20, (uint64_t)v10, v26);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F85320;
    block[3] = &unk_1E60BBCF8;
    id v21 = &v25;
    id v25 = v11;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryPrivateMACAddressModeSystemSettingWithRequestParams:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B4F85458;
  v9[3] = &unk_1E60BBD70;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v8, 225, 0, (uint64_t)a3, v9);
}

- (void)setPrivateMACAddressModeSystemSetting:(int64_t)a3 requestParams:(id)a4 reply:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v21 = @"PrivateMACMode";
  id v9 = NSNumber;
  id v10 = a4;
  id v14 = objc_msgSend_numberWithInteger_(v9, v11, a3, v12, v13);
  v22[0] = v14;
  uint64_t v16 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v15, (uint64_t)v22, (uint64_t)&v21, 1);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1B4F85648;
  v19[3] = &unk_1E60BBD70;
  id v20 = v8;
  id v17 = v8;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v18, 226, (uint64_t)v16, (uint64_t)v10, v19);
}

- (void)setPrivateMACAddressUserJoinFailureUIState:(BOOL)a3 networkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  BOOL v8 = a3;
  v29[2] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = v11;
  if (a4)
  {
    v29[0] = a4;
    v28[0] = @"NetworkProfile";
    v28[1] = @"State";
    uint64_t v13 = NSNumber;
    id v14 = a4;
    id v18 = objc_msgSend_numberWithBool_(v13, v15, v8, v16, v17);
    v29[1] = v18;
    id v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v29, (uint64_t)v28, 2);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    void v26[2] = sub_1B4F85838;
    v26[3] = &unk_1E60BBD70;
    id v21 = &v27;
    id v27 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v22, 227, (uint64_t)v20, (uint64_t)v10, v26);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F85850;
    block[3] = &unk_1E60BBCF8;
    id v21 = &v25;
    id v25 = v11;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryIsQuickProbeRequiredForNetworkProfile:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    id v22 = @"NetworkProfile";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x1E4F1C9E8];
    id v12 = a3;
    id v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4F85A78;
    v20[3] = &unk_1E60BBD70;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 228, (uint64_t)v14, (uint64_t)v8, v20);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F85B1C;
    block[3] = &unk_1E60BBCF8;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)reportQuickProbeResult:(BOOL)a3 networkProfile:(id)a4 requestParams:(id)a5 reply:(id)a6
{
  BOOL v8 = a3;
  v29[2] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v12 = v11;
  if (a4)
  {
    v29[0] = a4;
    v28[0] = @"NetworkProfile";
    v28[1] = @"Result";
    uint64_t v13 = NSNumber;
    id v14 = a4;
    id v18 = objc_msgSend_numberWithBool_(v13, v15, v8, v16, v17);
    v29[1] = v18;
    id v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)v29, (uint64_t)v28, 2);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    void v26[2] = sub_1B4F85D84;
    v26[3] = &unk_1E60BBD70;
    id v21 = &v27;
    id v27 = v12;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v22, 229, (uint64_t)v20, (uint64_t)v10, v26);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F85D9C;
    block[3] = &unk_1E60BBCF8;
    id v21 = &v25;
    id v25 = v11;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryHostAPStationListWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryLQMConfigurationWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)setLQMConfiguration:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (a3)
  {
    id v22 = @"LQMConfiguration";
    v23[0] = a3;
    id v11 = (void *)MEMORY[0x1E4F1C9E8];
    id v12 = a3;
    id v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v11, v13, (uint64_t)v23, (uint64_t)&v22, 1);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B4F85FE4;
    v20[3] = &unk_1E60BBD70;
    uint64_t v15 = &v21;
    id v21 = v10;
    objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v16, 235, (uint64_t)v14, (uint64_t)v8, v20);
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1B4F85FFC;
    block[3] = &unk_1E60BBCF8;
    uint64_t v15 = &v19;
    id v19 = v9;
    dispatch_async(replyQueue, block);
  }
}

- (void)queryWiFiAssistOverrideReasonsWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)queryAutoJoinDenyListWithRequestParams:(id)a3 reply:(id)a4
{
}

- (void)setAutoJoinDenyListForNetwork:(id)a3 reason:(unint64_t)a4 requestParams:(id)a5 reply:(id)a6
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  v24[0] = @"NetworkProfile";
  v24[1] = @"AutoJoinDenyListAddReason";
  v25[0] = a3;
  id v11 = NSNumber;
  id v12 = a5;
  id v13 = a3;
  uint64_t v17 = objc_msgSend_numberWithUnsignedInteger_(v11, v14, a4, v15, v16);
  v25[1] = v17;
  id v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v18, (uint64_t)v25, (uint64_t)v24, 2);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = sub_1B4F8621C;
  v22[3] = &unk_1E60BBD70;
  id v23 = v10;
  id v20 = v10;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v21, 246, (uint64_t)v19, (uint64_t)v12, v22);
}

- (void)clearAutoJoinDenyListForNetwork:(id)a3 reason:(unint64_t)a4 requestParams:(id)a5 reply:(id)a6
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  v24[0] = @"NetworkProfile";
  v24[1] = @"AutoJoinDenyListRemoveReason";
  v25[0] = a3;
  id v11 = NSNumber;
  id v12 = a5;
  id v13 = a3;
  uint64_t v17 = objc_msgSend_numberWithUnsignedInteger_(v11, v14, a4, v15, v16);
  v25[1] = v17;
  id v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v18, (uint64_t)v25, (uint64_t)v24, 2);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = sub_1B4F86434;
  v22[3] = &unk_1E60BBD70;
  id v23 = v10;
  id v20 = v10;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v21, 247, (uint64_t)v19, (uint64_t)v12, v22);
}

- (void)queryKnownNetworkInfoForLocalNetworkPromptWithOptions:(id)a3 requestParams:(id)a4 reply:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  if (v8)
  {
    uint64_t v17 = @"KnownNetworkInfoOptions";
    v18[0] = v8;
    id v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)v18, (uint64_t)&v17, 1);
  }
  else
  {
    id v12 = 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1B4F86618;
  v15[3] = &unk_1E60BBD70;
  id v16 = v11;
  id v13 = v11;
  objc_msgSend___addXPCRequestWithType_info_requestParams_reply_(self, v14, 248, (uint64_t)v12, (uint64_t)v9, v15);
}

- (NSXPCConnection)XPCConnection
{
  return self->_XPCConnection;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (NSArray)bootArgs
{
  return self->_bootArgs;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)codesignID
{
  return self->_codesignID;
}

- (void)setRemoteXPCProxyConnection:(id)a3
{
}

@end