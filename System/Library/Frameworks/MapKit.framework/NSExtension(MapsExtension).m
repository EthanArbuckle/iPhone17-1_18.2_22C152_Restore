@interface NSExtension(MapsExtension)
- (id)_containingAppDisplayName;
- (id)_containingAppIdentifer;
- (id)_displayName;
- (id)_extensionVendorContextForUUID:()MapsExtension withErrorHandler:;
- (id)_iconWithFormat:()MapsExtension;
- (uint64_t)_canSupportIntent:()MapsExtension;
- (uint64_t)_canSupportIntentClass:()MapsExtension;
- (uint64_t)_mapExtensionType;
@end

@implementation NSExtension(MapsExtension)

- (id)_displayName
{
  v1 = [a1 objectForInfoDictionaryKey:*MEMORY[0x1E4F1CC48]];
  v2 = (void *)[v1 copy];

  return v2;
}

- (id)_containingAppDisplayName
{
  id v2 = objc_alloc(MEMORY[0x1E4F223C8]);
  v3 = [a1 _containingAppIdentifer];
  v4 = (void *)[v2 initWithBundleIdentifier:v3 allowPlaceholder:0 error:0];
  v5 = [v4 localizedName];
  v6 = (void *)[v5 copy];

  return v6;
}

- (id)_containingAppIdentifer
{
  v1 = [a1 _plugIn];
  if (v1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F223A0]);
    v3 = [v1 valueForKey:@"uuid"];
    v4 = (void *)[v2 initWithUUID:v3 error:0];

    v5 = [v4 containingBundleRecord];
    v6 = [v5 bundleIdentifier];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_extensionVendorContextForUUID:()MapsExtension withErrorHandler:
{
  id v6 = a4;
  v7 = [a1 _extensionContextForUUID:a3];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 _auxiliaryConnection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __78__NSExtension_MapsExtension___extensionVendorContextForUUID_withErrorHandler___block_invoke;
    v13[3] = &unk_1E54B9C60;
    id v14 = v6;
    v10 = [v9 remoteObjectProxyWithErrorHandler:v13];
  }
  else
  {
    v11 = [MEMORY[0x1E4F28C58] _errorWithExtensionServiceError:10];
    (*((void (**)(id, void *))v6 + 2))(v6, v11);

    v10 = 0;
  }

  return v10;
}

- (uint64_t)_mapExtensionType
{
  id v2 = [a1 extensionPointIdentifier];
  char v3 = [v2 isEqualToString:*MEMORY[0x1E4F300E8]];

  if (v3) {
    return 0;
  }
  v5 = [a1 extensionPointIdentifier];
  char v6 = [v5 isEqualToString:*MEMORY[0x1E4F300F0]];

  if (v6) {
    return 1;
  }
  v7 = [a1 extensionPointIdentifier];
  unsigned int v8 = [v7 isEqualToString:@"com.apple.maps.ui-services"];

  return v8;
}

- (id)_iconWithFormat:()MapsExtension
{
  v4 = [a1 _containingAppIdentifer];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F42A80];
    char v6 = +[MKSystemController sharedInstance];
    [v6 screenScale];
    v7 = objc_msgSend(v5, "_applicationIconImageForBundleIdentifier:format:scale:", v4, a3);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)_canSupportIntent:()MapsExtension
{
  uint64_t v2 = objc_opt_class();

  return [a1 _canSupportIntentClass:v2];
}

- (uint64_t)_canSupportIntentClass:()MapsExtension
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  v4 = [a1 attributes];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F300B0]];

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v6 = NSStringFromClass(a3);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v11, "isEqualToString:", v6, (void)v13))
          {
            uint64_t v8 = 1;
            goto LABEL_17;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_17:
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end