@interface VSViewServiceRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsAuthenticationUI;
- (BOOL)allowsPrivacyUI;
- (BOOL)canVetoAuthentication;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPreAuthRequest;
- (BOOL)requiresPrivacyUI;
- (BOOL)shouldInferFeaturedProviders;
- (BOOL)shouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront;
- (NSArray)applicationAccountProviders;
- (NSArray)featuredIdentityProviderIdentifiers;
- (NSArray)supportedAccountProviderAuthenticationSchemes;
- (NSArray)supportedIdentityProviderIdentifiers;
- (NSString)accountProviderAuthenticationToken;
- (NSString)localizedVideoTitle;
- (NSString)requestingAppAdamID;
- (VSAccountMetadataRequest)accountMetadataRequest;
- (VSOptional)requestingAppDisplayName;
- (VSViewServiceRequest)init;
- (VSViewServiceRequest)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountMetadataRequest:(id)a3;
- (void)setAllowsPrivacyUI:(BOOL)a3;
- (void)setCanVetoAuthentication:(BOOL)a3;
- (void)setRequestingAppAdamID:(id)a3;
- (void)setRequestingAppDisplayName:(id)a3;
- (void)setRequiresPrivacyUI:(BOOL)a3;
- (void)setShouldInferFeaturedProviders:(BOOL)a3;
- (void)setShouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront:(BOOL)a3;
@end

@implementation VSViewServiceRequest

- (VSViewServiceRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)VSViewServiceRequest;
  v2 = [(VSViewServiceRequest *)&v5 init];
  if (v2)
  {
    v3 = VSViewServiceRequestValueType();
    VSValueTypeInit(v3, v2);
  }
  return v2;
}

- (VSViewServiceRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSViewServiceRequest;
  objc_super v5 = [(VSViewServiceRequest *)&v8 init];
  if (v5)
  {
    v6 = VSViewServiceRequestValueType();
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
  VSViewServiceRequestValueType();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder(v5, self, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = VSViewServiceRequestValueType();
  v6 = VSValueTypeCopyWithZone(v5, self, (uint64_t)a3);

  return v6;
}

- (unint64_t)hash
{
  v3 = VSViewServiceRequestValueType();
  unint64_t v4 = VSValueTypeHash(v3, self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = VSViewServiceRequestValueType();
  LOBYTE(self) = VSValueTypeIsEqual(v5, self, v4);

  return (char)self;
}

- (id)description
{
  v3 = VSViewServiceRequestValueType();
  id v4 = VSValueTypeDescription(v3, self);

  return v4;
}

- (BOOL)allowsAuthenticationUI
{
  v2 = [(VSViewServiceRequest *)self accountMetadataRequest];
  char v3 = [v2 isInterruptionAllowed];

  return v3;
}

- (NSArray)supportedIdentityProviderIdentifiers
{
  v2 = [(VSViewServiceRequest *)self accountMetadataRequest];
  char v3 = v2;
  if (v2)
  {
    id v4 = [v2 supportedAccountProviderIdentifiers];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

- (NSArray)featuredIdentityProviderIdentifiers
{
  v2 = [(VSViewServiceRequest *)self accountMetadataRequest];
  char v3 = v2;
  if (v2)
  {
    id v4 = [v2 featuredAccountProviderIdentifiers];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

- (NSArray)applicationAccountProviders
{
  v2 = [(VSViewServiceRequest *)self accountMetadataRequest];
  char v3 = v2;
  if (v2)
  {
    id v4 = [v2 applicationAccountProviders];
    id v5 = v4;
    if (v4) {
      id v6 = v4;
    }
    else {
      id v6 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v6;
}

- (NSArray)supportedAccountProviderAuthenticationSchemes
{
  v2 = [(VSViewServiceRequest *)self accountMetadataRequest];
  char v3 = v2;
  if (v2)
  {
    id v4 = [v2 supportedAuthenticationSchemes];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

- (NSString)localizedVideoTitle
{
  v2 = [(VSViewServiceRequest *)self accountMetadataRequest];
  char v3 = v2;
  if (v2)
  {
    id v4 = [v2 localizedVideoTitle];
  }
  else
  {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)accountProviderAuthenticationToken
{
  v2 = [(VSViewServiceRequest *)self accountMetadataRequest];
  char v3 = v2;
  if (v2)
  {
    id v4 = [v2 accountProviderAuthenticationToken];
  }
  else
  {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (BOOL)isPreAuthRequest
{
  v2 = [(VSViewServiceRequest *)self accountMetadataRequest];
  char v3 = [v2 accountProviderAuthenticationToken];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)allowsPrivacyUI
{
  return self->_allowsPrivacyUI;
}

- (void)setAllowsPrivacyUI:(BOOL)a3
{
  self->_allowsPrivacyUI = a3;
}

- (BOOL)requiresPrivacyUI
{
  return self->_requiresPrivacyUI;
}

- (void)setRequiresPrivacyUI:(BOOL)a3
{
  self->_requiresPrivacyUI = a3;
}

- (BOOL)canVetoAuthentication
{
  return self->_canVetoAuthentication;
}

- (void)setCanVetoAuthentication:(BOOL)a3
{
  self->_canVetoAuthentication = a3;
}

- (VSAccountMetadataRequest)accountMetadataRequest
{
  return self->_accountMetadataRequest;
}

- (void)setAccountMetadataRequest:(id)a3
{
}

- (BOOL)shouldInferFeaturedProviders
{
  return self->_shouldInferFeaturedProviders;
}

- (void)setShouldInferFeaturedProviders:(BOOL)a3
{
  self->_shouldInferFeaturedProviders = a3;
}

- (BOOL)shouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront
{
  return self->_shouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront;
}

- (void)setShouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront:(BOOL)a3
{
  self->_shouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront = a3;
}

- (VSOptional)requestingAppDisplayName
{
  return self->_requestingAppDisplayName;
}

- (void)setRequestingAppDisplayName:(id)a3
{
}

- (NSString)requestingAppAdamID
{
  return self->_requestingAppAdamID;
}

- (void)setRequestingAppAdamID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingAppAdamID, 0);
  objc_storeStrong((id *)&self->_requestingAppDisplayName, 0);

  objc_storeStrong((id *)&self->_accountMetadataRequest, 0);
}

@end