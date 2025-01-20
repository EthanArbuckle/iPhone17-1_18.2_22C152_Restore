@interface TransitDirectionsInstructionsCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation TransitDirectionsInstructionsCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TransitDirectionsInstructionsCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TransitDirectionsInstructionsCell" isKindOfClass:@"TransitDirectionsCell"];
  [v3 validateClass:@"TransitDirectionsCell" hasInstanceVariable:@"_stepView" withType:"TransitDirectionsStepView"];
}

- (id)accessibilityElements
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [(TransitDirectionsInstructionsCellAccessibility *)self safeValueForKey:@"_stepView"];
  id v3 = v2;
  if (v2 && [v2 isAccessibilityElement])
  {
    v6[0] = v3;
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  }
  else
  {
    v4 = (void *)MEMORY[0x263EFFA68];
  }

  return v4;
}

@end