@interface GAXAppManager
- (AXAccessQueueTimer)resetRelaunchAttemptsTimer;
- (BOOL)_appIsSessionAppWithIdentifier:(id)a3;
- (BOOL)_axAppIsValidGAXApp:(id)a3;
- (BOOL)_sessionAppIsEffectiveApp:(id)a3;
- (BOOL)_sessionAppsContainMobilePhoneOrFacetime;
- (BOOL)appLayoutIsMultiApp;
- (BOOL)appWithIdentifierIsASessionApp:(id)a3;
- (BOOL)effectiveAppIsAcceptableForSessionApps;
- (BOOL)effectiveAppIsCoreAuthUI;
- (BOOL)effectiveAppIsHostedByTheSystemApp;
- (BOOL)effectiveAppIsPreferences;
- (BOOL)effectiveAppIsPurpleBuddy;
- (BOOL)effectiveAppPrepareForTransitionToWorkspaceAndRetrieveRestrictionsInformation:(id *)a3;
- (BOOL)effectiveAppWasPlayingMedia;
- (BOOL)sessionAppGAXClientDidCheckIn;
- (BOOL)sessionAppIsEffectiveApp:(id)a3;
- (BOOL)sessionAppIsHostedByTheSystemApp:(id)a3;
- (BOOL)sessionAppsContainPreferences;
- (BOOL)sessionAppsContainPurpleBuddy;
- (FBSDisplayLayoutMonitor)appLayoutMonitor;
- (GAXAppManager)init;
- (GAXAppManagerDelegate)delegate;
- (NSArray)sessionAllowedBundleIdentifiers;
- (NSMutableArray)sessionAppBundleIdentifiers;
- (NSMutableSet)managedApps;
- (NSString)description;
- (NSString)effectiveAppBundleIdentifier;
- (OS_dispatch_source)purpleBuddyPIDMonitor;
- (_GAXAppRepresentation)lastKnownEffectiveApp;
- (id)_appWithBundleIdentifier:(id)a3;
- (id)_bundleIdentifierFromLayoutIdentifier:(id)a3;
- (id)_effectiveApp;
- (id)_makeGAXAppFromAXApp:(id)a3;
- (id)_sessionApps;
- (id)effectiveAppContainedViewsForArchivedFingerPath:(id)a3;
- (id)effectiveAppRestrictionIdentifiers;
- (unint64_t)sessionAppRelaunchAttemptsForAppWithIdentifier:(id)a3;
- (void)_updateGAXApp:(id)a3 fromAXApp:(id)a4;
- (void)addSessionAppWithIdentifier:(id)a3;
- (void)appWithBundleIdentifier:(id)a3 becameActiveWithPid:(int)a4;
- (void)dealloc;
- (void)effectiveAppRestrictionWithIdentifier:(id)a3 didChangeState:(int64_t)a4;
- (void)gaxAppDidGoInvalid:(id)a3;
- (void)gaxClientDidLoad:(id)a3 pid:(int)a4;
- (void)incrementRelaunchAttemptsForSessionAppWithIdentifier:(id)a3;
- (void)monitorForPurpleBuddyDeath;
- (void)resetRelaunchAttempts;
- (void)resumeEffectiveApp;
- (void)scheduleResetLaunchAttempts;
- (void)setAppLayoutMonitor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEffectiveAppWasPlayingMedia:(BOOL)a3;
- (void)setLastKnownEffectiveApp:(id)a3;
- (void)setManagedApps:(id)a3;
- (void)setPurpleBuddyPIDMonitor:(id)a3;
- (void)setResetRelaunchAttemptsTimer:(id)a3;
- (void)setSessionAppBundleIdentifiers:(id)a3;
- (void)settingsDidChangeWithServerMode:(unsigned int)a3 allowsMotion:(BOOL)a4 allowsKeyboardTextInput:(BOOL)a5;
- (void)suspendEffectiveApp;
- (void)terminateEffectiveApp;
- (void)updateManagedAppState:(BOOL)a3;
- (void)updateSessionAppBundleIdentifiers:(id)a3;
@end

@implementation GAXAppManager

