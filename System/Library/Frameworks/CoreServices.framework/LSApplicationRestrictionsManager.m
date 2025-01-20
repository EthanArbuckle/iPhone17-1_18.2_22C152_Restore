@interface LSApplicationRestrictionsManager
+ (id)activeRestrictionIdentifiers;
+ (id)sharedInstance;
- (BOOL)_LSApplyRestrictedSet:(id)a3 forRestriction:(id)a4;
- (BOOL)cleanRemovedSystemApplicationsList;
- (BOOL)forceUpdateRestrictionKnowledgeWithError:(void *)a1;
- (BOOL)isAllowlistEnabled;
- (BOOL)isAppExtensionRestricted:(BOOL)a1;
- (BOOL)isFeatureAllowed:(id)a3;
- (BOOL)isRatingAllowed:(void *)a1;
- (LSApplicationRestrictionsManager)init;
- (MOEffectiveSettings)effectiveSettings;
- (id)_LSResolveIdentifiers:(id)a3;
- (id)_LSResolveIdentifiers:(id)a3 context:(LSContext *)a4;
- (id)_MCRestrictionManager;
- (id)allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:(void *)a3 originatingAppBundleID:(uint64_t)a4 originatingAccountIsManaged:;
- (id)allowlistedBundleIDs;
- (id)calculateSetDifference:(id)a3 and:(id)a4;
- (id)defaultStateProvider;
- (id)isApplicationRestricted:(id *)result;
- (id)isApplicationRestricted:(int)a3 checkFeatureRestrictions:;
- (id)isApplicationRestricted:(uint64_t)a3 checkFlags:;
- (id)maximumRating;
- (id)removedSystemApplicationIdentifiers;
- (id)restrictedBundleIDs;
- (os_unfair_lock_s)systemMode;
- (uint64_t)isAdTrackingEnabled;
- (uint64_t)isApplicationRestricted:(uint64_t)a3 checkFlags:(void *)a4 stateProvider:;
- (uint64_t)isLimitAdTrackingForced;
- (uint64_t)isOpenInRestrictionInEffect;
- (uint64_t)isSystemAppDeletionEnabled;
- (uint64_t)setApplication:(int)a3 removed:;
- (void)_MCRestrictionManager;
- (void)_pruneObsoleteTrustedSignerIdentities;
- (void)beginListeningForChanges;
- (void)clearAllValues;
- (void)handleMCEffectiveSettingsChanged;
- (void)handleSystemModeChangeTo:(id)a3;
- (void)locked_setAllowlistedBundleIDs:(uint64_t)a1;
- (void)locked_setRestrictedBundleIDs:(uint64_t)a1;
- (void)scanForMissedNotificationsForImportantAppsIfNecessary;
- (void)schedulePruneObsoleteTrustedSignerIdentities;
- (void)setEffectiveSettings:(id)a3;
- (void)setRemovedSystemApplicationIdentifiers:(void *)a1;
@end

@implementation LSApplicationRestrictionsManager

- (uint64_t)isSystemAppDeletionEnabled
{
  if (result)
  {
    v1 = (void *)result;
    if (ManagedConfigurationLibrary_frameworkLibrary
      || (ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2)) != 0)
    {
      uint64_t v2 = getMCFeatureSystemAppRemovalAllowed[0]();
      return [v1 isFeatureAllowed:v2];
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)isFeatureAllowed:(id)a3
{
  return isFeatureAllowed(a3);
}

- (id)defaultStateProvider
{
  if (a1)
  {
    a1 = -[LSAskManagerMCStateProvider initWithRestrictionsManager:]((id *)[LSAskManagerMCStateProvider alloc], a1);
    uint64_t v1 = vars8;
  }
  return a1;
}

+ (id)sharedInstance
{
  self;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_6);
  }
  v0 = (void *)sharedInstance_sharedInstance_0;

  return v0;
}

- (id)maximumRating
{
  if (a1)
  {
    uint64_t v2 = a1;
    if (ManagedConfigurationLibrary_frameworkLibrary
      || (ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2)) != 0)
    {
      var38[0] = MEMORY[0x1E4F143A8];
      var38[1] = 3221225472;
      var38[2] = __49__LSApplicationRestrictionsManager_maximumRating__block_invoke;
      var38[3] = &unk_1E522C1F0;
      var38[4] = v2;
      a1 = _LSLazyLoadObjectWithLock((id *)v2 + 9, (os_unfair_lock_s *)v2 + 2, var38);
    }
    else
    {
      a1 = &unk_1ECB432B8;
    }
    uint64_t v1 = var38[8];
  }
  return a1;
}

- (uint64_t)isApplicationRestricted:(uint64_t)a3 checkFlags:(void *)a4 stateProvider:
{
  id v7 = a2;
  id v8 = a4;
  v9 = v8;
  uint64_t IsApplicationRestrictedWithMCStateProvider = 0;
  if (a1 && (a3 & 0x40000000000) == 0) {
    uint64_t IsApplicationRestrictedWithMCStateProvider = computeIsApplicationRestrictedWithMCStateProvider(v8, v7, 1);
  }

  return IsApplicationRestrictedWithMCStateProvider;
}

- (id)restrictedBundleIDs
{
  if (a1)
  {
    var28[0] = MEMORY[0x1E4F143A8];
    var28[1] = 3221225472;
    var28[2] = __55__LSApplicationRestrictionsManager_restrictedBundleIDs__block_invoke;
    var28[3] = &unk_1E522C218;
    var28[4] = a1;
    a1 = _LSLazyLoadObjectWithLock((id *)(a1 + 64), (os_unfair_lock_s *)(a1 + 8), var28);
    uint64_t v1 = var28[6];
  }
  return (id)a1;
}

