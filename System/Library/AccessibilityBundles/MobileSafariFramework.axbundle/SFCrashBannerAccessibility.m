@interface SFCrashBannerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOnlyComparesByXAxis;
- (BOOL)shouldGroupAccessibilityChildren;
- (SFCrashBannerAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SFCrashBannerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFCrashBanner";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFCrashBanner" hasInstanceVariable:@"_closeButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFCrashBanner", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)SFCrashBannerAccessibility;
  [(SFCrashBannerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SFCrashBannerAccessibility *)self safeValueForKey:@"_closeButton"];
  v4 = accessibilitySafariServicesLocalizedString(@"close.crash.banner.button");
  [v3 setAccessibilityLabel:v4];
}

- (SFCrashBannerAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFCrashBannerAccessibility;
  id v3 = -[SFCrashBannerAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SFCrashBannerAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end