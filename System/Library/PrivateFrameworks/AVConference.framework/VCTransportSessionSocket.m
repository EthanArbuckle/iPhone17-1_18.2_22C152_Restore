@interface VCTransportSessionSocket
- (BOOL)isIPv6;
- (VCTransportSessionSocket)initWithRTPSocket:(int)a3 RTCPSocket:(int)a4;
- (VCTransportSessionSocket)initWithRTPSocket:(int)a3 RTCPSocket:(int)a4 notificationHandler:(void *)a5 eventHandler:(void *)a6 handlerQueue:(id)a7 context:(void *)a8;
- (VCTransportSessionSocket)initWithSharedSocket:(int)a3;
- (VCTransportSessionSocket)initWithSocketDictionary:(id)a3 notificationHandler:(void *)a4 eventHandler:(void *)a5 handlerQueue:(id)a6 context:(void *)a7;
- (id)streams;
- (int)configureParamatersForStreamType:(unsigned int)a3 socket:(int *)a4 packetType:(int *)a5 remoteIP:(sockaddr_storage *)a6 remoteIPLength:(unsigned int *)a7;
- (int)connectSocket:(int)a3 remoteAddress:(id)a4 storage:(sockaddr_storage *)a5;
- (int)createAndConfigureVFDForSocket:(int)a3 packetType:(int)a4 remoteIP:(sockaddr_storage *)a5 remoteIPLength:(unsigned int)a6 vfd:(int *)a7;
- (int)createVFD:(int *)a3 forStreamType:(unsigned int)a4;
- (int)createVFD:(int *)a3 realSocket:(int)a4 sockAddr:(sockaddr_storage *)a5 length:(unsigned int *)a6 isUsable:(BOOL *)a7;
- (int)initializeNetworkInfoWithSocket:(int)a3;
- (int)networkInterfaceType;
- (int)setAudioRTCPStreamParamatersForSocket:(int *)a3 packetType:(int *)a4 remoteIP:(sockaddr_storage *)a5 remoteIPLength:(unsigned int *)a6;
- (int)setAudioRTPStreamParamatersForSocket:(int *)a3 packetType:(int *)a4 remoteIP:(sockaddr_storage *)a5 remoteIPLength:(unsigned int *)a6;
- (int)setBasebandNotificationStreamParamatersForSocket:(int *)a3 packetType:(int *)a4 remoteIP:(sockaddr_storage *)a5 remoteIPLength:(unsigned int *)a6;
- (int)setRemoteAddress:(id)a3 remoteRTCPPort:(int)a4;
- (int)setVideoRTCPStreamParamatersForSocket:(int *)a3 packetType:(int *)a4 remoteIP:(sockaddr_storage *)a5 remoteIPLength:(unsigned int *)a6;
- (int)setVideoRTPStreamParamatersForSocket:(int *)a3 packetType:(int *)a4 remoteIP:(sockaddr_storage *)a5 remoteIPLength:(unsigned int *)a6;
- (int)updateTransportStream:(OpaqueVCTransportStream *)a3;
- (tagVCNWConnectionMonitor)createNWMonitor;
- (unsigned)networkMTU;
- (void)addNetworkAssertion;
- (void)dealloc;
- (void)initializeInterfaceTypeWithSocket:(int)a3;
- (void)removeNetworkAssertion;
- (void)start;
- (void)stop;
@end

@implementation VCTransportSessionSocket

- (VCTransportSessionSocket)initWithSocketDictionary:(id)a3 notificationHandler:(void *)a4 eventHandler:(void *)a5 handlerQueue:(id)a6 context:(void *)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionSocket initWithSocketDictionary:notificationHandler:eventHandler:handlerQueue:context:]();
      }
    }
    v18 = 0;
    goto LABEL_8;
  }
  uint64_t v13 = xpc_dictionary_dup_fd(a3, "avcKeySharedSocket");
  if (v13 == -1)
  {
    uint64_t v14 = xpc_dictionary_dup_fd(a3, "avcKeyRTPSocket");
    uint64_t v16 = xpc_dictionary_dup_fd(a3, "avcKeyRTCPSocket");
    if (v16 == -1)
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionSocket initWithSocketDictionary:notificationHandler:eventHandler:handlerQueue:context:]();
        }
      }
      v18 = 0;
      uint64_t v15 = 0xFFFFFFFFLL;
      goto LABEL_10;
    }
    uint64_t v15 = v16;
    if (v14 == -1)
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionSocket initWithSocketDictionary:notificationHandler:eventHandler:handlerQueue:context:]();
        }
      }
      v18 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0xFFFFFFFFLL;
  }
  v17 = [(VCTransportSessionSocket *)self initWithRTPSocket:v14 RTCPSocket:v15 notificationHandler:a4 eventHandler:a5 handlerQueue:a6 context:a7];
  if (v17)
  {
    v18 = v17;
LABEL_8:
    uint64_t v15 = 0xFFFFFFFFLL;
LABEL_9:
    uint64_t v14 = 0xFFFFFFFFLL;
    goto LABEL_10;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      int v22 = 136316162;
      uint64_t v23 = v20;
      __int16 v24 = 2080;
      v25 = "-[VCTransportSessionSocket initWithSocketDictionary:notificationHandler:eventHandler:handlerQueue:context:]";
      __int16 v26 = 1024;
      int v27 = 54;
      __int16 v28 = 1024;
      int v29 = v14;
      __int16 v30 = 1024;
      int v31 = v15;
      _os_log_error_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d initWithRTPSocket:%d RTCPSocket:%d failed", (uint8_t *)&v22, 0x28u);
    }
  }
  v18 = 0;
