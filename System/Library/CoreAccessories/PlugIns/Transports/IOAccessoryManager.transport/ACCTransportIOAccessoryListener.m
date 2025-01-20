@interface ACCTransportIOAccessoryListener
- (ACCTransportIOAccessoryListener)initWithDelegate:(id)a3;
- (ACCTransportIOAccessoryListenerProtocol)delegate;
- (void)_ioAccessoryAuthCPAttached:(unsigned int)a3;
- (void)_ioAccessoryAuthCPTerminated:(unsigned int)a3;
- (void)_ioAccessoryConfigStreamAttached:(unsigned int)a3;
- (void)_ioAccessoryConfigStreamTerminated:(unsigned int)a3;
- (void)_ioAccessoryEAAttached:(unsigned int)a3;
- (void)_ioAccessoryEATerminated:(unsigned int)a3;
- (void)_ioAccessoryManagerAttached:(unsigned int)a3;
- (void)_ioAccessoryManagerTerminated:(unsigned int)a3;
- (void)_ioAccessoryOOBPairingAttached:(unsigned int)a3;
- (void)_ioAccessoryOOBPairingTerminated:(unsigned int)a3;
- (void)_ioAccessoryPortAttached:(unsigned int)a3;
- (void)_ioAccessoryPortTerminated:(unsigned int)a3;
- (void)_startListeningForIOAccessoryAuthCPClass;
- (void)_startListeningForIOAccessoryConfigStreamClass;
- (void)_startListeningForIOAccessoryEAClass;
- (void)_startListeningForIOAccessoryManagerClass;
- (void)_startListeningForIOAccessoryOOBPairingClass;
- (void)_startListeningForIOAccessoryPortClass;
- (void)_stopListeningForIOAccessoryAuthCPClass;
- (void)_stopListeningForIOAccessoryConfigStreamClass;
- (void)_stopListeningForIOAccessoryEAClass;
- (void)_stopListeningForIOAccessoryManagerClass;
- (void)_stopListeningForIOAccessoryOOBPairingClass;
- (void)_stopListeningForIOAccessoryPortClass;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)startListening;
- (void)stopListening;
@end

@implementation ACCTransportIOAccessoryListener

- (ACCTransportIOAccessoryListener)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ACCTransportIOAccessoryListener;
  v5 = [(ACCTransportIOAccessoryListener *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.ACCTransport.IOAccessoryListener", 0);
    ioAccessoryListenerQueue = v6->_ioAccessoryListenerQueue;
    v6->_ioAccessoryListenerQueue = (OS_dispatch_queue *)v7;
  }
  return v6;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  [(ACCTransportIOAccessoryListener *)self stopListening];
  v3.receiver = self;
  v3.super_class = (Class)ACCTransportIOAccessoryListener;
  [(ACCTransportIOAccessoryListener *)&v3 dealloc];
}

- (void)startListening
{
  [(ACCTransportIOAccessoryListener *)self _startListeningForIOAccessoryManagerClass];
  [(ACCTransportIOAccessoryListener *)self _startListeningForIOAccessoryPortClass];
  [(ACCTransportIOAccessoryListener *)self _startListeningForIOAccessoryAuthCPClass];
  [(ACCTransportIOAccessoryListener *)self _startListeningForIOAccessoryEAClass];
  [(ACCTransportIOAccessoryListener *)self _startListeningForIOAccessoryOOBPairingClass];
  [(ACCTransportIOAccessoryListener *)self _startListeningForIOAccessoryConfigStreamClass];
}

- (void)stopListening
{
  [(ACCTransportIOAccessoryListener *)self _stopListeningForIOAccessoryOOBPairingClass];
  [(ACCTransportIOAccessoryListener *)self _stopListeningForIOAccessoryEAClass];
  [(ACCTransportIOAccessoryListener *)self _stopListeningForIOAccessoryAuthCPClass];
  [(ACCTransportIOAccessoryListener *)self _stopListeningForIOAccessoryPortClass];
  [(ACCTransportIOAccessoryListener *)self _stopListeningForIOAccessoryManagerClass];
  [(ACCTransportIOAccessoryListener *)self _stopListeningForIOAccessoryConfigStreamClass];
}

- (void)_startListeningForIOAccessoryManagerClass
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_222CE3000, v0, v1, "ret = 0x%X for kIOAccessoryManagerClass kIOTerminatedNotification", v2, v3, v4, v5, v6);
}

