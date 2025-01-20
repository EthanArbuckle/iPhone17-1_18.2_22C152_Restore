@interface MCNearbyDiscoveryPeerConnection
- (BOOL)shouldDecideAboutConnection;
- (MCNearbyDiscoveryPeerConnection)initWithLocalServiceName:(id)a3;
- (NSInputStream)inputStream;
- (NSOutputStream)outputStream;
- (NSString)localServiceName;
- (NSString)remoteServiceName;
- (OS_dispatch_queue)syncQueue;
- (OS_dispatch_queue)targetQueue;
- (id)connectedHandler;
- (id)receiveDataHandler;
- (id)stringForStreamEventCode:(unint64_t)a3;
- (int)socketForStream:(id)a3;
- (void)attachInputStream:(id)a3 outputStream:(id)a4;
- (void)connectToNetService:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)sendData:(id)a3 withCompletionHandler:(id)a4;
- (void)setConnectedHandler:(id)a3;
- (void)setInputStream:(id)a3;
- (void)setLocalServiceName:(id)a3;
- (void)setOutputStream:(id)a3;
- (void)setReceiveDataHandler:(id)a3;
- (void)setRemoteServiceName:(id)a3;
- (void)setSyncQueue:(id)a3;
- (void)setTargetQueue:(id)a3;
- (void)setupInputStream:(id)a3 outputStream:(id)a4;
- (void)shouldDecideAboutConnection;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)syncAcceptedConnection;
- (void)syncAppendDataToSend:(id)a3;
- (void)syncCloseConnectionNow;
- (void)syncHandleInputStreamEvent:(unint64_t)a3;
- (void)syncHandleOutputStreamEvent:(unint64_t)a3;
- (void)syncHandleStreamEventOpenCompleted:(id)a3;
- (void)syncProcessMessage:(int)a3 data:(id)a4 sequenceNumber:(unsigned int)a5;
- (void)syncReadFromInputStream;
- (void)syncReceivedData:(id)a3 error:(id)a4;
- (void)syncSendAccept;
- (void)syncSendData;
- (void)syncSendHello;
- (void)syncSendMessage:(int)a3 data:(id)a4 withCompletionHandler:(id)a5;
- (void)syncSendMessageReceipt:(int)a3 sequenceNumber:(unsigned int)a4;
@end

@implementation MCNearbyDiscoveryPeerConnection

- (MCNearbyDiscoveryPeerConnection)initWithLocalServiceName:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)MCNearbyDiscoveryPeerConnection;
  v4 = [(MCNearbyDiscoveryPeerConnection *)&v13 init];
  if (v4)
  {
    v5 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
    v4->_dataReceived = v5;
    if (!v5) {
      goto LABEL_10;
    }
    v6 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
    v4->_dataToSend = v6;
    if (!v6) {
      goto LABEL_10;
    }
    v7 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
    v4->_dataToSendHoldingQueue = v7;
    if (!v7) {
      goto LABEL_10;
    }
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v4->_receivedDataHoldingQueue = v8;
    if (!v8) {
      goto LABEL_10;
    }
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v4->_receivedDataContentHoldingQueue = v9;
    if (v9
      && (v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]), (v4->_messageReceiptHandlerList = v10) != 0)
      && (v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]),
          (v4->_messageReceiptHandlerHoldingQueue = v11) != 0))
    {
      [(MCNearbyDiscoveryPeerConnection *)v4 setLocalServiceName:a3];
    }
    else
    {
LABEL_10:

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

- (void)syncAppendDataToSend:(id)a3
{
  [(NSMutableData *)self->_dataToSend appendData:a3];
  if (self->_readyToWrite)
  {
    [(MCNearbyDiscoveryPeerConnection *)self syncSendData];
  }
}

- (void)setupInputStream:(id)a3 outputStream:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [a3 setDelegate:self];
  [a4 setDelegate:self];
  v7 = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
  if (self->_syncQueue) {
    syncQueue = self->_syncQueue;
  }
  else {
    syncQueue = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
  }
  MEMORY[0x21D4714A0](a3, syncQueue);
  if (self->_syncQueue) {
    v9 = self->_syncQueue;
  }
  else {
    v9 = v7;
  }
  MEMORY[0x21D471590](a4, v9);
  uint64_t v10 = *MEMORY[0x263EFC7A8];
  uint64_t v11 = MEMORY[0x263EFFA88];
  [a3 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263EFC7A8]];
  [a4 setProperty:v11 forKey:v10];
  self->_shouldSendHello = 1;
  v12 = mcdpc_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134218240;
    id v14 = a3;
    __int16 v15 = 2048;
    id v16 = a4;
    _os_log_impl(&dword_218756000, v12, OS_LOG_TYPE_DEFAULT, "Opening input [%p]/output [%p] streams.", (uint8_t *)&v13, 0x16u);
  }
  [a3 open];
  [a4 open];
}

- (void)connectToNetService:(id)a3
{
  syncQueue = self->_syncQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__MCNearbyDiscoveryPeerConnection_connectToNetService___block_invoke;
  v4[3] = &unk_264337D58;
  if (!syncQueue) {
    syncQueue = MEMORY[0x263EF83A0];
  }
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(syncQueue, v4);
}

void __55__MCNearbyDiscoveryPeerConnection_connectToNetService___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = mcdpc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) name];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(v4 + 8);
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    _os_log_impl(&dword_218756000, v2, OS_LOG_TYPE_DEFAULT, "Requesting connection with netService with name [%@] ptr [%p] remote [%@].", buf, 0x20u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (*(void *)(v6 + 40) || *(void *)(v6 + 48))
  {
    v7 = mcdpc_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218756000, v7, OS_LOG_TYPE_DEFAULT, "Already connected!", buf, 2u);
    }
  }
  else
  {
    *(unsigned char *)(v6 + 24) = 0;
    *(unsigned char *)(*(void *)(a1 + 40) + 25) = 0;
    id v8 = 0;
    *(void *)buf = 0;
    [*(id *)(a1 + 32) getInputStream:buf outputStream:&v8];
    [*(id *)(a1 + 40) setupInputStream:*(void *)buf outputStream:v8];
    [*(id *)(a1 + 40) setInputStream:*(void *)buf];
    [*(id *)(a1 + 40) setOutputStream:v8];
  }
}

- (void)attachInputStream:(id)a3 outputStream:(id)a4
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__MCNearbyDiscoveryPeerConnection_attachInputStream_outputStream___block_invoke;
  block[3] = &unk_264337D80;
  if (!syncQueue) {
    syncQueue = MEMORY[0x263EF83A0];
  }
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(syncQueue, block);
}

void __66__MCNearbyDiscoveryPeerConnection_attachInputStream_outputStream___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = mcdpc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v5 = *(void *)(a1 + 48);
    int v8 = 138412802;
    uint64_t v9 = v4;
    __int16 v10 = 2048;
    uint64_t v11 = v3;
    __int16 v12 = 2048;
    uint64_t v13 = v5;
    _os_log_impl(&dword_218756000, v2, OS_LOG_TYPE_DEFAULT, "Responding connection sequence - remoteServiceName [%@] inputStream [%p] outputStream =[%p]).", (uint8_t *)&v8, 0x20u);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 40) || *(void *)(v6 + 48))
  {
    v7 = mcdpc_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_218756000, v7, OS_LOG_TYPE_DEFAULT, "Already connected!", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    *(unsigned char *)(v6 + 24) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 25) = 0;
    [*(id *)(a1 + 32) setupInputStream:*(void *)(a1 + 40) outputStream:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) setInputStream:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setOutputStream:*(void *)(a1 + 48)];
  }
}

