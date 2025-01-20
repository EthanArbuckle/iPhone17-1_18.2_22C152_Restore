@interface UIBarCustomizerAccessibility
@end

@implementation UIBarCustomizerAccessibility

uint64_t __75___UIBarCustomizerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id *a1)
{
  v7[2] = a1;
  v7[1] = a1;
  char v6 = 0;
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v5 = (id)__UIAccessibilityCastAsClass();

  id v4 = v5;
  objc_storeStrong(&v5, 0);
  v7[0] = v4;
  [v4 end];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  objc_storeStrong(v7, 0);
  return 1;
}

@end