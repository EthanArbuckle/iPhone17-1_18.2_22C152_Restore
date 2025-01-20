@interface _HMCameraProfile
+ (BOOL)supportsSecureCoding;
- (HMCameraClipManager)clipManager;
- (HMCameraRecordingEventManager)recordingEventManager;
- (HMCameraRecordingReachabilityEventManager)reachabilityEventManager;
- (HMCameraUserSettings)userSettings;
- (NSArray)controls;
- (_HMCameraAudioControl)microphoneControl;
- (_HMCameraAudioControl)speakerControl;
- (_HMCameraProfile)initWithCoder:(id)a3;
- (_HMCameraProfile)initWithUUID:(id)a3 services:(id)a4 mostRecentSnapshot:(id)a5 userSettings:(id)a6;
- (_HMCameraSettingsControl)settingsControl;
- (_HMCameraSnapshotControl)snapshotControl;
- (_HMCameraStreamControl)streamControl;
- (void)__configureWithContext:(id)a3 accessory:(id)a4;
- (void)addUserSettings:(id)a3;
- (void)setClipManager:(id)a3;
- (void)setReachabilityEventManager:(id)a3;
- (void)setRecordingEventManager:(id)a3;
- (void)setUserSettings:(id)a3;
@end

@implementation _HMCameraProfile

- (_HMCameraProfile)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[_HMAccessoryProfile alloc] initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:5];
    v8 = objc_msgSend(v6, "setWithArray:", v7, v16, v17, v18, v19);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"HMCP.ck.mostRecentSnapshot"];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMCP.ck.userSettings"];
    if (v10) {
      v11 = [[HMCameraUserSettings alloc] initWithCameraUserSettings:v10];
    }
    else {
      v11 = 0;
    }
    v13 = [(_HMAccessoryProfile *)v5 profileUniqueIdentifier];
    v14 = [(_HMAccessoryProfile *)v5 services];
    self = [(_HMCameraProfile *)self initWithUUID:v13 services:v14 mostRecentSnapshot:v9 userSettings:v11];

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)__configureWithContext:(id)a3 accessory:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)_HMCameraProfile;
  [(_HMAccessoryProfile *)&v34 __configureWithContext:v6 accessory:v7];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v8 = [(_HMCameraProfile *)self controls];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v12++), "__configureWithContext:", v6);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v10);
  }

  v13 = [(_HMCameraProfile *)self userSettings];
  [v13 configureWithAccessory:v7 context:v6];

  v14 = [v7 services];
  v15 = objc_msgSend(v14, "hmf_objectPassingTest:", &__block_literal_global_26324);

  if (v15)
  {
    uint64_t v16 = [v15 uuid];
    uint64_t v17 = +[HMCameraClipManager zoneNameForRecordingManagementServiceUUID:v16];

    uint64_t v18 = [HMCameraClipManager alloc];
    uint64_t v19 = [(_HMAccessoryProfile *)self profileUniqueIdentifier];
    uint64_t v20 = [(HMCameraClipManager *)v18 initWithContext:v6 profileUniqueIdentifier:v19 zoneName:v17];
    [(_HMCameraProfile *)self setClipManager:v20];

    uint64_t v21 = [(_HMCameraProfile *)self clipManager];
    [v21 configure];

    v22 = [HMCameraRecordingReachabilityEventManager alloc];
    v23 = [v7 uuid];
    v24 = [(HMCameraRecordingReachabilityEventManager *)v22 initWithContext:v6 uniqueIdentifier:v23];
    [(_HMCameraProfile *)self setReachabilityEventManager:v24];

    v25 = [(_HMCameraProfile *)self reachabilityEventManager];
    [v25 configure];

    v26 = [HMCameraRecordingEventManager alloc];
    v27 = [(_HMCameraProfile *)self clipManager];
    v28 = [(_HMCameraProfile *)self reachabilityEventManager];
    v29 = [(HMCameraRecordingEventManager *)v26 initWithContext:v6 clipManager:v27 reachabilityEventManager:v28];
    [(_HMCameraProfile *)self setRecordingEventManager:v29];
  }
}

- (HMCameraUserSettings)userSettings
{
  return (HMCameraUserSettings *)objc_getProperty(self, a2, 112, 1);
}

- (HMCameraRecordingReachabilityEventManager)reachabilityEventManager
{
  return (HMCameraRecordingReachabilityEventManager *)objc_getProperty(self, a2, 128, 1);
}

- (HMCameraClipManager)clipManager
{
  return (HMCameraClipManager *)objc_getProperty(self, a2, 120, 1);
}

- (void)setRecordingEventManager:(id)a3
{
}

- (void)setReachabilityEventManager:(id)a3
{
}

- (void)setClipManager:(id)a3
{
}

- (NSArray)controls
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(_HMCameraProfile *)self streamControl];
  [v3 addObject:v4];

  v5 = [(_HMCameraProfile *)self snapshotControl];
  [v3 addObject:v5];

  id v6 = [(_HMCameraProfile *)self settingsControl];

  if (v6)
  {
    id v7 = [(_HMCameraProfile *)self settingsControl];
    [v3 addObject:v7];
  }
  v8 = [(_HMCameraProfile *)self microphoneControl];

  if (v8)
  {
    uint64_t v9 = [(_HMCameraProfile *)self microphoneControl];
    [v3 addObject:v9];
  }
  uint64_t v10 = [(_HMCameraProfile *)self speakerControl];

  if (v10)
  {
    uint64_t v11 = [(_HMCameraProfile *)self speakerControl];
    [v3 addObject:v11];
  }
  uint64_t v12 = (void *)[v3 copy];

  return (NSArray *)v12;
}

