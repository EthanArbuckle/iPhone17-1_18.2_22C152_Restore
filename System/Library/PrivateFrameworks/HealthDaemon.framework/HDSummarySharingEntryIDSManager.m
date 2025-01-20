@interface HDSummarySharingEntryIDSManager
- (HDIDSInvitationManager)invitationManager;
- (HDSummarySharingEntryIDSManager)initWithProfile:(id)a3;
- (HKObserverSet)observers;
- (id)_finishHandlerForOperation:(void *)a3 completion:;
- (id)_profileForEntry:(uint64_t)a3 errorOut:;
- (uint64_t)_deleteProfile:(uint64_t)a3 errorOut:;
- (uint64_t)_queue_insertOrReplaceCodableEntry:(uint64_t)a3 ignoreIfExists:(uint64_t)a4 shouldResolveCNContact:(uint64_t)a5 error:;
- (uint64_t)_queue_updateEntryWithInvitationUUID:(uint64_t)a3 newStatus:(void *)a4 dateAccepted:(void *)a5 ownerParticipant:(uint64_t)a6 error:;
- (void)_attemptBestEffortCloudSynchronization;
- (void)acceptInvitationWithUUID:(id)a3 completion:(id)a4;
- (void)addObserver:(id)a3;
- (void)beginObservingReachabilityStatusForIdentifiers:(id)a3 isInitialQuery:(BOOL)a4;
- (void)declineInvitationWithUUID:(id)a3 completion:(id)a4;
- (void)invitationManager:(id)a3 didAcceptInvitation:(id)a4;
- (void)invitationManager:(id)a3 didDeclineInvitation:(id)a4;
- (void)invitationManager:(id)a3 didReceiveInvitation:(id)a4;
- (void)invitationManager:(id)a3 didRescindInvitation:(id)a4;
- (void)inviteSharingDataWithIdentifier:(id)a3 firstName:(id)a4 lastName:(id)a5 sharingAuthorizations:(id)a6 userWheelchairMode:(int64_t)a7 completion:(id)a8;
- (void)leaveInvitationWithUUID:(id)a3 completion:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)removeObserver:(id)a3;
- (void)revokeInvitationWithUUID:(id)a3 completion:(id)a4;
- (void)setInvitationManager:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation HDSummarySharingEntryIDSManager

- (HDSummarySharingEntryIDSManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HDSummarySharingEntryIDSManager;
  v5 = [(HDSummarySharingEntryIDSManager *)&v18 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    [v4 registerProfileReadyObserver:v6 queue:v6->_queue];
    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v6->_operationQueue;
    v6->_operationQueue = v9;

    [(NSOperationQueue *)v6->_operationQueue setMaxConcurrentOperationCount:1];
    id v11 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v14 = HKLogSharing();
    uint64_t v15 = [v11 initWithName:v13 loggingCategory:v14];
    observers = v6->_observers;
    v6->_observers = (HKObserverSet *)v15;
  }
  return v6;
}

- (void)profileDidBecomeReady:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = [WeakRetained database];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__HDSummarySharingEntryIDSManager_profileDidBecomeReady___block_invoke;
  v7[3] = &unk_1E62F3208;
  v7[4] = self;
  [v5 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:queue block:v7];
}

void __57__HDSummarySharingEntryIDSManager_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 16));
    if (!*(void *)(v1 + 48))
    {
      v2 = [[HDIDSInvitationManager alloc] initWithServiceIdentifier:@"com.apple.private.alloy.health.sync.sharingsetup" messageClass:objc_opt_class() schema:@"1"];
      v3 = *(void **)(v1 + 48);
      *(void *)(v1 + 48) = v2;

      id v4 = *(void **)(v1 + 48);
      [v4 setDelegate:v1];
    }
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
  [(HKObserverSet *)self->_observers unregisterObserver:a3];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__HDSummarySharingEntryIDSManager_removeObserver___block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __50__HDSummarySharingEntryIDSManager_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) count];
  if (!result)
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 40);
    return [v3 cancel];
  }
  return result;
}

- (void)beginObservingReachabilityStatusForIdentifiers:(id)a3 isInitialQuery:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__HDSummarySharingEntryIDSManager_beginObservingReachabilityStatusForIdentifiers_isInitialQuery___block_invoke;
  block[3] = &unk_1E62FF4F8;
  id v10 = v6;
  id v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_sync(queue, block);
}

void __97__HDSummarySharingEntryIDSManager_beginObservingReachabilityStatusForIdentifiers_isInitialQuery___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(*(id *)(a1 + 32), "hk_map:", &__block_literal_global_90);
  if ([*(id *)(*(void *)(a1 + 40) + 32) operationCount] && !*(unsigned char *)(a1 + 48))
  {
    _HKInitializeLogging();
    id v11 = HKLogSharing();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = [*(id *)(a1 + 32) count];
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v12;
      __int16 v19 = 2048;
      uint64_t v20 = v13;
      _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Updating reachability operation for %ld identifiers.", buf, 0x16u);
    }

    [*(id *)(*(void *)(a1 + 40) + 40) updateDestinations:v2];
  }
  else
  {
    [*(id *)(*(void *)(a1 + 40) + 32) cancelAllOperations];
    objc_initWeak(&location, *(id *)(a1 + 40));
    v3 = [HDIDSReachabilityOperation alloc];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __97__HDSummarySharingEntryIDSManager_beginObservingReachabilityStatusForIdentifiers_isInitialQuery___block_invoke_3;
    v14[3] = &unk_1E62FF4D0;
    objc_copyWeak(&v15, &location);
    v14[4] = *(void *)(a1 + 40);
    uint64_t v4 = [(HDIDSReachabilityOperation *)v3 initWithIdentifers:v2 serviceIdentifier:@"com.apple.private.alloy.health.sync.sharingsetup" updateHandler:v14];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F6AAD8]) initWithService:@"com.apple.private.alloy.health.sync.sharingsetup" delegate:*(void *)(*(void *)(a1 + 40) + 40) queue:*(void *)(*(void *)(a1 + 40) + 16)];
    [*(id *)(*(void *)(a1 + 40) + 40) setQueryController:v7];
    _HKInitializeLogging();
    id v8 = HKLogSharing();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = [*(id *)(a1 + 32) count];
      *(_DWORD *)buf = 138543618;
      uint64_t v18 = v9;
      __int16 v19 = 2048;
      uint64_t v20 = v10;
      _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Enqueing reachability operation for %ld identifiers.", buf, 0x16u);
    }

    [*(id *)(*(void *)(a1 + 40) + 32) addOperation:*(void *)(*(void *)(a1 + 40) + 40)];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

id __97__HDSummarySharingEntryIDSManager_beginObservingReachabilityStatusForIdentifiers_isInitialQuery___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 _appearsToBeEmail])
  {
    id v3 = (id)_IDSCopyIDForEmailAddress();
  }
  else if ([v2 _appearsToBePhoneNumber])
  {
    id v3 = (id)IDSCopyIDForPhoneNumber();
  }
  else
  {
    id v3 = v2;
  }
  uint64_t v4 = v3;

  return v4;
}

void __97__HDSummarySharingEntryIDSManager_beginObservingReachabilityStatusForIdentifiers_isInitialQuery___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [WeakRetained observers];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __97__HDSummarySharingEntryIDSManager_beginObservingReachabilityStatusForIdentifiers_isInitialQuery___block_invoke_4;
  v11[3] = &unk_1E62FF4A8;
  v11[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  [v8 notifyObservers:v11];
}

uint64_t __97__HDSummarySharingEntryIDSManager_beginObservingReachabilityStatusForIdentifiers_isInitialQuery___block_invoke_4(void *a1, void *a2)
{
  return [a2 summarySharingEntryIDSManager:a1[4] didUpdateReachabilityStatus:a1[5] error:a1[6]];
}

- (void)inviteSharingDataWithIdentifier:(id)a3 firstName:(id)a4 lastName:(id)a5 sharingAuthorizations:(id)a6 userWheelchairMode:(int64_t)a7 completion:(id)a8
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  __int16 v19 = -[HDSummarySharingEntryIDSManager _finishHandlerForOperation:completion:](self, @"invite", a8);
  _HKInitializeLogging();
  uint64_t v20 = HKLogSharing();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543619;
    v37 = self;
    __int16 v38 = 2113;
    id v39 = v15;
    _os_log_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Inviting to share data with contact identifier %{private}@", buf, 0x16u);
  }

  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  }
  else {
    id WeakRetained = 0;
  }
  v22 = [WeakRetained cloudSyncManager];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke;
  v28[3] = &unk_1E62FF570;
  v28[4] = self;
  id v29 = v15;
  id v30 = v16;
  id v31 = v17;
  id v32 = v18;
  id v33 = v19;
  SEL v34 = a2;
  int64_t v35 = a7;
  id v23 = v18;
  id v24 = v17;
  id v25 = v16;
  id v26 = v15;
  id v27 = v19;
  [v22 fetchCloudKitAccountInfoWithCompletion:v28];
}

- (id)_finishHandlerForOperation:(void *)a3 completion:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__HDSummarySharingEntryIDSManager__finishHandlerForOperation_completion___block_invoke;
    aBlock[3] = &unk_1E62F2A18;
    aBlock[4] = a1;
    id v9 = v5;
    id v10 = v6;
    a1 = _Block_copy(aBlock);
  }

  return a1;
}

