@interface APSigningContextStorage
+ (APUnfairRecursiveLock)lock;
+ (BOOL)_isContextAssigned:(void *)a3;
+ (NSMutableArray)assignedContexts;
+ (NSMutableDictionary)contextDictionaries;
+ (NSString)launchID;
+ (id)_contextsForPool:(id)a3;
+ (id)_retrieveStashedContextsForPool:(id)a3 includeAssigned:(BOOL)a4;
+ (id)bundleIdentifier;
+ (id)reconstructFromStorage:(id)a3 contextRef:(id)a4;
+ (id)retrieveAvailableStashedContextsForPool:(id)a3;
+ (id)retrieveStashedContextsForPool:(id)a3;
+ (void)_setContextsForPool:(id)a3 contexts:(id)a4;
+ (void)destroyAndClearAllContextsForPool:(id)a3;
+ (void)destroyAndClearAllPreviousLaunchContexts;
+ (void)destroyAndClearAllPreviousLaunchContextsForPool:(id)a3;
+ (void)removeContextForPool:(id)a3 contextIdentifier:(void *)a4;
+ (void)setContextDictionaries:(id)a3;
+ (void)setLaunchID:(id)a3;
- (APSigningContextStorage)initWithContextRef:(void *)a3 poolName:(id)a4 stashed:(BOOL)a5;
- (BOOL)stashed;
- (BOOL)used;
- (NSArray)propertyArray;
- (NSString)poolName;
- (NSString)sessionIdentifier;
- (void)assign;
- (void)contextRef;
- (void)save;
- (void)setContextRef:(void *)a3;
- (void)setPoolName:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setStashed:(BOOL)a3;
- (void)setUsed:(BOOL)a3;
- (void)stashed:(BOOL)a3;
@end

@implementation APSigningContextStorage

+ (id)bundleIdentifier
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];

  return v3;
}

+ (APUnfairRecursiveLock)lock
{
  if (qword_1EB7898E0 != -1) {
    dispatch_once(&qword_1EB7898E0, &unk_1F2E9CD90);
  }
  v2 = (void *)qword_1EB7898D8;
  return (APUnfairRecursiveLock *)v2;
}

+ (NSMutableDictionary)contextDictionaries
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = +[APSigningContextStorage lock];
  [v2 lock];

  v3 = [[APStorageManager alloc] initWithPathPrefix:@"fpdi"];
  v4 = +[APSigningContextStorage bundleIdentifier];
  v5 = [(APStorageManager *)v3 fileForReadingAtKeyPath:v4 error:0];

  v6 = [v5 nextObject];
  if (!v6)
  {
    v11 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1D70B2000, v11, OS_LOG_TYPE_INFO, "No stored pools found.", (uint8_t *)&v17, 2u);
    }

    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
    goto LABEL_9;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v8 = APLogForCategory(0x2BuLL);
  v9 = v8;
  if (isKindOfClass)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v17 = 134218242;
      ClassName = (const char *)[0 count];
      __int16 v19 = 2112;
      uint64_t v20 = 0;
      _os_log_impl(&dword_1D70B2000, v9, OS_LOG_TYPE_INFO, "Found %lu stored pools: %@", (uint8_t *)&v17, 0x16u);
    }

    id v10 = v6;
LABEL_9:
    v12 = v10;
    v13 = +[APSigningContextStorage lock];
    [v13 unlock];

    id v14 = v12;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v17 = 136315138;
    ClassName = object_getClassName(v6);
    _os_log_impl(&dword_1D70B2000, v9, OS_LOG_TYPE_ERROR, "Storage file object of wrong type: %s", (uint8_t *)&v17, 0xCu);
  }

  v15 = +[APSigningContextStorage lock];
  [v15 unlock];

  id v14 = 0;
LABEL_13:

  return (NSMutableDictionary *)v14;
}

+ (void)setContextDictionaries:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[APSigningContextStorage lock];
  [v4 lock];

  v5 = [[APStorageManager alloc] initWithPathPrefix:@"fpdi"];
  v6 = +[APSigningContextStorage bundleIdentifier];
  if (v3)
  {
    id v14 = 0;
    v7 = [(APStorageManager *)v5 fileForWritingAtKeyPath:v6 error:&v14];
    id v8 = v14;

    v9 = APLogForCategory(0x2BuLL);
    id v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v8;
        _os_log_impl(&dword_1D70B2000, v10, OS_LOG_TYPE_ERROR, "Error retrieving storage file: %@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v3;
        _os_log_impl(&dword_1D70B2000, v10, OS_LOG_TYPE_INFO, "Writing pools %@", buf, 0xCu);
      }

      id v13 = 0;
      [v7 addObject:v3 error:&v13];
      id v8 = v13;
    }
