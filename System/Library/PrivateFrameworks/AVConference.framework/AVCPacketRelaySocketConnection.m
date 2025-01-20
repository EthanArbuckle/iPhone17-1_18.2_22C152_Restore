@interface AVCPacketRelaySocketConnection
- (AVCPacketFilter)packetFilter;
- (AVCPacketRelaySocketConnection)initWithSocket:(unsigned __int16)a3 remoteAddress:(id)a4 packetFilter:(id)a5;
- (BOOL)isDemuxNeeded;
- (BOOL)sendData:(const void *)a3 size:(unsigned int)a4 error:(id *)a5;
- (id)description;
- (id)readHandler;
- (int)start;
- (int)stop;
- (unsigned)type;
- (void)dealloc;
- (void)readyToRead;
- (void)receiveDataOnSocket:(unsigned __int16)a3;
- (void)setIsDemuxNeeded:(BOOL)a3;
- (void)setPacketFilter:(id)a3;
- (void)setReadHandler:(id)a3;
- (void)start;
@end

@implementation AVCPacketRelaySocketConnection

- (AVCPacketRelaySocketConnection)initWithSocket:(unsigned __int16)a3 remoteAddress:(id)a4 packetFilter:(id)a5
{
  int v7 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)AVCPacketRelaySocketConnection;
  v8 = [(AVCPacketRelaySocketConnection *)&v17 init];
  v9 = v8;
  if (!v8) {
    return v9;
  }
  v8->_unixSocket = v7;
  v8->_remoteIPPortLength = 16;
  if (a4)
  {
    if (!objc_msgSend((id)objc_msgSend(a4, "ip"), "length"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCPacketRelaySocketConnection initWithSocket:remoteAddress:packetFilter:]();
        }
      }
      goto LABEL_18;
    }
    if (!getpeername(v7, &v9->_remoteIPPort, &v9->_remoteIPPortLength))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCPacketRelaySocketConnection initWithSocket:remoteAddress:packetFilter:].cold.4(v11);
        }
      }
      goto LABEL_18;
    }
    *(void *)&buf[32] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v10;
    *(_OWORD *)&buf[16] = v10;
    objc_msgSend((id)objc_msgSend(a4, "ip"), "UTF8String");
    [a4 port];
    MakeIPPORT();
    if (buf[0]) {
      IPPORTToSA6();
    }
    else {
      IPPORTToSA();
    }
    v9->_isConnectedSocket = 0;
  }
  else
  {
    if (getpeername(v7, &v8->_remoteIPPort, &v8->_remoteIPPortLength) == -1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCPacketRelaySocketConnection initWithSocket:remoteAddress:packetFilter:]();
        }
      }
      goto LABEL_18;
    }
    v9->_isConnectedSocket = 1;
  }
  v9->_type = 1;
  [(AVCPacketRelaySocketConnection *)v9 setPacketFilter:a5];
  v12 = (char *)malloc_type_malloc(0x5C0uLL, 0x29770484uLL);
  v9->dataBuffer = v12;
  if (v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = objc_msgSend(-[AVCPacketRelaySocketConnection description](v9, "description"), "UTF8String");
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[AVCPacketRelaySocketConnection initWithSocket:remoteAddress:packetFilter:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 105;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v15;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created AVCPacketRelaySocketConnection %s successfully", buf, 0x26u);
      }
    }
    return v9;
  }
LABEL_18:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[AVCPacketRelaySocketConnection initWithSocket:remoteAddress:packetFilter:]();
    }
  }

  return 0;
}

- (int)start
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      uint64_t v9 = v3;
      __int16 v10 = 2080;
      uint64_t v11 = "-[AVCPacketRelaySocketConnection start]";
      __int16 v12 = 1024;
      int v13 = 117;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelaySocketConnection: starting...", (uint8_t *)&v8, 0x1Cu);
    }
  }
  if (self->_readHandler)
  {
    v5 = (void *)MEMORY[0x1E4E589F0]();
    [+[AVCPacketRelayDriver sharedInstance] startMonitoringFileDescriptor:self->_unixSocket forConnection:self];
    return 0;
  }
  else
  {
    int v6 = -2144731132;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCPacketRelaySocketConnection start]();
      }
    }
  }
  return v6;
}

- (int)stop
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      __int16 v10 = "-[AVCPacketRelaySocketConnection stop]";
      __int16 v11 = 1024;
      int v12 = 132;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelaySocketConnection: stopping...", (uint8_t *)&v7, 0x1Cu);
    }
  }
  v5 = (void *)MEMORY[0x1E4E589F0]();
  [+[AVCPacketRelayDriver sharedInstance] stopMonitoringFileDescriptor:self->_unixSocket];
  return 0;
}

