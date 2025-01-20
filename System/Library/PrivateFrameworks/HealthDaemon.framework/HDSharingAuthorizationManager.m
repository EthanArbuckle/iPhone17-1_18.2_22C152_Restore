@interface HDSharingAuthorizationManager
- (BOOL)_addSharingAuthorizations:(void *)a3 recipientIdentifier:(void *)a4 databaseTransaction:(void *)a5 error:;
- (BOOL)_removeSharingAuthorizations:(void *)a3 recipientIdentifier:(void *)a4 databaseTransaction:(void *)a5 error:;
- (BOOL)addSharingAuthorizations:(id)a3 recipientIdentifier:(id)a4 error:(id *)a5;
- (BOOL)insertOrUpdateCodableRelationships:(id)a3 syncProvenance:(int64_t)a4 error:(id *)a5;
- (BOOL)insertOrUpdateRecipientIdentifier:(id)a3 sharingAuthorizations:(id)a4 dateModified:(id)a5 syncProvenance:(int64_t)a6 syncIdentity:(int64_t)a7 databaseTransaction:(id)a8 error:(id *)a9;
- (BOOL)markSharingAuthorizationsForDeletion:(id)a3 recipientIdentifier:(id)a4 error:(id *)a5;
- (BOOL)removeSharingAuthorizations:(id)a3 recipientIdentifier:(id)a4 error:(id *)a5;
- (BOOL)revokeRecipientWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)updateAuthorizationsForRecipientIdentifier:(id)a3 sharingAuthorizationsToAdd:(id)a4 sharingAuthorizationsToRemove:(id)a5 error:(id *)a6;
- (HDSharingAuthorizationManager)initWithProfile:(id)a3;
- (id)recipientIdentifiersForSharingAuthorizations:(id)a3 error:(id *)a4;
- (id)sharingAuthorizationsForRecipientIdentifier:(id)a3 error:(id *)a4;
- (id)sharingAuthorizationsMarkedForDeletionForRecipientIdentifier:(id)a3 error:(id *)a4;
- (void)deleteMarkedSharingAuthorizations;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation HDSharingAuthorizationManager

