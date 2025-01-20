@interface HDClinicalAccountManagerDeleteAccountByIdentifierJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (HDClinicalAccountManagerDeleteAccountByIdentifierJournalEntry)initWithAccountIdentifier:(id)a3 deletionReason:(int64_t)a4;
- (HDClinicalAccountManagerDeleteAccountByIdentifierJournalEntry)initWithCoder:(id)a3;
- (NSUUID)accountIdentifier;
- (int64_t)deletionReason;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDClinicalAccountManagerDeleteAccountByIdentifierJournalEntry

- (HDClinicalAccountManagerDeleteAccountByIdentifierJournalEntry)initWithAccountIdentifier:(id)a3 deletionReason:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDClinicalAccountManagerDeleteAccountByIdentifierJournalEntry;
  v7 = [(HDClinicalAccountManagerDeleteAccountByIdentifierJournalEntry *)&v11 init];
  if (v7)
  {
    v8 = (NSUUID *)[v6 copy];
    accountIdentifier = v7->_accountIdentifier;
    v7->_accountIdentifier = v8;

    v7->_deletionReason = a4;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDClinicalAccountManagerDeleteAccountByIdentifierJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
  if (v5)
  {
    if ([v4 containsValueForKey:@"deletionReason"]) {
      id v6 = [v4 decodeIntegerForKey:@"deletionReason"];
    }
    else {
      id v6 = 0;
    }
    self = [(HDClinicalAccountManagerDeleteAccountByIdentifierJournalEntry *)self initWithAccountIdentifier:v5 deletionReason:v6];
    v7 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HDClinicalAccountManagerDeleteAccountByIdentifierJournalEntry *)self accountIdentifier];
  [v4 encodeObject:v5 forKey:@"accountIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HDClinicalAccountManagerDeleteAccountByIdentifierJournalEntry deletionReason](self, "deletionReason"), @"deletionReason");
  v6.receiver = self;
  v6.super_class = (Class)HDClinicalAccountManagerDeleteAccountByIdentifierJournalEntry;
  [(HDClinicalAccountManagerDeleteAccountByIdentifierJournalEntry *)&v6 encodeWithCoder:v4];
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 healthRecordsExtension];
  if (v7)
  {
    id v22 = v6;
    id v23 = v5;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v26;
      do
      {
        v12 = 0;
        do
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v12);
          v14 = objc_msgSend(v7, "accountManager", v22, v23);
          v15 = [v13 accountIdentifier];
          id v16 = [v13 deletionReason];
          id v24 = 0;
          unsigned __int8 v17 = [v14 deleteAccountWithIdentifier:v15 deletionReason:v16 error:&v24];
          id v18 = v24;

          if ((v17 & 1) == 0)
          {
            _HKInitializeLogging();
            v19 = (void *)HKLogDatabase;
            if (os_log_type_enabled(HKLogDatabase, OS_LOG_TYPE_FAULT))
            {
              v20 = v19;
              v21 = [v13 accountIdentifier];
              *(_DWORD *)buf = 138543618;
              v30 = v21;
              __int16 v31 = 2114;
              id v32 = v18;
              _os_log_fault_impl(&dword_0, v20, OS_LOG_TYPE_FAULT, "HDClinicalAccountManager journal: unable to delete account with identifier %{public}@: %{public}@", buf, 0x16u);
            }
          }

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v10);
    }

    id v6 = v22;
    id v5 = v23;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_AE42C();
    }
  }
}

- (NSUUID)accountIdentifier
{
  return self->_accountIdentifier;
}

- (int64_t)deletionReason
{
  return self->_deletionReason;
}

- (void).cxx_destruct
{
}

@end