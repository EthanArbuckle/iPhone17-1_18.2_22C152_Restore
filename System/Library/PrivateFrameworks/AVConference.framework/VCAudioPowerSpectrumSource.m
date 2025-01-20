@interface VCAudioPowerSpectrumSource
- (VCAudioPowerSpectrumSource)initWithStreamToken:(int64_t)a3 delegate:(id)a4;
- (_VCAudioPowerSpectrumSourceRealtimeContext)realtimeContext;
- (int64_t)streamToken;
- (void)cleanupAudioPowerSpectrumSinks;
- (void)cleanupQueue:(opaqueCMSimpleQueue *)a3;
- (void)dealloc;
- (void)invalidate;
- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3;
@end

@implementation VCAudioPowerSpectrumSource

- (VCAudioPowerSpectrumSource)initWithStreamToken:(int64_t)a3 delegate:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)VCAudioPowerSpectrumSource;
  v6 = [(VCObject *)&v16 init];
  if (v6)
  {
    if ((VCAudioPowerSpectrumSource *)objc_opt_class() == v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_13;
      }
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v18 = v8;
      __int16 v19 = 2080;
      v20 = "-[VCAudioPowerSpectrumSource initWithStreamToken:delegate:]";
      __int16 v21 = 1024;
      int v22 = 35;
      __int16 v23 = 2048;
      int64_t v24 = a3;
      __int16 v25 = 2048;
      id v26 = a4;
      v10 = " [%s] %s:%d streamToken=%ld delegate=%p";
      v11 = v9;
      uint32_t v12 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v7 = (__CFString *)[(VCAudioPowerSpectrumSource *)v6 performSelector:sel_logPrefix];
      }
      else {
        v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_13;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v18 = v13;
      __int16 v19 = 2080;
      v20 = "-[VCAudioPowerSpectrumSource initWithStreamToken:delegate:]";
      __int16 v21 = 1024;
      int v22 = 35;
      __int16 v23 = 2112;
      int64_t v24 = (int64_t)v7;
      __int16 v25 = 2048;
      id v26 = v6;
      __int16 v27 = 2048;
      int64_t v28 = a3;
      __int16 v29 = 2048;
      id v30 = a4;
      v10 = " [%s] %s:%d %@(%p) streamToken=%ld delegate=%p";
      v11 = v14;
      uint32_t v12 = 68;
    }
    _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_13:
    v6->_streamToken = a3;
    objc_storeWeak(&v6->_realtimeContext.powerSpectrumSourceDelegate, a4);
    VCSingleLinkedListInitialize((uint64_t)&v6->_realtimeContext, (uint64_t)_VCAudioPowerSpectrumSource_CompareListEntries);
    CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 32, &v6->_realtimeContext.eventQueue);
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((VCAudioPowerSpectrumSource *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int64_t streamToken = self->_streamToken;
        *(_DWORD *)buf = 136315906;
        uint64_t v15 = v4;
        __int16 v16 = 2080;
        v17 = "-[VCAudioPowerSpectrumSource dealloc]";
        __int16 v18 = 1024;
        int v19 = 45;
        __int16 v20 = 2048;
        int64_t v21 = streamToken;
        v7 = " [%s] %s:%d streamToken=%ld";
        uint64_t v8 = v5;
        uint32_t v9 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCAudioPowerSpectrumSource *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int64_t v12 = self->_streamToken;
        *(_DWORD *)buf = 136316418;
        uint64_t v15 = v10;
        __int16 v16 = 2080;
        v17 = "-[VCAudioPowerSpectrumSource dealloc]";
        __int16 v18 = 1024;
        int v19 = 45;
        __int16 v20 = 2112;
        int64_t v21 = (int64_t)v3;
        __int16 v22 = 2048;
        __int16 v23 = self;
        __int16 v24 = 2048;
        int64_t v25 = v12;
        v7 = " [%s] %s:%d %@(%p) streamToken=%ld";
        uint64_t v8 = v11;
        uint32_t v9 = 58;
        goto LABEL_11;
      }
    }
  }
  [(VCAudioPowerSpectrumSource *)self cleanupAudioPowerSpectrumSinks];
  [(VCAudioPowerSpectrumSource *)self cleanupQueue:&self->_realtimeContext.eventQueue];
  objc_storeWeak(&self->_realtimeContext.powerSpectrumSourceDelegate, 0);
  v13.receiver = self;
  v13.super_class = (Class)VCAudioPowerSpectrumSource;
  [(VCObject *)&v13 dealloc];
}

- (void)invalidate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((VCAudioPowerSpectrumSource *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int64_t streamToken = self->_streamToken;
        *(_DWORD *)objc_super v13 = 136315906;
        *(void *)&v13[4] = v4;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[VCAudioPowerSpectrumSource invalidate]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 53;
        WORD2(v14) = 2048;
        *(void *)((char *)&v14 + 6) = streamToken;
        v7 = " [%s] %s:%d streamToken=%ld";
        uint64_t v8 = v5;
        uint32_t v9 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, v13, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCAudioPowerSpectrumSource *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int64_t v12 = self->_streamToken;
        *(_DWORD *)objc_super v13 = 136316418;
        *(void *)&v13[4] = v10;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[VCAudioPowerSpectrumSource invalidate]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 53;
        WORD2(v14) = 2112;
        *(void *)((char *)&v14 + 6) = v3;
        HIWORD(v14) = 2048;
        uint64_t v15 = self;
        LOWORD(v16) = 2048;
        *(void *)((char *)&v16 + 2) = v12;
        v7 = " [%s] %s:%d %@(%p) streamToken=%ld";
        uint64_t v8 = v11;
        uint32_t v9 = 58;
        goto LABEL_11;
      }
    }
  }
  [(VCAudioPowerSpectrumSource *)self cleanupAudioPowerSpectrumSinks];
  [(VCAudioPowerSpectrumSource *)self cleanupQueue:&self->_realtimeContext.eventQueue];
  objc_storeWeak(&self->_realtimeContext.powerSpectrumSourceDelegate, 0);
}

- (void)cleanupQueue:(opaqueCMSimpleQueue *)a3
{
  v5[1] = *(id **)MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = *a3;
    if (*a3)
    {
      while (1)
      {
        v5[0] = (id *)CMSimpleQueueDequeue(v4);
        if (!v5[0]) {
          break;
        }
        VCAudioPowerSpectrumSource_FreeClient(v5);
        uint64_t v4 = *a3;
      }
      if (*a3) {
        CFRelease(*a3);
      }
      *a3 = 0;
    }
  }
}

- (void)cleanupAudioPowerSpectrumSinks
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  p_realtimeContext = (uint64_t *)&self->_realtimeContext;
  for (i = (id *)VCSingleLinkedListPop((uint64_t *)&self->_realtimeContext);
        i;
        i = (id *)VCSingleLinkedListPop(p_realtimeContext))
  {
    VCAudioPowerSpectrumSource_FreeClient(&i);
    v3 = (void *)MEMORY[0x1E4E56580](p_realtimeContext + 5);
    objc_msgSend(v3, "audioPowerSpectrumSinkDidUnregister", i, v5);
    if (v3) {
      CFRelease(v3);
    }
  }
}

- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3
{
}

- (_VCAudioPowerSpectrumSourceRealtimeContext)realtimeContext
{
  return &self->_realtimeContext;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

@end