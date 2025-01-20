@interface GKDiscoveryPeerConnection
+ (unint64_t)receiveDataLimit;
+ (unint64_t)sendDataLimit;
+ (void)checkConstants;
- (BOOL)shouldDecideAboutConnection;
- (BOOL)syncSetupNewSocket;
- (GKDiscoveryPeerConnection)initWithLocalServiceName:(id)a3;
- (NSString)localServiceName;
- (NSString)remoteServiceName;
- (OS_dispatch_queue)syncQueue;
- (OS_dispatch_queue)targetQueue;
- (id)connectedHandler;
- (id)receiveDataHandler;
- (void)attachSocketDescriptor:(int)a3;
- (void)connectToSockAddr:(const sockaddr *)a3 port:(unsigned __int16)a4;
- (void)dealloc;
- (void)invalidate;
- (void)sendData:(id)a3 withCompletionHandler:(id)a4;
- (void)setConnectedHandler:(id)a3;
- (void)setLocalServiceName:(id)a3;
- (void)setReceiveDataHandler:(id)a3;
- (void)setRemoteServiceName:(id)a3;
- (void)setSyncQueue:(id)a3;
- (void)setTargetQueue:(id)a3;
- (void)shouldDecideAboutConnection;
- (void)syncAcceptedConnection;
- (void)syncCloseConnectionNow;
- (void)syncConnected:(id)a3;
- (void)syncProcessMessage:(int)a3 data:(id)a4 sequenceNumber:(unsigned int)a5;
- (void)syncReceivedData:(id)a3 error:(id)a4;
- (void)syncSendAccept;
- (void)syncSendHello;
- (void)syncSendMessage:(int)a3 data:(id)a4 withCompletionHandler:(id)a5;
- (void)syncSendMessageReceipt:(int)a3 sequenceNumber:(unsigned int)a4;
- (void)timeout:(id)a3;
@end

@implementation GKDiscoveryPeerConnection

- (GKDiscoveryPeerConnection)initWithLocalServiceName:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)GKDiscoveryPeerConnection;
  v4 = [(GKDiscoveryPeerConnection *)&v16 init];
  if (v4)
  {
    v5 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
    v4->_dataReceived = v5;
    if (!v5) {
      goto LABEL_11;
    }
    v6 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
    v4->_dataToSendHoldingQueue = v6;
    if (!v6) {
      goto LABEL_11;
    }
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v4->_receivedDataHoldingQueue = v7;
    if (v7
      && (v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]), (v4->_messageReceiptHandlerList = v8) != 0)
      && (v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]),
          (v4->_messageReceiptHandlerHoldingQueue = v9) != 0))
    {
      [(GKDiscoveryPeerConnection *)v4 setLocalServiceName:a3];
      v10 = objc_alloc_init(GKSimpleTimer);
      v4->_heartbeatTimer = v10;
      [(GKSimpleTimer *)v10 setDelegate:v4];
      v11 = objc_alloc_init(GKSimpleTimer);
      v4->_heartbeatTimeoutTimer = v11;
      [(GKSimpleTimer *)v11 setDelegate:v4];
      v12 = objc_alloc_init(GKSimpleTimer);
      v4->_timeoutTimer = v12;
      [(GKSimpleTimer *)v12 setDelegate:v4];
      objc_msgSend((id)objc_msgSend(off_2645B7A10, "getClientOption:", *(void *)off_2645B7928), "doubleValue");
      if (v13 == 0.0) {
        double v13 = 60.0;
      }
      v4->_connectionTimeoutInSeconds = v13;
      objc_msgSend((id)objc_msgSend(off_2645B7A10, "getClientOption:", *(void *)off_2645B7920), "doubleValue");
      v4->_heartbeatIntervalInSeconds = v14;
      if (v14 == 0.0) {
        v4->_heartbeatIntervalInSeconds = 20.0;
      }
    }
    else
    {
LABEL_11:

      return 0;
    }
  }
  return v4;
}

- (void)setSyncQueue:(id)a3
{
  if (a3) {
    dispatch_retain((dispatch_object_t)a3);
  }
  syncQueue = self->_syncQueue;
  if (syncQueue) {
    dispatch_release(syncQueue);
  }
  self->_syncQueue = (OS_dispatch_queue *)a3;
  connectionSocket = self->_connectionSocket;
  [(GKAsyncSocket *)connectionSocket setTargetQueue:a3];
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

- (void)syncConnected:(id)a3
{
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKDiscoveryPeerConnection syncConnected:]();
      }
    }
    id connectedHandler = self->_connectedHandler;
    if (connectedHandler)
    {
      self->_id connectedHandler = 0;
      if (self->_targetQueue) {
        targetQueue = self->_targetQueue;
      }
      else {
        targetQueue = MEMORY[0x263EF83A0];
      }
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __43__GKDiscoveryPeerConnection_syncConnected___block_invoke;
      v7[3] = &unk_2645B8478;
      v7[4] = a3;
      v7[5] = connectedHandler;
      dispatch_async(targetQueue, v7);
    }
  }
  else
  {
    [(GKDiscoveryPeerConnection *)self syncSendHello];
  }
}

uint64_t __43__GKDiscoveryPeerConnection_syncConnected___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, *(void *)(a1 + 32));
}

- (BOOL)syncSetupNewSocket
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (self->_connectionSocket)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        connectionSocket = self->_connectionSocket;
        remoteServiceName = self->_remoteServiceName;
        if (remoteServiceName) {
          v7 = [[(NSString *)remoteServiceName description] UTF8String];
        }
        else {
          v7 = "<nil>";
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v19 = v3;
        __int16 v20 = 2080;
        v21 = "-[GKDiscoveryPeerConnection syncSetupNewSocket]";
        __int16 v22 = 1024;
        int v23 = 266;
        __int16 v24 = 2048;
        v25 = self;
        __int16 v26 = 2048;
        v27 = connectionSocket;
        __int16 v28 = 2080;
        v29 = v7;
        _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] _connectionSocket already up", buf, 0x3Au);
      }
    }
    goto LABEL_14;
  }
  v8 = objc_alloc_init(GKAsyncSocket);
  self->_connectionSocket = v8;
  if (v8)
  {
    [(GKAsyncSocket *)v8 setTargetQueue:self->_syncQueue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __47__GKDiscoveryPeerConnection_syncSetupNewSocket__block_invoke;
    v17[3] = &unk_2645B84A0;
    v17[4] = self;
    [(GKAsyncSocket *)self->_connectionSocket setReceiveDataHandler:v17];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __47__GKDiscoveryPeerConnection_syncSetupNewSocket__block_invoke_2;
    v16[3] = &unk_2645B84C8;
    v16[4] = self;
    [(GKAsyncSocket *)self->_connectionSocket setConnectedHandler:v16];
LABEL_14:
    LOBYTE(v11) = 1;
    return v11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x263F21098];
    BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR);
    if (!v11) {
      return v11;
    }
    v12 = self->_connectionSocket;
    double v13 = self->_remoteServiceName;
    if (v13) {
      double v14 = [[(NSString *)v13 description] UTF8String];
    }
    else {
      double v14 = "<nil>";
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v19 = v9;
    __int16 v20 = 2080;
    v21 = "-[GKDiscoveryPeerConnection syncSetupNewSocket]";
    __int16 v22 = 1024;
    int v23 = 272;
    __int16 v24 = 2048;
    v25 = self;
    __int16 v26 = 2048;
    v27 = v12;
    __int16 v28 = 2080;
    v29 = v14;
    _os_log_error_impl(&dword_221563000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] GKAsyncSocket alloc failed", buf, 0x3Au);
  }
  LOBYTE(v11) = 0;
  return v11;
}

uint64_t __47__GKDiscoveryPeerConnection_syncSetupNewSocket__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) syncReceivedData:a2 error:a3];
}

uint64_t __47__GKDiscoveryPeerConnection_syncSetupNewSocket__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) syncConnected:a2];
}

- (void)connectToSockAddr:(const sockaddr *)a3 port:(unsigned __int16)a4
{
  v7 = copysockaddr(&a3->sa_len);
  syncQueue = self->_syncQueue;
  if (!syncQueue) {
    syncQueue = MEMORY[0x263EF83A0];
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__GKDiscoveryPeerConnection_connectToSockAddr_port___block_invoke;
  v9[3] = &unk_2645B84F0;
  v9[4] = self;
  v9[5] = v7;
  v9[6] = a2;
  unsigned __int16 v10 = a4;
  dispatch_async(syncQueue, v9);
}

void __52__GKDiscoveryPeerConnection_connectToSockAddr_port___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      v5 = *(const char **)(v4 + 32);
      v6 = *(void **)(v4 + 8);
      if (v6) {
        v7 = (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
      }
      else {
        v7 = "<nil>";
      }
      int v8 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 1);
      *(_DWORD *)buf = 136316674;
      uint64_t v22 = v2;
      __int16 v23 = 2080;
      __int16 v24 = "-[GKDiscoveryPeerConnection connectToSockAddr:port:]_block_invoke";
      __int16 v25 = 1024;
      int v26 = 314;
      __int16 v27 = 2048;
      uint64_t v28 = v4;
      __int16 v29 = 2048;
      uint64_t v30 = v5;
      __int16 v31 = 2080;
      v32 = v7;
      __int16 v33 = 1024;
      int v34 = v8;
      _os_log_impl(&dword_221563000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] ************ requesting connection sequence (sa_family = %d)", buf, 0x40u);
    }
  }
  uint64_t v9 = *(void **)(a1 + 32);
  if (v9[4])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      BOOL v11 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        Name = sel_getName(*(SEL *)(a1 + 48));
        double v14 = *(void **)(*(void *)(a1 + 32) + 8);
        if (v14) {
          v15 = (const char *)objc_msgSend((id)objc_msgSend(v14, "description"), "UTF8String");
        }
        else {
          v15 = "<nil>";
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v22 = v10;
        __int16 v23 = 2080;
        __int16 v24 = "-[GKDiscoveryPeerConnection connectToSockAddr:port:]_block_invoke";
        __int16 v25 = 1024;
        int v26 = 317;
        __int16 v27 = 2048;
        uint64_t v28 = v12;
        __int16 v29 = 2080;
        uint64_t v30 = Name;
        __int16 v31 = 2080;
        v32 = v15;
        _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p %s (%s): already connected!", buf, 0x3Au);
      }
    }
  }
  else
  {
    char v16 = [v9 syncSetupNewSocket];
    uint64_t v17 = *(void *)(a1 + 32);
    if (v16)
    {
      *(unsigned char *)(v17 + 24) = 0;
      [*(id *)(*(void *)(a1 + 32) + 32) tcpConnectSockAddr:*(void *)(a1 + 40) port:*(unsigned __int16 *)(a1 + 56)];
      free(*(void **)(a1 + 40));
      [*(id *)(*(void *)(a1 + 32) + 136) fireIn:*(double *)(*(void *)(a1 + 32) + 144) fromNow:micro()];
      return;
    }
    v18 = *(void **)(v17 + 96);
    if (v18)
    {
      *(void *)(v17 + 96) = 0;
      if (*(void *)(*(void *)(a1 + 32) + 112)) {
        uint64_t v19 = *(NSObject **)(*(void *)(a1 + 32) + 112);
      }
      else {
        uint64_t v19 = MEMORY[0x263EF83A0];
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __52__GKDiscoveryPeerConnection_connectToSockAddr_port___block_invoke_9;
      block[3] = &unk_2645B8400;
      block[4] = v18;
      dispatch_async(v19, block);
    }
  }
  free(*(void **)(a1 + 40));
}

