@interface TUICandidateGridAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityScannerGroupElements;
- (int64_t)accessibilityNavigationStyle;
- (void)setSelectedIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5;
@end

@implementation TUICandidateGridAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TUICandidateGrid";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TUICandidateGrid", @"setSelectedIndexPath:animated:scrollPosition:", "v", "@", "B", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TUICandidateGrid", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionView", @"indexPathForSupplementaryView:", "@", "@", 0);
  [v3 validateClass:@"TUICandidateGrid" hasInstanceVariable:@"_selectedIndexPath" withType:"NSIndexPath"];
}

- (int64_t)accessibilityNavigationStyle
{
  return 2;
}

- (id)_accessibilityScannerGroupElements
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  v40 = [MEMORY[0x263F81198] defaultSwitchControlOptions];
  [v40 setSorted:0];
  [v40 setShouldReturnScannerGroups:0];
  id v3 = [(TUICandidateGridAccessibility *)self _accessibilityLeafDescendantsWithOptions:v40];
  v48 = [MEMORY[0x263EFF9A0] dictionary];
  objc_opt_class();
  v49 = __UIAccessibilityCastAsClass();
  LOBYTE(buf) = 0;
  objc_opt_class();
  v4 = [(TUICandidateGridAccessibility *)self safeValueForKey:@"collectionView"];
  v47 = __UIAccessibilityCastAsClass();

  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v67 objects:v82 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v68 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        [v8 accessibilityFrame];
        UIAccessibilityFrameToBounds();
        double v10 = v9;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = [v47 indexPathForCell:v8];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v13 = AXLogAppAccessibility();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v8;
              _os_log_error_impl(&dword_242667000, v13, OS_LOG_TYPE_ERROR, "Unexpected element in candidate grid: %@", (uint8_t *)&buf, 0xCu);
            }

            goto LABEL_15;
          }
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v78 = 0x3032000000;
          v79 = __Block_byref_object_copy_;
          v80 = __Block_byref_object_dispose_;
          id v81 = 0;
          uint64_t v60 = MEMORY[0x263EF8330];
          uint64_t v61 = 3221225472;
          v62 = __67__TUICandidateGridAccessibility__accessibilityScannerGroupElements__block_invoke;
          v63 = &unk_26515FA80;
          p_long long buf = &buf;
          id v64 = v47;
          v65 = v8;
          AXPerformSafeBlock();
          id v11 = *(id *)(*((void *)&buf + 1) + 40);

          _Block_object_dispose(&buf, 8);
        }
        if (v11)
        {
          uint64_t v12 = [v11 section];
          goto LABEL_18;
        }
LABEL_15:
        v14 = AXLogAppAccessibility();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v8;
          _os_log_error_impl(&dword_242667000, v14, OS_LOG_TYPE_ERROR, "Unable to get index path from element in candidate grid: %@", (uint8_t *)&buf, 0xCu);
        }

        id v11 = 0;
        uint64_t v12 = -1;
