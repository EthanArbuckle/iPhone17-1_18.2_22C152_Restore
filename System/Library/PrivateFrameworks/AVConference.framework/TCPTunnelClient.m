@interface TCPTunnelClient
- (BOOL)isTunnelSocketClosed;
- (BOOL)sendAllocateMsg:(id *)a3;
- (BOOL)sendChannelBindingMsgWithDict:(id)a3 error:(id *)a4;
- (BOOL)sendRefreshMsg:(unsigned int)a3 error:(id *)a4;
- (NSString)participantID;
- (TCPTunnelClient)initWithRelayRequestDictionary:(id)a3 withCallID:(unsigned int)a4 relayType:(unsigned __int8)a5 errorCode:(int *)a6;
- (id)allocationResponseHandler;
- (id)bindingResponseHandler;
- (id)destroyHandler;
- (id)receiveHandler;
- (id)terminationHandler;
- (unsigned)connectionType;
- (void)closeTunnelSocket;
- (void)createDispatchTimer:(float)a3 withDetailedError:(int64_t)a4;
- (void)dealloc;
- (void)destroyDispatchTimer;
- (void)processSocketRead;
- (void)processSocketReadSSL;
- (void)processSocketWrite:(unsigned __int8)a3;
- (void)receivedControlData:(id)a3;
- (void)receivedSSLConnectionData:(id)a3 recordType:(unsigned __int16)a4;
- (void)reportErrorAndTerminate:(int64_t)a3 detail:(int64_t)a4 returnCode:(int64_t)a5 description:(id)a6 reason:(id)a7;
- (void)resetConnection;
- (void)sendTCPData:(const void *)a3 bufSize:(int)a4;
- (void)setAllocationResponseHandler:(id)a3;
- (void)setBindingResponseHandler:(id)a3;
- (void)setDestroyHandler:(id)a3;
- (void)setParticipantID:(id)a3;
- (void)setReceiveHandler:(id)a3;
- (void)setTerminationHandler:(id)a3;
- (void)unbindChannel;
- (void)vcArg:(id)a3 sendControlData:(id)a4 isTypeSSL:(BOOL)a5 withTimeout:(float)a6 withDetail:(int64_t)a7;
- (void)vcArg:(id)a3 sendRealTimeData:(id)a4 toParticipantID:(id)a5;
@end

@implementation TCPTunnelClient

- (void)resetConnection
{
  close(self->_connectedFD);
  self->_connectedFD = -1;
  [(TCPTunnelClient *)self setReceiveHandler:0];
  [(TCPTunnelClient *)self setAllocationResponseHandler:0];
  [(TCPTunnelClient *)self setBindingResponseHandler:0];
  [(TCPTunnelClient *)self setDestroyHandler:0];

  [(TCPTunnelClient *)self setTerminationHandler:0];
}

- (void)reportErrorAndTerminate:(int64_t)a3 detail:(int64_t)a4 returnCode:(int64_t)a5 description:(id)a6 reason:(id)a7
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = 0;
  +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", v9, a3, a4, a5, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m", 138), a6, a7);
  v8 = [(TCPTunnelClient *)self terminationHandler];
  if (v8) {
    v8[2](v8, v9[0]);
  }
  self->_isChannelBound = 0;
}

- (void)destroyDispatchTimer
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d TCPTUNNEL: timer is deleted.", v2, v3, v4, v5, v6);
}

- (void)createDispatchTimer:(float)a3 withDetailedError:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(TCPTunnelClient *)self destroyDispatchTimer];
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
  self->_timer = v7;
  if (v7)
  {
    v8 = v7;
    dispatch_time_t v9 = dispatch_time(0, (unint64_t)(float)(a3 * 1000000000.0));
    dispatch_source_set_timer(v8, v9, (unint64_t)(float)(a3 * 1000000000.0), 0x5F5E100uLL);
    timer = self->_timer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __57__TCPTunnelClient_createDispatchTimer_withDetailedError___block_invoke;
    handler[3] = &unk_1E6DB3F58;
    float v15 = a3;
    handler[4] = self;
    handler[5] = a4;
    dispatch_source_set_event_handler(timer, handler);
    dispatch_resume((dispatch_object_t)self->_timer);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E4F47A50];
    v13 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v17 = v11;
        __int16 v18 = 2080;
        v19 = "-[TCPTunnelClient createDispatchTimer:withDetailedError:]";
        __int16 v20 = 1024;
        int v21 = 179;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: timer is set.", buf, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      -[TCPTunnelClient createDispatchTimer:withDetailedError:]();
    }
  }
}

uint64_t __57__TCPTunnelClient_createDispatchTimer_withDetailedError___block_invoke(uint64_t a1)
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    if (VRTraceIsOSFaultDisabled())
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __57__TCPTunnelClient_createDispatchTimer_withDetailedError___block_invoke_cold_1(v2, a1);
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
    {
      __57__TCPTunnelClient_createDispatchTimer_withDetailedError___block_invoke_cold_2(v2, a1);
    }
  }
  [*(id *)(a1 + 32) destroyDispatchTimer];
  uint64_t v3 = *(_DWORD **)(a1 + 32);
  if (v3[4]) {
    uint64_t v4 = 32022;
  }
  else {
    uint64_t v4 = 32002;
  }
  return [v3 reportErrorAndTerminate:v4 detail:*(void *)(a1 + 40) returnCode:0 description:@"cannot establish TCP TURN channel" reason:@"TURN request is timed out"];
}

- (void)processSocketRead
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  int currentlyReadingDataGoalLength = self->_currentlyReadingDataGoalLength;
  NSUInteger v4 = [(NSMutableData *)self->_currentlyReadingMessage length];
  if (self->_currentlyReadingDataGoalLength) {
    size_t v5 = (currentlyReadingDataGoalLength - v4);
  }
  else {
    size_t v5 = 4;
  }
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&block[-2] - v6;
  if (v5) {
    memset((char *)&block[-2] - v6, 170, v5);
  }
  int v8 = recv(self->_connectedFD, v7, (int)v5, 0);
  int v10 = v8;
  if ((v8 + 1) >= 2)
  {
    if (v8 < 1) {
      return;
    }
    int v12 = 0;
    *(void *)&long long v9 = 136316162;
    long long v35 = v9;
    while (1)
    {
      int v13 = v10 - v12;
      if (!self->_currentlyReadingDataGoalLength)
      {
        NSUInteger v14 = [(NSMutableData *)self->_currentlyReadingMessage length] + v13;
        currentlyReadingMessage = self->_currentlyReadingMessage;
        if (v14 <= 3)
        {
          [(NSMutableData *)currentlyReadingMessage appendBytes:&v7[v12] length:v13];
          return;
        }
        if ([(NSMutableData *)currentlyReadingMessage length])
        {
          [(NSMutableData *)self->_currentlyReadingMessage bytes];
          int v16 = [(NSMutableData *)self->_currentlyReadingMessage length];
          int v17 = 4 - v16;
          *(_DWORD *)buf = -1431655766;
          __memcpy_chk();
          memcpy(&buf[v16], &v7[v12], 4 - v16);
          unsigned int v18 = *(unsigned __int16 *)buf;
          unsigned int v19 = bswap32(*(unsigned __int16 *)&buf[2]) >> 16;
        }
        else
        {
          unsigned int v18 = *(unsigned __int16 *)&v7[v12];
          unsigned int v19 = bswap32(*(unsigned __int16 *)&v7[v12 + 2]) >> 16;
          int v17 = 4;
        }
        self->_int currentlyReadingDataGoalLength = v19;
        v12 += v17;
        unsigned __int16 v20 = __rev16(v18);
        self->_int currentMsgType = v20;
        int v21 = v20 & 0xC000;
        if (v21 == 0x4000)
        {
          int64_t v22 = 4 - (v19 & 3);
          if ((v19 & 3) == 0) {
            int64_t v22 = 0;
          }
          self->_int64_t currentPadding = v22;
          self->_int currentlyReadingDataGoalLength = v22 + v19;
        }
        else
        {
          if (v21)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v23 = VRTraceErrorLogLevelToCSTR();
              v24 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                int currentMsgType = self->_currentMsgType;
                *(_DWORD *)buf = v35;
                uint64_t v39 = v23;
                __int16 v40 = 2080;
                v41 = "-[TCPTunnelClient processSocketRead]";
                __int16 v42 = 1024;
                int v43 = 249;
                __int16 v44 = 1024;
                int v45 = 249;
                __int16 v46 = 1024;
                int v47 = currentMsgType;
                _os_log_error_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: Unknown types: %d", buf, 0x28u);
              }
            }
          }
          else
          {
            self->_int currentlyReadingDataGoalLength = v19 + 20;
            v12 -= 4;
          }
          self->_int64_t currentPadding = 0;
        }
        -[NSMutableData setLength:](self->_currentlyReadingMessage, "setLength:", 0, v35);
        int v13 = v10 - v12;
      }
      if (v13)
      {
        int64_t v25 = self->_currentlyReadingDataGoalLength;
        int v26 = v25 - [(NSMutableData *)self->_currentlyReadingMessage length];
        v27 = self->_currentlyReadingMessage;
        v28 = &v7[v12];
        if (v13 >= v26)
        {
          [(NSMutableData *)v27 appendBytes:v28 length:v26];
          int64_t currentPadding = self->_currentPadding;
          if (currentPadding) {
            [(NSMutableData *)self->_currentlyReadingMessage setLength:self->_currentlyReadingDataGoalLength - currentPadding];
          }
          v30 = self->_currentlyReadingMessage;
          unsigned __int16 v31 = self->_currentMsgType;
          id v32 = [(TCPTunnelClient *)self receiveHandler];
          queue = self->_queue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __36__TCPTunnelClient_processSocketRead__block_invoke;
          block[3] = &unk_1E6DB7260;
          unsigned __int16 v37 = v31;
          block[4] = self;
          block[5] = v30;
          block[6] = v32;
          dispatch_async(queue, block);

          self->_int currentlyReadingDataGoalLength = 0;
          self->_currentlyReadingMessage = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
        }
        else
        {
          [(NSMutableData *)v27 appendBytes:v28 length:v13];
          int v26 = v13;
        }
        v12 += v26;
        if (v12 < v10) {
          continue;
        }
      }
      return;
    }
  }
  if (self->_connectState != 1)
  {
    if (self->_isChannelBound) {
      uint64_t v11 = 32022;
    }
    else {
      uint64_t v11 = 32002;
    }
    [(TCPTunnelClient *)self reportErrorAndTerminate:v11 detail:316 returnCode:0 description:@"TCP TURN channel closed" reason:@"Socket closed while accepting packets"];
    self->_connectState = 1;
  }
}

