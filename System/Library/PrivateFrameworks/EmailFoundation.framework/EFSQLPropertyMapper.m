@interface EFSQLPropertyMapper
+ (id)emptyPropertyMapper;
- (BOOL)_hasAllowedPrefix:(id)a3;
- (BOOL)hasLookupKey:(id)a3 class:(Class)a4 property:(SEL)a5;
- (EFSQLPropertyMapper)init;
- (EFSQLPropertyMapper)initWithAllowedProtocolPrefixes:(id)a3;
- (NSArray)allowedProtocolPrefixes;
- (NSCache)protocolQueueCache;
- (NSMutableDictionary)lookupValues;
- (id)_findAllProtocolsOfClass:(Class)a3 withProperty:(SEL)a4;
- (id)_qualifiedColumnExpressionsForColumn:(id)a3 availableTables:(id)a4 replaceNULL:(BOOL)a5;
- (id)columnForClass:(Class)a3 property:(SEL)a4;
- (id)columnForLookupKey:(id)a3 value:(id)a4;
- (id)columnForProtocol:(id)a3 property:(SEL)a4;
- (id)columnNameForClass:(Class)a3 property:(SEL)a4;
- (id)columnNameForLookupKey:(id)a3 value:(id)a4;
- (id)columnNameForProtocol:(id)a3 property:(SEL)a4;
- (id)qualifiedColumnExpressionForClass:(Class)a3 property:(SEL)a4 availableTables:(id)a5;
- (id)qualifiedColumnExpressionForLookupKey:(id)a3 value:(id)a4 availableTables:(id)a5;
- (id)qualifiedColumnExpressionsForClass:(Class)a3 property:(SEL)a4 availableTables:(id)a5;
- (id)qualifiedColumnNamesForClass:(Class)a3 property:(SEL)a4 availableTables:(id)a5;
- (id)valueForLookupKey:(id)a3 class:(Class)a4 property:(SEL)a5;
- (id)valueForLookupKey:(id)a3 protocol:(id)a4 property:(SEL)a5;
- (void)_registerQualifiedColumns:(id)a3 lookupKeys:(id)a4 forClass:(Class)a5 property:(SEL)a6;
- (void)registerColumn:(id)a3 forClass:(Class)a4 property:(SEL)a5 lookupKeys:(id)a6;
- (void)registerColumn:(id)a3 forProtocol:(id)a4 property:(SEL)a5 lookupKeys:(id)a6;
- (void)registerColumnName:(id)a3 table:(id)a4 lookupKeys:(id)a5;
- (void)registerColumnName:(id)a3 table:(id)a4 lookupKeys:(id)a5 forClass:(Class)a6 property:(SEL)a7;
- (void)registerColumnNames:(id)a3 table:(id)a4 forClass:(Class)a5 property:(SEL)a6;
- (void)setAllowedProtocolPrefixes:(id)a3;
- (void)setLookupValues:(id)a3;
- (void)setProtocolQueueCache:(id)a3;
@end

@implementation EFSQLPropertyMapper

+ (id)emptyPropertyMapper
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  [v2 setLookupValues:MEMORY[0x1E4F1CC08]];
  return v2;
}

- (EFSQLPropertyMapper)initWithAllowedProtocolPrefixes:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EFSQLPropertyMapper;
  v6 = [(EFSQLPropertyMapper *)&v12 init];
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lookupValues = v6->_lookupValues;
    v6->_lookupValues = v7;

    objc_storeStrong((id *)&v6->_allowedProtocolPrefixes, a3);
    v9 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    protocolQueueCache = v6->_protocolQueueCache;
    v6->_protocolQueueCache = v9;
  }
  return v6;
}

- (EFSQLPropertyMapper)init
{
  return [(EFSQLPropertyMapper *)self initWithAllowedProtocolPrefixes:MEMORY[0x1E4F1CBF0]];
}