uint64_t __52__GKDiscoveryPeerConnection_connectToSockAddr_port___block_invoke_9(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F08320];
  v4[0] = @"Setup new socket failed (browser side)";
  objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"GKDiscoveryPeerConnection", -1, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)attachSocketDescriptor:(int)a3
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__GKDiscoveryPeerConnection_attachSocketDescriptor___block_invoke;
  block[3] = &unk_2645B8518;
  if (!syncQueue) {
    syncQueue = MEMORY[0x263EF83A0];
  }
  block[4] = self;
  void block[5] = a2;
  int v5 = a3;
  dispatch_async(syncQueue, block);
}

void __52__GKDiscoveryPeerConnection_attachSocketDescriptor___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      Name = sel_getName(*(SEL *)(a1 + 40));
      v6 = *(void **)(*(void *)(a1 + 32) + 8);
      if (v6) {
        v7 = (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
      }
      else {
        v7 = "<nil>";
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v21 = v2;
      __int16 v22 = 2080;
      __int16 v23 = "-[GKDiscoveryPeerConnection attachSocketDescriptor:]_block_invoke";
      __int16 v24 = 1024;
      int v25 = 347;
      __int16 v26 = 2048;
      uint64_t v27 = v4;
      __int16 v28 = 2080;
      __int16 v29 = Name;
      __int16 v30 = 2080;
      __int16 v31 = v7;
      _os_log_impl(&dword_221563000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p %s (%s): ************ responding connection sequence", buf, 0x3Au);
    }
  }
  int v8 = *(void **)(a1 + 32);
  if (v8[4])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = *(const char **)(v11 + 32);
        double v13 = *(void **)(v11 + 8);
        if (v13) {
          double v14 = (const char *)objc_msgSend((id)objc_msgSend(v13, "description"), "UTF8String");
        }
        else {
          double v14 = "<nil>";
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v21 = v9;
        __int16 v22 = 2080;
        __int16 v23 = "-[GKDiscoveryPeerConnection attachSocketDescriptor:]_block_invoke";
        __int16 v24 = 1024;
        int v25 = 349;
        __int16 v26 = 2048;
        uint64_t v27 = v11;
        __int16 v28 = 2048;
        __int16 v29 = v12;
        __int16 v30 = 2080;
        __int16 v31 = v14;
        _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] already connected!", buf, 0x3Au);
      }
    }
  }
  else
  {
    char v15 = [v8 syncSetupNewSocket];
    uint64_t v16 = *(void *)(a1 + 32);
    if (v15)
    {
      *(unsigned char *)(v16 + 24) = 0;
      [*(id *)(*(void *)(a1 + 32) + 32) tcpAttachSocketDescriptor:*(unsigned int *)(a1 + 48)];
      [*(id *)(*(void *)(a1 + 32) + 136) fireIn:*(double *)(*(void *)(a1 + 32) + 144) fromNow:micro()];
    }
    else
    {
      uint64_t v17 = *(void **)(v16 + 96);
      if (v17)
      {
        *(void *)(v16 + 96) = 0;
        if (*(void *)(*(void *)(a1 + 32) + 112)) {
          v18 = *(NSObject **)(*(void *)(a1 + 32) + 112);
        }
        else {
          v18 = MEMORY[0x263EF83A0];
        }
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __52__GKDiscoveryPeerConnection_attachSocketDescriptor___block_invoke_16;
        block[3] = &unk_2645B8400;
        block[4] = v17;
        dispatch_async(v18, block);
      }
    }
  }
}

uint64_t __52__GKDiscoveryPeerConnection_attachSocketDescriptor___block_invoke_16(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F08320];
  v4[0] = @"Setup new socket failed (advertiser-side)";
  objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"GKDiscoveryPeerConnection", -1, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)shouldDecideAboutConnection
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([(GKDiscoveryPeerConnection *)self localServiceName]
    && [(GKDiscoveryPeerConnection *)self remoteServiceName])
  {
    if ([(NSString *)[(GKDiscoveryPeerConnection *)self remoteServiceName] isEqualToString:[(GKDiscoveryPeerConnection *)self localServiceName]])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      {
LABEL_10:
        LOBYTE(v3) = 0;
        return v3;
      }
      VRTraceErrorLogLevelToCSTR();
      BOOL v3 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR);
      if (v3)
      {
        -[GKDiscoveryPeerConnection shouldDecideAboutConnection]();
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v4 = (void *)[MEMORY[0x263F089D8] stringWithFormat:@"%@", -[GKDiscoveryPeerConnection localServiceName](self, "localServiceName")];
      int v5 = (void *)[MEMORY[0x263F089D8] stringWithFormat:@"%@", -[GKDiscoveryPeerConnection remoteServiceName](self, "remoteServiceName")];
      memset(md, 170, sizeof(md));
      memset(v10, 170, sizeof(v10));
      do
      {
        [v4 appendFormat:@"+%@", -[GKDiscoveryPeerConnection remoteServiceName](self, "remoteServiceName")];
        [v5 appendFormat:@"+%@", -[GKDiscoveryPeerConnection localServiceName](self, "localServiceName")];
        CC_MD5((const void *)[v4 UTF8String], objc_msgSend(v4, "length"), md);
        CC_MD5((const void *)[v5 UTF8String], objc_msgSend(v5, "length"), v10);
        unint64_t v6 = bswap64(*(unint64_t *)md);
        unint64_t v7 = bswap64(*(unint64_t *)v10);
        if (v6 != v7) {
          break;
        }
        unint64_t v6 = bswap64(*(unint64_t *)&md[8]);
        unint64_t v7 = bswap64(*(unint64_t *)&v10[8]);
      }
      while (v6 == v7);
      if (v6 < v7) {
        unsigned int v8 = -1;
      }
      else {
        unsigned int v8 = 1;
      }
      return v8 >> 31;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_10;
    }
    VRTraceErrorLogLevelToCSTR();
    BOOL v3 = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR);
    if (v3)
    {
      -[GKDiscoveryPeerConnection shouldDecideAboutConnection]();
      goto LABEL_10;
    }
  }
  return v3;
}