uint64_t __36__TCPTunnelClient_processSocketRead__block_invoke(uint64_t result)
{
  if ((*(_WORD *)(result + 56) & 0xC000) == 0x4000) {
    return (*(uint64_t (**)(void, void, void))(*(void *)(result + 48) + 16))(*(void *)(result + 48), *(void *)(result + 40), *(void *)(*(void *)(result + 32) + 112));
  }
  if ((*(_WORD *)(result + 56) & 0xC000) == 0) {
    return [*(id *)(result + 32) receivedControlData:*(void *)(result + 40)];
  }
  return result;
}

- (void)sendTCPData:(const void *)a3 bufSize:(int)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  int head = self->_head;
  if (head + a4 - self->_tail > 2048) {
    return;
  }
  if (head)
  {
    int v8 = 0;
LABEL_4:
    int v9 = a4 - v8;
    int v10 = self->_head + v9;
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v10 > 2048)
    {
      if (ErrorLogLevelForModule >= 8)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        int v16 = *MEMORY[0x1E4F47A50];
        int v17 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = self->_head - self->_tail;
            int v27 = 136316162;
            uint64_t v28 = v15;
            __int16 v29 = 2080;
            v30 = "-[TCPTunnelClient sendTCPData:bufSize:]";
            __int16 v31 = 1024;
            int v32 = 339;
            __int16 v33 = 1024;
            int v34 = v18;
            __int16 v35 = 1024;
            int v36 = v9;
            _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: shift %d, put %d on write buffer.", (uint8_t *)&v27, 0x28u);
          }
        }
        else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          int v26 = self->_head - self->_tail;
          int v27 = 136316162;
          uint64_t v28 = v15;
          __int16 v29 = 2080;
          v30 = "-[TCPTunnelClient sendTCPData:bufSize:]";
          __int16 v31 = 1024;
          int v32 = 339;
          __int16 v33 = 1024;
          int v34 = v26;
          __int16 v35 = 1024;
          int v36 = v9;
          _os_log_debug_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEBUG, " [%s] %s:%d TCPTUNNEL: shift %d, put %d on write buffer.", (uint8_t *)&v27, 0x28u);
        }
      }
      memmove(self->_writeBuf, &self->_writeBuf[self->_tail], self->_head - (uint64_t)self->_tail);
      uint64_t v24 = self->_head - (uint64_t)self->_tail;
      *(void *)&self->_int head = v24;
      uint64_t v23 = &self->_writeBuf[v24];
    }
    else
    {
      if (ErrorLogLevelForModule >= 8)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        int v13 = *MEMORY[0x1E4F47A50];
        NSUInteger v14 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            int v27 = 136315906;
            uint64_t v28 = v12;
            __int16 v29 = 2080;
            v30 = "-[TCPTunnelClient sendTCPData:bufSize:]";
            __int16 v31 = 1024;
            int v32 = 333;
            __int16 v33 = 1024;
            int v34 = v9;
            _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: put %d on write buffer.", (uint8_t *)&v27, 0x22u);
          }
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          -[TCPTunnelClient sendTCPData:bufSize:]();
        }
      }
      uint64_t v23 = &self->_writeBuf[self->_head];
    }
    memcpy(v23, (char *)a3 + v8, v9);
    self->_head += v9;
    return;
  }
  int v19 = send(self->_connectedFD, a3, a4, 0);
  int v8 = v19;
  if (v19 == a4) {
    return;
  }
  if (v19 != -1)
  {
LABEL_17:
    if (self->_writeSourceSuspended)
    {
      dispatch_resume((dispatch_object_t)self->_writeSource);
      self->_writeSourceSuspended = 0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        int v21 = *MEMORY[0x1E4F47A50];
        int64_t v22 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            int v27 = 136315650;
            uint64_t v28 = v20;
            __int16 v29 = 2080;
            v30 = "-[TCPTunnelClient sendTCPData:bufSize:]";
            __int16 v31 = 1024;
            int v32 = 327;
            _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: wcb resume", (uint8_t *)&v27, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          -[TCPTunnelClient sendTCPData:bufSize:]();
        }
      }
    }
    goto LABEL_4;
  }
  if (*__error() == 35)
  {
    int v8 = 0;
    goto LABEL_17;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    VRTraceErrorLogLevelToCSTR();
    if (VRTraceIsOSFaultDisabled())
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[TCPTunnelClient sendTCPData:bufSize:]();
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
    {
      -[TCPTunnelClient sendTCPData:bufSize:].cold.4();
    }
  }
  if (self->_isChannelBound) {
    uint64_t v25 = 32022;
  }
  else {
    uint64_t v25 = 32002;
  }
  [(TCPTunnelClient *)self reportErrorAndTerminate:v25 detail:318 returnCode:*__error() description:@"TCP TURN channel closed" reason:@"Socket closed while writing"];
}

- (void)processSocketWrite:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    v7 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int head = self->_head;
        int v33 = 136315906;
        uint64_t v34 = v5;
        __int16 v35 = 2080;
        int v36 = "-[TCPTunnelClient processSocketWrite:]";
        __int16 v37 = 1024;
        int v38 = 351;
        __int16 v39 = 1024;
        int v40 = head;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: wcb: %d", (uint8_t *)&v33, 0x22u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[TCPTunnelClient processSocketWrite:].cold.8();
    }
  }
  int connectState = self->_connectState;
  if (connectState == 1) {
    goto LABEL_46;
  }
  if (!connectState)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int connectedFD = self->_connectedFD;
          int v33 = 136315906;
          uint64_t v34 = v10;
          __int16 v35 = 2080;
          int v36 = "-[TCPTunnelClient processSocketWrite:]";
          __int16 v37 = 1024;
          int v38 = 353;
          __int16 v39 = 1024;
          int v40 = connectedFD;
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: socket is successfully connected %d.", (uint8_t *)&v33, 0x22u);
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        -[TCPTunnelClient processSocketWrite:].cold.7();
      }
    }
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v3 == 1)
    {
      if (ErrorLogLevelForModule >= 8)
      {
        uint64_t v22 = VRTraceErrorLogLevelToCSTR();
        uint64_t v23 = *MEMORY[0x1E4F47A50];
        uint64_t v24 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            int v33 = 136315650;
            uint64_t v34 = v22;
            __int16 v35 = 2080;
            int v36 = "-[TCPTunnelClient processSocketWrite:]";
            __int16 v37 = 1024;
            int v38 = 355;
            _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: We got a TCP connection!", (uint8_t *)&v33, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          -[TCPTunnelClient processSocketWrite:].cold.5();
        }
      }
      self->_int connectState = 9;
      allocateReq = self->_allocateReq;
      if (allocateReq) {
        [(TCPTunnelClient *)self sendTCPData:[(NSData *)allocateReq bytes] bufSize:[(NSData *)self->_allocateReq length]];
      }
    }
    else
    {
      if (ErrorLogLevelForModule >= 8)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        int v26 = *MEMORY[0x1E4F47A50];
        int v27 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            int v33 = 136315650;
            uint64_t v34 = v25;
            __int16 v35 = 2080;
            int v36 = "-[TCPTunnelClient processSocketWrite:]";
            __int16 v37 = 1024;
            int v38 = 361;
            _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: Start SSL handshake", (uint8_t *)&v33, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          -[TCPTunnelClient processSocketWrite:].cold.6();
        }
      }
      [(TCPTunnelClient *)self sendTCPData:&cSSLClientHello_0 bufSize:51];
      self->_int connectState = 2;
    }
    goto LABEL_46;
  }
  uint64_t v14 = self->_head;
  if (!v14)
  {
LABEL_46:
    if (!self->_head && !self->_writeSourceSuspended)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v29 = VRTraceErrorLogLevelToCSTR();
        v30 = *MEMORY[0x1E4F47A50];
        __int16 v31 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            int v33 = 136315650;
            uint64_t v34 = v29;
            __int16 v35 = 2080;
            int v36 = "-[TCPTunnelClient processSocketWrite:]";
            __int16 v37 = 1024;
            int v38 = 391;
            _os_log_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: wcb suspend", (uint8_t *)&v33, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          -[TCPTunnelClient processSocketWrite:]();
        }
      }
      dispatch_suspend((dispatch_object_t)self->_writeSource);
      self->_writeSourceSuspended = 1;
    }
    return;
  }
  int v15 = send(self->_connectedFD, &self->_writeBuf[self->_tail], v14 - self->_tail, 0);
  if (v15 != -1 || *__error() == 35)
  {
    int v16 = self->_head;
    int v17 = self->_tail + v15;
    self->_tail = v17;
    if (v17 == v16)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        int v19 = *MEMORY[0x1E4F47A50];
        uint64_t v20 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            int v33 = 136315650;
            uint64_t v34 = v18;
            __int16 v35 = 2080;
            int v36 = "-[TCPTunnelClient processSocketWrite:]";
            __int16 v37 = 1024;
            int v38 = 384;
            _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: reset write buffer", (uint8_t *)&v33, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          -[TCPTunnelClient processSocketWrite:]();
        }
      }
      *(void *)&self->_int head = 0;
    }
    goto LABEL_46;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    VRTraceErrorLogLevelToCSTR();
    if (VRTraceIsOSFaultDisabled())
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[TCPTunnelClient processSocketWrite:]();
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
    {
      -[TCPTunnelClient processSocketWrite:].cold.4();
    }
  }
  if (self->_isChannelBound) {
    uint64_t v32 = 32022;
  }
  else {
    uint64_t v32 = 32002;
  }
  [(TCPTunnelClient *)self reportErrorAndTerminate:v32 detail:318 returnCode:*__error() description:@"TCP TURN channel closed" reason:@"Socket closed while writing"];
}

