@interface HKSummarySharingEntryStore
+ (id)clientInterface;
+ (id)serverInterface;
- (HKHealthStore)healthStore;
- (HKSummarySharingEntryStore)initWithHealthStore:(id)a3;
- (HKSummarySharingEntryStoreDelegate)delegate;
- (HKTaskServerProxyProvider)proxyProvider;
- (NSArray)sharingEntries;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_notifyObservers;
- (void)acceptInvitationWithUUID:(id)a3 completion:(id)a4;
- (void)addObserver:(id)a3;
- (void)beginObservingReachabilityStatusForIdentifiers:(id)a3 isInitialQuery:(BOOL)a4 completion:(id)a5;
- (void)clientRemote_reachabilityStatusDidUpdate:(id)a3 error:(id)a4;
- (void)clientRemote_sharingEntriesDidUpdate:(id)a3;
- (void)declineInvitationWithUUID:(id)a3 completion:(id)a4;
- (void)fetchSharingEntriesWithCompletion:(id)a3;
- (void)inviteSharingDataWithIdentifier:(id)a3 firstName:(id)a4 lastName:(id)a5 sharingAuthorizations:(id)a6 userWheelchairMode:(int64_t)a7 completion:(id)a8;
- (void)leaveInvitationWithUUID:(id)a3 completion:(id)a4;
- (void)removeObserver:(id)a3;
- (void)revokeInvitationWithUUID:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)unpauseInvitationWithUUID:(id)a3 completion:(id)a4;
- (void)updateNotificationStatusWithUUID:(id)a3 notificationStatus:(int64_t)a4 completion:(id)a5;
- (void)updateSharingAuthorizationsForInvitationUUID:(id)a3 sharingAuthorizationsToAdd:(id)a4 sharingAuthorizationsToDelete:(id)a5 completion:(id)a6;
- (void)updateSharingAuthorizationsForInvitationUUID:(id)a3 sharingAuthorizationsToAdd:(id)a4 sharingAuthorizationsToDelete:(id)a5 deleteOnCommit:(BOOL)a6 completion:(id)a7;
@end

@implementation HKSummarySharingEntryStore

- (HKSummarySharingEntryStore)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HKSummarySharingEntryStore;
  v6 = [(HKSummarySharingEntryStore *)&v29 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    uint64_t v8 = HKCreateSerialDispatchQueue(v7, @"resource");
    resourceQueue = v7->_resourceQueue;
    v7->_resourceQueue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    fetchedEntriesByUUID = v7->_fetchedEntriesByUUID;
    v7->_fetchedEntriesByUUID = v10;

    v12 = [HKObserverSet alloc];
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    v15 = HKLogSharing();
    uint64_t v16 = [(HKObserverSet *)v12 initWithName:v14 loggingCategory:v15];
    observers = v7->_observers;
    v7->_observers = (HKObserverSet *)v16;

    v18 = [HKTaskServerProxyProvider alloc];
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    v21 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v22 = [(HKTaskServerProxyProvider *)v18 initWithHealthStore:v5 taskIdentifier:v20 exportedObject:v7 taskUUID:v21];
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v22;

    objc_initWeak(&location, v7);
    v24 = v7->_proxyProvider;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __50__HKSummarySharingEntryStore_initWithHealthStore___block_invoke;
    v26[3] = &unk_1E58C4178;
    objc_copyWeak(&v27, &location);
    [(HKProxyProvider *)v24 setAutomaticProxyReconnectionHandler:v26];
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __50__HKSummarySharingEntryStore_initWithHealthStore___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained fetchSharingEntriesWithCompletion:&__block_literal_global_65];
}

+ (id)clientInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED0D050];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  id v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_clientRemote_sharingEntriesDidUpdate_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)serverInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EED52DF0];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  id v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_remote_fetchSharingEntriesWithCompletionHandler_ argumentIndex:0 ofReply:1];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_remote_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion_ argumentIndex:3 ofReply:0];
  [v2 setClasses:v8 forSelector:sel_remote_updateAuthorizationIdentifiersForInvitationUUID_sharingAuthorizationsToAdd_sharingAuthorizationsToDelete_deleteOnCommit_completion_ argumentIndex:1 ofReply:0];
  [v2 setClasses:v8 forSelector:sel_remote_updateAuthorizationIdentifiersForInvitationUUID_sharingAuthorizationsToAdd_sharingAuthorizationsToDelete_deleteOnCommit_completion_ argumentIndex:2 ofReply:0];

  return v2;
}

