@interface VCTextJitterBuffer
- (BOOL)start;
- (BOOL)startHeartbeat;
- (VCTextJitterBuffer)initWithConfiguration:(tagVCTextJitterBufferConfiguration *)a3;
- (id)delegate;
- (tagAudioFrame)allocTextFrame;
- (tagAudioPacket)allocTextPacket;
- (void)dealloc;
- (void)enqueuePacket:(tagAudioPacket *)a3;
- (void)heartbeat;
- (void)jitterQueuePushPacket:(tagAudioPacket *)a3;
- (void)releaseTextFrame:(tagAudioFrame *)a3;
- (void)releaseTextPacket:(tagAudioPacket *)a3;
- (void)setDelegate:(id)a3;
- (void)startHeartbeat;
- (void)stop;
- (void)stopHeartbeat;
@end

@implementation VCTextJitterBuffer

- (VCTextJitterBuffer)initWithConfiguration:(tagVCTextJitterBufferConfiguration *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VCTextJitterBuffer;
  v4 = [(VCTextJitterBuffer *)&v11 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTextJitterBuffer initWithConfiguration:]();
      }
    }
    goto LABEL_18;
  }
  v4->_configuration = *a3;
  objc_storeWeak(&v4->_delegate, a3->delegate);
  v6 = (JitterPreloadQueue_t *)JitterPreloadQueue_Create();
  v5->_preloadQueue = v6;
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTextJitterBuffer initWithConfiguration:]();
      }
    }
    goto LABEL_18;
  }
  JitterQueue_Create();
  v5->_jitterQueue = (JitterQueue_t *)v7;
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTextJitterBuffer initWithConfiguration:]();
      }
    }
