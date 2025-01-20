@interface HMDHomePodSetupLatencyLogEvent
- (BOOL)IDSAvailable_INT;
- (BOOL)controllerHasSentinelZone_INT;
- (BOOL)controllerInHH2_INT;
- (BOOL)currentDeviceConfirmedPrimaryResident_INT;
- (BOOL)iCloudAvailable_INT;
- (BOOL)manateeAvailable_INT;
- (BOOL)networkAvailable_INT;
- (HMDHomePodSetupLatencyLogEvent)initWithSessionSetupOpenMS_HH1:(int64_t)a3 controllerKeyExchangeMS_HH1:(int64_t)a4 newAccessoryTransferMS_HH1:(int64_t)a5 sessionSetupCloseMS_HH1:(int64_t)a6 sentinelZoneFetchMS_HH1:(int64_t)a7 totalDurationMS_HH1:(int64_t)a8 accountSettleWaitMS_HH2:(int64_t)a9 currentDeviceIDSWaitMS_HH2:(int64_t)a10 homeManagerReadyMS_HH2:(int64_t)a11 firstCoreDataImportMS_HH2:(int64_t)a12 accessoryAddMS_HH2:(int64_t)a13 settingsCreationMS_HH2:(int64_t)a14 pairingIdentityCreationMS_HH2:(int64_t)a15 siriReadyMS_HH2:(int64_t)a16 eventRouterServerConnectionMS_HH2:(int64_t)a17 primaryResidentElectionMS_HH2:(int64_t)a18 eventRouterFirstEventPushMS_HH2:(int64_t)a19 totalDurationMS_HH2:(int64_t)a20 iCloudAvailable_INT:(BOOL)a21 IDSAvailable_INT:(BOOL)a22 manateeAvailable_INT:(BOOL)a23 networkAvailable_INT:(BOOL)a24 controllerInHH2_INT:(BOOL)a25 controllerHasSentinelZone_INT:(BOOL)a26 errorCode:(int64_t)a27 errorDomain:(id)a28 underlyingErrorCode:(int64_t)a29 underlyingErrorDomain:(id)a30 errorStage_String:(id)a31 setupSessionIdentifier:(id)a32 numberOfTimesPrimaryResidentChanged_HH2:(unsigned int)a33 lastPrimaryClientConnectedTime_HH2:(int64_t)a34 numberOfTimesPrimaryClientConnected_HH2:(unsigned int)a35 numberOfTimesPrimaryClientDisconnected_HH2:(unsigned int)a36 numberOfTimesPrimaryClientConnectMessageFailed_HH2:(unsigned int)a37 currentDeviceConfirmedPrimaryResident_INT:(BOOL)a38 lastPrimaryClientConnectMessageFailErrorCode_HH2:(int64_t)a39 lastPrimaryClientConnectMessageFailErrorDomain_HH2:(id)a40 lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2:(int64_t)a41 lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2:(id)a42 primaryResidentElectionPeerDeviceFutureResolvedMS_HH2:(int64_t)a43 primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:(int64_t)a44 primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:(int64_t)a45 primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:(int64_t)a46 primaryResidentElectionJoinMeshMS_HH2:(int64_t)a47 firstCoreDataContainerSetupDurationMS_HH2:(int64_t)a48 firstCoreDataContainerSetupErrorCode_HH2:(int64_t)a49 firstCoreDataContainerSetupErrorDomain_HH2:(id)a50 firstCoreDataContainerSetupUnderlyingErrorCode_HH2:(int64_t)a51 firstCoreDataContainerSetupUnderlyingErrorDomain_HH2:(id)a52 savedEventState:(unint64_t)a53;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)errorDomain;
- (NSString)errorStage_String;
- (NSString)firstCoreDataContainerSetupErrorDomain_HH2;
- (NSString)firstCoreDataContainerSetupUnderlyingErrorDomain_HH2;
- (NSString)lastPrimaryClientConnectMessageFailErrorDomain_HH2;
- (NSString)lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2;
- (NSString)setupSessionIdentifier;
- (NSString)underlyingErrorDomain;
- (id)initLogEventWithInitialState:(unint64_t)a3;
- (int64_t)IDSRegistrationError_INT;
- (int64_t)IDSRegistrationStatus_INT;
- (int64_t)accessoryAddMS_HH2;
- (int64_t)accountSettleWaitMS_HH2;
- (int64_t)controllerKeyExchangeMS_HH1;
- (int64_t)currentDeviceIDSWaitMS_HH2;
- (int64_t)errorCode;
- (int64_t)eventRouterFirstEventPushMS_HH2;
- (int64_t)eventRouterServerConnectionMS_HH2;
- (int64_t)firstCoreDataContainerSetupDurationMS_HH2;
- (int64_t)firstCoreDataContainerSetupErrorCode_HH2;
- (int64_t)firstCoreDataContainerSetupUnderlyingErrorCode_HH2;
- (int64_t)firstCoreDataImportMS_HH2;
- (int64_t)homeManagerReadyMS_HH2;
- (int64_t)lastPrimaryClientConnectMessageFailErrorCode_HH2;
- (int64_t)lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2;
- (int64_t)newAccessoryTransferMS_HH1;
- (int64_t)pairingIdentityCreationMS_HH2;
- (int64_t)primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2;
- (int64_t)primaryResidentElectionJoinMeshMS_HH2;
- (int64_t)primaryResidentElectionMS_HH2;
- (int64_t)primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2;
- (int64_t)primaryResidentElectionPeerDeviceFutureResolvedMS_HH2;
- (int64_t)primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2;
- (int64_t)sentinelZoneFetchMS_HH1;
- (int64_t)sessionSetupCloseMS_HH1;
- (int64_t)sessionSetupOpenMS_HH1;
- (int64_t)settingsCreationMS_HH2;
- (int64_t)siriReadyMS_HH2;
- (int64_t)totalDurationMS_HH1;
- (int64_t)totalDurationMS_HH2;
- (int64_t)underlyingErrorCode;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)lastPrimaryClientConnectedTime_HH2;
- (unint64_t)savedEventState;
- (unsigned)numberOfTimesPrimaryClientConnectMessageFailed_HH2;
- (unsigned)numberOfTimesPrimaryClientConnected_HH2;
- (unsigned)numberOfTimesPrimaryClientDisconnected_HH2;
- (unsigned)numberOfTimesPrimaryResidentChanged_HH2;
- (void)setAccessoryAddMS_HH2:(int64_t)a3;
- (void)setAccountSettleWaitMS_HH2:(int64_t)a3;
- (void)setControllerHasSentinelZone_INT:(BOOL)a3;
- (void)setControllerInHH2_INT:(BOOL)a3;
- (void)setControllerKeyExchangeMS_HH1:(int64_t)a3;
- (void)setCurrentDeviceConfirmedPrimaryResident_INT:(BOOL)a3;
- (void)setCurrentDeviceIDSWaitMS_HH2:(int64_t)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setErrorDomain:(id)a3;
- (void)setErrorStage_String:(id)a3;
- (void)setEventRouterFirstEventPushMS_HH2:(int64_t)a3;
- (void)setEventRouterServerConnectionMS_HH2:(int64_t)a3;
- (void)setFirstCoreDataContainerSetupDurationMS_HH2:(int64_t)a3;
- (void)setFirstCoreDataContainerSetupErrorCode_HH2:(int64_t)a3;
- (void)setFirstCoreDataContainerSetupErrorDomain_HH2:(id)a3;
- (void)setFirstCoreDataContainerSetupUnderlyingErrorCode_HH2:(int64_t)a3;
- (void)setFirstCoreDataContainerSetupUnderlyingErrorDomain_HH2:(id)a3;
- (void)setFirstCoreDataImportMS_HH2:(int64_t)a3;
- (void)setHomeManagerReadyMS_HH2:(int64_t)a3;
- (void)setICloudAvailable_INT:(BOOL)a3;
- (void)setIDSAvailable_INT:(BOOL)a3;
- (void)setIDSRegistrationError_INT:(int64_t)a3;
- (void)setIDSRegistrationStatus_INT:(int64_t)a3;
- (void)setLastPrimaryClientConnectMessageFailErrorCode_HH2:(int64_t)a3;
- (void)setLastPrimaryClientConnectMessageFailErrorDomain_HH2:(id)a3;
- (void)setLastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2:(int64_t)a3;
- (void)setLastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2:(id)a3;
- (void)setLastPrimaryClientConnectedTime_HH2:(unint64_t)a3;
- (void)setManateeAvailable_INT:(BOOL)a3;
- (void)setNetworkAvailable_INT:(BOOL)a3;
- (void)setNewAccessoryTransferMS_HH1:(int64_t)a3;
- (void)setNumberOfTimesPrimaryClientConnectMessageFailed_HH2:(unsigned int)a3;
- (void)setNumberOfTimesPrimaryClientConnected_HH2:(unsigned int)a3;
- (void)setNumberOfTimesPrimaryClientDisconnected_HH2:(unsigned int)a3;
- (void)setNumberOfTimesPrimaryResidentChanged_HH2:(unsigned int)a3;
- (void)setPairingIdentityCreationMS_HH2:(int64_t)a3;
- (void)setPrimaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:(int64_t)a3;
- (void)setPrimaryResidentElectionJoinMeshMS_HH2:(int64_t)a3;
- (void)setPrimaryResidentElectionMS_HH2:(int64_t)a3;
- (void)setPrimaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:(int64_t)a3;
- (void)setPrimaryResidentElectionPeerDeviceFutureResolvedMS_HH2:(int64_t)a3;
- (void)setPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:(int64_t)a3;
- (void)setSavedEventState:(unint64_t)a3;
- (void)setSentinelZoneFetchMS_HH1:(int64_t)a3;
- (void)setSessionSetupCloseMS_HH1:(int64_t)a3;
- (void)setSessionSetupOpenMS_HH1:(int64_t)a3;
- (void)setSettingsCreationMS_HH2:(int64_t)a3;
- (void)setSetupSessionIdentifier:(id)a3;
- (void)setSiriReadyMS_HH2:(int64_t)a3;
- (void)setTotalDurationMS_HH1:(int64_t)a3;
- (void)setTotalDurationMS_HH2:(int64_t)a3;
- (void)setUnderlyingErrorCode:(int64_t)a3;
- (void)setUnderlyingErrorDomain:(id)a3;
@end

@implementation HMDHomePodSetupLatencyLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstCoreDataContainerSetupUnderlyingErrorDomain_HH2, 0);
  objc_storeStrong((id *)&self->_firstCoreDataContainerSetupErrorDomain_HH2, 0);
  objc_storeStrong((id *)&self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2, 0);
  objc_storeStrong((id *)&self->_lastPrimaryClientConnectMessageFailErrorDomain_HH2, 0);
  objc_storeStrong((id *)&self->_setupSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_errorStage_String, 0);
  objc_storeStrong((id *)&self->_underlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
}

- (void)setSavedEventState:(unint64_t)a3
{
  self->_savedEventState = a3;
}

- (unint64_t)savedEventState
{
  return self->_savedEventState;
}

- (void)setFirstCoreDataContainerSetupUnderlyingErrorDomain_HH2:(id)a3
{
}

- (NSString)firstCoreDataContainerSetupUnderlyingErrorDomain_HH2
{
  return self->_firstCoreDataContainerSetupUnderlyingErrorDomain_HH2;
}

- (void)setFirstCoreDataContainerSetupUnderlyingErrorCode_HH2:(int64_t)a3
{
  self->_firstCoreDataContainerSetupUnderlyingErrorCode_HH2 = a3;
}

- (int64_t)firstCoreDataContainerSetupUnderlyingErrorCode_HH2
{
  return self->_firstCoreDataContainerSetupUnderlyingErrorCode_HH2;
}

- (void)setFirstCoreDataContainerSetupErrorDomain_HH2:(id)a3
{
}

