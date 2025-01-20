@interface HMRemoteLoginHandler
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (ACAccount)loggedInAccount;
- (ACAccount)stagedLoggedInAccount;
- (BOOL)_configureAccessoryInfoDataProviderIfNeeded;
- (BOOL)didReceiveAccountInfo;
- (BOOL)isControllable;
- (BOOL)isSessionInProgress;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMAccessory)accessory;
- (HMAccessoryInfoDataProvider)accessoryInfoDataProvider;
- (HMRemoteLoginAnisetteDataProvider)anisetteDataProvider;
- (HMRemoteLoginHandler)initWithCoder:(id)a3;
- (HMRemoteLoginHandler)initWithUUID:(id)a3 accessory:(id)a4 loggedInAccount:(id)a5 stagedLoggedInAccount:(id)a6 anisetteDataProvider:(id)a7;
- (NSString)currentSessionID;
- (NSString)description;
- (NSUUID)uniqueIdentifier;
- (NSUUID)uuid;
- (_HMContext)context;
- (id)_accountFromAccountInfo:(id)a3;
- (id)logIdentifier;
- (id)messageDestination;
- (void)_callAccountUpdateDelegate;
- (void)_companionLoginWithAccount:(id)a3 completion:(id)a4;
- (void)_configureWithContext:(id)a3 accessory:(id)a4;
- (void)_handleLoginResponse:(id)a3 error:(id)a4 completion:(id)a5;
- (void)_handleQueryProxiedDeviceResponse:(id)a3 error:(id)a4 completion:(id)a5;
- (void)_handleRemoteLoginAccountUpdated:(id)a3;
- (void)_handleRemoteLoginSignoutResponse:(id)a3 error:(id)a4 completion:(id)a5;
- (void)_proxyLoginWithAuthResults:(id)a3 completion:(id)a4;
- (void)_queryProxiedDevice:(id)a3;
- (void)_signout:(id)a3;
- (void)accessoryInfoDataProvider:(id)a3 didReceiveUpdatesForAccessoryWithIdentifier:(id)a4 accountInfo:(id)a5;
- (void)companionLoginWithAccount:(id)a3 completion:(id)a4;
- (void)proxyLoginWithAuthResults:(id)a3 completion:(id)a4;
- (void)queryProxiedDevice:(id)a3;
- (void)registerForMessages;
- (void)setAccessory:(id)a3;
- (void)setAccessoryInfoDataProvider:(id)a3;
- (void)setContext:(id)a3;
- (void)setCurrentSessionID:(id)a3;
- (void)setDidReceiveAccountInfo:(BOOL)a3;
- (void)setLoggedInAccount:(id)a3;
- (void)setStagedLoggedInAccount:(id)a3;
- (void)signout:(id)a3;
- (void)updateLoggedInAccount:(id)a3 completionHandler:(id)a4;
@end

@implementation HMRemoteLoginHandler

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_accessoryInfoDataProvider, 0);
  objc_storeStrong((id *)&self->_stagedLoggedInAccount, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_anisetteDataProvider, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_currentSessionID, 0);

  objc_storeStrong((id *)&self->_loggedInAccount, 0);
}

- (void)setAccessory:(id)a3
{
}

- (HMAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);

  return (HMAccessory *)WeakRetained;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAccessoryInfoDataProvider:(id)a3
{
}

- (HMAccessoryInfoDataProvider)accessoryInfoDataProvider
{
  return self->_accessoryInfoDataProvider;
}

- (void)setStagedLoggedInAccount:(id)a3
{
}

- (ACAccount)stagedLoggedInAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDidReceiveAccountInfo:(BOOL)a3
{
  self->_didReceiveAccountInfo = a3;
}

- (BOOL)didReceiveAccountInfo
{
  return self->_didReceiveAccountInfo;
}

- (void)setContext:(id)a3
{
}

- (_HMContext)context
{
  return self->_context;
}

