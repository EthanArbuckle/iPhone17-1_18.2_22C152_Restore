@interface BKEnrollPearlOperation
- (BKEnrollPearlOperation)initWithDevice:(id)a3;
- (BKIdentity)augmentedIdentity;
- (BOOL)clientToComplete;
- (BOOL)completeWithError:(id *)a3;
- (BOOL)resumeWithError:(id *)a3;
- (BOOL)startWithError:(id *)a3;
- (BOOL)suspendWithError:(id *)a3;
- (id)enrollResultInfoWithServerIdentity:(id)a3 details:(id)a4;
- (id)optionsDictionaryWithError:(id *)a3;
- (int64_t)enrollmentType;
- (int64_t)periocularGlassesRequirement;
- (void)enrollFeedback:(id)a3 client:(unint64_t)a4;
- (void)enrollUpdate:(id)a3 client:(unint64_t)a4;
- (void)setAugmentedIdentity:(id)a3;
- (void)setClientToComplete:(BOOL)a3;
- (void)setEnrollmentType:(int64_t)a3;
- (void)setPeriocularGlassesRequirement:(int64_t)a3;
- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4;
@end

@implementation BKEnrollPearlOperation

- (BKEnrollPearlOperation)initWithDevice:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKEnrollPearlOperation;
  result = [(BKEnrollOperation *)&v4 initWithDevice:a3];
  if (result) {
    result->_enrollmentType = 1;
  }
  return result;
}

- (id)enrollResultInfoWithServerIdentity:(id)a3 details:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [BKEnrollPearlResultInfo alloc];
  v9 = [(BKOperation *)self device];
  v10 = [(BKEnrollPearlResultInfo *)v8 initWithServerIdentity:v7 details:v6 device:v9];

  return v10;
}

- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
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
    LODWORD(v44) = v5;
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKEnrollPearlOperation::statusMessage: %u\n", buf, 8u);
  }
  if (v5 == 1055)
  {
    v9 = self;
    uint64_t v10 = 2;
    goto LABEL_10;
  }
  if (v5 == 1054)
  {
    v9 = self;
    uint64_t v10 = 5;
LABEL_10:
    [(BKOperation *)v9 changeState:v10];
    goto LABEL_11;
  }
  if ((v5 - 63) <= 1)
  {
    v12 = [(BKOperation *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0) {
      goto LABEL_11;
    }
    if (__osLog) {
      v14 = __osLog;
    }
    else {
      v14 = v7;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = [(BKOperation *)self delegate];
      v17 = [(BKOperation *)self delegate];
      *(_DWORD *)buf = 134218498;
      v44 = v16;
      __int16 v45 = 2112;
      v46 = v17;
      __int16 v47 = 1024;
      LODWORD(v48) = v5 == 63;
      _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_DEFAULT, "BKEnrollPearlOperation::statusMessage: %p(%@) faceDetectStateChanged: %d\n", buf, 0x1Cu);
    }
    v18 = [(BKOperation *)self dispatchQueue];
    v19 = v18;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __47__BKEnrollPearlOperation_statusMessage_client___block_invoke;
    v41[3] = &unk_1E6068090;
    v41[4] = self;
    int v42 = v5;
    v20 = v41;
LABEL_33:
    dispatch_async(v18, v20);

    goto LABEL_11;
  }
  if ((v5 - 100) <= 0xFF)
  {
    v21 = [(BKOperation *)self delegate];
    char v22 = objc_opt_respondsToSelector();

    if ((v22 & 1) == 0) {
      goto LABEL_11;
    }
    uint64_t v23 = ((100 * (_WORD)v5 - 10000) & 0xFFFCu) / 0xFF;
    if (__osLog) {
      v24 = __osLog;
    }
    else {
      v24 = v7;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      log = v24;
      v25 = [(BKOperation *)self delegate];
      v26 = [(BKOperation *)self delegate];
      *(_DWORD *)buf = 134218498;
      v44 = v25;
      __int16 v45 = 2112;
      v46 = v26;
      __int16 v47 = 2048;
      uint64_t v48 = ((100 * (_WORD)v5 - 10000) & 0xFFFCu) / 0xFF;
      _os_log_impl(&dword_1B3AF1000, log, OS_LOG_TYPE_DEFAULT, "BKEnrollPearlOperation::statusMessage: %p(%@) progressedWithInfo: %ld\n", buf, 0x20u);

      uint64_t v23 = ((100 * (_WORD)v5 - 10000) & 0xFFFCu) / 0xFF;
    }
    v18 = [(BKOperation *)self dispatchQueue];
    v19 = v18;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__BKEnrollPearlOperation_statusMessage_client___block_invoke_357;
    block[3] = &unk_1E6067BF8;
    block[4] = self;
    block[5] = v23;
    v20 = block;
    goto LABEL_33;
  }
  unsigned int v27 = v5 - 1056;
  if ((v5 - 1056) <= 0x19 && ((1 << v27) & 0x2A61163) != 0)
  {
    v28 = [(BKOperation *)self delegate];
    char v29 = objc_opt_respondsToSelector();

    if (v29)
    {
      if (v27 > 0x19) {
        uint64_t v30 = 2;
      }
      else {
        uint64_t v30 = qword_1B3B36ED8[v27];
      }
      if (__osLog) {
        v31 = __osLog;
      }
      else {
        v31 = v7;
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        loga = v31;
        [(BKOperation *)self delegate];
        v33 = uint64_t v32 = v30;
        v34 = [(BKOperation *)self delegate];
        *(_DWORD *)buf = 134218498;
        v44 = v33;
        __int16 v45 = 2112;
        v46 = v34;
        __int16 v47 = 2048;
        uint64_t v48 = v32;
        _os_log_impl(&dword_1B3AF1000, loga, OS_LOG_TYPE_DEFAULT, "BKEnrollPearlOperation::statusMessage: %p(%@) failedWithReason: %ld\n", buf, 0x20u);

        uint64_t v30 = v32;
      }
      v35 = [(BKOperation *)self dispatchQueue];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __47__BKEnrollPearlOperation_statusMessage_client___block_invoke_361;
      v39[3] = &unk_1E6067BF8;
      v39[4] = self;
      v39[5] = v30;
      dispatch_async(v35, v39);
    }
    [(BKOperation *)self operationEndsWithReason:3];
  }
LABEL_11:
  v38.receiver = self;
  v38.super_class = (Class)BKEnrollPearlOperation;
  [(BKEnrollOperation *)&v38 statusMessage:v5 client:a4];
  if (__osLogTrace) {
    v11 = __osLogTrace;
  }
  else {
    v11 = v7;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v11, OS_LOG_TYPE_DEFAULT, "BKEnrollPearlOperation::statusMessage: -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __47__BKEnrollPearlOperation_statusMessage_client___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [[BKFaceDetectStateInfo alloc] initWithPresenceState:*(_DWORD *)(a1 + 40) == 63];
  [v4 operation:v2 faceDetectStateChanged:v3];
}

void __47__BKEnrollPearlOperation_statusMessage_client___block_invoke_357(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [[BKEnrollPearlProgressInfo alloc] initWithPercents:*(void *)(a1 + 40)];
  [v4 enrollOperation:v2 progressedWithInfo:v3];
}

void __47__BKEnrollPearlOperation_statusMessage_client___block_invoke_361(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 enrollOperation:*(void *)(a1 + 32) failedWithReason:*(void *)(a1 + 40)];
}

