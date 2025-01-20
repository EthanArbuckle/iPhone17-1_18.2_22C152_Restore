@interface HDUpdateCodableSummarySharingEntryOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (CKShareParticipant)ownerParticipant;
- (HDUpdateCodableSummarySharingEntryOperation)init;
- (HDUpdateCodableSummarySharingEntryOperation)initWithCoder:(id)a3;
- (HDUpdateCodableSummarySharingEntryOperation)initWithInvitationUUID:(id)a3 status:(int64_t)a4 dateModified:(id)a5 dateAccepted:(id)a6 ownerParticipant:(id)a7;
- (HKSummarySharingEntry)sharingEntry;
- (NSDate)dateAccepted;
- (NSDate)dateModified;
- (NSUUID)invitationUUID;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDUpdateCodableSummarySharingEntryOperation

- (HDUpdateCodableSummarySharingEntryOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDUpdateCodableSummarySharingEntryOperation)initWithInvitationUUID:(id)a3 status:(int64_t)a4 dateModified:(id)a5 dateAccepted:(id)a6 ownerParticipant:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HDUpdateCodableSummarySharingEntryOperation;
  v16 = [(HDUpdateCodableSummarySharingEntryOperation *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    invitationUUID = v16->_invitationUUID;
    v16->_invitationUUID = (NSUUID *)v17;

    v16->_status = a4;
    uint64_t v19 = [v13 copy];
    dateModified = v16->_dateModified;
    v16->_dateModified = (NSDate *)v19;

    uint64_t v21 = [v14 copy];
    dateAccepted = v16->_dateAccepted;
    v16->_dateAccepted = (NSDate *)v21;

    uint64_t v23 = [v15 copy];
    ownerParticipant = v16->_ownerParticipant;
    v16->_ownerParticipant = (CKShareParticipant *)v23;
  }
  return v16;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = HDSummarySharingEntryPredicateForInvitationUUID((uint64_t)self->_invitationUUID);
  v11 = [v8 sharingEntryManager];
  id v12 = [v11 anyCodableEntryWithPredicate:v10 errorOut:a5];

  if (v12)
  {
    int v13 = [v12 status];
    int64_t status = self->_status;
    if (HDMergedSharingStatus(status, v13) != status)
    {
      _HKInitializeLogging();
      v18 = HKLogSharing();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = HKStringForSharingStatus();
        HKStringForSharingStatus();
        v20 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2114;
        v27 = v20;
        _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Entry not updated because current status %{public}@ takes precedence over new status %{public}@", buf, 0x20u);
      }
      goto LABEL_11;
    }
    if (+[HDSummarySharingEntryEntity updateStatus:status dateModified:self->_dateModified dateAccepted:self->_dateAccepted predicate:v10 profile:v8 error:a5])
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v27 = __Block_byref_object_copy__48;
      v28 = __Block_byref_object_dispose__48;
      id v29 = 0;
      id v15 = [v8 sharingEntryManager];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __84__HDUpdateCodableSummarySharingEntryOperation_performWithProfile_transaction_error___block_invoke;
      v22[3] = &unk_1E62FA0C0;
      v25 = buf;
      v22[4] = self;
      id v23 = v10;
      id v24 = v8;
      int v16 = [v15 enumerateCodableEntriesWithPredicate:v23 error:a5 handler:v22];

      if (v16) {
        objc_storeStrong((id *)&self->_sharingEntry, *(id *)(*(void *)&buf[8] + 40));
      }

      _Block_object_dispose(buf, 8);
LABEL_11:
      BOOL v17 = 1;
      goto LABEL_12;
    }
  }
  BOOL v17 = 0;
LABEL_12:

  return v17;
}

uint64_t __84__HDUpdateCodableSummarySharingEntryOperation_performWithProfile_transaction_error___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 sharingEntry];
  uint64_t v7 = *(void *)(a1[7] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = [v5 codableEntry];

  v10 = [v9 shareOwnerParticipant];
  if (v10)
  {
  }
  else
  {
    uint64_t v12 = *(void *)(a1[4] + 56);

    if (!v12) {
      goto LABEL_4;
    }
    int v13 = *(void **)(a1[4] + 56);
    id v14 = [v13 userIdentity];
    id v15 = [v14 userRecordID];
    int v16 = [v15 recordName];
    uint64_t v17 = a1[5];
    uint64_t v18 = a1[6];
    id v21 = 0;
    LODWORD(v13) = +[HDSummarySharingEntryEntity updateOwnerParticipant:v13 cloudKitIdentifier:v16 predicate:v17 profile:v18 error:&v21];
    id v9 = v21;

    if (!v13)
    {
      id v19 = v9;
      BOOL v11 = v19 == 0;
      if (v19)
      {
        if (a3) {
          *a3 = v19;
        }
        else {
          _HKLogDroppedError();
        }
      }

      goto LABEL_15;
    }
  }

LABEL_4:
  if (![*(id *)(*(void *)(a1[7] + 8) + 40) direction] && *(void *)(a1[4] + 32) >= 2uLL)
  {
    id v19 = [*(id *)(*(void *)(a1[7] + 8) + 40) UUID];
    +[HDSummarySharingEntryEntity updatePauseStateForEntryWithUUID:v19 shouldPause:0];
    BOOL v11 = 1;
LABEL_15:

    return v11;
  }
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDUpdateCodableSummarySharingEntryOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InvitationUUID"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"Status"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DateModified"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DateAccepted"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OwnerParticipant"];

  v10 = [(HDUpdateCodableSummarySharingEntryOperation *)self initWithInvitationUUID:v5 status:v6 dateModified:v7 dateAccepted:v8 ownerParticipant:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  invitationUUID = self->_invitationUUID;
  id v5 = a3;
  [v5 encodeObject:invitationUUID forKey:@"InvitationUUID"];
  [v5 encodeInteger:self->_status forKey:@"Status"];
  [v5 encodeObject:self->_dateModified forKey:@"DateModified"];
  [v5 encodeObject:self->_dateAccepted forKey:@"DateAccepted"];
  [v5 encodeObject:self->_ownerParticipant forKey:@"OwnerParticipant"];
}

- (NSUUID)invitationUUID
{
  return self->_invitationUUID;
}

- (HKSummarySharingEntry)sharingEntry
{
  return self->_sharingEntry;
}

- (int64_t)status
{
  return self->_status;
}

- (NSDate)dateModified
{
  return self->_dateModified;
}

- (NSDate)dateAccepted
{
  return self->_dateAccepted;
}

- (CKShareParticipant)ownerParticipant
{
  return self->_ownerParticipant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerParticipant, 0);
  objc_storeStrong((id *)&self->_dateAccepted, 0);
  objc_storeStrong((id *)&self->_dateModified, 0);
  objc_storeStrong((id *)&self->_sharingEntry, 0);

  objc_storeStrong((id *)&self->_invitationUUID, 0);
}

@end