@interface SUUIBannerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
- (id)accessibilityElements;
- (id)accessibilityLabel;
@end

@implementation SUUIBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIBannerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIBannerView", @"itemOffer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIBannerView", @"closeButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIBannerView", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIBannerView", @"artistName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIBannerView", @"userRating", "f", 0);
  [v3 validateClass:@"SUUIBannerView" hasInstanceVariable:@"_itemStateLabel" withType:"UILabel"];
  [v3 validateClass:@"SUUIBannerView" hasInstanceVariable:@"_itemOfferButton" withType:"UIButton"];
}

- (id)accessibilityLabel
{
  id v3 = [(SUUIBannerViewAccessibility *)self safeValueForKey:@"title"];
  v4 = [(SUUIBannerViewAccessibility *)self safeValueForKey:@"artistName"];
  v5 = [(SUUIBannerViewAccessibility *)self safeValueForKey:@"_userRatingStarImageView"];
  v6 = [v5 accessibilityLabel];
  v7 = [(SUUIBannerViewAccessibility *)self safeValueForKey:@"_itemStateLabel"];
  v10 = [v7 accessibilityLabel];
  v8 = __UIAXStringForVariables();

  return v8;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (id)accessibilityElements
{
  id v3 = (void *)MEMORY[0x263F81490];
  v4 = [(SUUIBannerViewAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (!v4)
  {
    v4 = [MEMORY[0x263EFF980] array];
    [(SUUIBannerViewAccessibility *)self _accessibilitySetRetainedValue:v4 forKey:*v3];
    v5 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
    [v5 setAccessibilityDelegate:self];
    [v4 addObject:v5];
  }
  v6 = (void *)[v4 mutableCopy];
  v7 = [(SUUIBannerViewAccessibility *)self safeValueForKey:@"closeButton"];
  if (v7)
  {
    v8 = accessibilityLocalizedString(@"close.button.for.website.app.download");
    [v7 setAccessibilityLabel:v8];

    [v6 insertObject:v7 atIndex:0];
  }
  v9 = [(SUUIBannerViewAccessibility *)self safeValueForKey:@"_itemOfferButton"];
  [v6 axSafelyAddObject:v9];

  return v6;
}

@end