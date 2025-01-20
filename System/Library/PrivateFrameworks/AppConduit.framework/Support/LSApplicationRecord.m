@interface LSApplicationRecord
- (BOOL)ACX_isBuiltIn;
- (BOOL)ACX_isHidden;
- (BOOL)ACX_shouldBeTrackedByAppConduit;
- (BOOL)ACX_shouldBeTrackedByLaunchServicesWatcher;
- (LSApplicationExtensionRecord)ACX_watchKitExtension;
- (NSNumber)ACX_externalVersionIdentifier;
- (NSString)ACX_watchKitAppExtensionBundleID;
- (NSString)ACX_wkTeamID;
@end

@implementation LSApplicationRecord

- (BOOL)ACX_isBuiltIn
{
  v2 = [(LSApplicationRecord *)self typeForInstallMachinery];
  char v3 = [v2 isEqualToString:LSUserApplicationType] ^ 1;

  return v3;
}

- (BOOL)ACX_shouldBeTrackedByAppConduit
{
  id v3 = objc_alloc((Class)LSApplicationRecord);
  v4 = [(LSApplicationRecord *)self bundleIdentifier];
  id v5 = [v3 initWithBundleIdentifierOfSystemPlaceholder:v4 error:0];

  if (!v5)
  {
    if ([(LSApplicationRecord *)self ACX_isHidden]
      || ([(LSApplicationRecord *)self isLaunchProhibited] & 1) != 0)
    {
      return 0;
    }
    if (([(LSApplicationRecord *)self isDeletable] & 1) == 0)
    {
      v8 = [(LSApplicationRecord *)self ACX_watchKitAppExtensionBundleID];
      BOOL v6 = v8 != 0;

      return v6;
    }
  }
  return 1;
}

- (BOOL)ACX_shouldBeTrackedByLaunchServicesWatcher
{
  id v3 = objc_alloc((Class)LSApplicationRecord);
  v4 = [(LSApplicationRecord *)self bundleIdentifier];
  id v5 = [v3 initWithBundleIdentifierOfSystemPlaceholder:v4 error:0];

  if (v5) {
    return 1;
  }
  v7 = [(LSApplicationRecord *)self typeForInstallMachinery];
  if ([(LSApplicationRecord *)self ACX_isHidden])
  {
    unsigned __int8 v6 = 0;
  }
  else if ([v7 isEqualToString:LSSystemApplicationType])
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    unsigned __int8 v6 = [v7 isEqualToString:LSUserApplicationType];
  }

  return v6;
}

- (BOOL)ACX_isHidden
{
  v2 = [(LSApplicationRecord *)self appTags];
  unsigned __int8 v3 = [v2 containsObject:@"hidden"];

  return v3;
}

- (NSString)ACX_watchKitAppExtensionBundleID
{
  v2 = [(LSApplicationRecord *)self infoDictionary];
  unsigned __int8 v3 = [v2 objectForKey:@"WKPluginBundleIdKey" ofClass:objc_opt_class()];

  return (NSString *)v3;
}

- (LSApplicationExtensionRecord)ACX_watchKitExtension
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = [(LSApplicationRecord *)self applicationExtensionRecords];
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v8 = [v7 extensionPointRecord];
        v9 = [v8 name];
        unsigned int v10 = [v9 isEqualToString:@"com.apple.watchkit"];

        if (v10)
        {
          id v11 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return (LSApplicationExtensionRecord *)v11;
}

- (NSString)ACX_wkTeamID
{
  v2 = [(LSApplicationRecord *)self teamIdentifier];
  id v3 = v2;
  if (v2 && ([v2 isEqualToString:@"0000000000"] & 1) == 0) {
    id v4 = v3;
  }
  else {
    id v4 = &stru_10008F348;
  }

  return (NSString *)v4;
}

- (NSNumber)ACX_externalVersionIdentifier
{
  v2 = [(LSApplicationRecord *)self iTunesMetadata];
  id v3 = [v2 versionIdentifier];

  if (v3)
  {
    id v4 = +[NSNumber numberWithUnsignedLongLong:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (NSNumber *)v4;
}

@end