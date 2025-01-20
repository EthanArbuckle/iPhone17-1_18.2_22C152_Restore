@interface AVCPacketRelay
- (AVCPacketRelay)initWithConnection:(id)a3 connection:(id)a4 error:(id *)a5;
- (AVCPacketRelay)initWithConnections:(id)a3 multiplexedConnection:(id)a4 error:(id *)a5;
- (AVCPacketRelayConnectionProtocol)multiplexedConnection;
- (AVCPacketRelayDelegate)delegate;
- (BOOL)isAllConnectionTypeValid:(id)a3;
- (BOOL)stopAllConnections;
- (NSArray)connections;
- (id)findConnectionToForwardData:(const void *)a3 size:(int)a4;
- (int)startAllConnections;
- (void)dealloc;
- (void)healthPrint:(unint64_t)a3 isSend:(BOOL)a4;
- (void)setConnections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMultiplexedConnection:(id)a3;
- (void)start;
- (void)startAllConnections;
- (void)stop;
- (void)stopAllConnections;
- (void)updateDemuxPacketStatsWithPacketFilterPacketType:(unsigned __int8)a3;
@end

@implementation AVCPacketRelay

- (AVCPacketRelay)initWithConnection:(id)a3 connection:(id)a4 error:(id *)a5
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = a3;
  return -[AVCPacketRelay initWithConnections:multiplexedConnection:error:](self, "initWithConnections:multiplexedConnection:error:", [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1], a4, a5);
}

- (AVCPacketRelay)initWithConnections:(id)a3 multiplexedConnection:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  VRTraceReset();
  v27.receiver = self;
  v27.super_class = (Class)AVCPacketRelay;
  v9 = [(AVCPacketRelay *)&v27 init];
  if (!v9) {
    return v9;
  }
  uint64_t v10 = [a3 count];
  if (!a4 || !v10)
  {
    uint64_t v22 = -2144731135;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCPacketRelay initWithConnections:multiplexedConnection:error:].cold.4();
      }
    }
LABEL_23:
    uint64_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AVCPacketRelayErrorDomain" code:v22 userInfo:0];
    if (!v23) {
      return v9;
    }
    v24 = (void *)v23;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
      -[AVCPacketRelay initWithConnections:multiplexedConnection:error:]();
      if (!a5) {
        goto LABEL_28;
      }
    }
    else if (!a5)
    {
LABEL_28:

      return 0;
    }
    *a5 = v24;
    goto LABEL_28;
  }
  if (![a4 type]
    || ![(AVCPacketRelay *)v9 isAllConnectionTypeValid:a3])
  {
    uint64_t v22 = -2144731135;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCPacketRelay initWithConnections:multiplexedConnection:error:]();
      }
    }
    goto LABEL_23;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  dispatch_queue_t v12 = dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCPacketRelayQueue", 0, CustomRootQueue);
  v9->_queue = (OS_dispatch_queue *)v12;
  if (!v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    {
      uint64_t v22 = -2144731133;
    }
    else
    {
      VRTraceErrorLogLevelToCSTR();
      uint64_t v22 = -2144731133;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCPacketRelay initWithConnections:multiplexedConnection:error:]();
      }
    }
    goto LABEL_23;
  }
  v9->_packetDriver = +[AVCPacketRelayDriver sharedInstance];
  uint64_t v13 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:v9];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __66__AVCPacketRelay_initWithConnections_multiplexedConnection_error___block_invoke;
  v26[3] = &unk_1E6DB8FE8;
  v26[4] = v13;
  [a4 setIsDemuxNeeded:1];
  [a4 setReadHandler:v26];
  [(AVCPacketRelay *)v9 setMultiplexedConnection:a4];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v14 = [a3 countByEnumeratingWithState:&v37 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(a3);
        }
        v18 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        [v18 setIsDemuxNeeded:0];
        [v18 setReadHandler:v26];
      }
      uint64_t v15 = [a3 countByEnumeratingWithState:&v37 objects:v36 count:16];
    }
    while (v15);
  }
  [(AVCPacketRelay *)v9 setConnections:a3];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = objc_msgSend((id)-[AVCPacketRelay description](v9, "description"), "UTF8String");
      *(_DWORD *)buf = 136315906;
      uint64_t v29 = v19;
      __int16 v30 = 2080;
      v31 = "-[AVCPacketRelay initWithConnections:multiplexedConnection:error:]";
      __int16 v32 = 1024;
      int v33 = 567;
      __int16 v34 = 2080;
      uint64_t v35 = v21;
      _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created AVCPacketRelay %s successfully", buf, 0x26u);
    }
  }
  return v9;
}

