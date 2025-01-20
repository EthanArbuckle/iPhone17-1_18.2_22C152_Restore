@interface HMAccessoryAllowedHost
+ (BOOL)supportsSecureCoding;
- (BOOL)isUnrestricted;
- (HMAccessoryAllowedHost)initWithCoder:(id)a3;
- (NSSet)addresses;
- (NSString)address;
- (NSString)name;
- (unint64_t)purpose;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMAccessoryAllowedHost

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addresses, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)isUnrestricted
{
  return self->_unrestricted;
}

- (NSSet)addresses
{
  return self->_addresses;
}

- (unint64_t)purpose
{
  return self->_purpose;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (NSString)address
{
  v2 = [(HMAccessoryAllowedHost *)self addresses];
  v3 = [v2 anyObject];

  return (NSString *)v3;
}

- (NSString)name
{
  if ([(HMAccessoryAllowedHost *)self isUnrestricted])
  {
    v3 = +[HMLocalization sharedManager];
    id v4 = [v3 getLocalizedString:@"ALLOWED_HOST_UNRESTRICTED_NAME"];
  }
  else
  {
    id v4 = self->_name;
  }

  return v4;
}

- (HMAccessoryAllowedHost)initWithCoder:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMAccessoryAllowedHost;
  v5 = [(HMAccessoryAllowedHost *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAAH.name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAAH.purpose"];
    v5->_purpose = [v8 unsignedIntegerValue];
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    v11 = [v9 setWithArray:v10];
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"HMAAH.hostAddresses"];
    addresses = v5->_addresses;
    v5->_addresses = (NSSet *)v12;

    v5->_unrestricted = [v4 decodeBoolForKey:@"HMAAH.unrestricted"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end