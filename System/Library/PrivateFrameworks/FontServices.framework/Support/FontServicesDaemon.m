@interface FontServicesDaemon
+ (id)sharedDaemon;
- (BOOL)isAuditTokenSandboxed:(id *)a3;
- (BOOL)isCurrentConnectionFontPicker;
- (BOOL)isIdentifierAllowedForFontEnumeration:(id)a3;
- (BOOL)isKnownFamilyName:(id)a3 withEnabledState:(BOOL *)a4;
- (BOOL)isUserFontInstalled;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (FBSDisplayLayoutMonitor)displayLayoutMonitor;
- (FontServicesDaemon)init;
- (NSArray)fontEnumerationProhibitedInfo;
- (NSDictionary)userFontsInfo;
- (OS_dispatch_queue)assetHandlerQueue;
- (OS_dispatch_queue)mainHandlerQueue;
- (OS_dispatch_queue)scheduledFontDeletionQueue;
- (OS_dispatch_queue)subscriptionSupportQueue;
- (OS_dispatch_source)fontAssetsAccessTimer;
- (OS_dispatch_source)scheduledFontDeletionTimer;
- (id)_userFontsInfoFromDisk;
- (id)displayLayoutMonitorWithHandler:(id)a3;
- (id)filterUserFontInfoForAuditToken:(id *)a3 withEnumerationCapability:(BOOL)a4 withFilter:(id)a5;
- (id)fontInfoForAuditToken:(id *)a3 withFontAccess:(BOOL)a4 enumuration:(BOOL)a5 installation:(BOOL)a6 identifier:(id)a7 andFileFilters:(id)a8 foundFontDirectoryName:(id *)a9;
- (id)identifierFromFilePath:(id)a3;
- (id)issuedFontFilePathsForIdentifier:(id)a3;
- (id)knownFamilyNameFromPostScriptName:(id)a3 withEnabledState:(BOOL *)a4;
- (id)missingFontsDialogRequestsFromDisabledFamilyNames:(id)a3;
- (id)missingFontsDialogRequestsFromUnknownFontNames:(id)a3;
- (id)providerIdentifiersAndFamilyName:(id *)a3 fromPostScriptName:(id)a4;
- (id)providerIdentifiersFromFamilyName:(id)a3;
- (id)sandboxExtensionForEnumeration:(id *)a3;
- (id)sandboxExtensionForFontAssets:(id *)a3;
- (id)sandboxExtensionForProvider:(id *)a3 withDirectoryName:(id)a4;
- (id)sanitizeIssuedFontPaths:(id)a3;
- (id)unknownFontNamesAndEnabledFamilyNames:(id *)a3 andDisabledFamilyNames:(id *)a4 fromRequests:(id)a5;
- (unint64_t)countFontAssets;
- (void)accessFontAsset:(id)a3;
- (void)analyticsEventRequestFonts:(id)a3 misses:(unint64_t)a4 suggestions:(unint64_t)a5 resolved:(unint64_t)a6;
- (void)capabilitiesFor:(id *)a3 allowEnumerate:(BOOL *)a4 allowUserFonts:(BOOL *)a5 allowInstallation:(BOOL *)a6 andIdentifier:(id *)a7;
- (void)executeScheduledFontFilesDeletion:(id)a3;
- (void)extractRequestFontsMissed:(unint64_t *)a3 andResolved:(unint64_t *)a4;
- (void)fontChanged:(id)a3 reply:(id)a4;
- (void)forgetClientApplication:(id)a3;
- (void)invalidateUserFonts;
- (void)recordIssuedFontPaths:(id)a3 forIdentifier:(id)a4;
- (void)recordRequestFontsResultWihtMissed:(BOOL)a3 andResolved:(BOOL)a4;
- (void)recordSuspendedProvider:(id)a3 url:(id)a4 andScheme:(id)a5 forDate:(id)a6;
- (void)recordWarnedForIdenntifier:(id)a3;
- (void)removeObsoleteFontAsset;
- (void)requestFonts:(id)a3 forClient:(id)a4 reply:(id)a5;
- (void)requestFonts:(id)a3 sceneID:(id)a4 reply:(id)a5;
- (void)resetIssuedFontsFor:(id)a3 reply:(id)a4;
- (void)resetWarnedForIdenntifier:(id)a3;
- (void)resumeAndShowAlertForSuspendedFontProviders:(id)a3;
- (void)run;
- (void)scheduleFontFilesDeletion:(id)a3;
- (void)setDisplayLayoutMonitor:(id)a3;
- (void)setFontEnumerationProhibitedInfo:(id)a3;
- (void)setFontFilesDeletionTimer:(unsigned int)a3;
- (void)setUserFontsInfo:(id)a3;
- (void)setup;
- (void)setupForAssetNotifications;
- (void)setupForDistributedNotifications;
- (void)setupForMonitoringFontAssets;
- (void)setupForProfileFonts;
- (void)setupForScheduledFontDeletion;
- (void)setupForXPCService;
- (void)setupUserInstalledFontsFor:(id *)a3 withCapabilitiesFor:(id *)a4 hasEnumeration:(BOOL)a5 hasFontAccess:(BOOL)a6 isFontProvider:(BOOL)a7 processIdentifier:(id)a8 options:(id)a9 compat:(BOOL *)a10 reply:(id)a11;
- (void)showDialog:(id)a3 forPID:(int)a4 sceneID:(id)a5 appID:(id)a6 completionHandler:(id)a7;
- (void)stopFontFilesDeletionTimer;
- (void)subscriptionSupportTimerHandler;
- (void)synchronizeFontAssets:(id)a3 reply:(id)a4;
- (void)synchronizeFontProviders;
- (void)updatingUserFonts:(id)a3;
- (void)warnAboutSuspendedFontProvider:(id)a3 forExpiration:(BOOL)a4 date:(id)a5 withURLSchem:(id)a6 immediately:(BOOL)a7;
- (void)warnAboutSuspendedFontProviders:(id)a3;
@end

@implementation FontServicesDaemon

- (void)capabilitiesFor:(id *)a3 allowEnumerate:(BOOL *)a4 allowUserFonts:(BOOL *)a5 allowInstallation:(BOOL *)a6 andIdentifier:(id *)a7
{
  long long v12 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)v28.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&v28.val[4] = v12;
  v13 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v28);
  if (v13)
  {
    v14 = v13;
    CFArrayRef v15 = (const __CFArray *)SecTaskCopyValueForEntitlement(v13, @"com.apple.developer.user-fonts", 0);
    if (v15)
    {
      CFArrayRef v16 = v15;
      CFTypeID v17 = CFGetTypeID(v15);
      if (v17 == CFArrayGetTypeID())
      {
        CFIndex Count = CFArrayGetCount(v16);
        v29.location = 0;
        v29.length = Count;
        BOOL v19 = CFArrayContainsValue(v16, v29, @"font-enumeration") != 0;
        v30.location = 0;
        v30.length = Count;
        BOOL v20 = CFArrayContainsValue(v16, v30, @"system-installation") != 0;
        v31.location = 0;
        v31.length = Count;
        BOOL v21 = CFArrayContainsValue(v16, v31, @"app-usage") != 0;
      }
      else
      {
        BOOL v20 = 0;
        BOOL v21 = 0;
        BOOL v19 = 0;
      }
      CFRelease(v16);
    }
    else
    {
      BOOL v20 = 0;
      BOOL v21 = 0;
      BOOL v19 = 0;
    }
    v24 = (__CFString *)SecTaskCopySigningIdentifier(v14, 0);
    v23 = v24;
    if (v19)
    {
      if (!v24)
      {
        BOOL v22 = 0;
        goto LABEL_15;
      }
      unsigned __int8 v26 = [(FontServicesDaemon *)self isIdentifierAllowedForFontEnumeration:v24];
    }
    else
    {
      unsigned __int8 v26 = sub_100004B78(v24, v25);
    }
    BOOL v22 = v26;
LABEL_15:
    CFRelease(v14);
    goto LABEL_16;
  }
  BOOL v22 = 0;
  BOOL v20 = 0;
  BOOL v21 = 0;
  v23 = 0;
