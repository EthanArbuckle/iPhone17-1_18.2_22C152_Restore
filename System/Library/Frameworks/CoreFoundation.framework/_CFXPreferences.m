@interface _CFXPreferences
+ (id)copyDefaultPreferences;
- (BOOL)appValueIsForcedForKey:(__CFString *)a3 appIdentifier:;
- (BOOL)currentUserHasInvalidHomeDirectory;
- (BOOL)hasCloudValueForKey:(__CFString *)a3 appIdentifier:(const __CFString *)a4 container:(uint64_t)a5 configurationURL:;
- (BOOL)hasNonRegisteredValueForKey:(__CFString *)a3 appIdentifier:(const __CFString *)a4 container:(uint64_t)a5 configurationURL:;
- (CFMutableDictionaryRef)copyDictionaryForApp:(const __CFString *)a3 withContainer:;
- (CFMutableDictionaryRef)copyDictionaryForSourceWithIdentifier:(uint64_t)a1;
- (CFMutableDictionaryRef)copyManagedValuesForKeys:(__CFString *)a3 identifier:(int)a4 useSystemContainer:;
- (CFMutableDictionaryRef)copyValuesForKeys:(__CFString *)a3 identifier:(__CFString *)a4 user:(CFTypeRef)cf1 host:(const __CFString *)a6 container:;
- (CFMutableStringRef)copyDescriptionOfSearchLists;
- (_CFXPreferences)init;
- (_xpc_connection_s)_copyDaemonConnectionSettingUpIfNecessaryForRole:(const void *)a3 andUserIdentifier:;
- (uint64_t)_replaceDirectConnection:(uint64_t)result;
- (uint64_t)alreadylocked_withNamedVolatileSources:(uint64_t)result;
- (uint64_t)alreadylocked_withSearchLists:(uint64_t)result;
- (uint64_t)alreadylocked_withSources:(uint64_t)result;
- (uint64_t)appSynchronizeWithIdentifier:(const __CFString *)a3 container:;
- (uint64_t)copyDictionaryForVolatileSourceWithName:(uint64_t)a1;
- (uint64_t)copyKeyListForIdentifier:(const __CFString *)a3 user:(CFTypeRef)cf1 host:(const __CFString *)a5 container:;
- (uint64_t)euid;
- (uint64_t)fileProtectionClassForIdentifier:(const __CFString *)a3 user:(CFTypeRef)cf1 host:(const __CFString *)a5 container:;
- (uint64_t)preloadAppValuesForIdentifiers:(uint64_t)a3 containers:(uint64_t)a4 configurationURLs:(uint64_t)a5 count:;
- (uint64_t)shmemForRole:(const char *)a3 name:;
- (uint64_t)synchronizeIdentifier:(const __CFString *)a3 user:(CFTypeRef)cf1 host:(const __CFString *)a5 container:;
- (uint64_t)volatileSourceNames;
- (void)_deliverPendingKVONotifications;
- (void)_setupNewDaemonConnection:(uint64_t)a3 invalidationHandler:;
- (void)addSuitePreferences:(CFTypeRef)cf1 toAppIdentifier:(uint64_t)a4 container:;
- (void)assertEquivalence:(BOOL)a3 ofIdentifiers:(__CFArray *)a4 containers:(__CFArray *)a5 cloudConfigurationURLs:(__CFArray *)a6;
- (void)assertEquivalence:(BOOL)a3 ofIdentifiers:(__CFArray *)a4 users:(__CFArray *)a5 hosts:(__CFArray *)a6 containers:(__CFArray *)a7 managedFlags:(__CFArray *)a8 cloudFlags:(__CFArray *)a9;
- (void)copyAppValueForKey:(__CFString *)a3 identifier:(__CFString *)a4 container:(__CFString *)a5 configurationURL:(__CFURL *)a6;
- (void)copyValueForKey:(__CFString *)a3 identifier:(__CFString *)a4 user:(__CFString *)a5 host:(__CFString *)a6 container:(__CFString *)a7;
- (void)currentUserHasInvalidHomeDirectory;
- (void)dealloc;
- (void)destroyConnections;
- (void)flushCachesForAppIdentifier:(const void *)a3 user:;
- (void)flushManagedSources;
- (void)fullCloudSynchronizeForAppIdentifier:(const __CFString *)a3 container:(uint64_t)a4 configurationURL:(uint64_t)a5 completionHandler:;
- (void)generateKVONotificationsForIdentifier:(__CFString *)a3 withOldValues:(id)a4 newValues:(id)a5;
- (void)ingestVolatileStateFromPreferences:(uint64_t)a1;
- (void)registerDefaultValues:(__CFDictionary *)a3;
- (void)registerUserDefaultsInstance:(id)a3 configurationURL:(__CFURL *)a4;
- (void)removeSuite:(uint64_t)a3 fromApp:(uint64_t)a4 withContainer:;
- (void)removeVolatileSourceForName:(uint64_t)a1;
- (void)replaceSearchList:(uint64_t)a3 withSearchList:;
- (void)replaceValuesInSourceForIdentifier:(uint64_t)a3 user:(uint64_t)a4 host:(uint64_t)a5 container:(const __CFDictionary *)a6 withValues:;
- (void)replaceValuesInVolatileSourceNamed:(const __CFDictionary *)a3 withValues:;
- (void)resetPreferences:(BOOL)a3;
- (void)resetUserPreferences;
- (void)setAccessRestricted:(__CFString *)cf1 forAppIdentifier:;
- (void)setBackupDisabled:(__CFString *)cf1 identifier:(const __CFString *)a4 user:(const void *)a5 host:(const __CFString *)a6 container:;
- (void)setCloudSyncEnabled:(uint64_t)a3 forKey:(__CFString *)a4 appIdentifier:(const __CFString *)a5 container:;
- (void)setDaemonCacheEnabled:(BOOL)a3 identifier:(__CFString *)a4 user:(__CFString *)a5 host:(__CFString *)a6 container:(__CFString *)a7;
- (void)setFileProtectionClass:(__CFString *)cf1 identifier:(const __CFString *)a4 user:(const void *)a5 host:(const __CFString *)a6 container:;
- (void)setValue:(uint64_t)a3 forKey:(__CFString *)a4 identifier:(__CFString *)a5 user:(CFTypeRef)cf1 host:(const __CFString *)a7 container:;
- (void)setValue:(void *)a3 forKey:(__CFString *)a4 appIdentifier:(__CFString *)a5 container:(__CFString *)a6 configurationURL:(__CFURL *)a7;
- (void)setValuesForKeys:(uint64_t)a3 removingValuesForKeys:(__CFString *)a4 identifier:(__CFString *)a5 user:(CFTypeRef)cf1 host:(const __CFString *)a7 container:;
- (void)simulateTimerSynchronizeForTestingForUser:(__CFString *)a3;
- (void)synchronizeEverything;
- (void)unregisterUserDefaultsInstance:(id)a3;
- (void)updateSearchListsForIdentifier:(uint64_t)a1;
- (void)with23930198HackSourceForIdentifier:(__CFString *)a3 user:(int)a4 byHost:(const __CFString *)a5 container:(int)a6 cloud:(uint64_t)a7 perform:;
- (void)withConnectionForRole:(const void *)a3 andUserIdentifier:(uint64_t)a4 performBlock:;
- (void)withManagedSourceForIdentifier:(uint64_t)a3 user:(uint64_t)a4 perform:;
- (void)withNamedVolatileSourceForIdentifier:(uint64_t)a3 perform:;
- (void)withNamedVolatileSources:(uint64_t)a1;
- (void)withSearchListForIdentifier:(const __CFString *)a3 container:(uint64_t)a4 cloudConfigurationURL:(uint64_t)a5 perform:;
- (void)withSearchLists:(uint64_t)a1;
- (void)withSourceForIdentifier:(const __CFString *)cf2 user:(int)a4 byHost:(const __CFString *)a5 container:(int)a6 cloud:(uint64_t)a7 perform:;
- (void)withSources:(uint64_t)a1;
- (void)withSuiteSearchListForIdentifier:(const __CFString *)cf1 user:(int)a4 locked:(uint64_t)a5 perform:;
@end

@implementation _CFXPreferences

- (void)copyAppValueForKey:(__CFString *)a3 identifier:(__CFString *)a4 container:(__CFString *)a5 configurationURL:(__CFURL *)a6
{
  uint64_t v13 = *(void *)off_1ECE0A5B0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v8[0] = off_1ECE0A5A0;
  v8[1] = 3221225472;
  v8[2] = __76___CFXPreferences_copyAppValueForKey_identifier_container_configurationURL___block_invoke;
  v8[3] = &unk_1ECE00928;
  v8[4] = &v9;
  v8[5] = a3;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:]((uint64_t)self, a4, a5, (uint64_t)a6, (uint64_t)v8);
  v6 = (void *)v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)withSearchListForIdentifier:(const __CFString *)a3 container:(uint64_t)a4 cloudConfigurationURL:(uint64_t)a5 perform:
{
  v5[7] = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    v5[0] = off_1ECE0A5A0;
    v5[1] = 3221225472;
    v5[2] = __108___CFXPreferences_SearchListAdditions__withSearchListForIdentifier_container_cloudConfigurationURL_perform___block_invoke;
    v5[3] = &unk_1ECDFF190;
    v5[5] = a5;
    v5[6] = a4;
    v5[4] = a1;
    normalizeQuintuplet(a2, @"kCFPreferencesCurrentUser", 0, a3, a4 != 0, (uint64_t)v5);
  }
}

