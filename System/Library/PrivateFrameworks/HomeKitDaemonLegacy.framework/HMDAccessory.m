@interface HMDAccessory
+ (BOOL)splitProductDataIntoProductGroupAndProductNumber:(id)a3 productGroup:(id *)a4 productNumber:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (BOOL)validateProductData:(id)a3;
+ (id)logCategory;
- (BOOL)_allowSoftwareUpdateChangeFromSource:(unint64_t)a3;
- (BOOL)_getLastKnownLowBatteryStatus;
- (BOOL)_shouldFilterAccessoryProfileForEntitledClients:(id)a3;
- (BOOL)_shouldFilterAccessoryProfileForUnentitledClients:(id)a3;
- (BOOL)_updateRoom:(id)a3 source:(unint64_t)a4;
- (BOOL)hasActiveSession;
- (BOOL)hasBattery;
- (BOOL)hasMediaProfile;
- (BOOL)hasSiriEndpointProfile;
- (BOOL)isCurrentAccessory;
- (BOOL)isFirstPartyAccessory;
- (BOOL)isLowBattery;
- (BOOL)isPrimary;
- (BOOL)isReachable;
- (BOOL)isReachableForXPCClients;
- (BOOL)isRemoteAccessEnabled;
- (BOOL)isRemotelyReachable;
- (BOOL)isSuspendCapable;
- (BOOL)isSuspended;
- (BOOL)needsAirplayAccess;
- (BOOL)providesHashRouteID;
- (BOOL)reachabilityPingEnabled;
- (BOOL)reachabilityPingNotificationEnabled;
- (BOOL)requiresHomeAppForManagement;
- (BOOL)requiresRemovalOnPrimaryResident;
- (BOOL)resetOnBackoffExpiry;
- (BOOL)shouldEnableDaemonRelaunch;
- (BOOL)shouldProcessTransactionRemoval;
- (BOOL)supportsAnnounce;
- (BOOL)supportsAudioAnalysis;
- (BOOL)supportsAudioReturnChannel;
- (BOOL)supportsCompanionInitiatedObliterate;
- (BOOL)supportsCompanionInitiatedRestart;
- (BOOL)supportsCoordinationDoorbellChime;
- (BOOL)supportsCoordinationFreeDoorbellChime;
- (BOOL)supportsDiagnosticsTransfer;
- (BOOL)supportsDoorbellChime;
- (BOOL)supportsDropIn;
- (BOOL)supportsFirmwareUpdate;
- (BOOL)supportsHomeLevelLocationServiceSetting;
- (BOOL)supportsIdentify;
- (BOOL)supportsJustSiri;
- (BOOL)supportsManagedConfigurationProfile;
- (BOOL)supportsMediaActions;
- (BOOL)supportsMediaContentProfile;
- (BOOL)supportsMessagedHomePodSettings;
- (BOOL)supportsMinimumUserPrivilege;
- (BOOL)supportsMultiUser;
- (BOOL)supportsMusicAlarm;
- (BOOL)supportsNetworkProtection;
- (BOOL)supportsPersonalRequests;
- (BOOL)supportsSoftwareUpdate;
- (BOOL)supportsSoftwareUpdateV2;
- (BOOL)supportsTVOSUpdateManualUpdateAvailableNotification;
- (BOOL)supportsTargetControl;
- (BOOL)supportsTargetController;
- (BOOL)supportsThirdPartyMusic;
- (BOOL)supportsUnreachablePing;
- (BOOL)supportsUserManagement;
- (BOOL)supportsUserMediaSettings;
- (BOOL)supportsWiFiReconfiguration;
- (HMAccessoryCategory)category;
- (HMDAccessory)hostAccessory;
- (HMDAccessory)init;
- (HMDAccessory)initWithCoder:(id)a3;
- (HMDAccessory)initWithNotificationCenter:(id)a3;
- (HMDAccessory)initWithTransaction:(id)a3 home:(id)a4;
- (HMDAccessoryNetworkAccessViolation)networkAccessViolation;
- (HMDAccessoryVersion)firmwareVersion;
- (HMDApplicationData)appData;
- (HMDFeaturesDataSource)featuresDataSource;
- (HMDHome)home;
- (HMDNetworkRouterFirewallRuleAccessoryIdentifier)metadataIdentifier;
- (HMDRoom)room;
- (HMDSoftwareUpdate)softwareUpdate;
- (HMDUserManagementOperationTimestamp)pairingsAuditedTimestamp;
- (HMDUserManagementOperationTimestamp)sharedAdminAddedTimestamp;
- (HMDVendorModelEntry)vendorInfo;
- (HMFMessageDispatcher)msgDispatcher;
- (HMFVersion)primaryProfileVersion;
- (NSArray)accessoryProfiles;
- (NSArray)allowedHosts;
- (NSArray)transportReports;
- (NSData)wiFiUniquePreSharedKey;
- (NSDate)lastSeenDate;
- (NSDate)timeBecameReachable;
- (NSDate)timeBecameUnreachable;
- (NSDictionary)assistantObject;
- (NSNotificationCenter)notificationCenter;
- (NSNumber)categoryIdentifier;
- (NSNumber)initialCategoryIdentifier;
- (NSNumber)networkClientIdentifier;
- (NSNumber)preferredMediaUserSelectionTypeNumber;
- (NSString)configuredName;
- (NSString)contextID;
- (NSString)displayableFirmwareVersion;
- (NSString)hashRouteID;
- (NSString)identifier;
- (NSString)initialManufacturer;
- (NSString)initialModel;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)name;
- (NSString)pendingConfigurationIdentifier;
- (NSString)productData;
- (NSString)productGroup;
- (NSString)providedName;
- (NSString)serialNumber;
- (NSString)urlString;
- (NSUUID)configuredNetworkProtectionGroupUUID;
- (NSUUID)contextSPIUniqueIdentifier;
- (NSUUID)defaultNetworkProtectionGroupUUID;
- (NSUUID)endpointIdentifier;
- (NSUUID)networkClientProfileFingerprint;
- (NSUUID)networkRouterUUID;
- (NSUUID)preferredMediaUserUUID;
- (NSUUID)spiClientIdentifier;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (double)lastPairingFailureTime;
- (id)_updateCategory:(id)a3 notifyClients:(BOOL)a4;
- (id)accessoryBulletinContext;
- (id)attributeDescriptions;
- (id)backingStoreObjects:(int64_t)a3;
- (id)dumpNetworkState;
- (id)dumpSimpleState;
- (id)dumpState;
- (id)getConfiguredName;
- (id)hashedRouteFactory;
- (id)logIdentifier;
- (id)messageDestination;
- (id)messageSendPolicy;
- (id)metricLoggingTransportDetails;
- (id)metricLoggingVendorDetails;
- (id)modelWithUpdatedRoom:(id)a3;
- (id)networkProtectionGroupUUID;
- (id)notificationCenterForSoftwareUpdate:(id)a3;
- (id)privateDescription;
- (id)runtimeState;
- (id)shortDescription;
- (id)transactionWithObjectChangeType:(unint64_t)a3;
- (int64_t)currentNetworkProtectionMode;
- (int64_t)networkClientLAN;
- (int64_t)reachableTransports;
- (int64_t)targetNetworkProtectionMode;
- (int64_t)wiFiCredentialType;
- (unint64_t)accessoryReprovisionState;
- (unint64_t)configNumber;
- (unint64_t)consecutivePairingFailure;
- (unint64_t)consecutivePairingFailures;
- (unint64_t)supportedTransports;
- (void)__handleAuditPairings:(id)a3;
- (void)__handleGetAccessoryAdvertisingParams:(id)a3;
- (void)__handleIdentify:(id)a3;
- (void)__handleListPairings:(id)a3;
- (void)__handlePairingIdentityRequest:(id)a3;
- (void)__handleRename:(id)a3;
- (void)__handleSetAppData:(id)a3;
- (void)__handleUpdatePendingConfigurationIdentifierMessage:(id)a3;
- (void)__handleUpdateRoom:(id)a3;
- (void)_applySoftwareUpdateModel:(id)a3 completion:(id)a4;
- (void)_checkForLastSeenUpdateOnBecomingUnreachable;
- (void)_configNumberUpdated;
- (void)_handleLastSeenStatusRequestMessage:(id)a3;
- (void)_handleLinkQualityRequestMessage:(id)a3;
- (void)_handlePreviewAllowedHosts:(id)a3;
- (void)_handleUpdatedName:(id)a3;
- (void)_handleWiFiReconfiguration:(id)a3;
- (void)_notifyConnectivityChangedWithRemoteAccessChanged:(BOOL)a3;
- (void)_registerForMessages;
- (void)_relayIdentifyAccessorytoResidentForMessage:(id)a3;
- (void)_remoteAccessEnabled:(BOOL)a3;
- (void)_renameAccessory:(id)a3 resetName:(BOOL)a4 message:(id)a5;
- (void)_updateHost:(id)a3;
- (void)addAccessoryProfile:(id)a3;
- (void)addHostedAccessory:(id)a3;
- (void)appDataRemoved:(id)a3 message:(id)a4;
- (void)appDataUpdated:(id)a3 message:(id)a4;
- (void)configureWithHome:(id)a3 msgDispatcher:(id)a4 configurationTracker:(id)a5 initialConfiguration:(BOOL)a6;
- (void)dealloc;
- (void)decodePreferredMediaUser:(id)a3;
- (void)didEncounterError:(id)a3;
- (void)encodePreferredMediaUser:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleAccessoryUpdateShouldProcessTransactionRemovalValueRequestMessage:(id)a3;
- (void)handleAddedAccessoryProfile:(id)a3;
- (void)handleAddedMediaProfile:(id)a3;
- (void)handleAddedSiriEndpointProfile:(id)a3;
- (void)handleAddedSoftwareUpdateModel:(id)a3 message:(id)a4;
- (void)handleIdentifyAccessoryMessage:(id)a3;
- (void)handleRemovedSoftwareUpdateModel:(id)a3 message:(id)a4;
- (void)handleUpdatedSoftwareUpdateModel:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)notifyAccessoryNameChanged:(BOOL)a3;
- (void)notifyClientsOfUpdatedAccessoryControllableValue:(BOOL)a3;
- (void)populateModelObject:(id)a3 version:(int64_t)a4;
- (void)populateVendorDetailsForCoreAnalytics:(id)a3 keyPrefix:(id)a4;
- (void)remoteAccessEnabled:(BOOL)a3;
- (void)removeAccessoryProfile:(id)a3;
- (void)removeCloudData;
- (void)removeHostedAccessory:(id)a3;
- (void)resetHashedRoute;
- (void)runTransactionWithModel:(id)a3 label:(id)a4 completion:(id)a5;
- (void)runTransactionWithModels:(id)a3 label:(id)a4 completion:(id)a5;
- (void)saveCurrentNetworkProtectionMode:(int64_t)a3 assignedLAN:(int64_t)a4 allowedWANHosts:(id)a5 profileFingerprint:(id)a6;
- (void)saveLastSeenToLocalStore;
- (void)saveNetworkAccessViolation:(id)a3;
- (void)saveNetworkClientIdentifier:(id)a3 networkRouterUUID:(id)a4 clearProfileFingerprint:(BOOL)a5;
- (void)saveWiFiUniquePreSharedKey:(id)a3 credentialType:(int64_t)a4;
- (void)sendLastSeenStatusResponseMessage:(id)a3;
- (void)sendRemovalRequest;
- (void)sendRemovalRequestWithCompletion:(id)a3;
- (void)setAccessoryProfiles:(id)a3;
- (void)setAccessoryReprovisionState:(unint64_t)a3;
- (void)setAllowedHosts:(id)a3;
- (void)setAppData:(id)a3;
- (void)setCategory:(id)a3;
- (void)setCategoryIdentifier:(id)a3;
- (void)setConfigNumber:(unint64_t)a3;
- (void)setConfiguredName:(id)a3;
- (void)setConfiguredNetworkProtectionGroupUUID:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setConsecutivePairingFailure:(unint64_t)a3;
- (void)setConsecutivePairingFailures:(unint64_t)a3;
- (void)setCurrentNetworkProtectionMode:(int64_t)a3;
- (void)setDefaultPreferredMediaUserIfRemoved:(id)a3 defaultUser:(id)a4 completion:(id)a5;
- (void)setDisplayableFirmwareVersion:(id)a3;
- (void)setFeaturesDataSource:(id)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setHashRouteID:(id)a3;
- (void)setHashedRouteFactory:(id)a3;
- (void)setHome:(id)a3;
- (void)setHostAccessory:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInitialCategoryIdentifier:(id)a3;
- (void)setInitialManufacturer:(id)a3;
- (void)setInitialModel:(id)a3;
- (void)setLastPairingFailureTime:(double)a3;
- (void)setLastSeenDate:(id)a3;
- (void)setLowBattery:(BOOL)a3;
- (void)setManufacturer:(id)a3;
- (void)setModel:(id)a3;
- (void)setMsgDispatcher:(id)a3;
- (void)setNetworkAccessViolation:(id)a3;
- (void)setNetworkClientIdentifier:(id)a3;
- (void)setNetworkClientLAN:(int64_t)a3;
- (void)setNetworkClientProfileFingerprint:(id)a3;
- (void)setNetworkRouterUUID:(id)a3;
- (void)setPairingsAuditedTimestamp:(id)a3;
- (void)setPendingConfigurationIdentifier:(id)a3;
- (void)setPreferredMediaUser:(id)a3 selectionType:(unint64_t)a4 completion:(id)a5;
- (void)setPreferredMediaUserSelectionTypeNumber:(id)a3;
- (void)setPreferredMediaUserUUID:(id)a3;
- (void)setPrimary:(BOOL)a3;
- (void)setPrimaryProfileVersion:(id)a3;
- (void)setProductData:(id)a3;
- (void)setProvidedName:(id)a3;
- (void)setReachabilityPingEnabled:(BOOL)a3;
- (void)setReachabilityPingNotificationEnabled:(BOOL)a3;
- (void)setReachable:(BOOL)a3;
- (void)setRemoteAccessEnabled:(BOOL)a3;
- (void)setRemotelyReachable:(BOOL)a3;
- (void)setResetOnBackoffExpiry:(BOOL)a3;
- (void)setRoom:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSharedAdminAddedTimestamp:(id)a3;
- (void)setShouldProcessTransactionRemoval:(BOOL)a3;
- (void)setSoftwareUpdate:(id)a3;
- (void)setSoftwareUpdateForTesting:(id)a3;
- (void)setSuspendCapable:(BOOL)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setSuspendedCapable:(BOOL)a3;
- (void)setTimeBecameReachable:(id)a3;
- (void)setTimeBecameUnreachable:(id)a3;
- (void)setTransportReports:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWiFiCredentialType:(int64_t)a3;
- (void)setWiFiUniquePreSharedKey:(id)a3;
- (void)setWifiCredentialType:(int64_t)a3;
- (void)setreachabilityPingNotificationEnabled:(BOOL)a3;
- (void)startReachabilityCheck;
- (void)stopReachabilityCheck;
- (void)submitLogEvent:(id)a3;
- (void)submitLogEvent:(id)a3 error:(id)a4;
- (void)transactionAccessoryUpdatedForPreferredMediaUser:(id)a3 completionHandler:(id)a4;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)unconfigure;
- (void)updateCategory:(id)a3;
- (void)updateGenerationCounterWithReason:(id)a3 sourceUUID:(id)a4 shouldNotifyClients:(BOOL)a5;
- (void)updateMediaSession:(id)a3;
- (void)updateRoom:(id)a3 source:(unint64_t)a4;
- (void)updateSoftwareUpdate:(id)a3 completionHandler:(id)a4;
@end

@implementation HMDAccessory

- (HMDAccessory)hostAccessory
{
  os_unfair_recursive_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostAccessory);
  os_unfair_recursive_lock_unlock();
  return (HMDAccessory *)WeakRetained;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t171 != -1) {
    dispatch_once(&logCategory__hmf_once_t171, &__block_literal_global_442);
  }
  v2 = (void *)logCategory__hmf_once_v172;
  return v2;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)name
{
  configuredName = self->_configuredName;
  if (!configuredName) {
    configuredName = self->_providedName;
  }
  v3 = (void *)[(NSString *)configuredName copy];
  return (NSString *)v3;
}

- (BOOL)isReachable
{
  LOBYTE(self) = self->_reachable;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (id)attributeDescriptions
{
  v50[14] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v49 = [(HMDAccessory *)self name];
  v48 = (void *)[v3 initWithName:@"Nm" value:v49];
  v50[0] = v48;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v47 = [(HMDAccessory *)self getConfiguredName];
  v46 = (void *)[v4 initWithName:@"CN" value:v47];
  v50[1] = v46;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v45 = [(HMDAccessory *)self providedName];
  v44 = (void *)[v5 initWithName:@"PN" value:v45];
  v50[2] = v44;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v43 = [(HMDAccessory *)self uuid];
  v42 = (void *)[v6 initWithName:@"UUID" value:v43];
  v50[3] = v42;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v41 = [(HMDAccessory *)self category];
  v40 = [v41 name];
  v39 = (void *)[v7 initWithName:@"Cat" value:v40];
  v50[4] = v39;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  v38 = [(HMDAccessory *)self home];
  v37 = [v38 name];
  v36 = (void *)[v8 initWithName:@"HM" value:v37];
  v50[5] = v36;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v35 = [(HMDAccessory *)self room];
  v34 = [v35 name];
  v33 = (void *)[v9 initWithName:@"RM" value:v34];
  v50[6] = v33;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v32 = [(HMDAccessory *)self manufacturer];
  v31 = (void *)[v10 initWithName:@"MFG" value:v32];
  v50[7] = v31;
  id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
  v30 = [(HMDAccessory *)self model];
  v29 = (void *)[v11 initWithName:@"MO" value:v30];
  v50[8] = v29;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v28 = [(HMDAccessory *)self serialNumber];
  v13 = (void *)[v12 initWithName:@"SN" value:v28];
  v50[9] = v13;
  id v14 = objc_alloc(MEMORY[0x1E4F653F8]);
  v15 = [(HMDAccessory *)self productData];
  v16 = (void *)[v14 initWithName:@"PD" value:v15];
  v50[10] = v16;
  id v17 = objc_alloc(MEMORY[0x1E4F653F8]);
  v18 = [(HMDAccessory *)self firmwareVersion];
  v19 = (void *)[v17 initWithName:@"FV" value:v18];
  v50[11] = v19;
  id v20 = objc_alloc(MEMORY[0x1E4F653F8]);
  v21 = [(HMDAccessory *)self displayableFirmwareVersion];
  v22 = (void *)[v20 initWithName:@"DFV" value:v21];
  v50[12] = v22;
  id v23 = objc_alloc(MEMORY[0x1E4F653F8]);
  v24 = [(HMDAccessory *)self softwareUpdate];
  v25 = (void *)[v23 initWithName:@"SU" value:v24];
  v50[13] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:14];

  return v26;
}

- (NSString)manufacturer
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_manufacturer;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSString)model
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_model;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (HMDAccessoryVersion)firmwareVersion
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_firmwareVersion;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSString)providedName
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_providedName;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (HMDRoom)room
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_room;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSString)serialNumber
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_serialNumber;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSString)productData
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_productData;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (HMAccessoryCategory)category
{
  return self->_category;
}

- (NSString)displayableFirmwareVersion
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_displayableFirmwareVersion;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (HMDSoftwareUpdate)softwareUpdate
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_softwareUpdate;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (id)getConfiguredName
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_configuredName;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (BOOL)isReachableForXPCClients
{
  id v3 = [(HMDAccessory *)self home];
  if ([v3 isResidentSupported])
  {
  }
  else
  {
    BOOL v4 = [(HMDAccessory *)self isRemoteAccessEnabled];

    if (v4) {
      return 1;
    }
  }
  if ([(HMDAccessory *)self isReachable]) {
    return 1;
  }
  return [(HMDAccessory *)self isRemotelyReachable];
}

