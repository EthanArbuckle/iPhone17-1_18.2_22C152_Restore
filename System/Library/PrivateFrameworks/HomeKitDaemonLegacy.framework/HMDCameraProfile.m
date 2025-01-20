@interface HMDCameraProfile
+ (BOOL)supportsSecureCoding;
+ (HMDCameraBulletinBoard)bulletinBoard;
+ (id)logCategory;
+ (void)setBulletinBoard:(id)a3;
- (BOOL)_areFaceClassificationsSuppressedForSignificantEvent:(id)a3;
- (BOOL)_shouldNotifyForSignificantEvent:(id)a3 homePresence:(id)a4;
- (BOOL)isCameraRecordingFeatureSupported;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMicrophonePresent;
- (BOOL)isSpeakerPresent;
- (HMDCameraClipManager)clipManager;
- (HMDCameraClipUserNotificationCenter)clipUserNotificationCenter;
- (HMDCameraProfile)initWithAccessory:(id)a3 services:(id)a4 msgDispatcher:(id)a5 workQueue:(id)a6 home:(id)a7 settingsManager:(id)a8;
- (HMDCameraProfile)initWithAccessory:(id)a3 services:(id)a4 recordingManagementService:(id)a5 msgDispatcher:(id)a6 workQueue:(id)a7 home:(id)a8 settingsManager:(id)a9 uniqueIdentifier:(id)a10 clipManager:(id)a11 clipUserNotificationCenter:(id)a12 reachabilityEventManager:(id)a13 networkMonitor:(id)a14 streamSnapshotHandler:(id)a15 snapshotManager:(id)a16 cameraStreamManagers:(id)a17 notificationCenter:(id)a18;
- (HMDCameraProfileSettingsManager)cameraSettingsManager;
- (HMDCameraRecordingManager)cameraRecordingManager;
- (HMDCameraRecordingReachabilityEventManager)reachabilityEventManager;
- (HMDCameraSnapshotManager)snapshotManager;
- (HMDCameraStreamSnapshotHandler)streamSnapshotHandler;
- (HMDHAPAccessory)hapAccessory;
- (HMDPredicateUtilities)predicateUtilities;
- (HMDService)recordingManagementService;
- (HMFNetMonitor)networkMonitor;
- (HMFTimer)recordingEventsCleanupTimer;
- (NSDictionary)assistantObject;
- (NSMutableArray)settingProactiveReaders;
- (NSNotificationCenter)notificationCenter;
- (NSSet)cameraStreamManagers;
- (NSString)description;
- (NSString)urlString;
- (_HMCameraUserSettings)currentSettings;
- (id)dumpState;
- (id)recordingEventsCleanupTimerFactory;
- (id)recordingManagerFactory;
- (unint64_t)hash;
- (void)_createCameraRecordingManager;
- (void)_handleNegotiateStreamRequest:(id)a3;
- (void)_handleStreamControlRequest:(id)a3;
- (void)_postNotificationForUpdatedSignificantEvent:(id)a3 homePresence:(id)a4;
- (void)_setControlSupport;
- (void)_setUpBulletinNotificationManagerObserver;
- (void)cameraSettingProactiveReaderDidCompleteRead:(id)a3;
- (void)clipManager:(id)a3 didDeleteClipWithUUID:(id)a4;
- (void)clipManager:(id)a3 didUpdateSignificantEvent:(id)a4 withHomePresence:(id)a5;
- (void)clipManagerDidDisableCloudStorage:(id)a3;
- (void)clipManagerDidEncounterDisabledCloudStorage:(id)a3;
- (void)clipManagerDidStart:(id)a3;
- (void)clipManagerDidStartUpCloudZone:(id)a3;
- (void)clipManagerDidStop:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleCameraProfileSettingsDidChangeNotification:(id)a3;
- (void)handleResidentsChangedNotification:(id)a3;
- (void)networkMonitorIsReachable:(id)a3;
- (void)networkMonitorIsUnreachable:(id)a3;
- (void)registerForMessages;
- (void)removeCloudData;
- (void)setCameraRecordingManager:(id)a3;
- (void)setPredicateUtilities:(id)a3;
- (void)setRecordingEventsCleanupTimer:(id)a3;
- (void)setRecordingEventsCleanupTimerFactory:(id)a3;
- (void)setRecordingManagerFactory:(id)a3;
- (void)setUp;
- (void)tearDownWithReplacementCameraProfile:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)unconfigure;
@end

@implementation HMDCameraProfile

- (unint64_t)hash
{
  v2 = [(HMDAccessoryProfile *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCameraProfile;
  [(HMDAccessoryProfile *)&v9 encodeWithCoder:v4];
  v5 = [(HMDCameraProfile *)self snapshotManager];
  v6 = [v5 encodedMostRecentSnapshot];

  if (v6) {
    [v4 encodeObject:v6 forKey:*MEMORY[0x1E4F2CC70]];
  }
  v7 = [(HMDCameraProfile *)self cameraSettingsManager];
  v8 = [v7 currentSettings];
  [v4 encodeObject:v8 forKey:*MEMORY[0x1E4F2CC78]];
}

- (_HMCameraUserSettings)currentSettings
{
  v2 = [(HMDCameraProfile *)self cameraSettingsManager];
  unint64_t v3 = [v2 currentSettings];

  return (_HMCameraUserSettings *)v3;
}

- (HMDCameraProfileSettingsManager)cameraSettingsManager
{
  return (HMDCameraProfileSettingsManager *)objc_getProperty(self, a2, 128, 1);
}

- (HMDCameraSnapshotManager)snapshotManager
{
  return (HMDCameraSnapshotManager *)objc_getProperty(self, a2, 96, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)assistantObject
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(HMDAccessoryProfile *)self accessory];
  id v4 = [v3 name];
  v5 = [v3 home];
  v6 = v5;
  if (v5 && ([v5 name], v7 = objc_claimAutoreleasedReturnValue(), v7, v7) && v4)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v29[0] = *MEMORY[0x1E4F96FE8];
    objc_super v9 = [(HMDCameraProfile *)self urlString];
    uint64_t v10 = *MEMORY[0x1E4F971A0];
    v29[1] = v9;
    v29[2] = v10;
    v28[2] = @"objectServiceType";
    v28[3] = @"objectHome";
    v11 = [v6 name];
    v29[3] = v11;
    v28[4] = @"objectHomeIdentifier";
    v12 = [v6 urlString];
    v29[4] = v12;
    v29[5] = self;
    v28[5] = @"objectReference";
    v28[6] = @"objectName";
    v29[6] = v4;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:7];
    v14 = (void *)[v8 initWithDictionary:v13];

    v15 = [v3 name];
    [v14 setObject:v15 forKey:@"objectAccessory"];

    v16 = [v3 urlString];
    [v14 setObject:v16 forKey:@"objectAccessoryIdentifier"];

    v17 = [v3 room];
    v18 = [v17 name];
    if (v18)
    {
      v19 = [v6 name];
      char v20 = [v18 isEqualToString:v19];

      if ((v20 & 1) == 0)
      {
        [v14 setObject:v18 forKey:@"objectRoom"];
        v21 = [v17 urlString];
        [v14 setObject:v21 forKey:@"objectRoomIdentifier"];
      }
    }
    v22 = (void *)[v14 copy];
  }
  else
  {
    v23 = (void *)MEMORY[0x1D9452090]();
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v26 = [v6 name];
      }
      else
      {
        v26 = 0;
      }
      *(_DWORD *)buf = 138544130;
      id v31 = v25;
      __int16 v32 = 2112;
      v33 = v6;
      __int16 v34 = 2112;
      v35 = v26;
      __int16 v36 = 2112;
      v37 = v4;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping because one of the properties of service is nil: service.accessory.home %@  service.accessory.home.name %@  service.name %@", buf, 0x2Au);
      if (v6) {
    }
      }
    v22 = 0;
  }

  return (NSDictionary *)v22;
}

