@interface VCTextTransmitter
- (BOOL)start;
- (BOOL)startHeartbeat;
- (VCTextTransmitter)initWithConfiguration:(_VCTextTransmitterConfiguration *)a3;
- (unsigned)getCharTimestampForSystemTime:(double)a3;
- (void)dealloc;
- (void)heartbeat;
- (void)sendCharacter:(unsigned __int16)a3;
- (void)sendText:(id)a3;
- (void)sendTextFrameWithRedundancy:(id)a3 marker:(int)a4;
- (void)startHeartbeat;
- (void)stop;
- (void)stopHeartbeat;
- (void)updatePayloadHistory:(id)a3 timestamp:(unsigned int)a4 payloadType:(int *)a5 payload:(char *)a6 payloadLength:(int *)a7;
@end

@implementation VCTextTransmitter

- (VCTextTransmitter)initWithConfiguration:(_VCTextTransmitterConfiguration *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)VCTextTransmitter;
  v4 = [(VCTextTransmitter *)&v12 init];
  v5 = (VCTextTransmitter *)v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)&a3->rtpHandle;
    *((void *)v4 + 3) = *(void *)&a3->numRedundantPayloads;
    *(_OWORD *)(v4 + 8) = v6;
    LODWORD(v6) = *((_DWORD *)v4 + 7);
    double v7 = *(float *)&v6;
    BOOL v8 = *(float *)&v6 <= 0.0;
    double v9 = 0.0333333333;
    if (!v8) {
      double v9 = v7;
    }
    *((double *)v4 + 4) = v9;
    *((void *)v4 + 8) = 0x6D00000014;
    *((void *)v4 + 7) = -[VCAudioRedBuilder initWithRedPayloadType:sampleRate:samplesPerFrame:numPayloads:maxDelay:includeSequenceOffset:]([VCAudioRedBuilder alloc], "initWithRedPayloadType:sampleRate:samplesPerFrame:numPayloads:maxDelay:includeSequenceOffset:", *((unsigned int *)v4 + 16));
    v5->_textFramesSendQueueLock = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    v5->_textFramesSendQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5->_isIdle = 1;
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(56);
    v5->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCTextTransmitter", 0, CustomRootQueue);
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  v3.receiver = self;
  v3.super_class = (Class)VCTextTransmitter;
  [(VCTextTransmitter *)&v3 dealloc];
}

