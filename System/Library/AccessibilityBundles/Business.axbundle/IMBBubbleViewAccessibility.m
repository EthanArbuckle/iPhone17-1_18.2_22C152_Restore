@interface IMBBubbleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation IMBBubbleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Business.IMBBubbleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Business.IMBBubbleView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Business.IMBBubbleView", @"subtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Business.IMBBubbleView", @"image", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(IMBBubbleViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"titleLabel, subtitleLabel, image"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)IMBBubbleViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(IMBBubbleViewAccessibility *)&v3 accessibilityTraits];
}

@end