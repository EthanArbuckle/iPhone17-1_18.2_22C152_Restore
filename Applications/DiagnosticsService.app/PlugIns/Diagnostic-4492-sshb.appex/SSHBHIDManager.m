@interface SSHBHIDManager
- (BOOL)setReportForDevice:(__IOHIDDevice *)a3 reportType:(int)a4 reportID:(int64_t)a5 buffer:(id)a6 error:(id *)a7;
- (BOOL)setReportForDevice:(__IOHIDDevice *)a3 reportType:(int)a4 reportID:(int64_t)a5 buffer:(id)a6 error:(id *)a7 domain:(id)a8 code:(int)a9;
- (SSHBHIDDeviceManager)deviceManager;
- (SSHBHIDManager)init;
- (__IOHIDManager)hidManager;
- (char)buffer;
- (id)getReportForDevice:(__IOHIDDevice *)a3 reportType:(int)a4 reportID:(int64_t)a5 error:(id *)a6;
- (id)getReportForDevice:(__IOHIDDevice *)a3 reportType:(int)a4 reportID:(int64_t)a5 error:(id *)a6 domain:(id)a7 code:(int)a8;
- (void)cacheDevices;
- (void)dealloc;
- (void)deviceConnected:(__IOHIDDevice *)a3;
- (void)deviceDisconnected:(__IOHIDDevice *)a3;
- (void)hidReportCallback:(__IOHIDDevice *)a3 result:(int)a4 type:(int)a5 reportID:(unsigned int)a6 report:(char *)a7 reportLength:(int64_t)a8;
- (void)registerDevice:(id)a3 forNotificationsFromDeviceWithUsage:(id)a4;
- (void)setBuffer:(char *)a3;
- (void)setDeviceManager:(id)a3;
- (void)setHidManager:(__IOHIDManager *)a3;
- (void)unregisterDevice:(id)a3 forNotificationsFromDeviceWithUsage:(id)a4;
@end

@implementation SSHBHIDManager

- (SSHBHIDManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SSHBHIDManager;
  v2 = [(SSHBHIDManager *)&v8 init];
  if (v2)
  {
    v2->_hidManager = IOHIDManagerCreate(kCFAllocatorDefault, 0);
    v3 = objc_alloc_init(SSHBHIDDeviceManager);
    deviceManager = v2->_deviceManager;
    v2->_deviceManager = v3;

    v2->_buffer = (char *)malloc_type_malloc(0x200uLL, 0x100004077774924uLL);
    IOHIDManagerOpen(v2->_hidManager, 0);
    IOHIDManagerSetDeviceMatching(v2->_hidManager, 0);
    IOHIDManagerRegisterDeviceMatchingCallback(v2->_hidManager, (IOHIDDeviceCallback)deviceConnectedCallback, v2);
    IOHIDManagerRegisterDeviceRemovalCallback(v2->_hidManager, (IOHIDDeviceCallback)deviceRemovedCallback, v2);
    hidManager = v2->_hidManager;
    Current = CFRunLoopGetCurrent();
    IOHIDManagerScheduleWithRunLoop(hidManager, Current, kCFRunLoopDefaultMode);
    [(SSHBHIDManager *)v2 cacheDevices];
  }
  return v2;
}

- (void)cacheDevices
{
  CFSetRef v3 = IOHIDManagerCopyDevices(self->_hidManager);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  CFSetRef v4 = v3;
  id v5 = [(__CFSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      objc_super v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[SSHBHIDManager deviceConnected:](self, "deviceConnected:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v8), (void)v9);
        objc_super v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(__CFSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)deviceConnected:(__IOHIDDevice *)a3
{
  id v5 = [IOHIDDeviceGetProperty(a3, @"PrimaryUsage") unsignedIntValue];
  id v6 = -[SSHBHIDUsage initWithPrimaryUsage:primaryUsagePage:]([SSHBHIDUsage alloc], "initWithPrimaryUsage:primaryUsagePage:", v5, [IOHIDDeviceGetProperty(a3, @"PrimaryUsagePage") unsignedIntValue]);
  uint64_t v7 = [(SSHBHIDManager *)self deviceManager];
  [v7 addDevice:a3 forUsage:v6];

  objc_super v8 = [(SSHBHIDManager *)self deviceManager];
  long long v9 = [v8 subscribersFromUsage:v6];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100002380;
  v10[3] = &unk_10000C278;
  v10[4] = a3;
  [v9 enumerateObjectsUsingBlock:v10];
  IOHIDDeviceRegisterInputReportCallback(a3, (uint8_t *)[(SSHBHIDManager *)self buffer], 512, (IOHIDReportCallback)sub_1000023E0, self);
}

- (void)deviceDisconnected:(__IOHIDDevice *)a3
{
  id v5 = [IOHIDDeviceGetProperty(a3, @"PrimaryUsage") unsignedIntValue];
  id v6 = -[SSHBHIDUsage initWithPrimaryUsage:primaryUsagePage:]([SSHBHIDUsage alloc], "initWithPrimaryUsage:primaryUsagePage:", v5, [IOHIDDeviceGetProperty(a3, @"PrimaryUsagePage") unsignedIntValue]);
  uint64_t v7 = [(SSHBHIDManager *)self deviceManager];
  [v7 removeDevice:a3];

  objc_super v8 = [(SSHBHIDManager *)self deviceManager];
  long long v9 = [v8 subscribersFromUsage:v6];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000253C;
  v10[3] = &unk_10000C278;
  v10[4] = a3;
  [v9 enumerateObjectsUsingBlock:v10];
  IOHIDDeviceRegisterInputReportCallback(a3, (uint8_t *)[(SSHBHIDManager *)self buffer], 512, 0, self);
}

- (void)registerDevice:(id)a3 forNotificationsFromDeviceWithUsage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SSHBHIDManager *)self deviceManager];
  [v8 addSubscriber:v7 forUsage:v6];
}

- (void)unregisterDevice:(id)a3 forNotificationsFromDeviceWithUsage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SSHBHIDManager *)self deviceManager];
  [v8 removeSubscriber:v7 forUsage:v6];
}