- (void)vcArg:(id)a3 sendControlData:(id)a4 isTypeSSL:(BOOL)a5 withTimeout:(float)a6 withDetail:(int64_t)a7
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a5)
  {
    int connectState = self->_connectState;
    if (connectState == 8)
    {
      queue = self->_queue;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __74__TCPTunnelClient_vcArg_sendControlData_isTypeSSL_withTimeout_withDetail___block_invoke_2;
      v10[3] = &unk_1E6DB7288;
      v10[4] = self;
      v10[5] = a4;
      float v11 = a6;
      v10[6] = a7;
      int v9 = v10;
      goto LABEL_5;
    }
    if (connectState != 9) {
      return;
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__TCPTunnelClient_vcArg_sendControlData_isTypeSSL_withTimeout_withDetail___block_invoke;
  block[3] = &unk_1E6DB7288;
  block[4] = self;
  block[5] = a4;
  float v13 = a6;
  block[6] = a7;
  int v9 = block;
LABEL_5:
  dispatch_async(queue, v9);
}

uint64_t __74__TCPTunnelClient_vcArg_sendControlData_isTypeSSL_withTimeout_withDetail___block_invoke(uint64_t result)
{
  uint64_t v1 = *(_DWORD **)(result + 32);
  if (v1[2] != 1)
  {
    uint64_t v2 = result;
    result = objc_msgSend(v1, "sendTCPData:bufSize:", objc_msgSend(*(id *)(result + 40), "bytes"), objc_msgSend(*(id *)(result + 40), "length"));
    if (*(float *)(v2 + 56) > 0.0)
    {
      int v3 = *(void **)(v2 + 32);
      uint64_t v4 = *(void *)(v2 + 48);
      return objc_msgSend(v3, "createDispatchTimer:withDetailedError:", v4);
    }
  }
  return result;
}

void __74__TCPTunnelClient_vcArg_sendControlData_isTypeSSL_withTimeout_withDetail___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(*(void *)(a1 + 32) + 8) == 8)
  {
    uint64_t v2 = (id *)(a1 + 40);
    if ((unint64_t)[*(id *)(a1 + 40) length] < 0xFFFD)
    {
      *(_WORD *)((char *)&v5 + 3) = bswap32(objc_msgSend(*(id *)(a1 + 40), "length", 66327, v6) + 3) >> 16;
      [*(id *)(a1 + 32) sendTCPData:&v5 bufSize:8];
      objc_msgSend(*(id *)(a1 + 32), "sendTCPData:bufSize:", objc_msgSend(*(id *)(a1 + 40), "bytes"), objc_msgSend(*(id *)(a1 + 40), "length"));
      if (*(float *)(a1 + 56) > 0.0) {
        objc_msgSend(*(id *)(a1 + 32), "createDispatchTimer:withDetailedError:", *(void *)(a1 + 48));
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __74__TCPTunnelClient_vcArg_sendControlData_isTypeSSL_withTimeout_withDetail___block_invoke_2_cold_1(v3, v2, v4);
      }
    }
  }
}

- (void)receivedControlData:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  memset(__b, 170, sizeof(__b));
  [a3 bytes];
  [a3 length];
  uint64_t v5 = ParseSTUNMessage();
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if ((v5 & 0x80000000) == 0)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      int v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int isChannelBound = self->_isChannelBound;
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = v7;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[TCPTunnelClient receivedControlData:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 453;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = isChannelBound;
        *(_WORD *)&buf[34] = 1024;
        *(_DWORD *)&buf[36] = __b[1];
        __int16 v56 = 1024;
        int v57 = __b[0];
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: %d, Received TURN message: %x, %x", buf, 0x2Eu);
      }
    }
    switch(__b[1])
    {
      case 9:
        [(TCPTunnelClient *)self destroyDispatchTimer];
        if (__b[0] == 256)
        {
          if (self->_connectState == 9) {
            uint64_t v16 = 3;
          }
          else {
            uint64_t v16 = 4;
          }
          if (!self->_isChannelBound) {
            self->_int isChannelBound = 1;
          }
          int v17 = [(TCPTunnelClient *)self bindingResponseHandler];
          if (v17) {
            v17[2](v17, v16);
          }
          double v18 = self->_allocationTimestamp - micro() + 30.0;
          int v19 = VRTraceGetErrorLogLevelForModule();
          if (v18 >= 0.1)
          {
            if (v19 >= 7)
            {
              uint64_t v26 = VRTraceErrorLogLevelToCSTR();
              int v27 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                *(void *)&uint8_t buf[4] = v26;
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "-[TCPTunnelClient receivedControlData:]";
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = 521;
                *(_WORD *)&buf[28] = 2048;
                *(double *)&buf[30] = v18;
                _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: refreshing after %5.2f seconds", buf, 0x26u);
              }
            }
            dispatch_time_t v28 = dispatch_time(0, (uint64_t)(v18 * 1000000000.0));
            queue = self->_queue;
            v43[0] = MEMORY[0x1E4F143A8];
            v43[1] = 3221225472;
            v43[2] = __39__TCPTunnelClient_receivedControlData___block_invoke_27;
            v43[3] = &unk_1E6DB3DC8;
            v43[4] = self;
            dispatch_after(v28, queue, v43);
            goto LABEL_84;
          }
          if (v19 >= 7)
          {
            uint64_t v20 = VRTraceErrorLogLevelToCSTR();
            int v21 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              *(void *)&uint8_t buf[4] = v20;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "-[TCPTunnelClient receivedControlData:]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 510;
              _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: refreshing now.", buf, 0x1Cu);
            }
          }
          uint64_t v22 = self->_queue;
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __39__TCPTunnelClient_receivedControlData___block_invoke;
          v44[3] = &unk_1E6DB3DC8;
          v44[4] = self;
          uint64_t v23 = v44;
LABEL_38:
          dispatch_async(v22, v23);
