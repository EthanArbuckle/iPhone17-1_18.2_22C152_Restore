@interface MCLazyInitializationUtilities
+ (void)initAppleIDSSOAuthentication;
+ (void)initAuthKit;
+ (void)initCoreGraphics;
+ (void)initCoreText;
+ (void)initDAEAS;
+ (void)initExchangeSyncExpress;
+ (void)initImageIO;
+ (void)initLoggingSupport;
+ (void)initMessage;
+ (void)initMobileActivation;
+ (void)initPowerlogControl;
+ (void)initSetupAssistant;
+ (void)initSpringBoardServices;
+ (void)initUserManagement;
+ (void)loadBundleAtURL:(id)a3 completionBlock:(id)a4;
+ (void)loadNSBundleAtURL:(id)a3 completionBlock:(id)a4;
@end

@implementation MCLazyInitializationUtilities

+ (void)loadNSBundleAtURL:(id)a3 completionBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, uint64_t, void *))a4;
  id v6 = a3;
  v7 = [v6 lastPathComponent];
  v8 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v7;
    _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_INFO, "Lazy loading NSBundle %{public}@", buf, 0xCu);
  }
  v9 = [MEMORY[0x1E4F28B50] bundleWithURL:v6];

  id v17 = 0;
  uint64_t v10 = [v9 loadAndReturnError:&v17];
  id v11 = v17;
  uint64_t v12 = _MCLogObjects;
  if (v10)
  {
    if (!os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138543362;
    v19 = v7;
    v13 = "Loaded %{public}@";
    v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    uint32_t v16 = 12;
  }
  else
  {
    if (!os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138543618;
    v19 = v7;
    __int16 v20 = 2114;
    id v21 = v11;
    v13 = "Could not load %{public}@: %{public}@";
    v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    uint32_t v16 = 22;
  }
  _os_log_impl(&dword_1A13F0000, v14, v15, v13, buf, v16);
LABEL_9:
  if (v5) {
    v5[2](v5, v10, v9);
  }
}

+ (void)loadBundleAtURL:(id)a3 completionBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, uint64_t, __CFBundle *))a4;
  id v6 = a3;
  v7 = [v6 lastPathComponent];
  v8 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    os_log_type_t v15 = v7;
    _os_log_impl(&dword_1A13F0000, v8, OS_LOG_TYPE_INFO, "Lazy loading %{public}@", buf, 0xCu);
  }
  v9 = CFBundleCreate(0, (CFURLRef)v6);

  if (v9)
  {
    CFErrorRef error = 0;
    int v10 = CFBundleLoadExecutableAndReturnError(v9, &error);
    id v11 = _MCLogObjects;
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        os_log_type_t v15 = v7;
        _os_log_impl(&dword_1A13F0000, v11, OS_LOG_TYPE_DEFAULT, "Loaded %{public}@", buf, 0xCu);
      }
      if (v5) {
        v5[2](v5, 1, v9);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        os_log_type_t v15 = v7;
        __int16 v16 = 2114;
        CFErrorRef v17 = error;
        _os_log_impl(&dword_1A13F0000, v11, OS_LOG_TYPE_ERROR, "Could not load %{public}@: %{public}@", buf, 0x16u);
      }
      if (v5) {
        v5[2](v5, 0, 0);
      }
    }
    CFRelease(v9);
    if (error) {
      CFRelease(error);
    }
  }
  else
  {
    uint64_t v12 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      os_log_type_t v15 = v7;
      _os_log_impl(&dword_1A13F0000, v12, OS_LOG_TYPE_ERROR, "Could not load %{public}@", buf, 0xCu);
    }
    if (v5) {
      v5[2](v5, 0, 0);
    }
  }
}

+ (void)initPowerlogControl
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MCLazyInitializationUtilities_initPowerlogControl__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initPowerlogControl_onceToken != -1) {
    dispatch_once(&initPowerlogControl_onceToken, block);
  }
}

void __52__MCLazyInitializationUtilities_initPowerlogControl__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/PowerlogControl.framework");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 loadBundleAtURL:v2 completionBlock:&__block_literal_global_14];
}

void __52__MCLazyInitializationUtilities_initPowerlogControl__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
  {
    _PowerlogControlSwitchMode = CFBundleGetFunctionPointerForName(bundle, @"PowerlogControlSwitchMode");
    _PowerlogControlReadMode = CFBundleGetFunctionPointerForName(bundle, @"PowerlogControlReadMode");
  }
}

