@interface BKEnrollOperation
- (BKAccessoryGroup)accessoryGroup;
- (BKEnrollOperation)initWithDevice:(id)a3;
- (NSData)credentialSet;
- (id)enrollResultInfoWithServerIdentity:(id)a3 details:(id)a4;
- (id)optionsDictionaryWithError:(id *)a3;
- (unsigned)userID;
- (void)enrollResult:(id)a3 details:(id)a4 client:(unint64_t)a5;
- (void)operationInterrupted;
- (void)processEnrollFailReason:(int64_t)a3;
- (void)setAccessoryGroup:(id)a3;
- (void)setCredentialSet:(id)a3;
- (void)setUserID:(unsigned int)a3;
- (void)startBioOperation:(BOOL)a3 reply:(id)a4;
- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4;
- (void)statusMessage:(unsigned int)a3 details:(id)a4 client:(unint64_t)a5;
@end

@implementation BKEnrollOperation

- (BKEnrollOperation)initWithDevice:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKEnrollOperation;
  v3 = [(BKOperation *)&v5 initWithDevice:a3];
  if (v3) {
    v3->_userID = getCurrentUserID();
  }
  return v3;
}

- (void)operationInterrupted
{
  [(BKEnrollOperation *)self processEnrollFailReason:2];
  v3.receiver = self;
  v3.super_class = (Class)BKEnrollOperation;
  [(BKOperation *)&v3 operationInterrupted];
}

- (id)optionsDictionaryWithError:(id *)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  objc_super v5 = v4;
  credentialSet = self->_credentialSet;
  if (credentialSet) {
    [v4 setObject:credentialSet forKey:@"BKOptionAuthWithCredentialSet"];
  }
  accessoryGroup = self->_accessoryGroup;
  if (accessoryGroup)
  {
    v8 = [(BKAccessoryGroup *)accessoryGroup serverAccessoryGroup];
    [v5 setObject:v8 forKey:@"BKOptionEnrollAccessoryGroup"];
  }
  return v5;
}

