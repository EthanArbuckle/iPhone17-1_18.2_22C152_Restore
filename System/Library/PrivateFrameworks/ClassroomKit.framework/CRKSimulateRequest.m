@interface CRKSimulateRequest
+ (BOOL)supportsSecureCoding;
- (CRKIDSLocalSimulationConfiguration)IDSLocalConfiguration;
- (CRKSimulateRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIDSLocalConfiguration:(id)a3;
@end

@implementation CRKSimulateRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKSimulateRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = [(CRKSimulateRequest *)self IDSLocalConfiguration];
  [v4 encodeObject:v5 forKey:@"IDSLocalConfiguration"];
}

- (CRKSimulateRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKSimulateRequest;
  v5 = [(CATTaskRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"IDSLocalConfiguration"];
    IDSLocalConfiguration = v5->_IDSLocalConfiguration;
    v5->_IDSLocalConfiguration = (CRKIDSLocalSimulationConfiguration *)v7;
  }
  return v5;
}

- (CRKIDSLocalSimulationConfiguration)IDSLocalConfiguration
{
  return self->_IDSLocalConfiguration;
}

- (void)setIDSLocalConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end