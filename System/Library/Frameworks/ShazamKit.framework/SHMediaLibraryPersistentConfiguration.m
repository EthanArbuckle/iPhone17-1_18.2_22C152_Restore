@interface SHMediaLibraryPersistentConfiguration
+ (NSURL)managedObjectModelURL;
+ (id)applicationSupportDirectory;
+ (id)persistentStoreDescriptionForStoreType:(id)a3;
+ (id)persistentStoreURL;
@end

@implementation SHMediaLibraryPersistentConfiguration

+ (NSURL)managedObjectModelURL
{
  if (qword_100090AC8 != -1) {
    dispatch_once(&qword_100090AC8, &stru_100075B30);
  }
  v2 = (void *)qword_100090AC0;

  return (NSURL *)v2;
}

+ (id)applicationSupportDirectory
{
  v2 = +[NSFileManager defaultManager];
  id v7 = 0;
  v3 = [v2 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:0 error:&v7];
  id v4 = v7;

  if (!v3)
  {
    v5 = sh_log_object();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unable to load Application Support directory: %@", buf, 0xCu);
    }
  }

  return v3;
}

+ (id)persistentStoreURL
{
  v2 = [a1 applicationSupportDirectory];
  v3 = [v2 URLByAppendingPathComponent:@"com.apple.shazamd" isDirectory:1];

  id v4 = [v3 path];

  if (!v4)
  {
    v13 = 0;
    goto LABEL_13;
  }
  v5 = +[NSFileManager defaultManager];
  v6 = [v3 path];
  unsigned __int8 v7 = [v5 fileExistsAtPath:v6 isDirectory:0];

  if ((v7 & 1) == 0)
  {
    v8 = sh_log_object();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Parent directory of persistent store url doesn't exist, creating one now", buf, 2u);
    }

    id v9 = +[NSFileManager defaultManager];
    v10 = [v3 path];
    id v16 = 0;
    unsigned __int8 v11 = [v9 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v16];
    id v12 = v16;

    if ((v11 & 1) == 0)
    {
      v14 = sh_log_object();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to create persistent store directory: %@", buf, 0xCu);
      }

      v13 = 0;
      goto LABEL_12;
    }
  }
  id v12 = [v3 URLByAppendingPathComponent:@"ShazamLibrary" isDirectory:0];
  v13 = [v12 URLByAppendingPathExtension:@"sqlite"];
LABEL_12:

LABEL_13:

  return v13;
}

+ (id)persistentStoreDescriptionForStoreType:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  [v5 setType:v4];
  [v5 setShouldMigrateStoreAutomatically:1];
  [v5 setShouldInferMappingModelAutomatically:1];
  [v5 setUsesPersistentHistoryTracking:1];
  unsigned __int8 v6 = [v4 isEqualToString:NSInMemoryStoreType];

  if ((v6 & 1) == 0)
  {
    unsigned __int8 v7 = [a1 persistentStoreURL];
    if (v7)
    {
      [v5 setURL:v7];
    }
    else
    {
      v8 = sh_log_object();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Persistent store url missing, fallback to in memory store type", v10, 2u);
      }
    }
  }

  return v5;
}

@end