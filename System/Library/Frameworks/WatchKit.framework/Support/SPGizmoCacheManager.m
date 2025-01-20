@interface SPGizmoCacheManager
+ (id)sharedInstance;
- (SPCompanionAppServer)companionAppServer;
- (SPGizmoCacheManager)init;
- (id)assetPath:(id)a3 cacheIdentifier:(id)a4 cacheType:(unint64_t)a5;
- (id)cacheAssets:(id)a3 cacheType:(unint64_t)a4 cacheIdentifier:(id)a5;
- (id)cacheDirectory;
- (id)cacheDirectoryWithCacheIdentifier:(id)a3;
- (id)cacheDirectoryWithCacheIdentifier:(id)a3 cacheType:(unint64_t)a4;
- (void)addData:(id)a3 cacheIdentifier:(id)a4 completion:(id)a5;
- (void)clearAllCachedImages:(id)a3 cacheIdentifier:(id)a4 completion:(id)a5;
- (void)deleteCache:(id)a3;
- (void)deleteData:(id)a3 cacheIdentifier:(id)a4 completion:(id)a5;
- (void)getData:(id)a3 cacheIdentifier:(id)a4 completion:(id)a5;
- (void)processCacheDictionary:(id)a3 connectionIdentifier:(id)a4 completion:(id)a5;
- (void)processCacheMessage:(id)a3 connectionIdentifier:(id)a4 completion:(id)a5;
- (void)processCacheMessageData:(id)a3 connectionIdentifier:(id)a4;
- (void)sendCacheReply:(id)a3 cacheIdentifier:(id)a4;
- (void)setCompanionAppServer:(id)a3;
- (void)setupCacheWithIdentifier:(id)a3 completion:(id)a4;
@end

@implementation SPGizmoCacheManager

- (SPGizmoCacheManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)SPGizmoCacheManager;
  v2 = [(SPGizmoCacheManager *)&v5 init];
  v3 = v2;
  if (v2) {
    objc_storeWeak((id *)&v2->_companionAppServer, 0);
  }
  return v3;
}

+ (id)sharedInstance
{
  if (qword_100052640 != -1) {
    dispatch_once(&qword_100052640, &stru_100046448);
  }
  v2 = (void *)qword_100052648;

  return v2;
}

- (id)cacheDirectory
{
  if (qword_100052658 != -1) {
    dispatch_once(&qword_100052658, &stru_100046468);
  }
  v2 = (void *)qword_100052650;

  return v2;
}

- (id)cacheDirectoryWithCacheIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SPGizmoCacheManager *)self cacheDirectory];
  v9[0] = v5;
  v9[1] = v4;
  v6 = +[NSArray arrayWithObjects:v9 count:2];

  v7 = +[NSString pathWithComponents:v6];

  return v7;
}

- (id)cacheDirectoryWithCacheIdentifier:(id)a3 cacheType:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(SPGizmoCacheManager *)self cacheDirectory];
  CFStringRef v8 = @"t";
  v12 = v7;
  id v13 = v6;
  if (a4 == 1) {
    CFStringRef v8 = @"p";
  }
  CFStringRef v14 = v8;
  v9 = +[NSArray arrayWithObjects:&v12 count:3];

  v10 = +[NSString pathWithComponents:](NSString, "pathWithComponents:", v9, v12, v13);

  return v10;
}

- (id)assetPath:(id)a3 cacheIdentifier:(id)a4 cacheType:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(SPGizmoCacheManager *)self cacheDirectory];
  CFStringRef v11 = @"t";
  v16[0] = v10;
  v16[1] = v8;
  if (a5 == 1) {
    CFStringRef v11 = @"p";
  }
  v16[2] = v11;
  v12 = objc_msgSend(v9, "_sp_stringByEncodingIllegalFilenameCharacters");

  v16[3] = v12;
  id v13 = +[NSArray arrayWithObjects:v16 count:4];

  CFStringRef v14 = +[NSString pathWithComponents:v13];

  return v14;
}

