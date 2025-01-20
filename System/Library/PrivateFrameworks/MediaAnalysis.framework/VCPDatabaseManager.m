@interface VCPDatabaseManager
+ (BOOL)existsDatabaseForPhotoLibrary:(id)a3;
+ (id)sharedDatabaseForPhotoLibrary:(id)a3;
+ (id)sharedDatabaseManager;
+ (void)releaseSharedDatabaseForPhotoLibrary:(id)a3;
- (VCPDatabaseManager)init;
- (id)sharedDatabaseForPhotoLibrary:(id)a3;
- (void)releaseSharedDatabaseForPhotoLibrary:(id)a3;
@end

@implementation VCPDatabaseManager

- (VCPDatabaseManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)VCPDatabaseManager;
  v2 = [(VCPDatabaseManager *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.mediaanalysisd.VCPDatabaseManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    databases = v2->_databases;
    v2->_databases = (NSMutableDictionary *)v5;
  }
  return v2;
}

+ (id)sharedDatabaseManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AF194;
  block[3] = &unk_100219838;
  block[4] = a1;
  if (qword_100252610 != -1) {
    dispatch_once(&qword_100252610, block);
  }
  v2 = (void *)qword_100252608;
  return v2;
}

- (id)sharedDatabaseForPhotoLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_1000AF32C;
  v18 = sub_1000AF33C;
  id v19 = 0;
  uint64_t v5 = [v4 photoLibraryURL];
  v6 = v5;
  if (v5)
  {
    queue = self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000AF344;
    v10[3] = &unk_10021C8C0;
    v13 = &v14;
    v10[4] = self;
    id v11 = v5;
    id v12 = v4;
    dispatch_sync(queue, v10);
  }
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

+ (id)sharedDatabaseForPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() sharedDatabaseManager];
  uint64_t v5 = [v4 sharedDatabaseForPhotoLibrary:v3];

  return v5;
}

+ (BOOL)existsDatabaseForPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  uint64_t v5 = objc_msgSend(v3, "vcp_mediaAnalysisDatabaseFilepath");

  LOBYTE(v3) = [v4 fileExistsAtPath:v5];
  return (char)v3;
}

- (void)releaseSharedDatabaseForPhotoLibrary:(id)a3
{
  id v4 = a3;
  if (([v4 isSystemPhotoLibrary] & 1) == 0)
  {
    uint64_t v5 = [v4 photoLibraryURL];
    v6 = v5;
    if (v5)
    {
      queue = self->_queue;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000AF598;
      v8[3] = &unk_100219D00;
      v8[4] = self;
      id v9 = v5;
      dispatch_sync(queue, v8);
    }
  }
}

+ (void)releaseSharedDatabaseForPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() sharedDatabaseManager];
  [v4 releaseSharedDatabaseForPhotoLibrary:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databases, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end