- (void)copyValueForKey:(__CFString *)a3 identifier:(__CFString *)a4 user:(__CFString *)a5 host:(__CFString *)a6 container:(__CFString *)a7
{
  uint64_t v20 = *(void *)off_1ECE0A5B0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v15[0] = off_1ECE0A5A0;
  v15[1] = 3221225472;
  v15[2] = __66___CFXPreferences_copyValueForKey_identifier_user_host_container___block_invoke;
  v15[3] = &unk_1ECE00B40;
  BOOL v12 = CFEqual(a6, @"kCFPreferencesCurrentHost") != 0;
  v15[4] = &v16;
  v15[5] = a3;
  -[_CFXPreferences with23930198HackSourceForIdentifier:user:byHost:container:cloud:perform:]((const os_unfair_lock *)self, a4, a5, v12, a7, 0, (uint64_t)v15);
  uint64_t v13 = (void *)v17[3];
  _Block_object_dispose(&v16, 8);
  return v13;
}

- (void)with23930198HackSourceForIdentifier:(__CFString *)a3 user:(int)a4 byHost:(const __CFString *)a5 container:(int)a6 cloud:(uint64_t)a7 perform:
{
  v18[6] = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return;
  }
  if ((a6 & 1) != 0 || !eduModeEnabled()) {
    goto LABEL_18;
  }
  if (appIsInternal_onceToken != -1) {
    dispatch_once(&appIsInternal_onceToken, &__block_literal_global_173);
  }
  if (!appIsInternal_isInternal || (__objc2_class **)_CFGetTSD(0xFu) == &__kCFBooleanTrue) {
    goto LABEL_18;
  }
  if (CFEqual(a3, @"kCFPreferencesCurrentUser"))
  {
    CFStringRef Copy = @"kCFPreferencesCurrentUser";
  }
  else
  {
    CFStringRef Copy = @"kCFPreferencesAnyUser";
    if (!CFEqual(a3, @"kCFPreferencesAnyUser"))
    {
      CFStringRef v15 = CFCopyUserName();
      int v17 = CFEqual(a3, v15);
      CFRelease(v15);
      if (@"kCFPreferencesCurrentUser" && v17)
      {
        CFRelease(@"kCFPreferencesCurrentUser");
        goto LABEL_21;
      }
      CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, a3);
    }
  }
  if (Copy) {
    CFRelease(Copy);
  }
  if (Copy != @"kCFPreferencesCurrentUser")
  {
LABEL_18:
    -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:]((uint64_t)a1, a2, a3, a4, a5, a6, a7);
    return;
  }
LABEL_21:
  _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
  BOOL v16 = _CFPrefsArmPendingKVOSlot();
  v18[0] = off_1ECE0A5A0;
  v18[1] = 3221225472;
  v18[2] = __112___CFXPreferences_SearchListAdditions__with23930198HackSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke;
  v18[3] = &unk_1ECDFF140;
  v18[4] = a1;
  v18[5] = a7;
  normalizeQuintuplet(a2, a3, a4, a5, 0, (uint64_t)v18);
  _CFSetTSD(0xFu, 0, 0);
  if (v16) {
    -[_CFXPreferences _deliverPendingKVONotifications](a1);
  }
}

- (BOOL)appValueIsForcedForKey:(__CFString *)a3 appIdentifier:
{
  uint64_t v15 = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return 0;
  }
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = off_1ECE0A5A0;
  v10[1] = 3221225472;
  v10[2] = __56___CFXPreferences_appValueIsForcedForKey_appIdentifier___block_invoke;
  v10[3] = &unk_1ECE008F8;
  v10[4] = &v11;
  v10[5] = a2;
  -[_CFXPreferences withManagedSourceForIdentifier:user:perform:](a1, a3, @"kCFPreferencesCurrentUser", (uint64_t)v10);
  int v6 = *((unsigned __int8 *)v12 + 24);
  if (!*((unsigned char *)v12 + 24))
  {
    v9[0] = off_1ECE0A5A0;
    v9[1] = 3221225472;
    v9[2] = __56___CFXPreferences_appValueIsForcedForKey_appIdentifier___block_invoke_2;
    v9[3] = &unk_1ECE008F8;
    v9[4] = &v11;
    v9[5] = a2;
    -[_CFXPreferences withManagedSourceForIdentifier:user:perform:](a1, a3, @"kCFPreferencesAnyUser", (uint64_t)v9);
    int v6 = *((unsigned __int8 *)v12 + 24);
  }
  BOOL v7 = v6 != 0;
  _Block_object_dispose(&v11, 8);
  return v7;
}

- (void)withManagedSourceForIdentifier:(uint64_t)a3 user:(uint64_t)a4 perform:
{
  uint64_t v16 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    CacheStringForBundleID = (__CFString *)_CFPrefsGetCacheStringForBundleID(a2);
    uint64_t v8 = _CFPrefsGetCacheStringForBundleID(CacheStringForBundleID);
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3052000000;
    uint64_t v13 = __Block_byref_object_copy__7;
    char v14 = __Block_byref_object_dispose__7;
    uint64_t v15 = 0;
    v9[0] = off_1ECE0A5A0;
    v9[1] = 3221225472;
    v9[2] = __85___CFXPreferences_PlistSourceAdditions__withManagedSourceForIdentifier_user_perform___block_invoke;
    v9[3] = &unk_1ECE012F0;
    void v9[6] = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"managed/%@/%@", v8, a3);
    v9[7] = CacheStringForBundleID;
    v9[8] = a3;
    v9[4] = a1;
    v9[5] = &v10;
    -[_CFXPreferences withSources:]((uint64_t)a1, (uint64_t)v9);
    LODWORD(a3) = _CFPrefsArmPendingKVOSlot();
    (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, v11[5]);

    if (a3) {
      -[_CFXPreferences _deliverPendingKVONotifications](a1);
    }
    _Block_object_dispose(&v10, 8);
  }
}

- (void)withSources:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 68));
    (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 8));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 68));
  }
}

- (void)withConnectionForRole:(const void *)a3 andUserIdentifier:(uint64_t)a4 performBlock:
{
  if (a1)
  {
    v5 = -[_CFXPreferences _copyDaemonConnectionSettingUpIfNecessaryForRole:andUserIdentifier:](a1, a2, a3);
    (*(void (**)(uint64_t, _xpc_connection_s *))(a4 + 16))(a4, v5);
    if (v5)
    {
      xpc_release(v5);
    }
  }
}

- (_xpc_connection_s)_copyDaemonConnectionSettingUpIfNecessaryForRole:(const void *)a3 andUserIdentifier:
{
  if (!a1) {
    return 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_CFPrefsDaemonLock);
  BOOL v6 = _CFPrefsDirectMode();
  if (a2 != 3 && !v6)
  {
    uint64_t v7 = 5;
    if (a2 == 2) {
      uint64_t v7 = 4;
    }
    uint64_t v8 = &a1[v7];
    uint64_t v9 = a1[v7];
    if (v9) {
      goto LABEL_25;
    }
    if (a2 == 1 && xpc_user_sessions_enabled() && !xpc_user_sessions_get_session_uid())
    {
      if (!a3 || (int v18 = _CFPreferencesUIDForUsername(a3), v18 == -101))
      {
        uint64_t v19 = _CFPrefsClientLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[_CFXPreferences _copyDaemonConnectionSettingUpIfNecessaryForRole:andUserIdentifier:]((uint64_t)a3, v19);
        }
        uint64_t v9 = 0;
        goto LABEL_26;
      }
      int v11 = v18;
      if (xpc_user_sessions_get_foreground_uid() != v18)
      {
        uint64_t v20 = _CFPrefsClientLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[_CFXPreferences _copyDaemonConnectionSettingUpIfNecessaryForRole:andUserIdentifier:]((uint64_t)a3, v11, v20);
        }
      }
      uint64_t v10 = &__block_literal_global_100;
    }
    else
    {
      uint64_t v10 = 0;
      int v11 = -101;
    }
    if (__CFProcessIsRestricted() || !getenv("__CFPreferencesTestDaemon"))
    {
      uint64_t v12 = "com.apple.cfprefsd.daemon";
      uint64_t v13 = "com.apple.cfprefsd.daemon.system";
    }
    else
    {
      uint64_t v12 = "com.apple.cfprefsd.daemon.test";
      uint64_t v13 = "com.apple.cfprefsd.daemon.system.test";
    }
    if (a2 == 2) {
      uint64_t v16 = v13;
    }
    else {
      uint64_t v16 = v12;
    }
    *uint64_t v8 = xpc_connection_create_mach_service(v16, 0, 0);
    if (v11 != -101) {
      xpc_connection_set_target_user_session_uid();
    }
    goto LABEL_24;
  }
  uint64_t v8 = a1 + 6;
  uint64_t v9 = a1[6];
  if (!v9)
  {
    if (directCFPrefsD_onceToken != -1) {
      dispatch_once(&directCFPrefsD_onceToken, &__block_literal_global_236);
    }
    char v14 = (_xpc_connection_s *)-[CFPrefsDaemon listener](directCFPrefsD_daemon);
    uint64_t v15 = xpc_endpoint_create(v14);
    *uint64_t v8 = xpc_connection_create_from_endpoint(v15);
    xpc_release(v15);
    uint64_t v10 = 0;
LABEL_24:
    -[_CFXPreferences _setupNewDaemonConnection:invalidationHandler:](a1, *v8, (uint64_t)v10);
    uint64_t v9 = *v8;
  }
LABEL_25:
  xpc_retain(v9);
LABEL_26:
  os_unfair_lock_unlock((os_unfair_lock_t)&_CFPrefsDaemonLock);
  return v9;
}

