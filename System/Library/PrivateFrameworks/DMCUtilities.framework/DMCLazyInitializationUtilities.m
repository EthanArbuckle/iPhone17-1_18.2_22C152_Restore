@interface DMCLazyInitializationUtilities
+ (void)initAppleIDSSOAuthentication;
+ (void)initAuthKit;
+ (void)initMobileActivation;
+ (void)initSetupAssistant;
+ (void)initSpringBoardServices;
+ (void)initUserManagement;
+ (void)loadBundleAtURL:(id)a3 completionBlock:(id)a4;
+ (void)loadNSBundleAtURL:(id)a3 completionBlock:(id)a4;
@end

@implementation DMCLazyInitializationUtilities

+ (void)loadBundleAtURL:(id)a3 completionBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, uint64_t, __CFBundle *))a4;
  id v6 = a3;
  v7 = [v6 lastPathComponent];
  v8 = *DMCLogObjects();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl(&dword_1A7863000, v8, OS_LOG_TYPE_INFO, "Lazy loading %{public}@", buf, 0xCu);
  }
  v9 = CFBundleCreate(0, (CFURLRef)v6);

  if (v9)
  {
    CFErrorRef error = 0;
    int v10 = CFBundleLoadExecutableAndReturnError(v9, &error);
    v11 = *DMCLogObjects();
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v7;
        _os_log_impl(&dword_1A7863000, v11, OS_LOG_TYPE_DEFAULT, "Loaded %{public}@", buf, 0xCu);
      }
      if (v5) {
        v5[2](v5, 1, v9);
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v15 = v7;
        __int16 v16 = 2114;
        CFErrorRef v17 = error;
        _os_log_impl(&dword_1A7863000, v11, OS_LOG_TYPE_ERROR, "Could not load %{public}@: %{public}@", buf, 0x16u);
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
    v12 = *DMCLogObjects();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v7;
      _os_log_impl(&dword_1A7863000, v12, OS_LOG_TYPE_ERROR, "Could not load %{public}@", buf, 0xCu);
    }
    if (v5) {
      v5[2](v5, 0, 0);
    }
  }
}

+ (void)loadNSBundleAtURL:(id)a3 completionBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, uint64_t, void *))a4;
  id v6 = a3;
  v7 = [v6 lastPathComponent];
  v8 = *DMCLogObjects();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v7;
    _os_log_impl(&dword_1A7863000, v8, OS_LOG_TYPE_INFO, "Lazy loading NSBundle %{public}@", buf, 0xCu);
  }
  v9 = [MEMORY[0x1E4F28B50] bundleWithURL:v6];

  id v17 = 0;
  uint64_t v10 = [v9 loadAndReturnError:&v17];
  id v11 = v17;
  v12 = *DMCLogObjects();
  if (v10)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
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
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
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
  _os_log_impl(&dword_1A7863000, v14, v15, v13, buf, v16);
LABEL_9:
  if (v5) {
    v5[2](v5, v10, v9);
  }
}

+ (void)initSpringBoardServices
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__DMCLazyInitializationUtilities_initSpringBoardServices__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initSpringBoardServices_onceToken != -1) {
    dispatch_once(&initSpringBoardServices_onceToken, block);
  }
}

void __57__DMCLazyInitializationUtilities_initSpringBoardServices__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/SpringBoardServices.framework");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 loadBundleAtURL:v2 completionBlock:&__block_literal_global_10];
}

void __57__DMCLazyInitializationUtilities_initSpringBoardServices__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
  {
    _SBUserNotificationDontDismissOnUnlock = *(void *)CFBundleGetDataPointerForName(bundle, @"SBUserNotificationDontDismissOnUnlock");
    _SBUserNotificationDismissOnLock = *(void *)CFBundleGetDataPointerForName(bundle, @"SBUserNotificationDismissOnLock");
  }
}

+ (void)initSetupAssistant
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__DMCLazyInitializationUtilities_initSetupAssistant__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initSetupAssistant_onceToken != -1) {
    dispatch_once(&initSetupAssistant_onceToken, block);
  }
}

void __52__DMCLazyInitializationUtilities_initSetupAssistant__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/SetupAssistant.framework");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 loadBundleAtURL:v2 completionBlock:&__block_literal_global_34];
}

void __52__DMCLazyInitializationUtilities_initSetupAssistant__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
  {
    _BYSetupAssistantNeedsToRun = CFBundleGetFunctionPointerForName(bundle, @"BYSetupAssistantNeedsToRun");
    v4 = *(void **)CFBundleGetDataPointerForName(bundle, @"BYSetupAssistantFinishedDarwinNotification");
    objc_storeStrong((id *)&_BYSetupAssistantFinishedDarwinNotification, v4);
  }
}

