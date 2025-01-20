@interface CPLEngineStorage
+ (id)platformImplementationProtocol;
- (BOOL)_checkSuperWasCalled;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)isAlive;
- (BOOL)isEmpty;
- (BOOL)openWithError:(id *)a3;
- (BOOL)performMaintenanceWithError:(id *)a3;
- (BOOL)shouldBeCreatedDynamically;
- (BOOL)shouldIncludeInStatus;
- (BOOL)testKey:(id)a3 value:(id)a4 didHandle:(BOOL *)a5 result:(id *)a6 error:(id *)a7;
- (CPLEngineStorage)initWithEngineStore:(id)a3 name:(id)a4;
- (CPLEngineStore)engineStore;
- (CPLPlatformObject)platformObject;
- (NSString)description;
- (NSString)mainScopeIdentifier;
- (NSString)name;
- (id)redactedDescription;
- (id)status;
- (id)statusDictionary;
- (id)statusPerScopeIndex;
- (unint64_t)scopeType;
- (void)transactionDidFinish;
- (void)writeTransactionDidFail;
- (void)writeTransactionDidSucceed;
@end

@implementation CPLEngineStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_engineStore, 0);
  objc_storeStrong((id *)&self->_platformObject, 0);
}

- (NSString)name
{
  return self->_name;
}

- (CPLEngineStore)engineStore
{
  return self->_engineStore;
}

- (BOOL)shouldBeCreatedDynamically
{
  return self->_shouldBeCreatedDynamically;
}

- (CPLPlatformObject)platformObject
{
  return self->_platformObject;
}

- (BOOL)testKey:(id)a3 value:(id)a4 didHandle:(BOOL *)a5 result:(id *)a6 error:(id *)a7
{
  *a5 = 0;
  return 1;
}

- (BOOL)_checkSuperWasCalled
{
  if (self->_superWasCalled)
  {
    v3 = [(CPLEngineStorage *)self platformObject];
    char v4 = [v3 _checkSuperWasCalled];
  }
  else
  {
    char v4 = 0;
  }
  self->_superWasCalled = 0;
  return v4;
}

- (id)statusDictionary
{
  v3 = [(CPLEngineStorage *)self platformObject];
  int v4 = [v3 shouldIncludeInStatus];

  if (v4)
  {
    v5 = [(CPLEngineStorage *)self platformObject];
    v6 = [v5 statusDictionary];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)status
{
  v3 = [(CPLEngineStorage *)self platformObject];
  int v4 = [v3 shouldIncludeInStatus];

  if (v4)
  {
    v5 = [(CPLEngineStorage *)self platformObject];
    v6 = [v5 status];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)shouldIncludeInStatus
{
  v2 = [(CPLEngineStorage *)self platformObject];
  char v3 = [v2 shouldIncludeInStatus];

  return v3;
}

- (BOOL)isAlive
{
  if (![(CPLEngineStorage *)self shouldBeCreatedDynamically]) {
    return 1;
  }
  char v3 = [(CPLEngineStorage *)self platformObject];
  char v4 = [v3 isAlive];

  return v4;
}

- (BOOL)isEmpty
{
  v2 = [(CPLEngineStorage *)self platformObject];
  char v3 = [v2 isEmpty];

  return v3;
}

- (void)transactionDidFinish
{
  self->_superWasCalled = 1;
  id v2 = [(CPLEngineStorage *)self platformObject];
  [v2 transactionDidFinish];
}

- (void)writeTransactionDidSucceed
{
  self->_superWasCalled = 1;
  id v2 = [(CPLEngineStorage *)self platformObject];
  [v2 writeTransactionDidSucceed];
}

- (void)writeTransactionDidFail
{
  self->_superWasCalled = 1;
  id v2 = [(CPLEngineStorage *)self platformObject];
  [v2 writeTransactionDidFail];
}

- (id)statusPerScopeIndex
{
  char v3 = [(CPLEngineStorage *)self platformObject];
  int v4 = [v3 shouldIncludeInStatus];

  if (v4)
  {
    v5 = [(CPLEngineStorage *)self platformObject];
    v6 = [v5 statusPerScopeIndex];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStorage.m"];
  uint64_t v10 = objc_opt_class();
  v11 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, v9, 83, @"-[%@ %@] should be implemented by subclasses", v10, v11 object file lineNumber description];

  abort();
}

- (unint64_t)scopeType
{
  int v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStorage.m"];
  uint64_t v6 = objc_opt_class();
  v7 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, v5, 78, @"-[%@ %@] should be implemented by subclasses", v6, v7 object file lineNumber description];

  abort();
}

- (BOOL)performMaintenanceWithError:(id *)a3
{
  return 1;
}

- (BOOL)closeWithError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    v5 = __CPLStorageOSLogDomain_20673();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 138412290;
      v16 = self;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Closing %@", (uint8_t *)&v15, 0xCu);
    }
  }
  self->_superWasCalled = 1;
  uint64_t v6 = [(CPLEngineStorage *)self platformObject];
  char v7 = [v6 closeWithError:a3];

  if (v7)
  {
    if (!_CPLSilentLogging)
    {
      v8 = __CPLStorageOSLogDomain_20673();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 138412290;
        v16 = self;
        v9 = "%@ closed";
        uint64_t v10 = v8;
        os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
        uint32_t v12 = 12;
LABEL_12:
        _os_log_impl(&dword_1B4CAC000, v10, v11, v9, (uint8_t *)&v15, v12);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else if (!_CPLSilentLogging)
  {
    v8 = __CPLStorageOSLogDomain_20673();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v13 = *a3;
      int v15 = 138412546;
      v16 = self;
      __int16 v17 = 2112;
      id v18 = v13;
      v9 = "Closing %@ failed with error: %@";
      uint64_t v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
      goto LABEL_12;
    }
LABEL_13:
  }
  return v7;
}

