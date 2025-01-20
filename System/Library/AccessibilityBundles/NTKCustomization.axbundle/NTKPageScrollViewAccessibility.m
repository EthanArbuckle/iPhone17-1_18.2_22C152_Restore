@interface NTKPageScrollViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityOpaqueElementProvider;
- (NTKPageScrollViewControllerAccessibility)accessibilityPageScrollViewController;
- (id)_accessibilityGetCurrentPageView;
- (id)_accessibilityMoveFocusToNextOpaqueElementForTechnology:(id)a3 direction:(int64_t)a4 searchType:(int64_t)a5 range:(_NSRange)a6 shouldScrollToVisible:(BOOL)a7 honorsGroups:(BOOL)a8;
- (id)_accessibilityScrollStatus;
- (id)_accessibilitySubviews;
- (id)accessibilityLabel;
- (void)_accessibilityScrollToIndex:(unint64_t)a3;
- (void)setAccessibilityPageScrollViewController:(id)a3;
@end

@implementation NTKPageScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKPageScrollView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKPageScrollView", @"pageAtIndex:", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKPageScrollView", @"_contentOffsetToCenterPageAtIndex:", "{CGPoint=dd}", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKPageScrollView", @"currentPageIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKPageScrollView", @"numberOfPages", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKPageScrollView", @"enumeratePagesWithBlock:", "v", "@?", 0);
  [v3 validateClass:@"NTKPageScrollView" hasInstanceVariable:@"_tiledPages" withType:"NSMutableDictionary"];
  [v3 validateClass:@"NTKPageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NSObject", @"_accessibilityMoveFocusToNextOpaqueElementForTechnology:direction:searchType:range:shouldScrollToVisible:honorsGroups:", "@", "@", "q", "q", "{_NSRange=QQ}", "B", "B", 0);
}

- (BOOL)isAccessibilityOpaqueElementProvider
{
  v2 = [(NTKPageScrollViewAccessibility *)self accessibilityPageScrollViewController];
  unsigned __int8 v3 = [v2 _accessibilityShouldSwipeBetweenPages];

  return v3;
}

- (id)accessibilityLabel
{
  v2 = [(NTKPageScrollViewAccessibility *)self accessibilityPageScrollViewController];
  unsigned __int8 v3 = [v2 _accessibilityTouchContainerLabel];

  return v3;
}

- (id)_accessibilityMoveFocusToNextOpaqueElementForTechnology:(id)a3 direction:(int64_t)a4 searchType:(int64_t)a5 range:(_NSRange)a6 shouldScrollToVisible:(BOOL)a7 honorsGroups:(BOOL)a8
{
  id v10 = a3;
  v11 = [(NTKPageScrollViewAccessibility *)self _accessibilityCurrentlyFocusedElementForTechnology:v10];
  v12 = v11;
  if (!v11)
  {
    uint64_t v17 = (uint64_t)[(NTKPageScrollViewAccessibility *)self safeUnsignedIntegerForKey:@"currentPageIndex"];
    goto LABEL_15;
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
  v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  v31 = __152__NTKPageScrollViewAccessibility__accessibilityMoveFocusToNextOpaqueElementForTechnology_direction_searchType_range_shouldScrollToVisible_honorsGroups___block_invoke;
  v32 = &unk_20530;
  v33 = self;
  id v13 = v11;
  id v34 = v13;
  v35 = &v23;
  AXPerformSafeBlock();
  if (v24[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v22 = v13;
    _AXAssert();
  }
  v14 = (char *)[(NTKPageScrollViewAccessibility *)self safeUnsignedIntegerForKey:@"numberOfPages", v22];
  if (a4 == 2)
  {
    uint64_t v18 = v24[3];
    if (v18)
    {
      uint64_t v16 = v18 - 1;
LABEL_11:
      uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(NTKPageScrollViewAccessibility *)self _accessibilityScrollToIndex:v16];
        uint64_t v17 = v16;
      }
      goto LABEL_14;
    }
  }
  else if (a4 == 1)
  {
    unint64_t v15 = v24[3];
    if (v15 < (unint64_t)(v14 - 1))
    {
      uint64_t v16 = v15 + 1;
      goto LABEL_11;
    }
  }
  uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

  _Block_object_dispose(&v23, 8);
LABEL_15:
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v19 = 0;
  }
  else
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    uint64_t v26 = (uint64_t)__Block_byref_object_copy__0;
    v27 = __Block_byref_object_dispose__0;
    id v28 = 0;
    AXPerformSafeBlock();
    id v19 = (id)v24[5];
    _Block_object_dispose(&v23, 8);

    if (!v19)
    {
      id v22 = (id)v17;
      _AXAssert();
    }
    AXSafeClassFromString();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v22 = v19;
      _AXAssert();
    }
    if (v19) {
      id v20 = v19;
    }
  }
  objc_msgSend(v19, "_accessibilityHandleATFocused:assistiveTech:", 1, v10, v22);

  return v19;
}