- (BOOL)start
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((VCTextTransmitter *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      objc_super v3 = (__CFString *)[(VCTextTransmitter *)self performSelector:sel_logPrefix];
    }
    else {
      objc_super v3 = &stru_1F3D3E450;
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
    *(void *)&buf[4] = v9;
    __int16 v20 = 2080;
    v21 = "-[VCTextTransmitter start]";
    __int16 v22 = 1024;
    int v23 = 60;
    __int16 v24 = 2112;
    v25 = v3;
    __int16 v26 = 2048;
    v27 = self;
    long long v6 = "VCTextTransmitter [%s] %s:%d %@(%p) ";
    double v7 = v10;
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
      *(void *)&buf[4] = v4;
      __int16 v20 = 2080;
      v21 = "-[VCTextTransmitter start]";
      __int16 v22 = 1024;
      int v23 = 60;
      long long v6 = "VCTextTransmitter [%s] %s:%d ";
      double v7 = v5;
      uint32_t v8 = 28;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_12:
  self->_startTime = micro();
  [(VCTextTransmitter *)self sendCharacter:65279];
  unsigned int numRedundantPayloads = self->_config.numRedundantPayloads;
  if (numRedundantPayloads)
  {
    int v12 = 0;
    for (unsigned int i = 0; i < numRedundantPayloads; ++i)
    {
      uint64_t v14 = [(VCTextTransmitter *)self getCharTimestampForSystemTime:self->_startTime - self->_txIntervalMin * (double)(numRedundantPayloads + v12)];
      int currentPayloadType = self->_currentPayloadType;
      int v17 = 0;
      int v18 = currentPayloadType;
      *(void *)buf = 0;
      [(VCTextTransmitter *)self updatePayloadHistory:&stru_1F3D3E450 timestamp:v14 payloadType:&v18 payload:buf payloadLength:&v17];
      unsigned int numRedundantPayloads = self->_config.numRedundantPayloads;
      --v12;
    }
  }
  return [(VCTextTransmitter *)self startHeartbeat];
}

- (void)stop
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((VCTextTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v11 = 136315650;
        *(void *)&v11[4] = v4;
        *(_WORD *)&v11[12] = 2080;
        *(void *)&v11[14] = "-[VCTextTransmitter stop]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 75;
        long long v6 = "VCTextTransmitter [%s] %s:%d ";
        double v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v11, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      objc_super v3 = (__CFString *)[(VCTextTransmitter *)self performSelector:sel_logPrefix];
    }
    else {
      objc_super v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v11 = 136316162;
        *(void *)&v11[4] = v9;
        *(_WORD *)&v11[12] = 2080;
        *(void *)&v11[14] = "-[VCTextTransmitter stop]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 75;
        WORD2(v12) = 2112;
        *(void *)((char *)&v12 + 6) = v3;
        HIWORD(v12) = 2048;
        uint64_t v13 = self;
        long long v6 = "VCTextTransmitter [%s] %s:%d %@(%p) ";
        double v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  self->_startTime = 0.0;
  [(VCTextTransmitter *)self stopHeartbeat];
}

- (void)sendCharacter:(unsigned __int16)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  unsigned __int16 v3 = a3;
  -[VCTextTransmitter sendText:](self, "sendText:", [NSString stringWithCharacters:&v3 length:1]);
}

- (void)sendText:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_startTime == 0.0)
  {
    if ((VCTextTransmitter *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTextTransmitter sendText:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v4 = (__CFString *)[(VCTextTransmitter *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint32_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v9 = 136316162;
          uint64_t v10 = v7;
          __int16 v11 = 2080;
          long long v12 = "-[VCTextTransmitter sendText:]";
          __int16 v13 = 1024;
          int v14 = 88;
          __int16 v15 = 2112;
          v16 = v4;
          __int16 v17 = 2048;
          int v18 = self;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, "VCTextTransmitter [%s] %s:%d %@(%p) Trying to send when the transmitter is stopped!", (uint8_t *)&v9, 0x30u);
        }
      }
    }
  }
  else
  {
    [(NSLock *)self->_textFramesSendQueueLock lock];
    [(NSMutableArray *)self->_textFramesSendQueue addObject:a3];
    textFramesSendQueueLock = self->_textFramesSendQueueLock;
    [(NSLock *)textFramesSendQueueLock unlock];
  }
}

- (unsigned)getCharTimestampForSystemTime:(double)a3
{
  double startTime = self->_startTime;
  double v4 = a3 - startTime;
  LODWORD(startTime) = self->_config.sampleRate;
  return (v4 * (double)*(unint64_t *)&startTime);
}

