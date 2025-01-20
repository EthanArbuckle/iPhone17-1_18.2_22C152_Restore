@interface LSApplicationRecord(AppConduitAdditions)
- (__CFString)ACX_wkTeamID;
- (id)ACX_externalVersionIdentifier;
- (id)ACX_watchKitAppExtensionBundleID;
- (id)ACX_watchKitExtension;
- (uint64_t)ACX_isBuiltIn;
- (uint64_t)ACX_isHidden;
- (uint64_t)ACX_shouldBeTrackedByAppConduit;
- (uint64_t)ACX_shouldBeTrackedByLaunchServicesWatcher;
@end

@implementation LSApplicationRecord(AppConduitAdditions)

- (uint64_t)ACX_isBuiltIn
{
  v1 = [a1 typeForInstallMachinery];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x1E4F22390]] ^ 1;

  return v2;
}

- (uint64_t)ACX_shouldBeTrackedByAppConduit
{
  id v2 = objc_alloc(MEMORY[0x1E4F223C8]);
  v3 = [a1 bundleIdentifier];
  v4 = (void *)[v2 initWithBundleIdentifierOfSystemPlaceholder:v3 error:0];

  if (!v4)
  {
    if (objc_msgSend(a1, "ACX_isHidden") & 1) != 0 || (objc_msgSend(a1, "isLaunchProhibited")) {
      return 0;
    }
    if (([a1 isDeletable] & 1) == 0)
    {
      v7 = objc_msgSend(a1, "ACX_watchKitAppExtensionBundleID");
      BOOL v5 = v7 != 0;

      return v5;
    }
  }
  return 1;
}

- (uint64_t)ACX_shouldBeTrackedByLaunchServicesWatcher
{
  id v2 = objc_alloc(MEMORY[0x1E4F223C8]);
  v3 = [a1 bundleIdentifier];
  v4 = (void *)[v2 initWithBundleIdentifierOfSystemPlaceholder:v3 error:0];

  if (v4) {
    return 1;
  }
  v6 = [a1 typeForInstallMachinery];
  if (objc_msgSend(a1, "ACX_isHidden"))
  {
    uint64_t v5 = 0;
  }
  else if ([v6 isEqualToString:*MEMORY[0x1E4F22380]])
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = [v6 isEqualToString:*MEMORY[0x1E4F22390]];
  }

  return v5;
}

- (uint64_t)ACX_isHidden
{
  v1 = [a1 appTags];
  uint64_t v2 = [v1 containsObject:@"hidden"];

  return v2;
}

- (id)ACX_watchKitAppExtensionBundleID
{
  v1 = [a1 infoDictionary];
  uint64_t v2 = [v1 objectForKey:@"WKPluginBundleIdKey" ofClass:objc_opt_class()];

  return v2;
}

- (id)ACX_watchKitExtension
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v1 = objc_msgSend(a1, "applicationExtensionRecords", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v7 = [v6 extensionPointRecord];
        v8 = [v7 name];
        int v9 = [v8 isEqualToString:@"com.apple.watchkit"];

        if (v9)
        {
          id v10 = v6;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (__CFString)ACX_wkTeamID
{
  v1 = [a1 teamIdentifier];
  uint64_t v2 = v1;
  if (v1 && ([v1 isEqualToString:@"0000000000"] & 1) == 0) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = &stru_1F38AAC80;
  }

  return v3;
}

- (id)ACX_externalVersionIdentifier
{
  v1 = [a1 iTunesMetadata];
  uint64_t v2 = [v1 versionIdentifier];

  if (v2)
  {
    uint64_t v3 = [NSNumber numberWithUnsignedLongLong:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

@end