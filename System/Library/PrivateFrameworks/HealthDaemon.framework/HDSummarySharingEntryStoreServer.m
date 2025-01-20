@interface HDSummarySharingEntryStoreServer
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (HDSummarySharingEntryStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)dealloc;
- (void)profileDidBecomeReady:(id)a3;
- (void)remote_acceptInvitationWithUUID:(id)a3 completion:(id)a4;
- (void)remote_beginObservingReachabilityStatusForIdentifiers:(id)a3 isInitialQuery:(BOOL)a4;
- (void)remote_declineInvitationWithUUID:(id)a3 completion:(id)a4;
- (void)remote_fetchSharingEntriesWithCompletionHandler:(id)a3;
- (void)remote_inviteSharingDataWithIdentifier:(id)a3 firstName:(id)a4 lastName:(id)a5 sharingAuthorizations:(id)a6 userWheelchairMode:(int64_t)a7 completion:(id)a8;
- (void)remote_leaveInvitationWithUUID:(id)a3 completion:(id)a4;
- (void)remote_revokeInvitationWithUUID:(id)a3 completion:(id)a4;
- (void)remote_unpauseInvitationWithUUID:(id)a3 completion:(id)a4;
- (void)remote_updateAuthorizationIdentifiersForInvitationUUID:(id)a3 sharingAuthorizationsToAdd:(id)a4 sharingAuthorizationsToDelete:(id)a5 deleteOnCommit:(BOOL)a6 completion:(id)a7;
- (void)remote_updateNotificationStatusWithUUID:(id)a3 notificationStatus:(int64_t)a4 completion:(id)a5;
- (void)sharingEntriesDidUpdate:(id)a3;
- (void)summarySharingEntryIDSManager:(id)a3 didUpdateReachabilityStatus:(id)a4 error:(id)a5;
@end

@implementation HDSummarySharingEntryStoreServer

- (HDSummarySharingEntryStoreServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HDSummarySharingEntryStoreServer;
  v11 = [(HDStandardTaskServer *)&v23 initWithUUID:a3 configuration:a4 client:v10 delegate:a6];
  if (v11)
  {
    v12 = [v10 profile];
    uint64_t v13 = [v12 summarySharingEntryIDSManager];
    summarySharingEntryIDSManager = v11->_summarySharingEntryIDSManager;
    v11->_summarySharingEntryIDSManager = (HDSummarySharingEntryIDSManager *)v13;

    v15 = [v10 profile];
    uint64_t v16 = [v15 sharingEntryManager];
    sharingEntryManager = v11->_sharingEntryManager;
    v11->_sharingEntryManager = (HDSummarySharingEntryManager *)v16;

    v18 = [v10 profile];
    uint64_t v19 = [v18 sharingAuthorizationManager];
    sharingAuthorizationManager = v11->_sharingAuthorizationManager;
    v11->_sharingAuthorizationManager = (HDSharingAuthorizationManager *)v19;

    [(HDSummarySharingEntryIDSManager *)v11->_summarySharingEntryIDSManager addObserver:v11];
    [(HDSummarySharingEntryManager *)v11->_sharingEntryManager addObserver:v11];
    v21 = [v10 profile];
    [v21 registerProfileReadyObserver:v11 queue:0];
  }
  return v11;
}

- (void)dealloc
{
  [(HDSummarySharingEntryManager *)self->_sharingEntryManager removeObserver:self];
  [(HDSummarySharingEntryIDSManager *)self->_summarySharingEntryIDSManager removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)HDSummarySharingEntryStoreServer;
  [(HDSummarySharingEntryStoreServer *)&v3 dealloc];
}

- (void)profileDidBecomeReady:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  sharingEntryManager = self->_sharingEntryManager;
  id v8 = 0;
  BOOL v5 = [(HDSummarySharingEntryManager *)sharingEntryManager resolveContactsIfNeededWithError:&v8];
  id v6 = v8;
  if (!v5)
  {
    _HKInitializeLogging();
    v7 = HKLogSharing();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v10 = self;
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to resolve contacts: %{public}@", buf, 0x16u);
    }
  }
}

+ (id)taskIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2B5E0] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2B5E0] clientInterface];
}

- (void)summarySharingEntryIDSManager:(id)a3 didUpdateReachabilityStatus:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [(HDStandardTaskServer *)self client];
  id v10 = [v9 connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __100__HDSummarySharingEntryStoreServer_summarySharingEntryIDSManager_didUpdateReachabilityStatus_error___block_invoke;
  v12[3] = &unk_1E62F3170;
  v12[4] = self;
  __int16 v11 = [v10 remoteObjectProxyWithErrorHandler:v12];

  objc_msgSend(v11, "clientRemote_reachabilityStatusDidUpdate:error:", v8, v7);
}