- (void)registerColumn:(id)a3 forClass:(Class)a4 property:(SEL)a5 lookupKeys:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  if (!class_getInstanceMethod(a4, a5))
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"EFSQLPropertyMapper.m", 152, @"Invalid parameter not satisfying: %@", @"class_getInstanceMethod(class, property) && \"property does not exist on class\"" object file lineNumber description];
  }
  uint64_t v13 = _keyForClassInstanceProperty(@"EFSQLPropertyMapperLookupKeyQualifiedColumnByProperty", a4, a5);
  v26 = (void *)v13;
  v14 = [(EFSQLPropertyMapper *)self lookupValues];
  v15 = [v14 objectForKeyedSubscript:v13];

  if (v15)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"EFSQLPropertyMapper.m", 155, @"A column is already registed for key=%@", v13 object file lineNumber description];
  }
  v16 = [(EFSQLPropertyMapper *)self lookupValues];
  [v16 setObject:v11 forKeyedSubscript:v13];

  [(EFSQLPropertyMapper *)self _findAllProtocolsOfClass:a4 withProperty:a5];
  SEL v17 = a2;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v34;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v18);
        }
        [(EFSQLPropertyMapper *)self registerColumn:v11 forProtocol:*(void *)(*((void *)&v33 + 1) + 8 * v21++) property:a5 lookupKeys:v12];
      }
      while (v19 != v21);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v19);
  }

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __67__EFSQLPropertyMapper_registerColumn_forClass_property_lookupKeys___block_invoke;
  v27[3] = &unk_1E6123340;
  v27[4] = self;
  SEL v30 = v17;
  id v22 = v11;
  id v28 = v22;
  Class v31 = a4;
  SEL v32 = a5;
  id v23 = v26;
  id v29 = v23;
  [v12 enumerateKeysAndObjectsUsingBlock:v27];
}

void __67__EFSQLPropertyMapper_registerColumn_forClass_property_lookupKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  v6 = _keyForLookupValue(v17, v5);
  v7 = [*(id *)(a1 + 32) lookupValues];
  v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"EFSQLPropertyMapper.m", 165, @"A column is already registed for lookupKey=%@ value=%@", v17, v5 object file lineNumber description];
  }
  uint64_t v9 = *(void *)(a1 + 40);
  v10 = [*(id *)(a1 + 32) lookupValues];
  [v10 setObject:v9 forKeyedSubscript:v6];

  id v11 = _keyForClassInstanceProperty(v17, *(objc_class **)(a1 + 64), *(const char **)(a1 + 72));
  id v12 = [*(id *)(a1 + 32) lookupValues];
  uint64_t v13 = [v12 objectForKeyedSubscript:v11];

  if (v13)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"EFSQLPropertyMapper.m", 169, @"A value is already registed for lookupKey=%@ classKey=%@", v17, *(void *)(a1 + 48) object file lineNumber description];
  }
  v14 = [*(id *)(a1 + 32) lookupValues];
  [v14 setObject:v5 forKeyedSubscript:v11];
}

- (void)registerColumn:(id)a3 forProtocol:(id)a4 property:(SEL)a5 lookupKeys:(id)a6
{
  id v11 = a3;
  id v12 = (Protocol *)a4;
  id v13 = a6;
  Name = sel_getName(a5);
  if (!protocol_getProperty(v12, Name, 1, 1))
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"EFSQLPropertyMapper.m", 178, @"Invalid parameter not satisfying: %@", @"protocol_getProperty(protocol, sel_getName(property), YES, YES) && \"property does not exist on protocol\"" object file lineNumber description];
  }
  v15 = _keyForProtocolInstanceProperty(@"EFSQLPropertyMapperLookupKeyQualifiedColumnByProperty", v12, a5);
  v16 = [(EFSQLPropertyMapper *)self lookupValues];
  id v17 = [v16 objectForKeyedSubscript:v15];

  if (v17)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"EFSQLPropertyMapper.m", 182, @"A column is already registered for key=%@", v15 object file lineNumber description];
  }
  id v18 = [(EFSQLPropertyMapper *)self lookupValues];
  [v18 setObject:v11 forKeyedSubscript:v15];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __70__EFSQLPropertyMapper_registerColumn_forProtocol_property_lookupKeys___block_invoke;
  v23[3] = &unk_1E6123368;
  uint64_t v19 = v12;
  v24 = v19;
  v25 = self;
  SEL v27 = a5;
  SEL v28 = a2;
  id v20 = v15;
  id v26 = v20;
  [v13 enumerateKeysAndObjectsUsingBlock:v23];
}

