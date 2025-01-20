@interface HMFHardwareAddress
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAddress:(id)a3;
- (HMFHardwareAddress)initWithAddressData:(id)a3;
- (HMFHardwareAddress)initWithAddressString:(id)a3 length:(unint64_t)a4;
- (HMFHardwareAddress)initWithCoder:(id)a3;
- (NSData)data;
- (NSString)formattedString;
- (NSString)propertyDescription;
- (unint64_t)hash;
- (unint64_t)length;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMFHardwareAddress

- (HMFHardwareAddress)initWithAddressString:(id)a3 length:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (a4 - 1 > 7)
  {
    v15 = (void *)MEMORY[0x19F3A87A0]();
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      __int16 v22 = 2048;
      unint64_t v23 = a4;
      _os_log_impl(&dword_19D57B000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to create hardware address with invalid length: %lu", buf, 0x16u);
    }

    v14 = 0;
  }
  else
  {
    id v8 = v6;
    [v8 UTF8String];
    [v8 length];
    int v9 = TextToHardwareAddress();
    if (v9)
    {
      int v10 = v9;
      v11 = (void *)MEMORY[0x19F3A87A0]();
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = HMFGetLogIdentifier(0);
        *(_DWORD *)buf = 138543874;
        v21 = v13;
        __int16 v22 = 2112;
        unint64_t v23 = (unint64_t)v8;
        __int16 v24 = 1024;
        int v25 = v10;
        _os_log_impl(&dword_19D57B000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert string to hardware address %@: %d", buf, 0x1Cu);
      }
      v14 = 0;
    }
    else
    {
      v18 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&buf[-((a4 + 15) & 0xFFFFFFFFFFFFFFF0)] length:a4];
      v14 = [(HMFHardwareAddress *)self initWithAddressData:v18];
      self = v18;
    }
  }
  return v14;
}

- (HMFHardwareAddress)initWithAddressData:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 length] || (unint64_t)objc_msgSend(v4, "length") >= 9)
  {
    v5 = (void *)MEMORY[0x19F3A87A0]();
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543618;
      v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to create hardware address with data of invalid length: %@", buf, 0x16u);
    }
    id v8 = 0;
    goto LABEL_8;
  }
  v11.receiver = self;
  v11.super_class = (Class)HMFHardwareAddress;
  id v8 = [(HMFHardwareAddress *)&v11 init];
  if (v8)
  {
    uint64_t v9 = [v4 copy];
    self = (HMFHardwareAddress *)*((void *)v8 + 2);
    *((void *)v8 + 2) = v9;
LABEL_8:
  }
  return (HMFHardwareAddress *)v8;
}

- (NSString)propertyDescription
{
  v2 = NSString;
  v3 = [(HMFHardwareAddress *)self formattedString];
  id v4 = [v2 stringWithFormat:@" formattedString=%@", v3];

  return (NSString *)v4;
}

- (unint64_t)length
{
  v2 = [(HMFHardwareAddress *)self data];
  unint64_t v3 = [v2 length];

  return v3;
}

- (NSString)formattedString
{
  v9[1] = *MEMORY[0x1E4F143B8];
  formattedString = self->_formattedString;
  if (!formattedString)
  {
    id v4 = (char *)v9 - ((3 * [(HMFHardwareAddress *)self length] + 15) & 0xFFFFFFFFFFFFFFF0);
    id v5 = [(HMFHardwareAddress *)self data];
    [v5 bytes];
    [(HMFHardwareAddress *)self length];
    HardwareAddressToCString();

    id v6 = [NSString stringWithUTF8String:v4];
    v7 = self->_formattedString;
    self->_formattedString = v6;

    formattedString = self->_formattedString;
  }
  return formattedString;
}

- (unint64_t)hash
{
  v2 = [(HMFHardwareAddress *)self data];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(HMFHardwareAddress *)self isEqualToAddress:v4];

  return v5;
}

- (BOOL)isEqualToAddress:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  BOOL v5 = [(HMFHardwareAddress *)self data];
  id v6 = [v4 data];

  LOBYTE(v4) = [v5 isEqualToData:v6];
  return (char)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMFHardwareAddress)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMF.data"];

  id v6 = [(HMFHardwareAddress *)self initWithAddressData:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFHardwareAddress *)self data];
  [v4 encodeObject:v5 forKey:@"HMF.data"];
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_formattedString, 0);
}

@end