- (void)sendTextFrameWithRedundancy:(id)a3 marker:(int)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if ((VCTextTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      int v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v36 = v8;
        __int16 v37 = 2080;
        v38 = "-[VCTextTransmitter sendTextFrameWithRedundancy:marker:]";
        __int16 v39 = 1024;
        int v40 = 103;
        uint64_t v10 = "VCTextTransmitter [%s] %s:%d ";
        __int16 v11 = v9;
        uint32_t v12 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCTextTransmitter *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      int v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v36 = v13;
        __int16 v37 = 2080;
        v38 = "-[VCTextTransmitter sendTextFrameWithRedundancy:marker:]";
        __int16 v39 = 1024;
        int v40 = 103;
        __int16 v41 = 2112;
        id v42 = v7;
        __int16 v43 = 2048;
        v44 = self;
        uint64_t v10 = "VCTextTransmitter [%s] %s:%d %@(%p) ";
        __int16 v11 = v14;
        uint32_t v12 = 48;
        goto LABEL_11;
      }
    }
  }
  if ((VCTextTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      goto LABEL_29;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    __int16 v17 = *MEMORY[0x1E4F47A50];
    int v18 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v36 = v16;
      __int16 v37 = 2080;
      v38 = "-[VCTextTransmitter sendTextFrameWithRedundancy:marker:]";
      __int16 v39 = 1024;
      int v40 = 104;
      __int16 v41 = 2112;
      id v42 = a3;
      uint64_t v19 = "VCTextTransmitter [%s] %s:%d Sending text:%@";
      __int16 v20 = v17;
      uint32_t v21 = 38;
LABEL_24:
      _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
      goto LABEL_29;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[VCTextTransmitter sendTextFrameWithRedundancy:marker:]();
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v15 = (__CFString *)[(VCTextTransmitter *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v15 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      int v23 = *MEMORY[0x1E4F47A50];
      __int16 v24 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_29;
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v36 = v22;
        __int16 v37 = 2080;
        v38 = "-[VCTextTransmitter sendTextFrameWithRedundancy:marker:]";
        __int16 v39 = 1024;
        int v40 = 104;
        __int16 v41 = 2112;
        id v42 = v15;
        __int16 v43 = 2048;
        v44 = self;
        __int16 v45 = 2112;
        id v46 = a3;
        uint64_t v19 = "VCTextTransmitter [%s] %s:%d %@(%p) Sending text:%@";
        __int16 v20 = v23;
        uint32_t v21 = 58;
        goto LABEL_24;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v36 = v22;
        __int16 v37 = 2080;
        v38 = "-[VCTextTransmitter sendTextFrameWithRedundancy:marker:]";
        __int16 v39 = 1024;
        int v40 = 104;
        __int16 v41 = 2112;
        id v42 = v15;
        __int16 v43 = 2048;
        v44 = self;
        __int16 v45 = 2112;
        id v46 = a3;
        _os_log_debug_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEBUG, "VCTextTransmitter [%s] %s:%d %@(%p) Sending text:%@", buf, 0x3Au);
      }
    }
  }
LABEL_29:
  double v25 = micro();
  uint64_t v26 = -[VCTextTransmitter getCharTimestampForSystemTime:](self, "getCharTimestampForSystemTime:");
  int currentPayloadType = self->_currentPayloadType;
  v33 = 0;
  unsigned int v32 = 0;
  [(VCTextTransmitter *)self updatePayloadHistory:a3 timestamp:v26 payloadType:&currentPayloadType payload:&v33 payloadLength:&v32];
  if (v33)
  {
    int v31 = 0;
    float txIntervalMin = self->_txIntervalMin;
    if ((RTPSendRTP((uint64_t)self->_config.rtpHandle, currentPayloadType, a4, v26, v33, v32, &v31, 0, v25, txIntervalMin, 0, 0, 0, 0, 0, 0) & 0x80000000) != 0)
    {
      if ((VCTextTransmitter *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCTextTransmitter sendTextFrameWithRedundancy:marker:]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v28 = (__CFString *)[(VCTextTransmitter *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v28 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v29 = VRTraceErrorLogLevelToCSTR();
          v30 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v36 = v29;
            __int16 v37 = 2080;
            v38 = "-[VCTextTransmitter sendTextFrameWithRedundancy:marker:]";
            __int16 v39 = 1024;
            int v40 = 116;
            __int16 v41 = 2112;
            id v42 = v28;
            __int16 v43 = 2048;
            v44 = self;
            _os_log_error_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_ERROR, "VCTextTransmitter [%s] %s:%d %@(%p) failed to send RTP", buf, 0x30u);
          }
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCTextTransmitter sendTextFrameWithRedundancy:marker:]();
    }
  }
}