- (BOOL)shouldDecideAboutConnection
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([(MCNearbyDiscoveryPeerConnection *)self localServiceName]
    && [(MCNearbyDiscoveryPeerConnection *)self remoteServiceName])
  {
    if ([(NSString *)[(MCNearbyDiscoveryPeerConnection *)self remoteServiceName] isEqualToString:[(MCNearbyDiscoveryPeerConnection *)self localServiceName]])
    {
      uint64_t v3 = mcdpc_log();
      BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
      if (v4)
      {
        -[MCNearbyDiscoveryPeerConnection shouldDecideAboutConnection]();
LABEL_8:
        LOBYTE(v4) = 0;
      }
    }
    else
    {
      uint64_t v6 = (void *)[MEMORY[0x263F089D8] stringWithFormat:@"%@", -[MCNearbyDiscoveryPeerConnection localServiceName](self, "localServiceName")];
      v7 = (void *)[MEMORY[0x263F089D8] stringWithFormat:@"%@", -[MCNearbyDiscoveryPeerConnection remoteServiceName](self, "remoteServiceName")];
      do
      {
        [v6 appendFormat:@"+%@", -[MCNearbyDiscoveryPeerConnection remoteServiceName](self, "remoteServiceName")];
        [v7 appendFormat:@"+%@", -[MCNearbyDiscoveryPeerConnection localServiceName](self, "localServiceName")];
        CC_MD5((const void *)[v6 UTF8String], objc_msgSend(v6, "length"), md);
        CC_MD5((const void *)[v7 UTF8String], objc_msgSend(v7, "length"), v12);
        unint64_t v8 = bswap64(*(unint64_t *)md);
        unint64_t v9 = bswap64(*(unint64_t *)v12);
        if (v8 != v9) {
          break;
        }
        unint64_t v8 = bswap64(v15);
        unint64_t v9 = bswap64(v13);
      }
      while (v8 == v9);
      if (v8 < v9) {
        unsigned int v10 = -1;
      }
      else {
        unsigned int v10 = 1;
      }
      return v10 >> 31;
    }
  }
  else
  {
    uint64_t v5 = mcdpc_log();
    BOOL v4 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      -[MCNearbyDiscoveryPeerConnection shouldDecideAboutConnection]();
      goto LABEL_8;
    }
  }
  return v4;
}

- (void)syncSendData
{
  if (self->_shouldSendHello)
  {
    [(MCNearbyDiscoveryPeerConnection *)self syncSendHello];
    self->_shouldSendHello = 0;
  }
  if ([(NSMutableData *)self->_dataToSend length])
  {
    uint64_t v3 = [(NSOutputStream *)self->_outputStream write:[(NSMutableData *)self->_dataToSend bytes] maxLength:[(NSMutableData *)self->_dataToSend length]];
    if (v3 < 1) {
      return;
    }
    -[NSMutableData replaceBytesInRange:withBytes:length:](self->_dataToSend, "replaceBytesInRange:withBytes:length:", 0, v3, 0, 0);
    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = 1;
  }
  self->_readyToWrite = v4;
}

- (void)syncSendMessage:(int)a3 data:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  unint64_t v9 = (void *)MEMORY[0x21D471D60](self, a2);
  if (a3 == 2000 || a3 == 2100 || a3 == 2200)
  {
    id v10 = (id)[a5 copy];
    int v11 = [a4 length];
    unsigned int currentSequenceNumber = self->_currentSequenceNumber;
    self->_unsigned int currentSequenceNumber = (currentSequenceNumber + 1) & 0x7FFFFFFF;
    buf[0] = BYTE1(a3);
    buf[1] = a3;
    __int16 v43 = 0;
    char v44 = HIBYTE(v11);
    char v45 = BYTE2(v11);
    char v46 = BYTE1(v11);
    char v47 = v11;
    unsigned int v48 = 0;
    char v49 = HIBYTE(currentSequenceNumber);
    char v50 = BYTE2(currentSequenceNumber);
    char v51 = BYTE1(currentSequenceNumber);
    char v52 = currentSequenceNumber;
    unsigned int v13 = crc32(0, buf, 0x10u);
    if ([a4 length]) {
      unsigned int v13 = crc32(v13, (const Bytef *)[a4 bytes], objc_msgSend(a4, "length"));
    }
    unsigned int v48 = bswap32(v13);
    uint64_t v14 = mcdpc_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      inputStream = self->_inputStream;
      outputStream = self->_outputStream;
      remoteServiceName = self->_remoteServiceName;
      *(_DWORD *)v36 = 67110658;
      LODWORD(v37) = currentSequenceNumber;
      WORD2(v37) = 1024;
      *(_DWORD *)((char *)&v37 + 6) = v11 + 16;
      WORD5(v37) = 1024;
      HIDWORD(v37) = v13;
      *(_WORD *)v38 = 2048;
      *(void *)&v38[2] = self;
      *(_WORD *)v39 = 2048;
      *(void *)&v39[2] = inputStream;
      *(_WORD *)v40 = 2048;
      *(void *)&v40[2] = outputStream;
      LOWORD(v41[0]) = 2112;
      *(void *)((char *)v41 + 2) = remoteServiceName;
      _os_log_impl(&dword_218756000, v14, OS_LOG_TYPE_DEFAULT, "Made message #%u with length [len=%u] and crc [=%08X] - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", v36, 0x3Cu);
    }
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __78__MCNearbyDiscoveryPeerConnection_syncSendMessage_data_withCompletionHandler___block_invoke;
    v32[3] = &unk_264338290;
    unsigned int v33 = currentSequenceNumber;
    int v34 = v11;
    unsigned int v35 = v13;
    v32[4] = self;
    v32[5] = v10;
    id v18 = (id)[v32 copy];
    if (a3 == 2100 && !self->_connected)
    {
      v23 = mcdpc_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = [a4 length];
        v25 = self->_inputStream;
        v26 = self->_outputStream;
        v27 = self->_remoteServiceName;
        *(_DWORD *)v36 = 67110146;
        LODWORD(v37) = v24;
        WORD2(v37) = 2048;
        *(void *)((char *)&v37 + 6) = self;
        HIWORD(v37) = 2048;
        *(void *)v38 = v25;
        *(_WORD *)&v38[8] = 2048;
        *(void *)v39 = v26;
        *(_WORD *)&v39[8] = 2112;
        *(void *)v40 = v27;
        _os_log_impl(&dword_218756000, v23, OS_LOG_TYPE_DEFAULT, "Still connecting - queueing data (%u) - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", v36, 0x30u);
      }
      [(NSMutableArray *)self->_messageReceiptHandlerHoldingQueue addObject:v18];
      [(NSMutableData *)self->_dataToSendHoldingQueue appendBytes:buf length:16];
      [(NSMutableData *)self->_dataToSendHoldingQueue appendData:a4];
    }
    else
    {
      [(NSMutableArray *)self->_messageReceiptHandlerList addObject:v18];
      v19 = (void *)[MEMORY[0x263EFF990] dataWithBytes:buf length:16];
      [v19 appendData:a4];
      v20 = mcdpc_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        if (a3 == 2000)
        {
          v21 = "Hello";
        }
        else if (a3 == 2200)
        {
          v21 = "Accept";
        }
        else
        {
          v21 = "Data";
        }
        int v28 = [a4 length];
        v29 = self->_inputStream;
        v30 = self->_outputStream;
        v31 = self->_remoteServiceName;
        *(_DWORD *)v36 = 136316418;
        *(void *)&long long v37 = v21;
        WORD4(v37) = 1024;
        *(_DWORD *)((char *)&v37 + 10) = v28;
        HIWORD(v37) = 2048;
        *(void *)v38 = self;
        *(_WORD *)&v38[8] = 2048;
        *(void *)v39 = v29;
        *(_WORD *)&v39[8] = 2048;
        *(void *)v40 = v30;
        *(_WORD *)&v40[8] = 2112;
        v41[0] = v31;
        _os_log_impl(&dword_218756000, v20, OS_LOG_TYPE_DEFAULT, "Sending type [%s] data [%u] - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", v36, 0x3Au);
      }
      [(MCNearbyDiscoveryPeerConnection *)self syncAppendDataToSend:v19];
    }
  }
  else
  {
    v22 = mcdpc_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MCNearbyDiscoveryPeerConnection syncSendMessage:data:withCompletionHandler:](a3, self, v22);
    }
    (*((void (**)(id, uint64_t))a5 + 2))(a5, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCNearbyDiscoveryPeerConnection", -1, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Unable to send unknown message type", *MEMORY[0x263F08320])));
  }
}