- (void)syncSendMessage:(int)a3 data:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  uint64_t v9 = (void *)MEMORY[0x223C85400](self, a2);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x263F21098];
    uint64_t v12 = *MEMORY[0x263F21098];
    if (*MEMORY[0x263F21088])
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        connectionSocket = self->_connectionSocket;
        remoteServiceName = self->_remoteServiceName;
        if (remoteServiceName) {
          char v15 = [[(NSString *)remoteServiceName description] UTF8String];
        }
        else {
          char v15 = "<nil>";
        }
        *(_DWORD *)buf = 136316930;
        uint64_t v59 = v10;
        __int16 v60 = 2080;
        v61 = "-[GKDiscoveryPeerConnection syncSendMessage:data:withCompletionHandler:]";
        __int16 v62 = 1024;
        int v63 = 411;
        __int16 v64 = 2048;
        v65 = self;
        __int16 v66 = 2048;
        v67 = connectionSocket;
        __int16 v68 = 2080;
        v69 = v15;
        __int16 v70 = 1024;
        int v71 = a3;
        __int16 v72 = 1024;
        int v73 = [a4 length];
        _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] send type [%u] data [%u]", buf, 0x46u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = self->_connectionSocket;
      uint64_t v17 = self->_remoteServiceName;
      if (v17) {
        v18 = [[(NSString *)v17 description] UTF8String];
      }
      else {
        v18 = "<nil>";
      }
      *(_DWORD *)buf = 136316930;
      uint64_t v59 = v10;
      __int16 v60 = 2080;
      v61 = "-[GKDiscoveryPeerConnection syncSendMessage:data:withCompletionHandler:]";
      __int16 v62 = 1024;
      int v63 = 411;
      __int16 v64 = 2048;
      v65 = self;
      __int16 v66 = 2048;
      v67 = v16;
      __int16 v68 = 2080;
      v69 = v18;
      __int16 v70 = 1024;
      int v71 = a3;
      __int16 v72 = 1024;
      int v73 = [a4 length];
      _os_log_debug_impl(&dword_221563000, v11, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] send type [%u] data [%u]", buf, 0x46u);
    }
  }
  if (a3 > 2199)
  {
    if (a3 != 2200 && a3 != 2300) {
      goto LABEL_22;
    }
  }
  else if (a3 != 2000 && a3 != 2100)
  {
LABEL_22:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      uint64_t v27 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
      {
        v38 = self->_connectionSocket;
        v39 = self->_remoteServiceName;
        if (v39) {
          v40 = [[(NSString *)v39 description] UTF8String];
        }
        else {
          v40 = "<nil>";
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v59 = v26;
        __int16 v60 = 2080;
        v61 = "-[GKDiscoveryPeerConnection syncSendMessage:data:withCompletionHandler:]";
        __int16 v62 = 1024;
        int v63 = 426;
        __int16 v64 = 2048;
        v65 = self;
        __int16 v66 = 2048;
        v67 = v38;
        __int16 v68 = 2080;
        v69 = v40;
        __int16 v70 = 1024;
        int v71 = a3;
        _os_log_error_impl(&dword_221563000, v27, OS_LOG_TYPE_ERROR, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] can't send bad message type [%u]", buf, 0x40u);
      }
    }
    uint64_t v56 = *MEMORY[0x263F08320];
    v57 = @"Unable to send unknown message type";
    (*((void (**)(id, uint64_t))a5 + 2))(a5, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"GKDiscoveryPeerConnection", -2, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1)));
    goto LABEL_36;
  }
  id v19 = (id)[a5 copy];
  int v20 = [a4 length];
  unsigned int currentSequenceNumber = self->_currentSequenceNumber;
  self->_unsigned int currentSequenceNumber = (currentSequenceNumber + 1) & 0x7FFFFFFF;
  v45[0] = BYTE1(a3);
  v45[1] = a3;
  __int16 v46 = 0;
  char v47 = HIBYTE(v20);
  char v48 = BYTE2(v20);
  char v49 = BYTE1(v20);
  char v50 = v20;
  unsigned int v51 = 0;
  char v52 = HIBYTE(currentSequenceNumber);
  char v53 = BYTE2(currentSequenceNumber);
  char v54 = BYTE1(currentSequenceNumber);
  char v55 = currentSequenceNumber;
  uLong v22 = crc32(0, v45, 0x10u);
  if ([a4 length]) {
    LODWORD(v22) = crc32(v22, (const Bytef *)[a4 bytes], objc_msgSend(a4, "length"));
  }
  unsigned int v51 = bswap32(v22);
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __72__GKDiscoveryPeerConnection_syncSendMessage_data_withCompletionHandler___block_invoke;
  v43[3] = &unk_2645B8540;
  unsigned int v44 = currentSequenceNumber;
  v43[4] = v19;
  id v23 = (id)[v43 copy];
  if (a3 == 2100 && !self->_connected)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      __int16 v29 = *MEMORY[0x263F21098];
      __int16 v30 = *MEMORY[0x263F21098];
      if (*MEMORY[0x263F21088])
      {
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v31 = self->_connectionSocket;
          uint64_t v32 = self->_remoteServiceName;
          if (v32) {
            __int16 v33 = [[(NSString *)v32 description] UTF8String];
          }
          else {
            __int16 v33 = "<nil>";
          }
          int v37 = [a4 length];
          *(_DWORD *)buf = 136316674;
          uint64_t v59 = v28;
          __int16 v60 = 2080;
          v61 = "-[GKDiscoveryPeerConnection syncSendMessage:data:withCompletionHandler:]";
          __int16 v62 = 1024;
          int v63 = 493;
          __int16 v64 = 2048;
          v65 = self;
          __int16 v66 = 2048;
          v67 = v31;
          __int16 v68 = 2080;
          v69 = v33;
          __int16 v70 = 1024;
          int v71 = v37;
          _os_log_impl(&dword_221563000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] still connecting - queueing data (%u) *", buf, 0x40u);
        }
      }
      else if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        int v34 = self->_connectionSocket;
        uint64_t v35 = self->_remoteServiceName;
        if (v35) {
          v36 = [[(NSString *)v35 description] UTF8String];
        }
        else {
          v36 = "<nil>";
        }
        int v41 = [a4 length];
        *(_DWORD *)buf = 136316674;
        uint64_t v59 = v28;
        __int16 v60 = 2080;
        v61 = "-[GKDiscoveryPeerConnection syncSendMessage:data:withCompletionHandler:]";
        __int16 v62 = 1024;
        int v63 = 493;
        __int16 v64 = 2048;
        v65 = self;
        __int16 v66 = 2048;
        v67 = v34;
        __int16 v68 = 2080;
        v69 = v36;
        __int16 v70 = 1024;
        int v71 = v41;
        _os_log_debug_impl(&dword_221563000, v29, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] still connecting - queueing data (%u) *", buf, 0x40u);
      }
    }
    [(NSMutableArray *)self->_messageReceiptHandlerHoldingQueue addObject:v23];
    [(NSMutableData *)self->_dataToSendHoldingQueue appendBytes:v45 length:16];
    [(NSMutableData *)self->_dataToSendHoldingQueue appendData:a4];
  }
  else
  {
    [(NSMutableArray *)self->_messageReceiptHandlerList addObject:v23];
    __int16 v24 = (void *)[MEMORY[0x263EFF990] dataWithBytes:v45 length:16];
    [v24 appendData:a4];
    int v25 = self->_connectionSocket;
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __72__GKDiscoveryPeerConnection_syncSendMessage_data_withCompletionHandler___block_invoke_34;
    v42[3] = &unk_2645B84C8;
    v42[4] = self;
    [(GKAsyncSocket *)v25 sendData:v24 withCompletionHandler:v42];
  }
LABEL_36:
}

BOOL __72__GKDiscoveryPeerConnection_syncSendMessage_data_withCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  int v3 = *(_DWORD *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    if (v3 == a2)
    {
      (*(void (**)(void, void))(v4 + 16))(*(void *)(a1 + 32), 0);
    }
    else
    {
      uint64_t v6 = *MEMORY[0x263F08320];
      v7[0] = @"Receipt does not match";
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"GKDiscoveryPeerConnection", -3, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1)));
    }
  }
  return v3 == a2;
}

void __72__GKDiscoveryPeerConnection_syncSendMessage_data_withCompletionHandler___block_invoke_34(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      int v5 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        uint64_t v7 = *(void *)(v6 + 32);
        unsigned int v8 = *(void **)(v6 + 8);
        if (v8) {
          uint64_t v9 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
        }
        else {
          uint64_t v9 = "<nil>";
        }
        int v10 = 136316674;
        uint64_t v11 = v4;
        __int16 v12 = 2080;
        double v13 = "-[GKDiscoveryPeerConnection syncSendMessage:data:withCompletionHandler:]_block_invoke";
        __int16 v14 = 1024;
        int v15 = 511;
        __int16 v16 = 2048;
        uint64_t v17 = v6;
        __int16 v18 = 2048;
        uint64_t v19 = v7;
        __int16 v20 = 2080;
        uint64_t v21 = v9;
        __int16 v22 = 2080;
        uint64_t v23 = objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
        _os_log_error_impl(&dword_221563000, v5, OS_LOG_TYPE_ERROR, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] sendData completed with error [%s]", (uint8_t *)&v10, 0x44u);
      }
    }
  }
}

- (void)syncSendHello
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  int v3 = [(NSString *)self->_localServiceName UTF8String];
  if (v3)
  {
    uint64_t v4 = v3;
    unsigned int v5 = strlen(v3);
    uint64_t v6 = v5 + 1;
    if (v5 < 0xFFFF)
    {
      int v13 = 100663296;
      LOBYTE(v14) = (unsigned __int16)(v5 + 1) >> 8;
      BYTE1(v14) = v5 + 1;
      uint64_t v7 = (void *)[MEMORY[0x263EFF990] dataWithBytes:&v13 length:6];
      [v7 appendBytes:v4 length:v6];
      [(GKDiscoveryPeerConnection *)self syncSendMessage:2000 data:v7 withCompletionHandler:0];
      return;
    }
  }
  else
  {
    LODWORD(v6) = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
    {
      connectionSocket = self->_connectionSocket;
      remoteServiceName = self->_remoteServiceName;
      if (remoteServiceName) {
        __int16 v12 = [[(NSString *)remoteServiceName description] UTF8String];
      }
      else {
        __int16 v12 = "<nil>";
      }
      int v13 = 136316674;
      uint64_t v14 = v8;
      __int16 v15 = 2080;
      __int16 v16 = "-[GKDiscoveryPeerConnection syncSendHello]";
      __int16 v17 = 1024;
      int v18 = 525;
      __int16 v19 = 2048;
      __int16 v20 = self;
      __int16 v21 = 2048;
      __int16 v22 = connectionSocket;
      __int16 v23 = 2080;
      uint64_t v24 = v12;
      __int16 v25 = 1024;
      int v26 = v6;
      _os_log_error_impl(&dword_221563000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] bad serviceName [%d] ??", (uint8_t *)&v13, 0x40u);
    }
  }
  [(GKDiscoveryPeerConnection *)self syncCloseConnectionNow];
}

- (void)syncSendAccept
{
}

- (void)syncAcceptedConnection
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  connectionSocket = self->_connectionSocket;
  dataToSendHoldingQueue = self->_dataToSendHoldingQueue;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __51__GKDiscoveryPeerConnection_syncAcceptedConnection__block_invoke;
  v25[3] = &unk_2645B84C8;
  v25[4] = self;
  [(GKAsyncSocket *)connectionSocket sendData:dataToSendHoldingQueue withCompletionHandler:v25];
  [(NSMutableArray *)self->_messageReceiptHandlerList addObjectsFromArray:self->_messageReceiptHandlerHoldingQueue];
  [(NSMutableArray *)self->_messageReceiptHandlerHoldingQueue removeAllObjects];
  if ([(NSMutableArray *)self->_receivedDataHoldingQueue count])
  {
    id receiveDataHandler = self->_receiveDataHandler;
    if (receiveDataHandler)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      receivedDataHoldingQueue = self->_receivedDataHoldingQueue;
      uint64_t v7 = [(NSMutableArray *)receivedDataHoldingQueue countByEnumeratingWithState:&v21 objects:v38 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v22;
        int v10 = MEMORY[0x263EF83A0];
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v22 != v9) {
              objc_enumerationMutation(receivedDataHoldingQueue);
            }
            uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
            if (self->_targetQueue) {
              targetQueue = self->_targetQueue;
            }
            else {
              targetQueue = v10;
            }
            v20[0] = MEMORY[0x263EF8330];
            v20[1] = 3221225472;
            v20[2] = __51__GKDiscoveryPeerConnection_syncAcceptedConnection__block_invoke_35;
            v20[3] = &unk_2645B8568;
            v20[4] = v12;
            v20[5] = receiveDataHandler;
            dispatch_async(targetQueue, v20);
          }
          uint64_t v8 = [(NSMutableArray *)receivedDataHoldingQueue countByEnumeratingWithState:&v21 objects:v38 count:16];
        }
        while (v8);
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      __int16 v15 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = self->_connectionSocket;
        remoteServiceName = self->_remoteServiceName;
        if (remoteServiceName) {
          int v18 = [[(NSString *)remoteServiceName description] UTF8String];
        }
        else {
          int v18 = "<nil>";
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v27 = v14;
        __int16 v28 = 2080;
        __int16 v29 = "-[GKDiscoveryPeerConnection syncAcceptedConnection]";
        __int16 v30 = 1024;
        int v31 = 569;
        __int16 v32 = 2048;
        __int16 v33 = self;
        __int16 v34 = 2048;
        uint64_t v35 = v16;
        __int16 v36 = 2080;
        int v37 = v18;
        _os_log_impl(&dword_221563000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] receiveDataHandler is nil", buf, 0x3Au);
      }
    }
  }
  self->_connected = 1;
  double v19 = micro();
  [(GKSimpleTimer *)self->_heartbeatTimer fireIn:self->_heartbeatIntervalInSeconds fromNow:v19];
  [(GKSimpleTimer *)self->_heartbeatTimeoutTimer fireIn:self->_heartbeatIntervalInSeconds + self->_heartbeatIntervalInSeconds fromNow:v19];
}

