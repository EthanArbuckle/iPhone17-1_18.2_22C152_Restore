@interface GKAsyncSocketInternal
- (BOOL)setupSourcesWithSocket:(int)a3 receiveEventHandler:(id)a4 sendEventHandler:(id)a5;
- (GKAsyncSocketInternal)init;
- (OS_dispatch_queue)targetQueue;
- (id)connectedHandler;
- (id)receiveDataHandler;
- (id)socketName;
- (void)closeConnectionNow;
- (void)dealloc;
- (void)invalidate;
- (void)receiveData;
- (void)sendData;
- (void)sendData:(id)a3 withCompletionHandler:(id)a4;
- (void)setConnectedHandler:(id)a3;
- (void)setReceiveDataHandler:(id)a3;
- (void)setSocketName:(id)a3;
- (void)setTargetQueue:(id)a3;
- (void)tcpAttachSocketDescriptor:(int)a3;
- (void)tcpConnectSockAddr:(const sockaddr *)a3 port:(unsigned __int16)a4;
@end

@implementation GKAsyncSocketInternal

- (GKAsyncSocketInternal)init
{
  v5.receiver = self;
  v5.super_class = (Class)GKAsyncSocketInternal;
  v2 = [(GKAsyncSocketInternal *)&v5 init];
  if (v2)
  {
    v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
    v2->_dataToSend = v3;
    if (v3)
    {
      v2->_connectionSocket = -1;
      v2->_syncQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.GameKitServices.GKAsyncSocket", 0);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)setTargetQueue:(id)a3
{
  if (a3) {
    dispatch_retain((dispatch_object_t)a3);
  }
  targetQueue = self->_targetQueue;
  if (targetQueue) {
    dispatch_release(targetQueue);
  }
  self->_targetQueue = (OS_dispatch_queue *)a3;
}

- (BOOL)setupSourcesWithSocket:(int)a3 receiveEventHandler:(id)a4 sendEventHandler:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  int v9 = fcntl(a3, 3, 0);
  if (v9 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v19 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR);
      if (!v19) {
        return v19;
      }
      -[GKAsyncSocketInternal setupSourcesWithSocket:receiveEventHandler:sendEventHandler:]();
    }
LABEL_27:
    LOBYTE(v19) = 0;
    return v19;
  }
  if (fcntl(a3, 4, v9 | 4u) == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v19 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR);
      if (!v19) {
        return v19;
      }
      -[GKAsyncSocketInternal setupSourcesWithSocket:receiveEventHandler:sendEventHandler:]();
    }
    goto LABEL_27;
  }
  int v32 = 1;
  if (setsockopt(a3, 0xFFFF, 4130, &v32, 4u) == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v19 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR);
      if (!v19) {
        return v19;
      }
      -[GKAsyncSocketInternal setupSourcesWithSocket:receiveEventHandler:sendEventHandler:]();
    }
    goto LABEL_27;
  }
  v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83E8], a3, 0, (dispatch_queue_t)self->_syncQueue);
  self->_receiveSource = v10;
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
      {
        socketName = self->_socketName;
        if (socketName) {
          v23 = [[(NSString *)socketName description] UTF8String];
        }
        else {
          v23 = "<nil>";
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v34 = v20;
        __int16 v35 = 2080;
        v36 = "-[GKAsyncSocketInternal setupSourcesWithSocket:receiveEventHandler:sendEventHandler:]";
        __int16 v37 = 1024;
        int v38 = 148;
        __int16 v39 = 2048;
        v40 = self;
        __int16 v41 = 1024;
        int v42 = a3;
        __int16 v43 = 2080;
        v44 = v23;
        _os_log_error_impl(&dword_221563000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d ptr [%p] sd [%d] name [%s] cannot create dispatch source for reading socket", buf, 0x36u);
      }
    }
    goto LABEL_26;
  }
  v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8418], a3, 0, (dispatch_queue_t)self->_syncQueue);
  self->_sendSource = v11;
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
      {
        v26 = self->_socketName;
        if (v26) {
          v27 = [[(NSString *)v26 description] UTF8String];
        }
        else {
          v27 = "<nil>";
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v34 = v24;
        __int16 v35 = 2080;
        v36 = "-[GKAsyncSocketInternal setupSourcesWithSocket:receiveEventHandler:sendEventHandler:]";
        __int16 v37 = 1024;
        int v38 = 155;
        __int16 v39 = 2048;
        v40 = self;
        __int16 v41 = 1024;
        int v42 = a3;
        __int16 v43 = 2080;
        v44 = v27;
        _os_log_error_impl(&dword_221563000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d ptr [%p] sd [%d] name [%s] cannot create dispatch source for writing socket", buf, 0x36u);
      }
    }
    dispatch_release((dispatch_object_t)self->_receiveSource);
LABEL_26:
    close(a3);
    goto LABEL_27;
  }
  self->_int connectionSocket = a3;
  dispatch_source_set_event_handler((dispatch_source_t)self->_receiveSource, a4);
  receiveSource = self->_receiveSource;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __85__GKAsyncSocketInternal_setupSourcesWithSocket_receiveEventHandler_sendEventHandler___block_invoke;
  handler[3] = &__block_descriptor_36_e5_v8__0l;
  int v31 = a3;
  dispatch_source_set_cancel_handler(receiveSource, handler);
  dispatch_source_set_event_handler((dispatch_source_t)self->_sendSource, a5);
  sendSource = self->_sendSource;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __85__GKAsyncSocketInternal_setupSourcesWithSocket_receiveEventHandler_sendEventHandler___block_invoke_2;
  v29[3] = &unk_2645B7C20;
  v29[4] = self;
  dispatch_source_set_cancel_handler(sendSource, v29);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int connectionSocket = self->_connectionSocket;
      v17 = self->_socketName;
      if (v17) {
        v18 = [[(NSString *)v17 description] UTF8String];
      }
      else {
        v18 = "<nil>";
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v34 = v14;
      __int16 v35 = 2080;
      v36 = "-[GKAsyncSocketInternal setupSourcesWithSocket:receiveEventHandler:sendEventHandler:]";
      __int16 v37 = 1024;
      int v38 = 172;
      __int16 v39 = 2048;
      v40 = self;
      __int16 v41 = 1024;
      int v42 = connectionSocket;
      __int16 v43 = 2080;
      v44 = v18;
      _os_log_impl(&dword_221563000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] sd [%d] name [%s] set up socket", buf, 0x36u);
    }
  }
  dispatch_resume((dispatch_object_t)self->_receiveSource);
  self->_sendSourceSuspended = 0;
  dispatch_resume((dispatch_object_t)self->_sendSource);
  LOBYTE(v19) = 1;
  return v19;
}

