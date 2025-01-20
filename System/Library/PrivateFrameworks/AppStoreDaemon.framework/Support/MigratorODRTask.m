@interface MigratorODRTask
- (MigratorODRTask)initWithConfiguration:(id)a3;
- (id)copyConfiguration;
- (id)migratorType;
- (void)main;
@end

@implementation MigratorODRTask

- (MigratorODRTask)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MigratorODRTask;
  return [(MigratorTask *)&v4 initWithConfiguration:a3];
}

- (id)copyConfiguration
{
  v2 = [MigratorConfiguration alloc];
  return sub_1002ECEFC(v2, @"ODR");
}

- (id)migratorType
{
  return @"ODR";
}

- (void)main
{
  uint64_t v3 = sub_1003F9F04();
  objc_super v4 = (void *)v3;
  if (v3) {
    v5 = *(void **)(v3 + 24);
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = sub_1002D28B8((id *)[SQLiteTransporter alloc], v6);
  v8 = [ODRDatabaseStore alloc];
  sub_1001F5660();
  v9 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v10 = sub_1001F5734(v9);
  v11 = [(SQLiteDatabaseStore *)v8 initWithDatabase:v10];

  if (sub_1002D2930((uint64_t)v7))
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100362620;
    v22[3] = &unk_100529638;
    v22[4] = self;
    v23 = v11;
    sub_1002D2E5C((uint64_t)v7, v22);
  }
  else
  {
    v12 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to begin legacy database tranportation", (uint8_t *)&buf, 2u);
    }
  }
  sub_1002D2CB4((uint64_t)v7);
  v13 = [v6 stringByReplacingOccurrencesOfString:@"/odr.sqlite" withString:&stru_10052E4D8];
  v14 = +[NSFileManager defaultManager];
  if ([v14 fileExistsAtPath:v13])
  {
    id v21 = 0;
    unsigned __int8 v15 = [v14 removeItemAtPath:v13 error:&v21];
    id v16 = v21;
    if ((v15 & 1) == 0)
    {
      v17 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "The legacy database directory failed to be removed with error: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  v18 = sub_1001F5C30();
  sub_1001F5E50((uint64_t)v18);

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x3032000000;
  v26 = sub_1000182B8;
  v27 = sub_100017D18;
  id v28 = (id)objc_opt_new();
  v19 = sub_1002393C4();
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100362F34;
  v20[3] = &unk_100521960;
  v20[4] = &buf;
  [v19 readUsingSession:v20];

  [*(id *)(*((void *)&buf + 1) + 40) enumerateKeysAndObjectsUsingBlock:&stru_100529678];
  _Block_object_dispose(&buf, 8);
}

@end