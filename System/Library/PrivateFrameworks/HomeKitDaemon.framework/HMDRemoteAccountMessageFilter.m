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

- (BOOL)acceptMessage:(id)a3 target:(id)a4 errorReason:(id *)a5
{
  uint64_t v89 = *MEMORY[0x263EF8340];
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
  v18 = (void *)MEMORY[0x230FBD990]();
  v19 = self;
  v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v86 = v21;
    __int16 v87 = 2112;
    id v88 = v12;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Message is targeting target: %@", buf, 0x16u);
  }
  v22 = [(HMDRemoteAccountMessageFilter *)v19 allowedMessages];
  v23 = [v12 name];
  int v24 = [v22 containsObject:v23];

  if (v24)
  {
    v25 = (void *)MEMORY[0x230FBD990]();
    v26 = v19;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v86 = v28;
      __int16 v87 = 2112;
      id v88 = v12;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Message is allowed: %@", buf, 0x16u);
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

  if (!v36)
  {
    if (![v31 isSecureRemote])
    {
      char v44 = 0;
      goto LABEL_52;
    }
    id v83 = v34;
    v45 = [v31 remoteSenderContext];
    v46 = [v45 mergeID];

    v81 = v46;
    if (v46)
    {
      v47 = [(HMDRemoteAccountMessageFilter *)v19 appleAccountManager];
      v48 = [v47 account];

      v49 = [v48 senderCorrelationIdentifier];
      if (v49)
      {
        if ([v46 isEqualToString:v49])
        {

          goto LABEL_47;
        }
      }
      else
      {
        v51 = (void *)MEMORY[0x230FBD990]();
        v52 = v19;
        v53 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v54 = v78 = v51;
          *(_DWORD *)buf = 138543618;
          v86 = v54;
          __int16 v87 = 2112;
          id v88 = v48;
          _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_ERROR, "%{public}@MergeID is not set for the current account: %@", buf, 0x16u);

          v51 = v78;
        }
      }
    }
    v55 = [(HMDRemoteAccountMessageFilter *)v19 systemKeychainStore];
    id v84 = 0;
    v56 = [v55 getLocalPairingIdentity:&v84];
    id v57 = v84;

    if (!v56)
    {
      v58 = (void *)MEMORY[0x230FBD990]();
      v59 = v19;
      v60 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v61 = v79 = v58;
        *(_DWORD *)buf = 138543618;
        v86 = v61;
        __int16 v87 = 2112;
        id v88 = v57;
        _os_log_impl(&dword_22F52A000, v60, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve local pairing identity with error: %@", buf, 0x16u);

        v58 = v79;
      }
    }
    v62 = [v31 remoteSenderContext];
    v63 = [v62 pairingIdentityIdentifier];

    if (!v63
      || ([v56 identifier],
          v64 = objc_claimAutoreleasedReturnValue(),
          int v65 = [v63 isEqualToString:v64],
          v64,
          !v65))
    {
      v80 = v57;
      v66 = (void *)MEMORY[0x230FBD990]();
      v67 = v19;
      v68 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v69 = v77 = v66;
        *(_DWORD *)buf = 138543618;
        v86 = v69;
        __int16 v87 = 2112;
        id v88 = v31;
        _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine if the message was sent from the current account: %@", buf, 0x16u);

        v66 = v77;
      }

      char v44 = 0;
      goto LABEL_51;
    }

LABEL_47:
    char v44 = 1;
LABEL_51:
    v36 = 0;
    id v34 = v83;
    goto LABEL_52;
  }
  id v82 = v34;
  v37 = v36;
  int v38 = [v36 isCurrentAccount];
  v39 = (void *)MEMORY[0x230FBD990]();
  v40 = v19;
  v41 = HMFGetOSLogHandle();
  v42 = v41;
  if (v38)
  {
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      v43 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v86 = v43;
      __int16 v87 = 2112;
      id v88 = v31;
      _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_DEBUG, "%{public}@Authenticated message sent from current account: %@", buf, 0x16u);
    }
    char v44 = 1;
  }
  else
  {
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v50 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v86 = v50;
      __int16 v87 = 2112;
      id v88 = v31;
      _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@Authenticated message not sent from current account: %@", buf, 0x16u);
    }
    char v44 = 0;
  }
  id v34 = v82;
  v36 = v37;
LABEL_52:

  v70 = (void *)MEMORY[0x230FBD990]();
  v71 = v19;
  v72 = HMFGetOSLogHandle();
  v73 = v72;
  if (v44)
  {
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    {
      v74 = HMFGetLogIdentifier();
      v75 = [v31 shortDescription];
      *(_DWORD *)buf = 138543618;
      v86 = v74;
      __int16 v87 = 2112;
      id v88 = v75;
      _os_log_impl(&dword_22F52A000, v73, OS_LOG_TYPE_DEBUG, "%{public}@Authenticated sender of message: %@", buf, 0x16u);
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
  {
    v76 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v86 = v76;
    __int16 v87 = 2112;
    id v88 = v31;
    _os_log_impl(&dword_22F52A000, v73, OS_LOG_TYPE_ERROR, "%{public}@Failed to authenticate sender of message: %@", buf, 0x16u);
  }
  if (a5)
  {
    [MEMORY[0x263F087E8] hmErrorWithCode:17];
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
      int v17 = (void *)MEMORY[0x263EFFA68];
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
  id v9 = [MEMORY[0x263F35AD0] systemStore];
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
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18_126331 != -1) {
    dispatch_once(&logCategory__hmf_once_t18_126331, &__block_literal_global_118_126332);
  }
  v2 = (void *)logCategory__hmf_once_v19_126333;
  return v2;
}

void __44__HMDRemoteAccountMessageFilter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v19_126333;
  logCategory__hmf_once_v19_126333 = v0;
}

@end