void __100__HDSummarySharingEntryStoreServer_summarySharingEntryIDSManager_didUpdateReachabilityStatus_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to notify client of reachability status update: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)sharingEntriesDidUpdate:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    _HKInitializeLogging();
    uint64_t v5 = HKLogSharing();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v35 = self;
      __int16 v36 = 2112;
      id v37 = v4;
      _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Sharing entries updated: %@", buf, 0x16u);
    }

    int v6 = [(HDStandardTaskServer *)self client];
    uint64_t v7 = [v6 connection];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __60__HDSummarySharingEntryStoreServer_sharingEntriesDidUpdate___block_invoke;
    v32[3] = &unk_1E62F3170;
    v32[4] = self;
    v24 = [v7 remoteObjectProxyWithErrorHandler:v32];

    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v29;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * v13), "UUID", v24);
          v15 = HDSummarySharingEntryPredicateForUUID((uint64_t)v14);
          [v8 addObject:v15];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v11);
    }

    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sharingEntryManager = self->_sharingEntryManager;
    v18 = [MEMORY[0x1E4F65D08] predicateMatchingAnyPredicates:v8];
    id v27 = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __60__HDSummarySharingEntryStoreServer_sharingEntriesDidUpdate___block_invoke_283;
    v25[3] = &unk_1E62FD100;
    v25[4] = self;
    id v19 = v16;
    id v26 = v19;
    BOOL v20 = [(HDSummarySharingEntryManager *)sharingEntryManager enumerateCodableEntriesWithPredicate:v18 error:&v27 handler:v25];
    id v21 = v27;

    if (v20)
    {
      v22 = v24;
      objc_msgSend(v24, "clientRemote_sharingEntriesDidUpdate:", v19);
    }
    else
    {
      _HKInitializeLogging();
      objc_super v23 = HKLogSharing();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v35 = self;
        __int16 v36 = 2112;
        id v37 = v21;
        _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Sharing entries updated but failed to fetch new entries. %@", buf, 0x16u);
      }

      v22 = v24;
    }
  }
}

void __60__HDSummarySharingEntryStoreServer_sharingEntriesDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to notify client of sharing entry update: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __60__HDSummarySharingEntryStoreServer_sharingEntriesDidUpdate___block_invoke_283(uint64_t a1, void *a2)
{
  id v3 = [a2 sharingEntry];
  id v4 = [*(id *)(a1 + 32) profile];
  uint64_t v5 = [v4 daemon];
  int v6 = [v5 profileManager];
  uint64_t v7 = [v3 UUID];
  __int16 v8 = [v6 profileIdentifierForUUID:v7];

  if (v8 && [v8 type] == 2) {
    [v3 _setProfileIdentifier:v8];
  }
  [*(id *)(a1 + 40) addObject:v3];

  return 1;
}

- (void)remote_fetchSharingEntriesWithCompletionHandler:(id)a3
{
  sharingEntryManager = self->_sharingEntryManager;
  id v7 = 0;
  id v4 = (void (**)(id, void *, id))a3;
  uint64_t v5 = [(HDSummarySharingEntryManager *)sharingEntryManager fetchSharingEntriesWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (void)remote_beginObservingReachabilityStatusForIdentifiers:(id)a3 isInitialQuery:(BOOL)a4
{
}

- (void)remote_inviteSharingDataWithIdentifier:(id)a3 firstName:(id)a4 lastName:(id)a5 sharingAuthorizations:(id)a6 userWheelchairMode:(int64_t)a7 completion:(id)a8
{
  id v14 = a8;
  summarySharingEntryIDSManager = self->_summarySharingEntryIDSManager;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __146__HDSummarySharingEntryStoreServer_remote_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke;
  v17[3] = &unk_1E62F29A0;
  id v18 = v14;
  id v16 = v14;
  [(HDSummarySharingEntryIDSManager *)summarySharingEntryIDSManager inviteSharingDataWithIdentifier:a3 firstName:a4 lastName:a5 sharingAuthorizations:a6 userWheelchairMode:a7 completion:v17];
}

void __146__HDSummarySharingEntryStoreServer_remote_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedErrorForDomain:", *MEMORY[0x1E4F19C40]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);
}

- (void)remote_acceptInvitationWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  summarySharingEntryIDSManager = self->_summarySharingEntryIDSManager;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__HDSummarySharingEntryStoreServer_remote_acceptInvitationWithUUID_completion___block_invoke;
  v9[3] = &unk_1E62F29A0;
  id v10 = v6;
  id v8 = v6;
  [(HDSummarySharingEntryIDSManager *)summarySharingEntryIDSManager acceptInvitationWithUUID:a3 completion:v9];
}