- (HMRemoteLoginAnisetteDataProvider)anisetteDataProvider
{
  return self->_anisetteDataProvider;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HMRemoteLoginHandler *)self uniqueIdentifier];
  v6 = [(HMRemoteLoginHandler *)self uuid];
  v7 = [(HMRemoteLoginHandler *)self accessory];
  v8 = [v7 uniqueIdentifier];
  v9 = [(HMRemoteLoginHandler *)self currentSessionID];
  [(HMRemoteLoginHandler *)self isControllable];
  v10 = HMFBooleanToString();
  [(HMRemoteLoginHandler *)self isSessionInProgress];
  v11 = HMFBooleanToString();
  v12 = [(HMRemoteLoginHandler *)self loggedInAccount];
  v13 = [v3 stringWithFormat:@"<%@: identifier = %@, uuid = %@, accessory identifier = %@, currentSessionID = %@, isControllable = %@, sessionInProgress = %@, loggedInAccount = %@>", v4, v5, v6, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (id)logIdentifier
{
  v2 = [(HMRemoteLoginHandler *)self uuid];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)_accountFromAccountInfo:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x19F3A64A0]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v34 = 138543618;
    v35 = v8;
    __int16 v36 = 2112;
    id v37 = v4;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Transferring account: %@", (uint8_t *)&v34, 0x16u);
  }
  v9 = (void *)MEMORY[0x19F3A64A0]();
  v10 = v6;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = HMFGetLogIdentifier();
    v13 = [v4 username];
    v14 = [v4 aaAltDSID];
    v15 = [v4 amsAltDSID];
    [v4 signedIn];
    v16 = HMFBooleanToString();
    int v34 = 138544386;
    v35 = v12;
    __int16 v36 = 2112;
    id v37 = v13;
    __int16 v38 = 2112;
    v39 = v14;
    __int16 v40 = 2112;
    v41 = v15;
    __int16 v42 = 2112;
    v43 = v16;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Transferring account username: %@, aaAltDSID:%@, amsAltDSID: %@, signedIn: %@", (uint8_t *)&v34, 0x34u);
  }
  v17 = [v4 username];

  if (v17)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F179C8]);
    v19 = [v18 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17890]];
    if (v19)
    {
      v20 = (void *)[objc_alloc(MEMORY[0x1E4F179B0]) initWithAccountType:v19];
      if (v20)
      {
        v21 = [v4 username];
        [v20 setUsername:v21];

        v22 = [v4 aaAltDSID];
        objc_msgSend(v20, "_aa_setAltDSID:", v22);

        v23 = [v4 amsAltDSID];
        objc_msgSend(v20, "ams_setAltDSID:", v23);

        v24 = (void *)[v20 copy];
      }
      else
      {
        v29 = (void *)MEMORY[0x19F3A64A0]();
        v30 = v10;
        v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = HMFGetLogIdentifier();
          int v34 = 138543618;
          v35 = v32;
          __int16 v36 = 2112;
          id v37 = v4;
          _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to transform accountInfo %@", (uint8_t *)&v34, 0x16u);
        }
        v24 = 0;
      }
    }
    else
    {
      v25 = (void *)MEMORY[0x19F3A64A0]();
      v26 = v10;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = HMFGetLogIdentifier();
        int v34 = 138543362;
        v35 = v28;
        _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine store account type for iTunesStore", (uint8_t *)&v34, 0xCu);
      }
      v24 = 0;
    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)accessoryInfoDataProvider:(id)a3 didReceiveUpdatesForAccessoryWithIdentifier:(id)a4 accountInfo:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x19F3A64A0]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    int v17 = 138543618;
    id v18 = v14;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Received updated accountInfo: %@", (uint8_t *)&v17, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  uint64_t v15 = [(HMRemoteLoginHandler *)v12 _accountFromAccountInfo:v10];
  loggedInAccount = v12->_loggedInAccount;
  v12->_loggedInAccount = (ACAccount *)v15;

  v12->_didReceiveAccountInfo = 1;
  os_unfair_lock_unlock(&v12->_lock);
  [(HMRemoteLoginHandler *)v12 _callAccountUpdateDelegate];
}

- (HMRemoteLoginHandler)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kIdentifierKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessory"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kRemoteLoginAccount"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kStagedRemoteLoginAccount"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kRemoteLoginAnisetterProviderBridge"];

  id v10 = [(HMRemoteLoginHandler *)self initWithUUID:v5 accessory:v6 loggedInAccount:v7 stagedLoggedInAccount:v8 anisetteDataProvider:v9];
  return v10;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  id v4 = [(HMRemoteLoginHandler *)self messageTargetUUID];
  v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (void)_handleRemoteLoginSignoutResponse:(id)a3 error:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x19F3A64A0]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  v14 = v13;
  if (v9)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      v16 = [(HMRemoteLoginHandler *)v12 loggedInAccount];
      int v21 = 138543874;
      v22 = v15;
      __int16 v23 = 2112;
      v24 = v16;
      __int16 v25 = 2112;
      id v26 = v9;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Signing out of account %@ failed with error: %@", (uint8_t *)&v21, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v17 = HMFGetLogIdentifier();
      id v18 = [(HMRemoteLoginHandler *)v12 loggedInAccount];
      int v21 = 138543618;
      v22 = v17;
      __int16 v23 = 2112;
      v24 = v18;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Signed out of account %@ successfully", (uint8_t *)&v21, 0x16u);
    }
    [(HMRemoteLoginHandler *)v12 setLoggedInAccount:0];
  }
  __int16 v19 = [(HMRemoteLoginHandler *)v12 context];
  id v20 = [v19 delegateCaller];
  [v20 callCompletion:v10 error:v9];

  [(HMRemoteLoginHandler *)v12 setCurrentSessionID:0];
}

