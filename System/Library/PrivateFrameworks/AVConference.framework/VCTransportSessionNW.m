@interface VCTransportSessionNW
- (BOOL)initializeIsIPv6;
- (BOOL)initializeNetworkMTU;
- (BOOL)isIPv6;
- (VCNWConnectionInfo)rtcpConnectionInfo;
- (VCNWConnectionInfo)rtpConnectionInfo;
- (VCTransportSessionNW)initWithRTPNWConnectionID:(id)a3 RTCPNWConnectionID:(id)a4 handlerQueue:(id)a5 context:(void *)a6 notificationHandler:(void *)a7 eventHandler:(void *)a8 isConnectionStartDelayed:(BOOL)a9;
- (int)cancelConnections;
- (int)configureConnectionToReceiveHoplimit:(id)a3;
- (int)createAndSetupConnection:(id)a3;
- (int)createConnections;
- (int)createNWConnection:(id)a3;
- (int)createVFD:(int *)a3 forStreamType:(unsigned int)a4;
- (int)destroyNWConnection:(id *)a3;
- (int)dupRTCPNWConnectionBackingSocket;
- (int)dupRTPNWConnectionBackingSocket;
- (int)dupRTPNWConnectionBackingSocketForNWConnection:(id)a3;
- (int)networkInterfaceType;
- (int)setRemoteAddress:(id)a3 remoteRTCPPort:(int)a4;
- (int)setStateChangeHandlerForConnection:(id)a3 result:(BOOL *)a4;
- (int)setupNWConnection:(id)a3;
- (int)startNWConnection:(id)a3;
- (tagVCNWConnectionMonitor)createNWMonitor;
- (unsigned)networkMTU;
- (void)addNetworkAssertion;
- (void)createConnections;
- (void)dealloc;
- (void)handleStateChanges:(int)a3 error:(id)a4 operationResult:(BOOL *)a5;
- (void)initializeInterfaceType;
- (void)removeNetworkAssertion;
- (void)setRtcpConnectionInfo:(id)a3;
- (void)setRtpConnectionInfo:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation VCTransportSessionNW

- (VCTransportSessionNW)initWithRTPNWConnectionID:(id)a3 RTCPNWConnectionID:(id)a4 handlerQueue:(id)a5 context:(void *)a6 notificationHandler:(void *)a7 eventHandler:(void *)a8 isConnectionStartDelayed:(BOOL)a9
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionNW initWithRTPNWConnectionID:RTCPNWConnectionID:handlerQueue:context:notificationHandler:eventHandler:isConnectionStartDelayed:]();
      }
    }
    return 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)VCTransportSessionNW;
  v11 = [(VCTransportSession *)&v15 initWithNotificationQueue:0 reportingAgent:0 notificationHandler:a7 eventHandler:a8 handlerQueue:a5 context:a6];
  if (v11)
  {
    v11->_startWaitSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    v11->_cancelWaitSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    v11->_isConnectionStartDelayed = a9;
    v12 = (VCNWConnectionInfo *)objc_opt_new();
    v11->_rtpConnectionInfo = v12;
    [(VCNWConnectionInfo *)v12 setConnectionID:a3];
    if (a4)
    {
      v13 = (VCNWConnectionInfo *)objc_opt_new();
      v11->_rtcpConnectionInfo = v13;
      [(VCNWConnectionInfo *)v13 setConnectionID:a4];
    }
    if ([(VCTransportSessionNW *)v11 createConnections] < 0)
    {

      return 0;
    }
  }
  return v11;
}

- (int)createConnections
{
  self->_isSharedConnection = 1;
  int v3 = [(VCTransportSessionNW *)self createAndSetupConnection:self->_rtpConnectionInfo];
  if (v3 < 0)
  {
    int v5 = -2144665596;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionNW createConnections]();
      }
    }
  }
  else
  {
    if (!self->_rtcpConnectionInfo)
    {
      int v5 = v3;
      goto LABEL_6;
    }
    int v4 = -[VCTransportSessionNW createAndSetupConnection:](self, "createAndSetupConnection:");
    if ((v4 & 0x80000000) == 0)
    {
      int v5 = v4;
      self->_isSharedConnection = 0;
LABEL_6:
      [(VCTransportSessionNW *)self initializeNetworkMTU];
      [(VCTransportSessionNW *)self initializeIsIPv6];
      [(VCTransportSessionNW *)self initializeInterfaceType];
      [(VCTransportSession *)self setShouldSetupNWMonitor:1];
      self->_didScheduleReceive = 0;
      return v5;
    }
    int v5 = -2144665596;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionNW createConnections]();
      }
    }
  }
  return v5;
}

