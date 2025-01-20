@interface ASCJSClientObject
- (ACAccount)activeiTunesAccount;
- (ACAccountStore)accountStore;
- (ASCJSClientObject)initWithAccountStore:(id)a3;
- (BOOL)deletableSystemAppCanBeInstalledOnWatchWithBundleID:(id)a3;
- (BOOL)deviceHasCapabilities:(id)a3;
- (BOOL)deviceHasCapabilitiesIncludingCompatibilityCheck:(id)a3 isVisionOSCompatibleIOSApp:(BOOL)a4;
- (BOOL)isActivePairedWatchSystemVersionAtLeastMajorVersion:(id)a3 minorVersion:(id)a4 patchVersion:(id)a5;
- (BOOL)isActivityAvailable;
- (BOOL)isAutomaticDownloadingEnabled;
- (BOOL)isElectrocardiogramInstallationAllowed;
- (BOOL)isSidepackingEnabled;
- (BOOL)isTinkerWatch;
- (BOOL)newPaymentMethodEnabled;
- (BOOL)supportsHEIF;
- (CGSize)screenSize;
- (NSString)activePairedWatchSystemVersion;
- (NSString)deviceType;
- (NSString)guid;
- (NSString)storefrontIdentifier;
- (NSString)thinnedApplicationVariantIdentifier;
- (double)screenCornerRadius;
- (id)buildType;
- (id)isPairedSystemVersionAtLeast:(id)a3;
- (void)accountStoreDidChange:(id)a3;
- (void)dealloc;
- (void)setActiveiTunesAccount:(id)a3;
@end

@implementation ASCJSClientObject

- (id)buildType
{
  if (qword_1001A6010 != -1) {
    dispatch_once(&qword_1001A6010, &stru_100183F18);
  }
  v0 = (void *)qword_1001A6018;

  return v0;
}

- (ASCJSClientObject)initWithAccountStore:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASCJSClientObject;
  v6 = [(ASCJSClientObject *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountStore, a3);
    uint64_t v8 = objc_msgSend(v5, "ams_activeiTunesAccount");
    activeiTunesAccount = v7->_activeiTunesAccount;
    v7->_activeiTunesAccount = (ACAccount *)v8;

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v7 selector:"accountStoreDidChange:" name:ACDAccountStoreDidChangeNotification object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ASCJSClientObject;
  [(ASCJSClientObject *)&v4 dealloc];
}

- (void)accountStoreDidChange:(id)a3
{
  id v5 = [(ASCJSClientObject *)self accountStore];
  objc_super v4 = objc_msgSend(v5, "ams_activeiTunesAccount");
  [(ASCJSClientObject *)self setActiveiTunesAccount:v4];
}

- (NSString)thinnedApplicationVariantIdentifier
{
  return (NSString *)+[AMSDevice thinnedAppVariantId];
}

- (NSString)activePairedWatchSystemVersion
{
  return +[ASCMobileGestalt activePairedSystemVersion];
}

- (CGSize)screenSize
{
  +[ASCMobileGestalt mainScreenPointSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)screenCornerRadius
{
  +[ASCMobileGestalt mainScreenCornerRadius];
  return result;
}

- (NSString)guid
{
  return (NSString *)+[AMSDevice deviceGUID];
}

- (NSString)storefrontIdentifier
{
  double v3 = [(ASCJSClientObject *)self activeiTunesAccount];
  objc_super v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(ASCJSClientObject *)self accountStore];
    objc_msgSend(v6, "ams_localiTunesAccount");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = objc_msgSend(v5, "ams_storefront");

  return (NSString *)v7;
}

- (BOOL)newPaymentMethodEnabled
{
  return 1;
}

- (NSString)deviceType
{
  if (+[ASCMobileGestalt isPad]) {
    double v2 = @"pad";
  }
  else {
    double v2 = @"phone";
  }

  return (NSString *)v2;
}

- (BOOL)isActivityAvailable
{
  return CFPreferencesGetAppBooleanValue(@"SBIconVisibility", @"com.apple.Fitness", 0) != 0;
}

- (BOOL)isElectrocardiogramInstallationAllowed
{
  return 0;
}

- (BOOL)isSidepackingEnabled
{
  return 0;
}