- (void)updatePayloadHistory:(id)a3 timestamp:(unsigned int)a4 payloadType:(int *)a5 payload:(char *)a6 payloadLength:(int *)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ((VCTextTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      __int16 v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v26 = 136315650;
        *(void *)&v26[4] = v14;
        *(_WORD *)&v26[12] = 2080;
        *(void *)&v26[14] = "-[VCTextTransmitter updatePayloadHistory:timestamp:payloadType:payload:payloadLength:]";
        *(_WORD *)&v26[22] = 1024;
        *(_DWORD *)&v26[24] = 124;
        uint64_t v16 = "VCTextTransmitter [%s] %s:%d ";
        __int16 v17 = v15;
        uint32_t v18 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, v26, v18);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v13 = (__CFString *)[(VCTextTransmitter *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      __int16 v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v26 = 136316162;
        *(void *)&v26[4] = v19;
        *(_WORD *)&v26[12] = 2080;
        *(void *)&v26[14] = "-[VCTextTransmitter updatePayloadHistory:timestamp:payloadType:payload:payloadLength:]";
        *(_WORD *)&v26[22] = 1024;
        *(_DWORD *)&v26[24] = 124;
        *(_WORD *)&v26[28] = 2112;
        *(void *)&v26[30] = v13;
        *(_WORD *)&v26[38] = 2048;
        v27 = self;
        uint64_t v16 = "VCTextTransmitter [%s] %s:%d %@(%p) ";
        __int16 v17 = v20;
        uint32_t v18 = 48;
        goto LABEL_11;
      }
    }
  }
  *a5 = self->_currentPayloadType;
  *a6 = (char *)objc_msgSend(a3, "cStringUsingEncoding:", 4, *(_OWORD *)v26, *(void *)&v26[16], *(_OWORD *)&v26[24], v27);
  *a7 = [a3 lengthOfBytesUsingEncoding:4];
  if (self->_config.isRedEnabled)
  {
    int v21 = RTPGetExternalPayload((uint64_t)self->_config.rtpHandle, LOWORD(self->_currentPayloadType));
    *a5 = v21;
    *(void *)&long long v22 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t v26 = v22;
    *(_OWORD *)&v26[16] = v22;
    v26[0] = 1;
    *(void *)&v26[8] = *a6;
    *(_DWORD *)&v26[16] = *a7;
    *(_DWORD *)&v26[20] = a4;
    v26[24] = -1;
    v27 = 0;
    uint64_t v28 = 0;
    *(void *)&v26[32] = 0;
    uint64_t PrimaryPayloadAndAppendSamples = VCAudioRedBuilder_GetPrimaryPayloadAndAppendSamples((uint64_t)self->_redBuilder, v26, v21);
    if ([(VCAudioRedBuilder *)self->_redBuilder numPayloads])
    {
      __int16 v24 = [(VCAudioRedBuilder *)self->_redBuilder redPayloadForPrimaryPayload:PrimaryPayloadAndAppendSamples];
      if (v24)
      {
        *a5 = v24->payloadType;
        *a6 = v24->buffer;
        int bufferLength = v24->bufferLength;
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCTextTransmitter updatePayloadHistory:timestamp:payloadType:payload:payloadLength:]();
          }
        }
        int bufferLength = 0;
        *a6 = 0;
      }
      *a7 = bufferLength;
    }
    if ([a3 length] != 1 || objc_msgSend(a3, "characterAtIndex:", 0) != 65279) {
      VCAudioRedBuilder_UpdatePayloadHistory((uint64_t)self->_redBuilder);
    }
  }
}

- (void)heartbeat
{
  [(NSLock *)self->_textFramesSendQueueLock lock];
  if ([(NSMutableArray *)self->_textFramesSendQueue count])
  {
    id v3 = (id)[(NSMutableArray *)self->_textFramesSendQueue componentsJoinedByString:&stru_1F3D3E450];
    [(NSMutableArray *)self->_textFramesSendQueue removeAllObjects];
    [(NSLock *)self->_textFramesSendQueueLock unlock];
    [(VCTextTransmitter *)self sendTextFrameWithRedundancy:v3 marker:self->_isIdle];

    self->_idleDuration = 0.0;
    self->_emptyFramesToBeSent = self->_config.numRedundantPayloads;
    self->_isIdle = 0;
  }
  else
  {
    [(NSLock *)self->_textFramesSendQueueLock unlock];
    double v4 = self->_txIntervalMin + self->_idleDuration;
    self->_idleDuration = v4;
    if (v4 > 0.3)
    {
      self->_isIdle = 1;
      if (self->_emptyFramesToBeSent)
      {
        [(VCTextTransmitter *)self sendTextFrameWithRedundancy:&stru_1F3D3E450 marker:0];
        --self->_emptyFramesToBeSent;
      }
    }
  }
}