- (HDSharingAuthorizationManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDSharingAuthorizationManager;
  v5 = [(HDSharingAuthorizationManager *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    id v7 = objc_alloc(MEMORY[0x1E4F2B5F0]);
    v8 = HKLogSharing();
    uint64_t v9 = [v7 initWithName:@"sharing-authorization-manager-observers" loggingCategory:v8];
    observers = v6->_observers;
    v6->_observers = (HKSynchronousObserverSet *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    addedAuthorizationsByRecipient = v6->_addedAuthorizationsByRecipient;
    v6->_addedAuthorizationsByRecipient = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    removedAuthorizationsByRecipient = v6->_removedAuthorizationsByRecipient;
    v6->_removedAuthorizationsByRecipient = v13;
  }
  return v6;
}

- (id)sharingAuthorizationsForRecipientIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__162;
  v20 = __Block_byref_object_dispose__162;
  id v21 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v8 = [WeakRetained database];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__HDSharingAuthorizationManager_sharingAuthorizationsForRecipientIdentifier_error___block_invoke;
  v13[3] = &unk_1E62F9108;
  v15 = &v16;
  id v9 = v6;
  id v14 = v9;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v8 error:a4 block:v13];

  if (a4) {
    v10 = (void *)v17[5];
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  _Block_object_dispose(&v16, 8);

  return v11;
}

BOOL __83__HDSharingAuthorizationManager_sharingAuthorizationsForRecipientIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = +[HDSharingAuthorizationsEntity sharingAuthorizationsForRecipientIdentifier:*(void *)(a1 + 32) databaseTransaction:a2 error:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (id)sharingAuthorizationsMarkedForDeletionForRecipientIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__162;
  v20 = __Block_byref_object_dispose__162;
  id v21 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v8 = [WeakRetained database];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__HDSharingAuthorizationManager_sharingAuthorizationsMarkedForDeletionForRecipientIdentifier_error___block_invoke;
  v13[3] = &unk_1E62F9108;
  v15 = &v16;
  id v9 = v6;
  id v14 = v9;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v8 error:a4 block:v13];

  if (a4) {
    v10 = (void *)v17[5];
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  _Block_object_dispose(&v16, 8);

  return v11;
}

BOOL __100__HDSharingAuthorizationManager_sharingAuthorizationsMarkedForDeletionForRecipientIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = +[HDSharingAuthorizationsEntity sharingAuthorizationsMarkedForDeletionForRecipientIdentifier:*(void *)(a1 + 32) databaseTransaction:a2 error:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (id)recipientIdentifiersForSharingAuthorizations:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v9 = [WeakRetained database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__HDSharingAuthorizationManager_recipientIdentifiersForSharingAuthorizations_error___block_invoke;
  v15[3] = &unk_1E62F2AE0;
  id v16 = v6;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v9 error:a4 block:v15];

  if (a4) {
    v12 = v10;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  return v13;
}

uint64_t __84__HDSharingAuthorizationManager_recipientIdentifiersForSharingAuthorizations_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v18 = a3;
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      a3 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * (void)a3);
        id v19 = 0;
        id v11 = +[HDSharingAuthorizationsEntity recipientIdentifiersForSharingAuthorization:databaseTransaction:error:](HDSharingAuthorizationsEntity, "recipientIdentifiersForSharingAuthorization:databaseTransaction:error:", v10, v5, &v19, v18);
        id v12 = v19;
        id v13 = v12;
        if (!v11)
        {
          id v15 = v12;
          id v16 = v15;
          LODWORD(a3) = v15 == 0;
          if (v15)
          {
            if (v18) {
              *uint64_t v18 = v15;
            }
            else {
              _HKLogDroppedError();
            }
          }

          int v14 = 0;
          goto LABEL_15;
        }
        [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v10];

        a3 = (void *)((char *)a3 + 1);
      }
      while ((void *)v8 != a3);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  int v14 = 1;
LABEL_15:

  return (a3 | v14) & 1;
}

- (BOOL)addSharingAuthorizations:(id)a3 recipientIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v11 = [WeakRetained database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__HDSharingAuthorizationManager_addSharingAuthorizations_recipientIdentifier_error___block_invoke;
  v15[3] = &unk_1E62F5A88;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v11 error:a5 block:v15];

  return (char)a5;
}

BOOL __84__HDSharingAuthorizationManager_addSharingAuthorizations_recipientIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return -[HDSharingAuthorizationManager _addSharingAuthorizations:recipientIdentifier:databaseTransaction:error:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), a2, a3);
}

- (BOOL)_addSharingAuthorizations:(void *)a3 recipientIdentifier:(void *)a4 databaseTransaction:(void *)a5 error:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (!a1)
  {
    BOOL v18 = 0;
    goto LABEL_7;
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __105__HDSharingAuthorizationManager__addSharingAuthorizations_recipientIdentifier_databaseTransaction_error___block_invoke;
  v22[3] = &unk_1E62F30F8;
  v22[4] = a1;
  id v12 = v9;
  id v23 = v12;
  id v13 = v10;
  id v24 = v13;
  [v11 onCommit:v22 orRollback:0];
  if ([v13 type] == 1)
  {
    int v14 = [MEMORY[0x1E4F1C9C8] date];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v21 = 0;
    id v16 = +[HDSharingRelationshipEntity insertOrReplaceWithRecipientIdentifier:dateModified:syncProvenance:syncIdentity:databaseTransaction:error:](HDSharingRelationshipEntity, "insertOrReplaceWithRecipientIdentifier:dateModified:syncProvenance:syncIdentity:databaseTransaction:error:", v13, v14, 0, [WeakRetained currentSyncIdentityPersistentID], v11, &v21);
    id v17 = v21;

    if (!v16)
    {
      id v20 = v17;
      BOOL v18 = v20 == 0;
      if (v20)
      {
        if (a5) {
          *a5 = v20;
        }
        else {
          _HKLogDroppedError();
        }
      }

      goto LABEL_6;
    }
  }
  BOOL v18 = +[HDSharingAuthorizationsEntity addSharingAuthorizations:v12 forRecipientIdentifier:v13 databaseTransaction:v11 error:a5];
LABEL_6:

LABEL_7:
  return v18;
}

