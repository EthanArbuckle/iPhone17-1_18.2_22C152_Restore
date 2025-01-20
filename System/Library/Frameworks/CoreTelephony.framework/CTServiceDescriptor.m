@interface CTServiceDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)descriptorWithSubscriptionContext:(id)a3;
+ (id)telephonyDescriptorWithInstance:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CTServiceDescriptor)initWithCoder:(id)a3;
- (CTServiceDescriptor)initWithDomain:(int64_t)a3 instance:(id)a4;
- (NSNumber)instance;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)domain;
- (void)encodeWithCoder:(id)a3;
- (void)setDomain:(int64_t)a3;
- (void)setInstance:(id)a3;
@end

@implementation CTServiceDescriptor

- (NSNumber)instance
{
  return self->_instance;
}

- (int64_t)domain
{
  return self->_domain;
}

- (CTServiceDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTServiceDescriptor;
  v5 = [(CTServiceDescriptor *)&v9 init];
  if (v5)
  {
    v5->_domain = [v4 decodeIntegerForKey:@"domain"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"instance"];
    instance = v5->_instance;
    v5->_instance = (NSNumber *)v6;
  }
  return v5;
}

+ (id)descriptorWithSubscriptionContext:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "slotID"));
  uint64_t v6 = [a1 telephonyDescriptorWithInstance:v5];

  return v6;
}

+ (id)telephonyDescriptorWithInstance:(id)a3
{
  id v3 = a3;
  id v4 = [[CTServiceDescriptor alloc] initWithDomain:1 instance:v3];

  return v4;
}

- (CTServiceDescriptor)initWithDomain:(int64_t)a3 instance:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CTServiceDescriptor;
  v8 = [(CTServiceDescriptor *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    v8->_domain = a3;
    objc_storeStrong((id *)&v8->_instance, a4);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instance, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_domain forKey:@"domain"];
  [v4 encodeObject:self->_instance forKey:@"instance"];
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  int64_t v4 = [(CTServiceDescriptor *)self domain];
  v5 = [(CTServiceDescriptor *)self instance];
  [v3 appendFormat:@", domain=%ld, instance=%@>", v4, v5];

  return v3;
}

- (NSString)identifier
{
  identifier = self->_identifier;
  if (!identifier)
  {
    memset(&v11, 0, sizeof(v11));
    unsigned int __src = bswap32(self->_domain);
    unsigned int v9 = bswap32([(NSNumber *)self->_instance unsignedIntValue]);
    std::vector<unsigned char>::reserve(&v11, 8uLL);
    std::vector<unsigned char>::__insert_with_size[abi:nn180100]<unsigned char const*,unsigned char const*>((uint64_t)&v11, v11.__end_, (char *)&__src, (char *)&v11, 4);
    std::vector<unsigned char>::__insert_with_size[abi:nn180100]<unsigned char const*,unsigned char const*>((uint64_t)&v11, v11.__end_, (char *)&v9, (char *)&__src, 4);
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v8 = 0;
    ctu::hex();
    int64_t v4 = [NSString stringWithUTF8String:__p];
    v5 = self->_identifier;
    self->_identifier = v4;

    if (SHIBYTE(v8) < 0) {
      operator delete(__p[0]);
    }
    if (v11.__begin_)
    {
      v11.__end_ = v11.__begin_;
      operator delete(v11.__begin_);
    }
    identifier = self->_identifier;
  }

  return identifier;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (CTServiceDescriptor *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(CTServiceDescriptor *)self domain];
      if (v6 == [(CTServiceDescriptor *)v5 domain])
      {
        id v7 = [(CTServiceDescriptor *)self instance];
        uint64_t v8 = [(CTServiceDescriptor *)v5 instance];
        char v9 = [v7 isEqualToNumber:v8];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setDomain:self->_domain];
  v5 = (void *)[(NSNumber *)self->_instance copy];
  [v4 setInstance:v5];

  return v4;
}

- (void)setDomain:(int64_t)a3
{
  self->_domain = a3;
}

- (void)setInstance:(id)a3
{
}

@end