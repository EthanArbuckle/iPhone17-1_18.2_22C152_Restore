@interface ApplePayBubbleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation ApplePayBubbleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Business.ApplePayBubbleView";
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
  v6.receiver = self;
  v6.super_class = (Class)ApplePayBubbleViewAccessibility;
  v2 = [(ApplePayBubbleViewAccessibility *)&v6 accessibilityLabel];
  v3 = accessibilityLocalizedString(@"APPLE_PAY");
  v4 = [v2 stringByAppendingString:v3];

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ApplePayBubbleViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(ApplePayBubbleViewAccessibility *)&v3 accessibilityTraits];
}

@end