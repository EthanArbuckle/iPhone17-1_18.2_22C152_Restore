@interface UIKeyboardStickerCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UIKeyboardStickerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardStickerCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardStickerCollectionViewCell", @"imageGlyph", "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityIdentifier
{
  v10 = self;
  SEL v9 = a2;
  id v5 = (id)[(UIKeyboardStickerCollectionViewCellAccessibility *)self safeValueForKeyPath:@"imageGlyph.toString"];
  char v6 = 0;
  if (v5)
  {
    id v2 = v5;
  }
  else
  {
    v8.receiver = v10;
    v8.super_class = (Class)UIKeyboardStickerCollectionViewCellAccessibility;
    id v7 = [(UIKeyboardStickerCollectionViewCellAccessibility *)&v8 accessibilityIdentifier];
    char v6 = 1;
    id v2 = v7;
  }
  id v11 = v2;
  if (v6) {

  }
  v3 = v11;

  return v3;
}

- (id)accessibilityLabel
{
  objc_super v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)[(UIKeyboardStickerCollectionViewCellAccessibility *)self safeValueForKey:@"imageGlyph.accessibilityCaption"];
  id location = (id)[(UIKeyboardStickerCollectionViewCellAccessibility *)v8 safeValueForKey:@"imageGlyph.searchText"];
  if (v7[0])
  {
    id v9 = v7[0];
    int v5 = 1;
  }
  else
  {
    if (location)
    {
      id v9 = location;
    }
    else
    {
      v4.receiver = v8;
      v4.super_class = (Class)UIKeyboardStickerCollectionViewCellAccessibility;
      id v9 = [(UIKeyboardStickerCollectionViewCellAccessibility *)&v4 accessibilityLabel];
    }
    int v5 = 1;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v7, 0);
  id v2 = v9;

  return v2;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF28] | *MEMORY[0x263F1CF08];
}

@end