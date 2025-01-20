@interface _HDSampleTypesDeletionEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (_HDSampleTypesDeletionEntry)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)initWithSourceIDs:(void *)a3 types:;
@end

@implementation _HDSampleTypesDeletionEntry

- (void)initWithSourceIDs:(void *)a3 types:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)_HDSampleTypesDeletionEntry;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      uint64_t v7 = [v5 copy];
      v8 = (void *)a1[1];
      a1[1] = v7;

      uint64_t v9 = [v6 copy];
      v10 = (void *)a1[2];
      a1[2] = v9;
    }
  }

  return a1;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v24 = *(void *)v27;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * v9);
        if (v10)
        {
          id v11 = *(id *)(v10 + 8);
          objc_super v12 = *(void **)(v10 + 16);
        }
        else
        {
          id v11 = 0;
          objc_super v12 = 0;
        }
        id v13 = v12;
        v14 = objc_msgSend(v11, "hk_map:", &__block_literal_global_490);
        v15 = [v6 dataManager];
        id v25 = 0;
        char v16 = [v15 deleteSamplesWithTypes:v13 sourceEntities:v14 recursiveDeleteAuthorizationBlock:0 error:&v25];
        id v17 = v25;

        if ((v16 & 1) == 0)
        {
          _HKInitializeLogging();
          v18 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            id v31 = v11;
            __int16 v32 = 2112;
            id v33 = v13;
            __int16 v34 = 2114;
            id v35 = v17;
            _os_log_error_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_ERROR, "Failed to delete samples for deleted source identifiers (%@) and types (%@): %{public}@.", buf, 0x20u);
          }
          if (objc_msgSend(v17, "hk_isTransactionInterruptedError"))
          {

            goto LABEL_19;
          }
          v19 = [NSString stringWithFormat:@"%@-%@,%@", objc_opt_class(), v11, v13];
          v20 = [v6 daemon];
          v21 = [v20 autoBugCaptureReporter];
          [v21 reportJournalFailureWithErrorDescription:v19 provenance:0 error:v17];
        }
        ++v9;
      }
      while (v8 != v9);
      uint64_t v22 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
      uint64_t v8 = v22;
    }
    while (v22);
  }
LABEL_19:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HDSampleTypesDeletionEntry)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  uint64_t v7 = [v5 setWithArray:v6];
  uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"sids"];

  if (!v8)
  {
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sid"];
    if (v9)
    {
      id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
    }
    else
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
    uint64_t v8 = v10;
  }
  id v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v14 = [v4 decodeObjectOfClasses:v13 forKey:@"types"];
  v15 = (_HDSampleTypesDeletionEntry *)-[_HDSampleTypesDeletionEntry initWithSourceIDs:types:](self, v8, v14);

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  sourceIDs = self->_sourceIDs;
  id v5 = a3;
  [v5 encodeObject:sourceIDs forKey:@"sids"];
  [v5 encodeObject:self->_types forKey:@"types"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_types, 0);

  objc_storeStrong((id *)&self->_sourceIDs, 0);
}

@end