- (int64_t)reachableTransports
{
  id v3 = [(HMDAccessory *)self home];
  int v4 = [v3 isResidentSupported];

  if (v4) {
    BOOL v5 = [(HMDAccessory *)self isRemotelyReachable];
  }
  else {
    BOOL v5 = [(HMDAccessory *)self isRemoteAccessEnabled];
  }
  if (v5) {
    return 8;
  }
  else {
    return 0;
  }
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (BOOL)isRemoteAccessEnabled
{
  return self->_remoteAccessEnabled;
}

- (BOOL)isSuspendCapable
{
  LOBYTE(self) = self->_suspendCapable;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (NSString)identifier
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_identifier;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (id)metricLoggingVendorDetails
{
  v2 = [[HMDAccessoryMetricVendorDetails alloc] initWithAccessory:self];
  return v2;
}

- (void)submitLogEvent:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(HMDAccessory *)self home];
  id v8 = [v9 logEventSubmitter];
  [v8 submitLogEvent:v7 error:v6];
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = objc_msgSend(v4, "hmd_isForXPCTransport");
  int v6 = objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess");
  __int16 v7 = objc_msgSend(v4, "hmd_homeManagerOptions");
  id v8 = [(HMDAccessory *)self uuid];
  id v9 = [v8 UUIDString];
  [v4 encodeObject:v9 forKey:@"accessoryUUID"];

  id v10 = [(HMDAccessory *)self getConfiguredName];
  [v4 encodeObject:v10 forKey:@"accessoryConfiguredName"];

  id v11 = [(HMDAccessory *)self displayableFirmwareVersion];
  [v4 encodeObject:v11 forKey:*MEMORY[0x1E4F2C348]];

  id v12 = (void *)MEMORY[0x1E4F2EC28];
  if (v5)
  {
    v13 = [(HMDAccessory *)self name];
    [v4 encodeObject:v13 forKey:@"accessoryName"];

    id v14 = [(HMDAccessory *)self firmwareVersion];
    v15 = [v14 shortVersionString];
    [v4 encodeObject:v15 forKey:@"HM.firmwareVersion"];

    if (!v6)
    {
      v16 = [(HMDAccessory *)self manufacturer];
      [v4 encodeObject:v16 forKey:@"HM.manufacturer"];

      id v17 = [(HMDAccessory *)self model];
      [v4 encodeObject:v17 forKey:@"HM.model"];

      objc_msgSend(v4, "encodeBool:forKey:", -[HMDAccessory isSuspendCapable](self, "isSuspendCapable"), *v12);
      goto LABEL_9;
    }
  }
  else
  {
    v18 = [(HMDAccessory *)self configuredName];
    [v4 encodeObject:v18 forKey:@"accessoryName"];

    v19 = [(HMDAccessory *)self firmwareVersion];
    id v20 = [v19 rawVersionString];
    [v4 encodeObject:v20 forKey:@"HM.firmwareVersion"];

    v21 = [(HMDAccessory *)self hostAccessory];
    if (v21) {
      [v4 encodeConditionalObject:v21 forKey:@"HM.hostAccessory"];
    }
  }
  v22 = [(HMDAccessory *)self serialNumber];
  [v4 encodeObject:v22 forKey:@"HM.serialNumber"];

  id v23 = [(HMDAccessory *)self manufacturer];
  [v4 encodeObject:v23 forKey:@"HM.manufacturer"];

  v24 = [(HMDAccessory *)self model];
  [v4 encodeObject:v24 forKey:@"HM.model"];

  objc_msgSend(v4, "encodeBool:forKey:", -[HMDAccessory isSuspendCapable](self, "isSuspendCapable"), *v12);
  if (v6) {
    objc_msgSend(v4, "encodeInt32:forKey:", -[HMDAccessory accessoryReprovisionState](self, "accessoryReprovisionState"), @"HM.accessoryReprovisionState");
  }
LABEL_9:
  BOOL v25 = [(HMDAccessory *)self isCurrentAccessory];
  if (v5)
  {
    [v4 encodeBool:v25 forKey:*MEMORY[0x1E4F2C2F8]];
    BOOL v26 = [(HMDAccessory *)self supportsIdentify];
    [v4 encodeBool:v26 forKey:*MEMORY[0x1E4F2C7B0]];
  }
  if ((v7 & 0x9741) != 0 || v25 && (v7 & 0x10) != 0)
  {
    v27 = [(HMDAccessory *)self home];
    v28 = [(HMDAccessory *)self allowedHosts];
    [v4 encodeObject:v28 forKey:*MEMORY[0x1E4F2C120]];

    v29 = [(HMDAccessory *)self networkAccessViolation];
    [v4 encodeObject:v29 forKey:*MEMORY[0x1E4F2C440]];

    if ((objc_msgSend(v4, "hmd_isForRemoteGatewayCoder") & 1) == 0)
    {
      v30 = [(HMDAccessory *)self category];
      [v4 encodeObject:v30 forKey:@"HM.accessoryCategory"];
    }
    if ((v5 & 1) == 0)
    {
      v31 = [(HMDAccessory *)self firmwareVersion];
      [v4 encodeObject:v31 forKey:@"HM.firmwareVersionObject"];

      v32 = [(HMDAccessory *)self productData];
      [v4 encodeObject:v32 forKey:@"HMDA.productData2"];

      v33 = [(HMDAccessory *)self primaryProfileVersion];
      v34 = [v33 versionString];
      [v4 encodeObject:v34 forKey:@"HMDA.primaryProfileVersion"];
    }
    if (objc_msgSend(v4, "hmd_isForLocalStore"))
    {
      v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessory configNumber](self, "configNumber"));
      [v4 encodeObject:v35 forKey:@"HMDAccessoryConfigurationNumberCodingKey"];

      v36 = [(HMDAccessory *)self lastSeenDate];
      [v4 encodeObject:v36 forKey:@"HMDAccessoryLastSeenDateCodingKey"];

      objc_msgSend(v4, "encodeBool:forKey:", -[HMDAccessory isLowBattery](self, "isLowBattery"), @"HMDAccessoryLowBatteryCodingKey");
      v37 = [(HMDAccessory *)self sharedAdminAddedTimestamp];
      [v4 encodeObject:v37 forKey:@"HM.sharedAdminAddedTimestamp"];

      v38 = [(HMDAccessory *)self pairingsAuditedTimestamp];
      [v4 encodeObject:v38 forKey:@"HM.pairingsAuditedTimestamp"];
    }
    if ((objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
      || objc_msgSend(v4, "hmd_isForRemoteTransport")
      && (objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount") & 1) == 0
      && (objc_msgSend(v4, "hmd_isForRemoteUserAdministrator") & 1) != 0
      || objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount")
      && (objc_msgSend(v4, "hmd_isForRemoteGatewayCoder") & 1) == 0)
    {
      v39 = [(HMDAccessory *)self networkClientIdentifier];
      [v4 encodeObject:v39 forKey:@"HMDA.nci"];

      v40 = [(HMDAccessory *)self networkRouterUUID];
      v41 = [v40 UUIDString];
      [v4 encodeObject:v41 forKey:@"HMDA.nruuid"];

      objc_msgSend(v4, "encodeInteger:forKey:", -[HMDAccessory networkClientLAN](self, "networkClientLAN"), @"HMDA.ncl");
      v42 = [(HMDAccessory *)self networkClientProfileFingerprint];
      v43 = [v42 UUIDString];
      [v4 encodeObject:v43 forKey:@"HMDA.ncfp"];

      v44 = [(HMDAccessory *)self wiFiUniquePreSharedKey];
      [v4 encodeObject:v44 forKey:@"HMDA.wifiUniquePSK"];

      v45 = [(HMDAccessory *)self initialManufacturer];
      [v4 encodeObject:v45 forKey:@"HMDA.initialManufacturer"];

      v46 = [(HMDAccessory *)self initialModel];
      [v4 encodeObject:v46 forKey:@"HMDA.initialModel"];

      v47 = [(HMDAccessory *)self initialCategoryIdentifier];
      [v4 encodeObject:v47 forKey:@"HMDA.initialCategoryIdentifier"];
    }
    int v48 = v5 ^ 1 | v6;
    if (!objc_msgSend(v4, "hmd_isForRemoteGatewayCoder") && v48)
    {
      int64_t v49 = [(HMDAccessory *)self targetNetworkProtectionMode];
      [v4 encodeInteger:v49 forKey:*MEMORY[0x1E4F2C868]];
      int64_t v50 = [(HMDAccessory *)self currentNetworkProtectionMode];
      [v4 encodeInteger:v50 forKey:*MEMORY[0x1E4F2C300]];
      int64_t v51 = [(HMDAccessory *)self wiFiCredentialType];
      [v4 encodeInteger:v51 forKey:*MEMORY[0x1E4F2C8C8]];
      if (v5)
      {
        v52 = [(HMDAccessory *)self networkProtectionGroupUUID];
        v53 = (void *)MEMORY[0x1E4F2C500];
      }
      else
      {
        v52 = [(HMDAccessory *)self configuredNetworkProtectionGroupUUID];
        v53 = (void *)MEMORY[0x1E4F2C2C0];
      }
      v54 = [v52 UUIDString];
      [v4 encodeObject:v54 forKey:*v53];

      if ([(HMDAccessory *)self supportsSoftwareUpdate])
      {
        if ((objc_msgSend(v4, "hmd_isForNonAdminSharedUser") & 1) == 0)
        {
          if (v5 && ![v27 isAdminUser]) {
            goto LABEL_37;
          }
          v55 = [(HMDAccessory *)self softwareUpdate];
          [v4 encodeObject:v55 forKey:*MEMORY[0x1E4F2C740]];
        }
      }
    }
    if (!v5)
    {
      [v4 encodeConditionalObject:v27 forKey:@"home"];
      v67 = [(HMDAccessory *)self appData];
      [v4 encodeObject:v67 forKey:@"HM.appDataRepository"];

      if ((objc_msgSend(v4, "hmd_isForRemoteGatewayCoder") & 1) == 0)
      {
        v68 = [(HMDAccessory *)self providedName];
        [v4 encodeObject:v68 forKey:@"accessoryProvidedName"];

        v69 = [(HMDAccessory *)self room];
        [v4 encodeConditionalObject:v69 forKey:@"accessoryRoom"];
      }
      v70 = [(HMDAccessory *)self identifier];
      [v4 encodeObject:v70 forKey:@"accessoryServerIdentifier"];

      goto LABEL_51;
    }
LABEL_37:
    objc_msgSend(v4, "encodeBool:forKey:", -[HMDAccessory isReachableForXPCClients](self, "isReachableForXPCClients"), @"reachable");
    if (v6)
    {
      int64_t v56 = [(HMDAccessory *)self reachableTransports];
      [v4 encodeInteger:v56 forKey:*MEMORY[0x1E4F2EC38]];
      v57 = [(HMDAccessory *)self room];
      [v4 encodeObject:v57 forKey:@"accessoryRoom"];

      BOOL v58 = [(HMDAccessory *)self supportsNetworkProtection];
      [v4 encodeBool:v58 forKey:*MEMORY[0x1E4F2C4B0]];
      BOOL v59 = [(HMDAccessory *)self currentNetworkProtectionMode] == 1;
      [v4 encodeBool:v59 forKey:*MEMORY[0x1E4F2C458]];
      v60 = [(HMDAccessory *)self vendorInfo];
      v61 = [v60 appBundleID];
      [v4 encodeObject:v61 forKey:@"HM.bundleID"];

      v62 = [v60 appStoreID];
      [v4 encodeObject:v62 forKey:@"HM.storeID"];

      v63 = [(HMDAccessory *)self firmwareVersion];
      if (v63 && [(HMDAccessory *)self isPrimary])
      {
        v64 = [v60 firmwareVersion];
        v65 = [(HMDAccessory *)self firmwareVersion];
        uint64_t v66 = [v64 isGreaterThanVersion:v65];
      }
      else
      {
        uint64_t v66 = 0;
      }

      [v4 encodeBool:v66 forKey:@"HM.firmwareUpdateAvailable"];
      v74 = [(HMDAccessory *)self identifier];
      [v4 encodeObject:v74 forKey:@"accessoryServerIdentifier"];

      BOOL v75 = [(HMDAccessory *)self supportsWiFiReconfiguration];
      [v4 encodeBool:v75 forKey:*MEMORY[0x1E4F2C8D8]];
      BOOL v76 = [(HMDAccessory *)self supportsMultiUser];
      [v4 encodeBool:v76 forKey:*MEMORY[0x1E4F2C438]];
      BOOL v77 = [(HMDAccessory *)self supportsHomeLevelLocationServiceSetting];
      [v4 encodeBool:v77 forKey:*MEMORY[0x1E4F2C3F0]];
      BOOL v78 = [(HMDAccessory *)self supportsDoorbellChime];
      [v4 encodeBool:v78 forKey:*MEMORY[0x1E4F2C7A8]];
      BOOL v79 = [(HMDAccessory *)self supportsUserMediaSettings];
      [v4 encodeBool:v79 forKey:*MEMORY[0x1E4F2C818]];
      BOOL v80 = [(HMDAccessory *)self supportsAudioReturnChannel];
      [v4 encodeBool:v80 forKey:*MEMORY[0x1E4F2C780]];
      BOOL v81 = [(HMDAccessory *)self supportsMusicAlarm];
      [v4 encodeBool:v81 forKey:*MEMORY[0x1E4F2C7E8]];
      BOOL v82 = [(HMDAccessory *)self supportsAnnounce];
      [v4 encodeBool:v82 forKey:*MEMORY[0x1E4F2C778]];
      BOOL v83 = [(HMDAccessory *)self supportsMediaActions];
      [v4 encodeBool:v83 forKey:*MEMORY[0x1E4F2C7D0]];
    }
    else
    {
      v71 = [(HMDAccessory *)self room];
      [v4 encodeObject:v71 forKey:@"accessoryRoom"];

      BOOL v72 = [(HMDAccessory *)self supportsNetworkProtection];
      [v4 encodeBool:v72 forKey:*MEMORY[0x1E4F2C4B0]];
      BOOL v73 = [(HMDAccessory *)self currentNetworkProtectionMode] == 1;
      [v4 encodeBool:v73 forKey:*MEMORY[0x1E4F2C458]];
    }
    v84 = [(HMDAccessory *)self appData];
    [v84 encodeForXPCTransportWithCoder:v4 key:@"HM.appData"];

    v85 = [(HMDAccessory *)self accessoryProfiles];
    v86 = (void *)[v85 copy];

    if (v6)
    {
      v87 = v93;
      v93[0] = MEMORY[0x1E4F143A8];
      v93[1] = 3221225472;
      v88 = __32__HMDAccessory_encodeWithCoder___block_invoke;
    }
    else
    {
      v87 = &v91;
      uint64_t v91 = MEMORY[0x1E4F143A8];
      uint64_t v92 = 3221225472;
      v88 = __32__HMDAccessory_encodeWithCoder___block_invoke_2;
    }
    v87[2] = (uint64_t)v88;
    v87[3] = (uint64_t)&unk_1E6A0A9F0;
    v87[4] = (uint64_t)self;
    v89 = objc_msgSend(v86, "na_filter:", v91, v92);
    [v4 encodeObject:v89 forKey:@"HM.accessoryProfiles"];

LABEL_51:
    objc_msgSend(v4, "encodeBool:forKey:", -[HMDAccessory isPrimary](self, "isPrimary"), @"isPrimary");
    if (v48)
    {
      v90 = [(HMDAccessory *)self pendingConfigurationIdentifier];
      [v4 encodeObject:v90 forKey:*MEMORY[0x1E4F2C4D8]];
    }
  }
}

- (int64_t)currentNetworkProtectionMode
{
  os_unfair_recursive_lock_lock_with_options();
  int64_t currentNetworkProtectionMode = self->_currentNetworkProtectionMode;
  os_unfair_recursive_lock_unlock();
  return currentNetworkProtectionMode;
}

- (NSArray)accessoryProfiles
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = [(NSMutableSet *)self->_accessoryProfiles allObjects];
  os_unfair_recursive_lock_unlock();
  return (NSArray *)v3;
}

- (id)runtimeState
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"kAccessoryIsReachableKey";
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessory isReachableForXPCClients](self, "isReachableForXPCClients"));
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E4F2C518];
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAccessory reachableTransports](self, "reachableTransports"));
  v8[1] = v4;
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)populateModelObject:(id)a3 version:(int64_t)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v7 = v6;
  }
  else {
    __int16 v7 = 0;
  }
  id v8 = v7;
  id v9 = [(HMDAccessory *)self name];
  [v8 setName:v9];

  id v10 = [(HMDAccessory *)self configuredName];
  [v8 setConfiguredName:v10];

  id v11 = [(HMDAccessory *)self providedName];
  [v8 setProvidedName:v11];

  id v12 = [(HMDAccessory *)self categoryIdentifier];
  [v8 setPropertyIfNotNil:v12 named:@"accessoryCategory"];

  v13 = [(HMDAccessory *)self identifier];
  [v8 setIdentifier:v13];

  id v14 = [(HMDAccessory *)self room];
  uint64_t v15 = [v14 uuid];
  if (v15)
  {
    v16 = (void *)v15;
    id v17 = [(HMDAccessory *)self room];
    [v17 uuid];
    v18 = int64_t v72 = a4;
    v19 = [(HMDAccessory *)self home];
    [v19 roomForEntireHome];
    v21 = id v20 = v6;
    v22 = [v21 uuid];
    char v71 = [v18 isEqual:v22];

    id v6 = v20;
    a4 = v72;

    if (v71) {
      goto LABEL_8;
    }
    id v14 = [(HMDAccessory *)self room];
    id v23 = [v14 uuid];
    v24 = [v23 UUIDString];
    [v8 setRoomUUID:v24];
  }
LABEL_8:
  BOOL v25 = [NSNumber numberWithBool:self->_suspendCapable];
  [v8 setSuspendCapable:v25];

  if (a4 >= 4)
  {
    BOOL v26 = [(HMDAccessory *)self model];
    [v8 setPropertyIfNotNil:v26 named:@"model"];

    v27 = [(HMDAccessory *)self manufacturer];
    [v8 setPropertyIfNotNil:v27 named:@"manufacturer"];

    v28 = [(HMDAccessory *)self firmwareVersion];
    v29 = [v28 rawVersionString];
    [v8 setPropertyIfNotNil:v29 named:@"firmwareVersion"];

    v30 = [(HMDAccessory *)self displayableFirmwareVersion];
    [v8 setPropertyIfNotNil:v30 named:@"displayableFirmwareVersion"];

    v31 = [(HMDAccessory *)self serialNumber];
    [v8 setPropertyIfNotNil:v31 named:@"serialNumber"];

    v32 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAccessory currentNetworkProtectionMode](self, "currentNetworkProtectionMode"));
    [v8 setCurrentNetworkProtectionMode:v32];

    v33 = [(HMDAccessory *)self networkAccessViolation];
    v34 = [v33 lastViolationDate];
    v35 = EpochIntervalFromDate(v34);
    [v8 setLastNetworkAccessViolationOccurrenceSince1970:v35];

    v36 = [(HMDAccessory *)self networkAccessViolation];
    v37 = [v36 lastResetDate];
    v38 = EpochIntervalFromDate(v37);
    [v8 setLastNetworkAccessViolationResetSince1970:v38];

    v39 = (void *)MEMORY[0x1E4F1CA48];
    v40 = [(HMDAccessory *)self allowedHosts];
    v41 = objc_msgSend(v39, "arrayWithCapacity:", objc_msgSend(v40, "count"));

    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v42 = [(HMDAccessory *)self allowedHosts];
    uint64_t v43 = [v42 countByEnumeratingWithState:&v73 objects:v77 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v74 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = [*(id *)(*((void *)&v73 + 1) + 8 * i) jsonWANRule];
          [v41 addObject:v47];
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v73 objects:v77 count:16];
      }
      while (v44);
    }

    int v48 = (void *)[v41 copy];
    [v8 setAppliedFirewallWANRules:v48];

    int64_t v49 = [(HMDAccessory *)self productData];
    [v8 setPropertyIfNotNil:v49 named:@"productDataV2"];

    int64_t v50 = [(HMDAccessory *)self configuredNetworkProtectionGroupUUID];
    int64_t v51 = [v50 UUIDString];
    [v8 setConfiguredNetworkProtectionGroupUUIDString:v51];

    v52 = [(HMDAccessory *)self networkClientIdentifier];
    [v8 setNetworkClientIdentifier:v52];

    v53 = [(HMDAccessory *)self networkRouterUUID];
    v54 = [v53 UUIDString];
    [v8 setNetworkRouterUUID:v54];

    v55 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAccessory networkClientLAN](self, "networkClientLAN"));
    [v8 setNetworkClientLAN:v55];

    int64_t v56 = [(HMDAccessory *)self networkClientProfileFingerprint];
    v57 = [v56 UUIDString];
    [v8 setNetworkClientProfileFingerprint:v57];

    BOOL v58 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAccessory wiFiCredentialType](self, "wiFiCredentialType"));
    [v8 setWiFiCredentialType:v58];

    BOOL v59 = [(HMDAccessory *)self wiFiUniquePreSharedKey];
    [v8 setWiFiUniquePreSharedKey:v59];

    v60 = [(HMDAccessory *)self pendingConfigurationIdentifier];
    [v8 setPendingConfigurationIdentifier:v60];

    v61 = [(HMDAccessory *)self primaryProfileVersion];
    v62 = [v61 versionString];
    [v8 setPropertyIfNotNil:v62 named:@"primaryProfileVersion"];

    v63 = [(HMDAccessory *)self initialManufacturer];
    [v8 setPropertyIfNotNil:v63 named:@"initialManufacturer"];

    v64 = [(HMDAccessory *)self initialModel];
    [v8 setPropertyIfNotNil:v64 named:@"initialModel"];

    v65 = [(HMDAccessory *)self initialCategoryIdentifier];
    [v8 setPropertyIfNotNil:v65 named:@"initialCategoryIdentifier"];

    uint64_t v66 = [(HMDAccessory *)self hostAccessory];
    v67 = [v66 uuid];
    v68 = [v67 UUIDString];
    [v8 setHostAccessoryUUID:v68];

    v69 = [(HMDAccessory *)self lastSeenDate];
    [v8 setPropertyIfNotNil:v69 named:@"lastSeenDate"];

    v70 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessory isLowBattery](self, "isLowBattery"));
    [v8 setPropertyIfNotNil:v70 named:@"lowBattery"];
  }
}

- (HMDAccessoryNetworkAccessViolation)networkAccessViolation
{
  return self->_networkAccessViolation;
}

- (NSArray)allowedHosts
{
  return self->_allowedHosts;
}

- (NSNumber)initialCategoryIdentifier
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_initialCategoryIdentifier;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSString)initialModel
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_initialModel;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSString)initialManufacturer
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_initialManufacturer;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (int64_t)wiFiCredentialType
{
  os_unfair_recursive_lock_lock_with_options();
  int64_t wiFiCredentialType = self->_wiFiCredentialType;
  os_unfair_recursive_lock_unlock();
  return wiFiCredentialType;
}

- (NSString)pendingConfigurationIdentifier
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_pendingConfigurationIdentifier;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (id)networkProtectionGroupUUID
{
  id v3 = [(HMDAccessory *)self configuredNetworkProtectionGroupUUID];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(HMDAccessory *)self defaultNetworkProtectionGroupUUID];
  }
  id v6 = v5;

  return v6;
}

- (NSUUID)configuredNetworkProtectionGroupUUID
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_configuredNetworkProtectionGroupUUID;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSUUID)defaultNetworkProtectionGroupUUID
{
  os_unfair_recursive_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  id v4 = WeakRetained;
  defaultNetworkProtectionGroupUUID = self->_defaultNetworkProtectionGroupUUID;
  if (defaultNetworkProtectionGroupUUID) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = WeakRetained == 0;
  }
  if (!v6)
  {
    if (self->_initialManufacturer && self->_initialCategoryIdentifier)
    {
      +[HMDAccessoryNetworkProtectionGroupModel modelIDForHome:manufacturer:category:](HMDAccessoryNetworkProtectionGroupModel, "modelIDForHome:manufacturer:category:", WeakRetained);
      __int16 v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      id v8 = self->_defaultNetworkProtectionGroupUUID;
      self->_defaultNetworkProtectionGroupUUID = v7;

      defaultNetworkProtectionGroupUUID = self->_defaultNetworkProtectionGroupUUID;
    }
    else
    {
      defaultNetworkProtectionGroupUUID = 0;
    }
  }
  id v9 = defaultNetworkProtectionGroupUUID;

  os_unfair_recursive_lock_unlock();
  return v9;
}

- (NSData)wiFiUniquePreSharedKey
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_wiFiUniquePreSharedKey;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (HMFVersion)primaryProfileVersion
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_primaryProfileVersion;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSUUID)networkRouterUUID
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_networkRouterUUID;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSUUID)networkClientProfileFingerprint
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_networkClientProfileFingerprint;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (int64_t)networkClientLAN
{
  os_unfair_recursive_lock_lock_with_options();
  int64_t networkClientLAN = self->_networkClientLAN;
  os_unfair_recursive_lock_unlock();
  return networkClientLAN;
}

- (NSNumber)networkClientIdentifier
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_networkClientIdentifier;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (NSDate)lastSeenDate
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_lastSeenDate;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (BOOL)isLowBattery
{
  LOBYTE(self) = self->_lowBattery;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (NSString)configuredName
{
  return self->_configuredName;
}

- (NSNumber)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (HMDVendorModelEntry)vendorInfo
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = +[HMDVendorDataManager sharedVendorDataManager];
  id v4 = [(HMDAccessory *)self productData];
  if (!v4
    || ([v3 vendorModelEntryForProductData:v4],
        (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    BOOL v6 = [(HMDAccessory *)self manufacturer];
    __int16 v7 = [(HMDAccessory *)self model];
    id v8 = self;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    if (v10
      && ([(HMDAccessory *)v10 bridge], (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0)
      && (id v12 = (void *)v11, v13 = [(HMDAccessory *)v8 isPrimary], v12, !v13))
    {
      id v17 = [(HMDAccessory *)v10 bridge];
      uint64_t v15 = [v17 manufacturer];

      id v14 = [v17 model];

      v18 = (void *)MEMORY[0x1D9452090]();
      v19 = v8;
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v21 = HMFGetLogIdentifier();
        [(HMDAccessory *)v19 uuid];
        v22 = id v23 = v18;
        *(_DWORD *)buf = 138544130;
        BOOL v25 = v21;
        __int16 v26 = 2114;
        v27 = v22;
        __int16 v28 = 2114;
        v29 = v15;
        __int16 v30 = 2114;
        v31 = v14;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Overriding vendor info for %{public}@ with Manufacturer: %{public}@ Model: %{public}@", buf, 0x2Au);

        v18 = v23;
      }
    }
    else
    {
      id v14 = v7;
      uint64_t v15 = v6;
    }
    id v5 = 0;
    if (v15 && v14)
    {
      id v5 = [v3 vendorModelEntryForManufacturer:v15 model:v14];
    }
  }
  return (HMDVendorModelEntry *)v5;
}

- (BOOL)supportsMediaActions
{
  return 0;
}

- (BOOL)supportsHomeLevelLocationServiceSetting
{
  return 0;
}

- (BOOL)supportsAudioReturnChannel
{
  return 0;
}

- (HMDApplicationData)appData
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_appData;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (unint64_t)accessoryReprovisionState
{
  return self->_accessoryReprovisionState;
}

uint64_t __32__HMDAccessory_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _shouldFilterAccessoryProfileForEntitledClients:a2] ^ 1;
}

- (BOOL)_shouldFilterAccessoryProfileForEntitledClients:(id)a3
{
  return 0;
}

- (BOOL)isCurrentAccessory
{
  return 0;
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (BOOL)shouldEnableDaemonRelaunch
{
  return 0;
}

- (unint64_t)configNumber
{
  os_unfair_recursive_lock_lock_with_options();
  unint64_t configNumber = self->_configNumber;
  os_unfair_recursive_lock_unlock();
  return configNumber;
}

- (void)setReachable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  if (self->_reachable == v3)
  {
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    self->_reachable = v3;
    BOOL remotelyReachable = self->_remotelyReachable;
    uint64_t v6 = os_unfair_recursive_lock_unlock();
    __int16 v7 = (void *)MEMORY[0x1D9452090](v6);
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = HMFBooleanToString();
      int v22 = 138543618;
      id v23 = v10;
      __int16 v24 = 2114;
      BOOL v25 = v11;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Updated isReachable to %{public}@", (uint8_t *)&v22, 0x16u);
    }
    id v12 = [(HMDAccessory *)v8 home];
    BOOL v13 = v12;
    if (v12)
    {
      [v12 reachabilityChangedForAccessory:v8 reachable:v3];
      if (!remotelyReachable) {
        [(HMDAccessory *)v8 _notifyConnectivityChangedWithRemoteAccessChanged:0];
      }
    }
    id v14 = [MEMORY[0x1E4F1C9C8] date];
    if (v3)
    {
      [(HMDAccessory *)v8 setTimeBecameReachable:v14];

      uint64_t v15 = [(HMDAccessory *)v8 notificationCenter];
      logAndPostNotificationWithNotificationCenter(v15, @"HMDAccessoryIsReachableNotification", v8, 0);

      v16 = (void *)MEMORY[0x1D9452090]();
      id v17 = v8;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = HMFGetLogIdentifier();
        [(HMDAccessory *)v17 reachabilityPingEnabled];
        id v20 = HMFBooleanToString();
        int v22 = 138543618;
        id v23 = v19;
        __int16 v24 = 2112;
        BOOL v25 = v20;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@reachabilityPingEnabled: %@", (uint8_t *)&v22, 0x16u);
      }
      if ([(HMDAccessory *)v17 reachabilityPingEnabled]) {
        [(HMDAccessory *)v17 startReachabilityCheck];
      }
    }
    else
    {
      [(HMDAccessory *)v8 setTimeBecameUnreachable:v14];

      [(HMDAccessory *)v8 _checkForLastSeenUpdateOnBecomingUnreachable];
      v21 = [(HMDAccessory *)v8 notificationCenter];
      logAndPostNotificationWithNotificationCenter(v21, @"HMDAccessoryIsNotReachableNotification", v8, 0);
    }
  }
}

