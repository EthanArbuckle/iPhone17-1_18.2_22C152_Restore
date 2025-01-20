@interface HMDIDSInvitationManager
+ (id)logCategory;
- (BOOL)_resolveAccountWithMergeID:(id)a3 fromAddress:(id)a4;
- (HMDHomeManager)homeManager;
- (HMDIDSInvitationManager)initWithHomeManager:(id)a3 messageDispatcher:(id)a4 queue:(id)a5 remoteAccountManager:(id)a6;
- (HMDRemoteAccountManager)remoteAccountManager;
- (HMFMessageDispatcher)messageDispatcher;
- (IDSInvitationManager)idsInvitationManager;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)workQueue;
- (id)_receivedInvitationWithUniqueID:(id)a3;
- (id)_sendOptions:(BOOL)a3;
- (id)_sentInvitationWithUniqueID:(id)a3;
- (void)_cancelIDSSentInvitations:(id)a3;
- (void)_cancelPendingIDSSentInvitationForHomeInvitationID:(id)a3 completionBlock:(id)a4;
- (void)acceptInvitationWithIDSIdentifier:(id)a3 homeInvitationID:(id)a4 dictionary:(id)a5 completionBlock:(id)a6;
- (void)auditIDSSentInvitationsUsingCurrentInvitationUUIDs:(id)a3;
- (void)cancelInvitationWithIDSIdentifier:(id)a3 homeInvitationID:(id)a4 completionBlock:(id)a5;
- (void)declineInvitationWithIDSIdentifier:(id)a3 homeInvitationID:(id)a4 completionBlock:(id)a5;
- (void)handleForwardedAcceptance:(id)a3;
- (void)manager:(id)a3 incomingInvitation:(id)a4;
- (void)manager:(id)a3 receiverDidAcceptInvitation:(id)a4;
- (void)manager:(id)a3 receiverDidDeclineInvitation:(id)a4;
- (void)manager:(id)a3 senderDidCancelInvitation:(id)a4;
- (void)sendInvitationToDestination:(id)a3 expirationDate:(id)a4 dictionary:(id)a5 homeInvitationID:(id)a6 isRestrictedGuestInvitation:(BOOL)a7 completionBlock:(id)a8;
- (void)setCallbackQueue:(id)a3;
- (void)setIdsInvitationManager:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation HMDIDSInvitationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAccountManager, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_idsInvitationManager, 0);
}

- (HMDRemoteAccountManager)remoteAccountManager
{
  return self->_remoteAccountManager;
}

- (void)setCallbackQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setIdsInvitationManager:(id)a3
{
}

- (IDSInvitationManager)idsInvitationManager
{
  return self->_idsInvitationManager;
}

- (void)handleForwardedAcceptance:(id)a3
{
  v53[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFFA08];
  v53[0] = objc_opt_class();
  v53[1] = objc_opt_class();
  v53[2] = objc_opt_class();
  v53[3] = objc_opt_class();
  v53[4] = objc_opt_class();
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:5];
  v7 = [v5 setWithArray:v6];

  v8 = [v4 stringForKey:@"HMDInvitationForwardMessageHomeUUIDKey"];
  uint64_t v9 = [v4 stringForKey:@"HMDInvitationForwardMessageInvitationUUIDKey"];
  v10 = [v4 stringForKey:@"HMDInvitationForwardMessageOriginKey"];
  v11 = [v4 stringForKey:@"HMDInvitationForwardMessageOriginMergeIDKey"];
  if (v8) {
    v12 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v8];
  }
  else {
    v12 = 0;
  }
  uint64_t v13 = [v4 dataForKey:@"HMDInvitationForwardMessageOriginPayloadKey"];
  if (v9) {
    uint64_t v14 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v9];
  }
  else {
    uint64_t v14 = 0;
  }
  v30 = (void *)v13;
  v31 = (void *)v9;
  id v40 = 0;
  v15 = [MEMORY[0x263F08928] _strictlyUnarchivedObjectOfClasses:v7 fromData:v13 error:&v40];
  id v32 = v40;
  v33 = (void *)v14;
  if (!v10 || !v11 || !v12 || !v15 || !v14)
  {
    uint64_t v22 = MEMORY[0x230FBD990]();
    v23 = self;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = contexta = v8;
      *(_DWORD *)buf = 138544642;
      v42 = v25;
      __int16 v43 = 2112;
      v44 = v10;
      __int16 v45 = 2112;
      v46 = v11;
      __int16 v47 = 2112;
      v48 = v12;
      __int16 v49 = 2112;
      v50 = v15;
      __int16 v51 = 2112;
      id v52 = v32;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Missing info on forwarded acceptance message (origin: %@ mergeID: %@ home: %@ payload: %@), error %@", buf, 0x3Eu);

      v8 = contexta;
    }

    v26 = (void *)v22;
    goto LABEL_22;
  }
  BOOL v16 = [(HMDIDSInvitationManager *)self _resolveAccountWithMergeID:v11 fromAddress:v10];
  context = (void *)MEMORY[0x230FBD990]();
  v17 = self;
  v18 = HMFGetOSLogHandle();
  v19 = v18;
  if (!v16)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v42 = v27;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to process forwarded shared user invitation acceptance due to remote account resolving error", buf, 0xCu);
    }
    v26 = context;
LABEL_22:
    goto LABEL_23;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v42 = v20;
    __int16 v43 = 2112;
    v44 = v10;
    __int16 v45 = 2112;
    v46 = v11;
    __int16 v47 = 2112;
    v48 = v12;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Processing forwarded invitation acceptance from user %@/%@ for home %@", buf, 0x2Au);
  }
  v21 = [(HMDIDSInvitationManager *)v17 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__HMDIDSInvitationManager_handleForwardedAcceptance___block_invoke;
  block[3] = &unk_264A28EB0;
  block[4] = v17;
  id v35 = v33;
  id v36 = v12;
  id v37 = v15;
  id v38 = v10;
  id v39 = v11;
  dispatch_async(v21, block);

LABEL_23:
}