- (void)_signout:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  v5 = [(HMRemoteLoginHandler *)self currentSessionID];

  if (v5)
  {
    if (v4)
    {
      v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = 15;
LABEL_4:
      id v8 = [v6 hmErrorWithCode:v7];
      v4[2](v4, v8);
LABEL_17:
    }
  }
  else
  {
    id v9 = [(HMRemoteLoginHandler *)self loggedInAccount];

    if (v9)
    {
      id v8 = [(HMRemoteLoginHandler *)self context];
      if (v8)
      {
        id v10 = [MEMORY[0x1E4F29128] UUID];
        __int16 v38 = @"kRemoteLoginSessionID";
        v11 = [v10 UUIDString];
        v39 = v11;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];

        id v13 = objc_alloc(MEMORY[0x1E4F654B0]);
        id v14 = objc_alloc(MEMORY[0x1E4F65488]);
        uint64_t v15 = [(HMRemoteLoginHandler *)self uuid];
        v16 = (void *)[v14 initWithTarget:v15];
        int v17 = (void *)[v13 initWithName:@"kRemoteLoginSignout" destination:v16 payload:v12];

        uint64_t v32 = MEMORY[0x1E4F143A8];
        uint64_t v33 = 3221225472;
        int v34 = __33__HMRemoteLoginHandler__signout___block_invoke;
        v35 = &unk_1E5944EF0;
        __int16 v36 = self;
        id v37 = v4;
        id v18 = (void *)MEMORY[0x19F3A64A0]([v17 setResponseHandler:&v32]);
        __int16 v19 = self;
        id v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          int v21 = HMFGetLogIdentifier();
          v22 = [(HMRemoteLoginHandler *)v19 loggedInAccount];
          *(_DWORD *)buf = 138543618;
          v41 = v21;
          __int16 v42 = 2112;
          v43 = v22;
          _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@Signing out of account: %@", buf, 0x16u);
        }
        __int16 v23 = [v8 messageDispatcher];
        [v23 sendMessage:v17];
      }
      else
      {
        v28 = (void *)MEMORY[0x19F3A64A0]();
        v29 = self;
        v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v41 = v31;
          __int16 v42 = 2080;
          v43 = "-[HMRemoteLoginHandler _signout:]";
          _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
        }
      }
      goto LABEL_17;
    }
    v24 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v25 = self;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v41 = v27;
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@There is no logged in account, cannot sign out", buf, 0xCu);
    }
    if (v4)
    {
      v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = 3;
      goto LABEL_4;
    }
  }
}

uint64_t __33__HMRemoteLoginHandler__signout___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleRemoteLoginSignoutResponse:a3 error:a2 completion:*(void *)(a1 + 40)];
}

- (void)signout:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMRemoteLoginHandler *)self context];
  if (!v4)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMRemoteLoginHandler signout:]", @"completion"];
    id v14 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v22 = v17;
      __int16 v23 = 2112;
      v24 = (const char *)v13;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0];
    objc_exception_throw(v18);
  }
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__HMRemoteLoginHandler_signout___block_invoke;
    block[3] = &unk_1E59454E8;
    block[4] = self;
    id v20 = v4;
    dispatch_async(v7, block);
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v22 = v11;
      __int16 v23 = 2080;
      v24 = "-[HMRemoteLoginHandler signout:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v12);
  }
}

uint64_t __32__HMRemoteLoginHandler_signout___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _signout:*(void *)(a1 + 40)];
}

- (void)_handleLoginResponse:(id)a3 error:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    v11 = (void *)MEMORY[0x19F3A64A0]();
    v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v14;
      __int16 v28 = 2112;
      id v29 = v9;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to login with error: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v15 = objc_msgSend(v8, "hmf_dataForKey:", @"kRemoteLoginAccount");
    if (v15)
    {
      id v25 = 0;
      v16 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v15 error:&v25];
      id v17 = v25;
      if (!v16)
      {
        id v18 = (void *)MEMORY[0x19F3A64A0]();
        __int16 v19 = self;
        id v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          int v21 = v24 = v18;
          *(_DWORD *)buf = 138543618;
          uint64_t v27 = v21;
          __int16 v28 = 2112;
          id v29 = v17;
          _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive logged in account from logged in account data: %@", buf, 0x16u);

          id v18 = v24;
        }
      }
    }
    else
    {
      v16 = 0;
    }
    -[HMRemoteLoginHandler setLoggedInAccount:](self, "setLoggedInAccount:", v16, v24);
  }
  v22 = [(HMRemoteLoginHandler *)self context];
  __int16 v23 = [v22 delegateCaller];
  [v23 callCompletion:v10 error:v9];

  [(HMRemoteLoginHandler *)self setCurrentSessionID:0];
}

