@interface AppStoreApplicationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityFirstElementForFocus;
- (id)_axVisibleViewController;
@end

@implementation AppStoreApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BridgeStoreExtension.AppStoreApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BridgeStoreExtension.ActivityViewController"];
  [v3 validateClass:@"BridgeStoreExtension.ActivityViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"BridgeStoreExtension.AppDelegate" hasSwiftField:@"tabBarController" withSwiftType:"Optional<FlowTabBarController>"];
  [v3 validateClass:@"BridgeStoreExtension.FlowTabBarController" isKindOfClass:@"UITabBarController"];
}

- (id)_accessibilityFirstElementForFocus
{
  id v3 = accessibilityAppStorePrefixForTarget();
  v4 = [(AppStoreApplicationAccessibility *)self _axVisibleViewController];
  v5 = [v3 stringByAppendingString:@".ActivityViewController"];
  MEMORY[0x2456457F0]();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [v4 safeUIViewForKey:@"view"];
    [v7 _accessibilityFirstDescendant];
  }
  else
  {
    v7 = [MEMORY[0x263F81198] defaultVoiceOverOptions];
    [(AppStoreApplicationAccessibility *)self _accessibilityFirstElementForFocusWithOptions:v7];
  v8 = };

  return v8;
}

- (id)_axVisibleViewController
{
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  id v3 = [v2 delegate];

  v4 = [v3 safeSwiftValueForKey:@"tabBarController"];
  v5 = [v4 safeValueForKey:@"selectedViewController"];
  v6 = v5;
  if (v5 && ([v5 presentedViewController], (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = v7;
    v9 = [v7 presentedViewController];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end