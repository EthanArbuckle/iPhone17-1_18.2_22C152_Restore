@interface CPLChangeSession
+ (NSString)shortDescription;
+ (id)platformImplementationProtocol;
+ (id)stateDescriptionForState:(unint64_t)a3;
- (CPLChangeSession)init;
- (CPLChangeSession)initWithLibraryManager:(id)a3;
- (CPLLibraryManager)libraryManager;
- (CPLPlatformObject)platformObject;
- (NSProgress)sessionProgress;
- (NSString)description;
- (NSString)sessionIdentifier;
- (id)createSessionContext;
- (unint64_t)state;
- (void)beginSessionWithKnownLibraryVersion:(id)a3 resetTracker:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)finalizeWithCompletionHandler:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)tearDownWithCompletionHandler:(id)a3;
@end

@implementation CPLChangeSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryManager, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionProgress, 0);
  objc_storeStrong((id *)&self->_platformObject, 0);
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (CPLLibraryManager)libraryManager
{
  return self->_libraryManager;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSProgress)sessionProgress
{
  return self->_sessionProgress;
}

- (CPLPlatformObject)platformObject
{
  return self->_platformObject;
}

- (NSString)description
{
  id v2 = [NSString alloc];
  v3 = [(id)objc_opt_class() shortDescription];
  v4 = (void *)[v2 initWithFormat:@"[%@ session]", v3];

  return (NSString *)v4;
}

- (void)tearDownWithCompletionHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!_CPLSilentLogging)
  {
    v5 = __CPLSessionOSLogDomain_21938();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v11 = self;
      _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_DEBUG, "Tearing down %@", buf, 0xCu);
    }
  }
  v6 = [(CPLChangeSession *)self platformObject];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__CPLChangeSession_tearDownWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E60A5EE8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 tearDownWithCompletionHandler:v8];
}

uint64_t __50__CPLChangeSession_tearDownWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:6];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)finalizeWithCompletionHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, void *))a3;
  if (!_CPLSilentLogging)
  {
    v6 = __CPLSessionOSLogDomain_21938();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      id v7 = (CPLChangeSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
    }
  }
  if ([(CPLChangeSession *)self state] == 6)
  {
    if (!_CPLSilentLogging)
    {
      v8 = __CPLSessionOSLogDomain_21938();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", -[CPLChangeSession state](self, "state"));
        id v9 = (CPLChangeSession *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v16 = v9;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Trying to begin a session that has already been finalized (state: %@)", buf, 0xCu);
      }
    }
    v10 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to begin a session that has already been finalized"];
    v5[2](v5, v10);
  }
  else
  {
    if ([(CPLChangeSession *)self state] == 1) {
      [(CPLChangeSession *)self setState:5];
    }
    if (!_CPLSilentLogging)
    {
      v11 = __CPLSessionOSLogDomain_21938();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v16 = self;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_DEBUG, "%@ finalizing", buf, 0xCu);
      }
    }
    uint64_t v12 = [(CPLChangeSession *)self platformObject];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__CPLChangeSession_finalizeWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E60A6AB0;
    v13[4] = self;
    v14 = v5;
    [v12 finalizeWithCompletionHandler:v13];
  }
}

void __50__CPLChangeSession_finalizeWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) setState:6];
  [*(id *)(*(void *)(a1 + 32) + 32) discardCurrentSession];
  if (!_CPLSilentLogging)
  {
    id v4 = __CPLSessionOSLogDomain_21938();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "%@ finalized with error %@", (uint8_t *)&v6, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)beginSessionWithKnownLibraryVersion:(id)a3 resetTracker:(id)a4 completionHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, void *))a5;
  if (!_CPLSilentLogging)
  {
    uint64_t v12 = __CPLSessionOSLogDomain_21938();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v13 = (CPLChangeSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v13;
      _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
    }
  }
  if ([(CPLChangeSession *)self state])
  {
    if (!_CPLSilentLogging)
    {
      v14 = __CPLSessionOSLogDomain_21938();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", -[CPLChangeSession state](self, "state"));
        v15 = (CPLChangeSession *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = v15;
        _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "Trying to begin a session that has already started (state: %@)", buf, 0xCu);
      }
    }
    v16 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to begin a session that has already started"];
    v11[2](v11, v16);
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v17 = __CPLSessionOSLogDomain_21938();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v25 = self;
        __int16 v26 = 2112;
        id v27 = v9;
        _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_DEBUG, "%@ starting with known library version %@", buf, 0x16u);
      }
    }
    v16 = [(CPLChangeSession *)self createSessionContext];
    v18 = v10;
    if (!v10)
    {
      v18 = +[CPLResetTracker currentTracker];
    }
    [v16 setResetTracker:v18];
    v19 = [(CPLChangeSession *)self platformObject];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __87__CPLChangeSession_beginSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke;
    v20[3] = &unk_1E60AAE20;
    v20[4] = self;
    BOOL v23 = v10 == 0;
    id v10 = v18;
    id v21 = v10;
    v22 = v11;
    [v19 beginSessionWithKnownLibraryVersion:v9 context:v16 completionHandler:v20];
  }
}