- (void)readyToRead
{
}

- (void)receiveDataOnSocket:(unsigned __int16)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self->_isConnectedSocket)
  {
    int v4 = recv(a3, self->dataBuffer, 0x5C0uLL, 0);
  }
  else
  {
    *(void *)&v28.sa_len = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&v28.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
    socklen_t v15 = 16;
    int v4 = recvfrom(a3, self->dataBuffer, 0x5C0uLL, 0, &v28, &v15);
    uint64_t v27 = 0;
    long long v26 = 0u;
    long long v25 = 0u;
    *(void *)&v24[46] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v24[16] = v5;
    *(_OWORD *)&v24[32] = v5;
    *(_OWORD *)v24 = v5;
    SAToIPPORT();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      int v7 = *MEMORY[0x1E4F47A50];
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = IPPORTToStringWithSize();
          *(_DWORD *)buf = 136315906;
          uint64_t v17 = v6;
          __int16 v18 = 2080;
          uint64_t v19 = "-[AVCPacketRelaySocketConnection receiveDataOnSocket:]";
          __int16 v20 = 1024;
          int v21 = 159;
          __int16 v22 = 2080;
          uint64_t v23 = v9;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelaySocketConnection: received from %s", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = IPPORTToStringWithSize();
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v6;
        __int16 v18 = 2080;
        uint64_t v19 = "-[AVCPacketRelaySocketConnection receiveDataOnSocket:]";
        __int16 v20 = 1024;
        int v21 = 159;
        __int16 v22 = 2080;
        uint64_t v23 = v14;
        _os_log_debug_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEBUG, " [%s] %s:%d AVCPacketRelaySocketConnection: received from %s", buf, 0x26u);
      }
    }
  }
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v4 < 0)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCPacketRelaySocketConnection receiveDataOnSocket:]();
      }
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 8)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      int v12 = *MEMORY[0x1E4F47A50];
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v24 = 136315906;
          *(void *)&v24[4] = v11;
          *(_WORD *)&v24[12] = 2080;
          *(void *)&v24[14] = "-[AVCPacketRelaySocketConnection receiveDataOnSocket:]";
          *(_WORD *)&v24[22] = 1024;
          *(_DWORD *)&v24[24] = 166;
          *(_WORD *)&v24[28] = 1024;
          *(_DWORD *)&v24[30] = v4;
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelaySocketConnection: received %d bytes of data", v24, 0x22u);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        -[AVCPacketRelaySocketConnection receiveDataOnSocket:]();
      }
    }
    (*((void (**)(void))self->_readHandler + 2))();
  }
}

- (BOOL)sendData:(const void *)a3 size:(unsigned int)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  p_int unixSocket = &self->_unixSocket;
  int unixSocket = self->_unixSocket;
  ssize_t v10 = a4;
  if (*((unsigned char *)p_unixSocket + 4)) {
    ssize_t v11 = send(unixSocket, a3, a4, 0);
  }
  else {
    ssize_t v11 = sendto(unixSocket, a3, a4, 0, &self->_remoteIPPort, self->_remoteIPPortLength);
  }
  ssize_t v12 = v11;
  if (v11 == -1)
  {
    if (*__error() == 35 || *__error() == 55)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          -[AVCPacketRelaySocketConnection sendData:size:error:]();
          if (!a5) {
            return 0;
          }
LABEL_23:
          v16 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v17 = -2144731103;
          goto LABEL_24;
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        -[AVCPacketRelaySocketConnection sendData:size:error:]();
        if (a5) {
          goto LABEL_23;
        }
        return 0;
      }
    }
    if (a5) {
      goto LABEL_23;
    }
    return 0;
  }
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v12 < v10)
  {
    if (ErrorLogLevelForModule >= 3
      && (uint64_t v14 = VRTraceErrorLogLevelToCSTR(),
          socklen_t v15 = *MEMORY[0x1E4F47A50],
          os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
      int v23 = 136316162;
      uint64_t v24 = v14;
      __int16 v25 = 2080;
      long long v26 = "-[AVCPacketRelaySocketConnection sendData:size:error:]";
      __int16 v27 = 1024;
      int v28 = 195;
      __int16 v29 = 2048;
      ssize_t v30 = v12;
      __int16 v31 = 1024;
      unsigned int v32 = a4;
      _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d AVCPacketRelaySocketConnection: sent %zu bytes < %u total bytes", (uint8_t *)&v23, 0x2Cu);
      if (a5) {
        goto LABEL_9;
      }
    }
    else if (a5)
    {
LABEL_9:
      v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = -2144731122;
LABEL_24:
      int v21 = (void *)[v16 errorWithDomain:@"AVCPacketRelayErrorDomain" code:v17 userInfo:0];
      BOOL result = 0;
      *a5 = v21;
      return result;
    }
    return 0;
  }
  if (ErrorLogLevelForModule >= 8)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    uint64_t v19 = *MEMORY[0x1E4F47A50];
    __int16 v20 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136315906;
        uint64_t v24 = v18;
        __int16 v25 = 2080;
        long long v26 = "-[AVCPacketRelaySocketConnection sendData:size:error:]";
        __int16 v27 = 1024;
        int v28 = 201;
        __int16 v29 = 2048;
        ssize_t v30 = v12;
        _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelaySocketConnection: sent %zu bytes", (uint8_t *)&v23, 0x26u);
      }
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      -[AVCPacketRelaySocketConnection sendData:size:error:]();
    }
  }
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"socket connection with remote IPPort %s, socket %d (connected %d)", IPPORTToStringWithSize(), self->_unixSocket, self->_isConnectedSocket];
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    int v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      ssize_t v10 = "-[AVCPacketRelaySocketConnection dealloc]";
      __int16 v11 = 1024;
      int v12 = 216;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelaySocketConnection: dealloc", buf, 0x1Cu);
    }
  }
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  free(self->dataBuffer);

  v6.receiver = self;
  v6.super_class = (Class)AVCPacketRelaySocketConnection;
  [(AVCPacketRelaySocketConnection *)&v6 dealloc];
}

