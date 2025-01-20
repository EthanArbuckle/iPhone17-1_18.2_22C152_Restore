@interface CallDBMetaInfo
- (BOOL)validateInfo:(BOOL)a3;
- (CallDBMetaInfo)initWithURL:(id)a3;
- (NSURL)dbInfoPrefFile;
- (int64_t)readDatabaseVersion:(BOOL)a3;
- (void)setDbInfoPrefFile:(id)a3;
- (void)writeDatabaseVersion:(int64_t)a3 isTemp:(BOOL)a4;
@end

@implementation CallDBMetaInfo

- (void).cxx_destruct
{
}

- (int64_t)readDatabaseVersion:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  v5 = [(CallDBMetaInfo *)self dbInfoPrefFile];
  v6 = [v4 dictionaryWithContentsOfURL:v5];

  if (v6)
  {
    if (v3) {
      v7 = @"DatabaseVersionTemp";
    }
    else {
      v7 = @"DatabaseVersionPerm";
    }
    v8 = [v6 objectForKey:v7];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      int64_t v9 = [v8 integerValue];
    }
    else {
      int64_t v9 = 0;
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (NSURL)dbInfoPrefFile
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (CallDBMetaInfo)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CallDBMetaInfo;
  v5 = [(CallDBMetaInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 URLByAppendingPathComponent:@"com.apple.callhistory.databaseInfo.plist"];
    dbInfoPrefFile = v5->_dbInfoPrefFile;
    v5->_dbInfoPrefFile = (NSURL *)v6;
  }
  return v5;
}

- (void)writeDatabaseVersion:(int64_t)a3 isTemp:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (void *)MEMORY[0x1E4F1C9E8];
  v8 = [(CallDBMetaInfo *)self dbInfoPrefFile];
  objc_super v9 = [v7 dictionaryWithContentsOfURL:v8];
  id v10 = (id)[v9 mutableCopy];

  if (!v10) {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v11 = [NSNumber numberWithInteger:a3];
  if (v4) {
    v12 = @"DatabaseVersionTemp";
  }
  else {
    v12 = @"DatabaseVersionPerm";
  }
  [v10 setObject:v11 forKey:v12];
  v13 = [(CallDBMetaInfo *)self dbInfoPrefFile];
  char v14 = [v10 writeToURL:v13 atomically:1];

  if ((v14 & 1) == 0)
  {
    v15 = +[CHLogServer sharedInstance];
    v16 = [v15 logHandleForDomain:"CHDBMetaInfoDomain"];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CallDBMetaInfo writeDatabaseVersion:isTemp:](v16);
    }
  }
}

- (BOOL)validateInfo:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  p_dbInfoPrefFile = (uint64_t *)&self->_dbInfoPrefFile;
  v7 = [(NSURL *)self->_dbInfoPrefFile path];
  char v8 = [v5 isReadableFileAtPath:v7];

  if (v8) {
    return [(CallDBMetaInfo *)self readDatabaseVersion:v3] == 37;
  }
  id v10 = +[CHLogServer sharedInstance];
  v11 = [v10 logHandleForDomain:"ch.calldbm"];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CallDBMetaInfo validateInfo:](p_dbInfoPrefFile, v11);
  }

  return 0;
}

- (void)setDbInfoPrefFile:(id)a3
{
}

- (void)writeDatabaseVersion:(os_log_t)log isTemp:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  v2 = @"com.apple.callhistory.databaseInfo.plist";
  _os_log_error_impl(&dword_1B8E4A000, log, OS_LOG_TYPE_ERROR, "Failed to synchronize preference domain: %{public}@", (uint8_t *)&v1, 0xCu);
}

- (void)validateInfo:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1B8E4A000, a2, OS_LOG_TYPE_ERROR, "File at path: %{public}@ is not readable", (uint8_t *)&v3, 0xCu);
}

@end