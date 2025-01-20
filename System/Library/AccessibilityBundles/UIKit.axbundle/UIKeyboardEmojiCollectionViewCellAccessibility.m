@interface UIKeyboardEmojiCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAllowsAlternativeCharacterActivation;
- (BOOL)_accessibilityHasVariantKeys;
- (BOOL)_accessibilityKeyboardKeyHasSignificantAlternateActions;
- (BOOL)isAccessibilityElement;
- (_NSRange)accessibilityRowRange;
- (id)_accessibilityCachedVariantKeys;
- (id)_accessibilityVariantKeys;
- (id)_axEmoji;
- (id)accessibilityHeaderElements;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOptions;
- (void)_accessibilitySetCachedVariantKeys:(uint64_t)a1;
- (void)accessibilityElementDidBecomeFocused;
- (void)prepareForReuse;
- (void)setEmoji:(id)a3;
@end

@implementation UIKeyboardEmojiCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardEmojiCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v13 = location;
  id v12 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"UIKeyboardEmojiCollectionViewCell";
  v5 = @"UICollectionViewCell";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v8 = "@";
  [location[0] validateClass:@"UIKeyboardEmojiCollectionViewCell" hasInstanceMethod:@"emoji" withFullSignature:0];
  v3 = @"UIKeyboardEmoji";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v7 = "Q";
  [location[0] validateClass:v3 hasInstanceMethod:@"variantMask" withFullSignature:0];
  v6 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"setEmoji:", v8, 0);
  [location[0] validateClass:@"UIKeyboardLayoutStar" hasInstanceVariable:@"_keyplaneView" withType:"UIKBKeyplaneView"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKBKeyplaneView", @"activeKeyViews", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKBKeyView", @"key", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"prepareForReuse", v6, 0);
  v9 = @"UIKeyboardEmojiCollectionView";
  objc_msgSend(location[0], "validateClass:");
  v11 = @"UIKeyboardEmojiCollectionInputView";
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardEmojiCategoryBar", @"selectedIndex", v7, 0);
  v10 = @"UIScrollView";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  [location[0] validateClass:v9 isKindOfClass:v10];
  [location[0] validateClass:v11 hasInstanceVariable:@"_flowLayout" withType:"UICollectionViewFlowLayout"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewFlowLayout", @"scrollDirection", "q", 0);
  objc_storeStrong(v13, v12);
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0x80000;
}

- (id)_axEmoji
{
  id v7 = a1;
  if (a1)
  {
    char v6 = 0;
    id v3 = (id)[v7 safeValueForKey:@"emoji"];
    id v5 = (id)__UIAccessibilitySafeClass();

    id v4 = v5;
    objc_storeStrong(&v5, 0);
    id v8 = v4;
  }
  else
  {
    id v8 = 0;
  }
  v1 = v8;

  return v1;
}