- (NSUUID)preferredMediaUserUUID
{
  return self->_preferredMediaUserUUID;
}

- (NSNumber)preferredMediaUserSelectionTypeNumber
{
  return self->_preferredMediaUserSelectionTypeNumber;
}

- (int64_t)targetNetworkProtectionMode
{
  BOOL v3 = [(HMDAccessory *)self home];
  id v4 = [v3 networkProtectionGroupRegistry];
  id v5 = [(HMDAccessory *)self networkProtectionGroupUUID];
  int64_t v6 = [v4 targetProtectionModeForGroupWithUUID:v5];

  return v6;
}

- (NSUUID)spiClientIdentifier
{
  v2 = [(HMDAccessory *)self uuid];
  BOOL v3 = spiClientIdentifierForUUID(v2);

  return (NSUUID *)v3;
}

- (BOOL)isRemotelyReachable
{
  LOBYTE(self) = self->_remotelyReachable;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (BOOL)hasActiveSession
{
  LOBYTE(self) = self->_connected;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (void)setLastPairingFailureTime:(double)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_lastPairingFailureTime = a3;
  os_unfair_recursive_lock_unlock();
}

- (void)setConsecutivePairingFailures:(unint64_t)a3
{
  self->_consecutivePairingFailures = a3;
}

- (double)lastPairingFailureTime
{
  os_unfair_recursive_lock_lock_with_options();
  double lastPairingFailureTime = self->_lastPairingFailureTime;
  os_unfair_recursive_lock_unlock();
  return lastPairingFailureTime;
}

- (unint64_t)consecutivePairingFailures
{
  return self->_consecutivePairingFailures;
}

- (id)privateDescription
{
  BOOL v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  id v5 = [(HMDAccessory *)self uuid];
  int64_t v6 = [v5 UUIDString];
  __int16 v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return v7;
}

- (id)accessoryBulletinContext
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"accessory";
  v2 = [(HMDAccessory *)self contextID];
  v6[0] = v2;
  BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (NSUUID)contextSPIUniqueIdentifier
{
  BOOL v3 = +[HMDProcessInfo privateClientIdentifierSalt];
  id v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = [(HMDAccessory *)self uuid];
  int64_t v6 = objc_msgSend(v4, "hm_deriveUUIDFromBaseUUID:identifierSalt:", v5, v3);

  return (NSUUID *)v6;
}

- (NSString)contextID
{
  BOOL v3 = NSString;
  id v4 = [(HMDAccessory *)self home];
  id v5 = [v4 contextID];
  int64_t v6 = [(HMDAccessory *)self uuid];
  __int16 v7 = [v6 UUIDString];
  id v8 = [v3 stringWithFormat:@"%@:%@", v5, v7];

  return (NSString *)v8;
}

- (void)_handlePreviewAllowedHosts:(id)a3
{
  id v4 = a3;
  if ([(HMDAccessory *)self supportsNetworkProtection])
  {
    id v5 = [(HMDAccessory *)self home];
    int64_t v6 = +[HMDAccessoryAllowedHostsPreviewHelper helperForHome:v5];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__HMDAccessory_NetworkProtection2___handlePreviewAllowedHosts___block_invoke;
    void v8[3] = &unk_1E6A10FD0;
    id v9 = v4;
    [v6 fetchAllowedHostsForAccessory:self completion:v8];
  }
  else
  {
    __int16 v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v7];
  }
}

void __63__HMDAccessory_NetworkProtection2___handlePreviewAllowedHosts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = v6;
  if (v5)
  {
    uint64_t v10 = *MEMORY[0x1E4F2DA50];
    id v8 = encodeRootObjectForSPIClients(v5);
    v11[0] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    if (!v6)
    {
      __int16 v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    }
    id v9 = 0;
  }
  [*(id *)(a1 + 32) respondWithPayload:v9 error:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuredName, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_hashedRouteFactory, 0);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_networkAccessViolation, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_transportReports, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_hostAccessory);
  objc_storeStrong((id *)&self->_hashRouteID, 0);
  objc_storeStrong((id *)&self->_preferredMediaUserSelectionTypeNumber, 0);
  objc_storeStrong((id *)&self->_preferredMediaUserUUID, 0);
  objc_storeStrong((id *)&self->_pendingConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_timeBecameReachable, 0);
  objc_storeStrong((id *)&self->_timeBecameUnreachable, 0);
  objc_storeStrong((id *)&self->_pairingsAuditedTimestamp, 0);
  objc_storeStrong((id *)&self->_sharedAdminAddedTimestamp, 0);
  objc_storeStrong((id *)&self->_softwareUpdate, 0);
  objc_storeStrong((id *)&self->_initialCategoryIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryProfileVersion, 0);
  objc_storeStrong((id *)&self->_defaultNetworkProtectionGroupUUID, 0);
  objc_storeStrong((id *)&self->_configuredNetworkProtectionGroupUUID, 0);
  objc_storeStrong((id *)&self->_wiFiUniquePreSharedKey, 0);
  objc_storeStrong((id *)&self->_allowedHosts, 0);
  objc_storeStrong((id *)&self->_networkClientProfileFingerprint, 0);
  objc_storeStrong((id *)&self->_networkRouterUUID, 0);
  objc_storeStrong((id *)&self->_networkClientIdentifier, 0);
  objc_storeStrong((id *)&self->_lastSeenDate, 0);
  objc_storeStrong((id *)&self->_providedName, 0);
  objc_storeStrong((id *)&self->_productData, 0);
  objc_storeStrong((id *)&self->_appData, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_displayableFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_initialManufacturer, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_initialModel, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_accessoryProfiles, 0);
}

- (void)setAccessoryReprovisionState:(unint64_t)a3
{
  self->_accessoryReprovisionState = a3;
}

- (void)setCategoryIdentifier:(id)a3
{
}

- (void)setMsgDispatcher:(id)a3
{
}

- (void)setRemoteAccessEnabled:(BOOL)a3
{
  self->_remoteAccessEnabled = a3;
}

- (void)setHashedRouteFactory:(id)a3
{
}

- (id)hashedRouteFactory
{
  return objc_getProperty(self, a2, 408, 1);
}

- (void)setFeaturesDataSource:(id)a3
{
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 400, 1);
}

- (void)setNetworkAccessViolation:(id)a3
{
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (BOOL)supportsManagedConfigurationProfile
{
  return self->_supportsManagedConfigurationProfile;
}

- (void)setTransportReports:(id)a3
{
}

- (void)setShouldProcessTransactionRemoval:(BOOL)a3
{
  self->_shouldProcessTransactionRemoval = a3;
}

- (BOOL)shouldProcessTransactionRemoval
{
  return self->_shouldProcessTransactionRemoval;
}

- (void)setSuspendCapable:(BOOL)a3
{
  self->_suspendCapable = a3;
}

- (BOOL)supportsTVOSUpdateManualUpdateAvailableNotification
{
  return self->_supportsTVOSUpdateManualUpdateAvailableNotification;
}

- (BOOL)supportsCoordinationFreeDoorbellChime
{
  return self->_supportsCoordinationFreeDoorbellChime;
}

- (BOOL)supportsCoordinationDoorbellChime
{
  return self->_supportsCoordinationDoorbellChime;
}

- (BOOL)supportsUserMediaSettings
{
  return self->_supportsUserMediaSettings;
}

- (BOOL)supportsDoorbellChime
{
  return self->_supportsDoorbellChime;
}

- (void)setHome:(id)a3
{
}

- (void)setPrimary:(BOOL)a3
{
  self->_primary = a3;
}

- (void)setUuid:(id)a3
{
}

- (void)setHashRouteID:(id)a3
{
}

- (void)setPreferredMediaUserSelectionTypeNumber:(id)a3
{
}

- (void)setPreferredMediaUserUUID:(id)a3
{
}

- (void)setReachabilityPingNotificationEnabled:(BOOL)a3
{
  self->_reachabilityPingNotificationEnabled = a3;
}

- (void)setAllowedHosts:(id)a3
{
}

- (void)setWiFiCredentialType:(int64_t)a3
{
  self->_int64_t wiFiCredentialType = a3;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)submitLogEvent:(id)a3
{
  id v4 = a3;
  id v6 = [(HMDAccessory *)self home];
  id v5 = [v6 logEventSubmitter];
  [v5 submitLogEvent:v4 error:0];
}

- (void)notifyClientsOfUpdatedAccessoryControllableValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1D9452090](self, a2);
  id v6 = self;
  __int16 v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = HMFBooleanToString();
    *(_DWORD *)buf = 138543618;
    v31 = v8;
    __int16 v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of updated accessory controllable value: %@", buf, 0x16u);
  }
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", v3, *MEMORY[0x1E4F2C2E8]);
  v29 = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];

  uint64_t v12 = *MEMORY[0x1E4F2C2F0];
  BOOL v13 = [MEMORY[0x1E4F654B0] entitledMessageWithName:*MEMORY[0x1E4F2C2F0] messagePayload:v11];
  id v14 = objc_alloc(MEMORY[0x1E4F65488]);
  uint64_t v15 = [(HMDAccessory *)v6 messageTargetUUID];
  v16 = (void *)[v14 initWithTarget:v15];
  [v13 setDestination:v16];

  id v17 = [[HMDHomeManagerXPCMessageSendPolicy alloc] initWithEntitlements:0 options:-1 active:1];
  [v13 setSendPolicy:v17];

  v18 = [(HMDAccessory *)v6 msgDispatcher];
  v19 = (void *)[v13 copy];
  [v18 sendMessage:v19 completionHandler:0];

  id v20 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v21 = v20;
  }
  else {
    v21 = 0;
  }
  int v22 = v21;

  id v23 = v20;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v24 = v23;
  }
  else {
    __int16 v24 = 0;
  }
  BOOL v25 = v24;

  if (v25)
  {
    BOOL v26 = [(HMDAccessory *)v25 supportsFirmwareUpdate];
    if (v22) {
      goto LABEL_14;
    }
  }
  else
  {
    BOOL v26 = 0;
    if (v22)
    {
LABEL_14:
      v27 = [(HMDAccessory *)v23 home];
      [v27 saveToCurrentAccountWithReason:v12];

      goto LABEL_15;
    }
  }
  if (v26) {
    goto LABEL_14;
  }
LABEL_15:
}

- (BOOL)supportsUnreachablePing
{
  return 0;
}

- (void)stopReachabilityCheck
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)startReachabilityCheck
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)handleRemovedSoftwareUpdateModel:(id)a3 message:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 transactionResult];
  BOOL v9 = -[HMDAccessory _allowSoftwareUpdateChangeFromSource:](self, "_allowSoftwareUpdateChangeFromSource:", [v8 source]);
  uint64_t v10 = (void *)MEMORY[0x1D9452090]();
  uint64_t v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (!v9)
  {
    if (v13)
    {
      v18 = HMFGetLogIdentifier();
      v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "source"));
      int v20 = 138543618;
      v21 = v18;
      __int16 v22 = 2112;
      id v23 = v19;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing software update is not allowed from source %@", (uint8_t *)&v20, 0x16u);
    }
    id v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    [v7 respondWithError:v17];
    goto LABEL_9;
  }
  if (v13)
  {
    id v14 = HMFGetLogIdentifier();
    uint64_t v15 = [(HMDAccessory *)v11 softwareUpdate];
    int v20 = 138543618;
    v21 = v14;
    __int16 v22 = 2112;
    id v23 = v15;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing software update: %@", (uint8_t *)&v20, 0x16u);
  }
  [(HMDAccessory *)v11 setSoftwareUpdate:0];
  [v8 markChanged];
  v16 = [v7 responseHandler];

  if (v16)
  {
    id v17 = [v7 responseHandler];
    v17[2](v17, 0, 0);
LABEL_9:
  }
}

- (void)handleAddedSoftwareUpdateModel:(id)a3 message:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 transactionResult];
  if (-[HMDAccessory _allowSoftwareUpdateChangeFromSource:](self, "_allowSoftwareUpdateChangeFromSource:", [v8 source]))
  {
    BOOL v9 = [[HMDSoftwareUpdate alloc] initWithModel:v6];
    uint64_t v10 = (void *)MEMORY[0x1D9452090]([(HMDAccessory *)self setSoftwareUpdate:v9]);
    uint64_t v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      BOOL v13 = HMFGetLogIdentifier();
      int v21 = 138543618;
      __int16 v22 = v13;
      __int16 v23 = 2112;
      uint64_t v24 = v9;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Added software update: %@", (uint8_t *)&v21, 0x16u);
    }
    [v8 markChanged];
    id v14 = [v7 responseHandler];

    if (v14)
    {
      uint64_t v15 = [v7 responseHandler];
      v15[2](v15, 0, 0);
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = HMFGetLogIdentifier();
      objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "source"));
      int v20 = (HMDSoftwareUpdate *)objc_claimAutoreleasedReturnValue();
      int v21 = 138543618;
      __int16 v22 = v19;
      __int16 v23 = 2112;
      uint64_t v24 = v20;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Adding software update is not allowed from source %@", (uint8_t *)&v21, 0x16u);
    }
    BOOL v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    [v7 respondWithError:v9];
  }
}

- (void)handleUpdatedSoftwareUpdateModel:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 transactionResult];
  if (-[HMDAccessory _allowSoftwareUpdateChangeFromSource:](self, "_allowSoftwareUpdateChangeFromSource:", [v11 source]))
  {
    uint64_t v12 = [(HMDAccessory *)self softwareUpdate];
    [v12 transactionObjectUpdated:v8 newValues:v9 message:v10];
  }
  else
  {
    BOOL v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = self;
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "source"));
      int v18 = 138543618;
      v19 = v16;
      __int16 v20 = 2112;
      int v21 = v17;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating software update is not allowed from source %@", (uint8_t *)&v18, 0x16u);
    }
    uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    [v10 respondWithError:v12];
  }
}

- (BOOL)_allowSoftwareUpdateChangeFromSource:(unint64_t)a3
{
  id v5 = [(HMDAccessory *)self home];
  int v6 = [v5 isOwnerUser];

  if (!v6) {
    return 1;
  }
  BOOL result = [(HMDAccessory *)self supportsFirmwareUpdate];
  if (a3 < 2) {
    return 1;
  }
  return result;
}

- (void)_applySoftwareUpdateModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDAccessory *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(HMDAccessory *)self home];
  id v10 = [v9 backingStore];
  uint64_t v11 = +[HMDBackingStoreTransactionOptions defaultLocalOptions];
  uint64_t v12 = [v10 transaction:@"HMDAccessorySoftwareUpdate" options:v11];

  [v12 add:v7 withMessage:0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__HMDAccessory__applySoftwareUpdateModel_completion___block_invoke;
  v14[3] = &unk_1E6A19358;
  id v15 = v6;
  id v13 = v6;
  [v12 run:v14];
}

uint64_t __53__HMDAccessory__applySoftwareUpdateModel_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateSoftwareUpdate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessory *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__HMDAccessory_updateSoftwareUpdate_completionHandler___block_invoke;
  block[3] = &unk_1E6A193D0;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __55__HMDAccessory_updateSoftwareUpdate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) supportsSoftwareUpdate])
  {
    v2 = [*(id *)(a1 + 32) softwareUpdate];
    if (HMFEqualObjects())
    {
      uint64_t v3 = (void *)MEMORY[0x1D9452090]();
      id v4 = *(id *)(a1 + 32);
      id v5 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v43 = v6;
        _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot update software update, matches existing update", buf, 0xCu);
      }
      if (!*(void *)(a1 + 48)) {
        goto LABEL_39;
      }
      id v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:1];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_38;
    }
    id v12 = *(id *)(a1 + 32);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v7 = v13;

    if (([v7 supportsCHIP] & 1) == 0)
    {
      if (!*(void *)(a1 + 40)) {
        goto LABEL_23;
      }
      id v14 = [*(id *)(a1 + 32) firmwareVersion];
      id v15 = [*(id *)(a1 + 40) version];
      int v16 = [v14 isAtLeastVersion:v15];

      if (v16)
      {
        id v17 = (void *)MEMORY[0x1D9452090]();
        id v18 = *(id *)(a1 + 32);
        v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v20 = HMFGetLogIdentifier();
          int v21 = [*(id *)(a1 + 40) version];
          uint64_t v22 = [v21 versionString];
          __int16 v23 = [*(id *)(a1 + 32) firmwareVersion];
          [v23 versionString];
          uint64_t v24 = v41 = v17;
          *(_DWORD *)buf = 138543874;
          uint64_t v43 = v20;
          __int16 v44 = 2112;
          uint64_t v45 = v22;
          __int16 v46 = 2112;
          v47 = v24;
          _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Software update, '%@', is older than current software version, '%@'", buf, 0x20u);

          id v17 = v41;
        }

        if (!*(void *)(a1 + 48)) {
          goto LABEL_38;
        }
        uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v26 = 44;
        goto LABEL_36;
      }
    }
    v27 = *(void **)(a1 + 40);
    if (v27 && ![v27 downloadSize])
    {
      v36 = (void *)MEMORY[0x1D9452090]();
      id v37 = *(id *)(a1 + 32);
      v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = HMFGetLogIdentifier();
        v40 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v43 = v39;
        __int16 v44 = 2112;
        uint64_t v45 = v40;
        _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@Software update, '%@', has invalid 0 download size.", buf, 0x16u);
      }
      if (!*(void *)(a1 + 48)) {
        goto LABEL_38;
      }
      uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = 3;
LABEL_36:
      uint64_t v34 = [v25 hmErrorWithCode:v26];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_37:

LABEL_38:
      goto LABEL_39;
    }
LABEL_23:
    uint64_t v28 = (void *)MEMORY[0x1D9452090]();
    id v29 = *(id *)(a1 + 32);
    __int16 v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = HMFGetLogIdentifier();
      __int16 v32 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v43 = v31;
      __int16 v44 = 2112;
      uint64_t v45 = v32;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Updating software update to: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 40) configureWithAccessory:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 32) messageDispatcher:0];
    v33 = *(void **)(a1 + 40);
    if (v33)
    {
      uint64_t v34 = [v33 model];
    }
    else
    {
      uint64_t v34 = [v2 transactionWithObjectChangeType:0];
      [v34 setSoftwareVersion:0];
      [v34 setDisplayableSoftwareVersion:0];
      [v34 setState:0];
      [v34 setInstallDuration:0];
      [v34 setDownloadSize:0];
      [v34 setReleaseDate:0];
    }
    if (v2) {
      uint64_t v35 = 2;
    }
    else {
      uint64_t v35 = 1;
    }
    [v34 setObjectChangeType:v35];
    [*(id *)(a1 + 32) _applySoftwareUpdateModel:v34 completion:*(void *)(a1 + 48)];
    goto LABEL_37;
  }
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v43 = v11;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot update software update for an accessory that does not support software update", buf, 0xCu);
  }
  if (*(void *)(a1 + 48))
  {
    v2 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_39:
  }
}

- (BOOL)supportsFirmwareUpdate
{
  return 0;
}

- (BOOL)requiresRemovalOnPrimaryResident
{
  return 0;
}

- (BOOL)supportsMessagedHomePodSettings
{
  return 0;
}

- (BOOL)supportsSoftwareUpdateV2
{
  return 0;
}

- (BOOL)supportsSoftwareUpdate
{
  return 0;
}

- (void)updateGenerationCounterWithReason:(id)a3 sourceUUID:(id)a4 shouldNotifyClients:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v11 = [(HMDAccessory *)self home];
  id v10 = [v11 homeManager];
  [v10 updateGenerationCounterWithReason:v9 sourceUUID:v8 shouldNotifyClients:v5];
}

- (id)notificationCenterForSoftwareUpdate:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
}

- (void)setSoftwareUpdate:(id)a3
{
  id v10 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (HMFEqualObjects())
  {
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    BOOL v5 = self->_softwareUpdate;
    objc_storeStrong((id *)&self->_softwareUpdate, a3);
    os_unfair_recursive_lock_unlock();
    id v6 = [(HMDAccessory *)self msgDispatcher];
    [v10 configureWithAccessory:self dataSource:self messageDispatcher:v6];

    id v7 = [(HMDAccessory *)self home];
    if (v7)
    {
      if ([(HMDAccessory *)self isCurrentAccessory])
      {
        id v8 = [v7 homeManager];
        id v9 = [v8 softwareUpdateManager];

        [v9 updateAvailableUpdate:v10];
      }
      [v7 reevaluateAccessoryInfo];
    }

    if (v5)
    {
      [(HMDSoftwareUpdate *)v5 invalidate];
    }
  }
}

- (void)setSoftwareUpdateForTesting:(id)a3
{
  id v4 = (HMDSoftwareUpdate *)a3;
  os_unfair_recursive_lock_lock_with_options();
  softwareUpdate = self->_softwareUpdate;
  self->_softwareUpdate = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)__handlePairingIdentityRequest:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 uuidForKey:@"kAccessoryUUID"];
  id v6 = [(HMDAccessory *)self uuid];
  char v7 = HMFEqualObjects();

  if (v7)
  {
    id v8 = self;
    if ([(HMDAccessory *)v8 conformsToProtocol:&unk_1F2E2B960]) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    id v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = v8;
    id v13 = HMFGetOSLogHandle();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (!v10)
    {
      if (v14)
      {
        __int16 v30 = HMFGetLogIdentifier();
        int v38 = 138543362;
        v39 = v30;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Attempt to retrieve pairing identity from an accessory that does not support pairing identity", (uint8_t *)&v38, 0xCu);
      }
      int v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      [v4 respondWithError:v16];
      goto LABEL_26;
    }
    if (v14)
    {
      id v15 = HMFGetLogIdentifier();
      int v38 = 138543362;
      v39 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Received request to to retrieve pairing identity for accessory", (uint8_t *)&v38, 0xCu);
    }
    int v16 = [(HMDAccessory *)v10 pairingIdentity];
    if (v16)
    {
      uint64_t v17 = [v4 BOOLForKey:*MEMORY[0x1E4F2C4C0]];
      id v18 = [v4 proxyConnection];
      char v19 = [v18 entitlements];

      if (!v17 || (v19 & 0x10) != 0)
      {
        v36 = [(HMDAccessory *)v12 home];
        id v37 = [v36 homeManager];
        [v37 sendPairingIdentity:v16 includePrivateKey:v17 requestMessage:v4];

        goto LABEL_25;
      }
      __int16 v20 = (void *)MEMORY[0x1D9452090]();
      int v21 = v12;
      uint64_t v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        __int16 v23 = HMFGetLogIdentifier();
        int v38 = 138543362;
        v39 = v23;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Client requested private key but does not have entitlement for private key", (uint8_t *)&v38, 0xCu);
      }
      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = 17;
    }
    else
    {
      v31 = (void *)MEMORY[0x1D9452090]();
      __int16 v32 = v12;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        uint64_t v34 = HMFGetLogIdentifier();
        uint64_t v35 = [(HMDAccessory *)v32 name];
        int v38 = 138543618;
        v39 = v34;
        __int16 v40 = 2112;
        id v41 = v35;
        _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Pairing identity for accessory not found : %@", (uint8_t *)&v38, 0x16u);
      }
      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = 2;
    }
    v36 = [v24 hmErrorWithCode:v25];
    [v4 respondWithError:v36];
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  uint64_t v26 = (void *)MEMORY[0x1D9452090]();
  v27 = self;
  uint64_t v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    id v29 = HMFGetLogIdentifier();
    int v38 = 138543618;
    v39 = v29;
    __int16 v40 = 2112;
    id v41 = v4;
    _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Attempt to retrieve pairing identity with mismatching identifier from message: %@", (uint8_t *)&v38, 0x16u);
  }
  id v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  [v4 respondWithError:v10];
LABEL_27:
}

- (BOOL)supportsMinimumUserPrivilege
{
  return 0;
}

