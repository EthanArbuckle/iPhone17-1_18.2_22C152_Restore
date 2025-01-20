@interface HMDRemoteLoginReceiver
+ (id)logCategory;
- (HMDRemoteLoginReceiverSession)loginSession;
- (void)_auditLoggedInAccountFor:(id)a3;
- (void)_authenticate:(id)a3 message:(id)a4;
- (void)_callCompletion:(id)a3;
- (void)_handleACAccountDidChangeNotification:(id)a3;
- (void)_handleCompanionAuthenticationRequest:(id)a3;
- (void)_handleProxyAuthenticationRequest:(id)a3;
- (void)_handleProxyDeviceRequest:(id)a3;
- (void)_handleSignoutRequest:(id)a3;
- (void)auditLoggedInAccount;
- (void)auditLoggedInAccountFor:(id)a3;
- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4;
- (void)didCompleteAuthentication:(id)a3 response:(id)a4;
- (void)registerForMessages;
- (void)registerForNotifications;
- (void)setLoginSession:(id)a3;
@end

@implementation HMDRemoteLoginReceiver

- (void).cxx_destruct
{
}

- (void)setLoginSession:(id)a3
{
}

- (HMDRemoteLoginReceiverSession)loginSession
{
  return self->_loginSession;
}

- (void)didCompleteAuthentication:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDRemoteLoginBase *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__HMDRemoteLoginReceiver_didCompleteAuthentication_response___block_invoke;
  block[3] = &unk_1E6A19668;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __61__HMDRemoteLoginReceiver_didCompleteAuthentication_response___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) loginSession];
  v3 = [v2 remoteAuthentication];
  v4 = *(void **)(a1 + 40);

  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = *(id *)(a1 + 32);
  id v7 = HMFGetOSLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v3 == v4)
  {
    if (v8)
    {
      v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      int v14 = 138543874;
      v15 = v11;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      uint64_t v19 = v13;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@%@ has completed with response %@", (uint8_t *)&v14, 0x20u);
    }
    [*(id *)(a1 + 32) _callCompletion:*(void *)(a1 + 48)];
  }
  else
  {
    if (v8)
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 48);
      int v14 = 138543618;
      v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Received completion from unknown remote authentication with error %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)_handleACAccountDidChangeNotification:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x1E4F17648]];

  id v7 = [v4 userInfo];
  BOOL v8 = [v7 objectForKey:*MEMORY[0x1E4F17810]];

  id v9 = (void *)MEMORY[0x1D9452090]();
  uint64_t v10 = self;
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    id v26 = v4;
    uint64_t v12 = v27 = v6;
    [(HMDRemoteLoginBase *)v10 remoteLoginHandler];
    v14 = uint64_t v13 = v8;
    v15 = [v14 loggedInAccount];
    __int16 v16 = [(HMDRemoteLoginBase *)v10 remoteLoginHandler];
    uint64_t v17 = [v16 loggedInAccount];
    [v17 identifier];
    v19 = __int16 v18 = v9;
    *(_DWORD *)buf = 138544386;
    v29 = v12;
    __int16 v30 = 2112;
    v31 = v13;
    __int16 v32 = 2112;
    v33 = v27;
    __int16 v34 = 2112;
    v35 = v15;
    __int16 v36 = 2112;
    v37 = v19;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Got account change notification type:%@ identifier:%@ current:%@ currentIdentifier:%@", buf, 0x34u);

    id v9 = v18;
    BOOL v8 = v13;

    id v4 = v26;
    id v6 = v27;
  }

  if (v6)
  {
    if ([v8 isEqualToString:*MEMORY[0x1E4F17890]])
    {
      uint64_t v20 = [(HMDRemoteLoginBase *)v10 remoteLoginHandler];
      v21 = [v20 loggedInAccount];

      if (v21)
      {
        v22 = (void *)MEMORY[0x1D9452090]();
        v23 = v10;
        v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v29 = v25;
          _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Performing account audit on detecting iTunes account change with active account present.", buf, 0xCu);
        }
        [(HMDRemoteLoginReceiver *)v23 auditLoggedInAccount];
      }
    }
  }
}