- (NSString)urlString
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(HMDAccessoryProfile *)self services];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = [(HMDAccessoryProfile *)self services];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = NSString;
        v12 = [*(id *)(*((void *)&v17 + 1) + 8 * i) instanceID];
        v13 = [v11 stringWithFormat:@"%@", v12];
        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  v14 = [(HMDAccessoryProfile *)self uniqueIdentifier];
  v15 = hm_assistantIdentifierWithSalts();

  return (NSString *)v15;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_recordingManagerFactory, 0);
  objc_storeStrong(&self->_recordingEventsCleanupTimerFactory, 0);
  objc_storeStrong((id *)&self->_cameraRecordingManager, 0);
  objc_storeStrong((id *)&self->_predicateUtilities, 0);
  objc_storeStrong((id *)&self->_recordingEventsCleanupTimer, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_clipUserNotificationCenter, 0);
  objc_storeStrong((id *)&self->_reachabilityEventManager, 0);
  objc_storeStrong((id *)&self->_cameraSettingsManager, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_settingProactiveReaders, 0);
  objc_storeStrong((id *)&self->_streamSnapshotHandler, 0);
  objc_storeStrong((id *)&self->_snapshotManager, 0);
  objc_storeStrong((id *)&self->_cameraStreamManagers, 0);
  objc_destroyWeak((id *)&self->_hapAccessory);
  objc_storeStrong((id *)&self->_recordingManagementService, 0);
  objc_storeStrong((id *)&self->_clipManager, 0);
}

- (void)setRecordingManagerFactory:(id)a3
{
}

- (id)recordingManagerFactory
{
  return objc_getProperty(self, a2, 192, 1);
}

- (void)setRecordingEventsCleanupTimerFactory:(id)a3
{
}

- (id)recordingEventsCleanupTimerFactory
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void)setCameraRecordingManager:(id)a3
{
}

- (HMDCameraRecordingManager)cameraRecordingManager
{
  return (HMDCameraRecordingManager *)objc_getProperty(self, a2, 176, 1);
}

- (void)setPredicateUtilities:(id)a3
{
}

- (HMDPredicateUtilities)predicateUtilities
{
  return (HMDPredicateUtilities *)objc_getProperty(self, a2, 168, 1);
}

- (void)setRecordingEventsCleanupTimer:(id)a3
{
}

- (HMFTimer)recordingEventsCleanupTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 160, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 152, 1);
}

- (HMDCameraClipUserNotificationCenter)clipUserNotificationCenter
{
  return (HMDCameraClipUserNotificationCenter *)objc_getProperty(self, a2, 144, 1);
}

- (HMDCameraRecordingReachabilityEventManager)reachabilityEventManager
{
  return (HMDCameraRecordingReachabilityEventManager *)objc_getProperty(self, a2, 136, 1);
}

- (HMFNetMonitor)networkMonitor
{
  return (HMFNetMonitor *)objc_getProperty(self, a2, 120, 1);
}

- (NSMutableArray)settingProactiveReaders
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (HMDCameraStreamSnapshotHandler)streamSnapshotHandler
{
  return (HMDCameraStreamSnapshotHandler *)objc_getProperty(self, a2, 104, 1);
}

- (NSSet)cameraStreamManagers
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (HMDHAPAccessory)hapAccessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hapAccessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (HMDService)recordingManagementService
{
  return (HMDService *)objc_getProperty(self, a2, 72, 1);
}

- (HMDCameraClipManager)clipManager
{
  return (HMDCameraClipManager *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)isSpeakerPresent
{
  return self->_speakerPresent;
}

- (BOOL)isMicrophonePresent
{
  return self->_microphonePresent;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraProfile *)self recordingEventsCleanupTimer];

  if (v6 == v4)
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    uint64_t v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Performing recording events cleanup due to timer firing", (uint8_t *)&v13, 0xCu);
    }
    v11 = [(HMDCameraProfile *)v8 clipManager];
    [v11 cleanUpClips];

    v12 = [(HMDCameraProfile *)v8 reachabilityEventManager];
    [v12 cleanUpEvents];
  }
}

- (void)networkMonitorIsUnreachable:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAccessoryProfile *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__HMDCameraProfile_networkMonitorIsUnreachable___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__HMDCameraProfile_networkMonitorIsUnreachable___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) reachabilityEventManager];
  [v2 networkMonitorIsUnreachable:*(void *)(a1 + 40)];
}

- (void)networkMonitorIsReachable:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAccessoryProfile *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__HMDCameraProfile_networkMonitorIsReachable___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __46__HMDCameraProfile_networkMonitorIsReachable___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) reachabilityEventManager];
  [v2 networkMonitorIsReachable:*(void *)(a1 + 40)];
}

- (void)clipManagerDidEncounterDisabledCloudStorage:(id)a3
{
  id v4 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(HMDCameraProfile *)self cameraSettingsManager];
  [v5 synchronizeCloudStorageWithRecordingAccessModes];
}

- (void)clipManagerDidDisableCloudStorage:(id)a3
{
  id v4 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(HMDCameraProfile *)self cameraSettingsManager];
  [v5 disableRecordingAccessModes];
}

- (void)clipManagerDidStop:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraProfile *)self cameraRecordingManager];
  [v6 clipManagerDidStop:v4];

  uint64_t v7 = [(HMDCameraProfile *)self reachabilityEventManager];
  [v7 clipManagerDidStop:v4];

  [(HMDCameraProfile *)self setRecordingEventsCleanupTimer:0];
  id v8 = [(HMDCameraProfile *)self clipUserNotificationCenter];
  [v8 removeEventNotificationsForCameraProfile:self];
}

- (void)clipManagerDidStartUpCloudZone:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraProfile *)self cameraRecordingManager];
  [v6 clipManagerDidStartUpCloudZone:v4];
}

- (void)clipManagerDidStart:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraProfile *)self reachabilityEventManager];
  [v6 clipManagerDidStart:v4];

  uint64_t v7 = [(HMDCameraProfile *)self recordingEventsCleanupTimerFactory];
  id v8 = v7[2](v7, 4, 86400.0);
  [(HMDCameraProfile *)self setRecordingEventsCleanupTimer:v8];

  uint64_t v9 = [(HMDCameraProfile *)self recordingEventsCleanupTimer];
  [v9 setDelegate:self];

  uint64_t v10 = [(HMDAccessoryProfile *)self workQueue];
  v11 = [(HMDCameraProfile *)self recordingEventsCleanupTimer];
  [v11 setDelegateQueue:v10];

  id v12 = [(HMDCameraProfile *)self recordingEventsCleanupTimer];
  [v12 resume];
}

- (void)clipManager:(id)a3 didDeleteClipWithUUID:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(HMDCameraProfile *)self clipUserNotificationCenter];
  [v7 removeEventNotificationForClipWithUUID:v5];
}

- (void)clipManager:(id)a3 didUpdateSignificantEvent:(id)a4 withHomePresence:(id)a5
{
  id v7 = a5;
  id v11 = a4;
  id v8 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(HMDCameraProfile *)self hapAccessory];
  uint64_t v10 = [v9 doorbellChimeController];
  [v10 handleUpdatedPersonIdentificationInformation];

  [(HMDCameraProfile *)self _postLocalNotificationForUpdatedSignificantEvent:v11];
  [(HMDCameraProfile *)self _postNotificationForUpdatedSignificantEvent:v11 homePresence:v7];
}

- (void)handleResidentsChangedNotification:(id)a3
{
  id v4 = [(HMDAccessoryProfile *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__HMDCameraProfile_handleResidentsChangedNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __55__HMDCameraProfile_handleResidentsChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createCameraRecordingManager];
}

- (void)handleCameraProfileSettingsDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 userInfo];

  id v7 = [v6 objectForKeyedSubscript:@"HMDCameraProfileSettingsNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v10 = v8;

  uint64_t v9 = v10;
  if (v10)
  {
    __updateClipManagerWriteAccess(self, v10);
    uint64_t v9 = v10;
  }
}

