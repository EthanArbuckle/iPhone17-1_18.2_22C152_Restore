@interface HMCameraUserSettings
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)areActivityZonesIncludedForSignificantEventDetection;
- (BOOL)areSnapshotsAllowed;
- (BOOL)isAccessModeChangeNotificationEnabled;
- (BOOL)isAccessModeIndicatorEnabled;
- (BOOL)isCameraManuallyDisabled;
- (BOOL)isNightVisionModeEnabled;
- (BOOL)isReachabilityEventNotificationEnabled;
- (BOOL)isRecordingAudioEnabled;
- (HMAccessory)accessory;
- (HMCameraBulletinBoardSmartNotification)smartNotificationBulletin;
- (HMCameraUserSettings)initWithCameraUserSettings:(id)a3;
- (HMCameraUserSettingsDelegate)delegate;
- (HMCharacteristic)accessModeIndicatorEnabledCharacteristic;
- (HMCharacteristic)nightVisionModeEnabledCharacteristic;
- (HMCharacteristic)recordingAudioEnabledCharacteristic;
- (HMCharacteristic)snapshotsAllowedCharacteristic;
- (NSArray)attributeDescriptions;
- (NSSet)activityZones;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)messageTargetUUID;
- (NSUUID)uniqueIdentifier;
- (_HMCameraUserSettings)cameraUserSettings;
- (_HMContext)context;
- (id)_characteristicWithType:(id)a3 serviceType:(id)a4;
- (id)createSmartNotificationBulletin;
- (id)logIdentifier;
- (id)messageDestination;
- (unint64_t)accessModeAtHome;
- (unint64_t)accessModeForCameraHomePresence:(unint64_t)a3;
- (unint64_t)accessModeNotAtHome;
- (unint64_t)currentAccessMode;
- (unint64_t)recordingEventTriggers;
- (unint64_t)supportedFeatures;
- (void)_mergeNewSettings:(id)a3;
- (void)_sendSettingsUpdateMessage:(id)a3 completion:(id)a4 successHandler:(id)a5;
- (void)_updateSettings:(id)a3 shouldNotifyDelegate:(BOOL)a4;
- (void)configureWithAccessory:(id)a3 context:(id)a4;
- (void)handleSettingsDidUpdateMessage:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setCameraUserSettings:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSmartNotificationBulletin:(id)a3;
- (void)updateAccessMode:(unint64_t)a3 forCameraHomePresence:(unint64_t)a4 completionHandler:(id)a5;
- (void)updateAccessMode:(unint64_t)a3 forPresenceEventType:(unint64_t)a4 completionHandler:(id)a5;
- (void)updateAccessModeChangeNotificationEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)updateAccessModeIndicatorEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)updateActivityZones:(id)a3 areActivityZonesIncludedForSignificantEventDetection:(BOOL)a4 completionHandler:(id)a5;
- (void)updateBulletinNotificationEnabled:(BOOL)a3 condition:(id)a4 completionHandler:(id)a5;
- (void)updateNightVisionModeEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)updateReachabilityEventNotificationEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)updateRecordingAudioEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)updateRecordingEventTriggers:(unint64_t)a3 completionHandler:(id)a4;
- (void)updateSnapshotsAllowed:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation HMCameraUserSettings

- (HMCameraUserSettings)initWithCameraUserSettings:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMCameraUserSettings;
  v6 = [(HMCameraUserSettings *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cameraUserSettings, a3);
  }

  return v7;
}

