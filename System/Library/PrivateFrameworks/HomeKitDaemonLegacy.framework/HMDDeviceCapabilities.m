@interface HMDDeviceCapabilities
+ (BOOL)isAppleMediaAccessory;
+ (BOOL)isCompanionCapable;
+ (BOOL)isInternalVirtualDevice;
+ (BOOL)requiresHomePod2ndGenPairing;
+ (BOOL)requiresHomePodMiniPairing;
+ (BOOL)supportsAddingAccessory;
+ (BOOL)supportsAudioDestinationControllerCreation;
+ (BOOL)supportsAudioDestinationCreation;
+ (BOOL)supportsBackboard;
+ (BOOL)supportsBidirectionalAudioForCameraStreaming;
+ (BOOL)supportsBulletinBoard;
+ (BOOL)supportsCameraSnapshotRequestViaRelay;
+ (BOOL)supportsCustomerReset;
+ (BOOL)supportsDeviceLock;
+ (BOOL)supportsDismissUserNotificationAndDialog;
+ (BOOL)supportsHomeApp;
+ (BOOL)supportsHomeKitDataStream;
+ (BOOL)supportsHostingLocalTempAndHumiditySensor;
+ (BOOL)supportsIntentDonation;
+ (BOOL)supportsLocalization;
+ (BOOL)supportsReceivingRemoteCameraStream;
+ (BOOL)supportsRemoteAccess;
+ (BOOL)supportsSecureCoding;
+ (BOOL)supportsSiriUnsecuringActionsWithNoPasscode;
+ (BOOL)supportsSiriUnsecuringActionsWithWatchAuth;
+ (BOOL)supportsStereoPairingV1;
+ (BOOL)supportsStereoPairingV2;
+ (BOOL)supportsStereoPairingV3;
+ (BOOL)supportsStereoPairingV4;
+ (BOOL)supportsSymptomsHandler;
+ (BOOL)supportsSyncingToSharedUsers;
+ (BOOL)supportsTargetControllerAutoConfigure;
+ (BOOL)supportsUserNotifications;
+ (HMDDeviceCapabilities)deviceCapabilities;
+ (id)deviceCapabilitiesModelIdentifierWithParentIdentifier:(id)a3;
+ (id)logCategory;
+ (unint64_t)appleMediaAccessoryVariant;
+ (unint64_t)supportedPairingCapabilities;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMessagedHomePodSettingsFeatureEnabled;
- (BOOL)isRemoteGatewayCapable;
- (BOOL)isResidentCapable;
- (BOOL)supportsAccessCodes;
- (BOOL)supportsAnnounce;
- (BOOL)supportsAssistantAccessControl;
- (BOOL)supportsAudioAnalysis;
- (BOOL)supportsAudioReturnChannel;
- (BOOL)supportsCHIP;
- (BOOL)supportsCameraActivityZones;
- (BOOL)supportsCameraPackageDetection;
- (BOOL)supportsCameraRecording;
- (BOOL)supportsCameraRecordingReachabilityNotifications;
- (BOOL)supportsCameraSignificantEventNotifications;
- (BOOL)supportsCaptiveNetworks;
- (BOOL)supportsCloudDataSync;
- (BOOL)supportsCompanionInitiatedObliterate;
- (BOOL)supportsCompanionInitiatedRestart;
- (BOOL)supportsCoordinationDoorbellChime;
- (BOOL)supportsCoordinationFreeDoorbellChime;
- (BOOL)supportsCustomMediaApplicationDestination;
- (BOOL)supportsDeviceSetup;
- (BOOL)supportsDistributedExecutionOnAppleMediaAccessories;
- (BOOL)supportsDistributedExecutionOnPrimary;
- (BOOL)supportsDoorbellChime;
- (BOOL)supportsDropIn;
- (BOOL)supportsEventLog;
- (BOOL)supportsFaceClassification;
- (BOOL)supportsFirmwareUpdate;
- (BOOL)supportsHomeHub;
- (BOOL)supportsHomeInvitation;
- (BOOL)supportsHomeLevelLocationServiceSetting;
- (BOOL)supportsIDSActivityMonitorPresence;
- (BOOL)supportsInstallManagedConfigurationProfile;
- (BOOL)supportsJustSiri;
- (BOOL)supportsKeyTransferClient;
- (BOOL)supportsKeyTransferServer;
- (BOOL)supportsKeychainSync;
- (BOOL)supportsLockNotificationContext;
- (BOOL)supportsLoreto;
- (BOOL)supportsManagedConfigurationProfile;
- (BOOL)supportsMatterOwnerCertFetch;
- (BOOL)supportsMatterSharedAdminPairing;
- (BOOL)supportsMatterTTU;
- (BOOL)supportsMediaActions;
- (BOOL)supportsMessagedHomePodSettings;
- (BOOL)supportsModernTransport;
- (BOOL)supportsMultiUser;
- (BOOL)supportsMusicAlarm;
- (BOOL)supportsNativeMatter;
- (BOOL)supportsNaturalLighting;
- (BOOL)supportsPreferredMediaUser;
- (BOOL)supportsRMVonAppleTV;
- (BOOL)supportsResidentActionSetStateEvaluation;
- (BOOL)supportsResidentFirmwareUpdate;
- (BOOL)supportsResidentFirstAccessoryCommunication;
- (BOOL)supportsResidentSelection;
- (BOOL)supportsRestrictedGuest;
- (BOOL)supportsRouterManagement;
- (BOOL)supportsShortcutActions;
- (BOOL)supportsSiriEndpointSetup;
- (BOOL)supportsSoftwareUpdateV2;
- (BOOL)supportsStandaloneMode;
- (BOOL)supportsTVOSUpdateManualUpdateAvailableNotification;
- (BOOL)supportsTargetControl;
- (BOOL)supportsThirdPartyMusic;
- (BOOL)supportsThreadBorderRouter;
- (BOOL)supportsThreadNetworkCredentialSharing;
- (BOOL)supportsThreadService;
- (BOOL)supportsUWB;
- (BOOL)supportsUWBUnlock;
- (BOOL)supportsUnifiedMediaNotifications;
- (BOOL)supportsUserMediaSettings;
- (BOOL)supportsWakeOnLAN;
- (BOOL)supportsWalletKey;
- (BOOL)supportsWholeHouseAudio;
- (Class)modelClass;
- (HMDDeviceCapabilities)initWithCoder:(id)a3;
- (HMDDeviceCapabilities)initWithObjectModel:(id)a3;
- (HMDDeviceCapabilities)initWithProductInfo:(id)a3;
- (HMDDeviceCapabilities)initWithProductInfo:(id)a3 mobileGestaltClient:(id)a4;
- (HMDDeviceCapabilities)initWithProductInfo:(id)a3 mobileGestaltClient:(id)a4 homekitVersion:(id)a5;
- (NSUUID)modelIdentifier;
- (NSUUID)modelParentIdentifier;
- (id)attributeDescriptions;
- (id)backingStoreObjectsWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)modelBackedObjects;
- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (id)objectModel;
- (id)shortDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMessagedHomePodSettingsFeatureEnabled:(BOOL)a3;
- (void)setModelParentIdentifier:(id)a3;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
@end

@implementation HMDDeviceCapabilities

- (BOOL)supportsKeychainSync
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  v3 = [v2 supportsKeychainSync];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (HMDDeviceCapabilities)deviceCapabilities
{
  if (deviceCapabilities_onceToken != -1) {
    dispatch_once(&deviceCapabilities_onceToken, &__block_literal_global_150778);
  }
  v2 = (void *)deviceCapabilities_deviceCapabilities;
  return (HMDDeviceCapabilities *)v2;
}

- (BOOL)supportsCloudDataSync
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  v3 = [v2 supportsCloudDataSync];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)objectModel
{
  v1 = (id *)a1;
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    v1 = (id *)v1[2];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (BOOL)isResidentCapable
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  v3 = [v2 residentCapable];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsDeviceSetup
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  v3 = [v2 supportsDeviceSetup];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (BOOL)supportsDeviceLock
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  unint64_t v3 = [v2 productClass];

  return (v3 > 0xB) | (0xFAFu >> v3) & 1;
}

- (void).cxx_destruct
{
}

- (void)setMessagedHomePodSettingsFeatureEnabled:(BOOL)a3
{
  self->_messagedHomePodSettingsFeatureEnabled = a3;
}

- (BOOL)supportsInstallManagedConfigurationProfile
{
  return self->_supportsInstallManagedConfigurationProfile;
}

- (BOOL)supportsDropIn
{
  return self->_supportsDropIn;
}

- (BOOL)supportsAudioAnalysis
{
  return self->_supportsAudioAnalysis;
}

- (id)modelBackedObjects
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)backingStoreObjectsWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(HMDDeviceCapabilities *)self modelObjectWithChangeType:a3 version:a4];
  v5 = (void *)v4;
  if (v4)
  {
    v8[0] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  v5 = -[HMDDeviceCapabilities objectModel]((char *)self);
  v6 = (void *)[v5 copy];

  [v6 setObjectChangeType:a3];
  return v6;
}

