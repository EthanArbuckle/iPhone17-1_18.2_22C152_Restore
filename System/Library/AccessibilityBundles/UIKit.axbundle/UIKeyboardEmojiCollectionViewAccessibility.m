@interface UIKeyboardEmojiCollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView;
- (double)_accessibilityMaxFuzzyHitTestDistance;
- (id)_accessibilityFirstOpaqueElement;
- (id)_accessibilityLocalizedVisibleSectionNames;
- (id)_accessibilityScrollStatus;
- (id)_accessibilitySortedElementsWithin;
@end

@implementation UIKeyboardEmojiCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardEmojiCollectionView";
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
  [location[0] validateClass:@"UIKeyboardEmojiSplitCharacterPicker"];
  v5 = @"UIKeyboardEmojiCollectionView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v3 = @"UIKeyboardEmojiCategory";
  v7 = "q";
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", "Q", 0);
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v3, @"displayName:", v7, 0);
  v6 = @"UIScrollView";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  [location[0] validateClass:v5 isKindOfClass:v6];
  [location[0] validateClass:@"UIKeyboardEmojiCollectionInputView" hasInstanceVariable:@"_flowLayout" withType:"UICollectionViewFlowLayout"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewFlowLayout", @"scrollDirection", v7, 0);
  objc_storeStrong(v9, v8);
}

- (id)_accessibilitySortedElementsWithin
{
  v12 = self;
  SEL v11 = a2;
  id v5 = (id)[(UIKeyboardEmojiCollectionViewAccessibility *)self safeValueForKeyPath:@"delegate._flowLayout"];
  uint64_t v6 = [v5 safeIntegerForKey:@"scrollDirection"];

  uint64_t v10 = v6;
  if (v6)
  {
    id v4 = (id)[(UIKeyboardEmojiCollectionViewAccessibility *)v12 subviews];
    id v8 = (id)objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_23);

    id v7 = (id)[v8 sortedArrayUsingSelector:sel__emojiCompare_];
    id v13 = v7;
    objc_storeStrong(&v7, 0);
    objc_storeStrong(&v8, 0);
  }
  else
  {
    v9.receiver = v12;
    v9.super_class = (Class)UIKeyboardEmojiCollectionViewAccessibility;
    id v13 = [(UIKeyboardEmojiCollectionViewAccessibility *)&v9 _accessibilitySortedElementsWithin];
  }
  v2 = v13;

  return v2;
}

uint64_t __80__UIKeyboardEmojiCollectionViewAccessibility__accessibilitySortedElementsWithin__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  int v3 = [location[0] accessibilityElementsHidden] ^ 1;
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (id)_accessibilityScrollStatus
{
  v14 = self;
  v13[1] = (id)a2;
  v12.receiver = self;
  v12.super_class = (Class)UIKeyboardEmojiCollectionViewAccessibility;
  v13[0] = [(UIKeyboardEmojiCollectionViewAccessibility *)&v12 _accessibilityScrollStatus];
  id v11 = -[UIKeyboardEmojiCollectionViewAccessibility _accessibilityLocalizedVisibleSectionNames](v14);
  id v10 = 0;
  if ([v11 count])
  {
    id v6 = -[UIKeyboardEmojiCollectionViewAccessibility _accessibilityLocalizedVisibleSectionNames](v14);
    id v9 = (id)MEMORY[0x2455E6560]();

    id v7 = NSString;
    id v8 = accessibilityLocalizedString(@"emoji.keyboard.pages_and_visible_categories");
    id v2 = (id)objc_msgSend(v7, "stringWithFormat:", v13[0], v9);
    id v3 = v10;
    id v10 = v2;

    objc_storeStrong(&v9, 0);
  }
  else
  {
    objc_storeStrong(&v10, v13[0]);
  }
  id v5 = v10;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(v13, 0);

  return v5;
}

