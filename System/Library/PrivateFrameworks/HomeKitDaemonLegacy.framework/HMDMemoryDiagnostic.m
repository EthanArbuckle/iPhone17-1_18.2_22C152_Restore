@interface HMDMemoryDiagnostic
+ (id)_configureCurrentProcessLevel:(id)a3;
+ (id)_nextLevelFromPreviousLevel:(id)a3;
+ (id)_previousLevelForBuild:(id)a3;
+ (id)memoryLevelsMB;
+ (void)_recordLevel:(id)a3 forBuild:(id)a4;
+ (void)configureMemoryDiagnostic;
@end

@implementation HMDMemoryDiagnostic

+ (id)_nextLevelFromPreviousLevel:(id)a3
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__183224;
  v16 = __Block_byref_object_dispose__183225;
  id v4 = a3;
  id v17 = v4;
  v5 = [a1 memoryLevelsMB];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__HMDMemoryDiagnostic__nextLevelFromPreviousLevel___block_invoke;
  v9[3] = &unk_1E6A186B8;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __51__HMDMemoryDiagnostic__nextLevelFromPreviousLevel___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  int v7 = [v8 intValue];
  if (v7 > (int)[*(id *)(a1 + 32) intValue])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

+ (id)_previousLevelForBuild:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v6 = [v5 dictionaryForKey:@"com.apple.homekit.MemoryDiagnosticLimit"];

  if (v6)
  {
    int v7 = [v6 valueForKey:@"buildVersion"];
    if (v7 && [v4 isEqualToString:v7])
    {
      id v8 = [v6 valueForKey:@"memoryLevelMB"];
      v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = a1;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        int v14 = 138543874;
        v15 = v12;
        __int16 v16 = 2112;
        id v17 = v7;
        __int16 v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Previous diagnostic memory limit for build %@ is set to %@MB", (uint8_t *)&v14, 0x20u);
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (void)_recordLevel:(id)a3 forBuild:(id)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"buildVersion";
  v10[1] = @"memoryLevelMB";
  v11[0] = a4;
  v11[1] = a3;
  v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 dictionaryWithObjects:v11 forKeys:v10 count:2];
  v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];

  [v9 setObject:v8 forKey:@"com.apple.homekit.MemoryDiagnosticLimit"];
}

+ (id)_configureCurrentProcessLevel:(id)a3
{
  [a3 intValue];
  getpid();
  uint64_t v3 = memorystatus_control();
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28C58];
    v5 = objc_msgSend(NSString, "stringWithFormat:", @"memorystatus_control returned %d", v3);
    id v6 = [v4 hmfErrorWithCode:15 reason:v5];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (void)configureMemoryDiagnostic
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D9452090](a1, a2);
  id v4 = [MEMORY[0x1E4F65548] productInfo];
  v5 = [v4 softwareVersion];
  id v6 = [v5 buildVersion];

  if (v6)
  {
    uint64_t v7 = [a1 _previousLevelForBuild:v6];
    if (v7) {
      id v8 = (void *)v7;
    }
    else {
      id v8 = &unk_1F2DC9EC8;
    }
    v9 = [a1 _nextLevelFromPreviousLevel:v8];
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = a1;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      int v23 = 138543874;
      v24 = v13;
      __int16 v25 = 2112;
      v26 = v6;
      __int16 v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Setting diagnostic memory limit for build %@ to %@MB", (uint8_t *)&v23, 0x20u);
    }
    int v14 = [v11 _configureCurrentProcessLevel:v9];
    if (v14)
    {
      v15 = (void *)MEMORY[0x1D9452090]();
      id v16 = v11;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __int16 v18 = HMFGetLogIdentifier();
        int v23 = 138543618;
        v24 = v18;
        __int16 v25 = 2112;
        v26 = v14;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to set diagnostic memory limit: %@", (uint8_t *)&v23, 0x16u);
      }
    }
    else if (([v9 isEqualToNumber:v8] & 1) == 0)
    {
      [v11 _recordLevel:v9 forBuild:v6];
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = a1;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      int v23 = 138543362;
      v24 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to get current build version, return", (uint8_t *)&v23, 0xCu);
    }
  }
}

+ (id)memoryLevelsMB
{
  return &unk_1F2DC7090;
}

@end