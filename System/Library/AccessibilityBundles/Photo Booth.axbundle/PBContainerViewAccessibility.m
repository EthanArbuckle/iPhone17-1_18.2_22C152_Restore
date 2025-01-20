@interface PBContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PBContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PBContainerViewAccessibility;
  -[PBContainerViewAccessibility _accessibilityHitTest:withEvent:](&v9, sel__accessibilityHitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (PBContainerViewAccessibility *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    v5 = 0;
  }
  v7 = v5;

  return v7;
}

- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown
{
  return 1;
}

@end