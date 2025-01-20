@interface VCScreenCapturePicker
- (BOOL)active;
- (SCContentSharingPickerConfiguration)pickerConfiguration;
- (VCScreenCapturePicker)initWithDelegate:(id)a3;
- (id)delegate;
- (void)dealloc;
- (void)invalidate;
- (void)setActive:(BOOL)a3;
- (void)setRepickingAllowed:(BOOL)a3;
- (void)showWithStream:(id)a3;
- (void)showWithStream:(id)a3 usingContentStyle:(int64_t)a4;
@end

@implementation VCScreenCapturePicker

- (VCScreenCapturePicker)initWithDelegate:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VCScreenCapturePicker;
  v4 = [(VCObject *)&v14 init];
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_delegate, a3);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    dispatch_queue_t v7 = dispatch_queue_create_with_target_V2("com.apple.avconference.ScreenCapturePicker.observerQueue", 0, CustomRootQueue);
    v5->_delegateQueue = (OS_dispatch_queue *)v7;
    if (!v7)
    {
      if ((VCScreenCapturePicker *)objc_opt_class() == v5)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCScreenCapturePicker initWithDelegate:](v10, v11);
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v9 = (__CFString *)[(VCScreenCapturePicker *)v5 performSelector:sel_logPrefix];
        }
        else {
          v9 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v16 = v12;
            __int16 v17 = 2080;
            v18 = "-[VCScreenCapturePicker initWithDelegate:]";
            __int16 v19 = 1024;
            int v20 = 63;
            __int16 v21 = 2112;
            v22 = v9;
            __int16 v23 = 2048;
            v24 = v5;
            _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) could no create dispatch queue", buf, 0x30u);
          }
        }
      }

      return 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((VCScreenCapturePicker *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCScreenCapturePicker *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_12;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v14 = v9;
    __int16 v15 = 2080;
    uint64_t v16 = "-[VCScreenCapturePicker dealloc]";
    __int16 v17 = 1024;
    int v18 = 75;
    __int16 v19 = 2112;
    int v20 = v3;
    __int16 v21 = 2048;
    v22 = self;
    v6 = " [%s] %s:%d %@(%p) Begin";
    dispatch_queue_t v7 = v10;
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
      uint64_t v16 = "-[VCScreenCapturePicker dealloc]";
      __int16 v17 = 1024;
      int v18 = 75;
      v6 = " [%s] %s:%d Begin";
      dispatch_queue_t v7 = v5;
      uint32_t v8 = 28;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_12:
  [(VCScreenCapturePicker *)self invalidate];
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)VCScreenCapturePicker;
  [(VCObject *)&v12 dealloc];
}

- (void)invalidate
{
  v3[5] = *MEMORY[0x1E4F143B8];
  delegateQueue = self->_delegateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__VCScreenCapturePicker_invalidate__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_sync(delegateQueue, v3);
}

id __35__VCScreenCapturePicker_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315650;
        uint64_t v13 = v3;
        __int16 v14 = 2080;
        __int16 v15 = "-[VCScreenCapturePicker invalidate]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 83;
        v5 = " [%s] %s:%d ";
        v6 = v4;
        uint32_t v7 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v12, v7);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v12 = 136316162;
        uint64_t v13 = v8;
        __int16 v14 = 2080;
        __int16 v15 = "-[VCScreenCapturePicker invalidate]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 83;
        __int16 v18 = 2112;
        __int16 v19 = v2;
        __int16 v20 = 2048;
        uint64_t v21 = v10;
        v5 = " [%s] %s:%d %@(%p) ";
        v6 = v9;
        uint32_t v7 = 48;
        goto LABEL_11;
      }
    }
  }
  id result = objc_storeWeak((id *)(*(void *)(a1 + 32) + 176), 0);
  *(unsigned char *)(*(void *)(a1 + 32) + 192) = 0;
  return result;
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((VCScreenCapturePicker *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint32_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315906;
        uint64_t v14 = v6;
        __int16 v15 = 2080;
        __int16 v16 = "-[VCScreenCapturePicker setActive:]";
        __int16 v17 = 1024;
        int v18 = 97;
        __int16 v19 = 1024;
        LODWORD(v20) = v3;
        uint64_t v8 = " [%s] %s:%d Setting picker to active=%d";
        uint64_t v9 = v7;
        uint32_t v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v5 = (__CFString *)[(VCScreenCapturePicker *)self performSelector:sel_logPrefix];
    }
    else {
      v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      int v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136316418;
        uint64_t v14 = v11;
        __int16 v15 = 2080;
        __int16 v16 = "-[VCScreenCapturePicker setActive:]";
        __int16 v17 = 1024;
        int v18 = 97;
        __int16 v19 = 2112;
        __int16 v20 = v5;
        __int16 v21 = 2048;
        uint64_t v22 = self;
        __int16 v23 = 1024;
        BOOL v24 = v3;
        uint64_t v8 = " [%s] %s:%d %@(%p) Setting picker to active=%d";
        uint64_t v9 = v12;
        uint32_t v10 = 54;
        goto LABEL_11;
      }
    }
  }
  self->_active = v3;
}