- (BOOL)isAllowlistEnabled
{
  if (!a1) {
    return 0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__LSApplicationRestrictionsManager_isAllowlistEnabled__block_invoke;
  v4[3] = &unk_1E522C1F0;
  v4[4] = a1;
  uint64_t v1 = _LSLazyLoadObjectWithLock((id *)(a1 + 32), (os_unfair_lock_s *)(a1 + 8), v4);
  BOOL v2 = [v1 integerValue] != 0;

  return v2;
}

- (BOOL)isRatingAllowed:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = -[LSApplicationRestrictionsManager maximumRating](a1);
    if (v4 && (int)[v3 intValue] >= 1)
    {
      int v5 = [v3 intValue];
      BOOL v6 = v5 <= (int)[v4 intValue];
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)isApplicationRestricted:(uint64_t)a3 checkFlags:
{
  if (result)
  {
    v4 = result;
    id v5 = a2;
    BOOL v6 = -[LSApplicationRestrictionsManager defaultStateProvider](v4);
    uint64_t v7 = -[LSApplicationRestrictionsManager isApplicationRestricted:checkFlags:stateProvider:]((uint64_t)v4, v5, a3, v6);

    return (id *)v7;
  }
  return result;
}

- (id)isApplicationRestricted:(id *)result
{
  if (result) {
    return -[LSApplicationRestrictionsManager isApplicationRestricted:checkFlags:](result, a2, 0);
  }
  return result;
}

id __54__LSApplicationRestrictionsManager_isAllowlistEnabled__block_invoke(uint64_t a1)
{
  uint64_t v1 = NSNumber;
  BOOL v2 = [*(id *)(a1 + 32) _MCProfileConnection];
  id v3 = objc_msgSend(v1, "numberWithUnsignedInt:", objc_msgSend(v2, "appWhitelistState"));

  return v3;
}

id __55__LSApplicationRestrictionsManager_restrictedBundleIDs__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  BOOL v2 = [v1 _MCProfileConnection];
  id v3 = [v2 restrictedAppBundleIDsExcludingRemovedSystemApps];
  v4 = [v1 _LSResolveIdentifiers:v3];

  return v4;
}

id __49__LSApplicationRestrictionsManager_maximumRating__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _MCProfileConnection];
  BOOL v2 = [v1 effectiveValueForSetting:getMCFeatureMaximumAppsRating[0]()];

  return v2;
}

- (id)_LSResolveIdentifiers:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CAD0] set];
  }
  BOOL v6 = v5;

  return v6;
}

- (os_unfair_lock_s)systemMode
{
  uint64_t v1 = a1;
  if (a1)
  {
    if (([(id)__LSDefaultsGetSharedInstance() isServer] & 1) == 0
      && !_LSCurrentProcessCanAccessManagedSettings())
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:sel_systemMode object:v1 file:@"LSApplicationRestrictionsManager.m" lineNumber:622 description:@"Unable to access mannaged settings."];
    }
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__3;
    v15 = __Block_byref_object_dispose__3;
    id v16 = 0;
    BOOL v2 = v1 + 2;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    uint64_t v7 = __46__LSApplicationRestrictionsManager_systemMode__block_invoke;
    id v8 = &unk_1E522C240;
    v9 = v1;
    v10 = &v11;
    id v3 = v6;
    os_unfair_lock_lock(v2);
    v7((uint64_t)v3);
    os_unfair_lock_unlock(v2);

    uint64_t v1 = (os_unfair_lock_s *)(id)v12[5];
    _Block_object_dispose(&v11, 8);
  }

  return v1;
}

void __46__LSApplicationRestrictionsManager_systemMode__block_invoke(uint64_t a1)
{
}

void __50__LSApplicationRestrictionsManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(LSApplicationRestrictionsManager);
  uint64_t v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;
}

- (LSApplicationRestrictionsManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)LSApplicationRestrictionsManager;
  id v2 = [(LSApplicationRestrictionsManager *)&v19 init];
  if (v2)
  {
    if (ManagedConfigurationLibrary_frameworkLibrary
      || (ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2)) != 0)
    {
      *((_DWORD *)v2 + 2) = 0;
      id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v4 = dispatch_queue_create("com.apple.lsd.restrictionsmanager.signerIdentitySyncQueue", v3);
      id v5 = (void *)*((void *)v2 + 2);
      *((void *)v2 + 2) = v4;

      if ([(id)__LSDefaultsGetSharedInstance() isServer])
      {
        objc_initWeak(&location, v2);
        BOOL v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *((dispatch_queue_t *)v2 + 2));
        dispatch_time_t v7 = dispatch_time(0, 120000000000);
        dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        uint64_t v13 = MEMORY[0x1E4F143A8];
        uint64_t v14 = 3221225472;
        v15 = __40__LSApplicationRestrictionsManager_init__block_invoke;
        id v16 = &unk_1E522C1C8;
        objc_copyWeak(&v17, &location);
        dispatch_source_set_event_handler(v6, &v13);
        dispatch_resume(v6);
        id v8 = (void *)*((void *)v2 + 3);
        *((void *)v2 + 3) = v6;

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
      if ([(id)__LSDefaultsGetSharedInstance() isServer])
      {
        v9 = sel_handleMCEffectiveSettingsChanged;
      }
      else
      {
        v9 = sel_clearAllValues;
        DistributedCenter = CFNotificationCenterGetDistributedCenter();
        CFNotificationCenterAddObserver(DistributedCenter, v2, (CFNotificationCallback)_applicationStateChangedCallback, @"com.apple.LaunchServices.applicationStateChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      }
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v13, v14, v15, v16);
      [v11 addObserver:v2 selector:v9 name:getMCEffectiveSettingsChangedNotification[0]() object:0];
    }
  }
  return (LSApplicationRestrictionsManager *)v2;
}