void __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 emailAddress];

  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    id v10 = v9;
    if (v8)
    {
      if ([v9 _appearsToBeEmail])
      {
        uint64_t v11 = _IDSCopyIDForEmailAddress();
        goto LABEL_13;
      }
      if ([v10 _appearsToBePhoneNumber])
      {
        uint64_t v11 = _IDSCopyIDForPhoneNumberWithOptions();
LABEL_13:
        id v15 = (void *)v11;

        if (v15)
        {
          id v68 = v6;
          id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
          v69 = v5;
          id v17 = [v5 emailAddress];
          id v18 = objc_msgSend(v16, "initWithObjects:", v17, 0);

          v72 = *(void **)(a1 + 32);
          v67 = v15;
          if (!v72) {
            goto LABEL_52;
          }
          id v19 = objc_alloc(MEMORY[0x1E4F23A80]);
          uint64_t v20 = (void *)[v19 initWithQueue:MEMORY[0x1E4F14428]];
          id v86 = 0;
          uint64_t v21 = [v20 getSubscriptionInfoWithError:&v86];
          id v22 = v86;
          if (v22)
          {
            id v23 = v22;
            _HKInitializeLogging();
            log = HKLogSharing();
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v93 = v72;
              __int16 v94 = 2114;
              id v95 = v23;
              _os_log_error_impl(&dword_1BCB7D000, log, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to get CTXPCServiceSubscriptionInfo with error, %{public}@", buf, 0x16u);
            }
            uint64_t v24 = 0;
          }
          else
          {
            v66 = v18;
            id v27 = [v21 subscriptionsInUse];

            if (v27)
            {
              uint64_t v65 = a1;
              log = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v82 = 0u;
              long long v83 = 0u;
              long long v84 = 0u;
              long long v85 = 0u;
              v64 = v21;
              v28 = [v21 subscriptionsInUse];
              uint64_t v29 = [v28 countByEnumeratingWithState:&v82 objects:v88 count:16];
              if (v29)
              {
                uint64_t v30 = v29;
                id v23 = 0;
                uint64_t v31 = *(void *)v83;
                id v32 = log;
                do
                {
                  for (uint64_t i = 0; i != v30; ++i)
                  {
                    if (*(void *)v83 != v31) {
                      objc_enumerationMutation(v28);
                    }
                    SEL v34 = *(void **)(*((void *)&v82 + 1) + 8 * i);
                    if ([v34 isSimDataOnly])
                    {
                      _HKInitializeLogging();
                      int64_t v35 = HKLogSharing();
                      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138543362;
                        v93 = v72;
                        _os_log_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Sim is data only. Skipping...", buf, 0xCu);
                      }
                    }
                    else
                    {
                      id v81 = v23;
                      int64_t v35 = [v20 getPhoneNumber:v34 error:&v81];
                      id v36 = v81;

                      _HKInitializeLogging();
                      if (v36)
                      {
                        v37 = HKLogSharing();
                        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138543618;
                          v93 = v72;
                          __int16 v94 = 2114;
                          id v95 = v36;
                          _os_log_error_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to get sim Phone Number with error, %{public}@", buf, 0x16u);
                        }
                      }
                      else
                      {
                        __int16 v38 = (void *)*MEMORY[0x1E4F29FA8];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
                        {
                          id v39 = v38;
                          uint64_t v40 = [v35 number];
                          *(_DWORD *)buf = 138477827;
                          v93 = v40;
                          _os_log_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_DEFAULT, "Found sim phone number %{private}@", buf, 0xCu);

                          id v32 = log;
                        }
                        v37 = [v35 number];
                        [v32 addObject:v37];
                      }

                      id v23 = v36;
                    }
                  }
                  uint64_t v30 = [v28 countByEnumeratingWithState:&v82 objects:v88 count:16];
                }
                while (v30);
              }
              else
              {
                id v23 = 0;
                id v32 = log;
              }

              uint64_t v24 = [v32 count] ? (uint64_t)[v32 copy] : 0;
              a1 = v65;
              id v18 = v66;
              uint64_t v21 = v64;
            }
            else
            {
              _HKInitializeLogging();
              log = HKLogSharing();
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v93 = v72;
                _os_log_error_impl(&dword_1BCB7D000, log, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: CTXPCServiceSubscriptionContext returned nil when fetching sim phone number.", buf, 0xCu);
              }
              id v23 = 0;
              uint64_t v24 = 0;
            }
          }

          if (v24)
          {
            v73 = (void *)v24;
            [v18 addObjectsFromArray:v24];
          }
          else
          {
LABEL_52:
            v73 = 0;
          }
          v41 = [HDCodableSummarySharingEntry alloc];
          v42 = [MEMORY[0x1E4F29128] UUID];
          uint64_t v87 = *(void *)(a1 + 40);
          uint64_t v43 = v87;
          v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
          uint64_t v45 = *(void *)(a1 + 48);
          long long v71 = *(_OWORD *)(a1 + 56);
          uint64_t v46 = *(void *)(a1 + 88);
          uint64_t v47 = a1;
          v48 = [MEMORY[0x1E4F1C9C8] date];
          v49 = [MEMORY[0x1E4F1C9C8] date];
          v50 = -[HDCodableSummarySharingEntry initWithUUID:invitationUUID:cloudKitIdentifier:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:sharingAuthorizations:userWheelchairMode:type:direction:status:notificationStatus:dateModified:dateInvited:dateAccepted:setupMetadata:ownerParticipant:](v41, "initWithUUID:invitationUUID:cloudKitIdentifier:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:sharingAuthorizations:userWheelchairMode:type:direction:status:notificationStatus:dateModified:dateInvited:dateAccepted:setupMetadata:ownerParticipant:", v42, 0, 0, v43, v44, v45, v71, v46, 0, 0, 0, 0, v48, v49, 0,
                  0,
                  0);

          uint64_t v51 = *(void *)(v47 + 32);
          v52 = *(void **)(v47 + 64);
          v74[0] = MEMORY[0x1E4F143A8];
          v74[1] = 3221225472;
          v74[2] = __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_327;
          v74[3] = &unk_1E62FF548;
          v74[4] = v51;
          id v75 = *(id *)(v47 + 40);
          v76 = v50;
          id v80 = *(id *)(v47 + 72);
          id v77 = v69;
          id v78 = v18;
          id v13 = v67;
          id v79 = v13;
          id v53 = v18;
          v54 = v50;
          id v55 = v52;
          v56 = v74;
          if (v51)
          {
            id WeakRetained = objc_loadWeakRetained((id *)(v51 + 8));
            v58 = [WeakRetained cloudSyncManager];
            v59 = [v58 sharedSummaryManager];
            *(void *)v88 = MEMORY[0x1E4F143A8];
            *(void *)&v88[8] = 3221225472;
            *(void *)&v88[16] = __137__HDSummarySharingEntryIDSManager__setupSharingWithOutgoingCodableSummarySharingEntry_sharingAuthorizations_localAccountInfo_completion___block_invoke;
            v89 = &unk_1E62FF728;
            v91 = v56;
            v90 = v54;
            id v60 = (id)[v59 setupSharingWithOutgoingSummarySharingEntry:v90 sharingAuthorizations:v55 completion:v88];
          }
          id v5 = v69;
          id v6 = v68;
          id v25 = v73;
LABEL_56:

          goto LABEL_57;
        }
LABEL_20:
        id v25 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), *(void *)(a1 + 80), @"Unable to create email address or phone number from identifier"");
        _HKInitializeLogging();
        id v26 = HKLogSharing();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          uint64_t v62 = *(void *)(a1 + 32);
          v63 = *(void **)(a1 + 40);
          *(_DWORD *)v88 = 138543875;
          *(void *)&v88[4] = v62;
          *(_WORD *)&v88[12] = 2114;
          *(void *)&v88[14] = v25;
          *(_WORD *)&v88[22] = 2113;
          v89 = v63;
          _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error %{public}@ creating destination from identifier %{private}@", v88, 0x20u);
        }

        (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
        id v13 = 0;
        goto LABEL_56;
      }
    }

    goto LABEL_20;
  }
  _HKInitializeLogging();
  id v12 = HKLogSharing();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v61 = *(void *)(a1 + 32);
    *(_DWORD *)v88 = 138543618;
    *(void *)&v88[4] = v61;
    *(_WORD *)&v88[12] = 2114;
    *(void *)&v88[14] = v6;
    _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error fetching cloudkit email address %{public}@", v88, 0x16u);
  }

  objc_msgSend(v6, "hd_cloudKitErrorRequiringUserAction");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13) {
    id v14 = v13;
  }
  else {
    id v14 = v6;
  }
  (*(void (**)(void, void, id))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), 0, v14);
LABEL_57:
}

void __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_327(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    id v10 = (void *)[v7 copy];
    uint64_t v11 = [*(id *)(a1 + 56) emailAddress];
    [v10 setPrimaryContactIdentifier:v11];

    [v10 setAllContactIdentifiers:*(void *)(a1 + 64)];
    [v10 setFirstName:0];
    [v10 setLastName:0];
    _HKInitializeLogging();
    id v12 = HKLogSharing();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      id v14 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543619;
      uint64_t v37 = v13;
      __int16 v38 = 2113;
      id v39 = v14;
      _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Sending sharing invitation to identifier %{private}@", buf, 0x16u);
    }

    id v15 = [*(id *)(a1 + 32) invitationManager];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_329;
    v26[3] = &unk_1E62FF520;
    uint64_t v16 = *(void *)(a1 + 32);
    id v27 = v10;
    uint64_t v28 = v16;
    uint64_t v17 = *(void *)(a1 + 72);
    id v32 = *(id *)(a1 + 80);
    id v29 = v7;
    id v30 = v8;
    id v31 = *(id *)(a1 + 40);
    id v18 = v10;
    [v15 sendInvitationToIdentifier:v17 expirationDate:0 codableObject:v18 serverAcknowledgedBlock:v26];

    id v19 = v27;
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v20 = HKLogSharing();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = *(void *)(a1 + 32);
      uint64_t v25 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543875;
      uint64_t v37 = v24;
      __int16 v38 = 2114;
      id v39 = v9;
      __int16 v40 = 2113;
      uint64_t v41 = v25;
      _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error %{public}@ received nil pairing info for identifier %{private}@", buf, 0x20u);
    }

    objc_msgSend(v9, "hd_cloudKitErrorRequiringUserAction");
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 48) setStatus:4];
    uint64_t v21 = *(void *)(a1 + 32);
    id v22 = *(NSObject **)(v21 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_328;
    block[3] = &unk_1E62F30F8;
    void block[4] = v21;
    id v34 = *(id *)(a1 + 48);
    id v35 = *(id *)(a1 + 40);
    dispatch_sync(v22, block);
    if (v18) {
      id v23 = v18;
    }
    else {
      id v23 = v9;
    }
    (*(void (**)(void, void, id))(*(void *)(a1 + 80) + 16))(*(void *)(a1 + 80), 0, v23);

    id v19 = v34;
  }
}