void __70__EFSQLPropertyMapper_registerColumn_forProtocol_property_lookupKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  v6 = _keyForProtocolInstanceProperty(v11, *(Protocol **)(a1 + 32), *(const char **)(a1 + 56));
  v7 = [*(id *)(a1 + 40) lookupValues];
  v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 40), @"EFSQLPropertyMapper.m", 187, @"A value is already registed for lookupKey=%@ protoKey=%@", v11, *(void *)(a1 + 48) object file lineNumber description];
  }
  uint64_t v9 = [*(id *)(a1 + 40) lookupValues];
  [v9 setObject:v5 forKeyedSubscript:v6];
}

- (id)columnForClass:(Class)a3 property:(SEL)a4
{
  v6 = [(EFSQLPropertyMapper *)self valueForLookupKey:@"EFSQLPropertyMapperLookupKeyQualifiedColumnByProperty" class:a3 property:a4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"EFSQLPropertyMapper.m" lineNumber:194 description:@"Column has incorrect type"];
  }
  return v6;
}

- (id)columnForProtocol:(id)a3 property:(SEL)a4
{
  v6 = [(EFSQLPropertyMapper *)self valueForLookupKey:@"EFSQLPropertyMapperLookupKeyQualifiedColumnByProperty" protocol:a3 property:a4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"EFSQLPropertyMapper.m" lineNumber:200 description:@"Column has incorrect type"];
  }
  return v6;
}

- (id)columnForLookupKey:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = _keyForLookupValue(v7, v8);
  v10 = [(EFSQLPropertyMapper *)self lookupValues];
  id v11 = [v10 objectForKeyedSubscript:v9];

  if (!v11)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"EFSQLPropertyMapper.m", 207, @"Schema doesn't define column for lookupKey=%@ value=%@", v7, v8 object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"EFSQLPropertyMapper.m" lineNumber:208 description:@"Column has incorrect type"];
  }
  return v11;
}

- (void)registerColumnNames:(id)a3 table:(id)a4 forClass:(Class)a5 property:(SEL)a6
{
  id v10 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__EFSQLPropertyMapper_registerColumnNames_table_forClass_property___block_invoke;
  v13[3] = &unk_1E6123390;
  id v11 = v10;
  id v14 = v11;
  id v12 = objc_msgSend(a3, "ef_map:", v13);
  [(EFSQLPropertyMapper *)self _registerQualifiedColumns:v12 lookupKeys:MEMORY[0x1E4F1CC08] forClass:a5 property:a6];
}

id __67__EFSQLPropertyMapper_registerColumnNames_table_forClass_property___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = +[EFPair pairWithFirst:*(void *)(a1 + 32) second:a2];
  return v2;
}

- (void)registerColumnName:(id)a3 table:(id)a4 lookupKeys:(id)a5 forClass:(Class)a6 property:(SEL)a7
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = +[EFPair pairWithFirst:v13 second:v12];
  v17[0] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];

  [(EFSQLPropertyMapper *)self _registerQualifiedColumns:v16 lookupKeys:v14 forClass:a6 property:a7];
}

