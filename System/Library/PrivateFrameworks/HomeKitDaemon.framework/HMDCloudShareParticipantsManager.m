@interface HMDCloudShareParticipantsManager
+ (id)logCategory;
- (BOOL)isAcceptedParticipatingUser:(id)a3;
- (HMBCloudZone)cloudZone;
- (HMDCloudShareParticipantsManager)initWithQueue:(id)a3 cloudZone:(id)a4 home:(id)a5;
- (HMDCloudShareParticipantsManagerDataSource)dataSource;
- (HMDCloudShareParticipantsManagerDelegate)delegate;
- (HMDHome)home;
- (NSSet)participatingUsers;
- (OS_dispatch_queue)workQueue;
- (id)_untrustedInvitationContextForUser:(id)a3 shouldGrantWriteAccess:(BOOL)a4;
- (id)fetchInvitationContextForUser:(id)a3 shouldGrantWriteAccess:(BOOL)a4;
- (id)fetchInvitationToUser:(id)a3 shouldGrantWriteAccess:(BOOL)a4;
- (id)logIdentifier;
- (void)_inviteUser:(id)a3 usingDevice:(id)a4;
- (void)clearParticipants;
- (void)configure;
- (void)handleHomeDataLoadedNotification:(id)a3;
- (void)handleHomeUserAddedNotification:(id)a3;
- (void)handleHomeUserRemovedNotification:(id)a3;
- (void)inviteUser:(id)a3 usingDevice:(id)a4;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)updateShareParticipants;
@end

@implementation HMDCloudShareParticipantsManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_cloudZone, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMDCloudShareParticipantsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDCloudShareParticipantsManagerDelegate *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (HMDCloudShareParticipantsManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDCloudShareParticipantsManagerDataSource *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMDCloudShareParticipantsManager *)self cloudZone];
  v3 = [v2 zoneID];
  v4 = [v3 name];

  return v4;
}

- (void)handleHomeDataLoadedNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Handling home data loaded notification: %@", buf, 0x16u);
  }
  v9 = [(HMDCloudShareParticipantsManager *)v6 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__HMDCloudShareParticipantsManager_handleHomeDataLoadedNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = v6;
  dispatch_async(v9, block);
}

uint64_t __69__HMDCloudShareParticipantsManager_handleHomeDataLoadedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateShareParticipants];
}

- (void)handleHomeUserRemovedNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Handling home user removed notification: %@", buf, 0x16u);
  }
  v9 = [(HMDCloudShareParticipantsManager *)v6 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__HMDCloudShareParticipantsManager_handleHomeUserRemovedNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = v6;
  dispatch_async(v9, block);
}

uint64_t __70__HMDCloudShareParticipantsManager_handleHomeUserRemovedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateShareParticipants];
}

- (void)handleHomeUserAddedNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Handling home user added notification: %@", buf, 0x16u);
  }
  v9 = [(HMDCloudShareParticipantsManager *)v6 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__HMDCloudShareParticipantsManager_handleHomeUserAddedNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = v6;
  dispatch_async(v9, block);
}

uint64_t __68__HMDCloudShareParticipantsManager_handleHomeUserAddedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateShareParticipants];
}

- (id)_untrustedInvitationContextForUser:(id)a3 shouldGrantWriteAccess:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(HMDCloudShareParticipantsManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  v8 = [v6 accountHandle];
  uint64_t v9 = [v8 type];

  if (v9)
  {
    if (v9 == 2)
    {
      id v23 = objc_alloc(MEMORY[0x263F49330]);
      v11 = [v6 uuid];
      v12 = [v6 accountHandle];
      __int16 v13 = [v12 value];
      uint64_t v14 = [v23 initWithParticipantClientIdentifier:v11 phoneNumber:v13];
    }
    else
    {
      if (v9 != 1)
      {
        v21 = 0;
        goto LABEL_11;
      }
      id v10 = objc_alloc(MEMORY[0x263F49330]);
      v11 = [v6 uuid];
      v12 = [v6 accountHandle];
      __int16 v13 = [v12 value];
      uint64_t v14 = [v10 initWithParticipantClientIdentifier:v11 emailAddress:v13];
    }
    v21 = (void *)v14;

LABEL_11:
    [v21 setShouldGrantWriteAccess:v4];
    uint64_t v22 = [MEMORY[0x263F58190] futureWithResult:v21];
    goto LABEL_12;
  }
  uint64_t v15 = (void *)MEMORY[0x230FBD990]();
  v16 = self;
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = HMFGetLogIdentifier();
    v19 = [v6 accountHandle];
    int v26 = 138543618;
    v27 = v18;
    __int16 v28 = 2112;
    v29 = v19;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@User's account handle was of unknown type: %@", (uint8_t *)&v26, 0x16u);
  }
  v20 = (void *)MEMORY[0x263F58190];
  v21 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
  uint64_t v22 = [v20 futureWithError:v21];