LABEL_16:
  *a4 = v22;
  *a5 = v21;
  *a6 = v20;
  v27 = v23;
  *a7 = v27;
}

- (id)filterUserFontInfoForAuditToken:(id *)a3 withEnumerationCapability:(BOOL)a4 withFilter:(id)a5
{
  id v8 = a5;
  v9 = +[NSMutableDictionary dictionaryWithCapacity:0];
  long long v10 = *(_OWORD *)&a3->var0[4];
  v22[0] = *(_OWORD *)a3->var0;
  v22[1] = v10;
  unsigned __int8 v11 = [(FontServicesDaemon *)self isAuditTokenSandboxed:v22];
  long long v12 = [(FontServicesDaemon *)self userFontsInfo];
  if (v12)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100005174;
    v15[3] = &unk_1000186A8;
    id v17 = v8;
    unsigned __int8 v20 = v11;
    BOOL v21 = a4;
    long long v13 = *(_OWORD *)&a3->var0[4];
    long long v18 = *(_OWORD *)a3->var0;
    long long v19 = v13;
    id v16 = v9;
    [v12 enumerateKeysAndObjectsUsingBlock:v15];
  }
  return v9;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v5 = qword_10001DE38;
  id v6 = a4;
  if (v5 != -1) {
    dispatch_once(&qword_10001DE38, &stru_100018658);
  }
  [v6 setExportedInterface:qword_10001DE28];
  v7 = [[FontServicesHandler alloc] initWithFontServivesDaemon:self];
  [v6 setExportedObject:v7];
  [v6 setRemoteObjectInterface:qword_10001DE30];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005168;
  v10[3] = &unk_100018680;
  unsigned __int8 v11 = v7;
  id v8 = v7;
  [v6 setInvalidationHandler:v10];
  [(FontServicesHandler *)v8 setClientConnection:v6];
  [v6 resume];

  return 1;
}

- (void)setupUserInstalledFontsFor:(id *)a3 withCapabilitiesFor:(id *)a4 hasEnumeration:(BOOL)a5 hasFontAccess:(BOOL)a6 isFontProvider:(BOOL)a7 processIdentifier:(id)a8 options:(id)a9 compat:(BOOL *)a10 reply:(id)a11
{
  BOOL v12 = a6;
  id v16 = a8;
  id v17 = a9;
  id v18 = a11;
  if (a5 || a7 || v12)
  {
    v27 = [(FontServicesDaemon *)self mainHandlerQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    long long v28 = *(_OWORD *)&a3->var0[4];
    long long v42 = *(_OWORD *)a3->var0;
    block[2] = sub_100005C0C;
    block[3] = &unk_100018720;
    BOOL v44 = a5;
    BOOL v45 = a7;
    block[4] = self;
    long long v43 = v28;
    BOOL v46 = v12;
    id v40 = v16;
    id v41 = v18;
    dispatch_sync(v27, block);

    goto LABEL_17;
  }
  long long v19 = [v17 objectForKeyedSubscript:@"compat1"];
  unsigned int v20 = [v19 BOOLValue];

  if (!v20)
  {
LABEL_11:
    (*((void (**)(id, void))v18 + 2))(v18, 0);
    goto LABEL_17;
  }
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_100005F2C;
  v37 = sub_100005F3C;
  id v38 = 0;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100005F44;
  v30[3] = &unk_100018748;
  v32 = &v33;
  id v31 = v16;
  long long v21 = *(_OWORD *)&a3->var0[4];
  v29[0] = *(_OWORD *)a3->var0;
  v29[1] = v21;
  BOOL v22 = [(FontServicesDaemon *)self filterUserFontInfoForAuditToken:v29 withEnumerationCapability:0 withFilter:v30];
  if (![v22 count])
  {

    _Block_object_dispose(&v33, 8);
    goto LABEL_11;
  }
  v23 = objc_opt_new();
  [v23 setObject:v22 forKey:@"fontsInfo"];
  [v23 setObject:&__kCFBooleanTrue forKey:@"hide-profilefonts"];
  if (v34[5])
  {
    uint64_t v24 = +[NSFileHandle fileHandleForReadingAtPath:](NSFileHandle, "fileHandleForReadingAtPath:");
    v25 = (void *)v24;
    if (v24)
    {
      uint64_t v47 = v34[5];
      uint64_t v48 = v24;
      unsigned __int8 v26 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      [v23 setObject:v26 forKey:@"fontData"];
    }
    else
    {
      FSLog_Error();
    }
  }
  (*((void (**)(id, void *))v18 + 2))(v18, v23);
  if (a10) {
    *a10 = 1;
  }

  _Block_object_dispose(&v33, 8);
LABEL_17:
}

- (NSDictionary)userFontsInfo
{
  if ([(FontServicesDaemon *)self isUserFontInstalled]) {
    v3 = self->_userFontsInfo;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isUserFontInstalled
{
  userFontsInfo = self->_userFontsInfo;
  if (!userFontsInfo)
  {
    v4 = [(FontServicesDaemon *)self _userFontsInfoFromDisk];
    uint64_t v5 = self->_userFontsInfo;
    self->_userFontsInfo = v4;

    userFontsInfo = self->_userFontsInfo;
    if (!userFontsInfo)
    {
      self->_userFontsInfo = (NSDictionary *)&__NSDictionary0__struct;

      userFontsInfo = self->_userFontsInfo;
    }
  }
  return [(NSDictionary *)userFontsInfo count] != 0;
}

- (BOOL)isAuditTokenSandboxed:(id *)a3
{
  return sandbox_check_by_audit_token() != 0;
}

- (FontServicesDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)FontServicesDaemon;
  v2 = [(FontServicesDaemon *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.fontservicesd", 0);
    mainHandlerQueue = v2->_mainHandlerQueue;
    v2->_mainHandlerQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)sharedDaemon
{
  if (qword_10001DE20 != -1) {
    dispatch_once(&qword_10001DE20, &stru_100018638);
  }
  v2 = (void *)qword_10001DE18;
  return v2;
}

- (void)invalidateUserFonts
{
  self->_userFontsInfo = 0;
  _objc_release_x1();
}

- (BOOL)isIdentifierAllowedForFontEnumeration:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(FontServicesDaemon *)self fontEnumerationProhibitedInfo];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) objectForKey:v4];
        if (v10)
        {
          id v11 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];
          BOOL v12 = [v11 shortVersionString];
          if ([v10 containsObject:v12])
          {
            NSLog(@"This process is not allowed to enumerate fonts - %@", v4);

            BOOL v13 = 0;
            goto LABEL_13;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_13:

  return v13;
}

- (BOOL)isCurrentConnectionFontPicker
{
  v2 = +[NSXPCConnection currentConnection];
  dispatch_queue_t v3 = v2;
  if (v2) {
    [v2 auditToken];
  }
  else {
    memset(&v9, 0, sizeof(v9));
  }
  id v4 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v9);

  if (!v4) {
    return 0;
  }
  CFStringRef v5 = SecTaskCopySigningIdentifier(v4, 0);
  if (v5)
  {
    CFStringRef v6 = v5;
    if (CFEqual(v5, @"com.apple.UIKit.FontPickerUIService")) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = CFEqual(v6, @"com.apple.UIKit.FontPicker") != 0;
    }
    CFRelease(v6);
  }
  else
  {
    BOOL v7 = 0;
  }
  CFRelease(v4);
  return v7;
}

- (id)sandboxExtensionForEnumeration:(id *)a3
{
  $115C4C562B26FF47E01F9F4EA65B5887 v5 = *a3;
  dispatch_queue_t v3 = (char *)sandbox_extension_issue_file_to_process();
  if (v3)
  {
    +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v3, strlen(v3) + 1, 1, *(_OWORD *)v5.var0, *(_OWORD *)&v5.var0[4]);
    dispatch_queue_t v3 = (char *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)sandboxExtensionForFontAssets:(id *)a3
{
  sub_10000EE6C();
  id v3 = objc_claimAutoreleasedReturnValue();
  id v7 = [v3 UTF8String];
  if (sandbox_check_by_audit_token())
  {
    id v4 = (const char *)sandbox_extension_issue_file_to_process();
    $115C4C562B26FF47E01F9F4EA65B5887 v5 = (void *)v4;
    if (v4)
    {
      $115C4C562B26FF47E01F9F4EA65B5887 v5 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v4, strlen(v4) + 1, 1, v7);
    }
  }
  else
  {
    $115C4C562B26FF47E01F9F4EA65B5887 v5 = 0;
  }

  return v5;
}

