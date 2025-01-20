@interface HDSignedClinicalDataIssuerInsertCodableJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (HDSignedClinicalDataIssuerInsertCodableJournalEntry)initWithCoder:(id)a3;
- (HDSignedClinicalDataIssuerInsertCodableJournalEntry)initWithIssuers:(id)a3 syncProvenance:(int64_t)a4;
- (NSArray)issuers;
- (int64_t)syncProvenance;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDSignedClinicalDataIssuerInsertCodableJournalEntry

- (HDSignedClinicalDataIssuerInsertCodableJournalEntry)initWithIssuers:(id)a3 syncProvenance:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDSignedClinicalDataIssuerInsertCodableJournalEntry;
  v7 = [(HDSignedClinicalDataIssuerInsertCodableJournalEntry *)&v11 init];
  if (v7)
  {
    v8 = (NSArray *)[v6 copy];
    issuers = v7->_issuers;
    v7->_issuers = v8;

    v7->_syncProvenance = a4;
  }

  return v7;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v22;
    *(void *)&long long v8 = 138543618;
    long long v18 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "issuers", v18);
        id v14 = [v12 syncProvenance];
        id v20 = 0;
        unsigned __int8 v15 = +[HDSignedClinicalDataIssuerEntity insertCodableIssuers:v13 syncProvenance:v14 profile:v6 error:&v20];
        id v16 = v20;

        if ((v15 & 1) == 0)
        {
          _HKInitializeLogging();
          v17 = HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            id v26 = a1;
            __int16 v27 = 2114;
            id v28 = v16;
            _os_log_error_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "%{public}@ failed to insert journaled Signed Clnical Data issuers: %{public}@", buf, 0x16u);
          }
        }
      }
      id v9 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v9);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDSignedClinicalDataIssuerInsertCodableJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = +[NSSet hk_typesForArrayOf:objc_opt_class()];
  id v6 = [v4 decodeObjectOfClasses:v5 forKey:@"codableIssuers"];
  if (v6 && ([v4 containsValueForKey:@"syncProvenance"] & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)HDSignedClinicalDataIssuerInsertCodableJournalEntry;
    id v7 = [(HDSignedClinicalDataIssuerInsertCodableJournalEntry *)&v12 initWithCoder:v4];
    if (v7)
    {
      long long v8 = (NSArray *)[v6 copy];
      issuers = v7->_issuers;
      v7->_issuers = v8;

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
  id v5 = [(HDSignedClinicalDataIssuerInsertCodableJournalEntry *)self issuers];
  [v4 encodeObject:v5 forKey:@"codableIssuers"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HDSignedClinicalDataIssuerInsertCodableJournalEntry syncProvenance](self, "syncProvenance"), @"syncProvenance");
  v6.receiver = self;
  v6.super_class = (Class)HDSignedClinicalDataIssuerInsertCodableJournalEntry;
  [(HDSignedClinicalDataIssuerInsertCodableJournalEntry *)&v6 encodeWithCoder:v4];
}

- (NSArray)issuers
{
  return self->_issuers;
}

- (int64_t)syncProvenance
{
  return self->_syncProvenance;
}

- (void).cxx_destruct
{
}

@end