- (void)_updateHost:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v4 = [(HMDAccessory *)self hostAccessory];
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F29128], "hmf_zeroUUID");
  int v6 = [v24 isEqual:v5];

  if (v6) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (!v4
      || ([v4 uuid],
          id v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v8 isEqual:v24],
          v8,
          (v9 & 1) == 0))
    {
      id v10 = v24;
      if (self)
      {
        id v11 = [(HMDAccessory *)self home];
        id v12 = [v11 accessoryWithUUID:v10];
        id v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          __int16 v23 = v11;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v15 = [v11 allNewlyConfiguredAccessories];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v26;
            while (2)
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v26 != v18) {
                  objc_enumerationMutation(v15);
                }
                __int16 v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
                int v21 = [v20 uuid];
                char v22 = [v21 isEqual:v10];

                if (v22)
                {
                  id v14 = v20;

                  goto LABEL_21;
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          id v14 = 0;
LABEL_21:
          id v13 = 0;
          id v11 = v23;
        }
      }
      else
      {
        id v14 = 0;
      }

      [v4 removeHostedAccessory:self];
      [v14 addHostedAccessory:self];
      [(HMDAccessory *)self setHostAccessory:v14];
    }
  }
  else
  {
    [v4 removeHostedAccessory:self];
    [(HMDAccessory *)self setHostAccessory:0];
  }
}

- (void)setHostAccessory:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_storeWeak((id *)&self->_hostAccessory, v4);

  os_unfair_recursive_lock_unlock();
}

- (void)removeHostedAccessory:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  BOOL v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  char v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)addHostedAccessory:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  BOOL v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  char v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (NSString)hashRouteID
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(HMDAccessory *)self providesHashRouteID])
  {
    os_unfair_recursive_lock_lock_with_options();
    p_hashRouteID = &self->_hashRouteID;
    hashRouteID = self->_hashRouteID;
    if (hashRouteID)
    {
      BOOL v5 = hashRouteID;
    }
    else
    {
      uint64_t v6 = os_unfair_recursive_lock_unlock();
      BOOL v7 = (void *)MEMORY[0x1D9452090](v6);
      id v8 = self;
      char v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = HMFGetLogIdentifier();
        int v18 = 138543362;
        char v19 = v10;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Do not have cached hashed route, reaching out to siri to fetch it", (uint8_t *)&v18, 0xCu);
      }
      id v11 = [(HMDAccessory *)v8 hashedRouteFactory];
      id v12 = [(HMDAccessory *)v8 identifier];
      ((void (**)(void, void *))v11)[2](v11, v12);
      BOOL v5 = (NSString *)objc_claimAutoreleasedReturnValue();

      id v13 = (void *)MEMORY[0x1D9452090]();
      id v14 = v8;
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        int v18 = 138543618;
        char v19 = v16;
        __int16 v20 = 2112;
        int v21 = v5;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Caching hashed route from siri: %@", (uint8_t *)&v18, 0x16u);
      }
      os_unfair_recursive_lock_lock_with_options();
      objc_storeStrong((id *)p_hashRouteID, v5);
    }
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    BOOL v5 = 0;
  }
  return v5;
}

- (void)resetHashedRoute
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(HMDAccessory *)self providesHashRouteID])
  {
    uint64_t v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = self;
    BOOL v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      int v8 = 138543362;
      char v9 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting cached hashed route", (uint8_t *)&v8, 0xCu);
    }
    os_unfair_recursive_lock_lock_with_options();
    hashRouteID = v4->_hashRouteID;
    v4->_hashRouteID = 0;

    os_unfair_recursive_lock_unlock();
  }
}

- (BOOL)providesHashRouteID
{
  return 0;
}

uint64_t __32__HMDAccessory_encodeWithCoder___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _shouldFilterAccessoryProfileForUnentitledClients:a2] ^ 1;
}

- (BOOL)supportsDiagnosticsTransfer
{
  return 0;
}

- (BOOL)supportsAnnounce
{
  return 0;
}

- (BOOL)supportsJustSiri
{
  return 0;
}

- (BOOL)supportsDropIn
{
  return 0;
}

- (BOOL)supportsAudioAnalysis
{
  return 0;
}

- (BOOL)supportsThirdPartyMusic
{
  return 0;
}

- (BOOL)supportsMusicAlarm
{
  return 0;
}

- (BOOL)_shouldFilterAccessoryProfileForUnentitledClients:(id)a3
{
  return 0;
}

- (BOOL)supportsCompanionInitiatedObliterate
{
  return 0;
}

- (BOOL)supportsCompanionInitiatedRestart
{
  return 0;
}

- (BOOL)supportsMultiUser
{
  return 0;
}

- (BOOL)supportsTargetControl
{
  return 0;
}

- (BOOL)supportsTargetController
{
  return 0;
}

- (void)handleIdentifyAccessoryMessage:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  id v4 = a3;
  id v5 = [v3 hmErrorWithCode:48];
  [v4 respondWithError:v5];
}

- (BOOL)supportsIdentify
{
  return 0;
}

- (HMDAccessory)initWithCoder:(id)a3
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessory *)self init];
  if (!v5)
  {
LABEL_47:
    char v19 = v5;
    goto LABEL_48;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryUUID"];
  if (v6) {
    BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
  }
  else {
    BOOL v7 = 0;
  }
  p_uuid = &v5->_uuid;
  objc_storeStrong((id *)&v5->_uuid, v7);
  if (v6) {

  }
  if (*p_uuid)
  {
    char v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
    objc_storeWeak((id *)&v5->_home, v9);

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryRoom"];
    room = v5->_room;
    v5->_room = (HMDRoom *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.accessoryCategory"];
    category = v5->_category;
    v5->_category = (HMAccessoryCategory *)v12;

    if (v5->_category)
    {
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F2E520], "categoryIdentifierForCategory:");
      categoryIdentifier = v5->_categoryIdentifier;
      v5->_categoryIdentifier = (NSNumber *)v14;
    }
    else
    {
      __int16 v20 = +[HMDHAPMetadata getSharedInstance];
      int v21 = [v20 categoryForOther];
      uint64_t v22 = [v21 identifier];
      __int16 v23 = v5->_categoryIdentifier;
      v5->_categoryIdentifier = (NSNumber *)v22;

      uint64_t v24 = [MEMORY[0x1E4F2E520] categoryWithCategoryIdentifier:v5->_categoryIdentifier];
      categoryIdentifier = v5->_category;
      v5->_category = (HMAccessoryCategory *)v24;
    }

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDAccessoryLastSeenDateCodingKey"];
    lastSeenDate = v5->_lastSeenDate;
    v5->_lastSeenDate = (NSDate *)v25;

    v5->_lowBattery = [v4 decodeBoolForKey:@"HMDAccessoryLowBatteryCodingKey"];
    if ([v4 containsValueForKey:@"HMDAccessoryConfigurationNumberCodingKey"])
    {
      long long v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDAccessoryConfigurationNumberCodingKey"];
      v5->_unint64_t configNumber = [v27 unsignedIntegerValue];
    }
    long long v28 = [(HMAccessoryCategory *)v5->_category categoryType];
    int v29 = [v28 isEqualToString:*MEMORY[0x1E4F2C238]];

    if (v29)
    {
      uint64_t v30 = (void *)MEMORY[0x1E4F2E520];
      id v31 = objc_alloc(MEMORY[0x1E4F29128]);
      __int16 v32 = (void *)[v31 initWithUUIDString:*MEMORY[0x1E4F2C230]];
      uint64_t v33 = [v30 categoryWithIdentifier:v32];
      uint64_t v34 = v5->_category;
      v5->_category = (HMAccessoryCategory *)v33;
    }
    int v35 = [v4 containsValueForKey:@"accessoryConfiguredName"];
    uint64_t v36 = objc_opt_class();
    if (v35) {
      id v37 = @"accessoryConfiguredName";
    }
    else {
      id v37 = @"accessoryName";
    }
    int v38 = [v4 decodeObjectOfClass:v36 forKey:v37];
    uint64_t v39 = objc_msgSend(v38, "hm_truncatedNameString");
    configuredName = v5->_configuredName;
    v5->_configuredName = (NSString *)v39;

    id v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryProvidedName"];
    uint64_t v42 = objc_msgSend(v41, "hm_truncatedNameString");
    providedName = v5->_providedName;
    v5->_providedName = (NSString *)v42;

    v5->_suspendCapable = [v4 decodeBoolForKey:*MEMORY[0x1E4F2EC28]];
    LODWORD(v41) = [v4 containsValueForKey:@"accessoryServerIdentifier"];
    uint64_t v44 = objc_opt_class();
    if (v41)
    {
      uint64_t v45 = [v4 decodeObjectOfClass:v44 forKey:@"accessoryServerIdentifier"];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v45;
    }
    else
    {
      identifier = [v4 decodeObjectOfClass:v44 forKey:@"accessoryIdentifier"];
      uint64_t v47 = [MEMORY[0x1E4F5BC00] serverIdentifierWithUniqueIdentifier:identifier];
      uint64_t v48 = v5->_identifier;
      v5->_identifier = (NSString *)v47;
    }
    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.manufacturer"];
    manufacturer = v5->_manufacturer;
    v5->_manufacturer = (NSString *)v49;

    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.model"];
    model = v5->_model;
    v5->_model = (NSString *)v51;

    uint64_t v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.serialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v53;

    uint64_t v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDA.initialManufacturer"];
    initialManufacturer = v5->_initialManufacturer;
    v5->_initialManufacturer = (NSString *)v55;

    uint64_t v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDA.initialModel"];
    initialModel = v5->_initialModel;
    v5->_initialModel = (NSString *)v57;

    uint64_t v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDA.initialCategoryIdentifier"];
    initialCategoryIdentifier = v5->_initialCategoryIdentifier;
    v5->_initialCategoryIdentifier = (NSNumber *)v59;

    if ([v4 containsValueForKey:@"HMDA.productData2"])
    {
      uint64_t v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDA.productData2"];
      productData = v5->_productData;
      v5->_productData = (NSString *)v61;
    }
    uint64_t v63 = *MEMORY[0x1E4F2C348];
    if ([v4 containsValueForKey:*MEMORY[0x1E4F2C348]])
    {
      uint64_t v64 = [v4 decodeObjectOfClass:objc_opt_class() forKey:v63];
      displayableFirmwareVersion = v5->_displayableFirmwareVersion;
      v5->_displayableFirmwareVersion = (NSString *)v64;
    }
    if ([v4 containsValueForKey:@"HM.firmwareVersionObject"])
    {
      uint64_t v66 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.firmwareVersionObject"];
      firmwareVersion = v5->_firmwareVersion;
      v5->_firmwareVersion = (HMDAccessoryVersion *)v66;
    }
    else
    {
      firmwareVersion = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.firmwareVersion"];
      if (firmwareVersion)
      {
        v68 = [[HMDAccessoryVersion alloc] initWithVersionString:firmwareVersion];
        v69 = v5->_firmwareVersion;
        v5->_firmwareVersion = v68;
      }
    }

    uint64_t v70 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2C740]];
    softwareUpdate = v5->_softwareUpdate;
    v5->_softwareUpdate = (HMDSoftwareUpdate *)v70;

    uint64_t v72 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.appDataRepository"];
    appData = v5->_appData;
    v5->_appData = (HMDApplicationData *)v72;

    [(HMDApplicationData *)v5->_appData updateParentUUIDIfNil:*p_uuid];
    uint64_t v74 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDA.nci"];
    networkClientIdentifier = v5->_networkClientIdentifier;
    v5->_networkClientIdentifier = (NSNumber *)v74;

    long long v76 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDA.nruuid"];
    uint64_t v77 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v76];
    networkRouterUUID = v5->_networkRouterUUID;
    v5->_networkRouterUUID = (NSUUID *)v77;

    v5->_int64_t networkClientLAN = [v4 decodeIntegerForKey:@"HMDA.ncl"];
    BOOL v79 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDA.ncfp"];
    uint64_t v80 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v79];
    networkClientProfileFingerprint = v5->_networkClientProfileFingerprint;
    v5->_networkClientProfileFingerprint = (NSUUID *)v80;

    uint64_t v82 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2C440]];
    networkAccessViolation = v5->_networkAccessViolation;
    v5->_networkAccessViolation = (HMDAccessoryNetworkAccessViolation *)v82;

    uint64_t v84 = *MEMORY[0x1E4F2C300];
    if ([v4 containsValueForKey:*MEMORY[0x1E4F2C300]]) {
      v5->_int64_t currentNetworkProtectionMode = [v4 decodeIntegerForKey:v84];
    }
    uint64_t v85 = *MEMORY[0x1E4F2C8C8];
    if ([v4 containsValueForKey:*MEMORY[0x1E4F2C8C8]]) {
      v5->_int64_t wiFiCredentialType = [v4 decodeIntegerForKey:v85];
    }
    v86 = (void *)MEMORY[0x1E4F1CAD0];
    v107[0] = objc_opt_class();
    v107[1] = objc_opt_class();
    v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:2];
    v88 = objc_msgSend(v86, "setWithArray:", v87, v107[0]);
    uint64_t v89 = [v4 decodeObjectOfClasses:v88 forKey:*MEMORY[0x1E4F2C120]];
    allowedHosts = v5->_allowedHosts;
    v5->_allowedHosts = (NSArray *)v89;

    uint64_t v91 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDA.wifiUniquePSK"];
    wiFiUniquePreSharedKey = v5->_wiFiUniquePreSharedKey;
    v5->_wiFiUniquePreSharedKey = (NSData *)v91;

    v93 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2C2C0]];
    if (v93)
    {
      uint64_t v94 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v93];
      configuredNetworkProtectionGroupUUID = v5->_configuredNetworkProtectionGroupUUID;
      v5->_configuredNetworkProtectionGroupUUID = (NSUUID *)v94;
    }
    v96 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDA.primaryProfileVersion"];
    if (v96)
    {
      uint64_t v97 = [objc_alloc(MEMORY[0x1E4F65590]) initWithVersionString:v96];
      primaryProfileVersion = v5->_primaryProfileVersion;
      v5->_primaryProfileVersion = (HMFVersion *)v97;
    }
    if ([v4 containsValueForKey:@"HM.sharedAdminAddedTimestamp"])
    {
      uint64_t v99 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.sharedAdminAddedTimestamp"];
      sharedAdminAddedTimestamp = v5->_sharedAdminAddedTimestamp;
      v5->_sharedAdminAddedTimestamp = (HMDUserManagementOperationTimestamp *)v99;
    }
    if ([v4 containsValueForKey:@"HM.pairingsAuditedTimestamp"])
    {
      uint64_t v101 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.pairingsAuditedTimestamp"];
      pairingsAuditedTimestamp = v5->_pairingsAuditedTimestamp;
      v5->_pairingsAuditedTimestamp = (HMDUserManagementOperationTimestamp *)v101;
    }
    if ([v4 containsValueForKey:@"HM.hostAccessory"])
    {
      v103 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.hostAccessory"];
      [v103 addHostedAccessory:v5];
      objc_storeWeak((id *)&v5->_hostAccessory, v103);
    }
    uint64_t v104 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2C4D8]];
    pendingConfigurationIdentifier = v5->_pendingConfigurationIdentifier;
    v5->_pendingConfigurationIdentifier = (NSString *)v104;

    goto LABEL_47;
  }
  uint64_t v16 = (void *)MEMORY[0x1D9452090]();
  uint64_t v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    int v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v109 = v18;
    __int16 v110 = 2112;
    v111 = v6;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_FAULT, "%{public}@Cannot decode accessory with invalid uuid: %@", buf, 0x16u);
  }

  char v19 = 0;
LABEL_48:

  return v19;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  id v4 = [(HMDAccessory *)self messageTargetUUID];
  id v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (id)logIdentifier
{
  if (isInternalBuild())
  {
    id v3 = NSString;
    id v4 = [(HMDAccessory *)self uuid];
    id v5 = [(HMDAccessory *)self name];
    uint64_t v6 = [v3 stringWithFormat:@"%@/%@", v4, v5];
  }
  else
  {
    id v4 = [(HMDAccessory *)self uuid];
    uint64_t v6 = [v4 UUIDString];
  }

  return v6;
}

- (id)dumpNetworkState
{
  v2 = self;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  id v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  if (v4)
  {
    uint64_t v6 = NSString;
    BOOL v7 = [(HMDAccessory *)v4 uuid];
    int v8 = [v7 UUIDString];
    if ([(HMDAccessory *)v4 isIPSecureSessionEstablished]) {
      char v9 = @"YES";
    }
    else {
      char v9 = @"NO";
    }
    if ([(HMDAccessory *)v4 isBLESecureSessionEstablished]) {
      uint64_t v10 = @"YES";
    }
    else {
      uint64_t v10 = @"NO";
    }
    id v11 = [v6 stringWithFormat:@"uuid: %@ ipSession: %@ bleSession: %@ ", v8, v9, v10];

    [v5 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F64EA0]];
  }

  return v5;
}

- (id)dumpSimpleState
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  id v15 = NSString;
  id v4 = [(HMDAccessory *)self name];
  id v5 = [(HMDAccessory *)self uuid];
  uint64_t v6 = [v5 UUIDString];
  BOOL v7 = "YES";
  if (![(HMDAccessory *)self isReachable]
    && ![(HMDAccessory *)self isRemotelyReachable])
  {
    BOOL v7 = "NO";
  }
  if ([(HMDAccessory *)self isReachable]) {
    int v8 = "Yes";
  }
  else {
    int v8 = "No";
  }
  if ([(HMDAccessory *)self isRemotelyReachable]) {
    char v9 = "Yes";
  }
  else {
    char v9 = "No";
  }
  uint64_t v10 = [(HMDAccessory *)self room];
  id v11 = [v10 name];
  uint64_t v12 = [(HMDAccessory *)self firmwareVersion];
  id v13 = [v15 stringWithFormat:@"name: %@, uuid: %@, Accessory Reachable: %s (local: %s, remote: %s), room: %@, firmwareVersion: %@", v4, v6, v7, v8, v9, v11, v12];

  [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F64EA0]];
  return v3;
}

- (id)dumpState
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  BOOL v83 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:5];
  id v3 = self;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  uint64_t v82 = v5;
  int v6 = [(HMDAccessory *)v5 isSecureSessionEstablished];
  uint64_t v84 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v80 = [(HMDAccessory *)v3 name];
  uint64_t v78 = [(HMDAccessory *)v3 providedName];
  long long v76 = [(HMDAccessory *)v3 configuredName];
  long long v75 = [(HMDAccessory *)v3 uuid];
  obuint64_t j = [v75 UUIDString];
  uint64_t v74 = [(HMDAccessory *)v3 identifier];
  BOOL v7 = "YES";
  if (![(HMDAccessory *)v3 isReachable]
    && ![(HMDAccessory *)v3 isRemotelyReachable])
  {
    BOOL v7 = "NO";
  }
  char v71 = v7;
  if ([(HMDAccessory *)v3 isReachable]) {
    int v8 = "Yes";
  }
  else {
    int v8 = "No";
  }
  uint64_t v72 = v8;
  if ([(HMDAccessory *)v3 isRemotelyReachable]) {
    char v9 = "Yes";
  }
  else {
    char v9 = "No";
  }
  uint64_t v70 = v9;
  if ([(HMDAccessory *)v3 isSuspendCapable]) {
    uint64_t v10 = "Yes";
  }
  else {
    uint64_t v10 = "No";
  }
  if (v6) {
    id v11 = "Yes";
  }
  else {
    id v11 = "No";
  }
  v68 = v11;
  v69 = v10;
  long long v73 = [(HMDAccessory *)v3 room];
  v67 = [v73 name];
  uint64_t v66 = [(HMDAccessory *)v3 firmwareVersion];
  [(HMDAccessory *)v3 primaryProfileVersion];
  v65 = v86 = v3;
  uint64_t v64 = [(HMDAccessory *)v3 productData];
  uint64_t v12 = [(HMDAccessory *)v3 sharedAdminAddedTimestamp];
  id v13 = [(HMDAccessory *)v86 pairingsAuditedTimestamp];
  uint64_t v14 = [(HMDAccessory *)v86 pendingConfigurationIdentifier];
  id v15 = [(HMDAccessory *)v86 urlString];
  uint64_t v16 = [(HMDAccessory *)v86 lastSeenDate];
  [(HMDAccessory *)v86 isLowBattery];
  uint64_t v17 = HMFBooleanToString();
  objc_msgSend(v84, "stringWithFormat:", @"name: %@, providedName: %@, configuredName: %@, uuid: %@, identifier: %@, Accessory Reachable: %s (local: %s, remote: %s), suspendCapable: %s, HAP secure session: %s, room: %@, firmwareVersion: %@, primaryProfileVersion: %@, productData: %@, share admin added: %@, pairings audited: %@,pendingConfigurationIdentifier: %@, assistantIdentifier: %@, lastSeenDate: %@, lowBattery: %@", v80, v78, v76, obj, v74, v71, v72, v70, v69, v68, v67, v66, v65, v64, v12, v13,
    v14,
    v15,
    v16,
  uint64_t v85 = v17);

  int v18 = v86;
  char v19 = [(HMDAccessory *)v86 wiFiUniquePreSharedKey];
  if (v19)
  {
    if (isInternalBuild()) {
      __int16 v20 = (__CFString *)[[NSString alloc] initWithData:v19 encoding:1];
    }
    else {
      __int16 v20 = @"(present)";
    }
  }
  else
  {
    __int16 v20 = @"(null)";
  }
  uint64_t v22 = v83;
  int v21 = v85;
  [(HMDAccessory *)v86 supportsWiFiReconfiguration];
  __int16 v23 = HMFBooleanToString();
  uint64_t v24 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAccessory wiFiCredentialType](v86, "wiFiCredentialType"));
  [v85 appendFormat:@", supportsWiFiReconfiguration: %@, wiFiCredentialType: %@, wiFiUniquePreSharedKey: %@", v23, v24, v20];

  [(HMDAccessory *)v86 supportsNetworkProtection];
  uint64_t v25 = HMFBooleanToString();
  [v85 appendFormat:@", supportsNetworkProtection: %@", v25];

  if ([(HMDAccessory *)v86 supportsNetworkProtection])
  {
    BOOL v79 = v20;
    BOOL v81 = v19;
    long long v26 = [(HMDAccessory *)v86 networkClientIdentifier];
    long long v27 = [(HMDAccessory *)v86 networkRouterUUID];
    long long v28 = [v27 UUIDString];
    int v29 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAccessory targetNetworkProtectionMode](v86, "targetNetworkProtectionMode"));
    uint64_t v30 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAccessory currentNetworkProtectionMode](v86, "currentNetworkProtectionMode"));
    id v31 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAccessory networkClientLAN](v86, "networkClientLAN"));
    __int16 v32 = [(HMDAccessory *)v86 networkClientProfileFingerprint];
    [v85 appendFormat:@", networkClientIdentifier: %@, networkRouterUUID: %@, targetNetworkProtectionMode: %@, currentNetworkProtectionMode: %@, LAN: %@, Fingerprint: %@", v26, v28, v29, v30, v31, v32];

    uint64_t v33 = [(HMDAccessory *)v86 allowedHosts];
    uint64_t v34 = v33;
    if (v33)
    {
      int v35 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v33, "count"));
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      uint64_t v77 = v34;
      id obja = v34;
      uint64_t v36 = [obja countByEnumeratingWithState:&v93 objects:v98 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v94;
        do
        {
          for (uint64_t i = 0; i != v37; ++i)
          {
            if (*(void *)v94 != v38) {
              objc_enumerationMutation(obja);
            }
            __int16 v40 = *(void **)(*((void *)&v93 + 1) + 8 * i);
            id v41 = NSString;
            uint64_t v42 = [v40 name];
            uint64_t v43 = [v40 addresses];
            uint64_t v44 = [v43 allObjects];
            uint64_t v45 = [v44 componentsJoinedByString:@","];
            __int16 v46 = [v41 stringWithFormat:@"Allow %@ (%@) purpose = 0x%lx", v42, v45, objc_msgSend(v40, "purpose")];
            [v35 addObject:v46];
          }
          uint64_t v37 = [obja countByEnumeratingWithState:&v93 objects:v98 count:16];
        }
        while (v37);
      }

      uint64_t v47 = (void *)[v35 copy];
      [v83 setObject:v47 forKeyedSubscript:@"Accessory Firewall WAN Rule"];

      int v21 = v85;
      int v18 = v86;
      uint64_t v34 = v77;
    }

    uint64_t v22 = v83;
    __int16 v20 = v79;
    char v19 = v81;
  }
  [(HMDAccessory *)v18 supportsDiagnosticsTransfer];
  uint64_t v48 = HMFBooleanToString();
  [v21 appendFormat:@", supportsDiagnosticsTransfer: %@", v48];

  uint64_t v49 = (void *)[v21 copy];
  [v22 setObject:v49 forKeyedSubscript:*MEMORY[0x1E4F64EA0]];

  int64_t v50 = [(HMDAccessory *)v18 appData];
  uint64_t v51 = [v50 dumpState];
  [v22 setObject:v51 forKeyedSubscript:*MEMORY[0x1E4F64D80]];

  v52 = [(HMDAccessory *)v18 category];

  if (v52)
  {
    uint64_t v53 = [(HMDAccessory *)v18 category];
    v54 = [v53 dumpState];
    [v22 setObject:v54 forKeyedSubscript:*MEMORY[0x1E4F64D50]];
  }
  uint64_t v55 = [(HMDAccessory *)v18 accessoryProfiles];
  if ([v55 count])
  {
    int64_t v56 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v55, "count"));
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v57 = v55;
    uint64_t v58 = [v57 countByEnumeratingWithState:&v89 objects:v97 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      uint64_t v60 = *(void *)v90;
      do
      {
        for (uint64_t j = 0; j != v59; ++j)
        {
          if (*(void *)v90 != v60) {
            objc_enumerationMutation(v57);
          }
          v62 = [*(id *)(*((void *)&v89 + 1) + 8 * j) dumpState];
          [v56 addObject:v62];
        }
        uint64_t v59 = [v57 countByEnumeratingWithState:&v89 objects:v97 count:16];
      }
      while (v59);
    }

    [v22 setObject:v56 forKeyedSubscript:*MEMORY[0x1E4F64D60]];
    int v21 = v85;
  }

  return v22;
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v9 = v8;
  }
  else {
    char v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    [(HMDAccessory *)self appDataRemoved:v10 message:v7];
  }
  else
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v17 = 138543874;
      int v18 = v14;
      __int16 v19 = 2112;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = (id)objc_opt_class();
      id v15 = v22;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved]", (uint8_t *)&v17, 0x20u);
    }
    uint64_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [v7 respondWithError:v16];
  }
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v9;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;
  if (v12)
  {
    __transactionAccessoryUpdated(self, v12, v10);
    id v13 = v9;
  }
  else
  {
    id v13 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = 0;
    }
    id v15 = v14;

    if (v15)
    {
      [(HMDAccessory *)self appDataUpdated:v15 message:v10];
    }
    else
    {
      id v13 = v13;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v16 = v13;
      }
      else {
        uint64_t v16 = 0;
      }
      id v17 = v16;

      if (v17)
      {
        int v18 = [(HMDAccessory *)self softwareUpdate];
        if (v18)
        {
          if ([v17 propertyWasSet:@"softwareVersion"])
          {
            __int16 v19 = [v17 softwareVersion];

            if (v19)
            {
              id v20 = [v17 softwareVersion];
              __int16 v21 = [v18 version];
              int v22 = [v20 isEqualToVersion:v21];

              if (v22) {
                [(HMDAccessory *)self handleUpdatedSoftwareUpdateModel:v8 newValues:v17 message:v10];
              }
              else {
                [(HMDAccessory *)self handleAddedSoftwareUpdateModel:v17 message:v10];
              }
            }
            else
            {
              [(HMDAccessory *)self handleRemovedSoftwareUpdateModel:v17 message:v10];
            }
          }
          else
          {
            [(HMDAccessory *)self handleUpdatedSoftwareUpdateModel:v8 newValues:v17 message:v10];
          }
        }
        else
        {
          long long v28 = [v17 softwareVersion];

          if (v28) {
            [(HMDAccessory *)self handleAddedSoftwareUpdateModel:v17 message:v10];
          }
        }
      }
      else
      {
        uint64_t v23 = (void *)MEMORY[0x1D9452090]();
        uint64_t v24 = self;
        uint64_t v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          long long v26 = HMFGetLogIdentifier();
          int v29 = 138543874;
          uint64_t v30 = v26;
          __int16 v31 = 2112;
          id v32 = v13;
          __int16 v33 = 2112;
          id v34 = (id)objc_opt_class();
          id v27 = v34;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", (uint8_t *)&v29, 0x20u);
        }
        id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        [v10 respondWithError:v13];
      }
    }
  }
}

