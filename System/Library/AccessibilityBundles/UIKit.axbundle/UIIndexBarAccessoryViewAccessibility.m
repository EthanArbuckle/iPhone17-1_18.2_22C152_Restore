@interface UIIndexBarAccessoryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsDelegateSelectable;
- (BOOL)_didSelectEntry:(id)a3 atIndex:(int64_t)a4 location:(CGPoint)a5;
- (BOOL)isAccessibilityElement;
- (id)_accessibiityDisplayEntryNearestToContentOffset:(double)a3;
- (id)_accessibilityTableIndexTitles;
- (id)_axEntries;
- (id)_axLabelForEntry:(uint64_t)a1;
- (id)accessibilityFlowToElements;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (uint64_t)_axCurrentPosition;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityJumpToTableIndex:(id)a3;
- (void)_accessibilityMoveToIndexAtPosition:(void *)a1;
- (void)_axPostNotificationForEntry:(uint64_t)a1;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation UIIndexBarAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIIndexBarAccessoryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v12 = location;
  id v11 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"UIIndexBarAccessoryView";
  v5 = @"UIIndexBarView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  [location[0] validateClass:@"UIIndexBarView" isKindOfClass:@"UIControl"];
  v6 = "@";
  [location[0] validateClass:@"UIIndexBarAccessoryView" hasInstanceMethod:@"scrollView" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"entries", v6, 0);
  v8 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_didSelectEntry:atIndex:location:", "B", v6, "q", "{CGPoint=dd}", 0);
  v4 = @"UIIndexBarEntry";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"type", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"indexPath", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"delegate", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"displayEntries", v6, 0);
  v7 = @"UIIndexBarDisplayEntry";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"entryIndex", v8, 0);
  int v9 = 1;
  int v10 = 0;
  [location[0] validateProtocol:@"UIIndexBarAccessoryViewDelegate" hasMethod:@"indexBarAccessoryView:contentOffsetForEntry:atIndex:" isInstanceMethod:1 isRequired:0];
  [location[0] validateProtocol:@"UIIndexBarViewDelegate" hasMethod:@"indexBarView:didSelectEntry:atIndex:" isInstanceMethod:v9 & 1 isRequired:v10 & 1];
  objc_storeStrong(v12, v11);
}

- (BOOL)isAccessibilityElement
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = (id)[(UIIndexBarAccessoryViewAccessibility *)self safeValueForKey:@"scrollView"];
  id v4 = -[UIIndexBarAccessoryViewAccessibility _axEntries](v7);
  char v5 = 0;
  if ([v4 count])
  {
    objc_opt_class();
    char v3 = 1;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      char v3 = [(UIIndexBarAccessoryViewAccessibility *)v7 _accessibilityIsDelegateSelectable];
    }
    char v5 = v3;
  }

  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (id)_axEntries
{
  if (a1) {
    id v2 = (id)[a1 safeArrayForKey:@"entries"];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"section.index.label");
}

- (id)accessibilityUserInputLabels
{
  v6[2] = *MEMORY[0x263EF8340];
  id v5 = accessibilityLocalizedString(@"section.index.label");
  v6[0] = v5;
  id v3 = accessibilityLocalizedString(@"scroll.bar");
  v6[1] = v3;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F81400] | *MEMORY[0x263F1CED8];
}

- (void)accessibilityIncrement
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v12 = self;
  SEL v11 = a2;
  for (uint64_t i = -[UIIndexBarAccessoryViewAccessibility _axCurrentPosition](self); i > 0; --i)
  {
    id v9 = -[UIIndexBarAccessoryViewAccessibility _axEntries](v12);
    id v8 = (id)[v9 objectAtIndexedSubscript:i];
    v7[1] = (id)(i - 1);
    v7[0] = (id)[v9 objectAtIndexedSubscript:i - 1];
    id v6 = (id)objc_msgSend(v8, "safeValueForKey:");
    id location = (id)[v7[0] safeValueForKey:@"indexPath"];
    if (v6 && location)
    {
      int v4 = ([v6 isEqual:location] & 1) != 0 ? 0 : 2;
    }
    else
    {
      os_log_t oslog = (os_log_t)(id)AXLogAppAccessibility();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        __os_log_helper_16_2_1_8_64((uint64_t)v13, (uint64_t)v12);
        _os_log_error_impl(&dword_2402B7000, log, OS_LOG_TYPE_ERROR, "Unexpectedly had no index paths for index bar in collection view: %@", v13, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      int v4 = 2;
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v6, 0);
    objc_storeStrong(v7, 0);
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
    if (v4) {
      break;
    }
  }
  if (i > 0) {
    -[UIIndexBarAccessoryViewAccessibility _accessibilityMoveToIndexAtPosition:](v12, (void *)(i - 1));
  }
}

