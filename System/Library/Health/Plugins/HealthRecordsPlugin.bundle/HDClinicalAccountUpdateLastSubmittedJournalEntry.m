@interface HDClinicalAccountUpdateLastSubmittedJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (HDClinicalAccountUpdateLastSubmittedJournalEntry)initWithCoder:(id)a3;
- (HDClinicalAccountUpdateLastSubmittedJournalEntry)initWithLastSubmittedRowID:(id)a3 expectedRulesVersion:(id)a4 accountIdentifier:(id)a5;
- (NSNumber)expectedRulesVersion;
- (NSNumber)lastSubmittedRowID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDClinicalAccountUpdateLastSubmittedJournalEntry

- (HDClinicalAccountUpdateLastSubmittedJournalEntry)initWithLastSubmittedRowID:(id)a3 expectedRulesVersion:(id)a4 accountIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDClinicalAccountUpdateLastSubmittedJournalEntry;
  v10 = [(HDClinicalAccountEntityUpdateJournalEntry *)&v16 initWithAccountIdentifier:a5];
  if (v10)
  {
    v11 = (NSNumber *)[v8 copy];
    lastSubmittedRowID = v10->_lastSubmittedRowID;
    v10->_lastSubmittedRowID = v11;

    v13 = (NSNumber *)[v9 copy];
    expectedRulesVersion = v10->_expectedRulesVersion;
    v10->_expectedRulesVersion = v13;
  }
  return v10;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v5;
  id v7 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v26;
    *(void *)&long long v8 = 138543362;
    long long v21 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "lastSubmittedRowID", v21);
        v14 = [v12 expectedRulesVersion];
        v15 = [v12 accountIdentifier];
        objc_super v16 = [v6 database];
        id v24 = 0;
        unsigned __int8 v17 = +[HDClinicalAccountEntity updateAccountLastSubmittedRowID:v13 expectedRulesVersion:v14 identifier:v15 healthDatabase:v16 error:&v24];
        id v18 = v24;

        if ((v17 & 1) == 0)
        {
          unsigned int v19 = objc_msgSend(v18, "hk_isDatabaseAccessibilityError");
          _HKInitializeLogging();
          v20 = HKLogHealthRecords;
          if (v19)
          {
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              id v30 = a1;
              __int16 v31 = 2114;
              id v32 = v18;
              _os_log_error_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "%{public}@ failed to update journaled clinical account last submitted row ID: %{public}@", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v21;
            id v30 = v18;
            _os_log_fault_impl(&dword_0, v20, OS_LOG_TYPE_FAULT, "HDClinicalAccountUpdateLastSubmittedJournalEntry failed to update journaled clinical account last submitted row ID: %{public}@", buf, 0xCu);
          }
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v9);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDClinicalAccountUpdateLastSubmittedJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expectedRulesVersion"];
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)HDClinicalAccountUpdateLastSubmittedJournalEntry;
    id v6 = [(HDClinicalAccountEntityUpdateJournalEntry *)&v11 initWithCoder:v4];
    if (v6)
    {
      uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastSubmittedRowID"];
      lastSubmittedRowID = v6->_lastSubmittedRowID;
      v6->_lastSubmittedRowID = (NSNumber *)v7;

      objc_storeStrong((id *)&v6->_expectedRulesVersion, v5);
    }
    self = v6;
    id v9 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    id v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HDClinicalAccountUpdateLastSubmittedJournalEntry *)self lastSubmittedRowID];
  [v4 encodeObject:v5 forKey:@"lastSubmittedRowID"];

  id v6 = [(HDClinicalAccountUpdateLastSubmittedJournalEntry *)self expectedRulesVersion];
  [v4 encodeObject:v6 forKey:@"expectedRulesVersion"];

  v7.receiver = self;
  v7.super_class = (Class)HDClinicalAccountUpdateLastSubmittedJournalEntry;
  [(HDClinicalAccountEntityUpdateJournalEntry *)&v7 encodeWithCoder:v4];
}

- (NSNumber)lastSubmittedRowID
{
  return self->_lastSubmittedRowID;
}

- (NSNumber)expectedRulesVersion
{
  return self->_expectedRulesVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedRulesVersion, 0);

  objc_storeStrong((id *)&self->_lastSubmittedRowID, 0);
}

@end