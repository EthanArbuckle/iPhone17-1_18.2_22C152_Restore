@interface PXPeopleCandidateBannerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PXPeopleCandidateBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXPeopleCandidateBannerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PXPeopleCandidateBannerViewAccessibility;
  [(PXPeopleCandidateBannerViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(PXPeopleCandidateBannerViewAccessibility *)self safeUIViewForKey:@"_notNowButton"];
  v4 = accessibilityPhotosUICoreLocalizedString(@"review.later.button.label");
  [v3 setAccessibilityLabel:v4];
}

@end