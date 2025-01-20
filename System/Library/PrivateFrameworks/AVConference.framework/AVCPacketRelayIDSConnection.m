@interface AVCPacketRelayIDSConnection
- (AVCPacketFilter)packetFilter;
- (AVCPacketRelayIDSConnection)initWithIDSDestination:(id)a3;
- (AVCPacketRelayIDSConnection)initWithIDSSocketDescriptor:(unsigned __int16)a3;
- (BOOL)isDemuxNeeded;
- (BOOL)isResumed;
- (BOOL)sendData:(const void *)a3 size:(unsigned int)a4 error:(id *)a5;
- (id)readHandler;
- (int)start;
- (int)stop;
- (unsigned)type;
- (void)dealloc;
- (void)readyToRead;
- (void)setIsDemuxNeeded:(BOOL)a3;
- (void)setIsResumed:(BOOL)a3;
- (void)setPacketFilter:(id)a3;
- (void)setReadHandler:(id)a3;
- (void)start;
@end

@implementation AVCPacketRelayIDSConnection

- (AVCPacketRelayIDSConnection)initWithIDSSocketDescriptor:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)AVCPacketRelayIDSConnection;
  uint64_t v13 = 0;
  v4 = [(AVCPacketRelayIDSConnection *)&v12 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = 2;
    v6 = (IDSService *)[objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.private.alloy.willow.stream"];
    v5->_packetRelayService = v6;
    if (v6
      && (v7 = (IDSDatagramChannel *)(id)[(IDSService *)v6 datagramChannelForSocketDescriptor:v3 error:&v13], (v5->_datagramChannel = v7) != 0))
    {
      [(AVCPacketRelayIDSConnection *)v5 setPacketFilter:0];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = objc_msgSend((id)-[AVCPacketRelayIDSConnection description](v5, "description"), "UTF8String");
          *(_DWORD *)buf = 136315906;
          uint64_t v15 = v8;
          __int16 v16 = 2080;
          v17 = "-[AVCPacketRelayIDSConnection initWithIDSSocketDescriptor:]";
          __int16 v18 = 1024;
          int v19 = 264;
          __int16 v20 = 2080;
          uint64_t v21 = v10;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created AVCPacketRelayIDSConnection %s successfully", buf, 0x26u);
        }
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCPacketRelayIDSConnection initWithIDSSocketDescriptor:]();
        }
      }

      return 0;
    }
  }
  return v5;
}

- (AVCPacketRelayIDSConnection)initWithIDSDestination:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)AVCPacketRelayIDSConnection;
  uint64_t v13 = 0;
  v4 = [(AVCPacketRelayIDSConnection *)&v12 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = 2;
    v6 = (IDSService *)[objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.private.alloy.willow.stream"];
    v5->_packetRelayService = v6;
    if (v6
      && (v7 = (IDSDatagramChannel *)(id)[(IDSService *)v6 datagramChannelForSessionDestination:a3 error:&v13], (v5->_datagramChannel = v7) != 0))
    {
      [(AVCPacketRelayIDSConnection *)v5 setPacketFilter:0];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = objc_msgSend((id)-[AVCPacketRelayIDSConnection description](v5, "description"), "UTF8String");
          *(_DWORD *)buf = 136315906;
          uint64_t v15 = v8;
          __int16 v16 = 2080;
          v17 = "-[AVCPacketRelayIDSConnection initWithIDSDestination:]";
          __int16 v18 = 1024;
          int v19 = 289;
          __int16 v20 = 2080;
          uint64_t v21 = v10;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created AVCPacketRelayIDSConnection %s successfully", buf, 0x26u);
        }
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCPacketRelayIDSConnection initWithIDSDestination:]();
        }
      }

      return 0;
    }
  }
  return v5;
}

