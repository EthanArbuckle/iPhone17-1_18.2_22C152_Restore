@interface AVCScreenCapturePicker
- (AVCScreenCapturePicker)initWithDelegate:(id)a3 delegateQueue:(id)a4;
- (BOOL)excludeCurrentApplication;
- (id)delegate;
- (void)dealloc;
- (void)deregisterBlocksForNotifications;
- (void)invalidate;
- (void)registerBlocksForNotifications;
- (void)setExcludeCurrentApplication:(BOOL)a3;
- (void)show;
- (void)showUsingContentStyle:(int64_t)a3;
@end

@implementation AVCScreenCapturePicker

- (AVCScreenCapturePicker)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if ((AVCScreenCapturePicker *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v38 = v8;
        __int16 v39 = 2080;
        v40 = "-[AVCScreenCapturePicker initWithDelegate:delegateQueue:]";
        __int16 v41 = 1024;
        int v42 = 29;
        v10 = " [%s] %s:%d Begin";
        v11 = v9;
        uint32_t v12 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v7 = (__CFString *)[(AVCScreenCapturePicker *)self performSelector:sel_logPrefix];
    }
    else {
      v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v38 = v13;
        __int16 v39 = 2080;
        v40 = "-[AVCScreenCapturePicker initWithDelegate:delegateQueue:]";
        __int16 v41 = 1024;
        int v42 = 29;
        __int16 v43 = 2112;
        v44 = v7;
        __int16 v45 = 2048;
        v46 = self;
        v10 = " [%s] %s:%d %@(%p) Begin";
        v11 = v14;
        uint32_t v12 = 48;
        goto LABEL_11;
      }
    }
  }
  v36.receiver = self;
  v36.super_class = (Class)AVCScreenCapturePicker;
  v15 = [(AVCScreenCapturePicker *)&v36 init];
  v16 = v15;
  if (!v15) {
    goto LABEL_19;
  }
  if (a4)
  {
    v15->_screenCapturePickerQueue = (OS_dispatch_queue *)a4;
    dispatch_retain((dispatch_object_t)a4);
    if (v16->_screenCapturePickerQueue) {
      goto LABEL_15;
    }
LABEL_32:
    if ((AVCScreenCapturePicker *)objc_opt_class() == v16)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCScreenCapturePicker initWithDelegate:delegateQueue:]();
        }
      }
      goto LABEL_54;
    }
    if (objc_opt_respondsToSelector()) {
      v30 = (__CFString *)[(AVCScreenCapturePicker *)v16 performSelector:sel_logPrefix];
    }
    else {
      v30 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_54;
    }
    uint64_t v32 = VRTraceErrorLogLevelToCSTR();
    v33 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_54;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v38 = v32;
    __int16 v39 = 2080;
    v40 = "-[AVCScreenCapturePicker initWithDelegate:delegateQueue:]";
    __int16 v41 = 1024;
    int v42 = 38;
    __int16 v43 = 2112;
    v44 = v30;
    __int16 v45 = 2048;
    v46 = v16;
    v34 = " [%s] %s:%d %@(%p) Failed to create xpc command queue";
LABEL_56:
    _os_log_error_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_ERROR, v34, buf, 0x30u);
    goto LABEL_54;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  dispatch_queue_t v29 = dispatch_queue_create_with_target_V2("com.apple.AVConference.screenCapture", 0, CustomRootQueue);
  v16->_screenCapturePickerQueue = (OS_dispatch_queue *)v29;
  if (!v29) {
    goto LABEL_32;
  }
