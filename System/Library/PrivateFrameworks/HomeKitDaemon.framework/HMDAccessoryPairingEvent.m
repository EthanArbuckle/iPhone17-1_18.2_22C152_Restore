@interface HMDAccessoryPairingEvent
+ (id)logCategory;
+ (id)pairingAccessory:(id)a3 home:(id)a4 appIdentifier:(id)a5 retry:(BOOL)a6;
+ (id)pairingAccessoryWithDescription:(id)a3 home:(id)a4;
+ (id)removingAccessory:(id)a3 hapAccessory:(id)a4;
- (BOOL)_isMatterAccessory;
- (BOOL)accessorySupportsWoL;
- (BOOL)didUseOwnershipProof;
- (BOOL)didUseWiFiPPSK;
- (BOOL)hasResidentInHome;
- (BOOL)isAddOperation;
- (BOOL)isAddViaWAC;
- (BOOL)isBTCommissioned;
- (BOOL)isFirstHAPAccessoryInAnyHome;
- (BOOL)isFirstHAPAccessoryInHome;
- (BOOL)isMatterAccessory;
- (BOOL)isNetworkRouterAdd;
- (BOOL)isNetworkRouterReplace;
- (BOOL)isPrimaryResidentOnline;
- (BOOL)isSubmitting;
- (BOOL)isThreadAccessory;
- (BOOL)isWacLegacy;
- (BOOL)requiresMatterCustomCommissioningFlow;
- (BOOL)retry;
- (HMDAccessory)pairedAccessory;
- (HMDAccessoryMetricVendorDetails)vendorDetailsForReporting;
- (HMDAccessoryPairingEvent)initWithAccessoryDescription:(id)a3 home:(id)a4;
- (HMDAccessoryPairingEvent)initWithUnpairedAccessory:(id)a3 pairedAccessory:(id)a4 hapAccessory:(id)a5 appIdentifier:(id)a6 retry:(BOOL)a7 home:(id)a8 isAddOperation:(BOOL)a9 logEventStateManager:(id)a10;
- (HMDAccessoryPairingLogEventStateManager)logEventStateManager;
- (NSDate)endDate;
- (NSDate)residentConfirmationTimeStarted;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSDictionary)matterMetrics;
- (NSDictionary)mtrMetrics;
- (NSDictionary)vendorDetailsForCoreAnalytics;
- (NSError)threadCommissioningError;
- (NSString)accessoryAddRequestIdentifier;
- (NSString)accessoryCategory;
- (NSString)accessoryManufacturer;
- (NSString)accessoryModel;
- (NSString)accessoryServerIdentifier;
- (NSString)appIdentifier;
- (NSString)categoryType;
- (NSString)coreAnalyticsEventName;
- (NSString)lastAccessoryPairingState;
- (NSString)longestPairingState;
- (NSString)matterAccessorySourceErrorDomain;
- (NSString)matterSoftwareVersionString;
- (NSString)primaryServiceType;
- (NSString)productNumber;
- (NSUUID)accessoryUUID;
- (double)longestPairingProgressStateDurationInMilliseconds;
- (double)residentConfirmationDurationInSeconds;
- (double)threadCommissioningDuration;
- (id)residentConfirmationToString:(int64_t)a3;
- (int)btAudioTask;
- (int)btLoad;
- (int)btNonAudioTask;
- (int)currentWiFiBand;
- (int64_t)certificationStatus;
- (int64_t)communicationProtocol;
- (int64_t)hmdAccessoryPairingEventResidentConfirmation;
- (int64_t)linkType;
- (int64_t)retryCount;
- (unint64_t)authMethod;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)matterAccessoryPairingStep;
- (unint64_t)pairingUIState;
- (unint64_t)previousRecoveryType;
- (unint64_t)recoveryType;
- (unint64_t)userPrivilege;
- (unsigned)threadCapabilities;
- (unsigned)threadStatus;
- (void)_setBtLoad;
- (void)_updateThreadPropertiesWithPairedAccessory:(id)a3;
- (void)markEndTime;
- (void)pairedToServer:(id)a3 certificationStatus:(int64_t)a4 addedViaWAC:(BOOL)a5 legacyWAC:(BOOL)a6;
- (void)prepareForObservation;
- (void)setAccessoryAddRequestIdentifier:(id)a3;
- (void)setAccessoryCategory:(id)a3;
- (void)setAccessoryManufacturer:(id)a3;
- (void)setAccessoryModel:(id)a3;
- (void)setAccessoryServerIdentifier:(id)a3;
- (void)setAccessoryUUID:(id)a3;
- (void)setAddViaWAC:(BOOL)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setAuthMethod:(unint64_t)a3;
- (void)setBtCommissioned:(BOOL)a3;
- (void)setCertificationStatus:(int64_t)a3;
- (void)setCommunicationProtocol:(int64_t)a3;
- (void)setCurrentWiFiBand:(int)a3;
- (void)setFirstHAPAccessoryInAnyHome:(BOOL)a3;
- (void)setFirstHAPAccessoryInHome:(BOOL)a3;
- (void)setHmdAccessoryPairingEventResidentConfirmation:(int64_t)a3;
- (void)setLastAccessoryPairingState:(id)a3;
- (void)setLinkType:(int64_t)a3;
- (void)setLongestPairingProgressStateDurationInMilliseconds:(double)a3;
- (void)setLongestPairingState:(id)a3;
- (void)setMatterAccessoryPairingStep:(unint64_t)a3;
- (void)setMatterAccessorySourceErrorDomain:(id)a3;
- (void)setMatterMetrics:(id)a3;
- (void)setMatterSoftwareVersionString:(id)a3;
- (void)setMtrMetrics:(id)a3;
- (void)setNetworkRouterAdd:(BOOL)a3;
- (void)setNetworkRouterReplace:(BOOL)a3;
- (void)setPairedAccessory:(id)a3;
- (void)setPairingUIState:(unint64_t)a3;
- (void)setPreviousRecoveryType:(unint64_t)a3;
- (void)setPrimaryServiceType:(id)a3;
- (void)setRecoveryType:(unint64_t)a3;
- (void)setRetry:(BOOL)a3;
- (void)setRetryCount:(int64_t)a3;
- (void)setSubmitting:(BOOL)a3;
- (void)setThreadAccessory:(BOOL)a3;
- (void)setThreadCapabilities:(unsigned int)a3;
- (void)setThreadCommissioningDuration:(double)a3;
- (void)setThreadCommissioningError:(id)a3;
- (void)setThreadStatus:(unsigned int)a3;
- (void)setUsedOwnershipProof:(BOOL)a3;
- (void)setUsedWiFiPPSK:(BOOL)a3;
- (void)setVendorDetailsForCoreAnalytics:(id)a3;
- (void)setVendorDetailsForReporting:(id)a3;
- (void)setWacLegacy:(BOOL)a3;
- (void)updateEventPropertiesWithHAPAccessory:(id)a3;
- (void)updateEventPropertiesWithPairedAccessory:(id)a3;
- (void)updateResidentConfirmationDurationWithConfirmation:(int64_t)a3;
@end

@implementation HMDAccessoryPairingEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_vendorDetailsForCoreAnalytics, 0);
  objc_storeStrong((id *)&self->_mtrMetrics, 0);
  objc_storeStrong((id *)&self->_matterAccessorySourceErrorDomain, 0);
  objc_storeStrong((id *)&self->_logEventStateManager, 0);
  objc_storeStrong((id *)&self->_matterSoftwareVersionString, 0);
  objc_storeStrong((id *)&self->_matterMetrics, 0);
  objc_storeStrong((id *)&self->_productNumber, 0);
  objc_storeStrong((id *)&self->_categoryType, 0);
  objc_storeStrong((id *)&self->_longestPairingState, 0);
  objc_storeStrong((id *)&self->_lastAccessoryPairingState, 0);
  objc_storeStrong((id *)&self->_residentConfirmationTimeStarted, 0);
  objc_storeStrong((id *)&self->_threadCommissioningError, 0);
  objc_storeStrong((id *)&self->_vendorDetailsForReporting, 0);
  objc_storeStrong((id *)&self->_primaryServiceType, 0);
  objc_storeStrong((id *)&self->_accessoryCategory, 0);
  objc_storeStrong((id *)&self->_accessoryManufacturer, 0);
  objc_storeStrong((id *)&self->_accessoryModel, 0);
  objc_storeStrong((id *)&self->_pairedAccessory, 0);
  objc_storeStrong((id *)&self->_accessoryAddRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryServerIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
}

- (void)setRetry:(BOOL)a3
{
  self->_retry = a3;
}

- (BOOL)retry
{
  return self->_retry;
}