- (id)exportedInterface
{
  return +[HKSummarySharingEntryStore clientInterface];
}

- (id)remoteInterface
{
  return +[HKSummarySharingEntryStore serverInterface];
}

- (NSArray)sharingEntries
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__26;
  v10 = __Block_byref_object_dispose__26;
  id v11 = 0;
  resourceQueue = self->_resourceQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__HKSummarySharingEntryStore_sharingEntries__block_invoke;
  v5[3] = &unk_1E58BBAA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(resourceQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __44__HKSummarySharingEntryStore_sharingEntries__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) allValues];

  return MEMORY[0x1F41817F8]();
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)fetchSharingEntriesWithCompletion:(id)a3
{
  uint64_t v4 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__HKSummarySharingEntryStore_fetchSharingEntriesWithCompletion___block_invoke;
  v9[3] = &unk_1E58C41C8;
  v9[4] = self;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HKSummarySharingEntryStore_fetchSharingEntriesWithCompletion___block_invoke_2_96;
  v7[3] = &unk_1E58BBC48;
  v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

void __64__HKSummarySharingEntryStore_fetchSharingEntriesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__HKSummarySharingEntryStore_fetchSharingEntriesWithCompletion___block_invoke_2;
  v4[3] = &unk_1E58C41A0;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(a2, "remote_fetchSharingEntriesWithCompletionHandler:", v4);
}

void __64__HKSummarySharingEntryStore_fetchSharingEntriesWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    uint64_t v7 = HKLogSharing();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __64__HKSummarySharingEntryStore_fetchSharingEntriesWithCompletion___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 16);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__HKSummarySharingEntryStore_fetchSharingEntriesWithCompletion___block_invoke_93;
    v11[3] = &unk_1E58BDE20;
    v11[4] = v8;
    id v12 = v5;
    id v10 = *(id *)(a1 + 40);
    id v13 = 0;
    id v14 = v10;
    dispatch_async(v9, v11);
  }
}

uint64_t __64__HKSummarySharingEntryStore_fetchSharingEntriesWithCompletion___block_invoke_93(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 24);
        v9 = objc_msgSend(v7, "UUID", (void)v11);
        [v8 setObject:v7 forKeyedSubscript:v9];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 32) _notifyObservers];
  return (*(uint64_t (**)(void, BOOL, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 40) != 0, *(void *)(a1 + 48));
}

void __64__HKSummarySharingEntryStore_fetchSharingEntriesWithCompletion___block_invoke_2_96(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__HKSummarySharingEntryStore_fetchSharingEntriesWithCompletion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)beginObservingReachabilityStatusForIdentifiers:(id)a3 isInitialQuery:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  proxyProvider = self->_proxyProvider;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __103__HKSummarySharingEntryStore_beginObservingReachabilityStatusForIdentifiers_isInitialQuery_completion___block_invoke;
  v15[3] = &unk_1E58C41F0;
  id v16 = v8;
  BOOL v18 = a4;
  id v17 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __103__HKSummarySharingEntryStore_beginObservingReachabilityStatusForIdentifiers_isInitialQuery_completion___block_invoke_2;
  v13[3] = &unk_1E58BBD88;
  id v14 = v17;
  id v11 = v17;
  id v12 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v15 errorHandler:v13];
}

uint64_t __103__HKSummarySharingEntryStore_beginObservingReachabilityStatusForIdentifiers_isInitialQuery_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "remote_beginObservingReachabilityStatusForIdentifiers:isInitialQuery:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

uint64_t __103__HKSummarySharingEntryStore_beginObservingReachabilityStatusForIdentifiers_isInitialQuery_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)inviteSharingDataWithIdentifier:(id)a3 firstName:(id)a4 lastName:(id)a5 sharingAuthorizations:(id)a6 userWheelchairMode:(int64_t)a7 completion:(id)a8
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  proxyProvider = self->_proxyProvider;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __133__HKSummarySharingEntryStore_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke;
  v34[3] = &unk_1E58BBA50;
  v34[4] = self;
  id v35 = v19;
  v21 = [(HKProxyProvider *)proxyProvider clientQueueActionHandlerWithCompletion:v34];
  _HKInitializeLogging();
  uint64_t v22 = HKLogSharing();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v37 = self;
    __int16 v38 = 2112;
    id v39 = v15;
    __int16 v40 = 2112;
    id v41 = v16;
    __int16 v42 = 2112;
    id v43 = v17;
    _os_log_impl(&dword_19C023000, v22, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Inviting %@ (%@ %@)", buf, 0x2Au);
  }

  if ([v18 count])
  {
    v23 = self->_proxyProvider;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __133__HKSummarySharingEntryStore_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_111;
    v27[3] = &unk_1E58C4218;
    id v28 = v15;
    id v29 = v16;
    id v30 = v17;
    id v31 = v18;
    int64_t v33 = a7;
    v32 = v21;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __133__HKSummarySharingEntryStore_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_2;
    v25[3] = &unk_1E58BBD88;
    v26 = v32;
    [(HKProxyProvider *)v23 fetchProxyWithHandler:v27 errorHandler:v25];

    v24 = v28;
  }
  else
  {
    v24 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"No sharing authorization to add."");
    ((void (**)(void, void, void *))v21)[2](v21, 0, v24);
  }
}

