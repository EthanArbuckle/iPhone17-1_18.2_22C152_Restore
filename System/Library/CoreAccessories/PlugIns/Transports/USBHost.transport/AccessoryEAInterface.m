@interface AccessoryEAInterface
+ (id)findNativeEAInterfacesForRegistryID:(unint64_t)a3;
+ (void)initializeSessionClose;
- (AccessoryEAInterface)initWithProtocol:(id)a3 endpointUUID:(id)a4 vid:(unsigned __int16)a5 pid:(unsigned __int16)a6 eaSessionUUID:(id)a7 USBDeviceID:(unint64_t)a8;
- (BOOL)closeDataPipes;
- (BOOL)writeData:(id)a3;
- (IOUSBInterfaceStruct942)_createInterfaceFromUSBID:(unint64_t)a3;
- (id)_dequeueReadBuffer;
- (id)_dequeueWriteBuffer;
- (id)dataInHandler;
- (int)_clearPipeStall:(unsigned __int8)a3;
- (unint64_t)registryEntryID;
- (unsigned)pid;
- (unsigned)vid;
- (unsigned)vidpid;
- (void)_acceptSocketCB:(__CFSocket *)a3 acceptedSock:(int)a4;
- (void)_cancelThread;
- (void)_enqueueReadBuffer:(id)a3;
- (void)_enqueueWriteBuffer:(id)a3;
- (void)_openPipeFromApp;
- (void)_openPipeFromAppOnThread;
- (void)_openPipeToApp;
- (void)_readComplete:(id)a3 readLength:(unint64_t)a4;
- (void)_readSessionDataFromApp;
- (void)_readSessionDataFromUSB;
- (void)_registerListenSocket;
- (void)_run;
- (void)_sendSessionCloseNotification;
- (void)_sendSessionOpenNotification;
- (void)_writeComplete:(id)a3 writeLength:(unint64_t)a4;
- (void)_writeData:(id)a3;
- (void)_writeSessionDataToApp;
- (void)_writeUSBData:(id)a3;
- (void)dealloc;
- (void)setDataInHandler:(id)a3;
- (void)shuttingDownSession;
@end

@implementation AccessoryEAInterface

- (AccessoryEAInterface)initWithProtocol:(id)a3 endpointUUID:(id)a4 vid:(unsigned __int16)a5 pid:(unsigned __int16)a6 eaSessionUUID:(id)a7 USBDeviceID:(unint64_t)a8
{
  int v10 = a6;
  id v14 = a3;
  v38.receiver = self;
  v38.super_class = (Class)AccessoryEAInterface;
  v15 = [(iAP2EASession *)&v38 initWithProtocol:v14 endpointUUID:a4 eaSessionUUID:a7];
  v16 = v15;
  if (v15)
  {
    v15->_listenSockRef = 0;
    v15->_listenSockRls = 0;
    v15->_sockRef = 0;
    v15->_sockRls = 0;
    v15->_sockReadDisabled = 0;
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    writeBufferArray = v16->_writeBufferArray;
    v16->_writeBufferArray = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    readBufferArray = v16->_readBufferArray;
    v16->_readBufferArray = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    dataForAppArray = v16->_dataForAppArray;
    v16->_dataForAppArray = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    allWriteBuffers = v16->_allWriteBuffers;
    v16->_allWriteBuffers = v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    allReadBuffers = v16->_allReadBuffers;
    v16->_allReadBuffers = v25;

    v16->_deviceID = a8;
    uint64_t v27 = [[NSString alloc] initWithString:v14];
    protocolName = v16->_protocolName;
    v16->_protocolName = (NSString *)v27;

    v16->_vid = a5;
    v16->_pid = v10;
    int v29 = v10 | (v16->_vid << 16);
    v16->_vidpid = v29;
    if (v29 == 95164176) {
      uint64_t v30 = 1024;
    }
    else {
      uint64_t v30 = 0x20000;
    }
    int v31 = 8;
    do
    {
      v32 = [[EAUSBBuffer alloc] initWithSession:v16 bufferSize:v30];
      [(NSMutableArray *)v16->_allReadBuffers addObject:v32];
      [(AccessoryEAInterface *)v16 _enqueueReadBuffer:v32];

      --v31;
    }
    while (v31);
    int v33 = 8;
    do
    {
      v34 = [[EAUSBBuffer alloc] initWithSession:v16 bufferSize:v30];
      [(NSMutableArray *)v16->_allWriteBuffers addObject:v34];
      [(AccessoryEAInterface *)v16 _enqueueWriteBuffer:v34];

      --v33;
    }
    while (v33);
    uint64_t v35 = [objc_alloc(MEMORY[0x263F08B88]) initWithTarget:v16 selector:sel__run object:0];
    runLoopThread = v16->_runLoopThread;
    v16->_runLoopThread = (NSThread *)v35;

    [(NSThread *)v16->_runLoopThread start];
    [(AccessoryEAInterface *)v16 performSelector:sel__registerListenSocket onThread:v16->_runLoopThread withObject:0 waitUntilDone:1];
  }

  return v16;
}

