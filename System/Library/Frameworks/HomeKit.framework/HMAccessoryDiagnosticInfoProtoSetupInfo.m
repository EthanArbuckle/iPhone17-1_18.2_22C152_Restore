@interface HMAccessoryDiagnosticInfoProtoSetupInfo
- (BOOL)hasAccessoryAddMSHH2;
- (BOOL)hasAccountSettleWaitMSHH2;
- (BOOL)hasControllerKeyExchangeMSHH1;
- (BOOL)hasControllerSetupSessionIdentifier;
- (BOOL)hasCurrentDeviceConfirmedPrimaryResidentINT;
- (BOOL)hasCurrentDeviceIDSWaitMSHH2;
- (BOOL)hasEventRouterFirstEventPushMSHH2;
- (BOOL)hasEventRouterServerConnectionMSHH2;
- (BOOL)hasFirstCoreDataContainerSetupDurationMSHH2;
- (BOOL)hasFirstCoreDataContainerSetupErrorCodeHH2;
- (BOOL)hasFirstCoreDataContainerSetupErrorDomainHH2;
- (BOOL)hasFirstCoreDataContainerSetupUnderlyingErrorCodeHH2;
- (BOOL)hasFirstCoreDataContainerSetupUnderlyingErrorDomainHH2;
- (BOOL)hasFirstCoreDataImportMSHH2;
- (BOOL)hasHomeManagerReadyMSHH2;
- (BOOL)hasICloudAvailableINT;
- (BOOL)hasIDSAvailableINT;
- (BOOL)hasLastKnownControllerHH2Mode;
- (BOOL)hasLastKnownControllerSentinelZoneExistence;
- (BOOL)hasLastKnownStageErrorCode;
- (BOOL)hasLastKnownStageErrorDomain;
- (BOOL)hasLastKnownStageErrorString;
- (BOOL)hasLastKnownStageUnderlyingErrorCode;
- (BOOL)hasLastKnownStageUnderlyingErrorDomain;
- (BOOL)hasLastPrimaryClientConnectMessageFailErrorCodeHH2;
- (BOOL)hasLastPrimaryClientConnectMessageFailErrorDomainHH2;
- (BOOL)hasLastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2;
- (BOOL)hasLastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2;
- (BOOL)hasLastPrimaryClientConnectedTimeHH2;
- (BOOL)hasManateeAvailableINT;
- (BOOL)hasNetworkAvailableINT;
- (BOOL)hasNewAccessoryTransferMSHH1;
- (BOOL)hasNumberOfTimesPrimaryClientConnectMessageFailedHH2;
- (BOOL)hasNumberOfTimesPrimaryClientConnectedHH2;
- (BOOL)hasNumberOfTimesPrimaryClientDisconnectedHH2;
- (BOOL)hasNumberOfTimesPrimaryResidentChangedHH2;
- (BOOL)hasPairingIdentityCreationMSHH2;
- (BOOL)hasPrimaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2;
- (BOOL)hasPrimaryResidentElectionJoinMeshMSHH2;
- (BOOL)hasPrimaryResidentElectionMSHH2;
- (BOOL)hasPrimaryResidentElectionModernTransportStartedFutureResolvedMSHH2;
- (BOOL)hasPrimaryResidentElectionPeerDeviceFutureResolvedMSHH2;
- (BOOL)hasPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2;
- (BOOL)hasSavedEventState;
- (BOOL)hasSentinelZoneFetchMSHH1;
- (BOOL)hasSessionSetupCloseMSHH1;
- (BOOL)hasSessionSetupOpenMSHH1;
- (BOOL)hasSettingsCreationMSHH2;
- (BOOL)hasSiriReadyMSHH2;
- (BOOL)hasTotalDurationMSHH1;
- (BOOL)hasTotalDurationMSHH2;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)controllerSetupSessionIdentifier;
- (NSString)firstCoreDataContainerSetupErrorDomainHH2;
- (NSString)firstCoreDataContainerSetupUnderlyingErrorDomainHH2;
- (NSString)lastKnownStageErrorDomain;
- (NSString)lastKnownStageErrorString;
- (NSString)lastKnownStageUnderlyingErrorDomain;
- (NSString)lastPrimaryClientConnectMessageFailErrorDomainHH2;
- (NSString)lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)iCloudAvailableINTAsString:(int)a3;
- (id)iDSAvailableINTAsString:(int)a3;
- (id)lastKnownControllerHH2ModeAsString:(int)a3;
- (id)lastKnownControllerSentinelZoneExistenceAsString:(int)a3;
- (id)manateeAvailableINTAsString:(int)a3;
- (id)networkAvailableINTAsString:(int)a3;
- (int)StringAsICloudAvailableINT:(id)a3;
- (int)StringAsIDSAvailableINT:(id)a3;
- (int)StringAsLastKnownControllerHH2Mode:(id)a3;
- (int)StringAsLastKnownControllerSentinelZoneExistence:(id)a3;
- (int)StringAsManateeAvailableINT:(id)a3;
- (int)StringAsNetworkAvailableINT:(id)a3;
- (int)iCloudAvailableINT;
- (int)iDSAvailableINT;
- (int)lastKnownControllerHH2Mode;
- (int)lastKnownControllerSentinelZoneExistence;
- (int)manateeAvailableINT;
- (int)networkAvailableINT;
- (int64_t)accessoryAddMSHH2;
- (int64_t)accountSettleWaitMSHH2;
- (int64_t)controllerKeyExchangeMSHH1;
- (int64_t)currentDeviceIDSWaitMSHH2;
- (int64_t)eventRouterFirstEventPushMSHH2;
- (int64_t)eventRouterServerConnectionMSHH2;
- (int64_t)firstCoreDataContainerSetupDurationMSHH2;
- (int64_t)firstCoreDataContainerSetupErrorCodeHH2;
- (int64_t)firstCoreDataContainerSetupUnderlyingErrorCodeHH2;
- (int64_t)firstCoreDataImportMSHH2;
- (int64_t)homeManagerReadyMSHH2;
- (int64_t)lastKnownStageErrorCode;
- (int64_t)lastKnownStageUnderlyingErrorCode;
- (int64_t)lastPrimaryClientConnectMessageFailErrorCodeHH2;
- (int64_t)lastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2;
- (int64_t)lastPrimaryClientConnectedTimeHH2;
- (int64_t)newAccessoryTransferMSHH1;
- (int64_t)pairingIdentityCreationMSHH2;
- (int64_t)primaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2;
- (int64_t)primaryResidentElectionJoinMeshMSHH2;
- (int64_t)primaryResidentElectionMSHH2;
- (int64_t)primaryResidentElectionModernTransportStartedFutureResolvedMSHH2;
- (int64_t)primaryResidentElectionPeerDeviceFutureResolvedMSHH2;
- (int64_t)primaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2;
- (int64_t)sentinelZoneFetchMSHH1;
- (int64_t)sessionSetupCloseMSHH1;
- (int64_t)sessionSetupOpenMSHH1;
- (int64_t)settingsCreationMSHH2;
- (int64_t)siriReadyMSHH2;
- (int64_t)totalDurationMSHH1;
- (int64_t)totalDurationMSHH2;
- (unint64_t)hash;
- (unint64_t)savedEventState;
- (unint64_t)version;
- (unsigned)currentDeviceConfirmedPrimaryResidentINT;
- (unsigned)numberOfTimesPrimaryClientConnectMessageFailedHH2;
- (unsigned)numberOfTimesPrimaryClientConnectedHH2;
- (unsigned)numberOfTimesPrimaryClientDisconnectedHH2;
- (unsigned)numberOfTimesPrimaryResidentChangedHH2;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccessoryAddMSHH2:(int64_t)a3;
- (void)setAccountSettleWaitMSHH2:(int64_t)a3;
- (void)setControllerKeyExchangeMSHH1:(int64_t)a3;
- (void)setControllerSetupSessionIdentifier:(id)a3;
- (void)setCurrentDeviceConfirmedPrimaryResidentINT:(unsigned int)a3;
- (void)setCurrentDeviceIDSWaitMSHH2:(int64_t)a3;
- (void)setEventRouterFirstEventPushMSHH2:(int64_t)a3;
- (void)setEventRouterServerConnectionMSHH2:(int64_t)a3;
- (void)setFirstCoreDataContainerSetupDurationMSHH2:(int64_t)a3;
- (void)setFirstCoreDataContainerSetupErrorCodeHH2:(int64_t)a3;
- (void)setFirstCoreDataContainerSetupErrorDomainHH2:(id)a3;
- (void)setFirstCoreDataContainerSetupUnderlyingErrorCodeHH2:(int64_t)a3;
- (void)setFirstCoreDataContainerSetupUnderlyingErrorDomainHH2:(id)a3;
- (void)setFirstCoreDataImportMSHH2:(int64_t)a3;
- (void)setHasAccessoryAddMSHH2:(BOOL)a3;
- (void)setHasAccountSettleWaitMSHH2:(BOOL)a3;
- (void)setHasControllerKeyExchangeMSHH1:(BOOL)a3;
- (void)setHasCurrentDeviceConfirmedPrimaryResidentINT:(BOOL)a3;
- (void)setHasCurrentDeviceIDSWaitMSHH2:(BOOL)a3;
- (void)setHasEventRouterFirstEventPushMSHH2:(BOOL)a3;
- (void)setHasEventRouterServerConnectionMSHH2:(BOOL)a3;
- (void)setHasFirstCoreDataContainerSetupDurationMSHH2:(BOOL)a3;
- (void)setHasFirstCoreDataContainerSetupErrorCodeHH2:(BOOL)a3;
- (void)setHasFirstCoreDataContainerSetupUnderlyingErrorCodeHH2:(BOOL)a3;
- (void)setHasFirstCoreDataImportMSHH2:(BOOL)a3;
- (void)setHasHomeManagerReadyMSHH2:(BOOL)a3;
- (void)setHasICloudAvailableINT:(BOOL)a3;
- (void)setHasIDSAvailableINT:(BOOL)a3;
- (void)setHasLastKnownControllerHH2Mode:(BOOL)a3;
- (void)setHasLastKnownControllerSentinelZoneExistence:(BOOL)a3;
- (void)setHasLastKnownStageErrorCode:(BOOL)a3;
- (void)setHasLastKnownStageUnderlyingErrorCode:(BOOL)a3;
- (void)setHasLastPrimaryClientConnectMessageFailErrorCodeHH2:(BOOL)a3;
- (void)setHasLastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2:(BOOL)a3;
- (void)setHasLastPrimaryClientConnectedTimeHH2:(BOOL)a3;
- (void)setHasManateeAvailableINT:(BOOL)a3;
- (void)setHasNetworkAvailableINT:(BOOL)a3;
- (void)setHasNewAccessoryTransferMSHH1:(BOOL)a3;
- (void)setHasNumberOfTimesPrimaryClientConnectMessageFailedHH2:(BOOL)a3;
- (void)setHasNumberOfTimesPrimaryClientConnectedHH2:(BOOL)a3;
- (void)setHasNumberOfTimesPrimaryClientDisconnectedHH2:(BOOL)a3;
- (void)setHasNumberOfTimesPrimaryResidentChangedHH2:(BOOL)a3;
- (void)setHasPairingIdentityCreationMSHH2:(BOOL)a3;
- (void)setHasPrimaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2:(BOOL)a3;
- (void)setHasPrimaryResidentElectionJoinMeshMSHH2:(BOOL)a3;
- (void)setHasPrimaryResidentElectionMSHH2:(BOOL)a3;
- (void)setHasPrimaryResidentElectionModernTransportStartedFutureResolvedMSHH2:(BOOL)a3;
- (void)setHasPrimaryResidentElectionPeerDeviceFutureResolvedMSHH2:(BOOL)a3;
- (void)setHasPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2:(BOOL)a3;
- (void)setHasSavedEventState:(BOOL)a3;
- (void)setHasSentinelZoneFetchMSHH1:(BOOL)a3;
- (void)setHasSessionSetupCloseMSHH1:(BOOL)a3;
- (void)setHasSessionSetupOpenMSHH1:(BOOL)a3;
- (void)setHasSettingsCreationMSHH2:(BOOL)a3;
- (void)setHasSiriReadyMSHH2:(BOOL)a3;
- (void)setHasTotalDurationMSHH1:(BOOL)a3;
- (void)setHasTotalDurationMSHH2:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setHomeManagerReadyMSHH2:(int64_t)a3;
- (void)setICloudAvailableINT:(int)a3;
- (void)setIDSAvailableINT:(int)a3;
- (void)setLastKnownControllerHH2Mode:(int)a3;
- (void)setLastKnownControllerSentinelZoneExistence:(int)a3;
- (void)setLastKnownStageErrorCode:(int64_t)a3;
- (void)setLastKnownStageErrorDomain:(id)a3;
- (void)setLastKnownStageErrorString:(id)a3;
- (void)setLastKnownStageUnderlyingErrorCode:(int64_t)a3;
- (void)setLastKnownStageUnderlyingErrorDomain:(id)a3;
- (void)setLastPrimaryClientConnectMessageFailErrorCodeHH2:(int64_t)a3;
- (void)setLastPrimaryClientConnectMessageFailErrorDomainHH2:(id)a3;
- (void)setLastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2:(int64_t)a3;
- (void)setLastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2:(id)a3;
- (void)setLastPrimaryClientConnectedTimeHH2:(int64_t)a3;
- (void)setManateeAvailableINT:(int)a3;
- (void)setNetworkAvailableINT:(int)a3;
- (void)setNewAccessoryTransferMSHH1:(int64_t)a3;
- (void)setNumberOfTimesPrimaryClientConnectMessageFailedHH2:(unsigned int)a3;
- (void)setNumberOfTimesPrimaryClientConnectedHH2:(unsigned int)a3;
- (void)setNumberOfTimesPrimaryClientDisconnectedHH2:(unsigned int)a3;
- (void)setNumberOfTimesPrimaryResidentChangedHH2:(unsigned int)a3;
- (void)setPairingIdentityCreationMSHH2:(int64_t)a3;
- (void)setPrimaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2:(int64_t)a3;
- (void)setPrimaryResidentElectionJoinMeshMSHH2:(int64_t)a3;
- (void)setPrimaryResidentElectionMSHH2:(int64_t)a3;
- (void)setPrimaryResidentElectionModernTransportStartedFutureResolvedMSHH2:(int64_t)a3;
- (void)setPrimaryResidentElectionPeerDeviceFutureResolvedMSHH2:(int64_t)a3;
- (void)setPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2:(int64_t)a3;
- (void)setSavedEventState:(unint64_t)a3;
- (void)setSentinelZoneFetchMSHH1:(int64_t)a3;
- (void)setSessionSetupCloseMSHH1:(int64_t)a3;
- (void)setSessionSetupOpenMSHH1:(int64_t)a3;
- (void)setSettingsCreationMSHH2:(int64_t)a3;
- (void)setSiriReadyMSHH2:(int64_t)a3;
- (void)setTotalDurationMSHH1:(int64_t)a3;
- (void)setTotalDurationMSHH2:(int64_t)a3;
- (void)setVersion:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMAccessoryDiagnosticInfoProtoSetupInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2, 0);
  objc_storeStrong((id *)&self->_lastPrimaryClientConnectMessageFailErrorDomainHH2, 0);
  objc_storeStrong((id *)&self->_lastKnownStageUnderlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_lastKnownStageErrorString, 0);
  objc_storeStrong((id *)&self->_lastKnownStageErrorDomain, 0);
  objc_storeStrong((id *)&self->_firstCoreDataContainerSetupUnderlyingErrorDomainHH2, 0);
  objc_storeStrong((id *)&self->_firstCoreDataContainerSetupErrorDomainHH2, 0);

  objc_storeStrong((id *)&self->_controllerSetupSessionIdentifier, 0);
}