- (BOOL)isEqual:(id)a3
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
  if (v6)
  {
    id v7 = [(HMDAccessoryProfile *)self uniqueIdentifier];
    id v8 = [v6 uniqueIdentifier];
    if ([v7 isEqual:v8])
    {
      uint64_t v9 = [(HMDCameraProfile *)self cameraStreamManagers];
      id v10 = [v6 cameraStreamManagers];
      if ([v9 isEqualToSet:v10])
      {
        id v11 = [(HMDCameraProfile *)self recordingManagementService];
        id v12 = [v6 recordingManagementService];
        char v13 = HMFEqualObjects();
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void)cameraSettingProactiveReaderDidCompleteRead:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraProfile *)self settingProactiveReaders];
  [v6 removeObject:v4];
}

- (void)_handleStreamControlRequest:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    id v10 = [v4 name];
    id v11 = [v4 messagePayload];
    *(_DWORD *)buf = 138543874;
    v57 = v9;
    __int16 v58 = 2112;
    v59 = v10;
    __int16 v60 = 2112;
    v61 = v11;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling %@ message with payload: %@", buf, 0x20u);
  }
  id v12 = [v4 stringForKey:@"kCameraSessionID"];
  if (v12)
  {
    char v13 = [(HMDCameraProfile *)v7 settingProactiveReaders];
    v14 = (void *)[v13 copy];

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v51;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v51 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          if ([v20 hasPendingNegotiateMessageForSessionWithIdentifier:v12])
          {
            [v20 handleMessage:v4];
            v37 = v15;
            goto LABEL_30;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v50 objects:v55 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
    id v42 = v15;
    v43 = v4;

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v45 = v7;
    obuint64_t j = [(HMDCameraProfile *)v7 cameraStreamManagers];
    uint64_t v21 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v47;
      while (2)
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v47 != v23) {
            objc_enumerationMutation(obj);
          }
          id v25 = *(void **)(*((void *)&v46 + 1) + 8 * j);
          v26 = (void *)MEMORY[0x1D9452090]();
          v27 = v45;
          v28 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v29 = HMFGetLogIdentifier();
            v30 = [v25 streamSessionID];
            *(_DWORD *)buf = 138543874;
            v57 = v29;
            __int16 v58 = 2112;
            v59 = v30;
            __int16 v60 = 2112;
            v61 = v12;
            _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Checking if stream message handler's session ID %@ matches with given %@", buf, 0x20u);
          }
          id v31 = [v25 streamSessionID];
          int v32 = [v31 isEqual:v12];

          if (v32)
          {
            id v4 = v43;
            [v25 handleMessage:v43];
            id v15 = v42;
            v37 = obj;
            goto LABEL_30;
          }
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    v33 = (void *)MEMORY[0x1D9452090]();
    __int16 v34 = v45;
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      __int16 v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v57 = v36;
      __int16 v58 = 2112;
      v59 = v12;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Did not find the stream with Session ID %@", buf, 0x16u);
    }
    v37 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    id v4 = v43;
    [v43 respondWithError:v37];
    id v15 = v42;
LABEL_30:
  }
  else
  {
    uint64_t v38 = (void *)MEMORY[0x1D9452090]();
    v39 = v7;
    v40 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v57 = v41;
      _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_ERROR, "%{public}@Stream session ID is not present in start request", buf, 0xCu);
    }
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v4 respondWithError:v15];
  }
}

- (void)_handleNegotiateStreamRequest:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [[HMDCameraMetricsMilestone alloc] initWithKey:@"ReceivedNegotiationRequest" timestamp:+[HMDCameraSessionID uptimeInMilliseconds]];
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = [v4 messagePayload];
    *(_DWORD *)buf = 138543618;
    v70 = v10;
    __int16 v71 = 2114;
    v72 = v11;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling negotiate stream request message payload: %{public}@", buf, 0x16u);
  }
  id v12 = [v4 stringForKey:@"kCameraSessionID"];
  if (v12)
  {
    uint64_t v68 = objc_opt_class();
    char v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
    v14 = [v4 unarchivedObjectForKey:@"kCameraSessionPreference" ofClasses:v13];
    id v15 = v14;
    if (v14) {
      id v16 = v14;
    }
    else {
      id v16 = objc_alloc_init(MEMORY[0x1E4F2E758]);
    }
    uint64_t v21 = v16;

    if ([v4 isEntitledForSPIAccess]
      && [v21 shouldTakeOwnershipOfExistingStream])
    {
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      uint64_t v22 = [(HMDCameraProfile *)v8 cameraStreamManagers];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v61 objects:v67 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v62;
        while (2)
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v62 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v61 + 1) + 8 * i);
            if ([v27 hasStreamSessionShowingOnCurrentDevice])
            {
              [v27 takeOwnershipOfStreamUsingMessage:v4];
              goto LABEL_45;
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v61 objects:v67 count:16];
          if (v24) {
            continue;
          }
          break;
        }
      }
    }
    long long v52 = v12;
    uint64_t v22 = [(HMDCameraProfile *)v8 hapAccessory];
    if ([v22 isReachable])
    {
      long long v55 = 0uLL;
      long long v56 = 0uLL;
      long long v53 = 0uLL;
      long long v54 = 0uLL;
      v28 = [(HMDCameraProfile *)v8 cameraStreamManagers];
      uint64_t v29 = [v28 countByEnumeratingWithState:&v53 objects:v65 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v54;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v54 != v31) {
              objc_enumerationMutation(v28);
            }
            [*(id *)(*((void *)&v53 + 1) + 8 * j) setNegotiationMilestone:v6];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v53 objects:v65 count:16];
        }
        while (v30);
      }

      v33 = [HMDCameraSettingProactiveReader alloc];
      __int16 v34 = [(HMDAccessoryProfile *)v8 workQueue];
      v35 = [(HMDCameraProfile *)v8 cameraStreamManagers];
      __int16 v36 = [(HMDAccessoryProfile *)v8 logIdentifier];
      id v12 = v52;
      v37 = [(HMDCameraSettingProactiveReader *)v33 initWithWorkQueue:v34 sessionID:v52 accessory:v22 message:v4 streamControlMessageHandlers:v35 streamPreferences:v21 logIdentifier:v36];

      uint64_t v38 = [(HMDCameraProfile *)v8 settingProactiveReaders];
      [v38 addObject:v37];

      [(HMDCameraSettingProactiveReader *)v37 setDelegate:v8];
      [(HMDCameraSettingProactiveReader *)v37 readSetting];
    }
    else
    {
      long long v59 = 0uLL;
      long long v60 = 0uLL;
      long long v57 = 0uLL;
      long long v58 = 0uLL;
      v37 = [(HMDCameraProfile *)v8 cameraStreamManagers];
      uint64_t v39 = [(HMDCameraSettingProactiveReader *)v37 countByEnumeratingWithState:&v57 objects:v66 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v58;
        while (2)
        {
          for (uint64_t k = 0; k != v40; ++k)
          {
            if (*(void *)v58 != v41) {
              objc_enumerationMutation(v37);
            }
            v43 = *(void **)(*((void *)&v57 + 1) + 8 * k);
            if (([v43 hasStreamSession] & 1) == 0)
            {
              long long v48 = (void *)MEMORY[0x1D9452090]();
              long long v49 = v8;
              long long v50 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
              {
                long long v51 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v70 = v51;
                __int16 v71 = 2112;
                v72 = v43;
                _os_log_impl(&dword_1D49D5000, v50, OS_LOG_TYPE_INFO, "%{public}@Accessory is not reachable, routing request to camera streaming service: %@", buf, 0x16u);
              }
              [v43 setNegotiationMilestone:v6];
              [v43 handleMessage:v4];
              id v12 = v52;
              goto LABEL_44;
            }
          }
          uint64_t v40 = [(HMDCameraSettingProactiveReader *)v37 countByEnumeratingWithState:&v57 objects:v66 count:16];
          if (v40) {
            continue;
          }
          break;
        }
      }

      v44 = (void *)MEMORY[0x1D9452090]();
      v45 = v8;
      long long v46 = HMFGetOSLogHandle();
      id v12 = v52;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        long long v47 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v70 = v47;
        _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not reachable and cannot route request to a camera streaming service", buf, 0xCu);
      }
      v37 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1019];
      [v4 respondWithError:v37];
    }
