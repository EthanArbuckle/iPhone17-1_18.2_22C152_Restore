@interface FontProviderLoader
- (BOOL)confirm:(id)a3 sceneID:(id)a4;
- (BOOL)currentConnectionHasFontProviderEntitlement:(id *)a3 withSuppressDialogEntitlement:(BOOL *)a4 forUnitTest:(BOOL *)a5;
- (BOOL)isDeviceInEduMode;
- (BOOL)isFileURL:(id)a3 forApplicationBundlePath:(id)a4;
- (BOOL)isOnDemandResourceFile:(id)a3;
- (id)basePathForODRContentAssetPack;
- (id)fontDescriptorAttributesArrayFromFontInfoDictionary:(id)a3;
- (id)systemContainerURL;
- (void)doneWithInstallFonts:(BOOL)a3;
- (void)ping:(id)a3;
- (void)registerFonts:(id)a3 enabled:(BOOL)a4 sceneID:(id)a5 appInfo:(id)a6 completionHandler:(id)a7;
- (void)registeredFontsInfo:(BOOL)a3 appInfo:(id)a4 completionHandler:(id)a5;
- (void)unregisterFonts:(id)a3 appInfo:(id)a4 completionHandler:(id)a5;
- (void)updateAppInfo:(id)a3;
@end

@implementation FontProviderLoader

- (BOOL)currentConnectionHasFontProviderEntitlement:(id *)a3 withSuppressDialogEntitlement:(BOOL *)a4 forUnitTest:(BOOL *)a5
{
  v8 = +[NSXPCConnection currentConnection];
  v9 = v8;
  if (v8) {
    [v8 auditToken];
  }
  else {
    memset(&token, 0, sizeof(token));
  }
  v10 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);

  if (v10)
  {
    CFArrayRef v11 = (const __CFArray *)SecTaskCopyValueForEntitlement(v10, @"com.apple.developer.user-fonts", 0);
    if (v11)
    {
      CFArrayRef v12 = v11;
      CFTypeID v13 = CFGetTypeID(v11);
      if (v13 == CFArrayGetTypeID())
      {
        v25.length = CFArrayGetCount(v12);
        v25.location = 0;
        BOOL v14 = CFArrayContainsValue(v12, v25, @"system-installation") != 0;
      }
      else
      {
        BOOL v14 = 0;
      }
      CFRelease(v12);
    }
    else
    {
      BOOL v14 = 0;
    }
    v17 = (__CFString *)SecTaskCopySigningIdentifier(v10, 0);
    unsigned int v15 = [(__CFString *)v17 isEqualToString:@"com.apple.xctest"];
    if (v15)
    {
      FSLog_Debug();
      BOOL v18 = 1;
      BOOL v14 = 1;
    }
    else
    {
      BOOL v18 = 0;
    }
    BOOL v16 = v14;
    if (a3 && v14) {
      *a3 = v17;
    }
    if (a4) {
      char v19 = v15;
    }
    else {
      char v19 = 1;
    }
    if ((v19 & 1) == 0)
    {
      CFBooleanRef v20 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v10, @"com.apple.FontServices.skip-install-dialog", 0);
      if (v20)
      {
        CFBooleanRef v21 = v20;
        CFTypeID v22 = CFGetTypeID(v20);
        BOOL v18 = v22 == CFBooleanGetTypeID() && CFBooleanGetValue(v21) != 0;
        CFRelease(v21);
      }
    }
    CFRelease(v10);
    LOBYTE(v10) = v18;

    if (a4) {
      goto LABEL_29;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
    BOOL v16 = 0;
    if (a4) {
LABEL_29:
    }
      *a4 = (char)v10;
  }
  if (a5) {
    *a5 = v15;
  }
  return v16;
}

