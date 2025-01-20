@interface HDFHIRResourcesJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (HDFHIRResourcesJournalEntry)initWithCodableResources:(id)a3 syncProvencance:(int64_t)a4;
- (HDFHIRResourcesJournalEntry)initWithCoder:(id)a3;
- (NSArray)codableResources;
- (int64_t)syncProvenance;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDFHIRResourcesJournalEntry

- (HDFHIRResourcesJournalEntry)initWithCodableResources:(id)a3 syncProvencance:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDFHIRResourcesJournalEntry;
  v7 = [(HDFHIRResourcesJournalEntry *)&v11 init];
  if (v7)
  {
    v8 = (NSArray *)[v6 copy];
    codableResources = v7->_codableResources;
    v7->_codableResources = v8;

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
        v13 = objc_msgSend(v12, "codableResources", v18);
        id v14 = [v12 syncProvenance];
        id v20 = 0;
        unsigned __int8 v15 = +[HDOriginalFHIRResourceEntity _insertCodableFHIRResources:v13 syncProvenance:v14 profile:v6 error:&v20];
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
            _os_log_error_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "%{public}@ Failed to insert journaled FHIR resources: %{public}@", buf, 0x16u);
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

- (HDFHIRResourcesJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = +[NSSet hk_typesForArrayOf:objc_opt_class()];
  id v6 = [v4 decodeObjectOfClasses:v5 forKey:@"resources"];
  if (v6 && ([v4 containsValueForKey:@"provenance"] & 1) != 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)HDFHIRResourcesJournalEntry;
    id v7 = [(HDFHIRResourcesJournalEntry *)&v11 initWithCoder:v4];
    long long v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_codableResources, v6);
      v8->_syncProvenance = (int64_t)[v4 decodeInt64ForKey:@"provenance"];
    }
    self = v8;
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
  codableResources = self->_codableResources;
  id v5 = a3;
  [v5 encodeObject:codableResources forKey:@"resources"];
  [v5 encodeInt64:self->_syncProvenance forKey:@"provenance"];
  v6.receiver = self;
  v6.super_class = (Class)HDFHIRResourcesJournalEntry;
  [(HDFHIRResourcesJournalEntry *)&v6 encodeWithCoder:v5];
}

- (NSArray)codableResources
{
  return self->_codableResources;
}

- (int64_t)syncProvenance
{
  return self->_syncProvenance;
}

- (void).cxx_destruct
{
}

@end