- (uint64_t)_axCurrentPosition
{
  SEL v11 = a1;
  if (!a1) {
    return 0;
  }
  char v9 = 0;
  objc_opt_class();
  id v4 = (id)[v11 safeValueForKey:@"scrollView"];
  id v8 = (id)__UIAccessibilityCastAsClass();

  id v7 = v8;
  objc_storeStrong(&v8, 0);
  id v10 = v7;
  [v7 contentOffset];
  v6[1] = v1;
  v6[2] = v2;
  v6[0] = [(UIIndexBarAccessoryViewAccessibility *)v11 _accessibiityDisplayEntryNearestToContentOffset:*(double *)&v2];
  uint64_t v5 = 0;
  if (v6[0]) {
    uint64_t v5 = [v6[0] safeIntegerForKey:@"entryIndex"];
  }
  uint64_t v12 = v5;
  objc_storeStrong(v6, 0);
  objc_storeStrong(&v10, 0);
  return v12;
}

- (void)_accessibilityMoveToIndexAtPosition:(void *)a1
{
  uint64_t v12 = a1;
  SEL v11 = a2;
  if (a1)
  {
    id v2 = -[UIIndexBarAccessoryViewAccessibility _axEntries](v12);
    id v10 = (id)[v2 objectAtIndexedSubscript:v11];

    uint64_t v3 = MEMORY[0x263EF8330];
    int v4 = -1073741824;
    int v5 = 0;
    id v6 = __76__UIIndexBarAccessoryViewAccessibility__accessibilityMoveToIndexAtPosition___block_invoke;
    id v7 = &unk_2650AE5F8;
    id v8 = v12;
    v9[0] = v10;
    v9[1] = v11;
    AXPerformSafeBlock();
    -[UIIndexBarAccessoryViewAccessibility _axPostNotificationForEntry:]((uint64_t)v12, v10);
    objc_storeStrong(v9, 0);
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v10, 0);
  }
}

- (void)accessibilityDecrement
{
  unint64_t v4 = -[UIIndexBarAccessoryViewAccessibility _axCurrentPosition](self);
  id v2 = -[UIIndexBarAccessoryViewAccessibility _axEntries](self);
  uint64_t v3 = [v2 count];

  if (v4 < v3 - 1) {
    -[UIIndexBarAccessoryViewAccessibility _accessibilityMoveToIndexAtPosition:](self, (void *)(v4 + 1));
  }
}

- (id)_accessibilityTableIndexTitles
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = self;
  v13[1] = (id)a2;
  v13[0] = (id)[MEMORY[0x263EFF980] array];
  memset(__b, 0, sizeof(__b));
  id obj = -[UIIndexBarAccessoryViewAccessibility _axEntries](v14);
  uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void **)(__b[1] + 8 * v6);
      id location = -[UIIndexBarAccessoryViewAccessibility _axLabelForEntry:]((uint64_t)v14, v12);
      if ([location length]) {
        [v13[0] addObject:location];
      }
      objc_storeStrong(&location, 0);
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  id v3 = v13[0];
  objc_storeStrong(v13, 0);

  return v3;
}

- (id)_axLabelForEntry:(uint64_t)a1
{
  uint64_t v13 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v13)
  {
    id v10 = 0;
    uint64_t v9 = [location safeIntegerForKey:@"type"];
    if (v9 == 2)
    {
      id v4 = accessibilityLocalizedString(@"section.index.numbers.label");
      id v5 = v10;
      id v10 = v4;
    }
    else
    {
      if (v9 == 3) {
        id v2 = accessibilityLocalizedString(@"section.index.search.label");
      }
      else {
        id v2 = (id)[location safeStringForKey:@"title"];
      }
      id v3 = v10;
      id v10 = v2;
    }
    id v8 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v10];
    [v8 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F216C0]];
    id v14 = v8;
    int v11 = 1;
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v10, 0);
  }
  else
  {
    id v14 = 0;
    int v11 = 1;
  }
  objc_storeStrong(&location, 0);
  uint64_t v6 = v14;

  return v6;
}