- (id)allowlistedBundleIDs
{
  if (a1)
  {
    id v2 = a1;
    if (-[LSApplicationRestrictionsManager isAllowlistEnabled]((uint64_t)a1))
    {
      var38[0] = MEMORY[0x1E4F143A8];
      var38[1] = 3221225472;
      var38[2] = __56__LSApplicationRestrictionsManager_allowlistedBundleIDs__block_invoke;
      var38[3] = &unk_1E522C218;
      var38[4] = v2;
      a1 = _LSLazyLoadObjectWithLock((id *)v2 + 7, (os_unfair_lock_s *)v2 + 2, var38);
    }
    else
    {
      a1 = 0;
    }
    uint64_t v1 = var38[8];
  }
  return a1;
}

+ (id)activeRestrictionIdentifiers
{
  self;
  if (activeRestrictionIdentifiers_onceToken != -1) {
    dispatch_once(&activeRestrictionIdentifiers_onceToken, &__block_literal_global_75_0);
  }
  v0 = (void *)activeRestrictionIdentifiers_restrictionUUIDs;

  return v0;
}

void __64__LSApplicationRestrictionsManager_activeRestrictionIdentifiers__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithObject:@"com.apple.lsd.appremoval"];
  uint64_t v1 = (void *)activeRestrictionIdentifiers_restrictionUUIDs;
  activeRestrictionIdentifiers_restrictionUUIDs = v0;
}

void __40__LSApplicationRestrictionsManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _pruneObsoleteTrustedSignerIdentities];
}

- (id)_MCRestrictionManager
{
  id v2 = [(Class)getMCRestrictionManagerClass[0]() sharedManager];
  if (!v2)
  {
    id v3 = _LSDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[LSApplicationRestrictionsManager _MCRestrictionManager]();
    }
  }

  return v2;
}

- (uint64_t)isOpenInRestrictionInEffect
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [a1 _MCProfileConnection];
  char v2 = [v1 isOpenInRestrictionInEffect];

  if (v2) {
    return 1;
  }
  if (![(id)__LSDefaultsGetSharedInstance() isAppleInternal]) {
    return 0;
  }
  dispatch_queue_t v4 = (void *)CFPreferencesCopyValue(@"LSPretendOpenInRestrictionInEffect", (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v3 = [v4 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_LSResolveIdentifiers:(id)a3 context:(LSContext *)a4
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
  }
  dispatch_time_t v7 = v6;

  return v7;
}

id __56__LSApplicationRestrictionsManager_allowlistedBundleIDs__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  char v2 = [v1 _MCProfileConnection];
  uint64_t v3 = [v2 effectiveWhitelistedAppBundleIDs];
  id v4 = [v1 _LSResolveIdentifiers:v3];

  return v4;
}

- (void)locked_setAllowlistedBundleIDs:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = (const os_unfair_lock *)(a1 + 8);
    id v4 = a2;
    os_unfair_lock_assert_owner(v3);
    uint64_t v5 = [v4 copy];

    id v6 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v5;
  }
}

- (void)locked_setRestrictedBundleIDs:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = (const os_unfair_lock *)(a1 + 8);
    id v4 = a2;
    os_unfair_lock_assert_owner(v3);
    uint64_t v5 = [v4 copy];

    id v6 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = v5;
  }
}

- (void)scanForMissedNotificationsForImportantAppsIfNecessary
{
  if (a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__LSApplicationRestrictionsManager_scanForMissedNotificationsForImportantAppsIfNecessary__block_invoke;
    block[3] = &unk_1E522C268;
    block[4] = a1;
    if (scanForMissedNotificationsForImportantAppsIfNecessary_once != -1) {
      dispatch_once(&scanForMissedNotificationsForImportantAppsIfNecessary_once, block);
    }
  }
}

