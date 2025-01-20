@interface _MSPQueryState
- (NSArray)contents;
- (NSArray)identifiers;
- (_MSPQueryState)initWithContainerContents:(id)a3;
- (_MSPQueryState)initWithContents:(id)a3 identifiers:(id)a4;
- (id)stateByDeletingObjectAtIndex:(unint64_t)a3;
- (id)stateByDeletingObjectsAtIndexes:(id)a3;
- (id)stateByInvokingPreprocessingBlock:(id)a3 mappingBlock:(id)a4;
- (id)stateByMovingObjectAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
@end

@implementation _MSPQueryState

- (_MSPQueryState)initWithContainerContents:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_MSPQueryState;
  v5 = [(_MSPQueryState *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contents = v5->_contents;
    v5->_contents = (NSArray *)v6;

    id v8 = v4;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v20 + 1) + 8 * v14) storageIdentifier];
          if (v15) {
            [v9 addObject:v15];
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    uint64_t v16 = [v9 copy];
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSArray *)v16;
  }
  return v5;
}

- (_MSPQueryState)initWithContents:(id)a3 identifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_MSPQueryState;
  id v8 = [(_MSPQueryState *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    contents = v8->_contents;
    v8->_contents = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    identifiers = v8->_identifiers;
    v8->_identifiers = (NSArray *)v11;
  }
  return v8;
}

- (id)stateByInvokingPreprocessingBlock:(id)a3 mappingBlock:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *))a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (v6)
  {
    id v8 = [(_MSPQueryState *)self contents];
    uint64_t v9 = v6[2](v6, v8);
  }
  else
  {
    uint64_t v9 = 0;
  }
  long long v20 = v6;
  long long v23 = objc_opt_new();
  long long v22 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v24 = self;
  id obj = [(_MSPQueryState *)self contents];
  uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = v7[2](v7, *(void *)(*((void *)&v25 + 1) + 8 * i), v9);
        if (v15)
        {
          uint64_t v16 = [(_MSPQueryState *)v24 identifiers];
          v17 = [v16 objectAtIndexedSubscript:v12 + i];

          [v23 addObject:v15];
          [v22 addObject:v17];
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      v12 += i;
    }
    while (v11);
  }

  v18 = (void *)[objc_alloc((Class)objc_opt_class()) initWithContents:v23 identifiers:v22];

  return v18;
}

- (id)stateByDeletingObjectAtIndex:(unint64_t)a3
{
  v5 = [(_MSPQueryState *)self contents];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [(_MSPQueryState *)self identifiers];
  id v8 = (void *)[v7 mutableCopy];

  [v6 removeObjectAtIndex:a3];
  [v8 removeObjectAtIndex:a3];
  uint64_t v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithContents:v6 identifiers:v8];

  return v9;
}

- (id)stateByDeletingObjectsAtIndexes:(id)a3
{
  id v4 = a3;
  v5 = [(_MSPQueryState *)self contents];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [(_MSPQueryState *)self identifiers];
  id v8 = (void *)[v7 mutableCopy];

  [v6 removeObjectsAtIndexes:v4];
  [v8 removeObjectsAtIndexes:v4];

  uint64_t v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithContents:v6 identifiers:v8];

  return v9;
}

- (id)stateByMovingObjectAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  id v7 = [(_MSPQueryState *)self contents];
  id v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = [(_MSPQueryState *)self identifiers];
  uint64_t v10 = (void *)[v9 mutableCopy];

  uint64_t v11 = [v8 objectAtIndexedSubscript:a3];
  [v8 removeObjectAtIndex:a3];
  [v8 insertObject:v11 atIndex:a4];
  uint64_t v12 = [v10 objectAtIndexedSubscript:a3];
  [v10 removeObjectAtIndex:a3];
  [v10 insertObject:v12 atIndex:a4];
  uint64_t v13 = (void *)[objc_alloc((Class)objc_opt_class()) initWithContents:v8 identifiers:v10];

  return v13;
}

- (NSArray)contents
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)identifiers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);

  objc_storeStrong((id *)&self->_contents, 0);
}

@end