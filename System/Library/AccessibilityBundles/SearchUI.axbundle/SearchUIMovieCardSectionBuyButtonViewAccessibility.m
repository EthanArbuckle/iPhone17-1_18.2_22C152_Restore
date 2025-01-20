@interface SearchUIMovieCardSectionBuyButtonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SearchUIMovieCardSectionBuyButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUIMovieCardSectionBuyButtonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIMovieCardSectionBuyButtonView", @"subtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIMovieCardSectionBuyButtonView", @"button", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKStoreButton", @"title", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(SearchUIMovieCardSectionBuyButtonViewAccessibility *)self safeValueForKey:@"subtitleLabel"];
  v4 = [(SearchUIMovieCardSectionBuyButtonViewAccessibility *)self safeValueForKey:@"button"];
  v5 = [v4 safeValueForKey:@"title"];
  v8 = [v3 accessibilityLabel];
  v6 = __AXStringForVariables();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end