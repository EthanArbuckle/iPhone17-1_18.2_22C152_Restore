@interface _HDDataDeletionJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (_BYTE)initWithDataObject:(char)a3 restrictSource:;
- (_HDDataDeletionJournalEntry)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HDDataDeletionJournalEntry

- (_BYTE)initWithDataObject:(char)a3 restrictSource:
{
  id v6 = a2;
  if (a1)
  {
    uint64_t v7 = [a1 init];
    a1 = (unsigned char *)v7;
    if (v7)
    {
      objc_storeStrong((id *)(v7 + 16), a2);
      a1[8] = a3;
    }
  }

  return a1;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v41 = a4;
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v52;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v52 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v51 + 1) + 8 * v11);
      if (v12 && *(unsigned char *)(v12 + 8))
      {
        id v4 = *(id *)(v12 + 16);
        v13 = [v4 _sourceBundleIdentifier];

        uint64_t v14 = [v43 objectForKeyedSubscript:v13];
        if (v14)
        {
          v15 = (void *)v14;
        }
        else
        {
          v16 = [v41 sourceManager];
          id v50 = v9;
          v15 = [v16 localSourceForBundleIdentifier:v13 copyIfNecessary:1 error:&v50];
          id v4 = v50;

          if (!v15)
          {
            _HKInitializeLogging();
            v20 = *MEMORY[0x1E4F29F18];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v57 = (uint64_t)v13;
              __int16 v58 = 2114;
              id v59 = v4;
              _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "Missing source for %{public}@, skipping: %{public}@", buf, 0x16u);
            }
            if (objc_msgSend(v4, "hk_isTransactionInterruptedError"))
            {
              v40 = obj;
              id v9 = v4;
LABEL_29:

              goto LABEL_50;
            }
            id v17 = [NSString stringWithFormat:@"%@-%@", objc_opt_class(), v13];
            id v18 = [v41 daemon];
            v21 = [v18 autoBugCaptureReporter];
            [v21 reportJournalFailureWithErrorDescription:v17 provenance:0 error:v4];

            id v9 = v4;
            goto LABEL_19;
          }
          [v43 setObject:v15 forKeyedSubscript:v13];
          id v9 = v4;
        }
      }
      else
      {
        v13 = [NSString string];
      }
      id v17 = v13;
      id v18 = [v44 objectForKeyedSubscript:v17];
      if (!v18)
      {
        id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [v44 setObject:v18 forKeyedSubscript:v17];
      }
      if (v12) {
        uint64_t v19 = *(void *)(v12 + 16);
      }
      else {
        uint64_t v19 = 0;
      }
      [v18 addObject:v19];
      v13 = v17;
LABEL_19:

      if (v8 == ++v11)
      {
        uint64_t v22 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
        uint64_t v8 = v22;
        if (v22) {
          goto LABEL_3;
        }
        goto LABEL_31;
      }
    }
  }
  id v9 = 0;
LABEL_31:

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v40 = [v44 allKeys];
  uint64_t v23 = [v40 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v47;
    do
    {
      uint64_t v26 = 0;
      v27 = v9;
      do
      {
        if (*(void *)v47 != v25) {
          objc_enumerationMutation(v40);
        }
        v28 = *(void **)(*((void *)&v46 + 1) + 8 * v26);
        _HKInitializeLogging();
        v29 = (void *)*MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEBUG))
        {
          v37 = v29;
          v38 = [v44 objectForKeyedSubscript:v28];
          uint64_t v39 = [v38 count];
          *(_DWORD *)buf = 134218242;
          uint64_t v57 = v39;
          __int16 v58 = 2112;
          id v59 = v28;
          _os_log_debug_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_DEBUG, "Deleting %ld objects for source: %@", buf, 0x16u);
        }
        v13 = [v43 objectForKeyedSubscript:v28];
        v30 = [v41 dataManager];
        v31 = [v44 objectForKeyedSubscript:v28];
        if (v13)
        {
          id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:v13];
          id v32 = v4;
        }
        else
        {
          id v32 = 0;
        }
        id v45 = v27;
        [v30 deleteDataObjects:v31 restrictedSourceEntities:v32 failIfNotFound:0 recursiveDeleteAuthorizationBlock:0 error:&v45];
        id v9 = v45;

        if (v13) {
        if (v9)
        }
        {
          _HKInitializeLogging();
          v33 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v57 = (uint64_t)v28;
            __int16 v58 = 2114;
            id v59 = v9;
            _os_log_error_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_ERROR, "Failed to apply for source: %@: %{public}@", buf, 0x16u);
          }
          if (objc_msgSend(v9, "hk_isTransactionInterruptedError")) {
            goto LABEL_29;
          }
          v34 = [NSString stringWithFormat:@"%@", v28];
          v35 = [v41 daemon];
          v36 = [v35 autoBugCaptureReporter];
          [v36 reportJournalFailureWithErrorDescription:v34 provenance:0 error:v9];
        }
        ++v26;
        v27 = v9;
      }
      while (v24 != v26);
      uint64_t v24 = [v40 countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v24);
  }
LABEL_50:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HDDataDeletionJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataObject"];
  char v6 = [v4 decodeBoolForKey:@"restrictSource"];

  uint64_t v7 = (_HDDataDeletionJournalEntry *)-[_HDDataDeletionJournalEntry initWithDataObject:restrictSource:](self, v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  dataObject = self->_dataObject;
  id v5 = a3;
  [v5 encodeObject:dataObject forKey:@"dataObject"];
  [v5 encodeBool:self->_restrictSource forKey:@"restrictSource"];
}

- (void).cxx_destruct
{
}

@end