- (void)_proxyLoginWithAuthResults:(id)a3 completion:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (void *)[a3 copy];
  id v8 = [(HMRemoteLoginHandler *)self currentSessionID];

  if (!v8)
  {
    v12 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v13 = *MEMORY[0x1E4F4EE10];
    uint64_t v14 = objc_msgSend(v7, "hmf_stringForKey:", *MEMORY[0x1E4F4EE10]);
    if (!v14) {
      goto LABEL_12;
    }
    uint64_t v15 = (void *)v14;
    v50 = v12;
    uint64_t v16 = *MEMORY[0x1E4F4EDF0];
    uint64_t v17 = objc_msgSend(v7, "hmf_stringForKey:", *MEMORY[0x1E4F4EDF0]);
    if (v17)
    {
      id v18 = (void *)v17;
      uint64_t v19 = *MEMORY[0x1E4F4EDE8];
      uint64_t v20 = objc_msgSend(v7, "hmf_stringForKey:", *MEMORY[0x1E4F4EDE8]);
      if (v20)
      {
        int v21 = (void *)v20;
        uint64_t v49 = *MEMORY[0x1E4F4ED98];
        v22 = objc_msgSend(v7, "hmf_stringForKey:");

        v12 = v50;
        if (v22)
        {
          uint64_t v23 = [(HMRemoteLoginHandler *)self context];
          if (v23)
          {
            v24 = (void *)v23;
            v55[0] = v13;
            id v25 = objc_msgSend(v7, "hmf_stringForKey:", v13);
            v56[0] = v25;
            v55[1] = v16;
            id v26 = objc_msgSend(v7, "hmf_stringForKey:", v16);
            v56[1] = v26;
            v55[2] = v19;
            uint64_t v27 = objc_msgSend(v7, "hmf_stringForKey:", v19);
            v56[2] = v27;
            v55[3] = v49;
            __int16 v28 = objc_msgSend(v7, "hmf_stringForKey:");
            v56[3] = v28;
            id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:4];

            v53[0] = @"kRemoteLoginSessionID";
            uint64_t v30 = [v50 UUIDString];
            v53[1] = @"kRemoteLoginAuthResults";
            v54[0] = v30;
            v31 = encodeRootObject(v29);
            v54[1] = v31;
            uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];

            id v33 = objc_alloc(MEMORY[0x1E4F654B0]);
            id v34 = objc_alloc(MEMORY[0x1E4F65488]);
            v35 = [(HMRemoteLoginHandler *)self uuid];
            __int16 v36 = (void *)[v34 initWithTarget:v35];
            id v37 = (void *)[v33 initWithName:@"kRemoteLoginProxyAuthentication" destination:v36 payload:v32];

            v12 = v50;
            v51[0] = MEMORY[0x1E4F143A8];
            v51[1] = 3221225472;
            v51[2] = __62__HMRemoteLoginHandler__proxyLoginWithAuthResults_completion___block_invoke;
            v51[3] = &unk_1E5944EF0;
            v51[4] = self;
            id v52 = v6;
            [v37 setResponseHandler:v51];
            __int16 v38 = [v24 messageDispatcher];
            [v38 sendMessage:v37];
          }
          else
          {
            v45 = (void *)MEMORY[0x19F3A64A0]();
            v46 = self;
            v47 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              v48 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v58 = v48;
              __int16 v59 = 2080;
              v60 = "-[HMRemoteLoginHandler _proxyLoginWithAuthResults:completion:]";
              _os_log_impl(&dword_19D1A8000, v47, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
            }
            v24 = 0;
          }
          goto LABEL_16;
        }
LABEL_12:
        v39 = (void *)MEMORY[0x19F3A64A0]();
        __int16 v40 = self;
        v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          __int16 v42 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v58 = v42;
          _os_log_impl(&dword_19D1A8000, v41, OS_LOG_TYPE_ERROR, "%{public}@Missing required auth parameters", buf, 0xCu);
        }
        if (!v6) {
          goto LABEL_17;
        }
        v24 = [(HMRemoteLoginHandler *)v40 context];
        v43 = [v24 delegateCaller];
        uint64_t v44 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
        [v43 callCompletion:v6 error:v44];

LABEL_16:
LABEL_17:

        goto LABEL_18;
      }
    }
    v12 = v50;
    goto LABEL_12;
  }
  if (v6)
  {
    id v9 = [(HMRemoteLoginHandler *)self context];
    id v10 = [v9 delegateCaller];
    v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:15];
    [v10 callCompletion:v6 error:v11];
  }
LABEL_18:
}

uint64_t __62__HMRemoteLoginHandler__proxyLoginWithAuthResults_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleLoginResponse:a3 error:a2 completion:*(void *)(a1 + 40)];
}

- (void)proxyLoginWithAuthResults:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMRemoteLoginHandler *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMRemoteLoginHandler proxyLoginWithAuthResults:completion:]", @"completion"];
    uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v20;
      __int16 v27 = 2112;
      __int16 v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__HMRemoteLoginHandler_proxyLoginWithAuthResults_completion___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    v11 = (void *)MEMORY[0x19F3A64A0]();
    v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v26 = v14;
      __int16 v27 = 2080;
      __int16 v28 = "-[HMRemoteLoginHandler proxyLoginWithAuthResults:completion:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __61__HMRemoteLoginHandler_proxyLoginWithAuthResults_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _proxyLoginWithAuthResults:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_handleQueryProxiedDeviceResponse:(id)a3 error:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HMRemoteLoginHandler *)self setCurrentSessionID:0];
  if (v8)
  {
    v12 = objc_msgSend(v8, "hmf_dataForKey:", @"kRemoteLoginProxiedDevice");
    if (v12)
    {
      id v30 = v9;
      uint64_t v13 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:&v30];
      id v14 = v30;

      if (v13)
      {
        uint64_t v15 = (void *)MEMORY[0x19F3A64A0]();
        uint64_t v16 = self;
        uint64_t v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          id v18 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v32 = v18;
          __int16 v33 = 2112;
          id v34 = v13;
          _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@Query proxied device responded with device: %@", buf, 0x16u);
        }
        uint64_t v19 = [(HMRemoteLoginHandler *)v16 context];
        uint64_t v20 = [v19 delegateCaller];
        [v20 callCompletion:v10 error:0 proxiedDevice:v13];

LABEL_18:
        id v9 = v14;
        goto LABEL_19;
      }
    }
    else
    {
      id v14 = v9;
    }
    id v26 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v27 = self;
    __int16 v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v32 = v29;
      __int16 v33 = 2112;
      id v34 = v8;
      __int16 v35 = 2112;
      id v36 = v14;
      _os_log_impl(&dword_19D1A8000, v28, OS_LOG_TYPE_ERROR, "%{public}@Query proxied device failed to decode with response: %@ error: %@", buf, 0x20u);
    }
    uint64_t v13 = [(HMRemoteLoginHandler *)v27 context];
    uint64_t v19 = [v13 delegateCaller];
    [v19 callCompletion:v10 error:v14 proxiedDevice:0];
    goto LABEL_18;
  }
  id v21 = (void *)MEMORY[0x19F3A64A0](v11);
  v22 = self;
  id v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    id v25 = v9;
    if (!v9)
    {
      id v25 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    }
    *(_DWORD *)buf = 138543618;
    id v32 = v24;
    __int16 v33 = 2112;
    id v34 = v25;
    _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Query proxied device responded with error: %@", buf, 0x16u);
    if (!v9) {
  }
    }
  v12 = [(HMRemoteLoginHandler *)v22 context];
  uint64_t v13 = [v12 delegateCaller];
  [v13 callCompletion:v10 error:v9 proxiedDevice:0];