- (void)shuttingDownSession
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    protocolName = self->_protocolName;
    *(_DWORD *)buf = 138412290;
    v9 = protocolName;
    _os_log_impl(&dword_222C74000, v5, OS_LOG_TYPE_DEFAULT, "Shutting down session for NativeEA protocol %@", buf, 0xCu);
  }

  [(AccessoryEAInterface *)self closeDataPipes];
  [(AccessoryEAInterface *)self _sendSessionCloseNotification];
  v7.receiver = self;
  v7.super_class = (Class)AccessoryEAInterface;
  [(iAP2EASession *)&v7 shuttingDownSession];
}

- (void)dealloc
{
  protocolName = self->_protocolName;
  self->_protocolName = 0;

  writeBufferArray = self->_writeBufferArray;
  self->_writeBufferArray = 0;

  readBufferArray = self->_readBufferArray;
  self->_readBufferArray = 0;

  dataForAppArray = self->_dataForAppArray;
  self->_dataForAppArray = 0;

  allWriteBuffers = self->_allWriteBuffers;
  self->_allWriteBuffers = 0;

  allReadBuffers = self->_allReadBuffers;
  self->_allReadBuffers = 0;

  v9.receiver = self;
  v9.super_class = (Class)AccessoryEAInterface;
  [(iAP2EASession *)&v9 dealloc];
}

- (void)setDataInHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    objc_super v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    objc_super v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x223CA5B10](self->_dataInHandler);
    objc_super v9 = (void *)MEMORY[0x223CA5B10](v4);
    unsigned int vidpid = self->_vidpid;
    int v13 = 134218496;
    id v14 = v8;
    __int16 v15 = 2048;
    v16 = v9;
    __int16 v17 = 1024;
    unsigned int v18 = vidpid;
    _os_log_impl(&dword_222C74000, v7, OS_LOG_TYPE_DEFAULT, "EA Native USB: dataInHandler %p -> %p, vidpid 0x%x", (uint8_t *)&v13, 0x1Cu);
  }
  v11 = (void *)MEMORY[0x223CA5B10](v4);
  id dataInHandler = self->_dataInHandler;
  self->_id dataInHandler = v11;

  if (self->_vidpid == 95164176) {
    [(AccessoryEAInterface *)self performSelector:sel__readSessionDataFromUSB onThread:self->_runLoopThread withObject:0 waitUntilDone:0];
  }
}

- (void)_writeData:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AccessoryEAInterface *)self _dequeueWriteBuffer];
  if (v5)
  {
    unint64_t v6 = [v4 length];
    unint64_t v7 = [v5 writeSpaceRemaining];
    if (gLogObjects) {
      BOOL v8 = gNumLogObjects <= 0;
    }
    else {
      BOOL v8 = 1;
    }
    int v9 = !v8;
    if (v6 <= v7)
    {
      if (v9)
      {
        int v13 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
        }
        int v13 = MEMORY[0x263EF8438];
        id v16 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[AccessoryEAInterface _writeData:].cold.5(v6, v13, v17, v18, v19, v20, v21, v22);
      }

      memcpy((void *)[v5 writePtr], (const void *)objc_msgSend(v4, "bytes"), v6);
      [v5 moveWritePtr:v6];
      if ([v5 dataLength]) {
        [(AccessoryEAInterface *)self _writeUSBData:v5];
      }
      else {
        [(AccessoryEAInterface *)self _enqueueWriteBuffer:v5];
      }
    }
    else
    {
      if (v9)
      {
        uint64_t v10 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
        }
        uint64_t v10 = MEMORY[0x263EF8438];
        id v15 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        [(AccessoryEAInterface *)v5 _writeData:v10];
      }
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v11 = gNumLogObjects < 1;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      id v14 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    else
    {
      id v14 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[AccessoryEAInterface _writeData:]();
    }
  }
}

- (BOOL)writeData:(id)a3
{
  return 1;
}

- (void)_run
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_222C74000, v0, v1, "EA Native USB: failed to open USB Interface: 0x%x", v2, v3, v4, v5, v6);
}

- (void)_registerListenSocket
{
  context.version = 0;
  context.info = self;
  memset(&context.retain, 0, 24);
  int v3 = [(iAP2EASession *)self _createListenSocket];
  self->super._listenSock = v3;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t v5 = CFSocketCreateWithNative((CFAllocatorRef)*MEMORY[0x263EFFB08], v3, 2uLL, (CFSocketCallBack)_StaticSockCallback, &context);
  self->_listenSockRef = v5;
  self->_listenSockRls = CFSocketCreateRunLoopSource(v4, v5, 0);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, self->_listenSockRls, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
}