void __105__HDSharingAuthorizationManager__addSharingAuthorizations_recipientIdentifier_databaseTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __105__HDSharingAuthorizationManager__addSharingAuthorizations_recipientIdentifier_databaseTransaction_error___block_invoke_2;
  v4[3] = &unk_1E6308F38;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 notifyObservers:v4];
}

uint64_t __105__HDSharingAuthorizationManager__addSharingAuthorizations_recipientIdentifier_databaseTransaction_error___block_invoke_2(void *a1, void *a2)
{
  return [a2 sharingAuthorizationManager:a1[4] didAddSharingAuthorizations:a1[5] recipientIdentifier:a1[6]];
}

- (BOOL)removeSharingAuthorizations:(id)a3 recipientIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v11 = [WeakRetained database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__HDSharingAuthorizationManager_removeSharingAuthorizations_recipientIdentifier_error___block_invoke;
  v15[3] = &unk_1E62F5A88;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v11 error:a5 block:v15];

  return (char)a5;
}

BOOL __87__HDSharingAuthorizationManager_removeSharingAuthorizations_recipientIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  return -[HDSharingAuthorizationManager _removeSharingAuthorizations:recipientIdentifier:databaseTransaction:error:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), a2, a3);
}

- (BOOL)_removeSharingAuthorizations:(void *)a3 recipientIdentifier:(void *)a4 databaseTransaction:(void *)a5 error:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (!a1)
  {
    BOOL v17 = 0;
    goto LABEL_21;
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __108__HDSharingAuthorizationManager__removeSharingAuthorizations_recipientIdentifier_databaseTransaction_error___block_invoke;
  v25[3] = &unk_1E62F30F8;
  v25[4] = a1;
  id v12 = v9;
  id v26 = v12;
  id v13 = v10;
  id v27 = v13;
  [v11 onCommit:v25 orRollback:0];
  if ([v13 type] == 1)
  {
    id v24 = 0;
    int v14 = +[HDSharingRelationshipEntity entityWithRecipientIdentifier:v13 databaseTransaction:v11 error:&v24];
    id v15 = v24;
    if (v15)
    {
      id v16 = v15;
      if (a5)
      {
        id v16 = v15;
        BOOL v17 = 0;
        *a5 = v16;
      }
      else
      {
        _HKLogDroppedError();
        BOOL v17 = 0;
      }
LABEL_19:

      goto LABEL_20;
    }
    if (v14)
    {
      BOOL v18 = [MEMORY[0x1E4F1C9C8] date];
      id v23 = 0;
      char v19 = [v14 setDateModified:v18 databaseTransaction:v11 error:&v23];
      id v20 = v23;

      if ((v19 & 1) == 0)
      {
        id v16 = v20;
        BOOL v17 = v16 == 0;
        if (v16)
        {
          if (a5) {
            *a5 = v16;
          }
          else {
            _HKLogDroppedError();
          }
        }

        goto LABEL_19;
      }
    }
    else
    {
      _HKInitializeLogging();
      id v21 = HKLogSharing();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = a1;
        __int16 v30 = 2112;
        id v31 = v13;
        _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Removing authorizations from non-existent relationship with recipient %@", buf, 0x16u);
      }

      id v20 = 0;
    }
  }
  BOOL v17 = +[HDSharingAuthorizationsEntity deleteSharingAuthorizations:v12 recipientIdentifier:v13 databaseTransaction:v11 error:a5];