- (BOOL)confirm:(id)a3 sceneID:(id)a4
{
  id v5 = a3;
  if (objc_opt_class())
  {
    v6 = +[NSUserDefaults standardUserDefaults];
    uint64_t v7 = (uint64_t)[v6 integerForKey:@"InstallDialogSuppressInterval"];
    if (v7 >= 1) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 3600;
    }
    v9 = [v6 objectForKey:@"InstallDialogLastTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [v9 objectForKey:v5];
      if (v10)
      {
        CFArrayRef v11 = v10;
        [v10 timeIntervalSinceNow];
        double v13 = -v12;

        if (v13 < (double)v8)
        {
          self->_result = 1;
          p_result = &self->_result;
LABEL_19:
          if (v9)
          {
            id v38 = [v9 mutableCopy];
          }
          else
          {
            id v38 = +[NSMutableDictionary dictionaryWithCapacity:0];
          }
          v39 = v38;
          v40 = +[NSDate now];
          [v39 setObject:v40 forKey:v5];

          [v6 setObject:v39 forKey:@"InstallDialogLastTime"];
          CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);

LABEL_26:
          BOOL v15 = *p_result;
          goto LABEL_27;
        }
      }
    }
    else
    {

      v9 = 0;
    }
    BOOL v16 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:v5];
    id v45 = 0;
    v17 = +[RBSProcessHandle handleForPredicate:v16 error:&v45];
    id v18 = v45;
    char v19 = v18;
    if (!v17 || v18)
    {
      FSLog_Error();
    }
    else
    {
      v44 = v6;
      CFBooleanRef v20 = [v17 currentState];
      CFBooleanRef v21 = [v20 endowmentNamespaces];
      unsigned __int8 v22 = [v21 containsObject:@"com.apple.frontboard.visibility"];

      if (v22)
      {
        if (confirm_sceneID__onceToken != -1) {
          dispatch_once(&confirm_sceneID__onceToken, &__block_literal_global);
        }
        dispatch_semaphore_wait((dispatch_semaphore_t)confirm_sceneID__sInstallDialogSemaphore, 0xFFFFFFFFFFFFFFFFLL);
        id v23 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.FontInstallViewService" viewControllerClassName:@"FontInstallMainController"];
        id v24 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
        CFRange v25 = +[NSXPCListener anonymousListener];
        serviceDelegate = self->_serviceDelegate;
        if (!serviceDelegate)
        {
          v27 = [[FontProviderViewServiceDelegate alloc] initWithFontProviderLoader:self];
          v28 = self->_serviceDelegate;
          self->_serviceDelegate = v27;

          serviceDelegate = self->_serviceDelegate;
        }
        [v25 setDelegate:serviceDelegate];
        v43 = [v25 endpoint];
        v29 = [v43 _endpoint];
        [v24 setXpcEndpoint:v29];

        id v30 = +[SBSRemoteAlertHandle newHandleWithDefinition:v23 configurationContext:v24];
        v42 = v23;
        v31 = v24;
        id v32 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
        CFStringRef v46 = @"identifier";
        id v47 = v5;
        v33 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        [v32 setUserInfo:v33];
        v34 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
        alertSemaphore = self->_alertSemaphore;
        self->_alertSemaphore = v34;

        [v25 resume];
        [v30 activateWithContext:v32];
        dispatch_semaphore_wait((dispatch_semaphore_t)self->_alertSemaphore, 0xFFFFFFFFFFFFFFFFLL);
        v36 = self->_alertSemaphore;
        self->_alertSemaphore = 0;

        dispatch_semaphore_signal((dispatch_semaphore_t)confirm_sceneID__sInstallDialogSemaphore);
        BOOL v37 = self->_result;
        p_result = &self->_result;
        v6 = v44;
        if (!v37) {
          goto LABEL_26;
        }
        goto LABEL_19;
      }
      v6 = v44;
    }
    FSLog();
    self->_result = 0;

    BOOL v15 = 0;
LABEL_27:

    goto LABEL_28;
  }
  BOOL v15 = 0;
  self->_result = 0;
LABEL_28:

  return v15;
}

void __38__FontProviderLoader_confirm_sceneID___block_invoke(id a1)
{
  confirm_sceneID__sInstallDialogSemaphore = (uint64_t)dispatch_semaphore_create(1);
  _objc_release_x1();
}

- (void)doneWithInstallFonts:(BOOL)a3
{
  NSLog(@"FontProviderLoader - done:%d", a2, a3);
  self->_result = a3;
  alertSemaphore = self->_alertSemaphore;
  if (alertSemaphore)
  {
    dispatch_semaphore_signal(alertSemaphore);
  }
}

- (BOOL)isDeviceInEduMode
{
  if (isDeviceInEduMode_onceToken != -1) {
    dispatch_once(&isDeviceInEduMode_onceToken, &__block_literal_global_169);
  }
  return isDeviceInEduMode_eduModeEnabled;
}

