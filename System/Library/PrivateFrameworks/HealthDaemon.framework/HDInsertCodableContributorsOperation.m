@interface HDInsertCodableContributorsOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDInsertCodableContributorsOperation)init;
- (HDInsertCodableContributorsOperation)initWithCoder:(id)a3;
- (HDInsertCodableContributorsOperation)initWithContributors:(id)a3 provenance:(int64_t)a4;
- (NSArray)contributors;
- (int64_t)provenance;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDInsertCodableContributorsOperation

- (HDInsertCodableContributorsOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDInsertCodableContributorsOperation)initWithContributors:(id)a3 provenance:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDInsertCodableContributorsOperation;
  v7 = [(HDInsertCodableContributorsOperation *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    contributors = v7->_contributors;
    v7->_contributors = (NSArray *)v8;

    v7->_provenance = a4;
  }

  return v7;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v38 = a4;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v36 = self;
  obj = self->_contributors;
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v42;
    id v35 = v8;
    uint64_t v37 = *(void *)v42;
    v40 = a5;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v42 != v11) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v41 + 1) + 8 * v12);
      v14 = (void *)MEMORY[0x1E4F29128];
      v15 = [v13 uuid];
      v16 = objc_msgSend(v14, "hk_UUIDWithData:", v15);

      if ([v13 deleted])
      {
        if (!+[HDContributorEntity deleteContributorWithUUID:v16 profile:v8 error:a5])goto LABEL_25; {
        goto LABEL_21;
        }
      }
      v17 = [v8 syncIdentityManager];
      v18 = [v17 legacySyncIdentity];

      if (![v13 hasSyncIdentity]) {
        goto LABEL_13;
      }
      v19 = [v13 syncIdentity];
      +[HDSyncIdentity syncIdentityWithCodable:v19 error:a5];
      v21 = v20 = a5;

      if (v21)
      {
        v22 = [v8 syncIdentityManager];
        uint64_t v23 = [v22 concreteIdentityForIdentity:v21 shouldCreate:1 transaction:v38 error:v20];

        if (v23)
        {

          v18 = (void *)v23;
LABEL_13:
          v24 = [v13 appleID];
          v25 = [v13 callerID];
          int64_t provenance = v36->_provenance;
          v27 = [v18 entity];
          v28 = +[HDContributorEntity insertWithUUID:appleID:callerID:primaryUser:syncProvenance:syncIdentity:transaction:error:](HDContributorEntity, "insertWithUUID:appleID:callerID:primaryUser:syncProvenance:syncIdentity:transaction:error:", v16, v24, v25, 0, provenance, [v27 persistentID], v38, v40);

          if (!v28)
          {

            id v8 = v35;
LABEL_25:

            BOOL v33 = 0;
            goto LABEL_26;
          }
          v21 = v18;
          id v8 = v35;
          goto LABEL_20;
        }
        _HKInitializeLogging();
        v30 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
        {
          id v32 = *v40;
          *(_DWORD *)buf = 138543362;
          id v46 = v32;
          _os_log_fault_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_FAULT, "ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
        }
      }
      else
      {
        _HKInitializeLogging();
        v29 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
        {
          id v31 = *v40;
          *(_DWORD *)buf = 138543362;
          id v46 = v31;
          _os_log_fault_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_FAULT, "SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
        }

        v21 = 0;
      }
LABEL_20:
      uint64_t v11 = v37;

      a5 = v40;
LABEL_21:

      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v41 objects:v47 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  BOOL v33 = 1;
LABEL_26:

  return v33;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertCodableContributorsOperation)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v7 = [v4 setWithArray:v6];
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"contributors"];

  uint64_t v9 = [v5 decodeInt64ForKey:@"provenance"];
  uint64_t v10 = [(HDInsertCodableContributorsOperation *)self initWithContributors:v8 provenance:v9];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  contributors = self->_contributors;
  id v5 = a3;
  [v5 encodeObject:contributors forKey:@"contributors"];
  [v5 encodeInt64:self->_provenance forKey:@"provenance"];
}

- (NSArray)contributors
{
  return self->_contributors;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (void).cxx_destruct
{
}

@end