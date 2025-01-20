@interface SQLiteEntity
+ (BOOL)_insertValues:(id)a3 intoTable:(id)a4 withPersistentID:(int64_t)a5 onConnection:(id)a6;
+ (Class)memoryEntityClass;
+ (id)_aggregateValueForProperty:(id)a3 function:(id)a4 predicate:(id)a5 onConnection:(id)a6;
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
- (BOOL)BOOLValueForProperty:(id)a3;
- (BOOL)_deleteRowFromTable:(id)a3 usingColumn:(id)a4;
- (BOOL)deleteFromDatabase;
- (BOOL)existsInDatabase;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (BOOL)setValuesWithDictionary:(id)a3;
- (SQLiteConnection)connection;
- (SQLiteEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4;
- (SQLiteEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4;
- (id)_copyTableClusteredValuesWithValues:(id)a3;
- (id)errorValueForProperty:(id)a3;
- (id)getValuesForProperties:(id)a3;
- (id)numberValueForProperty:(id)a3;
- (id)stringValueForProperty:(id)a3;
- (id)urlValueForProperty:(id)a3;
- (id)uuidValueForProperty:(id)a3;
- (id)valueForProperty:(id)a3;
- (int64_t)integerValueForProperty:(id)a3;
- (int64_t)persistentID;
@end

@implementation SQLiteEntity

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6 entityClass:(Class)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [[SQLiteQueryDescriptor alloc] initWithEntityClass:a7 memoryEntityClass:[(objc_class *)a7 memoryEntityClass]];
  [(SQLiteQueryDescriptor *)v15 setOrderingProperties:v12];

  [(SQLiteQueryDescriptor *)v15 setOrderingDirections:v11];
  [(SQLiteQueryDescriptor *)v15 setPredicate:v13];

  id v16 = [[SQLiteQuery alloc] initOnConnection:v14 descriptor:v15];

  return v16;
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
    v7 = [a1 databaseTable];
    id v6 = +[NSString stringWithFormat:@"%@.%@", v7, v4];
  }

  return v6;
}