- (id)createSmartNotificationBulletin
{
  v3 = [(HMCameraUserSettings *)self cameraUserSettings];
  if (([v3 supportedFeatures] & 2) != 0)
  {
    id v5 = [v3 notificationSettings];
    uint64_t v6 = [v5 isSmartBulletinBoardNotificationEnabled];

    v7 = [v3 notificationSettings];
    v8 = [v7 smartBulletinBoardNotificationCondition];

    if (v8)
    {
      objc_super v9 = [(HMCameraUserSettings *)self accessory];
      v10 = [v9 home];
      v11 = +[HMPredicateUtilities rewritePredicateForClient:v8 home:v10];
    }
    else
    {
      v11 = 0;
    }
    v12 = [HMCameraBulletinBoardSmartNotification alloc];
    v13 = [(HMCameraUserSettings *)self context];
    v4 = [(HMCameraBulletinBoardSmartNotification *)v12 initWithEnabled:v6 condition:v11 context:v13 cameraUserSettings:self];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isCameraManuallyDisabled
{
  v2 = [(HMCameraUserSettings *)self cameraUserSettings];
  char v3 = [v2 isCameraManuallyDisabled];

  return v3;
}

- (unint64_t)supportedFeatures
{
  v2 = [(HMCameraUserSettings *)self cameraUserSettings];
  unint64_t v3 = [v2 supportedFeatures];

  return v3;
}

- (unint64_t)currentAccessMode
{
  v2 = [(HMCameraUserSettings *)self cameraUserSettings];
  unint64_t v3 = [v2 currentAccessMode];

  return v3;
}

- (_HMCameraUserSettings)cameraUserSettings
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_cameraUserSettings;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (_HMContext)context
{
  return self->_context;
}

- (void)configureWithAccessory:(id)a3 context:(id)a4
{
  objc_storeStrong((id *)&self->_context, a4);
  id v7 = a4;
  id v8 = a3;
  objc_storeWeak((id *)&self->_accessory, v8);

  objc_super v9 = [(HMCameraUserSettings *)self createSmartNotificationBulletin];
  [(HMCameraUserSettings *)self setSmartNotificationBulletin:v9];

  id v10 = [v7 messageDispatcher];
  [v10 registerForMessage:@"hmcus.du" receiver:self selector:sel_handleSettingsDidUpdateMessage_];
}

- (void)setSmartNotificationBulletin:(id)a3
{
  v4 = (HMCameraBulletinBoardSmartNotification *)a3;
  os_unfair_lock_lock_with_options();
  smartNotificationBulletin = self->_smartNotificationBulletin;
  self->_smartNotificationBulletin = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_smartNotificationBulletin, 0);

  objc_storeStrong((id *)&self->_cameraUserSettings, 0);
}

- (void)setAccessory:(id)a3
{
}

- (HMAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);

  return (HMAccessory *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (BOOL)isRecordingAudioEnabled
{
  return self->_recordingAudioEnabled;
}

- (BOOL)isNightVisionModeEnabled
{
  return self->_nightVisionModeEnabled;
}

- (BOOL)isAccessModeIndicatorEnabled
{
  return self->_accessModeIndicatorEnabled;
}

- (BOOL)areSnapshotsAllowed
{
  return self->_snapshotsAllowed;
}

- (HMCameraUserSettingsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMCameraUserSettingsDelegate *)WeakRetained;
}

- (void)_sendSettingsUpdateMessage:(id)a3 completion:(id)a4 successHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [v10 shortDescription];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __77__HMCameraUserSettings__sendSettingsUpdateMessage_completion_successHandler___block_invoke;
  v20 = &unk_1E5942D88;
  v21 = self;
  id v22 = v11;
  id v23 = v8;
  id v24 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v11;
  [v10 setResponseHandler:&v17];
  v15 = [(HMCameraUserSettings *)self context];
  v16 = [v15 messageDispatcher];
  [v16 sendMessage:v10];
}

void __77__HMCameraUserSettings__sendSettingsUpdateMessage_completion_successHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      int v18 = 138543874;
      v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Camera settings request failed for %@: %@", (uint8_t *)&v18, 0x20u);
    }
    id v13 = [*(id *)(a1 + 32) context];
    id v14 = [v13 delegateCaller];
    [v14 callCompletion:*(void *)(a1 + 48) error:v5];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      uint64_t v16 = *(void *)(a1 + 40);
      int v18 = 138543618;
      v19 = v15;
      __int16 v20 = 2112;
      uint64_t v21 = v16;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Camera settings request succeeded for %@", (uint8_t *)&v18, 0x16u);
    }
    id v13 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) mutableCopy];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(a1 + 32) _updateSettings:v13 shouldNotifyDelegate:0];
    id v14 = [*(id *)(a1 + 32) context];
    uint64_t v17 = [v14 delegateCaller];
    [v17 callCompletion:*(void *)(a1 + 48) error:0];
  }
}

- (id)_characteristicWithType:(id)a3 serviceType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMCameraUserSettings *)self accessory];
  id v9 = [v8 services];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __60__HMCameraUserSettings__characteristicWithType_serviceType___block_invoke;
  v18[3] = &unk_1E5942D38;
  id v19 = v7;
  id v10 = v7;
  v11 = objc_msgSend(v9, "hmf_objectPassingTest:", v18);
  uint64_t v12 = [v11 characteristics];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__HMCameraUserSettings__characteristicWithType_serviceType___block_invoke_2;
  v16[3] = &unk_1E5942D60;
  id v17 = v6;
  id v13 = v6;
  id v14 = objc_msgSend(v12, "hmf_objectPassingTest:", v16);

  return v14;
}

uint64_t __60__HMCameraUserSettings__characteristicWithType_serviceType___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 serviceType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __60__HMCameraUserSettings__characteristicWithType_serviceType___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 characteristicType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_mergeNewSettings:(id)a3
{
  id v4 = [a3 cameraUserSettings];
  [(HMCameraUserSettings *)self _updateSettings:v4 shouldNotifyDelegate:1];
}

