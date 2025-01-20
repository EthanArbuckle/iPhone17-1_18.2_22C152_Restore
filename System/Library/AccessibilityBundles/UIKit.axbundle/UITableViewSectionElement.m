@interface UITableViewSectionElement
- (BOOL)_accessibilityIsNotFirstElement;
- (BOOL)accessibilityScrollToVisible;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (UITableViewSectionElement)initWithAccessibilityContainer:(id)a3;
- (id)_accessibilityAccessibleElementsInView:(void *)a1;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_textChildWithTitle:(id)a3;
- (id)accessibilityChildren;
- (id)accessibilityElements;
- (id)accessibilityIdentifier;
- (id)description;
- (uint64_t)isHeader;
- (uint64_t)section;
- (uint64_t)setIsHeader:(uint64_t)result;
- (uint64_t)setSection:(uint64_t)result;
- (void)_acccessibilityClearChildCache;
- (void)_accessibilityClearChildren;
- (void)accessibilityScrollToVisibleWithChild:(id)a3;
- (void)dealloc;
- (void)updateMockView:(id)a3;
@end

@implementation UITableViewSectionElement

- (UITableViewSectionElement)initWithAccessibilityContainer:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)UITableViewSectionElement;
  v9 = [(UITableViewSectionElement *)&v7 initWithAccessibilityContainer:location[0]];
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    id v6 = (id)[MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v9 selector:sel__acccessibilityClearChildCache name:*MEMORY[0x263F8B0A0] object:0];
  }
  v5 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (BOOL)_accessibilityIsNotFirstElement
{
  return 1;
}

- (id)_accessibilityAccessibleElementsInView:(void *)a1
{
  id v11 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v11)
  {
    if (location)
    {
      id v8 = (id)[MEMORY[0x263EFF980] arrayWithObject:location];
      id v7 = (id)[MEMORY[0x263EFF980] array];
      while ([v8 count])
      {
        id v6 = (id)[v8 lastObject];
        [v8 removeLastObject];
        if (([v6 isAccessibilityElement] & 1) != 0
          || ([v6 _accessibilityHasOrderedChildren] & 1) != 0)
        {
          [v7 addObject:v6];
        }
        else
        {
          id v4 = v8;
          id v5 = (id)[v6 subviews];
          objc_msgSend(v4, "addObjectsFromArray:");
        }
        objc_storeStrong(&v6, 0);
      }
      [v11 _accessibilitySortElementsUsingGeometry:v7];
      id v12 = v7;
      int v9 = 1;
      objc_storeStrong(&v7, 0);
      objc_storeStrong(&v8, 0);
    }
    else
    {
      id v12 = 0;
      int v9 = 1;
    }
  }
  else
  {
    id v12 = 0;
    int v9 = 1;
  }
  objc_storeStrong(&location, 0);
  v2 = v12;

  return v2;
}

- (void)_acccessibilityClearChildCache
{
}

- (void)_accessibilityClearChildren
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v10 = a1;
  if (a1)
  {
    memset(__b, 0, sizeof(__b));
    id obj = *(id *)(v10 + 72);
    uint64_t v6 = [obj countByEnumeratingWithState:__b objects:v11 count:16];
    if (v6)
    {
      uint64_t v2 = *(void *)__b[2];
      uint64_t v3 = 0;
      unint64_t v4 = v6;
      while (1)
      {
        uint64_t v1 = v3;
        if (*(void *)__b[2] != v2) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(id *)(__b[1] + 8 * v3);
        [v9 setAccessibilityContainer:0];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v7 = (id *)v9;
          -[UIAccessibilityElementMockView setDelegate:](v7, 0);
          -[UIAccessibilityElementMockView setView:](v7, 0);
          objc_storeStrong((id *)&v7, 0);
        }
        ++v3;
        if (v1 + 1 >= v4)
        {
          uint64_t v3 = 0;
          unint64_t v4 = [obj countByEnumeratingWithState:__b objects:v11 count:16];
          if (!v4) {
            break;
          }
        }
      }
    }
  }
}

