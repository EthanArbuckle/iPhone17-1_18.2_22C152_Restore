@interface UITableViewIndexAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_updateSectionForTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_accessibilityDisplayTitle;
- (id)_accessibilityIndexData;
- (id)_accessibilityKeyCommands;
- (id)_accessibilityTableIndexTitles;
- (id)_accessibilityValueToPost:(uint64_t)a1;
- (id)_axDetermineTableCellLabel:(id)a3;
- (id)accessibilityFlowToElements;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (int64_t)_accessibilitySortPriority;
- (int64_t)_accessibilityTableIndexAdjustment;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityBumpValue:(void *)a1;
- (void)_accessibilityJumpToTableIndex:(id)a3;
- (void)_accessibilityMoveToIndexAtPosition:(void *)a1;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation UITableViewIndexAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITableViewIndex";
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
  v7 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIControl", @"_sendActionsForEvents:withEvent:", "v", "Q", "@", 0);
  v6 = @"UITableViewIndex";
  [location[0] validateClass:v7 hasInstanceMethod:v7 withFullSignature:0];
  v4 = "q";
  v3 = @"_sectionIndexChangedToIndex:title:";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionView", "q", v7, 0);
  v5 = @"UITableView";
  [location[0] validateClass:v4 hasInstanceMethod:v7 withFullSignature:0];
  [location[0] validateClass:v5 hasInstanceVariable:@"_sectionIndexTitlesForTableView" withType:"NSArray"];
  [location[0] validateClass:v6 isKindOfClass:@"UIView"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"titles", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"_displayTitles", v7, 0);
  objc_storeStrong(v9, v8);
}

- (id)_accessibilityIndexData
{
  id v4 = a1;
  if (a1)
  {
    id v3 = (id)[v4 _accessibilityValueForKey:@"AXInternalData"];
    if (!v3)
    {
      id v3 = (id)[objc_allocWithZone(MEMORY[0x263EFF9A0]) init];

      [v4 _accessibilitySetRetainedValue:v3 forKey:@"AXInternalData"];
    }
    id v5 = v3;
    objc_storeStrong(&v3, 0);
  }
  else
  {
    id v5 = 0;
  }
  v1 = v5;

  return v1;
}

- (int64_t)_accessibilityTableIndexAdjustment
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITableViewIndexAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  id v6 = (id)[location[0] delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v4 = (id)[location[0] safeValueForKey:@"delegate"];
    id v3 = (id)[v4 safeValueForKey:@"_accessibilityTableViewIndexAdjustment"];
    uint64_t v5 = [v3 integerValue];

    int64_t v9 = v5;
  }
  else
  {
    int64_t v9 = 0;
  }
  objc_storeStrong(location, 0);
  return v9;
}

- (id)_accessibilityTableIndexTitles
{
  return (id)[(UITableViewIndexAccessibility *)self safeArrayForKey:@"titles", a2, self];
}

