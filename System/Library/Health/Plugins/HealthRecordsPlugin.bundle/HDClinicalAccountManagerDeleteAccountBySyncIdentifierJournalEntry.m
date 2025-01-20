@interface HDClinicalAccountManagerDeleteAccountBySyncIdentifierJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (HDClinicalAccountManagerDeleteAccountBySyncIdentifierJournalEntry)initWithAccountSyncIdentifier:(id)a3 deletionReason:(int64_t)a4;
- (HDClinicalAccountManagerDeleteAccountBySyncIdentifierJournalEntry)initWithCoder:(id)a3;
- (NSUUID)accountSyncIdentifier;
- (int64_t)deletionReason;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDClinicalAccountManagerDeleteAccountBySyncIdentifierJournalEntry

- (HDClinicalAccountManagerDeleteAccountBySyncIdentifierJournalEntry)initWithAccountSyncIdentifier:(id)a3 deletionReason:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDClinicalAccountManagerDeleteAccountBySyncIdentifierJournalEntry;
  v7 = [(HDClinicalAccountManagerDeleteAccountBySyncIdentifierJournalEntry *)&v11 init];
  if (v7)
  {
    v8 = (NSUUID *)[v6 copy];
    accountSyncIdentifier = v7->_accountSyncIdentifier;
    v7->_accountSyncIdentifier = v8;

    v7->_deletionReason = a4;
  }

  return v7;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 healthRecordsExtension];
  if (v7)
  {
    id v20 = v6;
    id v21 = v5;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "accountSyncIdentifier", v20, v21);
          v15 = [v7 accountManager];
          id v16 = [v13 deletionReason];
          id v22 = 0;
          unsigned __int8 v17 = [v15 deleteAccountWithSyncIdentifier:v14 deletionReason:v16 error:&v22];
          id v18 = v22;

          if ((v17 & 1) == 0)
          {
            _HKInitializeLogging();
            v19 = HKLogDatabase;
            if (os_log_type_enabled(HKLogDatabase, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v28 = v14;
              __int16 v29 = 2114;
              id v30 = v18;
              _os_log_error_impl(&dword_0, v19, OS_LOG_TYPE_ERROR, "Journal: unable to delete account with sync identifier %{public}@: %{public}@", buf, 0x16u);
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v10);
    }

    id v6 = v20;
    id v5 = v21;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_AE42C();
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDClinicalAccountManagerDeleteAccountBySyncIdentifierJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountSyncIdentifier"];
  if (v5)
  {
    if ([v4 containsValueForKey:@"deletionReason"]) {
      id v6 = [v4 decodeIntegerForKey:@"deletionReason"];
    }
    else {
      id v6 = 0;
    }
    self = [(HDClinicalAccountManagerDeleteAccountBySyncIdentifierJournalEntry *)self initWithAccountSyncIdentifier:v5 deletionReason:v6];
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
  id v5 = [(HDClinicalAccountManagerDeleteAccountBySyncIdentifierJournalEntry *)self accountSyncIdentifier];
  [v4 encodeObject:v5 forKey:@"accountSyncIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HDClinicalAccountManagerDeleteAccountBySyncIdentifierJournalEntry deletionReason](self, "deletionReason"), @"deletionReason");
  v6.receiver = self;
  v6.super_class = (Class)HDClinicalAccountManagerDeleteAccountBySyncIdentifierJournalEntry;
  [(HDClinicalAccountManagerDeleteAccountBySyncIdentifierJournalEntry *)&v6 encodeWithCoder:v4];
}

- (NSUUID)accountSyncIdentifier
{
  return self->_accountSyncIdentifier;
}

- (int64_t)deletionReason
{
  return self->_deletionReason;
}

- (void).cxx_destruct
{
}

@end