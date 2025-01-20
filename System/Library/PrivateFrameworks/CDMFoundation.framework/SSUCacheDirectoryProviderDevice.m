@interface SSUCacheDirectoryProviderDevice
+ (id)createDirectoryAttributes;
+ (id)getUserCacheDirectoriesList;
- (id)lookupOrCreateCacheDirectory:(id *)a3;
@end

@implementation SSUCacheDirectoryProviderDevice

+ (id)createDirectoryAttributes
{
  return 0;
}

+ (id)getUserCacheDirectoriesList
{
  return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
}

- (id)lookupOrCreateCacheDirectory:(id *)a3
{
  v40[2] = *MEMORY[0x263EF8340];
  v4 = [(id)objc_opt_class() getUserCacheDirectoriesList];
  if ([v4 count] == 1)
  {
    v5 = NSURL;
    v6 = [v4 objectAtIndexedSubscript:0];
    v7 = [v5 fileURLWithPath:v6 isDirectory:1];

    v8 = [v7 URLByAppendingPathComponent:@"ssu" isDirectory:1];
    char v30 = 0;
    v9 = [MEMORY[0x263F08850] defaultManager];
    v10 = [v8 path];
    int v11 = [v9 fileExistsAtPath:v10 isDirectory:&v30];

    if (v11) {
      BOOL v12 = v30 == 0;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12)
    {
      if (a3)
      {
        uint64_t v22 = *MEMORY[0x263F08338];
        v37[0] = *MEMORY[0x263F08320];
        v37[1] = v22;
        v38[0] = @"Could not lookup/create cache directory.";
        v23 = [NSString stringWithFormat:@"There is already a non-directory file at path: %@.", v8];
        v38[1] = v23;
        v24 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];

        *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"SSUCacheDirectoryProviderErrorDomain" code:1 userInfo:v24];
      }
    }
    else
    {
      if (v11)
      {
LABEL_11:
        id v18 = v8;
LABEL_21:

        goto LABEL_22;
      }
      v13 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[SSUCacheDirectoryProviderDevice lookupOrCreateCacheDirectory:]";
        __int16 v35 = 2112;
        v36 = v8;
        _os_log_debug_impl(&dword_2263A0000, v13, OS_LOG_TYPE_DEBUG, "%s SSU cache directory does not already exist. Creating it at path: %@", buf, 0x16u);
      }

      v14 = [MEMORY[0x263F08850] defaultManager];
      v15 = [(id)objc_opt_class() createDirectoryAttributes];
      id v29 = 0;
      char v16 = [v14 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:v15 error:&v29];
      id v17 = v29;

      if (v16)
      {

        goto LABEL_11;
      }
      if (a3)
      {
        uint64_t v25 = *MEMORY[0x263F08338];
        v31[0] = *MEMORY[0x263F08320];
        v31[1] = v25;
        v32[0] = @"Could not lookup/create cache directory.";
        v26 = [NSString stringWithFormat:@"Error creating directory at path: %@. Error: %@.", v8, v17];
        v32[1] = v26;
        v27 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];

        *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"SSUCacheDirectoryProviderErrorDomain" code:2 userInfo:v27];
      }
    }
    id v18 = 0;
    goto LABEL_21;
  }
  if (!a3)
  {
    id v18 = 0;
    goto LABEL_23;
  }
  uint64_t v19 = *MEMORY[0x263F08320];
  v40[0] = @"Could not lookup/create cache directory.";
  uint64_t v20 = *MEMORY[0x263F08338];
  v39[0] = v19;
  v39[1] = v20;
  v21 = [NSString stringWithFormat:@"Expected a unique user cache directory, but received: %@.", v4];
  v40[1] = v21;
  v7 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];

  [MEMORY[0x263F087E8] errorWithDomain:@"SSUCacheDirectoryProviderErrorDomain" code:0 userInfo:v7];
  id v18 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

LABEL_23:
  return v18;
}

@end