@interface ASKClient
+ (id)getStorefrontIdentifierPromise:(id)a3;
- (AMSPromise)storefrontIdentifierPromise;
- (ASKClient)init;
- (BOOL)canDevicePerformAppAction:(id)a3 withAppCapabilities:(id)a4;
- (BOOL)canUpdateNotificationAuthorizationStatus;
- (BOOL)deletableSystemAppCanBeInstalledOnWatchWithBundleID:(id)a3;
- (BOOL)deviceHasCapabilities:(id)a3;
- (BOOL)deviceHasCapabilitiesIncludingCompatibilityCheck:(id)a3 isVisionOSCompatibleIOSApp:(BOOL)a4;
- (BOOL)isActivePairedWatchSystemVersionAtLeastMajorVersion:(id)a3 minorVersion:(id)a4 patchVersion:(id)a5;
- (BOOL)isActivityAvailable;
- (BOOL)isAuthorizedForUserNotifications;
- (BOOL)isAutomaticDownloadingEnabled;
- (BOOL)isCharonSupported;
- (BOOL)isElectrocardiogramInstallationAllowed;
- (BOOL)isMandrakeSupported;
- (BOOL)isSidepackingEnabled;
- (BOOL)isTinkerWatch;
- (BOOL)newPaymentMethodEnabled;
- (BOOL)supportsHEIF;
- (CGSize)screenSize;
- (NSString)activePairedWatchSystemVersion;
- (NSString)guid;
- (NSString)storefrontIdentifier;
- (NSString)thinnedApplicationVariantIdentifier;
- (id)isPairedSystemVersionAtLeast:(id)a3;
- (int64_t)currentNotificationAuthorizationStatus;
- (void)accountStoreDidChange:(id)a3;
- (void)dealloc;
- (void)setCurrentNotificationAuthorizationStatus:(int64_t)a3;
- (void)setStorefrontIdentifierPromise:(id)a3;
- (void)updateNotificationAuthorizationStatus;
@end

@implementation ASKClient

- (BOOL)isTinkerWatch
{
  return +[ASKMobileGestalt isStandaloneWatch];
}

- (BOOL)isSidepackingEnabled
{
  return ASKPerformanceProfileGetForCurrentDevice() != 0;
}

- (BOOL)supportsHEIF
{
  return 1;
}

- (BOOL)deviceHasCapabilitiesIncludingCompatibilityCheck:(id)a3 isVisionOSCompatibleIOSApp:(BOOL)a4
{
  return !a3
      || +[ASKMobileGestalt hasCapabilitiesIncludingCompatibilityCheck:a3 isVisionOSCompatibleIOSApp:a4];
}

- (BOOL)newPaymentMethodEnabled
{
  return 1;
}

- (void)setCurrentNotificationAuthorizationStatus:(int64_t)a3
{
  self->_currentNotificationAuthorizationStatus = a3;
}

uint64_t __50__ASKClient_updateNotificationAuthorizationStatus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 authorizationStatus];
  v4 = *(void **)(a1 + 32);
  return [v4 setCurrentNotificationAuthorizationStatus:v3];
}

id __44__ASKClient_getStorefrontIdentifierPromise___block_invoke_12(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F4DDD0];
  uint64_t v3 = objc_msgSend(a2, "ams_storefront");
  v4 = [v2 promiseWithResult:v3];

  return v4;
}