void __133__HKSummarySharingEntryStore_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogSharing();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = @"NO";
    int v9 = 138543874;
    if (a2) {
      id v8 = @"YES";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    id v12 = v8;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Invite sharing finished with success: %{public}@ error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

uint64_t __133__HKSummarySharingEntryStore_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_111(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_inviteSharingDataWithIdentifier:firstName:lastName:sharingAuthorizations:userWheelchairMode:completion:", a1[4], a1[5], a1[6], a1[7], a1[9], a1[8]);
}

uint64_t __133__HKSummarySharingEntryStore_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)acceptInvitationWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  proxyProvider = self->_proxyProvider;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __66__HKSummarySharingEntryStore_acceptInvitationWithUUID_completion___block_invoke;
  v20[3] = &unk_1E58BBA50;
  v20[4] = self;
  id v21 = v7;
  int v9 = [(HKProxyProvider *)proxyProvider clientQueueActionHandlerWithCompletion:v20];
  _HKInitializeLogging();
  uint64_t v10 = HKLogSharing();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = [v6 UUIDString];
    *(_DWORD *)buf = 138543618;
    v23 = self;
    __int16 v24 = 2114;
    v25 = v11;
    _os_log_impl(&dword_19C023000, v10, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Accepting invitation %{public}@", buf, 0x16u);
  }
  id v12 = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__HKSummarySharingEntryStore_acceptInvitationWithUUID_completion___block_invoke_112;
  v17[3] = &unk_1E58C41C8;
  id v18 = v6;
  id v19 = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__HKSummarySharingEntryStore_acceptInvitationWithUUID_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v19;
  id v13 = v19;
  id v14 = v6;
  [(HKProxyProvider *)v12 fetchProxyWithHandler:v17 errorHandler:v15];
}

void __66__HKSummarySharingEntryStore_acceptInvitationWithUUID_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogSharing();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = @"NO";
    int v9 = 138543874;
    if (a2) {
      id v8 = @"YES";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    id v12 = v8;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Accept invitation finished with success: %{public}@ error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

uint64_t __66__HKSummarySharingEntryStore_acceptInvitationWithUUID_completion___block_invoke_112(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_acceptInvitationWithUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __66__HKSummarySharingEntryStore_acceptInvitationWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)declineInvitationWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  proxyProvider = self->_proxyProvider;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__HKSummarySharingEntryStore_declineInvitationWithUUID_completion___block_invoke;
  v20[3] = &unk_1E58BBA50;
  v20[4] = self;
  id v21 = v7;
  int v9 = [(HKProxyProvider *)proxyProvider clientQueueActionHandlerWithCompletion:v20];
  _HKInitializeLogging();
  uint64_t v10 = HKLogSharing();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = [v6 UUIDString];
    *(_DWORD *)buf = 138543618;
    v23 = self;
    __int16 v24 = 2114;
    v25 = v11;
    _os_log_impl(&dword_19C023000, v10, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Declining invitation %{public}@", buf, 0x16u);
  }
  id v12 = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__HKSummarySharingEntryStore_declineInvitationWithUUID_completion___block_invoke_113;
  v17[3] = &unk_1E58C41C8;
  id v18 = v6;
  id v19 = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__HKSummarySharingEntryStore_declineInvitationWithUUID_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v19;
  id v13 = v19;
  id v14 = v6;
  [(HKProxyProvider *)v12 fetchProxyWithHandler:v17 errorHandler:v15];
}