LABEL_19:
}

- (void)_queryProxiedDevice:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void))a3;
  v5 = [(HMRemoteLoginHandler *)self context];
  if (v5)
  {
    id v6 = [(HMRemoteLoginHandler *)self currentSessionID];

    if (v6)
    {
      if (v4)
      {
        id v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:15];
        v4[2](v4, v7, 0);
      }
    }
    else
    {
      v12 = [MEMORY[0x1E4F29128] UUID];
      __int16 v28 = @"kRemoteLoginSessionID";
      uint64_t v13 = [v12 UUIDString];
      uint64_t v29 = v13;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];

      id v15 = objc_alloc(MEMORY[0x1E4F654B0]);
      id v16 = objc_alloc(MEMORY[0x1E4F65488]);
      uint64_t v17 = [(HMRemoteLoginHandler *)self uuid];
      id v18 = (void *)[v16 initWithTarget:v17];
      uint64_t v19 = (void *)[v15 initWithName:@"kRemoteLoginQueryProxiedDevice" destination:v18 payload:v14];

      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      id v24 = __44__HMRemoteLoginHandler__queryProxiedDevice___block_invoke;
      id v25 = &unk_1E5944EF0;
      id v26 = self;
      __int16 v27 = v4;
      [v19 setResponseHandler:&v22];
      uint64_t v20 = objc_msgSend(v5, "messageDispatcher", v22, v23, v24, v25, v26);
      [v20 sendMessage:v19];

      id v21 = [v12 UUIDString];
      [(HMRemoteLoginHandler *)self setCurrentSessionID:v21];
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v31 = v11;
      __int16 v32 = 2080;
      __int16 v33 = "-[HMRemoteLoginHandler _queryProxiedDevice:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __44__HMRemoteLoginHandler__queryProxiedDevice___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleQueryProxiedDeviceResponse:a3 error:a2 completion:*(void *)(a1 + 40)];
}

- (void)queryProxiedDevice:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMRemoteLoginHandler *)self context];
  id v6 = v5;
  if (v5)
  {
    if (!v4)
    {
      v12 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v19 = v14;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@queryProxiedDevice - nil completion", buf, 0xCu);
      }
      id v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must provide a completion handler" userInfo:0];
      objc_exception_throw(v15);
    }
    id v7 = [v5 queue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __43__HMRemoteLoginHandler_queryProxiedDevice___block_invoke;
    v16[3] = &unk_1E59454E8;
    v16[4] = self;
    id v17 = v4;
    dispatch_async(v7, v16);
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v11;
      __int16 v20 = 2080;
      id v21 = "-[HMRemoteLoginHandler queryProxiedDevice:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __43__HMRemoteLoginHandler_queryProxiedDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queryProxiedDevice:*(void *)(a1 + 40)];
}

- (void)_companionLoginWithAccount:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(HMRemoteLoginHandler *)self context];
  if (v8)
  {
    id v9 = [(HMRemoteLoginHandler *)self currentSessionID];

    if (v9)
    {
      if (v7)
      {
        id v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:15];
        v7[2](v7, v10);
      }
    }
    else
    {
      id v15 = [MEMORY[0x1E4F29128] UUID];
      v32[0] = @"kRemoteLoginSessionID";
      id v16 = [v15 UUIDString];
      v32[1] = @"kRemoteLoginAccount";
      v33[0] = v16;
      id v17 = encodeRootObject(v6);
      v33[1] = v17;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];

      id v19 = objc_alloc(MEMORY[0x1E4F654B0]);
      id v20 = objc_alloc(MEMORY[0x1E4F65488]);
      id v21 = [(HMRemoteLoginHandler *)self uuid];
      uint64_t v22 = (void *)[v20 initWithTarget:v21];
      uint64_t v23 = (void *)[v19 initWithName:@"kRemoteLoginCompanionAuthentication" destination:v22 payload:v18];

      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      __int16 v28 = __62__HMRemoteLoginHandler__companionLoginWithAccount_completion___block_invoke;
      uint64_t v29 = &unk_1E5944EF0;
      id v30 = self;
      v31 = v7;
      [v23 setResponseHandler:&v26];
      id v24 = objc_msgSend(v8, "messageDispatcher", v26, v27, v28, v29, v30);
      [v24 sendMessage:v23];

      id v25 = [v15 UUIDString];
      [(HMRemoteLoginHandler *)self setCurrentSessionID:v25];
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v35 = v14;
      __int16 v36 = 2080;
      uint64_t v37 = "-[HMRemoteLoginHandler _companionLoginWithAccount:completion:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __62__HMRemoteLoginHandler__companionLoginWithAccount_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleLoginResponse:a3 error:a2 completion:*(void *)(a1 + 40)];
}

