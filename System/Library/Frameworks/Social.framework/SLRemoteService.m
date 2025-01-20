@interface SLRemoteService
+ (BOOL)supportsSecureCoding;
+ (id)_cachedServiceWithType:(id)a3;
+ (id)_cachedServices;
+ (id)remoteServiceForTypeIdentifier:(id)a3;
+ (id)remoteServices;
- (BOOL)_isSupportedURL:(id)a3 withSupportedSchemes:(id)a4;
- (BOOL)_isValidAuthenicationStyleIdentifier:(id)a3;
- (BOOL)addDeviceClassToRequest;
- (BOOL)infoDictHasRequiredKeys:(id)a3;
- (BOOL)isFirstClassService;
- (BOOL)serviceRegionTargetIsChina;
- (BOOL)supportsImageURL:(id)a3;
- (BOOL)supportsVideoURL:(id)a3;
- (NSBundle)serviceBundle;
- (NSSet)supportedImageAssetURLSchemes;
- (NSSet)supportedVideoAssetURLSchemes;
- (NSString)accountTypeIdentifier;
- (NSString)activityImageName;
- (NSString)activityViewIconResourceName;
- (NSString)localizedServiceName;
- (NSString)serviceTypeIdentifier;
- (NSURL)serviceBundleURL;
- (SLRemoteService)initWithCoder:(id)a3;
- (SLRemoteService)initWithServiceBundle:(id)a3 socialInfoDictionary:(id)a4;
- (id)_activityImageForImageResourceName:(id)a3 inBundle:(id)a4;
- (id)_authenticationStyleIdentifierMappings;
- (id)_encodableStringProperties;
- (id)_requiredInfoDictKeys;
- (id)_setFromArrayWithKey:(id)a3 inDictionary:(id)a4;
- (id)activityImage;
- (id)composeViewController;
- (id)description;
- (id)integerPropertyKeyMappings;
- (int64_t)_authenticationStyleFromAuthenticationStyleIdentifier:(id)a3;
- (int64_t)authenticationStyle;
- (int64_t)maximumImageCount;
- (int64_t)maximumImageDataSize;
- (int64_t)maximumURLCount;
- (int64_t)maximumVideoCount;
- (int64_t)maximumVideoDataSize;
- (int64_t)maximumVideoTimeLimit;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountTypeIdentifier:(id)a3;
- (void)setActivityImageName:(id)a3;
- (void)setActivityViewIconResourceName:(id)a3;
- (void)setAddDeviceClassToRequest:(BOOL)a3;
- (void)setAuthenticationStyle:(int64_t)a3;
- (void)setLocalizedServiceName:(id)a3;
- (void)setMaximumImageCount:(int64_t)a3;
- (void)setMaximumImageDataSize:(int64_t)a3;
- (void)setMaximumURLCount:(int64_t)a3;
- (void)setMaximumVideoCount:(int64_t)a3;
- (void)setMaximumVideoDataSize:(int64_t)a3;
- (void)setMaximumVideoTimeLimit:(int64_t)a3;
- (void)setServiceBundleURL:(id)a3;
- (void)setServiceRegionTargetIsChina:(BOOL)a3;
- (void)setServiceTypeIdentifier:(id)a3;
- (void)setSupportedImageAssetURLSchemes:(id)a3;
- (void)setSupportedVideoAssetURLSchemes:(id)a3;
@end

@implementation SLRemoteService