LABEL_12:
  v24 = (void *)v22;

  return v24;
}

- (id)fetchInvitationContextForUser:(id)a3 shouldGrantWriteAccess:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(HMDCloudShareParticipantsManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  v8 = [(HMDCloudShareParticipantsManager *)self dataSource];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v8 canUseUntrustedAccountHandlesForParticipantManager:self])
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      __int16 v13 = [v6 shortDescription];
      *(_DWORD *)buf = 138543618;
      v33 = v12;
      __int16 v34 = 2112;
      v35 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Fetching share invitation context using untrusted account handle for user: %@", buf, 0x16u);
    }
    uint64_t v14 = [(HMDCloudShareParticipantsManager *)v10 _untrustedInvitationContextForUser:v6 shouldGrantWriteAccess:v4];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x230FBD990]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      v19 = [v6 shortDescription];
      v20 = [v6 cloudShareIDFuture];
      *(_DWORD *)buf = 138543874;
      v33 = v18;
      __int16 v34 = 2112;
      v35 = v19;
      __int16 v36 = 2112;
      v37 = v20;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Fetching invitation context for user %@ with cloud share ID future: %@", buf, 0x20u);
    }
    v21 = [v6 cloudShareIDFuture];
    uint64_t v22 = (void *)MEMORY[0x263F581B8];
    id v23 = [(HMDCloudShareParticipantsManager *)v16 workQueue];
    v24 = [v22 schedulerWithDispatchQueue:v23];
    v25 = [v21 reschedule:v24];

    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __89__HMDCloudShareParticipantsManager_fetchInvitationContextForUser_shouldGrantWriteAccess___block_invoke;
    v31[3] = &unk_264A2F3E8;
    v31[4] = v16;
    id v26 = (id)[v25 addFailureBlock:v31];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __89__HMDCloudShareParticipantsManager_fetchInvitationContextForUser_shouldGrantWriteAccess___block_invoke_20;
    v28[3] = &unk_264A22168;
    v28[4] = v16;
    id v29 = v6;
    BOOL v30 = v4;
    uint64_t v14 = [v25 flatMap:v28];
  }
  return v14;
}

void __89__HMDCloudShareParticipantsManager_fetchInvitationContextForUser_shouldGrantWriteAccess___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch invitation context due to cloud share ID future error: %@", (uint8_t *)&v8, 0x16u);
  }
}

id __89__HMDCloudShareParticipantsManager_fetchInvitationContextForUser_shouldGrantWriteAccess___block_invoke_20(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = [*(id *)(a1 + 40) shortDescription];
    int v14 = 138543874;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    v17 = v8;
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Creating share invitation context for user %@ using trusted cloud share id: %@", (uint8_t *)&v14, 0x20u);
  }
  id v9 = objc_alloc(MEMORY[0x263F49330]);
  __int16 v10 = [*(id *)(a1 + 40) uuid];
  id v11 = (void *)[v9 initWithParticipantClientIdentifier:v10 cloudShareID:v3];

  [v11 setShouldGrantWriteAccess:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v12 = [MEMORY[0x263F58190] futureWithResult:v11];

  return v12;
}

- (id)fetchInvitationToUser:(id)a3 shouldGrantWriteAccess:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(HMDCloudShareParticipantsManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  int v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  __int16 v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    uint64_t v12 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    uint64_t v20 = v11;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Fetching invitation to user %@ with write access: %@", buf, 0x20u);
  }
  __int16 v13 = [(HMDCloudShareParticipantsManager *)v9 fetchInvitationContextForUser:v6 shouldGrantWriteAccess:v4];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __81__HMDCloudShareParticipantsManager_fetchInvitationToUser_shouldGrantWriteAccess___block_invoke;
  v18[3] = &unk_264A2F3E8;
  v18[4] = v9;
  id v14 = (id)[v13 addFailureBlock:v18];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __81__HMDCloudShareParticipantsManager_fetchInvitationToUser_shouldGrantWriteAccess___block_invoke_16;
  v17[3] = &unk_264A22140;
  v17[4] = v9;
  uint64_t v15 = [v13 flatMap:v17];

  return v15;
}

void __81__HMDCloudShareParticipantsManager_fetchInvitationToUser_shouldGrantWriteAccess___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch invitation context: %@", (uint8_t *)&v8, 0x16u);
  }
}

