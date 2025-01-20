@interface DeveloperLinkViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation DeveloperLinkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Arcade.DeveloperLinkView";
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
  return (id)[(DeveloperLinkViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTitleLabel, accessibilitySubtitleLabel"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)DeveloperLinkViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(DeveloperLinkViewAccessibility *)&v3 accessibilityTraits];
}

@end