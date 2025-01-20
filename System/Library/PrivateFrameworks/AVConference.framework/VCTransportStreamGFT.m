@interface VCTransportStreamGFT
- (VCTransportStreamGFT)initWithTransportSessionID:(unsigned int)a3 options:(id)a4;
- (int)VCTransportStreamSendPacket:(id *)a3;
- (int)receivePacket:(id *)a3;
- (int)registerPacketCallbackContext:(void *)a3 callback:(id)a4;
- (int)unregisterPacketCallback;
- (tagVCMediaQueue)mediaQueue;
- (void)VCTransportStreamUnblock;
- (void)dealloc;
- (void)setMediaQueue:(tagVCMediaQueue *)a3;
@end

@implementation VCTransportStreamGFT

- (VCTransportStreamGFT)initWithTransportSessionID:(unsigned int)a3 options:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)VCTransportStreamGFT;
  v5 = [(VCTransportStreamGFT *)&v17 init];
  if (!v5) {
    return v5;
  }
  +[VCVTPWrapper startVTP];
  int v6 = VTP_SocketForIDS();
  if (v6 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportStreamGFT initWithTransportSessionID:options:](v14, (uint64_t)v5, v15);
      }
    }
    goto LABEL_13;
  }
  v5->_unsigned int transportSessionID = a3;
  v5->_int vtpReceiveSocket = v6;
  v5->_int vtpCancelSocket = VTP_Socket(2, 1, 6);
  v5->_vtpCallbackId = -1;
  VTP_SetSocketMode(v5->_vtpReceiveSocket, 2);
  VTP_SetPktType(v5->_vtpReceiveSocket, 0x20000);
  VTP_SetTransportSessionID(v5->_vtpReceiveSocket, v5->_transportSessionID);
  CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0xAuLL, 0, 0, 0, 0xAuLL, 1u, &v5->_emptyBlockBuffer);
  emptyBlockBuffer = v5->_emptyBlockBuffer;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (!emptyBlockBuffer)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportStreamGFT initWithTransportSessionID:options:]();
      }
    }
LABEL_13:

    return 0;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int transportSessionID = v5->_transportSessionID;
      int vtpReceiveSocket = v5->_vtpReceiveSocket;
      int vtpCancelSocket = v5->_vtpCancelSocket;
      *(_DWORD *)buf = 136316674;
      uint64_t v19 = v9;
      __int16 v20 = 2080;
      v21 = "-[VCTransportStreamGFT initWithTransportSessionID:options:]";
      __int16 v22 = 1024;
      int v23 = 70;
      __int16 v24 = 2048;
      v25 = v5;
      __int16 v26 = 1024;
      unsigned int v27 = transportSessionID;
      __int16 v28 = 1024;
      int v29 = vtpReceiveSocket;
      __int16 v30 = 1024;
      int v31 = vtpCancelSocket;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created VCTransportStream object [%p] for sessionID %d, with vfd:%d, vfdCancel:%d", buf, 0x38u);
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      v10 = "-[VCTransportStreamGFT dealloc]";
      __int16 v11 = 1024;
      int v12 = 77;
      __int16 v13 = 2048;
      uint64_t v14 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d dealloc [%p]", buf, 0x26u);
    }
  }
  VTP_Close(self->_vtpCancelSocket);
  VTP_Close(self->_vtpReceiveSocket);
  +[VCVTPWrapper stopVTP];
  emptyBlockBuffer = self->_emptyBlockBuffer;
  if (emptyBlockBuffer)
  {
    CFRelease(emptyBlockBuffer);
    self->_emptyBlockBuffer = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)VCTransportStreamGFT;
  [(VCTransportStreamGFT *)&v6 dealloc];
}

