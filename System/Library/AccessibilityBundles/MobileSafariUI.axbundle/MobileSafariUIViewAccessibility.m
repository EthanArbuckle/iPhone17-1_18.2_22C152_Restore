@interface MobileSafariUIViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsFrameOutOfBounds;
- (BOOL)accessibilityPerformEscape;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MobileSafariUIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"setShowingReader: animated:", "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"goBack", "v", 0);
  [v3 validateClass:@"BrowserController" hasInstanceVariable:@"_tabController" withType:"TabController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabController", @"activeTabDocument", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabDocument", @"canGoBack", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserController", @"rootViewController", "@", 0);
  [v3 validateClass:@"Application" hasInstanceVariable:@"_browserWindowController" withType:"BrowserWindowController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BrowserWindowController", @"browserControllers", "@", 0);
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = [(MobileSafariUIViewAccessibility *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"PageView"];

  if (v4)
  {
    v5 = [(MobileSafariUIViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uidimmingview.isa)];

    if (v5)
    {
      return 0;
    }
    else
    {
      char v42 = 0;
      v7 = [(id)*MEMORY[0x263F1D020] safeValueForKey:@"_browserWindowController"];
      v8 = __UIAccessibilitySafeClass();

      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v9 = [v8 safeArrayForKey:@"browserControllers"];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        v26 = v8;
        uint64_t v12 = *(void *)v39;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v39 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            char v42 = 0;
            objc_opt_class();
            v15 = [v14 safeValueForKey:@"rootViewController"];
            v16 = __UIAccessibilityCastAsClass();

            if (v42) {
              abort();
            }
            v17 = [v16 view];
            v18 = [v17 window];
            v19 = [(MobileSafariUIViewAccessibility *)self window];

            if (v18 == v19)
            {
              id v20 = v14;
              goto LABEL_17;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
          if (v11) {
            continue;
          }
          break;
        }
        id v20 = 0;
LABEL_17:
        v8 = v26;
      }
      else
      {
        id v20 = 0;
      }

      v21 = [v20 safeValueForKey:@"isShowingReader"];
      int v22 = [v21 BOOLValue];

      if (v22)
      {
        uint64_t v33 = MEMORY[0x263EF8330];
        uint64_t v34 = 3221225472;
        v35 = __61__MobileSafariUIViewAccessibility_accessibilityPerformEscape__block_invoke;
        v36 = &unk_265136F70;
        id v37 = v20;
        AXPerformSafeBlock();
        BOOL v6 = 1;
        v23 = v37;
      }
      else
      {
        v24 = [v20 safeValueForKey:@"_tabController"];
        v23 = [v24 safeValueForKey:@"activeTabDocument"];

        if ([v23 safeBoolForKey:@"canGoBack"])
        {
          uint64_t v28 = MEMORY[0x263EF8330];
          uint64_t v29 = 3221225472;
          v30 = __61__MobileSafariUIViewAccessibility_accessibilityPerformEscape__block_invoke_2;
          v31 = &unk_265136F70;
          id v32 = v20;
          AXPerformSafeBlock();

          BOOL v6 = 1;
        }
        else
        {
          BOOL v6 = 0;
        }
      }
    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)MobileSafariUIViewAccessibility;
    return [(MobileSafariUIViewAccessibility *)&v27 accessibilityPerformEscape];
  }
  return v6;
}

uint64_t __61__MobileSafariUIViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowingReader:0 animated:1];
}

void __61__MobileSafariUIViewAccessibility_accessibilityPerformEscape__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) performSelector:sel_goBack];
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CDC8];
  accessibilityLocalizedString(@"previous.page.action");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);
}

- (BOOL)_accessibilityIsFrameOutOfBounds
{
  id v3 = [(MobileSafariUIViewAccessibility *)self accessibilityIdentification];
  char v4 = [v3 isEqualToString:@"titleTextViewContainer"];

  if (v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)MobileSafariUIViewAccessibility;
  return [(MobileSafariUIViewAccessibility *)&v6 _accessibilityIsFrameOutOfBounds];
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(MobileSafariUIViewAccessibility *)self accessibilityIdentification];
  char v4 = [v3 isEqualToString:@"titleTextViewContainer"];

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)MobileSafariUIViewAccessibility;
  return [(MobileSafariUIViewAccessibility *)&v6 isAccessibilityElement];
}

- (id)accessibilityLabel
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = [(MobileSafariUIViewAccessibility *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:@"titleTextViewContainer"];

  if (!v4)
  {
    v22.receiver = self;
    v22.super_class = (Class)MobileSafariUIViewAccessibility;
    id v16 = [(MobileSafariUIViewAccessibility *)&v22 accessibilityLabel];
    goto LABEL_30;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v5 = [(MobileSafariUIViewAccessibility *)self subviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v6)
  {
    v8 = 0;
    v9 = 0;
    goto LABEL_20;
  }
  uint64_t v7 = v6;
  v8 = 0;
  v9 = 0;
  uint64_t v10 = *(void *)v24;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v24 != v10) {
        objc_enumerationMutation(v5);
      }
      uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      v13 = [v12 accessibilityIdentification];
      v14 = v13;
      if (!v9 && ([v13 isEqualToString:@"titleTextView"] & 1) != 0)
      {
        v9 = v12;
LABEL_13:
        id v15 = v12;
        goto LABEL_15;
      }
      if (v8) {
        goto LABEL_15;
      }
      if ([v14 isEqualToString:@"lockView"])
      {
        v8 = v12;
        goto LABEL_13;
      }
      v8 = 0;
LABEL_15:
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v7);
LABEL_20:

  v17 = [MEMORY[0x263F089D8] string];
  v18 = [v9 accessibilityLabel];
  if ([v18 length]) {
    [v17 appendString:v18];
  }
  v19 = [v8 accessibilityLabel];

  if ([v19 length])
  {
    if ([v17 length]) {
      [v17 appendString:@" "];
    }
    [v17 appendString:v19];
  }
  if ([v17 length]) {
    id v20 = v17;
  }
  else {
    id v20 = 0;
  }
  id v16 = v20;

LABEL_30:

  return v16;
}

@end