- (void)startBioOperation:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
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
    v25 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKEnrollOperation::startBioOperation (_cid %lu)\n", buf, 0xCu);
  }
  v11 = [(BKOperation *)self device];
  v12 = [v11 descriptor];
  uint64_t v13 = [v12 type];

  id v23 = 0;
  v14 = [(BKEnrollOperation *)self optionsDictionaryWithError:&v23];
  id v15 = v23;
  if (v14)
  {
    if (v13 == 2) {
      uint64_t v16 = 4;
    }
    else {
      uint64_t v16 = 1;
    }
    v17 = self->super._xpcClient;
    uint64_t userID = self->_userID;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __45__BKEnrollOperation_startBioOperation_reply___block_invoke;
    v21[3] = &unk_1E6067D28;
    id v22 = v6;
    [(BiometricKitXPCClient *)v17 enroll:v16 forUser:userID withOptions:v14 async:v4 withReply:v21];
  }
  else
  {
    if (__osLog) {
      v20 = __osLog;
    }
    else {
      v20 = v7;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v25 = "options";
      __int16 v26 = 2048;
      uint64_t v27 = 0;
      __int16 v28 = 2080;
      v29 = &unk_1B3B370EE;
      __int16 v30 = 2080;
      v31 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKOperation.m";
      __int16 v32 = 1024;
      int v33 = 556;
      _os_log_impl(&dword_1B3AF1000, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    (*((void (**)(id, void, id))v6 + 2))(v6, 0, v15);
  }
  if (__osLogTrace) {
    v19 = __osLogTrace;
  }
  else {
    v19 = v7;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v19, OS_LOG_TYPE_DEFAULT, "BKEnrollOperation::startBioOperation -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __45__BKEnrollOperation_startBioOperation_reply___block_invoke(uint64_t a1, uint64_t a2)
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

- (id)enrollResultInfoWithServerIdentity:(id)a3 details:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [BKEnrollResultInfo alloc];
  v9 = [(BKOperation *)self device];
  v10 = [(BKEnrollResultInfo *)v8 initWithServerIdentity:v7 details:v6 device:v9];

  return v10;
}

- (void)enrollResult:(id)a3 details:(id)a4 client:(unint64_t)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
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
    *(_DWORD *)buf = 134218242;
    id v29 = v7;
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKEnrollOperation::enrollResult %p(%@)\n", buf, 0x16u);
  }
  v11 = [(BKOperation *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    uint64_t v13 = [(BKOperation *)self dispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__BKEnrollOperation_enrollResult_details_client___block_invoke;
    block[3] = &unk_1E6068040;
    block[4] = self;
    id v27 = v7;
    dispatch_async(v13, block);
  }
  v14 = [(BKOperation *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    uint64_t v16 = [(BKEnrollOperation *)self enrollResultInfoWithServerIdentity:v7 details:v8];
    v17 = [(BKOperation *)self dispatchQueue];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __49__BKEnrollOperation_enrollResult_details_client___block_invoke_2;
    id v23 = &unk_1E6068040;
    v24 = self;
    id v25 = v16;
    id v18 = v16;
    dispatch_async(v17, &v20);
  }
  -[BKOperation operationEndsWithReason:](self, "operationEndsWithReason:", 1, v20, v21, v22, v23, v24);
  if (__osLogTrace) {
    v19 = __osLogTrace;
  }
  else {
    v19 = v9;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v19, OS_LOG_TYPE_DEFAULT, "BKEnrollOperation::enrollResult -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __49__BKEnrollOperation_enrollResult_details_client___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = [BKIdentity alloc];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) device];
  id v6 = [(BKIdentity *)v3 initWithServerIdentity:v4 device:v5];
  [v7 enrollOperation:v2 finishedWithIdentity:v6];
}

void __49__BKEnrollOperation_enrollResult_details_client___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 enrollOperation:*(void *)(a1 + 32) finishedWithEnrollResult:*(void *)(a1 + 40)];
}

- (void)processEnrollFailReason:(int64_t)a3
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
      v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      __int16 v17 = 2048;
      int64_t v18 = a3;
      _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKEnrollOperation::processEnrollFailReason: %p(%@) failedWithReason: %ld\n", buf, 0x20u);
    }
    v11 = [(BKOperation *)self dispatchQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__BKEnrollOperation_processEnrollFailReason___block_invoke;
    v12[3] = &unk_1E6067BF8;
    v12[4] = self;
    v12[5] = a3;
    dispatch_async(v11, v12);
  }
}

void __45__BKEnrollOperation_processEnrollFailReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 enrollOperation:*(void *)(a1 + 32) failedWithReason:*(void *)(a1 + 40)];
}

- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4
{
}