- (void)_updateSettings:(id)a3 shouldNotifyDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HMCameraUserSettings *)self cameraUserSettings];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x19F3A64A0]();
    id v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating camera user settings: %@", buf, 0x16u);
    }
    [(HMCameraUserSettings *)v10 setCameraUserSettings:v6];
    id v13 = [(HMCameraUserSettings *)v10 createSmartNotificationBulletin];
    [(HMCameraUserSettings *)v10 setSmartNotificationBulletin:v13];

    if (v4)
    {
      id v14 = [(HMCameraUserSettings *)v10 delegate];
      if (objc_opt_respondsToSelector())
      {
        v15 = [(HMCameraUserSettings *)v10 context];
        uint64_t v16 = [v15 delegateCaller];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __61__HMCameraUserSettings__updateSettings_shouldNotifyDelegate___block_invoke;
        v17[3] = &unk_1E5945628;
        id v18 = v14;
        id v19 = v10;
        [v16 invokeBlock:v17];
      }
    }
  }
}

uint64_t __61__HMCameraUserSettings__updateSettings_shouldNotifyDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cameraUserSettingsDidUpdate:*(void *)(a1 + 40)];
}

- (BOOL)isReachabilityEventNotificationEnabled
{
  v2 = [(HMCameraUserSettings *)self cameraUserSettings];
  unint64_t v3 = [v2 notificationSettings];
  char v4 = [v3 isReachabilityEventNotificationEnabled];

  return v4;
}

- (BOOL)areActivityZonesIncludedForSignificantEventDetection
{
  v2 = [(HMCameraUserSettings *)self cameraUserSettings];
  char v3 = [v2 areActivityZonesIncludedForSignificantEventDetection];

  return v3;
}

- (NSSet)activityZones
{
  v2 = [(HMCameraUserSettings *)self cameraUserSettings];
  char v3 = [v2 activityZones];

  return (NSSet *)v3;
}

- (BOOL)isAccessModeChangeNotificationEnabled
{
  v2 = [(HMCameraUserSettings *)self cameraUserSettings];
  char v3 = [v2 notificationSettings];
  char v4 = [v3 isAccessModeChangeNotificationEnabled];

  return v4;
}

- (unint64_t)recordingEventTriggers
{
  v2 = [(HMCameraUserSettings *)self cameraUserSettings];
  unint64_t v3 = [v2 recordingEventTriggers];

  return v3;
}

- (unint64_t)accessModeNotAtHome
{
  v2 = [(HMCameraUserSettings *)self cameraUserSettings];
  unint64_t v3 = [v2 accessModeNotAtHome];

  return v3;
}

- (unint64_t)accessModeAtHome
{
  v2 = [(HMCameraUserSettings *)self cameraUserSettings];
  unint64_t v3 = [v2 accessModeAtHome];

  return v3;
}

- (NSUUID)uniqueIdentifier
{
  v2 = [(HMCameraUserSettings *)self cameraUserSettings];
  unint64_t v3 = [v2 UUID];

  return (NSUUID *)v3;
}

- (HMCameraBulletinBoardSmartNotification)smartNotificationBulletin
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  char v4 = self->_smartNotificationBulletin;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setCameraUserSettings:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  char v4 = (_HMCameraUserSettings *)[v6 copy];
  cameraUserSettings = self->_cameraUserSettings;
  self->_cameraUserSettings = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)attributeDescriptions
{
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v5 = [(HMCameraUserSettings *)self accessory];
  id v6 = [v5 name];
  id v7 = (void *)[v4 initWithName:@"Accessory Name" value:v6];
  [v3 addObject:v7];

  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v9 = [(HMCameraUserSettings *)self cameraUserSettings];
  id v10 = (void *)[v8 initWithName:@"Settings" value:v9];
  [v3 addObject:v10];

  v11 = (void *)[v3 copy];

  return (NSArray *)v11;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (id)logIdentifier
{
  if (isInternalBuild())
  {
    unint64_t v3 = NSString;
    id v4 = [(HMCameraUserSettings *)self accessory];
    id v5 = [v4 name];
    id v6 = [(HMCameraUserSettings *)self uniqueIdentifier];
    id v7 = [v6 UUIDString];
    id v8 = [v3 stringWithFormat:@"%@/%@", v5, v7];
  }
  else
  {
    id v4 = [(HMCameraUserSettings *)self uniqueIdentifier];
    id v8 = [v4 UUIDString];
  }

  return v8;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  id v4 = [(HMCameraUserSettings *)self messageTargetUUID];
  id v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (NSUUID)messageTargetUUID
{
  v2 = [(HMCameraUserSettings *)self cameraUserSettings];
  id v3 = [v2 UUID];

  return (NSUUID *)v3;
}

- (void)handleSettingsDidUpdateMessage:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v27 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Processing updated settings", buf, 0xCu);
  }
  id v9 = [v4 messagePayload];
  id v10 = v6;
  id v11 = v9;
  uint64_t v12 = objc_msgSend(v11, "hmf_dataForKey:", @"hmcus.uk");
  if (v12)
  {
    id v25 = 0;
    id v13 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:&v25];
    id v14 = v25;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      __int16 v20 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v21 = v10;
      __int16 v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v27 = v23;
        __int16 v28 = 2112;
        id v29 = v14;
        _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive camera settings from settings data: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = v10;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v27 = v19;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Invalid payload for updated settings: %@", buf, 0x16u);
    }
    id v13 = 0;
  }

  if (v13)
  {
    [(HMCameraUserSettings *)v10 _updateSettings:v13 shouldNotifyDelegate:1];
    [v4 respondWithSuccess];
  }
  else
  {
    uint64_t v24 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v4 respondWithError:v24];
  }
}

