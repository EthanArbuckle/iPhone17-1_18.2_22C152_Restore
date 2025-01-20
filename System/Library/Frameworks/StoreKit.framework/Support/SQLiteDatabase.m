@interface SQLiteDatabase
- (BOOL)connectionNeedsResetForCorruption:(id)a3;
- (BOOL)connectionNeedsResetForReopen:(id)a3;
- (BOOL)tableExists:(id)a3;
- (SQLiteDatabase)initWithConnection:(id)a3;
- (SQLiteDatabase)initWithConnectionOptions:(id)a3;
- (void)_modifyUsingTransactionClass:(Class)a3 withBlock:(id)a4;
- (void)_performMigrationIfNeededForStore:(id)a3;
- (void)_readUsingSession:(id)a3 withBlock:(id)a4;
- (void)_reentrantSafePerformBlock:(id)a3;
- (void)assertOnTransactionQueue;
- (void)modifyStore:(id)a3 usingTransaction:(id)a4;
- (void)modifyStore:(id)a3 usingTransactionClass:(Class)a4 withBlock:(id)a5;
- (void)readStore:(id)a3 usingSession:(id)a4;
- (void)verifyDatabaseIntegrity;
@end

@implementation SQLiteDatabase

- (void)_reentrantSafePerformBlock:(id)a3
{
  specific = (SQLiteDatabase *)dispatch_get_specific("_SQLiteDispatchQueueTag");
  transactionQueue = self->_transactionQueue;
  block = (void (**)(void))a3;
  if (specific == self)
  {
    dispatch_assert_queue_V2(transactionQueue);
    block[2]();
  }
  else
  {
    dispatch_assert_queue_not_V2(transactionQueue);
    dispatch_sync((dispatch_queue_t)self->_transactionQueue, block);
  }
}

- (void)_performMigrationIfNeededForStore:(id)a3
{
  id v4 = a3;
  migratedStores = self->_migratedStores;
  v6 = (const void *)objc_opt_class();
  if (!NSHashGet(migratedStores, v6))
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 1;
    v7 = [(id)objc_opt_class() storeDescriptor];
    v8 = [SQLiteDatabaseStoreSchema alloc];
    connection = self->_connection;
    v10 = [v7 schemaName];
    v11 = [(SQLiteDatabaseStoreSchema *)v8 initWithConnection:connection schemaName:v10];

    v12 = self->_connection;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000657FC;
    v18[3] = &unk_100359418;
    v21 = &v22;
    id v19 = v4;
    v13 = v11;
    v20 = v13;
    [(SQLiteConnection *)v12 performTransaction:v18];
    if (*((unsigned char *)v23 + 24))
    {
      v14 = self->_migratedStores;
      v15 = (const void *)objc_opt_class();
      NSHashInsert(v14, v15);
    }
    else
    {
      if (qword_10039FCE8 != -1) {
        dispatch_once(&qword_10039FCE8, &stru_100359438);
      }
      v16 = (id)qword_10039FCD0;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        v17 = [v7 schemaName];
        sub_1002C664C(v17, buf, [(SQLiteDatabaseStoreSchema *)v13 currentSchemaVersion], v16);
      }
    }
    _Block_object_dispose(&v22, 8);
  }
}

- (void)_readUsingSession:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);
  connection = self->_connection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100021874;
  v11[3] = &unk_100357608;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [(SQLiteConnection *)connection performTransaction:v11];
}

- (void)readStore:(id)a3 usingSession:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005EF0;
  v7[3] = &unk_100357CB8;
  v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(SQLiteDatabase *)v8 _reentrantSafePerformBlock:v7];
}

- (SQLiteDatabase)initWithConnection:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SQLiteDatabase;
  id v6 = [(SQLiteDatabase *)&v13 init];
  if (v6)
  {
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.storekit.SQLiteDatabase", v7);
    id v9 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v8;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v6 + 2), "_SQLiteDispatchQueueTag", v6, 0);
    uint64_t v10 = +[NSHashTable hashTableWithOptions:258];
    v11 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = v10;

    objc_storeStrong((id *)v6 + 1, a3);
    [*((id *)v6 + 1) setDelegate:v6];
  }

  return (SQLiteDatabase *)v6;
}