- (id)sandboxExtensionForProvider:(id *)a3 withDirectoryName:(id)a4
{
  id v4 = +[NSString stringWithFormat:@"/var/mobile/Library/UserFonts/FontFiles/%@", a4];
  id v5 = [v4 UTF8String];
  if (v5 && (id v9 = v5, sandbox_check_by_audit_token()))
  {
    CFStringRef v6 = (const char *)sandbox_extension_issue_file_to_process();
    id v7 = (void *)v6;
    if (v6)
    {
      id v7 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v6, strlen(v6) + 1, 1, v9);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)fontInfoForAuditToken:(id *)a3 withFontAccess:(BOOL)a4 enumuration:(BOOL)a5 installation:(BOOL)a6 identifier:(id)a7 andFileFilters:(id)a8 foundFontDirectoryName:(id *)a9
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v15 = a7;
  id v16 = a8;
  long long v17 = 0;
  if (v15 && v10 && !v11)
  {
    long long v17 = +[FSUserFontManager directoryNameFromIdentifier:v15];
  }
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100005AE0;
  v24[3] = &unk_1000186D0;
  id v18 = v16;
  id v25 = v18;
  BOOL v28 = v11;
  BOOL v29 = v10;
  id v19 = v17;
  id v26 = v19;
  v27 = &v31;
  BOOL v30 = a4;
  long long v20 = *(_OWORD *)&a3->var0[4];
  v23[0] = *(_OWORD *)a3->var0;
  v23[1] = v20;
  long long v21 = [(FontServicesDaemon *)self filterUserFontInfoForAuditToken:v23 withEnumerationCapability:v11 withFilter:v24];
  if (a9 && *((unsigned char *)v32 + 24)) {
    *a9 = v19;
  }

  _Block_object_dispose(&v31, 8);
  return v21;
}

- (id)knownFamilyNameFromPostScriptName:(id)a3 withEnabledState:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  BOOL v22 = sub_100005F2C;
  v23 = sub_100005F3C;
  id v24 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v7 = [(FontServicesDaemon *)self userFontsInfo];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000627C;
  v11[3] = &unk_100018770;
  id v8 = v6;
  id v12 = v8;
  BOOL v13 = &v19;
  v14 = &v15;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];
  if (a4) {
    *a4 = *((unsigned char *)v16 + 24);
  }
  id v9 = (id)v20[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

- (BOOL)isKnownFamilyName:(id)a3 withEnabledState:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v7 = [(FontServicesDaemon *)self userFontsInfo];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000648C;
  v11[3] = &unk_100018770;
  id v8 = v6;
  id v12 = v8;
  BOOL v13 = &v19;
  v14 = &v15;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];
  if (a4) {
    *a4 = *((unsigned char *)v16 + 24);
  }
  char v9 = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

- (id)unknownFontNamesAndEnabledFamilyNames:(id *)a3 andDisabledFamilyNames:(id *)a4 fromRequests:(id)a5
{
  id v6 = a5;
  uint64_t v33 = +[NSMutableSet setWithCapacity:0];
  v32 = +[NSMutableSet setWithCapacity:0];
  BOOL v30 = +[NSMutableSet setWithCapacity:0];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v36;
    uint64_t v10 = _kCTFontFamilyNameAttribute;
    uint64_t v11 = _kCTFontNameAttribute;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        BOOL v13 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v12);
        v14 = [v13 objectForKey:v10];
        char v34 = 0;
        if (v14
          && [(FontServicesDaemon *)self isKnownFamilyName:v14 withEnabledState:&v34])
        {
          if (v34) {
            uint64_t v15 = v33;
          }
          else {
            uint64_t v15 = v32;
          }
          [v15 addObject:v14];
          char v16 = 1;
        }
        else
        {
          char v16 = 0;
        }
        uint64_t v17 = [v13 objectForKey:v11];
        if (v17)
        {
          uint64_t v18 = [(FontServicesDaemon *)self knownFamilyNameFromPostScriptName:v17 withEnabledState:&v34];
          if (!v18)
          {
            if (v16) {
              goto LABEL_28;
            }
            if (v14)
            {
LABEL_26:
              char v22 = v30;
              v23 = v14;
            }
            else
            {
              char v22 = v30;
              v23 = v17;
            }
            [v22 addObject:v23];
            goto LABEL_28;
          }
          uint64_t v19 = (void *)v18;
          if (v34) {
            long long v20 = v33;
          }
          else {
            long long v20 = v32;
          }
          [v20 addObject:v19];
        }
        else
        {
          if (v14) {
            char v21 = v16;
          }
          else {
            char v21 = 1;
          }
          if ((v21 & 1) == 0) {
            goto LABEL_26;
          }
        }
LABEL_28:

        id v12 = (char *)v12 + 1;
      }
      while (v8 != v12);
      id v24 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      id v8 = v24;
    }
    while (v24);
  }

  if (a3)
  {
    *a3 = [v33 allObjects];
  }
  if (a4)
  {
    [v32 minusSet:v33];
    *a4 = [v32 allObjects];
  }
  id v25 = [v30 allObjects];
  id v26 = [v25 sortedArrayUsingSelector:"compare:"];

  return v26;
}

- (id)identifierFromFilePath:(id)a3
{
  id v3 = [a3 stringByDeletingLastPathComponent];
  id v4 = [v3 lastPathComponent];

  id v5 = +[FSUserFontManager identifierFromDirectoryName:v4];

  return v5;
}

- (id)providerIdentifiersFromFamilyName:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet setWithCapacity:0];
  id v6 = [(FontServicesDaemon *)self userFontsInfo];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000069A4;
  v12[3] = &unk_100018798;
  id v13 = v4;
  v14 = self;
  id v7 = v5;
  id v15 = v7;
  id v8 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];
  uint64_t v9 = v15;
  id v10 = v7;

  return v10;
}

- (id)providerIdentifiersAndFamilyName:(id *)a3 fromPostScriptName:(id)a4
{
  id v6 = a4;
  id v7 = +[NSMutableSet setWithCapacity:0];
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = sub_100005F2C;
  v23 = sub_100005F3C;
  id v24 = 0;
  id v8 = [(FontServicesDaemon *)self userFontsInfo];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100006BE0;
  v14[3] = &unk_1000187E8;
  id v9 = v6;
  uint64_t v18 = &v19;
  id v15 = v9;
  char v16 = self;
  id v10 = v7;
  id v17 = v10;
  [v8 enumerateKeysAndObjectsUsingBlock:v14];
  *a3 = (id) v20[5];
  uint64_t v11 = v17;
  id v12 = v10;

  _Block_object_dispose(&v19, 8);
  return v12;
}

- (id)missingFontsDialogRequestsFromDisabledFamilyNames:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionaryWithCapacity:0];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      id v10 = 0;
      id v23 = v8;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v10);
        id v12 = -[FontServicesDaemon providerIdentifiersFromFamilyName:](self, "providerIdentifiersFromFamilyName:", v11, v23);
        if (v12)
        {
          id v13 = [v5 objectForKey:v11];
          v14 = v13;
          if (v13)
          {
            id v15 = [v13 objectForKey:@"providers"];
            [v15 unionSet:v12];
          }
          else
          {
            id v15 = +[NSMutableDictionary dictionaryWithCapacity:0];
            [v15 setObject:v11 forKey:@"displayName"];
            uint64_t v16 = v9;
            id v17 = self;
            uint64_t v18 = v5;
            id v19 = v6;
            id v20 = [v12 mutableCopy];
            [v15 setObject:v20 forKey:@"providers"];

            id v6 = v19;
            id v5 = v18;
            self = v17;
            uint64_t v9 = v16;
            id v8 = v23;
            [v15 setObject:v11 forKey:@"uniqueID"];
            [v5 setObject:v15 forKey:v11];
          }
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }

  +[NSMutableArray arrayWithCapacity:0];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100007028;
  v24[3] = &unk_100018810;
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v25 = v21;
  [v5 enumerateKeysAndObjectsUsingBlock:v24];

  return v21;
}

