@interface FAFamilyPhotoCache
+ (id)cacheQueue;
- (BOOL)_isCacheDate:(id)a3 pastDuration:(double)a4;
- (FAFamilyPhotoCache)initWithAltDSID:(id)a3;
- (NSString)altDSID;
- (id)_cacheDirectoryURLWithError:(id *)a3;
- (id)_cacheURL;
- (id)_cacheURLWithError:(id *)a3;
- (id)_createCacheFile;
- (id)_fetchData:(id *)a3;
- (id)invalidateFamilyPhotos;
- (id)load;
- (id)load:(id *)a3;
- (id)updateWithData:(id)a3;
- (void)setAltDSID:(id)a3;
@end

@implementation FAFamilyPhotoCache

- (FAFamilyPhotoCache)initWithAltDSID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAFamilyPhotoCache;
  v6 = [(FAFamilyPhotoCache *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_altDSID, a3);
  }

  return v7;
}

- (id)_cacheDirectoryURLWithError:(id *)a3
{
  v4 = +[NSFileManager defaultManager];
  id v11 = 0;
  id v5 = [v4 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v11];
  id v6 = v11;

  if (v6)
  {
    v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100035C9C((uint64_t)v6, v7);
    }

    v8 = 0;
    if (a3) {
      *a3 = v6;
    }
  }
  else
  {
    objc_super v9 = +[NSString stringWithFormat:@"FamilyCircle/Images"];
    v8 = [v5 URLByAppendingPathComponent:v9];
  }
  return v8;
}

- (id)_cacheURLWithError:(id *)a3
{
  id v5 = [(FAFamilyPhotoCache *)self altDSID];
  id v6 = +[NSString stringWithFormat:@"%@", v5];

  v7 = [(FAFamilyPhotoCache *)self _cacheDirectoryURLWithError:a3];
  v8 = [v7 URLByAppendingPathComponent:v6];

  return v8;
}

+ (id)cacheQueue
{
  if (qword_10005EFC0 != -1) {
    dispatch_once(&qword_10005EFC0, &stru_10004E278);
  }
  v2 = (void *)qword_10005EFB8;
  return v2;
}

- (id)_fetchData:(id *)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_10001A2B8;
  v13 = sub_10001A2C8;
  id v14 = 0;
  id v5 = [(id)objc_opt_class() cacheQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A2D0;
  block[3] = &unk_10004D7D8;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)load
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001A4C4;
  v4[3] = &unk_10004D318;
  v4[4] = self;
  id v2 = [objc_alloc((Class)AAFPromise) initWithBlock:v4];
  return v2;
}

- (id)load:(id *)a3
{
  id v5 = _FASignpostLogSystem();
  uint64_t v6 = _FASignpostCreate();

  v7 = _FASignpostLogSystem();
  v8 = v7;
  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "LoadFamilyPhotoCache", "", buf, 2u);
  }

  uint64_t v9 = _FASignpostLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100035D98(v6, v9);
  }

  v10 = [(FAFamilyPhotoCache *)self _fetchData:a3];
  uint64_t Nanoseconds = _FASignpostGetNanoseconds();
  v12 = _FASignpostLogSystem();
  v13 = v12;
  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, v6, "LoadFamilyPhotoCache", "", v16, 2u);
  }

  id v14 = _FASignpostLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_100035D14(v6, v14, (double)(unint64_t)Nanoseconds / 1000000000.0);
  }

  return v10;
}

- (BOOL)_isCacheDate:(id)a3 pastDuration:(double)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6 && ([v6 timeIntervalSinceNow], v8 > -a4))
  {
    uint64_t v9 = _FALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(FAFamilyPhotoCache *)self altDSID];
      int v14 = 138412546;
      v15 = v10;
      __int16 v16 = 2112;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cache photo for member %@ is valid dateCreated: %@", (uint8_t *)&v14, 0x16u);
    }
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v9 = _FALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(FAFamilyPhotoCache *)self altDSID];
      int v14 = 138412546;
      v15 = v12;
      __int16 v16 = 2112;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cache photo for member %@ expired dateCreated: %@", (uint8_t *)&v14, 0x16u);
    }
    BOOL v11 = 1;
  }

  return v11;
}

- (id)_cacheURL
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001A8FC;
  v4[3] = &unk_10004D318;
  v4[4] = self;
  id v2 = [objc_alloc((Class)AAFPromise) initWithBlock:v4];
  return v2;
}

- (id)_createCacheFile
{
  id v2 = [(FAFamilyPhotoCache *)self _cacheURL];
  v3 = [v2 thenOnQueue];
  v4 = [(id)objc_opt_class() cacheQueue];
  id v5 = ((void (**)(void, void *, Block_layout *))v3)[2](v3, v4, &stru_10004E2B8);

  return v5;
}

- (id)updateWithData:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)AAFPromise);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001ABBC;
  v9[3] = &unk_10004D2A0;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 initWithBlock:v9];

  return v7;
}

- (id)invalidateFamilyPhotos
{
  id v3 = [objc_alloc((Class)AAFPromise) initWithValue:0];
  id v4 = [v3 thenOnQueue];
  id v5 = [(id)objc_opt_class() cacheQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001AFFC;
  v8[3] = &unk_10004D090;
  v8[4] = self;
  id v6 = ((void (**)(void, void *, void *))v4)[2](v4, v5, v8);

  return v6;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end