- (void)setAppIdentifier:(id)a3
{
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setVendorDetailsForCoreAnalytics:(id)a3
{
}

- (NSDictionary)vendorDetailsForCoreAnalytics
{
  return self->_vendorDetailsForCoreAnalytics;
}

- (unint64_t)userPrivilege
{
  return self->_userPrivilege;
}

- (void)setCurrentWiFiBand:(int)a3
{
  self->_currentWiFiBand = a3;
}

- (void)setSubmitting:(BOOL)a3
{
  self->_submitting = a3;
}

- (BOOL)isSubmitting
{
  return self->_submitting;
}

- (void)setMtrMetrics:(id)a3
{
}

- (NSDictionary)mtrMetrics
{
  return self->_mtrMetrics;
}

- (void)setMatterAccessorySourceErrorDomain:(id)a3
{
}

- (NSString)matterAccessorySourceErrorDomain
{
  return self->_matterAccessorySourceErrorDomain;
}

- (void)setMatterAccessoryPairingStep:(unint64_t)a3
{
  self->_matterAccessoryPairingStep = a3;
}

- (unint64_t)matterAccessoryPairingStep
{
  return self->_matterAccessoryPairingStep;
}

- (HMDAccessoryPairingLogEventStateManager)logEventStateManager
{
  return self->_logEventStateManager;
}

- (void)setPreviousRecoveryType:(unint64_t)a3
{
  self->_previousRecoveryType = a3;
}

- (unint64_t)previousRecoveryType
{
  return self->_previousRecoveryType;
}

- (void)setRecoveryType:(unint64_t)a3
{
  self->_recoveryType = a3;
}

- (unint64_t)recoveryType
{
  return self->_recoveryType;
}

- (void)setPairingUIState:(unint64_t)a3
{
  self->_pairingUIState = a3;
}

- (unint64_t)pairingUIState
{
  return self->_pairingUIState;
}

- (int)btNonAudioTask
{
  return self->_btNonAudioTask;
}

- (int)btLoad
{
  return self->_btLoad;
}

- (int)btAudioTask
{
  return self->_btAudioTask;
}

- (BOOL)accessorySupportsWoL
{
  return self->_accessorySupportsWoL;
}

- (BOOL)hasResidentInHome
{
  return self->_hasResidentInHome;
}

- (BOOL)isPrimaryResidentOnline
{
  return self->_isPrimaryResidentOnline;
}

- (void)setMatterSoftwareVersionString:(id)a3
{
}

- (NSString)matterSoftwareVersionString
{
  return self->_matterSoftwareVersionString;
}

- (void)setMatterMetrics:(id)a3
{
}

- (NSDictionary)matterMetrics
{
  return self->_matterMetrics;
}

- (BOOL)requiresMatterCustomCommissioningFlow
{
  return self->_requiresMatterCustomCommissioningFlow;
}

- (NSString)productNumber
{
  return self->_productNumber;
}

- (NSString)categoryType
{
  return self->_categoryType;
}

- (void)setLongestPairingProgressStateDurationInMilliseconds:(double)a3
{
  self->_longestPairingProgressStateDurationInMilliseconds = a3;
}

- (double)longestPairingProgressStateDurationInMilliseconds
{
  return self->_longestPairingProgressStateDurationInMilliseconds;
}

- (void)setLongestPairingState:(id)a3
{
}

- (NSString)longestPairingState
{
  return self->_longestPairingState;
}

- (void)setLastAccessoryPairingState:(id)a3
{
}

- (NSString)lastAccessoryPairingState
{
  return self->_lastAccessoryPairingState;
}

- (double)residentConfirmationDurationInSeconds
{
  return self->_residentConfirmationDurationInSeconds;
}

- (NSDate)residentConfirmationTimeStarted
{
  return self->_residentConfirmationTimeStarted;
}

- (int64_t)hmdAccessoryPairingEventResidentConfirmation
{
  return self->_hmdAccessoryPairingEventResidentConfirmation;
}

- (void)setThreadStatus:(unsigned int)a3
{
  self->_threadStatus = a3;
}

- (unsigned)threadStatus
{
  return self->_threadStatus;
}

- (void)setThreadCapabilities:(unsigned int)a3
{
  self->_threadCapabilities = a3;
}

- (unsigned)threadCapabilities
{
  return self->_threadCapabilities;
}

- (void)setThreadCommissioningDuration:(double)a3
{
  self->_threadCommissioningDuration = a3;
}

- (double)threadCommissioningDuration
{
  return self->_threadCommissioningDuration;
}

- (void)setThreadCommissioningError:(id)a3
{
}

- (NSError)threadCommissioningError
{
  return self->_threadCommissioningError;
}

- (void)setBtCommissioned:(BOOL)a3
{
  self->_btCommissioned = a3;
}

- (BOOL)isBTCommissioned
{
  return self->_btCommissioned;
}

- (void)setThreadAccessory:(BOOL)a3
{
  self->_threadAccessory = a3;
}

- (BOOL)isThreadAccessory
{
  return self->_threadAccessory;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setFirstHAPAccessoryInAnyHome:(BOOL)a3
{
  self->_firstHAPAccessoryInAnyHome = a3;
}

- (BOOL)isFirstHAPAccessoryInAnyHome
{
  return self->_firstHAPAccessoryInAnyHome;
}

- (void)setFirstHAPAccessoryInHome:(BOOL)a3
{
  self->_firstHAPAccessoryInHome = a3;
}

- (BOOL)isFirstHAPAccessoryInHome
{
  return self->_firstHAPAccessoryInHome;
}

- (void)setNetworkRouterReplace:(BOOL)a3
{
  self->_networkRouterReplace = a3;
}

- (BOOL)isNetworkRouterReplace
{
  return self->_networkRouterReplace;
}

- (void)setNetworkRouterAdd:(BOOL)a3
{
  self->_networkRouterAdd = a3;
}

- (BOOL)isNetworkRouterAdd
{
  return self->_networkRouterAdd;
}

- (void)setUsedOwnershipProof:(BOOL)a3
{
  self->_usedOwnershipProof = a3;
}

- (BOOL)didUseOwnershipProof
{
  return self->_usedOwnershipProof;
}

- (void)setUsedWiFiPPSK:(BOOL)a3
{
  self->_usedWiFiPPSK = a3;
}

- (BOOL)didUseWiFiPPSK
{
  return self->_usedWiFiPPSK;
}

- (void)setAuthMethod:(unint64_t)a3
{
  self->_authMethod = a3;
}

- (unint64_t)authMethod
{
  return self->_authMethod;
}

- (void)setWacLegacy:(BOOL)a3
{
  self->_wacLegacy = a3;
}

- (BOOL)isWacLegacy
{
  return self->_wacLegacy;
}

- (void)setAddViaWAC:(BOOL)a3
{
  self->_addViaWAC = a3;
}

- (BOOL)isAddViaWAC
{
  return self->_addViaWAC;
}

- (BOOL)isAddOperation
{
  return self->_addOperation;
}

- (void)setCertificationStatus:(int64_t)a3
{
  self->_certificationStatus = a3;
}

- (int64_t)certificationStatus
{
  return self->_certificationStatus;
}

- (void)setCommunicationProtocol:(int64_t)a3
{
  self->_communicationProtocol = a3;
}

- (int64_t)communicationProtocol
{
  return self->_communicationProtocol;
}

- (void)setLinkType:(int64_t)a3
{
  self->_linkType = a3;
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (void)setVendorDetailsForReporting:(id)a3
{
}

- (HMDAccessoryMetricVendorDetails)vendorDetailsForReporting
{
  return self->_vendorDetailsForReporting;
}

- (void)setPrimaryServiceType:(id)a3
{
}

- (NSString)primaryServiceType
{
  return self->_primaryServiceType;
}

- (void)setAccessoryCategory:(id)a3
{
}

- (NSString)accessoryCategory
{
  return self->_accessoryCategory;
}

- (void)setAccessoryManufacturer:(id)a3
{
}

- (NSString)accessoryManufacturer
{
  return self->_accessoryManufacturer;
}

- (void)setAccessoryModel:(id)a3
{
}

- (NSString)accessoryModel
{
  return self->_accessoryModel;
}

- (void)setPairedAccessory:(id)a3
{
}

- (HMDAccessory)pairedAccessory
{
  return (HMDAccessory *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAccessoryAddRequestIdentifier:(id)a3
{
}

- (NSString)accessoryAddRequestIdentifier
{
  return self->_accessoryAddRequestIdentifier;
}

- (void)setAccessoryServerIdentifier:(id)a3
{
}

- (NSString)accessoryServerIdentifier
{
  return self->_accessoryServerIdentifier;
}

- (void)setAccessoryUUID:(id)a3
{
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (void)setHmdAccessoryPairingEventResidentConfirmation:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      if (self->_hmdAccessoryPairingEventResidentConfirmation != 2)
      {
        [(HMDAccessoryPairingEvent *)self updateResidentConfirmationDurationWithConfirmation:3];
        self->_hmdAccessoryPairingEventResidentConfirmation = 3;
      }
      break;
    case 2:
      -[HMDAccessoryPairingEvent updateResidentConfirmationDurationWithConfirmation:](self, "updateResidentConfirmationDurationWithConfirmation:");
      self->_hmdAccessoryPairingEventResidentConfirmation = 2;
      break;
    case 1:
      v4 = [MEMORY[0x263EFF910] date];
      residentConfirmationTimeStarted = self->_residentConfirmationTimeStarted;
      self->_residentConfirmationTimeStarted = v4;

      self->_hmdAccessoryPairingEventResidentConfirmation = 1;
      break;
  }
}

- (id)residentConfirmationToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"HMDAccessoryPairingEventResidentConfirmationNotSet";
  }
  else {
    return off_264A1E868[a3 - 1];
  }
}

- (void)updateResidentConfirmationDurationWithConfirmation:(int64_t)a3
{
  if (self->_residentConfirmationTimeStarted)
  {
    objc_msgSend(MEMORY[0x263EFF910], "date", a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 timeIntervalSinceDate:self->_residentConfirmationTimeStarted];
    self->_residentConfirmationDurationInSeconds = v4;
    residentConfirmationTimeStarted = self->_residentConfirmationTimeStarted;
    self->_residentConfirmationTimeStarted = 0;
  }
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  double v4 = [(HMDAccessoryPairingEvent *)self vendorDetailsForReporting];
  v5 = [v4 manufacturer];
  [v3 setObject:v5 forKeyedSubscript:@"accessoryManufacturer"];

  id v6 = [(HMDAccessoryPairingEvent *)self vendorDetailsForReporting];
  v7 = [v6 model];
  [v3 setObject:v7 forKeyedSubscript:@"accessoryModel"];

  v8 = [(HMDAccessoryPairingEvent *)self vendorDetailsForReporting];
  v9 = [v8 category];
  [v3 setObject:v9 forKeyedSubscript:@"accessoryCategory"];

  v10 = [(HMDAccessoryPairingEvent *)self vendorDetailsForReporting];
  v11 = [v10 firmwareVersion];
  [v3 setObject:v11 forKeyedSubscript:@"accessoryFirmwareVersion"];

  v12 = [(HMDAccessoryPairingEvent *)self vendorDetailsForReporting];
  v13 = [v12 productData];
  [v3 setObject:v13 forKeyedSubscript:@"accessoryProductData"];

  v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAccessoryPairingEvent certificationStatus](self, "certificationStatus"));
  [v3 setObject:v14 forKeyedSubscript:@"accessoryCertificationStatus"];

  v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAccessoryPairingEvent communicationProtocol](self, "communicationProtocol"));
  [v3 setObject:v15 forKeyedSubscript:@"accessoryCommunicationProtocol"];

  v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAccessoryPairingEvent linkType](self, "linkType"));
  [v3 setObject:v16 forKeyedSubscript:@"accessoryTransportType"];

  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessoryPairingEvent authMethod](self, "authMethod"));
  [v3 setObject:v17 forKeyedSubscript:@"authenticationMethod"];

  v18 = [(HMDAccessoryPairingEvent *)self appIdentifier];
  if (+[HMDMetricsUtilities shouldRedactBundleID:v18])
  {
    [v3 setObject:@"Third-party app" forKeyedSubscript:@"appIdentifier"];
  }
  else
  {
    v19 = [(HMDAccessoryPairingEvent *)self appIdentifier];
    [v3 setObject:v19 forKeyedSubscript:@"appIdentifier"];
  }
  v20 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  [v3 setObject:v20 forKeyedSubscript:@"pairingDuration"];

  v21 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessoryPairingEvent isAddOperation](self, "isAddOperation"));
  [v3 setObject:v21 forKeyedSubscript:@"isAdd"];

  v22 = NSNumber;
  v23 = [(HMMLogEvent *)self error];
  v24 = objc_msgSend(v22, "numberWithInteger:", objc_msgSend(v23, "code"));
  [v3 setObject:v24 forKeyedSubscript:@"errorCode"];

  v25 = [(HMMLogEvent *)self error];
  v26 = [v25 domain];
  [v3 setObject:v26 forKeyedSubscript:@"errorDomain"];

  if ([(HMDAccessoryPairingEvent *)self _isMatterAccessory])
  {
    v27 = [(HMDAccessoryPairingEvent *)self matterAccessorySourceErrorDomain];
    v28 = [(HMDAccessoryPairingEvent *)self mtrMetrics];
    v84[0] = MEMORY[0x263EF8330];
    v84[1] = 3221225472;
    v84[2] = __56__HMDAccessoryPairingEvent_coreAnalyticsEventDictionary__block_invoke;
    v84[3] = &unk_264A1E848;
    id v85 = v3;
    [v28 enumerateKeysAndObjectsUsingBlock:v84];

    v29 = 0;
    goto LABEL_16;
  }
  v27 = [(HMMLogEvent *)self error];
  if (!v27)
  {
    v31 = 0;
    goto LABEL_12;
  }
  v30 = [(HMMLogEvent *)self error];
  v31 = getLowestError();

  if (v31)
  {
    uint64_t v32 = [v31 code];
    v33 = [(HMMLogEvent *)self error];
    if (v32 == [v33 code])
    {
      v34 = [v31 domain];
      v35 = [(HMMLogEvent *)self error];
      v36 = [v35 domain];
      char v37 = [v34 isEqualToString:v36];

      if (v37) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    v29 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v31, "code"));
    v27 = [v31 domain];
    goto LABEL_15;
  }