void __66__AVCPacketRelay_initWithConnections_multiplexedConnection_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = a5;
  if (a5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __66__AVCPacketRelay_initWithConnections_multiplexedConnection_error___block_invoke_cold_3();
      }
    }
    return;
  }
  if ([*(id *)(a1 + 32) weak])
  {
    v9 = (void *)MEMORY[0x1E4E56580]([*(id *)(a1 + 32) weak]);
    if (v9)
    {
      uint64_t v10 = v9;
      [v9 healthPrint:a3 isSend:0];
      if (a4)
      {
        v11 = (void *)[v10 findConnectionToForwardData:a2 size:a3];
        dispatch_queue_t v12 = (void *)[v11 packetFilter];
        if ([v12 isRTPFilter]) {
          objc_msgSend(v10, "updateDemuxPacketStatsWithPacketFilterPacketType:", objc_msgSend(v12, "type"));
        }
        if (!v11)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              __66__AVCPacketRelay_initWithConnections_multiplexedConnection_error___block_invoke_cold_1();
            }
          }
          goto LABEL_24;
        }
        uint64_t v13 = v11;
      }
      else
      {
        uint64_t v13 = (void *)[v10 multiplexedConnection];
      }
      [v13 sendData:a2 size:a3 error:&v16];
      if (v16)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __66__AVCPacketRelay_initWithConnections_multiplexedConnection_error___block_invoke_cold_2();
          }
        }
      }
      else
      {
        [v10 healthPrint:a3 isSend:1];
      }
LABEL_24:
      CFRelease(v10);
      return;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v18 = v14;
      __int16 v19 = 2080;
      v20 = "-[AVCPacketRelay initWithConnections:multiplexedConnection:error:]_block_invoke";
      __int16 v21 = 1024;
      int v22 = 529;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelay has been dealloced", buf, 0x1Cu);
    }
  }
}

- (AVCPacketRelayDelegate)delegate
{
  return (AVCPacketRelayDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void)start
{
  v3[5] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __23__AVCPacketRelay_start__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(queue, v3);
}

uint64_t __23__AVCPacketRelay_start__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      uint64_t v14 = v2;
      __int16 v15 = 2080;
      uint64_t v16 = "-[AVCPacketRelay start]_block_invoke";
      __int16 v17 = 1024;
      int v18 = 594;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelay: starting...", (uint8_t *)&v13, 0x1Cu);
    }
  }
  int v4 = [*(id *)(a1 + 32) startAllConnections];
  v5 = *(void **)(a1 + 32);
  if (v4 < 0)
  {
    [v5 stopAllConnections];
    uint64_t v11 = [*(id *)(a1 + 32) delegate];
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AVCPacketRelayErrorDomain" code:v4 userInfo:0];
    v6 = (void *)v11;
    uint64_t v7 = v12;
    uint64_t v8 = 0;
  }
  else
  {
    v6 = (void *)[v5 delegate];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = 1;
    uint64_t v9 = 0;
  }
  return [v6 packetRelay:v7 didStart:v8 error:v9];
}

- (void)stop
{
  v3[5] = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __22__AVCPacketRelay_stop__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(queue, v3);
}

uint64_t __22__AVCPacketRelay_stop__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      uint64_t v8 = "-[AVCPacketRelay stop]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 613;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelay: stopping...", (uint8_t *)&v5, 0x1Cu);
    }
  }
  [*(id *)(a1 + 32) stopAllConnections];
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "packetRelay:didStop:error:", *(void *)(a1 + 32), 1, 0);
  }
  return result;
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
      int v10 = "-[AVCPacketRelay dealloc]";
      __int16 v11 = 1024;
      int v12 = 632;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelay: dealloc", buf, 0x1Cu);
    }
  }

  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  objc_storeWeak((id *)&self->_delegate, 0);
  v6.receiver = self;
  v6.super_class = (Class)AVCPacketRelay;
  [(AVCPacketRelay *)&v6 dealloc];
}

- (BOOL)isAllConnectionTypeValid:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(a3);
      }
      int v8 = [*(id *)(*((void *)&v11 + 1) + 8 * v7) type];
      if (!v8) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (int)startAllConnections
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  connections = self->_connections;
  uint64_t v4 = [(NSArray *)connections countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(connections);
        }
        int v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) start];
        if (v8 < 0)
        {
          int v9 = v8;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [(NSArray *)connections countByEnumeratingWithState:&v12 objects:v11 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  int v9 = [(AVCPacketRelayConnectionProtocol *)self->_multiplexedConnection start];
  if (v9 < 0)
  {
LABEL_12:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCPacketRelay startAllConnections]();
      }
    }
  }
  return v9;
}