- (void)_accessibilityJumpToTableIndex:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] length])
  {
    uint64_t v11 = [location[0] rangeOfComposedCharacterSequenceAtIndex:0];
    uint64_t v12 = v3;
    id v4 = (id)objc_msgSend(location[0], "substringWithRange:", v11, v3);
    id v5 = location[0];
    location[0] = v4;
  }
  id v10 = (id)[(UITableViewIndexAccessibility *)v14 safeArrayForKey:@"titles"];
  id v7 = (id)[location[0] uppercaseString];
  uint64_t v8 = objc_msgSend(v10, "indexOfObject:");

  int64_t v9 = (void *)v8;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL
    || (id v6 = (id)[location[0] lowercaseString],
        int64_t v9 = objc_msgSend(v10, "indexOfObject:"),
        v6,
        v9 != (void *)0x7FFFFFFFFFFFFFFFLL))
  {
    -[UITableViewIndexAccessibility _accessibilityMoveToIndexAtPosition:](v14, v9);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityMoveToIndexAtPosition:(void *)a1
{
  v24 = a1;
  v23 = a2;
  if (a1)
  {
    id v22 = -[UITableViewIndexAccessibility _accessibilityIndexData](v24);
    id v21 = (id)[v24 safeArrayForKey:@"titles"];
    unint64_t v20 = (unint64_t)v23 + [v24 _accessibilityTableIndexAdjustment];
    if ((uint64_t)v23 < 0 || (uint64_t)v23 >= [v21 count])
    {
      _UIAccessibilitySetAssociatedElementContextForNextNotification();
      UIAccessibilityPostNotification(*MEMORY[0x263F812E8], 0);
    }
    else
    {
      id v19 = 0;
      if (v20 < [v21 count])
      {
        id v2 = (id)[v21 objectAtIndex:v20];
        id v3 = v19;
        id v19 = v2;
      }
      id v18 = -[UITableViewIndexAccessibility _accessibilityValueToPost:]((uint64_t)v24, v19);
      id v6 = (id)[NSNumber numberWithInteger:v23];
      objc_msgSend(v22, "setObject:forKey:");

      id v7 = (id)[NSNumber numberWithInteger:v23];
      objc_msgSend(v24, "setValue:forKey:");

      v12[1] = (id)MEMORY[0x263EF8330];
      int v13 = -1073741824;
      int v14 = 0;
      v15 = __69__UITableViewIndexAccessibility__accessibilityMoveToIndexAtPosition___block_invoke;
      v16 = &unk_2650ADF18;
      id v17 = v24;
      AXPerformSafeBlock();
      id v8 = (id)[v24 traitCollection];
      BOOL v9 = [v8 userInterfaceIdiom] != 3;

      if (!v9)
      {
        v12[0] = (id)[v24 _accessibilityFindViewAncestor:&__block_literal_global_40 startWithSelf:0];
        if (v12[0])
        {
          if (objc_opt_respondsToSelector())
          {
            id v10 = v12[0];
            v11[1] = v23;
            v11[0] = v18;
            AXPerformSafeBlock();
            objc_storeStrong(v11, 0);
            objc_storeStrong(&v10, 0);
          }
        }
        objc_storeStrong(v12, 0);
      }
      id v4 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v18];
      id v5 = v18;
      id v18 = v4;

      [v18 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F216C0]];
      _UIAccessibilitySetAssociatedElementContextForNextNotification();
      UIAccessibilityPostNotification(*MEMORY[0x263F812E8], v18);
      objc_storeStrong(&v17, 0);
      objc_storeStrong(&v18, 0);
      objc_storeStrong(&v19, 0);
    }
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v22, 0);
  }
}

- (void)_accessibilityBumpValue:(void *)a1
{
  id v6 = a1;
  char v5 = a2 & 1;
  if (a1)
  {
    id location = -[UITableViewIndexAccessibility _accessibilityIndexData](v6);
    id v2 = (id)[location objectForKey:@"position"];
    uint64_t v3 = [v2 integerValue];

    if (v5) {
      -[UITableViewIndexAccessibility _accessibilityMoveToIndexAtPosition:](v6, (void *)(v3 + 1));
    }
    else {
      -[UITableViewIndexAccessibility _accessibilityMoveToIndexAtPosition:](v6, (void *)(v3 - 1));
    }
    objc_storeStrong(&location, 0);
  }
}

- (id)_accessibilityValueToPost:(uint64_t)a1
{
  uint64_t v9 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v9)
  {
    id v6 = (id)[location _accessibilityAXAttributedLabel];
    if (![v6 length])
    {
      if ([location isEqualToString:*MEMORY[0x263F1D610]]) {
        id v2 = accessibilityLocalizedString(@"search.button");
      }
      else {
        id v2 = (id)[location lowercaseString];
      }
      id v3 = v6;
      id v6 = v2;
    }
    id v10 = v6;
    int v7 = 1;
    objc_storeStrong(&v6, 0);
  }
  else
  {
    id v10 = 0;
    int v7 = 1;
  }
  objc_storeStrong(&location, 0);
  id v4 = v10;

  return v4;
}

uint64_t __69__UITableViewIndexAccessibility__accessibilityMoveToIndexAtPosition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendActionsForEvents:withEvent:", 4096, 0, a1, a1);
}

uint64_t __69__UITableViewIndexAccessibility__accessibilityMoveToIndexAtPosition___block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  char isKindOfClass = 1;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

