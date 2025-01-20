@interface SBUIProudLockIconViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsBuddyRunning;
- (BOOL)_accessibilityIsInSleepState;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)lockViewIsAccessibilityElement;
- (SBUIProudLockIconViewAccessibility)initWithFrame:(CGRect)a3;
- (id)lockViewAccessibilityLabel;
- (unsigned)_accessibilityMediaAnalysisOptions;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setState:(int64_t)a3 animated:(BOOL)a4 updateText:(BOOL)a5 options:(int64_t)a6 completion:(id)a7;
@end

@implementation SBUIProudLockIconViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUIProudLockIconView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIProudLockIconView", @"state", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIProudLockIconView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIProudLockIconView", @"setState:animated:updateText:options:completion:", "v", "q", "B", "B", "q", "@?", 0);
  [v3 validateClass:@"SBUIProudLockIconView" hasInstanceVariable:@"_lockView" withType:"BSUICAPackageView"];
  [v3 validateClass:@"BSUICAPackageView" hasInstanceVariable:@"_stateController" withType:"CAStateController"];
  [v3 validateClass:@"BSUICAPackageView" hasInstanceVariable:@"_rootLayer" withType:"CALayer"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)SBUIProudLockIconViewAccessibility;
  [(SBUIProudLockIconViewAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  char v9 = 0;
  objc_opt_class();
  id v3 = [(SBUIProudLockIconViewAccessibility *)self safeValueForKey:@"_lockView"];
  v4 = __UIAccessibilityCastAsClass();

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__SBUIProudLockIconViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v7[3] = &unk_265159E20;
  objc_copyWeak(&v8, &location);
  [v4 _setIsAccessibilityElementBlock:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __80__SBUIProudLockIconViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v5[3] = &unk_265159D10;
  objc_copyWeak(&v6, &location);
  [v4 _setAccessibilityLabelBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

uint64_t __80__SBUIProudLockIconViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained lockViewIsAccessibilityElement];

  return v2;
}

id __80__SBUIProudLockIconViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained lockViewAccessibilityLabel];

  return v2;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (BOOL)lockViewIsAccessibilityElement
{
  uint64_t v3 = [(SBUIProudLockIconViewAccessibility *)self safeIntegerForKey:@"state"];
  uint64_t v4 = AXRequestingClient();
  BOOL v5 = [(SBUIProudLockIconViewAccessibility *)self _accessibilityIsBuddyRunning];
  if (v3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 4;
  }
  BOOL v7 = v6;
  return !v5 && v7;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

- (id)lockViewAccessibilityLabel
{
  v7.receiver = self;
  v7.super_class = (Class)SBUIProudLockIconViewAccessibility;
  uint64_t v3 = [(SBUIProudLockIconViewAccessibility *)&v7 accessibilityLabel];
  unint64_t v4 = [(SBUIProudLockIconViewAccessibility *)self safeIntegerForKey:@"state"] - 1;
  if (v4 <= 0x12 && ((0x4007Fu >> v4) & 1) != 0)
  {
    uint64_t v5 = accessibilitySBLocalizedString(off_265159E60[v4]);

    uint64_t v3 = (void *)v5;
  }

  return v3;
}

- (BOOL)_accessibilityIsInSleepState
{
  uint64_t v2 = [(SBUIProudLockIconViewAccessibility *)self safeValueForKey:@"_lockView"];
  uint64_t v3 = __UIAccessibilitySafeClass();

  objc_opt_class();
  unint64_t v4 = [v3 safeValueForKey:@"_stateController"];
  uint64_t v5 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  BOOL v6 = [v3 safeValueForKey:@"_rootLayer"];
  objc_super v7 = __UIAccessibilityCastAsClass();

  char v8 = 0;
  if (v7 && v5)
  {
    char v9 = [v5 stateOfLayer:v7];
    v10 = [v9 name];

    char v8 = [v10 isEqualToString:@"Sleep"];
  }

  return v8;
}

- (BOOL)_accessibilityIsBuddyRunning
{
  uint64_t v2 = [MEMORY[0x263F22968] server];
  BOOL v3 = [v2 purpleBuddyPID] != -1;

  return v3;
}

- (SBUIProudLockIconViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBUIProudLockIconViewAccessibility;
  BOOL v3 = -[SBUIProudLockIconViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SBUIProudLockIconViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  return v3;
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4 updateText:(BOOL)a5 options:(int64_t)a6 completion:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a7;
  if ([(SBUIProudLockIconViewAccessibility *)self safeIntegerForKey:@"state"] != a3
    && UIAccessibilityIsVoiceOverRunning()
    && ![(SBUIProudLockIconViewAccessibility *)self _accessibilityIsBuddyRunning]
    && ![(SBUIProudLockIconViewAccessibility *)self _accessibilityIsInSleepState])
  {
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __86__SBUIProudLockIconViewAccessibility_setState_animated_updateText_options_completion___block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0l;
    int64_t v18 = a3;
    AXPerformBlockOnMainThread();
  }
  v13.receiver = self;
  v13.super_class = (Class)SBUIProudLockIconViewAccessibility;
  [(SBUIProudLockIconViewAccessibility *)&v13 setState:a3 animated:v9 updateText:v8 options:a6 completion:v12];
}

void __86__SBUIProudLockIconViewAccessibility_setState_animated_updateText_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1 == 7 || v1 == 3)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F1C810]);
    [v3 notificationOccurred:2];
  }
  else
  {
    if (v1 != 2) {
      return;
    }
    id v3 = objc_alloc_init(MEMORY[0x263F1C810]);
    [v3 notificationOccurred:0];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21970]);
  }
}

@end