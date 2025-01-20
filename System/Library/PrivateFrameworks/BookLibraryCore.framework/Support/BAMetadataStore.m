@interface BAMetadataStore
- (BAMetadataStore)initWithPersistentContainer:(id)a3;
- (BOOL)q_saveWithMoc:(id)a3 error:(id *)a4;
- (BOOL)removeAllMigrationInfosExcludingStates:(id)a3 error:(id *)a4;
- (BOOL)removeMigrationInfoForStoreID:(int64_t)a3 error:(id *)a4;
- (BOOL)removeRacGUIDForStoreID:(int64_t)a3 error:(id *)a4;
- (BOOL)setMigrationState:(int64_t)a3 forStoreID:(int64_t)a4 error:(id *)a5;
- (BOOL)setMigrationState:(int64_t)a3 forStoreIDs:(id)a4 error:(id *)a5;
- (BOOL)setRacGUID:(id)a3 forStoreID:(int64_t)a4 error:(id *)a5;
- (NSPersistentContainer)container;
- (id)_fetchRequestForBookletMigrationInfoExcludingStates:(id)a3;
- (id)_fetchRequestForBookletMigrationInfoWithStates:(id)a3;
- (id)_fetchRequestForBookletMigrationInfoWithStoreID:(int64_t)a3;
- (id)_fetchRequestForBookletMigrationInfoWithStoreIDs:(id)a3;
- (id)_fetchRequestForProductionInfoWithStoreID:(int64_t)a3;
- (id)newManagedObjectContext;
- (id)q_fetchAudiobookProductionInfosWithRequest:(id)a3 error:(id *)a4;
- (id)q_fetchBookletMigrationInfoWithRequest:(id)a3 error:(id *)a4;
- (void)migrationInfoWithStoreID:(int64_t)a3 completion:(id)a4;
- (void)migrationInfosWithStates:(id)a3 completion:(id)a4;
- (void)migrationInfosWithStoreIDs:(id)a3 completion:(id)a4;
- (void)racGUIDForStoreID:(int64_t)a3 result:(id)a4;
@end

@implementation BAMetadataStore

- (BAMetadataStore)initWithPersistentContainer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BAMetadataStore;
  v6 = [(BAMetadataStore *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_container, a3);
  }

  return v7;
}

- (BOOL)setRacGUID:(id)a3 forStoreID:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_100026DC0;
  v25 = sub_100026DD0;
  id v26 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100026DD8;
  v14[3] = &unk_1001A1C28;
  id v9 = [(BAMetadataStore *)self newManagedObjectContext];
  id v15 = v9;
  int64_t v20 = a4;
  id v10 = v8;
  id v16 = v10;
  v17 = self;
  v18 = &v27;
  v19 = &v21;
  [v9 performBlockAndWait:v14];
  int v11 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((unsigned char *)v28 + 24))
  {
    *a5 = (id) v22[5];
    int v11 = *((unsigned __int8 *)v28 + 24);
  }
  BOOL v12 = v11 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v12;
}

- (void)racGUIDForStoreID:(int64_t)a3 result:(id)a4
{
  id v6 = a4;
  id v7 = [(BAMetadataStore *)self newManagedObjectContext];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  int64_t v20 = sub_100026DC0;
  uint64_t v21 = sub_100026DD0;
  id v22 = 0;
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_100026DC0;
  id v15 = sub_100026DD0;
  id v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002700C;
  v10[3] = &unk_1001A1C50;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = &v17;
  v10[7] = a3;
  [v7 performBlockAndWait:v10];
  id v8 = objc_retainBlock(v6);
  id v9 = v8;
  if (v8) {
    (*((void (**)(id, uint64_t, uint64_t))v8 + 2))(v8, v18[5], v12[5]);
  }

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
}

- (BOOL)removeRacGUIDForStoreID:(int64_t)a3 error:(id *)a4
{
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_100026DC0;
  v16[4] = sub_100026DD0;
  id v17 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002722C;
  v7[3] = &unk_1001A1C78;
  v7[4] = self;
  int64_t v11 = a3;
  id v4 = [(BAMetadataStore *)self newManagedObjectContext];
  id v8 = v4;
  id v9 = &v12;
  id v10 = v16;
  [v4 performBlockAndWait:v7];
  char v5 = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v16, 8);

  return v5;
}