+ (void)initUserManagement
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__DMCLazyInitializationUtilities_initUserManagement__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initUserManagement_onceToken != -1) {
    dispatch_once(&initUserManagement_onceToken, block);
  }
}

void __52__DMCLazyInitializationUtilities_initUserManagement__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/UserManagement.framework");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 loadBundleAtURL:v2 completionBlock:&__block_literal_global_42];
}

void __52__DMCLazyInitializationUtilities_initUserManagement__block_invoke_2(int a1, int a2, CFBundleRef bundle)
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

+ (void)initAuthKit
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__DMCLazyInitializationUtilities_initAuthKit__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initAuthKit_onceToken != -1) {
    dispatch_once(&initAuthKit_onceToken, block);
  }
}

void __45__DMCLazyInitializationUtilities_initAuthKit__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/AuthKit.framework");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 loadBundleAtURL:v2 completionBlock:&__block_literal_global_56];
}

void __45__DMCLazyInitializationUtilities_initAuthKit__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
  {
    DataPointerForName = (id *)CFBundleGetDataPointerForName(bundle, @"AKAuthenticationUsernameKey");
    objc_storeStrong((id *)&_AKAuthenticationUsernameKey, *DataPointerForName);
    v5 = (id *)CFBundleGetDataPointerForName(bundle, @"AKAuthenticationPasswordKey");
    objc_storeStrong((id *)&_AKAuthenticationPasswordKey, *v5);
    id v6 = (id *)CFBundleGetDataPointerForName(bundle, @"AKAuthenticationAlternateDSIDKey");
    objc_storeStrong((id *)&_AKAuthenticationAlternateDSIDKey, *v6);
    v7 = (id *)CFBundleGetDataPointerForName(bundle, @"AKAuthenticationDSIDKey");
    objc_storeStrong((id *)&_AKAuthenticationDSIDKey, *v7);
    v8 = *(void **)CFBundleGetDataPointerForName(bundle, @"AKAuthenticationIDMSTokenKey");
    objc_storeStrong((id *)&_AKAuthenticationIDMSTokenKey, v8);
  }
}

+ (void)initAppleIDSSOAuthentication
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__DMCLazyInitializationUtilities_initAppleIDSSOAuthentication__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initAppleIDSSOAuthentication_onceToken != -1) {
    dispatch_once(&initAppleIDSSOAuthentication_onceToken, block);
  }
}

void __62__DMCLazyInitializationUtilities_initAppleIDSSOAuthentication__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/AppleIDSSOAuthentication.framework");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 loadBundleAtURL:v2 completionBlock:&__block_literal_global_73];
}

void __62__DMCLazyInitializationUtilities_initAppleIDSSOAuthentication__block_invoke_2(int a1, int a2, CFBundleRef bundle)
{
  if (a2)
  {
    DataPointerForName = (id *)CFBundleGetDataPointerForName(bundle, @"AIDAServiceTypeCloud");
    objc_storeStrong((id *)&_AIDAServiceTypeCloud, *DataPointerForName);
    v5 = (id *)CFBundleGetDataPointerForName(bundle, @"AIDAServiceTypeMessages");
    objc_storeStrong((id *)&_AIDAServiceTypeMessages, *v5);
    id v6 = (id *)CFBundleGetDataPointerForName(bundle, @"AIDAServiceTypeFaceTime");
    objc_storeStrong((id *)&_AIDAServiceTypeFaceTime, *v6);
    v7 = (id *)CFBundleGetDataPointerForName(bundle, @"AIDAServiceTypeStore");
    objc_storeStrong((id *)&_AIDAServiceTypeStore, *v7);
    v8 = *(void **)CFBundleGetDataPointerForName(bundle, @"AIDAServiceTypeGameCenter");
    objc_storeStrong((id *)&_AIDAServiceTypeGameCenter, v8);
  }
}

+ (void)initMobileActivation
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__DMCLazyInitializationUtilities_initMobileActivation__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initMobileActivation_onceToken != -1) {
    dispatch_once(&initMobileActivation_onceToken, block);
  }
}

void __54__DMCLazyInitializationUtilities_initMobileActivation__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  URLForCanonicalFilePath(@"/System/Library/PrivateFrameworks/MobileActivation.framework");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 loadBundleAtURL:v2 completionBlock:&__block_literal_global_126];
}

void __54__DMCLazyInitializationUtilities_initMobileActivation__block_invoke_2(int a1, int a2, CFBundleRef bundle)
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

@end