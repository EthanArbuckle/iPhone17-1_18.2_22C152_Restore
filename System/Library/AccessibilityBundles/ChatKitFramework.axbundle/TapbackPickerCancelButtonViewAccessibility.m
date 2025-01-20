@interface TapbackPickerCancelButtonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TapbackPickerCancelButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ChatKit.TapbackPickerCancelButtonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"close.custom.emoji.picker");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)TapbackPickerCancelButtonViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(TapbackPickerCancelButtonViewAccessibility *)&v3 accessibilityTraits];
}

@end