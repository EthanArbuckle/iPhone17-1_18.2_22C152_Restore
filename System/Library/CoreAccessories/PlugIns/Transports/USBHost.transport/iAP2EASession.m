@interface iAP2EASession
- (BOOL)closeDataPipes;
- (BOOL)openPipeFromApp;
- (BOOL)openPipeToApp;
- (iAP2EASession)init;
- (iAP2EASession)initWithProtocol:(id)a3 endpointUUID:(id)a4 eaSessionUUID:(id)a5;
- (id)description;
- (int)_createListenSocket;
- (void)_createListenSocket;
- (void)dealloc;
- (void)shuttingDownSession;
@end

@implementation iAP2EASession

- (iAP2EASession)init
{
  return 0;
}

- (iAP2EASession)initWithProtocol:(id)a3 endpointUUID:(id)a4 eaSessionUUID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v23.receiver = self;
  v23.super_class = (Class)iAP2EASession;
  v9 = [(iAP2EASession *)&v23 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    endpointUUID = v9->_endpointUUID;
    v9->_endpointUUID = (NSString *)v10;

    uint64_t v12 = [v8 copy];
    eaSessionUUID = v9->_eaSessionUUID;
    v9->_eaSessionUUID = (NSString *)v12;

    *(void *)&v9->_listenSock = -1;
    *(_WORD *)&v9->_openPipeToAppAfterAccept = 0;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      v14 = MEMORY[0x263EF8438];
      id v15 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[iAP2EASession initWithProtocol:endpointUUID:eaSessionUUID:]((uint64_t)&v9->_endpointUUID, v14, v16, v17, v18, v19, v20, v21);
    }

    if (initWithProtocol_endpointUUID_eaSessionUUID__onceToken != -1) {
      dispatch_once(&initWithProtocol_endpointUUID_eaSessionUUID__onceToken, &__block_literal_global_1);
    }
  }

  return v9;
}

- (void)shuttingDownSession
{
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)iAP2EASession;
  [(iAP2EASession *)&v2 dealloc];
}

- (BOOL)openPipeToApp
{
  if (self->_sock < 0) {
    self->_openPipeToAppAfterAccept = 1;
  }
  else {
    [(iAP2EASession *)self _openPipeToApp];
  }
  return 1;
}

- (BOOL)openPipeFromApp
{
  if (self->_sock < 0) {
    self->_openPipeFromAppAfterAccept = 1;
  }
  else {
    [(iAP2EASession *)self _openPipeFromApp];
  }
  return 1;
}

- (BOOL)closeDataPipes
{
  int listenSock = self->_listenSock;
  if ((listenSock & 0x80000000) == 0)
  {
    close(listenSock);
    self->_int listenSock = -1;
  }
  int sock = self->_sock;
  if ((sock & 0x80000000) == 0)
  {
    close(sock);
    self->_int sock = -1;
  }
  return 1;
}

- (int)_createListenSocket
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  *(_OWORD *)__str = 0u;
  long long v11 = 0u;
  snprintf(__str, 0x100uLL, "%s/ea.%lu", "/var/mobile/Library/ExternalAccessory", [(NSString *)self->_eaSessionUUID hash]);
  unlink(__str);
  int v2 = socket(1, 1, 0);
  if (v2 < 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v3 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      v3 = MEMORY[0x263EF8438];
      id v5 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[iAP2EASession _createListenSocket]();
    }
    goto LABEL_29;
  }
  uint64_t v9 = 0;
  memset(v8.sa_data, 0, 96);
  *(_WORD *)&v8.sa_len = 362;
  __strlcpy_chk();
  if (bind(v2, &v8, 0x6Au))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v3 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      v3 = MEMORY[0x263EF8438];
      id v4 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[iAP2EASession _createListenSocket].cold.5();
    }
LABEL_28:
    int v2 = -1;
LABEL_29:

    return v2;
  }
  if (listen(v2, 5))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v3 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      v3 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[iAP2EASession _createListenSocket]();
    }
    goto LABEL_28;
  }
  return v2;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)iAP2EASession;
  id v4 = [(iAP2EASession *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@ endpointUUID: %@", v4, self->_endpointUUID];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eaSessionUUID, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
}

- (void)initWithProtocol:(uint64_t)a3 endpointUUID:(uint64_t)a4 eaSessionUUID:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_createListenSocket
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_0(&dword_222C74000, v0, v1, "%s:%d can't bind to ea address", v2, v3, v4, v5, v6);
}

@end