@interface ODRManager
+ (void)initialize;
- (ODRManager)init;
- (id)allPurgeablesForVolume:(id)a3 reason:(id)a4 client:(id)a5;
- (int64_t)purgeForVolume:(id)a3 urgency:(int64_t)a4 desiredPurge:(id)a5 client:(id)a6;
- (int64_t)purgeableForVolume:(id)a3 urgency:(int64_t)a4 client:(id)a5;
- (void)cancelPurge;
@end

@implementation ODRManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = +[NSUserDefaults standardUserDefaults];
    [v2 registerDefaults:&off_10054E1F8];

    id v3 = sub_10024E080();
  }
}

- (ODRManager)init
{
  v2 = self;
  if (qword_1005B0BB8)
  {
    id v3 = (ODRManager *)(id)qword_1005B0BB8;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)ODRManager;
    v4 = [(ODRManager *)&v16 init];
    if (v4)
    {
      v5 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
      resourcesLock = v4->_resourcesLock;
      v4->_resourcesLock = v5;

      dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vfs, 0, 0x204uLL, 0);
      lowDisk = v4->_lowDisk;
      v4->_lowDisk = (OS_dispatch_source *)v7;

      v9 = v4->_lowDisk;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10024F468;
      handler[3] = &unk_100521388;
      handler[4] = v4;
      dispatch_source_set_event_handler(v9, handler);
      uint64_t v10 = objc_opt_new();
      applicationMapping = v4->_applicationMapping;
      v4->_applicationMapping = (NSMutableDictionary *)v10;

      uint64_t v12 = objc_opt_new();
      applicationMappingLock = v4->_applicationMappingLock;
      v4->_applicationMappingLock = (UnfairLock *)v12;
    }
    id v3 = v4;
    v2 = v3;
  }
  v14 = v3;

  return v14;
}

- (id)allPurgeablesForVolume:(id)a3 reason:(id)a4 client:(id)a5
{
  v5 = sub_1001F5C30();
  sub_1001F5D40(v5);

  v6 = sub_10024E080();
  uint64_t v7 = sub_10024F7F0((uint64_t)v6, 1);

  v8 = sub_10024E080();
  uint64_t v9 = sub_10024F7F0((uint64_t)v8, 2);

  uint64_t v10 = sub_10024E080();
  uint64_t v11 = sub_10024F7F0((uint64_t)v10, 3);

  uint64_t v12 = sub_10024E080();
  uint64_t v13 = sub_10024F7F0((uint64_t)v12, 4);

  v20[0] = &off_10054BC28;
  v14 = +[NSNumber numberWithLongLong:v7];
  v21[0] = v14;
  v20[1] = &off_10054BC40;
  v15 = +[NSNumber numberWithLongLong:v9];
  v21[1] = v15;
  v20[2] = &off_10054BC58;
  objc_super v16 = +[NSNumber numberWithLongLong:v11];
  v21[2] = v16;
  v20[3] = &off_10054BC70;
  v17 = +[NSNumber numberWithLongLong:v13];
  v21[3] = v17;
  v18 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];

  return v18;
}

- (int64_t)purgeableForVolume:(id)a3 urgency:(int64_t)a4 client:(id)a5
{
  int v5 = a4;
  v6 = sub_1001F5C30();
  sub_1001F5D40(v6);

  uint64_t v7 = sub_10024E080();
  int64_t v8 = sub_10024F7F0((uint64_t)v7, v5);

  return v8;
}

- (int64_t)purgeForVolume:(id)a3 urgency:(int64_t)a4 desiredPurge:(id)a5 client:(id)a6
{
  int v6 = a4;
  id v7 = a5;
  int64_t v8 = sub_1001F5C30();
  sub_1001F5D40(v8);

  id v9 = [v7 unsignedLongLongValue];
  sub_10024E080();
  uint64_t v10 = (id *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = sub_10024F9CC(v10, (uint64_t)v9, v6);

  return (int64_t)v11;
}

- (void)cancelPurge
{
  sub_10024E080();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v2 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "PURGING : Purging cancelled.", buf, 2u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowDisk, 0);
  objc_storeStrong((id *)&self->_resourcesLock, 0);
  objc_storeStrong((id *)&self->_applicationMappingLock, 0);
  objc_storeStrong((id *)&self->_applicationMapping, 0);
}

@end