- (void)_acceptSocketCB:(__CFSocket *)a3 acceptedSock:(int)a4
{
  int v16 = 1;
  context.version = 0;
  context.info = self;
  memset(&context.retain, 0, 24);
  self->super._sock = a4;
  uint64_t v5 = CFSocketCreateWithNative(0, a4, 9uLL, (CFSocketCallBack)_StaticSockCallback, &context);
  self->_sockRef = v5;
  CFSocketDisableCallBacks(v5, 9uLL);
  self->_sockRls = CFSocketCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x263EFFB08], self->_sockRef, 0);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, self->_sockRls, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  int v15 = 0x20000;
  if (setsockopt(self->super._sock, 0xFFFF, 4097, &v15, 4u))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      unint64_t v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      unint64_t v7 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AccessoryEAInterface _acceptSocketCB:acceptedSock:].cold.5();
    }
LABEL_24:

    sockRef = self->_sockRef;
    if (sockRef)
    {
      CFSocketInvalidate(sockRef);
      BOOL v11 = self->_sockRef;
      if (v11) {
        CFRelease(v11);
      }
      self->_sockRef = 0;
    }
    sockRls = self->_sockRls;
    if (sockRls)
    {
      CFRunLoopSourceInvalidate(sockRls);
      int v13 = self->_sockRls;
      if (v13) {
        CFRelease(v13);
      }
      self->_sockRls = 0;
    }
    return;
  }
  if (setsockopt(self->super._sock, 0xFFFF, 4098, &v15, 4u))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      unint64_t v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      unint64_t v7 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AccessoryEAInterface _acceptSocketCB:acceptedSock:]();
    }
    goto LABEL_24;
  }
  if (ioctl(self->super._sock, 0x8004667EuLL, &v16) < 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      unint64_t v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      unint64_t v7 = MEMORY[0x263EF8438];
      id v14 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AccessoryEAInterface _acceptSocketCB:acceptedSock:]();
    }
    goto LABEL_24;
  }
  CFRunLoopSourceInvalidate(self->_listenSockRls);
  CFRelease(self->_listenSockRls);
  self->_listenSockRls = 0;
  CFSocketInvalidate(self->_listenSockRef);
  CFRelease(self->_listenSockRef);
  self->_listenSockRef = 0;
  close(self->super._listenSock);
  self->super._listenSock = -1;
  if (self->super._openPipeToAppAfterAccept)
  {
    [(AccessoryEAInterface *)self _openPipeToApp];
    self->super._openPipeToAppAfterAccept = 0;
  }
  if (self->super._openPipeFromAppAfterAccept)
  {
    [(AccessoryEAInterface *)self _openPipeFromApp];
    self->super._openPipeFromAppAfterAccept = 0;
  }
}

- (void)_openPipeToApp
{
}

- (void)_openPipeFromApp
{
}

- (void)_openPipeFromAppOnThread
{
}

- (BOOL)closeDataPipes
{
  runLoopThread = self->_runLoopThread;
  if (runLoopThread)
  {
    [(NSThread *)runLoopThread cancel];
    [(AccessoryEAInterface *)self performSelector:sel__cancelThread onThread:self->_runLoopThread withObject:0 waitUntilDone:1];
    CFAllocatorRef v4 = self->_runLoopThread;
    self->_runLoopThread = 0;
  }
  return 1;
}

- (void)_cancelThread
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_222C74000, v0, v1, "EA Native USB: failed to set alt USB Interface", v2, v3, v4, v5, v6);
}

- (void)_enqueueWriteBuffer:(id)a3
{
  [(NSMutableArray *)self->_writeBufferArray addObject:a3];
  if (self->_sockReadDisabled)
  {
    sockRef = self->_sockRef;
    if (sockRef)
    {
      CFSocketEnableCallBacks(sockRef, 1uLL);
    }
  }
}

