@interface _SFMultipleLineAlertActionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation _SFMultipleLineAlertActionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SFMultipleLineAlertActionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFMultipleLineAlertActionView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFMultipleLineAlertActionView", @"detailLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(_SFMultipleLineAlertActionViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"titleLabel, detailLabel"];
}

@end