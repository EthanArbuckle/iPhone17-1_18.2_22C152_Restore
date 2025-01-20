@interface UpsellBannerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UpsellBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.UpsellBannerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.UpsellBannerView", @"showsAppleMusicLogo", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.UpsellBannerView", @"regularText", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  int v3 = [(UpsellBannerViewAccessibility *)self safeBoolForKey:@"showsAppleMusicLogo"];
  objc_opt_class();
  v4 = [(UpsellBannerViewAccessibility *)self safeValueForKey:@"regularText"];
  v5 = __UIAccessibilityCastAsClass();

  if (v3)
  {
    v6 = accessibilityMusicLocalizedString(@"apple.music");
    __UIAXStringForVariables();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

@end