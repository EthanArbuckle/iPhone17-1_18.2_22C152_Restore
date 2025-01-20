@interface ASUSQLiteQuery
- (ASUSQLiteConnection)connection;
- (ASUSQLiteQueryDescriptor)queryDescriptor;
- (BOOL)createTemporaryTableWithName:(id)a3 properties:(id)a4;
- (BOOL)deleteAllEntities;
- (id)copyEntityIdentifiers;
- (id)copySelectSQLWithProperties:(id)a3;
- (id)initOnConnection:(id)a3 descriptor:(id)a4;
- (int64_t)countOfEntities;
- (void)applyBinding:(id)a3 atIndex:(int *)a4;
- (void)enumerateMemoryEntitiesUsingBlock:(id)a3;
- (void)enumerateMemoryEntitiesWithProperties:(id)a3 usingBlock:(id)a4;
- (void)enumeratePersistentIDsAndProperties:(id)a3 usingBlock:(id)a4;
- (void)enumeratePersistentIDsUsingBlock:(id)a3;
@end

@implementation ASUSQLiteQuery

- (id)initOnConnection:(id)a3 descriptor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASUSQLiteQuery;
  v9 = [(ASUSQLiteQuery *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    uint64_t v11 = [v8 copy];
    descriptor = v10->_descriptor;
    v10->_descriptor = (ASUSQLiteQueryDescriptor *)v11;
  }
  return v10;
}

- (void)applyBinding:(id)a3 atIndex:(int *)a4
{
  id v8 = a3;
  v6 = [(ASUSQLiteQueryDescriptor *)self->_descriptor predicate];
  [v6 applyBinding:v8 atIndex:a4];

  int64_t v7 = [(ASUSQLiteQueryDescriptor *)self->_descriptor limitCount];
  if (v7) {
    [v8 bindInt64:v7 atPosition:(*a4)++];
  }
}

- (ASUSQLiteConnection)connection
{
  return self->_connection;
}

- (id)copyEntityIdentifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__ASUSQLiteQuery_copyEntityIdentifiers__block_invoke;
  v6[3] = &unk_26522FB68;
  id v4 = v3;
  id v7 = v4;
  [(ASUSQLiteQuery *)self enumeratePersistentIDsUsingBlock:v6];

  return v4;
}

void __39__ASUSQLiteQuery_copyEntityIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithLongLong:a2];
  [v2 addObject:v3];
}

- (id)copySelectSQLWithProperties:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  v6 = [(ASUSQLiteQueryDescriptor *)self->_descriptor entityClass];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = -[objc_class disambiguatedSQLForProperty:](v6, "disambiguatedSQLForProperty:", *(void *)(*((void *)&v15 + 1) + 8 * v11), (void)v15);
        [v5 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  id v13 = [(ASUSQLiteQueryDescriptor *)self->_descriptor _newSelectSQLWithProperties:v7 columns:v5];
  return v13;
}

- (int64_t)countOfEntities
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__ASUSQLiteQuery_countOfEntities__block_invoke;
  v4[3] = &unk_26522FB90;
  v4[4] = &v5;
  [(ASUSQLiteQuery *)self enumeratePersistentIDsUsingBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __33__ASUSQLiteQuery_countOfEntities__block_invoke(uint64_t result)
{
  return result;
}

- (BOOL)createTemporaryTableWithName:(id)a3 properties:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"CREATE TEMPORARY TABLE "];
  v22 = v6;
  [v8 appendString:v6];
  [v8 appendString:@" AS "];
  uint64_t v9 = (void *)[(ASUSQLiteQueryDescriptor *)self->_descriptor copy];
  [v9 setOrderingDirections:0];
  [v9 setOrderingProperties:0];
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v11 = [(ASUSQLiteQueryDescriptor *)self->_descriptor entityClass];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = [(objc_class *)v11 disambiguatedSQLForProperty:*(void *)(*((void *)&v25 + 1) + 8 * v16)];
        [v10 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }

  long long v18 = (void *)[v9 _newSelectSQLWithProperties:v12 columns:v10];
  [v8 appendString:v18];
  [v8 appendString:@";"];
  connection = self->_connection;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __58__ASUSQLiteQuery_createTemporaryTableWithName_properties___block_invoke;
  v23[3] = &unk_26522F928;
  id v24 = v9;
  id v20 = v9;
  LOBYTE(connection) = [(ASUSQLiteConnection *)connection executeStatement:v8 error:0 bindings:v23];

  return (char)connection;
}

void __58__ASUSQLiteQuery_createTemporaryTableWithName_properties___block_invoke(uint64_t a1, void *a2)
{
  int v5 = 1;
  int64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 predicate];
  [v4 applyBinding:v3 atIndex:&v5];
}

- (BOOL)deleteAllEntities
{
  connection = self->_connection;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__ASUSQLiteQuery_deleteAllEntities__block_invoke;
  v4[3] = &unk_26522F728;
  v4[4] = self;
  return [(ASUSQLiteConnection *)connection performTransaction:v4 error:0];
}

uint64_t __35__ASUSQLiteQuery_deleteAllEntities__block_invoke(uint64_t a1)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) entityClass];
  id v3 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__ASUSQLiteQuery_deleteAllEntities__block_invoke_2;
  v6[3] = &unk_26522FBB8;
  v6[5] = &v7;
  v6[6] = v2;
  void v6[4] = v3;
  [v3 enumeratePersistentIDsUsingBlock:v6];
  uint64_t v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __35__ASUSQLiteQuery_deleteAllEntities__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = (id)[objc_alloc(*(Class *)(a1 + 48)) initWithPersistentID:a2 onConnection:*(void *)(*(void *)(a1 + 32) + 8)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = [v6 deleteFromDatabase];
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1;
}