LABEL_10:
  v27 = 0;
LABEL_12:
  v29 = 0;
LABEL_15:
  v38 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAccessoryPairingEvent retryCount](self, "retryCount"));
  [v3 setObject:v38 forKeyedSubscript:@"retryCount"];

LABEL_16:
  [v3 setObject:v29 forKeyedSubscript:@"underlyingErrorCode"];
  [v3 setObject:v27 forKeyedSubscript:@"underlyingErrorDomain"];
  v39 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessoryPairingEvent didUseWiFiPPSK](self, "didUseWiFiPPSK"));
  [v3 setObject:v39 forKeyedSubscript:@"usedWifiPPSK"];

  if ([(HMDAccessoryPairingEvent *)self isAddOperation])
  {
    v40 = NSNumber;
    if ([(HMDAccessoryPairingEvent *)self isAddViaWAC]) {
      BOOL v41 = [(HMDAccessoryPairingEvent *)self isWacLegacy];
    }
    else {
      BOOL v41 = 0;
    }
    v42 = [v40 numberWithInt:v41];
    [v3 setObject:v42 forKeyedSubscript:@"isAddedViaLegacyWAC"];

    v43 = NSNumber;
    if ([(HMDAccessoryPairingEvent *)self isAddViaWAC]) {
      uint64_t v44 = [(HMDAccessoryPairingEvent *)self isWacLegacy] ^ 1;
    }
    else {
      uint64_t v44 = 0;
    }
    v45 = [v43 numberWithInt:v44];
    [v3 setObject:v45 forKeyedSubscript:@"isAddedViaSecureWAC"];

    v46 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessoryPairingEvent didUseOwnershipProof](self, "didUseOwnershipProof"));
    [v3 setObject:v46 forKeyedSubscript:@"isAddedWithWACOwnershipProof"];

    v47 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessoryPairingEvent isFirstHAPAccessoryInAnyHome](self, "isFirstHAPAccessoryInAnyHome"));
    [v3 setObject:v47 forKeyedSubscript:@"firstHAPAccessoryForUser"];

    v48 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessoryPairingEvent isFirstHAPAccessoryInHome](self, "isFirstHAPAccessoryInHome"));
    [v3 setObject:v48 forKeyedSubscript:@"firstHAPAccessoryInHome"];
  }
  if ([(HMDAccessoryPairingEvent *)self isNetworkRouterAdd])
  {
    v49 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessoryPairingEvent isNetworkRouterReplace](self, "isNetworkRouterReplace"));
    [v3 setObject:v49 forKeyedSubscript:@"isNetworkRouterReplace"];
  }
  v50 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessoryPairingEvent isThreadAccessory](self, "isThreadAccessory"));
  [v3 setObject:v50 forKeyedSubscript:@"isThreadAccessory"];

  if ([(HMDAccessoryPairingEvent *)self isThreadAccessory])
  {
    v51 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessoryPairingEvent isBTCommissioned](self, "isBTCommissioned"));
    [v3 setObject:v51 forKeyedSubscript:@"threadOnboardIsBTCommissioned"];

    v52 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HMDAccessoryPairingEvent threadStatus](self, "threadStatus"));
    [v3 setObject:v52 forKeyedSubscript:@"threadStatus"];

    v53 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HMDAccessoryPairingEvent threadCapabilities](self, "threadCapabilities"));
    [v3 setObject:v53 forKeyedSubscript:@"threadCapabilities"];

    v54 = NSNumber;
    [(HMDAccessoryPairingEvent *)self threadCommissioningDuration];
    v55 = objc_msgSend(v54, "numberWithDouble:");
    [v3 setObject:v55 forKeyedSubscript:@"threadOnboardDuration"];

    v56 = NSNumber;
    v57 = [(HMDAccessoryPairingEvent *)self threadCommissioningError];
    v58 = objc_msgSend(v56, "numberWithInteger:", objc_msgSend(v57, "code"));
    [v3 setObject:v58 forKeyedSubscript:@"threadCommissioningErrorCode"];

    v59 = [(HMDAccessoryPairingEvent *)self threadCommissioningError];
    v60 = [v59 domain];
    [v3 setObject:v60 forKeyedSubscript:@"threadCommissioningErrorDomain"];
  }
  if ([(HMDAccessoryPairingEvent *)self isAddOperation])
  {
    v61 = [(HMDAccessoryPairingEvent *)self lastAccessoryPairingState];
    [v3 setObject:v61 forKeyedSubscript:@"lastPairingState"];

    v62 = [(HMDAccessoryPairingEvent *)self longestPairingState];
    [v3 setObject:v62 forKeyedSubscript:@"longestState"];

    v63 = NSNumber;
    [(HMDAccessoryPairingEvent *)self longestPairingProgressStateDurationInMilliseconds];
    v64 = objc_msgSend(v63, "numberWithDouble:");
    [v3 setObject:v64 forKeyedSubscript:@"longestStateDuration"];
  }
  v65 = [(HMDAccessoryPairingEvent *)self matterMetrics];

  if (v65)
  {
    v66 = [(HMDAccessoryPairingEvent *)self matterMetrics];
    [v3 addEntriesFromDictionary:v66];

    [(HMDAccessoryPairingEvent *)self setMatterMetrics:0];
  }
  if ([(HMDAccessoryPairingEvent *)self hmdAccessoryPairingEventResidentConfirmation])
  {
    v67 = [(HMDAccessoryPairingEvent *)self residentConfirmationToString:[(HMDAccessoryPairingEvent *)self hmdAccessoryPairingEventResidentConfirmation]];
    [v3 setObject:v67 forKeyedSubscript:@"HMDAccessoryPairingEventResidentConfirmationState"];

    v68 = NSNumber;
    [(HMDAccessoryPairingEvent *)self residentConfirmationDurationInSeconds];
    v69 = objc_msgSend(v68, "numberWithDouble:");
    [v3 setObject:v69 forKeyedSubscript:@"HMDAccessoryPairingEventResidentConfirmationDurationInSeconds"];
  }
  v70 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessoryPairingEvent retry](self, "retry"));
  [v3 setObject:v70 forKeyedSubscript:@"HMDAccessoryPairingEventRetry"];

  v71 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessoryPairingEvent recoveryType](self, "recoveryType"));
  [v3 setObject:v71 forKeyedSubscript:@"HMDAccessoryPairingEventRecoveryType"];

  v72 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessoryPairingEvent previousRecoveryType](self, "previousRecoveryType"));
  [v3 setObject:v72 forKeyedSubscript:@"HMDAccessoryPairingEventPreviousRecoveryType"];

  v73 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessoryPairingEvent isPrimaryResidentOnline](self, "isPrimaryResidentOnline"));
  [v3 setObject:v73 forKeyedSubscript:@"isPrimaryResidentOnline"];

  v74 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessoryPairingEvent hasResidentInHome](self, "hasResidentInHome"));
  [v3 setObject:v74 forKeyedSubscript:@"hasResidentInHome"];

  v75 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDAccessoryPairingEvent btLoad](self, "btLoad"));
  [v3 setObject:v75 forKeyedSubscript:@"btLoad"];

  v76 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDAccessoryPairingEvent btAudioTask](self, "btAudioTask"));
  [v3 setObject:v76 forKeyedSubscript:@"btAudioTask"];

  v77 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDAccessoryPairingEvent btNonAudioTask](self, "btNonAudioTask"));
  [v3 setObject:v77 forKeyedSubscript:@"btNonAudioTask"];

  if ([(HMDAccessoryPairingEvent *)self _isMatterAccessory])
  {
    v78 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HMDAccessoryPairingEvent currentWiFiBand](self, "currentWiFiBand"));
    [v3 setObject:v78 forKeyedSubscript:@"currentWiFiBand"];

    v79 = HMDMatterAccessoryPairingStepAsString([(HMDAccessoryPairingEvent *)self matterAccessoryPairingStep]);
    [v3 setObject:v79 forKeyedSubscript:@"currentPairingStep"];

    v80 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessoryPairingEvent userPrivilege](self, "userPrivilege"));
    v81 = @"userPrivilege";
  }
  else
  {
    v80 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessoryPairingEvent pairingUIState](self, "pairingUIState"));
    v81 = @"HMDAccessoryPairingEventUIState";
  }
  [v3 setObject:v80 forKeyedSubscript:v81];

  v82 = (void *)[v3 copy];
  return (NSDictionary *)v82;
}