- (BOOL)supportsUserManagement
{
  return 0;
}

- (void)__handleAuditPairings:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HMDAccessory *)self isPrimary])
  {
    id v5 = self;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    if (v7)
    {
      id v8 = +[HMDBackingStoreTransactionOptions optionsWithSource:1 destination:2 mustReplay:0 mustPush:0];
      id v9 = [(HMDAccessory *)v5 home];
      id v10 = [v9 backingStore];
      id v11 = [v4 name];
      id v12 = [v10 transaction:v11 options:v8];

      id v13 = +[HMDUserManagementOperation auditUserManagementOperationAccessory:v5 model:0];
      uint64_t v14 = [(HMDAccessory *)v5 uuid];
      id v15 = [v13 modelObjectWithChangeType:1 parentUUID:v14];

      if (v15)
      {
        [v12 add:v15 withMessage:v4];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __38__HMDAccessory___handleAuditPairings___block_invoke;
        v29[3] = &unk_1E6A197F0;
        id v30 = v4;
        [v12 run:v29];
        uint64_t v16 = v30;
      }
      else
      {
        uint64_t v25 = (void *)MEMORY[0x1D9452090]();
        long long v26 = v5;
        id v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          long long v28 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v32 = v28;
          _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to create audit model", buf, 0xCu);
        }
        uint64_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
        [v4 respondWithError:v16];
      }
    }
    else
    {
      __int16 v21 = (void *)MEMORY[0x1D9452090]();
      int v22 = v5;
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v32 = v24;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Cannot audit accessory", buf, 0xCu);
      }
      id v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      [v4 respondWithError:v8];
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x1D9452090]();
    int v18 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v32 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Can only audit pairings on a primary accessory", buf, 0xCu);
    }
    id v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v7];
  }
}

void __38__HMDAccessory___handleAuditPairings___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) responseHandler];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, id, void))v4)[2](v4, v5, 0);
  }
}

- (void)__handleListPairings:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  if ([(HMDAccessory *)v5 conformsToProtocol:&unk_1F2E2B960]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __37__HMDAccessory___handleListPairings___block_invoke;
    v13[3] = &unk_1E6A10FD0;
    id v14 = v4;
    [(HMDAccessory *)v7 pairingsWithCompletionHandler:v13];
    id v8 = v14;
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = v5;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Does not support user management", buf, 0xCu);
    }
    id v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v8];
  }
}

void __37__HMDAccessory___handleListPairings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v23 = a1;
    id v8 = [MEMORY[0x1E4F28E78] string];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v24 = v5;
    obuint64_t j = v5;
    uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v14 = NSString;
          id v15 = [v13 identifier];
          uint64_t v16 = [v13 publicKey];
          uint64_t v17 = [v16 data];
          [v13 permissions];
          int v18 = HMFBooleanToString();
          __int16 v19 = [v14 stringWithFormat:@"Identifier = %@, PublicKey = %@, Admin = %@\n", v15, v17, v18];
          [v8 appendString:v19];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v10);
    }

    id v30 = @"kDescriptionKey";
    id v20 = (void *)[v8 copy];
    __int16 v31 = v20;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];

    id v6 = 0;
    id v5 = v24;
    a1 = v23;
  }
  __int16 v21 = [*(id *)(a1 + 32) responseHandler];

  if (v21)
  {
    int v22 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, id, void *))v22)[2](v22, v6, v7);
  }
}

- (void)didEncounterError:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v26 = v8;
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of error: %@", buf, 0x16u);
    }
    uint64_t v9 = [(HMDAccessory *)v6 home];
    uint64_t v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
    uint64_t v11 = (void *)v10;
    if (v9 && v10)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F65488]);
      id v13 = [v9 messageTargetUUID];
      id v14 = (void *)[v12 initWithTarget:v13];

      id v15 = (void *)MEMORY[0x1E4F654B0];
      uint64_t v16 = *MEMORY[0x1E4F2D188];
      uint64_t v17 = [(HMDAccessory *)v6 uuid];
      int v18 = [v17 UUIDString];
      v23[1] = *MEMORY[0x1E4F2D220];
      v24[0] = v18;
      v24[1] = v11;
      __int16 v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
      id v20 = [v15 messageWithName:v16 destination:v14 payload:v19];

      __int16 v21 = [[HMDHomeManagerXPCMessageSendPolicy alloc] initWithEntitlements:0 options:-1 active:1];
      [v20 setSendPolicy:v21];

      int v22 = [(HMDAccessory *)v6 msgDispatcher];
      [v22 sendMessage:v20 completionHandler:0];
    }
  }
}

- (void)__handleUpdatePendingConfigurationIdentifierMessage:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    uint64_t v9 = [v4 messagePayload];
    int v21 = 138543618;
    int v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling update pending configuration identifier message payload: %@", (uint8_t *)&v21, 0x16u);
  }
  uint64_t v10 = [(HMDAccessory *)v6 home];
  if (v10)
  {
    uint64_t v11 = [v4 stringForKey:*MEMORY[0x1E4F2C4D8]];
    id v12 = [(HMDAccessory *)v6 transactionWithObjectChangeType:2];
    [v12 setPendingConfigurationIdentifier:v11];
    id v13 = [v10 backingStore];
    id v14 = [v4 name];
    id v15 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    uint64_t v16 = [v13 transaction:v14 options:v15];

    [v16 add:v12 withMessage:v4];
    [v16 run];
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1D9452090]();
    int v18 = v6;
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      int v21 = 138543362;
      int v22 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Home is nil", (uint8_t *)&v21, 0xCu);
    }
    uint64_t v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v4 respondWithError:v11];
  }
}

- (void)setPendingConfigurationIdentifier:(id)a3
{
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  pendingConfigurationIdentifier = self->_pendingConfigurationIdentifier;
  self->_pendingConfigurationIdentifier = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setConfiguredNetworkProtectionGroupUUID:(id)a3
{
  id v4 = (NSUUID *)a3;
  os_unfair_recursive_lock_lock_with_options();
  configuredNetworkProtectionGroupUUID = self->_configuredNetworkProtectionGroupUUID;
  self->_configuredNetworkProtectionGroupUUID = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)saveNetworkAccessViolation:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessory *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __43__HMDAccessory_saveNetworkAccessViolation___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __43__HMDAccessory_saveNetworkAccessViolation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) networkAccessViolation];
  char v3 = HMFEqualObjects();

  if ((v3 & 1) == 0)
  {
    id v12 = [*(id *)(a1 + 32) transactionWithObjectChangeType:2];
    id v4 = [*(id *)(a1 + 40) lastViolationDate];
    id v5 = EpochIntervalFromDate(v4);
    [v12 setLastNetworkAccessViolationOccurrenceSince1970:v5];

    id v6 = [*(id *)(a1 + 40) lastResetDate];
    id v7 = EpochIntervalFromDate(v6);
    [v12 setLastNetworkAccessViolationResetSince1970:v7];

    id v8 = +[HMDBackingStoreTransactionOptions optionsWithSource:0 destination:2 mustReplay:0 mustPush:0];
    uint64_t v9 = [*(id *)(a1 + 32) home];
    uint64_t v10 = [v9 backingStore];
    uint64_t v11 = [v10 transaction:@"SaveNetworkAccessViolation" options:v8];

    [v11 add:v12];
    [v11 run];
  }
}

- (void)_handleWiFiReconfiguration:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 numberForKey:*MEMORY[0x1E4F2DA68]];
  uint64_t v6 = [v4 BOOLForKey:*MEMORY[0x1E4F2DA88]];
  if (!v5)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = 27;
LABEL_7:
    uint64_t v9 = [v12 hmErrorWithCode:v13];
    [v4 respondWithError:v9];
    goto LABEL_12;
  }
  uint64_t v7 = v6;
  if (([v5 integerValue] & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = 3;
    goto LABEL_7;
  }
  id v8 = [(HMDAccessory *)self home];
  uint64_t v9 = [v8 routerClientManager];

  if (v9)
  {
    uint64_t v10 = [v5 integerValue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __43__HMDAccessory__handleWiFiReconfiguration___block_invoke;
    v18[3] = &unk_1E6A197F0;
    id v19 = v4;
    [v9 migrateAccessory:self toCredentialType:v10 rotate:v7 completion:v18];
    uint64_t v11 = v19;
  }
  else
  {
    id v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v21 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to perform Wi-Fi reconfiguration -- no Client Manager", buf, 0xCu);
    }
    uint64_t v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
    [v4 respondWithError:v11];
  }

LABEL_12:
}

uint64_t __43__HMDAccessory__handleWiFiReconfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a2];
}

- (void)saveWiFiUniquePreSharedKey:(id)a3 credentialType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(HMDAccessory *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__HMDAccessory_saveWiFiUniquePreSharedKey_credentialType___block_invoke;
  block[3] = &unk_1E6A16D78;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __58__HMDAccessory_saveWiFiUniquePreSharedKey_credentialType___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) wiFiUniquePreSharedKey];
  char v3 = HMFEqualObjects();

  if ((v3 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) transactionWithObjectChangeType:2];
    [v4 setWiFiUniquePreSharedKey:*(void *)(a1 + 40)];
    id v5 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
    [v4 setWiFiCredentialType:v5];

    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      id v10 = [v4 wiFiCredentialType];
      int v15 = 138543618;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      int v18 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Setting wiFiCredentialType to %@ in accessory transaction", (uint8_t *)&v15, 0x16u);
    }
    int64_t v11 = +[HMDBackingStoreTransactionOptions optionsWithSource:0 destination:2 mustReplay:1 mustPush:0];
    id v12 = [*(id *)(a1 + 32) home];
    uint64_t v13 = [v12 backingStore];
    id v14 = [v13 transaction:@"SaveWiFiUniquePreSharedKey" options:v11];

    [v14 add:v4];
    [v14 run];
  }
}

- (void)setWiFiUniquePreSharedKey:(id)a3
{
  id v4 = (NSData *)a3;
  os_unfair_recursive_lock_lock_with_options();
  wiFiUniquePreSharedKey = self->_wiFiUniquePreSharedKey;
  self->_wiFiUniquePreSharedKey = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setWifiCredentialType:(int64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_int64_t wiFiCredentialType = a3;
  os_unfair_recursive_lock_unlock();
}

- (BOOL)supportsWiFiReconfiguration
{
  return 0;
}

- (void)saveCurrentNetworkProtectionMode:(int64_t)a3 assignedLAN:(int64_t)a4 allowedWANHosts:(id)a5 profileFingerprint:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = [(HMDAccessory *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__HMDAccessory_saveCurrentNetworkProtectionMode_assignedLAN_allowedWANHosts_profileFingerprint___block_invoke;
  block[3] = &unk_1E6A0A9C8;
  block[4] = self;
  id v16 = v10;
  int64_t v18 = a3;
  int64_t v19 = a4;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

void __96__HMDAccessory_saveCurrentNetworkProtectionMode_assignedLAN_allowedWANHosts_profileFingerprint___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) allowedHosts];
  int v3 = HMFEqualObjects();

  if (!v3
    || [*(id *)(a1 + 32) currentNetworkProtectionMode] != *(void *)(a1 + 56)
    || [*(id *)(a1 + 32) networkClientLAN] != *(void *)(a1 + 64)
    || ([*(id *)(a1 + 32) networkClientProfileFingerprint],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = HMFEqualObjects(),
        v4,
        (v5 & 1) == 0))
  {
    id v15 = [*(id *)(a1 + 32) transactionWithObjectChangeType:2];
    id v6 = objc_msgSend(*(id *)(a1 + 40), "na_map:", &__block_literal_global_318);
    if ([v6 count])
    {
      id v7 = (void *)[v6 copy];
      [v15 setAppliedFirewallWANRules:v7];
    }
    else
    {
      [v15 setAppliedFirewallWANRules:0];
    }
    id v8 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
    [v15 setCurrentNetworkProtectionMode:v8];

    uint64_t v9 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
    [v15 setNetworkClientLAN:v9];

    id v10 = [*(id *)(a1 + 48) UUIDString];
    [v15 setNetworkClientProfileFingerprint:v10];

    id v11 = [*(id *)(a1 + 32) home];
    id v12 = [v11 backingStore];
    id v13 = +[HMDBackingStoreTransactionOptions defaultResidenceOptions];
    id v14 = [v12 transaction:@"SaveCurrentNetworkProtectionModeAndFirewallWANRules" options:v13];

    [v14 add:v15];
    [v14 run];
  }
}

uint64_t __96__HMDAccessory_saveCurrentNetworkProtectionMode_assignedLAN_allowedWANHosts_profileFingerprint___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 jsonWANRule];
}

- (void)setNetworkClientProfileFingerprint:(id)a3
{
  id v4 = (NSUUID *)a3;
  os_unfair_recursive_lock_lock_with_options();
  networkClientProfileFingerprint = self->_networkClientProfileFingerprint;
  self->_networkClientProfileFingerprint = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setNetworkClientLAN:(int64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_int64_t networkClientLAN = a3;
  os_unfair_recursive_lock_unlock();
}

- (void)setCurrentNetworkProtectionMode:(int64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_int64_t currentNetworkProtectionMode = a3;
  os_unfair_recursive_lock_unlock();
}

- (void)saveNetworkClientIdentifier:(id)a3 networkRouterUUID:(id)a4 clearProfileFingerprint:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HMDAccessory *)self workQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__HMDAccessory_saveNetworkClientIdentifier_networkRouterUUID_clearProfileFingerprint___block_invoke;
  v13[3] = &unk_1E6A15B38;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __86__HMDAccessory_saveNetworkClientIdentifier_networkRouterUUID_clearProfileFingerprint___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) networkClientIdentifier];
  int v3 = HMFEqualObjects();

  if (!v3
    || ([*(id *)(a1 + 32) networkRouterUUID],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = HMFEqualObjects(),
        v4,
        !v5)
    || *(unsigned char *)(a1 + 56)
    && ([*(id *)(a1 + 32) networkClientProfileFingerprint],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v12 = [*(id *)(a1 + 32) transactionWithObjectChangeType:2];
    [v12 setNetworkClientIdentifier:*(void *)(a1 + 40)];
    id v7 = [*(id *)(a1 + 48) UUIDString];
    [v12 setNetworkRouterUUID:v7];

    if (*(unsigned char *)(a1 + 56)) {
      [v12 setNetworkClientProfileFingerprint:0];
    }
    id v8 = +[HMDBackingStoreTransactionOptions optionsWithSource:0 destination:2 mustReplay:1 mustPush:0];
    id v9 = [*(id *)(a1 + 32) home];
    id v10 = [v9 backingStore];
    id v11 = [v10 transaction:@"SaveNetworkClientIdentifier" options:v8];

    [v11 add:v12];
    [v11 run];
  }
}

- (void)setNetworkRouterUUID:(id)a3
{
  id v4 = (NSUUID *)a3;
  os_unfair_recursive_lock_lock_with_options();
  networkRouterUUID = self->_networkRouterUUID;
  self->_networkRouterUUID = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setNetworkClientIdentifier:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_recursive_lock_lock_with_options();
  networkClientIdentifier = self->_networkClientIdentifier;
  self->_networkClientIdentifier = v4;

  os_unfair_recursive_lock_unlock();
}

- (BOOL)needsAirplayAccess
{
  return 0;
}

- (BOOL)supportsNetworkProtection
{
  return 0;
}

- (void)setPrimaryProfileVersion:(id)a3
{
  id v4 = (HMFVersion *)a3;
  os_unfair_recursive_lock_lock_with_options();
  primaryProfileVersion = self->_primaryProfileVersion;
  self->_primaryProfileVersion = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setAccessoryProfiles:(id)a3
{
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:");
    id v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    accessoryProfiles = self->_accessoryProfiles;
    self->_accessoryProfiles = v4;
  }
  else
  {
    [(NSMutableSet *)self->_accessoryProfiles removeAllObjects];
  }
  os_unfair_recursive_lock_unlock();
}

- (void)removeAccessoryProfile:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_recursive_lock_lock_with_options();
    [(NSMutableSet *)self->_accessoryProfiles removeObject:v5];
    os_unfair_recursive_lock_unlock();
    id v4 = v5;
  }
}

- (void)handleAddedSiriEndpointProfile:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling added siri endpoint profile: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)handleAddedMediaProfile:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543618;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling added media profile: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)handleAddedAccessoryProfile:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (v6) {
    [(HMDAccessory *)self handleAddedMediaProfile:v6];
  }
  id v9 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v9;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8) {
    [(HMDAccessory *)self handleAddedSiriEndpointProfile:v8];
  }
  logAndPostNotification(@"HMDAccessoryProfileAddedNotification", self, 0);
}

- (void)addAccessoryProfile:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    os_unfair_recursive_lock_lock_with_options();
    [(NSMutableSet *)self->_accessoryProfiles addObject:v7];
    os_unfair_recursive_lock_unlock();
    id v5 = [(HMDAccessory *)self msgDispatcher];

    if (v5)
    {
      id v6 = [(HMDAccessory *)self msgDispatcher];
      [v7 configureWithMessageDispatcher:v6 configurationTracker:0];
    }
    [(HMDAccessory *)self handleAddedAccessoryProfile:v7];
    id v4 = v7;
  }
}

- (void)appDataRemoved:(id)a3 message:(id)a4
{
  id v5 = a4;
  [(HMDAccessory *)self setAppData:0];
  id v6 = [v5 transactionResult];
  [v6 markChanged];
  [v5 respondWithPayload:0];
}

- (void)appDataUpdated:(id)a3 message:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessory *)self appData];

  if (v8)
  {
    id v9 = [(HMDAccessory *)self appData];
    [v9 updateWithModel:v6];
  }
  else
  {
    id v10 = [HMDApplicationData alloc];
    __int16 v11 = [v6 appDataDictionary];
    id v12 = [(HMDAccessory *)self uuid];
    uint64_t v13 = [(HMDApplicationData *)v10 initWithDictionary:v11 parentUUID:v12];
    [(HMDAccessory *)self setAppData:v13];

    id v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = self;
    BOOL v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v17 = HMFGetLogIdentifier();
      int64_t v18 = [v6 appDataDictionary];
      int v20 = 138543618;
      int v21 = v17;
      __int16 v22 = 2112;
      __int16 v23 = v18;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Updating the application data : %@", (uint8_t *)&v20, 0x16u);
    }
  }
  int64_t v19 = [v7 transactionResult];
  [v19 markChanged];
  [v7 respondWithPayload:0];
}

- (void)__handleSetAppData:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessory *)self home];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CA60];
    id v7 = [v4 messagePayload];
    objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    id v8 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

    id v9 = @"com.apple.homekit-entitledclient.identifer";
    id v10 = [v4 dictionaryForKey:@"kAppDataInformationKey"];
    __int16 v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = v14;
      __int16 v38 = 2112;
      uint64_t v39 = v10;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Going to update appData for accessory to: %@", buf, 0x16u);
    }
    id v15 = [(HMDAccessory *)v12 appData];
    BOOL v16 = (HMDApplicationData *)[v15 copy];
    id v17 = v16;
    if (v10)
    {
      if (!v16)
      {
        int64_t v18 = [HMDApplicationData alloc];
        int64_t v19 = [(HMDAccessory *)v12 uuid];
        id v17 = [(HMDApplicationData *)v18 initWithParentUUID:v19];
      }
      [(HMDApplicationData *)v17 setApplicationData:v10 forIdentifier:@"com.apple.homekit-entitledclient.identifer"];
      int v20 = [(HMDApplicationData *)v17 modelObjectWithChangeType:1];
      int v21 = v20;
      if (!v15) {
        [v20 setObjectChangeType:1];
      }
      uint64_t v35 = v15;
      [v8 setObject:v10 forKey:@"kAppDataInformationKey"];
      if (v21) {
        goto LABEL_10;
      }
    }
    else
    {
      [(HMDApplicationData *)v16 removeApplicationDataForIdentifier:@"com.apple.homekit-entitledclient.identifer"];
      if (!v17)
      {
LABEL_17:
        [v4 respondWithPayload:0];
        goto LABEL_18;
      }
      uint64_t v35 = v15;
      int v21 = [(HMDApplicationData *)v17 modelObjectWithChangeType:1];
      if (v21)
      {
LABEL_10:
        __int16 v22 = [v5 backingStore];
        [v4 name];
        v24 = id v23 = v4;
        uint64_t v25 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
        [v22 transaction:v24 options:v25];
        long long v26 = v10;
        __int16 v27 = v8;
        v29 = id v28 = v5;

        id v4 = v23;
        [v29 add:v21 withMessage:v23];
        [v29 run];

        id v5 = v28;
        id v8 = v27;
        id v10 = v26;

        id v15 = v35;
LABEL_18:

        id v34 = @"com.apple.homekit-entitledclient.identifer";
        goto LABEL_19;
      }
    }
    id v15 = v35;
    goto LABEL_17;
  }
  id v30 = (void *)MEMORY[0x1D9452090]();
  __int16 v31 = self;
  id v32 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v33 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v37 = v33;
    _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Attempted to set appData on an accessory that is no longer part of a home", buf, 0xCu);
  }
  id v8 = [v4 responseHandler];
  id v34 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
  ((void (**)(void, __CFString *, void))v8)[2](v8, v34, 0);