- (BOOL)startHeartbeat
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ((VCTextTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double txIntervalMin = self->_txIntervalMin;
        *(_DWORD *)buf = 136315906;
        uint64_t v22 = v4;
        __int16 v23 = 2080;
        __int16 v24 = "-[VCTextTransmitter startHeartbeat]";
        __int16 v25 = 1024;
        int v26 = 192;
        __int16 v27 = 2048;
        double v28 = txIntervalMin;
        uint64_t v7 = "VCTextTransmitter [%s] %s:%d Starting sending heartbeat (interval=%f)";
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
      id v3 = (__CFString *)[(VCTextTransmitter *)self performSelector:sel_logPrefix];
    }
    else {
      id v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      __int16 v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double v12 = self->_txIntervalMin;
        *(_DWORD *)buf = 136316418;
        uint64_t v22 = v10;
        __int16 v23 = 2080;
        __int16 v24 = "-[VCTextTransmitter startHeartbeat]";
        __int16 v25 = 1024;
        int v26 = 192;
        __int16 v27 = 2112;
        double v28 = *(double *)&v3;
        __int16 v29 = 2048;
        v30 = self;
        __int16 v31 = 2048;
        double v32 = v12;
        uint64_t v7 = "VCTextTransmitter [%s] %s:%d %@(%p) Starting sending heartbeat (interval=%f)";
        uint64_t v8 = v11;
        uint32_t v9 = 58;
        goto LABEL_11;
      }
    }
  }
  uint64_t v13 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  uint64_t v14 = v13;
  self->_heartbeat = v13;
  if (v13)
  {
    dispatch_source_set_timer((dispatch_source_t)v13, 0, (unint64_t)(self->_txIntervalMin * 1000000000.0), 0xF4240uLL);
    heartbeat = self->_heartbeat;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __35__VCTextTransmitter_startHeartbeat__block_invoke;
    handler[3] = &unk_1E6DB3DC8;
    handler[4] = self;
    dispatch_source_set_event_handler(heartbeat, handler);
    dispatch_resume((dispatch_object_t)self->_heartbeat);
  }
  else if ((VCTextTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTextTransmitter startHeartbeat]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = (__CFString *)[(VCTextTransmitter *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      uint64_t v19 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v22 = v18;
        __int16 v23 = 2080;
        __int16 v24 = "-[VCTextTransmitter startHeartbeat]";
        __int16 v25 = 1024;
        int v26 = 195;
        __int16 v27 = 2112;
        double v28 = *(double *)&v17;
        __int16 v29 = 2048;
        v30 = self;
        _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, "VCTextTransmitter [%s] %s:%d %@(%p) Failed to create polling", buf, 0x30u);
      }
    }
  }
  return v14 != 0;
}

uint64_t __35__VCTextTransmitter_startHeartbeat__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) heartbeat];
}

- (void)stopHeartbeat
{
  heartbeat = self->_heartbeat;
  if (heartbeat)
  {
    dispatch_source_cancel(heartbeat);
    uint64_t v4 = self->_heartbeat;
    if (v4)
    {
      dispatch_release(v4);
      self->_heartbeat = 0;
    }
  }
}

- (void)sendText:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCTextTransmitter [%s] %s:%d Trying to send when the transmitter is stopped!", v2, v3, v4, v5, v6);
}

- (void)sendTextFrameWithRedundancy:marker:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCTextTransmitter [%s] %s:%d Invalid payload!", v2, v3, v4, v5, v6);
}

- (void)sendTextFrameWithRedundancy:marker:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCTextTransmitter [%s] %s:%d failed to send RTP", v2, v3, v4, v5, v6);
}

- (void)sendTextFrameWithRedundancy:marker:.cold.3()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = "-[VCTextTransmitter sendTextFrameWithRedundancy:marker:]";
  __int16 v6 = 1024;
  int v7 = 104;
  __int16 v8 = 2112;
  uint64_t v9 = v1;
  _os_log_debug_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_DEBUG, "VCTextTransmitter [%s] %s:%d Sending text:%@", v3, 0x26u);
}

- (void)updatePayloadHistory:timestamp:payloadType:payload:payloadLength:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCTextTransmitter [%s] %s:%d Invalid red payload!", v2, v3, v4, v5, v6);
}

- (void)startHeartbeat
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCTextTransmitter [%s] %s:%d Failed to create polling", v2, v3, v4, v5, v6);
}

@end