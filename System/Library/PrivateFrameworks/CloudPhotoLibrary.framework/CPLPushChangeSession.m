@interface CPLPushChangeSession
+ (id)shortDescription;
- (CPLPushChangeSession)initWithLibraryManager:(id)a3;
- (void)commitChangeBatch:(id)a3 completionHandler:(id)a4;
- (void)commitChangeBatch:(id)a3 withUnderlyingCompletionHandler:(id)a4;
@end

@implementation CPLPushChangeSession

- (void)commitChangeBatch:(id)a3 withUnderlyingCompletionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!_CPLSilentLogging)
  {
    v9 = __CPLSessionOSLogDomain_17407();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v10 = (CPLPushChangeSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v10;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
    }
  }
  if ([(CPLChangeSession *)self state] != 1)
  {
    if (!_CPLSilentLogging)
    {
      v18 = __CPLSessionOSLogDomain_17407();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", -[CPLChangeSession state](self, "state"));
        v19 = (CPLPushChangeSession *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v28 = v19;
        _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_ERROR, "can't commit a session that is in %@ state", buf, 0xCu);
      }
    }
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPushChangeSession.m"];
    v22 = objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", -[CPLChangeSession state](self, "state"));
    [v20 handleFailureInMethod:a2, self, v21, 219, @"can't commit a session that is in %@ state", v22 object file lineNumber description];

    abort();
  }
  [(CPLChangeSession *)self setState:4];
  double Current = CFAbsoluteTimeGetCurrent();
  double startWaitingForBatch = self->_startWaitingForBatch;
  if (!_CPLSilentLogging)
  {
    v13 = __CPLSessionOSLogDomain_17407();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = [v7 count];
      *(_DWORD *)buf = 138412802;
      v28 = self;
      __int16 v29 = 2048;
      uint64_t v30 = v14;
      __int16 v31 = 2112;
      id v32 = v7;
      _os_log_impl(&dword_1B4CAC000, v13, OS_LOG_TYPE_DEBUG, "%@ committing %lu changes in %@", buf, 0x20u);
    }
  }
  v15 = [(CPLChangeSession *)self platformObject];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __74__CPLPushChangeSession_commitChangeBatch_withUnderlyingCompletionHandler___block_invoke;
  v23[3] = &unk_1E60AA490;
  double v26 = Current - startWaitingForBatch;
  v23[4] = self;
  id v24 = v7;
  id v25 = v8;
  id v16 = v8;
  id v17 = v7;
  [v15 commitChangeBatch:v17 withCompletionHandler:v23];
}

void __74__CPLPushChangeSession_commitChangeBatch_withUnderlyingCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  if (!_CPLSilentLogging)
  {
    v12 = __CPLSessionOSLogDomain_17407();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)v23 = 138412802;
      *(void *)&v23[4] = v13;
      *(_WORD *)&v23[12] = 2112;
      *(void *)&v23[14] = v11;
      *(_WORD *)&v23[22] = 2112;
      id v24 = v9;
      _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_DEBUG, "%@ committed to new version %@ with error %@", v23, 0x20u);
    }
  }
  [*(id *)(a1 + 32) setState:1];
  if (!v9)
  {
    if (a3)
    {
      if (!_CPLSilentLogging)
      {
        uint64_t v14 = __CPLSessionOSLogDomain_17407();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = *(void *)(a1 + 56);
          uint64_t v16 = *(void *)(a1 + 40);
          *(_DWORD *)v23 = 134218498;
          *(void *)&v23[4] = v15;
          *(_WORD *)&v23[12] = 2112;
          *(void *)&v23[14] = v16;
          *(_WORD *)&v23[22] = 2048;
          id v24 = a3;
          id v17 = "Client pushed (used %.1fs) %@ (%lu spurious changes)";
          v18 = v14;
          uint32_t v19 = 32;
LABEL_13:
          _os_log_impl(&dword_1B4CAC000, v18, OS_LOG_TYPE_DEFAULT, v17, v23, v19);
          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else if (!_CPLSilentLogging)
    {
      uint64_t v14 = __CPLSessionOSLogDomain_17407();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(a1 + 56);
        uint64_t v21 = *(void *)(a1 + 40);
        *(_DWORD *)v23 = 134218242;
        *(void *)&v23[4] = v20;
        *(_WORD *)&v23[12] = 2112;
        *(void *)&v23[14] = v21;
        id v17 = "Client pushed (used %.1fs) %@";
        v18 = v14;
        uint32_t v19 = 22;
        goto LABEL_13;
      }
LABEL_14:
    }
    v22 = objc_msgSend(*(id *)(a1 + 32), "libraryManager", *(_OWORD *)v23, *(void *)&v23[16], v24);
    [v22 _setLibraryVersion:v11];
  }
  *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 48) = CFAbsoluteTimeGetCurrent();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)commitChangeBatch:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__CPLPushChangeSession_commitChangeBatch_completionHandler___block_invoke;
  v8[3] = &unk_1E60AA468;
  id v9 = v6;
  id v7 = v6;
  [(CPLPushChangeSession *)self commitChangeBatch:a3 withUnderlyingCompletionHandler:v8];
}

uint64_t __60__CPLPushChangeSession_commitChangeBatch_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CPLPushChangeSession)initWithLibraryManager:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPLPushChangeSession;
  v3 = [(CPLChangeSession *)&v5 initWithLibraryManager:a3];
  if (v3) {
    v3->_double startWaitingForBatch = CFAbsoluteTimeGetCurrent();
  }
  return v3;
}

+ (id)shortDescription
{
  return @"push";
}

@end