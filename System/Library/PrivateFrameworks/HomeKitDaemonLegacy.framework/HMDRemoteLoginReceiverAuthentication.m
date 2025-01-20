@interface HMDRemoteLoginReceiverAuthentication
+ (id)logCategory;
- (HMDRemoteLoginReceiverAuthentication)initWithSessionID:(id)a3 remoteDevice:(id)a4 workQueue:(id)a5 remoteMessageSender:(id)a6 delegate:(id)a7;
- (HMDRemoteLoginReceiverAuthenticationDelegate)delegate;
- (void)_authenticateAccount:(id)a3 targetedAccountType:(unint64_t)a4;
- (void)_authenticateForAccountType:(unint64_t)a3 usingAuthenticationResults:(id)a4 completionHandler:(id)a5;
- (void)_authenticateStoreWithAuthenticationResults:(id)a3 completionHandler:(id)a4;
- (void)_completedAuthenticationRequest:(id)a3 loggedInAccount:(id)a4;
- (void)_handleAuthenticationResults:(id)a3 error:(id)a4 targetedAccountType:(unint64_t)a5;
- (void)_saveRemoteVerifiedAccount:(id)a3 completion:(id)a4;
@end

@implementation HMDRemoteLoginReceiverAuthentication

- (void).cxx_destruct
{
}

- (HMDRemoteLoginReceiverAuthenticationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDRemoteLoginReceiverAuthenticationDelegate *)WeakRetained;
}

- (void)_completedAuthenticationRequest:(id)a3 loggedInAccount:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  v7 = [(HMDRemoteLoginReceiverAuthentication *)self delegate];
  if ([v7 conformsToProtocol:&unk_1F2EB3428]) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  if (objc_opt_respondsToSelector())
  {
    v10 = [HMDRemoteLoginAuthenticationResponse alloc];
    v11 = [(HMDRemoteLoginAuthentication *)self sessionID];
    v12 = [(HMRemoteLoginMessage *)v10 initWithSessionID:v11];

    if (v6) {
      [(HMDRemoteLoginAuthenticationResponse *)v12 setLoggedInAccount:v6];
    }
    [(HMRemoteLoginMessage *)v12 setError:v13];
    [v9 didCompleteAuthentication:self response:v12];
  }
}

- (void)_handleAuthenticationResults:(id)a3 error:(id)a4 targetedAccountType:(unint64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    objc_initWeak((id *)location, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __95__HMDRemoteLoginReceiverAuthentication__handleAuthenticationResults_error_targetedAccountType___block_invoke;
    v14[3] = &unk_1E6A109B8;
    objc_copyWeak(&v15, (id *)location);
    [(HMDRemoteLoginReceiverAuthentication *)self _authenticateForAccountType:a5 usingAuthenticationResults:v8 completionHandler:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v13;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Authentication results is not valid, resulted in error %@", location, 0x16u);
    }
    [(HMDRemoteLoginReceiverAuthentication *)v11 _completedAuthenticationRequest:v9 loggedInAccount:0];
  }
}

void __95__HMDRemoteLoginReceiverAuthentication__handleAuthenticationResults_error_targetedAccountType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__HMDRemoteLoginReceiverAuthentication__handleAuthenticationResults_error_targetedAccountType___block_invoke_2;
    block[3] = &unk_1E6A19668;
    block[4] = v8;
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __95__HMDRemoteLoginReceiverAuthentication__handleAuthenticationResults_error_targetedAccountType___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completedAuthenticationRequest:*(void *)(a1 + 40) loggedInAccount:*(void *)(a1 + 48)];
}

- (void)_authenticateAccount:(id)a3 targetedAccountType:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Authenticating the account with context: %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v9);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__HMDRemoteLoginReceiverAuthentication__authenticateAccount_targetedAccountType___block_invoke;
  v12[3] = &unk_1E6A10990;
  objc_copyWeak(v13, (id *)buf);
  v13[1] = (id)a4;
  [v7 authenticateWithContext:v6 completion:v12];
  objc_destroyWeak(v13);
  objc_destroyWeak((id *)buf);
}

void __81__HMDRemoteLoginReceiverAuthentication__authenticateAccount_targetedAccountType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handleAuthenticationResults:v7 error:v6 targetedAccountType:*(void *)(a1 + 40)];
}

