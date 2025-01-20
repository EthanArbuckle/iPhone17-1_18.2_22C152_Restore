@interface WFApertureStatusViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation WFApertureStatusViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFApertureStatusViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFApertureStatusViewController", @"leadingView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFApertureStatusViewController", @"minimalView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFApertureStatusViewController", @"attribution", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFApertureStatusViewController", @"progressView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFProgressAccessoryView", @"cancelButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFDialogAttribution", @"title", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v14.receiver = self;
  v14.super_class = (Class)WFApertureStatusViewControllerAccessibility;
  [(WFApertureStatusViewControllerAccessibility *)&v14 _accessibilityLoadAccessibilityInformation];
  id v3 = [(WFApertureStatusViewControllerAccessibility *)self safeValueForKey:@"attribution"];
  v4 = [v3 safeStringForKey:@"title"];
  v5 = [(WFApertureStatusViewControllerAccessibility *)self safeValueForKey:@"leadingView"];
  v6 = accessibilityLocalizedString(@"running.shortcut");
  v7 = __UIAXStringForVariables();
  objc_msgSend(v5, "setAccessibilityLabel:", v7, v4, @"__AXStringForVariablesSentinel");

  v8 = [(WFApertureStatusViewControllerAccessibility *)self safeValueForKey:@"minimalView"];
  v9 = accessibilityLocalizedString(@"running.shortcut");
  v10 = __UIAXStringForVariables();
  objc_msgSend(v8, "setAccessibilityLabel:", v10, v4, @"__AXStringForVariablesSentinel");

  v11 = [(WFApertureStatusViewControllerAccessibility *)self safeValueForKey:@"progressView"];
  v12 = [v11 safeValueForKey:@"cancelButton"];
  v13 = accessibilityLocalizedString(@"cancel.shortcut");
  [v12 setAccessibilityLabel:v13];
}

@end