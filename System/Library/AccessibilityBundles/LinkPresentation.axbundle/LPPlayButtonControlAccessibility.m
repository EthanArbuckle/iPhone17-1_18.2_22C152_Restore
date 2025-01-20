@interface LPPlayButtonControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsPlaying;
- (id)accessibilityCustomActions;
- (void)_axSetIsPlaying:(BOOL)a3;
- (void)_showPlayIndicator:(BOOL)a3;
@end

@implementation LPPlayButtonControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LPPlayButtonControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPPlayButtonControl", @"_showPlayIndicator:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LPPlayButtonControl", @"buttonPressed:", "v", "@", 0);
}

- (BOOL)_axIsPlaying
{
  return MEMORY[0x270F09620](self, &__LPPlayButtonControlAccessibility___axIsPlaying);
}

- (void)_axSetIsPlaying:(BOOL)a3
{
}

- (id)accessibilityCustomActions
{
  id v3 = [MEMORY[0x263EFF980] array];
  if ([(LPPlayButtonControlAccessibility *)self _axIsPlaying]) {
    v4 = @"pause.button";
  }
  else {
    v4 = @"play.button";
  }
  v5 = accessibilityLocalizedString(v4);
  objc_initWeak(&location, self);
  id v6 = objc_alloc(MEMORY[0x263F1C390]);
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __62__LPPlayButtonControlAccessibility_accessibilityCustomActions__block_invoke;
  v12 = &unk_2650A28D8;
  objc_copyWeak(&v13, &location);
  v7 = (void *)[v6 initWithName:v5 actionHandler:&v9];
  objc_msgSend(v3, "axSafelyAddObject:", v7, v9, v10, v11, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v3;
}

uint64_t __62__LPPlayButtonControlAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __62__LPPlayButtonControlAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained buttonPressed:0];
}

- (void)_showPlayIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)LPPlayButtonControlAccessibility;
  -[LPPlayButtonControlAccessibility _showPlayIndicator:](&v5, sel__showPlayIndicator_);
  [(LPPlayButtonControlAccessibility *)self _axSetIsPlaying:!v3];
}

@end