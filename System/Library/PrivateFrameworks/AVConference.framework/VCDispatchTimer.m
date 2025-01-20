@interface VCDispatchTimer
- (BOOL)isRunning;
- (VCDispatchTimer)initWithIntervalMilliseconds:(unsigned int)a3 callbackBlock:(id)a4;
- (VCDispatchTimer)initWithIntervalMilliseconds:(unsigned int)a3 callbackBlock:(id)a4 clientQueue:(id)a5;
- (VCDispatchTimer)initWithIntervalSeconds:(unsigned int)a3 callbackBlock:(id)a4;
- (VCDispatchTimer)initWithIntervalSeconds:(unsigned int)a3 callbackBlock:(id)a4 clientQueue:(id)a5;
- (id)callbackBlock;
- (void)dealloc;
- (void)start;
- (void)stop;
@end

@implementation VCDispatchTimer

- (VCDispatchTimer)initWithIntervalSeconds:(unsigned int)a3 callbackBlock:(id)a4
{
  return [(VCDispatchTimer *)self initWithIntervalMilliseconds:1000 * a3 callbackBlock:a4 clientQueue:0];
}

- (VCDispatchTimer)initWithIntervalMilliseconds:(unsigned int)a3 callbackBlock:(id)a4
{
  return [(VCDispatchTimer *)self initWithIntervalMilliseconds:*(void *)&a3 callbackBlock:a4 clientQueue:0];
}

- (VCDispatchTimer)initWithIntervalSeconds:(unsigned int)a3 callbackBlock:(id)a4 clientQueue:(id)a5
{
  return [(VCDispatchTimer *)self initWithIntervalMilliseconds:1000 * a3 callbackBlock:a4 clientQueue:a5];
}

- (VCDispatchTimer)initWithIntervalMilliseconds:(unsigned int)a3 callbackBlock:(id)a4 clientQueue:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)VCDispatchTimer;
  v8 = [(VCObject *)&v18 init];
  if (v8)
  {
    dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)a5);
    v8->_timer = (OS_dispatch_source *)v9;
    if (v9)
    {
      v8->_callbackBlock = _Block_copy(a4);
      v8->_intervalMilliseconds = a3;
      uint64_t v10 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:v8];
      timer = v8->_timer;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __74__VCDispatchTimer_initWithIntervalMilliseconds_callbackBlock_clientQueue___block_invoke;
      handler[3] = &unk_1E6DB3DC8;
      handler[4] = v10;
      dispatch_source_set_event_handler(timer, handler);
      v12 = v8->_timer;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __74__VCDispatchTimer_initWithIntervalMilliseconds_callbackBlock_clientQueue___block_invoke_5;
      v16[3] = &unk_1E6DB4568;
      v16[4] = v10;
      v16[5] = v12;
      dispatch_source_set_cancel_handler(v12, v16);
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCDispatchTimer initWithIntervalMilliseconds:callbackBlock:clientQueue:](v13, v14);
        }
      }

      return 0;
    }
  }
  return v8;
}

void __74__VCDispatchTimer_initWithIntervalMilliseconds_callbackBlock_clientQueue___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v1 = (void *)[*(id *)(a1 + 32) strong];
  if (!v1) {
    return;
  }
  v2 = v1;
  if ([v1 isRunning])
  {
    v3 = *(void (**)(void))([v2 callbackBlock] + 16);
    v3();
    return;
  }
  if (objc_opt_class() == v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v12 = 136315650;
    uint64_t v13 = v5;
    __int16 v14 = 2080;
    v15 = "-[VCDispatchTimer initWithIntervalMilliseconds:callbackBlock:clientQueue:]_block_invoke";
    __int16 v16 = 1024;
    int v17 = 65;
    v7 = " [%s] %s:%d timer is not running. ignoring timeout.";
    v8 = v6;
    uint32_t v9 = 28;
LABEL_16:
    _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, v9);
    return;
  }
  if (objc_opt_respondsToSelector()) {
    v4 = (__CFString *)[v2 performSelector:sel_logPrefix];
  }
  else {
    v4 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136316162;
      uint64_t v13 = v10;
      __int16 v14 = 2080;
      v15 = "-[VCDispatchTimer initWithIntervalMilliseconds:callbackBlock:clientQueue:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 65;
      __int16 v18 = 2112;
      uint64_t v19 = v4;
      __int16 v20 = 2048;
      v21 = v2;
      v7 = " [%s] %s:%d %@(%p) timer is not running. ignoring timeout.";
      v8 = v11;
      uint32_t v9 = 48;
      goto LABEL_16;
    }
  }
}

void __74__VCDispatchTimer_initWithIntervalMilliseconds_callbackBlock_clientQueue___block_invoke_5(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) strong];
  uint64_t v2 = objc_opt_class();
  if (v2 == [*(id *)(a1 + 32) strong])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(__CFString **)(a1 + 40);
        int v14 = 136315906;
        uint64_t v15 = v4;
        __int16 v16 = 2080;
        int v17 = "-[VCDispatchTimer initWithIntervalMilliseconds:callbackBlock:clientQueue:]_block_invoke";
        __int16 v18 = 1024;
        int v19 = 70;
        __int16 v20 = 2048;
        v21 = v6;
        v7 = " [%s] %s:%d timer=%p has been cancelled";
        v8 = v5;
        uint32_t v9 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v14, v9);
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) strong];
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "performSelector:", sel_logPrefix);
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [*(id *)(a1 + 32) strong];
        uint64_t v13 = *(void *)(a1 + 40);
        int v14 = 136316418;
        uint64_t v15 = v10;
        __int16 v16 = 2080;
        int v17 = "-[VCDispatchTimer initWithIntervalMilliseconds:callbackBlock:clientQueue:]_block_invoke";
        __int16 v18 = 1024;
        int v19 = 70;
        __int16 v20 = 2112;
        v21 = v3;
        __int16 v22 = 2048;
        uint64_t v23 = v12;
        __int16 v24 = 2048;
        uint64_t v25 = v13;
        v7 = " [%s] %s:%d %@(%p) timer=%p has been cancelled";
        v8 = v11;
        uint32_t v9 = 58;
        goto LABEL_11;
      }
    }
  }
}

