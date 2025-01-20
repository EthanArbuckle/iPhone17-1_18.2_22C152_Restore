@interface StandardLinkViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation StandardLinkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppStore.StandardLinkView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AppStore.StandardLinkView", @"accessibilityDescriptionLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AppStore.StandardLinkView", @"accessibilitySummaryLabel", "@", 0);
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