void __53__HMDIDSInvitationManager_handleForwardedAcceptance___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) homeManager];
  [v2 handleAcceptRequestForIDSInvitationWithIdentifier:*(void *)(a1 + 40) homeUUID:*(void *)(a1 + 48) payload:*(void *)(a1 + 56) fromAddress:*(void *)(a1 + 64) fromMergeID:*(void *)(a1 + 72)];
}

- (void)manager:(id)a3 receiverDidDeclineInvitation:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    v12 = [v7 senderMergeID];
    *(_DWORD *)buf = 138543874;
    v28 = v11;
    __int16 v29 = 2112;
    id v30 = v7;
    __int16 v31 = 2112;
    id v32 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Received incoming request to decline invitation %@ with mergeID %@", buf, 0x20u);
  }
  uint64_t v13 = [v7 context];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v15 = [v7 context];
    BOOL v16 = [(HMDIDSInvitationManager *)v9 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__HMDIDSInvitationManager_manager_receiverDidDeclineInvitation___block_invoke;
    block[3] = &unk_264A2F2F8;
    id v24 = v7;
    id v25 = v15;
    v26 = v9;
    id v17 = v15;
    dispatch_async(v16, block);
  }
  else
  {
    v18 = (void *)MEMORY[0x230FBD990]();
    v19 = v9;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      uint64_t v22 = [v7 uniqueID];
      *(_DWORD *)buf = 138543874;
      v28 = v21;
      __int16 v29 = 2112;
      id v30 = v22;
      __int16 v31 = 2112;
      id v32 = v7;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Expected invitation (%@) with IDSDictionaryInvitationContext context but got different type %@. Dropping invitation", buf, 0x20u);
    }
  }
}

void __64__HMDIDSInvitationManager_manager_receiverDidDeclineInvitation___block_invoke(id *a1)
{
  id v2 = [a1[4] destination];
  v3 = [v2 destinationURIs];
  id v10 = [v3 anyObject];

  id v4 = objc_alloc(MEMORY[0x263F08C38]);
  v5 = [a1[5] dictionary];
  id v6 = objc_msgSend(v5, "hmf_stringForKey:", @"kHomeUUID");
  id v7 = (void *)[v4 initWithUUIDString:v6];

  v8 = [a1[6] homeManager];
  uint64_t v9 = [a1[4] uniqueID];
  [v8 handleDeclineRequestForIDSInvitationWithIdentifier:v9 fromAddress:v10 homeUUID:v7];
}