- (void)enrollUpdate:(id)a3 client:(unint64_t)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  kdebug_trace();
  if (!v5)
  {
    if (__osLog) {
      v34 = __osLog;
    }
    else {
      v34 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 136316162;
    v41 = "enrollData";
    __int16 v42 = 2048;
    v43 = 0;
    __int16 v44 = 2080;
    __int16 v45 = &unk_1B3B370EE;
    __int16 v46 = 2080;
    __int16 v47 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    __int16 v48 = 1024;
    int v49 = 807;
LABEL_42:
    _os_log_impl(&dword_1B3AF1000, v34, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_21;
  }
  unint64_t v6 = [v5 length];
  if (v6 <= 0x31)
  {
    if (__osLog) {
      v34 = __osLog;
    }
    else {
      v34 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 136316162;
    v41 = "dataLength >= __builtin_offsetof(pearl_enrollment_info_t, poseBinStatus)";
    __int16 v42 = 2048;
    v43 = 0;
    __int16 v44 = 2080;
    __int16 v45 = &unk_1B3B370EE;
    __int16 v46 = 2080;
    __int16 v47 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    __int16 v48 = 1024;
    int v49 = 810;
    goto LABEL_42;
  }
  unint64_t v7 = v6;
  uint64_t v8 = [v5 bytes];
  if (!v8)
  {
    if (__osLog) {
      v34 = __osLog;
    }
    else {
      v34 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 136316162;
    v41 = "enrollInfo";
    __int16 v42 = 2048;
    v43 = 0;
    __int16 v44 = 2080;
    __int16 v45 = &unk_1B3B370EE;
    __int16 v46 = 2080;
    __int16 v47 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    __int16 v48 = 1024;
    int v49 = 813;
    goto LABEL_42;
  }
  uint64_t v9 = v8;
  if (v7 < *(unsigned __int16 *)(v8 + 48) * (unint64_t)*(unsigned __int16 *)(v8 + 46) + 50)
  {
    if (__osLog) {
      v34 = __osLog;
    }
    else {
      v34 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 136316162;
    v41 = "dataLength >= __builtin_offsetof(pearl_enrollment_info_t, poseBinStatus) + (uint64_t)enrollInfo->pitchBinsCoun"
          "t * enrollInfo->yawBinsCount";
    __int16 v42 = 2048;
    v43 = 0;
    __int16 v44 = 2080;
    __int16 v45 = &unk_1B3B370EE;
    __int16 v46 = 2080;
    __int16 v47 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    __int16 v48 = 1024;
    int v49 = 814;
    goto LABEL_42;
  }
  uint64_t v10 = [(BKOperation *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [[BKFaceDetectStateInfo alloc] initFromFaceInfo:v9 + 4];
    char v13 = [(BKOperation *)self dispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__BKEnrollPearlOperation_enrollUpdate_client___block_invoke;
    block[3] = &unk_1E6068040;
    block[4] = self;
    id v39 = v12;
    id v14 = v12;
    dispatch_async(v13, block);
  }
  v15 = [(BKOperation *)self delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    v17 = (void *)*(unsigned __int16 *)(v9 + 2);
    if (__osLog) {
      v18 = __osLog;
    }
    else {
      v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      v20 = [(BKOperation *)self delegate];
      v21 = [(BKOperation *)self delegate];
      *(_DWORD *)buf = 134218498;
      v41 = v20;
      __int16 v42 = 2112;
      v43 = v21;
      __int16 v44 = 2048;
      __int16 v45 = v17;
      _os_log_impl(&dword_1B3AF1000, v19, OS_LOG_TYPE_DEFAULT, "BKEnrollPearlOperation::enrollUpdate: %p(%@) percentCompleted: %ld\n", buf, 0x20u);
    }
    char v22 = [(BKOperation *)self dispatchQueue];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __46__BKEnrollPearlOperation_enrollUpdate_client___block_invoke_368;
    v37[3] = &unk_1E6067BF8;
    v37[4] = self;
    v37[5] = v17;
    dispatch_async(v22, v37);
  }
  uint64_t v23 = [(BKOperation *)self delegate];
  char v24 = objc_opt_respondsToSelector();

  if (v24)
  {
    id v25 = [[BKEnrollPearlProgressInfo alloc] initFromEnrollInfo:v9];
    if (__osLog) {
      v26 = __osLog;
    }
    else {
      v26 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v27 = v26;
      v28 = [(BKOperation *)self delegate];
      char v29 = [(BKOperation *)self delegate];
      uint64_t v30 = [v25 percentageCompleted];
      v31 = [v25 enrolledPoses];
      *(_DWORD *)buf = 134218754;
      v41 = v28;
      __int16 v42 = 2112;
      v43 = v29;
      __int16 v44 = 2048;
      __int16 v45 = (void *)v30;
      __int16 v46 = 2112;
      __int16 v47 = v31;
      _os_log_impl(&dword_1B3AF1000, v27, OS_LOG_TYPE_DEFAULT, "BKEnrollPearlOperation::enrollUpdate: %p(%@) progressedWithInfo: percentageCompleted=%ld enrolledPoses=%@\n", buf, 0x2Au);
    }
    uint64_t v32 = [(BKOperation *)self dispatchQueue];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __46__BKEnrollPearlOperation_enrollUpdate_client___block_invoke_369;
    v35[3] = &unk_1E6068040;
    v35[4] = self;
    id v36 = v25;
    id v33 = v25;
    dispatch_async(v32, v35);
  }
LABEL_21:
  kdebug_trace();
}

void __46__BKEnrollPearlOperation_enrollUpdate_client___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 operation:*(void *)(a1 + 32) faceDetectStateChanged:*(void *)(a1 + 40)];
}

void __46__BKEnrollPearlOperation_enrollUpdate_client___block_invoke_368(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 enrollOperation:*(void *)(a1 + 32) percentCompleted:*(void *)(a1 + 40)];
}

void __46__BKEnrollPearlOperation_enrollUpdate_client___block_invoke_369(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 enrollOperation:*(void *)(a1 + 32) progressedWithInfo:*(void *)(a1 + 40)];
}

- (void)enrollFeedback:(id)a3 client:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = v5;
  if (!v5)
  {
    if (__osLog) {
      id v14 = __osLog;
    }
    else {
      id v14 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136316162;
    v18 = "enrollData";
    __int16 v19 = 2048;
    uint64_t v20 = 0;
    __int16 v21 = 2080;
    char v22 = &unk_1B3B370EE;
    __int16 v23 = 2080;
    char v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    __int16 v25 = 1024;
    int v26 = 853;
LABEL_22:
    _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    goto LABEL_6;
  }
  if ((unint64_t)[v5 length] <= 0x29)
  {
    if (__osLog) {
      id v14 = __osLog;
    }
    else {
      id v14 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136316162;
    v18 = "dataLength >= sizeof(pearl_face_detect_info_t)";
    __int16 v19 = 2048;
    uint64_t v20 = 0;
    __int16 v21 = 2080;
    char v22 = &unk_1B3B370EE;
    __int16 v23 = 2080;
    char v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    __int16 v25 = 1024;
    int v26 = 856;
    goto LABEL_22;
  }
  uint64_t v7 = [v6 bytes];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = [(BKOperation *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [[BKFaceDetectStateInfo alloc] initFromFaceInfo:v8];
      id v12 = [(BKOperation *)self dispatchQueue];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __48__BKEnrollPearlOperation_enrollFeedback_client___block_invoke;
      v15[3] = &unk_1E6068040;
      v15[4] = self;
      id v16 = v11;
      id v13 = v11;
      dispatch_async(v12, v15);
    }
    goto LABEL_6;
  }
  if (__osLog) {
    id v14 = __osLog;
  }
  else {
    id v14 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v18 = "info";
    __int16 v19 = 2048;
    uint64_t v20 = 0;
    __int16 v21 = 2080;
    char v22 = &unk_1B3B370EE;
    __int16 v23 = 2080;
    char v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    __int16 v25 = 1024;
    int v26 = 859;
    goto LABEL_22;
  }
LABEL_6:
}

void __48__BKEnrollPearlOperation_enrollFeedback_client___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 operation:*(void *)(a1 + 32) faceDetectStateChanged:*(void *)(a1 + 40)];
}

- (id)optionsDictionaryWithError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)BKEnrollPearlOperation;
  id v5 = -[BKEnrollOperation optionsDictionaryWithError:](&v16, sel_optionsDictionaryWithError_);
  if (!v5)
  {
    if (__osLog) {
      v15 = __osLog;
    }
    else {
      v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v18 = "superOptions";
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      char v22 = &unk_1B3B370EE;
      __int16 v23 = 2080;
      char v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      __int16 v25 = 1024;
      int v26 = 883;
      _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    id v7 = 0;
    goto LABEL_18;
  }
  unint64_t v6 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v5];
  id v7 = v6;
  if (self->_clientToComplete) {
    [v6 setObject:MEMORY[0x1E4F1CC38] forKey:@"BKOptionEnrollClientToComplete"];
  }
  if ((unint64_t)(self->_enrollmentType - 1) >= 3)
  {
    if (__osLog) {
      id v13 = __osLog;
    }
    else {
      id v13 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136316162;
    v18 = "0";
    __int16 v19 = 2048;
    uint64_t v20 = 0;
    __int16 v21 = 2080;
    char v22 = &unk_1B3B370EE;
    __int16 v23 = 2080;
    char v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    __int16 v25 = 1024;
    int v26 = 900;
  }
  else
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    [v7 setObject:v8 forKey:@"BKOptionFaceIDEnrollType"];

    augmentedIdentity = self->_augmentedIdentity;
    if (augmentedIdentity)
    {
      char v10 = [(BKIdentity *)augmentedIdentity serverIdentity];
      [v7 setObject:v10 forKey:@"BKOptionEnrollAugmentedIdentity"];
    }
    if (self->_enrollmentType != 3) {
      goto LABEL_10;
    }
    if (self->_periocularGlassesRequirement < 3uLL)
    {
      id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
      [v7 setObject:v11 forKey:@"BKOptionFaceIDEnrollGlassesRequirement"];

LABEL_10:
      id v7 = v7;
      id v12 = v7;
      goto LABEL_19;
    }
    if (__osLog) {
      id v13 = __osLog;
    }
    else {
      id v13 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 136316162;
    v18 = "0";
    __int16 v19 = 2048;
    uint64_t v20 = 0;
    __int16 v21 = 2080;
    char v22 = &unk_1B3B370EE;
    __int16 v23 = 2080;
    char v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    __int16 v25 = 1024;
    int v26 = 918;
  }
  _os_log_impl(&dword_1B3AF1000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
LABEL_17:
  setError((id)1, a3);
LABEL_18:
  id v12 = 0;
LABEL_19:

  return v12;
}

- (BOOL)startWithError:(id *)a3
{
  *(void *)&v19[5] = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  id v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    unint64_t v6 = __osLogTrace;
  }
  else {
    unint64_t v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super.super._xpcClient;
    uint64_t v8 = v6;
    *(_DWORD *)buf = 134217984;
    *(void *)__int16 v19 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKEnrollPearlOperation:start (_cid %lu)\n", buf, 0xCu);
  }
  v17.receiver = self;
  v17.super_class = (Class)BKEnrollPearlOperation;
  unsigned __int8 v9 = [(BKOperation *)&v17 startWithError:a3];
  BOOL v10 = v9;
  if (__osLogTrace) {
    id v11 = __osLogTrace;
  }
  else {
    id v11 = v5;
  }
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        id v12 = *a3;
      }
      else {
        id v12 = 0;
      }
      *(_DWORD *)buf = 67109378;
      v19[0] = 1;
      LOWORD(v19[1]) = 2112;
      *(void *)((char *)&v19[1] + 2) = v12;
      id v14 = v11;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