void __51__GKDiscoveryPeerConnection_syncAcceptedConnection__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      __51__GKDiscoveryPeerConnection_syncAcceptedConnection__block_invoke_cold_1(v3, a1);
    }
  }
}

uint64_t __51__GKDiscoveryPeerConnection_syncAcceptedConnection__block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)syncSendMessageReceipt:(int)a3 sequenceNumber:(unsigned int)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  buf[0] = BYTE1(a3);
  buf[1] = a3;
  __int16 v13 = 256;
  uint64_t v14 = 0;
  char v15 = HIBYTE(a4);
  char v16 = BYTE2(a4);
  char v17 = BYTE1(a4);
  char v18 = a4;
  HIDWORD(v14) = bswap32(crc32(0, buf, 0x10u));
  uint64_t v7 = [MEMORY[0x263EFF8F8] dataWithBytes:buf length:16];
  connectionSocket = self->_connectionSocket;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__GKDiscoveryPeerConnection_syncSendMessageReceipt_sequenceNumber___block_invoke;
  v9[3] = &unk_2645B8590;
  v9[4] = self;
  int v10 = a3;
  unsigned int v11 = a4;
  [(GKAsyncSocket *)connectionSocket sendData:v7 withCompletionHandler:v9];
}

void __67__GKDiscoveryPeerConnection_syncSendMessageReceipt_sequenceNumber___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
      __67__GKDiscoveryPeerConnection_syncSendMessageReceipt_sequenceNumber___block_invoke_cold_1(v3, a1, v4);
    }
  }
}

- (void)syncProcessMessage:(int)a3 data:(id)a4 sequenceNumber:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v107 = *MEMORY[0x263EF8340];
  uint64_t v9 = (void *)MEMORY[0x223C85400](self, a2);
  if (a3 <= 2199)
  {
    if (a3 != 2000)
    {
      if (a3 == 2100)
      {
        double v10 = micro();
        [(GKSimpleTimer *)self->_timeoutTimer fireIn:self->_connectionTimeoutInSeconds fromNow:v10];
        [(GKDiscoveryPeerConnection *)self syncSendMessageReceipt:2100 sequenceNumber:v5];
        v78[0] = MEMORY[0x263EF8330];
        v78[1] = 3221225472;
        v78[2] = __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_4;
        v78[3] = &unk_2645B8608;
        v78[4] = a4;
        *(double *)&v78[5] = v10;
        if (!self->_connected)
        {
          -[NSMutableArray addObject:](self->_receivedDataHoldingQueue, "addObject:", (id)[v78 copy]);
          goto LABEL_78;
        }
        id receiveDataHandler = self->_receiveDataHandler;
        if (receiveDataHandler)
        {
          if (self->_targetQueue) {
            targetQueue = self->_targetQueue;
          }
          else {
            targetQueue = MEMORY[0x263EF83A0];
          }
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_5;
          block[3] = &unk_2645B8568;
          block[4] = v78;
          void block[5] = receiveDataHandler;
          dispatch_async(targetQueue, block);
          goto LABEL_78;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          goto LABEL_78;
        }
        uint64_t v37 = VRTraceErrorLogLevelToCSTR();
        v38 = *MEMORY[0x263F21098];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_78;
        }
        connectionSocket = self->_connectionSocket;
        remoteServiceName = self->_remoteServiceName;
        if (remoteServiceName) {
          int v41 = [[(NSString *)remoteServiceName description] UTF8String];
        }
        else {
          int v41 = "<nil>";
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v82 = v37;
        __int16 v83 = 2080;
        v84 = "-[GKDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:]";
        __int16 v85 = 1024;
        int v86 = 725;
        __int16 v87 = 2048;
        v88 = self;
        __int16 v89 = 2048;
        v90 = connectionSocket;
        __int16 v91 = 2080;
        v92 = v41;
        __int16 v46 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] receiveDataHandler is nil";
        char v47 = v38;
        uint32_t v48 = 58;
LABEL_45:
        _os_log_impl(&dword_221563000, v47, OS_LOG_TYPE_DEFAULT, v46, buf, v48);
        goto LABEL_78;
      }
LABEL_22:
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_78;
      }
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      long long v24 = *MEMORY[0x263F21098];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_78;
      }
      __int16 v25 = self->_connectionSocket;
      int v26 = self->_remoteServiceName;
      if (v26) {
        uint64_t v27 = [[(NSString *)v26 description] UTF8String];
      }
      else {
        uint64_t v27 = "<nil>";
      }
      *(_DWORD *)buf = 136316930;
      uint64_t v82 = v23;
      __int16 v83 = 2080;
      v84 = "-[GKDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:]";
      __int16 v85 = 1024;
      int v86 = 773;
      __int16 v87 = 2048;
      v88 = self;
      __int16 v89 = 2048;
      v90 = v25;
      __int16 v91 = 2080;
      v92 = v27;
      __int16 v93 = 1024;
      int v94 = a3;
      __int16 v95 = 1024;
      int v96 = [a4 length];
      __int16 v46 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] unrecognized message %u (body size=%u)";
      char v47 = v24;
      uint32_t v48 = 70;
      goto LABEL_45;
    }
    if ((unint64_t)[a4 length] <= 5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_77;
      }
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x263F21098];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        goto LABEL_77;
      }
      char v15 = self->_connectionSocket;
      char v16 = self->_remoteServiceName;
      if (v16) {
        char v17 = [[(NSString *)v16 description] UTF8String];
      }
      else {
        char v17 = "<nil>";
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v82 = v13;
      __int16 v83 = 2080;
      v84 = "-[GKDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:]";
      __int16 v85 = 1024;
      int v86 = 629;
      __int16 v87 = 2048;
      v88 = self;
      __int16 v89 = 2048;
      v90 = v15;
      __int16 v91 = 2080;
      v92 = v17;
      __int16 v93 = 1024;
      int v94 = [a4 length];
      v65 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] hello body too short: %u";
      __int16 v66 = v14;
      uint32_t v67 = 64;
LABEL_76:
      _os_log_error_impl(&dword_221563000, v66, OS_LOG_TYPE_ERROR, v65, buf, v67);
LABEL_77:
      [(GKDiscoveryPeerConnection *)self syncCloseConnectionNow];
      goto LABEL_78;
    }
    uint64_t v28 = [a4 bytes];
    unsigned int v29 = *(_DWORD *)v28;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      unsigned int v30 = bswap32(v29);
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      __int16 v32 = *MEMORY[0x263F21098];
      __int16 v33 = *MEMORY[0x263F21098];
      if (*MEMORY[0x263F21088])
      {
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v34 = self->_connectionSocket;
          uint64_t v35 = self->_remoteServiceName;
          if (v35) {
            __int16 v36 = [[(NSString *)v35 description] UTF8String];
          }
          else {
            __int16 v36 = "<nil>";
          }
          *(_DWORD *)buf = 136316674;
          uint64_t v82 = v31;
          __int16 v83 = 2080;
          v84 = "-[GKDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:]";
          __int16 v85 = 1024;
          int v86 = 637;
          __int16 v87 = 2048;
          v88 = self;
          __int16 v89 = 2048;
          v90 = v34;
          __int16 v91 = 2080;
          v92 = v36;
          __int16 v93 = 1024;
          int v94 = v30;
          _os_log_impl(&dword_221563000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] \t got Hello (flags = %08x)", buf, 0x40u);
        }
      }
      else if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        char v49 = self->_connectionSocket;
        char v50 = self->_remoteServiceName;
        if (v50) {
          unsigned int v51 = [[(NSString *)v50 description] UTF8String];
        }
        else {
          unsigned int v51 = "<nil>";
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v82 = v31;
        __int16 v83 = 2080;
        v84 = "-[GKDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:]";
        __int16 v85 = 1024;
        int v86 = 637;
        __int16 v87 = 2048;
        v88 = self;
        __int16 v89 = 2048;
        v90 = v49;
        __int16 v91 = 2080;
        v92 = v51;
        __int16 v93 = 1024;
        int v94 = v30;
        _os_log_debug_impl(&dword_221563000, v32, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] \t got Hello (flags = %08x)", buf, 0x40u);
      }
    }
    unsigned int v52 = __rev16(*(unsigned __int16 *)(v28 + 4));
    if ([a4 length] < (unint64_t)(v52 + 6))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_77;
      }
      uint64_t v53 = VRTraceErrorLogLevelToCSTR();
      char v54 = *MEMORY[0x263F21098];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        goto LABEL_77;
      }
      char v55 = self->_connectionSocket;
      uint64_t v56 = self->_remoteServiceName;
      if (v56) {
        v57 = [[(NSString *)v56 description] UTF8String];
      }
      else {
        v57 = "<nil>";
      }
      int v68 = [a4 length];
      *(_DWORD *)buf = 136316930;
      uint64_t v82 = v53;
      __int16 v83 = 2080;
      v84 = "-[GKDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:]";
      __int16 v85 = 1024;
      int v86 = 641;
      __int16 v87 = 2048;
      v88 = self;
      __int16 v89 = 2048;
      v90 = v55;
      __int16 v91 = 2080;
      v92 = v57;
      __int16 v93 = 1024;
      int v94 = v52;
      __int16 v95 = 1024;
      int v96 = v68;
      v65 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] hello body not enough for service name: %u+6 > %u";
      __int16 v66 = v54;
      uint32_t v67 = 70;
      goto LABEL_76;
    }
    uint64_t v58 = v28 + 6;
    if (*(unsigned char *)([a4 length] + v28 + 6 - 7))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_77;
      }
      uint64_t v59 = VRTraceErrorLogLevelToCSTR();
      __int16 v60 = *MEMORY[0x263F21098];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        goto LABEL_77;
      }
      v61 = self->_connectionSocket;
      __int16 v62 = self->_remoteServiceName;
      if (v62) {
        int v63 = [[(NSString *)v62 description] UTF8String];
      }
      else {
        int v63 = "<nil>";
      }
      int v69 = *(char *)(v28 + 6);
      int v70 = *(char *)(v28 + 7);
      int v71 = *(char *)(v28 + 8);
      int v72 = *(char *)(v58 + v52 - 3);
      int v73 = *(char *)(v58 + v52 - 2);
      int v74 = *(char *)(v58 + v52 - 1);
      *(_DWORD *)buf = 136318210;
      uint64_t v82 = v59;
      __int16 v83 = 2080;
      v84 = "-[GKDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:]";
      __int16 v85 = 1024;
      int v86 = 651;
      __int16 v87 = 2048;
      v88 = self;
      __int16 v89 = 2048;
      v90 = v61;
      __int16 v91 = 2080;
      v92 = v63;
      __int16 v93 = 1024;
      int v94 = v69;
      __int16 v95 = 1024;
      int v96 = v70;
      __int16 v97 = 1024;
      int v98 = v71;
      __int16 v99 = 1024;
      int v100 = v72;
      __int16 v101 = 1024;
      int v102 = v73;
      __int16 v103 = 1024;
      int v104 = v74;
      __int16 v105 = 1024;
      unsigned int v106 = v52;
      v65 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] remote name [%c%c%c..%c%c%c] not properly terminated at length=%u";
      __int16 v66 = v60;
      uint32_t v67 = 100;
      goto LABEL_76;
    }
    -[GKDiscoveryPeerConnection setRemoteServiceName:](self, "setRemoteServiceName:", [NSString stringWithUTF8String:v28 + 6]);
    [(GKDiscoveryPeerConnection *)self syncSendMessageReceipt:2000 sequenceNumber:v5];
    if (![(GKDiscoveryPeerConnection *)self shouldDecideAboutConnection]) {
      goto LABEL_78;
    }
    v80[0] = MEMORY[0x263EF8330];
    v80[1] = 3221225472;
    v80[2] = __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke;
    v80[3] = &unk_2645B85B8;
    v80[4] = self;
    id v64 = (id)[v80 copy];
    id connectedHandler = self->_connectedHandler;
    if (!connectedHandler) {
      goto LABEL_78;
    }
    self->_id connectedHandler = 0;
    unsigned int v44 = MEMORY[0x263EF83A0];
    if (self->_targetQueue) {
      unsigned int v44 = self->_targetQueue;
    }
    v79[0] = MEMORY[0x263EF8330];
    v79[1] = 3221225472;
    v79[2] = __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_3;
    v79[3] = &unk_2645B85E0;
    v79[4] = self;
    v79[5] = connectedHandler;
    v79[6] = v64;
    v45 = v79;