LABEL_44:

LABEL_45:
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1D9452090]();
    uint64_t v18 = v8;
    long long v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      long long v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v70 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Stream session ID is not present in negotiate request", buf, 0xCu);
    }
    uint64_t v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v4 respondWithError:v21];
  }
}

- (void)_postNotificationForUpdatedSignificantEvent:(id)a3 homePresence:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(HMDCameraProfile *)self clipUserNotificationCenter];
  id v10 = [v9 bulletinForClipSignificantEvent:v6 cameraProfile:self];

  if (v10)
  {
    id v11 = [(id)objc_opt_class() bulletinBoard];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__HMDCameraProfile__postNotificationForUpdatedSignificantEvent_homePresence___block_invoke;
    v12[3] = &unk_1E6A16410;
    v12[4] = self;
    id v13 = v10;
    id v14 = v6;
    id v15 = v7;
    [v11 updateDoorbellPressNotificationsWithSignificantEventBulletin:v13 completion:v12];
  }
}

void __77__HMDCameraProfile__postNotificationForUpdatedSignificantEvent_homePresence___block_invoke(id *a1, char a2)
{
  id v4 = [a1[4] workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__HMDCameraProfile__postNotificationForUpdatedSignificantEvent_homePresence___block_invoke_2;
  block[3] = &unk_1E6A154B0;
  char v12 = a2;
  id v5 = a1[5];
  id v6 = a1[4];
  id v8 = v5;
  id v9 = v6;
  id v10 = a1[6];
  id v11 = a1[7];
  dispatch_async(v4, block);
}

void __77__HMDCameraProfile__postNotificationForUpdatedSignificantEvent_homePresence___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 64)
    && ([*(id *)(a1 + 32) significantEvents],
        id v2 = objc_claimAutoreleasedReturnValue(),
        int v3 = objc_msgSend(v2, "na_allObjectsPassTest:", &__block_literal_global_112_154446),
        v2,
        v3))
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 40);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      id v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Not posting notification since we found recent doorbell bulletin(s) to update for significant event: %@", buf, 0x16u);
    }
  }
  else if ([*(id *)(a1 + 40) _shouldNotifyForSignificantEvent:*(void *)(a1 + 48) homePresence:*(void *)(a1 + 56)])
  {
    id v9 = [*(id *)(a1 + 40) clipUserNotificationCenter];
    [v9 postNotificationForBulletin:*(void *)(a1 + 32) significantEvent:*(void *)(a1 + 48)];
  }
}

BOOL __77__HMDCameraProfile__postNotificationForUpdatedSignificantEvent_homePresence___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 reason] == 1 || objc_msgSend(v2, "reason") == 2;

  return v3;
}

- (BOOL)_shouldNotifyForSignificantEvent:(id)a3 homePresence:(id)a4
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(HMDCameraProfile *)self clipUserNotificationCenter];

  if (!v9)
  {
LABEL_9:
    LOBYTE(v28) = 0;
    goto LABEL_27;
  }
  id v10 = [(HMDCameraProfile *)self currentSettings];
  id v11 = [v10 notificationSettings];
  char v12 = [v11 isSmartBulletinBoardNotificationEnabled];

  if ((v12 & 1) == 0)
  {
    uint64_t v23 = (void *)MEMORY[0x1D9452090]();
    uint64_t v24 = self;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v26 = HMFGetLogIdentifier();
      v27 = [v6 uniqueIdentifier];
      *(_DWORD *)buf = 138543618;
      v66 = v26;
      __int16 v67 = 2112;
      uint64_t v68 = v27;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Not notifying for significant event %@ because smart notification bulletin is disabled", buf, 0x16u);
    }
    goto LABEL_9;
  }
  uint64_t v13 = [(HMDCameraProfile *)self currentSettings];
  uint64_t v14 = [v13 notificationSettings];
  id v15 = [v14 smartBulletinBoardNotificationCondition];

  if (v15)
  {
    id v16 = [(HMDCameraProfile *)self hapAccessory];
    uint64_t v17 = [v16 home];

    long long v62 = v17;
    uint64_t v18 = [v17 currentUser];
    long long v19 = [(HMDCameraProfile *)self predicateUtilities];
    id v20 = v6;
    id v21 = v15;
    id v64 = v7;
    id v61 = v18;
    id v22 = v19;
    if ([v20 reason] == 6)
    {
      [v22 setCameraSignificantEvent:31];
    }
    else
    {
      __int16 v34 = (void *)MEMORY[0x1E4F1CAD0];
      v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "reason"));
      __int16 v36 = [v34 setWithObject:v35];
      [v22 setCameraSignificantEvent:HMCameraSignificantEventTypesFromReasons()];
    }
    if ([v20 reason] == 2)
    {
      v37 = [v20 faceClassification];
      uint64_t v38 = [v37 person];
      uint64_t v39 = [v38 name];

      if (v39)
      {
        uint64_t v40 = 4;
      }
      else
      {
        uint64_t v41 = [v20 faceClassification];

        if (v41) {
          uint64_t v40 = 2;
        }
        else {
          uint64_t v40 = 1;
        }
      }
    }
    else
    {
      uint64_t v40 = 7;
    }
    [v22 setPersonFamiliarityOptions:v40];
    long long v60 = v21;
    id v42 = [v22 rewritePredicate:v21 currentCharacteristicInPredicate:0 characteristicsToRead:0 homePresence:v64];
    [v42 allowEvaluation];
    __int16 v71 = @"THIS_OBJECT";
    v72[0] = v22;
    v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:&v71 count:1];
    int v63 = [v42 evaluateWithObject:v22 substitutionVariables:v43];

    v44 = (void *)MEMORY[0x1D9452090]();
    v45 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      long long v46 = v59 = v15;
      HMFBooleanToString();
      id v47 = v6;
      v49 = id v48 = v7;
      *(_DWORD *)buf = 138543874;
      v66 = v46;
      __int16 v67 = 2112;
      uint64_t v68 = v42;
      __int16 v69 = 2112;
      v70 = v49;
      _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_INFO, "%{public}@Evaluated predicate: %@ with result: %@", buf, 0x20u);

      id v7 = v48;
      id v6 = v47;

      id v15 = v59;
    }

    BOOL v28 = [(HMDCameraProfile *)self _areFaceClassificationsSuppressedForSignificantEvent:v20] & v63;
    long long v50 = (void *)MEMORY[0x1D9452090]();
    long long v51 = self;
    long long v52 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v54 = id v53 = v7;
      [v20 uniqueIdentifier];
      v56 = long long v55 = v15;
      long long v57 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      v66 = v54;
      __int16 v67 = 2112;
      uint64_t v68 = v56;
      __int16 v69 = 2112;
      v70 = v57;
      _os_log_impl(&dword_1D49D5000, v52, OS_LOG_TYPE_INFO, "%{public}@Determined should add notification for significant event %@: %@", buf, 0x20u);

      id v15 = v55;
      id v7 = v53;
    }
  }
  else
  {
    uint64_t v29 = (void *)MEMORY[0x1D9452090]();
    uint64_t v30 = self;
    uint64_t v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      int v32 = HMFGetLogIdentifier();
      v33 = [v6 uniqueIdentifier];
      *(_DWORD *)buf = 138543618;
      v66 = v32;
      __int16 v67 = 2112;
      uint64_t v68 = v33;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Notifying for significant event %@ because smart notification bulletin condition is nil", buf, 0x16u);
    }
    LOBYTE(v28) = 1;
  }

