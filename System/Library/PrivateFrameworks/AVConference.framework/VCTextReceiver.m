@interface VCTextReceiver
- (BOOL)enqueuePacket:(tagAudioPacket *)a3;
- (BOOL)isSupportedPayload:(int)a3;
- (BOOL)parsePacket:(tagAudioPacket *)a3;
- (BOOL)start;
- (BOOL)stop;
- (NSArray)supportedPayloads;
- (VCTextReceiver)initWithConfiguration:(_VCTextReceiverConfiguration *)a3;
- (VCTextReceiverDelegate)delegate;
- (double)lastReceivedRTCPPacketTime;
- (double)lastReceivedRTPPacketTime;
- (int)retrieveRTPPacket:(tagAudioPacket *)a3;
- (tagAudioFrame)allocFrameWithPacket:(tagAudioPacket *)a3 data:(char *)a4 dataLength:(int)a5 timestamp:(unsigned int)a6;
- (void)dealloc;
- (void)didDetectMissingFrame;
- (void)didReceiveFrame:(tagAudioFrame *)a3;
- (void)initializeTextPacket:(tagAudioPacket *)a3 withMediaPacket:(_RTPMediaPacket *)a4;
- (void)processRTCPPacket;
- (void)processRTPPacket;
- (void)receiverThreadCallback:(tagVCRealTimeThreadParameters *)a3;
- (void)setDelegate:(id)a3;
- (void)setLastReceivedRTCPPacketTime:(double)a3;
- (void)setLastReceivedRTPPacketTime:(double)a3;
- (void)setSupportedPayloads:(id)a3;
- (void)splitPacket:(tagAudioPacket *)a3 packetArray:(tagAudioPacketArray *)a4;
- (void)validateAndEnqueuePackets:(tagAudioPacketArray *)a3;
@end

@implementation VCTextReceiver

- (VCTextReceiver)initWithConfiguration:(_VCTextReceiverConfiguration *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)VCTextReceiver;
  v4 = [(VCTextReceiver *)&v12 init];
  v5 = (VCTextReceiver *)v4;
  if (v4)
  {
    *((void *)v4 + 1) = a3->var0;
    *((_DWORD *)v4 + 4) = a3->var1;
    *(int64x2_t *)(v4 + 56) = vdupq_n_s64(0x7FF8000000000000uLL);
    unsigned int var1 = a3->var1;
    v10[1] = -1431655766;
    v11 = v4;
    v10[0] = var1;
    v7 = [[VCTextJitterBuffer alloc] initWithConfiguration:v10];
    v5->_jitterBuffer = v7;
    if (v7)
    {
      uint64_t v8 = VCRealTimeThread_Initialize(20, (uint64_t)_VCTextReceiver_ReceiveProc, (uint64_t)v5, "com.apple.avconference.textreceiver.rtprecvproc", 0);
      v5->_receiverThread = (tagVCRealTimeThread *)v8;
      if (v8)
      {
        if (!a3->var2
          || (VCTransportStreamRunLoopVTPCreate((const __CFAllocator *)*MEMORY[0x1E4F1CF80], &v5->_runLoop) & 0x80000000) == 0)
        {
          return v5;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCTextReceiver initWithConfiguration:]();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTextReceiver initWithConfiguration:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTextReceiver initWithConfiguration:]();
      }
    }

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  runLoop = self->_runLoop;
  if (runLoop)
  {
    v4 = *(void (**)(OpaqueVCTransportStreamRunLoop *))(*(void *)(CMBaseObjectGetVTable() + 16) + 32);
    if (v4) {
      v4(runLoop);
    }
  }
  VCRealTimeThread_Stop((uint64_t)self->_receiverThread);
  VCRealTimeThread_Finalize((uint64_t)self->_receiverThread);

  self->_jitterBuffer = 0;
  v5 = self->_runLoop;
  if (v5) {
    CFRelease(v5);
  }
  objc_storeWeak((id *)&self->_delegate, 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v10 = v6;
      __int16 v11 = 2080;
      objc_super v12 = "-[VCTextReceiver dealloc]";
      __int16 v13 = 1024;
      int v14 = 75;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCTextReceiver [%s] %s:%d VCTextReceiver cleanup DONE!", buf, 0x1Cu);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)VCTextReceiver;
  [(VCTextReceiver *)&v8 dealloc];
}

