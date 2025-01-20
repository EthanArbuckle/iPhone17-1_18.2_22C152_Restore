@interface FASettingPresetsCache
+ (id)cacheQueue;
- (id)_cacheDirectoryURLWithError:(id *)a3;
- (id)_cacheURL;
- (id)_cacheURLWithError:(id *)a3;
- (id)_createCacheFile;
- (id)_fetchData:(id *)a3;
- (id)invalidate;
- (id)load:(id *)a3;
- (id)loadForURL:(id)a3;
- (id)updateWithPresets:(id)a3 requestURL:(id)a4;
@end

@implementation FASettingPresetsCache

- (id)_cacheDirectoryURLWithError:(id *)a3
{
  v4 = +[NSFileManager defaultManager];
  id v11 = 0;
  v5 = [v4 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v11];
  id v6 = v11;

  if (v6)
  {
    v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100035EAC((uint64_t)v6, v7);
    }

    v8 = 0;
    if (a3) {
      *a3 = v6;
    }
  }
  else
  {
    v9 = +[NSString stringWithFormat:@"FamilyCircle/Presets"];
    v8 = [v5 URLByAppendingPathComponent:v9];
  }
  return v8;
}

- (id)_cacheURLWithError:(id *)a3
{
  v3 = [(FASettingPresetsCache *)self _cacheDirectoryURLWithError:a3];
  v4 = [v3 URLByAppendingPathComponent:@"preset_cache.json"];

  return v4;
}

+ (id)cacheQueue
{
  if (qword_10005EFD0[0] != -1) {
    dispatch_once(qword_10005EFD0, &stru_10004E300);
  }
  v2 = (void *)qword_10005EFC8;
  return v2;
}

- (id)_fetchData:(id *)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_10001B4F0;
  v13 = sub_10001B500;
  id v14 = 0;
  v5 = [(id)objc_opt_class() cacheQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B508;
  block[3] = &unk_10004D7D8;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)loadForURL:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)AAFPromise);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001B694;
  v9[3] = &unk_10004D2A0;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 initWithBlock:v9];

  return v7;
}

- (id)load:(id *)a3
{
  id v5 = _FASignpostLogSystem();
  uint64_t v6 = _FASignpostCreate();

  id v7 = _FASignpostLogSystem();
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

  id v10 = [(FASettingPresetsCache *)self _fetchData:a3];
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

- (id)_cacheURL
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001B9FC;
  v4[3] = &unk_10004D318;
  v4[4] = self;
  id v2 = [objc_alloc((Class)AAFPromise) initWithBlock:v4];
  return v2;
}

- (id)_createCacheFile
{
  id v2 = [(FASettingPresetsCache *)self _cacheURL];
  v3 = [v2 thenOnQueue];
  id v4 = [(id)objc_opt_class() cacheQueue];
  id v5 = ((void (**)(void, void *, Block_layout *))v3)[2](v3, v4, &stru_10004E320);

  return v5;
}

- (id)updateWithPresets:(id)a3 requestURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)AAFPromise);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001BCE0;
  v13[3] = &unk_10004D4B0;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  id v11 = [v8 initWithBlock:v13];

  return v11;
}

- (id)invalidate
{
  id v3 = [objc_alloc((Class)AAFPromise) initWithValue:0];
  id v4 = [v3 thenOnQueue];
  id v5 = [(id)objc_opt_class() cacheQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001C1C8;
  v8[3] = &unk_10004D090;
  v8[4] = self;
  id v6 = ((void (**)(void, void *, void *))v4)[2](v4, v5, v8);

  return v6;
}

@end