- (void)setFirstCoreDataContainerSetupUnderlyingErrorDomainHH2:(id)a3
{
}

- (NSString)firstCoreDataContainerSetupUnderlyingErrorDomainHH2
{
  return self->_firstCoreDataContainerSetupUnderlyingErrorDomainHH2;
}

- (int64_t)firstCoreDataContainerSetupUnderlyingErrorCodeHH2
{
  return self->_firstCoreDataContainerSetupUnderlyingErrorCodeHH2;
}

- (void)setFirstCoreDataContainerSetupErrorDomainHH2:(id)a3
{
}

- (NSString)firstCoreDataContainerSetupErrorDomainHH2
{
  return self->_firstCoreDataContainerSetupErrorDomainHH2;
}

- (int64_t)firstCoreDataContainerSetupErrorCodeHH2
{
  return self->_firstCoreDataContainerSetupErrorCodeHH2;
}

- (int64_t)firstCoreDataContainerSetupDurationMSHH2
{
  return self->_firstCoreDataContainerSetupDurationMSHH2;
}

- (int64_t)primaryResidentElectionJoinMeshMSHH2
{
  return self->_primaryResidentElectionJoinMeshMSHH2;
}

- (int64_t)primaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2
{
  return self->_primaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2;
}

- (int64_t)primaryResidentElectionModernTransportStartedFutureResolvedMSHH2
{
  return self->_primaryResidentElectionModernTransportStartedFutureResolvedMSHH2;
}

- (int64_t)primaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2
{
  return self->_primaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2;
}

- (int64_t)primaryResidentElectionPeerDeviceFutureResolvedMSHH2
{
  return self->_primaryResidentElectionPeerDeviceFutureResolvedMSHH2;
}

- (void)setLastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2:(id)a3
{
}

- (NSString)lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2
{
  return self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2;
}

- (int64_t)lastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2
{
  return self->_lastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2;
}

- (void)setLastPrimaryClientConnectMessageFailErrorDomainHH2:(id)a3
{
}

- (NSString)lastPrimaryClientConnectMessageFailErrorDomainHH2
{
  return self->_lastPrimaryClientConnectMessageFailErrorDomainHH2;
}

- (int64_t)lastPrimaryClientConnectMessageFailErrorCodeHH2
{
  return self->_lastPrimaryClientConnectMessageFailErrorCodeHH2;
}

- (unsigned)currentDeviceConfirmedPrimaryResidentINT
{
  return self->_currentDeviceConfirmedPrimaryResidentINT;
}

- (unsigned)numberOfTimesPrimaryClientConnectMessageFailedHH2
{
  return self->_numberOfTimesPrimaryClientConnectMessageFailedHH2;
}

- (unsigned)numberOfTimesPrimaryClientDisconnectedHH2
{
  return self->_numberOfTimesPrimaryClientDisconnectedHH2;
}

- (unsigned)numberOfTimesPrimaryClientConnectedHH2
{
  return self->_numberOfTimesPrimaryClientConnectedHH2;
}

- (int64_t)lastPrimaryClientConnectedTimeHH2
{
  return self->_lastPrimaryClientConnectedTimeHH2;
}

- (unsigned)numberOfTimesPrimaryResidentChangedHH2
{
  return self->_numberOfTimesPrimaryResidentChangedHH2;
}

- (void)setControllerSetupSessionIdentifier:(id)a3
{
}

- (NSString)controllerSetupSessionIdentifier
{
  return self->_controllerSetupSessionIdentifier;
}

- (unint64_t)savedEventState
{
  return self->_savedEventState;
}

- (void)setLastKnownStageUnderlyingErrorDomain:(id)a3
{
}

- (NSString)lastKnownStageUnderlyingErrorDomain
{
  return self->_lastKnownStageUnderlyingErrorDomain;
}

- (int64_t)lastKnownStageUnderlyingErrorCode
{
  return self->_lastKnownStageUnderlyingErrorCode;
}

- (void)setLastKnownStageErrorString:(id)a3
{
}

- (NSString)lastKnownStageErrorString
{
  return self->_lastKnownStageErrorString;
}

- (void)setLastKnownStageErrorDomain:(id)a3
{
}

- (NSString)lastKnownStageErrorDomain
{
  return self->_lastKnownStageErrorDomain;
}

- (int64_t)lastKnownStageErrorCode
{
  return self->_lastKnownStageErrorCode;
}

- (int64_t)totalDurationMSHH2
{
  return self->_totalDurationMSHH2;
}

- (int64_t)eventRouterFirstEventPushMSHH2
{
  return self->_eventRouterFirstEventPushMSHH2;
}

- (int64_t)primaryResidentElectionMSHH2
{
  return self->_primaryResidentElectionMSHH2;
}

- (int64_t)eventRouterServerConnectionMSHH2
{
  return self->_eventRouterServerConnectionMSHH2;
}

- (int64_t)siriReadyMSHH2
{
  return self->_siriReadyMSHH2;
}

- (int64_t)pairingIdentityCreationMSHH2
{
  return self->_pairingIdentityCreationMSHH2;
}

- (int64_t)settingsCreationMSHH2
{
  return self->_settingsCreationMSHH2;
}

- (int64_t)accessoryAddMSHH2
{
  return self->_accessoryAddMSHH2;
}

- (int64_t)firstCoreDataImportMSHH2
{
  return self->_firstCoreDataImportMSHH2;
}

- (int64_t)homeManagerReadyMSHH2
{
  return self->_homeManagerReadyMSHH2;
}

- (int64_t)currentDeviceIDSWaitMSHH2
{
  return self->_currentDeviceIDSWaitMSHH2;
}

- (int64_t)accountSettleWaitMSHH2
{
  return self->_accountSettleWaitMSHH2;
}

- (int64_t)totalDurationMSHH1
{
  return self->_totalDurationMSHH1;
}

- (int64_t)sentinelZoneFetchMSHH1
{
  return self->_sentinelZoneFetchMSHH1;
}

- (int64_t)sessionSetupCloseMSHH1
{
  return self->_sessionSetupCloseMSHH1;
}

- (int64_t)newAccessoryTransferMSHH1
{
  return self->_newAccessoryTransferMSHH1;
}

- (int64_t)controllerKeyExchangeMSHH1
{
  return self->_controllerKeyExchangeMSHH1;
}