- (void)dealloc
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!self->_running) {
    dispatch_resume((dispatch_object_t)self->_timer);
  }
  dispatch_source_cancel((dispatch_source_t)self->_timer);
  if (!dispatch_source_testcancel((dispatch_source_t)self->_timer))
  {
    v3 = (os_log_t *)MEMORY[0x1E4F47A50];
    do
    {
      if ((VCDispatchTimer *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          continue;
        }
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        os_log_t v12 = *v3;
        if (!os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT)) {
          continue;
        }
        timer = self->_timer;
        *(_DWORD *)buf = 136315906;
        uint64_t v26 = v11;
        __int16 v27 = 2080;
        v28 = "-[VCDispatchTimer dealloc]";
        __int16 v29 = 1024;
        int v30 = 82;
        __int16 v31 = 2048;
        v32 = timer;
        v8 = v12;
        uint32_t v9 = " [%s] %s:%d timer=%p is waiting to be test cancelled";
        uint32_t v10 = 38;
      }
      else
      {
        uint64_t v4 = &stru_1F3D3E450;
        if (objc_opt_respondsToSelector()) {
          uint64_t v4 = (__CFString *)[(VCDispatchTimer *)self performSelector:sel_logPrefix];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          continue;
        }
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        os_log_t v6 = *v3;
        if (!os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT)) {
          continue;
        }
        v7 = self->_timer;
        *(_DWORD *)buf = 136316418;
        uint64_t v26 = v5;
        __int16 v27 = 2080;
        v28 = "-[VCDispatchTimer dealloc]";
        __int16 v29 = 1024;
        int v30 = 82;
        __int16 v31 = 2112;
        v32 = v4;
        __int16 v33 = 2048;
        v34 = self;
        __int16 v35 = 2048;
        v36 = v7;
        v8 = v6;
        uint32_t v9 = " [%s] %s:%d %@(%p) timer=%p is waiting to be test cancelled";
        uint32_t v10 = 58;
      }
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, v10);
    }
    while (!dispatch_source_testcancel((dispatch_source_t)self->_timer));
  }
  if ((VCDispatchTimer *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      __int16 v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = self->_timer;
        *(_DWORD *)buf = 136315906;
        uint64_t v26 = v15;
        __int16 v27 = 2080;
        v28 = "-[VCDispatchTimer dealloc]";
        __int16 v29 = 1024;
        int v30 = 84;
        __int16 v31 = 2048;
        v32 = v17;
        __int16 v18 = " [%s] %s:%d timer=%p has been test cancelled";
        int v19 = v16;
        uint32_t v20 = 38;
LABEL_26:
        _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v14 = (__CFString *)[(VCDispatchTimer *)self performSelector:sel_logPrefix];
    }
    else {
      int v14 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      __int16 v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = self->_timer;
        *(_DWORD *)buf = 136316418;
        uint64_t v26 = v21;
        __int16 v27 = 2080;
        v28 = "-[VCDispatchTimer dealloc]";
        __int16 v29 = 1024;
        int v30 = 84;
        __int16 v31 = 2112;
        v32 = v14;
        __int16 v33 = 2048;
        v34 = self;
        __int16 v35 = 2048;
        v36 = v23;
        __int16 v18 = " [%s] %s:%d %@(%p) timer=%p has been test cancelled";
        int v19 = v22;
        uint32_t v20 = 58;
        goto LABEL_26;
      }
    }
  }
  _Block_release(self->_callbackBlock);
  dispatch_release((dispatch_object_t)self->_timer);
  v24.receiver = self;
  v24.super_class = (Class)VCDispatchTimer;
  [(VCObject *)&v24 dealloc];
}

- (void)start
{
  OUTLINED_FUNCTION_6_0();
  *(void *)&v3[6] = "-[VCDispatchTimer start]";
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d started a timer=%p that was already running", v2, *(const char **)v3, (unint64_t)"-[VCDispatchTimer start]" >> 16, v4);
}

- (void)stop
{
  OUTLINED_FUNCTION_6_0();
  *(void *)&v3[6] = "-[VCDispatchTimer stop]";
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d stopped a timer=%p that was already stop", v2, *(const char **)v3, (unint64_t)"-[VCDispatchTimer stop]" >> 16, v4);
}

- (BOOL)isRunning
{
  return self->_running;
}

- (id)callbackBlock
{
  return self->_callbackBlock;
}

- (void)initWithIntervalMilliseconds:(uint64_t)a1 callbackBlock:(NSObject *)a2 clientQueue:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[VCDispatchTimer initWithIntervalMilliseconds:callbackBlock:clientQueue:]";
  __int16 v6 = 1024;
  int v7 = 49;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create dispatch timer", (uint8_t *)&v2, 0x1Cu);
}

@end