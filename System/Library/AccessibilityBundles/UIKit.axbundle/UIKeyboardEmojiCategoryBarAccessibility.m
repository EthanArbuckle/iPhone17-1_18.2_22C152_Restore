@interface UIKeyboardEmojiCategoryBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
- (uint64_t)_accessibilityTraitsForElementAtIndex:(void *)a1;
- (void)setSelectedIndex:(unint64_t)a3;
@end

@implementation UIKeyboardEmojiCategoryBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardEmojiCategoryBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  id v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = @"UIKeyboardEmojiCategory";
  v4 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v5, @"displayName:", v4, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v5, @"enabledCategoryIndexes", v3, 0);
  v6 = "Q";
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v5, @"categoryTypeForCategoryIndex:", v4, "Q", 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v5, @"categoryForType:", v3, v4, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v5, @"categoryIndexForCategoryType:", v6, v4, 0);
  [location[0] validateClass:@"UIKeyboardEmojiCategoryBar" hasInstanceVariable:@"_selectedIndex" withType:v6];
  objc_storeStrong(v8, v7);
}

- (id)accessibilityElements
{
  v20 = self;
  v19[1] = (id)a2;
  v19[0] = (id)[(UIKeyboardEmojiCategoryBarAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (!v19[0])
  {
    v19[0] = objc_alloc_init(MEMORY[0x263EFF980]);

    [(UIKeyboardEmojiCategoryBarAccessibility *)v20 _accessibilitySetRetainedValue:v19[0] forKey:*MEMORY[0x263F81490]];
    char v17 = 0;
    objc_opt_class();
    id v5 = (id)[NSClassFromString(&cfstr_Uikeyboardemoj.isa) safeValueForKey:@"enabledCategoryIndexes"];
    id v16 = (id)__UIAccessibilityCastAsClass();

    id v15 = v16;
    objc_storeStrong(&v16, 0);
    id v18 = v15;
    Class v14 = NSClassFromString(&cfstr_Uikeyboardemoj.isa);
    id v4 = v18;
    uint64_t v6 = MEMORY[0x263EF8330];
    int v7 = -1073741824;
    int v8 = 0;
    v9 = __64__UIKeyboardEmojiCategoryBarAccessibility_accessibilityElements__block_invoke;
    v10 = &unk_2650AEE68;
    v13[1] = v14;
    v11 = v20;
    id v12 = v18;
    v13[0] = v19[0];
    [v4 enumerateObjectsUsingBlock:&v6];
    objc_storeStrong(v13, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong((id *)&v11, 0);
    objc_storeStrong(&v18, 0);
  }
  id v3 = v19[0];
  objc_storeStrong(v19, 0);

  return v3;
}

void __64__UIKeyboardEmojiCategoryBarAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v56 = (void *)a3;
  v55[2] = a4;
  v55[1] = (id)a1;
  char v54 = 0;
  objc_opt_class();
  id v53 = (id)__UIAccessibilityCastAsClass();
  id v52 = v53;
  objc_storeStrong(&v53, 0);
  v55[0] = v52;
  int v4 = [v52 intValue];
  uint64_t v51 = v4;
  uint64_t v43 = 0;
  v44 = &v43;
  int v45 = 838860800;
  int v46 = 48;
  v47 = __Block_byref_object_copy__13;
  v48 = __Block_byref_object_dispose__13;
  id v49 = 0;
  uint64_t v35 = MEMORY[0x263EF8330];
  int v36 = -1073741824;
  int v37 = 0;
  v38 = __64__UIKeyboardEmojiCategoryBarAccessibility_accessibilityElements__block_invoke_2;
  v39 = &unk_2650AEE40;
  v40 = &v43;
  uint64_t v41 = *(void *)(a1 + 56);
  uint64_t v42 = v4;
  AXPerformSafeBlock();
  id v34 = (id)v44[5];
  _Block_object_dispose(&v43, 8);
  objc_storeStrong(&v49, 0);
  id v50 = v34;
  if (v34)
  {
    char v31 = 0;
    uint64_t v23 = 0;
    v24 = &v23;
    int v25 = 838860800;
    int v26 = 48;
    v27 = __Block_byref_object_copy__13;
    v28 = __Block_byref_object_dispose__13;
    id v29 = 0;
    uint64_t v16 = MEMORY[0x263EF8330];
    int v17 = -1073741824;
    int v18 = 0;
    v19 = __64__UIKeyboardEmojiCategoryBarAccessibility_accessibilityElements__block_invoke_3;
    v20 = &unk_2650AE048;
    v21 = &v23;
    uint64_t v22 = v51;
    AXPerformSafeBlock();
    id v15 = (id)v24[5];
    _Block_object_dispose(&v23, 8);
    objc_storeStrong(&v29, 0);
    id v30 = (id)__UIAccessibilitySafeClass();

    if (v31) {
      abort();
    }
    id v14 = v30;
    objc_storeStrong(&v30, 0);
    id v32 = v14;
    v13 = [[UIAccessibilityElementKBEmojiCategory alloc] initWithAccessibilityContainer:*(void *)(a1 + 32)];
    -[UIAccessibilityElementKBEmojiCategory setAccessibilityTraits:](v13, "setAccessibilityTraits:", -[UIKeyboardEmojiCategoryBarAccessibility _accessibilityTraitsForElementAtIndex:](*(void **)(a1 + 32), (uint64_t)v56));
    v9 = v13;
    int v8 = v56;
    id v5 = (void *)[*(id *)(a1 + 40) count];
    id location[3] = v8;
    location[2] = v5;
    location[4] = v8;
    location[5] = v5;
    -[UIAccessibilityElementKBEmojiCategory _accessibilitySetRowRange:](v9, "_accessibilitySetRowRange:", v8, v5);
    -[UIAccessibilityElementKBEmojiCategory setCategory:]((uint64_t)v13, v32);
    Class v6 = NSClassFromString(&cfstr_Uikeyboardemoj.isa);
    uint64_t v7 = [(objc_class *)v6 categoryIndexForCategoryType:v51];
    -[UIAccessibilityElementKBEmojiCategory setCategoryIndex:]((uint64_t)v13, v7);
    [*(id *)(a1 + 48) addObject:v13];
    objc_storeStrong((id *)&v13, 0);
    objc_storeStrong(&v32, 0);
    int v33 = 0;
  }
  else
  {
    int v33 = 1;
  }
  objc_storeStrong(&v50, 0);
  objc_storeStrong(v55, 0);
  if (!v33) {
    int v33 = 0;
  }
  objc_storeStrong(location, 0);
}

void __64__UIKeyboardEmojiCategoryBarAccessibility_accessibilityElements__block_invoke_2(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 40) displayName:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

void __64__UIKeyboardEmojiCategoryBarAccessibility_accessibilityElements__block_invoke_3(uint64_t a1)
{
  id v1 = (id)[NSClassFromString(&cfstr_Uikeyboardemoj.isa) categoryForType:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

- (uint64_t)_accessibilityTraitsForElementAtIndex:(void *)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = *MEMORY[0x263F1CF28];
  if (a2 == [a1 safeUnsignedIntegerForKey:@"_selectedIndex"]) {
    return v3 | *MEMORY[0x263F1CF38];
  }
  return v3;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  id v14 = self;
  SEL v13 = a2;
  unint64_t v12 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIKeyboardEmojiCategoryBarAccessibility;
  [(UIKeyboardEmojiCategoryBarAccessibility *)&v11 setSelectedIndex:a3];
  id v10 = (id)[(UIKeyboardEmojiCategoryBarAccessibility *)v14 _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (v10)
  {
    id v3 = v10;
    uint64_t v4 = MEMORY[0x263EF8330];
    int v5 = -1073741824;
    int v6 = 0;
    uint64_t v7 = __60__UIKeyboardEmojiCategoryBarAccessibility_setSelectedIndex___block_invoke;
    int v8 = &unk_2650AE910;
    v9 = v14;
    [v3 enumerateObjectsUsingBlock:&v4];
    objc_storeStrong((id *)&v9, 0);
  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)*MEMORY[0x263F21A08]);
  objc_storeStrong(&v10, 0);
}

void __60__UIKeyboardEmojiCategoryBarAccessibility_setSelectedIndex___block_invoke(void **a1, void *a2, uint64_t a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "setAccessibilityTraits:", -[UIKeyboardEmojiCategoryBarAccessibility _accessibilityTraitsForElementAtIndex:](a1[4], a3));
  objc_storeStrong(location, 0);
}

@end