- (void)manager:(id)a3 receiverDidAcceptInvitation:(id)a4
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    v12 = [v7 senderMergeID];
    *(_DWORD *)buf = 138543874;
    v89 = v11;
    __int16 v90 = 2112;
    id v91 = v7;
    __int16 v92 = 2112;
    id v93 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Received incoming request to accept invitation %@ with mergeID %@", buf, 0x20u);
  }
  uint64_t v13 = [(HMDIDSInvitationManager *)v9 homeManager];
  uint64_t v14 = [v7 context];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if (v13)
    {
      BOOL v16 = [v7 destination];
      uint64_t v17 = [v16 destinationURIs];
      v18 = [(id)v17 anyObject];

      v19 = [v7 senderMergeID];
      LOBYTE(v17) = [(HMDIDSInvitationManager *)v9 _resolveAccountWithMergeID:v19 fromAddress:v18];

      if ((v17 & 1) == 0)
      {
        id v36 = (void *)MEMORY[0x230FBD990]();
        id v37 = v9;
        id v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          id v39 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v89 = v39;
          _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Unable to process shared user invitation acceptance due to remote account resolving error", buf, 0xCu);
        }
        goto LABEL_35;
      }
      v20 = [v7 context];
      v21 = [v20 dictionary];
      id v22 = objc_alloc(MEMORY[0x263F08C38]);
      v78 = v21;
      v23 = objc_msgSend(v21, "hmf_stringForKey:", @"kHomeUUID");
      uint64_t v24 = [v22 initWithUUIDString:v23];

      id v25 = (void *)v24;
      v26 = [v13 _homeWithUUID:v24];
      v27 = [v26 primaryResident];
      v28 = v27;
      if (v27)
      {
        if ([v27 isCurrentDevice])
        {
          [(HMDIDSInvitationManager *)v9 workQueue];
          v30 = __int16 v29 = v28;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __63__HMDIDSInvitationManager_manager_receiverDidAcceptInvitation___block_invoke;
          block[3] = &unk_264A2E908;
          id v81 = v13;
          id v82 = v7;
          id v83 = v25;
          id v84 = v78;
          id v85 = v18;
          dispatch_async(v30, block);

LABEL_34:
LABEL_35:

          goto LABEL_36;
        }
        v77 = v28;
        __int16 v45 = [v28 device];

        context = (void *)MEMORY[0x230FBD990]();
        v75 = v9;
        v46 = HMFGetOSLogHandle();
        __int16 v47 = v46;
        if (v45)
        {
          v73 = v20;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            v48 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v89 = v48;
            __int16 v90 = 2112;
            id v91 = v77;
            __int16 v92 = 2112;
            id v93 = v25;
            _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_INFO, "%{public}@Forwarding invitation acceptance to %@ as the local device is no longer the primary for %@.", buf, 0x20u);
          }
          v69 = v25;

          __int16 v49 = [HMDRemoteDeviceMessageDestination alloc];
          v50 = [v13 uuid];
          __int16 v51 = [v77 device];
          uint64_t v68 = [(HMDRemoteDeviceMessageDestination *)v49 initWithTarget:v50 device:v51];

          id v79 = 0;
          uint64_t v52 = [MEMORY[0x263F08910] archivedDataWithRootObject:v78 requiringSecureCoding:1 error:&v79];
          id contexta = v79;
          if (contexta)
          {
            v66 = (void *)v52;
            v53 = (void *)MEMORY[0x230FBD990]();
            v54 = v75;
            v55 = HMFGetOSLogHandle();
            id v25 = v69;
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v56 = v76 = v53;
              *(_DWORD *)buf = 138543874;
              v89 = v56;
              __int16 v90 = 2112;
              id v91 = contexta;
              __int16 v92 = 2112;
              id v93 = v78;
              _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_ERROR, "%{public}@Error %@ while encoding payload for forwarding invitation acceptance: %@", buf, 0x20u);

              v53 = v76;
            }

            v57 = v66;
            v58 = (void *)v68;
          }
          else
          {
            v87[0] = v18;
            v86[0] = @"HMDInvitationForwardMessageOriginKey";
            v86[1] = @"HMDInvitationForwardMessageOriginMergeIDKey";
            v67 = [v7 senderMergeID];
            v87[1] = v67;
            v86[2] = @"HMDInvitationForwardMessageHomeUUIDKey";
            v60 = [v69 UUIDString];
            v87[2] = v60;
            v87[3] = v52;
            v86[3] = @"HMDInvitationForwardMessageOriginPayloadKey";
            v86[4] = @"HMDInvitationForwardMessageInvitationUUIDKey";
            v61 = [v7 uniqueID];
            v62 = [v61 UUIDString];
            v87[4] = v62;
            [NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:5];
            v63 = v57 = (void *)v52;

            v58 = (void *)v68;
            v64 = [MEMORY[0x263F42590] messageWithName:@"HMDInvitationForwardMessage" destination:v68 payload:v63];
            v65 = [(HMDIDSInvitationManager *)v75 messageDispatcher];
            [v65 sendMessage:v64 completionHandler:0];

            id v25 = v69;
          }

          v20 = v73;
        }
        else
        {
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            v59 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v89 = v59;
            __int16 v90 = 2112;
            id v91 = v25;
            _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_ERROR, "%{public}@Unable to process shared user invitation acceptance as the primary resident for home %@ has no device", buf, 0x16u);
          }
        }
      }
      else
      {
        v74 = v26;
        v77 = 0;
        id v40 = v25;
        v41 = (void *)MEMORY[0x230FBD990]();
        v42 = v9;
        __int16 v43 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v44 = v72 = v20;
          *(_DWORD *)buf = 138543618;
          v89 = v44;
          __int16 v90 = 2112;
          id v91 = v40;
          _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_ERROR, "%{public}@Unable to process shared user invitation acceptance as there is no primary resident for home %@", buf, 0x16u);

          v20 = v72;
        }

        id v25 = v40;
        v26 = v74;
      }
      __int16 v29 = v77;
      goto LABEL_34;
    }
    __int16 v31 = (void *)MEMORY[0x230FBD990]();
    id v32 = v9;
    uint64_t v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v89 = v34;
      __int16 v90 = 2112;
      id v91 = v7;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Received shared user invitation acceptance for invitation %@ but there's no home manager.", buf, 0x16u);
      goto LABEL_13;
    }
  }
  else
  {
    __int16 v31 = (void *)MEMORY[0x230FBD990]();
    id v32 = v9;
    uint64_t v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = HMFGetLogIdentifier();
      id v35 = [v7 uniqueID];
      *(_DWORD *)buf = 138543874;
      v89 = v34;
      __int16 v90 = 2112;
      id v91 = v35;
      __int16 v92 = 2112;
      id v93 = v7;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Expected invitation (%@) with IDSDictionaryInvitationContext context but got different type %@. Dropping invitation", buf, 0x20u);

LABEL_13:
    }
  }

LABEL_36:
}

void __63__HMDIDSInvitationManager_manager_receiverDidAcceptInvitation___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) uniqueID];
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = [*(id *)(a1 + 40) senderMergeID];
  [v2 handleAcceptRequestForIDSInvitationWithIdentifier:v7 homeUUID:v5 payload:v3 fromAddress:v4 fromMergeID:v6];
}

- (void)manager:(id)a3 senderDidCancelInvitation:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Incoming request to cancel invitation %@", buf, 0x16u);
  }
  v12 = [(HMDIDSInvitationManager *)v9 workQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61__HMDIDSInvitationManager_manager_senderDidCancelInvitation___block_invoke;
  v14[3] = &unk_264A2F820;
  v14[4] = v9;
  id v15 = v7;
  id v13 = v7;
  dispatch_async(v12, v14);
}

void __61__HMDIDSInvitationManager_manager_senderDidCancelInvitation___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) homeManager];
  id v2 = [*(id *)(a1 + 40) uniqueID];
  [v3 handleCancelRequestForIDSInvitationWithIdentifier:v2];
}

