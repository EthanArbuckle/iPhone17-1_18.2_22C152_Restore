@interface ShelfTitleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
- (void)prepareForReuse;
@end

@implementation ShelfTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.ShelfTitleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SeymourUI.ShelfTitleView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SeymourUI.ShelfTitleView", @"prepareForReuse", "v", 0);
}

- (id)accessibilityElements
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F81490];
  v4 = [(ShelfTitleViewAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (!v4)
  {
    v5 = [(ShelfTitleViewAccessibility *)self safeArrayForKey:@"subviews"];
    v6 = objc_msgSend(v5, "ax_filteredArrayUsingBlock:", &__block_literal_global_3);
    v7 = objc_msgSend(v5, "ax_filteredArrayUsingBlock:", &__block_literal_global_284_0);
    CGFloat v9 = *MEMORY[0x263F001A0];
    CGFloat v8 = *(double *)(MEMORY[0x263F001A0] + 8);
    CGFloat v11 = *(double *)(MEMORY[0x263F001A0] + 16);
    CGFloat v10 = *(double *)(MEMORY[0x263F001A0] + 24);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v52 objects:v58 count:16];
    double height = v10;
    double width = v11;
    double y = v8;
    double x = v9;
    if (v13)
    {
      uint64_t v18 = v13;
      uint64_t v19 = *(void *)v53;
      double height = v10;
      double width = v11;
      double y = v8;
      double x = v9;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v53 != v19) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v52 + 1) + 8 * i) frame];
          v69.origin.double x = v21;
          v69.origin.double y = v22;
          v69.size.double width = v23;
          v69.size.double height = v24;
          v61.origin.double x = x;
          v61.origin.double y = y;
          v61.size.double width = width;
          v61.size.double height = height;
          CGRect v62 = CGRectUnion(v61, v69);
          double x = v62.origin.x;
          double y = v62.origin.y;
          double width = v62.size.width;
          double height = v62.size.height;
        }
        uint64_t v18 = [v12 countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v18);
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v25 = v7;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v49 != v28) {
            objc_enumerationMutation(v25);
          }
          [*(id *)(*((void *)&v48 + 1) + 8 * j) frame];
          v70.origin.double x = v30;
          v70.origin.double y = v31;
          v70.size.double width = v32;
          v70.size.double height = v33;
          v63.origin.double x = v9;
          v63.origin.double y = v8;
          v63.size.double width = v11;
          v63.size.double height = v10;
          CGRect v64 = CGRectUnion(v63, v70);
          CGFloat v9 = v64.origin.x;
          CGFloat v8 = v64.origin.y;
          CGFloat v11 = v64.size.width;
          CGFloat v10 = v64.size.height;
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v27);
    }

    v65.origin.double x = x;
    v65.origin.double y = y;
    v65.size.double width = width;
    v65.size.double height = height;
    v71.origin.double x = v9;
    v71.origin.double y = v8;
    v71.size.double width = v11;
    v71.size.double height = v10;
    CGRect v66 = CGRectIntersection(v65, v71);
    double v34 = v66.size.width;
    if (!CGRectIsNull(v66))
    {
      float v35 = v34;
      memset(&remainder, 0, sizeof(remainder));
      memset(&v46, 0, sizeof(v46));
      CGFloat v36 = v35;
      v67.origin.double x = x;
      v67.origin.double y = y;
      v67.size.double width = width;
      v67.size.double height = height;
      CGRectDivide(v67, &v46, &remainder, v36, CGRectMaxXEdge);
      double x = remainder.origin.x;
      double y = remainder.origin.y;
      double width = remainder.size.width;
      double height = remainder.size.height;
    }
    LOBYTE(remainder.origin.x) = 0;
    objc_opt_class();
    uint64_t v37 = __UIAccessibilityCastAsClass();
    if (LOBYTE(remainder.origin.x)) {
      abort();
    }
    v38 = (void *)v37;
    v39 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:v37];
    v40 = objc_msgSend(v12, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_290);

    v41 = AXLabelForElements();
    [v39 setAccessibilityLabel:v41];

    [v39 setIsAccessibilityElement:1];
    v68.origin.double x = x;
    v68.origin.double y = y;
    v68.size.double width = width;
    v68.size.double height = height;
    if (CGRectIsNull(v68))
    {
      double x = *MEMORY[0x263F001A8];
      double y = *(double *)(MEMORY[0x263F001A8] + 8);
      double width = *(double *)(MEMORY[0x263F001A8] + 16);
      double height = *(double *)(MEMORY[0x263F001A8] + 24);
    }
    objc_msgSend(v39, "setAccessibilityFrameInContainerSpace:", x, y, width, height);
    [v39 setAccessibilityTraits:*MEMORY[0x263F1CF48] | *MEMORY[0x263F1CEF8]];
    uint64_t v42 = [(ShelfTitleViewAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_293];
    v43 = (void *)v42;
    v4 = 0;
    if (v39 && v42)
    {
      v56 = v39;
      v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
      v4 = [v44 arrayByAddingObjectsFromArray:v43];

      [(ShelfTitleViewAccessibility *)self _accessibilitySetRetainedValue:v4 forKey:*v3];
    }
  }

  return v4;
}

uint64_t __52__ShelfTitleViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __52__ShelfTitleViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __52__ShelfTitleViewAccessibility_accessibilityElements__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 accessibilityAttributedLabel];

  if (v3)
  {
    v4 = [v2 accessibilityAttributedLabel];
    v5 = [v4 string];
    [v2 setAccessibilityLabel:v5];
  }
  v6 = [v2 accessibilityLabel];

  return v6;
}

BOOL __52__ShelfTitleViewAccessibility_accessibilityElements__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v4 = 0;
  if (v2 && (isKindOfClass & 1) != 0)
  {
    v5 = [v2 accessibilityLabel];
    BOOL v4 = [v5 length] != 0;
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)ShelfTitleViewAccessibility;
  [(ShelfTitleViewAccessibility *)&v3 prepareForReuse];
  [(ShelfTitleViewAccessibility *)self _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
}

@end