uint64_t __85__GKAsyncSocketInternal_setupSourcesWithSocket_receiveEventHandler_sendEventHandler___block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void __85__GKAsyncSocketInternal_setupSourcesWithSocket_receiveEventHandler_sendEventHandler___block_invoke_2(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 8));
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (v2)
  {
    dispatch_release(v2);
    *(void *)(*(void *)(a1 + 32) + 8) = 0;
  }
}

- (void)tcpAttachSocketDescriptor:(int)a3
{
  v7[4] = self;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__GKAsyncSocketInternal_tcpAttachSocketDescriptor___block_invoke;
  v8[3] = &unk_2645B7C20;
  v8[4] = self;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__GKAsyncSocketInternal_tcpAttachSocketDescriptor___block_invoke_2;
  v7[3] = &unk_2645B7C20;
  if (![(GKAsyncSocketInternal *)self setupSourcesWithSocket:*(void *)&a3 receiveEventHandler:v8 sendEventHandler:v7])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKAsyncSocketInternal tcpAttachSocketDescriptor:]();
      }
    }
    id connectedHandler = self->_connectedHandler;
    if (connectedHandler)
    {
      if (self->_targetQueue) {
        targetQueue = self->_targetQueue;
      }
      else {
        targetQueue = MEMORY[0x263EF83A0];
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __51__GKAsyncSocketInternal_tcpAttachSocketDescriptor___block_invoke_40;
      block[3] = &unk_2645B8400;
      block[4] = connectedHandler;
      dispatch_async(targetQueue, block);
      [(GKAsyncSocketInternal *)self setConnectedHandler:0];
    }
  }
}