void __56__HMDAccessoryPairingEvent_coreAnalyticsEventDictionary__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = NSString;
  id v6 = a3;
  id v7 = [v5 stringWithFormat:@"mtr_%@", a2];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.AccessoryPairingEvent";
}

- (void)prepareForObservation
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  v76.receiver = self;
  v76.super_class = (Class)HMDAccessoryPairingEvent;
  [(HMMLogEvent *)&v76 prepareForObservation];
  if ([(HMDAccessoryPairingEvent *)self _isMatterAccessory])
  {
    v3 = [HMDAccessoryMetricVendorDetails alloc];
    double v4 = [(HMDAccessoryPairingEvent *)self accessoryManufacturer];
    v5 = [(HMDAccessoryPairingEvent *)self accessoryModel];
    id v6 = [(HMDAccessoryPairingEvent *)self matterSoftwareVersionString];
    id v7 = [(HMDAccessoryPairingEvent *)self accessoryCategory];
    v8 = [(HMDAccessoryMetricVendorDetails *)v3 initWithProductData:0 manufacturer:v4 model:v5 firmwareVersion:v6 category:v7 differentiationNumber:0];
    [(HMDAccessoryPairingEvent *)self setVendorDetailsForReporting:v8];
    goto LABEL_11;
  }
  v9 = +[HMDVendorDataManager sharedVendorDataManager];
  v10 = [(HMDAccessoryPairingEvent *)self accessoryManufacturer];
  v11 = [(HMDAccessoryPairingEvent *)self accessoryModel];
  double v4 = [v9 vendorModelEntryForManufacturer:v10 model:v11];

  v5 = [(HMDAccessoryPairingEvent *)self vendorDetailsForReporting];
  id v6 = [v5 productData];
  id v7 = [v5 manufacturer];
  v8 = [v5 model];
  v12 = [v5 firmwareVersion];
  v13 = [v5 category];
  if (!v7)
  {
    if (v4)
    {
      id v7 = [v4 manufacturer];
    }
    else
    {
      v14 = +[HMDVendorDataManager sharedVendorDataManager];
      v15 = [(HMDAccessoryPairingEvent *)self accessoryManufacturer];
      char v16 = [v14 databaseContainsManufacturer:v15];

      v17 = [(HMDAccessoryPairingEvent *)self accessoryManufacturer];
      id v7 = v17;
      if ((v16 & 1) == 0)
      {
        uint64_t v18 = anonymizeUnknownVendorString(v17);

        id v7 = (void *)v18;
      }
    }
  }
  if (!v8)
  {
    v48 = [v4 model];
    if (v48)
    {
      v8 = [v4 model];
    }
    else
    {
      v54 = [(HMDAccessoryPairingEvent *)self accessoryModel];
      anonymizeUnknownVendorString(v54);
      v8 = (HMDAccessoryMetricVendorDetails *)objc_claimAutoreleasedReturnValue();
    }
    if (v13) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
  if (!v13)
  {
LABEL_30:
    v13 = [(HMDAccessoryPairingEvent *)self accessoryCategory];
  }
LABEL_10:
  v19 = [[HMDAccessoryMetricVendorDetails alloc] initWithProductData:v6 manufacturer:v7 model:v8 firmwareVersion:v12 category:v13 differentiationNumber:0];
  [(HMDAccessoryPairingEvent *)self setVendorDetailsForReporting:v19];

LABEL_11:
  v20 = [(HMDAccessoryPairingEvent *)self logEventStateManager];
  v21 = [(HMDAccessoryPairingEvent *)self accessoryServerIdentifier];
  -[HMDAccessoryPairingEvent setRetryCount:](self, "setRetryCount:", [v20 retryCountForIdentifier:v21]);

  v22 = [(HMMLogEvent *)self error];

  if (!v22)
  {
    v23 = [(HMDAccessoryPairingEvent *)self logEventStateManager];
    [v23 clearRetryCountMap];
  }
  v24 = [(HMDAccessoryPairingEvent *)self logEventStateManager];
  -[HMDAccessoryPairingEvent setPairingUIState:](self, "setPairingUIState:", [v24 pairingUIState]);

  v25 = [(HMDAccessoryPairingEvent *)self logEventStateManager];
  -[HMDAccessoryPairingEvent setRecoveryType:](self, "setRecoveryType:", [v25 recoveryType]);

  v26 = [(HMDAccessoryPairingEvent *)self logEventStateManager];
  -[HMDAccessoryPairingEvent setPreviousRecoveryType:](self, "setPreviousRecoveryType:", [v26 previousRecoveryType]);

  if ([(HMDAccessoryPairingEvent *)self isAddOperation])
  {
    v27 = [(HMDAccessoryPairingEvent *)self logEventStateManager];
    v28 = [(HMMLogEvent *)self error];
    objc_msgSend(v27, "updateStatesOnResult:", objc_msgSend(v28, "code") == 0);
  }
  if ([(HMDAccessoryPairingEvent *)self isAddOperation])
  {
    v29 = [(HMDAccessoryPairingEvent *)self accessoryAddRequestIdentifier];
    uint64_t v30 = [v29 length];

    if (v30)
    {
      v31 = [(HMDAccessoryPairingEvent *)self logEventStateManager];
      uint64_t v32 = [(HMDAccessoryPairingEvent *)self accessoryAddRequestIdentifier];
      v33 = [(HMDAccessoryPairingEvent *)self endDate];
      [v31 updateLastPairingProgressStateEventForIdentifier:v32 withDate:v33];

      v34 = [(HMDAccessoryPairingEvent *)self logEventStateManager];
      v35 = [(HMDAccessoryPairingEvent *)self accessoryAddRequestIdentifier];
      v36 = [v34 getLastProgressStateForAccessory:v35];

      char v37 = [(HMDAccessoryPairingEvent *)self logEventStateManager];
      v38 = [(HMDAccessoryPairingEvent *)self accessoryAddRequestIdentifier];
      [v37 getTimeDurationForProgressStateForIdentifier:v38 state:v36];
      double v40 = v39;

      if (v40 <= 0.0)
      {
        v49 = (void *)MEMORY[0x230FBD990]();
        v50 = self;
        v51 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          v52 = HMFGetLogIdentifier();
          v53 = [(HMDAccessoryPairingEvent *)v50 accessoryAddRequestIdentifier];
          *(_DWORD *)buf = 138543618;
          v78 = v52;
          __int16 v79 = 2112;
          v80 = v53;
          _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_INFO, "%{public}@Submitting placeholder metric values since same accessory request UUID %@ being paired multiple times before CA event submission", buf, 0x16u);
        }
        [(HMDAccessoryPairingEvent *)v50 setLastAccessoryPairingState:@"Undetermined due to successive pairing attempts"];
        [(HMDAccessoryPairingEvent *)v50 setLongestPairingState:@"Undetermined due to successive pairing attempts"];
        [(HMDAccessoryPairingEvent *)v50 setLongestPairingProgressStateDurationInMilliseconds:0.0];
      }
      else
      {
        if (v36) {
          BOOL v41 = v36;
        }
        else {
          BOOL v41 = @"Unknown";
        }
        [(HMDAccessoryPairingEvent *)self setLastAccessoryPairingState:v41];
        v42 = [(HMDAccessoryPairingEvent *)self logEventStateManager];
        v43 = [(HMDAccessoryPairingEvent *)self accessoryAddRequestIdentifier];
        uint64_t v44 = [v42 getLongestProgressStateForAccessory:v43];
        if (v44)
        {
          v45 = [(HMDAccessoryPairingEvent *)self logEventStateManager];
          v46 = [(HMDAccessoryPairingEvent *)self accessoryAddRequestIdentifier];
          v47 = [v45 getLongestProgressStateForAccessory:v46];
          [(HMDAccessoryPairingEvent *)self setLongestPairingState:v47];
        }
        else
        {
          [(HMDAccessoryPairingEvent *)self setLongestPairingState:@"Unknown"];
        }

        v55 = [(HMDAccessoryPairingEvent *)self logEventStateManager];
        v56 = [(HMDAccessoryPairingEvent *)self accessoryAddRequestIdentifier];
        [v55 getTimeDurationForLongestProgressStateForAccessory:v56];
        -[HMDAccessoryPairingEvent setLongestPairingProgressStateDurationInMilliseconds:](self, "setLongestPairingProgressStateDurationInMilliseconds:");

        v57 = [(HMDAccessoryPairingEvent *)self logEventStateManager];
        v58 = [(HMDAccessoryPairingEvent *)self accessoryAddRequestIdentifier];
        [v57 clearPairingProgressStateTrackerForIdentifier:v58];
      }
    }
  }
  if ([(HMDAccessoryPairingEvent *)self _isMatterAccessory]
    && [(HMDAccessoryPairingEvent *)self isAddOperation])
  {
    int v59 = [(HMDAccessoryPairingEvent *)self matterAccessoryPairingStep] == 25;
    v60 = [(HMMLogEvent *)self error];
    int v61 = v60 == 0;

    if (v59 != v61)
    {
      v62 = (void *)MEMORY[0x230FBD990]();
      v63 = self;
      v64 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        v65 = HMFGetLogIdentifier();
        v66 = [(HMMLogEvent *)v63 error];
        v67 = HMDMatterAccessoryPairingStepAsString([(HMDAccessoryPairingEvent *)v63 matterAccessoryPairingStep]);
        *(_DWORD *)buf = 138543874;
        v78 = v65;
        __int16 v79 = 2112;
        v80 = v66;
        __int16 v81 = 2112;
        v82 = v67;
        _os_log_impl(&dword_22F52A000, v64, OS_LOG_TYPE_ERROR, "%{public}@Unexpected step and error in submitting pairing log event %@ %@", buf, 0x20u);
      }
    }
    v68 = [(HMMLogEvent *)self error];
    v69 = [v68 underlyingErrors];
    v70 = [v69 firstObject];

    if (v70)
    {
      v71 = (void *)MEMORY[0x230FBD990]();
      v72 = self;
      v73 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        v74 = HMFGetLogIdentifier();
        v75 = [(HMMLogEvent *)v72 error];
        *(_DWORD *)buf = 138543618;
        v78 = v74;
        __int16 v79 = 2112;
        v80 = v75;
        _os_log_impl(&dword_22F52A000, v73, OS_LOG_TYPE_ERROR, "%{public}@Unexpected error contains underlying error %@", buf, 0x16u);
      }
    }
  }
}

