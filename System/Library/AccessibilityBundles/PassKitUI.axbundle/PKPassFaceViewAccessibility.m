@interface PKPassFaceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)createBodyInvariantViews;
- (void)setPass:(id)a3 colorProfile:(id)a4;
@end

@implementation PKPassFaceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPassFaceView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v16.receiver = self;
  v16.super_class = (Class)PKPassFaceViewAccessibility;
  [(PKPassFaceViewAccessibility *)&v16 _accessibilityLoadAccessibilityInformation];
  v3 = [(PKPassFaceViewAccessibility *)self safeValueForKey:@"_backgroundView"];
  v4 = [(PKPassFaceViewAccessibility *)self safeValueForKey:@"_pass"];
  v5 = [v4 safeValueForKey:@"logoRect"];
  [v3 _accessibilitySetRetainedValue:v5 forKey:@"LogoRect"];

  v6 = [(PKPassFaceViewAccessibility *)self safeValueForKey:@"_pass"];
  v7 = [v6 safeValueForKey:@"localizedDescription"];
  v15 = [v6 safeValueForKey:@"organizationName"];
  v8 = __UIAXStringForVariables();

  if (objc_msgSend(v8, "length", v15, @"__AXStringForVariablesSentinel"))
  {
    v9 = [(PKPassFaceViewAccessibility *)self safeValueForKey:@"_backgroundView"];
    [v9 accessibilitySetIdentification:@"LogoImage"];

    v10 = [(PKPassFaceViewAccessibility *)self safeValueForKey:@"_backgroundView"];
    v11 = accessibilityLocalizedString(@"card.logo.hint");
    [v10 setAccessibilityHint:v11];

    v12 = [(PKPassFaceViewAccessibility *)self safeValueForKey:@"_backgroundView"];
    [v12 setIsAccessibilityElement:1];

    v13 = [(PKPassFaceViewAccessibility *)self safeValueForKey:@"_backgroundView"];
    [v13 setAccessibilityLabel:v8];
  }
  v14 = [(PKPassFaceViewAccessibility *)self safeValueForKey:@"_backgroundView"];
  [v14 setIsAccessibilityElement:0];
}

- (void)setPass:(id)a3 colorProfile:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassFaceViewAccessibility;
  [(PKPassFaceViewAccessibility *)&v5 setPass:a3 colorProfile:a4];
  [(PKPassFaceViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)createBodyInvariantViews
{
  v2.receiver = self;
  v2.super_class = (Class)PKPassFaceViewAccessibility;
  [(PKPassFaceViewAccessibility *)&v2 createBodyInvariantViews];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __55__PKPassFaceViewAccessibility_createBodyInvariantViews__block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v1 = [*(id *)(a1 + 32) safeValueForKey:@"contentView"];
  objc_super v2 = [v1 safeValueForKey:@"subviews"];

  uint64_t v3 = [v2 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v39 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = v7;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          v9 = [v8 allTargets];
          uint64_t v26 = [v9 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (v26)
          {
            uint64_t v10 = *(void *)v35;
            v28 = v9;
            v29 = v2;
            uint64_t v23 = v4;
            uint64_t v24 = v5;
            uint64_t v25 = *(void *)v35;
            do
            {
              uint64_t v11 = 0;
              do
              {
                if (*(void *)v35 != v10)
                {
                  uint64_t v12 = v11;
                  objc_enumerationMutation(v9);
                  uint64_t v11 = v12;
                }
                uint64_t v27 = v11;
                uint64_t v13 = *(void *)(*((void *)&v34 + 1) + 8 * v11);
                long long v30 = 0u;
                long long v31 = 0u;
                long long v32 = 0u;
                long long v33 = 0u;
                v14 = [v8 actionsForTarget:v13 forControlEvent:64];
                uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v42 count:16];
                if (v15)
                {
                  uint64_t v16 = v15;
                  uint64_t v17 = *(void *)v31;
                  while (2)
                  {
                    for (uint64_t j = 0; j != v16; ++j)
                    {
                      if (*(void *)v31 != v17) {
                        objc_enumerationMutation(v14);
                      }
                      v19 = *(void **)(*((void *)&v30 + 1) + 8 * j);
                      if ([v19 isEqualToString:@"_deleteButtonPressed:"])
                      {
                        v20 = accessibilityLocalizedString(@"trash.button");
                        [v8 setAccessibilityLabel:v20];
                      }
                      else if ([v19 isEqualToString:@"_shareButtonPressed:"])
                      {
                        v22 = accessibilityLocalizedString(@"share.button");
                        [v8 setAccessibilityLabel:v22];

                        objc_super v2 = v29;
                        goto LABEL_29;
                      }
                    }
                    uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v42 count:16];
                    if (v16) {
                      continue;
                    }
                    break;
                  }
                }

                uint64_t v11 = v27 + 1;
                v9 = v28;
                objc_super v2 = v29;
                uint64_t v4 = v23;
                uint64_t v5 = v24;
                uint64_t v10 = v25;
              }
              while (v27 + 1 != v26);
              uint64_t v21 = [v28 countByEnumeratingWithState:&v34 objects:v43 count:16];
              uint64_t v10 = v25;
              uint64_t v26 = v21;
            }
            while (v21);
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v4);
  }
LABEL_29:
}

@end