void __89__LSApplicationRestrictionsManager_scanForMissedNotificationsForImportantAppsIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  char v2 = [(id)__LSDefaultsGetSharedInstance() isInSyncBubble];
  uint64_t v3 = _LSDefaultLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182959000, v3, OS_LOG_TYPE_DEFAULT, "in sync bubble, not scanning for missed notifications", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_182959000, v3, OS_LOG_TYPE_DEFAULT, "scanning for any missed notifications for important apps", buf, 2u);
    }

    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [v5 _MCProfileConnection];
    dispatch_time_t v7 = [v6 effectiveWhitelistedAppBundleIDs];
    uint64_t v3 = [v5 _LSResolveIdentifiers:v7];

    id v8 = *(void **)(a1 + 32);
    v9 = [v8 _MCProfileConnection];
    v10 = [v9 restrictedAppBundleIDsExcludingRemovedSystemApps];
    uint64_t v11 = [v8 _LSResolveIdentifiers:v10];

    v12 = [*(id *)(a1 + 32) _MCProfileConnection];
    char v13 = [v12 appWhitelistState] != 0;

    uint64_t v14 = (void *)CFPreferencesCopyValue(@"LSLastSeenImportantAppRestrictionStateKey", @"com.apple.lsd.restrictionhardening", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    v15 = objc_opt_class();
    id v16 = objc_opt_class();
    if (_LSIsDictionaryWithKeysAndValuesOfClass(v14, v15, v16)) {
      id v17 = v14;
    }
    else {
      id v17 = 0;
    }
    id v18 = v17;

    objc_super v19 = -[LSUseValuesMCStateProvider initWithAllowlistEnabled:allowlistedBundles:restrictedBundles:]((id *)[LSUseValuesMCStateProvider alloc], v13, v3, v11);
    v20 = computeImportantBundleRestrictionState(v19);
    v21 = v20;
    if (v18)
    {
      v39 = v19;
      id v40 = v18;
      v41 = v11;
      v42 = v3;
      id v22 = v18;
      v38 = v21;
      id v23 = v21;
      id v43 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      v45 = v23;
      id obj = [v23 allKeys];
      uint64_t v24 = [obj countByEnumeratingWithState:&v48 objects:buf count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v49 != v26) {
              objc_enumerationMutation(obj);
            }
            v28 = *(__CFString **)(*((void *)&v48 + 1) + 8 * i);
            v29 = [v45 objectForKeyedSubscript:v28];
            int v30 = [v29 BOOLValue];
            v31 = [v22 objectForKeyedSubscript:v28];
            int v32 = [v31 BOOLValue];

            if (v30 != v32)
            {
              if (_LSIsNewsWidgetBundleIdentifier(v28)) {
                v33 = @"com.apple.news";
              }
              else {
                v33 = v28;
              }
              [v43 addObject:v33];
            }
          }
          uint64_t v25 = [obj countByEnumeratingWithState:&v48 objects:buf count:16];
        }
        while (v25);
      }

      uint64_t v34 = [v43 count];
      v35 = _LSDefaultLog();
      BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
      if (v34)
      {
        objc_super v19 = v39;
        if (v36)
        {
          *(_DWORD *)buf = 138543362;
          id v53 = v43;
          _os_log_impl(&dword_182959000, v35, OS_LOG_TYPE_DEFAULT, "Found important apps whose restriction state changed before startup: %{public}@", buf, 0xCu);
        }

        v37 = +[LSApplicationWorkspace defaultWorkspace];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __89__LSApplicationRestrictionsManager_scanForMissedNotificationsForImportantAppsIfNecessary__block_invoke_107;
        v46[3] = &unk_1E522C268;
        id v47 = v45;
        [v37 sendApplicationStateChangedNotificationsFor:v43 stateProvider:v39 completion:v46];
      }
      else
      {
        objc_super v19 = v39;
        if (v36)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_182959000, v35, OS_LOG_TYPE_DEFAULT, "No important app restriction state changes, continuing.", buf, 2u);
        }

        saveImportantBundleRestrictionState(v45);
      }
      uint64_t v11 = v41;
      uint64_t v3 = v42;
      id v18 = v40;
      v21 = v38;
    }
    else
    {
      saveImportantBundleRestrictionState(v20);
    }
  }
}

void __89__LSApplicationRestrictionsManager_scanForMissedNotificationsForImportantAppsIfNecessary__block_invoke_107(uint64_t a1)
{
}

- (void)beginListeningForChanges
{
  if (a1)
  {
    _LSServer_DatabaseExecutionContext();
    char v2 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    -[LSDBExecutionContext assertActiveForThisThread](v2);

    if (ManagedConfigurationLibrary_frameworkLibrary
      || (ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2)) != 0)
    {
      uint64_t v3 = a1 + 2;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      id v6 = __60__LSApplicationRestrictionsManager_beginListeningForChanges__block_invoke;
      dispatch_time_t v7 = &unk_1E522C268;
      id v8 = a1;
      BOOL v4 = v5;
      os_unfair_lock_lock(v3);
      v6((uint64_t)v4);
      os_unfair_lock_unlock(v3);
    }
  }
}

void __60__LSApplicationRestrictionsManager_beginListeningForChanges__block_invoke(uint64_t a1)
{
  char v2 = _LSDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182959000, v2, OS_LOG_TYPE_DEFAULT, "Fetching all restrictions values and listening for change notifications", buf, 2u);
  }

  id v27 = 0;
  *(void *)buf = 0;
  int inited = _LSContextInitReturningError((id *)buf, &v27);
  id v4 = v27;
  if (inited)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [v5 _MCProfileConnection];
    dispatch_time_t v7 = [v6 effectiveWhitelistedAppBundleIDs];
    id v8 = [v5 _LSResolveIdentifiers:v7 context:buf];

    -[LSApplicationRestrictionsManager locked_setAllowlistedBundleIDs:](*(void *)(a1 + 32), v8);
    v9 = *(void **)(a1 + 32);
    v10 = [v9 _MCProfileConnection];
    uint64_t v11 = [v10 restrictedAppBundleIDsExcludingRemovedSystemApps];
    v12 = [v9 _LSResolveIdentifiers:v11 context:buf];

    -[LSApplicationRestrictionsManager locked_setRestrictedBundleIDs:](*(void *)(a1 + 32), v12);
    _LSContextDestroy((void **)buf);
  }
  else
  {
    id v8 = _LSDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __60__LSApplicationRestrictionsManager_beginListeningForChanges__block_invoke_cold_1((uint64_t)v4, v8);
    }
  }

  char v13 = _LSDatabaseGetSeedingGroup();
  uint64_t v14 = _LSServer_GetAsyncWorkQueue();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __60__LSApplicationRestrictionsManager_beginListeningForChanges__block_invoke_108;
  v26[3] = &unk_1E522C268;
  v26[4] = *(void *)(a1 + 32);
  dispatch_group_notify(v13, v14, v26);

  v15 = NSNumber;
  id v16 = [*(id *)(a1 + 32) _MCProfileConnection];
  uint64_t v17 = objc_msgSend(v15, "numberWithUnsignedInt:", objc_msgSend(v16, "appWhitelistState"));
  uint64_t v18 = *(void *)(a1 + 32);
  objc_super v19 = *(void **)(v18 + 32);
  *(void *)(v18 + 32) = v17;

  v20 = [*(id *)(a1 + 32) _MCProfileConnection];
  uint64_t v21 = [v20 effectiveValueForSetting:getMCFeatureMaximumAppsRating[0]()];
  uint64_t v22 = *(void *)(a1 + 32);
  id v23 = *(void **)(v22 + 72);
  *(void *)(v22 + 72) = v21;

  int v24 = -[LSApplicationRestrictionsManager isSystemAppDeletionEnabled](*(void *)(a1 + 32));
  uint64_t v25 = 1;
  if (!v24) {
    uint64_t v25 = 2;
  }
  *(void *)(*(void *)(a1 + 32) + 40) = v25;
}

