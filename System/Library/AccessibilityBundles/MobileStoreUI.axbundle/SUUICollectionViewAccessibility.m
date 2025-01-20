@interface SUUICollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView;
- (BOOL)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4;
- (BOOL)accessibilityScrollDownPageSupported;
- (BOOL)accessibilityScrollUpPageSupported;
@end

@implementation SUUICollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUICollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SUUIStorePageCollectionViewLayout"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIStorePageCollectionViewLayout", @"_itemPinningConfigurationForItemAtIndexPath:", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIStorePageItemPinningConfiguration", @"hasValidPinningStyle", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIStorePageItemPinningConfiguration", @"pinningStyle", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIStorePageItemPinningConfiguration", @"hasValidPinningContentInset", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIStorePageItemPinningConfiguration", @"pinningContentInset", "{UIEdgeInsets=dddd}", 0);
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 1;
}

- (BOOL)accessibilityScrollDownPageSupported
{
  id v3 = [(SUUICollectionViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Musicverticals.isa)];

  if (v3) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SUUICollectionViewAccessibility;
  return [(SUUICollectionViewAccessibility *)&v5 accessibilityScrollDownPageSupported];
}

- (BOOL)accessibilityScrollUpPageSupported
{
  id v3 = [(SUUICollectionViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Musicverticals.isa)];

  if (v3) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SUUICollectionViewAccessibility;
  return [(SUUICollectionViewAccessibility *)&v5 accessibilityScrollUpPageSupported];
}

- (BOOL)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4
{
  double height = a3.size.height;
  double x = a3.origin.x;
  double width = a3.size.width;
  double y = a3.origin.y;
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v35 = a4;
  v36 = self;
  v40 = [(SUUICollectionViewAccessibility *)self collectionViewLayout];
  NSClassFromString(&cfstr_Suuistorepagec.isa);
  if (objc_opt_isKindOfClass())
  {
    v31 = [v40 safeValueForKey:@"indexPathsForPinningItems"];
    v32 = [v35 _accessibilityAncestorIsKindOf:objc_opt_class()];
    if (v32)
    {
      v37 = -[SUUICollectionViewAccessibility indexPathForCell:](self, "indexPathForCell:");
      if (v37)
      {
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id obj = v31;
        uint64_t v7 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
        if (v7)
        {
          uint64_t v8 = 0;
          uint64_t v39 = *(void *)v62;
          do
          {
            uint64_t v9 = 0;
            uint64_t v10 = v8;
            do
            {
              if (*(void *)v62 != v39) {
                objc_enumerationMutation(obj);
              }
              v11 = *(void **)(*((void *)&v61 + 1) + 8 * v9);
              uint64_t v48 = 0;
              v49 = (double *)&v48;
              uint64_t v50 = 0x3032000000;
              v51 = __Block_byref_object_copy_;
              *(void *)&long long v52 = __Block_byref_object_dispose_;
              *((void *)&v52 + 1) = 0;
              uint64_t v54 = MEMORY[0x263EF8330];
              uint64_t v55 = 3221225472;
              v56 = __71__SUUICollectionViewAccessibility__accessibilityScrollToFrame_forView___block_invoke;
              v57 = &unk_2651382D8;
              v60 = &v48;
              id v58 = v40;
              v59 = v11;
              AXPerformSafeBlock();
              id v12 = *((id *)v49 + 5);

              _Block_object_dispose(&v48, 8);
              double v13 = 0.0;
              if ([v12 safeBoolForKey:@"hasValidPinningStyle"])
              {
                uint64_t v14 = [v12 safeIntegerForKey:@"pinningStyle"];
                uint64_t v8 = v14;
                if (v14
                  && v14 != 3
                  && [v12 safeBoolForKey:@"hasValidPinningContentInset"])
                {
                  uint64_t v48 = 0;
                  v49 = (double *)&v48;
                  uint64_t v50 = 0x4010000000;
                  v51 = (uint64_t (*)(uint64_t, uint64_t))&unk_24233A247;
                  long long v52 = 0u;
                  long long v53 = 0u;
                  uint64_t v42 = MEMORY[0x263EF8330];
                  uint64_t v43 = 3221225472;
                  v44 = __71__SUUICollectionViewAccessibility__accessibilityScrollToFrame_forView___block_invoke_2;
                  v45 = &unk_265138300;
                  v47 = &v48;
                  id v46 = v12;
                  AXPerformSafeBlock();
                  double v15 = v49[4];
                  double v16 = v49[6];

                  _Block_object_dispose(&v48, 8);
                  v17 = [(SUUICollectionViewAccessibility *)v36 layoutAttributesForItemAtIndexPath:v11];
                  [v17 size];
                  double v19 = v18;

                  uint64_t v20 = [v11 section];
                  double v21 = v15 + v16 + v19;
                  if (v20 < [v37 section]
                    || (uint64_t v24 = [v11 section], v24 == objc_msgSend(v37, "section"))
                    && (uint64_t v25 = [v11 row], v25 < objc_msgSend(v37, "row")))
                  {
                    BOOL v22 = v10 == 1 || v8 == 1;
                    double v13 = 0.0;
                    if (v22) {
                      double v23 = v21;
                    }
                    else {
                      double v23 = v21 + 0.0;
                    }
                  }
                  else
                  {
                    int v26 = [v11 isEqual:v37];
                    if (v8 == 5) {
                      int v27 = v26;
                    }
                    else {
                      int v27 = 1;
                    }
                    double v23 = 0.0;
                    if (v27) {
                      double v13 = 0.0;
                    }
                    else {
                      double v13 = v21 + 0.0;
                    }
                  }
                }
                else
                {
                  double v23 = 0.0;
                }
              }
              else
              {
                double v23 = 0.0;
                uint64_t v8 = v10;
              }

              double y = y - v23;
              double height = height + v13 + v23;
              ++v9;
              uint64_t v10 = v8;
            }
            while (v7 != v9);
            uint64_t v28 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
            uint64_t v7 = v28;
          }
          while (v28);
        }
      }
    }
  }
  v41.receiver = v36;
  v41.super_class = (Class)SUUICollectionViewAccessibility;
  BOOL v29 = -[SUUICollectionViewAccessibility _accessibilityScrollToFrame:forView:](&v41, sel__accessibilityScrollToFrame_forView_, v35, x, y, width, height);

  return v29;
}

uint64_t __71__SUUICollectionViewAccessibility__accessibilityScrollToFrame_forView___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _itemPinningConfigurationForItemAtIndexPath:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

void __71__SUUICollectionViewAccessibility__accessibilityScrollToFrame_forView___block_invoke_2(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) safeValueForKey:@"pinningContentInset"];
  [v7 UIEdgeInsetsValue];
  v2 = *(void **)(*(void *)(a1 + 40) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
}

@end