- (int64_t)sessionSetupOpenMSHH1
{
  return self->_sessionSetupOpenMSHH1;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *((void *)v4 + 48);
  if ((v5 & 0x100000000) != 0)
  {
    self->_version = *((void *)v4 + 33);
    *(void *)&self->_has |= 0x100000000uLL;
    uint64_t v5 = *((void *)v4 + 48);
    if ((v5 & 0x8000000) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_73;
    }
  }
  else if ((v5 & 0x8000000) == 0)
  {
    goto LABEL_3;
  }
  self->_sessionSetupOpenMSHH1 = *((void *)v4 + 28);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v5 = *((void *)v4 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_controllerKeyExchangeMSHH1 = *((void *)v4 + 3);
  *(void *)&self->_has |= 4uLL;
  uint64_t v5 = *((void *)v4 + 48);
  if ((v5 & 0x10000) == 0)
  {
LABEL_5:
    if ((v5 & 0x4000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_newAccessoryTransferMSHH1 = *((void *)v4 + 17);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v5 = *((void *)v4 + 48);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_sessionSetupCloseMSHH1 = *((void *)v4 + 27);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v5 = *((void *)v4 + 48);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x40000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_sentinelZoneFetchMSHH1 = *((void *)v4 + 26);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v5 = *((void *)v4 + 48);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_totalDurationMSHH1 = *((void *)v4 + 31);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v5 = *((void *)v4 + 48);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_accountSettleWaitMSHH2 = *((void *)v4 + 2);
  *(void *)&self->_has |= 2uLL;
  uint64_t v5 = *((void *)v4 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_currentDeviceIDSWaitMSHH2 = *((void *)v4 + 4);
  *(void *)&self->_has |= 8uLL;
  uint64_t v5 = *((void *)v4 + 48);
  if ((v5 & 0x400) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_homeManagerReadyMSHH2 = *((void *)v4 + 11);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v5 = *((void *)v4 + 48);
  if ((v5 & 0x200) == 0)
  {
LABEL_12:
    if ((v5 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_firstCoreDataImportMSHH2 = *((void *)v4 + 10);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v5 = *((void *)v4 + 48);
  if ((v5 & 1) == 0)
  {
LABEL_13:
    if ((v5 & 0x10000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_accessoryAddMSHH2 = *((void *)v4 + 1);
  *(void *)&self->_has |= 1uLL;
  uint64_t v5 = *((void *)v4 + 48);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_14:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_84;
  }
LABEL_83:
  self->_settingsCreationMSHH2 = *((void *)v4 + 29);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v5 = *((void *)v4 + 48);
  if ((v5 & 0x20000) == 0)
  {
LABEL_15:
    if ((v5 & 0x20000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_pairingIdentityCreationMSHH2 = *((void *)v4 + 18);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v5 = *((void *)v4 + 48);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_16:
    if ((v5 & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_86;
  }
LABEL_85:
  self->_siriReadyMSHH2 = *((void *)v4 + 30);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v5 = *((void *)v4 + 48);
  if ((v5 & 0x20) == 0)
  {
LABEL_17:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_87;
  }
LABEL_86:
  self->_eventRouterServerConnectionMSHH2 = *((void *)v4 + 6);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v5 = *((void *)v4 + 48);
  if ((v5 & 0x100000) == 0)
  {
LABEL_18:
    if ((v5 & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_88;
  }
LABEL_87:
  self->_primaryResidentElectionMSHH2 = *((void *)v4 + 21);
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v5 = *((void *)v4 + 48);
  if ((v5 & 0x10) == 0)
  {
LABEL_19:
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_89;
  }
LABEL_88:
  self->_eventRouterFirstEventPushMSHH2 = *((void *)v4 + 5);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v5 = *((void *)v4 + 48);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_20:
    if ((v5 & 0x400000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_90;
  }
LABEL_89:
  self->_totalDurationMSHH2 = *((void *)v4 + 32);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v5 = *((void *)v4 + 48);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_21:
    if ((v5 & 0x800000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_91;
  }
LABEL_90:
  self->_iCloudAvailableINT = *((_DWORD *)v4 + 76);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v5 = *((void *)v4 + 48);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_22:
    if ((v5 & 0x4000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_92;
  }
LABEL_91:
  self->_iDSAvailableINT = *((_DWORD *)v4 + 77);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v5 = *((void *)v4 + 48);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_23:
    if ((v5 & 0x8000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_93;
  }
LABEL_92:
  self->_manateeAvailableINT = *((_DWORD *)v4 + 90);
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v5 = *((void *)v4 + 48);
  if ((v5 & 0x8000000000) == 0)
  {
LABEL_24:
    if ((v5 & 0x800) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_93:
  self->_networkAvailableINT = *((_DWORD *)v4 + 91);
  *(void *)&self->_has |= 0x8000000000uLL;
  if ((*((void *)v4 + 48) & 0x800) != 0)
  {
LABEL_25:
    self->_lastKnownStageErrorCode = *((void *)v4 + 12);
    *(void *)&self->_has |= 0x800uLL;
  }
LABEL_26:
  id v9 = v4;
  if (*((void *)v4 + 40))
  {
    -[HMAccessoryDiagnosticInfoProtoSetupInfo setLastKnownStageErrorDomain:](self, "setLastKnownStageErrorDomain:");
    id v4 = v9;
  }
  if (*((void *)v4 + 41))
  {
    -[HMAccessoryDiagnosticInfoProtoSetupInfo setLastKnownStageErrorString:](self, "setLastKnownStageErrorString:");
    id v4 = v9;
  }
  if ((*((unsigned char *)v4 + 385) & 0x10) != 0)
  {
    self->_lastKnownStageUnderlyingErrorCode = *((void *)v4 + 13);
    *(void *)&self->_has |= 0x1000uLL;
  }
  if (*((void *)v4 + 42))
  {
    -[HMAccessoryDiagnosticInfoProtoSetupInfo setLastKnownStageUnderlyingErrorDomain:](self, "setLastKnownStageUnderlyingErrorDomain:");
    id v4 = v9;
  }
  uint64_t v6 = *((void *)v4 + 48);
  if ((v6 & 0x1000000) != 0)
  {
    self->_savedEventState = *((void *)v4 + 25);
    *(void *)&self->_has |= 0x1000000uLL;
    uint64_t v6 = *((void *)v4 + 48);
    if ((v6 & 0x1000000000) == 0)
    {
LABEL_36:
      if ((v6 & 0x2000000000) == 0) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
  }
  else if ((v6 & 0x1000000000) == 0)
  {
    goto LABEL_36;
  }
  self->_lastKnownControllerHH2Mode = *((_DWORD *)v4 + 78);
  *(void *)&self->_has |= 0x1000000000uLL;
  if ((*((void *)v4 + 48) & 0x2000000000) != 0)
  {
LABEL_37:
    self->_lastKnownControllerSentinelZoneExistence = *((_DWORD *)v4 + 79);
    *(void *)&self->_has |= 0x2000000000uLL;
  }
LABEL_38:
  if (*((void *)v4 + 34))
  {
    -[HMAccessoryDiagnosticInfoProtoSetupInfo setControllerSetupSessionIdentifier:](self, "setControllerSetupSessionIdentifier:");
    id v4 = v9;
  }
  uint64_t v7 = *((void *)v4 + 48);
  if ((v7 & 0x80000000000) != 0)
  {
    self->_numberOfTimesPrimaryResidentChangedHH2 = *((_DWORD *)v4 + 95);
    *(void *)&self->_has |= 0x80000000000uLL;
    uint64_t v7 = *((void *)v4 + 48);
    if ((v7 & 0x8000) == 0)
    {
LABEL_42:
      if ((v7 & 0x20000000000) == 0) {
        goto LABEL_43;
      }
      goto LABEL_100;
    }
  }
  else if ((v7 & 0x8000) == 0)
  {
    goto LABEL_42;
  }
  self->_lastPrimaryClientConnectedTimeHH2 = *((void *)v4 + 16);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v7 = *((void *)v4 + 48);
  if ((v7 & 0x20000000000) == 0)
  {
LABEL_43:
    if ((v7 & 0x40000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_101;
  }
LABEL_100:
  self->_numberOfTimesPrimaryClientConnectedHH2 = *((_DWORD *)v4 + 93);
  *(void *)&self->_has |= 0x20000000000uLL;
  uint64_t v7 = *((void *)v4 + 48);
  if ((v7 & 0x40000000000) == 0)
  {
LABEL_44:
    if ((v7 & 0x10000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_102;
  }
LABEL_101:
  self->_numberOfTimesPrimaryClientDisconnectedHH2 = *((_DWORD *)v4 + 94);
  *(void *)&self->_has |= 0x40000000000uLL;
  uint64_t v7 = *((void *)v4 + 48);
  if ((v7 & 0x10000000000) == 0)
  {
LABEL_45:
    if ((v7 & 0x200000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_103;
  }
LABEL_102:
  self->_numberOfTimesPrimaryClientConnectMessageFailedHH2 = *((_DWORD *)v4 + 92);
  *(void *)&self->_has |= 0x10000000000uLL;
  uint64_t v7 = *((void *)v4 + 48);
  if ((v7 & 0x200000000) == 0)
  {
LABEL_46:
    if ((v7 & 0x2000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
LABEL_103:
  self->_currentDeviceConfirmedPrimaryResidentINT = *((_DWORD *)v4 + 70);
  *(void *)&self->_has |= 0x200000000uLL;
  if ((*((void *)v4 + 48) & 0x2000) != 0)
  {
LABEL_47:
    self->_lastPrimaryClientConnectMessageFailErrorCodeHH2 = *((void *)v4 + 14);
    *(void *)&self->_has |= 0x2000uLL;
  }
LABEL_48:
  if (*((void *)v4 + 43))
  {
    -[HMAccessoryDiagnosticInfoProtoSetupInfo setLastPrimaryClientConnectMessageFailErrorDomainHH2:](self, "setLastPrimaryClientConnectMessageFailErrorDomainHH2:");
    id v4 = v9;
  }
  if ((*((unsigned char *)v4 + 385) & 0x40) != 0)
  {
    self->_lastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2 = *((void *)v4 + 15);
    *(void *)&self->_has |= 0x4000uLL;
  }
  if (*((void *)v4 + 44))
  {
    -[HMAccessoryDiagnosticInfoProtoSetupInfo setLastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2:](self, "setLastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2:");
    id v4 = v9;
  }
  uint64_t v8 = *((void *)v4 + 48);
  if ((v8 & 0x800000) != 0)
  {
    self->_primaryResidentElectionPeerDeviceFutureResolvedMSHH2 = *((void *)v4 + 24);
    *(void *)&self->_has |= 0x800000uLL;
    uint64_t v8 = *((void *)v4 + 48);
    if ((v8 & 0x40000) == 0)
    {
LABEL_56:
      if ((v8 & 0x200000) == 0) {
        goto LABEL_57;
      }
      goto LABEL_107;
    }
  }
  else if ((v8 & 0x40000) == 0)
  {
    goto LABEL_56;
  }
  self->_primaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2 = *((void *)v4 + 19);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v8 = *((void *)v4 + 48);
  if ((v8 & 0x200000) == 0)
  {
LABEL_57:
    if ((v8 & 0x400000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_108;
  }
LABEL_107:
  self->_primaryResidentElectionModernTransportStartedFutureResolvedMSHH2 = *((void *)v4 + 22);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v8 = *((void *)v4 + 48);
  if ((v8 & 0x400000) == 0)
  {
LABEL_58:
    if ((v8 & 0x80000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_109;
  }
LABEL_108:
  self->_primaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2 = *((void *)v4 + 23);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v8 = *((void *)v4 + 48);
  if ((v8 & 0x80000) == 0)
  {
LABEL_59:
    if ((v8 & 0x40) == 0) {
      goto LABEL_60;
    }
    goto LABEL_110;
  }
LABEL_109:
  self->_primaryResidentElectionJoinMeshMSHH2 = *((void *)v4 + 20);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v8 = *((void *)v4 + 48);
  if ((v8 & 0x40) == 0)
  {
LABEL_60:
    if ((v8 & 0x80) == 0) {
      goto LABEL_62;
    }
    goto LABEL_61;
  }
LABEL_110:
  self->_firstCoreDataContainerSetupDurationMSHH2 = *((void *)v4 + 7);
  *(void *)&self->_has |= 0x40uLL;
  if ((*((void *)v4 + 48) & 0x80) != 0)
  {
LABEL_61:
    self->_firstCoreDataContainerSetupErrorCodeHH2 = *((void *)v4 + 8);
    *(void *)&self->_has |= 0x80uLL;
  }
LABEL_62:
  if (*((void *)v4 + 36))
  {
    -[HMAccessoryDiagnosticInfoProtoSetupInfo setFirstCoreDataContainerSetupErrorDomainHH2:](self, "setFirstCoreDataContainerSetupErrorDomainHH2:");
    id v4 = v9;
  }
  if (*((unsigned char *)v4 + 385))
  {
    self->_firstCoreDataContainerSetupUnderlyingErrorCodeHH2 = *((void *)v4 + 9);
    *(void *)&self->_has |= 0x100uLL;
  }
  if (*((void *)v4 + 37))
  {
    -[HMAccessoryDiagnosticInfoProtoSetupInfo setFirstCoreDataContainerSetupUnderlyingErrorDomainHH2:](self, "setFirstCoreDataContainerSetupUnderlyingErrorDomainHH2:");
    id v4 = v9;
  }
}

- (unint64_t)hash
{
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(void *)&has & 0x100000000) != 0)
  {
    unint64_t v58 = 2654435761u * self->_version;
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
LABEL_3:
      uint64_t v57 = 2654435761 * self->_sessionSetupOpenMSHH1;
      if ((*(unsigned char *)&has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else
  {
    unint64_t v58 = 0;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v57 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_4:
    uint64_t v56 = 2654435761 * self->_controllerKeyExchangeMSHH1;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v56 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_5:
    uint64_t v55 = 2654435761 * self->_newAccessoryTransferMSHH1;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v55 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_6:
    uint64_t v54 = 2654435761 * self->_sessionSetupCloseMSHH1;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v54 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_7:
    uint64_t v53 = 2654435761 * self->_sentinelZoneFetchMSHH1;
    if ((*(_DWORD *)&has & 0x40000000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v53 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_8:
    uint64_t v52 = 2654435761 * self->_totalDurationMSHH1;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v52 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_9:
    uint64_t v51 = 2654435761 * self->_accountSettleWaitMSHH2;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v51 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_10:
    uint64_t v50 = 2654435761 * self->_currentDeviceIDSWaitMSHH2;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v50 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_11:
    uint64_t v49 = 2654435761 * self->_homeManagerReadyMSHH2;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v49 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_12:
    uint64_t v48 = 2654435761 * self->_firstCoreDataImportMSHH2;
    if (*(unsigned char *)&has) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v48 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_13:
    uint64_t v47 = 2654435761 * self->_accessoryAddMSHH2;
    if ((*(_DWORD *)&has & 0x10000000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v47 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_14:
    uint64_t v46 = 2654435761 * self->_settingsCreationMSHH2;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v46 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_15:
    uint64_t v45 = 2654435761 * self->_pairingIdentityCreationMSHH2;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v45 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_16:
    uint64_t v44 = 2654435761 * self->_siriReadyMSHH2;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v44 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_17:
    uint64_t v43 = 2654435761 * self->_eventRouterServerConnectionMSHH2;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v43 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_18:
    uint64_t v42 = 2654435761 * self->_primaryResidentElectionMSHH2;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v42 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_19:
    uint64_t v41 = 2654435761 * self->_eventRouterFirstEventPushMSHH2;
    if ((*(_DWORD *)&has & 0x80000000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v41 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_20:
    uint64_t v40 = 2654435761 * self->_totalDurationMSHH2;
    if ((*(void *)&has & 0x400000000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v40 = 0;
  if ((*(void *)&has & 0x400000000) != 0)
  {
LABEL_21:
    uint64_t v39 = 2654435761 * self->_iCloudAvailableINT;
    if ((*(void *)&has & 0x800000000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v39 = 0;
  if ((*(void *)&has & 0x800000000) != 0)
  {
LABEL_22:
    uint64_t v38 = 2654435761 * self->_iDSAvailableINT;
    if ((*(void *)&has & 0x4000000000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v38 = 0;
  if ((*(void *)&has & 0x4000000000) != 0)
  {
LABEL_23:
    uint64_t v37 = 2654435761 * self->_manateeAvailableINT;
    if ((*(void *)&has & 0x8000000000) != 0) {
      goto LABEL_24;
    }
LABEL_48:
    uint64_t v36 = 0;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_25;
    }
    goto LABEL_49;
  }
LABEL_47:
  uint64_t v37 = 0;
  if ((*(void *)&has & 0x8000000000) == 0) {
    goto LABEL_48;
  }
LABEL_24:
  uint64_t v36 = 2654435761 * self->_networkAvailableINT;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_25:
    uint64_t v35 = 2654435761 * self->_lastKnownStageErrorCode;
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v35 = 0;
LABEL_50:
  NSUInteger v34 = [(NSString *)self->_lastKnownStageErrorDomain hash];
  NSUInteger v33 = [(NSString *)self->_lastKnownStageErrorString hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    uint64_t v32 = 2654435761 * self->_lastKnownStageUnderlyingErrorCode;
  }
  else {
    uint64_t v32 = 0;
  }
  NSUInteger v31 = [(NSString *)self->_lastKnownStageUnderlyingErrorDomain hash];
  $14E84874AB12F438965F2E1C57E118F4 v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x1000000) == 0)
  {
    unint64_t v30 = 0;
    if ((*(void *)&v4 & 0x1000000000) != 0) {
      goto LABEL_55;
    }
LABEL_58:
    uint64_t v29 = 0;
    if ((*(void *)&v4 & 0x2000000000) != 0) {
      goto LABEL_56;
    }
    goto LABEL_59;
  }
  unint64_t v30 = 2654435761u * self->_savedEventState;
  if ((*(void *)&v4 & 0x1000000000) == 0) {
    goto LABEL_58;
  }
LABEL_55:
  uint64_t v29 = 2654435761 * self->_lastKnownControllerHH2Mode;
  if ((*(void *)&v4 & 0x2000000000) != 0)
  {
LABEL_56:
    uint64_t v28 = 2654435761 * self->_lastKnownControllerSentinelZoneExistence;
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v28 = 0;
LABEL_60:
  NSUInteger v27 = [(NSString *)self->_controllerSetupSessionIdentifier hash];
  $14E84874AB12F438965F2E1C57E118F4 v5 = self->_has;
  if ((*(void *)&v5 & 0x80000000000) != 0)
  {
    uint64_t v26 = 2654435761 * self->_numberOfTimesPrimaryResidentChangedHH2;
    if ((*(_WORD *)&v5 & 0x8000) != 0)
    {
LABEL_62:
      uint64_t v25 = 2654435761 * self->_lastPrimaryClientConnectedTimeHH2;
      if ((*(void *)&v5 & 0x20000000000) != 0) {
        goto LABEL_63;
      }
      goto LABEL_70;
    }
  }
  else
  {
    uint64_t v26 = 0;
    if ((*(_WORD *)&v5 & 0x8000) != 0) {
      goto LABEL_62;
    }
  }
  uint64_t v25 = 0;
  if ((*(void *)&v5 & 0x20000000000) != 0)
  {
LABEL_63:
    uint64_t v24 = 2654435761 * self->_numberOfTimesPrimaryClientConnectedHH2;
    if ((*(void *)&v5 & 0x40000000000) != 0) {
      goto LABEL_64;
    }
    goto LABEL_71;
  }
LABEL_70:
  uint64_t v24 = 0;
  if ((*(void *)&v5 & 0x40000000000) != 0)
  {
LABEL_64:
    uint64_t v23 = 2654435761 * self->_numberOfTimesPrimaryClientDisconnectedHH2;
    if ((*(void *)&v5 & 0x10000000000) != 0) {
      goto LABEL_65;
    }
    goto LABEL_72;
  }
LABEL_71:
  uint64_t v23 = 0;
  if ((*(void *)&v5 & 0x10000000000) != 0)
  {
LABEL_65:
    uint64_t v22 = 2654435761 * self->_numberOfTimesPrimaryClientConnectMessageFailedHH2;
    if ((*(void *)&v5 & 0x200000000) != 0) {
      goto LABEL_66;
    }
LABEL_73:
    uint64_t v21 = 0;
    if ((*(_WORD *)&v5 & 0x2000) != 0) {
      goto LABEL_67;
    }
    goto LABEL_74;
  }
LABEL_72:
  uint64_t v22 = 0;
  if ((*(void *)&v5 & 0x200000000) == 0) {
    goto LABEL_73;
  }
LABEL_66:
  uint64_t v21 = 2654435761 * self->_currentDeviceConfirmedPrimaryResidentINT;
  if ((*(_WORD *)&v5 & 0x2000) != 0)
  {
LABEL_67:
    uint64_t v20 = 2654435761 * self->_lastPrimaryClientConnectMessageFailErrorCodeHH2;
    goto LABEL_75;
  }
LABEL_74:
  uint64_t v20 = 0;
LABEL_75:
  NSUInteger v19 = [(NSString *)self->_lastPrimaryClientConnectMessageFailErrorDomainHH2 hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    uint64_t v18 = 2654435761 * self->_lastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2;
  }
  else {
    uint64_t v18 = 0;
  }
  NSUInteger v17 = [(NSString *)self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2 hash];
  $14E84874AB12F438965F2E1C57E118F4 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) != 0)
  {
    uint64_t v7 = 2654435761 * self->_primaryResidentElectionPeerDeviceFutureResolvedMSHH2;
    if ((*(_DWORD *)&v6 & 0x40000) != 0)
    {
LABEL_80:
      uint64_t v8 = 2654435761 * self->_primaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2;
      if ((*(_DWORD *)&v6 & 0x200000) != 0) {
        goto LABEL_81;
      }
      goto LABEL_88;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(_DWORD *)&v6 & 0x40000) != 0) {
      goto LABEL_80;
    }
  }
  uint64_t v8 = 0;
  if ((*(_DWORD *)&v6 & 0x200000) != 0)
  {
LABEL_81:
    uint64_t v9 = 2654435761 * self->_primaryResidentElectionModernTransportStartedFutureResolvedMSHH2;
    if ((*(_DWORD *)&v6 & 0x400000) != 0) {
      goto LABEL_82;
    }
    goto LABEL_89;
  }
LABEL_88:
  uint64_t v9 = 0;
  if ((*(_DWORD *)&v6 & 0x400000) != 0)
  {
LABEL_82:
    uint64_t v10 = 2654435761 * self->_primaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2;
    if ((*(_DWORD *)&v6 & 0x80000) != 0) {
      goto LABEL_83;
    }
    goto LABEL_90;
  }
LABEL_89:
  uint64_t v10 = 0;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
  {
LABEL_83:
    uint64_t v11 = 2654435761 * self->_primaryResidentElectionJoinMeshMSHH2;
    if ((*(unsigned char *)&v6 & 0x40) != 0) {
      goto LABEL_84;
    }
LABEL_91:
    uint64_t v12 = 0;
    if ((*(unsigned char *)&v6 & 0x80) != 0) {
      goto LABEL_85;
    }
    goto LABEL_92;
  }
LABEL_90:
  uint64_t v11 = 0;
  if ((*(unsigned char *)&v6 & 0x40) == 0) {
    goto LABEL_91;
  }
LABEL_84:
  uint64_t v12 = 2654435761 * self->_firstCoreDataContainerSetupDurationMSHH2;
  if ((*(unsigned char *)&v6 & 0x80) != 0)
  {
LABEL_85:
    uint64_t v13 = 2654435761 * self->_firstCoreDataContainerSetupErrorCodeHH2;
    goto LABEL_93;
  }
LABEL_92:
  uint64_t v13 = 0;
LABEL_93:
  NSUInteger v14 = [(NSString *)self->_firstCoreDataContainerSetupErrorDomainHH2 hash];
  if (*((unsigned char *)&self->_has + 1)) {
    uint64_t v15 = 2654435761 * self->_firstCoreDataContainerSetupUnderlyingErrorCodeHH2;
  }
  else {
    uint64_t v15 = 0;
  }
  return v57 ^ v58 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ [(NSString *)self->_firstCoreDataContainerSetupUnderlyingErrorDomainHH2 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_243;
  }
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  uint64_t v6 = *((void *)v4 + 48);
  if ((*(void *)&has & 0x100000000) != 0)
  {
    if ((v6 & 0x100000000) == 0 || self->_version != *((void *)v4 + 33)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 0x100000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0 || self->_sessionSetupOpenMSHH1 != *((void *)v4 + 28)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_controllerKeyExchangeMSHH1 != *((void *)v4 + 3)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_newAccessoryTransferMSHH1 != *((void *)v4 + 17)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0 || self->_sessionSetupCloseMSHH1 != *((void *)v4 + 27)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_sentinelZoneFetchMSHH1 != *((void *)v4 + 26)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v6 & 0x40000000) == 0 || self->_totalDurationMSHH1 != *((void *)v4 + 31)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 0x40000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_accountSettleWaitMSHH2 != *((void *)v4 + 2)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_243;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_currentDeviceIDSWaitMSHH2 != *((void *)v4 + 4)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_homeManagerReadyMSHH2 != *((void *)v4 + 11)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_firstCoreDataImportMSHH2 != *((void *)v4 + 10)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_243;
  }
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_accessoryAddMSHH2 != *((void *)v4 + 1)) {
      goto LABEL_243;
    }
  }
  else if (v6)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0 || self->_settingsCreationMSHH2 != *((void *)v4 + 29)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 0x10000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_pairingIdentityCreationMSHH2 != *((void *)v4 + 18)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v6 & 0x20000000) == 0 || self->_siriReadyMSHH2 != *((void *)v4 + 30)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 0x20000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_eventRouterServerConnectionMSHH2 != *((void *)v4 + 6)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_primaryResidentElectionMSHH2 != *((void *)v4 + 21)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_eventRouterFirstEventPushMSHH2 != *((void *)v4 + 5)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v6 & 0x80000000) == 0 || self->_totalDurationMSHH2 != *((void *)v4 + 32)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 0x80000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(void *)&has & 0x400000000) != 0)
  {
    if ((v6 & 0x400000000) == 0 || self->_iCloudAvailableINT != *((_DWORD *)v4 + 76)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 0x400000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(void *)&has & 0x800000000) != 0)
  {
    if ((v6 & 0x800000000) == 0 || self->_iDSAvailableINT != *((_DWORD *)v4 + 77)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 0x800000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(void *)&has & 0x4000000000) != 0)
  {
    if ((v6 & 0x4000000000) == 0 || self->_manateeAvailableINT != *((_DWORD *)v4 + 90)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 0x4000000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(void *)&has & 0x8000000000) != 0)
  {
    if ((v6 & 0x8000000000) == 0 || self->_networkAvailableINT != *((_DWORD *)v4 + 91)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 0x8000000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_lastKnownStageErrorCode != *((void *)v4 + 12)) {
      goto LABEL_243;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_243;
  }
  lastKnownStageErrorDomain = self->_lastKnownStageErrorDomain;
  if ((unint64_t)lastKnownStageErrorDomain | *((void *)v4 + 40)
    && !-[NSString isEqual:](lastKnownStageErrorDomain, "isEqual:"))
  {
    goto LABEL_243;
  }
  lastKnownStageErrorString = self->_lastKnownStageErrorString;
  if ((unint64_t)lastKnownStageErrorString | *((void *)v4 + 41))
  {
    if (!-[NSString isEqual:](lastKnownStageErrorString, "isEqual:")) {
      goto LABEL_243;
    }
  }
  $14E84874AB12F438965F2E1C57E118F4 v9 = self->_has;
  uint64_t v10 = *((void *)v4 + 48);
  if ((*(_WORD *)&v9 & 0x1000) != 0)
  {
    if ((v10 & 0x1000) == 0 || self->_lastKnownStageUnderlyingErrorCode != *((void *)v4 + 13)) {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x1000) != 0)
  {
    goto LABEL_243;
  }
  lastKnownStageUnderlyingErrorDomain = self->_lastKnownStageUnderlyingErrorDomain;
  if ((unint64_t)lastKnownStageUnderlyingErrorDomain | *((void *)v4 + 42))
  {
    if (!-[NSString isEqual:](lastKnownStageUnderlyingErrorDomain, "isEqual:")) {
      goto LABEL_243;
    }
    $14E84874AB12F438965F2E1C57E118F4 v9 = self->_has;
    uint64_t v10 = *((void *)v4 + 48);
  }
  if ((*(_DWORD *)&v9 & 0x1000000) != 0)
  {
    if ((v10 & 0x1000000) == 0 || self->_savedEventState != *((void *)v4 + 25)) {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x1000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(void *)&v9 & 0x1000000000) != 0)
  {
    if ((v10 & 0x1000000000) == 0 || self->_lastKnownControllerHH2Mode != *((_DWORD *)v4 + 78)) {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x1000000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(void *)&v9 & 0x2000000000) != 0)
  {
    if ((v10 & 0x2000000000) == 0 || self->_lastKnownControllerSentinelZoneExistence != *((_DWORD *)v4 + 79)) {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x2000000000) != 0)
  {
    goto LABEL_243;
  }
  controllerSetupSessionIdentifier = self->_controllerSetupSessionIdentifier;
  if ((unint64_t)controllerSetupSessionIdentifier | *((void *)v4 + 34))
  {
    if (!-[NSString isEqual:](controllerSetupSessionIdentifier, "isEqual:")) {
      goto LABEL_243;
    }
    $14E84874AB12F438965F2E1C57E118F4 v9 = self->_has;
    uint64_t v10 = *((void *)v4 + 48);
  }
  if ((*(void *)&v9 & 0x80000000000) != 0)
  {
    if ((v10 & 0x80000000000) == 0 || self->_numberOfTimesPrimaryResidentChangedHH2 != *((_DWORD *)v4 + 95)) {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x80000000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_WORD *)&v9 & 0x8000) != 0)
  {
    if ((v10 & 0x8000) == 0 || self->_lastPrimaryClientConnectedTimeHH2 != *((void *)v4 + 16)) {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x8000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(void *)&v9 & 0x20000000000) != 0)
  {
    if ((v10 & 0x20000000000) == 0 || self->_numberOfTimesPrimaryClientConnectedHH2 != *((_DWORD *)v4 + 93)) {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x20000000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(void *)&v9 & 0x40000000000) != 0)
  {
    if ((v10 & 0x40000000000) == 0 || self->_numberOfTimesPrimaryClientDisconnectedHH2 != *((_DWORD *)v4 + 94)) {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x40000000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(void *)&v9 & 0x10000000000) != 0)
  {
    if ((v10 & 0x10000000000) == 0
      || self->_numberOfTimesPrimaryClientConnectMessageFailedHH2 != *((_DWORD *)v4 + 92))
    {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x10000000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(void *)&v9 & 0x200000000) != 0)
  {
    if ((v10 & 0x200000000) == 0 || self->_currentDeviceConfirmedPrimaryResidentINT != *((_DWORD *)v4 + 70)) {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x200000000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_WORD *)&v9 & 0x2000) != 0)
  {
    if ((v10 & 0x2000) == 0 || self->_lastPrimaryClientConnectMessageFailErrorCodeHH2 != *((void *)v4 + 14)) {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x2000) != 0)
  {
    goto LABEL_243;
  }
  lastPrimaryClientConnectMessageFailErrorDomainHH2 = self->_lastPrimaryClientConnectMessageFailErrorDomainHH2;
  if ((unint64_t)lastPrimaryClientConnectMessageFailErrorDomainHH2 | *((void *)v4 + 43))
  {
    if (!-[NSString isEqual:](lastPrimaryClientConnectMessageFailErrorDomainHH2, "isEqual:")) {
      goto LABEL_243;
    }
    $14E84874AB12F438965F2E1C57E118F4 v9 = self->_has;
    uint64_t v10 = *((void *)v4 + 48);
  }
  if ((*(_WORD *)&v9 & 0x4000) != 0)
  {
    if ((v10 & 0x4000) == 0 || self->_lastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2 != *((void *)v4 + 15)) {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x4000) != 0)
  {
    goto LABEL_243;
  }
  lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2 = self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2;
  if ((unint64_t)lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2 | *((void *)v4 + 44))
  {
    if (!-[NSString isEqual:](lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2, "isEqual:")) {
      goto LABEL_243;
    }
    $14E84874AB12F438965F2E1C57E118F4 v9 = self->_has;
    uint64_t v10 = *((void *)v4 + 48);
  }
  if ((*(_DWORD *)&v9 & 0x800000) != 0)
  {
    if ((v10 & 0x800000) == 0 || self->_primaryResidentElectionPeerDeviceFutureResolvedMSHH2 != *((void *)v4 + 24)) {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x800000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&v9 & 0x40000) != 0)
  {
    if ((v10 & 0x40000) == 0
      || self->_primaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2 != *((void *)v4 + 19))
    {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x40000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&v9 & 0x200000) != 0)
  {
    if ((v10 & 0x200000) == 0
      || self->_primaryResidentElectionModernTransportStartedFutureResolvedMSHH2 != *((void *)v4 + 22))
    {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x200000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&v9 & 0x400000) != 0)
  {
    if ((v10 & 0x400000) == 0
      || self->_primaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2 != *((void *)v4 + 23))
    {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x400000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(_DWORD *)&v9 & 0x80000) != 0)
  {
    if ((v10 & 0x80000) == 0 || self->_primaryResidentElectionJoinMeshMSHH2 != *((void *)v4 + 20)) {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x80000) != 0)
  {
    goto LABEL_243;
  }
  if ((*(unsigned char *)&v9 & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_firstCoreDataContainerSetupDurationMSHH2 != *((void *)v4 + 7)) {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_243;
  }
  if ((*(unsigned char *)&v9 & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_firstCoreDataContainerSetupErrorCodeHH2 != *((void *)v4 + 8)) {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_243;
  }
  firstCoreDataContainerSetupErrorDomainHH2 = self->_firstCoreDataContainerSetupErrorDomainHH2;
  if ((unint64_t)firstCoreDataContainerSetupErrorDomainHH2 | *((void *)v4 + 36))
  {
    if (-[NSString isEqual:](firstCoreDataContainerSetupErrorDomainHH2, "isEqual:"))
    {
      $14E84874AB12F438965F2E1C57E118F4 v9 = self->_has;
      uint64_t v10 = *((void *)v4 + 48);
      goto LABEL_236;
    }
LABEL_243:
    char v17 = 0;
    goto LABEL_244;
  }
LABEL_236:
  if ((*(_WORD *)&v9 & 0x100) != 0)
  {
    if ((v10 & 0x100) == 0 || self->_firstCoreDataContainerSetupUnderlyingErrorCodeHH2 != *((void *)v4 + 9)) {
      goto LABEL_243;
    }
  }
  else if ((v10 & 0x100) != 0)
  {
    goto LABEL_243;
  }
  firstCoreDataContainerSetupUnderlyingErrorDomainHH2 = self->_firstCoreDataContainerSetupUnderlyingErrorDomainHH2;
  if ((unint64_t)firstCoreDataContainerSetupUnderlyingErrorDomainHH2 | *((void *)v4 + 37)) {
    char v17 = -[NSString isEqual:](firstCoreDataContainerSetupUnderlyingErrorDomainHH2, "isEqual:");
  }
  else {
    char v17 = 1;
  }
LABEL_244:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(void *)&has & 0x100000000) != 0)
  {
    *(void *)(v5 + 264) = self->_version;
    *(void *)(v5 + 384) |= 0x100000000uLL;
    $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
    if ((*(_DWORD *)&has & 0x8000000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_55;
    }
  }
  else if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 224) = self->_sessionSetupOpenMSHH1;
  *(void *)(v5 + 384) |= 0x8000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_56;
  }
LABEL_55:
  *(void *)(v5 + 24) = self->_controllerKeyExchangeMSHH1;
  *(void *)(v5 + 384) |= 4uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_57;
  }
LABEL_56:
  *(void *)(v5 + 136) = self->_newAccessoryTransferMSHH1;
  *(void *)(v5 + 384) |= 0x10000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(void *)(v5 + 216) = self->_sessionSetupCloseMSHH1;
  *(void *)(v5 + 384) |= 0x4000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(void *)(v5 + 208) = self->_sentinelZoneFetchMSHH1;
  *(void *)(v5 + 384) |= 0x2000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_60;
  }
LABEL_59:
  *(void *)(v5 + 248) = self->_totalDurationMSHH1;
  *(void *)(v5 + 384) |= 0x40000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_61;
  }
LABEL_60:
  *(void *)(v5 + 16) = self->_accountSettleWaitMSHH2;
  *(void *)(v5 + 384) |= 2uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_62;
  }
LABEL_61:
  *(void *)(v5 + 32) = self->_currentDeviceIDSWaitMSHH2;
  *(void *)(v5 + 384) |= 8uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_63;
  }
LABEL_62:
  *(void *)(v5 + 88) = self->_homeManagerReadyMSHH2;
  *(void *)(v5 + 384) |= 0x400uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_64;
  }
LABEL_63:
  *(void *)(v5 + 80) = self->_firstCoreDataImportMSHH2;
  *(void *)(v5 + 384) |= 0x200uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_65;
  }
LABEL_64:
  *(void *)(v5 + 8) = self->_accessoryAddMSHH2;
  *(void *)(v5 + 384) |= 1uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_66;
  }
LABEL_65:
  *(void *)(v5 + 232) = self->_settingsCreationMSHH2;
  *(void *)(v5 + 384) |= 0x10000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_67;
  }
LABEL_66:
  *(void *)(v5 + 144) = self->_pairingIdentityCreationMSHH2;
  *(void *)(v5 + 384) |= 0x20000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_68;
  }
LABEL_67:
  *(void *)(v5 + 240) = self->_siriReadyMSHH2;
  *(void *)(v5 + 384) |= 0x20000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_69;
  }
LABEL_68:
  *(void *)(v5 + 48) = self->_eventRouterServerConnectionMSHH2;
  *(void *)(v5 + 384) |= 0x20uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_70;
  }
LABEL_69:
  *(void *)(v5 + 168) = self->_primaryResidentElectionMSHH2;
  *(void *)(v5 + 384) |= 0x100000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_71;
  }
LABEL_70:
  *(void *)(v5 + 40) = self->_eventRouterFirstEventPushMSHH2;
  *(void *)(v5 + 384) |= 0x10uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_20:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_72;
  }
LABEL_71:
  *(void *)(v5 + 256) = self->_totalDurationMSHH2;
  *(void *)(v5 + 384) |= 0x80000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_21:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_73;
  }
LABEL_72:
  *(_DWORD *)(v5 + 304) = self->_iCloudAvailableINT;
  *(void *)(v5 + 384) |= 0x400000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_74;
  }
LABEL_73:
  *(_DWORD *)(v5 + 308) = self->_iDSAvailableINT;
  *(void *)(v5 + 384) |= 0x800000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_23:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_75;
  }
LABEL_74:
  *(_DWORD *)(v5 + 360) = self->_manateeAvailableINT;
  *(void *)(v5 + 384) |= 0x4000000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_75:
  *(_DWORD *)(v5 + 364) = self->_networkAvailableINT;
  *(void *)(v5 + 384) |= 0x8000000000uLL;
  if ((*(void *)&self->_has & 0x800) != 0)
  {
LABEL_25:
    *(void *)(v5 + 96) = self->_lastKnownStageErrorCode;
    *(void *)(v5 + 384) |= 0x800uLL;
  }
LABEL_26:
  uint64_t v8 = [(NSString *)self->_lastKnownStageErrorDomain copyWithZone:a3];
  $14E84874AB12F438965F2E1C57E118F4 v9 = *(void **)(v6 + 320);
  *(void *)(v6 + 320) = v8;

  uint64_t v10 = [(NSString *)self->_lastKnownStageErrorString copyWithZone:a3];
  uint64_t v11 = *(void **)(v6 + 328);
  *(void *)(v6 + 328) = v10;

  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    *(void *)(v6 + 104) = self->_lastKnownStageUnderlyingErrorCode;
    *(void *)(v6 + 384) |= 0x1000uLL;
  }
  uint64_t v12 = [(NSString *)self->_lastKnownStageUnderlyingErrorDomain copyWithZone:a3];
  uint64_t v13 = *(void **)(v6 + 336);
  *(void *)(v6 + 336) = v12;

  $14E84874AB12F438965F2E1C57E118F4 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x1000000) != 0)
  {
    *(void *)(v6 + 200) = self->_savedEventState;
    *(void *)(v6 + 384) |= 0x1000000uLL;
    $14E84874AB12F438965F2E1C57E118F4 v14 = self->_has;
    if ((*(void *)&v14 & 0x1000000000) == 0)
    {
LABEL_30:
      if ((*(void *)&v14 & 0x2000000000) == 0) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
  }
  else if ((*(void *)&v14 & 0x1000000000) == 0)
  {
    goto LABEL_30;
  }
  *(_DWORD *)(v6 + 312) = self->_lastKnownControllerHH2Mode;
  *(void *)(v6 + 384) |= 0x1000000000uLL;
  if ((*(void *)&self->_has & 0x2000000000) != 0)
  {
LABEL_31:
    *(_DWORD *)(v6 + 316) = self->_lastKnownControllerSentinelZoneExistence;
    *(void *)(v6 + 384) |= 0x2000000000uLL;
  }
LABEL_32:
  uint64_t v15 = [(NSString *)self->_controllerSetupSessionIdentifier copyWithZone:a3];
  v16 = *(void **)(v6 + 272);
  *(void *)(v6 + 272) = v15;

  $14E84874AB12F438965F2E1C57E118F4 v17 = self->_has;
  if ((*(void *)&v17 & 0x80000000000) != 0)
  {
    *(_DWORD *)(v6 + 380) = self->_numberOfTimesPrimaryResidentChangedHH2;
    *(void *)(v6 + 384) |= 0x80000000000uLL;
    $14E84874AB12F438965F2E1C57E118F4 v17 = self->_has;
    if ((*(_WORD *)&v17 & 0x8000) == 0)
    {
LABEL_34:
      if ((*(void *)&v17 & 0x20000000000) == 0) {
        goto LABEL_35;
      }
      goto LABEL_82;
    }
  }
  else if ((*(_WORD *)&v17 & 0x8000) == 0)
  {
    goto LABEL_34;
  }
  *(void *)(v6 + 128) = self->_lastPrimaryClientConnectedTimeHH2;
  *(void *)(v6 + 384) |= 0x8000uLL;
  $14E84874AB12F438965F2E1C57E118F4 v17 = self->_has;
  if ((*(void *)&v17 & 0x20000000000) == 0)
  {
LABEL_35:
    if ((*(void *)&v17 & 0x40000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_83;
  }
LABEL_82:
  *(_DWORD *)(v6 + 372) = self->_numberOfTimesPrimaryClientConnectedHH2;
  *(void *)(v6 + 384) |= 0x20000000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 v17 = self->_has;
  if ((*(void *)&v17 & 0x40000000000) == 0)
  {
LABEL_36:
    if ((*(void *)&v17 & 0x10000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_84;
  }
LABEL_83:
  *(_DWORD *)(v6 + 376) = self->_numberOfTimesPrimaryClientDisconnectedHH2;
  *(void *)(v6 + 384) |= 0x40000000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 v17 = self->_has;
  if ((*(void *)&v17 & 0x10000000000) == 0)
  {
LABEL_37:
    if ((*(void *)&v17 & 0x200000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_85;
  }
LABEL_84:
  *(_DWORD *)(v6 + 368) = self->_numberOfTimesPrimaryClientConnectMessageFailedHH2;
  *(void *)(v6 + 384) |= 0x10000000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 v17 = self->_has;
  if ((*(void *)&v17 & 0x200000000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v17 & 0x2000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_85:
  *(_DWORD *)(v6 + 280) = self->_currentDeviceConfirmedPrimaryResidentINT;
  *(void *)(v6 + 384) |= 0x200000000uLL;
  if ((*(void *)&self->_has & 0x2000) != 0)
  {
LABEL_39:
    *(void *)(v6 + 112) = self->_lastPrimaryClientConnectMessageFailErrorCodeHH2;
    *(void *)(v6 + 384) |= 0x2000uLL;
  }
LABEL_40:
  uint64_t v18 = [(NSString *)self->_lastPrimaryClientConnectMessageFailErrorDomainHH2 copyWithZone:a3];
  NSUInteger v19 = *(void **)(v6 + 344);
  *(void *)(v6 + 344) = v18;

  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    *(void *)(v6 + 120) = self->_lastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2;
    *(void *)(v6 + 384) |= 0x4000uLL;
  }
  uint64_t v20 = [(NSString *)self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2 copyWithZone:a3];
  uint64_t v21 = *(void **)(v6 + 352);
  *(void *)(v6 + 352) = v20;

  $14E84874AB12F438965F2E1C57E118F4 v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x800000) != 0)
  {
    *(void *)(v6 + 192) = self->_primaryResidentElectionPeerDeviceFutureResolvedMSHH2;
    *(void *)(v6 + 384) |= 0x800000uLL;
    $14E84874AB12F438965F2E1C57E118F4 v22 = self->_has;
    if ((*(_DWORD *)&v22 & 0x40000) == 0)
    {
LABEL_44:
      if ((*(_DWORD *)&v22 & 0x200000) == 0) {
        goto LABEL_45;
      }
      goto LABEL_89;
    }
  }
  else if ((*(_DWORD *)&v22 & 0x40000) == 0)
  {
    goto LABEL_44;
  }
  *(void *)(v6 + 152) = self->_primaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2;
  *(void *)(v6 + 384) |= 0x40000uLL;
  $14E84874AB12F438965F2E1C57E118F4 v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x200000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v22 & 0x400000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_90;
  }
LABEL_89:
  *(void *)(v6 + 176) = self->_primaryResidentElectionModernTransportStartedFutureResolvedMSHH2;
  *(void *)(v6 + 384) |= 0x200000uLL;
  $14E84874AB12F438965F2E1C57E118F4 v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x400000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v22 & 0x80000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_91;
  }
LABEL_90:
  *(void *)(v6 + 184) = self->_primaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2;
  *(void *)(v6 + 384) |= 0x400000uLL;
  $14E84874AB12F438965F2E1C57E118F4 v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x80000) == 0)
  {
LABEL_47:
    if ((*(unsigned char *)&v22 & 0x40) == 0) {
      goto LABEL_48;
    }
    goto LABEL_92;
  }
LABEL_91:
  *(void *)(v6 + 160) = self->_primaryResidentElectionJoinMeshMSHH2;
  *(void *)(v6 + 384) |= 0x80000uLL;
  $14E84874AB12F438965F2E1C57E118F4 v22 = self->_has;
  if ((*(unsigned char *)&v22 & 0x40) == 0)
  {
LABEL_48:
    if ((*(unsigned char *)&v22 & 0x80) == 0) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
LABEL_92:
  *(void *)(v6 + 56) = self->_firstCoreDataContainerSetupDurationMSHH2;
  *(void *)(v6 + 384) |= 0x40uLL;
  if ((*(void *)&self->_has & 0x80) != 0)
  {
LABEL_49:
    *(void *)(v6 + 64) = self->_firstCoreDataContainerSetupErrorCodeHH2;
    *(void *)(v6 + 384) |= 0x80uLL;
  }
LABEL_50:
  uint64_t v23 = [(NSString *)self->_firstCoreDataContainerSetupErrorDomainHH2 copyWithZone:a3];
  uint64_t v24 = *(void **)(v6 + 288);
  *(void *)(v6 + 288) = v23;

  if (*((unsigned char *)&self->_has + 1))
  {
    *(void *)(v6 + 72) = self->_firstCoreDataContainerSetupUnderlyingErrorCodeHH2;
    *(void *)(v6 + 384) |= 0x100uLL;
  }
  uint64_t v25 = [(NSString *)self->_firstCoreDataContainerSetupUnderlyingErrorDomainHH2 copyWithZone:a3];
  uint64_t v26 = *(void **)(v6 + 296);
  *(void *)(v6 + 296) = v25;

  id v27 = (id)v6;
  return v27;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(void *)&has & 0x100000000) != 0)
  {
    v4[33] = self->_version;
    v4[48] |= 0x100000000uLL;
    $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
    if ((*(_DWORD *)&has & 0x8000000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_73;
    }
  }
  else if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
    goto LABEL_3;
  }
  v4[28] = self->_sessionSetupOpenMSHH1;
  v4[48] |= 0x8000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_74;
  }
LABEL_73:
  v4[3] = self->_controllerKeyExchangeMSHH1;
  v4[48] |= 4uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_75;
  }
LABEL_74:
  v4[17] = self->_newAccessoryTransferMSHH1;
  v4[48] |= 0x10000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_76;
  }
LABEL_75:
  v4[27] = self->_sessionSetupCloseMSHH1;
  v4[48] |= 0x4000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_77;
  }
LABEL_76:
  v4[26] = self->_sentinelZoneFetchMSHH1;
  v4[48] |= 0x2000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_78;
  }
LABEL_77:
  v4[31] = self->_totalDurationMSHH1;
  v4[48] |= 0x40000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_79;
  }
LABEL_78:
  v4[2] = self->_accountSettleWaitMSHH2;
  v4[48] |= 2uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_80;
  }
LABEL_79:
  v4[4] = self->_currentDeviceIDSWaitMSHH2;
  v4[48] |= 8uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_81;
  }
LABEL_80:
  v4[11] = self->_homeManagerReadyMSHH2;
  v4[48] |= 0x400uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_82;
  }
LABEL_81:
  v4[10] = self->_firstCoreDataImportMSHH2;
  v4[48] |= 0x200uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_83;
  }
LABEL_82:
  v4[1] = self->_accessoryAddMSHH2;
  v4[48] |= 1uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_84;
  }
LABEL_83:
  v4[29] = self->_settingsCreationMSHH2;
  v4[48] |= 0x10000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_85;
  }
LABEL_84:
  v4[18] = self->_pairingIdentityCreationMSHH2;
  v4[48] |= 0x20000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_86;
  }
LABEL_85:
  v4[30] = self->_siriReadyMSHH2;
  v4[48] |= 0x20000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_87;
  }
LABEL_86:
  v4[6] = self->_eventRouterServerConnectionMSHH2;
  v4[48] |= 0x20uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_88;
  }
LABEL_87:
  v4[21] = self->_primaryResidentElectionMSHH2;
  v4[48] |= 0x100000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_89;
  }
LABEL_88:
  v4[5] = self->_eventRouterFirstEventPushMSHH2;
  v4[48] |= 0x10uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_20:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_90;
  }
LABEL_89:
  v4[32] = self->_totalDurationMSHH2;
  v4[48] |= 0x80000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_21:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_91;
  }
LABEL_90:
  *((_DWORD *)v4 + 76) = self->_iCloudAvailableINT;
  v4[48] |= 0x400000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_92;
  }
LABEL_91:
  *((_DWORD *)v4 + 77) = self->_iDSAvailableINT;
  v4[48] |= 0x800000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_23:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_93;
  }
LABEL_92:
  *((_DWORD *)v4 + 90) = self->_manateeAvailableINT;
  v4[48] |= 0x4000000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_93:
  *((_DWORD *)v4 + 91) = self->_networkAvailableINT;
  v4[48] |= 0x8000000000uLL;
  if ((*(void *)&self->_has & 0x800) != 0)
  {
LABEL_25:
    v4[12] = self->_lastKnownStageErrorCode;
    v4[48] |= 0x800uLL;
  }
LABEL_26:
  $14E84874AB12F438965F2E1C57E118F4 v9 = v4;
  if (self->_lastKnownStageErrorDomain)
  {
    objc_msgSend(v4, "setLastKnownStageErrorDomain:");
    id v4 = v9;
  }
  if (self->_lastKnownStageErrorString)
  {
    objc_msgSend(v9, "setLastKnownStageErrorString:");
    id v4 = v9;
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    v4[13] = self->_lastKnownStageUnderlyingErrorCode;
    v4[48] |= 0x1000uLL;
  }
  if (self->_lastKnownStageUnderlyingErrorDomain)
  {
    objc_msgSend(v9, "setLastKnownStageUnderlyingErrorDomain:");
    id v4 = v9;
  }
  $14E84874AB12F438965F2E1C57E118F4 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) != 0)
  {
    v4[25] = self->_savedEventState;
    v4[48] |= 0x1000000uLL;
    $14E84874AB12F438965F2E1C57E118F4 v6 = self->_has;
    if ((*(void *)&v6 & 0x1000000000) == 0)
    {
LABEL_36:
      if ((*(void *)&v6 & 0x2000000000) == 0) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
  }
  else if ((*(void *)&v6 & 0x1000000000) == 0)
  {
    goto LABEL_36;
  }
  *((_DWORD *)v4 + 78) = self->_lastKnownControllerHH2Mode;
  v4[48] |= 0x1000000000uLL;
  if ((*(void *)&self->_has & 0x2000000000) != 0)
  {
LABEL_37:
    *((_DWORD *)v4 + 79) = self->_lastKnownControllerSentinelZoneExistence;
    v4[48] |= 0x2000000000uLL;
  }
LABEL_38:
  if (self->_controllerSetupSessionIdentifier)
  {
    objc_msgSend(v9, "setControllerSetupSessionIdentifier:");
    id v4 = v9;
  }
  $14E84874AB12F438965F2E1C57E118F4 v7 = self->_has;
  if ((*(void *)&v7 & 0x80000000000) != 0)
  {
    *((_DWORD *)v4 + 95) = self->_numberOfTimesPrimaryResidentChangedHH2;
    v4[48] |= 0x80000000000uLL;
    $14E84874AB12F438965F2E1C57E118F4 v7 = self->_has;
    if ((*(_WORD *)&v7 & 0x8000) == 0)
    {
LABEL_42:
      if ((*(void *)&v7 & 0x20000000000) == 0) {
        goto LABEL_43;
      }
      goto LABEL_100;
    }
  }
  else if ((*(_WORD *)&v7 & 0x8000) == 0)
  {
    goto LABEL_42;
  }
  v4[16] = self->_lastPrimaryClientConnectedTimeHH2;
  v4[48] |= 0x8000uLL;
  $14E84874AB12F438965F2E1C57E118F4 v7 = self->_has;
  if ((*(void *)&v7 & 0x20000000000) == 0)
  {
LABEL_43:
    if ((*(void *)&v7 & 0x40000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_101;
  }
LABEL_100:
  *((_DWORD *)v4 + 93) = self->_numberOfTimesPrimaryClientConnectedHH2;
  v4[48] |= 0x20000000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 v7 = self->_has;
  if ((*(void *)&v7 & 0x40000000000) == 0)
  {
LABEL_44:
    if ((*(void *)&v7 & 0x10000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_102;
  }
LABEL_101:
  *((_DWORD *)v4 + 94) = self->_numberOfTimesPrimaryClientDisconnectedHH2;
  v4[48] |= 0x40000000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 v7 = self->_has;
  if ((*(void *)&v7 & 0x10000000000) == 0)
  {
LABEL_45:
    if ((*(void *)&v7 & 0x200000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_103;
  }
LABEL_102:
  *((_DWORD *)v4 + 92) = self->_numberOfTimesPrimaryClientConnectMessageFailedHH2;
  v4[48] |= 0x10000000000uLL;
  $14E84874AB12F438965F2E1C57E118F4 v7 = self->_has;
  if ((*(void *)&v7 & 0x200000000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v7 & 0x2000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
LABEL_103:
  *((_DWORD *)v4 + 70) = self->_currentDeviceConfirmedPrimaryResidentINT;
  v4[48] |= 0x200000000uLL;
  if ((*(void *)&self->_has & 0x2000) != 0)
  {
LABEL_47:
    v4[14] = self->_lastPrimaryClientConnectMessageFailErrorCodeHH2;
    v4[48] |= 0x2000uLL;
  }
LABEL_48:
  if (self->_lastPrimaryClientConnectMessageFailErrorDomainHH2)
  {
    objc_msgSend(v9, "setLastPrimaryClientConnectMessageFailErrorDomainHH2:");
    id v4 = v9;
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    v4[15] = self->_lastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2;
    v4[48] |= 0x4000uLL;
  }
  if (self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2)
  {
    objc_msgSend(v9, "setLastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2:");
    id v4 = v9;
  }
  $14E84874AB12F438965F2E1C57E118F4 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x800000) != 0)
  {
    v4[24] = self->_primaryResidentElectionPeerDeviceFutureResolvedMSHH2;
    v4[48] |= 0x800000uLL;
    $14E84874AB12F438965F2E1C57E118F4 v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x40000) == 0)
    {
LABEL_56:
      if ((*(_DWORD *)&v8 & 0x200000) == 0) {
        goto LABEL_57;
      }
      goto LABEL_107;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x40000) == 0)
  {
    goto LABEL_56;
  }
  v4[19] = self->_primaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2;
  v4[48] |= 0x40000uLL;
  $14E84874AB12F438965F2E1C57E118F4 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&v8 & 0x400000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_108;
  }
LABEL_107:
  v4[22] = self->_primaryResidentElectionModernTransportStartedFutureResolvedMSHH2;
  v4[48] |= 0x200000uLL;
  $14E84874AB12F438965F2E1C57E118F4 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x400000) == 0)
  {
LABEL_58:
    if ((*(_DWORD *)&v8 & 0x80000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_109;
  }
LABEL_108:
  v4[23] = self->_primaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2;
  v4[48] |= 0x400000uLL;
  $14E84874AB12F438965F2E1C57E118F4 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000) == 0)
  {
LABEL_59:
    if ((*(unsigned char *)&v8 & 0x40) == 0) {
      goto LABEL_60;
    }
    goto LABEL_110;
  }
LABEL_109:
  v4[20] = self->_primaryResidentElectionJoinMeshMSHH2;
  v4[48] |= 0x80000uLL;
  $14E84874AB12F438965F2E1C57E118F4 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x40) == 0)
  {
LABEL_60:
    if ((*(unsigned char *)&v8 & 0x80) == 0) {
      goto LABEL_62;
    }
    goto LABEL_61;
  }
