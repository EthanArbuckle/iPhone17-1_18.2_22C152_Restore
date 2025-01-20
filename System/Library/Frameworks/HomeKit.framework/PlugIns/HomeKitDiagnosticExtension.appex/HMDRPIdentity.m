@interface HMDRPIdentity
+ (BOOL)supportsSecureCoding;
+ (id)identityWithRPIdentity:(id)a3;
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRPIndentity:(id)a3;
- (HMDRPIdentity)init;
- (HMDRPIdentity)initWithCoder:(id)a3;
- (HMDRPIdentity)initWithDeviceIRK:(id)a3;
- (HMFKey)deviceIRK;
- (id)logIdentifier;
- (id)shortDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDRPIdentity

- (void).cxx_destruct
{
}

- (HMFKey)deviceIRK
{
  return (HMFKey *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDRPIdentity *)self deviceIRK];
  [v4 encodeObject:v5 forKey:HMDeviceRPDeviceIRKCodingKey];
}

- (HMDRPIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:HMDeviceRPDeviceIRKCodingKey];

  v6 = [(HMDRPIdentity *)self initWithDeviceIRK:v5];
  return v6;
}

- (id)logIdentifier
{
  v2 = objc_opt_class();

  return [v2 shortDescription];
}

- (BOOL)isEqualToRPIndentity:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDRPIdentity *)self deviceIRK];
  v6 = [v4 deviceIRKData];

  LOBYTE(v4) = [v5 isEqualToData:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDRPIdentity *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    v6 = v5;
    v7 = v6;
    if (v6)
    {
      v8 = [(HMDRPIdentity *)v6 deviceIRK];
      v9 = [(HMDRPIdentity *)self deviceIRK];
      char v10 = HMFEqualObjects();
    }
    else
    {
      char v10 = 0;
    }
  }
  return v10;
}

- (unint64_t)hash
{
  v2 = [(HMDRPIdentity *)self deviceIRK];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)shortDescription
{
  v2 = objc_opt_class();

  return [v2 shortDescription];
}

- (HMDRPIdentity)initWithDeviceIRK:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)HMDRPIdentity;
    id v5 = [(HMDRPIdentity *)&v10 init];
    if (v5)
    {
      v6 = (HMFKey *)[v4 copy];
      deviceIRK = v5->_deviceIRK;
      v5->_deviceIRK = v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (HMDRPIdentity)init
{
  v2 = NSStringFromSelector(a2);
  id v3 = +[NSString stringWithFormat:@"%@ is unavailable", v2];
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (qword_100036C08 != -1) {
    dispatch_once(&qword_100036C08, &stru_10002C928);
  }
  v2 = (void *)qword_100036C10;

  return v2;
}

+ (id)identityWithRPIdentity:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc((Class)HMFKey);
    uint64_t v5 = HMFKeyTypeIRK;
    uint64_t v6 = HMFKeySizeIRK128;
    v7 = [v3 deviceIRKData];

    id v8 = [v4 initWithType:v5 size:v6 data:v7];
    id v9 = [objc_alloc((Class)objc_opt_class()) initWithDeviceIRK:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

@end