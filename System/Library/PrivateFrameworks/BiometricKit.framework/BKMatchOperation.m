@interface BKMatchOperation
- (BKMatchOperation)initWithDevice:(id)a3;
- (BOOL)captureOnly;
- (BOOL)stopOnSuccess;
- (NSArray)selectedIdentities;
- (NSData)credentialSet;
- (NSNumber)userID;
- (id)matchResultInfoWithServerIdentity:(id)a3 details:(id)a4;
- (id)optionsDictionaryWithError:(id *)a3;
- (int64_t)priority;
- (int64_t)purpose;
- (int64_t)useCase;
- (void)dealloc;
- (void)matchResult:(id)a3 details:(id)a4 client:(unint64_t)a5;
- (void)operationInterrupted;
- (void)processMatchFailReason:(int64_t)a3;
- (void)setCaptureOnly:(BOOL)a3;
- (void)setCredentialSet:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setPurpose:(int64_t)a3;
- (void)setSelectedIdentities:(id)a3;
- (void)setStopOnSuccess:(BOOL)a3;
- (void)setUseCase:(int64_t)a3;
- (void)setUserID:(id)a3;
- (void)startBioOperation:(BOOL)a3 reply:(id)a4;
- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4;
@end

@implementation BKMatchOperation

- (BKMatchOperation)initWithDevice:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKMatchOperation;
  v3 = [(BKOperation *)&v6 initWithDevice:a3];
  v4 = v3;
  if (v3) {
    v3->_purpose = 1;
  }
  BKLogEvent(0x40000u);
  return v4;
}

- (void)dealloc
{
  BKLogEvent(0x40002u);
  v3.receiver = self;
  v3.super_class = (Class)BKMatchOperation;
  [(BKOperation *)&v3 dealloc];
}

- (void)operationInterrupted
{
  [(BKMatchOperation *)self processMatchFailReason:1];
  v3.receiver = self;
  v3.super_class = (Class)BKMatchOperation;
  [(BKOperation *)&v3 operationInterrupted];
}