LABEL_27:
  return v28;
}

- (BOOL)_areFaceClassificationsSuppressedForSignificantEvent:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 faceClassification];
  id v6 = [v5 person];

  id v7 = [(HMDAccessoryProfile *)self accessory];
  uint64_t v8 = [v7 home];
  id v9 = [v8 currentUser];
  id v10 = [v9 personSettingsManager];

  if (!v6 || !v10) {
    goto LABEL_6;
  }
  id v11 = [v6 UUID];
  int v12 = [v10 areClassificationNotificationsEnabledForPersonUUID:v11];

  uint64_t v13 = (void *)MEMORY[0x1D9452090]();
  uint64_t v14 = self;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = HMFGetLogIdentifier();
    uint64_t v17 = HMFBooleanToString();
    int v19 = 138543874;
    id v20 = v16;
    __int16 v21 = 2112;
    id v22 = v17;
    __int16 v23 = 2112;
    uint64_t v24 = v6;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Classification notifications enabled is %@ for person: %@", (uint8_t *)&v19, 0x20u);
  }
  if (v12) {
LABEL_6:
  }
    LOBYTE(v12) = 1;

  return v12;
}

- (void)registerForMessages
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v64 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Registering for messages", buf, 0xCu);
  }
  uint64_t v8 = [(HMDAccessoryProfile *)v5 accessory];
  id v9 = [v8 home];
  id v10 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v9 userPrivilege:0 remoteAccessRequired:1 requiresCameraStreamingAccess:1];

  id v11 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  int v12 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  v62[0] = v10;
  v62[1] = v11;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
  uint64_t v14 = [(HMDAccessoryProfile *)v5 msgDispatcher];
  [v14 registerForMessage:*MEMORY[0x1E4F2CD38] receiver:v5 policies:v13 selector:sel__handleNegotiateStreamRequest_];

  id v15 = [(HMDAccessoryProfile *)v5 msgDispatcher];
  [v15 registerForMessage:*MEMORY[0x1E4F2CD50] receiver:v5 policies:v13 selector:sel__handleStreamControlRequest_];

  id v16 = [(HMDAccessoryProfile *)v5 msgDispatcher];
  [v16 registerForMessage:*MEMORY[0x1E4F2CD40] receiver:v5 policies:v13 selector:sel__handleStreamControlRequest_];

  v61[0] = v10;
  v61[1] = v12;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
  uint64_t v18 = [(HMDAccessoryProfile *)v5 msgDispatcher];
  [v18 registerForMessage:*MEMORY[0x1E4F2CD48] receiver:v5 policies:v17 selector:sel__handleStreamControlRequest_];

  int v19 = [(HMDAccessoryProfile *)v5 msgDispatcher];
  [v19 registerForMessage:*MEMORY[0x1E4F2CD60] receiver:v5 policies:v17 selector:sel__handleStreamControlRequest_];

  id v20 = +[HMDDeviceCapabilities deviceCapabilities];
  if ([v20 isResidentCapable])
  {
  }
  else
  {
    BOOL v21 = isiOSDevice();

    if (!v21) {
      goto LABEL_7;
    }
  }
  id v22 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  objc_msgSend(v22, "setRoles:", objc_msgSend(v22, "roles") | 6);
  __int16 v23 = (void *)[v22 copy];
  v60[0] = v10;
  v60[1] = v23;
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
  [(HMDAccessoryProfile *)v5 msgDispatcher];
  uint64_t v25 = v12;
  v27 = v26 = v11;
  [v27 registerForMessage:@"kNegotitateRemoteStreamRequestKey" receiver:v5 policies:v24 selector:sel__handleNegotiateStreamRequest_];

  id v11 = v26;
  int v12 = v25;
  BOOL v28 = [(HMDAccessoryProfile *)v5 msgDispatcher];
  [v28 registerForMessage:@"kStartRemoteStreamRequestKey" receiver:v5 policies:v24 selector:sel__handleStreamControlRequest_];

  uint64_t v29 = [(HMDAccessoryProfile *)v5 msgDispatcher];
  [v29 registerForMessage:@"kStopRemoteStreamRequestKey" receiver:v5 policies:v24 selector:sel__handleStreamControlRequest_];

  uint64_t v30 = [(HMDAccessoryProfile *)v5 msgDispatcher];
  [v30 registerForMessage:@"kReconfigureRemoteStreamRequestKey" receiver:v5 policies:v24 selector:sel__handleStreamControlRequest_];

LABEL_7:
  uint64_t v31 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  v59[0] = v10;
  v59[1] = v31;
  int v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
  v33 = [(HMDAccessoryProfile *)v5 msgDispatcher];
  [v33 registerForMessage:@"kStreamRemoteConnectionSetupNotificationKey" receiver:v5 policies:v32 selector:sel__handleStreamControlRequest_];

  __int16 v34 = [(HMDAccessoryProfile *)v5 msgDispatcher];
  [v34 registerForMessage:@"kStreamStoppedRemoteNotificationKey" receiver:v5 policies:v32 selector:sel__handleStreamControlRequest_];

  v35 = [(HMDCameraProfile *)v5 snapshotManager];
  [v35 registerForMessages];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  __int16 v36 = [(HMDCameraProfile *)v5 cameraStreamManagers];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v55 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        id v42 = [(HMDAccessoryProfile *)v5 msgDispatcher];
        [v41 configureWithMessageDispatcher:v42];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v38);
  }

  v43 = [(HMDCameraProfile *)v5 hapAccessory];
  v44 = [v43 home];
  v45 = [(HMDCameraProfile *)v5 notificationCenter];
  [v45 addObserver:v5 selector:sel_handleCameraProfileSettingsDidChangeNotification_ name:@"HMDCameraProfileSettingsDidChangeNotification" object:v43];

  long long v46 = [(HMDCameraProfile *)v5 notificationCenter];
  id v47 = [v44 residentDeviceManager];
  [v46 addObserver:v5 selector:sel_handleResidentsChangedNotification_ name:@"HMDResidentDeviceManagerAddResidentNotification" object:v47];

  id v48 = [(HMDCameraProfile *)v5 notificationCenter];
  long long v49 = [v44 residentDeviceManager];
  [v48 addObserver:v5 selector:sel_handleResidentsChangedNotification_ name:@"HMDResidentDeviceManagerUpdateResidentNotification" object:v49];

  long long v50 = [(HMDCameraProfile *)v5 notificationCenter];
  long long v51 = [v44 residentDeviceManager];
  [v50 addObserver:v5 selector:sel_handleResidentsChangedNotification_ name:@"HMDResidentDeviceManagerRemoveResidentNotification" object:v51];

  long long v52 = [(HMDCameraProfile *)v5 cameraSettingsManager];
  [v52 start];

  [(HMDCameraProfile *)v5 _createCameraRecordingManager];
  [(HMDCameraProfile *)v5 _setUpBulletinNotificationManagerObserver];
  id v53 = [(HMDCameraProfile *)v5 currentSettings];
  __updateClipManagerWriteAccess(v5, v53);
}

- (void)_setControlSupport
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obuint64_t j = [(HMDAccessoryProfile *)self services];
  uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    uint64_t v6 = *MEMORY[0x1E4F2DE90];
    uint64_t v7 = *MEMORY[0x1E4F2DEC0];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = [v9 serviceType];
        char v11 = [v10 isEqualToString:v6];

        int v12 = &OBJC_IVAR___HMDCameraProfile__microphonePresent;
        if ((v11 & 1) == 0)
        {
          uint64_t v13 = [v9 serviceType];
          int v14 = [v13 isEqualToString:v7];

          int v12 = &OBJC_IVAR___HMDCameraProfile__speakerPresent;
          if (!v14) {
            continue;
          }
        }
        *((unsigned char *)&self->super.super.super.isa + *v12) = 1;
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
}