void __60__LSApplicationRestrictionsManager_beginListeningForChanges__block_invoke_108(uint64_t a1)
{
}

- (id)calculateSetDifference:(id)a3 and:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  dispatch_time_t v7 = _LSDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[LSApplicationRestrictionsManager calculateSetDifference:and:]((uint64_t)v5, (uint64_t)v6, v7);
  }

  id v8 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        if (([v6 containsObject:v14] & 1) == 0) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v11);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v22 + 1) + 8 * j);
        if ((objc_msgSend(v9, "containsObject:", v20, (void)v22) & 1) == 0) {
          [v8 addObject:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }

  return v8;
}

- (void)handleSystemModeChangeTo:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__3;
  objc_super v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  p_restrictionsAccessLock = &self->_restrictionsAccessLock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  uint64_t v10 = __61__LSApplicationRestrictionsManager_handleSystemModeChangeTo___block_invoke;
  uint64_t v11 = &unk_1E522C290;
  uint64_t v14 = &v15;
  uint64_t v12 = self;
  id v6 = v4;
  id v13 = v6;
  dispatch_time_t v7 = v9;
  os_unfair_lock_lock(p_restrictionsAccessLock);
  v10(v7);
  os_unfair_lock_unlock(p_restrictionsAccessLock);

  if ((id)v16[5] != v6)
  {
    id v8 = +[LSApplicationWorkspace defaultWorkspace];
    [v8 sendExtensionNotificationsForSystemModeChangeFrom:v16[5] to:v6];
  }
  _Block_object_dispose(&v15, 8);
}

void __61__LSApplicationRestrictionsManager_handleSystemModeChangeTo___block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 88));
  char v2 = (void *)a1[5];
  uint64_t v3 = (id *)(a1[4] + 88);

  objc_storeStrong(v3, v2);
}