LABEL_12:

    goto LABEL_13;
  }
  id v12 = 0;
  [(APStorageManager *)v5 removeObjectAtPath:v6 error:&v12];
  id v8 = v12;

  if (v8)
  {
    v7 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_impl(&dword_1D70B2000, v7, OS_LOG_TYPE_ERROR, "Error deleting storage file: %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
LABEL_13:
  v11 = +[APSigningContextStorage lock];
  [v11 unlock];
}

+ (id)_contextsForPool:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[APSigningContextStorage contextDictionaries];
  v5 = [v4 objectForKeyedSubscript:v3];

  if (!v5)
  {
    v6 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1D70B2000, v6, OS_LOG_TYPE_INFO, "No context dictionary for pool %@", (uint8_t *)&v8, 0xCu);
    }
  }
  return v5;
}

+ (void)_setContextsForPool:(id)a3 contexts:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[APSigningContextStorage lock];
  [v7 lock];

  id v9 = +[APSigningContextStorage contextDictionaries];
  [v9 setObject:v5 forKeyedSubscript:v6];

  +[APSigningContextStorage setContextDictionaries:v9];
  int v8 = +[APSigningContextStorage lock];
  [v8 unlock];
}

+ (void)removeContextForPool:(id)a3 contextIdentifier:(void *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v12 = a4;
  id v6 = +[APSigningContextStorage _contextsForPool:v5];
  if (v6)
  {
    v7 = +[APSigningContextStorage lock];
    [v7 lock];

    int v8 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      id v14 = a4;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_1D70B2000, v8, OS_LOG_TYPE_INFO, "Removing context %p from pool %@", buf, 0x16u);
    }

    id v9 = [NSNumber numberWithUnsignedLongLong:a4];
    [v6 removeObjectForKey:v9];

    if (+[APFPDIWrapper FPDIDestroyContext:&v12])
    {
      uint64_t v10 = APLogForCategory(0x2BuLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        id v14 = v12;
        _os_log_impl(&dword_1D70B2000, v10, OS_LOG_TYPE_ERROR, "Unable to destroy FPDI context %p.", buf, 0xCu);
      }
    }
    +[APSigningContextStorage _setContextsForPool:v5 contexts:v6];
    v11 = +[APSigningContextStorage lock];
    [v11 unlock];
  }
  else
  {
    v11 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_1D70B2000, v11, OS_LOG_TYPE_ERROR, "Unable to find context dictionary for pool %@", buf, 0xCu);
    }
  }
}

+ (id)_retrieveStashedContextsForPool:(id)a3 includeAssigned:(BOOL)a4
{
  id v5 = a3;
  id v6 = +[APSigningContextStorage lock];
  [v6 lock];

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_1D70E4810;
  uint64_t v17 = sub_1D70E4820;
  id v18 = [MEMORY[0x1E4F1CA48] array];
  v7 = +[APSigningContextStorage _contextsForPool:v5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1D70E4828;
  v11[3] = &unk_1E6A6BDA8;
  BOOL v12 = a4;
  v11[4] = &v13;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];
  int v8 = +[APSigningContextStorage lock];
  [v8 unlock];

  id v9 = (void *)[(id)v14[5] copy];
  _Block_object_dispose(&v13, 8);

  return v9;
}

+ (id)retrieveAvailableStashedContextsForPool:(id)a3
{
  return (id)MEMORY[0x1F4181798](a1, sel__retrieveStashedContextsForPool_includeAssigned_);
}

+ (id)retrieveStashedContextsForPool:(id)a3
{
  return (id)MEMORY[0x1F4181798](a1, sel__retrieveStashedContextsForPool_includeAssigned_);
}