LABEL_18:

    return 0;
  }
  JitterQueue_SetMaxPacketTimeDelta(v7, a3->sampleRate, 1.79769313e308);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v13 = v8;
      __int16 v14 = 2080;
      v15 = "-[VCTextJitterBuffer initWithConfiguration:]";
      __int16 v16 = 1024;
      int v17 = 41;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Jitter Buffer Created Successfully", buf, 0x1Cu);
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((VCTextJitterBuffer *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v15 = v4;
        __int16 v16 = 2080;
        int v17 = "-[VCTextJitterBuffer dealloc]";
        __int16 v18 = 1024;
        int v19 = 53;
        v6 = " [%s] %s:%d Cleaning up JitterBuffer";
        v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCTextJitterBuffer *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v15 = v9;
        __int16 v16 = 2080;
        int v17 = "-[VCTextJitterBuffer dealloc]";
        __int16 v18 = 1024;
        int v19 = 53;
        __int16 v20 = 2112;
        v21 = v3;
        __int16 v22 = 2048;
        v23 = self;
        v6 = " [%s] %s:%d %@(%p) Cleaning up JitterBuffer";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  objc_storeWeak(&self->_delegate, 0);
  jitterQueue = (uint64_t *)self->_jitterQueue;
  if (jitterQueue) {
    JitterQueue_Destroy(jitterQueue);
  }
  preloadQueue = (char *)self->_preloadQueue;
  if (preloadQueue) {
    JitterPreloadQueue_Destroy(preloadQueue);
  }
  v13.receiver = self;
  v13.super_class = (Class)VCTextJitterBuffer;
  [(VCTextJitterBuffer *)&v13 dealloc];
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (tagAudioPacket)allocTextPacket
{
  return (tagAudioPacket *)JitterPreloadQueue_AudioPacketAlloc((uint64_t)self->_preloadQueue);
}

- (void)releaseTextPacket:(tagAudioPacket *)a3
{
  if (a3->var16 >= 1)
  {
    uint64_t v5 = 0;
    do
      JitterPreloadQueue_AudioFrameFree((uint64_t)self->_preloadQueue, a3->var15[v5++]);
    while (v5 < a3->var16);
  }
  preloadQueue = self->_preloadQueue;

  JitterPreloadQueue_AudioPacketFree((uint64_t)preloadQueue, a3);
}

- (tagAudioFrame)allocTextFrame
{
  return (tagAudioFrame *)JitterPreloadQueue_AudioFrameAlloc((uint64_t)self->_preloadQueue);
}

- (void)releaseTextFrame:(tagAudioFrame *)a3
{
}

- (BOOL)start
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((VCTextJitterBuffer *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v12 = 136315650;
        *(void *)&v12[4] = v4;
        *(_WORD *)&v12[12] = 2080;
        *(void *)&v12[14] = "-[VCTextJitterBuffer start]";
        *(_WORD *)&v12[22] = 1024;
        LODWORD(v13) = 94;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v12, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCTextJitterBuffer *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v12 = 136316162;
        *(void *)&v12[4] = v9;
        *(_WORD *)&v12[12] = 2080;
        *(void *)&v12[14] = "-[VCTextJitterBuffer start]";
        *(_WORD *)&v12[22] = 1024;
        LODWORD(v13) = 94;
        WORD2(v13) = 2112;
        *(void *)((char *)&v13 + 6) = v3;
        HIWORD(v13) = 2048;
        __int16 v14 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  self->_resetRequested = 1;
  return [(VCTextJitterBuffer *)self startHeartbeat];
}

- (void)stop
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((VCTextJitterBuffer *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)objc_super v11 = 136315650;
        *(void *)&v11[4] = v4;
        *(_WORD *)&v11[12] = 2080;
        *(void *)&v11[14] = "-[VCTextJitterBuffer stop]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 100;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v11, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCTextJitterBuffer *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)objc_super v11 = 136316162;
        *(void *)&v11[4] = v9;
        *(_WORD *)&v11[12] = 2080;
        *(void *)&v11[14] = "-[VCTextJitterBuffer stop]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 100;
        WORD2(v12) = 2112;
        *(void *)((char *)&v12 + 6) = v3;
        HIWORD(v12) = 2048;
        long long v13 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  [(VCTextJitterBuffer *)self stopHeartbeat];
}

- (void)enqueuePacket:(tagAudioPacket *)a3
{
}

- (void)jitterQueuePushPacket:(tagAudioPacket *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v7 = 0;
  if (a3->var16 >= 1)
  {
    uint64_t v5 = 0;
    var15 = a3->var15;
    do
      JitterQueue_Insert((uint64_t)self->_jitterQueue, (unint64_t)var15[v5++], &v7);
    while (v5 < a3->var16);
  }
}

- (BOOL)startHeartbeat
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ((VCTextJitterBuffer *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v21 = v4;
        __int16 v22 = 2080;
        v23 = "-[VCTextJitterBuffer startHeartbeat]";
        __int16 v24 = 1024;
        int v25 = 117;
        __int16 v26 = 2048;
        uint64_t v27 = 0x3FA0E5604189374CLL;
        v6 = " [%s] %s:%d Starting heartbeat (interval=%f)";
        int v7 = v5;
        uint32_t v8 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCTextJitterBuffer *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v21 = v9;
        __int16 v22 = 2080;
        v23 = "-[VCTextJitterBuffer startHeartbeat]";
        __int16 v24 = 1024;
        int v25 = 117;
        __int16 v26 = 2112;
        uint64_t v27 = (uint64_t)v3;
        __int16 v28 = 2048;
        v29 = self;
        __int16 v30 = 2048;
        uint64_t v31 = 0x3FA0E5604189374CLL;
        v6 = " [%s] %s:%d %@(%p) Starting heartbeat (interval=%f)";
        int v7 = v10;
        uint32_t v8 = 58;
        goto LABEL_11;
      }
    }
  }
  self->_firstFrameReceived = 0;
  global_queue = dispatch_get_global_queue(2, 0);
  long long v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, global_queue);
  long long v13 = v12;
  self->_heartbeat = v12;
  if (v12)
  {
    dispatch_source_set_timer((dispatch_source_t)v12, 0, 0x1F78A40uLL, 0xF4240uLL);
    heartbeat = self->_heartbeat;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __36__VCTextJitterBuffer_startHeartbeat__block_invoke;
    handler[3] = &unk_1E6DB3DC8;
    handler[4] = self;
    dispatch_source_set_event_handler(heartbeat, handler);
    dispatch_resume((dispatch_object_t)self->_heartbeat);
  }
  else if ((VCTextJitterBuffer *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTextJitterBuffer startHeartbeat]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v16 = (__CFString *)[(VCTextJitterBuffer *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v16 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      __int16 v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v21 = v17;
        __int16 v22 = 2080;
        v23 = "-[VCTextJitterBuffer startHeartbeat]";
        __int16 v24 = 1024;
        int v25 = 121;
        __int16 v26 = 2112;
        uint64_t v27 = (uint64_t)v16;
        __int16 v28 = 2048;
        v29 = self;
        _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create polling", buf, 0x30u);
      }
    }
  }
  return v13 != 0;
}