void __39__FontProviderLoader_isDeviceInEduMode__block_invoke(id a1)
{
  id v5 = +[UMUserManager sharedManager];
  unsigned __int8 v1 = [v5 isMultiUser];
  v2 = [v5 currentUser];
  id v3 = [v2 userType];

  if (v3 == (id)1) {
    char v4 = v1;
  }
  else {
    char v4 = 0;
  }
  isDeviceInEduMode_eduModeEnabled = v4;
}

- (id)systemContainerURL
{
  if (systemContainerURL_onceToken != -1) {
    dispatch_once(&systemContainerURL_onceToken, &__block_literal_global_172);
  }
  v2 = (void *)systemContainerURL_systemContainerUrl;
  return v2;
}

void __40__FontProviderLoader_systemContainerURL__block_invoke(id a1)
{
  uint64_t v1 = container_system_group_path_for_identifier();
  if (v1)
  {
    v2 = (void *)v1;
    uint64_t v3 = +[NSURL fileURLWithFileSystemRepresentation:v1 isDirectory:1 relativeToURL:0];
    char v4 = (void *)systemContainerURL_systemContainerUrl;
    systemContainerURL_systemContainerUrl = v3;

    free(v2);
  }
}

- (id)basePathForODRContentAssetPack
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __52__FontProviderLoader_basePathForODRContentAssetPack__block_invoke;
  block[3] = &unk_1000083C8;
  block[4] = self;
  if (basePathForODRContentAssetPack_onceToken != -1) {
    dispatch_once(&basePathForODRContentAssetPack_onceToken, block);
  }
  return (id)basePathForODRContentAssetPack_basePath;
}

uint64_t __52__FontProviderLoader_basePathForODRContentAssetPack__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isDeviceInEduMode])
  {
    v2 = [*(id *)(a1 + 32) systemContainerURL];
    uint64_t v3 = [v2 URLByAppendingPathComponent:@"Library"];
    uint64_t v4 = [v3 path];
    id v5 = (void *)basePathForODRContentAssetPack_basePath;
    basePathForODRContentAssetPack_basePath = v4;
  }
  else
  {
    v2 = (void *)basePathForODRContentAssetPack_basePath;
    basePathForODRContentAssetPack_basePath = @"/var/mobile/Library/OnDemandResources";
  }

  basePathForODRContentAssetPack_basePath = [(id)basePathForODRContentAssetPack_basePath stringByAppendingPathComponent:@"AssetPacks"];
  return _objc_release_x1();
}

- (BOOL)isOnDemandResourceFile:(id)a3
{
  uint64_t v4 = [a3 path];
  id v5 = [(FontProviderLoader *)self basePathForODRContentAssetPack];
  unsigned __int8 v6 = [v4 hasPrefix:v5];

  return v6;
}

- (BOOL)isFileURL:(id)a3 forApplicationBundlePath:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = [a3 path];
  unsigned __int8 v7 = [v6 hasPrefix:v5];

  return v7;
}