void __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_328(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v13 = 0;
  char v4 = -[HDSummarySharingEntryIDSManager _queue_insertOrReplaceCodableEntry:ignoreIfExists:shouldResolveCNContact:error:](v2, v3, 0, 0, (uint64_t)&v13);
  id v5 = v13;
  if ((v4 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v10 = a1 + 40;
      id v8 = *(void **)(a1 + 40);
      uint64_t v9 = *(void *)(v10 + 8);
      uint64_t v11 = v6;
      id v12 = [v8 uuid];
      *(_DWORD *)buf = 138544131;
      uint64_t v15 = v7;
      __int16 v16 = 2113;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      id v19 = v12;
      __int16 v20 = 2114;
      id v21 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error inserting revoked invitation with contact identifier %{private}@ and UUID %{public}@. %{public}@", buf, 0x2Au);
    }
  }
}

- (uint64_t)_queue_insertOrReplaceCodableEntry:(uint64_t)a3 ignoreIfExists:(uint64_t)a4 shouldResolveCNContact:(uint64_t)a5 error:
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v9 = *(NSObject **)(a1 + 16);
  id v10 = a2;
  dispatch_assert_queue_V2(v9);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  id v12 = [WeakRetained sharingEntryManager];
  v16[0] = v10;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];

  uint64_t v14 = [v12 insertOrReplaceCodableEntries:v13 ignoreIfExists:a3 shouldResolveCNContact:a4 syncProvenance:0 error:a5];
  return v14;
}

void __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_329(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 40) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_3;
    block[3] = &unk_1E62FF5C0;
    id v21 = *(id *)(a1 + 48);
    id v22 = v5;
    id v9 = *(id *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 40);
    id v23 = v9;
    uint64_t v24 = v10;
    id v25 = *(id *)(a1 + 64);
    id v26 = *(id *)(a1 + 32);
    id v27 = *(id *)(a1 + 72);
    dispatch_sync(v8, block);

    id v11 = v21;
  }
  else
  {
    id v12 = v6;
    [*(id *)(a1 + 32) setStatus:4];
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      id WeakRetained = objc_loadWeakRetained((id *)(v13 + 8));
    }
    else {
      id WeakRetained = 0;
    }
    uint64_t v15 = [WeakRetained cloudSyncManager];
    __int16 v16 = [v15 sharedSummaryManager];
    uint64_t v17 = *(void *)(a1 + 32);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_2;
    v28[3] = &unk_1E62F69A0;
    id v18 = *(id *)(a1 + 72);
    id v29 = v12;
    id v30 = v18;
    id v11 = v12;
    id v19 = (id)[v16 revokeParticipantWithOutgoingSummarySharingEntry:v17 completion:v28];
  }
}

uint64_t __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_3(uint64_t a1)
{
  v34[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 40) uniqueID];
  uint64_t v3 = [v2 UUIDString];
  [*(id *)(a1 + 32) setInvitationUUID:v3];

  [*(id *)(a1 + 32) setCloudKitIdentifier:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = *(void **)(a1 + 32);
  id v31 = 0;
  LOBYTE(v3) = -[HDSummarySharingEntryIDSManager _queue_insertOrReplaceCodableEntry:ignoreIfExists:shouldResolveCNContact:error:](v4, v5, 0, 1, (uint64_t)&v31);
  id v6 = v31;
  if (v3)
  {
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7 && !_HDIsUnitTesting)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v7 + 8));
      id v9 = [WeakRetained cloudSyncManager];
      uint64_t v10 = [v9 sharedSummaryManager];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __56__HDSummarySharingEntryIDSManager__attemptPushSummaries__block_invoke;
      id v33 = &unk_1E62F2978;
      v34[0] = v7;
      id v11 = (id)[v10 push:buf];
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    id v12 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = *(void *)(a1 + 56);
      uint64_t v22 = *(void *)(a1 + 64);
      id v23 = *(void **)(a1 + 40);
      uint64_t v24 = v12;
      id v25 = [v23 uniqueID];
      *(_DWORD *)buf = 138544131;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = v22;
      *(_WORD *)&buf[22] = 2114;
      id v33 = v25;
      LOWORD(v34[0]) = 2114;
      *(void *)((char *)v34 + 2) = v6;
      _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error inserting invitation with contact identifier %{private}@ and UUID %{public}@. %{public}@", buf, 0x2Au);
    }
    uint64_t v13 = [*(id *)(a1 + 56) invitationManager];
    uint64_t v14 = [*(id *)(a1 + 40) uniqueID];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_331;
    v29[3] = &unk_1E62F5D48;
    v29[4] = *(void *)(a1 + 56);
    id v30 = *(id *)(a1 + 40);
    [v13 rescindInvitationWithUUID:v14 serverAcknowledgedBlock:v29];

    [*(id *)(a1 + 72) setStatus:4];
    uint64_t v15 = *(void *)(a1 + 56);
    if (v15) {
      id v16 = objc_loadWeakRetained((id *)(v15 + 8));
    }
    else {
      id v16 = 0;
    }
    uint64_t v17 = [v16 cloudSyncManager];
    id v18 = [v17 sharedSummaryManager];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_332;
    v26[3] = &unk_1E62F69A0;
    uint64_t v19 = *(void *)(a1 + 72);
    id v28 = *(id *)(a1 + 80);
    id v27 = v6;
    id v20 = (id)[v18 revokeParticipantWithOutgoingSummarySharingEntry:v19 completion:v26];
  }
}

void __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_331(uint64_t a1, char a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v7 = *(void **)(a1 + 40);
      id v9 = v6;
      uint64_t v10 = [v7 uniqueID];
      int v11 = 138543874;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error attempting to rescinding invitation with UUID %{public}@. %{public}@", (uint8_t *)&v11, 0x20u);
    }
  }
}

uint64_t __138__HDSummarySharingEntryIDSManager_inviteSharingDataWithIdentifier_firstName_lastName_sharingAuthorizations_userWheelchairMode_completion___block_invoke_332(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)acceptInvitationWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  -[HDSummarySharingEntryIDSManager _finishHandlerForOperation:completion:](self, @"accept", a4);
  uint64_t v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  uint64_t v8 = HKLogSharing();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 UUIDString];
    *(_DWORD *)buf = 138543618;
    v54 = self;
    __int16 v55 = 2114;
    id v56 = v9;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Accepting invitation with UUID %{public}@", buf, 0x16u);
  }
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  }
  else {
    id WeakRetained = 0;
  }
  int v11 = [WeakRetained sharingEntryManager];
  id v52 = 0;
  uint64_t v12 = [v11 codableEntryWithUUID:v6 errorOut:&v52];
  id v13 = v52;

  if (v12)
  {
    if ([v12 status])
    {
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 1600, @"We found an entry in the database but it has the wrong status.");
      _HKInitializeLogging();
      __int16 v15 = HKLogSharing();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        [v12 status];
        id v34 = HKStringForSharingStatus();
        id v35 = [v12 primaryContactIdentifier];
        id v36 = [v12 uuid];
        *(_DWORD *)buf = 138544131;
        v54 = self;
        __int16 v55 = 2114;
        id v56 = v34;
        __int16 v57 = 2113;
        id v58 = v35;
        __int16 v59 = 2114;
        id v60 = v36;
        _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error incorrect status %{public}@ for entry with identifier %{private}@ and UUID %{public}@", buf, 0x2Au);
      }
      _HKInitializeLogging();
      id v16 = HKLogSharing();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [v12 sharingEntry];
        *(_DWORD *)buf = 138543619;
        v54 = self;
        __int16 v55 = 2113;
        id v56 = v17;
        _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Found entry: %{private}@", buf, 0x16u);
      }
      ((void (**)(void, void, void *))v7)[2](v7, 0, v14);
    }
    else
    {
      uint64_t v19 = [v12 sharingSetupMetadata];
      id v51 = v13;
      id v20 = +[HDCloudSyncShareSetupMetadata cloudSyncShareSetupMetadataWithCodableSharingSetupMetadata:v19 error:&v51];
      id v21 = v51;

      if (v20)
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke;
        aBlock[3] = &unk_1E62FF598;
        aBlock[4] = self;
        id v22 = v12;
        id v49 = v22;
        id v23 = v7;
        id v50 = v23;
        __int16 v40 = _Block_copy(aBlock);
        uint64_t v24 = [v20 shareURLs];
        uint64_t v25 = [v24 count];

        if (v25)
        {
          id v47 = v21;
          id v26 = -[HDSummarySharingEntryIDSManager _profileForEntry:errorOut:]((uint64_t)self, v22, (uint64_t)&v47);
          id v27 = v47;

          if (v26)
          {
            [v26 cloudSyncManager];
            v28 = id v39 = v27;
            v41[0] = MEMORY[0x1E4F143A8];
            v41[1] = 3221225472;
            v41[2] = __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_347;
            v41[3] = &unk_1E62FF638;
            v41[4] = self;
            id v29 = v26;
            id v42 = v29;
            id v30 = v40;
            id v45 = v40;
            id v43 = v20;
            id v46 = v23;
            id v44 = v22;
            [v28 acceptShare:v43 completion:v41];

            id v21 = v39;
          }
          else
          {
            _HKInitializeLogging();
            id v33 = HKLogSharing();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v54 = self;
              __int16 v55 = 2114;
              id v56 = v27;
              _os_log_error_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Unable to create profile. %{public}@", buf, 0x16u);
            }

            (*((void (**)(id, void, id))v23 + 2))(v23, 0, v27);
            id v29 = 0;
            id v21 = v27;
            id v30 = v40;
          }
        }
        else
        {
          _HKInitializeLogging();
          id v32 = HKLogSharing();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            __int16 v38 = [v6 UUIDString];
            *(_DWORD *)buf = 138543618;
            v54 = self;
            __int16 v55 = 2114;
            id v56 = v38;
            _os_log_error_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: No share URLs found on invitation with UUID %{public}@", buf, 0x16u);
          }
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 710, @"Share setup metadata does not contain any share URLs");
          id v29 = (id)objc_claimAutoreleasedReturnValue();
          id v30 = v40;
          (*((void (**)(void *, id))v40 + 2))(v40, v29);
        }
      }
      else
      {
        _HKInitializeLogging();
        id v31 = HKLogSharing();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          uint64_t v37 = [v12 sharingSetupMetadata];
          *(_DWORD *)buf = 138543875;
          v54 = self;
          __int16 v55 = 2113;
          id v56 = v37;
          __int16 v57 = 2114;
          id v58 = v21;
          _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to decode codable sharing setup metadata %{private}@: %{public}@", buf, 0x20u);
        }
        ((void (**)(void, void, id))v7)[2](v7, 0, v21);
      }

      id v13 = v21;
    }
  }
  else
  {
    _HKInitializeLogging();
    id v18 = HKLogSharing();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v54 = self;
      __int16 v55 = 2114;
      id v56 = v13;
      _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Codable entry not found. %{public}@", buf, 0x16u);
    }

    ((void (**)(void, void, id))v7)[2](v7, 0, v13);
  }
}