- (int)start
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(AVCPacketRelayIDSConnection *)self isResumed])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return 0;
    }
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    int v5 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v15 = v3;
      __int16 v16 = 2080;
      v17 = "-[AVCPacketRelayIDSConnection start]";
      __int16 v18 = 1024;
      int v19 = 302;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelayIDSConnection: already started", buf, 0x1Cu);
      return 0;
    }
  }
  else
  {
    id readHandler = self->_readHandler;
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (readHandler)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v15 = v8;
          __int16 v16 = 2080;
          v17 = "-[AVCPacketRelayIDSConnection start]";
          __int16 v18 = 1024;
          int v19 = 311;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelayIDSConnection: starting...", buf, 0x1Cu);
        }
      }
      uint64_t v10 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __36__AVCPacketRelayIDSConnection_start__block_invoke;
      v13[3] = &unk_1E6DB8FA0;
      v13[4] = v10;
      [(IDSDatagramChannel *)self->_datagramChannel setReadHandler:v13];
      v11 = (void *)MEMORY[0x1E4E589F0]([(IDSDatagramChannel *)self->_datagramChannel setEventHandler:&__block_literal_global_82]);
      [+[AVCPacketRelayDriver sharedInstance] startMonitoringFileDescriptor:[(IDSDatagramChannel *)self->_datagramChannel underlyingFileDescriptor] forConnection:self];
      [(AVCPacketRelayIDSConnection *)self setIsResumed:1];
      return 0;
    }
    int v5 = -2144731132;
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCPacketRelayIDSConnection start]();
      }
    }
  }
  return v5;
}

void __36__AVCPacketRelayIDSConnection_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, void *a6)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v23 = 136316162;
        uint64_t v24 = v8;
        __int16 v25 = 2080;
        v26 = "-[AVCPacketRelayIDSConnection start]_block_invoke";
        __int16 v27 = 1024;
        int v28 = 316;
        __int16 v29 = 1024;
        int v30 = a4;
        __int16 v31 = 2080;
        uint64_t v32 = objc_msgSend((id)objc_msgSend(a6, "description"), "UTF8String");
        _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d AVCPacketRelayIDSConnection: Datagram channel link %d failed to read with error %s", (uint8_t *)&v23, 0x2Cu);
      }
    }
  }
  else if ([*(id *)(a1 + 32) weak] {
         && (uint64_t v13 = MEMORY[0x1E4E56580]([*(id *)(a1 + 32) weak])) != 0)
  }
  {
    v14 = (void *)v13;
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (a3)
    {
      if (ErrorLogLevelForModule >= 8)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E4F47A50];
        __int16 v18 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            int v23 = 136315906;
            uint64_t v24 = v16;
            __int16 v25 = 2080;
            v26 = "-[AVCPacketRelayIDSConnection start]_block_invoke";
            __int16 v27 = 1024;
            int v28 = 333;
            __int16 v29 = 1024;
            int v30 = a3;
            _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelayIDSConnection: reading %u bytes", (uint8_t *)&v23, 0x22u);
          }
        }
        else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          __36__AVCPacketRelayIDSConnection_start__block_invoke_cold_2();
        }
      }
      uint64_t v22 = [v14 readHandler];
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(v22 + 16))(v22, a2, a3, [v14 isDemuxNeeded], 0);
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __36__AVCPacketRelayIDSConnection_start__block_invoke_cold_1(v21);
      }
    }
    CFRelease(v14);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    uint64_t v20 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315650;
      uint64_t v24 = v19;
      __int16 v25 = 2080;
      v26 = "-[AVCPacketRelayIDSConnection start]_block_invoke";
      __int16 v27 = 1024;
      int v28 = 322;
      _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelayConnection has been dealloced", (uint8_t *)&v23, 0x1Cu);
    }
  }
}