- (void)deleteCache:(id)a3
{
  v3 = [(SPGizmoCacheManager *)self cacheDirectoryWithCacheIdentifier:a3];
  id v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v6 = +[NSFileManager defaultManager];
    id v9 = 0;
    [v6 removeItemAtPath:v3 error:&v9];
    id v7 = v9;

    if (v7)
    {
      id v8 = wk_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10002C2A8();
      }
    }
  }
}

- (void)processCacheMessageData:(id)a3 connectionIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = +[SPProtoSerializer objectWithData:a3];
  [(SPGizmoCacheManager *)self processCacheMessage:v7 connectionIdentifier:v6 completion:0];
}

- (void)processCacheDictionary:(id)a3 connectionIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  CFStringRef v11 = [[SPCacheMessage alloc] initWithDictionary:v10];

  [(SPGizmoCacheManager *)self processCacheMessage:v11 connectionIdentifier:v9 completion:v8];
}

- (void)processCacheMessage:(id)a3 connectionIdentifier:(id)a4 completion:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v10 messageType] == 11)
  {
    [(SPGizmoCacheManager *)self setupCacheWithIdentifier:v8 completion:v9];
  }
  else if ([v10 messageType] == 3)
  {
    [(SPGizmoCacheManager *)self getData:v10 cacheIdentifier:v8 completion:v9];
  }
  else if ([v10 messageType] == 2)
  {
    [(SPGizmoCacheManager *)self addData:v10 cacheIdentifier:v8 completion:v9];
  }
  else if ([v10 messageType] == 4)
  {
    [(SPGizmoCacheManager *)self deleteData:v10 cacheIdentifier:v8 completion:v9];
  }
  else if ([v10 messageType] == 5)
  {
    [(SPGizmoCacheManager *)self clearAllCachedImages:v10 cacheIdentifier:v8 completion:v9];
  }
}

- (void)getData:(id)a3 cacheIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  CFStringRef v11 = [v8 assetKey];
  int v12 = 2;
  id v13 = [(SPGizmoCacheManager *)self assetPath:v11 cacheIdentifier:v9 cacheType:2];

  uint64_t v14 = +[NSData dataWithContentsOfFile:v13];
  if (v14)
  {
    v15 = (void *)v14;
  }
  else
  {
    v16 = [v8 assetKey];
    int v12 = 1;
    v17 = [(SPGizmoCacheManager *)self assetPath:v16 cacheIdentifier:v9 cacheType:1];

    uint64_t v18 = +[NSData dataWithContentsOfFile:v17];
    if (!v18)
    {
      v25 = wk_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_10002C330((uint64_t)v9, v8, v25);
      }

      if (!v10)
      {
        v15 = 0;
        goto LABEL_11;
      }
      CFStringRef v26 = @"e";
      v27 = &off_10004ACA8;
      v24 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      v15 = 0;
      goto LABEL_9;
    }
    v15 = (void *)v18;
    id v13 = v17;
  }
  v19 = wk_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = [v8 assetKey];
    *(_DWORD *)buf = 136447234;
    v31 = "-[SPGizmoCacheManager getData:cacheIdentifier:completion:]";
    __int16 v32 = 1024;
    int v33 = 132;
    __int16 v34 = 2114;
    id v35 = v9;
    __int16 v36 = 1024;
    int v37 = v12;
    __int16 v38 = 2114;
    v39 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: cache id: %{public}@, type: %d, asset key: %{public}@", buf, 0x2Cu);
  }
  if (!v10)
  {
    v17 = v13;
    goto LABEL_11;
  }
  v21 = +[NSFileManager defaultManager];
  v22 = +[NSDate date];
  v23 = +[NSDictionary dictionaryWithObject:v22 forKey:NSFileModificationDate];
  [v21 setAttributes:v23 ofItemAtPath:v13 error:0];

  CFStringRef v28 = @"d";
  v29 = v15;
  v24 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  v17 = v13;
LABEL_9:
  v10[2](v10, v24);

LABEL_11:
}

