@interface HDOriginalSignedClinicalDataInsertCodableJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (BOOL)shouldReplace;
- (HDOriginalSignedClinicalDataInsertCodableJournalEntry)initWithCodableRecords:(id)a3 shouldReplace:(BOOL)a4 syncProvenance:(int64_t)a5;
- (HDOriginalSignedClinicalDataInsertCodableJournalEntry)initWithCoder:(id)a3;
- (NSArray)records;
- (int64_t)syncIdentity;
- (int64_t)syncProvenance;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDOriginalSignedClinicalDataInsertCodableJournalEntry

- (HDOriginalSignedClinicalDataInsertCodableJournalEntry)initWithCodableRecords:(id)a3 shouldReplace:(BOOL)a4 syncProvenance:(int64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDOriginalSignedClinicalDataInsertCodableJournalEntry;
  v9 = [(HDOriginalSignedClinicalDataInsertCodableJournalEntry *)&v13 init];
  if (v9)
  {
    v10 = (NSArray *)[v8 copy];
    records = v9->_records;
    v9->_records = v10;

    v9->_shouldReplace = a4;
    v9->_syncProvenance = a5;
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
  id v7 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v25;
    *(void *)&long long v8 = 138543618;
    long long v22 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_super v13 = objc_msgSend(v12, "records", v22);
        id v14 = [v12 shouldReplace];
        id v15 = [v12 syncProvenance];
        id v23 = 0;
        unsigned __int8 v16 = +[HDOriginalSignedClinicalDataRecordEntity insertCodableOriginalRecords:v13 shouldReplace:v14 syncProvenance:v15 profile:v6 error:&v23];
        id v17 = v23;

        if ((v16 & 1) == 0)
        {
          _HKInitializeLogging();
          v18 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            v19 = v18;
            v20 = (objc_class *)objc_opt_class();
            v21 = NSStringFromClass(v20);
            *(_DWORD *)buf = v22;
            v29 = v21;
            __int16 v30 = 2114;
            id v31 = v17;
            _os_log_error_impl(&dword_0, v19, OS_LOG_TYPE_ERROR, "%{public}@ failed to insert journaled Signed Clnical Data original records: %{public}@", buf, 0x16u);
          }
        }
      }
      id v9 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v9);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDOriginalSignedClinicalDataInsertCodableJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = +[NSSet hk_typesForArrayOf:objc_opt_class()];
  id v6 = [v4 decodeObjectOfClasses:v5 forKey:@"codableOriginalRecords"];
  if (v6
    && [v4 containsValueForKey:@"shouldReplace"]
    && ([v4 containsValueForKey:@"syncProvenance"] & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)HDOriginalSignedClinicalDataInsertCodableJournalEntry;
    id v7 = [(HDOriginalSignedClinicalDataInsertCodableJournalEntry *)&v12 initWithCoder:v4];
    if (v7)
    {
      long long v8 = (NSArray *)[v6 copy];
      records = v7->_records;
      v7->_records = v8;

      v7->_shouldReplace = [v4 decodeBoolForKey:@"shouldReplace"];
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
  id v5 = [(HDOriginalSignedClinicalDataInsertCodableJournalEntry *)self records];
  [v4 encodeObject:v5 forKey:@"codableOriginalRecords"];

  objc_msgSend(v4, "encodeBool:forKey:", -[HDOriginalSignedClinicalDataInsertCodableJournalEntry shouldReplace](self, "shouldReplace"), @"shouldReplace");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HDOriginalSignedClinicalDataInsertCodableJournalEntry syncProvenance](self, "syncProvenance"), @"syncProvenance");
  v6.receiver = self;
  v6.super_class = (Class)HDOriginalSignedClinicalDataInsertCodableJournalEntry;
  [(HDOriginalSignedClinicalDataInsertCodableJournalEntry *)&v6 encodeWithCoder:v4];
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

- (BOOL)shouldReplace
{
  return self->_shouldReplace;
}

- (void).cxx_destruct
{
}

@end