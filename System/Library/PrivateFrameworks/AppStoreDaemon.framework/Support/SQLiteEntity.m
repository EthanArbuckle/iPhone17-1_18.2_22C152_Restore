@interface SQLiteEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)foreignDatabaseColumnForProperty:(id)a3;
+ (id)foreignDatabaseTableForProperty:(id)a3;
+ (id)foreignDatabaseTablesToDelete;
+ (id)foreignKeyColumnForTable:(id)a3;
+ (id)joinClauseForProperty:(id)a3;
+ (id)memoryEntityForPersistentID:(int64_t)a3 usingConnection:(id)a4;
+ (id)memoryEntityForPersistentID:(int64_t)a3 withProperties:(id)a4 usingConnection:(id)a5;
- (BOOL)deleteFromDatabase;
- (BOOL)existsInDatabase;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (BOOL)setValuesWithDictionary:(id)a3;
- (SQLiteConnection)connection;
- (SQLiteEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4;
- (SQLiteEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4;
- (id)getValuesForProperties:(id)a3;
- (id)valueForProperty:(id)a3;
- (int64_t)persistentID;
@end

@implementation SQLiteEntity

+ (id)disambiguatedSQLForProperty:(id)a3
{
  id v4 = a3;
  v5 = [a1 joinClauseForProperty:v4];

  if (v5)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [a1 databaseTable];
    id v6 = +[NSString stringWithFormat:@"%@.%@", v7, v4];
  }
  return v6;
}

+ (id)joinClauseForProperty:(id)a3
{
  return 0;
}

+ (id)memoryEntityForPersistentID:(int64_t)a3 usingConnection:(id)a4
{
  return [a1 memoryEntityForPersistentID:a3 withProperties:0 usingConnection:a4];
}

+ (id)memoryEntityForPersistentID:(int64_t)a3 withProperties:(id)a4 usingConnection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = (objc_class *)[a1 memoryEntityClass];
  v11 = v10;
  if (!v8)
  {
    id v8 = [(objc_class *)v10 defaultProperties];
  }
  id v12 = [objc_alloc((Class)a1) initWithPersistentID:a3 onConnection:v9];

  id v13 = [[v11 alloc] initWithDatabaseEntity:v12 properties:v8];
  return v13;
}

- (SQLiteEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SQLiteEntity;
  id v8 = [(SQLiteEntity *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a4);
    v9->_persistentID = a3;
  }

  return v9;
}

- (SQLiteEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKey:@"ROWID"];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 longLongValue];
  }
  else
  {
    CFUUIDRef v11 = CFUUIDCreate(0);
    id v10 = (id)*(_OWORD *)&CFUUIDGetUUIDBytes(v11);
    CFRelease(v11);
  }
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_100365CD4;
  v19 = &unk_1005297D0;
  id v12 = sub_100365BD8(self, v6);
  id v20 = v12;
  id v23 = v10;
  id v13 = v7;
  id v21 = v13;
  v22 = &v24;
  sub_100011D9C((uint64_t)v13, &v16);
  if (!*((unsigned char *)v25 + 24))
  {

    self = 0;
  }
  v14 = -[SQLiteEntity initWithPersistentID:onConnection:](self, "initWithPersistentID:onConnection:", v10, v13, v16, v17, v18, v19);

  _Block_object_dispose(&v24, 8);
  return v14;
}

+ (id)databaseTable
{
  return 0;
}

+ (id)foreignDatabaseColumnForProperty:(id)a3
{
  return 0;
}

+ (id)foreignDatabaseTableForProperty:(id)a3
{
  return 0;
}

+ (id)foreignDatabaseTablesToDelete
{
  return 0;
}

+ (id)foreignKeyColumnForTable:(id)a3
{
  return 0;
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class();
}