- (GAXAppManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)GAXAppManager;
  v2 = [(GAXAppManager *)&v13 init];
  if (v2)
  {
    v3 = +[NSMutableSet set];
    [(GAXAppManager *)v2 setManagedApps:v3];

    objc_initWeak(&location, v2);
    v4 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
    [v4 setNeedsUserInteractivePriority:1];
    v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    v9 = sub_24B80;
    v10 = &unk_49DC8;
    objc_copyWeak(&v11, &location);
    [v4 setTransitionHandler:&v7];
    v5 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:](FBSDisplayLayoutMonitor, "monitorWithConfiguration:", v4, v7, v8, v9, v10);
    [(GAXAppManager *)v2 setAppLayoutMonitor:v5];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  [(GAXAppManager *)self setDelegate:0];
  v3 = [(GAXAppManager *)self appLayoutMonitor];
  [v3 invalidate];

  [(GAXAppManager *)self setLastKnownEffectiveApp:0];
  v4.receiver = self;
  v4.super_class = (Class)GAXAppManager;
  [(GAXAppManager *)&v4 dealloc];
}

- (NSString)description
{
  v3 = [(GAXAppManager *)self _effectiveApp];
  objc_super v4 = [(GAXAppManager *)self _sessionApps];
  v5 = +[NSMutableString stringWithFormat:@"AppManager:<%p>\nEffective App:%@\nSession Apps:%@\nManaged Apps:", self, v3, v4];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = [(GAXAppManager *)self managedApps];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 appendFormat:@"  %@\n", *(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return (NSString *)v5;
}

- (void)updateManagedAppState:(BOOL)a3
{
  v5 = dispatch_get_global_queue(0, 0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_24F5C;
  v6[3] = &unk_494D8;
  BOOL v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (BOOL)appLayoutIsMultiApp
{
  v2 = self;
  v3 = [(GAXAppManager *)self appLayoutMonitor];
  objc_super v4 = [v3 currentLayout];

  if (v4)
  {
    if (qword_56140 != -1) {
      dispatch_once(&qword_56140, &stru_49E08);
    }
    v5 = [v4 elements];
    v6 = +[NSPredicate predicateWithBlock:&stru_49E48];
    BOOL v7 = [v5 filteredArrayUsingPredicate:v6];

    id v8 = [v7 firstObject];
    uint64_t v9 = [v8 bundleIdentifier];

    if (v9)
    {
      id v10 = [v7 count];
      if ((unint64_t)v10 < 2)
      {
        unsigned int v17 = 1;
      }
      else
      {
        id v11 = v10;
        v35 = v2;
        v36 = v4;
        for (uint64_t i = 1; (id)i != v11; ++i)
        {
          long long v13 = -[NSObject objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", i, v35, v36);
          long long v14 = [v13 bundleIdentifier];
          if ([v14 isEqualToString:v9])
          {
          }
          else
          {
            long long v15 = [v7 objectAtIndexedSubscript:i];
            v16 = [v15 identifier];
            unsigned int v17 = [v16 isEqualToString:@"com.apple.springboard.floating-dock"];

            if (!v17) {
              goto LABEL_12;
            }
          }
        }
        unsigned int v17 = 1;
LABEL_12:
        v2 = v35;
        objc_super v4 = v36;
      }
    }
    else
    {
      unsigned int v17 = 0;
    }
    v26 = GAXLogCommon();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      unsigned int v38 = [v7 count];
      __int16 v39 = 1024;
      unsigned int v40 = v17;
      __int16 v41 = 2114;
      v42 = v7;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "App layout has %d elements from same app %i: %{public}@", buf, 0x18u);
    }

    id v27 = [v7 count];
    char v28 = v17 ^ 1;
    if ((unint64_t)v27 < 2) {
      char v28 = 1;
    }
    if (v28)
    {
      if ((unint64_t)v27 < 2) {
        goto LABEL_24;
      }
    }
    else
    {
      v29 = +[AXSettings sharedInstance];
      unsigned __int8 v30 = [v29 guidedAccessAllowsMultipleWindows];

      if (v30)
      {
LABEL_24:
        BOOL v25 = 0;
LABEL_29:

        goto LABEL_30;
      }
    }
    v31 = [(GAXAppManager *)v2 _effectiveApp];
    v32 = (char *)[v31 layoutRole];

    v33 = GAXLogCommon();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v38 = v32;
      _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "Layout role for effective app is %d", buf, 8u);
    }

    BOOL v25 = v32 != (unsigned char *)&dword_0 + 3;
    goto LABEL_29;
  }
  BOOL v7 = GAXLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_2B650(v7, v18, v19, v20, v21, v22, v23, v24);
  }
  BOOL v25 = 0;
