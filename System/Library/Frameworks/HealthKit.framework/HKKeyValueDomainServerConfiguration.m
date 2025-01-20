@interface HKKeyValueDomainServerConfiguration
+ (BOOL)supportsSecureCoding;
- (HKKeyValueDomainServerConfiguration)initWithCategory:(int64_t)a3 domainName:(id)a4;
- (HKKeyValueDomainServerConfiguration)initWithCoder:(id)a3;
- (NSString)domainName;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)category;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKKeyValueDomainServerConfiguration

- (HKKeyValueDomainServerConfiguration)initWithCategory:(int64_t)a3 domainName:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKKeyValueDomainServerConfiguration;
  v7 = [(HKKeyValueDomainServerConfiguration *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_category = a3;
    uint64_t v9 = [v6 copy];
    domainName = v8->_domainName;
    v8->_domainName = (NSString *)v9;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[1] = [(HKKeyValueDomainServerConfiguration *)self category];
  v5 = [(HKKeyValueDomainServerConfiguration *)self domainName];
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[2];
  v4[2] = v6;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKKeyValueDomainServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKKeyValueDomainServerConfiguration;
  v5 = [(HKTaskConfiguration *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_category = [v4 decodeIntegerForKey:@"Category"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DomainName"];
    domainName = v5->_domainName;
    v5->_domainName = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKKeyValueDomainServerConfiguration;
  id v4 = a3;
  [(HKTaskConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_category, @"Category", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_domainName forKey:@"DomainName"];
}

- (int64_t)category
{
  return self->_category;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void).cxx_destruct
{
}

@end