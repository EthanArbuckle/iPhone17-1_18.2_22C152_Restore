@interface HMDSecureRemoteMessageFilter
+ (BOOL)isAllowedMessage:(id)a3;
+ (id)logCategory;
- (BOOL)acceptMessage:(id)a3 target:(id)a4 errorReason:(id *)a5;
- (id)logIdentifier;
@end

@implementation HMDSecureRemoteMessageFilter

- (BOOL)acceptMessage:(id)a3 target:(id)a4 errorReason:(id *)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (([v8 isRemote] & 1) == 0)
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_12;
    }
    v15 = HMFGetLogIdentifier();
    int v25 = 138543618;
    v26 = v15;
    __int16 v27 = 2112;
    id v28 = v8;
    v16 = "%{public}@Accepting local message: %@";
LABEL_10:
    v17 = v14;
    os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
    goto LABEL_11;
  }
  v10 = [v8 name];
  BOOL v11 = +[HMDSecureRemoteMessageFilter isAllowedMessage:v10];

  if (v11)
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      int v25 = 138543618;
      v26 = v15;
      __int16 v27 = 2112;
      id v28 = v8;
      v16 = "%{public}@Accepting allowed message: %@";
      v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_INFO;
LABEL_11:
      _os_log_impl(&dword_22F52A000, v17, v18, v16, (uint8_t *)&v25, 0x16u);
    }
LABEL_12:

    BOOL v19 = 1;
    goto LABEL_13;
  }
  if ([v8 isSecureRemote])
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_12;
    }
    v15 = HMFGetLogIdentifier();
    int v25 = 138543618;
    v26 = v15;
    __int16 v27 = 2112;
    id v28 = v8;
    v16 = "%{public}@Accepting secure remote message: %@";
    goto LABEL_10;
  }
  if (a5)
  {
    v21 = (void *)MEMORY[0x230FBD990]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = HMFGetLogIdentifier();
      int v25 = 138543618;
      v26 = v24;
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Rejecting insecure remote message: %@", (uint8_t *)&v25, 0x16u);
    }
    [MEMORY[0x263F087E8] hmErrorWithCode:17];
    BOOL v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_13:

  return v19;
}

- (id)logIdentifier
{
  return @"Secure Remote Message Filter";
}

+ (BOOL)isAllowedMessage:(id)a3
{
  uint64_t v3 = isAllowedMessage__pred;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isAllowedMessage__pred, &__block_literal_global_163_126352);
  }
  char v5 = [(id)isAllowedMessage___allowedMessages containsObject:v4];

  return v5;
}

void __49__HMDSecureRemoteMessageFilter_isAllowedMessage___block_invoke()
{
  v4[5] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"kAccessHomeInviteRequestKey";
  v4[1] = @"kUpdateHomeInvitationStateInternalRequestKey";
  v4[2] = @"kDismissBulletinInternalRequestKey";
  v4[3] = @"kDismissDialogInternalRequestKey";
  v4[4] = @"kKeyTransferAgentKey";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:5];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)isAllowedMessage___allowedMessages;
  isAllowedMessage___allowedMessages = v2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20_126356 != -1) {
    dispatch_once(&logCategory__hmf_once_t20_126356, &__block_literal_global_154);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v21_126357;
  return v2;
}

void __43__HMDSecureRemoteMessageFilter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v21_126357;
  logCategory__hmf_once_v21_126357 = v0;
}

@end