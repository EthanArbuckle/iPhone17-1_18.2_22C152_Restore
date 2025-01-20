@interface NTKTritiumSettingsAppProvider
+ (BOOL)_isApplicationWithBundleIDHiddenByPolicy:(id)a3;
+ (id)displayNameForWatchApp:(id)a3;
+ (void)enumerateInstalledApplicationsOnPairedDeviceWithBlock:(id)a3;
+ (void)loadAppsWithCompletion:(id)a3;
@end

@implementation NTKTritiumSettingsAppProvider

+ (void)loadAppsWithCompletion:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_39A4;
  v6[3] = &unk_8330;
  id v8 = a3;
  id v9 = a1;
  id v7 = (id)objc_opt_new();
  id v4 = v7;
  id v5 = v8;
  [a1 enumerateInstalledApplicationsOnPairedDeviceWithBlock:v6];
}

+ (BOOL)_isApplicationWithBundleIDHiddenByPolicy:(id)a3
{
  return [a3 isEqualToString:@"com.apple.nanonews"]
      && !BPSIsNewsAllowed();
}

+ (void)enumerateInstalledApplicationsOnPairedDeviceWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[NRPairedDeviceRegistry sharedInstance];
  v6 = [v5 getActivePairedDevice];

  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"1CFACCB8-FFEB-4682-A50E-16F853583912"];
  unsigned int v8 = [v6 supportsCapability:v7];

  id v9 = _NTKLoggingObjectForDomain();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      int v12 = 138412290;
      id v13 = a1;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%@ enumerateInstalledApplicationsOnPairedDeviceWithBlock: Device supports standalone apps", (uint8_t *)&v12, 0xCu);
    }

    v11 = +[ACXDeviceConnection sharedDeviceConnection];
    [v11 enumerateInstalledApplicationsOnPairedDevice:v6 withBlock:v4];
  }
  else
  {
    if (v10)
    {
      int v12 = 138412290;
      id v13 = a1;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%@ enumerateInstalledApplicationsOnPairedDeviceWithBlock: Device does not use standalone apps - using legacy call", (uint8_t *)&v12, 0xCu);
    }

    v11 = +[ACXDeviceConnection sharedDeviceConnection];
    [v11 enumerateLocallyAvailableApplicationsForPairedDevice:v6 options:1 withBlock:v4];
  }
}

+ (id)displayNameForWatchApp:(id)a3
{
  id v3 = a3;
  CFStringRef v4 = (const __CFString *)_kCFBundleDisplayNameKey;
  id v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", kCFBundleNameKey, _kCFBundleDisplayNameKey, 0);
  v6 = +[NSLocale preferredLanguages];
  id v7 = [v3 localizedInfoPlistStringsForKeys:v5 fetchingFirstMatchingLocalizationInList:v6];

  unsigned int v8 = [v7 objectForKeyedSubscript:v4];

  id v9 = v7;
  if (v8)
  {
    CFStringRef v10 = v4;
LABEL_5:
    uint64_t v12 = [v9 objectForKeyedSubscript:v10];
    goto LABEL_6;
  }
  v11 = [v7 objectForKeyedSubscript:kCFBundleNameKey];

  if (v11)
  {
    id v9 = v7;
    CFStringRef v10 = kCFBundleNameKey;
    goto LABEL_5;
  }
  uint64_t v12 = [v3 applicationName];
LABEL_6:
  id v13 = (void *)v12;

  return v13;
}

@end