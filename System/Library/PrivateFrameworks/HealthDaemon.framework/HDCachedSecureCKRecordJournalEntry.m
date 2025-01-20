@interface HDCachedSecureCKRecordJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (HDCachedSecureCKRecordJournalEntry)initWithCoder:(id)a3;
- (NSData)recordData;
- (int64_t)recordID;
- (void)encodeWithCoder:(id)a3;
- (void)setRecordData:(id)a3;
- (void)setRecordID:(int64_t)a3;
@end

@implementation HDCachedSecureCKRecordJournalEntry

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = [v12 recordID];
          v14 = [v12 recordData];
          id v30 = 0;
          BOOL v15 = +[HDCachedSecureCKRecordEntity insertOrUpdateWithRecordID:v13 recordData:v14 profile:v6 error:&v30];
          id v16 = v30;

          if (!v15)
          {
            _HKInitializeLogging();
            v17 = (void *)*MEMORY[0x1E4F29F18];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
            {
              v27 = v17;
              v28 = objc_opt_class();
              *(_DWORD *)buf = 138543618;
              v36 = v28;
              __int16 v37 = 2114;
              id v38 = v16;
              id v29 = v28;
              _os_log_error_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_ERROR, "Failed to apply %{public}@: %{public}@", buf, 0x16u);
            }
            if (objc_msgSend(v16, "hk_isTransactionInterruptedError"))
            {

              goto LABEL_19;
            }
            v18 = [NSString stringWithFormat:@"%@", objc_opt_class()];
            v19 = [v6 daemon];
            v20 = [v19 autoBugCaptureReporter];
            [v20 reportJournalFailureWithErrorDescription:v18 provenance:0 error:v16];
          }
        }
        else
        {
          _HKInitializeLogging();
          v21 = (void *)*MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            v22 = v21;
            v23 = objc_opt_class();
            id v24 = v23;
            v25 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v36 = v23;
            __int16 v37 = 2114;
            id v38 = v25;
            id v26 = v25;
            _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "Attempt to apply entry of class %{public}@ via class %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v9) {
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

- (HDCachedSecureCKRecordJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDCachedSecureCKRecordJournalEntry;
  id v5 = [(HDJournalEntry *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_recordID = [v4 decodeInt64ForKey:@"journal_entry_record_id"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"journal_entry_record_data"];
    recordData = v5->_recordData;
    v5->_recordData = (NSData *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t recordID = self->_recordID;
  id v5 = a3;
  [v5 encodeInt64:recordID forKey:@"journal_entry_record_id"];
  [v5 encodeObject:self->_recordData forKey:@"journal_entry_record_data"];
}

- (int64_t)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(int64_t)a3
{
  self->_int64_t recordID = a3;
}

- (NSData)recordData
{
  return self->_recordData;
}

- (void)setRecordData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end