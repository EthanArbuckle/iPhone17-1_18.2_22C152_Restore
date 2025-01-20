@interface OSLogDevice
- (NSString)uid;
- (OSLogDevice)init;
- (OSLogDevice)initWithMobileDevice:(void *)a3 andUDID:(id)a4;
- (OSLogDevice)initWithSimualatedDevice:(id)a3;
- (SimDevice)simDev;
- (id)description;
- (int64_t)devType;
- (void)dealloc;
- (void)mobileDeviceRef;
- (void)setDevType:(int64_t)a3;
- (void)setMobileDeviceRef:(void *)a3;
- (void)setSimDev:(id)a3;
- (void)setUid:(id)a3;
@end

@implementation OSLogDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_simDev, 0);
}

- (void)setUid:(id)a3
{
}

- (NSString)uid
{
  return self->_uid;
}

- (void)setSimDev:(id)a3
{
}

- (SimDevice)simDev
{
  return self->_simDev;
}

- (void)setMobileDeviceRef:(void *)a3
{
  self->_mobileDeviceRef = a3;
}

- (void)mobileDeviceRef
{
  return self->_mobileDeviceRef;
}

- (void)setDevType:(int64_t)a3
{
  self->_devType = a3;
}

- (int64_t)devType
{
  return self->_devType;
}

- (void)dealloc
{
  mobileDeviceRef = self->_mobileDeviceRef;
  if (mobileDeviceRef) {
    CFRelease(mobileDeviceRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)OSLogDevice;
  [(OSLogDevice *)&v4 dealloc];
}

- (OSLogDevice)initWithSimualatedDevice:(id)a3
{
  objc_super v4 = (SimDevice *)a3;
  v5 = [(OSLogDevice *)self init];
  v5->_devType = 2;
  v5->_mobileDeviceRef = 0;
  simDev = v5->_simDev;
  v5->_simDev = v4;
  v7 = v4;

  v8 = [(SimDevice *)v7 UDID];
  uint64_t v9 = [v8 UUIDString];
  uid = v5->_uid;
  v5->_uid = (NSString *)v9;

  return v5;
}

- (OSLogDevice)initWithMobileDevice:(void *)a3 andUDID:(id)a4
{
  v6 = (NSString *)a4;
  v7 = [(OSLogDevice *)self init];
  v7->_devType = 1;
  if (a3) {
    v8 = (void *)CFRetain(a3);
  }
  else {
    v8 = 0;
  }
  simDev = v7->_simDev;
  v7->_mobileDeviceRef = v8;
  v7->_simDev = 0;

  uid = v7->_uid;
  v7->_uid = v6;

  return v7;
}

- (id)description
{
  int64_t v3 = [(OSLogDevice *)self devType];
  if (v3 == 2)
  {
    v10 = NSString;
    v11 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v11);
    v8 = [(OSLogDevice *)self simDev];
    v12 = [(OSLogDevice *)self uid];
    uint64_t v9 = [v10 stringWithFormat:@"%@(Simulated): %@, %@", v6, v8, v12];
  }
  else
  {
    objc_super v4 = NSString;
    if (v3 == 1)
    {
      v5 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v5);
      v7 = [(OSLogDevice *)self mobileDeviceRef];
      v8 = [(OSLogDevice *)self uid];
      uint64_t v9 = [v4 stringWithFormat:@"%@(Mobile): %p, %@", v6, v7, v8];
    }
    else
    {
      v13 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v13);
      v14 = [(OSLogDevice *)self mobileDeviceRef];
      v8 = [(OSLogDevice *)self simDev];
      v15 = [(OSLogDevice *)self uid];
      uint64_t v9 = [v4 stringWithFormat:@"%@(Unknown): %p, %@, %@", v6, v14, v8, v15];
    }
  }

  return v9;
}

- (OSLogDevice)init
{
  v7.receiver = self;
  v7.super_class = (Class)OSLogDevice;
  v2 = [(OSLogDevice *)&v7 init];
  int64_t v3 = v2;
  if (v2)
  {
    v2->_devType = 0;
    v2->_mobileDeviceRef = 0;
    simDev = v2->_simDev;
    v2->_simDev = 0;

    uid = v3->_uid;
    v3->_uid = 0;
  }
  return v3;
}

@end