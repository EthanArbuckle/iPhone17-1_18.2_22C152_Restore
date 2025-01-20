@interface HDClinicalAccountUpdateLastFetchDateJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (BOOL)wasFullFetch;
- (HDClinicalAccountUpdateLastFetchDateJournalEntry)initWithCoder:(id)a3;
- (HDClinicalAccountUpdateLastFetchDateJournalEntry)initWithLastFetchDate:(id)a3 wasFullFetch:(BOOL)a4 accountIdentifier:(id)a5;
- (NSDate)lastFetchDate;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDClinicalAccountUpdateLastFetchDateJournalEntry

- (HDClinicalAccountUpdateLastFetchDateJournalEntry)initWithLastFetchDate:(id)a3 wasFullFetch:(BOOL)a4 accountIdentifier:(id)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDClinicalAccountUpdateLastFetchDateJournalEntry;
  v9 = [(HDClinicalAccountEntityUpdateJournalEntry *)&v13 initWithAccountIdentifier:a5];
  if (v9)
  {
    v10 = (NSDate *)[v8 copy];
    lastFetchDate = v9->_lastFetchDate;
    v9->_lastFetchDate = v10;

    v9->_wasFullFetch = a4;
  }

  return v9;
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
        objc_super v13 = objc_msgSend(v12, "lastFetchDate", v20);
        id v14 = [v12 wasFullFetch];
        v15 = [v12 accountIdentifier];
        v16 = [v6 database];
        id v23 = 0;
        LOBYTE(v14) = +[HDClinicalAccountEntity updateAccountLastFetchDate:v13 wasFullFetch:v14 identifier:v15 profile:v6 healthDatabase:v16 error:&v23];
        id v17 = v23;

        if ((v14 & 1) == 0)
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
              _os_log_error_impl(&dword_0, v19, OS_LOG_TYPE_ERROR, "%{public}@ failed to update journaled clinical account last fetch date: %{public}@", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v20;
            id v29 = v17;
            _os_log_fault_impl(&dword_0, v19, OS_LOG_TYPE_FAULT, "HDClinicalAccountUpdateLastFetchDateJournalEntry failed to update journaled clinical account last fetch date: %{public}@", buf, 0xCu);
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

- (HDClinicalAccountUpdateLastFetchDateJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastFetchDate"];
  if (v5 && ([v4 containsValueForKey:@"wasFullFetch"] & 1) != 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)HDClinicalAccountUpdateLastFetchDateJournalEntry;
    id v6 = [(HDClinicalAccountEntityUpdateJournalEntry *)&v11 initWithCoder:v4];
    if (v6)
    {
      id v7 = (NSDate *)[v5 copy];
      lastFetchDate = v6->_lastFetchDate;
      v6->_lastFetchDate = v7;

      v6->_wasFullFetch = [v4 decodeBoolForKey:@"wasFullFetch"];
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
  id v5 = [(HDClinicalAccountUpdateLastFetchDateJournalEntry *)self lastFetchDate];
  [v4 encodeObject:v5 forKey:@"lastFetchDate"];

  objc_msgSend(v4, "encodeBool:forKey:", -[HDClinicalAccountUpdateLastFetchDateJournalEntry wasFullFetch](self, "wasFullFetch"), @"wasFullFetch");
  v6.receiver = self;
  v6.super_class = (Class)HDClinicalAccountUpdateLastFetchDateJournalEntry;
  [(HDClinicalAccountEntityUpdateJournalEntry *)&v6 encodeWithCoder:v4];
}

- (NSDate)lastFetchDate
{
  return self->_lastFetchDate;
}

- (BOOL)wasFullFetch
{
  return self->_wasFullFetch;
}

- (void).cxx_destruct
{
}

@end