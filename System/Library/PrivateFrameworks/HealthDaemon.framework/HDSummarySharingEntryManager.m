@interface HDSummarySharingEntryManager
- (BOOL)deleteEntryWithUUID:(id)a3 error:(id *)a4;
- (BOOL)disableAllSharingEntriesWithError:(id *)a3;
- (BOOL)enumerateCodableEntriesWithPredicate:(id)a3 error:(id *)a4 handler:(id)a5;
- (BOOL)insertOrReplaceCodableEntries:(id)a3 ignoreIfExists:(BOOL)a4 shouldResolveCNContact:(BOOL)a5 syncProvenance:(int64_t)a6 error:(id *)a7;
- (BOOL)insertOrReplaceCodableEntries:(id)a3 shouldResolveCNContact:(BOOL)a4 error:(id *)a5;
- (BOOL)lookupEntryWithPredicate:(id)a3 wasFound:(BOOL *)a4 error:(id *)a5;
- (BOOL)pauseActiveEntriesWithError:(id *)a3;
- (BOOL)pauseStatusForEntryWithUUID:(id)a3 error:(id *)a4;
- (BOOL)resolveContactsIfNeededWithError:(id *)a3;
- (BOOL)updateEntryWithInvitationUUID:(id)a3 newNotificationStatus:(int64_t)a4 error:(id *)a5;
- (BOOL)updateEntryWithInvitationUUID:(id)a3 newStatus:(int64_t)a4 dateAccepted:(id)a5 ownerParticipant:(id)a6 error:(id *)a7;
- (BOOL)updateEntryWithUUID:(id)a3 authorizationsToAdd:(id)a4 authorizationsToDelete:(id)a5 deleteOnCommit:(BOOL)a6 error:(id *)a7;
- (BOOL)updateEntryWithUUID:(id)a3 pauseStatus:(BOOL)a4 error:(id *)a5;
- (HDProfile)profile;
- (HDSummarySharingEntryManager)initWithProfile:(id)a3;
- (HDSummarySharingEntryManagerDelegate)delegate;
- (id)anyCodableEntryWithPredicate:(id)a3 errorOut:(id *)a4;
- (id)authorizationIdentifiersByContactIdentifiersForOutgoingPendingAndAcceptedParticipants:(id)a3 error:(id *)a4;
- (id)authorizationIdentifiersForEntriesNotPresentInSet:(id)a3 error:(id *)a4;
- (id)codableEntryWithIdentifier:(id)a3 type:(int64_t)a4 direction:(unint64_t)a5 errorOut:(id *)a6;
- (id)codableEntryWithUUID:(id)a3 errorOut:(id *)a4;
- (id)fetchAllCodableSharingEntriesWithError:(id *)a3;
- (id)fetchSharingEntriesWithError:(id *)a3;
- (uint64_t)_areNotificationsEnabledForFeature:(void *)a3 profileIdentifier:(void *)a4 coordinator:(void *)a5 error:;
- (uint64_t)_resolveContactsWithError:(uint64_t)a1;
- (void)_contactStoreDidChange;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)pauseStatusesForUUIDS:(id)a3 completion:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)removeObserver:(id)a3;
- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation HDSummarySharingEntryManager

- (HDSummarySharingEntryManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDSummarySharingEntryManager;
  v5 = [(HDSummarySharingEntryManager *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    id v7 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v8 = HKLogSharing();
    uint64_t v9 = [v7 initWithName:@"sharing-entry-observers" loggingCategory:v8];
    observerSet = v6->_observerSet;
    v6->_observerSet = (HKObserverSet *)v9;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    [WeakRetained registerProfileReadyObserver:v6 queue:0];

    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_hasCompletedContactResolution = 0;
    v6->_authorizationStatusWhenContactsResolved = 0;
  }

  return v6;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained daemon];
  v5 = [v4 analyticsSubmissionCoordinator];
  [v5 removeObserver:self];

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)HDSummarySharingEntryManager;
  [(HDSummarySharingEntryManager *)&v7 dealloc];
}

- (void)profileDidBecomeReady:(id)a3
{
  id v7 = a3;
  if ([v7 profileType] == 1)
  {
    id v4 = [v7 daemon];
    v5 = [v4 analyticsSubmissionCoordinator];
    [v5 addObserver:self queue:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel__contactStoreDidChange name:*MEMORY[0x1E4F1AF80] object:0];
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (BOOL)insertOrReplaceCodableEntries:(id)a3 shouldResolveCNContact:(BOOL)a4 error:(id *)a5
{
  return [(HDSummarySharingEntryManager *)self insertOrReplaceCodableEntries:a3 ignoreIfExists:0 shouldResolveCNContact:a4 syncProvenance:0 error:a5];
}

- (BOOL)insertOrReplaceCodableEntries:(id)a3 ignoreIfExists:(BOOL)a4 shouldResolveCNContact:(BOOL)a5 syncProvenance:(int64_t)a6 error:(id *)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  objc_super v13 = [[HDInsertCodableSummarySharingEntryOperation alloc] initWithCodableEntries:v12 ignoreIfExists:v10 provenance:a6 shouldResolveCNContact:v9];
  v14 = [(HDSummarySharingEntryManager *)self profile];
  BOOL v15 = [(HDJournalableOperation *)v13 performOrJournalWithProfile:v14 error:a7];

  if (v15)
  {
    if ([(HDJournalableOperation *)v13 didJournal])
    {
      _HKInitializeLogging();
      v16 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v24 = self;
        _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Successfully journaled sharing entries.", buf, 0xCu);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v18 = objc_msgSend(v12, "hk_map:", &__block_literal_global_74);
      [WeakRetained sharingEntryManager:self didJournalEntries:v18];
    }
    else
    {
      observerSet = self->_observerSet;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __121__HDSummarySharingEntryManager_insertOrReplaceCodableEntries_ignoreIfExists_shouldResolveCNContact_syncProvenance_error___block_invoke_2;
      v21[3] = &unk_1E62FCFE8;
      id v22 = v12;
      [(HKObserverSet *)observerSet notifyObservers:v21];
      id WeakRetained = v22;
    }
  }
  return v15;
}

uint64_t __121__HDSummarySharingEntryManager_insertOrReplaceCodableEntries_ignoreIfExists_shouldResolveCNContact_syncProvenance_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sharingEntry];
}

void __121__HDSummarySharingEntryManager_insertOrReplaceCodableEntries_ignoreIfExists_shouldResolveCNContact_syncProvenance_error___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v2, "hk_map:", &__block_literal_global_288);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 sharingEntriesDidUpdate:v4];
}

uint64_t __121__HDSummarySharingEntryManager_insertOrReplaceCodableEntries_ignoreIfExists_shouldResolveCNContact_syncProvenance_error___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 sharingEntry];
}

