@interface MFMailDropBannerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (MFMailDropBannerViewAccessibility)initWithFrame:(CGRect)a3;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setupDownloadIcon;
@end

@implementation MFMailDropBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFMailDropBannerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMailDropBannerView", @"_setupDownloadIcon", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMailDropBannerView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMailDropBannerView", @"bannerState", "Q", 0);
  [v3 validateClass:@"MFMailDropBannerView" hasInstanceVariable:@"_downloadLabel" withType:"UILabel"];
  [v3 validateClass:@"MFMailDropBannerView" hasInstanceVariable:@"_expirationLabel" withType:"UILabel"];
  [v3 validateClass:@"MFMailDropBannerView" hasInstanceVariable:@"_downloadIcon" withType:"UIButton"];
  [v3 validateClass:@"MFMailDropBannerView" hasInstanceVariable:@"_progressView" withType:"MFProgressView"];
}

- (id)accessibilityLabel
{
  id v3 = [(MFMailDropBannerViewAccessibility *)self safeValueForKey:@"_downloadLabel"];
  v4 = [v3 accessibilityLabel];
  v5 = [(MFMailDropBannerViewAccessibility *)self safeValueForKey:@"_expirationLabel"];
  v8 = [v5 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)_setupDownloadIcon
{
  v3.receiver = self;
  v3.super_class = (Class)MFMailDropBannerViewAccessibility;
  [(MFMailDropBannerViewAccessibility *)&v3 _setupDownloadIcon];
  [(MFMailDropBannerViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)MFMailDropBannerViewAccessibility;
  [(MFMailDropBannerViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(MFMailDropBannerViewAccessibility *)self safeValueForKey:@"_downloadIcon"];
  unint64_t v4 = [(MFMailDropBannerViewAccessibility *)self safeIntegerForKey:@"bannerState"];
  uint64_t v5 = *MEMORY[0x263F1CEE8];
  if (v4 >= 2)
  {
    if (v4 == 2)
    {
      v6 = accessibilityLocalizedString(@"air.drop.downloading");
      v5 |= *MEMORY[0x263F1CF20];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = accessibilityLocalizedString(@"air.drop.download");
  }
  [v3 setAccessibilityLabel:v6];
  [v3 setAccessibilityTraits:v5];
}

- (MFMailDropBannerViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFMailDropBannerViewAccessibility;
  objc_super v3 = -[MFMailDropBannerViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(MFMailDropBannerViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  objc_super v3 = [(MFMailDropBannerViewAccessibility *)self safeValueForKey:@"_downloadIcon"];
  unint64_t v4 = [(MFMailDropBannerViewAccessibility *)self safeValueForKey:@"_progressView"];
  uint64_t v5 = [(MFMailDropBannerViewAccessibility *)self safeIntegerForKey:@"bannerState"];
  v6 = [MEMORY[0x263EFF980] array];
  if ([v3 _accessibilityViewIsVisible] && (unint64_t)(v5 - 1) <= 1) {
    [v6 addObject:v3];
  }
  if ([v4 _accessibilityViewIsVisible]) {
    [v6 addObject:v4];
  }

  return v6;
}

@end