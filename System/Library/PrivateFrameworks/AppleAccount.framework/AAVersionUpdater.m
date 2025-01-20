@interface AAVersionUpdater
- (AAVersionUpdater)initWithStartingVersion:(unint64_t)a3;
- (BOOL)needsUpdate;
- (id)_latestVersion;
- (unint64_t)currentVersion;
- (void)_performVersionUpdate:(unint64_t)a3;
- (void)performMigrations;
- (void)setCurrentVersion:(unint64_t)a3;
@end

@implementation AAVersionUpdater

- (AAVersionUpdater)initWithStartingVersion:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AAVersionUpdater;
  result = [(AAVersionUpdater *)&v5 init];
  if (result) {
    result->_currentVersion = a3;
  }
  return result;
}

- (void)performMigrations
{
  id v10 = [(id)objc_opt_class() orderedVersions];
  v3 = [(id)objc_opt_class() orderedVersions];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      v6 = [v10 objectAtIndexedSubscript:v5];
      unsigned int v7 = [v6 unsignedIntValue];

      if (self->_currentVersion < v7)
      {
        [(AAVersionUpdater *)self _performVersionUpdate:v7];
        self->_currentVersion = v7;
      }
      ++v5;
      v8 = [(id)objc_opt_class() orderedVersions];
      unint64_t v9 = [v8 count];
    }
    while (v9 > v5);
  }
}

- (void)_performVersionUpdate:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t currentVersion = self->_currentVersion;
    *(_DWORD *)buf = 136315650;
    v17 = "-[AAVersionUpdater _performVersionUpdate:]";
    __int16 v18 = 2048;
    unint64_t v19 = currentVersion;
    __int16 v20 = 2048;
    unint64_t v21 = a3;
    _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "%s Performing data migration from version %lu to : %lu", buf, 0x20u);
  }

  objc_msgSend(NSString, "stringWithFormat:", @"performVersionUpdate%ldToVersion%ld", self->_currentVersion, a3);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  SEL v9 = NSSelectorFromString(v8);

  id v10 = [(AAVersionUpdater *)self methodSignatureForSelector:v9];
  if ([v10 methodReturnLength] != 1)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"AAVersionUpdater.m", 47, @"%@ method signature has invalid return length", v10 object file lineNumber description];
  }
  v11 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v10];
  [v11 setSelector:v9];
  [v11 invokeWithTarget:self];
  unsigned __int8 v15 = 0;
  [v11 getReturnValue:&v15];
  v12 = _AALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v13 = self->_currentVersion;
    *(_DWORD *)buf = 136315906;
    v17 = "-[AAVersionUpdater _performVersionUpdate:]";
    __int16 v18 = 2048;
    unint64_t v19 = v13;
    __int16 v20 = 2048;
    unint64_t v21 = a3;
    __int16 v22 = 2048;
    uint64_t v23 = v15;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "%s Performed update of version %lu to %lu with success %lu", buf, 0x2Au);
  }
}

- (BOOL)needsUpdate
{
  unint64_t currentVersion = self->_currentVersion;
  v3 = [(AAVersionUpdater *)self _latestVersion];
  LOBYTE(currentVersion) = currentVersion < [v3 unsignedIntValue];

  return currentVersion;
}

- (id)_latestVersion
{
  v2 = [(id)objc_opt_class() orderedVersions];
  v3 = [v2 lastObject];

  return v3;
}

- (unint64_t)currentVersion
{
  return self->_currentVersion;
}

- (void)setCurrentVersion:(unint64_t)a3
{
  self->_unint64_t currentVersion = a3;
}

@end