- (void)_callCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = HMFGetLogIdentifier();
    int v15 = 138543618;
    __int16 v16 = v8;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Login session has ended with response %@", (uint8_t *)&v15, 0x16u);
  }
  id v9 = [(HMDRemoteLoginReceiver *)v6 loginSession];
  uint64_t v10 = [v9 completion];

  if (v10)
  {
    v11 = [(HMDRemoteLoginReceiver *)v6 loginSession];
    uint64_t v12 = [v11 completion];
    ((void (**)(void, id))v12)[2](v12, v4);
  }
  [(HMDRemoteLoginReceiver *)v6 setLoginSession:0];
  uint64_t v13 = [v4 error];

  if (!v13)
  {
    int v14 = [v4 loggedInAccount];
    [(HMDRemoteLoginReceiver *)v6 _auditLoggedInAccountFor:v14];
  }
}

- (void)_auditLoggedInAccountFor:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDRemoteLoginBase *)self remoteLoginHandler];
  id v6 = [v5 loggedInAccount];
  id v7 = objc_msgSend(v6, "aa_altDSID");
  BOOL v8 = objc_msgSend(v4, "aa_altDSID");
  if (HMFEqualObjects())
  {
    id v9 = [v5 loggedInAccount];
    uint64_t v10 = [v9 username];
    v11 = [v4 username];
    char v12 = HMFEqualObjects();

    if (v12)
    {
      uint64_t v13 = (void *)MEMORY[0x1D9452090]();
      int v14 = self;
      int v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        __int16 v16 = HMFGetLogIdentifier();
        __int16 v17 = [v5 loggedInAccount];
        int v23 = 138543874;
        v24 = v16;
        __int16 v25 = 2112;
        id v26 = v17;
        __int16 v27 = 2112;
        id v28 = v4;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@homed knowledge of logged in iTunes account %@ matches with account store: %@", (uint8_t *)&v23, 0x20u);
      }
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v18 = (void *)MEMORY[0x1D9452090]();
  uint64_t v19 = self;
  uint64_t v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = HMFGetLogIdentifier();
    v22 = [v5 loggedInAccount];
    int v23 = 138543874;
    v24 = v21;
    __int16 v25 = 2112;
    id v26 = v22;
    __int16 v27 = 2112;
    id v28 = v4;
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@homed knowledge of logged in iTunes account %@ is different than in account store: %@", (uint8_t *)&v23, 0x20u);
  }
  [v5 _updateLoggedInAccount:v4];
LABEL_10:
}

