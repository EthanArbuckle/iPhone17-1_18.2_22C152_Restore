@interface HMCameraProfile
+ (id)logCategory;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMCameraAudioControl)microphoneControl;
- (HMCameraAudioControl)speakerControl;
- (HMCameraClipManager)clipManager;
- (HMCameraProfile)initWithCameraProfile:(id)a3;
- (HMCameraProfileUserSettingsDelegate)userSettingsDelegate;
- (HMCameraRecordingEventManager)recordingEventManager;
- (HMCameraRecordingReachabilityEventManager)reachabilityEventManager;
- (HMCameraSettingsControl)settingsControl;
- (HMCameraSnapshotControl)snapshotControl;
- (HMCameraStreamControl)streamControl;
- (HMCameraUserSettings)userSettings;
- (id)logIdentifier;
- (id)services;
- (void)setMicrophoneControl:(id)a3;
- (void)setSettingsControl:(id)a3;
- (void)setSnapshotControl:(id)a3;
- (void)setSpeakerControl:(id)a3;
- (void)setStreamControl:(id)a3;
- (void)setUserSettingsDelegate:(id)a3;
@end

@implementation HMCameraProfile

- (HMCameraStreamControl)streamControl
{
  return self->_streamControl;
}

- (HMCameraSnapshotControl)snapshotControl
{
  return self->_snapshotControl;
}

- (HMCameraAudioControl)speakerControl
{
  return self->_speakerControl;
}

- (HMCameraAudioControl)microphoneControl
{
  return self->_microphoneControl;
}

- (HMCameraUserSettings)userSettings
{
  v2 = [(HMCameraProfile *)self cameraProfile];
  v3 = [v2 userSettings];

  return (HMCameraUserSettings *)v3;
}

- (HMCameraProfile)initWithCameraProfile:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HMCameraProfile;
  v5 = [(HMAccessoryProfile *)&v30 initWithAccessoryProfile:v4];
  if (v5)
  {
    v6 = [HMCameraStreamControl alloc];
    v7 = [v4 streamControl];
    uint64_t v8 = [(HMCameraStreamControl *)v6 initWithStreamControl:v7];
    streamControl = v5->_streamControl;
    v5->_streamControl = (HMCameraStreamControl *)v8;

    v10 = [HMCameraSnapshotControl alloc];
    v11 = [v4 snapshotControl];
    uint64_t v12 = [(HMCameraSnapshotControl *)v10 initWithSnapshotControl:v11];
    snapshotControl = v5->_snapshotControl;
    v5->_snapshotControl = (HMCameraSnapshotControl *)v12;

    v14 = [v4 settingsControl];

    if (v14)
    {
      v15 = [HMCameraSettingsControl alloc];
      v16 = [v4 settingsControl];
      uint64_t v17 = [(HMCameraSettingsControl *)v15 initWithSettingsControl:v16];
      settingsControl = v5->_settingsControl;
      v5->_settingsControl = (HMCameraSettingsControl *)v17;
    }
    v19 = [v4 microphoneControl];

    if (v19)
    {
      v20 = [HMCameraAudioControl alloc];
      v21 = [v4 microphoneControl];
      uint64_t v22 = [(HMCameraAudioControl *)v20 initWithAudioControl:v21];
      microphoneControl = v5->_microphoneControl;
      v5->_microphoneControl = (HMCameraAudioControl *)v22;
    }
    v24 = [v4 speakerControl];

    if (v24)
    {
      v25 = [HMCameraAudioControl alloc];
      v26 = [v4 speakerControl];
      uint64_t v27 = [(HMCameraAudioControl *)v25 initWithAudioControl:v26];
      speakerControl = v5->_speakerControl;
      v5->_speakerControl = (HMCameraAudioControl *)v27;
    }
  }

  return v5;
}

uint64_t __53___HMCameraProfile___configureWithContext_accessory___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:@"00000204-0000-1000-8000-0026BB765291"];

  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_userSettingsDelegate);
  objc_storeStrong((id *)&self->_microphoneControl, 0);
  objc_storeStrong((id *)&self->_speakerControl, 0);
  objc_storeStrong((id *)&self->_settingsControl, 0);
  objc_storeStrong((id *)&self->_snapshotControl, 0);

  objc_storeStrong((id *)&self->_streamControl, 0);
}