- (void)registerFonts:(id)a3 enabled:(BOOL)a4 sceneID:(id)a5 appInfo:(id)a6 completionHandler:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v39 = a6;
  id v14 = a7;
  if ([v12 count])
  {
    __int16 v52 = 0;
    id v51 = 0;
    unsigned int v15 = [(FontProviderLoader *)self currentConnectionHasFontProviderEntitlement:&v51 withSuppressDialogEntitlement:(char *)&v52 + 1 forUnitTest:&v52];
    id v16 = v51;
    v17 = 0;
    id v18 = 0;
    if (v15)
    {
      id v18 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v16 allowPlaceholder:0 error:0];
      char v19 = [v18 URL];
      CFBooleanRef v20 = normalizeURLFilePath(v19);
      v17 = [v20 path];

      if (!v17)
      {
        id v36 = v16;
        FSLog_Error();
      }
    }
    BOOL v37 = v18;
    objc_msgSend(v18, "bundleIdentifier", v36);
    CFBooleanRef v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ([v16 isEqualToString:@"com.apple.xctest"])
    {
      FSLog_Debug();

      CFBooleanRef v21 = &stru_1000087B0;
    }
    NSLog(@"FontProvider: received sceneID: %@", v13);
    id v38 = v13;
    if ((_BYTE)v52
      || v21 && (HIBYTE(v52) || !v10 || [(FontProviderLoader *)self confirm:v21 sceneID:v13]))
    {
      unsigned __int8 v22 = +[NSMutableArray arrayWithCapacity:0];
      id v23 = +[NSMutableArray arrayWithCapacity:0];
      id v24 = +[NSMutableDictionary dictionaryWithCapacity:0];
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = __78__FontProviderLoader_registerFonts_enabled_sceneID_appInfo_completionHandler___block_invoke;
      v43[3] = &unk_100008418;
      BOOL v49 = v10;
      id v25 = v22;
      id v44 = v25;
      id v45 = v24;
      char v50 = v52;
      id v46 = v17;
      id v47 = self;
      id v48 = v23;
      id v26 = v23;
      id v27 = v24;
      [v12 enumerateObjectsUsingBlock:v43];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = __78__FontProviderLoader_registerFonts_enabled_sceneID_appInfo_completionHandler___block_invoke_3;
      v40[3] = &unk_100008440;
      id v41 = v25;
      id v42 = v14;
      id v28 = v25;
      BOOL v29 = v10;
      id v30 = v39;
      +[FSUserFontManager installFonts:v26 forIdentifier:v16 enabled:v29 appInfo:v39 completionHandler:v40];
    }
    else
    {
      v31 = (char *)[v12 count];
      id v27 = +[NSMutableArray arrayWithCapacity:v31];
      if (v31)
      {
        for (i = 0; i != v31; ++i)
        {
          v33 = +[NSNumber numberWithUnsignedInteger:i];
          [v27 addObject:v33];
        }
      }
      if (v21) {
        uint64_t v34 = 8;
      }
      else {
        uint64_t v34 = 2;
      }
      CFStringRef v54 = @"FontProviderErrorUserInfoFontInfoParameterIndexesKey";
      id v55 = v27;
      v35 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      id v26 = +[NSError errorWithDomain:@"FontProviderErrorDomain" code:v34 userInfo:v35];

      id v53 = v26;
      id v28 = +[NSArray arrayWithObjects:&v53 count:1];
      (*((void (**)(id, id, void))v14 + 2))(v14, v28, 0);
      id v30 = v39;
    }

    id v13 = v38;
  }
  else
  {
    (*((void (**)(id, void, void))v14 + 2))(v14, 0, 0);
    id v30 = v39;
  }
}

void __78__FontProviderLoader_registerFonts_enabled_sceneID_appInfo_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 objectForKey:@"NSCTFontFileURLAttribute"];
  unsigned __int8 v7 = (void *)v6;
  if (*(unsigned char *)(a1 + 72)) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    CFStringRef v39 = @"FontProviderErrorUserInfoFontInfoParameterIndexesKey";
    CFArrayRef v11 = +[NSNumber numberWithUnsignedInteger:a3];
    id v38 = v11;
    id v12 = +[NSArray arrayWithObjects:&v38 count:1];
    v40 = v12;
    id v13 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    id v9 = +[NSError errorWithDomain:@"FontProviderErrorDomain" code:7 userInfo:v13];

    id v14 = *(void **)(a1 + 32);
  }
  else
  {
    if (v6)
    {
      id v9 = [*(id *)(a1 + 40) objectForKey:v6];
      if (v9)
      {
        BOOL v10 = +[NSNumber numberWithUnsignedInteger:a3];
        [v9 addObject:v10];
LABEL_8:

LABEL_15:
        CFStringRef v36 = @"FontProviderErrorUserInfoFontInfoParameterIndexesKey";
        v17 = +[NSNumber numberWithUnsignedInteger:a3];
        v35 = v17;
        id v18 = +[NSArray arrayWithObjects:&v35 count:1];
        BOOL v37 = v18;
        char v19 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        CFBooleanRef v20 = +[NSError errorWithDomain:@"FontProviderErrorDomain" code:3 userInfo:v19];

        [*(id *)(a1 + 32) addObject:v20];
LABEL_16:

        goto LABEL_17;
      }
      if (![v7 isFileURL]) {
        goto LABEL_15;
      }
      if (*(unsigned char *)(a1 + 73))
      {
        BOOL v10 = normalizeURLFilePath(v7);
      }
      else
      {
        CFBooleanRef v21 = [v5 objectForKey:@"CTFontIgnoreURLLocationAttribute"];
        unsigned __int8 v22 = [v21 BOOLValue];

        BOOL v10 = normalizeURLFilePath(v7);
        if ((v22 & 1) == 0
          && (!*(void *)(a1 + 48)
           || (objc_msgSend(*(id *)(a1 + 56), "isFileURL:forApplicationBundlePath:", v10) & 1) == 0)
          && ![*(id *)(a1 + 56) isOnDemandResourceFile:v10])
        {
          goto LABEL_8;
        }
      }
      CFBooleanRef v20 = objc_opt_new();
      id v23 = +[NSNumber numberWithUnsignedInteger:a3];
      [v20 addObject:v23];

      [*(id *)(a1 + 40) setObject:v20 forKey:v7];
      id v24 = [v5 mutableCopy];
      [v24 setObject:v20 forKey:@"parameterIndexes"];
      id v25 = [v5 objectForKey:@"sandbox"];
      id v28 = _NSConcreteStackBlock;
      uint64_t v29 = 3221225472;
      id v30 = __78__FontProviderLoader_registerFonts_enabled_sceneID_appInfo_completionHandler___block_invoke_2;
      v31 = &unk_1000083F0;
      id v32 = v10;
      id v33 = v24;
      id v26 = v24;
      id v27 = v10;
      RunBlockWithSandboxExtension(v25, &v28);

      objc_msgSend(*(id *)(a1 + 64), "addObject:", v26, v28, v29, v30, v31);
      goto LABEL_16;
    }
    id v9 = [v5 mutableCopy];
    unsigned int v15 = +[NSNumber numberWithUnsignedInteger:a3];
    uint64_t v34 = v15;
    id v16 = +[NSArray arrayWithObjects:&v34 count:1];
    [v9 setObject:v16 forKey:@"parameterIndexes"];

    [v9 removeObjectForKey:@"sandbox"];
    id v14 = *(void **)(a1 + 64);
  }
  [v14 addObject:v9];