- (void)updateBulletinNotificationEnabled:(BOOL)a3 condition:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  v36[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v35[0] = @"HM.BulletinBoardNotificationEnabled";
  id v10 = [NSNumber numberWithBool:v6];
  v36[0] = v10;
  v35[1] = @"HM.BulletinBoardNotificationCondition";
  id v11 = encodeRootObject(v8);
  v36[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];

  id v13 = (void *)MEMORY[0x1E4F654B0];
  id v14 = [(HMCameraUserSettings *)self messageDestination];
  id v15 = [v13 messageWithName:@"kBulletinBoardNotificationCommitRequestKey" destination:v14 payload:v12];

  uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
  id v17 = self;
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = id v23 = v9;
    __int16 v20 = [v15 shortDescription];
    uint64_t v21 = HMFBooleanToString();
    *(_DWORD *)buf = 138544130;
    __int16 v28 = v19;
    __int16 v29 = 2112;
    uint64_t v30 = v20;
    __int16 v31 = 2112;
    v32 = v21;
    __int16 v33 = 2112;
    id v34 = v8;
    _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@Dispatching message %@ to update bulletin notification enabled to %@ and condition to %@", buf, 0x2Au);

    id v9 = v23;
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __86__HMCameraUserSettings_updateBulletinNotificationEnabled_condition_completionHandler___block_invoke;
  v24[3] = &unk_1E5942D10;
  BOOL v26 = v6;
  id v25 = v8;
  id v22 = v8;
  [(HMCameraUserSettings *)v17 _sendSettingsUpdateMessage:v15 completion:v9 successHandler:v24];
}

void __86__HMCameraUserSettings_updateBulletinNotificationEnabled_condition_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 notificationSettings];
  id v5 = (id)[v4 mutableCopy];

  [v5 setSmartBulletinBoardNotificationEnabled:*(unsigned __int8 *)(a1 + 40)];
  [v5 setSmartBulletinBoardNotificationCondition:*(void *)(a1 + 32)];
  [v3 setNotificationSettings:v5];
}

- (void)updateReachabilityEventNotificationEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v6)
  {
    uint64_t v24 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCameraUserSettings updateReachabilityEventNotificationEnabled:completionHandler:]", @"completion"];
    id v25 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v26 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      __int16 v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v33 = v28;
      __int16 v34 = 2112;
      v35 = (const char *)v24;
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v29 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v24 userInfo:0];
    objc_exception_throw(v29);
  }
  id v7 = (void (**)(void, void))v6;
  id v8 = [(HMCameraUserSettings *)self context];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F654B0];
    id v10 = [(HMCameraUserSettings *)self messageDestination];
    v38 = @"hmcus.renemk";
    id v11 = [NSNumber numberWithBool:v4];
    v39[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    id v13 = [v9 messageWithName:@"hmcus.urenem" destination:v10 payload:v12];

    id v14 = (void *)MEMORY[0x19F3A64A0]();
    id v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      id v18 = [v13 shortDescription];
      id v19 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      __int16 v33 = v17;
      __int16 v34 = 2112;
      v35 = v18;
      __int16 v36 = 2112;
      v37 = v19;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Dispatching message %@ to update reachabilityEventNotificationEnabled to %@", buf, 0x20u);
    }
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __85__HMCameraUserSettings_updateReachabilityEventNotificationEnabled_completionHandler___block_invoke;
    v30[3] = &__block_descriptor_33_e38_v16__0___HMMutableCameraUserSettings_8l;
    BOOL v31 = v4;
    [(HMCameraUserSettings *)v15 _sendSettingsUpdateMessage:v13 completion:v7 successHandler:v30];
  }
  else
  {
    __int16 v20 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v33 = v23;
      __int16 v34 = 2080;
      v35 = "-[HMCameraUserSettings updateReachabilityEventNotificationEnabled:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, void *))v7)[2](v7, v13);
  }
}

void __85__HMCameraUserSettings_updateReachabilityEventNotificationEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 notificationSettings];
  id v5 = (id)[v4 mutableCopy];

  [v5 setReachabilityEventNotificationEnabled:*(unsigned __int8 *)(a1 + 32)];
  [v3 setNotificationSettings:v5];
}