+ (void)destroyAndClearAllContextsForPool:(id)a3
{
  id v3 = a3;
  v4 = +[APSigningContextStorage _contextsForPool:v3];
  id v5 = +[APSigningContextStorage lock];
  [v5 lock];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D70E4A24;
  v8[3] = &unk_1E6A6BDD0;
  id v9 = v3;
  id v6 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
  [v4 removeAllObjects];
  +[APSigningContextStorage _setContextsForPool:v6 contexts:v4];
  v7 = +[APSigningContextStorage lock];
  [v7 unlock];
}

+ (void)destroyAndClearAllPreviousLaunchContextsForPool:(id)a3
{
  id v3 = a3;
  v4 = +[APSigningContextStorage lock];
  [v4 lock];

  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = +[APSigningContextStorage contextDictionaries];
  v7 = [v6 objectForKeyedSubscript:v3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1D70E4C4C;
  v10[3] = &unk_1E6A6BDF8;
  id v11 = v5;
  id v8 = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];

  +[APSigningContextStorage _setContextsForPool:v3 contexts:v8];
  id v9 = +[APSigningContextStorage lock];
  [v9 unlock];
}

+ (void)destroyAndClearAllPreviousLaunchContexts
{
  v2 = +[APSigningContextStorage lock];
  [v2 lock];

  id v3 = +[APSigningContextStorage contextDictionaries];
  id v5 = (id)[v3 copy];

  [v5 enumerateKeysAndObjectsUsingBlock:&unk_1F2E9CE30];
  v4 = +[APSigningContextStorage lock];
  [v4 unlock];
}

+ (NSMutableArray)assignedContexts
{
  if (qword_1EB7897A0 != -1) {
    dispatch_once(&qword_1EB7897A0, &unk_1F2E9CE50);
  }
  v2 = (void *)qword_1EB789880;
  return (NSMutableArray *)v2;
}

+ (BOOL)_isContextAssigned:(void *)a3
{
  v4 = +[APSigningContextStorage lock];
  [v4 lock];

  id v5 = +[APSigningContextStorage assignedContexts];
  id v6 = [NSNumber numberWithUnsignedLongLong:a3];
  char v7 = [v5 containsObject:v6];

  id v8 = +[APSigningContextStorage lock];
  [v8 unlock];

  return v7;
}

+ (NSString)launchID
{
  v2 = (void *)qword_1EB7898A8;
  if (!qword_1EB7898A8)
  {
    id v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    id v5 = (void *)qword_1EB7898A8;
    qword_1EB7898A8 = v4;

    v2 = (void *)qword_1EB7898A8;
  }
  return (NSString *)v2;
}

+ (void)setLaunchID:(id)a3
{
}

- (NSArray)propertyArray
{
  id v3 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v4 = [(APSigningContextStorage *)self sessionIdentifier];
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[APSigningContextStorage stashed](self, "stashed"));
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[APSigningContextStorage used](self, "used"));
  char v7 = [(APSigningContextStorage *)self poolName];
  id v8 = objc_msgSend(v3, "arrayWithObjects:", v4, v5, v6, v7, 0);

  return (NSArray *)v8;
}

- (void)save
{
  id v3 = +[APSigningContextStorage lock];
  [v3 lock];

  uint64_t v4 = [(APSigningContextStorage *)self poolName];
  id v9 = +[APSigningContextStorage _contextsForPool:v4];

  if (!v9)
  {
    id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v5 = [(APSigningContextStorage *)self propertyArray];
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[APSigningContextStorage contextRef](self, "contextRef"));
  [v9 setObject:v5 forKey:v6];

  char v7 = [(APSigningContextStorage *)self poolName];
  +[APSigningContextStorage _setContextsForPool:v7 contexts:v9];

  id v8 = +[APSigningContextStorage lock];
  [v8 unlock];
}

- (APSigningContextStorage)initWithContextRef:(void *)a3 poolName:(id)a4 stashed:(BOOL)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)APSigningContextStorage;
  uint64_t v10 = [(APSigningContextStorage *)&v17 init];
  id v11 = v10;
  if (v10)
  {
    v10->_contextRef = a3;
    v10->_stashed = a5;
    uint64_t v12 = +[APSigningContextStorage launchID];
    sessionIdentifier = v11->_sessionIdentifier;
    v11->_sessionIdentifier = (NSString *)v12;

    v11->_used = 1;
    objc_storeStrong((id *)&v11->_poolName, a4);
    [(APSigningContextStorage *)v11 save];
    [(APSigningContextStorage *)v11 assign];
    id v14 = APLogForCategory(0x2BuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = [(APSigningContextStorage *)v11 contextRef];
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = v15;
      _os_log_impl(&dword_1D70B2000, v14, OS_LOG_TYPE_INFO, "Created signing context with reference %p", buf, 0xCu);
    }
  }
  return v11;
}