- (BOOL)updateEntryWithInvitationUUID:(id)a3 newStatus:(int64_t)a4 dateAccepted:(id)a5 ownerParticipant:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  BOOL v15 = [HDUpdateCodableSummarySharingEntryOperation alloc];
  v16 = [MEMORY[0x1E4F1C9C8] date];
  v17 = [(HDUpdateCodableSummarySharingEntryOperation *)v15 initWithInvitationUUID:v14 status:a4 dateModified:v16 dateAccepted:v13 ownerParticipant:v12];

  v18 = [(HDSummarySharingEntryManager *)self profile];
  BOOL v19 = [(HDJournalableOperation *)v17 performOrJournalWithProfile:v18 error:a7];

  if (![(HDJournalableOperation *)v17 didJournal])
  {
    v20 = [(HDUpdateCodableSummarySharingEntryOperation *)v17 sharingEntry];

    if (v20)
    {
      observerSet = self->_observerSet;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __108__HDSummarySharingEntryManager_updateEntryWithInvitationUUID_newStatus_dateAccepted_ownerParticipant_error___block_invoke;
      v23[3] = &unk_1E62FCFE8;
      v24 = v17;
      [(HKObserverSet *)observerSet notifyObservers:v23];
    }
  }

  return v19;
}

void __108__HDSummarySharingEntryManager_updateEntryWithInvitationUUID_newStatus_dateAccepted_ownerParticipant_error___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 sharingEntry];
  v6[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v3 sharingEntriesDidUpdate:v5];
}

- (BOOL)updateEntryWithInvitationUUID:(id)a3 newNotificationStatus:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  BOOL v9 = [HDSummarySharingEntryUpdateNotificationStatusOperation alloc];
  BOOL v10 = [MEMORY[0x1E4F1C9C8] date];
  v11 = [(HDSummarySharingEntryUpdateNotificationStatusOperation *)v9 initWithInvitationUUID:v8 notificationStatus:a4 dateModified:v10];

  id v12 = [(HDSummarySharingEntryManager *)self profile];
  BOOL v13 = [(HDJournalableOperation *)v11 performOrJournalWithProfile:v12 error:a5];

  if (![(HDJournalableOperation *)v11 didJournal])
  {
    id v14 = [(HDSummarySharingEntryUpdateNotificationStatusOperation *)v11 sharingEntry];

    if (v14)
    {
      observerSet = self->_observerSet;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __90__HDSummarySharingEntryManager_updateEntryWithInvitationUUID_newNotificationStatus_error___block_invoke;
      v17[3] = &unk_1E62FCFE8;
      v18 = v11;
      [(HKObserverSet *)observerSet notifyObservers:v17];
    }
  }

  return v13;
}

void __90__HDSummarySharingEntryManager_updateEntryWithInvitationUUID_newNotificationStatus_error___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 sharingEntry];
  v6[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v3 sharingEntriesDidUpdate:v5];
}

- (BOOL)updateEntryWithUUID:(id)a3 authorizationsToAdd:(id)a4 authorizationsToDelete:(id)a5 deleteOnCommit:(BOOL)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__70;
  v31[4] = __Block_byref_object_dispose__70;
  id v32 = 0;
  BOOL v15 = [(HDSummarySharingEntryManager *)self profile];
  v16 = [v15 database];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __116__HDSummarySharingEntryManager_updateEntryWithUUID_authorizationsToAdd_authorizationsToDelete_deleteOnCommit_error___block_invoke;
  v24[3] = &unk_1E62FD010;
  id v17 = v12;
  id v25 = v17;
  v26 = self;
  id v18 = v13;
  id v27 = v18;
  BOOL v30 = a6;
  id v19 = v14;
  id v28 = v19;
  v29 = v31;
  BOOL v20 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v16 error:a7 block:v24];

  if (v20)
  {
    observerSet = self->_observerSet;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __116__HDSummarySharingEntryManager_updateEntryWithUUID_authorizationsToAdd_authorizationsToDelete_deleteOnCommit_error___block_invoke_2;
    v23[3] = &unk_1E62FD038;
    void v23[4] = v31;
    [(HKObserverSet *)observerSet notifyObservers:v23];
  }

  _Block_object_dispose(v31, 8);
  return v20;
}

BOOL __116__HDSummarySharingEntryManager_updateEntryWithUUID_authorizationsToAdd_authorizationsToDelete_deleteOnCommit_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F2B500]) initForInvitationUUID:*(void *)(a1 + 32)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
  id v7 = [WeakRetained sharingAuthorizationManager];
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 48);
  if (*(unsigned char *)(a1 + 72)) {
    uint64_t v10 = MEMORY[0x1E4F1CBF0];
  }
  else {
    uint64_t v10 = *(void *)(a1 + 56);
  }
  id v37 = 0;
  char v11 = [v7 updateAuthorizationsForRecipientIdentifier:v5 sharingAuthorizationsToAdd:v9 sharingAuthorizationsToRemove:v10 error:&v37];
  id v12 = v37;

  if ((v11 & 1) == 0)
  {
    id v27 = v12;
    id v21 = v27;
    if (v27)
    {
      if (a3)
      {
        id v21 = v27;
        BOOL v28 = 0;
        *a3 = v21;
      }
      else
      {
        _HKLogDroppedError();
        BOOL v28 = 0;
      }
    }
    else
    {
      BOOL v28 = 1;
    }
    goto LABEL_28;
  }
  if (!*(unsigned char *)(a1 + 72)) {
    goto LABEL_8;
  }
  id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
  id v14 = [v13 sharingAuthorizationManager];
  uint64_t v15 = *(void *)(a1 + 56);
  id v36 = 0;
  int v16 = [v14 markSharingAuthorizationsForDeletion:v15 recipientIdentifier:v5 error:&v36];
  id v17 = v36;

  if (v16)
  {

LABEL_8:
    uint64_t v19 = *(void *)(a1 + 32);
    id v18 = *(void **)(a1 + 40);
    id v35 = 0;
    uint64_t v20 = [v18 codableEntryWithUUID:v19 errorOut:&v35];
    id v21 = v35;
    uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
    v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v20;

    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      v34 = a3;
      id v24 = [MEMORY[0x1E4F1C9C8] date];
      [v24 timeIntervalSinceReferenceDate];
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "setDateModified:");
      if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) hasDateAccepted])
      {
        id v25 = (void *)MEMORY[0x1E4F1C9C8];
        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) dateAccepted];
        v26 = objc_msgSend(v25, "dateWithTimeIntervalSinceReferenceDate:");
      }
      else
      {
        v26 = 0;
      }
      BOOL v30 = HDSummarySharingEntryPredicateForUUID(*(void *)(a1 + 32));
      uint64_t v31 = (int)[*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) status];
      id v32 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
      BOOL v28 = +[HDSummarySharingEntryEntity updateStatus:v31 dateModified:v24 dateAccepted:v26 predicate:v30 profile:v32 error:v34];
    }
    else
    {
      id v29 = v21;
      id v24 = v29;
      if (v29)
      {
        if (a3)
        {
          id v24 = v29;
          BOOL v28 = 0;
          *a3 = v24;
        }
        else
        {
          _HKLogDroppedError();
          BOOL v28 = 0;
        }
      }
      else
      {
        BOOL v28 = 1;
      }
    }

    goto LABEL_28;
  }
  id v21 = v17;
  BOOL v28 = v21 == 0;
  if (v21)
  {
    if (a3) {
      *a3 = v21;
    }
    else {
      _HKLogDroppedError();
    }
  }

