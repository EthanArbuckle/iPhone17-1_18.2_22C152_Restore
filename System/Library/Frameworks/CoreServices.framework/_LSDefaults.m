@interface _LSDefaults
+ (id)sharedInstance;
- (BOOL)abortIfMayNotMapDatabase;
- (BOOL)allowsAlternateIcons;
- (BOOL)allowsUnentitledExtensionPointDeclaration;
- (BOOL)alwaysUseDebugOpenWithMenus;
- (BOOL)hasPersistentPreferences;
- (BOOL)hasServer;
- (BOOL)isAppleInternal;
- (BOOL)isInEducationMode;
- (BOOL)isInSyncBubble;
- (BOOL)isInXCTestRigInsecure;
- (BOOL)isLightweightSystemServer;
- (BOOL)isRegionChina;
- (BOOL)isServer;
- (BOOL)isSystemServer;
- (BOOL)isUserServer;
- (BOOL)isUsingEphemeralStorage;
- (BOOL)issueSandboxExceptionsIfMayNotMapDatabase;
- (BOOL)markLocalizationsStoredInDatabase;
- (BOOL)nsExtensionUsesLSSettingsStore;
- (NSArray)preferredLocalizations;
- (NSData)HMACSecret;
- (NSURL)appMarketplacesPreferencesStateURL;
- (NSURL)appProtectionStoreFileURL;
- (NSURL)databaseContainerDirectoryURL;
- (NSURL)databaseStoreFileURL;
- (NSURL)dbRecoveryFileURL;
- (NSURL)dbSentinelFileURL;
- (NSURL)dbSyncInterruptedFileURL;
- (NSURL)defaultAppQueryStateURL;
- (NSURL)identifiersFileURL;
- (NSURL)installJournalDirectoryURL;
- (NSURL)preSydroFSecurePreferencesFileURL;
- (NSURL)preferencesFileURL;
- (NSURL)progressProportionsStateURL;
- (NSURL)queriedSchemesMapFileURL;
- (NSURL)securePreferencesFileURL;
- (NSURL)settingsStoreFileURL;
- (NSURL)specialAppEligibilityStateURL;
- (NSURL)systemContainerURL;
- (NSURL)systemContentDatabaseStoreFileURL;
- (NSURL)systemGroupContainerURL;
- (NSURL)unremappableDatabaseStoreFileURL;
- (NSURL)userContainerURL;
- (_LSDefaults)init;
- (double)databaseSaveInterval;
- (double)databaseSaveLatency;
- (id)classesWithNameForXCTests:(const char *)a3;
- (id)darwinNotificationNameForBaseName:(id)a3 optionalSessionKey:(LSSessionKey *)a4;
- (id)databaseContainerURL;
- (id)databaseStoreFileURLWithUID:(unsigned int)a3;
- (id)databaseUpdateNotificationNameForSessionKey:(LSSessionKey)a3;
- (id)debugDescription;
- (id)preferencesFileChangeNotificationName;
- (id)preferencesUpdateNotificationName;
- (id)serviceNameForConnectionType:(unsigned __int16)a3;
- (id)serviceNameForConnectionType:(unsigned __int16)a3 lightweightSystemService:(BOOL)a4;
- (id)settingsUpdateNotificationNameForUserID:(unsigned int)a3;
- (id)simulatorRootURL;
- (id)simulatorRuntimeBuildVersion;
- (id)simulatorRuntimeVersion;
- (id)systemContainerBaseURL;
- (id)systemContentDatabaseStoreFileURLWithUID:(unsigned int)a3;
- (int64_t)concurrentInstallOperations;
- (unsigned)currentSchemaVersion;
- (unsigned)databaseStoreFileMode;
- (unsigned)proxyUIDForCurrentEffectiveUID;
- (unsigned)proxyUIDForUID:(unsigned int)a3;
- (void)setHasServer:(BOOL)a3;
- (void)setLightweightSystemServer:(BOOL)a3;
- (void)setServer:(BOOL)a3;
@end

@implementation _LSDefaults

- (BOOL)markLocalizationsStoredInDatabase
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48___LSDefaults_markLocalizationsStoredInDatabase__block_invoke;
  block[3] = &unk_1E522C268;
  block[4] = self;
  if (markLocalizationsStoredInDatabase_once != -1) {
    dispatch_once(&markLocalizationsStoredInDatabase_once, block);
  }
  return markLocalizationsStoredInDatabase_result;
}