LABEL_17:
}

void __78__FontProviderLoader_registerFonts_enabled_sceneID_appInfo_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) path];
  [v2 UTF8String];

  +[FSUserFontManager auditToken];
  uint64_t v3 = (const char *)sandbox_extension_issue_file_to_process();
  if (v3
    && (+[NSData dataWithBytesNoCopy:v3 length:strlen(v3) + 1 freeWhenDone:1], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = (void *)v4;
    [*(id *)(a1 + 40) setValue:v4 forKey:@"sandbox"];
  }
  else
  {
    [*(id *)(a1 + 40) removeObjectForKey:@"sandbox"];
  }
}

void __78__FontProviderLoader_registerFonts_enabled_sceneID_appInfo_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7) {
    [*(id *)(a1 + 32) addObjectsFromArray:v7];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, *(void *)(a1 + 32), v5);
  }
}

- (void)unregisterFonts:(id)a3 appInfo:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v31 = 0;
  id v30 = 0;
  unsigned int v11 = [(FontProviderLoader *)self currentConnectionHasFontProviderEntitlement:&v30 withSuppressDialogEntitlement:0 forUnitTest:&v31];
  id v12 = v30;
  if (v11)
  {
    id v13 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v12 allowPlaceholder:0 error:0];
    id v14 = [v13 URL];
    unsigned int v15 = [v14 path];

    BOOL v16 = v15 == 0;
  }
  else
  {
    BOOL v16 = 1;
  }
  if (v31 || !v16)
  {
    id v24 = +[NSMutableArray arrayWithCapacity:0];
    +[NSMutableArray arrayWithCapacity:0];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = __64__FontProviderLoader_unregisterFonts_appInfo_completionHandler___block_invoke;
    v28[3] = &unk_100008468;
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = v29;
    [v8 enumerateObjectsUsingBlock:v28];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __64__FontProviderLoader_unregisterFonts_appInfo_completionHandler___block_invoke_2;
    v25[3] = &unk_100008440;
    id v26 = v24;
    id v27 = v10;
    id v22 = v24;
    +[FSUserFontManager uninstallFonts:v18 forIdentifier:v12 appInfo:v9 completionHandler:v25];

    id v23 = v29;
  }
  else
  {
    v17 = (char *)[v8 count];
    id v18 = +[NSMutableArray arrayWithCapacity:v17];
    if (v17)
    {
      for (i = 0; i != v17; ++i)
      {
        CFBooleanRef v20 = +[NSNumber numberWithUnsignedInteger:i];
        [v18 addObject:v20];
      }
    }
    CFStringRef v33 = @"FontProviderErrorUserInfoFontInfoParameterIndexesKey";
    id v34 = v18;
    CFBooleanRef v21 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    id v22 = +[NSError errorWithDomain:@"FontProviderErrorDomain" code:2 userInfo:v21];

    id v32 = v22;
    id v23 = +[NSArray arrayWithObjects:&v32 count:1];
    (*((void (**)(id, id, void))v10 + 2))(v10, v23, 0);
  }
}