- (BOOL)stopAllConnections
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  connections = self->_connections;
  uint64_t v3 = [(NSArray *)connections countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = (os_log_t *)MEMORY[0x1E4F47A50];
    uint64_t v7 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(connections);
        }
        int v9 = [*(id *)(*((void *)&v26 + 1) + 8 * i) stop];
        if (v9 < 0)
        {
          int v10 = v9;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v11 = VRTraceErrorLogLevelToCSTR();
            long long v12 = *v6;
            if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315906;
              uint64_t v18 = v11;
              __int16 v19 = 2080;
              v20 = "-[AVCPacketRelay stopAllConnections]";
              __int16 v21 = 1024;
              int v22 = 678;
              __int16 v23 = 1024;
              int v24 = v10;
              _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d AVCPacketRelay: stop connection failed with result %08X", buf, 0x22u);
            }
          }
          int v5 = v10;
        }
      }
      uint64_t v4 = [(NSArray *)connections countByEnumeratingWithState:&v26 objects:v25 count:16];
    }
    while (v4);
  }
  else
  {
    int v5 = 0;
  }
  int v13 = [(AVCPacketRelayConnectionProtocol *)self->_multiplexedConnection stop];
  if (v13 < 0)
  {
    int v14 = v13;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCPacketRelay stopAllConnections]();
      }
    }
    int v5 = v14;
  }
  else if ((v5 & 0x80000000) == 0)
  {
    return v5 != 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[AVCPacketRelay stopAllConnections]();
    }
  }
  return v5 != 0;
}

- (id)findConnectionToForwardData:(const void *)a3 size:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  connections = self->_connections;
  uint64_t v7 = [(NSArray *)connections countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v15;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v15 != v9) {
      objc_enumerationMutation(connections);
    }
    uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
    if (![v11 packetFilter]
      || (objc_msgSend((id)objc_msgSend(v11, "packetFilter"), "isMatchedPacket:size:", a3, v4) & 1) != 0)
    {
      return v11;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [(NSArray *)connections countByEnumeratingWithState:&v14 objects:v13 count:16];
      uint64_t v11 = 0;
      if (v8) {
        goto LABEL_3;
      }
      return v11;
    }
  }
}

- (void)healthPrint:(unint64_t)a3 isSend:(BOOL)a4
{
  BOOL v4 = a4;
  int v5 = a3;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  double v7 = micro();
  double v8 = v7;
  if (v4)
  {
    unsigned int v9 = self->_healthStats.sendByteCount + v5;
    ++self->_healthStats.sendPacketCount;
    self->_healthStats.unsigned int sendByteCount = v9;
    double v10 = v7 - self->_healthStats.lastSendTimePrint;
    if (v10 > 0.0 && v10 > 5.0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        int v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int sendPacketCount = self->_healthStats.sendPacketCount;
          unsigned int sendByteCount = self->_healthStats.sendByteCount;
          int v27 = 136316674;
          uint64_t v28 = v12;
          __int16 v29 = 2080;
          uint64_t v30 = "-[AVCPacketRelay healthPrint:isSend:]";
          __int16 v31 = 1024;
          int v32 = 720;
          __int16 v33 = 1024;
          unsigned int v34 = sendPacketCount;
          __int16 v35 = 1024;
          unsigned int v36 = sendByteCount;
          __int16 v37 = 2048;
          double v38 = v10;
          __int16 v39 = 2048;
          double v40 = (double)(8 * sendByteCount) / v10 / 1000.0;
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @=@ Health: AVCPacketRelay Health Monitor for AVCPacketRelay Send packet count=%d, byte count=%d, interval=%.3fs, rate=%.3fkbps", (uint8_t *)&v27, 0x3Cu);
        }
      }
      self->_healthStats.lastSendTimePrint = v8;
      *(void *)&self->_healthStats.unsigned int sendPacketCount = 0;
    }
  }
  else
  {
    unsigned int v16 = self->_healthStats.receiveByteCount + v5;
    ++self->_healthStats.receivePacketCount;
    self->_healthStats.unsigned int receiveByteCount = v16;
    double v17 = v7 - self->_healthStats.lastReceiveTimePrint;
    if (v17 > 0.0 && v17 > 5.0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int receivePacketCount = self->_healthStats.receivePacketCount;
          unsigned int receiveByteCount = self->_healthStats.receiveByteCount;
          int v27 = 136317698;
          unsigned int rtpAndRTCPPacketCount = self->_healthStats.demuxPacketStats.rtpAndRTCPPacketCount;
          unsigned int rtpPacketCount = self->_healthStats.demuxPacketStats.rtpPacketCount;
          unsigned int rtcpPacketCount = self->_healthStats.demuxPacketStats.rtcpPacketCount;
          unsigned int droppedPacketCount = self->_healthStats.demuxPacketStats.droppedPacketCount;
          uint64_t v28 = v19;
          __int16 v29 = 2080;
          uint64_t v30 = "-[AVCPacketRelay healthPrint:isSend:]";
          __int16 v31 = 1024;
          int v32 = 739;
          __int16 v33 = 1024;
          unsigned int v34 = receivePacketCount;
          __int16 v35 = 1024;
          unsigned int v36 = receiveByteCount;
          __int16 v37 = 2048;
          double v38 = v17;
          __int16 v39 = 2048;
          double v40 = (double)(8 * receiveByteCount) / v17 / 1000.0;
          __int16 v41 = 1024;
          unsigned int v42 = rtpAndRTCPPacketCount;
          __int16 v43 = 1024;
          unsigned int v44 = rtpPacketCount;
          __int16 v45 = 1024;
          unsigned int v46 = rtcpPacketCount;
          __int16 v47 = 1024;
          unsigned int v48 = droppedPacketCount;
          _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @=@ Health: AVCPacketRelay Health Monitor for AVCPacketRelay Recv packet count=%d, byte count=%d, interval=%.3fs, rate:%.3fkbps, demuxPackets:[rtpAndRTCPPacketCount=%u, rtpPacketCount=%u, rtcpPacketCount=%u, droppedPacketCount=%u]", (uint8_t *)&v27, 0x54u);
        }
      }
      self->_healthStats.lastReceiveTimePrint = v8;
      *(void *)&self->_healthStats.unsigned int receivePacketCount = 0;
      *(void *)&self->_healthStats.demuxPacketStats.unsigned int rtpAndRTCPPacketCount = 0;
      *(void *)&self->_healthStats.demuxPacketStats.unsigned int rtcpPacketCount = 0;
    }
  }
}

