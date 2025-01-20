@interface GEOMAResourceInfo
+ (id)baseURLForType:(unint64_t)a3;
+ (id)maResourcesFolder;
- (BOOL)isExpired;
- (GEOMAResourceInfo)initWithType:(unint64_t)a3 overrides:(id)a4;
- (double)lastAccessedTime;
- (id)_backgroundDownloadOptions;
- (id)baseURL;
- (id)description;
- (id)installedResources;
- (id)query;
- (void)_listResources:(BOOL)a3 queue:(id)a4 results:(id)a5;
- (void)listResources:(BOOL)a3 queue:(id)a4 results:(id)a5;
- (void)updateLastAccessedTime;
@end

@implementation GEOMAResourceInfo

- (void)updateLastAccessedTime
{
  id v2 = [(GEOMAResourceInfo *)self baseURL];
  utimes((const char *)[v2 fileSystemRepresentation], 0);
}

- (id)baseURL
{
  v3 = objc_opt_class();
  unint64_t type = self->_type;

  return [v3 baseURLForType:type];
}

+ (id)baseURLForType:(unint64_t)a3
{
  v4 = [a1 maResourcesFolder];
  v5 = v4;
  CFStringRef v6 = @"territories";
  if (a3 != 1) {
    CFStringRef v6 = 0;
  }
  if (a3) {
    CFStringRef v7 = v6;
  }
  else {
    CFStringRef v7 = @"metroRegions";
  }
  v8 = [v4 URLByAppendingPathComponent:v7 isDirectory:1];

  return v8;
}

+ (id)maResourcesFolder
{
  if (qword_1000848B0 != -1) {
    dispatch_once(&qword_1000848B0, &stru_100072958);
  }
  id v2 = (void *)qword_1000848A8;

  return v2;
}

- (void)listResources:(BOOL)a3 queue:(id)a4 results:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([(GEOMAResourceInfo *)self conformsToProtocol:&OBJC_PROTOCOL___GEOMAResourceInfo])
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000A7D8;
    v18[3] = &unk_100072980;
    v18[4] = self;
    BOOL v21 = a3;
    dispatch_queue_t v19 = (dispatch_queue_t)v8;
    id v20 = v9;
    dispatch_async(v19, v18);
  }
  else
  {
    BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v10) {
      sub_10004CFB4(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

- (GEOMAResourceInfo)initWithType:(unint64_t)a3 overrides:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)GEOMAResourceInfo;
  CFStringRef v7 = [(GEOMAResourceInfo *)&v18 init];
  id v8 = v7;
  if (v7)
  {
    v7->_unint64_t type = a3;
    id v9 = [(id)objc_opt_class() _defaultQueryParameters];
    BOOL v10 = v9;
    if (v6)
    {
      id v11 = [(NSDictionary *)v9 mutableCopy];

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100035B74;
      v16[3] = &unk_100072938;
      id v17 = v11;
      uint64_t v12 = (NSDictionary *)v11;
      [v6 enumerateKeysAndObjectsUsingBlock:v16];
      uint64_t v13 = (NSDictionary *)[(NSDictionary *)v12 copy];
      queryParameters = v8->_queryParameters;
      v8->_queryParameters = v13;
    }
    else
    {
      uint64_t v12 = v8->_queryParameters;
      v8->_queryParameters = v9;
    }
  }
  return v8;
}

- (void)_listResources:(BOOL)a3 queue:(id)a4 results:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = self;
  id v11 = [(GEOMAResourceInfo *)v10 installedResources];
  uint64_t v12 = v11;
  if (a3 || ![v11 count])
  {
    [(GEOMAResourceInfo *)v10 query];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100036088;
    v15[3] = &unk_1000729F8;
    v15[4] = v10;
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = v8;
    id v18 = v12;
    id v20 = v9;
    dispatch_queue_t v19 = v10;
    id v14 = v16;
    [v14 queryMetaDataWithError:v15];
  }
  else
  {
    uint64_t v13 = sub_10000966C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138478083;
      v22 = v10;
      __int16 v23 = 2113;
      v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "MA query found installed resources and checkForUpdates = NO; %{private}@ resources: %{private}@",
        buf,
        0x16u);
    }

    id v14 = [v12 sortedArrayUsingSelector:"compare:"];
    (*((void (**)(id, void, id, void))v9 + 2))(v9, 0, v14, 0);
  }
}