- (void)_ioAccessoryManagerAttached:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(ACCTransportIOAccessoryListener *)self delegate];
  if (v5)
  {
    uint8_t v6 = (void *)v5;
    dispatch_queue_t v7 = [(ACCTransportIOAccessoryListener *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(ACCTransportIOAccessoryListener *)self delegate];
      [v9 IOAccessoryManagerServiceArrived:v3];
    }
  }
}

- (void)_ioAccessoryManagerTerminated:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(ACCTransportIOAccessoryListener *)self delegate];
  if (v5)
  {
    uint8_t v6 = (void *)v5;
    dispatch_queue_t v7 = [(ACCTransportIOAccessoryListener *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(ACCTransportIOAccessoryListener *)self delegate];
      [v9 IOAccessoryManagerServiceTerminated:v3];
    }
  }
}

- (void)_stopListeningForIOAccessoryManagerClass
{
  ioAccessoryManagerClassNotify = self->_ioAccessoryManagerClassNotify;
  if (ioAccessoryManagerClassNotify) {
    IONotificationPortDestroy(ioAccessoryManagerClassNotify);
  }
  io_object_t ioAccessoryManagerClassIteratorArrived = self->_ioAccessoryManagerClassIteratorArrived;
  if (ioAccessoryManagerClassIteratorArrived)
  {
    IOObjectRelease(ioAccessoryManagerClassIteratorArrived);
    self->_io_object_t ioAccessoryManagerClassIteratorArrived = 0;
  }
  io_object_t ioAccessoryManagerClassIteratorTerminated = self->_ioAccessoryManagerClassIteratorTerminated;
  if (ioAccessoryManagerClassIteratorTerminated)
  {
    IOObjectRelease(ioAccessoryManagerClassIteratorTerminated);
    self->_io_object_t ioAccessoryManagerClassIteratorTerminated = 0;
  }
}

- (void)_startListeningForIOAccessoryPortClass
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_222CE3000, v0, v1, "ret = 0x%X for kIOAccessoryPortClass kIOPublishNotification", v2, v3, v4, v5, v6);
}

- (void)_ioAccessoryPortAttached:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(ACCTransportIOAccessoryListener *)self delegate];
  if (v5)
  {
    uint8_t v6 = (void *)v5;
    dispatch_queue_t v7 = [(ACCTransportIOAccessoryListener *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(ACCTransportIOAccessoryListener *)self delegate];
      [v9 IOAccessoryPortServiceArrived:v3];
    }
  }
}

- (void)_ioAccessoryPortTerminated:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(ACCTransportIOAccessoryListener *)self delegate];
  if (v5)
  {
    uint8_t v6 = (void *)v5;
    dispatch_queue_t v7 = [(ACCTransportIOAccessoryListener *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(ACCTransportIOAccessoryListener *)self delegate];
      [v9 IOAccessoryPortServiceTerminated:v3];
    }
  }
}

- (void)_stopListeningForIOAccessoryPortClass
{
  ioAccessoryPortClassNotify = self->_ioAccessoryPortClassNotify;
  if (ioAccessoryPortClassNotify)
  {
    IONotificationPortDestroy(ioAccessoryPortClassNotify);
    self->_ioAccessoryPortClassNotify = 0;
  }
  io_object_t ioAccessoryPortClassIteratorArrived = self->_ioAccessoryPortClassIteratorArrived;
  if (ioAccessoryPortClassIteratorArrived)
  {
    IOObjectRelease(ioAccessoryPortClassIteratorArrived);
    self->_io_object_t ioAccessoryPortClassIteratorArrived = 0;
  }
  io_object_t ioAccessoryPortClassIteratorTerminated = self->_ioAccessoryPortClassIteratorTerminated;
  if (ioAccessoryPortClassIteratorTerminated)
  {
    IOObjectRelease(ioAccessoryPortClassIteratorTerminated);
    self->_io_object_t ioAccessoryPortClassIteratorTerminated = 0;
  }
}

- (void)_startListeningForIOAccessoryAuthCPClass
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_222CE3000, v0, v1, "ret = 0x%X for kAppleAuthCPClassKey kIOPublishNotification", v2, v3, v4, v5, v6);
}

