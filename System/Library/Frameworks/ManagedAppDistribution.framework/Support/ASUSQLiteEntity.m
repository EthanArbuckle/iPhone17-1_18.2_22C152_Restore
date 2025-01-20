@interface ASUSQLiteEntity
+ (Class)memoryEntityClass;
+ (id)allOnConnection:(id)a3 predicate:(id)a4;
+ (id)anyOnConnection:(id)a3 predicate:(id)a4;
+ (id)countForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5;
+ (id)databaseTable;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)foreignDatabaseColumnForProperty:(id)a3;
+ (id)foreignDatabaseTableForProperty:(id)a3;
+ (id)foreignDatabaseTablesToDelete;
+ (id)foreignKeyColumnForTable:(id)a3;
+ (id)joinClauseForProperty:(id)a3;
+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5;
+ (id)memoryEntityForPersistentID:(int64_t)a3 usingConnection:(id)a4;
+ (id)memoryEntityForPersistentID:(int64_t)a3 withProperties:(id)a4 usingConnection:(id)a5;
+ (id)minValueForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4 entityClass:(Class)a5;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 entityClass:(Class)a6;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6;
+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6 entityClass:(Class)a7;
+ (id)sumForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5;
- (ASUSQLiteConnection)connection;
- (ASUSQLiteEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4;
- (ASUSQLiteEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4;
- (BOOL)BOOLValueForProperty:(id)a3;
- (BOOL)deleteFromDatabase;
- (BOOL)existsInDatabase;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (BOOL)setValuesWithDictionary:(id)a3;
- (id)dictValueForProperty:(id)a3;
- (id)errorValueForProperty:(id)a3;
- (id)getValuesForProperties:(id)a3;
- (id)numberValueForProperty:(id)a3;
- (id)stringValueForProperty:(id)a3;
- (id)urlValueForProperty:(id)a3;
- (id)uuidValueForProperty:(id)a3;
- (id)valueForProperty:(id)a3;
- (int64_t)integerValueForProperty:(id)a3;
- (int64_t)persistentID;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation ASUSQLiteEntity

- (ASUSQLiteEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ASUSQLiteEntity;
  v8 = [(ASUSQLiteEntity *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a4);
    v9->_persistentID = a3;
  }

  return v9;
}

- (ASUSQLiteEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKey:@"ROWID"];
  v9 = v8;
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
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001696E8;
  v15[3] = &unk_100635C70;
  id v12 = sub_1001695EC(self, v6);
  v17 = &v19;
  id v18 = v10;
  id v16 = v12;
  if (![v7 performTransaction:v15 error:0] || !*((unsigned char *)v20 + 24))
  {

    self = 0;
  }
  v13 = [(ASUSQLiteEntity *)self initWithPersistentID:v10 onConnection:v7];

  _Block_object_dispose(&v19, 8);
  return v13;
}

+ (id)databaseTable
{
  return 0;
}

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
    id v7 = [a1 databaseTable];
    id v6 = +[NSString stringWithFormat:@"%@.%@", v7, v4];
  }

  return v6;
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

+ (id)joinClauseForProperty:(id)a3
{
  return 0;
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class();
}

- (BOOL)deleteFromDatabase
{
  connection = self->_connection;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100169D64;
  v9[3] = &unk_100635C98;
  v9[4] = self;
  unsigned int v4 = [(ASUSQLiteConnection *)connection performTransaction:v9 error:0];
  if (v4)
  {
    int64_t v5 = [(ASUSQLiteEntity *)self persistentID];
    id v6 = dispatch_get_global_queue(21, 0);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100169FEC;
    v8[3] = &unk_100635CB8;
    v8[4] = v5;
    dispatch_async(v6, v8);
  }
  return v4;
}

- (BOOL)existsInDatabase
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = objc_alloc((Class)NSString);
  unsigned int v4 = [(id)objc_opt_class() databaseTable];
  id v5 = [v3 initWithFormat:@"SELECT 1 FROM %@ WHERE %@ = ? LIMIT 1;", v4, @"ROWID"];

  connection = self->_connection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10016A1E8;
  v8[3] = &unk_100635CE0;
  v8[4] = self;
  void v8[5] = &v9;
  [(ASUSQLiteConnection *)connection executeQuery:v5 withResults:v8];
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
    v32[2] = sub_10016A5C4;
    v32[3] = &unk_100635D08;
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
    v20 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
    connection = self->_connection;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10016A678;
    v25[3] = &unk_100635D80;
    v25[4] = self;
    id v26 = v4;
    id v22 = v20;
    id v27 = v22;
    [(ASUSQLiteConnection *)connection executeQuery:v12 withResults:v25];
    v23 = v27;
    id v8 = v22;
  }

  return v8;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
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
  BOOL v12 = [(ASUSQLiteEntity *)self setValuesWithDictionary:v10];

  return v12;
}

- (BOOL)setValuesWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [v5 databaseTable];
  connection = self->_connection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10016AA3C;
  v11[3] = &unk_100635E20;
  v11[4] = self;
  id v12 = v4;
  id v13 = v6;
  id v14 = v5;
  id v8 = v6;
  id v9 = v4;
  LOBYTE(v5) = [(ASUSQLiteConnection *)connection performTransaction:v11 error:0];

  return (char)v5;
}