- (int)createAndSetupConnection:(id)a3
{
  int v5 = -[VCTransportSessionNW createNWConnection:](self, "createNWConnection:");
  if (v5 < 0)
  {
    int v6 = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionNW createAndSetupConnection:]();
      }
    }
  }
  else
  {
    int v6 = -[VCTransportSessionNW setupNWConnection:](self, "setupNWConnection:", [a3 connection]);
    if (v6 < 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionNW createAndSetupConnection:]();
        }
      }
    }
    else if (!self->_isConnectionStartDelayed)
    {
      int v6 = -[VCTransportSessionNW startNWConnection:](self, "startNWConnection:", [a3 connection]);
      if (v6 < 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionNW createAndSetupConnection:]();
        }
      }
    }
  }
  return v6;
}

- (int)configureConnectionToReceiveHoplimit:(id)a3
{
  if (!a3)
  {
    int v8 = -2144665599;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionNW configureConnectionToReceiveHoplimit:]();
      }
    }
    goto LABEL_15;
  }
  if (![a3 parameters])
  {
    int v8 = -2144665599;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionNW configureConnectionToReceiveHoplimit:]();
      }
    }
LABEL_15:
    nw_protocol_options_t v7 = 0;
    int v5 = 0;
    goto LABEL_6;
  }
  int v4 = nw_parameters_copy_default_protocol_stack((nw_parameters_t)[a3 parameters]);
  if (!v4)
  {
    int v8 = -2144665536;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        -[VCTransportSessionNW configureConnectionToReceiveHoplimit:]();
        nw_protocol_options_t v7 = 0;
        int v5 = 0;
        int v8 = -2144665536;
        goto LABEL_6;
      }
    }
    goto LABEL_15;
  }
  int v5 = v4;
  nw_protocol_options_t v6 = nw_protocol_stack_copy_internet_protocol(v4);
  if (v6)
  {
    nw_protocol_options_t v7 = v6;
    nw_ip_options_set_receive_hop_limit();
    int v8 = 0;
  }
  else
  {
    int v8 = -2144665536;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3
      && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
      -[VCTransportSessionNW configureConnectionToReceiveHoplimit:].cold.4();
      nw_protocol_options_t v7 = 0;
      int v8 = -2144665536;
    }
    else
    {
      nw_protocol_options_t v7 = 0;
    }
  }
LABEL_6:
  nw_release(v7);
  nw_release(v5);
  return v8;
}

- (int)createNWConnection:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    int v8 = -2144665599;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionNW createNWConnection:]();
      }
    }
    goto LABEL_31;
  }
  if ([a3 connectionID])
  {
    int v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDString:", objc_msgSend(a3, "connectionID"));
    if (!v5)
    {
      int v8 = -2144665599;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionNW createNWConnection:].cold.6();
        }
      }
      goto LABEL_31;
    }
    nw_protocol_options_t v6 = v5;
    *(void *)objc_super v15 = 0;
    *(void *)&v15[8] = 0;
    [v5 getUUIDBytes:v15];

    +[VCVTPWrapper connectionContext];
    nw_protocol_options_t v7 = (void *)nw_connection_create_with_client_id();
    if (v7) {
      goto LABEL_5;
    }
LABEL_13:
    int v8 = -2144665596;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        -[VCTransportSessionNW createNWConnection:].cold.4();
        nw_protocol_options_t v7 = 0;
        int v8 = -2144665596;
        goto LABEL_9;
      }
    }
LABEL_31:
    nw_protocol_options_t v7 = 0;
    goto LABEL_9;
  }
  if (![a3 remoteAddress])
  {
    int v8 = -2144665599;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionNW createNWConnection:]();
      }
    }
    goto LABEL_31;
  }
  if (![a3 parameters])
  {
    int v8 = -2144665599;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionNW createNWConnection:]();
      }
    }
    goto LABEL_31;
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "remoteAddress"), "ip"), "cStringUsingEncoding:", 4);
  objc_msgSend((id)objc_msgSend(a3, "remoteAddress"), "port");
  host_with_numeric_port = nw_endpoint_create_host_with_numeric_port();
  nw_protocol_options_t v7 = nw_connection_create(host_with_numeric_port, (nw_parameters_t)[a3 parameters]);
  nw_release(host_with_numeric_port);
  if (!v7) {
    goto LABEL_13;
  }