uint64_t __51__GKAsyncSocketInternal_tcpAttachSocketDescriptor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) receiveData];
}

uint64_t __51__GKAsyncSocketInternal_tcpAttachSocketDescriptor___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendData];
}

uint64_t __51__GKAsyncSocketInternal_tcpAttachSocketDescriptor___block_invoke_40(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F08320];
  v4[0] = @"Failed to setup sources for socket";
  objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"GKAsyncSocket", -1, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)tcpConnectSockAddr:(const sockaddr *)a3 port:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  uint64_t v50 = *MEMORY[0x263EF8340];
  *(void *)&v49.sa_len = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v49.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
  memset(v30, 170, 28);
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)((char *)v48 + 14) = v6;
  *(_OWORD *)v47 = v6;
  v48[0] = v6;
  int sa_family = a3->sa_family;
  if (sa_family == 30)
  {
    v30[0] = *a3;
    *(sockaddr *)((char *)v30 + 12) = *(sockaddr *)&a3->sa_data[10];
    WORD1(v30[0]) = a4;
    uint64_t v9 = socket(30, 1, 0);
    inet_ntop(30, (char *)v30 + 8, v47, 0x2Eu);
    socklen_t v10 = 28;
    v8 = (const sockaddr *)v30;
  }
  else
  {
    if (sa_family != 2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
          -[GKAsyncSocketInternal tcpConnectSockAddr:port:]();
        }
      }
      id connectedHandler = self->_connectedHandler;
      if (connectedHandler)
      {
        if (self->_targetQueue) {
          targetQueue = self->_targetQueue;
        }
        else {
          targetQueue = MEMORY[0x263EF83A0];
        }
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke;
        v29[3] = &unk_2645B8400;
        v29[4] = connectedHandler;
        BOOL v19 = v29;
        goto LABEL_48;
      }
      return;
    }
    v8 = &v49;
    sockaddr v49 = *a3;
    *(_WORD *)v49.sa_data = a4;
    uint64_t v9 = socket(2, 1, 0);
    socklen_t v10 = 16;
    inet_ntop(2, &v49.sa_data[2], v47, 0x10u);
  }
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v9 == -1)
  {
    if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKAsyncSocketInternal tcpConnectSockAddr:port:]();
      }
    }
    id v20 = self->_connectedHandler;
    if (v20)
    {
      if (self->_targetQueue) {
        targetQueue = self->_targetQueue;
      }
      else {
        targetQueue = MEMORY[0x263EF83A0];
      }
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke_50;
      v28[3] = &unk_2645B8400;
      v28[4] = v20;
      BOOL v19 = v28;
      goto LABEL_48;
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int connectionSocket = self->_connectionSocket;
        socketName = self->_socketName;
        if (socketName) {
          v16 = [[(NSString *)socketName description] UTF8String];
        }
        else {
          v16 = "<nil>";
        }
        *(_DWORD *)buf = 136316930;
        uint64_t v32 = v12;
        __int16 v33 = 2080;
        uint64_t v34 = "-[GKAsyncSocketInternal tcpConnectSockAddr:port:]";
        __int16 v35 = 1024;
        int v36 = 258;
        __int16 v37 = 2048;
        int v38 = self;
        __int16 v39 = 1024;
        int v40 = connectionSocket;
        __int16 v41 = 2080;
        int v42 = v16;
        __int16 v43 = 2080;
        v44 = v47;
        __int16 v45 = 1024;
        unsigned int v46 = __rev16(v4);
        _os_log_impl(&dword_221563000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] sd [%d] name [%s] connecting to %s:%u", buf, 0x46u);
      }
    }
    int v21 = fcntl(v9, 3, 0);
    if (v21 != -1)
    {
      fcntl(v9, 4, v21 | 4u);
      *(_DWORD *)buf = 1;
      setsockopt(v9, 0xFFFF, 4130, buf, 4u);
      if (connect(v9, v8, v10) == -1 && *__error() != 36)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
            -[GKAsyncSocketInternal tcpConnectSockAddr:port:].cold.4();
          }
        }
        close(v9);
        id v23 = self->_connectedHandler;
        if (v23)
        {
          if (self->_targetQueue) {
            targetQueue = self->_targetQueue;
          }
          else {
            targetQueue = MEMORY[0x263EF83A0];
          }
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke_54;
          block[3] = &unk_2645B8400;
          block[4] = v23;
          BOOL v19 = block;
          goto LABEL_48;
        }
      }
      else
      {
        v25[4] = self;
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke_2;
        v26[3] = &unk_2645B7C20;
        v26[4] = self;
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke_3;
        v25[3] = &unk_2645B7C20;
        if (![(GKAsyncSocketInternal *)self setupSourcesWithSocket:v9 receiveEventHandler:v26 sendEventHandler:v25])
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
              -[GKAsyncSocketInternal tcpConnectSockAddr:port:]();
            }
          }
          id v22 = self->_connectedHandler;
          if (v22)
          {
            if (self->_targetQueue) {
              targetQueue = self->_targetQueue;
            }
            else {
              targetQueue = MEMORY[0x263EF83A0];
            }
            v24[0] = MEMORY[0x263EF8330];
            v24[1] = 3221225472;
            v24[2] = __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke_58;
            v24[3] = &unk_2645B8400;
            v24[4] = v22;
            BOOL v19 = v24;
LABEL_48:
            dispatch_async(targetQueue, v19);
            [(GKAsyncSocketInternal *)self setConnectedHandler:0];
          }
        }
      }
    }
  }
}