- (void)statusMessage:(unsigned int)a3 details:(id)a4 client:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
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
    xpcClient = self->super._xpcClient;
    char v12 = v10;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v36 = v6;
    *(_WORD *)&v36[4] = 2048;
    *(void *)&v36[6] = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v12, OS_LOG_TYPE_DEFAULT, "BKEnrollOperation::statusMessage: %u (_cid %lu)\n", buf, 0x12u);
  }
  if ((v6 - 100) > 0xFF)
  {
    uint64_t v21 = 1;
    switch((int)v6)
    {
      case 'B':
        goto LABEL_25;
      case 'C':
        uint64_t v21 = 2;
        goto LABEL_25;
      case 'D':
        uint64_t v21 = 3;
LABEL_25:
        [(BKEnrollOperation *)self processEnrollFailReason:v21];
        goto LABEL_26;
      case 'E':
        goto LABEL_26;
      case 'F':
        goto LABEL_16;
      default:
        if (v6 == 501)
        {
          id v22 = [(BKOperation *)self delegate];
          char v23 = objc_opt_respondsToSelector();

          if (v23)
          {
            v24 = [v8 objectForKeyedSubscript:@"BKAuthRequiredForAccessory"];
            if (v24)
            {
              id v25 = [BKAccessory alloc];
              __int16 v26 = [(BKOperation *)self device];
              id v27 = [(BKAccessory *)v25 initWithServerAccessory:v24 device:v26];

              if (v27)
              {
                __int16 v28 = [(BKOperation *)self dispatchQueue];
                v32[0] = MEMORY[0x1E4F143A8];
                v32[1] = 3221225472;
                v32[2] = __50__BKEnrollOperation_statusMessage_details_client___block_invoke_161;
                v32[3] = &unk_1E6068040;
                v32[4] = self;
                int v33 = v27;
                dispatch_async(v28, v32);
              }
              else
              {
                if (__osLog) {
                  __int16 v30 = __osLog;
                }
                else {
                  __int16 v30 = v9;
                }
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136316162;
                  *(void *)v36 = "accessory";
                  *(_WORD *)&v36[8] = 2048;
                  *(void *)&v36[10] = 0;
                  __int16 v37 = 2080;
                  v38 = &unk_1B3B370EE;
                  __int16 v39 = 2080;
                  v40 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKOperation.m";
                  __int16 v41 = 1024;
                  int v42 = 676;
                  _os_log_impl(&dword_1B3AF1000, v30, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
                }
              }
            }
          }
        }
        else
        {
LABEL_26:
          v31.receiver = self;
          v31.super_class = (Class)BKEnrollOperation;
          [(BKOperation *)&v31 statusMessage:v6 client:a5];
        }
        break;
    }
  }
  else
  {
    uint64_t v13 = [(BKOperation *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      unint64_t v15 = ((100 * (_WORD)v6 - 10000) & 0xFFFCu) / 0xFF;
      if (__osLog) {
        uint64_t v16 = __osLog;
      }
      else {
        uint64_t v16 = v9;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v17 = v16;
        int64_t v18 = [(BKOperation *)self delegate];
        uint64_t v19 = [(BKOperation *)self delegate];
        *(_DWORD *)buf = 134218498;
        *(void *)v36 = v18;
        *(_WORD *)&v36[8] = 2112;
        *(void *)&v36[10] = v19;
        __int16 v37 = 2048;
        v38 = (void *)v15;
        _os_log_impl(&dword_1B3AF1000, v17, OS_LOG_TYPE_DEFAULT, "BKEnrollOperation::statusMessage: %p(%@) percentCompleted: %ld\n", buf, 0x20u);
      }
      uint64_t v20 = [(BKOperation *)self dispatchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__BKEnrollOperation_statusMessage_details_client___block_invoke;
      block[3] = &unk_1E6067BF8;
      block[4] = self;
      void block[5] = v15;
      dispatch_async(v20, block);
    }
LABEL_16:
    [(BiometricKitXPCClient *)self->super._xpcClient enrollContinue];
  }
  if (__osLogTrace) {
    id v29 = __osLogTrace;
  }
  else {
    id v29 = v9;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v29, OS_LOG_TYPE_DEFAULT, "BKEnrollOperation::statusMessage: -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __50__BKEnrollOperation_statusMessage_details_client___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 enrollOperation:*(void *)(a1 + 32) percentCompleted:*(void *)(a1 + 40)];
}

void __50__BKEnrollOperation_statusMessage_details_client___block_invoke_161(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 enrollOperation:*(void *)(a1 + 32) requiredAuthorizationForAccessory:*(void *)(a1 + 40)];
}

- (unsigned)userID
{
  return self->_userID;
}

- (void)setUserID:(unsigned int)a3
{
  self->_uint64_t userID = a3;
}

- (NSData)credentialSet
{
  return self->_credentialSet;
}

- (void)setCredentialSet:(id)a3
{
}

- (BKAccessoryGroup)accessoryGroup
{
  return self->_accessoryGroup;
}

- (void)setAccessoryGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryGroup, 0);
  objc_storeStrong((id *)&self->_credentialSet, 0);
}

@end