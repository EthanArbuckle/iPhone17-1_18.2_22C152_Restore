@interface VSAccountMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)verificationData;
- (NSDate)authenticationExpirationDate;
- (NSString)SAMLAttributeQueryResponse;
- (NSString)accountProviderIdentifier;
- (VSAccountMetadata)init;
- (VSAccountMetadata)initWithCoder:(id)a3;
- (VSAccountProviderResponse)accountProviderResponse;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountProviderIdentifier:(id)a3;
- (void)setAccountProviderResponse:(id)a3;
- (void)setAuthenticationExpirationDate:(id)a3;
- (void)setVerificationData:(id)a3;
@end

@implementation VSAccountMetadata

- (VSAccountMetadata)init
{
  v5.receiver = self;
  v5.super_class = (Class)VSAccountMetadata;
  v2 = [(VSAccountMetadata *)&v5 init];
  if (v2)
  {
    v3 = VSAccountMetadataValueType();
    VSValueTypeInit(v3, v2);
  }
  return v2;
}

- (VSAccountMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSAccountMetadata;
  objc_super v5 = [(VSAccountMetadata *)&v8 init];
  if (v5)
  {
    v6 = VSAccountMetadataValueType();
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
  VSAccountMetadataValueType();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder(v5, self, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = VSAccountMetadataValueType();
  v6 = VSValueTypeCopyWithZone(v5, self, (uint64_t)a3);

  return v6;
}

- (unint64_t)hash
{
  v3 = VSAccountMetadataValueType();
  unint64_t v4 = VSValueTypeHash(v3, self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = VSAccountMetadataValueType();
  LOBYTE(self) = VSValueTypeIsEqual(v5, self, v4);

  return (char)self;
}

- (id)description
{
  v3 = VSAccountMetadataValueType();
  id v4 = VSValueTypeDescription(v3, self);

  return v4;
}

- (NSString)SAMLAttributeQueryResponse
{
  v2 = [(VSAccountMetadata *)self accountProviderResponse];
  v3 = [v2 authenticationScheme];
  int v4 = [v3 isEqual:@"SAML"];

  if (v4)
  {
    id v5 = [v2 body];
  }
  else
  {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)accountProviderIdentifier
{
  return self->_accountProviderIdentifier;
}

- (void)setAccountProviderIdentifier:(id)a3
{
}

- (NSDate)authenticationExpirationDate
{
  return self->_authenticationExpirationDate;
}

- (void)setAuthenticationExpirationDate:(id)a3
{
}

- (NSData)verificationData
{
  return self->_verificationData;
}

- (void)setVerificationData:(id)a3
{
}

- (VSAccountProviderResponse)accountProviderResponse
{
  return self->_accountProviderResponse;
}

- (void)setAccountProviderResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountProviderResponse, 0);
  objc_storeStrong((id *)&self->_verificationData, 0);
  objc_storeStrong((id *)&self->_authenticationExpirationDate, 0);

  objc_storeStrong((id *)&self->_accountProviderIdentifier, 0);
}

@end