void __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_2;
  v7[3] = &unk_1E62F2F48;
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_sync(v5, v7);
}

void __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(*(id *)(a1 + 32), "hk_isHealthKitErrorWithCode:", 710))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v4 = [*(id *)(a1 + 48) invitationUUID];
    id v5 = (void *)[v3 initWithUUIDString:v4];
    uint64_t v19 = 0;
    if (v2)
    {
      char v6 = -[HDSummarySharingEntryIDSManager _queue_updateEntryWithInvitationUUID:newStatus:dateAccepted:ownerParticipant:error:](v2, v5, 2, 0, 0, (uint64_t)&v19);
      uint64_t v7 = v19;
    }
    else
    {
      uint64_t v7 = 0;
      char v6 = 0;
    }
    id v8 = v7;

    if (v6)
    {
      uint64_t v9 = *(void *)(a1 + 56);
      id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 707, @"The share participant was not found. Invitation has been declined");
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v12 = (void *)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = *(void *)(a1 + 40);
        id v13 = *(void **)(a1 + 48);
        __int16 v15 = v12;
        id v16 = [v13 primaryContactIdentifier];
        uint64_t v17 = [*(id *)(a1 + 48) uuid];
        uint64_t v18 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138544131;
        uint64_t v21 = v14;
        __int16 v22 = 2113;
        id v23 = v16;
        __int16 v24 = 2114;
        uint64_t v25 = v17;
        __int16 v26 = 2114;
        uint64_t v27 = v18;
        _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error updating declined invitation with identifier %{private}@ and UUID %{public}@. %{public}@", buf, 0x2Au);
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    id v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v11();
  }
}

- (id)_profileForEntry:(uint64_t)a3 errorOut:
{
  id v5 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v7 = [WeakRetained daemon];
    id v8 = [v7 profileManager];

    id v9 = objc_alloc(MEMORY[0x1E4F29128]);
    id v10 = [v5 uuid];
    id v11 = (void *)[v9 initWithUUIDString:v10];

    uint64_t v12 = [v8 profileIdentifierForUUID:v11];
    if (v12)
    {
      id v13 = (void *)v12;
      uint64_t v14 = [v8 profileForIdentifier:v12];
    }
    else
    {
      id v13 = [MEMORY[0x1E4F2B358] _profileWithUUID:v11 type:2];
      __int16 v15 = [v5 firstName];
      uint64_t v16 = [v5 lastName];
      uint64_t v17 = (void *)v16;
      if (!v15)
      {
        if (v16)
        {
          __int16 v15 = &stru_1F1728D60;
        }
        else
        {
          __int16 v15 = [v5 primaryContactIdentifier];
        }
      }
      uint64_t v14 = [v8 createProfileForIdentifier:v13 firstName:v15 lastName:v17 error:a3];
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

void __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_347(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [*(id *)(a1 + 40) cloudSyncManager];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_348;
    v23[3] = &unk_1E62FF610;
    id v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v23[4] = *(void *)(a1 + 32);
    id v24 = v8;
    id v27 = *(id *)(a1 + 72);
    id v25 = *(id *)(a1 + 56);
    id v26 = v5;
    [v7 configureForShareSetupMetadata:v9 acceptedShares:v26 completion:v23];
  }
  else
  {
    _HKInitializeLogging();
    id v10 = HKLogSharing();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v18;
      __int16 v31 = 2114;
      id v32 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Accepted CKShares are nil. %{public}@", buf, 0x16u);
    }

    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(a1 + 40);
    id v28 = 0;
    char v13 = -[HDSummarySharingEntryIDSManager _deleteProfile:errorOut:](v11, v12, (uint64_t)&v28);
    id v14 = v28;
    if ((v13 & 1) == 0)
    {
      _HKInitializeLogging();
      __int16 v15 = HKLogSharing();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        id v20 = [*(id *)(a1 + 40) profileIdentifier];
        uint64_t v21 = [v20 identifier];
        __int16 v22 = [v21 UUIDString];
        *(_DWORD *)buf = 138543874;
        uint64_t v30 = v19;
        __int16 v31 = 2114;
        id v32 = v22;
        __int16 v33 = 2114;
        id v34 = v14;
        _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to delete shared profile with identifier %{public}@. %{public}@", buf, 0x20u);
      }
    }
    uint64_t v16 = objc_msgSend(v6, "hd_cloudKitErrorRequiringUserAction");
    if (v16) {
      id v17 = v16;
    }
    else {
      id v17 = v6;
    }
    (*(void (**)(void, id))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v17);
  }
}

- (uint64_t)_deleteProfile:(uint64_t)a3 errorOut:
{
  if (result)
  {
    uint64_t v4 = (id *)(result + 8);
    id v5 = a2;
    id WeakRetained = objc_loadWeakRetained(v4);
    uint64_t v7 = [WeakRetained daemon];
    id v8 = [v7 profileManager];
    uint64_t v9 = [v5 profileIdentifier];

    uint64_t v10 = [v8 deleteProfile:v9 error:a3];
    return v10;
  }
  return result;
}

void __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_348(id *a1, char a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = HKLogSharing();
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = a1[4];
      uint64_t v9 = [a1[6] primaryContactIdentifier];
      uint64_t v10 = [a1[6] uuid];
      *(_DWORD *)buf = 138543875;
      id v38 = v8;
      __int16 v39 = 2113;
      id v40 = v9;
      __int16 v41 = 2114;
      id v42 = v10;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Sending accepted sharing invitation to identifier %{private}@ and UUID %{public}@", buf, 0x20u);
    }
    id v11 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v12 = [a1[6] invitationUUID];
    char v13 = (void *)[v11 initWithUUIDString:v12];

    id v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceReferenceDate];
    objc_msgSend(a1[6], "setDateAccepted:");
    __int16 v15 = [a1[4] invitationManager];
    id v16 = a1[6];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_349;
    v29[3] = &unk_1E62FF5E8;
    v29[4] = a1[4];
    id v30 = v16;
    id v31 = v13;
    id v32 = v14;
    id v33 = a1[7];
    id v35 = a1[8];
    id v34 = a1[5];
    id v17 = v14;
    id v18 = v13;
    [v15 acceptInvitationWithUUID:v18 codableObject:v30 serverAcknowledgedBlock:v29];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v24 = a1[4];
      *(_DWORD *)buf = 138543618;
      id v38 = v24;
      __int16 v39 = 2114;
      id v40 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to configure share setup metadata. %{public}@", buf, 0x16u);
    }

    uint64_t v19 = (uint64_t)a1[4];
    id v20 = a1[5];
    id v36 = 0;
    char v21 = -[HDSummarySharingEntryIDSManager _deleteProfile:errorOut:](v19, v20, (uint64_t)&v36);
    id v18 = v36;
    if ((v21 & 1) == 0)
    {
      _HKInitializeLogging();
      __int16 v22 = HKLogSharing();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v25 = a1[4];
        id v26 = [a1[5] profileIdentifier];
        id v27 = [v26 identifier];
        id v28 = [v27 UUIDString];
        *(_DWORD *)buf = 138543874;
        id v38 = v25;
        __int16 v39 = 2114;
        id v40 = v28;
        __int16 v41 = 2114;
        id v42 = v18;
        _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to delete shared profile with identifier %{public}@. %{public}@", buf, 0x20u);
      }
    }
    objc_msgSend(v5, "hd_cloudKitErrorRequiringUserAction");
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17) {
      id v23 = v17;
    }
    else {
      id v23 = v5;
    }
    (*((void (**)(id, void, id))a1[8] + 2))(a1[8], 0, v23);
  }
}