- (void)setUserSettingsDelegate:(id)a3
{
}

- (HMCameraProfileUserSettingsDelegate)userSettingsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userSettingsDelegate);

  return (HMCameraProfileUserSettingsDelegate *)WeakRetained;
}

- (void)setMicrophoneControl:(id)a3
{
}

- (void)setSpeakerControl:(id)a3
{
}

- (void)setSettingsControl:(id)a3
{
}

- (HMCameraSettingsControl)settingsControl
{
  return self->_settingsControl;
}

- (void)setSnapshotControl:(id)a3
{
}

- (void)setStreamControl:(id)a3
{
}

- (id)logIdentifier
{
  if (isInternalBuild())
  {
    uint64_t v3 = NSString;
    id v4 = [(HMAccessoryProfile *)self uniqueIdentifier];
    v5 = [v4 UUIDString];
    v6 = [(HMAccessoryProfile *)self accessory];
    v7 = [v6 name];
    uint64_t v8 = [v3 stringWithFormat:@"%@/%@", v5, v7];
  }
  else
  {
    id v4 = [(HMAccessoryProfile *)self uniqueIdentifier];
    uint64_t v8 = [v4 UUIDString];
  }

  return v8;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = [(HMCameraProfile *)self snapshotControl];
    uint64_t v8 = [v7 snapshotControl];
    v9 = [v6 snapshotControl];
    v10 = [v9 snapshotControl];
    [v8 mergeNewSnapshotControl:v10];

    v11 = [v6 userSettings];
    uint64_t v12 = [(HMCameraProfile *)self userSettings];

    if (v12)
    {
      v13 = [(HMCameraProfile *)self userSettings];
      [v13 _mergeNewSettings:v11];
    }
    else
    {
      v14 = (void *)MEMORY[0x19F3A64A0]();
      v15 = self;
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v28 = v17;
        __int16 v29 = 2112;
        objc_super v30 = v11;
        _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@No existing camera settings to merge; adding new settings: %@",
          buf,
          0x16u);
      }
      v18 = [(HMCameraProfile *)v15 cameraProfile];
      [v18 addUserSettings:v11];

      v19 = [(HMCameraProfile *)v15 userSettingsDelegate];
      if (objc_opt_respondsToSelector())
      {
        v20 = [(HMCameraProfile *)v15 cameraProfile];
        v21 = [v20 context];
        uint64_t v22 = [v21 delegateCaller];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __38__HMCameraProfile_mergeFromNewObject___block_invoke;
        v24[3] = &unk_1E5945628;
        id v25 = v19;
        v26 = v15;
        [v22 invokeBlock:v24];
      }
    }
  }
  return 0;
}

void __38__HMCameraProfile_mergeFromNewObject___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  id v3 = [v2 userSettings];
  [v1 cameraProfile:v2 didAddUserSettings:v3];
}

- (id)services
{
  v2 = [(HMCameraProfile *)self cameraProfile];
  id v3 = [v2 services];

  return v3;
}

- (HMCameraRecordingEventManager)recordingEventManager
{
  v2 = [(HMCameraProfile *)self cameraProfile];
  id v3 = [v2 recordingEventManager];

  return (HMCameraRecordingEventManager *)v3;
}

- (HMCameraRecordingReachabilityEventManager)reachabilityEventManager
{
  v2 = [(HMCameraProfile *)self cameraProfile];
  id v3 = [v2 reachabilityEventManager];

  return (HMCameraRecordingReachabilityEventManager *)v3;
}

- (HMCameraClipManager)clipManager
{
  v2 = [(HMCameraProfile *)self cameraProfile];
  id v3 = [v2 clipManager];

  return (HMCameraClipManager *)v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_28163 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_28163, &__block_literal_global_28164);
  }
  v2 = (void *)logCategory__hmf_once_v3_28165;

  return v2;
}

uint64_t __30__HMCameraProfile_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v3_28165;
  logCategory__hmf_once_v3_28165 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end