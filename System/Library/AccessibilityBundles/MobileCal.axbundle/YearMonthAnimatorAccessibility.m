@interface YearMonthAnimatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation YearMonthAnimatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"YearMonthAnimator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"YearMonthAnimator", @"animateTransition:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"YearMonthAnimator", @"transitionDuration:", "d", "@", 0);
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)YearMonthAnimatorAccessibility;
  [(YearMonthAnimatorAccessibility *)&v6 animateTransition:v4];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = 0;
  AXPerformSafeBlock();
  _Block_object_dispose(v5, 8);
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __52__YearMonthAnimatorAccessibility_animateTransition___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) transitionDuration:0];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

void __52__YearMonthAnimatorAccessibility_animateTransition___block_invoke_2()
{
}

@end