void __87__CPLChangeSession_beginSessionWithKnownLibraryVersion_resetTracker_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (!_CPLSilentLogging)
    {
      id v4 = __CPLSessionOSLogDomain_21938();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v8 = 138412546;
        uint64_t v9 = v5;
        __int16 v10 = 2112;
        id v11 = v3;
        _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_DEBUG, "%@ failed to start: %@", (uint8_t *)&v8, 0x16u);
      }
    }
    [*(id *)(a1 + 32) setState:6];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      int v6 = __CPLSessionOSLogDomain_21938();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v8 = 138412290;
        uint64_t v9 = v7;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEBUG, "%@ started", (uint8_t *)&v8, 0xCu);
      }
    }
    [*(id *)(a1 + 32) setState:1];
    if (*(unsigned char *)(a1 + 56)) {
      +[CPLResetTracker discardTracker:*(void *)(a1 + 40)];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)createSessionContext
{
  id v3 = objc_alloc_init(CPLChangeSessionContext);
  [(CPLChangeSessionContext *)v3 setEstimatedInitialSizeForLocalLibrary:[(CPLLibraryManager *)self->_libraryManager estimatedInitialSizeForLocalLibrary]];
  [(CPLChangeSessionContext *)v3 setEstimatedInitialAssetCountForLocalLibrary:[(CPLLibraryManager *)self->_libraryManager estimatedInitialAssetCountForLocalLibrary]];
  return v3;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_state != 6 && _CPLSilentLogging == 0)
  {
    id v4 = __CPLSessionOSLogDomain_21938();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [(id)objc_opt_class() stateDescriptionForState:self->_state];
      *(_DWORD *)buf = 138412290;
      int v8 = v5;
      _os_log_impl(&dword_1B4CAC000, v4, OS_LOG_TYPE_ERROR, "session was not properly finalized. Still in %@ state", buf, 0xCu);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)CPLChangeSession;
  [(CPLChangeSession *)&v6 dealloc];
}

- (CPLChangeSession)initWithLibraryManager:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CPLChangeSession;
  uint64_t v7 = [(CPLChangeSession *)&v21 init];
  if (v7)
  {
    int v8 = +[CPLPlatform currentPlatform];
    uint64_t v9 = [v8 newPlatformImplementationForObject:v7];
    platformObject = v7->_platformObject;
    v7->_platformObject = (CPLPlatformObject *)v9;

    if (!v7->_platformObject)
    {
      if (!_CPLSilentLogging)
      {
        v16 = __CPLSessionOSLogDomain_21938();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          BOOL v23 = v17;
          id v18 = v17;
          _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_ERROR, "No platform object specified for %@", buf, 0xCu);
        }
      }
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLChangeSession.m"];
      [v19 handleFailureInMethod:a2, v7, v20, 73, @"No platform object specified for %@", objc_opt_class() object file lineNumber description];

      abort();
    }
    objc_storeStrong((id *)&v7->_libraryManager, a3);
    id v11 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v12 = [v11 UUIDString];
    uint64_t v13 = [v12 copy];
    sessionIdentifier = v7->_sessionIdentifier;
    v7->_sessionIdentifier = (NSString *)v13;
  }
  return v7;
}

- (CPLChangeSession)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLChangeSession.m"];
  [v4 handleFailureInMethod:a2 object:self file:v5 lineNumber:65 description:@"Should not use -init method but -initWithLibraryManager:"];

  abort();
}

+ (NSString)shortDescription
{
  return (NSString *)@"generic";
}

+ (id)platformImplementationProtocol
{
  id v2 = [(id)objc_opt_class() description];
  id v3 = [v2 stringByAppendingString:@"Implementation"];
  id v4 = NSProtocolFromString(v3);

  return v4;
}

+ (id)stateDescriptionForState:(unint64_t)a3
{
  if (a3 > 6) {
    return @"UNKNOWN";
  }
  else {
    return off_1E60AAE40[a3];
  }
}

@end