@interface IDSSession(HMDDevice)
+ (id)hmd_sessionWithAccount:()HMDDevice device:options:;
@end

@implementation IDSSession(HMDDevice)

+ (id)hmd_sessionWithAccount:()HMDDevice device:options:
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = v9;
    v12 = [v11 account];
    if ([v12 isCurrentAccount])
    {
      v47 = a1;
      id v49 = v9;
      v13 = [v12 primaryHandle];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      v14 = [v12 handles];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v55 objects:buf count:16];
      id v50 = v8;
      id v48 = v10;
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v56;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v56 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v55 + 1) + 8 * i);
            if ([v19 isLocal])
            {
              id v21 = v19;

              v13 = v21;
              goto LABEL_14;
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v55 objects:buf count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }
LABEL_14:

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      v22 = [v11 globalHandles];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v51 objects:v59 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v52;
        while (2)
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v52 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = [*(id *)(*((void *)&v51 + 1) + 8 * j) internal];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v28 = v27;
            }
            else {
              v28 = 0;
            }
            id v29 = v28;

            if (v29)
            {
              v30 = [_HMDGlobalDeviceHandle alloc];
              v31 = [v29 pushToken];
              v32 = [(_HMDGlobalDeviceHandle *)v30 initWithPushToken:v31 accountHandle:v13];

              if (v32)
              {
                v33 = [(_HMDGlobalDeviceHandle *)v32 destination];

                id v9 = v49;
                id v8 = v50;
                id v10 = v48;
                a1 = v47;
                goto LABEL_29;
              }
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v51 objects:v59 count:16];
          if (v24) {
            continue;
          }
          break;
        }
      }

      id v9 = v49;
      id v8 = v50;
      id v10 = v48;
      a1 = v47;
    }
    v33 = [v11 remoteDestinationString];
LABEL_29:

    if (v33)
    {
      id v34 = objc_alloc(MEMORY[0x263F4A0D8]);
      v35 = [MEMORY[0x263EFFA08] setWithObject:v33];
      v20 = (void *)[v34 initWithAccount:v8 destinations:v35 options:v10];
    }
    else
    {
      v37 = (void *)MEMORY[0x230FBD990]();
      id v38 = a1;
      v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      {
        v40 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v61 = v40;
        __int16 v62 = 2112;
        id v63 = v11;
        _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Failed to create session for device, could not create destination: %@", buf, 0x16u);
      }
      v41 = [[HMDAssertionLogEvent alloc] initWithReason:@"Failed to create session for device, could not create destination: %@", v11];
      v42 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v42 submitLogEvent:v41];

      v43 = (void *)MEMORY[0x230FBD990]();
      id v44 = v38;
      v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v46 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v61 = v46;
        __int16 v62 = 2112;
        id v63 = v11;
        _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@Failed to create session for device: %@", buf, 0x16u);
      }
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

@end