- (void)companionLoginWithAccount:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMRemoteLoginHandler *)self context];
  if (!v7)
  {
    uint64_t v16 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMRemoteLoginHandler companionLoginWithAccount:completion:]", @"completion"];
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    id v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v20;
      __int16 v27 = 2112;
      __int16 v28 = (const char *)v16;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v16 userInfo:0];
    objc_exception_throw(v21);
  }
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__HMRemoteLoginHandler_companionLoginWithAccount_completion___block_invoke;
    block[3] = &unk_1E5945138;
    block[4] = self;
    id v23 = v6;
    id v24 = v7;
    dispatch_async(v10, block);
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x19F3A64A0]();
    v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v14;
      __int16 v27 = 2080;
      __int16 v28 = "-[HMRemoteLoginHandler companionLoginWithAccount:completion:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
  }
}

uint64_t __61__HMRemoteLoginHandler_companionLoginWithAccount_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _companionLoginWithAccount:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)_callAccountUpdateDelegate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMRemoteLoginHandler *)self context];
  id v4 = [v3 delegateCaller];
  v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__HMRemoteLoginHandler__callAccountUpdateDelegate__block_invoke;
    v10[3] = &unk_1E59452E8;
    v10[4] = self;
    [v4 invokeBlock:v10];
  }
  else
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v12 = v9;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of updated logged in account due to no delegate caller on context: %@", buf, 0x16u);
    }
  }
}

void __50__HMRemoteLoginHandler__callAccountUpdateDelegate__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) accessory];
  id v3 = [v2 delegate];
  if ([v3 conformsToProtocol:&unk_1EEF70C88]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [*(id *)(a1 + 32) loggedInAccount];
  id v7 = (void *)MEMORY[0x19F3A64A0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    int v11 = 138543874;
    v12 = v10;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Notifying clients of did update logged in account: %@ delegate: %@", (uint8_t *)&v11, 0x20u);
  }
  if (objc_opt_respondsToSelector()) {
    [v5 accessory:v2 didUpdateLoggedInAccount:v6];
  }
}

- (BOOL)mergeFromNewObject:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(HMRemoteLoginHandler *)self _configureAccessoryInfoDataProviderIfNeeded];
  id v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = [(HMRemoteLoginHandler *)self accessory];
    id v10 = [v8 accessoryInfoDataProvider];

    if (v10)
    {
      int v11 = (void *)MEMORY[0x19F3A64A0]();
      v12 = self;
      __int16 v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v50 = v14;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Unsubscribe to new object's accessory info data provider", buf, 0xCu);
      }
      __int16 v15 = [v9 home];
      id v16 = [v8 accessoryInfoDataProvider];
      uint64_t v17 = [v15 uniqueIdentifier];
      id v18 = [v9 uniqueIdentifier];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __43__HMRemoteLoginHandler_mergeFromNewObject___block_invoke;
      v48[3] = &unk_1E5945188;
      v48[4] = v12;
      [v16 unsubscribeToAccessoryInfoWithHomeIdentifier:v17 accessoryIdentifier:v18 accessoryInfoTypes:2 completionHandler:v48];
    }
    id v19 = [(HMRemoteLoginHandler *)self loggedInAccount];
    id v20 = [v8 loggedInAccount];
    char v21 = HMFEqualObjects();

    if ((v21 & 1) == 0 && ([v9 supportsMessagedHomePodSettings] & 1) == 0)
    {
      uint64_t v22 = (void *)MEMORY[0x19F3A64A0]();
      id v23 = self;
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = HMFGetLogIdentifier();
        uint64_t v26 = [v8 loggedInAccount];
        *(_DWORD *)buf = 138543618;
        v50 = v25;
        __int16 v51 = 2112;
        id v52 = v26;
        _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_INFO, "%{public}@Merging logged in account: %@", buf, 0x16u);
      }
      __int16 v27 = [v8 loggedInAccount];
      [(HMRemoteLoginHandler *)v23 setLoggedInAccount:v27];

      __int16 v28 = [(HMRemoteLoginHandler *)v23 context];
      uint64_t v29 = [v28 queue];

      if (v29)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __43__HMRemoteLoginHandler_mergeFromNewObject___block_invoke_58;
        block[3] = &unk_1E59452E8;
        block[4] = v23;
        dispatch_async(v29, block);
        BOOL v5 = 1;
      }
    }
    id v30 = [(HMRemoteLoginHandler *)self stagedLoggedInAccount];
    v31 = [v8 stagedLoggedInAccount];
    char v32 = HMFEqualObjects();

    if ((v32 & 1) == 0)
    {
      __int16 v33 = (void *)MEMORY[0x19F3A64A0]();
      uint64_t v34 = self;
      __int16 v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        __int16 v36 = HMFGetLogIdentifier();
        uint64_t v37 = [v8 stagedLoggedInAccount];
        *(_DWORD *)buf = 138543618;
        v50 = v36;
        __int16 v51 = 2112;
        id v52 = v37;
        _os_log_impl(&dword_19D1A8000, v35, OS_LOG_TYPE_INFO, "%{public}@Merging staged logged in account: %@", buf, 0x16u);
      }
      uint64_t v38 = [v8 stagedLoggedInAccount];
      [(HMRemoteLoginHandler *)v34 setStagedLoggedInAccount:v38];

      v39 = [(HMRemoteLoginHandler *)v34 context];
      __int16 v40 = [v39 queue];

      if (v40)
      {
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __43__HMRemoteLoginHandler_mergeFromNewObject___block_invoke_59;
        v46[3] = &unk_1E59452E8;
        v46[4] = v34;
        dispatch_async(v40, v46);
        BOOL v5 = 1;
      }
    }
  }
  else
  {
    v41 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v42 = self;
    v43 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v50 = v44;
      _os_log_impl(&dword_19D1A8000, v43, OS_LOG_TYPE_ERROR, "%{public}@Remote login handler from new home data is nil", buf, 0xCu);
    }
  }

  return v5;
}

