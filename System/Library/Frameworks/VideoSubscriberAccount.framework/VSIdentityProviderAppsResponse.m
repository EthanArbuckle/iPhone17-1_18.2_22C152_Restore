@interface VSIdentityProviderAppsResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)channelMappings;
- (NSArray)providerAppAdamIDs;
- (VSIdentityProviderAppsResponse)init;
- (VSIdentityProviderAppsResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setChannelMappings:(id)a3;
- (void)setProviderAppAdamIDs:(id)a3;
@end

@implementation VSIdentityProviderAppsResponse

- (VSIdentityProviderAppsResponse)init
{
  v5.receiver = self;
  v5.super_class = (Class)VSIdentityProviderAppsResponse;
  v2 = [(VSIdentityProviderAppsResponse *)&v5 init];
  if (v2)
  {
    v3 = VSIdentityProviderAppsResponseValueType();
    VSValueTypeInit(v3, v2);
  }
  return v2;
}

- (VSIdentityProviderAppsResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSIdentityProviderAppsResponse;
  objc_super v5 = [(VSIdentityProviderAppsResponse *)&v8 init];
  if (v5)
  {
    v6 = VSIdentityProviderAppsResponseValueType();
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
  VSIdentityProviderAppsResponseValueType();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder(v5, self, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = VSIdentityProviderAppsResponseValueType();
  v6 = VSValueTypeCopyWithZone(v5, self, (uint64_t)a3);

  return v6;
}

- (unint64_t)hash
{
  v3 = VSIdentityProviderAppsResponseValueType();
  unint64_t v4 = VSValueTypeHash(v3, self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = VSIdentityProviderAppsResponseValueType();
  LOBYTE(self) = VSValueTypeIsEqual(v5, self, v4);

  return (char)self;
}

- (id)description
{
  v3 = VSIdentityProviderAppsResponseValueType();
  id v4 = VSValueTypeDescription(v3, self);

  return v4;
}

- (NSArray)providerAppAdamIDs
{
  return self->_providerAppAdamIDs;
}

- (void)setProviderAppAdamIDs:(id)a3
{
}

- (NSArray)channelMappings
{
  return self->_channelMappings;
}

- (void)setChannelMappings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelMappings, 0);

  objc_storeStrong((id *)&self->_providerAppAdamIDs, 0);
}

@end