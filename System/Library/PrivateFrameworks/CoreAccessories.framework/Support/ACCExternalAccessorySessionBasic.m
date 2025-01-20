@interface ACCExternalAccessorySessionBasic
- (ACCExternalAccessorySessionBasic)initWithEASessionUUID:(id)a3 protocolID:(unsigned __int8)a4 legacyConnectionID:(unint64_t)a5 sessionID:(unsigned __int16)a6;
- (BOOL)closeDataPipes;
- (__CFData)returnEASessionDataFromApp:(unsigned int)a3;
- (unsigned)readEASessionDataFromApp:(id)a3 maxReadSize:(unsigned int)a4;
- (void)_openPipeFromApp;
- (void)_openPipeToApp;
- (void)dealloc;
- (void)sendEABufferDataToApp:(char *)a3 withLength:(unsigned int)a4;
- (void)sendEABufferDataToApp:(id)a3;
- (void)shuttingDownSession;
- (void)startIncomingDataNotifications;
- (void)stopIncomingDataNotifications;
@end

@implementation ACCExternalAccessorySessionBasic

- (ACCExternalAccessorySessionBasic)initWithEASessionUUID:(id)a3 protocolID:(unsigned __int8)a4 legacyConnectionID:(unint64_t)a5 sessionID:(unsigned __int16)a6
{
  v24.receiver = self;
  v24.super_class = (Class)ACCExternalAccessorySessionBasic;
  v6 = [(ACCExternalAccessorySession *)&v24 initWithEASessionUUID:a3 protocolID:a4 legacyConnectionID:a5 sessionID:a6];
  v7 = v6;
  if (v6)
  {
    readSource = v6->_readSource;
    v6->_readSource = 0;

    v7->super._listenSock = [(ACCExternalAccessorySession *)v7 _createListenSocket];
    v9 = [(ACCExternalAccessorySession *)v7 eaSessionUUID];
    v10 = +[NSString stringWithFormat:@"com.apple.accessoryd.easessionqueue.%@", v9];

    id v11 = v10;
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 cStringUsingEncoding:4], 0);
    msgSerialQueue = v7->_msgSerialQueue;
    v7->_msgSerialQueue = (OS_dispatch_queue *)v12;

    dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v7->super._listenSock, 0, (dispatch_queue_t)v7->_msgSerialQueue);
    listenSource = v7->_listenSource;
    v7->_listenSource = (OS_dispatch_source *)v14;

    v7->_continueRunningSession = 0;
    v16 = v7->_listenSource;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = __98__ACCExternalAccessorySessionBasic_initWithEASessionUUID_protocolID_legacyConnectionID_sessionID___block_invoke;
    handler[3] = &unk_1002158C8;
    v17 = v7;
    v23 = v17;
    dispatch_source_set_cancel_handler(v16, handler);
    v18 = v7->_listenSource;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __98__ACCExternalAccessorySessionBasic_initWithEASessionUUID_protocolID_legacyConnectionID_sessionID___block_invoke_2;
    v20[3] = &unk_1002158C8;
    v21 = v17;
    dispatch_source_set_event_handler(v18, v20);
    dispatch_resume((dispatch_object_t)v7->_listenSource);
  }
  return v7;
}

uint64_t __98__ACCExternalAccessorySessionBasic_initWithEASessionUUID_protocolID_legacyConnectionID_sessionID___block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned int *)(*(void *)(a1 + 32) + 12);
  if ((result & 0x80000000) == 0)
  {
    uint64_t result = close(result);
    *(_DWORD *)(*(void *)(a1 + 32) + 12) = -1;
  }
  return result;
}

void __98__ACCExternalAccessorySessionBasic_initWithEASessionUUID_protocolID_legacyConnectionID_sessionID___block_invoke_2(uint64_t a1)
{
  *(void *)&v2.sa_len = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v2.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
  sockaddr v12 = v2;
  sockaddr v13 = v2;
  sockaddr v10 = v2;
  sockaddr v11 = v2;
  sockaddr v8 = v2;
  sockaddr v9 = v2;
  sockaddr v6 = v2;
  sockaddr v7 = v2;
  socklen_t v5 = -1431655766;
  *(_DWORD *)(*(void *)(a1 + 32) + 16) = accept(*(_DWORD *)(*(void *)(a1 + 32) + 12), &v6, &v5);
  int v4 = 1;
  setsockopt(*(_DWORD *)(*(void *)(a1 + 32) + 16), 0xFFFF, 4097, &kSessionDataSendRecvBufferSize, 4u);
  setsockopt(*(_DWORD *)(*(void *)(a1 + 32) + 16), 0xFFFF, 4098, &kSessionDataSendRecvBufferSize, 4u);
  ioctl(*(_DWORD *)(*(void *)(a1 + 32) + 16), 0x8004667EuLL, &v4);
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 20))
  {
    [(id)v3 _openPipeToApp];
    *(unsigned char *)(*(void *)(a1 + 32) + 20) = 0;
    uint64_t v3 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v3 + 21))
  {
    [(id)v3 _openPipeFromApp];
    *(unsigned char *)(*(void *)(a1 + 32) + 21) = 0;
    uint64_t v3 = *(void *)(a1 + 32);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(v3 + 128));
}