- (void)setModelParentIdentifier:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    v6 = [(HMDBackingStoreModelObject *)self->_objectModel parentUUID];
    if (v6)
    {
      v19 = (void *)MEMORY[0x1D9452090]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v31 = v22;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Parent identifier is already present for this object", buf, 0xCu);
      }
      v23 = [[HMDAssertionLogEvent alloc] initWithReason:@"Parent identifier is already present for this object"];
      v24 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v24 submitLogEvent:v23];

      v25 = (void *)MEMORY[0x1D9452090]();
      v26 = v20;
      HMFGetOSLogHandle();
      v27 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v31 = v28;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Parent identifier is already present for this object", buf, 0xCu);
      }
    }
    else
    {
      v7 = __identifierForParentUUID(v4);
      v8 = [(HMDBackingStoreModelObject *)[HMDDeviceCapabilitiesModel alloc] initWithUUID:v7 parentUUID:v4];
      objectModel = self->_objectModel;
      id v29 = 0;
      BOOL v10 = [(HMDBackingStoreModelObject *)v8 merge:objectModel error:&v29];
      id v11 = v29;
      if (v10)
      {
        objc_storeStrong((id *)&self->_objectModel, v8);
      }
      else
      {
        v15 = (void *)MEMORY[0x1D9452090]();
        v16 = self;
        HMFGetOSLogHandle();
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v31 = v18;
          __int16 v32 = 2112;
          id v33 = v11;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to update model with error: %@", buf, 0x16u);
        }
      }
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v12 = (void *)MEMORY[0x1D9452090]();
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v31 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Model parent UUID is a required argument", buf, 0xCu);
    }
  }
}

- (NSUUID)modelParentIdentifier
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 parentUUID];

  return (NSUUID *)v3;
}

- (NSUUID)modelIdentifier
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 uuid];

  return (NSUUID *)v3;
}

- (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    id v13 = v12;
    id v32 = v9;
    if (self)
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock_with_options();
      objectModel = self->_objectModel;
      id v34 = 0;
      BOOL v16 = [(HMDBackingStoreModelObject *)objectModel diff:v13 differingFields:&v34];
      id v17 = v34;
      if (v16)
      {
        context = (void *)MEMORY[0x1D9452090]();
        v18 = self;
        HMFGetOSLogHandle();
        v19 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v20;
          _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Updating device capabilities", buf, 0xCu);
        }
        v21 = (HMDDeviceCapabilitiesModel *)[(HMDDeviceCapabilitiesModel *)v18->_objectModel copy];
        id v22 = [(HMDBackingStoreModelObject *)v21 merge:v13];
        v23 = v18->_objectModel;
        v18->_objectModel = v21;

        os_unfair_lock_unlock(p_lock);
        v40[0] = @"HMDDeviceCapabilitiesUpdatedDifferingFieldsNotificationKey";
        *(void *)buf = v17;
        v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v40 count:1];
        logAndPostNotification(@"HMDDeviceCapabilitiiesUpdatedNotification", v18, v24);
      }
      else
      {
        os_unfair_lock_unlock(&self->_lock);
      }
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x1D9452090]();
    v26 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v28;
      __int16 v36 = 2112;
      id v37 = v10;
      __int16 v38 = 2112;
      id v39 = (id)objc_opt_class();
      id v29 = v39;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated:newValues:message:]", buf, 0x20u);
    }
    v30 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [v9 respondWithError:v30];
  }
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = HMFGetLogIdentifier();
    int v14 = 138543874;
    v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = (id)objc_opt_class();
    id v12 = v19;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved:message:]", (uint8_t *)&v14, 0x20u);
  }
  id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
  [v7 respondWithError:v13];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[HMDDeviceCapabilities objectModel]((char *)self);
  id v6 = [v5 uuid];
  [v4 encodeObject:v6 forKey:@"HM.deviceCapabilities.identifier"];

  -[HMDDeviceCapabilities objectModel]((char *)self);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v4;
  id v9 = __HMDDeviceCapabilitiesModelCodingKeyMapping();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = ____HMDDeviceCapabilitiesModelEncodeWithCoder_block_invoke;
  v12[3] = &unk_1E6A13838;
  id v13 = v7;
  id v14 = v8;
  id v10 = v7;
  id v11 = v8;
  [v9 enumerateKeysAndObjectsUsingBlock:v12];
}

- (HMDDeviceCapabilities)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.deviceCapabilities.identifier"];
  if (!v5)
  {
    v5 = [MEMORY[0x1E4F29128] UUID];
  }
  id v6 = [(HMDBackingStoreModelObject *)[HMDDeviceCapabilitiesModel alloc] initWithUUID:v5];
  id v7 = v4;
  id v8 = __HMDDeviceCapabilitiesModelCodingKeyMapping();
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = ____HMDDeviceCapabilitiesModelDecodeWithCoder_block_invoke;
  __int16 v16 = &unk_1E6A13838;
  id v17 = v7;
  __int16 v18 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateKeysAndObjectsUsingBlock:&v13];

  id v11 = -[HMDDeviceCapabilities initWithObjectModel:](self, "initWithObjectModel:", v10, v13, v14, v15, v16);
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = -[HMDDeviceCapabilities objectModel]((char *)self);
  id v7 = (void *)[v6 copyWithZone:a3];
  id v8 = (void *)[v5 initWithObjectModel:v7];

  return v8;
}

- (BOOL)supportsUWBUnlock
{
  return 0;
}

- (BOOL)supportsResidentSelection
{
  return 0;
}

- (BOOL)supportsLoreto
{
  return 0;
}

- (BOOL)supportsTVOSUpdateManualUpdateAvailableNotification
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsTVOSUpdateManualUpdateAvailableNotification];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsCoordinationFreeDoorbellChime
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsCoordinationFreeDoorbellChime];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsNativeMatter
{
  return 0;
}

- (BOOL)supportsMatterOwnerCertFetch
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsMatterOwnerCertFetch];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsSoftwareUpdateV2
{
  return 0;
}

- (BOOL)supportsRestrictedGuest
{
  return 0;
}

- (BOOL)supportsDistributedExecutionOnAppleMediaAccessories
{
  return 0;
}

- (BOOL)supportsDistributedExecutionOnPrimary
{
  return 0;
}

- (BOOL)supportsResidentActionSetStateEvaluation
{
  return 0;
}

- (BOOL)supportsMatterTTU
{
  return 0;
}

- (BOOL)supportsUWB
{
  return 0;
}

- (BOOL)supportsEventLog
{
  return 0;
}

- (BOOL)supportsThreadService
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsThreadService];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsJustSiri
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsJustSiri];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsRMVonAppleTV
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsRMVonAppleTV];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsCustomMediaApplicationDestination
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsCustomMediaApplicationDestination];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isMessagedHomePodSettingsFeatureEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)supportsMessagedHomePodSettings
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsMessagedHomePodSettings];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsResidentFirstAccessoryCommunication
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsResidentFirstAccessoryCommunication];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsModernTransport
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsModernTransport];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsCaptiveNetworks
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsCaptiveNetworks];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsUnifiedMediaNotifications
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsUnifiedMediaNotifications];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsCHIP
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsCHIP];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsCameraPackageDetection
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsCameraPackageDetection];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsLockNotificationContext
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsLockNotificationContext];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsMatterSharedAdminPairing
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsMatterSharedAdminPairing];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsThreadNetworkCredentialSharing
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsThreadNetworkCredentialSharing];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsWakeOnLAN
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsWakeOnLAN];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsThreadBorderRouter
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsThreadBorderRouter];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsPreferredMediaUser
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsPreferredMediaUser];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsThirdPartyMusic
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsThirdPartyMusic];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsHomeHub
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsHomeHub];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsSiriEndpointSetup
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsSiriEndpointSetup];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsUserMediaSettings
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsUserMediaSettings];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsDoorbellChime
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsDoorbellChime];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsAnnounce
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsAnnounce];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsCameraRecordingReachabilityNotifications
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsCameraRecordingReachabilityNotifications];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsIDSActivityMonitorPresence
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsIDSActivityMonitorPresence];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsAccessCodes
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsAccessCodes];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsWalletKey
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsWalletKey];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsNaturalLighting
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsNaturalLighting];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsManagedConfigurationProfile
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsManagedConfigurationProfile];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsFaceClassification
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsFaceClassification];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsCoordinationDoorbellChime
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsCoordinationDoorbellChime];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsMusicAlarm
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsMusicAlarm];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsCameraActivityZones
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsCameraActivityZones];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsResidentFirmwareUpdate
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsResidentFirmwareUpdate];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsFirmwareUpdate
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsFirmwareUpdate];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsCameraSignificantEventNotifications
{
  return 0;
}