- (void)accessibilityElementDidBecomeFocused
{
  id v3 = self;
  v2[1] = (id)a2;
  v2[0] = (id)[(UIKeyboardEmojiCollectionViewCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  [v2[0] _accessibilitySetRetainedValue:v3 forKey:@"LastEmojiSelected"];
  objc_storeStrong(v2, 0);
}

- (_NSRange)accessibilityRowRange
{
  v11 = self;
  v10[1] = (id)a2;
  v10[0] = (id)[(UIKeyboardEmojiCollectionViewCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  id location = (id)[v10[0] indexPathForCell:v11];
  uint64_t v8 = [v10[0] numberOfSections];
  NSUInteger v7 = 0;
  uint64_t v6 = [location row];
  for (uint64_t i = 0; i < v8; ++i)
  {
    uint64_t v4 = [v10[0] numberOfItemsInSection:i];
    if (i < [location section]) {
      v6 += v4;
    }
    v7 += v4;
  }
  uint64_t v15 = v6;
  NSUInteger v14 = v7;
  uint64_t v16 = v6;
  NSUInteger v17 = v7;
  NSUInteger v12 = v6;
  NSUInteger v13 = v7;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v10, 0);
  NSUInteger v2 = v12;
  NSUInteger v3 = v13;
  result.length = v3;
  result.id location = v2;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v8[2] = self;
  v8[1] = (id)a2;
  v8[0] = -[UIKeyboardEmojiCollectionViewCellAccessibility _axEmoji](self);
  id v7 = (id)[v8[0] safeValueForKey:@"emojiString"];
  if ([v8[0] safeUnsignedIntegerForKey:@"variantMask"])
  {
    id v6 = (id)[NSString _stringWithUnichar:65039];
    id v2 = (id)objc_msgSend(v7, "stringByAppendingString:");
    id v3 = v7;
    id v7 = v2;
  }
  id v5 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(v8, 0);

  return v5;
}

- (int64_t)accessibilityContainerType
{
  id v6 = self;
  SEL v5 = a2;
  id v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardEmojiCollectionViewCellAccessibility;
  id v4 = [(UIKeyboardEmojiCollectionViewCellAccessibility *)&v3 accessibilityContainerType];
  if (v4 == (id)4 || v4 == (id)14) {
    return 0;
  }
  else {
    return (int64_t)v4;
  }
}

- (BOOL)_accessibilityAllowsAlternativeCharacterActivation
{
  return 1;
}

- (id)accessibilityHeaderElements
{
  v12[1] = *MEMORY[0x263EF8340];
  v10 = self;
  v9[1] = (id)a2;
  v9[0] = (id)[(UIKeyboardEmojiCollectionViewCellAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uikeyboardemoj_14.isa)];
  id v8 = (id)[v9[0] indexPathForCell:v10];
  uint64_t v4 = *MEMORY[0x263F1D120];
  id v5 = (id)objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", 0, objc_msgSend(v8, "section"));
  id v7 = (id)objc_msgSend(v9[0], "supplementaryViewForElementKind:atIndexPath:", v4);

  id location = (id)[v7 _accessibilityValueForKey:@"emojiCategory"];
  if (location)
  {
    v12[0] = v7;
    id v11 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  }
  else
  {
    id v11 = 0;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v9, 0);
  id v2 = v11;

  return v2;
}

- (unint64_t)accessibilityTraits
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UIKeyboardEmojiCollectionViewCellAccessibility *)self accessibilityContainer];
  uint64_t v5 = 1;
  NSClassFromString(&cfstr_Uikeyboardemoj_11.isa);
  if (objc_opt_isKindOfClass())
  {
    id v3 = (id)[location[0] safeValueForKeyPath:@"delegate._flowLayout"];
    uint64_t v5 = [v3 safeIntegerForKey:@"scrollDirection"];
  }
  unint64_t v4 = *MEMORY[0x263F1CF28];
  if (v5) {
    v4 |= *MEMORY[0x263F1CF08];
  }
  objc_storeStrong(location, 0);
  return v4;
}

- (void)setEmoji:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIKeyboardEmojiCollectionViewCellAccessibility;
  [(UIKeyboardEmojiCollectionViewCellAccessibility *)&v3 setEmoji:location[0]];
  -[UIKeyboardEmojiCollectionViewCellAccessibility _accessibilitySetCachedVariantKeys:]((uint64_t)v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_accessibilitySetCachedVariantKeys:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

- (void)prepareForReuse
{
  unint64_t v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardEmojiCollectionViewCellAccessibility;
  [(UIKeyboardEmojiCollectionViewCellAccessibility *)&v2 prepareForReuse];
  -[UIKeyboardEmojiCollectionViewCellAccessibility _accessibilitySetCachedVariantKeys:]((uint64_t)v4, 0);
}

- (BOOL)_accessibilityHasVariantKeys
{
  v10 = self;
  SEL v9 = a2;
  id v7 = -[UIKeyboardEmojiCollectionViewCellAccessibility _axEmoji](self);
  id EMFEmojiTokenClass = getEMFEmojiTokenClass();
  id v5 = (id)[v7 safeStringForKey:@"emojiString"];
  id location = (id)objc_msgSend(EMFEmojiTokenClass, "emojiTokenWithString:localeData:");

  BOOL v8 = ([location supportsSkinToneVariants] & 1) != 0;
  BOOL v3 = v8;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v7, 0);
  return v3;
}

