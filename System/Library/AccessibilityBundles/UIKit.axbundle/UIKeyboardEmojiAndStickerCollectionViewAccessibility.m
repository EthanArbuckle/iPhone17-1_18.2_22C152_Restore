@interface UIKeyboardEmojiAndStickerCollectionViewAccessibility
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

@implementation UIKeyboardEmojiAndStickerCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardEmojiAndStickerCollectionView";
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
  v5 = @"UIKeyboardEmojiAndStickerCollectionView";
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
  id v5 = (id)[(UIKeyboardEmojiAndStickerCollectionViewAccessibility *)self safeValueForKeyPath:@"delegate._flowLayout"];
  uint64_t v6 = [v5 safeIntegerForKey:@"scrollDirection"];

  uint64_t v10 = v6;
  if (v6)
  {
    id v4 = (id)[(UIKeyboardEmojiAndStickerCollectionViewAccessibility *)v12 subviews];
    id v8 = (id)objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_1);

    id v7 = (id)[v8 sortedArrayUsingSelector:sel__emojiCompare_];
    id v13 = v7;
    objc_storeStrong(&v7, 0);
    objc_storeStrong(&v8, 0);
  }
  else
  {
    v9.receiver = v12;
    v9.super_class = (Class)UIKeyboardEmojiAndStickerCollectionViewAccessibility;
    id v13 = [(UIKeyboardEmojiAndStickerCollectionViewAccessibility *)&v9 _accessibilitySortedElementsWithin];
  }
  v2 = v13;

  return v2;
}

uint64_t __90__UIKeyboardEmojiAndStickerCollectionViewAccessibility__accessibilitySortedElementsWithin__block_invoke(void *a1, void *a2)
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
  SEL v11 = self;
  v10[1] = (id)a2;
  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardEmojiAndStickerCollectionViewAccessibility;
  v10[0] = [(UIKeyboardEmojiAndStickerCollectionViewAccessibility *)&v9 _accessibilityScrollStatus];
  id v8 = -[UIKeyboardEmojiAndStickerCollectionViewAccessibility _accessibilityLocalizedVisibleSectionNames](v11);
  id v7 = 0;
  if ([v8 count])
  {
    id v4 = -[UIKeyboardEmojiAndStickerCollectionViewAccessibility _accessibilityLocalizedVisibleSectionNames](v11);
    id v6 = (id)MEMORY[0x2455E6560]();

    id v5 = accessibilityLocalizedString(@"emoji.keyboard.pages_and_visible_categories");
    id v12 = (id)AXCFormattedString();

    objc_storeStrong(&v6, 0);
  }
  else
  {
    objc_storeStrong(&v7, v10[0]);
    id v12 = v7;
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v10, 0);
  v2 = v12;

  return v2;
}

- (id)_accessibilityLocalizedVisibleSectionNames
{
  v51[1] = a1;
  if (a1)
  {
    v51[0] = (id)[MEMORY[0x263EFF980] array];
    char v49 = 0;
    objc_opt_class();
    id v48 = (id)__UIAccessibilityCastAsClass();
    id v47 = v48;
    objc_storeStrong(&v48, 0);
    id v50 = v47;
    id v15 = (id)[v47 dataSource];
    char v45 = 0;
    LOBYTE(v16) = 0;
    if (v15)
    {
      id v46 = (id)[v50 dataSource];
      char v45 = 1;
      NSClassFromString(&cfstr_Uikeyboardemoj_10.isa);
      int v16 = objc_opt_isKindOfClass() ^ 1;
    }
    if (v45) {

    }
    if (v16)
    {
      [v50 visibleBounds];
      v44.origin.x = v1;
      v44.origin.y = v2;
      v44.size.width = v3;
      v44.size.height = v4;
      uint64_t v43 = [v50 numberOfSections];
      for (int i = 0; i < v43; ++i)
      {
        id v13 = v50;
        uint64_t v12 = *MEMORY[0x263F1D120];
        id v14 = (id)[MEMORY[0x263F088C8] indexPathForItem:0 inSection:i];
        id v41 = (id)objc_msgSend(v13, "layoutAttributesForSupplementaryElementOfKind:atIndexPath:", v12);

        [v41 frame];
        v40.origin.x = v5;
        v40.origin.y = v6;
        v40.size.width = v7;
        v40.size.height = v8;
        if (CGRectIntersectsRect(v44, v40))
        {
          uint64_t v39 = 0;
          uint64_t v34 = 0;
          v35 = &v34;
          int v36 = 0x20000000;
          int v37 = 32;
          uint64_t v38 = 0;
          uint64_t v27 = MEMORY[0x263EF8330];
          int v28 = -1073741824;
          int v29 = 0;
          v30 = __98__UIKeyboardEmojiAndStickerCollectionViewAccessibility__accessibilityLocalizedVisibleSectionNames__block_invoke;
          v31 = &unk_2650AE020;
          v32 = &v34;
          int v33 = i;
          AXPerformSafeBlock();
          uint64_t v26 = v35[3];
          _Block_object_dispose(&v34, 8);
          uint64_t v39 = v26;
          id v11 = accessibilityLocalizedString(@"emoji.category");
          uint64_t v18 = 0;
          v19 = &v18;
          int v20 = 838860800;
          int v21 = 48;
          v22 = __Block_byref_object_copy__0;
          v23 = __Block_byref_object_dispose__0;
          id v24 = 0;
          AXPerformSafeBlock();
          id v17 = (id)v19[5];
          _Block_object_dispose(&v18, 8);
          objc_storeStrong(&v24, 0);
          id v25 = (id)AXCFormattedString();

          if (v25) {
            objc_msgSend(v51[0], "addObject:", v25, v17);
          }
          objc_storeStrong(&v25, 0);
        }
        objc_storeStrong(&v41, 0);
      }
    }
    id v52 = v51[0];
    objc_storeStrong(&v50, 0);
    objc_storeStrong(v51, 0);
  }
  else
  {
    id v52 = 0;
  }
  objc_super v9 = v52;

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

uint64_t __98__UIKeyboardEmojiAndStickerCollectionViewAccessibility__accessibilityLocalizedVisibleSectionNames__block_invoke(uint64_t a1)
{
  uint64_t result = [NSClassFromString(&cfstr_Uikeyboardemoj.isa) categoryTypeForCategoryIndex:*(int *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __98__UIKeyboardEmojiAndStickerCollectionViewAccessibility__accessibilityLocalizedVisibleSectionNames__block_invoke_354(uint64_t a1)
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
  id v4 = (id)[(UIKeyboardEmojiAndStickerCollectionViewAccessibility *)v11 _accessibilityValueForKey:@"LastEmojiSelected"];
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
    v5.super_class = (Class)UIKeyboardEmojiAndStickerCollectionViewAccessibility;
    id v12 = [(UIKeyboardEmojiAndStickerCollectionViewAccessibility *)&v5 _accessibilityFirstOpaqueElement];
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