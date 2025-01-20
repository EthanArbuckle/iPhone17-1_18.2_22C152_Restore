@interface SBTransientOverlayWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsInWidgetStack;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityViewIsModal;
- (id)_axAdditionalElements;
- (id)_axRemoteContentViewController;
- (id)_axRemoteServiceBundleIdentifier;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SBTransientOverlayWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBTransientOverlayWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBRemoteTransientOverlayHostContentAdapter", @"_performButtonEvents:", "B", "Q", 0);
  [v3 validateClass:@"SBRemoteTransientOverlayHostContentAdapter" hasInstanceVariable:@"_hostRemoteViewController" withType:"SBRemoteTransientOverlayHostViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIRemoteViewController", @"serviceBundleIdentifier", "@", 0);
  [v3 validateClass:@"SBTransientOverlayWindow" isKindOfClass:@"UIWindow"];
  [v3 validateClass:@"SBRemoteTransientOverlayViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"SBRemoteTransientOverlayHostViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"SBRemoteTransientOverlayViewController" hasInstanceVariable:@"_hostContentAdapter" withType:"SBRemoteTransientOverlayHostContentAdapter"];
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)SBTransientOverlayWindowAccessibility;
  [(SBTransientOverlayWindowAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SBTransientOverlayWindowAccessibility *)self _axRemoteServiceBundleIdentifier];
  int v4 = [v3 isEqualToString:@"com.apple.shortcuts.runtime"];

  if (v4)
  {
    v5 = [(SBTransientOverlayWindowAccessibility *)self _axAdditionalElements];
    [(SBTransientOverlayWindowAccessibility *)self _accessibilitySetAdditionalElements:v5];
  }
}

- (BOOL)accessibilityPerformEscape
{
  v2 = [(SBTransientOverlayWindowAccessibility *)self _axRemoteServiceBundleIdentifier];
  int v3 = [v2 isEqualToString:@"com.apple.shortcuts.runtime"];

  if (v3) {
    AXPerformSafeBlock();
  }
  return v3;
}

void __67__SBTransientOverlayWindowAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _axRemoteContentViewController];
  [v1 _performButtonEvents:16];
}

- (id)_axAdditionalElements
{
  int v3 = [MEMORY[0x263EFF980] array];
  int v4 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__SBTransientOverlayWindowAccessibility__axAdditionalElements__block_invoke;
  v9[3] = &unk_265154328;
  objc_copyWeak(&v10, &location);
  [v4 _setAccessibilityFrameBlock:v9];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__SBTransientOverlayWindowAccessibility__axAdditionalElements__block_invoke_2;
  v7[3] = &unk_265154270;
  objc_copyWeak(&v8, &location);
  [v4 _setAccessibilityActivateBlock:v7];
  [v4 _accessibilitySetSortPriority:-1];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  v5 = accessibilityLocalizedString(@"springboard.shortcutmenu.dismiss");
  [v4 setAccessibilityLabel:v5];

  [v3 axSafelyAddObject:v4];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v3;
}

double __62__SBTransientOverlayWindowAccessibility__axAdditionalElements__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  [v2 bounds];
  UIAccessibilityFrameForBounds();
  double v4 = v3;

  return v4;
}

uint64_t __62__SBTransientOverlayWindowAccessibility__axAdditionalElements__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained accessibilityPerformEscape];

  return 1;
}

- (id)_axRemoteServiceBundleIdentifier
{
  v2 = [(SBTransientOverlayWindowAccessibility *)self _axRemoteContentViewController];
  double v3 = [v2 safeStringForKey:@"serviceBundleIdentifier"];

  return v3;
}

- (id)_axRemoteContentViewController
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  objc_opt_class();
  double v3 = [v2 safeValueForKey:@"rootViewController"];
  double v4 = __UIAccessibilityCastAsClass();

  NSClassFromString(&cfstr_Sbremotetransi.isa);
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    [v4 safeValueForKeyPath:@"_hostContentAdapter._hostRemoteViewController"];
  }
  else
  {
    objc_opt_class();
    [v4 safeValueForKey:@"_hostRemoteViewController"];
  v5 = };
  objc_super v6 = __UIAccessibilityCastAsClass();

  return v6;
}

- (BOOL)_accessibilityIsInWidgetStack
{
  objc_opt_class();
  double v3 = [(SBTransientOverlayWindowAccessibility *)self safeValueForKey:@"rootViewController"];
  double v4 = __UIAccessibilityCastAsClass();

  NSClassFromString(&cfstr_Sbambienttrans.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end