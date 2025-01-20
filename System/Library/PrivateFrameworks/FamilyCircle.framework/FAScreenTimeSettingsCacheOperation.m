@interface FAScreenTimeSettingsCacheOperation
+ (id)cacheQueue;
- (FAScreenTimeSettingsCacheOperation)initWithDSID:(id)a3;
- (NSNumber)dsid;
- (id)_cacheURL;
- (id)_cacheURLWithError:(id *)a3;
- (id)_createCacheFile;
- (id)_fetchData:(id *)a3;
- (id)_onQueue:(id)a3;
- (id)cacheScreenTimeSettingsObject:(id)a3;
- (id)invalidate;
- (id)loadScreenTimeSettingsObject;
- (void)setDsid:(id)a3;
@end

@implementation FAScreenTimeSettingsCacheOperation

- (FAScreenTimeSettingsCacheOperation)initWithDSID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAScreenTimeSettingsCacheOperation;
  v6 = [(FAScreenTimeSettingsCacheOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dsid, a3);
  }

  return v7;
}

+ (id)cacheQueue
{
  if (qword_10005EF38 != -1) {
    dispatch_once(&qword_10005EF38, &stru_10004D720);
  }
  v2 = (void *)qword_10005EF30;
  return v2;
}

- (id)cacheScreenTimeSettingsObject:(id)a3
{
  id v4 = a3;
  id v5 = [(FAScreenTimeSettingsCacheOperation *)self _createCacheFile];
  id v6 = objc_alloc((Class)AAFPromise);
  v7 = [v4 dataRepresentation];

  id v8 = [v6 initWithValue:v7];
  v14[0] = v8;
  v14[1] = v5;
  objc_super v9 = +[NSArray arrayWithObjects:v14 count:2];
  v10 = +[AAFPromise all:v9];
  v11 = [v10 then];
  v12 = ((void (**)(void, Block_layout *))v11)[2](v11, &stru_10004D760);

  return v12;
}

- (id)loadScreenTimeSettingsObject
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000BC64;
  v4[3] = &unk_10004D318;
  v4[4] = self;
  id v2 = [objc_alloc((Class)AAFPromise) initWithBlock:v4];
  return v2;
}

- (id)invalidate
{
  v3 = [(FAScreenTimeSettingsCacheOperation *)self _cacheURL];
  id v4 = [v3 then];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000BEF8;
  v7[3] = &unk_10004D7B0;
  v7[4] = self;
  id v5 = ((void (**)(void, void *))v4)[2](v4, v7);

  return v5;
}

- (id)_cacheURLWithError:(id *)a3
{
  id v5 = [(FAScreenTimeSettingsCacheOperation *)self dsid];

  if (v5)
  {
    id v6 = +[NSFileManager defaultManager];
    id v22 = 0;
    v7 = [v6 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v22];
    id v8 = v22;

    if (v8)
    {
      objc_super v9 = _FALogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100034D84((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
      }

      if (a3) {
        *a3 = v8;
      }
    }
    v16 = [v7 URLByAppendingPathComponent:@"com.apple.family/cachedObjects" isDirectory:1];
    v17 = [(FAScreenTimeSettingsCacheOperation *)self dsid];
    v18 = [v17 stringValue];
    v19 = [v16 URLByAppendingPathComponent:v18 isDirectory:0];
  }
  else if (a3)
  {
    v20 = _FALogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100034D40(v20);
    }

    +[NSError fa_familyErrorWithCode:-1013];
    v19 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

- (id)_fetchData:(id *)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_10000C32C;
  uint64_t v13 = sub_10000C33C;
  id v14 = 0;
  id v5 = [(id)objc_opt_class() cacheQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C344;
  block[3] = &unk_10004D7D8;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)_cacheURL
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000C49C;
  v4[3] = &unk_10004D318;
  v4[4] = self;
  id v2 = [objc_alloc((Class)AAFPromise) initWithBlock:v4];
  return v2;
}

- (id)_createCacheFile
{
  v3 = [(FAScreenTimeSettingsCacheOperation *)self _cacheURL];
  id v4 = [v3 then];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C5E0;
  v7[3] = &unk_10004D7B0;
  v7[4] = self;
  id v5 = ((void (**)(void, void *))v4)[2](v4, v7);

  return v5;
}

- (id)_onQueue:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)AAFPromise);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000C838;
  v9[3] = &unk_10004D828;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 initWithBlock:v9];

  return v7;
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end