LABEL_28:
  return v28;
}

void __116__HDSummarySharingEntryManager_updateEntryWithUUID_authorizationsToAdd_authorizationsToDelete_deleteOnCommit_error___block_invoke_2(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = a2;
  id v4 = [v2 sharingEntry];
  v6[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v3 sharingEntriesDidUpdate:v5];
}

- (BOOL)pauseActiveEntriesWithError:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__HDSummarySharingEntryManager_pauseActiveEntriesWithError___block_invoke;
  v13[3] = &unk_1E62FD060;
  id v7 = v5;
  id v14 = v7;
  BOOL v8 = +[HDSummarySharingEntryEntity enumerateCodableEntriesWithPredicate:0 profile:WeakRetained error:a3 handler:v13];

  if (v8 && [v7 count])
  {
    observerSet = self->_observerSet;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__HDSummarySharingEntryManager_pauseActiveEntriesWithError___block_invoke_2;
    v11[3] = &unk_1E62FCFE8;
    id v12 = v7;
    [(HKObserverSet *)observerSet notifyObservers:v11];
  }
  return v8;
}

uint64_t __60__HDSummarySharingEntryManager_pauseActiveEntriesWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 sharingEntry];
  if (![v3 direction] && (!objc_msgSend(v3, "status") || objc_msgSend(v3, "status") == 1))
  {
    id v4 = [v3 UUID];
    +[HDSummarySharingEntryEntity updatePauseStateForEntryWithUUID:v4 shouldPause:1];

    [v3 _setIsPaused:1];
    [*(id *)(a1 + 32) addObject:v3];
  }

  return 1;
}

uint64_t __60__HDSummarySharingEntryManager_pauseActiveEntriesWithError___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 sharingEntriesDidUpdate:*(void *)(a1 + 32)];
}

- (BOOL)updateEntryWithUUID:(id)a3 pauseStatus:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__70;
  id v27 = __Block_byref_object_dispose__70;
  id v28 = 0;
  uint64_t v9 = HDSummarySharingEntryPredicateForUUID((uint64_t)v8);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __70__HDSummarySharingEntryManager_updateEntryWithUUID_pauseStatus_error___block_invoke;
  v22[3] = &unk_1E62FD088;
  v22[4] = &v23;
  BOOL v11 = +[HDSummarySharingEntryEntity enumerateCodableEntriesWithPredicate:v9 profile:WeakRetained error:a5 handler:v22];

  if (v11)
  {
    id v12 = (void *)v24[5];
    if (v12)
    {
      if (![v12 direction]
        && (![(id)v24[5] status] || objc_msgSend((id)v24[5], "status") == 1))
      {
        id v18 = [(id)v24[5] UUID];
        +[HDSummarySharingEntryEntity updatePauseStateForEntryWithUUID:v18 shouldPause:v6];

        [(id)v24[5] _setIsPaused:v6];
        observerSet = self->_observerSet;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __70__HDSummarySharingEntryManager_updateEntryWithUUID_pauseStatus_error___block_invoke_2;
        v21[3] = &unk_1E62FD038;
        void v21[4] = &v23;
        [(HKObserverSet *)observerSet notifyObservers:v21];
        BOOL v16 = 1;
        goto LABEL_17;
      }
      id v13 = (void *)MEMORY[0x1E4F28C58];
      id v14 = [v8 UUIDString];
      objc_msgSend(v13, "hk_error:format:", 118, @"Invitation with UUID %@ is not active outgoing", v14);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        if (!a5) {
          goto LABEL_15;
        }
LABEL_10:
        id v15 = v15;
        BOOL v16 = 0;
        *a5 = v15;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      id v17 = (void *)MEMORY[0x1E4F28C58];
      id v14 = [v8 UUIDString];
      objc_msgSend(v17, "hk_error:format:", 118, @"Cannot find invitation with UUID %@", v14);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        if (!a5)
        {
LABEL_15:
          _HKLogDroppedError();
          BOOL v16 = 0;
          goto LABEL_16;
        }
        goto LABEL_10;
      }
    }
    BOOL v16 = 1;
    goto LABEL_16;
  }
  BOOL v16 = 0;
LABEL_17:
  _Block_object_dispose(&v23, 8);

  return v16;
}

uint64_t __70__HDSummarySharingEntryManager_updateEntryWithUUID_pauseStatus_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 sharingEntry];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

void __70__HDSummarySharingEntryManager_updateEntryWithUUID_pauseStatus_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  uint64_t v4 = [v2 arrayWithObjects:&v5 count:1];
  objc_msgSend(v3, "sharingEntriesDidUpdate:", v4, v5, v6);
}

- (void)pauseStatusesForUUIDS:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, id, id))a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
    uint64_t v14 = MEMORY[0x1E4F1CC28];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        [v9 setObject:v14 forKeyedSubscript:v16];
        id v17 = HDSummarySharingEntryPredicateForUUID(v16);
        [v8 addObject:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v12);
  }

  id v18 = [MEMORY[0x1E4F65D08] predicateMatchingAnyPredicates:v8];
  uint64_t v19 = [(HDSummarySharingEntryManager *)self profile];
  id v27 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __65__HDSummarySharingEntryManager_pauseStatusesForUUIDS_completion___block_invoke;
  v25[3] = &unk_1E62FD060;
  id v20 = v9;
  id v26 = v20;
  BOOL v21 = +[HDSummarySharingEntryEntity enumerateCodableEntriesWithPredicate:v18 profile:v19 error:&v27 handler:v25];
  id v22 = v27;

  if (v21)
  {
    id v23 = v20;
    id v24 = 0;
  }
  else
  {
    id v23 = 0;
    id v24 = v22;
  }
  v7[2](v7, v23, v24);
}

