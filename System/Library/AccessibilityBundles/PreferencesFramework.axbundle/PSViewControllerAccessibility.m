@interface PSViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHandleNavigationControllerDidEndTransition;
@end

@implementation PSViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_accessibilityHandleNavigationControllerDidEndTransition
{
  v28[2] = *MEMORY[0x263EF8340];
  BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  if (IsVoiceOverRunning)
  {
    v4 = [(id)*MEMORY[0x263F1D020] _accessibilityValueForKey:@"applicationDidBecomeActiveDate"];
    v5 = [MEMORY[0x263EFF910] date];
    v6 = v5;
    if (v4 && ([v5 timeIntervalSinceDate:v4], v7 <= 1.0))
    {
    }
    else
    {
      v8 = [MEMORY[0x263F086E0] mainBundle];
      v9 = [v8 bundleIdentifier];
      char v10 = [v9 isEqualToString:@"com.apple.Bridge"];

      if ((v10 & 1) == 0)
      {
        NSClassFromString(&cfstr_Uisplitviewcon.isa);
        uint64_t v11 = [(PSViewControllerAccessibility *)self safeValueForKey:@"view"];
        if (!v11)
        {
          LODWORD(v14) = 0;
LABEL_20:
          LOBYTE(IsVoiceOverRunning) = v14 != 0;
          return IsVoiceOverRunning;
        }
        v12 = (void *)v11;
        while (1)
        {
          v13 = [v12 safeValueForKey:@"_viewDelegate"];
          if (objc_opt_isKindOfClass()) {
            break;
          }
          uint64_t v14 = [v12 superview];

          v12 = (void *)v14;
          if (!v14) {
            goto LABEL_20;
          }
        }
        id v15 = v13;
        if ([v15 isCollapsed])
        {
          LODWORD(v14) = 0;
LABEL_19:

          goto LABEL_20;
        }
        objc_opt_class();
        v16 = [(PSViewControllerAccessibility *)self safeValueForKey:@"parentViewController"];
        v17 = __UIAccessibilityCastAsClass();

        v18 = [v17 navigationBar];
        v19 = [MEMORY[0x263F81198] defaultVoiceOverOptions];
        v20 = [v18 _accessibilityLeafDescendantsWithOptions:v19];
        v21 = [v20 firstObject];

        if (v21
          || ([(PSViewControllerAccessibility *)self safeStringForKey:@"title"],
              v25 = objc_claimAutoreleasedReturnValue(),
              uint64_t v26 = [v25 length],
              v25,
              !v26))
        {
          id v22 = v12;
        }
        else
        {
          id v22 = v18;
          if (!v22)
          {
            LODWORD(v14) = 0;
            goto LABEL_18;
          }
        }
        UIAccessibilityNotifications v23 = *MEMORY[0x263F1CE68];
        v28[0] = *MEMORY[0x263F21A78];
        v28[1] = v22;
        v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
        UIAccessibilityPostNotification(v23, v24);

        LODWORD(v14) = 1;
LABEL_18:

        goto LABEL_19;
      }
    }
    LOBYTE(IsVoiceOverRunning) = 0;
  }
  return IsVoiceOverRunning;
}

@end