LABEL_15:
  v17 = objc_alloc_init(AVConferenceXPCClient);
  v16->_connection = v17;
  if (v17)
  {
    id v18 = [(AVConferenceXPCClient *)v17 sendMessageSync:"vcScreenCapturePickerInitialize" arguments:0];
    if (v18 && ![v18 objectForKeyedSubscript:@"ERROR"])
    {
      [(AVCScreenCapturePicker *)v16 registerBlocksForNotifications];
      objc_storeWeak((id *)&v16->_delegate, a3);
      v16->_isValid = 1;
      goto LABEL_19;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCScreenCapturePicker initWithDelegate:delegateQueue:]();
      }
    }
    goto LABEL_54;
  }
  if ((AVCScreenCapturePicker *)objc_opt_class() == v16)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCScreenCapturePicker initWithDelegate:delegateQueue:]();
      }
    }
    goto LABEL_54;
  }
  if (objc_opt_respondsToSelector()) {
    v31 = (__CFString *)[(AVCScreenCapturePicker *)v16 performSelector:sel_logPrefix];
  }
  else {
    v31 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v35 = VRTraceErrorLogLevelToCSTR();
    v33 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v38 = v35;
      __int16 v39 = 2080;
      v40 = "-[AVCScreenCapturePicker initWithDelegate:delegateQueue:]";
      __int16 v41 = 1024;
      int v42 = 41;
      __int16 v43 = 2112;
      v44 = v31;
      __int16 v45 = 2048;
      v46 = v16;
      v34 = " [%s] %s:%d %@(%p) Failed to create XPC connection";
      goto LABEL_56;
    }
  }
LABEL_54:

  v16 = 0;
LABEL_19:
  if ((AVCScreenCapturePicker *)objc_opt_class() == v16)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v38 = v20;
        __int16 v39 = 2080;
        v40 = "-[AVCScreenCapturePicker initWithDelegate:delegateQueue:]";
        __int16 v41 = 1024;
        int v42 = 58;
        v22 = " [%s] %s:%d End";
        v23 = v21;
        uint32_t v24 = 28;
LABEL_29:
        _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v19 = (__CFString *)[(AVCScreenCapturePicker *)v16 performSelector:sel_logPrefix];
    }
    else {
      v19 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v38 = v25;
        __int16 v39 = 2080;
        v40 = "-[AVCScreenCapturePicker initWithDelegate:delegateQueue:]";
        __int16 v41 = 1024;
        int v42 = 58;
        __int16 v43 = 2112;
        v44 = v19;
        __int16 v45 = 2048;
        v46 = v16;
        v22 = " [%s] %s:%d %@(%p) End";
        v23 = v26;
        uint32_t v24 = 48;
        goto LABEL_29;
      }
    }
  }
  return v16;
}

- (void)dealloc
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((AVCScreenCapturePicker *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(AVCScreenCapturePicker *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_12;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    v16 = "-[AVCScreenCapturePicker dealloc]";
    __int16 v17 = 1024;
    int v18 = 63;
    __int16 v19 = 2112;
    uint64_t v20 = v3;
    __int16 v21 = 2048;
    v22 = self;
    v6 = " [%s] %s:%d %@(%p) ";
    v7 = v10;
    uint32_t v8 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v14 = v4;
      __int16 v15 = 2080;
      v16 = "-[AVCScreenCapturePicker dealloc]";
      __int16 v17 = 1024;
      int v18 = 63;
      v6 = " [%s] %s:%d ";
      v7 = v5;
      uint32_t v8 = 28;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_12:
  [(AVCScreenCapturePicker *)self invalidate];

  screenCapturePickerQueue = self->_screenCapturePickerQueue;
  if (screenCapturePickerQueue)
  {
    dispatch_release(screenCapturePickerQueue);
    self->_screenCapturePickerQueue = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)AVCScreenCapturePicker;
  [(AVCScreenCapturePicker *)&v12 dealloc];
}

- (void)invalidate
{
  v4[5] = *MEMORY[0x1E4F143B8];
  screenCapturePickerQueue = self->_screenCapturePickerQueue;
  if (screenCapturePickerQueue)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __36__AVCScreenCapturePicker_invalidate__block_invoke;
    v4[3] = &unk_1E6DB3DC8;
    v4[4] = self;
    dispatch_sync(screenCapturePickerQueue, v4);
  }
}

uint64_t __36__AVCScreenCapturePicker_invalidate__block_invoke(uint64_t result)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 32))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 32) = 0;
    if (objc_opt_class() == *(void *)(result + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)objc_super v12 = 136315650;
      *(void *)&v12[4] = v4;
      *(_WORD *)&v12[12] = 2080;
      *(void *)&v12[14] = "-[AVCScreenCapturePicker invalidate]_block_invoke";
      *(_WORD *)&v12[22] = 1024;
      LODWORD(v13) = 75;
      v6 = " [%s] %s:%d invalidating";
      v7 = v5;
      uint32_t v8 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v3 = (__CFString *)[*(id *)(v2 + 32) performSelector:sel_logPrefix];
      }
      else {
        v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      uint64_t v11 = *(void *)(v2 + 32);
      *(_DWORD *)objc_super v12 = 136316162;
      *(void *)&v12[4] = v9;
      *(_WORD *)&v12[12] = 2080;
      *(void *)&v12[14] = "-[AVCScreenCapturePicker invalidate]_block_invoke";
      *(_WORD *)&v12[22] = 1024;
      LODWORD(v13) = 75;
      WORD2(v13) = 2112;
      *(void *)((char *)&v13 + 6) = v3;
      HIWORD(v13) = 2048;
      uint64_t v14 = v11;
      v6 = " [%s] %s:%d %@(%p) invalidating";
      v7 = v10;
      uint32_t v8 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v12, v8);
