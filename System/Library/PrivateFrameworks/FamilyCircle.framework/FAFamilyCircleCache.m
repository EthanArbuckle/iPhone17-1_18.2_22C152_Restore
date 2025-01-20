@interface FAFamilyCircleCache
+ (id)cacheQueue;
- (ACAccount)account;
- (BOOL)_isCacheDate:(id)a3 withinDuration:(double)a4;
- (FAFamilyCircleCache)initWithAccount:(id)a3;
- (id)_cacheDataWithFamilyCircle:(id)a3 serverTag:(id)a4;
- (id)_cacheURL;
- (id)_cacheURLWithError:(id *)a3;
- (id)_createCacheFile;
- (id)_fetchData:(id *)a3;
- (id)_onQueue:(id)a3;
- (id)_username;
- (id)invalidate;
- (id)load;
- (id)loadWithError:(id *)a3;
- (id)updateWithFamilyCircle:(id)a3 serverTag:(id)a4;
@end

@implementation FAFamilyCircleCache

- (id)_username
{
  v2 = [(FAFamilyCircleCache *)self account];
  v3 = objc_msgSend(v2, "aa_personID");

  return v3;
}

- (id)_cacheURLWithError:(id *)a3
{
  v4 = +[NSFileManager defaultManager];
  id v10 = 0;
  v5 = [v4 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v10];
  id v6 = v10;

  if (v6)
  {
    v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000354C4();
    }

    if (a3) {
      *a3 = v6;
    }
  }
  v8 = [v5 URLByAppendingPathComponent:@"FamilyCircle/CircleCache.plist"];

  return v8;
}

- (id)_fetchData:(id *)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_10001265C;
  v13 = sub_10001266C;
  id v14 = 0;
  v5 = [(id)objc_opt_class() cacheQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004AB8;
  block[3] = &unk_10004D7D8;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (FAFamilyCircleCache)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAFamilyCircleCache;
  id v6 = [(FAFamilyCircleCache *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (id)loadWithError:(id *)a3
{
  id v5 = _FASignpostLogSystem();
  os_signpost_id_t v6 = _FASignpostCreate();

  v7 = _FASignpostLogSystem();
  v8 = v7;
  unint64_t v9 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "LoadFamilyCache", "", buf, 2u);
  }

  id v10 = _FASignpostLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100035664();
  }

  id v52 = 0;
  uint64_t v11 = [(FAFamilyCircleCache *)self _fetchData:&v52];
  id v12 = v52;
  if (!v12)
  {
    if (v11)
    {
      id v51 = 0;
      v17 = +[NSPropertyListSerialization propertyListWithData:v11 options:0 format:0 error:&v51];
      v16 = v51;
      if (v16)
      {
        v18 = _FALogSystem();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_100035594();
        }

        if (a3) {
          *a3 = v16;
        }
        _FASignpostGetNanoseconds();
        v19 = _FASignpostLogSystem();
        v20 = v19;
        if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_END, v6, "LoadFamilyCache", "", buf, 2u);
        }

        v21 = _FASignpostLogSystem();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          sub_10003552C();
        }

        v22 = 0;
