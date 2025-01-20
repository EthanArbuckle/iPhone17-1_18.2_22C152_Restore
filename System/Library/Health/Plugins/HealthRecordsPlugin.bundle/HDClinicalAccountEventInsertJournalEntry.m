@interface HDClinicalAccountEventInsertJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToClinicalAccountEventInsertJournalEntry:(id)a3;
- (HDClinicalAccountEventInsertJournalEntry)initWithCoder:(id)a3;
- (HDClinicalAccountEventInsertJournalEntry)initWithEvent:(id)a3;
- (HKClinicalAccountEvent)event;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDClinicalAccountEventInsertJournalEntry

- (HDClinicalAccountEventInsertJournalEntry)initWithEvent:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDClinicalAccountEventInsertJournalEntry;
  v5 = [(HDClinicalAccountEventInsertJournalEntry *)&v9 init];
  if (v5)
  {
    v6 = (HKClinicalAccountEvent *)[v4 copy];
    event = v5->_event;
    v5->_event = v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HDClinicalAccountEventInsertJournalEntry *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = [(HDClinicalAccountEventInsertJournalEntry *)self isEqualToClinicalAccountEventInsertJournalEntry:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToClinicalAccountEventInsertJournalEntry:(id)a3
{
  id v4 = (HDClinicalAccountEventInsertJournalEntry *)a3;
  v5 = v4;
  if (self == v4)
  {
    unsigned __int8 v11 = 1;
  }
  else if (v4)
  {
    BOOL v6 = [(HDClinicalAccountEventInsertJournalEntry *)self event];
    v7 = [(HDClinicalAccountEventInsertJournalEntry *)v5 event];
    if (v6 == v7)
    {
      unsigned __int8 v11 = 1;
    }
    else
    {
      v8 = [(HDClinicalAccountEventInsertJournalEntry *)v5 event];
      if (v8)
      {
        objc_super v9 = [(HDClinicalAccountEventInsertJournalEntry *)self event];
        v10 = [(HDClinicalAccountEventInsertJournalEntry *)v5 event];
        unsigned __int8 v11 = [v9 isEqual:v10];
      }
      else
      {
        unsigned __int8 v11 = 0;
      }
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v20;
    *(void *)&long long v8 = 138543618;
    long long v16 = v8;
    do
    {
      unsigned __int8 v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v5);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v11), "event", v16);
        id v18 = 0;
        unsigned __int8 v13 = +[HDClinicalAccountEventEntity insertEvent:v12 profile:v6 error:&v18];
        id v14 = v18;

        if ((v13 & 1) == 0)
        {
          _HKInitializeLogging();
          v15 = HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            id v24 = a1;
            __int16 v25 = 2114;
            id v26 = v14;
            _os_log_error_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "%{public}@ failed to insert journaled clinical account event: %{public}@", buf, 0x16u);
          }
        }

        unsigned __int8 v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v9);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDClinicalAccountEventInsertJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"event"];
  if (v5)
  {
    self = [(HDClinicalAccountEventInsertJournalEntry *)self initWithEvent:v5];
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
  id v5 = [(HDClinicalAccountEventInsertJournalEntry *)self event];
  [v4 encodeObject:v5 forKey:@"event"];

  v6.receiver = self;
  v6.super_class = (Class)HDClinicalAccountEventInsertJournalEntry;
  [(HDClinicalAccountEventInsertJournalEntry *)&v6 encodeWithCoder:v4];
}

- (HKClinicalAccountEvent)event
{
  return self->_event;
}

- (void).cxx_destruct
{
}

@end