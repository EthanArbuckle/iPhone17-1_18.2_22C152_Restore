@interface BKFaceDetectOperation
- (BKFaceDetectOperation)initWithDevice:(id)a3;
- (BOOL)eyeRelief;
- (BOOL)highPriority;
- (BOOL)motionDetect;
- (double)timeout;
- (int64_t)mode;
- (void)setEyeRelief:(BOOL)a3;
- (void)setHighPriority:(BOOL)a3;
- (void)setMode:(int64_t)a3;
- (void)setMotionDetect:(BOOL)a3;
- (void)setTimeout:(double)a3;
- (void)startBioOperation:(BOOL)a3 reply:(id)a4;
- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4;
- (void)statusMessage:(unsigned int)a3 details:(id)a4 client:(unint64_t)a5;
@end

@implementation BKFaceDetectOperation

- (BKFaceDetectOperation)initWithDevice:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKFaceDetectOperation;
  result = [(BKOperation *)&v4 initWithDevice:a3];
  if (result)
  {
    result->_mode = 2;
    result->_timeout = -1.0;
  }
  return result;
}

- (void)startBioOperation:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
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
    xpcClient = self->super.super._xpcClient;
    v10 = v8;
    *(_DWORD *)buf = 134217984;
    v26 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKFaceDetectOperation::startBioOperation (_cid %lu)\n", buf, 0xCu);
  }
  v11 = [MEMORY[0x1E4F1CA60] dictionary];
  v12 = v11;
  int64_t mode = self->_mode;
  if (mode == 1)
  {
    v14 = &unk_1F0C52B08;
    goto LABEL_10;
  }
  if (mode == 2)
  {
    v14 = &unk_1F0C52B20;
LABEL_10:
    [v11 setObject:v14 forKey:@"BKOptionPresenceDetectMode"];
    v15 = [NSNumber numberWithDouble:self->_timeout];
    [v12 setObject:v15 forKey:@"BKOptionPresenceDetectTimeout"];

    v16 = [NSNumber numberWithBool:self->_highPriority];
    [v12 setObject:v16 forKey:@"BKOptionPresenceDetectHighPriority"];

    v17 = [NSNumber numberWithBool:self->_eyeRelief];
    [v12 setObject:v17 forKey:@"BKOptionPresenceDetectEyeRelief"];

    v18 = [NSNumber numberWithBool:self->_motionDetect];
    [v12 setObject:v18 forKey:@"BKOptionPresenceDetectMotion"];

    v19 = self->super.super._xpcClient;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __49__BKFaceDetectOperation_startBioOperation_reply___block_invoke;
    v23[3] = &unk_1E6067D28;
    id v24 = v6;
    [(BiometricKitXPCClient *)v19 detectPresenceWithOptions:v12 async:v4 withReply:v23];
    v20 = v24;
    goto LABEL_17;
  }
  if (__osLog) {
    v21 = __osLog;
  }
  else {
    v21 = v7;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v26 = "0";
    __int16 v27 = 2048;
    uint64_t v28 = 0;
    __int16 v29 = 2080;
    v30 = &unk_1B3B370EE;
    __int16 v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKDevicePearl.m";
    __int16 v33 = 1024;
    int v34 = 487;
    _os_log_impl(&dword_1B3AF1000, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  v20 = +[BKErrorHelper errorWithCode:1];
  (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v20);
LABEL_17:

  if (__osLogTrace) {
    v22 = __osLogTrace;
  }
  else {
    v22 = v7;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v22, OS_LOG_TYPE_DEFAULT, "BKFaceDetectOperation::startBioOperation -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __49__BKFaceDetectOperation_startBioOperation_reply___block_invoke(uint64_t a1, uint64_t a2)
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

- (void)statusMessage:(unsigned int)a3 client:(unint64_t)a4
{
}

- (void)statusMessage:(unsigned int)a3 details:(id)a4 client:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
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
    *(_DWORD *)buf = 67109120;
    LODWORD(v36) = v6;
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKFaceDetectOperation::statusMessage: %u\n", buf, 8u);
  }
  if ((int)v6 > 1050)
  {
    if (v6 != 1051)
    {
      if (v6 != 1076) {
        goto LABEL_29;
      }
      v19 = [(BKOperation *)self delegate];
      char v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) == 0) {
        goto LABEL_29;
      }
      if (__osLog) {
        v21 = __osLog;
      }
      else {
        v21 = v9;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        v23 = [(BKOperation *)self delegate];
        id v24 = [(BKOperation *)self delegate];
        *(_DWORD *)buf = 134218242;
        v36 = v23;
        __int16 v37 = 2112;
        v38 = v24;
        _os_log_impl(&dword_1B3AF1000, v22, OS_LOG_TYPE_DEFAULT, "BKFaceDetectOperation::statusMessage: %p(%@) motionDetectStateChanged\n", buf, 0x16u);
      }
      v25 = [(BKOperation *)self dispatchQueue];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __54__BKFaceDetectOperation_statusMessage_details_client___block_invoke_263;
      v30[3] = &unk_1E6068040;
      v30[4] = self;
      id v31 = v8;
      dispatch_async(v25, v30);

      v18 = v31;
LABEL_24:

      goto LABEL_29;
    }
    v26 = self;
    uint64_t v27 = 4;
    goto LABEL_28;
  }
  if ((v6 - 63) < 2)
  {
    v11 = [(BKOperation *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0) {
      goto LABEL_29;
    }
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
      v36 = v15;
      __int16 v37 = 2112;
      v38 = v16;
      __int16 v39 = 1024;
      BOOL v40 = v6 == 63;
      _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_DEFAULT, "BKFaceDetectOperation::statusMessage: %p(%@) faceDetectStateChanged: %d\n", buf, 0x1Cu);
    }
    v17 = [(BKOperation *)self dispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__BKFaceDetectOperation_statusMessage_details_client___block_invoke;
    block[3] = &unk_1E6068220;
    block[4] = self;
    int v34 = v6;
    id v33 = v8;
    dispatch_async(v17, block);

    v18 = v33;
    goto LABEL_24;
  }
  if (v6 == 1050)
  {
    v26 = self;
    uint64_t v27 = 1;
LABEL_28:
    [(BKOperation *)v26 operationEndsWithReason:v27];
  }
