@interface SUUIPhysicalCirclesViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityUsesChildrenFramesForSorting;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (CGPoint)_accessibilityForceTranslationForScrollDirection:(int64_t)a3;
- (id)_accessibilityCircleBodies;
- (id)_accessibilityPushingScrollStatusInDirection:(int64_t)a3;
- (id)_accessibilityValueForAffinityCount:(int64_t)a3;
- (id)_accessibilityValueForCircle:(id)a3;
- (id)accessibilityElementAtIndex:(int64_t)a3;
- (int64_t)_accessibilityIndexOfCircle:(id)a3;
- (int64_t)accessibilityElementCount;
- (void)_accessibilityActivateCircle:(id)a3;
- (void)_accessibilityDeleteCircle:(id)a3;
- (void)_reloadDidFinish;
- (void)removeCircleAtIndex:(int64_t)a3 animated:(BOOL)a4 completionBlock:(id)a5;
@end

@implementation SUUIPhysicalCirclesViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIPhysicalCirclesView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SUUIPhysicalCirclesView" hasInstanceVariable:@"_circleBodies" withType:"NSMutableArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIPhysicalCirclesView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIPhysicalCirclesView", @"removeCircleAtIndex: animated: completionBlock:", "v", "q", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIPhysicalCirclesView", @"_reloadDidFinish", "v", 0);
  [v3 validateProtocol:@"SUUIPhysicalCirclesDelegate" hasOptionalInstanceMethod:@"circleView:didTapCircleAtIndex:"];
  [v3 validateClass:@"PKPhysicsBody"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPhysicsBody", @"representedObject", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKPhysicsBody", @"applyForce:", "v", "{CGPoint=dd}", 0);
  [v3 validateClass:@"SUUIOnboardingAffiliationCirclesViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIOnboardingAffiliationCirclesViewController", @"_completeDeletionForCircleAtIndex:", "v", "q", 0);
  [v3 validateClass:@"SUUIOnboardingAffiliationCirclesViewController" hasInstanceVariable:@"_affiliationItems" withType:"NSMutableArray"];
  [v3 validateClass:@"SUUIOnboardingAffiliationItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIOnboardingAffiliationItem", @"userAffinityCount", "q", 0);
}

- (void)_accessibilityDeleteCircle:(id)a3
{
  id v3 = a3;
  AXPerformSafeBlock();
  if (v3)
  {
    v4 = NSString;
    v5 = accessibilityLocalizedString(@"removed.genre.circle");
    v6 = [v3 accessibilityLabel];
    v7 = objc_msgSend(v4, "stringWithFormat:", v5, v6);

    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v7);
  }
}

void __67__SUUIPhysicalCirclesViewAccessibility__accessibilityDeleteCircle___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"delegate"];
  objc_msgSend(v2, "_completeDeletionForCircleAtIndex:", objc_msgSend(*(id *)(a1 + 32), "_accessibilityIndexOfCircle:", *(void *)(a1 + 40)));
}

- (void)_accessibilityActivateCircle:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

void __69__SUUIPhysicalCirclesViewAccessibility__accessibilityActivateCircle___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"delegate"];
  objc_msgSend(v2, "circleView:didTapCircleAtIndex:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "_accessibilityIndexOfCircle:", *(void *)(a1 + 40)));
}

- (id)_accessibilityValueForCircle:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIPhysicalCirclesViewAccessibility *)self safeValueForKey:@"delegate"];
  v6 = [v5 safeValueForKey:@"_affiliationItems"];
  v7 = __UIAccessibilitySafeClass();

  v8 = objc_msgSend(v7, "objectAtIndex:", -[SUUIPhysicalCirclesViewAccessibility _accessibilityIndexOfCircle:](self, "_accessibilityIndexOfCircle:", v4));
  uint64_t v9 = [v8 safeIntegerForKey:@"userAffinityCount"];

  v10 = [(SUUIPhysicalCirclesViewAccessibility *)self _accessibilityValueForAffinityCount:v9];

  return v10;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  id v4 = [(SUUIPhysicalCirclesViewAccessibility *)self _accessibilityCircleBodies];
  v5 = [v4 objectAtIndex:a3];
  v6 = [v5 safeValueForKey:@"representedObject"];

  return v6;
}