- (id)missingFontsDialogRequestsFromUnknownFontNames:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray arrayWithCapacity:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v17[0] = @"displayName";
        v17[1] = @"providers";
        v18[0] = v10;
        v18[1] = &__NSArray0__struct;
        uint64_t v11 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2, (void)v13);
        [v4 addObject:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)showDialog:(id)a3 forPID:(int)a4 sceneID:(id)a5 appID:(id)a6 completionHandler:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  long long v15 = (void (**)(id, void *))a7;
  long long v16 = +[RBSProcessIdentifier identifierWithPid:v10];
  id v34 = 0;
  id v17 = +[RBSProcessHandle handleForIdentifier:v16 error:&v34];
  id v18 = v34;

  if (v17) {
    BOOL v19 = v18 == 0;
  }
  else {
    BOOL v19 = 0;
  }
  if (!v19) {
    goto LABEL_9;
  }
  id v20 = [v17 currentState];
  [v20 endowmentNamespaces];
  id v21 = v17;
  char v22 = v15;
  id v23 = v18;
  id v24 = v14;
  id v25 = v13;
  long long v26 = self;
  long long v28 = v27 = v12;
  unsigned __int8 v29 = [v28 containsObject:@"com.apple.frontboard.visibility"];

  id v12 = v27;
  BOOL v30 = v26;
  id v13 = v25;
  id v14 = v24;
  id v18 = v23;
  long long v15 = v22;
  id v17 = v21;

  if ((v29 & 1) == 0)
  {
LABEL_9:
    FSLog();
    goto LABEL_10;
  }
  if (!objc_opt_class())
  {
LABEL_10:
    v15[2](v15, &__NSArray0__struct);
    goto LABEL_11;
  }
  uint64_t v31 = [[MissingFontsDialogHandler alloc] initWithFontServicesDaemon:v30 completionHandler:v15];
  missingFontsDialogHandler = v30->_missingFontsDialogHandler;
  v30->_missingFontsDialogHandler = v31;

  CFStringRef v35 = @"fonts";
  id v36 = v12;
  uint64_t v33 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  [(MissingFontsDialogHandler *)v30->_missingFontsDialogHandler showDialogWithUserInfo:v33 sceneID:v13 appID:v14];

LABEL_11:
}

- (id)sanitizeIssuedFontPaths:(id)a3
{
  id v4 = a3;
  id v5 = [(FontServicesDaemon *)self userFontsInfo];
  id v6 = [v5 allKeys];
  id v7 = +[NSSet setWithArray:v6];

  uint64_t v8 = sub_10000ED94();
  uint64_t v9 = sub_10000EE6C();
  uint64_t v10 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v4;
  id v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v7, "containsObject:", v16, (void)v25))
        {
          id v17 = v16;
          if ([v17 hasPrefix:v8])
          {
            id v18 = [v8 length];
            BOOL v19 = v17;
            id v20 = v8;
            CFStringRef v21 = @"U/";
            goto LABEL_11;
          }
          if ([v17 hasPrefix:v9])
          {
            id v18 = [v9 length];
            BOOL v19 = v17;
            id v20 = v9;
            CFStringRef v21 = @"A/";
LABEL_11:
            uint64_t v22 = objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:options:range:", v20, v21, 0, 0, v18);

            id v17 = (id)v22;
          }
          [v10 addObject:v17];

          continue;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }

  id v23 = [v10 allObjects];

  return v23;
}

- (void)recordIssuedFontPaths:(id)a3 forIdentifier:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = +[NSUserDefaults standardUserDefaults];
    uint64_t v8 = [v7 dictionaryForKey:@"issues"];
    id v9 = [v8 mutableCopy];

    if (!v9) {
      id v9 = (id)objc_opt_new();
    }
    uint64_t v10 = +[NSMutableArray arrayWithArray:v17];
    id v11 = [v9 objectForKey:v6];
    if (v11)
    {
      id v12 = [(FontServicesDaemon *)self issuedFontFilePathsForIdentifier:v6];
      [v10 addObjectsFromArray:v12];

      id v13 = [(FontServicesDaemon *)self sanitizeIssuedFontPaths:v10];
      uint64_t v14 = +[NSSet setWithArray:v13];
      long long v15 = +[NSSet setWithArray:v11];
      unsigned __int8 v16 = [v14 isEqual:v15];

      if (v16) {
        goto LABEL_9;
      }
    }
    else
    {
      id v13 = [(FontServicesDaemon *)self sanitizeIssuedFontPaths:v10];
    }
    [v9 setObject:v13 forKey:v6];
    [v7 setObject:v9 forKey:@"issues"];
    [v7 synchronize];
    CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
LABEL_9:
  }
}

- (id)issuedFontFilePathsForIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v22 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v22 dictionaryForKey:@"issues"];
  id v5 = [v4 mutableCopy];

  CFStringRef v21 = v5;
  id v23 = v3;
  id v6 = [v5 objectForKey:v3];
  id v7 = sub_10000ED94();
  id v24 = sub_10000EE6C();
  uint64_t v8 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v25 + 1) + 8 * i);
        if ([v14 hasPrefix:@"U/"])
        {
          id v15 = [@"U/" length];
          unsigned __int8 v16 = v14;
          CFStringRef v17 = @"U/";
          id v18 = v7;
        }
        else
        {
          if (![v14 hasPrefix:@"A/"]) {
            goto LABEL_11;
          }
          id v15 = [@"A/" length];
          unsigned __int8 v16 = v14;
          CFStringRef v17 = @"A/";
          id v18 = v24;
        }
        uint64_t v19 = objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:options:range:", v17, v18, 0, 0, v15);

        id v14 = (id)v19;
LABEL_11:
        [v8 addObject:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  return v8;
}

- (void)forgetClientApplication:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[NSUserDefaults standardUserDefaults];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v19[0] = @"issues";
    v19[1] = @"suspended";
    v19[2] = @"warned";
    id v5 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 3, 0);
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      char v8 = 0;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v12 = [v4 dictionaryForKey:v11];
          id v13 = [v12 objectForKey:v3];

          if (v13)
          {
            id v14 = [v12 mutableCopy];
            [v14 removeObjectForKey:v3];
            [v4 setObject:v14 forKey:v11];

            char v8 = 1;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v7);

      if (v8)
      {
        [v4 synchronize];
        CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
      }
    }
    else
    {
    }
  }
}

- (void)recordRequestFontsResultWihtMissed:(BOOL)a3 andResolved:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a3 || a4)
  {
    id v6 = +[NSUserDefaults standardUserDefaults];
    id v7 = v6;
    if (v5)
    {
      objc_msgSend(v6, "setInteger:forKey:", (char *)objc_msgSend(v6, "integerForKey:", @"missed") + 1, @"missed");
      id v6 = v7;
    }
    if (v4)
    {
      objc_msgSend(v7, "setInteger:forKey:", (char *)objc_msgSend(v7, "integerForKey:", @"resolved") + 1, @"resolved");
      id v6 = v7;
    }
    [v6 synchronize];
    CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
  }
}

- (void)extractRequestFontsMissed:(unint64_t *)a3 andResolved:(unint64_t *)a4
{
  id v8 = +[NSUserDefaults standardUserDefaults];
  unint64_t v6 = (unint64_t)[v8 integerForKey:@"missed"];
  unint64_t v7 = (unint64_t)[v8 integerForKey:@"resolved"];
  if (v6 | v7)
  {
    [v8 setInteger:0 forKey:@"missed"];
    [v8 setInteger:0 forKey:@"resolved"];
    [v8 synchronize];
    CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
  }
  *a3 = v6;
  *a4 = v7;
}

