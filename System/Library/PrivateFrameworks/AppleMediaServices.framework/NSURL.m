@interface NSURL
+ (id)ams_cachesDirectory;
@end

@implementation NSURL

+ (id)ams_cachesDirectory
{
  v2 = +[NSFileManager defaultManager];
  v3 = [v2 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:0];
  v4 = [v3 URLByAppendingPathComponent:@"com.apple.AppleMediaServices" isDirectory:1];

  v5 = +[NSFileManager defaultManager];
  v6 = [v4 path];
  id v13 = 0;
  unsigned __int8 v7 = [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v13];
  id v8 = v13;

  if ((v7 & 1) == 0)
  {
    v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      v9 = +[AMSLogConfig sharedConfig];
    }
    v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2114;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create caches directory. %{public}@", buf, 0x16u);
    }
  }
  return v4;
}

@end