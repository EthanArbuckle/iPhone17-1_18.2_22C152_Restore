@interface _UIFindNavigatorViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnounceCurrentSearchResult;
- (void)_axAnnounceReplacementWithPreviousResultCount:(int64_t)a3 previousIndex:(int64_t)a4;
- (void)_axReloadElementRelations:(BOOL)a3;
- (void)_didEnterReplacementString:(id)a3;
- (void)_handleDone:(id)a3;
- (void)_handleHighlightPreviousResult:(id)a3;
- (void)_handleSearchReturn:(id)a3;
- (void)_performSearchWithQuery:(id)a3 options:(id)a4;
@end

@implementation _UIFindNavigatorViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIFindNavigatorViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  id v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UIFindNavigatorViewController";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v5 = "@";
  v4 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIFindNavigatorViewController", @"_handleSearchReturn:", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"_handleHighlightPreviousResult:", v4, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"_performSearchWithQuery:options:", v4, v5, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"_handleDone:", v4, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"findSession", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"findNavigatorView", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"_didEnterReplacementString:", v4, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIFindNavigatorView", @"searchTextField", v5, 0);
  v6 = @"UITextInput_Internal";
  int v7 = 1;
  objc_msgSend(location[0], "validateProtocol:hasMethod:isInstanceMethod:isRequired:");
  [location[0] validateProtocol:v6 hasMethod:@"_rangeOfSentenceEnclosingPosition:" isInstanceMethod:v7 & 1 isRequired:v7 & 1];
  objc_storeStrong(v9, v8);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIFindNavigatorViewControllerAccessibility;
  [(_UIFindNavigatorViewControllerAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
  [(_UIFindNavigatorViewControllerAccessibility *)v4 _axReloadElementRelations:1];
}

- (void)_handleSearchReturn:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)_UIFindNavigatorViewControllerAccessibility;
  [(_UIFindNavigatorViewControllerAccessibility *)&v3 _handleSearchReturn:location[0]];
  [(_UIFindNavigatorViewControllerAccessibility *)v5 _axReloadElementRelations:1];
  [(_UIFindNavigatorViewControllerAccessibility *)v5 _axAnnounceCurrentSearchResult];
  objc_storeStrong(location, 0);
}

- (void)_handleHighlightPreviousResult:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)_UIFindNavigatorViewControllerAccessibility;
  [(_UIFindNavigatorViewControllerAccessibility *)&v3 _handleHighlightPreviousResult:location[0]];
  [(_UIFindNavigatorViewControllerAccessibility *)v5 _axReloadElementRelations:1];
  [(_UIFindNavigatorViewControllerAccessibility *)v5 _axAnnounceCurrentSearchResult];
  objc_storeStrong(location, 0);
}

- (void)_performSearchWithQuery:(id)a3 options:(id)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  v5.receiver = v8;
  v5.super_class = (Class)_UIFindNavigatorViewControllerAccessibility;
  [(_UIFindNavigatorViewControllerAccessibility *)&v5 _performSearchWithQuery:location[0] options:v6];
  [(_UIFindNavigatorViewControllerAccessibility *)v8 _axReloadElementRelations:1];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)_handleDone:(id)a3
{
  objc_super v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)_UIFindNavigatorViewControllerAccessibility;
  [(_UIFindNavigatorViewControllerAccessibility *)&v3 _handleDone:location[0]];
  [(_UIFindNavigatorViewControllerAccessibility *)v5 _axReloadElementRelations:0];
  objc_storeStrong(location, 0);
}