LABEL_20:

LABEL_21:
  return v17;
}

void __108__HDSharingAuthorizationManager__removeSharingAuthorizations_recipientIdentifier_databaseTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __108__HDSharingAuthorizationManager__removeSharingAuthorizations_recipientIdentifier_databaseTransaction_error___block_invoke_2;
  v4[3] = &unk_1E6308F38;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 notifyObservers:v4];
}

uint64_t __108__HDSharingAuthorizationManager__removeSharingAuthorizations_recipientIdentifier_databaseTransaction_error___block_invoke_2(void *a1, void *a2)
{
  return [a2 sharingAuthorizationManager:a1[4] didRemoveSharingAuthorizations:a1[5] recipientIdentifier:a1[6]];
}

- (BOOL)updateAuthorizationsForRecipientIdentifier:(id)a3 sharingAuthorizationsToAdd:(id)a4 sharingAuthorizationsToRemove:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  int v14 = [WeakRetained database];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __139__HDSharingAuthorizationManager_updateAuthorizationsForRecipientIdentifier_sharingAuthorizationsToAdd_sharingAuthorizationsToRemove_error___block_invoke;
  v19[3] = &unk_1E62FB0D0;
  v19[4] = self;
  id v20 = v11;
  id v21 = v10;
  id v22 = v12;
  id v15 = v12;
  id v16 = v10;
  id v17 = v11;
  LOBYTE(a6) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v14 error:a6 block:v19];

  return (char)a6;
}

uint64_t __139__HDSharingAuthorizationManager_updateAuthorizationsForRecipientIdentifier_sharingAuthorizationsToAdd_sharingAuthorizationsToRemove_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void **)(a1 + 48);
  id v8 = a2;
  LODWORD(v5) = -[HDSharingAuthorizationManager _addSharingAuthorizations:recipientIdentifier:databaseTransaction:error:](v5, v6, v7, v8, a3);
  LODWORD(a3) = -[HDSharingAuthorizationManager _removeSharingAuthorizations:recipientIdentifier:databaseTransaction:error:](*(void *)(a1 + 32), *(void **)(a1 + 56), *(void **)(a1 + 48), v8, a3);

  return v5 & a3;
}

- (BOOL)revokeRecipientWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = [WeakRetained database];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__HDSharingAuthorizationManager_revokeRecipientWithIdentifier_error___block_invoke;
  v11[3] = &unk_1E62F2AE0;
  v11[4] = self;
  id v12 = v6;
  id v9 = v6;
  LOBYTE(a4) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v8 error:a4 block:v11];

  return (char)a4;
}

BOOL __69__HDSharingAuthorizationManager_revokeRecipientWithIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__HDSharingAuthorizationManager_revokeRecipientWithIdentifier_error___block_invoke_2;
  v14[3] = &unk_1E62F31C0;
  id v6 = *(void **)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  id v15 = v6;
  [v5 onCommit:v14 orRollback:0];
  if ([*(id *)(a1 + 40) type] != 1) {
    goto LABEL_4;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  id v13 = 0;
  BOOL v8 = +[HDSharingRelationshipEntity deleteEntityWithRecipientIdentifier:v7 databaseTransaction:v5 error:&v13];
  id v9 = v13;
  if (v8)
  {

LABEL_4:
    BOOL v10 = +[HDSharingAuthorizationsEntity deleteAllSharingAuthorizationsForRecipientIdentifier:*(void *)(a1 + 40) databaseTransaction:v5 error:a3];
    goto LABEL_10;
  }
  id v11 = v9;
  BOOL v10 = v11 == 0;
  if (v11)
  {
    if (a3) {
      *a3 = v11;
    }
    else {
      _HKLogDroppedError();
    }
  }

LABEL_10:
  return v10;
}

void __69__HDSharingAuthorizationManager_revokeRecipientWithIdentifier_error___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 16);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__HDSharingAuthorizationManager_revokeRecipientWithIdentifier_error___block_invoke_3;
  v3[3] = &unk_1E6308F60;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 notifyObservers:v3];
}

