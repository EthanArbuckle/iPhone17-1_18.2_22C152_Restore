@interface HMDUserMessageFilter
+ (BOOL)areWeGoingToRejectMessage:(id)a3 basedOnRemoteAccessPolicy:(id)a4 forUser:(id)a5;
+ (id)homeForMessage:(id)a3 userPolicy:(id)a4 dispatcher:(id)a5;
+ (id)logCategory;
+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 dispatcher:(id)a5 error:(id *)a6;
@end

@implementation HMDUserMessageFilter

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_222130 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_222130, &__block_literal_global_222131);
  }
  v2 = (void *)logCategory__hmf_once_v8_222132;
  return v2;
}

void __35__HMDUserMessageFilter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v8_222132;
  logCategory__hmf_once_v8_222132 = v0;
}

+ (BOOL)areWeGoingToRejectMessage:(id)a3 basedOnRemoteAccessPolicy:(id)a4 forUser:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  BOOL v9 = [a4 requiresRemoteAccess]
    && ([v8 isRemoteAccessAllowed] & 1) == 0
    && [v7 isRemote]
    && ([v7 remoteRestriction] & 0xE) == 0;

  return v9;
}

+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 dispatcher:(id)a5 error:(id *)a6
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [v10 proxyConnection];

  int v14 = [v10 isRemote];
  int v15 = v14;
  if (v13 || v14)
  {
    v17 = [a1 policyOfClass:objc_opt_class() fromPolicies:v11];
    if (!v17)
    {
      int64_t v16 = 1;
LABEL_44:

      goto LABEL_45;
    }
    v18 = [a1 homeForMessage:v10 userPolicy:v17 dispatcher:v12];
    if (!v18)
    {
      v21 = (void *)MEMORY[0x230FBD990]();
      id v22 = a1;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = HMFGetLogIdentifier();
        v25 = [v10 shortDescription];
        *(_DWORD *)buf = 138543618;
        v64 = v24;
        __int16 v65 = 2112;
        v66 = v25;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@The home is no longer valid for message: %@", buf, 0x16u);
      }
      if (a6)
      {
        *a6 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:0 reason:@"Home is no longer valid." suggestion:0 underlyingError:0];
      }
      int64_t v16 = -1;
      v18 = 0;
      goto LABEL_43;
    }
    v19 = [v10 userForHome:v18];
    v20 = v19;
    if (v19)
    {
      if (HMDUserPrivilegeCompare([v19 privilege], objc_msgSend(v17, "userPrivilege")) == -1)
      {
        v62 = v20;
        v33 = (void *)MEMORY[0x230FBD990]();
        id v34 = a1;
        v35 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v60 = HMFGetLogIdentifier();
          v56 = [v20 shortDescription];
          v55 = [v10 name];
          unint64_t v36 = [v17 userPrivilege];
          if (v36 > 5) {
            v37 = @"None";
          }
          else {
            v37 = off_264A29920[v36];
          }
          v54 = v37;
          unint64_t v46 = [v20 privilege];
          if (v46 > 5) {
            v47 = @"None";
          }
          else {
            v47 = off_264A29920[v46];
          }
          v53 = v47;
          *(_DWORD *)buf = 138544386;
          v64 = v60;
          __int16 v65 = 2112;
          v66 = v56;
          __int16 v67 = 2112;
          v68 = v55;
          __int16 v69 = 2112;
          v70 = v54;
          __int16 v71 = 2112;
          v72 = v53;
          _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Insufficient privilege for user: [%@] [%@] / (required: %@, actual: %@)", buf, 0x34u);
        }
        if (!a6) {
          goto LABEL_41;
        }
        v44 = (void *)MEMORY[0x263F087E8];
        uint64_t v45 = 17;
      }
      else
      {
        if (![a1 areWeGoingToRejectMessage:v10 basedOnRemoteAccessPolicy:v17 forUser:v20]|| objc_msgSend(v17, "useProofOfLocality")&& (objc_msgSend(v10, "shouldWeProcessRemoteMessageDespiteNoRemoteAccessAllowedForUser:", v20) & 1) != 0)
        {
          if (v15
            && [v17 requiresCameraStreamingAccess]
            && ([v20 camerasAccessLevel], (HMUserIsStreamingAllowedWithCameraAccessLevel() & 1) == 0))
          {
            v49 = (void *)MEMORY[0x230FBD990]();
            id v50 = a1;
            v51 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              v52 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v64 = v52;
              _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, "%{public}@User does not have access to view remote camera streams", buf, 0xCu);
            }
            int64_t v16 = -1;
          }
          else
          {
            int64_t v16 = 1;
          }
          goto LABEL_42;
        }
        v62 = v20;
        v38 = (void *)MEMORY[0x230FBD990]();
        id v39 = a1;
        v40 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v41 = v58 = v38;
          [v10 shortDescription];
          v42 = v61 = v18;
          v43 = [v62 shortDescription];
          *(_DWORD *)buf = 138543874;
          v64 = v41;
          __int16 v65 = 2112;
          v66 = v42;
          __int16 v67 = 2112;
          v68 = v43;
          _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@Message %@ arrived on a non-direct transport from user does not have remote access: %@", buf, 0x20u);

          v18 = v61;
          v38 = v58;
        }

        if (!a6)
        {
LABEL_41:
          int64_t v16 = -1;
          v20 = v62;
LABEL_42:

LABEL_43:
          goto LABEL_44;
        }
        v44 = (void *)MEMORY[0x263F087E8];
        uint64_t v45 = 10;
      }
      v32 = objc_msgSend(v44, "hmErrorWithCode:", v45, v53);
    }
    else
    {
      v62 = 0;
      v26 = (void *)MEMORY[0x230FBD990]();
      id v27 = a1;
      v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = v57 = v26;
        v30 = [v18 shortDescription];
        [v10 shortDescription];
        v31 = v59 = v18;
        *(_DWORD *)buf = 138543874;
        v64 = v29;
        __int16 v65 = 2112;
        v66 = v30;
        __int16 v67 = 2112;
        v68 = v31;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine user of home, %@, for message: %@", buf, 0x20u);

        v18 = v59;
        v26 = v57;
      }

      if (!a6) {
        goto LABEL_41;
      }
      v32 = [MEMORY[0x263F087E8] hmErrorWithCode:10 description:0 reason:@"Unable to determine user." suggestion:0 underlyingError:0];
    }
    *a6 = v32;
    goto LABEL_41;
  }
  int64_t v16 = 0;
LABEL_45:

  return v16;
}

+ (id)homeForMessage:(id)a3 userPolicy:(id)a4 dispatcher:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 home];
  if (!v10)
  {
    if ([v8 validForAnyHomeTheUserIsPartOf])
    {
      id v11 = v9;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v12 = v11;
      }
      else {
        id v12 = 0;
      }
      id v13 = v12;

      if (v13)
      {
        int v14 = [v7 destination];
        int v15 = [v14 target];
        id v10 = [v13 homeForMessageTarget:v15];
      }
      else
      {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
  }

  return v10;
}

@end