LABEL_18:
        v15 = [NSNumber numberWithUnsignedInteger:v12];
        v16 = [v48 objectForKeyedSubscript:v15];

        if (!v16)
        {
          v16 = [MEMORY[0x263EFF9A0] dictionary];
          v17 = [NSNumber numberWithUnsignedInteger:v12];
          [v48 setObject:v16 forKeyedSubscript:v17];
        }
        double v18 = round(v10);
        v19 = [NSNumber numberWithDouble:v18];
        v20 = [v16 objectForKeyedSubscript:v19];

        if (!v20)
        {
          v20 = [MEMORY[0x263EFF980] array];
          v21 = [NSNumber numberWithDouble:v18];
          [v16 setObject:v20 forKeyedSubscript:v21];
        }
        [v20 addObject:v8];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v67 objects:v82 count:16];
    }
    while (v5);
  }

  v43 = [MEMORY[0x263EFF980] array];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v22 = [v48 allKeys];
  objc_msgSend(v22, "sortedArrayUsingSelector:");
  id v41 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v44 = [v41 countByEnumeratingWithState:&v56 objects:v76 count:16];
  if (v44)
  {
    uint64_t v42 = *(void *)v57;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v57 != v42)
        {
          uint64_t v24 = v23;
          objc_enumerationMutation(v41);
          uint64_t v23 = v24;
        }
        uint64_t v45 = v23;
        v25 = [v48 objectForKeyedSubscript:*(void *)(*((void *)&v56 + 1) + 8 * v23)];
        v26 = [MEMORY[0x263EFF980] array];
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        v27 = [v25 allKeys];
        v28 = [v27 sortedArrayUsingSelector:sel_compare_];

        uint64_t v29 = [v28 countByEnumeratingWithState:&v52 objects:v75 count:16];
        if (v29)
        {
          uint64_t v30 = *(void *)v53;
          do
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v53 != v30) {
                objc_enumerationMutation(v28);
              }
              v32 = [v25 objectForKeyedSubscript:*(void *)(*((void *)&v52 + 1) + 8 * j)];
              v50[0] = MEMORY[0x263EF8330];
              v50[1] = 3221225472;
              v50[2] = __67__TUICandidateGridAccessibility__accessibilityScannerGroupElements__block_invoke_301;
              v50[3] = &unk_26515FAA8;
              id v51 = v49;
              v33 = [v32 sortedArrayUsingComparator:v50];

              v73[0] = @"GroupElements";
              v73[1] = @"GroupTraits";
              v74[0] = v33;
              v74[1] = &unk_26F813668;
              v73[2] = @"GroupScanBehaviorTraits";
              v74[2] = &unk_26F813680;
              v34 = [NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:3];
              [v26 addObject:v34];
            }
            uint64_t v29 = [v28 countByEnumeratingWithState:&v52 objects:v75 count:16];
          }
          while (v29);
        }

        v71[0] = @"GroupElements";
        v71[1] = @"GroupScanBehaviorTraits";
        v72[0] = v26;
        v72[1] = &unk_26F813680;
        v35 = [NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];
        [v43 addObject:v35];

        uint64_t v23 = v45 + 1;
      }
      while (v45 + 1 != v44);
      uint64_t v44 = [v41 countByEnumeratingWithState:&v56 objects:v76 count:16];
    }
    while (v44);
  }

  if ([v43 count] == 1)
  {
    v36 = [v43 firstObject];
    id v37 = [v36 objectForKeyedSubscript:@"GroupElements"];

    v38 = v43;
  }
  else
  {
    v38 = v43;
    id v37 = v43;
  }

  return v37;
}

uint64_t __67__TUICandidateGridAccessibility__accessibilityScannerGroupElements__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) indexPathForSupplementaryView:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

uint64_t __67__TUICandidateGridAccessibility__accessibilityScannerGroupElements__block_invoke_301(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 accessibilityFrame];
  UIAccessibilityFrameToBounds();
  double v6 = v5;
  [v4 accessibilityFrame];

  UIAccessibilityFrameToBounds();
  uint64_t v8 = -1;
  if (v6 >= v7) {
    uint64_t v8 = 1;
  }
  if (v6 == v7) {
    return 0;
  }
  else {
    return v8;
  }
}

- (void)setSelectedIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  double v9 = [(TUICandidateGridAccessibility *)self safeValueForKey:@"_selectedIndexPath"];
  v15.receiver = self;
  v15.super_class = (Class)TUICandidateGridAccessibility;
  [(TUICandidateGridAccessibility *)&v15 setSelectedIndexPath:v8 animated:v6 scrollPosition:a5];
  double v10 = [(TUICandidateGridAccessibility *)self safeValueForKey:@"_selectedIndexPath"];
  if (v9 != v10 && ([v9 isEqual:v10] & 1) == 0)
  {
    objc_opt_class();
    id v11 = [(TUICandidateGridAccessibility *)self safeValueForKey:@"collectionView"];
    uint64_t v12 = __UIAccessibilityCastAsClass();

    v13 = [v12 cellForItemAtIndexPath:v10];

    v14 = [v13 accessibilityLabel];
    if ([v14 length]) {
      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v14);
    }
  }
}

@end