- (id)_dequeueWriteBuffer
{
  if ([(NSMutableArray *)self->_writeBufferArray count])
  {
    uint64_t v3 = [(NSMutableArray *)self->_writeBufferArray objectAtIndex:0];
    [(NSMutableArray *)self->_writeBufferArray removeObjectAtIndex:0];
    [v3 reset];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (void)_enqueueReadBuffer:(id)a3
{
}

- (id)_dequeueReadBuffer
{
  if ([(NSMutableArray *)self->_readBufferArray count])
  {
    uint64_t v3 = [(NSMutableArray *)self->_readBufferArray objectAtIndex:0];
    [(NSMutableArray *)self->_readBufferArray removeObjectAtIndex:0];
    [v3 reset];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (void)_readSessionDataFromApp
{
  OUTLINED_FUNCTION_6(a1, a2);
  _os_log_debug_impl(&dword_222C74000, v2, OS_LOG_TYPE_DEBUG, "EA Native USB:  read 0 bytes from app", v3, 2u);
}

- (void)_writeUSBData:(id)a3
{
  id v6 = a3;
  if (![v6 writeAttempts] || !objc_msgSend(v6, "dataLength")) {
    goto LABEL_10;
  }
  do
  {
    [v6 attemptWrite];
    uint64_t v4 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, void, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(void *, uint64_t, uint64_t), id))(*self->_usbInterface)->WritePipeAsyncTO)(self->_usbInterface, self->_outPipe, [v6 readPtr], objc_msgSend(v6, "dataLength"), 5000, 15000, _StaticUSBWriteComplete, v6);
    if (!v4) {
      break;
    }
    int v5 = v4;
    [v6 setUsbError:v4];
    if (v5 != -536854449 || [(AccessoryEAInterface *)self _clearPipeStall:self->_outPipe]) {
      goto LABEL_10;
    }
  }
  while ([v6 writeAttempts] && objc_msgSend(v6, "dataLength"));
  if (![v6 writeAttempts] || !objc_msgSend(v6, "dataLength")) {
LABEL_10:
  }
    [(AccessoryEAInterface *)self _writeComplete:v6 writeLength:0];
}

- (int)_clearPipeStall:(unsigned __int8)a3
{
  int result = ((uint64_t (*)(IOUSBInterfaceStruct942 **, void))(*self->_usbInterface)->GetPipeStatus)(self->_usbInterface, a3);
  if (result != -536870208 && result != -536870195 && result != 0)
  {
    ClearPipeStallBothEnds = (uint64_t (*)(void))(*self->_usbInterface)->ClearPipeStallBothEnds;
    return ClearPipeStallBothEnds();
  }
  return result;
}

- (void)_writeComplete:(id)a3 writeLength:(unint64_t)a4
{
  id v6 = a3;
  [v6 moveReadPtr:a4];
  if ([v6 usbError])
  {
    if ([v6 writeAttempts])
    {
      [(AccessoryEAInterface *)self _writeUSBData:v6];
      goto LABEL_6;
    }
    NSLog(&cfstr_WriteTimedout.isa);
  }
  [(AccessoryEAInterface *)self _enqueueWriteBuffer:v6];
LABEL_6:
}

- (void)_readSessionDataFromUSB
{
  uint64_t v3 = [(AccessoryEAInterface *)self _dequeueReadBuffer];
  if (v3)
  {
    while (1)
    {
      id v7 = v3;
      uint64_t v4 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, void, uint64_t, uint64_t, void (*)(void *, uint64_t, uint64_t), id))(*self->_usbInterface)->ReadPipeAsync)(self->_usbInterface, self->_inPipe, [v3 writePtr], objc_msgSend(v7, "writeSpaceRemaining"), _StaticUSBReadComplete, v7);
      if (v4)
      {
        int v5 = v4;
        NSLog(&cfstr_SUX.isa, "-[AccessoryEAInterface _readSessionDataFromUSB]", 1119, v4);
        if (v5 == -536854449)
        {
          if ([(AccessoryEAInterface *)self _clearPipeStall:self->_inPipe]) {
            break;
          }
        }
        if (((unsigned int (*)(IOUSBInterfaceStruct942 **, void, uint64_t, uint64_t, void (*)(void *, uint64_t, uint64_t), id))(*self->_usbInterface)->ReadPipeAsync)(self->_usbInterface, self->_inPipe, [v7 writePtr], objc_msgSend(v7, "writeSpaceRemaining"), _StaticUSBReadComplete, v7))
        {
          break;
        }
      }
      uint64_t v6 = [(AccessoryEAInterface *)self _dequeueReadBuffer];

      uint64_t v3 = (void *)v6;
      if (!v6) {
        return;
      }
    }
    [(AccessoryEAInterface *)self _enqueueReadBuffer:v7];
  }
}

- (void)_readComplete:(id)a3 readLength:(unint64_t)a4
{
  id v7 = a3;
  if ([v7 usbError])
  {
    [(AccessoryEAInterface *)self _enqueueReadBuffer:v7];
    [(AccessoryEAInterface *)self _readSessionDataFromUSB];
    sockRef = self->_sockRef;
    if (sockRef) {
      CFSocketEnableCallBacks(sockRef, 8uLL);
    }
  }
  else
  {
    [v7 moveWritePtr:a4];
    [(NSMutableArray *)self->_dataForAppArray insertObject:v7 atIndex:[(NSMutableArray *)self->_dataForAppArray count]];
    [(AccessoryEAInterface *)self _writeSessionDataToApp];
  }
}

- (void)_writeSessionDataToApp
{
  uint64_t v7 = [a2 dataLength];
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_debug_impl(&dword_222C74000, a4, OS_LOG_TYPE_DEBUG, "EA Native USB: send %lu bytes to dataInHandler", a1, 0xCu);
}