- (NSString)firstCoreDataContainerSetupErrorDomain_HH2
{
  return self->_firstCoreDataContainerSetupErrorDomain_HH2;
}

- (void)setFirstCoreDataContainerSetupErrorCode_HH2:(int64_t)a3
{
  self->_firstCoreDataContainerSetupErrorCode_HH2 = a3;
}

- (int64_t)firstCoreDataContainerSetupErrorCode_HH2
{
  return self->_firstCoreDataContainerSetupErrorCode_HH2;
}

- (void)setFirstCoreDataContainerSetupDurationMS_HH2:(int64_t)a3
{
  self->_firstCoreDataContainerSetupDurationMS_HH2 = a3;
}

- (int64_t)firstCoreDataContainerSetupDurationMS_HH2
{
  return self->_firstCoreDataContainerSetupDurationMS_HH2;
}

- (void)setPrimaryResidentElectionJoinMeshMS_HH2:(int64_t)a3
{
  self->_primaryResidentElectionJoinMeshMS_HH2 = a3;
}

- (int64_t)primaryResidentElectionJoinMeshMS_HH2
{
  return self->_primaryResidentElectionJoinMeshMS_HH2;
}

- (void)setPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:(int64_t)a3
{
  self->_primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2 = a3;
}

- (int64_t)primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2
{
  return self->_primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2;
}

- (void)setPrimaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:(int64_t)a3
{
  self->_primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2 = a3;
}

- (int64_t)primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2
{
  return self->_primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2;
}

- (void)setPrimaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:(int64_t)a3
{
  self->_primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2 = a3;
}

- (int64_t)primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2
{
  return self->_primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2;
}

- (void)setPrimaryResidentElectionPeerDeviceFutureResolvedMS_HH2:(int64_t)a3
{
  self->_primaryResidentElectionPeerDeviceFutureResolvedMS_HH2 = a3;
}

- (int64_t)primaryResidentElectionPeerDeviceFutureResolvedMS_HH2
{
  return self->_primaryResidentElectionPeerDeviceFutureResolvedMS_HH2;
}

- (void)setLastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2:(id)a3
{
}

- (NSString)lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2
{
  return self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2;
}

- (void)setLastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2:(int64_t)a3
{
  self->_lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2 = a3;
}

- (int64_t)lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2
{
  return self->_lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2;
}

- (void)setLastPrimaryClientConnectMessageFailErrorDomain_HH2:(id)a3
{
}

- (NSString)lastPrimaryClientConnectMessageFailErrorDomain_HH2
{
  return self->_lastPrimaryClientConnectMessageFailErrorDomain_HH2;
}

- (void)setLastPrimaryClientConnectMessageFailErrorCode_HH2:(int64_t)a3
{
  self->_lastPrimaryClientConnectMessageFailErrorCode_HH2 = a3;
}

- (int64_t)lastPrimaryClientConnectMessageFailErrorCode_HH2
{
  return self->_lastPrimaryClientConnectMessageFailErrorCode_HH2;
}

- (void)setCurrentDeviceConfirmedPrimaryResident_INT:(BOOL)a3
{
  self->_currentDeviceConfirmedPrimaryResident_INT = a3;
}

- (BOOL)currentDeviceConfirmedPrimaryResident_INT
{
  return self->_currentDeviceConfirmedPrimaryResident_INT;
}

- (void)setNumberOfTimesPrimaryClientConnectMessageFailed_HH2:(unsigned int)a3
{
  self->_numberOfTimesPrimaryClientConnectMessageFailed_HH2 = a3;
}

- (unsigned)numberOfTimesPrimaryClientConnectMessageFailed_HH2
{
  return self->_numberOfTimesPrimaryClientConnectMessageFailed_HH2;
}

- (void)setNumberOfTimesPrimaryClientDisconnected_HH2:(unsigned int)a3
{
  self->_numberOfTimesPrimaryClientDisconnected_HH2 = a3;
}

- (unsigned)numberOfTimesPrimaryClientDisconnected_HH2
{
  return self->_numberOfTimesPrimaryClientDisconnected_HH2;
}

- (void)setNumberOfTimesPrimaryClientConnected_HH2:(unsigned int)a3
{
  self->_numberOfTimesPrimaryClientConnected_HH2 = a3;
}

- (unsigned)numberOfTimesPrimaryClientConnected_HH2
{
  return self->_numberOfTimesPrimaryClientConnected_HH2;
}

- (void)setLastPrimaryClientConnectedTime_HH2:(unint64_t)a3
{
  self->_lastPrimaryClientConnectedTime_HH2 = a3;
}

- (unint64_t)lastPrimaryClientConnectedTime_HH2
{
  return self->_lastPrimaryClientConnectedTime_HH2;
}

- (void)setNumberOfTimesPrimaryResidentChanged_HH2:(unsigned int)a3
{
  self->_numberOfTimesPrimaryResidentChanged_HH2 = a3;
}

- (unsigned)numberOfTimesPrimaryResidentChanged_HH2
{
  return self->_numberOfTimesPrimaryResidentChanged_HH2;
}

- (void)setSetupSessionIdentifier:(id)a3
{
}

- (NSString)setupSessionIdentifier
{
  return self->_setupSessionIdentifier;
}

- (void)setErrorStage_String:(id)a3
{
}

- (NSString)errorStage_String
{
  return self->_errorStage_String;
}

- (void)setUnderlyingErrorDomain:(id)a3
{
}

- (NSString)underlyingErrorDomain
{
  return self->_underlyingErrorDomain;
}

- (void)setUnderlyingErrorCode:(int64_t)a3
{
  self->_underlyingErrorCode = a3;
}

- (int64_t)underlyingErrorCode
{
  return self->_underlyingErrorCode;
}

