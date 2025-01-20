@interface BKExtendEnrollTouchIDOperation
- (BKIdentity)identity;
- (NSData)credentialSet;
- (void)homeButtonPressed:(unint64_t)a3;
- (void)matchResult:(id)a3 details:(id)a4 client:(unint64_t)a5;
- (void)setCredentialSet:(id)a3;
- (void)setIdentity:(id)a3;
- (void)startBioOperation:(BOOL)a3 reply:(id)a4;
- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4;
@end

@implementation BKExtendEnrollTouchIDOperation

- (void)startBioOperation:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
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
    uint64_t v24 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKExtendEnrollTouchIDOperation::startBioOperation (_cid %lu)\n", buf, 0xCu);
  }
  v11 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:&unk_1F0C52A80];
  identity = self->_identity;
  if (identity)
  {
    v21 = @"BKFilterIdentity";
    v13 = [(BKIdentity *)identity serverIdentity];
    v22 = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  }
  else
  {
    v14 = 0;
  }
  credentialSet = self->_credentialSet;
  if (credentialSet) {
    [v11 setObject:credentialSet forKey:@"BKOptionAuthWithCredentialSet"];
  }
  v16 = self->super._xpcClient;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __58__BKExtendEnrollTouchIDOperation_startBioOperation_reply___block_invoke;
  v19[3] = &unk_1E6067D28;
  id v17 = v6;
  id v20 = v17;
  [(BiometricKitXPCClient *)v16 match:v14 withOptions:v11 async:v4 withReply:v19];

  if (__osLogTrace) {
    v18 = __osLogTrace;
  }
  else {
    v18 = v7;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v18, OS_LOG_TYPE_DEFAULT, "BKExtendEnrollTouchIDOperation::startBioOperation -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __58__BKExtendEnrollTouchIDOperation_startBioOperation_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v5 = +[BKErrorHelper errorWithOSStatus:a2];
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v5);
  }
  else
  {
    v3 = *(void (**)(uint64_t, uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4, 1, 0);
  }
}

- (void)matchResult:(id)a3 details:(id)a4 client:(unint64_t)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
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
    *(_DWORD *)buf = 134218498;
    id v22 = v7;
    __int16 v23 = 2112;
    id v24 = v7;
    __int16 v25 = 2048;
    id v26 = v8;
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKExtendEnrollTouchIDOperation::matchResult:withDictionary: %p(%@) %p)\n", buf, 0x20u);
  }
  v11 = [(BKOperation *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    if (__osLog) {
      v13 = __osLog;
    }
    else {
      v13 = v9;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = [(BKOperation *)self delegate];
      v16 = [(BKOperation *)self delegate];
      *(_DWORD *)buf = 134218498;
      id v22 = v15;
      __int16 v23 = 2112;
      id v24 = v16;
      __int16 v25 = 1024;
      LODWORD(v26) = v7 != 0;
      _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_DEFAULT, "BKExtendEnrollTouchIDOperation::matchResult: %p(%@) hasUpdated: %u\n", buf, 0x1Cu);
    }
    id v17 = [(BKOperation *)self dispatchQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __61__BKExtendEnrollTouchIDOperation_matchResult_details_client___block_invoke;
    v19[3] = &unk_1E60680B8;
    void v19[4] = self;
    BOOL v20 = v7 != 0;
    dispatch_async(v17, v19);
  }
  if (__osLogTrace) {
    v18 = __osLogTrace;
  }
  else {
    v18 = v9;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v18, OS_LOG_TYPE_DEFAULT, "BKExtendEnrollTouchIDOperation::matchResult:withDictionary: -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __61__BKExtendEnrollTouchIDOperation_matchResult_details_client___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 extendEnroll:*(void *)(a1 + 32) hasUpdated:*(unsigned __int8 *)(a1 + 40)];
}

- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  id v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    id v8 = __osLogTrace;
  }
  else {
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v22) = v5;
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKExtendEnrollTouchIDOperation::statusMessage: %u\n", buf, 8u);
  }
  uint64_t v9 = __statusToFingerprintCaptureError(v5);
  if (v9)
  {
    uint64_t v10 = v9;
    v11 = [(BKOperation *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      if (__osLog) {
        v13 = __osLog;
      }
      else {
        v13 = v7;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        v15 = [(BKOperation *)self delegate];
        v16 = [(BKOperation *)self delegate];
        *(_DWORD *)buf = 134218498;
        id v22 = v15;
        __int16 v23 = 2112;
        id v24 = v16;
        __int16 v25 = 2048;
        uint64_t v26 = v10;
        _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_DEFAULT, "BKExtendEnrollTouchIDOperation::statusMessage: %p(%@) encounteredCaptureError: %ld\n", buf, 0x20u);
      }
      id v17 = [(BKOperation *)self dispatchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__BKExtendEnrollTouchIDOperation_statusMessage_client___block_invoke;
      block[3] = &unk_1E6067BF8;
      block[4] = self;
      block[5] = v10;
      dispatch_async(v17, block);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)BKExtendEnrollTouchIDOperation;
  [(BKOperation *)&v19 statusMessage:v5 client:a4];
  if (__osLogTrace) {
    v18 = __osLogTrace;
  }
  else {
    v18 = v7;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v18, OS_LOG_TYPE_DEFAULT, "BKExtendEnrollTouchIDOperation::statusMessage: -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __55__BKExtendEnrollTouchIDOperation_statusMessage_client___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 fingerprintCaptureOperation:*(void *)(a1 + 32) encounteredCaptureError:*(void *)(a1 + 40)];
}

- (void)homeButtonPressed:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    uint64_t v5 = __osLogTrace;
  }
  else {
    uint64_t v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v5, OS_LOG_TYPE_DEFAULT, "BKExtendEnrollTouchIDOperation::homeButtonPressed\n", buf, 2u);
  }
  id v6 = [(BKOperation *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    if (__osLog) {
      id v8 = __osLog;
    }
    else {
      id v8 = v4;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v8;
      uint64_t v10 = [(BKOperation *)self delegate];
      v11 = [(BKOperation *)self delegate];
      *(_DWORD *)buf = 134218242;
      v16 = v10;
      __int16 v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1B3AF1000, v9, OS_LOG_TYPE_DEFAULT, "BKExtendEnrollTouchIDOperation::homeButtonPressed: %p(%@) homeButtonPressedInEnrollOperation\n", buf, 0x16u);
    }
    char v12 = [(BKOperation *)self dispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__BKExtendEnrollTouchIDOperation_homeButtonPressed___block_invoke;
    block[3] = &unk_1E6067CD8;
    block[4] = self;
    dispatch_async(v12, block);
  }
  if (__osLogTrace) {
    v13 = __osLogTrace;
  }
  else {
    v13 = v4;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_DEFAULT, "BKExtendEnrollTouchIDOperation::homeButtonPressed: -> void\n", buf, 2u);
  }
}

void __52__BKExtendEnrollTouchIDOperation_homeButtonPressed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 touchIDButtonPressedInOperation:*(void *)(a1 + 32)];
}

- (BKIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (NSData)credentialSet
{
  return self->_credentialSet;
}

- (void)setCredentialSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialSet, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end