LABEL_5:
  [a3 setConnection:v7];
  int v8 = [(VCTransportSessionNW *)self configureConnectionToReceiveHoplimit:a3];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v8 < 0)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionNW createNWConnection:].cold.5();
      }
    }
  }
  else if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [a3 remoteAddress];
      *(_DWORD *)objc_super v15 = 136315906;
      *(void *)&v15[4] = v10;
      *(_WORD *)&v15[12] = 2080;
      *(void *)&v15[14] = "-[VCTransportSessionNW createNWConnection:]";
      __int16 v16 = 1024;
      int v17 = 241;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Successfully created NW Connection to endpoint with remoteAddress=%@", v15, 0x26u);
    }
  }
LABEL_9:
  nw_release(v7);
  return v8;
}

- (int)cancelConnections
{
  int result = [(VCTransportSessionNW *)self destroyNWConnection:&self->_rtpConnectionInfo];
  if (self->_rtcpConnectionInfo)
  {
    return -[VCTransportSessionNW destroyNWConnection:](self, "destroyNWConnection:");
  }
  return result;
}

- (int)destroyNWConnection:(id *)a3
{
  if (!a3 || !*a3 || ![*a3 connection]) {
    return 0;
  }
  nw_connection_cancel((nw_connection_t)[*a3 connection]);
  cancelWaitSemaphore = self->_cancelWaitSemaphore;
  dispatch_time_t v6 = dispatch_time(0, 500000000);
  if (dispatch_semaphore_wait(cancelWaitSemaphore, v6))
  {
    int v7 = -2144665577;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionNW destroyNWConnection:]();
      }
    }
  }
  else
  {
    nw_connection_set_state_changed_handler((nw_connection_t)[*a3 connection], 0);

    int v7 = 0;
    *a3 = 0;
  }
  return v7;
}

- (int)setRemoteAddress:(id)a3 remoteRTCPPort:(int)a4
{
  unsigned __int16 v4 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (![a3 isValid])
  {
LABEL_18:
    v13 = 0;
    uint64_t v12 = 0;
    int v15 = 0;
    goto LABEL_14;
  }
  BOOL v7 = [(VCNWConnectionInfo *)self->_rtpConnectionInfo isSameRemoteAddress:a3];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v7)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        v23 = [(VCNWConnectionInfo *)self->_rtpConnectionInfo remoteAddress];
        int v24 = 136316162;
        uint64_t v25 = v21;
        __int16 v26 = 2080;
        v27 = "-[VCTransportSessionNW setRemoteAddress:remoteRTCPPort:]";
        __int16 v28 = 1024;
        int v29 = 286;
        __int16 v30 = 2112;
        v31 = v23;
        __int16 v32 = 2112;
        id v33 = a3;
        _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remote IP Address did not change. current=%@, new=%@", (uint8_t *)&v24, 0x30u);
      }
    }
    goto LABEL_18;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(VCNWConnectionInfo *)self->_rtpConnectionInfo remoteAddress];
      int v24 = 136316162;
      uint64_t v25 = v9;
      __int16 v26 = 2080;
      v27 = "-[VCTransportSessionNW setRemoteAddress:remoteRTCPPort:]";
      __int16 v28 = 1024;
      int v29 = 288;
      __int16 v30 = 2112;
      v31 = v11;
      __int16 v32 = 2112;
      id v33 = a3;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Updating NW connections, oldRtpRemoteAddress=%@, newRtpRemoteAddress=%@", (uint8_t *)&v24, 0x30u);
    }
  }
  uint64_t v12 = objc_opt_new();
  objc_msgSend(v12, "setParameters:", -[VCNWConnectionInfo parameters](self->_rtpConnectionInfo, "parameters"));
  [v12 setRemoteAddress:a3];
  if (self->_isSharedConnection)
  {
    v13 = 0;
  }
  else
  {
    v13 = objc_opt_new();
    objc_msgSend(v13, "setParameters:", -[VCNWConnectionInfo parameters](self->_rtcpConnectionInfo, "parameters"));
    [v13 setRemoteAddress:a3];
    objc_msgSend((id)objc_msgSend(v13, "remoteAddress"), "setPort:", v4);
  }
  int v14 = [(VCTransportSessionNW *)self cancelConnections];
  if (v14 < 0)
  {
    int v15 = v14;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionNW setRemoteAddress:remoteRTCPPort:]();
      }
    }
  }
  else
  {
    [(VCTransportSessionNW *)self setRtpConnectionInfo:v12];
    [(VCTransportSessionNW *)self setRtcpConnectionInfo:v13];
    int v15 = [(VCTransportSessionNW *)self createConnections];
    int v16 = VRTraceGetErrorLogLevelForModule();
    if (v15 < 0)
    {
      if (v16 >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionNW setRemoteAddress:remoteRTCPPort:]();
        }
      }
    }
    else if (v16 >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      __int16 v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [(VCNWConnectionInfo *)self->_rtpConnectionInfo remoteAddress];
        int v24 = 136315906;
        uint64_t v25 = v17;
        __int16 v26 = 2080;
        v27 = "-[VCTransportSessionNW setRemoteAddress:remoteRTCPPort:]";
        __int16 v28 = 1024;
        int v29 = 311;
        __int16 v30 = 2112;
        v31 = v19;
        _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Successfully updated NW connections, newRtpRemoteAddress=%@", (uint8_t *)&v24, 0x26u);
      }
    }
  }
