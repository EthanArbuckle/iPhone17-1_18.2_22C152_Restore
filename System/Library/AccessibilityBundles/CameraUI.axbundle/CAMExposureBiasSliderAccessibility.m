@interface CAMExposureBiasSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityValue;
- (void)setExposureBiasValue:(float)a3;
@end

@implementation CAMExposureBiasSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMExposureBiasSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMExposureBiasSlider", @"setExposureBiasValue:", "v", "f", 0);
  [v3 validateClass:@"CAMExposureBiasSlider" hasInstanceVariable:@"_exposureBiasValue" withType:"f"];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityValue
{
  [(CAMExposureBiasSliderAccessibility *)self safeFloatForKey:@"_exposureBiasValue"];
  float v3 = v2;
  v4 = NSString;
  v5 = accessibilityCameraUILocalizedString(@"exposure.unit");
  v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v3);

  return v6;
}

- (void)setExposureBiasValue:(float)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMExposureBiasSliderAccessibility;
  -[CAMExposureBiasSliderAccessibility setExposureBiasValue:](&v6, sel_setExposureBiasValue_);
  if (CFAbsoluteTimeGetCurrent() - *(double *)&AXExposureAnnouncementTime > 1.0)
  {
    UIAccessibilityNotifications v4 = *MEMORY[0x263F1CDC8];
    v5 = [(CAMExposureBiasSliderAccessibility *)self accessibilityValue];
    UIAccessibilityPostNotification(v4, v5);

    AXExposureAnnouncementTime = CFAbsoluteTimeGetCurrent();
  }
}

@end