@interface HWFavoritesPickerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation HWFavoritesPickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HWFavoritesPickerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)HWFavoritesPickerViewAccessibility;
  [(HWFavoritesPickerViewAccessibility *)&v4 setEditing:a3 animated:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end