LABEL_13:
    objc_msgSend(*(id *)(v2 + 32), "deregisterBlocksForNotifications", *(_OWORD *)v12, *(void *)&v12[16], v13, v14);
    objc_storeWeak((id *)(*(void *)(v2 + 32) + 24), 0);
    return [*(id *)(*(void *)(v2 + 32) + 16) sendMessageSync:"vcScreenCapturePickerTerminate"];
  }
  return result;
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (void)show
{
  v3[5] = *MEMORY[0x1E4F143B8];
  screenCapturePickerQueue = self->_screenCapturePickerQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__AVCScreenCapturePicker_show__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(screenCapturePickerQueue, v3);
}

uint64_t __30__AVCScreenCapturePicker_show__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t result = *(void *)(a1 + 32);
  if (*(unsigned char *)(result + 32))
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "sendMessageSync:", "vcScreenCapturePickerShow", *(_OWORD *)v12, *(void *)&v12[16], v13, v14);
      }
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "sendMessageSync:", "vcScreenCapturePickerShow", *(_OWORD *)v12, *(void *)&v12[16], v13, v14);
      }
      *(_DWORD *)objc_super v12 = 136315650;
      *(void *)&v12[4] = v4;
      *(_WORD *)&v12[12] = 2080;
      *(void *)&v12[14] = "-[AVCScreenCapturePicker show]_block_invoke";
      *(_WORD *)&v12[22] = 1024;
      LODWORD(v13) = 92;
      v6 = " [%s] %s:%d ";
      v7 = v5;
      uint32_t v8 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v3 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "sendMessageSync:", "vcScreenCapturePickerShow", *(_OWORD *)v12, *(void *)&v12[16], v13, v14);
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "sendMessageSync:", "vcScreenCapturePickerShow", *(_OWORD *)v12, *(void *)&v12[16], v13, v14);
      }
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)objc_super v12 = 136316162;
      *(void *)&v12[4] = v9;
      *(_WORD *)&v12[12] = 2080;
      *(void *)&v12[14] = "-[AVCScreenCapturePicker show]_block_invoke";
      *(_WORD *)&v12[22] = 1024;
      LODWORD(v13) = 92;
      WORD2(v13) = 2112;
      *(void *)((char *)&v13 + 6) = v3;
      HIWORD(v13) = 2048;
      uint64_t v14 = v11;
      v6 = " [%s] %s:%d %@(%p) ";
      v7 = v10;
      uint32_t v8 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v12, v8);
    return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "sendMessageSync:", "vcScreenCapturePickerShow", *(_OWORD *)v12, *(void *)&v12[16], v13, v14);
  }
  return result;
}

- (void)showUsingContentStyle:(int64_t)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  screenCapturePickerQueue = self->_screenCapturePickerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AVCScreenCapturePicker_showUsingContentStyle___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  block[5] = a3;
  dispatch_async(screenCapturePickerQueue, block);
}