- (void)dealloc
{
  id v5 = self;
  SEL v4 = a2;
  id v2 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v2 removeObserver:v5 name:*MEMORY[0x263F8B0A0] object:0];

  -[UITableViewSectionElement _accessibilityClearChildren]((uint64_t)v5);
  v3.receiver = v5;
  v3.super_class = (Class)UITableViewSectionElement;
  [(UITableViewSectionElement *)&v3 dealloc];
}

- (CGRect)accessibilityFrame
{
  v24 = self;
  v23[1] = (id)a2;
  v23[0] = (id)[(UITableViewSectionElement *)self accessibilityContainer];
  v22 = (void *)-[UITableViewSectionElement section]((uint64_t)v24);
  if ((uint64_t)v22 < [v23[0] numberOfSections])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v12 = 0;
    v13 = &v12;
    int v14 = 0x10000000;
    int v15 = 64;
    v16 = &unk_24046C852;
    long long v17 = 0u;
    long long v18 = 0u;
    v11[1] = &v12;
    uint64_t v10 = v24;
    v11[0] = v23[0];
    v11[2] = v22;
    AXPerformSafeBlock();
    long long v19 = *((_OWORD *)v13 + 2);
    long long v20 = *((_OWORD *)v13 + 3);
    objc_storeStrong(v11, 0);
    objc_storeStrong((id *)&v10, 0);
    _Block_object_dispose(&v12, 8);
    UIAccessibilityFrameForBounds();
    *(void *)&long long v25 = v2;
    *((void *)&v25 + 1) = v3;
    *(void *)&long long v26 = v4;
    *((void *)&v26 + 1) = v5;
  }
  else
  {
    long long v25 = *MEMORY[0x263F001A8];
    long long v26 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  }
  int v21 = 1;
  objc_storeStrong(v23, 0);
  double v7 = *((double *)&v25 + 1);
  double v6 = *(double *)&v25;
  double v9 = *((double *)&v26 + 1);
  double v8 = *(double *)&v26;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (uint64_t)section
{
  if (a1) {
    return *(void *)(a1 + 64);
  }
  else {
    return 0;
  }
}

__n128 __47__UITableViewSectionElement_accessibilityFrame__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 56)) {
    [*(id *)(a1 + 40) _floatingRectForHeaderInSection:*(void *)(a1 + 56) heightCanBeGuessed:0];
  }
  else {
    [*(id *)(a1 + 40) _floatingRectForFooterInSection:*(void *)(a1 + 56) heightCanBeGuessed:0];
  }
  *(void *)&long long v8 = v1;
  *((void *)&v8 + 1) = v2;
  v9.n128_u64[0] = v3;
  v9.n128_u64[1] = v4;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  *(_OWORD *)(v5 + 32) = v8;
  __n128 result = v9;
  *(__n128 *)(v5 + 48) = v9;
  return result;
}