- (void)_setupNewDaemonConnection:(uint64_t)a3 invalidationHandler:
{
  location[1] = *(id *)off_1ECE0A5B0;
  if (val)
  {
    objc_initWeak(location, val);
    v5[0] = off_1ECE0A5A0;
    v5[1] = 3221225472;
    v5[2] = __65___CFXPreferences__setupNewDaemonConnection_invalidationHandler___block_invoke;
    v5[3] = &unk_1ECE00DB8;
    objc_copyWeak(&v6, location);
    v5[4] = a3;
    xpc_connection_set_event_handler(a2, v5);
    xpc_connection_activate(a2);
    objc_destroyWeak(&v6);
    objc_destroyWeak(location);
  }
}

- (void)registerUserDefaultsInstance:(id)a3 configurationURL:(__CFURL *)a4
{
  v4[5] = *(void *)off_1ECE0A5B0;
  v4[0] = off_1ECE0A5A0;
  v4[1] = 3221225472;
  v4[2] = __65___CFXPreferences_registerUserDefaultsInstance_configurationURL___block_invoke;
  v4[3] = &unk_1ECDFEF68;
  v4[4] = a3;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:]((uint64_t)self, (__CFString *)[a3 _identifier], (const __CFString *)objc_msgSend(a3, "_container"), (uint64_t)a4, (uint64_t)v4);
}

- (void)withSourceForIdentifier:(const __CFString *)cf2 user:(int)a4 byHost:(const __CFString *)a5 container:(int)a6 cloud:(uint64_t)a7 perform:
{
  uint64_t v49 = *(void *)off_1ECE0A5B0;
  unsigned __int8 v48 = a4;
  if (a1)
  {
    if (a4 && !CFEqual(@"kCFPreferencesAnyUser", cf2)) {
      unsigned __int8 v48 = 0;
    }
    CFStringRef v46 = 0;
    v47 = 0;
    CFStringRef v45 = 0;
    __int16 v44 = 0;
    _CFPrefsExtractQuadrupleFromPathIfPossible(a2, (CFStringRef *)&v47, &v46, (CFTypeRef *)&v45, &v48, (unsigned char *)&v44 + 1, &v44);
    CFStringRef v11 = v47;
    if (v47)
    {
      a2 = v47;
      if (a6) {
        -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:]();
      }
    }
    CFStringRef v12 = v45;
    CFStringRef v13 = v46;
    if (v46) {
      CFStringRef v14 = v46;
    }
    else {
      CFStringRef v14 = cf2;
    }
    if (v45) {
      a5 = v45;
    }
    CFStringRef v15 = _CFPrefsCopyUserForContainer(v14, a5);
    CFStringRef Copy = @"kCFPreferencesAnyUser";
    int v17 = CFEqual(@"kCFPreferencesAnyUser", v15);
    if (v48) {
      BOOL v18 = 1;
    }
    else {
      BOOL v18 = v17 == 0;
    }
    if (v18) {
      int v19 = v48;
    }
    else {
      int v19 = 1;
    }
    unsigned __int8 v48 = v19;
    v37[0] = off_1ECE0A5A0;
    v37[1] = 3221225472;
    v38 = __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke;
    v39 = &__block_descriptor_64_e5_v8__0l;
    CFStringRef v40 = v12;
    CFStringRef v41 = v11;
    CFStringRef v42 = v13;
    CFStringRef v43 = v15;
    if (HIBYTE(v44))
    {
      -[_CFXPreferences withManagedSourceForIdentifier:user:perform:]((const os_unfair_lock *)a1, a2, (uint64_t)v15, a7);
      v38(v37);
    }
    else
    {
      CacheStringForBundleID = (__CFString *)_CFPrefsGetCacheStringForBundleID(a2);
      if (CFEqual(v15, @"kCFPreferencesCurrentUser"))
      {
        CFStringRef Copy = @"kCFPreferencesCurrentUser";
      }
      else if (!CFEqual(v15, @"kCFPreferencesAnyUser"))
      {
        CFStringRef v21 = CFCopyUserName();
        BOOL v22 = CFEqual(v15, v21) == 0;
        CFRelease(v21);
        BOOL v23 = !v22;
        if (!@"kCFPreferencesCurrentUser") {
          BOOL v23 = 0;
        }
        CFStringRef Copy = @"kCFPreferencesCurrentUser";
        if (!v23) {
          CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, v15);
        }
      }
      if (withSourceForIdentifier_user_byHost_container_cloud_perform__registerOnce != -1) {
        dispatch_once(&withSourceForIdentifier_user_byHost_container_cloud_perform__registerOnce, &__block_literal_global_211);
      }
      CacheKeyForQuintuplet = _CFPrefsCreateCacheKeyForQuintuplet(CacheStringForBundleID, Copy, v19 != 0, a5, a6);
      uint64_t v31 = 0;
      v32 = &v31;
      uint64_t v33 = 0x3052000000;
      v34 = __Block_byref_object_copy__0;
      v35 = __Block_byref_object_dispose__0;
      uint64_t v36 = 0;
      v28[0] = off_1ECE0A5A0;
      v28[1] = 3221225472;
      v28[2] = __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_216;
      v28[3] = &unk_1ECDFD3B8;
      v28[6] = CacheKeyForQuintuplet;
      v28[7] = Copy;
      char v29 = a6;
      char v30 = v19;
      v28[8] = CacheStringForBundleID;
      v28[9] = a5;
      v28[4] = a1;
      v28[5] = &v31;
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 68));
      __96___CFXPreferences_SourceAdditions__withSourceForIdentifier_user_byHost_container_cloud_perform___block_invoke_216((uint64_t)v28, *(CFDictionaryRef *)(a1 + 8));
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 68));
      if (CacheKeyForQuintuplet) {
        CFRelease(CacheKeyForQuintuplet);
      }
      CFRelease(Copy);
      v38(v37);
      BOOL v25 = _CFPrefsArmPendingKVOSlot();
      (*(void (**)(uint64_t, uint64_t))(a7 + 16))(a7, v32[5]);

      if (v25) {
        -[_CFXPreferences _deliverPendingKVONotifications]((const os_unfair_lock *)a1);
      }
      _Block_object_dispose(&v31, 8);
    }
  }
}

- (void)_deliverPendingKVONotifications
{
  if (a1)
  {
    os_unfair_lock_assert_not_owner(a1 + 17);
    os_unfair_lock_assert_not_owner(a1 + 18);
    os_unfair_lock_assert_not_owner(a1 + 19);
    uint64_t v2 = _CFGetTSD(0x10u);
    if (v2)
    {
      CFArrayRef v3 = (const __CFArray *)v2;
      _CFSetTSD(0x10u, 0, 0);
      if (v3 != (const __CFArray *)16)
      {
        _CFPrefsDeliverPendingKVONotificationsGuts(v3);
        CFRelease(v3);
      }
    }
  }
}

- (void)withSearchLists:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 24));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (CFMutableDictionaryRef)copyDictionaryForApp:(const __CFString *)a3 withContainer:
{
  uint64_t v13 = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v8[0] = off_1ECE0A5A0;
  v8[1] = 3221225472;
  v8[2] = __54___CFXPreferences_copyDictionaryForApp_withContainer___block_invoke;
  v8[3] = &unk_1ECE00BB0;
  v8[4] = &v9;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:](a1, a2, a3, 0, (uint64_t)v8);
  CFDictionaryRef v3 = (const __CFDictionary *)v10[3];
  if (v3) {
    MutableCFStringRef Copy = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, v3);
  }
  else {
    MutableCFStringRef Copy = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  CFMutableDictionaryRef v5 = MutableCopy;
  id v6 = (const void *)v10[3];
  if (v6) {
    CFRelease(v6);
  }
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (CFMutableDictionaryRef)copyDictionaryForSourceWithIdentifier:(uint64_t)a1
{
  uint64_t v11 = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return 0;
  }
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = off_1ECE0A5A0;
  v6[1] = 3221225472;
  v6[2] = __57___CFXPreferences_copyDictionaryForSourceWithIdentifier___block_invoke;
  v6[3] = &unk_1ECE00958;
  v6[4] = &v7;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](a1, a2, @"kCFPreferencesCurrentUser", 0, 0, 0, (uint64_t)v6);
  CFDictionaryRef v2 = (const __CFDictionary *)v8[3];
  if (v2)
  {
    MutableCFStringRef Copy = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, v2);
    v4 = (const void *)v8[3];
    if (v4) {
      CFRelease(v4);
    }
  }
  else
  {
    MutableCFStringRef Copy = 0;
  }
  _Block_object_dispose(&v7, 8);
  return MutableCopy;
}

- (uint64_t)euid
{
  if (result) {
    return *(unsigned int *)(result + 60);
  }
  return result;
}