LABEL_30:

  return v25;
}

- (void)resetRelaunchAttempts
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(GAXAppManager *)self managedApps];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) setRelaunchAttempts:0];
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)scheduleResetLaunchAttempts
{
  id v3 = [(GAXAppManager *)self resetRelaunchAttemptsTimer];

  if (!v3)
  {
    id v4 = objc_alloc((Class)AXAccessQueueTimer);
    uint64_t v5 = +[AXAccessQueue mainAccessQueue];
    id v6 = [v4 initWithTargetAccessQueue:v5];

    [(GAXAppManager *)self setResetRelaunchAttemptsTimer:v6];
  }
  long long v7 = [(GAXAppManager *)self resetRelaunchAttemptsTimer];
  [v7 cancel];

  long long v8 = [(GAXAppManager *)self resetRelaunchAttemptsTimer];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_25DE4;
  v9[3] = &unk_48928;
  v9[4] = self;
  [v8 afterDelay:v9 processBlock:5.0];
}

- (void)settingsDidChangeWithServerMode:(unsigned int)a3 allowsMotion:(BOOL)a4 allowsKeyboardTextInput:(BOOL)a5
{
  BOOL v30 = a4;
  BOOL v31 = a5;
  uint64_t v5 = *(void *)&a3;
  long long v7 = +[NSMutableArray array];
  v29 = [(GAXAppManager *)self _effectiveApp];
  objc_msgSend(v7, "axSafelyAddObject:");
  long long v8 = [(GAXAppManager *)self _sessionApps];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        if (![(GAXAppManager *)self _sessionAppIsEffectiveApp:v13]) {
          [v7 axSafelyAddObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v10);
  }
  char v28 = v8;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v14 = [(GAXAppManager *)self managedApps];
  id v15 = [v14 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v37;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v37 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
        if ([v19 isGAXClientLoaded]
          && ([v7 containsObject:v19] & 1) == 0)
        {
          uint64_t v20 = [v19 bundleIdentifier];
          if (v20)
          {
            uint64_t v21 = GAXAllowedRemoteUIProcesses();
            unsigned int v22 = [v21 containsObject:v20];

            if (v22) {
              [v7 addObject:v19];
            }
          }
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v16);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v23 = v7;
  id v24 = [v23 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v33;
    do
    {
      for (k = 0; k != v25; k = (char *)k + 1)
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(v23);
        }
        [*(id *)(*((void *)&v32 + 1) + 8 * (void)k) settingsDidChangeWithServerMode:v5 allowsMotion:v30 allowsKeyboardTextInput:v31];
      }
      id v25 = [v23 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v25);
  }
}

- (void)monitorForPurpleBuddyDeath
{
  id v3 = [(GAXAppManager *)self purpleBuddyPIDMonitor];

  if (!v3)
  {
    id v4 = +[AXSpringBoardServer server];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_2617C;
    v5[3] = &unk_49E98;
    v5[4] = self;
    [v4 purpleBuddyPID:v5];
  }
}

- (void)gaxClientDidLoad:(id)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = (_GAXAppRepresentation *)a3;
  [(GAXAppManager *)self updateManagedAppState:0];
  long long v7 = [(GAXAppManager *)self _appWithBundleIdentifier:v6];
  if (v7)
  {
    long long v8 = v7;
    if ([(_GAXAppRepresentation *)v7 pid] != v4)
    {
      if ([(_GAXAppRepresentation *)v8 pid] != -1)
      {
        id v9 = GAXLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = +[NSNumber numberWithInt:v4];
          uint64_t v11 = +[NSNumber numberWithInt:[(_GAXAppRepresentation *)v8 pid]];
          int v15 = 138543874;
          id v16 = v6;
          __int16 v17 = 2114;
          uint64_t v18 = v10;
          __int16 v19 = 2114;
          uint64_t v20 = v11;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "The pid sent from loaded client:(%{public}@: PID:%{public}@) does not match the pid we are managing: (%{public}@). This is expected if the app crashed.", (uint8_t *)&v15, 0x20u);
        }
        [(_GAXAppRepresentation *)v8 handleDeath];
      }
      [(_GAXAppRepresentation *)v8 setPid:v4];
    }
    if ([(_GAXAppRepresentation *)v8 isGAXClientLoaded])
    {
      long long v12 = GAXLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543362;
        id v16 = v8;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "The GAXClientLoaded flag was already set. Something is out of sync. %{public}@", (uint8_t *)&v15, 0xCu);
      }
    }
    [(_GAXAppRepresentation *)v8 setGaxClientLoaded:1];
  }
  else
  {
    uint64_t v13 = GAXLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = v6;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "GAX client loaded with bundleID:%{public}@ but we did not know about this app. Adding it now", (uint8_t *)&v15, 0xCu);
    }

    long long v8 = [[_GAXAppRepresentation alloc] initWithDelegate:self];
    [(_GAXAppRepresentation *)v8 setBundleIdentifier:v6];
    [(_GAXAppRepresentation *)v8 setPid:v4];
    [(_GAXAppRepresentation *)v8 setGaxClientLoaded:1];
    long long v14 = [(GAXAppManager *)self managedApps];
    [v14 addObject:v8];
  }
}