LABEL_14:

  return v15;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if ([(VCNWConnectionInfo *)self->_rtpConnectionInfo connection])
  {
    nw_connection_cancel((nw_connection_t)[(VCNWConnectionInfo *)self->_rtpConnectionInfo connection]);
    nw_connection_set_state_changed_handler((nw_connection_t)[(VCNWConnectionInfo *)self->_rtpConnectionInfo connection], 0);
  }
  if ([(VCNWConnectionInfo *)self->_rtcpConnectionInfo connection])
  {
    nw_connection_cancel((nw_connection_t)[(VCNWConnectionInfo *)self->_rtcpConnectionInfo connection]);
    nw_connection_set_state_changed_handler((nw_connection_t)[(VCNWConnectionInfo *)self->_rtcpConnectionInfo connection], 0);
  }

  v3.receiver = self;
  v3.super_class = (Class)VCTransportSessionNW;
  [(VCTransportSession *)&v3 dealloc];
}

- (void)handleStateChanges:(int)a3 error:(id)a4 operationResult:(BOOL *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a4 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      int v12 = 136316162;
      uint64_t v13 = v9;
      __int16 v14 = 2080;
      int v15 = "-[VCTransportSessionNW handleStateChanges:error:operationResult:]";
      __int16 v16 = 1024;
      int v17 = 337;
      __int16 v18 = 2112;
      id v19 = a4;
      __int16 v20 = 1024;
      int v21 = a3;
      _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d Get error %@ from nw connection with state: %d!", (uint8_t *)&v12, 0x2Cu);
    }
  }
  if (a3 == 5)
  {
    v11 = &OBJC_IVAR___VCTransportSessionNW__cancelWaitSemaphore;
  }
  else
  {
    if (a3 != 4)
    {
      if (a3 != 3) {
        return;
      }
      *a5 = 1;
    }
    v11 = &OBJC_IVAR___VCTransportSessionNW__startWaitSemaphore;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)((char *)&self->super.super.isa + *v11));
}

- (int)setStateChangeHandlerForConnection:(id)a3 result:(BOOL *)a4
{
  handler[6] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t v6 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __66__VCTransportSessionNW_setStateChangeHandlerForConnection_result___block_invoke;
    handler[3] = &unk_1E6DB4DC0;
    handler[4] = v6;
    handler[5] = a4;
    nw_connection_set_state_changed_handler((nw_connection_t)a3, handler);
    return 0;
  }
  else
  {
    int v7 = -2144665599;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionNW setStateChangeHandlerForConnection:result:]();
      }
    }
  }
  return v7;
}