LABEL_84:
          FreeSTUNMessage();
          return;
        }
        *(_WORD *)buf = -21846;
        ProcessChannelBindErrorResponse();
        if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
        {
          VRTraceErrorLogLevelToCSTR();
          if (VRTraceIsOSFaultDisabled())
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[TCPTunnelClient receivedControlData:].cold.8();
            }
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
          {
            -[TCPTunnelClient receivedControlData:].cold.9();
          }
        }
        if (self->_isChannelBound) {
          uint64_t v30 = 32022;
        }
        else {
          uint64_t v30 = 32002;
        }
        uint64_t v31 = *(unsigned __int16 *)buf;
        uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", @"ChannelBind Failed: %u", *(unsigned __int16 *)buf);
        int v33 = self;
        uint64_t v34 = v30;
        uint64_t v35 = 314;
        break;
      case 4:
        [(TCPTunnelClient *)self destroyDispatchTimer];
        if (__b[0] == 256)
        {
          self->_allocationTimestamp = micro();
          uint64_t STUNAttr = GetSTUNAttr();
          if (STUNAttr && !*(_DWORD *)(STUNAttr + 8))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v39 = VRTraceErrorLogLevelToCSTR();
              int v40 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                *(void *)&uint8_t buf[4] = v39;
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "-[TCPTunnelClient receivedControlData:]";
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = 550;
                _os_log_impl(&dword_1E1EA4000, v40, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: Got TURN terminating response.", buf, 0x1Cu);
              }
            }
            self->_int isChannelBound = 0;
            uint64_t v41 = [(TCPTunnelClient *)self destroyHandler];
            if (v41) {
              v41[2]();
            }
            goto LABEL_84;
          }
          uint64_t v22 = self->_queue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __39__TCPTunnelClient_receivedControlData___block_invoke_31;
          block[3] = &unk_1E6DB3DC8;
          block[4] = self;
          uint64_t v23 = block;
          goto LABEL_38;
        }
        *(_WORD *)buf = -21846;
        ProcessAllocateErrorResponse();
        if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
        {
          VRTraceErrorLogLevelToCSTR();
          if (VRTraceIsOSFaultDisabled())
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[TCPTunnelClient receivedControlData:]0();
            }
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
          {
            -[TCPTunnelClient receivedControlData:]1();
          }
        }
        if (self->_isChannelBound) {
          uint64_t v36 = 32022;
        }
        else {
          uint64_t v36 = 32002;
        }
        uint64_t v31 = *(unsigned __int16 *)buf;
        uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", @"Refresh Failed: %u", *(unsigned __int16 *)buf);
        int v33 = self;
        uint64_t v34 = v36;
        uint64_t v35 = 315;
        break;
      case 3:
        [(TCPTunnelClient *)self destroyDispatchTimer];
        if (__b[0] == 256)
        {
          *(void *)&buf[32] = 0xAAAAAAAAAAAAAAAALL;
          *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)buf = v10;
          *(_OWORD *)&buf[16] = v10;
          unint64_t v54 = 0xAAAAAAAAAAAAAAAALL;
          long long v52 = v10;
          long long v53 = v10;
          int v45 = -1431655766;
          if ((ProcessAllocateResponse() & 0x80000000) != 0)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[TCPTunnelClient receivedControlData:].cold.4();
              }
            }
          }
          else
          {
            self->_allocationTimestamp = micro();
            float v11 = [(TCPTunnelClient *)self allocationResponseHandler];
            if (v11) {
              v11[2](v11, self->_reqRespDict);
            }
            if (self->_channelBReq)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
              {
                uint64_t v13 = VRTraceErrorLogLevelToCSTR();
                uint64_t v14 = *MEMORY[0x1E4F47A50];
                int v15 = *MEMORY[0x1E4F47A50];
                if (*MEMORY[0x1E4F47A40])
                {
                  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)__int16 v46 = 136315650;
                    uint64_t v47 = v13;
                    __int16 v48 = 2080;
                    v49 = "-[TCPTunnelClient receivedControlData:]";
                    __int16 v50 = 1024;
                    int v51 = 475;
                    _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: send saved ChannelBinding request now.", v46, 0x1Cu);
                  }
                }
                else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
                {
                  -[TCPTunnelClient receivedControlData:].cold.5();
                }
              }
              *(float *)&double v12 = self->_fTimeout;
              [(TCPTunnelClient *)self vcArg:0 sendControlData:self->_channelBReq isTypeSSL:0 withTimeout:309 withDetail:v12];
            }
          }
          goto LABEL_84;
        }
        *(_WORD *)buf = -21846;
        ProcessAllocateErrorResponse();
        if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
        {
          VRTraceErrorLogLevelToCSTR();
          if (VRTraceIsOSFaultDisabled())
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[TCPTunnelClient receivedControlData:].cold.6();
            }
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
          {
            -[TCPTunnelClient receivedControlData:].cold.7();
          }
        }
        uint64_t v38 = *(unsigned __int16 *)buf;
        uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", @"Allocation Failed: %u", *(unsigned __int16 *)buf);
        int v33 = self;
        uint64_t v34 = 32002;
        uint64_t v35 = 313;
        uint64_t v37 = v38;
        goto LABEL_83;
      default:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[TCPTunnelClient receivedControlData:]();
          }
        }
        goto LABEL_84;
    }
    uint64_t v37 = v31;
LABEL_83:
    [(TCPTunnelClient *)v33 reportErrorAndTerminate:v34 detail:v35 returnCode:v37 description:@"cannot establish TCP TURN channel" reason:v32];
    goto LABEL_84;
  }
  if (ErrorLogLevelForModule >= 2)
  {
    VRTraceErrorLogLevelToCSTR();
    if (VRTraceIsOSFaultDisabled())
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[TCPTunnelClient receivedControlData:]();
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
    {
      -[TCPTunnelClient receivedControlData:]();
    }
  }
  if (self->_isChannelBound) {
    uint64_t v25 = 32022;
  }
  else {
    uint64_t v25 = 32002;
  }
  -[TCPTunnelClient reportErrorAndTerminate:detail:returnCode:description:reason:](self, "reportErrorAndTerminate:detail:returnCode:description:reason:", v25, 312, (int)v5, @"cannot establish TCP TURN channel", objc_msgSend(NSString, "stringWithFormat:", @"Error parsing TURN message (%08X)", v5));
}

uint64_t __39__TCPTunnelClient_receivedControlData___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  uint64_t result = [*(id *)(a1 + 32) sendRefreshMsg:60 error:v3];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) terminationHandler];
    if (result) {
      return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, v3[0]);
    }
  }
  return result;
}

uint64_t __39__TCPTunnelClient_receivedControlData___block_invoke_27(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  uint64_t result = [*(id *)(a1 + 32) sendRefreshMsg:60 error:v3];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) terminationHandler];
    if (result) {
      return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, v3[0]);
    }
  }
  return result;
}

uint64_t __39__TCPTunnelClient_receivedControlData___block_invoke_31(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 256) monitorBufferPool];
  v3[0] = 0;
  uint64_t result = [*(id *)(a1 + 32) sendChannelBindingMsgWithDict:0 error:v3];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) terminationHandler];
    if (result) {
      return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, v3[0]);
    }
  }
  return result;
}

- (void)processSocketReadSSL
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_8(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: TCP/SSL socket is closed while accepting packets", v2, v3, v4, v5, v6);
}

unint64_t __39__TCPTunnelClient_processSocketReadSSL__block_invoke(unint64_t result)
{
  unint64_t v1 = result;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int16 *)(result + 56);
  if ((v2 - 20) > 2)
  {
    if (v2 == 23)
    {
      uint64_t result = [*(id *)(result + 40) length];
      if (result >= 8)
      {
        int v8 = 0;
        uint64_t result = objc_msgSend(*(id *)(v1 + 40), "getBytes:range:", (char *)&v8 + 2, 3, 2);
        HIWORD(v8) = bswap32(HIWORD(v8)) >> 16;
        if ((HIWORD(v8) & 0xC000) == 0x4000)
        {
          objc_msgSend(*(id *)(v1 + 40), "getBytes:range:", &v8, 5, 2);
          LOWORD(v8) = bswap32((unsigned __int16)v8) >> 16;
          uint8_t v6 = (void *)MEMORY[0x1E4F1C9B8];
          uint64_t v7 = [*(id *)(v1 + 40) bytes];
          [v6 dataWithBytesNoCopy:v7 + 7 length:(unsigned __int16)v8 freeWhenDone:0];
          return (*(uint64_t (**)(void))(*(void *)(v1 + 48) + 16))();
        }
        else if ((v8 & 0xC0000000) == 0)
        {
          unsigned __int16 v5 = [*(id *)(v1 + 40) length] - 3;
          return objc_msgSend(*(id *)(v1 + 32), "receivedControlData:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(*(id *)(v1 + 40), "bytes") + 3, v5, 0));
        }
      }
    }
  }
  else
  {
    uint64_t v3 = *(void **)(result + 32);
    uint64_t v4 = *(void *)(v1 + 40);
    return objc_msgSend(v3, "receivedSSLConnectionData:recordType:", v4);
  }
  return result;
}

- (void)receivedSSLConnectionData:(id)a3 recordType:(unsigned __int16)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  char v21 = -86;
  if (a4 != 22)
  {
    if (a4 == 21)
    {
      int v9 = 2;
    }
    else if (a4 == 20)
    {
      if (self->_connectState == 6)
      {
        int v5 = 7;
LABEL_24:
        self->_int connectState = v5;
        return;
      }
      int v9 = 1;
    }
    else
    {
      int v9 = 7;
    }
    goto LABEL_19;
  }
  if (self->_connectState == 7)
  {
    self->_int connectState = 8;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      int v8 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v23 = v6;
          __int16 v24 = 2080;
          uint64_t v25 = "-[TCPTunnelClient receivedSSLConnectionData:recordType:]";
          __int16 v26 = 1024;
          int v27 = 727;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: SSL enabled channel has set up.", buf, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[TCPTunnelClient receivedSSLConnectionData:recordType:]();
      }
    }
    if (self->_allocateReq)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        int v17 = *MEMORY[0x1E4F47A50];
        double v18 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v23 = v16;
            __int16 v24 = 2080;
            uint64_t v25 = "-[TCPTunnelClient receivedSSLConnectionData:recordType:]";
            __int16 v26 = 1024;
            int v27 = 729;
            _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: send Allocate request in queue now.", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          -[TCPTunnelClient receivedSSLConnectionData:recordType:]();
        }
      }
      *(float *)&double v15 = self->_fTimeout;
      [(TCPTunnelClient *)self vcArg:0 sendControlData:self->_allocateReq isTypeSSL:0 withTimeout:308 withDetail:v15];
    }
  }
  else
  {
    [a3 getBytes:&v21 length:1];
    if (v21 != 14)
    {
      if (v21 == 12)
      {
        int v9 = 4;
        if (self->_connectState != 3) {
          goto LABEL_19;
        }
      }
      else
      {
        if (v21 != 2)
        {
          int v9 = 6;
          goto LABEL_19;
        }
        int v9 = 3;
        if (self->_connectState != 2)
        {
LABEL_19:
          if (self->_connectState == 1) {
            return;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v10 = VRTraceErrorLogLevelToCSTR();
            float v11 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              int connectState = self->_connectState;
              *(_DWORD *)buf = 136316418;
              uint64_t v23 = v10;
              __int16 v24 = 2080;
              uint64_t v25 = "-[TCPTunnelClient receivedSSLConnectionData:recordType:]";
              __int16 v26 = 1024;
              int v27 = 786;
              __int16 v28 = 1024;
              int v29 = 786;
              __int16 v30 = 1024;
              int v31 = v9;
              __int16 v32 = 1024;
              int v33 = connectState;
              _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: handshake error: %d, %d", buf, 0x2Eu);
            }
          }
          dispatch_time_t v12 = dispatch_time(0, 500000000);
          queue = self->_queue;
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __56__TCPTunnelClient_receivedSSLConnectionData_recordType___block_invoke;
          v20[3] = &unk_1E6DB3DC8;
          v20[4] = self;
          dispatch_after(v12, queue, v20);
          int v5 = 1;
          goto LABEL_24;
        }
      }
      self->_int connectState = v9;
      return;
    }
    int v14 = self->_connectState;
    int v9 = 5;
    if (v14 == 4)
    {
      self->_int connectState = 5;
      int v9 = 0;
    }
    -[TCPTunnelClient vcArg:sendControlData:isTypeSSL:withTimeout:withDetail:](self, "vcArg:sendControlData:isTypeSSL:withTimeout:withDetail:", 0, [MEMORY[0x1E4F1C9B8] dataWithBytes:&cSSLClientDone length:109], 1, 321, 0.0);
    self->_int connectState = 6;
    if (v14 != 4) {
      goto LABEL_19;
    }
  }
}