- (void)_registerQualifiedColumns:(id)a3 lookupKeys:(id)a4 forClass:(Class)a5 property:(SEL)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v34 = a4;
  SEL v30 = a5;
  if (!class_getInstanceMethod(a5, a6))
  {
    SEL v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"EFSQLPropertyMapper.m", 242, @"Invalid parameter not satisfying: %@", @"class_getInstanceMethod(class, property) && \"property does not exist on class\"" object file lineNumber description];
  }
  if ([v35 count] == 1)
  {
    id v10 = [v35 firstObject];
    id v11 = [v10 second];

    id v12 = [v35 firstObject];
    id v13 = [v12 first];

    [(EFSQLPropertyMapper *)self registerColumnName:v11 table:v13 lookupKeys:v34];
  }
  Class v31 = _keyForClassInstanceProperty(@"EFSQLPropertyMapperLookupKeyQualifiedColumnByProperty", v30, a6);
  id v14 = [(EFSQLPropertyMapper *)self lookupValues];
  v15 = [v14 objectForKeyedSubscript:v31];

  if (v15)
  {
    id v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"EFSQLPropertyMapper.m", 251, @"A column is already registed for key=%@", v31 object file lineNumber description];
  }
  v16 = [(EFSQLPropertyMapper *)self lookupValues];
  [v16 setObject:v35 forKeyedSubscript:v31];

  [(EFSQLPropertyMapper *)self _findAllProtocolsOfClass:v30 withProperty:a6];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v46 != v18) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(Protocol **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v21 = _keyForProtocolInstanceProperty(@"EFSQLPropertyMapperLookupKeyQualifiedColumnByProperty", v20, a6);
        id v22 = [(EFSQLPropertyMapper *)self lookupValues];
        id v23 = [v22 objectForKeyedSubscript:v21];

        if (v23 && ([v23 isEqual:v35] & 1) == 0)
        {
          id v26 = [MEMORY[0x1E4F28B00] currentHandler];
          [v26 handleFailureInMethod:a2, self, @"EFSQLPropertyMapper.m", 262, @"A column is already registered for key=%@", v21 object file lineNumber description];
        }
        v24 = [(EFSQLPropertyMapper *)self lookupValues];
        [v24 setObject:v35 forKeyedSubscript:v21];

        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __78__EFSQLPropertyMapper__registerQualifiedColumns_lookupKeys_forClass_property___block_invoke;
        v41[3] = &unk_1E6123368;
        v41[4] = v20;
        v41[5] = self;
        SEL v43 = a6;
        SEL v44 = a2;
        id v25 = v21;
        id v42 = v25;
        [v34 enumerateKeysAndObjectsUsingBlock:v41];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v17);
  }

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __78__EFSQLPropertyMapper__registerQualifiedColumns_lookupKeys_forClass_property___block_invoke_2;
  v36[3] = &unk_1E61233B8;
  uint64_t v38 = v30;
  SEL v39 = a6;
  v36[4] = self;
  SEL v40 = a2;
  id v27 = v31;
  id v37 = v27;
  [v34 enumerateKeysAndObjectsUsingBlock:v36];
}

void __78__EFSQLPropertyMapper__registerQualifiedColumns_lookupKeys_forClass_property___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  v6 = _keyForProtocolInstanceProperty(v11, *(Protocol **)(a1 + 32), *(const char **)(a1 + 56));
  id v7 = [*(id *)(a1 + 40) lookupValues];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 40), @"EFSQLPropertyMapper.m", 268, @"A value is already registed for lookupKey=%@ protoKey=%@", v11, *(void *)(a1 + 48) object file lineNumber description];
  }
  uint64_t v9 = [*(id *)(a1 + 40) lookupValues];
  [v9 setObject:v5 forKeyedSubscript:v6];
}

void __78__EFSQLPropertyMapper__registerQualifiedColumns_lookupKeys_forClass_property___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  v6 = _keyForClassInstanceProperty(v11, *(objc_class **)(a1 + 48), *(const char **)(a1 + 56));
  id v7 = [*(id *)(a1 + 32) lookupValues];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"EFSQLPropertyMapper.m", 275, @"A value is already registed for lookupKey=%@ classKey=%@", v11, *(void *)(a1 + 40) object file lineNumber description];
  }
  uint64_t v9 = [*(id *)(a1 + 32) lookupValues];
  [v9 setObject:v5 forKeyedSubscript:v6];
}