uint64_t __48__AVCScreenCapturePicker_showUsingContentStyle___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t result = *(void *)(a1 + 32);
  if (*(unsigned char *)(result + 32))
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_13;
      }
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v15 = v4;
      __int16 v16 = 2080;
      __int16 v17 = "-[AVCScreenCapturePicker showUsingContentStyle:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 101;
      v6 = " [%s] %s:%d ";
      v7 = v5;
      uint32_t v8 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v3 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_13;
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = v9;
      __int16 v16 = 2080;
      __int16 v17 = "-[AVCScreenCapturePicker showUsingContentStyle:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 101;
      __int16 v20 = 2112;
      __int16 v21 = v3;
      __int16 v22 = 2048;
      uint64_t v23 = v11;
      v6 = " [%s] %s:%d %@(%p) ";
      v7 = v10;
      uint32_t v8 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
LABEL_13:
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 40), @"vcScreenCaptureAttributesContentStyle");
    return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "sendMessageSync:arguments:", "vcScreenCapturePickerShowUsingContentStyle", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  }
  return result;
}

- (void)registerBlocksForNotifications
{
  v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__AVCScreenCapturePicker_registerBlocksForNotifications__block_invoke;
  v5[3] = &unk_1E6DB4338;
  v5[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcScreenCapturePickerDidSelectAttributes" block:v5 queue:self->_screenCapturePickerQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__AVCScreenCapturePicker_registerBlocksForNotifications__block_invoke_39;
  v4[3] = &unk_1E6DB4338;
  v4[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcScreenCapturePickerDidCancel" block:v4 queue:self->_screenCapturePickerQueue];
}

void __56__AVCScreenCapturePicker_registerBlocksForNotifications__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = (void *)[*(id *)(a1 + 32) strong];
  if (!v5) {
    return;
  }
  v6 = v5;
  v7 = (void *)[v5 delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return;
  }
  if (objc_opt_class() != v6)
  {
    if (objc_opt_respondsToSelector()) {
      uint32_t v8 = (__CFString *)[v6 performSelector:sel_logPrefix];
    }
    else {
      uint32_t v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_14;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_DWORD *)__int16 v20 = 136316418;
    *(void *)&v20[4] = v14;
    *(_WORD *)&v20[12] = 2080;
    *(void *)&v20[14] = "-[AVCScreenCapturePicker registerBlocksForNotifications]_block_invoke";
    *(_WORD *)&v20[22] = 1024;
    LODWORD(v21) = 118;
    WORD2(v21) = 2112;
    *(void *)((char *)&v21 + 6) = v8;
    HIWORD(v21) = 2048;
    __int16 v22 = v6;
    LOWORD(v23) = 2112;
    *(void *)((char *)&v23 + 2) = a3;
    uint64_t v11 = " [%s] %s:%d %@(%p) received callback for didSelectAttributes error=%@";
    uint64_t v12 = v15;
    uint32_t v13 = 58;
    goto LABEL_13;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v20 = 136315906;
      *(void *)&v20[4] = v9;
      *(_WORD *)&v20[12] = 2080;
      *(void *)&v20[14] = "-[AVCScreenCapturePicker registerBlocksForNotifications]_block_invoke";
      *(_WORD *)&v20[22] = 1024;
      LODWORD(v21) = 118;
      WORD2(v21) = 2112;
      *(void *)((char *)&v21 + 6) = a3;
      uint64_t v11 = " [%s] %s:%d received callback for didSelectAttributes error=%@";
      uint64_t v12 = v10;
      uint32_t v13 = 38;
LABEL_13:
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, v20, v13);
    }
  }
