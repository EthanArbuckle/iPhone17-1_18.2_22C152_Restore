@interface HMDHomeKitVersion
+ (HMDHomeKitVersion)currentVersion;
@end

@implementation HMDHomeKitVersion

+ (HMDHomeKitVersion)currentVersion
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__HMDHomeKitVersion_currentVersion__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentVersion_onceToken != -1) {
    dispatch_once(&currentVersion_onceToken, block);
  }
  v2 = (void *)currentVersion_version;
  return (HMDHomeKitVersion *)v2;
}

void __35__HMDHomeKitVersion_currentVersion__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (isInternalBuild()
    && (v2 = (__CFString *)CFPreferencesCopyAppValue(@"homeKitVersionOverride", @"com.apple.homed")) != 0)
  {
    v3 = v2;
    v4 = (void *)MEMORY[0x1D9452090]();
    v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = HMFGetLogIdentifier();
      int v9 = 138543618;
      v10 = v6;
      __int16 v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Version string is overridden to %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    v3 = @"12.2";
  }
  uint64_t v7 = [objc_alloc(*(Class *)(a1 + 32)) initWithVersionString:v3];
  v8 = (void *)currentVersion_version;
  currentVersion_version = v7;
}

@end