@interface SFNavigationBarAccessibility
@end

@implementation SFNavigationBarAccessibility

void __64___SFNavigationBarAccessibility__accessibilityAutoReaderAction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"delegate"];
  [v2 navigationBarReaderButtonWasTapped:*(void *)(a1 + 32)];
}

id __75___SFNavigationBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained safeValueForKey:@"delegate"];

  MEMORY[0x24565E530](@"BrowserController");
  if (objc_opt_isKindOfClass())
  {
    char v4 = [v3 safeBoolForKey:@"isShowingReader"];
    v5 = [v3 safeValueForKey:@"_tabController"];
    v6 = [v5 safeValueForKey:@"activeTabDocument"];
    v7 = __UIAccessibilitySafeClass();

    id v8 = (id)[v7 safeValueForKey:@"prepareToUseReader"];
    v9 = @"readerContext";
    v10 = v7;
  }
  else
  {
    MEMORY[0x24565E530](@"_SFBrowserContentViewController");
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_11;
    }
    char v4 = [v3 safeBoolForKey:@"_showingReader"];
    v10 = [v3 safeValueForKey:@"webViewController"];
    v7 = v10;
    v9 = @"readerController";
  }
  v11 = [v10 safeValueForKey:v9];
  int v12 = [v11 safeBoolForKey:@"isReaderAvailable"];

  if (v4)
  {
    v13 = @"hide.reader.action";
  }
  else
  {
    if (!v12) {
      goto LABEL_11;
    }
    v13 = @"show.reader.action";
  }
  uint64_t v14 = accessibilitySafariServicesLocalizedString(v13);
  if (v14)
  {
    v15 = (void *)v14;
    v16 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v14 target:*(void *)(a1 + 32) selector:sel__accessibilityAutoReaderAction_];
    v19[0] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];

    goto LABEL_12;
  }
LABEL_11:
  v17 = 0;
LABEL_12:

  return v17;
}

id __50___SFNavigationBarAccessibility__axUpdateURLValue__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained safeValueForKey:@"_lockView"];

  char v4 = [v3 superview];
  if (v4)
  {
    v5 = [v3 accessibilityLabel];
  }
  else
  {
    v5 = 0;
  }

  id v6 = objc_loadWeakRetained(v1);
  v7 = [v6 safeValueForKey:@"_URLLabel"];
  id v8 = [v7 accessibilityLabel];
  v9 = __UIAXStringForVariables();

  id v10 = objc_loadWeakRetained(v1);
  v11 = objc_msgSend(v10, "safeUIViewForKey:", @"_securityAnnotationLabel", v5, @"__AXStringForVariablesSentinel");
  LODWORD(v8) = [v11 _accessibilityViewIsVisible];

  if (v8)
  {
    id v12 = objc_loadWeakRetained(v1);
    v13 = [v12 safeUIViewForKey:@"_securityAnnotationLabel"];
    v18 = [v13 accessibilityLabel];
    uint64_t v14 = __UIAXStringForVariables();

    id v15 = objc_loadWeakRetained(v1);
    v16 = objc_msgSend(v15, "safeValueForKey:", @"item", v18, @"__AXStringForVariablesSentinel");
    LODWORD(v12) = [v16 safeBoolForKey:@"showsSecurityAnnotation"];

    if (v12)
    {
      v19 = accessibilitySafariServicesLocalizedString(@"sensitive.field.in.insecure.page");
      v9 = __UIAXStringForVariables();
    }
    else
    {
      v9 = v14;
    }
  }

  return v9;
}

@end