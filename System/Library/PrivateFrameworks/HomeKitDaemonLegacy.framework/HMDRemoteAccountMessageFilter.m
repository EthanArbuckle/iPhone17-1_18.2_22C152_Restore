@interface HMDRemoteAccountMessageFilter
+ (id)logCategory;
- (BOOL)acceptMessage:(id)a3 target:(id)a4 errorReason:(id *)a5;
- (HAPKeyStore)systemKeychainStore;
- (HMDAppleAccountManager)appleAccountManager;
- (HMDRemoteAccountMessageFilter)initWithName:(id)a3;
- (HMDRemoteAccountMessageFilter)initWithTarget:(id)a3;
- (HMDRemoteAccountMessageFilter)initWithTarget:(id)a3 allowedMessages:(id)a4;
- (HMDRemoteAccountMessageFilter)initWithTarget:(id)a3 allowedMessages:(id)a4 appleAccountManager:(id)a5 systemKeychainStore:(id)a6;
- (HMFMessageDestination)target;
- (NSArray)allowedMessages;
- (id)logIdentifier;
- (void)setAppleAccountManager:(id)a3;
- (void)setSystemKeychainStore:(id)a3;
@end

@implementation HMDRemoteAccountMessageFilter

- (BOOL)acceptMessage:(id)a3 target:(id)a4 errorReason:(id *)a5
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  v11 = v10;
  if (!self || ![v10 isRemote])
  {

    goto LABEL_16;
  }
  id v12 = v11;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  if ([v14 restriction] == 4
    || ([(HMDRemoteAccountMessageFilter *)self target],
        v15 = objc_claimAutoreleasedReturnValue(),
        [v12 destination],
        v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [v15 isEqual:v16],
        v16,
        v15,
        !v17))
  {
LABEL_14:

LABEL_16:
    BOOL v29 = 1;
    goto LABEL_17;
  }
  v18 = (void *)MEMORY[0x1D9452090]();
  v19 = self;
  v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v92 = v21;
    __int16 v93 = 2112;
    id v94 = v12;
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Message is targeting target: %@", buf, 0x16u);
  }
  v22 = [(HMDRemoteAccountMessageFilter *)v19 allowedMessages];
  v23 = [v12 name];
  int v24 = [v22 containsObject:v23];

  if (v24)
  {
    v25 = (void *)MEMORY[0x1D9452090]();
    v26 = v19;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v92 = v28;
      __int16 v93 = 2112;
      id v94 = v12;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Message is allowed: %@", buf, 0x16u);
    }
    goto LABEL_14;
  }

  id v31 = v12;
  v32 = [v31 destination];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v33 = v32;
  }
  else {
    v33 = 0;
  }
  id v34 = v33;

  v35 = [v34 device];
  v36 = [v35 account];

  if (v36)
  {
    id v88 = v34;
    v37 = v36;
    int v38 = [v36 isCurrentAccount];
    v39 = (void *)MEMORY[0x1D9452090]();
    v40 = v19;
    v41 = HMFGetOSLogHandle();
    v42 = v41;
    if (v38)
    {
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v92 = v43;
        __int16 v93 = 2112;
        id v94 = v31;
        _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_DEBUG, "%{public}@Authenticated message sent from current account: %@", buf, 0x16u);
      }
      char v44 = 1;
    }
    else
    {
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v50 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v92 = v50;
        __int16 v93 = 2112;
        id v94 = v31;
        _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_ERROR, "%{public}@Authenticated message not sent from current account: %@", buf, 0x16u);
      }
      char v44 = 0;
    }
    id v34 = v88;
    v36 = v37;
  }
  else
  {
    if (![v31 isSecureRemote]) {
      goto LABEL_55;
    }
    v45 = [v31 remoteSenderContext];
    v46 = [v45 mergeID];

    v87 = v46;
    id v89 = v34;
    if (v46)
    {
      v47 = [(HMDRemoteAccountMessageFilter *)v19 appleAccountManager];
      v48 = [v47 account];

      v49 = [v48 senderCorrelationIdentifier];
      if (v49)
      {
        if ([v46 isEqualToString:v49])
        {

          char v44 = 1;
          v36 = 0;
          goto LABEL_56;
        }
      }
      else
      {
        v51 = (void *)MEMORY[0x1D9452090]();
        v85 = v19;
        v52 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v53 = v83 = v51;
          *(_DWORD *)buf = 138543618;
          v92 = v53;
          __int16 v93 = 2112;
          id v94 = v48;
          _os_log_impl(&dword_1D49D5000, v52, OS_LOG_TYPE_ERROR, "%{public}@MergeID is not set for the current account: %@", buf, 0x16u);

          v51 = v83;
        }
      }

      v36 = 0;
    }
    v54 = [(HMDRemoteAccountMessageFilter *)v19 systemKeychainStore];
    id v90 = 0;
    v55 = [v54 getLocalPairingIdentity:&v90];
    id v86 = v90;

    if (!v55)
    {
      id v56 = v31;
      v57 = v36;
      v58 = (void *)MEMORY[0x1D9452090]();
      v59 = v19;
      v60 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        v61 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v92 = v61;
        __int16 v93 = 2112;
        id v94 = v86;
        _os_log_impl(&dword_1D49D5000, v60, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve local pairing identity with error: %@", buf, 0x16u);
      }
      v36 = v57;
      id v31 = v56;
      v55 = 0;
    }
    v62 = [v31 remoteSenderContext];
    v63 = [v62 pairingIdentityIdentifier];

    if (!v63) {
      goto LABEL_67;
    }
    v64 = [v55 identifier];
    char v65 = [v63 isEqualToString:v64];

    if (v65)
    {
      int v66 = 1;
    }
    else
    {
LABEL_67:
      v67 = [v31 remoteUserPairingIdentity];
      v68 = v67;
      if (v67 && ([v67 isEqual:v55] & 1) != 0)
      {
        int v66 = 1;
      }
      else
      {
        v82 = v36;
        v84 = v55;
        id v69 = v31;
        v70 = (void *)MEMORY[0x1D9452090]();
        v71 = v19;
        v72 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v73 = v81 = v70;
          *(_DWORD *)buf = 138543618;
          v92 = v73;
          __int16 v93 = 2112;
          id v94 = v69;
          _os_log_impl(&dword_1D49D5000, v72, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine if the message was sent from the current account: %@", buf, 0x16u);

          v70 = v81;
        }

        int v66 = 0;
        id v31 = v69;
        v36 = v82;
        v55 = v84;
      }
    }
    id v34 = v89;
    if (v66) {
      char v44 = 1;
    }
    else {
LABEL_55:
    }
      char v44 = 0;
  }
