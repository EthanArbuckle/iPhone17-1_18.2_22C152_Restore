@interface HMDAudioStreamInterfaceDataSource
+ (id)logCategory;
- (BOOL)isMuted;
- (BOOL)supportsPHASE;
- (BOOL)usesGlobalMuting;
- (void)createPHASEEngineAndControllerForStreamToken:(int64_t)a3 completion:(id)a4;
- (void)setAudioSessionPropertiesWithShouldAllowSystemSounds:(BOOL)a3 hostProcessBundleIdentifier:(id)a4;
- (void)setMuted:(BOOL)a3;
@end

@implementation HMDAudioStreamInterfaceDataSource

+ (id)logCategory
{
  if (logCategory__hmf_once_t6 != -1) {
    dispatch_once(&logCategory__hmf_once_t6, &__block_literal_global_3029);
  }
  v2 = (void *)logCategory__hmf_once_v7;
  return v2;
}

uint64_t __48__HMDAudioStreamInterfaceDataSource_logCategory__block_invoke()
{
  logCategory__hmf_once_v7 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

- (void)createPHASEEngineAndControllerForStreamToken:(int64_t)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = HMFGetLogIdentifier();
    int v11 = 138543362;
    v12 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Cannot create PHASE engine and controller on unsupported platform", (uint8_t *)&v11, 0xCu);
  }
  v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  (*((void (**)(id, void, void, void *))v5 + 2))(v5, 0, 0, v10);
}

- (void)setAudioSessionPropertiesWithShouldAllowSystemSounds:(BOOL)a3 hostProcessBundleIdentifier:(id)a4
{
  BOOL v4 = a3;
  v35[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  if (isAppleTV()) {
    v8 = @"MediaPlayback";
  }
  else {
    v8 = (__CFString *)*MEMORY[0x1E4F75928];
  }
  [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F75EC8]];
  if (isAppleTV()) {
    v9 = @"Default";
  }
  else {
    v9 = (__CFString *)*MEMORY[0x1E4F75BA0];
  }
  [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F75F00]];
  v10 = [NSNumber numberWithBool:v4];
  [v7 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F75E80]];

  int v11 = objc_msgSend(MEMORY[0x1E4F65540], "processInfo", 0, 0, 0, 0);
  int v12 = [v11 getAuditToken:&v26];

  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v26 length:32];
    uint64_t v14 = *MEMORY[0x1E4F767D8];
    v33[0] = *MEMORY[0x1E4F767C0];
    v33[1] = v14;
    v34[0] = v13;
    v34[1] = v6;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
    v35[0] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    [v7 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F761B0]];
  }
  else
  {
    v17 = (void *)MEMORY[0x1D9452090]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v28 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to get current process audit token", buf, 0xCu);
    }
    uint64_t v13 = 0;
  }
  v31[0] = @"kAUVoiceIOProperty_OperationMode";
  v31[1] = @"AVAudioClientBatchMXPropertiesKey";
  v32[0] = &unk_1F2DC7198;
  v32[1] = v7;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  v22 = (void *)MEMORY[0x1D9452090]();
  v23 = self;
  v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v28 = v25;
    __int16 v29 = 2112;
    v30 = v21;
    _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Setting audio session properties: %@", buf, 0x16u);
  }
  [MEMORY[0x1E4F47900] setAudioSessionProperties:v21];
}

- (BOOL)supportsPHASE
{
  return 0;
}

- (void)setMuted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      v9 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      v27 = v8;
      __int16 v28 = 2112;
      __int16 v29 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting AVAudioClient audio muted to %@", buf, 0x16u);
    }
    [MEMORY[0x1E4F47900] setMicrophoneMuted:v3];
  }
  else
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    int v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      uint64_t v14 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      v27 = v13;
      __int16 v28 = 2112;
      __int16 v29 = v14;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Setting AVSystemController audio muted to %@", buf, 0x16u);
    }
    v15 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
    v16 = [NSNumber numberWithBool:v3];
    uint64_t v17 = *MEMORY[0x1E4F74EE8];
    id v25 = 0;
    char v18 = [v15 setAttribute:v16 forKey:v17 error:&v25];
    id v19 = v25;

    if ((v18 & 1) == 0)
    {
      v20 = (void *)MEMORY[0x1D9452090]();
      v21 = v11;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        v24 = HMFBooleanToString();
        *(_DWORD *)buf = 138543874;
        v27 = v23;
        __int16 v28 = 2112;
        __int16 v29 = v24;
        __int16 v30 = 2112;
        id v31 = v19;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to set AVSystemController audio muted to %@: %@", buf, 0x20u);
      }
    }
  }
}

- (BOOL)isMuted
{
  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    v2 = (void *)MEMORY[0x1E4F47900];
    return [v2 isMicrophoneMuted];
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
    id v5 = [v4 attributeForKey:*MEMORY[0x1E4F74EE8]];
    char v6 = [v5 BOOLValue];

    return v6;
  }
}

- (BOOL)usesGlobalMuting
{
  return !_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0;
}

@end