LABEL_29:
  v29.receiver = self;
  v29.super_class = (Class)BKFaceDetectOperation;
  [(BKOperation *)&v29 statusMessage:v6 client:a5];
  if (__osLogTrace) {
    uint64_t v28 = __osLogTrace;
  }
  else {
    uint64_t v28 = v9;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v28, OS_LOG_TYPE_DEFAULT, "BKFaceDetectOperation::statusMessage: -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __54__BKFaceDetectOperation_statusMessage_details_client___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [[BKFaceDetectStateInfo alloc] initWithPresenceState:*(_DWORD *)(a1 + 48) == 63 details:*(void *)(a1 + 40)];
  [v4 operation:v2 faceDetectStateChanged:v3];
}

void __54__BKFaceDetectOperation_statusMessage_details_client___block_invoke_263(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [BKMotionDetectStateInfo alloc];
  id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"BKStatusDetailMotionDetectMatrix"];
  id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"BKStatusDetailMotionDetectState"];
  uint64_t v6 = [(BKMotionDetectStateInfo *)v3 initWithMotionMatrix:v4 motionDetectState:v5];
  [v7 operation:v2 motionDetectStateChanged:v6];
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_int64_t mode = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (BOOL)highPriority
{
  return self->_highPriority;
}

- (void)setHighPriority:(BOOL)a3
{
  self->_highPriority = a3;
}

- (BOOL)eyeRelief
{
  return self->_eyeRelief;
}

- (void)setEyeRelief:(BOOL)a3
{
  self->_eyeRelief = a3;
}

- (BOOL)motionDetect
{
  return self->_motionDetect;
}

- (void)setMotionDetect:(BOOL)a3
{
  self->_motionDetect = a3;
}

@end