void __152__NTKPageScrollViewAccessibility__accessibilityMoveFocusToNextOpaqueElementForTechnology_direction_searchType_range_shouldScrollToVisible_honorsGroups___block_invoke(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __152__NTKPageScrollViewAccessibility__accessibilityMoveFocusToNextOpaqueElementForTechnology_direction_searchType_range_shouldScrollToVisible_honorsGroups___block_invoke_2;
  v5[3] = &unk_20508;
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumeratePagesWithBlock:v5];
}

uint64_t __152__NTKPageScrollViewAccessibility__accessibilityMoveFocusToNextOpaqueElementForTechnology_direction_searchType_range_shouldScrollToVisible_honorsGroups___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 32) == a2)
  {
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

uint64_t __152__NTKPageScrollViewAccessibility__accessibilityMoveFocusToNextOpaqueElementForTechnology_direction_searchType_range_shouldScrollToVisible_honorsGroups___block_invoke_337(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) pageAtIndex:*(void *)(a1 + 48)];

  return _objc_release_x1();
}

- (id)_accessibilitySubviews
{
  v20.receiver = self;
  v20.super_class = (Class)NTKPageScrollViewAccessibility;
  id v3 = [(NTKPageScrollViewAccessibility *)&v20 _accessibilitySubviews];
  if ([(NTKPageScrollViewAccessibility *)self isAccessibilityOpaqueElementProvider])
  {
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
    id v5 = [(NTKPageScrollViewAccessibility *)self safeUnsignedIntegerForKey:@"currentPageIndex"];
    id v6 = [(NTKPageScrollViewAccessibility *)self safeValueForKey:@"_tiledPages"];
    uint64_t v7 = +[NSNumber numberWithUnsignedInteger:v5];
    v8 = [v6 objectForKey:v7];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v3;
    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          AXSafeClassFromString();
          if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v8, "isEqual:", v14, (void)v16)) {
            objc_msgSend(v4, "addObject:", v14, (void)v16);
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v11);
    }
  }

  return v4;
}

- (id)_accessibilityScrollStatus
{
  v8.receiver = self;
  v8.super_class = (Class)NTKPageScrollViewAccessibility;
  id v3 = [(NTKPageScrollViewAccessibility *)&v8 _accessibilityScrollStatus];
  uint64_t v4 = [(NTKPageScrollViewAccessibility *)self _accessibilityGetCurrentPageView];
  id v5 = [v4 accessibilityLabel];
  id v6 = __UIAXStringForVariables();

  return v6;
}

- (void)_accessibilityScrollToIndex:(unint64_t)a3
{
  uint64_t v7 = 0;
  objc_super v8 = (double *)&v7;
  uint64_t v9 = 0x3010000000;
  id v10 = "";
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  AXPerformSafeBlock();
  double v3 = v8[4];
  double v4 = v8[5];
  _Block_object_dispose(&v7, 8);
  LOBYTE(v7) = 0;
  objc_opt_class();
  id v5 = __UIAccessibilityCastAsClass();
  if ((_BYTE)v7) {
    abort();
  }
  id v6 = v5;
  objc_msgSend(v5, "accessibilityApplyScrollContent:sendScrollStatus:animated:", 0, 0, v3, v4);
}

id __62__NTKPageScrollViewAccessibility__accessibilityScrollToIndex___block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _contentOffsetToCenterPageAtIndex:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

- (id)_accessibilityGetCurrentPageView
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__0;
  objc_super v8 = __Block_byref_object_dispose__0;
  id v9 = 0;
  AXPerformSafeBlock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

uint64_t __66__NTKPageScrollViewAccessibility__accessibilityGetCurrentPageView__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "pageAtIndex:", objc_msgSend(*(id *)(a1 + 32), "safeUnsignedIntegerForKey:", @"currentPageIndex"));

  return _objc_release_x1();
}

- (NTKPageScrollViewControllerAccessibility)accessibilityPageScrollViewController
{
  id v2 = objc_getAssociatedObject(self, &_AXPageScrollViewController);
  uint64_t v3 = [v2 referencedScrollViewController];

  return (NTKPageScrollViewControllerAccessibility *)v3;
}

- (void)setAccessibilityPageScrollViewController:(id)a3
{
  id v4 = a3;
  value = objc_alloc_init(_UIAccessibilityWeakObjectHolder_NTKPageScrollViewControllerAccessibility);
  [(_UIAccessibilityWeakObjectHolder_NTKPageScrollViewControllerAccessibility *)value setReferencedScrollViewController:v4];

  objc_setAssociatedObject(self, &_AXPageScrollViewController, value, (char *)&dword_0 + 1);
}

@end