- (void)addData:(id)a3 cacheIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  CFStringRef v11 = wk_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v12 = [v8 cacheType];
    id v13 = [v8 assetKey];
    *(_DWORD *)buf = 136447234;
    v49 = "-[SPGizmoCacheManager addData:cacheIdentifier:completion:]";
    __int16 v50 = 1024;
    int v51 = 151;
    __int16 v52 = 2114;
    id v53 = v9;
    __int16 v54 = 1024;
    unsigned int v55 = v12;
    __int16 v56 = 2114;
    v57 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: cache id: %{public}@, type: %d, asset key: %{public}@", buf, 0x2Cu);
  }
  uint64_t v14 = [v8 assetData];
  v15 = [v8 assetKey];
  v16 = -[SPGizmoCacheManager assetPath:cacheIdentifier:cacheType:](self, "assetPath:cacheIdentifier:cacheType:", v15, v9, [v8 cacheType]);

  v17 = +[NSFileManager defaultManager];
  unsigned int v18 = [v17 fileExistsAtPath:v16];

  if (v18)
  {
    v19 = +[NSFileManager defaultManager];
    id v37 = 0;
    [v19 removeItemAtPath:v16 error:&v37];
    id v20 = v37;

    if (v20)
    {
      v21 = wk_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10002C4F4();
      }

      if (v10)
      {
        CFStringRef v46 = @"e";
        v47 = &off_10004ACA8;
        v22 = &v47;
        v23 = &v46;
        goto LABEL_14;
      }
      v45[0] = &off_10004ACC0;
      v44[0] = @"cmsg";
      v44[1] = @"a";
      CFStringRef v28 = [v8 assetKey];
      v45[1] = v28;
      v44[2] = @"t";
      v29 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 cacheType]);
      v44[3] = @"e";
      v45[2] = v29;
      v45[3] = &off_10004ACA8;
      v30 = v45;
      v31 = v44;
LABEL_21:
      __int16 v32 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v31 count:4];
      [(SPGizmoCacheManager *)self sendCacheReply:v32 cacheIdentifier:v9];

      goto LABEL_23;
    }
  }
  id v36 = 0;
  [v14 writeToFile:v16 options:1 error:&v36];
  id v24 = v36;
  id v20 = v24;
  if (!v10)
  {
    if (!v24)
    {
      v41[0] = &off_10004ACC0;
      v40[0] = @"cmsg";
      v40[1] = @"a";
      int v33 = [v8 assetKey];
      v41[1] = v33;
      v40[2] = @"t";
      __int16 v34 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 cacheType]);
      v41[2] = v34;
      id v35 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];
      [(SPGizmoCacheManager *)self sendCacheReply:v35 cacheIdentifier:v9];

      id v20 = 0;
      goto LABEL_23;
    }
    v27 = wk_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10002C3FC();
    }

    v39[0] = &off_10004ACC0;
    v38[0] = @"cmsg";
    v38[1] = @"a";
    CFStringRef v28 = [v8 assetKey];
    v39[1] = v28;
    v38[2] = @"t";
    v29 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 cacheType]);
    v38[3] = @"e";
    v39[2] = v29;
    v39[3] = &off_10004ACA8;
    v30 = v39;
    v31 = v38;
    goto LABEL_21;
  }
  if (!v24)
  {
    v10[2](v10, &__NSDictionary0__struct);
    goto LABEL_23;
  }
  v25 = wk_default_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    sub_10002C478();
  }

  CFStringRef v42 = @"e";
  v43 = &off_10004ACA8;
  v22 = &v43;
  v23 = &v42;
LABEL_14:
  CFStringRef v26 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v23 count:1];
  v10[2](v10, v26);

LABEL_23:
}

