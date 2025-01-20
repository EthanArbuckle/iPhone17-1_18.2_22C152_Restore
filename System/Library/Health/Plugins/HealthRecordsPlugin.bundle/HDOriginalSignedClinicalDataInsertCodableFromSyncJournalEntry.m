@interface HDOriginalSignedClinicalDataInsertCodableFromSyncJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (HDOriginalSignedClinicalDataInsertCodableFromSyncJournalEntry)initWithCodableRecords:(id)a3 syncProvenance:(int64_t)a4;
- (HDOriginalSignedClinicalDataInsertCodableFromSyncJournalEntry)initWithCoder:(id)a3;
- (NSArray)records;
- (int64_t)syncIdentity;
- (int64_t)syncProvenance;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDOriginalSignedClinicalDataInsertCodableFromSyncJournalEntry

- (HDOriginalSignedClinicalDataInsertCodableFromSyncJournalEntry)initWithCodableRecords:(id)a3 syncProvenance:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDOriginalSignedClinicalDataInsertCodableFromSyncJournalEntry;
  v7 = [(HDOriginalSignedClinicalDataInsertCodableFromSyncJournalEntry *)&v11 init];
  if (v7)
  {
    v8 = (NSArray *)[v6 copy];
    records = v7->_records;
    v7->_records = v8;

    v7->_syncProvenance = a4;
  }

  return v7;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v24;
    *(void *)&long long v8 = 138543618;
    long long v21 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "records", v21);
        id v14 = [v12 syncProvenance];
        id v22 = 0;
        unsigned __int8 v15 = +[HDOriginalSignedClinicalDataRecordEntity insertCodableOriginalRecordsFromSync:v13 syncProvenance:v14 profile:v6 error:&v22];
        id v16 = v22;

        if ((v15 & 1) == 0)
        {
          _HKInitializeLogging();
          v17 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            v18 = v17;
            v19 = (objc_class *)objc_opt_class();
            v20 = NSStringFromClass(v19);
            *(_DWORD *)buf = v21;
            v28 = v20;
            __int16 v29 = 2114;
            id v30 = v16;
            _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "%{public}@ failed to insert journaled SYNCED Signed Clnical Data original records: %{public}@", buf, 0x16u);
          }
        }
      }
      id v9 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v9);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDOriginalSignedClinicalDataInsertCodableFromSyncJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = +[NSSet hk_typesForArrayOf:objc_opt_class()];
  id v6 = [v4 decodeObjectOfClasses:v5 forKey:@"codableOriginalRecords"];
  if (v6 && ([v4 containsValueForKey:@"syncProvenance"] & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)HDOriginalSignedClinicalDataInsertCodableFromSyncJournalEntry;
    id v7 = [(HDOriginalSignedClinicalDataInsertCodableFromSyncJournalEntry *)&v12 initWithCoder:v4];
    if (v7)
    {
      long long v8 = (NSArray *)[v6 copy];
      records = v7->_records;
      v7->_records = v8;

      v7->_syncProvenance = (int64_t)[v4 decodeIntegerForKey:@"syncProvenance"];
    }
    self = v7;
    uint64_t v10 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HDOriginalSignedClinicalDataInsertCodableFromSyncJournalEntry *)self records];
  [v4 encodeObject:v5 forKey:@"codableOriginalRecords"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HDOriginalSignedClinicalDataInsertCodableFromSyncJournalEntry syncProvenance](self, "syncProvenance"), @"syncProvenance");
  v6.receiver = self;
  v6.super_class = (Class)HDOriginalSignedClinicalDataInsertCodableFromSyncJournalEntry;
  [(HDOriginalSignedClinicalDataInsertCodableFromSyncJournalEntry *)&v6 encodeWithCoder:v4];
}

- (NSArray)records
{
  return self->_records;
}

- (int64_t)syncProvenance
{
  return self->_syncProvenance;
}

- (int64_t)syncIdentity
{
  return self->_syncIdentity;
}

- (void).cxx_destruct
{
}

@end