LABEL_10:
  VCCloseSocketIfValid(v14);
  VCCloseSocketIfValid(v15);
  return v18;
}

- (VCTransportSessionSocket)initWithRTPSocket:(int)a3 RTCPSocket:(int)a4
{
  return [(VCTransportSessionSocket *)self initWithRTPSocket:*(void *)&a3 RTCPSocket:*(void *)&a4 notificationHandler:0 eventHandler:0 handlerQueue:0 context:0];
}

- (VCTransportSessionSocket)initWithSharedSocket:(int)a3
{
  return [(VCTransportSessionSocket *)self initWithRTPSocket:*(void *)&a3 RTCPSocket:0xFFFFFFFFLL];
}

- (VCTransportSessionSocket)initWithRTPSocket:(int)a3 RTCPSocket:(int)a4 notificationHandler:(void *)a5 eventHandler:(void *)a6 handlerQueue:(id)a7 context:(void *)a8
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 == -1)
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:]();
      }
    }
    return 0;
  }
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)VCTransportSessionSocket;
  v10 = [(VCTransportSession *)&v13 initWithNotificationQueue:0 reportingAgent:0 notificationHandler:a5 eventHandler:a6 handlerQueue:a7 context:a8];
  v11 = v10;
  if (v10)
  {
    v10->_rtcpVFD = -1;
    v10->_rtpVFD = -1;
    if (v8 == -1) {
      v10->_isSharedSocket = 1;
    }
    if (-[VCTransportSessionSocket createVFD:realSocket:sockAddr:length:isUsable:](v10, "createVFD:realSocket:sockAddr:length:isUsable:"))
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:].cold.4();
        }
      }
    }
    else if (!v11->_isSharedSocket {
           && [(VCTransportSessionSocket *)v11 createVFD:&v11->_rtcpVFD realSocket:v8 sockAddr:&v11->_rtcpIPPort length:&v11->_rtcpIPPortLength isUsable:&v11->_isRTCPUsable])
    }
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:]();
        }
      }
    }
    else
    {
      if (([(VCTransportSessionSocket *)v11 initializeNetworkInfoWithSocket:v9] & 0x80000000) == 0)
      {
        [(VCTransportSessionSocket *)v11 initializeInterfaceTypeWithSocket:v9];
        return v11;
      }

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:]();
        }
      }
    }
    return 0;
  }
  return v11;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  VCCloseVFDIfValid(self->_rtpVFD);
  VCCloseVFDIfValid(self->_rtcpVFD);

  v3.receiver = self;
  v3.super_class = (Class)VCTransportSessionSocket;
  [(VCTransportSession *)&v3 dealloc];
}

- (int)createVFD:(int *)a3 realSocket:(int)a4 sockAddr:(sockaddr_storage *)a5 length:(unsigned int *)a6 isUsable:(BOOL *)a7
{
  *a7 = 0;
  *a3 = VTP_SocketWithRealSocket(2, 2, 17, a4);
  if (self->_rtpVFD != -1)
  {
    *a6 = 128;
    if (getpeername(a4, (sockaddr *)a5, a6) == -1)
    {
      *a6 = 16;
      *(void *)&a5->ss_len = 0;
      a5->__ss_align = 0;
      if (VTP_SetSourceDestinationWithIPPort(*a3) != -1) {
        return 0;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionSocket createVFD:realSocket:sockAddr:length:isUsable:]();
        }
      }
    }
    else
    {
      if (VTP_SetSourceDestinationWithIPPort(*a3) != -1)
      {
        int v13 = 0;
        *a7 = 1;
        return v13;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionSocket createVFD:realSocket:sockAddr:length:isUsable:]();
        }
      }
    }
    return -1;
  }
  int v13 = -2144665558;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCTransportSessionSocket createVFD:realSocket:sockAddr:length:isUsable:]();
    }
  }
  return v13;
}

