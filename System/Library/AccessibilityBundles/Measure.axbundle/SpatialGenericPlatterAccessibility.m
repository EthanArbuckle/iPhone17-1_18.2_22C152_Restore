@interface SpatialGenericPlatterAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
@end

@implementation SpatialGenericPlatterAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Measure.SpatialGenericPlatter";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)accessibilityPerformEscape
{
  AXPerformSafeBlock();
  v2 = accessibilityLocalizedString(@"MEASUREMENT_DISMISSED");
  AXMeasureSpeakMeasurementAnnouncement(v2);

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  return 1;
}

uint64_t __64__SpatialGenericPlatterAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) closePlatter];
}

@end