- (void)manager:(id)a3 incomingInvitation:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    v12 = [v7 fromID];
    id v13 = [v7 senderMergeID];
    *(_DWORD *)buf = 138544387;
    __int16 v29 = v11;
    __int16 v30 = 2112;
    id v31 = v7;
    __int16 v32 = 2160;
    uint64_t v33 = 1752392040;
    __int16 v34 = 2112;
    id v35 = v12;
    __int16 v36 = 2113;
    id v37 = v13;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Received incoming invitation %@ from user %{mask.hash}@ with mergeID %{private}@", buf, 0x34u);
  }
  uint64_t v14 = [v7 context];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v16 = [v7 context];
    uint64_t v17 = [(HMDIDSInvitationManager *)v9 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__HMDIDSInvitationManager_manager_incomingInvitation___block_invoke;
    block[3] = &unk_264A2F2F8;
    id v25 = v7;
    v26 = v9;
    id v27 = v16;
    id v18 = v16;
    dispatch_async(v17, block);
  }
  else
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    uint64_t v20 = v9;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      v23 = [v7 uniqueID];
      *(_DWORD *)buf = 138543874;
      __int16 v29 = v22;
      __int16 v30 = 2112;
      id v31 = v23;
      __int16 v32 = 2112;
      uint64_t v33 = (uint64_t)v7;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Expected invitation (%@) with IDSDictionaryInvitationContext context but got different type %@. Dropping invitation", buf, 0x20u);
    }
  }
}

void __54__HMDIDSInvitationManager_manager_incomingInvitation___block_invoke(id *a1)
{
  v27[1] = *MEMORY[0x263EF8340];
  id v2 = [a1[4] fromID];
  id v3 = +[HMDAccountHandle accountHandleForDestination:v2];
  uint64_t v4 = [a1[4] senderMergeID];
  uint64_t v5 = +[HMDAccountIdentifier accountIdentifierForSenderCorrelationIdentifier:v4];

  id v6 = [HMDAccount alloc];
  v27[0] = v3;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  v8 = [(HMDAccount *)v6 initWithIdentifier:v5 handles:v7 devices:MEMORY[0x263EFFA68]];

  uint64_t v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = a1[5];
  v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    uint64_t v20 = v3;
    id v13 = v12 = v2;
    uint64_t v14 = [a1[4] uniqueID];
    id v15 = [v14 UUIDString];
    *(_DWORD *)buf = 138543874;
    id v22 = v13;
    __int16 v23 = 2112;
    uint64_t v24 = v15;
    __int16 v25 = 2112;
    v26 = v8;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Calling handleAccessHomeInviteFromAccount for invite %@ with account %@", buf, 0x20u);

    id v2 = v12;
    id v3 = v20;
  }

  BOOL v16 = [a1[5] homeManager];
  uint64_t v17 = [a1[4] senderMergeID];
  id v18 = [a1[4] uniqueID];
  id v19 = [a1[6] dictionary];
  [v16 handleReceivedIDSInviteFromAccount:v8 mergeID:v17 idsInvitationIdentifier:v18 payload:v19];
}

- (BOOL)_resolveAccountWithMergeID:(id)a3 fromAddress:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = +[HMDDeviceHandle deviceHandleForDestination:v7];
  uint64_t v9 = +[HMDAccountHandle accountHandleForDestination:v7];
  if (v9) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v20 = 138543874;
      v21 = v13;
      __int16 v22 = 2160;
      uint64_t v23 = 1752392040;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse sender address: %{mask.hash}@", (uint8_t *)&v20, 0x20u);
    }
    BOOL v18 = 0;
  }
  else
  {
    uint64_t v14 = +[HMDAccountIdentifier accountIdentifierForSenderCorrelationIdentifier:v6];
    id v15 = [[HMDRemoteMessageSenderContext alloc] initWithDeviceHandle:v8 accountHandle:v9 accountIdentifier:v14 deviceVersion:0 pairingIdentityIdentifier:0];
    BOOL v16 = [(HMDIDSInvitationManager *)self remoteAccountManager];
    uint64_t v17 = [v16 accountForSenderContext:v15];
    BOOL v18 = v17 != 0;
  }
  return v18;
}

- (void)cancelInvitationWithIDSIdentifier:(id)a3 homeInvitationID:(id)a4 completionBlock:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    uint64_t v33 = v14;
    __int16 v34 = 2112;
    id v35 = v9;
    __int16 v36 = 2112;
    id v37 = v8;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Request to cancelInvitationWithIdentifier (homeID:%@) idsID %@", buf, 0x20u);
  }
  if (v8)
  {
    id v15 = [(HMDIDSInvitationManager *)v12 _sentInvitationWithUniqueID:v8];
    BOOL v16 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = v12;
    BOOL v18 = HMFGetOSLogHandle();
    id v19 = v18;
    if (v15)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v33 = v20;
        __int16 v34 = 2112;
        id v35 = v9;
        __int16 v36 = 2112;
        id v37 = v15;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Sending cancellation for invite (homeID:%@) %@", buf, 0x20u);
      }
      idsInvitationManager = v17->_idsInvitationManager;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __94__HMDIDSInvitationManager_cancelInvitationWithIDSIdentifier_homeInvitationID_completionBlock___block_invoke;
      v28[3] = &unk_264A2F6E8;
      v28[4] = v17;
      id v29 = v9;
      id v30 = v8;
      id v31 = v10;
      [(IDSInvitationManager *)idsInvitationManager cancelInvitation:v15 serverAcknowledgedBlock:v28];
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v33 = v26;
        __int16 v34 = 2112;
        id v35 = v8;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not find pending invite with ID %@", buf, 0x16u);
      }
      if (v10)
      {
        id v27 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:3 userInfo:0];
        (*((void (**)(id, id, id, void *))v10 + 2))(v10, v8, v9, v27);
      }
      id v15 = 0;
    }
    goto LABEL_17;
  }
  __int16 v22 = (void *)MEMORY[0x230FBD990]();
  uint64_t v23 = v12;
  __int16 v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    id v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v33 = v25;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@A IDS invite must be provided for home invite %@, cannot cancel", buf, 0x16u);
  }
  if (v10)
  {
    id v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:20 userInfo:0];
    (*((void (**)(id, void, id, void *))v10 + 2))(v10, 0, v9, v15);
LABEL_17:
  }
}

