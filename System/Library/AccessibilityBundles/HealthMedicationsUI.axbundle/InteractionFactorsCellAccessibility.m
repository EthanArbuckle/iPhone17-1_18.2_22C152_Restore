@interface InteractionFactorsCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
@end

@implementation InteractionFactorsCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthMedicationsUI.InteractionFactorsCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  v3 = [(InteractionFactorsCellAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_1];
  v4 = [v3 firstObject];
  v5 = v4;
  if (v4)
  {
    [v4 accessibilityActivationPoint];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)InteractionFactorsCellAccessibility;
    [(InteractionFactorsCellAccessibility *)&v12 accessibilityActivationPoint];
  }
  double v8 = v6;
  double v9 = v7;

  double v10 = v8;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

uint64_t __67__InteractionFactorsCellAccessibility_accessibilityActivationPoint__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end