void __67__HKSummarySharingEntryStore_declineInvitationWithUUID_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogSharing();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = @"NO";
    int v9 = 138543874;
    if (a2) {
      id v8 = @"YES";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    id v12 = v8;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Decline invitation finished with success: %{public}@ error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

uint64_t __67__HKSummarySharingEntryStore_declineInvitationWithUUID_completion___block_invoke_113(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_declineInvitationWithUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __67__HKSummarySharingEntryStore_declineInvitationWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)revokeInvitationWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  proxyProvider = self->_proxyProvider;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __66__HKSummarySharingEntryStore_revokeInvitationWithUUID_completion___block_invoke;
  v20[3] = &unk_1E58BBA50;
  v20[4] = self;
  id v21 = v7;
  int v9 = [(HKProxyProvider *)proxyProvider clientQueueActionHandlerWithCompletion:v20];
  _HKInitializeLogging();
  uint64_t v10 = HKLogSharing();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = [v6 UUIDString];
    *(_DWORD *)buf = 138543618;
    v23 = self;
    __int16 v24 = 2114;
    v25 = v11;
    _os_log_impl(&dword_19C023000, v10, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Revoking invitation %{public}@", buf, 0x16u);
  }
  id v12 = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__HKSummarySharingEntryStore_revokeInvitationWithUUID_completion___block_invoke_114;
  v17[3] = &unk_1E58C41C8;
  id v18 = v6;
  id v19 = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__HKSummarySharingEntryStore_revokeInvitationWithUUID_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v19;
  id v13 = v19;
  id v14 = v6;
  [(HKProxyProvider *)v12 fetchProxyWithHandler:v17 errorHandler:v15];
}

void __66__HKSummarySharingEntryStore_revokeInvitationWithUUID_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogSharing();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = @"NO";
    int v9 = 138543874;
    if (a2) {
      id v8 = @"YES";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    id v12 = v8;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Revoke invitation finished with success: %{public}@ error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

uint64_t __66__HKSummarySharingEntryStore_revokeInvitationWithUUID_completion___block_invoke_114(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_revokeInvitationWithUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __66__HKSummarySharingEntryStore_revokeInvitationWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)leaveInvitationWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  proxyProvider = self->_proxyProvider;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __65__HKSummarySharingEntryStore_leaveInvitationWithUUID_completion___block_invoke;
  v20[3] = &unk_1E58BBA50;
  v20[4] = self;
  id v21 = v7;
  int v9 = [(HKProxyProvider *)proxyProvider clientQueueActionHandlerWithCompletion:v20];
  _HKInitializeLogging();
  uint64_t v10 = HKLogSharing();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = [v6 UUIDString];
    *(_DWORD *)buf = 138543618;
    v23 = self;
    __int16 v24 = 2114;
    v25 = v11;
    _os_log_impl(&dword_19C023000, v10, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Leaving invitation %{public}@", buf, 0x16u);
  }
  id v12 = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__HKSummarySharingEntryStore_leaveInvitationWithUUID_completion___block_invoke_115;
  v17[3] = &unk_1E58C41C8;
  id v18 = v6;
  id v19 = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__HKSummarySharingEntryStore_leaveInvitationWithUUID_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v19;
  id v13 = v19;
  id v14 = v6;
  [(HKProxyProvider *)v12 fetchProxyWithHandler:v17 errorHandler:v15];
}

