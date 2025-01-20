@interface CCSModuleMetadata
+ (id)_requiredCapabilitiesForInfoDictionary:(id)a3;
+ (id)_requiredIncapabilitiesForInfoDictionary:(id)a3;
+ (id)_supportedDeviceFamiliesForBundleInfoDictionary:(id)a3;
+ (id)metadataForBundleAtURL:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSSet)requiredDeviceCapabilities;
- (NSSet)requiredDeviceIncapabilities;
- (NSSet)supportedDeviceFamilies;
- (NSString)associatedBundleIdentifier;
- (NSString)associatedBundleMinimumVersion;
- (NSString)moduleIdentifier;
- (NSURL)moduleBundleURL;
- (id)_initWithModuleIdentifier:(id)a3 supportedDeviceFamilies:(id)a4 requiredDeviceCapabilities:(id)a5 requiredDeviceIncapabilities:(id)a6 associatedBundleIdentifier:(id)a7 associatedBundleMinimumVersion:(id)a8 visibilityPreference:(unint64_t)a9 moduleBundleURL:(id)a10;
- (id)description;
- (unint64_t)hash;
- (unint64_t)visibilityPreference;
@end

@implementation CCSModuleMetadata

- (NSString)associatedBundleIdentifier
{
  return self->_associatedBundleIdentifier;
}

- (unint64_t)visibilityPreference
{
  return self->_visibilityPreference;
}

- (NSString)associatedBundleMinimumVersion
{
  return self->_associatedBundleMinimumVersion;
}

- (NSString)moduleIdentifier
{
  return self->_moduleIdentifier;
}

- (NSSet)requiredDeviceCapabilities
{
  return self->_requiredDeviceCapabilities;
}

- (NSSet)requiredDeviceIncapabilities
{
  return self->_requiredDeviceIncapabilities;
}

+ (id)metadataForBundleAtURL:(id)a3
{
  CFURLRef v4 = (const __CFURL *)a3;
  CFDictionaryRef v5 = CFBundleCopyInfoDictionaryInDirectory(v4);
  v6 = [(__CFDictionary *)v5 bs_safeObjectForKey:*MEMORY[0x263EFFB58] ofType:objc_opt_class()];
  if (v6)
  {
    v7 = [a1 _supportedDeviceFamiliesForBundleInfoDictionary:v5];
    v8 = [a1 _requiredCapabilitiesForInfoDictionary:v5];
    v9 = [a1 _requiredIncapabilitiesForInfoDictionary:v5];
    v10 = [(__CFDictionary *)v5 bs_safeObjectForKey:@"CCAssociatedBundleIdentifier" ofType:objc_opt_class()];
    v11 = [(__CFDictionary *)v5 bs_safeObjectForKey:@"CCAssociatedBundleMinimumVersion" ofType:objc_opt_class()];
    v12 = (void *)[objc_alloc((Class)a1) _initWithModuleIdentifier:v6 supportedDeviceFamilies:v7 requiredDeviceCapabilities:v8 requiredDeviceIncapabilities:v9 associatedBundleIdentifier:v10 associatedBundleMinimumVersion:v11 visibilityPreference:CCSVisibilityPreferenceForBundleInfoDictionary(v5) moduleBundleURL:v4];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_supportedDeviceFamiliesForBundleInfoDictionary:(id)a3
{
  id v3 = a3;
  CFURLRef v4 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"UIDeviceFamily", objc_opt_class());

  CFDictionaryRef v5 = (void *)MEMORY[0x263EFFA68];
  if (v4) {
    CFDictionaryRef v5 = v4;
  }
  id v6 = v5;

  v7 = objc_msgSend(v6, "bs_filter:", &__block_literal_global_1);

  v8 = [MEMORY[0x263EFFA08] setWithArray:v7];

  return v8;
}

BOOL __69__CCSModuleMetadata__supportedDeviceFamiliesForBundleInfoDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      CFDictionaryRef v5 = v4;
    }
    else {
      CFDictionaryRef v5 = 0;
    }
  }
  else
  {
    CFDictionaryRef v5 = 0;
  }
  id v6 = v5;

  return v6 == v4;
}

+ (id)_requiredCapabilitiesForInfoDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"UIRequiredDeviceCapabilities", objc_opt_class());

  CFDictionaryRef v5 = (void *)MEMORY[0x263EFFA68];
  if (v4) {
    CFDictionaryRef v5 = v4;
  }
  id v6 = v5;

  v7 = objc_msgSend(v6, "bs_filter:", &__block_literal_global_18);

  v8 = [MEMORY[0x263EFFA08] setWithArray:v7];

  return v8;
}

uint64_t __60__CCSModuleMetadata__requiredCapabilitiesForInfoDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      CFDictionaryRef v5 = v4;
    }
    else {
      CFDictionaryRef v5 = 0;
    }
  }
  else
  {
    CFDictionaryRef v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    uint64_t v7 = MGIsQuestionValid();
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)_requiredIncapabilitiesForInfoDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"CCRequiredDeviceIncapabilities", objc_opt_class());

  CFDictionaryRef v5 = (void *)MEMORY[0x263EFFA68];
  if (v4) {
    CFDictionaryRef v5 = v4;
  }
  id v6 = v5;

  uint64_t v7 = objc_msgSend(v6, "bs_filter:", &__block_literal_global_20);

  v8 = [MEMORY[0x263EFFA08] setWithArray:v7];

  return v8;
}