- (void)registerColumnName:(id)a3 table:(id)a4 lookupKeys:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = +[EFPair pairWithFirst:v10 second:v9];
  v18[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__EFSQLPropertyMapper_registerColumnName_table_lookupKeys___block_invoke;
  v15[3] = &unk_1E61233E0;
  id v16 = v13;
  SEL v17 = a2;
  v15[4] = self;
  id v14 = v13;
  [v11 enumerateKeysAndObjectsUsingBlock:v15];
}

void __59__EFSQLPropertyMapper_registerColumnName_table_lookupKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  v6 = _keyForLookupValue(v12, v5);
  id v7 = [*(id *)(a1 + 32) lookupValues];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"EFSQLPropertyMapper.m", 287, @"A column is already registed for lookupKey=%@ value=%@", v12, v5 object file lineNumber description];
  }
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) lookupValues];
  [v10 setObject:v9 forKeyedSubscript:v6];
}

- (id)columnNameForClass:(Class)a3 property:(SEL)a4
{
  v4 = [(EFSQLPropertyMapper *)self valueForLookupKey:@"EFSQLPropertyMapperLookupKeyQualifiedColumnByProperty" class:a3 property:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 name];
  }
  else
  {
    v6 = [v4 firstObject];
    id v5 = [v6 second];
  }
  return v5;
}

- (id)columnNameForProtocol:(id)a3 property:(SEL)a4
{
  v4 = [(EFSQLPropertyMapper *)self valueForLookupKey:@"EFSQLPropertyMapperLookupKeyQualifiedColumnByProperty" protocol:a3 property:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 name];
  }
  else
  {
    v6 = [v4 firstObject];
    id v5 = [v6 second];
  }
  return v5;
}

- (id)columnNameForLookupKey:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = _keyForLookupValue(v7, v8);
  id v10 = [(EFSQLPropertyMapper *)self lookupValues];
  id v11 = [v10 objectForKeyedSubscript:v9];

  if (!v11)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"EFSQLPropertyMapper.m", 313, @"Schema doesn't define column for lookupKey=%@ value=%@", v7, v8 object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [v11 name];
  }
  else
  {
    id v13 = [NSString alloc];
    id v14 = [v11 firstObject];
    v15 = [v14 first];
    id v16 = [v11 firstObject];
    SEL v17 = [v16 second];
    id v12 = (void *)[v13 initWithFormat:@"%@.%@", v15, v17];
  }
  return v12;
}

- (id)qualifiedColumnExpressionForLookupKey:(id)a3 value:(id)a4 availableTables:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = _keyForLookupValue(v9, v10);
  id v13 = [(EFSQLPropertyMapper *)self lookupValues];
  id v14 = [v13 objectForKeyedSubscript:v12];

  if (!v14)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"EFSQLPropertyMapper.m", 327, @"Schema doesn't define column for lookupKey=%@ value=%@", v9, v10 object file lineNumber description];
  }
  v15 = [(EFSQLPropertyMapper *)self _qualifiedColumnExpressionsForColumn:v14 availableTables:v11 replaceNULL:1];
  id v16 = [v15 componentsJoinedByString:@", "];

  return v16;
}

- (id)qualifiedColumnExpressionForClass:(Class)a3 property:(SEL)a4 availableTables:(id)a5
{
  id v8 = a5;
  id v9 = [(EFSQLPropertyMapper *)self valueForLookupKey:@"EFSQLPropertyMapperLookupKeyQualifiedColumnByProperty" class:a3 property:a4];
  id v10 = [(EFSQLPropertyMapper *)self _qualifiedColumnExpressionsForColumn:v9 availableTables:v8 replaceNULL:1];
  id v11 = [v10 componentsJoinedByString:@", "];

  return v11;
}

