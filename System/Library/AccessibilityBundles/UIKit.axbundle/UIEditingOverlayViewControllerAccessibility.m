@interface UIEditingOverlayViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
@end

@implementation UIEditingOverlayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIEditingOverlayViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIEditingOverlayViewController", @"undoInteraction", "@", 0);
  v4 = "B";
  v3 = @"UIUndoGestureInteraction";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"currentInteractiveHUDVisible", v4, 0);
  objc_storeStrong(v6, obj);
}

- (BOOL)accessibilityPerformEscape
{
  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = (id)[(UIEditingOverlayViewControllerAccessibility *)self safeValueForKey:@"undoInteraction"];
  char v5 = [v6[0] safeBoolForKey:@"currentInteractiveHUDVisible"] & 1;
  if (v5)
  {
    id v4 = v6[0];
    AXPerformSafeBlock();
    objc_storeStrong(&v4, 0);
  }
  char v3 = v5;
  objc_storeStrong(v6, 0);
  return v3 & 1;
}

uint64_t __73__UIEditingOverlayViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUndoInteractiveHUDVisibility:", 0, a1, a1);
}

@end