- (IOUSBInterfaceStruct942)_createInterfaceFromUSBID:(unint64_t)a3
{
  kern_return_t v10;
  IOUSBInterfaceStruct942 **v11;
  IOCFPlugInInterface **v12;
  BOOL v13;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  CFAllocatorRef v15;
  CFUUIDRef v16;
  CFUUIDBytes v17;
  int v18;
  NSObject *v19;
  id v20;
  io_object_t v21;
  io_service_t v22;
  NSObject *v23;
  CFUUIDRef v24;
  CFUUIDRef v25;
  void *InterfaceAndNameString;
  void *v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  int v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  id v39;
  NSObject *v40;
  id v41;
  char v43;
  unsigned char v44[15];
  char v45;
  unsigned char v46[3];
  io_iterator_t iterator;
  uint64_t v48;
  uint64_t v49;
  SInt32 theScore;
  IOCFPlugInInterface **theInterface;
  IOUSBInterfaceStruct942 **v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  int v56;
  uint64_t v57;

  v57 = *MEMORY[0x263EF8340];
  v52 = 0;
  mach_port_t v4 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v5 = IORegistryEntryIDMatching(a3);
  io_service_t MatchingService = IOServiceGetMatchingService(v4, v5);
  if (!MatchingService) {
    return 0;
  }
  io_service_t v7 = MatchingService;
  theInterface = 0;
  theScore = 0;
  CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Du, 0xC7u, 0xB7u, 0x80u, 0x9Eu, 0xC0u, 0x11u, 0xD4u, 0xA5u, 0x4Fu, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
  CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  uint64_t v10 = IOCreatePlugInInterfaceForService(v7, v8, v9, &theInterface, &theScore);
  BOOL v11 = 0;
  id v12 = theInterface;
  if (v10) {
    int v13 = 1;
  }
  else {
    int v13 = theInterface == 0;
  }
  if (!v13)
  {
    v49 = 0;
    QueryInterface = (*theInterface)->QueryInterface;
    int v15 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
    int v16 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 1u, 0xA2u, 0xD0u, 0xE9u, 0x42u, 0xF6u, 0x4Au, 0x87u, 0x8Bu, 0x8Bu, 0x77u, 5u, 0x7Cu, 0x8Cu, 0xE0u, 0xCEu);
    uint64_t v17 = CFUUIDGetUUIDBytes(v16);
    uint64_t v18 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t *))QueryInterface)(v12, *(void *)&v17.byte0, *(void *)&v17.byte8, &v49);
    if (((unsigned int (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v19 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
        }
        uint64_t v19 = MEMORY[0x263EF8438];
        uint64_t v20 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[AccessoryEAInterface _createInterfaceFromUSBID:].cold.9();
      }
    }
    BOOL v11 = 0;
    if (!v18)
    {
      if (v49)
      {
        v48 = 0x100F000FFLL;
        iterator = 0;
        if ((*(unsigned int (**)(uint64_t, uint64_t *, io_iterator_t *))(*(void *)v49 + 224))(v49, &v48, &iterator)|| !iterator)
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v36 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
            }
            v36 = MEMORY[0x263EF8438];
            v37 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            -[AccessoryEAInterface _createInterfaceFromUSBID:].cold.7();
          }
        }
        else
        {
          uint64_t v21 = IOIteratorNext(iterator);
          if (v21)
          {
            uint64_t v22 = v21;
            BOOL v11 = 0;
            v23 = MEMORY[0x263EF8438];
            do
            {
              v24 = CFUUIDGetConstantUUIDWithBytes(v15, 1u, 0xA2u, 0xD0u, 0xE9u, 0x42u, 0xF6u, 0x4Au, 0x87u, 0x8Bu, 0x8Bu, 0x77u, 5u, 0x7Cu, 0x8Cu, 0xE0u, 0xCEu);
              v25 = CFUUIDGetConstantUUIDWithBytes(0, 0xBCu, 0xEAu, 0xADu, 0xDCu, 0x88u, 0x4Du, 0x4Fu, 0x27u, 0x83u, 0x40u, 0x36u, 0xD6u, 0x9Fu, 0xABu, 0x90u, 0xF6u);
              InterfaceAndNameString = (void *)usbUtil_getInterfaceAndNameString(v7, v24, v22, v25, &v52);
              uint64_t v27 = InterfaceAndNameString;
              if (InterfaceAndNameString
                && [InterfaceAndNameString isEqualToString:self->_protocolName])
              {
                BOOL v11 = v52;
              }
              else if (((unsigned int (*)(IOUSBInterfaceStruct942 **))(*v52)->Release)(v52))
              {
                v28 = gLogObjects;
                int v29 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  uint64_t v30 = *(id *)gLogObjects;
                }
                else
                {
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    v54 = v28;
                    v55 = 1024;
                    v56 = v29;
                    _os_log_error_impl(&dword_222C74000, v23, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  int v31 = v23;
                  uint64_t v30 = v23;
                }
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                  -[AccessoryEAInterface _createInterfaceFromUSBID:].cold.6(&v45, v46);
                }
              }
              if (IOObjectRelease(v22))
              {
                v32 = gLogObjects;
                int v33 = gNumLogObjects;
                if (gLogObjects && gNumLogObjects >= 1)
                {
                  v34 = *(id *)gLogObjects;
                }
                else
                {
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 134218240;
                    v54 = v32;
                    v55 = 1024;
                    v56 = v33;
                    _os_log_error_impl(&dword_222C74000, v23, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                  }
                  uint64_t v35 = v23;
                  v34 = v23;
                }
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
                  -[AccessoryEAInterface _createInterfaceFromUSBID:].cold.5(&v43, v44);
                }
              }
              uint64_t v22 = IOIteratorNext(iterator);
            }
            while (v22);
            goto LABEL_58;
          }
        }
        BOOL v11 = 0;
