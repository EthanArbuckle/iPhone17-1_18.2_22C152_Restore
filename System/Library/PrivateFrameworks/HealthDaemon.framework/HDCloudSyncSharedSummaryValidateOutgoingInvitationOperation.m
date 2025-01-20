@interface HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation
+ (BOOL)shouldLogAtOperationStart;
- (CKUserIdentity)userIdentity;
- (HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (void)main;
- (void)setUserIdentity:(id)a3;
@end

@implementation HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation

- (HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation;
  result = [(HDCloudSyncOperation *)&v5 initWithConfiguration:a3 cloudState:a4];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)setUserIdentity:(id)a3
{
  objc_super v5 = (CKUserIdentity *)a3;
  if ([(HDCloudSyncOperation *)self status])
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation.m", 41, @"Invalid parameter not satisfying: %@", @"self.status == HDCloudSyncOperationStatusPending" object file lineNumber description];
  }
  os_unfair_lock_lock(&self->_lock);
  userIdentity = self->_userIdentity;
  self->_userIdentity = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (CKUserIdentity)userIdentity
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_userIdentity;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)main
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    userIdentity = self->_userIdentity;
    *(_DWORD *)buf = 138543618;
    v24 = self;
    __int16 v25 = 2114;
    v26 = userIdentity;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] Beginning operation with user identity %{public}@", buf, 0x16u);
  }
  v6 = self->_userIdentity;
  if (v6)
  {
    v7 = [(CKUserIdentity *)v6 userRecordID];
    v8 = [v7 recordName];
    v9 = HDSummarySharingEntryPredicateForCloudKitIdentifierTypeStatusAndDirection((uint64_t)v8, 0, 0, 0);

    v10 = [(CKUserIdentity *)self->_userIdentity userRecordID];
    v11 = [v10 recordName];
    v12 = HDSummarySharingEntryPredicateForCloudKitIdentifierTypeStatusAndDirection((uint64_t)v11, 0, 1, 0);

    v13 = (void *)MEMORY[0x1E4F65D08];
    v22[0] = v9;
    v22[1] = v12;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    v15 = [v13 predicateMatchingAnyPredicates:v14];

    v16 = [(HDCloudSyncOperation *)self configuration];
    v17 = [v16 repository];
    v18 = [v17 cloudSyncShimProvider];
    v19 = [v18 summarySharingEntryShim];

    v20 = [(HDCloudSyncOperation *)self configuration];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __67__HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation_main__block_invoke;
    v21[3] = &unk_1E62F45D0;
    v21[4] = self;
    [v19 sharingEntryExistsWithPredicate:v15 configuration:v20 completion:v21];
  }
  else
  {
    v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForNilArgument:class:selector:", @"_userIdentity", objc_opt_class(), a2);
    [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v9];
  }
}

void __67__HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation_main__block_invoke(uint64_t a1, int a2, char a3, void *a4)
{
  id v7 = a4;
  v8 = *(void **)(a1 + 32);
  if (a3)
  {
    if (a2)
    {
      v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 730, @"You already have a pending or accepted invitation with this participant");
      [v8 finishWithSuccess:0 error:v9];
    }
    else
    {
      v10 = [*(id *)(a1 + 32) configuration];
      v11 = [v10 repository];
      v12 = [v11 primaryCKContainer];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __67__HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation_main__block_invoke_2;
      v13[3] = &unk_1E62F45A8;
      v13[4] = *(void *)(a1 + 32);
      [v12 fetchUserRecordIDWithCompletionHandler:v13];
    }
  }
  else
  {
    [*(id *)(a1 + 32) finishWithSuccess:0 error:v7];
  }
}

void __67__HDCloudSyncSharedSummaryValidateOutgoingInvitationOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if (v15)
  {
    v6 = [v15 recordName];
    id v7 = [*(id *)(*(void *)(a1 + 32) + 112) userRecordID];
    v8 = [v7 recordName];
    int v9 = [v6 isEqualToString:v8];

    v10 = *(void **)(a1 + 32);
    if (v9)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 732, @"You are attempting to share with yourself.");
      [v10 finishWithSuccess:0 error:v11];

      goto LABEL_7;
    }
    v12 = v10;
    uint64_t v13 = 1;
    id v14 = 0;
  }
  else
  {
    v12 = *(void **)(a1 + 32);
    uint64_t v13 = 0;
    id v14 = v5;
  }
  [v12 finishWithSuccess:v13 error:v14];
LABEL_7:
}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void).cxx_destruct
{
}

@end