@interface AVTColorWheelViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AVTColorWheelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTColorWheelView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"editor.color.expand");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)AVTColorWheelViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(AVTColorWheelViewAccessibility *)&v3 accessibilityTraits];
}

@end