uint64_t __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F08320];
  v4[0] = @"Unknown socket address";
  objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"GKAsyncSocket", -2, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke_50(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F08320];
  v4[0] = @"Socket failed";
  objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"GKAsyncSocket", -3, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke_54(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F08320];
  v4[0] = @"Connect failed";
  objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"GKAsyncSocket", -4, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) receiveData];
}

uint64_t __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendData];
}

uint64_t __49__GKAsyncSocketInternal_tcpConnectSockAddr_port___block_invoke_58(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F08320];
  v4[0] = @"Failed to setup sources for socket";
  objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"GKAsyncSocket", -1, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    unsigned int v4 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int connectionSocket = self->_connectionSocket;
      socketName = self->_socketName;
      if (socketName) {
        v7 = [[(NSString *)socketName description] UTF8String];
      }
      else {
        v7 = "<nil>";
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v12 = v3;
      __int16 v13 = 2080;
      uint64_t v14 = "-[GKAsyncSocketInternal dealloc]";
      __int16 v15 = 1024;
      int v16 = 311;
      __int16 v17 = 2048;
      v18 = self;
      __int16 v19 = 1024;
      int v20 = connectionSocket;
      __int16 v21 = 2080;
      id v22 = v7;
      _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] sd [%d] name [%s] dealloc", buf, 0x36u);
    }
  }

  syncQueue = self->_syncQueue;
  if (syncQueue) {
    dispatch_release(syncQueue);
  }
  targetQueue = self->_targetQueue;
  if (targetQueue) {
    dispatch_release(targetQueue);
  }
  v10.receiver = self;
  v10.super_class = (Class)GKAsyncSocketInternal;
  [(GKAsyncSocketInternal *)&v10 dealloc];
}

- (void)invalidate
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    unsigned int v4 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int connectionSocket = self->_connectionSocket;
      socketName = self->_socketName;
      if (socketName) {
        v7 = [[(NSString *)socketName description] UTF8String];
      }
      else {
        v7 = "<nil>";
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v11 = v3;
      __int16 v12 = 2080;
      __int16 v13 = "-[GKAsyncSocketInternal invalidate]";
      __int16 v14 = 1024;
      int v15 = 326;
      __int16 v16 = 2048;
      __int16 v17 = self;
      __int16 v18 = 1024;
      int v19 = connectionSocket;
      __int16 v20 = 2080;
      __int16 v21 = v7;
      _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] sd [%d] name [%s] invalidate", buf, 0x36u);
    }
  }
  self->_invalidated = 1;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__GKAsyncSocketInternal_invalidate__block_invoke;
  block[3] = &unk_2645B7C20;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __35__GKAsyncSocketInternal_invalidate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) = 0;
  v2 = *(void **)(a1 + 32);
  return [v2 closeConnectionNow];
}