uint64_t __69__HDSharingAuthorizationManager_revokeRecipientWithIdentifier_error___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 sharingAuthorizationManager:*(void *)(a1 + 32) didRevokeRecipientWithIdentifier:*(void *)(a1 + 40)];
}

- (BOOL)markSharingAuthorizationsForDeletion:(id)a3 recipientIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v11 = [WeakRetained database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __96__HDSharingAuthorizationManager_markSharingAuthorizationsForDeletion_recipientIdentifier_error___block_invoke;
  v15[3] = &unk_1E62F2AE0;
  id v16 = v8;
  id v17 = v9;
  id v12 = v9;
  id v13 = v8;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v11 error:a5 block:v15];

  return (char)a5;
}

BOOL __96__HDSharingAuthorizationManager_markSharingAuthorizationsForDeletion_recipientIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDSharingAuthorizationsEntity markSharingAuthorizationsForDeletion:*(void *)(a1 + 32) recipientIdentifier:*(void *)(a1 + 40) databaseTransaction:a2 error:a3];
}

- (void)deleteMarkedSharingAuthorizations
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained database];
  id v8 = 0;
  BOOL v5 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v4 error:&v8 block:&__block_literal_global_197];
  id v6 = v8;

  if (!v5)
  {
    _HKInitializeLogging();
    uint64_t v7 = HKLogSharing();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      BOOL v10 = self;
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Error removing marked sharing authorizations %{public}@", buf, 0x16u);
    }
  }
}

BOOL __66__HDSharingAuthorizationManager_deleteMarkedSharingAuthorizations__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDSharingAuthorizationsEntity deleteAllMarkedSharingAuthorizationsWithTransaction:a2 error:a3];
}

- (BOOL)insertOrUpdateCodableRelationships:(id)a3 syncProvenance:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  BOOL v10 = [WeakRetained database];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__HDSharingAuthorizationManager_insertOrUpdateCodableRelationships_syncProvenance_error___block_invoke;
  v13[3] = &unk_1E62F4200;
  void v13[4] = self;
  id v14 = v8;
  int64_t v15 = a4;
  id v11 = v8;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v10 error:a5 block:v13];

  return (char)a5;
}

uint64_t __89__HDSharingAuthorizationManager_insertOrUpdateCodableRelationships_syncProvenance_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __89__HDSharingAuthorizationManager_insertOrUpdateCodableRelationships_syncProvenance_error___block_invoke_2;
  v45[3] = &unk_1E62F3208;
  v45[4] = *(void *)(a1 + 32);
  id v37 = v4;
  [v4 onCommit:v45 orRollback:0];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v42;
    uint64_t v34 = *(void *)v42;
    uint64_t v35 = a1;
