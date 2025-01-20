@interface HostViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HostViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExperienceUI.HostViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGPoint)accessibilityActivationPoint
{
  v3 = [(HostViewCellAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_6];
  v4 = [v3 firstObject];
  v5 = v4;
  if (v4)
  {
    [v4 accessibilityActivationPoint];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HostViewCellAccessibility;
    [(HostViewCellAccessibility *)&v12 accessibilityActivationPoint];
  }
  double v8 = v6;
  double v9 = v7;

  double v10 = v8;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

uint64_t __57__HostViewCellAccessibility_accessibilityActivationPoint__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)MEMORY[0x270F80938](self, a2);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)HostViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(HostViewCellAccessibility *)&v3 accessibilityTraits];
}

@end