- (id)_textChildWithTitle:(id)a3
{
  int v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = location[0];
  id v9 = (id)[MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v8 = (id)objc_msgSend(v7, "stringByTrimmingCharactersInSet:");
  BOOL v10 = [v8 length] == 0;

  if (v10)
  {
    int v15 = 0;
  }
  else
  {
    unint64_t v3 = [UITableSectionPart alloc];
    uint64_t v12 = [(UITableSectionPart *)v3 initWithAccessibilityContainer:v14];
    [(UITableSectionPart *)v12 setAccessibilityLabel:location[0]];
    uint64_t v11 = *MEMORY[0x263F1CF48];
    if (v14->_isHeader) {
      v11 |= *MEMORY[0x263F1CEF8];
    }
    -[UITableSectionPart setAccessibilityTraits:](v12, "setAccessibilityTraits:", v11, &v12);
    int v15 = v12;
    objc_storeStrong(v6, 0);
  }
  objc_storeStrong(location, 0);
  unint64_t v4 = v15;

  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityChildren
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  v67 = a1;
  if (!a1)
  {
    id v68 = 0;
    goto LABEL_86;
  }
  id v66 = (id)[v67 accessibilityContainer];
  if (v67[9])
  {
    uint64_t v30 = -[UITableViewSectionElement section]((uint64_t)v67);
    if (v30 < [v66 numberOfSections])
    {
      id v68 = v67[9];
    }
    else
    {
      -[UITableViewSectionElement _accessibilityClearChildren]((uint64_t)v67);
      objc_storeStrong(v67 + 9, 0);
      id v68 = 0;
    }
    int v65 = 1;
    goto LABEL_85;
  }
  id v64 = (id)[objc_allocWithZone(MEMORY[0x263EFF980]) init];
  uint64_t v63 = -[UITableViewSectionElement section]((uint64_t)v67);
  id v62 = (id)[v66 delegate];
  id v61 = (id)[v66 dataSource];
  char v60 = 0;
  char v1 = *((unsigned char *)v67 + 56);
  char v58 = 0;
  char v29 = 0;
  if (v1)
  {
    id v59 = (id)[v66 safeValueForKey:@"_delegateImplementsViewForHeaderInSection"];
    char v58 = 1;
    char v29 = [v59 BOOLValue];
  }
  if (v58) {

  }
  char v60 = v29 & 1;
  char v57 = 0;
  char v2 = *((unsigned char *)v67 + 56);
  char v55 = 0;
  char v28 = 0;
  if ((v2 & 1) == 0)
  {
    id v56 = (id)[v66 safeValueForKey:@"_delegateImplementsViewForFooterInSection"];
    char v55 = 1;
    char v28 = [v56 BOOLValue];
  }
  if (v55) {

  }
  char v57 = v28 & 1;
  id location = 0;
  if ((v60 & 1) == 0 && (v57 & 1) == 0) {
    goto LABEL_68;
  }
  char v3 = *((unsigned char *)v67 + 56);
  char v52 = 0;
  char v50 = 0;
  if (v3)
  {
    id v53 = (id)[v66 _visibleHeaderViewForSection:v63];
    char v52 = 1;
    objc_storeStrong(&location, v53);
  }
  else
  {
    id v51 = (id)[v66 _visibleFooterViewForSection:v63];
    char v50 = 1;
    objc_storeStrong(&location, v51);
  }
  if (v50) {

  }
  if (v52) {
  if (!location)
  }
  {
    char v4 = *((unsigned char *)v67 + 56);
    char v48 = 0;
    char v46 = 0;
    if (v4)
    {
      id v49 = (id)[v62 tableView:v66 viewForHeaderInSection:v63];
      char v48 = 1;
      objc_storeStrong(&location, v49);
    }
    else
    {
      id v47 = (id)[v62 tableView:v66 viewForFooterInSection:v63];
      char v46 = 1;
      objc_storeStrong(&location, v47);
    }
    if (v46) {

    }
    if (v48) {
  }
    }
  if (!location || ([location accessibilityElementsHidden] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v26 = v67;
      id v27 = (id)[location _accessibilityAXAttributedLabel];
      id v45 = (id)objc_msgSend(v26, "_textChildWithTitle:");

      if (v45)
      {
        [v64 addObject:v45];
        id v25 = (id)[location accessibilityLanguage];
        objc_msgSend(v45, "setAccessibilityLanguage:");
      }
      objc_storeStrong(&v45, 0);
    }
    else if (location)
    {
      id v44 = -[UITableViewSectionElement _accessibilityAccessibleElementsInView:](v67, location);
      id v43 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      memset(__b, 0, sizeof(__b));
      id v23 = v44;
      uint64_t v24 = [v23 countByEnumeratingWithState:__b objects:v69 count:16];
      if (v24)
      {
        uint64_t v20 = *(void *)__b[2];
        uint64_t v21 = 0;
        unint64_t v22 = v24;
        while (1)
        {
          uint64_t v19 = v21;
          if (*(void *)__b[2] != v20) {
            objc_enumerationMutation(v23);
          }
          v42 = *(void **)(__b[1] + 8 * v21);
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            if (([v43 containsObject:v42] & 1) == 0)
            {
              uint64_t v5 = [UIAccessibilityElementMockView alloc];
              v40 = [(UIAccessibilityElementMockView *)v5 initWithAccessibilityContainer:v67];
              -[UIAccessibilityElementMockView setDelegate:](v40, v67);
              -[UIAccessibilityElementMockView setView:](v40, v42);
              uint64_t v39 = [v42 _accessibilityNativeTraits];
              if ([v44 count] == 1 && (v39 & (*MEMORY[0x263F21B60] | *MEMORY[0x263F1CEE8])) == 0)
              {
                if ((_BYTE)v67[7]) {
                  uint64_t v18 = *MEMORY[0x263F1CEF8];
                }
                else {
                  uint64_t v18 = *MEMORY[0x263F21A00];
                }
                uint64_t v6 = [v42 accessibilityTraits];
                [v42 setAccessibilityTraits:v18 | v6];
              }
              [v64 addObject:v40];
              objc_storeStrong((id *)&v40, 0);
            }
          }
          else
          {
            [v42 setAccessibilityContainer:v67];
            [v64 addObject:v42];
          }
          ++v21;
          if (v19 + 1 >= v22)
          {
            uint64_t v21 = 0;
            unint64_t v22 = [v23 countByEnumeratingWithState:__b objects:v69 count:16];
            if (!v22) {
              break;
            }
          }
        }
      }

      if (![v64 count])
      {
        id v38 = -[UIViewAccessibility _accessibilityRetrieveIvarText](location);
        if ([v38 length])
        {
          id v16 = v64;
          id v17 = (id)[v67 _textChildWithTitle:v38];
          objc_msgSend(v16, "addObject:");
        }
        else
        {
          id v37 = 0;
          if (objc_opt_respondsToSelector())
          {
            id v7 = (id)[location safeValueForKey:@"text"];
            id v8 = v37;
            id v37 = v7;

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if ([v37 length])
              {
                id v14 = v64;
                id v15 = (id)[v67 _textChildWithTitle:v37];
                objc_msgSend(v14, "axSafelyAddObject:");
              }
            }
          }
          objc_storeStrong(&v37, 0);
        }
        objc_storeStrong(&v38, 0);
      }
      objc_storeStrong(&v43, 0);
      objc_storeStrong(&v44, 0);
    }
LABEL_68:
    if (![v64 count]
      && (((_BYTE)v67[7] & 1) != 0 && ([v66 _delegateWantsHeaderTitleForSection:v63] & 1) != 0
       || ((_BYTE)v67[7] & 1) == 0 && ([v66 _delegateWantsFooterTitleForSection:v63] & 1) != 0))
    {
      char v9 = *((unsigned char *)v67 + 56);
      char v34 = 0;
      char v32 = 0;
      if (v9)
      {
        id v35 = (id)[v61 tableView:v66 titleForHeaderInSection:v63];
        char v34 = 1;
        id v10 = v35;
      }
      else
      {
        id v33 = (id)[v61 tableView:v66 titleForFooterInSection:v63];
        char v32 = 1;
        id v10 = v33;
      }
      id v36 = v10;
      if (v32) {

      }
      if (v34) {
      id v31 = (id)[v67 _textChildWithTitle:v36];
      }
      if (v31)
      {
        [v64 addObject:v31];
        id v13 = (id)[v36 accessibilityLanguage];
        objc_msgSend(v31, "setAccessibilityLanguage:");
      }
      objc_storeStrong(&v31, 0);
      objc_storeStrong(&v36, 0);
    }
    objc_storeStrong(v67 + 9, v64);
    id v68 = v67[9];
    int v65 = 1;
    goto LABEL_84;
  }
  id v68 = 0;
  int v65 = 1;