- (id)optionsDictionaryWithError:(id *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_super v6 = v5;
  switch(self->_purpose)
  {
    case 1:
      goto LABEL_24;
    case 2:
      credentialSet = (NSData *)MEMORY[0x1E4F1CC38];
      v8 = @"BKOptionMatchForUnlock";
      goto LABEL_23;
    case 3:
      credentialSet = self->_credentialSet;
      if (credentialSet) {
        goto LABEL_18;
      }
      if (__osLog) {
        v9 = __osLog;
      }
      else {
        v9 = MEMORY[0x1E4F14500];
      }
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 136316162;
      v32 = "_credentialSet";
      __int16 v33 = 2048;
      uint64_t v34 = 0;
      __int16 v35 = 2080;
      v36 = &unk_1B3B370EE;
      __int16 v37 = 2080;
      v38 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKOperation.m";
      __int16 v39 = 1024;
      int v40 = 771;
      goto LABEL_8;
    case 4:
      if (self->_credentialSet)
      {
        [v5 setObject:MEMORY[0x1E4F1CC38] forKey:@"BKOptionMatchForUnlock"];
        credentialSet = self->_credentialSet;
LABEL_18:
        v8 = @"BKOptionMatchForCredentialSet";
LABEL_23:
        [v6 setObject:credentialSet forKey:v8];
LABEL_24:
        unint64_t v11 = self->_useCase - 1;
        if (v11 <= 2) {
          [v6 setObject:*(&off_1E6068200 + v11) forKey:@"BKOptionMatchUseCase"];
        }
        if (self->_priority)
        {
          v12 = objc_msgSend(NSNumber, "numberWithInteger:");
          [v6 setObject:v12 forKey:@"BKOptionPriority"];
        }
        if (self->_stopOnSuccess)
        {
          v13 = [NSNumber numberWithBool:1];
          [v6 setObject:v13 forKey:@"BKOptionMatchStopOnSuccess"];
        }
        if (!self->_selectedIdentities) {
          goto LABEL_41;
        }
        v14 = [MEMORY[0x1E4F1CA48] array];
        if (v14)
        {
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          v15 = self->_selectedIdentities;
          uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (!v16) {
            goto LABEL_40;
          }
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v27;
          while (1)
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v27 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "serverIdentity", (void)v26);
              if (!v20)
              {
                if (__osLog) {
                  v23 = __osLog;
                }
                else {
                  v23 = MEMORY[0x1E4F14500];
                }
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136316162;
                  v32 = "serverIdentity";
                  __int16 v33 = 2048;
                  uint64_t v34 = 0;
                  __int16 v35 = 2080;
                  v36 = &unk_1B3B370EE;
                  __int16 v37 = 2080;
                  v38 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKOperation.m";
                  __int16 v39 = 1024;
                  int v40 = 825;
                  _os_log_impl(&dword_1B3AF1000, v23, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                }
                setError((id)1, a3);

LABEL_48:
                goto LABEL_49;
              }
              v21 = (void *)v20;
              [v14 addObject:v20];
            }
            uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
            if (!v17)
            {
LABEL_40:

              [v6 setObject:v14 forKey:@"BKOptionMatchSelectedIdentities"];
LABEL_41:
              id v22 = v6;
              goto LABEL_50;
            }
          }
        }
        if (__osLog) {
          v25 = __osLog;
        }
        else {
          v25 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v32 = "serverIdentities";
          __int16 v33 = 2048;
          uint64_t v34 = 0;
          __int16 v35 = 2080;
          v36 = &unk_1B3B370EE;
          __int16 v37 = 2080;
          v38 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKOperation.m";
          __int16 v39 = 1024;
          int v40 = 822;
          _os_log_impl(&dword_1B3AF1000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
        }
        setError((id)1, a3);
        goto LABEL_48;
      }
      if (__osLog) {
        v9 = __osLog;
      }
      else {
        v9 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v32 = "_credentialSet";
        __int16 v33 = 2048;
        uint64_t v34 = 0;
        __int16 v35 = 2080;
        v36 = &unk_1B3B370EE;
        __int16 v37 = 2080;
        v38 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKOperation.m";
        __int16 v39 = 1024;
        int v40 = 776;
LABEL_8:
        _os_log_impl(&dword_1B3AF1000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
LABEL_9:
      setError((id)1, a3);
LABEL_49:
      id v22 = 0;
LABEL_50:

      return v22;
    case 5:
      [v5 setObject:MEMORY[0x1E4F1CC38] forKey:@"BKOptionMatchForPreArm"];
      if (self->_captureOnly)
      {
        v10 = [NSNumber numberWithBool:1];
        [v6 setObject:v10 forKey:@"BKOptionMatchCaptureOnly"];
      }
      goto LABEL_24;
    case 6:
      [v5 setObject:MEMORY[0x1E4F1CC38] forKey:@"BKOptionMatchBypassPasscodeBiolockout"];
      credentialSet = self->_credentialSet;
      if (!credentialSet) {
        goto LABEL_24;
      }
      v8 = @"BKOptionAuthWithCredentialSet";
      goto LABEL_23;
    default:
      if (__osLog) {
        v9 = __osLog;
      }
      else {
        v9 = MEMORY[0x1E4F14500];
      }
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 136316162;
      v32 = "0";
      __int16 v33 = 2048;
      uint64_t v34 = 0;
      __int16 v35 = 2080;
      v36 = &unk_1B3B370EE;
      __int16 v37 = 2080;
      v38 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKOperation.m";
      __int16 v39 = 1024;
      int v40 = 797;
      goto LABEL_8;
  }
}

