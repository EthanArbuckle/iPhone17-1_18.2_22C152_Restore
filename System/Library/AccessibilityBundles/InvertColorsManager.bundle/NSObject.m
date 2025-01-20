@interface NSObject
- (BOOL)_accessibilityInvertColorsActsAsDarkWindow;
- (BOOL)_accessibilityInvertColorsIsInHostedDarkWindow;
- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert;
- (id)_accessibilityInvertColorAdditionalVisitors;
- (id)_accessibilityInvertColorsActsAsDarkWindowBlock;
- (id)_accessibilityInvertColorsSupportsDarkWindowInvertBlock;
- (void)_accessibilitySetInvertColorsActsAsDarkWindow:(BOOL)a3;
- (void)_accessibilitySetInvertColorsActsAsDarkWindowBlock:(id)a3;
- (void)_accessibilitySetInvertColorsSupportsDarkWindowInvert:(BOOL)a3;
- (void)_accessibilitySetInvertColorsSupportsDarkWindowInvertBlock:(id)a3;
- (void)accessibilityApplyIgnoreInvertToWindow:(id)a3;
- (void)accessibilityDeapplyIgnoreInvertToWindow:(id)a3;
@end

@implementation NSObject

- (void)accessibilityApplyIgnoreInvertToWindow:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[AXSubsystemInvertColors sharedInstance];
    unsigned __int8 v6 = [v5 ignoreLogging];

    if ((v6 & 1) == 0)
    {
      v7 = +[AXSubsystemInvertColors identifier];
      v8 = AXLoggerForFacility();

      os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = AXColorizeFormatLog();
        id v20 = v4;
        v11 = _AXStringForArgs();
        if (os_log_type_enabled(v8, v9))
        {
          *(_DWORD *)buf = 138543362;
          v22 = v11;
          _os_log_impl(&dword_0, v8, v9, "%{public}@", buf, 0xCu);
        }
      }
    }
    if ((objc_msgSend(v4, "accessibilityIgnoresInvertColors", v20) & 1) == 0)
    {
      [v4 setAccessibilityIgnoresInvertColors:1];
      v12 = AXLogInvertColors();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_21928((uint64_t)self, v12, v13, v14, v15, v16, v17, v18);
      }

      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)UIAccessibilityInvertColorsStatusDidChangeNotification, 0, 0, 1u);
    }
  }
}

- (void)accessibilityDeapplyIgnoreInvertToWindow:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[AXSubsystemInvertColors sharedInstance];
    unsigned __int8 v6 = [v5 ignoreLogging];

    if ((v6 & 1) == 0)
    {
      v7 = +[AXSubsystemInvertColors identifier];
      v8 = AXLoggerForFacility();

      os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = AXColorizeFormatLog();
        id v20 = v4;
        v11 = _AXStringForArgs();
        if (os_log_type_enabled(v8, v9))
        {
          *(_DWORD *)buf = 138543362;
          v22 = v11;
          _os_log_impl(&dword_0, v8, v9, "%{public}@", buf, 0xCu);
        }
      }
    }
    if (objc_msgSend(v4, "accessibilityIgnoresInvertColors", v20))
    {
      [v4 setAccessibilityIgnoresInvertColors:0];
      v12 = AXLogInvertColors();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_21994((uint64_t)self, v12, v13, v14, v15, v16, v17, v18);
      }

      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)UIAccessibilityInvertColorsStatusDidChangeNotification, 0, 0, 1u);
    }
  }
}

- (id)_accessibilityInvertColorAdditionalVisitors
{
  return 0;
}

- (BOOL)_accessibilityInvertColorsIsInHostedDarkWindow
{
  return 0;
}

- (void)_accessibilitySetInvertColorsActsAsDarkWindow:(BOOL)a3
{
  [self _accessibilitySetBoolValue:a3 forKey:@"_accessibilityInvertColorsActsAsDarkWindow"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    +[AXInvertColorsManager toggleDarkModeWindowInvert:self];
  }
}

- (BOOL)_accessibilityInvertColorsActsAsDarkWindow
{
  v3 = [self _accessibilityInvertColorsActsAsDarkWindowBlock];

  if (v3)
  {
    id v4 = [self _accessibilityInvertColorsActsAsDarkWindowBlock];
    unsigned __int8 v5 = v4[2]();
  }
  else
  {
    unsigned __int8 v6 = [self _accessibilityValueForKey:@"_accessibilityInvertColorsActsAsDarkWindow"];
    id v4 = v6;
    if (!v6)
    {
      BOOL v7 = 0;
      goto LABEL_6;
    }
    unsigned __int8 v5 = [v6 BOOLValue];
  }
  BOOL v7 = v5;
LABEL_6:

  return v7;
}

- (void)_accessibilitySetInvertColorsActsAsDarkWindowBlock:(id)a3
{
  id v4 = objc_retainBlock(a3);
  [self _accessibilitySetRetainedValue:v4 forKey:@"_accessibilityInvertColorsActsAsDarkWindowBlock"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    +[AXInvertColorsManager toggleDarkModeWindowInvert:self];
  }
}

- (id)_accessibilityInvertColorsActsAsDarkWindowBlock
{
  return [self _accessibilityValueForKey:@"_accessibilityInvertColorsActsAsDarkWindowBlock"];
}

- (void)_accessibilitySetInvertColorsSupportsDarkWindowInvert:(BOOL)a3
{
  [self _accessibilitySetBoolValue:a3 forKey:@"_accessibilityInvertColorsSupportsDarkWindowInvert"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    +[AXInvertColorsManager toggleDarkModeWindowInvert:self];
  }
}

- (BOOL)_accessibilityInvertColorsSupportsDarkWindowInvert
{
  v3 = [self _accessibilityInvertColorsSupportsDarkWindowInvertBlock];

  if (v3)
  {
    id v4 = [self _accessibilityInvertColorsSupportsDarkWindowInvertBlock];
    unsigned __int8 v5 = v4[2]();
  }
  else
  {
    unsigned __int8 v6 = [self _accessibilityValueForKey:@"_accessibilityInvertColorsSupportsDarkWindowInvert"];
    id v4 = v6;
    if (!v6)
    {
      BOOL v7 = 1;
      goto LABEL_6;
    }
    unsigned __int8 v5 = [v6 BOOLValue];
  }
  BOOL v7 = v5;
LABEL_6:

  return v7;
}

- (void)_accessibilitySetInvertColorsSupportsDarkWindowInvertBlock:(id)a3
{
  id v4 = objc_retainBlock(a3);
  [self _accessibilitySetRetainedValue:v4 forKey:@"_accessibilitySetInvertColorsSupportsDarkWindowInvertBlock"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    +[AXInvertColorsManager toggleDarkModeWindowInvert:self];
  }
}

- (id)_accessibilityInvertColorsSupportsDarkWindowInvertBlock
{
  v2 = [self _accessibilityValueForKey:@"_accessibilitySetInvertColorsSupportsDarkWindowInvertBlock"];
  id v3 = objc_retainBlock(v2);

  return v3;
}

@end