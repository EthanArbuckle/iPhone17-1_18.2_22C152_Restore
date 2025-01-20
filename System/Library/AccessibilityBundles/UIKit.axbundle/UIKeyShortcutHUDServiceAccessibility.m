@interface UIKeyShortcutHUDServiceAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_requestHUDDismissal;
- (void)handleKeyboardEvent:(id)a3;
@end

@implementation UIKeyShortcutHUDServiceAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyShortcutHUDService";
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
  v3 = @"UIKeyShortcutHUDService";
  v4 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"handleKeyboardEvent:", v4, "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"cancelScheduledHUDPresentationIfNeeded", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIPhysicalKeyboardEvent", @"modifierFlags", "q", 0);
  objc_storeStrong(v6, obj);
}

- (void)_requestHUDDismissal
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyShortcutHUDServiceAccessibility;
  [(UIKeyShortcutHUDServiceAccessibility *)&v2 _requestHUDDismissal];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

- (void)handleKeyboardEvent:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7.receiver = v9;
  v7.super_class = (Class)UIKeyShortcutHUDServiceAccessibility;
  [(UIKeyShortcutHUDServiceAccessibility *)&v7 handleKeyboardEvent:location[0]];
  uint64_t v6 = [location[0] safeIntegerForKey:@"modifierFlags"];
  BOOL v5 = 0;
  BOOL v3 = 1;
  if ((v6 & 0x40000) == 0) {
    BOOL v3 = (v6 & 0x80000) != 0;
  }
  BOOL v5 = v3;
  if (UIAccessibilityIsVoiceOverRunning() || (_UIAccessibilityFullKeyboardAccessEnabled()) && v5)
  {
    v4 = v9;
    AXPerformSafeBlock();
    objc_storeStrong((id *)&v4, 0);
  }
  objc_storeStrong(location, 0);
}

uint64_t __60__UIKeyShortcutHUDServiceAccessibility_handleKeyboardEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelScheduledHUDPresentationIfNeeded", a1, a1);
}

@end