void __66__VCTransportSessionNW_setStateChangeHandlerForConnection_result___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315906;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      uint64_t v13 = "-[VCTransportSessionNW setStateChangeHandlerForConnection:result:]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 358;
      __int16 v16 = 1024;
      int v17 = a2;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Get nw connection state %d", (uint8_t *)&v10, 0x22u);
    }
  }
  int v8 = (void *)MEMORY[0x1E4E56580]([*(id *)(a1 + 32) weak]);
  if (v8)
  {
    uint64_t v9 = v8;
    [v8 handleStateChanges:a2 error:a3 operationResult:*(void *)(a1 + 40)];
    CFRelease(v9);
  }
}

- (int)setupNWConnection:(id)a3
{
  p_connectionStartDidSucceed = &self->_connectionStartDidSucceed;
  self->_connectionStartDidSucceed = 0;
  nw_connection_set_queue((nw_connection_t)a3, (dispatch_queue_t)+[VCVTPWrapper targetQueue]);
  int v6 = [(VCTransportSessionNW *)self setStateChangeHandlerForConnection:a3 result:p_connectionStartDidSucceed];
  if (v6 < 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCTransportSessionNW setupNWConnection:]();
    }
  }
  return v6;
}

- (int)startNWConnection:(id)a3
{
  nw_connection_start((nw_connection_t)a3);
  startWaitSemaphore = self->_startWaitSemaphore;
  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(startWaitSemaphore, v5))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    {
      return -2144665577;
    }
    else
    {
      VRTraceErrorLogLevelToCSTR();
      int v6 = -2144665577;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionNW startNWConnection:]();
      }
    }
  }
  else if (self->_connectionStartDidSucceed)
  {
    return 0;
  }
  else
  {
    int v6 = -2144665596;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionNW startNWConnection:]();
      }
    }
  }
  return v6;
}

- (int)createVFD:(int *)a3 forStreamType:(unsigned int)a4
{
  if (!a3)
  {
    unsigned int v8 = -2144665599;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionNW createVFD:forStreamType:]();
      }
    }
    goto LABEL_24;
  }
  uint64_t v4 = *(void *)&a4;
  if (a4 > 6)
  {
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  else if (((1 << a4) & 0x2E) != 0)
  {
    uint64_t v7 = VTP_SocketWithNWConnection(2u, 17, [(VCNWConnectionInfo *)self->_rtpConnectionInfo connection]);
    if (v7 == -1)
    {
      unsigned int v8 = *__error() | 0xC02B0000;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionNW createVFD:forStreamType:].cold.5();
        }
      }
      goto LABEL_24;
    }
  }
  else
  {
    if (((1 << a4) & 0x50) == 0)
    {
      unsigned int v8 = -2144665599;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionNW createVFD:forStreamType:].cold.4();
        }
      }
      goto LABEL_24;
    }
    if (self->_isSharedConnection) {
      uint64_t v9 = &OBJC_IVAR___VCTransportSessionNW__rtpConnectionInfo;
    }
    else {
      uint64_t v9 = &OBJC_IVAR___VCTransportSessionNW__rtcpConnectionInfo;
    }
    uint64_t v7 = VTP_SocketWithNWConnection(2u, 17, [*(id *)((char *)&self->super.super.isa + *v9) connection]);
    if (v7 == -1)
    {
      unsigned int v8 = *__error() | 0xC02B0000;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionNW createVFD:forStreamType:].cold.6();
        }
      }
      goto LABEL_24;
    }
  }
  if (self->_isSharedConnection) {
    int v10 = 2;
  }
  else {
    int v10 = 1;
  }
  if (VTP_SetSocketMode(v7, v10) == -1)
  {
    unsigned int v8 = *__error() | 0xC02B0000;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionNW createVFD:forStreamType:]();
      }
    }
  }
  else
  {
    int v11 = +[VCTransportSession vtpPacketTypeForStreamType:v4];
    if (!v11)
    {
      unsigned int v8 = -2144665599;
      goto LABEL_25;
    }
    if (VTP_SetPktType(v7, v11) != -1)
    {
      unsigned int v8 = 0;
      *a3 = v7;
LABEL_24:
      uint64_t v7 = 0xFFFFFFFFLL;
      goto LABEL_25;
    }
    unsigned int v8 = *__error() | 0xC02B0000;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionNW createVFD:forStreamType:]();
      }
    }
  }
LABEL_25:
  VCCloseVFDIfValid(v7);
  return v8;
}

