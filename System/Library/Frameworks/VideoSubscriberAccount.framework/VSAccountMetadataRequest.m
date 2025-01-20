@interface VSAccountMetadataRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)forceAuthentication;
- (BOOL)includeAccountProviderIdentifier;
- (BOOL)includeAuthenticationExpirationDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInterruptionAllowed;
- (NSArray)applicationAccountProviders;
- (NSArray)attributeNames;
- (NSArray)featuredAccountProviderIdentifiers;
- (NSArray)supportedAccountProviderIdentifiers;
- (NSArray)supportedAuthenticationSchemes;
- (NSString)accountProviderAuthenticationToken;
- (NSString)channelIdentifier;
- (NSString)localizedVideoTitle;
- (NSString)verificationToken;
- (VSAccountMetadataRequest)init;
- (VSAccountMetadataRequest)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountProviderAuthenticationToken:(NSString *)accountProviderAuthenticationToken;
- (void)setApplicationAccountProviders:(NSArray *)applicationAccountProviders;
- (void)setAttributeNames:(NSArray *)attributeNames;
- (void)setChannelIdentifier:(NSString *)channelIdentifier;
- (void)setFeaturedAccountProviderIdentifiers:(NSArray *)featuredAccountProviderIdentifiers;
- (void)setForceAuthentication:(BOOL)forceAuthentication;
- (void)setIncludeAccountProviderIdentifier:(BOOL)includeAccountProviderIdentifier;
- (void)setIncludeAuthenticationExpirationDate:(BOOL)includeAuthenticationExpirationDate;
- (void)setInterruptionAllowed:(BOOL)interruptionAllowed;
- (void)setLocalizedVideoTitle:(NSString *)localizedVideoTitle;
- (void)setSupportedAccountProviderIdentifiers:(NSArray *)supportedAccountProviderIdentifiers;
- (void)setSupportedAuthenticationSchemes:(NSArray *)supportedAuthenticationSchemes;
- (void)setVerificationToken:(NSString *)verificationToken;
@end

@implementation VSAccountMetadataRequest

- (VSAccountMetadataRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)VSAccountMetadataRequest;
  v2 = [(VSAccountMetadataRequest *)&v5 init];
  if (v2)
  {
    v3 = VSAccountMetadataRequestValueType();
    VSValueTypeInit(v3, v2);
  }
  return v2;
}

- (VSAccountMetadataRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSAccountMetadataRequest;
  objc_super v5 = [(VSAccountMetadataRequest *)&v8 init];
  if (v5)
  {
    v6 = VSAccountMetadataRequestValueType();
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
  VSAccountMetadataRequestValueType();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder(v5, self, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = VSAccountMetadataRequestValueType();
  v6 = VSValueTypeCopyWithZone(v5, self, (uint64_t)a3);

  return v6;
}

- (unint64_t)hash
{
  v3 = VSAccountMetadataRequestValueType();
  unint64_t v4 = VSValueTypeHash(v3, self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = VSAccountMetadataRequestValueType();
  LOBYTE(self) = VSValueTypeIsEqual(v5, self, v4);

  return (char)self;
}

- (id)description
{
  v3 = VSAccountMetadataRequestValueType();
  id v4 = VSValueTypeDescription(v3, self);

  return v4;
}

- (void)setAttributeNames:(NSArray *)attributeNames
{
  id v4 = attributeNames;
  v7 = v4;
  if (!v4)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The attributeNames parameter must not be nil."];
    id v4 = 0;
  }
  if (self->_attributeNames != v4)
  {
    id v5 = (NSArray *)[(NSArray *)v7 copy];
    v6 = self->_attributeNames;
    self->_attributeNames = v5;

    id v4 = v7;
  }
}

- (void)setSupportedAccountProviderIdentifiers:(NSArray *)supportedAccountProviderIdentifiers
{
  id v4 = supportedAccountProviderIdentifiers;
  v7 = v4;
  if (!v4)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The supportedAccountProviderIdentifiers parameter must not be nil."];
    id v4 = 0;
  }
  if (self->_supportedAccountProviderIdentifiers != v4)
  {
    id v5 = (NSArray *)[(NSArray *)v7 copy];
    v6 = self->_supportedAccountProviderIdentifiers;
    self->_supportedAccountProviderIdentifiers = v5;

    id v4 = v7;
  }
}

- (void)setFeaturedAccountProviderIdentifiers:(NSArray *)featuredAccountProviderIdentifiers
{
  id v4 = featuredAccountProviderIdentifiers;
  v7 = v4;
  if (!v4)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The featuredAccountProviderIdentifiers parameter must not be nil."];
    id v4 = 0;
  }
  if (self->_featuredAccountProviderIdentifiers != v4)
  {
    id v5 = (NSArray *)[(NSArray *)v7 copy];
    v6 = self->_featuredAccountProviderIdentifiers;
    self->_featuredAccountProviderIdentifiers = v5;

    id v4 = v7;
  }
}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (void)setChannelIdentifier:(NSString *)channelIdentifier
{
}