LABEL_14:
  __int16 v16 = objc_msgSend(a2, "objectForKeyedSubscript:", @"vcScreenCaptureAttributesError", *(_OWORD *)v20, *(void *)&v20[16], v21, v22, v23);
  if (v16)
  {
    __int16 v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithDomain:code:userInfo:", objc_msgSend(v16, "objectForKeyedSubscript:", @"vcScreenCaptureAttributesErrorDomain"), (int)objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", @"vcScreenCaptureAttributesErrorCode"), "intValue"), objc_msgSend(v16, "objectForKeyedSubscript:", @"vcScreenCaptureAttributesErrorUserInfo"));
    __int16 v18 = 0;
  }
  else
  {
    __int16 v18 = [[AVCScreenCaptureAttributes alloc] initWithConfiguration:a2];
    __int16 v17 = 0;
  }
  if (v17) {
    int v19 = v17;
  }
  else {
    int v19 = a3;
  }
  [v7 picker:v6 didSelectAttributes:v18 error:v19];
}

uint64_t __56__AVCScreenCapturePicker_registerBlocksForNotifications__block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) strong];
  if (result)
  {
    uint64_t v4 = (void *)result;
    v5 = (void *)[(id)result delegate];
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcScreenCaptureCaptureSourceID"), "integerValue");
      if (objc_opt_class() == v4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          return objc_msgSend(v5, "picker:didCancelForCaptureSourceID:", v4, v6, *(_OWORD *)v15, *(void *)&v15[16], v16, v17, v18);
        }
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return objc_msgSend(v5, "picker:didCancelForCaptureSourceID:", v4, v6, *(_OWORD *)v15, *(void *)&v15[16], v16, v17, v18);
        }
        *(_DWORD *)uint64_t v15 = 136315906;
        *(void *)&v15[4] = v8;
        *(_WORD *)&v15[12] = 2080;
        *(void *)&v15[14] = "-[AVCScreenCapturePicker registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 144;
        WORD2(v16) = 2048;
        *(void *)((char *)&v16 + 6) = v6;
        v10 = " [%s] %s:%d received callback for didCancel captureSourceID=%ld";
        uint64_t v11 = v9;
        uint32_t v12 = 38;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v7 = (__CFString *)[v4 performSelector:sel_logPrefix];
        }
        else {
          v7 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          return objc_msgSend(v5, "picker:didCancelForCaptureSourceID:", v4, v6, *(_OWORD *)v15, *(void *)&v15[16], v16, v17, v18);
        }
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return objc_msgSend(v5, "picker:didCancelForCaptureSourceID:", v4, v6, *(_OWORD *)v15, *(void *)&v15[16], v16, v17, v18);
        }
        *(_DWORD *)uint64_t v15 = 136316418;
        *(void *)&v15[4] = v13;
        *(_WORD *)&v15[12] = 2080;
        *(void *)&v15[14] = "-[AVCScreenCapturePicker registerBlocksForNotifications]_block_invoke";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 144;
        WORD2(v16) = 2112;
        *(void *)((char *)&v16 + 6) = v7;
        HIWORD(v16) = 2048;
        __int16 v17 = v4;
        LOWORD(v18) = 2048;
        *(void *)((char *)&v18 + 2) = v6;
        v10 = " [%s] %s:%d %@(%p) received callback for didCancel captureSourceID=%ld";
        uint64_t v11 = v14;
        uint32_t v12 = 58;
      }
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, v15, v12);
      return objc_msgSend(v5, "picker:didCancelForCaptureSourceID:", v4, v6, *(_OWORD *)v15, *(void *)&v15[16], v16, v17, v18);
    }
  }
  return result;
}

- (void)deregisterBlocksForNotifications
{
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcScreenCapturePickerDidSelectAttributes"];
  connection = self->_connection;

  [(AVConferenceXPCClient *)connection deregisterFromService:"vcScreenCapturePickerDidCancel"];
}

- (BOOL)excludeCurrentApplication
{
  return self->_excludeCurrentApplication;
}

- (void)setExcludeCurrentApplication:(BOOL)a3
{
  self->_excludeCurrentApplication = a3;
}

- (void)initWithDelegate:delegateQueue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create xpc command queue", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:delegateQueue:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create XPC connection", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:delegateQueue:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error initializing connection", v2, v3, v4, v5, v6);
}

@end