- (BOOL)setMigrationState:(int64_t)a3 forStoreID:(int64_t)a4 error:(id *)a5
{
  id v8 = +[NSNumber numberWithLongLong:a4];
  id v9 = +[NSSet setWithObject:v8];

  LOBYTE(a5) = [(BAMetadataStore *)self setMigrationState:a3 forStoreIDs:v9 error:a5];
  return (char)a5;
}

- (BOOL)setMigrationState:(int64_t)a3 forStoreIDs:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [(BAMetadataStore *)self newManagedObjectContext];
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_100026DC0;
  id v26 = sub_100026DD0;
  id v27 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100027584;
  v15[3] = &unk_1001A1C28;
  id v10 = v8;
  id v16 = v10;
  id v11 = v9;
  int64_t v20 = &v22;
  int64_t v21 = a3;
  id v17 = v11;
  v18 = self;
  uint64_t v19 = &v28;
  [v11 performBlockAndWait:v15];
  int v12 = *((unsigned __int8 *)v29 + 24);
  if (a5 && !*((unsigned char *)v29 + 24))
  {
    *a5 = (id) v23[5];
    int v12 = *((unsigned __int8 *)v29 + 24);
  }
  BOOL v13 = v12 != 0;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v13;
}

- (void)migrationInfoWithStoreID:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  int64_t v21 = sub_100026DC0;
  uint64_t v22 = sub_100026DD0;
  id v23 = 0;
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x3032000000;
  char v15 = sub_100026DC0;
  id v16 = sub_100026DD0;
  id v17 = 0;
  id v7 = +[NSNumber numberWithLongLong:a3];
  id v8 = +[NSSet setWithObject:v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000278C4;
  v11[3] = &unk_1001A1CA0;
  v11[4] = &v12;
  v11[5] = &v18;
  [(BAMetadataStore *)self migrationInfosWithStoreIDs:v8 completion:v11];
  id v9 = objc_retainBlock(v6);
  id v10 = v9;
  if (v9) {
    (*((void (**)(id, uint64_t, uint64_t))v9 + 2))(v9, v19[5], v13[5]);
  }

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
}

- (void)migrationInfosWithStoreIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BAMetadataStore *)self newManagedObjectContext];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_100026DC0;
  id v26 = sub_100026DD0;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_100026DC0;
  uint64_t v20 = sub_100026DD0;
  id v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100027B0C;
  v12[3] = &unk_1001A1CC8;
  v12[4] = self;
  id v9 = v6;
  id v13 = v9;
  uint64_t v14 = &v16;
  char v15 = &v22;
  [v8 performBlockAndWait:v12];
  id v10 = objc_retainBlock(v7);
  id v11 = v10;
  if (v10) {
    (*((void (**)(id, uint64_t, uint64_t))v10 + 2))(v10, v23[5], v17[5]);
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
}

- (void)migrationInfosWithStates:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BAMetadataStore *)self newManagedObjectContext];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_100026DC0;
  id v26 = sub_100026DD0;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_100026DC0;
  uint64_t v20 = sub_100026DD0;
  id v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100027E78;
  v12[3] = &unk_1001A1CC8;
  v12[4] = self;
  id v9 = v6;
  id v13 = v9;
  uint64_t v14 = &v16;
  char v15 = &v22;
  [v8 performBlockAndWait:v12];
  id v10 = objc_retainBlock(v7);
  id v11 = v10;
  if (v10) {
    (*((void (**)(id, uint64_t, uint64_t))v10 + 2))(v10, v23[5], v17[5]);
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
}

- (BOOL)removeMigrationInfoForStoreID:(int64_t)a3 error:(id *)a4
{
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_100026DC0;
  v16[4] = sub_100026DD0;
  id v17 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100028170;
  v7[3] = &unk_1001A1C78;
  v7[4] = self;
  int64_t v11 = a3;
  id v4 = [(BAMetadataStore *)self newManagedObjectContext];
  id v8 = v4;
  id v9 = &v12;
  id v10 = v16;
  [v4 performBlockAndWait:v7];
  char v5 = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v16, 8);

  return v5;
}