LABEL_58:
        if ((*(unsigned int (**)(uint64_t))(*(void *)v49 + 24))(v49))
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            objc_super v38 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
            }
            objc_super v38 = MEMORY[0x263EF8438];
            v39 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            -[AccessoryEAInterface _createInterfaceFromUSBID:]();
          }
        }
      }
    }
  }
  if (IOObjectRelease(v7))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v40 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      v40 = MEMORY[0x263EF8438];
      v41 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      -[AccessoryEAInterface _createInterfaceFromUSBID:]();
    }
  }
  return v11;
}

+ (id)findNativeEAInterfacesForRegistryID:(unint64_t)a3
{
  kern_return_t v14;
  NSObject *v15;
  id v16;
  IOCFPlugInInterface **v17;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  CFAllocatorRef v19;
  CFUUIDRef v20;
  CFUUIDBytes v21;
  int v22;
  NSObject *v23;
  id v24;
  io_object_t v25;
  io_service_t v26;
  NSObject *v27;
  CFUUIDRef v28;
  CFUUIDRef v29;
  void *InterfaceAndNameString;
  uint64_t v31;
  int v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  id v40;
  io_iterator_t iterator;
  uint64_t v43;
  uint64_t v44;
  SInt32 theScore;
  IOCFPlugInInterface **theInterface;
  uint8_t buf[4];
  unint64_t v48;
  __int16 v49;
  int v50;
  uint64_t v51;
  uint64_t vars8;

  v51 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    io_service_t v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    io_service_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v48 = a3;
    _os_log_impl(&dword_222C74000, v7, OS_LOG_TYPE_DEFAULT, "Looking for Native USB EA interfaces with parent registry ID 0x%llX", buf, 0xCu);
  }

  mach_port_t v8 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v9 = IORegistryEntryIDMatching(a3);
  io_service_t MatchingService = IOServiceGetMatchingService(v8, v9);
  if (MatchingService)
  {
    io_service_t v11 = MatchingService;
    theInterface = 0;
    theScore = 0;
    CFUUIDRef v12 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Du, 0xC7u, 0xB7u, 0x80u, 0x9Eu, 0xC0u, 0x11u, 0xD4u, 0xA5u, 0x4Fu, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
    CFUUIDRef v13 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    id v14 = IOCreatePlugInInterfaceForService(v11, v12, v13, &theInterface, &theScore);
    if (IOObjectRelease(v11))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        int v15 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
        }
        int v15 = MEMORY[0x263EF8438];
        int v16 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[AccessoryEAInterface _createInterfaceFromUSBID:]();
      }
    }
    if (!v14)
    {
      uint64_t v17 = theInterface;
      if (theInterface)
      {
        v44 = 0;
        QueryInterface = (*theInterface)->QueryInterface;
        uint64_t v19 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
        uint64_t v20 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 1u, 0xA2u, 0xD0u, 0xE9u, 0x42u, 0xF6u, 0x4Au, 0x87u, 0x8Bu, 0x8Bu, 0x77u, 5u, 0x7Cu, 0x8Cu, 0xE0u, 0xCEu);
        uint64_t v21 = CFUUIDGetUUIDBytes(v20);
        uint64_t v22 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t *))QueryInterface)(v17, *(void *)&v21.byte0, *(void *)&v21.byte8, &v44);
        if (((unsigned int (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface))
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v23 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
            }
            v23 = MEMORY[0x263EF8438];
            v24 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            -[AccessoryEAInterface _createInterfaceFromUSBID:].cold.9();
          }
        }
        if (!v22 && v44)
        {
          v43 = 0x100F000FFLL;
          iterator = 0;
          if ((*(unsigned int (**)(uint64_t, uint64_t *, io_iterator_t *))(*(void *)v44 + 224))(v44, &v43, &iterator)|| !iterator)
          {
            if (gLogObjects && gNumLogObjects >= 1)
            {
              uint64_t v35 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
              }
              uint64_t v35 = MEMORY[0x263EF8438];
              v36 = MEMORY[0x263EF8438];
            }
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
              -[AccessoryEAInterface _createInterfaceFromUSBID:].cold.7();
            }
          }
          else
          {
            v25 = IOIteratorNext(iterator);
            if (v25)
            {
              v26 = v25;
              uint64_t v27 = MEMORY[0x263EF8438];
              do
              {
                v28 = CFUUIDGetConstantUUIDWithBytes(v19, 1u, 0xA2u, 0xD0u, 0xE9u, 0x42u, 0xF6u, 0x4Au, 0x87u, 0x8Bu, 0x8Bu, 0x77u, 5u, 0x7Cu, 0x8Cu, 0xE0u, 0xCEu);
                int v29 = CFUUIDGetConstantUUIDWithBytes(0, 0xBCu, 0xEAu, 0xADu, 0xDCu, 0x88u, 0x4Du, 0x4Fu, 0x27u, 0x83u, 0x40u, 0x36u, 0xD6u, 0x9Fu, 0xABu, 0x90u, 0xF6u);
                InterfaceAndNameString = (void *)usbUtil_getInterfaceAndNameString(v11, v28, v26, v29, 0);
                if (InterfaceAndNameString)
                {
                  int v31 = gLogObjects;
                  v32 = gNumLogObjects;
                  if (gLogObjects && gNumLogObjects >= 1)
                  {
                    int v33 = *(id *)gLogObjects;
                  }
                  else
                  {
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 134218240;
                      v48 = v31;
                      v49 = 1024;
                      v50 = v32;
                      _os_log_error_impl(&dword_222C74000, v27, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
                    }
                    v34 = v27;
                    int v33 = v27;
                  }
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v48 = (unint64_t)InterfaceAndNameString;
                    _os_log_impl(&dword_222C74000, v33, OS_LOG_TYPE_DEFAULT, "Found interfaceNameString %@", buf, 0xCu);
                  }

                  [v4 addObject:InterfaceAndNameString];
                }

                v26 = IOIteratorNext(iterator);
              }
              while (v26);
            }
          }
          if ((*(unsigned int (**)(uint64_t))(*(void *)v44 + 24))(v44))
          {
            if (gLogObjects && gNumLogObjects >= 1)
            {
              v37 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
              }
              v37 = MEMORY[0x263EF8438];
              objc_super v38 = MEMORY[0x263EF8438];
            }
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              -[AccessoryEAInterface _createInterfaceFromUSBID:]();
            }
          }
        }
      }
    }
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v39 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    v39 = MEMORY[0x263EF8438];
    v40 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48 = (unint64_t)v4;
    _os_log_impl(&dword_222C74000, v39, OS_LOG_TYPE_DEFAULT, "Native EA endpoint protocols found: %@", buf, 0xCu);
  }

  if (![v4 count])
  {

    id v4 = 0;
  }
  return v4;
}