- (void)appWithBundleIdentifier:(id)a3 becameActiveWithPid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v8 = a3;
  if ([v8 isEqualToString:@"com.apple.webapp"])
  {
    id v6 = [(GAXAppManager *)self _appWithBundleIdentifier:v8];
    long long v7 = v6;
    if (v6) {
      [v6 setPid:v4];
    }
  }

  _objc_release_x2();
}

- (void)setLastKnownEffectiveApp:(id)a3
{
  uint64_t v4 = (_GAXAppRepresentation *)a3;
  lastKnownEffectiveApp = self->_lastKnownEffectiveApp;
  if ((unint64_t)v4 | (unint64_t)lastKnownEffectiveApp)
  {
    BOOL v6 = lastKnownEffectiveApp && v4 == 0;
    BOOL v7 = lastKnownEffectiveApp || v4 == 0;
    if (!v7
      || v6
      || ([(_GAXAppRepresentation *)lastKnownEffectiveApp bundleIdentifier],
          id v8 = objc_claimAutoreleasedReturnValue(),
          [(_GAXAppRepresentation *)v4 bundleIdentifier],
          id v9 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v10 = [v8 isEqualToString:v9],
          v9,
          v8,
          (v10 & 1) == 0))
    {
      uint64_t v11 = [(GAXAppManager *)self delegate];
      long long v12 = [(_GAXAppRepresentation *)v4 bundleIdentifier];
      [v11 effectiveAppDidChange:v12 withAppManager:self];
    }
  }
  uint64_t v13 = self->_lastKnownEffectiveApp;
  self->_lastKnownEffectiveApp = v4;
}

- (BOOL)effectiveAppIsPurpleBuddy
{
  v2 = [(GAXAppManager *)self _effectiveApp];
  unsigned __int8 v3 = [v2 isPurpleBuddy];

  return v3;
}

- (BOOL)effectiveAppIsPreferences
{
  v2 = [(GAXAppManager *)self _effectiveApp];
  unsigned __int8 v3 = [v2 isPreferences];

  return v3;
}

- (BOOL)effectiveAppIsCoreAuthUI
{
  v2 = [(GAXAppManager *)self _effectiveApp];
  unsigned __int8 v3 = [v2 isCoreAuthUI];

  return v3;
}

- (NSString)effectiveAppBundleIdentifier
{
  v2 = [(GAXAppManager *)self _effectiveApp];
  unsigned __int8 v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (void)terminateEffectiveApp
{
  id v2 = [(GAXAppManager *)self _effectiveApp];
  [v2 terminate];
}

- (void)suspendEffectiveApp
{
  id v2 = [(GAXAppManager *)self _effectiveApp];
  [v2 suspend];
}

- (void)resumeEffectiveApp
{
  id v2 = [(GAXAppManager *)self _effectiveApp];
  [v2 resume];
}

- (BOOL)effectiveAppWasPlayingMedia
{
  id v2 = [(GAXAppManager *)self _effectiveApp];
  unsigned __int8 v3 = [v2 wasPlayingMedia];

  return v3;
}

- (void)setEffectiveAppWasPlayingMedia:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(GAXAppManager *)self _effectiveApp];
  [v4 setWasPlayingMedia:v3];
}

- (id)effectiveAppContainedViewsForArchivedFingerPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GAXAppManager *)self _effectiveApp];
  BOOL v6 = [v5 containedViewsForArchivedFingerPath:v4];

  return v6;
}