+ (void)initCoreGraphics
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__MCLazyInitializationUtilities_initCoreGraphics__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initCoreGraphics_onceToken != -1) {
    dispatch_once(&initCoreGraphics_onceToken, block);
  }
}

void __49__MCLazyInitializationUtilities_initCoreGraphics__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(@"/System/Library/Frameworks/CoreGraphics.framework");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 loadBundleAtURL:v2 completionBlock:&__block_literal_global_79];
}

void __49__MCLazyInitializationUtilities_initCoreGraphics__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
  {
    _CGDataProviderCreateWithURL = CFBundleGetFunctionPointerForName(bundle, @"CGDataProviderCreateWithURL");
    _CGFontCopyFullName = CFBundleGetFunctionPointerForName(bundle, @"CGFontCopyFullName");
    _CGFontCopyPostScriptName = CFBundleGetFunctionPointerForName(bundle, @"CGFontCopyPostScriptName");
    _CGFontCreateWithDataProvider = CFBundleGetFunctionPointerForName(bundle, @"CGFontCreateWithDataProvider");
  }
}

+ (void)initImageIO
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MCLazyInitializationUtilities_initImageIO__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initImageIO_onceToken != -1) {
    dispatch_once(&initImageIO_onceToken, block);
  }
}

void __44__MCLazyInitializationUtilities_initImageIO__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(@"/System/Library/Frameworks/ImageIO.framework");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 loadBundleAtURL:v2 completionBlock:&__block_literal_global_93];
}

void __44__MCLazyInitializationUtilities_initImageIO__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
  {
    _CGImageSourceCreateImageAtIndex = CFBundleGetFunctionPointerForName(bundle, @"CGImageSourceCreateImageAtIndex");
    _CGImageSourceCreateWithData = CFBundleGetFunctionPointerForName(bundle, @"CGImageSourceCreateWithData");
    _CGImageSourceGetCount = CFBundleGetFunctionPointerForName(bundle, @"CGImageSourceGetCount");
  }
}

+ (void)initCoreText
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MCLazyInitializationUtilities_initCoreText__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initCoreText_onceToken != -1) {
    dispatch_once(&initCoreText_onceToken, block);
  }
}

void __45__MCLazyInitializationUtilities_initCoreText__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(@"/System/Library/Frameworks/CoreText.framework");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 loadBundleAtURL:v2 completionBlock:&__block_literal_global_104];
}

void __45__MCLazyInitializationUtilities_initCoreText__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2) {
    _CTFontManagerCreateFontDescriptorsFromURL = CFBundleGetFunctionPointerForName(bundle, @"CTFontManagerCreateFontDescriptorsFromURL");
  }
}

+ (void)initMessage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MCLazyInitializationUtilities_initMessage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initMessage_onceToken != -1) {
    dispatch_once(&initMessage_onceToken, block);
  }
}

void __44__MCLazyInitializationUtilities_initMessage__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/Message.framework");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 loadBundleAtURL:v2 completionBlock:&__block_literal_global_109];
}

void __44__MCLazyInitializationUtilities_initMessage__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
  {
    v3 = *(void **)CFBundleGetDataPointerForName(bundle, @"MailAccountManagedTag");
    objc_storeStrong((id *)&_MailAccountManagedTag, v3);
  }
}

+ (void)initExchangeSyncExpress
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MCLazyInitializationUtilities_initExchangeSyncExpress__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initExchangeSyncExpress_onceToken != -1) {
    dispatch_once(&initExchangeSyncExpress_onceToken, block);
  }
}

void __56__MCLazyInitializationUtilities_initExchangeSyncExpress__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/ExchangeSyncExpress.framework");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 loadBundleAtURL:v2 completionBlock:&__block_literal_global_114];
}

void __56__MCLazyInitializationUtilities_initExchangeSyncExpress__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
  {
    DataPointerForName = (id *)CFBundleGetDataPointerForName(bundle, @"kESExchangeAccountWipeOnly");
    if (DataPointerForName) {
      DataPointerForName = (id *)*DataPointerForName;
    }
    v5 = (void *)_kESExchangeAccountWipeOnly;
    _kESExchangeAccountWipeOnly = (uint64_t)DataPointerForName;

    id v6 = (id *)CFBundleGetDataPointerForName(bundle, @"kESExchangeDeviceID");
    if (v6) {
      id v6 = (id *)*v6;
    }
    v7 = (void *)_kESExchangeDeviceID;
    _kESExchangeDeviceID = (uint64_t)v6;

    v8 = (id *)CFBundleGetDataPointerForName(bundle, @"kESExchangeUserEnrollmentMode");
    if (v8) {
      v8 = (id *)*v8;
    }
    _kESExchangeUserEnrollmentMode = (uint64_t)v8;
    MEMORY[0x1F41817F8]();
  }
}

