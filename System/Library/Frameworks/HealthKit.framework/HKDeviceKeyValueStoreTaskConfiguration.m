@interface HKDeviceKeyValueStoreTaskConfiguration
+ (BOOL)supportsSecureCoding;
- (HKDeviceKeyValueStoreTaskConfiguration)initWithCoder:(id)a3;
- (NSString)domain;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDomain:(id)a3;
@end

@implementation HKDeviceKeyValueStoreTaskConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(HKDeviceKeyValueStoreTaskConfiguration);
  v5 = (void *)[(NSString *)self->_domain copy];
  [(HKDeviceKeyValueStoreTaskConfiguration *)v4 setDomain:v5];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKDeviceKeyValueStoreTaskConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKDeviceKeyValueStoreTaskConfiguration;
  v5 = [(HKTaskConfiguration *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Domain"];
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKDeviceKeyValueStoreTaskConfiguration;
  id v4 = a3;
  [(HKTaskConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_domain, @"Domain", v5.receiver, v5.super_class);
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (void).cxx_destruct
{
}

@end