- (VCTextReceiverDelegate)delegate
{
  return (VCTextReceiverDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)start
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((VCTextReceiver *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v15 = 136315650;
        *(void *)&v15[4] = v4;
        *(_WORD *)&v15[12] = 2080;
        *(void *)&v15[14] = "-[VCTextReceiver start]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 95;
        uint64_t v6 = "VCTextReceiver [%s] %s:%d ";
        v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v15, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCTextReceiver *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v15 = 136316162;
        *(void *)&v15[4] = v9;
        *(_WORD *)&v15[12] = 2080;
        *(void *)&v15[14] = "-[VCTextReceiver start]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 95;
        WORD2(v16) = 2112;
        *(void *)((char *)&v16 + 6) = v3;
        HIWORD(v16) = 2048;
        v17 = self;
        uint64_t v6 = "VCTextReceiver [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  *(int64x2_t *)&self->_lastReceivedRTPPacketTime = vdupq_n_s64(0x7FF8000000000000uLL);
  if ([(VCTextJitterBuffer *)self->_jitterBuffer start])
  {
    if (VCRealTimeThread_Start((uint64_t)self->_receiverThread)) {
      return 1;
    }
    [(VCTextJitterBuffer *)self->_jitterBuffer stop];
    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
    return 0;
  }
  uint64_t v12 = VRTraceErrorLogLevelToCSTR();
  __int16 v13 = *MEMORY[0x1E4F47A50];
  BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v14)
  {
    *(_DWORD *)uint64_t v15 = 136315650;
    *(void *)&v15[4] = v12;
    *(_WORD *)&v15[12] = 2080;
    *(void *)&v15[14] = "-[VCTextReceiver start]";
    *(_WORD *)&v15[22] = 1024;
    LODWORD(v16) = 99;
    _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VCTextReceiver [%s] %s:%d Failed to start jitter buffer", v15, 0x1Cu);
    return 0;
  }
  return result;
}

- (BOOL)stop
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((VCTextReceiver *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315650;
        uint64_t v16 = v4;
        __int16 v17 = 2080;
        uint64_t v18 = "-[VCTextReceiver stop]";
        __int16 v19 = 1024;
        int v20 = 114;
        uint64_t v6 = "VCTextReceiver [%s] %s:%d ";
        v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v15, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCTextReceiver *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136316162;
        uint64_t v16 = v9;
        __int16 v17 = 2080;
        uint64_t v18 = "-[VCTextReceiver stop]";
        __int16 v19 = 1024;
        int v20 = 114;
        __int16 v21 = 2112;
        v22 = v3;
        __int16 v23 = 2048;
        v24 = self;
        uint64_t v6 = "VCTextReceiver [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  runLoop = self->_runLoop;
  if (runLoop)
  {
    uint64_t v12 = *(void (**)(OpaqueVCTransportStreamRunLoop *))(*(void *)(CMBaseObjectGetVTable() + 16) + 32);
    if (v12) {
      v12(runLoop);
    }
  }
  int v13 = VCRealTimeThread_Stop((uint64_t)self->_receiverThread);
  if (v13) {
    [(VCTextJitterBuffer *)self->_jitterBuffer stop];
  }
  return v13;
}

- (void)initializeTextPacket:(tagAudioPacket *)a3 withMediaPacket:(_RTPMediaPacket *)a4
{
  int var0 = a4->var0;
  a3->var7 = a4->var1;
  a3->var4 = a4->var3;
  a3->var5 = a4->var4;
  a3->var2 = a4->var17;
  a3->var14 = a4->var20.var1;
  BOOL var9 = a4->var9;
  a3->int var0 = var0;
  a3->unint64_t var1 = var9;
  unint64_t var1 = a4->var19.var1;
  var2 = a4->var19.var2;
  a3->var12 = var1;
  memcpy(a3->var11, var2, var1);
}

- (int)retrieveRTPPacket:(tagAudioPacket *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  __int16 v19 = 0;
  int v5 = RTPRecvRTP((uint64_t)self->_rtpHandle, &v19);
  if (v5 < 0)
  {
    v7 = (os_log_t *)MEMORY[0x1E4F47A50];
    *(void *)&long long v6 = 136315906;
    long long v18 = v6;
    while (1)
    {
      RTPReleaseRTPPacket((uint64_t)self->_rtpHandle, &v19);
      if ((v5 & 0x40000000) == 0) {
        break;
      }
      usleep(0x3A98u);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          uint64_t v21 = v8;
          __int16 v22 = 2080;
          __int16 v23 = "-[VCTextReceiver retrieveRTPPacket:]";
          __int16 v24 = 1024;
          int v25 = 152;
          __int16 v26 = 1024;
          LODWORD(v27) = v5;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "VCTextReceiver [%s] %s:%d RTPReceiveRTP returned[%x] sleeping 15000usecs??", buf, 0x22u);
        }
      }
      __int16 v19 = 0;
      int v5 = RTPRecvRTP((uint64_t)self->_rtpHandle, &v19);
      if ((v5 & 0x80000000) == 0) {
        goto LABEL_8;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      int v15 = *v7;
      uint64_t v16 = *v7;
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          uint64_t v21 = v14;
          __int16 v22 = 2080;
          __int16 v23 = "-[VCTextReceiver retrieveRTPPacket:]";
          __int16 v24 = 1024;
          int v25 = 154;
          __int16 v26 = 1024;
          LODWORD(v27) = v5;
          _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, "VCTextReceiver [%s] %s:%d Received an error %x", buf, 0x22u);
        }
      }
      else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        -[VCTextReceiver retrieveRTPPacket:]();
      }
    }
  }
  else
  {
LABEL_8:
    -[VCTextReceiver initializeTextPacket:withMediaPacket:](self, "initializeTextPacket:withMediaPacket:", a3, v19 + 2, v18);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      __int16 v11 = *MEMORY[0x1E4F47A50];
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = *((void *)v19 + 5);
          *(_DWORD *)buf = 136315906;
          uint64_t v21 = v10;
          __int16 v22 = 2080;
          __int16 v23 = "-[VCTextReceiver retrieveRTPPacket:]";
          __int16 v24 = 1024;
          int v25 = 145;
          __int16 v26 = 2048;
          uint64_t v27 = v13;
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCTextReceiver [%s] %s:%d received packet time[%f]", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        -[VCTextReceiver retrieveRTPPacket:]();
      }
    }
    RTPReleaseRTPPacket((uint64_t)self->_rtpHandle, &v19);
  }
  return v5;
}