- (BOOL)openWithError:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!_CPLSilentLogging)
  {
    v5 = __CPLStorageOSLogDomain_20673();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 138412290;
      v16 = self;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Opening %@", (uint8_t *)&v15, 0xCu);
    }
  }
  self->_superWasCalled = 1;
  uint64_t v6 = [(CPLEngineStorage *)self platformObject];
  char v7 = [v6 openWithError:a3];

  if (v7)
  {
    if (!_CPLSilentLogging)
    {
      v8 = __CPLStorageOSLogDomain_20673();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v15) = 0;
        v9 = "Opened";
        uint64_t v10 = v8;
        os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
        uint32_t v12 = 2;
LABEL_12:
        _os_log_impl(&dword_1B4CAC000, v10, v11, v9, (uint8_t *)&v15, v12);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else if (!_CPLSilentLogging)
  {
    v8 = __CPLStorageOSLogDomain_20673();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v13 = (CPLEngineStorage *)*a3;
      int v15 = 138412290;
      v16 = v13;
      v9 = "Opening failed with error: %@";
      uint64_t v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 12;
      goto LABEL_12;
    }
LABEL_13:
  }
  return v7;
}

- (id)redactedDescription
{
  return (id)[NSString stringWithFormat:@"[%@ %@]", objc_opt_class(), self->_name];
}

- (NSString)description
{
  char v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CPLEngineStorage *)self engineStore];
  uint64_t v6 = [v5 engineLibrary];
  char v7 = [v6 libraryIdentifier];
  v8 = [v3 stringWithFormat:@"[%@ %@ %@]", v4, v7, self->_name];

  return (NSString *)v8;
}

- (NSString)mainScopeIdentifier
{
  return [(CPLEngineStore *)self->_engineStore mainScopeIdentifier];
}

- (CPLEngineStorage)initWithEngineStore:(id)a3 name:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CPLEngineStorage;
  uint64_t v10 = [(CPLEngineStorage *)&v23 init];
  os_log_type_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_engineStore, a3);
    uint64_t v12 = [v9 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    [(CPLEngineStore *)v11->_engineStore registerStorage:v11];
    v14 = +[CPLPlatform currentPlatform];
    uint64_t v15 = [v14 newPlatformImplementationForObject:v11];
    platformObject = v11->_platformObject;
    v11->_platformObject = (CPLPlatformObject *)v15;

    if (!v11->_platformObject)
    {
      if (!_CPLSilentLogging)
      {
        id v18 = __CPLStorageOSLogDomain_20673();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v25 = v19;
          id v20 = v19;
          _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_ERROR, "No platform object specified for %@", buf, 0xCu);
        }
      }
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStorage.m"];
      [v21 handleFailureInMethod:a2, v11, v22, 32, @"No platform object specified for %@", objc_opt_class() object file lineNumber description];

      abort();
    }
  }

  return v11;
}

+ (id)platformImplementationProtocol
{
  id v2 = [(id)objc_opt_class() description];
  char v3 = [v2 stringByAppendingString:@"Implementation"];
  uint64_t v4 = NSProtocolFromString(v3);

  return v4;
}

@end