LABEL_110:
  v4[7] = self->_firstCoreDataContainerSetupDurationMSHH2;
  v4[48] |= 0x40uLL;
  if ((*(void *)&self->_has & 0x80) != 0)
  {
LABEL_61:
    v4[8] = self->_firstCoreDataContainerSetupErrorCodeHH2;
    v4[48] |= 0x80uLL;
  }
LABEL_62:
  if (self->_firstCoreDataContainerSetupErrorDomainHH2)
  {
    objc_msgSend(v9, "setFirstCoreDataContainerSetupErrorDomainHH2:");
    id v4 = v9;
  }
  if (*((unsigned char *)&self->_has + 1))
  {
    v4[9] = self->_firstCoreDataContainerSetupUnderlyingErrorCodeHH2;
    v4[48] |= 0x100uLL;
  }
  if (self->_firstCoreDataContainerSetupUnderlyingErrorDomainHH2)
  {
    objc_msgSend(v9, "setFirstCoreDataContainerSetupUnderlyingErrorDomainHH2:");
    id v4 = v9;
  }
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(void *)&has & 0x100000000) != 0)
  {
    PBDataWriterWriteUint64Field();
    $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
    if ((*(_DWORD *)&has & 0x8000000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_74;
    }
  }
  else if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteInt64Field();
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteInt64Field();
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteInt64Field();
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteInt64Field();
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteInt64Field();
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteInt64Field();
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteInt64Field();
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteInt64Field();
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteInt64Field();
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteInt64Field();
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteInt64Field();
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteInt64Field();
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteInt64Field();
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteInt64Field();
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteInt64Field();
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteInt64Field();
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_20:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteInt64Field();
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_21:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteInt32Field();
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteInt32Field();
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_23:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteInt32Field();
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_94:
  PBDataWriterWriteInt32Field();
  if ((*(void *)&self->_has & 0x800) != 0) {
LABEL_25:
  }
    PBDataWriterWriteInt64Field();
LABEL_26:
  if (self->_lastKnownStageErrorDomain) {
    PBDataWriterWriteStringField();
  }
  if (self->_lastKnownStageErrorString) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_lastKnownStageUnderlyingErrorDomain) {
    PBDataWriterWriteStringField();
  }
  $14E84874AB12F438965F2E1C57E118F4 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x1000000) != 0)
  {
    PBDataWriterWriteUint64Field();
    $14E84874AB12F438965F2E1C57E118F4 v5 = self->_has;
    if ((*(void *)&v5 & 0x1000000000) == 0)
    {
LABEL_36:
      if ((*(void *)&v5 & 0x2000000000) == 0) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
  }
  else if ((*(void *)&v5 & 0x1000000000) == 0)
  {
    goto LABEL_36;
  }
  PBDataWriterWriteInt32Field();
  if ((*(void *)&self->_has & 0x2000000000) != 0) {
LABEL_37:
  }
    PBDataWriterWriteInt32Field();
LABEL_38:
  if (self->_controllerSetupSessionIdentifier) {
    PBDataWriterWriteStringField();
  }
  $14E84874AB12F438965F2E1C57E118F4 v6 = self->_has;
  if ((*(void *)&v6 & 0x80000000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $14E84874AB12F438965F2E1C57E118F4 v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x8000) == 0)
    {
LABEL_42:
      if ((*(void *)&v6 & 0x20000000000) == 0) {
        goto LABEL_43;
      }
      goto LABEL_101;
    }
  }
  else if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
    goto LABEL_42;
  }
  PBDataWriterWriteInt64Field();
  $14E84874AB12F438965F2E1C57E118F4 v6 = self->_has;
  if ((*(void *)&v6 & 0x20000000000) == 0)
  {
LABEL_43:
    if ((*(void *)&v6 & 0x40000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteUint32Field();
  $14E84874AB12F438965F2E1C57E118F4 v6 = self->_has;
  if ((*(void *)&v6 & 0x40000000000) == 0)
  {
LABEL_44:
    if ((*(void *)&v6 & 0x10000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteUint32Field();
  $14E84874AB12F438965F2E1C57E118F4 v6 = self->_has;
  if ((*(void *)&v6 & 0x10000000000) == 0)
  {
LABEL_45:
    if ((*(void *)&v6 & 0x200000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteUint32Field();
  $14E84874AB12F438965F2E1C57E118F4 v6 = self->_has;
  if ((*(void *)&v6 & 0x200000000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
LABEL_104:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x2000) != 0) {
LABEL_47:
  }
    PBDataWriterWriteInt64Field();
LABEL_48:
  if (self->_lastPrimaryClientConnectMessageFailErrorDomainHH2) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2) {
    PBDataWriterWriteStringField();
  }
  $14E84874AB12F438965F2E1C57E118F4 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x800000) != 0)
  {
    PBDataWriterWriteInt64Field();
    $14E84874AB12F438965F2E1C57E118F4 v7 = self->_has;
    if ((*(_DWORD *)&v7 & 0x40000) == 0)
    {
LABEL_56:
      if ((*(_DWORD *)&v7 & 0x200000) == 0) {
        goto LABEL_57;
      }
      goto LABEL_108;
    }
  }
  else if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
    goto LABEL_56;
  }
  PBDataWriterWriteInt64Field();
  $14E84874AB12F438965F2E1C57E118F4 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
  {
LABEL_57:
    if ((*(_DWORD *)&v7 & 0x80000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteInt64Field();
  $14E84874AB12F438965F2E1C57E118F4 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_58:
    if ((*(unsigned char *)&v7 & 0x40) == 0) {
      goto LABEL_59;
    }
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteInt64Field();
  $14E84874AB12F438965F2E1C57E118F4 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x40) == 0)
  {
LABEL_59:
    if ((*(unsigned char *)&v7 & 0x80) == 0) {
      goto LABEL_61;
    }
    goto LABEL_60;
  }
LABEL_110:
  PBDataWriterWriteInt64Field();
  if ((*(void *)&self->_has & 0x80) != 0) {
LABEL_60:
  }
    PBDataWriterWriteInt64Field();
LABEL_61:
  if (self->_firstCoreDataContainerSetupErrorDomainHH2) {
    PBDataWriterWriteStringField();
  }
  if (*((unsigned char *)&self->_has + 1)) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_firstCoreDataContainerSetupUnderlyingErrorDomainHH2) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0) {
    PBDataWriterWriteInt64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryDiagnosticInfoProtoSetupInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(void *)&has & 0x100000000) != 0)
  {
    uint64_t v11 = [NSNumber numberWithUnsignedLongLong:self->_version];
    [v3 setObject:v11 forKey:@"version"];

    $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
    if ((*(_DWORD *)&has & 0x8000000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_40;
    }
  }
  else if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v12 = [NSNumber numberWithLongLong:self->_sessionSetupOpenMSHH1];
  [v3 setObject:v12 forKey:@"sessionSetupOpenMS_HH1"];

  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v13 = [NSNumber numberWithLongLong:self->_controllerKeyExchangeMSHH1];
  [v3 setObject:v13 forKey:@"controllerKeyExchangeMS_HH1"];

  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_42;
  }
LABEL_41:
  $14E84874AB12F438965F2E1C57E118F4 v14 = [NSNumber numberWithLongLong:self->_newAccessoryTransferMSHH1];
  [v3 setObject:v14 forKey:@"newAccessoryTransferMS_HH1"];

  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v15 = [NSNumber numberWithLongLong:self->_sessionSetupCloseMSHH1];
  [v3 setObject:v15 forKey:@"sessionSetupCloseMS_HH1"];

  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_44;
  }
LABEL_43:
  v16 = [NSNumber numberWithLongLong:self->_sentinelZoneFetchMSHH1];
  [v3 setObject:v16 forKey:@"sentinelZoneFetchMS_HH1"];

  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_45;
  }
LABEL_44:
  $14E84874AB12F438965F2E1C57E118F4 v17 = [NSNumber numberWithLongLong:self->_totalDurationMSHH1];
  [v3 setObject:v17 forKey:@"totalDurationMS_HH1"];

  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v18 = [NSNumber numberWithLongLong:self->_accountSettleWaitMSHH2];
  [v3 setObject:v18 forKey:@"accountSettleWaitMS_HH2"];

  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_47;
  }
