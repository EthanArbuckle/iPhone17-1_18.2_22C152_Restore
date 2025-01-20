@interface EAOutputStream
- (BOOL)hasSpaceAvailable;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (EAOutputStream)initWithAccessory:(id)a3 forSession:(id)a4 socket:(int)a5;
- (EAOutputStream)initWithAccessoryWithoutSocket:(id)a3 forSession:(id)a4;
- (id)delegate;
- (id)propertyForKey:(id)a3;
- (id)streamError;
- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)streamStatus;
- (void)_performAtEndOfStreamValidation;
- (void)_scheduleCallback;
- (void)_streamEventTrigger;
- (void)_streamWriteable;
- (void)close;
- (void)dealloc;
- (void)endStream;
- (void)open;
- (void)openCompleted;
- (void)removeFromRunLoop:(id)a3 forMode:(id)a4;
- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation EAOutputStream

- (EAOutputStream)initWithAccessory:(id)a3 forSession:(id)a4 socket:(int)a5
{
  v14.receiver = self;
  v14.super_class = (Class)EAOutputStream;
  v8 = [(EAOutputStream *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_streamStatus = 0;
    v8->_delegate = v8;
    v8->_accessory = (EAAccessory *)a3;
    v9->_session = (EASession *)a4;
    v9->_sock = a5;
    v9->_useSocket = 1;
    v13.version = 0;
    memset(&v13.retain, 0, 24);
    v13.info = v9;
    v10 = CFSocketCreateWithNative(0, a5, 8uLL, (CFSocketCallBack)__outputSocketCallback, &v13);
    v9->_cfSocket = v10;
    CFOptionFlags SocketFlags = CFSocketGetSocketFlags(v10);
    CFSocketSetSocketFlags(v9->_cfSocket, SocketFlags & 0xFFFFFFFFFFFFFF7FLL);
    v9->_statusLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    v9->_runloopLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v9, sel__accessoryDidDisconnect_, @"EAAccessoryDidDisconnectNotification", 0);
  }
  return v9;
}

- (EAOutputStream)initWithAccessoryWithoutSocket:(id)a3 forSession:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)EAOutputStream;
  v6 = [(EAOutputStream *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_streamStatus = 0;
    v6->_delegate = v6;
    v6->_accessory = (EAAccessory *)a3;
    v7->_session = (EASession *)a4;
    v7->_sock = -1;
    v7->_useSocket = 0;
    v7->_cfSocket = 0;
    v7->_socketRunLoopSource = 0;
    v7->_statusLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    v7->_runloopLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v7, sel__accessoryDidDisconnect_, @"EAAccessoryDidDisconnectNotification", 0);
  }
  return v7;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"EAAccessoryDidDisconnectNotification", 0);
  [(EAOutputStream *)self close];

  cfSocket = self->_cfSocket;
  if (cfSocket)
  {
    CFSocketInvalidate(cfSocket);
    CFRelease(self->_cfSocket);
    self->_cfSocket = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)EAOutputStream;
  [(EAOutputStream *)&v4 dealloc];
}

- (void)open
{
  [(NSRecursiveLock *)self->_statusLock lock];
  if (!self->_streamStatus)
  {
    id v3 = [(EAAccessory *)self->_accessory _protocolIDForProtocolString:[(EASession *)self->_session protocolString]];
    if (v3)
    {
      if (self->_useSocket)
      {
        objc_super v4 = v3;
        if ([(EAAccessory *)self->_accessory createdByCoreAccessories])
        {
          [+[EAAccessoryManager sharedAccessoryManager] openSessionFromAppToAccessory:[(EASession *)self->_session EASessionUUID]];
        }
        else
        {
          [(EAAccessory *)self->_accessory _internalConnectionID];
          [v4 unsignedIntValue];
          [(EASession *)self->_session _sessionID];
          IAPAppOpenSessionFromAppToAccessory();
        }
      }
      else
      {
        self->_hasSpaceAvailable = 1;
      }
      self->_streamStatus = 1;
      [(EAOutputStream *)self openCompleted];
    }
  }
  statusLock = self->_statusLock;

  [(NSRecursiveLock *)statusLock unlock];
}