LABEL_84:
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(&v64, 0);
LABEL_85:
  objc_storeStrong(&v66, 0);
LABEL_86:
  uint64_t v11 = v68;

  return v11;
}

- (void)updateMockView:(id)a3
{
  id v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (id)AXRetainAutorelease();
  id v29 = (id)[(UITableViewSectionElement *)v31 accessibilityContainer];
  uint64_t v28 = -[UITableViewSectionElement section]((uint64_t)v31);
  BOOL isHeader = v31->_isHeader;
  char v25 = 0;
  char v23 = 0;
  if (isHeader)
  {
    id v26 = (id)[v29 _visibleHeaderViewForSection:v28];
    char v25 = 1;
    id v5 = v26;
  }
  else
  {
    id v24 = (id)[v29 _visibleFooterViewForSection:v28];
    char v23 = 1;
    id v5 = v24;
  }
  id v27 = v5;
  if (v23) {

  }
  if (v25) {
  if (v27)
  }
  {
    id v22 = -[UITableViewSectionElement _accessibilityAccessibleElementsInView:](v31, v27);
    uint64_t v21 = 0;
    uint64_t v20 = [v22 count];
    BOOL v19 = 0;
    BOOL v19 = v20 == [(NSMutableArray *)v31->_children count];
    if (!v19)
    {
      -[UITableViewSectionElement _accessibilityClearChildren]((uint64_t)v31);
      [(NSMutableArray *)v31->_children removeAllObjects];
      objc_storeStrong((id *)&v31->_children, 0);
      id v6 = -[UITableViewSectionElement accessibilityChildren]((id *)&v31->super.super.super.isa);
    }
    while (v21 < v20)
    {
      id v18 = 0;
      if (v19)
      {
        id v7 = (id)[(NSMutableArray *)v31->_children objectAtIndex:v21];
        id v8 = v18;
        id v18 = v7;
      }
      else
      {
        char v9 = [UIAccessibilityElementMockView alloc];
        id v10 = [(UIAccessibilityElementMockView *)v9 initWithAccessibilityContainer:v31];
        id v11 = v18;
        id v18 = v10;

        -[UIAccessibilityElementMockView setDelegate:]((id *)v18, v31);
        [(NSMutableArray *)v31->_children addObject:v18];
      }
      id v14 = (id)[v22 objectAtIndex:v21];
      -[UIAccessibilityElementMockView setView:]((id *)v18, v14);

      char v16 = 0;
      char isKindOfClass = 0;
      if (v20 == 1)
      {
        id v17 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v18);
        char v16 = 1;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
      }
      if (v16) {

      }
      if (isKindOfClass)
      {
        uint64_t v12 = *MEMORY[0x263F1CEF8];
        id v13 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v18);
        [v13 setAccessibilityTraits:v12];
      }
      objc_storeStrong(&v18, 0);
      ++v21;
    }
    objc_storeStrong(&v22, 0);
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

