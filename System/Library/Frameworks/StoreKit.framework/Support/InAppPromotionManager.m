@interface InAppPromotionManager
+ (id)manager;
- (BOOL)setPromotionInfo:(id)a3 forBundleID:(id)a4 error:(id *)a5;
- (InAppPromotionManager)init;
- (id)databaseStore;
- (id)promotionInfoForProductIdentifiers:(id)a3 bundleID:(id)a4 error:(id *)a5;
- (void)_migrateITunesStoreDDatabase;
- (void)removePromotionInfoForBundleID:(id)a3;
@end

@implementation InAppPromotionManager

+ (id)manager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091C48;
  block[3] = &unk_1003572F0;
  block[4] = a1;
  if (qword_1003A0500 != -1) {
    dispatch_once(&qword_1003A0500, block);
  }
  v2 = (void *)qword_1003A04F8;

  return v2;
}

- (InAppPromotionManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)InAppPromotionManager;
  v2 = [(InAppPromotionManager *)&v4 init];
  [(InAppPromotionManager *)v2 _migrateITunesStoreDDatabase];
  return v2;
}

- (void)_migrateITunesStoreDDatabase
{
  v3 = +[NSFileManager defaultManager];
  objc_super v4 = objc_msgSend(v3, "sk_iTunesStoreLibraryDataURL");

  v5 = [v4 path];
  v6 = [v5 stringByAppendingPathComponent:@"promoted_iaps.sqlitedb"];
  uint64_t v7 = [v4 path];
  v8 = [(id)v7 stringByAppendingPathComponent:@"promoted_iaps.sqlitedb-shm"];
  v9 = [v4 path];
  v10 = [v9 stringByAppendingPathComponent:@"promoted_iaps.sqlitedb-wal"];
  v11 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v6, v8, v10, 0);

  v12 = +[NSFileManager defaultManager];
  v13 = [v11 objectAtIndexedSubscript:0];
  LOBYTE(v7) = [v12 fileExistsAtPath:v13];

  if (v7)
  {
    if (qword_1003A0550 != -1) {
      dispatch_once(&qword_1003A0550, &stru_10035A5A0);
    }
    v14 = qword_1003A0508;
    if (os_log_type_enabled((os_log_t)qword_1003A0508, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Detected promoted IAPs are still using the database in itunesstored, migrating to internal StoreKit database", buf, 2u);
    }
    v15 = [(InAppPromotionManager *)self databaseStore];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100091F64;
    v17[3] = &unk_10035A530;
    id v18 = v11;
    [v15 modifyUsingTransaction:v17];
  }
  else
  {
    if (qword_1003A0550 != -1) {
      dispatch_once(&qword_1003A0550, &stru_10035A5A0);
    }
    v16 = qword_1003A0508;
    if (os_log_type_enabled((os_log_t)qword_1003A0508, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "iTunesStoreD promoted IAP database file not found, assuming migration is already complete", buf, 2u);
    }
  }
}

- (id)databaseStore
{
  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = (InAppPromotionDatabaseStore *)objc_loadWeakRetained((id *)&v2->_databaseStore);
  if (!WeakRetained)
  {
    objc_super v4 = +[Environment sharedInstance];
    v5 = [v4 userDatabase];
    WeakRetained = [(SQLiteDatabaseStore *)[InAppPromotionDatabaseStore alloc] initWithDatabase:v5];
    objc_storeWeak((id *)&v2->_databaseStore, WeakRetained);
  }
  objc_sync_exit(v2);

  return WeakRetained;
}

- (void)removePromotionInfoForBundleID:(id)a3
{
}

- (BOOL)setPromotionInfo:(id)a3 forBundleID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_10009247C;
  v22 = sub_10009248C;
  id v23 = 0;
  v10 = [(InAppPromotionManager *)self databaseStore];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100092494;
  v14[3] = &unk_10035A558;
  id v11 = v8;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  v17 = &v18;
  [v10 modifyUsingTransaction:v14];

  if (a5) {
    *a5 = (id) v19[5];
  }

  _Block_object_dispose(&v18, 8);
  return 1;
}

- (id)promotionInfoForProductIdentifiers:(id)a3 bundleID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_10009247C;
  v30 = sub_10009248C;
  id v31 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_10009247C;
  v24 = sub_10009248C;
  id v25 = 0;
  v10 = [(InAppPromotionManager *)self databaseStore];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000926F8;
  v15[3] = &unk_10035A580;
  uint64_t v18 = &v20;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  v19 = &v26;
  [v10 readUsingSession:v15];

  if (a5) {
    *a5 = (id) v27[5];
  }
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (void).cxx_destruct
{
}

@end