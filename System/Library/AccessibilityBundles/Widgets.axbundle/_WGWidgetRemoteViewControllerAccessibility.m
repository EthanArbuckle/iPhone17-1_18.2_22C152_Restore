@interface _WGWidgetRemoteViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_wantsKeyboardEnvironmentEventDeferringForFocusOnScreen:(id)a3;
@end

@implementation _WGWidgetRemoteViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_WGWidgetRemoteViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_WGWidgetRemoteViewController" isKindOfClass:@"_UIRemoteViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIRemoteViewController", @"_wantsKeyboardEnvironmentEventDeferringForFocusOnScreen:", "B", "@", 0);
}

- (BOOL)_wantsKeyboardEnvironmentEventDeferringForFocusOnScreen:(id)a3
{
  id v4 = a3;
  char v11 = 0;
  objc_opt_class();
  v5 = __UIAccessibilityCastAsClass();
  v6 = [v5 view];
  char v7 = [v6 _accessibilityIsFKARunningForFocusItem];

  if (v7)
  {
    BOOL v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_WGWidgetRemoteViewControllerAccessibility;
    BOOL v8 = [(_WGWidgetRemoteViewControllerAccessibility *)&v10 _wantsKeyboardEnvironmentEventDeferringForFocusOnScreen:v4];
  }

  return v8;
}

@end