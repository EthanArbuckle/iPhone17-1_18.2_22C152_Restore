@interface BCSCoachingMessageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation BCSCoachingMessageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BCSCoachingMessageView";
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
  v2 = [(BCSCoachingMessageViewAccessibility *)self _accessibilityDescendantOfType:objc_opt_class()];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)BCSCoachingMessageViewAccessibility;
  return *MEMORY[0x263F1CF48] | [(BCSCoachingMessageViewAccessibility *)&v3 accessibilityTraits];
}

@end