- (int)VCTransportStreamSendPacket:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    mediaQueue = self->_mediaQueue;
    if (mediaQueue)
    {
      *(void *)&v19[0] = 0;
      int v6 = VCMediaQueue_AllocMediaPacket((uint64_t)mediaQueue, a3->var5.streamIDs[0], 1, (uint64_t)v19);
      if (v6 < 0)
      {
        int v14 = v6;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCTransportStreamGFT VCTransportStreamSendPacket:]();
          }
        }
      }
      else
      {
        double v7 = micro();
        uint64_t v8 = *(void *)&v19[0];
        *(double *)(*(void *)&v19[0] + 272) = v7;
        *(_OWORD *)(v8 + 16) = *(_OWORD *)a3->var5.streamIDs;
        long long v9 = *(_OWORD *)&a3->var5.streamIDs[8];
        long long v10 = *(_OWORD *)&a3->var5.participantID;
        long long v11 = *(_OWORD *)&a3->var5.encryptionSequenceNumber;
        *(_OWORD *)(v8 + 64) = *(_OWORD *)&a3->var5.statsPayload.serverPacketInterval;
        *(_OWORD *)(v8 + 80) = v11;
        *(_OWORD *)(v8 + 32) = v9;
        *(_OWORD *)(v8 + 48) = v10;
        *(_DWORD *)(v8 + 228) = a3->var5.streamIDs[0];
        *(_DWORD *)(v8 + 264) = self->_vtpReceiveSocket;
        *(_DWORD *)(v8 + 232) = self->_transportSessionID;
        *(_DWORD *)(v8 + 176) = 0;
        int IDSHeaderSizeWithChannelDataFormatArray = VCIDSChannelData_GetIDSHeaderSizeWithChannelDataFormatArray((uint64_t)&a3->var5, 1u);
        uint64_t v13 = *(void *)&v19[0];
        **(_DWORD **)&v19[0] = IDSHeaderSizeWithChannelDataFormatArray;
        *(void *)(v13 + 8) = self->_emptyBlockBuffer;
        *(unsigned char *)(v13 + 294) = 1;
        int v14 = VCMediaQueue_AddPacket((uint64_t)self->_mediaQueue, v13);
        if (v14 < 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCTransportStreamGFT VCTransportStreamSendPacket:]();
          }
        }
      }
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v15 = *(_OWORD *)a3->var5.streamIDs;
      long long v21 = *(_OWORD *)&a3->var5.streamIDs[8];
      long long v22 = 0u;
      long long v16 = *(_OWORD *)&a3->var5.statsPayload.serverPacketInterval;
      long long v22 = *(_OWORD *)&a3->var5.participantID;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      memset(v19, 0, sizeof(v19));
      long long v23 = v16;
      long long v24 = 0u;
      long long v24 = *(_OWORD *)&a3->var5.encryptionSequenceNumber;
      uint64_t v29 = 0;
      int vtpReceiveSocket = self->_vtpReceiveSocket;
      DWORD2(v19[0]) = self->_transportSessionID;
      long long v20 = v15;
      BYTE13(v21) = 1;
      VTP_Send(vtpReceiveSocket, a3->var2, a3->var3, a3->var4, (uint64_t)v19);
      return 0;
    }
  }
  else
  {
    int v14 = -2144206847;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportStreamGFT VCTransportStreamSendPacket:]();
      }
    }
  }
  return v14;
}