- (id)streams
{
  p_stateLock = &self->super._stateLock;
  pthread_mutex_lock(&self->super._stateLock);
  id v4 = (id)[(NSMutableArray *)self->super._streams copy];
  pthread_mutex_unlock(p_stateLock);
  return v4;
}

- (int)updateTransportStream:(OpaqueVCTransportStream *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v15 = 0;
  uint64_t CMBaseObject = VCPacketFilterGetCMBaseObject(a3, a2);
  uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = *(uint64_t (**)(uint64_t, __CFString *, void, id *))(v6 + 48);
  if (v7)
  {
    int v8 = v7(CMBaseObject, @"UnderlyingVFD", *MEMORY[0x1E4F1CF80], &v15);
    if (!v8)
    {
      int v9 = [v15 intValue];
      int v14 = 0;
      if (VTP_GetPktType(v9, (uint64_t)&v14) == -1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCTransportSessionSocket updateTransportStream:]();
          }
        }
      }
      else
      {
        if (VTP_SetSourceDestinationWithIPPort(v9) != -1)
        {
          int v10 = 0;
          goto LABEL_13;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCTransportSessionSocket updateTransportStream:]();
          }
        }
      }
      int v10 = -1;
      goto LABEL_13;
    }
    int v10 = v8;
  }
  else
  {
    int v10 = -12782;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v17 = v11;
      __int16 v18 = 2080;
      v19 = "-[VCTransportSessionSocket updateTransportStream:]";
      __int16 v20 = 1024;
      int v21 = 149;
      __int16 v22 = 2112;
      uint64_t v23 = @"UnderlyingVFD";
      __int16 v24 = 2112;
      v25 = a3;
      _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d Could not get property '%@' for transport stream '%@'", buf, 0x30u);
    }
  }
LABEL_13:

  return v10;
}

- (int)connectSocket:(int)a3 remoteAddress:(id)a4 storage:(sockaddr_storage *)a5
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    v9[0] = 128;
    int v6 = [a4 getSockaddrStorage:a5 size:v9];
    if (v6)
    {
      int v7 = v6;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionSocket connectSocket:remoteAddress:storage:]();
        }
      }
    }
    else if (VTP_SetSourceDestinationWithIPPort(a3) == -1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionSocket connectSocket:remoteAddress:storage:]();
        }
      }
      return -1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    int v7 = -2144665599;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionSocket connectSocket:remoteAddress:storage:]();
      }
    }
  }
  return v7;
}

- (int)setRemoteAddress:(id)a3 remoteRTCPPort:(int)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->super._stateLock;
  pthread_mutex_lock(&self->super._stateLock);
  if ([(VCNetworkAddress *)self->_remoteAddress isEqual:a3])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E4F47A50];
      int v15 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      remoteAddress = self->_remoteAddress;
      int v22 = 136315906;
      uint64_t v23 = v18;
      __int16 v24 = 2080;
      v25 = "-[VCTransportSessionSocket setRemoteAddress:remoteRTCPPort:]";
      __int16 v26 = 1024;
      int v27 = 191;
      __int16 v28 = 2112;
      int v29 = remoteAddress;
      _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d New configuration matches current one '%@'. Ignoring...", (uint8_t *)&v22, 0x26u);
    }
LABEL_22:
    int v15 = 0;
    goto LABEL_23;
  }

  int v8 = (VCNetworkAddress *)[a3 copy];
  self->_remoteAddress = v8;
  uint64_t rtpVFD = self->_rtpVFD;
  if (rtpVFD != -1)
  {
    int v10 = [(VCTransportSessionSocket *)self connectSocket:rtpVFD remoteAddress:v8 storage:&self->_rtpIPPort];
    if (v10)
    {
      int v15 = v10;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionSocket setRemoteAddress:remoteRTCPPort:]();
        }
      }
      goto LABEL_23;
    }
    self->_rtpIPPortLength = self->_rtpIPPort.ss_len;
    self->_isRTPUsable = 1;
  }
  if (self->_isSharedSocket) {
    goto LABEL_13;
  }
  uint64_t v11 = [(VCNetworkAddress *)self->_remoteAddress port];
  [(VCNetworkAddress *)self->_remoteAddress setPort:(unsigned __int16)([(VCNetworkAddress *)self->_remoteAddress port] + 1)];
  if ((a4 - 1) <= 0xFFFFFFFD) {
    [(VCNetworkAddress *)self->_remoteAddress setPort:(unsigned __int16)a4];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    int v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [(VCNetworkAddress *)self->_remoteAddress port];
      int v22 = 136315906;
      uint64_t v23 = v12;
      __int16 v24 = 2080;
      v25 = "-[VCTransportSessionSocket setRemoteAddress:remoteRTCPPort:]";
      __int16 v26 = 1024;
      int v27 = 206;
      __int16 v28 = 1024;
      LODWORD(v29) = v14;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d RTCP port is set to '%d'", (uint8_t *)&v22, 0x22u);
    }
  }
  int v15 = [(VCTransportSessionSocket *)self connectSocket:self->_rtcpVFD remoteAddress:self->_remoteAddress storage:&self->_rtcpIPPort];
  [(VCNetworkAddress *)self->_remoteAddress setPort:v11];
  if (!v15)
  {
    self->_rtcpIPPortLength = self->_rtcpIPPort.ss_len;
    self->_isRTCPUsable = 1;
LABEL_13:
    unsigned int v16 = [(NSMutableArray *)self->super._streams count] - 1;
    while ((v16 & 0x80000000) == 0)
    {
      int v17 = [(VCTransportSessionSocket *)self updateTransportStream:[(NSMutableArray *)self->super._streams objectAtIndexedSubscript:v16--]];
      if (v17)
      {
        int v15 = v17;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCTransportSessionSocket setRemoteAddress:remoteRTCPPort:]();
          }
        }
        goto LABEL_23;
      }
    }
    goto LABEL_22;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCTransportSessionSocket setRemoteAddress:remoteRTCPPort:]();
    }
  }
