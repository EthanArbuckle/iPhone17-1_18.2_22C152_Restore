@interface SafariUIApplicationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAlternateActionForURL:(id)a3;
- (BOOL)_accessibilityLoadURL:(id)a3;
- (BOOL)_accessibilityWebSearchResultsActive;
- (BOOL)_accessibilityWebViewIsLoading;
- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5;
- (id)_accessibilityActiveURL;
- (id)_accessibilityMainBrowserController;
- (id)_accessibilityRetrieveWebViewForSearchResults;
- (id)_getScribbleController;
- (id)_iosAccessibilityAttributeValue:(int64_t)a3;
- (id)_iosAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4;
- (id)accessibilityLabel;
@end

@implementation SafariUIApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WebHTMLView", @"accessibilityRootElement", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebBrowserFindOnPageHighlighter", @"setSearchText: matchLimit:", "v", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebBrowserFindOnPageHighlighter", @"numberOfMatches", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabDocument", @"loadURL: userDriven:", "@", "@", "B", 0);
  [v3 validateClass:@"TabDocument" hasInstanceVariable:@"_findCompletionProvider" withType:"FindOnPageCompletionProvider"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabController", @"activeTabDocument", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TabDocument", @"URLString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Application", @"browserWindowController", "@", 0);
  [v3 validateClass:@"TabDocument" hasInstanceVariable:@"_sfScribbleController" withType:"SFScribbleController"];
  [v3 validateClass:@"SFScribbleController" hasInstanceVariable:@"_elementController" withType:"WBSScribbleController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFScribbleController", @"_hideSelectedElement", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFScribbleController", @"_setSelectedElement:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFScribbleController", @"_updateScribbleControllerForElementAtPoint:", "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WBSScribbleController", @"getElementAtPoint:completion:", "v", "{CGPoint=dd}", "@?", 0);
  [v3 validateClass:@"WBSScribbleElement" hasInstanceVariable:@"_targetedElements" withType:"NSArray"];
  [v3 validateClass:@"WBSScribbleElement" hasInstanceVariable:@"_screenReaderText" withType:"NSString"];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"application.name");
}

- (id)_accessibilityMainBrowserController
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  char v24 = 0;
  v2 = [(id)*MEMORY[0x263F1D020] safeValueForKey:@"_browserWindowController"];
  id v3 = __UIAccessibilitySafeClass();

  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v4 = [v3 safeArrayForKey:@"browserControllers"];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    v19 = v3;
    uint64_t v7 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        char v24 = 0;
        objc_opt_class();
        v10 = [v9 safeValueForKey:@"rootViewController"];
        v11 = __UIAccessibilityCastAsClass();

        if (v24) {
          goto LABEL_19;
        }
        v12 = [v11 view];
        v13 = [v12 window];

        v14 = [v13 windowScene];
        v15 = [v14 keyWindow];

        if (v13 == v15)
        {
          char v24 = 0;
          uint64_t v17 = __UIAccessibilitySafeClass();
          if (v24) {
LABEL_19:
          }
            abort();
          v16 = (void *)v17;

          goto LABEL_14;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v6) {
        continue;
      }
      break;
    }
    v16 = 0;
LABEL_14:
    id v3 = v19;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_accessibilityWebSearchResultsActive
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = AXUIApplicationWindows();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    BOOL v6 = 1;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v12 != v5) {
        objc_enumerationMutation(v2);
      }
      v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "firstResponder", (void)v11);
      v9 = [v8 _accessibilityFindAncestor:&__block_literal_global_2 startWithSelf:1];

      if (v9) {
        break;
      }
      if (v4 == ++v7)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __72__SafariUIApplicationAccessibility__accessibilityWebSearchResultsActive__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 accessibilityIdentifier];
  uint64_t v3 = [v2 isEqualToString:@"SFFindOnPageBarIdentifier"];

  return v3;
}

- (id)_accessibilityRetrieveWebViewForSearchResults
{
  uint64_t v3 = [(SafariUIApplicationAccessibility *)self _accessibilityMainBrowserController];
  uint64_t v4 = v3;
  if (!v3
    || ([v3 safeValueForKey:@"browserView"],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 safeValueForKey:@"webView"],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    BOOL v6 = [(SafariUIApplicationAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Webview_0.isa)];
  }

  return v6;
}

