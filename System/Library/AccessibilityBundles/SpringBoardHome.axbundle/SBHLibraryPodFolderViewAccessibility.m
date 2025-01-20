@interface SBHLibraryPodFolderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)automationElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation SBHLibraryPodFolderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHLibraryPodFolderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderView", @"firstIconListView", "@", 0);
  [v3 validateClass:@"SBHLibraryPodFolderView" isKindOfClass:@"SBFolderView"];
  [v3 validateClass:@"SBIconListView" hasInstanceVariable:@"_iconViews" withType:"NSMapTable"];
  [v3 validateClass:@"SBHLibraryPodFolderView" hasInstanceVariable:@"_podScrollView" withType:"BSUIScrollView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"icon", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"_axIconView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SBHLibraryPodFolderViewAccessibility;
  [(SBHLibraryPodFolderViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SBHLibraryPodFolderViewAccessibility *)self safeUIViewForKey:@"_podScrollView"];
  [v3 setAccessibilityContainerType:0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBHLibraryPodFolderViewAccessibility;
  [(SBHLibraryPodFolderViewAccessibility *)&v3 layoutSubviews];
  [(SBHLibraryPodFolderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)automationElements
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  [(SBHLibraryPodFolderViewAccessibility *)self _accessibilityVisibleFrame];
  if (v3 == 0.0)
  {
    objc_super v4 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v5 = [(SBHLibraryPodFolderViewAccessibility *)self safeValueForKey:@"firstIconListView"];
    v6 = [v5 safeArrayForKey:@"icons"];

    char v37 = 0;
    v7 = [(SBHLibraryPodFolderViewAccessibility *)self safeValueForKey:@"firstIconListView"];
    v8 = [v7 safeValueForKey:@"_iconViews"];
    v28 = __UIAccessibilitySafeClass();

    objc_super v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v34;
      id v25 = v9;
      v26 = v4;
      uint64_t v24 = *(void *)v34;
      do
      {
        uint64_t v13 = 0;
        uint64_t v27 = v11;
        do
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v33 + 1) + 8 * v13);
          id v15 = [v14 safeValueForKey:@"_axIconView"];
          if (!v15)
          {
            long long v31 = 0u;
            long long v32 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            v16 = [v28 objectEnumerator];
            id v15 = (id)[v16 countByEnumeratingWithState:&v29 objects:v38 count:16];
            if (v15)
            {
              uint64_t v17 = *(void *)v30;
              while (2)
              {
                for (i = 0; i != v15; i = (char *)i + 1)
                {
                  if (*(void *)v30 != v17) {
                    objc_enumerationMutation(v16);
                  }
                  v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
                  v20 = [v19 safeValueForKey:@"icon"];
                  int v21 = [v20 isEqual:v14];

                  if (v21)
                  {
                    id v15 = v19;
                    goto LABEL_19;
                  }
                }
                id v15 = (id)[v16 countByEnumeratingWithState:&v29 objects:v38 count:16];
                if (v15) {
                  continue;
                }
                break;
              }
LABEL_19:
              id v9 = v25;
              objc_super v4 = v26;
              uint64_t v12 = v24;
              uint64_t v11 = v27;
            }
          }
          if (v15) {
            id v22 = v15;
          }
          else {
            id v22 = v14;
          }
          [v4 addObject:v22];

          ++v13;
        }
        while (v13 != v11);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v11);
    }
  }

  return v4;
}

@end