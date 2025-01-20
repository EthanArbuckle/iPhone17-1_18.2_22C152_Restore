@interface HMFPairingKey
+ (BOOL)supportsSecureCoding;
+ (void)setClassMappingForNSCoder;
- (BOOL)isEqual:(id)a3;
- (HMFPairingKey)init;
- (HMFPairingKey)initWithCoder:(id)a3;
- (HMFPairingKey)initWithPairingKeyData:(id)a3;
- (NSData)data;
- (id)attributeDescriptions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMFPairingKey

+ (void)setClassMappingForNSCoder
{
  [MEMORY[0x1E4F28DB0] setClassName:@"HAPPairingKey" forClass:objc_opt_class()];
  v2 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v3 = objc_opt_class();
  [v2 setClass:v3 forClassName:@"HAPPairingKey"];
}

- (HMFPairingKey)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMFPairingKey)initWithPairingKeyData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length] == 32)
  {
    v14.receiver = self;
    v14.super_class = (Class)HMFPairingKey;
    v5 = [(HMFPairingKey *)&v14 init];
    if (v5)
    {
      uint64_t v6 = objc_msgSend(v4, "hmf_zeroingCopy");
      data = v5->_data;
      v5->_data = (NSData *)v6;
    }
    v8 = v5;
    v9 = v8;
  }
  else
  {
    v10 = (void *)MEMORY[0x19F3A87A0]();
    v8 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier(v8);
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      __int16 v17 = 2048;
      uint64_t v18 = 32;
      _os_log_impl(&dword_19D57B000, v11, OS_LOG_TYPE_ERROR, "%{public}@The pairing key data must be %tu bytes long", buf, 0x16u);
    }
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = [(HMFPairingKey *)self data];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMFPairingKey *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(HMFPairingKey *)v4 data];
      uint64_t v6 = [(HMFPairingKey *)self data];
      char v7 = [v5 isEqualToData:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)attributeDescriptions
{
  v9[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [HMFAttributeDescription alloc];
  id v4 = [(HMFPairingKey *)self data];
  v5 = CUPrintNSObjectMasked();
  uint64_t v6 = [(HMFAttributeDescription *)v3 initWithName:@"Hash" value:v5];
  v9[0] = v6;
  char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMFPairingKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HAP.data"];

  uint64_t v6 = [(HMFPairingKey *)self initWithPairingKeyData:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFPairingKey *)self data];
  [v4 encodeObject:v5 forKey:@"HAP.data"];
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
}

@end