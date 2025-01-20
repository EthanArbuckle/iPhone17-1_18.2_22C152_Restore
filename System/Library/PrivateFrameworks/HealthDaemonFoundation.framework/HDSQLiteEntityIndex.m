@interface HDSQLiteEntityIndex
- (BOOL)isUnique;
- (Class)entityClass;
- (HDSQLiteEntityIndex)initWithEntity:(Class)a3 name:(id)a4 columns:(id)a5;
- (HDSQLiteEntityIndex)initWithEntity:(Class)a3 name:(id)a4 columns:(id)a5 collationForColumn:(id)a6 unique:(BOOL)a7 predicateString:(id)a8;
- (HDSQLiteEntityIndex)initWithEntity:(Class)a3 name:(id)a4 columns:(id)a5 unique:(BOOL)a6 predicateString:(id)a7;
- (NSArray)columns;
- (NSDictionary)collationColumnMapping;
- (NSString)disambiguatedName;
- (NSString)name;
- (NSString)predicateString;
- (id)creationSQL;
- (void)_columnsAndCollations;
@end

@implementation HDSQLiteEntityIndex

- (HDSQLiteEntityIndex)initWithEntity:(Class)a3 name:(id)a4 columns:(id)a5
{
  return [(HDSQLiteEntityIndex *)self initWithEntity:a3 name:a4 columns:a5 unique:0 predicateString:0];
}

- (HDSQLiteEntityIndex)initWithEntity:(Class)a3 name:(id)a4 columns:(id)a5 unique:(BOOL)a6 predicateString:(id)a7
{
  return [(HDSQLiteEntityIndex *)self initWithEntity:a3 name:a4 columns:a5 collationForColumn:MEMORY[0x263EFFA78] unique:a6 predicateString:a7];
}

- (HDSQLiteEntityIndex)initWithEntity:(Class)a3 name:(id)a4 columns:(id)a5 collationForColumn:(id)a6 unique:(BOOL)a7 predicateString:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v29.receiver = self;
  v29.super_class = (Class)HDSQLiteEntityIndex;
  v18 = [(HDSQLiteEntityIndex *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_entityClass, a3);
    uint64_t v20 = [v14 copy];
    name = v19->_name;
    v19->_name = (NSString *)v20;

    v19->_unique = a7;
    uint64_t v22 = [v16 copy];
    collationColumnMapping = v19->_collationColumnMapping;
    v19->_collationColumnMapping = (NSDictionary *)v22;

    uint64_t v24 = [v15 copy];
    columns = v19->_columns;
    v19->_columns = (NSArray *)v24;

    uint64_t v26 = [v17 copy];
    predicateString = v19->_predicateString;
    v19->_predicateString = (NSString *)v26;
  }
  return v19;
}

- (NSString)disambiguatedName
{
  v3 = [(objc_class *)self->_entityClass databaseName];
  v4 = NSString;
  uint64_t v5 = [(objc_class *)self->_entityClass databaseTable];
  v6 = (void *)v5;
  name = self->_name;
  if (v3) {
    [v4 stringWithFormat:@"%@.%@_%@", v3, v5, name];
  }
  else {
  v8 = [v4 stringWithFormat:@"%@_%@", v5, name, v10];
  }

  return (NSString *)v8;
}

- (id)creationSQL
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"CREATE "];
  v4 = v3;
  if (self->_unique) {
    [v3 appendString:@"UNIQUE "];
  }
  uint64_t v5 = NSString;
  v6 = [(HDSQLiteEntityIndex *)self disambiguatedName];
  v7 = [(objc_class *)self->_entityClass databaseTable];
  v8 = -[HDSQLiteEntityIndex _columnsAndCollations](self);
  v9 = [v8 componentsJoinedByString:@", "];
  uint64_t v10 = [v5 stringWithFormat:@"INDEX IF NOT EXISTS %@ ON %@ (%@)", v6, v7, v9];
  [v4 appendString:v10];

  if (self->_predicateString)
  {
    v11 = [NSString stringWithFormat:@" WHERE (%@)", self->_predicateString];
    [v4 appendString:v11];
  }
  [v4 appendString:@";"];

  return v4;
}

- (void)_columnsAndCollations
{
  v1 = a1;
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
    v3 = (void *)v1[4];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__HDSQLiteEntityIndex__columnsAndCollations__block_invoke;
    v7[3] = &unk_2643D5048;
    v7[4] = v1;
    id v4 = v2;
    id v8 = v4;
    [v3 enumerateObjectsUsingBlock:v7];
    uint64_t v5 = v8;
    v1 = v4;
  }

  return v1;
}

void __44__HDSQLiteEntityIndex__columnsAndCollations__block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "objectForKeyedSubscript:");
  id v4 = v3;
  uint64_t v5 = *(void **)(a1 + 40);
  if (v3)
  {
    v6 = NSString;
    unint64_t v7 = [v3 integerValue];
    if (v7 >= 3)
    {
      unint64_t v9 = v7;
      uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
      v11 = [NSString stringWithUTF8String:"NSString * _Nonnull SQLCollationStringFromType(HDSQLiteIndexCollationType)"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"HDSQLiteEntityIndex.m", 27, @"Invalid HDSQLiteIndexCollationType type: %ld", v9);

      __break(1u);
      return;
    }
    id v8 = [v6 stringWithFormat:@"%@ %@", v12, off_2643D5068[v7]];
    [v5 addObject:v8];
  }
  else
  {
    [v5 addObject:v12];
  }
}

- (Class)entityClass
{
  return self->_entityClass;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)columns
{
  return self->_columns;
}

- (BOOL)isUnique
{
  return self->_unique;
}

- (NSString)predicateString
{
  return self->_predicateString;
}

- (NSDictionary)collationColumnMapping
{
  return self->_collationColumnMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collationColumnMapping, 0);
  objc_storeStrong((id *)&self->_predicateString, 0);
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_entityClass, 0);
}

@end