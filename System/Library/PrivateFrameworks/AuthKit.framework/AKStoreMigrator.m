@interface AKStoreMigrator
- (AKSQLiteExecutor)executor;
- (AKStoreMigrator)initWithExecutor:(id)a3;
- (id)storeName;
- (unint64_t)_schemaVersion;
- (unint64_t)currentSchemaVersion;
- (void)migrateSchemaFromVersion:(unint64_t)a3;
- (void)migrateSchemaIfNecessary;
- (void)setExecutor:(id)a3;
@end

@implementation AKStoreMigrator

- (AKStoreMigrator)initWithExecutor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKStoreMigrator;
  v5 = [(AKStoreMigrator *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_executor, v4);
  }

  return v6;
}

- (void)migrateSchemaIfNecessary
{
  v3 = [(AKStoreMigrator *)self _schemaVersion];
  if (v3 != (void *)[(AKStoreMigrator *)self currentSchemaVersion])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_executor);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000AD78C;
    v5[3] = &unk_100229CA8;
    v5[4] = self;
    v5[5] = v3;
    [WeakRetained performTransactionBlockAndWait:v5];
  }
}

- (unint64_t)_schemaVersion
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_10000F9B0;
  v14 = sub_10000F828;
  id v15 = objc_alloc_init((Class)NSMutableArray);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_executor);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000AD980;
  v9[3] = &unk_100229938;
  v9[4] = &v10;
  [WeakRetained performQuery:@"SELECT db_version FROM version;" rowHandler:v9];

  id v4 = [(id)v11[5] firstObject];
  id v5 = [v4 integerValue];

  v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(AKStoreMigrator *)self storeName];
    *(_DWORD *)buf = 138412546;
    v17 = v7;
    __int16 v18 = 1024;
    int v19 = (int)v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Current %@ database version: %i", buf, 0x12u);
  }
  _Block_object_dispose(&v10, 8);

  return (unint64_t)v5;
}

- (void)migrateSchemaFromVersion:(unint64_t)a3
{
  int v3 = a3;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100190024(v3, v4);
  }
}

- (unint64_t)currentSchemaVersion
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_10019009C(v2);
  }

  return 0;
}

- (id)storeName
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1001900E0(v2);
  }

  return @"<undefined>";
}

- (AKSQLiteExecutor)executor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_executor);

  return (AKSQLiteExecutor *)WeakRetained;
}

- (void)setExecutor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end