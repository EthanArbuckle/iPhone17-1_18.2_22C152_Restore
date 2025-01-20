@interface APDatabasePath
+ (Class)instanceClass;
+ (id)_databaseBundleDirectory;
+ (id)lockForPath;
+ (id)pathForName:(id)a3;
+ (id)pathToNameDictionary;
+ (void)_clearCachedPaths;
+ (void)_setInstanceClass:(Class)a3;
- (APDatabasePath)initWithDatabaseName:(id)a3;
- (NSString)databaseName;
- (id)databaseDirectory;
- (id)databaseFilePath;
- (id)migrationScriptsPath;
@end

@implementation APDatabasePath

+ (id)pathForName:(id)a3
{
  id v4 = a3;
  v5 = +[APDatabasePath lockForPath];
  [v5 lock];
  v6 = [a1 pathToNameDictionary];
  v7 = [v6 objectForKey:v4];

  if (!v7)
  {
    v7 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "instanceClass")), "initWithDatabaseName:", v4);
    v8 = [a1 pathToNameDictionary];
    [v8 setObject:v7 forKey:v4];
  }
  [v5 unlock];

  return v7;
}

+ (id)pathToNameDictionary
{
  v2 = (void *)qword_1EB789878;
  if (!qword_1EB789878)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    id v4 = (void *)qword_1EB789878;
    qword_1EB789878 = v3;

    v2 = (void *)qword_1EB789878;
  }
  return v2;
}

+ (id)lockForPath
{
  if (qword_1EB7897A8 != -1) {
    dispatch_once(&qword_1EB7897A8, &unk_1F2E9CB90);
  }
  v2 = (void *)qword_1EB789888;
  return v2;
}

+ (Class)instanceClass
{
  v2 = (void *)qword_1EB789870;
  if (!qword_1EB789870)
  {
    v2 = objc_opt_class();
    qword_1EB789870 = (uint64_t)v2;
  }
  return (Class)v2;
}

+ (id)_databaseBundleDirectory
{
  v2 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  uint64_t v3 = [v2 lastObject];

  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v5 = [v4 bundleIdentifier];

  v6 = [v3 stringByAppendingPathComponent:v5];
  v7 = [v6 stringByAppendingPathComponent:@"APDB"];

  return v7;
}

- (APDatabasePath)initWithDatabaseName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APDatabasePath;
  v6 = [(APDatabasePath *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_databaseName, a3);
  }

  return v7;
}

- (id)databaseDirectory
{
  uint64_t v3 = +[APDatabasePath _databaseBundleDirectory];
  id v4 = [(APDatabasePath *)self databaseName];
  id v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

- (id)databaseFilePath
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(APDatabasePath *)self databaseDirectory];
  id v16 = 0;
  char v5 = [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v16];
  id v6 = v16;
  if (v5)
  {
    id v7 = [NSString alloc];
    v8 = [(APDatabasePath *)self databaseName];
    objc_super v9 = [v8 stringByAppendingPathExtension:@"sql3"];
    v10 = [v4 stringByAppendingPathComponent:v9];
    v11 = (void *)[v7 initWithString:v10];
  }
  else
  {
    v8 = APLogForCategory(0xBuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = [(APDatabasePath *)self databaseName];
      v13 = [v6 debugDescription];
      v14 = [v6 userInfo];
      *(_DWORD *)buf = 138543874;
      v18 = v12;
      __int16 v19 = 2114;
      v20 = v13;
      __int16 v21 = 2114;
      v22 = v14;
      _os_log_impl(&dword_1D70B2000, v8, OS_LOG_TYPE_ERROR, "Failed to create Database subdirectories for %{public}@, error: %{public}@, userInfo: %{public}@", buf, 0x20u);
    }
    v11 = 0;
  }

  return v11;
}

- (id)migrationScriptsPath
{
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.ap.APFoundation"];
  id v4 = v3;
  if (v3)
  {
    char v5 = [v3 pathForResource:@"DatabaseMigrationScritps" ofType:&stru_1F2EA2540];
    if (v5)
    {
      id v6 = [(APDatabasePath *)self databaseName];
      id v7 = [v5 stringByAppendingPathComponent:v6];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (void)_clearCachedPaths
{
  id v3 = +[APDatabasePath lockForPath];
  [v3 lock];
  v2 = (void *)qword_1EB789878;
  qword_1EB789878 = 0;

  [v3 unlock];
}

+ (void)_setInstanceClass:(Class)a3
{
  qword_1EB789870 = (uint64_t)a3;
}

- (NSString)databaseName
{
  return self->_databaseName;
}

- (void).cxx_destruct
{
}

@end