- (void)dealloc
{
  buffer = self->_buffer;
  if (buffer)
  {
    free(buffer);
    self->_buffer = 0;
  }
  CFSetRef v4 = [(SSHBHIDManager *)self hidManager];
  Current = CFRunLoopGetCurrent();
  IOHIDManagerUnscheduleFromRunLoop(v4, Current, kCFRunLoopDefaultMode);
  IOHIDManagerClose([(SSHBHIDManager *)self hidManager], 0);
  v6.receiver = self;
  v6.super_class = (Class)SSHBHIDManager;
  [(SSHBHIDManager *)&v6 dealloc];
}

- (id)getReportForDevice:(__IOHIDDevice *)a3 reportType:(int)a4 reportID:(int64_t)a5 error:(id *)a6 domain:(id)a7 code:(int)a8
{
  id v13 = a7;
  if (!a3)
  {
    v19 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100006DD0(v19);
    }

    goto LABEL_8;
  }
  CFIndex pReportLength = 512;
  uint64_t v14 = IOHIDDeviceGetReport(a3, (IOHIDReportType)a4, a5, report, &pReportLength);
  if (a6 && v14)
  {
    v15 = +[NSString stringWithFormat:@"HID Report Get failed with return value 0x%x", v14];
    v16 = +[NSBundle mainBundle];
    v17 = [v16 localizedStringForKey:v15 value:&stru_10000C338 table:0];

    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    v24 = v17;
    v18 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    *a6 = +[NSError errorWithDomain:v13 code:a8 userInfo:v18];

LABEL_8:
    v20 = 0;
    goto LABEL_10;
  }
  v20 = +[NSData dataWithBytes:report length:pReportLength];
LABEL_10:

  return v20;
}

- (BOOL)setReportForDevice:(__IOHIDDevice *)a3 reportType:(int)a4 reportID:(int64_t)a5 buffer:(id)a6 error:(id *)a7 domain:(id)a8 code:(int)a9
{
  id v14 = a6;
  id v15 = a8;
  if (!a3)
  {
    v19 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100006E14(v19);
    }
    goto LABEL_7;
  }
  id v16 = v14;
  uint64_t v17 = [IOHIDDeviceSetReport:a3 reportType:a4 reportID:a5 report:(const uint8_t *)[v16 bytes] reportLength:[v16 length]];
  BOOL v18 = v17 == 0;
  if (a7 && v17)
  {
    v19 = +[NSString stringWithFormat:@"HID Report Set failed with reportID 0x%lx packet %@ with return value 0x%x.", a5, v16, v17];
    v20 = +[NSBundle mainBundle];
    v21 = [v20 localizedStringForKey:v19 value:&stru_10000C338 table:0];

    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    v25 = v21;
    v22 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    *a7 = +[NSError errorWithDomain:v15 code:a9 userInfo:v22];

LABEL_7:
    BOOL v18 = 0;
  }

  return v18;
}

- (id)getReportForDevice:(__IOHIDDevice *)a3 reportType:(int)a4 reportID:(int64_t)a5 error:(id *)a6
{
  return [(SSHBHIDManager *)self getReportForDevice:a3 reportType:*(void *)&a4 reportID:a5 error:a6 domain:@"com.apple.osdiags.SSHBHIDManager" code:0];
}

- (BOOL)setReportForDevice:(__IOHIDDevice *)a3 reportType:(int)a4 reportID:(int64_t)a5 buffer:(id)a6 error:(id *)a7
{
  LODWORD(v8) = 1;
  return [(SSHBHIDManager *)self setReportForDevice:a3 reportType:*(void *)&a4 reportID:a5 buffer:a6 error:a7 domain:@"com.apple.osdiags.SSHBHIDManager" code:v8];
}

- (void)hidReportCallback:(__IOHIDDevice *)a3 result:(int)a4 type:(int)a5 reportID:(unsigned int)a6 report:(char *)a7 reportLength:(int64_t)a8
{
  id v15 = [IOHIDDeviceGetProperty(a3, @"PrimaryUsage") unsignedIntValue];
  id v16 = [[SSHBHIDUsage alloc] initWithPrimaryUsage:v15 primaryUsagePage:[IOHIDDeviceGetProperty(a3, @"PrimaryUsagePage") unsignedIntValue]];
  uint64_t v17 = [(SSHBHIDManager *)self deviceManager];
  BOOL v18 = [v17 subscribersFromUsage:v16];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100002C3C;
  v19[3] = &unk_10000C298;
  int v20 = a4;
  int v21 = a5;
  unsigned int v22 = a6;
  v19[4] = a3;
  v19[5] = a7;
  v19[6] = a8;
  [v18 enumerateObjectsUsingBlock:v19];
}

- (__IOHIDManager)hidManager
{
  return self->_hidManager;
}

- (void)setHidManager:(__IOHIDManager *)a3
{
  self->_hidManager = a3;
}

- (SSHBHIDDeviceManager)deviceManager
{
  return self->_deviceManager;
}

- (void)setDeviceManager:(id)a3
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
}

@end