LABEL_46:
  NSUInteger v19 = [NSNumber numberWithLongLong:self->_currentDeviceIDSWaitMSHH2];
  [v3 setObject:v19 forKey:@"currentDeviceIDSWaitMS_HH2"];

  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v20 = [NSNumber numberWithLongLong:self->_homeManagerReadyMSHH2];
  [v3 setObject:v20 forKey:@"homeManagerReadyMS_HH2"];

  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v21 = [NSNumber numberWithLongLong:self->_firstCoreDataImportMSHH2];
  [v3 setObject:v21 forKey:@"firstCoreDataImportMS_HH2"];

  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_50;
  }
LABEL_49:
  $14E84874AB12F438965F2E1C57E118F4 v22 = [NSNumber numberWithLongLong:self->_accessoryAddMSHH2];
  [v3 setObject:v22 forKey:@"accessoryAddMS_HH2"];

  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v23 = [NSNumber numberWithLongLong:self->_settingsCreationMSHH2];
  [v3 setObject:v23 forKey:@"settingsCreationMS_HH2"];

  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v24 = [NSNumber numberWithLongLong:self->_pairingIdentityCreationMSHH2];
  [v3 setObject:v24 forKey:@"pairingIdentityCreationMS_HH2"];

  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v25 = [NSNumber numberWithLongLong:self->_siriReadyMSHH2];
  [v3 setObject:v25 forKey:@"siriReadyMS_HH2"];

  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v26 = [NSNumber numberWithLongLong:self->_eventRouterServerConnectionMSHH2];
  [v3 setObject:v26 forKey:@"eventRouterServerConnectionMS_HH2"];

  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_55;
  }