- (uint64_t)shmemForRole:(const char *)a3 name:
{
  block[5] = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return 0;
  }
  if (a2 != 3 && !_CFPrefsDirectMode())
  {
    if (a2 == 2)
    {
      if ((shmemForRole_name__cannotAccessDaemonShmem & 1) == 0)
      {
LABEL_14:
        os_unfair_lock_lock((os_unfair_lock_t)&_shmemLock);
        uint64_t v8 = &_daemonShmem;
        if (a2 != 2) {
          uint64_t v8 = &_agentShmem;
        }
        uint64_t v7 = (void *)*v8;
        if (*v8)
        {
          os_unfair_lock_unlock((os_unfair_lock_t)&_shmemLock);
          return (uint64_t)v7;
        }
        int v9 = shm_open(a3, 0, 0);
        if (v9 == -1)
        {
          uint64_t v7 = 0;
        }
        else
        {
          int v10 = v9;
          uint64_t v7 = mmap(0, 0x4000uLL, 1, 1, v9, 0);
          close(v10);
          if (v7 == (void *)-1)
          {
            if (a2 == 2)
            {
              uint64_t v7 = 0;
              shmemForRole_name__cannotAccessDaemonShmem = 1;
LABEL_24:
              _daemonShmem = (uint64_t)v7;
LABEL_27:
              os_unfair_lock_unlock((os_unfair_lock_t)&_shmemLock);
              if (v7) {
                return (uint64_t)v7;
              }
              block[0] = off_1ECE0A5A0;
              block[1] = 3221225472;
              block[2] = __37___CFXPreferences_shmemForRole_name___block_invoke;
              block[3] = &__block_descriptor_40_e5_v8__0l;
              block[4] = a3;
              if (shmemForRole_name__onceToken == -1) {
                return 0;
              }
              dispatch_once(&shmemForRole_name__onceToken, block);
              return 0;
            }
            uint64_t v7 = 0;
            shmemForRole_name__cannotAccessAgentShmem = 1;
LABEL_26:
            _agentShmem = (uint64_t)v7;
            goto LABEL_27;
          }
        }
        if (a2 == 2) {
          goto LABEL_24;
        }
        goto LABEL_26;
      }
    }
    else if ((shmemForRole_name__cannotAccessAgentShmem & 1) == 0)
    {
      goto LABEL_14;
    }
    return 0;
  }
  if (directCFPrefsD_onceToken != -1) {
    dispatch_once(&directCFPrefsD_onceToken, &__block_literal_global_236);
  }
  uint64_t v5 = directCFPrefsD_daemon;

  return -[CFPrefsDaemon shmem](v5);
}

- (BOOL)currentUserHasInvalidHomeDirectory
{
  if (result)
  {
    BOOL v1 = result;
    CFDictionaryRef v2 = (unsigned __int8 *)(result + 64);
    if (atomic_load((unsigned __int8 *)(result + 64)))
    {
LABEL_15:
      int v8 = atomic_load(v2);
      return v8 == 2;
    }
    v4 = (const char *)_CFUnsandboxedHomeDirectoryForCurrentUser();
    uint64_t v5 = (char *)v4;
    if (v4)
    {
      if (*v4 && strncmp(v4, "/var/empty", 0xAuLL))
      {
        atomic_store(1u, (unsigned __int8 *)(v1 + 64));
LABEL_14:
        free(v5);
        goto LABEL_15;
      }
      atomic_store(2u, (unsigned __int8 *)(v1 + 64));
      if (*v5) {
        id v6 = "starts with /var/empty";
      }
      else {
        id v6 = "is empty";
      }
    }
    else
    {
      atomic_store(2u, (unsigned __int8 *)(v1 + 64));
      id v6 = "is null";
    }
    _CFSetTSD(0xFu, (uint64_t)&__kCFBooleanTrue, 0);
    uint64_t v7 = _CFPrefsClientLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(_CFXPreferences *)(uint64_t)v6 currentUserHasInvalidHomeDirectory];
    }
    _CFSetTSD(0xFu, 0, 0);
    goto LABEL_14;
  }
  return result;
}

- (void)withSuiteSearchListForIdentifier:(const __CFString *)cf1 user:(int)a4 locked:(uint64_t)a5 perform:
{
  v27[4] = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v27[3] = a2;
    uint64_t v21 = 0;
    BOOL v22 = &v21;
    uint64_t v23 = 0x3052000000;
    v24 = __Block_byref_object_copy__2;
    BOOL v25 = __Block_byref_object_dispose__2;
    uint64_t v26 = 0;
    if (CFEqual(cf1, @"kCFPreferencesCurrentUser"))
    {
      CFStringRef Copy = @"kCFPreferencesCurrentUser";
    }
    else
    {
      CFStringRef Copy = @"kCFPreferencesAnyUser";
      if (!CFEqual(cf1, @"kCFPreferencesAnyUser"))
      {
        CFStringRef v11 = CFCopyUserName();
        int v12 = CFEqual(cf1, v11);
        CFRelease(v11);
        if (!@"kCFPreferencesCurrentUser" || (CFStringRef Copy = @"kCFPreferencesCurrentUser", !v12)) {
          CFStringRef Copy = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, cf1);
        }
      }
    }
    v13[0] = off_1ECE0A5A0;
    v13[1] = 3221225472;
    CFStringRef v14 = __93___CFXPreferences_SearchListAdditions__withSuiteSearchListForIdentifier_user_locked_perform___block_invoke;
    CFStringRef v15 = &unk_1ECDFF1E0;
    uint64_t v19 = a2;
    CFStringRef v20 = Copy;
    int v17 = v27;
    BOOL v18 = &v21;
    uint64_t v16 = a1;
    if (a4)
    {
      __93___CFXPreferences_SearchListAdditions__withSuiteSearchListForIdentifier_user_locked_perform___block_invoke((uint64_t)v13, *(const __CFDictionary **)(a1 + 24));
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
      v14((uint64_t)v13, *(const __CFDictionary **)(a1 + 24));
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    }
    (*(void (**)(uint64_t, uint64_t))(a5 + 16))(a5, v22[5]);

    CFRelease(Copy);
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(v27, 8);
  }
}

- (void)replaceSearchList:(uint64_t)a3 withSearchList:
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    v3[0] = off_1ECE0A5A0;
    v3[1] = 3221225472;
    v3[2] = __73___CFXPreferences_SearchListAdditions__replaceSearchList_withSearchList___block_invoke;
    v3[3] = &unk_1ECDFF208;
    v3[4] = a2;
    v3[5] = a3;
    uint64_t v4 = a1;
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeArrayCallBacks);
    __73___CFXPreferences_SearchListAdditions__replaceSearchList_withSearchList___block_invoke((uint64_t)v3, *(CFDictionaryRef *)(v4 + 24));
  }
}

- (uint64_t)appSynchronizeWithIdentifier:(const __CFString *)a3 container:
{
  uint64_t v10 = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return 0;
  }
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  v5[0] = off_1ECE0A5A0;
  v5[1] = 3221225472;
  v5[2] = __58___CFXPreferences_appSynchronizeWithIdentifier_container___block_invoke;
  v5[3] = &unk_1ECE00BB0;
  v5[4] = &v6;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:](a1, a2, a3, 0, (uint64_t)v5);
  uint64_t v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setValue:(void *)a3 forKey:(__CFString *)a4 appIdentifier:(__CFString *)a5 container:(__CFString *)a6 configurationURL:(__CFURL *)a7
{
  v7[6] = *(void *)off_1ECE0A5B0;
  v7[0] = off_1ECE0A5A0;
  v7[1] = 3221225472;
  v7[2] = __76___CFXPreferences_setValue_forKey_appIdentifier_container_configurationURL___block_invoke;
  v7[3] = &__block_descriptor_48_e33_v16__0__CFPrefsSearchListSource_8l;
  v7[4] = a3;
  v7[5] = a4;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:]((uint64_t)self, a5, a6, (uint64_t)a7, (uint64_t)v7);
}

- (uint64_t)copyDictionaryForVolatileSourceWithName:(uint64_t)a1
{
  uint64_t v2 = a1;
  uint64_t v14 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    uint64_t v10 = 0;
    CFStringRef v11 = &v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0;
    if (CFEqual(cf1, @"NSArgumentDomain") || CFEqual(cf1, @"NSRegistrationDomain"))
    {
      v9[0] = off_1ECE0A5A0;
      v9[1] = 3221225472;
      v9[2] = __59___CFXPreferences_copyDictionaryForVolatileSourceWithName___block_invoke;
      v9[3] = &unk_1ECE00958;
      v9[4] = &v10;
      -[_CFXPreferences withNamedVolatileSourceForIdentifier:perform:](v2, cf1, (uint64_t)v9);
    }
    else
    {
      v8[0] = off_1ECE0A5A0;
      v8[1] = 3221225472;
      v8[2] = __59___CFXPreferences_copyDictionaryForVolatileSourceWithName___block_invoke_2;
      v8[3] = &unk_1ECDFEF90;
      v8[4] = &v10;
      void v8[5] = _CFPrefsGetCacheStringForBundleID(cf1);
      -[_CFXPreferences withNamedVolatileSources:](v2, (uint64_t)v8);
    }
    CFDictionaryRef v4 = (const __CFDictionary *)v11[3];
    if (v4) {
      MutableCFStringRef Copy = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, v4);
    }
    else {
      MutableCFStringRef Copy = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    uint64_t v2 = (uint64_t)MutableCopy;
    uint64_t v6 = (const void *)v11[3];
    if (v6) {
      CFRelease(v6);
    }
    _Block_object_dispose(&v10, 8);
  }
  return v2;
}

- (void)replaceValuesInVolatileSourceNamed:(const __CFDictionary *)a3 withValues:
{
  void v3[6] = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    v3[0] = off_1ECE0A5A0;
    v3[1] = 3221225472;
    v3[2] = __65___CFXPreferences_replaceValuesInVolatileSourceNamed_withValues___block_invoke;
    v3[3] = &unk_1ECE00AD8;
    v3[4] = a1;
    v3[5] = a2;
    withKeysAndValues(a3, (uint64_t)v3);
  }
}

- (void)registerDefaultValues:(__CFDictionary *)a3
{
  v3[5] = *(void *)off_1ECE0A5B0;
  v3[0] = off_1ECE0A5A0;
  v3[1] = 3221225472;
  v3[2] = __41___CFXPreferences_registerDefaultValues___block_invoke;
  v3[3] = &unk_1ECE00BD8;
  v3[4] = self;
  withKeysAndValues(a3, (uint64_t)v3);
}