- (void)_ioAccessoryAuthCPAttached:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(ACCTransportIOAccessoryListener *)self delegate];
  if (v5)
  {
    uint8_t v6 = (void *)v5;
    dispatch_queue_t v7 = [(ACCTransportIOAccessoryListener *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(ACCTransportIOAccessoryListener *)self delegate];
      [v9 IOAccessoryAuthCPServiceArrived:v3];
    }
  }
}

- (void)_ioAccessoryAuthCPTerminated:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(ACCTransportIOAccessoryListener *)self delegate];
  if (v5)
  {
    uint8_t v6 = (void *)v5;
    dispatch_queue_t v7 = [(ACCTransportIOAccessoryListener *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(ACCTransportIOAccessoryListener *)self delegate];
      [v9 IOAccessoryAuthCPServiceTerminated:v3];
    }
  }
}

- (void)_stopListeningForIOAccessoryAuthCPClass
{
  ioAccessoryAuthCPClassNotify = self->_ioAccessoryAuthCPClassNotify;
  if (ioAccessoryAuthCPClassNotify)
  {
    IONotificationPortDestroy(ioAccessoryAuthCPClassNotify);
    self->_ioAccessoryAuthCPClassNotify = 0;
  }
  io_object_t ioAccessoryAuthCPClassIteratorArrived = self->_ioAccessoryAuthCPClassIteratorArrived;
  if (ioAccessoryAuthCPClassIteratorArrived)
  {
    IOObjectRelease(ioAccessoryAuthCPClassIteratorArrived);
    self->_io_object_t ioAccessoryAuthCPClassIteratorArrived = 0;
  }
  io_object_t ioAccessoryAuthCPClassIteratorTerminated = self->_ioAccessoryAuthCPClassIteratorTerminated;
  if (ioAccessoryAuthCPClassIteratorTerminated)
  {
    IOObjectRelease(ioAccessoryAuthCPClassIteratorTerminated);
    self->_io_object_t ioAccessoryAuthCPClassIteratorTerminated = 0;
  }
}

- (void)_startListeningForIOAccessoryEAClass
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_222CE3000, v0, v1, "ret = 0x%X for kIOAccessoryEAInterfaceClass kIOPublishNotification", v2, v3, v4, v5, v6);
}

- (void)_ioAccessoryEAAttached:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(ACCTransportIOAccessoryListener *)self delegate];
  if (v5)
  {
    uint8_t v6 = (void *)v5;
    dispatch_queue_t v7 = [(ACCTransportIOAccessoryListener *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(ACCTransportIOAccessoryListener *)self delegate];
      [v9 IOAccessoryEAServiceArrived:v3];
    }
  }
}

- (void)_ioAccessoryEATerminated:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(ACCTransportIOAccessoryListener *)self delegate];
  if (v5)
  {
    uint8_t v6 = (void *)v5;
    dispatch_queue_t v7 = [(ACCTransportIOAccessoryListener *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(ACCTransportIOAccessoryListener *)self delegate];
      [v9 IOAccessoryEAServiceTerminated:v3];
    }
  }
}

- (void)_stopListeningForIOAccessoryEAClass
{
  ioAccessoryEAClassNotify = self->_ioAccessoryEAClassNotify;
  if (ioAccessoryEAClassNotify)
  {
    IONotificationPortDestroy(ioAccessoryEAClassNotify);
    self->_ioAccessoryEAClassNotify = 0;
  }
  io_object_t ioAccessoryEAClassIteratorArrived = self->_ioAccessoryEAClassIteratorArrived;
  if (ioAccessoryEAClassIteratorArrived)
  {
    IOObjectRelease(ioAccessoryEAClassIteratorArrived);
    self->_io_object_t ioAccessoryEAClassIteratorArrived = 0;
  }
  io_object_t ioAccessoryEAClassIteratorTerminated = self->_ioAccessoryEAClassIteratorTerminated;
  if (ioAccessoryEAClassIteratorTerminated)
  {
    IOObjectRelease(ioAccessoryEAClassIteratorTerminated);
    self->_io_object_t ioAccessoryEAClassIteratorTerminated = 0;
  }
}

- (void)_startListeningForIOAccessoryOOBPairingClass
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_222CE3000, v0, v1, "ret = 0x%X for kIOAccessoryOOBPairingInterfaceClass kIOPublishNotification", v2, v3, v4, v5, v6);
}