- (void)updateDemuxPacketStatsWithPacketFilterPacketType:(unsigned __int8)a3
{
  if (a3 == 2)
  {
    ++self->_healthStats.demuxPacketStats.rtcpPacketCount;
  }
  else if (a3 == 1)
  {
    ++self->_healthStats.demuxPacketStats.rtpPacketCount;
  }
  else if (a3)
  {
    ++self->_healthStats.demuxPacketStats.droppedPacketCount;
  }
  else
  {
    ++self->_healthStats.demuxPacketStats.rtpAndRTCPPacketCount;
  }
}

- (NSArray)connections
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConnections:(id)a3
{
}

- (AVCPacketRelayConnectionProtocol)multiplexedConnection
{
  return (AVCPacketRelayConnectionProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMultiplexedConnection:(id)a3
{
}

- (void)initWithConnections:multiplexedConnection:error:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  objc_msgSend((id)objc_msgSend(v0, "description"), "UTF8String");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d AVCPacketRelay: init failed with error %s", v3, v4, v5, v6, v7);
}

- (void)initWithConnections:multiplexedConnection:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCPacketRelay: init connection has wrong type", v2, v3, v4, v5, v6);
}

- (void)initWithConnections:multiplexedConnection:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCPacketRelay: failed to create AVCPacketRelayQueue", v2, v3, v4, v5, v6);
}

- (void)initWithConnections:multiplexedConnection:error:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCPacketRelay: init connection is nil", v2, v3, v4, v5, v6);
}

void __66__AVCPacketRelay_initWithConnections_multiplexedConnection_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCPacketRelay: doesn't know how to forward packet", v2, v3, v4, v5, v6);
}

void __66__AVCPacketRelay_initWithConnections_multiplexedConnection_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_11_0();
  if (*v0) {
    objc_msgSend((id)objc_msgSend(*v0, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d AVCPacketRelay: forwarding packet failed with error %s", v3, v4, v5, v6, v7);
}

void __66__AVCPacketRelay_initWithConnections_multiplexedConnection_error___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_11_0();
  objc_msgSend((id)objc_msgSend(v0, "description"), "UTF8String");
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d AVCPacketRelay: readHandler failed with error %s", v3, v4, v5, v6, v7);
}

- (void)startAllConnections
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[AVCPacketRelay startAllConnections]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCPacketRelay: start failed with result %08X", v2, *(const char **)v3, (unint64_t)"-[AVCPacketRelay startAllConnections]" >> 16, v4);
}

- (void)stopAllConnections
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[AVCPacketRelay stopAllConnections]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AVCPacketRelay: stop multiplexed connection failed with result %08X", v2, *(const char **)v3, (unint64_t)"-[AVCPacketRelay stopAllConnections]" >> 16, v4);
}

@end