- (void)auditLoggedInAccountFor:(id)a3
{
  id v4 = a3;
  v5 = [(HMDRemoteLoginBase *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__HMDRemoteLoginReceiver_auditLoggedInAccountFor___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __50__HMDRemoteLoginReceiver_auditLoggedInAccountFor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _auditLoggedInAccountFor:*(void *)(a1 + 40)];
}

- (void)auditLoggedInAccount
{
  v3 = [(HMDRemoteLoginBase *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__HMDRemoteLoginReceiver_auditLoggedInAccount__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

void __46__HMDRemoteLoginReceiver_auditLoggedInAccount__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) accessory];
  int v3 = [v2 isCurrentAccessory];

  if (v3)
  {
    id v4 = +[HMDRemoteLoginUtilities primaryITunesAccount];
    [*(id *)(a1 + 32) _auditLoggedInAccountFor:v4];
  }
}

- (void)_handleSignoutRequest:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDRemoteLoginReceiver *)self loginSession];

  if (!v5)
  {
    int v14 = [v4 messagePayload];
    char v12 = +[HMDRemoteLoginSignoutRequest objWithDict:v14];

    if (v12)
    {
      int v15 = [v12 account];

      if (v15)
      {
        objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStoreForMediaType:", 0);
        uint64_t v13 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        __int16 v16 = [v13 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17890]];
        if (!v16)
        {
          __int16 v36 = (void *)MEMORY[0x1D9452090]();
          v37 = self;
          uint64_t v38 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v39 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v39;
            _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine store account type for iTunesStore", buf, 0xCu);
          }
          v40 = [v4 responseHandler];

          if (v40)
          {
            v59 = [v4 responseHandler];
            v41 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
            ((void (**)(void, void *, void))v59)[2](v59, v41, 0);
          }
          else
          {
            __int16 v16 = 0;
          }
          goto LABEL_38;
        }
        v58 = [v13 accountsWithAccountType:v16];
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v77 = __Block_byref_object_copy__168481;
        v78 = __Block_byref_object_dispose__168482;
        id v79 = 0;
        __int16 v17 = [v12 account];
        v57 = [v17 username];

        if (v57)
        {
          v67[0] = MEMORY[0x1E4F143A8];
          v67[1] = 3221225472;
          v67[2] = __48__HMDRemoteLoginReceiver__handleSignoutRequest___block_invoke;
          v67[3] = &unk_1E6A15580;
          id v18 = v57;
          v68 = (void (**)(void, void, void))v18;
          v69 = buf;
          uint64_t v19 = objc_msgSend(v58, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v67);
          BOOL v20 = *(void *)(*(void *)&buf[8] + 40) == 0;
          context = (void *)MEMORY[0x1D9452090](v19);
          v21 = self;
          if (v20)
          {
            HMFGetOSLogHandle();
            v49 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              v50 = HMFGetLogIdentifier();
              *(_DWORD *)v70 = 138543618;
              id v71 = v50;
              __int16 v72 = 2112;
              id v73 = v18;
              _os_log_impl(&dword_1D49D5000, v49, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine store account from request username %@", v70, 0x16u);
            }
            v51 = [v4 responseHandler];

            if (v51)
            {
              v52 = [v4 responseHandler];
              v53 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
              ((void (**)(void, void *, void))v52)[2](v52, v53, 0);
            }
          }
          else
          {
            HMFGetOSLogHandle();
            v22 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              id v55 = (id)objc_claimAutoreleasedReturnValue();
              v54 = [MEMORY[0x1E4F65538] defaultFormatter];
              id v23 = [v54 stringForObjectValue:*(void *)(*(void *)&buf[8] + 40)];
              v24 = [MEMORY[0x1E4F65538] defaultFormatter];
              __int16 v25 = [v24 stringForObjectValue:v13];
              *(_DWORD *)v70 = 138543874;
              id v71 = v55;
              __int16 v72 = 2112;
              id v73 = v23;
              __int16 v74 = 2112;
              v75 = v25;
              _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Will signout of account %@ using store %@", v70, 0x20u);
            }
            objc_initWeak((id *)v70, v21);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __48__HMDRemoteLoginReceiver__handleSignoutRequest___block_invoke_55;
            block[3] = &unk_1E6A19910;
            v65 = buf;
            id v61 = 0;
            v62 = v13;
            v63 = v21;
            objc_copyWeak(&v66, (id *)v70);
            id v64 = v4;
            dispatch_async(MEMORY[0x1E4F14428], block);

            objc_destroyWeak(&v66);
            objc_destroyWeak((id *)v70);
          }
          v47 = v68;
        }
        else
        {
          v42 = (void *)MEMORY[0x1D9452090]();
          v43 = self;
          HMFGetOSLogHandle();
          v44 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            v45 = HMFGetLogIdentifier();
            *(_DWORD *)v70 = 138543618;
            id v71 = v45;
            __int16 v72 = 2112;
            id v73 = 0;
            _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_ERROR, "%{public}@Cannot sign out of an account with username: %@", v70, 0x16u);
          }
          v46 = [v4 responseHandler];

          if (!v46) {
            goto LABEL_37;
          }
          v47 = [v4 responseHandler];
          v48 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
          ((void (**)(void, void *, void))v47)[2](v47, v48, 0);
        }
