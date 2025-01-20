@interface CRKFetchDeviceGestaltResultObject
+ (BOOL)supportsSecureCoding;
- (CRKDeviceGestalt)deviceGestalt;
- (CRKFetchDeviceGestaltResultObject)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceGestalt:(id)a3;
@end

@implementation CRKFetchDeviceGestaltResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchDeviceGestaltResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKFetchDeviceGestaltResultObject;
  v5 = [(CATTaskResultObject *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"deviceGestalt"];
    deviceGestalt = v5->_deviceGestalt;
    v5->_deviceGestalt = (CRKDeviceGestalt *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKFetchDeviceGestaltResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(CRKFetchDeviceGestaltResultObject *)self deviceGestalt];
  [v4 encodeObject:v5 forKey:@"deviceGestalt"];
}

- (CRKDeviceGestalt)deviceGestalt
{
  return self->_deviceGestalt;
}

- (void)setDeviceGestalt:(id)a3
{
}

- (void).cxx_destruct
{
}

@end