- (SLRemoteService)initWithServiceBundle:(id)a3 socialInfoDictionary:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)SLRemoteService;
  v10 = [(SLRemoteService *)&v36 init];
  if (!v10) {
    goto LABEL_15;
  }
  if (!v8)
  {
    uint64_t v29 = v4;
    v30 = @"Bundle cannot be nil for remote service";
LABEL_12:
    uint64_t v31 = 3;
LABEL_14:
    _SLLog(v29, v31, v30);
LABEL_15:
    v28 = 0;
    goto LABEL_16;
  }
  if (![v9 count])
  {
    uint64_t v29 = v4;
    v30 = @"Social service info dictionary cannot be nil or empty";
    goto LABEL_12;
  }
  if (![(SLRemoteService *)v10 infoDictHasRequiredKeys:v9])
  {
    _SLLog(v4, 3, @"Social service info dictionary has missing or invalid required keys");
    v30 = @"Social info dict is %@";
    uint64_t v29 = v4;
    uint64_t v31 = 6;
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v10->_serviceBundle, a3);
  v11 = [v8 bundleURL];
  [(SLRemoteService *)v10 setServiceBundleURL:v11];

  v12 = [v9 objectForKeyedSubscript:@"SLServiceTypeIdentifier"];
  [(SLRemoteService *)v10 setServiceTypeIdentifier:v12];

  v13 = [v9 objectForKeyedSubscript:@"SLServiceLocalizedName"];

  if (v13)
  {
    v14 = SLSocialFrameworkBundle();
    v15 = [v9 objectForKeyedSubscript:@"SLServiceLocalizedName"];
    v16 = [v14 localizedStringForKey:v15 value:&stru_1F1E28690 table:@"Localizable"];
    [(SLRemoteService *)v10 setLocalizedServiceName:v16];
  }
  v17 = [v9 objectForKeyedSubscript:@"SLServiceActivityViewIcon"];
  [(SLRemoteService *)v10 setActivityViewIconResourceName:v17];

  v18 = [v9 objectForKeyedSubscript:@"SLServiceTargetRegionChina"];
  -[SLRemoteService setServiceRegionTargetIsChina:](v10, "setServiceRegionTargetIsChina:", [v18 BOOLValue]);

  v19 = [v9 objectForKeyedSubscript:@"SLServiceAccountTypeIdentifier"];
  [(SLRemoteService *)v10 setAccountTypeIdentifier:v19];

  v20 = [v9 objectForKeyedSubscript:@"SLServiceAuthenticationStyle"];
  [(SLRemoteService *)v10 setAuthenticationStyle:[(SLRemoteService *)v10 _authenticationStyleFromAuthenticationStyleIdentifier:v20]];

  v21 = [v9 objectForKeyedSubscript:@"SLServiceAddDeviceClassToRequests"];
  -[SLRemoteService setAddDeviceClassToRequest:](v10, "setAddDeviceClassToRequest:", [v21 BOOLValue]);

  v22 = [(SLRemoteService *)v10 _setFromArrayWithKey:@"SLServiceSupportedImageAssetURLSchemes" inDictionary:v9];
  [(SLRemoteService *)v10 setSupportedImageAssetURLSchemes:v22];

  v23 = [(SLRemoteService *)v10 _setFromArrayWithKey:@"SLServiceSupportedVideoAssetURLSchemes" inDictionary:v9];
  [(SLRemoteService *)v10 setSupportedVideoAssetURLSchemes:v23];

  v24 = [v9 objectForKeyedSubscript:@"SLServiceActivityViewIcon"];

  if (v24)
  {
    v25 = [v9 objectForKeyedSubscript:@"SLServiceActivityViewIcon"];
    [(SLRemoteService *)v10 setActivityImageName:v25];
  }
  v26 = [(SLRemoteService *)v10 integerPropertyKeyMappings];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __62__SLRemoteService_initWithServiceBundle_socialInfoDictionary___block_invoke;
  v33[3] = &unk_1E64682A0;
  id v34 = v9;
  v27 = v10;
  v35 = v27;
  [v26 enumerateKeysAndObjectsUsingBlock:v33];

  v28 = v27;
LABEL_16:

  return v28;
}

void __62__SLRemoteService_initWithServiceBundle_socialInfoDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (!v5 || (char v6 = objc_opt_respondsToSelector(), v7 = v5, (v6 & 1) == 0)) {
    v7 = &unk_1F1E40D68;
  }
  [*(id *)(a1 + 40) setValue:v7 forKey:v8];
}

- (BOOL)infoDictHasRequiredKeys:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  char v6 = [(SLRemoteService *)self _requiredInfoDictKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v19 + 1) + 8 * i)];

        if (!v11)
        {
          _SLLog(v3, 3, @"Social Info Dictionary is missing required key %@");
          v15 = @"Social info dict is %@";
          uint64_t v16 = v3;
          uint64_t v17 = 6;
          goto LABEL_13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  v12 = [v5 objectForKeyedSubscript:@"SLServiceAuthenticationStyle"];
  BOOL v13 = [(SLRemoteService *)self _isValidAuthenicationStyleIdentifier:v12];

  if (v13)
  {
    BOOL v14 = 1;
  }
  else
  {
    char v6 = [v5 objectForKeyedSubscript:@"SLServiceAuthenticationStyle"];
    v15 = @"Social Info Dictionary has invalid authentication style identifier %@";
    uint64_t v16 = v3;
    uint64_t v17 = 3;
LABEL_13:
    _SLLog(v16, v17, v15);

    BOOL v14 = 0;
  }

  return v14;
}

- (id)_requiredInfoDictKeys
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"SLServiceTypeIdentifier";
  v4[1] = @"SLServiceLocalizedName";
  v4[2] = @"SLServiceAuthenticationStyle";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

