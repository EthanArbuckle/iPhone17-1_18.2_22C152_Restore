@interface ACCOOBBTPairingAccessory
- (ACCOOBBTPairingAccessory)init;
- (ACCiAP2ShimAccessory)iap2ShimAccessory;
- (BOOL)carPlaySupported;
- (BOOL)isBTReady;
- (BOOL)oobPairing2Supported;
- (BTAccessoryManagerImpl)BTAccessoryManager;
- (BTDeviceImpl)currentRemoteBTDevice;
- (BTSessionImpl)BTSession;
- (NSData)certData;
- (NSData)certSerial;
- (NSData)currentRemoteMACAddress;
- (NSString)currentOOBBTPairingUID;
- (NSString)displayName;
- (OS_dispatch_queue)BTSessionQueue;
- (OS_dispatch_queue)processingQueue;
- (OS_dispatch_semaphore)setup_complete_semaphore;
- (id)description;
- (void)dealloc;
- (void)init;
- (void)setBTAccessoryManager:(BTAccessoryManagerImpl *)a3;
- (void)setBTSession:(BTSessionImpl *)a3;
- (void)setBTSessionQueue:(id)a3;
- (void)setCarPlaySupported:(BOOL)a3;
- (void)setCertData:(id)a3;
- (void)setCertSerial:(id)a3;
- (void)setCurrentOOBBTPairingUID:(id)a3;
- (void)setCurrentRemoteBTDevice:(BTDeviceImpl *)a3;
- (void)setCurrentRemoteMACAddress:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIap2ShimAccessory:(id)a3;
- (void)setIsBTReady:(BOOL)a3;
- (void)setOobPairing2Supported:(BOOL)a3;
- (void)setProcessingQueue:(id)a3;
- (void)setSetup_complete_semaphore:(id)a3;
@end

@implementation ACCOOBBTPairingAccessory

- (ACCOOBBTPairingAccessory)init
{
  v31.receiver = self;
  v31.super_class = (Class)ACCOOBBTPairingAccessory;
  v2 = [(ACCOOBBTPairingAccessory *)&v31 init];
  v3 = v2;
  if (v2)
  {
    iap2ShimAccessory = v2->_iap2ShimAccessory;
    v2->_iap2ShimAccessory = 0;

    currentOOBBTPairingUID = v3->_currentOOBBTPairingUID;
    v3->_currentOOBBTPairingUID = 0;

    displayName = v3->_displayName;
    v3->_displayName = 0;

    v3->_isBTReady = 0;
    v3->_BTAccessoryManager = 0;
    dispatch_queue_t v7 = dispatch_queue_create((const char *)kBTQueueName, 0);
    BTSessionQueue = v3->_BTSessionQueue;
    v3->_BTSessionQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create((const char *)kProcessingQueueName, 0);
    processingQueue = v3->_processingQueue;
    v3->_processingQueue = (OS_dispatch_queue *)v9;

    currentRemoteMACAddress = v3->_currentRemoteMACAddress;
    v3->_currentRemoteMACAddress = 0;

    v3->_currentRemoteBTDevice = 0;
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    setup_complete_semaphore = v3->_setup_complete_semaphore;
    v3->_setup_complete_semaphore = (OS_dispatch_semaphore *)v12;

    v30 = __callbackSessionEvent;
    v14 = v3->_processingQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__ACCOOBBTPairingAccessory_init__block_invoke;
    block[3] = &unk_2645E7C20;
    v15 = v3;
    v29 = v15;
    dispatch_async(v14, block);
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    int v27 = -1431655766;
    int v27 = BTSessionAttachWithQueue();
    if (*((_DWORD *)v25 + 6))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCOOBBTPairingAccessory init]();
        }
        v16 = MEMORY[0x263EF8438];
        id v17 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingAccessory init]();
      }

      dispatch_time_t v18 = dispatch_time(0, 5000000000);
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __32__ACCOOBBTPairingAccessory_init__block_invoke_4;
      v20[3] = &unk_2645E7C48;
      v22 = &v24;
      v23 = v30;
      v21 = v15;
      dispatch_after(v18, MEMORY[0x263EF83A0], v20);
    }
    _Block_object_dispose(&v24, 8);
  }
  return v3;
}

void __32__ACCOOBBTPairingAccessory_init__block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221CBA000, v4, OS_LOG_TYPE_DEFAULT, "Blocking the processing queue while waiting for the BT session initialization to finish...", buf, 2u);
  }

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 96), 0xFFFFFFFFFFFFFFFFLL);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v5 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    v5 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v7 = 0;
    _os_log_impl(&dword_221CBA000, v5, OS_LOG_TYPE_DEFAULT, "Unblocking the processing queue", v7, 2u);
  }
}

void __32__ACCOOBBTPairingAccessory_init__block_invoke_4(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = BTSessionAttachWithQueue();
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects <= 0;
  }
  else {
    BOOL v2 = 1;
  }
  int v3 = !v2;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (v3)
    {
      v4 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingAccessory init]();
      }
      v4 = MEMORY[0x263EF8438];
      id v5 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __32__ACCOOBBTPairingAccessory_init__block_invoke_4_cold_2();
    }
  }
  else
  {
    if (v3)
    {
      v4 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingAccessory init]();
      }
      v4 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v7 = 0;
      _os_log_impl(&dword_221CBA000, v4, OS_LOG_TYPE_DEFAULT, "2nd attempted to establish BT session succeeded", v7, 2u);
    }
  }
}

