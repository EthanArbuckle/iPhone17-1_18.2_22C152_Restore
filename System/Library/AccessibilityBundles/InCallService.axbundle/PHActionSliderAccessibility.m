@interface PHActionSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityScannerShouldUseActivateInPointMode;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityPath;
@end

@implementation PHActionSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHActionSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PHActionSlider" hasInstanceVariable:@"_trackBackgroundView" withType:"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHActionSlider", @"trackText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHActionSlider", @"trackMaskPath", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHActionSlider", @"_slideCompleted:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHActionSlider", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSlidingButton", @"type", "i", 0);
}

- (id)accessibilityPath
{
  id v3 = [(PHActionSliderAccessibility *)self safeValueForKey:@"trackMaskPath"];
  __UIAccessibilitySafeClass();
  v4 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();

  v5 = [(PHActionSliderAccessibility *)self safeUIViewForKey:@"_trackBackgroundView"];
  v6 = UIAccessibilityConvertPathToScreenCoordinates(v4, v5);

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(PHActionSliderAccessibility *)self safeValueForKey:@"trackText"];
  v4 = [(PHActionSliderAccessibility *)self safeValueForKey:@"delegate"];
  if ([v4 safeIntForKey:@"type"] == 8)
  {
    uint64_t v5 = accessibilityLocalizedString(@"slide.to.power.off");

    id v3 = (void *)v5;
  }

  return v3;
}

- (BOOL)accessibilityActivate
{
  return 1;
}

uint64_t __52__PHActionSliderAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _slideCompleted:1];
}

- (BOOL)_accessibilityScannerShouldUseActivateInPointMode
{
  return 1;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

@end