- (NSDate)endDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  double v4 = self->_endDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)markEndTime
{
  v5.receiver = self;
  v5.super_class = (Class)HMDAccessoryPairingEvent;
  [(HMMLogEvent *)&v5 markEndTime];
  os_unfair_lock_lock_with_options();
  if (!self->_endDate)
  {
    v3 = [MEMORY[0x263EFF910] date];
    endDate = self->_endDate;
    self->_endDate = v3;
  }
  os_unfair_lock_unlock(&self->_lock);
  [(HMDAccessoryPairingEvent *)self _setBtLoad];
}

- (void)_setBtLoad
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = +[HMDWirelessLoadManager sharedInstance];
  double v4 = [v3 getBtLoadData];
  objc_super v5 = [v4 objectForKeyedSubscript:@"kBtLoadKey"];
  self->_btLoad = [v5 intValue];

  id v6 = [v4 objectForKeyedSubscript:@"kBtAudioTask"];
  self->_btAudioTask = [v6 intValue];

  id v7 = [v4 objectForKeyedSubscript:@"kBtNonAudioTask"];
  self->_btNonAudioTask = [v7 intValue];

  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v12 = 138544130;
    v13 = v11;
    __int16 v14 = 1024;
    int v15 = [(HMDAccessoryPairingEvent *)v9 btLoad];
    __int16 v16 = 1024;
    int v17 = [(HMDAccessoryPairingEvent *)v9 btAudioTask];
    __int16 v18 = 1024;
    int v19 = [(HMDAccessoryPairingEvent *)v9 btNonAudioTask];
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Pairing BT Load: %d AudioTsk: %d NonAudioTsk: %d", (uint8_t *)&v12, 0x1Eu);
  }
}

