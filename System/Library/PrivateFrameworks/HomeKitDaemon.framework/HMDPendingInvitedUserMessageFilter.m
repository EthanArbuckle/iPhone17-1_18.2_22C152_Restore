@interface HMDPendingInvitedUserMessageFilter
+ (id)logCategory;
+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5;
@end

@implementation HMDPendingInvitedUserMessageFilter

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_154075 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_154075, &__block_literal_global_154076);
  }
  v2 = (void *)logCategory__hmf_once_v4_154077;
  return v2;
}

void __49__HMDPendingInvitedUserMessageFilter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v4_154077;
  logCategory__hmf_once_v4_154077 = v0;
}

+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = [a1 policyOfClass:objc_opt_class() fromPolicies:v9];
  if (!v10) {
    goto LABEL_4;
  }
  if (([v8 isRemote] & 1) == 0)
  {
    if (!a5)
    {
LABEL_12:
      int64_t v13 = -1;
      goto LABEL_13;
    }
    v14 = (void *)MEMORY[0x263F087E8];
    v15 = @"Invited user message must be remote.";
    uint64_t v16 = 10;
LABEL_11:
    *a5 = [v14 hmErrorWithCode:v16 description:0 reason:v15 suggestion:0 underlyingError:0];
    goto LABEL_12;
  }
  v11 = [v10 homeManager];
  char v12 = [v11 pendingInviteExistsForSenderOfMessage:v8];

  if ((v12 & 1) == 0)
  {
    v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = a1;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      v21 = [v8 shortDescription];
      int v23 = 138543618;
      v24 = v20;
      __int16 v25 = 2112;
      v26 = v21;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@There is no actionable pending home invite on this device for sender of message: %@", (uint8_t *)&v23, 0x16u);
    }
    if (!a5) {
      goto LABEL_12;
    }
    v14 = (void *)MEMORY[0x263F087E8];
    v15 = @"No pending invite for message sender.";
    uint64_t v16 = 2;
    goto LABEL_11;
  }
LABEL_4:
  int64_t v13 = 1;
LABEL_13:

  return v13;
}

@end