@interface HMDUserMessageFilter
+ (BOOL)areWeGoingToRejectMessage:(id)a3 basedOnRemoteAccessPolicy:(id)a4 forUser:(id)a5;
+ (id)homeForMessage:(id)a3 userPolicy:(id)a4 dispatcher:(id)a5;
+ (id)logCategory;
+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 dispatcher:(id)a5 error:(id *)a6;
@end

@implementation HMDUserMessageFilter

+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 dispatcher:(id)a5 error:(id *)a6
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
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
LABEL_42:

      goto LABEL_43;
    }
    v18 = [a1 homeForMessage:v10 userPolicy:v17 dispatcher:v12];
    if (!v18)
    {
      v29 = (void *)MEMORY[0x1D9452090]();
      id v30 = a1;
      v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = HMFGetLogIdentifier();
        v33 = [v10 shortDescription];
        *(_DWORD *)buf = 138543618;
        v64 = v32;
        __int16 v65 = 2112;
        v66 = v33;
        _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@The home is no longer valid for message: %@", buf, 0x16u);
      }
      if (a6)
      {
        *a6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:0 reason:@"Home is no longer valid." suggestion:0 underlyingError:0];
      }
      int64_t v16 = -1;
      v18 = 0;
      goto LABEL_41;
    }
    v19 = [v10 userForHome:v18];
    v20 = v19;
    if (v19)
    {
      if (HMDUserPrivilegeCompare([v19 privilege], objc_msgSend(v17, "userPrivilege")) == -1)
      {
        v62 = v20;
        v41 = (void *)MEMORY[0x1D9452090]();
        id v42 = a1;
        v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v61 = HMFGetLogIdentifier();
          v56 = [v20 shortDescription];
          v55 = [v10 name];
          unint64_t v44 = [v17 userPrivilege];
          if (v44 > 4) {
            v45 = @"None";
          }
          else {
            v45 = off_1E6A14D48[v44];
          }
          v54 = v45;
          unint64_t v46 = [v20 privilege];
          if (v46 > 4) {
            v47 = @"None";
          }
          else {
            v47 = off_1E6A14D48[v46];
          }
          v53 = v47;
          *(_DWORD *)buf = 138544386;
          v64 = v61;
          __int16 v65 = 2112;
          v66 = v56;
          __int16 v67 = 2112;
          v68 = v55;
          __int16 v69 = 2112;
          v70 = v54;
          __int16 v71 = 2112;
          v72 = v53;
          _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_ERROR, "%{public}@Insufficient privilege for user: [%@] [%@] / (required: %@, actual: %@)", buf, 0x34u);
        }
        if (!a6) {
          goto LABEL_39;
        }
        v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v28 = 17;
      }
      else
      {
        if (![a1 areWeGoingToRejectMessage:v10 basedOnRemoteAccessPolicy:v17 forUser:v20])
        {
          if (v15
            && [v17 requiresCameraStreamingAccess]
            && ([v20 camerasAccessLevel], (HMUserIsStreamingAllowedWithCameraAccessLevel() & 1) == 0))
          {
            v49 = (void *)MEMORY[0x1D9452090]();
            id v50 = a1;
            v51 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              v52 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v64 = v52;
              _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_ERROR, "%{public}@User does not have access to view remote camera streams", buf, 0xCu);
            }
            int64_t v16 = -1;
          }
          else
          {
            int64_t v16 = 1;
          }
          goto LABEL_40;
        }
        v62 = v20;
        v21 = (void *)MEMORY[0x1D9452090]();
        id v22 = a1;
        v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v24 = v57 = v21;
          [v10 shortDescription];
          v25 = v59 = v18;
          v26 = [v62 shortDescription];
          *(_DWORD *)buf = 138543874;
          v64 = v24;
          __int16 v65 = 2112;
          v66 = v25;
          __int16 v67 = 2112;
          v68 = v26;
          _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Message %@ arrived on a non-direct transport from user does not have remote access: %@", buf, 0x20u);

          v18 = v59;
          v21 = v57;
        }

        if (!a6)
        {
LABEL_39:
          int64_t v16 = -1;
          v20 = v62;
LABEL_40:

LABEL_41:
          goto LABEL_42;
        }
        v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v28 = 10;
      }
      v40 = objc_msgSend(v27, "hmErrorWithCode:", v28, v53);
    }
    else
    {
      v62 = 0;
      v34 = (void *)MEMORY[0x1D9452090]();
      id v35 = a1;
      v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = v58 = v34;
        v38 = [v18 shortDescription];
        [v10 shortDescription];
        v39 = v60 = v18;
        *(_DWORD *)buf = 138543874;
        v64 = v37;
        __int16 v65 = 2112;
        v66 = v38;
        __int16 v67 = 2112;
        v68 = v39;
        _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_ERROR, "%{public}@Cannot determine user of home, %@, for message: %@", buf, 0x20u);

        v18 = v60;
        v34 = v58;
      }

      if (!a6) {
        goto LABEL_39;
      }
      v40 = [MEMORY[0x1E4F28C58] hmErrorWithCode:10 description:0 reason:@"Unable to determine user." suggestion:0 underlyingError:0];
    }
    *a6 = v40;
    goto LABEL_39;
  }
  int64_t v16 = 0;
LABEL_43:

  return v16;
}

+ (BOOL)areWeGoingToRejectMessage:(id)a3 basedOnRemoteAccessPolicy:(id)a4 forUser:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [v8 home];
  int v11 = [v9 requiresRemoteAccess];

  BOOL v12 = v11
     && ([v8 isRemoteAccessAllowed] & 1) == 0
     && [v7 isRemote]
     && ([v7 remoteRestriction] & 0xE) == 0
     && ([v10 isResidentFirstAccessoryCommunicationEnabled] & 1) != 0;

  return v12;
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
        BOOL v12 = v11;
      }
      else {
        BOOL v12 = 0;
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

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_153915 != -1) {
    dispatch_once(&logCategory__hmf_once_t7_153915, &__block_literal_global_153916);
  }
  v2 = (void *)logCategory__hmf_once_v8_153917;
  return v2;
}

uint64_t __35__HMDUserMessageFilter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v8_153917;
  logCategory__hmf_once_v8_153917 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end