LABEL_56:

  v74 = (void *)MEMORY[0x1D9452090]();
  v75 = v19;
  v76 = HMFGetOSLogHandle();
  v77 = v76;
  if (v44)
  {
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
    {
      v78 = HMFGetLogIdentifier();
      v79 = [v31 shortDescription];
      *(_DWORD *)buf = 138543618;
      v92 = v78;
      __int16 v93 = 2112;
      id v94 = v79;
      _os_log_impl(&dword_1D49D5000, v77, OS_LOG_TYPE_DEBUG, "%{public}@Authenticated sender of message: %@", buf, 0x16u);
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
  {
    v80 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v92 = v80;
    __int16 v93 = 2112;
    id v94 = v31;
    _os_log_impl(&dword_1D49D5000, v77, OS_LOG_TYPE_ERROR, "%{public}@Failed to authenticate sender of message: %@", buf, 0x16u);
  }
  if (a5)
  {
    [MEMORY[0x1E4F28C58] hmErrorWithCode:17];
    BOOL v29 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v29 = 0;
  }
LABEL_17:

  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemKeychainStore, 0);
  objc_storeStrong((id *)&self->_appleAccountManager, 0);
  objc_storeStrong((id *)&self->_allowedMessages, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

- (void)setSystemKeychainStore:(id)a3
{
}

- (HAPKeyStore)systemKeychainStore
{
  return self->_systemKeychainStore;
}

- (void)setAppleAccountManager:(id)a3
{
}

- (HMDAppleAccountManager)appleAccountManager
{
  return self->_appleAccountManager;
}

- (NSArray)allowedMessages
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (HMFMessageDestination)target
{
  return (HMFMessageDestination *)objc_getProperty(self, a2, 24, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDRemoteAccountMessageFilter *)self target];
  v3 = [v2 target];
  v4 = [v3 UUIDString];

  return v4;
}

- (HMDRemoteAccountMessageFilter)initWithTarget:(id)a3 allowedMessages:(id)a4 appleAccountManager:(id)a5 systemKeychainStore:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMDRemoteAccountMessageFilter;
  v15 = [(HMDMessageFilter *)&v19 initWithName:@"RemoteAccount"];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_target, a3);
    if (v12) {
      int v17 = (void *)[v12 copy];
    }
    else {
      int v17 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v16->_allowedMessages, v17);
    if (v12) {

    }
    objc_storeStrong((id *)&v16->_appleAccountManager, a5);
    objc_storeStrong((id *)&v16->_systemKeychainStore, a6);
  }

  return v16;
}

- (HMDRemoteAccountMessageFilter)initWithTarget:(id)a3 allowedMessages:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[HMDAppleAccountManager sharedManager];
  id v9 = [MEMORY[0x1E4F5BE48] systemStore];
  id v10 = [(HMDRemoteAccountMessageFilter *)self initWithTarget:v7 allowedMessages:v6 appleAccountManager:v8 systemKeychainStore:v9];

  return v10;
}

- (HMDRemoteAccountMessageFilter)initWithTarget:(id)a3
{
  return [(HMDRemoteAccountMessageFilter *)self initWithTarget:a3 allowedMessages:0];
}

- (HMDRemoteAccountMessageFilter)initWithName:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t130 != -1) {
    dispatch_once(&logCategory__hmf_once_t130, &__block_literal_global_422);
  }
  v2 = (void *)logCategory__hmf_once_v131;
  return v2;
}

uint64_t __44__HMDRemoteAccountMessageFilter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v131;
  logCategory__hmf_once_v131 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end