void __94__HMDIDSInvitationManager_cancelInvitationWithIDSIdentifier_homeInvitationID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    int v11 = 138544130;
    v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Received response for cancelInvitation (homeID:%@) idsID %@, error %@", (uint8_t *)&v11, 0x2Au);
  }
  uint64_t v10 = *(void *)(a1 + 56);
  if (v10) {
    (*(void (**)(uint64_t, void, void, id))(v10 + 16))(v10, *(void *)(a1 + 48), *(void *)(a1 + 40), v3);
  }
}

- (void)acceptInvitationWithIDSIdentifier:(id)a3 homeInvitationID:(id)a4 dictionary:(id)a5 completionBlock:(id)a6
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x230FBD990]();
  __int16 v15 = self;
  uint64_t v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    __int16 v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    id v37 = v17;
    __int16 v38 = 2112;
    id v39 = v11;
    __int16 v40 = 2112;
    id v41 = v10;
    __int16 v42 = 2112;
    id v43 = v12;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Request to acceptInvitationWithIDSIdentifier (homeID:%@) idsID %@ payload %@", buf, 0x2Au);
  }
  if (v10)
  {
    id v18 = [(HMDIDSInvitationManager *)v15 _receivedInvitationWithUniqueID:v10];
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F4A028]) initWithDictionary:v12 schema:@"hk-invite-v1"];
    int v20 = (void *)MEMORY[0x230FBD990]();
    v21 = v15;
    __int16 v22 = HMFGetOSLogHandle();
    uint64_t v23 = v22;
    if (v18)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        __int16 v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v37 = v24;
        __int16 v38 = 2112;
        id v39 = v11;
        __int16 v40 = 2112;
        id v41 = v18;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Sending accept for invite (homeID:%@) %@", buf, 0x20u);
      }
      idsInvitationManager = v21->_idsInvitationManager;
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __105__HMDIDSInvitationManager_acceptInvitationWithIDSIdentifier_homeInvitationID_dictionary_completionBlock___block_invoke;
      v32[3] = &unk_264A2F6E8;
      v32[4] = v21;
      id v33 = v11;
      id v34 = v10;
      id v35 = v13;
      [(IDSInvitationManager *)idsInvitationManager acceptInvitation:v18 withContext:v19 serverAcknowledgedBlock:v32];
    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v37 = v30;
        __int16 v38 = 2112;
        id v39 = v10;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Could not find received invite with ID %@", buf, 0x16u);
      }
      if (v13)
      {
        id v31 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:3 userInfo:0];
        (*((void (**)(id, id, id, void *))v13 + 2))(v13, v10, v11, v31);
      }
    }

    goto LABEL_17;
  }
  uint64_t v26 = (void *)MEMORY[0x230FBD990]();
  id v27 = v15;
  v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    id v29 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v37 = v29;
    __int16 v38 = 2112;
    id v39 = v11;
    _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@A IDS invite must be provided for home invite %@, cannot accept", buf, 0x16u);
  }
  if (v13)
  {
    id v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:20 userInfo:0];
    (*((void (**)(id, void, id, void *))v13 + 2))(v13, 0, v11, v18);
LABEL_17:
  }
}

void __105__HMDIDSInvitationManager_acceptInvitationWithIDSIdentifier_homeInvitationID_dictionary_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    int v11 = 138544130;
    id v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Received response for acceptInvitation (homeID:%@) idsID %@, error %@", (uint8_t *)&v11, 0x2Au);
  }
  uint64_t v10 = *(void *)(a1 + 56);
  if (v10) {
    (*(void (**)(uint64_t, void, void, id))(v10 + 16))(v10, *(void *)(a1 + 48), *(void *)(a1 + 40), v3);
  }
}

- (void)declineInvitationWithIDSIdentifier:(id)a3 homeInvitationID:(id)a4 completionBlock:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  __int16 v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v33 = v14;
    __int16 v34 = 2112;
    id v35 = v9;
    __int16 v36 = 2112;
    id v37 = v8;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Request to declineInvitationWithIDSIdentifier (homeID:%@) idsID %@", buf, 0x20u);
  }
  if (v8)
  {
    __int16 v15 = [(HMDIDSInvitationManager *)v12 _receivedInvitationWithUniqueID:v8];
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    __int16 v17 = v12;
    id v18 = HMFGetOSLogHandle();
    uint64_t v19 = v18;
    if (v15)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v33 = v20;
        __int16 v34 = 2112;
        id v35 = v9;
        __int16 v36 = 2112;
        id v37 = v15;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Sending decline for invite (homeID:%@) %@", buf, 0x20u);
      }
      idsInvitationManager = v17->_idsInvitationManager;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __95__HMDIDSInvitationManager_declineInvitationWithIDSIdentifier_homeInvitationID_completionBlock___block_invoke;
      v28[3] = &unk_264A2F6E8;
      v28[4] = v17;
      id v29 = v9;
      id v30 = v8;
      id v31 = v10;
      [(IDSInvitationManager *)idsInvitationManager declineInvitation:v15 serverAcknowledgedBlock:v28];
    }
    else
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v33 = v26;
        __int16 v34 = 2112;
        id v35 = v8;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Could not find received invite with ID %@", buf, 0x16u);
      }
      if (v10)
      {
        id v27 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:2 userInfo:0];
        (*((void (**)(id, id, id, void *))v10 + 2))(v10, v8, v9, v27);
      }
      __int16 v15 = 0;
    }
  }
  else
  {
    __int16 v22 = (void *)MEMORY[0x230FBD990]();
    uint64_t v23 = v12;
    __int16 v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v33 = v25;
      __int16 v34 = 2112;
      id v35 = v9;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@A IDS invite must be provided for home invite %@, cannot decline", buf, 0x16u);
    }
    __int16 v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0C710] code:2 userInfo:0];
    if (v10) {
      (*((void (**)(id, void, id, void *))v10 + 2))(v10, 0, v9, v15);
    }
  }
}

