@interface GTProcessService
+ (BOOL)supportsSecureCoding;
- (GTProcessInfo)processInfo;
- (GTProcessService)initWithCoder:(id)a3;
- (GTProcessService)initWithService:(id)a3 processInfo:(id)a4;
- (GTServiceProperties)serviceProperties;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setProcessInfo:(id)a3;
- (void)setServiceProperties:(id)a3;
@end

@implementation GTProcessService

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTProcessService)initWithService:(id)a3 processInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GTProcessService;
  v9 = [(GTProcessService *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceProperties, a3);
    objc_storeStrong((id *)&v10->_processInfo, a4);
  }

  return v10;
}

- (GTProcessService)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GTProcessService;
  v5 = [(GTProcessService *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceProperties"];
    serviceProperties = v5->_serviceProperties;
    v5->_serviceProperties = (GTServiceProperties *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"processInfo"];
    processInfo = v5->_processInfo;
    v5->_processInfo = (GTProcessInfo *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  serviceProperties = self->_serviceProperties;
  id v5 = a3;
  [v5 encodeObject:serviceProperties forKey:@"serviceProperties"];
  [v5 encodeObject:self->_processInfo forKey:@"processInfo"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(GTProcessService);
  [(GTProcessService *)v4 setServiceProperties:self->_serviceProperties];
  [(GTProcessService *)v4 setProcessInfo:self->_processInfo];
  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: serviceProperties=%@ processInfo=%@>", objc_opt_class(), self->_serviceProperties, self->_processInfo];
}

- (GTServiceProperties)serviceProperties
{
  return self->_serviceProperties;
}

- (void)setServiceProperties:(id)a3
{
}

- (GTProcessInfo)processInfo
{
  return self->_processInfo;
}

- (void)setProcessInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_serviceProperties, 0);
}

@end