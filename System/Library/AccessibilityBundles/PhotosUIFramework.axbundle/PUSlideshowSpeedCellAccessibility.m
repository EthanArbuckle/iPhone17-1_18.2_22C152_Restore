@interface PUSlideshowSpeedCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (PUSlideshowSpeedCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PUSlideshowSpeedCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUSlideshowSpeedCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PUSlideshowSpeedCell" hasInstanceVariable:@"_slider" withType:"UISlider"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUSlideshowSpeedCell", @"initWithStyle: reuseIdentifier:", "q", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)PUSlideshowSpeedCellAccessibility;
  [(PUSlideshowSpeedCellAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PUSlideshowSpeedCellAccessibility *)self safeValueForKey:@"_slider"];
  v4 = accessibilityPULocalizedString(@"slideshow.speed.label");
  [v3 setAccessibilityLabel:v4];
}

- (PUSlideshowSpeedCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PUSlideshowSpeedCellAccessibility;
  v4 = [(PUSlideshowSpeedCellAccessibility *)&v6 initWithStyle:a3 reuseIdentifier:a4];
  [(PUSlideshowSpeedCellAccessibility *)v4 _accessibilityLoadAccessibilityInformation];

  return v4;
}

@end