- (void)deleteData:(id)a3 cacheIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  CFStringRef v11 = wk_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v12 = [v8 cacheType];
    id v13 = [v8 assetKey];
    *(_DWORD *)buf = 136447234;
    id v35 = "-[SPGizmoCacheManager deleteData:cacheIdentifier:completion:]";
    __int16 v36 = 1024;
    int v37 = 189;
    __int16 v38 = 2114;
    id v39 = v9;
    __int16 v40 = 1024;
    unsigned int v41 = v12;
    __int16 v42 = 2114;
    v43 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: cache id: %{public}@, type: %d, asset key: %{public}@", buf, 0x2Cu);
  }
  uint64_t v14 = [v8 assetKey];
  v15 = -[SPGizmoCacheManager assetPath:cacheIdentifier:cacheType:](self, "assetPath:cacheIdentifier:cacheType:", v14, v9, [v8 cacheType]);

  v16 = +[NSFileManager defaultManager];
  id v27 = 0;
  [v16 removeItemAtPath:v15 error:&v27];
  id v17 = v27;

  if (v10)
  {
    if (v17)
    {
      unsigned int v18 = wk_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10002C5EC();
      }

      CFStringRef v32 = @"e";
      int v33 = &off_10004ACA8;
      v19 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      v10[2](v10, v19);
    }
    else
    {
      v10[2](v10, &__NSDictionary0__struct);
    }
  }
  else
  {
    if (v17)
    {
      id v20 = wk_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10002C570();
      }

      v29[0] = &off_10004ACD8;
      v28[0] = @"cmsg";
      v28[1] = @"a";
      v21 = [v8 assetKey];
      v29[1] = v21;
      v28[2] = @"t";
      v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 cacheType]);
      v28[3] = @"e";
      v29[2] = v22;
      v29[3] = &off_10004ACA8;
      v23 = v29;
      id v24 = v28;
      uint64_t v25 = 4;
    }
    else
    {
      v31[0] = &off_10004ACD8;
      v30[0] = @"cmsg";
      v30[1] = @"a";
      v21 = [v8 assetKey];
      v31[1] = v21;
      v30[2] = @"t";
      v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 cacheType]);
      v31[2] = v22;
      v23 = v31;
      id v24 = v30;
      uint64_t v25 = 3;
    }
    CFStringRef v26 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v24 count:v25];
    [(SPGizmoCacheManager *)self sendCacheReply:v26 cacheIdentifier:v9];
  }
}

- (void)clearAllCachedImages:(id)a3 cacheIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v33 = a5;
  id v10 = wk_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    CFStringRef v46 = "-[SPGizmoCacheManager clearAllCachedImages:cacheIdentifier:completion:]";
    __int16 v47 = 1024;
    int v48 = 214;
    __int16 v49 = 2114;
    id v50 = v9;
    __int16 v51 = 1024;
    LODWORD(v52) = [v8 cacheType];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s:%d: cache id: %{public}@, type: %d", buf, 0x22u);
  }

  CFStringRef v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 cacheType]);
  CFStringRef v32 = self;
  unsigned int v12 = -[SPGizmoCacheManager cacheDirectoryWithCacheIdentifier:cacheType:](self, "cacheDirectoryWithCacheIdentifier:cacheType:", v9, [v11 integerValue]);

  id v13 = +[NSFileManager defaultManager];
  uint64_t v14 = [v13 contentsOfDirectoryAtPath:v12 error:0];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v35 objects:v53 count:16];
  if (!v16)
  {

    uint64_t v25 = (void (**)(void, void))v33;
    if (v33) {
      goto LABEL_18;
    }
LABEL_22:
    v42[0] = &off_10004ACF0;
    v41[0] = @"cmsg";
    v41[1] = @"t";
    CFStringRef v28 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 cacheType]);
    v42[1] = v28;
    v29 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
    [(SPGizmoCacheManager *)v32 sendCacheReply:v29 cacheIdentifier:v9];

    goto LABEL_23;
  }
  id v17 = v16;
  id v30 = v9;
  v31 = v8;
  id v18 = 0;
  uint64_t v19 = *(void *)v36;
  do
  {
    id v20 = 0;
    v21 = v18;
    do
    {
      if (*(void *)v36 != v19) {
        objc_enumerationMutation(v15);
      }
      v22 = objc_msgSend(v12, "stringByAppendingPathComponent:", *(void *)(*((void *)&v35 + 1) + 8 * (void)v20), v30);
      v23 = +[NSFileManager defaultManager];
      id v34 = v21;
      [v23 removeItemAtPath:v22 error:&v34];
      id v18 = v34;

      if (v18)
      {
        id v24 = wk_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          CFStringRef v46 = "-[SPGizmoCacheManager clearAllCachedImages:cacheIdentifier:completion:]";
          __int16 v47 = 1024;
          int v48 = 224;
          __int16 v49 = 2114;
          id v50 = v22;
          __int16 v51 = 2114;
          id v52 = v18;
          _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}s:%d: failed to delete asset at: %{public}@, error: %{public}@", buf, 0x26u);
        }
      }
      id v20 = (char *)v20 + 1;
      v21 = v18;
    }
    while (v17 != v20);
    id v17 = [v15 countByEnumeratingWithState:&v35 objects:v53 count:16];
  }
  while (v17);

  uint64_t v25 = (void (**)(void, void))v33;
  if (!v33)
  {
    id v9 = v30;
    id v8 = v31;
    if (v18)
    {
      v40[0] = &off_10004ACF0;
      v39[0] = @"cmsg";
      v39[1] = @"t";
      CFStringRef v26 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v31 cacheType]);
      v39[2] = @"e";
      v40[1] = v26;
      v40[2] = &off_10004ACA8;
      id v27 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:3];
      [(SPGizmoCacheManager *)v32 sendCacheReply:v27 cacheIdentifier:v30];

      goto LABEL_21;
    }
    goto LABEL_22;
  }
  id v9 = v30;
  id v8 = v31;
  if (v18)
  {
    CFStringRef v43 = @"e";
    v44 = &off_10004ACA8;
    CFStringRef v26 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    (*((void (**)(id, void *))v33 + 2))(v33, v26);
LABEL_21:

    goto LABEL_23;
  }
