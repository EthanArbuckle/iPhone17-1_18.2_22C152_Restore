@interface AVTAttributeLabeledCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation AVTAttributeLabeledCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTAttributeLabeledCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)AVTAttributeLabeledCollectionViewCellAccessibility;
  [(AVTAttributeLabeledCollectionViewCellAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(AVTAttributeLabeledCollectionViewCellAccessibility *)self safeValueForKey:@"label"];
  [v3 setIsAccessibilityElement:0];
}

@end