- (_HMCameraAudioControl)speakerControl
{
  return (_HMCameraAudioControl *)objc_getProperty(self, a2, 96, 1);
}

- (_HMCameraAudioControl)microphoneControl
{
  return (_HMCameraAudioControl *)objc_getProperty(self, a2, 104, 1);
}

- (_HMCameraStreamControl)streamControl
{
  return (_HMCameraStreamControl *)objc_getProperty(self, a2, 72, 1);
}

- (_HMCameraSnapshotControl)snapshotControl
{
  return (_HMCameraSnapshotControl *)objc_getProperty(self, a2, 80, 1);
}

- (_HMCameraSettingsControl)settingsControl
{
  return (_HMCameraSettingsControl *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingEventManager, 0);
  objc_storeStrong((id *)&self->_reachabilityEventManager, 0);
  objc_storeStrong((id *)&self->_clipManager, 0);
  objc_storeStrong((id *)&self->_userSettings, 0);
  objc_storeStrong((id *)&self->_microphoneControl, 0);
  objc_storeStrong((id *)&self->_speakerControl, 0);
  objc_storeStrong((id *)&self->_settingsControl, 0);
  objc_storeStrong((id *)&self->_snapshotControl, 0);

  objc_storeStrong((id *)&self->_streamControl, 0);
}

- (HMCameraRecordingEventManager)recordingEventManager
{
  return (HMCameraRecordingEventManager *)objc_getProperty(self, a2, 136, 1);
}

- (void)setUserSettings:(id)a3
{
}

- (void)addUserSettings:(id)a3
{
  id v4 = a3;
  [(_HMCameraProfile *)self setUserSettings:v4];
  id v6 = [(_HMAccessoryProfile *)self accessory];
  v5 = [(_HMAccessoryProfile *)self context];
  [v4 configureWithAccessory:v6 context:v5];
}

- (_HMCameraProfile)initWithUUID:(id)a3 services:(id)a4 mostRecentSnapshot:(id)a5 userSettings:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  v53.receiver = self;
  v53.super_class = (Class)_HMCameraProfile;
  uint64_t v12 = [(_HMAccessoryProfile *)&v53 initWithUUID:a3 services:a4];
  if (v12)
  {
    id v45 = v11;
    id v47 = a6;
    v13 = [_HMCameraStreamControl alloc];
    v14 = [(_HMAccessoryProfile *)v12 profileUniqueIdentifier];
    uint64_t v15 = [(_HMCameraStreamControl *)v13 initWithCameraProfile:v12 profileUniqueIdentifier:v14];
    streamControl = v12->_streamControl;
    v12->_streamControl = (_HMCameraStreamControl *)v15;

    uint64_t v17 = [_HMCameraSnapshotControl alloc];
    uint64_t v18 = [(_HMAccessoryProfile *)v12 profileUniqueIdentifier];
    id v46 = v10;
    uint64_t v19 = [(_HMCameraSnapshotControl *)v17 initWithCameraProfile:v12 profileUniqueIdentifier:v18 mostRecentSnapshot:v10];
    snapshotControl = v12->_snapshotControl;
    v12->_snapshotControl = (_HMCameraSnapshotControl *)v19;

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = [(_HMAccessoryProfile *)v12 services];
    uint64_t v21 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v50 != v23) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          v26 = objc_msgSend(v25, "serviceType", v45);
          int v27 = [v26 isEqualToString:@"00000111-0000-1000-8000-0026BB765291"];

          if (v27)
          {
            v28 = [_HMCameraSettingsControl alloc];
            v29 = [(_HMAccessoryProfile *)v12 profileUniqueIdentifier];
            uint64_t v30 = [(_HMCameraSettingsControl *)v28 initWithCameraProfile:v12 profileUniqueIdentifier:v29 service:v25];
            settingsControl = v12->_settingsControl;
            v12->_settingsControl = (_HMCameraSettingsControl *)v30;
          }
          long long v32 = [v25 serviceType];
          int v33 = [v32 isEqualToString:@"00000112-0000-1000-8000-0026BB765291"];

          if (v33)
          {
            objc_super v34 = [_HMCameraAudioControl alloc];
            v35 = [(_HMAccessoryProfile *)v12 profileUniqueIdentifier];
            uint64_t v36 = [(_HMCameraAudioControl *)v34 initWithCameraProfile:v12 profileUniqueIdentifier:v35 service:v25];
            microphoneControl = v12->_microphoneControl;
            v12->_microphoneControl = (_HMCameraAudioControl *)v36;
          }
          v38 = [v25 serviceType];
          int v39 = [v38 isEqualToString:@"00000113-0000-1000-8000-0026BB765291"];

          if (v39)
          {
            v40 = [_HMCameraAudioControl alloc];
            v41 = [(_HMAccessoryProfile *)v12 profileUniqueIdentifier];
            uint64_t v42 = [(_HMCameraAudioControl *)v40 initWithCameraProfile:v12 profileUniqueIdentifier:v41 service:v25];
            speakerControl = v12->_speakerControl;
            v12->_speakerControl = (_HMCameraAudioControl *)v42;
          }
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v22);
    }

    objc_storeStrong((id *)&v12->_userSettings, v47);
    id v11 = v45;
    id v10 = v46;
  }

  return v12;
}

@end