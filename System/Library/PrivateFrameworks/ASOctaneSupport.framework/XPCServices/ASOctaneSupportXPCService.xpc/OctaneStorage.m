@interface OctaneStorage
+ (id)_containerURL;
+ (id)_createDirectoryAtBaseURL:(id)a3 withPathComponent:(id)a4;
+ (id)persistedDataPath;
@end

@implementation OctaneStorage

+ (id)persistedDataPath
{
  v3 = [a1 _containerURL];
  v4 = [a1 _createDirectoryAtBaseURL:v3 withPathComponent:@"Documents/Persistence"];

  v5 = [v4 path];

  return v5;
}

+ (id)_createDirectoryAtBaseURL:(id)a3 withPathComponent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 URLByAppendingPathComponent:v6];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = +[NSFileManager defaultManager];
    id v19 = 0;
    unsigned __int8 v10 = [v9 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v19];
    id v11 = v19;

    if ((v10 & 1) == 0)
    {
      if (qword_10031AFB8 != -1) {
        dispatch_once(&qword_10031AFB8, &stru_1002D4AE8);
      }
      if (os_log_type_enabled((os_log_t)qword_10031AFA8, OS_LOG_TYPE_ERROR)) {
        sub_10024CC98();
      }
      unsigned __int8 v18 = 0;
      v12 = +[NSFileManager defaultManager];
      v13 = [v8 path];
      unsigned int v14 = [v12 fileExistsAtPath:v13 isDirectory:&v18];
      int v15 = v18;

      if (v14 && v15)
      {
        if (qword_10031AFB8 != -1) {
          dispatch_once(&qword_10031AFB8, &stru_1002D4AE8);
        }
        v16 = qword_10031AFA8;
        if (os_log_type_enabled((os_log_t)qword_10031AFA8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v21 = v8;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Failed to create directory %{public}@, but directory exists.", buf, 0xCu);
        }
      }
      else
      {
        if (qword_10031AFB8 != -1) {
          dispatch_once(&qword_10031AFB8, &stru_1002D4AE8);
        }
        if (os_log_type_enabled((os_log_t)qword_10031AFA8, OS_LOG_TYPE_FAULT)) {
          sub_10024CC30();
        }

        v8 = 0;
      }
    }
  }
  else
  {
    if (qword_10031AFB8 != -1) {
      dispatch_once(&qword_10031AFB8, &stru_1002D4AE8);
    }
    if (os_log_type_enabled((os_log_t)qword_10031AFA8, OS_LOG_TYPE_FAULT)) {
      sub_10024CBC8();
    }
    v8 = 0;
    id v11 = 0;
  }

  return v8;
}

+ (id)_containerURL
{
  if (qword_10031AF68 != -1) {
    dispatch_once(&qword_10031AF68, &stru_1002D4A88);
  }
  v2 = (void *)qword_10031AF60;
  return v2;
}

@end