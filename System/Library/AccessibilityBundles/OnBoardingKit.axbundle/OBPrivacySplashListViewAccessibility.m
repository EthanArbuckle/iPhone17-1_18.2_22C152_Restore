@interface OBPrivacySplashListViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (OBPrivacySplashListViewAccessibility)initWithContentList:(id)a3 dataDetectorTypes:(unint64_t)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetupTextViewForSwitchControl:(id)a3;
@end

@implementation OBPrivacySplashListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"OBPrivacySplashListView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"OBPrivacySplashListView" hasInstanceVariable:@"_textViews" withType:"NSMutableArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBPrivacySplashListView", @"initWithContentList:dataDetectorTypes:", "@", "Q", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v32.receiver = self;
  v32.super_class = (Class)OBPrivacySplashListViewAccessibility;
  [(OBPrivacySplashListViewAccessibility *)&v32 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  v25 = self;
  id v3 = [(OBPrivacySplashListViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_1 startWithSelf:0];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 delegate];
  NSClassFromString(&cfstr_Obprivacysplas_1.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && ([v4 contentSize], double v8 = v7, objc_msgSend(v4, "bounds"), v8 > v9)
    && _AXSAssistiveTouchScannerEnabled())
  {
    int v10 = MEMORY[0x2456594E0]() ^ 1;
  }
  else
  {
    int v10 = 0;
  }
  char v31 = 0;
  objc_opt_class();
  v11 = [(OBPrivacySplashListViewAccessibility *)v25 safeValueForKey:@"_textViews"];
  v12 = __UIAccessibilityCastAsClass();

  if (v12)
  {
    v23 = v12;
    v24 = v4;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v12;
    uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (!v13) {
      goto LABEL_23;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    while (1)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(obj);
        }
        char v31 = 0;
        objc_opt_class();
        v17 = __UIAccessibilityCastAsClass();
        if (v31) {
          abort();
        }
        v18 = v17;
        v19 = [v17 text];
        if ([v19 length])
        {
        }
        else
        {
          v20 = [v18 attributedText];
          v21 = [v20 string];
          uint64_t v22 = [v21 length];

          if (!v22)
          {
            [v18 setIsAccessibilityElement:0];
            goto LABEL_21;
          }
        }
        objc_msgSend(v18, "_accessibilitySetTextViewShouldBreakUpParagraphs:", 1, v23, v24);
        if (v10) {
          [(OBPrivacySplashListViewAccessibility *)v25 _axSetupTextViewForSwitchControl:v18];
        }
LABEL_21:
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (!v14)
      {
LABEL_23:

        v12 = v23;
        v4 = v24;
        break;
      }
    }
  }
}

uint64_t __82__OBPrivacySplashListViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (OBPrivacySplashListViewAccessibility)initWithContentList:(id)a3 dataDetectorTypes:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)OBPrivacySplashListViewAccessibility;
  v4 = [(OBPrivacySplashListViewAccessibility *)&v6 initWithContentList:a3 dataDetectorTypes:a4];
  [(OBPrivacySplashListViewAccessibility *)v4 _accessibilityLoadAccessibilityInformation];

  return v4;
}

- (void)_axSetupTextViewForSwitchControl:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 accessibilityElements];
  if ([v4 count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setAccessibilityRespondsToUserInteraction:", 1, (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
  else
  {
    [v3 setIsAccessibilityElement:1];
    [v3 setAccessibilityRespondsToUserInteraction:1];
  }
}

@end