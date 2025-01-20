@interface _HDDataManagerDeletionJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (HDDataDeletionConfiguration)configuration;
- (HKUUIDCollection)UUIDCollection;
- (_HDDataManagerDeletionJournalEntry)initWithCoder:(id)a3;
- (_HDDataManagerDeletionJournalEntry)initWithConfiguration:(id)a3 objectUUIDs:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HDDataManagerDeletionJournalEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v12 = [v6 dataManager];
        v13 = [v11 UUIDCollection];
        v14 = [v11 configuration];
        id v25 = 0;
        char v15 = [v12 deleteObjectsWithUUIDCollection:v13 configuration:v14 error:&v25];
        id v16 = v25;

        if ((v15 & 1) == 0)
        {
          _HKInitializeLogging();
          v17 = (void *)*MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            v21 = v17;
            v22 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v31 = v22;
            __int16 v32 = 2114;
            id v33 = v16;
            id v23 = v22;
            _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "Failed to apply %{public}@: %{public}@", buf, 0x16u);
          }
          if (objc_msgSend(v16, "hk_isTransactionInterruptedError"))
          {

            goto LABEL_15;
          }
          v18 = [NSString stringWithFormat:@"%@", objc_opt_class()];
          v19 = [v6 daemon];
          v20 = [v19 autoBugCaptureReporter];
          [v20 reportJournalFailureWithErrorDescription:v18 provenance:0 error:v16];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

- (_HDDataManagerDeletionJournalEntry)initWithConfiguration:(id)a3 objectUUIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HDDataManagerDeletionJournalEntry;
  uint64_t v8 = [(_HDDataManagerDeletionJournalEntry *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    configuration = v8->_configuration;
    v8->_configuration = (HDDataDeletionConfiguration *)v9;

    objc_storeStrong((id *)&v8->_UUIDCollection, a4);
  }

  return v8;
}

- (_HDDataManagerDeletionJournalEntry)initWithCoder:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_HDDataManagerDeletionJournalEntry;
  id v5 = [(HDJournalEntry *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
    configuration = v5->_configuration;
    v5->_configuration = (HDDataDeletionConfiguration *)v6;

    uint64_t v8 = (void *)MEMORY[0x1C187C0E0]();
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuids_data"];
    UUIDCollection = v5->_UUIDCollection;
    v5->_UUIDCollection = (HKUUIDCollection *)v9;

    if (!v5->_UUIDCollection)
    {
      v11 = (void *)MEMORY[0x1E4F1CAD0];
      v18[0] = objc_opt_class();
      v18[1] = objc_opt_class();
      objc_super v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
      v13 = [v11 setWithArray:v12];
      uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"object_uuids"];
      char v15 = v5->_UUIDCollection;
      v5->_UUIDCollection = (HKUUIDCollection *)v14;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_HDDataManagerDeletionJournalEntry;
  [(HDJournalEntry *)&v7 encodeWithCoder:v4];
  id v5 = (void *)MEMORY[0x1C187C0E0]([v4 encodeObject:self->_configuration forKey:@"configuration"]);
  uint64_t v6 = [(HKUUIDCollection *)self->_UUIDCollection hk_dataForAllUUIDs];
  [v4 encodeObject:v6 forKey:@"uuids_data"];
}

- (HKUUIDCollection)UUIDCollection
{
  return self->_UUIDCollection;
}

- (HDDataDeletionConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_UUIDCollection, 0);
}

@end