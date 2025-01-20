@interface _DPModelInfoRecordMOConverter
- (BOOL)copyRecord:(id)a3 intoManagedObject:(id)a4;
- (id)createRecordFromManagedObject:(id)a3;
- (id)insertRecord:(id)a3 inManagedObjectContext:(id)a4;
- (id)insertRecords:(id)a3 inManagedObjectContext:(id)a4;
- (id)updateRecords:(id)a3 inManagedObjectContext:(id)a4;
@end

@implementation _DPModelInfoRecordMOConverter

- (id)createRecordFromManagedObject:(id)a3
{
  return +[_DPModelInfoRecord createRecordFromManagedObject:a3];
}

- (BOOL)copyRecord:(id)a3 intoManagedObject:(id)a4
{
  return [a3 copyToManagedObject:a4];
}

- (id)insertRecord:(id)a3 inManagedObjectContext:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F1C0A8];
  id v7 = a4;
  id v8 = a3;
  v9 = [(id)objc_opt_class() entityName];
  v10 = [v6 insertNewObjectForEntityForName:v9 inManagedObjectContext:v7];

  v13[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v7 obtainPermanentIDsForObjects:v11 error:0];

  [(_DPModelInfoRecordMOConverter *)self copyRecord:v8 intoManagedObject:v10];
  return v10;
}

- (id)insertRecords:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v15 = -[_DPModelInfoRecordMOConverter insertRecord:inManagedObjectContext:](self, "insertRecord:inManagedObjectContext:", v14, v7, (void)v17);
          [v8 addObject:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)updateRecords:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = [v13 objectId];
          v15 = [v6 objectWithID:v14];

          if (v15)
          {
            [(_DPModelInfoRecordMOConverter *)self copyRecord:v13 intoManagedObject:v15];
            [v7 addObject:v15];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v7;
}

@end