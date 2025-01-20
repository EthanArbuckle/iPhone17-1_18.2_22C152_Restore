@interface VSIdentityProvider
+ (BOOL)supportsSecureCoding;
- (BOOL)isApplication;
- (BOOL)isDeveloper;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFullySupportedForRequestsExpectingAuthenticationSchemes:(id)a3;
- (BOOL)isProhibitedByStore;
- (BOOL)isSTBOptOutAllowed;
- (BOOL)isSetTopBoxSupported;
- (BOOL)requireAuthenticationURLSystemTrust;
- (BOOL)requireXHRRequestSystemTrust;
- (BOOL)shouldShowChannelApps;
- (BOOL)shouldShowSubscriptionApps;
- (BOOL)supportsRequestsExpectingAuthenticationSchemes:(id)a3;
- (NSArray)allPersonalizedAppDescriptions;
- (NSArray)appAdamIDs;
- (NSArray)nonChannelAppDescriptions;
- (NSArray)storefronts;
- (NSArray)supportedAuthenticationSchemes;
- (NSArray)supportedTemplates;
- (NSNumber)appPlacementPosition;
- (NSNumber)rankForSorting;
- (NSString)defaultAppId;
- (NSString)nameForSorting;
- (NSString)providerAppArtworkTemplateURL;
- (NSString)providerArtworkTemplateURL;
- (NSString)userToken;
- (NSURL)appStoreRoomURL;
- (NSURL)authenticationURL;
- (VSIdentityProvider)init;
- (VSIdentityProvider)initWithApplicationProvider:(id)a3;
- (VSIdentityProvider)initWithCoder:(id)a3;
- (VSOptional)displayName;
- (VSOptional)providerID;
- (VSOptional)providerInfo;
- (VSOptional)uniqueID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAllPersonalizedAppDescriptions:(id)a3;
- (void)setAppAdamIDs:(id)a3;
- (void)setAppPlacementPosition:(id)a3;
- (void)setAppStoreRoomURL:(id)a3;
- (void)setApplication:(BOOL)a3;
- (void)setAuthenticationURL:(id)a3;
- (void)setDefaultAppId:(id)a3;
- (void)setDeveloper:(BOOL)a3;
- (void)setIsSTBOptOutAllowed:(BOOL)a3;
- (void)setIsSetTopBoxSupported:(BOOL)a3;
- (void)setNameForSorting:(id)a3;
- (void)setNonChannelAppDescriptions:(id)a3;
- (void)setProhibitedByStore:(BOOL)a3;
- (void)setProviderAppArtworkTemplateURL:(id)a3;
- (void)setProviderArtworkTemplateURL:(id)a3;
- (void)setProviderID:(id)a3;
- (void)setProviderInfo:(id)a3;
- (void)setRankForSorting:(id)a3;
- (void)setRequireAuthenticationURLSystemTrust:(BOOL)a3;
- (void)setRequireXHRRequestSystemTrust:(BOOL)a3;
- (void)setShouldShowChannelApps:(BOOL)a3;
- (void)setShouldShowSubscriptionApps:(BOOL)a3;
- (void)setStorefronts:(id)a3;
- (void)setSupportedAuthenticationSchemes:(id)a3;
- (void)setSupportedTemplates:(id)a3;
- (void)setUniqueID:(id)a3;
- (void)setUserToken:(id)a3;
@end

@implementation VSIdentityProvider

- (VSIdentityProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)VSIdentityProvider;
  v2 = [(VSIdentityProvider *)&v5 init];
  if (v2)
  {
    v3 = VSIdentityProviderValueType();
    VSValueTypeInit(v3, v2);
  }
  return v2;
}

