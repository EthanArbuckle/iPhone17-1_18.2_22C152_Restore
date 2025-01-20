@interface EAInputStream
- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4;
- (BOOL)hasBytesAvailable;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (EAInputStream)initWithAccessory:(id)a3 forSession:(id)a4 socket:(int)a5;
- (EAInputStream)initWithAccessoryWithoutSocket:(id)a3 forSession:(id)a4;
- (id)delegate;
- (id)propertyForKey:(id)a3;
- (id)streamError;
- (int)zeroBytesReadCount;
- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)streamStatus;
- (void)_performAtEndOfStreamValidation;
- (void)_scheduleCallback;
- (void)_streamEventTrigger;
- (void)close;
- (void)dealloc;
- (void)endStream;
- (void)open;
- (void)openCompleted;
- (void)processIncomingAccessoryData:(id)a3;
- (void)removeFromRunLoop:(id)a3 forMode:(id)a4;
- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setZeroBytesReadCount:(int)a3;
@end

@implementation EAInputStream

- (EAInputStream)initWithAccessory:(id)a3 forSession:(id)a4 socket:(int)a5
{
  v11.receiver = self;
  v11.super_class = (Class)EAInputStream;
  v8 = [(EAInputStream *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_streamStatus = 0;
    v8->_delegate = v8;
    v8->_accessory = (EAAccessory *)a3;
    v9->_session = (EASession *)a4;
    v9->_statusLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    v9->_runloopLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    v9->_inputFromAccBuffer = 0;
    v9->_useSocket = 1;
    v9->_sockListenSource = 0;
    v9->_sock = a5;
    v9->_zeroBytesReadCount = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v9, sel__accessoryDidDisconnect_, @"EAAccessoryDidDisconnectNotification", 0);
  }
  return v9;
}

- (EAInputStream)initWithAccessoryWithoutSocket:(id)a3 forSession:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)EAInputStream;
  v6 = [(EAInputStream *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_streamStatus = 0;
    v6->_delegate = v6;
    v6->_accessory = (EAAccessory *)a3;
    v7->_session = (EASession *)a4;
    v7->_statusLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    v7->_runloopLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    v7->_inputFromAccBuffer = 0;
    v7->_useSocket = 0;
    v7->_sockListenSource = 0;
    v7->_sock = -1;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v7, sel__accessoryDidDisconnect_, @"EAAccessoryDidDisconnectNotification", 0);
  }
  return v7;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"EAAccessoryDidDisconnectNotification", 0);
  [(EAInputStream *)self close];

  inputFromAccBuffer = self->_inputFromAccBuffer;
  if (inputFromAccBuffer) {
    free(inputFromAccBuffer);
  }
  self->_inputFromAccBuffer = 0;
  if (+[EAAccessoryManager isLoggingEnabled]) {
    NSLog(&cfstr_Externalaccess_87.isa, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAInputStream.m", "-[EAInputStream dealloc]", 113);
  }
  inputFromAccQueue = self->_inputFromAccQueue;
  if (inputFromAccQueue) {
    dispatch_release(inputFromAccQueue);
  }
  v5.receiver = self;
  v5.super_class = (Class)EAInputStream;
  [(EAInputStream *)&v5 dealloc];
}

- (void)open
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->_statusLock lock];
  if (!self->_streamStatus)
  {
    self->_inputFromAccData = (NSMutableData *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:0x20000];
    self->_inputFromAccCondition = (NSCondition *)objc_alloc_init(MEMORY[0x1E4F28BB0]);
    id v3 = [(EAAccessory *)self->_accessory _protocolIDForProtocolString:[(EASession *)self->_session protocolString]];
    if (v3)
    {
      v4 = v3;
      if (+[EAAccessoryManager isLoggingEnabled]) {
        NSLog(&cfstr_Externalaccess_88.isa, [(EAAccessory *)self->_accessory _internalConnectionID], [(EASession *)self->_session _sessionID]);
      }
      snprintf(__str, 0x100uLL, "com.apple.%d.%d.%d.listenQueue", -[EAAccessory connectionID](self->_accessory, "connectionID"), [v4 unsignedIntValue], -[EASession _sessionID](self->_session, "_sessionID"));
      objc_super v5 = (OS_dispatch_queue *)dispatch_queue_create(__str, 0);
      self->_inputFromAccQueue = v5;
      if (self->_useSocket)
      {
        self->_sockListenSource = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14478], self->_sock, 0, (dispatch_queue_t)v5);
        self->_inputFromAccBuffer = (char *)malloc_type_malloc(0x2000uLL, 0x8185FFF3uLL);
        sockListenSource = self->_sockListenSource;
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __21__EAInputStream_open__block_invoke;
        handler[3] = &unk_1E6293EF8;
        handler[4] = self;
        dispatch_source_set_event_handler(sockListenSource, handler);
        dispatch_resume((dispatch_object_t)self->_sockListenSource);
        if ([(EAAccessory *)self->_accessory createdByCoreAccessories])
        {
          [+[EAAccessoryManager sharedAccessoryManager] openSessionFromAccessoryToApp:[(EASession *)self->_session EASessionUUID]];
        }
        else
        {
          [(EAAccessory *)self->_accessory _internalConnectionID];
          [v4 unsignedIntValue];
          [(EASession *)self->_session _sessionID];
          IAPAppOpenSessionFromAccessoryToApp();
        }
      }
      self->_streamStatus = 1;
      [(EAInputStream *)self openCompleted];
    }
  }
  [(NSRecursiveLock *)self->_statusLock unlock];
}