- (void)updateActivityZones:(id)a3 areActivityZonesIncludedForSignificantEventDetection:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  v57[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    uint64_t v35 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCameraUserSettings updateActivityZones:areActivityZonesIncludedForSignificantEventDetection:completionHandler:]", @"completion"];
    __int16 v36 = (void *)MEMORY[0x19F3A64A0]();
    v37 = self;
    v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v49 = v39;
      __int16 v50 = 2112;
      v51 = (const char *)v35;
      _os_log_impl(&dword_19D1A8000, v38, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v40 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v35 userInfo:0];
    objc_exception_throw(v40);
  }
  id v10 = (void (**)(void, void))v9;
  id v11 = [(HMCameraUserSettings *)self context];

  if (v11)
  {
    id v47 = 0;
    uint64_t v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v47];
    id v13 = (char *)v47;
    if (v12)
    {
      v56[0] = @"hmcus.azmk";
      v56[1] = @"hmcus.azifsedmk";
      v57[0] = v12;
      id v14 = [NSNumber numberWithBool:v6];
      v57[1] = v14;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];

      uint64_t v16 = (void *)MEMORY[0x1E4F654B0];
      id v17 = [(HMCameraUserSettings *)self messageDestination];
      id v18 = [v16 messageWithName:@"hmcus.azm" destination:v17 payload:v15];

      id v19 = (void *)MEMORY[0x19F3A64A0]();
      __int16 v20 = self;
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v43 = v13;
        v23 = id v22 = v8;
        [v18 shortDescription];
        v42 = v12;
        uint64_t v24 = (char *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        id v25 = v41 = v19;
        *(_DWORD *)buf = 138544130;
        v49 = v23;
        __int16 v50 = 2112;
        v51 = v24;
        __int16 v52 = 2112;
        id v53 = v22;
        __int16 v54 = 2112;
        v55 = v25;
        _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_INFO, "%{public}@Dispatching message %@ to update activity zones: %@ includedForSignificantEventDetection: %@", buf, 0x2Au);

        uint64_t v12 = v42;
        id v19 = v41;

        id v8 = v22;
        id v13 = v43;
      }

      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __115__HMCameraUserSettings_updateActivityZones_areActivityZonesIncludedForSignificantEventDetection_completionHandler___block_invoke;
      v44[3] = &unk_1E5942D10;
      id v45 = v8;
      BOOL v46 = v6;
      [(HMCameraUserSettings *)v20 _sendSettingsUpdateMessage:v18 completion:v10 successHandler:v44];
      BOOL v26 = v45;
    }
    else
    {
      BOOL v31 = (void *)MEMORY[0x19F3A64A0]();
      v32 = self;
      __int16 v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        __int16 v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v49 = v34;
        __int16 v50 = 2112;
        v51 = v13;
        _os_log_impl(&dword_19D1A8000, v33, OS_LOG_TYPE_INFO, "%{public}@Failed to serialize activity zones: %@", buf, 0x16u);
      }
      id v15 = [(HMCameraUserSettings *)v32 context];
      id v18 = [v15 delegateCaller];
      BOOL v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      [v18 callCompletion:v10 error:v26];
    }
  }
  else
  {
    v27 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v28 = self;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v49 = v30;
      __int16 v50 = 2080;
      v51 = "-[HMCameraUserSettings updateActivityZones:areActivityZonesIncludedForSignificantEventDetection:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, char *))v10)[2](v10, v13);
  }
}

void __115__HMCameraUserSettings_updateActivityZones_areActivityZonesIncludedForSignificantEventDetection_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setActivityZones:v3];
  [v4 setActivityZonesIncludedForSignificantEventDetection:*(unsigned __int8 *)(a1 + 40)];
}

- (void)updateAccessModeChangeNotificationEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v6)
  {
    uint64_t v24 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCameraUserSettings updateAccessModeChangeNotificationEnabled:completionHandler:]", @"completion"];
    id v25 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v26 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      __int16 v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v33 = v28;
      __int16 v34 = 2112;
      uint64_t v35 = (const char *)v24;
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v29 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v24 userInfo:0];
    objc_exception_throw(v29);
  }
  id v7 = (void (**)(void, void))v6;
  id v8 = [(HMCameraUserSettings *)self context];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F654B0];
    id v10 = [(HMCameraUserSettings *)self messageDestination];
    v38 = @"hmcus.amcnemk";
    id v11 = [NSNumber numberWithBool:v4];
    v39[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    id v13 = [v9 messageWithName:@"hmcus.amcnem" destination:v10 payload:v12];

    id v14 = (void *)MEMORY[0x19F3A64A0]();
    id v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = HMFGetLogIdentifier();
      id v18 = [v13 shortDescription];
      id v19 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      __int16 v33 = v17;
      __int16 v34 = 2112;
      uint64_t v35 = v18;
      __int16 v36 = 2112;
      v37 = v19;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_INFO, "%{public}@Dispatching message %@ to update accessModeChangeNotificationEnabled to %@", buf, 0x20u);
    }
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __84__HMCameraUserSettings_updateAccessModeChangeNotificationEnabled_completionHandler___block_invoke;
    v30[3] = &__block_descriptor_33_e38_v16__0___HMMutableCameraUserSettings_8l;
    BOOL v31 = v4;
    [(HMCameraUserSettings *)v15 _sendSettingsUpdateMessage:v13 completion:v7 successHandler:v30];
  }
  else
  {
    __int16 v20 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v33 = v23;
      __int16 v34 = 2080;
      uint64_t v35 = "-[HMCameraUserSettings updateAccessModeChangeNotificationEnabled:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, void *))v7)[2](v7, v13);
  }
}