LABEL_19:
}

- (void)setAppData:(id)a3
{
  id v4 = (HMDApplicationData *)a3;
  os_unfair_recursive_lock_lock_with_options();
  appData = self->_appData;
  self->_appData = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)_configNumberUpdated
{
  v2 = [(HMDAccessory *)self workQueue];
  dispatch_assert_queue_V2(v2);
}

- (void)setConfigNumber:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  unint64_t configNumber = self->_configNumber;
  self->_unint64_t configNumber = a3;
  BOOL v7 = configNumber != a3 && configNumber != 0;
  uint64_t v8 = os_unfair_recursive_lock_unlock();
  id v9 = (void *)MEMORY[0x1D9452090](v8);
  id v10 = self;
  __int16 v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v17 = v12;
    __int16 v18 = 1024;
    int v19 = configNumber;
    __int16 v20 = 1024;
    int v21 = a3;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@c# was set %u -> %u", buf, 0x18u);
  }
  if (v7)
  {
    uint64_t v13 = [(HMDAccessory *)v10 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__HMDAccessory_setConfigNumber___block_invoke;
    block[3] = &unk_1E6A19B30;
    block[4] = v10;
    dispatch_async(v13, block);

    id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 postNotificationName:@"HMDAccessoryConfigNumberUpdatedNotification" object:v10];
  }
}

uint64_t __32__HMDAccessory_setConfigNumber___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configNumberUpdated];
}

- (void)_remoteAccessEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(HMDAccessory *)self isRemoteAccessEnabled] != a3)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    BOOL v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      [(HMDAccessory *)v6 isRemoteAccessEnabled];
      id v9 = HMFBooleanToString();
      id v10 = HMFBooleanToString();
      int v13 = 138543874;
      id v14 = v8;
      __int16 v15 = 2114;
      BOOL v16 = v9;
      __int16 v17 = 2114;
      __int16 v18 = v10;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Updating remote access enabled from %{public}@ to %{public}@", (uint8_t *)&v13, 0x20u);
    }
    __int16 v11 = [(HMDAccessory *)v6 home];
    int v12 = [v11 isResidentSupported];

    if (v12) {
      [(HMDAccessory *)v6 setRemotelyReachable:v3];
    }
    else {
      [(HMDAccessory *)v6 _notifyConnectivityChangedWithRemoteAccessChanged:1];
    }
    [(HMDAccessory *)v6 setRemoteAccessEnabled:v3];
  }
}

- (void)remoteAccessEnabled:(BOOL)a3
{
  id v5 = [(HMDAccessory *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __36__HMDAccessory_remoteAccessEnabled___block_invoke;
  v6[3] = &unk_1E6A19B58;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __36__HMDAccessory_remoteAccessEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _remoteAccessEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_notifyConnectivityChangedWithRemoteAccessChanged:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDAccessory *)self home];
  if (([v5 isResidentSupported] & 1) != 0
    || a3
    || ![(HMDAccessory *)self isRemoteAccessEnabled])
  {
    [v5 notifyClientsOfReachabilityUpdateForAccessory:self];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    BOOL v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      __int16 v11 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring non-remote reachability change while remote access is enabled", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (id)messageSendPolicy
{
  v2 = [[HMDHomeManagerXPCMessageSendPolicy alloc] initWithEntitlements:1 options:1];
  return v2;
}

- (void)setConnected:(BOOL)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_connected = a3;
  os_unfair_recursive_lock_unlock();
}

- (void)setLowBattery:(BOOL)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_lowBattery = a3;
  os_unfair_recursive_lock_unlock();
}

- (void)setLastSeenDate:(id)a3
{
  id v4 = (NSDate *)a3;
  os_unfair_recursive_lock_lock_with_options();
  lastSeenDate = self->_lastSeenDate;
  self->_lastSeenDate = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setRemotelyReachable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  if (self->_remotelyReachable == v3)
  {
    os_unfair_recursive_lock_unlock();
  }
  else
  {
    self->_BOOL remotelyReachable = v3;
    BOOL reachable = self->_reachable;
    uint64_t v6 = os_unfair_recursive_lock_unlock();
    BOOL v7 = (void *)MEMORY[0x1D9452090](v6);
    uint64_t v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = HMFGetLogIdentifier();
      __int16 v11 = HMFBooleanToString();
      int v17 = 138543618;
      __int16 v18 = v10;
      __int16 v19 = 2114;
      __int16 v20 = v11;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Updated isRemotelyReachable to %{public}@", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v12 = [(HMDAccessory *)v8 home];

    if (!reachable && v12 != 0) {
      [(HMDAccessory *)v8 _notifyConnectivityChangedWithRemoteAccessChanged:0];
    }
    id v14 = [(HMDAccessory *)v8 notificationCenter];
    __int16 v15 = v14;
    if (v3) {
      BOOL v16 = @"HMDAccessoryIsRemotelyReachableNotification";
    }
    else {
      BOOL v16 = @"HMDAccessoryIsNotRemotelyReachableNotification";
    }
    logAndPostNotificationWithNotificationCenter(v14, v16, v8, 0);
  }
}

- (BOOL)_getLastKnownLowBatteryStatus
{
  char v3 = [(HMDAccessory *)self isLowBattery];
  id v4 = self;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  uint64_t v6 = v5;

  BOOL v7 = [(HMDAccessory *)v6 findCharacteristicType:*MEMORY[0x1E4F2CFB8] forServiceType:*MEMORY[0x1E4F2DDD0]];

  uint64_t v8 = [v7 value];

  if (v8)
  {
    id v9 = [v7 value];
    char v3 = [v9 BOOLValue];
  }
  return v3;
}

- (void)saveLastSeenToLocalStore
{
  id v9 = [(HMDAccessory *)self transactionWithObjectChangeType:2];
  char v3 = [(HMDAccessory *)self lastSeenDate];
  [v9 setLastSeenDate:v3];

  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccessory _getLastKnownLowBatteryStatus](self, "_getLastKnownLowBatteryStatus"));
  [v9 setLowBattery:v4];

  id v5 = [(HMDAccessory *)self home];
  uint64_t v6 = [v5 backingStore];
  BOOL v7 = +[HMDBackingStoreTransactionOptions defaultLocalOptions];
  uint64_t v8 = [v6 transaction:@"kAccessoryLastSeenKey" options:v7];

  [v8 add:v9];
  [v8 run];
}

- (void)_checkForLastSeenUpdateOnBecomingUnreachable
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  char v3 = [(HMDAccessory *)self home];
  id v4 = self;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  uint64_t v6 = v5;

  BOOL v7 = [(HMDAccessory *)v6 accessoryMetric];
  uint64_t v8 = [v7 sessionMetric];
  [v8 submissionIntervalSec];
  double v10 = v9;

  if (v10 <= 0.0)
  {
    double v14 = 86400.0;
  }
  else
  {
    __int16 v11 = [(HMDAccessory *)v6 accessoryMetric];
    uint64_t v12 = [v11 sessionMetric];
    [v12 submissionIntervalSec];
    double v14 = v13;
  }
  __int16 v15 = [(HMDAccessory *)v4 lastSeenDate];
  BOOL v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  __int16 v18 = v17;

  [v18 timeIntervalSinceNow];
  double v20 = v19;
  if ([v3 isCurrentDeviceConfirmedPrimaryResident]
    && [(HMDAccessory *)v4 _getLastKnownLowBatteryStatus]
    && fabs(v20) > v14)
  {
    uint64_t v21 = (void *)MEMORY[0x1D9452090]();
    uint64_t v22 = v4;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      uint64_t v25 = [(HMDAccessory *)v22 lastSeenDate];
      int v27 = 138543874;
      id v28 = v24;
      __int16 v29 = 2112;
      id v30 = v22;
      __int16 v31 = 2112;
      id v32 = v25;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Saving lastSeen for accessory: %@ to %@", (uint8_t *)&v27, 0x20u);
    }
    long long v26 = [MEMORY[0x1E4F1C9C8] date];
    [(HMDAccessory *)v22 setLastSeenDate:v26];

    [(HMDAccessory *)v22 saveLastSeenToLocalStore];
    [v3 saveToCurrentAccountWithReason:@"kAccessoryLastSeenKey"];
  }
}

- (NSDate)timeBecameReachable
{
  os_unfair_recursive_lock_lock_with_options();
  char v3 = self->_timeBecameReachable;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setTimeBecameReachable:(id)a3
{
  id v4 = (NSDate *)a3;
  os_unfair_recursive_lock_lock_with_options();
  timeBecameReachable = self->_timeBecameReachable;
  self->_timeBecameReachable = v4;

  os_unfair_recursive_lock_unlock();
}

- (NSDate)timeBecameUnreachable
{
  os_unfair_recursive_lock_lock_with_options();
  char v3 = self->_timeBecameUnreachable;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setTimeBecameUnreachable:(id)a3
{
  id v4 = (NSDate *)a3;
  os_unfair_recursive_lock_lock_with_options();
  timeBecameUnBOOL reachable = self->_timeBecameUnreachable;
  self->_timeBecameUnBOOL reachable = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setreachabilityPingNotificationEnabled:(BOOL)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_reachabilityPingNotificationEnabled = a3;
  os_unfair_recursive_lock_unlock();
}

- (BOOL)reachabilityPingNotificationEnabled
{
  LOBYTE(self) = self->_reachabilityPingNotificationEnabled;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (void)setReachabilityPingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(HMDAccessory *)self supportsUnreachablePing];
  os_unfair_recursive_lock_lock_with_options();
  self->_reachabilityPingEnabled = v3;
  if (self->_reachable) {
    BOOL v5 = 1;
  }
  os_unfair_recursive_lock_unlock();
  if (!v5 || !v3)
  {
    [(HMDAccessory *)self stopReachabilityCheck];
  }
  else
  {
    [(HMDAccessory *)self startReachabilityCheck];
  }
}

- (BOOL)reachabilityPingEnabled
{
  LOBYTE(self) = self->_reachabilityPingEnabled;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (void)setSuspendedCapable:(BOOL)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_suspendCapable = a3;
  os_unfair_recursive_lock_unlock();
}

- (BOOL)supportsPersonalRequests
{
  return 0;
}

- (BOOL)supportsMediaContentProfile
{
  return 0;
}

- (BOOL)requiresHomeAppForManagement
{
  return 0;
}

- (void)setPairingsAuditedTimestamp:(id)a3
{
  id v4 = (HMDUserManagementOperationTimestamp *)a3;
  os_unfair_recursive_lock_lock_with_options();
  pairingsAuditedTimestamp = self->_pairingsAuditedTimestamp;
  self->_pairingsAuditedTimestamp = v4;

  os_unfair_recursive_lock_unlock();
}

- (HMDUserManagementOperationTimestamp)pairingsAuditedTimestamp
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = self->_pairingsAuditedTimestamp;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setSharedAdminAddedTimestamp:(id)a3
{
  id v4 = (HMDUserManagementOperationTimestamp *)a3;
  os_unfair_recursive_lock_lock_with_options();
  sharedAdminAddedTimestamp = self->_sharedAdminAddedTimestamp;
  self->_sharedAdminAddedTimestamp = v4;

  os_unfair_recursive_lock_unlock();
}

- (HMDUserManagementOperationTimestamp)sharedAdminAddedTimestamp
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = self->_sharedAdminAddedTimestamp;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)notifyAccessoryNameChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(HMDAccessory *)self name];
  uint64_t v6 = [(HMDAccessory *)self home];
  BOOL v7 = (void *)MEMORY[0x1D9452090]();
  uint64_t v8 = self;
  double v9 = HMFGetOSLogHandle();
  double v10 = v9;
  if (v5 && v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v31 = v11;
      __int16 v32 = 2112;
      uint64_t v33 = v5;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Name changed to %@, notifying clients", buf, 0x16u);
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F65480];
    double v13 = [(HMDAccessory *)v8 messageDestination];
    v28[0] = @"kAccessoryName";
    v28[1] = @"kHomeUUID";
    v29[0] = v5;
    double v14 = [v6 uuid];
    __int16 v15 = [v14 UUIDString];
    v29[1] = v15;
    BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
    id v17 = [v12 messageWithName:@"kAccessoryNameChangedNotificationKey" destination:v13 payload:v16];

    __int16 v18 = [(HMDAccessory *)v8 msgDispatcher];
    [v18 sendMessage:v17 completionHandler:0];

    double v19 = [(HMDAccessory *)v8 workQueue];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    uint64_t v24 = __43__HMDAccessory_notifyAccessoryNameChanged___block_invoke;
    uint64_t v25 = &unk_1E6A197C8;
    long long v26 = v8;
    id v27 = v5;
    dispatch_async(v19, &v22);

    if (v3)
    {
      double v20 = objc_msgSend(v6, "homeManager", v22, v23, v24, v25, v26);
      [v20 assistantSyncDataChanged:@"kAccessoryNameChangedNotificationKey"];
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v31 = v21;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Name or home is nil, cannot send name changed notification", buf, 0xCu);
    }
  }
}

uint64_t __43__HMDAccessory_notifyAccessoryNameChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleUpdatedName:*(void *)(a1 + 40)];
}

- (void)updateMediaSession:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMDAccessory *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __35__HMDAccessory_updateMediaSession___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __35__HMDAccessory_updateMediaSession___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "accessoryProfiles", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(id *)(*((void *)&v10 + 1) + 8 * v6);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v8 = v7;
        }
        else {
          id v8 = 0;
        }
        id v9 = v8;

        [v9 setMediaSession:*(void *)(a1 + 40)];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (NSString)productGroup
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(HMDAccessory *)self productData];
  id v7 = 0;
  [v3 splitProductDataIntoProductGroupAndProductNumber:v4 productGroup:&v7 productNumber:0];
  id v5 = v7;

  return (NSString *)v5;
}

- (void)setProductData:(id)a3
{
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v4 = (NSString *)[v6 copy];
  productData = self->_productData;
  self->_productData = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setSerialNumber:(id)a3
{
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v4 = (NSString *)[v6 copy];
  serialNumber = self->_serialNumber;
  self->_serialNumber = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setDisplayableFirmwareVersion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "hm_truncatedDisplayableVersionString");
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    long long v10 = [(HMDAccessory *)v7 displayableFirmwareVersion];
    int v12 = 138543874;
    long long v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating displayable firmware version string from %@ to %@.", (uint8_t *)&v12, 0x20u);
  }
  os_unfair_recursive_lock_lock_with_options();
  displayableFirmwareVersion = v7->_displayableFirmwareVersion;
  v7->_displayableFirmwareVersion = (NSString *)v5;

  os_unfair_recursive_lock_unlock();
}

- (void)setFirmwareVersion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (HMDAccessoryVersion *)a3;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = [(HMDAccessory *)v6 firmwareVersion];
    int v11 = 138543874;
    int v12 = v8;
    __int16 v13 = 2112;
    __int16 v14 = v9;
    __int16 v15 = 2112;
    __int16 v16 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating firmware version from %@ to %@.", (uint8_t *)&v11, 0x20u);
  }
  os_unfair_recursive_lock_lock_with_options();
  firmwareVersion = v6->_firmwareVersion;
  v6->_firmwareVersion = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setInitialManufacturer:(id)a3
{
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  initialManufacturer = self->_initialManufacturer;
  self->_initialManufacturer = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setManufacturer:(id)a3
{
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  manufacturer = self->_manufacturer;
  self->_manufacturer = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setInitialModel:(id)a3
{
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  initialModel = self->_initialModel;
  self->_initialModel = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setModel:(id)a3
{
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  model = self->_model;
  self->_model = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)__handleRename:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 stringForKey:@"kAccessoryName"];
  uint64_t v6 = [v4 BOOLForKey:@"kAccessoryNameResetKey"];
  uint64_t v7 = [v5 length];
  if (v6)
  {
    if (v7)
    {
LABEL_3:
      id v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = 3;
LABEL_9:
      __int16 v15 = [v8 hmErrorWithCode:v9];
      [v4 respondWithError:v15];
      goto LABEL_10;
    }
  }
  else if (!v7)
  {
    goto LABEL_3;
  }
  unint64_t v10 = HMMaxLengthForNaming();
  if ([v5 length] > v10)
  {
    int v11 = (void *)MEMORY[0x1D9452090]();
    int v12 = self;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = HMFGetLogIdentifier();
      int v26 = 138543362;
      id v27 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", (uint8_t *)&v26, 0xCu);
    }
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = 46;
    goto LABEL_9;
  }
  __int16 v16 = [(HMDAccessory *)self home];
  __int16 v15 = v16;
  if (v16)
  {
    if (v5 && ([v16 validateName:v5], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v18 = (void *)v17;
      [v4 respondWithError:v17];
    }
    else
    {
      [(HMDAccessory *)self _renameAccessory:v5 resetName:v6 message:v4];
    }
  }
  else
  {
    double v19 = (void *)MEMORY[0x1D9452090]();
    double v20 = self;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      int v26 = 138543362;
      id v27 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to change name as no home is associated to the accessory", (uint8_t *)&v26, 0xCu);
    }
    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2018];
    uint64_t v25 = [v23 hmErrorWithCode:2 description:0 reason:0 suggestion:0 underlyingError:v24];
    [v4 respondWithError:v25];
  }
LABEL_10:
}

- (void)_renameAccessory:(id)a3 resetName:(BOOL)a4 message:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  unint64_t v10 = [(HMDAccessory *)self transactionWithObjectChangeType:2];
  [v10 setName:v9];
  [v10 setConfiguredName:v9];

  int v11 = [(HMDAccessory *)self home];
  int v12 = [v11 backingStore];
  __int16 v13 = [v8 name];
  __int16 v14 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
  __int16 v15 = [v12 transaction:v13 options:v14];

  if (a4)
  {
    [v15 add:v10 withMessage:0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__HMDAccessory__renameAccessory_resetName_message___block_invoke;
    v16[3] = &unk_1E6A196E0;
    v16[4] = self;
    id v17 = v8;
    [v15 run:v16];
  }
  else
  {
    [v15 add:v10 withMessage:v8];
    [v15 run];
  }
}

void __51__HMDAccessory__renameAccessory_resetName_message___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) name];
    uint64_t v6 = (void *)v5;
    if (v5)
    {
      uint64_t v7 = @"kAccessoryName";
      v8[0] = v5;
      id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    }
    else
    {
      id v4 = 0;
    }
  }
  [*(id *)(a1 + 40) respondWithPayload:v4 error:v3];
}

- (void)setProvidedName:(id)a3
{
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v6, "hm_truncatedNameString");
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  providedName = self->_providedName;
  self->_providedName = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setConfiguredName:(id)a3
{
  id v6 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_msgSend(v6, "hm_truncatedNameString");
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  configuredName = self->_configuredName;
  self->_configuredName = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)_handleUpdatedName:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDAccessory *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v7 = @"kAccessoryName";
  v8[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  logAndPostNotification(@"HMDAccessoryNameUpdatedNotification", self, v6);
}

- (void)__handleGetAccessoryAdvertisingParams:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = [(HMDAccessory *)self identifier];
  v11[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  unint64_t v10 = @"kIdentifierKey";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  id v9 = [v4 dictionaryWithObjects:v7 forKeys:v8];
  [v5 respondWithPayload:v9];
}

- (void)setInitialCategoryIdentifier:(id)a3
{
  id v4 = (NSNumber *)a3;
  os_unfair_recursive_lock_lock_with_options();
  initialCategoryIdentifier = self->_initialCategoryIdentifier;
  self->_initialCategoryIdentifier = v4;

  os_unfair_recursive_lock_unlock();
}

- (id)_updateCategory:(id)a3 notifyClients:(BOOL)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(HMDAccessory *)self isPrimary])
  {
    if (v6
      || ([(HMDAccessory *)self category],
          uint64_t v24 = objc_claimAutoreleasedReturnValue(),
          v24,
          !v24))
    {
      [(HMDAccessory *)self setCategoryIdentifier:v6];
      uint64_t v7 = +[HMDHAPMetadata getSharedInstance];
      id v8 = [v7 categoryForIdentifier:v6];
      if (v8 || ([v7 categoryForOther], (id v8 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v9 = [(HMDAccessory *)self category];
        if (!v9) {
          goto LABEL_17;
        }
        unint64_t v10 = (void *)v9;
        int v11 = [(HMDAccessory *)self category];
        int v12 = [v11 categoryType];
        __int16 v13 = [v8 uuidStr];
        char v14 = [v12 isEqualToString:v13];

        if ((v14 & 1) == 0)
        {
LABEL_17:
          id v15 = objc_alloc(MEMORY[0x1E4F2E520]);
          __int16 v16 = [v8 uuidStr];
          id v17 = [v8 catDescription];
          uint64_t v18 = (void *)[v15 initWithType:v16 name:v17];
          [(HMDAccessory *)self setCategory:v18];

          if (a4)
          {
            double v19 = [(HMDAccessory *)self category];
            double v20 = encodeRootObjectForIncomingXPCMessage(v19, 0);

            uint64_t v21 = (void *)MEMORY[0x1E4F65480];
            int v26 = @"kAccessoryCategory";
            v27[0] = v20;
            uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
            uint64_t v23 = [v21 messageWithName:@"kAccessoryCategoryChangedNotificationKey" messagePayload:v22];

            goto LABEL_12;
          }
        }
      }
    }
  }
  uint64_t v23 = 0;
LABEL_12:

  return v23;
}

- (void)updateCategory:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4
    && ([(HMDAccessory *)self categoryIdentifier],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqual:v4],
        v5,
        !v6))
  {
    int v12 = [(HMDAccessory *)self transactionWithObjectChangeType:2];
    [v12 setAccessoryCategory:v4];
    __int16 v13 = [(HMDAccessory *)self home];
    char v14 = [v13 backingStore];
    id v15 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    __int16 v16 = [v14 transaction:@"AccessoryUpdated" options:v15];

    [v16 add:v12 withMessage:0];
    [v16 run];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      unint64_t v10 = HMFGetLogIdentifier();
      int v11 = [(HMDAccessory *)v8 categoryIdentifier];
      int v17 = 138543874;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      double v20 = v11;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@No change in category -- old: %@, new: %@", (uint8_t *)&v17, 0x20u);
    }
  }
}

- (BOOL)_updateRoom:(id)a3 source:(unint64_t)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(HMDAccessory *)self home];
  id v8 = [v7 roomWithUUID:v6];
  uint64_t v9 = (void *)MEMORY[0x1D9452090]();
  unint64_t v10 = self;
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = HMFGetLogIdentifier();
    __int16 v13 = [v8 name];
    char v14 = [NSNumber numberWithUnsignedInteger:a4];
    *(_DWORD *)buf = 138543874;
    uint64_t v40 = v12;
    __int16 v41 = 2112;
    id v42 = v13;
    __int16 v43 = 2112;
    uint64_t v44 = v14;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@_updateRoom to: room: %@, source: %@", buf, 0x20u);
  }
  if (v8)
  {
    if (!v7) {
      goto LABEL_12;
    }
  }
  else
  {
    id v8 = [v7 roomForEntireHome];
    if (!v7)
    {
LABEL_12:
      uint64_t v24 = (void *)MEMORY[0x1D9452090]();
      uint64_t v25 = v10;
      int v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v40 = v27;
        __int16 v41 = 2112;
        id v42 = v6;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to change room since room with UUID %@ or its home cannot be found", buf, 0x16u);
      }
      char v28 = 0;
      goto LABEL_21;
    }
  }
  if (!v8) {
    goto LABEL_12;
  }
  id v15 = [(HMDAccessory *)v10 room];
  __int16 v16 = [v8 uuid];
  int v17 = [v15 uuid];
  LODWORD(v18) = objc_msgSend(v16, "hmf_isEqualToUUID:", v17);

  __int16 v19 = (void *)MEMORY[0x1D9452090]();
  double v20 = v10;
  __int16 v21 = HMFGetOSLogHandle();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
  if (v18)
  {
    if (v22)
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v40 = v23;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Accessory is already in the same room. not updating.", buf, 0xCu);
    }
  }
  else
  {
    if (v22)
    {
      __int16 v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v40 = v29;
      __int16 v41 = 2112;
      id v42 = v15;
      __int16 v43 = 2112;
      uint64_t v44 = v8;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Updating room: %@ new room: %@", buf, 0x20u);
    }
    id v30 = [(HMDAccessory *)v20 room];
    __int16 v31 = [v30 name];

    [(HMDAccessory *)v20 setRoom:v8];
    id v32 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v37 = @"HMIsCloudSourceKey";
    uint64_t v33 = [NSNumber numberWithBool:(a4 & 0xFFFFFFFFFFFFFFFELL) == 2];
    __int16 v38 = v33;
    uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    uint64_t v35 = (void *)[v32 initWithDictionary:v34];

    if (v31) {
      [v35 setObject:v31 forKey:@"kRoomOldNameKey"];
    }
    uint64_t v18 = [v35 copy];
    logAndPostNotification(@"HMDNotificationAccessoryChangedRoom", v20, (void *)v18);

    LOBYTE(v18) = 0;
  }
  char v28 = v18 ^ 1;