id __81__HMDCloudShareParticipantsManager_fetchInvitationToUser_shouldGrantWriteAccess___block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 cloudZone];
  id v6 = [v5 fetchInvitationWithContext:v4];

  v7 = (void *)MEMORY[0x263F581B8];
  int v8 = [*(id *)(a1 + 32) workQueue];
  id v9 = [v7 schedulerWithDispatchQueue:v8];
  __int16 v10 = [v6 reschedule:v9];

  return v10;
}

- (void)_inviteUser:(id)a3 usingDevice:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDCloudShareParticipantsManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(HMDCloudShareParticipantsManager *)self dataSource];
  if (objc_opt_respondsToSelector()) {
    uint64_t v10 = [v9 manager:self shouldGrantWriteAccessToUser:v6];
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = [(HMDCloudShareParticipantsManager *)self cloudZone];
  uint64_t v12 = [v6 uuid];
  __int16 v13 = [v11 participantWithClientIdentifier:v12];

  if ([v13 hasAccepted])
  {
    if (v10 != [v13 hasWriteAccess])
    {
      id v14 = (void *)MEMORY[0x230FBD990]();
      uint64_t v15 = self;
      __int16 v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = HMFGetLogIdentifier();
        [v13 hasWriteAccess];
        __int16 v18 = HMFBooleanToString();
        HMFBooleanToString();
        id v19 = v24 = v14;
        *(_DWORD *)buf = 138544130;
        id v29 = v17;
        __int16 v30 = 2112;
        v31 = v18;
        __int16 v32 = 2112;
        v33 = v19;
        __int16 v34 = 2112;
        id v35 = v6;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating write access from %@ to %@ for user %@", buf, 0x2Au);

        id v14 = v24;
      }

      uint64_t v20 = [(HMDCloudShareParticipantsManager *)v15 cloudZone];
      id v21 = (id)[v20 setWriteAccessEnabled:v10 forParticipant:v13];
    }
  }
  else
  {
    id v22 = [(HMDCloudShareParticipantsManager *)self fetchInvitationToUser:v6 shouldGrantWriteAccess:v10];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __60__HMDCloudShareParticipantsManager__inviteUser_usingDevice___block_invoke;
    v25[3] = &unk_264A22118;
    v25[4] = self;
    id v26 = v6;
    id v27 = v7;
    id v23 = (id)[v22 addCompletionBlock:v25];
  }
}

void __60__HMDCloudShareParticipantsManager__inviteUser_usingDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v7);

  if (v5)
  {
    int v8 = [*(id *)(a1 + 32) delegate];
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = HMFGetOSLogHandle();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v13)
      {
        id v14 = HMFGetLogIdentifier();
        uint64_t v15 = *(void **)(a1 + 48);
        int v23 = 138543874;
        v24 = v14;
        __int16 v25 = 2112;
        id v26 = v5;
        __int16 v27 = 2112;
        id v28 = v15;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Sending invitation %@ to device: %@", (uint8_t *)&v23, 0x20u);
      }
      [v8 manager:*(void *)(a1 + 32) didRequestSendForInvitation:v5 toDevice:*(void *)(a1 + 48)];
    }
    else
    {
      if (v13)
      {
        id v21 = HMFGetLogIdentifier();
        id v22 = *(void **)(a1 + 40);
        int v23 = 138543874;
        v24 = v21;
        __int16 v25 = 2112;
        id v26 = v5;
        __int16 v27 = 2112;
        id v28 = v22;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Sending invitation %@ to user: %@", (uint8_t *)&v23, 0x20u);
      }
      [v8 manager:*(void *)(a1 + 32) didRequestSendForInvitation:v5 toUser:*(void *)(a1 + 40)];
    }
  }
  else
  {
    __int16 v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = *(id *)(a1 + 32);
    __int16 v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      uint64_t v20 = *(void **)(a1 + 40);
      int v23 = 138543874;
      v24 = v19;
      __int16 v25 = 2112;
      id v26 = v20;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not create invitation to send to user %@: %@", (uint8_t *)&v23, 0x20u);
    }
  }
}

- (BOOL)isAcceptedParticipatingUser:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCloudShareParticipantsManager *)self cloudZone];
  id v6 = [v4 uuid];

  id v7 = [v5 participantWithClientIdentifier:v6];

  LOBYTE(v5) = [v7 hasAccepted];
  return (char)v5;
}

