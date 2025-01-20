@interface CCUIPerformanceTraceModuleViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityControlCenterButtonLabel;
@end

@implementation CCUIPerformanceTraceModuleViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIPerformanceTraceModuleViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityControlCenterButtonLabel
{
  return accessibilityLocalizedString(@"performance.trace.button.label");
}

@end