uint64_t __56__TCPTunnelClient_receivedSSLConnectionData_recordType___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) destroyHandler];
  if (result)
  {
    int v2 = *(uint64_t (**)(void))(result + 16);
    return v2();
  }
  return result;
}

- (TCPTunnelClient)initWithRelayRequestDictionary:(id)a3 withCallID:(unsigned int)a4 relayType:(unsigned __int8)a5 errorCode:(int *)a6
{
  __int16 v8 = a4;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)TCPTunnelClient;
  uint64_t v10 = [(TCPTunnelClient *)&v38 init];
  if (v10)
  {
    long long v59 = 0uLL;
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)((char *)v58 + 14) = v11;
    long long v57 = v11;
    v58[0] = v11;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (a3) {
          int v14 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        }
        else {
          int v14 = "<nil>";
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v48 = v12;
        __int16 v49 = 2080;
        __int16 v50 = "-[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:]";
        __int16 v51 = 1024;
        int v52 = 812;
        __int16 v53 = 2080;
        unint64_t v54 = v14;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: STARTING! %s", buf, 0x26u);
      }
    }
    *((_OWORD *)v10 + 9) = 0u;
    *((void *)v10 + 22) = 0;
    *((_OWORD *)v10 + 10) = 0u;
    GetIPPortFromDict();
    *((_DWORD *)v10 + 41) = bswap32(*((_DWORD *)v10 + 41));
    *((void *)v10 + 1) = 0xFFFFFFFF00000000;
    *((_DWORD *)v10 + 4) = 0;
    *((void *)v10 + 9) = 0;
    *((void *)v10 + 12) = 0;
    *(_OWORD *)(v10 + 24) = 0u;
    *(_OWORD *)(v10 + 40) = 0u;
    *((_DWORD *)v10 + 26) = 1109262336;
    *((void *)v10 + 7) = 0;
    *((void *)v10 + 14) = @"Dummy";
    *((_WORD *)v10 + 60) = v8 & 0x3FFF | 0x4000;
    *((void *)v10 + 17) = 0;
    *((void *)v10 + 27) = 0;
    *((_WORD *)v10 + 112) = 0;
    *((void *)v10 + 29) = 0;
    *((void *)v10 + 23) = 0;
    *((void *)v10 + 24) = 0;
    uint64_t v37 = 0;
    int LocalInterfaceListWithOptions = GetLocalInterfaceListWithOptions();
    if (!LocalInterfaceListWithOptions)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:]();
        }
      }
      goto LABEL_22;
    }
    int v16 = LocalInterfaceListWithOptions;
    if (LocalInterfaceListWithOptions < 1)
    {
      LODWORD(v17) = 0;
    }
    else
    {
      uint64_t v17 = 0;
      double v18 = (const char *)(v37 + 4);
      while (!strncmp(v18, "lo", 2uLL))
      {
        ++v17;
        v18 += 40;
        if (v16 == v17) {
          goto LABEL_19;
        }
      }
    }
    if (v17 == v16)
    {
LABEL_19:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:]();
        }
      }
LABEL_22:
      *a6 = 324;
      FreeLocalInterfaceList();
      return 0;
    }
    if ((VCNAT64ResolverGetPrefix(v37 + 40 * v17 + 4, &v59) & 0x80000000) != 0
      || !VCNAT64ResolverIsNonzeroPrefix(&v59))
    {
      int v22 = 0;
    }
    else
    {
      int v36 = 0;
      *(void *)&v44.sa_len = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&v44.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
      nw_nat64_synthesize_v6();
      inet_ntop(30, &v44, (char *)&v57, 0x2Eu);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        char v21 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v48 = v20;
          __int16 v49 = 2080;
          __int16 v50 = "-[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:]";
          __int16 v51 = 1024;
          int v52 = 870;
          __int16 v53 = 2080;
          unint64_t v54 = (const char *)(v37 + 40 * v17 + 4);
          __int16 v55 = 2080;
          __int16 v56 = &v57;
          _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: interface %s is behind NAT64 with prefix %s", buf, 0x30u);
        }
      }
      int v22 = 1;
    }
    FreeLocalInterfaceList();
    *(void *)&v44.sa_len = 0;
    *(void *)&v44.sa_data[6] = 0;
    int v46 = 0;
    uint64_t v45 = 0;
    if (v22) {
      socklen_t v23 = 28;
    }
    else {
      socklen_t v23 = 16;
    }
    if (v22) {
      int v24 = 30;
    }
    else {
      int v24 = 2;
    }
    v44.sa_family = v24;
    int v25 = socket(v24, 1, 0);
    if ((v25 & 0x80000000) == 0)
    {
      int v26 = v25;
      int v36 = 1;
      setsockopt(v25, 0xFFFF, 4130, &v36, 4u);
      int v35 = 1;
      setsockopt(v26, 6, 1, &v35, 4u);
      int v27 = 54004;
      do
      {
        *(_WORD *)v44.sa_data = bswap32(++v27) >> 16;
        int v28 = bind(v26, &v44, v23);
      }
      while (v28 && (_WORD)v27 != 0xFFFF);
      if (v28)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:].cold.4();
          }
        }
        int v29 = 323;
      }
      else
      {
        socklen_t v34 = 28;
        getsockname(v26, &v44, &v34);
        inet_ntop(30, &v44.sa_data[6], (char *)&v57, 0x2Eu);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v30 = VRTraceErrorLogLevelToCSTR();
          int v31 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v48 = v30;
            __int16 v49 = 2080;
            __int16 v50 = "-[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:]";
            __int16 v51 = 1024;
            int v52 = 915;
            __int16 v53 = 2080;
            unint64_t v54 = (const char *)&v57;
            __int16 v55 = 1024;
            LODWORD(v56) = bswap32(*(unsigned __int16 *)v44.sa_data) >> 16;
            _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: local IP %s, local port: %d", buf, 0x2Cu);
          }
        }
        __int16 v32 = objc_alloc_init(TCPBufferPool);
        *((void *)v10 + 32) = v32;
        if (v32)
        {
          *((void *)v10 + 26) = objc_alloc_init(MEMORY[0x1E4F1CA58]);
          *((void *)v10 + 30) = malloc_type_malloc(0x800uLL, 0xFD4E73ECuLL);
          *((void *)v10 + 31) = 0;
          *((void *)v10 + 16) = [a3 mutableCopy];
          int v33 = dispatch_queue_create("com.apple.viceroy.TCPTunnel", 0);
          *((void *)v10 + 8) = v33;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke;
          block[3] = &unk_1E6DB72B0;
          char v42 = v22;
          block[4] = v10;
          long long v40 = v59;
          int v41 = v26;
          unsigned __int8 v43 = a5;
          dispatch_async(v33, block);
          return (TCPTunnelClient *)v10;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:].cold.5();
          }
        }
        int v29 = 325;
      }
      *a6 = v29;
      close(v26);
      return 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:]();
      }
    }
    uint64_t v10 = 0;
    *a6 = 322;
  }
  return (TCPTunnelClient *)v10;
}