- (void)clearParticipants
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    int v23 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Clearing share participants", buf, 0xCu);
  }
  id v7 = [(HMDCloudShareParticipantsManager *)v4 cloudZone];
  int v8 = [v7 participants];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
        uint64_t v15 = [(HMDCloudShareParticipantsManager *)v4 cloudZone];
        id v16 = (id)[v15 revokeShareAccessForParticipant:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- (void)inviteUser:(id)a3 usingDevice:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDCloudShareParticipantsManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if (([v6 isCurrentUser] & 1) != 0
    || ([(HMDCloudShareParticipantsManager *)self dataSource],
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 manager:self shouldShareWithUser:v6],
        v9,
        (v10 & 1) == 0))
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    long long v17 = self;
    long long v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      long long v19 = HMFGetLogIdentifier();
      int v20 = 138543874;
      id v21 = v19;
      __int16 v22 = 2112;
      id v23 = v6;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Not inviting ineligible user %@ using device: %@", (uint8_t *)&v20, 0x20u);
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    uint64_t v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      uint64_t v15 = [v6 shortDescription];
      int v20 = 138543874;
      id v21 = v14;
      __int16 v22 = 2112;
      id v23 = v15;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Inviting user %@ using device: %@", (uint8_t *)&v20, 0x20u);
    }
    [(HMDCloudShareParticipantsManager *)v12 _inviteUser:v6 usingDevice:v7];
  }
}

- (void)updateShareParticipants
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCloudShareParticipantsManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCloudShareParticipantsManager *)self home];
  id v5 = v4;
  if (!v4)
  {
    v44 = (void *)MEMORY[0x230FBD990]();
    v45 = self;
    v46 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v78 = v47;
      v48 = "%{public}@Not updating share participants because home reference is nil";
      v49 = v46;
      os_log_type_t v50 = OS_LOG_TYPE_DEFAULT;
LABEL_38:
      _os_log_impl(&dword_22F52A000, v49, v50, v48, buf, 0xCu);
    }
LABEL_39:

    goto LABEL_44;
  }
  id v6 = [v4 homeManager];
  char v7 = [v6 hasLoadedData];

  if ((v7 & 1) == 0)
  {
    v44 = (void *)MEMORY[0x230FBD990]();
    v45 = self;
    v46 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      v47 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v78 = v47;
      v48 = "%{public}@Not updating share participants because home manager has not finished loading data";
      v49 = v46;
      os_log_type_t v50 = OS_LOG_TYPE_INFO;
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  int v8 = [(HMDCloudShareParticipantsManager *)self dataSource];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v8 areShareModificationsEnabledForManager:self] & 1) == 0)
  {
    v51 = (void *)MEMORY[0x230FBD990]();
    v52 = self;
    v53 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      v54 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v78 = v54;
      _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_DEBUG, "%{public}@Not updating share participants because share modifications are disabled", buf, 0xCu);
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    char v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v78 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating share participants", buf, 0xCu);
    }
    uint64_t v13 = [(HMDCloudShareParticipantsManager *)v10 cloudZone];
    uint64_t v14 = [v13 participants];

    uint64_t v15 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    obuint64_t j = v14;
    uint64_t v16 = [obj countByEnumeratingWithState:&v73 objects:v83 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v74 != v18) {
            objc_enumerationMutation(obj);
          }
          int v20 = *(void **)(*((void *)&v73 + 1) + 8 * i);
          id v21 = [v20 clientIdentifier];
          [v15 setObject:v20 forKeyedSubscript:v21];
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v73 objects:v83 count:16];
      }
      while (v17);
    }

    long long v71 = 0u;
    long long v72 = 0u;
    long long v70 = 0u;
    long long v69 = 0u;
    __int16 v22 = [v5 users];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v69 objects:v82 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v70;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v70 != v25) {
            objc_enumerationMutation(v22);
          }
          __int16 v27 = *(void **)(*((void *)&v69 + 1) + 8 * j);
          if (([v27 isCurrentUser] & 1) == 0
            && [v8 manager:v10 shouldShareWithUser:v27])
          {
            [(HMDCloudShareParticipantsManager *)v10 _inviteUser:v27 usingDevice:0];
            id v28 = [v27 uuid];
            [v15 setObject:0 forKeyedSubscript:v28];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v69 objects:v82 count:16];
      }
      while (v24);
    }
    v58 = v10;
    v59 = v5;
    v55 = v8;

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v29 = v15;
    uint64_t v60 = [v29 countByEnumeratingWithState:&v65 objects:v81 count:16];
    if (v60)
    {
      uint64_t v57 = *(void *)v66;
      do
      {
        for (uint64_t k = 0; k != v60; ++k)
        {
          if (*(void *)v66 != v57) {
            objc_enumerationMutation(v29);
          }
          uint64_t v31 = *(void *)(*((void *)&v65 + 1) + 8 * k);
          __int16 v32 = [v29 objectForKeyedSubscript:v31];
          v33 = (void *)MEMORY[0x230FBD990]();
          __int16 v34 = v58;
          id v35 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            uint64_t v36 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v78 = v36;
            __int16 v79 = 2112;
            v80 = v32;
            _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_INFO, "%{public}@Revoking cloud share for existing cloud share participant: %@", buf, 0x16u);
          }
          v37 = [(HMDCloudShareParticipantsManager *)v34 cloudZone];
          uint64_t v38 = [v37 revokeShareAccessForParticipant:v32];
          v39 = (void *)MEMORY[0x263F581B8];
          v40 = [(HMDCloudShareParticipantsManager *)v34 workQueue];
          v41 = [v39 schedulerWithDispatchQueue:v40];
          v42 = [v38 reschedule:v41];
          v61[0] = MEMORY[0x263EF8330];
          v61[1] = 3221225472;
          v61[2] = __59__HMDCloudShareParticipantsManager_updateShareParticipants__block_invoke;
          v61[3] = &unk_264A220F0;
          id v62 = v59;
          uint64_t v63 = v31;
          v64 = v34;
          id v43 = (id)[v42 addSuccessBlock:v61];
        }
        uint64_t v60 = [v29 countByEnumeratingWithState:&v65 objects:v81 count:16];
      }
      while (v60);
    }

    id v5 = v59;
    int v8 = v55;
  }