LABEL_18:
  ((void (**)(void, void *))v25)[2](v25, &__NSDictionary0__struct);
LABEL_23:
}

- (void)setupCacheWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000276C4;
  block[3] = &unk_100045628;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (id)cacheAssets:(id)a3 cacheType:(unint64_t)a4 cacheIdentifier:(id)a5
{
  id v6 = a3;
  char v87 = 0;
  id v7 = +[NSFileManager defaultManager];
  unsigned __int8 v8 = [v7 fileExistsAtPath:v6 isDirectory:&v87];

  if ((v8 & 1) != 0
    || (+[NSFileManager defaultManager],
        id v9 = objc_claimAutoreleasedReturnValue(),
        id v86 = 0,
        [v9 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v86],
        id v10 = (SPCacheAsset *)v86,
        v9,
        !v10))
  {
    id v12 = +[NSFileManager defaultManager];
    id v63 = v6;
    id v13 = [objc_alloc((Class)NSURL) initFileURLWithPath:v6 isDirectory:1];
    NSURLResourceKey v14 = NSURLContentModificationDateKey;
    NSURLResourceKey v15 = NSURLFileSizeKey;
    v100[0] = NSURLContentModificationDateKey;
    v100[1] = NSURLFileSizeKey;
    id v16 = +[NSArray arrayWithObjects:v100 count:2];
    id v85 = 0;
    v62 = [v12 contentsOfDirectoryAtURL:v13 includingPropertiesForKeys:v16 options:0 error:&v85];
    id v10 = (SPCacheAsset *)v85;

    if (v10)
    {
      obj = wk_default_log();
      if (!os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      {
        id v65 = 0;
        goto LABEL_9;
      }
      id v6 = v63;
      sub_10002C6F4();
      id v65 = 0;
LABEL_10:
      CFStringRef v11 = v62;
      goto LABEL_11;
    }
    id v65 = (id)objc_opt_new();
    if (a4 == 2)
    {
      long long v83 = 0uLL;
      long long v84 = 0uLL;
      long long v81 = 0uLL;
      long long v82 = 0uLL;
      CFStringRef v11 = v62;
      obj = v62;
      id v66 = [obj countByEnumeratingWithState:&v81 objects:v99 count:16];
      if (v66)
      {
        id v10 = 0;
        uint64_t v19 = *(void *)v82;
        *(void *)&long long v18 = 136446978;
        long long v61 = v18;
        uint64_t v64 = *(void *)v82;
        while (1)
        {
          id v20 = 0;
          do
          {
            if (*(void *)v82 != v19) {
              objc_enumerationMutation(obj);
            }
            v21 = *(void **)(*((void *)&v81 + 1) + 8 * (void)v20);
            id v79 = 0;
            id v80 = 0;
            unsigned __int8 v22 = objc_msgSend(v21, "getResourceValue:forKey:error:", &v80, v14, &v79, v61);
            id v23 = v80;
            id v24 = (SPCacheAsset *)v79;

            if (v22)
            {
              id v77 = 0;
              id v78 = 0;
              unsigned __int8 v25 = [v21 getResourceValue:&v78 forKey:v15 error:&v77];
              CFStringRef v26 = v78;
              id v10 = (SPCacheAsset *)v77;

              if ((v25 & 1) == 0)
              {
                long long v35 = wk_default_log();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                {
                  long long v36 = [v21 path];
                  *(_DWORD *)buf = 136447234;
                  v90 = "-[SPGizmoCacheManager cacheAssets:cacheType:cacheIdentifier:]";
                  __int16 v91 = 1024;
                  int v92 = 312;
                  __int16 v93 = 2114;
                  v94 = v63;
                  __int16 v95 = 2114;
                  v96 = v36;
                  __int16 v97 = 2114;
                  v98 = v10;
                  _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}s:%d: NSURLFileSizeKey failed at: %{public}@, for: %{public}@, error: %{public}@", buf, 0x30u);
                }
                goto LABEL_35;
              }
              id v27 = v14;
              CFStringRef v28 = v15;
              v29 = +[NSDate date];
              [v29 timeIntervalSinceDate:v23];
              double v31 = v30;

              if (v31 <= 2592000.0)
              {
                long long v37 = [v21 path];
                long long v35 = [v37 lastPathComponent];

                long long v38 = [SPCacheAsset alloc];
                id v39 = [v35 stringByRemovingPercentEncoding];
                __int16 v40 = [(SPCacheAsset *)v38 initWithName:v39 size:[v26 unsignedIntegerValue] state:0 accessDate:v23];

                [v65 addAsset:v40];
                goto LABEL_34;
              }
              CFStringRef v32 = +[NSFileManager defaultManager];
              id v33 = [v21 path];
              v76 = v10;
              [v32 removeItemAtPath:v33 error:&v76];
              id v34 = v76;

              if (v34)
              {
                long long v35 = wk_default_log();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                {
                  __int16 v42 = [v21 path];
                  *(_DWORD *)buf = v61;
                  v90 = "-[SPGizmoCacheManager cacheAssets:cacheType:cacheIdentifier:]";
                  __int16 v91 = 1024;
                  int v92 = 317;
                  __int16 v93 = 2114;
                  v94 = v42;
                  __int16 v95 = 2114;
                  v96 = v34;
                  _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}s:%d: removeItemAtPath failed at: %{public}@, error: %{public}@", buf, 0x26u);
                }
                id v10 = v34;
LABEL_34:
                NSURLResourceKey v15 = v28;
                NSURLResourceKey v14 = v27;
                uint64_t v19 = v64;
LABEL_35:

                goto LABEL_36;
              }
              id v10 = 0;
              NSURLResourceKey v15 = v28;
              NSURLResourceKey v14 = v27;
              uint64_t v19 = v64;
            }
            else
            {
              CFStringRef v26 = wk_default_log();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                unsigned int v41 = [v21 path];
                *(_DWORD *)buf = 136447234;
                v90 = "-[SPGizmoCacheManager cacheAssets:cacheType:cacheIdentifier:]";
                __int16 v91 = 1024;
                int v92 = 308;
                __int16 v93 = 2114;
                v94 = v63;
                __int16 v95 = 2114;
                v96 = v41;
                __int16 v97 = 2114;
                v98 = v24;
                _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}s:%d: NSURLContentModificationDateKey failed at: %{public}@, for: %{public}@, error: %{public}@", buf, 0x30u);
              }
              id v10 = v24;
            }
LABEL_36:

            id v20 = (char *)v20 + 1;
          }
          while (v66 != v20);
          id v43 = [obj countByEnumeratingWithState:&v81 objects:v99 count:16];
          id v66 = v43;
          if (!v43) {
            goto LABEL_9;
          }
        }
      }
