@interface SUUIOnboardingCircleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOverridesInvalidFrames;
- (BOOL)_accessibilityRemoveCircle;
- (BOOL)_accessibilityScrollToVisible;
- (BOOL)accessibilityActivate;
- (double)_accessibilityDelayBeforeUpdatingOnActivation;
- (id)_accessibilityPhysicalCirclesViewSuperview;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityActivateCircle;
@end

@implementation SUUIOnboardingCircleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIOnboardingCircleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SUUIOnboardingCircleView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIOnboardingCircleView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPhysicsBody", @"applyForce:", "v", "{CGPoint=dd}", 0);
  [v3 validateClass:@"SUUIPhysicalCirclesView"];
}

- (id)accessibilityPath
{
  [(SUUIOnboardingCircleViewAccessibility *)self accessibilityFrame];
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  v6 = (void *)MEMORY[0x263F1C478];
  double MidX = CGRectGetMidX(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double v9 = CGRectGetWidth(v14) * 0.5;

  return (id)objc_msgSend(v6, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v9, 0.0, 6.28318531);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)_accessibilityScrollToVisible
{
  char v17 = 0;
  id v3 = [(SUUIOnboardingCircleViewAccessibility *)self superview];
  v4 = __UIAccessibilitySafeClass();

  [(SUUIOnboardingCircleViewAccessibility *)self frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 bounds];
  v19.origin.CGFloat x = v6;
  v19.origin.CGFloat y = v8;
  v19.size.CGFloat width = v10;
  v19.size.CGFloat height = v12;
  BOOL v13 = CGRectContainsRect(v18, v19);
  if (!v13)
  {
    CGRect v14 = [v4 safeValueForKey:@"_accessibilityCircleBodies"];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __70__SUUIOnboardingCircleViewAccessibility__accessibilityScrollToVisible__block_invoke;
    v16[3] = &__block_descriptor_64_e15_v32__0_8Q16_B24l;
    *(CGFloat *)&v16[4] = v6;
    *(CGFloat *)&v16[5] = v8;
    *(CGFloat *)&v16[6] = v10;
    *(CGFloat *)&v16[7] = v12;
    [v14 enumerateObjectsUsingBlock:v16];
  }
  return !v13;
}

void __70__SUUIOnboardingCircleViewAccessibility__accessibilityScrollToVisible__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  AXPerformSafeBlock();
}

uint64_t __70__SUUIOnboardingCircleViewAccessibility__accessibilityScrollToVisible__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyForce:", dbl_2423395B0[*(double *)(a1 + 40) < 0.0], *(double *)(MEMORY[0x263F00148] + 8));
}

- (id)accessibilityLabel
{
  id v2 = [(SUUIOnboardingCircleViewAccessibility *)self safeValueForKey:@"titleLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityCustomActions
{
  id v3 = objc_alloc(MEMORY[0x263F1C390]);
  v4 = accessibilityLocalizedString(@"remove.circle.action");
  double v5 = (void *)[v3 initWithName:v4 target:self selector:sel__accessibilityRemoveCircle];

  [v5 setSortPriority:*MEMORY[0x263F81158]];
  CGFloat v6 = [MEMORY[0x263EFF8C0] arrayWithObject:v5];

  return v6;
}

- (id)accessibilityValue
{
  id v3 = [(SUUIOnboardingCircleViewAccessibility *)self _accessibilityPhysicalCirclesViewSuperview];
  v4 = [v3 _accessibilityValueForCircle:self];

  return v4;
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  return 1;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"circle.hint");
}

- (double)_accessibilityDelayBeforeUpdatingOnActivation
{
  return 0.5;
}

- (BOOL)_accessibilityRemoveCircle
{
  id v3 = [(SUUIOnboardingCircleViewAccessibility *)self _accessibilityPhysicalCirclesViewSuperview];
  [v3 _accessibilityDeleteCircle:self];

  return 1;
}

- (void)_accessibilityActivateCircle
{
  id v3 = [(SUUIOnboardingCircleViewAccessibility *)self _accessibilityPhysicalCirclesViewSuperview];
  [v3 _accessibilityActivateCircle:self];
}

- (id)_accessibilityPhysicalCirclesViewSuperview
{
  objc_opt_class();
  id v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 superview];
  v4 = __UIAccessibilitySafeClass();

  return v4;
}

@end