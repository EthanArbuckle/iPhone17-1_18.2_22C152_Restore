@interface DADopplerProximityManager
+ (id)sharedInstance;
- (BOOL)activateProximitySensor;
- (BOOL)backupDopplerState;
- (BOOL)deviceSetDetectionModeActive:(BOOL)a3;
- (BOOL)deviceSetStreamEnabled:(BOOL)a3;
- (BOOL)getHIDReportForDevice:(__IOHIDDevice *)a3 reportType:(int)a4 reportID:(int64_t)a5 buffer:(void *)a6 bufferSize:(int64_t)a7;
- (BOOL)isUpdating;
- (BOOL)retrieveHIDDevice;
- (BOOL)setHIDReportForDevice:(__IOHIDDevice *)a3 reportType:(int)a4 reportID:(int64_t)a5 buffer:(id)a6;
- (BOOL)startProximitySensorUpdatesWithHandler:(id)a3;
- (BOOL)stopProximitySensorUpdates;
- (DADopplerProximityManager)init;
- (OS_dispatch_queue)handlerQueue;
- (OS_dispatch_queue)proxQueue;
- (__CFRunLoop)proxRunLoop;
- (__IOHIDDevice)proxDeviceRef;
- (char)buffer;
- (id)handler;
- (id)sensorData;
- (void)deactivateProximitySensor;
- (void)dealloc;
- (void)deregisterForCallback;
- (void)handleNewProximityValue:(int)a3;
- (void)registerForCallback;
- (void)scheduleProximityUpdates;
- (void)setBuffer:(char *)a3;
- (void)setHandler:(id)a3;
- (void)setHandlerQueue:(id)a3;
- (void)setProxDeviceRef:(__IOHIDDevice *)a3;
- (void)setProxQueue:(id)a3;
- (void)setProxRunLoop:(__CFRunLoop *)a3;
- (void)setUpdating:(BOOL)a3;
- (void)startRunLoop;
- (void)teardownProxManager;
- (void)unscheduleProximityUpdates;
@end

@implementation DADopplerProximityManager

+ (id)sharedInstance
{
  if (qword_100011C98 != -1) {
    dispatch_once(&qword_100011C98, &stru_10000C430);
  }
  v2 = (void *)qword_100011C90;

  return v2;
}

- (DADopplerProximityManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)DADopplerProximityManager;
  v2 = [(DADopplerProximityManager *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.DiagnosticsService.Diagnostic-4276.dopplerProximitySensorUpdatesQueue", 0);
    proxQueue = v2->_proxQueue;
    v2->_proxQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.DiagnosticsService.Diagnostic-4276.dopplerProximitySensorUpdatesHandlerQueue", 0);
    handlerQueue = v2->_handlerQueue;
    v2->_handlerQueue = (OS_dispatch_queue *)v5;

    v2->_buffer = (char *)malloc_type_malloc(0x200uLL, 0x100004077774924uLL);
  }
  return v2;
}