LABEL_23:
  pthread_mutex_unlock(p_stateLock);
  return v15;
}

- (int)setAudioRTPStreamParamatersForSocket:(int *)a3 packetType:(int *)a4 remoteIP:(sockaddr_storage *)a5 remoteIPLength:(unsigned int *)a6
{
  *a3 = self->_rtpVFD;
  *a4 = 16;
  long long v6 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[32];
  long long v8 = *(_OWORD *)&self->_rtpIPPort.ss_len;
  long long v7 = *(_OWORD *)self->_rtpIPPort.__ss_pad2;
  *(_OWORD *)&a5->__ss_pad2[16] = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[16];
  *(_OWORD *)&a5->__ss_pad2[32] = v6;
  *(_OWORD *)&a5->ss_len = v8;
  *(_OWORD *)a5->__ss_pad2 = v7;
  long long v9 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[96];
  long long v11 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[48];
  long long v10 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[64];
  *(_OWORD *)&a5->__ss_pad2[80] = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[80];
  *(_OWORD *)&a5->__ss_pad2[96] = v9;
  *(_OWORD *)&a5->__ss_pad2[48] = v11;
  *(_OWORD *)&a5->__ss_pad2[64] = v10;
  *a6 = self->_rtpIPPortLength;
  if (self->_isRTPUsable) {
    return 0;
  }
  else {
    return -2144665536;
  }
}

- (int)setAudioRTCPStreamParamatersForSocket:(int *)a3 packetType:(int *)a4 remoteIP:(sockaddr_storage *)a5 remoteIPLength:(unsigned int *)a6
{
  if (self->_isSharedSocket) {
    long long v6 = &OBJC_IVAR___VCTransportSessionSocket__rtpVFD;
  }
  else {
    long long v6 = &OBJC_IVAR___VCTransportSessionSocket__rtcpVFD;
  }
  *a3 = *(_DWORD *)((char *)&self->super.super.isa + *v6);
  *a4 = 64;
  long long v7 = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[32];
  long long v9 = *(_OWORD *)&self->_rtcpIPPort.ss_len;
  long long v8 = *(_OWORD *)self->_rtcpIPPort.__ss_pad2;
  *(_OWORD *)&a5->__ss_pad2[16] = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[16];
  *(_OWORD *)&a5->__ss_pad2[32] = v7;
  *(_OWORD *)&a5->ss_len = v9;
  *(_OWORD *)a5->__ss_pad2 = v8;
  long long v10 = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[96];
  long long v12 = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[48];
  long long v11 = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[64];
  *(_OWORD *)&a5->__ss_pad2[80] = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[80];
  *(_OWORD *)&a5->__ss_pad2[96] = v10;
  *(_OWORD *)&a5->__ss_pad2[48] = v12;
  *(_OWORD *)&a5->__ss_pad2[64] = v11;
  *a6 = self->_rtcpIPPortLength;
  if (self->_isRTCPUsable) {
    int v13 = 0;
  }
  else {
    int v13 = -2144665536;
  }
  if (self->_isSharedSocket)
  {
    if (self->_isRTPUsable) {
      return 0;
    }
    else {
      return -2144665536;
    }
  }
  return v13;
}