void __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_349(uint64_t a1, char a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v9 = *(void **)(a1 + 40);
      id v11 = v6;
      uint64_t v12 = [v9 primaryContactIdentifier];
      uint64_t v13 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544131;
      uint64_t v22 = v10;
      __int16 v23 = 2113;
      id v24 = v12;
      __int16 v25 = 2114;
      uint64_t v26 = v13;
      __int16 v27 = 2114;
      id v28 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error accepting invitation with identifier %{private}@ and UUID %{public}@. %{public}@", buf, 0x2Au);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_350;
  block[3] = &unk_1E62FF5C0;
  void block[4] = v7;
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v17 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 40);
  id v20 = *(id *)(a1 + 80);
  id v19 = *(id *)(a1 + 72);
  dispatch_sync(v8, block);
}

void __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_350(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 48);
  id v5 = [*(id *)(a1 + 56) firstObject];
  id v6 = [v5 owner];
  id v21 = 0;
  LOBYTE(v3) = -[HDSummarySharingEntryIDSManager _queue_updateEntryWithInvitationUUID:newStatus:dateAccepted:ownerParticipant:error:](v2, v3, 1, v4, v6, (uint64_t)&v21);
  id v7 = v21;

  if (v3)
  {
    id v8 = [*(id *)(a1 + 72) cloudSyncManager];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_351;
    v20[3] = &unk_1E62F2978;
    v20[4] = *(void *)(a1 + 32);
    [v8 subscribeToDataAvailableNotificationsWithCompletion:v20];

    uint64_t v9 = [*(id *)(a1 + 72) cloudSyncManager];
    uint64_t v10 = [v9 sharedSummaryManager];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_352;
    v19[3] = &unk_1E62F2978;
    v19[4] = *(void *)(a1 + 32);
    id v11 = (id)[v10 pull:v19];

    -[HDSummarySharingEntryIDSManager _attemptBestEffortCloudSynchronization](*(void *)(a1 + 32));
    uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v13 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = *(void **)(a1 + 64);
      id v16 = v13;
      id v17 = [v15 primaryContactIdentifier];
      id v18 = [*(id *)(a1 + 64) uuid];
      *(_DWORD *)buf = 138544131;
      uint64_t v23 = v14;
      __int16 v24 = 2113;
      __int16 v25 = v17;
      __int16 v26 = 2114;
      __int16 v27 = v18;
      __int16 v28 = 2114;
      id v29 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error updating accepted invitation with identifier %{private}@ and UUID %{public}@. %{public}@", buf, 0x2Au);
    }
    uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 80) + 16);
  }
  v12();
}

- (uint64_t)_queue_updateEntryWithInvitationUUID:(uint64_t)a3 newStatus:(void *)a4 dateAccepted:(void *)a5 ownerParticipant:(uint64_t)a6 error:
{
  if (result)
  {
    uint64_t v10 = result;
    id v11 = *(NSObject **)(result + 16);
    id v12 = a5;
    id v13 = a4;
    id v14 = a2;
    dispatch_assert_queue_V2(v11);
    id WeakRetained = objc_loadWeakRetained((id *)(v10 + 8));
    id v16 = [WeakRetained sharingEntryManager];
    uint64_t v17 = [v16 updateEntryWithInvitationUUID:v14 newStatus:a3 dateAccepted:v13 ownerParticipant:v12 error:a6];

    return v17;
  }
  return result;
}

void __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_351(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = HKLogSharing();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to subscribe to data available after accepting share. %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __71__HDSummarySharingEntryIDSManager_acceptInvitationWithUUID_completion___block_invoke_352(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = HKLogSharing();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to pull summaries after accepting share. %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_attemptBestEffortCloudSynchronization
{
  if (a1)
  {
    if (!_HDIsUnitTesting)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      id v3 = [WeakRetained cloudSyncManager];
      uint64_t v4 = [v3 sharedSummaryManager];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __73__HDSummarySharingEntryIDSManager__attemptBestEffortCloudSynchronization__block_invoke;
      v6[3] = &unk_1E62F2978;
      v6[4] = a1;
      id v5 = (id)[v4 synchronizeWithCompletion:v6];
    }
  }
}

- (void)declineInvitationWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  -[HDSummarySharingEntryIDSManager _finishHandlerForOperation:completion:](self, @"decline", a4);
  uint64_t v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  int v8 = HKLogSharing();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 UUIDString];
    *(_DWORD *)buf = 138543618;
    id v33 = self;
    __int16 v34 = 2114;
    id v35 = v9;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Declining invitation with UUID %{public}@", buf, 0x16u);
  }
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  }
  else {
    id WeakRetained = 0;
  }
  id v11 = [WeakRetained sharingEntryManager];
  id v31 = 0;
  uint64_t v12 = [v11 codableEntryWithUUID:v6 errorOut:&v31];
  id v13 = v31;

  if (v12)
  {
    if ([v12 status])
    {
      id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 1600, @"We found an entry in the database but it has the wrong status.");
      _HKInitializeLogging();
      id v15 = HKLogSharing();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        [v12 status];
        __int16 v24 = HKStringForSharingStatus();
        __int16 v25 = [v12 primaryContactIdentifier];
        __int16 v26 = [v12 uuid];
        *(_DWORD *)buf = 138544131;
        id v33 = self;
        __int16 v34 = 2114;
        id v35 = v24;
        __int16 v36 = 2113;
        uint64_t v37 = v25;
        __int16 v38 = 2114;
        __int16 v39 = v26;
        _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error incorrect status %{public}@ for entry with identifier %{private}@ and UUID %{public}@", buf, 0x2Au);
      }
      _HKInitializeLogging();
      id v16 = HKLogSharing();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [v12 sharingEntry];
        *(_DWORD *)buf = 138543619;
        id v33 = self;
        __int16 v34 = 2113;
        id v35 = v17;
        _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Found entry: %{private}@", buf, 0x16u);
      }
      ((void (**)(void, void, void *))v7)[2](v7, 0, v14);
    }
    else
    {
      id v19 = objc_alloc(MEMORY[0x1E4F29128]);
      id v20 = [v12 invitationUUID];
      id v21 = (void *)[v19 initWithUUIDString:v20];

      uint64_t v22 = [(HDSummarySharingEntryIDSManager *)self invitationManager];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __72__HDSummarySharingEntryIDSManager_declineInvitationWithUUID_completion___block_invoke;
      v27[3] = &unk_1E62F9580;
      uint64_t v30 = v7;
      v27[4] = self;
      id v28 = v21;
      id v29 = v12;
      id v23 = v21;
      [v22 declineInvitationWithUUID:v23 serverAcknowledgedBlock:v27];
    }
  }
  else
  {
    _HKInitializeLogging();
    id v18 = HKLogSharing();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v33 = self;
      __int16 v34 = 2114;
      id v35 = v13;
      _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Codable entry not found. %{public}@", buf, 0x16u);
    }

    ((void (**)(void, void, id))v7)[2](v7, 0, v13);
  }
}