- (void)setErrorDomain:(id)a3
{
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setControllerHasSentinelZone_INT:(BOOL)a3
{
  self->_controllerHasSentinelZone_INT = a3;
}

- (BOOL)controllerHasSentinelZone_INT
{
  return self->_controllerHasSentinelZone_INT;
}

- (void)setControllerInHH2_INT:(BOOL)a3
{
  self->_controllerInHH2_INT = a3;
}

- (BOOL)controllerInHH2_INT
{
  return self->_controllerInHH2_INT;
}

- (void)setNetworkAvailable_INT:(BOOL)a3
{
  self->_networkAvailable_INT = a3;
}

- (BOOL)networkAvailable_INT
{
  return self->_networkAvailable_INT;
}

- (void)setManateeAvailable_INT:(BOOL)a3
{
  self->_manateeAvailable_INT = a3;
}

- (BOOL)manateeAvailable_INT
{
  return self->_manateeAvailable_INT;
}

- (void)setIDSRegistrationError_INT:(int64_t)a3
{
  self->_IDSRegistrationError_INT = a3;
}

- (int64_t)IDSRegistrationError_INT
{
  return self->_IDSRegistrationError_INT;
}

- (void)setIDSRegistrationStatus_INT:(int64_t)a3
{
  self->_IDSRegistrationStatus_INT = a3;
}

- (int64_t)IDSRegistrationStatus_INT
{
  return self->_IDSRegistrationStatus_INT;
}

- (void)setIDSAvailable_INT:(BOOL)a3
{
  self->_IDSAvailable_INT = a3;
}

- (BOOL)IDSAvailable_INT
{
  return self->_IDSAvailable_INT;
}

- (void)setICloudAvailable_INT:(BOOL)a3
{
  self->_iCloudAvailable_INT = a3;
}

- (BOOL)iCloudAvailable_INT
{
  return self->_iCloudAvailable_INT;
}

- (void)setTotalDurationMS_HH2:(int64_t)a3
{
  self->_totalDurationMS_HH2 = a3;
}

- (int64_t)totalDurationMS_HH2
{
  return self->_totalDurationMS_HH2;
}

- (void)setEventRouterFirstEventPushMS_HH2:(int64_t)a3
{
  self->_eventRouterFirstEventPushMS_HH2 = a3;
}

- (int64_t)eventRouterFirstEventPushMS_HH2
{
  return self->_eventRouterFirstEventPushMS_HH2;
}

- (void)setPrimaryResidentElectionMS_HH2:(int64_t)a3
{
  self->_primaryResidentElectionMS_HH2 = a3;
}

- (int64_t)primaryResidentElectionMS_HH2
{
  return self->_primaryResidentElectionMS_HH2;
}

- (void)setEventRouterServerConnectionMS_HH2:(int64_t)a3
{
  self->_eventRouterServerConnectionMS_HH2 = a3;
}

- (int64_t)eventRouterServerConnectionMS_HH2
{
  return self->_eventRouterServerConnectionMS_HH2;
}

- (void)setSiriReadyMS_HH2:(int64_t)a3
{
  self->_siriReadyMS_HH2 = a3;
}

- (int64_t)siriReadyMS_HH2
{
  return self->_siriReadyMS_HH2;
}

- (void)setPairingIdentityCreationMS_HH2:(int64_t)a3
{
  self->_pairingIdentityCreationMS_HH2 = a3;
}

- (int64_t)pairingIdentityCreationMS_HH2
{
  return self->_pairingIdentityCreationMS_HH2;
}

- (void)setSettingsCreationMS_HH2:(int64_t)a3
{
  self->_settingsCreationMS_HH2 = a3;
}

- (int64_t)settingsCreationMS_HH2
{
  return self->_settingsCreationMS_HH2;
}

- (void)setAccessoryAddMS_HH2:(int64_t)a3
{
  self->_accessoryAddMS_HH2 = a3;
}

- (int64_t)accessoryAddMS_HH2
{
  return self->_accessoryAddMS_HH2;
}

- (void)setFirstCoreDataImportMS_HH2:(int64_t)a3
{
  self->_firstCoreDataImportMS_HH2 = a3;
}

- (int64_t)firstCoreDataImportMS_HH2
{
  return self->_firstCoreDataImportMS_HH2;
}

- (void)setHomeManagerReadyMS_HH2:(int64_t)a3
{
  self->_homeManagerReadyMS_HH2 = a3;
}

- (int64_t)homeManagerReadyMS_HH2
{
  return self->_homeManagerReadyMS_HH2;
}

- (void)setCurrentDeviceIDSWaitMS_HH2:(int64_t)a3
{
  self->_currentDeviceIDSWaitMS_HH2 = a3;
}

- (int64_t)currentDeviceIDSWaitMS_HH2
{
  return self->_currentDeviceIDSWaitMS_HH2;
}

- (void)setAccountSettleWaitMS_HH2:(int64_t)a3
{
  self->_accountSettleWaitMS_HH2 = a3;
}

- (int64_t)accountSettleWaitMS_HH2
{
  return self->_accountSettleWaitMS_HH2;
}

- (void)setTotalDurationMS_HH1:(int64_t)a3
{
  self->_totalDurationMS_HH1 = a3;
}

- (int64_t)totalDurationMS_HH1
{
  return self->_totalDurationMS_HH1;
}

- (void)setSentinelZoneFetchMS_HH1:(int64_t)a3
{
  self->_sentinelZoneFetchMS_HH1 = a3;
}

- (int64_t)sentinelZoneFetchMS_HH1
{
  return self->_sentinelZoneFetchMS_HH1;
}

- (void)setSessionSetupCloseMS_HH1:(int64_t)a3
{
  self->_sessionSetupCloseMS_HH1 = a3;
}

- (int64_t)sessionSetupCloseMS_HH1
{
  return self->_sessionSetupCloseMS_HH1;
}

- (void)setNewAccessoryTransferMS_HH1:(int64_t)a3
{
  self->_newAccessoryTransferMS_HH1 = a3;
}

- (int64_t)newAccessoryTransferMS_HH1
{
  return self->_newAccessoryTransferMS_HH1;
}

- (void)setControllerKeyExchangeMS_HH1:(int64_t)a3
{
  self->_controllerKeyExchangeMS_HH1 = a3;
}

- (int64_t)controllerKeyExchangeMS_HH1
{
  return self->_controllerKeyExchangeMS_HH1;
}

- (void)setSessionSetupOpenMS_HH1:(int64_t)a3
{
  self->_sessionSetupOpenMS_HH1 = a3;
}

- (int64_t)sessionSetupOpenMS_HH1
{
  return self->_sessionSetupOpenMS_HH1;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent sessionSetupOpenMS_HH1](self, "sessionSetupOpenMS_HH1"));
  [v3 setObject:v4 forKeyedSubscript:@"sessionSetupOpenMS_HH1"];

  v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent controllerKeyExchangeMS_HH1](self, "controllerKeyExchangeMS_HH1"));
  [v3 setObject:v5 forKeyedSubscript:@"controllerKeyExchangeMS_HH1"];

  v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent newAccessoryTransferMS_HH1](self, "newAccessoryTransferMS_HH1"));
  [v3 setObject:v6 forKeyedSubscript:@"newAccessoryTransferMS_HH1"];

  v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent sessionSetupCloseMS_HH1](self, "sessionSetupCloseMS_HH1"));
  [v3 setObject:v7 forKeyedSubscript:@"sessionSetupCloseMS_HH1"];

  v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent sentinelZoneFetchMS_HH1](self, "sentinelZoneFetchMS_HH1"));
  [v3 setObject:v8 forKeyedSubscript:@"sentinelZoneFetchMS_HH1"];

  v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent totalDurationMS_HH1](self, "totalDurationMS_HH1"));
  [v3 setObject:v9 forKeyedSubscript:@"totalDurationMS_HH1"];

  v10 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent accountSettleWaitMS_HH2](self, "accountSettleWaitMS_HH2"));
  [v3 setObject:v10 forKeyedSubscript:@"accountSettleWaitMS_HH2"];

  v11 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent currentDeviceIDSWaitMS_HH2](self, "currentDeviceIDSWaitMS_HH2"));
  [v3 setObject:v11 forKeyedSubscript:@"currentDeviceIDSWaitMS_HH2"];

  v12 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent homeManagerReadyMS_HH2](self, "homeManagerReadyMS_HH2"));
  [v3 setObject:v12 forKeyedSubscript:@"homeManagerReadyMS_HH2"];

  v13 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent firstCoreDataImportMS_HH2](self, "firstCoreDataImportMS_HH2"));
  [v3 setObject:v13 forKeyedSubscript:@"firstCoreDataImportMS_HH2"];

  v14 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent accessoryAddMS_HH2](self, "accessoryAddMS_HH2"));
  [v3 setObject:v14 forKeyedSubscript:@"accessoryAddMS_HH2"];

  v15 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent settingsCreationMS_HH2](self, "settingsCreationMS_HH2"));
  [v3 setObject:v15 forKeyedSubscript:@"settingsCreationMS_HH2"];

  v16 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent pairingIdentityCreationMS_HH2](self, "pairingIdentityCreationMS_HH2"));
  [v3 setObject:v16 forKeyedSubscript:@"pairingIdentityCreationMS_HH2"];

  v17 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent siriReadyMS_HH2](self, "siriReadyMS_HH2"));
  [v3 setObject:v17 forKeyedSubscript:@"siriReadyMS_HH2"];

  v18 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent eventRouterServerConnectionMS_HH2](self, "eventRouterServerConnectionMS_HH2"));
  [v3 setObject:v18 forKeyedSubscript:@"eventRouterServerConnectionMS_HH2"];

  v19 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent primaryResidentElectionMS_HH2](self, "primaryResidentElectionMS_HH2"));
  [v3 setObject:v19 forKeyedSubscript:@"primaryResidentElectionMS_HH2"];

  v20 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent eventRouterFirstEventPushMS_HH2](self, "eventRouterFirstEventPushMS_HH2"));
  [v3 setObject:v20 forKeyedSubscript:@"eventRouterFirstEventPushMS_HH2"];

  v21 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent totalDurationMS_HH2](self, "totalDurationMS_HH2"));
  [v3 setObject:v21 forKeyedSubscript:@"totalDurationMS_HH2"];

  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomePodSetupLatencyLogEvent iCloudAvailable_INT](self, "iCloudAvailable_INT"));
  [v3 setObject:v22 forKeyedSubscript:@"iCloudAvailable_INT"];

  v23 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomePodSetupLatencyLogEvent IDSAvailable_INT](self, "IDSAvailable_INT"));
  [v3 setObject:v23 forKeyedSubscript:@"IDSAvailable_INT"];

  v24 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHomePodSetupLatencyLogEvent IDSRegistrationStatus_INT](self, "IDSRegistrationStatus_INT"));
  [v3 setObject:v24 forKeyedSubscript:@"IDSRegistrationStatus_INT"];

  v25 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHomePodSetupLatencyLogEvent IDSRegistrationError_INT](self, "IDSRegistrationError_INT"));
  [v3 setObject:v25 forKeyedSubscript:@"IDSRegistrationError_INT"];

  v26 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomePodSetupLatencyLogEvent manateeAvailable_INT](self, "manateeAvailable_INT"));
  [v3 setObject:v26 forKeyedSubscript:@"manateeAvailable_INT"];

  v27 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomePodSetupLatencyLogEvent networkAvailable_INT](self, "networkAvailable_INT"));
  [v3 setObject:v27 forKeyedSubscript:@"networkAvailable_INT"];

  v28 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomePodSetupLatencyLogEvent controllerInHH2_INT](self, "controllerInHH2_INT"));
  [v3 setObject:v28 forKeyedSubscript:@"controllerInHH2_INT"];

  v29 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomePodSetupLatencyLogEvent controllerHasSentinelZone_INT](self, "controllerHasSentinelZone_INT"));
  [v3 setObject:v29 forKeyedSubscript:@"controllerHasSentinelZone_INT"];

  v30 = [(HMDHomePodSetupLatencyLogEvent *)self errorStage_String];
  [v3 setObject:v30 forKeyedSubscript:@"errorStage_String"];

  v31 = [(HMDHomePodSetupLatencyLogEvent *)self setupSessionIdentifier];

  if (v31)
  {
    v32 = [(HMDHomePodSetupLatencyLogEvent *)self setupSessionIdentifier];
    [v3 setObject:v32 forKeyedSubscript:@"setupSessionIdentifier"];
  }
  v33 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HMDHomePodSetupLatencyLogEvent numberOfTimesPrimaryResidentChanged_HH2](self, "numberOfTimesPrimaryResidentChanged_HH2"));
  [v3 setObject:v33 forKeyedSubscript:@"numberOfTimesPrimaryResidentChanged"];

  v34 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDHomePodSetupLatencyLogEvent lastPrimaryClientConnectedTime_HH2](self, "lastPrimaryClientConnectedTime_HH2"));
  [v3 setObject:v34 forKeyedSubscript:@"lastPrimaryClientConnectedTime"];

  v35 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HMDHomePodSetupLatencyLogEvent numberOfTimesPrimaryClientConnected_HH2](self, "numberOfTimesPrimaryClientConnected_HH2"));
  [v3 setObject:v35 forKeyedSubscript:@"numberOfTimesPrimaryClientConnected"];

  v36 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HMDHomePodSetupLatencyLogEvent numberOfTimesPrimaryClientDisconnected_HH2](self, "numberOfTimesPrimaryClientDisconnected_HH2"));
  [v3 setObject:v36 forKeyedSubscript:@"numberOfTimesPrimaryClientDisconnected"];

  v37 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HMDHomePodSetupLatencyLogEvent numberOfTimesPrimaryClientConnectMessageFailed_HH2](self, "numberOfTimesPrimaryClientConnectMessageFailed_HH2"));
  [v3 setObject:v37 forKeyedSubscript:@"numberOfTimesPrimaryClientConnectMessageFailed"];

  v38 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDHomePodSetupLatencyLogEvent currentDeviceConfirmedPrimaryResident_INT](self, "currentDeviceConfirmedPrimaryResident_INT"));
  [v3 setObject:v38 forKeyedSubscript:@"currentDeviceConfirmedPrimaryResident_INT"];

  v39 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHomePodSetupLatencyLogEvent lastPrimaryClientConnectMessageFailErrorCode_HH2](self, "lastPrimaryClientConnectMessageFailErrorCode_HH2"));
  [v3 setObject:v39 forKeyedSubscript:@"lastPrimaryClientConnectMessageFailErrorCode"];

  v40 = [(HMDHomePodSetupLatencyLogEvent *)self lastPrimaryClientConnectMessageFailErrorDomain_HH2];
  [v3 setObject:v40 forKeyedSubscript:@"lastPrimaryClientConnectMessageFailErrorDomain"];

  v41 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHomePodSetupLatencyLogEvent lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2](self, "lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2"));
  [v3 setObject:v41 forKeyedSubscript:@"lastPrimaryClientConnectMessageFailUnderlyingErrorCode"];

  v42 = [(HMDHomePodSetupLatencyLogEvent *)self lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2];
  [v3 setObject:v42 forKeyedSubscript:@"lastPrimaryClientConnectMessageFailUnderlyingErrorDomain"];

  v43 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent primaryResidentElectionPeerDeviceFutureResolvedMS_HH2](self, "primaryResidentElectionPeerDeviceFutureResolvedMS_HH2"));
  [v3 setObject:v43 forKeyedSubscript:@"primaryResidentElectionPeerDeviceFutureResolvedMS_HH2"];

  v44 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2](self, "primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2"));
  [v3 setObject:v44 forKeyedSubscript:@"primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2"];

  v45 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2](self, "primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2"));
  [v3 setObject:v45 forKeyedSubscript:@"primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2"];

  v46 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2](self, "primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2"));
  [v3 setObject:v46 forKeyedSubscript:@"primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2"];

  v47 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent primaryResidentElectionJoinMeshMS_HH2](self, "primaryResidentElectionJoinMeshMS_HH2"));
  [v3 setObject:v47 forKeyedSubscript:@"primaryResidentElectionJoinMeshMS_HH2"];

  v48 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HMDHomePodSetupLatencyLogEvent firstCoreDataContainerSetupDurationMS_HH2](self, "firstCoreDataContainerSetupDurationMS_HH2"));
  [v3 setObject:v48 forKeyedSubscript:@"firstCoreDataContainerSetupDurationMS_HH2"];

  v49 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHomePodSetupLatencyLogEvent firstCoreDataContainerSetupErrorCode_HH2](self, "firstCoreDataContainerSetupErrorCode_HH2"));
  [v3 setObject:v49 forKeyedSubscript:@"firstCoreDataContainerSetupErrorCode_HH2"];

  v50 = [(HMDHomePodSetupLatencyLogEvent *)self firstCoreDataContainerSetupErrorDomain_HH2];
  [v3 setObject:v50 forKeyedSubscript:@"firstCoreDataContainerSetupErrorDomain_HH2"];

  v51 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHomePodSetupLatencyLogEvent firstCoreDataContainerSetupUnderlyingErrorCode_HH2](self, "firstCoreDataContainerSetupUnderlyingErrorCode_HH2"));
  [v3 setObject:v51 forKeyedSubscript:@"firstCoreDataContainerSetupUnderlyingErrorCode_HH2"];

  v52 = [(HMDHomePodSetupLatencyLogEvent *)self firstCoreDataContainerSetupUnderlyingErrorDomain_HH2];
  [v3 setObject:v52 forKeyedSubscript:@"firstCoreDataContainerSetupUnderlyingErrorDomain_HH2"];

  v53 = (void *)[v3 copy];
  return (NSDictionary *)v53;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.homepod.current.accessory.setup.metric.event";
}