- (void)receiverThreadCallback:(tagVCRealTimeThreadParameters *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ((VCTextReceiver *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      goto LABEL_18;
    }
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E4F47A50];
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v30 = v6;
      __int16 v31 = 2080;
      v32 = "-[VCTextReceiver receiverThreadCallback:]";
      __int16 v33 = 1024;
      int v34 = 162;
      uint64_t v9 = "VCTextReceiver [%s] %s:%d ";
      uint64_t v10 = v7;
      uint32_t v11 = 28;
LABEL_13:
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      goto LABEL_18;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[VCTextReceiver receiverThreadCallback:]();
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v5 = (__CFString *)[(VCTextReceiver *)self performSelector:sel_logPrefix];
    }
    else {
      int v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v30 = v12;
        __int16 v31 = 2080;
        v32 = "-[VCTextReceiver receiverThreadCallback:]";
        __int16 v33 = 1024;
        int v34 = 162;
        __int16 v35 = 2112;
        v36 = v5;
        __int16 v37 = 2048;
        v38 = self;
        uint64_t v9 = "VCTextReceiver [%s] %s:%d %@(%p) ";
        uint64_t v10 = v13;
        uint32_t v11 = 48;
        goto LABEL_13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v30 = v12;
        __int16 v31 = 2080;
        v32 = "-[VCTextReceiver receiverThreadCallback:]";
        __int16 v33 = 1024;
        int v34 = 162;
        __int16 v35 = 2112;
        v36 = v5;
        __int16 v37 = 2048;
        v38 = self;
        _os_log_debug_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEBUG, "VCTextReceiver [%s] %s:%d %@(%p) ", buf, 0x30u);
      }
    }
  }