- (id)dumpState
{
  v15.receiver = self;
  v15.super_class = (Class)HMDCameraProfile;
  uint64_t v3 = [(HMDAccessoryProfile *)&v15 dumpState];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(HMDAccessoryProfile *)self workQueue];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  char v11 = __29__HMDCameraProfile_dumpState__block_invoke;
  int v12 = &unk_1E6A197C8;
  id v13 = v4;
  int v14 = self;
  id v6 = v4;
  dispatch_sync(v5, &v9);

  uint64_t v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);
  return v7;
}

void __29__HMDCameraProfile_dumpState__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) clipManager];
  uint64_t v3 = [v2 stateDump];
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:@"Clip Manager"];

  uint64_t v4 = [*(id *)(a1 + 40) cameraStreamManagers];
  uint64_t v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_91);
  id v6 = [v5 allObjects];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:@"Stream Managers"];

  id v8 = [*(id *)(a1 + 40) cameraRecordingManager];
  uint64_t v7 = [v8 stateDump];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:@"Recording Manager"];
}

uint64_t __29__HMDCameraProfile_dumpState__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 stateDump];
}

- (void)dealloc
{
  uint64_t v3 = [(HMDAccessoryProfile *)self msgDispatcher];
  [v3 deregisterReceiver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDCameraProfile;
  [(HMDCameraProfile *)&v4 dealloc];
}

- (void)unconfigure
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDCameraProfile *)self hapAccessory];
  objc_super v4 = [v3 home];
  uint64_t v5 = v4;
  if (v3 && [v4 isCurrentDeviceAvailableResident])
  {
    id v6 = [v5 notificationRegistry];
    uint64_t v7 = [v3 uuid];
    v10[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v6 disableReachabilityEventNotificationForAccessoryUUIDs:v8 forUserID:0];
  }
  uint64_t v9 = [(HMDCameraProfile *)self notificationCenter];
  [v9 postNotificationName:@"HMDCameraProfileUnconfiguredNotification" object:self];
}

- (void)removeCloudData
{
  v5.receiver = self;
  v5.super_class = (Class)HMDCameraProfile;
  [(HMDAccessoryProfile *)&v5 removeCloudData];
  uint64_t v3 = [(HMDAccessoryProfile *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__HMDCameraProfile_removeCloudData__block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __35__HMDCameraProfile_removeCloudData__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  objc_super v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_super v5 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Removing all cloud data", (uint8_t *)&v9, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) clipManager];
  id v7 = (id)[v6 remove];

  id v8 = [*(id *)(a1 + 32) cameraSettingsManager];
  [v8 remove];
}

- (NSString)description
{
  id v3 = NSString;
  objc_super v4 = [(HMDAccessoryProfile *)self accessory];
  objc_super v5 = [v4 name];
  id v6 = [(HMDAccessoryProfile *)self uniqueIdentifier];
  id v7 = [v3 stringWithFormat:@"Camera Profile %@, %@", v5, v6];

  return (NSString *)v7;
}

- (void)_setUpBulletinNotificationManagerObserver
{
  id v2 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v2);
}

- (void)_createCameraRecordingManager
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v3);

  objc_super v4 = [(HMDCameraProfile *)self recordingManagementService];

  if (v4)
  {
    objc_super v5 = [(HMDAccessoryProfile *)self accessory];
    id v6 = [v5 home];
    char v7 = [v6 isOwnerUser];

    id v8 = [(HMDCameraProfile *)self hapAccessory];
    int v9 = [v8 home];
    int v10 = [v9 isCurrentDeviceAvailableResident];

    uint64_t v11 = [(HMDCameraProfile *)self cameraRecordingManager];

    if (v10 && (v7 & 1) != 0)
    {
      if (!v11)
      {
        int v12 = (void *)MEMORY[0x1D9452090]();
        id v13 = self;
        int v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          objc_super v15 = HMFGetLogIdentifier();
          int v29 = 138543362;
          uint64_t v30 = v15;
          _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Creating camera recording manager", (uint8_t *)&v29, 0xCu);
        }
        long long v16 = [(HMDCameraProfile *)v13 recordingManagerFactory];
        long long v17 = [(HMDCameraProfile *)v13 recordingManagementService];
        long long v18 = ((void (**)(void, HMDCameraProfile *, void *))v16)[2](v16, v13, v17);
        [(HMDCameraProfile *)v13 setCameraRecordingManager:v18];

        long long v19 = [(HMDCameraProfile *)v13 cameraRecordingManager];
        [v19 start];
      }
    }
    else if (v11)
    {
      uint64_t v24 = (void *)MEMORY[0x1D9452090]();
      uint64_t v25 = self;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = HMFGetLogIdentifier();
        int v29 = 138543362;
        uint64_t v30 = v27;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Destroying camera recording manager", (uint8_t *)&v29, 0xCu);
      }
      BOOL v28 = [(HMDCameraProfile *)v25 cameraRecordingManager];
      [v28 shutDown];

      [(HMDCameraProfile *)v25 setCameraRecordingManager:0];
    }
  }
  else
  {
    id v20 = (void *)MEMORY[0x1D9452090]();
    uint64_t v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = HMFGetLogIdentifier();
      int v29 = 138543362;
      uint64_t v30 = v23;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Not configuring for recording because there is no recording service", (uint8_t *)&v29, 0xCu);
    }
  }
}

- (void)tearDownWithReplacementCameraProfile:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDCameraProfile *)self isCameraRecordingFeatureSupported]
    && ([v4 isCameraRecordingFeatureSupported] & 1) == 0)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    char v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      int v10 = [(HMDCameraProfile *)v7 recordingManagementService];
      int v13 = 138543618;
      int v14 = v9;
      __int16 v15 = 2112;
      long long v16 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing clip data because we have a recording management service %@ and we are transitioning to a replacement camera profile that does not", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v11 = [(HMDCameraProfile *)v7 clipManager];
    id v12 = (id)[v11 remove];
  }
}

- (void)setUp
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDAccessoryProfile *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDAccessoryProfile *)self accessory];
  objc_super v5 = v4;
  if (v4)
  {
    id v6 = [v4 home];
    if (v6)
    {
      char v7 = [(HMDCameraProfile *)self networkMonitor];
      [v7 setDelegate:self];

      id v8 = [(HMDCameraProfile *)self clipManager];
      [v8 setDelegate:self];

      int v9 = [(HMDCameraProfile *)self clipManager];
      [v9 configure];

      int v10 = [(HMDCameraProfile *)self clipUserNotificationCenter];
      [v10 removeCachedHeroFrameImages];

      uint64_t v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = self;
      int v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = HMFGetLogIdentifier();
        __int16 v15 = [(HMDCameraProfile *)v12 cameraSettingsManager];
        long long v16 = [v15 zoneName];
        int v34 = 138543618;
        v35 = v14;
        __int16 v36 = 2112;
        uint64_t v37 = v16;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Using zone %@ for camera settings", (uint8_t *)&v34, 0x16u);
      }
      uint64_t v17 = [(HMDCameraProfile *)v12 cameraSettingsManager];
      long long v18 = [v5 msgDispatcher];
      long long v19 = [v6 administratorHandler];
      id v20 = +[HMDDeviceCapabilities deviceCapabilities];
      objc_msgSend(v17, "configureWithMessageDispatcher:adminMessageDispatcher:deviceIsResidentCapable:", v18, v19, objc_msgSend(v20, "isResidentCapable"));

      uint64_t v21 = [(HMDCameraProfile *)v12 reachabilityEventManager];
      id v22 = [(HMDAccessoryProfile *)v12 msgDispatcher];
      __int16 v23 = [(HMDCameraProfile *)v12 currentSettings];
      uint64_t v24 = [v6 isCurrentDeviceConfirmedPrimaryResident];
      uint64_t v25 = [(HMDCameraProfile *)v12 networkMonitor];
      objc_msgSend(v21, "configureWithMessageDispatcher:currentSettings:isCurrentDeviceConfirmedPrimaryResident:isCurrentDeviceConnectedToNetwork:", v22, v23, v24, objc_msgSend(v25, "isReachable"));
    }
    else
    {
      uint64_t v30 = (void *)MEMORY[0x1D9452090]();
      uint64_t v31 = self;
      int v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = HMFGetLogIdentifier();
        int v34 = 138543362;
        v35 = v33;
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@Skipping camera profile setup because home reference is nil", (uint8_t *)&v34, 0xCu);
      }
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x1D9452090]();
    v27 = self;
    BOOL v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      int v29 = HMFGetLogIdentifier();
      int v34 = 138543362;
      v35 = v29;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Skipping camera profile setup because accessory reference is nil", (uint8_t *)&v34, 0xCu);
    }
  }
}