void __95__HMDIDSInvitationManager_declineInvitationWithIDSIdentifier_homeInvitationID_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    int v11 = 138544130;
    id v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Received response for declineInvitation (homeID:%@) idsID %@, error %@", (uint8_t *)&v11, 0x2Au);
  }
  uint64_t v10 = *(void *)(a1 + 56);
  if (v10) {
    (*(void (**)(uint64_t, void, void, id))(v10 + 16))(v10, *(void *)(a1 + 48), *(void *)(a1 + 40), v3);
  }
}

- (void)_cancelPendingIDSSentInvitationForHomeInvitationID:(id)a3 completionBlock:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Checking for an existing IDSSentInvitation to cancel for homeInvitationID: %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  __int16 v40 = __Block_byref_object_copy__94415;
  id v41 = __Block_byref_object_dispose__94416;
  id v42 = 0;
  id v12 = [(IDSInvitationManager *)v9->_idsInvitationManager pendingInvitations];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __94__HMDIDSInvitationManager__cancelPendingIDSSentInvitationForHomeInvitationID_completionBlock___block_invoke;
  v30[3] = &unk_264A1E238;
  v30[4] = v9;
  id v13 = v6;
  id v31 = v13;
  __int16 v32 = buf;
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v30);

  BOOL v14 = *(void *)(*(void *)&buf[8] + 40) == 0;
  __int16 v15 = (void *)MEMORY[0x230FBD990]();
  uint64_t v16 = v9;
  if (v14)
  {
    HMFGetOSLogHandle();
    __int16 v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)id v33 = 138543362;
      __int16 v34 = v25;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@No existing IDSSentInvitation found to cancel", v33, 0xCu);
    }
    if (v7) {
      (*((void (**)(id, void, id, void))v7 + 2))(v7, 0, v13, 0);
    }
  }
  else
  {
    HMFGetOSLogHandle();
    __int16 v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      uint64_t v19 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)id v33 = 138543874;
      __int16 v34 = v18;
      __int16 v35 = 2112;
      id v36 = v13;
      __int16 v37 = 2112;
      uint64_t v38 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Sending cancellation for pending invite (homeID:%@) %@", v33, 0x20u);
    }
    int v20 = [*(id *)(*(void *)&buf[8] + 40) uniqueID];
    idsInvitationManager = v9->_idsInvitationManager;
    uint64_t v22 = *(void *)(*(void *)&buf[8] + 40);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __94__HMDIDSInvitationManager__cancelPendingIDSSentInvitationForHomeInvitationID_completionBlock___block_invoke_39;
    v26[3] = &unk_264A2F6E8;
    v26[4] = v16;
    id v27 = v13;
    id v23 = v20;
    id v28 = v23;
    id v29 = v7;
    [(IDSInvitationManager *)idsInvitationManager cancelInvitation:v22 serverAcknowledgedBlock:v26];
  }
  _Block_object_dispose(buf, 8);
}

void __94__HMDIDSInvitationManager__cancelPendingIDSSentInvitationForHomeInvitationID_completionBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = [v6 context];
  uint64_t v8 = [v7 dictionary];
  uint64_t v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = *(id *)(a1 + 32);
  int v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = HMFGetLogIdentifier();
    int v14 = 138543874;
    __int16 v15 = v12;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEBUG, "%{public}@IDSSentInvitation: %@, payload: %@", (uint8_t *)&v14, 0x20u);
  }
  id v13 = objc_msgSend(v8, "hmf_UUIDForKey:", @"kInvitationIdentifierKey");
  if (objc_msgSend(v13, "hmf_isEqualToUUID:", *(void *)(a1 + 40)))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __94__HMDIDSInvitationManager__cancelPendingIDSSentInvitationForHomeInvitationID_completionBlock___block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    int v11 = 138544130;
    id v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Received response for cancelInvitation (homeID:%@) idsID %@, error %@", (uint8_t *)&v11, 0x2Au);
  }
  uint64_t v10 = *(void *)(a1 + 56);
  if (v10) {
    (*(void (**)(uint64_t, void, void, id))(v10 + 16))(v10, *(void *)(a1 + 48), *(void *)(a1 + 40), v3);
  }
}

- (void)sendInvitationToDestination:(id)a3 expirationDate:(id)a4 dictionary:(id)a5 homeInvitationID:(id)a6 isRestrictedGuestInvitation:(BOOL)a7 completionBlock:(id)a8
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  uint64_t v19 = (void *)MEMORY[0x230FBD990]();
  uint64_t v20 = self;
  v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544386;
    id v41 = v22;
    __int16 v42 = 2112;
    id v43 = v17;
    __int16 v44 = 2112;
    id v45 = v14;
    __int16 v46 = 2112;
    id v47 = v15;
    __int16 v48 = 2112;
    id v49 = v16;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Request to sendInvitationToDestination (homeID:%@) for destination %@ expirationDate %@, payload: %@", buf, 0x34u);
  }
  id v23 = (void *)[objc_alloc(MEMORY[0x263F4A028]) initWithDictionary:v16 schema:@"hk-invite-v1"];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __142__HMDIDSInvitationManager_sendInvitationToDestination_expirationDate_dictionary_homeInvitationID_isRestrictedGuestInvitation_completionBlock___block_invoke;
  aBlock[3] = &unk_264A1E260;
  aBlock[4] = v20;
  id v38 = v17;
  id v39 = v18;
  id v24 = v18;
  id v25 = v17;
  uint64_t v26 = _Block_copy(aBlock);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __142__HMDIDSInvitationManager_sendInvitationToDestination_expirationDate_dictionary_homeInvitationID_isRestrictedGuestInvitation_completionBlock___block_invoke_37;
  v31[3] = &unk_264A1E288;
  v31[4] = v20;
  id v32 = v14;
  id v33 = v15;
  id v34 = v23;
  BOOL v36 = a7;
  id v35 = v26;
  id v27 = v26;
  id v28 = v23;
  id v29 = v15;
  id v30 = v14;
  [(HMDIDSInvitationManager *)v20 _cancelPendingIDSSentInvitationForHomeInvitationID:v25 completionBlock:v31];
}