- (HMDHomePodSetupLatencyLogEvent)initWithSessionSetupOpenMS_HH1:(int64_t)a3 controllerKeyExchangeMS_HH1:(int64_t)a4 newAccessoryTransferMS_HH1:(int64_t)a5 sessionSetupCloseMS_HH1:(int64_t)a6 sentinelZoneFetchMS_HH1:(int64_t)a7 totalDurationMS_HH1:(int64_t)a8 accountSettleWaitMS_HH2:(int64_t)a9 currentDeviceIDSWaitMS_HH2:(int64_t)a10 homeManagerReadyMS_HH2:(int64_t)a11 firstCoreDataImportMS_HH2:(int64_t)a12 accessoryAddMS_HH2:(int64_t)a13 settingsCreationMS_HH2:(int64_t)a14 pairingIdentityCreationMS_HH2:(int64_t)a15 siriReadyMS_HH2:(int64_t)a16 eventRouterServerConnectionMS_HH2:(int64_t)a17 primaryResidentElectionMS_HH2:(int64_t)a18 eventRouterFirstEventPushMS_HH2:(int64_t)a19 totalDurationMS_HH2:(int64_t)a20 iCloudAvailable_INT:(BOOL)a21 IDSAvailable_INT:(BOOL)a22 manateeAvailable_INT:(BOOL)a23 networkAvailable_INT:(BOOL)a24 controllerInHH2_INT:(BOOL)a25 controllerHasSentinelZone_INT:(BOOL)a26 errorCode:(int64_t)a27 errorDomain:(id)a28 underlyingErrorCode:(int64_t)a29 underlyingErrorDomain:(id)a30 errorStage_String:(id)a31 setupSessionIdentifier:(id)a32 numberOfTimesPrimaryResidentChanged_HH2:(unsigned int)a33 lastPrimaryClientConnectedTime_HH2:(int64_t)a34 numberOfTimesPrimaryClientConnected_HH2:(unsigned int)a35 numberOfTimesPrimaryClientDisconnected_HH2:(unsigned int)a36 numberOfTimesPrimaryClientConnectMessageFailed_HH2:(unsigned int)a37 currentDeviceConfirmedPrimaryResident_INT:(BOOL)a38 lastPrimaryClientConnectMessageFailErrorCode_HH2:(int64_t)a39 lastPrimaryClientConnectMessageFailErrorDomain_HH2:(id)a40 lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2:(int64_t)a41 lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2:(id)a42 primaryResidentElectionPeerDeviceFutureResolvedMS_HH2:(int64_t)a43 primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:(int64_t)a44 primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:(int64_t)a45 primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:(int64_t)a46 primaryResidentElectionJoinMeshMS_HH2:(int64_t)a47 firstCoreDataContainerSetupDurationMS_HH2:(int64_t)a48 firstCoreDataContainerSetupErrorCode_HH2:(int64_t)a49 firstCoreDataContainerSetupErrorDomain_HH2:(id)a50 firstCoreDataContainerSetupUnderlyingErrorCode_HH2:(int64_t)a51 firstCoreDataContainerSetupUnderlyingErrorDomain_HH2:(id)a52 savedEventState:(unint64_t)a53
{
  v76[1] = *MEMORY[0x1E4F143B8];
  id v55 = a28;
  id v73 = a30;
  id v72 = a31;
  id v71 = a32;
  id v70 = a40;
  id v69 = a42;
  id v68 = a50;
  id v67 = a52;
  v74.receiver = self;
  v74.super_class = (Class)HMDHomePodSetupLatencyLogEvent;
  v56 = [(HMMLogEvent *)&v74 init];
  v57 = v56;
  if (v56)
  {
    v56->_sessionSetupOpenMS_HH1 = a3;
    v56->_controllerKeyExchangeMS_HH1 = a4;
    v56->_newAccessoryTransferMS_HH1 = a5;
    v56->_sessionSetupCloseMS_HH1 = a6;
    v56->_sentinelZoneFetchMS_HH1 = a7;
    v56->_totalDurationMS_HH1 = a8;
    v56->_accountSettleWaitMS_HH2 = a9;
    v56->_currentDeviceIDSWaitMS_HH2 = a10;
    v56->_homeManagerReadyMS_HH2 = a11;
    v56->_firstCoreDataImportMS_HH2 = a12;
    v56->_accessoryAddMS_HH2 = a13;
    v56->_settingsCreationMS_HH2 = a14;
    v56->_pairingIdentityCreationMS_HH2 = a15;
    v56->_siriReadyMS_HH2 = a16;
    v56->_eventRouterServerConnectionMS_HH2 = a17;
    v56->_primaryResidentElectionMS_HH2 = a18;
    v56->_eventRouterFirstEventPushMS_HH2 = a19;
    v56->_totalDurationMS_HH2 = a20;
    v56->_iCloudAvailable_INT = a21;
    v56->_IDSAvailable_INT = a22;
    v56->_manateeAvailable_INT = a23;
    v56->_networkAvailable_INT = a24;
    v56->_controllerInHH2_INT = a25;
    v56->_controllerHasSentinelZone_INT = a26;
    objc_storeStrong((id *)&v56->_errorStage_String, a31);
    objc_storeStrong((id *)&v57->_setupSessionIdentifier, a32);
    v57->_numberOfTimesPrimaryResidentChanged_HH2 = a33;
    v57->_lastPrimaryClientConnectedTime_HH2 = a34;
    v57->_numberOfTimesPrimaryClientConnected_HH2 = a35;
    v57->_numberOfTimesPrimaryClientDisconnected_HH2 = a36;
    v57->_numberOfTimesPrimaryClientConnectMessageFailed_HH2 = a37;
    v57->_currentDeviceConfirmedPrimaryResident_INT = a38;
    v57->_lastPrimaryClientConnectMessageFailErrorCode_HH2 = a39;
    objc_storeStrong((id *)&v57->_lastPrimaryClientConnectMessageFailErrorDomain_HH2, a40);
    v57->_lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2 = a41;
    objc_storeStrong((id *)&v57->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2, a42);
    v57->_primaryResidentElectionPeerDeviceFutureResolvedMS_HH2 = a43;
    v57->_primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2 = a44;
    v57->_primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2 = a45;
    v57->_primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2 = a46;
    v57->_primaryResidentElectionJoinMeshMS_HH2 = a47;
    v57->_firstCoreDataContainerSetupDurationMS_HH2 = a48;
    v57->_firstCoreDataContainerSetupErrorCode_HH2 = a49;
    objc_storeStrong((id *)&v57->_firstCoreDataContainerSetupErrorDomain_HH2, a50);
    v57->_firstCoreDataContainerSetupUnderlyingErrorCode_HH2 = a51;
    objc_storeStrong((id *)&v57->_firstCoreDataContainerSetupUnderlyingErrorDomain_HH2, a52);
    v57->_savedEventState = a53;
    if (v55)
    {
      if (v73)
      {
        v58 = [MEMORY[0x1E4F28C58] errorWithDomain:v73 code:a29 userInfo:0];
        uint64_t v75 = *MEMORY[0x1E4F28A50];
        v76[0] = v58;
        v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:&v75 count:1];
      }
      else
      {
        v59 = 0;
      }
      v60 = [MEMORY[0x1E4F28C58] errorWithDomain:v55 code:a27 userInfo:v59];
      [(HMMLogEvent *)v57 setError:v60];
    }
  }

  return v57;
}