- (NSArray)supportedAccountProviderIdentifiers
{
  return self->_supportedAccountProviderIdentifiers;
}

- (NSArray)featuredAccountProviderIdentifiers
{
  return self->_featuredAccountProviderIdentifiers;
}

- (NSString)verificationToken
{
  return self->_verificationToken;
}

- (void)setVerificationToken:(NSString *)verificationToken
{
}

- (BOOL)includeAccountProviderIdentifier
{
  return self->_includeAccountProviderIdentifier;
}

- (void)setIncludeAccountProviderIdentifier:(BOOL)includeAccountProviderIdentifier
{
  self->_includeAccountProviderIdentifier = includeAccountProviderIdentifier;
}

- (BOOL)includeAuthenticationExpirationDate
{
  return self->_includeAuthenticationExpirationDate;
}

- (void)setIncludeAuthenticationExpirationDate:(BOOL)includeAuthenticationExpirationDate
{
  self->_includeAuthenticationExpirationDate = includeAuthenticationExpirationDate;
}

- (NSString)localizedVideoTitle
{
  return self->_localizedVideoTitle;
}

- (void)setLocalizedVideoTitle:(NSString *)localizedVideoTitle
{
}

- (BOOL)isInterruptionAllowed
{
  return self->_interruptionAllowed;
}

- (void)setInterruptionAllowed:(BOOL)interruptionAllowed
{
  self->_interruptionAllowed = interruptionAllowed;
}

- (BOOL)forceAuthentication
{
  return self->_forceAuthentication;
}

- (void)setForceAuthentication:(BOOL)forceAuthentication
{
  self->_forceAuthentication = forceAuthentication;
}

- (NSArray)attributeNames
{
  return self->_attributeNames;
}

- (NSArray)supportedAuthenticationSchemes
{
  return self->_supportedAuthenticationSchemes;
}

- (void)setSupportedAuthenticationSchemes:(NSArray *)supportedAuthenticationSchemes
{
}

- (NSString)accountProviderAuthenticationToken
{
  return self->_accountProviderAuthenticationToken;
}

- (void)setAccountProviderAuthenticationToken:(NSString *)accountProviderAuthenticationToken
{
}

- (NSArray)applicationAccountProviders
{
  return self->_applicationAccountProviders;
}

- (void)setApplicationAccountProviders:(NSArray *)applicationAccountProviders
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationAccountProviders, 0);
  objc_storeStrong((id *)&self->_accountProviderAuthenticationToken, 0);
  objc_storeStrong((id *)&self->_supportedAuthenticationSchemes, 0);
  objc_storeStrong((id *)&self->_attributeNames, 0);
  objc_storeStrong((id *)&self->_localizedVideoTitle, 0);
  objc_storeStrong((id *)&self->_verificationToken, 0);
  objc_storeStrong((id *)&self->_featuredAccountProviderIdentifiers, 0);
  objc_storeStrong((id *)&self->_supportedAccountProviderIdentifiers, 0);

  objc_storeStrong((id *)&self->_channelIdentifier, 0);
}

@end