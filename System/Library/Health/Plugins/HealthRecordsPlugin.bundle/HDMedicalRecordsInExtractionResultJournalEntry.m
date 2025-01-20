@interface HDMedicalRecordsInExtractionResultJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (BOOL)isEqual:(id)a3;
- (HDExtractionResult)extractionResult;
- (HDMedicalRecordsInExtractionResultJournalEntry)init;
- (HDMedicalRecordsInExtractionResultJournalEntry)initWithCoder:(id)a3;
- (HDMedicalRecordsInExtractionResultJournalEntry)initWithExtractionResult:(id)a3 accountIdentifier:(id)a4;
- (NSUUID)accountIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setExtractionResult:(id)a3;
@end

@implementation HDMedicalRecordsInExtractionResultJournalEntry

- (HDMedicalRecordsInExtractionResultJournalEntry)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDMedicalRecordsInExtractionResultJournalEntry)initWithExtractionResult:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDMedicalRecordsInExtractionResultJournalEntry;
  v8 = [(HDMedicalRecordsInExtractionResultJournalEntry *)&v14 init];
  if (v8)
  {
    v9 = (HDExtractionResult *)[v6 copy];
    extractionResult = v8->_extractionResult;
    v8->_extractionResult = v9;

    v11 = (NSUUID *)[v7 copy];
    accountIdentifier = v8->_accountIdentifier;
    v8->_accountIdentifier = v11;
  }
  return v8;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v10);
        _HKInitializeLogging();
        v12 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
        {
          v13 = v12;
          objc_super v14 = NSStringFromClass((Class)a1);
          v15 = [v11 accountIdentifier];
          *(_DWORD *)buf = 138543618;
          v31 = v14;
          __int16 v32 = 2114;
          id v33 = v15;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ processing medical records extraction journal entry for account %{public}@", buf, 0x16u);
        }
        v16 = [v11 extractionResult];
        v17 = [v11 accountIdentifier];
        id v25 = 0;
        v18 = +[HDMedicalRecordEntity processMedicalRecordsInExtractionResult:v16 accountIdentifier:v17 profile:v6 error:&v25];
        id v19 = v25;

        _HKInitializeLogging();
        v20 = (void *)HKLogHealthRecords;
        if (v18)
        {
          if (!os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_13;
          }
          v21 = v20;
          v22 = NSStringFromClass((Class)a1);
          *(_DWORD *)buf = 138543618;
          v31 = v22;
          __int16 v32 = 2112;
          id v33 = v18;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ inserted %@ medical records from journal", buf, 0x16u);
          goto LABEL_11;
        }
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
        {
          v21 = v20;
          v22 = NSStringFromClass((Class)a1);
          *(_DWORD *)buf = 138543618;
          v31 = v22;
          __int16 v32 = 2114;
          id v33 = v19;
          _os_log_error_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "%{public}@ failed to process journaled medical records: %{public}@", buf, 0x16u);
LABEL_11:
        }
LABEL_13:

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v23 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
      id v8 = v23;
    }
    while (v23);
  }
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(HDExtractionResult *)self->_extractionResult hash];
  return (unint64_t)[(NSUUID *)self->_accountIdentifier hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (HDMedicalRecordsInExtractionResultJournalEntry *)a3;
  id v6 = v5;
  if (self != v5)
  {
    id v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned __int8 v13 = 0;
LABEL_18:

      goto LABEL_19;
    }
    id v8 = &dword_8;
    extractionResult = self->_extractionResult;
    v10 = [(HDMedicalRecordsInExtractionResultJournalEntry *)v7 extractionResult];
    if (extractionResult == v10) {
      goto LABEL_9;
    }
    uint64_t v11 = [(HDMedicalRecordsInExtractionResultJournalEntry *)v7 extractionResult];
    if (!v11)
    {
      unsigned __int8 v13 = 0;
LABEL_17:

      goto LABEL_18;
    }
    unint64_t v3 = (void *)v11;
    v12 = self->_extractionResult;
    id v8 = [(HDMedicalRecordsInExtractionResultJournalEntry *)v7 extractionResult];
    if ([(HDExtractionResult *)v12 isEqual:v8])
    {
LABEL_9:
      accountIdentifier = self->_accountIdentifier;
      uint64_t v15 = [(HDMedicalRecordsInExtractionResultJournalEntry *)v7 accountIdentifier];
      if (accountIdentifier == (NSUUID *)v15)
      {

        unsigned __int8 v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        uint64_t v17 = [(HDMedicalRecordsInExtractionResultJournalEntry *)v7 accountIdentifier];
        if (v17)
        {
          v18 = (void *)v17;
          id v19 = self->_accountIdentifier;
          v20 = [(HDMedicalRecordsInExtractionResultJournalEntry *)v7 accountIdentifier];
          unsigned __int8 v13 = [(NSUUID *)v19 isEqual:v20];
        }
        else
        {

          unsigned __int8 v13 = 0;
        }
      }
      if (extractionResult == v10) {
        goto LABEL_17;
      }
    }
    else
    {
      unsigned __int8 v13 = 0;
    }

    goto LABEL_17;
  }
  unsigned __int8 v13 = 1;
LABEL_19:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDMedicalRecordsInExtractionResultJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extractionResult"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    uint64_t v9 = 0;
  }
  else
  {
    self = [(HDMedicalRecordsInExtractionResultJournalEntry *)self initWithExtractionResult:v5 accountIdentifier:v6];
    uint64_t v9 = self;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  extractionResult = self->_extractionResult;
  id v5 = a3;
  [v5 encodeObject:extractionResult forKey:@"extractionResult"];
  [v5 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
}

- (HDExtractionResult)extractionResult
{
  return self->_extractionResult;
}

- (void)setExtractionResult:(id)a3
{
}

- (NSUUID)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);

  objc_storeStrong((id *)&self->_extractionResult, 0);
}

@end