@interface _HDDeletedSampleInsertionJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (_HDDeletedSampleInsertionJournalEntry)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _HDDeletedSampleInsertionJournalEntry

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    uint64_t v26 = *(void *)v30;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v29 + 1) + 8 * v10);
        if (v11)
        {
          id v12 = *(id *)(v11 + 16);
          v13 = *(void **)(v11 + 24);
        }
        else
        {
          id v12 = 0;
          v13 = 0;
        }
        id v28 = 0;
        id v14 = v13;
        BOOL v15 = +[HDDeletedSampleEntity insertCodableDeletedSamples:v12 provenance:v14 profile:v6 error:&v28];
        id v16 = v28;

        if (!v15)
        {
          _HKInitializeLogging();
          v17 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v34 = v16;
            _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "Failed to insert codable deleted samples: %{public}@", buf, 0xCu);
          }
          if (objc_msgSend(v16, "hk_isTransactionInterruptedError"))
          {

            goto LABEL_22;
          }
          v18 = [NSString stringWithFormat:@"%@", objc_opt_class()];
          v19 = [v6 daemon];
          v20 = [v19 autoBugCaptureReporter];
          if (v11) {
            v21 = *(void **)(v11 + 24);
          }
          else {
            v21 = 0;
          }
          v22 = NSNumber;
          id v23 = v21;
          v24 = objc_msgSend(v22, "numberWithLongLong:", objc_msgSend(v23, "syncProvenance"));
          [v20 reportJournalFailureWithErrorDescription:v18 provenance:v24 error:v16];

          uint64_t v9 = v26;
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v25 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
      uint64_t v8 = v25;
    }
    while (v25);
  }
LABEL_22:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_alloc_init(HDCodableObjectCollection);
  id v5 = (void *)[(NSArray *)self->_samples mutableCopy];
  [(HDCodableObjectCollection *)v7 setDeletedSamples:v5];

  id v6 = [(HDCodableObjectCollection *)v7 data];
  [v4 encodeObject:v6 forKey:@"codable_objects"];

  [v4 encodeObject:self->_provenance forKey:@"provenance"];
}

- (_HDDeletedSampleInsertionJournalEntry)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_HDDeletedSampleInsertionJournalEntry;
  id v5 = [(HDJournalEntry *)&v16 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codable_objects"];
    if (v6)
    {
      uint64_t v7 = [[HDCodableObjectCollection alloc] initWithData:v6];
      uint64_t v8 = [(HDCodableObjectCollection *)v7 deletedSamples];
      samples = v5->_samples;
      v5->_samples = (NSArray *)v8;
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
      v17[0] = objc_opt_class();
      v17[1] = objc_opt_class();
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
      samples = [v10 setWithArray:v7];
      uint64_t v11 = [v4 decodeObjectOfClasses:samples forKey:@"deleted_samples"];
      id v12 = v5->_samples;
      v5->_samples = (NSArray *)v11;
    }
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provenance"];
    provenance = v5->_provenance;
    v5->_provenance = (HDDataOriginProvenance *)v13;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provenance, 0);
  objc_storeStrong((id *)&self->_samples, 0);

  objc_storeStrong((id *)&self->_objectCollection, 0);
}

@end