void __65__HKSummarySharingEntryStore_leaveInvitationWithUUID_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogSharing();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = @"NO";
    int v9 = 138543874;
    if (a2) {
      id v8 = @"YES";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    id v12 = v8;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Leave invitation finished with success: %{public}@ error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

uint64_t __65__HKSummarySharingEntryStore_leaveInvitationWithUUID_completion___block_invoke_115(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_leaveInvitationWithUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __65__HKSummarySharingEntryStore_leaveInvitationWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unpauseInvitationWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  proxyProvider = self->_proxyProvider;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__HKSummarySharingEntryStore_unpauseInvitationWithUUID_completion___block_invoke;
  v20[3] = &unk_1E58BBA50;
  v20[4] = self;
  id v21 = v7;
  int v9 = [(HKProxyProvider *)proxyProvider clientQueueActionHandlerWithCompletion:v20];
  _HKInitializeLogging();
  uint64_t v10 = HKLogSharing();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = [v6 UUIDString];
    *(_DWORD *)buf = 138543618;
    v23 = self;
    __int16 v24 = 2114;
    v25 = v11;
    _os_log_impl(&dword_19C023000, v10, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Unpause invitation %{public}@", buf, 0x16u);
  }
  id v12 = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __67__HKSummarySharingEntryStore_unpauseInvitationWithUUID_completion___block_invoke_116;
  v17[3] = &unk_1E58C41C8;
  id v18 = v6;
  id v19 = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__HKSummarySharingEntryStore_unpauseInvitationWithUUID_completion___block_invoke_2;
  v15[3] = &unk_1E58BBD88;
  id v16 = v19;
  id v13 = v19;
  id v14 = v6;
  [(HKProxyProvider *)v12 fetchProxyWithHandler:v17 errorHandler:v15];
}

void __67__HKSummarySharingEntryStore_unpauseInvitationWithUUID_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogSharing();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = @"NO";
    int v9 = 138543874;
    if (a2) {
      id v8 = @"YES";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    id v12 = v8;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Unpause invitation finished with success: %{public}@ error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

uint64_t __67__HKSummarySharingEntryStore_unpauseInvitationWithUUID_completion___block_invoke_116(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_unpauseInvitationWithUUID:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __67__HKSummarySharingEntryStore_unpauseInvitationWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateSharingAuthorizationsForInvitationUUID:(id)a3 sharingAuthorizationsToAdd:(id)a4 sharingAuthorizationsToDelete:(id)a5 completion:(id)a6
{
}

- (void)updateSharingAuthorizationsForInvitationUUID:(id)a3 sharingAuthorizationsToAdd:(id)a4 sharingAuthorizationsToDelete:(id)a5 deleteOnCommit:(BOOL)a6 completion:(id)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  proxyProvider = self->_proxyProvider;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __158__HKSummarySharingEntryStore_updateSharingAuthorizationsForInvitationUUID_sharingAuthorizationsToAdd_sharingAuthorizationsToDelete_deleteOnCommit_completion___block_invoke;
  v33[3] = &unk_1E58BBA50;
  v33[4] = self;
  id v34 = v15;
  id v17 = [(HKProxyProvider *)proxyProvider clientQueueActionHandlerWithCompletion:v33];
  _HKInitializeLogging();
  id v18 = HKLogSharing();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v12 UUIDString];
    *(_DWORD *)buf = 138544131;
    v36 = self;
    __int16 v37 = 2114;
    __int16 v38 = v19;
    __int16 v39 = 2113;
    id v40 = v13;
    __int16 v41 = 2113;
    id v42 = v14;
    _os_log_impl(&dword_19C023000, v18, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Updating invitation sharing authorizations with UUID %{public}@. %{private}@ %{private}@", buf, 0x2Au);
  }
  v20 = self->_proxyProvider;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __158__HKSummarySharingEntryStore_updateSharingAuthorizationsForInvitationUUID_sharingAuthorizationsToAdd_sharingAuthorizationsToDelete_deleteOnCommit_completion___block_invoke_117;
  v27[3] = &unk_1E58C4240;
  id v28 = v12;
  id v29 = v13;
  id v30 = v14;
  BOOL v32 = a6;
  id v31 = v17;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __158__HKSummarySharingEntryStore_updateSharingAuthorizationsForInvitationUUID_sharingAuthorizationsToAdd_sharingAuthorizationsToDelete_deleteOnCommit_completion___block_invoke_2;
  v25[3] = &unk_1E58BBC48;
  void v25[4] = self;
  id v26 = v31;
  id v21 = v31;
  id v22 = v14;
  id v23 = v13;
  id v24 = v12;
  [(HKProxyProvider *)v20 fetchProxyWithHandler:v27 errorHandler:v25];
}

void __158__HKSummarySharingEntryStore_updateSharingAuthorizationsForInvitationUUID_sharingAuthorizationsToAdd_sharingAuthorizationsToDelete_deleteOnCommit_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogSharing();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = @"NO";
    int v9 = 138543874;
    if (a2) {
      id v8 = @"YES";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    id v12 = v8;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Update sharing authorizations finished with success: %{public}@ error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

uint64_t __158__HKSummarySharingEntryStore_updateSharingAuthorizationsForInvitationUUID_sharingAuthorizationsToAdd_sharingAuthorizationsToDelete_deleteOnCommit_completion___block_invoke_117(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateAuthorizationIdentifiersForInvitationUUID:sharingAuthorizationsToAdd:sharingAuthorizationsToDelete:deleteOnCommit:completion:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 56));
}