void __72__HDSummarySharingEntryIDSManager_declineInvitationWithUUID_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if ((a2 & 1) != 0
    || [v5 code] == 3
    || (objc_msgSend(v6, "hk_isHealthKitErrorWithCode:", 118) & 1) != 0)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(NSObject **)(v7 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__HDSummarySharingEntryIDSManager_declineInvitationWithUUID_completion___block_invoke_2;
    block[3] = &unk_1E62FF660;
    void block[4] = v7;
    id v10 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    id v12 = v6;
    id v13 = *(id *)(a1 + 56);
    dispatch_sync(v8, block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __72__HDSummarySharingEntryIDSManager_declineInvitationWithUUID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v14 = 0;
  if (v2)
  {
    char v4 = -[HDSummarySharingEntryIDSManager _queue_updateEntryWithInvitationUUID:newStatus:dateAccepted:ownerParticipant:error:](v2, v3, 2, 0, 0, (uint64_t)&v14);
    id v5 = v14;
    if (v4)
    {
      -[HDSummarySharingEntryIDSManager _attemptBestEffortCloudSynchronization](*(void *)(a1 + 32));
      id v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = 0;
  }
  _HKInitializeLogging();
  uint64_t v7 = (void *)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(a1 + 48);
    id v10 = v7;
    id v11 = [v9 primaryContactIdentifier];
    id v12 = [*(id *)(a1 + 48) uuid];
    uint64_t v13 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138544131;
    uint64_t v16 = v8;
    __int16 v17 = 2113;
    id v18 = v11;
    __int16 v19 = 2114;
    id v20 = v12;
    __int16 v21 = 2114;
    uint64_t v22 = v13;
    _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error updating declined invitation with identifier %{private}@ and UUID %{public}@. %{public}@", buf, 0x2Au);
  }
  id v6 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_8:
  v6();
}

- (void)revokeInvitationWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  -[HDSummarySharingEntryIDSManager _finishHandlerForOperation:completion:](self, @"revoke", a4);
  uint64_t v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  uint64_t v8 = HKLogSharing();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 UUIDString];
    *(_DWORD *)buf = 138543618;
    __int16 v55 = self;
    __int16 v56 = 2114;
    id v57 = v9;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Revoking invitation with UUID %{public}@", buf, 0x16u);
  }
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  }
  else {
    id WeakRetained = 0;
  }
  id v11 = [WeakRetained sharingEntryManager];
  id v53 = 0;
  id v12 = [v11 codableEntryWithUUID:v6 errorOut:&v53];
  id v13 = v53;

  if (v12)
  {
    if ([v12 status] == 1 || !objc_msgSend(v12, "status"))
    {
      id v19 = objc_alloc(MEMORY[0x1E4F29128]);
      id v20 = [v12 invitationUUID];
      __int16 v21 = (void *)[v19 initWithUUIDString:v20];

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __71__HDSummarySharingEntryIDSManager_revokeInvitationWithUUID_completion___block_invoke;
      aBlock[3] = &unk_1E62FF6B0;
      aBlock[4] = self;
      id v40 = v6;
      id v48 = v6;
      id v22 = v21;
      id v49 = v22;
      id v23 = v12;
      id v50 = v23;
      id v38 = v13;
      id v51 = v13;
      __int16 v39 = v7;
      __int16 v24 = v7;
      id v52 = v24;
      __int16 v25 = _Block_copy(aBlock);
      __int16 v26 = (void *)[v23 copy];
      if ([v23 status] == 1) {
        uint64_t v27 = 4;
      }
      else {
        uint64_t v27 = 3;
      }
      [v26 setStatus:v27];
      if (self) {
        id v28 = objc_loadWeakRetained((id *)&self->_profile);
      }
      else {
        id v28 = 0;
      }
      id v29 = [v28 cloudSyncManager];
      uint64_t v30 = [v29 sharedSummaryManager];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __71__HDSummarySharingEntryIDSManager_revokeInvitationWithUUID_completion___block_invoke_355;
      v42[3] = &unk_1E62FF700;
      v42[4] = self;
      id v43 = v23;
      id v44 = v22;
      id v45 = v24;
      id v46 = v25;
      id v31 = v25;
      id v32 = v22;
      id v33 = (id)[v30 revokeParticipantWithOutgoingSummarySharingEntry:v26 completion:v42];

      uint64_t v7 = v39;
      id v6 = v40;
      id v13 = v38;
    }
    else
    {
      id v14 = v13;
      id v15 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 1600, @"We found an entry in the database but it has the wrong status.");
      _HKInitializeLogging();
      uint64_t v16 = HKLogSharing();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        [v12 status];
        __int16 v41 = HKStringForSharingStatus();
        id v35 = [v12 primaryContactIdentifier];
        uint64_t v36 = [v12 uuid];
        *(_DWORD *)buf = 138544131;
        __int16 v55 = self;
        __int16 v56 = 2114;
        id v57 = v41;
        __int16 v58 = 2113;
        __int16 v59 = v35;
        __int16 v60 = 2114;
        uint64_t v61 = v36;
        uint64_t v37 = (void *)v36;
        _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error incorrect status %{public}@ for entry with identifier %{private}@ and UUID %{public}@", buf, 0x2Au);
      }
      _HKInitializeLogging();
      __int16 v17 = HKLogSharing();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [v12 sharingEntry];
        *(_DWORD *)buf = 138543619;
        __int16 v55 = self;
        __int16 v56 = 2113;
        id v57 = v18;
        _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Found entry: %{private}@", buf, 0x16u);
      }
      ((void (**)(void, void, void *))v7)[2](v7, 0, v15);

      id v13 = v14;
    }
  }
  else
  {
    _HKInitializeLogging();
    __int16 v34 = HKLogSharing();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v55 = self;
      __int16 v56 = 2114;
      id v57 = v13;
      _os_log_error_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Codable entry not found. %{public}@", buf, 0x16u);
    }

    ((void (**)(void, void, id))v7)[2](v7, 0, v13);
  }
}

void __71__HDSummarySharingEntryIDSManager_revokeInvitationWithUUID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__HDSummarySharingEntryIDSManager_revokeInvitationWithUUID_completion___block_invoke_2;
  block[3] = &unk_1E62FF688;
  void block[4] = v4;
  id v7 = *(id *)(a1 + 40);
  uint64_t v12 = a2;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 72);
  dispatch_sync(v5, block);
}

void __71__HDSummarySharingEntryIDSManager_revokeInvitationWithUUID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = HKLogSharing();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) UUIDString];
    id v5 = HKStringForSharingStatus();
    *(_DWORD *)buf = 138543874;
    uint64_t v21 = v3;
    __int16 v22 = 2114;
    id v23 = v4;
    __int16 v24 = 2114;
    __int16 v25 = v5;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Updating invitation with UUID %{public}@ to %{public}@.", buf, 0x20u);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 80);
  id v19 = 0;
  if (v6)
  {
    char v9 = -[HDSummarySharingEntryIDSManager _queue_updateEntryWithInvitationUUID:newStatus:dateAccepted:ownerParticipant:error:](v6, v7, v8, 0, 0, (uint64_t)&v19);
    id v10 = v19;
    if (v9)
    {
      -[HDSummarySharingEntryIDSManager _attemptBestEffortCloudSynchronization](*(void *)(a1 + 32));
      id v11 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
      goto LABEL_10;
    }
  }
  else
  {
    id v10 = 0;
  }
  _HKInitializeLogging();
  uint64_t v12 = (void *)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = v12;
    id v15 = HKStringForSharingStatus();
    uint64_t v16 = [*(id *)(a1 + 56) primaryContactIdentifier];
    __int16 v17 = [*(id *)(a1 + 56) uuid];
    uint64_t v18 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 138544387;
    uint64_t v21 = v13;
    __int16 v22 = 2114;
    id v23 = v15;
    __int16 v24 = 2113;
    __int16 v25 = v16;
    __int16 v26 = 2114;
    uint64_t v27 = v17;
    __int16 v28 = 2114;
    uint64_t v29 = v18;
    _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error updating %{public}@ invitation with identifier %{private}@ and UUID %{public}@. %{public}@", buf, 0x34u);
  }
  id v11 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
LABEL_10:
  v11();
}

void __71__HDSummarySharingEntryIDSManager_revokeInvitationWithUUID_completion___block_invoke_355(uint64_t a1, char a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [*(id *)(a1 + 32) invitationManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__HDSummarySharingEntryIDSManager_revokeInvitationWithUUID_completion___block_invoke_356;
    v13[3] = &unk_1E62FF6D8;
    uint64_t v7 = *(void *)(a1 + 48);
    id v15 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 64);
    [v6 rescindInvitationWithUUID:v7 serverAcknowledgedBlock:v13];

    uint64_t v8 = v15;
  }
  else
  {
    _HKInitializeLogging();
    char v9 = HKLogSharing();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = [*(id *)(a1 + 40) primaryContactIdentifier];
      *(_DWORD *)buf = 138543875;
      uint64_t v18 = v11;
      __int16 v19 = 2113;
      id v20 = v5;
      __int16 v21 = 2114;
      __int16 v22 = v12;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error removing participant with identifier %{private}@: %{public}@", buf, 0x20u);
    }
    uint64_t v8 = objc_msgSend(v5, "hd_cloudKitErrorRequiringUserAction");
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = v5;
    }
    (*(void (**)(void, void, id))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 0, v10);
  }
}

void __71__HDSummarySharingEntryIDSManager_revokeInvitationWithUUID_completion___block_invoke_356(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v8 = v5;
  if ((a2 & 1) != 0
    || [v5 code] == 3
    || (char v7 = objc_msgSend(v8, "hk_isHealthKitErrorWithCode:", 118), v6 = v8, (v7 & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "status", v6);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)leaveInvitationWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  -[HDSummarySharingEntryIDSManager _finishHandlerForOperation:completion:](self, @"leave", a4);
  char v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  id v8 = HKLogSharing();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    char v9 = [v6 UUIDString];
    *(_DWORD *)buf = 138543618;
    __int16 v34 = self;
    __int16 v35 = 2114;
    id v36 = v9;
    _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Leaving invitation with UUID %{public}@", buf, 0x16u);
  }
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v11 = [WeakRetained sharingEntryManager];
  id v32 = 0;
  uint64_t v12 = [v11 codableEntryWithUUID:v6 errorOut:&v32];
  id v13 = v32;

  if (v12)
  {
    if ([v12 status] == 1)
    {
      id v31 = v13;
      id v14 = -[HDSummarySharingEntryIDSManager _profileForEntry:errorOut:]((uint64_t)self, v12, (uint64_t)&v31);
      id v15 = v31;

      if (v14)
      {
        id v16 = [v14 cloudSyncManager];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __70__HDSummarySharingEntryIDSManager_leaveInvitationWithUUID_completion___block_invoke;
        v27[3] = &unk_1E62F29C8;
        v27[4] = self;
        id v28 = v12;
        uint64_t v30 = v7;
        id v29 = v14;
        id v17 = (id)[v16 leaveSharesWithCompletion:v27];
      }
      else
      {
        _HKInitializeLogging();
        uint64_t v23 = HKLogSharing();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          __int16 v34 = self;
          __int16 v35 = 2114;
          id v36 = v15;
          _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Unable to create profile. %{public}@", buf, 0x16u);
        }

        ((void (**)(void, void, id))v7)[2](v7, 0, v15);
      }

      id v13 = v15;
    }
    else
    {
      __int16 v19 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 1600, @"We found an entry in the database but it has the wrong status.");
      _HKInitializeLogging();
      id v20 = HKLogSharing();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        [v12 status];
        __int16 v24 = HKStringForSharingStatus();
        __int16 v25 = [v12 primaryContactIdentifier];
        __int16 v26 = [v12 uuid];
        *(_DWORD *)buf = 138544131;
        __int16 v34 = self;
        __int16 v35 = 2114;
        id v36 = v24;
        __int16 v37 = 2113;
        id v38 = v25;
        __int16 v39 = 2114;
        id v40 = v26;
        _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error incorrect status %{public}@ for entry with identifier %{private}@ and UUID %{public}@", buf, 0x2Au);
      }
      _HKInitializeLogging();
      __int16 v21 = HKLogSharing();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v22 = [v12 sharingEntry];
        *(_DWORD *)buf = 138543619;
        __int16 v34 = self;
        __int16 v35 = 2113;
        id v36 = v22;
        _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Found entry: %{private}@", buf, 0x16u);
      }
      ((void (**)(void, void, void *))v7)[2](v7, 0, v19);
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v18 = HKLogSharing();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v34 = self;
      __int16 v35 = 2114;
      id v36 = v13;
      _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Codable entry not found. %{public}@", buf, 0x16u);
    }

    ((void (**)(void, void, id))v7)[2](v7, 0, v13);
  }
}