LABEL_3:
    uint64_t v8 = 0;
    uint64_t v36 = v6;
    while (1)
    {
      if (*(void *)v42 != v7) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v41 + 1) + 8 * v8);
      if ([v9 recipientType] != 1) {
        goto LABEL_20;
      }
      id v10 = objc_alloc(MEMORY[0x1E4F2B500]);
      id v11 = [v9 recipientIdentifier];
      id v12 = (void *)[v10 initForClinicalAccountIdentifier:v11];

      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      id v14 = [WeakRetained syncIdentityManager];
      int64_t v15 = [v14 legacySyncIdentity];

      if (![v9 hasSyncIdentity]) {
        goto LABEL_11;
      }
      id v16 = [v9 syncIdentity];
      id v40 = 0;
      id v17 = +[HDSyncIdentity syncIdentityWithCodable:v16 error:&v40];
      id v18 = v40;

      if (v17)
      {
        id v19 = objc_loadWeakRetained((id *)(*(void *)(v35 + 32) + 8));
        id v20 = [v19 syncIdentityManager];
        id v39 = v18;
        uint64_t v21 = [v20 concreteIdentityForIdentity:v17 shouldCreate:1 transaction:v37 error:&v39];
        id v22 = v39;

        if (v21)
        {

          int64_t v15 = (void *)v21;
          a1 = v35;
LABEL_11:
          id v23 = *(void **)(a1 + 32);
          id v24 = [v9 sharingAuthorizations];
          uint64_t v25 = HDSharingAuthorizationsFromCodableSharingAuthorizations(v24);
          id v26 = (void *)MEMORY[0x1E4F1C9C8];
          [v9 dateModified];
          id v27 = objc_msgSend(v26, "dateWithTimeIntervalSinceReferenceDate:");
          uint64_t v28 = *(void *)(a1 + 48);
          uint64_t v29 = [v15 entity];
          LODWORD(v23) = objc_msgSend(v23, "insertOrUpdateRecipientIdentifier:sharingAuthorizations:dateModified:syncProvenance:syncIdentity:databaseTransaction:error:", v12, v25, v27, v28, objc_msgSend(v29, "persistentID"), v37, a3);

          if (!v23)
          {

            uint64_t v31 = 0;
            goto LABEL_24;
          }
          uint64_t v7 = v34;
          uint64_t v6 = v36;
          goto LABEL_19;
        }
        _HKInitializeLogging();
        __int16 v30 = HKLogSharing();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v47 = v22;
          _os_log_fault_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_FAULT, "HDSharingRelationshipEntity ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
        }
        int64_t v15 = 0;
        id v18 = v22;
        uint64_t v7 = v34;
        a1 = v35;
        uint64_t v6 = v36;
      }
      else
      {
        _HKInitializeLogging();
        __int16 v30 = HKLogSharing();
        a1 = v35;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v47 = v18;
          _os_log_fault_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_FAULT, "HDSharingRelationshipEntity SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
        }
      }

LABEL_19:
LABEL_20:
      if (v6 == ++v8)
      {
        uint64_t v6 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  uint64_t v31 = 1;
LABEL_24:

  return v31;
}

uint64_t __89__HDSharingAuthorizationManager_insertOrUpdateCodableRelationships_syncProvenance_error___block_invoke_2(uint64_t result)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v2 = *(id *)(v1 + 24);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v23 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v8 = *(void **)(v1 + 16);
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __69__HDSharingAuthorizationManager__notifyAuthorizationsAddedAndRemoved__block_invoke;
          v21[3] = &unk_1E6308F60;
          v21[4] = v1;
          v21[5] = v7;
          [v8 notifyObservers:v21];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v4);
    }

    [*(id *)(v1 + 24) removeAllObjects];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = *(id *)(v1 + 32);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * j);
          int64_t v15 = *(void **)(v1 + 16);
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __69__HDSharingAuthorizationManager__notifyAuthorizationsAddedAndRemoved__block_invoke_2;
          v16[3] = &unk_1E6308F60;
          v16[4] = v1;
          v16[5] = v14;
          [v15 notifyObservers:v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v26 count:16];
      }
      while (v11);
    }

    return [*(id *)(v1 + 32) removeAllObjects];
  }
  return result;
}

- (void)registerObserver:(id)a3
{
}

- (void)unregisterObserver:(id)a3
{
}