LABEL_42:
    dispatch_async(v44, v45);

    goto LABEL_78;
  }
  if (a3 != 2200)
  {
    if (a3 == 2300)
    {
      [(GKDiscoveryPeerConnection *)self syncSendMessageReceipt:2300 sequenceNumber:v5];
      goto LABEL_78;
    }
    goto LABEL_22;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    uint64_t v19 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = self->_connectionSocket;
      long long v21 = self->_remoteServiceName;
      if (v21) {
        long long v22 = [[(NSString *)v21 description] UTF8String];
      }
      else {
        long long v22 = "<nil>";
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v82 = v18;
      __int16 v83 = 2080;
      v84 = "-[GKDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:]";
      __int16 v85 = 1024;
      int v86 = 732;
      __int16 v87 = 2048;
      v88 = self;
      __int16 v89 = 2048;
      v90 = v20;
      __int16 v91 = 2080;
      v92 = v22;
      _os_log_impl(&dword_221563000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] got Accept", buf, 0x3Au);
    }
  }
  [(GKDiscoveryPeerConnection *)self syncSendMessageReceipt:2200 sequenceNumber:v5];
  v76[0] = MEMORY[0x263EF8330];
  v76[1] = 3221225472;
  v76[2] = __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_45;
  v76[3] = &unk_2645B85B8;
  v76[4] = self;
  id v42 = (id)[v76 copy];
  id connectedHandler = self->_connectedHandler;
  if (connectedHandler)
  {
    self->_id connectedHandler = 0;
    unsigned int v44 = MEMORY[0x263EF83A0];
    if (self->_targetQueue) {
      unsigned int v44 = self->_targetQueue;
    }
    v75[0] = MEMORY[0x263EF8330];
    v75[1] = 3221225472;
    v75[2] = __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_4_48;
    v75[3] = &unk_2645B85E0;
    v75[4] = self;
    v75[5] = connectedHandler;
    v75[6] = v42;
    v45 = v75;
    goto LABEL_42;
  }
LABEL_78:
}

void __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke(uint64_t a1, int a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(v6 + 32);
      uint64_t v8 = *(void **)(v6 + 8);
      if (v8) {
        uint64_t v9 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
      }
      else {
        uint64_t v9 = "<nil>";
      }
      double v10 = "declines";
      *(_DWORD *)buf = 136316930;
      uint64_t v20 = v4;
      long long v22 = "-[GKDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:]_block_invoke";
      __int16 v23 = 1024;
      unsigned int v11 = "close connection";
      int v24 = 672;
      uint64_t v26 = v6;
      __int16 v21 = 2080;
      if (a2) {
        double v10 = "approves";
      }
      __int16 v25 = 2048;
      if (a2) {
        unsigned int v11 = "accept connection";
      }
      __int16 v27 = 2048;
      uint64_t v28 = v7;
      __int16 v29 = 2080;
      unsigned int v30 = v9;
      __int16 v31 = 2080;
      __int16 v32 = v10;
      __int16 v33 = 2080;
      __int16 v34 = v11;
      _os_log_impl(&dword_221563000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] peer %s. Will %s", buf, 0x4Eu);
    }
  }
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(NSObject **)(v12 + 104);
  if (a2)
  {
    uint64_t v14 = v18;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    char v15 = __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_42;
  }
  else
  {
    uint64_t v14 = v17;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    char v15 = __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_2;
  }
  if (v13) {
    char v16 = v13;
  }
  else {
    char v16 = MEMORY[0x263EF83A0];
  }
  v14[2] = v15;
  v14[3] = &unk_2645B7C20;
  v14[4] = v12;
  dispatch_async(v16, v14);
}

uint64_t __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_42(uint64_t a1)
{
  [*(id *)(a1 + 32) syncSendAccept];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 syncAcceptedConnection];
}

uint64_t __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncCloseConnectionNow];
}

uint64_t __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[5] + 16))(a1[5], *(void *)(a1[4] + 8), 0, a1[6], 0);
}

uint64_t __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void, double))(a2 + 16))(a2, *(void *)(a1 + 32), 0, *(double *)(a1 + 40));
}

uint64_t __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_45(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 104);
  if (a2)
  {
    uint64_t v4 = v8;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    uint64_t v5 = __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_2_46;
  }
  else
  {
    uint64_t v4 = v7;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    uint64_t v5 = __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_3_47;
  }
  if (v3) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = MEMORY[0x263EF83A0];
  }
  void v4[2] = v5;
  v4[3] = &unk_2645B7C20;
  v4[4] = v2;
  dispatch_async(v6, v4);
}

uint64_t __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_2_46(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncAcceptedConnection];
}

uint64_t __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_3_47(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncCloseConnectionNow];
}

uint64_t __68__GKDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_4_48(void *a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, void, void))(a1[5] + 16))(a1[5], *(void *)(a1[4] + 8), 1, a1[6], 0);
}

- (void)timeout:(id)a3
{
  syncQueue = self->_syncQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  void v4[2] = __37__GKDiscoveryPeerConnection_timeout___block_invoke;
  v4[3] = &unk_2645B7C68;
  if (!syncQueue) {
    syncQueue = MEMORY[0x263EF83A0];
  }
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(syncQueue, v4);
}

void __37__GKDiscoveryPeerConnection_timeout___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v3 = (id *)(a1 + 40);
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v4 = (uint64_t)*(v3 - 1);
  if (v4 != v2[15])
  {
    if (v4 == v2[16])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x263F21098];
        char v15 = *MEMORY[0x263F21098];
        if (!*MEMORY[0x263F21088])
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            __37__GKDiscoveryPeerConnection_timeout___block_invoke_cold_1(v13, (uint64_t)v3);
          }
          goto LABEL_32;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = *v3;
          uint64_t v17 = *((void *)*v3 + 4);
          uint64_t v18 = (void *)*((void *)*v3 + 1);
          if (v18) {
            uint64_t v19 = (const char *)objc_msgSend((id)objc_msgSend(v18, "description"), "UTF8String");
          }
          else {
            uint64_t v19 = "<nil>";
          }
          *(_DWORD *)unsigned int v30 = 136316418;
          *(void *)&v30[4] = v13;
          *(_WORD *)&v30[12] = 2080;
          *(void *)&v30[14] = "-[GKDiscoveryPeerConnection timeout:]_block_invoke";
          *(_WORD *)&v30[22] = 1024;
          LODWORD(v31) = 787;
          WORD2(v31) = 2048;
          *(void *)((char *)&v31 + 6) = v16;
          HIWORD(v31) = 2048;
          uint64_t v32 = v17;
          *(_WORD *)__int16 v33 = 2080;
          *(void *)&v33[2] = v19;
          __int16 v29 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] heartbeat timeout timer hit";
          goto LABEL_31;
        }
      }
    }
    else
    {
      uint64_t v5 = v2[17];
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v4 != v5)
      {
        if (ErrorLogLevelForModule >= 7)
        {
          uint64_t v7 = VRTraceErrorLogLevelToCSTR();
          uint64_t v8 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            id v9 = *v3;
            uint64_t v10 = *((void *)*v3 + 4);
            unsigned int v11 = (void *)*((void *)*v3 + 1);
            if (v11) {
              uint64_t v12 = (const char *)objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
            }
            else {
              uint64_t v12 = "<nil>";
            }
            uint64_t v26 = *(void *)(a1 + 32);
            uint64_t v27 = *((void *)*v3 + 15);
            uint64_t v28 = *((void *)*v3 + 17);
            *(_DWORD *)unsigned int v30 = 136317186;
            *(void *)&v30[4] = v7;
            *(_WORD *)&v30[12] = 2080;
            *(void *)&v30[14] = "-[GKDiscoveryPeerConnection timeout:]_block_invoke";
            *(_WORD *)&v30[22] = 1024;
            LODWORD(v31) = 793;
            WORD2(v31) = 2048;
            *(void *)((char *)&v31 + 6) = v9;
            HIWORD(v31) = 2048;
            uint64_t v32 = v10;
            *(_WORD *)__int16 v33 = 2080;
            *(void *)&v33[2] = v12;
            *(_WORD *)&v33[10] = 2048;
            *(void *)&v33[12] = v26;
            __int16 v34 = 2048;
            uint64_t v35 = v27;
            __int16 v36 = 2048;
            uint64_t v37 = v28;
            _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] unknown timer[%p] hit (heartbeat[%p] timerout[%p]) ?", v30, 0x58u);
          }
        }
        return;
      }
      if (ErrorLogLevelForModule >= 8)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x263F21098];
        __int16 v21 = *MEMORY[0x263F21098];
        if (!*MEMORY[0x263F21088])
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            __37__GKDiscoveryPeerConnection_timeout___block_invoke_cold_2(v20, (uint64_t)v3);
          }
          goto LABEL_32;
        }
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = *v3;
          uint64_t v23 = *((void *)*v3 + 4);
          int v24 = (void *)*((void *)*v3 + 1);
          if (v24) {
            __int16 v25 = (const char *)objc_msgSend((id)objc_msgSend(v24, "description"), "UTF8String");
          }
          else {
            __int16 v25 = "<nil>";
          }
          *(_DWORD *)unsigned int v30 = 136316418;
          *(void *)&v30[4] = v20;
          *(_WORD *)&v30[12] = 2080;
          *(void *)&v30[14] = "-[GKDiscoveryPeerConnection timeout:]_block_invoke";
          *(_WORD *)&v30[22] = 1024;
          LODWORD(v31) = 790;
          WORD2(v31) = 2048;
          *(void *)((char *)&v31 + 6) = v22;
          HIWORD(v31) = 2048;
          uint64_t v32 = v23;
          *(_WORD *)__int16 v33 = 2080;
          *(void *)&v33[2] = v25;
          __int16 v29 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] timeout timer hit";