LABEL_54:
  id v27 = [NSNumber numberWithLongLong:self->_primaryResidentElectionMSHH2];
  [v3 setObject:v27 forKey:@"primaryResidentElectionMS_HH2"];

  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v28 = [NSNumber numberWithLongLong:self->_eventRouterFirstEventPushMSHH2];
  [v3 setObject:v28 forKey:@"eventRouterFirstEventPushMS_HH2"];

  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_20:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v29 = [NSNumber numberWithLongLong:self->_totalDurationMSHH2];
  [v3 setObject:v29 forKey:@"totalDurationMS_HH2"];

  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_21:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_71;
  }
LABEL_57:
  int iCloudAvailableINT = self->_iCloudAvailableINT;
  if (iCloudAvailableINT)
  {
    if (iCloudAvailableINT == 1)
    {
      NSUInteger v31 = @"Good";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_iCloudAvailableINT);
      NSUInteger v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    NSUInteger v31 = @"Unknown";
  }
  [v3 setObject:v31 forKey:@"iCloudAvailable_INT"];

  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_125;
  }
LABEL_71:
  int iDSAvailableINT = self->_iDSAvailableINT;
  if (iDSAvailableINT)
  {
    if (iDSAvailableINT == 1)
    {
      uint64_t v38 = @"Good";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_iDSAvailableINT);
      uint64_t v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v38 = @"Unknown";
  }
  [v3 setObject:v38 forKey:@"IDSAvailable_INT"];

  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_23:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_131;
  }
