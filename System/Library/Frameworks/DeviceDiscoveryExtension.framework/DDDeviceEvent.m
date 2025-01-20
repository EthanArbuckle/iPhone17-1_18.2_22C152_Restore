@interface DDDeviceEvent
+ (BOOL)supportsSecureCoding;
+ (id)allocInitWithXPCObject:(id)a3 error:(id *)a4;
- (DDDevice)device;
- (DDDeviceEvent)initWithCoder:(id)a3;
- (DDDeviceEvent)initWithEventType:(DDEventType)type device:(DDDevice *)device;
- (DDDeviceEvent)initWithXPCObject:(id)a3 error:(id *)a4;
- (DDEventType)eventType;
- (NSError)error;
- (id)createDADeviceEvent;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCObject:(id)a3;
@end

@implementation DDDeviceEvent

- (id)createDADeviceEvent
{
  DDEventType v3 = [(DDDeviceEvent *)self eventType];
  v4 = [(DDDeviceEvent *)self device];
  v5 = [v4 createDADevice];

  v6 = (void *)[objc_alloc(MEMORY[0x263F397D8]) initWithEventType:v3 device:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allocInitWithXPCObject:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (CUXPCDecodeSInt64RangedEx() != 5 && a4)
  {
    DDErrorF(350001, (uint64_t)"DDEvent init bad type: %d", v6, v7, v8, v9, v10, v11, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (DDDeviceEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  if (self)
  {
    objc_opt_class();
    NSDecodeObjectIfPresent();
    id v5 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v6 = v5;
    if ([v6 containsValueForKey:@"evTy"]) {
      self->_eventType = [v6 decodeIntegerForKey:@"evTy"];
    }

    uint64_t v7 = self;
  }
  else
  {
    uint64_t v9 = objc_opt_class();
    v16 = DDErrorF(350001, (uint64_t)"%@ init failed", v10, v11, v12, v13, v14, v15, v9);
    [v4 failWithError:v16];
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  device = self->_device;
  id v8 = v4;
  if (device)
  {
    [v4 encodeObject:device forKey:@"devi"];
    id v4 = v8;
  }
  error = self->_error;
  if (error)
  {
    [v8 encodeObject:error forKey:@"errr"];
    id v4 = v8;
  }
  int64_t eventType = self->_eventType;
  if (eventType)
  {
    [v8 encodeInteger:eventType forKey:@"evTy"];
    id v4 = v8;
  }
}

- (DDDeviceEvent)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DDDeviceEvent;
  uint64_t v7 = [(DDDeviceEvent *)&v18 init];
  if (!v7)
  {
    if (a4)
    {
      uint64_t v11 = objc_opt_class();
      DDErrorF(350001, (uint64_t)"%@ super init failed", v12, v13, v14, v15, v16, v17, v11);
      uint64_t v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    goto LABEL_11;
  }
  if (!CUXPCDecodeNSError()) {
    goto LABEL_11;
  }
  int64_t v19 = 0;
  int v8 = CUXPCDecodeSInt64RangedEx();
  if (v8 == 6)
  {
    v7->_int64_t eventType = v19;
    goto LABEL_6;
  }
  if (v8 == 5)
  {
LABEL_11:
    uint64_t v9 = 0;
    goto LABEL_8;
  }
LABEL_6:
  objc_opt_class();
  if (!CUXPCDecodeObject()) {
    goto LABEL_11;
  }
  uint64_t v9 = v7;
LABEL_8:

  return v9;
}

- (void)encodeWithXPCObject:(id)a3
{
  xpc_object_t xdict = a3;
  CUXPCEncodeObject();
  CUXPCEncodeNSError();
  int64_t eventType = self->_eventType;
  if (eventType) {
    xpc_dictionary_set_int64(xdict, "evTy", eventType);
  }
}

- (DDDeviceEvent)initWithEventType:(DDEventType)type device:(DDDevice *)device
{
  uint64_t v7 = device;
  int v8 = [(DDDeviceEvent *)self init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, device);
    v9->_int64_t eventType = type;
    uint64_t v10 = v9;
  }

  return v9;
}

- (id)description
{
  return [(DDDeviceEvent *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v11 = objc_opt_class();
    CUAppendF();
    id v4 = (__CFString *)0;
  }
  if ([(DDDeviceEvent *)self eventType])
  {
    CUAppendF();
    id v5 = v4;

    id v4 = v5;
  }
  device = self->_device;
  if (device)
  {
    uint64_t v12 = device;
    CUAppendF();
    uint64_t v7 = v4;

    id v4 = v7;
  }
  int v8 = &stru_26E9C3090;
  if (v4) {
    int v8 = v4;
  }
  uint64_t v9 = v8;

  return v9;
}

- (DDDevice)device
{
  return self->_device;
}

- (DDEventType)eventType
{
  return self->_eventType;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end