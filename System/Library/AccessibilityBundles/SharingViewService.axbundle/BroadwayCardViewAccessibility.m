@interface BroadwayCardViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation BroadwayCardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BroadwayCardView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF00];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"apple.card.image");
}

@end