- (void)withNamedVolatileSourceForIdentifier:(uint64_t)a3 perform:
{
  uint64_t v13 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x3052000000;
    uint64_t v10 = __Block_byref_object_copy__0;
    CFStringRef v11 = __Block_byref_object_dispose__0;
    uint64_t v12 = 0;
    CFStringRef CacheStringForBundleID = (const __CFString *)_CFPrefsGetCacheStringForBundleID(a2);
    v6[0] = off_1ECE0A5A0;
    v6[1] = 3221225472;
    v6[2] = __81___CFXPreferences_SourceAdditions__withNamedVolatileSourceForIdentifier_perform___block_invoke;
    v6[3] = &unk_1ECDFD3E0;
    v6[4] = a1;
    void v6[5] = &v7;
    v6[6] = CFStringCreateCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, CacheStringForBundleID);
    v6[7] = CacheStringForBundleID;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 76));
    __81___CFXPreferences_SourceAdditions__withNamedVolatileSourceForIdentifier_perform___block_invoke((uint64_t)v6, *(CFDictionaryRef *)(a1 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 76));
    LODWORD(CacheStringForBundleID) = _CFPrefsArmPendingKVOSlot();
    (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, v8[5]);

    if (CacheStringForBundleID) {
      -[_CFXPreferences _deliverPendingKVONotifications]((const os_unfair_lock *)a1);
    }
    _Block_object_dispose(&v7, 8);
  }
}

- (void)updateSearchListsForIdentifier:(uint64_t)a1
{
  uint64_t v10 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x2020000000;
    uint64_t v9 = 0;
    v5[0] = off_1ECE0A5A0;
    v5[1] = 3221225472;
    v5[2] = __71___CFXPreferences_SearchListAdditions__updateSearchListsForIdentifier___block_invoke;
    v5[3] = &unk_1ECDFEFB8;
    v5[4] = &v6;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    __71___CFXPreferences_SearchListAdditions__updateSearchListsForIdentifier___block_invoke((uint64_t)v5, *(const __CFDictionary **)(a1 + 24));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    CFDictionaryRef v4 = (const __CFDictionary *)v7[3];
    if (v4)
    {
      CFDictionaryApplyFunction(v4, (CFDictionaryApplierFunction)notifySearchListOfRemoteChangesCallback, a2);
      CFRelease((CFTypeRef)v7[3]);
    }
    _Block_object_dispose(&v6, 8);
  }
}

- (void)synchronizeEverything
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    uint64_t v3 = 0;
    CFDictionaryRef v4 = &v3;
    uint64_t v5 = 0x2020000000;
    uint64_t v6 = 0;
    v2[0] = off_1ECE0A5A0;
    v2[1] = 3221225472;
    v2[2] = __40___CFXPreferences_synchronizeEverything__block_invoke;
    v2[3] = &unk_1ECDFEFB8;
    v2[4] = &v3;
    -[_CFXPreferences withSources:](a1, (uint64_t)v2);
    CFDictionaryRef v1 = (const __CFDictionary *)v4[3];
    if (v1)
    {
      CFDictionaryApplyFunction(v1, (CFDictionaryApplierFunction)synchronizeApplier, 0);
      CFRelease((CFTypeRef)v4[3]);
    }
    _Block_object_dispose(&v3, 8);
  }
}

- (void)setValue:(uint64_t)a3 forKey:(__CFString *)a4 identifier:(__CFString *)a5 user:(CFTypeRef)cf1 host:(const __CFString *)a7 container:
{
  v14[6] = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    v14[0] = off_1ECE0A5A0;
    v14[1] = 3221225472;
    v14[2] = __66___CFXPreferences_setValue_forKey_identifier_user_host_container___block_invoke;
    v14[3] = &__block_descriptor_48_e23_v16__0__CFPrefsSource_8l;
    BOOL v13 = CFEqual(cf1, @"kCFPreferencesCurrentHost") != 0;
    v14[4] = a2;
    v14[5] = a3;
    -[_CFXPreferences with23930198HackSourceForIdentifier:user:byHost:container:cloud:perform:](a1, a4, a5, v13, a7, 0, (uint64_t)v14);
  }
}

- (uint64_t)synchronizeIdentifier:(const __CFString *)a3 user:(CFTypeRef)cf1 host:(const __CFString *)a5 container:
{
  uint64_t v17 = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return 0;
  }
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  BOOL v9 = CFEqual(cf1, @"kCFPreferencesCurrentHost") != 0;
  v12[0] = off_1ECE0A5A0;
  v12[1] = 3221225472;
  v12[2] = __61___CFXPreferences_synchronizeIdentifier_user_host_container___block_invoke;
  v12[3] = &unk_1ECE00958;
  v12[4] = &v13;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](a1, a2, a3, v9, a5, 0, (uint64_t)v12);
  uint64_t v10 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (_CFXPreferences)init
{
  uint64_t v12 = *(void *)off_1ECE0A5B0;
  v11.receiver = self;
  v11.super_class = (Class)_CFXPreferences;
  uint64_t v2 = [(_CFXPreferences *)&v11 init];
  if (v2)
  {
    v2->_sources = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v2->_sourcesLock._os_unfair_lock_opaque = 0;
    v2->_namedVolatileSources = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v2->_namedVolatileSourcesLock._os_unfair_lock_opaque = 0;
    v2->_searchLists = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v2->_searchListsLock._os_unfair_lock_opaque = 0;
    v2->_launchdUID = -1;
    v2->_euid = _CFGetEUID();
    uint64_t v3 = (void *)xpc_copy_entitlement_for_self();
    CFDictionaryRef v4 = v3;
    if (v3 && object_getClass(v3) == (Class)off_1ECE0A668 && (size_t count = xpc_array_get_count(v4)) != 0)
    {
      size_t v7 = count;
      size_t v8 = 0;
      v2->_groupContainersForCurrentUser = CFSetCreateMutable(0, 0, &kCFTypeSetCallBacks);
      do
      {
        string = xpc_array_get_string(v4, v8);
        CFStringRef v10 = CFStringCreateWithCString(0, string, 0x8000100u);
        CFSetAddValue(v2->_groupContainersForCurrentUser, v10);
        CFRelease(v10);
        ++v8;
      }
      while (v7 != v8);
    }
    else
    {
      v2->_groupContainersForCurrentUser = 0;
    }
    if (v4) {
      xpc_release(v4);
    }
  }
  return v2;
}

- (CFMutableDictionaryRef)copyValuesForKeys:(__CFString *)a3 identifier:(__CFString *)a4 user:(CFTypeRef)cf1 host:(const __CFString *)a6 container:
{
  uint64_t v19 = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return 0;
  }
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  v14[0] = off_1ECE0A5A0;
  v14[1] = 3221225472;
  v14[2] = __68___CFXPreferences_copyValuesForKeys_identifier_user_host_container___block_invoke;
  v14[3] = &unk_1ECE00B40;
  BOOL v11 = CFEqual(cf1, @"kCFPreferencesCurrentHost") != 0;
  v14[4] = &v15;
  v14[5] = a2;
  -[_CFXPreferences with23930198HackSourceForIdentifier:user:byHost:container:cloud:perform:](a1, a3, a4, v11, a6, 0, (uint64_t)v14);
  CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)v16[3];
  if (!Mutable) {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  _Block_object_dispose(&v15, 8);
  return Mutable;
}

- (void)ingestVolatileStateFromPreferences:(uint64_t)a1
{
  v2[6] = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    if (a2 == a1) {
      -[_CFXPreferences ingestVolatileStateFromPreferences:]();
    }
    v2[0] = off_1ECE0A5A0;
    v2[1] = 3221225472;
    v2[2] = __54___CFXPreferences_ingestVolatileStateFromPreferences___block_invoke;
    v2[3] = &unk_1ECE00C50;
    v2[4] = a2;
    void v2[5] = a1;
    -[_CFXPreferences withNamedVolatileSources:](a1, (uint64_t)v2);
  }
}

- (void)withNamedVolatileSources:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 76));
    (*(void (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 76));
  }
}

- (uint64_t)copyKeyListForIdentifier:(const __CFString *)a3 user:(CFTypeRef)cf1 host:(const __CFString *)a5 container:
{
  uint64_t v19 = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return 0;
  }
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  BOOL v9 = CFEqual(cf1, @"kCFPreferencesCurrentHost") != 0;
  v14[0] = off_1ECE0A5A0;
  v14[1] = 3221225472;
  v14[2] = __64___CFXPreferences_copyKeyListForIdentifier_user_host_container___block_invoke;
  v14[3] = &unk_1ECE00958;
  v14[4] = &v15;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](a1, a2, a3, v9, a5, 0, (uint64_t)v14);
  CFArrayRef v10 = (const __CFArray *)v16[3];
  if (v10)
  {
    CFIndex Count = CFArrayGetCount(v10);
    uint64_t v12 = v16[3];
    if (!Count)
    {
      CFRelease((CFTypeRef)v16[3]);
      uint64_t v12 = 0;
      v16[3] = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  _Block_object_dispose(&v15, 8);
  return v12;
}

- (void)dealloc
{
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  -[_CFXPreferences destroyConnections](self);
  sources = self->_sources;
  if (sources) {
    CFRelease(sources);
  }
  namedVolatileSources = self->_namedVolatileSources;
  if (namedVolatileSources) {
    CFRelease(namedVolatileSources);
  }
  searchLists = self->_searchLists;
  if (searchLists) {
    CFRelease(searchLists);
  }
  groupContainersForCurrentUser = self->_groupContainersForCurrentUser;
  if (groupContainersForCurrentUser) {
    CFRelease(groupContainersForCurrentUser);
  }
  v7.receiver = self;
  v7.super_class = (Class)_CFXPreferences;
  [(_CFXPreferences *)&v7 dealloc];
}

- (void)destroyConnections
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_shmemLock);
    uint64_t v2 = (void *)a1[4];
    if (v2) {
      xpc_release(v2);
    }
    a1[4] = 0;
    uint64_t v3 = (void *)a1[5];
    if (v3) {
      xpc_release(v3);
    }
    a1[5] = 0;
    _daemonShmem = 0;
    _agentShmem = 0;
    CFDictionaryRef v4 = (void *)a1[6];
    if (v4) {
      xpc_release(v4);
    }
    a1[6] = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&_shmemLock);
  }
}