uint64_t __69__UITableViewIndexAccessibility__accessibilityMoveToIndexAtPosition___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sectionIndexChangedToIndex:title:", *(void *)(a1 + 48), *(void *)(a1 + 40), a1, a1);
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (CGPoint)accessibilityActivationPoint
{
  [(UITableViewIndexAccessibility *)self bounds];
  UIAccessibilityPointForPoint();
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)_axDetermineTableCellLabel:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = (id)[location[0] accessibilityLabel];
  if (![v10 length])
  {
    id v3 = (id)[location[0] accessibilityValue];
    id v4 = v10;
    id v10 = v3;
  }
  if (![v10 length])
  {
    id v9 = (id)[location[0] textLabel];
    id v5 = (id)[v9 text];
    id v6 = v10;
    id v10 = v5;
  }
  if ([v10 length]) {
    id v12 = (id)[v10 lowercaseString];
  }
  else {
    id v12 = 0;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  int v7 = v12;

  return v7;
}

- (id)accessibilityFlowToElements
{
  v122[1] = *MEMORY[0x263EF8340];
  v115 = self;
  v114[1] = (id)a2;
  v114[0] = (id)[(UITableViewIndexAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  if ([v114[0] isAccessibilityOpaqueElementProvider])
  {
    [v114[0] _accessibilityVisibleContentInset];
    double v110 = v2;
    uint64_t v111 = v3;
    uint64_t v112 = v4;
    uint64_t v113 = v5;
    [v114[0] _accessibilityContentOffset];
    v108[1] = v6;
    double v109 = v7;
    v108[0] = (id)[v114[0] tableHeaderView];
    if (!v108[0]) {
      goto LABEL_8;
    }
    [v114[0] adjustedContentInset];
    double v104 = v8;
    uint64_t v105 = v9;
    uint64_t v106 = v10;
    uint64_t v107 = v11;
    double v61 = v8 + v109;
    [v108[0] frame];
    CGRect rect = v124;
    if (v61 >= CGRectGetMaxY(v124)) {
      goto LABEL_8;
    }
    id location = (id)objc_msgSend(v108[0], "_accessibilityUnignoredDescendant", v61);
    if (location)
    {
      v122[0] = location;
      id v116 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v122 count:1];
      int v101 = 1;
    }
    else
    {
      int v101 = 0;
    }
    objc_storeStrong(&location, 0);
    if (!v101)
    {
LABEL_8:
      id v100 = (id)[v114[0] safeArrayForKey:@"_sectionIndexTitlesForTableView"];
      id v99 = -[UITableViewIndexAccessibility _accessibilityIndexData](v115);
      id v59 = (id)[v99 objectForKey:@"position"];
      uint64_t v60 = [v59 integerValue];

      uint64_t v98 = v60;
      if ([v100 count] && v98 >= 0 && v98 < (unint64_t)objc_msgSend(v100, "count"))
      {
        id v58 = (id)[v100 objectAtIndexedSubscript:v98];
        id v97 = (id)[v58 lowercaseString];

        unsigned __int16 v96 = 0;
        if ([v97 length]) {
          unsigned __int16 v57 = [v97 characterAtIndex:0];
        }
        else {
          unsigned __int16 v57 = 0;
        }
        unsigned __int16 v96 = v57;
        if (v57)
        {
          id v95 = 0;
          id v55 = (id)[v114[0] visibleCells];
          uint64_t v56 = [v55 count];

          uint64_t v94 = v56;
          if (v56)
          {
            for (uint64_t i = 0; i < v94; ++i)
            {
              id v54 = (id)[v114[0] visibleCells];
              id obj = (id)[v54 objectAtIndexedSubscript:i];

              double v91 = 0.0;
              [obj frame];
              CGRect v90 = v125;
              double v91 = CGRectGetMinY(v125) - v109;
              if (v91 < v110
                || ((v89 = -[UITableViewIndexAccessibility _axDetermineTableCellLabel:](v115, "_axDetermineTableCellLabel:", obj), v88 = 0, ![v89 length])? (unsigned __int16 v53 = 0): (unsigned __int16 v53 = objc_msgSend(v89, "characterAtIndex:", 0)), (v88 = v53) == 0 || v88 != v96? (v88 <= (int)v96? (v101 = 0): (v101 = 2)): (objc_storeStrong(&v95, obj), v101 = 2), objc_storeStrong(&v89, 0), !v101))
              {
                int v101 = 0;
              }
              objc_storeStrong(&obj, 0);
              if (v101) {
                break;
              }
            }
            if (!v95)
            {
              uint64_t v87 = 0;
              if (i) {
                uint64_t v52 = i - 1;
              }
              else {
                uint64_t v52 = 0;
              }
              uint64_t v87 = v52;
              id v51 = (id)[v114[0] visibleCells];
              id v12 = (id)[v51 objectAtIndexedSubscript:v52];
              id v13 = v95;
              id v95 = v12;
            }
            id v86 = (id)[v95 _accessibilityFindDescendant:&__block_literal_global_362];
            if (v86)
            {
              id v121 = v86;
              id v116 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v121 count:1];
            }
            else
            {
              id v116 = MEMORY[0x263EFFA68];
            }
            int v101 = 1;
            objc_storeStrong(&v86, 0);
          }
          else
          {
            id v116 = MEMORY[0x263EFFA68];
            int v101 = 1;
          }
          objc_storeStrong(&v95, 0);
        }
        else
        {
          id v116 = MEMORY[0x263EFFA68];
          int v101 = 1;
        }
        objc_storeStrong(&v97, 0);
      }
      else
      {
        id v85 = 0;
        memset(__b, 0, sizeof(__b));
        id v49 = (id)[v114[0] visibleCells];
        uint64_t v50 = [v49 countByEnumeratingWithState:__b objects:v120 count:16];
        if (v50)
        {
          uint64_t v46 = *(void *)__b[2];
          uint64_t v47 = 0;
          unint64_t v48 = v50;
          while (1)
          {
            uint64_t v45 = v47;
            if (*(void *)__b[2] != v46) {
              objc_enumerationMutation(v49);
            }
            id v84 = *(id *)(__b[1] + 8 * v47);
            [v84 frame];
            CGRect v81 = v126;
            double v82 = CGRectGetMinY(v126) - v109;
            if (v82 >= v110) {
              break;
            }
            ++v47;
            if (v45 + 1 >= v48)
            {
              uint64_t v47 = 0;
              unint64_t v48 = [v49 countByEnumeratingWithState:__b objects:v120 count:16];
              if (!v48) {
                goto LABEL_53;
              }
            }
          }
          objc_storeStrong(&v85, v84);
          int v101 = 5;
        }
        else
        {
LABEL_53:
          int v101 = 0;
        }

        id v80 = (id)[v85 _accessibilityFindDescendant:&__block_literal_global_364];
        if (v80 == v115)
        {
          id v79 = (id)[v114[0] _accessibilitySortedElementsWithin];
          v43 = (UITableViewIndexAccessibility *)(id)[v79 firstObject];
          BOOL v44 = 0;
          if (v43 == v115) {
            BOOL v44 = (unint64_t)[v79 count] > 1;
          }

          if (v44)
          {
            id v42 = (id)[v79 objectAtIndexedSubscript:1];
            id v14 = (id)[v42 _accessibilityUnignoredDescendant];
            id v15 = v80;
            id v80 = v14;
          }
          objc_storeStrong(&v79, 0);
        }
        id v116 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v80);
        int v101 = 1;
        objc_storeStrong(&v80, 0);
        objc_storeStrong(&v85, 0);
      }
      objc_storeStrong(&v99, 0);
      objc_storeStrong(&v100, 0);
    }
    objc_storeStrong(v108, 0);
  }
  else
  {
    id v78 = (id)[v114[0] safeValueForKey:@"_accessibilityVisibleHeaderSections"];
    if (![v78 count]) {
      goto LABEL_74;
    }
    [v114[0] adjustedContentInset];
    double v73 = v16;
    uint64_t v74 = v17;
    uint64_t v75 = v18;
    uint64_t v76 = v19;
    double v77 = v16;
    [v114[0] contentOffset];
    uint64_t v70 = v20;
    double v71 = v21;
    double v72 = v21;
    memset(v68, 0, sizeof(v68));
    id v40 = v78;
    uint64_t v41 = [v40 countByEnumeratingWithState:v68 objects:v119 count:16];
    if (v41)
    {
      uint64_t v37 = *(void *)v68[2];
      uint64_t v38 = 0;
      unint64_t v39 = v41;
      while (1)
      {
        uint64_t v36 = v38;
        if (*(void *)v68[2] != v37) {
          objc_enumerationMutation(v40);
        }
        id v69 = *(id *)(v68[1] + 8 * v38);
        [v114[0] rectForHeaderInSection:-[UITableViewSectionElement section]((uint64_t)v69)];
        v67[1] = v22;
        v67[2] = v23;
        v67[3] = v24;
        v67[4] = v25;
        if (*(double *)&v23 - (v72 + v77) >= 0.0) {
          break;
        }
        ++v38;
        if (v36 + 1 >= v39)
        {
          uint64_t v38 = 0;
          unint64_t v39 = [v40 countByEnumeratingWithState:v68 objects:v119 count:16];
          if (!v39) {
            goto LABEL_72;
          }
        }
      }
      v67[0] = v69;
      v34 = (void *)MEMORY[0x263EFF980];
      id v35 = -[UITableViewSectionElement accessibilityChildren]((id *)v67[0]);
      id v66 = (id)objc_msgSend(v34, "arrayWithArray:");

      [v66 insertObject:v67[0] atIndex:0];
      id v116 = v66;
      int v101 = 1;
      objc_storeStrong(&v66, 0);
      objc_storeStrong(v67, 0);
    }
    else
    {
LABEL_72:
      int v101 = 0;
    }

    if (!v101)
    {
LABEL_74:
      id v65 = (id)[v114[0] safeValueForKey:@"_accessibilityUserTestingVisibleCells"];
      if (![v65 count]) {
        goto LABEL_88;
      }
      memset(v63, 0, sizeof(v63));
      id v32 = v65;
      uint64_t v33 = [v32 countByEnumeratingWithState:v63 objects:v118 count:16];
      if (v33)
      {
        uint64_t v29 = *(void *)v63[2];
        uint64_t v30 = 0;
        unint64_t v31 = v33;
        while (1)
        {
          uint64_t v28 = v30;
          if (*(void *)v63[2] != v29) {
            objc_enumerationMutation(v32);
          }
          id v64 = *(id *)(v63[1] + 8 * v30);
          if (([v64 _accessibilityIsFrameOutOfBounds] & 1) == 0)
          {
            id v62 = (id)[v64 _accessibilityUnignoredDescendant];
            if (v62)
            {
              id v117 = v62;
              id v116 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v117 count:1];
              int v101 = 1;
            }
            else
            {
              int v101 = 10;
            }
            objc_storeStrong(&v62, 0);
            if (v101 != 10) {
              break;
            }
          }
          ++v30;
          if (v28 + 1 >= v31)
          {
            uint64_t v30 = 0;
            unint64_t v31 = [v32 countByEnumeratingWithState:v63 objects:v118 count:16];
            if (!v31) {
              goto LABEL_86;
            }
          }
        }
      }
      else
      {
LABEL_86:
        int v101 = 0;
      }

      if (!v101)
      {
LABEL_88:
        id v116 = 0;
        int v101 = 1;
      }
      objc_storeStrong(&v65, 0);
    }
    objc_storeStrong(&v78, 0);
  }
  objc_storeStrong(v114, 0);
  v26 = v116;

  return v26;
}