- (BOOL)_isMatterAccessory
{
  return self->_communicationProtocol == 2;
}

- (BOOL)isMatterAccessory
{
  return [(HMDAccessoryPairingEvent *)self communicationProtocol] == 2;
}

- (void)_updateThreadPropertiesWithPairedAccessory:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v4 = v7;
  }
  else {
    double v4 = 0;
  }
  id v5 = v4;
  id v6 = v5;
  if (v5)
  {
    -[HMDAccessoryPairingEvent setThreadCapabilities:](self, "setThreadCapabilities:", [v5 threadCapabilities]);
    -[HMDAccessoryPairingEvent setThreadStatus:](self, "setThreadStatus:", [v6 threadStatus]);
  }
}

- (void)updateEventPropertiesWithHAPAccessory:(id)a3
{
  id v31 = a3;
  if ([(HMDAccessoryPairingEvent *)self _isMatterAccessory])
  {
    double v4 = [v31 server];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;

    if (v6)
    {
      id v7 = [v6 vendorNameFromDcl];
      [(HMDAccessoryPairingEvent *)self setAccessoryManufacturer:v7];

      v8 = [v6 productNameFromDcl];
      [(HMDAccessoryPairingEvent *)self setAccessoryModel:v8];

      v9 = [v6 softwareVersionString];
      [(HMDAccessoryPairingEvent *)self setMatterSoftwareVersionString:v9];

      uint64_t v10 = [v6 vendorID];
      if (v10)
      {
        v11 = (void *)v10;
        int v12 = [v6 vendorNameFromDcl];

        if (!v12)
        {
          v13 = [v6 vendorID];
          __int16 v14 = [v13 stringValue];
          [(HMDAccessoryPairingEvent *)self setAccessoryManufacturer:v14];
        }
      }
      uint64_t v15 = [v6 productID];
      if (v15)
      {
        __int16 v16 = (void *)v15;
        int v17 = [v6 productNameFromDcl];

        if (!v17)
        {
          __int16 v18 = [v6 productID];
          int v19 = [v18 stringValue];
          [(HMDAccessoryPairingEvent *)self setAccessoryModel:v19];
        }
      }
      -[HMDAccessoryPairingEvent setThreadAccessory:](self, "setThreadAccessory:", [v6 linkLayerType] == 4);
    }
  }
  uint64_t v20 = [(HMDAccessoryPairingEvent *)self accessoryManufacturer];

  if (!v20)
  {
    v21 = [v31 manufacturer];
    [(HMDAccessoryPairingEvent *)self setAccessoryManufacturer:v21];
  }
  v22 = [(HMDAccessoryPairingEvent *)self accessoryModel];

  if (!v22)
  {
    v23 = [v31 model];
    [(HMDAccessoryPairingEvent *)self setAccessoryModel:v23];
  }
  uint64_t v24 = [(HMDAccessoryPairingEvent *)self accessoryCategory];
  if (!v24
    || (v25 = (void *)v24,
        BOOL v26 = [(HMDAccessoryPairingEvent *)self _isMatterAccessory],
        v25,
        v26))
  {
    v27 = (void *)MEMORY[0x263F0DF40];
    v28 = [v31 category];
    v29 = [v27 categoryWithCategoryIdentifier:v28];

    uint64_t v30 = [v29 categoryType];
    [(HMDAccessoryPairingEvent *)self setAccessoryCategory:v30];
  }
}

- (int)currentWiFiBand
{
  v2 = (void *)WiFiCopyCurrentNetworkInfoEx();
  [v2 objectForKey:@"platformNetwork"];
  int OperatingBand = WiFiNetworkGetOperatingBand();

  return OperatingBand;
}

- (void)updateEventPropertiesWithPairedAccessory:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v12 = v4;
    [(HMDAccessoryPairingEvent *)self setPairedAccessory:v4];
    id v5 = [(HMDAccessoryPairingEvent *)self accessoryManufacturer];

    if (!v5)
    {
      id v6 = [v12 manufacturer];
      [(HMDAccessoryPairingEvent *)self setAccessoryManufacturer:v6];
    }
    id v7 = [(HMDAccessoryPairingEvent *)self accessoryModel];

    if (!v7)
    {
      v8 = [v12 model];
      [(HMDAccessoryPairingEvent *)self setAccessoryModel:v8];
    }
    v9 = [(HMDAccessoryPairingEvent *)self accessoryCategory];

    if (!v9)
    {
      uint64_t v10 = [v12 category];
      v11 = [v10 categoryType];
      [(HMDAccessoryPairingEvent *)self setAccessoryCategory:v11];
    }
    [(HMDAccessoryPairingEvent *)self _updateThreadPropertiesWithPairedAccessory:v12];
    id v4 = v12;
  }
}

- (void)pairedToServer:(id)a3 certificationStatus:(int64_t)a4 addedViaWAC:(BOOL)a5 legacyWAC:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v20 = a3;
  if (v20)
  {
    if (![(HMDAccessoryPairingEvent *)self linkType]) {
      -[HMDAccessoryPairingEvent setLinkType:](self, "setLinkType:", [v20 linkType]);
    }
    id v10 = v20;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      int v12 = v10;
    }
    else {
      int v12 = 0;
    }
    id v13 = v12;

    if (isKindOfClass)
    {
      __int16 v14 = [(HMDAccessoryPairingEvent *)self accessoryModel];

      if (!v14)
      {
        uint64_t v15 = [v10 model];
        [(HMDAccessoryPairingEvent *)self setAccessoryModel:v15];

        if ([v10 isWacAccessory])
        {
          __int16 v16 = [v10 hapWACAccessory];
          int v17 = [v16 model];
          [(HMDAccessoryPairingEvent *)self setAccessoryModel:v17];

          __int16 v18 = [v10 hapWACAccessory];
          int v19 = [v18 manufacturer];
          [(HMDAccessoryPairingEvent *)self setAccessoryManufacturer:v19];
        }
      }
    }
  }
  if ([(HMDAccessoryPairingEvent *)self isAddOperation])
  {
    [(HMDAccessoryPairingEvent *)self setCertificationStatus:a4];
    [(HMDAccessoryPairingEvent *)self setAddViaWAC:v7];
    if ([(HMDAccessoryPairingEvent *)self isAddViaWAC]) {
      [(HMDAccessoryPairingEvent *)self setWacLegacy:v6];
    }
  }
}

