@interface FMDMagSafeDataStore
+ (id)defaultStorageLocation;
+ (id)lostModeStorageLocation;
+ (id)sharedInstance;
- (FMDMagSafeDataStore)init;
- (FMDataArchiver)dataArchiver;
- (FMDataArchiver)lostModeDataArchiver;
- (OS_dispatch_queue)serialQueue;
- (id)_writeAccessoriesToDisk:(id)a3;
- (id)readAllAccessoriesFromDisk;
- (id)readLostModeAccessoriesList;
- (id)readLostModeAccessoriesListVersion;
- (id)writeLostModeInfo:(id)a3 version:(id)a4;
- (void)addAccessory:(id)a3 withCompletion:(id)a4;
- (void)clearDataStore;
- (void)removeAccessoryWithId:(id)a3 withCompletion:(id)a4;
- (void)removeAccessoryWithSerialNumber:(id)a3 withCompletion:(id)a4;
- (void)setDataArchiver:(id)a3;
- (void)setLostModeDataArchiver:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)updateLostModeKeyRollTimeFor:(id)a3 lastLostModeKeyRollTime:(id)a4 withCompletion:(id)a5;
@end

@implementation FMDMagSafeDataStore

+ (id)defaultStorageLocation
{
  id v2 = objc_alloc((Class)FMSharedFileContainer);
  id v3 = [v2 initWithIdentifier:off_100042B40];
  v4 = [v3 url];
  v5 = [v4 fm_preferencesPathURLForDomain:@"fmdMagSafeDevices"];

  return v5;
}

+ (id)lostModeStorageLocation
{
  id v2 = objc_alloc((Class)FMSharedFileContainer);
  id v3 = [v2 initWithIdentifier:off_100042B40];
  v4 = [v3 url];
  v5 = [v4 fm_preferencesPathURLForDomain:@"fmdMagSafeLostDevices"];

  return v5;
}

+ (id)sharedInstance
{
  if (qword_100042E30 != -1) {
    dispatch_once(&qword_100042E30, &stru_100035B28);
  }
  id v2 = (void *)qword_100042E28;

  return v2;
}

- (FMDMagSafeDataStore)init
{
  v18.receiver = self;
  v18.super_class = (Class)FMDMagSafeDataStore;
  id v2 = [(FMDMagSafeDataStore *)&v18 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("FMDMagSafeDataStore.serialQueue", 0);
    [(FMDMagSafeDataStore *)v2 setSerialQueue:v3];

    id v4 = objc_alloc((Class)FMDataArchiver);
    v5 = [(id)objc_opt_class() defaultStorageLocation];
    id v6 = [v4 initWithFileURL:v5];
    [(FMDMagSafeDataStore *)v2 setDataArchiver:v6];

    v7 = [(FMDMagSafeDataStore *)v2 dataArchiver];
    [v7 setDataProtectionClass:4];

    v8 = [(FMDMagSafeDataStore *)v2 dataArchiver];
    [v8 setBackedUp:0];

    v9 = [(FMDMagSafeDataStore *)v2 dataArchiver];
    [v9 setCreateDirectories:1];

    id v10 = objc_alloc((Class)FMDataArchiver);
    v11 = [(id)objc_opt_class() lostModeStorageLocation];
    id v12 = [v10 initWithFileURL:v11];
    [(FMDMagSafeDataStore *)v2 setLostModeDataArchiver:v12];

    v13 = [(FMDMagSafeDataStore *)v2 lostModeDataArchiver];
    [v13 setDataProtectionClass:4];

    v14 = [(FMDMagSafeDataStore *)v2 lostModeDataArchiver];
    [v14 setBackedUp:0];

    v15 = [(FMDMagSafeDataStore *)v2 lostModeDataArchiver];
    [v15 setCreateDirectories:1];

    v16 = sub_100010114();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10001FA04((uint64_t)v2, v16);
    }
  }
  return v2;
}