- (void)dealloc
{
  if (self->_BTSession)
  {
    int v3 = BTSessionDetachWithQueue();
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects <= 0;
    }
    else {
      BOOL v4 = 1;
    }
    int v5 = !v4;
    if (v3)
    {
      if (v5)
      {
        id v6 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCOOBBTPairingAccessory init]();
        }
        id v6 = MEMORY[0x263EF8438];
        id v7 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      v8 = "BTSessionDetachWithQueue failed";
    }
    else
    {
      if (v5)
      {
        id v6 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCOOBBTPairingAccessory init]();
        }
        id v6 = MEMORY[0x263EF8438];
        id v9 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      v8 = "Succesfully detached from BTSession";
    }
    _os_log_impl(&dword_221CBA000, v6, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
LABEL_24:
  }
  iap2ShimAccessory = self->_iap2ShimAccessory;
  self->_iap2ShimAccessory = 0;

  currentOOBBTPairingUID = self->_currentOOBBTPairingUID;
  self->_currentOOBBTPairingUID = 0;

  currentRemoteMACAddress = self->_currentRemoteMACAddress;
  self->_currentRemoteMACAddress = 0;

  setup_complete_semaphore = self->_setup_complete_semaphore;
  *(_OWORD *)&self->_setup_complete_semaphore = 0u;

  BTSessionQueue = self->_BTSessionQueue;
  *(_OWORD *)&self->_BTAccessoryManager = 0u;

  processingQueue = self->_processingQueue;
  *(_OWORD *)&self->_BTSession = 0u;

  v16.receiver = self;
  v16.super_class = (Class)ACCOOBBTPairingAccessory;
  [(ACCOOBBTPairingAccessory *)&v16 dealloc];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<ACCOOBBTPairingAccessory>[%@; displayName=%@; certData=%lu bytes; certSerial=%lu bytes; carPlaySupported=%d; oobPairing2Supported=%d; _currentOOBBTPairingUID=%@; _currentRemoteMACAddress=%@]",
               self->_iap2ShimAccessory,
               self->_displayName,
               [(NSData *)self->_certData length],
               [(NSData *)self->_certSerial length],
               self->_carPlaySupported,
               self->_oobPairing2Supported,
               self->_currentOOBBTPairingUID,
               self->_currentRemoteMACAddress);
}

- (ACCiAP2ShimAccessory)iap2ShimAccessory
{
  return self->_iap2ShimAccessory;
}

- (void)setIap2ShimAccessory:(id)a3
{
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (NSData)certData
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCertData:(id)a3
{
}

- (NSData)certSerial
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCertSerial:(id)a3
{
}

- (BOOL)carPlaySupported
{
  return self->_carPlaySupported;
}

- (void)setCarPlaySupported:(BOOL)a3
{
  self->_carPlaySupported = a3;
}

- (BOOL)oobPairing2Supported
{
  return self->_oobPairing2Supported;
}

- (void)setOobPairing2Supported:(BOOL)a3
{
  self->_oobPairing2Supported = a3;
}

- (NSString)currentOOBBTPairingUID
{
  return self->_currentOOBBTPairingUID;
}

- (void)setCurrentOOBBTPairingUID:(id)a3
{
}

- (NSData)currentRemoteMACAddress
{
  return self->_currentRemoteMACAddress;
}

- (void)setCurrentRemoteMACAddress:(id)a3
{
}

- (BTAccessoryManagerImpl)BTAccessoryManager
{
  return self->_BTAccessoryManager;
}

- (void)setBTAccessoryManager:(BTAccessoryManagerImpl *)a3
{
  self->_BTAccessoryManager = a3;
}

- (OS_dispatch_queue)BTSessionQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBTSessionQueue:(id)a3
{
}

- (BTSessionImpl)BTSession
{
  return self->_BTSession;
}

- (void)setBTSession:(BTSessionImpl *)a3
{
  self->_BTSession = a3;
}

- (BOOL)isBTReady
{
  return self->_isBTReady;
}

- (void)setIsBTReady:(BOOL)a3
{
  self->_isBTReady = a3;
}

- (OS_dispatch_queue)processingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setProcessingQueue:(id)a3
{
}

- (OS_dispatch_semaphore)setup_complete_semaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSetup_complete_semaphore:(id)a3
{
}

- (BTDeviceImpl)currentRemoteBTDevice
{
  return self->_currentRemoteBTDevice;
}

- (void)setCurrentRemoteBTDevice:(BTDeviceImpl *)a3
{
  self->_currentRemoteBTDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setup_complete_semaphore, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_BTSessionQueue, 0);
  objc_storeStrong((id *)&self->_currentRemoteMACAddress, 0);
  objc_storeStrong((id *)&self->_currentOOBBTPairingUID, 0);
  objc_storeStrong((id *)&self->_certSerial, 0);
  objc_storeStrong((id *)&self->_certData, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_iap2ShimAccessory, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_221CBA000, MEMORY[0x263EF8438], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

void __32__ACCOOBBTPairingAccessory_init__block_invoke_4_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_221CBA000, v0, v1, "ERROR: Unable to establish connection to BTServer. (Not retrying)", v2, v3, v4, v5, v6);
}

@end