BOOL __78__MCNearbyDiscoveryPeerConnection_syncSendMessage_data_withCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  int v4 = *(_DWORD *)(a1 + 48);
  uint64_t v5 = mcdpc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(_DWORD *)(a1 + 48);
    int v7 = *(_DWORD *)(a1 + 52) + 16;
    int v8 = *(_DWORD *)(a1 + 56);
    unint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = v9[5];
    uint64_t v11 = v9[6];
    uint64_t v12 = v9[1];
    v16[0] = 67110914;
    v16[1] = a2;
    __int16 v17 = 1024;
    int v18 = v6;
    __int16 v19 = 1024;
    int v20 = v7;
    __int16 v21 = 1024;
    int v22 = v8;
    __int16 v23 = 2048;
    int v24 = v9;
    __int16 v25 = 2048;
    uint64_t v26 = v10;
    __int16 v27 = 2048;
    uint64_t v28 = v11;
    __int16 v29 = 2112;
    uint64_t v30 = v12;
    _os_log_impl(&dword_218756000, v5, OS_LOG_TYPE_DEFAULT, "Got receipt #%u for message #%u with length [len=%u] and crc [=%08X] - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", (uint8_t *)v16, 0x42u);
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13)
  {
    if (v4 == a2) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCNearbyDiscoveryPeerConnection", -2, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Receipt does not match", *MEMORY[0x263F08320]));
    }
    (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, v14);
  }
  return v4 == a2;
}

- (void)syncSendHello
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_218756000, v0, v1, "Bad serviceName [%d]? - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].");
}

- (void)syncSendAccept
{
}

- (void)syncAcceptedConnection
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  [(MCNearbyDiscoveryPeerConnection *)self syncAppendDataToSend:self->_dataToSendHoldingQueue];
  [(NSMutableArray *)self->_messageReceiptHandlerList addObjectsFromArray:self->_messageReceiptHandlerHoldingQueue];
  [(NSMutableArray *)self->_messageReceiptHandlerHoldingQueue removeAllObjects];
  if ([(NSMutableArray *)self->_receivedDataHoldingQueue count])
  {
    id receiveDataHandler = self->_receiveDataHandler;
    if (receiveDataHandler)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      receivedDataHoldingQueue = self->_receivedDataHoldingQueue;
      uint64_t v5 = [(NSMutableArray *)receivedDataHoldingQueue countByEnumeratingWithState:&v17 objects:v29 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v18;
        int v8 = MEMORY[0x263EF83A0];
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v18 != v7) {
              objc_enumerationMutation(receivedDataHoldingQueue);
            }
            uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
            if (self->_targetQueue) {
              targetQueue = self->_targetQueue;
            }
            else {
              targetQueue = v8;
            }
            v16[0] = MEMORY[0x263EF8330];
            v16[1] = 3221225472;
            _DWORD v16[2] = __57__MCNearbyDiscoveryPeerConnection_syncAcceptedConnection__block_invoke;
            v16[3] = &unk_2643382B8;
            v16[4] = v10;
            v16[5] = receiveDataHandler;
            dispatch_async(targetQueue, v16);
          }
          uint64_t v6 = [(NSMutableArray *)receivedDataHoldingQueue countByEnumeratingWithState:&v17 objects:v29 count:16];
        }
        while (v6);
      }
    }
    else
    {
      uint64_t v12 = mcdpc_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        inputStream = self->_inputStream;
        outputStream = self->_outputStream;
        remoteServiceName = self->_remoteServiceName;
        *(_DWORD *)buf = 134218754;
        int v22 = self;
        __int16 v23 = 2048;
        int v24 = inputStream;
        __int16 v25 = 2048;
        uint64_t v26 = outputStream;
        __int16 v27 = 2112;
        uint64_t v28 = remoteServiceName;
        _os_log_impl(&dword_218756000, v12, OS_LOG_TYPE_DEFAULT, "ReceiveDataHandler is nil - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", buf, 0x2Au);
      }
    }
  }
  [(NSMutableArray *)self->_receivedDataContentHoldingQueue removeAllObjects];
  self->_connected = 1;
}

uint64_t __57__MCNearbyDiscoveryPeerConnection_syncAcceptedConnection__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)syncSendMessageReceipt:(int)a3 sequenceNumber:(unsigned int)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  buf[0] = BYTE1(a3);
  buf[1] = a3;
  __int16 v6 = 256;
  uint64_t v7 = 0;
  char v8 = HIBYTE(a4);
  char v9 = BYTE2(a4);
  char v10 = BYTE1(a4);
  char v11 = a4;
  HIDWORD(v7) = bswap32(crc32(0, buf, 0x10u));
  -[MCNearbyDiscoveryPeerConnection syncAppendDataToSend:](self, "syncAppendDataToSend:", [MEMORY[0x263EFF8F8] dataWithBytes:buf length:16]);
}