- (BOOL)supportsMediaActions
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsMediaActions];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsShortcutActions
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsShortcutActions];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsRouterManagement
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsRouterManagement];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsCameraRecording
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsCameraRecording];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsCompanionInitiatedObliterate
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsCompanionInitiatedObliterate];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsCompanionInitiatedRestart
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsCompanionInitiatedRestart];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsAudioReturnChannel
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsAudioReturnChannel];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsHomeLevelLocationServiceSetting
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsHomeLevelLocationServiceSetting];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsMultiUser
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsMultiUser];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsTargetControl
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsTargetControl];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsHomeInvitation
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsHomeInvitation];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isRemoteGatewayCapable
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 remoteGatewayCapable];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsAssistantAccessControl
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsAssistantAccessControl];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsWholeHouseAudio
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsWholeHouseAudio];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsStandaloneMode
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsStandaloneMode];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsKeyTransferServer
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsKeyTransferServer];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)supportsKeyTransferClient
{
  v2 = -[HMDDeviceCapabilities objectModel]((char *)self);
  unint64_t v3 = [v2 supportsKeyTransferClient];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)attributeDescriptions
{
  v161[52] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsKeychainSync];
  v160 = HMFBooleanToString();
  v159 = (void *)[v3 initWithName:@"Keychain Sync" value:v160];
  v161[0] = v159;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsDeviceSetup];
  v158 = HMFBooleanToString();
  v157 = (void *)[v4 initWithName:@"Device Setup" value:v158];
  v161[1] = v157;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsKeyTransferClient];
  v156 = HMFBooleanToString();
  v155 = (void *)[v5 initWithName:@"Key Transfer Client" value:v156];
  v161[2] = v155;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsKeyTransferServer];
  v154 = HMFBooleanToString();
  v153 = (void *)[v6 initWithName:@"Key Transfer Server" value:v154];
  v161[3] = v153;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsStandaloneMode];
  v152 = HMFBooleanToString();
  v151 = (void *)[v7 initWithName:@"Standalone Mode" value:v152];
  v161[4] = v151;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsCloudDataSync];
  v150 = HMFBooleanToString();
  v149 = (void *)[v8 initWithName:@"Cloud Data Sync" value:v150];
  v161[5] = v149;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsWholeHouseAudio];
  v148 = HMFBooleanToString();
  v147 = (void *)[v9 initWithName:@"Whole House Audio" value:v148];
  v161[6] = v147;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsAssistantAccessControl];
  v146 = HMFBooleanToString();
  v145 = (void *)[v10 initWithName:@"Assistant Access Control" value:v146];
  v161[7] = v145;
  id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self isResidentCapable];
  v144 = HMFBooleanToString();
  v143 = (void *)[v11 initWithName:@"Resident" value:v144];
  v161[8] = v143;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self isRemoteGatewayCapable];
  v142 = HMFBooleanToString();
  v141 = (void *)[v12 initWithName:@"Remote Gateway" value:v142];
  v161[9] = v141;
  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsTargetControl];
  v140 = HMFBooleanToString();
  v139 = (void *)[v13 initWithName:@"Target Control" value:v140];
  v161[10] = v139;
  id v14 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsMultiUser];
  v138 = HMFBooleanToString();
  v137 = (void *)[v14 initWithName:@"Multi-User" value:v138];
  v161[11] = v137;
  id v15 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsHomeLevelLocationServiceSetting];
  v136 = HMFBooleanToString();
  v135 = (void *)[v15 initWithName:@"Home Level Location Services" value:v136];
  v161[12] = v135;
  id v16 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsCompanionInitiatedRestart];
  v134 = HMFBooleanToString();
  v133 = (void *)[v16 initWithName:@"Restart" value:v134];
  v161[13] = v133;
  id v17 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsCompanionInitiatedObliterate];
  v132 = HMFBooleanToString();
  v131 = (void *)[v17 initWithName:@"Factory Reset" value:v132];
  v161[14] = v131;
  id v18 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsHomeInvitation];
  v130 = HMFBooleanToString();
  v129 = (void *)[v18 initWithName:@"Home Invitation" value:v130];
  v161[15] = v129;
  id v19 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsCameraRecording];
  v128 = HMFBooleanToString();
  v127 = (void *)[v19 initWithName:@"Camera Recording" value:v128];
  v161[16] = v127;
  id v20 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsRouterManagement];
  v126 = HMFBooleanToString();
  v125 = (void *)[v20 initWithName:@"Router Management" value:v126];
  v161[17] = v125;
  id v21 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsShortcutActions];
  v124 = HMFBooleanToString();
  v123 = (void *)[v21 initWithName:@"Shortcut Actions" value:v124];
  v161[18] = v123;
  id v22 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsMediaActions];
  v122 = HMFBooleanToString();
  v121 = (void *)[v22 initWithName:@"Media Actions" value:v122];
  v161[19] = v121;
  id v23 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsFirmwareUpdate];
  v120 = HMFBooleanToString();
  v119 = (void *)[v23 initWithName:@"Firmware Update" value:v120];
  v161[20] = v119;
  id v24 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsResidentFirmwareUpdate];
  v118 = HMFBooleanToString();
  v117 = (void *)[v24 initWithName:@"Resident Firmware Update" value:v118];
  v161[21] = v117;
  id v25 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsCameraActivityZones];
  v116 = HMFBooleanToString();
  v115 = (void *)[v25 initWithName:@"Camera Activity Zones" value:v116];
  v161[22] = v115;
  id v26 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsMusicAlarm];
  v114 = HMFBooleanToString();
  v113 = (void *)[v26 initWithName:@"Music Alarms" value:v114];
  v161[23] = v113;
  id v27 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsFaceClassification];
  v112 = HMFBooleanToString();
  v111 = (void *)[v27 initWithName:@"Face Classification" value:v112];
  v161[24] = v111;
  id v28 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsNaturalLighting];
  v110 = HMFBooleanToString();
  v109 = (void *)[v28 initWithName:@"Natural Lighting" value:v110];
  v161[25] = v109;
  id v29 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsIDSActivityMonitorPresence];
  v108 = HMFBooleanToString();
  v107 = (void *)[v29 initWithName:@"IDS Activity Monitor (Presence)" value:v108];
  v161[26] = v107;
  id v30 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsCameraRecordingReachabilityNotifications];
  v106 = HMFBooleanToString();
  v105 = (void *)[v30 initWithName:@"Camera Recording Reachability Notifications" value:v106];
  v161[27] = v105;
  id v31 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsAnnounce];
  v104 = HMFBooleanToString();
  v103 = (void *)[v31 initWithName:@"Announce" value:v104];
  v161[28] = v103;
  id v32 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsThirdPartyMusic];
  v102 = HMFBooleanToString();
  v101 = (void *)[v32 initWithName:@"ThirdPartyMusic" value:v102];
  v161[29] = v101;
  id v33 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsPreferredMediaUser];
  v100 = HMFBooleanToString();
  v99 = (void *)[v33 initWithName:@"PreferredMediaUser" value:v100];
  v161[30] = v99;
  id v34 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsThreadBorderRouter];
  v98 = HMFBooleanToString();
  v97 = (void *)[v34 initWithName:@"Thread Border Router" value:v98];
  v161[31] = v97;
  id v35 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsSiriEndpointSetup];
  v96 = HMFBooleanToString();
  v95 = (void *)[v35 initWithName:@"Siri Endpoint Setup" value:v96];
  v161[32] = v95;
  id v36 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsHomeHub];
  v94 = HMFBooleanToString();
  v93 = (void *)[v36 initWithName:@"Home Hub" value:v94];
  v161[33] = v93;
  id v37 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsWakeOnLAN];
  v92 = HMFBooleanToString();
  v91 = (void *)[v37 initWithName:@"LPM Wake On LAN" value:v92];
  v161[34] = v91;
  id v38 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsLockNotificationContext];
  v90 = HMFBooleanToString();
  v89 = (void *)[v38 initWithName:@"Lock Notification Context" value:v90];
  v161[35] = v89;
  id v39 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsAudioReturnChannel];
  v88 = HMFBooleanToString();
  v87 = (void *)[v39 initWithName:@"Audio Return Channel" value:v88];
  v161[36] = v87;
  id v40 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsWalletKey];
  v86 = HMFBooleanToString();
  v85 = (void *)[v40 initWithName:@"Wallet Key" value:v86];
  v161[37] = v85;
  id v41 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsCameraPackageDetection];
  v84 = HMFBooleanToString();
  v83 = (void *)[v41 initWithName:@"Camera Package Detection" value:v84];
  v161[38] = v83;
  id v42 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsAccessCodes];
  v82 = HMFBooleanToString();
  v81 = (void *)[v42 initWithName:@"Access Codes" value:v82];
  v161[39] = v81;
  id v43 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsCHIP];
  v80 = HMFBooleanToString();
  v79 = (void *)[v43 initWithName:@"CHIP" value:v80];
  v161[40] = v79;
  id v44 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsUnifiedMediaNotifications];
  v78 = HMFBooleanToString();
  v77 = (void *)[v44 initWithName:@"Unified Media Notifications" value:v78];
  v161[41] = v77;
  id v45 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsCaptiveNetworks];
  v76 = HMFBooleanToString();
  v75 = (void *)[v45 initWithName:@"Captive Networks" value:v76];
  v161[42] = v75;
  id v46 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsModernTransport];
  v74 = HMFBooleanToString();
  v73 = (void *)[v46 initWithName:@"Modern Transport" value:v74];
  v161[43] = v73;
  id v47 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsResidentFirstAccessoryCommunication];
  v72 = HMFBooleanToString();
  v71 = (void *)[v47 initWithName:@"Resident First Accessory Communication" value:v72];
  v161[44] = v71;
  id v48 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsCustomMediaApplicationDestination];
  v70 = HMFBooleanToString();
  v69 = (void *)[v48 initWithName:@"Custom Destination Media Action" value:v70];
  v161[45] = v69;
  id v49 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsThreadNetworkCredentialSharing];
  v68 = HMFBooleanToString();
  v67 = (void *)[v49 initWithName:@"Thread Network Credential Sharing" value:v68];
  v161[46] = v67;
  id v50 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsMatterSharedAdminPairing];
  v66 = HMFBooleanToString();
  v51 = (void *)[v50 initWithName:@"Matter Shared Admin Pairing" value:v66];
  v161[47] = v51;
  id v52 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsRMVonAppleTV];
  v53 = HMFBooleanToString();
  v54 = (void *)[v52 initWithName:@"RMV on AppleTV" value:v53];
  v161[48] = v54;
  id v55 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsJustSiri];
  v56 = HMFBooleanToString();
  v57 = (void *)[v55 initWithName:@"Just Siri" value:v56];
  v161[49] = v57;
  id v58 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsThreadService];
  v59 = HMFBooleanToString();
  v60 = (void *)[v58 initWithName:@"Thread Service" value:v59];
  v161[50] = v60;
  id v61 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDDeviceCapabilities *)self supportsMatterOwnerCertFetch];
  v62 = HMFBooleanToString();
  v63 = (void *)[v61 initWithName:@"Matter Owner Cert Fetch" value:v62];
  v161[51] = v63;
  v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v161 count:52];

  return v64;
}