uint64_t __65__HDSummarySharingEntryManager_pauseStatusesForUUIDS_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [v4 codableEntry];
  id v7 = [v6 uuid];
  id v8 = (void *)[v5 initWithUUIDString:v7];

  LODWORD(v6) = [v4 isPaused];
  if (v6) {
    uint64_t v9 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v9 = MEMORY[0x1E4F1CC28];
  }
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v8];

  return 1;
}

- (BOOL)pauseStatusForEntryWithUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v7 = HDSummarySharingEntryPredicateForUUID((uint64_t)v6);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__HDSummarySharingEntryManager_pauseStatusForEntryWithUUID_error___block_invoke;
  v10[3] = &unk_1E62FD088;
  v10[4] = &v11;
  +[HDSummarySharingEntryEntity enumerateCodableEntriesWithPredicate:v7 profile:WeakRetained error:a4 handler:v10];

  LOBYTE(a4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)a4;
}

uint64_t __66__HDSummarySharingEntryManager_pauseStatusForEntryWithUUID_error___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 isPaused];
  return 1;
}

- (id)codableEntryWithIdentifier:(id)a3 type:(int64_t)a4 direction:(unint64_t)a5 errorOut:(id *)a6
{
  id v8 = HDSummarySharingEntryPredicateForIdentifierTypeAndDirection((uint64_t)a3, a4, a5);
  uint64_t v9 = [(HDSummarySharingEntryManager *)self profile];
  id v10 = [v9 sharingEntryManager];
  uint64_t v11 = [v10 anyCodableEntryWithPredicate:v8 errorOut:a6];

  return v11;
}

- (id)codableEntryWithUUID:(id)a3 errorOut:(id *)a4
{
  id v6 = HDSummarySharingEntryPredicateForUUID((uint64_t)a3);
  id v7 = [(HDSummarySharingEntryManager *)self anyCodableEntryWithPredicate:v6 errorOut:a4];

  return v7;
}

- (id)anyCodableEntryWithPredicate:(id)a3 errorOut:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__70;
  BOOL v21 = __Block_byref_object_dispose__70;
  id v22 = 0;
  id v7 = [(HDSummarySharingEntryManager *)self profile];
  id v8 = [v7 sharingEntryManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__HDSummarySharingEntryManager_anyCodableEntryWithPredicate_errorOut___block_invoke;
  v16[3] = &unk_1E62FD088;
  v16[4] = &v17;
  char v9 = [v8 enumerateCodableEntriesWithPredicate:v6 error:a4 handler:v16];

  if (v9)
  {
    id v10 = (void *)v18[5];
    if (v10)
    {
      id v11 = v10;
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 118, @"We found no entries in the database.");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    char v14 = v13;
    if (v13)
    {
      if (a4) {
        *a4 = v13;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v12 = HKLogSharing();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v24 = self;
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error retrieving entry with predicate %{public}@.", buf, 0x16u);
    }
  }
  id v11 = 0;
LABEL_13:
  _Block_object_dispose(&v17, 8);

  return v11;
}

uint64_t __70__HDSummarySharingEntryManager_anyCodableEntryWithPredicate_errorOut___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 codableEntry];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

- (BOOL)deleteEntryWithUUID:(id)a3 error:(id *)a4
{
  id v6 = HDSummarySharingEntryPredicateForUUID((uint64_t)a3);
  id v7 = [(HDSummarySharingEntryManager *)self profile];
  id v8 = [v7 database];
  LOBYTE(a4) = +[HDHealthEntity deleteEntitiesWithPredicate:v6 healthDatabase:v8 error:a4];

  return (char)a4;
}

- (id)fetchAllCodableSharingEntriesWithError:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__HDSummarySharingEntryManager_fetchAllCodableSharingEntriesWithError___block_invoke;
  v10[3] = &unk_1E62FD060;
  id v11 = v5;
  id v6 = v5;
  if ([(HDSummarySharingEntryManager *)self enumerateCodableEntriesWithPredicate:0 error:a3 handler:v10])
  {
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

uint64_t __71__HDSummarySharingEntryManager_fetchAllCodableSharingEntriesWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 codableEntry];
  [v2 addObject:v3];

  return 1;
}

- (BOOL)enumerateCodableEntriesWithPredicate:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HDSummarySharingEntryManager *)self profile];
  id v11 = [v10 database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__HDSummarySharingEntryManager_enumerateCodableEntriesWithPredicate_error_handler___block_invoke;
  v15[3] = &unk_1E62F8050;
  id v16 = v8;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  LOBYTE(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v11 error:a4 block:v15];

  return (char)a4;
}

BOOL __83__HDSummarySharingEntryManager_enumerateCodableEntriesWithPredicate_error_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__HDSummarySharingEntryManager_enumerateCodableEntriesWithPredicate_error_handler___block_invoke_2;
  v10[3] = &unk_1E62FD0B0;
  id v11 = v5;
  uint64_t v6 = *(void *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v7 = v5;
  BOOL v8 = +[HDSummarySharingEntryEntity enumerateCodableEntriesWithPredicate:v6 transaction:v7 error:a3 handler:v10];

  return v8;
}

uint64_t __83__HDSummarySharingEntryManager_enumerateCodableEntriesWithPredicate_error_handler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 codableEntry];
  id v7 = [v6 sharingRecipientIdentifier];
  BOOL v8 = +[HDSharingAuthorizationsEntity sharingAuthorizationsForRecipientIdentifier:v7 databaseTransaction:*(void *)(a1 + 32) error:a3];

  if (v8)
  {
    id v9 = HDCodableSharingAuthorizationsFromSharingAuthorizations(v8);
    id v10 = [v5 codableEntry];
    [v10 setSharingAuthorizations:v9];

    id v11 = [v5 codableEntry];
    id v12 = [v11 sharingAuthorizations];
    id v13 = HDAuthorizationIdentifiersFromCodableSharingAuthorizations(v12);
    char v14 = [v5 codableEntry];
    [v14 setAuthorizationCategories:v13];

    uint64_t v15 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (BOOL)disableAllSharingEntriesWithError:(id *)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v5 = HDSummarySharingEntryPredicateForTypeAndStatus(0, 0);
  uint64_t v6 = HDSummarySharingEntryPredicateForTypeAndStatus(0, 1);
  id v7 = (void *)MEMORY[0x1E4F65D08];
  v21[0] = v5;
  v21[1] = v6;
  BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  id v9 = [v7 predicateMatchingAnyPredicates:v8];

  _HKInitializeLogging();
  id v10 = HKLogSharing();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = (id)objc_opt_class();
    id v11 = v20;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Disabling all sharing entries", buf, 0xCu);
  }
  id v12 = [(HDSummarySharingEntryManager *)self profile];
  id v13 = [v12 database];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__HDSummarySharingEntryManager_disableAllSharingEntriesWithError___block_invoke;
  v17[3] = &unk_1E62F2AE0;
  void v17[4] = self;
  id v18 = v9;
  id v14 = v9;
  BOOL v15 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v13 error:a3 block:v17];

  return v15;
}