- (id)_accessibilityActiveURL
{
  objc_opt_class();
  uint64_t v3 = [(SafariUIApplicationAccessibility *)self _accessibilityMainBrowserController];
  uint64_t v4 = __UIAccessibilityCastAsSafeCategory();

  uint64_t v5 = [v4 accessibilityActiveTabDocument];
  BOOL v6 = __UIAccessibilitySafeClass();

  uint64_t v7 = [v6 safeValueForKey:@"URLString"];

  return v7;
}

- (BOOL)_accessibilityWebViewIsLoading
{
  return [(SafariUIApplicationAccessibility *)self safeBoolForKey:@"isLoading"];
}

- (BOOL)_accessibilityLoadURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    uint64_t v5 = [(SafariUIApplicationAccessibility *)self _accessibilityMainBrowserController];
    BOOL v6 = __UIAccessibilityCastAsSafeCategory();

    uint64_t v7 = [v6 accessibilityActiveTabDocument];
    v8 = __UIAccessibilitySafeClass();

    long long v12 = v8;
    long long v13 = (void *)[objc_alloc(NSURL) initWithString:v4];
    id v9 = v13;
    id v10 = v8;
    AXPerformSafeBlock();
  }
  return v4 != 0;
}

id __58__SafariUIApplicationAccessibility__accessibilityLoadURL___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) loadURL:*(void *)(a1 + 40) userDriven:1];
}

- (BOOL)_accessibilityAlternateActionForURL:(id)a3
{
  id v3 = a3;
  id v4 = [NSURL URLWithString:v3];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v10 = 0;
    long long v11 = &v10;
    uint64_t v12 = 0x3032000000;
    long long v13 = __Block_byref_object_copy__1;
    long long v14 = __Block_byref_object_dispose__1;
    id v15 = 0;
    id v9 = v4;
    AXPerformSafeBlock();
    id v6 = (id)v11[5];

    _Block_object_dispose(&v10, 8);
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __72__SafariUIApplicationAccessibility__accessibilityAlternateActionForURL___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [NSClassFromString(&cfstr_Tabdocument.isa) urlForExternalURL:*(void *)(a1 + 32)];

  return MEMORY[0x270F9A758]();
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3
{
  if (a3 == 5073)
  {
    id v3 = [(SafariUIApplicationAccessibility *)self _getScribbleController];
    uint64_t v4 = [v3 safeBoolForKey:@"isScribbling"];
    uint64_t v5 = [NSNumber numberWithBool:v4];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SafariUIApplicationAccessibility;
    uint64_t v5 = -[SafariUIApplicationAccessibility _iosAccessibilityAttributeValue:](&v7, sel__iosAccessibilityAttributeValue_);
  }

  return v5;
}

- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5
{
  if ((a3 - 4202) > 0xFFFFFFFD)
  {
    id v6 = [(SafariUIApplicationAccessibility *)self _getScribbleController];
    objc_super v7 = v6;
    BOOL v5 = v6 != 0;
    if (v6)
    {
      id v9 = v6;
      AXPerformSafeBlock();
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SafariUIApplicationAccessibility;
    return [(SafariUIApplicationAccessibility *)&v10 _iosAccessibilityPerformAction:*(void *)&a3 withValue:a4 fencePort:*(void *)&a5];
  }
  return v5;
}

uint64_t __87__SafariUIApplicationAccessibility__iosAccessibilityPerformAction_withValue_fencePort___block_invoke(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 40);
  if (v1 == 4201) {
    return [*(id *)(result + 32) _setSelectedElement:0];
  }
  if (v1 == 4200) {
    return [*(id *)(result + 32) _hideSelectedElement];
  }
  return result;
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a3 == 94100)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 pointValue];
      uint64_t v8 = v7;
      uint64_t v10 = v9;
      long long v11 = [(SafariUIApplicationAccessibility *)self _getScribbleController];
      v33 = v11;
      if (v11)
      {
        uint64_t v61 = 0;
        v62 = &v61;
        uint64_t v63 = 0x2020000000;
        char v64 = 0;
        *(void *)buf = 0;
        v56 = buf;
        uint64_t v57 = 0x3032000000;
        v58 = __Block_byref_object_copy__1;
        v59 = __Block_byref_object_dispose__1;
        id v60 = 0;
        uint64_t v46 = MEMORY[0x263EF8330];
        uint64_t v47 = 3221225472;
        v48 = __81__SafariUIApplicationAccessibility__iosAccessibilityAttributeValue_forParameter___block_invoke;
        v49 = &unk_265137180;
        id v12 = v11;
        uint64_t v53 = v8;
        uint64_t v54 = v10;
        id v50 = v12;
        v51 = buf;
        v52 = &v61;
        AXPerformSafeBlock();
        while (!*((unsigned char *)v62 + 24))
        {
          CFRunLoopGetCurrent();
          CFRunLoopRunSpecific();
        }
        if (*((void *)v56 + 5))
        {
          uint64_t v38 = MEMORY[0x263EF8330];
          uint64_t v39 = 3221225472;
          v40 = __81__SafariUIApplicationAccessibility__iosAccessibilityAttributeValue_forParameter___block_invoke_403;
          v41 = &unk_2651371A8;
          id v42 = v12;
          uint64_t v43 = v8;
          uint64_t v44 = v10;
          AXPerformSafeBlock();

          [*((id *)v56 + 5) safeArrayForKey:@"targetedElements"];
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v15 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v16 = 0;
          uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v66 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v35;
            do
            {
              uint64_t v19 = 0;
              long long v20 = v16;
              do
              {
                if (*(void *)v35 != v18) {
                  objc_enumerationMutation(v15);
                }
                v31 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * v19), "safeStringForKey:", @"screenReaderText", v31, v32);
                v32 = @"__AXStringForVariablesSentinel";
                uint64_t v16 = __UIAXStringForVariables();

                ++v19;
                long long v20 = v16;
              }
              while (v17 != v19);
              uint64_t v17 = [v15 countByEnumeratingWithState:&v34, v66, 16, v31, @"__AXStringForVariablesSentinel" objects count];
            }
            while (v17);
          }

          if ([v16 length])
          {
            [*((id *)v56 + 5) safeCGRectForKey:@"geometry"];
            double v22 = v21;
            double v24 = v23;
            double v26 = v25;
            double v28 = v27;
            long long v13 = [MEMORY[0x263EFF9A0] dictionary];
            [v13 setObject:v16 forKey:@"AXScribbleRenderedTextKey"];
            v29 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v22, v24, v26, v28);
            [v13 setObject:v29 forKey:@"AXScribbleGeometryKey"];
          }
          else
          {
            long long v13 = 0;
          }
        }
        else
        {
          id v15 = AXLogAppAccessibility();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v45 = 0;
            _os_log_impl(&dword_2422FF000, v15, OS_LOG_TYPE_DEFAULT, "[Scribble] no element found at point", v45, 2u);
          }
          long long v13 = 0;
        }

        _Block_object_dispose(buf, 8);
        _Block_object_dispose(&v61, 8);
      }
      else
      {
        long long v13 = 0;
      }
    }
    else
    {
      long long v14 = AXLogAppAccessibility();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2422FF000, v14, OS_LOG_TYPE_DEFAULT, "[Scribble] attribute value is not an NSValue", buf, 2u);
      }

      long long v13 = 0;
    }
  }
  else
  {
    v65.receiver = self;
    v65.super_class = (Class)SafariUIApplicationAccessibility;
    long long v13 = [(SafariUIApplicationAccessibility *)&v65 _iosAccessibilityAttributeValue:a3 forParameter:v6];
  }

  return v13;
}

