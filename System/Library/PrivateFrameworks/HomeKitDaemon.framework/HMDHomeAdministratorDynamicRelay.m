@interface HMDHomeAdministratorDynamicRelay
@end

@implementation HMDHomeAdministratorDynamicRelay

uint64_t __60____HMDHomeAdministratorDynamicRelay___handleRemoteMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) dispatchMessage:a2];
}

void __57____HMDHomeAdministratorDynamicRelay___handleXPCMessage___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5 && HMDIsAllowedFallbackRemoteError(v5))
  {
    v7 = [a1[4] home];
    v8 = [v7 deviceHomeKitSetupSession];
    [v8 markHasFailedRelayAttempt];

    v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = a1[5];
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      v13 = [a1[6] shortDescription];
      *(_DWORD *)buf = 138543874;
      v17 = v12;
      __int16 v18 = 2114;
      v19 = v13;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Allowing local fallback processing of message %{public}@ due to error: %@", buf, 0x20u);
    }
    id v14 = a1[6];
    v15.receiver = a1[5];
    v15.super_class = (Class)__HMDHomeAdministratorDynamicRelay;
    objc_msgSendSuper2(&v15, sel___handleXPCMessage_, v14);
  }
  else
  {
    [a1[6] respondWithPayload:v6 error:v5];
  }
}

uint64_t __66____HMDHomeAdministratorDynamicRelay_registerForMessage_policies___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = 0;
  }
  else
  {
    objc_opt_class();
    char v3 = objc_opt_isKindOfClass() ^ 1;
  }

  return v3 & 1;
}

void __49____HMDHomeAdministratorDynamicRelay_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v13_240775;
  logCategory__hmf_once_v13_240775 = v0;
}

@end