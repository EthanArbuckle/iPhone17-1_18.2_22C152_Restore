@interface DAEventDevices
+ (BOOL)supportsSecureCoding;
- (DAEventDevices)initWithCoder:(id)a3;
- (DAEventDevices)initWithEventType:(int64_t)a3 devices:(id)a4;
- (DAEventDevices)initWithEventType:(int64_t)a3 devices:(id)a4 error:(id)a5;
- (DAEventDevices)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSArray)devices;
- (id)descriptionWithLevel:(int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCObject:(id)a3;
@end

@implementation DAEventDevices

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAEventDevices)initWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)DAEventDevices;
  id v3 = a3;
  v4 = [(DAEvent *)&v15 initWithCoder:v3];
  if (v4)
  {
    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();

    v5 = v4;
  }
  else
  {
    uint64_t v7 = objc_opt_class();
    v14 = DAErrorF(350001, (uint64_t)"%@ init failed", v8, v9, v10, v11, v12, v13, v7);
    [v3 failWithError:v14];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DAEventDevices;
  [(DAEvent *)&v6 encodeWithCoder:v4];
  devices = self->_devices;
  if (devices) {
    [v4 encodeObject:devices forKey:@"devi"];
  }
}

- (DAEventDevices)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DAEventDevices;
  uint64_t v7 = [(DAEvent *)&v10 initWithXPCObject:v6 error:a4];
  if (v7 && (objc_opt_class(), CUXPCDecodeNSArrayOfClass())) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)encodeWithXPCObject:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DAEventDevices;
  id v3 = a3;
  [(DAEvent *)&v4 encodeWithXPCObject:v3];
  CUXPCEncodeNSArrayOfObjects();
}

- (DAEventDevices)initWithEventType:(int64_t)a3 devices:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [(DAEvent *)self initWithEventType:a3];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_devices, a4);
    objc_super v10 = v9;
  }

  return v9;
}

- (DAEventDevices)initWithEventType:(int64_t)a3 devices:(id)a4 error:(id)a5
{
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DAEventDevices;
  objc_super v10 = [(DAEvent *)&v14 initWithEventType:a3 error:a5];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_devices, a4);
    uint64_t v12 = v11;
  }

  return v11;
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0) {
    int v5 = 8;
  }
  else {
    int v5 = 12;
  }
  int v16 = v5;
  v15.receiver = self;
  v15.super_class = (Class)DAEventDevices;
  id v6 = -[DAEvent descriptionWithLevel:](&v15, sel_descriptionWithLevel_);
  id v7 = (__CFString *)[v6 mutableCopy];

  if ((a3 & 0x8000000) == 0)
  {
    objc_opt_class();
    CUAppendF();
    uint64_t v8 = v7;

    id v7 = v8;
  }
  devices = self->_devices;
  if (devices)
  {
    objc_super v14 = devices;
    CUAppendF();
    objc_super v10 = v7;

    id v7 = v10;
  }
  uint64_t v11 = &stru_26D120818;
  if (v7) {
    uint64_t v11 = v7;
  }
  uint64_t v12 = v11;

  return v12;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void).cxx_destruct
{
}

@end