- (int)setVideoRTPStreamParamatersForSocket:(int *)a3 packetType:(int *)a4 remoteIP:(sockaddr_storage *)a5 remoteIPLength:(unsigned int *)a6
{
  *a3 = self->_rtpVFD;
  *a4 = 32;
  long long v6 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[32];
  long long v8 = *(_OWORD *)&self->_rtpIPPort.ss_len;
  long long v7 = *(_OWORD *)self->_rtpIPPort.__ss_pad2;
  *(_OWORD *)&a5->__ss_pad2[16] = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[16];
  *(_OWORD *)&a5->__ss_pad2[32] = v6;
  *(_OWORD *)&a5->ss_len = v8;
  *(_OWORD *)a5->__ss_pad2 = v7;
  long long v9 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[96];
  long long v11 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[48];
  long long v10 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[64];
  *(_OWORD *)&a5->__ss_pad2[80] = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[80];
  *(_OWORD *)&a5->__ss_pad2[96] = v9;
  *(_OWORD *)&a5->__ss_pad2[48] = v11;
  *(_OWORD *)&a5->__ss_pad2[64] = v10;
  *a6 = self->_rtpIPPortLength;
  if (self->_isRTPUsable) {
    return 0;
  }
  else {
    return -2144665536;
  }
}

- (int)setVideoRTCPStreamParamatersForSocket:(int *)a3 packetType:(int *)a4 remoteIP:(sockaddr_storage *)a5 remoteIPLength:(unsigned int *)a6
{
  if (self->_isSharedSocket) {
    long long v6 = &OBJC_IVAR___VCTransportSessionSocket__rtpVFD;
  }
  else {
    long long v6 = &OBJC_IVAR___VCTransportSessionSocket__rtcpVFD;
  }
  *a3 = *(_DWORD *)((char *)&self->super.super.isa + *v6);
  *a4 = 128;
  long long v7 = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[32];
  long long v9 = *(_OWORD *)&self->_rtcpIPPort.ss_len;
  long long v8 = *(_OWORD *)self->_rtcpIPPort.__ss_pad2;
  *(_OWORD *)&a5->__ss_pad2[16] = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[16];
  *(_OWORD *)&a5->__ss_pad2[32] = v7;
  *(_OWORD *)&a5->ss_len = v9;
  *(_OWORD *)a5->__ss_pad2 = v8;
  long long v10 = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[96];
  long long v12 = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[48];
  long long v11 = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[64];
  *(_OWORD *)&a5->__ss_pad2[80] = *(_OWORD *)&self->_rtcpIPPort.__ss_pad2[80];
  *(_OWORD *)&a5->__ss_pad2[96] = v10;
  *(_OWORD *)&a5->__ss_pad2[48] = v12;
  *(_OWORD *)&a5->__ss_pad2[64] = v11;
  *a6 = self->_rtcpIPPortLength;
  if (self->_isRTCPUsable) {
    int v13 = 0;
  }
  else {
    int v13 = -2144665536;
  }
  if (self->_isSharedSocket)
  {
    if (self->_isRTPUsable) {
      return 0;
    }
    else {
      return -2144665536;
    }
  }
  return v13;
}

- (int)setBasebandNotificationStreamParamatersForSocket:(int *)a3 packetType:(int *)a4 remoteIP:(sockaddr_storage *)a5 remoteIPLength:(unsigned int *)a6
{
  *a3 = self->_rtpVFD;
  *a4 = 256;
  long long v6 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[32];
  long long v8 = *(_OWORD *)&self->_rtpIPPort.ss_len;
  long long v7 = *(_OWORD *)self->_rtpIPPort.__ss_pad2;
  *(_OWORD *)&a5->__ss_pad2[16] = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[16];
  *(_OWORD *)&a5->__ss_pad2[32] = v6;
  *(_OWORD *)&a5->ss_len = v8;
  *(_OWORD *)a5->__ss_pad2 = v7;
  long long v9 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[96];
  long long v11 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[48];
  long long v10 = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[64];
  *(_OWORD *)&a5->__ss_pad2[80] = *(_OWORD *)&self->_rtpIPPort.__ss_pad2[80];
  *(_OWORD *)&a5->__ss_pad2[96] = v9;
  *(_OWORD *)&a5->__ss_pad2[48] = v11;
  *(_OWORD *)&a5->__ss_pad2[64] = v10;
  *a6 = self->_rtpIPPortLength;
  if (self->_isRTPUsable) {
    return 0;
  }
  else {
    return -2144665536;
  }
}

