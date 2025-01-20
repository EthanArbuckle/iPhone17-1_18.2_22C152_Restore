@interface SFPrivacyReportBannerCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (SFPrivacyReportBannerCellAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axMarkupTrackerLabel;
@end

@implementation SFPrivacyReportBannerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFPrivacyReportBannerCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFInteractiveBannerCell", @"leadingLabel", "@", 0);
  [v3 validateClass:@"SFPrivacyReportBannerCell" isKindOfClass:@"SFInteractiveBannerCell"];
  [v3 validateClass:@"SFPrivacyReportBannerCell" hasInstanceVariable:@"_numberOfTrackers" withType:"q"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFPrivacyReportBannerCell", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)SFPrivacyReportBannerCellAccessibility;
  [(SFPrivacyReportBannerCellAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(SFPrivacyReportBannerCellAccessibility *)self _axMarkupTrackerLabel];
}

- (BOOL)isAccessibilityElement
{
  if (AXRequestingClient() == 4) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SFPrivacyReportBannerCellAccessibility;
  return [(SFPrivacyReportBannerCellAccessibility *)&v4 isAccessibilityElement];
}

- (SFPrivacyReportBannerCellAccessibility)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFPrivacyReportBannerCellAccessibility;
  objc_super v3 = -[SFPrivacyReportBannerCellAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = v3;
  if (v3) {
    [(SFPrivacyReportBannerCellAccessibility *)v3 _axMarkupTrackerLabel];
  }

  return v4;
}

- (void)_axMarkupTrackerLabel
{
  objc_initWeak(&location, self);
  objc_super v3 = [(SFPrivacyReportBannerCellAccessibility *)self safeValueForKey:@"leadingLabel"];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__SFPrivacyReportBannerCellAccessibility__axMarkupTrackerLabel__block_invoke;
  v4[3] = &unk_265135F40;
  objc_copyWeak(&v5, &location);
  [v3 _setAccessibilityLabelBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

__CFString *__63__SFPrivacyReportBannerCellAccessibility__axMarkupTrackerLabel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained safeIntegerForKey:@"_numberOfTrackers"];

  if (v2 < 0)
  {
    id v5 = &stru_26F71AB80;
  }
  else
  {
    objc_super v3 = NSString;
    objc_super v4 = accessibilityMobileSafariLocalizedString(@"number.of.trackers.blocked");
    objc_msgSend(v3, "localizedStringWithFormat:", v4, v2);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end