- (id)accessibilityFlowToElements
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v33 = self;
  v32[1] = (id)a2;
  v31.receiver = self;
  v31.super_class = (Class)UIIndexBarAccessoryViewAccessibility;
  v32[0] = [(UIIndexBarAccessoryViewAccessibility *)&v31 accessibilityFlowToElements];
  id v30 = -[UIIndexBarAccessoryViewAccessibility _axEntries](v33);
  if ([v30 count])
  {
    uint64_t v29 = -[UIIndexBarAccessoryViewAccessibility _axCurrentPosition](v33);
    if (v29 < 0 || v29 >= (unint64_t)[v30 count])
    {
      uint64_t v3 = v29;
      uint64_t v4 = [v30 count];
      _AXAssert();
    }
    if (v29 >= 0 && v29 < (unint64_t)[v30 count])
    {
      id v28 = (id)[v30 objectAtIndexedSubscript:v29];
      char v26 = 0;
      objc_opt_class();
      id v16 = (id)[v28 safeValueForKey:@"indexPath"];
      id v25 = (id)__UIAccessibilityCastAsClass();

      id v24 = v25;
      objc_storeStrong(&v25, 0);
      id v27 = v24;
      id v23 = (id)[(UIIndexBarAccessoryViewAccessibility *)v33 safeValueForKey:@"scrollView"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = v23;
        id v13 = (id)[v22 indexPathsForVisibleItems];
        id v21 = (id)[v13 sortedArrayUsingSelector:sel_compare_];

        memset(__b, 0, sizeof(__b));
        id obj = v21;
        uint64_t v15 = [obj countByEnumeratingWithState:__b objects:v34 count:16];
        if (v15)
        {
          uint64_t v10 = *(void *)__b[2];
          uint64_t v11 = 0;
          unint64_t v12 = v15;
          while (1)
          {
            uint64_t v9 = v11;
            if (*(void *)__b[2] != v10) {
              objc_enumerationMutation(obj);
            }
            id v20 = *(id *)(__b[1] + 8 * v11);
            uint64_t v8 = objc_msgSend(v20, "section", v3, v4);
            if (v8 >= [v27 section])
            {
              id v7 = (id)[v22 cellForItemAtIndexPath:v20];
              id v6 = (id)[MEMORY[0x263F81198] options];
              id v18 = (id)objc_msgSend(v7, "_accessibilityLeafDescendantsWithCount:options:", 1);

              if ([v18 count])
              {
                objc_storeStrong(v32, v18);
                int v17 = 4;
              }
              else
              {
                int v17 = 0;
              }
              objc_storeStrong(&v18, 0);
              if (v17) {
                break;
              }
            }
            ++v11;
            if (v9 + 1 >= v12)
            {
              uint64_t v11 = 0;
              unint64_t v12 = [obj countByEnumeratingWithState:__b objects:v34 count:16];
              if (!v12) {
                break;
              }
            }
          }
        }

        objc_storeStrong(&v21, 0);
        objc_storeStrong(&v22, 0);
      }
      objc_storeStrong(&v23, 0);
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v28, 0);
    }
  }
  id v5 = v32[0];
  objc_storeStrong(&v30, 0);
  objc_storeStrong(v32, 0);

  return v5;
}

- (id)_accessibiityDisplayEntryNearestToContentOffset:(double)a3
{
  *(double *)&long long v18 = a2;
  *((double *)&v18 + 1) = a3;
  id v17 = a1;
  if (a1)
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    int v12 = 838860800;
    int v13 = 48;
    id v14 = __Block_byref_object_copy__10;
    uint64_t v15 = __Block_byref_object_dispose__10;
    id v16 = 0;
    id v9 = (id)[v17 safeValueForKey:@"delegate"];
    if (objc_opt_respondsToSelector())
    {
      id v5 = (id)[v17 safeArrayForKey:@"displayEntries"];
      id v6 = v9;
      v7[0] = v17;
      long long v8 = v18;
      v7[1] = &v10;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:");

      objc_storeStrong(v7, 0);
      objc_storeStrong(&v6, 0);
    }
    id v19 = (id)v11[5];
    objc_storeStrong(&v9, 0);
    _Block_object_dispose(&v10, 8);
    objc_storeStrong(&v16, 0);
  }
  else
  {
    id v19 = 0;
  }
  uint64_t v3 = v19;

  return v3;
}

void __88__UIIndexBarAccessoryViewAccessibility__accessibiityDisplayEntryNearestToContentOffset___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v24 = a3;
  id v23 = a4;
  v22[1] = (id)a1;
  v22[0] = (id)[location[0] safeValueForKey:@"entry"];
  if (v22[0])
  {
    if ([v22[0] safeIntegerForKey:@"type"] == 1)
    {
      int v21 = 1;
    }
    else
    {
      long long v20 = 0uLL;
      uint64_t v13 = 0;
      id v14 = &v13;
      int v15 = 0x10000000;
      int v16 = 48;
      id v17 = &unk_24046C852;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      v12[1] = &v13;
      id v9 = *(id *)(a1 + 32);
      id v10 = *(id *)(a1 + 40);
      id v11 = v22[0];
      v12[0] = location[0];
      AXPerformSafeBlock();
      long long v20 = *((_OWORD *)v14 + 2);
      objc_storeStrong(v12, 0);
      objc_storeStrong(&v11, 0);
      objc_storeStrong(&v10, 0);
      objc_storeStrong(&v9, 0);
      _Block_object_dispose(&v13, 8);
      if (*((double *)&v20 + 1) > *(double *)(a1 + 64)
        && ((double v8 = *((double *)&v20 + 1) - *(double *)(a1 + 64), v8 >= 0.0)
          ? (double v4 = *((double *)&v20 + 1) - *(double *)(a1 + 64))
          : (double v4 = -v8),
            v4 >= 5.0))
      {
        *id v23 = 1;
      }
      else
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), location[0]);
      }
      int v21 = 0;
    }
  }
  else
  {
    int v21 = 1;
  }
  objc_storeStrong(v22, 0);
  if (!v21) {
    int v21 = 0;
  }
  objc_storeStrong(location, 0);
}