- (id)integerPropertyKeyMappings
{
  v5[6] = *MEMORY[0x1E4F143B8];
  v4[0] = @"SLServiceMaximumURLCount";
  v4[1] = @"SLServiceMaximumImageCount";
  v5[0] = @"maximumURLCount";
  v5[1] = @"maximumImageCount";
  v4[2] = @"SLServiceMaximumImageDataSize";
  v4[3] = @"SLServiceMaximumVideoCount";
  v5[2] = @"maximumImageDataSize";
  v5[3] = @"maximumVideoCount";
  void v4[4] = @"SLServiceMaximumVideoDataSize";
  v4[5] = @"SLServiceMaximumVideoTimeLimit";
  v5[4] = @"maximumVideoDataSize";
  v5[5] = @"maximumVideoTimeLimit";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:6];

  return v2;
}

- (id)_authenticationStyleIdentifierMappings
{
  return &unk_1F1E40F70;
}

- (id)_encodableStringProperties
{
  return &unk_1F1E40E40;
}

- (BOOL)_isValidAuthenicationStyleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SLRemoteService *)self _authenticationStyleIdentifierMappings];
  char v6 = [v5 objectForKey:v4];

  return v6 != 0;
}

- (int64_t)_authenticationStyleFromAuthenticationStyleIdentifier:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    char v6 = [(SLRemoteService *)self _authenticationStyleIdentifierMappings];
    uint64_t v7 = [v6 objectForKeyedSubscript:v5];
    uint64_t v8 = v7;
    if (v7)
    {
      int64_t v9 = [v7 integerValue];
    }
    else
    {
      _SLLog(v3, 3, @"Invalid authentication style %@ in Social Service info dictionary");
      int64_t v9 = -1;
    }
  }
  else
  {
    _SLLog(v3, 3, @"Invalid authentication style %@ in Social Service info dictionary");
    int64_t v9 = -1;
  }

  return v9;
}

- (id)_setFromArrayWithKey:(id)a3 inDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    int64_t v9 = [v7 objectForKeyedSubscript:v6];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v11 = (void *)MEMORY[0x1E4F1CAD0];
      v12 = [v7 objectForKeyedSubscript:v6];
      BOOL v13 = [v11 setWithArray:v12];

      goto LABEL_6;
    }
    _SLLog(v4, 3, @"Incorrect type for SLService info key %@, must be of type NSArray");
  }
  BOOL v13 = 0;
LABEL_6:

  return v13;
}

- (id)_activityImageForImageResourceName:(id)a3 inBundle:(id)a4
{
  id v7 = (void *)MEMORY[0x1E4F42D90];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 mainScreen];
  [v10 scale];
  _UISharedImageSetPreferredImageScale();

  v11 = [MEMORY[0x1E4F42A80] _deviceSpecificImageNamed:v9 inBundle:v8];

  v12 = [v11 _applicationIconImageForFormat:10 precomposed:1];

  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    v15 = [(SLRemoteService *)self serviceTypeIdentifier];
    _SLLog(v4, 4, @"Unable to fetch activity image for Social XPC service %@");
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SLRemoteService *)self serviceBundleURL];
  [v4 encodeObject:v5 forKey:@"serviceBundleURL"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SLRemoteService serviceRegionTargetIsChina](self, "serviceRegionTargetIsChina"), @"serviceRegionTargetIsChina");
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[SLRemoteService authenticationStyle](self, "authenticationStyle"));
  [v4 encodeObject:v6 forKey:@"authenticationStyle"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SLRemoteService addDeviceClassToRequest](self, "addDeviceClassToRequest"), @"addDeviceClassToRequest");
  id v7 = [(SLRemoteService *)self supportedImageAssetURLSchemes];
  [v4 encodeObject:v7 forKey:@"supportedImageAssetURLSchemes"];

  id v8 = [(SLRemoteService *)self supportedVideoAssetURLSchemes];
  [v4 encodeObject:v8 forKey:@"supportedVideoAssetURLSchemes"];

  id v9 = [(SLRemoteService *)self _encodableStringProperties];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __35__SLRemoteService_encodeWithCoder___block_invoke;
  v23[3] = &unk_1E64682C8;
  id v10 = v4;
  id v24 = v10;
  v25 = self;
  [v9 enumerateObjectsUsingBlock:v23];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v11 = [(SLRemoteService *)self integerPropertyKeyMappings];
  v12 = [v11 objectEnumerator];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v18 = [(SLRemoteService *)self valueForKey:v17];
        [v10 encodeObject:v18 forKey:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v26 count:16];
    }
    while (v14);
  }
}