- (void)accessibilityScrollToVisibleWithChild:(id)a3
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = (id)[(UITableViewSectionElement *)v15 accessibilityContainer];
  id v12 = (id)[MEMORY[0x263F088C8] indexPathForRow:0 inSection:v15->_section];
  uint64_t v11 = 0;
  uint64_t v11 = [v13 numberOfRowsInSection:v15->_section];
  if ((-[UITableViewSectionElement isHeader]((uint64_t)v15) & 1) == 0 && v11)
  {
    id v3 = (id)[MEMORY[0x263F088C8] indexPathForRow:v11 - 1 inSection:v15->_section];
    id v4 = v12;
    id v12 = v3;
  }
  if (v11 > 0
    && v12
    && (uint64_t section = v15->_section, section < [v13 numberOfSections])
    && [v12 row] < v11)
  {
    [v13 scrollToRowAtIndexPath:v12 atScrollPosition:2 animated:0];
  }
  else
  {
    [(UITableViewSectionElement *)v15 accessibilityFrame];
    v10[1] = v5;
    v10[2] = v6;
    v10[3] = v7;
    v10[4] = v8;
    objc_msgSend(v13, "_accessibilityScrollToFrame:forView:", 0, *(double *)&v5, *(double *)&v6, *(double *)&v7, *(double *)&v8);
  }
  v10[0] = location[0];
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (uint64_t)isHeader
{
  if (a1) {
    char v2 = *(unsigned char *)(a1 + 56) & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

uint64_t __67__UITableViewSectionElement_accessibilityScrollToVisibleWithChild___block_invoke()
{
  return _UIAXDismissKeyboardIfNecessary();
}

- (BOOL)accessibilityScrollToVisible
{
  return 1;
}

- (id)accessibilityElements
{
  return -[UITableViewSectionElement accessibilityChildren]((id *)&self->super.super.super.isa);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  CGPoint v47 = a3;
  char v46 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  id v25 = -[UITableViewSectionElement accessibilityChildren]((id *)&v46->super.super.super.isa);
  id v44 = (id)[v25 copy];

  id v26 = (id)[(UITableViewSectionElement *)v46 _accessibilityParentView];
  UIAccessibilityPointForPoint();
  v43.x = v4;
  v43.y = v5;

  id v42 = 0;
  CGSizeMake_3();
  *(void *)&long long v41 = v6;
  *((void *)&v41 + 1) = v7;
  memset(__b, 0, sizeof(__b));
  id obj = v44;
  uint64_t v28 = [obj countByEnumeratingWithState:__b objects:v48 count:16];
  if (v28)
  {
    uint64_t v22 = *(void *)__b[2];
    uint64_t v23 = 0;
    unint64_t v24 = v28;
    while (1)
    {
      uint64_t v21 = v23;
      if (*(void *)__b[2] != v22) {
        objc_enumerationMutation(obj);
      }
      id v40 = *(id *)(__b[1] + 8 * v23);
      CGPoint v38 = v47;
      char v37 = 0;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = (id)[(UITableViewSectionElement *)v46 accessibilityContainer];
        [v20 convertPoint:v40 toView:v38];
        v36.x = v8;
        v36.y = v9;
        CGPoint v38 = v36;
      }
      else
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        char v34 = 0;
        char v19 = 0;
        if (isKindOfClass)
        {
          id v35 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v40);
          char v34 = 1;
          objc_opt_class();
          char v19 = objc_opt_isKindOfClass();
        }
        if (v34) {

        }
        if (v19)
        {
          id v18 = (id)[(UITableViewSectionElement *)v46 accessibilityContainer];
          id v17 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v40);
          objc_msgSend(v18, "convertPoint:toView:", v38);
          v33.x = v11;
          v33.y = v12;
          CGPoint v38 = v33;

          char v37 = 1;
        }
      }
      id v32 = (id)[v40 _accessibilityHitTest:location[0] withEvent:v38];
      if (v32)
      {
        char v30 = 0;
        char v16 = 0;
        if (v37)
        {
          id v15 = v32;
          id v31 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v40);
          char v30 = 1;
          char v16 = objc_msgSend(v15, "isEqual:");
        }
        if (v30) {

        }
        if (v16) {
          objc_storeStrong(&v32, v40);
        }
        [v32 accessibilityFrame];
        *(CGFloat *)&long long rect_16 = v51.size.width;
        *((void *)&rect_16 + 1) = *(void *)&v51.size.height;
        if (CGRectContainsPoint(v51, v43)
          && *(double *)&v41 > *(double *)&rect_16
          && *((double *)&v41 + 1) > *((double *)&rect_16 + 1))
        {
          long long v41 = rect_16;
          objc_storeStrong(&v42, v32);
        }
      }
      objc_storeStrong(&v32, 0);
      ++v23;
      if (v21 + 1 >= v24)
      {
        uint64_t v23 = 0;
        unint64_t v24 = [obj countByEnumeratingWithState:__b objects:v48 count:16];
        if (!v24) {
          break;
        }
      }
    }
  }

  id v14 = v42;
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(location, 0);

  return v14;
}

