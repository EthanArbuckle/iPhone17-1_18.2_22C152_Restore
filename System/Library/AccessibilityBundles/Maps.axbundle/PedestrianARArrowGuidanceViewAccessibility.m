@interface PedestrianARArrowGuidanceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PedestrianARArrowGuidanceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PedestrianARArrowGuidanceView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PedestrianARArrowGuidanceView" hasInstanceVariable:@"_instructionLabel" withType:"UILabel"];
  [v3 validateClass:@"PedestrianARArrowGuidanceView" hasInstanceVariable:@"_dynamicArrowImageView" withType:"UIImageView"];
  [v3 validateClass:@"PedestrianARArrowGuidanceView" hasInstanceVariable:@"_dynamicArrowAngle" withType:"d"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PedestrianARArrowGuidanceViewAccessibility;
  return *MEMORY[0x263F1CF68] | [(PedestrianARArrowGuidanceViewAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityValue
{
  objc_super v3 = [(PedestrianARArrowGuidanceViewAccessibility *)self safeUIViewForKey:@"_dynamicArrowImageView"];
  char v4 = [v3 isHidden];

  if (v4)
  {
    v5 = &stru_26F6E7138;
  }
  else
  {
    [(PedestrianARArrowGuidanceViewAccessibility *)self safeDoubleForKey:@"_dynamicArrowAngle"];
    if (v6 >= 180.0) {
      v7 = @"LEFT";
    }
    else {
      v7 = @"RIGHT";
    }
    AXMapsLocString(v7);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)accessibilityLabel
{
  objc_super v3 = [(PedestrianARArrowGuidanceViewAccessibility *)self safeUIViewForKey:@"_dynamicArrowImageView"];
  char v4 = [v3 isHidden];

  if (v4)
  {
    v5 = &stru_26F6E7138;
  }
  else
  {
    double v6 = [(PedestrianARArrowGuidanceViewAccessibility *)self safeUIViewForKey:@"_instructionLabel"];
    v5 = [v6 accessibilityLabel];
  }

  return v5;
}

@end