- (void)syncProcessMessage:(int)a3 data:(id)a4 sequenceNumber:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v98 = *MEMORY[0x263EF8340];
  char v9 = (void *)MEMORY[0x21D471D60](self, a2);
  if (a3 != 2200)
  {
    if (a3 == 2100)
    {
      long long v19 = mcdpc_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        inputStream = self->_inputStream;
        outputStream = self->_outputStream;
        remoteServiceName = self->_remoteServiceName;
        *(_DWORD *)buf = 134218754;
        *(void *)v92 = self;
        *(_WORD *)&v92[8] = 2048;
        *(void *)v93 = inputStream;
        *(_WORD *)&v93[8] = 2048;
        *(void *)&v93[10] = outputStream;
        *(_WORD *)&v93[18] = 2112;
        *(void *)&v93[20] = remoteServiceName;
        _os_log_impl(&dword_218756000, v19, OS_LOG_TYPE_DEFAULT, "Got Data - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", buf, 0x2Au);
      }
      [(MCNearbyDiscoveryPeerConnection *)self syncSendMessageReceipt:2100 sequenceNumber:v5];
      receivedDataContentHoldingQueue = self->_receivedDataContentHoldingQueue;
      v87[0] = MEMORY[0x263EF8330];
      v87[1] = 3221225472;
      v87[2] = __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_27;
      v87[3] = &unk_264338330;
      v87[4] = receivedDataContentHoldingQueue;
      v87[5] = a4;
      if (!self->_connected)
      {
        unint64_t v38 = [a4 length];
        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        v39 = self->_receivedDataContentHoldingQueue;
        uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v83 objects:v90 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          uint64_t v42 = *(void *)v84;
          do
          {
            for (uint64_t i = 0; i != v41; ++i)
            {
              if (*(void *)v84 != v42) {
                objc_enumerationMutation(v39);
              }
              v38 += [*(id *)(*((void *)&v83 + 1) + 8 * i) length];
            }
            uint64_t v41 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v83 objects:v90 count:16];
          }
          while (v41);
        }
        if (v38 >> 24 > 4)
        {
          v64 = mcdpc_log();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            v65 = self->_inputStream;
            v66 = self->_outputStream;
            v67 = self->_remoteServiceName;
            *(_DWORD *)buf = 134218754;
            *(void *)v92 = self;
            *(_WORD *)&v92[8] = 2048;
            *(void *)v93 = v65;
            *(_WORD *)&v93[8] = 2048;
            *(void *)&v93[10] = v66;
            *(_WORD *)&v93[18] = 2112;
            *(void *)&v93[20] = v67;
            _os_log_impl(&dword_218756000, v64, OS_LOG_TYPE_DEFAULT, "Too many enqueued messages before connect. Closing connection.ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", buf, 0x2Au);
          }
          goto LABEL_62;
        }
        -[NSMutableArray addObject:](self->_receivedDataHoldingQueue, "addObject:", (id)[v87 copy]);
        [(NSMutableArray *)self->_receivedDataContentHoldingQueue addObject:a4];
        goto LABEL_63;
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
        block[2] = __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_29;
        block[3] = &unk_2643382B8;
        block[4] = v87;
        block[5] = receiveDataHandler;
        dispatch_async(targetQueue, block);
        goto LABEL_63;
      }
      v57 = mcdpc_log();
      if (!os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_63;
      }
      v58 = self->_inputStream;
      v59 = self->_outputStream;
      v60 = self->_remoteServiceName;
      *(_DWORD *)buf = 134218754;
      *(void *)v92 = self;
      *(_WORD *)&v92[8] = 2048;
      *(void *)v93 = v58;
      *(_WORD *)&v93[8] = 2048;
      *(void *)&v93[10] = v59;
      *(_WORD *)&v93[18] = 2112;
      *(void *)&v93[20] = v60;
      v61 = "ReceiveDataHandler is nil - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].";
      v62 = v57;
      uint32_t v63 = 42;
    }
    else
    {
      if (a3 == 2000)
      {
        if ((unint64_t)[a4 length] <= 5)
        {
          char v10 = mcdpc_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            -[MCNearbyDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:](a4, self, v10);
          }
          goto LABEL_62;
        }
        uint64_t v27 = [a4 bytes];
        unsigned int v28 = *(_DWORD *)v27;
        unsigned int v29 = __rev16(*(unsigned __int16 *)(v27 + 4));
        if ([a4 length] < (unint64_t)(v29 + 6))
        {
          uint64_t v30 = mcdpc_log();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            int v31 = [a4 length];
            v32 = self->_inputStream;
            unsigned int v33 = self->_outputStream;
            int v34 = self->_remoteServiceName;
            *(_DWORD *)buf = 67110402;
            *(_DWORD *)v92 = v29;
            *(_WORD *)&v92[4] = 1024;
            *(_DWORD *)&v92[6] = v31;
            *(_WORD *)v93 = 2048;
            *(void *)&v93[2] = self;
            *(_WORD *)&v93[10] = 2048;
            *(void *)&v93[12] = v32;
            *(_WORD *)&v93[20] = 2048;
            *(void *)&v93[22] = v33;
            *(_WORD *)&v93[30] = 2112;
            *(void *)&v93[32] = v34;
            unsigned int v35 = "Hello body not enough for service name: %u+6 > %u - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].";
            v36 = v30;
            uint32_t v37 = 54;
LABEL_28:
            _os_log_error_impl(&dword_218756000, v36, OS_LOG_TYPE_ERROR, v35, buf, v37);
            goto LABEL_62;
          }
          goto LABEL_62;
        }
        if (!v29)
        {
          v73 = mcdpc_log();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
            -[MCNearbyDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:]();
          }
          goto LABEL_62;
        }
        uint64_t v44 = v27 + 6;
        if (*(unsigned char *)([a4 length] + v27 + 6 - 7))
        {
          unint64_t v45 = [a4 length] - 12;
          char v46 = mcdpc_log();
          BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
          if (v45 > 0xFFFFFFFFFFFFFFFALL || v29 < 4)
          {
            if (v47) {
              -[MCNearbyDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:]();
            }
            goto LABEL_62;
          }
          if (v47)
          {
            int v48 = *(char *)(v27 + 6);
            int v49 = *(char *)(v27 + 7);
            int v50 = *(char *)(v27 + 8);
            int v51 = *(char *)(v44 + v29 - 3);
            int v52 = *(char *)(v44 + v29 - 2);
            int v53 = *(char *)(v44 + v29 - 1);
            v54 = self->_inputStream;
            v55 = self->_outputStream;
            v56 = self->_remoteServiceName;
            *(_DWORD *)buf = 67111682;
            *(_DWORD *)v92 = v48;
            *(_WORD *)&v92[4] = 1024;
            *(_DWORD *)&v92[6] = v49;
            *(_WORD *)v93 = 1024;
            *(_DWORD *)&v93[2] = v50;
            *(_WORD *)&v93[6] = 1024;
            *(_DWORD *)&v93[8] = v51;
            *(_WORD *)&v93[12] = 1024;
            *(_DWORD *)&v93[14] = v52;
            *(_WORD *)&v93[18] = 1024;
            *(_DWORD *)&v93[20] = v53;
            *(_WORD *)&v93[24] = 1024;
            *(_DWORD *)&v93[26] = v29;
            *(_WORD *)&v93[30] = 2048;
            *(void *)&v93[32] = self;
            *(_WORD *)&v93[40] = 2048;
            *(void *)&v93[42] = v54;
            __int16 v94 = 2048;
            v95 = v55;
            __int16 v96 = 2112;
            v97 = v56;
            unsigned int v35 = "Remote name [%c%c%c..%c%c%c] not properly terminated at length=%u - ptr [%p] inputStream [%p] outputSt"
                  "ream [%p] remote [%@].";
            v36 = v46;
            uint32_t v37 = 84;
            goto LABEL_28;
          }
LABEL_62:
          [(MCNearbyDiscoveryPeerConnection *)self syncCloseConnectionNow];
          goto LABEL_63;
        }
        -[MCNearbyDiscoveryPeerConnection setRemoteServiceName:](self, "setRemoteServiceName:", [NSString stringWithUTF8String:v27 + 6]);
        BOOL v74 = [(MCNearbyDiscoveryPeerConnection *)self shouldDecideAboutConnection];
        v75 = mcdpc_log();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          v76 = self->_inputStream;
          v77 = self->_outputStream;
          v78 = self->_remoteServiceName;
          *(_DWORD *)buf = 67110402;
          *(_DWORD *)v92 = bswap32(v28);
          *(_WORD *)&v92[4] = 1024;
          *(_DWORD *)&v92[6] = v74;
          *(_WORD *)v93 = 2048;
          *(void *)&v93[2] = self;
          *(_WORD *)&v93[10] = 2048;
          *(void *)&v93[12] = v76;
          *(_WORD *)&v93[20] = 2048;
          *(void *)&v93[22] = v77;
          *(_WORD *)&v93[30] = 2112;
          *(void *)&v93[32] = v78;
          _os_log_impl(&dword_218756000, v75, OS_LOG_TYPE_DEFAULT, "Got Hello (flags = %08x) shouldDecide (%d) - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", buf, 0x36u);
        }
        [(MCNearbyDiscoveryPeerConnection *)self syncSendMessageReceipt:2000 sequenceNumber:v5];
        if (v74)
        {
          v89[0] = MEMORY[0x263EF8330];
          v89[1] = 3221225472;
          v89[2] = __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke;
          v89[3] = &unk_2643382E0;
          v89[4] = self;
          id v79 = (id)[v89 copy];
          id connectedHandler = self->_connectedHandler;
          if (connectedHandler)
          {
            self->_id connectedHandler = 0;
            long long v17 = MEMORY[0x263EF83A0];
            if (self->_targetQueue) {
              long long v17 = self->_targetQueue;
            }
            v88[0] = MEMORY[0x263EF8330];
            v88[1] = 3221225472;
            v88[2] = __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_3;
            v88[3] = &unk_264338308;
            v88[4] = self;
            v88[5] = connectedHandler;
            v88[6] = v79;
            long long v18 = v88;
LABEL_13:
            dispatch_async(v17, v18);

            goto LABEL_63;
          }
        }
        goto LABEL_63;
      }
      uint64_t v26 = mcdpc_log();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_63;
      }
      if (a3) {
        v68 = "?";
      }
      else {
        v68 = "Invalid";
      }
      int v69 = [a4 length];
      v70 = self->_inputStream;
      v71 = self->_outputStream;
      v72 = self->_remoteServiceName;
      *(_DWORD *)buf = 136316418;
      *(void *)v92 = v68;
      *(_WORD *)&v92[8] = 1024;
      *(_DWORD *)v93 = v69;
      *(_WORD *)&v93[4] = 2048;
      *(void *)&v93[6] = self;
      *(_WORD *)&v93[14] = 2048;
      *(void *)&v93[16] = v70;
      *(_WORD *)&v93[24] = 2048;
      *(void *)&v93[26] = v71;
      *(_WORD *)&v93[34] = 2112;
      *(void *)&v93[36] = v72;
      v61 = "Unrecognized message %s (body size=%u) - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].";
      v62 = v26;
      uint32_t v63 = 58;
    }
    _os_log_impl(&dword_218756000, v62, OS_LOG_TYPE_DEFAULT, v61, buf, v63);
    goto LABEL_63;
  }
  char v11 = mcdpc_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = self->_inputStream;
    uint64_t v13 = self->_outputStream;
    uint64_t v14 = self->_remoteServiceName;
    *(_DWORD *)buf = 134218754;
    *(void *)v92 = self;
    *(_WORD *)&v92[8] = 2048;
    *(void *)v93 = v12;
    *(_WORD *)&v93[8] = 2048;
    *(void *)&v93[10] = v13;
    *(_WORD *)&v93[18] = 2112;
    *(void *)&v93[20] = v14;
    _os_log_impl(&dword_218756000, v11, OS_LOG_TYPE_DEFAULT, "Got Accept - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", buf, 0x2Au);
  }
  [(MCNearbyDiscoveryPeerConnection *)self syncSendMessageReceipt:2200 sequenceNumber:v5];
  v81[0] = MEMORY[0x263EF8330];
  v81[1] = 3221225472;
  v81[2] = __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_30;
  v81[3] = &unk_2643382E0;
  v81[4] = self;
  id v15 = (id)[v81 copy];
  id connectedHandler = self->_connectedHandler;
  if (connectedHandler)
  {
    self->_id connectedHandler = 0;
    long long v17 = MEMORY[0x263EF83A0];
    if (self->_targetQueue) {
      long long v17 = self->_targetQueue;
    }
    v80[0] = MEMORY[0x263EF8330];
    v80[1] = 3221225472;
    v80[2] = __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_4;
    v80[3] = &unk_264338308;
    v80[4] = self;
    v80[5] = connectedHandler;
    v80[6] = v15;
    long long v18 = v80;
    goto LABEL_13;
  }
