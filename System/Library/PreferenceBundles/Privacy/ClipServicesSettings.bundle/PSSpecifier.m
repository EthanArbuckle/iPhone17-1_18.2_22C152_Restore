@interface PSSpecifier
- (BOOL)cps_isAppClipInstalled;
- (BOOL)cps_isTestFlight;
- (LSApplicationRecord)cps_appClipApplicationRecord;
- (NSString)cps_bundleIdentifier;
- (int64_t)cps_storeItemIdentifier;
- (void)cps_setBundleIdentifier:(id)a3;
@end

@implementation PSSpecifier

- (NSString)cps_bundleIdentifier
{
  v3 = [(PSSpecifier *)self propertyForKey:@"CPS_BUNDLE_IDENTIFIER"];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PSSpecifier *)self propertyForKey:PSIDKey];
  }
  v6 = v5;

  return (NSString *)v6;
}

- (void)cps_setBundleIdentifier:(id)a3
{
}

- (int64_t)cps_storeItemIdentifier
{
  v2 = [(PSSpecifier *)self cps_appClipApplicationRecord];
  v3 = [v2 iTunesMetadata];
  id v4 = [v3 storeItemIdentifier];

  return (int64_t)v4;
}

- (BOOL)cps_isAppClipInstalled
{
  v2 = [(PSSpecifier *)self cps_appClipApplicationRecord];
  v3 = [v2 applicationState];
  unsigned __int8 v4 = [v3 isInstalled];

  return v4;
}

- (BOOL)cps_isTestFlight
{
  v2 = [(PSSpecifier *)self cps_appClipApplicationRecord];
  unsigned __int8 v3 = [v2 isBeta];

  return v3;
}

- (LSApplicationRecord)cps_appClipApplicationRecord
{
  v2 = [(PSSpecifier *)self cps_bundleIdentifier];
  if ([v2 length])
  {
    id v7 = 0;
    id v3 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v2 allowPlaceholder:0 error:&v7];
    id v4 = v7;
    if (v4)
    {
      id v5 = sub_8C68();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_CFE0((uint64_t)v2, v5, v4);
      }
    }
  }
  else
  {
    id v3 = 0;
  }

  return (LSApplicationRecord *)v3;
}

@end