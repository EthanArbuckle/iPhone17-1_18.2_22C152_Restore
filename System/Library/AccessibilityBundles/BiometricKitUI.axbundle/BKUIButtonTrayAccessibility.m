@interface BKUIButtonTrayAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BKUIButtonTrayAccessibility)initWithFrame:(CGRect)a3 willUseActionDelegate:(BOOL)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation BKUIButtonTrayAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BKUIButtonTray";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"BKUIButtonTray" hasInstanceVariable:@"_nextStateButton" withType:"UIButton"];
  [v3 validateClass:@"BKUIButtonTray" hasInstanceVariable:@"_bottomLinkButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIButtonTray", @"initWithFrame:willUseActionDelegate:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "B", 0);
}

- (BKUIButtonTrayAccessibility)initWithFrame:(CGRect)a3 willUseActionDelegate:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BKUIButtonTrayAccessibility;
  v4 = -[BKUIButtonTrayAccessibility initWithFrame:willUseActionDelegate:](&v6, sel_initWithFrame_willUseActionDelegate_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(BKUIButtonTrayAccessibility *)v4 _accessibilityLoadAccessibilityInformation];

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)BKUIButtonTrayAccessibility;
  [(BKUIButtonTrayAccessibility *)&v15 _accessibilityLoadAccessibilityInformation];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [&unk_26F63D330 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    uint64_t v5 = MEMORY[0x263EF8330];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(&unk_26F63D330);
        }
        v7 = [(BKUIButtonTrayAccessibility *)self safeUIViewForKey:*(void *)(*((void *)&v11 + 1) + 8 * v6)];
        objc_initWeak(&location, v7);
        v8[0] = v5;
        v8[1] = 3221225472;
        v8[2] = __73__BKUIButtonTrayAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
        v8[3] = &unk_26510E5E0;
        objc_copyWeak(&v9, &location);
        [v7 _setIsAccessibilityElementBlock:v8];
        objc_destroyWeak(&v9);
        objc_destroyWeak(&location);

        ++v6;
      }
      while (v3 != v6);
      uint64_t v3 = [&unk_26F63D330 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v3);
  }
}

BOOL __73__BKUIButtonTrayAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained alpha];
  if (v3 <= 0.0)
  {
    BOOL v6 = 0;
  }
  else
  {
    id v4 = objc_loadWeakRetained(v1);
    uint64_t v5 = [v4 accessibilityLabel];
    BOOL v6 = [v5 length] != 0;
  }
  return v6;
}

@end