uint64_t __21__EAInputStream_open__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 176) lock];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 160) == -1) {
    goto LABEL_15;
  }
  while (1)
  {
    if ((unint64_t)([*(id *)(*(void *)(a1 + 32) + 168) length] - 122881) > 0xFFFFFFFFFFFDFFFELL)
    {
      int v3 = 0x2000;
    }
    else
    {
      int v3 = 0x20000 - [*(id *)(*(void *)(a1 + 32) + 168) length];
      if (v3 < 1) {
        goto LABEL_13;
      }
    }
    int v4 = recv(*(_DWORD *)(*(void *)(a1 + 32) + 160), *(void **)(*(void *)(a1 + 32) + 216), v3, 0);
    int v5 = v4;
    uint64_t v6 = *(void *)(a1 + 32);
    if (v4)
    {
      *(_DWORD *)(v6 + 256) = 0;
      if (v4 == -1) {
        goto LABEL_13;
      }
      uint64_t v7 = *(void *)(a1 + 32);
      goto LABEL_10;
    }
    ++*(_DWORD *)(v6 + 256);
    uint64_t v7 = *(void *)(a1 + 32);
    if (*(int *)(v7 + 256) >= 16) {
      break;
    }
LABEL_10:
    [*(id *)(v7 + 168) appendBytes:*(void *)(v7 + 216) length:v4];
    if (v5 != 0x2000) {
      goto LABEL_13;
    }
  }
  NSLog(&cfstr_Externalaccess_89.isa, 0, [*(id *)(v7 + 152) _sessionID], objc_msgSend(*(id *)(*(void *)(a1 + 32) + 152), "_sessionID"), *(unsigned int *)(*(void *)(a1 + 32) + 256));
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 208));
LABEL_13:
  *(unsigned char *)(*(void *)(a1 + 32) + 225) = 1;
  [*(id *)(a1 + 32) _scheduleCallback];
  unint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 168) length];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v8 >= 0x20000)
  {
    [*(id *)(v2 + 176) wait];
    uint64_t v2 = *(void *)(a1 + 32);
  }
LABEL_15:
  uint64_t v9 = *(void **)(v2 + 176);

  return [v9 unlock];
}

- (void)close
{
  [(NSRecursiveLock *)self->_statusLock lock];
  unint64_t streamStatus = self->_streamStatus;
  BOOL v4 = streamStatus > 5;
  uint64_t v5 = (1 << streamStatus) & 0x25;
  if (!v4 && v5 != 0) {
    self->_unint64_t streamStatus = 6;
  }
  [(NSRecursiveLock *)self->_statusLock unlock];
  self->_sock = -1;
  [(NSCondition *)self->_inputFromAccCondition lock];
  if (self->_sockListenSource)
  {
    if (+[EAAccessoryManager isLoggingEnabled]) {
      NSLog(&cfstr_Externalaccess_90.isa);
    }
    dispatch_source_cancel((dispatch_source_t)self->_sockListenSource);
    dispatch_release((dispatch_object_t)self->_sockListenSource);
    self->_sockListenSource = 0;
    if (+[EAAccessoryManager isLoggingEnabled]) {
      NSLog(&cfstr_Externalaccess_91.isa);
    }
  }

  self->_inputFromAccData = 0;
  [(NSCondition *)self->_inputFromAccCondition signal];
  [(NSCondition *)self->_inputFromAccCondition unlock];

  self->_accessory = 0;
  [+[EAAccessoryManager sharedAccessoryManager] closeInputStreamForEASessionUUID:[(EASession *)self->_session EASessionUUID]];
  [(EASession *)self->_session _streamClosed];

  self->_session = 0;
  [(NSRecursiveLock *)self->_runloopLock lock];
  runLoopSource = self->_runLoopSource;
  if (runLoopSource)
  {
    CFRunLoopSourceInvalidate(runLoopSource);
    self->_runLoopSource = 0;
  }
  runLoop = self->_runLoop;
  if (runLoop)
  {
    CFRelease(runLoop);
    self->_runLoop = 0;
  }
  runloopLock = self->_runloopLock;

  [(NSRecursiveLock *)runloopLock unlock];
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  if (a3) {
    int v3 = a3;
  }
  else {
    int v3 = self;
  }
  self->_delegate = v3;
}

