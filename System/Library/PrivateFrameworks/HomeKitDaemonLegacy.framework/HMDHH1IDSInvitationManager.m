@interface HMDHH1IDSInvitationManager
- (HMDHH1IDSInvitationManager)initWithHomeManager:(id)a3 workQueue:(id)a4;
- (HMDHomeManager)homeManager;
- (IDSInvitationManager)idsInvitationManager;
- (void)manager:(id)a3 incomingInvitation:(id)a4;
- (void)setIdsInvitationManager:(id)a3;
@end

@implementation HMDHH1IDSInvitationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsInvitationManager, 0);
  objc_destroyWeak((id *)&self->_homeManager);
}

- (void)setIdsInvitationManager:(id)a3
{
}

- (IDSInvitationManager)idsInvitationManager
{
  return self->_idsInvitationManager;
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (void)manager:(id)a3 incomingInvitation:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1D9452090]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    v11 = [v6 fromID];
    v12 = [v6 senderMergeID];
    *(_DWORD *)buf = 138544387;
    v45 = v10;
    __int16 v46 = 2112;
    uint64_t v47 = (uint64_t)v6;
    __int16 v48 = 2160;
    uint64_t v49 = 1752392040;
    __int16 v50 = 2112;
    v51 = v11;
    __int16 v52 = 2113;
    v53 = v12;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Received incoming incompatible HH2 invitation %@ from user %{mask.hash}@ with mergeID %{private}@", buf, 0x34u);
  }
  v13 = [v6 context];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  if (v15)
  {
    v16 = [v6 fromID];
    v17 = +[HMDAccountHandle accountHandleForDestination:v16];

    v18 = [v6 senderMergeID];
    v19 = +[HMDAccountIdentifier accountIdentifierForSenderCorrelationIdentifier:v18];

    v20 = [HMDAccount alloc];
    v43 = v17;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
    v22 = [(HMDAccount *)v20 initWithIdentifier:v19 handles:v21 devices:MEMORY[0x1E4F1CBF0]];

    v23 = [v15 dictionary];
    v24 = objc_msgSend(v23, "hmf_stringForKey:", @"kHomeName");
    if (v24)
    {
      if (!objc_msgSend(v23, "hmf_BOOLForKey:", @"HMDHomeSuppressInviteNotificationKey"))
      {
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __57__HMDHH1IDSInvitationManager_manager_incomingInvitation___block_invoke;
        v40[3] = &unk_1E6A08220;
        v40[4] = v8;
        v41 = v22;
        id v42 = v24;
        [(HMDAccount *)v41 isOfKnownPersonWithCompletion:v40];

        goto LABEL_18;
      }
      context = (void *)MEMORY[0x1D9452090]();
      v25 = v8;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v36 = HMFGetLogIdentifier();
        uint64_t v27 = [(HMDAccount *)v22 name];
        *(_DWORD *)buf = 138543874;
        v45 = v36;
        __int16 v46 = 2160;
        uint64_t v47 = 1752392040;
        __int16 v48 = 2112;
        uint64_t v49 = v27;
        v28 = (void *)v27;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping incompatible HH2 invitation from %{mask.hash}@ due to suppress notification flag", buf, 0x20u);
      }
    }
    else
    {
      context = (void *)MEMORY[0x1D9452090]();
      v25 = v8;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = v37 = v17;
        v35 = [(HMDAccount *)v22 name];
        *(_DWORD *)buf = 138543874;
        v45 = v34;
        __int16 v46 = 2160;
        uint64_t v47 = 1752392040;
        __int16 v48 = 2112;
        uint64_t v49 = (uint64_t)v35;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Dropping incompatible HH2 invitation from %{mask.hash}@ due to missing home name", buf, 0x20u);

        v17 = v37;
      }
    }

LABEL_18:

    goto LABEL_19;
  }
  v29 = (void *)MEMORY[0x1D9452090]();
  v30 = v8;
  v31 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    v32 = HMFGetLogIdentifier();
    v33 = [v6 uniqueID];
    *(_DWORD *)buf = 138543875;
    v45 = v32;
    __int16 v46 = 2112;
    uint64_t v47 = (uint64_t)v33;
    __int16 v48 = 2113;
    uint64_t v49 = (uint64_t)v6;
    _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Expected invitation (%@) with IDSDictionaryInvitationContext context but got different type %{private}@. Dropping incompatible invitation", buf, 0x20u);
  }
LABEL_19:
}

void __57__HMDHH1IDSInvitationManager_manager_incomingInvitation___block_invoke(uint64_t a1, int a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    v8 = [*(id *)(a1 + 40) name];
    *(_DWORD *)buf = 138543874;
    v24 = v7;
    __int16 v25 = 2160;
    uint64_t v26 = 1752392040;
    __int16 v27 = 2112;
    v28 = v8;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Posting bulletin for incompatible HH2 invitation from %{mask.hash}@", buf, 0x20u);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v9 = objc_msgSend(*(id *)(a1 + 32), "homeManager", 0);
  v10 = [v9 homes];

  v11 = (void *)[v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v14 isOwnerUser])
        {
          v11 = [v14 contextSPIUniqueIdentifier];
          goto LABEL_13;
        }
      }
      v11 = (void *)[v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  id v15 = +[HMDBulletinBoard sharedBulletinBoard];
  v16 = [*(id *)(a1 + 40) name];
  if (a2) {
    uint64_t v17 = *(void *)(a1 + 48);
  }
  else {
    uint64_t v17 = 0;
  }
  [v15 insertBulletinForIncompatibleInvitationFromInviterName:v16 homeName:v17 ownedHomeIdentifier:v11];
}

- (HMDHH1IDSInvitationManager)initWithHomeManager:(id)a3 workQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDHH1IDSInvitationManager;
  v8 = [(HMDHH1IDSInvitationManager *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_homeManager, v6);
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F6AB48]) initWithServiceIdentifier:@"com.apple.private.alloy.home.invite"];
    idsInvitationManager = v9->_idsInvitationManager;
    v9->_idsInvitationManager = (IDSInvitationManager *)v10;

    [(IDSInvitationManager *)v9->_idsInvitationManager setDelegate:v9 queue:v7];
  }

  return v9;
}

@end