@interface SQLiteQuery
- (BOOL)createTemporaryTableWithName:(id)a3 properties:(id)a4;
- (BOOL)deleteAllEntities;
- (SQLiteConnection)connection;
- (SQLiteQueryDescriptor)queryDescriptor;
- (id)_newSelectSQLWithProperties:(id)a3;
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

@implementation SQLiteQuery

- (void)enumerateMemoryEntitiesWithProperties:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  descriptor = self->_descriptor;
  if (!descriptor || (uint64_t memoryEntityClass = (uint64_t)descriptor->_memoryEntityClass) == 0) {
    uint64_t memoryEntityClass = objc_opt_class();
  }
  if ([v6 count])
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1002FEFD8;
    v13[3] = &unk_100527678;
    v10 = (id *)v14;
    v14[0] = v7;
    v14[1] = memoryEntityClass;
    id v11 = v7;
    [(SQLiteQuery *)self enumeratePersistentIDsAndProperties:v6 usingBlock:v13];
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1002FEF58;
    v15[3] = &unk_100527650;
    v10 = (id *)v16;
    v16[0] = v7;
    v16[1] = memoryEntityClass;
    id v12 = v7;
    [(SQLiteQuery *)self enumeratePersistentIDsUsingBlock:v15];
  }
}

- (id)initOnConnection:(id)a3 descriptor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SQLiteQuery;
  v9 = [(SQLiteQuery *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    id v11 = (SQLiteQueryDescriptor *)[v8 copy];
    descriptor = v10->_descriptor;
    v10->_descriptor = v11;
  }
  return v10;
}

- (void)enumeratePersistentIDsAndProperties:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SQLiteQuery *)self _newSelectSQLWithProperties:v6];
  connection = self->_connection;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100009290;
  v12[3] = &unk_1005276F0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  sub_100009834((uint64_t)connection, v8, v12);
}

- (id)_newSelectSQLWithProperties:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  descriptor = self->_descriptor;
  if (descriptor) {
    Class entityClass = descriptor->_entityClass;
  }
  else {
    Class entityClass = 0;
  }
  id v8 = [(objc_class *)entityClass disambiguatedSQLForProperty:@"ROWID"];
  [v5 addObject:v8];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v4;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = -[objc_class disambiguatedSQLForProperty:](entityClass, "disambiguatedSQLForProperty:", *(void *)(*((void *)&v17 + 1) + 8 * (void)v13), (void)v17);
        [v5 addObject:v14];

        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  id v15 = [(SQLiteQueryDescriptor *)self->_descriptor _newSelectSQLWithProperties:v9 columns:v5];
  return v15;
}

- (void)applyBinding:(id)a3 atIndex:(int *)a4
{
  id v6 = a3;
  descriptor = self->_descriptor;
  if (descriptor) {
    predicate = descriptor->_predicate;
  }
  else {
    predicate = 0;
  }
  id v11 = v6;
  [(SQLitePredicate *)predicate applyBinding:v6 atIndex:a4];
  id v9 = self->_descriptor;
  if (v9)
  {
    int64_t limitCount = v9->_limitCount;
    if (limitCount) {
      [v11 bindInt64:limitCount atPosition:(*a4)++];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (SQLiteConnection)connection
{
  return self->_connection;
}

- (id)copyEntityIdentifiers
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002FE790;
  v5[3] = &unk_100523780;
  id v3 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v6 = v3;
  [(SQLiteQuery *)self enumeratePersistentIDsUsingBlock:v5];

  return v3;
}

- (id)copySelectSQLWithProperties:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  descriptor = self->_descriptor;
  if (descriptor) {
    Class entityClass = descriptor->_entityClass;
  }
  else {
    Class entityClass = 0;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = -[objc_class disambiguatedSQLForProperty:](entityClass, "disambiguatedSQLForProperty:", *(void *)(*((void *)&v16 + 1) + 8 * (void)v12), (void)v16);
        [v5 addObject:v13];

        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  id v14 = [(SQLiteQueryDescriptor *)self->_descriptor _newSelectSQLWithProperties:v8 columns:v5];
  return v14;
}

- (int64_t)countOfEntities
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002FEA10;
  v4[3] = &unk_1005275D8;
  v4[4] = &v5;
  [(SQLiteQuery *)self enumeratePersistentIDsUsingBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)createTemporaryTableWithName:(id)a3 properties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)NSMutableString) initWithString:@"CREATE TEMPORARY TABLE "];
  v26 = v6;
  [v8 appendString:v6];
  [v8 appendString:@" AS "];
  id v9 = [(SQLiteQueryDescriptor *)self->_descriptor copy];
  uint64_t v11 = v9;
  if (v9)
  {
    objc_setProperty_nonatomic_copy(v9, v10, 0, 40);
    objc_setProperty_nonatomic_copy(v11, v12, 0, 48);
  }
  id v13 = objc_alloc_init((Class)NSMutableArray);
  descriptor = self->_descriptor;
  if (descriptor) {
    Class entityClass = descriptor->_entityClass;
  }
  else {
    Class entityClass = 0;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v16 = v7;
  id v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      long long v20 = 0;
      do
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = [(objc_class *)entityClass disambiguatedSQLForProperty:*(void *)(*((void *)&v29 + 1) + 8 * (void)v20)];
        [v13 addObject:v21];

        long long v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v18);
  }

  id v22 = [v11 _newSelectSQLWithProperties:v16 columns:v13];
  [v8 appendString:v22];
  [v8 appendString:@";"];
  connection = self->_connection;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1002FECA4;
  v27[3] = &unk_1005214E0;
  id v28 = v11;
  id v24 = v11;
  LOBYTE(connection) = sub_100012004((uint64_t)connection, v8, 0, v27);

  return (char)connection;
}

- (BOOL)deleteAllEntities
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  connection = self->_connection;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002FEDB0;
  v5[3] = &unk_100527628;
  void v5[4] = self;
  v5[5] = &v6;
  sub_100011D9C((uint64_t)connection, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)enumerateMemoryEntitiesUsingBlock:(id)a3
{
  id v7 = a3;
  descriptor = self->_descriptor;
  if (!descriptor || (uint64_t memoryEntityClass = descriptor->_memoryEntityClass) == 0) {
    uint64_t memoryEntityClass = objc_opt_class();
  }
  uint64_t v6 = [memoryEntityClass defaultProperties];
  [(SQLiteQuery *)self enumerateMemoryEntitiesWithProperties:v6 usingBlock:v7];
}

- (void)enumeratePersistentIDsUsingBlock:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002FF114;
  v5[3] = &unk_100527578;
  id v6 = a3;
  id v4 = v6;
  [(SQLiteQuery *)self enumeratePersistentIDsAndProperties:0 usingBlock:v5];
}

- (SQLiteQueryDescriptor)queryDescriptor
{
  id v2 = [(SQLiteQueryDescriptor *)self->_descriptor copy];
  return (SQLiteQueryDescriptor *)v2;
}

@end