void __142__HMDIDSInvitationManager_sendInvitationToDestination_expirationDate_dictionary_homeInvitationID_isRestrictedGuestInvitation_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = [v5 uniqueID];
    int v15 = 138544130;
    id v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = v11;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Received server response for invitation (homeID:%@): IDSID %@ with error %@", (uint8_t *)&v15, 0x2Au);
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13)
  {
    id v14 = [v5 uniqueID];
    (*(void (**)(uint64_t, void *, void, id))(v13 + 16))(v13, v14, *(void *)(a1 + 40), v6);
  }
}

void __142__HMDIDSInvitationManager_sendInvitationToDestination_expirationDate_dictionary_homeInvitationID_isRestrictedGuestInvitation_completionBlock___block_invoke_37(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) idsInvitationManager];
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) _sendOptions:*(unsigned __int8 *)(a1 + 72)];
  [v6 sendInvitationToDestination:v4 expirationDate:v2 context:v3 options:v5 serverAcknowledgedBlock:*(void *)(a1 + 64)];
}

- (void)_cancelIDSSentInvitations:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDIDSInvitationManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  char v30 = 1;
  id v6 = dispatch_group_create();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v7)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        dispatch_group_enter(v6);
        uint64_t v10 = (void *)MEMORY[0x230FBD990]();
        uint64_t v11 = self;
        HMFGetOSLogHandle();
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v32 = v13;
          __int16 v33 = 2112;
          uint64_t v34 = v9;
          _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Sending cancellation for existing sent invite %@", buf, 0x16u);
        }
        idsInvitationManager = self->_idsInvitationManager;
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __53__HMDIDSInvitationManager__cancelIDSSentInvitations___block_invoke;
        v22[3] = &unk_264A2DA18;
        v22[4] = v9;
        v22[5] = v11;
        id v24 = v29;
        uint64_t v23 = v6;
        [(IDSInvitationManager *)idsInvitationManager cancelInvitation:v9 serverAcknowledgedBlock:v22];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v7);
  }

  int v15 = [(HMDIDSInvitationManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__HMDIDSInvitationManager__cancelIDSSentInvitations___block_invoke_34;
  block[3] = &unk_264A2F698;
  void block[4] = self;
  id v20 = obj;
  __int16 v21 = v29;
  id v16 = obj;
  dispatch_group_notify(v6, v15, block);

  _Block_object_dispose(v29, 8);
}

void __53__HMDIDSInvitationManager__cancelIDSSentInvitations___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) uniqueID];
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v11 = 138543874;
      id v12 = v9;
      __int16 v13 = 2112;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to cancel existing sent invite idsID %@, error %@", (uint8_t *)&v11, 0x20u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      id v12 = v10;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Successfully canceled existing sent invite idsID %@", (uint8_t *)&v11, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __53__HMDIDSInvitationManager__cancelIDSSentInvitations___block_invoke_34(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = [*(id *)(a1 + 40) count];
    uint64_t v7 = HMFBooleanToString();
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    __int16 v13 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Canceling [%lu] existing IDSSentInvitations finished, all succeeded: %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)auditIDSSentInvitationsUsingCurrentInvitationUUIDs:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Auditing existing IDSSentInvitations using allow set: %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__94415;
  __int16 v19 = __Block_byref_object_dispose__94416;
  id v20 = [MEMORY[0x263EFF980] array];
  uint64_t v9 = [(IDSInvitationManager *)v6->_idsInvitationManager pendingInvitations];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__HMDIDSInvitationManager_auditIDSSentInvitationsUsingCurrentInvitationUUIDs___block_invoke;
  v13[3] = &unk_264A1E238;
  id v10 = v4;
  id v14 = v10;
  __int16 v15 = v6;
  id v16 = buf;
  objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);

  uint64_t v11 = [(HMDIDSInvitationManager *)v6 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__HMDIDSInvitationManager_auditIDSSentInvitationsUsingCurrentInvitationUUIDs___block_invoke_31;
  block[3] = &unk_264A2F0A0;
  void block[4] = v6;
  void block[5] = buf;
  dispatch_async(v11, block);

  _Block_object_dispose(buf, 8);
}

void __78__HMDIDSInvitationManager_auditIDSSentInvitationsUsingCurrentInvitationUUIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 uniqueID];
  char v5 = [*(id *)(a1 + 32) containsObject:v4];
  uint64_t v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 40);
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    id v10 = HMFBooleanToString();
    int v11 = 138543874;
    __int16 v12 = v9;
    __int16 v13 = 2112;
    id v14 = v10;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Should cancel %@, IDSSentInvitation: %@", (uint8_t *)&v11, 0x20u);
  }
  if ((v5 & 1) == 0) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v3];
  }
}

void __78__HMDIDSInvitationManager_auditIDSSentInvitationsUsingCurrentInvitationUUIDs___block_invoke_31(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = (id)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copy];
  [v1 _cancelIDSSentInvitations:v2];
}

