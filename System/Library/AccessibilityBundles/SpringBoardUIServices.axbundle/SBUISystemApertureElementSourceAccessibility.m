@interface SBUISystemApertureElementSourceAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_handleSceneResizeAction:(id)a3;
- (id)traverseTreeForElementsFromView:(id)a3;
@end

@implementation SBUISystemApertureElementSourceAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUISystemApertureElementSource";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUISystemApertureElementSource", @"layoutMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUISystemApertureElementSource", @"_handleSceneResizeAction:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUISystemApertureElementSource", @"systemApertureElementViewController", "@", 0);
}

- (BOOL)_handleSceneResizeAction:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SBUISystemApertureElementSourceAccessibility;
  BOOL v5 = [(SBUISystemApertureElementSourceAccessibility *)&v22 _handleSceneResizeAction:v4];
  if (UIAccessibilityIsVoiceOverRunning()
    && [(SBUISystemApertureElementSourceAccessibility *)self safeIntForKey:@"layoutMode"] == 4)
  {
    char v21 = 0;
    objc_opt_class();
    v6 = [(SBUISystemApertureElementSourceAccessibility *)self safeValueForKey:@"systemApertureElementViewController"];
    v7 = __UIAccessibilityCastAsClass();

    v8 = [v7 view];
    v9 = [v8 window];

    [(SBUISystemApertureElementSourceAccessibility *)self traverseTreeForElementsFromView:v9];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || (objc_msgSend(v15, "_accessibilityViewIsVisible", (void)v17) & 1) != 0)
          {
            UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v15);
            goto LABEL_14;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  return v5;
}

- (id)traverseTreeForElementsFromView:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x263EFF980] array];
  [v4 _accessibilitySubviews];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "isAccessibilityElement", (void)v16))
        {
          [v5 axSafelyAddObject:v11];
          goto LABEL_13;
        }
        uint64_t v12 = [v11 accessibilityElements];

        if (v12)
        {
          v14 = [v11 accessibilityElements];
          [v5 axSafelyAddObjectsFromArray:v14];

          goto LABEL_13;
        }
        uint64_t v13 = [(SBUISystemApertureElementSourceAccessibility *)self traverseTreeForElementsFromView:v11];
        [v5 axSafelyAddObjectsFromArray:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v5;
}

@end