- (void)handleMCEffectiveSettingsChanged
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x2020000000;
  uint64_t v75 = 0;
  uint64_t v3 = _LSDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182959000, v3, OS_LOG_TYPE_DEFAULT, "LSAppRestrictionsManager: handleMCEffectiveSettingsChanged.", buf, 2u);
  }

  *(void *)buf = 0;
  v69 = buf;
  uint64_t v70 = 0x2020000000;
  char v71 = 0;
  -[LSApplicationRestrictionsManager scanForMissedNotificationsForImportantAppsIfNecessary]((uint64_t)self);
  p_restrictionsAccessLock = &self->_restrictionsAccessLock;
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v63 = __68__LSApplicationRestrictionsManager_handleMCEffectiveSettingsChanged__block_invoke;
  v64 = &unk_1E522C2B8;
  v65 = self;
  v66 = buf;
  v67 = &v72;
  id v5 = v62;
  os_unfair_lock_lock(&self->_restrictionsAccessLock);
  v63(v5);
  os_unfair_lock_unlock(&self->_restrictionsAccessLock);

  int v6 = -[LSApplicationRestrictionsManager isSystemAppDeletionEnabled]((uint64_t)self);
  uint64_t v7 = 1;
  if (!v6) {
    uint64_t v7 = 2;
  }
  uint64_t v49 = v7;
  id v8 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
  id v9 = NSNumber;
  uint64_t v10 = [(LSApplicationRestrictionsManager *)self _MCProfileConnection];
  long long v50 = objc_msgSend(v9, "numberWithUnsignedInt:", objc_msgSend(v10, "appWhitelistState"));

  unsigned int v11 = [v50 integerValue];
  uint64_t v12 = [(LSApplicationRestrictionsManager *)self _MCProfileConnection];
  long long v48 = [v12 effectiveValueForSetting:getMCFeatureMaximumAppsRating[0]()];
  uint64_t v13 = v11;

  if (v11)
  {
    uint64_t v14 = [(LSApplicationRestrictionsManager *)self _MCProfileConnection];
    uint64_t v15 = [v14 effectiveWhitelistedAppBundleIDs];
    uint64_t v16 = [(LSApplicationRestrictionsManager *)self _LSResolveIdentifiers:v15];
  }
  else
  {
    uint64_t v16 = 0;
  }
  uint64_t v17 = [(LSApplicationRestrictionsManager *)self _MCProfileConnection];
  uint64_t v18 = [v17 restrictedAppBundleIDsExcludingRemovedSystemApps];
  objc_super v19 = [(LSApplicationRestrictionsManager *)self _LSResolveIdentifiers:v18];

  if ((v13 != 0) == -[LSApplicationRestrictionsManager isAllowlistEnabled]((uint64_t)self))
  {
    long long v25 = -[LSApplicationRestrictionsManager maximumRating](self);
    int v26 = [v25 intValue];
    LOBYTE(v26) = v26 == [v48 intValue];

    if (v26)
    {
      if (v13)
      {
        long long v27 = -[LSApplicationRestrictionsManager allowlistedBundleIDs](self);
        [(LSApplicationRestrictionsManager *)self calculateSetDifference:v27 and:v16];
      }
      else
      {
        long long v27 = -[LSApplicationRestrictionsManager restrictedBundleIDs]((uint64_t)self);
        [(LSApplicationRestrictionsManager *)self calculateSetDifference:v27 and:v19];
      long long v28 = };

      [v8 unionSet:v28];
      long long v22 = _LSDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v76 = 138412290;
        *(void *)v77 = v8;
        _os_log_impl(&dword_182959000, v22, OS_LOG_TYPE_DEFAULT, "LSAppRestrictionsManager: settings changed, state changed apps %@", v76, 0xCu);
      }
    }
    else
    {
      long long v29 = _LSDefaultLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v76 = 138412290;
        *(void *)v77 = v48;
        _os_log_impl(&dword_182959000, v29, OS_LOG_TYPE_DEFAULT, "LSAppRestrictionsManager: new max rating set to %@", v76, 0xCu);
      }

      long long v22 = +[LSApplicationWorkspace defaultWorkspace];
      int v30 = -[LSApplicationRestrictionsManager maximumRating](self);
      v31 = [v22 scanForApplicationStateChangesFromRank:v30 toRank:v48];
      [v8 unionSet:v31];
    }
  }
  else
  {
    id v20 = _LSDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = @"OFF";
      if (v13) {
        uint64_t v21 = @"ON";
      }
      *(_DWORD *)v76 = 138412290;
      *(void *)v77 = v21;
      _os_log_impl(&dword_182959000, v20, OS_LOG_TYPE_DEFAULT, "LSAppRestrictionsManager: allowlist turned %@", v76, 0xCu);
    }

    long long v22 = +[LSApplicationWorkspace defaultWorkspace];
    long long v23 = v16;
    if (!v13)
    {
      long long v23 = -[LSApplicationRestrictionsManager allowlistedBundleIDs](self);
    }
    long long v24 = [v22 scanForApplicationStateChangesWithAllowlist:v23];
    [v8 unionSet:v24];

    if (!v13) {
  }
    }

  if (v73[3] != v49)
  {
    uint64_t v32 = +[LSApplicationWorkspace defaultWorkspace];
    v33 = [v32 scanForForDeletableSystemApps];
    [v8 unionSet:v33];
  }
  if ([v8 count])
  {
    uint64_t v34 = -[LSUseValuesMCStateProvider initWithAllowlistEnabled:allowlistedBundles:restrictedBundles:]((id *)[LSUseValuesMCStateProvider alloc], v13 != 0, v16, v19);
    v35 = +[LSApplicationWorkspace defaultWorkspace];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __68__LSApplicationRestrictionsManager_handleMCEffectiveSettingsChanged__block_invoke_116;
    v60[3] = &unk_1E522C268;
    BOOL v36 = v34;
    v61 = v36;
    [v35 sendApplicationStateChangedNotificationsFor:v8 stateProvider:v36 completion:v60];
  }
  int v37 = [v8 containsObject:@"com.apple.news"];
  v38 = _LSDefaultLog();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    int v39 = v69[24];
    BOOL server_newsWidgetIsRestricted = self->_server_newsWidgetIsRestricted;
    *(_DWORD *)v76 = 67109632;
    *(_DWORD *)v77 = v37;
    *(_WORD *)&v77[4] = 1024;
    *(_DWORD *)&v77[6] = v39;
    __int16 v78 = 1024;
    BOOL v79 = server_newsWidgetIsRestricted;
    _os_log_impl(&dword_182959000, v38, OS_LOG_TYPE_DEFAULT, "LSAppRestrictionsManager: news changed state: %d widget restricted: %d widget was restricted: %d", v76, 0x14u);
  }

  v41 = v69;
  if ((v37 & 1) == 0 && v69[24] != self->_server_newsWidgetIsRestricted)
  {
    v42 = +[LSApplicationWorkspace defaultWorkspace];
    [v42 sendExtensionNotificationsForExtensionBundleIdentifier:@"com.apple.news.widget" changingRestrictionStateTo:v69[24]];

    v41 = v69;
  }
  self->_BOOL server_newsWidgetIsRestricted = v41[24];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v52 = __68__LSApplicationRestrictionsManager_handleMCEffectiveSettingsChanged__block_invoke_117;
  id v53 = &unk_1E522C2E0;
  uint64_t v54 = self;
  id v43 = v16;
  id v55 = v43;
  id v44 = v19;
  id v56 = v44;
  id v45 = v50;
  id v57 = v45;
  id v46 = v48;
  id v58 = v46;
  uint64_t v59 = v49;
  id v47 = v51;
  os_unfair_lock_lock(p_restrictionsAccessLock);
  v52((uint64_t)v47);
  os_unfair_lock_unlock(p_restrictionsAccessLock);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v72, 8);
}

BOOL __68__LSApplicationRestrictionsManager_handleMCEffectiveSettingsChanged__block_invoke(BOOL *a1)
{
  BOOL result = -[LSApplicationRestrictionsManager isAppExtensionRestricted:](a1[4], @"com.apple.news.widget");
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(a1[4] + 40);
  return result;
}

- (BOOL)isAppExtensionRestricted:(BOOL)a1
{
  id v3 = a2;
  if (a1) {
    a1 = (ManagedConfigurationLibrary_frameworkLibrary
  }
       || (ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2)) != 0)&& _LSIsNewsWidgetBundleIdentifier(v3)&& ![(id)a1 isFeatureAllowed:getMCFeatureNewsTodayAllowed()];

  return a1;
}

void __68__LSApplicationRestrictionsManager_handleMCEffectiveSettingsChanged__block_invoke_116(uint64_t a1)
{
  computeImportantBundleRestrictionState(*(void **)(a1 + 32));
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  saveImportantBundleRestrictionState(v1);
}

