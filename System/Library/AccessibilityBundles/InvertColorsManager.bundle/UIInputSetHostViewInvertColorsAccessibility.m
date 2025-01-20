@interface UIInputSetHostViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation UIInputSetHostViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIInputSetHostView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  v2 = +[UIKeyboardImpl activeInstance];

  if (!v2)
  {
    v17 = +[AXSubsystemInvertColors sharedInstance];
    unsigned __int8 v18 = [v17 ignoreLogging];

    if ((v18 & 1) == 0)
    {
      v19 = +[AXSubsystemInvertColors identifier];
      v20 = AXLoggerForFacility();

      os_log_type_t v21 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v20, v21))
      {
        v22 = AXColorizeFormatLog();
        v23 = _AXStringForArgs();
        if (os_log_type_enabled(v20, v21))
        {
          int v24 = 138543362;
          v25 = v23;
          _os_log_impl(&dword_0, v20, v21, "%{public}@", (uint8_t *)&v24, 0xCu);
        }
      }
    }
    return 0;
  }
  v3 = +[UIKeyboardImpl activeInstance];
  v4 = [v3 safeValueForKey:@"_inheritedRenderConfig"];
  unsigned int v5 = [v4 safeBoolForKey:@"lightKeyboard"];

  v6 = +[NSBundle mainBundle];
  v7 = [v6 bundleIdentifier];
  unsigned int v8 = [v7 isEqualToString:AX_InputUIBundleName];

  if (v8)
  {
    if (v5)
    {
      v9 = [UIApp safeUIViewForKey:@"keyWindow"];
      v10 = [v9 safeValueForKey:@"rootViewController"];
      v11 = [v10 safeValueForKey:@"textInputSource"];
      v12 = [v11 safeValueForKey:@"sourceSession"];
      v13 = [v12 safeValueForKey:@"documentTraits"];
      v14 = [v13 safeStringForKey:@"bundleId"];
      unsigned __int8 v15 = [v14 isEqualToString:AX_SpotlightBundleName];

      return v15;
    }
    return 0;
  }
  return (AXProcessIsSpotlight() | v5) ^ 1;
}

@end