+ (id)joinClauseForProperty:(id)a3
{
  return 0;
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 orderingDirections:(id)a6
{
  return _[a1 queryOnConnection:a3 predicate:a4 orderingProperties:a5 orderingDirections:a6 entityClass:a1];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5
{
  return [a1 queryOnConnection:a3 predicate:a4 orderingProperties:a5 orderingDirections:0];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4
{
  return [a1 queryOnConnection:a3 predicate:a4 orderingProperties:0];
}

+ (Class)memoryEntityClass
{
  return (Class)objc_opt_class();
}

- (SQLiteEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SQLiteEntity;
  v8 = [(SQLiteEntity *)&v11 init];
  v9 = v8;
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
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_100027734;
  v19 = &unk_1003572A8;
  id v12 = [(SQLiteEntity *)self _copyTableClusteredValuesWithValues:v6];
  id v20 = v12;
  id v23 = v10;
  id v13 = v7;
  id v21 = v13;
  v22 = &v24;
  [v13 performTransaction:&v16];
  if (!*((unsigned char *)v25 + 24))
  {

    self = 0;
  }
  id v14 = -[SQLiteEntity initWithPersistentID:onConnection:](self, "initWithPersistentID:onConnection:", v10, v13, v16, v17, v18, v19);

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

- (BOOL)deleteFromDatabase
{
  uint64_t v10 = 0;
  CFUUIDRef v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  connection = self->_connection;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000279F0;
  v9[3] = &unk_1003572D0;
  v9[4] = self;
  v9[5] = &v10;
  [(SQLiteConnection *)connection performTransaction:v9];
  if (*((unsigned char *)v11 + 24))
  {
    int64_t v4 = [(SQLiteEntity *)self persistentID];
    v5 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100027BC4;
    block[3] = &unk_1003572F0;
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
  v8[2] = sub_100027DC0;
  v8[3] = &unk_100357318;
  v8[4] = self;
  v8[5] = &v9;
  [(SQLiteConnection *)connection executeQuery:v5 withResults:v8];
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
    v32[2] = sub_10002819C;
    v32[3] = &unk_100357340;
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
    v25[2] = sub_100028250;
    v25[3] = &unk_1003573B8;
    v25[4] = self;
    id v26 = v4;
    id v22 = v20;
    id v27 = v22;
    [(SQLiteConnection *)connection executeQuery:v12 withResults:v25];
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
  v11[2] = sub_100028670;
  v11[3] = &unk_100357458;
  v11[4] = self;
  id v8 = v4;
  id v12 = v8;
  id v15 = v5;
  id v9 = v6;
  id v13 = v9;
  id v14 = &v16;
  [(SQLiteConnection *)connection performTransaction:v11];
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

+ (BOOL)_insertValues:(id)a3 intoTable:(id)a4 withPersistentID:(int64_t)a5 onConnection:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [objc_alloc((Class)NSMutableString) initWithString:@"INSERT OR REPLACE INTO "];
  [v12 appendString:v10];
  objc_msgSend(v12, "appendString:", @" (");
  id v31 = a1;
  uint64_t v13 = [a1 foreignKeyColumnForTable:v10];
  id v14 = (void *)v13;
  if (v13) {
    CFStringRef v15 = (const __CFString *)v13;
  }
  else {
    CFStringRef v15 = @"ROWID";
  }
  [v12 appendString:v15];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  id v16 = v9;
  id v17 = [v16 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v42;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v42 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        [v12 appendString:@", "];
        [v12 appendString:v21];
      }
      id v18 = [v16 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v18);
  }

  [v12 appendString:@") VALUES (?"];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v22 = v16;
  id v23 = (char *)[v22 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v38;
    while (1)
    {
      if (*(void *)v38 != v25) {
        objc_enumerationMutation(v22);
      }
      [v12 appendString:@", ?"];
      if (!--v24)
      {
        uint64_t v24 = (char *)[v22 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (!v24) {
          break;
        }
      }
    }
  }

  [v12 appendString:@";"]);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100029134;
  v33[3] = &unk_100357480;
  int64_t v35 = a5;
  id v36 = 0;
  id v26 = v22;
  id v34 = v26;
  unsigned __int8 v27 = [v11 executeStatement:v12 error:&v36 bindings:v33];
  id v28 = v36;
  if (v28)
  {
    if (qword_10039F598 != -1) {
      dispatch_once(&qword_10039F598, &stru_1003574C8);
    }
    long long v29 = (void *)qword_10039F580;
    if (os_log_type_enabled((os_log_t)qword_10039F580, OS_LOG_TYPE_ERROR)) {
      sub_1002C0DA8(v29, (uint64_t)v31, (uint64_t)v28);
    }
  }

  return v27;
}

- (id)_copyTableClusteredValuesWithValues:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = objc_opt_class();
  [v5 databaseTable];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100029370;
  v11[3] = &unk_1003574A8;
  id v14 = v5;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v4;
  id v13 = v6;
  id v7 = v12;
  [v3 enumerateKeysAndObjectsUsingBlock:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (BOOL)_deleteRowFromTable:(id)a3 usingColumn:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"DELETE FROM %@ WHERE %@ = ?;",
         v7,
         v6);

  connection = self->_connection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002955C;
  v11[3] = &unk_100357088;
  void v11[4] = self;
  LOBYTE(v7) = [(SQLiteConnection *)connection executeStatement:v8 error:0 bindings:v11];

  return (char)v7;
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

- (BOOL)BOOLValueForProperty:(id)a3
{
  id v3 = [(SQLiteEntity *)self numberValueForProperty:a3];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)errorValueForProperty:(id)a3
{
  id v3 = [(SQLiteEntity *)self valueForProperty:a3];
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
  id v3 = [(SQLiteEntity *)self numberValueForProperty:a3];
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (id)numberValueForProperty:(id)a3
{
  id v3 = [(SQLiteEntity *)self valueForProperty:a3];
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
  id v3 = [(SQLiteEntity *)self valueForProperty:a3];
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
  id v3 = [(SQLiteEntity *)self valueForProperty:a3];
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
  id v3 = [(SQLiteEntity *)self valueForProperty:a3];
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
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_100081008;
  id v20 = sub_100081018;
  id v21 = 0;
  id v8 = [a1 queryOnConnection:v6 predicate:v7];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100081020;
  v12[3] = &unk_100359F08;
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
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_100081008;
  id v20 = sub_100081018;
  id v21 = (id)objc_opt_new();
  id v8 = [a1 queryOnConnection:v6 predicate:v7];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000811F4;
  v12[3] = &unk_100359F30;
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
  return [a1 _aggregateValueForProperty:a3 function:@"COUNT" predicate:a4 onConnection:a5];
}

+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  return [a1 _aggregateValueForProperty:a3 function:@"MAX" predicate:a4 onConnection:a5];
}

+ (id)minValueForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  return [a1 _aggregateValueForProperty:a3 function:@"MIN" predicate:a4 onConnection:a5];
}

+ (id)sumForProperty:(id)a3 predicate:(id)a4 onConnection:(id)a5
{
  id v5 = [a1 _aggregateValueForProperty:a3 function:@"SUM" predicate:a4 onConnection:a5];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = &off_100373BA8;
  }
  id v7 = v6;

  return v7;
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 entityClass:(Class)a5
{
  return _[a1 queryOnConnection:a3 predicate:a4 orderingProperties:0 orderingDirections:0 entityClass:a5];
}

+ (id)queryOnConnection:(id)a3 predicate:(id)a4 orderingProperties:(id)a5 entityClass:(Class)a6
{
  return _[a1 queryOnConnection:a3 predicate:a4 orderingProperties:a5 orderingDirections:0 entityClass:a6];
}

+ (id)_aggregateValueForProperty:(id)a3 function:(id)a4 predicate:(id)a5 onConnection:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = sub_100081008;
  id v31 = sub_100081018;
  id v32 = 0;
  id v14 = [[SQLiteQueryDescriptor alloc] initWithEntityClass:a1];
  [(SQLiteQueryDescriptor *)v14 setPredicate:v12];
  id v15 = objc_alloc((Class)NSString);
  uint64_t v16 = [a1 disambiguatedSQLForProperty:v10];
  id v17 = [v15 initWithFormat:@"%@(%@)", v11, v16];

  id v33 = v10;
  uint64_t v18 = +[NSArray arrayWithObjects:&v33 count:1];
  uint64_t v19 = +[NSArray arrayWithObject:v17];
  id v20 = [(SQLiteQueryDescriptor *)v14 _newSelectSQLWithProperties:v18 columns:v19];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10008159C;
  v24[3] = &unk_100357318;
  id v21 = v14;
  uint64_t v25 = v21;
  id v26 = &v27;
  [v13 executeQuery:v20 withResults:v24];
  id v22 = (id)v28[5];

  _Block_object_dispose(&v27, 8);

  return v22;
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