uint64_t __66__HDSummarySharingEntryManager_disableAllSharingEntriesWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__HDSummarySharingEntryManager_disableAllSharingEntriesWithError___block_invoke_2;
  v7[3] = &unk_1E62FD060;
  v7[4] = v5;
  return [v5 enumerateCodableEntriesWithPredicate:v4 error:a3 handler:v7];
}

BOOL __66__HDSummarySharingEntryManager_disableAllSharingEntriesWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 codableEntry];
  id v7 = [v6 sharingEntry];

  id v8 = objc_alloc(MEMORY[0x1E4F29128]);
  id v9 = [v5 codableEntry];

  id v10 = [v9 invitationUUID];
  id v11 = (void *)[v8 initWithUUIDString:v10];

  if ([v7 direction] || objc_msgSend(v7, "status") != 1)
  {
    if ([v7 direction] || objc_msgSend(v7, "status"))
    {
      if ([v7 direction] == 1 && !objc_msgSend(v7, "status"))
      {
        id v17 = *(void **)(a1 + 32);
        id v23 = 0;
        char v13 = [v17 updateEntryWithInvitationUUID:v11 newStatus:2 dateAccepted:0 ownerParticipant:0 error:&v23];
        id v14 = v23;
      }
      else
      {
        if ([v7 direction] != 1 || objc_msgSend(v7, "status") != 1)
        {
          id v16 = 0;
LABEL_15:
          BOOL v20 = 1;
          goto LABEL_21;
        }
        BOOL v15 = *(void **)(a1 + 32);
        id v22 = 0;
        char v13 = [v15 updateEntryWithInvitationUUID:v11 newStatus:2 dateAccepted:0 ownerParticipant:0 error:&v22];
        id v14 = v22;
      }
    }
    else
    {
      id v18 = *(void **)(a1 + 32);
      id v24 = 0;
      char v13 = [v18 updateEntryWithInvitationUUID:v11 newStatus:3 dateAccepted:0 ownerParticipant:0 error:&v24];
      id v14 = v24;
    }
  }
  else
  {
    id v12 = *(void **)(a1 + 32);
    __int16 v25 = 0;
    char v13 = [v12 updateEntryWithInvitationUUID:v11 newStatus:4 dateAccepted:0 ownerParticipant:0 error:&v25];
    id v14 = v25;
  }
  id v19 = v14;
  id v16 = v19;
  if (v13) {
    goto LABEL_15;
  }
  id v16 = v19;
  BOOL v20 = v16 == 0;
  if (v16)
  {
    if (a3) {
      *a3 = v16;
    }
    else {
      _HKLogDroppedError();
    }
  }

LABEL_21:
  return v20;
}

- (BOOL)lookupEntryWithPredicate:(id)a3 wasFound:(BOOL *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__HDSummarySharingEntryManager_lookupEntryWithPredicate_wasFound_error___block_invoke;
  v10[3] = &unk_1E62FD088;
  void v10[4] = &v11;
  LOBYTE(a5) = [(HDSummarySharingEntryManager *)self enumerateCodableEntriesWithPredicate:v8 error:a5 handler:v10];
  *a4 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)a5;
}

uint64_t __72__HDSummarySharingEntryManager_lookupEntryWithPredicate_wasFound_error___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 1;
}

- (id)authorizationIdentifiersForEntriesNotPresentInSet:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__HDSummarySharingEntryManager_authorizationIdentifiersForEntriesNotPresentInSet_error___block_invoke;
  v13[3] = &unk_1E62FD0D8;
  id v14 = v6;
  BOOL v15 = self;
  id v8 = v7;
  id v16 = v8;
  id v9 = v6;
  BOOL v10 = [(HDSummarySharingEntryManager *)self enumerateCodableEntriesWithPredicate:0 error:a4 handler:v13];
  if (!a4 || (id v11 = 0, v10)) {
    id v11 = v8;
  }

  return v11;
}

uint64_t __88__HDSummarySharingEntryManager_authorizationIdentifiersForEntriesNotPresentInSet_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = objc_alloc(MEMORY[0x1E4F29128]);
  id v7 = [v5 codableEntry];
  id v8 = [v7 uuid];
  id v9 = (void *)[v6 initWithUUIDString:v8];

  if (([*(id *)(a1 + 32) containsObject:v9] & 1) == 0)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F2B500]);
    id v11 = objc_alloc(MEMORY[0x1E4F29128]);
    id v12 = [v5 codableEntry];
    uint64_t v13 = [v12 uuid];
    id v14 = (void *)[v11 initWithUUIDString:v13];
    BOOL v15 = (void *)[v10 initForInvitationUUID:v14];

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 40));
    id v17 = [WeakRetained sharingAuthorizationManager];
    id v18 = [v17 sharingAuthorizationsForRecipientIdentifier:v15 error:a3];

    id v19 = HKAuthorizationIdentifiersFromSharingAuthorizations();
    BOOL v20 = *(void **)(a1 + 48);
    BOOL v21 = [v5 codableEntry];
    [v20 setObject:v19 forKeyedSubscript:v21];
  }
  return 1;
}

- (id)authorizationIdentifiersByContactIdentifiersForOutgoingPendingAndAcceptedParticipants:(id)a3 error:(id *)a4
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = HDSummarySharingEntryPredicateForTypeStatusAndDirection(0, 0, 0);
  id v9 = HDSummarySharingEntryPredicateForTypeStatusAndDirection(0, 1, 0);
  id v10 = (void *)MEMORY[0x1E4F65D08];
  v25[0] = v8;
  v25[1] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  id v12 = [v10 predicateMatchingAnyPredicates:v11];

  uint64_t v13 = [(HDSummarySharingEntryManager *)self profile];
  id v14 = [v13 database];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __124__HDSummarySharingEntryManager_authorizationIdentifiersByContactIdentifiersForOutgoingPendingAndAcceptedParticipants_error___block_invoke;
  void v21[3] = &unk_1E62FB0D0;
  void v21[4] = self;
  id v22 = v12;
  id v23 = v6;
  id v15 = v7;
  id v24 = v15;
  id v16 = v6;
  id v17 = v12;
  BOOL v18 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v14 error:a4 block:v21];

  if (!a4 || (id v19 = 0, v18)) {
    id v19 = v15;
  }

  return v19;
}

