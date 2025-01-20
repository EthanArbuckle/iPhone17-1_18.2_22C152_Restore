@interface CCUIAppLauncherViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityControlCenterShouldExpandContentModule;
- (id)_accessibilityControlCenterButtonIdentifier;
- (id)_accessibilityControlCenterButtonLabel;
@end

@implementation CCUIAppLauncherViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIAppLauncherViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CCUIAppLauncherViewController" isKindOfClass:@"CCUIMenuModuleViewController"];
  [v3 validateClass:@"CCUIMenuModuleViewController" isKindOfClass:@"CCUIButtonModuleViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIAppLauncherViewController", @"module", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIAppLauncherModule", @"displayName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIAppLauncherModule", @"applicationIdentifier", "@", 0);
  [v3 validateClass:@"CCUIAppLauncherModule" hasInstanceVariable:@"_application" withType:"SBFApplication"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIAppLauncherModule", @"supportsApplicationShortcuts", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFApplication", @"staticApplicationShortcutItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFApplication", @"dynamicApplicationShortcutItems", "@", 0);
}

- (BOOL)_accessibilityControlCenterShouldExpandContentModule
{
  id v3 = [(CCUIAppLauncherViewControllerAccessibility *)self safeValueForKey:@"module"];
  char v4 = [v3 safeBoolForKey:@"supportsApplicationShortcuts"];

  v5 = [(CCUIAppLauncherViewControllerAccessibility *)self safeValueForKey:@"module"];
  v6 = [v5 safeValueForKey:@"_application"];
  v7 = [v6 safeArrayForKey:@"staticApplicationShortcutItems"];
  if ([v7 count])
  {
    BOOL v8 = 1;
  }
  else
  {
    v9 = [(CCUIAppLauncherViewControllerAccessibility *)self safeValueForKey:@"_application"];
    v10 = [v9 safeArrayForKey:@"dynamicApplicationShortcutItems"];
    BOOL v8 = [v10 count] != 0;
  }
  return v4 & v8;
}

- (id)_accessibilityControlCenterButtonLabel
{
  v2 = [(CCUIAppLauncherViewControllerAccessibility *)self safeValueForKey:@"module"];
  id v3 = [v2 safeStringForKey:@"displayName"];

  return v3;
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  v2 = [(CCUIAppLauncherViewControllerAccessibility *)self safeValueForKey:@"module"];
  id v3 = [v2 safeStringForKey:@"applicationIdentifier"];

  return v3;
}

@end