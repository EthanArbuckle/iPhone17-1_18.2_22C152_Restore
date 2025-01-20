@interface HAPDeviceID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDeviceID:(id)a3;
- (HAPDeviceID)init;
- (HAPDeviceID)initWithCoder:(id)a3;
- (HAPDeviceID)initWithDeviceIDData:(id)a3;
- (HAPDeviceID)initWithDeviceIDString:(id)a3;
- (NSData)data;
- (NSString)deviceIDString;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HAPDeviceID

- (void).cxx_destruct
{
}

- (HAPDeviceID)initWithDeviceIDString:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = HAPDeviceIDLength;
  v6 = &buf[-((HAPDeviceIDLength + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v7 = v4;
  [v7 UTF8String];
  [v7 length];
  if (TextToHardwareAddress())
  {
    v8 = (void *)MEMORY[0x1D944E080]();
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v15 = v10;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@Invalid device identifier string: %@", buf, 0x16u);
    }
    v11 = 0;
  }
  else
  {
    v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v6 length:v5];
    self = [(HAPDeviceID *)self initWithDeviceIDData:v12];

    v11 = self;
  }

  return v11;
}

- (HAPDeviceID)initWithDeviceIDData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (v5 == HAPDeviceIDLength)
  {
    v14.receiver = self;
    v14.super_class = (Class)HAPDeviceID;
    v6 = [(HAPDeviceID *)&v14 init];
    if (v6)
    {
      uint64_t v7 = [v4 copy];
      data = v6->_data;
      v6->_data = (NSData *)v7;
    }
    self = v6;
    v9 = self;
  }
  else
  {
    v10 = (void *)MEMORY[0x1D944E080]();
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v16 = v12;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@Invalid device identifier data: %@", buf, 0x16u);
    }
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HAPDeviceID *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    v6 = v5;
    if (v6) {
      BOOL v7 = [(HAPDeviceID *)self isEqualToDeviceID:v6];
    }
    else {
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (unint64_t)hash
{
  v2 = [(HAPDeviceID *)self data];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqualToDeviceID:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  uint64_t v5 = [(HAPDeviceID *)self data];
  v6 = [v4 data];

  LOBYTE(v4) = [v5 isEqualToData:v6];
  return (char)v4;
}

- (NSData)data
{
  return self->_data;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if ([v5 allowsKeyedCoding])
  {
    id v4 = [(HAPDeviceID *)self data];
    [v5 encodeObject:v4 forKey:@"HAP.data"];
  }
}

- (HAPDeviceID)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HAP.data"];
    self = [(HAPDeviceID *)self initWithDeviceIDData:v5];

    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)deviceIDString
{
  v8[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (char *)v8 - ((3 * HAPDeviceIDLength + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = [(HAPDeviceID *)self data];
  [v4 bytes];
  id v5 = [(HAPDeviceID *)self data];
  [v5 length];
  HardwareAddressToCString();

  v6 = [NSString stringWithUTF8String:v3];

  return (NSString *)v6;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HAPDeviceID *)self deviceIDString];
  v6 = [v3 stringWithFormat:@"<%@ %p: %@>", v4, self, v5];

  return v6;
}

- (HAPDeviceID)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end