LABEL_37:

        _Block_object_dispose(buf, 8);
        goto LABEL_38;
      }
      v31 = (void *)MEMORY[0x1D9452090]();
      __int16 v32 = self;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        __int16 v34 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v34;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@There is no ACAccount provided in %@", buf, 0x16u);
      }
      v35 = [v4 responseHandler];

      if (!v35) {
        goto LABEL_40;
      }
    }
    else
    {
      id v26 = (void *)MEMORY[0x1D9452090]();
      __int16 v27 = self;
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v29;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Signout request is missing", buf, 0xCu);
      }
      __int16 v30 = [v4 responseHandler];

      if (!v30)
      {
        char v12 = 0;
LABEL_40:

        goto LABEL_41;
      }
    }
    uint64_t v13 = [v4 responseHandler];
    __int16 v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    ((void (**)(void, void *, void))v13)[2](v13, v16, 0);
LABEL_38:

    goto LABEL_39;
  }
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = HMFGetLogIdentifier();
    uint64_t v10 = [(HMDRemoteLoginReceiver *)v7 loginSession];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Login session %@ is still in progress", buf, 0x16u);
  }
  v11 = [v4 responseHandler];

  if (v11)
  {
    char v12 = [v4 responseHandler];
    uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:15];
    v12[2](v12, v13, 0);
LABEL_39:

    goto LABEL_40;
  }
LABEL_41:
}

void __48__HMDRemoteLoginReceiver__handleSignoutRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 username];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __48__HMDRemoteLoginReceiver__handleSignoutRequest___block_invoke_55(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "ams_setActive:forMediaType:", 0, *(void *)(a1 + 32));
  v2 = objc_msgSend(*(id *)(a1 + 40), "ams_saveAccount:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__HMDRemoteLoginReceiver__handleSignoutRequest___block_invoke_2;
  v8[3] = &unk_1E6A19960;
  uint64_t v3 = *(void *)(a1 + 64);
  v8[4] = *(void *)(a1 + 48);
  uint64_t v10 = v3;
  objc_copyWeak(&v11, (id *)(a1 + 72));
  id v9 = *(id *)(a1 + 56);
  [v2 addSuccessBlock:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__HMDRemoteLoginReceiver__handleSignoutRequest___block_invoke_2_57;
  v6[3] = &unk_1E6A155A8;
  v6[4] = *(void *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 56);
  id v4 = (id)v5;
  long long v7 = v5;
  [v2 addErrorBlock:v6];

  objc_destroyWeak(&v11);
}

void __48__HMDRemoteLoginReceiver__handleSignoutRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    long long v5 = HMFGetLogIdentifier();
    id v6 = [MEMORY[0x1E4F65538] defaultFormatter];
    long long v7 = [v6 stringForObjectValue:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    *(_DWORD *)buf = 138543618;
    char v12 = v5;
    __int16 v13 = 2112;
    int v14 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Succeeded in save of account: %@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__HMDRemoteLoginReceiver__handleSignoutRequest___block_invoke_56;
  v9[3] = &unk_1E6A197C8;
  v9[4] = WeakRetained;
  id v10 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __48__HMDRemoteLoginReceiver__handleSignoutRequest___block_invoke_2_57(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    long long v7 = HMFGetLogIdentifier();
    int v8 = [MEMORY[0x1E4F65538] defaultFormatter];
    id v9 = [v8 stringForObjectValue:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    int v12 = 138543874;
    __int16 v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to save account %@: %@", (uint8_t *)&v12, 0x20u);
  }
  id v10 = [*(id *)(a1 + 40) responseHandler];

  if (v10)
  {
    id v11 = [*(id *)(a1 + 40) responseHandler];
    ((void (**)(void, id, void))v11)[2](v11, v3, 0);
  }
}

void __48__HMDRemoteLoginReceiver__handleSignoutRequest___block_invoke_56(uint64_t a1)
{
  [*(id *)(a1 + 32) auditLoggedInAccountFor:0];
  v2 = [*(id *)(a1 + 40) responseHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) responseHandler];
    (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
  }
}

- (void)_authenticate:(id)a3 message:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [HMDRemoteLoginReceiverSession alloc];
  id v9 = [v6 sessionID];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __48__HMDRemoteLoginReceiver__authenticate_message___block_invoke;
  v19[3] = &unk_1E6A15558;
  id v10 = v7;
  id v20 = v10;
  id v11 = [(HMDRemoteLoginReceiverSession *)v8 initWithSessionID:v9 remoteAuthentication:v6 completion:v19];
  [(HMDRemoteLoginReceiver *)self setLoginSession:v11];

  int v12 = [(HMDRemoteLoginReceiver *)self loginSession];
  __int16 v13 = [v12 remoteAuthentication];
  [v13 authenticate];

  __int16 v14 = (void *)MEMORY[0x1D9452090]();
  uint64_t v15 = self;
  __int16 v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    uint64_t v18 = [v6 sessionID];
    *(_DWORD *)buf = 138543618;
    v22 = v17;
    __int16 v23 = 2112;
    v24 = v18;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Started authentication for session %@", buf, 0x16u);
  }
}