- (id)accessibilityIdentifier
{
  CGPoint v36 = self;
  v35[1] = (id)a2;
  v35[0] = 0;
  id v34 = (id)[(UITableViewSectionElement *)self accessibilityContainer];
  uint64_t v33 = -[UITableViewSectionElement section]((uint64_t)v36);
  id v32 = (id)[v34 delegate];
  char v31 = 0;
  BOOL isHeader = v36->_isHeader;
  char v29 = 0;
  char v14 = 0;
  if (isHeader)
  {
    id v30 = (id)[v34 safeValueForKey:@"_delegateImplementsViewForHeaderInSection"];
    char v29 = 1;
    char v14 = [v30 BOOLValue];
  }
  if (v29) {

  }
  char v31 = v14 & 1;
  char v28 = 0;
  BOOL v3 = v36->_isHeader;
  char v26 = 0;
  char v13 = 0;
  if (!v3)
  {
    id v27 = (id)[v34 safeValueForKey:@"_delegateImplementsViewForFooterInSection"];
    char v26 = 1;
    char v13 = [v27 BOOLValue];
  }
  if (v26) {

  }
  char v28 = v13 & 1;
  id location = 0;
  if (v31 & 1) != 0 || (v28)
  {
    BOOL v4 = v36->_isHeader;
    char v23 = 0;
    char v21 = 0;
    if (v4)
    {
      id v24 = (id)[v34 _visibleHeaderViewForSection:v33];
      char v23 = 1;
      objc_storeStrong(&location, v24);
    }
    else
    {
      id v22 = (id)[v34 _visibleFooterViewForSection:v33];
      char v21 = 1;
      objc_storeStrong(&location, v22);
    }
    if (v21) {

    }
    if (v23) {
    if (!location)
    }
    {
      BOOL v5 = v36->_isHeader;
      char v19 = 0;
      char v17 = 0;
      if (v5)
      {
        id v20 = (id)[v32 tableView:v34 viewForHeaderInSection:v33];
        char v19 = 1;
        objc_storeStrong(&location, v20);
      }
      else
      {
        id v18 = (id)[v32 tableView:v34 viewForFooterInSection:v33];
        char v17 = 1;
        objc_storeStrong(&location, v18);
      }
      if (v17) {

      }
      if (v19) {
    }
      }
    id v6 = (id)[location accessibilityIdentifier];
    id v7 = v35[0];
    v35[0] = v6;

    if (!v35[0])
    {
      id v16 = (id)[location _accessibilitySortedElementsWithin];
      uint64_t v15 = [v16 indexOfObjectPassingTest:&__block_literal_global_41];
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v12 = (id)[v16 objectAtIndex:v15];
        id v8 = (id)[v12 accessibilityLabel];
        id v9 = v35[0];
        v35[0] = v8;
      }
      objc_storeStrong(&v16, 0);
    }
  }
  id v11 = v35[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(v35, 0);

  return v11;
}

uint64_t __52__UITableViewSectionElement_accessibilityIdentifier__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (id)description
{
  BOOL v5 = NSString;
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = -[UITableViewSectionElement section]((uint64_t)self);
  return (id)[v5 stringWithFormat:@"[%@]{%p} section: %ld (isHeader: %d)", v3, self, v4, -[UITableViewSectionElement isHeader]((uint64_t)self) & 1];
}

- (uint64_t)setSection:(uint64_t)result
{
  if (result) {
    *(void *)(result + 64) = a2;
  }
  return result;
}

- (uint64_t)setIsHeader:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 56) = a2 & 1;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end