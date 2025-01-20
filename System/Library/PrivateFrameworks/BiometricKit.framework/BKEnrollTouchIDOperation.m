@interface BKEnrollTouchIDOperation
- (BKEnrollTouchIDOperation)initWithDevice:(id)a3;
- (BOOL)startWithError:(id *)a3;
- (id)createEnrollProgressInfo:(unsigned int)a3;
- (void)dealloc;
- (void)enrollResult:(id)a3 details:(id)a4 client:(unint64_t)a5;
- (void)homeButtonPressed:(unint64_t)a3;
- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4;
@end

@implementation BKEnrollTouchIDOperation

- (BKEnrollTouchIDOperation)initWithDevice:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKEnrollTouchIDOperation;
  v3 = [(BKEnrollOperation *)&v6 initWithDevice:a3];
  v4 = v3;
  if (v3) {
    ComponentSetInit(&v3->_compSet.count);
  }
  return v4;
}

- (void)dealloc
{
  double v3 = ComponentSetRelease(&self->_compSet.count);
  v4.receiver = self;
  v4.super_class = (Class)BKEnrollTouchIDOperation;
  [(BKOperation *)&v4 dealloc];
}

- (BOOL)startWithError:(id *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKEnrollTouchIDOperation;
  return [(BKOperation *)&v4 startWithError:a3];
}