+ (id)reconstructFromStorage:(id)a3 contextRef:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  char v7 = objc_alloc_init(APSigningContextStorage);
  uint64_t v8 = [v5 longLongValue];

  v7->_contextRef = (void *)v8;
  id v9 = [v6 objectAtIndexedSubscript:1];
  v7->_stashed = [v9 BOOLValue];

  uint64_t v10 = [v6 objectAtIndexedSubscript:0];
  sessionIdentifier = v7->_sessionIdentifier;
  v7->_sessionIdentifier = (NSString *)v10;

  uint64_t v12 = [v6 objectAtIndexedSubscript:2];
  v7->_used = [v12 BOOLValue];

  uint64_t v13 = [v6 objectAtIndexedSubscript:3];

  poolName = v7->_poolName;
  v7->_poolName = (NSString *)v13;

  return v7;
}

- (void)contextRef
{
  return self->_contextRef;
}

- (void)setContextRef:(void *)a3
{
  self->_contextRef = a3;
  [(APSigningContextStorage *)self save];
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (BOOL)stashed
{
  return self->_stashed;
}

- (void)stashed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(APSigningContextStorage *)self contextRef];
    BOOL v7 = [(APSigningContextStorage *)self stashed];
    uint64_t v8 = @"no";
    if (v7) {
      id v9 = @"yes";
    }
    else {
      id v9 = @"no";
    }
    int v10 = 134218498;
    id v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    if (v3) {
      uint64_t v8 = @"yes";
    }
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1D70B2000, v5, OS_LOG_TYPE_INFO, "Change stashed state of context ref %p from %@ to %@", (uint8_t *)&v10, 0x20u);
  }

  self->_stashed = v3;
  [(APSigningContextStorage *)self save];
}

- (BOOL)used
{
  return self->_used;
}

- (void)setUsed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(APSigningContextStorage *)self contextRef];
    BOOL v7 = objc_msgSend(NSNumber, "numberWithBool:", -[APSigningContextStorage used](self, "used"));
    uint64_t v8 = [NSNumber numberWithBool:v3];
    int v9 = 134218498;
    int v10 = v6;
    __int16 v11 = 2112;
    __int16 v12 = v7;
    __int16 v13 = 2112;
    __int16 v14 = v8;
    _os_log_impl(&dword_1D70B2000, v5, OS_LOG_TYPE_INFO, "Change used state of context ref %p from %@ to %@", (uint8_t *)&v9, 0x20u);
  }
  self->_used = v3;
  [(APSigningContextStorage *)self save];
}

- (NSString)poolName
{
  return self->_poolName;
}

- (void)setPoolName:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NSString *)a3;
  id v5 = APLogForCategory(0x2BuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(APSigningContextStorage *)self contextRef];
    BOOL v7 = [(APSigningContextStorage *)self poolName];
    int v9 = 134218498;
    int v10 = v6;
    __int16 v11 = 2112;
    __int16 v12 = v7;
    __int16 v13 = 2112;
    __int16 v14 = v4;
    _os_log_impl(&dword_1D70B2000, v5, OS_LOG_TYPE_INFO, "Change poolName of context ref %p from %@ to %@", (uint8_t *)&v9, 0x20u);
  }
  poolName = self->_poolName;
  self->_poolName = v4;

  [(APSigningContextStorage *)self save];
}

- (void)assign
{
  BOOL v3 = +[APSigningContextStorage lock];
  [v3 lock];

  if (!+[APSigningContextStorage _isContextAssigned:[(APSigningContextStorage *)self contextRef]])
  {
    uint64_t v4 = +[APSigningContextStorage assignedContexts];
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[APSigningContextStorage contextRef](self, "contextRef"));
    [v4 addObject:v5];
  }
  id v6 = +[APSigningContextStorage lock];
  [v6 unlock];
}

- (void)setStashed:(BOOL)a3
{
  self->_stashed = a3;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poolName, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end