- (void)requestFonts:(id)a3 sceneID:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  memset(&v47, 0, sizeof(v47));
  uint64_t v11 = +[NSXPCConnection currentConnection];
  uint64_t v12 = v11;
  if (v11) {
    [v11 auditToken];
  }
  else {
    memset(&v47, 0, sizeof(v47));
  }

  id v13 = +[NSXPCConnection currentConnection];
  unsigned int v14 = [v13 processIdentifier];

  long long v15 = +[FSUserFontManager resumeSuspendedFontFiles];
  audit_token_t token = v47;
  long long v16 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  if (!v16)
  {
    id v24 = 0;
    long long v18 = &stru_1000196A8;
LABEL_29:
    NSLog(@"Application \"%@\" does not have an entitlement to use custom fonts.", v24);
    v10[2](v10, &__NSDictionary0__struct);
    goto LABEL_30;
  }
  long long v17 = v16;
  long long v18 = (__CFString *)SecTaskCopySigningIdentifier(v16, 0);
  CFArrayRef v19 = (const __CFArray *)SecTaskCopyValueForEntitlement(v17, @"com.apple.developer.user-fonts", 0);
  if (!v19)
  {
    CFRelease(v17);
    id v24 = 0;
    goto LABEL_29;
  }
  CFArrayRef v20 = v19;
  unsigned int v31 = v14;
  v32 = v9;
  CFTypeID v21 = CFGetTypeID(v19);
  if (v21 == CFArrayGetTypeID())
  {
    v48.length = CFArrayGetCount(v20);
    v48.location = 0;
    unsigned int v22 = CFArrayContainsValue(v20, v48, @"font-enumeration") != 0;
    v49.length = CFArrayGetCount(v20);
    v49.location = 0;
    BOOL v23 = CFArrayContainsValue(v20, v49, @"app-usage") == 0;
    if (v22) {
      goto LABEL_14;
    }
  }
  else
  {
    unsigned int v22 = 0;
    BOOL v23 = 1;
  }
  if (v23)
  {
    id v24 = 0;
    unsigned int v22 = 0;
    goto LABEL_17;
  }
LABEL_14:
  long long v25 = (__CFString *)SecTaskCopySigningIdentifier(v17, 0);
  id v24 = v25;
  if (!v22 && v25) {
    unsigned int v22 = sub_100004B78(v25, v26);
  }
LABEL_17:
  CFRelease(v20);
  CFRelease(v17);
  if (!v22)
  {
    if (v24) {
      char v30 = v23;
    }
    else {
      char v30 = 1;
    }
    if ((v30 & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_28;
  }
  if (!v24)
  {
LABEL_28:
    id v9 = v32;
    goto LABEL_29;
  }
LABEL_19:
  if (qword_10001DE50 != -1) {
    dispatch_once(&qword_10001DE50, &stru_100018830);
  }
  if (atomic_fetch_add_explicit(dword_10001DE40, 1u, memory_order_relaxed)) {
    NSLog(@"Previous CTFontManagerRequestFonts call has not been resolved.  This call from \"%@\" is blocked until the previous call is acknowledged by the user.", v24);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_10001DE48, 0xFFFFFFFFFFFFFFFFLL);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1000082A8;
  v43[3] = &unk_100018878;
  id v44 = v15;
  BOOL v45 = self;
  long long v27 = objc_retainBlock(v43);
  FSLog_Debug();
  long long v28 = [(FontServicesDaemon *)self mainHandlerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008338;
  block[3] = &unk_1000188F0;
  block[4] = self;
  id v34 = v8;
  audit_token_t v40 = v47;
  char v42 = v22;
  id v24 = v24;
  CFStringRef v35 = v24;
  unsigned int v41 = v31;
  id v9 = v32;
  id v36 = v32;
  long long v18 = v18;
  long long v37 = v18;
  long long v38 = v10;
  id v39 = v27;
  unsigned __int8 v29 = v27;
  dispatch_sync(v28, block);

LABEL_30:
}

- (void)requestFonts:(id)a3 forClient:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CFTypeID v21 = v9;
  id v11 = [objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v9];
  [v11 setInvalidationHandler:&stru_100018910];
  uint64_t v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___FontServicesFontPickerClientSupportProtocol];
  [v11 setRemoteObjectInterface:v12];
  [v11 resume];
  id v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:&stru_100018950];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  id v30 = 0;
  unsigned int v22 = v8;
  id v14 = [(FontServicesDaemon *)self providerIdentifiersAndFamilyName:&v30 fromPostScriptName:v8];
  id v15 = v30;
  if (v15)
  {
    [v13 ping:&stru_1000196A8 reply:&stru_100018990];
    if (v11) {
      [v11 auditToken];
    }
    else {
      memset(v29, 0, sizeof(v29));
    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100009024;
    v27[3] = &unk_1000186F8;
    id v28 = v15;
    long long v16 = [(FontServicesDaemon *)self filterUserFontInfoForAuditToken:v29 withEnumerationCapability:0 withFilter:v27];
    if ([v16 count])
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100009074;
      v24[3] = &unk_1000189B8;
      id v25 = v10;
      long long v26 = &v31;
      [v13 activateFontsForFontPickerClient:v16 reply:v24];
      if (v11) {
        [v11 auditToken];
      }
      else {
        memset(&token, 0, sizeof(token));
      }
      long long v17 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
      long long v18 = v17;
      if (v17)
      {
        CFStringRef v19 = SecTaskCopySigningIdentifier(v17, 0);
        if (v19)
        {
          CFArrayRef v20 = [v16 allKeys];
          [(FontServicesDaemon *)self recordIssuedFontPaths:v20 forIdentifier:v19];

          CFRelease(v19);
        }
        CFRelease(v18);
      }
    }
  }
  if (!*((unsigned char *)v32 + 24)) {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
  [v11 invalidate];

  _Block_object_dispose(&v31, 8);
}

- (void)recordSuspendedProvider:(id)a3 url:(id)a4 andScheme:(id)a5 forDate:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (a3 && v9 && v10)
  {
    id v12 = a3;
    id v13 = +[NSUserDefaults standardUserDefaults];
    id v14 = [v13 dictionaryForKey:@"suspended"];
    id v15 = [v14 mutableCopy];

    if (!v15) {
      id v15 = (id)objc_opt_new();
    }
    v17[0] = @"url";
    v17[1] = @"scheme";
    v18[0] = v9;
    v18[1] = v10;
    void v17[2] = @"expirationDate";
    void v18[2] = v11;
    long long v16 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
    [v15 setObject:v16 forKey:v12];

    [v13 setObject:v15 forKey:@"suspended"];
    [v13 synchronize];
    CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
  }
}

- (id)displayLayoutMonitorWithHandler:(id)a3
{
  id v4 = a3;
  displayLayoutMonitor = self->_displayLayoutMonitor;
  if (displayLayoutMonitor)
  {
    [(FBSDisplayLayoutMonitor *)displayLayoutMonitor invalidate];
    unint64_t v6 = self->_displayLayoutMonitor;
    self->_displayLayoutMonitor = 0;
  }
  unint64_t v7 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
  [v7 setTransitionHandler:v4];
  id v8 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:v7];
  id v9 = self->_displayLayoutMonitor;
  self->_displayLayoutMonitor = v8;

  id v10 = self->_displayLayoutMonitor;
  return v10;
}

- (void)recordWarnedForIdenntifier:(id)a3
{
  id v6 = a3;
  id v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 dictionaryForKey:@"warned"];
  id v5 = [v4 mutableCopy];

  if (!v5) {
    id v5 = (id)objc_opt_new();
  }
  [v5 setObject:&__kCFBooleanTrue forKey:v6];
  [v3 setObject:v5 forKey:@"warned"];
  [v3 synchronize];
  CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
}

- (void)resetWarnedForIdenntifier:(id)a3
{
  id v7 = a3;
  id v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 dictionaryForKey:@"warned"];
  id v5 = [v4 mutableCopy];

  if (v5)
  {
    id v6 = [v5 objectForKey:v7];

    if (v6)
    {
      [v5 removeObjectForKey:v7];
      [v3 setObject:v5 forKey:@"warned"];
      [v3 synchronize];
      CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
    }
  }
}