- (void)shuttingDownSession
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    socklen_t v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    socklen_t v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    sockaddr v6 = [(ACCExternalAccessorySession *)self description];
    *(_DWORD *)buf = 138412290;
    sockaddr v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "shuttingDown %@", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)ACCExternalAccessorySessionBasic;
  [(ACCExternalAccessorySession *)&v7 shuttingDownSession];
}

- (void)dealloc
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    socklen_t v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    socklen_t v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sockaddr v6 = [(ACCExternalAccessorySession *)self description];
    *(_DWORD *)buf = 138412290;
    sockaddr v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "dealloc %@", buf, 0xCu);
  }
  dispatch_source_cancel((dispatch_source_t)self->_listenSource);
  readSource = self->_readSource;
  if (readSource) {
    dispatch_source_cancel(readSource);
  }
  v8.receiver = self;
  v8.super_class = (Class)ACCExternalAccessorySessionBasic;
  [(ACCExternalAccessorySession *)&v8 dealloc];
}

- (void)_openPipeToApp
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 10;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    id v4 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)socklen_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "_openPipeToApp is a no-op", v5, 2u);
  }
}

- (void)_openPipeFromApp
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    socklen_t v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    socklen_t v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int sessionID = self->super._sessionID;
    *(_DWORD *)buf = 67109376;
    LODWORD(v21[0]) = sessionID;
    WORD2(v21[0]) = 2048;
    *(void *)((char *)v21 + 6) = [(ACCExternalAccessorySession *)self legacyConnectionID];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SUCCESS - session=%d for legacyConnectionID=0x%llx opened pipe from app", buf, 0x12u);
  }

  objc_super v7 = [(ACCExternalAccessorySession *)self sessionNotificationLock];
  [v7 lock];

  objc_super v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, self->super._sock, 0, (dispatch_queue_t)self->_msgSerialQueue);
  readSource = self->_readSource;
  self->_readSource = v8;

  sockaddr v10 = [(ACCExternalAccessorySession *)self sessionNotificationLock];
  [v10 unlock];

  sockaddr v11 = self->_readSource;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __52__ACCExternalAccessorySessionBasic__openPipeFromApp__block_invoke;
  handler[3] = &unk_1002158C8;
  void handler[4] = self;
  dispatch_source_set_event_handler(v11, handler);
  sockaddr v12 = self->_readSource;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __52__ACCExternalAccessorySessionBasic__openPipeFromApp__block_invoke_73;
  v18[3] = &unk_1002158C8;
  v18[4] = self;
  dispatch_source_set_cancel_handler(v12, v18);
  sockaddr v13 = [(ACCExternalAccessorySession *)self sessionNotificationLock];
  [v13 lock];

  if (self->_continueRunningSession)
  {
    dispatch_resume((dispatch_object_t)self->_readSource);
    if (gLogObjects && gNumLogObjects >= 10)
    {
      dispatch_source_t v14 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      dispatch_source_t v14 = &_os_log_default;
      id v15 = &_os_log_default;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(ACCExternalAccessorySession *)self eaSessionUUID];
      *(_DWORD *)buf = 138412290;
      v21[0] = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "eaSessionUUID %@ was already activated, resume readsource", buf, 0xCu);
    }
  }
  v17 = [(ACCExternalAccessorySession *)self sessionNotificationLock];
  [v17 unlock];
}

void __52__ACCExternalAccessorySessionBasic__openPipeFromApp__block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 10;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    id v4 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __52__ACCExternalAccessorySessionBasic__openPipeFromApp__block_invoke_cold_3(a1);
  }

  socklen_t v5 = +[ACCExternalAccessorySessionManager sharedManager];
  objc_super v7 = *(void **)(a1 + 32);
  sockaddr v6 = (id *)(a1 + 32);
  objc_super v8 = [v7 eaSessionUUID];
  [v5 outgoingEADataFromClientAvailable:v8];

  if (gLogObjects && gNumLogObjects >= 10)
  {
    sockaddr v9 = *(id *)(gLogObjects + 72);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    sockaddr v9 = &_os_log_default;
    id v10 = &_os_log_default;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __52__ACCExternalAccessorySessionBasic__openPipeFromApp__block_invoke_cold_1(v6);
  }
}

id __52__ACCExternalAccessorySessionBasic__openPipeFromApp__block_invoke_73(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)ACCExternalAccessorySessionBasic;
  return objc_msgSendSuper2(&v2, "closeDataPipes");
}