id __44__ASKClient_getStorefrontIdentifierPromise___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = objc_msgSend(a2, "ams_storefront");
  if ((objc_msgSend(v5, "ams_hasDomain:code:", *MEMORY[0x1E4F4DA40], 7) & 1) == 0)
  {
    v7 = objc_msgSend(MEMORY[0x1E4F4DCE8], "ask_generalLogConfig");
    if (!v7)
    {
      v7 = [MEMORY[0x1E4F4DCE8] sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [v5 domain];
      int v14 = 138543618;
      v15 = v9;
      __int16 v16 = 1026;
      int v17 = [v5 code];
      _os_log_impl(&dword_1E157D000, v8, OS_LOG_TYPE_ERROR, "Could not get active iTunes accountError domain=%{public}@, code=%{public}d", (uint8_t *)&v14, 0x12u);
    }
  }
  if (v6)
  {
    v10 = [MEMORY[0x1E4F4DDD0] promiseWithResult:v6];
  }
  else
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "ams_fetchLocaliTunesAccount");
    v12 = [v11 thenWithBlock:&__block_literal_global_11];
    v10 = [v12 catchWithBlock:&__block_literal_global_17];
  }
  return v10;
}

- (ASKClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)ASKClient;
  v2 = [(ASKClient *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    v4 = +[ASKClient getStorefrontIdentifierPromise:v3];
    [(ASKClient *)v2 setStorefrontIdentifierPromise:v4];

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel_accountStoreDidChange_ name:*MEMORY[0x1E4F17728] object:v3];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel_applicationDidForeground_ name:*MEMORY[0x1E4FB2628] object:0];

    [(ASKClient *)v2 updateNotificationAuthorizationStatus];
  }
  return v2;
}

- (void)updateNotificationAuthorizationStatus
{
  if ([(ASKClient *)self canUpdateNotificationAuthorizationStatus])
  {
    uint64_t v3 = [MEMORY[0x1E4F44680] currentNotificationCenter];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __50__ASKClient_updateNotificationAuthorizationStatus__block_invoke;
    v4[3] = &unk_1E6DA8FA0;
    v4[4] = self;
    [v3 getNotificationSettingsWithCompletionHandler:v4];
  }
}

- (BOOL)canUpdateNotificationAuthorizationStatus
{
  if (canUpdateNotificationAuthorizationStatus_onceToken[0] != -1) {
    dispatch_once(canUpdateNotificationAuthorizationStatus_onceToken, &__block_literal_global_71);
  }
  return (canUpdateNotificationAuthorizationStatus_isExtension | canUpdateNotificationAuthorizationStatus_isRunningTests) == 0;
}

- (void)setStorefrontIdentifierPromise:(id)a3
{
}

- (NSString)storefrontIdentifier
{
  v2 = [(ASKClient *)self storefrontIdentifierPromise];
  uint64_t v3 = [v2 resultWithError:0];

  return (NSString *)v3;
}

- (AMSPromise)storefrontIdentifierPromise
{
  return (AMSPromise *)objc_getProperty(self, a2, 8, 1);
}

void __53__ASKClient_canUpdateNotificationAuthorizationStatus__block_invoke()
{
  v0 = [MEMORY[0x1E4F28C70] extensionInfoForCurrentProcess];
  canUpdateNotificationAuthorizationStatus_isExtension = v0 != 0;

  id v3 = [MEMORY[0x1E4F28F80] processInfo];
  v1 = [v3 environment];
  v2 = [v1 objectForKeyedSubscript:@"XCTestConfigurationFilePath"];
  canUpdateNotificationAuthorizationStatus_isRunningTests = v2 != 0;
}

+ (id)getStorefrontIdentifierPromise:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "ams_mediaType");
  id v5 = objc_msgSend(v3, "ams_activeiTunesAccountForMediaType:", v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__ASKClient_getStorefrontIdentifierPromise___block_invoke;
  v9[3] = &unk_1E6DA8F78;
  id v10 = v3;
  id v6 = v3;
  v7 = [v5 continueWithBlock:v9];

  return v7;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ASKClient;
  [(ASKClient *)&v4 dealloc];
}

- (void)accountStoreDidChange:(id)a3
{
  objc_super v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }

  if (v6)
  {
    id v5 = +[ASKClient getStorefrontIdentifierPromise:v6];
    [(ASKClient *)self setStorefrontIdentifierPromise:v5];
  }
  else
  {
    NSLog(&cfstr_SSentNotificat.isa, "-[ASKClient accountStoreDidChange:]");
  }
}

