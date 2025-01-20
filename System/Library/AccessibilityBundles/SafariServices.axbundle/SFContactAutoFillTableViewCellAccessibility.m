@interface SFContactAutoFillTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SFContactAutoFillTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFContactAutoFillTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFContactAutoFillTableViewCell", @"checked", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFContactAutoFillTableViewCell", @"checkmarkButtonTapped:", "v", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8.receiver = self;
  v8.super_class = (Class)SFContactAutoFillTableViewCellAccessibility;
  [(SFContactAutoFillTableViewCellAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  v7.receiver = self;
  v7.super_class = (Class)SFContactAutoFillTableViewCellAccessibility;
  id v3 = [(SFContactAutoFillTableViewCellAccessibility *)&v7 accessibilityTraits];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __89__SFContactAutoFillTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_26514AB58;
  v5[1] = v3;
  objc_copyWeak(v5, &location);
  [(SFContactAutoFillTableViewCellAccessibility *)self _setAccessibilityTraitsBlock:v4];
  objc_destroyWeak(v5);
  objc_destroyWeak(&location);
}

uint64_t __89__SFContactAutoFillTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained safeBoolForKey:@"checked"];
  uint64_t v4 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4 | v1;

  return v5;
}

- (BOOL)accessibilityActivate
{
  return 1;
}

uint64_t __68__SFContactAutoFillTableViewCellAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkmarkButtonTapped:0];
}

@end