void __84__HMCameraUserSettings_updateAccessModeChangeNotificationEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 notificationSettings];
  id v5 = (id)[v4 mutableCopy];

  [v5 setAccessModeChangeNotificationEnabled:*(unsigned __int8 *)(a1 + 32)];
  [v3 setNotificationSettings:v5];
}

- (void)updateRecordingAudioEnabled:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (!v5)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCameraUserSettings updateRecordingAudioEnabled:completionHandler:]", @"completion"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v20;
      __int16 v24 = 2112;
      id v25 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v6 = (void (**)(void, void))v5;
  id v7 = [(HMCameraUserSettings *)self context];

  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v11)
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v12;
      __int16 v24 = 2080;
      id v25 = "-[HMCameraUserSettings updateRecordingAudioEnabled:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@%s is no longer supported. See header for details", buf, 0x16u);
    }
    uint64_t v13 = 48;
  }
  else
  {
    if (v11)
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v14;
      __int16 v24 = 2080;
      id v25 = "-[HMCameraUserSettings updateRecordingAudioEnabled:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v13 = 12;
  }

  id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:v13];
  ((void (**)(void, void *))v6)[2](v6, v15);
}

- (void)updateNightVisionModeEnabled:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (!v5)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCameraUserSettings updateNightVisionModeEnabled:completionHandler:]", @"completion"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v20;
      __int16 v24 = 2112;
      id v25 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v6 = (void (**)(void, void))v5;
  id v7 = [(HMCameraUserSettings *)self context];

  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v11)
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v12;
      __int16 v24 = 2080;
      id v25 = "-[HMCameraUserSettings updateNightVisionModeEnabled:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@%s is no longer supported. See header for details", buf, 0x16u);
    }
    uint64_t v13 = 48;
  }
  else
  {
    if (v11)
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v14;
      __int16 v24 = 2080;
      id v25 = "-[HMCameraUserSettings updateNightVisionModeEnabled:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v13 = 12;
  }

  id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:v13];
  ((void (**)(void, void *))v6)[2](v6, v15);
}

- (void)updateSnapshotsAllowed:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (!v5)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCameraUserSettings updateSnapshotsAllowed:completionHandler:]", @"completion"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v20;
      __int16 v24 = 2112;
      id v25 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v6 = (void (**)(void, void))v5;
  id v7 = [(HMCameraUserSettings *)self context];

  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v11)
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v12;
      __int16 v24 = 2080;
      id v25 = "-[HMCameraUserSettings updateSnapshotsAllowed:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@%s is no longer supported. See header for details", buf, 0x16u);
    }
    uint64_t v13 = 48;
  }
  else
  {
    if (v11)
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v14;
      __int16 v24 = 2080;
      id v25 = "-[HMCameraUserSettings updateSnapshotsAllowed:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v13 = 12;
  }

  id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:v13];
  ((void (**)(void, void *))v6)[2](v6, v15);
}

- (void)updateAccessModeIndicatorEnabled:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (!v5)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCameraUserSettings updateAccessModeIndicatorEnabled:completionHandler:]", @"completion"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v20;
      __int16 v24 = 2112;
      id v25 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v6 = (void (**)(void, void))v5;
  id v7 = [(HMCameraUserSettings *)self context];

  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v11)
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v12;
      __int16 v24 = 2080;
      id v25 = "-[HMCameraUserSettings updateAccessModeIndicatorEnabled:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@%s is no longer supported. See header for details", buf, 0x16u);
    }
    uint64_t v13 = 48;
  }
  else
  {
    if (v11)
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v23 = v14;
      __int16 v24 = 2080;
      id v25 = "-[HMCameraUserSettings updateAccessModeIndicatorEnabled:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v13 = 12;
  }

  id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:v13];
  ((void (**)(void, void *))v6)[2](v6, v15);
}