LABEL_18:
  unsigned int v28 = 48;
  runLoop = self->_runLoop;
  p_rtpHandle = &self->_rtpHandle;
  if (runLoop)
  {
    if ((RTPGetReceiveStatusWithRunLoop((uint64_t)p_rtpHandle, &v28, 1, (uint64_t)runLoop) & 0x80000000) == 0) {
      goto LABEL_20;
    }
LABEL_25:
    usleep(0x2710u);
    return;
  }
  if ((RTPGetReceiveStatus((uint64_t)p_rtpHandle, &v28, 1, a3->var0) & 0x80000000) != 0) {
    goto LABEL_25;
  }
LABEL_20:
  char v17 = v28;
  if ((v28 & 0x10) == 0) {
    goto LABEL_41;
  }
  if ((VCTextReceiver *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      int v20 = *MEMORY[0x1E4F47A50];
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (!*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[VCTextReceiver receiverThreadCallback:]();
        }
        goto LABEL_40;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v30 = v19;
        __int16 v31 = 2080;
        v32 = "-[VCTextReceiver receiverThreadCallback:]";
        __int16 v33 = 1024;
        int v34 = 178;
        __int16 v22 = "VCTextReceiver [%s] %s:%d Receiving RTP packet";
        __int16 v23 = v20;
        uint32_t v24 = 28;
LABEL_35:
        _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v18 = (__CFString *)[(VCTextReceiver *)self performSelector:sel_logPrefix];
    }
    else {
      long long v18 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      goto LABEL_40;
    }
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    __int16 v26 = *MEMORY[0x1E4F47A50];
    uint64_t v27 = *MEMORY[0x1E4F47A50];
    if (!*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v30 = v25;
        __int16 v31 = 2080;
        v32 = "-[VCTextReceiver receiverThreadCallback:]";
        __int16 v33 = 1024;
        int v34 = 178;
        __int16 v35 = 2112;
        v36 = v18;
        __int16 v37 = 2048;
        v38 = self;
        _os_log_debug_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEBUG, "VCTextReceiver [%s] %s:%d %@(%p) Receiving RTP packet", buf, 0x30u);
      }
      goto LABEL_40;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v30 = v25;
      __int16 v31 = 2080;
      v32 = "-[VCTextReceiver receiverThreadCallback:]";
      __int16 v33 = 1024;
      int v34 = 178;
      __int16 v35 = 2112;
      v36 = v18;
      __int16 v37 = 2048;
      v38 = self;
      __int16 v22 = "VCTextReceiver [%s] %s:%d %@(%p) Receiving RTP packet";
      __int16 v23 = v26;
      uint32_t v24 = 48;
      goto LABEL_35;
    }
  }
LABEL_40:
  [(VCTextReceiver *)self processRTPPacket];
  char v17 = v28;
LABEL_41:
  if ((v17 & 0x20) != 0) {
    [(VCTextReceiver *)self processRTCPPacket];
  }
}

- (void)processRTPPacket
{
  v5[101] = *MEMORY[0x1E4F143B8];
  v3 = [(VCTextJitterBuffer *)self->_jitterBuffer allocTextPacket];
  if ([(VCTextReceiver *)self retrieveRTPPacket:v3] < 0)
  {
    jitterBuffer = self->_jitterBuffer;
    [(VCTextJitterBuffer *)jitterBuffer releaseTextPacket:v3];
  }
  else
  {
    self->_lastReceivedRTPPacketTime = micro();
    bzero(v5, 0x328uLL);
    [(VCTextReceiver *)self splitPacket:v3 packetArray:v5];
    [(VCTextReceiver *)self validateAndEnqueuePackets:v5];
  }
}

- (void)processRTCPPacket
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCTextReceiver processRTCPPacket]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCTextReceiver [%s] %s:%d Failed to retrieve RTCP packet. Error:%x", v2, *(const char **)v3, (unint64_t)"-[VCTextReceiver processRTCPPacket]" >> 16, v4);
}