- (SQLiteDatabase)initWithConnectionOptions:(id)a3
{
  id v4 = a3;
  id v5 = [[SQLiteConnection alloc] initWithOptions:v4];

  [(SQLiteConnection *)v5 open];
  id v6 = [(SQLiteDatabase *)self initWithConnection:v5];

  return v6;
}

- (void)assertOnTransactionQueue
{
}

- (void)modifyStore:(id)a3 usingTransaction:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100065080;
  v7[3] = &unk_100357CB8;
  dispatch_queue_t v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(SQLiteDatabase *)v8 _reentrantSafePerformBlock:v7];
}

- (void)modifyStore:(id)a3 usingTransactionClass:(Class)a4 withBlock:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000651B8;
  v9[3] = &unk_1003593F0;
  id v10 = self;
  id v11 = a3;
  id v12 = a5;
  Class v13 = a4;
  id v7 = v12;
  id v8 = v11;
  [(SQLiteDatabase *)v10 _reentrantSafePerformBlock:v9];
}

- (BOOL)connectionNeedsResetForReopen:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);
  if (qword_10039FCE8 != -1) {
    dispatch_once(&qword_10039FCE8, &stru_100359438);
  }
  id v5 = (void *)qword_10039FCD0;
  if (os_log_type_enabled((os_log_t)qword_10039FCD0, OS_LOG_TYPE_ERROR)) {
    sub_1002C658C(v5, v4);
  }
  NSResetHashTable(self->_migratedStores);

  return 1;
}

- (BOOL)connectionNeedsResetForCorruption:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);
  id v5 = [v4 options];
  id v6 = [v5 databasePath];

  id v7 = [v4 options];
  id v8 = [v7 encryptionKeyId];
  if (v8)
  {
  }
  else
  {
    BOOL v9 = sub_100038A44(v6);

    if (v9)
    {
      if (qword_10039FCE8 != -1) {
        dispatch_once(&qword_10039FCE8, &stru_100359438);
      }
      id v10 = qword_10039FCD0;
      if (os_log_type_enabled((os_log_t)qword_10039FCD0, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138543362;
        Class v13 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Exiting after truncating corrupt database at: %{public}@", (uint8_t *)&v12, 0xCu);
      }
      goto LABEL_7;
    }
  }
  if (qword_10039FCE8 != -1) {
    dispatch_once(&qword_10039FCE8, &stru_100359438);
  }
  id v11 = qword_10039FCD0;
  if (os_log_type_enabled((os_log_t)qword_10039FCD0, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138543362;
    Class v13 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Exiting after deleting corrupt database at: %{public}@", (uint8_t *)&v12, 0xCu);
  }
  sub_100038660(v6);
LABEL_7:
  exit(0);
}

- (BOOL)tableExists:(id)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100065508;
  v6[3] = &unk_100358080;
  BOOL v9 = &v10;
  id v7 = self;
  id v3 = a3;
  id v8 = v3;
  [(SQLiteDatabase *)v7 _reentrantSafePerformBlock:v6];
  char v4 = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (void)verifyDatabaseIntegrity
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000655AC;
  v2[3] = &unk_100358170;
  v2[4] = self;
  [(SQLiteDatabase *)self _reentrantSafePerformBlock:v2];
}

- (void)_modifyUsingTransactionClass:(Class)a3 withBlock:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transactionQueue);
  id v7 = [[a3 alloc] initWithConnection:self->_connection];
  connection = self->_connection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000657E8;
  v11[3] = &unk_100357608;
  id v12 = v7;
  id v13 = v6;
  id v9 = v7;
  id v10 = v6;
  [(SQLiteConnection *)connection performTransaction:v11];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migratedStores, 0);
  objc_storeStrong((id *)&self->_transactionQueue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end