void __48__HMDRemoteLoginReceiver__authenticate_message___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) responseHandler];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) responseHandler];
    id v5 = [v6 messagePayload];
    ((void (**)(void, void, void *))v4)[2](v4, 0, v5);
  }
}

- (void)_handleProxyAuthenticationRequest:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDRemoteLoginReceiver *)self loginSession];

  if (!v5)
  {
    __int16 v14 = [v4 messagePayload];
    int v12 = +[HMDRemoteLoginProxyAuthenticationRequest objWithDict:v14];

    if (v12)
    {
      uint64_t v15 = [v4 remoteSourceID];
      __int16 v16 = +[HMDDevice deviceWithDestination:v15];
      id v17 = [v12 sessionID];
      uint64_t v18 = [(HMDRemoteLoginBase *)self accessory];
      uint64_t v19 = [v18 home];
      id v20 = [v19 homeManager];
      v21 = [v20 messageDispatcher];

      v22 = [HMDRemoteLoginMessageSender alloc];
      __int16 v23 = [(HMDRemoteLoginBase *)self uuid];
      v24 = [(HMDRemoteLoginBase *)self workQueue];
      uint64_t v25 = [(HMDRemoteLoginMessageSender *)v22 initWithTarget:v23 accessory:0 device:v16 workQueue:v24 messageDispatcher:v21];

      id v26 = [HMDRemoteLoginReceiverProxyAuthentication alloc];
      __int16 v27 = [(HMDRemoteLoginBase *)self workQueue];
      id v28 = [(HMDRemoteLoginReceiverProxyAuthentication *)v26 initWithSessionID:v17 remoteDevice:v16 workQueue:v27 remoteMessageSender:v25 delegate:self request:v12];

      [(HMDRemoteLoginReceiver *)self _authenticate:v28 message:v4];
    }
    else
    {
      uint64_t v29 = (void *)MEMORY[0x1D9452090]();
      __int16 v30 = self;
      v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        __int16 v32 = HMFGetLogIdentifier();
        int v35 = 138543362;
        __int16 v36 = v32;
        _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Proxy Authentication request is missing", (uint8_t *)&v35, 0xCu);
      }
      int v12 = [v4 responseHandler];

      if (v12)
      {
        v33 = [v4 responseHandler];
        __int16 v34 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
        ((void (**)(void, void *, void))v33)[2](v33, v34, 0);

        int v12 = 0;
      }
    }
    goto LABEL_12;
  }
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [(HMDRemoteLoginReceiver *)v7 loginSession];
    int v35 = 138543618;
    __int16 v36 = v9;
    __int16 v37 = 2112;
    uint64_t v38 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Login session %@ is still in progress", (uint8_t *)&v35, 0x16u);
  }
  id v11 = [v4 responseHandler];

  if (v11)
  {
    int v12 = [v4 responseHandler];
    __int16 v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:15];
    ((void (**)(void, void *, void))v12)[2](v12, v13, 0);