__n128 __88__UIIndexBarAccessoryViewAccessibility__accessibiityDisplayEntryNearestToContentOffset___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "indexBarAccessoryView:contentOffsetForEntry:atIndex:", *(void *)(a1 + 40), *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "safeIntegerForKey:", @"entryIndex"));
  v5.n128_u64[0] = v1;
  v5.n128_u64[1] = v2;
  __n128 result = v5;
  *(__n128 *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = v5;
  return result;
}

- (void)_accessibilityJumpToTableIndex:(id)a3
{
  uint64_t v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] length])
  {
    uint64_t v15 = [location[0] rangeOfComposedCharacterSequenceAtIndex:0];
    uint64_t v16 = v3;
    id v4 = (id)objc_msgSend(location[0], "substringWithRange:", v15, v3);
    id v5 = location[0];
    location[0] = v4;
  }
  id v14 = -[UIIndexBarAccessoryViewAccessibility _axEntries](v18);
  uint64_t v13 = 0;
  id v6 = v14;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = __71__UIIndexBarAccessoryViewAccessibility__accessibilityJumpToTableIndex___block_invoke;
  id v11 = &unk_2650AE9C0;
  id v12 = location[0];
  uint64_t v13 = (void *)[v6 indexOfObjectPassingTest:&v7];
  if (v13 != (void *)0x7FFFFFFFFFFFFFFFLL) {
    -[UIIndexBarAccessoryViewAccessibility _accessibilityMoveToIndexAtPosition:](v18, v13);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

BOOL __71__UIIndexBarAccessoryViewAccessibility__accessibilityJumpToTableIndex___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v4 = (id)[location[0] safeStringForKey:@"title"];
  BOOL v5 = [v4 caseInsensitiveCompare:a1[4]] == 0;

  objc_storeStrong(location, 0);
  return v5;
}

- (void)_axPostNotificationForEntry:(uint64_t)a1
{
  uint64_t v5 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v5)
  {
    UIAccessibilityNotifications notification = *MEMORY[0x263F812E8];
    id v3 = -[UIIndexBarAccessoryViewAccessibility _axLabelForEntry:](v5, location);
    UIAccessibilityPostNotification(notification, v3);
  }
  objc_storeStrong(&location, 0);
}

uint64_t __76__UIIndexBarAccessoryViewAccessibility__accessibilityMoveToIndexAtPosition___block_invoke(uint64_t a1)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  CGPointMake_4();
  objc_msgSend(v4, "_didSelectEntry:atIndex:location:", v5, v6, v1, v2);
  return [*(id *)(a1 + 32) sendActionsForControlEvents:4096];
}

- (BOOL)_accessibilityIsDelegateSelectable
{
  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = (id)[(UIIndexBarAccessoryViewAccessibility *)self safeValueForKey:@"delegate"];
  char v3 = objc_opt_respondsToSelector();
  objc_storeStrong(v4, 0);
  return v3 & 1;
}

- (BOOL)_didSelectEntry:(id)a3 atIndex:(int64_t)a4 location:(CGPoint)a5
{
  CGPoint v14 = a5;
  uint64_t v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v11 = a4;
  uint64_t v10 = -[UIIndexBarAccessoryViewAccessibility _axCurrentPosition](v13);
  char v9 = 0;
  v8.receiver = v13;
  v8.super_class = (Class)UIIndexBarAccessoryViewAccessibility;
  char v9 = -[UIIndexBarAccessoryViewAccessibility _didSelectEntry:atIndex:location:](&v8, sel__didSelectEntry_atIndex_location_, location[0], a4, v14.x, v14.y);
  if (v9 && v10 != v11) {
    -[UIIndexBarAccessoryViewAccessibility _axPostNotificationForEntry:]((uint64_t)v13, location[0]);
  }
  char v6 = v9;
  objc_storeStrong(location, 0);
  return v6 & 1;
}

@end