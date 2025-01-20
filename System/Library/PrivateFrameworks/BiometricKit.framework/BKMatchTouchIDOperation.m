@interface BKMatchTouchIDOperation
- (BOOL)requireFingerOff;
- (id)optionsDictionaryWithError:(id *)a3;
- (void)setRequireFingerOff:(BOOL)a3;
- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4;
@end

@implementation BKMatchTouchIDOperation

- (id)optionsDictionaryWithError:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)BKMatchTouchIDOperation;
  v4 = [(BKMatchOperation *)&v10 optionsDictionaryWithError:a3];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v4];
    v6 = v5;
    if (self->_requireFingerOff) {
      [v5 setObject:MEMORY[0x1E4F1CC38] forKey:@"BKOptionMatchRequireFingerOff"];
    }
    id v7 = v6;
  }
  else
  {
    if (__osLog) {
      v9 = __osLog;
    }
    else {
      v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v12 = "superOptions";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2080;
      v16 = &unk_1B3B370EE;
      __int16 v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDeviceTouchID.m";
      __int16 v19 = 1024;
      int v20 = 328;
      _os_log_impl(&dword_1B3AF1000, v9, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v7 = 0;
  }

  return v7;
}

- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  id v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v8 = __osLogTrace;
  }
  else {
    v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v22) = v5;
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKMatchTouchIDOperation::statusMessage: %u\n", buf, 8u);
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
        __int16 v13 = __osLog;
      }
      else {
        __int16 v13 = v7;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = v13;
        __int16 v15 = [(BKOperation *)self delegate];
        v16 = [(BKOperation *)self delegate];
        *(_DWORD *)buf = 134218498;
        v22 = v15;
        __int16 v23 = 2112;
        v24 = v16;
        __int16 v25 = 2048;
        uint64_t v26 = v10;
        _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_DEFAULT, "BKMatchTouchIDOperation::statusMessage: %p(%@) encounteredCaptureError: %ld\n", buf, 0x20u);
      }
      __int16 v17 = [(BKOperation *)self dispatchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__BKMatchTouchIDOperation_statusMessage_client___block_invoke;
      block[3] = &unk_1E6067BF8;
      block[4] = self;
      block[5] = v10;
      dispatch_async(v17, block);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)BKMatchTouchIDOperation;
  [(BKMatchOperation *)&v19 statusMessage:v5 client:a4];
  if (__osLogTrace) {
    v18 = __osLogTrace;
  }
  else {
    v18 = v7;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v18, OS_LOG_TYPE_DEFAULT, "BKMatchTouchIDOperation::statusMessage: -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __48__BKMatchTouchIDOperation_statusMessage_client___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 fingerprintCaptureOperation:*(void *)(a1 + 32) encounteredCaptureError:*(void *)(a1 + 40)];
}

- (BOOL)requireFingerOff
{
  return self->_requireFingerOff;
}

- (void)setRequireFingerOff:(BOOL)a3
{
  self->_requireFingerOff = a3;
}

@end