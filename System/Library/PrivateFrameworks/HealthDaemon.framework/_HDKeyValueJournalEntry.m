@interface _HDKeyValueJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (_HDKeyValueJournalEntry)initWithCoder:(id)a3;
- (_HDKeyValueJournalEntry)initWithValue:(id)a3 key:(id)a4 domain:(id)a5 category:(int64_t)a6 provenance:(int64_t)a7 syncIdentity:(int64_t)a8 updatePolicy:(int64_t)a9 modificationDate:(id)a10;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HDKeyValueJournalEntry

- (_HDKeyValueJournalEntry)initWithValue:(id)a3 key:(id)a4 domain:(id)a5 category:(int64_t)a6 provenance:(int64_t)a7 syncIdentity:(int64_t)a8 updatePolicy:(int64_t)a9 modificationDate:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a10;
  v28.receiver = self;
  v28.super_class = (Class)_HDKeyValueJournalEntry;
  v21 = [(_HDKeyValueJournalEntry *)&v28 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_value, a3);
    uint64_t v23 = [v18 copy];
    key = v22->_key;
    v22->_key = (NSString *)v23;

    uint64_t v25 = [v19 copy];
    domain = v22->_domain;
    v22->_domain = (NSString *)v25;

    v22->_category = a6;
    v22->_provenance = a7;
    v22->_syncIdentity = a8;
    v22->_updatePolicy = a9;
    objc_storeStrong((id *)&v22->_modificationDate, a10);
  }

  return v22;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v5;
  uint64_t v50 = [obj countByEnumeratingWithState:&v54 objects:v66 count:16];
  v7 = 0;
  if (v50)
  {
    uint64_t v49 = *(void *)v55;
    v47 = v6;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v55 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v54 + 1) + 8 * v8);
        if (v9)
        {
          uint64_t v10 = *(void *)(v9 + 32);
          id v11 = *(id *)(v9 + 16);
          v12 = *(void **)(v9 + 8);
        }
        else
        {
          id v11 = 0;
          uint64_t v10 = 0;
          v12 = 0;
        }
        id v13 = v12;
        v14 = +[HDKeyValueEntity _entityClassForKeyValueCategory:v10];
        if (v14) {
          BOOL v15 = v11 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        v51 = v13;
        v52 = v11;
        if (v15 || v13 == 0)
        {
          _HKInitializeLogging();
          id v17 = (void *)*MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            v39 = v17;
            v40 = objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v59 = v40;
            id v41 = v40;
            _os_log_error_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_ERROR, "%{public}@: Invalid entity/key/value set", buf, 0xCu);
          }
          id v18 = [NSString stringWithFormat:@"%@", objc_opt_class()];
          if (!v7)
          {
            v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 3, v18);
          }
          id v19 = [v6 daemon];
          id v20 = [v19 autoBugCaptureReporter];
          if (v9) {
            uint64_t v21 = *(void *)(v9 + 40);
          }
          else {
            uint64_t v21 = 0;
          }
          v22 = [NSNumber numberWithLongLong:v21];
          [v20 reportJournalFailureWithErrorDescription:v18 provenance:v22 error:v7];
          goto LABEL_41;
        }
        uint64_t v23 = v14;
        if (!v9)
        {
          id v18 = &stru_1F1728D60;
          v45 = &stru_1F1728D60;
          uint64_t v25 = 0;
          goto LABEL_31;
        }
        v24 = *(__CFString **)(v9 + 24);
        if (!v24) {
          v24 = &stru_1F1728D60;
        }
        id v18 = v24;
        uint64_t v25 = *(void *)(v9 + 48);
        if (v25 == -2)
        {
          v26 = [v6 syncIdentityManager];
          v27 = [v26 currentSyncIdentity];
          goto LABEL_30;
        }
        if (v25 == -1)
        {
          v26 = [v6 syncIdentityManager];
          v27 = [v26 legacySyncIdentity];
LABEL_30:
          objc_super v28 = v27;
          v29 = [v27 entity];
          uint64_t v25 = [v29 persistentID];
        }