- (int)configureParamatersForStreamType:(unsigned int)a3 socket:(int *)a4 packetType:(int *)a5 remoteIP:(sockaddr_storage *)a6 remoteIPLength:(unsigned int *)a7
{
  switch(a3)
  {
    case 1u:
      int v7 = [(VCTransportSessionSocket *)self setBasebandNotificationStreamParamatersForSocket:a4 packetType:a5 remoteIP:a6 remoteIPLength:a7];
      goto LABEL_13;
    case 3u:
      int v7 = [(VCTransportSessionSocket *)self setAudioRTPStreamParamatersForSocket:a4 packetType:a5 remoteIP:a6 remoteIPLength:a7];
      goto LABEL_13;
    case 4u:
      int v7 = [(VCTransportSessionSocket *)self setAudioRTCPStreamParamatersForSocket:a4 packetType:a5 remoteIP:a6 remoteIPLength:a7];
      goto LABEL_13;
    case 5u:
      int v7 = [(VCTransportSessionSocket *)self setVideoRTPStreamParamatersForSocket:a4 packetType:a5 remoteIP:a6 remoteIPLength:a7];
      goto LABEL_13;
    case 6u:
      int v7 = [(VCTransportSessionSocket *)self setVideoRTCPStreamParamatersForSocket:a4 packetType:a5 remoteIP:a6 remoteIPLength:a7];
LABEL_13:
      int v8 = v7;
      if (!v7) {
        return v8;
      }
      goto LABEL_6;
    default:
      int v8 = -2144665599;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionSocket configureParamatersForStreamType:socket:packetType:remoteIP:remoteIPLength:]();
        }
      }
LABEL_6:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionSocket configureParamatersForStreamType:socket:packetType:remoteIP:remoteIPLength:]();
        }
      }
      return v8;
  }
}

- (int)createAndConfigureVFDForSocket:(int)a3 packetType:(int)a4 remoteIP:(sockaddr_storage *)a5 remoteIPLength:(unsigned int)a6 vfd:(int *)a7
{
  uint64_t v10 = VTP_DuplicateVFD(a3);
  if (v10 == -1)
  {
    int v13 = -2144665558;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionSocket createAndConfigureVFDForSocket:packetType:remoteIP:remoteIPLength:vfd:]();
      }
    }
    goto LABEL_8;
  }
  uint64_t v11 = v10;
  if (self->_isSharedSocket) {
    int v12 = 2;
  }
  else {
    int v12 = 1;
  }
  if (VTP_SetSocketMode(v10, v12) == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionSocket createAndConfigureVFDForSocket:packetType:remoteIP:remoteIPLength:vfd:]();
      }
    }
    goto LABEL_19;
  }
  if (VTP_SetPktType(v11, a4) == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionSocket createAndConfigureVFDForSocket:packetType:remoteIP:remoteIPLength:vfd:]();
      }
    }
LABEL_19:
    int v13 = -1;
    goto LABEL_9;
  }
  int v13 = 0;
  *a7 = v11;
LABEL_8:
  uint64_t v11 = 0xFFFFFFFFLL;
LABEL_9:
  VCCloseVFDIfValid(v11);
  return v13;
}

- (int)createVFD:(int *)a3 forStreamType:(unsigned int)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memset(v14, 0, sizeof(v14));
  unsigned int v12 = -1;
  unsigned int v13 = 0;
  unsigned int v10 = 0;
  unsigned int v11 = -1;
  int v6 = [(VCTransportSessionSocket *)self configureParamatersForStreamType:*(void *)&a4 socket:&v12 packetType:&v10 remoteIP:v14 remoteIPLength:&v13];
  if (v6)
  {
    int v8 = v6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionSocket createVFD:forStreamType:]();
      }
    }
  }
  else
  {
    int v7 = [(VCTransportSessionSocket *)self createAndConfigureVFDForSocket:v12 packetType:v10 remoteIP:v14 remoteIPLength:v13 vfd:&v11];
    if (v7)
    {
      int v8 = v7;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionSocket createVFD:forStreamType:]();
        }
      }
    }
    else if (v11 == -1)
    {
      int v8 = -2144665558;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionSocket createVFD:forStreamType:]();
        }
      }
    }
    else
    {
      int v8 = 0;
      *a3 = v11;
      unsigned int v11 = -1;
    }
  }
  VCCloseVFDIfValid(v11);
  return v8;
}

- (void)start
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    id v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315906;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      int v8 = "-[VCTransportSessionSocket start]";
      __int16 v9 = 1024;
      int v10 = 348;
      __int16 v11 = 2080;
      networkInterfaceName = self->_networkInterfaceName;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Creating NW Connection based on network interface=%s", (uint8_t *)&v5, 0x26u);
    }
  }
  [(VCTransportSession *)self setupNWMonitor];
  [(VCTransportSessionSocket *)self addNetworkAssertion];
  [(VCTransportSession *)self callEventHandlerWithEvent:1 info:0];
}

- (void)stop
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCTransportSession *)self destroyNWMonitor];
  [(VCTransportSessionSocket *)self removeNetworkAssertion];
  v3.receiver = self;
  v3.super_class = (Class)VCTransportSessionSocket;
  [(VCTransportSession *)&v3 stop];
}

