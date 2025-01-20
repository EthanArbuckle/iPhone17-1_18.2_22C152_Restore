@interface HDInsertCodableSummarySharingEntryOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)ignoreIfExists;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (BOOL)shouldResolveCNContact;
- (HDInsertCodableSummarySharingEntryOperation)init;
- (HDInsertCodableSummarySharingEntryOperation)initWithCodableEntries:(id)a3 ignoreIfExists:(BOOL)a4 provenance:(int64_t)a5 shouldResolveCNContact:(BOOL)a6;
- (HDInsertCodableSummarySharingEntryOperation)initWithCoder:(id)a3;
- (NSArray)codableEntries;
- (int64_t)provenance;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDInsertCodableSummarySharingEntryOperation

- (HDInsertCodableSummarySharingEntryOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDInsertCodableSummarySharingEntryOperation)initWithCodableEntries:(id)a3 ignoreIfExists:(BOOL)a4 provenance:(int64_t)a5 shouldResolveCNContact:(BOOL)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDInsertCodableSummarySharingEntryOperation;
  v11 = [(HDInsertCodableSummarySharingEntryOperation *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    codableEntries = v11->_codableEntries;
    v11->_codableEntries = (NSArray *)v12;

    v11->_provenance = a5;
    v11->_shouldResolveCNContact = a6;
    v11->_ignoreIfExists = a4;
  }

  return v11;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (self->_shouldResolveCNContact)
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1B980], "hd_contactStoreWithHealthAppIdentity");
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  int v39 = [v12 applicationIsInstalled:*MEMORY[0x1E4F2BDC0]];

  _HKInitializeLogging();
  v13 = HKLogSharing();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v47 = self;
    __int16 v48 = 1024;
    int v49 = v39 ^ 1;
    _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Inserting codable entries with current pause state: %d", buf, 0x12u);
  }
  v36 = (void *)v11;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obj = self->_codableEntries;
  uint64_t v37 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (!v37)
  {
    char v31 = 1;
    goto LABEL_43;
  }
  uint64_t v38 = *(void *)v42;
  id v34 = v9;
  do
  {
    uint64_t v14 = 0;
    v5 = v36;
    do
    {
      if (*(void *)v42 != v38) {
        objc_enumerationMutation(obj);
      }
      objc_super v15 = *(void **)(*((void *)&v41 + 1) + 8 * v14);
      if (!self->_shouldResolveCNContact || v5 == 0)
      {
        v17 = 0;
      }
      else
      {
        v17 = HDCNContactForCodableEntry(*(void **)(*((void *)&v41 + 1) + 8 * v14), v5);
      }
      if (self->_ignoreIfExists)
      {
        id v18 = objc_alloc(MEMORY[0x1E4F29128]);
        v19 = [v15 uuid];
        v20 = (void *)[v18 initWithUUIDString:v19];

        id v40 = 0;
        v21 = +[HDSummarySharingEntryEntity anyWithUUID:v20 transaction:v10 error:&v40];
        id v22 = v40;
        v23 = v22;
        LOBYTE(v5) = v21 != 0;
        if (v21)
        {
          _HKInitializeLogging();
          v32 = HKLogSharing();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v47 = self;
            _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Entry not inserted because it already exists", buf, 0xCu);
          }
        }
        else
        {
          if (!v22)
          {

            v5 = v36;
            goto LABEL_21;
          }
          if (a5) {
            *a5 = v22;
          }
          else {
            _HKLogDroppedError();
          }
        }
        id v9 = v34;

        goto LABEL_42;
      }
LABEL_21:
      if ((v39 & 1) != 0 || [v15 direction])
      {
        BOOL v24 = 0;
      }
      else if ([v15 status])
      {
        BOOL v24 = [v15 status] == 1;
      }
      else
      {
        BOOL v24 = 1;
      }
      v25 = objc_msgSend(v17, "identifier", v34);
      BOOL v26 = +[HDSummarySharingEntryEntity insertOrReplaceCodableEntry:v15 CNContactIdentifier:v25 shouldPause:v24 syncProvenance:self->_provenance transaction:v10 error:a5];

      if (!v26) {
        goto LABEL_33;
      }
      uint64_t v27 = [v15 sharingAuthorizations];
      v28 = HDSharingAuthorizationsFromCodableSharingAuthorizations((void *)v27);

      v29 = [v15 sharingRecipientIdentifier];
      LOBYTE(v27) = +[HDSharingAuthorizationsEntity insertOrReplaceWithRecipientIdentifier:v29 sharingAuthorizations:v28 databaseTransaction:v10 error:a5];

      if ((v27 & 1) == 0)
      {
LABEL_33:
        LOBYTE(v5) = 0;
        id v9 = v34;
LABEL_42:

        char v31 = 0;
        goto LABEL_43;
      }

      ++v14;
    }
    while (v37 != v14);
    uint64_t v30 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    char v31 = 1;
    id v9 = v34;
    uint64_t v37 = v30;
  }
  while (v30);
LABEL_43:

  return (v31 | v5) & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertCodableSummarySharingEntryOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"SharingEntries"];
  uint64_t v6 = [v4 decodeBoolForKey:@"ignoreIfExists"];
  uint64_t v7 = [v4 decodeInt64ForKey:@"provenance"];
  uint64_t v8 = [v4 decodeBoolForKey:@"shouldResolveCNContact"];

  id v9 = [(HDInsertCodableSummarySharingEntryOperation *)self initWithCodableEntries:v5 ignoreIfExists:v6 provenance:v7 shouldResolveCNContact:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  codableEntries = self->_codableEntries;
  id v5 = a3;
  [v5 encodeObject:codableEntries forKey:@"SharingEntries"];
  [v5 encodeBool:self->_ignoreIfExists forKey:@"ignoreIfExists"];
  [v5 encodeInt64:self->_provenance forKey:@"provenance"];
  [v5 encodeBool:self->_shouldResolveCNContact forKey:@"shouldResolveCNContact"];
}

- (NSArray)codableEntries
{
  return self->_codableEntries;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (BOOL)shouldResolveCNContact
{
  return self->_shouldResolveCNContact;
}

- (BOOL)ignoreIfExists
{
  return self->_ignoreIfExists;
}

- (void).cxx_destruct
{
}

@end