- (void)start
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to start RTP connection", v2, v3, v4, v5, v6);
}

- (void)stop
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCTransportSession *)self destroyNWMonitor];
  [(VCTransportSessionNW *)self removeNetworkAssertion];
  v3.receiver = self;
  v3.super_class = (Class)VCTransportSessionNW;
  [(VCTransportSession *)&v3 stop];
}

- (void)addNetworkAssertion
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super._stateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__VCTransportSessionNW_addNetworkAssertion__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

id __43__VCTransportSessionNW_addNetworkAssertion__block_invoke(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  v3.receiver = v1;
  v3.super_class = (Class)VCTransportSessionNW;
  return objc_msgSendSuper2(&v3, sel_addNetworkAssertionWithInterfaceType_, [v1 networkInterfaceType]);
}

- (void)removeNetworkAssertion
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->super._stateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__VCTransportSessionNW_removeNetworkAssertion__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

id __46__VCTransportSessionNW_removeNetworkAssertion__block_invoke(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)VCTransportSessionNW;
  return objc_msgSendSuper2(&v2, sel_removeNetworkAssertion);
}

- (tagVCNWConnectionMonitor)createNWMonitor
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = [(VCNWConnectionInfo *)self->_rtpConnectionInfo connection];
  return (tagVCNWConnectionMonitor *)VCNWConnectionMonitor_Create(v3);
}

- (int)dupRTPNWConnectionBackingSocket
{
  uint64_t v3 = [(VCNWConnectionInfo *)self->_rtpConnectionInfo connection];

  return [(VCTransportSessionNW *)self dupRTPNWConnectionBackingSocketForNWConnection:v3];
}

- (int)dupRTCPNWConnectionBackingSocket
{
  uint64_t v3 = [(VCNWConnectionInfo *)self->_rtcpConnectionInfo connection];

  return [(VCTransportSessionNW *)self dupRTPNWConnectionBackingSocketForNWConnection:v3];
}

- (int)dupRTPNWConnectionBackingSocketForNWConnection:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionNW dupRTPNWConnectionBackingSocketForNWConnection:]();
      }
    }
    return -1;
  }
  int connected_socket = nw_connection_get_connected_socket();
  if (connected_socket == -1) {
    return -1;
  }
  int v5 = connected_socket;
  int v6 = dup(connected_socket);
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v6 == -1)
  {
    if (ErrorLogLevelForModule >= 5)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      int v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136316162;
        uint64_t v14 = v10;
        __int16 v15 = 2080;
        __int16 v16 = "-[VCTransportSessionNW dupRTPNWConnectionBackingSocketForNWConnection:]";
        __int16 v17 = 1024;
        int v18 = 514;
        __int16 v19 = 2048;
        id v20 = a3;
        __int16 v21 = 1024;
        int v22 = v5;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d nw_connection %p is backed by socket %d. Failed to dup", (uint8_t *)&v13, 0x2Cu);
      }
    }
    return -1;
  }
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136316418;
      uint64_t v14 = v8;
      __int16 v15 = 2080;
      __int16 v16 = "-[VCTransportSessionNW dupRTPNWConnectionBackingSocketForNWConnection:]";
      __int16 v17 = 1024;
      int v18 = 512;
      __int16 v19 = 2048;
      id v20 = a3;
      __int16 v21 = 1024;
      int v22 = v5;
      __int16 v23 = 1024;
      int v24 = v6;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d nw_connection %p is backed by socket %d duped to %d", (uint8_t *)&v13, 0x32u);
    }
  }
  return v6;
}

- (void)initializeInterfaceType
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![(VCNWConnectionInfo *)self->_rtpConnectionInfo connection])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_12;
    }
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = v5;
    __int16 v12 = 2080;
    int v13 = "-[VCTransportSessionNW initializeInterfaceType]";
    __int16 v14 = 1024;
    int v15 = 523;
    uint64_t v7 = " [%s] %s:%d connection must not be nil";
    goto LABEL_11;
  }
  uint64_t v3 = nw_connection_copy_current_path((nw_connection_t)[(VCNWConnectionInfo *)self->_rtpConnectionInfo connection]);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_12;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = v8;
    __int16 v12 = 2080;
    int v13 = "-[VCTransportSessionNW initializeInterfaceType]";
    __int16 v14 = 1024;
    int v15 = 525;
    uint64_t v7 = " [%s] %s:%d path must not be nil";