LABEL_20:
      _os_log_impl(&dword_1B3AF1000, v14, v15, "BKEnrollPearlOperation:start -> %d %@\n", buf, 0x12u);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    if (a3) {
      id v13 = *a3;
    }
    else {
      id v13 = 0;
    }
    *(_DWORD *)buf = 67109378;
    v19[0] = 0;
    LOWORD(v19[1]) = 2112;
    *(void *)((char *)&v19[1] + 2) = v13;
    id v14 = v11;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    goto LABEL_20;
  }
  kdebug_trace();
  return v10;
}

- (BOOL)completeWithError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  id v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    unint64_t v6 = __osLogTrace;
  }
  else {
    unint64_t v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super.super._xpcClient;
    uint64_t v8 = v6;
    int v19 = 134217984;
    *(void *)uint64_t v20 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKEnrollPearlOperation:complete (_cid %lu)\n", (uint8_t *)&v19, 0xCu);
  }
  int v9 = [(BiometricKitXPCClient *)self->super.super._xpcClient completeEnrollment];
  BOOL v10 = (void *)v9;
  if (v9)
  {
    if (__osLog) {
      objc_super v16 = __osLog;
    }
    else {
      objc_super v16 = v5;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136316162;
      *(void *)uint64_t v20 = "err == 0 ";
      *(_WORD *)&v20[8] = 2048;
      *(void *)&v20[10] = v10;
      __int16 v21 = 2080;
      char v22 = &unk_1B3B370EE;
      __int16 v23 = 2080;
      char v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      __int16 v25 = 1024;
      int v26 = 963;
      _os_log_impl(&dword_1B3AF1000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
    }
    setErrorWithOSStatus(v10, a3);
    if (__osLogTrace) {
      objc_super v17 = __osLogTrace;
    }
    else {
      objc_super v17 = v5;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      if (a3) {
        id v18 = *a3;
      }
      else {
        id v18 = 0;
      }
      int v19 = 67109378;
      *(_DWORD *)uint64_t v20 = 0;
      *(_WORD *)&v20[4] = 2112;
      *(void *)&v20[6] = v18;
      id v13 = v17;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  else
  {
    if (__osLogTrace) {
      id v11 = __osLogTrace;
    }
    else {
      id v11 = v5;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        id v12 = *a3;
      }
      else {
        id v12 = 0;
      }
      int v19 = 67109378;
      *(_DWORD *)uint64_t v20 = 1;
      *(_WORD *)&v20[4] = 2112;
      *(void *)&v20[6] = v12;
      id v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1B3AF1000, v13, v14, "BKEnrollPearlOperation:complete -> %d %@\n", (uint8_t *)&v19, 0x12u);
    }
  }
  kdebug_trace();
  return v10 == 0;
}