- (void)_sendSessionOpenNotification
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!_totalNumberOpenNativeSessions++)
  {
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects < 1;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      BOOL v5 = MEMORY[0x263EF8438];
      id v4 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_222C74000, v5, OS_LOG_TYPE_DEFAULT, "Created first EA Native Session, post notification", (uint8_t *)&v10, 2u);
    }

    EANativeSessionStatus = -1;
    if (notify_register_check("com.apple.accessories.ea.native.sessionStatusChanged", &EANativeSessionStatus))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v6 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
        }
        id v6 = MEMORY[0x263EF8438];
        id v8 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315138;
        io_service_t v11 = "com.apple.accessories.ea.native.sessionStatusChanged";
        _os_log_impl(&dword_222C74000, v6, OS_LOG_TYPE_DEFAULT, "Failed to register for %s notification!", (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      notify_set_state(EANativeSessionStatus, 1uLL);
      if (gLogObjects && gNumLogObjects >= 1)
      {
        io_service_t v7 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
        }
        io_service_t v7 = MEMORY[0x263EF8438];
        id v9 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v10 = 136315138;
        io_service_t v11 = "com.apple.accessories.ea.native.sessionStatusChanged";
        _os_log_impl(&dword_222C74000, v7, OS_LOG_TYPE_INFO, "Post notification %s with state 1!", (uint8_t *)&v10, 0xCu);
      }

      notify_post("com.apple.accessories.ea.native.sessionStatusChanged");
    }
  }
}

- (void)_sendSessionCloseNotification
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (!--_totalNumberOpenNativeSessions)
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
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      id v4 = MEMORY[0x263EF8438];
      id v3 = MEMORY[0x263EF8438];
    }
    else
    {
      id v4 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_222C74000, v4, OS_LOG_TYPE_DEFAULT, "No more EA Native Sessions, post notification", (uint8_t *)&v9, 2u);
    }

    EANativeSessionStatus = -1;
    if (notify_register_check("com.apple.accessories.ea.native.sessionStatusChanged", &EANativeSessionStatus))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        BOOL v5 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
        }
        BOOL v5 = MEMORY[0x263EF8438];
        id v7 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315138;
        int v10 = "com.apple.accessories.ea.native.sessionStatusChanged";
        _os_log_impl(&dword_222C74000, v5, OS_LOG_TYPE_DEFAULT, "Failed to register for %s notification!", (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      notify_set_state(EANativeSessionStatus, 0);
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v6 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
        }
        id v6 = MEMORY[0x263EF8438];
        id v8 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v9 = 136315138;
        int v10 = "com.apple.accessories.ea.native.sessionStatusChanged";
        _os_log_impl(&dword_222C74000, v6, OS_LOG_TYPE_INFO, "Post notification %s with state 0!", (uint8_t *)&v9, 0xCu);
      }

      notify_post("com.apple.accessories.ea.native.sessionStatusChanged");
    }
  }
}