- (id)propertyForKey:(id)a3
{
  return 0;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return 0;
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  [(NSRecursiveLock *)self->_runloopLock lock];
  if (!self->_runLoopSource)
  {
    unint64_t v8 = (__CFRunLoop *)[a3 getCFRunLoop];
    self->_runLoop = v8;
    CFRetain(v8);
    v10.version = 0;
    memset(&v10.retain, 0, 56);
    v10.info = self;
    v10.perform = (void (__cdecl *)(void *))__streamEventTrigger_0;
    runLoopSource = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &v10);
    self->_runLoopSource = runLoopSource;
    if (!runLoopSource)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EAInputStream.m", 316, @"should be able to make run loop source");
      runLoopSource = self->_runLoopSource;
    }
    CFRunLoopAddSource(self->_runLoop, runLoopSource, (CFRunLoopMode)a4);
    CFRelease(self->_runLoopSource);
  }
  [(NSRecursiveLock *)self->_runloopLock unlock];
}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  [(NSRecursiveLock *)self->_runloopLock lock];
  if (self->_runLoopSource)
  {
    CFRunLoopRemoveSource((CFRunLoopRef)[a3 getCFRunLoop], self->_runLoopSource, (CFRunLoopMode)a4);
    self->_runLoopSource = 0;
  }
  runLoop = self->_runLoop;
  if (runLoop)
  {
    CFRelease(runLoop);
    self->_runLoop = 0;
  }
  runloopLock = self->_runloopLock;

  [(NSRecursiveLock *)runloopLock unlock];
}

- (unint64_t)streamStatus
{
  [(EAInputStream *)self _performAtEndOfStreamValidation];
  [(NSRecursiveLock *)self->_statusLock lock];
  unint64_t streamStatus = self->_streamStatus;
  [(NSRecursiveLock *)self->_statusLock unlock];
  return streamStatus;
}

- (id)streamError
{
  return 0;
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  [(NSRecursiveLock *)self->_statusLock lock];
  if (self->_streamStatus == 2)
  {
    [(NSCondition *)self->_inputFromAccCondition lock];
    NSUInteger v7 = [(NSMutableData *)self->_inputFromAccData length];
    if (v7)
    {
      unint64_t v8 = v7;
      if (v7 < a4) {
        a4 = v7;
      }
      [(NSMutableData *)self->_inputFromAccData getBytes:a3 length:a4];
      -[NSMutableData replaceBytesInRange:withBytes:length:](self->_inputFromAccData, "replaceBytesInRange:withBytes:length:", 0, a4, 0, 0);
      if (v8 >= 0x20000 && a4 != 0) {
        [(NSCondition *)self->_inputFromAccCondition signal];
      }
    }
    else
    {
      a4 = 0;
    }
    [(NSCondition *)self->_inputFromAccCondition unlock];
  }
  else
  {
    a4 = 0;
  }
  [(NSRecursiveLock *)self->_statusLock unlock];
  return a4;
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (BOOL)hasBytesAvailable
{
  [(NSRecursiveLock *)self->_statusLock lock];
  if (self->_streamStatus == 2)
  {
    [(NSCondition *)self->_inputFromAccCondition lock];
    BOOL v3 = [(NSMutableData *)self->_inputFromAccData length] != 0;
    [(NSCondition *)self->_inputFromAccCondition unlock];
  }
  else
  {
    BOOL v3 = 0;
  }
  [(NSRecursiveLock *)self->_statusLock unlock];
  return v3;
}

- (void)processIncomingAccessoryData:(id)a3
{
  if (self->_streamStatus - 2 > 2)
  {
    NSLog(&cfstr_Externalaccess_92.isa, a2, a3, self->_streamStatus);
  }
  else
  {
    inputFromAccQueue = self->_inputFromAccQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__EAInputStream_processIncomingAccessoryData___block_invoke;
    block[3] = &unk_1E6293F90;
    block[4] = self;
    block[5] = a3;
    dispatch_async(inputFromAccQueue, block);
  }
}

uint64_t __46__EAInputStream_processIncomingAccessoryData___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 176) lock];
  [*(id *)(*(void *)(a1 + 32) + 168) appendData:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 225) = 1;
  [*(id *)(a1 + 32) _scheduleCallback];
  if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 168) length] >= 0x20000) {
    [*(id *)(*(void *)(a1 + 32) + 176) wait];
  }
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 176);

  return [v2 unlock];
}