- (BOOL)suspendWithError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  id v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    unint64_t v6 = __osLogTrace;
  }
  else {
    unint64_t v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super.super._xpcClient;
    uint64_t v8 = v6;
    int v19 = 134217984;
    *(void *)uint64_t v20 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKEnrollPearlOperation:suspend (_cid %lu)\n", (uint8_t *)&v19, 0xCu);
  }
  int v9 = [(BiometricKitXPCClient *)self->super.super._xpcClient suspendEnrollment:1];
  BOOL v10 = (void *)v9;
  if (v9)
  {
    if (__osLog) {
      objc_super v16 = __osLog;
    }
    else {
      objc_super v16 = v5;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136316162;
      *(void *)uint64_t v20 = "err == 0 ";
      *(_WORD *)&v20[8] = 2048;
      *(void *)&v20[10] = v10;
      __int16 v21 = 2080;
      char v22 = &unk_1B3B370EE;
      __int16 v23 = 2080;
      char v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      __int16 v25 = 1024;
      int v26 = 987;
      _os_log_impl(&dword_1B3AF1000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
    }
    setErrorWithOSStatus(v10, a3);
    if (__osLogTrace) {
      objc_super v17 = __osLogTrace;
    }
    else {
      objc_super v17 = v5;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      if (a3) {
        id v18 = *a3;
      }
      else {
        id v18 = 0;
      }
      int v19 = 67109378;
      *(_DWORD *)uint64_t v20 = 0;
      *(_WORD *)&v20[4] = 2112;
      *(void *)&v20[6] = v18;
      id v13 = v17;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  else
  {
    if (__osLogTrace) {
      id v11 = __osLogTrace;
    }
    else {
      id v11 = v5;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        id v12 = *a3;
      }
      else {
        id v12 = 0;
      }
      int v19 = 67109378;
      *(_DWORD *)uint64_t v20 = 1;
      *(_WORD *)&v20[4] = 2112;
      *(void *)&v20[6] = v12;
      id v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1B3AF1000, v13, v14, "BKEnrollPearlOperation:suspend -> %d %@\n", (uint8_t *)&v19, 0x12u);
    }
  }
  kdebug_trace();
  return v10 == 0;
}

