@interface _DKObjectMOConverter
- (BOOL)deduplicateValues;
- (BOOL)readMetadata;
- (NSArray)excludedMetadataKeys;
- (_DKObjectMOConverter)init;
- (id)dataIntervalsFromManagedObjects:(id)a3;
- (id)insertObject:(id)a3 inManagedObjectContext:(id)a4;
- (id)objectsFromManagedObjects:(id)a3;
- (void)setDeduplicateValues:(BOOL)a3;
- (void)setExcludedMetadataKeys:(id)a3;
- (void)setReadMetadata:(BOOL)a3;
@end

@implementation _DKObjectMOConverter

- (_DKObjectMOConverter)init
{
  v3.receiver = self;
  v3.super_class = (Class)_DKObjectMOConverter;
  result = [(_DKObjectMOConverter *)&v3 init];
  if (result) {
    *(_WORD *)&result->_readMetadata = 257;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_excludedMetadataKeys, 0);
}

- (id)objectsFromManagedObjects:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 count];
  id v20 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v5];
  context = (void *)MEMORY[0x192FB2F20]();
  v6 = 0;
  if (v5 >= 2 && self->_deduplicateValues) {
    v6 = -[_DKObjectFromMOCache initWithReporting]([_DKObjectFromMOCache alloc]);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x192FB2F20]();
        BOOL v13 = [(_DKObjectMOConverter *)self readMetadata];
        v14 = [(_DKObjectMOConverter *)self excludedMetadataKeys];
        v15 = +[_DKObject objectFromManagedObject:v11 readMetadata:v13 excludedMetadataKeys:v14 cache:v6];

        if (v15) {
          [v20 addObject:v15];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  if (v6) {
    [(_DKObjectFromMOCache *)v6 reportMetrics];
  }

  return v20;
}

- (id)insertObject:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C0A8];
  id v8 = a4;
  uint64_t v9 = [(id)objc_opt_class() entityName];
  v10 = [v7 insertNewObjectForEntityForName:v9 inManagedObjectContext:v8];

  if (self) {
    [v6 copyToManagedObject:v10];
  }

  return v10;
}

- (id)dataIntervalsFromManagedObjects:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v10 = [v9 entity];
        uint64_t v11 = [v10 name];
        v12 = +[_DKEvent entityName];
        int v13 = [v11 isEqualToString:v12];

        if (v13)
        {
          v14 = (void *)MEMORY[0x1E4F1C9C8];
          id v15 = v9;
          [v15 startDate];
          v16 = objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
          v17 = (void *)MEMORY[0x1E4F1C9C8];
          [v15 endDate];
          double v19 = v18;

          id v20 = [v17 dateWithTimeIntervalSinceReferenceDate:v19];
          long long v21 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v16 endDate:v20];
          [v23 addObject:v21];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }

  return v23;
}

- (BOOL)readMetadata
{
  return self->_readMetadata;
}

- (void)setReadMetadata:(BOOL)a3
{
  self->_readMetadata = a3;
}

- (BOOL)deduplicateValues
{
  return self->_deduplicateValues;
}

- (void)setDeduplicateValues:(BOOL)a3
{
  self->_deduplicateValues = a3;
}

- (NSArray)excludedMetadataKeys
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setExcludedMetadataKeys:(id)a3
{
}

@end