LABEL_12:
  }
}

- (void)_handleProxyDeviceRequest:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDRemoteLoginReceiver *)self loginSession];

  if (!v5)
  {
    __int16 v14 = [v4 messagePayload];
    int v12 = +[HMDRemoteLoginProxyDeviceRequest objWithDict:v14];

    if (!v12)
    {
      v21 = (void *)MEMORY[0x1D9452090]();
      v22 = self;
      __int16 v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = HMFGetLogIdentifier();
        int v27 = 138543362;
        id v28 = v24;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Proxy device request is missing", (uint8_t *)&v27, 0xCu);
      }
      int v12 = [v4 responseHandler];

      if (v12)
      {
        uint64_t v25 = [v4 responseHandler];
        id v26 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
        ((void (**)(void, void *, void))v25)[2](v25, v26, 0);

        int v12 = 0;
      }
      goto LABEL_11;
    }
    __int16 v13 = [MEMORY[0x1E4F4F010] currentDevice];
    [v13 setLinkType:3];
    uint64_t v15 = [HMDRemoteLoginProxyDeviceResponse alloc];
    __int16 v16 = [v12 sessionID];
    id v17 = [(HMRemoteLoginMessage *)v15 initWithSessionID:v16];

    [(HMDRemoteLoginProxyDeviceResponse *)v17 setProxyDevice:v13];
    uint64_t v18 = [v4 responseHandler];

    if (v18)
    {
      uint64_t v19 = [v4 responseHandler];
      id v20 = [(HMDRemoteLoginProxyDeviceResponse *)v17 messagePayload];
      ((void (**)(void, void, void *))v19)[2](v19, 0, v20);
    }
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [(HMDRemoteLoginReceiver *)v7 loginSession];
    int v27 = 138543618;
    id v28 = v9;
    __int16 v29 = 2112;
    __int16 v30 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Login session %@ is still in progress", (uint8_t *)&v27, 0x16u);
  }
  id v11 = [v4 responseHandler];

  if (v11)
  {
    int v12 = [v4 responseHandler];
    __int16 v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:15];
    ((void (**)(void, void *, void))v12)[2](v12, v13, 0);
    goto LABEL_10;
  }
LABEL_12:
}

