@interface SBStarkIconWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (CGPoint)accessibilityActivationPoint;
@end

@implementation SBStarkIconWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBStarkIconWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(SBStarkIconWindowAccessibility *)self _accessibilityFindDescendant:&__block_literal_global_12];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

uint64_t __62__SBStarkIconWindowAccessibility_accessibilityActivationPoint__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAccessibilityElement];
}

@end