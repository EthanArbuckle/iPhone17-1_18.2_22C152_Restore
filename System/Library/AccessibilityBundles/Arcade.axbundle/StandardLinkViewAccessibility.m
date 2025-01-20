@interface StandardLinkViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation StandardLinkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Arcade.StandardLinkView";
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
  return (id)[(StandardLinkViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityDescriptionLabel, accessibilitySummaryLabel"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)StandardLinkViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(StandardLinkViewAccessibility *)&v3 accessibilityTraits];
}

@end