- (BOOL)insertOrUpdateRecipientIdentifier:(id)a3 sharingAuthorizations:(id)a4 dateModified:(id)a5 syncProvenance:(int64_t)a6 syncIdentity:(int64_t)a7 databaseTransaction:(id)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  if ([v15 type] == 1)
  {
    v38 = self;
    long long v19 = a9;
    id v42 = 0;
    long long v20 = +[HDSharingRelationshipEntity entityWithRecipientIdentifier:v15 databaseTransaction:v18 error:&v42];
    id v21 = v42;
    id v22 = v21;
    if (!v20 && v21)
    {
      if (a9)
      {
        id v22 = v21;
        BOOL v23 = 0;
        *a9 = v22;
      }
      else
      {
        _HKLogDroppedError();
        BOOL v23 = 0;
      }
      goto LABEL_33;
    }
    if (v20)
    {
      id v36 = v16;
      id v41 = v21;
      long long v24 = [v20 dateModifiedInDatabaseTransaction:v18 error:&v41];
      id v25 = v41;

      if (!v24)
      {
        id v27 = v25;
        id v22 = v27;
        BOOL v23 = v27 == 0;
        id v16 = v36;
        if (v27)
        {
          if (a9) {
            *a9 = v27;
          }
          else {
            _HKLogDroppedError();
          }
        }

        goto LABEL_33;
      }
      char v26 = objc_msgSend(v24, "hk_isAfterOrEqualToDate:", v17);

      if (v26)
      {
        BOOL v23 = 1;
        id v22 = v25;
        id v16 = v36;
LABEL_33:

        goto LABEL_34;
      }
      id v22 = v25;
      id v16 = v36;
      long long v19 = a9;
    }
    id v40 = v22;
    uint64_t v28 = +[HDSharingRelationshipEntity insertOrReplaceWithRecipientIdentifier:v15 dateModified:v17 syncProvenance:a6 syncIdentity:a7 databaseTransaction:v18 error:&v40];
    id v29 = v40;

    id v37 = (void *)v28;
    if (v28)
    {
      id v39 = v29;
      id v30 = +[HDSharingAuthorizationsEntity sharingAuthorizationsForRecipientIdentifier:v15 databaseTransaction:v18 error:&v39];
      id v22 = v39;

      if (v30)
      {
        uint64_t v31 = [v16 arrayByExcludingObjectsInArray:v30];
        [(NSMutableDictionary *)v38->_addedAuthorizationsByRecipient setObject:v31 forKeyedSubscript:v15];

        uint64_t v32 = [v30 arrayByExcludingObjectsInArray:v16];
        [(NSMutableDictionary *)v38->_removedAuthorizationsByRecipient setObject:v32 forKeyedSubscript:v15];

        BOOL v23 = +[HDSharingAuthorizationsEntity insertOrReplaceWithRecipientIdentifier:v15 sharingAuthorizations:v16 databaseTransaction:v18 error:a9];
      }
      else
      {
        id v34 = v22;
        id v22 = v34;
        BOOL v23 = v34 == 0;
        if (v34)
        {
          if (a9) {
            *a9 = v34;
          }
          else {
            _HKLogDroppedError();
          }
        }

        id v30 = 0;
      }
    }
    else
    {
      id v33 = v29;
      id v30 = v33;
      if (v33)
      {
        if (v19)
        {
          id v30 = v33;
          BOOL v23 = 0;
          *long long v19 = v30;
        }
        else
        {
          _HKLogDroppedError();
          BOOL v23 = 0;
        }
        id v22 = v30;
      }
      else
      {
        id v22 = 0;
        BOOL v23 = 1;
      }
    }

    goto LABEL_33;
  }
  BOOL v23 = 1;
LABEL_34:

  return v23;
}

void __69__HDSharingAuthorizationManager__notifyAuthorizationsAddedAndRemoved__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(v3 + 24);
  id v6 = a2;
  id v7 = [v5 objectForKeyedSubscript:v4];
  [v6 sharingAuthorizationManager:v3 didAddSharingAuthorizations:v7 recipientIdentifier:*(void *)(a1 + 40)];
}

void __69__HDSharingAuthorizationManager__notifyAuthorizationsAddedAndRemoved__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(v3 + 32);
  id v6 = a2;
  id v7 = [v5 objectForKeyedSubscript:v4];
  [v6 sharingAuthorizationManager:v3 didRemoveSharingAuthorizations:v7 recipientIdentifier:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedAuthorizationsByRecipient, 0);
  objc_storeStrong((id *)&self->_addedAuthorizationsByRecipient, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end