- (NSString)thinnedApplicationVariantIdentifier
{
  return (NSString *)[MEMORY[0x1E4F4DC48] thinnedAppVariantId];
}

- (NSString)activePairedWatchSystemVersion
{
  return +[ASKMobileGestalt activePairedSystemVersion];
}

- (CGSize)screenSize
{
  +[ASKMobileGestalt mainScreenSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)guid
{
  return (NSString *)[MEMORY[0x1E4F4DC48] deviceGUID];
}

id __44__ASKClient_getStorefrontIdentifierPromise___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  double v3 = objc_msgSend(MEMORY[0x1E4F4DCE8], "ask_generalLogConfig");
  if (!v3)
  {
    double v3 = [MEMORY[0x1E4F4DCE8] sharedConfig];
  }
  objc_super v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = [v2 domain];
    int v8 = 138543618;
    v9 = v5;
    __int16 v10 = 1026;
    int v11 = [v2 code];
    _os_log_impl(&dword_1E157D000, v4, OS_LOG_TYPE_ERROR, "Could not get local iTunes accountError domain=%{public}@, code=%{public}d", (uint8_t *)&v8, 0x12u);
  }
  id v6 = [MEMORY[0x1E4F4DDD0] promiseWithError:v2];

  return v6;
}

- (BOOL)isActivityAvailable
{
  return CFPreferencesGetAppBooleanValue(@"SBIconVisibility", @"com.apple.Fitness", 0) != 0;
}

- (BOOL)isElectrocardiogramInstallationAllowed
{
  return 0;
}

- (BOOL)isCharonSupported
{
  return +[ASKMobileGestalt isCharonSupported];
}

- (BOOL)isMandrakeSupported
{
  return +[ASKMobileGestalt isMandrakeSupported];
}

- (BOOL)deviceHasCapabilities:(id)a3
{
  return [(ASKClient *)self deviceHasCapabilitiesIncludingCompatibilityCheck:a3 isVisionOSCompatibleIOSApp:0];
}

- (BOOL)isActivePairedWatchSystemVersionAtLeastMajorVersion:(id)a3 minorVersion:(id)a4 patchVersion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = +[ASKMobileGestalt activePairedSystemVersion];
  int v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 componentsSeparatedByString:@"."];
    if ([v12 count])
    {
      v13 = [v12 objectAtIndexedSubscript:0];
      uint64_t v14 = [v13 integerValue];
    }
    else
    {
      uint64_t v14 = 0;
    }
    if ((unint64_t)[v12 count] < 2)
    {
      uint64_t v30 = 0;
    }
    else
    {
      __int16 v16 = [v12 objectAtIndexedSubscript:1];
      uint64_t v30 = [v16 integerValue];
    }
    uint64_t v17 = v14;
    if ((unint64_t)[v12 count] < 3)
    {
      uint64_t v19 = 0;
    }
    else
    {
      uint64_t v18 = [v12 objectAtIndexedSubscript:2];
      uint64_t v19 = [v18 integerValue];
    }
    uint64_t v20 = (int)[v7 toInt32];
    uint64_t v21 = (int)[v8 toInt32];
    int v22 = [v9 toInt32];
    id v23 = v9;
    id v24 = v7;
    uint64_t v25 = v22;
    v26 = objc_msgSend(NSString, "stringWithFormat:", @"%ld.%ld.%ld", v17, v30, v19);
    uint64_t v29 = v25;
    id v7 = v24;
    id v9 = v23;
    v27 = objc_msgSend(NSString, "stringWithFormat:", @"%ld.%ld.%ld", v20, v21, v29);
    BOOL v15 = [v26 compare:v27 options:64] != -1;
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
  objc_super v4 = [MEMORY[0x1E4F30920] currentContext];
  if (!v4) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"%s called with no active JSContext", "-[ASKClient isPairedSystemVersionAtLeast:]");
  }
  if ([v3 isString])
  {
    id v5 = +[ASKMobileGestalt activePairedSystemVersion];
    id v6 = __42__ASKClient_isPairedSystemVersionAtLeast___block_invoke((uint64_t)v5, v5);

    if (v6)
    {
      id v7 = [v3 toString];
      id v8 = __42__ASKClient_isPairedSystemVersionAtLeast___block_invoke((uint64_t)v7, v7);
      BOOL v9 = [v6 compare:v8 options:64] != -1;

      __int16 v10 = (void *)MEMORY[0x1E4F30938];
      BOOL v11 = v9;
    }
    else
    {
      __int16 v10 = (void *)MEMORY[0x1E4F30938];
      BOOL v11 = 0;
    }
    uint64_t v13 = [v10 valueWithBool:v11 inContext:v4];
  }
  else {
    id v6 = {;
  }
    uint64_t v12 = [MEMORY[0x1E4F30938] valueWithNewErrorFromMessage:v6 inContext:v4];
    [v4 setException:v12];

    uint64_t v13 = [MEMORY[0x1E4F30938] valueWithUndefinedInContext:v4];
  }
  uint64_t v14 = (void *)v13;

  return v14;
}

