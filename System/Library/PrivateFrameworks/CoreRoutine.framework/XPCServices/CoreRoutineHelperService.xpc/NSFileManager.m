@interface NSFileManager
+ (id)crashReporterPath;
+ (id)defaultsDomain;
+ (id)frameworkBundle;
+ (id)frameworkDirectoryPath;
+ (id)pathInCacheDirectory:(id)a3;
+ (id)routineCacheDirectoryPath;
+ (id)routinePreferencesPath;
+ (id)sortFilesByName:(id)a3;
+ (id)sortedContentsOfDirectoryAtURL:(id)a3 withExtension:(id)a4;
+ (id)userCacheDirectoryPath;
+ (id)userLibraryPath;
+ (id)userPreferencesPath;
@end

@implementation NSFileManager

+ (id)frameworkBundle
{
  return +[NSBundle bundleWithIdentifier:@"com.apple.CoreRoutine"];
}

+ (id)frameworkDirectoryPath
{
  v2 = +[NSFileManager frameworkBundle];
  v3 = [v2 bundleURL];
  v4 = [v3 absoluteString];

  return v4;
}

+ (id)defaultsDomain
{
  return @"com.apple.routined";
}

+ (id)userCacheDirectoryPath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  if ([v2 count])
  {
    v3 = [v2 firstObject];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)routineCacheDirectoryPath
{
  uint64_t v2 = [a1 userCacheDirectoryPath];
  if (v2)
  {
    v3 = (void *)v2;
    uint64_t v4 = +[NSFileManager defaultsDomain];
    v5 = [v3 stringByAppendingPathComponent:v4];

    v6 = +[NSFileManager defaultManager];
    LOBYTE(v4) = [v6 fileExistsAtPath:v5];

    if ((v4 & 1) != 0
      || (+[NSFileManager defaultManager],
          v7 = objc_claimAutoreleasedReturnValue(),
          id v13 = 0,
          unsigned int v8 = [v7 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v13], v9 = v13, v7, v8)&& !v9)
    {
      v10 = sub_1000071D0(&qword_10002D358);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v5;
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "routine cache directory path, %@", buf, 0xCu);
      }
    }
    else
    {
      v11 = sub_1000071D0(&qword_10002D358);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v5;
        __int16 v16 = 2112;
        id v17 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "failed to create %@, error, %@", buf, 0x16u);
      }

      v10 = v5;
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)pathInCacheDirectory:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    uint64_t v4 = sub_1000071D0(&qword_10002D358);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136315394;
      v22 = "+[NSFileManager(RTExtensions) pathInCacheDirectory:]";
      __int16 v23 = 1024;
      int v24 = 160;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: path (in %s:%d)", (uint8_t *)&v21, 0x12u);
    }
  }
  v5 = +[NSFileManager routineCacheDirectoryPath];
  v6 = v5;
  if (v3)
  {
    if (v5)
    {
      v7 = [v5 stringByAppendingPathComponent:v3];
      unsigned int v8 = +[NSURL fileURLWithPath:v7];

      id v9 = [v8 standardizedURL];
      v10 = [v8 absoluteString];
      v11 = [v9 absoluteString];
      unsigned int v12 = [v10 isEqualToString:v11];

      if (v12)
      {
        id v13 = sub_1000071D0(&qword_10002D358);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v20 = [v9 path];
          int v21 = 138412290;
          v22 = v20;
          _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "path in cache directory, %@", (uint8_t *)&v21, 0xCu);
        }
        id v14 = [v9 path];
      }
      else
      {
        id v14 = 0;
      }
    }
    else
    {
      id v17 = sub_1000071D0(&qword_10002D358);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v21 = 136315394;
        v22 = "+[NSFileManager(RTExtensions) pathInCacheDirectory:]";
        __int16 v23 = 1024;
        int v24 = 172;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Cache path was nil (in %s:%d)", (uint8_t *)&v21, 0x12u);
      }

      v18 = sub_1000071D0(&qword_10002D358);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v21) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Cache path was nil", (uint8_t *)&v21, 2u);
      }

      id v14 = 0;
    }
  }
  else
  {
    if (!v5)
    {
      v15 = sub_1000071D0(&qword_10002D358);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v21 = 136315394;
        v22 = "+[NSFileManager(RTExtensions) pathInCacheDirectory:]";
        __int16 v23 = 1024;
        int v24 = 164;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Cache path was nil (in %s:%d)", (uint8_t *)&v21, 0x12u);
      }

      __int16 v16 = sub_1000071D0(&qword_10002D358);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v21) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Cache path was nil", (uint8_t *)&v21, 2u);
      }
    }
    id v14 = v6;
  }

  return v14;
}

+ (id)userLibraryPath
{
  uint64_t v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  if ([v2 count])
  {
    id v3 = [v2 firstObject];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (id)userPreferencesPath
{
  uint64_t v2 = [a1 userLibraryPath];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 stringByAppendingPathComponent:@"Preferences"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)routinePreferencesPath
{
  id v3 = [a1 userPreferencesPath];
  if (v3)
  {
    uint64_t v4 = [a1 defaultsDomain];
    v5 = [v3 stringByAppendingPathComponent:v4];
    v6 = [v5 stringByAppendingPathExtension:@"plist"];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)crashReporterPath
{
  uint64_t v2 = [a1 userLibraryPath];
  if (v2)
  {
    id v3 = [&off_100025A30 componentsJoinedByString:@"/"];
    uint64_t v4 = [v2 stringByAppendingPathComponent:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)sortedContentsOfDirectoryAtURL:(id)a3 withExtension:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = +[NSFileManager defaultManager];
  id v15 = 0;
  id v9 = [v8 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:0 options:3 error:&v15];
  id v10 = v15;

  if (v10)
  {
    v11 = sub_1000071D0(&qword_10002D358);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "encountered error getting contents of directory, %@, error, %@", buf, 0x16u);
    }
    unsigned int v12 = 0;
  }
  else
  {
    v11 = +[NSPredicate predicateWithFormat:@"%K = %@", @"pathExtension", v7];
    uint64_t v13 = [v9 filteredArrayUsingPredicate:v11];

    unsigned int v12 = [a1 sortFilesByName:v13];
    id v9 = (void *)v13;
  }

  return v12;
}

+ (id)sortFilesByName:(id)a3
{
  return [a3 sortedArrayUsingComparator:&stru_1000246C0];
}

@end