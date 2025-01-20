@interface HDClinicalAccountUpdateCredentialStateJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (HDClinicalAccountUpdateCredentialStateJournalEntry)initWithCoder:(id)a3;
- (HDClinicalAccountUpdateCredentialStateJournalEntry)initWithCredentialState:(int64_t)a3 accountIdentifier:(id)a4 event:(id)a5;
- (HKClinicalAccountEvent)event;
- (int64_t)credentialState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDClinicalAccountUpdateCredentialStateJournalEntry

- (HDClinicalAccountUpdateCredentialStateJournalEntry)initWithCredentialState:(int64_t)a3 accountIdentifier:(id)a4 event:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HDClinicalAccountUpdateCredentialStateJournalEntry;
  v9 = [(HDClinicalAccountEntityUpdateJournalEntry *)&v14 initWithAccountIdentifier:a4];
  v10 = v9;
  if (v9)
  {
    v9->_credentialState = a3;
    v11 = (HKClinicalAccountEvent *)[v8 copy];
    event = v10->_event;
    v10->_event = v11;
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
        id v13 = objc_msgSend(v12, "credentialState", v21);
        objc_super v14 = [v12 accountIdentifier];
        v15 = [v6 database];
        v16 = [v12 event];
        id v24 = 0;
        unsigned __int8 v17 = +[HDClinicalAccountEntity updateAccountCredentialState:v13 identifier:v14 profile:v6 healthDatabase:v15 event:v16 error:&v24];
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
              _os_log_error_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "%{public}@ failed to update journaled clinical account relogin needed: %{public}@", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v21;
            id v30 = v18;
            _os_log_fault_impl(&dword_0, v20, OS_LOG_TYPE_FAULT, "HDClinicalAccountUpdateCredentialStateJournalEntry failed to update journaled clinical account relogin needed: %{public}@", buf, 0xCu);
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

- (HDClinicalAccountUpdateCredentialStateJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"event"];
  if (v5 && ([v4 containsValueForKey:@"credentialState"] & 1) != 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)HDClinicalAccountUpdateCredentialStateJournalEntry;
    id v6 = [(HDClinicalAccountEntityUpdateJournalEntry *)&v11 initWithCoder:v4];
    if (v6)
    {
      v6->_credentialState = (int)[v4 decodeIntForKey:@"credentialState"];
      id v7 = (HKClinicalAccountEvent *)[v5 copy];
      event = v6->_event;
      v6->_event = v7;
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
  objc_msgSend(v4, "encodeInteger:forKey:", -[HDClinicalAccountUpdateCredentialStateJournalEntry credentialState](self, "credentialState"), @"credentialState");
  id v5 = [(HDClinicalAccountUpdateCredentialStateJournalEntry *)self event];
  [v4 encodeObject:v5 forKey:@"event"];

  v6.receiver = self;
  v6.super_class = (Class)HDClinicalAccountUpdateCredentialStateJournalEntry;
  [(HDClinicalAccountEntityUpdateJournalEntry *)&v6 encodeWithCoder:v4];
}

- (int64_t)credentialState
{
  return self->_credentialState;
}

- (HKClinicalAccountEvent)event
{
  return self->_event;
}

- (void).cxx_destruct
{
}

@end