- (int64_t)accessibilityElementCount
{
  id v2 = [(SUUIPhysicalCirclesViewAccessibility *)self _accessibilityCircleBodies];
  int64_t v3 = [v2 count];

  return v3;
}

- (BOOL)_accessibilityUsesChildrenFramesForSorting
{
  return 1;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  -[SUUIPhysicalCirclesViewAccessibility _accessibilityForceTranslationForScrollDirection:](self, "_accessibilityForceTranslationForScrollDirection:");
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = [(SUUIPhysicalCirclesViewAccessibility *)self _accessibilityCircleBodies];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__SUUIPhysicalCirclesViewAccessibility_accessibilityScroll___block_invoke;
  v12[3] = &__block_descriptor_48_e15_v32__0_8Q16_B24l;
  v12[4] = v6;
  v12[5] = v8;
  [v9 enumerateObjectsUsingBlock:v12];

  LODWORD(v9) = *MEMORY[0x263F1CE30];
  v10 = [(SUUIPhysicalCirclesViewAccessibility *)self _accessibilityPushingScrollStatusInDirection:a3];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v9, v10);

  return 1;
}

void __60__SUUIPhysicalCirclesViewAccessibility_accessibilityScroll___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  AXPerformSafeBlock();
}

uint64_t __60__SUUIPhysicalCirclesViewAccessibility_accessibilityScroll___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyForce:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (id)_accessibilityPushingScrollStatusInDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = accessibilityLocalizedString(off_265138680[a3 - 1]);
  }
  return v4;
}

- (void)removeCircleAtIndex:(int64_t)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v9 = [(SUUIPhysicalCirclesViewAccessibility *)self accessibilityElementAtIndex:a3];
  v10 = NSString;
  v11 = accessibilityLocalizedString(@"removed.genre.circle");
  v12 = [v9 accessibilityLabel];
  v13 = objc_msgSend(v10, "stringWithFormat:", v11, v12);

  v14.receiver = self;
  v14.super_class = (Class)SUUIPhysicalCirclesViewAccessibility;
  [(SUUIPhysicalCirclesViewAccessibility *)&v14 removeCircleAtIndex:a3 animated:v5 completionBlock:v8];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v13);
}

- (void)_reloadDidFinish
{
  v2.receiver = self;
  v2.super_class = (Class)SUUIPhysicalCirclesViewAccessibility;
  [(SUUIPhysicalCirclesViewAccessibility *)&v2 _reloadDidFinish];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (id)_accessibilityCircleBodies
{
  objc_opt_class();
  uint64_t v3 = [(SUUIPhysicalCirclesViewAccessibility *)self safeValueForKey:@"_circleBodies"];
  id v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (int64_t)_accessibilityIndexOfCircle:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SUUIPhysicalCirclesViewAccessibility *)self _accessibilityCircleBodies];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__SUUIPhysicalCirclesViewAccessibility__accessibilityIndexOfCircle___block_invoke;
  v9[3] = &unk_2651385C8;
  id v10 = v4;
  id v6 = v4;
  int64_t v7 = [v5 indexOfObjectPassingTest:v9];

  return v7;
}

BOOL __68__SUUIPhysicalCirclesViewAccessibility__accessibilityIndexOfCircle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 safeValueForKey:@"representedObject"];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)_accessibilityValueForAffinityCount:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
  {
    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = accessibilityLocalizedString(off_2651386A0[a3]);
  }
  return v4;
}

- (CGPoint)_accessibilityForceTranslationForScrollDirection:(int64_t)a3
{
  double v3 = *MEMORY[0x263F00148];
  double v4 = *(double *)(MEMORY[0x263F00148] + 8);
  switch(a3)
  {
    case 1:
      double v3 = 4400.0;
      break;
    case 2:
      double v3 = -4400.0;
      break;
    case 3:
      double v4 = -4400.0;
      break;
    case 4:
      double v4 = 4400.0;
      break;
    default:
      break;
  }
  result.y = v4;
  result.x = v3;
  return result;
}

@end