- (id)shortDescription
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(HMDDeviceCapabilities *)self supportsKeychainSync]) {
    [v3 addObject:@"KCS"];
  }
  if ([(HMDDeviceCapabilities *)self supportsDeviceSetup]) {
    [v3 addObject:@"DS"];
  }
  if ([(HMDDeviceCapabilities *)self supportsKeyTransferClient]) {
    [v3 addObject:@"KTC"];
  }
  if ([(HMDDeviceCapabilities *)self supportsKeyTransferServer]) {
    [v3 addObject:@"KTS"];
  }
  if ([(HMDDeviceCapabilities *)self supportsStandaloneMode]) {
    [v3 addObject:@"SAM"];
  }
  if ([(HMDDeviceCapabilities *)self supportsCloudDataSync]) {
    [v3 addObject:@"CS"];
  }
  if ([(HMDDeviceCapabilities *)self supportsWholeHouseAudio]) {
    [v3 addObject:@"WHA"];
  }
  if ([(HMDDeviceCapabilities *)self supportsAssistantAccessControl]) {
    [v3 addObject:@"AAC"];
  }
  if ([(HMDDeviceCapabilities *)self isResidentCapable]) {
    [v3 addObject:@"RC"];
  }
  if ([(HMDDeviceCapabilities *)self isRemoteGatewayCapable]) {
    [v3 addObject:@"RGC"];
  }
  if ([(HMDDeviceCapabilities *)self supportsHomeInvitation]) {
    [v3 addObject:@"HI"];
  }
  if ([(HMDDeviceCapabilities *)self supportsTargetControl]) {
    [v3 addObject:@"TC"];
  }
  if ([(HMDDeviceCapabilities *)self supportsMultiUser]) {
    [v3 addObject:@"MU"];
  }
  if ([(HMDDeviceCapabilities *)self supportsHomeLevelLocationServiceSetting]) {
    [v3 addObject:@"HLLS"];
  }
  if ([(HMDDeviceCapabilities *)self supportsCompanionInitiatedRestart]) {
    [v3 addObject:@"CIR"];
  }
  if ([(HMDDeviceCapabilities *)self supportsCompanionInitiatedObliterate]) {
    [v3 addObject:@"CIFR"];
  }
  if ([(HMDDeviceCapabilities *)self supportsCameraRecording]) {
    [v3 addObject:@"CR"];
  }
  if ([(HMDDeviceCapabilities *)self supportsRouterManagement]) {
    [v3 addObject:@"RM"];
  }
  if ([(HMDDeviceCapabilities *)self supportsShortcutActions]) {
    [v3 addObject:@"SA"];
  }
  if ([(HMDDeviceCapabilities *)self supportsMediaActions]) {
    [v3 addObject:@"MAS"];
  }
  if ([(HMDDeviceCapabilities *)self supportsMusicAlarm]) {
    [v3 addObject:@"MA"];
  }
  if ([(HMDDeviceCapabilities *)self supportsFirmwareUpdate]) {
    [v3 addObject:@"AFU"];
  }
  if ([(HMDDeviceCapabilities *)self supportsResidentFirmwareUpdate]) {
    [v3 addObject:@"RAFU"];
  }
  if ([(HMDDeviceCapabilities *)self supportsCameraActivityZones]) {
    [v3 addObject:@"CAZ"];
  }
  if ([(HMDDeviceCapabilities *)self supportsFaceClassification]) {
    [v3 addObject:@"FC"];
  }
  if ([(HMDDeviceCapabilities *)self supportsNaturalLighting]) {
    [v3 addObject:@"NL"];
  }
  if ([(HMDDeviceCapabilities *)self supportsIDSActivityMonitorPresence]) {
    [v3 addObject:@"IAMP"];
  }
  if ([(HMDDeviceCapabilities *)self supportsCameraRecordingReachabilityNotifications])
  {
    [v3 addObject:@"CRRN"];
  }
  if ([(HMDDeviceCapabilities *)self supportsAnnounce]) {
    [v3 addObject:@"AN"];
  }
  if ([(HMDDeviceCapabilities *)self supportsThirdPartyMusic]) {
    [v3 addObject:@"BLT"];
  }
  if ([(HMDDeviceCapabilities *)self supportsPreferredMediaUser]) {
    [v3 addObject:@"PMU"];
  }
  if ([(HMDDeviceCapabilities *)self supportsThreadBorderRouter]) {
    [v3 addObject:@"TDR"];
  }
  if ([(HMDDeviceCapabilities *)self supportsSiriEndpointSetup]) {
    [v3 addObject:@"SES"];
  }
  if ([(HMDDeviceCapabilities *)self supportsHomeHub]) {
    [v3 addObject:@"HH"];
  }
  if ([(HMDDeviceCapabilities *)self supportsWakeOnLAN]) {
    [v3 addObject:@"WOL"];
  }
  if ([(HMDDeviceCapabilities *)self supportsLockNotificationContext]) {
    [v3 addObject:@"LNC"];
  }
  if ([(HMDDeviceCapabilities *)self supportsCoordinationDoorbellChime]) {
    [v3 addObject:@"CDC"];
  }
  if ([(HMDDeviceCapabilities *)self supportsCoordinationFreeDoorbellChime]) {
    [v3 addObject:@"CFDC"];
  }
  if ([(HMDDeviceCapabilities *)self supportsTVOSUpdateManualUpdateAvailableNotification])
  {
    [v3 addObject:@"TVMUN"];
  }
  if ([(HMDDeviceCapabilities *)self supportsAudioReturnChannel]) {
    [v3 addObject:@"ARC"];
  }
  if ([(HMDDeviceCapabilities *)self supportsWalletKey]) {
    [v3 addObject:@"WK"];
  }
  if ([(HMDDeviceCapabilities *)self supportsAccessCodes]) {
    [v3 addObject:@"AC"];
  }
  if ([(HMDDeviceCapabilities *)self supportsCameraPackageDetection]) {
    [v3 addObject:@"CPD"];
  }
  if ([(HMDDeviceCapabilities *)self supportsCHIP]) {
    [v3 addObject:@"CHIP"];
  }
  if ([(HMDDeviceCapabilities *)self supportsUnifiedMediaNotifications]) {
    [v3 addObject:@"UMN"];
  }
  if ([(HMDDeviceCapabilities *)self supportsManagedConfigurationProfile]) {
    [v3 addObject:@"MCP"];
  }
  if ([(HMDDeviceCapabilities *)self supportsUserMediaSettings]) {
    [v3 addObject:@"UMS"];
  }
  if ([(HMDDeviceCapabilities *)self supportsCaptiveNetworks]) {
    [v3 addObject:@"CN"];
  }
  if ([(HMDDeviceCapabilities *)self supportsModernTransport]) {
    [v3 addObject:@"MT"];
  }
  if ([(HMDDeviceCapabilities *)self supportsResidentFirstAccessoryCommunication])
  {
    [v3 addObject:@"RFAC"];
  }
  if ([(HMDDeviceCapabilities *)self supportsMessagedHomePodSettings]) {
    [v3 addObject:@"MHPS"];
  }
  if ([(HMDDeviceCapabilities *)self supportsCustomMediaApplicationDestination])
  {
    [v3 addObject:@"CMDA"];
  }
  if ([(HMDDeviceCapabilities *)self supportsThreadNetworkCredentialSharing]) {
    [v3 addObject:@"TNCS"];
  }
  if ([(HMDDeviceCapabilities *)self supportsMatterSharedAdminPairing]) {
    [v3 addObject:@"MSAP"];
  }
  if ([(HMDDeviceCapabilities *)self supportsRMVonAppleTV]) {
    [v3 addObject:@"TVRMV"];
  }
  if ([(HMDDeviceCapabilities *)self supportsJustSiri]) {
    [v3 addObject:@"HSJS"];
  }
  if ([(HMDDeviceCapabilities *)self supportsThreadService]) {
    [v3 addObject:@"THRDS"];
  }
  if ([(HMDDeviceCapabilities *)self supportsMatterOwnerCertFetch]) {
    [v3 addObject:@"MOCF"];
  }
  id v4 = [v3 componentsJoinedByString:@","];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDDeviceCapabilities *)a3;
  if (v4 == self)
  {
    LOBYTE(v63) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;
    if (!v6) {
      goto LABEL_62;
    }
    BOOL v7 = [(HMDDeviceCapabilities *)self supportsKeychainSync];
    if (v7 != [(HMDDeviceCapabilities *)v6 supportsKeychainSync]) {
      goto LABEL_62;
    }
    BOOL v8 = [(HMDDeviceCapabilities *)self supportsDeviceSetup];
    if (v8 != [(HMDDeviceCapabilities *)v6 supportsDeviceSetup]) {
      goto LABEL_62;
    }
    BOOL v9 = [(HMDDeviceCapabilities *)self supportsKeyTransferClient];
    if (v9 != [(HMDDeviceCapabilities *)v6 supportsKeyTransferClient]) {
      goto LABEL_62;
    }
    BOOL v10 = [(HMDDeviceCapabilities *)self supportsKeyTransferServer];
    if (v10 != [(HMDDeviceCapabilities *)v6 supportsKeyTransferServer]) {
      goto LABEL_62;
    }
    BOOL v11 = [(HMDDeviceCapabilities *)self supportsStandaloneMode];
    if (v11 != [(HMDDeviceCapabilities *)v6 supportsStandaloneMode]) {
      goto LABEL_62;
    }
    BOOL v12 = [(HMDDeviceCapabilities *)self supportsCloudDataSync];
    if (v12 != [(HMDDeviceCapabilities *)v6 supportsCloudDataSync]) {
      goto LABEL_62;
    }
    BOOL v13 = [(HMDDeviceCapabilities *)self supportsWholeHouseAudio];
    if (v13 != [(HMDDeviceCapabilities *)v6 supportsWholeHouseAudio]) {
      goto LABEL_62;
    }
    BOOL v14 = [(HMDDeviceCapabilities *)self supportsAssistantAccessControl];
    if (v14 != [(HMDDeviceCapabilities *)v6 supportsAssistantAccessControl]) {
      goto LABEL_62;
    }
    BOOL v15 = [(HMDDeviceCapabilities *)self isResidentCapable];
    if (v15 != [(HMDDeviceCapabilities *)v6 isResidentCapable]) {
      goto LABEL_62;
    }
    BOOL v16 = [(HMDDeviceCapabilities *)self isRemoteGatewayCapable];
    if (v16 != [(HMDDeviceCapabilities *)v6 isRemoteGatewayCapable]) {
      goto LABEL_62;
    }
    BOOL v17 = [(HMDDeviceCapabilities *)self supportsHomeInvitation];
    if (v17 != [(HMDDeviceCapabilities *)v6 supportsHomeInvitation]) {
      goto LABEL_62;
    }
    BOOL v18 = [(HMDDeviceCapabilities *)self supportsTargetControl];
    if (v18 != [(HMDDeviceCapabilities *)v6 supportsTargetControl]) {
      goto LABEL_62;
    }
    BOOL v19 = [(HMDDeviceCapabilities *)self supportsMultiUser];
    if (v19 != [(HMDDeviceCapabilities *)v6 supportsMultiUser]) {
      goto LABEL_62;
    }
    BOOL v20 = [(HMDDeviceCapabilities *)self supportsHomeLevelLocationServiceSetting];
    if (v20 != [(HMDDeviceCapabilities *)v6 supportsHomeLevelLocationServiceSetting])goto LABEL_62; {
    BOOL v21 = [(HMDDeviceCapabilities *)self supportsCompanionInitiatedRestart];
    }
    if (v21 != [(HMDDeviceCapabilities *)v6 supportsCompanionInitiatedRestart]) {
      goto LABEL_62;
    }
    BOOL v22 = [(HMDDeviceCapabilities *)self supportsCompanionInitiatedObliterate];
    if (v22 != [(HMDDeviceCapabilities *)v6 supportsCompanionInitiatedObliterate])goto LABEL_62; {
    BOOL v23 = [(HMDDeviceCapabilities *)self supportsCameraRecording];
    }
    if (v23 != [(HMDDeviceCapabilities *)v6 supportsCameraRecording]) {
      goto LABEL_62;
    }
    BOOL v24 = [(HMDDeviceCapabilities *)self supportsRouterManagement];
    if (v24 != [(HMDDeviceCapabilities *)v6 supportsRouterManagement]) {
      goto LABEL_62;
    }
    BOOL v25 = [(HMDDeviceCapabilities *)self supportsShortcutActions];
    if (v25 != [(HMDDeviceCapabilities *)v6 supportsShortcutActions]) {
      goto LABEL_62;
    }
    BOOL v26 = [(HMDDeviceCapabilities *)self supportsMediaActions];
    if (v26 != [(HMDDeviceCapabilities *)v6 supportsMediaActions]) {
      goto LABEL_62;
    }
    BOOL v27 = [(HMDDeviceCapabilities *)self supportsMusicAlarm];
    if (v27 != [(HMDDeviceCapabilities *)v6 supportsMusicAlarm]) {
      goto LABEL_62;
    }
    BOOL v28 = [(HMDDeviceCapabilities *)self supportsFirmwareUpdate];
    if (v28 != [(HMDDeviceCapabilities *)v6 supportsFirmwareUpdate]) {
      goto LABEL_62;
    }
    BOOL v29 = [(HMDDeviceCapabilities *)self supportsResidentFirmwareUpdate];
    if (v29 != [(HMDDeviceCapabilities *)v6 supportsResidentFirmwareUpdate]) {
      goto LABEL_62;
    }
    BOOL v30 = [(HMDDeviceCapabilities *)self supportsCameraActivityZones];
    if (v30 != [(HMDDeviceCapabilities *)v6 supportsCameraActivityZones]) {
      goto LABEL_62;
    }
    BOOL v31 = [(HMDDeviceCapabilities *)self supportsFaceClassification];
    if (v31 != [(HMDDeviceCapabilities *)v6 supportsFaceClassification]) {
      goto LABEL_62;
    }
    BOOL v32 = [(HMDDeviceCapabilities *)self supportsNaturalLighting];
    if (v32 != [(HMDDeviceCapabilities *)v6 supportsNaturalLighting]) {
      goto LABEL_62;
    }
    BOOL v33 = [(HMDDeviceCapabilities *)self supportsIDSActivityMonitorPresence];
    if (v33 != [(HMDDeviceCapabilities *)v6 supportsIDSActivityMonitorPresence]) {
      goto LABEL_62;
    }
    BOOL v34 = [(HMDDeviceCapabilities *)self supportsCameraRecordingReachabilityNotifications];
    if (v34 != [(HMDDeviceCapabilities *)v6 supportsCameraRecordingReachabilityNotifications])goto LABEL_62; {
    BOOL v35 = [(HMDDeviceCapabilities *)self supportsAnnounce];
    }
    if (v35 != [(HMDDeviceCapabilities *)v6 supportsAnnounce]) {
      goto LABEL_62;
    }
    BOOL v36 = [(HMDDeviceCapabilities *)self supportsThirdPartyMusic];
    if (v36 != [(HMDDeviceCapabilities *)v6 supportsThirdPartyMusic]) {
      goto LABEL_62;
    }
    BOOL v37 = [(HMDDeviceCapabilities *)self supportsPreferredMediaUser];
    if (v37 != [(HMDDeviceCapabilities *)v6 supportsPreferredMediaUser]) {
      goto LABEL_62;
    }
    BOOL v38 = [(HMDDeviceCapabilities *)self supportsThreadBorderRouter];
    if (v38 != [(HMDDeviceCapabilities *)v6 supportsThreadBorderRouter]) {
      goto LABEL_62;
    }
    BOOL v39 = [(HMDDeviceCapabilities *)self supportsSiriEndpointSetup];
    if (v39 != [(HMDDeviceCapabilities *)v6 supportsSiriEndpointSetup]) {
      goto LABEL_62;
    }
    BOOL v40 = [(HMDDeviceCapabilities *)self supportsHomeHub];
    if (v40 != [(HMDDeviceCapabilities *)v6 supportsHomeHub]) {
      goto LABEL_62;
    }
    BOOL v41 = [(HMDDeviceCapabilities *)self supportsWakeOnLAN];
    if (v41 != [(HMDDeviceCapabilities *)v6 supportsWakeOnLAN]) {
      goto LABEL_62;
    }
    BOOL v42 = [(HMDDeviceCapabilities *)self supportsLockNotificationContext];
    if (v42 != [(HMDDeviceCapabilities *)v6 supportsLockNotificationContext]) {
      goto LABEL_62;
    }
    BOOL v43 = [(HMDDeviceCapabilities *)self supportsCoordinationDoorbellChime];
    if (v43 != [(HMDDeviceCapabilities *)v6 supportsCoordinationDoorbellChime]) {
      goto LABEL_62;
    }
    BOOL v44 = [(HMDDeviceCapabilities *)self supportsCoordinationFreeDoorbellChime];
    if (v44 != [(HMDDeviceCapabilities *)v6 supportsCoordinationFreeDoorbellChime])goto LABEL_62; {
    BOOL v45 = [(HMDDeviceCapabilities *)self supportsTVOSUpdateManualUpdateAvailableNotification];
    }
    if (v45 != [(HMDDeviceCapabilities *)v6 supportsTVOSUpdateManualUpdateAvailableNotification])goto LABEL_62; {
    BOOL v46 = [(HMDDeviceCapabilities *)self supportsManagedConfigurationProfile];
    }
    if (v46 != [(HMDDeviceCapabilities *)v6 supportsManagedConfigurationProfile]) {
      goto LABEL_62;
    }
    BOOL v47 = [(HMDDeviceCapabilities *)self supportsAudioReturnChannel];
    if (v47 != [(HMDDeviceCapabilities *)v6 supportsAudioReturnChannel]) {
      goto LABEL_62;
    }
    BOOL v48 = [(HMDDeviceCapabilities *)self supportsWalletKey];
    if (v48 != [(HMDDeviceCapabilities *)v6 supportsWalletKey]) {
      goto LABEL_62;
    }
    BOOL v49 = [(HMDDeviceCapabilities *)self supportsCameraPackageDetection];
    if (v49 != [(HMDDeviceCapabilities *)v6 supportsCameraPackageDetection]) {
      goto LABEL_62;
    }
    BOOL v50 = [(HMDDeviceCapabilities *)self supportsAccessCodes];
    if (v50 != [(HMDDeviceCapabilities *)v6 supportsAccessCodes]) {
      goto LABEL_62;
    }
    BOOL v51 = [(HMDDeviceCapabilities *)self supportsCHIP];
    if (v51 != [(HMDDeviceCapabilities *)v6 supportsCHIP]) {
      goto LABEL_62;
    }
    BOOL v52 = [(HMDDeviceCapabilities *)self supportsUnifiedMediaNotifications];
    if (v52 != [(HMDDeviceCapabilities *)v6 supportsUnifiedMediaNotifications]) {
      goto LABEL_62;
    }
    BOOL v53 = [(HMDDeviceCapabilities *)self supportsCaptiveNetworks];
    if (v53 != [(HMDDeviceCapabilities *)v6 supportsCaptiveNetworks]) {
      goto LABEL_62;
    }
    BOOL v54 = [(HMDDeviceCapabilities *)self supportsModernTransport];
    if (v54 != [(HMDDeviceCapabilities *)v6 supportsModernTransport]) {
      goto LABEL_62;
    }
    BOOL v55 = [(HMDDeviceCapabilities *)self supportsResidentFirstAccessoryCommunication];
    if (v55 != [(HMDDeviceCapabilities *)v6 supportsResidentFirstAccessoryCommunication])goto LABEL_62; {
    BOOL v56 = [(HMDDeviceCapabilities *)self supportsMessagedHomePodSettings];
    }
    if (v56 == [(HMDDeviceCapabilities *)v6 supportsMessagedHomePodSettings]
      && (v57 = [(HMDDeviceCapabilities *)self supportsCustomMediaApplicationDestination], v57 == [(HMDDeviceCapabilities *)v6 supportsCustomMediaApplicationDestination])&& (BOOL v58 = [(HMDDeviceCapabilities *)self supportsThreadNetworkCredentialSharing], v58 == [(HMDDeviceCapabilities *)v6 supportsThreadNetworkCredentialSharing])&& (v59 = [(HMDDeviceCapabilities *)self supportsMatterSharedAdminPairing], v59 == [(HMDDeviceCapabilities *)v6 supportsMatterSharedAdminPairing])&& (v60 = [(HMDDeviceCapabilities *)self supportsRMVonAppleTV], v60 == [(HMDDeviceCapabilities *)v6 supportsRMVonAppleTV])&& (v61 = [(HMDDeviceCapabilities *)self supportsJustSiri], v61 == [(HMDDeviceCapabilities *)v6 supportsJustSiri])&& (v62 = [(HMDDeviceCapabilities *)self supportsThreadService], v62 == [(HMDDeviceCapabilities *)v6 supportsThreadService]))
    {
      BOOL v65 = [(HMDDeviceCapabilities *)self supportsMatterOwnerCertFetch];
      BOOL v63 = v65 ^ [(HMDDeviceCapabilities *)v6 supportsMatterOwnerCertFetch] ^ 1;
    }
    else
    {
LABEL_62:
      LOBYTE(v63) = 0;
    }
  }
  return v63;
}