- (VSIdentityProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSIdentityProvider;
  objc_super v5 = [(VSIdentityProvider *)&v8 init];
  if (v5)
  {
    v6 = VSIdentityProviderValueType();
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
  VSIdentityProviderValueType();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder(v5, self, v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = VSIdentityProviderValueType();
  v6 = VSValueTypeCopyWithZone(v5, self, (uint64_t)a3);

  return v6;
}

- (unint64_t)hash
{
  v3 = VSIdentityProviderValueType();
  unint64_t v4 = VSValueTypeHash(v3, self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = VSIdentityProviderValueType();
  LOBYTE(self) = VSValueTypeIsEqual(v5, self, v4);

  return (char)self;
}

- (id)description
{
  v3 = VSIdentityProviderValueType();
  id v4 = VSValueTypeDescription(v3, self);

  return v4;
}

- (VSIdentityProvider)initWithApplicationProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(VSIdentityProvider *)self init];
  if (v5)
  {
    v6 = VSIdentityProviderValueType();
    VSValueTypeInit(v6, v5);

    v5->_application = 1;
    v7 = [v4 identifier];
    uint64_t v8 = +[VSOptional optionalWithObject:v7];
    providerID = v5->_providerID;
    v5->_providerID = (VSOptional *)v8;

    uint64_t v10 = [v4 localizedDisplayName];
    nameForSorting = v5->_nameForSorting;
    v5->_nameForSorting = (NSString *)v10;

    supportedAuthenticationSchemes = v5->_supportedAuthenticationSchemes;
    v5->_supportedAuthenticationSchemes = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (void)setNameForSorting:(id)a3
{
  if (self->_nameForSorting != a3)
  {
    id v4 = a3;
    [(VSIdentityProvider *)self willChangeValueForKey:@"displayName"];
    id v5 = (NSString *)[v4 copy];

    nameForSorting = self->_nameForSorting;
    self->_nameForSorting = v5;

    displayName = self->_displayName;
    self->_displayName = 0;

    [(VSIdentityProvider *)self didChangeValueForKey:@"displayName"];
  }
}

- (void)setDeveloper:(BOOL)a3
{
  if (self->_developer != a3)
  {
    [(VSIdentityProvider *)self willChangeValueForKey:@"displayName"];
    self->_developer = a3;
    displayName = self->_displayName;
    self->_displayName = 0;

    [(VSIdentityProvider *)self didChangeValueForKey:@"displayName"];
  }
}

- (VSOptional)displayName
{
  p_displayName = &self->_displayName;
  id v4 = self->_displayName;
  if (!v4)
  {
    id v5 = [(VSIdentityProvider *)self nameForSorting];
    if (v5)
    {
      if ([(VSIdentityProvider *)self isDeveloper])
      {
        v6 = [@"🚧 " stringByAppendingString:v5];
        id v4 = (NSString *)[v6 copy];
      }
      else
      {
        id v4 = (NSString *)[v5 copy];
      }
    }
    else
    {
      id v4 = 0;
    }
    objc_storeStrong((id *)p_displayName, v4);
  }
  v7 = +[VSOptional optionalWithObject:v4];

  return (VSOptional *)v7;
}

- (NSArray)supportedTemplates
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_supportedTemplates;
  if (!v3)
  {
    v5[0] = @"authenticationTemplate";
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
    objc_storeStrong((id *)&v2->_supportedTemplates, v3);
  }
  objc_sync_exit(v2);

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The __orNil parameter must not be nil."];
  }

  return v3;
}

- (NSArray)supportedAuthenticationSchemes
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_supportedAuthenticationSchemes;
  if (!v3)
  {
    v5[0] = @"SAML";
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
    objc_storeStrong((id *)&v2->_supportedAuthenticationSchemes, v3);
  }
  objc_sync_exit(v2);

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The __orNil parameter must not be nil."];
  }

  return v3;
}

- (BOOL)supportsRequestsExpectingAuthenticationSchemes:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [(VSIdentityProvider *)self supportedAuthenticationSchemes];
  uint64_t v8 = (void *)[v6 initWithArray:v7];

  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v5];
  LOBYTE(v5) = [v8 intersectsSet:v9];

  return (char)v5;
}

- (BOOL)isFullySupportedForRequestsExpectingAuthenticationSchemes:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(VSIdentityProvider *)self isProhibitedByStore])
  {
    id v5 = VSDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[VSIdentityProvider isFullySupportedForRequestsExpectingAuthenticationSchemes:]";
      id v6 = "%s: prohibited by store";
LABEL_9:
      _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v4
    && ![(VSIdentityProvider *)self supportsRequestsExpectingAuthenticationSchemes:v4])
  {
    id v5 = VSDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[VSIdentityProvider isFullySupportedForRequestsExpectingAuthenticationSchemes:]";
      id v6 = "%s: does not support expected auth schemes";
      goto LABEL_9;
    }
LABEL_10:

    BOOL v7 = 0;
    goto LABEL_11;
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (VSOptional)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (VSOptional)providerID
{
  return self->_providerID;
}

- (void)setProviderID:(id)a3
{
}

- (VSOptional)providerInfo
{
  return self->_providerInfo;
}

- (void)setProviderInfo:(id)a3
{
}

- (NSString)nameForSorting
{
  return self->_nameForSorting;
}

- (NSNumber)rankForSorting
{
  return self->_rankForSorting;
}

- (void)setRankForSorting:(id)a3
{
}

- (void)setSupportedTemplates:(id)a3
{
}

- (void)setSupportedAuthenticationSchemes:(id)a3
{
}

- (BOOL)requireAuthenticationURLSystemTrust
{
  return self->_requireAuthenticationURLSystemTrust;
}