void __35__SLRemoteService_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 valueForKey:v4];
  [v2 encodeObject:v5 forKey:v4];
}

- (SLRemoteService)initWithCoder:(id)a3
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SLRemoteService;
  id v5 = [(SLRemoteService *)&v39 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceBundleURL"];
    [(SLRemoteService *)v5 setServiceBundleURL:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceRegionTargetIsChina"];
    -[SLRemoteService setServiceRegionTargetIsChina:](v5, "setServiceRegionTargetIsChina:", [v7 BOOLValue]);

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticationStyle"];
    -[SLRemoteService setAuthenticationStyle:](v5, "setAuthenticationStyle:", [v8 integerValue]);

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"addDeviceClassToRequest"];
    -[SLRemoteService setAddDeviceClassToRequest:](v5, "setAddDeviceClassToRequest:", [v9 BOOLValue]);

    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    v42[0] = objc_opt_class();
    v42[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"supportedImageAssetURLSchemes"];
    [(SLRemoteService *)v5 setSupportedImageAssetURLSchemes:v13];

    uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
    v41[0] = objc_opt_class();
    v41[1] = objc_opt_class();
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
    uint64_t v16 = [v14 setWithArray:v15];
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"supportedVideoAssetURLSchemes"];
    [(SLRemoteService *)v5 setSupportedVideoAssetURLSchemes:v17];

    v18 = [(SLRemoteService *)v5 _encodableStringProperties];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __33__SLRemoteService_initWithCoder___block_invoke;
    v36[3] = &unk_1E64682C8;
    long long v19 = v5;
    v37 = v19;
    id v31 = v4;
    id v20 = v4;
    id v38 = v20;
    [v18 enumerateObjectsUsingBlock:v36];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v21 = [(SLRemoteService *)v19 integerPropertyKeyMappings];
    long long v22 = [v21 objectEnumerator];

    uint64_t v23 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v33;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v33 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v32 + 1) + 8 * v26);
          v28 = [v20 decodeObjectOfClass:objc_opt_class() forKey:v27];
          [(SLRemoteService *)v19 setValue:v28 forKey:v27];

          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v24);
    }

    uint64_t v29 = v19;
    id v4 = v31;
  }

  return v5;
}

void __33__SLRemoteService_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:v4];
  [v2 setValue:v5 forKey:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isFirstClassService
{
  return 1;
}

- (BOOL)supportsImageURL:(id)a3
{
  id v4 = a3;
  id v5 = [(SLRemoteService *)self supportedImageAssetURLSchemes];
  LOBYTE(self) = [(SLRemoteService *)self _isSupportedURL:v4 withSupportedSchemes:v5];

  return (char)self;
}

- (BOOL)supportsVideoURL:(id)a3
{
  id v4 = a3;
  id v5 = [(SLRemoteService *)self supportedVideoAssetURLSchemes];
  LOBYTE(self) = [(SLRemoteService *)self _isSupportedURL:v4 withSupportedSchemes:v5];

  return (char)self;
}

- (BOOL)_isSupportedURL:(id)a3 withSupportedSchemes:(id)a4
{
  id v5 = a4;
  id v6 = [a3 scheme];
  id v7 = [v5 member:v6];

  return v7 != 0;
}

- (NSBundle)serviceBundle
{
  serviceBundle = self->_serviceBundle;
  if (!serviceBundle)
  {
    id v4 = (void *)MEMORY[0x1E4F28B50];
    id v5 = [(SLRemoteService *)self serviceBundleURL];
    id v6 = [v4 bundleWithURL:v5];
    id v7 = self->_serviceBundle;
    self->_serviceBundle = v6;

    serviceBundle = self->_serviceBundle;
  }

  return serviceBundle;
}

- (id)activityImage
{
  id v4 = [(SLRemoteService *)self activityImageName];

  if (v4)
  {
    id v5 = [(SLRemoteService *)self activityImageName];
    id v6 = [(SLRemoteService *)self serviceBundle];
    id v7 = [(SLRemoteService *)self _activityImageForImageResourceName:v5 inBundle:v6];
  }
  else
  {
    _SLLog(v2, 4, @"Cannot create activity image, activityImageName is nil");
    id v7 = 0;
  }

  return v7;
}

- (id)composeViewController
{
  uint64_t v2 = [(SLRemoteService *)self serviceType];
  uint64_t v3 = +[SLComposeViewController composeViewControllerForServiceType:v2];

  return v3;
}

+ (id)_cachedServices
{
  if (_cachedServices_onceToken != -1) {
    dispatch_once(&_cachedServices_onceToken, &__block_literal_global_9);
  }
  uint64_t v2 = (void *)__remoteServices;

  return v2;
}

uint64_t __34__SLRemoteService__cachedServices__block_invoke()
{
  __remoteServices = +[SLRemoteServicePlistLoader allServices];

  return MEMORY[0x1F41817F8]();
}

+ (id)_cachedServiceWithType:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  +[SLRemoteService _cachedServices];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "serviceType", (void)v12);
        char v10 = [v9 isEqualToString:v3];

        if (v10)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)remoteServices
{
  return +[SLRemoteService _cachedServices];
}

