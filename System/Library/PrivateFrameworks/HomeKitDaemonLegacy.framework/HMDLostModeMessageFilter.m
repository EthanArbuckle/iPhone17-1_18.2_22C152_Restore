@interface HMDLostModeMessageFilter
+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5;
@end

@implementation HMDLostModeMessageFilter

+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v10 = +[HMDLostModeManager sharedManager];
    int v11 = [v10 isLost];

    if (v11)
    {
      v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = a1;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = HMFGetLogIdentifier();
        int v18 = 138543362;
        v19 = v15;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Rejecting message in Lost Mode", (uint8_t *)&v18, 0xCu);
      }
      if (a5)
      {
        *a5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:10 description:0 reason:@"Device is in Lost Mode." suggestion:0];
      }
      int64_t v16 = -1;
    }
    else
    {
      int64_t v16 = 1;
    }
  }
  else
  {
    int64_t v16 = 0;
  }

  return v16;
}

@end