- (void)showWithStream:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((VCScreenCapturePicker *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint32_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315906;
        uint64_t v14 = v6;
        __int16 v15 = 2080;
        __int16 v16 = "-[VCScreenCapturePicker showWithStream:]";
        __int16 v17 = 1024;
        int v18 = 110;
        __int16 v19 = 2112;
        id v20 = a3;
        uint64_t v8 = " [%s] %s:%d stream=%@";
        uint64_t v9 = v7;
        uint32_t v10 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v5 = (__CFString *)[(VCScreenCapturePicker *)self performSelector:sel_logPrefix];
    }
    else {
      v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      int v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136316418;
        uint64_t v14 = v11;
        __int16 v15 = 2080;
        __int16 v16 = "-[VCScreenCapturePicker showWithStream:]";
        __int16 v17 = 1024;
        int v18 = 110;
        __int16 v19 = 2112;
        id v20 = v5;
        __int16 v21 = 2048;
        uint64_t v22 = self;
        __int16 v23 = 2112;
        id v24 = a3;
        uint64_t v8 = " [%s] %s:%d %@(%p) stream=%@";
        uint64_t v9 = v12;
        uint32_t v10 = 58;
        goto LABEL_11;
      }
    }
  }
}

- (void)showWithStream:(id)a3 usingContentStyle:(int64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((VCScreenCapturePicker *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315906;
        uint64_t v15 = v7;
        __int16 v16 = 2080;
        __int16 v17 = "-[VCScreenCapturePicker showWithStream:usingContentStyle:]";
        __int16 v18 = 1024;
        int v19 = 126;
        __int16 v20 = 2112;
        id v21 = a3;
        uint64_t v9 = " [%s] %s:%d stream=%@";
        uint32_t v10 = v8;
        uint32_t v11 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(VCScreenCapturePicker *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      int v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136316418;
        uint64_t v15 = v12;
        __int16 v16 = 2080;
        __int16 v17 = "-[VCScreenCapturePicker showWithStream:usingContentStyle:]";
        __int16 v18 = 1024;
        int v19 = 126;
        __int16 v20 = 2112;
        id v21 = v6;
        __int16 v22 = 2048;
        __int16 v23 = self;
        __int16 v24 = 2112;
        id v25 = a3;
        uint64_t v9 = " [%s] %s:%d %@(%p) stream=%@";
        uint32_t v10 = v13;
        uint32_t v11 = 58;
        goto LABEL_11;
      }
    }
  }
}

- (void)setRepickingAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((VCScreenCapturePicker *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315906;
        uint64_t v14 = v6;
        __int16 v15 = 2080;
        __int16 v16 = "-[VCScreenCapturePicker setRepickingAllowed:]";
        __int16 v17 = 1024;
        int v18 = 141;
        __int16 v19 = 1024;
        LODWORD(v20) = v3;
        uint64_t v8 = " [%s] %s:%d Setting repicking=%d";
        uint64_t v9 = v7;
        uint32_t v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v5 = (__CFString *)[(VCScreenCapturePicker *)self performSelector:sel_logPrefix];
    }
    else {
      v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136316418;
        uint64_t v14 = v11;
        __int16 v15 = 2080;
        __int16 v16 = "-[VCScreenCapturePicker setRepickingAllowed:]";
        __int16 v17 = 1024;
        int v18 = 141;
        __int16 v19 = 2112;
        __int16 v20 = v5;
        __int16 v21 = 2048;
        __int16 v22 = self;
        __int16 v23 = 1024;
        BOOL v24 = v3;
        uint64_t v8 = " [%s] %s:%d %@(%p) Setting repicking=%d";
        uint64_t v9 = v12;
        uint32_t v10 = 54;
        goto LABEL_11;
      }
    }
  }
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (BOOL)active
{
  return self->_active;
}

- (SCContentSharingPickerConfiguration)pickerConfiguration
{
  return self->_pickerConfiguration;
}

- (void)initWithDelegate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  v5 = "-[VCScreenCapturePicker initWithDelegate:]";
  __int16 v6 = 1024;
  int v7 = 63;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d could no create dispatch queue", (uint8_t *)&v2, 0x1Cu);
}

@end