- (BOOL)isCameraRecordingFeatureSupported
{
  id v2 = [(HMDCameraProfile *)self recordingManagementService];
  BOOL v3 = v2 != 0;

  return v3;
}

- (HMDCameraProfile)initWithAccessory:(id)a3 services:(id)a4 recordingManagementService:(id)a5 msgDispatcher:(id)a6 workQueue:(id)a7 home:(id)a8 settingsManager:(id)a9 uniqueIdentifier:(id)a10 clipManager:(id)a11 clipUserNotificationCenter:(id)a12 reachabilityEventManager:(id)a13 networkMonitor:(id)a14 streamSnapshotHandler:(id)a15 snapshotManager:(id)a16 cameraStreamManagers:(id)a17 notificationCenter:(id)a18
{
  id v56 = a3;
  id v55 = a4;
  id v47 = a5;
  id v54 = a5;
  obuint64_t j = a6;
  id v60 = a6;
  id v22 = a7;
  id v23 = a8;
  id v53 = a9;
  id v57 = a10;
  id v24 = a11;
  id v52 = a12;
  id v25 = a13;
  id v26 = a14;
  id v27 = a15;
  id v28 = a16;
  id v59 = a17;
  id v29 = a18;
  if (!v56)
  {
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  long long v50 = v24;
  uint64_t v30 = v55;
  if (!v55)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (!v60)
  {
LABEL_17:
    _HMFPreconditionFailure();
    goto LABEL_18;
  }
  long long v49 = v25;
  if (!v22)
  {
LABEL_18:
    _HMFPreconditionFailure();
    goto LABEL_19;
  }
  if (!v23)
  {
LABEL_19:
    _HMFPreconditionFailure();
    goto LABEL_20;
  }
  uint64_t v31 = v22;
  int v32 = v57;
  if (!v57)
  {
LABEL_20:
    _HMFPreconditionFailure();
    goto LABEL_21;
  }
  if (!v26)
  {
LABEL_21:
    _HMFPreconditionFailure();
    goto LABEL_22;
  }
  if (!v27)
  {
LABEL_22:
    _HMFPreconditionFailure();
    goto LABEL_23;
  }
  if (!v28)
  {
LABEL_23:
    _HMFPreconditionFailure();
    goto LABEL_24;
  }
  if (!v59)
  {
LABEL_24:
    _HMFPreconditionFailure();
    goto LABEL_25;
  }
  v33 = v29;
  if (!v29)
  {
LABEL_25:
    uint64_t v45 = _HMFPreconditionFailure();
    return (HMDCameraProfile *)__293__HMDCameraProfile_initWithAccessory_services_recordingManagementService_msgDispatcher_workQueue_home_settingsManager_uniqueIdentifier_clipManager_clipUserNotificationCenter_reachabilityEventManager_networkMonitor_streamSnapshotHandler_snapshotManager_cameraStreamManagers_notificationCenter___block_invoke_2(v45);
  }
  id v48 = v27;
  int v34 = [v55 allObjects];
  v61.receiver = self;
  v61.super_class = (Class)HMDCameraProfile;
  v35 = [(HMDAccessoryProfile *)&v61 initWithAccessory:v56 uniqueIdentifier:v57 services:v34 workQueue:v31];

  if (v35)
  {
    objc_storeWeak((id *)&v35->_hapAccessory, v56);
    __int16 v36 = [HMDPredicateUtilities alloc];
    uint64_t v37 = [(HMDAccessoryProfile *)v35 logIdentifier];
    uint64_t v38 = [(HMDPredicateUtilities *)v36 initWithHome:v23 logIdentifier:v37];
    predicateUtilities = v35->_predicateUtilities;
    v35->_predicateUtilities = (HMDPredicateUtilities *)v38;

    uint64_t v30 = v55;
    int v32 = v57;
    objc_storeStrong((id *)&v35->super._msgDispatcher, obj);
    objc_storeStrong((id *)&v35->_recordingManagementService, v47);
    objc_storeStrong((id *)&v35->_networkMonitor, a14);
    objc_storeStrong((id *)&v35->_streamSnapshotHandler, a15);
    objc_storeStrong((id *)&v35->_snapshotManager, a16);
    objc_storeStrong((id *)&v35->_cameraStreamManagers, a17);
    uint64_t v40 = [MEMORY[0x1E4F1CA48] array];
    settingProactiveReaders = v35->_settingProactiveReaders;
    v35->_settingProactiveReaders = (NSMutableArray *)v40;

    objc_storeStrong((id *)&v35->_cameraSettingsManager, a9);
    objc_storeStrong((id *)&v35->_clipManager, a11);
    objc_storeStrong((id *)&v35->_clipUserNotificationCenter, a12);
    objc_storeStrong((id *)&v35->_reachabilityEventManager, a13);
    objc_storeStrong((id *)&v35->_notificationCenter, a18);
    [(HMDCameraProfile *)v35 _setControlSupport];
    id recordingEventsCleanupTimerFactory = v35->_recordingEventsCleanupTimerFactory;
    v35->_id recordingEventsCleanupTimerFactory = &__block_literal_global_154506;

    id recordingManagerFactory = v35->_recordingManagerFactory;
    v35->_id recordingManagerFactory = &__block_literal_global_64_154507;
  }
  return v35;
}

HMDCameraRecordingManager *__293__HMDCameraProfile_initWithAccessory_services_recordingManagementService_msgDispatcher_workQueue_home_settingsManager_uniqueIdentifier_clipManager_clipUserNotificationCenter_reachabilityEventManager_networkMonitor_streamSnapshotHandler_snapshotManager_cameraStreamManagers_notificationCenter___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[HMDCameraRecordingManager alloc] initWithCamera:v5 recordingManagementService:v4];

  return v6;
}

id __293__HMDCameraProfile_initWithAccessory_services_recordingManagementService_msgDispatcher_workQueue_home_settingsManager_uniqueIdentifier_clipManager_clipUserNotificationCenter_reachabilityEventManager_networkMonitor_streamSnapshotHandler_snapshotManager_cameraStreamManagers_notificationCenter___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:a3 options:a1];
  return v3;
}