- (id)_accessibilityCachedVariantKeys
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &__UIKeyboardEmojiCollectionViewCellAccessibility___accessibilityCachedVariantKeys);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)_accessibilityVariantKeys
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v38 = self;
  v37[1] = (id)a2;
  v37[0] = -[UIKeyboardEmojiCollectionViewCellAccessibility _accessibilityCachedVariantKeys](self);
  if (![v37[0] count])
  {
    id v19 = (id)UIAccessibilityGetKeyboardLayoutStar();
    id v36 = (id)[v19 safeValueForKey:@"_keyplaneView"];

    id v35 = (id)[v36 safeValueForKey:@"activeKeyViews"];
    [(UIKeyboardEmojiCollectionViewCellAccessibility *)v38 accessibilityActivationPoint];
    point.x = v2;
    point.y = v3;
    id v33 = 0;
    memset(__b, 0, sizeof(__b));
    id obj = v35;
    uint64_t v21 = [obj countByEnumeratingWithState:__b objects:v40 count:16];
    if (v21)
    {
      uint64_t v16 = *(void *)__b[2];
      uint64_t v17 = 0;
      unint64_t v18 = v21;
      while (1)
      {
        uint64_t v15 = v17;
        if (*(void *)__b[2] != v16) {
          objc_enumerationMutation(obj);
        }
        id v32 = *(id *)(__b[1] + 8 * v17);
        [v32 accessibilityFrame];
        CGRect rect = v43;
        if (CGRectContainsPoint(v43, point))
        {
          char v29 = 0;
          objc_opt_class();
          id v14 = (id)[v32 safeValueForKey:@"key"];
          id v28 = (id)__UIAccessibilityCastAsClass();

          if (v29) {
            abort();
          }
          id v27 = v28;
          objc_storeStrong(&v28, 0);
          id v4 = v33;
          id v33 = v27;
        }
        ++v17;
        if (v15 + 1 >= v18)
        {
          uint64_t v17 = 0;
          unint64_t v18 = [obj countByEnumeratingWithState:__b objects:v40 count:16];
          if (!v18) {
            break;
          }
        }
      }
    }

    if (v33)
    {
      id v26 = +[UIAccessibilityElementKBKey variantKeysForKey:](UIAccessibilityElementKBKey, v33);
      memset(v24, 0, sizeof(v24));
      id v12 = v26;
      uint64_t v13 = [v12 countByEnumeratingWithState:v24 objects:v39 count:16];
      if (v13)
      {
        uint64_t v9 = *(void *)v24[2];
        uint64_t v10 = 0;
        unint64_t v11 = v13;
        while (1)
        {
          uint64_t v8 = v10;
          if (*(void *)v24[2] != v9) {
            objc_enumerationMutation(v12);
          }
          id v25 = *(id *)(v24[1] + 8 * v10);
          id v7 = (id)-[UIAccessibilityElementKBKey key]((uint64_t)v25);
          id v23 = (id)[v7 displayString];

          id v22 = (id)[MEMORY[0x263F228D0] stringByReplacingEmojiCharactersWithEmojiDescriptions:v23];
          [v25 setAccessibilityLabel:v22];
          objc_storeStrong(&v22, 0);
          objc_storeStrong(&v23, 0);
          ++v10;
          if (v8 + 1 >= v11)
          {
            uint64_t v10 = 0;
            unint64_t v11 = [v12 countByEnumeratingWithState:v24 objects:v39 count:16];
            if (!v11) {
              break;
            }
          }
        }
      }

      -[UIKeyboardEmojiCollectionViewCellAccessibility _accessibilitySetCachedVariantKeys:]((uint64_t)v38, v26);
      objc_storeStrong(v37, v26);
      objc_storeStrong(&v26, 0);
    }
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v35, 0);
    objc_storeStrong(&v36, 0);
  }
  id v6 = v37[0];
  objc_storeStrong(v37, 0);

  return v6;
}

- (BOOL)_accessibilityKeyboardKeyHasSignificantAlternateActions
{
  return 1;
}

@end