- (BOOL)isSupportedPayload:(int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  supportedPayloads = self->_supportedPayloads;
  uint64_t v5 = [(NSArray *)supportedPayloads countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(supportedPayloads);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) unsignedIntValue] == a3)
        {
          LOBYTE(v9) = 1;
          return v9;
        }
      }
      uint64_t v6 = [(NSArray *)supportedPayloads countByEnumeratingWithState:&v12 objects:v11 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_12;
  }
  VRTraceErrorLogLevelToCSTR();
  BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v9)
  {
    -[VCTextReceiver isSupportedPayload:]();
LABEL_12:
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (void)validateAndEnqueuePackets:(tagAudioPacketArray *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = AudioPacketArray_Next((unint64_t)a3);
  if (v5)
  {
    unint64_t v7 = v5;
    uint64_t v8 = (os_log_t *)MEMORY[0x1E4F47A50];
    *(void *)&long long v6 = 136315650;
    long long v17 = v6;
    while (-[VCTextReceiver isSupportedPayload:](self, "isSupportedPayload:", *(unsigned int *)(v7 + 24), v17))
    {
      if (![(VCTextReceiver *)self enqueuePacket:v7])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          os_log_t v10 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            uint64_t v19 = v9;
            __int16 v20 = 2080;
            uint64_t v21 = "-[VCTextReceiver validateAndEnqueuePackets:]";
            __int16 v22 = 1024;
            int v23 = 235;
            uint32_t v11 = v10;
            long long v12 = "VCTextReceiver [%s] %s:%d Failed to enqueue packet";
            uint32_t v13 = 28;
            goto LABEL_14;
          }
        }
        goto LABEL_10;
      }
LABEL_11:
      unint64_t v7 = AudioPacketArray_Next((unint64_t)a3);
      if (!v7) {
        return;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      os_log_t v15 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      {
        int v16 = *(_DWORD *)(v7 + 24);
        *(_DWORD *)buf = 136315906;
        uint64_t v19 = v14;
        __int16 v20 = 2080;
        uint64_t v21 = "-[VCTextReceiver validateAndEnqueuePackets:]";
        __int16 v22 = 1024;
        int v23 = 230;
        __int16 v24 = 1024;
        int v25 = v16;
        uint32_t v11 = v15;
        long long v12 = "VCTextReceiver [%s] %s:%d Payload not supported:%d";
        uint32_t v13 = 34;
LABEL_14:
        _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, v12, buf, v13);
      }
    }
LABEL_10:
    [(VCTextJitterBuffer *)self->_jitterBuffer releaseTextPacket:v7];
    goto LABEL_11;
  }
}

- (void)splitPacket:(tagAudioPacket *)a3 packetArray:(tagAudioPacketArray *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3->var7 == 20)
  {
    memset(v11, 0, sizeof(v11));
    int v7 = VCAudioRedBuilder_SplitRedAudioPacket((uint64_t)self->_rtpHandle, a3, (uint64_t)v11, 4, self->_sampleRate, 0);
    if (v7 >= 1)
    {
      uint64_t v8 = v7;
      uint64_t v9 = (int *)v11;
      do
      {
        os_log_t v10 = [(VCTextJitterBuffer *)self->_jitterBuffer allocTextPacket];
        AudioPacket_initNewPacket((uint64_t)a3, (uint64_t)v10);
        if (VCAudioRedBuilder_UpdateAudioPacketWithRedPayload((uint64_t)v10, v9)) {
          AudioPacketArray_Append((uint64_t)a4, (uint64_t)v10);
        }
        else {
          [(VCTextJitterBuffer *)self->_jitterBuffer releaseTextPacket:v10];
        }
        v9 += 8;
        --v8;
      }
      while (v8);
    }
    [(VCTextJitterBuffer *)self->_jitterBuffer releaseTextPacket:a3];
  }
  else
  {
    AudioPacketArray_Append((uint64_t)a4, (uint64_t)a3);
  }
}