void __68__LSApplicationRestrictionsManager_handleMCEffectiveSettingsChanged__block_invoke_117(uint64_t a1)
{
  -[LSApplicationRestrictionsManager locked_setAllowlistedBundleIDs:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  -[LSApplicationRestrictionsManager locked_setRestrictedBundleIDs:](*(void *)(a1 + 32), *(void **)(a1 + 48));
  uint64_t v2 = [*(id *)(a1 + 56) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  uint64_t v5 = [*(id *)(a1 + 64) copy];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v5;

  *(void *)(*(void *)(a1 + 32) + 40) = *(void *)(a1 + 72);
}

- (void)clearAllValues
{
  p_restrictionsAccessLock = &self->_restrictionsAccessLock;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  uint64_t v5 = __50__LSApplicationRestrictionsManager_clearAllValues__block_invoke;
  uint64_t v6 = &unk_1E522C268;
  uint64_t v7 = self;
  uint64_t v3 = v4;
  os_unfair_lock_lock(p_restrictionsAccessLock);
  v5((uint64_t)v3);
  os_unfair_lock_unlock(p_restrictionsAccessLock);
}

void __50__LSApplicationRestrictionsManager_clearAllValues__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = 0;

  -[LSApplicationRestrictionsManager locked_setRestrictedBundleIDs:](*(void *)(a1 + 32), 0);
  uint64_t v6 = *(void *)(a1 + 32);

  -[LSApplicationRestrictionsManager locked_setAllowlistedBundleIDs:](v6, 0);
}

- (void)schedulePruneObsoleteTrustedSignerIdentities
{
  if (a1)
  {
    dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 16));
    if ([(id)__LSDefaultsGetSharedInstance() isServer])
    {
      dispatch_time_t v2 = dispatch_time(0, 1000000000);
      uint64_t v3 = *(NSObject **)(a1 + 24);
      dispatch_source_set_timer(v3, v2, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    }
  }
}

- (void)_pruneObsoleteTrustedSignerIdentities
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_19(&dword_182959000, v0, v1, "-_pruneObsoleteTrustedSignerIdentities can only be called in lsd", v2, v3, v4, v5, v6);
}

void __73__LSApplicationRestrictionsManager__pruneObsoleteTrustedSignerIdentities__block_invoke(uint64_t a1)
{
  uint64_t v2 = _LSDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __73__LSApplicationRestrictionsManager__pruneObsoleteTrustedSignerIdentities__block_invoke_cold_1();
  }

  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = [*(id *)(a1 + 32) _MCProfileConnection];
  uint64_t v5 = [v4 trustedCodeSigningIdentities];
  uint8_t v6 = (void *)[v3 initWithArray:v5];

  uint64_t v7 = (void *)[v6 mutableCopy];
  _LSServer_DatabaseExecutionContext();
  id v8 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__LSApplicationRestrictionsManager__pruneObsoleteTrustedSignerIdentities__block_invoke_118;
  v12[3] = &unk_1E522C308;
  id v9 = v7;
  id v13 = v9;
  -[LSDBExecutionContext syncRead:](v8, v12);

  if (v6 && [v9 count])
  {
    [v6 minusSet:v9];
    uint64_t v10 = [*(id *)(a1 + 32) _MCProfileConnection];
    unsigned int v11 = [v6 allObjects];
    [v10 setTrustedCodeSigningIdentities:v11];
  }
}

void __73__LSApplicationRestrictionsManager__pruneObsoleteTrustedSignerIdentities__block_invoke_118(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = +[LSApplicationRecord enumeratorWithOptions:](LSApplicationRecord, "enumeratorWithOptions:", 0, 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v8 + 1) + 8 * v6) signerIdentity];
        if (v7) {
          [*(id *)(a1 + 32) removeObject:v7];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (BOOL)_LSApplyRestrictedSet:(id)a3 forRestriction:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = a3;
  long long v9 = [v6 dictionary];
  long long v10 = [v8 allObjects];

  [v9 MCSetUnionRestriction:v7 values:v10];
  long long v11 = (void *)[v9 copy];
  __int16 v22 = 0;
  uint64_t v12 = _LSDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = (uint64_t)v11;
    __int16 v25 = 2112;
    int v26 = @"com.apple.lsd.appremoval";
    _os_log_impl(&dword_182959000, v12, OS_LOG_TYPE_DEFAULT, "ManagedConfiguration applyRestrictionDictionary:%@ clientType:%@", buf, 0x16u);
  }

  uint64_t v13 = [(LSApplicationRestrictionsManager *)self _MCProfileConnection];
  id v21 = 0;
  uint64_t v14 = [v13 applyRestrictionDictionary:v11 clientType:@"com.apple.lsd.appremoval" clientUUID:@"com.apple.lsd.appremoval" localizedClientDescription:&stru_1ECB1A570 localizedWarningMessage:0 outRestrictionChanged:(char *)&v22 + 1 outEffectiveSettingsChanged:&v22 outError:&v21];
  uint64_t v15 = (__CFString *)v21;

  uint64_t v16 = _LSDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [NSNumber numberWithBool:v14];
    uint64_t v18 = (void *)v17;
    if (v15) {
      objc_super v19 = v15;
    }
    else {
      objc_super v19 = &stru_1ECB1A570;
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = v17;
    __int16 v25 = 2112;
    int v26 = v19;
    _os_log_impl(&dword_182959000, v16, OS_LOG_TYPE_DEFAULT, "ManagedConfiguration applyRestrictionDictionary complete with result %@ %@", buf, 0x16u);
  }
  return v14;
}

- (BOOL)cleanRemovedSystemApplicationsList
{
  return a1 != 0;
}

- (void)setRemovedSystemApplicationIdentifiers:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    if (ManagedConfigurationLibrary_frameworkLibrary
      || (ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2)) != 0)
    {
      [a1 _LSApplyRestrictedSet:v3 forRestriction:getMCFeatureRemovedSystemAppBundleIDs[0]()];
    }
  }
}

