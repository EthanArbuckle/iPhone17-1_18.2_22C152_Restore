@interface DAEventDevicesPresent
- (BOOL)devicesMigrated;
- (BOOL)devicesPresent;
- (DAEventDevicesPresent)initWithMigration:(BOOL)a3;
- (DAEventDevicesPresent)initWithPresent:(BOOL)a3;
- (DAEventDevicesPresent)initWithPresent:(BOOL)a3 devicesMigrated:(BOOL)a4;
- (DAEventDevicesPresent)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSArray)devices;
- (id)descriptionWithLevel:(int)a3;
- (void)encodeWithXPCObject:(id)a3;
- (void)setDevices:(id)a3;
@end

@implementation DAEventDevicesPresent

- (DAEventDevicesPresent)initWithPresent:(BOOL)a3
{
  v4 = [(DAEvent *)self initWithEventType:50];
  v5 = v4;
  if (v4)
  {
    v4->_devicesPresent = a3;
    v6 = v4;
  }

  return v5;
}

- (DAEventDevicesPresent)initWithPresent:(BOOL)a3 devicesMigrated:(BOOL)a4
{
  v5 = [(DAEventDevicesPresent *)self initWithPresent:a3];
  v6 = v5;
  if (v5)
  {
    v5->_devicesMigrated = a4;
    v7 = v5;
  }

  return v6;
}

- (DAEventDevicesPresent)initWithMigration:(BOOL)a3
{
  v4 = [(DAEvent *)self initWithEventType:15];
  v5 = v4;
  if (v4)
  {
    v4->_devicesMigrated = a3;
    v6 = v4;
  }

  return v5;
}

- (DAEventDevicesPresent)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DAEventDevicesPresent;
  v7 = [(DAEvent *)&v10 initWithXPCObject:v6 error:a4];
  if (v7 && CUXPCDecodeBool() && CUXPCDecodeBool())
  {
    objc_opt_class();
    CUXPCDecodeNSArrayOfClass();
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)DAEventDevicesPresent;
  [(DAEvent *)&v5 encodeWithXPCObject:v4];
  if (self->_devicesPresent) {
    xpc_dictionary_set_BOOL(v4, "dvPr", 1);
  }
  if (self->_devicesMigrated) {
    xpc_dictionary_set_BOOL(v4, "dvMg", 1);
  }
  CUXPCEncodeNSArrayOfObjects();
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v4 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    id v4 = 0;
  }
  CUAppendF();
  id v5 = v4;

  CUAppendF();
  id v6 = (__CFString *)v5;

  devices = self->_devices;
  if (devices)
  {
    v12 = devices;
    CUAppendF();
    v8 = v6;

    id v6 = v8;
  }
  v9 = &stru_26D120818;
  if (v6) {
    v9 = v6;
  }
  objc_super v10 = v9;

  return v10;
}

- (BOOL)devicesPresent
{
  return self->_devicesPresent;
}

- (BOOL)devicesMigrated
{
  return self->_devicesMigrated;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end