@interface SQLiteTransporter
+ (BOOL)_isKnownDatabasePath:(id)a3;
+ (void)_addKnownDatabasePath:(id)a3;
+ (void)_removeKnownDatabasePath:(id)a3;
- (BOOL)canBeginTransportation;
- (BOOL)endTransporationAndRemoveDatabase;
- (SQLiteTransporter)initWithDatabasePath:(id)a3;
- (void)performTransportationUsingBlock:(id)a3;
@end

@implementation SQLiteTransporter

- (SQLiteTransporter)initWithDatabasePath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SQLiteTransporter;
  v6 = [(SQLiteTransporter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_databasePath, a3);
  }

  return v7;
}

- (BOOL)canBeginTransportation
{
  p_databasePath = &self->_databasePath;
  if (+[SQLiteTransporter _isKnownDatabasePath:self->_databasePath])
  {
    if (qword_10039F710 != -1) {
      dispatch_once(&qword_10039F710, &stru_100357668);
    }
    v4 = qword_10039F6F8;
    if (os_log_type_enabled((os_log_t)qword_10039F6F8, OS_LOG_TYPE_ERROR)) {
      sub_1002C1010((uint64_t)p_databasePath, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    v11 = +[NSFileManager defaultManager];
    unsigned __int8 v12 = [v11 fileExistsAtPath:*p_databasePath];

    if (v12)
    {
      +[SQLiteTransporter _addKnownDatabasePath:self->_databasePath];
      v13 = [[SQLiteConnectionOptions alloc] initWithDatabasePath:self->_databasePath];
      [(SQLiteConnectionOptions *)v13 setReadOnly:1];
      v14 = [[SQLiteConnection alloc] initWithOptions:v13];
      connection = self->_connection;
      self->_connection = v14;

      BOOL v16 = [(SQLiteConnection *)self->_connection open];
      return v16;
    }
    if (qword_10039F710 != -1) {
      dispatch_once(&qword_10039F710, &stru_100357668);
    }
    v18 = qword_10039F6F8;
    if (os_log_type_enabled((os_log_t)qword_10039F6F8, OS_LOG_TYPE_ERROR)) {
      sub_1002C1080((uint64_t)p_databasePath, v18, v19, v20, v21, v22, v23, v24);
    }
  }
  return 0;
}

- (BOOL)endTransporationAndRemoveDatabase
{
  if ([(SQLiteConnection *)self->_connection close] && sub_100038660(self->_databasePath))
  {
    +[SQLiteTransporter _removeKnownDatabasePath:self->_databasePath];
    LOBYTE(v3) = 1;
  }
  else
  {
    if (qword_10039F710 != -1) {
      dispatch_once(&qword_10039F710, &stru_100357668);
    }
    v4 = qword_10039F6F8;
    BOOL v3 = os_log_type_enabled((os_log_t)qword_10039F6F8, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      sub_1002C10F0((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)performTransportationUsingBlock:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002CEA0;
  v7[3] = &unk_100357608;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SQLiteConnection *)connection performTransaction:v7];
}

+ (void)_addKnownDatabasePath:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10039F6C0);
  BOOL v3 = +[AppDefaultsManager transporterConfiguration];
  id v4 = [v3 mutableCopy];

  if (v4)
  {
    uint64_t v5 = [v4 objectForKeyedSubscript:@"knownPaths"];
    id v6 = [v5 mutableCopy];

    if (v6)
    {
      [v6 addObject:v7];
      goto LABEL_6;
    }
  }
  else
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v6 = +[NSMutableArray arrayWithObject:v7];
LABEL_6:
  [v4 setObject:v6 forKeyedSubscript:@"knownPaths"];
  +[AppDefaultsManager setTransporterConfiguration:v4];
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10039F6C0);
}

+ (BOOL)_isKnownDatabasePath:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10039F6C0);
  id v4 = +[AppDefaultsManager transporterConfiguration];
  id v5 = [v4 mutableCopy];

  if (v5)
  {
    id v6 = [v5 objectForKeyedSubscript:@"knownPaths"];
    id v7 = [v6 mutableCopy];

    if (v7)
    {
      id v8 = [v7 indexesOfObjectsPassingTest:&stru_100357648];
      if ([v8 count])
      {
        [v7 removeObjectsAtIndexes:v8];
        [v5 setObject:v7 forKeyedSubscript:@"knownPaths"];
        +[AppDefaultsManager setTransporterConfiguration:v5];
      }
      unsigned __int8 v9 = [v7 containsObject:v3];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10039F6C0);

  return v9;
}

+ (void)_removeKnownDatabasePath:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10039F6C0);
  id v3 = +[AppDefaultsManager transporterConfiguration];
  id v4 = [v3 mutableCopy];

  if (v4)
  {
    id v5 = [v4 objectForKeyedSubscript:@"knownPaths"];
    id v6 = [v5 mutableCopy];

    if (v6)
    {
      [v6 removeObject:v7];
      [v4 setObject:v6 forKeyedSubscript:@"knownPaths"];
      +[AppDefaultsManager setTransporterConfiguration:v4];
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10039F6C0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databasePath, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end