- (void)startBioOperation:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  kdebug_trace();
  v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v8 = __osLogTrace;
  }
  else {
    v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super._xpcClient;
    v10 = v8;
    *(_DWORD *)buf = 134217984;
    v24 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKMatchOperation::startBioOperation (_cid %lu)\n", buf, 0xCu);
  }
  id v20 = 0;
  unint64_t v11 = [(BKMatchOperation *)self optionsDictionaryWithError:&v20];
  id v12 = v20;
  if (v11)
  {
    userID = self->_userID;
    if (userID)
    {
      v21 = @"BKFilterUserID";
      id v22 = userID;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    }
    else
    {
      v14 = 0;
    }
    v15 = self->super._xpcClient;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __44__BKMatchOperation_startBioOperation_reply___block_invoke;
    v18[3] = &unk_1E6067D28;
    id v19 = v6;
    [(BiometricKitXPCClient *)v15 match:v14 withOptions:v11 async:v4 withReply:v18];
  }
  else
  {
    if (__osLog) {
      uint64_t v17 = __osLog;
    }
    else {
      uint64_t v17 = v7;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v24 = "options";
      __int16 v25 = 2048;
      uint64_t v26 = 0;
      __int16 v27 = 2080;
      long long v28 = &unk_1B3B370EE;
      __int16 v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKOperation.m";
      __int16 v31 = 1024;
      int v32 = 852;
      _os_log_impl(&dword_1B3AF1000, v17, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    (*((void (**)(id, void, id))v6 + 2))(v6, 0, v12);
  }
  if (__osLogTrace) {
    uint64_t v16 = __osLogTrace;
  }
  else {
    uint64_t v16 = v7;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v16, OS_LOG_TYPE_DEFAULT, "BKMatchOperation::startBioOperation -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __44__BKMatchOperation_startBioOperation_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v5 = +[BKErrorHelper errorWithOSStatus:a2];
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v5);
  }
  else
  {
    objc_super v3 = *(void (**)(uint64_t, uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4, 1, 0);
  }
}

- (id)matchResultInfoWithServerIdentity:(id)a3 details:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [BKMatchResultInfo alloc];
  v9 = [(BKOperation *)self device];
  v10 = [(BKMatchResultInfo *)v8 initWithServerIdentity:v7 details:v6 device:v9];

  return v10;
}

- (void)matchResult:(id)a3 details:(id)a4 client:(unint64_t)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  kdebug_trace();
  v9 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v10 = __osLogTrace;
  }
  else {
    v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v11 = v10;
    __int16 v25 = [v8 objectForKeyedSubscript:@"BKMatchDetailLockoutState"];
    int v12 = [v25 intValue];
    v13 = [v8 objectForKeyedSubscript:@"BKMatchDetailUnlocked"];
    int v14 = [v13 BOOLValue];
    v15 = [v8 objectForKeyedSubscript:@"BKMatchDetailCredentialAdded"];
    int v16 = [v15 BOOLValue];
    uint64_t v17 = [v8 objectForKeyedSubscript:@"BKMatchDetailResultIgnored"];
    int v18 = [v17 BOOLValue];
    *(_DWORD *)buf = 134219522;
    id v29 = v7;
    __int16 v30 = 2112;
    id v31 = v7;
    __int16 v32 = 2048;
    id v33 = v8;
    __int16 v34 = 1024;
    int v35 = v12;
    v9 = MEMORY[0x1E4F14500];
    __int16 v36 = 1024;
    int v37 = v14;
    __int16 v38 = 1024;
    int v39 = v16;
    __int16 v40 = 1024;
    int v41 = v18;
    _os_log_impl(&dword_1B3AF1000, v11, OS_LOG_TYPE_DEFAULT, "BKMatchOperation::matchResult:withDictionary: %p(%@) %p(LockoutState:%d,Unlocked:%d,CredentialAdded:%d,Ignored:%u)\n", buf, 0x38u);
  }
  id v19 = [(BKOperation *)self delegate];
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    v21 = [(BKMatchOperation *)self matchResultInfoWithServerIdentity:v7 details:v8];
    id v22 = [(BKOperation *)self dispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__BKMatchOperation_matchResult_details_client___block_invoke;
    block[3] = &unk_1E6068040;
    block[4] = self;
    id v27 = v21;
    id v23 = v21;
    dispatch_async(v22, block);
  }
  if (__osLogTrace) {
    v24 = __osLogTrace;
  }
  else {
    v24 = v9;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v24, OS_LOG_TYPE_DEFAULT, "BKMatchOperation::matchResult:withDictionary: -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __47__BKMatchOperation_matchResult_details_client___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 matchOperation:*(void *)(a1 + 32) matchedWithResult:*(void *)(a1 + 40)];
}

