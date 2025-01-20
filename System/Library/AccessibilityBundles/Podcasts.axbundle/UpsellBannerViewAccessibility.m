@interface UpsellBannerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UpsellBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.UpsellBannerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ShelfKitCollectionViews.UpsellBannerView" hasSwiftField:@"subscriptionNameAreaView" withSwiftType:"SubscriptionNameAreaView"];
  [v3 validateClass:@"ShelfKitCollectionViews.SubscriptionNameAreaView" hasSwiftField:@"model" withSwiftType:"Optional<UpsellBanner>"];
  [v3 validateClass:@"ShelfKit.UpsellBanner" hasSwiftField:@"subscriptionTitle" withSwiftType:"Optional<String>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.SubscriptionNameAreaView", @"accessibilityChannelLinkButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.ChevronButton", @"accessibilityTitleLabel", "@", 0);
  [v3 validateClass:@"ShelfKitCollectionViews.UpsellBannerView" hasSwiftField:@"shortTitleLabel" withSwiftType:"DynamicTypeLabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.UpsellBannerView", @"accessibilitySubtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.UpsellBannerView", @"accessibilityBenefitButton", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(UpsellBannerViewAccessibility *)self safeSwiftValueForKey:@"subscriptionNameAreaView"];
  v4 = [v3 safeSwiftValueForKey:@"model"];
  v5 = [v4 safeSwiftStringForKey:@"subscriptionTitle"];
  v6 = [v3 safeValueForKey:@"accessibilityChannelLinkButton"];
  v7 = [v6 safeStringForKey:@"accessibilityTitleLabel"];
  objc_opt_class();
  v8 = [(UpsellBannerViewAccessibility *)self safeSwiftValueForKey:@"shortTitleLabel"];
  v9 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v10 = [(UpsellBannerViewAccessibility *)self safeValueForKey:@"accessibilitySubtitleLabel"];
  v11 = __UIAccessibilityCastAsClass();

  v12 = [v9 text];
  v15 = [v11 text];
  v13 = __UIAXStringForVariables();

  return v13;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)UpsellBannerViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(UpsellBannerViewAccessibility *)&v3 accessibilityTraits];
}

- (id)_accessibilitySupplementaryFooterViews
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  v4 = [(UpsellBannerViewAccessibility *)self safeValueForKey:@"accessibilityBenefitButton"];
  [v3 axSafelyAddObject:v4];

  return v3;
}

@end