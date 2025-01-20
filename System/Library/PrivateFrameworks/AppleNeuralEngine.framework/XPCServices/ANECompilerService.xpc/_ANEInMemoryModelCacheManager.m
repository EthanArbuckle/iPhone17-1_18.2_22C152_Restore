@interface _ANEInMemoryModelCacheManager
+ (BOOL)removeFilesFromDirectory:(id)a3 notAccessedInSeconds:(double)a4;
+ (BOOL)removeStaleModelsAtPath:(id)a3;
+ (id)new;
+ (unint64_t)notRecentlyUsedSecondsThreshold;
- (BOOL)removeAllModelsForBundleID:(id)a3;
- (BOOL)removeStaleModels;
- (BOOL)shouldEnforceSizeLimits;
- (NSURL)cacheDir;
- (_ANEInMemoryModelCacheManager)init;
- (_ANEInMemoryModelCacheManager)initWithURL:(id)a3;
- (_ANEInMemoryModelCacheManager)initWithURL:(id)a3 createDirectory:(BOOL)a4;
- (id)URLForBundleID:(id)a3;
- (id)URLForModelHash:(id)a3 bundleID:(id)a4;
- (id)cachedModelPathMatchingHash:(id)a3 csIdentity:(id)a4;
- (id)getDiskSpaceForBundleID:(id)a3;
- (id)getDiskSpaceItemizedByBundleIDAndPurge:(BOOL)a3;
- (void)scheduleMaintenanceWithName:(id)a3 directoryPaths:(id)a4;
@end

@implementation _ANEInMemoryModelCacheManager

- (_ANEInMemoryModelCacheManager)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (_ANEInMemoryModelCacheManager)initWithURL:(id)a3 createDirectory:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_ANEInMemoryModelCacheManager;
  v9 = [(_ANEInMemoryModelCacheManager *)&v18 init];
  if (v9)
  {
    if (v4)
    {
      v10 = +[NSFileManager defaultManager];
      v11 = [v8 path];
      id v17 = 0;
      unsigned __int8 v12 = [v10 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v17];
      id v13 = v17;

      if ((v12 & 1) == 0)
      {
        v14 = +[_ANELog daemon];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v16 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          v20 = v16;
          __int16 v21 = 2112;
          id v22 = v8;
          __int16 v23 = 2112;
          id v24 = v13;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@: FAILED creating cacheDir=%@ : err=%@", buf, 0x20u);
        }
      }
    }
    objc_storeStrong((id *)&v9->_cacheDir, a3);
  }

  return v9;
}

- (_ANEInMemoryModelCacheManager)initWithURL:(id)a3
{
  return [(_ANEInMemoryModelCacheManager *)self initWithURL:a3 createDirectory:1];
}

- (id)URLForBundleID:(id)a3
{
  id v4 = a3;
  v5 = [(_ANEInMemoryModelCacheManager *)self cacheDir];
  v6 = [v5 URLByAppendingPathComponent:v4 isDirectory:1];

  return v6;
}

- (id)URLForModelHash:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9 = [(_ANEInMemoryModelCacheManager *)self URLForBundleID:v7];
  v10 = [v9 URLByAppendingPathComponent:v6 isDirectory:1];

  return v10;
}

- (id)cachedModelPathMatchingHash:(id)a3 csIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9 = [(_ANEInMemoryModelCacheManager *)self URLForModelHash:v6 bundleID:v7];
  v10 = +[_ANEStrings modelBinaryName];
  v11 = [v9 URLByAppendingPathComponent:v10 isDirectory:0];

  unsigned __int8 v12 = [v11 path];

  return v12;
}

- (BOOL)removeAllModelsForBundleID:(id)a3
{
  v3 = [(_ANEInMemoryModelCacheManager *)self URLForBundleID:a3];
  id v4 = [v3 path];
  BOOL v5 = +[_ANEStorageHelper removeDirectoryAtPath:v4];

  return v5;
}

- (id)getDiskSpaceItemizedByBundleIDAndPurge:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_ANEInMemoryModelCacheManager *)self cacheDir];
  BOOL v5 = [v4 path];

  id v6 = +[_ANEStorageHelper sizeOfModelCacheAtPath:v5 purgeSubdirectories:v3];

  return v6;
}

- (id)getDiskSpaceForBundleID:(id)a3
{
  BOOL v3 = [(_ANEInMemoryModelCacheManager *)self URLForBundleID:a3];
  id v4 = [v3 path];
  BOOL v5 = +[_ANEStorageHelper sizeOfModelCacheAtPath:v4 purgeSubdirectories:0];

  return v5;
}

- (BOOL)shouldEnforceSizeLimits
{
  return 1;
}

+ (BOOL)removeFilesFromDirectory:(id)a3 notAccessedInSeconds:(double)a4
{
  id v5 = a3;
  id v6 = +[NSDate dateWithTimeIntervalSinceNow:-a4];
  id v7 = +[NSFileManager defaultManager];
  id v8 = [v7 enumeratorAtPath:v5];
  uint64_t v9 = [v8 nextObject];
  if (v9)
  {
    v10 = (void *)v9;
    do
    {
      unsigned __int8 v12 = [v5 stringByAppendingPathComponent:v10];
      char v20 = 0;
      if ([v7 fileExistsAtPath:v12 isDirectory:&v20])
      {
        id v13 = +[_ANEStorageHelper getAccessTimeForFilePath:v12];
        if (v13)
        {
          +[_ANEStorageHelper removeFilePath:v12 ifDate:v13 olderThanSecond:v6];
        }
        else
        {
          v14 = v6;
          v15 = +[_ANELog daemon];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            objc_super v18 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412546;
            id v22 = v18;
            __int16 v23 = 2112;
            id v24 = v12;
            _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%@: Missing access time for %@", buf, 0x16u);
          }
          id v6 = v14;
        }
      }
      uint64_t v16 = [v8 nextObject];

      v10 = (void *)v16;
    }
    while (v16);
  }

  return 1;
}

+ (unint64_t)notRecentlyUsedSecondsThreshold
{
  return 1209600;
}

+ (BOOL)removeStaleModelsAtPath:(id)a3
{
  id v4 = a3;
  objc_msgSend((id)objc_opt_class(), "removeFilesFromDirectory:notAccessedInSeconds:", v4, (double)(unint64_t)objc_msgSend(a1, "notRecentlyUsedSecondsThreshold"));

  return 1;
}

- (BOOL)removeStaleModels
{
  v2 = [(_ANEInMemoryModelCacheManager *)self cacheDir];
  BOOL v3 = [v2 path];

  unsigned __int8 v4 = [(id)objc_opt_class() removeStaleModelsAtPath:v3];
  return v4;
}

- (void)scheduleMaintenanceWithName:(id)a3 directoryPaths:(id)a4
{
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_1000291AC;
  v11 = &unk_10004D0A8;
  id v12 = a3;
  id v13 = self;
  id v5 = v12;
  id v6 = objc_retainBlock(&v8);
  id v7 = +[_ANETask taskWithName:period:handler:](_ANETask, "taskWithName:period:handler:", v5, 86400, v6, v8, v9, v10, v11);
  +[_ANETaskManager registerTask:v7];
}

- (NSURL)cacheDir
{
  return self->_cacheDir;
}

- (void).cxx_destruct
{
}

@end