uint64_t __124__HDSummarySharingEntryManager_authorizationIdentifiersByContactIdentifiersForOutgoingPendingAndAcceptedParticipants_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __124__HDSummarySharingEntryManager_authorizationIdentifiersByContactIdentifiersForOutgoingPendingAndAcceptedParticipants_error___block_invoke_2;
  v11[3] = &unk_1E62FD0D8;
  id v12 = *(id *)(a1 + 48);
  id v13 = v5;
  id v14 = *(id *)(a1 + 56);
  id v8 = v5;
  uint64_t v9 = [v6 enumerateCodableEntriesWithPredicate:v7 error:a3 handler:v11];

  return v9;
}

BOOL __124__HDSummarySharingEntryManager_authorizationIdentifiersByContactIdentifiersForOutgoingPendingAndAcceptedParticipants_error___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (void *)a1[4];
  uint64_t v7 = [v5 codableEntry];
  id v8 = [v7 primaryContactIdentifier];
  LODWORD(v6) = [v6 containsObject:v8];

  if (v6)
  {
    uint64_t v9 = [v5 codableEntry];
    id v10 = [v9 sharingRecipientIdentifier];
    uint64_t v11 = a1[5];
    id v20 = 0;
    id v12 = +[HDSharingAuthorizationsEntity sharingAuthorizationsForRecipientIdentifier:v10 databaseTransaction:v11 includeMarkedForDeletion:1 error:&v20];
    id v13 = v20;

    if (v12)
    {
      id v14 = HKAuthorizationIdentifiersFromSharingAuthorizations();
      id v15 = (void *)a1[6];
      id v16 = [v5 codableEntry];
      id v17 = [v16 primaryContactIdentifier];
      [v15 setObject:v14 forKeyedSubscript:v17];

      BOOL v18 = 1;
    }
    else
    {
      id v12 = v13;
      BOOL v18 = v12 == 0;
      if (v12)
      {
        if (a3) {
          *a3 = v12;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

- (BOOL)resolveContactsIfNeededWithError:(id *)a3
{
  if (!self) {
    return 1;
  }
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1B980], "hd_authorizationStatusForHealthApp");
  os_unfair_lock_lock(&self->_lock);
  if (self->_hasCompletedContactResolution)
  {
    int64_t authorizationStatusWhenContactsResolved = self->_authorizationStatusWhenContactsResolved;
    os_unfair_lock_unlock(&self->_lock);
    if (authorizationStatusWhenContactsResolved == v5) {
      return 1;
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

  return -[HDSummarySharingEntryManager _resolveContactsWithError:]((uint64_t)self, (uint64_t)a3);
}

- (uint64_t)_resolveContactsWithError:(uint64_t)a1
{
  v32[2] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  _HKInitializeLogging();
  uint64_t v4 = HKLogSharing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = a1;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Attempting to resolve contacts.", buf, 0xCu);
  }

  uint64_t v5 = HDSummarySharingEntryPredicateForTypeAndStatus(0, 0);
  id v6 = HDSummarySharingEntryPredicateForTypeAndStatus(0, 1);
  uint64_t v7 = (void *)MEMORY[0x1E4F65D08];
  v32[0] = v5;
  v32[1] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  uint64_t v9 = [v7 predicateMatchingAnyPredicates:v8];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1B980], "hd_contactStoreWithHealthAppIdentity");
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __58__HDSummarySharingEntryManager__resolveContactsWithError___block_invoke;
  __int16 v25 = &unk_1E62FD100;
  id v12 = v11;
  id v26 = v12;
  id v13 = v10;
  id v27 = v13;
  if (![(id)a1 enumerateCodableEntriesWithPredicate:v9 error:a2 handler:&v22]) {
    goto LABEL_11;
  }
  if (objc_msgSend(v13, "count", v22, v23, v24, v25, v26))
  {
    _HKInitializeLogging();
    id v14 = HKLogSharing();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v13 count];
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = a1;
      __int16 v30 = 2048;
      uint64_t v31 = v15;
      _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Updating %lu entries.", buf, 0x16u);
    }

    if ([(id)a1 insertOrReplaceCodableEntries:v13 shouldResolveCNContact:1 error:a2])
    {
      id v16 = [(id)a1 profile];
      id v17 = [v16 daemon];
      BOOL v18 = [v17 profileManager];
      [v18 dispatchProfileListDidChange];

      goto LABEL_10;
    }
LABEL_11:
    uint64_t v20 = 0;
    goto LABEL_12;
  }
LABEL_10:
  uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1B980], "hd_authorizationStatusForHealthApp");
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  uint64_t v20 = 1;
  *(unsigned char *)(a1 + 20) = 1;
  *(void *)(a1 + 24) = v19;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
LABEL_12:

  return v20;
}

uint64_t __58__HDSummarySharingEntryManager__resolveContactsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 codableEntry];
  uint64_t v5 = HDCNContactForCodableEntry(v4, *(void **)(a1 + 32));

  id v6 = [v3 codableEntry];
  uint64_t v7 = (void *)[v6 copy];

  id v8 = [v3 CNContactIdentifier];
  uint64_t v9 = v8;
  if (v5)
  {
    if (!v8) {
      goto LABEL_4;
    }
    id v10 = [v3 codableEntry];
    uint64_t v11 = [v5 givenName];
    id v12 = [v5 familyName];
    char v13 = [v10 isEqualFirstName:v11 lastName:v12];

    if ((v13 & 1) == 0)
    {
LABEL_4:
      id v14 = [v5 givenName];
      [v7 setFirstName:v14];

      uint64_t v15 = [v5 familyName];
      [v7 setLastName:v15];

LABEL_7:
      [*(id *)(a1 + 40) addObject:v7];
    }
  }
  else
  {

    if (v9)
    {
      [v7 setFirstName:0];
      [v7 setLastName:0];
      goto LABEL_7;
    }
  }

  return 1;
}

- (void)_contactStoreDidChange
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  id v3 = HKLogSharing();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = self;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Contacts changed notification received.", buf, 0xCu);
  }

  id v7 = 0;
  char v4 = -[HDSummarySharingEntryManager _resolveContactsWithError:]((uint64_t)self, (uint64_t)&v7);
  id v5 = v7;
  if ((v4 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = HKLogSharing();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v9 = self;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error resolving contacts %{public}@.", buf, 0x16u);
    }
  }
}

- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v72 = a3;
  id v66 = a4;
  uint64_t v117 = 0;
  v118 = &v117;
  uint64_t v119 = 0x2020000000;
  uint64_t v120 = 0;
  uint64_t v113 = 0;
  v114 = &v113;
  uint64_t v115 = 0x2020000000;
  uint64_t v116 = 0;
  uint64_t v109 = 0;
  v110 = &v109;
  uint64_t v111 = 0x2020000000;
  uint64_t v112 = 0;
  uint64_t v105 = 0;
  v106 = &v105;
  uint64_t v107 = 0x2020000000;
  uint64_t v108 = 0;
  uint64_t v101 = 0;
  v102 = &v101;
  uint64_t v103 = 0x2020000000;
  uint64_t v104 = -1;
  uint64_t v97 = 0;
  v98 = &v97;
  uint64_t v99 = 0x2020000000;
  uint64_t v100 = 0;
  uint64_t v93 = 0;
  v94 = &v93;
  uint64_t v95 = 0x2020000000;
  uint64_t v96 = 0;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v74 = self;
  location = (id *)&self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = [WeakRetained database];
  id v92 = 0;
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __79__HDSummarySharingEntryManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke;
  v83[3] = &unk_1E62FD150;
  v85 = &v117;
  v86 = &v113;
  v83[4] = v74;
  v87 = &v109;
  id v65 = v6;
  id v84 = v65;
  v88 = &v105;
  v89 = &v101;
  v90 = &v97;
  v91 = &v93;
  BOOL v64 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v8 error:&v92 block:v83];
  id v63 = v92;

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v9 = [(HDSummarySharingEntryManager *)v74 profile];
  __int16 v10 = [v9 daemon];
  id v11 = [v10 profileManager];
  id obj = [v11 allProfileIdentifiers];

  uint64_t v12 = [obj countByEnumeratingWithState:&v79 objects:v125 count:16];
  char v13 = v74;
  if (v12)
  {
    id v67 = 0;
    uint64_t v70 = 0;
    uint64_t v71 = 0;
    uint64_t v69 = 0;
    uint64_t v73 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v80 != v73) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        if ([v15 type] == 2)
        {
          id v16 = [(HDSummarySharingEntryManager *)v13 profile];
          id v17 = [v16 daemon];
          BOOL v18 = [v17 profileManager];
          uint64_t v19 = [v18 profileForIdentifier:v15];

          if (v19)
          {
            id v78 = 0;
            unsigned int v20 = -[HDSummarySharingEntryManager _areNotificationsEnabledForFeature:profileIdentifier:coordinator:error:]((uint64_t)v74, @"alerts", v15, v72, &v78);
            id v21 = v78;
            BOOL v22 = v21 == 0;
            uint64_t v23 = v22 & v20;
            if ((v22 & v20) != 0) {
              id v24 = 0;
            }
            else {
              id v24 = v21;
            }
            id v77 = v24;
            unsigned int v25 = -[HDSummarySharingEntryManager _areNotificationsEnabledForFeature:profileIdentifier:coordinator:error:]((uint64_t)v74, @"significantChanges", v15, v72, &v77);
            id v26 = v77;

            BOOL v27 = v26 == 0;
            uint64_t v28 = v27 & v25;
            if ((v27 & v25) != 0) {
              uint64_t v29 = 0;
            }
            else {
              uint64_t v29 = v26;
            }
            id v76 = v29;
            unsigned int v30 = -[HDSummarySharingEntryManager _areNotificationsEnabledForFeature:profileIdentifier:coordinator:error:]((uint64_t)v74, @"updates", v15, v72, &v76);
            id v31 = v76;

            BOOL v32 = v31 == 0;
            uint64_t v33 = v32 & v30;
            if ((v32 & v30) != 0) {
              v34 = 0;
            }
            else {
              v34 = v31;
            }
            id v35 = [v19 sharedSummaryManager];
            id v75 = 0;
            id v36 = [v35 mostRecentTransactionCreationDateWithError:&v75];
            id v37 = v75;

            if (v36)
            {
              if (v67)
              {
                if (objc_msgSend(v36, "hk_isAfterDate:"))
                {
                  id v38 = v36;

                  id v67 = v38;
                }
              }
              else
              {
                id v67 = v36;
              }
            }
            else if (v37)
            {
              _HKInitializeLogging();
              v39 = HKLogAnalytics();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v122 = v74;
                __int16 v123 = 2114;
                id v124 = v37;
                _os_log_error_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve most recent transaction creation date for analytics: %{public}@", buf, 0x16u);
              }
            }
            v69 += v23;
            v70 += v28;
            v71 += v33;
          }

          char v13 = v74;
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v79 objects:v125 count:16];
    }
    while (v12);
  }
  else
  {
    id v67 = 0;
    uint64_t v70 = 0;
    uint64_t v71 = 0;
    uint64_t v69 = 0;
  }

  id v40 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v41 = (void *)[v40 initWithSuiteName:*MEMORY[0x1E4F2BD98]];
  v42 = v74;
  uint64_t v43 = [v41 integerForKey:*MEMORY[0x1E4F2BE40]];
  uint64_t v44 = [v41 integerForKey:*MEMORY[0x1E4F2BE38]];
  uint64_t v45 = [v41 integerForKey:*MEMORY[0x1E4F2BE30]];
  if (v64)
  {
    uint64_t v46 = v45;
    v47 = objc_alloc_init(HDSummarySharingAnalytics);
    -[HDSummarySharingAnalytics setNumberAuthorizationsSharingOut:](v47, "setNumberAuthorizationsSharingOut:", [v65 count]);
    unint64_t v48 = v114[3];
    if (v48) {
      [(HDSummarySharingAnalytics *)v47 setAverageNumberAuthorizationsSharedOutPerPerson:(double)(v110[3] / v48)];
    }
    [(HDSummarySharingAnalytics *)v47 setMaxAuthorizationsSharedOutPerPerson:v106[3]];
    [(HDSummarySharingAnalytics *)v47 setMinAuthorizationsSharedOutPerPerson:v102[3]];
    [(HDSummarySharingAnalytics *)v47 setNumberPeopleSharingOut:v114[3]];
    [(HDSummarySharingAnalytics *)v47 setNumberPeopleSharingIn:v118[3]];
    if (v118[3]) {
      [(HDSummarySharingAnalytics *)v47 setMostRecentIncomingTransactionDate:v67];
    }
    [(HDSummarySharingAnalytics *)v47 setNumberOfAlertNotificationsEnabled:v69];
    [(HDSummarySharingAnalytics *)v47 setNumberOfTrendNotificationsEnabled:v70];
    [(HDSummarySharingAnalytics *)v47 setNumberOfUpdateNotificationsEnabled:v71];
    if (v43 >= 1)
    {
      v49 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:(double)v43];
      [(HDSummarySharingAnalytics *)v47 setAskSomeoneToShareLastSelectedDate:v49];

      v42 = v74;
    }
    if (v44 >= 1)
    {
      v50 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:(double)v44];
      [(HDSummarySharingAnalytics *)v47 setAnySharingWithYouLastViewedDate:v50];

      v42 = v74;
    }
    if (v46 >= 1)
    {
      v51 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:(double)v46];
      [(HDSummarySharingAnalytics *)v47 setSharingContactOptionLastSelectedDate:v51];

      v42 = v74;
    }
    if (!v42)
    {
      v56 = 0;
      goto LABEL_54;
    }
    v52 = [MEMORY[0x1E4F79EF0] sharedInstance];
    v53 = [v52 getActivePairedDevice];

    if (v53)
    {
      v54 = [v53 valueForProperty:*MEMORY[0x1E4F79E18]];
      if (v54)
      {
        v55 = v54;
        v56 = (__CFString *)v55;
LABEL_53:

LABEL_54:
        v58 = NSStringFromHKBiologicalSex(v94[3]);
        id v59 = objc_loadWeakRetained(location);
        v60 = [v59 daemon];
        v61 = [v60 analyticsSubmissionCoordinator];
        objc_msgSend(v61, "summarySharing_reportDailyAnalytics:activeWatchProductType:age:sex:", v47, v56, v98[3], v58);

        goto LABEL_55;
      }
      _HKInitializeLogging();
      v57 = HKLogSharing();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v122 = v74;
        _os_log_impl(&dword_1BCB7D000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@: No watch product type retrieved, returning unavailable", buf, 0xCu);
      }

      v55 = 0;
    }
    else
    {
      _HKInitializeLogging();
      v55 = HKLogSharing();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v122 = v74;
        _os_log_impl(&dword_1BCB7D000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@: No active paired device, returning unavailable", buf, 0xCu);
      }
    }
    v56 = @"unavailable";
    goto LABEL_53;
  }
