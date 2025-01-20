@interface HDObjectAuthorizationJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (HDObjectAuthorizationJournalEntry)initWithCoder:(id)a3;
- (NSArray)records;
- (double)modificationDate;
- (int64_t)syncIdentity;
- (int64_t)syncProvenance;
- (void)encodeWithCoder:(id)a3;
- (void)setModificationDate:(double)a3;
- (void)setRecords:(id)a3;
- (void)setSyncIdentity:(int64_t)a3;
- (void)setSyncProvenance:(int64_t)a3;
@end

@implementation HDObjectAuthorizationJournalEntry

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v41;
    while (2)
    {
      uint64_t v11 = 0;
      uint64_t v38 = v9;
      do
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v13 = [v6 syncIdentityManager];
          v14 = [v13 legacySyncIdentity];
          v15 = [v14 entity];
          uint64_t v16 = [v15 persistentID];

          if ([v12 syncIdentity] != -1) {
            uint64_t v16 = [v12 syncIdentity];
          }
          v17 = [v12 records];
          uint64_t v18 = [v12 syncProvenance];
          id v39 = 0;
          BOOL v19 = +[HDObjectAuthorizationEntity setObjectAuthorizationRecords:v17 syncProvenance:v18 syncIdentity:v16 profile:v6 error:&v39];
          id v20 = v39;

          if (!v19)
          {
            _HKInitializeLogging();
            v21 = (void *)*MEMORY[0x1E4F29F18];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
            {
              v35 = v21;
              v36 = objc_opt_class();
              *(_DWORD *)buf = 138543618;
              v45 = v36;
              __int16 v46 = 2114;
              id v47 = v20;
              id v37 = v36;
              _os_log_error_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_ERROR, "Failed to apply %{public}@: %{public}@", buf, 0x16u);
            }
            if (objc_msgSend(v20, "hk_isTransactionInterruptedError"))
            {

              goto LABEL_21;
            }
            v22 = [NSString stringWithFormat:@"%@", objc_opt_class()];
            v23 = [v6 daemon];
            v24 = [v23 autoBugCaptureReporter];
            id v25 = v6;
            uint64_t v26 = v10;
            id v27 = v7;
            v28 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "syncProvenance"));
            [v24 reportJournalFailureWithErrorDescription:v22 provenance:v28 error:v20];

            id v7 = v27;
            uint64_t v10 = v26;
            id v6 = v25;
          }
          uint64_t v9 = v38;
        }
        else
        {
          _HKInitializeLogging();
          v29 = (void *)*MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            v30 = v29;
            v31 = objc_opt_class();
            id v32 = v31;
            v33 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v45 = v31;
            __int16 v46 = 2114;
            id v47 = v33;
            id v34 = v33;
            _os_log_error_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_ERROR, "Attempt to apply entry of class %{public}@ via class %{public}@", buf, 0x16u);
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_21:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDObjectAuthorizationJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDObjectAuthorizationJournalEntry;
  id v5 = [(HDJournalEntry *)&v14 initWithCoder:v4];
  if (v5)
  {
    int v6 = [v4 containsValueForKey:@"records"];
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    if (v6) {
      uint64_t v9 = {;
    }
      uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"records"];

      objc_msgSend(v10, "hk_map:", &__block_literal_global_172);
    }
    else {
      uint64_t v10 = {;
    }
      [v4 decodeObjectOfClasses:v10 forKey:@"expectedRecords"];
    uint64_t v11 = };
    records = v5->_records;
    v5->_records = (NSArray *)v11;

    v5->_syncProvenance = [v4 decodeInt64ForKey:@"sp"];
    v5->_syncIdentity = -1;
    if ([v4 containsValueForKey:@"syncIdentity"]) {
      v5->_syncIdentity = [v4 decodeInt64ForKey:@"syncIdentity"];
    }
  }

  return v5;
}

id __51__HDObjectAuthorizationJournalEntry_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F2B2B8];
  id v3 = a2;
  id v4 = objc_alloc_init(v2);
  id v5 = [v3 objectUUID];
  [v4 setObjectUUID:v5];

  int v6 = [v3 sourceUUID];
  [v4 setSourceUUID:v6];

  objc_msgSend(v4, "setStatus:", objc_msgSend(v3, "status"));
  [v3 modificationDate];
  objc_msgSend(v4, "setModificationDate:");
  id v7 = [v3 sessionUUID];

  [v4 setSessionUUID:v7];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  records = self->_records;
  id v5 = a3;
  [v5 encodeObject:records forKey:@"expectedRecords"];
  [v5 encodeInt64:self->_syncProvenance forKey:@"sp"];
  [v5 encodeInt64:self->_syncIdentity forKey:@"syncIdentity"];
}

- (NSArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(double)a3
{
  self->_modificationDate = a3;
}

- (int64_t)syncProvenance
{
  return self->_syncProvenance;
}

- (void)setSyncProvenance:(int64_t)a3
{
  self->_syncProvenance = a3;
}

- (int64_t)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(int64_t)a3
{
  self->_syncIdentity = a3;
}

- (void).cxx_destruct
{
}

@end