- (BOOL)effectiveAppPrepareForTransitionToWorkspaceAndRetrieveRestrictionsInformation:(id *)a3
{
  id v4 = [(GAXAppManager *)self _effectiveApp];
  LOBYTE(a3) = [v4 prepareForTransitionToWorkspaceAndRetrieveRestrictionsInformation:a3];

  return (char)a3;
}

- (id)effectiveAppRestrictionIdentifiers
{
  id v2 = [(GAXAppManager *)self _effectiveApp];
  BOOL v3 = [v2 restrictionIdentifiers];

  return v3;
}

- (void)effectiveAppRestrictionWithIdentifier:(id)a3 didChangeState:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(GAXAppManager *)self _effectiveApp];
  [v7 restrictionWithIdentifier:v6 didChangeState:a4];
}

- (BOOL)effectiveAppIsHostedByTheSystemApp
{
  id v2 = [(GAXAppManager *)self _effectiveApp];
  unsigned __int8 v3 = [v2 isHostedByTheSystemApp];

  return v3;
}

- (NSArray)sessionAllowedBundleIdentifiers
{
  unsigned __int8 v3 = [(GAXAppManager *)self sessionAppBundleIdentifiers];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = [(GAXAppManager *)self sessionAppBundleIdentifiers];
  id v5 = [v4 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v9 isEqualToString:@"com.apple.ContactlessUIService"])
        {
          unsigned __int8 v10 = GAXLogCommon();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v32 = v9;
            _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "App allows primary app to continue running during SAM/ASAM: %@", buf, 0xCu);
          }

          uint64_t v11 = [(GAXAppManager *)self appLayoutMonitor];
          long long v12 = [v11 currentLayout];
          uint64_t v13 = [v12 elements];

          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v14 = v13;
          id v4 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v4)
          {
            uint64_t v15 = *(void *)v23;
LABEL_14:
            uint64_t v16 = 0;
            while (1)
            {
              if (*(void *)v23 != v15) {
                objc_enumerationMutation(v14);
              }
              __int16 v17 = *(void **)(*((void *)&v22 + 1) + 8 * v16);
              if (objc_msgSend(v17, "isUIApplicationElement", (void)v22))
              {
                if ([v17 layoutRole] == (char *)&dword_0 + 1) {
                  break;
                }
              }
              if (v4 == (id)++v16)
              {
                id v4 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
                if (v4) {
                  goto LABEL_14;
                }
                goto LABEL_21;
              }
            }
            id v4 = [v17 bundleIdentifier];
            __int16 v19 = GAXLogCommon();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v32 = v4;
              _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Primary app: %@", buf, 0xCu);
            }

            if (v4 && ([v3 containsObject:v4] & 1) == 0)
            {
              uint64_t v20 = [v3 arrayByAddingObject:v4];
              uint64_t v18 = v3;
              unsigned __int8 v3 = (void *)v20;
              goto LABEL_27;
            }
          }
          else
          {
LABEL_21:
            uint64_t v18 = v14;
LABEL_27:
          }
          goto LABEL_29;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v26 objects:v33 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_29:

  return (NSArray *)v3;
}

- (void)updateSessionAppBundleIdentifiers:(id)a3
{
  id v4 = [a3 mutableCopy];
  [(GAXAppManager *)self setSessionAppBundleIdentifiers:v4];
}

- (void)addSessionAppWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(GAXAppManager *)self sessionAppBundleIdentifiers];
  [v5 addObject:v4];
}

- (BOOL)sessionAppIsEffectiveApp:(id)a3
{
  unsigned __int8 v3 = self;
  id v4 = [(GAXAppManager *)self _appWithBundleIdentifier:a3];
  LOBYTE(v3) = [(GAXAppManager *)v3 _sessionAppIsEffectiveApp:v4];

  return (char)v3;
}

- (BOOL)_sessionAppIsEffectiveApp:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GAXAppManager *)self _effectiveApp];
  id v6 = (void *)v5;
  unsigned __int8 v7 = 0;
  if (v4 && v5)
  {
    id v8 = [v4 bundleIdentifier];
    id v9 = [v6 bundleIdentifier];
    unsigned __int8 v7 = [v8 isEqualToString:v9];
  }
  return v7;
}