- (BOOL)deleteFromDatabase
{
  uint64_t v10 = 0;
  CFUUIDRef v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  connection = self->_connection;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100366320;
  v9[3] = &unk_1005297F8;
  v9[4] = self;
  v9[5] = &v10;
  sub_100011D9C((uint64_t)connection, v9);
  if (*((unsigned char *)v11 + 24))
  {
    int64_t v4 = [(SQLiteEntity *)self persistentID];
    v5 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003665D0;
    block[3] = &unk_100521BF0;
    block[4] = v4;
    dispatch_async(v5, block);

    BOOL v6 = *((unsigned char *)v11 + 24) != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (BOOL)existsInDatabase
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = objc_alloc((Class)NSString);
  int64_t v4 = [(id)objc_opt_class() databaseTable];
  id v5 = [v3 initWithFormat:@"SELECT 1 FROM %@ WHERE %@ = ? LIMIT 1;", v4, @"ROWID"];

  connection = self->_connection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003667CC;
  v8[3] = &unk_100523FE8;
  v8[4] = self;
  v8[5] = &v9;
  sub_100009834((uint64_t)connection, v5, v8);
  LOBYTE(self) = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
}

- (id)getValuesForProperties:(id)a3
{
  id v4 = a3;
  if ([v4 count] == (id)1
    && ([v4 objectAtIndexedSubscript:0],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 isEqualToString:@"ROWID"],
        v5,
        v6))
  {
    CFStringRef v37 = @"ROWID";
    id v7 = +[NSNumber numberWithLongLong:self->_persistentID];
    v38 = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  }
  else
  {
    uint64_t v9 = objc_opt_class();
    id v7 = [v9 databaseTable];
    id v10 = [objc_alloc((Class)NSMutableString) initWithString:@"SELECT "];
    id v11 = objc_alloc_init((Class)NSMutableSet);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100366BA8;
    v32[3] = &unk_100529820;
    v35 = v9;
    id v12 = v10;
    id v33 = v12;
    id v13 = v11;
    id v34 = v13;
    [v4 enumerateObjectsUsingBlock:v32];
    [v12 appendString:@" FROM "];
    [v12 appendString:v7];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v14 = v13;
    id v15 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          [v12 appendString:@" "];
          [v12 appendString:v19];
        }
        id v16 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v16);
    }

    [v12 appendString:@" WHERE "];
    [v12 appendString:v7];
    [v12 appendString:@".ROWID = ?;"];
    id v20 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
    connection = self->_connection;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100366C5C;
    v25[3] = &unk_100529870;
    v25[4] = self;
    id v26 = v4;
    id v22 = v20;
    id v27 = v22;
    sub_100009834((uint64_t)connection, v12, v25);
    id v23 = v27;
    id v8 = v22;
  }
  return v8;
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)NSDictionary);
  uint64_t v9 = v8;
  if (v6)
  {
    id v10 = objc_msgSend(v8, "initWithObjectsAndKeys:", v6, v7, 0);
  }
  else
  {
    id v11 = +[NSNull null];
    id v10 = objc_msgSend(v9, "initWithObjectsAndKeys:", v11, v7, 0);
  }
  BOOL v12 = [(SQLiteEntity *)self setValuesWithDictionary:v10];

  return v12;
}

- (BOOL)setValuesWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  id v5 = objc_opt_class();
  id v6 = [v5 databaseTable];
  connection = self->_connection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10036707C;
  v11[3] = &unk_1005298E8;
  v11[4] = self;
  id v8 = v4;
  id v12 = v8;
  id v15 = v5;
  id v9 = v6;
  id v13 = v9;
  id v14 = &v16;
  sub_100011D9C((uint64_t)connection, v11);
  LOBYTE(v5) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v5;
}

- (id)valueForProperty:(id)a3
{
  id v9 = a3;
  id v4 = a3;
  id v5 = +[NSArray arrayWithObjects:&v9 count:1];
  id v6 = -[SQLiteEntity getValuesForProperties:](self, "getValuesForProperties:", v5, v9);
  id v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

- (SQLiteConnection)connection
{
  return self->_connection;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (void).cxx_destruct
{
}

@end