uint64_t __36__VCTextJitterBuffer_startHeartbeat__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) heartbeat];
}

- (void)stopHeartbeat
{
  dispatch_source_cancel((dispatch_source_t)self->_heartbeat);
  heartbeat = self->_heartbeat;
  if (heartbeat)
  {
    dispatch_release(heartbeat);
    self->_heartbeat = 0;
  }
}

- (void)heartbeat
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v3 = JitterPreloadQueue_Dequeue((int *)self->_preloadQueue);
  uint64_t v4 = (unsigned __int16 *)v3;
  if (v3 && v3[1] || self->_resetRequested)
  {
    if ((VCTextJitterBuffer *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_15;
      }
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      int v7 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v44 = v6;
      __int16 v45 = 2080;
      v46 = "-[VCTextJitterBuffer heartbeat]";
      __int16 v47 = 1024;
      int v48 = 141;
      uint32_t v8 = " [%s] %s:%d Reset the queue";
      uint64_t v9 = v7;
      uint32_t v10 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v5 = (__CFString *)[(VCTextJitterBuffer *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_15;
      }
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      long long v12 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v44 = v11;
      __int16 v45 = 2080;
      v46 = "-[VCTextJitterBuffer heartbeat]";
      __int16 v47 = 1024;
      int v48 = 141;
      __int16 v49 = 2112;
      *(void *)v50 = v5;
      *(_WORD *)&v50[8] = 2048;
      v51 = self;
      uint32_t v8 = " [%s] %s:%d %@(%p) Reset the queue";
      uint64_t v9 = v12;
      uint32_t v10 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_15:
    JitterQueue_Reset((uint64_t *)self->_jitterQueue);
    self->_resetRequested = 0;
  }
  if (v4)
  {
    if (self->_firstFrameReceived
      && ((int v13 = v4[7] - LOWORD(self->_lastSequenceNumber)) == 0 || (unsigned __int16)v13 >= 0x7FFFu))
    {
      [(VCTextJitterBuffer *)self releaseTextPacket:v4];
    }
    else
    {
      [(VCTextJitterBuffer *)self jitterQueuePushPacket:v4];
      JitterPreloadQueue_AudioPacketFree((uint64_t)self->_preloadQueue, v4);
    }
  }
  unint64_t v14 = JitterQueue_Pop((uint64_t)self->_jitterQueue);
  if (v14)
  {
    unint64_t v16 = v14;
    *(void *)&long long v15 = 136316418;
    long long v42 = v15;
    while (self->_firstFrameReceived
         && (unsigned __int16)(*(_WORD *)(v16 + 10) - LOWORD(self->_lastSequenceNumber)) != 1)
    {
      if (micro() - *(double *)(v16 + 1184) < 1.0)
      {
        JitterQueue_Insert((uint64_t)self->_jitterQueue, v16, 0);
        return;
      }
      objc_msgSend(-[VCTextJitterBuffer delegate](self, "delegate"), "didDetectMissingFrame");
      ++self->_lastSequenceNumber;
      JitterQueue_Insert((uint64_t)self->_jitterQueue, v16, 0);
LABEL_44:
      unint64_t v16 = JitterQueue_Pop((uint64_t)self->_jitterQueue);
      if (!v16) {
        return;
      }
    }
    if ((VCTextJitterBuffer *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        goto LABEL_43;
      }
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      __int16 v28 = *MEMORY[0x1E4F47A50];
      v29 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          int v30 = *(unsigned __int16 *)(v16 + 10);
          int v31 = *(_DWORD *)(v16 + 1144);
          int v32 = *(unsigned __int8 *)(v16 + 8);
          *(_DWORD *)buf = v42;
          uint64_t v44 = v27;
          __int16 v45 = 2080;
          v46 = "-[VCTextJitterBuffer heartbeat]";
          __int16 v47 = 1024;
          int v48 = 171;
          __int16 v49 = 1024;
          *(_DWORD *)v50 = v30;
          *(_WORD *)&v50[4] = 1024;
          *(_DWORD *)&v50[6] = v31;
          LOWORD(v51) = 1024;
          *(_DWORD *)((char *)&v51 + 2) = v32;
          __int16 v24 = v28;
          int v25 = " [%s] %s:%d Frame received seqNumber:%d length:%d isRed:%d";
          uint32_t v26 = 46;
          goto LABEL_39;
        }
LABEL_43:
        objc_msgSend(-[VCTextJitterBuffer delegate](self, "delegate", v42), "didReceiveFrame:", v16);
        self->_lastSequenceNumber = *(unsigned __int16 *)(v16 + 10);
        self->_firstFrameReceived = 1;
        [(VCTextJitterBuffer *)self releaseTextFrame:v16];
        goto LABEL_44;
      }
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_43;
      }
      int v39 = *(unsigned __int16 *)(v16 + 10);
      int v40 = *(_DWORD *)(v16 + 1144);
      int v41 = *(unsigned __int8 *)(v16 + 8);
      *(_DWORD *)buf = v42;
      uint64_t v44 = v27;
      __int16 v45 = 2080;
      v46 = "-[VCTextJitterBuffer heartbeat]";
      __int16 v47 = 1024;
      int v48 = 171;
      __int16 v49 = 1024;
      *(_DWORD *)v50 = v39;
      *(_WORD *)&v50[4] = 1024;
      *(_DWORD *)&v50[6] = v40;
      LOWORD(v51) = 1024;
      *(_DWORD *)((char *)&v51 + 2) = v41;
      v36 = v28;
      v37 = " [%s] %s:%d Frame received seqNumber:%d length:%d isRed:%d";
      uint32_t v38 = 46;
    }
    else
    {
      uint64_t v17 = &stru_1F3D3E450;
      if (objc_opt_respondsToSelector()) {
        uint64_t v17 = (__CFString *)[(VCTextJitterBuffer *)self performSelector:sel_logPrefix];
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        goto LABEL_43;
      }
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      int v19 = *MEMORY[0x1E4F47A50];
      __int16 v20 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = *(unsigned __int16 *)(v16 + 10);
          int v22 = *(_DWORD *)(v16 + 1144);
          int v23 = *(unsigned __int8 *)(v16 + 8);
          *(_DWORD *)buf = 136316930;
          uint64_t v44 = v18;
          __int16 v45 = 2080;
          v46 = "-[VCTextJitterBuffer heartbeat]";
          __int16 v47 = 1024;
          int v48 = 171;
          __int16 v49 = 2112;
          *(void *)v50 = v17;
          *(_WORD *)&v50[8] = 2048;
          v51 = self;
          __int16 v52 = 1024;
          int v53 = v21;
          __int16 v54 = 1024;
          int v55 = v22;
          __int16 v56 = 1024;
          int v57 = v23;
          __int16 v24 = v19;
          int v25 = " [%s] %s:%d %@(%p) Frame received seqNumber:%d length:%d isRed:%d";
          uint32_t v26 = 66;
LABEL_39:
          _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, v26);
          goto LABEL_43;
        }
        goto LABEL_43;
      }
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_43;
      }
      int v33 = *(unsigned __int16 *)(v16 + 10);
      int v34 = *(_DWORD *)(v16 + 1144);
      int v35 = *(unsigned __int8 *)(v16 + 8);
      *(_DWORD *)buf = 136316930;
      uint64_t v44 = v18;
      __int16 v45 = 2080;
      v46 = "-[VCTextJitterBuffer heartbeat]";
      __int16 v47 = 1024;
      int v48 = 171;
      __int16 v49 = 2112;
      *(void *)v50 = v17;
      *(_WORD *)&v50[8] = 2048;
      v51 = self;
      __int16 v52 = 1024;
      int v53 = v33;
      __int16 v54 = 1024;
      int v55 = v34;
      __int16 v56 = 1024;
      int v57 = v35;
      v36 = v19;
      v37 = " [%s] %s:%d %@(%p) Frame received seqNumber:%d length:%d isRed:%d";
      uint32_t v38 = 66;
    }
    _os_log_debug_impl(&dword_1E1EA4000, v36, OS_LOG_TYPE_DEBUG, v37, buf, v38);
    goto LABEL_43;
  }
}

- (void)initWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid Config (nil)", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create pre-load queue", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create jitter queue", v2, v3, v4, v5, v6);
}

- (void)startHeartbeat
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create polling", v2, v3, v4, v5, v6);
}

@end