- (id)qualifiedColumnExpressionsForClass:(Class)a3 property:(SEL)a4 availableTables:(id)a5
{
  id v8 = a5;
  id v9 = [(EFSQLPropertyMapper *)self valueForLookupKey:@"EFSQLPropertyMapperLookupKeyQualifiedColumnByProperty" class:a3 property:a4];
  id v10 = [(EFSQLPropertyMapper *)self _qualifiedColumnExpressionsForColumn:v9 availableTables:v8 replaceNULL:1];

  return v10;
}

- (id)qualifiedColumnNamesForClass:(Class)a3 property:(SEL)a4 availableTables:(id)a5
{
  id v8 = a5;
  id v9 = [(EFSQLPropertyMapper *)self valueForLookupKey:@"EFSQLPropertyMapperLookupKeyQualifiedColumnByProperty" class:a3 property:a4];
  id v10 = [(EFSQLPropertyMapper *)self _qualifiedColumnExpressionsForColumn:v9 availableTables:v8 replaceNULL:0];

  return v10;
}

- (id)_qualifiedColumnExpressionsForColumn:(id)a3 availableTables:(id)a4 replaceNULL:(BOOL)a5
{
  BOOL v5 = a5;
  v35[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v10 = v7;
  id v29 = v10;
  if (isKindOfClass)
  {
    id v11 = [v10 table];
    id v12 = [v11 name];
    int v13 = [v8 containsObject:v12];

    if (v13)
    {
      id v14 = [v29 fullNameWithDatabaseName:0];
      v35[0] = v14;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    }
    else if (v5)
    {
      v15 = &unk_1F0EC0188;
    }
    else
    {
      v15 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v28 = v7;
    v15 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v16 = v29;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v16);
          }
          id v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v21 = [v20 first];
          int v22 = [v8 containsObject:v21];

          if (v22)
          {
            id v23 = NSString;
            v24 = [v20 first];
            id v25 = [v20 second];
            id v26 = [v23 stringWithFormat:@"%@.%@", v24, v25, v28];
            [v15 addObject:v26];
          }
          else if (v5)
          {
            [v15 addObject:@"NULL"];
          }
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v17);
    }
  }
  return v15;
}

- (BOOL)hasLookupKey:(id)a3 class:(Class)a4 property:(SEL)a5
{
  v6 = _keyForClassInstanceProperty(a3, a4, a5);
  id v7 = [(EFSQLPropertyMapper *)self lookupValues];
  id v8 = [v7 objectForKeyedSubscript:v6];
  BOOL v9 = v8 != 0;

  return v9;
}

- (id)valueForLookupKey:(id)a3 class:(Class)a4 property:(SEL)a5
{
  id v9 = a3;
  id v10 = _keyForClassInstanceProperty(v9, a4, a5);
  id v11 = [(EFSQLPropertyMapper *)self lookupValues];
  id v12 = [v11 objectForKeyedSubscript:v10];

  if (!v12)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = NSStringFromSelector(a5);
    [v14 handleFailureInMethod:a2, self, @"EFSQLPropertyMapper.m", 390, @"Schema doesn't define value for lookupKey=%@ class=%@ property=%@", v9, a4, v15 object file lineNumber description];
  }
  return v12;
}

- (id)valueForLookupKey:(id)a3 protocol:(id)a4 property:(SEL)a5
{
  id v9 = a3;
  id v10 = (Protocol *)a4;
  id v11 = _keyForProtocolInstanceProperty(v9, v10, a5);
  id v12 = [(EFSQLPropertyMapper *)self lookupValues];
  int v13 = [v12 objectForKeyedSubscript:v11];

  if (!v13)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    id v16 = NSStringFromSelector(a5);
    [v15 handleFailureInMethod:a2, self, @"EFSQLPropertyMapper.m", 398, @"Schema doesn't define value for lookupKey=%@ protocol=%@ property=%@", v9, v10, v16 object file lineNumber description];
  }
  return v13;
}