LABEL_63:
}

void __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke(uint64_t a1, int a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  int v4 = mcdpc_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = "declines";
    __int16 v6 = *(void **)(a1 + 32);
    uint64_t v7 = v6[5];
    uint64_t v8 = v6[6];
    if (a2) {
      uint64_t v5 = "approves";
    }
    uint64_t v9 = v6[1];
    char v10 = "close connection";
    *(_DWORD *)buf = 136316418;
    if (a2) {
      char v10 = "accept connection";
    }
    long long v19 = v5;
    __int16 v20 = 2080;
    __int16 v21 = v10;
    __int16 v22 = 2048;
    __int16 v23 = v6;
    __int16 v24 = 2048;
    uint64_t v25 = v7;
    __int16 v26 = 2048;
    uint64_t v27 = v8;
    __int16 v28 = 2112;
    uint64_t v29 = v9;
    _os_log_impl(&dword_218756000, v4, OS_LOG_TYPE_DEFAULT, "Peer %s. Will %s - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", buf, 0x3Eu);
  }
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(NSObject **)(v11 + 136);
  if (a2)
  {
    uint64_t v13 = v17;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    uint64_t v14 = __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_25;
  }
  else
  {
    uint64_t v13 = v16;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    uint64_t v14 = __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_2;
  }
  if (v12) {
    id v15 = v12;
  }
  else {
    id v15 = MEMORY[0x263EF83A0];
  }
  v13[2] = v14;
  v13[3] = &unk_264337EE8;
  v13[4] = v11;
  dispatch_async(v15, v13);
}

uint64_t __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_25(uint64_t a1)
{
  [*(id *)(a1 + 32) syncSendAccept];
  v2 = *(void **)(a1 + 32);

  return [v2 syncAcceptedConnection];
}

uint64_t __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncCloseConnectionNow];
}

uint64_t __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[5] + 16))(a1[5], *(void *)(a1[4] + 8), 0, a1[6], 0);
}

uint64_t __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_27(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, void))(a2 + 16);

  return v5(a2, v4, 0);
}

uint64_t __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_30(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 136);
  if (a2)
  {
    uint64_t v4 = v8;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    uint64_t v5 = __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_2_31;
  }
  else
  {
    uint64_t v4 = v7;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    uint64_t v5 = __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_3_32;
  }
  if (v3) {
    __int16 v6 = v3;
  }
  else {
    __int16 v6 = MEMORY[0x263EF83A0];
  }
  v4[2] = v5;
  v4[3] = &unk_264337EE8;
  v4[4] = v2;
  dispatch_async(v6, v4);
}

uint64_t __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_2_31(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncAcceptedConnection];
}

uint64_t __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_3_32(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncCloseConnectionNow];
}

uint64_t __74__MCNearbyDiscoveryPeerConnection_syncProcessMessage_data_sequenceNumber___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, uint64_t, void, void))(a1[5] + 16))(a1[5], *(void *)(a1[4] + 8), 1, a1[6], 0);
}

- (void)syncReceivedData:(id)a3 error:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v7 = MEMORY[0x21D471D60](self, a2);
  uint64_t v8 = (void *)v7;
  if (a3)
  {
    context = (void *)v7;
    [(NSMutableData *)self->_dataReceived appendData:a3];
    uint64_t v9 = (unsigned __int16 *)[(NSMutableData *)self->_dataReceived bytes];
    unsigned int v10 = [(NSMutableData *)self->_dataReceived length];
    if (v10 < 0x10)
    {
LABEL_3:
      NSUInteger v11 = [(NSMutableData *)self->_dataReceived length];
      uint64_t v8 = context;
      if (v11 != v10) {
        -[NSMutableData replaceBytesInRange:withBytes:length:](self->_dataReceived, "replaceBytesInRange:withBytes:length:", 0, v11 - v10, 0, 0);
      }
      goto LABEL_34;
    }
    p_messageReceiptHandlerHoldingQueue = &self->_messageReceiptHandlerHoldingQueue;
    while (1)
    {
      uint64_t v16 = bswap32(*((_DWORD *)v9 + 1));
      if (v16 >= 0x5000001)
      {
        uint64_t v27 = mcdpc_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[MCNearbyDiscoveryPeerConnection syncReceivedData:error:]();
        }
        goto LABEL_33;
      }
      if (v16 > v10 - 16) {
        goto LABEL_3;
      }
      int v17 = *((unsigned __int8 *)v9 + 12);
      uint64_t v18 = (*((unsigned __int8 *)v9 + 15) | (*((unsigned __int8 *)v9 + 13) << 16) | (*((unsigned __int8 *)v9 + 14) << 8)) & 0xFFFFFF | (v17 << 24);
      if (v17 << 24 < 0)
      {
        __int16 v28 = mcdpc_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[MCNearbyDiscoveryPeerConnection syncReceivedData:error:].cold.7();
        }
        goto LABEL_33;
      }
      unsigned int v19 = *v9;
      char v20 = *((unsigned char *)v9 + 3);
      unsigned int v21 = *((_DWORD *)v9 + 2);
      if (v20)
      {
        if (v16) {
          break;
        }
      }
      *((_DWORD *)v9 + 2) = 0;
      unsigned int v22 = v16 + 16;
      if (bswap32(v21) != crc32(0, (const Bytef *)v9, (int)v16 + 16))
      {
        uint64_t v30 = mcdpc_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[MCNearbyDiscoveryPeerConnection syncReceivedData:error:].cold.6();
        }