- (HMDAccessoryPairingEvent)initWithAccessoryDescription:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 uuid];
  v77.receiver = self;
  v77.super_class = (Class)HMDAccessoryPairingEvent;
  v9 = [(HMMHomeLogEvent *)&v77 initWithHomeUUID:v8];

  if (v9)
  {
    uint64_t v10 = +[HMDAccessoryPairingLogEventStateManager sharedManager];
    logEventStateManager = v9->_logEventStateManager;
    v9->_logEventStateManager = (HMDAccessoryPairingLogEventStateManager *)v10;

    int v12 = [v6 addRequestIdentifier];

    if (v12)
    {
      id v13 = v9->_logEventStateManager;
      __int16 v14 = [MEMORY[0x263EFF910] date];
      uint64_t v15 = [v6 addRequestIdentifier];
      __int16 v16 = [v15 UUIDString];
      [(HMDAccessoryPairingLogEventStateManager *)v13 startProgressStateTrackerWithDate:v14 identifier:v16];

      int v17 = [v6 addRequestIdentifier];
      uint64_t v18 = [v17 UUIDString];
      accessoryAddRequestIdentifier = v9->_accessoryAddRequestIdentifier;
      v9->_accessoryAddRequestIdentifier = (NSString *)v18;
    }
    if ([v6 supportsIP])
    {
      v9->_linkType = 1;
    }
    else if ([v6 supportsBTLE])
    {
      v9->_linkType = 2;
    }
    else
    {
      v9->_linkType = 0;
    }
    id v20 = [v6 setupAccessoryPayload];
    uint64_t v21 = [v20 communicationProtocol];

    if ((unint64_t)(v21 - 1) <= 1) {
      v9->_communicationProtocol = v21;
    }
    v9->_addOperation = 1;
    v22 = [v6 ownershipToken];

    if (v22) {
      v9->_usedOwnershipProof = 1;
    }
    v23 = [v6 setupAccessoryPayload];
    uint64_t v24 = [v23 threadIdentifier];

    if (v24) {
      v9->_threadAccessory = 1;
    }
    if ([v7 doesHomeContainResident])
    {
      v25 = [v7 primaryResident];
      BOOL v26 = v25;
      v9->_hasResidentInHome = 1;
      if (v25) {
        LOBYTE(v25) = [v25 isReachable];
      }
      v9->_isPrimaryResidentOnline = (char)v25;
    }
    else
    {
      v9->_hasResidentInHome = 0;
      v9->_isPrimaryResidentOnline = 0;
    }
    v27 = [v6 category];
    v28 = (void *)MEMORY[0x263F0DF40];
    v29 = [v6 setupAccessoryPayload];
    uint64_t v30 = [v29 categoryNumber];
    id v31 = [v28 categoryWithCategoryIdentifier:v30];

    if (([v27 isWiFiRouterAccessoryCategory] & 1) != 0
      || [v31 isWiFiRouterAccessoryCategory])
    {
      v9->_networkRouterAdd = 1;
      uint64_t v32 = [v7 wiFiRouterAccessories];
      uint64_t v33 = [v32 count];

      if (v33) {
        v9->_networkRouterReplace = 1;
      }
    }
    uint64_t v34 = [v6 accessoryUUID];
    accessoryUUID = v9->_accessoryUUID;
    v9->_accessoryUUID = (NSUUID *)v34;

    uint64_t v36 = [v6 appIdentifier];
    appIdentifier = v9->_appIdentifier;
    v9->_appIdentifier = (NSString *)v36;

    if (v27) {
      v38 = v27;
    }
    else {
      v38 = v31;
    }
    double v39 = [v38 categoryType];
    objc_storeStrong((id *)&v9->_accessoryCategory, v39);

    double v40 = [v6 setupAccessoryPayload];
    BOOL v41 = [v40 category];
    uint64_t v42 = [v41 categoryType];
    categoryType = v9->_categoryType;
    v9->_categoryType = (NSString *)v42;

    uint64_t v44 = [v40 productNumber];
    productNumber = v9->_productNumber;
    v9->_productNumber = (NSString *)v44;

    v9->_requiresMatterCustomCommissioningFlow = [v40 requiresMatterCustomCommissioningFlow];
    v46 = [v7 currentUser];
    v9->_userPrivilege = [v46 privilege];

    if ([(HMDAccessoryPairingEvent *)v9 _isMatterAccessory])
    {
      objc_super v76 = v27;
      v47 = [v6 setupAccessoryPayload];
      v48 = [v47 chipAccessorySetupPayload];
      uint64_t v49 = [v48 vendorID];

      v50 = [v6 setupAccessoryPayload];
      v51 = [v50 chipAccessorySetupPayload];
      v52 = [v51 productID];

      v53 = (void *)v49;
      v74 = (void *)v49;
      v75 = v31;
      if (v49)
      {
        v54 = [v7 homeManager];
        v55 = [v54 chipDataSource];
        v56 = [v55 vendorMetadataStore];
        v57 = [v56 retrieveVendorMetadataForVendorID:v53 productID:v52];

        v58 = [v57 productWithID:v52];
        uint64_t v59 = [v57 name];
        accessoryManufacturer = v9->_accessoryManufacturer;
        v9->_accessoryManufacturer = (NSString *)v59;

        uint64_t v61 = [v58 name];
        accessoryModel = v9->_accessoryModel;
        v9->_accessoryModel = (NSString *)v61;

        v9->_currentWiFiBand = 0;
        if (!v57)
        {
          uint64_t v63 = [v53 stringValue];
          v64 = v9->_accessoryManufacturer;
          v9->_accessoryManufacturer = (NSString *)v63;
        }
      }
      else
      {
        v58 = 0;
        v57 = 0;
        v9->_currentWiFiBand = 0;
      }
      v72 = v57;
      if (v52 && !v58)
      {
        uint64_t v65 = objc_msgSend(v52, "stringValue", v57);
        v66 = v9->_accessoryModel;
        v9->_accessoryModel = (NSString *)v65;
      }
      v9->_linkType = 1;
      v67 = v9->_logEventStateManager;
      objc_msgSend(v7, "workQueue", v72);
      v69 = v68 = v52;
      v70 = [v7 logEventSubmitter];
      [(HMDAccessoryPairingLogEventStateManager *)v67 configureWithPairingEvent:v9 workQueue:v69 logEventSubmitter:v70];

      v9->_matterAccessoryPairingStep = 1;
      id v31 = v75;
      v27 = v76;
    }
    [(HMDAccessoryPairingLogEventStateManager *)v9->_logEventStateManager resetStatesForNewAddOperation];
  }
  return v9;
}