- (BOOL)_hasAllowedPrefix:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(EFSQLPropertyMapper *)self allowedProtocolPrefixes];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = [(EFSQLPropertyMapper *)self allowedProtocolPrefixes];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          if ([v4 hasPrefix:*(void *)(*((void *)&v12 + 1) + 8 * i)])
          {
            LOBYTE(v8) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (id)_findAllProtocolsOfClass:(Class)a3 withProperty:(SEL)a4
{
  id v7 = [(EFSQLPropertyMapper *)self protocolQueueCache];
  uint64_t v8 = NSStringFromClass(a3);
  uint64_t v9 = [v7 objectForKey:v8];

  id v10 = (void *)[v9 mutableCopy];
  id v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  long long v13 = v12;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__EFSQLPropertyMapper__findAllProtocolsOfClass_withProperty___block_invoke;
  aBlock[3] = &unk_1E6123408;
  aBlock[4] = self;
  id v14 = v13;
  id v29 = v14;
  long long v15 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (!v9)
  {
    uint64_t v24 = 0;
    for (uint64_t i = a3; i; uint64_t i = class_getSuperclass(i))
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __61__EFSQLPropertyMapper__findAllProtocolsOfClass_withProperty___block_invoke_2;
      v27[3] = &__block_descriptor_40_e10___16__0_I8lu32l8;
      v27[4] = i;
      v15[2](v15, v27);
    }
    uint64_t v17 = [(EFSQLPropertyMapper *)self protocolQueueCache];
    uint64_t v9 = 0;
    uint64_t v18 = (void *)[v14 copy];
    uint64_t v19 = NSStringFromClass(a3);
    [v17 setObject:v18 forKey:v19];
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  while (objc_msgSend(v14, "count", v24))
  {
    uint64_t v21 = [v14 anyObject];
    [v14 removeObject:v21];
    if (([v20 containsObject:v21] & 1) == 0)
    {
      Name = sel_getName(a4);
      if (protocol_getProperty(v21, Name, 1, 1)) {
        [v20 addObject:v21];
      }
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __61__EFSQLPropertyMapper__findAllProtocolsOfClass_withProperty___block_invoke_3;
      v25[3] = &unk_1E6123450;
      id v26 = v21;
      v15[2](v15, v25);
    }
  }

  return v20;
}

void __61__EFSQLPropertyMapper__findAllProtocolsOfClass_withProperty___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  unsigned int v9 = 0;
  id v4 = (id *)v3[2](v3, &v9);
  if (v9)
  {
    for (unint64_t i = 0; i < v9; ++i)
    {
      uint64_t v6 = (Protocol *)v4[i];
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = NSStringFromProtocol(v6);
      LODWORD(v7) = [v7 _hasAllowedPrefix:v8];

      if (v7) {
        [*(id *)(a1 + 40) addObject:v6];
      }
    }
  }
  free(v4);
}

Protocol **__61__EFSQLPropertyMapper__findAllProtocolsOfClass_withProperty___block_invoke_2(uint64_t a1, unsigned int *a2)
{
  return class_copyProtocolList(*(Class *)(a1 + 32), a2);
}

Protocol **__61__EFSQLPropertyMapper__findAllProtocolsOfClass_withProperty___block_invoke_3(uint64_t a1, unsigned int *a2)
{
  return protocol_copyProtocolList(*(Protocol **)(a1 + 32), a2);
}

- (NSMutableDictionary)lookupValues
{
  return self->_lookupValues;
}

- (void)setLookupValues:(id)a3
{
}

- (NSArray)allowedProtocolPrefixes
{
  return self->_allowedProtocolPrefixes;
}

- (void)setAllowedProtocolPrefixes:(id)a3
{
}

- (NSCache)protocolQueueCache
{
  return self->_protocolQueueCache;
}

- (void)setProtocolQueueCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolQueueCache, 0);
  objc_storeStrong((id *)&self->_allowedProtocolPrefixes, 0);
  objc_storeStrong((id *)&self->_lookupValues, 0);
}

@end