@interface UIKeyboardEmojiCollectionInputViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (void)willDisplayModalActionView:(id)a3 withSubTreeKeyView:(id)a4 completion:(id)a5;
@end

@implementation UIKeyboardEmojiCollectionInputViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardEmojiCollectionInputView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id v5 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = "@";
  v3 = @"UIKeyboardEmojiCollectionInputView";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "@", "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"collectionView: viewForSupplementaryElementOfKind: atIndexPath:", v4, v4, v4, 0);
  objc_storeStrong(v6, v5);
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v13 = 0;
  objc_storeStrong(&v13, a5);
  v11.receiver = v16;
  v11.super_class = (Class)UIKeyboardEmojiCollectionInputViewAccessibility;
  id v12 = [(UIKeyboardEmojiCollectionInputViewAccessibility *)&v11 collectionView:location[0] viewForSupplementaryElementOfKind:v14 atIndexPath:v13];
  id v8 = v12;
  id v9 = (id)objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "section"));
  objc_msgSend(v8, "_accessibilitySetRetainedValue:forKey:");

  id v10 = v12;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);

  return v10;
}

- (void)willDisplayModalActionView:(id)a3 withSubTreeKeyView:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  id v20 = 0;
  objc_storeStrong(&v20, a5);
  v19.receiver = v23;
  v19.super_class = (Class)UIKeyboardEmojiCollectionInputViewAccessibility;
  [(UIKeyboardEmojiCollectionInputViewAccessibility *)&v19 willDisplayModalActionView:location[0] withSubTreeKeyView:v21 completion:v20];
  id v18 = (id)[location[0] subviews];
  memset(__b, 0, sizeof(__b));
  id v14 = v18;
  uint64_t v15 = [v14 countByEnumeratingWithState:__b objects:v24 count:16];
  if (v15)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0;
    unint64_t v11 = v15;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(v14);
      }
      v17 = *(void **)(__b[1] + 8 * v10);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = v17;
        CGSizeMake_0();
        objc_msgSend(v7, "_accessibilitySetFrameExpansion:", v5, v6);
      }
      ++v10;
      if (v8 + 1 >= v11)
      {
        uint64_t v10 = 0;
        unint64_t v11 = [v14 countByEnumeratingWithState:__b objects:v24 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

@end