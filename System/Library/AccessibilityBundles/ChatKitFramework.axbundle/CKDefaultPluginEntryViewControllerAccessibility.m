@interface CKDefaultPluginEntryViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_axSetCloseActionProviderOnBubbleView:(id)a3;
@end

@implementation CKDefaultPluginEntryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKDefaultPluginEntryViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_axSetCloseActionProviderOnBubbleView:(id)a3
{
  id v4 = a3;
  id v5 = [(CKDefaultPluginEntryViewControllerAccessibility *)self safeValueForKey:@"balloonView"];
  [v5 _accessibilitySetRetainedValue:v4 forKey:@"AXPluginClearActionProvider"];
}

@end