- (void)initializeInterfaceTypeWithSocket:(int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int LocalIFFunctionalTypeForBoundSocket = GetLocalIFFunctionalTypeForBoundSocket();
  GetLocalIFNameForBoundSocket();
  switch(LocalIFFunctionalTypeForBoundSocket)
  {
    case 1:
      int v5 = 5;
      goto LABEL_11;
    case 2:
      int v5 = 1;
      goto LABEL_11;
    case 3:
      if (!strcmp(self->_networkInterfaceName, "llw0")) {
        int v5 = 2;
      }
      else {
        int v5 = 3;
      }
      goto LABEL_11;
    case 4:
      int v5 = 4;
LABEL_11:
      self->_networkInterfaceType = v5;
      break;
    default:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        __int16 v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 136315906;
          uint64_t v9 = v6;
          __int16 v10 = 2080;
          __int16 v11 = "-[VCTransportSessionSocket initializeInterfaceTypeWithSocket:]";
          __int16 v12 = 1024;
          int v13 = 384;
          __int16 v14 = 1024;
          int v15 = LocalIFFunctionalTypeForBoundSocket;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Not setting unexpected transport type %d", (uint8_t *)&v8, 0x22u);
        }
      }
      break;
  }
}

- (int)initializeNetworkInfoWithSocket:(int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  *(void *)&v4.sa_len = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v4.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
  sockaddr v16 = v4;
  sockaddr v17 = v4;
  sockaddr v14 = v4;
  sockaddr v15 = v4;
  sockaddr v12 = v4;
  sockaddr v13 = v4;
  sockaddr v10 = v4;
  sockaddr v11 = v4;
  socklen_t v9 = 128;
  if (getsockname(a3, &v10, &v9))
  {
    unsigned int v5 = *__error() | 0xC02B0000;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionSocket initializeNetworkInfoWithSocket:]();
      }
    }
  }
  else
  {
    unsigned int v5 = 0;
    BOOL v6 = v10.sa_family == 30;
    self->_isIPBOOL v6 = v6;
    if (v6) {
      unsigned int v7 = 1280;
    }
    else {
      unsigned int v7 = 1450;
    }
    self->_networkMTU = v7;
  }
  return v5;
}

- (tagVCNWConnectionMonitor)createNWMonitor
{
  v7[5] = *MEMORY[0x1E4F143B8];
  networkInterfaceName = self->_networkInterfaceName;
  isIPBOOL v6 = self->_isIPv6;
  unsigned int v5 = [(VCTransportSession *)self nwMonitorEventHandlerQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__VCTransportSessionSocket_createNWMonitor__block_invoke;
  v7[3] = &unk_1E6DB3DC8;
  v7[4] = self;
  return (tagVCNWConnectionMonitor *)VCNWConnectionMonitor_CreateWithInterfaceName((uint64_t)networkInterfaceName, 16, isIPv6, (uint64_t)v5, (uint64_t)v7);
}

uint64_t __43__VCTransportSessionSocket_createNWMonitor__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setupNWMonitorNotificationHandler];
}

- (void)addNetworkAssertion
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super._stateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__VCTransportSessionSocket_addNetworkAssertion__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

id __47__VCTransportSessionSocket_addNetworkAssertion__block_invoke(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  v3.receiver = v1;
  v3.super_class = (Class)VCTransportSessionSocket;
  return objc_msgSendSuper2(&v3, sel_addNetworkAssertionWithInterfaceType_, [v1 networkInterfaceType]);
}

- (void)removeNetworkAssertion
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super._stateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__VCTransportSessionSocket_removeNetworkAssertion__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

id __50__VCTransportSessionSocket_removeNetworkAssertion__block_invoke(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)VCTransportSessionSocket;
  return objc_msgSendSuper2(&v2, sel_removeNetworkAssertion);
}

- (int)networkInterfaceType
{
  return self->_networkInterfaceType;
}

- (unsigned)networkMTU
{
  return self->_networkMTU;
}

- (BOOL)isIPv6
{
  return self->_isIPv6;
}

- (void)initWithSocketDictionary:notificationHandler:eventHandler:handlerQueue:context:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Parameter 'socketDictionary' may not be NULL", v2, v3, v4, v5, v6);
}

- (void)initWithSocketDictionary:notificationHandler:eventHandler:handlerQueue:context:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d 'rtcpSocket' may not be kVCInvalidSocket for regular mode", v2, v3, v4, v5, v6);
}

- (void)initWithSocketDictionary:notificationHandler:eventHandler:handlerQueue:context:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d 'rtpSocket' may not be kVCInvalidSocket", v2, v3, v4, v5, v6);
}

- (void)initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid RTP socket", v2, v3, v4, v5, v6);
}

- (void)initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d initializeNetworkMTUWithSocket failed with error '%d'", v2, *(const char **)v3, (unint64_t)"-[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:]" >> 16, v4);
}

