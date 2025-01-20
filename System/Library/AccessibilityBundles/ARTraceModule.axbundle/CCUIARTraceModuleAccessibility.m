@interface CCUIARTraceModuleAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityControlCenterButtonIdentifier;
- (id)_accessibilityControlCenterButtonLabel;
@end

@implementation CCUIARTraceModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIARTraceModule";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilityControlCenterButtonLabel
{
  return accessibilityLocalizedString(@"ar.trace.label");
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  return @"ar-trace";
}

@end