id __42__ASKClient_isPairedSystemVersionAtLeast___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (!v2)
  {
    id v8 = 0;
    goto LABEL_13;
  }
  objc_super v4 = [v2 componentsSeparatedByString:@"."];
  unint64_t v5 = [v4 count];
  if (v5 >= 4)
  {
    id v6 = objc_msgSend(v4, "subarrayWithRange:", 0, 3);
    id v7 = v6;
LABEL_11:
    id v8 = [v6 componentsJoinedByString:@"."];

    goto LABEL_12;
  }
  unint64_t v9 = v5 - 3;
  if (v5 != 3)
  {
    id v7 = (void *)[v4 mutableCopy];
    do
      [v7 addObject:@"0"];
    while (!__CFADD__(v9++, 1));
    id v6 = v7;
    goto LABEL_11;
  }
  id v8 = v3;
LABEL_12:

LABEL_13:
  return v8;
}

- (BOOL)deletableSystemAppCanBeInstalledOnWatchWithBundleID:(id)a3
{
  return 1;
}

- (BOOL)canDevicePerformAppAction:(id)a3 withAppCapabilities:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v6 count] || !objc_msgSend(v5, "length")) {
    goto LABEL_14;
  }
  if (([@"install" isEqualToString:v5] & 1) == 0)
  {
    if ([@"update" isEqualToString:v5])
    {
      uint64_t v7 = 1;
      goto LABEL_13;
    }
    if ([@"restore" isEqualToString:v5])
    {
      uint64_t v7 = 2;
      goto LABEL_13;
    }
    if ([@"launch" isEqualToString:v5])
    {
      uint64_t v7 = 3;
      goto LABEL_13;
    }
    if ([@"advertise" isEqualToString:v5])
    {
      uint64_t v7 = 4;
      goto LABEL_13;
    }
LABEL_14:
    char v8 = 1;
    goto LABEL_15;
  }
  uint64_t v7 = 0;
LABEL_13:
  char v8 = [MEMORY[0x1E4F4BBD0] isCapableOfAction:v7 capabilities:v6];
LABEL_15:

  return v8;
}

- (BOOL)isAutomaticDownloadingEnabled
{
  id v2 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  objc_super v4 = [v3 accountPropertyForKey:@"automaticDownloadKinds"];
  char v5 = [v4 containsObject:@"software"];

  return v5;
}

- (BOOL)isAuthorizedForUserNotifications
{
  return [(ASKClient *)self currentNotificationAuthorizationStatus] == 2;
}

- (int64_t)currentNotificationAuthorizationStatus
{
  return self->_currentNotificationAuthorizationStatus;
}

- (void).cxx_destruct
{
}

@end