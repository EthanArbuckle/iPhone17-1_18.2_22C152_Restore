@interface HMDAppleAccountManagerUpdateRPIndentityForCurrentDevice
@end

@implementation HMDAppleAccountManagerUpdateRPIndentityForCurrentDevice

void ____HMDAppleAccountManagerUpdateRPIndentityForCurrentDevice_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) invalidate];
  if (v6)
  {
    v8 = (void *)MEMORY[0x1D9452090](v7);
    id v9 = *(id *)(a1 + 40);
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v48 = v11;
      __int16 v49 = 2112;
      id v50 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine rapport identity for current device with error %@", buf, 0x16u);
    }
    uint64_t v12 = *(void *)(a1 + 56);
    v13 = v6;
    if (v12)
    {
      (*(void (**)(uint64_t, id))(v12 + 16))(v12, v6);
      v13 = v6;
    }
    goto LABEL_31;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v14 = v5;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (!v15)
  {

LABEL_25:
    v35 = (void *)MEMORY[0x1D9452090]();
    id v36 = *(id *)(a1 + 40);
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v48 = v38;
      _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "%{public}@Rapport did not return the self identity", buf, 0xCu);
    }
    v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    v17 = 0;
    goto LABEL_28;
  }
  uint64_t v16 = v15;
  v17 = 0;
  uint64_t v18 = *(void *)v41;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v41 != v18) {
        objc_enumerationMutation(v14);
      }
      v20 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      if (objc_msgSend(v20, "type", (void)v40) == 1)
      {
        id v21 = v20;

        v17 = v21;
      }
    }
    uint64_t v16 = [v14 countByEnumeratingWithState:&v40 objects:v46 count:16];
  }
  while (v16);

  if (!v17) {
    goto LABEL_25;
  }
  v22 = (void *)MEMORY[0x1D9452090]();
  id v23 = *(id *)(a1 + 40);
  v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v48 = v25;
    __int16 v49 = 2112;
    id v50 = v17;
    _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Found current device RPIdentity: %@", buf, 0x16u);
  }
  uint64_t v26 = [*(id *)(a1 + 48) rpIdentity];
  if (!v26
    || (v27 = (void *)v26,
        [*(id *)(a1 + 48) rpIdentity],
        v28 = objc_claimAutoreleasedReturnValue(),
        char v29 = [v28 isEqualToRPIndentity:v17],
        v28,
        v27,
        (v29 & 1) == 0))
  {
    v30 = +[HMDRPIdentity identityWithRPIdentity:v17];
    if (v30) {
      [*(id *)(a1 + 48) setRpIdentity:v30];
    }
  }
  v31 = [*(id *)(a1 + 40) notificationCenter];
  uint64_t v32 = *(void *)(a1 + 40);
  v44 = @"deviceIRK";
  v33 = [v17 deviceIRKData];
  v45 = v33;
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
  [v31 postNotificationName:@"HMDAppleAccountManagerFetchedCurrentDeviceIRK" object:v32 userInfo:v34];

  v13 = 0;
LABEL_28:
  uint64_t v39 = *(void *)(a1 + 56);
  if (v39) {
    (*(void (**)(uint64_t, void *))(v39 + 16))(v39, v13);
  }

LABEL_31:
}

@end