+ (void)initializeSessionClose
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (initializeSessionClose_onceToken != -1) {
    dispatch_once(&initializeSessionClose_onceToken, &__block_literal_global_128);
  }
  EANativeSessionStatus = -1;
  if (notify_register_check("com.apple.accessories.ea.native.sessionStatusChanged", &EANativeSessionStatus))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      BOOL v2 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      BOOL v2 = MEMORY[0x263EF8438];
      id v4 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "com.apple.accessories.ea.native.sessionStatusChanged";
      _os_log_impl(&dword_222C74000, v2, OS_LOG_TYPE_DEFAULT, "Failed to register for %s notification!", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    notify_set_state(EANativeSessionStatus, 0);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v3 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      id v3 = MEMORY[0x263EF8438];
      id v5 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      id v7 = "com.apple.accessories.ea.native.sessionStatusChanged";
      _os_log_impl(&dword_222C74000, v3, OS_LOG_TYPE_INFO, "Post initial notification %s with state 0!", (uint8_t *)&v6, 0xCu);
    }

    notify_post("com.apple.accessories.ea.native.sessionStatusChanged");
  }
}

void __46__AccessoryEAInterface_initializeSessionClose__block_invoke()
{
  _totalNumberOpenNativeSessions = 0;
}

- (unint64_t)registryEntryID
{
  return self->_registryEntryID;
}

- (id)dataInHandler
{
  return self->_dataInHandler;
}

- (unsigned)vid
{
  return self->_vid;
}

- (unsigned)pid
{
  return self->_pid;
}

- (unsigned)vidpid
{
  return self->_vidpid;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataInHandler, 0);
  objc_storeStrong((id *)&self->_runLoop, 0);
  objc_storeStrong((id *)&self->_runLoopThread, 0);
  objc_storeStrong((id *)&self->_protocolName, 0);
  objc_storeStrong((id *)&self->_allWriteBuffers, 0);
  objc_storeStrong((id *)&self->_allReadBuffers, 0);
  objc_storeStrong((id *)&self->_dataForAppArray, 0);
  objc_storeStrong((id *)&self->_readBufferArray, 0);
  objc_storeStrong((id *)&self->_writeBufferArray, 0);
}

- (void)_writeData:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_222C74000, v0, v1, "EA Native USB: read bytes from app, No Write Buffer available!!!", v2, v3, v4, v5, v6);
}

- (void)_writeData:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  uint64_t v7 = [a1 writeSpaceRemaining];
  _os_log_error_impl(&dword_222C74000, a3, OS_LOG_TYPE_ERROR, "EA Native USB: read bytes from app, TOO Many Bytes!!! numberOfBytesRead %zd vs %lu", (uint8_t *)&v4, 0x16u);
}

- (void)_writeData:(uint64_t)a3 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_acceptSocketCB:acceptedSock:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_222C74000, v0, v1, "EA Native USB: Couldn't set socket to non-blocking mode", v2, v3, v4, v5, v6);
}

- (void)_acceptSocketCB:acceptedSock:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_222C74000, v0, v1, "EA Native USB: Couldn't set socket recv buffer size", v2, v3, v4, v5, v6);
}

- (void)_acceptSocketCB:acceptedSock:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_222C74000, v0, v1, "EA Native USB: Couldn't set socket send buffer size", v2, v3, v4, v5, v6);
}

- (void)_createInterfaceFromUSBID:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_222C74000, v0, v1, "EA Native USB: error releasing USB Device", v2, v3, v4, v5, v6);
}

- (void)_createInterfaceFromUSBID:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_222C74000, v0, v1, "EA Native USB: error releasing device interface", v2, v3, v4, v5, v6);
}

- (void)_createInterfaceFromUSBID:(unsigned char *)a1 .cold.5(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  _os_log_error_impl(&dword_222C74000, v2, OS_LOG_TYPE_ERROR, "EA Native USB: error releasing USB Interface", v3, 2u);
}

- (void)_createInterfaceFromUSBID:(unsigned char *)a1 .cold.6(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  _os_log_error_impl(&dword_222C74000, v2, OS_LOG_TYPE_ERROR, "EA Native USB: error releasing plugin interface", v3, 2u);
}

- (void)_createInterfaceFromUSBID:.cold.7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_222C74000, v0, v1, "EA Native USB: error creating interface iterator", v2, v3, v4, v5, v6);
}

- (void)_createInterfaceFromUSBID:.cold.9()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_222C74000, v0, v1, "EA Native USB: error releasing plugin interface", v2, v3, v4, v5, v6);
}

@end