- (tagAudioFrame)allocFrameWithPacket:(tagAudioPacket *)a3 data:(char *)a4 dataLength:(int)a5 timestamp:(unsigned int)a6
{
  os_log_t v10 = [(VCTextJitterBuffer *)self->_jitterBuffer allocTextFrame];
  uint32_t v11 = v10;
  if (v10)
  {
    int var0 = a3->var0;
    v10->int var0 = 0;
    v10->unint64_t var1 = var0;
    v10->var11 = 0;
    v10->var3 = a3->var4;
    v10->var2 = a3->var3;
    v10->var4 = a6;
    v10->var6 = a5;
    v10->var12 = a3->var17;
    v10->var14 = a3->var7;
    memcpy(v10->var5, a4, a5);
  }
  return v11;
}

- (BOOL)parsePacket:(tagAudioPacket *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3->var7 == 109)
  {
    unsigned int var12 = a3->var12;
    if (var12 <= 0x465 && a3->var14 < 0x11u)
    {
      int v7 = [(VCTextReceiver *)self allocFrameWithPacket:a3 data:a3->var11 dataLength:a3->var12 timestamp:a3->var5];
      if (v7)
      {
        uint64_t var16 = a3->var16;
        a3->uint64_t var16 = var16 + 1;
        a3->var15[var16] = v7;
        LOBYTE(v7) = 1;
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_16;
        }
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        long long v6 = *MEMORY[0x1E4F47A50];
        LODWORD(v7) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (v7)
        {
          int var14 = a3->var14;
          int v14 = 136316162;
          uint64_t v15 = v11;
          __int16 v16 = 2080;
          long long v17 = "-[VCTextReceiver parsePacket:]";
          __int16 v18 = 1024;
          int v19 = 307;
          __int16 v20 = 1024;
          unsigned int v21 = var12;
          __int16 v22 = 1024;
          int v23 = var14;
          uint64_t v9 = "VCTextReceiver [%s] %s:%d Failed to create frame. Data size: %d, padding len: %u";
          goto LABEL_7;
        }
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      {
LABEL_16:
        LOBYTE(v7) = 0;
        return (char)v7;
      }
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      long long v6 = *MEMORY[0x1E4F47A50];
      LODWORD(v7) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (v7)
      {
        int v8 = a3->var14;
        int v14 = 136316162;
        uint64_t v15 = v5;
        __int16 v16 = 2080;
        long long v17 = "-[VCTextReceiver parsePacket:]";
        __int16 v18 = 1024;
        int v19 = 301;
        __int16 v20 = 1024;
        unsigned int v21 = var12;
        __int16 v22 = 1024;
        int v23 = v8;
        uint64_t v9 = "VCTextReceiver [%s] %s:%d Unable to fit audio data into the audioFrame buffer. Data size: %d, padding len: %u";
LABEL_7:
        _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v14, 0x28u);
        goto LABEL_16;
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_16;
    }
    VRTraceErrorLogLevelToCSTR();
    LODWORD(v7) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (v7)
    {
      -[VCTextReceiver parsePacket:]();
      goto LABEL_16;
    }
  }
  return (char)v7;
}

- (BOOL)enqueuePacket:(tagAudioPacket *)a3
{
  BOOL v5 = -[VCTextReceiver parsePacket:](self, "parsePacket:");
  if (v5) {
    [(VCTextJitterBuffer *)self->_jitterBuffer enqueuePacket:a3];
  }
  return v5;
}

- (void)didDetectMissingFrame
{
  v2 = [(VCTextReceiver *)self delegate];

  [(VCTextReceiverDelegate *)v2 didReceiveText:@"\uFFFD"];
}