- (void)_authenticateStoreWithAuthenticationResults:(id)a3 completionHandler:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "hmf_stringForKey:", *MEMORY[0x1E4F4EE10]);
  uint64_t v9 = objc_msgSend(v6, "hmf_stringForKey:", *MEMORY[0x1E4F4ED98]);
  v10 = objc_msgSend(v6, "hmf_stringForKey:", *MEMORY[0x1E4F4EDE8]);
  id v11 = objc_msgSend(v6, "hmf_stringForKey:", *MEMORY[0x1E4F4EDF0]);
  id v12 = (void *)MEMORY[0x1D9452090]();
  id v13 = self;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v36 = v15;
    __int16 v37 = 2112;
    v38 = v8;
    __int16 v39 = 2112;
    uint64_t v40 = v9;
    __int16 v41 = 2112;
    v42 = v10;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Authenticating iTunes account with username %@, altDSID: %@, pet: %@", buf, 0x2Au);
  }
  v28 = (void *)v9;

  __int16 v16 = (void *)MEMORY[0x1D9452090]();
  id v17 = v13;
  uint64_t v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = HMFGetLogIdentifier();
    [v11 length];
    v20 = HMFBooleanToString();
    *(_DWORD *)buf = 138543618;
    v36 = v19;
    __int16 v37 = 2112;
    v38 = v20;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Password: %@", buf, 0x16u);
  }
  id v21 = objc_alloc_init(MEMORY[0x1E4F4DBB0]);
  [v21 setAuthenticationType:1];
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F4DBC8]) initWithAuthenticationResults:v6 options:v21];
  v23 = [v22 performAuthentication];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __102__HMDRemoteLoginReceiverAuthentication__authenticateStoreWithAuthenticationResults_completionHandler___block_invoke;
  v32[3] = &unk_1E6A18F68;
  v32[4] = v17;
  id v24 = v8;
  id v33 = v24;
  id v25 = v7;
  id v34 = v25;
  [v23 addErrorBlock:v32];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __102__HMDRemoteLoginReceiverAuthentication__authenticateStoreWithAuthenticationResults_completionHandler___block_invoke_34;
  v29[3] = &unk_1E6A10968;
  v29[4] = v17;
  id v30 = v24;
  id v31 = v25;
  id v26 = v25;
  id v27 = v24;
  [v23 addSuccessBlock:v29];
}

void __102__HMDRemoteLoginReceiverAuthentication__authenticateStoreWithAuthenticationResults_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v11 = 138543874;
    id v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@iTunes authentication failed. (%@). Error: %@", (uint8_t *)&v11, 0x20u);
  }
  uint64_t v9 = *(void *)(a1 + 48);
  v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
  (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v10, 0);
}

void __102__HMDRemoteLoginReceiverAuthentication__authenticateStoreWithAuthenticationResults_completionHandler___block_invoke_34(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __102__HMDRemoteLoginReceiverAuthentication__authenticateStoreWithAuthenticationResults_completionHandler___block_invoke_2;
  v6[3] = &unk_1E6A18398;
  v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __102__HMDRemoteLoginReceiverAuthentication__authenticateStoreWithAuthenticationResults_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v5;
    __int16 v20 = 2112;
    uint64_t v21 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@iTunes successfully authenticated. Making active. (%@).", buf, 0x16u);
  }
  id v7 = [*(id *)(a1 + 48) account];
  objc_msgSend(v7, "ams_setActive:forMediaType:", 1, 0);

  id v8 = [*(id *)(a1 + 48) account];
  [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"wasOtherAccount"];

  id v9 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStoreForMediaType:", 0);
  v10 = [*(id *)(a1 + 48) account];
  int v11 = objc_msgSend(v9, "ams_saveAccount:", v10);

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __102__HMDRemoteLoginReceiverAuthentication__authenticateStoreWithAuthenticationResults_completionHandler___block_invoke_36;
  v15[3] = &unk_1E6A193D0;
  v15[4] = *(void *)(a1 + 32);
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  [v11 addSuccessBlock:v15];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102__HMDRemoteLoginReceiverAuthentication__authenticateStoreWithAuthenticationResults_completionHandler___block_invoke_38;
  v12[3] = &unk_1E6A18F68;
  void v12[4] = *(void *)(a1 + 32);
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  [v11 addErrorBlock:v12];
}

void __102__HMDRemoteLoginReceiverAuthentication__authenticateStoreWithAuthenticationResults_completionHandler___block_invoke_36(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = [MEMORY[0x1E4F65538] defaultFormatter];
    id v7 = [*(id *)(a1 + 40) account];
    id v8 = [v6 stringForObjectValue:v7];
    int v11 = 138543618;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Succeeded in save of account: %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 48);
  v10 = [*(id *)(a1 + 40) account];
  (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
}

