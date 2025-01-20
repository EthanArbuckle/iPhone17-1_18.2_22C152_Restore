@interface HIDUserDevice
- (BOOL)handleReport:(id)a3 error:(id *)a4;
- (BOOL)handleReport:(id)a3 withTimestamp:(unint64_t)a4 error:(id *)a5;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (HIDUserDevice)initWithProperties:(id)a3;
- (id)description;
- (id)propertyForKey:(id)a3;
- (unsigned)service;
- (void)activate;
- (void)cancel;
- (void)dealloc;
- (void)setCancelHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setGetReportHandler:(id)a3;
- (void)setSetReportHandler:(id)a3;
@end

@implementation HIDUserDevice

- (HIDUserDevice)initWithProperties:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HIDUserDevice;
  v5 = [(HIDUserDevice *)&v12 init];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"HIDUserDeviceCreateInactive"];
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [v4 objectForKeyedSubscript:@"HIDUserDeviceCreateInactive"];
    [v8 isEqual:MEMORY[0x1E4F1CC38]];
  }
  uint64_t v9 = IOHIDUserDeviceCreateWithOptions();
  v5->_device = (__IOHIDUserDevice *)v9;
  if (v9)
  {
    v5->_service = IOHIDUserDeviceCopyService();
    v10 = v5;
  }
  else
  {
LABEL_6:
    v10 = 0;
  }

  return v10;
}

- (void)dealloc
{
  io_object_t service = self->_service;
  if (service) {
    IOObjectRelease(service);
  }
  device = self->_device;
  if (device) {
    CFRelease(device);
  }
  v5.receiver = self;
  v5.super_class = (Class)HIDUserDevice;
  [(HIDUserDevice *)&v5 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@", self->_device];
}

- (id)propertyForKey:(id)a3
{
  v3 = (void *)IOHIDUserDeviceCopyProperty(self->_device, (CFStringRef)a3);
  return v3;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return IOHIDUserDeviceSetProperty(self->_device, (CFStringRef)a4, a3) != 0;
}

- (void)setCancelHandler:(id)a3
{
  self->_cancelHandler = _Block_copy(a3);
  MEMORY[0x1F41817F8]();
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)activate
{
  device = self->_device;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __25__HIDUserDevice_activate__block_invoke;
  handler[3] = &unk_1E6C15630;
  handler[4] = self;
  IOHIDUserDeviceSetCancelHandler(device, handler);
  IOHIDUserDeviceActivate(self->_device);
}

void __25__HIDUserDevice_activate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

- (void)cancel
{
}

- (void)setGetReportHandler:(id)a3
{
  id v4 = a3;
  if (self->_getReportHandler) {
    -[HIDUserDevice setGetReportHandler:]();
  }
  id v7 = v4;
  objc_super v5 = _Block_copy(v4);
  id getReportHandler = self->_getReportHandler;
  self->_id getReportHandler = v5;

  IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback();
}

- (void)setSetReportHandler:(id)a3
{
  id v4 = a3;
  if (self->_setReportHandler) {
    -[HIDUserDevice setSetReportHandler:]();
  }
  id v7 = v4;
  objc_super v5 = _Block_copy(v4);
  id setReportHandler = self->_setReportHandler;
  self->_id setReportHandler = v5;

  IOHIDUserDeviceRegisterSetReportCallback();
}

- (BOOL)handleReport:(id)a3 error:(id *)a4
{
  id v5 = a3;
  [v5 bytes];
  [v5 length];

  uint64_t v6 = IOHIDUserDeviceHandleReport();
  int v7 = v6;
  if (a4 && v6)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithIOReturn:v6];
  }
  return v7 == 0;
}

- (BOOL)handleReport:(id)a3 withTimestamp:(unint64_t)a4 error:(id *)a5
{
  device = self->_device;
  id v8 = a3;
  uint64_t v9 = (const uint8_t *)[v8 bytes];
  CFIndex v10 = [v8 length];

  uint64_t v11 = IOHIDUserDeviceHandleReportWithTimeStamp(device, a4, v9, v10);
  int v12 = v11;
  if (a5 && v11)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithIOReturn:v11];
  }
  return v12 == 0;
}

- (unsigned)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong(&self->_setReportHandler, 0);
  objc_storeStrong(&self->_getReportHandler, 0);
}

- (void)setGetReportHandler:.cold.1()
{
}

- (void)setSetReportHandler:.cold.1()
{
  CFAllocatorRef v0 = (const __CFAllocator *)_os_crash();
  __break(1u);
  CFArrayCreateMutable(v0, v1, v2);
}

@end