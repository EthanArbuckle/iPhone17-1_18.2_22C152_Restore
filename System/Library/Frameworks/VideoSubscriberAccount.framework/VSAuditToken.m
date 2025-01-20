@interface VSAuditToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)tokenBytes;
- (NSString)bundleIdentifier;
- (VSAuditToken)init;
- (VSAuditToken)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setTokenBytes:(id)a3;
@end

@implementation VSAuditToken

- (VSAuditToken)init
{
  v5.receiver = self;
  v5.super_class = (Class)VSAuditToken;
  v2 = [(VSAuditToken *)&v5 init];
  if (v2)
  {
    v3 = VSAuditTokenValueType();
    VSValueTypeInit(v3, v2);
  }
  return v2;
}

- (VSAuditToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSAuditToken;
  objc_super v5 = [(VSAuditToken *)&v8 init];
  if (v5)
  {
    v6 = VSAuditTokenValueType();
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
  VSAuditTokenValueType();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder(v5, self, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = VSAuditTokenValueType();
  v6 = VSValueTypeCopyWithZone(v5, self, (uint64_t)a3);

  return v6;
}

- (unint64_t)hash
{
  v3 = VSAuditTokenValueType();
  unint64_t v4 = VSValueTypeHash(v3, self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = VSAuditTokenValueType();
  LOBYTE(self) = VSValueTypeIsEqual(v5, self, v4);

  return (char)self;
}

- (id)description
{
  v3 = VSAuditTokenValueType();
  id v4 = VSValueTypeDescription(v3, self);

  return v4;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSData)tokenBytes
{
  return self->_tokenBytes;
}

- (void)setTokenBytes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenBytes, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end