LABEL_21:
  return v28;
}

- (void)__handleUpdateRoom:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 uuidForKey:@"kRoomUUID"];
  id v6 = [(HMDAccessory *)self home];
  uint64_t v7 = [v6 roomWithUUID:v5];
  id v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = self;
  unint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    int v12 = [v6 rooms];
    *(_DWORD *)buf = 138544130;
    id v42 = v11;
    __int16 v43 = 2112;
    uint64_t v44 = v6;
    __int16 v45 = 2112;
    __int16 v46 = v12;
    __int16 v47 = 2112;
    uint64_t v48 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@__handleUpdateRoom: home: %@, rooms: %@, newRoom: %@", buf, 0x2Au);
  }
  if (!v6)
  {
    double v20 = (void *)MEMORY[0x1D9452090]();
    __int16 v21 = v9;
    BOOL v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      uint64_t v24 = [(HMDAccessory *)v21 name];
      *(_DWORD *)buf = 138543618;
      id v42 = v23;
      __int16 v43 = 2112;
      uint64_t v44 = v24;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to change room for accessory %@ since home cannot be found on accessory", buf, 0x16u);
    }
    uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = 2018;
    goto LABEL_15;
  }
  if (!v7)
  {
    id v27 = (void *)MEMORY[0x1D9452090]();
    char v28 = v9;
    __int16 v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v30 = HMFGetLogIdentifier();
      __int16 v31 = [(HMDAccessory *)v28 name];
      *(_DWORD *)buf = 138543874;
      id v42 = v30;
      __int16 v43 = 2112;
      uint64_t v44 = v31;
      __int16 v45 = 2112;
      __int16 v46 = v5;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to change room for accessory %@ since room with UUID %@ cannot be found", buf, 0x20u);
    }
    uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = 2017;
LABEL_15:
    uint64_t v32 = [v25 hmPrivateErrorWithCode:v26];
LABEL_16:
    id v15 = (void *)v32;
    [v4 respondWithError:v32];
    goto LABEL_17;
  }
  if (v5)
  {
    __int16 v13 = [v6 roomForEntireHome];
    char v14 = [v7 isEqual:v13];

    if ((v14 & 1) == 0 && (unint64_t)[v6 accessoryCountForRoom:v7] >= 0x3E8)
    {
      uint64_t v33 = (void *)MEMORY[0x1D9452090]();
      uint64_t v34 = v9;
      uint64_t v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = HMFGetLogIdentifier();
        uint64_t v37 = [(HMDAccessory *)v34 name];
        __int16 v38 = [v7 name];
        *(_DWORD *)buf = 138543874;
        id v42 = v36;
        __int16 v43 = 2112;
        uint64_t v44 = v37;
        __int16 v45 = 2112;
        __int16 v46 = v38;
        _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Can't assign %@  to room %@; already at maximum accessories allowed",
          buf,
          0x20u);
      }
      uint64_t v32 = [MEMORY[0x1E4F28C58] hmErrorWithCode:49];
      goto LABEL_16;
    }
  }
  id v15 = [(HMDAccessory *)v9 modelWithUpdatedRoom:v7];
  __int16 v16 = [v6 backingStore];
  int v17 = [v4 name];
  uint64_t v18 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
  __int16 v19 = [v16 transaction:v17 options:v18];

  [v19 add:v15 withMessage:v4];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __35__HMDAccessory___handleUpdateRoom___block_invoke;
  v39[3] = &unk_1E6A196E0;
  v39[4] = v9;
  id v40 = v7;
  [v19 run:v39];

LABEL_17:
}

void __35__HMDAccessory___handleUpdateRoom___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) name];
    int v9 = 138543874;
    unint64_t v10 = v7;
    __int16 v11 = 2112;
    int v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Finished updating the room (%@) for the accessory finished with error: %@", (uint8_t *)&v9, 0x20u);
  }
}

- (id)modelWithUpdatedRoom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(HMDAccessory *)self transactionWithObjectChangeType:2];
    id v6 = [v4 uuid];
    uint64_t v7 = [v6 UUIDString];
    [v5 setRoomUUID:v7];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    int v9 = self;
    unint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = HMFGetLogIdentifier();
      int v12 = [(HMDAccessory *)v9 name];
      int v14 = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      int v17 = v12;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot create update room model because room was not specified for accessory %@", (uint8_t *)&v14, 0x16u);
    }
    id v5 = 0;
  }

  return v5;
}

- (void)updateRoom:(id)a3 source:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(HMDAccessory *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__HMDAccessory_updateRoom_source___block_invoke;
  block[3] = &unk_1E6A16D78;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __34__HMDAccessory_updateRoom_source___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) uuid];
  [v2 _updateRoom:v3 source:*(void *)(a1 + 48)];
}

- (void)setRoom:(id)a3
{
  id v4 = (HMDRoom *)a3;
  os_unfair_recursive_lock_lock_with_options();
  room = self->_room;
  self->_room = v4;

  os_unfair_recursive_lock_unlock();
  id v6 = [(HMDAccessory *)self home];
  [v6 configureBulletinNotification];
}

- (BOOL)hasBattery
{
  return 0;
}

- (NSUUID)endpointIdentifier
{
  return 0;
}

- (void)setResetOnBackoffExpiry:(BOOL)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_resetOnBackoffExpiry = a3;
  os_unfair_recursive_lock_unlock();
}

- (BOOL)resetOnBackoffExpiry
{
  LOBYTE(self) = self->_resetOnBackoffExpiry;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (void)setConsecutivePairingFailure:(unint64_t)a3
{
  os_unfair_recursive_lock_lock_with_options();
  self->_consecutivePairingFailures = a3;
  os_unfair_recursive_lock_unlock();
}

- (unint64_t)consecutivePairingFailure
{
  os_unfair_recursive_lock_lock_with_options();
  unint64_t consecutivePairingFailures = self->_consecutivePairingFailures;
  os_unfair_recursive_lock_unlock();
  return consecutivePairingFailures;
}

- (void)setIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    os_unfair_recursive_lock_lock_with_options();
    id v5 = (NSString *)[v7 copy];
    identifier = self->_identifier;
    self->_identifier = v5;

    os_unfair_recursive_lock_unlock();
    id v4 = v7;
  }
}

- (void)removeCloudData
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(HMDAccessory *)self accessoryProfiles];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) removeCloudData];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)unconfigure
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(HMDAccessory *)self accessoryProfiles];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) unconfigure];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(HMDAccessory *)self setAccessoryProfiles:0];
}

- (BOOL)hasSiriEndpointProfile
{
  v2 = [(HMDAccessory *)self accessoryProfiles];
  char v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_301);

  return v3;
}

uint64_t __38__HMDAccessory_hasSiriEndpointProfile__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  uint64_t v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

- (BOOL)hasMediaProfile
{
  id v2 = [(HMDAccessory *)self accessoryProfiles];
  char v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_298);

  return v3;
}

uint64_t __31__HMDAccessory_hasMediaProfile__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  uint64_t v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

- (BOOL)isFirstPartyAccessory
{
  id v2 = self;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & (v2 != 0);
}

- (void)configureWithHome:(id)a3 msgDispatcher:(id)a4 configurationTracker:(id)a5 initialConfiguration:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  long long v11 = a5;
  uint64_t v12 = v11;
  if (v11) {
    dispatch_group_enter(v11);
  }
  [(HMDAccessory *)self setHome:v9];
  [(HMDAccessory *)self setMsgDispatcher:v10];
  uint64_t v13 = [(HMDAccessory *)self workQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__HMDAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke;
  v17[3] = &unk_1E6A18668;
  v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  double v20 = v12;
  int v14 = v12;
  id v15 = v10;
  id v16 = v9;
  dispatch_async(v13, v17);
}

void __90__HMDAccessory_configureWithHome_msgDispatcher_configurationTracker_initialConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) room];

  if (!v2)
  {
    uint64_t v3 = [*(id *)(a1 + 40) roomForEntireHome];
    [*(id *)(a1 + 32) setRoom:v3];
  }
  if (*(void *)(a1 + 48))
  {
    [*(id *)(a1 + 32) _registerForMessages];
    if (*(void *)(a1 + 48))
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "accessoryProfiles", 0);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v12;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v12 != v7) {
              objc_enumerationMutation(v4);
            }
            [*(id *)(*((void *)&v11 + 1) + 8 * v8++) configureWithMessageDispatcher:*(void *)(a1 + 48) configurationTracker:*(void *)(a1 + 56)];
          }
          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v6);
      }
    }
  }
  id v9 = [*(id *)(a1 + 32) softwareUpdate];
  [v9 configureWithAccessory:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 32) messageDispatcher:*(void *)(a1 + 48)];

  id v10 = *(NSObject **)(a1 + 56);
  if (v10) {
    dispatch_group_leave(v10);
  }
}

- (void)_relayIdentifyAccessorytoResidentForMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F65480];
  uint64_t v6 = [v4 messagePayload];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__HMDAccessory__relayIdentifyAccessorytoResidentForMessage___block_invoke;
  v12[3] = &unk_1E6A18C18;
  id v13 = v4;
  id v7 = v4;
  uint64_t v8 = [v5 messageWithMessage:v7 messagePayload:v6 responseHandler:v12];

  id v9 = [(HMDAccessory *)self home];
  id v10 = [(HMDAccessory *)self uuid];
  long long v11 = [(HMDAccessory *)self workQueue];
  [v9 redispatchToResidentMessage:v8 target:v10 responseQueue:v11];
}

void __60__HMDAccessory__relayIdentifyAccessorytoResidentForMessage___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) responseHandler];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, id, void))v4)[2](v4, v5, 0);
  }
}

- (void)__handleIdentify:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (isWatch() || ![(HMDAccessory *)self isReachable])
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = self;
    long long v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      long long v12 = HMFGetLogIdentifier();
      isWatch();
      id v13 = HMFBooleanToString();
      [(HMDAccessory *)v10 isReachable];
      long long v14 = HMFBooleanToString();
      int v20 = 138543874;
      __int16 v21 = v12;
      __int16 v22 = 2112;
      uint64_t v23 = v13;
      __int16 v24 = 2112;
      uint64_t v25 = v14;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Relaying request to identify accessory because we are a watch (%@) or the accessory is unreachable (%@)", (uint8_t *)&v20, 0x20u);
    }
    if ([(HMDAccessory *)v10 isRemoteAccessEnabled])
    {
      [(HMDAccessory *)v10 _relayIdentifyAccessorytoResidentForMessage:v4];
    }
    else
    {
      id v15 = (void *)MEMORY[0x1D9452090]();
      uint64_t v16 = v10;
      int v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = HMFGetLogIdentifier();
        int v20 = 138543362;
        __int16 v21 = v18;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot relay request to identify accessory because remote access is not enabled", (uint8_t *)&v20, 0xCu);
      }
      id v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      [v4 respondWithError:v19];
    }
  }
  else
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    uint64_t v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v20 = 138543362;
      __int16 v21 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling identify", (uint8_t *)&v20, 0xCu);
    }
    [(HMDAccessory *)v6 handleIdentifyAccessoryMessage:v4];
  }
}

- (void)handleAccessoryUpdateShouldProcessTransactionRemovalValueRequestMessage:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    int v20 = v8;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling accessory update should process transaction removal value request message: %@", buf, 0x16u);
  }
  id v9 = [v4 messagePayload];
  uint64_t v10 = *MEMORY[0x1E4F2C898];
  id v18 = 0;
  uint64_t v11 = objc_msgSend(v9, "hmf_BOOLForKey:error:", v10, &v18);
  id v12 = v18;

  if (v12)
  {
    id v13 = (void *)MEMORY[0x1D9452090]();
    long long v14 = v6;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v17 = [v4 messagePayload];
      *(_DWORD *)buf = 138543874;
      int v20 = v16;
      __int16 v21 = 2112;
      id v22 = v17;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get value from payload: %@ error: %@", buf, 0x20u);
    }
    [v4 respondWithError:v12];
  }
  else
  {
    [(HMDAccessory *)v6 setShouldProcessTransactionRemoval:v11];
    [v4 respondWithSuccess];
  }
}

- (void)_handleLinkQualityRequestMessage:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = [HMDRemoteMessage alloc];
    uint64_t v6 = [v4 name];
    id v7 = [v4 destination];
    uint64_t v8 = [v4 messagePayload];
    id v9 = [(HMDRemoteMessage *)v5 initWithName:v6 destination:v7 payload:v8 type:0 timeout:1 secure:10.0];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __49__HMDAccessory__handleLinkQualityRequestMessage___block_invoke;
    v21[3] = &unk_1E6A18C18;
    id v10 = v4;
    id v22 = v10;
    [(HMDRemoteMessage *)v9 setResponseHandler:v21];
    uint64_t v11 = self;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;

    if (v13 && [(HMDAccessory *)v13 communicationProtocol] == 2)
    {
      long long v14 = [(HMDAccessory *)v11 home];
      if ([v14 isCurrentDeviceConfirmedPrimaryResident])
      {
        [(HMDAccessory *)v13 handleLinkQualityRequestMessage:v9];
      }
      else
      {
        id v15 = (void *)MEMORY[0x1D9452090]();
        uint64_t v16 = v11;
        int v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          id v18 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v24 = v18;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEBUG, "%{public}@LinkQuality: Re-dispatching to primary resident", buf, 0xCu);
        }
        id v19 = [(HMDAccessory *)v16 uuid];
        int v20 = [(HMDAccessory *)v16 workQueue];
        [v14 redispatchToResidentMessage:v9 target:v19 responseQueue:v20];
      }
    }
    else
    {
      long long v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48 description:@"This Accessory type does not support link quality" reason:0 suggestion:0];
      [v10 respondWithError:v14];
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48 description:@"Feature is disabled" reason:@"Feature flag is disabled" suggestion:0];
    [v4 respondWithError:v9];
  }
}

uint64_t __49__HMDAccessory__handleLinkQualityRequestMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 respondWithError:a2];
  }
  else {
    return objc_msgSend(v2, "respondWithPayload:");
  }
}

- (void)sendLastSeenStatusResponseMessage:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v27 = 138543618;
    char v28 = v8;
    __int16 v29 = 2112;
    id v30 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@LastSeen: Handling message %@", (uint8_t *)&v27, 0x16u);
  }
  if ([(HMDAccessory *)v6 isReachable])
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = v6;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      int v27 = 138543362;
      char v28 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@LastSeen: Accessory is reachable responding with error", (uint8_t *)&v27, 0xCu);
    }
    uint64_t v13 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2505];
LABEL_16:
    id v19 = (void *)v13;
    [v4 respondWithError:v13];
    goto LABEL_17;
  }
  if (![(HMDAccessory *)v6 hasBattery]
    || ![(HMDAccessory *)v6 _getLastKnownLowBatteryStatus])
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = v6;
    int v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      int v27 = 138543362;
      char v28 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@LastSeen: Accessory did not report low battery - LastSeen is not tracked", (uint8_t *)&v27, 0xCu);
    }
    uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    goto LABEL_16;
  }
  if ([(HMDAccessory *)v6 hasBattery])
  {
    if ([(HMDAccessory *)v6 isLowBattery]) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = 2;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  int v20 = (void *)MEMORY[0x1D9452090]();
  __int16 v21 = v6;
  id v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    __int16 v23 = HMFGetLogIdentifier();
    id v24 = [(HMDAccessory *)v21 lastSeenDate];
    int v27 = 138543874;
    char v28 = v23;
    __int16 v29 = 2112;
    id v30 = v24;
    __int16 v31 = 2048;
    uint64_t v32 = v14;
    _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_DEBUG, "%{public}@LastSeen: Responding from primary with lastSeen: %@, batteryStatus: %lu", (uint8_t *)&v27, 0x20u);
  }
  id v19 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v25 = [(HMDAccessory *)v21 lastSeenDate];
  [v19 setObject:v25 forKeyedSubscript:@"kAccessoryLastSeenKey"];

  uint64_t v26 = [NSNumber numberWithUnsignedInteger:v14];
  [v19 setObject:v26 forKeyedSubscript:@"kAccessoryLowBatteryStatusKey"];

  [v4 respondWithPayload:v19];
LABEL_17:
}

- (void)_handleLastSeenStatusRequestMessage:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [HMDRemoteMessage alloc];
  uint64_t v6 = [v4 name];
  id v7 = [v4 destination];
  uint64_t v8 = [v4 messagePayload];
  id v9 = [(HMDRemoteMessage *)v5 initWithName:v6 destination:v7 payload:v8 type:0 timeout:1 secure:10.0];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __52__HMDAccessory__handleLastSeenStatusRequestMessage___block_invoke;
  v18[3] = &unk_1E6A18C18;
  id v10 = v4;
  id v19 = v10;
  [(HMDRemoteMessage *)v9 setResponseHandler:v18];
  uint64_t v11 = [(HMDAccessory *)self home];
  if ([v11 isCurrentDeviceConfirmedPrimaryResident])
  {
    [(HMDAccessory *)self sendLastSeenStatusResponseMessage:v9];
  }
  else
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    uint64_t v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v21 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEBUG, "%{public}@LastSeen: Re-dispatching to primary resident", buf, 0xCu);
    }
    uint64_t v16 = [(HMDAccessory *)v13 uuid];
    int v17 = [(HMDAccessory *)v13 workQueue];
    [v11 redispatchToResidentMessage:v9 target:v16 responseQueue:v17];
  }
}

uint64_t __52__HMDAccessory__handleLastSeenStatusRequestMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 respondWithError:a2];
  }
  else {
    return objc_msgSend(v2, "respondWithPayload:");
  }
}

- (void)_registerForMessages
{
  v81[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDAccessory *)self home];
  id v4 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v3 userPrivilege:0 remoteAccessRequired:0];
  id v5 = [v3 administratorHandler];
  uint64_t v6 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  v80[0] = v6;
  id v7 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  v80[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:2];
  [v5 registerForMessage:@"kUpdateRoomForAccessoryRequestKey" receiver:self policies:v8 selector:sel___handleUpdateRoom_];

  id v9 = [v3 administratorHandler];
  id v10 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  v79[0] = v10;
  uint64_t v11 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  v79[1] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:2];
  [v9 registerForMessage:@"kRenameAccessoryRequestKey" receiver:self policies:v12 selector:sel___handleRename_];

  uint64_t v13 = [v3 administratorHandler];
  uint64_t v14 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v78[0] = v14;
  id v15 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:7];
  v78[1] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:2];
  [v13 registerForMessage:@"kSetAppDataRequestKey" receiver:self policies:v16 selector:sel___handleSetAppData_];

  int v17 = [v3 administratorHandler];
  uint64_t v18 = *MEMORY[0x1E4F2C888];
  id v19 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v77[0] = v19;
  int v20 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:7];
  v77[1] = v20;
  __int16 v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:2];
  [v17 registerForMessage:v18 receiver:self policies:v21 selector:sel___handleUpdatePendingConfigurationIdentifierMessage_];

  uint64_t v22 = [(HMDAccessory *)self msgDispatcher];
  __int16 v23 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v76[0] = v23;
  v76[1] = v4;
  id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
  [v22 registerForMessage:@"kAccessoryAdvertisingParamsRequestKey" receiver:self policies:v24 selector:sel___handleGetAccessoryAdvertisingParams_];

  uint64_t v25 = [(HMDAccessory *)self msgDispatcher];
  uint64_t v26 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v75[0] = v26;
  int v27 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v3 userPrivilege:3 remoteAccessRequired:0];
  v75[1] = v27;
  char v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:2];
  [v25 registerForMessage:@"kListPairingsRequestKey" receiver:self policies:v28 selector:sel___handleListPairings_];

  __int16 v29 = [(HMDAccessory *)self msgDispatcher];
  uint64_t v30 = *MEMORY[0x1E4F2C148];
  __int16 v31 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v74[0] = v31;
  uint64_t v32 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v3 userPrivilege:3 remoteAccessRequired:0];
  v74[1] = v32;
  uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];
  [v29 registerForMessage:v30 receiver:self policies:v33 selector:sel___handleAuditPairings_];

  uint64_t v34 = [(HMDAccessory *)self msgDispatcher];
  uint64_t v35 = *MEMORY[0x1E4F2C4C8];
  uint64_t v36 = +[HMDXPCMessagePolicy policyWithEntitlements:13];
  v73[0] = v36;
  v73[1] = v4;
  uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:2];
  [v34 registerForMessage:v35 receiver:self policies:v37 selector:sel___handlePairingIdentityRequest_];

  __int16 v38 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  objc_msgSend(v38, "setRoles:", objc_msgSend(v38, "roles") | 6);
  uint64_t v39 = (void *)[v38 copy];
  id v40 = [(HMDAccessory *)self msgDispatcher];
  __int16 v41 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  v72[0] = v41;
  v72[1] = v39;
  v72[2] = v4;
  id v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:3];
  [v40 registerForMessage:@"kIdentifyAccessoryRequestKey" receiver:self policies:v42 selector:sel___handleIdentify_];

  if (isInternalBuild())
  {
    __int16 v43 = [(HMDAccessory *)self msgDispatcher];
    uint64_t v44 = *MEMORY[0x1E4F2DA70];
    __int16 v45 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    v71[0] = v45;
    __int16 v46 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
    v71[1] = v46;
    __int16 v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
    [v43 registerForMessage:v44 receiver:self policies:v47 selector:sel__handleWiFiReconfiguration_];

    uint64_t v48 = [(HMDAccessory *)self msgDispatcher];
    uint64_t v49 = *MEMORY[0x1E4F2C8A0];
    int64_t v50 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    v70[0] = v50;
    uint64_t v51 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v3 userPrivilege:3 remoteAccessRequired:0];
    v70[1] = v51;
    v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
    [v48 registerForMessage:v49 receiver:self policies:v52 selector:sel_handleAccessoryUpdateShouldProcessTransactionRemovalValueRequestMessage_];
  }
  uint64_t v53 = [(HMDAccessory *)self msgDispatcher];
  uint64_t v54 = *MEMORY[0x1E4F2C508];
  v69[0] = v4;
  uint64_t v55 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  v69[1] = v55;
  int64_t v56 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v69[2] = v56;
  id v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:3];
  [v53 registerForMessage:v54 receiver:self policies:v57 selector:sel__handleLastSeenStatusRequestMessage_];

  uint64_t v58 = [(HMDAccessory *)self msgDispatcher];
  uint64_t v59 = *MEMORY[0x1E4F2C510];
  v68[0] = v4;
  uint64_t v60 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  v68[1] = v60;
  uint64_t v61 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v68[2] = v61;
  v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:3];
  [v58 registerForMessage:v59 receiver:self policies:v62 selector:sel__handleLinkQualityRequestMessage_];

  if (self)
  {
    uint64_t v63 = [(HMDAccessory *)self msgDispatcher];
    uint64_t v64 = *MEMORY[0x1E4F2DA60];
    v65 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
    v81[0] = v65;
    uint64_t v66 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
    v81[1] = v66;
    v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];
    [v63 registerForMessage:v64 receiver:self policies:v67 selector:sel__handlePreviewAllowedHosts_];
  }
}

- (id)backingStoreObjects:(int64_t)a3
{
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [(HMDAccessory *)self appData];

  if (a3 >= 3 && v6)
  {
    id v7 = [(HMDAccessory *)self appData];
    uint64_t v8 = [v7 modelObjectWithChangeType:1];
    [v5 addObject:v8];
  }
  if (a3 > 3)
  {
    id v9 = [(HMDAccessory *)self softwareUpdate];
    id v10 = v9;
    if (v9 && [v9 downloadSize])
    {
      uint64_t v11 = [v10 model];
      [v11 setObjectChangeType:1];
      id v12 = [v11 parentUUID];

      if (!v12)
      {
        uint64_t v13 = [(HMDAccessory *)self uuid];
        [v11 setParentUUIDIfNotNil:v13];
      }
      [v5 addObject:v11];
    }
  }
  return v5;
}