- (int)receivePacket:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_int vtpReceiveSocket = &self->_vtpReceiveSocket;
  if (self->_vtpReceiveSocket == -1 || (unint64_t vtpCancelSocket = self->_vtpCancelSocket, vtpCancelSocket == -1))
  {
    int v12 = -2144206806;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportStreamGFT receivePacket:]();
      }
    }
  }
  else
  {
    memset(v23, 0, sizeof(v23));
    if (__darwin_check_fd_set_overflow(vtpCancelSocket, v23, 0)) {
      *(_DWORD *)((char *)v23 + ((vtpCancelSocket >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << vtpCancelSocket;
    }
    long long v9 = &self->_vtpReceiveSocket;
    int vtpReceiveSocket = self->_vtpReceiveSocket;
    int v8 = v9[1];
    if (__darwin_check_fd_set_overflow(vtpReceiveSocket, v23, 0)) {
      *(_DWORD *)((char *)v23 + (((unint64_t)vtpReceiveSocket >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << vtpReceiveSocket;
    }
    int v10 = *p_vtpReceiveSocket;
    if (*p_vtpReceiveSocket <= v8) {
      int v10 = v8;
    }
    int v11 = VTP_Select((v10 + 1), v23, 0, 0, 0);
    int v12 = v11;
    if (v11)
    {
      if (v11 == -1)
      {
        if (*__error() != 9) {
          return *__error() | 0xC00F0000;
        }
        return 0;
      }
      int v13 = *p_vtpReceiveSocket;
      if (!__darwin_check_fd_set_overflow(*p_vtpReceiveSocket, v23, 0)
        || ((*(_DWORD *)((char *)v23 + (((unint64_t)v13 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v13) & 1) == 0)
      {
        return 0;
      }
      long long v22 = 0;
      int v12 = VTP_Recvfrom(*p_vtpReceiveSocket, &v22);
      if (v12 < 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v20 = VRTraceErrorLogLevelToCSTR();
          long long v21 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            [(VCTransportStreamGFT *)v20 receivePacket:v21];
          }
        }
      }
      else
      {
        int v14 = v22;
        long long v15 = v22 + 184;
        *(_OWORD *)a3->var5.streamIDs = *(_OWORD *)(v22 + 360);
        long long v16 = v15[12];
        long long v17 = v15[13];
        long long v18 = v15[15];
        *(_OWORD *)&a3->var5.statsPayload.serverPacketInterval = v15[14];
        *(_OWORD *)&a3->var5.encryptionSequenceNumber = v18;
        *(_OWORD *)&a3->var5.streamIDs[8] = v16;
        *(_OWORD *)&a3->var5.participantID = v17;
        a3->var0 = *((_DWORD *)v14 + 51);
        a3->var1 = *(double *)v14;
        VTP_ReleasePacket((void **)&v22);
      }
    }
  }
  return v12;
}

- (void)VCTransportStreamUnblock
{
  int vtpCancelSocket = self->_vtpCancelSocket;
  if (vtpCancelSocket != -1)
  {
    VTP_Close(vtpCancelSocket);
    self->_int vtpCancelSocket = -1;
  }
}

- (int)registerPacketCallbackContext:(void *)a3 callback:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    unint64_t vtpReceiveSocket = self->_vtpReceiveSocket;
    if (vtpReceiveSocket < 0x400)
    {
      if (self->_vtpCallbackId == -1)
      {
        *(_OWORD *)self->_readFDsForCallback.fds_bits = 0u;
        p_readFDsForCallback = &self->_readFDsForCallback;
        *(_OWORD *)&self->_readFDsForCallback.fds_bits[24] = 0u;
        *(_OWORD *)&self->_readFDsForCallback.fds_bits[28] = 0u;
        *(_OWORD *)&self->_readFDsForCallback.fds_bits[16] = 0u;
        *(_OWORD *)&self->_readFDsForCallback.fds_bits[20] = 0u;
        *(_OWORD *)&self->_readFDsForCallback.fds_bits[8] = 0u;
        *(_OWORD *)&self->_readFDsForCallback.fds_bits[12] = 0u;
        *(_OWORD *)&self->_readFDsForCallback.fds_bits[4] = 0u;
        if (__darwin_check_fd_set_overflow(vtpReceiveSocket, &self->_readFDsForCallback, 0)) {
          *(__int32_t *)((char *)p_readFDsForCallback->fds_bits + ((vtpReceiveSocket >> 3) & 0x1FFFFFFC)) |= 1 << vtpReceiveSocket;
        }
        self->_callback = _Block_copy(a4);
        self->_callbackContext = a3;
        int v8 = 0;
        self->_int vtpCallbackId = VTP_RegisterPacketCallback(self->_readFDsForCallback.fds_bits, (uint64_t)self, &__block_literal_global_102);
      }
      else
      {
        int v8 = -2144206844;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v14 = VRTraceErrorLogLevelToCSTR();
          long long v15 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            int vtpCallbackId = self->_vtpCallbackId;
            int v19 = 136316162;
            uint64_t v20 = v14;
            __int16 v21 = 2080;
            long long v22 = "-[VCTransportStreamGFT registerPacketCallbackContext:callback:]";
            __int16 v23 = 1024;
            int v24 = 191;
            __int16 v25 = 2048;
            long long v26 = self;
            __int16 v27 = 1024;
            LODWORD(v28) = vtpCallbackId;
            _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d transportStream[%p] already registered a vtpCallbackId [%d]", (uint8_t *)&v19, 0x2Cu);
            return -2144206844;
          }
        }
      }
    }
    else
    {
      int v8 = -2144206806;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        int v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v11 = self->_vtpReceiveSocket;
          int v19 = 136316162;
          uint64_t v20 = v9;
          __int16 v21 = 2080;
          long long v22 = "-[VCTransportStreamGFT registerPacketCallbackContext:callback:]";
          __int16 v23 = 1024;
          int v24 = 186;
          __int16 v25 = 2048;
          long long v26 = self;
          __int16 v27 = 1024;
          LODWORD(v28) = v11;
          _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d transportStream[%p] socket[%d] is invalid", (uint8_t *)&v19, 0x2Cu);
          return -2144206806;
        }
      }
    }
  }
  else
  {
    int v8 = -2144206847;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      int v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v19 = 136316418;
        uint64_t v20 = v12;
        __int16 v21 = 2080;
        long long v22 = "-[VCTransportStreamGFT registerPacketCallbackContext:callback:]";
        __int16 v23 = 1024;
        int v24 = 181;
        __int16 v25 = 2048;
        long long v26 = self;
        __int16 v27 = 2048;
        id v28 = a4;
        __int16 v29 = 2048;
        uint64_t v30 = a3;
        _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d transportStream[%p] callback %p or callback context %p is invalid", (uint8_t *)&v19, 0x3Au);
      }
    }
  }
  return v8;
}

