@interface HSHIDDevice
- (BOOL)_setReportWithID:(int64_t)a3 type:(int)a4 data:(id)a5 error:(id *)a6;
- (BOOL)close:(id *)a3;
- (BOOL)open:(id *)a3;
- (BOOL)setFeatureReportWithID:(int64_t)a3 data:(id)a4 error:(id *)a5;
- (BOOL)setOutputReportWithID:(int64_t)a3 data:(id)a4 error:(id *)a5;
- (BOOL)setValue:(id)a3 forProperty:(__CFString *)a4;
- (HSHIDDevice)initWithDeviceRef:(__IOHIDDevice *)a3;
- (HSHIDDevice)initWithService:(unsigned int)a3;
- (__IOHIDDevice)deviceRef;
- (id)deviceRemovedCallback;
- (id)featureReportWithID:(int64_t)a3 error:(id *)a4;
- (id)inputReportCallback;
- (id)valueForProperty:(__CFString *)a3;
- (void)dealloc;
- (void)scheduleWithRunLoop:(__CFRunLoop *)a3 mode:(__CFString *)a4;
- (void)setDeviceRef:(__IOHIDDevice *)a3;
- (void)setDeviceRemovedCallback:(id)a3;
- (void)setInputReportCallback:(id)a3;
- (void)unscheduleFromRunLoop:(__CFRunLoop *)a3 mode:(__CFString *)a4;
@end

@implementation HSHIDDevice

- (HSHIDDevice)initWithDeviceRef:(__IOHIDDevice *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HSHIDDevice;
  v4 = [(HSHIDDevice *)&v7 init];
  v5 = v4;
  if (a3)
  {
    bzero(v4->_reportCallbackBuffer, 0x4000uLL);
    v5->_deviceRef = a3;
    *(_WORD *)&v5->_active = 0;
    a3 = v5;
  }

  return (HSHIDDevice *)a3;
}

- (HSHIDDevice)initWithService:(unsigned int)a3
{
  IOHIDDeviceRef v4 = IOHIDDeviceCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], a3);

  return [(HSHIDDevice *)self initWithDeviceRef:v4];
}

- (void)dealloc
{
  deviceRef = self->_deviceRef;
  if (deviceRef) {
    CFRelease(deviceRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)HSHIDDevice;
  [(HSHIDDevice *)&v4 dealloc];
}

- (BOOL)open:(id *)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  IOReturn v4 = IOHIDDeviceOpen(self->_deviceRef, 0);
  IOReturn v5 = v4;
  if (a3 && v4)
  {
    v6 = [NSString stringWithFormat:@"Failed to open the IOHIDDevice!"];
    objc_super v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F08350];
    uint64_t v13 = *MEMORY[0x263F08320];
    v14[0] = v6;
    v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v10 = [v7 errorWithDomain:v8 code:v5 userInfo:v9];

    id v11 = v10;
    *a3 = v11;
  }
  return v5 == 0;
}

- (BOOL)close:(id *)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  IOReturn v4 = IOHIDDeviceClose(self->_deviceRef, 0);
  IOReturn v5 = v4;
  if (a3 && v4)
  {
    v6 = [NSString stringWithFormat:@"Failed to close the IOHIDDevice!"];
    objc_super v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F08350];
    uint64_t v13 = *MEMORY[0x263F08320];
    v14[0] = v6;
    v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v10 = [v7 errorWithDomain:v8 code:v5 userInfo:v9];

    id v11 = v10;
    *a3 = v11;
  }
  return v5 == 0;
}

- (id)valueForProperty:(__CFString *)a3
{
  return (id)IOHIDDeviceGetProperty(self->_deviceRef, a3);
}

- (BOOL)setValue:(id)a3 forProperty:(__CFString *)a4
{
  return IOHIDDeviceSetProperty(self->_deviceRef, a4, a3) != 0;
}

- (BOOL)_setReportWithID:(int64_t)a3 type:(int)a4 data:(id)a5 error:(id *)a6
{
  v23[1] = *MEMORY[0x263EF8340];
  deviceRef = self->_deviceRef;
  id v10 = a5;
  id v11 = (const uint8_t *)[v10 bytes];
  CFIndex v12 = [v10 length];

  mach_error_t v13 = IOHIDDeviceSetReport(deviceRef, (IOHIDReportType)a4, a3, v11, v12);
  mach_error_t v14 = v13;
  if (a6 && v13)
  {
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to set report 0x%x: %s", a3, mach_error_string(v13));
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08350];
    uint64_t v22 = *MEMORY[0x263F08320];
    v23[0] = v15;
    v18 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v19 = [v16 errorWithDomain:v17 code:v14 userInfo:v18];

    id v20 = v19;
    *a6 = v20;
  }
  return v14 == 0;
}

- (BOOL)setOutputReportWithID:(int64_t)a3 data:(id)a4 error:(id *)a5
{
  return [(HSHIDDevice *)self _setReportWithID:a3 type:1 data:a4 error:a5];
}

- (BOOL)setFeatureReportWithID:(int64_t)a3 data:(id)a4 error:(id *)a5
{
  return [(HSHIDDevice *)self _setReportWithID:a3 type:2 data:a4 error:a5];
}

- (id)featureReportWithID:(int64_t)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  v6 = self;
  objc_sync_enter(v6);
  CFIndex pReportLength = 0;
  mach_error_t Report = IOHIDDeviceGetReport(v6->_deviceRef, kIOHIDReportTypeFeature, a3, featureReportWithID_error__buffer, &pReportLength);
  mach_error_t v8 = Report;
  if (Report)
  {
    if (a4)
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to get report 0x%x: %s", a3, mach_error_string(Report));
      id v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v16 = *MEMORY[0x263F08320];
      v17[0] = v9;
      id v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
      CFIndex v12 = [v10 errorWithDomain:*MEMORY[0x263F08350] code:v8 userInfo:v11];

      id v13 = v12;
      *a4 = v13;

      a4 = 0;
    }
  }
  else
  {
    a4 = [MEMORY[0x263EFF8F8] dataWithBytes:featureReportWithID_error__buffer length:pReportLength];
  }
  objc_sync_exit(v6);

  return a4;
}

- (void)scheduleWithRunLoop:(__CFRunLoop *)a3 mode:(__CFString *)a4
{
  if (!self->_cancelled)
  {
    IOHIDDeviceRegisterRemovalCallback(self->_deviceRef, (IOHIDCallback)__deviceRemovedCallback, self);
    IOHIDDeviceRegisterInputReportCallback(self->_deviceRef, self->_reportCallbackBuffer, 0x4000, (IOHIDReportCallback)__deviceInputReportCallback, self);
  }
  deviceRef = self->_deviceRef;

  IOHIDDeviceScheduleWithRunLoop(deviceRef, a3, a4);
}

- (void)unscheduleFromRunLoop:(__CFRunLoop *)a3 mode:(__CFString *)a4
{
  self->_cancelled = 1;
}

- (__IOHIDDevice)deviceRef
{
  return self->_deviceRef;
}

- (void)setDeviceRef:(__IOHIDDevice *)a3
{
  self->_deviceRef = a3;
}

- (id)deviceRemovedCallback
{
  return self->_deviceRemovedCallback;
}

- (void)setDeviceRemovedCallback:(id)a3
{
}

- (id)inputReportCallback
{
  return self->_inputReportCallback;
}

- (void)setInputReportCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_inputReportCallback, 0);

  objc_storeStrong(&self->_deviceRemovedCallback, 0);
}

@end