void __102__HMDRemoteLoginReceiverAuthentication__authenticateStoreWithAuthenticationResults_completionHandler___block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [MEMORY[0x1E4F65538] defaultFormatter];
    uint64_t v9 = [*(id *)(a1 + 40) account];
    v10 = [v8 stringForObjectValue:v9];
    int v13 = 138543874;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to save account %@: %@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v11 = *(void *)(a1 + 48);
  id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
  (*(void (**)(uint64_t, void *, void))(v11 + 16))(v11, v12, 0);
}

- (void)_authenticateForAccountType:(unint64_t)a3 usingAuthenticationResults:(id)a4 completionHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *, void))a5;
  v10 = (void *)MEMORY[0x1D9452090]();
  uint64_t v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = HMFGetLogIdentifier();
    HMDRemoteLoginAccountTypeAsString(a3);
    id v14 = (char *)objc_claimAutoreleasedReturnValue();
    int v21 = 138543618;
    uint64_t v22 = v13;
    __int16 v23 = 2112;
    id v24 = v14;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Authenticating account type %@", (uint8_t *)&v21, 0x16u);
  }
  if (a3)
  {
    __int16 v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = v11;
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      uint64_t v19 = HMDRemoteLoginAccountTypeAsString(a3);
      int v21 = 138543874;
      uint64_t v22 = v18;
      __int16 v23 = 2080;
      id v24 = "-[HMDRemoteLoginReceiverAuthentication _authenticateForAccountType:usingAuthenticationResults:completionHandler:]";
      __int16 v25 = 2112;
      id v26 = v19;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@%s: Unknown account services: %@", (uint8_t *)&v21, 0x20u);
    }
    __int16 v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:43];
    v9[2](v9, v20, 0);
  }
  else
  {
    [(HMDRemoteLoginReceiverAuthentication *)v11 _authenticateStoreWithAuthenticationResults:v8 completionHandler:v9];
  }
}

- (void)_saveRemoteVerifiedAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[HMDAppleAccountManager sharedManager];
  uint64_t v9 = [v8 accountStore];

  if (v9)
  {
    v10 = +[HMDAppleAccountManager sharedManager];
    uint64_t v11 = [v10 accountStore];
    id v12 = [v6 accountType];
    int v13 = [v12 identifier];
    id v14 = [v11 accountTypeWithAccountTypeIdentifier:v13];

    [v6 setAccountType:v14];
    [v6 _setObjectID:0];
    [v6 markAllPropertiesDirty];
    __int16 v15 = +[HMDAppleAccountManager sharedManager];
    id v16 = [v15 accountStore];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __78__HMDRemoteLoginReceiverAuthentication__saveRemoteVerifiedAccount_completion___block_invoke;
    v17[3] = &unk_1E6A13888;
    v17[4] = self;
    id v19 = v7;
    id v18 = v6;
    [v16 saveVerifiedAccount:v18 withCompletionHandler:v17];
  }
  else
  {
    (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
  }
}

void __78__HMDRemoteLoginReceiverAuthentication__saveRemoteVerifiedAccount_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void **)(a1 + 40);
      int v17 = 138543618;
      id v18 = v10;
      __int16 v19 = 2112;
      __int16 v20 = v11;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Save of verified account successful; %@.",
        (uint8_t *)&v17,
        0x16u);
    }
  }
  else
  {
    uint64_t v12 = [v5 code];
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    int v13 = HMFGetOSLogHandle();
    uint64_t v9 = v13;
    if (v12 == 5)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = HMFGetLogIdentifier();
        __int16 v15 = *(void **)(a1 + 40);
        int v17 = 138543618;
        id v18 = v14;
        __int16 v19 = 2112;
        __int16 v20 = v15;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Account already existed %@.", (uint8_t *)&v17, 0x16u);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      int v17 = 138543618;
      id v18 = v16;
      __int16 v19 = 2112;
      __int16 v20 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Save of account failed. This will stop further attempts as this should not fail. Error: %@", (uint8_t *)&v17, 0x16u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (HMDRemoteLoginReceiverAuthentication)initWithSessionID:(id)a3 remoteDevice:(id)a4 workQueue:(id)a5 remoteMessageSender:(id)a6 delegate:(id)a7
{
  id v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)HMDRemoteLoginReceiverAuthentication;
  int v13 = [(HMDRemoteLoginAuthentication *)&v16 initWithSessionID:a3 remoteDevice:a4 workQueue:a5 remoteMessageSender:a6];
  id v14 = v13;
  if (v13) {
    objc_storeWeak((id *)&v13->_delegate, v12);
  }

  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_124833 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_124833, &__block_literal_global_124834);
  }
  v2 = (void *)logCategory__hmf_once_v1_124835;
  return v2;
}

uint64_t __51__HMDRemoteLoginReceiverAuthentication_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_124835;
  logCategory__hmf_once_v1_124835 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end