- (void)resetPreferences:(BOOL)a3
{
  uint64_t v10 = *(void *)off_1ECE0A5B0;
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v4[0] = off_1ECE0A5A0;
  v4[1] = 3221225472;
  v4[2] = __36___CFXPreferences_resetPreferences___block_invoke;
  v4[3] = &unk_1ECE00CF0;
  BOOL v5 = a3;
  v4[4] = self;
  v4[5] = &v6;
  -[_CFXPreferences withSearchLists:]((uint64_t)self, (uint64_t)v4);
  uint64_t v3 = (const void *)v7[3];
  if (v3) {
    CFRelease(v3);
  }
  _Block_object_dispose(&v6, 8);
}

- (void)setBackupDisabled:(__CFString *)cf1 identifier:(const __CFString *)a4 user:(const void *)a5 host:(const __CFString *)a6 container:
{
  uint64_t v15 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    if (CFEqual(cf1, @"kCFPreferencesAnyApplication")) {
      -[_CFXPreferences setBackupDisabled:identifier:user:host:container:]();
    }
    BOOL v12 = CFEqual(a5, @"kCFPreferencesCurrentHost") != 0;
    v13[0] = off_1ECE0A5A0;
    v13[1] = 3221225472;
    void v13[2] = __68___CFXPreferences_setBackupDisabled_identifier_user_host_container___block_invoke;
    v13[3] = &__block_descriptor_33_e23_v16__0__CFPrefsSource_8l;
    char v14 = a2;
    -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](a1, cf1, a4, v12, a6, 0, (uint64_t)v13);
  }
}

- (void)addSuitePreferences:(CFTypeRef)cf1 toAppIdentifier:(uint64_t)a4 container:
{
  v11[4] = *(void *)off_1ECE0A5B0;
  if (a1 && !CFEqual(cf1, a2))
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v11[3] = a2;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v10[3] = a4;
    BOOL v8 = _CFPrefsArmPendingKVOSlot();
    v9[0] = off_1ECE0A5A0;
    v9[1] = 3221225472;
    v9[2] = __65___CFXPreferences_addSuitePreferences_toAppIdentifier_container___block_invoke;
    v9[3] = &unk_1ECE00A40;
    v9[4] = a1;
    void v9[5] = v11;
    void v9[6] = v10;
    v9[7] = cf1;
    -[_CFXPreferences withSearchLists:]((uint64_t)a1, (uint64_t)v9);
    if (v8) {
      -[_CFXPreferences _deliverPendingKVONotifications](a1);
    }
    _Block_object_dispose(v10, 8);
    _Block_object_dispose(v11, 8);
  }
}

- (void)currentUserHasInvalidHomeDirectory
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_182B90000, a2, OS_LOG_TYPE_ERROR, "All kCFPreferencesCurrentUser domains in this process will be volatile, because homeDirPath %{public}s", (uint8_t *)&v2, 0xCu);
}

- (uint64_t)alreadylocked_withSources:(uint64_t)result
{
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(result + 8));
  }
  return result;
}

- (uint64_t)alreadylocked_withNamedVolatileSources:(uint64_t)result
{
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(result + 16));
  }
  return result;
}

- (void)assertEquivalence:(BOOL)a3 ofIdentifiers:(__CFArray *)a4 users:(__CFArray *)a5 hosts:(__CFArray *)a6 containers:(__CFArray *)a7 managedFlags:(__CFArray *)a8 cloudFlags:(__CFArray *)a9
{
  uint64_t v40 = *(void *)off_1ECE0A5B0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3052000000;
  v37 = __Block_byref_object_copy__0;
  v38 = __Block_byref_object_dispose__0;
  uint64_t v39 = 0;
  CFIndex Count = CFArrayGetCount(a4);
  if (Count != CFArrayGetCount(a7)
    || (CFIndex v11 = CFArrayGetCount(a4), v11 != CFArrayGetCount(a5))
    || (CFIndex v12 = CFArrayGetCount(a4), v12 != CFArrayGetCount(a6))
    || (CFIndex v13 = CFArrayGetCount(a4), v13 != CFArrayGetCount(a7))
    || (CFIndex v14 = CFArrayGetCount(a4), v14 != CFArrayGetCount(a8))
    || (CFIndex v15 = CFArrayGetCount(a4), v15 != CFArrayGetCount(a9)))
  {
    __assert_rtn("-[_CFXPreferences(SourceAdditions) assertEquivalence:ofIdentifiers:users:hosts:containers:managedFlags:cloudFlags:]", "CFPrefsSource.m", 1252, "CFArrayGetCount(identifiers) == CFArrayGetCount(containers) && CFArrayGetCount(identifiers) == CFArrayGetCount(users) && CFArrayGetCount(identifiers) == CFArrayGetCount(hosts) && CFArrayGetCount(identifiers) == CFArrayGetCount(containers) && CFArrayGetCount(identifiers) == CFArrayGetCount(managedFlags) && CFArrayGetCount(identifiers) == CFArrayGetCount(isCloudFlags)");
  }
  for (CFIndex i = 0; i < CFArrayGetCount(a4); ++i)
  {
    ValueAtIndex = (__objc2_class **)CFArrayGetValueAtIndex(a7, i);
    uint64_t v18 = (__CFString *)CFArrayGetValueAtIndex(a6, i);
    uint64_t v19 = (__objc2_class **)CFArrayGetValueAtIndex(a9, i);
    CFStringRef v20 = (__objc2_class **)CFArrayGetValueAtIndex(a8, i);
    uint64_t v21 = (__CFString *)CFArrayGetValueAtIndex(a4, i);
    CFStringRef v22 = (const __CFString *)CFArrayGetValueAtIndex(a5, i);
    if (v20 == &__kCFBooleanTrue && v19 == &__kCFBooleanTrue) {
      __assert_rtn("-[_CFXPreferences(SourceAdditions) assertEquivalence:ofIdentifiers:users:hosts:containers:managedFlags:cloudFlags:]", "CFPrefsSource.m", 1260, "!(managed && cloud)");
    }
    v32[0] = off_1ECE0A5A0;
    v32[1] = 3221225472;
    v32[2] = __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke;
    v32[3] = &unk_1ECDFD408;
    v32[4] = &v34;
    BOOL v33 = a3;
    if (v20 == &__kCFBooleanTrue)
    {
      v31[0] = off_1ECE0A5A0;
      v31[1] = 3221225472;
      v31[2] = __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke_2;
      v31[3] = &unk_1ECDFD430;
      v31[4] = v32;
      -[_CFXPreferences withManagedSourceForIdentifier:user:perform:]((const os_unfair_lock *)self, v21, (uint64_t)v22, (uint64_t)v31);
    }
    else
    {
      if (ValueAtIndex == &__kCFNull) {
        CFStringRef v23 = 0;
      }
      else {
        CFStringRef v23 = (const __CFString *)ValueAtIndex;
      }
      v30[0] = off_1ECE0A5A0;
      v30[1] = 3221225472;
      v30[2] = __115___CFXPreferences_SourceAdditions__assertEquivalence_ofIdentifiers_users_hosts_containers_managedFlags_cloudFlags___block_invoke_3;
      v30[3] = &unk_1ECDFD458;
      v30[4] = v32;
      -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:]((uint64_t)self, v21, v22, v18 == @"kCFPreferencesCurrentHost", v23, v19 == &__kCFBooleanTrue, (uint64_t)v30);
    }
  }

  _Block_object_dispose(&v34, 8);
}

- (CFMutableStringRef)copyDescriptionOfSearchLists
{
  v4[5] = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return 0;
  }
  CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0);
  v4[0] = off_1ECE0A5A0;
  v4[1] = 3221225472;
  v4[2] = __68___CFXPreferences_SearchListAdditions__copyDescriptionOfSearchLists__block_invoke;
  v4[3] = &__block_descriptor_40_e25_v16__0____CFDictionary__8l;
  v4[4] = Mutable;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  __68___CFXPreferences_SearchListAdditions__copyDescriptionOfSearchLists__block_invoke((uint64_t)v4, *(CFDictionaryRef *)(a1 + 24));
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  return Mutable;
}

- (void)assertEquivalence:(BOOL)a3 ofIdentifiers:(__CFArray *)a4 containers:(__CFArray *)a5 cloudConfigurationURLs:(__CFArray *)a6
{
  uint64_t v27 = *(void *)off_1ECE0A5B0;
  uint64_t v21 = 0;
  CFStringRef v22 = &v21;
  uint64_t v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__2;
  BOOL v25 = __Block_byref_object_dispose__2;
  uint64_t v26 = 0;
  CFIndex Count = CFArrayGetCount(a4);
  if (Count != CFArrayGetCount(a5) || (CFIndex v12 = CFArrayGetCount(a4), v12 != CFArrayGetCount(a6))) {
    __assert_rtn("-[_CFXPreferences(SearchListAdditions) assertEquivalence:ofIdentifiers:containers:cloudConfigurationURLs:]", "CFPrefsSearchListSource.m", 1770, "CFArrayGetCount(identifiers) == CFArrayGetCount(containers) && CFArrayGetCount(identifiers) == CFArrayGetCount(cloudURLs)");
  }
  for (CFIndex i = 0; i < CFArrayGetCount(a4); ++i)
  {
    ValueAtIndex = (__objc2_class **)CFArrayGetValueAtIndex(a5, i);
    CFIndex v15 = (__objc2_class **)CFArrayGetValueAtIndex(a6, i);
    char v16 = (__CFString *)CFArrayGetValueAtIndex(a4, i);
    if (ValueAtIndex == &__kCFNull) {
      CFStringRef v17 = 0;
    }
    else {
      CFStringRef v17 = (const __CFString *)ValueAtIndex;
    }
    v19[0] = off_1ECE0A5A0;
    v19[1] = 3221225472;
    v19[2] = __106___CFXPreferences_SearchListAdditions__assertEquivalence_ofIdentifiers_containers_cloudConfigurationURLs___block_invoke;
    v19[3] = &unk_1ECDFF1B8;
    if (v15 == &__kCFNull) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = (uint64_t)v15;
    }
    v19[4] = &v21;
    BOOL v20 = a3;
    -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:]((uint64_t)self, v16, v17, v18, (uint64_t)v19);
  }

  _Block_object_dispose(&v21, 8);
}