- (void)close
{
  unint64_t streamStatus = self->_streamStatus;
  BOOL v4 = streamStatus > 5;
  uint64_t v5 = (1 << streamStatus) & 0x25;
  if (!v4 && v5 != 0) {
    self->_unint64_t streamStatus = 6;
  }
  self->_sock = -1;

  self->_accessory = 0;
  [(EASession *)self->_session _streamClosed];

  self->_session = 0;
  [(NSRecursiveLock *)self->_runloopLock lock];
  runLoopSource = self->_runLoopSource;
  if (runLoopSource)
  {
    CFRunLoopSourceInvalidate(runLoopSource);
    self->_runLoopSource = 0;
  }
  socketRunLoopSource = self->_socketRunLoopSource;
  if (socketRunLoopSource)
  {
    CFRunLoopSourceInvalidate(socketRunLoopSource);
    self->_socketRunLoopSource = 0;
  }
  runLoop = self->_runLoop;
  if (runLoop)
  {
    CFRelease(runLoop);
    self->_runLoop = 0;
  }
  cfSocket = self->_cfSocket;
  if (cfSocket)
  {
    CFSocketInvalidate(cfSocket);
    CFRelease(self->_cfSocket);
    self->_cfSocket = 0;
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
    id v3 = a3;
  }
  else {
    id v3 = self;
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
  if (!self->_runLoop)
  {
    v8 = (__CFRunLoop *)[a3 getCFRunLoop];
    self->_runLoop = v8;
    CFRetain(v8);
  }
  if (!self->_runLoopSource)
  {
    v11.version = 0;
    v11.info = self;
    v11.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E4F1C280];
    v11.release = (void (__cdecl *)(const void *))MEMORY[0x1E4F1C278];
    memset(&v11.copyDescription, 0, 40);
    v11.perform = (void (__cdecl *)(void *))__streamEventTrigger;
    runLoopSource = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &v11);
    self->_runLoopSource = runLoopSource;
    if (!runLoopSource)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EAOutputStream.m", 238, @"should be able to make run loop source");
      runLoopSource = self->_runLoopSource;
    }
    CFRunLoopAddSource(self->_runLoop, runLoopSource, (CFRunLoopMode)a4);
    CFRelease(self->_runLoopSource);
  }
  if (self->_useSocket && !self->_socketRunLoopSource)
  {
    v10 = CFSocketCreateRunLoopSource(0, self->_cfSocket, 0);
    self->_socketRunLoopSource = v10;
    CFRunLoopAddSource(self->_runLoop, v10, (CFRunLoopMode)a4);
    CFRelease(self->_socketRunLoopSource);
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
  socketRunLoopSource = self->_socketRunLoopSource;
  if (socketRunLoopSource)
  {
    CFRunLoopSourceInvalidate(socketRunLoopSource);
    self->_socketRunLoopSource = 0;
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
  [(EAOutputStream *)self _performAtEndOfStreamValidation];
  [(NSRecursiveLock *)self->_statusLock lock];
  unint64_t streamStatus = self->_streamStatus;
  [(NSRecursiveLock *)self->_statusLock unlock];
  return streamStatus;
}

- (id)streamError
{
  return 0;
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  [(NSRecursiveLock *)self->_statusLock lock];
  if ([(EAOutputStream *)self hasSpaceAvailable])
  {
    self->_hasSpaceAvailable = 0;
    self->_hasSpaceAvailableEventSent = 0;
    if (self->_useSocket)
    {
      int v7 = send(self->_sock, a3, a4, 0);
      if (v7 == -1)
      {
        v8 = __error();
        NSLog(&cfstr_Externalaccess_83.isa, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAOutputStream.m", "-[EAOutputStream write:maxLength:]", 306, a4, 0xFFFFFFFFLL, *v8);
        if (*__error() == 32)
        {
          if (+[EAAccessoryManager isLoggingEnabled]) {
            NSLog(&cfstr_Externalaccess_84.isa);
          }
          int v7 = a4;
        }
        else
        {
          int v7 = -1;
        }
      }
      CFSocketEnableCallBacks(self->_cfSocket, 8uLL);
    }
    else
    {
      self->_hasSpaceAvailable = 0;
      objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3 length:a4];
      [+[EAAccessoryManager sharedAccessoryManager] sendOutgoingEAData:v9 forSessionUUID:[(EASession *)self->_session EASessionUUID]];
      int v7 = [v9 length];

      self->_hasSpaceAvailable = 1;
      [(EAOutputStream *)self _scheduleCallback];
    }
    +[EAAccessoryManager isLoggingEnabled];
  }
  else
  {
    NSLog(&cfstr_Externalaccess_85.isa, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAOutputStream.m", "-[EAOutputStream write:maxLength:]", 332);
    int v7 = 0;
  }
  [(NSRecursiveLock *)self->_statusLock unlock];
  return v7;
}

- (BOOL)hasSpaceAvailable
{
  [(NSRecursiveLock *)self->_statusLock lock];
  BOOL v3 = self->_streamStatus == 2 && self->_hasSpaceAvailable;
  [(NSRecursiveLock *)self->_statusLock unlock];
  return v3;
}

- (void)openCompleted
{
  [(NSRecursiveLock *)self->_statusLock lock];
  if (self->_streamStatus == 1)
  {
    self->_unint64_t streamStatus = 2;
    [(EAOutputStream *)self _scheduleCallback];
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
    [(EAOutputStream *)self _scheduleCallback];
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
    [(EAOutputStream *)self _scheduleCallback];
  }
  statusLock = self->_statusLock;

  [(NSRecursiveLock *)statusLock unlock];
}

- (void)_streamWriteable
{
  self->_hasSpaceAvailable = 1;
  [(EAOutputStream *)self _streamEventTrigger];
}

- (void)_streamEventTrigger
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28B28]);
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
  if (!self->_hasSpaceAvailableEventSent && self->_hasSpaceAvailable)
  {
    self->_hasSpaceAvailableEventSent = 1;
    if (objc_opt_respondsToSelector()) {
      [self->_delegate stream:self handleEvent:4];
    }
  }
  [(NSRecursiveLock *)self->_statusLock unlock];
}

- (void)_scheduleCallback
{
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
      NSLog(&cfstr_Externalaccess_86.isa, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAOutputStream.m", "-[EAOutputStream _scheduleCallback]", 438);
    }
  }
  runloopLock = self->_runloopLock;

  [(NSRecursiveLock *)runloopLock unlock];
}

@end