- (id)createEnrollProgressInfo:(unsigned int)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  memset(v22, 0, 512);
  memset(&v11[480], 0, 32);
  -[BiometricKitXPCClient pullAlignmentData](self->super.super._xpcClient, "pullAlignmentData", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  objc_super v4 = 0);
  v5 = v4;
  if (!v4)
  {
    if (__osLog) {
      v9 = __osLog;
    }
    else {
      v9 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    int v12 = 136316162;
    v13 = "alignmentData";
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2080;
    v17 = &unk_1B3B370EE;
    __int16 v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDeviceTouchID.m";
    __int16 v20 = 1024;
    int v21 = 110;
    goto LABEL_28;
  }
  [v4 getBytes:v22 length:3060];
  if (SWORD3(v22[0]) >= 300)
  {
    if (__osLog) {
      v9 = __osLog;
    }
    else {
      v9 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    int v12 = 136316162;
    v13 = "topology.nodeAdded < 300";
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2080;
    v17 = &unk_1B3B370EE;
    __int16 v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDeviceTouchID.m";
    __int16 v20 = 1024;
    int v21 = 114;
    goto LABEL_28;
  }
  int v6 = ComponentSetUpdate();
  if (v6)
  {
    int v10 = v6;
    if (__osLog) {
      v9 = __osLog;
    }
    else {
      v9 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    int v12 = 136316162;
    v13 = "err == 0 ";
    __int16 v14 = 2048;
    uint64_t v15 = v10;
    __int16 v16 = 2080;
    v17 = &unk_1B3B370EE;
    __int16 v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDeviceTouchID.m";
    __int16 v20 = 1024;
    int v21 = 117;
    goto LABEL_28;
  }
  v7 = GenerateEnrollProgressInfo((uint64_t)v11, a3, 0);
  if (v7) {
    goto LABEL_5;
  }
  if (__osLog) {
    v9 = __osLog;
  }
  else {
    v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136316162;
    v13 = "info != ((void *)0)";
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2080;
    v17 = &unk_1B3B370EE;
    __int16 v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDeviceTouchID.m";
    __int16 v20 = 1024;
    int v21 = 122;
LABEL_28:
    _os_log_impl(&dword_1B3AF1000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
  }
LABEL_29:
  v7 = 0;
LABEL_5:

  return v7;
}

- (void)enrollResult:(id)a3 details:(id)a4 client:(unint64_t)a5
{
  v5.receiver = self;
  v5.super_class = (Class)BKEnrollTouchIDOperation;
  [(BKEnrollOperation *)&v5 enrollResult:a3 details:a4 client:a5];
}

- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
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
    *(_DWORD *)buf = 67109120;
    LODWORD(v28) = v5;
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKEnrollTouchIDOperation::statusMessage: %u\n", buf, 8u);
  }
  if ((v5 - 100) > 0xFF)
  {
    uint64_t v13 = __statusToFingerprintCaptureError(v5);
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = [(BKOperation *)self delegate];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        if (__osLog) {
          v17 = __osLog;
        }
        else {
          v17 = v7;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v18 = v17;
          v19 = [(BKOperation *)self delegate];
          __int16 v20 = [(BKOperation *)self delegate];
          *(_DWORD *)buf = 134218498;
          v28 = v19;
          __int16 v29 = 2112;
          v30 = v20;
          __int16 v31 = 2048;
          uint64_t v32 = v14;
          _os_log_impl(&dword_1B3AF1000, v18, OS_LOG_TYPE_DEFAULT, "BKEnrollTouchIDOperation::statusMessage: %p(%@) encounteredCaptureError: %ld\n", buf, 0x20u);
        }
        int v21 = [(BKOperation *)self dispatchQueue];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __49__BKEnrollTouchIDOperation_statusMessage_client___block_invoke_17;
        v24[3] = &unk_1E6067BF8;
        v24[4] = self;
        v24[5] = v14;
        dispatch_async(v21, v24);
      }
    }
  }
  else
  {
    v9 = -[BKEnrollTouchIDOperation createEnrollProgressInfo:](self, "createEnrollProgressInfo:");
    int v10 = [(BKOperation *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      int v12 = [(BKOperation *)self dispatchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__BKEnrollTouchIDOperation_statusMessage_client___block_invoke;
      block[3] = &unk_1E6068040;
      block[4] = self;
      id v26 = v9;
      dispatch_async(v12, block);
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)BKEnrollTouchIDOperation;
  [(BKEnrollOperation *)&v23 statusMessage:v5 client:a4];
  if (__osLogTrace) {
    v22 = __osLogTrace;
  }
  else {
    v22 = v7;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v22, OS_LOG_TYPE_DEFAULT, "BKEnrollTouchIDOperation::statusMessage: -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __49__BKEnrollTouchIDOperation_statusMessage_client___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 enrollOperation:*(void *)(a1 + 32) progressedWithTouchIDInfo:*(void *)(a1 + 40)];
}

void __49__BKEnrollTouchIDOperation_statusMessage_client___block_invoke_17(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 fingerprintCaptureOperation:*(void *)(a1 + 32) encounteredCaptureError:*(void *)(a1 + 40)];
}

- (void)homeButtonPressed:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v4 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    uint64_t v5 = __osLogTrace;
  }
  else {
    uint64_t v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v5, OS_LOG_TYPE_DEFAULT, "BKEnrollTouchIDOperation::homeButtonPressed\n", buf, 2u);
  }
  int v6 = [(BKOperation *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    if (__osLog) {
      v8 = __osLog;
    }
    else {
      v8 = v4;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      int v10 = [(BKOperation *)self delegate];
      char v11 = [(BKOperation *)self delegate];
      *(_DWORD *)buf = 134218242;
      char v16 = v10;
      __int16 v17 = 2112;
      __int16 v18 = v11;
      _os_log_impl(&dword_1B3AF1000, v9, OS_LOG_TYPE_DEFAULT, "BKEnrollTouchIDOperation::homeButtonPressed: %p(%@) homeButtonPressedInEnrollOperation\n", buf, 0x16u);
    }
    int v12 = [(BKOperation *)self dispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__BKEnrollTouchIDOperation_homeButtonPressed___block_invoke;
    block[3] = &unk_1E6067CD8;
    block[4] = self;
    dispatch_async(v12, block);
  }
  if (__osLogTrace) {
    uint64_t v13 = __osLogTrace;
  }
  else {
    uint64_t v13 = v4;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_DEFAULT, "BKEnrollTouchIDOperation::homeButtonPressed: -> void\n", buf, 2u);
  }
}

void __46__BKEnrollTouchIDOperation_homeButtonPressed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 touchIDButtonPressedInOperation:*(void *)(a1 + 32)];
}

@end