void __81__SafariUIApplicationAccessibility__iosAccessibilityAttributeValue_forParameter___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) safeValueForKey:@"_elementController"];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __81__SafariUIApplicationAccessibility__iosAccessibilityAttributeValue_forParameter___block_invoke_2;
  v3[3] = &unk_265137158;
  long long v4 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v2, "getElementAtPoint:completion:", v3, *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __81__SafariUIApplicationAccessibility__iosAccessibilityAttributeValue_forParameter___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = AXLogAppAccessibility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl(&dword_2422FF000, v8, OS_LOG_TYPE_DEFAULT, "[Scribble] error getting element at point: %@", (uint8_t *)&v9, 0xCu);
  }

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

uint64_t __81__SafariUIApplicationAccessibility__iosAccessibilityAttributeValue_forParameter___block_invoke_403(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateScribbleControllerForElementAtPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (id)_getScribbleController
{
  objc_opt_class();
  id v3 = [(SafariUIApplicationAccessibility *)self _accessibilityMainBrowserController];
  long long v4 = __UIAccessibilityCastAsSafeCategory();

  BOOL v5 = [v4 accessibilityActiveTabDocument];
  id v6 = __UIAccessibilitySafeClass();

  id v7 = [v6 safeValueForKey:@"_sfScribbleController"];

  return v7;
}

@end