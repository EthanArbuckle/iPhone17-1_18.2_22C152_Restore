@interface HDClinicalAccountManagerEndLoginSessionJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (HDClinicalAccountManagerEndLoginSessionJournalEntry)initWithCode:(id)a3 state:(id)a4;
- (HDClinicalAccountManagerEndLoginSessionJournalEntry)initWithCoder:(id)a3;
- (NSString)code;
- (NSUUID)state;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDClinicalAccountManagerEndLoginSessionJournalEntry

- (HDClinicalAccountManagerEndLoginSessionJournalEntry)initWithCode:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDClinicalAccountManagerEndLoginSessionJournalEntry;
  v8 = [(HDClinicalAccountManagerEndLoginSessionJournalEntry *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    code = v8->_code;
    v8->_code = v9;

    v11 = (NSUUID *)[v7 copy];
    state = v8->_state;
    v8->_state = v11;
  }
  return v8;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 healthRecordsExtension];
  v8 = [v7 accountManager];

  if (v8)
  {
    id v18 = v6;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_super v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v15 = [v14 state];
          v16 = [v14 code];
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_3C950;
          v19[3] = &unk_1131A0;
          id v20 = v15;
          id v17 = v15;
          [v8 endLoginSessionWithState:v17 code:v16 completion:v19];
        }
        id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    id v6 = v18;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_AE310();
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDClinicalAccountManagerEndLoginSessionJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"code"];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    if (v6)
    {
      v14.receiver = self;
      v14.super_class = (Class)HDClinicalAccountManagerEndLoginSessionJournalEntry;
      id v7 = [(HDClinicalAccountManagerEndLoginSessionJournalEntry *)&v14 initWithCoder:v4];
      if (v7)
      {
        v8 = (NSString *)[v5 copy];
        code = v7->_code;
        v7->_code = v8;

        id v10 = (NSUUID *)[v6 copy];
        state = v7->_state;
        v7->_state = v10;
      }
      self = v7;
      uint64_t v12 = self;
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      uint64_t v12 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HDClinicalAccountManagerEndLoginSessionJournalEntry *)self code];
  [v4 encodeObject:v5 forKey:@"code"];

  id v6 = [(HDClinicalAccountManagerEndLoginSessionJournalEntry *)self state];
  [v4 encodeObject:v6 forKey:@"state"];

  v7.receiver = self;
  v7.super_class = (Class)HDClinicalAccountManagerEndLoginSessionJournalEntry;
  [(HDClinicalAccountManagerEndLoginSessionJournalEntry *)&v7 encodeWithCoder:v4];
}

- (NSString)code
{
  return self->_code;
}

- (NSUUID)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);

  objc_storeStrong((id *)&self->_code, 0);
}

@end