void __70__HDSummarySharingEntryIDSManager_leaveInvitationWithUUID_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    char v7 = *(NSObject **)(v6 + 16);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__HDSummarySharingEntryIDSManager_leaveInvitationWithUUID_completion___block_invoke_357;
    v13[3] = &unk_1E62F7150;
    void v13[4] = v6;
    id v14 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 56);
    id v15 = *(id *)(a1 + 48);
    dispatch_sync(v7, v13);
  }
  else
  {
    _HKInitializeLogging();
    id v8 = HKLogSharing();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = [*(id *)(a1 + 40) primaryContactIdentifier];
      *(_DWORD *)buf = 138543875;
      uint64_t v18 = v11;
      __int16 v19 = 2114;
      id v20 = v5;
      __int16 v21 = 2113;
      __int16 v22 = v12;
      _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error %{public}@ unable to leave sharing with identifier %{private}@", buf, 0x20u);
    }
    char v9 = objc_msgSend(v5, "hd_cloudKitErrorRequiringUserAction");
    if (v9) {
      id v10 = v9;
    }
    else {
      id v10 = v5;
    }
    (*(void (**)(void, void, id))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 0, v10);
  }
}

void __70__HDSummarySharingEntryIDSManager_leaveInvitationWithUUID_completion___block_invoke_357(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v4 = [*(id *)(a1 + 40) invitationUUID];
  id v5 = (void *)[v3 initWithUUIDString:v4];
  __int16 v25 = 0;
  if (v2)
  {
    char v6 = -[HDSummarySharingEntryIDSManager _queue_updateEntryWithInvitationUUID:newStatus:dateAccepted:ownerParticipant:error:](v2, v5, 2, 0, 0, (uint64_t)&v25);
    char v7 = v25;
  }
  else
  {
    char v7 = 0;
    char v6 = 0;
  }
  id v8 = v7;

  if (v6)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(a1 + 48);
    id v24 = 0;
    char v11 = -[HDSummarySharingEntryIDSManager _deleteProfile:errorOut:](v9, v10, (uint64_t)&v24);
    id v12 = v24;
    if ((v11 & 1) == 0)
    {
      _HKInitializeLogging();
      id v13 = HKLogSharing();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        __int16 v21 = [*(id *)(a1 + 48) profileIdentifier];
        __int16 v22 = [v21 identifier];
        uint64_t v23 = [v22 UUIDString];
        *(_DWORD *)buf = 138543874;
        uint64_t v27 = v20;
        __int16 v28 = 2114;
        id v29 = v23;
        __int16 v30 = 2114;
        id v31 = v12;
        _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to delete shared profile with identifier %{public}@. %{public}@", buf, 0x20u);
      }
    }
    -[HDSummarySharingEntryIDSManager _attemptBestEffortCloudSynchronization](*(void *)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    id v14 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      id v15 = *(void **)(a1 + 40);
      id v17 = v14;
      uint64_t v18 = [v15 primaryContactIdentifier];
      __int16 v19 = [*(id *)(a1 + 40) uuid];
      *(_DWORD *)buf = 138544131;
      uint64_t v27 = v16;
      __int16 v28 = 2113;
      id v29 = v18;
      __int16 v30 = 2114;
      id v31 = v19;
      __int16 v32 = 2114;
      id v33 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Error updating entry with identifier %{private}@ and UUID %{public}@. %{public}@", buf, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __137__HDSummarySharingEntryIDSManager__setupSharingWithOutgoingCodableSummarySharingEntry_sharingAuthorizations_localAccountInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    id v11 = 0;
    uint64_t v9 = [a2 codableSharingSetupMetadataWithError:&v11];
    id v10 = v11;
    if (v9) {
      [*(id *)(a1 + 32) setSharingSetupMetadata:v9];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __73__HDSummarySharingEntryIDSManager__attemptBestEffortCloudSynchronization__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    char v6 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to synchronize with error %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __56__HDSummarySharingEntryIDSManager__attemptPushSummaries__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  char v6 = *MEMORY[0x1E4F29FA8];
  uint64_t v7 = *MEMORY[0x1E4F29FA8];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138543362;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Pushed summaries succeeded after invite completion", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138543618;
    uint64_t v11 = v9;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to push summaries after invite completion with error %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

void __73__HDSummarySharingEntryIDSManager__finishHandlerForOperation_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = objc_msgSend(v5, "hd_errorForAnalytics");
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  uint64_t v8 = [WeakRetained daemon];
  uint64_t v9 = [v8 analyticsSubmissionCoordinator];
  objc_msgSend(v9, "summarySharing_reportSetupOperation:success:error:", a1[5], a2, v6);

  if ((a2 & 1) == 0)
  {
    uint64_t v10 = a1[4];
    id v11 = v6;
    __int16 v12 = v11;
    if (v10 && objc_msgSend(v11, "hk_isHealthKitError"))
    {
      if ([v12 code] == 3)
      {
      }
      else
      {
        uint64_t v13 = [v12 code];

        if (v13 != 1600) {
          goto LABEL_11;
        }
      }
      _HKInitializeLogging();
      uint64_t v14 = HKLogSharing();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = a1[4];
        uint64_t v19 = a1[5];
        int v20 = 138543874;
        uint64_t v21 = v18;
        __int16 v22 = 2114;
        uint64_t v23 = v19;
        __int16 v24 = 2114;
        __int16 v25 = v12;
        _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Setup operation %{public}@ failed with error %{public}@", (uint8_t *)&v20, 0x20u);
      }

      id v15 = objc_loadWeakRetained((id *)(a1[4] + 8));
      uint64_t v16 = [v15 daemon];
      id v17 = [v16 autoBugCaptureReporter];
      [v17 reportSummarySharingInvitationFailureForOperation:a1[5] error:v12];
    }
    else
    {
    }
  }
LABEL_11:
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)invitationManager:(id)a3 didReceiveInvitation:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  char v6 = [v5 codableObject];
  _HKInitializeLogging();
  uint64_t v7 = HKLogSharing();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 uuid];
    uint64_t v9 = [v5 UUID];
    uint64_t v10 = [v9 UUIDString];
    id v11 = [v6 primaryContactIdentifier];
    *(_DWORD *)buf = 138544131;
    int v20 = self;
    __int16 v21 = 2114;
    __int16 v22 = v8;
    __int16 v23 = 2114;
    __int16 v24 = v10;
    __int16 v25 = 2113;
    uint64_t v26 = v11;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Received invitation with UUID %{public}@, invitation UUID %{public}@ and identifier %{private}@.", buf, 0x2Au);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__HDSummarySharingEntryIDSManager_invitationManager_didReceiveInvitation___block_invoke;
  block[3] = &unk_1E62F30F8;
  id v16 = v6;
  id v17 = v5;
  uint64_t v18 = self;
  id v13 = v5;
  id v14 = v6;
  dispatch_sync(queue, block);
}

void __74__HDSummarySharingEntryIDSManager_invitationManager_didReceiveInvitation___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) sharingAuthorizationsCount];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = [v3 sharingAuthorizations];
    HDSharingAuthorizationsFromCodableSharingAuthorizations(v4);
  }
  else
  {
    uint64_t v4 = [v3 authorizationCategories];
    objc_msgSend(v4, "hk_map:", &__block_literal_global_367_0);
  uint64_t v26 = };

  id v5 = [HDCodableSummarySharingEntry alloc];
  id v6 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v7 = [*(id *)(a1 + 32) uuid];
  uint64_t v8 = (void *)[v6 initWithUUIDString:v7];
  uint64_t v9 = [*(id *)(a1 + 40) UUID];
  uint64_t v10 = [*(id *)(a1 + 40) fromID];
  id v11 = [*(id *)(a1 + 32) allContactIdentifiers];
  uint64_t v12 = (int)[*(id *)(a1 + 32) userWheelchairMode];
  id v13 = [MEMORY[0x1E4F1C9C8] date];
  id v14 = [*(id *)(a1 + 32) sharingSetupMetadata];
  id v15 = -[HDCodableSummarySharingEntry initWithUUID:invitationUUID:cloudKitIdentifier:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:sharingAuthorizations:userWheelchairMode:type:direction:status:notificationStatus:dateModified:dateInvited:dateAccepted:setupMetadata:ownerParticipant:](v5, "initWithUUID:invitationUUID:cloudKitIdentifier:primaryContactIdentifier:allContactIdentifiers:firstName:lastName:sharingAuthorizations:userWheelchairMode:type:direction:status:notificationStatus:dateModified:dateInvited:dateAccepted:setupMetadata:ownerParticipant:", v8, v9, 0, v10, v11, 0, 0, v26, v12, 0, 1, 0, 0, 0, v13,
          0,
          v14,
          0);

  id v16 = objc_msgSend(MEMORY[0x1E4F1B980], "hd_contactStoreWithHealthAppIdentity");
  id v17 = HDCNContactForCodableEntry(v15, v16);
  uint64_t v18 = v17;
  if (v17)
  {
    uint64_t v19 = [v17 givenName];
    [(HDCodableSummarySharingEntry *)v15 setFirstName:v19];

    int v20 = [v18 familyName];
    [(HDCodableSummarySharingEntry *)v15 setLastName:v20];
  }
  uint64_t v21 = *(void *)(a1 + 48);
  id v27 = 0;
  char v22 = -[HDSummarySharingEntryIDSManager _queue_insertOrReplaceCodableEntry:ignoreIfExists:shouldResolveCNContact:error:](v21, v15, 1, 1, (uint64_t)&v27);
  id v23 = v27;
  if ((v22 & 1) == 0)
  {
    _HKInitializeLogging();
    __int16 v24 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v25;
      __int16 v30 = 2114;
      id v31 = v23;
      _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Sharing invitation received but failed to insert HDCodableSummarySharingEntry with error %{public}@", buf, 0x16u);
    }
  }
  -[HDSummarySharingEntryIDSManager _attemptBestEffortCloudSynchronization](*(void *)(a1 + 48));
}