- (void)sendData:(id)a3 withCompletionHandler:(id)a4
{
  if (self->_invalidated || self->_connectionSocket == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKAsyncSocketInternal sendData:withCompletionHandler:]();
      }
    }
  }
  else
  {
    syncQueue = self->_syncQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__GKAsyncSocketInternal_sendData_withCompletionHandler___block_invoke;
    block[3] = &unk_2645B8428;
    block[4] = self;
    void block[5] = a3;
    block[6] = a4;
    dispatch_async(syncQueue, block);
  }
}

uint64_t __56__GKAsyncSocketInternal_sendData_withCompletionHandler___block_invoke(void *a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  [*(id *)(a1[4] + 32) appendData:a1[5]];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = a1[4];
      int v5 = *(_DWORD *)(v4 + 28);
      long long v6 = *(void **)(v4 + 72);
      if (v6) {
        v7 = (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
      }
      else {
        v7 = "<nil>";
      }
      int v8 = [*(id *)(a1[4] + 32) length];
      int v16 = 136316674;
      uint64_t v17 = v2;
      __int16 v18 = 2080;
      int v19 = "-[GKAsyncSocketInternal sendData:withCompletionHandler:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 344;
      __int16 v22 = 2048;
      uint64_t v23 = v4;
      __int16 v24 = 1024;
      int v25 = v5;
      __int16 v26 = 2080;
      v27 = v7;
      __int16 v28 = 1024;
      int v29 = v8;
      _os_log_impl(&dword_221563000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] sd [%d] name [%s] appending data [%u]", (uint8_t *)&v16, 0x3Cu);
    }
  }
  if (*(unsigned char *)(a1[4] + 24))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      objc_super v10 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = a1[4];
        int v12 = *(_DWORD *)(v11 + 28);
        __int16 v13 = *(void **)(v11 + 72);
        if (v13) {
          __int16 v14 = (const char *)objc_msgSend((id)objc_msgSend(v13, "description"), "UTF8String");
        }
        else {
          __int16 v14 = "<nil>";
        }
        int v16 = 136316418;
        uint64_t v17 = v9;
        __int16 v18 = 2080;
        int v19 = "-[GKAsyncSocketInternal sendData:withCompletionHandler:]_block_invoke";
        __int16 v20 = 1024;
        int v21 = 347;
        __int16 v22 = 2048;
        uint64_t v23 = v11;
        __int16 v24 = 1024;
        int v25 = v12;
        __int16 v26 = 2080;
        v27 = v14;
        _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] sd [%d] name [%s] resuming sendSource", (uint8_t *)&v16, 0x36u);
      }
    }
    dispatch_resume(*(dispatch_object_t *)(a1[4] + 16));
    *(unsigned char *)(a1[4] + 24) = 0;
  }
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)closeConnectionNow
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int connectionSocket = self->_connectionSocket;
      socketName = self->_socketName;
      if (socketName) {
        v7 = [[(NSString *)socketName description] UTF8String];
      }
      else {
        v7 = "<nil>";
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v28 = v3;
      __int16 v29 = 2080;
      uint64_t v30 = "-[GKAsyncSocketInternal closeConnectionNow]";
      __int16 v31 = 1024;
      int v32 = 360;
      __int16 v33 = 2048;
      uint64_t v34 = self;
      __int16 v35 = 1024;
      int v36 = connectionSocket;
      __int16 v37 = 2080;
      int v38 = v7;
      _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] sd [%d] name [%s] closing down connections...", buf, 0x36u);
    }
  }
  sendSource = self->_sendSource;
  if (sendSource)
  {
    dispatch_source_cancel(sendSource);
    if (self->_sendSourceSuspended)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        objc_super v10 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v11 = self->_connectionSocket;
          int v12 = self->_socketName;
          if (v12) {
            __int16 v13 = [[(NSString *)v12 description] UTF8String];
          }
          else {
            __int16 v13 = "<nil>";
          }
          *(_DWORD *)buf = 136316418;
          uint64_t v28 = v9;
          __int16 v29 = 2080;
          uint64_t v30 = "-[GKAsyncSocketInternal closeConnectionNow]";
          __int16 v31 = 1024;
          int v32 = 365;
          __int16 v33 = 2048;
          uint64_t v34 = self;
          __int16 v35 = 1024;
          int v36 = v11;
          __int16 v37 = 2080;
          int v38 = v13;
          _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] sd [%d] name [%s] resuming sendSource", buf, 0x36u);
        }
      }
      dispatch_resume((dispatch_object_t)self->_sendSource);
      self->_sendSourceSuspended = 0;
    }
    __int16 v20 = self->_sendSource;
    if (v20)
    {
      dispatch_release(v20);
      self->_sendSource = 0;
    }
    p_int connectionSocket = &self->_connectionSocket;
  }
  else
  {
    p_int connectionSocket = &self->_connectionSocket;
    if (self->_connectionSocket == -1) {
      goto LABEL_28;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      int v16 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = *p_connectionSocket;
        __int16 v18 = self->_socketName;
        if (v18) {
          int v19 = [[(NSString *)v18 description] UTF8String];
        }
        else {
          int v19 = "<nil>";
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v28 = v15;
        __int16 v29 = 2080;
        uint64_t v30 = "-[GKAsyncSocketInternal closeConnectionNow]";
        __int16 v31 = 1024;
        int v32 = 373;
        __int16 v33 = 2048;
        uint64_t v34 = self;
        __int16 v35 = 1024;
        int v36 = v17;
        __int16 v37 = 2080;
        int v38 = v19;
        _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] sd [%d] name [%s] closing socket", buf, 0x36u);
      }
    }
    close(*p_connectionSocket);
  }
  *p_int connectionSocket = -1;