void __43__HMRemoteLoginHandler_mergeFromNewObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      id v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to unsubscribe to accessory info data provider with error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

uint64_t __43__HMRemoteLoginHandler_mergeFromNewObject___block_invoke_58(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callAccountUpdateDelegate];
}

uint64_t __43__HMRemoteLoginHandler_mergeFromNewObject___block_invoke_59(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callAccountUpdateDelegate];
}

- (void)_handleRemoteLoginAccountUpdated:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    id v9 = [v4 shortDescription];
    *(_DWORD *)buf = 138543618;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v9;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling remote login account updated message: %@", buf, 0x16u);
  }
  __int16 v10 = [v4 dataForKey:@"kRemoteLoginAccount"];
  if (v10)
  {
    id v17 = 0;
    id v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v17];
    id v12 = v17;
    if (!v11)
    {
      __int16 v13 = (void *)MEMORY[0x19F3A64A0]();
      id v14 = v6;
      __int16 v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v19 = v16;
        __int16 v20 = 2112;
        id v21 = v12;
        _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive logged in account from logged in account data: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v11 = 0;
  }
  [(HMRemoteLoginHandler *)v6 setLoggedInAccount:v11];
  [(HMRemoteLoginHandler *)v6 _callAccountUpdateDelegate];
}

- (BOOL)isControllable
{
  v2 = [(HMRemoteLoginHandler *)self accessory];
  char v3 = [v2 isControllable];

  return v3;
}

- (BOOL)isSessionInProgress
{
  v2 = [(HMRemoteLoginHandler *)self currentSessionID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setCurrentSessionID:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  currentSessionID = self->_currentSessionID;
  self->_currentSessionID = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)currentSessionID
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_currentSessionID;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)updateLoggedInAccount:(id)a3 completionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMRemoteLoginHandler *)self context];
  if (!v7)
  {
    uint64_t v17 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMRemoteLoginHandler updateLoggedInAccount:completionHandler:]", @"completionHandler"];
    id v18 = (void *)MEMORY[0x19F3A64A0]();
    id v19 = self;
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v21;
      __int16 v30 = 2112;
      v31 = (const char *)v17;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v22 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0];
    objc_exception_throw(v22);
  }
  id v9 = (void *)v8;
  if (v8)
  {
    __int16 v10 = (void *)[v6 copy];
    id v11 = [v9 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__HMRemoteLoginHandler_updateLoggedInAccount_completionHandler___block_invoke;
    block[3] = &unk_1E5944360;
    id v24 = v10;
    id v25 = self;
    id v27 = v7;
    id v26 = v9;
    id v12 = v10;
    dispatch_async(v11, block);
  }
  else
  {
    __int16 v13 = (void *)MEMORY[0x19F3A64A0]();
    id v14 = self;
    __int16 v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v16;
      __int16 v30 = 2080;
      v31 = "-[HMRemoteLoginHandler updateLoggedInAccount:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, id))v7 + 2))(v7, v12);
  }
}

void __64__HMRemoteLoginHandler_updateLoggedInAccount_completionHandler___block_invoke(void **a1)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v29 = @"kRemoteLoginAccount";
  v2 = a1 + 4;
  BOOL v3 = encodeRootObject(a1[4]);
  v30[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];

  id v5 = (void *)MEMORY[0x1E4F654B0];
  id v6 = [a1[5] messageDestination];
  id v7 = [v5 messageWithName:@"HMRL.ua" destination:v6 payload:v4];

  objc_initWeak(&location, a1[5]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__HMRemoteLoginHandler_updateLoggedInAccount_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E5944AE0;
  objc_copyWeak(&v27, &location);
  id v25 = *v2;
  id v26 = a1[7];
  uint64_t v8 = _Block_copy(aBlock);
  id v9 = [a1[5] context];
  __int16 v10 = [v9 pendingRequests];

  id v11 = [v7 identifier];
  id v12 = _Block_copy(v8);
  [v10 addCompletionBlock:v12 forIdentifier:v11];

  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __64__HMRemoteLoginHandler_updateLoggedInAccount_completionHandler___block_invoke_52;
  __int16 v20 = &unk_1E5945510;
  id v13 = v10;
  id v21 = v13;
  id v14 = v11;
  id v22 = v14;
  id v15 = v8;
  id v23 = v15;
  [v7 setResponseHandler:&v17];
  id v16 = objc_msgSend(a1[6], "messageDispatcher", v17, v18, v19, v20);
  [v16 sendMessage:v7 completionHandler:0];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __64__HMRemoteLoginHandler_updateLoggedInAccount_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!v3)
  {
    id v5 = (void *)MEMORY[0x19F3A64A0]();
    id v6 = WeakRetained;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 32);
      int v12 = 138543618;
      id v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Update logged in account: %@ responded with success", (uint8_t *)&v12, 0x16u);
    }
    [v6 setLoggedInAccount:*(void *)(a1 + 32)];
  }
  __int16 v10 = [WeakRetained context];
  id v11 = [v10 delegateCaller];
  [v11 callCompletion:*(void *)(a1 + 40) error:v3];
}