void __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  *(void *)&v46.sa_len = 0;
  *(void *)&v46.sa_data[6] = 0;
  int v48 = 0;
  uint64_t v47 = 0;
  socklen_t v44 = 28;
  if (*(unsigned char *)(a1 + 60))
  {
    v46.sa_family = 30;
    unsigned int v43 = bswap32(*(_DWORD *)(*(void *)(a1 + 32) + 164));
    nw_nat64_synthesize_v6();
    v46.sa_len = 28;
    *(_WORD *)v46.sa_data = bswap32(*(unsigned __int16 *)(*(void *)(a1 + 32) + 180)) >> 16;
    *(void *)&buf[32] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v2;
    *(_OWORD *)&buf[16] = v2;
    SAToIPPORT();
    IPPORTToStringWithSize();
  }
  else
  {
    v46.sa_family = 2;
    IPPORTToStringWithSize();
    IPPORTToSA();
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v3;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:]_block_invoke";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 954;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = &_block_invoke_ipPortStr;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: attempt a TCP connection to %s", buf, 0x26u);
    }
  }
  int v5 = fcntl(*(_DWORD *)(a1 + 56), 3, 0);
  fcntl(*(_DWORD *)(a1 + 56), 4, v5 | 4u);
  uint64_t v6 = (id *)(a1 + 32);
  *(_DWORD *)(*(void *)(a1 + 32) + 12) = *(_DWORD *)(a1 + 56);
  *(void *)(*(void *)(a1 + 32) + 80) = dispatch_source_create(MEMORY[0x1E4F144B0], *(int *)(a1 + 56), 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 64));
  uint64_t v7 = *(void *)(a1 + 32);
  __int16 v8 = *(NSObject **)(v7 + 80);
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_1();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_2();
      }
    }
    id v18 = *v6;
    int v19 = @"can't create write source.";
    uint64_t v20 = 318;
    goto LABEL_59;
  }
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_49;
  handler[3] = &unk_1E6DB3DF0;
  handler[4] = v7;
  char v42 = *(unsigned char *)(a1 + 61);
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 80));
  *(unsigned char *)(*(void *)(a1 + 32) + 88) = 0;
  uint64_t v9 = connect(*(_DWORD *)(a1 + 56), &v46, v44);
  if ((v9 & 0x80000000) != 0)
  {
    uint64_t v14 = v9;
    if (*__error() != 36)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
        uint64_t v17 = *MEMORY[0x1E4F47A50];
        if (IsOSFaultDisabled)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_8(v15, v14, v17);
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_9(v15, v14, v17);
        }
      }
      id v21 = *v6;
      uint64_t v22 = *__error();
      int v19 = @"can't connect socket.";
      id v18 = v21;
      uint64_t v20 = 319;
      goto LABEL_60;
    }
  }
  else if (!*((_DWORD *)*v6 + 2))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      long long v11 = *MEMORY[0x1E4F47A50];
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = *((_DWORD *)*v6 + 3);
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = v10;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:]_block_invoke_2";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 980;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = v13;
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: connect is done immediately %d.", buf, 0x22u);
        }
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_7();
      }
    }
    int v23 = *(unsigned __int8 *)(a1 + 61);
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v23 == 1)
    {
      if (ErrorLogLevelForModule >= 8)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        int v26 = *MEMORY[0x1E4F47A50];
        int v27 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = v25;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:]_block_invoke";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 982;
            _os_log_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: We got a TCP connection!", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_5();
        }
      }
      *((_DWORD *)*v6 + 2) = 9;
      int v31 = (void *)*((void *)*v6 + 23);
      if (v31) {
        objc_msgSend(*v6, "sendTCPData:bufSize:", objc_msgSend(v31, "bytes"), objc_msgSend(*((id *)*v6 + 23), "length"));
      }
    }
    else
    {
      if (ErrorLogLevelForModule >= 8)
      {
        uint64_t v28 = VRTraceErrorLogLevelToCSTR();
        int v29 = *MEMORY[0x1E4F47A50];
        uint64_t v30 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = v28;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "-[TCPTunnelClient initWithRelayRequestDictionary:withCallID:relayType:errorCode:]_block_invoke";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 988;
            _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: Start SSL handshake", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_6();
        }
      }
      [*v6 sendTCPData:&cSSLClientHello_0 bufSize:51];
      *((_DWORD *)*v6 + 2) = 2;
    }
  }
  *(void *)(*(void *)(a1 + 32) + 72) = dispatch_source_create(MEMORY[0x1E4F14478], *(int *)(a1 + 56), 0, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 64));
  uint64_t v32 = *(void *)(a1 + 32);
  int v33 = *(NSObject **)(v32 + 72);
  if (!v33)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_3();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_4();
      }
    }
    id v18 = *v6;
    int v19 = @"can't create read source.";
    uint64_t v20 = 316;
LABEL_59:
    uint64_t v22 = 0;
LABEL_60:
    [v18 reportErrorAndTerminate:32002 detail:v20 returnCode:v22 description:@"TCP TURN channel closed" reason:v19];
    return;
  }
  if (*(unsigned char *)(a1 + 61) == 1)
  {
    socklen_t v34 = v40;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    int v35 = __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_57;
  }
  else
  {
    socklen_t v34 = v39;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    int v35 = __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_2;
  }
  v34[2] = v35;
  v34[3] = &unk_1E6DB3DC8;
  v34[4] = v32;
  dispatch_source_set_event_handler(v33, v34);
  id v36 = *v6;
  uint64_t v37 = *((void *)*v6 + 9);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_3;
  v38[3] = &unk_1E6DB3DC8;
  v38[4] = v36;
  dispatch_source_set_cancel_handler(v37, v38);
  dispatch_resume(*((dispatch_object_t *)*v6 + 9));
}

uint64_t __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_49(uint64_t a1)
{
  return [*(id *)(a1 + 32) processSocketWrite:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_57(uint64_t a1)
{
  return [*(id *)(a1 + 32) processSocketRead];
}

uint64_t __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) processSocketReadSSL];
}

uint64_t __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetConnection];
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v10 = v3;
      __int16 v11 = 2080;
      uint64_t v12 = "-[TCPTunnelClient dealloc]";
      __int16 v13 = 1024;
      int v14 = 1035;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: TCP tunnel released.", buf, 0x1Cu);
    }
  }

  [(TCPTunnelClient *)self destroyDispatchTimer];
  writeSource = self->_writeSource;
  if (writeSource)
  {
    dispatch_release(writeSource);
    self->_writeSource = 0;
  }
  readSource = self->_readSource;
  if (readSource)
  {
    dispatch_release(readSource);
    self->_readSource = 0;
  }
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  free(self->_writeBuf);
  self->_writeBuf = 0;

  v8.receiver = self;
  v8.super_class = (Class)TCPTunnelClient;
  [(TCPTunnelClient *)&v8 dealloc];
}

- (unsigned)connectionType
{
  int connectState = self->_connectState;
  if (connectState == 9) {
    return 3;
  }
  else {
    return 4 * (connectState == 8);
  }
}

- (BOOL)sendAllocateMsg:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  memset(v17, 170, sizeof(v17));
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  int v14 = 1472;
  uint64_t Request = MakeAllocateRequest();
  if ((Request & 0x80000000) != 0)
  {
    uint64_t v10 = Request;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[TCPTunnelClient sendAllocateMsg:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[TCPTunnelClient sendAllocateMsg:]();
      }
    }
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m", 1086);
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32002, 302, (int)v10, v11, @"Sending TCPTunnel Allocate Request failed.", objc_msgSend(NSString, "stringWithFormat:", @"Make request error: %x.", v10));
    FreeSTUNMessage();
  }
  else
  {
    uint64_t v6 = STUNEncodeMessage();
    FreeSTUNMessage();
    if ((v6 & 0x80000000) == 0)
    {
      uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v17 length:v14];
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __35__TCPTunnelClient_sendAllocateMsg___block_invoke;
      block[3] = &unk_1E6DB3E40;
      block[4] = self;
      void block[5] = v7;
      dispatch_async(queue, block);
      return 1;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[TCPTunnelClient sendAllocateMsg:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[TCPTunnelClient sendAllocateMsg:].cold.4();
      }
    }
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m", 1101);
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32002, 303, (int)v6, v12, @"Sending TCPTunnel Allocate Request failed.", objc_msgSend(NSString, "stringWithFormat:", @"Encode request error: %x.", v6));
  }
  return 0;
}

uint64_t __35__TCPTunnelClient_sendAllocateMsg___block_invoke(uint64_t a1, double a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(int **)(a1 + 32);
  if (v3[2] > 7)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    LODWORD(a2) = v3[26];
    return [v3 vcArg:0 sendControlData:v7 isTypeSSL:0 withTimeout:308 withDetail:a2];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      int v5 = *MEMORY[0x1E4F47A50];
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 136315650;
          uint64_t v10 = v4;
          __int16 v11 = 2080;
          uint64_t v12 = "-[TCPTunnelClient sendAllocateMsg:]_block_invoke";
          __int16 v13 = 1024;
          int v14 = 1110;
          _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sendAllocateMsg: save the message for set-up in progress.", (uint8_t *)&v9, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        __35__TCPTunnelClient_sendAllocateMsg___block_invoke_cold_1();
      }
    }

    uint64_t result = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithData:*(void *)(a1 + 40)];
    *(void *)(*(void *)(a1 + 32) + 184) = result;
  }
  return result;
}

- (BOOL)sendChannelBindingMsgWithDict:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v18 = 1472;
  if (a3)
  {

    self->_relayUpdateDict = (NSDictionary *)[a3 copy];
  }
  memset(v19, 170, sizeof(v19));
  ChannelBinduint64_t Request = MakeChannelBindRequest();
  if ((ChannelBindRequest & 0x80000000) != 0)
  {
    uint64_t v12 = ChannelBindRequest;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[TCPTunnelClient sendChannelBindingMsgWithDict:error:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[TCPTunnelClient sendChannelBindingMsgWithDict:error:]();
      }
    }
    if (self->_isChannelBound) {
      uint64_t v13 = 32022;
    }
    else {
      uint64_t v13 = 32002;
    }
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m", 1143);
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a4, v13, 304, (int)v12, v14, @"Sending TCPTunnel ChannelBinding Request failed.", objc_msgSend(NSString, "stringWithFormat:", @"Make request error: %x.", v12));
    FreeSTUNMessage();
  }
  else
  {
    uint64_t v8 = STUNEncodeMessage();
    FreeSTUNMessage();
    if ((v8 & 0x80000000) == 0)
    {
      uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v19 length:v18];
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__TCPTunnelClient_sendChannelBindingMsgWithDict_error___block_invoke;
      block[3] = &unk_1E6DB3E40;
      block[4] = self;
      void block[5] = v9;
      dispatch_async(queue, block);
      return 1;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[TCPTunnelClient sendChannelBindingMsgWithDict:error:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[TCPTunnelClient sendChannelBindingMsgWithDict:error:].cold.4();
      }
    }
    if (self->_isChannelBound) {
      uint64_t v15 = 32022;
    }
    else {
      uint64_t v15 = 32002;
    }
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m", 1159);
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a4, v15, 305, (int)v8, v16, @"Sending TCPTunnel ChannelBinding Request failed.", objc_msgSend(NSString, "stringWithFormat:", @"Encode request error: %x.", v8));
  }
  return 0;
}

