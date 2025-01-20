@interface _HMLightProfile
+ (BOOL)supportsSecureCoding;
- (HMLightProfile)lightProfile;
- (HMLightProfileSettings)settings;
- (_HMLightProfile)initWithCoder:(id)a3;
- (_HMLightProfile)initWithUUID:(id)a3 services:(id)a4 settings:(id)a5;
- (void)_registerNotificationHandlers;
- (void)handleSettingsDidUpdate:(id)a3;
- (void)setSettings:(id)a3;
@end

@implementation _HMLightProfile

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMLightProfileSettings)settings
{
  return (HMLightProfileSettings *)objc_getProperty(self, a2, 72, 1);
}

- (void)_registerNotificationHandlers
{
  id v4 = [(_HMAccessoryProfile *)self context];
  v3 = [v4 messageDispatcher];
  [v3 registerForMessage:@"HMLightProfile.sdum" receiver:self selector:sel_handleSettingsDidUpdate_];
}

- (_HMLightProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [[_HMAccessoryProfile alloc] initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hmlp.sck"];
    if (v6)
    {
      v7 = [(_HMAccessoryProfile *)v5 profileUniqueIdentifier];
      v8 = [(_HMAccessoryProfile *)v5 services];
      self = [(_HMLightProfile *)self initWithUUID:v7 services:v8 settings:v6];

      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (_HMLightProfile)initWithUUID:(id)a3 services:(id)a4 settings:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_HMLightProfile;
  v10 = [(_HMAccessoryProfile *)&v13 initWithUUID:a3 services:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_settings, a5);
  }

  return v11;
}

- (void).cxx_destruct
{
}

- (void)setSettings:(id)a3
{
}

- (void)handleSettingsDidUpdate:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = (_HMLightProfile *)a3;
  v5 = [(_HMLightProfile *)self lightProfile];
  if (v5)
  {
    v6 = (void *)MEMORY[0x19F3A64A0]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v25 = v9;
      __int16 v26 = 2112;
      v27 = v4;
      __int16 v28 = 2112;
      v29 = v5;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling message for light profile %@:%@", buf, 0x20u);
    }
    uint64_t v23 = objc_opt_class();
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    v11 = [(_HMLightProfile *)v4 unarchivedObjectForKey:@"hmlp.sck" ofClasses:v10];

    if (v11)
    {
      v12 = [(_HMLightProfile *)v4 name];
      [v5 updateSettings:v11 withReason:v12];
    }
    else
    {
      v18 = (void *)MEMORY[0x19F3A64A0]();
      v19 = v7;
      v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = HMFGetLogIdentifier();
        v22 = [(_HMLightProfile *)v4 messagePayload];
        *(_DWORD *)buf = 138543874;
        v25 = v21;
        __int16 v26 = 2112;
        v27 = v4;
        __int16 v28 = 2112;
        v29 = v22;
        _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode light profile settings from message: %@ with payload: %@", buf, 0x20u);
      }
      v11 = 0;
    }
  }
  else
  {
    v11 = [(_HMAccessoryProfile *)self accessory];
    objc_super v13 = (void *)MEMORY[0x19F3A64A0]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      v17 = [v11 lightProfiles];
      *(_DWORD *)buf = 138543874;
      v25 = v16;
      __int16 v26 = 2112;
      v27 = v14;
      __int16 v28 = 2112;
      v29 = v17;
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Skipping settings update, light profile not found in accessory light profiles %@:%@", buf, 0x20u);
    }
  }
}

- (HMLightProfile)lightProfile
{
  v3 = [(_HMAccessoryProfile *)self accessory];
  id v4 = [v3 lightProfiles];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31___HMLightProfile_lightProfile__block_invoke;
  v7[3] = &unk_1E593F150;
  v7[4] = self;
  v5 = objc_msgSend(v4, "na_firstObjectPassingTest:", v7);

  return (HMLightProfile *)v5;
}

@end