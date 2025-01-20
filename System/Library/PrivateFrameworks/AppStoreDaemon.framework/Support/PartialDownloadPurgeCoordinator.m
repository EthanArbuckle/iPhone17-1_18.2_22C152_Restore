@interface PartialDownloadPurgeCoordinator
- (PartialDownloadPurgeCoordinator)init;
- (id)allPurgeablesForVolume:(id)a3 reason:(id)a4 client:(id)a5;
- (int64_t)_calculatePurgeableSpace;
- (int64_t)_purgeForDesiredSpace:(int64_t)a3;
- (int64_t)purgeForVolume:(id)a3 urgency:(int64_t)a4 desiredPurge:(id)a5 client:(id)a6;
- (int64_t)purgeableForVolume:(id)a3 urgency:(int64_t)a4 client:(id)a5;
@end

@implementation PartialDownloadPurgeCoordinator

- (PartialDownloadPurgeCoordinator)init
{
  v9.receiver = self;
  v9.super_class = (Class)PartialDownloadPurgeCoordinator;
  v2 = [(PartialDownloadPurgeCoordinator *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.AppPurgeCoordinator.dispatch", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = sub_1003E0BA4();
    databaseStore = v2->_databaseStore;
    v2->_databaseStore = (AppInstallsDatabaseStore *)v6;
  }
  return v2;
}

- (id)allPurgeablesForVolume:(id)a3 reason:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100300578;
  block[3] = &unk_100521988;
  block[4] = self;
  block[5] = &v17;
  dispatch_sync(dispatchQueue, block);
  v21[0] = &off_10054C600;
  v21[1] = &off_10054C630;
  v22[0] = &off_10054C618;
  v22[1] = &off_10054C618;
  v21[2] = &off_10054C648;
  v12 = +[NSNumber numberWithLongLong:v18[3]];
  v22[2] = v12;
  v21[3] = &off_10054C660;
  v13 = +[NSNumber numberWithLongLong:v18[3]];
  v22[3] = v13;
  v14 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];

  _Block_object_dispose(&v17, 8);
  return v14;
}

- (int64_t)purgeForVolume:(id)a3 urgency:(int64_t)a4 desiredPurge:(id)a5 client:(id)a6
{
  id v8 = a5;
  id v9 = v8;
  int64_t v10 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  if (a4 >= 3)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100300694;
    block[3] = &unk_100521288;
    v15 = &v16;
    block[4] = self;
    id v14 = v8;
    dispatch_sync(dispatchQueue, block);

    int64_t v10 = v17[3];
  }
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (int64_t)purgeableForVolume:(id)a3 urgency:(int64_t)a4 client:(id)a5
{
  int64_t v5 = 0;
  uint64_t v9 = 0;
  int64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  if (a4 >= 3)
  {
    dispatchQueue = self->_dispatchQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10030078C;
    v8[3] = &unk_100521988;
    v8[4] = self;
    v8[5] = &v9;
    dispatch_sync(dispatchQueue, v8);
    int64_t v5 = v10[3];
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (int64_t)_calculatePurgeableSpace
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  databaseStore = self->_databaseStore;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100300880;
  v5[3] = &unk_100522CF8;
  v5[4] = &v6;
  [(AppInstallsDatabaseStore *)databaseStore readUsingSession:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)_purgeForDesiredSpace:(int64_t)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_100018178;
  v21 = sub_100017C78;
  id v22 = +[NSMutableArray array];
  databaseStore = self->_databaseStore;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100300D4C;
  v16[3] = &unk_100522CF8;
  v16[4] = &v17;
  [(AppInstallsDatabaseStore *)databaseStore readUsingSession:v16];
  id v6 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"date" ascending:1];
  id v23 = v6;
  v7 = +[NSArray arrayWithObjects:&v23 count:1];

  [(id)v18[5] sortUsingDescriptors:v7];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v8 = sub_1003E0BA4();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100301064;
  v11[3] = &unk_100527768;
  v11[4] = &v17;
  v11[5] = &v12;
  v11[6] = a3;
  [v8 modifyUsingTransaction:v11];

  int64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_databaseStore, 0);
}

@end