LABEL_125:
  int manateeAvailableINT = self->_manateeAvailableINT;
  if (manateeAvailableINT)
  {
    if (manateeAvailableINT == 1)
    {
      v65 = @"Good";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_manateeAvailableINT);
      v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v65 = @"Unknown";
  }
  [v3 setObject:v65 forKey:@"manateeAvailable_INT"];

  $14E84874AB12F438965F2E1C57E118F4 has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_131:
  int networkAvailableINT = self->_networkAvailableINT;
  if (networkAvailableINT)
  {
    if (networkAvailableINT == 1)
    {
      v67 = @"Good";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_networkAvailableINT);
      v67 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v67 = @"Unknown";
  }
  [v3 setObject:v67 forKey:@"networkAvailable_INT"];

  if ((*(void *)&self->_has & 0x800) != 0)
  {
LABEL_25:
    $14E84874AB12F438965F2E1C57E118F4 v5 = [NSNumber numberWithLongLong:self->_lastKnownStageErrorCode];
    [v3 setObject:v5 forKey:@"lastKnownStageErrorCode"];
  }
LABEL_26:
  lastKnownStageErrorDomain = self->_lastKnownStageErrorDomain;
  if (lastKnownStageErrorDomain) {
    [v3 setObject:lastKnownStageErrorDomain forKey:@"lastKnownStageErrorDomain"];
  }
  lastKnownStageErrorString = self->_lastKnownStageErrorString;
  if (lastKnownStageErrorString) {
    [v3 setObject:lastKnownStageErrorString forKey:@"lastKnownStageErrorString"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    id v8 = [NSNumber numberWithLongLong:self->_lastKnownStageUnderlyingErrorCode];
    [v3 setObject:v8 forKey:@"lastKnownStageUnderlyingErrorCode"];
  }
  lastKnownStageUnderlyingErrorDomain = self->_lastKnownStageUnderlyingErrorDomain;
  if (lastKnownStageUnderlyingErrorDomain) {
    [v3 setObject:lastKnownStageUnderlyingErrorDomain forKey:@"lastKnownStageUnderlyingErrorDomain"];
  }
  $14E84874AB12F438965F2E1C57E118F4 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x1000000) != 0)
  {
    uint64_t v32 = [NSNumber numberWithUnsignedLongLong:self->_savedEventState];
    [v3 setObject:v32 forKey:@"savedEventState"];

    $14E84874AB12F438965F2E1C57E118F4 v10 = self->_has;
    if ((*(void *)&v10 & 0x1000000000) == 0)
    {
LABEL_36:
      if ((*(void *)&v10 & 0x2000000000) == 0) {
        goto LABEL_77;
      }
      goto LABEL_65;
    }
  }
  else if ((*(void *)&v10 & 0x1000000000) == 0)
  {
    goto LABEL_36;
  }
  uint64_t lastKnownControllerHH2Mode = self->_lastKnownControllerHH2Mode;
  if (lastKnownControllerHH2Mode >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_lastKnownControllerHH2Mode);
    NSUInteger v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSUInteger v34 = off_1E593E588[lastKnownControllerHH2Mode];
  }
  [v3 setObject:v34 forKey:@"lastKnownControllerHH2Mode"];

  if ((*(void *)&self->_has & 0x2000000000) != 0)
  {
LABEL_65:
    int lastKnownControllerSentinelZoneExistence = self->_lastKnownControllerSentinelZoneExistence;
    if (lastKnownControllerSentinelZoneExistence)
    {
      if (lastKnownControllerSentinelZoneExistence == 1)
      {
        uint64_t v36 = @"Good";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_lastKnownControllerSentinelZoneExistence);
        uint64_t v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v36 = @"Unknown";
    }
    [v3 setObject:v36 forKey:@"lastKnownControllerSentinelZoneExistence"];
  }
LABEL_77:
  controllerSetupSessionIdentifier = self->_controllerSetupSessionIdentifier;
  if (controllerSetupSessionIdentifier) {
    [v3 setObject:controllerSetupSessionIdentifier forKey:@"controllerSetupSessionIdentifier"];
  }
  $14E84874AB12F438965F2E1C57E118F4 v40 = self->_has;
  if ((*(void *)&v40 & 0x80000000000) != 0)
  {
    uint64_t v52 = [NSNumber numberWithUnsignedInt:self->_numberOfTimesPrimaryResidentChangedHH2];
    [v3 setObject:v52 forKey:@"numberOfTimesPrimaryResidentChanged_HH2"];

    $14E84874AB12F438965F2E1C57E118F4 v40 = self->_has;
    if ((*(_WORD *)&v40 & 0x8000) == 0)
    {
LABEL_81:
      if ((*(void *)&v40 & 0x20000000000) == 0) {
        goto LABEL_82;
      }
      goto LABEL_110;
    }
  }
  else if ((*(_WORD *)&v40 & 0x8000) == 0)
  {
    goto LABEL_81;
  }
  uint64_t v53 = [NSNumber numberWithLongLong:self->_lastPrimaryClientConnectedTimeHH2];
  [v3 setObject:v53 forKey:@"lastPrimaryClientConnectedTime_HH2"];

  $14E84874AB12F438965F2E1C57E118F4 v40 = self->_has;
  if ((*(void *)&v40 & 0x20000000000) == 0)
  {
LABEL_82:
    if ((*(void *)&v40 & 0x40000000000) == 0) {
      goto LABEL_83;
    }
    goto LABEL_111;
  }
LABEL_110:
  uint64_t v54 = [NSNumber numberWithUnsignedInt:self->_numberOfTimesPrimaryClientConnectedHH2];
  [v3 setObject:v54 forKey:@"numberOfTimesPrimaryClientConnected_HH2"];

  $14E84874AB12F438965F2E1C57E118F4 v40 = self->_has;
  if ((*(void *)&v40 & 0x40000000000) == 0)
  {
LABEL_83:
    if ((*(void *)&v40 & 0x10000000000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_112;
  }
LABEL_111:
  uint64_t v55 = [NSNumber numberWithUnsignedInt:self->_numberOfTimesPrimaryClientDisconnectedHH2];
  [v3 setObject:v55 forKey:@"numberOfTimesPrimaryClientDisconnected_HH2"];

  $14E84874AB12F438965F2E1C57E118F4 v40 = self->_has;
  if ((*(void *)&v40 & 0x10000000000) == 0)
  {
LABEL_84:
    if ((*(void *)&v40 & 0x200000000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_113;
  }
LABEL_112:
  uint64_t v56 = [NSNumber numberWithUnsignedInt:self->_numberOfTimesPrimaryClientConnectMessageFailedHH2];
  [v3 setObject:v56 forKey:@"numberOfTimesPrimaryClientConnectMessageFailed_HH2"];

  $14E84874AB12F438965F2E1C57E118F4 v40 = self->_has;
  if ((*(void *)&v40 & 0x200000000) == 0)
  {
LABEL_85:
    if ((*(_WORD *)&v40 & 0x2000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_86;
  }
LABEL_113:
  uint64_t v57 = [NSNumber numberWithUnsignedInt:self->_currentDeviceConfirmedPrimaryResidentINT];
  [v3 setObject:v57 forKey:@"currentDeviceConfirmedPrimaryResident_INT"];

  if ((*(void *)&self->_has & 0x2000) != 0)
  {
LABEL_86:
    uint64_t v41 = [NSNumber numberWithLongLong:self->_lastPrimaryClientConnectMessageFailErrorCodeHH2];
    [v3 setObject:v41 forKey:@"lastPrimaryClientConnectMessageFailErrorCode_HH2"];
  }
LABEL_87:
  lastPrimaryClientConnectMessageFailErrorDomainHH2 = self->_lastPrimaryClientConnectMessageFailErrorDomainHH2;
  if (lastPrimaryClientConnectMessageFailErrorDomainHH2) {
    [v3 setObject:lastPrimaryClientConnectMessageFailErrorDomainHH2 forKey:@"lastPrimaryClientConnectMessageFailErrorDomain_HH2"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    uint64_t v43 = [NSNumber numberWithLongLong:self->_lastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2];
    [v3 setObject:v43 forKey:@"lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2"];
  }
  lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2 = self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2;
  if (lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2) {
    [v3 setObject:lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2 forKey:@"lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2"];
  }
  $14E84874AB12F438965F2E1C57E118F4 v45 = self->_has;
  if ((*(_DWORD *)&v45 & 0x800000) != 0)
  {
    unint64_t v58 = [NSNumber numberWithLongLong:self->_primaryResidentElectionPeerDeviceFutureResolvedMSHH2];
    [v3 setObject:v58 forKey:@"primaryResidentElectionPeerDeviceFutureResolvedMS_HH2"];

    $14E84874AB12F438965F2E1C57E118F4 v45 = self->_has;
    if ((*(_DWORD *)&v45 & 0x40000) == 0)
    {
LABEL_95:
      if ((*(_DWORD *)&v45 & 0x200000) == 0) {
        goto LABEL_96;
      }
      goto LABEL_117;
    }
  }
  else if ((*(_DWORD *)&v45 & 0x40000) == 0)
  {
    goto LABEL_95;
  }
  v59 = [NSNumber numberWithLongLong:self->_primaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2];
  [v3 setObject:v59 forKey:@"primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2"];

  $14E84874AB12F438965F2E1C57E118F4 v45 = self->_has;
  if ((*(_DWORD *)&v45 & 0x200000) == 0)
  {
LABEL_96:
    if ((*(_DWORD *)&v45 & 0x400000) == 0) {
      goto LABEL_97;
    }
    goto LABEL_118;
  }
LABEL_117:
  v60 = [NSNumber numberWithLongLong:self->_primaryResidentElectionModernTransportStartedFutureResolvedMSHH2];
  [v3 setObject:v60 forKey:@"primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2"];

  $14E84874AB12F438965F2E1C57E118F4 v45 = self->_has;
  if ((*(_DWORD *)&v45 & 0x400000) == 0)
  {
LABEL_97:
    if ((*(_DWORD *)&v45 & 0x80000) == 0) {
      goto LABEL_98;
    }
    goto LABEL_119;
  }
LABEL_118:
  v61 = [NSNumber numberWithLongLong:self->_primaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2];
  [v3 setObject:v61 forKey:@"primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2"];

  $14E84874AB12F438965F2E1C57E118F4 v45 = self->_has;
  if ((*(_DWORD *)&v45 & 0x80000) == 0)
  {
LABEL_98:
    if ((*(unsigned char *)&v45 & 0x40) == 0) {
      goto LABEL_99;
    }
    goto LABEL_120;
  }
LABEL_119:
  v62 = [NSNumber numberWithLongLong:self->_primaryResidentElectionJoinMeshMSHH2];
  [v3 setObject:v62 forKey:@"primaryResidentElectionJoinMeshMS_HH2"];

  $14E84874AB12F438965F2E1C57E118F4 v45 = self->_has;
  if ((*(unsigned char *)&v45 & 0x40) == 0)
  {
LABEL_99:
    if ((*(unsigned char *)&v45 & 0x80) == 0) {
      goto LABEL_101;
    }
    goto LABEL_100;
  }
LABEL_120:
  v63 = [NSNumber numberWithLongLong:self->_firstCoreDataContainerSetupDurationMSHH2];
  [v3 setObject:v63 forKey:@"firstCoreDataContainerSetupDurationMS_HH2"];

  if ((*(void *)&self->_has & 0x80) != 0)
  {
LABEL_100:
    uint64_t v46 = [NSNumber numberWithLongLong:self->_firstCoreDataContainerSetupErrorCodeHH2];
    [v3 setObject:v46 forKey:@"firstCoreDataContainerSetupErrorCode_HH2"];
  }
LABEL_101:
  firstCoreDataContainerSetupErrorDomainHH2 = self->_firstCoreDataContainerSetupErrorDomainHH2;
  if (firstCoreDataContainerSetupErrorDomainHH2) {
    [v3 setObject:firstCoreDataContainerSetupErrorDomainHH2 forKey:@"firstCoreDataContainerSetupErrorDomain_HH2"];
  }
  if (*((unsigned char *)&self->_has + 1))
  {
    uint64_t v48 = [NSNumber numberWithLongLong:self->_firstCoreDataContainerSetupUnderlyingErrorCodeHH2];
    [v3 setObject:v48 forKey:@"firstCoreDataContainerSetupUnderlyingErrorCode_HH2"];
  }
  firstCoreDataContainerSetupUnderlyingErrorDomainHH2 = self->_firstCoreDataContainerSetupUnderlyingErrorDomainHH2;
  if (firstCoreDataContainerSetupUnderlyingErrorDomainHH2) {
    [v3 setObject:firstCoreDataContainerSetupUnderlyingErrorDomainHH2 forKey:@"firstCoreDataContainerSetupUnderlyingErrorDomain_HH2"];
  }
  id v50 = v3;

  return v50;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryDiagnosticInfoProtoSetupInfo;
  id v4 = [(HMAccessoryDiagnosticInfoProtoSetupInfo *)&v8 description];
  $14E84874AB12F438965F2E1C57E118F4 v5 = [(HMAccessoryDiagnosticInfoProtoSetupInfo *)self dictionaryRepresentation];
  $14E84874AB12F438965F2E1C57E118F4 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasFirstCoreDataContainerSetupUnderlyingErrorDomainHH2
{
  return self->_firstCoreDataContainerSetupUnderlyingErrorDomainHH2 != 0;
}

- (BOOL)hasFirstCoreDataContainerSetupUnderlyingErrorCodeHH2
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setHasFirstCoreDataContainerSetupUnderlyingErrorCodeHH2:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (void)setFirstCoreDataContainerSetupUnderlyingErrorCodeHH2:(int64_t)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_firstCoreDataContainerSetupUnderlyingErrorCodeHH2 = a3;
}

- (BOOL)hasFirstCoreDataContainerSetupErrorDomainHH2
{
  return self->_firstCoreDataContainerSetupErrorDomainHH2 != 0;
}

- (BOOL)hasFirstCoreDataContainerSetupErrorCodeHH2
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasFirstCoreDataContainerSetupErrorCodeHH2:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (void)setFirstCoreDataContainerSetupErrorCodeHH2:(int64_t)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_firstCoreDataContainerSetupErrorCodeHH2 = a3;
}

- (BOOL)hasFirstCoreDataContainerSetupDurationMSHH2
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasFirstCoreDataContainerSetupDurationMSHH2:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (void)setFirstCoreDataContainerSetupDurationMSHH2:(int64_t)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_firstCoreDataContainerSetupDurationMSHH2 = a3;
}

- (BOOL)hasPrimaryResidentElectionJoinMeshMSHH2
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHasPrimaryResidentElectionJoinMeshMSHH2:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (void)setPrimaryResidentElectionJoinMeshMSHH2:(int64_t)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_primaryResidentElectionJoinMeshMSHH2 = a3;
}

- (BOOL)hasPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHasPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (void)setPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2:(int64_t)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_primaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2 = a3;
}

- (BOOL)hasPrimaryResidentElectionModernTransportStartedFutureResolvedMSHH2
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHasPrimaryResidentElectionModernTransportStartedFutureResolvedMSHH2:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (void)setPrimaryResidentElectionModernTransportStartedFutureResolvedMSHH2:(int64_t)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_primaryResidentElectionModernTransportStartedFutureResolvedMSHH2 = a3;
}

- (BOOL)hasPrimaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHasPrimaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (void)setPrimaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2:(int64_t)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_primaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2 = a3;
}