- (HMDAccessoryPairingEvent)initWithUnpairedAccessory:(id)a3 pairedAccessory:(id)a4 hapAccessory:(id)a5 appIdentifier:(id)a6 retry:(BOOL)a7 home:(id)a8 isAddOperation:(BOOL)a9 logEventStateManager:(id)a10
{
  id v16 = a3;
  id obj = a4;
  id v17 = a4;
  id v18 = a5;
  id v135 = a6;
  id v19 = a8;
  id v134 = a10;
  id v20 = [v19 uuid];
  v136.receiver = self;
  v136.super_class = (Class)HMDAccessoryPairingEvent;
  uint64_t v21 = v18;
  v22 = [(HMMHomeLogEvent *)&v136 initWithHomeUUID:v20];

  if (!v22) {
    goto LABEL_72;
  }
  v132 = [v19 homeManager];
  p_logEventStateManager = (id *)&v22->_logEventStateManager;
  objc_storeStrong((id *)&v22->_logEventStateManager, a10);
  id v133 = v17;
  id v131 = v18;
  if (v16)
  {
    id v24 = *p_logEventStateManager;
    v25 = [MEMORY[0x263EFF910] date];
    BOOL v26 = [v16 uuid];
    v27 = [v26 UUIDString];
    [v24 startProgressStateTrackerWithDate:v25 identifier:v27];

    uint64_t v28 = [v16 uuid];
    accessoryUUID = v22->_accessoryUUID;
    v22->_accessoryUUID = (NSUUID *)v28;

    uint64_t v30 = [v16 category];
    uint64_t v31 = [v30 categoryType];
    accessoryCategory = v22->_accessoryCategory;
    v22->_accessoryCategory = (NSString *)v31;

    uint64_t v33 = [v16 identifier];
    uint64_t v34 = [v33 copy];
    accessoryServerIdentifier = v22->_accessoryServerIdentifier;
    v22->_accessoryServerIdentifier = (NSString *)v34;

    uint64_t v36 = [v16 uuid];
    uint64_t v37 = [v36 UUIDString];
    accessoryAddRequestIdentifier = v22->_accessoryAddRequestIdentifier;
    v22->_accessoryAddRequestIdentifier = (NSString *)v37;

    objc_storeStrong((id *)&v22->_appIdentifier, a6);
    v22->_retry = a7;
    double v39 = [v16 preferredAccessoryServer];
    double v40 = v39;
    if (!v39) {
      double v39 = v16;
    }
    v22->_linkType = [v39 linkType];
    v22->_communicationProtocol = [v40 communicationProtocol];
    id v41 = v40;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v42 = v41;
    }
    else {
      uint64_t v42 = 0;
    }
    id v43 = v42;

    if (v43)
    {
      uint64_t v44 = [v43 model];
      accessoryModel = v22->_accessoryModel;
      v22->_accessoryModel = (NSString *)v44;

      if ([v43 isWacAccessory])
      {
        v46 = [v43 hapWACAccessory];
        uint64_t v47 = [v46 model];
        v48 = v22->_accessoryModel;
        v22->_accessoryModel = (NSString *)v47;

        uint64_t v49 = [v43 hapWACAccessory];
        uint64_t v50 = [v49 manufacturer];
        accessoryManufacturer = v22->_accessoryManufacturer;
        v22->_accessoryManufacturer = (NSString *)v50;
      }
    }
    if (a9)
    {
      v52 = [v16 category];
      int v53 = [v52 isWiFiRouterAccessoryCategory];

      if (v53)
      {
        v22->_networkRouterAdd = 1;
        v54 = [v19 wiFiRouterAccessories];
        uint64_t v55 = [v54 count];

        if (v55) {
          v22->_networkRouterReplace = 1;
        }
      }
    }
    id v56 = v41;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v57 = v56;
    }
    else {
      v57 = 0;
    }
    id v58 = v57;

    id v17 = v133;
    p_logEventStateManager = (id *)&v22->_logEventStateManager;
    if (v58 || [v56 linkLayerType] == 4) {
      v22->_threadAccessory = 1;
    }
    uint64_t v59 = [v19 currentUser];
    v22->_userPrivilege = [v59 privilege];

    if ([(HMDAccessoryPairingEvent *)v22 _isMatterAccessory])
    {
      id v129 = v19;
      v60 = [v16 vendorID];

      if (v60)
      {
        uint64_t v61 = [v132 chipDataSource];
        v62 = [v61 vendorMetadataStore];
        uint64_t v63 = [v16 vendorID];
        [v16 productID];
        uint64_t v65 = v64 = v58;
        v60 = [v62 retrieveVendorMetadataForVendorID:v63 productID:v65];

        id v58 = v64;
        id v17 = v133;

        v66 = [v16 productID];
        v67 = [v60 productWithID:v66];

        uint64_t v68 = [v60 name];
        v69 = v22->_accessoryManufacturer;
        v22->_accessoryManufacturer = (NSString *)v68;

        uint64_t v70 = [v67 name];
        v71 = v22->_accessoryModel;
        v22->_accessoryModel = (NSString *)v70;
      }
      else
      {
        v67 = 0;
      }
      v22->_currentWiFiBand = 0;
      v74 = [v16 vendorID];

      if (v74 && !v60)
      {
        v75 = [v16 vendorID];
        uint64_t v76 = [v75 stringValue];
        objc_super v77 = v22->_accessoryManufacturer;
        v22->_accessoryManufacturer = (NSString *)v76;
      }
      v78 = [v16 productID];

      id v19 = v129;
      if (v78 && !v67)
      {
        __int16 v79 = [v16 productID];
        uint64_t v80 = [v79 stringValue];
        __int16 v81 = v22->_accessoryModel;
        v22->_accessoryModel = (NSString *)v80;
      }
      v22->_linkType = 1;
      p_logEventStateManager = (id *)&v22->_logEventStateManager;
    }
    else
    {
      logEventStateManager = v22->_logEventStateManager;
      id v73 = [v16 identifier];
      [(HMDAccessoryPairingLogEventStateManager *)logEventStateManager incrementRetryCount:v73];
    }
    uint64_t v21 = v131;
  }
  if (v17)
  {
    objc_storeStrong((id *)&v22->_pairedAccessory, obj);
    v82 = [v17 category];
    uint64_t v83 = [v82 categoryType];
    v84 = v22->_accessoryCategory;
    v22->_accessoryCategory = (NSString *)v83;

    id v85 = [v17 identifier];
    uint64_t v86 = [v85 copy];
    v87 = v22->_accessoryServerIdentifier;
    v22->_accessoryServerIdentifier = (NSString *)v86;

    uint64_t v88 = [v17 uuid];
    v89 = v22->_accessoryUUID;
    v22->_accessoryUUID = (NSUUID *)v88;

    uint64_t v90 = [v17 metricLoggingVendorDetails];
    vendorDetailsForReporting = v22->_vendorDetailsForReporting;
    v22->_vendorDetailsForReporting = (HMDAccessoryMetricVendorDetails *)v90;

    id v92 = v17;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      v94 = v92;
    }
    else {
      v94 = 0;
    }
    id v95 = v94;

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_45;
    }
    v22->_certificationStatus = [v92 certificationStatus];
    if (v22->_linkType) {
      goto LABEL_45;
    }
    if ([v92 hasBTLELink])
    {
      uint64_t v96 = 2;
    }
    else
    {
      if (![v92 hasIPLink])
      {
LABEL_45:
        [(HMDAccessoryPairingEvent *)v22 _updateThreadPropertiesWithPairedAccessory:v95];
        v22->_accessorySupportsWoL = [v95 supportsWoL];
        v22->_communicationProtocol = [v95 communicationProtocol];
        v22->_threadAccessory = [v95 hasThreadServer];
        if ([(HMDAccessoryPairingEvent *)v22 _isMatterAccessory])
        {
          v97 = [v95 matterVendorID];

          if (v97)
          {
            v98 = [v132 chipDataSource];
            v99 = [v98 vendorMetadataStore];
            v100 = [v95 matterVendorID];
            v101 = [v95 matterProductID];
            v102 = [v99 retrieveVendorMetadataForVendorID:v100 productID:v101];

            v103 = [v95 matterProductID];
            v104 = [v102 productWithID:v103];

            uint64_t v105 = [v102 name];
            v106 = v22->_accessoryManufacturer;
            v22->_accessoryManufacturer = (NSString *)v105;

            uint64_t v107 = [v104 name];
            v108 = v22->_accessoryModel;
            v22->_accessoryModel = (NSString *)v107;

            BOOL v109 = v102 == 0;
          }
          else
          {
            v104 = 0;
            BOOL v109 = 1;
          }
          v22->_currentWiFiBand = 0;
          v110 = [v95 matterVendorID];

          if (v110 && v109)
          {
            v111 = [v95 matterVendorID];
            uint64_t v112 = [v111 stringValue];
            v113 = v22->_accessoryManufacturer;
            v22->_accessoryManufacturer = (NSString *)v112;
          }
          v114 = [v95 matterProductID];

          p_logEventStateManager = (id *)&v22->_logEventStateManager;
          if (v114 && !v104)
          {
            v115 = [v95 matterProductID];
            uint64_t v116 = [v115 stringValue];
            v117 = v22->_accessoryModel;
            v22->_accessoryModel = (NSString *)v116;
          }
          v118 = [v92 firmwareVersion];
          uint64_t v119 = [v118 versionString];
          matterSoftwareVersionString = v22->_matterSoftwareVersionString;
          v22->_matterSoftwareVersionString = (NSString *)v119;

          v22->_linkType = 1;
        }

        id v17 = v133;
        uint64_t v21 = v131;
        goto LABEL_57;
      }
      uint64_t v96 = 1;
    }
    v22->_linkType = v96;
    goto LABEL_45;
  }
LABEL_57:
  if (v21 && !v22->_linkType) {
    v22->_linkType = [v21 linkType];
  }
  if (v21 && !v22->_communicationProtocol)
  {
    v121 = [v21 server];
    v22->_communicationProtocol = [v121 communicationProtocol];
  }
  if ([v19 doesHomeContainResident])
  {
    v122 = [v19 primaryResident];
    v123 = v122;
    v22->_hasResidentInHome = 1;
    if (v122) {
      LOBYTE(v122) = [v122 isReachable];
    }
    v22->_isPrimaryResidentOnline = (char)v122;
  }
  else
  {
    v22->_hasResidentInHome = 0;
    v22->_isPrimaryResidentOnline = 0;
  }
  v22->_hmdAccessoryPairingEventResidentConfirmation = 0;
  residentConfirmationTimeStarted = v22->_residentConfirmationTimeStarted;
  v22->_residentConfirmationTimeStarted = 0;

  v22->_residentConfirmationDurationInSeconds = 0.0;
  v22->_addOperation = a9;
  v22->_addViaWAC = 0;
  if (a9)
  {
    [*p_logEventStateManager resetStatesForNewAddOperation];
    if ([(HMDAccessoryPairingEvent *)v22 _isMatterAccessory])
    {
      id v125 = *p_logEventStateManager;
      v126 = [v19 workQueue];
      v127 = [v19 logEventSubmitter];
      [v125 configureWithPairingEvent:v22 workQueue:v126 logEventSubmitter:v127];

      v22->_matterAccessoryPairingStep = 1;
    }
  }

LABEL_72:
  return v22;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13_105782 != -1) {
    dispatch_once(&logCategory__hmf_once_t13_105782, &__block_literal_global_105783);
  }
  v2 = (void *)logCategory__hmf_once_v14_105784;
  return v2;
}

void __39__HMDAccessoryPairingEvent_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v14_105784;
  logCategory__hmf_once_v14_105784 = v0;
}

+ (id)removingAccessory:(id)a3 hapAccessory:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [HMDAccessoryPairingEvent alloc];
  v8 = [v6 home];
  v9 = +[HMDAccessoryPairingLogEventStateManager sharedManager];
  LOBYTE(v12) = 0;
  uint64_t v10 = [(HMDAccessoryPairingEvent *)v7 initWithUnpairedAccessory:0 pairedAccessory:v6 hapAccessory:v5 appIdentifier:0 retry:0 home:v8 isAddOperation:v12 logEventStateManager:v9];

  return v10;
}

+ (id)pairingAccessory:(id)a3 home:(id)a4 appIdentifier:(id)a5 retry:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [HMDAccessoryPairingEvent alloc];
  id v13 = +[HMDAccessoryPairingLogEventStateManager sharedManager];
  LOBYTE(v16) = 1;
  __int16 v14 = [(HMDAccessoryPairingEvent *)v12 initWithUnpairedAccessory:v11 pairedAccessory:0 hapAccessory:0 appIdentifier:v9 retry:v6 home:v10 isAddOperation:v16 logEventStateManager:v13];

  return v14;
}

+ (id)pairingAccessoryWithDescription:(id)a3 home:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[HMDAccessoryPairingEvent alloc] initWithAccessoryDescription:v6 home:v5];

  return v7;
}

@end