+ (void)initDAEAS
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MCLazyInitializationUtilities_initDAEAS__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initDAEAS_onceToken != -1) {
    dispatch_once(&initDAEAS_onceToken, block);
  }
}

void __42__MCLazyInitializationUtilities_initDAEAS__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/ExchangeSync.framework/Frameworks/DAEAS.framework");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 loadBundleAtURL:v2 completionBlock:&__block_literal_global_125];
}

void __42__MCLazyInitializationUtilities_initDAEAS__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
  {
    DataPointerForName = (id *)CFBundleGetDataPointerForName(bundle, @"kASSyncDefaultFoldersOnly");
    objc_storeStrong((id *)&_kASSyncDefaultFoldersOnly, *DataPointerForName);
    _overSimplifiedStatusForError = CFBundleGetFunctionPointerForName(bundle, @"overSimplifiedStatusForError");
  }
}

+ (void)initMobileActivation
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MCLazyInitializationUtilities_initMobileActivation__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initMobileActivation_onceToken != -1) {
    dispatch_once(&initMobileActivation_onceToken, block);
  }
}

void __53__MCLazyInitializationUtilities_initMobileActivation__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/MobileActivation.framework");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 loadBundleAtURL:v2 completionBlock:&__block_literal_global_133];
}

void __53__MCLazyInitializationUtilities_initMobileActivation__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
  {
    DataPointerForName = (id *)CFBundleGetDataPointerForName(bundle, @"kMAActivationStateActivated");
    objc_storeStrong((id *)&_kMAActivationStateActivated, *DataPointerForName);
    v5 = (id *)CFBundleGetDataPointerForName(bundle, @"kNotificationActivationStateChanged");
    objc_storeStrong((id *)&_kNotificationActivationStateChanged, *v5);
    _MAEGetActivationStateWithError = CFBundleGetFunctionPointerForName(bundle, @"MAEGetActivationStateWithError");
    _MAECopyActivationRecordWithError = CFBundleGetFunctionPointerForName(bundle, @"MAECopyActivationRecordWithError");
  }
}

+ (void)initLoggingSupport
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MCLazyInitializationUtilities_initLoggingSupport__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initLoggingSupport_onceToken != -1) {
    dispatch_once(&initLoggingSupport_onceToken, block);
  }
}

void __51__MCLazyInitializationUtilities_initLoggingSupport__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/LoggingSupport.framework");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 loadBundleAtURL:v2 completionBlock:&__block_literal_global_147_0];
}

void __51__MCLazyInitializationUtilities_initLoggingSupport__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
  {
    _OSLogValidateProfilePayload = CFBundleGetFunctionPointerForName(bundle, @"OSLogValidateProfilePayload");
    _OSLogInstallProfilePayload = CFBundleGetFunctionPointerForName(bundle, @"OSLogInstallProfilePayload");
    _OSLogRemoveProfilePayload = CFBundleGetFunctionPointerForName(bundle, @"OSLogRemoveProfilePayload");
  }
}

+ (void)initSetupAssistant
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MCLazyInitializationUtilities_initSetupAssistant__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initSetupAssistant_onceToken != -1) {
    dispatch_once(&initSetupAssistant_onceToken, block);
  }
}

void __51__MCLazyInitializationUtilities_initSetupAssistant__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/SetupAssistant.framework");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 loadBundleAtURL:v2 completionBlock:&__block_literal_global_158];
}

void __51__MCLazyInitializationUtilities_initSetupAssistant__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2) {
    _BYSetupAssistantNeedsToRun = CFBundleGetFunctionPointerForName(bundle, @"BYSetupAssistantNeedsToRun");
  }
}

+ (void)initSpringBoardServices
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MCLazyInitializationUtilities_initSpringBoardServices__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initSpringBoardServices_onceToken != -1) {
    dispatch_once(&initSpringBoardServices_onceToken, block);
  }
}

void __56__MCLazyInitializationUtilities_initSpringBoardServices__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/SpringBoardServices.framework");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 loadBundleAtURL:v2 completionBlock:&__block_literal_global_163];
}