- (BOOL)closeDataPipes
{
  listenSource = self->_listenSource;
  if (listenSource) {
    dispatch_source_cancel(listenSource);
  }
  readSource = self->_readSource;
  if (readSource) {
    dispatch_source_cancel(readSource);
  }
  return 1;
}

- (void)sendEABufferDataToApp:(id)a3
{
  id v4 = a3;
  if (self->super._sock != -1)
  {
    if (gLogObjects) {
      BOOL v5 = gNumLogObjects < 10;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      objc_super v7 = &_os_log_default;
      id v6 = &_os_log_default;
    }
    else
    {
      objc_super v7 = *(id *)(gLogObjects + 72);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[ACCExternalAccessorySessionBasic sendEABufferDataToApp:](v4);
    }

    int sock = self->super._sock;
    id v9 = v4;
    send(sock, [v9 bytes], (size_t)objc_msgSend(v9, "length"), 0);
  }
}

- (void)sendEABufferDataToApp:(char *)a3 withLength:(unsigned int)a4
{
  int sock = self->super._sock;
  if (sock != -1) {
    send(sock, a3, a4, 0);
  }
}

- (unsigned)readEASessionDataFromApp:(id)a3 maxReadSize:(unsigned int)a4
{
  id v6 = a3;
  ssize_t v7 = recv(self->super._sock, (char *)[v6 mutableBytes] + 2, a4, 0);
  uint64_t v8 = v7;
  if (v7 == -1)
  {
    if (*__error() != 35)
    {
      if (gLogObjects && gNumLogObjects >= 10)
      {
        id v10 = *(id *)(gLogObjects + 72);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v10 = &_os_log_default;
        id v14 = &_os_log_default;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = *__error();
        int v19 = 67109120;
        LODWORD(v20) = v15;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ERROR - error reading data from pipe (errno=%d)", (uint8_t *)&v19, 8u);
      }
    }
  }
  else if (v7 >= 1)
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      id v9 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v9 = &_os_log_default;
      id v11 = &_os_log_default;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ACCExternalAccessorySessionBasic readEASessionDataFromApp:maxReadSize:].cold.5(self, v8, v9);
    }

    [v6 setLength:v8 + 2];
    if (gLogObjects && gNumLogObjects >= 10)
    {
      sockaddr v12 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      sockaddr v12 = &_os_log_default;
      id v13 = &_os_log_default;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[ACCExternalAccessorySessionBasic readEASessionDataFromApp:maxReadSize:](v6, v12);
    }
    goto LABEL_38;
  }
  if (gLogObjects && gNumLogObjects >= 10)
  {
    sockaddr v12 = *(id *)(gLogObjects + 72);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    sockaddr v12 = &_os_log_default;
    id v16 = &_os_log_default;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v17 = [(ACCExternalAccessorySession *)self eaSessionUUID];
    int v19 = 134218242;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    v22 = v17;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Read %lld bytes for sessionUUID %@, not appending data", (uint8_t *)&v19, 0x16u);
  }
  LODWORD(v8) = 0;
LABEL_38:

  return v8;
}

- (__CFData)returnEASessionDataFromApp:(unsigned int)a3
{
  uint64_t v5 = a3;
  id v6 = (char *)malloc_type_calloc(1uLL, a3, 0x13DDB824uLL);
  ssize_t v7 = recv(self->super._sock, v6 + 2, v5 - 2, 0);
  uint64_t v8 = (const char *)v7;
  if (v7 == -1)
  {
    if (*__error() != 35)
    {
      if (gLogObjects && gNumLogObjects >= 10)
      {
        id v10 = *(id *)(gLogObjects + 72);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v10 = &_os_log_default;
        id v16 = &_os_log_default;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = *__error();
        int v22 = 136315906;
        v23 = "/Library/Caches/com.apple.xbs/Sources/CoreAccessories/Apple/accessoryd/XPC_Servers/ACCExternalAccessorySession.m";
        __int16 v24 = 2080;
        v25 = "-[ACCExternalAccessorySessionBasic returnEASessionDataFromApp:]";
        __int16 v26 = 1024;
        unsigned int v27 = 391;
        __int16 v28 = 1024;
        unsigned int v29 = v17;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ERROR - %s:%s - %d error reading data from pipe (errno=%d)\n", (uint8_t *)&v22, 0x22u);
      }
    }
  }
  else if (v7 >= 1)
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      id v9 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v9 = &_os_log_default;
      id v11 = &_os_log_default;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      __int16 v21 = [(ACCExternalAccessorySession *)self eaSessionUUID];
      int v22 = 134218754;
      v23 = v8;
      __int16 v24 = 2112;
      v25 = v21;
      __int16 v26 = 1024;
      unsigned int v27 = [(ACCExternalAccessorySession *)self sessionID];
      __int16 v28 = 1024;
      unsigned int v29 = a3;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Read %lld bytes for sessionUUID %@ sessionID %d, maxReadSize (including two extra bytes of padding) = %d", (uint8_t *)&v22, 0x22u);
    }
    CFDataRef v12 = +[NSMutableData dataWithBytesNoCopy:v6 length:v8 + 2];
    if (gLogObjects && gNumLogObjects >= 10)
    {
      id v13 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v13 = &_os_log_default;
      id v14 = &_os_log_default;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[ACCExternalAccessorySessionBasic returnEASessionDataFromApp:](v12);
    }

    int v15 = v12;
    goto LABEL_39;
  }
  free(v6);
  if (gLogObjects && gNumLogObjects >= 10)
  {
    CFDataRef v12 = (const __CFData *)*(id *)(gLogObjects + 72);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    CFDataRef v12 = (const __CFData *)&_os_log_default;
    id v18 = &_os_log_default;
  }
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO))
  {
    int v19 = [(ACCExternalAccessorySession *)self eaSessionUUID];
    int v22 = 134218242;
    v23 = v8;
    __int16 v24 = 2112;
    v25 = v19;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_INFO, "Read %lld bytes for sessionUUID %@, not appending data", (uint8_t *)&v22, 0x16u);
  }
  int v15 = 0;