- (void)warnAboutSuspendedFontProvider:(id)a3 forExpiration:(BOOL)a4 date:(id)a5 withURLSchem:(id)a6 immediately:(BOOL)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v49 = a5;
  id v13 = a6;
  if (v13)
  {
    if (a7 || (id v14 = (void *)SBSCopyFrontmostApplicationDisplayIdentifier(), v14, !v14))
    {
      if (qword_10001DE58 && ![(id)qword_10001DE58 count])
      {
        [(FBSDisplayLayoutMonitor *)self->_displayLayoutMonitor invalidate];
        displayLayoutMonitor = self->_displayLayoutMonitor;
        self->_displayLayoutMonitor = 0;

        id v25 = (void *)qword_10001DE58;
        qword_10001DE58 = 0;
      }
      id v44 = self;
      audit_token_t v47 = +[LSApplicationProxy applicationProxyForIdentifier:v12];
      CFRange v48 = [v47 localizedNameForContext:0];
      long long v26 = +[NSBundle mainBundle];
      long long v27 = v26;
      if (v10)
      {
        BOOL v46 = [v26 localizedStringForKey:@"SUBSCRIPTION_SUPPORT_EXPIRE_HEADER" value:&stru_1000196A8 table:0];

        id v28 = +[NSBundle mainBundle];
        [v28 localizedStringForKey:@"SUBSCRIPTION_SUPPORT_EXPIRE_MESSAGE" value:&stru_1000196A8 table:0];
      }
      else
      {
        BOOL v46 = [v26 localizedStringForKey:@"SUBSCRIPTION_SUPPORT_WARN_HEADER" value:&stru_1000196A8 table:0];

        id v28 = +[NSBundle mainBundle];
        [v28 localizedStringForKey:@"SUBSCRIPTION_SUPPORT_WARN_MESSAGE" value:&stru_1000196A8 table:0];
      BOOL v45 = };

      unsigned __int8 v29 = +[NSBundle mainBundle];
      id v30 = [v29 localizedStringForKey:@"SUBSCRIPTION_SUPPORT_OPEN_BUTTON" value:&stru_1000196A8 table:0];

      uint64_t v31 = +[NSBundle mainBundle];
      v32 = [v31 localizedStringForKey:@"SUBSCRIPTION_SUPPORT_NOT_NOW_BUTTON" value:&stru_1000196A8 table:0];

      uint64_t v33 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v46, v48);
      if (v10)
      {
        char v34 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v45, v48);
      }
      else
      {
        CFStringRef v35 = +[NSDateFormatter localizedStringFromDate:v49 dateStyle:1 timeStyle:0];
        char v34 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v45, v48, v35);
      }
      LODWORD(location) = 0;
      v67[0] = kCFUserNotificationAlertHeaderKey;
      v67[1] = kCFUserNotificationAlertMessageKey;
      v68[0] = v33;
      v68[1] = v34;
      v67[2] = kCFUserNotificationDefaultButtonTitleKey;
      v67[3] = kCFUserNotificationAlternateButtonTitleKey;
      v68[2] = v30;
      v68[3] = v32;
      CFDictionaryRef v36 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:4];
      long long v37 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 3uLL, (SInt32 *)&location, v36);
      long long v38 = v37;
      if (v37)
      {
        CFOptionFlags responseFlags = 0;
        if (!CFUserNotificationReceiveResponse(v37, 0.0, &responseFlags) && (responseFlags & 3) == 0)
        {
          long long v43 = objc_opt_new();
          [v43 setScheme:v13];
          [v43 setHost:&stru_1000196A8];
          id v39 = +[NSString stringWithFormat:@"expiration=%d", v10];
          [v43 setQuery:v39];

          char v42 = +[LSApplicationWorkspace defaultWorkspace];
          audit_token_t v40 = [v43 URL];
          [v42 openURL:v40 withOptions:0];
        }
        CFRelease(v38);
      }
      if (v10) {
        [(FontServicesDaemon *)v44 resetWarnedForIdenntifier:v12];
      }
      else {
        [(FontServicesDaemon *)v44 recordWarnedForIdenntifier:v12];
      }
    }
    else
    {
      if (!qword_10001DE58)
      {
        uint64_t v15 = objc_opt_new();
        long long v16 = (void *)qword_10001DE58;
        qword_10001DE58 = v15;
      }
      CFOptionFlags responseFlags = 0;
      p_CFOptionFlags responseFlags = &responseFlags;
      uint64_t v65 = 0x2020000000;
      char v66 = 0;
      long long v17 = (void *)qword_10001DE58;
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_100009C14;
      v57[3] = &unk_1000189E0;
      id v18 = v12;
      id v58 = v18;
      v59 = @"identifier";
      BOOL v62 = v10;
      v60 = @"forExpiration";
      v61 = &responseFlags;
      [v17 enumerateObjectsUsingBlock:v57];
      if (!*((unsigned char *)p_responseFlags + 24))
      {
        CFStringRef v19 = (void *)qword_10001DE58;
        v70[0] = v18;
        v69[0] = @"identifier";
        v69[1] = @"forExpiration";
        CFArrayRef v20 = +[NSNumber numberWithBool:v10];
        v70[1] = v20;
        v70[2] = v49;
        v69[2] = @"date";
        v69[3] = @"scheme";
        v70[3] = v13;
        CFTypeID v21 = +[NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:4];
        [v19 addObject:v21];
      }
      unsigned int v22 = "NO";
      if (v10) {
        unsigned int v22 = "YES";
      }
      unsigned int v41 = v22;
      FSLog();
      objc_initWeak(&location, self);
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_100009CDC;
      v50[3] = &unk_100018A58;
      objc_copyWeak(&v55, &location);
      v51 = @"identifier";
      v52 = @"forExpiration";
      v53 = @"date";
      v54 = @"scheme";
      id v23 = -[FontServicesDaemon displayLayoutMonitorWithHandler:](self, "displayLayoutMonitorWithHandler:", v50, v18, v41);

      objc_destroyWeak(&v55);
      objc_destroyWeak(&location);

      _Block_object_dispose(&responseFlags, 8);
    }
  }
  else
  {
    FSLog_Debug();
  }
}

- (void)resumeAndShowAlertForSuspendedFontProviders:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = [(FontServicesDaemon *)self subscriptionSupportQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A22C;
  block[3] = &unk_100018680;
  block[4] = self;
  dispatch_sync(v5, block);

  v4[2](v4);
}

- (void)updatingUserFonts:(id)a3
{
  id v3 = a3;
  if (qword_10001DE68 != -1) {
    dispatch_once(&qword_10001DE68, &stru_100018A78);
  }
  id v4 = qword_10001DE60;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A3AC;
  block[3] = &unk_100018AA0;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

- (void)warnAboutSuspendedFontProviders:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v9);
        id v11 = [v4 dictionaryForKey:@"warned"];
        id v12 = [v11 objectForKey:v10];
        unsigned __int8 v13 = [v12 BOOLValue];

        if ((v13 & 1) == 0)
        {
          id v14 = [v4 dictionaryForKey:@"suspended"];
          uint64_t v15 = [v14 objectForKey:v10];

          long long v16 = [v15 objectForKey:@"scheme"];
          long long v17 = [v15 objectForKey:@"expirationDate"];
          if (v16) {
            [(FontServicesDaemon *)self warnAboutSuspendedFontProvider:v10 forExpiration:0 date:v17 withURLSchem:v16 immediately:1];
          }
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
}

- (OS_dispatch_queue)subscriptionSupportQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A63C;
  block[3] = &unk_100018680;
  void block[4] = self;
  if (qword_10001DE70 != -1) {
    dispatch_once(&qword_10001DE70, block);
  }
  return self->_subscriptionSupportQueue;
}

