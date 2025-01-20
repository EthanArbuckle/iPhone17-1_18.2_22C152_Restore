@interface HMDCameraParameterSelection
+ (id)_selectedCryptoSuiteFromCameraCryptoSuites:(id)a3;
+ (id)logCategory;
+ (id)selectedParametersFromPreferredParameters:(id)a3 deviceSupportedParameters:(id)a4 cameraSupportedParameters:(id)a5 overriddenParameters:(id)a6 parameterDescription:(id)a7;
+ (id)selectedSRTPParametersFromCryptoSuites:(id)a3;
- (HMDCameraParameterSelection)initWithSessionID:(id)a3;
- (HMDCameraStreamSessionID)sessionID;
- (id)logIdentifier;
@end

@implementation HMDCameraParameterSelection

- (void).cxx_destruct
{
}

- (HMDCameraStreamSessionID)sessionID
{
  return self->_sessionID;
}

- (id)logIdentifier
{
  v2 = [(HMDCameraParameterSelection *)self sessionID];
  v3 = [v2 description];

  return v3;
}

- (HMDCameraParameterSelection)initWithSessionID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCameraParameterSelection;
  v6 = [(HMDCameraParameterSelection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sessionID, a3);
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_134822 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_134822, &__block_literal_global_134823);
  }
  v2 = (void *)logCategory__hmf_once_v7_134824;
  return v2;
}

uint64_t __42__HMDCameraParameterSelection_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v7_134824;
  logCategory__hmf_once_v7_134824 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)_selectedCryptoSuiteFromCameraCryptoSuites:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[HMDSRTPCryptoSuite arrayWithSuites:&unk_1F2DC6F28];
  v6 = (void *)[v5 mutableCopy];

  v7 = [MEMORY[0x1E4F65530] sharedPreferences];
  v8 = [v7 preferenceForKey:@"enableUnencryptedSRTPStream"];
  int v9 = [v8 BOOLValue];

  if (isInternalBuild() && v9)
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = a1;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      int v20 = 138543362;
      v21 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Making SRTP camera stream unencrypted", (uint8_t *)&v20, 0xCu);
    }
    v14 = [[HMDSRTPCryptoSuite alloc] initWithCryptoSuite:2];
    [v6 addObject:v14];
  }
  v15 = objc_opt_class();
  if (supportedSRTPAuths)
  {
    v16 = +[HMDSRTPCryptoSuite arrayWithSuites:](HMDSRTPCryptoSuite, "arrayWithSuites:");
  }
  else
  {
    v16 = 0;
  }
  v17 = [v15 selectedParametersFromPreferredParameters:v6 deviceSupportedParameters:v6 cameraSupportedParameters:v4 overriddenParameters:v16 parameterDescription:@"Crypto-Suite"];

  v18 = [v17 firstObject];

  return v18;
}

+ (id)selectedSRTPParametersFromCryptoSuites:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 _selectedCryptoSuiteFromCameraCryptoSuites:v4];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 srtpCryptoSuite];
    uint64_t v8 = 16;
    uint64_t v9 = 14;
    if (v7)
    {
      uint64_t v9 = 0;
      uint64_t v8 = 0;
    }
    if (v7 == 1) {
      uint64_t v10 = 14;
    }
    else {
      uint64_t v10 = v9;
    }
    if (v7 == 1) {
      uint64_t v11 = 32;
    }
    else {
      uint64_t v11 = v8;
    }
    v12 = [MEMORY[0x1E4F1CA58] dataWithLength:v11];
    v13 = [MEMORY[0x1E4F1CA58] dataWithLength:v10];
    v14 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
    size_t v15 = [v12 length];
    id v16 = v12;
    if (SecRandomCopyBytes(v14, v15, (void *)[v16 mutableBytes])
      || (size_t v17 = [v13 length],
          id v18 = v13,
          SecRandomCopyBytes(v14, v17, (void *)[v18 mutableBytes])))
    {
      v19 = (void *)MEMORY[0x1D9452090]();
      id v20 = a1;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        int v29 = 138543362;
        v30 = v22;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate random bytes", (uint8_t *)&v29, 0xCu);
      }
      v23 = 0;
    }
    else
    {
      v23 = [[HMDSRTPParameters alloc] initWithCryptoSuite:v6 masterKey:v16 masterSalt:v18];
    }
  }
  else
  {
    v24 = (void *)MEMORY[0x1D9452090]();
    id v25 = a1;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      int v29 = 138543362;
      v30 = v27;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to select Crypto Suite", (uint8_t *)&v29, 0xCu);
    }
    v23 = 0;
  }

  return v23;
}

+ (id)selectedParametersFromPreferredParameters:(id)a3 deviceSupportedParameters:(id)a4 cameraSupportedParameters:(id)a5 overriddenParameters:(id)a6 parameterDescription:(id)a7
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  size_t v17 = v16;
  if (!v15)
  {
    id v40 = v16;
    id v41 = v12;
    id v22 = (id)[v12 mutableCopy];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v23 = (void *)[v22 copy];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v58 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v43 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          if (![v13 containsObject:v28]
            || ([v14 containsObject:v28] & 1) == 0)
          {
            [v22 removeObject:v28];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v42 objects:v58 count:16];
      }
      while (v25);
    }

    uint64_t v29 = [v22 count];
    v30 = (void *)MEMORY[0x1D9452090]();
    id v31 = a1;
    v32 = HMFGetOSLogHandle();
    v33 = v32;
    if (v29)
    {
      size_t v17 = v40;
      id v12 = v41;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544642;
        v47 = v34;
        __int16 v48 = 2112;
        v49 = v40;
        __int16 v50 = 2112;
        id v51 = v41;
        __int16 v52 = 2112;
        id v53 = v13;
        __int16 v54 = 2112;
        id v55 = v14;
        __int16 v56 = 2112;
        id v57 = v22;
        v35 = "%{public}@Parameter: %@, preferredParameters: %@, deviceSupportedParameters: %@, cameraSupportedParameters"
              ": %@. preferredAndSupportedList: %@";
        v36 = v33;
        os_log_type_t v37 = OS_LOG_TYPE_DEBUG;
        uint32_t v38 = 62;
LABEL_20:
        _os_log_impl(&dword_1D49D5000, v36, v37, v35, buf, v38);
      }
    }
    else
    {
      size_t v17 = v40;
      id v12 = v41;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544386;
        v47 = v34;
        __int16 v48 = 2112;
        v49 = v40;
        __int16 v50 = 2112;
        id v51 = v41;
        __int16 v52 = 2112;
        id v53 = v13;
        __int16 v54 = 2112;
        id v55 = v14;
        v35 = "%{public}@No compatible elements for %@: preferredParameters: %@, deviceSupportedParameters: %@, cameraSup"
              "portedParameters: %@";
        v36 = v33;
        os_log_type_t v37 = OS_LOG_TYPE_ERROR;
        uint32_t v38 = 52;
        goto LABEL_20;
      }
    }

    goto LABEL_22;
  }
  id v18 = (void *)MEMORY[0x1D9452090]();
  id v19 = a1;
  id v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v47 = v21;
    __int16 v48 = 2112;
    v49 = v17;
    __int16 v50 = 2112;
    id v51 = v15;
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Local preference is set for %@, replying the same as filtered: %@", buf, 0x20u);
  }
  id v22 = v15;
LABEL_22:

  return v22;
}

@end