- (uint64_t)alreadylocked_withSearchLists:(uint64_t)result
{
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(result + 24));
  }
  return result;
}

+ (id)copyDefaultPreferences
{
  if (_CFPrefsCurrentProcessIsCFPrefsD()) {
    return 0;
  }
  if (_CFPrefsCopyDefaultPreferences_onceToken != -1) {
    dispatch_once(&_CFPrefsCopyDefaultPreferences_onceToken, &__block_literal_global_229);
  }
  uint64_t v3 = (void *)_CFPrefsCopyDefaultPreferences_defaultPrefs;

  return (id)[v3 copyPrefs];
}

- (void)unregisterUserDefaultsInstance:(id)a3
{
  v3[5] = *(void *)off_1ECE0A5B0;
  v3[0] = off_1ECE0A5A0;
  v3[1] = 3221225472;
  v3[2] = __50___CFXPreferences_unregisterUserDefaultsInstance___block_invoke;
  v3[3] = &unk_1ECDFEF68;
  v3[4] = a3;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:]((uint64_t)self, (__CFString *)[a3 _identifier], (const __CFString *)objc_msgSend(a3, "_container"), 0, (uint64_t)v3);
}

- (void)flushManagedSources
{
  void v2[5] = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    v2[0] = off_1ECE0A5A0;
    v2[1] = 3221225472;
    v2[2] = __38___CFXPreferences_flushManagedSources__block_invoke;
    v2[3] = &unk_1ECE00348;
    v2[4] = a1;
    if (xpc_user_sessions_enabled()) {
      -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](a1, 2, 0, (uint64_t)v2);
    }
    -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](a1, 1, 0, (uint64_t)v2);
    _CFPrefsResetManagedPreferencesStateCache();
  }
}

- (BOOL)hasCloudValueForKey:(__CFString *)a3 appIdentifier:(const __CFString *)a4 container:(uint64_t)a5 configurationURL:
{
  uint64_t v12 = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return 0;
  }
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = off_1ECE0A5A0;
  v7[1] = 3221225472;
  v7[2] = __80___CFXPreferences_hasCloudValueForKey_appIdentifier_container_configurationURL___block_invoke;
  v7[3] = &unk_1ECE00928;
  v7[4] = &v8;
  v7[5] = a2;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:](a1, a3, a4, a5, (uint64_t)v7);
  BOOL v5 = *((unsigned char *)v9 + 24) != 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)hasNonRegisteredValueForKey:(__CFString *)a3 appIdentifier:(const __CFString *)a4 container:(uint64_t)a5 configurationURL:
{
  uint64_t v12 = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return 0;
  }
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = off_1ECE0A5A0;
  v7[1] = 3221225472;
  v7[2] = __88___CFXPreferences_hasNonRegisteredValueForKey_appIdentifier_container_configurationURL___block_invoke;
  v7[3] = &unk_1ECE00928;
  v7[4] = &v8;
  v7[5] = a2;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:](a1, a3, a4, a5, (uint64_t)v7);
  BOOL v5 = *((unsigned char *)v9 + 24) != 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)setDaemonCacheEnabled:(BOOL)a3 identifier:(__CFString *)a4 user:(__CFString *)a5 host:(__CFString *)a6 container:(__CFString *)a7
{
  uint64_t v15 = *(void *)off_1ECE0A5B0;
  BOOL v12 = CFEqual(a6, @"kCFPreferencesCurrentHost") != 0;
  v13[0] = off_1ECE0A5A0;
  v13[1] = 3221225472;
  void v13[2] = __72___CFXPreferences_setDaemonCacheEnabled_identifier_user_host_container___block_invoke;
  v13[3] = &__block_descriptor_33_e23_v16__0__CFPrefsSource_8l;
  BOOL v14 = a3;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:]((uint64_t)self, a4, a5, v12, a7, 0, (uint64_t)v13);
}

- (void)flushCachesForAppIdentifier:(const void *)a3 user:
{
  uint64_t v9 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    uint64_t CacheStringForBundleID = _CFPrefsGetCacheStringForBundleID(a2);
    int v6 = 1;
    if (xpc_user_sessions_enabled())
    {
      if (CFEqual(a3, @"kCFPreferencesAnyUser")) {
        int v6 = 2;
      }
      else {
        int v6 = 1;
      }
      if (!xpc_user_sessions_get_session_uid())
      {
        if (CFEqual(a3, @"kCFPreferencesCurrentUser")) {
          int v6 = 2;
        }
      }
    }
    v7[0] = off_1ECE0A5A0;
    v7[1] = 3221225472;
    v7[2] = __52___CFXPreferences_flushCachesForAppIdentifier_user___block_invoke;
    v7[3] = &unk_1ECE009A0;
    int v8 = v6;
    v7[4] = a1;
    v7[5] = CacheStringForBundleID;
    -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](a1, v6, a3, (uint64_t)v7);
  }
}

- (void)simulateTimerSynchronizeForTestingForUser:(__CFString *)a3
{
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  int v5 = 1;
  if (xpc_user_sessions_enabled())
  {
    if (CFEqual(@"kCFPreferencesAnyUser", a3)) {
      int v5 = 2;
    }
    else {
      int v5 = 1;
    }
  }
  v6[0] = off_1ECE0A5A0;
  v6[1] = 3221225472;
  v6[2] = __61___CFXPreferences_simulateTimerSynchronizeForTestingForUser___block_invoke;
  v6[3] = &unk_1ECE009C8;
  int v7 = v5;
  v6[4] = self;
  -[_CFXPreferences withConnectionForRole:andUserIdentifier:performBlock:](&self->super.isa, v5, a3, (uint64_t)v6);
}

- (void)setFileProtectionClass:(__CFString *)cf1 identifier:(const __CFString *)a4 user:(const void *)a5 host:(const __CFString *)a6 container:
{
  uint64_t v15 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    if (CFEqual(cf1, @"kCFPreferencesAnyApplication")) {
      -[_CFXPreferences setFileProtectionClass:identifier:user:host:container:]();
    }
    BOOL v12 = CFEqual(a5, @"kCFPreferencesCurrentHost") != 0;
    v13[0] = off_1ECE0A5A0;
    v13[1] = 3221225472;
    void v13[2] = __73___CFXPreferences_setFileProtectionClass_identifier_user_host_container___block_invoke;
    v13[3] = &__block_descriptor_36_e23_v16__0__CFPrefsSource_8l;
    int v14 = a2;
    -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](a1, cf1, a4, v12, a6, 0, (uint64_t)v13);
  }
}

- (uint64_t)fileProtectionClassForIdentifier:(const __CFString *)a3 user:(CFTypeRef)cf1 host:(const __CFString *)a5 container:
{
  uint64_t v17 = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return 0;
  }
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = -1;
  BOOL v9 = CFEqual(cf1, @"kCFPreferencesCurrentHost") != 0;
  v12[0] = off_1ECE0A5A0;
  v12[1] = 3221225472;
  v12[2] = __72___CFXPreferences_fileProtectionClassForIdentifier_user_host_container___block_invoke;
  v12[3] = &unk_1ECE00958;
  v12[4] = &v13;
  -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](a1, a2, a3, v9, a5, 0, (uint64_t)v12);
  uint64_t v10 = *((unsigned int *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (void)setAccessRestricted:(__CFString *)cf1 forAppIdentifier:
{
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    if (CFEqual(cf1, @"kCFPreferencesAnyApplication")) {
      -[_CFXPreferences setAccessRestricted:forAppIdentifier:]();
    }
    v6[0] = off_1ECE0A5A0;
    v6[1] = 3221225472;
    v6[2] = __56___CFXPreferences_setAccessRestricted_forAppIdentifier___block_invoke;
    v6[3] = &__block_descriptor_33_e23_v16__0__CFPrefsSource_8l;
    char v7 = a2;
    -[_CFXPreferences withSourceForIdentifier:user:byHost:container:cloud:perform:](a1, cf1, @"kCFPreferencesAnyUser", 1, 0, 0, (uint64_t)v6);
  }
}

- (void)fullCloudSynchronizeForAppIdentifier:(const __CFString *)a3 container:(uint64_t)a4 configurationURL:(uint64_t)a5 completionHandler:
{
  void v5[5] = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    v5[0] = off_1ECE0A5A0;
    v5[1] = 3221225472;
    v5[2] = __101___CFXPreferences_fullCloudSynchronizeForAppIdentifier_container_configurationURL_completionHandler___block_invoke;
    v5[3] = &unk_1ECE00A68;
    v5[4] = a5;
    -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:](a1, a2, a3, a4, (uint64_t)v5);
  }
}