- (void)didReceiveFrame:(tagAudioFrame *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a3->var14 == 109)
  {
    if (a3->var6 > 0)
    {
      int v4 = (void *)[[NSString alloc] initWithBytes:a3->var5 length:a3->var6 encoding:4];
      if ((VCTextReceiver *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v8 = VRTraceErrorLogLevelToCSTR();
          uint64_t v9 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)unsigned int v28 = 136315650;
            *(void *)&v28[4] = v8;
            *(_WORD *)&v28[12] = 2080;
            *(void *)&v28[14] = "-[VCTextReceiver didReceiveFrame:]";
            *(_WORD *)&v28[22] = 1024;
            LODWORD(v29) = 343;
            os_log_t v10 = "VCTextReceiver [%s] %s:%d ";
            uint64_t v11 = v9;
            uint32_t v12 = 28;
LABEL_19:
            _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, v28, v12);
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          BOOL v5 = (__CFString *)[(VCTextReceiver *)self performSelector:sel_logPrefix];
        }
        else {
          BOOL v5 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v13 = VRTraceErrorLogLevelToCSTR();
          int v14 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)unsigned int v28 = 136316162;
            *(void *)&v28[4] = v13;
            *(_WORD *)&v28[12] = 2080;
            *(void *)&v28[14] = "-[VCTextReceiver didReceiveFrame:]";
            *(_WORD *)&v28[22] = 1024;
            LODWORD(v29) = 343;
            WORD2(v29) = 2112;
            *(void *)((char *)&v29 + 6) = v5;
            HIWORD(v29) = 2048;
            uint64_t v30 = self;
            os_log_t v10 = "VCTextReceiver [%s] %s:%d %@(%p) ";
            uint64_t v11 = v14;
            uint32_t v12 = 48;
            goto LABEL_19;
          }
        }
      }
      if ((VCTextReceiver *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          uint64_t v16 = VRTraceErrorLogLevelToCSTR();
          long long v17 = *MEMORY[0x1E4F47A50];
          __int16 v18 = *MEMORY[0x1E4F47A50];
          if (!*MEMORY[0x1E4F47A40])
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
              [(VCTextReceiver *)v16 didReceiveFrame:v17];
            }
            goto LABEL_37;
          }
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = [v4 length];
            *(_DWORD *)unsigned int v28 = 136316162;
            *(void *)&v28[4] = v16;
            *(_WORD *)&v28[12] = 2080;
            *(void *)&v28[14] = "-[VCTextReceiver didReceiveFrame:]";
            *(_WORD *)&v28[22] = 1024;
            LODWORD(v29) = 344;
            WORD2(v29) = 2112;
            *(void *)((char *)&v29 + 6) = v4;
            HIWORD(v29) = 2048;
            uint64_t v30 = (VCTextReceiver *)v19;
            __int16 v20 = "VCTextReceiver [%s] %s:%d Received text:%@ length:%lu";
            unsigned int v21 = v17;
            uint32_t v22 = 48;
LABEL_32:
            _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v20, v28, v22);
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v15 = (__CFString *)[(VCTextReceiver *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v15 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
          goto LABEL_37;
        }
        uint64_t v23 = VRTraceErrorLogLevelToCSTR();
        uint64_t v24 = *MEMORY[0x1E4F47A50];
        int v25 = *MEMORY[0x1E4F47A50];
        if (!*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v27 = [v4 length];
            *(_DWORD *)unsigned int v28 = 136316674;
            *(void *)&v28[4] = v23;
            *(_WORD *)&v28[12] = 2080;
            *(void *)&v28[14] = "-[VCTextReceiver didReceiveFrame:]";
            *(_WORD *)&v28[22] = 1024;
            LODWORD(v29) = 344;
            WORD2(v29) = 2112;
            *(void *)((char *)&v29 + 6) = v15;
            HIWORD(v29) = 2048;
            uint64_t v30 = self;
            *(_WORD *)__int16 v31 = 2112;
            *(void *)&v31[2] = v4;
            *(_WORD *)&v31[10] = 2048;
            *(void *)&v31[12] = v27;
            _os_log_debug_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEBUG, "VCTextReceiver [%s] %s:%d %@(%p) Received text:%@ length:%lu", v28, 0x44u);
          }
          goto LABEL_37;
        }
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = [v4 length];
          *(_DWORD *)unsigned int v28 = 136316674;
          *(void *)&v28[4] = v23;
          *(_WORD *)&v28[12] = 2080;
          *(void *)&v28[14] = "-[VCTextReceiver didReceiveFrame:]";
          *(_WORD *)&v28[22] = 1024;
          LODWORD(v29) = 344;
          WORD2(v29) = 2112;
          *(void *)((char *)&v29 + 6) = v15;
          HIWORD(v29) = 2048;
          uint64_t v30 = self;
          *(_WORD *)__int16 v31 = 2112;
          *(void *)&v31[2] = v4;
          *(_WORD *)&v31[10] = 2048;
          *(void *)&v31[12] = v26;
          __int16 v20 = "VCTextReceiver [%s] %s:%d %@(%p) Received text:%@ length:%lu";
          unsigned int v21 = v24;
          uint32_t v22 = 68;
          goto LABEL_32;
        }
      }