void __36__AVCPacketRelayIDSConnection_start__block_invoke_78(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F6A718]];
  if (v2)
  {
    uint64_t v3 = v2;
    if ([v2 unsignedIntValue] == 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v4 = VRTraceErrorLogLevelToCSTR();
        int v5 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 136315650;
          uint64_t v9 = v4;
          __int16 v10 = 2080;
          v11 = "-[AVCPacketRelayIDSConnection start]_block_invoke";
          __int16 v12 = 1024;
          int v13 = 347;
          v6 = " [%s] %s:%d AVCPacketRelayIDSConnection: IDS channel connected";
LABEL_13:
          _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0x1Cu);
        }
      }
    }
    else if ([v3 unsignedIntValue] == 2 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      int v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315650;
        uint64_t v9 = v7;
        __int16 v10 = 2080;
        v11 = "-[AVCPacketRelayIDSConnection start]_block_invoke";
        __int16 v12 = 1024;
        int v13 = 349;
        v6 = " [%s] %s:%d AVCPacketRelayIDSConnection: IDS channel disconnected";
        goto LABEL_13;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __36__AVCPacketRelayIDSConnection_start__block_invoke_78_cold_1();
    }
  }
}

- (int)stop
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      __int16 v10 = "-[AVCPacketRelayIDSConnection stop]";
      __int16 v11 = 1024;
      int v12 = 366;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelayIDSConnection: stopping...", (uint8_t *)&v7, 0x1Cu);
    }
  }
  int v5 = (void *)MEMORY[0x1E4E589F0]([(AVCPacketRelayIDSConnection *)self setIsResumed:0]);
  [+[AVCPacketRelayDriver sharedInstance] stopMonitoringFileDescriptor:[(IDSDatagramChannel *)self->_datagramChannel underlyingFileDescriptor]];
  return 0;
}

- (void)readyToRead
{
  if ([(AVCPacketRelayIDSConnection *)self isResumed])
  {
    datagramChannel = self->_datagramChannel;
    [(IDSDatagramChannel *)datagramChannel readyToRead];
  }
}

- (BOOL)sendData:(const void *)a3 size:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v9 = [(AVCPacketRelayIDSConnection *)self isResumed];
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
      -[AVCPacketRelayIDSConnection sendData:size:error:]();
      if (!a5) {
        return v9;
      }
    }
    else if (!a5)
    {
      return v9;
    }
    *a5 = (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"AVCPacketRelayErrorDomain" code:-2144731132 userInfo:0];
    return v9;
  }
  datagramChannel = self->_datagramChannel;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__AVCPacketRelayIDSConnection_sendData_size_error___block_invoke;
  v12[3] = &__block_descriptor_36_e17_v16__0__NSError_8l;
  int v13 = v6;
  -[IDSDatagramChannel writeDatagram:datagramSize:flags:completionHandler:](datagramChannel, "writeDatagram:datagramSize:flags:completionHandler:", a3, v6, 45875200, 0, v12);
  return v9;
}