+ (id)remoteServiceForTypeIdentifier:(id)a3
{
  return +[SLRemoteService _cachedServiceWithType:a3];
}

- (id)description
{
  uint64_t v2 = NSString;
  id v3 = [(SLRemoteService *)self serviceType];
  id v4 = [v2 stringWithFormat:@"SLRemoteService(serviceType=%@)", v3];

  return v4;
}

- (int64_t)maximumVideoCount
{
  return self->_maximumVideoCount;
}

- (void)setMaximumVideoCount:(int64_t)a3
{
  self->_maximumVideoCount = a3;
}

- (NSString)serviceTypeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setServiceTypeIdentifier:(id)a3
{
}

- (NSString)accountTypeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAccountTypeIdentifier:(id)a3
{
}

- (NSString)localizedServiceName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLocalizedServiceName:(id)a3
{
}

- (NSString)activityViewIconResourceName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setActivityViewIconResourceName:(id)a3
{
}

- (BOOL)serviceRegionTargetIsChina
{
  return self->_serviceRegionTargetIsChina;
}

- (void)setServiceRegionTargetIsChina:(BOOL)a3
{
  self->_serviceRegionTargetIsChina = a3;
}

- (int64_t)authenticationStyle
{
  return self->_authenticationStyle;
}

- (void)setAuthenticationStyle:(int64_t)a3
{
  self->_authenticationStyle = a3;
}

- (int64_t)maximumURLCount
{
  return self->_maximumURLCount;
}

- (void)setMaximumURLCount:(int64_t)a3
{
  self->_maximumURLCount = a3;
}

- (int64_t)maximumImageCount
{
  return self->_maximumImageCount;
}

- (void)setMaximumImageCount:(int64_t)a3
{
  self->_maximumImageCount = a3;
}

- (int64_t)maximumImageDataSize
{
  return self->_maximumImageDataSize;
}

- (void)setMaximumImageDataSize:(int64_t)a3
{
  self->_maximumImageDataSize = a3;
}

- (int64_t)maximumVideoDataSize
{
  return self->_maximumVideoDataSize;
}

- (void)setMaximumVideoDataSize:(int64_t)a3
{
  self->_maximumVideoDataSize = a3;
}

- (int64_t)maximumVideoTimeLimit
{
  return self->_maximumVideoTimeLimit;
}

- (void)setMaximumVideoTimeLimit:(int64_t)a3
{
  self->_maximumVideoTimeLimit = a3;
}

- (NSSet)supportedImageAssetURLSchemes
{
  return (NSSet *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSupportedImageAssetURLSchemes:(id)a3
{
}

- (NSSet)supportedVideoAssetURLSchemes
{
  return (NSSet *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSupportedVideoAssetURLSchemes:(id)a3
{
}

- (BOOL)addDeviceClassToRequest
{
  return self->_addDeviceClassToRequest;
}

- (void)setAddDeviceClassToRequest:(BOOL)a3
{
  self->_addDeviceClassToRequest = a3;
}

- (NSString)activityImageName
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setActivityImageName:(id)a3
{
}

- (NSURL)serviceBundleURL
{
  return (NSURL *)objc_getProperty(self, a2, 144, 1);
}

- (void)setServiceBundleURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBundleURL, 0);
  objc_storeStrong((id *)&self->_activityImageName, 0);
  objc_storeStrong((id *)&self->_supportedVideoAssetURLSchemes, 0);
  objc_storeStrong((id *)&self->_supportedImageAssetURLSchemes, 0);
  objc_storeStrong((id *)&self->_activityViewIconResourceName, 0);
  objc_storeStrong((id *)&self->_localizedServiceName, 0);
  objc_storeStrong((id *)&self->_accountTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceBundle, 0);

  objc_storeStrong((id *)&self->_activityImage, 0);
}

@end