LABEL_39:

  return v15;
}

- (void)stopIncomingDataNotifications
{
  id v3 = [(ACCExternalAccessorySession *)self sessionNotificationLock];
  [v3 lock];

  if (self->_continueRunningSession)
  {
    readSource = self->_readSource;
    if (readSource) {
      dispatch_suspend(readSource);
    }
    self->_continueRunningSession = 0;
  }
  id v5 = [(ACCExternalAccessorySession *)self sessionNotificationLock];
  [v5 unlock];
}

- (void)startIncomingDataNotifications
{
  id v3 = [(ACCExternalAccessorySession *)self sessionNotificationLock];
  [v3 lock];

  if (!self->_continueRunningSession)
  {
    self->_continueRunningSession = 1;
    readSource = self->_readSource;
    if (readSource)
    {
      dispatch_resume(readSource);
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 10)
      {
        id v5 = *(id *)(gLogObjects + 72);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v5 = &_os_log_default;
        id v6 = &_os_log_default;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        ssize_t v7 = [(ACCExternalAccessorySession *)self eaSessionUUID];
        int v9 = 138412290;
        id v10 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "readsource not yet created for EA session UUID %@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  uint64_t v8 = [(ACCExternalAccessorySession *)self sessionNotificationLock];
  [v8 unlock];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_storeStrong((id *)&self->_listenSource, 0);
  objc_storeStrong((id *)&self->_msgSerialQueue, 0);
  objc_storeStrong((id *)&self->_continueRunningSemaphore, 0);
  objc_storeStrong((id *)&self->_continueRunningQueue, 0);
  objc_storeStrong((id *)&self->_packetPoolLock, 0);

  objc_storeStrong((id *)&self->_eaPacketPool, 0);
}

void __52__ACCExternalAccessorySessionBasic__openPipeFromApp__block_invoke_cold_1(id *a1)
{
  v1 = [*a1 eaSessionUUID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v2, v3, "finished sending outgoingEADataFromClientAvailable notification for sessionUUID %@", v4, v5, v6, v7, v8);
}

void __52__ACCExternalAccessorySessionBasic__openPipeFromApp__block_invoke_cold_3(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) eaSessionUUID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v2, v3, "in _readSource event handler for session %@. sending data available notification", v4, v5, v6, v7, v8);
}

- (void)sendEABufferDataToApp:(void *)a1 .cold.1(void *a1)
{
  [a1 length];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v1, v2, "Sending %lu bytes to application", v3, v4, v5, v6, v7);
}

- (void)readEASessionDataFromApp:(void *)a1 maxReadSize:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  [a1 length];
  OUTLINED_FUNCTION_3();
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "dataBuffer length %lu is now %@ (first two bytes are reserved for sessionID)", v4, 0x16u);
}

- (void)readEASessionDataFromApp:(NSObject *)a3 maxReadSize:.cold.5(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = [a1 eaSessionUUID];
  int v7 = 134218498;
  uint64_t v8 = a2;
  __int16 v9 = 2112;
  id v10 = v6;
  __int16 v11 = 1024;
  unsigned int v12 = [a1 sessionID];
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Read %lld bytes for sessionUUID %@ sessionID %d", (uint8_t *)&v7, 0x1Cu);
}

- (void)returnEASessionDataFromApp:(const __CFData *)a1 .cold.3(const __CFData *a1)
{
  CFDataGetLength(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v1, v2, "Read %ld total bytes into CFMutableData buffer, including padding", v3, v4, v5, v6, v7);
}

@end