id __74__HDSummarySharingEntryIDSManager_invitationManager_didReceiveInvitation___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F2B4D8];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithAuthorizationIdentifier:v3];

  return v4;
}

- (void)invitationManager:(id)a3 didRescindInvitation:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 codableObject];
  _HKInitializeLogging();
  uint64_t v7 = HKLogSharing();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 uuid];
    uint64_t v9 = [v5 UUID];
    uint64_t v10 = [v9 UUIDString];
    id v11 = [v6 primaryContactIdentifier];
    *(_DWORD *)buf = 138544131;
    uint64_t v19 = self;
    __int16 v20 = 2114;
    uint64_t v21 = v8;
    __int16 v22 = 2114;
    id v23 = v10;
    __int16 v24 = 2113;
    uint64_t v25 = v11;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Received rescind invitation with UUID %{public}@, invitation UUID %{public}@ and identifier %{private}@.", buf, 0x2Au);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__HDSummarySharingEntryIDSManager_invitationManager_didRescindInvitation___block_invoke;
  block[3] = &unk_1E62F30F8;
  void block[4] = self;
  id v16 = v5;
  id v17 = v6;
  id v13 = v6;
  id v14 = v5;
  dispatch_sync(queue, block);
}

void __74__HDSummarySharingEntryIDSManager_invitationManager_didRescindInvitation___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) UUID];
  uint64_t v4 = v3;
  id v14 = 0;
  if (v2)
  {
    char v5 = -[HDSummarySharingEntryIDSManager _queue_updateEntryWithInvitationUUID:newStatus:dateAccepted:ownerParticipant:error:]((uint64_t)v2, v3, 3, 0, 0, (uint64_t)&v14);
    id v2 = v14;

    if (v5)
    {
      -[HDSummarySharingEntryIDSManager _attemptBestEffortCloudSynchronization](*(void *)(a1 + 32));
      goto LABEL_7;
    }
  }
  else
  {
  }
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(a1 + 48);
    uint64_t v9 = v6;
    uint64_t v10 = [v8 primaryContactIdentifier];
    id v11 = [*(id *)(a1 + 48) uuid];
    uint64_t v12 = [*(id *)(a1 + 40) UUID];
    id v13 = [v12 UUIDString];
    *(_DWORD *)buf = 138544387;
    uint64_t v16 = v7;
    __int16 v17 = 2113;
    uint64_t v18 = v10;
    __int16 v19 = 2114;
    __int16 v20 = v11;
    __int16 v21 = 2114;
    __int16 v22 = v13;
    __int16 v23 = 2114;
    id v24 = v2;
    _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Sharing entry rescind received but failed to update database for identifier %{private}@, UUID %{public}@ and invitation UUID %{public}@ with error %{public}@", buf, 0x34u);
  }
LABEL_7:
}

- (void)invitationManager:(id)a3 didAcceptInvitation:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 codableObject];
  _HKInitializeLogging();
  uint64_t v7 = HKLogSharing();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 uuid];
    uint64_t v9 = [v5 UUID];
    uint64_t v10 = [v9 UUIDString];
    id v11 = [v6 primaryContactIdentifier];
    *(_DWORD *)buf = 138544131;
    __int16 v19 = self;
    __int16 v20 = 2114;
    __int16 v21 = v8;
    __int16 v22 = 2114;
    __int16 v23 = v10;
    __int16 v24 = 2113;
    uint64_t v25 = v11;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Received accept invitation with UUID %{public}@, invitation UUID %{public}@ and identifier %{private}@.", buf, 0x2Au);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__HDSummarySharingEntryIDSManager_invitationManager_didAcceptInvitation___block_invoke;
  block[3] = &unk_1E62F30F8;
  void block[4] = self;
  id v16 = v5;
  id v17 = v6;
  id v13 = v6;
  id v14 = v5;
  dispatch_sync(queue, block);
}

void __73__HDSummarySharingEntryIDSManager_invitationManager_didAcceptInvitation___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) UUID];
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9C8];
  [*(id *)(a1 + 48) dateAccepted];
  id v5 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  id v16 = 0;
  char v6 = -[HDSummarySharingEntryIDSManager _queue_updateEntryWithInvitationUUID:newStatus:dateAccepted:ownerParticipant:error:](v2, v3, 1, v5, 0, (uint64_t)&v16);
  id v7 = v16;

  if (v6)
  {
    -[HDSummarySharingEntryIDSManager _attemptBestEffortCloudSynchronization](*(void *)(a1 + 32));
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v8 = (void *)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void **)(a1 + 48);
      id v11 = v8;
      uint64_t v12 = [v10 primaryContactIdentifier];
      id v13 = [*(id *)(a1 + 48) uuid];
      id v14 = [*(id *)(a1 + 40) UUID];
      id v15 = [v14 UUIDString];
      *(_DWORD *)buf = 138544387;
      uint64_t v18 = v9;
      __int16 v19 = 2113;
      __int16 v20 = v12;
      __int16 v21 = 2114;
      __int16 v22 = v13;
      __int16 v23 = 2114;
      __int16 v24 = v15;
      __int16 v25 = 2114;
      id v26 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Sharing entry accepted received but failed to update database for identifier %{private}@, UUID %{public}@ and invitation UUID %{public}@ with error %{public}@", buf, 0x34u);
    }
  }
}

- (void)invitationManager:(id)a3 didDeclineInvitation:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  char v6 = [v5 codableObject];
  _HKInitializeLogging();
  id v7 = HKLogSharing();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v6 uuid];
    uint64_t v9 = [v5 UUID];
    uint64_t v10 = [v9 UUIDString];
    id v11 = [v6 primaryContactIdentifier];
    *(_DWORD *)buf = 138544131;
    __int16 v19 = self;
    __int16 v20 = 2114;
    __int16 v21 = v8;
    __int16 v22 = 2114;
    __int16 v23 = v10;
    __int16 v24 = 2113;
    __int16 v25 = v11;
    _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Received decline invitation with UUID %{public}@, invitation UUID %{public}@ and identifier %{private}@.", buf, 0x2Au);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__HDSummarySharingEntryIDSManager_invitationManager_didDeclineInvitation___block_invoke;
  block[3] = &unk_1E62F30F8;
  void block[4] = self;
  id v16 = v5;
  id v17 = v6;
  id v13 = v6;
  id v14 = v5;
  dispatch_sync(queue, block);
}

void __74__HDSummarySharingEntryIDSManager_invitationManager_didDeclineInvitation___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) UUID];
  uint64_t v4 = v3;
  id v14 = 0;
  if (v2)
  {
    char v5 = -[HDSummarySharingEntryIDSManager _queue_updateEntryWithInvitationUUID:newStatus:dateAccepted:ownerParticipant:error:]((uint64_t)v2, v3, 2, 0, 0, (uint64_t)&v14);
    id v2 = v14;

    if (v5)
    {
      -[HDSummarySharingEntryIDSManager _attemptBestEffortCloudSynchronization](*(void *)(a1 + 32));
      goto LABEL_7;
    }
  }
  else
  {
  }
  _HKInitializeLogging();
  char v6 = (void *)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(a1 + 48);
    uint64_t v9 = v6;
    uint64_t v10 = [v8 primaryContactIdentifier];
    id v11 = [*(id *)(a1 + 48) uuid];
    uint64_t v12 = [*(id *)(a1 + 40) UUID];
    id v13 = [v12 UUIDString];
    *(_DWORD *)buf = 138544387;
    uint64_t v16 = v7;
    __int16 v17 = 2113;
    uint64_t v18 = v10;
    __int16 v19 = 2114;
    __int16 v20 = v11;
    __int16 v21 = 2114;
    __int16 v22 = v13;
    __int16 v23 = 2114;
    id v24 = v2;
    _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Sharing entry declined received but failed to update database for identifier %{private}@, UUID %{public}@ and invitation UUID %{public}@ with error %{public}@", buf, 0x34u);
  }
LABEL_7:
}

- (HDIDSInvitationManager)invitationManager
{
  return self->_invitationManager;
}

- (void)setInvitationManager:(id)a3
{
}

- (HKObserverSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_invitationManager, 0);
  objc_storeStrong((id *)&self->_reachabilityOperation, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_reachabilityQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end