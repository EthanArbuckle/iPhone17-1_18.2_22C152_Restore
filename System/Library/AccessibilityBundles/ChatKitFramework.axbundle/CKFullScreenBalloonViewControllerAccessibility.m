@interface CKFullScreenBalloonViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
@end

@implementation CKFullScreenBalloonViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKFullScreenBalloonViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)accessibilityPerformEscape
{
  v2 = [(CKFullScreenBalloonViewControllerAccessibility *)self safeValueForKey:@"delegate"];
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v5 = v2;
    AXPerformSafeBlock();
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);

    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

uint64_t __76__CKFullScreenBalloonViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fullScreenBalloonViewControllerHandleDismissTap:*(void *)(a1 + 40)];
}

@end