- (void)_didEnterReplacementString:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v9 = 0;
  objc_opt_class();
  id v3 = (id)[(_UIFindNavigatorViewControllerAccessibility *)v12 safeValueForKey:@"findSession"];
  id v8 = (id)__UIAccessibilityCastAsClass();

  id v7 = v8;
  objc_storeStrong(&v8, 0);
  id v10 = v7;
  uint64_t v6 = [v7 resultCount];
  uint64_t v5 = [v10 highlightedResultIndex];
  v4.receiver = v12;
  v4.super_class = (Class)_UIFindNavigatorViewControllerAccessibility;
  [(_UIFindNavigatorViewControllerAccessibility *)&v4 _didEnterReplacementString:location[0]];
  [(_UIFindNavigatorViewControllerAccessibility *)v12 _axAnnounceReplacementWithPreviousResultCount:v6 previousIndex:v5];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)_axAnnounceReplacementWithPreviousResultCount:(int64_t)a3 previousIndex:(int64_t)a4
{
  v30 = self;
  SEL v29 = a2;
  int64_t v28 = a3;
  int64_t v27 = a4;
  char v25 = 0;
  objc_opt_class();
  id v16 = (id)[(_UIFindNavigatorViewControllerAccessibility *)v30 safeValueForKey:@"findSession"];
  id v24 = (id)__UIAccessibilityCastAsClass();

  id v23 = v24;
  objc_storeStrong(&v24, 0);
  id v26 = v23;
  id v22 = (id)[v23 replacementText];
  id v21 = (id)[v26 searchText];
  uint64_t v20 = [v26 resultCount];
  if ([v22 length] && objc_msgSend(v21, "length"))
  {
    id v19 = 0;
    if (v28 > 0 && v20 == v28 - 1 && v27 >= 0)
    {
      id v15 = (id)accessibilityUIKitLocalizedString();
      int64_t v11 = v27 + 1;
      int64_t v13 = v28;
      id v4 = (id)AXCFormattedString();
      id v5 = v19;
      id v19 = v4;
    }
    else if (v28 > 0 && !v20)
    {
      id v6 = (id)accessibilityUIKitLocalizedString();
      id v7 = v19;
      id v19 = v6;
    }
    if (objc_msgSend(v19, "length", v11, v13))
    {
      id v14 = (id)accessibilityUIKitLocalizedString();
      id v18 = (id)AXCFormattedString();

      id v12 = v18;
      id v8 = (id)__UIAXStringForVariables();
      id v9 = v19;
      id v19 = v8;

      id v10 = objc_alloc(MEMORY[0x263F21660]);
      id argument = (id)objc_msgSend(v10, "initWithStringOrAttributedString:", v19, v12, @"__AXStringForVariablesSentinel");
      [argument setAttribute:&unk_26F48EBA0 forKey:*MEMORY[0x263F216D8]];
      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
      objc_storeStrong(&argument, 0);
      objc_storeStrong(&v18, 0);
    }
    objc_storeStrong(&v19, 0);
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v26, 0);
}