void __64__FontProviderLoader_unregisterFonts_appInfo_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 mutableCopy];
  uint64_t v6 = +[NSNumber numberWithUnsignedInteger:a3];
  id v8 = v6;
  id v7 = +[NSArray arrayWithObjects:&v8 count:1];
  [v5 setObject:v7 forKey:@"parameterIndexes"];

  [*(id *)(a1 + 32) addObject:v5];
}

void __64__FontProviderLoader_unregisterFonts_appInfo_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7) {
    [*(id *)(a1 + 32) addObjectsFromArray:v7];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, *(void *)(a1 + 32), v5);
  }
}

- (id)fontDescriptorAttributesArrayFromFontInfoDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKey:@"providedInfo"];
  id v5 = [v4 objectForKey:@"CTFontRegistrationUserInfoAttribute"];
  uint64_t v6 = [v4 objectForKey:@"NSCTFontFileURLAttribute"];
  id v7 = [v3 objectForKey:@"familyName"];

  if (v7)
  {
    id v8 = +[NSMutableArray arrayWithCapacity:0];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __74__FontProviderLoader_fontDescriptorAttributesArrayFromFontInfoDictionary___block_invoke;
    v13[3] = &unk_100008490;
    id v14 = v5;
    id v15 = v6;
    id v9 = v8;
    id v16 = v9;
    [v7 enumerateKeysAndObjectsUsingBlock:v13];
    id v10 = v16;
    id v11 = v9;
  }
  else
  {
    id v11 = &__NSArray0__struct;
  }

  return v11;
}

void __74__FontProviderLoader_fontDescriptorAttributesArrayFromFontInfoDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v9 = +[NSMutableDictionary dictionaryWithCapacity:0];
  [v9 setObject:v5 forKey:@"NSFontFamilyAttribute"];

  [v9 setObject:v6 forKey:@"NSFontNameAttribute"];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    [v9 setObject:v7 forKey:@"CTFontRegistrationUserInfoAttribute"];
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    [v9 setObject:v8 forKey:@"NSCTFontFileURLAttribute"];
  }
  [*(id *)(a1 + 48) addObject:v9];
}

- (void)registeredFontsInfo:(BOOL)a3 appInfo:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  char v25 = 0;
  id v24 = 0;
  unsigned __int8 v10 = [(FontProviderLoader *)self currentConnectionHasFontProviderEntitlement:&v24 withSuppressDialogEntitlement:0 forUnitTest:&v25];
  id v11 = v24;
  if (v10)
  {
    id v12 = +[FSUserFontManager registeredFontsInfoForIdentifier:v11 enabled:v6 appInfo:v8];
    id v13 = +[NSMutableArray arrayWithCapacity:0];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v14 = v12;
    id v15 = [v14 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        id v18 = 0;
        do
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          char v19 = -[FontProviderLoader fontDescriptorAttributesArrayFromFontInfoDictionary:](self, "fontDescriptorAttributesArrayFromFontInfoDictionary:", *(void *)(*((void *)&v20 + 1) + 8 * (void)v18), (void)v20);
          [v13 addObjectsFromArray:v19];

          id v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v16);
    }

    v9[2](v9, v13);
  }
  else
  {
    v9[2](v9, 0);
  }
}

- (void)ping:(id)a3
{
}

- (void)updateAppInfo:(id)a3
{
  id v4 = a3;
  char v8 = 0;
  id v7 = 0;
  unsigned int v5 = [(FontProviderLoader *)self currentConnectionHasFontProviderEntitlement:&v7 withSuppressDialogEntitlement:0 forUnitTest:&v8];
  id v6 = v7;
  if (v5) {
    +[FSUserFontManager updateAppInfo:v4 forIdentifier:v6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceDelegate, 0);
  objc_storeStrong((id *)&self->_alertSemaphore, 0);
}

@end