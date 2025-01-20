@interface SKUICollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView;
- (BOOL)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4;
- (BOOL)accessibilityScrollDownPageSupported;
- (BOOL)accessibilityScrollUpPageSupported;
@end

@implementation SKUICollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUICollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SKUIStorePageCollectionViewLayout"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIStorePageCollectionViewLayout", @"_itemPinningConfigurationForItemAtIndexPath:", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIStorePageItemPinningConfiguration", @"hasValidPinningStyle", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIStorePageItemPinningConfiguration", @"pinningStyle", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIStorePageItemPinningConfiguration", @"hasValidPinningContentInset", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SKUIStorePageItemPinningConfiguration", @"pinningContentInset", "{UIEdgeInsets=dddd}", 0);
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 1;
}

- (BOOL)accessibilityScrollDownPageSupported
{
  id v3 = [(SKUICollectionViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Musicverticals.isa)];

  if (v3) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SKUICollectionViewAccessibility;
  return [(SKUICollectionViewAccessibility *)&v5 accessibilityScrollDownPageSupported];
}

- (BOOL)accessibilityScrollUpPageSupported
{
  id v3 = [(SKUICollectionViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Musicverticals.isa)];

  if (v3) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SKUICollectionViewAccessibility;
  return [(SKUICollectionViewAccessibility *)&v5 accessibilityScrollUpPageSupported];
}

- (BOOL)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4
{
  double height = a3.size.height;
  double x = a3.origin.x;
  double width = a3.size.width;
  double y = a3.origin.y;
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v36 = a4;
  v37 = self;
  v35 = [(SKUICollectionViewAccessibility *)self collectionViewLayout];
  NSClassFromString(&cfstr_Skuistorepagec.isa);
  if (objc_opt_isKindOfClass())
  {
    id v41 = v35;
    v31 = [v41 indexPathsForPinningItems];
    v32 = [v36 _accessibilityAncestorIsKindOf:objc_opt_class()];
    if (v32)
    {
      v38 = -[SKUICollectionViewAccessibility indexPathForCell:](self, "indexPathForCell:");
      if (v38)
      {
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id obj = v31;
        uint64_t v7 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
        if (v7)
        {
          uint64_t v8 = 0;
          uint64_t v40 = *(void *)v63;
          do
          {
            uint64_t v9 = 0;
            uint64_t v10 = v8;
            do
            {
              if (*(void *)v63 != v40) {
                objc_enumerationMutation(obj);
              }
              v11 = *(void **)(*((void *)&v62 + 1) + 8 * v9);
              uint64_t v49 = 0;
              v50 = (double *)&v49;
              uint64_t v51 = 0x3032000000;
              v52 = __Block_byref_object_copy__3;
              *(void *)&long long v53 = __Block_byref_object_dispose__3;
              *((void *)&v53 + 1) = 0;
              uint64_t v55 = MEMORY[0x263EF8330];
              uint64_t v56 = 3221225472;
              v57 = __71__SKUICollectionViewAccessibility__accessibilityScrollToFrame_forView___block_invoke;
              v58 = &unk_2650AB7B0;
              v61 = &v49;
              id v59 = v41;
              v60 = v11;
              AXPerformSafeBlock();
              id v12 = *((id *)v50 + 5);

              _Block_object_dispose(&v49, 8);
              double v13 = 0.0;
              if ([v12 safeBoolForKey:@"hasValidPinningStyle"])
              {
                uint64_t v14 = [v12 safeIntegerForKey:@"pinningStyle"];
                uint64_t v8 = v14;
                if (v14
                  && v14 != 3
                  && [v12 safeBoolForKey:@"hasValidPinningContentInset"])
                {
                  uint64_t v49 = 0;
                  v50 = (double *)&v49;
                  uint64_t v51 = 0x4010000000;
                  v52 = (uint64_t (*)(uint64_t, uint64_t))&unk_2402B0F8F;
                  long long v53 = 0u;
                  long long v54 = 0u;
                  uint64_t v43 = MEMORY[0x263EF8330];
                  uint64_t v44 = 3221225472;
                  v45 = __71__SKUICollectionViewAccessibility__accessibilityScrollToFrame_forView___block_invoke_2;
                  v46 = &unk_2650AB6C8;
                  v48 = &v49;
                  id v47 = v12;
                  AXPerformSafeBlock();
                  double v15 = v50[4];
                  double v16 = v50[6];

                  _Block_object_dispose(&v49, 8);
                  v17 = [(SKUICollectionViewAccessibility *)v37 layoutAttributesForItemAtIndexPath:v11];
                  [v17 size];
                  double v19 = v18;

                  uint64_t v20 = [v11 section];
                  double v21 = v15 + v16 + v19;
                  if (v20 < [v38 section]
                    || (uint64_t v24 = [v11 section], v24 == objc_msgSend(v38, "section"))
                    && (uint64_t v25 = [v11 row], v25 < objc_msgSend(v38, "row")))
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
                    int v26 = objc_msgSend(v11, "isEqual:", v38, v31, v32);
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
            uint64_t v28 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
            uint64_t v7 = v28;
          }
          while (v28);
        }
      }
    }
  }
  v42.receiver = v37;
  v42.super_class = (Class)SKUICollectionViewAccessibility;
  BOOL v29 = -[SKUICollectionViewAccessibility _accessibilityScrollToFrame:forView:](&v42, sel__accessibilityScrollToFrame_forView_, v36, x, y, width, height, v31);

  return v29;
}

uint64_t __71__SKUICollectionViewAccessibility__accessibilityScrollToFrame_forView___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _itemPinningConfigurationForItemAtIndexPath:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

void __71__SKUICollectionViewAccessibility__accessibilityScrollToFrame_forView___block_invoke_2(uint64_t a1)
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