- (id)installedResources
{
  if ([(GEOMAResourceInfo *)self conformsToProtocol:&OBJC_PROTOCOL___GEOMAResourceInfo])
  {
    v3 = self;
    +[NSMutableArray array];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100007BFC;
    v17[3] = &unk_100071348;
    v17[4] = v3;
    id v18 = v3;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v19 = v4;
    v5 = v3;
    +[GEOMAResource onFileAccessQueueSync:v17];
    id v6 = v19;
    id v7 = v4;
  }
  else
  {
    BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v9) {
      sub_10004CFB4(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    id v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (double)lastAccessedTime
{
  id v2 = [(GEOMAResourceInfo *)self baseURL];
  id v13 = 0;
  id v12 = 0;
  unsigned __int8 v3 = [v2 getResourceValue:&v13 forKey:NSURLContentModificationDateKey error:&v12];
  id v4 = v13;
  id v5 = v12;
  if (v3)
  {
    [v4 timeIntervalSinceReferenceDate];
    double v7 = v6;
  }
  else
  {
    id v8 = sub_10000966C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478083;
      uint64_t v15 = v2;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unable to read modification time for resource %{private}@: %@", buf, 0x16u);
    }

    BOOL v9 = +[NSDate distantPast];
    [v9 timeIntervalSinceReferenceDate];
    double v7 = v10;
  }
  return v7;
}

- (BOOL)isExpired
{
  if ([(GEOMAResourceInfo *)self conformsToProtocol:&OBJC_PROTOCOL___GEOMAResourceInfo])
  {
    unsigned __int8 v3 = self;
    [(GEOMAResourceInfo *)v3 lastAccessedTime];
    double v5 = v4;
    [(GEOMAResourceInfo *)v3 timeToLive];
    double v7 = v6;

    id v8 = +[NSDate date];
    [v8 timeIntervalSinceReferenceDate];
    BOOL v10 = v9 > v5 + v7;
  }
  else
  {
    BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
    if (v12) {
      sub_10004CFB4(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    return 1;
  }
  return v10;
}

- (id)_backgroundDownloadOptions
{
  id v2 = objc_alloc_init((Class)sub_100025ECC());
  [v2 setAllowsCellularAccess:0];
  [v2 setAllowsExpensiveAccess:0];
  [v2 setDiscretionary:1];

  return v2;
}

- (id)query
{
  id v3 = objc_alloc((Class)sub_100025D90());
  double v4 = [(id)objc_opt_class() _defaultQueryType];
  id v5 = [v3 initWithType:v4];

  queryParameters = self->_queryParameters;
  if (queryParameters)
  {
    double v7 = queryParameters;
  }
  else
  {
    double v7 = [(id)objc_opt_class() _defaultQueryParameters];
  }
  id v8 = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100035FB0;
  v13[3] = &unk_100072938;
  id v9 = v5;
  id v14 = v9;
  [(NSDictionary *)v8 enumerateKeysAndObjectsUsingBlock:v13];
  [v9 returnTypes:2];
  [v9 setDoNotBlockBeforeFirstUnlock:1];
  BOOL v10 = v14;
  id v11 = v9;

  return v11;
}

- (id)description
{
  id v3 = +[NSMutableString string];
  [v3 appendString:@"<"];
  double v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendString:v5];

  objc_msgSend(v3, "appendFormat:", @" %p -", self);
  queryParameters = self->_queryParameters;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100036580;
  v9[3] = &unk_100072938;
  id v7 = v3;
  id v10 = v7;
  [(NSDictionary *)queryParameters enumerateKeysAndObjectsUsingBlock:v9];
  [v7 appendString:@">"];

  return v7;
}

@end