- (void)dealloc
{
  buffer = self->_buffer;
  if (buffer)
  {
    free(buffer);
    self->_buffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DADopplerProximityManager;
  [(DADopplerProximityManager *)&v4 dealloc];
}

- (void)teardownProxManager
{
  manager = self->_manager;
  if (manager)
  {
    IOHIDManagerClose(manager, 0);
    CFRelease(self->_manager);
    self->_manager = 0;
  }
}

- (id)sensorData
{
  return 0;
}

- (BOOL)startProximitySensorUpdatesWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  char v14 = ![(DADopplerProximityManager *)self isUpdating];
  if (*((unsigned char *)v12 + 24))
  {
    [(DADopplerProximityManager *)self setHandler:v4];
    dispatch_queue_t v5 = [(DADopplerProximityManager *)self proxQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000028E8;
    block[3] = &unk_10000C458;
    block[4] = self;
    block[5] = &v11;
    dispatch_sync(v5, block);

    if (*((unsigned char *)v12 + 24))
    {
      [(DADopplerProximityManager *)self setUpdating:1];
      v6 = [(DADopplerProximityManager *)self proxQueue];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10000291C;
      v9[3] = &unk_10000C480;
      v9[4] = self;
      dispatch_async(v6, v9);
    }
    BOOL v7 = *((unsigned char *)v12 + 24) != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (BOOL)stopProximitySensorUpdates
{
  if ([(DADopplerProximityManager *)self isUpdating])
  {
    [(DADopplerProximityManager *)self deactivateProximitySensor];
    [(DADopplerProximityManager *)self setUpdating:0];
  }
  return 1;
}

- (BOOL)activateProximitySensor
{
  BOOL v3 = [(DADopplerProximityManager *)self retrieveHIDDevice];
  if (v3)
  {
    BOOL v3 = [(DADopplerProximityManager *)self backupDopplerState];
    if (v3)
    {
      BOOL v3 = [(DADopplerProximityManager *)self deviceSetDetectionModeActive:1];
      if (v3)
      {
        BOOL v3 = [(DADopplerProximityManager *)self deviceSetStreamEnabled:1];
        if (v3)
        {
          [(DADopplerProximityManager *)self registerForCallback];
          LOBYTE(v3) = 1;
        }
      }
    }
  }
  return v3;
}

- (void)deactivateProximitySensor
{
  [(DADopplerProximityManager *)self deviceSetStreamEnabled:0];
  [(DADopplerProximityManager *)self deviceSetDetectionModeActive:0];
  [(DADopplerProximityManager *)self deregisterForCallback];

  [(DADopplerProximityManager *)self unscheduleProximityUpdates];
}

- (void)startRunLoop
{
  [(DADopplerProximityManager *)self setProxRunLoop:CFRunLoopGetCurrent()];
  [(DADopplerProximityManager *)self scheduleProximityUpdates];
  CFRunLoopRun();

  [(DADopplerProximityManager *)self teardownProxManager];
}

- (BOOL)retrieveHIDDevice
{
  BOOL v3 = IOHIDManagerCreate(kCFAllocatorDefault, 0);
  self->_manager = v3;
  if (!v3) {
    return 0;
  }
  IOHIDManagerSetDeviceMatching(v3, (CFDictionaryRef)&off_10000CC78);
  IOHIDManagerOpen(self->_manager, 0);
  CFSetRef v4 = IOHIDManagerCopyDevices(self->_manager);
  CFSetRef v5 = v4;
  if (v4 && [(__CFSet *)v4 count])
  {
    [(DADopplerProximityManager *)self setProxDeviceRef:[(__CFSet *)v5 anyObject]];
    if ((unint64_t)[(__CFSet *)v5 count] >= 2)
    {
      v6 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100006F60(v5, v6);
      }
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)backupDopplerState
{
  BOOL v3 = [(DADopplerProximityManager *)self getHIDReportForDevice:[(DADopplerProximityManager *)self proxDeviceRef] reportType:2 reportID:81 buffer:&self->_initialDopplerDataStreamEnables bufferSize:2];
  self->_initialDopplerDataStreamEnables.type = 81;
  if (v3)
  {
    LOBYTE(v3) = [(DADopplerProximityManager *)self getHIDReportForDevice:[(DADopplerProximityManager *)self proxDeviceRef] reportType:2 reportID:80 buffer:&self->_initialDopplerDetectionMode bufferSize:2];
    self->_initialDopplerDetectionMode.type = 80;
  }
  return v3;
}

- (BOOL)deviceSetStreamEnabled:(BOOL)a3
{
  if (a3) {
    char value = self->_initialDopplerDataStreamEnables.value | 2;
  }
  else {
    char value = self->_initialDopplerDataStreamEnables.value;
  }
  v9[0] = 81;
  v9[1] = value;
  CFSetRef v5 = [(DADopplerProximityManager *)self proxDeviceRef];
  v6 = +[NSData dataWithBytes:v9 length:2];
  BOOL v7 = [(DADopplerProximityManager *)self setHIDReportForDevice:v5 reportType:2 reportID:81 buffer:v6];

  return v7;
}

- (BOOL)deviceSetDetectionModeActive:(BOOL)a3
{
  if (a3) {
    unsigned __int8 value = 15;
  }
  else {
    unsigned __int8 value = self->_initialDopplerDetectionMode.value;
  }
  v9[0] = 80;
  v9[1] = value;
  CFSetRef v5 = [(DADopplerProximityManager *)self proxDeviceRef];
  v6 = +[NSData dataWithBytes:v9 length:2];
  BOOL v7 = [(DADopplerProximityManager *)self setHIDReportForDevice:v5 reportType:2 reportID:80 buffer:v6];

  return v7;
}

- (BOOL)getHIDReportForDevice:(__IOHIDDevice *)a3 reportType:(int)a4 reportID:(int64_t)a5 buffer:(void *)a6 bufferSize:(int64_t)a7
{
  CFIndex pReportLength = a7;
  return IOHIDDeviceGetReport(a3, (IOHIDReportType)a4, a5, (uint8_t *)a6, &pReportLength) == 0;
}

- (BOOL)setHIDReportForDevice:(__IOHIDDevice *)a3 reportType:(int)a4 reportID:(int64_t)a5 buffer:(id)a6
{
  id v9 = a6;
  v10 = (const uint8_t *)[v9 bytes];
  id v11 = [v9 length];

  return IOHIDDeviceSetReport(a3, (IOHIDReportType)a4, a5, v10, (CFIndex)v11) == 0;
}

- (void)registerForCallback
{
  BOOL v3 = [(DADopplerProximityManager *)self proxDeviceRef];
  CFSetRef v4 = [(DADopplerProximityManager *)self buffer];

  IOHIDDeviceRegisterInputReportCallback(v3, (uint8_t *)v4, 512, (IOHIDReportCallback)sub_100002E10, self);
}

- (void)deregisterForCallback
{
  BOOL v3 = [(DADopplerProximityManager *)self proxDeviceRef];
  CFSetRef v4 = [(DADopplerProximityManager *)self buffer];

  IOHIDDeviceRegisterInputReportCallback(v3, (uint8_t *)v4, 512, 0, self);
}

- (void)scheduleProximityUpdates
{
  BOOL v3 = [(DADopplerProximityManager *)self proxDeviceRef];
  CFSetRef v4 = [(DADopplerProximityManager *)self proxRunLoop];

  IOHIDDeviceScheduleWithRunLoop(v3, v4, kCFRunLoopCommonModes);
}

- (void)unscheduleProximityUpdates
{
  IOHIDDeviceUnscheduleFromRunLoop([(DADopplerProximityManager *)self proxDeviceRef], [(DADopplerProximityManager *)self proxRunLoop], kCFRunLoopCommonModes);
  BOOL v3 = [(DADopplerProximityManager *)self proxRunLoop];

  CFRunLoopStop(v3);
}

- (void)handleNewProximityValue:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  CFSetRef v5 = [(DADopplerProximityManager *)self handler];
  CFSetRef v4 = +[NSDate date];
  v5[2](v5, v3, v4);
}

- (__IOHIDDevice)proxDeviceRef
{
  return self->_proxDeviceRef;
}

- (void)setProxDeviceRef:(__IOHIDDevice *)a3
{
  self->_proxDeviceRef = a3;
}

- (__CFRunLoop)proxRunLoop
{
  return self->_proxRunLoop;
}

- (void)setProxRunLoop:(__CFRunLoop *)a3
{
  self->_proxRunLoop = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (BOOL)isUpdating
{
  return self->_updating;
}

- (void)setUpdating:(BOOL)a3
{
  self->_updating = a3;
}

- (OS_dispatch_queue)proxQueue
{
  return self->_proxQueue;
}

- (void)setProxQueue:(id)a3
{
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (void)setHandlerQueue:(id)a3
{
}

- (char)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(char *)a3
{
  self->_buffer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_proxQueue, 0);

  objc_storeStrong(&self->_handler, 0);
}

@end