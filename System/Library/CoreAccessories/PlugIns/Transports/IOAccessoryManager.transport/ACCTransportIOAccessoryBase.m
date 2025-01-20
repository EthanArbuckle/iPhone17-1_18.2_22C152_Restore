@interface ACCTransportIOAccessoryBase
- (ACCTransportIOAccessoryBase)initWithIOAccessoryClass:(int)a3 ioService:(unsigned int)a4;
- (BOOL)transmitData:(id)a3;
- (int)ioServiceClassType;
- (int)primaryPortNumber;
- (unsigned)ioService;
- (unsigned)upstreamManagerService;
- (void)dealloc;
- (void)setPrimaryPortNumber:(int)a3;
- (void)setUpstreamManagerService:(unsigned int)a3;
- (void)transportClassTerminated;
@end

@implementation ACCTransportIOAccessoryBase

- (ACCTransportIOAccessoryBase)initWithIOAccessoryClass:(int)a3 ioService:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  v25.receiver = self;
  v25.super_class = (Class)ACCTransportIOAccessoryBase;
  v6 = [(ACCTransportIOAccessoryBase *)&v25 init];
  v7 = v6;
  if (v6)
  {
    v6->_ioServiceClassType = v5;
    p_ioServiceClassType = (unsigned int *)&v6->_ioServiceClassType;
    v6->_unsigned int ioService = v4;
    v9 = NSString;
    id v10 = +[ACCTransportIOAccessorySharedManager IOAccessoryClassStringForIOAccessoryClassType:v5];
    v11 = objc_msgSend(v9, "stringWithFormat:", @"com.apple.ACCTransportPlugin.%s.%d", objc_msgSend(v10, "UTF8String"), v4);

    id v12 = v11;
    dispatch_queue_t v13 = dispatch_queue_create((const char *)[v12 UTF8String], 0);
    notificationPortQueue = v7->_notificationPortQueue;
    v7->_notificationPortQueue = (OS_dispatch_queue *)v13;

    v15 = IONotificationPortCreate(*MEMORY[0x263F0EC90]);
    v7->_ioNotificationPort = v15;
    IONotificationPortSetDispatchQueue(v15, (dispatch_queue_t)v7->_notificationPortQueue);
    v7->_ioNotificationObject = 0;
    v7->_ioConnect = 0;
    v7->_int primaryPortNumber = -1;
    v7->_unsigned int upstreamManagerService = IOAccessoryManagerGetUpstreamService();
    switch(*p_ioServiceClassType)
    {
      case 0u:
      case 2u:
      case 3u:
      case 4u:
      case 6u:
        int PrimaryPort = IOAccessoryManagerGetPrimaryPort();
        goto LABEL_4;
      case 1u:
        int PrimaryPort = IOAccessoryPortGetManagerPrimaryPort();
LABEL_4:
        v7->_int primaryPortNumber = PrimaryPort;
        if (PrimaryPort == -1) {
          goto LABEL_17;
        }
        int v17 = logModuleForTransport(*p_ioServiceClassType);
        if (v17 < 0 || !gLogObjects || gNumLogObjects <= v17)
        {
          if (v17 != -1 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          v18 = MEMORY[0x263EF8438];
          id v19 = MEMORY[0x263EF8438];
        }
        else
        {
          v18 = *(id *)(gLogObjects + 8 * v17);
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int ioService = v7->_ioService;
          int primaryPortNumber = v7->_primaryPortNumber;
          unsigned int upstreamManagerService = v7->_upstreamManagerService;
          *(_DWORD *)buf = 67109632;
          unsigned int v27 = ioService;
          __int16 v28 = 1024;
          int v29 = primaryPortNumber;
          __int16 v30 = 1024;
          unsigned int v31 = upstreamManagerService;
          _os_log_impl(&dword_222CE3000, v18, OS_LOG_TYPE_DEFAULT, "adding service with ioService %d, _primaryPortNumber %d, and _upstreamManager service %d", buf, 0x14u);
        }
        break;
      default:
        v7->_int primaryPortNumber = -1;
LABEL_17:
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v18 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          v18 = MEMORY[0x263EF8438];
          id v23 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryBase initWithIOAccessoryClass:ioService:](&v7->_ioServiceClassType, v18);
        }
        break;
    }

    IOObjectRetain(v7->_ioService);
  }
  return v7;
}

- (void)dealloc
{
  ioNotificationPort = self->_ioNotificationPort;
  if (ioNotificationPort)
  {
    IONotificationPortDestroy(ioNotificationPort);
    self->_ioNotificationPort = 0;
  }
  self->_int primaryPortNumber = -1;
  io_connect_t ioConnect = self->_ioConnect;
  if (ioConnect) {
    IOServiceClose(ioConnect);
  }
  io_object_t ioNotificationObject = self->_ioNotificationObject;
  if (ioNotificationObject)
  {
    IOObjectRelease(ioNotificationObject);
    self->_io_object_t ioNotificationObject = 0;
  }
  IOObjectRelease(self->_ioService);
  io_object_t upstreamManagerService = self->_upstreamManagerService;
  if (upstreamManagerService) {
    IOObjectRelease(upstreamManagerService);
  }
  notificationPortQueue = self->_notificationPortQueue;
  self->_notificationPortQueue = 0;

  v8.receiver = self;
  v8.super_class = (Class)ACCTransportIOAccessoryBase;
  [(ACCTransportIOAccessoryBase *)&v8 dealloc];
}

- (void)transportClassTerminated
{
  ioNotificationPort = self->_ioNotificationPort;
  if (ioNotificationPort)
  {
    IONotificationPortDestroy(ioNotificationPort);
    self->_ioNotificationPort = 0;
  }
  io_object_t ioNotificationObject = self->_ioNotificationObject;
  if (ioNotificationObject)
  {
    IOObjectRelease(ioNotificationObject);
    self->_io_object_t ioNotificationObject = 0;
  }
}

- (BOOL)transmitData:(id)a3
{
  id v3 = a3;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[ACCTransportIOAccessoryBase transmitData:](v6);
  }

  return 0;
}

- (unsigned)ioService
{
  return self->_ioService;
}

- (int)ioServiceClassType
{
  return self->_ioServiceClassType;
}

- (int)primaryPortNumber
{
  return self->_primaryPortNumber;
}

- (void)setPrimaryPortNumber:(int)a3
{
  self->_int primaryPortNumber = a3;
}

- (unsigned)upstreamManagerService
{
  return self->_upstreamManagerService;
}

- (void)setUpstreamManagerService:(unsigned int)a3
{
  self->_io_object_t upstreamManagerService = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithIOAccessoryClass:(int *)a1 ioService:(NSObject *)a2 .cold.1(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_222CE3000, a2, OS_LOG_TYPE_ERROR, "Invalid Port Connected! _ioServiceClassType %d, unable to find primary port number (setting to kIOAccesoryPortInvalid)", (uint8_t *)v3, 8u);
}

- (void)transmitData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_222CE3000, log, OS_LOG_TYPE_ERROR, "THIS METHOD MUST BE OVERRIDDEN! (transmitData:)", v1, 2u);
}

@end