- (BOOL)_sessionAppsContainMobilePhoneOrFacetime
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(GAXAppManager *)self _sessionApps];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) bundleIdentifier];
        unsigned __int8 v7 = GAXAppIsMobilePhoneOrFacetime(v6);

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)effectiveAppIsAcceptableForSessionApps
{
  uint64_t v4 = [(GAXAppManager *)self _effectiveApp];
  if (v4)
  {
  }
  else
  {
    uint64_t v5 = [(GAXAppManager *)self sessionAppBundleIdentifiers];
    id v2 = [v5 count];

    if ((unint64_t)v2 > 1) {
      return 1;
    }
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned __int8 v7 = [(GAXAppManager *)self _sessionApps];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v2 = v8;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v2; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        if ([(GAXAppManager *)self _sessionAppIsEffectiveApp:*(void *)(*((void *)&v15 + 1) + 8 * i)])
        {
          unsigned __int8 v6 = 1;
          goto LABEL_19;
        }
      }
      id v2 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }

  unsigned int v11 = [(GAXAppManager *)self _sessionAppsContainMobilePhoneOrFacetime];
  if (v11
    && ([(GAXAppManager *)self _effectiveApp],
        unsigned __int8 v7 = objc_claimAutoreleasedReturnValue(),
        [v7 bundleIdentifier],
        id v2 = (id)objc_claimAutoreleasedReturnValue(),
        ([v2 isEqualToString:@"com.apple.InCallService"] & 1) != 0))
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    long long v12 = [(GAXAppManager *)self _effectiveApp];
    uint64_t v13 = [v12 bundleIdentifier];
    unsigned __int8 v6 = [v13 isEqualToString:@"com.apple.CoreAuthUI"];

    if (!v11) {
      return v6;
    }
  }

LABEL_19:
  return v6;
}

- (BOOL)sessionAppIsHostedByTheSystemApp:(id)a3
{
  id v3 = [(GAXAppManager *)self _appWithBundleIdentifier:a3];
  uint64_t v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 isHostedByTheSystemApp];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)sessionAppGAXClientDidCheckIn
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(GAXAppManager *)self _sessionApps];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isGAXClientLoaded])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)sessionAppsContainPurpleBuddy
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(GAXAppManager *)self _sessionApps];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isPurpleBuddy])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)sessionAppsContainPreferences
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(GAXAppManager *)self _sessionApps];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isPreferences])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)appWithIdentifierIsASessionApp:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(GAXAppManager *)self sessionAppBundleIdentifiers];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)_appIsSessionAppWithIdentifier:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned __int8 v5 = [(GAXAppManager *)self sessionAppBundleIdentifiers];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isEqualToString:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (unint64_t)sessionAppRelaunchAttemptsForAppWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([(GAXAppManager *)self _appIsSessionAppWithIdentifier:v4])
  {
    unsigned __int8 v5 = [(GAXAppManager *)self _appWithBundleIdentifier:v4];
    unint64_t v6 = (unint64_t)[v5 relaunchAttempts];
  }
  else
  {
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (void)incrementRelaunchAttemptsForSessionAppWithIdentifier:(id)a3
{
  id v5 = a3;
  if (-[GAXAppManager _appIsSessionAppWithIdentifier:](self, "_appIsSessionAppWithIdentifier:"))
  {
    id v4 = [(GAXAppManager *)self _appWithBundleIdentifier:v5];
    objc_msgSend(v4, "setRelaunchAttempts:", (char *)objc_msgSend(v4, "relaunchAttempts") + 1);
  }
}

- (BOOL)_axAppIsValidGAXApp:(id)a3
{
  id v3 = [a3 bundleIdentifier];
  BOOL v4 = [v3 rangeOfString:@"springboard"] == (id)0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (id)_effectiveApp
{
  id v3 = GAXAllowedRemoteUIProcesses();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v21 = self;
  BOOL v4 = [(GAXAppManager *)self managedApps];
  id v5 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v27;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v27 != v7) {
        objc_enumerationMutation(v4);
      }
      long long v9 = *(void **)(*((void *)&v26 + 1) + 8 * v8);
      if ([v9 isLayoutFullscreenModal])
      {
        long long v10 = [v9 bundleIdentifier];
        unsigned int v11 = [v3 containsObject:v10];

        if (v11)
        {
          if (qword_56150 != -1) {
            dispatch_once(&qword_56150, &stru_49EB8);
          }
          long long v12 = (void *)qword_56148;
          long long v13 = [v9 bundleIdentifier];
          LODWORD(v12) = [v12 containsObject:v13];

          if (!v12) {
            break;
          }
        }
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    id v15 = v9;

    id v14 = v21;
    if (v15) {
      goto LABEL_27;
    }
  }
  else
  {
LABEL_13:

    id v14 = v21;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v16 = [(GAXAppManager *)v14 managedApps];
  id v15 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    uint64_t v17 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v16);
        }
        __int16 v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v19 isLayoutPrimary]
          && [(GAXAppManager *)v14 _axAppIsValidGAXApp:v19])
        {
          id v15 = v19;
          goto LABEL_26;
        }
      }
      id v15 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_26:

LABEL_27:
  [(GAXAppManager *)v14 setLastKnownEffectiveApp:v15];

  return v15;
}

- (id)_sessionApps
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v4 = [(GAXAppManager *)self sessionAppBundleIdentifiers];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = [(GAXAppManager *)self _appWithBundleIdentifier:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        [v3 axSafelyAddObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_appWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(GAXAppManager *)self managedApps];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v10 = [v9 bundleIdentifier];
        unsigned int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_bundleIdentifierFromLayoutIdentifier:(id)a3
{
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = GAXAllowedRemoteUIProcesses();
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v4);
      }
      long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
      long long v10 = +[NSString stringWithFormat:@"sceneID:%@-", v9];
      if ([v3 hasPrefix:v10]) {
        break;
      }

      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v9;

    if (v11) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  id v11 = v3;
LABEL_12:

  return v11;
}

- (id)_makeGAXAppFromAXApp:(id)a3
{
  id v4 = a3;
  id v5 = [[_GAXAppRepresentation alloc] initWithDelegate:self];
  id v6 = [v4 bundleIdentifier];
  [(_GAXAppRepresentation *)v5 setBundleIdentifier:v6];

  -[_GAXAppRepresentation setPid:](v5, "setPid:", [v4 pid]);
  id v7 = [v4 layoutRole];

  [(_GAXAppRepresentation *)v5 setLayoutRole:v7];

  return v5;
}

- (void)_updateGAXApp:(id)a3 fromAXApp:(id)a4
{
  id v5 = a4;
  id v8 = a3;
  id v6 = [v5 bundleIdentifier];
  [v8 setBundleIdentifier:v6];

  objc_msgSend(v8, "setPid:", objc_msgSend(v5, "pid"));
  id v7 = [v5 layoutRole];

  [v8 setLayoutRole:v7];
}

- (void)gaxAppDidGoInvalid:(id)a3
{
  id v4 = a3;
  if (([v4 isGAXClientLoaded] & 1) == 0)
  {
    id v5 = GAXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "The GAXClientLoaded flag was not set when this app went invalid. Something is out of sync: %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v4 setGaxClientLoaded:0];
  [v4 setPid:0xFFFFFFFFLL];
  id v6 = [(GAXAppManager *)self _effectiveApp];
  id v7 = [v6 bundleIdentifier];
  id v8 = [v4 bundleIdentifier];
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    long long v10 = [(GAXAppManager *)self delegate];
    [v10 effectiveAppDidBecomeInvalidWithAppManager:self];
  }
}

- (_GAXAppRepresentation)lastKnownEffectiveApp
{
  return self->_lastKnownEffectiveApp;
}

- (GAXAppManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GAXAppManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)sessionAppBundleIdentifiers
{
  return self->_sessionAppBundleIdentifiers;
}

- (void)setSessionAppBundleIdentifiers:(id)a3
{
}

- (NSMutableSet)managedApps
{
  return self->_managedApps;
}

- (void)setManagedApps:(id)a3
{
}

- (FBSDisplayLayoutMonitor)appLayoutMonitor
{
  return self->_appLayoutMonitor;
}

- (void)setAppLayoutMonitor:(id)a3
{
}

- (AXAccessQueueTimer)resetRelaunchAttemptsTimer
{
  return self->_resetRelaunchAttemptsTimer;
}

- (void)setResetRelaunchAttemptsTimer:(id)a3
{
}

- (OS_dispatch_source)purpleBuddyPIDMonitor
{
  return self->_purpleBuddyPIDMonitor;
}

- (void)setPurpleBuddyPIDMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purpleBuddyPIDMonitor, 0);
  objc_storeStrong((id *)&self->_resetRelaunchAttemptsTimer, 0);
  objc_storeStrong((id *)&self->_appLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_managedApps, 0);
  objc_storeStrong((id *)&self->_sessionAppBundleIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_lastKnownEffectiveApp, 0);
}

@end