LABEL_31:
          _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, v29, v30, 0x3Au);
        }
      }
    }
LABEL_32:
    objc_msgSend(*v3, "syncCloseConnectionNow", *(_OWORD *)v30, *(void *)&v30[16], v31, v32, *(_OWORD *)v33);
    return;
  }
  [v2 syncSendMessage:2300 data:0 withCompletionHandler:0];
}

- (void)syncReceivedData:(id)a3 error:(id)a4
{
  uint64_t v6 = self;
  uint64_t v113 = *MEMORY[0x263EF8340];
  uint64_t v7 = MEMORY[0x223C85400](self, a2);
  uint64_t v8 = (void *)v7;
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_57;
    }
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint64_t v14 = *MEMORY[0x263F21098];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_57;
    }
    connectionSocket = v6->_connectionSocket;
    remoteServiceName = v6->_remoteServiceName;
    if (remoteServiceName)
    {
      uint64_t v17 = [[(NSString *)remoteServiceName description] UTF8String];
      if (a4)
      {
LABEL_9:
        uint64_t v18 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
LABEL_56:
        *(_DWORD *)buf = 136316674;
        uint64_t v90 = v13;
        __int16 v91 = 2080;
        v92 = "-[GKDiscoveryPeerConnection syncReceivedData:error:]";
        __int16 v93 = 1024;
        int v94 = 938;
        __int16 v95 = 2048;
        int v96 = v6;
        __int16 v97 = 2048;
        int v98 = connectionSocket;
        __int16 v99 = 2080;
        int v100 = v17;
        __int16 v101 = 2080;
        *(void *)int v102 = v18;
        _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] end of stream: %s", buf, 0x44u);
LABEL_57:
        id v64 = v6;
LABEL_82:
        [(GKDiscoveryPeerConnection *)v64 syncCloseConnectionNow];
        goto LABEL_83;
      }
    }
    else
    {
      uint64_t v17 = "<nil>";
      if (a4) {
        goto LABEL_9;
      }
    }
    uint64_t v18 = "<nil>";
    goto LABEL_56;
  }
  context = (void *)v7;
  double v9 = micro();
  [(GKSimpleTimer *)v6->_heartbeatTimer fireIn:v6->_heartbeatIntervalInSeconds fromNow:v9];
  [(GKSimpleTimer *)v6->_heartbeatTimeoutTimer fireIn:v6->_heartbeatIntervalInSeconds + v6->_heartbeatIntervalInSeconds fromNow:v9];
  [(NSMutableData *)v6->_dataReceived appendData:a3];
  uint64_t v10 = (unsigned __int16 *)[(NSMutableData *)v6->_dataReceived bytes];
  unsigned int v11 = [(NSMutableData *)v6->_dataReceived length];
  v88 = v6;
  if (v11 >= 0x10)
  {
    p_messageReceiptHandlerHoldingQueue = (id *)&v6->_messageReceiptHandlerHoldingQueue;
    p_messageReceiptHandlerList = (id *)&v6->_messageReceiptHandlerList;
    while (1)
    {
      unsigned int v19 = *v10;
      char v20 = *((unsigned char *)v10 + 3);
      unsigned int v21 = *((_DWORD *)v10 + 2);
      unint64_t v22 = bswap32(*((_DWORD *)v10 + 1));
      int v23 = *((unsigned __int8 *)v10 + 12);
      int v24 = *((unsigned __int8 *)v10 + 13);
      int v25 = *((unsigned __int8 *)v10 + 14);
      int v26 = *((unsigned __int8 *)v10 + 15);
      if (+[GKDiscoveryPeerConnection receiveDataLimit] < v22)
      {
        uint64_t v8 = context;
        uint64_t v6 = v88;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v43 = VRTraceErrorLogLevelToCSTR();
          unsigned int v44 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
          {
            v45 = v88->_connectionSocket;
            __int16 v46 = v88->_remoteServiceName;
            if (v46) {
              char v47 = [[(NSString *)v46 description] UTF8String];
            }
            else {
              char v47 = "<nil>";
            }
            int v74 = +[GKDiscoveryPeerConnection receiveDataLimit];
            *(_DWORD *)buf = 136316930;
            uint64_t v90 = v43;
            __int16 v91 = 2080;
            v92 = "-[GKDiscoveryPeerConnection syncReceivedData:error:]";
            __int16 v93 = 1024;
            int v94 = 851;
            __int16 v95 = 2048;
            int v96 = v88;
            __int16 v97 = 2048;
            int v98 = v45;
            __int16 v99 = 2080;
            int v100 = v47;
            __int16 v101 = 1024;
            *(_DWORD *)int v102 = v22;
            *(_WORD *)&v102[4] = 1024;
            *(_DWORD *)&v102[6] = v74;
            _os_log_error_impl(&dword_221563000, v44, OS_LOG_TYPE_ERROR, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] message too big %u > %u", buf, 0x46u);
          }
        }
        goto LABEL_57;
      }
      if (v22 > v11 - 16) {
        goto LABEL_3;
      }
      uint64_t v27 = (v26 | (v24 << 16) | (v25 << 8)) & 0xFFFFFF | (v23 << 24);
      if (v23 << 24 < 0) {
        break;
      }
      int v28 = v20 & 1;
      if (v28 && v22)
      {
        uint64_t v8 = context;
        uint32_t v48 = v88;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v54 = VRTraceErrorLogLevelToCSTR();
          char v50 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
          {
            char v55 = v88->_connectionSocket;
            uint64_t v56 = v88->_remoteServiceName;
            if (v56) {
              v57 = [[(NSString *)v56 description] UTF8String];
            }
            else {
              v57 = "<nil>";
            }
            *(_DWORD *)buf = 136316674;
            uint64_t v90 = v54;
            __int16 v91 = 2080;
            v92 = "-[GKDiscoveryPeerConnection syncReceivedData:error:]";
            __int16 v93 = 1024;
            int v94 = 867;
            __int16 v95 = 2048;
            int v96 = v88;
            __int16 v97 = 2048;
            int v98 = v55;
            __int16 v99 = 2080;
            int v100 = v57;
            __int16 v101 = 1024;
            *(_DWORD *)int v102 = v22;
            v75 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] receipt has body size %u";
            goto LABEL_80;
          }
        }
        goto LABEL_81;
      }
      unsigned int v29 = bswap32(v21);
      *((_DWORD *)v10 + 2) = 0;
      unsigned int v30 = v22 + 16;
      int v31 = crc32(0, (const Bytef *)v10, (int)v22 + 16);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v86 = VRTraceErrorLogLevelToCSTR();
        uint64_t v32 = *MEMORY[0x263F21098];
        __int16 v33 = *MEMORY[0x263F21098];
        if (*MEMORY[0x263F21088])
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v82 = v88->_connectionSocket;
            __int16 v34 = v88->_remoteServiceName;
            if (v34) {
              v77 = [[(NSString *)v34 description] UTF8String];
            }
            else {
              v77 = "<nil>";
            }
            int v81 = [(NSMutableArray *)v88->_messageReceiptHandlerHoldingQueue count];
            int v38 = [(NSMutableArray *)v88->_messageReceiptHandlerList count];
            *(_DWORD *)buf = 136318210;
            uint64_t v90 = v86;
            __int16 v91 = 2080;
            v92 = "-[GKDiscoveryPeerConnection syncReceivedData:error:]";
            __int16 v93 = 1024;
            int v94 = 875;
            __int16 v95 = 2048;
            int v96 = v88;
            __int16 v97 = 2048;
            int v98 = v82;
            __int16 v99 = 2080;
            int v100 = v79;
            __int16 v101 = 1024;
            *(_DWORD *)int v102 = v27;
            *(_WORD *)&v102[4] = 1024;
            *(_DWORD *)&v102[6] = v22;
            __int16 v103 = 1024;
            int v104 = v31;
            __int16 v105 = 1024;
            unsigned int v106 = v29;
            __int16 v107 = 1024;
            int v108 = v28;
            __int16 v109 = 1024;
            int v110 = v81;
            __int16 v111 = 1024;
            int v112 = v38;
            _os_log_impl(&dword_221563000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] receivedData got message #%u (bodylen=%u) crc==given[%08X==%08X]? (receipt(%u) Q[%u] L[%u])", buf, 0x64u);
          }
        }
        else if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          __int16 v83 = v88->_connectionSocket;
          uint64_t v35 = v88->_remoteServiceName;
          __int16 v36 = "<nil>";
          if (v35) {
            __int16 v36 = [[(NSString *)v35 description] UTF8String];
          }
          int v80 = [(NSMutableArray *)v88->_messageReceiptHandlerHoldingQueue count];
          int v37 = [(NSMutableArray *)v88->_messageReceiptHandlerList count];
          *(_DWORD *)buf = 136318210;
          uint64_t v90 = v86;
          __int16 v91 = 2080;
          v92 = "-[GKDiscoveryPeerConnection syncReceivedData:error:]";
          __int16 v93 = 1024;
          int v94 = 875;
          __int16 v95 = 2048;
          int v96 = v88;
          __int16 v97 = 2048;
          int v98 = v83;
          __int16 v99 = 2080;
          int v100 = v78;
          __int16 v101 = 1024;
          *(_DWORD *)int v102 = v27;
          *(_WORD *)&v102[4] = 1024;
          *(_DWORD *)&v102[6] = v22;
          __int16 v103 = 1024;
          int v104 = v31;
          __int16 v105 = 1024;
          unsigned int v106 = v29;
          __int16 v107 = 1024;
          int v108 = v28;
          __int16 v109 = 1024;
          int v110 = v80;
          __int16 v111 = 1024;
          int v112 = v37;
          _os_log_debug_impl(&dword_221563000, v32, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] receivedData got message #%u (bodylen=%u) crc==given[%08X==%08X]? (receipt(%u) Q[%u] L[%u])", buf, 0x64u);
        }
      }
      if (v29 != v31)
      {
        uint64_t v8 = context;
        uint64_t v58 = v88;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v59 = VRTraceErrorLogLevelToCSTR();
          __int16 v60 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
          {
            v61 = v88->_connectionSocket;
            __int16 v62 = v88->_remoteServiceName;
            if (v62) {
              int v63 = [[(NSString *)v62 description] UTF8String];
            }
            else {
              int v63 = "<nil>";
            }
            *(_DWORD *)buf = 136316418;
            uint64_t v90 = v59;
            __int16 v91 = 2080;
            v92 = "-[GKDiscoveryPeerConnection syncReceivedData:error:]";
            __int16 v93 = 1024;
            int v94 = 877;
            __int16 v95 = 2048;
            int v96 = v88;
            __int16 v97 = 2048;
            int v98 = v61;
            __int16 v99 = 2080;
            int v100 = v63;
            v76 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] invalid checksum";
LABEL_77:
            _os_log_error_impl(&dword_221563000, v60, OS_LOG_TYPE_ERROR, v76, buf, 0x3Au);
          }
        }