void __56__MCLazyInitializationUtilities_initSpringBoardServices__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
  {
    _SBUserNotificationDontDismissOnUnlock = *(void *)CFBundleGetDataPointerForName(bundle, @"SBUserNotificationDontDismissOnUnlock");
    _SBUserNotificationDismissOnLock = *(void *)CFBundleGetDataPointerForName(bundle, @"SBUserNotificationDismissOnLock");
    _SBSApplicationLaunchFromURLOptionUnlockDeviceKey = *(void *)CFBundleGetDataPointerForName(bundle, @"SBSApplicationLaunchFromURLOptionUnlockDeviceKey");
    _SBSCopyFrontmostApplicationDisplayIdentifier = CFBundleGetFunctionPointerForName(bundle, @"SBSCopyFrontmostApplicationDisplayIdentifier");
    _SBSSuspendFrontmostApplication = CFBundleGetFunctionPointerForName(bundle, @"SBSSuspendFrontmostApplication");
    _SBSSpringBoardServerPort = CFBundleGetFunctionPointerForName(bundle, @"SBSSpringBoardServerPort");
    _SBAddWebClipToHomeScreen = CFBundleGetFunctionPointerForName(bundle, @"SBAddWebClipToHomeScreen");
    _SBGetScreenLockStatus = CFBundleGetFunctionPointerForName(bundle, @"SBGetScreenLockStatus");
    _SBRemoveWebClipFromHomeScreen = CFBundleGetFunctionPointerForName(bundle, @"SBRemoveWebClipFromHomeScreen");
  }
}

+ (void)initUserManagement
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MCLazyInitializationUtilities_initUserManagement__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initUserManagement_onceToken != -1) {
    dispatch_once(&initUserManagement_onceToken, block);
  }
}

void __51__MCLazyInitializationUtilities_initUserManagement__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/UserManagement.framework");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 loadBundleAtURL:v2 completionBlock:&__block_literal_global_192];
}

void __51__MCLazyInitializationUtilities_initUserManagement__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
  {
    DataPointerForName = (id *)CFBundleGetDataPointerForName(bundle, @"UMUserManagerErrorDomain");
    objc_storeStrong((id *)&_UMUserManagerErrorDomain, *DataPointerForName);
    v5 = (id *)CFBundleGetDataPointerForName(bundle, @"kUMUserSessionProvisionTypeEducation");
    objc_storeStrong((id *)&_kUMUserSessionProvisionTypeEducation, *v5);
    id v6 = (id *)CFBundleGetDataPointerForName(bundle, @"kUMUserSessionProvisionTypeKey");
    objc_storeStrong((id *)&_kUMUserSessionProvisionTypeKey, *v6);
    v7 = *(void **)CFBundleGetDataPointerForName(bundle, @"kUMEducationUserSizeKey");
    objc_storeStrong((id *)&_kUMEducationUserSizeKey, v7);
  }
}

+ (void)initAppleIDSSOAuthentication
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MCLazyInitializationUtilities_initAppleIDSSOAuthentication__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initAppleIDSSOAuthentication_onceToken != -1) {
    dispatch_once(&initAppleIDSSOAuthentication_onceToken, block);
  }
}

void __61__MCLazyInitializationUtilities_initAppleIDSSOAuthentication__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/AppleIDSSOAuthentication.framework");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 loadBundleAtURL:v2 completionBlock:&__block_literal_global_206];
}

void __61__MCLazyInitializationUtilities_initAppleIDSSOAuthentication__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
  {
    v3 = *(void **)CFBundleGetDataPointerForName(bundle, @"AIDAServiceTypeCloud");
    objc_storeStrong((id *)&_AIDAServiceTypeCloud, v3);
  }
}

+ (void)initAuthKit
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MCLazyInitializationUtilities_initAuthKit__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initAuthKit_onceToken != -1) {
    dispatch_once(&initAuthKit_onceToken, block);
  }
}

void __44__MCLazyInitializationUtilities_initAuthKit__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/AuthKit.framework");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 loadBundleAtURL:v2 completionBlock:&__block_literal_global_211];
}

void __44__MCLazyInitializationUtilities_initAuthKit__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
  {
    DataPointerForName = (id *)CFBundleGetDataPointerForName(bundle, @"AKAuthenticationUsernameKey");
    objc_storeStrong((id *)&_AKAuthenticationUsernameKey, *DataPointerForName);
    v5 = (id *)CFBundleGetDataPointerForName(bundle, @"AKAuthenticationPasswordKey");
    objc_storeStrong((id *)&_AKAuthenticationPasswordKey, *v5);
    id v6 = *(void **)CFBundleGetDataPointerForName(bundle, @"AKAuthenticationAlternateDSIDKey");
    objc_storeStrong((id *)&_AKAuthenticationAlternateDSIDKey, v6);
  }
}

@end