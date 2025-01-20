@interface VSAccountProviderResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)body;
- (NSString)status;
- (VSAccountProviderAuthenticationScheme)authenticationScheme;
- (VSAccountProviderResponse)init;
- (VSAccountProviderResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthenticationScheme:(id)a3;
- (void)setBody:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation VSAccountProviderResponse

- (VSAccountProviderResponse)init
{
  v5.receiver = self;
  v5.super_class = (Class)VSAccountProviderResponse;
  v2 = [(VSAccountProviderResponse *)&v5 init];
  if (v2)
  {
    v3 = VSAccountProviderResponseValueType();
    VSValueTypeInit(v3, v2);
  }
  return v2;
}

- (VSAccountProviderResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSAccountProviderResponse;
  objc_super v5 = [(VSAccountProviderResponse *)&v8 init];
  if (v5)
  {
    v6 = VSAccountProviderResponseValueType();
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
  VSAccountProviderResponseValueType();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder(v5, self, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = VSAccountProviderResponseValueType();
  v6 = VSValueTypeCopyWithZone(v5, self, (uint64_t)a3);

  return v6;
}

- (unint64_t)hash
{
  v3 = VSAccountProviderResponseValueType();
  unint64_t v4 = VSValueTypeHash(v3, self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = VSAccountProviderResponseValueType();
  LOBYTE(self) = VSValueTypeIsEqual(v5, self, v4);

  return (char)self;
}

- (id)description
{
  v3 = VSAccountProviderResponseValueType();
  id v4 = VSValueTypeDescription(v3, self);

  return v4;
}

- (VSAccountProviderAuthenticationScheme)authenticationScheme
{
  return self->_authenticationScheme;
}

- (void)setAuthenticationScheme:(id)a3
{
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_status, 0);

  objc_storeStrong((id *)&self->_authenticationScheme, 0);
}

@end