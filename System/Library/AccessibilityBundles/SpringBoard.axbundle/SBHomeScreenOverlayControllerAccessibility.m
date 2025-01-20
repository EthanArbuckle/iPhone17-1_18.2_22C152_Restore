@interface SBHomeScreenOverlayControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (void)setPresentationProgress:(double)a3 fromLeading:(BOOL)a4 interactive:(BOOL)a5 animated:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation SBHomeScreenOverlayControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHomeScreenOverlayController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHomeScreenOverlayController", @"overlayViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHomeScreenOverlayController", @"presentationProgress", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHomeScreenOverlayController", @"setPresentationProgress:fromLeading:interactive:animated:completionHandler:", "v", "d", "B", "B", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHomeScreenOverlayController", @"dismissAnimated:completionHandler:", "v", "B", "@?", 0);
}

- (void)setPresentationProgress:(double)a3 fromLeading:(BOOL)a4 interactive:(BOOL)a5 animated:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a7;
  [(SBHomeScreenOverlayControllerAccessibility *)self safeCGFloatForKey:@"presentationProgress"];
  double v14 = v13;
  v19.receiver = self;
  v19.super_class = (Class)SBHomeScreenOverlayControllerAccessibility;
  [(SBHomeScreenOverlayControllerAccessibility *)&v19 setPresentationProgress:v9 fromLeading:v8 interactive:v7 animated:v12 completionHandler:a3];
  if (v14 != a3) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  }
  v15 = [(SBHomeScreenOverlayControllerAccessibility *)self safeValueForKey:@"window"];
  [v15 setAccessibilityViewIsModal:1];

  objc_opt_class();
  v16 = [(SBHomeScreenOverlayControllerAccessibility *)self safeValueForKey:@"overlayViewController"];
  v17 = __UIAccessibilityCastAsClass();

  v18 = [v17 view];
  [v18 setAccessibilityViewIsModal:1];
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

uint64_t __72__SBHomeScreenOverlayControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissAnimated:1 completionHandler:0];
}

@end