- (BOOL)resumeWithError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  id v5 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    unint64_t v6 = __osLogTrace;
  }
  else {
    unint64_t v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super.super._xpcClient;
    uint64_t v8 = v6;
    int v19 = 134217984;
    *(void *)uint64_t v20 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v8, OS_LOG_TYPE_DEFAULT, "BKEnrollPearlOperation:resume (_cid %lu)\n", (uint8_t *)&v19, 0xCu);
  }
  int v9 = [(BiometricKitXPCClient *)self->super.super._xpcClient suspendEnrollment:0];
  BOOL v10 = (void *)v9;
  if (v9)
  {
    if (__osLog) {
      objc_super v16 = __osLog;
    }
    else {
      objc_super v16 = v5;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136316162;
      *(void *)uint64_t v20 = "err == 0 ";
      *(_WORD *)&v20[8] = 2048;
      *(void *)&v20[10] = v10;
      __int16 v21 = 2080;
      char v22 = &unk_1B3B370EE;
      __int16 v23 = 2080;
      char v24 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
      __int16 v25 = 1024;
      int v26 = 1011;
      _os_log_impl(&dword_1B3AF1000, v16, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v19, 0x30u);
    }
    setErrorWithOSStatus(v10, a3);
    if (__osLogTrace) {
      objc_super v17 = __osLogTrace;
    }
    else {
      objc_super v17 = v5;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      if (a3) {
        id v18 = *a3;
      }
      else {
        id v18 = 0;
      }
      int v19 = 67109378;
      *(_DWORD *)uint64_t v20 = 0;
      *(_WORD *)&v20[4] = 2112;
      *(void *)&v20[6] = v18;
      id v13 = v17;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }
  }
  else
  {
    if (__osLogTrace) {
      id v11 = __osLogTrace;
    }
    else {
      id v11 = v5;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        id v12 = *a3;
      }
      else {
        id v12 = 0;
      }
      int v19 = 67109378;
      *(_DWORD *)uint64_t v20 = 1;
      *(_WORD *)&v20[4] = 2112;
      *(void *)&v20[6] = v12;
      id v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
      _os_log_impl(&dword_1B3AF1000, v13, v14, "BKEnrollPearlOperation:resume -> %d %@\n", (uint8_t *)&v19, 0x12u);
    }
  }
  kdebug_trace();
  return v10 == 0;
}

- (int64_t)enrollmentType
{
  return self->_enrollmentType;
}

- (void)setEnrollmentType:(int64_t)a3
{
  self->_enrollmentType = a3;
}

- (BOOL)clientToComplete
{
  return self->_clientToComplete;
}

- (void)setClientToComplete:(BOOL)a3
{
  self->_clientToComplete = a3;
}

- (BKIdentity)augmentedIdentity
{
  return self->_augmentedIdentity;
}

- (void)setAugmentedIdentity:(id)a3
{
}

- (int64_t)periocularGlassesRequirement
{
  return self->_periocularGlassesRequirement;
}

- (void)setPeriocularGlassesRequirement:(int64_t)a3
{
  self->_periocularGlassesRequirement = a3;
}

- (void).cxx_destruct
{
}

@end