uint64_t __60__UITableViewIndexAccessibility_accessibilityFlowToElements__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v3 = [location[0] isAccessibilityElement];
  objc_storeStrong(location, 0);
  return v3 & 1;
}

uint64_t __60__UITableViewIndexAccessibility_accessibilityFlowToElements__block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v3 = [location[0] isAccessibilityElement];
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (BOOL)_updateSectionForTouch:(id)a3 withEvent:(id)a4
{
  uint64_t v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = 0;
  objc_storeStrong(&v31, a4);
  char v30 = 0;
  v29.receiver = v33;
  v29.super_class = (Class)UITableViewIndexAccessibility;
  char v30 = [(UITableViewIndexAccessibility *)&v29 _updateSectionForTouch:location[0] withEvent:v31];
  if (v30)
  {
    id v28 = (id)[(UITableViewIndexAccessibility *)v33 safeValueForKey:@"selectedSectionTitle"];
    id v27 = (id)[(UITableViewIndexAccessibility *)v33 _accessibilityViewAncestorIsKindOf:objc_opt_class()];
    id v19 = (id)[v27 delegate];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      id v26 = (id)[(UITableViewIndexAccessibility *)v33 safeArrayForKey:@"titles"];
      id v17 = (id)[v27 safeValueForKey:@"delegate"];
      id v16 = (id)[v17 safeValueForKey:@"_accessibilityTableViewIndexAdjustment"];
      uint64_t v18 = [v16 integerValue];

      uint64_t v25 = v18;
      if (v18 > 0)
      {
        id v14 = (id)[(UITableViewIndexAccessibility *)v33 safeValueForKey:@"_selectedSection"];
        uint64_t v15 = [v14 integerValue];

        uint64_t v24 = v15;
        if (v15 + v25 < (unint64_t)[v26 count])
        {
          id v4 = (id)[v26 objectAtIndex:v24 + v25];
          id v5 = v28;
          id v28 = v4;
        }
      }
      objc_storeStrong(&v26, 0);
    }
    if ([v28 length] && v28 != (id)_updateSectionForTouch_withEvent__LastLetter)
    {
      id v23 = -[UITableViewIndexAccessibility _accessibilityValueToPost:]((uint64_t)v33, v28);
      id v6 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v23];
      id v7 = v23;
      id v23 = v6;

      [v23 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F216C0]];
      _UIAccessibilitySetAssociatedElementContextForNextNotification();
      UIAccessibilityPostNotification(*MEMORY[0x263F812E8], v23);
      objc_storeStrong(&v23, 0);
    }
    objc_storeStrong((id *)&_updateSectionForTouch_withEvent__LastLetter, v28);
    id v22 = -[UITableViewIndexAccessibility _accessibilityIndexData](v33);
    id v10 = (id)[(UITableViewIndexAccessibility *)v33 safeValueForKey:@"_selectedSection"];
    uint64_t v11 = [v10 integerValue];

    id v12 = v22;
    id v13 = (id)[NSNumber numberWithInteger:v11];
    objc_msgSend(v12, "setObject:forKey:");

    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
  }
  char v9 = v30;
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
  return v9 & 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"section.index.label");
}

