@interface VSAMSRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)parameters;
- (NSString)methodName;
- (NSString)providerIdentifier;
- (VSAMSRequest)init;
- (VSAMSRequest)initWithCoder:(id)a3;
- (VSAuditToken)auditToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)requestType;
- (void)encodeWithCoder:(id)a3;
- (void)setAuditToken:(id)a3;
- (void)setMethodName:(id)a3;
- (void)setParameters:(id)a3;
- (void)setProviderIdentifier:(id)a3;
- (void)setRequestType:(unint64_t)a3;
@end

@implementation VSAMSRequest

- (VSAMSRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)VSAMSRequest;
  v2 = [(VSAMSRequest *)&v5 init];
  if (v2)
  {
    v3 = VSAMSRequestValueType();
    VSValueTypeInit(v3, v2);
  }
  return v2;
}

- (VSAMSRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSAMSRequest;
  objc_super v5 = [(VSAMSRequest *)&v8 init];
  if (v5)
  {
    v6 = VSAMSRequestValueType();
    VSValueTypeInitWithCoder(v6, v5, v4);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  VSAMSRequestValueType();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder(v5, self, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = VSAMSRequestValueType();
  v6 = VSValueTypeCopyWithZone(v5, self, (uint64_t)a3);

  return v6;
}

- (unint64_t)hash
{
  v3 = VSAMSRequestValueType();
  unint64_t v4 = VSValueTypeHash(v3, self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = VSAMSRequestValueType();
  LOBYTE(self) = VSValueTypeIsEqual(v5, self, v4);

  return (char)self;
}

- (id)description
{
  v3 = VSAMSRequestValueType();
  id v4 = VSValueTypeDescription(v3, self);

  return v4;
}

- (NSString)methodName
{
  return self->_methodName;
}

- (void)setMethodName:(id)a3
{
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void)setProviderIdentifier:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (VSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);

  objc_storeStrong((id *)&self->_methodName, 0);
}

@end