- (unint64_t)hash
{
  [(HMDDeviceCapabilities *)self supportsKeychainSync];
  [(HMDDeviceCapabilities *)self supportsDeviceSetup];
  [(HMDDeviceCapabilities *)self supportsKeyTransferClient];
  [(HMDDeviceCapabilities *)self supportsKeyTransferServer];
  [(HMDDeviceCapabilities *)self supportsStandaloneMode];
  [(HMDDeviceCapabilities *)self supportsCloudDataSync];
  [(HMDDeviceCapabilities *)self supportsWholeHouseAudio];
  [(HMDDeviceCapabilities *)self supportsAssistantAccessControl];
  [(HMDDeviceCapabilities *)self isResidentCapable];
  [(HMDDeviceCapabilities *)self isRemoteGatewayCapable];
  [(HMDDeviceCapabilities *)self supportsHomeInvitation];
  [(HMDDeviceCapabilities *)self supportsTargetControl];
  [(HMDDeviceCapabilities *)self supportsMultiUser];
  [(HMDDeviceCapabilities *)self supportsHomeLevelLocationServiceSetting];
  [(HMDDeviceCapabilities *)self supportsCompanionInitiatedRestart];
  [(HMDDeviceCapabilities *)self supportsCompanionInitiatedObliterate];
  [(HMDDeviceCapabilities *)self supportsCameraRecording];
  [(HMDDeviceCapabilities *)self supportsRouterManagement];
  [(HMDDeviceCapabilities *)self supportsShortcutActions];
  [(HMDDeviceCapabilities *)self supportsMediaActions];
  [(HMDDeviceCapabilities *)self supportsFirmwareUpdate];
  [(HMDDeviceCapabilities *)self supportsResidentFirmwareUpdate];
  [(HMDDeviceCapabilities *)self supportsCameraActivityZones];
  [(HMDDeviceCapabilities *)self supportsMusicAlarm];
  [(HMDDeviceCapabilities *)self supportsFaceClassification];
  [(HMDDeviceCapabilities *)self supportsNaturalLighting];
  [(HMDDeviceCapabilities *)self supportsIDSActivityMonitorPresence];
  [(HMDDeviceCapabilities *)self supportsCameraRecordingReachabilityNotifications];
  [(HMDDeviceCapabilities *)self supportsAnnounce];
  [(HMDDeviceCapabilities *)self supportsDoorbellChime];
  [(HMDDeviceCapabilities *)self supportsThirdPartyMusic];
  [(HMDDeviceCapabilities *)self supportsThreadBorderRouter];
  [(HMDDeviceCapabilities *)self supportsPreferredMediaUser];
  [(HMDDeviceCapabilities *)self supportsSiriEndpointSetup];
  [(HMDDeviceCapabilities *)self supportsHomeHub];
  [(HMDDeviceCapabilities *)self supportsWakeOnLAN];
  [(HMDDeviceCapabilities *)self supportsLockNotificationContext];
  [(HMDDeviceCapabilities *)self supportsCoordinationDoorbellChime];
  [(HMDDeviceCapabilities *)self supportsCoordinationFreeDoorbellChime];
  [(HMDDeviceCapabilities *)self supportsTVOSUpdateManualUpdateAvailableNotification];
  [(HMDDeviceCapabilities *)self supportsAudioReturnChannel];
  [(HMDDeviceCapabilities *)self supportsWalletKey];
  [(HMDDeviceCapabilities *)self supportsCameraPackageDetection];
  [(HMDDeviceCapabilities *)self supportsAccessCodes];
  [(HMDDeviceCapabilities *)self supportsCHIP];
  [(HMDDeviceCapabilities *)self supportsUnifiedMediaNotifications];
  [(HMDDeviceCapabilities *)self supportsManagedConfigurationProfile];
  [(HMDDeviceCapabilities *)self supportsUserMediaSettings];
  [(HMDDeviceCapabilities *)self supportsCaptiveNetworks];
  [(HMDDeviceCapabilities *)self supportsModernTransport];
  [(HMDDeviceCapabilities *)self supportsResidentFirstAccessoryCommunication];
  [(HMDDeviceCapabilities *)self supportsMessagedHomePodSettings];
  [(HMDDeviceCapabilities *)self supportsCustomMediaApplicationDestination];
  [(HMDDeviceCapabilities *)self supportsThreadNetworkCredentialSharing];
  [(HMDDeviceCapabilities *)self supportsMatterSharedAdminPairing];
  [(HMDDeviceCapabilities *)self supportsRMVonAppleTV];
  [(HMDDeviceCapabilities *)self supportsJustSiri];
  [(HMDDeviceCapabilities *)self supportsThreadService];
  return [(HMDDeviceCapabilities *)self supportsMatterOwnerCertFetch];
}