- (void)setCloudSyncEnabled:(uint64_t)a3 forKey:(__CFString *)a4 appIdentifier:(const __CFString *)a5 container:
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    v5[0] = off_1ECE0A5A0;
    v5[1] = 3221225472;
    v5[2] = __70___CFXPreferences_setCloudSyncEnabled_forKey_appIdentifier_container___block_invoke;
    v5[3] = &__block_descriptor_41_e33_v16__0__CFPrefsSearchListSource_8l;
    char v6 = a2;
    v5[4] = a3;
    -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:](a1, a4, a5, 0, (uint64_t)v5);
  }
}

- (void)setValuesForKeys:(uint64_t)a3 removingValuesForKeys:(__CFString *)a4 identifier:(__CFString *)a5 user:(CFTypeRef)cf1 host:(const __CFString *)a7 container:
{
  void v14[6] = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    v14[0] = off_1ECE0A5A0;
    v14[1] = 3221225472;
    v14[2] = __89___CFXPreferences_setValuesForKeys_removingValuesForKeys_identifier_user_host_container___block_invoke;
    v14[3] = &__block_descriptor_48_e23_v16__0__CFPrefsSource_8l;
    BOOL v13 = CFEqual(cf1, @"kCFPreferencesCurrentHost") != 0;
    v14[4] = a2;
    void v14[5] = a3;
    -[_CFXPreferences with23930198HackSourceForIdentifier:user:byHost:container:cloud:perform:](a1, a4, a5, v13, a7, 0, (uint64_t)v14);
  }
}

- (CFMutableDictionaryRef)copyManagedValuesForKeys:(__CFString *)a3 identifier:(int)a4 useSystemContainer:
{
  uint64_t v17 = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return 0;
  }
  CFStringRef v7 = 0;
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  if (a4)
  {
    CFURLRef v8 = _CFPreferencesCopyManagedPreferencesContainerURL();
    CFURLRef v9 = v8;
    if (v8)
    {
      CFStringRef v7 = CFURLCopyFileSystemPath(v8, kCFURLPOSIXPathStyle);
      CFRelease(v9);
    }
    else
    {
      CFStringRef v7 = 0;
    }
  }
  v12[0] = off_1ECE0A5A0;
  v12[1] = 3221225472;
  v12[2] = __74___CFXPreferences_copyManagedValuesForKeys_identifier_useSystemContainer___block_invoke;
  v12[3] = &unk_1ECE00928;
  v12[4] = &v13;
  void v12[5] = a2;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:](a1, a3, v7, 0, (uint64_t)v12);
  CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)v14[3];
  if (!Mutable) {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  _Block_object_dispose(&v13, 8);
  return Mutable;
}

- (uint64_t)preloadAppValuesForIdentifiers:(uint64_t)a3 containers:(uint64_t)a4 configurationURLs:(uint64_t)a5 count:
{
  if (result) {
    return +[CFPrefsSearchListSource preloadDomainsForIdentifiers:containers:cloudConfigurationURLs:count:containingPreferences:](CFPrefsSearchListSource, a2, a3, a4, a5, result);
  }
  return result;
}

- (void)replaceValuesInSourceForIdentifier:(uint64_t)a3 user:(uint64_t)a4 host:(uint64_t)a5 container:(const __CFDictionary *)a6 withValues:
{
  v6[9] = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    v6[0] = off_1ECE0A5A0;
    v6[1] = 3221225472;
    v6[2] = __85___CFXPreferences_replaceValuesInSourceForIdentifier_user_host_container_withValues___block_invoke;
    v6[3] = &unk_1ECE00B88;
    void v6[4] = a1;
    void v6[5] = a2;
    v6[6] = a3;
    v6[7] = a4;
    void v6[8] = a5;
    withKeysAndValues(a6, (uint64_t)v6);
  }
}

- (void)removeVolatileSourceForName:(uint64_t)a1
{
  v4[5] = *(void *)off_1ECE0A5B0;
  if (a1 && !CFEqual(cf1, @"NSArgumentDomain") && !CFEqual(cf1, @"NSRegistrationDomain"))
  {
    v4[0] = off_1ECE0A5A0;
    v4[1] = 3221225472;
    v4[2] = __47___CFXPreferences_removeVolatileSourceForName___block_invoke;
    v4[3] = &__block_descriptor_40_e25_v16__0____CFDictionary__8l;
    v4[4] = _CFPrefsGetCacheStringForBundleID(cf1);
    -[_CFXPreferences withNamedVolatileSources:](a1, (uint64_t)v4);
  }
}

- (uint64_t)volatileSourceNames
{
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  if (!a1) {
    return 0;
  }
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  v3[0] = off_1ECE0A5A0;
  v3[1] = 3221225472;
  v3[2] = __38___CFXPreferences_volatileSourceNames__block_invoke;
  v3[3] = &unk_1ECDFEFB8;
  v3[4] = &v4;
  -[_CFXPreferences withNamedVolatileSources:](a1, (uint64_t)v3);
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (void)resetUserPreferences
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = &v3;
    uint64_t v5 = 0x2020000000;
    uint64_t v6 = 0;
    v2[0] = off_1ECE0A5A0;
    v2[1] = 3221225472;
    v2[2] = __39___CFXPreferences_resetUserPreferences__block_invoke;
    v2[3] = &unk_1ECE00D68;
    v2[4] = a1;
    void v2[5] = &v3;
    -[_CFXPreferences withSearchLists:](a1, (uint64_t)v2);
    uint64_t v1 = (const void *)v4[3];
    if (v1) {
      CFRelease(v1);
    }
    _Block_object_dispose(&v3, 8);
  }
}

- (uint64_t)_replaceDirectConnection:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = (xpc_object_t *)result;
    os_unfair_lock_lock((os_unfair_lock_t)&_CFPrefsDaemonLock);
    uint64_t v4 = (_xpc_connection_s *)v3[6];
    if (v4)
    {
      xpc_connection_cancel(v4);
      xpc_release(v3[6]);
      void v3[6] = 0;
    }
    void v3[6] = xpc_retain(a2);
    -[_CFXPreferences _setupNewDaemonConnection:invalidationHandler:](v3, (_xpc_connection_s *)a2, 0);
    os_unfair_lock_unlock((os_unfair_lock_t)&_CFPrefsDaemonLock);
    return [(xpc_object_t *)v3 resetPreferences:0];
  }
  return result;
}

- (void)removeSuite:(uint64_t)a3 fromApp:(uint64_t)a4 withContainer:
{
  void v9[8] = *(void *)off_1ECE0A5B0;
  if (a1)
  {
    BOOL v8 = _CFPrefsArmPendingKVOSlot();
    v9[0] = off_1ECE0A5A0;
    v9[1] = 3221225472;
    v9[2] = __53___CFXPreferences_removeSuite_fromApp_withContainer___block_invoke;
    v9[3] = &unk_1ECE00E30;
    v9[4] = a1;
    void v9[5] = a3;
    void v9[6] = a2;
    v9[7] = a4;
    -[_CFXPreferences withSearchLists:]((uint64_t)a1, (uint64_t)v9);
    if (v8) {
      -[_CFXPreferences _deliverPendingKVONotifications](a1);
    }
  }
}

- (void)generateKVONotificationsForIdentifier:(__CFString *)a3 withOldValues:(id)a4 newValues:(id)a5
{
  v10[7] = *(void *)off_1ECE0A5B0;
  uint64_t v9 = [a4 count];
  if (v9 != [a5 count]) {
    -[_CFXPreferences generateKVONotificationsForIdentifier:withOldValues:newValues:]();
  }
  v10[0] = off_1ECE0A5A0;
  v10[1] = 3221225472;
  v10[2] = __81___CFXPreferences_generateKVONotificationsForIdentifier_withOldValues_newValues___block_invoke;
  v10[3] = &unk_1ECE00E80;
  void v10[4] = a4;
  v10[5] = a5;
  void v10[6] = self;
  -[_CFXPreferences withSearchListForIdentifier:container:cloudConfigurationURL:perform:]((uint64_t)self, a3, 0, 0, (uint64_t)v10);
}

- (void)withSourceForIdentifier:user:byHost:container:cloud:perform:.cold.1()
{
}

- (void)ingestVolatileStateFromPreferences:.cold.1()
{
  __assert_rtn("-[_CFXPreferences ingestVolatileStateFromPreferences:]", "CFXPreferences.m", 1218, "prefs != self");
}

- (void)setBackupDisabled:identifier:user:host:container:.cold.1()
{
  qword_1EC093AA8 = (uint64_t)"Attempt to disable backups of global preferences";
  abort();
}

- (void)setFileProtectionClass:identifier:user:host:container:.cold.1()
{
  qword_1EC093AA8 = (uint64_t)"Attempt to set file protection of global preferences";
  abort();
}

- (void)setAccessRestricted:forAppIdentifier:.cold.1()
{
  qword_1EC093AA8 = (uint64_t)"Attempt to set custom permissions on global preferences";
  abort();
}

- (void)_copyDaemonConnectionSettingUpIfNecessaryForRole:(uint64_t)a1 andUserIdentifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_182B90000, a2, OS_LOG_TYPE_ERROR, "Could not resolve UID for user identifier %@. Please use _CFPreferencesGetUserIdentifierForUid() to target a specific user", (uint8_t *)&v2, 0xCu);
}

- (void)_copyDaemonConnectionSettingUpIfNecessaryForRole:(os_log_t)log andUserIdentifier:.cold.2(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *(void *)off_1ECE0A5B0;
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_182B90000, log, OS_LOG_TYPE_ERROR, "Could not target user session daemon connection for user %@: user session with UID %i is not active", (uint8_t *)&v3, 0x12u);
}

- (void)generateKVONotificationsForIdentifier:withOldValues:newValues:.cold.1()
{
  __assert_rtn("-[_CFXPreferences generateKVONotificationsForIdentifier:withOldValues:newValues:]", "CFXPreferences.m", 1775, "oldValues.count == newValues.count");
}

@end