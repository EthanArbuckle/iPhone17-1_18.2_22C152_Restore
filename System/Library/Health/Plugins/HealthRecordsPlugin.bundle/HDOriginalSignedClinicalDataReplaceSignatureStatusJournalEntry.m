@interface HDOriginalSignedClinicalDataReplaceSignatureStatusJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (HDOriginalSignedClinicalDataReplaceSignatureStatusJournalEntry)initWithCodableRecordSyncIdentifier:(id)a3 signatureStatus:(int64_t)a4;
- (HDOriginalSignedClinicalDataReplaceSignatureStatusJournalEntry)initWithCoder:(id)a3;
- (NSUUID)syncIdentifier;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDOriginalSignedClinicalDataReplaceSignatureStatusJournalEntry

- (HDOriginalSignedClinicalDataReplaceSignatureStatusJournalEntry)initWithCodableRecordSyncIdentifier:(id)a3 signatureStatus:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDOriginalSignedClinicalDataReplaceSignatureStatusJournalEntry;
  v7 = [(HDOriginalSignedClinicalDataReplaceSignatureStatusJournalEntry *)&v11 init];
  if (v7)
  {
    v8 = (NSUUID *)[v6 copy];
    syncIdentifier = v7->_syncIdentifier;
    v7->_syncIdentifier = v8;

    v7->_status = a4;
  }

  return v7;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v26;
    *(void *)&long long v8 = 138544130;
    long long v21 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "syncIdentifier", v21);
        id v14 = [v12 status];
        id v24 = 0;
        unsigned __int8 v15 = +[HDOriginalSignedClinicalDataRecordEntity replaceOriginalRecordWithSyncIdentifier:v13 newSignatureStatus:v14 profile:v6 error:&v24];
        id v16 = v24;

        if ((v15 & 1) == 0)
        {
          _HKInitializeLogging();
          v17 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            log = v17;
            v18 = (objc_class *)objc_opt_class();
            v22 = NSStringFromClass(v18);
            v19 = [v12 syncIdentifier];
            [v12 status];
            v20 = NSStringForSignedClinicalDataRecordSignatureStatus();
            *(_DWORD *)buf = v21;
            v30 = v22;
            __int16 v31 = 2114;
            v32 = v19;
            __int16 v33 = 2114;
            v34 = v20;
            __int16 v35 = 2114;
            id v36 = v16;
            _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ failed to replace original record %{public}@ with new signature status: %{public}@ %{public}@", buf, 0x2Au);
          }
        }
      }
      id v9 = [v5 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v9);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDOriginalSignedClinicalDataReplaceSignatureStatusJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectForKey:@"syncIdentifier"];
  if (v5 && ([v4 containsValueForKey:@"signatureStatus"] & 1) != 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)HDOriginalSignedClinicalDataReplaceSignatureStatusJournalEntry;
    id v6 = [(HDOriginalSignedClinicalDataReplaceSignatureStatusJournalEntry *)&v11 initWithCoder:v4];
    if (v6)
    {
      id v7 = (NSUUID *)[v5 copy];
      syncIdentifier = v6->_syncIdentifier;
      v6->_syncIdentifier = v7;

      v6->_status = (int64_t)[v4 decodeIntegerForKey:@"signatureStatus"];
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
  id v5 = [(HDOriginalSignedClinicalDataReplaceSignatureStatusJournalEntry *)self syncIdentifier];
  [v4 encodeObject:v5 forKey:@"syncIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HDOriginalSignedClinicalDataReplaceSignatureStatusJournalEntry status](self, "status"), @"signatureStatus");
  v6.receiver = self;
  v6.super_class = (Class)HDOriginalSignedClinicalDataReplaceSignatureStatusJournalEntry;
  [(HDOriginalSignedClinicalDataReplaceSignatureStatusJournalEntry *)&v6 encodeWithCoder:v4];
}

- (NSUUID)syncIdentifier
{
  return self->_syncIdentifier;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
}

@end