LABEL_11:
    _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 0x1Cu);
LABEL_12:
    uint64_t v4 = 0;
    goto LABEL_4;
  }
  uint64_t v4 = v3;
  enumerate_block[0] = MEMORY[0x1E4F143A8];
  enumerate_block[1] = 3221225472;
  enumerate_block[2] = __47__VCTransportSessionNW_initializeInterfaceType__block_invoke;
  enumerate_block[3] = &unk_1E6DB4DE8;
  enumerate_block[4] = self;
  nw_path_enumerate_interfaces(v3, enumerate_block);
LABEL_4:
  nw_release(v4);
}

uint64_t __47__VCTransportSessionNW_initializeInterfaceType__block_invoke(uint64_t a1, nw_interface_t interface)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  nw_interface_type_t type = nw_interface_get_type(interface);
  if (type == nw_interface_type_loopback)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 5;
    goto LABEL_9;
  }
  nw_interface_type_t v5 = type;
  if (type == nw_interface_type_wired)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 1;
    goto LABEL_9;
  }
  if (type == nw_interface_type_wifi)
  {
    subnw_interface_type_t type = nw_interface_get_subtype();
    if (subtype == 1001)
    {
      name = nw_interface_get_name(interface);
      int v15 = strcmp(name, "llw0");
      uint64_t v8 = *(void *)(a1 + 32);
      if (v15) {
        int v9 = 3;
      }
      else {
        int v9 = 2;
      }
      goto LABEL_9;
    }
    nw_interface_type_t v7 = subtype;
    if (subtype == 1002)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 4;
LABEL_9:
      *(_DWORD *)(v8 + 252) = v9;
      return 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      __int16 v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315906;
        uint64_t v18 = v16;
        __int16 v19 = 2080;
        id v20 = "-[VCTransportSessionNW initializeInterfaceType]_block_invoke";
        __int16 v21 = 1024;
        int v22 = 541;
        __int16 v23 = 1024;
        nw_interface_type_t v24 = v7;
        int v13 = " [%s] %s:%d Not setting unexpected wifi nw_interface_subtype_t %d";
        goto LABEL_19;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    __int16 v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315906;
      uint64_t v18 = v11;
      __int16 v19 = 2080;
      id v20 = "-[VCTransportSessionNW initializeInterfaceType]_block_invoke";
      __int16 v21 = 1024;
      int v22 = 548;
      __int16 v23 = 1024;
      nw_interface_type_t v24 = v5;
      int v13 = " [%s] %s:%d Not setting unexpected nw_interface_type_t %d";
LABEL_19:
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, 0x22u);
    }
  }
  return 0;
}

- (BOOL)initializeNetworkMTU
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  nw_path_t v3 = nw_connection_copy_current_path((nw_connection_t)[(VCNWConnectionInfo *)self->_rtpConnectionInfo connection]);
  if (v3)
  {
    self->_networkMTU = nw_path_get_mtu();
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCTransportSessionNW initializeNetworkMTU]";
      __int16 v11 = 1024;
      int v12 = 561;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d nw_connection_copy_current_path failed", (uint8_t *)&v7, 0x1Cu);
    }
  }
  nw_release(v3);
  return v3 != 0;
}

- (BOOL)initializeIsIPv6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  nw_path_t v3 = nw_connection_copy_endpoint((nw_connection_t)[(VCNWConnectionInfo *)self->_rtpConnectionInfo connection]);
  uint64_t v4 = v3;
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      __int16 v9 = *MEMORY[0x1E4F47A50];
      BOOL v6 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_4;
      }
      int v12 = 136315650;
      uint64_t v13 = v8;
      __int16 v14 = 2080;
      int v15 = "-[VCTransportSessionNW initializeIsIPv6]";
      __int16 v16 = 1024;
      int v17 = 572;
      uint64_t v10 = " [%s] %s:%d nw_connection_copy_endpoint failed";
      goto LABEL_11;
    }