LABEL_60:
        id v64 = v58;
        goto LABEL_82;
      }
      uint64_t v39 = __rev16(v19);
      if (v28)
      {
        if ((v39 != 2100
           || (v40 = p_messageReceiptHandlerHoldingQueue, ![*p_messageReceiptHandlerHoldingQueue count]))
          && (v40 = p_messageReceiptHandlerList, ![*p_messageReceiptHandlerList count])
          || (int v41 = (uint64_t (**)(id, void))(id)[*v40 objectAtIndexedSubscript:0], objc_msgSend(*v40, "removeObjectAtIndex:", 0), !v41))
        {
          uint64_t v8 = context;
          uint64_t v58 = v88;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v65 = VRTraceErrorLogLevelToCSTR();
            __int16 v60 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
            {
              int v71 = v88->_connectionSocket;
              int v72 = v88->_remoteServiceName;
              if (v72) {
                int v73 = [[(NSString *)v72 description] UTF8String];
              }
              else {
                int v73 = "<nil>";
              }
              *(_DWORD *)buf = 136316418;
              uint64_t v90 = v65;
              __int16 v91 = 2080;
              v92 = "-[GKDiscoveryPeerConnection syncReceivedData:error:]";
              __int16 v93 = 1024;
              int v94 = 894;
              __int16 v95 = 2048;
              int v96 = v88;
              __int16 v97 = 2048;
              int v98 = v71;
              __int16 v99 = 2080;
              int v100 = v73;
              v76 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] message receipt has no matching handler";
              goto LABEL_77;
            }
          }
          goto LABEL_60;
        }
        char v42 = v41[2](v41, v27);

        if ((v42 & 1) == 0)
        {
          int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
          uint64_t v8 = context;
          uint32_t v48 = v88;
          if (ErrorLogLevelForModule >= 3)
          {
            uint64_t v67 = VRTraceErrorLogLevelToCSTR();
            char v50 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
            {
              int v68 = v88->_connectionSocket;
              int v69 = v88->_remoteServiceName;
              if (v69) {
                int v70 = [[(NSString *)v69 description] UTF8String];
              }
              else {
                int v70 = "<nil>";
              }
              *(_DWORD *)buf = 136316674;
              uint64_t v90 = v67;
              __int16 v91 = 2080;
              v92 = "-[GKDiscoveryPeerConnection syncReceivedData:error:]";
              __int16 v93 = 1024;
              int v94 = 902;
              __int16 v95 = 2048;
              int v96 = v88;
              __int16 v97 = 2048;
              int v98 = v68;
              __int16 v99 = 2080;
              int v100 = v70;
              __int16 v101 = 1024;
              *(_DWORD *)int v102 = v27;
              v75 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] unexpected sequence number [%d]";
              goto LABEL_80;
            }
          }
          goto LABEL_81;
        }
      }
      else
      {
        -[GKDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:](v88, "syncProcessMessage:data:sequenceNumber:", v39, [MEMORY[0x263EFF8F8] dataWithBytes:v10 + 8 length:v22], v27);
      }
      uint64_t v10 = (unsigned __int16 *)((char *)v10 + v30);
      v11 -= v30;
      if (v11 <= 0xF) {
        goto LABEL_3;
      }
    }
    uint64_t v8 = context;
    uint32_t v48 = v88;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v49 = VRTraceErrorLogLevelToCSTR();
      char v50 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
      {
        unsigned int v51 = v88->_connectionSocket;
        unsigned int v52 = v88->_remoteServiceName;
        if (v52) {
          uint64_t v53 = [[(NSString *)v52 description] UTF8String];
        }
        else {
          uint64_t v53 = "<nil>";
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v90 = v49;
        __int16 v91 = 2080;
        v92 = "-[GKDiscoveryPeerConnection syncReceivedData:error:]";
        __int16 v93 = 1024;
        int v94 = 861;
        __int16 v95 = 2048;
        int v96 = v88;
        __int16 v97 = 2048;
        int v98 = v51;
        __int16 v99 = 2080;
        int v100 = v53;
        __int16 v101 = 1024;
        *(_DWORD *)int v102 = v27;
        v75 = " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] invalidSequenceNumber [%u]";
LABEL_80:
        _os_log_error_impl(&dword_221563000, v50, OS_LOG_TYPE_ERROR, v75, buf, 0x40u);
      }
    }
LABEL_81:
    id v64 = v48;
    goto LABEL_82;
  }
LABEL_3:
  uint64_t v12 = [(NSMutableData *)v88->_dataReceived length];
  uint64_t v8 = context;
  if (v12 != v11) {
    -[NSMutableData replaceBytesInRange:withBytes:length:](v88->_dataReceived, "replaceBytesInRange:withBytes:length:", 0, v12 - v11, 0, 0);
  }
LABEL_83:
}

- (void)syncCloseConnectionNow
{
  v11[1] = *MEMORY[0x263EF8340];
  self->_connected = 0;
  [(GKAsyncSocket *)self->_connectionSocket invalidate];

  self->_connectionSocket = 0;
  self->_remoteServiceName = 0;
  -[NSMutableData replaceBytesInRange:withBytes:length:](self->_dataReceived, "replaceBytesInRange:withBytes:length:", 0, [(NSMutableData *)self->_dataReceived length], 0, 0);
  -[NSMutableData replaceBytesInRange:withBytes:length:](self->_dataToSendHoldingQueue, "replaceBytesInRange:withBytes:length:", 0, [(NSMutableData *)self->_dataToSendHoldingQueue length], 0, 0);
  [(GKSimpleTimer *)self->_heartbeatTimer invalidate];

  self->_heartbeatTimer = 0;
  [(GKSimpleTimer *)self->_heartbeatTimeoutTimer invalidate];

  self->_heartbeatTimeoutTimer = 0;
  [(GKSimpleTimer *)self->_timeoutTimer invalidate];

  self->_timeoutTimer = 0;
  messageReceiptHandlerList = self->_messageReceiptHandlerList;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__GKDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke;
  v9[3] = &unk_2645B8630;
  v9[4] = self;
  [(NSMutableArray *)messageReceiptHandlerList enumerateObjectsUsingBlock:v9];
  messageReceiptHandlerHoldingQueue = self->_messageReceiptHandlerHoldingQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__GKDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_51;
  v8[3] = &unk_2645B8630;
  v8[4] = self;
  [(NSMutableArray *)messageReceiptHandlerHoldingQueue enumerateObjectsUsingBlock:v8];
  [(NSMutableArray *)self->_messageReceiptHandlerList removeAllObjects];
  [(NSMutableArray *)self->_messageReceiptHandlerHoldingQueue removeAllObjects];
  id connectedHandler = self->_connectedHandler;
  if (connectedHandler)
  {
    self->_id connectedHandler = 0;
    if (self->_targetQueue) {
      targetQueue = self->_targetQueue;
    }
    else {
      targetQueue = MEMORY[0x263EF83A0];
    }
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    void v7[2] = __51__GKDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_53;
    v7[3] = &unk_2645B8400;
    v7[4] = connectedHandler;
    dispatch_async(targetQueue, v7);
  }
  else if (self->_receiveDataHandler)
  {
    uint64_t v10 = *MEMORY[0x263F08320];
    v11[0] = @"Connection closed";
    objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"GKDiscoveryPeerConnection", -5, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1));
    (*((void (**)(double))self->_receiveDataHandler + 2))(0.0);
  }
}

void __51__GKDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (*(void *)(*(void *)(a1 + 32) + 112)) {
      uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 112);
    }
    else {
      uint64_t v3 = MEMORY[0x263EF83A0];
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__GKDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_2;
    block[3] = &unk_2645B8400;
    block[4] = a2;
    dispatch_async(v3, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(v6 + 32);
      uint64_t v8 = *(void **)(v6 + 8);
      if (v8) {
        double v9 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
      }
      else {
        double v9 = "<nil>";
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v12 = v4;
      __int16 v13 = 2080;
      uint64_t v14 = "-[GKDiscoveryPeerConnection syncCloseConnectionNow]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 973;
      __int16 v17 = 2048;
      uint64_t v18 = v6;
      __int16 v19 = 2048;
      uint64_t v20 = v7;
      __int16 v21 = 2080;
      unint64_t v22 = v9;
      _os_log_impl(&dword_221563000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] receiptHander should not be nil", buf, 0x3Au);
    }
  }
}