- (NSArray)preferredLocalizations
{
  if (preferredLocalizations_once != -1) {
    dispatch_once(&preferredLocalizations_once, &__block_literal_global_229);
  }
  if (![(_LSDefaults *)self isInXCTestRigInsecure]
    || (+[_LSStringLocalizer preferredLocalizationsForXCTests], (id v3 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (preferredLocalizations_useUserLangList)
    {
      if ([(_LSDefaults *)self proxyUIDForCurrentEffectiveUID])
      {
        id v3 = [MEMORY[0x1E4F1CA20] preferredLanguages];
      }
      else
      {
        id v3 = (id)CFPreferencesCopyValue(@"AppleLanguages", (CFStringRef)*MEMORY[0x1E4F1D3B8], @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
      }
    }
    else
    {
      if (preferredLocalizations_once_244 != -1) {
        dispatch_once(&preferredLocalizations_once_244, &__block_literal_global_246);
      }
      id v3 = (id)preferredLocalizations_bundleLocalizations;
    }
  }

  return (NSArray *)v3;
}

- (BOOL)isInXCTestRigInsecure
{
  return self->_inXCTestRigInsecure;
}

- (BOOL)hasServer
{
  return self->_hasServer && !self->_isServer;
}

- (BOOL)isServer
{
  return self->_isServer;
}

- (unsigned)proxyUIDForCurrentEffectiveUID
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45___LSDefaults_proxyUIDForCurrentEffectiveUID__block_invoke;
  block[3] = &unk_1E522C268;
  block[4] = self;
  if (proxyUIDForCurrentEffectiveUID_once != -1) {
    dispatch_once(&proxyUIDForCurrentEffectiveUID_once, block);
  }
  if (proxyUIDForCurrentEffectiveUID_hasEUID == 1) {
    uint64_t v3 = proxyUIDForCurrentEffectiveUID_euid;
  }
  else {
    uint64_t v3 = _CFGetEUID();
  }
  return [(_LSDefaults *)self proxyUIDForUID:v3];
}

- (unsigned)proxyUIDForUID:(unsigned int)a3
{
  if (a3 - 401 >= 0xFFFFFE6D) {
    return 0;
  }
  else {
    return a3;
  }
}

- (BOOL)allowsAlternateIcons
{
  return !self->_inEducationMode;
}

- (BOOL)isInEducationMode
{
  return self->_inEducationMode;
}

- (NSData)HMACSecret
{
  _LSAssertRunningInServer((uint64_t)"-[_LSDefaults HMACSecret]");
  ivarQueue = self->_ivarQueue;

  return (NSData *)_LSLazyLoadObjectOnQueue((uint64_t)&self->_hmacSecret, ivarQueue, &__block_literal_global_267);
}

- (NSURL)settingsStoreFileURL
{
  v2 = [(_LSDefaults *)self userContainerURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"com.apple.LaunchServices.SettingsStore.sql" isDirectory:0];

  return (NSURL *)v3;
}

- (NSURL)systemContentDatabaseStoreFileURL
{
  uint64_t v3 = [(_LSDefaults *)self proxyUIDForCurrentEffectiveUID];

  return (NSURL *)[(_LSDefaults *)self systemContentDatabaseStoreFileURLWithUID:v3];
}

- (id)systemContentDatabaseStoreFileURLWithUID:(unsigned int)a3
{
  uint64_t v3 = [(_LSDefaults *)self databaseStoreFileURLWithUID:*(void *)&a3];
  v4 = [v3 lastPathComponent];
  v5 = [@"SystemDataOnly-" stringByAppendingString:v4];
  v6 = [v3 URLByDeletingLastPathComponent];
  v7 = [v6 URLByAppendingPathComponent:v5];

  return v7;
}

- (id)databaseStoreFileURLWithUID:(unsigned int)a3
{
  v5 = -[_LSDefaults databaseContainerURLWithUID:](self, "databaseContainerURLWithUID:");
  if (!v5)
  {
    v10 = 0;
    goto LABEL_12;
  }
  v6 = getenv("LS_NAME_PREFIX");
  if (v6) {
    v7 = v6;
  }
  else {
    v7 = "com.apple.LaunchServices";
  }
  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s-%03llu-v2.csstore", v7, -[_LSDefaults currentSchemaVersion](self, "currentSchemaVersion"));
  v9 = (void *)v8;
  if (!a3)
  {
    uint64_t v11 = [@"System-" stringByAppendingString:v8];

    v9 = (void *)v11;
    if (v11) {
      goto LABEL_7;
    }
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  if (!v8) {
    goto LABEL_10;
  }
LABEL_7:
  v10 = [v5 URLByAppendingPathComponent:v9 isDirectory:0];
LABEL_11:

LABEL_12:

  return v10;
}

- (unsigned)currentSchemaVersion
{
  return 6022;
}

- (id)databaseContainerURL
{
  if ([(_LSDefaults *)self isInEducationMode]
    || [(_LSDefaults *)self isLightweightSystemServer])
  {
    uint64_t v3 = [(_LSDefaults *)self systemContainerURL];
  }
  else
  {
    uint64_t v3 = [(_LSDefaults *)self userContainerURL];
  }

  return v3;
}

- (NSURL)userContainerURL
{
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31___LSDefaults_userContainerURL__block_invoke;
  v5[3] = &unk_1E522E828;
  v5[4] = self;
  uint64_t v3 = _LSLazyLoadObjectOnQueue((uint64_t)&self->_userContainerURL, ivarQueue, v5);

  return (NSURL *)v3;
}

- (id)classesWithNameForXCTests:(const char *)a3
{
  if (__LSDefaultsGetSharedInstance_onceToken != -1) {
    dispatch_once(&__LSDefaultsGetSharedInstance_onceToken, &__block_literal_global_27);
  }
  if ([(id)__LSDefaultsGetSharedInstance_sharedInstance isInXCTestRigInsecure])
  {
    v4 = [MEMORY[0x1E4F1CA80] set];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41___LSDefaults_classesWithNameForXCTests___block_invoke;
    v7[3] = &unk_1E522E850;
    id v8 = v4;
    v9 = a3;
    id v5 = v4;
    objc_enumerateClasses(0, a3, 0, 0, v7);
  }
  return 0;
}

- (BOOL)isLightweightSystemServer
{
  return self->_isLightweightSystemServer;
}

- (_LSDefaults)init
{
  v16.receiver = self;
  v16.super_class = (Class)_LSDefaults;
  v2 = [(_LSDefaults *)&v16 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.launchservices.defaults", v3);
    ivarQueue = v2->_ivarQueue;
    v2->_ivarQueue = (OS_dispatch_queue *)v4;

    systemContainerURL = v2->_systemContainerURL;
    v2->_systemContainerURL = 0;

    userContainerURL = v2->_userContainerURL;
    v2->_userContainerURL = 0;

    systemGroupContainerURL = v2->_systemGroupContainerURL;
    v2->_systemGroupContainerURL = 0;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    darwinNotificationNames = v2->_darwinNotificationNames;
    v2->_darwinNotificationNames = v9;

    v2->_darwinNotificationNamesUID = _CFGetEUID();
    v2->_darwinNotificationNamesLock._os_unfair_lock_opaque = 0;
    uint64_t v11 = getenv("RUNNING_IN_SYNC_BUBBLE");
    if (v11 && atoi(v11) == 1) {
      _LSDefaultsInSyncBubble_inSyncBubble = 1;
    }
    v2->_inSyncBubble = _LSDefaultsInSyncBubble_inSyncBubble;
    if (_LSDefaultsInXCTestRigInsecure_once != -1) {
      dispatch_once(&_LSDefaultsInXCTestRigInsecure_once, &__block_literal_global_466);
    }
    v2->_inXCTestRigInsecure = _LSDefaultsInXCTestRigInsecure_inXCTestRigInsecure;
    if (_LSDefaultsIsAppleInternal_once != -1) {
      dispatch_once(&_LSDefaultsIsAppleInternal_once, &__block_literal_global_469);
    }
    v2->_appleInternal = _LSDefaultsIsAppleInternal_appleInternal;
    if (_LSDefaultsHasServer_onceToken != -1) {
      dispatch_once(&_LSDefaultsHasServer_onceToken, &__block_literal_global_471);
    }
    v2->_hasServer = (_LSDefaultsHasServer_hasServer & 1) == 0;
    BOOL v12 = _CFGetEUID() - 100 <= 0xFFFFFF99 && getenv("LS_NO_PERSISTENT_PREFS") == 0;
    v2->_hasPersistentPreferences = v12;
    v2->_inEducationMode = 0;
    v13 = [(objc_class *)getUMUserManagerClass_0() sharedManager];
    int v14 = [v13 isSharedIPad];

    if (v14) {
      v2->_inEducationMode = 1;
    }
    v2->_usingEphemeralStorage = os_variant_uses_ephemeral_storage();
  }
  return v2;
}

- (id)settingsUpdateNotificationNameForUserID:(unsigned int)a3
{
  uint64_t v5 = a3;
  uint64_t v3 = [(_LSDefaults *)self darwinNotificationNameForBaseName:@"com.apple.LaunchServices.settings" optionalSessionKey:&v5];

  return v3;
}

- (id)databaseUpdateNotificationNameForSessionKey:(LSSessionKey)a3
{
  LSSessionKey v5 = a3;
  uint64_t v3 = [(_LSDefaults *)self darwinNotificationNameForBaseName:@"com.apple.LaunchServices.database" optionalSessionKey:&v5];

  return v3;
}

- (id)darwinNotificationNameForBaseName:(id)a3 optionalSessionKey:(LSSessionKey *)a4
{
  id v5 = a3;
  v6 = v5;
  v7 = v5;
  if (a4)
  {
    v7 = v5;
    if (a4->systemSession)
    {
      v7 = [v5 stringByAppendingString:@".system"];
    }
  }

  return v7;
}

- (BOOL)isAppleInternal
{
  return self->_appleInternal;
}

- (id)serviceNameForConnectionType:(unsigned __int16)a3 lightweightSystemService:(BOOL)a4
{
  BOOL v4 = a4;
  int v5 = a3;
  v6 = getenv("LSD_SERVICE_BASE");
  switch(v5)
  {
    case 0:
      if (!v6 || !*v6)
      {
        uint64_t v11 = @"com.apple.lsd.mapdb";
        BOOL v12 = @"com.apple.lsd.system.mapdb";
        goto LABEL_94;
      }
      v7 = NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".mapdb";
      goto LABEL_78;
    case 1:
      if (!v6 || !*v6)
      {
        uint64_t v11 = @"com.apple.lsd.modifydb";
        BOOL v12 = @"com.apple.lsd.system.modifydb";
        goto LABEL_94;
      }
      v7 = NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".modifydb";
      goto LABEL_78;
    case 2:
      if (!v6 || !*v6)
      {
        uint64_t v11 = @"com.apple.lsd.openurl";
        BOOL v12 = @"com.apple.lsd.system.openurl";
        goto LABEL_94;
      }
      v7 = NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".openurl";
      goto LABEL_78;
    case 3:
      if (!v6 || !*v6)
      {
        uint64_t v11 = @"com.apple.lsd.open";
        BOOL v12 = @"com.apple.lsd.system.open";
        goto LABEL_94;
      }
      v7 = NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".open";
      goto LABEL_78;
    case 4:
      if (!v6 || !*v6)
      {
        uint64_t v11 = @"com.apple.lsd.plugin";
        BOOL v12 = @"com.apple.lsd.system.plugin";
        goto LABEL_94;
      }
      v7 = NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".plugin";
      goto LABEL_78;
    case 5:
      if (!v6 || !*v6)
      {
        uint64_t v11 = @"com.apple.lsd.xpc";
        BOOL v12 = @"com.apple.lsd.system.xpc";
        goto LABEL_94;
      }
      v7 = NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".xpc";
      goto LABEL_78;
    case 6:
      if (!v6 || !*v6)
      {
        uint64_t v11 = @"com.apple.lsd.installation";
        BOOL v12 = @"com.apple.lsd.system.installation";
        goto LABEL_94;
      }
      v7 = NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".installation";
      goto LABEL_78;
    case 7:
      if (!v6 || !*v6)
      {
        uint64_t v11 = @"com.apple.lsd.advertisingidentifiers";
        BOOL v12 = @"com.apple.lsd.system.advertisingidentifiers";
        goto LABEL_94;
      }
      v7 = NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".advertisingidentifiers";
      goto LABEL_78;
    case 8:
      if (!v6 || !*v6)
      {
        uint64_t v11 = @"com.apple.lsd.trustedsignatures";
        BOOL v12 = @"com.apple.lsd.system.trustedsignatures";
        goto LABEL_94;
      }
      v7 = NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".trustedsignatures";
      goto LABEL_78;
    case 9:
      if (!v6 || !*v6)
      {
        uint64_t v11 = @"com.apple.lsd.diagnostics";
        BOOL v12 = @"com.apple.lsd.system.diagnostics";
        goto LABEL_94;
      }
      v7 = NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".diagnostics";
      goto LABEL_78;
    case 10:
      if (!v6 || !*v6)
      {
        uint64_t v11 = @"com.apple.lsd.icons";
        BOOL v12 = @"com.apple.lsd.system.icons";
        goto LABEL_94;
      }
      v7 = NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".icons";
      goto LABEL_78;
    case 11:
      if (!v6 || !*v6)
      {
        uint64_t v11 = @"com.apple.lsd.dissemination";
        BOOL v12 = @"com.apple.lsd.system.dissemination";
        goto LABEL_94;
      }
      v7 = NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".dissemination";
      goto LABEL_78;
    case 12:
      if (!v6 || !*v6)
      {
        uint64_t v11 = @"com.apple.lsd.encryption";
        BOOL v12 = @"com.apple.lsd.system.encryption";
        goto LABEL_94;
      }
      v7 = NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".encryption";
      goto LABEL_78;
    case 13:
      if (!v6 || !*v6)
      {
        uint64_t v11 = @"com.apple.lsd.rebuild";
        BOOL v12 = @"com.apple.lsd.system.rebuild";
        goto LABEL_94;
      }
      v7 = NSString;
      id v8 = "";
      if (v4) {
        id v8 = ".system";
      }
      v9 = ".rebuild";
      goto LABEL_78;
    case 14:
      if (v6 && *v6)
      {
        v7 = NSString;
        id v8 = "";
        if (v4) {
          id v8 = ".system";
        }
        v9 = ".appprotection";
LABEL_78:
        objc_msgSend(v7, "stringWithFormat:", @"%s%s.%s", v6, v8, v9);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v11 = @"com.apple.lsd.appprotection";
        BOOL v12 = @"com.apple.lsd.system.appprotection";
LABEL_94:
        if (v4) {
          uint64_t v11 = v12;
        }
        v10 = v11;
      }
LABEL_97:
      return v10;
    default:
      v10 = 0;
      goto LABEL_97;
  }
}

- (id)serviceNameForConnectionType:(unsigned __int16)a3
{
  return [(_LSDefaults *)self serviceNameForConnectionType:a3 lightweightSystemService:0];
}

+ (id)sharedInstance
{
  __LAUNCH_SERVICES_IS_GENERATING_A_SANDBOX_EXCEPTION_BECAUSE_THIS_PROCESS_IS_USING_PRIVATE_SYMBOLS__();
  if (dyld_get_program_sdk_version() >= 0xD0000) {
    [a1 doesNotRecognizeSelector:a2];
  }
  if (__LSDefaultsGetSharedInstance_onceToken != -1) {
    dispatch_once(&__LSDefaultsGetSharedInstance_onceToken, &__block_literal_global_27);
  }
  BOOL v4 = (void *)__LSDefaultsGetSharedInstance_sharedInstance;

  return v4;
}

- (id)systemContainerBaseURL
{
  return _LSLazyLoadObjectOnQueue((uint64_t)&self->_baseSystemContainerURL, self->_ivarQueue, &__block_literal_global_39);
}

- (NSURL)systemContainerURL
{
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33___LSDefaults_systemContainerURL__block_invoke;
  v5[3] = &unk_1E522E828;
  v5[4] = self;
  uint64_t v3 = _LSLazyLoadObjectOnQueue((uint64_t)&self->_systemContainerURL, ivarQueue, v5);

  return (NSURL *)v3;
}

- (NSURL)systemGroupContainerURL
{
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38___LSDefaults_systemGroupContainerURL__block_invoke;
  v5[3] = &unk_1E522E828;
  v5[4] = self;
  uint64_t v3 = _LSLazyLoadObjectOnQueue((uint64_t)&self->_systemGroupContainerURL, ivarQueue, v5);

  return (NSURL *)v3;
}

- (unsigned)databaseStoreFileMode
{
  return 432;
}

- (NSURL)databaseContainerDirectoryURL
{
  uint64_t v3 = [(_LSDefaults *)self proxyUIDForCurrentEffectiveUID];

  return (NSURL *)[(_LSDefaults *)self databaseContainerURLWithUID:v3];
}

- (NSURL)databaseStoreFileURL
{
  uint64_t v3 = [(_LSDefaults *)self proxyUIDForCurrentEffectiveUID];

  return (NSURL *)[(_LSDefaults *)self databaseStoreFileURLWithUID:v3];
}

- (NSURL)unremappableDatabaseStoreFileURL
{
  v2 = [(_LSDefaults *)self databaseStoreFileURL];
  uint64_t v3 = [v2 URLByAppendingPathExtension:@"unremappable"];

  return (NSURL *)v3;
}

- (NSURL)preferencesFileURL
{
  v2 = [(_LSDefaults *)self userContainerURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"com.apple.LaunchServices.plist" isDirectory:0];

  return (NSURL *)v3;
}

- (NSURL)preSydroFSecurePreferencesFileURL
{
  v2 = [(_LSDefaults *)self userContainerURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"com.apple.launchservices.securepreferences.plist" isDirectory:0];

  return (NSURL *)v3;
}

- (NSURL)securePreferencesFileURL
{
  if ([(_LSDefaults *)self isInEducationMode]) {
    [(_LSDefaults *)self userContainerURL];
  }
  else {
  uint64_t v3 = [(_LSDefaults *)self systemContainerBaseURL];
  }
  BOOL v4 = [v3 URLByAppendingPathComponent:@"com.apple.launchservices.securepreferences.plist" isDirectory:0];

  return (NSURL *)v4;
}

- (NSURL)appProtectionStoreFileURL
{
  v2 = [(_LSDefaults *)self databaseContainerURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"com.apple.LaunchServicesAppProtectionStore.plist" isDirectory:0];

  return (NSURL *)v3;
}

- (NSURL)queriedSchemesMapFileURL
{
  v2 = [(_LSDefaults *)self userContainerURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"com.apple.lsdschemes.plist" isDirectory:0];

  return (NSURL *)v3;
}

- (NSURL)identifiersFileURL
{
  v2 = [(_LSDefaults *)self systemGroupContainerURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"com.apple.lsdidentifiers.plist" isDirectory:0];

  return (NSURL *)v3;
}

- (NSURL)dbSentinelFileURL
{
  v2 = [(_LSDefaults *)self databaseContainerURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"com.apple.LaunchServices.dirty" isDirectory:0];

  return (NSURL *)v3;
}

- (NSURL)installJournalDirectoryURL
{
  v2 = [(_LSDefaults *)self databaseContainerURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"com.apple.LaunchServices.InstallJournal" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)dbRecoveryFileURL
{
  v2 = [(_LSDefaults *)self databaseContainerURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"com.apple.LaunchServices.error" isDirectory:0];

  return (NSURL *)v3;
}

- (NSURL)dbSyncInterruptedFileURL
{
  v2 = [(_LSDefaults *)self databaseContainerURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"com.apple.LaunchServices.syncInterrupted"];

  return (NSURL *)v3;
}

- (NSURL)progressProportionsStateURL
{
  v2 = [(_LSDefaults *)self userContainerURL];
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"ProgressProporitions.plist" isDirectory:0];

  return (NSURL *)v3;
}

- (NSURL)appMarketplacesPreferencesStateURL
{
  if ([(_LSDefaults *)self isInEducationMode]) {
    [(_LSDefaults *)self userContainerURL];
  }
  else {
  uint64_t v3 = [(_LSDefaults *)self systemContainerBaseURL];
  }
  BOOL v4 = [v3 URLByAppendingPathComponent:@"com.apple.launchservices.appmarketplaces.plist" isDirectory:0];

  return (NSURL *)v4;
}

- (NSURL)specialAppEligibilityStateURL
{
  if ([(_LSDefaults *)self isInEducationMode]) {
    [(_LSDefaults *)self userContainerURL];
  }
  else {
  uint64_t v3 = [(_LSDefaults *)self systemContainerBaseURL];
  }
  BOOL v4 = [v3 URLByAppendingPathComponent:@"SpecialAppEligibilityState.plist" isDirectory:0];

  return (NSURL *)v4;
}

- (NSURL)defaultAppQueryStateURL
{
  if ([(_LSDefaults *)self isInEducationMode]) {
    [(_LSDefaults *)self userContainerURL];
  }
  else {
  uint64_t v3 = [(_LSDefaults *)self systemContainerBaseURL];
  }
  BOOL v4 = [v3 URLByAppendingPathComponent:@"DefaultAppQueryState.plist" isDirectory:0];

  return (NSURL *)v4;
}

- (id)simulatorRootURL
{
  if (simulatorRootURL_once != -1) {
    dispatch_once(&simulatorRootURL_once, &__block_literal_global_83);
  }
  v2 = (void *)simulatorRootURL_result;

  return v2;
}

- (id)simulatorRuntimeVersion
{
  if (simulatorRuntimeVersion_once != -1) {
    dispatch_once(&simulatorRuntimeVersion_once, &__block_literal_global_86);
  }
  v2 = (void *)simulatorRuntimeVersion_result;

  return v2;
}

- (id)simulatorRuntimeBuildVersion
{
  if (simulatorRuntimeBuildVersion_once != -1) {
    dispatch_once(&simulatorRuntimeBuildVersion_once, &__block_literal_global_89);
  }
  v2 = (void *)simulatorRuntimeBuildVersion_result;

  return v2;
}

- (void)setHasServer:(BOOL)a3
{
  self->_hasServer = a3;
}

- (BOOL)isSystemServer
{
  BOOL v3 = [(_LSDefaults *)self isServer];
  if (v3) {
    LOBYTE(v3) = [(_LSDefaults *)self proxyUIDForCurrentEffectiveUID] == 0;
  }
  return v3;
}

- (BOOL)isUserServer
{
  BOOL v3 = [(_LSDefaults *)self isServer];
  if (v3) {
    LOBYTE(v3) = [(_LSDefaults *)self proxyUIDForCurrentEffectiveUID] != 0;
  }
  return v3;
}

- (BOOL)abortIfMayNotMapDatabase
{
  BOOL v2 = [(_LSDefaults *)self isAppleInternal];
  if (v2) {
    LOBYTE(v2) = CFPreferencesGetAppBooleanValue(@"LSAbortIfMayNotMapDatabase", (CFStringRef)*MEMORY[0x1E4F1D3D8], 0) != 0;
  }
  return v2;
}

- (BOOL)issueSandboxExceptionsIfMayNotMapDatabase
{
  return ![(_LSDefaults *)self isAppleInternal]
      || CFPreferencesGetAppBooleanValue(@"LSDisableDatabaseSandboxExceptions", (CFStringRef)*MEMORY[0x1E4F1D3D8], 0) == 0;
}

- (id)preferencesUpdateNotificationName
{
  return [(_LSDefaults *)self darwinNotificationNameForBaseName:@"com.apple.LaunchServices.prefs" optionalSessionKey:0];
}

- (id)preferencesFileChangeNotificationName
{
  return [(_LSDefaults *)self darwinNotificationNameForBaseName:@"com.apple.LaunchServices.prefsFile" optionalSessionKey:0];
}

- (BOOL)allowsUnentitledExtensionPointDeclaration
{
  return _os_feature_enabled_impl();
}

- (BOOL)nsExtensionUsesLSSettingsStore
{
  return _os_feature_enabled_impl();
}

- (double)databaseSaveInterval
{
  return 1.0;
}

- (double)databaseSaveLatency
{
  return 0.5;
}

- (int64_t)concurrentInstallOperations
{
  return 3;
}

- (BOOL)alwaysUseDebugOpenWithMenus
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___LSDefaults_alwaysUseDebugOpenWithMenus__block_invoke;
  block[3] = &unk_1E522C268;
  block[4] = self;
  if (alwaysUseDebugOpenWithMenus_once != -1) {
    dispatch_once(&alwaysUseDebugOpenWithMenus_once, block);
  }
  return alwaysUseDebugOpenWithMenus_result;
}

- (BOOL)isRegionChina
{
  if (isRegionChina_once != -1) {
    dispatch_once(&isRegionChina_once, &__block_literal_global_255);
  }
  return isRegionChina_result;
}

- (id)debugDescription
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  for (int i = 0; i != 15; ++i)
  {
    int v5 = [(_LSDefaults *)self serviceNameForConnectionType:(unsigned __int16)i];
    [v3 addObject:v5];
  }
  v29 = NSString;
  v30.receiver = self;
  v30.super_class = (Class)_LSDefaults;
  v28 = [(_LSDefaults *)&v30 debugDescription];
  v27 = [(_LSDefaults *)self databaseStoreFileURL];
  v26 = [(_LSDefaults *)self queriedSchemesMapFileURL];
  v25 = [(_LSDefaults *)self identifiersFileURL];
  v24 = [(_LSDefaults *)self preferencesFileURL];
  v6 = [(_LSDefaults *)self securePreferencesFileURL];
  v7 = @"NO";
  if ([(_LSDefaults *)self isServer]) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  v23 = v8;
  if ([(_LSDefaults *)self hasServer]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  v22 = v9;
  if ([(_LSDefaults *)self isInEducationMode]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  v21 = v10;
  if ([(_LSDefaults *)self hasPersistentPreferences]) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  if ([(_LSDefaults *)self allowsAlternateIcons]) {
    BOOL v12 = @"YES";
  }
  else {
    BOOL v12 = @"NO";
  }
  if ([(_LSDefaults *)self abortIfMayNotMapDatabase]) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  if ([(_LSDefaults *)self isInSyncBubble]) {
    int v14 = @"YES";
  }
  else {
    int v14 = @"NO";
  }
  if ([(_LSDefaults *)self isInXCTestRigInsecure]) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  if ([(_LSDefaults *)self isAppleInternal]) {
    v7 = @"YES";
  }
  [(_LSDefaults *)self databaseSaveInterval];
  uint64_t v17 = v16;
  [(_LSDefaults *)self databaseSaveLatency];
  objc_msgSend(v29, "stringWithFormat:", @"%@Paths:\n\tdatabaseStoreFileURL: %@\n\tqueriedSchemesMapFileURL: %@\n\tidentifiersFileURL: %@\n\tpreferencesFileURL: %@\n\tsecurePreferencesFileURL: %@\nEnvironment:\n\tisServer: %@\n\thasServer: %@\n\tinEducationMode: %@\n\thasPersistentPreferences: %@\n\tallowsAlternateIcons: %@\n\tabortIfMayNotMapDatabase: %@\n\tinSyncBubble: %@\n\tinXCTestRigInsecure: %@\n\tappleInternal: %@\nTimeing:\n\tdatabaseSaveInterval: %lf\n\tdatabaseSaveLatency: %lf\nService names: %@", v28, v27, v26, v25, v24, v6, v23, v22, v21, v11, v12, v13, v14, v15, v7, v17,
    v18,
  v19 = v3);

  return v19;
}

- (BOOL)isInSyncBubble
{
  return self->_inSyncBubble;
}

- (void)setServer:(BOOL)a3
{
  self->_isServer = a3;
}

- (void)setLightweightSystemServer:(BOOL)a3
{
  self->_isLightweightSystemServer = a3;
}

- (BOOL)isUsingEphemeralStorage
{
  return self->_usingEphemeralStorage;
}

- (BOOL)hasPersistentPreferences
{
  return self->_hasPersistentPreferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darwinNotificationNames, 0);
  objc_storeStrong((id *)&self->_hmacSecret, 0);
  objc_storeStrong((id *)&self->_userContainerURL, 0);
  objc_storeStrong((id *)&self->_systemGroupContainerURL, 0);
  objc_storeStrong((id *)&self->_systemContainerURL, 0);
  objc_storeStrong((id *)&self->_baseSystemContainerURL, 0);

  objc_storeStrong((id *)&self->_ivarQueue, 0);
}

@end