- (void)initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d _rtcpVFD creation failed with error '%d'", v2, *(const char **)v3, (unint64_t)"-[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:]" >> 16, v4);
}

- (void)initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:.cold.4()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d _rtpVFD creation failed with error '%d'", v2, *(const char **)v3, (unint64_t)"-[VCTransportSessionSocket initWithRTPSocket:RTCPSocket:notificationHandler:eventHandler:handlerQueue:context:]" >> 16, v4);
}

- (void)createVFD:realSocket:sockAddr:length:isUsable:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d vfd creation failed", v2, v3, v4, v5, v6);
}

- (void)createVFD:realSocket:sockAddr:length:isUsable:.cold.2()
{
  __error();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTP_SetSourceDestinationWithIPPort failed with error '%d'", v2, v3, v4, v5, v6);
}

- (void)createVFD:realSocket:sockAddr:length:isUsable:.cold.3()
{
  __error();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTP_SetSourceDestinationWithIPPort failed with error '%d'", v2, v3, v4, v5, v6);
}

- (void)updateTransportStream:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTP_GetPktType failed", v2, v3, v4, v5, v6);
}

- (void)updateTransportStream:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTP_SetSourceDestinationWithIPPort failed", v2, v3, v4, v5, v6);
}

- (void)connectSocket:remoteAddress:storage:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Parameter 'address' must not be NULL", v2, v3, v4, v5, v6);
}

- (void)connectSocket:remoteAddress:storage:.cold.2()
{
  __error();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d connect failed with error '%d'", v2, v3, v4, v5, v6);
}

- (void)connectSocket:remoteAddress:storage:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCTransportSessionSocket connectSocket:remoteAddress:storage:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d getSockaddrStorage:size: failed with error '%d'", v2, *(const char **)v3, (unint64_t)"-[VCTransportSessionSocket connectSocket:remoteAddress:storage:]" >> 16, v4);
}

- (void)setRemoteAddress:remoteRTCPPort:.cold.1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "-[VCTransportSessionSocket setRemoteAddress:remoteRTCPPort:]";
  OUTLINED_FUNCTION_3();
  int v4 = 217;
  __int16 v5 = 2112;
  uint64_t v6 = v0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to set up remoteAddress on transport stream '%@'", v2, 0x26u);
}

- (void)setRemoteAddress:remoteRTCPPort:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to set up remoteAddress on rtcpSocket", v2, v3, v4, v5, v6);
}

- (void)setRemoteAddress:remoteRTCPPort:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to set up remoteAddress on rtpSocket", v2, v3, v4, v5, v6);
}

- (void)configureParamatersForStreamType:socket:packetType:remoteIP:remoteIPLength:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCTransportSessionSocket configureParamatersForStreamType:socket:packetType:remoteIP:remoteIPLength:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d sourceDestinationInfo has not been set. streamType=%d", v2, *(const char **)v3, (unint64_t)"-[VCTransportSessionSocket configureParamatersForStreamType:socket:packetType:remoteIP:remoteIPLength:]" >> 16, v4);
}

- (void)configureParamatersForStreamType:socket:packetType:remoteIP:remoteIPLength:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCTransportSessionSocket configureParamatersForStreamType:socket:packetType:remoteIP:remoteIPLength:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid stream type '%d'", v2, *(const char **)v3, (unint64_t)"-[VCTransportSessionSocket configureParamatersForStreamType:socket:packetType:remoteIP:remoteIPLength:]" >> 16, v4);
}

- (void)createAndConfigureVFDForSocket:packetType:remoteIP:remoteIPLength:vfd:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTP socket creation failed", v2, v3, v4, v5, v6);
}

- (void)createAndConfigureVFDForSocket:packetType:remoteIP:remoteIPLength:vfd:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTP_SetSocketMode failed", v2, v3, v4, v5, v6);
}

- (void)createAndConfigureVFDForSocket:packetType:remoteIP:remoteIPLength:vfd:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTP_SetPktType failed", v2, v3, v4, v5, v6);
}

- (void)createVFD:forStreamType:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTP socket creation failed", v2, v3, v4, v5, v6);
}

- (void)createVFD:forStreamType:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to set vfd parameters for socket '%d'", v2, v3, v4, v5);
}

- (void)createVFD:forStreamType:.cold.3()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to configure transport stream parameters for socket '%d'", v2, v3, v4, v5);
}

- (void)initializeNetworkInfoWithSocket:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCTransportSessionSocket initializeNetworkInfoWithSocket:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d getsockname(%d) failed", v2, *(const char **)v3, (unint64_t)"-[VCTransportSessionSocket initializeNetworkInfoWithSocket:]" >> 16, v4);
}

@end