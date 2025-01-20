@interface HDClinicalAccountUpdateUserEnabledJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (BOOL)isUserEnabled;
- (HDClinicalAccountUpdateUserEnabledJournalEntry)initWithCoder:(id)a3;
- (HDClinicalAccountUpdateUserEnabledJournalEntry)initWithUserEnabled:(BOOL)a3 accountIdentifier:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDClinicalAccountUpdateUserEnabledJournalEntry

- (HDClinicalAccountUpdateUserEnabledJournalEntry)initWithUserEnabled:(BOOL)a3 accountIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HDClinicalAccountUpdateUserEnabledJournalEntry;
  result = [(HDClinicalAccountEntityUpdateJournalEntry *)&v6 initWithAccountIdentifier:a4];
  if (result) {
    result->_userEnabled = a3;
  }
  return result;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v5;
  id v7 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v25;
    *(void *)&long long v8 = 138543362;
    long long v20 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "isUserEnabled", v20);
        v14 = [v12 accountIdentifier];
        v15 = [v6 database];
        id v23 = 0;
        unsigned __int8 v16 = +[HDClinicalAccountEntity updateAccountUserEnabled:v13 identifier:v14 profile:v6 healthDatabase:v15 error:&v23];
        id v17 = v23;

        if ((v16 & 1) == 0)
        {
          unsigned int v18 = objc_msgSend(v17, "hk_isDatabaseAccessibilityError");
          _HKInitializeLogging();
          v19 = HKLogHealthRecords;
          if (v18)
          {
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              id v29 = a1;
              __int16 v30 = 2114;
              id v31 = v17;
              _os_log_error_impl(&dword_0, v19, OS_LOG_TYPE_ERROR, "%{public}@ failed to update journaled clinical account user enabled: %{public}@", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v20;
            id v29 = v17;
            _os_log_fault_impl(&dword_0, v19, OS_LOG_TYPE_FAULT, "HDClinicalAccountUpdateUserEnabledJournalEntry failed to update journaled clinical account user enabled: %{public}@", buf, 0xCu);
          }
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v9);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDClinicalAccountUpdateUserEnabledJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"userEnabled"])
  {
    v8.receiver = self;
    v8.super_class = (Class)HDClinicalAccountUpdateUserEnabledJournalEntry;
    id v5 = [(HDClinicalAccountEntityUpdateJournalEntry *)&v8 initWithCoder:v4];
    if (v5) {
      v5->_userEnabled = [v4 decodeBoolForKey:@"userEnabled"];
    }
    self = v5;
    id v6 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    id v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[HDClinicalAccountUpdateUserEnabledJournalEntry isUserEnabled](self, "isUserEnabled"), @"userEnabled");
  v5.receiver = self;
  v5.super_class = (Class)HDClinicalAccountUpdateUserEnabledJournalEntry;
  [(HDClinicalAccountEntityUpdateJournalEntry *)&v5 encodeWithCoder:v4];
}

- (BOOL)isUserEnabled
{
  return self->_userEnabled;
}

@end