LABEL_55:
  (*((void (**)(id, void, void, void))v66 + 2))(v66, 0, 0, 0);

  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(&v97, 8);
  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v105, 8);
  _Block_object_dispose(&v109, 8);
  _Block_object_dispose(&v113, 8);
  _Block_object_dispose(&v117, 8);
}

BOOL __79__HDSummarySharingEntryManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = HDSummarySharingEntryPredicateForTypeAndStatus(0, 1);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__HDSummarySharingEntryManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke_2;
  v11[3] = &unk_1E62FD128;
  void v11[4] = *(void *)(a1 + 32);
  long long v13 = *(_OWORD *)(a1 + 56);
  long long v10 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v10;
  long long v12 = v10;
  long long v14 = *(_OWORD *)(a1 + 72);
  BOOL v8 = +[HDSummarySharingEntryEntity enumerateCodableEntriesWithPredicate:v6 transaction:v5 error:a3 handler:v11];

  return v8;
}

uint64_t __79__HDSummarySharingEntryManager_reportDailyAnalyticsWithCoordinator_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [v5 codableEntry];
  int v7 = [v6 direction];

  if (v7 == 1)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
LABEL_14:
    LOBYTE(v13) = 1;
    goto LABEL_15;
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  id v8 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v9 = [v5 codableEntry];
  long long v10 = [v9 uuid];
  id v11 = (void *)[v8 initWithUUIDString:v10];

  long long v12 = (void *)[objc_alloc(MEMORY[0x1E4F2B500]) initForInvitationUUID:v11];
  uint64_t v13 = [*(id *)(a1 + 32) profile];
  long long v14 = [(id)v13 sharingAuthorizationManager];
  id v19 = 0;
  uint64_t v15 = [v14 sharingAuthorizationsForRecipientIdentifier:v12 error:&v19];
  id v16 = v19;

  if (v15)
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += [v15 count];
    [*(id *)(a1 + 40) addObjectsFromArray:v15];
    if ((unint64_t)[v15 count] > *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v15 count];
    }
    if ((unint64_t)[v15 count] < *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [v15 count];
    }
  }
  else
  {
    id v17 = v16;
    LOBYTE(v13) = v17 == 0;
    if (v17)
    {
      if (a3) {
        *a3 = v17;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  if (v15) {
    goto LABEL_14;
  }
LABEL_15:

  return v13 & 1;
}

- (uint64_t)_areNotificationsEnabledForFeature:(void *)a3 profileIdentifier:(void *)a4 coordinator:(void *)a5 error:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v13 = (void *)[v12 initWithSuiteName:*MEMORY[0x1E4F2BD98]];
    long long v14 = NSString;
    uint64_t v15 = [v10 identifier];
    id v16 = [v15 UUIDString];
    id v17 = [v14 stringWithFormat:@"HealthSharingPreferences_%@_Notifications_%@", v16, v9];

    BOOL v18 = [v13 objectForKey:v17];
    id v19 = v18;
    if (v18)
    {
      uint64_t v20 = [v18 BOOLValue];
    }
    else
    {
      unsigned int v30 = a5;
      uint64_t v21 = [v11 _createHealthStoreForProfileIdentifier:v10];
      id v22 = objc_alloc(MEMORY[0x1E4F2B138]);
      id v31 = (void *)v21;
      uint64_t v23 = (void *)[v22 initWithCategory:1 domainName:*MEMORY[0x1E4F2BE20] healthStore:v21];
      id v32 = 0;
      id v24 = [v23 numberForKey:v9 error:&v32];
      id v25 = v32;
      id v26 = v25;
      if (v24)
      {
        uint64_t v20 = [v24 BOOLValue];
      }
      else
      {
        id v27 = v25;
        uint64_t v28 = v27;
        if (v27)
        {
          if (v30) {
            *unsigned int v30 = v27;
          }
          else {
            _HKLogDroppedError();
          }
        }

        uint64_t v20 = 0;
      }
    }
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

- (HDSummarySharingEntryManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDSummarySharingEntryManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_observerSet, 0);
}

- (id)fetchSharingEntriesWithError:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __70__HDSummarySharingEntryManager_Support__fetchSharingEntriesWithError___block_invoke;
  uint64_t v13 = &unk_1E62FD100;
  long long v14 = self;
  id v6 = v5;
  id v15 = v6;
  BOOL v7 = [(HDSummarySharingEntryManager *)self enumerateCodableEntriesWithPredicate:0 error:a3 handler:&v10];
  id v8 = 0;
  if (v7) {
    id v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13, v14);
  }

  return v8;
}

uint64_t __70__HDSummarySharingEntryManager_Support__fetchSharingEntriesWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 sharingEntry];
  char v4 = [*(id *)(a1 + 32) profile];
  id v5 = [v4 daemon];
  id v6 = [v5 profileManager];
  BOOL v7 = [v3 UUID];
  id v8 = [v6 profileIdentifierForUUID:v7];

  if (v8 && [v8 type] == 2) {
    [v3 _setProfileIdentifier:v8];
  }
  [*(id *)(a1 + 40) addObject:v3];

  return 1;
}

@end