void __51__AVCPacketRelayIDSConnection_sendData_size_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (a2)
  {
    if (ErrorLogLevelForModule >= 2)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      int v7 = *MEMORY[0x1E4F47A50];
      if (IsOSFaultDisabled)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v8 = *(_DWORD *)(a1 + 32);
          int v14 = 136316162;
          uint64_t v15 = v5;
          __int16 v16 = 2080;
          v17 = "-[AVCPacketRelayIDSConnection sendData:size:error:]_block_invoke";
          __int16 v18 = 1024;
          int v19 = 398;
          __int16 v20 = 1024;
          int v21 = v8;
          __int16 v22 = 2080;
          uint64_t v23 = objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
          _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d AVCPacketRelayIDSConnection: write %u bytes failed with error %s", (uint8_t *)&v14, 0x2Cu);
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        int v13 = *(_DWORD *)(a1 + 32);
        int v14 = 136316162;
        uint64_t v15 = v5;
        __int16 v16 = 2080;
        v17 = "-[AVCPacketRelayIDSConnection sendData:size:error:]_block_invoke";
        __int16 v18 = 1024;
        int v19 = 398;
        __int16 v20 = 1024;
        int v21 = v13;
        __int16 v22 = 2080;
        uint64_t v23 = objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
        _os_log_fault_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_FAULT, " [%s] %s:%d AVCPacketRelayIDSConnection: write %u bytes failed with error %s", (uint8_t *)&v14, 0x2Cu);
      }
    }
  }
  else if (ErrorLogLevelForModule >= 8)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    __int16 v10 = *MEMORY[0x1E4F47A50];
    __int16 v11 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = *(_DWORD *)(a1 + 32);
        int v14 = 136315906;
        uint64_t v15 = v9;
        __int16 v16 = 2080;
        v17 = "-[AVCPacketRelayIDSConnection sendData:size:error:]_block_invoke";
        __int16 v18 = 1024;
        int v19 = 400;
        __int16 v20 = 1024;
        int v21 = v12;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelayIDSConnection: write %u bytes successfully", (uint8_t *)&v14, 0x22u);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      __51__AVCPacketRelayIDSConnection_sendData_size_error___block_invoke_cold_1(v9);
    }
  }
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      uint64_t v9 = "-[AVCPacketRelayIDSConnection dealloc]";
      __int16 v10 = 1024;
      int v11 = 407;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelayIDSConnection: dealloc", buf, 0x1Cu);
    }
  }
  [(IDSDatagramChannel *)self->_datagramChannel invalidate];

  self->_datagramChannel = 0;
  [(AVCPacketRelayIDSConnection *)self setPacketFilter:0];
  [(AVCPacketRelayIDSConnection *)self setReadHandler:0];
  v5.receiver = self;
  v5.super_class = (Class)AVCPacketRelayIDSConnection;
  [(AVCPacketRelayIDSConnection *)&v5 dealloc];
}

- (BOOL)isResumed
{
  return self->_isResumed;
}

- (void)setIsResumed:(BOOL)a3
{
  self->_isResumed = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (id)readHandler
{
  return objc_getProperty(self, a2, 16, 1);
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
  return (AVCPacketFilter *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPacketFilter:(id)a3
{
}

- (void)initWithIDSSocketDescriptor:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[AVCPacketRelayIDSConnection initWithIDSSocketDescriptor:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCPacketRelayIDSConnection: init error %08X", v2, *(const char **)v3, (unint64_t)"-[AVCPacketRelayIDSConnection initWithIDSSocketDescriptor:]" >> 16, v4);
}

- (void)initWithIDSDestination:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[AVCPacketRelayIDSConnection initWithIDSDestination:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCPacketRelayIDSConnection: init error %08X", v2, *(const char **)v3, (unint64_t)"-[AVCPacketRelayIDSConnection initWithIDSDestination:]" >> 16, v4);
}

- (void)start
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCPacketRelayIDSConnection: cannot start without setting read handler", v2, v3, v4, v5, v6);
}

void __36__AVCPacketRelayIDSConnection_start__block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 136315906;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v1, v2, " [%s] %s:%d AVCPacketRelayIDSConnection: Datagram channel link %d returned empty datagram", (const char *)v3, *((const char **)&v3 + 1), v4, v5);
}

void __36__AVCPacketRelayIDSConnection_start__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[AVCPacketRelayIDSConnection start]_block_invoke";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCPacketRelayIDSConnection: reading %u bytes", v2, *(const char **)v3, (unint64_t)"-[AVCPacketRelayIDSConnection start]_block_invoke" >> 16, v4);
}

void __36__AVCPacketRelayIDSConnection_start__block_invoke_78_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCPacketRelayIDSConnection: IDS eventHandler called without event type", v2, v3, v4, v5, v6);
}

- (void)sendData:size:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCPacketRelayIDSConnection: resume the connection and wait to be connected before sending data", v2, v3, v4, v5, v6);
}

void __51__AVCPacketRelayIDSConnection_sendData_size_error___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 136315906;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d AVCPacketRelayIDSConnection: write %u bytes successfully", (const char *)v3, *((const char **)&v3 + 1), v4, v5);
}

@end