LABEL_60:
      id v10 = 0;
      id v6 = v63;
LABEL_11:

      goto LABEL_12;
    }
    long long v74 = 0uLL;
    long long v75 = 0uLL;
    long long v72 = 0uLL;
    long long v73 = 0uLL;
    CFStringRef v11 = v62;
    obj = v62;
    id v44 = [obj countByEnumeratingWithState:&v72 objects:v88 count:16];
    if (!v44) {
      goto LABEL_60;
    }
    id v45 = v44;
    id v10 = 0;
    uint64_t v46 = *(void *)v73;
LABEL_43:
    uint64_t v47 = 0;
    while (1)
    {
      if (*(void *)v73 != v46) {
        objc_enumerationMutation(obj);
      }
      int v48 = *(void **)(*((void *)&v72 + 1) + 8 * v47);
      id v70 = 0;
      id v71 = 0;
      unsigned __int8 v49 = [v48 getResourceValue:&v71 forKey:NSURLContentModificationDateKey error:&v70];
      id v50 = v71;
      __int16 v51 = (SPCacheAsset *)v70;

      if ((v49 & 1) == 0)
      {
        id v53 = wk_default_log();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v59 = [v48 path];
          *(_DWORD *)buf = 136447234;
          v90 = "-[SPGizmoCacheManager cacheAssets:cacheType:cacheIdentifier:]";
          __int16 v91 = 1024;
          int v92 = 331;
          __int16 v93 = 2114;
          v94 = v63;
          __int16 v95 = 2114;
          v96 = v59;
          __int16 v97 = 2114;
          v98 = v51;
          _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%{public}s:%d: NSURLContentModificationDateKey failed at: %{public}@, for: %{public}@, error: %{public}@", buf, 0x30u);
        }
        id v10 = v51;
        goto LABEL_55;
      }
      id v68 = 0;
      id v69 = 0;
      unsigned __int8 v52 = [v48 getResourceValue:&v69 forKey:NSURLFileSizeKey error:&v68];
      id v53 = v69;
      id v10 = (SPCacheAsset *)v68;

      if (v52)
      {
        __int16 v54 = [v48 path];
        unsigned int v55 = [v54 lastPathComponent];

        __int16 v56 = [SPCacheAsset alloc];
        v57 = [v55 stringByRemovingPercentEncoding];
        v58 = [(SPCacheAsset *)v56 initWithName:v57 size:[v53 unsignedIntegerValue] state:0 accessDate:v50];

        [v65 addAsset:v58];
      }
      else
      {
        unsigned int v55 = wk_default_log();
        if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
          goto LABEL_54;
        }
        v58 = [v48 path];
        *(_DWORD *)buf = 136447234;
        v90 = "-[SPGizmoCacheManager cacheAssets:cacheType:cacheIdentifier:]";
        __int16 v91 = 1024;
        int v92 = 335;
        __int16 v93 = 2114;
        v94 = v63;
        __int16 v95 = 2114;
        v96 = v58;
        __int16 v97 = 2114;
        v98 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%{public}s:%d: NSURLFileSizeKey failed at: %{public}@, for: %{public}@, error: %{public}@", buf, 0x30u);
      }

LABEL_54:
LABEL_55:

      if (v45 == (id)++v47)
      {
        id v60 = [obj countByEnumeratingWithState:&v72 objects:v88 count:16];
        id v45 = v60;
        if (!v60)
        {
LABEL_9:
          id v6 = v63;
          goto LABEL_10;
        }
        goto LABEL_43;
      }
    }
  }
  CFStringRef v11 = wk_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10002C770();
  }
  id v65 = 0;
LABEL_12:

  return v65;
}

- (void)sendCacheReply:(id)a3 cacheIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SPCacheMessage alloc] initWithDictionary:v6];

  unsigned __int8 v8 = +[SPProtoSerializer dataWithObject:v7];
  if (v8)
  {
    id v9 = +[SPIDSProtobuf cacheRequestWithProtoData:v8 identifier:v5];
    id v10 = +[SPTransport sharedInstance];
    [v10 sendProtobuf:v9 sender:v5 timeOut:0 securityType:&stru_1000464A8 withCompletion:60.0];
  }
  else
  {
    id v9 = wk_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002C7EC();
    }
  }
}

- (SPCompanionAppServer)companionAppServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_companionAppServer);

  return (SPCompanionAppServer *)WeakRetained;
}

- (void)setCompanionAppServer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end