- (void)updateRecordingEventTriggers:(unint64_t)a3 completionHandler:(id)a4
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v6)
  {
    uint64_t v31 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCameraUserSettings updateRecordingEventTriggers:completionHandler:]", @"completion"];
    v32 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v33 = self;
    __int16 v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v39 = v35;
      __int16 v40 = 2112;
      v41 = (const char *)v31;
      _os_log_impl(&dword_19D1A8000, v34, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v36 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v31 userInfo:0];
    objc_exception_throw(v36);
  }
  id v7 = (void (**)(void, void))v6;
  id v8 = [(HMCameraUserSettings *)self context];

  if (v8)
  {
    unint64_t v9 = a3 & 0xFFFFFFFFFFFFFFE0;
    if ((a3 & 0xFFFFFFFFFFFFFFE0) != 0)
    {
      id v10 = (void *)MEMORY[0x19F3A64A0]();
      BOOL v11 = self;
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v39 = v13;
        __int16 v40 = 2048;
        v41 = (const char *)v9;
        _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Invalid bit set in trigger: %lX", buf, 0x16u);
      }
      id v14 = [(HMCameraUserSettings *)v11 context];
      id v15 = [v14 delegateCaller];
      uint64_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      [v15 callCompletion:v7 error:v16];
    }
    else
    {
      id v21 = (void *)MEMORY[0x1E4F654B0];
      id v22 = [(HMCameraUserSettings *)self messageDestination];
      v44 = @"hmcus.rtk";
      id v23 = [NSNumber numberWithUnsignedInteger:a3];
      v45[0] = v23;
      __int16 v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
      id v14 = [v21 messageWithName:@"hmcus.rt" destination:v22 payload:v24];

      id v25 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v26 = self;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        __int16 v28 = HMFGetLogIdentifier();
        id v29 = [v14 shortDescription];
        uint64_t v30 = NSPrintF();
        *(_DWORD *)buf = 138543874;
        v39 = v28;
        __int16 v40 = 2112;
        v41 = v29;
        __int16 v42 = 2112;
        v43 = v30;
        _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_INFO, "%{public}@Dispatching message %@ to update recordingEventTriggers to %@", buf, 0x20u);
      }
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __71__HMCameraUserSettings_updateRecordingEventTriggers_completionHandler___block_invoke;
      v37[3] = &__block_descriptor_40_e38_v16__0___HMMutableCameraUserSettings_8l;
      v37[4] = a3;
      [(HMCameraUserSettings *)v26 _sendSettingsUpdateMessage:v14 completion:v7 successHandler:v37];
    }
  }
  else
  {
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v39 = v20;
      __int16 v40 = 2080;
      v41 = "-[HMCameraUserSettings updateRecordingEventTriggers:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, void *))v7)[2](v7, v14);
  }
}

uint64_t __71__HMCameraUserSettings_updateRecordingEventTriggers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setRecordingEventTriggers:*(void *)(a1 + 32)];
}

- (void)updateAccessMode:(unint64_t)a3 forCameraHomePresence:(unint64_t)a4 completionHandler:(id)a5
{
  v52[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (!v8)
  {
    uint64_t v35 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCameraUserSettings updateAccessMode:forCameraHomePresence:completionHandler:]", @"completion"];
    id v36 = (void *)MEMORY[0x19F3A64A0]();
    v37 = self;
    v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v44 = v39;
      __int16 v45 = 2112;
      BOOL v46 = (const char *)v35;
      _os_log_impl(&dword_19D1A8000, v38, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v40 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v35 userInfo:0];
    objc_exception_throw(v40);
  }
  unint64_t v9 = (void (**)(void, void))v8;
  id v10 = [(HMCameraUserSettings *)self context];

  if (v10)
  {
    if (a4 - 3 >= 2)
    {
      __int16 v28 = (void *)MEMORY[0x19F3A64A0]();
      id v29 = self;
      uint64_t v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = HMFGetLogIdentifier();
        HMCameraHomePresenceAsString(a4);
        v32 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v31;
        __int16 v45 = 2112;
        BOOL v46 = v32;
        _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_ERROR, "%{public}@Invalid camera home presence: %@", buf, 0x16u);
      }
      uint64_t v16 = [(HMCameraUserSettings *)v29 context];
      __int16 v33 = [v16 delegateCaller];
      __int16 v34 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      [v33 callCompletion:v9 error:v34];
    }
    else
    {
      BOOL v11 = (void *)MEMORY[0x1E4F654B0];
      uint64_t v12 = [(HMCameraUserSettings *)self messageDestination];
      v51[0] = @"hmcus.amk";
      uint64_t v13 = [NSNumber numberWithUnsignedInteger:a3];
      v52[0] = v13;
      v51[1] = @"hmcus.ptk";
      id v14 = [NSNumber numberWithUnsignedInteger:a4];
      v52[1] = v14;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];
      uint64_t v16 = [v11 messageWithName:@"hmcus.am" destination:v12 payload:v15];

      id v17 = (void *)MEMORY[0x19F3A64A0]();
      id v18 = self;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = HMFGetLogIdentifier();
        id v21 = [v16 shortDescription];
        id v22 = HMCameraHomePresenceAsString(a4);
        HMCameraAccessModeAsString(a3);
        id v23 = v41 = v17;
        *(_DWORD *)buf = 138544130;
        v44 = v20;
        __int16 v45 = 2112;
        BOOL v46 = v21;
        __int16 v47 = 2112;
        v48 = v22;
        __int16 v49 = 2112;
        __int16 v50 = v23;
        _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_INFO, "%{public}@Dispatching message %@ to update access mode for %@ to %@", buf, 0x2Au);

        id v17 = v41;
      }

      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __81__HMCameraUserSettings_updateAccessMode_forCameraHomePresence_completionHandler___block_invoke;
      v42[3] = &__block_descriptor_48_e38_v16__0___HMMutableCameraUserSettings_8l;
      v42[4] = a4;
      v42[5] = a3;
      [(HMCameraUserSettings *)v18 _sendSettingsUpdateMessage:v16 completion:v9 successHandler:v42];
    }
  }
  else
  {
    __int16 v24 = (void *)MEMORY[0x19F3A64A0]();
    id v25 = self;
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v44 = v27;
      __int16 v45 = 2080;
      BOOL v46 = "-[HMCameraUserSettings updateAccessMode:forCameraHomePresence:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, void *))v9)[2](v9, v16);
  }
}

