@interface HDCachedSecureDeleteCKRecordJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (HDCachedSecureDeleteCKRecordJournalEntry)initWithCoder:(id)a3;
- (int64_t)recordID;
- (void)encodeWithCoder:(id)a3;
- (void)setRecordID:(int64_t)a3;
@end

@implementation HDCachedSecureDeleteCKRecordJournalEntry

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = HDPredicateForRecordID([v11 recordID]);
          v13 = [v6 database];
          id v30 = 0;
          BOOL v14 = +[HDHealthEntity deleteEntitiesWithPredicate:v12 healthDatabase:v13 error:&v30];
          id v15 = v30;

          if (!v14)
          {
            _HKInitializeLogging();
            v16 = (void *)*MEMORY[0x1E4F29F18];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
            {
              v26 = v16;
              v27 = objc_opt_class();
              *(_DWORD *)buf = 138543618;
              v36 = v27;
              __int16 v37 = 2114;
              id v38 = v15;
              id v28 = v27;
              _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "Failed to apply %{public}@: %{public}@", buf, 0x16u);
            }
            if (objc_msgSend(v15, "hk_isTransactionInterruptedError"))
            {

              goto LABEL_19;
            }
            v17 = [NSString stringWithFormat:@"%@", objc_opt_class()];
            v18 = [v6 daemon];
            v19 = [v18 autoBugCaptureReporter];
            [v19 reportJournalFailureWithErrorDescription:v17 provenance:0 error:v15];
          }
        }
        else
        {
          _HKInitializeLogging();
          v20 = (void *)*MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            v21 = v20;
            v22 = objc_opt_class();
            id v23 = v22;
            v24 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v36 = v22;
            __int16 v37 = 2114;
            id v38 = v24;
            id v25 = v24;
            _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "Attempt to apply entry of class %{public}@ via class %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_19:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDCachedSecureDeleteCKRecordJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HDCachedSecureDeleteCKRecordJournalEntry;
  id v5 = [(HDJournalEntry *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_recordID = [v4 decodeInt64ForKey:@"journal_entry_record_id"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (int64_t)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(int64_t)a3
{
  self->_recordID = a3;
}

@end