- (void)_handleCompanionAuthenticationRequest:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDRemoteLoginReceiver *)self loginSession];

  if (!v5)
  {
    __int16 v14 = [v4 messagePayload];
    int v12 = +[HMDRemoteLoginCompanionAuthenticationRequest objWithDict:v14];

    if (v12)
    {
      uint64_t v15 = [v4 remoteSourceID];
      __int16 v16 = +[HMDDevice deviceWithDestination:v15];
      id v17 = [v12 sessionID];
      uint64_t v18 = [(HMDRemoteLoginBase *)self accessory];
      uint64_t v19 = [v18 home];
      id v20 = [v19 homeManager];
      v21 = [v20 messageDispatcher];

      v22 = [HMDRemoteLoginMessageSender alloc];
      __int16 v23 = [(HMDRemoteLoginBase *)self uuid];
      v24 = [(HMDRemoteLoginBase *)self workQueue];
      uint64_t v25 = [(HMDRemoteLoginMessageSender *)v22 initWithTarget:v23 accessory:0 device:v16 workQueue:v24 messageDispatcher:v21];

      id v26 = [HMDRemoteLoginReceiverCompanionAuthentication alloc];
      int v27 = [(HMDRemoteLoginBase *)self workQueue];
      id v28 = [(HMDRemoteLoginReceiverCompanionAuthentication *)v26 initWithSessionID:v17 remoteDevice:v16 workQueue:v27 remoteMessageSender:v25 delegate:self request:v12];

      [(HMDRemoteLoginReceiver *)self _authenticate:v28 message:v4];
    }
    else
    {
      __int16 v29 = (void *)MEMORY[0x1D9452090]();
      __int16 v30 = self;
      uint64_t v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        __int16 v32 = HMFGetLogIdentifier();
        int v35 = 138543362;
        __int16 v36 = v32;
        _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Companion Authentication request is missing", (uint8_t *)&v35, 0xCu);
      }
      int v12 = [v4 responseHandler];

      if (v12)
      {
        v33 = [v4 responseHandler];
        __int16 v34 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
        ((void (**)(void, void *, void))v33)[2](v33, v34, 0);

        int v12 = 0;
      }
    }
    goto LABEL_12;
  }
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [(HMDRemoteLoginReceiver *)v7 loginSession];
    int v35 = 138543618;
    __int16 v36 = v9;
    __int16 v37 = 2112;
    uint64_t v38 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Login session %@ is still in progress", (uint8_t *)&v35, 0x16u);
  }
  id v11 = [v4 responseHandler];

  if (v11)
  {
    int v12 = [v4 responseHandler];
    __int16 v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:15];
    ((void (**)(void, void *, void))v12)[2](v12, v13, 0);

LABEL_12:
  }
}

- (void)registerForNotifications
{
  id v3 = [(HMDRemoteLoginBase *)self accessory];
  int v4 = [v3 isCurrentAccessory];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__handleACAccountDidChangeNotification_ name:*MEMORY[0x1E4F178D8] object:0];
  }
}

- (void)registerForMessages
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDRemoteLoginBase *)self accessory];
  int v4 = [v3 home];
  id v5 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v4 userPrivilege:4 remoteAccessRequired:0];

  id v6 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  id v7 = [(HMDRemoteLoginBase *)self msgDispatcher];
  int v8 = +[HMDRemoteLoginCompanionAuthenticationRequest messageName];
  v22[0] = v5;
  v22[1] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  [v7 registerForMessage:v8 receiver:self policies:v9 selector:sel__handleCompanionAuthenticationRequest_];

  id v10 = [(HMDRemoteLoginBase *)self msgDispatcher];
  id v11 = +[HMDRemoteLoginProxyDeviceRequest messageName];
  v21[0] = v5;
  v21[1] = v6;
  int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  [v10 registerForMessage:v11 receiver:self policies:v12 selector:sel__handleProxyDeviceRequest_];

  __int16 v13 = [(HMDRemoteLoginBase *)self msgDispatcher];
  __int16 v14 = +[HMDRemoteLoginProxyAuthenticationRequest messageName];
  v20[0] = v5;
  v20[1] = v6;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  [v13 registerForMessage:v14 receiver:self policies:v15 selector:sel__handleProxyAuthenticationRequest_];

  __int16 v16 = [(HMDRemoteLoginBase *)self msgDispatcher];
  id v17 = +[HMDRemoteLoginSignoutRequest messageName];
  v19[0] = v5;
  v19[1] = v6;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  [v16 registerForMessage:v17 receiver:self policies:v18 selector:sel__handleSignoutRequest_];

  [(HMDRemoteLoginReceiver *)self registerForNotifications];
}

- (void)configureWithWorkQueue:(id)a3 messageDispatcher:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HMDRemoteLoginReceiver;
  [(HMDRemoteLoginBase *)&v5 configureWithWorkQueue:a3 messageDispatcher:a4];
  [(HMDRemoteLoginReceiver *)self auditLoggedInAccount];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_168523 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_168523, &__block_literal_global_168524);
  }
  v2 = (void *)logCategory__hmf_once_v1_168525;
  return v2;
}

uint64_t __37__HMDRemoteLoginReceiver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_168525;
  logCategory__hmf_once_v1_168525 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end