uint64_t __62__CCSModuleMetadata__requiredIncapabilitiesForInfoDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      CFDictionaryRef v5 = v4;
    }
    else {
      CFDictionaryRef v5 = 0;
    }
  }
  else
  {
    CFDictionaryRef v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    uint64_t v7 = MGIsQuestionValid();
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_initWithModuleIdentifier:(id)a3 supportedDeviceFamilies:(id)a4 requiredDeviceCapabilities:(id)a5 requiredDeviceIncapabilities:(id)a6 associatedBundleIdentifier:(id)a7 associatedBundleMinimumVersion:(id)a8 visibilityPreference:(unint64_t)a9 moduleBundleURL:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a10;
  v39.receiver = self;
  v39.super_class = (Class)CCSModuleMetadata;
  v23 = [(CCSModuleMetadata *)&v39 init];
  if (v23)
  {
    uint64_t v24 = [v16 copy];
    moduleIdentifier = v23->_moduleIdentifier;
    v23->_moduleIdentifier = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    supportedDeviceFamilies = v23->_supportedDeviceFamilies;
    v23->_supportedDeviceFamilies = (NSSet *)v26;

    uint64_t v28 = [v18 copy];
    requiredDeviceCapabilities = v23->_requiredDeviceCapabilities;
    v23->_requiredDeviceCapabilities = (NSSet *)v28;

    uint64_t v30 = [v19 copy];
    requiredDeviceIncapabilities = v23->_requiredDeviceIncapabilities;
    v23->_requiredDeviceIncapabilities = (NSSet *)v30;

    uint64_t v32 = [v20 copy];
    associatedBundleIdentifier = v23->_associatedBundleIdentifier;
    v23->_associatedBundleIdentifier = (NSString *)v32;

    uint64_t v34 = [v21 copy];
    associatedBundleMinimumVersion = v23->_associatedBundleMinimumVersion;
    v23->_associatedBundleMinimumVersion = (NSString *)v34;

    v23->_visibilityPreference = a9;
    uint64_t v36 = [v22 copy];
    moduleBundleURL = v23->_moduleBundleURL;
    v23->_moduleBundleURL = (NSURL *)v36;
  }
  return v23;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(CCSModuleMetadata *)self moduleIdentifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"Module Identifier"];

  id v6 = [(CCSModuleMetadata *)self supportedDeviceFamilies];
  id v7 = (id)[v3 appendObject:v6 withName:@"Supported Device Families"];

  v8 = [(CCSModuleMetadata *)self requiredDeviceCapabilities];
  id v9 = (id)[v3 appendObject:v8 withName:@"Required Device Capabilities"];

  v10 = [(CCSModuleMetadata *)self requiredDeviceIncapabilities];
  if ([v10 count]) {
    id v11 = (id)[v3 appendObject:v10 withName:@"Required Device Incapabilities"];
  }
  v12 = [(CCSModuleMetadata *)self associatedBundleIdentifier];
  id v13 = (id)[v3 appendObject:v12 withName:@"Associated Bundle Identifier"];

  v14 = [(CCSModuleMetadata *)self associatedBundleMinimumVersion];
  id v15 = (id)[v3 appendObject:v14 withName:@"Associated Bundle Minimum Version"];

  id v16 = CCSModuleVisibilityPreferenceDescription(self->_visibilityPreference);
  [v3 appendString:v16 withName:@"Visibility Preference"];

  id v17 = [(CCSModuleMetadata *)self moduleBundleURL];
  id v18 = (id)[v3 appendObject:v17 withName:@"Module Bundle URL"];

  id v19 = [v3 build];

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x263F29C60] builder];
  id v4 = [(CCSModuleMetadata *)self moduleIdentifier];
  id v5 = (id)[v3 appendObject:v4];

  id v6 = [(CCSModuleMetadata *)self supportedDeviceFamilies];
  id v7 = (id)[v3 appendObject:v6];

  v8 = [(CCSModuleMetadata *)self requiredDeviceCapabilities];
  id v9 = (id)[v3 appendObject:v8];

  v10 = [(CCSModuleMetadata *)self requiredDeviceIncapabilities];
  id v11 = (id)[v3 appendObject:v10];

  v12 = [(CCSModuleMetadata *)self associatedBundleIdentifier];
  id v13 = (id)[v3 appendObject:v12];

  v14 = [(CCSModuleMetadata *)self associatedBundleMinimumVersion];
  id v15 = (id)[v3 appendObject:v14];

  id v16 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[CCSModuleMetadata visibilityPreference](self, "visibilityPreference"));
  id v17 = [(CCSModuleMetadata *)self moduleBundleURL];
  id v18 = (id)[v3 appendObject:v17];

  unint64_t v19 = [v3 hash];
  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CCSModuleMetadata *)a3;
  if (v4 == self)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v5 = v4;
      id v6 = [(CCSModuleMetadata *)self moduleIdentifier];
      id v7 = [(CCSModuleMetadata *)v5 moduleIdentifier];
      if (BSEqualObjects())
      {
        v8 = [(CCSModuleMetadata *)self supportedDeviceFamilies];
        id v9 = [(CCSModuleMetadata *)v5 supportedDeviceFamilies];
        if (BSEqualObjects())
        {
          v10 = [(CCSModuleMetadata *)self requiredDeviceCapabilities];
          id v11 = [(CCSModuleMetadata *)v5 requiredDeviceCapabilities];
          if (BSEqualObjects())
          {
            uint64_t v12 = [(CCSModuleMetadata *)self requiredDeviceIncapabilities];
            uint64_t v24 = [(CCSModuleMetadata *)v5 requiredDeviceIncapabilities];
            v25 = (void *)v12;
            if (BSEqualObjects())
            {
              uint64_t v13 = [(CCSModuleMetadata *)self associatedBundleIdentifier];
              id v22 = [(CCSModuleMetadata *)v5 associatedBundleIdentifier];
              v23 = (void *)v13;
              if (BSEqualObjects())
              {
                uint64_t v14 = [(CCSModuleMetadata *)self associatedBundleMinimumVersion];
                [(CCSModuleMetadata *)v5 associatedBundleMinimumVersion];
                v15 = id v21 = (void *)v14;
                if (BSEqualObjects()
                  && (unint64_t v19 = [(CCSModuleMetadata *)self visibilityPreference],
                      v19 == [(CCSModuleMetadata *)v5 visibilityPreference]))
                {
                  id v20 = [(CCSModuleMetadata *)self moduleBundleURL];
                  id v18 = [(CCSModuleMetadata *)v5 moduleBundleURL];
                  char v16 = BSEqualObjects();
                }
                else
                {
                  char v16 = 0;
                }
              }
              else
              {
                char v16 = 0;
              }
            }
            else
            {
              char v16 = 0;
            }
          }
          else
          {
            char v16 = 0;
          }
        }
        else
        {
          char v16 = 0;
        }
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }

  return v16;
}

- (NSSet)supportedDeviceFamilies
{
  return self->_supportedDeviceFamilies;
}

- (NSURL)moduleBundleURL
{
  return self->_moduleBundleURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleBundleURL, 0);
  objc_storeStrong((id *)&self->_associatedBundleMinimumVersion, 0);
  objc_storeStrong((id *)&self->_associatedBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_requiredDeviceIncapabilities, 0);
  objc_storeStrong((id *)&self->_requiredDeviceCapabilities, 0);
  objc_storeStrong((id *)&self->_supportedDeviceFamilies, 0);

  objc_storeStrong((id *)&self->_moduleIdentifier, 0);
}

@end