@interface EKUIPopupTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation EKUIPopupTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKUIPopupTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityValue
{
  v2 = [(EKUIPopupTableViewCellAccessibility *)self safeValueForKey:@"_popupButton"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

@end