- (void)subscriptionSupportTimerHandler
{
  if (atomic_fetch_add_explicit(dword_10001DE78, 1u, memory_order_relaxed))
  {
    atomic_fetch_add_explicit(dword_10001DE78, 0xFFFFFFFF, memory_order_relaxed);
  }
  else
  {
    id v3 = [(FontServicesDaemon *)self subscriptionSupportQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A730;
    block[3] = &unk_100018680;
    void block[4] = self;
    dispatch_async(v3, block);
  }
}

- (unint64_t)countFontAssets
{
  id v2 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.Font7"];
  [v2 returnTypes:1];
  [v2 queryMetaDataSync];
  id v3 = [v2 results];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (void)fontChanged:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  FSLog_Debug();
  uint64_t v8 = [(FontServicesDaemon *)self mainHandlerQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000B2C0;
  v10[3] = &unk_100018878;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, v10);

  v7[2](v7);
}

- (void)resetIssuedFontsFor:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = +[NSXPCConnection currentConnection];
  uint64_t v8 = v7;
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(&v19, 0, sizeof(v19));
  }
  id v9 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v19);

  if (v9)
  {
    CFBooleanRef v10 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v9, @"com.apple.FontServices.allow-reset-issued-fonts", 0);
    if (v10)
    {
      CFBooleanRef v11 = v10;
      CFTypeID v12 = CFGetTypeID(v10);
      if (v12 == CFBooleanGetTypeID())
      {
        int Value = CFBooleanGetValue(v11);
        CFRelease(v11);
        if (Value)
        {
          id v14 = +[NSUserDefaults standardUserDefaults];
          uint64_t v15 = [v14 dictionaryForKey:@"issues"];
          long long v16 = v15;
          if (v15)
          {
            long long v17 = [v15 objectForKey:v5];
            if (v17)
            {
              id v18 = [v16 mutableCopy];
              [v18 removeObjectForKey:v5];
              [v14 setObject:v18 forKey:@"issues"];
              [v14 synchronize];
              CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
            }
          }
        }
      }
      else
      {
        CFRelease(v11);
      }
    }
    CFRelease(v9);
  }
  v6[2](v6);
}

- (OS_dispatch_queue)scheduledFontDeletionQueue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B588;
  block[3] = &unk_100018680;
  void block[4] = self;
  if (qword_10001DE80 != -1) {
    dispatch_once(&qword_10001DE80, block);
  }
  return self->_scheduledFontDeletionQueue;
}

- (void)scheduleFontFilesDeletion:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    if (os_variant_has_internal_content()) {
      int v5 = 600;
    }
    else {
      int v5 = 10800;
    }
    id v6 = +[NSUserDefaults standardUserDefaults];
    [v6 doubleForKey:@"deleteDelay"];
    if (v7 <= 0.0) {
      unsigned int v8 = v5;
    }
    else {
      unsigned int v8 = v7;
    }
    id v9 = [(FontServicesDaemon *)self scheduledFontDeletionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B6E4;
    block[3] = &unk_100018B38;
    unsigned int v13 = v8;
    id v11 = v4;
    CFTypeID v12 = self;
    dispatch_async(v9, block);
  }
}

- (void)setFontFilesDeletionTimer:(unsigned int)a3
{
  int v5 = [(FontServicesDaemon *)self scheduledFontDeletionQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000B948;
  v6[3] = &unk_100018B60;
  v6[4] = self;
  unsigned int v7 = a3;
  dispatch_async(v5, v6);
}

- (void)stopFontFilesDeletionTimer
{
  id v3 = [(FontServicesDaemon *)self scheduledFontDeletionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BB48;
  block[3] = &unk_100018680;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)executeScheduledFontFilesDeletion:(id)a3
{
  FSLog_Debug();
  id v4 = +[NSUserDefaults standardUserDefaults];
  int v5 = [v4 dictionaryForKey:@"delete"];
  id v6 = [v5 mutableCopy];

  if (![v6 count])
  {
    FSLog_Error();
    [(FontServicesDaemon *)self stopFontFilesDeletionTimer];
    goto LABEL_59;
  }
  v52 = objc_opt_new();
  [v6 allKeys];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
  v51 = self;
  if (!v7)
  {
    uint64_t v11 = 0xFFFFFFFFLL;
    goto LABEL_25;
  }
  id v8 = v7;
  char v9 = 0;
  uint64_t v10 = *(void *)v68;
  uint64_t v11 = 0xFFFFFFFFLL;
  do
  {
    CFTypeID v12 = 0;
    do
    {
      if (*(void *)v68 != v10) {
        objc_enumerationMutation(obj);
      }
      unsigned int v13 = *(void **)(*((void *)&v67 + 1) + 8 * (void)v12);
      id v14 = [v6 objectForKey:v13];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (sub_10000EF50(v13, v15) & 1) == 0 && !sub_10000EF5C(v13))
      {
        [v6 removeObjectForKey:v13];
        goto LABEL_13;
      }
      [v14 timeIntervalSinceNow];
      if (v16 < 180.0)
      {
        [v6 removeObjectForKey:v13];
        [v52 addObject:v13];
LABEL_13:
        char v9 = 1;
        goto LABEL_14;
      }
      if (v16 < (double)v11) {
        uint64_t v11 = v16;
      }
      else {
        uint64_t v11 = v11;
      }
LABEL_14:

      CFTypeID v12 = (char *)v12 + 1;
    }
    while (v8 != v12);
    id v17 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
    id v8 = v17;
  }
  while (v17);
  if (v9)
  {
    [v4 setObject:v6 forKey:@"delete"];
    [v4 synchronize];
    CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
  }
  self = v51;
LABEL_25:
  if ([v52 count])
  {
    uint64_t v49 = v11;
    v50 = v4;
    id v46 = [v52 count];
    FSLog_Debug();
    id v18 = +[NSFileManager defaultManager];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v19 = v52;
    id v20 = [v19 countByEnumeratingWithState:&v63 objects:v73 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v64;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v64 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          if (!sub_10000EF5C(v24)) {
            goto LABEL_33;
          }
          id v25 = [v24 stringByDeletingLastPathComponent];
          long long v26 = [v25 lastPathComponent];

          uint64_t v27 = sub_10000EF44();
          id v28 = [(id)v27 stringByAppendingPathComponent:v26];

          LOBYTE(v27) = [v18 fileExistsAtPath:v28];
          if ((v27 & 1) == 0)
          {
LABEL_33:
            id v62 = 0;
            unsigned __int8 v29 = objc_msgSend(v18, "removeItemAtPath:error:", v24, &v62, v47, v48);
            id v30 = v62;
            uint64_t v31 = v30;
            if ((v29 & 1) == 0)
            {
              audit_token_t v47 = v24;
              id v48 = v30;
              FSLog_Error();
            }
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v63 objects:v73 count:16];
      }
      while (v21);
    }

    v32 = objc_opt_new();
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v33 = v19;
    id v34 = [v33 countByEnumeratingWithState:&v58 objects:v72 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v59;
      do
      {
        for (j = 0; j != v35; j = (char *)j + 1)
        {
          if (*(void *)v59 != v36) {
            objc_enumerationMutation(v33);
          }
          long long v38 = objc_msgSend(*(id *)(*((void *)&v58 + 1) + 8 * (void)j), "stringByDeletingLastPathComponent", v47);
          [v32 addObject:v38];
        }
        id v35 = [v33 countByEnumeratingWithState:&v58 objects:v72 count:16];
      }
      while (v35);
    }

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v39 = v32;
    id v40 = [v39 countByEnumeratingWithState:&v54 objects:v71 count:16];
    id v4 = v50;
    if (v40)
    {
      id v41 = v40;
      uint64_t v42 = *(void *)v55;
      do
      {
        for (k = 0; k != v41; k = (char *)k + 1)
        {
          if (*(void *)v55 != v42) {
            objc_enumerationMutation(v39);
          }
          uint64_t v44 = *(void *)(*((void *)&v54 + 1) + 8 * (void)k);
          BOOL v45 = objc_msgSend(v18, "contentsOfDirectoryAtPath:error:", v44, 0, v47);
          if (![v45 count]) {
            [v18 removeItemAtPath:v44 error:0];
          }
        }
        id v41 = [v39 countByEnumeratingWithState:&v54 objects:v71 count:16];
      }
      while (v41);
    }

    self = v51;
    uint64_t v11 = v49;
  }
  FSLog_Debug();
  if (v11 == -1) {
    [(FontServicesDaemon *)self stopFontFilesDeletionTimer];
  }
  else {
    -[FontServicesDaemon setFontFilesDeletionTimer:](self, "setFontFilesDeletionTimer:", v11, v11);
  }

LABEL_59:
}