- (void)clearDataStore
{
  dispatch_queue_t v3 = [(FMDMagSafeDataStore *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B2F0;
  block[3] = &unk_100034760;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)addAccessory:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(FMDMagSafeDataStore *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B420;
  block[3] = &unk_100035B78;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)removeAccessoryWithId:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(FMDMagSafeDataStore *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B640;
  block[3] = &unk_100035B78;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)removeAccessoryWithSerialNumber:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(FMDMagSafeDataStore *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B844;
  block[3] = &unk_100035B78;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (id)readAllAccessoriesFromDisk
{
  id v2 = [(FMDMagSafeDataStore *)self dataArchiver];
  uint64_t v3 = objc_opt_class();
  id v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, objc_opt_class(), 0);
  id v12 = 0;
  v5 = [v2 readDictionaryAndClasses:v4 error:&v12];
  id v6 = v12;

  if ((objc_msgSend(v6, "fm_isFileNotFoundError") & 1) == 0 && (!v5 || v6 != 0))
  {

    v8 = sub_100010114();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10001FA9C();
    }

    v5 = &__NSDictionary0__struct;
  }
  id v9 = sub_1000104A4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v5 count];
    *(_DWORD *)buf = 134218242;
    id v14 = v10;
    __int16 v15 = 2112;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "readAllAccessoriesFromDisk total = %lu accessories = %@", buf, 0x16u);
  }

  return v5;
}

- (id)_writeAccessoriesToDisk:(id)a3
{
  id v4 = a3;
  v5 = [(FMDMagSafeDataStore *)self dataArchiver];
  id v6 = [v5 saveDictionary:v4];

  return v6;
}

- (id)writeLostModeInfo:(id)a3 version:(id)a4
{
  v13[0] = @"accessoryList";
  v13[1] = @"version";
  v14[0] = a3;
  v14[1] = a4;
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  id v9 = [(FMDMagSafeDataStore *)self lostModeDataArchiver];
  id v10 = [v9 saveDictionary:v8];

  if (!v10)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.icloud.findmydeviced.findkit.magSafe.added", 0, 0, 1u);
  }

  return v10;
}

- (id)readLostModeAccessoriesList
{
  id v2 = [(FMDMagSafeDataStore *)self lostModeDataArchiver];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, objc_opt_class(), 0);
  id v15 = 0;
  id v6 = [v2 readDictionaryAndClasses:v5 error:&v15];
  id v7 = v15;

  if ((objc_msgSend(v7, "fm_isFileNotFoundError") & 1) == 0 && (!v6 || v7 != 0))
  {
    id v9 = sub_100010114();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10001FA9C();
    }
  }
  id v10 = sub_1000104A4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v6 objectForKeyedSubscript:@"accessoryList"];
    id v12 = [v11 count];
    *(_DWORD *)buf = 134218242;
    id v17 = v12;
    __int16 v18 = 2112;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "readLostModeAccessoriesList total = %lu accessories = %@", buf, 0x16u);
  }
  id v13 = [v6 objectForKeyedSubscript:@"accessoryList"];

  return v13;
}

- (id)readLostModeAccessoriesListVersion
{
  id v2 = [(FMDMagSafeDataStore *)self lostModeDataArchiver];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, objc_opt_class(), 0);
  id v15 = 0;
  id v6 = [v2 readDictionaryAndClasses:v5 error:&v15];
  id v7 = v15;

  if ((objc_msgSend(v7, "fm_isFileNotFoundError") & 1) == 0 && (!v6 || v7 != 0))
  {
    id v9 = sub_100010114();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10001FA9C();
    }
  }
  id v10 = sub_1000104A4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v6 objectForKeyedSubscript:@"accessoryList"];
    id v12 = [v11 count];
    *(_DWORD *)buf = 134218242;
    id v17 = v12;
    __int16 v18 = 2112;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "readLostModeAccessoriesList total = %lu accessories = %@", buf, 0x16u);
  }
  id v13 = [v6 objectForKeyedSubscript:@"version"];

  return v13;
}

- (void)updateLostModeKeyRollTimeFor:(id)a3 lastLostModeKeyRollTime:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(FMDMagSafeDataStore *)self serialQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001C3EC;
  v15[3] = &unk_100035BC8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
}

- (FMDataArchiver)lostModeDataArchiver
{
  return self->_lostModeDataArchiver;
}

- (void)setLostModeDataArchiver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lostModeDataArchiver, 0);
  objc_storeStrong((id *)&self->_dataArchiver, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end