void __79__HDSummarySharingEntryStoreServer_remote_acceptInvitationWithUUID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedErrorForDomain:", *MEMORY[0x1E4F19C40]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);
}

- (void)remote_declineInvitationWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  summarySharingEntryIDSManager = self->_summarySharingEntryIDSManager;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__HDSummarySharingEntryStoreServer_remote_declineInvitationWithUUID_completion___block_invoke;
  v9[3] = &unk_1E62F29A0;
  id v10 = v6;
  id v8 = v6;
  [(HDSummarySharingEntryIDSManager *)summarySharingEntryIDSManager declineInvitationWithUUID:a3 completion:v9];
}

void __80__HDSummarySharingEntryStoreServer_remote_declineInvitationWithUUID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedErrorForDomain:", *MEMORY[0x1E4F19C40]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);
}

- (void)remote_revokeInvitationWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  summarySharingEntryIDSManager = self->_summarySharingEntryIDSManager;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__HDSummarySharingEntryStoreServer_remote_revokeInvitationWithUUID_completion___block_invoke;
  v9[3] = &unk_1E62F29A0;
  id v10 = v6;
  id v8 = v6;
  [(HDSummarySharingEntryIDSManager *)summarySharingEntryIDSManager revokeInvitationWithUUID:a3 completion:v9];
}

void __79__HDSummarySharingEntryStoreServer_remote_revokeInvitationWithUUID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedErrorForDomain:", *MEMORY[0x1E4F19C40]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);
}

- (void)remote_leaveInvitationWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  summarySharingEntryIDSManager = self->_summarySharingEntryIDSManager;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__HDSummarySharingEntryStoreServer_remote_leaveInvitationWithUUID_completion___block_invoke;
  v9[3] = &unk_1E62F29A0;
  id v10 = v6;
  id v8 = v6;
  [(HDSummarySharingEntryIDSManager *)summarySharingEntryIDSManager leaveInvitationWithUUID:a3 completion:v9];
}

void __78__HDSummarySharingEntryStoreServer_remote_leaveInvitationWithUUID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedErrorForDomain:", *MEMORY[0x1E4F19C40]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);
}

- (void)remote_unpauseInvitationWithUUID:(id)a3 completion:(id)a4
{
  sharingEntryManager = self->_sharingEntryManager;
  id v9 = 0;
  id v6 = (void (**)(id, uint64_t, id))a4;
  uint64_t v7 = [(HDSummarySharingEntryManager *)sharingEntryManager updateEntryWithUUID:a3 pauseStatus:0 error:&v9];
  id v8 = v9;
  v6[2](v6, v7, v8);
}

- (void)remote_updateAuthorizationIdentifiersForInvitationUUID:(id)a3 sharingAuthorizationsToAdd:(id)a4 sharingAuthorizationsToDelete:(id)a5 deleteOnCommit:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  sharingEntryManager = self->_sharingEntryManager;
  id v15 = 0;
  uint64_t v12 = (void (**)(id, uint64_t, id))a7;
  uint64_t v13 = [(HDSummarySharingEntryManager *)sharingEntryManager updateEntryWithUUID:a3 authorizationsToAdd:a4 authorizationsToDelete:a5 deleteOnCommit:v7 error:&v15];
  id v14 = v15;
  v12[2](v12, v13, v14);
}

- (void)remote_updateNotificationStatusWithUUID:(id)a3 notificationStatus:(int64_t)a4 completion:(id)a5
{
  id v8 = (void (**)(id, uint64_t, id))a5;
  sharingEntryManager = self->_sharingEntryManager;
  id v19 = 0;
  id v10 = [(HDSummarySharingEntryManager *)sharingEntryManager codableEntryWithUUID:a3 errorOut:&v19];
  id v11 = v19;
  if (v10)
  {
    uint64_t v12 = self->_sharingEntryManager;
    id v13 = objc_alloc(MEMORY[0x1E4F29128]);
    id v14 = [v10 invitationUUID];
    id v15 = (void *)[v13 initWithUUIDString:v14];
    id v18 = 0;
    uint64_t v16 = [(HDSummarySharingEntryManager *)v12 updateEntryWithInvitationUUID:v15 newNotificationStatus:a4 error:&v18];
    id v17 = v18;

    v8[2](v8, v16, v17);
  }
  else
  {
    v8[2](v8, 0, v11);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingAuthorizationManager, 0);
  objc_storeStrong((id *)&self->_sharingEntryManager, 0);

  objc_storeStrong((id *)&self->_summarySharingEntryIDSManager, 0);
}

@end