uint64_t __51__GKDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__GKDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_51(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (*(void *)(*(void *)(a1 + 32) + 112)) {
      uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 112);
    }
    else {
      uint64_t v3 = MEMORY[0x263EF83A0];
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__GKDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_2_52;
    block[3] = &unk_2645B8400;
    block[4] = a2;
    dispatch_async(v3, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(v6 + 32);
      uint64_t v8 = *(void **)(v6 + 8);
      if (v8) {
        double v9 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
      }
      else {
        double v9 = "<nil>";
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v12 = v4;
      __int16 v13 = 2080;
      uint64_t v14 = "-[GKDiscoveryPeerConnection syncCloseConnectionNow]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 983;
      __int16 v17 = 2048;
      uint64_t v18 = v6;
      __int16 v19 = 2048;
      uint64_t v20 = v7;
      __int16 v21 = 2080;
      unint64_t v22 = v9;
      _os_log_impl(&dword_221563000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] receiptHandler should not be nil", buf, 0x3Au);
    }
  }
}

uint64_t __51__GKDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_2_52(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__GKDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_53(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F08320];
  v4[0] = @"Unable to connect";
  objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"GKDiscoveryPeerConnection", -4, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  syncQueue = MEMORY[0x263EF83A0];
  if (self->_syncQueue) {
    syncQueue = self->_syncQueue;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__GKDiscoveryPeerConnection_invalidate__block_invoke;
  block[3] = &unk_2645B7C20;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __39__GKDiscoveryPeerConnection_invalidate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 96) = 0;
  *(void *)(*(void *)(a1 + 32) + 88) = 0;
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 syncCloseConnectionNow];
}

- (void)dealloc
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      connectionSocket = self->_connectionSocket;
      remoteServiceName = self->_remoteServiceName;
      if (remoteServiceName) {
        uint64_t v7 = [[(NSString *)remoteServiceName description] UTF8String];
      }
      else {
        uint64_t v7 = "<nil>";
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v14 = v3;
      __int16 v15 = 2080;
      int v16 = "-[GKDiscoveryPeerConnection dealloc]";
      __int16 v17 = 1024;
      int v18 = 1020;
      __int16 v19 = 2048;
      uint64_t v20 = self;
      __int16 v21 = 2048;
      unint64_t v22 = connectionSocket;
      __int16 v23 = 2080;
      int v24 = v7;
      _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] deallocating peerConnection object", buf, 0x3Au);
    }
  }
  [(GKDiscoveryPeerConnection *)self syncCloseConnectionNow];
  id connectedHandler = self->_connectedHandler;
  if (connectedHandler) {

  }
  id receiveDataHandler = self->_receiveDataHandler;
  if (receiveDataHandler) {

  }
  syncQueue = self->_syncQueue;
  if (syncQueue) {
    dispatch_release(syncQueue);
  }
  targetQueue = self->_targetQueue;
  if (targetQueue) {
    dispatch_release(targetQueue);
  }
  v12.receiver = self;
  v12.super_class = (Class)GKDiscoveryPeerConnection;
  [(GKDiscoveryPeerConnection *)&v12 dealloc];
}

- (void)sendData:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (a3)
  {
    unsigned int v7 = [a3 length];
    if (+[GKDiscoveryPeerConnection sendDataLimit] >= v7)
    {
      id v11 = (id)[a4 copy];
      syncQueue = self->_syncQueue;
      if (!syncQueue) {
        syncQueue = MEMORY[0x263EF83A0];
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __60__GKDiscoveryPeerConnection_sendData_withCompletionHandler___block_invoke;
      block[3] = &unk_2645B8428;
      block[4] = self;
      void block[5] = a3;
      void block[6] = v11;
      dispatch_async(syncQueue, block);
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        double v9 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
        {
          connectionSocket = self->_connectionSocket;
          remoteServiceName = self->_remoteServiceName;
          if (remoteServiceName) {
            __int16 v15 = [[(NSString *)remoteServiceName description] UTF8String];
          }
          else {
            __int16 v15 = "<nil>";
          }
          *(_DWORD *)buf = 136316674;
          uint64_t v20 = v8;
          __int16 v21 = 2080;
          unint64_t v22 = "-[GKDiscoveryPeerConnection sendData:withCompletionHandler:]";
          __int16 v23 = 1024;
          int v24 = 1055;
          __int16 v25 = 2048;
          int v26 = self;
          __int16 v27 = 2048;
          int v28 = connectionSocket;
          __int16 v29 = 2080;
          unsigned int v30 = v15;
          __int16 v31 = 1024;
          unsigned int v32 = v7;
          _os_log_error_impl(&dword_221563000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] message too big to send (length=%u)", buf, 0x40u);
        }
      }
      uint64_t v17 = *MEMORY[0x263F08320];
      int v18 = @"Message is too big to send";
      (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"GKDiscoveryPeerConnection", -6, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1)));
    }
  }
  else
  {
    uint64_t v10 = (void (*)(id, void))*((void *)a4 + 2);
    v10(a4, 0);
  }
}

uint64_t __60__GKDiscoveryPeerConnection_sendData_withCompletionHandler___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 136) fireIn:*(double *)(a1[4] + 144) fromNow:micro()];
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  return [v2 syncSendMessage:2100 data:v3 withCompletionHandler:v4];
}

+ (void)checkConstants
{
  double v2 = micro();
  if (*(double *)&gkdpc_constantsUpdateTime == 0.0 || v2 - *(double *)&gkdpc_constantsUpdateTime > 10.0)
  {
    gkdpc_constantsUpdateTime = *(void *)&v2;
    CFPreferencesAppSynchronize(@"com.apple.gamed");
    Boolean keyExistsAndHasValidFormat = -86;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"GKDiscoverySendDataLimit", @"com.apple.gamed", &keyExistsAndHasValidFormat);
    BOOL v5 = AppIntegerValue <= 0 || keyExistsAndHasValidFormat == 0;
    uint64_t v6 = 20971520;
    if (!v5) {
      uint64_t v6 = AppIntegerValue;
    }
    gkdpc_sendDataLimit = v6;
    CFIndex v7 = CFPreferencesGetAppIntegerValue(@"GKDiscoveryReceiveDataLimit", @"com.apple.gamed", &keyExistsAndHasValidFormat);
    BOOL v8 = v7 <= 0 || keyExistsAndHasValidFormat == 0;
    uint64_t v9 = 83886080;
    if (!v8) {
      uint64_t v9 = v7;
    }
    gkdpc_receiveDataLimit = v9;
  }
}

+ (unint64_t)sendDataLimit
{
  double v2 = objc_opt_class();
  objc_sync_enter(v2);
  +[GKDiscoveryPeerConnection checkConstants];
  unint64_t v3 = gkdpc_sendDataLimit;
  objc_sync_exit(v2);
  return v3;
}

+ (unint64_t)receiveDataLimit
{
  double v2 = objc_opt_class();
  objc_sync_enter(v2);
  +[GKDiscoveryPeerConnection checkConstants];
  unint64_t v3 = gkdpc_receiveDataLimit;
  objc_sync_exit(v2);
  return v3;
}

- (NSString)remoteServiceName
{
  return self->_remoteServiceName;
}

- (void)setRemoteServiceName:(id)a3
{
}

- (NSString)localServiceName
{
  return self->_localServiceName;
}

- (void)setLocalServiceName:(id)a3
{
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (id)connectedHandler
{
  return self->_connectedHandler;
}

- (void)setConnectedHandler:(id)a3
{
}

- (id)receiveDataHandler
{
  return self->_receiveDataHandler;
}

- (void)setReceiveDataHandler:(id)a3
{
}

- (void)syncConnected:.cold.1()
{
  OUTLINED_FUNCTION_7();
  v1 = *(void **)(v0 + 8);
  if (v1) {
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_3(&dword_221563000, v2, v3, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] socket connect failed", v4, v5, v6, v7, v8);
}

- (void)shouldDecideAboutConnection
{
  OUTLINED_FUNCTION_7();
  uint64_t v2 = *(void **)(v1 + 8);
  if (v2) {
    objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String");
  }
  uint64_t v3 = *(void **)(v0 + 16);
  if (v3) {
    objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
  }
  uint64_t v4 = *(void **)(v0 + 8);
  if (v4) {
    objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_7_2(&dword_221563000, v5, v6, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] local [%s] and remote [%s] service name are equal - this should NOT happen", v7, v8, v9, v10, v11);
}

void __51__GKDiscoveryPeerConnection_syncAcceptedConnection__block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(*(void *)(a2 + 32) + 8);
  if (v2) {
    objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_6_3(&dword_221563000, v3, v4, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] failed to send queued messages", v5, v6, v7, v8, v9);
}

void __67__GKDiscoveryPeerConnection_syncSendMessageReceipt_sequenceNumber___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(v6 + 32);
  uint64_t v8 = *(void **)(v6 + 8);
  if (v8) {
    uint8_t v9 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
  }
  else {
    uint8_t v9 = "<nil>";
  }
  int v10 = *(_DWORD *)(a2 + 40);
  int v11 = *(_DWORD *)(a2 + 44);
  int v12 = 136316930;
  uint64_t v13 = a1;
  __int16 v14 = 2080;
  __int16 v15 = "-[GKDiscoveryPeerConnection syncSendMessageReceipt:sequenceNumber:]_block_invoke";
  __int16 v16 = 1024;
  int v17 = 608;
  __int16 v18 = 2048;
  uint64_t v19 = v6;
  __int16 v20 = 2048;
  uint64_t v21 = v7;
  __int16 v22 = 2080;
  __int16 v23 = v9;
  __int16 v24 = 1024;
  int v25 = v10;
  __int16 v26 = 1024;
  int v27 = v11;
  _os_log_error_impl(&dword_221563000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] failed to send receipt %d:%08X", (uint8_t *)&v12, 0x46u);
}

void __37__GKDiscoveryPeerConnection_timeout___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)OUTLINED_FUNCTION_9_1(a2, *MEMORY[0x263EF8340]);
  if (v2) {
    objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8_3(&dword_221563000, v3, v4, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] heartbeat timeout timer hit", v5, v6, v7, v8, v9);
}

void __37__GKDiscoveryPeerConnection_timeout___block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)OUTLINED_FUNCTION_9_1(a2, *MEMORY[0x263EF8340]);
  if (v2) {
    objc_msgSend((id)objc_msgSend(v2, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8_3(&dword_221563000, v3, v4, " [%s] %s:%d ptr [%p] socketPtr [%p] remote [%s] timeout timer hit", v5, v6, v7, v8, v9);
}

@end