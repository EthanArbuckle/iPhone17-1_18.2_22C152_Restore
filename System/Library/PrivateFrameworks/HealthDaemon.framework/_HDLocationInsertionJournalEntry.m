@interface _HDLocationInsertionJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (_HDLocationInsertionJournalEntry)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)initWithSeriesPersistentID:(void *)a3 locationData:;
@end

@implementation _HDLocationInsertionJournalEntry

- (void)initWithSeriesPersistentID:(void *)a3 locationData:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)_HDLocationInsertionJournalEntry;
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

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"%@ - insert %lld location datums into %@", v5, -[NSArray count](self->_data, "count"), self->_seriesIdentifier];

  return v6;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v30;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v29 + 1) + 8 * v9);
        if (v10)
        {
          id v11 = *(id *)(v10 + 16);
          objc_super v12 = *(void **)(v10 + 8);
        }
        else
        {
          id v11 = 0;
          objc_super v12 = 0;
        }
        id v13 = v12;
        id v28 = 0;
        BOOL v14 = +[HDLocationSeriesSampleEntity insertLocationData:v11 seriesIdentifier:v13 profile:v6 error:&v28];
        id v15 = v28;

        if (!v14)
        {
          _HKInitializeLogging();
          v16 = (void *)*MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            if (v10) {
              uint64_t v24 = *(void *)(v10 + 8);
            }
            else {
              uint64_t v24 = 0;
            }
            *(_DWORD *)buf = 138412546;
            uint64_t v34 = v24;
            __int16 v35 = 2114;
            id v36 = v15;
            v25 = v16;
            _os_log_error_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_ERROR, "Failed to insert journaled location series data: %@ %{public}@", buf, 0x16u);
          }
          if (objc_msgSend(v15, "hk_isTransactionInterruptedError"))
          {

            goto LABEL_25;
          }
          v17 = NSString;
          uint64_t v18 = objc_opt_class();
          if (v10) {
            v19 = *(void **)(v10 + 8);
          }
          else {
            v19 = 0;
          }
          id v20 = v19;
          v21 = [v17 stringWithFormat:@"%@-%@", v18, v20];

          v22 = [v6 daemon];
          v23 = [v22 autoBugCaptureReporter];
          [v23 reportJournalFailureWithErrorDescription:v21 provenance:0 error:v15];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v26 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
      uint64_t v7 = v26;
    }
    while (v26);
  }
LABEL_25:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HDLocationInsertionJournalEntry)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sid"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  uint64_t v8 = [v6 setWithArray:v7];
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"data"];

  uint64_t v10 = (_HDLocationInsertionJournalEntry *)-[_HDLocationInsertionJournalEntry initWithSeriesPersistentID:locationData:](self, v5, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_seriesIdentifier forKey:@"sid"];
  [v4 encodeObject:self->_data forKey:@"data"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_seriesIdentifier, 0);
}

@end