- (void)_axAnnounceCurrentSearchResult
{
  v79 = self;
  v78[1] = (id)a2;
  char v77 = 0;
  objc_opt_class();
  id v16 = (id)[(_UIFindNavigatorViewControllerAccessibility *)v79 safeValueForKey:@"findSession"];
  id v76 = (id)__UIAccessibilityCastAsClass();

  id v75 = v76;
  objc_storeStrong(&v76, 0);
  v78[0] = v75;
  id v74 = (id)[v75 searchText];
  uint64_t v73 = [v78[0] resultCount];
  uint64_t v72 = [v78[0] highlightedResultIndex];
  if ([v74 length] && v73 > 0 && v72 >= 0)
  {
    id v71 = (id)[v78[0] _accessibilityElementForFindSessionResult];
    id v70 = 0;
    id v14 = (id)MEMORY[0x2455E6060](@"UITextInput_Internal");
    char v15 = 0;
    if (objc_msgSend(v71, "conformsToProtocol:")) {
      char v15 = [v71 conformsToProtocol:&unk_26F4BCAA8];
    }

    if (v15)
    {
      id v69 = v71;
      id v68 = (id)[v69 selectedTextRange];
      if (v68 && ([v68 isEmpty] & 1) == 0)
      {
        id v67 = (id)[v68 start];
        char v65 = 0;
        objc_opt_class();
        uint64_t v57 = 0;
        v58 = &v57;
        int v59 = 838860800;
        int v60 = 48;
        v61 = __Block_byref_object_copy__28;
        v62 = __Block_byref_object_dispose__28;
        id v63 = 0;
        uint64_t v50 = MEMORY[0x263EF8330];
        int v51 = -1073741824;
        int v52 = 0;
        v53 = __77___UIFindNavigatorViewControllerAccessibility__axAnnounceCurrentSearchResult__block_invoke;
        v54 = &unk_2650ADF88;
        v56[1] = &v57;
        id v55 = v71;
        v56[0] = v67;
        AXPerformSafeBlock();
        id v49 = (id)v58[5];
        objc_storeStrong(v56, 0);
        objc_storeStrong(&v55, 0);
        _Block_object_dispose(&v57, 8);
        objc_storeStrong(&v63, 0);
        id v64 = (id)__UIAccessibilityCastAsClass();

        if (v65) {
          abort();
        }
        id v48 = v64;
        objc_storeStrong(&v64, 0);
        id v66 = v48;
        id v47 = (id)[v69 textInRange:v48];
        char v45 = 0;
        char v43 = 0;
        LOBYTE(v13) = 0;
        if ([v47 length])
        {
          id v46 = (id)[v47 lowercaseString];
          char v45 = 1;
          id v44 = (id)[v74 lowercaseString];
          char v43 = 1;
          int v13 = objc_msgSend(v46, "isEqualToString:") ^ 1;
        }
        if (v43) {

        }
        if (v45) {
        if (v13)
        }
        {
          objc_storeStrong(&v70, v47);
        }
        else
        {
          char v41 = 0;
          objc_opt_class();
          uint64_t v33 = 0;
          v34 = &v33;
          int v35 = 838860800;
          int v36 = 48;
          v37 = __Block_byref_object_copy__28;
          v38 = __Block_byref_object_dispose__28;
          id v39 = 0;
          uint64_t v26 = MEMORY[0x263EF8330];
          int v27 = -1073741824;
          int v28 = 0;
          SEL v29 = __77___UIFindNavigatorViewControllerAccessibility__axAnnounceCurrentSearchResult__block_invoke_2;
          v30 = &unk_2650ADF88;
          v32[1] = &v33;
          id v31 = v71;
          v32[0] = v67;
          AXPerformSafeBlock();
          id v25 = (id)v34[5];
          objc_storeStrong(v32, 0);
          objc_storeStrong(&v31, 0);
          _Block_object_dispose(&v33, 8);
          objc_storeStrong(&v39, 0);
          id v40 = (id)__UIAccessibilityCastAsClass();

          if (v41) {
            abort();
          }
          id v24 = v40;
          objc_storeStrong(&v40, 0);
          id v42 = v24;
          id v23 = (id)[v69 textInRange:v24];
          if ([v23 length]) {
            objc_storeStrong(&v70, v23);
          }
          objc_storeStrong(&v23, 0);
          objc_storeStrong(&v42, 0);
        }
        objc_storeStrong(&v47, 0);
        objc_storeStrong(&v66, 0);
        objc_storeStrong(&v67, 0);
      }
      objc_storeStrong(&v68, 0);
      objc_storeStrong(&v69, 0);
    }
    if (!v70)
    {
      uint64_t v21 = [v71 _accessibilitySelectedTextRange];
      uint64_t v22 = v2;
      uint64_t v93 = 0x7FFFFFFFLL;
      uint64_t v92 = 0;
      uint64_t v94 = 0x7FFFFFFFLL;
      uint64_t v95 = 0;
      v20[2] = 0x7FFFFFFFLL;
      v20[3] = 0;
      uint64_t v86 = 0x7FFFFFFFLL;
      uint64_t v87 = 0;
      uint64_t v84 = v21;
      uint64_t v85 = v2;
      BOOL v12 = 0;
      if (v21 == 0x7FFFFFFF) {
        BOOL v12 = v87 == v85;
      }
      if (!v12 && v22)
      {
        v20[0] = [v71 _accessibilityLineRangeForPosition:v21];
        v20[1] = v3;
        uint64_t v89 = 0x7FFFFFFFLL;
        uint64_t v88 = 0;
        uint64_t v90 = 0x7FFFFFFFLL;
        uint64_t v91 = 0;
        v19[1] = (id)0x7FFFFFFF;
        v19[2] = 0;
        uint64_t v82 = 0x7FFFFFFFLL;
        uint64_t v83 = 0;
        uint64_t v80 = v20[0];
        uint64_t v81 = v3;
        BOOL v11 = 0;
        if (v20[0] == 0x7FFFFFFFLL) {
          BOOL v11 = v83 == v81;
        }
        if (!v11)
        {
          v19[0] = (id)[v71 _accessibilityAttributedValueForRange:v20];
          if ([v19[0] length])
          {
            id v4 = (id)[v19[0] string];
            id v5 = v70;
            id v70 = v4;
          }
          objc_storeStrong(v19, 0);
        }
      }
    }
    id v10 = (id)accessibilityUIKitLocalizedString();
    id v18 = (id)AXCFormattedString();

    id v9 = v70;
    id v6 = (id)__UIAXStringForVariables();
    id v7 = v70;
    id v70 = v6;

    if (objc_msgSend(v70, "length", v9, @"__AXStringForVariablesSentinel"))
    {
      id v8 = objc_alloc(MEMORY[0x263F21660]);
      id argument = (id)[v8 initWithStringOrAttributedString:v70];
      [argument setAttribute:&unk_26F48EBA0 forKey:*MEMORY[0x263F216D8]];
      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
      objc_storeStrong(&argument, 0);
    }
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v70, 0);
    objc_storeStrong(&v71, 0);
  }
  objc_storeStrong(&v74, 0);
  objc_storeStrong(v78, 0);
}

- (void)_axReloadElementRelations:(BOOL)a3
{
  id v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  id v5 = (id)[(_UIFindNavigatorViewControllerAccessibility *)self safeValueForKeyPath:@"findNavigatorView.searchTextField"];
  if (v5)
  {
    UIAccessibilityUnrelateAllElements();
    if (v6)
    {
      id v3 = (id)[(_UIFindNavigatorViewControllerAccessibility *)v8 safeValueForKey:@"findSession"];
      id location = (id)[v3 _accessibilityElementForFindSessionResult];

      if (location) {
        UIAccessibilityRelateElements();
      }
      objc_storeStrong(&location, 0);
    }
  }
  objc_storeStrong(&v5, 0);
}

@end