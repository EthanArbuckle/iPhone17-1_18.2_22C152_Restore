@interface HKElectrocardiogramCardViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HKElectrocardiogramCardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKElectrocardiogramCardView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)MEMORY[0x270F80938](self, a2);
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"hint.more.info");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)HKElectrocardiogramCardViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(HKElectrocardiogramCardViewAccessibility *)&v3 accessibilityTraits];
}

@end