- (void)openCompleted
{
  [(NSRecursiveLock *)self->_statusLock lock];
  if (self->_streamStatus == 1)
  {
    self->_unint64_t streamStatus = 2;
    [(EAInputStream *)self _scheduleCallback];
  }
  statusLock = self->_statusLock;

  [(NSRecursiveLock *)statusLock unlock];
}

- (void)endStream
{
  [(NSRecursiveLock *)self->_statusLock lock];
  if (self->_streamStatus - 2 <= 2)
  {
    self->_unint64_t streamStatus = 5;
    [(EAInputStream *)self _scheduleCallback];
    [+[EAAccessoryManager sharedAccessoryManager] closeInputStreamForEASessionUUID:[(EASession *)self->_session EASessionUUID]];
  }
  statusLock = self->_statusLock;

  [(NSRecursiveLock *)statusLock unlock];
}

- (void)_performAtEndOfStreamValidation
{
  [(NSRecursiveLock *)self->_statusLock lock];
  if (self->_streamStatus == 2 && ![(EAAccessory *)self->_accessory isConnected])
  {
    self->_unint64_t streamStatus = 5;
    [(EAInputStream *)self _scheduleCallback];
  }
  statusLock = self->_statusLock;

  [(NSRecursiveLock *)statusLock unlock];
}

- (void)_streamEventTrigger
{
  BOOL v3 = self;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  BOOL v4 = self->_inputFromAccCondition;
  uint64_t v5 = self->_statusLock;
  [(NSRecursiveLock *)self->_statusLock lock];
  if (!self->_isOpenCompletedEventSent && self->_streamStatus == 2)
  {
    self->_isOpenCompletedEventSent = 1;
    if (objc_opt_respondsToSelector()) {
      [self->_delegate stream:self handleEvent:1];
    }
  }
  if (!self->_isAtEndEventSent && self->_streamStatus == 5)
  {
    self->_isAtEndEventSent = 1;
    if (objc_opt_respondsToSelector()) {
      [self->_delegate stream:self handleEvent:16];
    }
  }
  [(NSCondition *)self->_inputFromAccCondition lock];
  if ([(NSMutableData *)self->_inputFromAccData length])
  {
    BOOL hasNewBytesAvailable = self->_hasNewBytesAvailable;
    self->_BOOL hasNewBytesAvailable = 0;
    [(NSCondition *)self->_inputFromAccCondition unlock];
    if (hasNewBytesAvailable && (objc_opt_respondsToSelector() & 1) != 0) {
      [self->_delegate stream:self handleEvent:2];
    }
  }
  else
  {
    self->_BOOL hasNewBytesAvailable = 0;
    [(NSCondition *)self->_inputFromAccCondition unlock];
  }
  [(NSRecursiveLock *)self->_statusLock unlock];
}

- (void)_scheduleCallback
{
  BOOL v3 = self->_runloopLock;
  [(NSRecursiveLock *)self->_runloopLock lock];
  runLoopSource = self->_runLoopSource;
  if (runLoopSource)
  {
    CFRunLoopSourceSignal(runLoopSource);
    runLoop = self->_runLoop;
    if (runLoop) {
      CFRunLoopWakeUp(runLoop);
    }
    else {
      NSLog(&cfstr_Externalaccess_86.isa, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAInputStream.m", "-[EAInputStream _scheduleCallback]", 529);
    }
  }
  [(NSRecursiveLock *)self->_runloopLock unlock];
  runloopLock = self->_runloopLock;
}

- (int)zeroBytesReadCount
{
  return self->_zeroBytesReadCount;
}

- (void)setZeroBytesReadCount:(int)a3
{
  self->_zeroBytesReadCount = a3;
}

@end