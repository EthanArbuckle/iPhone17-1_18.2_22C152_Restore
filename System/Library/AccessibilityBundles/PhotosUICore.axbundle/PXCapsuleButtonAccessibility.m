@interface PXCapsuleButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation PXCapsuleButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXCapsuleButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v2 = [(PXCapsuleButtonAccessibility *)self _accessibilityStringForLabelKeyValues:@"titleLabel"];
  v3 = [v2 lowercaseString];

  return v3;
}

@end