void __158__HKSummarySharingEntryStore_updateSharingAuthorizationsForInvitationUUID_sharingAuthorizationsToAdd_sharingAuthorizationsToDelete_deleteOnCommit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR)) {
    __158__HKSummarySharingEntryStore_updateSharingAuthorizationsForInvitationUUID_sharingAuthorizationsToAdd_sharingAuthorizationsToDelete_deleteOnCommit_completion___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateNotificationStatusWithUUID:(id)a3 notificationStatus:(int64_t)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = [(HKProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a5];
  _HKInitializeLogging();
  uint64_t v10 = HKLogSharing();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = [v8 UUIDString];
    *(_DWORD *)buf = 138543875;
    id v22 = self;
    __int16 v23 = 2114;
    id v24 = v11;
    __int16 v25 = 2049;
    int64_t v26 = a4;
    _os_log_impl(&dword_19C023000, v10, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Updating notification status with UUID %{public}@. %{private}ld", buf, 0x20u);
  }
  proxyProvider = self->_proxyProvider;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __93__HKSummarySharingEntryStore_updateNotificationStatusWithUUID_notificationStatus_completion___block_invoke;
  v17[3] = &unk_1E58C4268;
  id v18 = v8;
  int64_t v20 = a4;
  id v19 = v9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__HKSummarySharingEntryStore_updateNotificationStatusWithUUID_notificationStatus_completion___block_invoke_2;
  v15[3] = &unk_1E58BBC48;
  void v15[4] = self;
  id v16 = v19;
  id v13 = v19;
  id v14 = v8;
  [(HKProxyProvider *)proxyProvider fetchProxyWithHandler:v17 errorHandler:v15];
}

uint64_t __93__HKSummarySharingEntryStore_updateNotificationStatusWithUUID_notificationStatus_completion___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateNotificationStatusWithUUID:notificationStatus:completion:", a1[4], a1[6], a1[5]);
}

void __93__HKSummarySharingEntryStore_updateNotificationStatusWithUUID_notificationStatus_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR)) {
    __93__HKSummarySharingEntryStore_updateNotificationStatusWithUUID_notificationStatus_completion___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)clientRemote_sharingEntriesDidUpdate:(id)a3
{
  id v4 = a3;
  resourceQueue = self->_resourceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HKSummarySharingEntryStore_clientRemote_sharingEntriesDidUpdate___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(resourceQueue, v7);
}

uint64_t __67__HKSummarySharingEntryStore_clientRemote_sharingEntriesDidUpdate___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v8 = *(void **)(*(void *)(a1 + 40) + 24);
        int v9 = objc_msgSend(v7, "UUID", (void)v11);
        [v8 setObject:v7 forKeyedSubscript:v9];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  return [*(id *)(a1 + 40) _notifyObservers];
}

- (void)clientRemote_reachabilityStatusDidUpdate:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HKHealthStore *)self->_healthStore clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__HKSummarySharingEntryStore_clientRemote_reachabilityStatusDidUpdate_error___block_invoke;
  block[3] = &unk_1E58BB9C8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __77__HKSummarySharingEntryStore_clientRemote_reachabilityStatusDidUpdate_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 summarySharingEntryStore:*(void *)(a1 + 32) didUpdateReachabilityStatus:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)_notifyObservers
{
  observers = self->_observers;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__HKSummarySharingEntryStore__notifyObservers__block_invoke;
  v3[3] = &unk_1E58C4290;
  v3[4] = self;
  [(HKObserverSet *)observers notifyObservers:v3];
}

void __46__HKSummarySharingEntryStore__notifyObservers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 56) clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__HKSummarySharingEntryStore__notifyObservers__block_invoke_2;
  block[3] = &unk_1E58BBA00;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __46__HKSummarySharingEntryStore__notifyObservers__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) sharingEntryStoreDidUpdate];
}

- (HKSummarySharingEntryStoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HKSummarySharingEntryStoreDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_fetchedEntriesByUUID, 0);
  objc_storeStrong((id *)&self->_resourceQueue, 0);

  objc_storeStrong(&self->_updateHandler, 0);
}

void __64__HKSummarySharingEntryStore_fetchSharingEntriesWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[summary-sharing] %{public}@: Failed to fetch sharing entries with error: %{public}@");
}

void __158__HKSummarySharingEntryStore_updateSharingAuthorizationsForInvitationUUID_sharingAuthorizationsToAdd_sharingAuthorizationsToDelete_deleteOnCommit_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[summary-sharing] %{public}@: Failed to update sharing authorizations with error: %{public}@");
}

void __93__HKSummarySharingEntryStore_updateNotificationStatusWithUUID_notificationStatus_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "[summary-sharing] %{public}@: Failed to update notification status with error: %{public}@");
}

@end