LABEL_33:
        [(MCNearbyDiscoveryPeerConnection *)self syncCloseConnectionNow];
        uint64_t v8 = context;
        goto LABEL_34;
      }
      uint64_t v23 = __rev16(v19);
      if (v20)
      {
        if ((v23 != 2100
           || (p_messageReceiptHandlerList = p_messageReceiptHandlerHoldingQueue,
               ![(NSMutableArray *)*p_messageReceiptHandlerHoldingQueue count]))
          && (p_messageReceiptHandlerList = &self->_messageReceiptHandlerList,
              ![(NSMutableArray *)self->_messageReceiptHandlerList count])
          || (uint64_t v25 = (uint64_t (**)(id, void))(id)-[NSMutableArray objectAtIndex:](*p_messageReceiptHandlerList, "objectAtIndex:", 0, p_messageReceiptHandlerHoldingQueue), [(NSMutableArray *)*p_messageReceiptHandlerList removeObjectAtIndex:0], !v25))
        {
          int v31 = mcdpc_log();
          uint64_t v8 = context;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            -[MCNearbyDiscoveryPeerConnection syncReceivedData:error:]();
          }
          goto LABEL_7;
        }
        char v26 = v25[2](v25, v18);

        if ((v26 & 1) == 0)
        {
          unsigned int v33 = mcdpc_log();
          BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
          uint64_t v8 = context;
          if (v34) {
            -[MCNearbyDiscoveryPeerConnection syncReceivedData:error:].cold.4();
          }
          goto LABEL_7;
        }
      }
      else
      {
        -[MCNearbyDiscoveryPeerConnection syncProcessMessage:data:sequenceNumber:](self, "syncProcessMessage:data:sequenceNumber:", v23, [MEMORY[0x263EFF8F8] dataWithBytes:v9 + 8 length:v16], v18);
        if (self->_connectionClosed)
        {
          v32 = mcdpc_log();
          uint64_t v8 = context;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            -[MCNearbyDiscoveryPeerConnection syncReceivedData:error:].cold.5();
          }
          goto LABEL_34;
        }
      }
      uint64_t v9 = (unsigned __int16 *)((char *)v9 + v22);
      v10 -= v22;
      if (v10 <= 0xF) {
        goto LABEL_3;
      }
    }
    uint64_t v29 = mcdpc_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[MCNearbyDiscoveryPeerConnection syncReceivedData:error:]();
    }
    goto LABEL_33;
  }
  uint64_t v12 = mcdpc_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    inputStream = self->_inputStream;
    outputStream = self->_outputStream;
    remoteServiceName = self->_remoteServiceName;
    *(_DWORD *)buf = 138413314;
    id v38 = a4;
    __int16 v39 = 2048;
    uint64_t v40 = self;
    __int16 v41 = 2048;
    uint64_t v42 = inputStream;
    __int16 v43 = 2048;
    uint64_t v44 = outputStream;
    __int16 v45 = 2112;
    char v46 = remoteServiceName;
    _os_log_impl(&dword_218756000, v12, OS_LOG_TYPE_DEFAULT, "End of stream, error: %@ - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", buf, 0x34u);
  }
LABEL_7:
  [(MCNearbyDiscoveryPeerConnection *)self syncCloseConnectionNow];
LABEL_34:
}

- (void)syncCloseConnectionNow
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = mcdpc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    inputStream = self->_inputStream;
    outputStream = self->_outputStream;
    remoteServiceName = self->_remoteServiceName;
    *(_DWORD *)buf = 134218754;
    id v15 = self;
    __int16 v16 = 2048;
    int v17 = inputStream;
    __int16 v18 = 2048;
    unsigned int v19 = outputStream;
    __int16 v20 = 2112;
    unsigned int v21 = remoteServiceName;
    _os_log_impl(&dword_218756000, v3, OS_LOG_TYPE_DEFAULT, "Closing connection - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", buf, 0x2Au);
  }
  *(_WORD *)&self->_connected = 256;
  [(NSInputStream *)self->_inputStream close];
  [(NSInputStream *)self->_inputStream setDelegate:0];

  self->_inputStream = 0;
  [(NSOutputStream *)self->_outputStream close];
  [(NSOutputStream *)self->_outputStream setDelegate:0];

  self->_outputStream = 0;
  self->_remoteServiceName = 0;
  -[NSMutableData replaceBytesInRange:withBytes:length:](self->_dataReceived, "replaceBytesInRange:withBytes:length:", 0, [(NSMutableData *)self->_dataReceived length], 0, 0);
  -[NSMutableData replaceBytesInRange:withBytes:length:](self->_dataToSendHoldingQueue, "replaceBytesInRange:withBytes:length:", 0, [(NSMutableData *)self->_dataToSendHoldingQueue length], 0, 0);
  messageReceiptHandlerList = self->_messageReceiptHandlerList;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__MCNearbyDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke;
  v13[3] = &unk_264338358;
  v13[4] = self;
  [(NSMutableArray *)messageReceiptHandlerList enumerateObjectsUsingBlock:v13];
  messageReceiptHandlerHoldingQueue = self->_messageReceiptHandlerHoldingQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__MCNearbyDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_34;
  v12[3] = &unk_264338358;
  v12[4] = self;
  [(NSMutableArray *)messageReceiptHandlerHoldingQueue enumerateObjectsUsingBlock:v12];
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
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__MCNearbyDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_36;
    block[3] = &unk_264338118;
    block[4] = connectedHandler;
    dispatch_async(targetQueue, block);
  }
  else if (self->_receiveDataHandler)
  {
    objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCNearbyDiscoveryPeerConnection", -4, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Connection closed", *MEMORY[0x263F08320]));
    (*((void (**)(void))self->_receiveDataHandler + 2))();
  }
}

void __57__MCNearbyDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (*(void *)(*(void *)(a1 + 32) + 144)) {
      uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 144);
    }
    else {
      uint64_t v3 = MEMORY[0x263EF83A0];
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__MCNearbyDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_2;
    block[3] = &unk_264338118;
    block[4] = a2;
    dispatch_async(v3, block);
  }
  else
  {
    uint64_t v4 = mcdpc_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = v5[5];
      uint64_t v7 = v5[6];
      uint64_t v8 = v5[1];
      *(_DWORD *)buf = 134218754;
      NSUInteger v11 = v5;
      __int16 v12 = 2048;
      uint64_t v13 = v6;
      __int16 v14 = 2048;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      _os_log_impl(&dword_218756000, v4, OS_LOG_TYPE_DEFAULT, "ReceiptHander should not be nil - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", buf, 0x2Au);
    }
  }
}

uint64_t __57__MCNearbyDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__MCNearbyDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_34(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (*(void *)(*(void *)(a1 + 32) + 144)) {
      uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 144);
    }
    else {
      uint64_t v3 = MEMORY[0x263EF83A0];
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__MCNearbyDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_2_35;
    block[3] = &unk_264338118;
    block[4] = a2;
    dispatch_async(v3, block);
  }
  else
  {
    uint64_t v4 = mcdpc_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = v5[5];
      uint64_t v7 = v5[6];
      uint64_t v8 = v5[1];
      *(_DWORD *)buf = 134218754;
      NSUInteger v11 = v5;
      __int16 v12 = 2048;
      uint64_t v13 = v6;
      __int16 v14 = 2048;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      _os_log_impl(&dword_218756000, v4, OS_LOG_TYPE_DEFAULT, "ReceiptHandler should not be nil - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", buf, 0x2Au);
    }
  }
}

uint64_t __57__MCNearbyDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_2_35(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__MCNearbyDiscoveryPeerConnection_syncCloseConnectionNow__block_invoke_36(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCNearbyDiscoveryPeerConnection", -3, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Unable to connect", *MEMORY[0x263F08320]));
  uint64_t v3 = *(uint64_t (**)(uint64_t, void, void, void, uint64_t))(*(void *)(a1 + 32) + 16);
  uint64_t v4 = v2;
  uint64_t v5 = *(void *)(a1 + 32);

  return v3(v5, 0, 0, 0, v4);
}

- (void)invalidate
{
  syncQueue = MEMORY[0x263EF83A0];
  if (self->_syncQueue) {
    syncQueue = self->_syncQueue;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__MCNearbyDiscoveryPeerConnection_invalidate__block_invoke;
  block[3] = &unk_264337EE8;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __45__MCNearbyDiscoveryPeerConnection_invalidate__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 25) = 1;

  *(void *)(*(void *)(a1 + 32) + 128) = 0;
  *(void *)(*(void *)(a1 + 32) + 120) = 0;
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 syncCloseConnectionNow];
}

- (void)dealloc
{
  [(MCNearbyDiscoveryPeerConnection *)self syncCloseConnectionNow];
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
  v7.receiver = self;
  v7.super_class = (Class)MCNearbyDiscoveryPeerConnection;
  [(MCNearbyDiscoveryPeerConnection *)&v7 dealloc];
}