uint64_t __55__TCPTunnelClient_sendChannelBindingMsgWithDict_error___block_invoke(uint64_t a1, double a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(int **)(a1 + 32);
  if (v3[2] > 7)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    LODWORD(a2) = v3[26];
    return [v3 vcArg:0 sendControlData:v7 isTypeSSL:0 withTimeout:309 withDetail:a2];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      int v5 = *MEMORY[0x1E4F47A50];
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 136315650;
          uint64_t v10 = v4;
          __int16 v11 = 2080;
          uint64_t v12 = "-[TCPTunnelClient sendChannelBindingMsgWithDict:error:]_block_invoke";
          __int16 v13 = 1024;
          int v14 = 1168;
          _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sendChannelBindingMsgWithDict: save message for set-up in progress.", (uint8_t *)&v9, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        __55__TCPTunnelClient_sendChannelBindingMsgWithDict_error___block_invoke_cold_1();
      }
    }

    uint64_t result = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithData:*(void *)(a1 + 40)];
    *(void *)(*(void *)(a1 + 32) + 192) = result;
  }
  return result;
}

- (BOOL)sendRefreshMsg:(unsigned int)a3 error:(id *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  memset(v12, 170, sizeof(v12));
  MakeRefreshRequest();
  uint64_t v6 = STUNEncodeMessage();
  if ((v6 & 0x80000000) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[TCPTunnelClient sendRefreshMsg:error:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[TCPTunnelClient sendRefreshMsg:error:]();
      }
    }
    if (self->_isChannelBound) {
      uint64_t v9 = 32022;
    }
    else {
      uint64_t v9 = 32002;
    }
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m", 1199);
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a4, v9, 307, (int)v6, v10, @"Sending TCPTunnel Refresh Request failed.", objc_msgSend(NSString, "stringWithFormat:", @"Encode request error: %x.", v6));
    FreeSTUNMessage();
  }
  else
  {
    FreeSTUNMessage();
    uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v12 length:1472];
    *(float *)&double v8 = self->_fTimeout;
    [(TCPTunnelClient *)self vcArg:0 sendControlData:v7 isTypeSSL:0 withTimeout:310 withDetail:v8];
  }
  return (int)v6 >= 0;
}

- (void)vcArg:(id)a3 sendRealTimeData:(id)a4 toParticipantID:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unsigned int channelNumber = self->_channelNumber;
  unsigned int v8 = objc_msgSend(a4, "length", a3);
  unsigned int v9 = v8;
  int v10 = 4 - (v8 & 3);
  if ((v8 & 3) == 0) {
    int v10 = 0;
  }
  int connectState = self->_connectState;
  if (connectState == 8)
  {
    unsigned int v16 = v8 + v10 + 7;
    unsigned int v12 = (unsigned __int16)(v8 + v10 + 7) + 5;
    uint64_t v17 = [(TCPBufferPool *)self->_bufferPool getBufferFromPool:v12];
    if (!v17) {
      return;
    }
    int v14 = v17;
    *(void *)uint64_t v17 = 66327;
    *(_WORD *)(v17 + 3) = bswap32(v16) >> 16;
    uint64_t v15 = 8;
    goto LABEL_9;
  }
  if (connectState == 9)
  {
    unsigned int v12 = (unsigned __int16)v8 + (unsigned __int16)v10 + 4;
    uint64_t v13 = [(TCPBufferPool *)self->_bufferPool getBufferFromPool:v12];
    if (v13)
    {
      int v14 = v13;
      uint64_t v15 = 0;
LABEL_9:
      int v18 = &v14[v15];
      *(_WORD *)int v18 = bswap32(channelNumber) >> 16;
      *((_WORD *)v18 + 1) = bswap32(v9) >> 16;
      memcpy(v18 + 4, (const void *)[a4 bytes], objc_msgSend(a4, "length"));
      queue = self->_queue;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __58__TCPTunnelClient_vcArg_sendRealTimeData_toParticipantID___block_invoke;
      v20[3] = &unk_1E6DB3F58;
      v20[4] = self;
      void v20[5] = v14;
      unsigned int v21 = v12;
      dispatch_async(queue, v20);
    }
  }
}

uint64_t __58__TCPTunnelClient_vcArg_sendRealTimeData_toParticipantID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) sendTCPData:*(void *)(a1 + 40) bufSize:*(unsigned int *)(a1 + 48)];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 256);

  return [v3 returnBufferToPool:v2];
}

- (void)unbindChannel
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_connectState != 1)
  {
    if (self->_isChannelBound)
    {
      memset(v8, 170, sizeof(v8));
      int v7 = 1472;
      MakeRefreshRequest();
      STUNEncodeMessage();
      FreeSTUNMessage();
      uint64_t v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v8 length:1472];
      *(float *)&double v4 = self->_fTimeout;
      [(TCPTunnelClient *)self vcArg:0 sendControlData:v3 isTypeSSL:0 withTimeout:311 withDetail:v4];
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __32__TCPTunnelClient_unbindChannel__block_invoke;
      block[3] = &unk_1E6DB3DC8;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }
}

void __32__TCPTunnelClient_unbindChannel__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)(*(void *)(a1 + 32) + 8) = 1;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v1 = VRTraceErrorLogLevelToCSTR();
    uint64_t v2 = *MEMORY[0x1E4F47A50];
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 136315650;
        uint64_t v5 = v1;
        __int16 v6 = 2080;
        int v7 = "-[TCPTunnelClient unbindChannel]_block_invoke";
        __int16 v8 = 1024;
        int v9 = 1287;
        _os_log_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: TCP channel is unbound.", (uint8_t *)&v4, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      __32__TCPTunnelClient_unbindChannel__block_invoke_cold_1();
    }
  }
}

- (void)closeTunnelSocket
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    int v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int connectedFD = self->_connectedFD;
      *(_DWORD *)buf = 136315906;
      uint64_t v9 = v3;
      __int16 v10 = 2080;
      __int16 v11 = "-[TCPTunnelClient closeTunnelSocket]";
      __int16 v12 = 1024;
      int v13 = 1292;
      __int16 v14 = 1024;
      int v15 = connectedFD;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: closeTunnelSocket %d", buf, 0x22u);
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__TCPTunnelClient_closeTunnelSocket__block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __36__TCPTunnelClient_closeTunnelSocket__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)(*(void *)(a1 + 32) + 8) = 1;
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[10])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      int v4 = *MEMORY[0x1E4F47A50];
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136315650;
          uint64_t v12 = v3;
          __int16 v13 = 2080;
          __int16 v14 = "-[TCPTunnelClient closeTunnelSocket]_block_invoke";
          __int16 v15 = 1024;
          int v16 = 1297;
          _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: Canceling the writeSource.", (uint8_t *)&v11, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        __36__TCPTunnelClient_closeTunnelSocket__block_invoke_cold_2();
      }
    }
    uint64_t v6 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v6 + 88))
    {
      dispatch_resume(*(dispatch_object_t *)(v6 + 80));
      *(unsigned char *)(*(void *)(a1 + 32) + 88) = 0;
      uint64_t v6 = *(void *)(a1 + 32);
    }
    dispatch_source_cancel(*(dispatch_source_t *)(v6 + 80));
    uint64_t v2 = *(void **)(a1 + 32);
  }
  if (v2[9])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      __int16 v8 = *MEMORY[0x1E4F47A50];
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136315650;
          uint64_t v12 = v7;
          __int16 v13 = 2080;
          __int16 v14 = "-[TCPTunnelClient closeTunnelSocket]_block_invoke";
          __int16 v15 = 1024;
          int v16 = 1306;
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d TCPTUNNEL: Canceling the readSource.", (uint8_t *)&v11, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        __36__TCPTunnelClient_closeTunnelSocket__block_invoke_cold_1();
      }
    }
    dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 72));
    uint64_t v2 = *(void **)(a1 + 32);
  }
  return [v2 destroyDispatchTimer];
}

- (BOOL)isTunnelSocketClosed
{
  return self->_connectedFD == -1;
}

- (id)receiveHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setReceiveHandler:(id)a3
{
}

- (id)allocationResponseHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setAllocationResponseHandler:(id)a3
{
}

- (id)bindingResponseHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setBindingResponseHandler:(id)a3
{
}

- (id)destroyHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setDestroyHandler:(id)a3
{
}

- (id)terminationHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setTerminationHandler:(id)a3
{
}

- (NSString)participantID
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setParticipantID:(id)a3
{
}

- (void)createDispatchTimer:withDetailedError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d TCPTUNNEL: timer is set.", v2, v3, v4, v5, v6);
}

void __57__TCPTunnelClient_createDispatchTimer_withDetailedError___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_17(*(float *)(a2 + 48));
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2(&dword_1E1EA4000, v2, v3, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Request timed out after %5.2f sec.", v4, v5, v6, v7, v8);
}

void __57__TCPTunnelClient_createDispatchTimer_withDetailedError___block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_17(*(float *)(a2 + 48));
  OUTLINED_FUNCTION_15();
  _os_log_fault_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_FAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Request timed out after %5.2f sec.", v3, 0x2Cu);
}

- (void)sendTCPData:bufSize:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[TCPTunnelClient sendTCPData:bufSize:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_1E1EA4000, v0, v1, " [%s] %s:%d TCPTUNNEL: put %d on write buffer.", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient sendTCPData:bufSize:]" >> 16, 333);
}

- (void)sendTCPData:bufSize:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d TCPTUNNEL: wcb resume", v2, v3, v4, v5, v6);
}