- (id)valueForProperty:(id)a3
{
  id v9 = a3;
  id v4 = a3;
  id v5 = +[NSArray arrayWithObjects:&v9 count:1];
  id v6 = -[ASUSQLiteEntity getValuesForProperties:](self, "getValuesForProperties:", v5, v9);
  id v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

- (ASUSQLiteConnection)connection
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

- (BOOL)BOOLValueForProperty:(id)a3
{
  id v3 = [(ASUSQLiteEntity *)self numberValueForProperty:a3];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)dictValueForProperty:(id)a3
{
  id v3 = [(ASUSQLiteEntity *)self valueForProperty:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v4 = v3;
  }
  else {
    unsigned __int8 v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)errorValueForProperty:(id)a3
{
  id v3 = [(ASUSQLiteEntity *)self valueForProperty:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (int64_t)integerValueForProperty:(id)a3
{
  id v3 = [(ASUSQLiteEntity *)self numberValueForProperty:a3];
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (id)numberValueForProperty:(id)a3
{
  id v3 = [(ASUSQLiteEntity *)self valueForProperty:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)stringValueForProperty:(id)a3
{
  id v3 = [(ASUSQLiteEntity *)self valueForProperty:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)uuidValueForProperty:(id)a3
{
  id v3 = [(ASUSQLiteEntity *)self valueForProperty:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)urlValueForProperty:(id)a3
{
  id v3 = [(ASUSQLiteEntity *)self valueForProperty:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

+ (id)anyOnConnection:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_10016D208;
  v20 = sub_10016D218;
  id v21 = 0;
  id v8 = [a1 queryOnConnection:v6 predicate:v7];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10016D220;
  v12[3] = &unk_100636000;
  id v14 = &v16;
  id v15 = a1;
  id v9 = v6;
  id v13 = v9;
  [v8 enumeratePersistentIDsUsingBlock:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v10;
}

+ (id)allOnConnection:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_10016D208;
  v20 = sub_10016D218;
  id v21 = (id)objc_opt_new();
  id v8 = [a1 queryOnConnection:v6 predicate:v7];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10016D3F4;
  v12[3] = &unk_100636028;
  id v15 = a1;
  id v9 = v6;
  id v13 = v9;
  id v14 = &v16;
  [v8 enumeratePersistentIDsUsingBlock:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v10;
}

+ (id)countForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  return sub_10016D470((uint64_t)a1, a3, @"COUNT", a4, a5);
}

+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  return sub_10016D470((uint64_t)a1, a3, @"MAX", a4, a5);
}

+ (id)minValueForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  return sub_10016D470((uint64_t)a1, a3, @"MIN", a4, a5);
}

+ (id)sumForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  sub_10016D470((uint64_t)a1, a3, @"SUM", a4, a5);
  id v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = &off_10064D518;
  }
  id v7 = v6;

  return v7;
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4
{
  return _[a1 queryOnConnection:a3 predicate:a4 orderingProperties:0];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5
{
  return _[a1 queryOnConnection:a3 predicate:a4 orderingProperties:a5 orderingDirections:0];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6
{
  return _[a1 queryOnConnection:a3 predicate:a4 orderingProperties:a5 orderingDirections:a6 entityClass:a1];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 entityClass:(Class)a5
{
  return _[a1 queryOnConnection:a3 predicate:a4 orderingProperties:0 orderingDirections:0 entityClass:a5];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 entityClass:(Class)a6
{
  return _[a1 queryOnConnection:a3 predicate:a4 orderingProperties:a5 orderingDirections:0 entityClass:a6];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6 entityClass:(Class)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [[ASUSQLiteQueryDescriptor alloc] initWithEntityClass:a7 memoryEntityClass:[(objc_class *)a7 memoryEntityClass]];
  [(ASUSQLiteQueryDescriptor *)v15 setOrderingProperties:v12];

  [(ASUSQLiteQueryDescriptor *)v15 setOrderingDirections:v11];
  [(ASUSQLiteQueryDescriptor *)v15 setPredicate:v13];

  id v16 = [[ASUSQLiteQuery alloc] initOnConnection:v14 descriptor:v15];

  return v16;
}

+ (id)memoryEntityForPersistentID:(int64_t)a3 usingConnection:(id)a4
{
  return _[a1 memoryEntityForPersistentID:a3 withProperties:0 usingConnection:a4];
}

+ (id)memoryEntityForPersistentID:(int64_t)a3 withProperties:(id)a4 usingConnection:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (objc_class *)[a1 memoryEntityClass];
  id v11 = v10;
  if (!v8)
  {
    id v8 = [(objc_class *)v10 defaultProperties];
  }
  id v12 = [objc_alloc((Class)a1) initWithPersistentID:a3 onConnection:v9];

  id v13 = [[v11 alloc] initWithDatabaseEntity:v12 properties:v8];

  return v13;
}

@end