- (void)processMatchFailReason:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = [(BKOperation *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (__osLog) {
      id v7 = __osLog;
    }
    else {
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      v9 = [(BKOperation *)self delegate];
      v10 = [(BKOperation *)self delegate];
      *(_DWORD *)buf = 134218498;
      int v14 = v9;
      __int16 v15 = 2112;
      int v16 = v10;
      __int16 v17 = 2048;
      int64_t v18 = a3;
      _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKMatchOperation::processMatchFailReason: %p(%@) failedWithReason: %ld\n", buf, 0x20u);
    }
    unint64_t v11 = [(BKOperation *)self dispatchQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __43__BKMatchOperation_processMatchFailReason___block_invoke;
    v12[3] = &unk_1E6067BF8;
    v12[4] = self;
    v12[5] = a3;
    dispatch_async(v11, v12);
  }
}

void __43__BKMatchOperation_processMatchFailReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 matchOperation:*(void *)(a1 + 32) failedWithReason:*(void *)(a1 + 40)];
}

- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super._xpcClient;
    v10 = v8;
    *(_DWORD *)buf = 67109376;
    int v20 = v5;
    __int16 v21 = 2048;
    uint64_t v22 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKMatchOperation::statusMessage: %u (_cid %lu)\n", buf, 0x12u);
  }
  if ((int)v5 <= 91)
  {
    uint64_t v11 = 2;
    switch((int)v5)
    {
      case 'P':
        uint64_t v12 = 2;
        break;
      case 'Q':
        goto LABEL_18;
      case 'R':
        uint64_t v11 = 3;
        goto LABEL_18;
      case 'S':
        uint64_t v11 = 4;
        goto LABEL_18;
      default:
        if (v5 != 51) {
          goto LABEL_20;
        }
        uint64_t v12 = 1;
        break;
    }
LABEL_14:
    [(BKMatchOperation *)self processMatchFailReason:v12];
    goto LABEL_20;
  }
  if (v5 != 92)
  {
    if (v5 != 502) {
      goto LABEL_20;
    }
    uint64_t v12 = 8;
    goto LABEL_14;
  }
  uint64_t v11 = 5;
LABEL_18:
  v13 = [(BKOperation *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    __int16 v15 = [(BKOperation *)self dispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__BKMatchOperation_statusMessage_client___block_invoke;
    block[3] = &unk_1E6067BF8;
    block[4] = self;
    void block[5] = v11;
    dispatch_async(v15, block);
  }
LABEL_20:
  v17.receiver = self;
  v17.super_class = (Class)BKMatchOperation;
  [(BKOperation *)&v17 statusMessage:v5 client:a4];
  if (__osLogTrace) {
    int v16 = __osLogTrace;
  }
  else {
    int v16 = v7;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v16, OS_LOG_TYPE_DEFAULT, "BKMatchOperation::statusMessage: -> void\n", buf, 2u);
  }
}

void __41__BKMatchOperation_statusMessage_client___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 matchOperation:*(void *)(a1 + 32) presenceDetectedInLockout:*(void *)(a1 + 40)];
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(int64_t)a3
{
  self->_purpose = a3;
}

- (NSNumber)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
}

- (NSArray)selectedIdentities
{
  return self->_selectedIdentities;
}

- (void)setSelectedIdentities:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (NSData)credentialSet
{
  return self->_credentialSet;
}

- (void)setCredentialSet:(id)a3
{
}

- (int64_t)useCase
{
  return self->_useCase;
}

- (void)setUseCase:(int64_t)a3
{
  self->_useCase = a3;
}

- (BOOL)stopOnSuccess
{
  return self->_stopOnSuccess;
}

- (void)setStopOnSuccess:(BOOL)a3
{
  self->_stopOnSuccess = a3;
}

- (BOOL)captureOnly
{
  return self->_captureOnly;
}

- (void)setCaptureOnly:(BOOL)a3
{
  self->_captureOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialSet, 0);
  objc_storeStrong((id *)&self->_selectedIdentities, 0);
  objc_storeStrong((id *)&self->_userID, 0);
}

@end