- (BOOL)hasPrimaryResidentElectionPeerDeviceFutureResolvedMSHH2
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHasPrimaryResidentElectionPeerDeviceFutureResolvedMSHH2:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (void)setPrimaryResidentElectionPeerDeviceFutureResolvedMSHH2:(int64_t)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_primaryResidentElectionPeerDeviceFutureResolvedMSHH2 = a3;
}

- (BOOL)hasLastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2
{
  return self->_lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2 != 0;
}

- (BOOL)hasLastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHasLastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (void)setLastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2:(int64_t)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_lastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2 = a3;
}

- (BOOL)hasLastPrimaryClientConnectMessageFailErrorDomainHH2
{
  return self->_lastPrimaryClientConnectMessageFailErrorDomainHH2 != 0;
}

- (BOOL)hasLastPrimaryClientConnectMessageFailErrorCodeHH2
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHasLastPrimaryClientConnectMessageFailErrorCodeHH2:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (void)setLastPrimaryClientConnectMessageFailErrorCodeHH2:(int64_t)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_lastPrimaryClientConnectMessageFailErrorCodeHH2 = a3;
}

- (BOOL)hasCurrentDeviceConfirmedPrimaryResidentINT
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setHasCurrentDeviceConfirmedPrimaryResidentINT:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (void)setCurrentDeviceConfirmedPrimaryResidentINT:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_currentDeviceConfirmedPrimaryResidentINT = a3;
}

- (BOOL)hasNumberOfTimesPrimaryClientConnectMessageFailedHH2
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setHasNumberOfTimesPrimaryClientConnectMessageFailedHH2:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (void)setNumberOfTimesPrimaryClientConnectMessageFailedHH2:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_numberOfTimesPrimaryClientConnectMessageFailedHH2 = a3;
}

- (BOOL)hasNumberOfTimesPrimaryClientDisconnectedHH2
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setHasNumberOfTimesPrimaryClientDisconnectedHH2:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (void)setNumberOfTimesPrimaryClientDisconnectedHH2:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_numberOfTimesPrimaryClientDisconnectedHH2 = a3;
}

- (BOOL)hasNumberOfTimesPrimaryClientConnectedHH2
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setHasNumberOfTimesPrimaryClientConnectedHH2:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (void)setNumberOfTimesPrimaryClientConnectedHH2:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_numberOfTimesPrimaryClientConnectedHH2 = a3;
}

- (BOOL)hasLastPrimaryClientConnectedTimeHH2
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasLastPrimaryClientConnectedTimeHH2:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (void)setLastPrimaryClientConnectedTimeHH2:(int64_t)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_lastPrimaryClientConnectedTimeHH2 = a3;
}

- (BOOL)hasNumberOfTimesPrimaryResidentChangedHH2
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setHasNumberOfTimesPrimaryResidentChangedHH2:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (void)setNumberOfTimesPrimaryResidentChangedHH2:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_numberOfTimesPrimaryResidentChangedHH2 = a3;
}

- (BOOL)hasControllerSetupSessionIdentifier
{
  return self->_controllerSetupSessionIdentifier != 0;
}

- (int)StringAsLastKnownControllerSentinelZoneExistence:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Good"];
  }

  return v4;
}

- (id)lastKnownControllerSentinelZoneExistenceAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"Good";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"Unknown";
  }
  return v4;
}

- (BOOL)hasLastKnownControllerSentinelZoneExistence
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setHasLastKnownControllerSentinelZoneExistence:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (void)setLastKnownControllerSentinelZoneExistence:(int)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_int lastKnownControllerSentinelZoneExistence = a3;
}

- (int)lastKnownControllerSentinelZoneExistence
{
  if ((*((unsigned char *)&self->_has + 4) & 0x20) != 0) {
    return self->_lastKnownControllerSentinelZoneExistence;
  }
  else {
    return 0;
  }
}

- (int)StringAsLastKnownControllerHH2Mode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"HH1State"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HH2State"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)lastKnownControllerHH2ModeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E593E588[a3];
  }

  return v3;
}

- (BOOL)hasLastKnownControllerHH2Mode
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setHasLastKnownControllerHH2Mode:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (void)setLastKnownControllerHH2Mode:(int)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_uint64_t lastKnownControllerHH2Mode = a3;
}

- (int)lastKnownControllerHH2Mode
{
  if ((*((unsigned char *)&self->_has + 4) & 0x10) != 0) {
    return self->_lastKnownControllerHH2Mode;
  }
  else {
    return 0;
  }
}

- (BOOL)hasSavedEventState
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setHasSavedEventState:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (void)setSavedEventState:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_savedEventState = a3;
}

- (BOOL)hasLastKnownStageUnderlyingErrorDomain
{
  return self->_lastKnownStageUnderlyingErrorDomain != 0;
}

- (BOOL)hasLastKnownStageUnderlyingErrorCode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasLastKnownStageUnderlyingErrorCode:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (void)setLastKnownStageUnderlyingErrorCode:(int64_t)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_lastKnownStageUnderlyingErrorCode = a3;
}

- (BOOL)hasLastKnownStageErrorString
{
  return self->_lastKnownStageErrorString != 0;
}

- (BOOL)hasLastKnownStageErrorDomain
{
  return self->_lastKnownStageErrorDomain != 0;
}

- (BOOL)hasLastKnownStageErrorCode
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setHasLastKnownStageErrorCode:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (void)setLastKnownStageErrorCode:(int64_t)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_lastKnownStageErrorCode = a3;
}

- (int)StringAsNetworkAvailableINT:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Good"];
  }

  return v4;
}

- (id)networkAvailableINTAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"Good";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"Unknown";
  }
  return v4;
}

- (BOOL)hasNetworkAvailableINT
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setHasNetworkAvailableINT:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (void)setNetworkAvailableINT:(int)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_int networkAvailableINT = a3;
}

- (int)networkAvailableINT
{
  if ((*((unsigned char *)&self->_has + 4) & 0x80) != 0) {
    return self->_networkAvailableINT;
  }
  else {
    return 0;
  }
}

- (int)StringAsManateeAvailableINT:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Good"];
  }

  return v4;
}

- (id)manateeAvailableINTAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"Good";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"Unknown";
  }
  return v4;
}

- (BOOL)hasManateeAvailableINT
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setHasManateeAvailableINT:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (void)setManateeAvailableINT:(int)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_int manateeAvailableINT = a3;
}

- (int)manateeAvailableINT
{
  if ((*((unsigned char *)&self->_has + 4) & 0x40) != 0) {
    return self->_manateeAvailableINT;
  }
  else {
    return 0;
  }
}

- (int)StringAsIDSAvailableINT:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Good"];
  }

  return v4;
}

- (id)iDSAvailableINTAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"Good";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"Unknown";
  }
  return v4;
}

- (BOOL)hasIDSAvailableINT
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setHasIDSAvailableINT:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (void)setIDSAvailableINT:(int)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_int iDSAvailableINT = a3;
}

- (int)iDSAvailableINT
{
  if ((*((unsigned char *)&self->_has + 4) & 8) != 0) {
    return self->_iDSAvailableINT;
  }
  else {
    return 0;
  }
}

- (int)StringAsICloudAvailableINT:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Good"];
  }

  return v4;
}

- (id)iCloudAvailableINTAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"Good";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"Unknown";
  }
  return v4;
}

- (BOOL)hasICloudAvailableINT
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setHasICloudAvailableINT:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (void)setICloudAvailableINT:(int)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_int iCloudAvailableINT = a3;
}

- (int)iCloudAvailableINT
{
  if ((*((unsigned char *)&self->_has + 4) & 4) != 0) {
    return self->_iCloudAvailableINT;
  }
  else {
    return 0;
  }
}

- (BOOL)hasTotalDurationMSHH2
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setHasTotalDurationMSHH2:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (void)setTotalDurationMSHH2:(int64_t)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_totalDurationMSHH2 = a3;
}

- (BOOL)hasEventRouterFirstEventPushMSHH2
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasEventRouterFirstEventPushMSHH2:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (void)setEventRouterFirstEventPushMSHH2:(int64_t)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_eventRouterFirstEventPushMSHH2 = a3;
}

- (BOOL)hasPrimaryResidentElectionMSHH2
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHasPrimaryResidentElectionMSHH2:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (void)setPrimaryResidentElectionMSHH2:(int64_t)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_primaryResidentElectionMSHH2 = a3;
}

- (BOOL)hasEventRouterServerConnectionMSHH2
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasEventRouterServerConnectionMSHH2:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (void)setEventRouterServerConnectionMSHH2:(int64_t)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_eventRouterServerConnectionMSHH2 = a3;
}

- (BOOL)hasSiriReadyMSHH2
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setHasSiriReadyMSHH2:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (void)setSiriReadyMSHH2:(int64_t)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_siriReadyMSHH2 = a3;
}

- (BOOL)hasPairingIdentityCreationMSHH2
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHasPairingIdentityCreationMSHH2:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (void)setPairingIdentityCreationMSHH2:(int64_t)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_pairingIdentityCreationMSHH2 = a3;
}

- (BOOL)hasSettingsCreationMSHH2
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setHasSettingsCreationMSHH2:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (void)setSettingsCreationMSHH2:(int64_t)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_settingsCreationMSHH2 = a3;
}

- (BOOL)hasAccessoryAddMSHH2
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasAccessoryAddMSHH2:(BOOL)a3
{
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (void)setAccessoryAddMSHH2:(int64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_accessoryAddMSHH2 = a3;
}

- (BOOL)hasFirstCoreDataImportMSHH2
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setHasFirstCoreDataImportMSHH2:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (void)setFirstCoreDataImportMSHH2:(int64_t)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_firstCoreDataImportMSHH2 = a3;
}

- (BOOL)hasHomeManagerReadyMSHH2
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasHomeManagerReadyMSHH2:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (void)setHomeManagerReadyMSHH2:(int64_t)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_homeManagerReadyMSHH2 = a3;
}

- (BOOL)hasCurrentDeviceIDSWaitMSHH2
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasCurrentDeviceIDSWaitMSHH2:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (void)setCurrentDeviceIDSWaitMSHH2:(int64_t)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_currentDeviceIDSWaitMSHH2 = a3;
}

- (BOOL)hasAccountSettleWaitMSHH2
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasAccountSettleWaitMSHH2:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (void)setAccountSettleWaitMSHH2:(int64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_accountSettleWaitMSHH2 = a3;
}

- (BOOL)hasTotalDurationMSHH1
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setHasTotalDurationMSHH1:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (void)setTotalDurationMSHH1:(int64_t)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_totalDurationMSHH1 = a3;
}

- (BOOL)hasSentinelZoneFetchMSHH1
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setHasSentinelZoneFetchMSHH1:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (void)setSentinelZoneFetchMSHH1:(int64_t)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_sentinelZoneFetchMSHH1 = a3;
}

- (BOOL)hasSessionSetupCloseMSHH1
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setHasSessionSetupCloseMSHH1:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (void)setSessionSetupCloseMSHH1:(int64_t)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_sessionSetupCloseMSHH1 = a3;
}

- (BOOL)hasNewAccessoryTransferMSHH1
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setHasNewAccessoryTransferMSHH1:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (void)setNewAccessoryTransferMSHH1:(int64_t)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_newAccessoryTransferMSHH1 = a3;
}

- (BOOL)hasControllerKeyExchangeMSHH1
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasControllerKeyExchangeMSHH1:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (void)setControllerKeyExchangeMSHH1:(int64_t)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_controllerKeyExchangeMSHH1 = a3;
}

- (BOOL)hasSessionSetupOpenMSHH1
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setHasSessionSetupOpenMSHH1:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (void)setSessionSetupOpenMSHH1:(int64_t)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_sessionSetupOpenMSHH1 = a3;
}

- (BOOL)hasVersion
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setHasVersion:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_$14E84874AB12F438965F2E1C57E118F4 has = ($14E84874AB12F438965F2E1C57E118F4)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (void)setVersion:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_version = a3;
}

@end