LABEL_28:
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    id connectedHandler = self->_connectedHandler;
    if (connectedHandler)
    {
      if (self->_targetQueue) {
        targetQueue = self->_targetQueue;
      }
      else {
        targetQueue = MEMORY[0x263EF83A0];
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __43__GKAsyncSocketInternal_closeConnectionNow__block_invoke;
      block[3] = &unk_2645B8400;
      block[4] = connectedHandler;
      dispatch_async(targetQueue, block);
      [(GKAsyncSocketInternal *)self setConnectedHandler:0];
    }
    else
    {
      id receiveDataHandler = self->_receiveDataHandler;
      if (self->_targetQueue) {
        __int16 v24 = self->_targetQueue;
      }
      else {
        __int16 v24 = MEMORY[0x263EF83A0];
      }
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __43__GKAsyncSocketInternal_closeConnectionNow__block_invoke_2;
      v25[3] = &unk_2645B8400;
      v25[4] = receiveDataHandler;
      dispatch_async(v24, v25);

      self->_id receiveDataHandler = 0;
    }
  }
}

uint64_t __43__GKAsyncSocketInternal_closeConnectionNow__block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F08320];
  v4[0] = @"Connection closed prematurely";
  objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"GKAsyncSocket", -5, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __43__GKAsyncSocketInternal_closeConnectionNow__block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, double))(result + 16))(result, 0, 0, 0.0);
  }
  return result;
}

- (void)receiveData
{
  OUTLINED_FUNCTION_7();
  v1 = *(void **)(v0 + 72);
  if (v1) {
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_4_3(&dword_221563000, v2, v3, " [%s] %s:%d ptr [%p] sd [%d] name [%s] invalidated", v4, v5, v6, v7, v8);
}

uint64_t __36__GKAsyncSocketInternal_receiveData__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:*(void *)(a1 + 40) length:*(int *)(a1 + 56) freeWhenDone:1];
  v4.n128_u64[0] = *(void *)(a1 + 48);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, void, __n128))(v2 + 16);
  return v5(v2, v3, 0, v4);
}