- (id)removedSystemApplicationIdentifiers
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = [a1 _MCProfileConnection];
    id v3 = [v2 removedSystemAppBundleIDs];
    id v1 = [v1 _LSResolveIdentifiers:v3];
  }

  return v1;
}

- (uint64_t)setApplication:(int)a3 removed:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_15;
  }
  if (!ManagedConfigurationLibrary_frameworkLibrary)
  {
    ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
    if (!ManagedConfigurationLibrary_frameworkLibrary)
    {
      a1 = 0;
      goto LABEL_15;
    }
  }
  uint64_t v6 = [(id)a1 _MCProfileConnection];
  id v7 = [v6 removedSystemAppBundleIDs];
  id v8 = [(id)a1 _LSResolveIdentifiers:v7];
  long long v9 = (void *)[v8 mutableCopy];

  if (a3)
  {
    [v9 addObject:v5];
    long long v10 = _LSDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v5;
      long long v11 = "Added identifier %@ to removedSystemApplications list";
LABEL_9:
      _os_log_impl(&dword_182959000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    [v9 removeObject:v5];
    long long v10 = _LSDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v5;
      long long v11 = "Removed identifier %@ from removedSystemApplications list";
      goto LABEL_9;
    }
  }

  a1 = [(id)a1 _LSApplyRestrictedSet:v9 forRestriction:getMCFeatureRemovedSystemAppBundleIDs[0]()];
  if ((a1 & 1) == 0)
  {
    uint64_t v12 = _LSDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[LSApplicationRestrictionsManager setApplication:removed:](a3, (uint64_t)v5, v12);
    }
  }
LABEL_15:

  return a1;
}

- (id)isApplicationRestricted:(int)a3 checkFeatureRestrictions:
{
  if (result)
  {
    uint64_t v4 = result;
    id v5 = a2;
    uint64_t v6 = -[LSApplicationRestrictionsManager defaultStateProvider](v4);
    uint64_t IsApplicationRestrictedWithMCStateProvider = computeIsApplicationRestrictedWithMCStateProvider(v6, v5, a3);

    return (id *)IsApplicationRestrictedWithMCStateProvider;
  }
  return result;
}

- (id)allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:(void *)a3 originatingAppBundleID:(uint64_t)a4 originatingAccountIsManaged:
{
  id v4 = a1;
  if (a1)
  {
    id v7 = a3;
    id v8 = a2;
    long long v9 = [v4 _MCProfileConnection];
    long long v10 = [v9 allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:v8 originatingAppBundleID:v7 originatingAccountIsManaged:a4];

    if (v10)
    {
      id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (uint64_t)isAdTrackingEnabled
{
  if (!a1) {
    return 0;
  }
  if (!ManagedConfigurationLibrary_frameworkLibrary)
  {
    ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
    if (!ManagedConfigurationLibrary_frameworkLibrary) {
      return 0;
    }
  }
  uint64_t v2 = getMCFeatureIdentifierForAdvertisingAllowed[0]();

  return [a1 isFeatureAllowed:v2];
}

- (uint64_t)isLimitAdTrackingForced
{
  if (result)
  {
    id v1 = (void *)result;
    if (ManagedConfigurationLibrary_frameworkLibrary
      || (ManagedConfigurationLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2)) != 0)
    {
      uint64_t v2 = getMCFeatureLimitAdTrackingForced[0]();
      return [v1 isFeatureAllowed:v2];
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)forceUpdateRestrictionKnowledgeWithError:(void *)a1
{
  if (a1)
  {
    uint64_t v2 = [a1 _MCRestrictionManager];
    [v2 invalidateSettings];

    id v3 = [a1 _MCRestrictionManager];
    [v3 invalidateRestrictions];

    [a1 handleMCEffectiveSettingsChanged];
  }
  return a1 != 0;
}

- (MOEffectiveSettings)effectiveSettings
{
  return (MOEffectiveSettings *)objc_getProperty(self, a2, 80, 1);
}

- (void)setEffectiveSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemMode, 0);
  objc_storeStrong((id *)&self->_effectiveSettings, 0);
  objc_storeStrong((id *)&self->_maximumRating, 0);
  objc_storeStrong((id *)&self->_restrictedBundleIDs, 0);
  objc_storeStrong((id *)&self->_allowlistedBundleIDs, 0);
  objc_storeStrong((id *)&self->_allowlistState, 0);
  objc_storeStrong((id *)&self->_signerIdentitySyncSource, 0);

  objc_storeStrong((id *)&self->_signerIdentitySyncQueue, 0);
}

- (void)_MCRestrictionManager
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_19(&dword_182959000, v0, v1, "LSRestrictionsManager: [MCRestrictionManager sharedManager] returned nil", v2, v3, v4, v5, v6);
}

void __60__LSApplicationRestrictionsManager_beginListeningForChanges__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[LSApplicationRestrictionsManager beginListeningForChanges]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "Could not set allowlisted or restricted bundleIDs: could not get context in %s: %@", (uint8_t *)&v2, 0x16u);
}

- (void)calculateSetDifference:(os_log_t)log and:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_182959000, log, OS_LOG_TYPE_DEBUG, "LSAppRestrictionsManager: comparing old %@ to new %@", (uint8_t *)&v3, 0x16u);
}

void __73__LSApplicationRestrictionsManager__pruneObsoleteTrustedSignerIdentities__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_182959000, v0, OS_LOG_TYPE_DEBUG, "Updating trusted signer identifiers.", v1, 2u);
}

- (void)setApplication:(os_log_t)log removed:.cold.1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = @"remove";
  if ((a1 & 1) == 0) {
    int v3 = @"restore";
  }
  int v4 = 138412546;
  __int16 v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_182959000, log, OS_LOG_TYPE_ERROR, "Failed to %@ app with bundleID: %@", (uint8_t *)&v4, 0x16u);
}

@end