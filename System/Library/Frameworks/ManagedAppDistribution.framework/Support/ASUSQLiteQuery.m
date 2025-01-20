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
    v11 = (ASUSQLiteQueryDescriptor *)[v8 copy];
    descriptor = v10->_descriptor;
    v10->_descriptor = v11;
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
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10016B9BC;
  v5[3] = &unk_100635EC0;
  id v3 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v6 = v3;
  [(ASUSQLiteQuery *)self enumeratePersistentIDsUsingBlock:v5];

  return v3;
}

- (id)copySelectSQLWithProperties:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [(ASUSQLiteQueryDescriptor *)self->_descriptor entityClass];
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
      v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = -[objc_class disambiguatedSQLForProperty:](v6, "disambiguatedSQLForProperty:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v11), (void)v15);
        [v5 addObject:v12];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  id v13 = [(ASUSQLiteQueryDescriptor *)self->_descriptor _newSelectSQLWithProperties:v7 columns:v5];
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
  v4[2] = sub_10016BC34;
  v4[3] = &unk_100635EE8;
  v4[4] = &v5;
  [(ASUSQLiteQuery *)self enumeratePersistentIDsUsingBlock:v4];
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
  id v9 = [(ASUSQLiteQueryDescriptor *)self->_descriptor copy];
  [v9 setOrderingDirections:0];
  [v9 setOrderingProperties:0];
  id v10 = objc_alloc_init((Class)NSMutableArray);
  v11 = [(ASUSQLiteQueryDescriptor *)self->_descriptor entityClass];
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
  v23[2] = sub_10016BEB0;
  v23[3] = &unk_100635E98;
  id v24 = v9;
  id v20 = v9;
  LOBYTE(connection) = [(ASUSQLiteConnection *)connection executeStatement:v8 error:0 bindings:v23];

  return (char)connection;
}

- (BOOL)deleteAllEntities
{
  connection = self->_connection;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10016BF84;
  v4[3] = &unk_100635C98;
  v4[4] = self;
  return [(ASUSQLiteConnection *)connection performTransaction:v4 error:0];
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
  id v8 = [(ASUSQLiteQueryDescriptor *)self->_descriptor memoryEntityClass];
  if (!v8) {
    id v8 = (objc_class *)objc_opt_class();
  }
  if ([v6 count])
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10016C350;
    v12[3] = &unk_100635F60;
    id v9 = (id *)v13;
    v13[0] = v7;
    v13[1] = v8;
    id v10 = v7;
    [(ASUSQLiteQuery *)self enumeratePersistentIDsAndProperties:v6 usingBlock:v12];
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10016C2D0;
    v14[3] = &unk_100635F38;
    id v9 = (id *)v15;
    v15[0] = v7;
    v15[1] = v8;
    id v11 = v7;
    [(ASUSQLiteQuery *)self enumeratePersistentIDsUsingBlock:v14];
  }
}

- (void)enumeratePersistentIDsUsingBlock:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10016C48C;
  v5[3] = &unk_100635F88;
  id v6 = a3;
  id v4 = v6;
  [(ASUSQLiteQuery *)self enumeratePersistentIDsAndProperties:0 usingBlock:v5];
}

- (void)enumeratePersistentIDsAndProperties:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10016C58C((id *)&self->super.isa, v6);
  connection = self->_connection;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10016C714;
  v12[3] = &unk_100635FD8;
  void v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(ASUSQLiteConnection *)connection executeQuery:v8 withResults:v12];
}

- (ASUSQLiteQueryDescriptor)queryDescriptor
{
  id v2 = [(ASUSQLiteQueryDescriptor *)self->_descriptor copy];

  return (ASUSQLiteQueryDescriptor *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end