- (BOOL)removeAllMigrationInfosExcludingStates:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (!v5) {
    id v5 = objc_alloc_init((Class)NSSet);
  }
  id v6 = [(BAMetadataStore *)self newManagedObjectContext];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_100026DC0;
  v19[4] = sub_100026DD0;
  id v20 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100028414;
  v10[3] = &unk_1001A1CF0;
  v10[4] = self;
  id v7 = v5;
  id v11 = v7;
  id v8 = v6;
  id v12 = v8;
  id v13 = &v15;
  uint64_t v14 = v19;
  [v8 performBlockAndWait:v10];
  LOBYTE(v6) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);

  return (char)v6;
}

- (BOOL)q_saveWithMoc:(id)a3 error:(id *)a4
{
  id v10 = 0;
  unsigned __int8 v5 = [a3 save:&v10];
  id v6 = v10;
  id v7 = v6;
  if ((v5 & 1) == 0)
  {
    if (a4) {
      *a4 = v6;
    }
    id v8 = BLServiceMetadataStoreLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unable to save metadata store:  %@", buf, 0xCu);
    }
  }
  return v5;
}

- (id)_fetchRequestForProductionInfoWithStoreID:(int64_t)a3
{
  id v4 = +[BAAudiobookProductionInfo fetchRequest];
  unsigned __int8 v5 = +[NSPredicate predicateWithFormat:@"%K == %lld", @"storeID", a3];
  [v4 setPredicate:v5];

  return v4;
}

- (id)q_fetchAudiobookProductionInfosWithRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v11 = 0;
  id v6 = [v5 execute:&v11];
  id v7 = v11;
  id v8 = v7;
  if (!v6)
  {
    if (a4) {
      *a4 = v7;
    }
    id v9 = BLServiceMetadataStoreLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error performing fetch request %@:  %@", buf, 0x16u);
    }
  }

  return v6;
}

- (id)newManagedObjectContext
{
  v2 = [(BAMetadataStore *)self container];
  id v3 = [v2 newBackgroundContext];

  [v3 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  return v3;
}

- (id)_fetchRequestForBookletMigrationInfoWithStoreID:(int64_t)a3
{
  id v4 = +[BABookletMigrationInfo fetchRequest];
  id v5 = +[NSNumber numberWithLongLong:a3];
  id v6 = +[NSPredicate predicateWithFormat:@"%K == %@", @"storeID", v5];
  [v4 setPredicate:v6];

  return v4;
}

- (id)_fetchRequestForBookletMigrationInfoWithStoreIDs:(id)a3
{
  id v3 = a3;
  id v4 = +[BABookletMigrationInfo fetchRequest];
  id v5 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"storeID", v3];

  [v4 setPredicate:v5];

  return v4;
}

- (id)_fetchRequestForBookletMigrationInfoWithStates:(id)a3
{
  id v3 = a3;
  id v4 = +[BABookletMigrationInfo fetchRequest];
  id v5 = +[NSPredicate predicateWithFormat:@"%K IN %@", @"migrationState", v3];

  [v4 setPredicate:v5];

  return v4;
}

- (id)_fetchRequestForBookletMigrationInfoExcludingStates:(id)a3
{
  id v3 = a3;
  id v4 = +[BABookletMigrationInfo fetchRequest];
  id v5 = +[NSPredicate predicateWithFormat:@"NOT (%K IN %@)", @"migrationState", v3];

  [v4 setPredicate:v5];

  return v4;
}

- (id)q_fetchBookletMigrationInfoWithRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v11 = 0;
  id v6 = [v5 execute:&v11];
  id v7 = v11;
  id v8 = v7;
  if (!v6)
  {
    if (a4) {
      *a4 = v7;
    }
    id v9 = BLServiceMetadataStoreLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error performing fetch request %@:  %@", buf, 0x16u);
    }
  }

  return v6;
}

- (NSPersistentContainer)container
{
  return self->_container;
}

- (void).cxx_destruct
{
}

@end