@interface CPLPullChangeSession
+ (id)shortDescription;
- (void)acknowledgeChangeBatch:(id)a3 withCompletionHandler:(id)a4;
- (void)getChangeBatchWithCompletionHandler:(id)a3;
@end

@implementation CPLPullChangeSession

+ (id)shortDescription
{
  return @"pull";
}

- (void)acknowledgeChangeBatch:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!_CPLSilentLogging)
  {
    v9 = __CPLSessionOSLogDomain_0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v10 = (CPLPullChangeSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v10;
      _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
    }
  }
  double Current = CFAbsoluteTimeGetCurrent();
  double sentBatchTimeInterval = self->_sentBatchTimeInterval;
  if ([(CPLChangeSession *)self state] == 3)
  {
    if ([(CPLChangeSession *)self state] != 3)
    {
      if (!_CPLSilentLogging)
      {
        v19 = __CPLSessionOSLogDomain_0();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", -[CPLChangeSession state](self, "state"));
          v20 = (CPLPullChangeSession *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v29 = v20;
          _os_log_impl(&dword_1B4CAC000, v19, OS_LOG_TYPE_ERROR, "can't finalize a session that is in %@ state", buf, 0xCu);
        }
      }
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPullChangeSession.m"];
      v23 = objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", -[CPLChangeSession state](self, "state"));
      [v21 handleFailureInMethod:a2, self, v22, 65, @"can't finalize a session that is in %@ state", v23 object file lineNumber description];

      abort();
    }
    double v13 = Current - sentBatchTimeInterval;
    [(CPLChangeSession *)self setState:4];
    if (!_CPLSilentLogging)
    {
      v14 = __CPLSessionOSLogDomain_0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v29 = self;
        __int16 v30 = 2112;
        id v31 = v7;
        _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_DEBUG, "%@ acknowledging %@", buf, 0x16u);
      }
    }
    v15 = [(CPLChangeSession *)self platformObject];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __69__CPLPullChangeSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke;
    v24[3] = &unk_1E60A7D98;
    v24[4] = self;
    double v27 = v13;
    id v25 = v7;
    id v26 = v8;
    [v15 acknowledgeChangeBatch:v25 withCompletionHandler:v24];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      v16 = __CPLSessionOSLogDomain_0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", -[CPLChangeSession state](self, "state"));
        v17 = (CPLPullChangeSession *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v29 = v17;
        _os_log_impl(&dword_1B4CAC000, v16, OS_LOG_TYPE_ERROR, "Trying to acknowledge a batch while session is not waiting for that (state: %@)", buf, 0xCu);
      }
    }
    v18 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to acknowledge a batch while session is not waiting for that"];
    (*((void (**)(id, void *, void))v8 + 2))(v8, v18, 0);
  }
}

void __69__CPLPullChangeSession_acknowledgeChangeBatch_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = __CPLSessionOSLogDomain_0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v13 = 138412802;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_1B4CAC000, v7, OS_LOG_TYPE_DEBUG, "%@ acknowledged batch to new version %@ with error %@", (uint8_t *)&v13, 0x20u);
    }
  }
  [*(id *)(a1 + 32) setState:1];
  if (!v5)
  {
    if (!_CPLSilentLogging)
    {
      v9 = __CPLSessionOSLogDomain_0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 56);
        v11 = *(void **)(a1 + 40);
        int v13 = 134218242;
        uint64_t v14 = v10;
        __int16 v15 = 2112;
        id v16 = v11;
        _os_log_impl(&dword_1B4CAC000, v9, OS_LOG_TYPE_DEFAULT, "Client acknowledged (used %.1fs) %@", (uint8_t *)&v13, 0x16u);
      }
    }
    v12 = [*(id *)(a1 + 32) libraryManager];
    [v12 _setLibraryVersion:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)getChangeBatchWithCompletionHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!_CPLSilentLogging)
  {
    id v6 = __CPLSessionOSLogDomain_0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      id v7 = (CPLPullChangeSession *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      id v16 = v7;
      _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_DEBUG, "%@ called", buf, 0xCu);
    }
  }
  if ([(CPLChangeSession *)self state] == 1)
  {
    [(CPLChangeSession *)self setState:2];
    if (!_CPLSilentLogging)
    {
      uint64_t v8 = __CPLSessionOSLogDomain_0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = self;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_DEBUG, "%@ asking for batches", buf, 0xCu);
      }
    }
    v9 = [(CPLChangeSession *)self platformObject];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__CPLPullChangeSession_getChangeBatchWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E60A6A10;
    v13[4] = self;
    id v14 = v5;
    [v9 getChangeBatchWithCompletionHandler:v13];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v10 = __CPLSessionOSLogDomain_0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend((id)objc_opt_class(), "stateDescriptionForState:", -[CPLChangeSession state](self, "state"));
        v11 = (CPLPullChangeSession *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        id v16 = v11;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Trying to get change batches while session is not idle (state: %@)", buf, 0xCu);
      }
    }
    v12 = +[CPLErrors incorrectMachineStateErrorWithReason:@"Trying to get change batches while session is not idle"];
    (*((void (**)(id, void *, void))v5 + 2))(v5, v12, 0);
  }
}

void __60__CPLPullChangeSession_getChangeBatchWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (_CPLSilentLogging) {
      goto LABEL_10;
    }
    id v7 = __CPLSessionOSLogDomain_0();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)id v14 = 138412546;
    *(void *)&v14[4] = v8;
    *(_WORD *)&v14[12] = 2112;
    *(void *)&v14[14] = v5;
    v9 = "%@ got error: %@";
    uint64_t v10 = v7;
    uint32_t v11 = 22;
    goto LABEL_8;
  }
  if (_CPLSilentLogging) {
    goto LABEL_10;
  }
  id v7 = __CPLSessionOSLogDomain_0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)id v14 = 138412802;
    *(void *)&v14[4] = v12;
    *(_WORD *)&v14[12] = 2048;
    *(void *)&v14[14] = [v6 count];
    *(_WORD *)&v14[22] = 2112;
    id v15 = v6;
    v9 = "%@ got %lu changes in %@";
    uint64_t v10 = v7;
    uint32_t v11 = 32;
LABEL_8:
    _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_DEBUG, v9, v14, v11);
  }
LABEL_9:

LABEL_10:
  if (v6) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "setState:", v13, *(_OWORD *)v14, *(void *)&v14[16], v15);
  *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 48) = CFAbsoluteTimeGetCurrent();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end