- (HMDDeviceCapabilities)initWithObjectModel:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)HMDDeviceCapabilities;
    id v6 = [(HMDDeviceCapabilities *)&v13 init];
    BOOL v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_objectModel, a3);
    }
    self = v7;
    BOOL v8 = self;
  }
  else
  {
    BOOL v9 = (void *)MEMORY[0x1D9452090]();
    BOOL v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      BOOL v15 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Model object is a required argument", buf, 0xCu);
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (HMDDeviceCapabilities)initWithProductInfo:(id)a3 mobileGestaltClient:(id)a4 homekitVersion:(id)a5
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    BOOL v11 = [HMDDeviceCapabilitiesModel alloc];
    BOOL v12 = [MEMORY[0x1E4F29128] UUID];
    objc_super v13 = [(HMDBackingStoreModelObject *)v11 initWithUUID:v12];

    BOOL v14 = [NSNumber numberWithBool:productSupportsKeychainSync(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsKeychainSync:v14];

    BOOL v15 = [NSNumber numberWithBool:productSupportsDeviceSetup(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsDeviceSetup:v15];

    uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", productSupportsKeyTransferClient(v8, v9, v10));
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsKeyTransferClient:v16];

    BOOL v17 = [NSNumber numberWithBool:productSupportsKeyTransferServer(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsKeyTransferServer:v17];

    BOOL v18 = [NSNumber numberWithBool:productSupportsStandaloneMode(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsStandaloneMode:v18];

    BOOL v19 = [NSNumber numberWithBool:productSupportsCloudDataSync(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsCloudDataSync:v19];

    BOOL v20 = [NSNumber numberWithBool:productSupportsWholeHouseAudio(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsWholeHouseAudio:v20];

    BOOL v21 = [NSNumber numberWithBool:productSupportsAssistantAccessControl(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsAssistantAccessControl:v21];

    BOOL v22 = [NSNumber numberWithBool:productIsResidentCapable(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setResidentCapable:v22];

    BOOL v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "productClass") == 4);
    [(HMDDeviceCapabilitiesModel *)v13 setRemoteGatewayCapable:v23];

    BOOL v24 = [NSNumber numberWithBool:productSupportsHomeInvitation(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsHomeInvitation:v24];

    BOOL v25 = [NSNumber numberWithBool:productSupportsTargetControl(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsTargetControl:v25];

    BOOL v26 = [NSNumber numberWithBool:productSupportsMultiUser(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsMultiUser:v26];

    BOOL v27 = [NSNumber numberWithBool:productSupportsHomeLevelLocationServiceSetting(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsHomeLevelLocationServiceSetting:v27];

    BOOL v28 = [NSNumber numberWithBool:productSupportsCompanionInitiatedRestart(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsCompanionInitiatedRestart:v28];

    BOOL v29 = [NSNumber numberWithBool:productSupportsCompanionInitiatedObliterate(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsCompanionInitiatedObliterate:v29];

    BOOL v30 = [NSNumber numberWithBool:productSupportsCameraRecording(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsCameraRecording:v30];

    BOOL v31 = [NSNumber numberWithBool:productSupportsRouterManagement(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsRouterManagement:v31];

    BOOL v32 = [NSNumber numberWithBool:productSupportsShortcutActions(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsShortcutActions:v32];

    BOOL v33 = [NSNumber numberWithBool:productSupportsMediaActions(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsMediaActions:v33];

    BOOL v34 = [NSNumber numberWithBool:productSupportsFirmwareUpdate(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsFirmwareUpdate:v34];

    BOOL v35 = [NSNumber numberWithBool:productSupportsResidentFirmwareUpdate(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsResidentFirmwareUpdate:v35];

    BOOL v36 = [NSNumber numberWithBool:productSupportsCameraActivityZones(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsCameraActivityZones:v36];

    BOOL v37 = [NSNumber numberWithBool:productSupportsMusicAlarm(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsMusicAlarm:v37];

    BOOL v38 = [NSNumber numberWithBool:productSupportsCameraActivityZones(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsFaceClassification:v38];

    BOOL v39 = [NSNumber numberWithBool:productSupportsCameraActivityZones(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsNaturalLighting:v39];

    BOOL v40 = NSNumber;
    unint64_t v41 = [v8 productPlatform];
    BOOL v43 = v41 > 5 || (v41 & 0x3F) == 4;
    BOOL v44 = [v40 numberWithBool:v43];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsIDSActivityMonitorPresence:v44];

    BOOL v45 = [NSNumber numberWithBool:productSupportsCameraActivityZones(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsCameraRecordingReachabilityNotifications:v45];

    BOOL v46 = [NSNumber numberWithBool:productSupportsAnnounce(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsAnnounce:v46];

    BOOL v47 = [NSNumber numberWithBool:productSupportsThirdPartyMusic(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsThirdPartyMusic:v47];

    BOOL v48 = [NSNumber numberWithBool:productSupportsPreferredMediaUser(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsPreferredMediaUser:v48];

    BOOL v49 = [NSNumber numberWithBool:0];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsThreadBorderRouter:v49];

    BOOL v50 = [NSNumber numberWithBool:productSupportsThirdPartyMusic(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsDoorbellChime:v50];

    BOOL v51 = [NSNumber numberWithBool:productSupportsUserMediaSettings(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsUserMediaSettings:v51];

    BOOL v52 = [NSNumber numberWithBool:productSupportsCoordinationDoorbellChime(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsCoordinationDoorbellChime:v52];

    BOOL v53 = [NSNumber numberWithBool:productSupportsCoordinationFreeDoorbellChime(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsCoordinationFreeDoorbellChime:v53];

    BOOL v54 = NSNumber;
    [v8 productClass];
    BOOL v55 = [v54 numberWithBool:0];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsTVOSUpdateManualUpdateAvailableNotification:v55];

    BOOL v56 = [NSNumber numberWithBool:productSupportsSiriEndpointSetup(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsSiriEndpointSetup:v56];

    BOOL v57 = objc_msgSend(NSNumber, "numberWithBool:", productSupportsHomeHub(v8, v9));
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsHomeHub:v57];

    BOOL v58 = [NSNumber numberWithBool:productSupportsWakeOnLAN(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsWakeOnLAN:v58];

    BOOL v59 = [NSNumber numberWithBool:productSupportsLockNotificationContext(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsLockNotificationContext:v59];

    BOOL v60 = objc_msgSend(NSNumber, "numberWithBool:", productSupportsAudioReturnChannel(v8, v9));
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsAudioReturnChannel:v60];

    BOOL v61 = [NSNumber numberWithBool:productSupportsLockNotificationContext(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsWalletKey:v61];

    BOOL v62 = [NSNumber numberWithBool:productSupportsLockNotificationContext(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsCameraPackageDetection:v62];

    BOOL v63 = [NSNumber numberWithBool:productSupportsLockNotificationContext(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsAccessCodes:v63];

    v64 = [NSNumber numberWithBool:productSupportsLockNotificationContext(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsCHIP:v64];

    BOOL v65 = [NSNumber numberWithBool:productSupportsUnifiedMediaNotifications(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsUnifiedMediaNotifications:v65];

    v66 = [NSNumber numberWithBool:productSupportsUserMediaSettings(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsManagedConfigurationProfile:v66];

    v67 = [NSNumber numberWithBool:productSupportsCaptiveNetworks(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsCaptiveNetworks:v67];

    [(HMDDeviceCapabilitiesModel *)v13 setSupportsModernTransport:MEMORY[0x1E4F1CC38]];
    v68 = [NSNumber numberWithBool:productSupportsResidentFirstAccessoryCommunication(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsResidentFirstAccessoryCommunication:v68];

    v69 = objc_msgSend(NSNumber, "numberWithBool:", productSupportsMessagedHomePodSettings(v8, v10));
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsMessagedHomePodSettings:v69];

    v70 = [NSNumber numberWithBool:productSupportsCustomMediaApplicationDestination(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsCustomMediaApplicationDestination:v70];

    v71 = objc_msgSend(NSNumber, "numberWithBool:", productSupportsThreadNetworkCredentialSharing(v8, v9, v10));
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsThreadNetworkCredentialSharing:v71];

    v72 = objc_msgSend(NSNumber, "numberWithBool:", productSupportsMatterSharedAdminPairing(v8, v9, v10));
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsMatterSharedAdminPairing:v72];

    v73 = [NSNumber numberWithBool:productSupportsRMVonAppleTV(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsRMVonAppleTV:v73];

    v74 = [NSNumber numberWithBool:productSupportsJustSiri(v8)];
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsJustSiri:v74];

    v75 = NSNumber;
    uint64_t v92 = 0;
    memset(buf, 0, sizeof(buf));
    id v76 = v8;
    v77 = [v76 softwareVersion];
    v78 = v77;
    if (v77)
    {
      [v77 operatingSystemVersion];
    }
    else
    {
      memset(buf, 0, sizeof(buf));
      uint64_t v92 = 0;
    }

    uint64_t v83 = [v76 productPlatform];
    unint64_t v84 = [v76 productClass];

    if (v83 == 1)
    {
      long long v89 = *(_OWORD *)buf;
      uint64_t v90 = v92;
      if (HMFOperatingSystemVersionCompare() != 1
        && (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled() & 1) != 0)
      {
        goto LABEL_22;
      }
    }
    uint64_t v85 = 0;
    if (v84 > 0xA || ((1 << v84) & 0x78A) == 0) {
      goto LABEL_24;
    }
    if (v83 == 2
      && (long long v89 = *(_OWORD *)buf, v90 = v92, HMFOperatingSystemVersionCompare() != 1)
      && isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
    {
LABEL_22:
      uint64_t v85 = MGGetBoolAnswer();
    }
    else
    {
      uint64_t v85 = 0;
    }
LABEL_24:
    v86 = objc_msgSend(v75, "numberWithBool:", v85, v89, v90);
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsThreadService:v86];

    v87 = objc_msgSend(NSNumber, "numberWithBool:", productSupportsMatterOwnerCertFetch(v76, v9, v10));
    [(HMDDeviceCapabilitiesModel *)v13 setSupportsMatterOwnerCertFetch:v87];

    self = [(HMDDeviceCapabilities *)self initWithObjectModel:v13];
    v82 = self;
    goto LABEL_25;
  }
  v79 = (void *)MEMORY[0x1D9452090]();
  v80 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
  {
    v81 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v81;
    _os_log_impl(&dword_1D49D5000, v80, OS_LOG_TYPE_ERROR, "%{public}@Product info is a required argument", buf, 0xCu);
  }
  v82 = 0;
LABEL_25:

  return v82;
}

- (HMDDeviceCapabilities)initWithProductInfo:(id)a3 mobileGestaltClient:(id)a4
{
  return [(HMDDeviceCapabilities *)self initWithProductInfo:a3 mobileGestaltClient:a4 homekitVersion:0];
}

- (HMDDeviceCapabilities)initWithProductInfo:(id)a3
{
  return [(HMDDeviceCapabilities *)self initWithProductInfo:a3 mobileGestaltClient:0 homekitVersion:0];
}

+ (id)deviceCapabilitiesModelIdentifierWithParentIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = __identifierForParentUUID(a3);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)supportedPairingCapabilities
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  uint64_t v3 = [v2 productClass];

  if ((unint64_t)(v3 - 1) >= 3) {
    return 0;
  }
  else {
    return 7;
  }
}

+ (BOOL)supportsAudioDestinationCreation
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  uint64_t v3 = [v2 productClass];

  if (v3 != 6) {
    return 0;
  }
  if (MGGetBoolAnswer()) {
    return 1;
  }
  return +[HMDDeviceCapabilities isInternalVirtualDevice];
}

+ (BOOL)supportsAudioDestinationControllerCreation
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  uint64_t v3 = [v2 productClass];

  if (v3 != 4) {
    return 0;
  }
  if (MGGetBoolAnswer()) {
    return 1;
  }
  return +[HMDDeviceCapabilities isInternalVirtualDevice];
}

+ (BOOL)isInternalVirtualDevice
{
  if (isInternalVirtualDevice_onceToken != -1) {
    dispatch_once(&isInternalVirtualDevice_onceToken, &__block_literal_global_384);
  }
  if (!isInternalVirtualDevice_result) {
    return 0;
  }
  return isInternalBuild();
}

uint64_t __48__HMDDeviceCapabilities_isInternalVirtualDevice__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isInternalVirtualDevice_uint64_t result = result;
  return result;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_150771 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_150771, &__block_literal_global_210_150772);
  }
  v2 = (void *)logCategory__hmf_once_v5_150773;
  return v2;
}

uint64_t __36__HMDDeviceCapabilities_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5_150773;
  logCategory__hmf_once_v5_150773 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __43__HMDDeviceCapabilities_deviceCapabilities__block_invoke()
{
  uint64_t v0 = [HMDDeviceCapabilities alloc];
  id v5 = [MEMORY[0x1E4F65548] productInfo];
  uint64_t v1 = objc_alloc_init(HMDMobileGestaltClient);
  v2 = +[HMDHomeKitVersion currentVersion];
  uint64_t v3 = [(HMDDeviceCapabilities *)v0 initWithProductInfo:v5 mobileGestaltClient:v1 homekitVersion:v2];
  id v4 = (void *)deviceCapabilities_deviceCapabilities;
  deviceCapabilities_deviceCapabilities = v3;
}

+ (BOOL)supportsSiriUnsecuringActionsWithWatchAuth
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  BOOL v3 = [v2 productClass] == 1;

  return v3;
}

+ (BOOL)supportsSiriUnsecuringActionsWithNoPasscode
{
  return 0;
}

+ (BOOL)supportsHostingLocalTempAndHumiditySensor
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  if ([v2 productClass] != 6 || objc_msgSend(v2, "productPlatform") != 4) {
    goto LABEL_9;
  }
  BOOL v3 = 1;
  uint64_t v4 = MGGetProductType();
  if (v4 > 3104290449)
  {
    if (v4 == 3104290450) {
      goto LABEL_10;
    }
    uint64_t v5 = 3348380076;
  }
  else
  {
    if (v4 == 910313402) {
      goto LABEL_10;
    }
    uint64_t v5 = 1540760353;
  }
  if (v4 != v5) {
LABEL_9:
  }
    BOOL v3 = 0;
LABEL_10:

  return v3;
}

+ (BOOL)supportsStereoPairingV4
{
  return 0;
}

+ (BOOL)supportsStereoPairingV3
{
  return 0;
}

+ (BOOL)supportsStereoPairingV2
{
  return 0;
}

+ (BOOL)supportsStereoPairingV1
{
  return 0;
}

+ (BOOL)supportsBulletinBoard
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  uint64_t v3 = [v2 productPlatform];

  if (v3) {
    BOOL v4 = v3 == 3;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

+ (BOOL)supportsHomeKitDataStream
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  uint64_t v3 = [v2 productPlatform];

  if (v3) {
    BOOL v4 = v3 == 3;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

+ (BOOL)isCompanionCapable
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  BOOL v3 = [v2 productClass] == 1;

  return v3;
}

+ (BOOL)supportsBackboard
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  unint64_t v3 = [v2 productClass];

  return (v3 < 0xC) & (0x83Eu >> v3);
}

+ (BOOL)supportsSyncingToSharedUsers
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  unint64_t v3 = [v2 productClass];

  return (v3 > 0xB) | (0xFDFu >> v3) & 1;
}

+ (BOOL)supportsAddingAccessory
{
  v2 = [MEMORY[0x1E4F65570] systemInfo];
  if ([v2 productPlatform] == 1)
  {
    unint64_t v3 = [MEMORY[0x1E4F65570] systemInfo];
    BOOL v4 = [v3 productVariant] == 3;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

+ (BOOL)supportsBidirectionalAudioForCameraStreaming
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  unint64_t v3 = [v2 productPlatform];

  return (v3 > 5) | (0x2Fu >> v3) & 1;
}

+ (BOOL)supportsReceivingRemoteCameraStream
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  unint64_t v3 = [v2 productPlatform];

  return (v3 < 6) & (0x2Eu >> v3);
}

+ (BOOL)supportsDismissUserNotificationAndDialog
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  unint64_t v3 = [v2 productPlatform];

  return (v3 < 6) & (0x2Eu >> v3);
}

+ (BOOL)supportsUserNotifications
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  unint64_t v3 = [v2 productPlatform];

  return (v3 < 6) & (0x26u >> v3);
}

+ (BOOL)supportsCameraSnapshotRequestViaRelay
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  unint64_t v3 = [v2 productPlatform];

  return (v3 < 6) & (0x2Eu >> v3);
}

+ (BOOL)supportsTargetControllerAutoConfigure
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  if ([v2 productClass] == 1) {
    goto LABEL_4;
  }
  unint64_t v3 = [MEMORY[0x1E4F65548] productInfo];
  if ([v3 productClass] == 3)
  {

LABEL_4:
    BOOL IsResidentCapable = 1;
    goto LABEL_5;
  }
  id v6 = [MEMORY[0x1E4F65548] productInfo];
  uint64_t v7 = [v6 productClass];

  if (v7 == 2) {
    return 1;
  }
  v2 = [MEMORY[0x1E4F65548] productInfo];
  BOOL IsResidentCapable = productIsResidentCapable(v2);
LABEL_5:

  return IsResidentCapable;
}

+ (BOOL)supportsRemoteAccess
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  unint64_t v3 = [v2 productPlatform];

  return (v3 < 6) & (0x2Eu >> v3);
}

+ (BOOL)requiresHomePod2ndGenPairing
{
  return [a1 appleMediaAccessoryVariant] == 4;
}

+ (BOOL)requiresHomePodMiniPairing
{
  return [a1 appleMediaAccessoryVariant] == 2;
}

+ (unint64_t)appleMediaAccessoryVariant
{
  return 0;
}

+ (BOOL)isAppleMediaAccessory
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  uint64_t v3 = [v2 productClass];

  return (v3 & 0xFFFFFFFFFFFFFFFDLL) == 4;
}

+ (BOOL)supportsCustomerReset
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  uint64_t v3 = [v2 productPlatform];

  return (unint64_t)(v3 - 1) < 2;
}

+ (BOOL)supportsSymptomsHandler
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  unint64_t v3 = [v2 productPlatform];

  return (v3 < 6) & (0x24u >> v3);
}

+ (BOOL)supportsIntentDonation
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  unint64_t v3 = [v2 productPlatform];

  return (v3 < 6) & (0x2Cu >> v3);
}

+ (BOOL)supportsHomeApp
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  unint64_t v3 = [v2 productPlatform];

  return (v3 < 6) & (0x2Cu >> v3);
}

+ (BOOL)supportsLocalization
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  BOOL v3 = [v2 productClass] != 6;

  return v3;
}

@end