LABEL_44:
}

void __59__HMDCloudShareParticipantsManager_updateShareParticipants__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) userWithUUID:*(void *)(a1 + 40)];
  if (v3)
  {
    v2 = [*(id *)(a1 + 48) delegate];
    [v2 manager:*(void *)(a1 + 48) didRevokeShareAccessForUser:v3];
  }
}

- (void)configure
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCloudShareParticipantsManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDCloudShareParticipantsManager *)self home];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 homeManager];
    if (v6)
    {
      char v7 = [MEMORY[0x263F08A00] defaultCenter];
      [v7 addObserver:self selector:sel_handleHomeUserAddedNotification_ name:@"HMDHomeUserAddedNotification" object:v5];

      int v8 = [MEMORY[0x263F08A00] defaultCenter];
      [v8 addObserver:self selector:sel_handleHomeUserRemovedNotification_ name:@"HMDHomeUserRemovedNotification" object:v5];

      id v9 = [MEMORY[0x263F08A00] defaultCenter];
      [v9 addObserver:self selector:sel_handleHomeDataLoadedNotification_ name:@"HMDHomeManagerHomeDataLoadedNotification" object:v6];
    }
    else
    {
      uint64_t v14 = (void *)MEMORY[0x230FBD990]();
      uint64_t v15 = self;
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        int v18 = 138543362;
        long long v19 = v17;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Not configuring participants manager because home manager reference is nil", (uint8_t *)&v18, 0xCu);
      }
    }
  }
  else
  {
    char v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v18 = 138543362;
      long long v19 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Not configuring participants manager because home reference is nil", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (NSSet)participatingUsers
{
  id v3 = [(HMDCloudShareParticipantsManager *)self cloudZone];
  id v4 = [v3 participants];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__HMDCloudShareParticipantsManager_participatingUsers__block_invoke;
  v7[3] = &unk_264A220C8;
  v7[4] = self;
  id v5 = objc_msgSend(v4, "na_map:", v7);

  return (NSSet *)v5;
}

id __54__HMDCloudShareParticipantsManager_participatingUsers__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 home];
  id v5 = [v3 clientIdentifier];

  id v6 = [v4 userWithUUID:v5];

  return v6;
}

- (HMDCloudShareParticipantsManager)initWithQueue:(id)a3 cloudZone:(id)a4 home:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDCloudShareParticipantsManager;
  uint64_t v12 = [(HMDCloudShareParticipantsManager *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workQueue, a3);
    objc_storeStrong((id *)&v13->_cloudZone, a4);
    objc_storeWeak((id *)&v13->_home, v11);
  }

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_154458 != -1) {
    dispatch_once(&logCategory__hmf_once_t24_154458, &__block_literal_global_154459);
  }
  v2 = (void *)logCategory__hmf_once_v25_154460;
  return v2;
}

void __47__HMDCloudShareParticipantsManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v25_154460;
  logCategory__hmf_once_v25_154460 = v0;
}

@end