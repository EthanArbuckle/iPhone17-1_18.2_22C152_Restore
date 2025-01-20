@interface VCTransportSessionIDSSingleLink
- (VCConnectionIDS)connection;
- (VCTransportSessionIDSSingleLink)initWithNotificationQueue:(id)a3 reportingAgent:(opaqueRTCReporting *)a4;
- (id)copyActiveConnection;
- (int)createVFD:(int *)a3 forStreamType:(unsigned int)a4;
- (int)onStart;
- (int)updateTransportStream:(OpaqueVCTransportStream *)a3;
- (void)dealloc;
- (void)handleLinkConnectedWithInfo:(id)a3;
- (void)handleLinkDisconnectedWithInfo:(id)a3;
- (void)onStart;
- (void)setConnection:(id)a3;
@end

@implementation VCTransportSessionIDSSingleLink

- (VCTransportSessionIDSSingleLink)initWithNotificationQueue:(id)a3 reportingAgent:(opaqueRTCReporting *)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCTransportSessionIDSSingleLink;
  return [(VCTransportSessionIDS *)&v5 initWithCallID:0 requireEncryptionInfo:0 reportingAgent:a4 notificationQueue:a3];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCTransportSessionIDSSingleLink;
  [(VCTransportSessionIDS *)&v3 dealloc];
}

- (void)handleLinkConnectedWithInfo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      uint64_t v13 = v5;
      __int16 v14 = 2080;
      v15 = "-[VCTransportSessionIDSSingleLink handleLinkConnectedWithInfo:]";
      __int16 v16 = 1024;
      int v17 = 37;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d IDS channel connected", (uint8_t *)&v12, 0x1Cu);
    }
  }
  v7 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A6C0]];
  if (v7)
  {
    v8 = (void *)[v7 firstObject];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (v8) {
          v11 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
        }
        else {
          v11 = "<nil>";
        }
        int v12 = 136315906;
        uint64_t v13 = v9;
        __int16 v14 = 2080;
        v15 = "-[VCTransportSessionIDSSingleLink handleLinkConnectedWithInfo:]";
        __int16 v16 = 1024;
        int v17 = 42;
        __int16 v18 = 2080;
        v19 = v11;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: new link established with link context=%s", (uint8_t *)&v12, 0x26u);
      }
    }
    if (v8) {
      self->_connection = [[VCConnectionIDS alloc] initWithLinkContext:v8 dataChannelToken:VCDatagramChannelIDS_Token((uint64_t)self->super._datagramChannel)];
    }
  }
}

- (void)handleLinkDisconnectedWithInfo:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      v8 = "-[VCTransportSessionIDSSingleLink handleLinkDisconnectedWithInfo:]";
      __int16 v9 = 1024;
      int v10 = 51;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d IDS channel disconnected", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (int)onStart
{
  p_stateLock = &self->super.super._stateLock;
  pthread_mutex_lock(&self->super.super._stateLock);
  int v4 = [(NSMutableArray *)self->super.super._streams count];
  if (v4 < 1)
  {
    int v7 = 0;
LABEL_7:
    [(VCTransportSession *)self callEventHandlerWithEvent:1 info:0];
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v6 = v4;
    while (1)
    {
      int v7 = [(VCTransportSessionIDSSingleLink *)self updateTransportStream:[(NSMutableArray *)self->super.super._streams objectAtIndexedSubscript:v5]];
      if (v7 < 0) {
        break;
      }
      if (v6 == ++v5) {
        goto LABEL_7;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionIDSSingleLink onStart]();
      }
    }
  }
  pthread_mutex_unlock(p_stateLock);
  return v7;
}

- (int)createVFD:(int *)a3 forStreamType:(unsigned int)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unsigned int v13 = -1;
  if (a3)
  {
    int v6 = +[VCTransportSession vtpPacketTypeForStreamType:*(void *)&a4];
    if (v6)
    {
      int v7 = VCCreateVFDForIDS(v6, 43, (int *)&v13);
      if ((v7 & 0x80000000) == 0)
      {
        int v8 = v13;
        uint64_t v9 = VCDatagramChannelIDS_Token((uint64_t)self->super._datagramChannel);
        if (VTP_SetSourceDestinationWithToken(v8, v9) == -1)
        {
          int v7 = *__error() | 0xC02B0000;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCTransportSessionIDSSingleLink createVFD:forStreamType:]();
            }
          }
        }
        else
        {
          *a3 = v13;
          unsigned int v13 = -1;
        }
      }
    }
    else
    {
      int v7 = -2144665599;
    }
  }
  else
  {
    int v7 = -2144665599;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      int v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionIDSSingleLink createVFD:forStreamType:](v11, v12);
      }
    }
  }
  VCCloseVFDIfValid(v13);
  return v7;
}

- (int)updateTransportStream:(OpaqueVCTransportStream *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v15 = 0;
  uint64_t CMBaseObject = VCPacketFilterGetCMBaseObject(a3, a2);
  uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  int v8 = *(uint64_t (**)(uint64_t, __CFString *, void, id *))(v7 + 48);
  if (v8)
  {
    unsigned int v9 = v8(CMBaseObject, @"UnderlyingVFD", *MEMORY[0x1E4F1CF80], &v15);
    if ((v9 & 0x80000000) == 0)
    {
      int v10 = [v15 intValue];
      uint64_t v11 = VCDatagramChannelIDS_Token((uint64_t)self->super._datagramChannel);
      if (VTP_SetSourceDestinationWithToken(v10, v11) == -1)
      {
        unsigned int v9 = *__error() | 0xC02B0000;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCTransportSessionIDSSingleLink updateTransportStream:]();
          }
        }
      }
      goto LABEL_14;
    }
  }
  else
  {
    unsigned int v9 = -12782;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    unsigned int v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v17 = v12;
      __int16 v18 = 2080;
      v19 = "-[VCTransportSessionIDSSingleLink updateTransportStream:]";
      __int16 v20 = 1024;
      int v21 = 96;
      __int16 v22 = 2112;
      v23 = @"UnderlyingVFD";
      __int16 v24 = 2112;
      v25 = a3;
      _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d Could not get property '%@' for transport stream '%@'", buf, 0x30u);
    }
  }
LABEL_14:

  return v9;
}

- (id)copyActiveConnection
{
  v2 = [(VCTransportSessionIDSSingleLink *)self connection];

  return v2;
}

- (VCConnectionIDS)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void)onStart
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  int v3 = 62;
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to update transport stream '%@'", v2, 0x26u);
}

- (void)createVFD:(uint64_t)a1 forStreamType:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[VCTransportSessionIDSSingleLink createVFD:forStreamType:]";
  __int16 v6 = 1024;
  int v7 = 75;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d NULL vfd", (uint8_t *)&v2, 0x1Cu);
}

- (void)createVFD:forStreamType:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTP_SetSourceDestinationWithToken failed %x", v2, v3, v4, 84);
}

- (void)updateTransportStream:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTP_SetSourceDestinationWithToken failed %x", v2, v3, v4, 100);
}

@end