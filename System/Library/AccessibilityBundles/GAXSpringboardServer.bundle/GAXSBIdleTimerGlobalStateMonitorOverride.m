@interface GAXSBIdleTimerGlobalStateMonitorOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isBatterySaverModeActive;
- (id)autoLockTimeout;
@end

@implementation GAXSBIdleTimerGlobalStateMonitorOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBIdleTimerGlobalStateMonitor";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIdleTimerGlobalStateMonitor", @"autoLockTimeout", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIdleTimerGlobalStateMonitor", @"isBatterySaverModeActive", "B", 0);
}

- (id)autoLockTimeout
{
  v14.receiver = self;
  v14.super_class = (Class)GAXSBIdleTimerGlobalStateMonitorOverride;
  v2 = [(GAXSBIdleTimerGlobalStateMonitorOverride *)&v14 autoLockTimeout];
  id v3 = +[GAXSpringboard sharedInstance];
  if ([v3 isActive])
  {
    if ([v3 allowsAutolock])
    {
      if ([v3 profileConfiguration] != 1)
      {
        v6 = GAXLogCommon();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v7 = "Using system idle timer because profile allows auto lock.";
          goto LABEL_13;
        }
LABEL_14:

        goto LABEL_15;
      }
      v4 = +[AXSettings sharedInstance];
      id v5 = [v4 guidedAccessAutoLockTimeInSeconds];

      if (v5 == (id)AXSGuidedAccessAutoLockTimeMirrorSystem)
      {
        v6 = GAXLogCommon();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v7 = "Using system idle timer in order to mirror Display & Brightness.";
LABEL_13:
          _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, v7, buf, 2u);
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v5 == (id)AXSGuidedAccessAutoLockTimeNever)
      {
        v8 = GAXLogCommon();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
          goto LABEL_10;
        }
        *(_WORD *)buf = 0;
        v9 = "Disabling idle timer per Guided Access auto-lock setting.";
      }
      else
      {
        v11 = +[AXSettings sharedInstance];
        unsigned __int8 v12 = [v11 gaxInternalSettingsTimeRestrictionHasExpired];

        v8 = GAXLogCommon();
        BOOL v13 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
        if ((v12 & 1) == 0)
        {
          if (v13)
          {
            *(_DWORD *)buf = 134217984;
            id v16 = v5;
            _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Using custom time %ld for idle timer.", buf, 0xCu);
          }

          +[NSNumber numberWithInteger:v5];
          v2 = v6 = v2;
          goto LABEL_14;
        }
        if (!v13) {
          goto LABEL_10;
        }
        *(_WORD *)buf = 0;
        v9 = "Disabling idle timer because time restriction has expired.";
      }
    }
    else
    {
      v8 = GAXLogCommon();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
LABEL_10:

        v6 = v2;
        v2 = &off_2E558;
        goto LABEL_14;
      }
      *(_WORD *)buf = 0;
      v9 = "Disabling idle timer because it is not allowed by the profile.";
    }
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, v9, buf, 2u);
    goto LABEL_10;
  }
LABEL_15:

  return v2;
}

- (BOOL)isBatterySaverModeActive
{
  id v3 = +[GAXSpringboard sharedInstance];
  if ([v3 isActive])
  {
    BOOL v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)GAXSBIdleTimerGlobalStateMonitorOverride;
    BOOL v4 = [(GAXSBIdleTimerGlobalStateMonitorOverride *)&v6 isBatterySaverModeActive];
  }

  return v4;
}

@end