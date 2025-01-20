@interface WFCompactPlatterPresentationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)presentationTransitionDidEnd:(BOOL)a3;
@end

@implementation WFCompactPlatterPresentationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFCompactPlatterPresentationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"WFCompactPlatterPresentationController" hasInstanceVariable:@"_containerView" withType:"UIView"];
  [v3 validateClass:@"WFCompactPlatterView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFCompactPlatterView", @"primaryLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFCompactPlatterPresentationController", @"presentationTransitionDidEnd:", "v", "B", 0);
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(WFCompactPlatterPresentationControllerAccessibility *)self safeValueForKey:@"containerView"];
  v6 = [v5 _accessibilityFindSubviewDescendant:&__block_literal_global_0];

  v7 = [v6 safeValueForKey:@"primaryLabel"];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __84__WFCompactPlatterPresentationControllerAccessibility_presentationTransitionDidEnd___block_invoke_2;
  v13 = &unk_265169900;
  id v14 = v7;
  id v8 = v7;
  AXPerformBlockOnMainThreadAfterDelay();
  v9.receiver = self;
  v9.super_class = (Class)WFCompactPlatterPresentationControllerAccessibility;
  [(WFCompactPlatterPresentationControllerAccessibility *)&v9 presentationTransitionDidEnd:v3];
}

uint64_t __84__WFCompactPlatterPresentationControllerAccessibility_presentationTransitionDidEnd___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Wfcompactplatt_2.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __84__WFCompactPlatterPresentationControllerAccessibility_presentationTransitionDidEnd___block_invoke_2(uint64_t a1)
{
}

@end