LABEL_12:
    BOOL v6 = 0;
    goto LABEL_4;
  }
  address = nw_endpoint_get_address(v3);
  if (!address)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      __int16 v9 = *MEMORY[0x1E4F47A50];
      BOOL v6 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_4;
      }
      int v12 = 136315650;
      uint64_t v13 = v11;
      __int16 v14 = 2080;
      int v15 = "-[VCTransportSessionNW initializeIsIPv6]";
      __int16 v16 = 1024;
      int v17 = 575;
      uint64_t v10 = " [%s] %s:%d nw_endpoint_get_address failed";
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0x1Cu);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  self->_isIPBOOL v6 = address->sa_family == 30;
  BOOL v6 = 1;
LABEL_4:
  nw_release(v4);
  return v6;
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

- (VCNWConnectionInfo)rtpConnectionInfo
{
  return self->_rtpConnectionInfo;
}

- (void)setRtpConnectionInfo:(id)a3
{
}

- (VCNWConnectionInfo)rtcpConnectionInfo
{
  return self->_rtcpConnectionInfo;
}

- (void)setRtcpConnectionInfo:(id)a3
{
}

- (void)initWithRTPNWConnectionID:RTCPNWConnectionID:handlerQueue:context:notificationHandler:eventHandler:isConnectionStartDelayed:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Parameter 'connectionID' may not be NULL", v2, v3, v4, v5, v6);
}

- (void)createConnections
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create nw_connection for RTCP", v2, v3, v4, v5, v6);
}

- (void)createAndSetupConnection:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create nw_connection", v2, v3, v4, v5, v6);
}

- (void)createAndSetupConnection:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup connection", v2, v3, v4, v5, v6);
}

- (void)createAndSetupConnection:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to start connection", v2, v3, v4, v5, v6);
}

- (void)configureConnectionToReceiveHoplimit:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d nwConnectionInfo is nil", v2, v3, v4, v5, v6);
}

- (void)configureConnectionToReceiveHoplimit:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d network parameters is nil", v2, v3, v4, v5, v6);
}

- (void)configureConnectionToReceiveHoplimit:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d network protocolStack is nil", v2, v3, v4, v5, v6);
}

- (void)configureConnectionToReceiveHoplimit:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d network protocol ipOptions is nil", v2, v3, v4, v5, v6);
}

- (void)createNWConnection:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d nwConnectionInfo is invalid", v2, v3, v4, v5, v6);
}

- (void)createNWConnection:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d remoteAddress is invalid", v2, v3, v4, v5, v6);
}

- (void)createNWConnection:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d parameters is invalid", v2, v3, v4, v5, v6);
}

- (void)createNWConnection:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create nwConnection", v2, v3, v4, v5, v6);
}

- (void)createNWConnection:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to configure connection to receive hoplimit", v2, v3, v4, v5, v6);
}

- (void)createNWConnection:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create connectionClientID", v2, v3, v4, v5, v6);
}

- (void)destroyNWConnection:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d nw_connection cancel timeout", v2, v3, v4, v5, v6);
}

- (void)setRemoteAddress:remoteRTCPPort:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed cancelling the NW connections", v2, v3, v4, v5, v6);
}

- (void)setRemoteAddress:remoteRTCPPort:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed creating the NW connections", v2, v3, v4, v5, v6);
}

- (void)setStateChangeHandlerForConnection:result:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Parameter 'operationResult' must be non-nil", v2, v3, v4, v5, v6);
}

- (void)setupNWConnection:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  int v3 = 375;
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to set handlers for NWConnection for connection=%@", v2, 0x26u);
}

- (void)startNWConnection:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d nw_connection start failed", v2, v3, v4, v5, v6);
}

- (void)startNWConnection:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d nw_connection ready timeout", v2, v3, v4, v5, v6);
}

- (void)createVFD:forStreamType:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d NULL vfd", v2, v3, v4, v5, v6);
}

- (void)createVFD:forStreamType:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTP_SetSocketMode failed %x", v2, v3, v4, 417);
}

- (void)createVFD:forStreamType:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTP_SetPktType failed %x", v2, v3, v4, 423);
}

- (void)createVFD:forStreamType:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid Stream Type", v2, v3, v4, v5, v6);
}

- (void)createVFD:forStreamType:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTP socket creation failed for RTP", v2, v3, v4, v5, v6);
}

- (void)createVFD:forStreamType:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VTP socket creation failed for RTCP", v2, v3, v4, v5, v6);
}

- (void)dupRTPNWConnectionBackingSocketForNWConnection:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d connection must not be nil", v2, v3, v4, v5, v6);
}

@end