- (id)_sendOptions:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  char v5 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  if (v3)
  {
    uint64_t v6 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F49EA0]];
    [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F49F68]];
  }
  id v7 = [(HMDIDSInvitationManager *)self homeManager];
  int v8 = [v7 appleAccountManager];
  uint64_t v9 = [v8 account];
  id v10 = [v9 primaryHandle];
  int v11 = [v10 URI];
  __int16 v12 = [v11 prefixedURI];

  if (v12)
  {
    [v5 setObject:v12 forKeyedSubscript:*MEMORY[0x263F49F10]];
    id v13 = v5;
  }
  else
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    __int16 v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      uint64_t v18 = [(HMDIDSInvitationManager *)v15 homeManager];
      __int16 v19 = [v18 appleAccountManager];
      id v20 = [v19 account];
      uint64_t v21 = [v20 primaryHandle];
      int v23 = 138543874;
      id v24 = v17;
      __int16 v25 = 2160;
      uint64_t v26 = 1752392040;
      __int16 v27 = 2112;
      long long v28 = v21;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to extract fromID for current account's primary handle: %{mask.hash}@", (uint8_t *)&v23, 0x20u);
    }
    id v13 = 0;
  }

  return v13;
}

- (id)_receivedInvitationWithUniqueID:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    char v5 = [(IDSInvitationManager *)self->_idsInvitationManager receivedInvitations];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __59__HMDIDSInvitationManager__receivedInvitationWithUniqueID___block_invoke;
    v12[3] = &unk_264A1E210;
    id v13 = v4;
    uint64_t v6 = objc_msgSend(v5, "na_firstObjectPassingTest:", v12);
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    int v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v15 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@A IDS invite ID must be provided to find matching received invitation", buf, 0xCu);
    }
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __59__HMDIDSInvitationManager__receivedInvitationWithUniqueID___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 uniqueID];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

- (id)_sentInvitationWithUniqueID:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    char v5 = [(IDSInvitationManager *)self->_idsInvitationManager pendingInvitations];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __55__HMDIDSInvitationManager__sentInvitationWithUniqueID___block_invoke;
    v12[3] = &unk_264A1E1E8;
    id v13 = v4;
    uint64_t v6 = objc_msgSend(v5, "na_firstObjectPassingTest:", v12);
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    int v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v15 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@A IDS invite ID must be provided to find matching sent invitation", buf, 0xCu);
    }
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __55__HMDIDSInvitationManager__sentInvitationWithUniqueID___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 uniqueID];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

- (HMDIDSInvitationManager)initWithHomeManager:(id)a3 messageDispatcher:(id)a4 queue:(id)a5 remoteAccountManager:(id)a6
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v61.receiver = self;
  v61.super_class = (Class)HMDIDSInvitationManager;
  id v14 = [(HMDIDSInvitationManager *)&v61 init];
  p_isa = (id *)&v14->super.isa;
  if (v14)
  {
    id v48 = v13;
    id v51 = v10;
    objc_storeWeak((id *)&v14->_homeManager, v10);
    objc_storeStrong(p_isa + 2, a5);
    objc_storeStrong(p_isa + 4, a4);
    objc_storeStrong(p_isa + 6, a6);
    uint64_t v16 = [objc_alloc(MEMORY[0x263F4A060]) initWithServiceIdentifier:@"com.apple.private.alloy.home.invite"];
    id v17 = p_isa[1];
    p_isa[1] = (id)v16;

    uint64_t v18 = (void *)MEMORY[0x230FBD990]();
    __int16 v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v64 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Loading pending and sent invites:", buf, 0xCu);
    }
    id v49 = v12;
    id v50 = v11;

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v52 = p_isa;
    uint64_t v21 = [p_isa[1] pendingInvitations];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v57 objects:v67 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v58 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          __int16 v27 = (void *)MEMORY[0x230FBD990]();
          long long v28 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            uint64_t v29 = HMFGetLogIdentifier();
            char v30 = [v26 uniqueID];
            id v31 = [v30 UUIDString];
            *(_DWORD *)buf = 138543618;
            v64 = v29;
            __int16 v65 = 2112;
            v66 = v31;
            _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Sent invite: %@", buf, 0x16u);
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v57 objects:v67 count:16];
      }
      while (v23);
    }

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v32 = [v52[1] receivedInvitations];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v53 objects:v62 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v54 != v35) {
            objc_enumerationMutation(v32);
          }
          __int16 v37 = *(void **)(*((void *)&v53 + 1) + 8 * j);
          id v38 = (void *)MEMORY[0x230FBD990]();
          id v39 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            __int16 v40 = HMFGetLogIdentifier();
            id v41 = [v37 uniqueID];
            __int16 v42 = [v41 UUIDString];
            *(_DWORD *)buf = 138543618;
            v64 = v40;
            __int16 v65 = 2112;
            v66 = v42;
            _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@Received invite: %@", buf, 0x16u);
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v53 objects:v62 count:16];
      }
      while (v34);
    }

    p_isa = v52;
    [v52[1] setDelegate:v52 queue:v52[2]];
    id v11 = v50;
    id v10 = v51;
    id v13 = v48;
    id v12 = v49;
  }
  id v43 = (void *)MEMORY[0x230FBD990]();
  __int16 v44 = p_isa;
  id v45 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    __int16 v46 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v64 = v46;
    _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_INFO, "%{public}@Initialized HMDIDSInvitationManager since modern transport is enabled", buf, 0xCu);
  }

  return v44;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t53_94452 != -1) {
    dispatch_once(&logCategory__hmf_once_t53_94452, &__block_literal_global_94453);
  }
  id v2 = (void *)logCategory__hmf_once_v54_94454;
  return v2;
}

void __38__HMDIDSInvitationManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v54_94454;
  logCategory__hmf_once_v54_94454 = v0;
}

@end