void __64__HMRemoteLoginHandler_updateLoggedInAccount_completionHandler___block_invoke_52(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)setLoggedInAccount:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = [(HMRemoteLoginHandler *)v6 loggedInAccount];
    int v12 = 138543874;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating logged in account: %@ from: %@", (uint8_t *)&v12, 0x20u);
  }
  os_unfair_lock_lock_with_options();
  uint64_t v10 = [v4 copy];
  loggedInAccount = v6->_loggedInAccount;
  v6->_loggedInAccount = (ACAccount *)v10;

  os_unfair_lock_unlock(&v6->_lock);
}

- (ACAccount)loggedInAccount
{
  if ([(HMRemoteLoginHandler *)self didReceiveAccountInfo])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(HMRemoteLoginHandler *)self stagedLoggedInAccount];
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  loggedInAccount = self->_loggedInAccount;
  if (!loggedInAccount) {
    loggedInAccount = v3;
  }
  id v6 = loggedInAccount;
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (NSUUID)uniqueIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", self->_uuid);
    id v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  id v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)registerForMessages
{
  id v4 = [(HMRemoteLoginHandler *)self context];
  id v3 = [v4 messageDispatcher];
  [v3 registerForMessage:@"kRemoteLoginAccountUpdatedNotificationKey" receiver:self selector:sel__handleRemoteLoginAccountUpdated_];
}

- (BOOL)_configureAccessoryInfoDataProviderIfNeeded
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMRemoteLoginHandler *)self accessory];
  id v4 = [v3 home];
  if (!v4 || ([v3 supportsMessagedHomePodSettings] & 1) == 0)
  {
    uint64_t v18 = (void *)MEMORY[0x19F3A64A0]();
    id v19 = self;
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      id v22 = [v4 uuid];
      id v23 = [v3 uuid];
      id v24 = [(HMRemoteLoginHandler *)v19 accessory];
      [v24 supportsMessagedHomePodSettings];
      id v25 = HMFBooleanToString();
      *(_DWORD *)buf = 138544130;
      uint64_t v29 = v21;
      __int16 v30 = 2112;
      v31 = v22;
      __int16 v32 = 2112;
      __int16 v33 = v23;
      __int16 v34 = 2112;
      __int16 v35 = v25;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@Did not subscribe to accessory info data provider due to home: %@ accessory: %@ supportsMessagedHomePodSettings: %@", buf, 0x2Au);
    }
    goto LABEL_16;
  }
  id v5 = [(HMRemoteLoginHandler *)self accessoryInfoDataProvider];

  if (v5)
  {
LABEL_16:
    BOOL v17 = 0;
    goto LABEL_17;
  }
  id v6 = [MEMORY[0x1E4F28F80] processInfo];
  id v7 = [v6 processName];

  if (([v7 isEqualToString:@"Home"] & 1) != 0
    || ([v7 isEqualToString:@"HDSViewService"] & 1) != 0
    || isInternalBuild() && ([v7 isEqualToString:@"hdsutil"] & 1) != 0
    || [v7 isEqualToString:@"homeutil"])
  {
    uint64_t v8 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v11;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring accessory info data provider", buf, 0xCu);
    }
    int v12 = [v4 homeManager];
    id v13 = [v12 createAccessoryInfoDataProvider];
    [(HMRemoteLoginHandler *)v9 setAccessoryInfoDataProvider:v13];

    __int16 v14 = [(HMRemoteLoginHandler *)v9 accessoryInfoDataProvider];
    id v15 = [v4 uniqueIdentifier];
    __int16 v16 = [v3 uniqueIdentifier];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __67__HMRemoteLoginHandler__configureAccessoryInfoDataProviderIfNeeded__block_invoke;
    v27[3] = &unk_1E5945188;
    v27[4] = v9;
    [v14 configureWithHomeIdentifier:v15 accessoryIdentifier:v16 accessoryInfoTypes:2 dataProviderDelegate:v9 completionHandler:v27];

    BOOL v17 = 1;
  }
  else
  {
    BOOL v17 = 0;
  }

LABEL_17:
  return v17;
}

void __67__HMRemoteLoginHandler__configureAccessoryInfoDataProviderIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x19F3A64A0]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_19D1A8000, v6, OS_LOG_TYPE_ERROR, "%{public}@Subscribed to accessory info data provider with error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_configureWithContext:(id)a3 accessory:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(HMRemoteLoginHandler *)self setContext:v7];
  [(HMRemoteLoginHandler *)self setAccessory:v6];

  id v8 = [(HMRemoteLoginHandler *)self anisetteDataProvider];
  [v8 _configureWithContext:v7];
}

- (HMRemoteLoginHandler)initWithUUID:(id)a3 accessory:(id)a4 loggedInAccount:(id)a5 stagedLoggedInAccount:(id)a6 anisetteDataProvider:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMRemoteLoginHandler;
  uint64_t v18 = [(HMRemoteLoginHandler *)&v21 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_uuid, a3);
    objc_storeWeak((id *)&v19->_accessory, v14);
    objc_storeStrong((id *)&v19->_loggedInAccount, a5);
    objc_storeStrong((id *)&v19->_stagedLoggedInAccount, a6);
    objc_storeStrong((id *)&v19->_anisetteDataProvider, a7);
    v19->_didReceiveAccountInfo = 0;
  }

  return v19;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t51_40906 != -1) {
    dispatch_once(&logCategory__hmf_once_t51_40906, &__block_literal_global_40907);
  }
  v2 = (void *)logCategory__hmf_once_v52_40908;

  return v2;
}

uint64_t __35__HMRemoteLoginHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v52_40908;
  logCategory__hmf_once_v52_40908 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end