- (id)initLogEventWithInitialState:(unint64_t)a3
{
  BYTE4(v6) = 0;
  LODWORD(v6) = 0;
  LODWORD(v5) = 0;
  WORD2(v4) = 0;
  LODWORD(v4) = 0;
  return -[HMDHomePodSetupLatencyLogEvent initWithSessionSetupOpenMS_HH1:controllerKeyExchangeMS_HH1:newAccessoryTransferMS_HH1:sessionSetupCloseMS_HH1:sentinelZoneFetchMS_HH1:totalDurationMS_HH1:accountSettleWaitMS_HH2:currentDeviceIDSWaitMS_HH2:homeManagerReadyMS_HH2:firstCoreDataImportMS_HH2:accessoryAddMS_HH2:settingsCreationMS_HH2:pairingIdentityCreationMS_HH2:siriReadyMS_HH2:eventRouterServerConnectionMS_HH2:primaryResidentElectionMS_HH2:eventRouterFirstEventPushMS_HH2:totalDurationMS_HH2:iCloudAvailable_INT:IDSAvailable_INT:manateeAvailable_INT:networkAvailable_INT:controllerInHH2_INT:controllerHasSentinelZone_INT:errorCode:errorDomain:underlyingErrorCode:underlyingErrorDomain:errorStage_String:setupSessionIdentifier:numberOfTimesPrimaryResidentChanged_HH2:lastPrimaryClientConnectedTime_HH2:numberOfTimesPrimaryClientConnected_HH2:numberOfTimesPrimaryClientDisconnected_HH2:numberOfTimesPrimaryClientConnectMessageFailed_HH2:currentDeviceConfirmedPrimaryResident_INT:lastPrimaryClientConnectMessageFailErrorCode_HH2:lastPrimaryClientConnectMessageFailErrorDomain_HH2:lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2:lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2:primaryResidentElectionPeerDeviceFutureResolvedMS_HH2:primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:primaryResidentElectionJoinMeshMS_HH2:firstCoreDataContainerSetupDurationMS_HH2:firstCoreDataContainerSetupErrorCode_HH2:firstCoreDataContainerSetupErrorDomain_HH2:firstCoreDataContainerSetupUnderlyingErrorCode_HH2:firstCoreDataContainerSetupUnderlyingErrorDomain_HH2:savedEventState:](self, "initWithSessionSetupOpenMS_HH1:controllerKeyExchangeMS_HH1:newAccessoryTransferMS_HH1:sessionSetupCloseMS_HH1:sentinelZoneFetchMS_HH1:totalDurationMS_HH1:accountSettleWaitMS_HH2:currentDeviceIDSWaitMS_HH2:homeManagerReadyMS_HH2:firstCoreDataImportMS_HH2:accessoryAddMS_HH2:settingsCreationMS_HH2:pairingIdentityCreationMS_HH2:siriReadyMS_HH2:eventRouterServerConnectionMS_HH2:primaryResidentElectionMS_HH2:eventRouterFirstEventPushMS_HH2:totalDurationMS_HH2:iCloudAvailable_INT:IDSAvailable_INT:manateeAvailable_INT:networkAvailable_INT:controllerInHH2_INT:controllerHasSentinelZone_INT:errorCode:errorDomain:underlyingErrorCode:underlyingErrorDomain:errorStage_String:setupSessionIdentifier:numberOfTimesPrimaryResidentChanged_HH2:lastPrimaryClientConnectedTime_HH2:numberOfTimesPrimaryClientConnected_HH2:numberOfTimesPrimaryClientDisconnected_HH2:numberOfTimesPrimaryClientConnectMessageFailed_HH2:currentDeviceConfirmedPrimaryResident_INT:lastPrimaryClientConnectMessageFailErrorCode_HH2:lastPrimaryClientConnectMessageFailErrorDomain_HH2:lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2:lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2:primaryResidentElectionPeerDeviceFutureResolvedMS_HH2:primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:primaryResidentElectionJoinMeshMS_HH2:firstCoreDataContainerSetupDurationMS_HH2:firstCoreDataContainerSetupErrorCode_HH2:firstCoreDataContainerSetupErrorDomain_HH2:firstCoreDataContainerSetupUnderlyingErrorCode_HH2:firstCoreDataContainerSetupUnderlyingErrorDomain_HH2:savedEventState:", 0, 0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           v4,
           0,
           *MEMORY[0x1E4F2D140],
           0,
           *MEMORY[0x1E4F2D140],
           &stru_1F2C9F1A8,
           &stru_1F2C9F1A8,
           v5,
           0,
           0,
           v6,
           0,
           *MEMORY[0x1E4F2D140],
           0,
           *MEMORY[0x1E4F2D140],
           0,
           0,
           0,
           0,
           0,
           0,
           0,
           *MEMORY[0x1E4F2D140],
           0,
           *MEMORY[0x1E4F2D140],
           a3);
}

@end