- (void)setRequireAuthenticationURLSystemTrust:(BOOL)a3
{
  self->_requireAuthenticationURLSystemTrust = a3;
}

- (BOOL)requireXHRRequestSystemTrust
{
  return self->_requireXHRRequestSystemTrust;
}

- (void)setRequireXHRRequestSystemTrust:(BOOL)a3
{
  self->_requireXHRRequestSystemTrust = a3;
}

- (BOOL)isProhibitedByStore
{
  return self->_prohibitedByStore;
}

- (void)setProhibitedByStore:(BOOL)a3
{
  self->_prohibitedByStore = a3;
}

- (BOOL)isDeveloper
{
  return self->_developer;
}

- (BOOL)isApplication
{
  return self->_application;
}

- (void)setApplication:(BOOL)a3
{
  self->_application = a3;
}

- (NSURL)authenticationURL
{
  return self->_authenticationURL;
}

- (void)setAuthenticationURL:(id)a3
{
}

- (NSURL)appStoreRoomURL
{
  return self->_appStoreRoomURL;
}

- (void)setAppStoreRoomURL:(id)a3
{
}

- (NSArray)appAdamIDs
{
  return self->_appAdamIDs;
}

- (void)setAppAdamIDs:(id)a3
{
}

- (NSString)defaultAppId
{
  return self->_defaultAppId;
}

- (void)setDefaultAppId:(id)a3
{
}

- (NSString)providerArtworkTemplateURL
{
  return self->_providerArtworkTemplateURL;
}

- (void)setProviderArtworkTemplateURL:(id)a3
{
}

- (BOOL)isSetTopBoxSupported
{
  return self->_isSetTopBoxSupported;
}

- (void)setIsSetTopBoxSupported:(BOOL)a3
{
  self->_isSetTopBoxSupported = a3;
}

- (BOOL)shouldShowChannelApps
{
  return self->_shouldShowChannelApps;
}

- (void)setShouldShowChannelApps:(BOOL)a3
{
  self->_shouldShowChannelApps = a3;
}

- (BOOL)shouldShowSubscriptionApps
{
  return self->_shouldShowSubscriptionApps;
}

- (void)setShouldShowSubscriptionApps:(BOOL)a3
{
  self->_shouldShowSubscriptionApps = a3;
}

- (BOOL)isSTBOptOutAllowed
{
  return self->_isSTBOptOutAllowed;
}

- (void)setIsSTBOptOutAllowed:(BOOL)a3
{
  self->_isSTBOptOutAllowed = a3;
}

- (NSString)providerAppArtworkTemplateURL
{
  return self->_providerAppArtworkTemplateURL;
}

- (void)setProviderAppArtworkTemplateURL:(id)a3
{
}

- (NSNumber)appPlacementPosition
{
  return self->_appPlacementPosition;
}

- (void)setAppPlacementPosition:(id)a3
{
}

- (NSString)userToken
{
  return self->_userToken;
}

- (void)setUserToken:(id)a3
{
}

- (NSArray)allPersonalizedAppDescriptions
{
  return self->_allPersonalizedAppDescriptions;
}

- (void)setAllPersonalizedAppDescriptions:(id)a3
{
}

- (NSArray)nonChannelAppDescriptions
{
  return self->_nonChannelAppDescriptions;
}

- (void)setNonChannelAppDescriptions:(id)a3
{
}

- (NSArray)storefronts
{
  return self->_storefronts;
}

- (void)setStorefronts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefronts, 0);
  objc_storeStrong((id *)&self->_nonChannelAppDescriptions, 0);
  objc_storeStrong((id *)&self->_allPersonalizedAppDescriptions, 0);
  objc_storeStrong((id *)&self->_userToken, 0);
  objc_storeStrong((id *)&self->_appPlacementPosition, 0);
  objc_storeStrong((id *)&self->_providerAppArtworkTemplateURL, 0);
  objc_storeStrong((id *)&self->_providerArtworkTemplateURL, 0);
  objc_storeStrong((id *)&self->_defaultAppId, 0);
  objc_storeStrong((id *)&self->_appAdamIDs, 0);
  objc_storeStrong((id *)&self->_appStoreRoomURL, 0);
  objc_storeStrong((id *)&self->_authenticationURL, 0);
  objc_storeStrong((id *)&self->_supportedAuthenticationSchemes, 0);
  objc_storeStrong((id *)&self->_supportedTemplates, 0);
  objc_storeStrong((id *)&self->_rankForSorting, 0);
  objc_storeStrong((id *)&self->_nameForSorting, 0);
  objc_storeStrong((id *)&self->_providerInfo, 0);
  objc_storeStrong((id *)&self->_providerID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end