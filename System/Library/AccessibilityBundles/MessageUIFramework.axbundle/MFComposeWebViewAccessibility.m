@interface MFComposeWebViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)set_leadingInputAssistantItemGroups:(id)a3;
- (void)set_trailingInputAssistantItemGroups:(id)a3;
@end

@implementation MFComposeWebViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFComposeWebView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeWebView", @"_leadingInputAssistantItemGroups", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeWebView", @"_trailingInputAssistantItemGroups", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeWebView", @"set_leadingInputAssistantItemGroups:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeWebView", @"set_trailingInputAssistantItemGroups:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeWebView", @"_shouldShowMarkupButton", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIImageAsset", @"assetName", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  v57.receiver = self;
  v57.super_class = (Class)MFComposeWebViewAccessibility;
  [(MFComposeWebViewAccessibility *)&v57 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(MFComposeWebViewAccessibility *)self safeValueForKey:@"_leadingInputAssistantItemGroups"];
  v4 = __UIAccessibilityCastAsClass();

  char v56 = 0;
  objc_opt_class();
  v5 = [(MFComposeWebViewAccessibility *)self safeValueForKey:@"_trailingInputAssistantItemGroups"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count") + objc_msgSend(v4, "count"));
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v53 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v52 + 1) + 8 * i) barButtonItems];
        [v7 axSafelyAddObjectsFromArray:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v10);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [*(id *)(*((void *)&v48 + 1) + 8 * j) barButtonItems];
        [v7 axSafelyAddObjectsFromArray:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v48 objects:v59 count:16];
    }
    while (v16);
  }
  v37 = v14;
  v38 = v8;
  v42 = self;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v7;
  uint64_t v20 = [obj countByEnumeratingWithState:&v44 objects:v58 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v45;
    uint64_t v23 = *MEMORY[0x263F12558];
    uint64_t v24 = *MEMORY[0x263F12560];
    uint64_t v40 = *MEMORY[0x263F12568];
    uint64_t v41 = *MEMORY[0x263F12570];
    uint64_t v39 = *MEMORY[0x263F12550];
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v45 != v22) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v44 + 1) + 8 * k);
        v27 = [v26 image];
        v28 = [v27 imageAsset];
        v29 = [v28 safeValueForKey:@"assetName"];

        char v30 = [v29 containsString:v23];
        v31 = @"format.toolbar.button";
        if (v30) {
          goto LABEL_29;
        }
        if ([v29 containsString:v24])
        {
          if ([(MFComposeWebViewAccessibility *)v42 safeBoolForKey:@"_shouldShowMarkupButton"])v31 = @"markup.button"; {
          else
          }
            v31 = @"drawing.button";
LABEL_29:
          v36 = accessibilityLocalizedString(v31);
          [v26 setAccessibilityLabel:v36];

          goto LABEL_30;
        }
        char v32 = [v29 containsString:v41];
        v31 = @"scan.document.button";
        if (v32) {
          goto LABEL_29;
        }
        char v33 = [v29 containsString:@"compose-accessory-close"];
        v31 = @"close.toolbar.button";
        if (v33) {
          goto LABEL_29;
        }
        char v34 = [v29 containsString:v40];
        v31 = @"insert.photo.label";
        if (v34) {
          goto LABEL_29;
        }
        int v35 = [v29 containsString:v39];
        v31 = @"add.attachment.button";
        if (v35) {
          goto LABEL_29;
        }
LABEL_30:
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v44 objects:v58 count:16];
    }
    while (v21);
  }
}

- (void)set_leadingInputAssistantItemGroups:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MFComposeWebViewAccessibility;
  [(MFComposeWebViewAccessibility *)&v4 set_leadingInputAssistantItemGroups:a3];
  [(MFComposeWebViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)set_trailingInputAssistantItemGroups:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MFComposeWebViewAccessibility;
  [(MFComposeWebViewAccessibility *)&v4 set_trailingInputAssistantItemGroups:a3];
  [(MFComposeWebViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end