- (void)sendTCPData:bufSize:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: socket error, tear down the connection.", v2, v3, v4, v5, v6);
}

- (void)sendTCPData:bufSize:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_8(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: socket error, tear down the connection.", v2, v3, v4, v5, v6);
}

- (void)processSocketWrite:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d TCPTUNNEL: wcb suspend", v2, v3, v4, v5, v6);
}

- (void)processSocketWrite:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d TCPTUNNEL: reset write buffer", v2, v3, v4, v5, v6);
}

- (void)processSocketWrite:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Socket error, tear down the connection.", v2, v3, v4, v5, v6);
}

- (void)processSocketWrite:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_8(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Socket error, tear down the connection.", v2, v3, v4, v5, v6);
}

- (void)processSocketWrite:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d TCPTUNNEL: We got a TCP connection!", v2, v3, v4, v5, v6);
}

- (void)processSocketWrite:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d TCPTUNNEL: Start SSL handshake", v2, v3, v4, v5, v6);
}

- (void)processSocketWrite:.cold.7()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_1E1EA4000, v0, v1, " [%s] %s:%d TCPTUNNEL: socket is successfully connected %d.", v2, v3, v4, v5);
}

- (void)processSocketWrite:.cold.8()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_1E1EA4000, v0, v1, " [%s] %s:%d TCPTUNNEL: wcb: %d", v2, v3, v4, v5);
}

void __74__TCPTunnelClient_vcArg_sendControlData_isTypeSSL_withTimeout_withDetail___block_invoke_2_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*a2 length];
  int v6 = 136315906;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  uint64_t v9 = "-[TCPTunnelClient vcArg:sendControlData:isTypeSSL:withTimeout:withDetail:]_block_invoke_2";
  OUTLINED_FUNCTION_3();
  int v10 = 416;
  __int16 v11 = 2048;
  uint64_t v12 = v5;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Data length is too large: %lu", (uint8_t *)&v6, 0x26u);
}

- (void)receivedControlData:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[TCPTunnelClient receivedControlData:]";
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_3(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Error parsing TURN message (%08X)", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient receivedControlData:]" >> 16, v4, v5);
}

- (void)receivedControlData:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[TCPTunnelClient receivedControlData:]";
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_9_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Error parsing TURN message (%08X)", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient receivedControlData:]" >> 16, v4, v5);
}

- (void)receivedControlData:.cold.3()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  LOWORD(v6) = 0;
  HIWORD(v6) = v0;
  OUTLINED_FUNCTION_2_3(&dword_1E1EA4000, v1, v2, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: throw away TURN Message(%x).", v3, v4, v5, 581, v6);
}

- (void)receivedControlData:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: ProcessAllocateResponse failed", v2, v3, v4, v5, v6);
}

- (void)receivedControlData:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d TCPTUNNEL: send saved ChannelBinding request now.", v2, v3, v4, v5, v6);
}

- (void)receivedControlData:.cold.6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Got error response for Allocate request.", v2, v3, v4, v5, v6);
}

- (void)receivedControlData:.cold.7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_8(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Got error response for Allocate request.", v2, v3, v4, v5, v6);
}

- (void)receivedControlData:.cold.8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Got error response for ChannelBinding request.", v2, v3, v4, v5, v6);
}

- (void)receivedControlData:.cold.9()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_8(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Got error response for ChannelBinding request.", v2, v3, v4, v5, v6);
}

- (void)receivedControlData:.cold.10()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Got error response for Refresh request.", v2, v3, v4, v5, v6);
}

- (void)receivedControlData:.cold.11()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_8(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Got error response for Refresh request.", v2, v3, v4, v5, v6);
}

- (void)receivedSSLConnectionData:recordType:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d TCPTUNNEL: send Allocate request in queue now.", v2, v3, v4, v5, v6);
}

- (void)receivedSSLConnectionData:recordType:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d TCPTUNNEL: SSL enabled channel has set up.", v2, v3, v4, v5, v6);
}

- (void)initWithRelayRequestDictionary:withCallID:relayType:errorCode:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Only Carrier interface available.", v2, v3, v4, v5, v6);
}

- (void)initWithRelayRequestDictionary:withCallID:relayType:errorCode:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: Only Carrier interface available.", v2, v3, v4, v5, v6);
}

- (void)initWithRelayRequestDictionary:withCallID:relayType:errorCode:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: can't create socket", v2, v3, v4, v5, v6);
}

- (void)initWithRelayRequestDictionary:withCallID:relayType:errorCode:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: no port to bind to.", v2, v3, v4, v5, v6);
}

- (void)initWithRelayRequestDictionary:withCallID:relayType:errorCode:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: can't reserver buffer pool", v2, v3, v4, v5, v6);
}

void __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: can't create write source.", v2, v3, v4, v5, v6);
}

void __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_8(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: can't create write source.", v2, v3, v4, v5, v6);
}

void __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: can't create read source.", v2, v3, v4, v5, v6);
}

void __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_8(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: can't create read source.", v2, v3, v4, v5, v6);
}

void __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d TCPTUNNEL: We got a TCP connection!", v2, v3, v4, v5, v6);
}

void __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d TCPTUNNEL: Start SSL handshake", v2, v3, v4, v5, v6);
}

void __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_7()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_0(&dword_1E1EA4000, v0, v1, " [%s] %s:%d TCPTUNNEL: connect is done immediately %d.", v2, v3, v4, v5);
}

void __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  __error();
  int v5 = 136316418;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_13_5();
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: We can't connect: %d, %d", (uint8_t *)&v5, 0x2Eu);
}

void __81__TCPTunnelClient_initWithRelayRequestDictionary_withCallID_relayType_errorCode___block_invoke_cold_9(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  __error();
  int v5 = 136316418;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_13_5();
  _os_log_fault_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_FAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: TCPTUNNEL: We can't connect: %d, %d", (uint8_t *)&v5, 0x2Eu);
}

- (void)sendAllocateMsg:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[TCPTunnelClient sendAllocateMsg:]";
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_3(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: sendAllocateMsg: MakeAllocateRequest error: %x", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient sendAllocateMsg:]" >> 16, v4, v5);
}

- (void)sendAllocateMsg:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[TCPTunnelClient sendAllocateMsg:]";
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_9_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: sendAllocateMsg: MakeAllocateRequest error: %x", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient sendAllocateMsg:]" >> 16, v4, v5);
}

- (void)sendAllocateMsg:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[TCPTunnelClient sendAllocateMsg:]";
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_3(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: sendAllocateMsg: STUNEncodeMessage error: %x", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient sendAllocateMsg:]" >> 16, v4, v5);
}

- (void)sendAllocateMsg:.cold.4()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[TCPTunnelClient sendAllocateMsg:]";
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_9_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: sendAllocateMsg: STUNEncodeMessage error: %x", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient sendAllocateMsg:]" >> 16, v4, v5);
}

void __35__TCPTunnelClient_sendAllocateMsg___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d sendAllocateMsg: save the message for set-up in progress.", v2, v3, v4, v5, v6);
}

- (void)sendChannelBindingMsgWithDict:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[TCPTunnelClient sendChannelBindingMsgWithDict:error:]";
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_3(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: sendChannelBindingMsg: MakeChannelBindRequest error: %x", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient sendChannelBindingMsgWithDict:error:]" >> 16, v4, v5);
}

- (void)sendChannelBindingMsgWithDict:error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[TCPTunnelClient sendChannelBindingMsgWithDict:error:]";
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_9_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: sendChannelBindingMsg: MakeChannelBindRequest error: %x", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient sendChannelBindingMsgWithDict:error:]" >> 16, v4, v5);
}

- (void)sendChannelBindingMsgWithDict:error:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[TCPTunnelClient sendChannelBindingMsgWithDict:error:]";
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_3(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: sendChannelBindingMsg: STUNEncodeMessage error: %x", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient sendChannelBindingMsgWithDict:error:]" >> 16, v4, v5);
}

- (void)sendChannelBindingMsgWithDict:error:.cold.4()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[TCPTunnelClient sendChannelBindingMsgWithDict:error:]";
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_9_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: sendChannelBindingMsg: STUNEncodeMessage error: %x", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient sendChannelBindingMsgWithDict:error:]" >> 16, v4, v5);
}

void __55__TCPTunnelClient_sendChannelBindingMsgWithDict_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d sendChannelBindingMsgWithDict: save message for set-up in progress.", v2, v3, v4, v5, v6);
}

- (void)sendRefreshMsg:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[TCPTunnelClient sendRefreshMsg:error:]";
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_3(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: sendRefreshMsg: STUNEncodeMessage error: %x", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient sendRefreshMsg:error:]" >> 16, v4, v5);
}

- (void)sendRefreshMsg:error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[TCPTunnelClient sendRefreshMsg:error:]";
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_9_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/TCPTunnelClient.m:%d: sendRefreshMsg: STUNEncodeMessage error: %x", v2, *(const char **)v3, (unint64_t)"-[TCPTunnelClient sendRefreshMsg:error:]" >> 16, v4, v5);
}

void __32__TCPTunnelClient_unbindChannel__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d TCPTUNNEL: TCP channel is unbound.", v2, v3, v4, v5, v6);
}

void __36__TCPTunnelClient_closeTunnelSocket__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d TCPTUNNEL: Canceling the readSource.", v2, v3, v4, v5, v6);
}

void __36__TCPTunnelClient_closeTunnelSocket__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d TCPTUNNEL: Canceling the writeSource.", v2, v3, v4, v5, v6);
}

@end