- (id)transactionWithObjectChangeType:(unint64_t)a3
{
  id v5 = [HMDAccessoryTransaction alloc];
  uint64_t v6 = [(HMDAccessory *)self uuid];
  id v7 = [(HMDAccessory *)self home];
  uint64_t v8 = [v7 uuid];
  id v9 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:a3 uuid:v6 parentUUID:v8];

  return v9;
}

- (NSArray)transportReports
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)shortDescription
{
  int v3 = isInternalBuild();
  id v4 = NSString;
  if (v3)
  {
    id v5 = [(HMDAccessory *)self name];
    uint64_t v6 = [(HMDAccessory *)self uuid];
    id v7 = [(HMDAccessory *)self identifier];
    [(HMDAccessory *)self isReachable];
    uint64_t v8 = HMFBooleanToString();
    id v9 = [v4 stringWithFormat:@"%@/%@/%@/%@", v5, v6, v7, v8];
  }
  else
  {
    id v5 = [(HMDAccessory *)self uuid];
    uint64_t v6 = [(HMDAccessory *)self identifier];
    [(HMDAccessory *)self isReachable];
    id v7 = HMFBooleanToString();
    id v9 = [v4 stringWithFormat:@"%@/%@/%@", v5, v6, v7];
  }

  return v9;
}

- (void)setCategory:(id)a3
{
  id v4 = [MEMORY[0x1E4F2E7B0] cachedInstanceForHMAccessoryCategory:a3];
  category = self->_category;
  self->_category = v4;
  MEMORY[0x1F41817F8](v4, category);
}

- (unint64_t)supportedTransports
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (BOOL)isPrimary
{
  return 1;
}

- (void)dealloc
{
  uint64_t v3 = [(HMDAccessory *)self msgDispatcher];
  [v3 deregisterReceiver:self];

  id v4 = [(HMDAccessory *)self home];
  id v5 = [v4 administratorHandler];
  [v5 deregisterReceiver:self];

  v6.receiver = self;
  v6.super_class = (Class)HMDAccessory;
  [(HMDAccessory *)&v6 dealloc];
}

- (void)sendRemovalRequestWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  objc_super v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    id v9 = [(HMDAccessory *)v6 shortDescription];
    int v11 = 138543618;
    id v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending removal request for accessory: %@", (uint8_t *)&v11, 0x16u);
  }
  id v10 = [(HMDAccessory *)v6 home];
  [v10 handleRemoveAccessory:v6 completion:v4];
}

- (void)sendRemovalRequest
{
}

- (void)setDefaultPreferredMediaUserIfRemoved:(id)a3 defaultUser:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    _HMFPreconditionFailure();
  }
  int v11 = (void (**)(void, void))v10;
  id v12 = [v8 uuid];
  __int16 v13 = [(HMDAccessory *)self preferredMediaUserUUID];
  int v14 = objc_msgSend(v12, "hmf_isEqualToUUID:", v13);

  if (v14)
  {
    uint64_t v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = self;
    int v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v25 = 138543874;
      uint64_t v26 = v18;
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Resetting preferred media user: %@ to default user: %@.", (uint8_t *)&v25, 0x20u);
    }
    if (v9)
    {
      id v19 = [v9 uuid];
      [(HMDAccessory *)v16 setPreferredMediaUser:v19 selectionType:0 completion:v11];
    }
    else
    {
      [(HMDAccessory *)v16 setPreferredMediaUser:0 selectionType:0 completion:v11];
    }
  }
  else
  {
    int v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    __int16 v21 = (void *)MEMORY[0x1D9452090]();
    uint64_t v22 = self;
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = HMFGetLogIdentifier();
      int v25 = 138543618;
      uint64_t v26 = v24;
      __int16 v27 = 2112;
      id v28 = v20;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Removed user is not current preferred media user: %@", (uint8_t *)&v25, 0x16u);
    }
    if (v11) {
      ((void (**)(void, void *))v11)[2](v11, v20);
    }
  }
}

- (void)setPreferredMediaUser:(id)a3 selectionType:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __63__HMDAccessory_setPreferredMediaUser_selectionType_completion___block_invoke;
  v11[3] = &unk_1E6A16F80;
  objc_copyWeak(&v13, &location);
  id v10 = v9;
  id v12 = v10;
  [(HMDAccessory *)self runTransactionWithPreferredMediaUserUUID:v8 selectionType:a4 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __63__HMDAccessory_setPreferredMediaUser_selectionType_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = WeakRetained;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      int v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to set preferred media user, error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  }
}

- (void)encodePreferredMediaUser:(id)a3
{
  id v7 = a3;
  id v4 = [(HMDAccessory *)self preferredMediaUserUUID];
  [v7 encodeObject:v4 forKey:*MEMORY[0x1E4F2C4E0]];

  id v5 = [(HMDAccessory *)self preferredMediaUserSelectionTypeNumber];

  if (v5)
  {
    id v6 = [(HMDAccessory *)self preferredMediaUserSelectionTypeNumber];
    [v7 encodeObject:v6 forKey:*MEMORY[0x1E4F2C4F0]];
  }
}

- (void)decodePreferredMediaUser:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2C4E0]];
  [(HMDAccessory *)self setPreferredMediaUserUUID:v5];

  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2C4F0]];

  [(HMDAccessory *)self setPreferredMediaUserSelectionTypeNumber:v6];
}

- (void)transactionAccessoryUpdatedForPreferredMediaUser:(id)a3 completionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  if ([v6 propertyWasSet:@"preferredMediaUserUUID"]
    && ([v6 preferredMediaUserUUID],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [(HMDAccessory *)self preferredMediaUserUUID],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = HMFEqualObjects(),
        v9,
        v8,
        (v10 & 1) == 0))
  {
    __int16 v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      uint64_t v16 = [v6 preferredMediaUserUUID];
      int v27 = 138543618;
      id v28 = v15;
      __int16 v29 = 2112;
      id v30 = v16;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Updated preferred media user UUID: %@", (uint8_t *)&v27, 0x16u);
    }
    int v17 = [v6 preferredMediaUserUUID];
    [(HMDAccessory *)v13 setPreferredMediaUserUUID:v17];

    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = 0;
  }
  if ([v6 propertyWasSet:@"preferredUserSelectionType"])
  {
    uint64_t v18 = [v6 preferredUserSelectionType];
    id v19 = [(HMDAccessory *)self preferredMediaUserSelectionTypeNumber];
    char v20 = HMFEqualObjects();

    if ((v20 & 1) == 0)
    {
      __int16 v21 = (void *)MEMORY[0x1D9452090]();
      uint64_t v22 = self;
      __int16 v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = HMFGetLogIdentifier();
        int v25 = [v6 preferredUserSelectionType];
        int v27 = 138543618;
        id v28 = v24;
        __int16 v29 = 2112;
        id v30 = v25;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Updated preferred media user selection type: %@", (uint8_t *)&v27, 0x16u);
      }
      uint64_t v26 = [v6 preferredUserSelectionType];
      [(HMDAccessory *)v22 setPreferredMediaUserSelectionTypeNumber:v26];

      uint64_t v11 = 1;
    }
  }
  v7[2](v7, v11);
}

- (void)runTransactionWithModels:(id)a3 label:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMDAccessory *)self home];
  __int16 v12 = [v11 backingStore];

  id v13 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
  uint64_t v14 = [v12 transaction:v9 options:v13];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = v8;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        [v14 add:*(void *)(*((void *)&v23 + 1) + 8 * v19++)];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v17);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __58__HMDAccessory_runTransactionWithModels_label_completion___block_invoke;
  v21[3] = &unk_1E6A19358;
  id v22 = v10;
  id v20 = v10;
  [v14 run:v21];
}

uint64_t __58__HMDAccessory_runTransactionWithModels_label_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)runTransactionWithModel:(id)a3 label:(id)a4 completion:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  __int16 v12 = [v8 arrayWithObjects:&v13 count:1];

  -[HMDAccessory runTransactionWithModels:label:completion:](self, "runTransactionWithModels:label:completion:", v12, v10, v9, v13, v14);
}

- (HMDAccessory)initWithTransaction:(id)a3 home:(id)a4
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessory *)self init];
  if (!v8)
  {
LABEL_37:
    long long v26 = v8;
    goto LABEL_38;
  }
  uint64_t v9 = [v6 uuid];
  uuid = v8->_uuid;
  v8->_uuid = (NSUUID *)v9;

  id v11 = [v6 configuredName];
  uint64_t v12 = objc_msgSend(v11, "hm_truncatedNameString");
  configuredName = v8->_configuredName;
  v8->_configuredName = (NSString *)v12;

  uint64_t v14 = [v6 identifier];
  identifier = v8->_identifier;
  v8->_identifier = (NSString *)v14;

  if (v8->_identifier)
  {
    objc_storeWeak((id *)&v8->_home, v7);
    uint64_t v16 = [v6 roomUUID];

    if (v16)
    {
      id v17 = objc_alloc(MEMORY[0x1E4F29128]);
      uint64_t v18 = [v6 roomUUID];
      uint64_t v19 = (void *)[v17 initWithUUIDString:v18];
      uint64_t v20 = [v7 roomWithUUID:v19];
      room = v8->_room;
      v8->_room = (HMDRoom *)v20;
    }
    else
    {
      uint64_t v27 = [v7 roomForEntireHome];
      uint64_t v18 = v8->_room;
      v8->_room = (HMDRoom *)v27;
    }

    uint64_t v28 = [v6 providedName];
    uint64_t v29 = objc_msgSend(v28, "hm_truncatedNameString");
    providedName = v8->_providedName;
    v8->_providedName = (NSString *)v29;

    uint64_t v31 = [v6 model];
    model = v8->_model;
    v8->_model = (NSString *)v31;

    uint64_t v33 = [v6 manufacturer];
    manufacturer = v8->_manufacturer;
    v8->_manufacturer = (NSString *)v33;

    v8->_accessoryReprovisionState = 0;
    uint64_t v35 = [v6 firmwareVersion];

    if (v35)
    {
      uint64_t v36 = [HMDAccessoryVersion alloc];
      uint64_t v37 = [v6 firmwareVersion];
      uint64_t v38 = [(HMDAccessoryVersion *)v36 initWithVersionString:v37];
      firmwareVersion = v8->_firmwareVersion;
      v8->_firmwareVersion = (HMDAccessoryVersion *)v38;
    }
    id v40 = [v6 displayableFirmwareVersion];

    if (v40)
    {
      uint64_t v41 = [v6 displayableFirmwareVersion];
      displayableFirmwareVersion = v8->_displayableFirmwareVersion;
      v8->_displayableFirmwareVersion = (NSString *)v41;
    }
    uint64_t v43 = [v6 serialNumber];
    serialNumber = v8->_serialNumber;
    v8->_serialNumber = (NSString *)v43;

    uint64_t v45 = [v6 initialModel];
    initialModel = v8->_initialModel;
    v8->_initialModel = (NSString *)v45;

    uint64_t v47 = [v6 initialManufacturer];
    initialManufacturer = v8->_initialManufacturer;
    v8->_initialManufacturer = (NSString *)v47;

    uint64_t v49 = [v6 initialCategoryIdentifier];
    initialCategoryIdentifier = v8->_initialCategoryIdentifier;
    v8->_initialCategoryIdentifier = (NSNumber *)v49;

    uint64_t v51 = [v6 productDataV2];
    v52 = v51;
    if (!v51)
    {
      v52 = [v6 productData];
    }
    objc_storeStrong((id *)&v8->_productData, v52);
    if (!v51) {

    }
    uint64_t v53 = [v6 suspendCapable];

    if (v53)
    {
      uint64_t v54 = [v6 suspendCapable];
      v8->_suspendCapable = [v54 BOOLValue];
    }
    uint64_t v55 = [v6 lastSeenDate];

    if (v55)
    {
      uint64_t v56 = [v6 lastSeenDate];
      lastSeenDate = v8->_lastSeenDate;
      v8->_lastSeenDate = (NSDate *)v56;
    }
    uint64_t v58 = [v6 lowBattery];

    if (v58)
    {
      uint64_t v59 = [v6 lowBattery];
      v8->_lowBattery = [v59 BOOLValue];
    }
    uint64_t v60 = [v7 msgDispatcher];
    msgDispatcher = v8->_msgDispatcher;
    v8->_msgDispatcher = (HMFMessageDispatcher *)v60;

    v62 = [v6 accessoryCategory];
    id v63 = [(HMDAccessory *)v8 _updateCategory:v62 notifyClients:0];

    uint64_t v64 = [v6 networkClientIdentifier];
    networkClientIdentifier = v8->_networkClientIdentifier;
    v8->_networkClientIdentifier = (NSNumber *)v64;

    id v66 = objc_alloc(MEMORY[0x1E4F29128]);
    v67 = [v6 networkRouterUUID];
    uint64_t v68 = [v66 initWithUUIDString:v67];
    networkRouterUUID = v8->_networkRouterUUID;
    v8->_networkRouterUUID = (NSUUID *)v68;

    uint64_t v70 = [v6 currentNetworkProtectionMode];

    if (v70)
    {
      char v71 = [v6 currentNetworkProtectionMode];
      v8->_int64_t currentNetworkProtectionMode = [v71 integerValue];
    }
    uint64_t v72 = [v6 wiFiCredentialType];

    if (v72)
    {
      long long v73 = (void *)MEMORY[0x1D9452090]();
      uint64_t v74 = v8;
      long long v75 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
      {
        long long v76 = HMFGetLogIdentifier();
        uint64_t v77 = [v6 wiFiCredentialType];
        int v102 = 138543618;
        v103 = v76;
        __int16 v104 = 2112;
        id v105 = v77;
        _os_log_impl(&dword_1D49D5000, v75, OS_LOG_TYPE_INFO, "%{public}@Setting accessory wiFiCredentialType to %@", (uint8_t *)&v102, 0x16u);
      }
      uint64_t v78 = [v6 wiFiCredentialType];
      v74->_int64_t wiFiCredentialType = [v78 integerValue];
    }
    BOOL v79 = [v6 appliedFirewallWANRules];
    uint64_t v80 = +[HMDAccessoryAllowedHost allowedHostsFromJSONFirewallWANRules:v79];
    allowedHosts = v8->_allowedHosts;
    v8->_allowedHosts = (NSArray *)v80;

    uint64_t v82 = [v6 wiFiUniquePreSharedKey];
    wiFiUniquePreSharedKey = v8->_wiFiUniquePreSharedKey;
    v8->_wiFiUniquePreSharedKey = (NSData *)v82;

    uint64_t v84 = [HMDAccessoryNetworkAccessViolation alloc];
    uint64_t v85 = [v6 lastNetworkAccessViolationOccurrenceSince1970];
    v86 = [v6 lastNetworkAccessViolationResetSince1970];
    v87 = [(HMDAccessoryNetworkAccessViolation *)v84 initWithLastViolationTimeInterval:v85 lastViolationResetTimeInterval:v86];

    if ((HMFEqualObjects() & 1) == 0) {
      objc_storeStrong((id *)&v8->_networkAccessViolation, v87);
    }
    v88 = [v6 primaryProfileVersion];

    if (v88)
    {
      id v89 = objc_alloc(MEMORY[0x1E4F65590]);
      long long v90 = [v6 primaryProfileVersion];
      uint64_t v91 = [v89 initWithVersionString:v90];
      primaryProfileVersion = v8->_primaryProfileVersion;
      v8->_primaryProfileVersion = (HMFVersion *)v91;
    }
    uint64_t v93 = [v6 sharedAdminAddedTimestamp];
    sharedAdminAddedTimestamp = v8->_sharedAdminAddedTimestamp;
    v8->_sharedAdminAddedTimestamp = (HMDUserManagementOperationTimestamp *)v93;

    uint64_t v95 = [v6 pairingsAuditedTimestamp];
    pairingsAuditedTimestamp = v8->_pairingsAuditedTimestamp;
    v8->_pairingsAuditedTimestamp = (HMDUserManagementOperationTimestamp *)v95;

    uint64_t v97 = [v6 pendingConfigurationIdentifier];
    pendingConfigurationIdentifier = v8->_pendingConfigurationIdentifier;
    v8->_pendingConfigurationIdentifier = (NSString *)v97;

    uint64_t v99 = [v6 hostAccessoryUUID];
    if (v99) {
      v100 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v99];
    }
    else {
      v100 = 0;
    }
    [(HMDAccessory *)v8 _updateHost:v100];

    goto LABEL_37;
  }
  id v22 = (void *)MEMORY[0x1D9452090]();
  long long v23 = v8;
  long long v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    long long v25 = HMFGetLogIdentifier();
    int v102 = 138543618;
    v103 = v25;
    __int16 v104 = 2112;
    id v105 = v6;
    _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create accessory from transaction with nil identifier: %@", (uint8_t *)&v102, 0x16u);
  }
  long long v26 = 0;
LABEL_38:

  return v26;
}

- (HMDAccessory)initWithNotificationCenter:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HMDAccessory;
  id v6 = [(HMDAccessory *)&v27 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_notificationCenter, a3);
    HMDispatchQueueNameString();
    id v8 = objc_claimAutoreleasedReturnValue();
    uint64_t v9 = (const char *)[v8 UTF8String];
    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v11 = dispatch_get_global_queue(21, 0);
    dispatch_queue_t v12 = dispatch_queue_create_with_target_V2(v9, v10, v11);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v12;

    [MEMORY[0x1E4F65420] blessWithImplicitContext:v7->_workQueue];
    uint64_t v14 = [MEMORY[0x1E4F29128] UUID];
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    accessoryProfiles = v7->_accessoryProfiles;
    v7->_accessoryProfiles = (NSMutableSet *)v16;

    v7->_int64_t currentNetworkProtectionMode = 4;
    v7->_int64_t wiFiCredentialType = 0;
    uint64_t v18 = +[HMDAccessoryNetworkAccessViolation noViolation];
    networkAccessViolation = v7->_networkAccessViolation;
    v7->_networkAccessViolation = (HMDAccessoryNetworkAccessViolation *)v18;

    v7->_reachabilityPingEnabled = 0;
    v7->_reachabilityPingNotificationEnabled = 0;
    uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
    timeBecameUnBOOL reachable = v7->_timeBecameUnreachable;
    v7->_timeBecameUnBOOL reachable = (NSDate *)v20;

    timeBecameReachable = v7->_timeBecameReachable;
    v7->_timeBecameReachable = 0;

    v7->_shouldProcessTransactionRemoval = 1;
    long long v23 = objc_alloc_init(HMDFeaturesDataSource);
    featuresDataSource = v7->_featuresDataSource;
    v7->_featuresDataSource = v23;

    id hashedRouteFactory = v7->_hashedRouteFactory;
    v7->_id hashedRouteFactory = &__block_literal_global_45413;
  }
  return v7;
}

id __43__HMDAccessory_initWithNotificationCenter___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[HMDHelper sharedHelper];
  id v4 = [v3 hashedRouteIDForIdentifier:v2];

  return v4;
}

- (HMDAccessory)init
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = [(HMDAccessory *)self initWithNotificationCenter:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __27__HMDAccessory_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v172;
  logCategory__hmf_once_v172 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)splitProductDataIntoProductGroupAndProductNumber:(id)a3 productGroup:(id *)a4 productNumber:(id *)a5
{
  id v7 = a3;
  int v8 = [(id)objc_opt_class() validateProductData:v7];
  if (v8)
  {
    if (a4)
    {
      objc_msgSend(v7, "substringWithRange:", 0, 8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a5)
    {
      objc_msgSend(v7, "substringWithRange:", 8, 8);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

+ (BOOL)validateProductData:(id)a3
{
  id v3 = a3;
  if ([v3 length] == 16)
  {
    id v4 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789ABCDEFabcdef"];
    id v5 = [v4 invertedSet];

    BOOL v6 = [v3 rangeOfCharacterFromSet:v5] == 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)metricLoggingTransportDetails
{
  id v2 = [[HMDAccessoryMetricTransportDetails alloc] initWithAccessory:self];
  return v2;
}

- (void)populateVendorDetailsForCoreAnalytics:(id)a3 keyPrefix:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v20 = [[HMDAccessoryMetricVendorDetails alloc] initWithAccessory:self];
  int v8 = [(HMDAccessoryMetricVendorDetails *)v20 productData];
  uint64_t v9 = [v6 stringByAppendingString:@"ProductData"];
  [v7 setObject:v8 forKeyedSubscript:v9];

  id v10 = [(HMDAccessoryMetricVendorDetails *)v20 manufacturer];
  id v11 = [v6 stringByAppendingString:@"Manufacturer"];
  [v7 setObject:v10 forKeyedSubscript:v11];

  dispatch_queue_t v12 = [(HMDAccessoryMetricVendorDetails *)v20 model];
  id v13 = [v6 stringByAppendingString:@"Model"];
  [v7 setObject:v12 forKeyedSubscript:v13];

  uint64_t v14 = [(HMDAccessoryMetricVendorDetails *)v20 firmwareVersion];
  id v15 = [v6 stringByAppendingString:@"FirmwareVersion"];
  [v7 setObject:v14 forKeyedSubscript:v15];

  uint64_t v16 = [(HMDAccessoryMetricVendorDetails *)v20 category];
  id v17 = [v6 stringByAppendingString:@"Category"];
  [v7 setObject:v16 forKeyedSubscript:v17];

  uint64_t v18 = [(HMDAccessoryMetricVendorDetails *)v20 differentiationNumber];
  uint64_t v19 = [v6 stringByAppendingString:@"DifferentiationNumber"];

  [v7 setObject:v18 forKeyedSubscript:v19];
}

- (NSDictionary)assistantObject
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessory *)self home];
  if (v3
    && ([(HMDAccessory *)self name], id v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v27[0] = *MEMORY[0x1E4F96FC0];
    id v6 = [(HMDAccessory *)self name];
    v27[1] = v6;
    v26[2] = @"objectIdentifier";
    id v7 = [(HMDAccessory *)self urlString];
    void v27[2] = v7;
    v26[3] = @"objectHome";
    int v8 = [v3 name];
    v27[3] = v8;
    v26[4] = @"objectHomeIdentifier";
    uint64_t v9 = [v3 urlString];
    v26[5] = @"objectReference";
    v27[4] = v9;
    v27[5] = self;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:6];
    id v11 = (void *)[v5 initWithDictionary:v10];

    dispatch_queue_t v12 = [(HMDAccessory *)self hashRouteID];
    if (v12) {
      [v11 setObject:v12 forKey:@"objectHashedRouteUID"];
    }
    id v13 = [(HMDAccessory *)self room];
    uint64_t v14 = [v13 name];
    if (v14)
    {
      id v15 = [v3 name];
      char v16 = [v14 isEqualToString:v15];

      if ((v16 & 1) == 0)
      {
        [v11 setObject:v14 forKey:@"objectRoom"];
        id v17 = [v13 urlString];
        [v11 setObject:v17 forKey:@"objectRoomIdentifier"];
      }
    }
    uint64_t v18 = (void *)[v11 copy];
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1D9452090]();
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = HMFGetLogIdentifier();
      id v22 = [(HMDAccessory *)self name];
      long long v23 = [(HMDAccessory *)self uuid];
      long long v24 = [v23 UUIDString];
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v21;
      __int16 v30 = 2112;
      uint64_t v31 = v22;
      __int16 v32 = 2112;
      uint64_t v33 = v24;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping because accessory.home or accessory.name is nil for %@/%@", buf, 0x20u);
    }
    uint64_t v18 = 0;
  }

  return (NSDictionary *)v18;
}

- (NSString)urlString
{
  id v2 = [(HMDAccessory *)self uuid];
  id v3 = hm_assistantIdentifier();

  return (NSString *)v3;
}

- (HMDNetworkRouterFirewallRuleAccessoryIdentifier)metadataIdentifier
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessory *)self productData];
  if (v3)
  {
    id v4 = [(HMDAccessory *)self firmwareVersion];
    id v5 = +[HMDNetworkRouterFirewallRuleAccessoryIdentifier createWithProductData:v3 firmwareVersion:v4];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      dispatch_queue_t v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = self;
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = HMFGetLogIdentifier();
        int v17 = 138543874;
        uint64_t v18 = v15;
        __int16 v19 = 2112;
        uint64_t v20 = v3;
        __int16 v21 = 2112;
        id v22 = v4;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to generate meta-data identifier with product data '%@' and firmware version '%@'", (uint8_t *)&v17, 0x20u);
      }
    }
  }
  else
  {
    int v8 = (void *)MEMORY[0x1D9452090]();
    uint64_t v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = HMFGetLogIdentifier();
      int v17 = 138543618;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to generate meta-data identifier because the productData is nil -- %@", (uint8_t *)&v17, 0x16u);
    }
    id v6 = 0;
  }

  return (HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v6;
}

@end