- (id)accessibilityUserInputLabels
{
  v8[3] = *MEMORY[0x263EF8340];
  id v6 = accessibilityLocalizedString(@"section.index.label");
  v8[0] = v6;
  id v5 = accessibilityLocalizedString(@"scroll.bar");
  v8[1] = v5;
  id v3 = [(UITableViewIndexAccessibility *)self _accessibilityDisplayTitle];
  v8[2] = v3;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];

  return v4;
}

- (id)_accessibilityDisplayTitle
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18[2] = self;
  v18[1] = (id)a2;
  v18[0] = (id)[(UITableViewIndexAccessibility *)self safeArrayForKey:@"_displayTitles"];
  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  memset(__b, 0, sizeof(__b));
  id obj = v18[0];
  uint64_t v13 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
  if (v13)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0;
    unint64_t v11 = v13;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(id *)(__b[1] + 8 * v10);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v16;
        if ([v14 isEqualToString:@"•"])
        {
          id v2 = accessibilityLocalizedString(@"scroll.bar.to");
          id v3 = v14;
          id v14 = v2;
        }
        if ([v14 isEqualToString:@"#"])
        {
          id v4 = accessibilityLocalizedString(@"scroll.bar.hashtag");
          id v5 = v14;
          id v14 = v4;
        }
        [v17 addObject:v14];
        objc_storeStrong(&v14, 0);
      }
      ++v10;
      if (v8 + 1 >= v11)
      {
        uint64_t v10 = 0;
        unint64_t v11 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  id v7 = (id)[v17 componentsJoinedByString:@" "];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);

  return v7;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v6 = 0;
  id v3 = (id)[(UITableViewIndexAccessibility *)self accessibilityContainer];
  uint64_t v5 = [v3 accessibilityTraits];
  uint64_t v4 = *MEMORY[0x263F21A20];

  if ((v5 & v4) != 0) {
    uint64_t v6 = *MEMORY[0x263F21A20];
  }
  return *MEMORY[0x263F81400] | *MEMORY[0x263F1CED8] | v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (int64_t)_accessibilitySortPriority
{
  return 1;
}

- (id)_accessibilityKeyCommands
{
  v6[2] = *MEMORY[0x263EF8340];
  id v5 = (id)objc_msgSend(MEMORY[0x263F1C708], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x263F1D3E8]);
  v6[0] = v5;
  id v3 = (id)[MEMORY[0x263F1C708] keyCommandWithInput:*MEMORY[0x263F1D3C8] modifierFlags:0 action:sel_accessibilityDecrement];
  v6[1] = v3;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

@end