@interface AVTFunCamAvatarPickerTitleCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation AVTFunCamAvatarPickerTitleCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTFunCamAvatarPickerTitleCell";
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
  v4.super_class = (Class)AVTFunCamAvatarPickerTitleCellAccessibility;
  [(AVTFunCamAvatarPickerTitleCellAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(AVTFunCamAvatarPickerTitleCellAccessibility *)self safeValueForKeyPath:@"titleLabel"];
  [v3 setIsAccessibilityElement:0];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end