- (void)sendData
{
  OUTLINED_FUNCTION_7();
  v1 = *(void **)(v0 + 72);
  if (v1) {
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_4_3(&dword_221563000, v2, v3, " [%s] %s:%d ptr [%p] sd [%d] name [%s] invalidated", v4, v5, v6, v7, v8);
}

uint64_t __33__GKAsyncSocketInternal_sendData__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (id)receiveDataHandler
{
  return self->_receiveDataHandler;
}

- (void)setReceiveDataHandler:(id)a3
{
}

- (id)connectedHandler
{
  return self->_connectedHandler;
}

- (void)setConnectedHandler:(id)a3
{
}

- (id)socketName
{
  return self->_socketName;
}

- (void)setSocketName:(id)a3
{
}

- (void)setupSourcesWithSocket:receiveEventHandler:sendEventHandler:.cold.1()
{
  OUTLINED_FUNCTION_7();
  v1 = *(void **)(v0 + 72);
  if (v1) {
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  }
  __error();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6_2(&dword_221563000, v2, v3, " [%s] %s:%d ptr [%p] sd [%d] name [%s] fcntl get failed (errno=%d)", v4, v5, v6, v7, v8);
}

- (void)setupSourcesWithSocket:receiveEventHandler:sendEventHandler:.cold.2()
{
  OUTLINED_FUNCTION_7();
  v1 = *(void **)(v0 + 72);
  if (v1) {
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  }
  __error();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6_2(&dword_221563000, v2, v3, " [%s] %s:%d ptr [%p] sd [%d] name [%s] fcntl set failed (errno=%d)", v4, v5, v6, v7, v8);
}

- (void)setupSourcesWithSocket:receiveEventHandler:sendEventHandler:.cold.3()
{
  OUTLINED_FUNCTION_7();
  v1 = *(void **)(v0 + 72);
  if (v1) {
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  }
  __error();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6_2(&dword_221563000, v2, v3, " [%s] %s:%d ptr [%p] sd [%d] name [%s] setsockopt set failed (errno=%d)", v4, v5, v6, v7, v8);
}

- (void)tcpAttachSocketDescriptor:.cold.1()
{
  OUTLINED_FUNCTION_7();
  v1 = *(void **)(v0 + 72);
  if (v1) {
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_4_3(&dword_221563000, v2, v3, " [%s] %s:%d ptr [%p] sd [%d] name [%s] failed to attach socket", v4, v5, v6, v7, v8);
}

- (void)tcpConnectSockAddr:port:.cold.1()
{
  OUTLINED_FUNCTION_7();
  v1 = *(void **)(v0 + 72);
  if (v1) {
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_4_3(&dword_221563000, v2, v3, " [%s] %s:%d ptr [%p] sd [%d] name [%s] unknown sockaddr??", v4, v5, v6, v7, v8);
}

- (void)tcpConnectSockAddr:port:.cold.2()
{
  OUTLINED_FUNCTION_7();
  v1 = *(void **)(v0 + 72);
  if (v1) {
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  }
  __error();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6_2(&dword_221563000, v2, v3, " [%s] %s:%d ptr [%p] sd [%d] name [%s] socket failed (errno=%d)", v4, v5, v6, v7, v8);
}

- (void)tcpConnectSockAddr:port:.cold.3()
{
  OUTLINED_FUNCTION_7();
  v1 = *(void **)(v0 + 72);
  if (v1) {
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_4_3(&dword_221563000, v2, v3, " [%s] %s:%d ptr [%p] sd [%d] name [%s] failed to attach to socket", v4, v5, v6, v7, v8);
}

- (void)tcpConnectSockAddr:port:.cold.4()
{
  OUTLINED_FUNCTION_7();
  v1 = *(void **)(v0 + 72);
  if (v1) {
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  }
  __error();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6_2(&dword_221563000, v2, v3, " [%s] %s:%d ptr [%p] sd [%d] name [%s] connect failed (errno=%d)", v4, v5, v6, v7, v8);
}

- (void)sendData:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_7();
  v1 = *(void **)(v0 + 72);
  if (v1) {
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_4_3(&dword_221563000, v2, v3, " [%s] %s:%d ptr [%p] sd [%d] name [%s] invalidated", v4, v5, v6, v7, v8);
}

@end