- (unsigned)type
{
  return self->_type;
}

- (id)readHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setReadHandler:(id)a3
{
}

- (BOOL)isDemuxNeeded
{
  return self->_isDemuxNeeded;
}

- (void)setIsDemuxNeeded:(BOOL)a3
{
  self->_isDemuxNeeded = a3;
}

- (AVCPacketFilter)packetFilter
{
  return (AVCPacketFilter *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPacketFilter:(id)a3
{
}

- (void)initWithSocket:remoteAddress:packetFilter:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[AVCPacketRelaySocketConnection initWithSocket:remoteAddress:packetFilter:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCPacketRelaySocketConnection: init error %08X", v2, *(const char **)v3, (unint64_t)"-[AVCPacketRelaySocketConnection initWithSocket:remoteAddress:packetFilter:]" >> 16, v4);
}

- (void)initWithSocket:remoteAddress:packetFilter:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  __error();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_6_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCPacketRelaySocketConnection: getpeername failed on connected socket %d with errno %d", v2, v3, v4, v5, 2u);
}

- (void)initWithSocket:remoteAddress:packetFilter:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCPacketRelaySocketConnection: invalid remote IPPort", v2, v3, v4, v5, v6);
}

- (void)initWithSocket:(uint64_t)a1 remoteAddress:packetFilter:.cold.4(uint64_t a1)
{
  LODWORD(v3) = 136315906;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v1, v2, " [%s] %s:%d AVCPacketRelaySocketConnection: socket %d is connected. Expected an unconnected socket", (const char *)v3, *((const char **)&v3 + 1), v4, v5);
}

- (void)start
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCPacketRelaySocketConnection: cannot start without setting read handler", v2, v3, v4, v5, v6);
}

- (void)receiveDataOnSocket:.cold.1()
{
  __error();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_12_8();
  OUTLINED_FUNCTION_6_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCPacketRelaySocketConnection: receive failed with error %d on socket %d", v2, v3, v4, v5, v6);
}

- (void)receiveDataOnSocket:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[AVCPacketRelaySocketConnection receiveDataOnSocket:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCPacketRelaySocketConnection: received %d bytes of data", v2, *(const char **)v3, (unint64_t)"-[AVCPacketRelaySocketConnection receiveDataOnSocket:]" >> 16, v4);
}

- (void)sendData:size:error:.cold.1()
{
  __error();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_12_8();
  OUTLINED_FUNCTION_6_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCPacketRelaySocketConnection: send failed with error %d on socket %d", v2, v3, v4, v5, v6);
}

- (void)sendData:size:error:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  __error();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_6_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCPacketRelaySocketConnection: send failed with broken pipe (socket %d), error %d", v2, v3, v4, v5, 2u);
}

- (void)sendData:size:error:.cold.3()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "-[AVCPacketRelaySocketConnection sendData:size:error:]";
  OUTLINED_FUNCTION_3();
  int v4 = 201;
  __int16 v5 = 2048;
  uint64_t v6 = v0;
  _os_log_debug_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_DEBUG, " [%s] %s:%d AVCPacketRelaySocketConnection: sent %zu bytes", v2, 0x26u);
}

@end