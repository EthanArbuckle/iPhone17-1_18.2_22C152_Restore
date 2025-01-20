@interface LUIClassTableViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation LUIClassTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LUIClassTableViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LUIClassTableViewController", @"footerButtonPressed:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LUIClassTableViewController", @"viewDidLoad", "v", 0);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)LUIClassTableViewControllerAccessibility;
  [(LUIClassTableViewControllerAccessibility *)&v3 viewDidLoad];
  [(LUIClassTableViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)LUIClassTableViewControllerAccessibility;
  [(LUIClassTableViewControllerAccessibility *)&v18 _accessibilityLoadAccessibilityInformation];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_opt_class();
  objc_super v3 = [(LUIClassTableViewControllerAccessibility *)self safeValueForKey:@"view"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 subviews];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v15;
    char v10 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v8) {
            char v10 = 0;
          }
          else {
            id v8 = v12;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);

    if ((v10 & (v8 != 0)) == 1)
    {
      uint64_t v13 = [v8 accessibilityTraits];
      [v8 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v13];
    }
  }
  else
  {

    id v8 = 0;
  }
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __70__LUIClassTableViewControllerAccessibility_accessibilityPerformEscape__block_invoke;
  uint64_t v9 = &unk_26512B678;
  char v10 = self;
  v11 = &v12;
  AXPerformSafeBlock();
  if (*((unsigned char *)v13 + 24))
  {
    BOOL v3 = 1;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)LUIClassTableViewControllerAccessibility;
    BOOL v3 = [(LUIClassTableViewControllerAccessibility *)&v5 accessibilityPerformEscape];
    *((unsigned char *)v13 + 24) = v3;
  }
  _Block_object_dispose(&v12, 8);
  return v3;
}

uint64_t __70__LUIClassTableViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) footerButtonPressed:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

@end