- (void)sendData:(id)a3 withCompletionHandler:(id)a4
{
  if (a3)
  {
    if ([a3 length] > 0x1400000)
    {
      unsigned int v10 = mcdpc_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[MCNearbyDiscoveryPeerConnection sendData:withCompletionHandler:]();
      }
      (*((void (**)(id, uint64_t))a4 + 2))(a4, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCNearbyDiscoveryPeerConnection", -5, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Message is too big to send", *MEMORY[0x263F08320])));
    }
    else
    {
      id v7 = (id)[a4 copy];
      syncQueue = self->_syncQueue;
      if (!syncQueue) {
        syncQueue = MEMORY[0x263EF83A0];
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __66__MCNearbyDiscoveryPeerConnection_sendData_withCompletionHandler___block_invoke;
      block[3] = &unk_264338078;
      block[4] = self;
      void block[5] = a3;
      void block[6] = v7;
      dispatch_async(syncQueue, block);
    }
  }
  else
  {
    uint64_t v9 = (void (*)(id, void))*((void *)a4 + 2);
    v9(a4, 0);
  }
}

uint64_t __66__MCNearbyDiscoveryPeerConnection_sendData_withCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncSendMessage:2100 data:*(void *)(a1 + 40) withCompletionHandler:*(void *)(a1 + 48)];
}

- (id)stringForStreamEventCode:(unint64_t)a3
{
  id result = @"None";
  switch(a3)
  {
    case 1uLL:
      id result = @"Open Completed";
      break;
    case 2uLL:
      id result = @"Has Bytes Available";
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return result;
    case 4uLL:
      id result = @"Has Space Available";
      break;
    case 8uLL:
      id result = @"Error Occured";
      break;
    default:
      if (a3 == 16) {
        id result = @"End Encountered";
      }
      break;
  }
  return result;
}

- (void)syncReadFromInputStream
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_218756000, log, OS_LOG_TYPE_ERROR, "Read failed.", v1, 2u);
}

- (int)socketForStream:(id)a3
{
  uint64_t v3 = (void *)[a3 propertyForKey:*MEMORY[0x263EFFEB8]];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 length] == 4) {
    return *(_DWORD *)[v3 bytes];
  }
  else {
    return -1;
  }
}

- (void)syncHandleStreamEventOpenCompleted:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  int v4 = -[MCNearbyDiscoveryPeerConnection socketForStream:](self, "socketForStream:");
  if (v4 == -1)
  {
    unsigned int v10 = mcdpc_log();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 134217984;
    id v18 = a3;
    id v7 = "Failed get socket for stream [%p].";
    uint64_t v8 = v10;
    uint32_t v9 = 12;
    goto LABEL_32;
  }
  int v5 = v4;
  uint64_t v16 = 0;
  if (SocketGetInterfaceInfo())
  {
    uint64_t v6 = mcdpc_log();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 134218240;
    id v18 = a3;
    __int16 v19 = 1024;
    int v20 = v5;
    id v7 = "SocketGetInterfaceInfo failed for stream=%p socket=%d.";
    uint64_t v8 = v6;
    uint32_t v9 = 18;
    goto LABEL_32;
  }
  *(void *)&v29.sa_len = 0;
  *(void *)&v29.sa_data[6] = 0;
  socklen_t v15 = 16;
  if (getsockname(v5, &v29, &v15) == -1)
  {
    __int16 v12 = mcdpc_log();
    unsigned int v11 = 0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v18 = a3;
      __int16 v19 = 1024;
      int v20 = v5;
      _os_log_impl(&dword_218756000, v12, OS_LOG_TYPE_DEFAULT, "Failed to get port for stream=%p socket=%d.", buf, 0x12u);
      unsigned int v11 = 0;
    }
  }
  else
  {
    unsigned int v11 = bswap32(*(unsigned __int16 *)v29.sa_data) >> 16;
  }
  uint64_t v13 = mcdpc_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if ((int)v16 <= 31)
    {
      __int16 v14 = "Enet";
      switch((int)v16)
      {
        case 1:
          goto LABEL_31;
        case 2:
          __int16 v14 = "WiFi";
          break;
        case 3:
        case 5:
        case 6:
        case 7:
          goto LABEL_24;
        case 4:
          __int16 v14 = "AWDL";
          break;
        case 8:
          __int16 v14 = "USB";
          break;
        default:
          if (v16 != 16) {
            goto LABEL_24;
          }
          __int16 v14 = "Direct";
          break;
      }
      goto LABEL_31;
    }
    if ((int)v16 > 127)
    {
      if (v16 == 128)
      {
        __int16 v14 = "NAN";
        goto LABEL_31;
      }
      if (v16 == 256)
      {
        __int16 v14 = "IPsecBT";
        goto LABEL_31;
      }
    }
    else
    {
      if (v16 == 32)
      {
        __int16 v14 = "BTLE";
        goto LABEL_31;
      }
      if (v16 == 64)
      {
        __int16 v14 = "WFD";
LABEL_31:
        *(_DWORD *)buf = 134219266;
        id v18 = a3;
        __int16 v19 = 1024;
        int v20 = v5;
        __int16 v21 = 1024;
        unsigned int v22 = v11;
        __int16 v23 = 2080;
        __int16 v24 = &v30;
        __int16 v25 = 1024;
        int v26 = HIDWORD(v16);
        __int16 v27 = 2080;
        __int16 v28 = v14;
        id v7 = "Stream [%p] info: socket=%d port=%d interfaceName=%s interfaceIndex=%d transportType=%s.";
        uint64_t v8 = v13;
        uint32_t v9 = 50;
LABEL_32:
        _os_log_impl(&dword_218756000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
        return;
      }
    }
LABEL_24:
    __int16 v14 = "?";
    if (v16 == 512) {
      __int16 v14 = "IPSecWiFi";
    }
    goto LABEL_31;
  }
}

- (void)syncHandleInputStreamEvent:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 1uLL:
      int v4 = mcdpc_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        inputStream = self->_inputStream;
        int v12 = 138412290;
        uint64_t v13 = inputStream;
        _os_log_impl(&dword_218756000, v4, OS_LOG_TYPE_DEFAULT, "Stream %@ opened.", (uint8_t *)&v12, 0xCu);
      }
      [(MCNearbyDiscoveryPeerConnection *)self syncHandleStreamEventOpenCompleted:self->_inputStream];
      break;
    case 2uLL:
      [(MCNearbyDiscoveryPeerConnection *)self syncReadFromInputStream];
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return;
    case 4uLL:
      uint64_t v8 = mcdpc_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint32_t v9 = [(MCNearbyDiscoveryPeerConnection *)self stringForStreamEventCode:4];
        unsigned int v10 = self->_inputStream;
        int v12 = 138412546;
        uint64_t v13 = v9;
        __int16 v14 = 2112;
        socklen_t v15 = v10;
        _os_log_impl(&dword_218756000, v8, OS_LOG_TYPE_DEFAULT, "Unexpected event (%@) for input stream %@.", (uint8_t *)&v12, 0x16u);
      }
      break;
    case 8uLL:
      unsigned int v11 = mcdpc_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[MCNearbyDiscoveryPeerConnection syncHandleInputStreamEvent:]((uint64_t)self);
      }
      break;
    default:
      if (a3 == 16)
      {
        uint64_t v6 = mcdpc_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          id v7 = self->_inputStream;
          int v12 = 138412290;
          uint64_t v13 = v7;
          _os_log_impl(&dword_218756000, v6, OS_LOG_TYPE_DEFAULT, "End for stream %@.", (uint8_t *)&v12, 0xCu);
        }
        [(MCNearbyDiscoveryPeerConnection *)self syncCloseConnectionNow];
      }
      break;
  }
}