LABEL_37:
      [(VCTextReceiverDelegate *)[(VCTextReceiver *)self delegate] didReceiveText:v4];

      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      int v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)unsigned int v28 = 136315650;
        *(void *)&v28[4] = v6;
        *(_WORD *)&v28[12] = 2080;
        *(void *)&v28[14] = "-[VCTextReceiver didReceiveFrame:]";
        *(_WORD *)&v28[22] = 1024;
        LODWORD(v29) = 338;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "VCTextReceiver [%s] %s:%d Discarding empty text frame", v28, 0x1Cu);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCTextReceiver didReceiveFrame:]();
    }
  }
}

- (NSArray)supportedPayloads
{
  return self->_supportedPayloads;
}

- (void)setSupportedPayloads:(id)a3
{
}

- (double)lastReceivedRTPPacketTime
{
  return self->_lastReceivedRTPPacketTime;
}

- (void)setLastReceivedRTPPacketTime:(double)a3
{
  self->_lastReceivedRTPPacketTime = a3;
}

- (double)lastReceivedRTCPPacketTime
{
  return self->_lastReceivedRTCPPacketTime;
}

- (void)setLastReceivedRTCPPacketTime:(double)a3
{
  self->_lastReceivedRTCPPacketTime = a3;
}

- (void)initWithConfiguration:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 44;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, "VCTextReceiver [%s] %s:%d Failed to create the jitter buffer", v1, 0x1Cu);
}

- (void)initWithConfiguration:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 47;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, "VCTextReceiver [%s] %s:%d Failed to initalize the text receiver thread", v1, 0x1Cu);
}

- (void)initWithConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCTextReceiver initWithConfiguration:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCTextReceiver [%s] %s:%d VCTransportStreamRunLoopVTPCreate failed %d", v2, *(const char **)v3, (unint64_t)"-[VCTextReceiver initWithConfiguration:]" >> 16, v4);
}

- (void)retrieveRTPPacket:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  int v3 = 145;
  __int16 v4 = 2048;
  uint64_t v5 = v0;
  _os_log_debug_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_DEBUG, "VCTextReceiver [%s] %s:%d received packet time[%f]", v2, 0x26u);
}

- (void)retrieveRTPPacket:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  int v2 = "-[VCTextReceiver retrieveRTPPacket:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, "VCTextReceiver [%s] %s:%d Received an error %x", v1, 0x22u);
}

- (void)receiverThreadCallback:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 178;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, "VCTextReceiver [%s] %s:%d Receiving RTP packet", v1, 0x1Cu);
}

- (void)receiverThreadCallback:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 162;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, "VCTextReceiver [%s] %s:%d ", v1, 0x1Cu);
}

- (void)isSupportedPayload:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCTextReceiver isSupportedPayload:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCTextReceiver [%s] %s:%d Received a packet with unknown payload: %d", v2, *(const char **)v3, (unint64_t)"-[VCTextReceiver isSupportedPayload:]" >> 16, v4);
}

- (void)parsePacket:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCTextReceiver [%s] %s:%d Unrecognized payload type: %d", v2, v3, v4, 296);
}

- (void)didReceiveFrame:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [a2 length];
  int v7 = 136316162;
  uint64_t v8 = a1;
  OUTLINED_FUNCTION_0();
  int v9 = 344;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  __int16 v12 = 2048;
  uint64_t v13 = v6;
  _os_log_debug_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_DEBUG, "VCTextReceiver [%s] %s:%d Received text:%@ length:%lu", (uint8_t *)&v7, 0x30u);
}

- (void)didReceiveFrame:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCTextReceiver [%s] %s:%d Unexpected payload type: %u", v2, v3, v4, 334);
}

@end