void __81__HMCameraUserSettings_updateAccessMode_forCameraHomePresence_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4 == 4)
  {
    id v5 = v3;
    [v3 setAccessModeNotAtHome:*(void *)(a1 + 40)];
  }
  else
  {
    if (v4 != 3) {
      goto LABEL_6;
    }
    id v5 = v3;
    [v3 setAccessModeAtHome:*(void *)(a1 + 40)];
  }
  id v3 = v5;
LABEL_6:
}

- (void)updateAccessMode:(unint64_t)a3 forPresenceEventType:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (!v8)
  {
    uint64_t v23 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCameraUserSettings updateAccessMode:forPresenceEventType:completionHandler:]", @"completion"];
    __int16 v24 = (void *)MEMORY[0x19F3A64A0]();
    id v25 = self;
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v27;
      __int16 v31 = 2112;
      v32 = (const char *)v23;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v28 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v23 userInfo:0];
    objc_exception_throw(v28);
  }
  unint64_t v9 = (void (**)(void, void))v8;
  id v10 = [(HMCameraUserSettings *)self context];

  if (!v10)
  {
    BOOL v11 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v14;
      __int16 v31 = 2080;
      v32 = "-[HMCameraUserSettings updateAccessMode:forPresenceEventType:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    ((void (**)(void, void *))v9)[2](v9, v15);
    goto LABEL_11;
  }
  if (a4 - 3 >= 2)
  {
    uint64_t v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      HMPresenceEventTypeAsString(a4);
      __int16 v20 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v19;
      __int16 v31 = 2112;
      v32 = v20;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Invalid presence event type: %@", buf, 0x16u);
    }
    id v15 = [(HMCameraUserSettings *)v17 context];
    id v21 = [v15 delegateCaller];
    id v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v21 callCompletion:v9 error:v22];

LABEL_11:
    goto LABEL_12;
  }
  [(HMCameraUserSettings *)self updateAccessMode:a3 forCameraHomePresence:a4 completionHandler:v9];
LABEL_12:
}

- (unint64_t)accessModeForCameraHomePresence:(unint64_t)a3
{
  if (a3 == 4) {
    return [(HMCameraUserSettings *)self accessModeNotAtHome];
  }
  if (a3 == 3) {
    return [(HMCameraUserSettings *)self accessModeAtHome];
  }
  return 3;
}

- (HMCharacteristic)recordingAudioEnabledCharacteristic
{
  return (HMCharacteristic *)[(HMCameraUserSettings *)self _characteristicWithType:@"00000226-0000-1000-8000-0026BB765291" serviceType:@"00000204-0000-1000-8000-0026BB765291"];
}

- (HMCharacteristic)nightVisionModeEnabledCharacteristic
{
  return (HMCharacteristic *)[(HMCameraUserSettings *)self _characteristicWithType:@"0000011B-0000-1000-8000-0026BB765291" serviceType:@"0000021A-0000-1000-8000-0026BB765291"];
}

- (HMCharacteristic)accessModeIndicatorEnabledCharacteristic
{
  return (HMCharacteristic *)[(HMCameraUserSettings *)self _characteristicWithType:@"0000021D-0000-1000-8000-0026BB765291" serviceType:@"0000021A-0000-1000-8000-0026BB765291"];
}

- (HMCharacteristic)snapshotsAllowedCharacteristic
{
  return (HMCharacteristic *)[(HMCameraUserSettings *)self _characteristicWithType:@"00000223-0000-1000-8000-0026BB765291" serviceType:@"0000021A-0000-1000-8000-0026BB765291"];
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t38 != -1) {
    dispatch_once(&logCategory__hmf_once_t38, &__block_literal_global_37046);
  }
  v2 = (void *)logCategory__hmf_once_v39;

  return v2;
}

uint64_t __35__HMCameraUserSettings_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v39;
  logCategory__hmf_once_v39 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end