- (void)syncHandleOutputStreamEvent:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 1uLL:
      int v4 = mcdpc_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        outputStream = self->_outputStream;
        int v12 = 138412290;
        uint64_t v13 = outputStream;
        _os_log_impl(&dword_218756000, v4, OS_LOG_TYPE_DEFAULT, "Stream %@ opened.", (uint8_t *)&v12, 0xCu);
      }
      [(MCNearbyDiscoveryPeerConnection *)self syncHandleStreamEventOpenCompleted:self->_outputStream];
      break;
    case 2uLL:
      uint64_t v8 = mcdpc_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint32_t v9 = [(MCNearbyDiscoveryPeerConnection *)self stringForStreamEventCode:2];
        unsigned int v10 = self->_outputStream;
        int v12 = 138412546;
        uint64_t v13 = v9;
        __int16 v14 = 2112;
        socklen_t v15 = v10;
        _os_log_impl(&dword_218756000, v8, OS_LOG_TYPE_DEFAULT, "Unexpected event (%@) for output stream %@.", (uint8_t *)&v12, 0x16u);
      }
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return;
    case 4uLL:
      [(MCNearbyDiscoveryPeerConnection *)self syncSendData];
      break;
    case 8uLL:
      unsigned int v11 = mcdpc_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[MCNearbyDiscoveryPeerConnection syncHandleOutputStreamEvent:]((uint64_t)self);
      }
      break;
    default:
      if (a3 == 16)
      {
        uint64_t v6 = mcdpc_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          id v7 = self->_outputStream;
          int v12 = 138412290;
          uint64_t v13 = v7;
          _os_log_impl(&dword_218756000, v6, OS_LOG_TYPE_DEFAULT, "End for stream %@", (uint8_t *)&v12, 0xCu);
        }
        [(MCNearbyDiscoveryPeerConnection *)self syncCloseConnectionNow];
      }
      break;
  }
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = mcdpc_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218242;
    id v12 = a3;
    __int16 v13 = 2112;
    id v14 = [(MCNearbyDiscoveryPeerConnection *)self stringForStreamEventCode:a4];
    _os_log_impl(&dword_218756000, v7, OS_LOG_TYPE_DEFAULT, "Stream [%p] event [%@].", (uint8_t *)&v11, 0x16u);
  }
  if (self->_syncQueue) {
    syncQueue = self->_syncQueue;
  }
  else {
    syncQueue = MEMORY[0x263EF83A0];
  }
  dispatch_assert_queue_V2(syncQueue);
  if (self->_inputStream == a3)
  {
    [(MCNearbyDiscoveryPeerConnection *)self syncHandleInputStreamEvent:a4];
  }
  else if (self->_outputStream == a3)
  {
    [(MCNearbyDiscoveryPeerConnection *)self syncHandleOutputStreamEvent:a4];
  }
  else
  {
    uint32_t v9 = mcdpc_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(MCNearbyDiscoveryPeerConnection *)self stringForStreamEventCode:a4];
      int v11 = 138412290;
      id v12 = v10;
      _os_log_impl(&dword_218756000, v9, OS_LOG_TYPE_DEFAULT, "Unknown stream - ignoring event [%@].", (uint8_t *)&v11, 0xCu);
    }
  }
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

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (void)setInputStream:(id)a3
{
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (void)setOutputStream:(id)a3
{
}

- (void)shouldDecideAboutConnection
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5_0();
  __int16 v5 = 2048;
  uint64_t v6 = v0;
  __int16 v7 = 2048;
  uint64_t v8 = v1;
  __int16 v9 = 2048;
  uint64_t v10 = v2;
  _os_log_error_impl(&dword_218756000, v3, OS_LOG_TYPE_ERROR, "Local [%@] and remote [%@] service name are equal - this should NOT happen. ptr [%p] inputStream [%p] outputStream [%p].", v4, 0x34u);
}

- (void)syncSendMessage:(int)a1 data:(void *)a2 withCompletionHandler:(os_log_t)log .cold.1(int a1, void *a2, os_log_t log)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2[5];
  uint64_t v4 = a2[6];
  __int16 v5 = "?";
  if (a1 == 2000) {
    __int16 v5 = "Hello";
  }
  if (a1 == 2100) {
    __int16 v5 = "Data";
  }
  uint64_t v6 = a2[1];
  int v7 = 136316162;
  if (!a1) {
    __int16 v5 = "Invalid";
  }
  uint64_t v8 = v5;
  __int16 v9 = 2048;
  uint64_t v10 = a2;
  __int16 v11 = 2048;
  uint64_t v12 = v3;
  __int16 v13 = 2048;
  uint64_t v14 = v4;
  __int16 v15 = 2112;
  uint64_t v16 = v6;
  _os_log_error_impl(&dword_218756000, log, OS_LOG_TYPE_ERROR, "Can't send bad message type [%s] - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", (uint8_t *)&v7, 0x34u);
}

- (void)syncProcessMessage:(void *)a1 data:(void *)a2 sequenceNumber:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v5 = [a1 length];
  uint64_t v6 = a2[5];
  uint64_t v7 = a2[6];
  uint64_t v8 = a2[1];
  v9[0] = 67110146;
  v9[1] = v5;
  __int16 v10 = 2048;
  __int16 v11 = a2;
  __int16 v12 = 2048;
  uint64_t v13 = v6;
  __int16 v14 = 2048;
  uint64_t v15 = v7;
  __int16 v16 = 2112;
  uint64_t v17 = v8;
  _os_log_error_impl(&dword_218756000, a3, OS_LOG_TYPE_ERROR, "Hello body too short: %u - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", (uint8_t *)v9, 0x30u);
}

- (void)syncProcessMessage:data:sequenceNumber:.cold.2()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_218756000, v0, v1, "serviceNameLength cannot be 0 - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", v2, v3, v4, v5, v6);
}

- (void)syncProcessMessage:data:sequenceNumber:.cold.3()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_218756000, v0, v1, "Remote name not property terminated at length=%u - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].");
}

- (void)syncReceivedData:error:.cold.1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  v6[0] = 67110402;
  v6[1] = v0;
  __int16 v7 = 1024;
  int v8 = 83886080;
  __int16 v9 = 2048;
  uint64_t v10 = v1;
  __int16 v11 = 2048;
  uint64_t v12 = v2;
  __int16 v13 = 2048;
  uint64_t v14 = v3;
  __int16 v15 = 2112;
  uint64_t v16 = v4;
  _os_log_error_impl(&dword_218756000, v5, OS_LOG_TYPE_ERROR, "Message too big %u > %u - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", (uint8_t *)v6, 0x36u);
}

- (void)syncReceivedData:error:.cold.2()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_218756000, v0, v1, "Receipt has body size %u - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].");
}

- (void)syncReceivedData:error:.cold.3()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_218756000, v0, v1, "Message receipt has no matching handler - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", v2, v3, v4, v5, v6);
}

- (void)syncReceivedData:error:.cold.4()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_218756000, v0, v1, "Unexpected sequence number [%d] - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].");
}

- (void)syncReceivedData:error:.cold.5()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_218756000, v0, v1, "Connection closed after processing message - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", v2, v3, v4, v5, v6);
}

- (void)syncReceivedData:error:.cold.6()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_218756000, v0, v1, "Invalid checksum - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].", v2, v3, v4, v5, v6);
}

- (void)syncReceivedData:error:.cold.7()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_218756000, v0, v1, "InvalidSequenceNumber [%u] - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].");
}

- (void)sendData:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0(&dword_218756000, v0, v1, "Message too big to send (length=%u) - ptr [%p] inputStream [%p] outputStream [%p] remote [%@].");
}

- (void)syncHandleInputStreamEvent:(uint64_t)a1 .cold.1(uint64_t a1)
{
  [*(id *)(a1 + 40) streamError];
  OUTLINED_FUNCTION_17(&dword_218756000, v1, v2, "Stream error occurred: %@.", v3, v4, v5, v6, 2u);
}

- (void)syncHandleOutputStreamEvent:(uint64_t)a1 .cold.1(uint64_t a1)
{
  [*(id *)(a1 + 48) streamError];
  OUTLINED_FUNCTION_17(&dword_218756000, v1, v2, "Stream error occurred: %@.", v3, v4, v5, v6, 2u);
}

@end