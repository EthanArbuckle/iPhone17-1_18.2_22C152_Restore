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

- (void)applyBinding:(id)a3 atIndex:(int *)a4
{
  id v8 = a3;
  v6 = [(SQLiteQueryDescriptor *)self->_descriptor predicate];
  [v6 applyBinding:v8 atIndex:a4];

  int64_t v7 = [(SQLiteQueryDescriptor *)self->_descriptor limitCount];
  if (v7) {
    [v8 bindInt64:v7 atPosition:(*a4)++];
  }
}

- (void)enumeratePersistentIDsUsingBlock:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100080C38;
  v5[3] = &unk_100358940;
  id v6 = a3;
  id v4 = v6;
  [(SQLiteQuery *)self enumeratePersistentIDsAndProperties:0 usingBlock:v5];
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
    v11 = (SQLiteQueryDescriptor *)[v8 copy];
    descriptor = v10->_descriptor;
    v10->_descriptor = v11;
  }
  return v10;
}

- (id)_newSelectSQLWithProperties:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [(SQLiteQueryDescriptor *)self->_descriptor entityClass];
  id v7 = [(objc_class *)v6 disambiguatedSQLForProperty:@"ROWID"];
  [v5 addObject:v7];

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
      v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = -[objc_class disambiguatedSQLForProperty:](v6, "disambiguatedSQLForProperty:", *(void *)(*((void *)&v16 + 1) + 8 * (void)v12), (void)v16);
        [v5 addObject:v13];

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  id v14 = [(SQLiteQueryDescriptor *)self->_descriptor _newSelectSQLWithProperties:v8 columns:v5];
  return v14;
}

- (void)enumeratePersistentIDsAndProperties:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SQLiteQuery *)self _newSelectSQLWithProperties:v6];
  connection = self->_connection;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000098D4;
  v12[3] = &unk_100359EE0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(SQLiteConnection *)connection executeQuery:v8 withResults:v12];
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
  v5[2] = sub_100080204;
  v5[3] = &unk_100359DC8;
  id v3 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v6 = v3;
  [(SQLiteQuery *)self enumeratePersistentIDsUsingBlock:v5];

  return v3;
}

- (id)copySelectSQLWithProperties:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [(SQLiteQueryDescriptor *)self->_descriptor entityClass];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = -[objc_class disambiguatedSQLForProperty:](v6, "disambiguatedSQLForProperty:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v11), (void)v15);
        [v5 addObject:v12];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  id v13 = [(SQLiteQueryDescriptor *)self->_descriptor _newSelectSQLWithProperties:v7 columns:v5];
  return v13;
}

- (int64_t)countOfEntities
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008047C;
  v4[3] = &unk_100359DF0;
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
  v22 = v6;
  [v8 appendString:v6];
  [v8 appendString:@" AS "];
  id v9 = [(SQLiteQueryDescriptor *)self->_descriptor copy];
  [v9 setOrderingDirections:0];
  [v9 setOrderingProperties:0];
  id v10 = objc_alloc_init((Class)NSMutableArray);
  id v11 = [(SQLiteQueryDescriptor *)self->_descriptor entityClass];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v7;
  id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      long long v16 = 0;
      do
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = [(objc_class *)v11 disambiguatedSQLForProperty:*(void *)(*((void *)&v25 + 1) + 8 * (void)v16)];
        [v10 addObject:v17];

        long long v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }

  id v18 = [v9 _newSelectSQLWithProperties:v12 columns:v10];
  [v8 appendString:v18];
  [v8 appendString:@";"];
  connection = self->_connection;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000806F8;
  v23[3] = &unk_100357088;
  id v24 = v9;
  id v20 = v9;
  LOBYTE(connection) = [(SQLiteConnection *)connection executeStatement:v8 error:0 bindings:v23];

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
  v5[2] = sub_10008081C;
  v5[3] = &unk_100359E40;
  void v5[4] = self;
  v5[5] = &v6;
  [(SQLiteConnection *)connection performTransaction:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)enumerateMemoryEntitiesUsingBlock:(id)a3
{
  descriptor = self->_descriptor;
  id v5 = a3;
  uint64_t v6 = [(SQLiteQueryDescriptor *)descriptor memoryEntityClass];
  if (!v6) {
    uint64_t v6 = (objc_class *)objc_opt_class();
  }
  id v7 = [(objc_class *)v6 defaultProperties];
  [(SQLiteQuery *)self enumerateMemoryEntitiesWithProperties:v7 usingBlock:v5];
}

- (void)enumerateMemoryEntitiesWithProperties:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SQLiteQueryDescriptor *)self->_descriptor memoryEntityClass];
  if (!v8) {
    uint64_t v8 = (objc_class *)objc_opt_class();
  }
  if ([v6 count])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100080B94;
    v12[3] = &unk_100359E90;
    char v9 = (id *)v13;
    v13[0] = v7;
    v13[1] = v8;
    id v10 = v7;
    [(SQLiteQuery *)self enumeratePersistentIDsAndProperties:v6 usingBlock:v12];
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100080B14;
    v14[3] = &unk_100359E68;
    char v9 = (id *)v15;
    v15[0] = v7;
    v15[1] = v8;
    id v11 = v7;
    [(SQLiteQuery *)self enumeratePersistentIDsUsingBlock:v14];
  }
}

- (SQLiteQueryDescriptor)queryDescriptor
{
  id v2 = [(SQLiteQueryDescriptor *)self->_descriptor copy];

  return (SQLiteQueryDescriptor *)v2;
}

@end