- (void)enumerateMemoryEntitiesUsingBlock:(id)a3
{
  descriptor = self->_descriptor;
  id v5 = a3;
  id v6 = [(ASUSQLiteQueryDescriptor *)descriptor memoryEntityClass];
  if (!v6) {
    id v6 = (objc_class *)objc_opt_class();
  }
  id v7 = [(objc_class *)v6 defaultProperties];
  [(ASUSQLiteQuery *)self enumerateMemoryEntitiesWithProperties:v7 usingBlock:v5];
}

- (void)enumerateMemoryEntitiesWithProperties:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ASUSQLiteQueryDescriptor *)self->_descriptor memoryEntityClass];
  if (!v8) {
    uint64_t v8 = (objc_class *)objc_opt_class();
  }
  if ([v6 count])
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __67__ASUSQLiteQuery_enumerateMemoryEntitiesWithProperties_usingBlock___block_invoke_2;
    v12[3] = &unk_26522FC08;
    uint64_t v9 = (id *)v13;
    v13[0] = v7;
    v13[1] = v8;
    id v10 = v7;
    [(ASUSQLiteQuery *)self enumeratePersistentIDsAndProperties:v6 usingBlock:v12];
  }
  else
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __67__ASUSQLiteQuery_enumerateMemoryEntitiesWithProperties_usingBlock___block_invoke;
    v14[3] = &unk_26522FBE0;
    uint64_t v9 = (id *)v15;
    v15[0] = v7;
    v15[1] = v8;
    id v11 = v7;
    [(ASUSQLiteQuery *)self enumeratePersistentIDsUsingBlock:v14];
  }
}

void __67__ASUSQLiteQuery_enumerateMemoryEntitiesWithProperties_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc_init(*(Class *)(a1 + 40));
  [v4 setDatabaseID:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__ASUSQLiteQuery_enumerateMemoryEntitiesWithProperties_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(objc_class **)(a1 + 40);
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  [v7 setDatabaseID:a2];
  [v7 setValuesWithDictionary:v6];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumeratePersistentIDsUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__ASUSQLiteQuery_enumeratePersistentIDsUsingBlock___block_invoke;
  v6[3] = &unk_26522FC30;
  id v7 = v4;
  id v5 = v4;
  [(ASUSQLiteQuery *)self enumeratePersistentIDsAndProperties:0 usingBlock:v6];
}

uint64_t __51__ASUSQLiteQuery_enumeratePersistentIDsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumeratePersistentIDsAndProperties:(id)a3 usingBlock:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (self)
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v10 = [(ASUSQLiteQueryDescriptor *)self->_descriptor entityClass];
    id v11 = [(objc_class *)v10 disambiguatedSQLForProperty:@"ROWID"];
    [v9 addObject:v11];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v26;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = [(objc_class *)v10 disambiguatedSQLForProperty:*(void *)(*((void *)&v25 + 1) + 8 * v16)];
          [v9 addObject:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v14);
    }

    id v18 = [(ASUSQLiteQueryDescriptor *)self->_descriptor _newSelectSQLWithProperties:v12 columns:v9];
  }
  else
  {
    id v18 = 0;
  }

  connection = self->_connection;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __65__ASUSQLiteQuery_enumeratePersistentIDsAndProperties_usingBlock___block_invoke;
  v22[3] = &unk_26522FC80;
  v22[4] = self;
  id v23 = v8;
  id v24 = v7;
  id v20 = v7;
  id v21 = v8;
  [(ASUSQLiteConnection *)connection executeQuery:v18 withResults:v22];
}

void __65__ASUSQLiteQuery_enumeratePersistentIDsAndProperties_usingBlock___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v14 = 1;
  [a1[4] applyBinding:v5 atIndex:&v14];
  uint64_t v7 = [a1[5] count];
  v13[0] = 0;
  v13[1] = v13;
  void v13[2] = 0x2020000000;
  v13[3] = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__ASUSQLiteQuery_enumeratePersistentIDsAndProperties_usingBlock___block_invoke_2;
  v8[3] = &unk_26522FC58;
  uint64_t v12 = v7;
  id v9 = a1[5];
  id v10 = a1[6];
  id v11 = v13;
  [v5 enumerateRowsUsingBlock:v8];

  _Block_object_dispose(v13, 8);
}

void __65__ASUSQLiteQuery_enumeratePersistentIDsAndProperties_usingBlock___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x24C56D840]();
  id v8 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:a1[7]];
  id v9 = v8;
  if (v5)
  {
    id v10 = (void *)a1[4];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    long long v17 = __65__ASUSQLiteQuery_enumeratePersistentIDsAndProperties_usingBlock___block_invoke_3;
    id v18 = &unk_26522F7C0;
    id v11 = v8;
    id v19 = v11;
    id v12 = v5;
    id v20 = v12;
    [v10 enumerateObjectsUsingBlock:&v15];
    uint64_t v13 = a1[5];
    uint64_t v14 = objc_msgSend(v12, "int64ForColumnIndex:", 0, v15, v16, v17, v18);
    ++*(void *)(*(void *)(a1[6] + 8) + 24);
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, v14, v11);
  }
}

void __65__ASUSQLiteQuery_enumeratePersistentIDsAndProperties_usingBlock___block_invoke_3(uint64_t a1, void *a2, int a3)
{
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = (a3 + 1);
  id v6 = a2;
  ASUSQLiteCopyFoundationValue(v4, v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (ASUSQLiteQueryDescriptor)queryDescriptor
{
  uint64_t v2 = (void *)[(ASUSQLiteQueryDescriptor *)self->_descriptor copy];

  return (ASUSQLiteQueryDescriptor *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end