uint64_t __63__VCTransportStreamGFT_registerPacketCallbackContext_callback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  bzero(v9, 0x5D8uLL);
  long long v6 = *(_OWORD *)(a4 + 51);
  long long v13 = *(_OWORD *)(a4 + 49);
  long long v14 = v6;
  long long v15 = *(_OWORD *)(a4 + 53);
  long long v7 = *(_OWORD *)(a4 + 47);
  long long v11 = *(_OWORD *)(a4 + 45);
  long long v12 = v7;
  v9[0] = *((_DWORD *)a4 + 51);
  uint64_t v10 = *a4;
  uint64_t result = *(void *)(a3 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, unsigned char *))(result + 16))(result, *(void *)(a3 + 40), v9);
  }
  return result;
}

- (int)unregisterPacketCallback
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int vtpCallbackId = self->_vtpCallbackId;
  if (vtpCallbackId == -1)
  {
    int v4 = -2144206844;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      long long v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v8 = self->_vtpCallbackId;
        int v9 = 136316162;
        uint64_t v10 = v5;
        __int16 v11 = 2080;
        long long v12 = "-[VCTransportStreamGFT unregisterPacketCallback]";
        __int16 v13 = 1024;
        int v14 = 210;
        __int16 v15 = 2048;
        uint64_t v16 = self;
        __int16 v17 = 1024;
        int v18 = v8;
        _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d transportStream[%p] cannot unregister an invalid vtpCallbackId [%d]", (uint8_t *)&v9, 0x2Cu);
      }
    }
  }
  else
  {
    VTP_UnregisterPacketCallback(vtpCallbackId);
    _Block_release(self->_callback);
    int v4 = 0;
    self->_callback = 0;
    self->_callbackContext = 0;
    self->_int vtpCallbackId = -1;
  }
  return v4;
}

- (tagVCMediaQueue)mediaQueue
{
  return self->_mediaQueue;
}

- (void)setMediaQueue:(tagVCMediaQueue *)a3
{
  self->_mediaQueue = a3;
}

- (void)initWithTransportSessionID:(NSObject *)a3 options:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(void *)&v3[14] = "-[VCTransportStreamGFT initWithTransportSessionID:options:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, a2, a3, " [%s] %s:%d Could not create VTP socket for VCTransportStream for sessionID=%d", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCTransportStreamGFT initWithTransportSessionID:options:]" >> 16, 49);
}

- (void)initWithTransportSessionID:options:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Out of memory when creating CMBlockBuffer!", v2, v3, v4, v5, v6);
}

- (void)VCTransportStreamSendPacket:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d invalid packet", v2, v3, v4, v5, v6);
}

- (void)VCTransportStreamSendPacket:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCTransportStreamGFT VCTransportStreamSendPacket:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate media packet. (%X)", v2, *(const char **)v3, (unint64_t)"-[VCTransportStreamGFT VCTransportStreamSendPacket:]" >> 16, 95);
}

- (void)VCTransportStreamSendPacket:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCTransportStreamGFT VCTransportStreamSendPacket:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to add media packet. (%X)", v2, *(const char **)v3, (unint64_t)"-[VCTransportStreamGFT VCTransportStreamSendPacket:]" >> 16, 108);
}

- (void)receivePacket:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid socket, return", v2, v3, v4, v5, v6);
}

- (void)receivePacket:(NSObject *)a3 .cold.2(uint64_t a1, int *a2, NSObject *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v5 = *a2;
  unsigned int v6 = *__error() | 0xC00F0000;
  int v7 = 136316418;
  uint64_t v8 = a1;
  __int16 v9 = 2080;
  uint64_t v10 = "-[VCTransportStreamGFT receivePacket:]";
  __int16 v11 = 1024;
  int v12 = 157;
  __int16 v13 = 1024;
  int v14 = v5;
  __int16 v15 = 1024;
  unsigned int v16 = v6;
  __int16 v17 = 1024;
  int v18 = -1;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d VTP_Recvfrom(%d) failed(%08X) for sessionID=%d", (uint8_t *)&v7, 0x2Eu);
}

@end