- (id)_accessibilityLocalizedVisibleSectionNames
{
  v52[1] = a1;
  if (a1)
  {
    v52[0] = (id)[MEMORY[0x263EFF980] array];
    char v50 = 0;
    objc_opt_class();
    id v49 = (id)__UIAccessibilityCastAsClass();
    id v48 = v49;
    objc_storeStrong(&v49, 0);
    id v51 = v48;
    id v16 = (id)[v48 dataSource];
    char v46 = 0;
    LOBYTE(v17) = 0;
    if (v16)
    {
      id v47 = (id)[v51 dataSource];
      char v46 = 1;
      NSClassFromString(&cfstr_Uikeyboardemoj_10.isa);
      int v17 = objc_opt_isKindOfClass() ^ 1;
    }
    if (v46) {

    }
    if (v17)
    {
      [v51 visibleBounds];
      v45.origin.x = v1;
      v45.origin.y = v2;
      v45.size.width = v3;
      v45.size.height = v4;
      uint64_t v44 = [v51 numberOfSections];
      for (int i = 0; i < v44; ++i)
      {
        id v14 = v51;
        uint64_t v13 = *MEMORY[0x263F1D120];
        id v15 = (id)[MEMORY[0x263F088C8] indexPathForItem:0 inSection:i];
        id v42 = (id)objc_msgSend(v14, "layoutAttributesForSupplementaryElementOfKind:atIndexPath:", v13);

        [v42 frame];
        v41.origin.x = v5;
        v41.origin.y = v6;
        v41.size.width = v7;
        v41.size.height = v8;
        if (CGRectIntersectsRect(v45, v41))
        {
          uint64_t v40 = 0;
          uint64_t v35 = 0;
          v36 = &v35;
          int v37 = 0x20000000;
          int v38 = 32;
          uint64_t v39 = 0;
          uint64_t v28 = MEMORY[0x263EF8330];
          int v29 = -1073741824;
          int v30 = 0;
          v31 = __88__UIKeyboardEmojiCollectionViewAccessibility__accessibilityLocalizedVisibleSectionNames__block_invoke;
          v32 = &unk_2650AE020;
          v33 = &v35;
          int v34 = i;
          AXPerformSafeBlock();
          uint64_t v27 = v36[3];
          _Block_object_dispose(&v35, 8);
          uint64_t v40 = v27;
          id v11 = NSString;
          id v12 = accessibilityLocalizedString(@"emoji.category");
          uint64_t v19 = 0;
          v20 = &v19;
          int v21 = 838860800;
          int v22 = 48;
          v23 = __Block_byref_object_copy__14;
          v24 = __Block_byref_object_dispose__14;
          id v25 = 0;
          AXPerformSafeBlock();
          id v18 = (id)v20[5];
          _Block_object_dispose(&v19, 8);
          objc_storeStrong(&v25, 0);
          id v26 = (id)objc_msgSend(v11, "stringWithFormat:", v12, v18);

          if (v26) {
            [v52[0] addObject:v26];
          }
          objc_storeStrong(&v26, 0);
        }
        objc_storeStrong(&v42, 0);
      }
    }
    id v53 = v52[0];
    objc_storeStrong(&v51, 0);
    objc_storeStrong(v52, 0);
  }
  else
  {
    id v53 = 0;
  }
  id v9 = v53;

  return v9;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (double)_accessibilityMaxFuzzyHitTestDistance
{
  return 30.0;
}

uint64_t __88__UIKeyboardEmojiCollectionViewAccessibility__accessibilityLocalizedVisibleSectionNames__block_invoke(uint64_t a1)
{
  uint64_t result = [NSClassFromString(&cfstr_Uikeyboardemoj.isa) categoryTypeForCategoryIndex:*(int *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __88__UIKeyboardEmojiCollectionViewAccessibility__accessibilityLocalizedVisibleSectionNames__block_invoke_357(uint64_t a1)
{
  id v1 = (id)[NSClassFromString(&cfstr_Uikeyboardemoj.isa) displayName:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  CGFloat v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

- (id)_accessibilityFirstOpaqueElement
{
  id v11 = self;
  v10[1] = (id)a2;
  char v9 = 0;
  objc_opt_class();
  id v4 = (id)[(UIKeyboardEmojiCollectionViewAccessibility *)v11 _accessibilityValueForKey:@"LastEmojiSelected"];
  id v8 = (id)__UIAccessibilityCastAsClass();

  id v7 = v8;
  objc_storeStrong(&v8, 0);
  v10[0] = v7;
  if ([v7 _accessibilityViewIsVisible])
  {
    id v12 = v10[0];
  }
  else
  {
    v5.receiver = v11;
    v5.super_class = (Class)UIKeyboardEmojiCollectionViewAccessibility;
    id v12 = [(UIKeyboardEmojiCollectionViewAccessibility *)&v5 _accessibilityFirstOpaqueElement];
  }
  int v6 = 1;
  objc_storeStrong(v10, 0);
  uint64_t v2 = v12;

  return v2;
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 0;
}

@end