- (BOOL)isTinkerWatch
{
  return +[ASCMobileGestalt isStandaloneWatch];
}

- (BOOL)supportsHEIF
{
  return 1;
}

- (BOOL)deviceHasCapabilities:(id)a3
{
  return [(ASCJSClientObject *)self deviceHasCapabilitiesIncludingCompatibilityCheck:a3 isVisionOSCompatibleIOSApp:0];
}

- (BOOL)deviceHasCapabilitiesIncludingCompatibilityCheck:(id)a3 isVisionOSCompatibleIOSApp:(BOOL)a4
{
  if (a3) {
    return +[ASCMobileGestalt hasCapabilitiesIncludingCompatibilityCheck:isVisionOSCompatibleIOSApp:](ASCMobileGestalt, "hasCapabilitiesIncludingCompatibilityCheck:isVisionOSCompatibleIOSApp:");
  }
  else {
    return 1;
  }
}

- (BOOL)isActivePairedWatchSystemVersionAtLeastMajorVersion:(id)a3 minorVersion:(id)a4 patchVersion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[ASCMobileGestalt activePairedSystemVersion];
  v11 = v10;
  if (v10)
  {
    objc_super v12 = [v10 componentsSeparatedByString:@"."];
    if ([v12 count])
    {
      v13 = [v12 objectAtIndexedSubscript:0];
      id v14 = [v13 integerValue];
    }
    else
    {
      id v14 = 0;
    }
    if ((unint64_t)[v12 count] < 2)
    {
      id v30 = 0;
    }
    else
    {
      v16 = [v12 objectAtIndexedSubscript:1];
      id v30 = [v16 integerValue];
    }
    id v17 = v14;
    if ((unint64_t)[v12 count] < 3)
    {
      id v19 = 0;
    }
    else
    {
      v18 = [v12 objectAtIndexedSubscript:2];
      id v19 = [v18 integerValue];
    }
    uint64_t v20 = (int)[v7 toInt32];
    uint64_t v21 = (int)[v8 toInt32];
    signed int v22 = [v9 toInt32];
    id v23 = v9;
    id v24 = v7;
    uint64_t v25 = v22;
    v26 = +[NSString stringWithFormat:@"%ld.%ld.%ld", v17, v30, v19];
    uint64_t v29 = v25;
    id v7 = v24;
    id v9 = v23;
    v27 = +[NSString stringWithFormat:@"%ld.%ld.%ld", v20, v21, v29];
    BOOL v15 = [v26 compare:v27 options:64] != (id)-1;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)isPairedSystemVersionAtLeast:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[JSContext currentContext];
  if (!v4) {
    +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, @"%s called with no active JSContext", "-[ASCJSClientObject isPairedSystemVersionAtLeast:]");
  }
  if ([v3 isString])
  {
    id v5 = +[ASCMobileGestalt activePairedSystemVersion];
    v6 = sub_100010604((uint64_t)v5, v5);

    if (v6)
    {
      id v7 = [v3 toString];
      id v8 = sub_100010604((uint64_t)v7, v7);
      BOOL v9 = [v6 compare:v8 options:64] != (id)-1;

      BOOL v10 = v9;
    }
    else
    {
      BOOL v10 = 0;
    }
    uint64_t v12 = +[JSValue valueWithBool:v10 inContext:v4];
  }
  else {
    v6 = {;
  }
    v11 = +[JSValue valueWithNewErrorFromMessage:v6 inContext:v4];
    [v4 setException:v11];

    uint64_t v12 = +[JSValue valueWithUndefinedInContext:v4];
  }
  v13 = (void *)v12;

  return v13;
}

- (BOOL)deletableSystemAppCanBeInstalledOnWatchWithBundleID:(id)a3
{
  return 1;
}

- (BOOL)isAutomaticDownloadingEnabled
{
  double v2 = [(ASCJSClientObject *)self activeiTunesAccount];
  id v3 = [v2 accountPropertyForKey:@"automaticDownloadKinds"];

  LOBYTE(v2) = [v3 containsObject:@"software"];
  return (char)v2;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (ACAccount)activeiTunesAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 16, 1);
}

- (void)setActiveiTunesAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeiTunesAccount, 0);

  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end