- (void)synchronizeFontAssets:(id)a3 reply:(id)a4
{
  id v33 = a3;
  id v34 = a4;
  memset(&v50, 0, sizeof(v50));
  int v5 = +[NSXPCConnection currentConnection];
  id v6 = v5;
  if (v5) {
    [v5 auditToken];
  }
  else {
    memset(&v50, 0, sizeof(v50));
  }

  audit_token_t token = v50;
  id v7 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  id v8 = v7;
  if (!v7) {
    goto LABEL_11;
  }
  CFTypeRef v9 = SecTaskCopyValueForEntitlement(v7, @"com.apple.developer.user-fonts", 0);
  uint64_t v10 = v9;
  if (!v9) {
    goto LABEL_10;
  }
  CFTypeID v11 = CFGetTypeID(v9);
  if (v11 != CFArrayGetTypeID())
  {
    CFRelease(v10);
LABEL_10:
    CFRelease(v8);
    goto LABEL_11;
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)v10);
  v52.id location = 0;
  v52.length = Count;
  if (!CFArrayContainsValue((CFArrayRef)v10, v52, @"font-enumeration"))
  {
    v53.id location = 0;
    v53.length = Count;
    BOOL v13 = CFArrayContainsValue((CFArrayRef)v10, v53, @"app-usage") == 0;
    CFRelease(v10);
    CFRelease(v8);
    if (!v13) {
      goto LABEL_14;
    }
LABEL_11:
    (*((void (**)(id, void, void))v34 + 2))(v34, 0, 0);
    goto LABEL_12;
  }
  CFRelease(v10);
  CFRelease(v8);
LABEL_14:
  id v35 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v14 = v33;
  id v16 = [v14 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v47;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v47 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        if (sub_10000EFD4(v19, v15))
        {
          id v20 = [v19 stringByDeletingLastPathComponent];
          id v21 = [v20 lastPathComponent];
          unsigned __int8 v22 = [v21 isEqualToString:@"AssetData"];

          if (v22)
          {
            id v23 = [v20 stringByDeletingLastPathComponent];
            id v24 = [v23 lastPathComponent];

            [v35 addObject:v24];
          }
          else
          {
            FSLog_Error();
          }
        }
        else
        {
          FSLog_Error();
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v16);
  }

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10000C6C8;
  v44[3] = &unk_100018BB0;
  v44[4] = self;
  id v25 = v35;
  id v45 = v25;
  long long v26 = objc_retainBlock(v44);
  *(void *)token.val = 0;
  *(void *)&token.val[2] = &token;
  *(void *)&token.val[4] = 0x3032000000;
  *(void *)&token.val[6] = sub_100005F2C;
  uint64_t v42 = sub_100005F3C;
  ((void (*)(void *))v26[2])(v26);
  id v43 = (id)objc_claimAutoreleasedReturnValue();
  id v27 = [v25 count];
  if (v27 > [*(id *)(*(void *)&token.val[2] + 40) count])
  {
    dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10000C90C;
    v37[3] = &unk_100018BD8;
    p_audit_token_t token = &token;
    id v39 = v26;
    unsigned __int8 v29 = v28;
    long long v38 = v29;
    +[FSUserFontManager synchronizeFontAssets:v37];
    dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v30 = objc_opt_new();
  [v30 setObject:*(void *)(*(void *)&token.val[2] + 40) forKey:@"fontsInfo"];
  audit_token_t v36 = v50;
  uint64_t v31 = [(FontServicesDaemon *)self sandboxExtensionForFontAssets:&v36];
  if (v31) {
    [v30 setObject:v31 forKey:@"extension.fontasset"];
  }
  (*((void (**)(id, uint64_t, void *))v34 + 2))(v34, 1, v30);

  _Block_object_dispose(&token, 8);
LABEL_12:
}

- (void)accessFontAsset:(id)a3
{
  id v4 = a3;
  int v5 = [(FontServicesDaemon *)self assetHandlerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000CA1C;
  v7[3] = &unk_100018878;
  id v8 = v4;
  CFTypeRef v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)setupForXPCService
{
  id v3 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.fontservicesd"];
  [v3 setDelegate:self];
  [v3 resume];
  [(FontServicesDaemon *)self isUserFontInstalled];
}

- (void)setupForScheduledFontDeletion
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 dictionaryForKey:@"delete"];
  if ([v4 count]) {
    [(FontServicesDaemon *)self setFontFilesDeletionTimer:0];
  }
  int v5 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CF2C;
  block[3] = &unk_100018680;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (void)run
{
}

- (id)_userFontsInfoFromDisk
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100005F2C;
  CFTypeRef v9 = sub_100005F3C;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D4B4;
  v4[3] = &unk_100018C00;
  v4[4] = &v5;
  [(FontServicesDaemon *)self updatingUserFonts:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)analyticsEventRequestFonts:(id)a3 misses:(unint64_t)a4 suggestions:(unint64_t)a5 resolved:(unint64_t)a6
{
  id v7 = a3;
  id v6 = v7;
  AnalyticsSendEventLazy();
}

- (OS_dispatch_source)scheduledFontDeletionTimer
{
  return self->_scheduledFontDeletionTimer;
}

- (OS_dispatch_source)fontAssetsAccessTimer
{
  return self->_fontAssetsAccessTimer;
}

- (NSArray)fontEnumerationProhibitedInfo
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFontEnumerationProhibitedInfo:(id)a3
{
}

- (OS_dispatch_queue)mainHandlerQueue
{
  return self->_mainHandlerQueue;
}

- (void)setUserFontsInfo:(id)a3
{
}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return self->_displayLayoutMonitor;
}

- (void)setDisplayLayoutMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_userFontsInfo, 0);
  objc_storeStrong((id *)&self->_assetHandlerQueue, 0);
  objc_storeStrong((id *)&self->_mainHandlerQueue, 0);
  objc_storeStrong((id *)&self->_fontEnumerationProhibitedInfo, 0);
  objc_storeStrong((id *)&self->_fontAssetsAccessTimer, 0);
  objc_storeStrong((id *)&self->_scheduledFontDeletionTimer, 0);
  objc_storeStrong((id *)&self->_scheduledFontDeletionQueue, 0);
  objc_storeStrong((id *)&self->_subscriptionSupportQueue, 0);
  objc_storeStrong((id *)&self->_missingFontsDialogHandler, 0);
}

- (void)synchronizeFontProviders
{
  FSLog();
  +[FSUserFontManager synchronizeFontProviders];
}

- (void)setupForDistributedNotifications
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000F64C;
  handler[3] = &unk_100018F50;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)&_dispatch_main_q, handler);
}

- (OS_dispatch_queue)assetHandlerQueue
{
  if (qword_10001DED0 != -1) {
    dispatch_once(&qword_10001DED0, &stru_100018F70);
  }
  id v2 = (void *)qword_10001DED8;
  return (OS_dispatch_queue *)v2;
}

- (void)setupForAssetNotifications
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000FB4C;
  handler[3] = &unk_100018F50;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, handler);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001014C;
  v4[3] = &unk_100018F50;
  v4[4] = self;
  xpc_activity_register("com.apple.fontservicesd.check-asset-update", XPC_ACTIVITY_CHECK_IN, v4);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000102A4;
  v3[3] = &unk_100018F50;
  v3[4] = self;
  xpc_activity_register("com.apple.fontservicesd.subscription-support", XPC_ACTIVITY_CHECK_IN, v3);
}

- (void)setupForMonitoringFontAssets
{
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.fontservicesd.fontAssetsMonitor", 0);
  id v3 = (void *)qword_10001DEE0;
  qword_10001DEE0 = (uint64_t)v2;

  id v4 = qword_10001DEE0;
  dispatch_async(v4, &stru_100019048);
}

- (void)removeObsoleteFontAsset
{
  id v2 = [objc_alloc((Class)MAAssetQuery) initWithType:@"com.apple.MobileAsset.Font6"];
  [v2 returnTypes:1];
  [v2 setDoNotBlockBeforeFirstUnlock:1];
  [v2 setDoNotBlockOnNetworkStatus:1];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100010544;
  v4[3] = &unk_100018FE0;
  id v5 = v2;
  id v3 = v2;
  [v3 queryMetaData:v4];
}

- (void)setupForProfileFonts
{
}

- (void)setup
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  if ((uint64_t)[v3 integerForKey:@"version"] <= 2)
  {
    [(FontServicesDaemon *)self removeObsoleteFontAsset];
    [v3 setInteger:3 forKey:@"version"];
    [v3 synchronize];
    CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
  }
}

@end