LABEL_28:

        goto LABEL_60;
      }
      if (v17)
      {
        v23 = [v17 objectForKeyedSubscript:@"username"];
        v49 = [v17 objectForKeyedSubscript:@"serverTag"];
        uint64_t v24 = [v17 objectForKeyedSubscript:@"timestamp"];
        v47 = v17;
        v25 = [v17 objectForKeyedSubscript:@"circle"];
        v26 = [(FAFamilyCircleCache *)self _username];
        v48 = v23;
        v22 = (FAFamilyCircleCacheResponse *)[v23 isEqualToString:v26];

        v50 = (void *)v24;
        BOOL v27 = v24 == 0;
        v28 = v25;
        if (v27) {
          int v29 = 0;
        }
        else {
          int v29 = (int)v22;
        }
        if (!v25) {
          int v29 = 0;
        }
        char v46 = v29;
        if (v29 == 1)
        {
          v30 = [v25 objectForKeyedSubscript:@"cacheDuration"];
          [v30 doubleValue];
          double v32 = v31;

          if (v32 == 0.0)
          {
            v33 = _FALogSystem();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              uint64_t v54 = 0x40F5180000000000;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Defaulting to cache age of: %f", buf, 0xCu);
            }

            double v32 = 86400.0;
          }
          v34 = [objc_alloc((Class)FAFamilyCircle) initWithServerResponse:v25];
          v22 = [[FAFamilyCircleCacheResponse alloc] initWithFamilyCircle:v34 serverTag:v49 cacheDate:v50 maxAge:v32];
          _FASignpostGetNanoseconds();
          v35 = _FASignpostLogSystem();
          v36 = v35;
          if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_INTERVAL_END, v6, "LoadFamilyCache", "", buf, 2u);
          }

          v37 = _FASignpostLogSystem();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
            sub_10003552C();
          }

          v28 = v25;
        }
        else
        {
          v39 = _FALogSystem();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            v45 = +[NSNumber numberWithBool:v22];
            v44 = +[NSNumber numberWithInt:v50 == 0];
            uint64_t v40 = +[NSNumber numberWithInt:v28 == 0];
            *(_DWORD *)buf = 138412802;
            uint64_t v54 = (uint64_t)v45;
            __int16 v55 = 2112;
            v56 = v44;
            __int16 v57 = 2112;
            uint64_t v58 = v40;
            v22 = (FAFamilyCircleCacheResponse *)v40;
            v34 = v39;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Invalid cache detected... validUser: %@, cachedTimestamp: %@, cachedCirclePlist: %@", buf, 0x20u);
          }
          else
          {
            v34 = v39;
          }
        }
        v17 = v47;

        if (v46) {
          goto LABEL_28;
        }
      }
      else
      {
        v38 = _FALogSystem();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "FAFamilyCircleCache plist == nil", buf, 2u);
        }
      }
    }
    _FASignpostGetNanoseconds();
    v41 = _FASignpostLogSystem();
    v42 = v41;
    if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_INTERVAL_END, v6, "LoadFamilyCache", "", buf, 2u);
    }

    v16 = _FASignpostLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10003552C();
    }
    goto LABEL_59;
  }
  v13 = _FALogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1000355FC();
  }

  if (a3) {
    *a3 = v12;
  }
  _FASignpostGetNanoseconds();
  id v14 = _FASignpostLogSystem();
  v15 = v14;
  if (v9 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, v6, "LoadFamilyCache", "", buf, 2u);
  }

  v16 = _FASignpostLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_10003552C();
  }
LABEL_59:
  v22 = 0;
LABEL_60:

  return v22;
}

- (id)load
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004888;
  v4[3] = &unk_10004D318;
  v4[4] = self;
  id v2 = [objc_alloc((Class)AAFPromise) initWithBlock:v4];
  return v2;
}

- (ACAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
}

+ (id)cacheQueue
{
  if (qword_10005EF80 != -1) {
    dispatch_once(&qword_10005EF80, &stru_10004DC40);
  }
  id v2 = (void *)qword_10005EF78;
  return v2;
}

- (BOOL)_isCacheDate:(id)a3 withinDuration:(double)a4
{
  id v5 = a3;
  [v5 timeIntervalSinceNow];
  double v7 = fabs(v6);
  v8 = _FALogSystem();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 >= a4)
  {
    if (v9)
    {
      int v12 = 138412290;
      id v13 = v5;
      id v10 = "Attempting to fetch the family circle from the server as the cache is stale (%@)";
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    int v12 = 138412290;
    id v13 = v5;
    id v10 = "Skipping server fetch of family circle as the cache is fresh (%@)";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0xCu);
  }

  return v7 < a4;
}

- (id)_cacheDataWithFamilyCircle:(id)a3 serverTag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)AAFPromise);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100012864;
  v13[3] = &unk_10004D4B0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = [v8 initWithBlock:v13];

  return v11;
}

- (id)_cacheURL
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100012A24;
  v4[3] = &unk_10004D318;
  v4[4] = self;
  id v2 = [objc_alloc((Class)AAFPromise) initWithBlock:v4];
  return v2;
}

- (id)_createCacheFile
{
  v3 = [(FAFamilyCircleCache *)self _cacheURL];
  v4 = [v3 then];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012B68;
  v7[3] = &unk_10004D7B0;
  v7[4] = self;
  id v5 = ((void (**)(void, void *))v4)[2](v4, v7);

  return v5;
}

- (id)updateWithFamilyCircle:(id)a3 serverTag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)AAFPromise);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100012DE4;
  v13[3] = &unk_10004D4B0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = [v8 initWithBlock:v13];

  return v11;
}

- (id)_onQueue:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)AAFPromise);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000131D0;
  v9[3] = &unk_10004D828;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 initWithBlock:v9];

  return v7;
}

- (id)invalidate
{
  v3 = [(FAFamilyCircleCache *)self _cacheURL];
  id v4 = [v3 then];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000133F4;
  v7[3] = &unk_10004D7B0;
  v7[4] = self;
  id v5 = ((void (**)(void, void *))v4)[2](v4, v7);

  return v5;
}

@end