- (void)_ioAccessoryOOBPairingAttached:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(ACCTransportIOAccessoryListener *)self delegate];
  if (v5)
  {
    uint8_t v6 = (void *)v5;
    dispatch_queue_t v7 = [(ACCTransportIOAccessoryListener *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(ACCTransportIOAccessoryListener *)self delegate];
      [v9 IOAccessoryOOBPairingServiceArrived:v3];
    }
  }
}

- (void)_ioAccessoryOOBPairingTerminated:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(ACCTransportIOAccessoryListener *)self delegate];
  if (v5)
  {
    uint8_t v6 = (void *)v5;
    dispatch_queue_t v7 = [(ACCTransportIOAccessoryListener *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(ACCTransportIOAccessoryListener *)self delegate];
      [v9 IOAccessoryOOBPairingServiceTerminated:v3];
    }
  }
}

- (void)_stopListeningForIOAccessoryOOBPairingClass
{
  ioAccessoryOOBPairingClassNotify = self->_ioAccessoryOOBPairingClassNotify;
  if (ioAccessoryOOBPairingClassNotify)
  {
    IONotificationPortDestroy(ioAccessoryOOBPairingClassNotify);
    self->_ioAccessoryOOBPairingClassNotify = 0;
  }
  io_object_t ioAccessoryOOBPairingClassIteratorArrived = self->_ioAccessoryOOBPairingClassIteratorArrived;
  if (ioAccessoryOOBPairingClassIteratorArrived)
  {
    IOObjectRelease(ioAccessoryOOBPairingClassIteratorArrived);
    self->_io_object_t ioAccessoryOOBPairingClassIteratorArrived = 0;
  }
  io_object_t ioAccessoryOOBPairingClassIteratorTerminated = self->_ioAccessoryOOBPairingClassIteratorTerminated;
  if (ioAccessoryOOBPairingClassIteratorTerminated)
  {
    IOObjectRelease(ioAccessoryOOBPairingClassIteratorTerminated);
    self->_io_object_t ioAccessoryOOBPairingClassIteratorTerminated = 0;
  }
}

- (void)_startListeningForIOAccessoryConfigStreamClass
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_222CE3000, v0, v1, "ret = 0x%X for kIOAccessoryConfigStreamInterfaceClass kIOPublishNotification", v2, v3, v4, v5, v6);
}

- (void)_ioAccessoryConfigStreamAttached:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(ACCTransportIOAccessoryListener *)self delegate];
  if (v5)
  {
    uint8_t v6 = (void *)v5;
    dispatch_queue_t v7 = [(ACCTransportIOAccessoryListener *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(ACCTransportIOAccessoryListener *)self delegate];
      [v9 IOAccessoryConfigStreamServiceArrived:v3];
    }
  }
}

- (void)_ioAccessoryConfigStreamTerminated:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(ACCTransportIOAccessoryListener *)self delegate];
  if (v5)
  {
    uint8_t v6 = (void *)v5;
    dispatch_queue_t v7 = [(ACCTransportIOAccessoryListener *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(ACCTransportIOAccessoryListener *)self delegate];
      [v9 IOAccessoryConfigStreamServiceTerminated:v3];
    }
  }
}

- (void)_stopListeningForIOAccessoryConfigStreamClass
{
  ioAccessoryConfigStreamClassNotify = self->_ioAccessoryConfigStreamClassNotify;
  if (ioAccessoryConfigStreamClassNotify)
  {
    IONotificationPortDestroy(ioAccessoryConfigStreamClassNotify);
    self->_ioAccessoryConfigStreamClassNotify = 0;
  }
  io_object_t ioAccessoryConfigStreamClassIteratorArrived = self->_ioAccessoryConfigStreamClassIteratorArrived;
  if (ioAccessoryConfigStreamClassIteratorArrived)
  {
    IOObjectRelease(ioAccessoryConfigStreamClassIteratorArrived);
    self->_io_object_t ioAccessoryConfigStreamClassIteratorArrived = 0;
  }
  io_object_t ioAccessoryConfigStreamClassIteratorTerminated = self->_ioAccessoryConfigStreamClassIteratorTerminated;
  if (ioAccessoryConfigStreamClassIteratorTerminated)
  {
    IOObjectRelease(ioAccessoryConfigStreamClassIteratorTerminated);
    self->_io_object_t ioAccessoryConfigStreamClassIteratorTerminated = 0;
  }
}

- (ACCTransportIOAccessoryListenerProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ACCTransportIOAccessoryListenerProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ioAccessoryListenerQueue, 0);
}

@end