@interface SFStartPageSectionHeaderTitleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (SFStartPageSectionHeaderTitleViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SFStartPageSectionHeaderTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFStartPageSectionHeaderTitleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFStartPageSectionHeaderTitleView" hasInstanceVariable:@"_button" withType:"UIButton"];
  [v3 validateClass:@"SFStartPageSectionHeaderTitleView" hasInstanceVariable:@"_label" withType:"UILabel"];
  [v3 validateClass:@"SFStartPageSectionHeaderTitleView" hasInstanceVariable:@"_title" withType:"NSString"];
  [v3 validateClass:@"SFStartPageSectionHeaderTitleView" hasInstanceVariable:@"_image" withType:"UIImage"];
}

- (SFStartPageSectionHeaderTitleViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFStartPageSectionHeaderTitleViewAccessibility;
  id v3 = -[SFStartPageSectionHeaderTitleViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SFStartPageSectionHeaderTitleViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)SFStartPageSectionHeaderTitleViewAccessibility;
  [(SFStartPageSectionHeaderTitleViewAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  objc_opt_class();
  id v3 = [(SFStartPageSectionHeaderTitleViewAccessibility *)self safeUIViewForKey:@"_button"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
  objc_super v5 = [v4 menu];

  if (v5) {
    objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x263F1CEE8] | *MEMORY[0x263F813C0] | objc_msgSend(v4, "accessibilityTraits"));
  }
  LOBYTE(location) = 0;
  objc_opt_class();
  v6 = [(SFStartPageSectionHeaderTitleViewAccessibility *)self safeUIViewForKey:@"_label"];
  v7 = __UIAccessibilityCastAsClass();

  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __92__SFStartPageSectionHeaderTitleViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v8[3] = &unk_265135F40;
  objc_copyWeak(&v9, &location);
  [v7 setAccessibilityLabelBlock:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

id __92__SFStartPageSectionHeaderTitleViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  char v33 = 0;
  v1 = [(id)*MEMORY[0x263F1D020] safeValueForKey:@"_browserWindowController"];
  v2 = __UIAccessibilitySafeClass();

  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [v2 safeArrayForKey:@"browserControllers"];
  uint64_t v3 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v26 = v2;
    uint64_t v5 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        char v33 = 0;
        objc_opt_class();
        v8 = [v7 safeValueForKey:@"rootViewController"];
        id v9 = __UIAccessibilityCastAsClass();

        if (v33) {
          abort();
        }
        v10 = [v9 view];
        objc_super v11 = [v10 window];
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
        v13 = [WeakRetained window];

        if (v11 == v13)
        {
          id v14 = v7;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v4) {
        continue;
      }
      break;
    }
    id v14 = 0;
LABEL_13:
    v2 = v26;
  }
  else
  {
    id v14 = 0;
  }

  v15 = [v14 safeStringForKey:@"_profileTitleInScene"];
  if (!v15) {
    goto LABEL_21;
  }
  v16 = [v14 safeValueForKey:@"activeProfileIdentifier"];
  if ([v16 isEqualToString:@"DefaultProfile"])
  {
  }
  else
  {
    id v17 = objc_loadWeakRetained((id *)(a1 + 32));
    v18 = [v17 safeStringForKey:@"_title"];
    char v19 = [v18 containsString:v15];

    if (v19) {
      goto LABEL_21;
    }
  }
  id v20 = objc_loadWeakRetained((id *)(a1 + 32));
  v21 = [v20 safeValueForKey:@"_image"];

  if (v21)
  {
    id v22 = objc_loadWeakRetained((id *)(a1 + 32));
    v25 = [v22 safeStringForKey:@"_title"];
    v23 = __UIAXStringForVariables();

    goto LABEL_22;
  }
LABEL_21:
  id v22 = objc_loadWeakRetained((id *)(a1 + 32));
  v23 = [v22 safeStringForKey:@"_title"];
LABEL_22:

  return v23;
}

@end