@interface TUICandidateViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityScannerGroupElements;
- (int64_t)accessibilityNavigationStyle;
- (void)finalizeLayoutChange;
@end

@implementation TUICandidateViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TUICandidateView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TUICandidateCell"];
  [v3 validateClass:@"TUICandidateArrowButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TUICandidateView", @"finalizeLayoutChange", "v", 0);
}

- (void)finalizeLayoutChange
{
  v2.receiver = self;
  v2.super_class = (Class)TUICandidateViewAccessibility;
  [(TUICandidateViewAccessibility *)&v2 finalizeLayoutChange];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (int64_t)accessibilityNavigationStyle
{
  return 2;
}

- (id)_accessibilityScannerGroupElements
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  objc_super v2 = [MEMORY[0x263F81198] defaultSwitchControlOptions];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  char v38 = 0;
  objc_opt_class();
  v4 = __UIAccessibilityCastAsClass();
  v5 = v4;
  v6 = [v4 subviews];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v39 + 1) + 8 * i) _accessibilityLeafDescendantsWithOptions:v2];
        [v3 axSafelyAddObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v8);
  }

  if ([v3 count] == 2)
  {
    v12 = [v3 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v14 = v3;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v43 count:16];
      if (!v15) {
        goto LABEL_19;
      }
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v35;
LABEL_13:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v34 + 1) + 8 * v18);
        MEMORY[0x245666FF0](@"TUICandidateArrowButton");
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:v43 count:16];
          if (!v16)
          {
LABEL_19:
            id v20 = v14;
            goto LABEL_29;
          }
          goto LABEL_13;
        }
      }
      id v20 = v19;

      if (v20)
      {
        char v38 = 0;
        objc_opt_class();
        v21 = objc_msgSend(v14, "firstObject", (void)v34);
        v22 = [v21 objectForKeyedSubscript:@"GroupElements"];
        v23 = __UIAccessibilityCastAsClass();

        if (!v38)
        {
          if ([v23 count] != 1) {
            goto LABEL_28;
          }
          v24 = [v23 firstObject];
          objc_opt_class();
          char v25 = objc_opt_isKindOfClass();

          if ((v25 & 1) == 0) {
            goto LABEL_28;
          }
          char v38 = 0;
          objc_opt_class();
          v26 = [v23 firstObject];
          v27 = [v26 objectForKeyedSubscript:@"GroupElements"];
          v28 = __UIAccessibilityCastAsClass();

          if (!v38)
          {
            v29 = (void *)[v28 mutableCopy];

            v30 = [v29 firstObject];
            MEMORY[0x245666FF0](@"TUICandidateCell");
            char v31 = objc_opt_isKindOfClass();

            if (v31)
            {
              [v14 removeObject:v20];
              [v29 addObject:v20];
              v32 = [v23 firstObject];
              [v32 setObject:v29 forKeyedSubscript:@"GroupElements"];
            }
LABEL_28:

LABEL_29:
            goto LABEL_30;
          }
        }
        abort();
      }
    }
  }
LABEL_30:

  return v3;
}

@end