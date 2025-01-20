@interface ATXFileUtil
+ (BOOL)_shouldUpdateCache:(id)a3 withRefreshRate:(double)a4 currentTime:(double)a5;
+ (BOOL)cachesAreValidForBasePath:(id)a3 consumerSubTypes:(id)a4;
+ (BOOL)cachesAreValidForConsumerSubTypes:(id)a3;
+ (BOOL)shouldUpdateCache:(id)a3 withRefreshRate:(double)a4;
+ (double)cacheAgeForCache:(id)a3 withCurrentTime:(double)a4;
+ (double)cacheAgeForConsumerType:(unsigned __int8)a3;
+ (double)cacheAgeForConsumerType:(unsigned __int8)a3 basePath:(id)a4;
@end

@implementation ATXFileUtil

+ (BOOL)shouldUpdateCache:(id)a3 withRefreshRate:(double)a4
{
  id v5 = a3;
  BOOL v6 = +[ATXFileUtil _shouldUpdateCache:v5 withRefreshRate:a4 currentTime:CFAbsoluteTimeGetCurrent()];

  return v6;
}

+ (BOOL)_shouldUpdateCache:(id)a3 withRefreshRate:(double)a4 currentTime:(double)a5
{
  id v8 = a3;
  v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v10 = [v9 fileExistsAtPath:v8];

  if ((v10 & 1) == 0)
  {
    v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      +[ATXFileUtil _shouldUpdateCache:withRefreshRate:currentTime:].cold.6();
    }
    goto LABEL_7;
  }
  [a1 cacheAgeForCache:v8 withCurrentTime:a5];
  if (v11 > a4)
  {
    v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      +[ATXFileUtil _shouldUpdateCache:withRefreshRate:currentTime:]();
    }
LABEL_7:

    goto LABEL_8;
  }
  if (v11 < 0.0)
  {
    v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      +[ATXFileUtil _shouldUpdateCache:withRefreshRate:currentTime:]();
    }
    goto LABEL_7;
  }
  int v14 = open((const char *)[v8 UTF8String], 0);
  if (v14 < 0)
  {
    v16 = __atxlog_handle_default();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[ATXFileUtil _shouldUpdateCache:withRefreshRate:currentTime:]();
    }
  }
  else
  {
    int v15 = v14;
    ATXCacheFileRead();
    close(v15);
    v17 = __atxlog_handle_default();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[ATXFileUtil _shouldUpdateCache:withRefreshRate:currentTime:].cold.4();
    }
  }
LABEL_8:

  return 1;
}

+ (double)cacheAgeForConsumerType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v4 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
  id v5 = [v4 stringByAppendingPathComponent:@"caches/ATXCacheFile"];
  +[ATXFileUtil cacheAgeForConsumerType:v3 basePath:v5];
  double v7 = v6;

  return v7;
}

+ (double)cacheAgeForConsumerType:(unsigned __int8)a3 basePath:(id)a4
{
  uint64_t v4 = a3;
  double v6 = (void *)MEMORY[0x1E4F4AEE8];
  id v7 = a4;
  id v8 = [v6 sharedInstanceWithMobileAssets];
  v9 = [v8 getFullCachePathWithBaseCachePath:v7 consumerSubType:v4];

  [a1 cacheAgeForCache:v9 withCurrentTime:CFAbsoluteTimeGetCurrent()];
  double v11 = v10;

  return v11;
}

+ (double)cacheAgeForCache:(id)a3 withCurrentTime:(double)a4
{
  memset(&v9, 0, sizeof(v9));
  id v5 = a3;
  if (lstat((const char *)objc_msgSend(v5, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0), &v9))
  {
    double v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[ATXFileUtil cacheAgeForCache:withCurrentTime:]((uint64_t)v5, v6);
    }

    double v7 = 1.79769313e308;
  }
  else
  {
    double v7 = a4 - ((double)v9.st_mtimespec.tv_sec + (double)v9.st_mtimespec.tv_nsec * 0.000000001 - *MEMORY[0x1E4F1CF78]);
  }

  return v7;
}

+ (BOOL)cachesAreValidForConsumerSubTypes:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F4B650];
  id v4 = a3;
  id v5 = [v3 appPredictionDirectory];
  double v6 = [v5 stringByAppendingPathComponent:@"caches/ATXCacheFile"];
  BOOL v7 = +[ATXFileUtil cachesAreValidForBasePath:v6 consumerSubTypes:v4];

  return v7;
}

+ (BOOL)cachesAreValidForBasePath:(id)a3 consumerSubTypes:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        int v14 = [MEMORY[0x1E4F4AEE8] sharedInstanceWithMobileAssets];
        int v15 = objc_msgSend(v14, "getFullCachePathWithBaseCachePath:consumerSubType:", v5, objc_msgSend(v13, "unsignedCharValue"));

        [v7 addObject:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v10);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v7;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    while (2)
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * j);
        v22 = +[_ATXGlobals sharedInstance];
        [v22 defaultPredictionRefreshRate];
        LOBYTE(v21) = +[ATXFileUtil shouldUpdateCache:withRefreshRate:](ATXFileUtil, "shouldUpdateCache:withRefreshRate:", v21);

        if (v21)
        {
          BOOL v23 = 0;
          goto LABEL_18;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
  BOOL v23 = 1;
LABEL_18:

  return v23;
}

+ (void)_shouldUpdateCache:withRefreshRate:currentTime:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Prediction cache is old, update cache at path: %@", v2, v3, v4, v5, v6);
}

+ (void)_shouldUpdateCache:withRefreshRate:currentTime:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Prediction cache was created in the future, update cache at path: %@", v2, v3, v4, v5, v6);
}

+ (void)_shouldUpdateCache:withRefreshRate:currentTime:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Prediction cache file open failed at path: %@", v2, v3, v4, v5, v6);
}

+ (void)_shouldUpdateCache:withRefreshRate:currentTime:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Prediction cache file was empty at path: %@", v2, v3, v4, v5, v6);
}

+ (void)_shouldUpdateCache:withRefreshRate:currentTime:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Prediction cache file held invalid data (old magic number?) at path: %@", v2, v3, v4, v5, v6);
}

+ (void)_shouldUpdateCache:withRefreshRate:currentTime:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_3(&dword_1D0FA3000, v0, v1, "Prediction cache doesn't yet exist, update cache at path: %@", v2, v3, v4, v5, v6);
}

+ (void)cacheAgeForCache:(uint64_t)a1 withCurrentTime:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v4 = *__error();
  uint64_t v5 = __error();
  uint8_t v6 = strerror(*v5);
  int v7 = 138412802;
  uint64_t v8 = a1;
  __int16 v9 = 1024;
  int v10 = v4;
  __int16 v11 = 2080;
  v12 = v6;
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "Couldn't lstat %@: [%i] %s", (uint8_t *)&v7, 0x1Cu);
}

@end