@interface FPXServiceDescriptor
+ (BOOL)supportsSecureCoding;
- (FPXServiceDescriptor)initWithCoder:(id)a3;
- (NSString)requiredEntitlement;
- (NSString)serviceName;
- (void)encodeWithCoder:(id)a3;
- (void)setRequiredEntitlement:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation FPXServiceDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  serviceName = self->_serviceName;
  id v5 = a3;
  [v5 encodeObject:serviceName forKey:@"_serviceName"];
  [v5 encodeObject:self->_requiredEntitlement forKey:@"_requiredEntitlement"];
}

- (FPXServiceDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPXServiceDescriptor;
  id v5 = [(FPXServiceDescriptor *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serviceName"];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_requiredEntitlement"];
    requiredEntitlement = v5->_requiredEntitlement;
    v5->_requiredEntitlement = (NSString *)v8;
  }
  return v5;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)requiredEntitlement
{
  return self->_requiredEntitlement;
}

- (void)setRequiredEntitlement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredEntitlement, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end