- (HMDCameraProfile)initWithAccessory:(id)a3 services:(id)a4 msgDispatcher:(id)a5 workQueue:(id)a6 home:(id)a7 settingsManager:(id)a8
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v87 = v14;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_42;
  }
  if (!v15)
  {
LABEL_42:
    _HMFPreconditionFailure();
    goto LABEL_43;
  }
  if (!v16)
  {
LABEL_43:
    _HMFPreconditionFailure();
    goto LABEL_44;
  }
  if (!v17)
  {
LABEL_44:
    _HMFPreconditionFailure();
LABEL_45:
    _HMFPreconditionFailure();
  }
  if (!v18) {
    goto LABEL_45;
  }
  id v81 = v17;
  v84 = self;
  v86 = v19;
  v90 = v18;
  id v20 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v21 = [MEMORY[0x1E4F1CA80] set];
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  obuint64_t j = v15;
  uint64_t v22 = [obj countByEnumeratingWithState:&v108 objects:v114 count:16];
  v91 = v16;
  if (!v22)
  {
    v92 = 0;
    goto LABEL_21;
  }
  uint64_t v23 = v22;
  v92 = 0;
  uint64_t v24 = *(void *)v109;
  uint64_t v25 = *MEMORY[0x1E4F2DDE8];
  uint64_t v26 = *MEMORY[0x1E4F2DDF0];
  do
  {
    for (uint64_t i = 0; i != v23; ++i)
    {
      if (*(void *)v109 != v24) {
        objc_enumerationMutation(obj);
      }
      id v28 = *(void **)(*((void *)&v108 + 1) + 8 * i);
      id v29 = [v28 serviceType];
      int v30 = [v29 isEqualToString:v25];

      if (v30)
      {
        uint64_t v31 = v20;
      }
      else
      {
        int v32 = [v28 serviceType];
        int v33 = [v32 isEqualToString:v26];

        if (v33)
        {
          id v34 = v28;

          v92 = v34;
          continue;
        }
        uint64_t v31 = v21;
      }
      [v31 addObject:v28];
    }
    uint64_t v23 = [obj countByEnumeratingWithState:&v108 objects:v114 count:16];
  }
  while (v23);
LABEL_21:

  v35 = [MEMORY[0x1E4F1CA48] array];
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v36 = v20;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v104 objects:v113 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v105;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v105 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = NSString;
        id v42 = [*(id *)(*((void *)&v104 + 1) + 8 * j) instanceID];
        v43 = [v41 stringWithFormat:@"%@", v42];
        [v35 addObject:v43];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v104 objects:v113 count:16];
    }
    while (v38);
  }

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v44 = v21;
  uint64_t v45 = [v44 countByEnumeratingWithState:&v100 objects:v112 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v101;
    do
    {
      for (uint64_t k = 0; k != v46; ++k)
      {
        if (*(void *)v101 != v47) {
          objc_enumerationMutation(v44);
        }
        long long v49 = NSString;
        long long v50 = [*(id *)(*((void *)&v100 + 1) + 8 * k) instanceID];
        long long v51 = [v49 stringWithFormat:@"%@", v50];
        [v35 addObject:v51];
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v100 objects:v112 count:16];
    }
    while (v46);
  }

  uint64_t v52 = [v35 sortedArrayUsingSelector:sel_compare_];
  id v53 = (void *)MEMORY[0x1E4F29128];
  id v54 = [v87 uuid];
  v83 = (void *)v52;
  id v55 = objc_msgSend(v53, "hm_deriveUUIDFromBaseUUID:withSalts:", v54, v52);

  id v56 = NSString;
  id v57 = [v90 name];
  long long v58 = [v87 name];
  v89 = [v56 stringWithFormat:@"%@/%@/%@", v57, v58, v55];

  if (v92)
  {
    id v59 = (void *)MEMORY[0x1E4F2E6F8];
    id v60 = [v92 uuid];
    objc_super v61 = [v59 zoneNameForRecordingManagementServiceUUID:v60];

    long long v62 = v81;
    v85 = [[HMDCameraClipManager alloc] initWithHome:v90 zoneName:v61 messageDispatcher:v91 workQueue:v81 cameraProfileUUID:v55];
    int v63 = +[HMDCameraProfile bulletinBoard];
    id v64 = v63;
    if (v63) {
      int v63 = [[HMDCameraClipUserNotificationCenter alloc] initWithBulletinBoard:v63 workQueue:v81 logIdentifier:v89];
    }
    uint64_t v65 = v87;
    v77 = v63;
    v78 = [[HMDCameraRecordingReachabilityEventManager alloc] initWithHAPAccessory:v87 workQueue:v81];

    v66 = v91;
  }
  else
  {
    v77 = 0;
    v78 = 0;
    v85 = 0;
    v66 = v91;
    uint64_t v65 = v87;
    long long v62 = v81;
  }
  id v67 = objc_alloc_init(MEMORY[0x1E4F654C8]);
  uint64_t v68 = [HMDCameraStreamSnapshotHandler alloc];
  __int16 v69 = [v36 allObjects];
  v70 = [(HMDCameraStreamSnapshotHandler *)v68 initWithWorkQueue:v62 services:v69 logIdentifier:v89];

  v88 = [[HMDCameraSnapshotManager alloc] initWithAccessory:v65 workQueue:v62 streamSnapshotHandler:v70 uniqueIdentifier:v55 msgDispatcher:v66 networkMonitor:v67];
  v94[0] = MEMORY[0x1E4F143A8];
  v94[1] = 3221225472;
  v94[2] = __92__HMDCameraProfile_initWithAccessory_services_msgDispatcher_workQueue_home_settingsManager___block_invoke;
  v94[3] = &unk_1E6A13DA8;
  id v95 = v62;
  v96 = v70;
  id v97 = v65;
  id v98 = v55;
  id v99 = v67;
  id v79 = v67;
  id v71 = v55;
  id v72 = v65;
  v80 = v70;
  id v82 = v62;
  uint64_t v73 = objc_msgSend(v36, "na_map:", v94);
  v74 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v75 = objc_retain(-[HMDCameraProfile initWithAccessory:services:recordingManagementService:msgDispatcher:workQueue:home:settingsManager:uniqueIdentifier:clipManager:clipUserNotificationCenter:reachabilityEventManager:networkMonitor:streamSnapshotHandler:snapshotManager:cameraStreamManagers:notificationCenter:](v84, "initWithAccessory:services:recordingManagementService:msgDispatcher:workQueue:home:settingsManager:uniqueIdentifier:clipManager:clipUserNotificationCenter:reachabilityEventManager:networkMonitor:streamSnapshotHandler:snapshotManager:cameraStreamManagers:notificationCenter:", v72, v44, v92, v91, v82, v90, v86, v71, v85, v77, v78, v79, v80, v88,
            v73,
            v74));

  return v75;
}

HMDCameraStreamControlMessageHandler *__92__HMDCameraProfile_initWithAccessory_services_msgDispatcher_workQueue_home_settingsManager___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [[HMDCameraStreamControlMessageHandler alloc] initWithWorkQueue:a1[4] streamSnapshotHandler:a1[5] accessory:a1[6] streamManagementService:v3 profileUniqueIdentifier:a1[7] networkMonitor:a1[8]];

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_154564 != -1) {
    dispatch_once(&logCategory__hmf_once_t8_154564, &__block_literal_global_72_154565);
  }
  id v2 = (void *)logCategory__hmf_once_v9_154566;
  return v2;
}

uint64_t __31__HMDCameraProfile_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v9_154566;
  logCategory__hmf_once_v9_154566 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (void)setBulletinBoard:(id)a3
{
}

+ (HMDCameraBulletinBoard)bulletinBoard
{
  id v2 = (void *)_bulletinBoard;
  if (!_bulletinBoard)
  {
    if (bulletinBoard_onceToken != -1) {
      dispatch_once(&bulletinBoard_onceToken, &__block_literal_global_69_154571);
    }
    id v2 = (void *)_bulletinBoard;
  }
  return (HMDCameraBulletinBoard *)v2;
}

uint64_t __33__HMDCameraProfile_bulletinBoard__block_invoke()
{
  uint64_t v0 = +[HMDBulletinBoard sharedBulletinBoard];
  uint64_t v1 = _bulletinBoard;
  _bulletinBoard = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end