LABEL_31:
        v64 = v52;
        v65 = v51;
        v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
        if (v9)
        {
          id v31 = *(id *)(v9 + 56);
          uint64_t v32 = *(void *)(v9 + 40);
          uint64_t v33 = *(void *)(v9 + 64);
        }
        else
        {
          uint64_t v32 = 0;
          id v31 = 0;
          uint64_t v33 = 0;
        }
        id v6 = v47;
        id v53 = v7;
        char v34 = [(objc_class *)v23 _insertKeysAndValues:v30 modificationDate:v31 domain:v18 category:v10 provenance:v32 syncIdentity:v25 updatePolicy:v33 profile:v47 error:&v53];
        id v35 = v53;

        if (v34)
        {
          v7 = v35;
          goto LABEL_42;
        }
        _HKInitializeLogging();
        v36 = (void *)*MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          v42 = v36;
          v43 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v59 = v43;
          __int16 v60 = 2048;
          uint64_t v61 = v10;
          __int16 v62 = 2114;
          id v63 = v35;
          id v44 = v43;
          _os_log_error_impl(&dword_1BCB7D000, v42, OS_LOG_TYPE_ERROR, "%{public}@: Failed to apply value of category %ld, %{public}@", buf, 0x20u);
        }
        if (objc_msgSend(v35, "hk_isTransactionInterruptedError"))
        {

          v7 = v35;
          goto LABEL_52;
        }
        id v19 = [NSString stringWithFormat:@"%@-%ld", objc_opt_class(), v10];
        id v20 = [v47 daemon];
        v22 = [v20 autoBugCaptureReporter];
        if (v9) {
          uint64_t v37 = *(void *)(v9 + 40);
        }
        else {
          uint64_t v37 = 0;
        }
        v38 = [NSNumber numberWithLongLong:v37];
        [v22 reportJournalFailureWithErrorDescription:v19 provenance:v38 error:v35];

        v7 = v35;
LABEL_41:

LABEL_42:
        ++v8;
      }
      while (v50 != v8);
      uint64_t v46 = [obj countByEnumeratingWithState:&v54 objects:v66 count:16];
      uint64_t v50 = v46;
    }
    while (v46);
  }
LABEL_52:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HDKeyValueJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_HDKeyValueJournalEntry;
  id v5 = [(_HDKeyValueJournalEntry *)&v22 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    id v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSSecureCoding *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"key"];
    key = v5->_key;
    v5->_key = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domain"];
    domain = v5->_domain;
    v5->_domain = (NSString *)v16;

    v5->_category = [v4 decodeIntegerForKey:@"category"];
    v5->_provenance = [v4 decodeInt64ForKey:@"provenance"];
    v5->_syncIdentity = -1;
    if ([v4 containsValueForKey:@"sync_identity"]) {
      v5->_syncIdentity = [v4 decodeInt64ForKey:@"sync_identity"];
    }
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mod_date"];
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v18;

    if ([v4 containsValueForKey:@"updatePolicy"]) {
      uint64_t v20 = [v4 decodeIntegerForKey:@"updatePolicy"];
    }
    else {
      uint64_t v20 = 2;
    }
    v5->_updatePolicy = v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  value = self->_value;
  id v5 = a3;
  [v5 encodeObject:value forKey:@"value"];
  [v5 encodeObject:self->_key forKey:@"key"];
  [v5 encodeObject:self->_domain forKey:@"domain"];
  [v5 encodeInteger:self->_category forKey:@"category"];
  [v5 encodeInt64:self->_provenance forKey:@"provenance"];
  [v5 encodeInt64:self->_syncIdentity forKey:@"sync_identity"];
  [v5 encodeObject:self->_modificationDate forKey:@"mod_date"];
  [v5 encodeInteger:self->_updatePolicy forKey:@"updatePolicy"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end