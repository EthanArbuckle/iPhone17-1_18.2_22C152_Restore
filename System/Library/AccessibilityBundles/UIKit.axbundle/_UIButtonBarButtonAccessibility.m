@interface _UIButtonBarButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityElementHasImage;
- (BOOL)accessibilityElementsHidden;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityNativeFocusPreferredElement;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (uint64_t)_axIsInvisibleButton;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIButtonBarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIButtonBarButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"_UIButtonBarButton";
  objc_msgSend(location[0], "validateClass:");
  [location[0] validateClass:@"_UIButtonBarButton" isKindOfClass:@"UIControl"];
  [location[0] validateClass:@"_UIButtonBarButton" hasInstanceVariable:@"_visualProvider" withType:"_UIButtonBarButtonVisualProvider"];
  v3 = @"_UIButtonBarButtonVisualProviderIOS";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:@"_UIButtonBarButtonVisualProviderIOS" hasInstanceVariable:@"_barButtonItem" withType:"UIBarButtonItem"];
  v5 = "@";
  [location[0] validateClass:@"_UIButtonBarButtonVisualProviderIOS" hasInstanceMethod:@"backIndicatorView" withFullSignature:0];
  [location[0] validateClass:v4 hasInstanceVariable:@"_backButton" withType:"B"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"visualProvider", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIButtonBarButtonVisualProvider", @"contentView", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIButton", @"imageView", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIImageView", @"image", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIImage", @"imageAsset", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIImageAsset", @"assetName", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UINavigationBarAccessibility", @"_accessibilityFauxBackButton", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIAccessibilityBackButtonElement", @"associatedViews", v5, 0);
  objc_storeStrong(v7, obj);
}

- (unint64_t)_accessibilityAutomationType
{
  return 9;
}

- (uint64_t)_axIsInvisibleButton
{
  v7[1] = a1;
  if (a1)
  {
    char v6 = 0;
    objc_opt_class();
    id v5 = (id)__UIAccessibilityCastAsClass();
    id v4 = v5;
    objc_storeStrong(&v5, 0);
    v7[0] = v4;
    id v3 = (id)[v4 tintColor];
    id v2 = (id)[MEMORY[0x263F1C550] clearColor];
    char v8 = objc_msgSend(v3, "isEqual:") & 1;

    objc_storeStrong(v7, 0);
  }
  else
  {
    char v8 = 0;
  }
  return v8 & 1;
}

- (BOOL)_accessibilityElementHasImage
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  char v8 = self;
  SEL v7 = a2;
  char v6 = 1;
  v4.receiver = self;
  v4.super_class = (Class)_UIButtonBarButtonAccessibility;
  id location = [(_UIButtonBarButtonAccessibility *)&v4 isAccessibilityUserDefinedElement];
  if (location) {
    char v6 = [location BOOLValue] & 1;
  }
  char v3 = v6;
  objc_storeStrong(&location, 0);
  return v3 & 1;
}

- (BOOL)accessibilityElementsHidden
{
  char v6 = self;
  SEL v5 = a2;
  BOOL v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIButtonBarButtonAccessibility;
  BOOL v4 = [(_UIButtonBarButtonAccessibility *)&v3 accessibilityElementsHidden];
  if (!v4) {
    return -[_UIButtonBarButtonAccessibility _axIsInvisibleButton](v6) & 1;
  }
  return v4;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v11 = self;
  SEL v10 = a2;
  unint64_t v9 = 0;
  v8.receiver = self;
  v8.super_class = (Class)_UIButtonBarButtonAccessibility;
  unint64_t v9 = [(_UIButtonBarButtonAccessibility *)&v8 accessibilityTraits];
  char v6 = 0;
  char v4 = 0;
  char v3 = 1;
  if (([(_UIButtonBarButtonAccessibility *)v11 safeBoolForKey:@"_backButton"] & 1) == 0)
  {
    id v7 = (id)[(_UIButtonBarButtonAccessibility *)v11 safeValueForKey:@"_visualProvider"];
    char v6 = 1;
    id v5 = (id)[v7 safeValueForKey:@"backIndicatorView"];
    char v4 = 1;
    char v3 = [v5 _accessibilityViewIsVisible];
  }
  if (v4) {

  }
  if (v6) {
  if (v3)
  }
    v9 |= *MEMORY[0x263F81370];
  else {
    v9 |= *MEMORY[0x263F1CEE8];
  }
  return v9;
}

- (id)accessibilityIdentifier
{
  id v7 = self;
  location[1] = (id)a2;
  v5.receiver = self;
  v5.super_class = (Class)_UIButtonBarButtonAccessibility;
  location[0] = [(_UIButtonBarButtonAccessibility *)&v5 accessibilityIdentifier];
  if (location[0])
  {
    objc_super v8 = (__CFString *)location[0];
  }
  else
  {
    uint64_t v2 = [(_UIButtonBarButtonAccessibility *)v7 accessibilityTraits];
    if ((v2 & *MEMORY[0x263F81370]) == *MEMORY[0x263F81370]) {
      objc_super v8 = @"BackButton";
    }
    else {
      objc_super v8 = 0;
    }
  }
  objc_storeStrong(location, 0);
  char v3 = v8;

  return v3;
}

- (id)accessibilityLabel
{
  v33 = self;
  v32[1] = (id)a2;
  v31.receiver = self;
  v31.super_class = (Class)_UIButtonBarButtonAccessibility;
  v32[0] = [(_UIButtonBarButtonAccessibility *)&v31 accessibilityUserDefinedLabel];
  if ([v32[0] length])
  {
    id v34 = v32[0];
    int v30 = 1;
    goto LABEL_30;
  }
  v29.receiver = v33;
  v29.super_class = (Class)_UIButtonBarButtonAccessibility;
  id v2 = [(_UIButtonBarButtonAccessibility *)&v29 accessibilityLabel];
  id v3 = v32[0];
  v32[0] = v2;

  id location = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v32[0] hasAttribute:*MEMORY[0x263F21790]])
  {
    objc_storeStrong(&location, v32[0]);
    objc_storeStrong(v32, 0);
  }
  id v16 = (id)[(_UIButtonBarButtonAccessibility *)v33 safeValueForKey:@"_visualProvider"];
  id v27 = (id)[v16 safeValueForKey:@"_titleButton"];

  char v24 = 0;
  if (v27)
  {
    id v25 = (id)[v27 accessibilityLabel];
    char v24 = 1;
    id v4 = v25;
  }
  else
  {
    id v4 = 0;
  }
  id v26 = v4;
  if (v24) {

  }
  if (v26 && [v26 length])
  {
    objc_storeStrong(v32, v26);
LABEL_16:
    if (![v32[0] length])
    {
      char v23 = 0;
      id v14 = (id)[(_UIButtonBarButtonAccessibility *)v33 safeValueForKey:@"tag"];
      uint64_t v15 = [v14 integerValue];

      uint64_t v22 = v15;
      if (v15)
      {
        char v23 = 1;
      }
      else
      {
        id v21 = (id)[(_UIButtonBarButtonAccessibility *)v33 accessibilityIdentification];
        if ([v21 length])
        {
          uint64_t v22 = [v21 integerValue];
          char v23 = 1;
        }
        objc_storeStrong(&v21, 0);
      }
      if (v23)
      {
        id v5 = (id)[MEMORY[0x263F1CB60] _accessibilityTitleForSystemTag:v22];
        id v6 = v32[0];
        v32[0] = v5;
      }
    }
    if ([location length])
    {
      id v7 = (id)AXSSAccessibilityDescriptionForSymbolName();
      id v8 = v32[0];
      v32[0] = v7;
    }
    if (!v32[0])
    {
      char v19 = 0;
      objc_opt_class();
      id v13 = (id)[(_UIButtonBarButtonAccessibility *)v33 safeValueForKeyPath:@"_visualProvider._barButtonItem"];
      id v18 = (id)__UIAccessibilityCastAsClass();

      id v17 = v18;
      objc_storeStrong(&v18, 0);
      id v20 = v17;
      id v9 = (id)[v17 accessibilityLabel];
      id v10 = v32[0];
      v32[0] = v9;

      objc_storeStrong(&v20, 0);
    }
    id v34 = v32[0];
    int v30 = 1;
    goto LABEL_29;
  }
  if (![v32[0] length]) {
    goto LABEL_16;
  }
  id v34 = v32[0];
  int v30 = 1;
LABEL_29:
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&location, 0);
LABEL_30:
  objc_storeStrong(v32, 0);
  v11 = v34;

  return v11;
}

- (id)accessibilityPath
{
  id v21 = self;
  location[1] = (id)a2;
  location[0] = (id)[(_UIButtonBarButtonAccessibility *)self _accessibilityDescendantOfType:objc_opt_class()];
  id v12 = (id)[location[0] accessibilityLabel];
  BOOL v13 = [v12 length] == 0;

  if (v13)
  {
    v14.receiver = v21;
    v14.super_class = (Class)_UIButtonBarButtonAccessibility;
    id v22 = [(_UIButtonBarButtonAccessibility *)&v14 accessibilityPath];
  }
  else
  {
    [location[0] accessibilityFrame];
    v19.origin.x = v2;
    v19.origin.y = v3;
    v19.size.width = v4;
    v19.size.height = v5;
    [(_UIButtonBarButtonAccessibility *)v21 accessibilityFrame];
    v18.origin.x = v6;
    v18.origin.y = v7;
    v18.size.width = v8;
    v18.size.height = v9;
    CGRect v17 = CGRectInset(v19, -10.0, 0.0);
    CGRect v19 = v17;
    CGRect v24 = CGRectUnion(v18, v17);
    CGRect v16 = v24;
    CGRect v18 = v24;
    id v22 = (id)objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height, 8.0);
  }
  int v15 = 1;
  objc_storeStrong(location, 0);
  id v10 = v22;

  return v10;
}

- (id)_accessibilityNativeFocusPreferredElement
{
  id v10 = self;
  v9[1] = (id)a2;
  v9[0] = (id)[(_UIButtonBarButtonAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  id location = (id)[v9[0] safeValueForKey:@"_accessibilityFauxBackButton"];
  id v4 = (id)[location safeArrayForKey:@"associatedViews"];
  char v5 = [v4 containsObject:v10];

  if (v5)
  {
    id v11 = location;
  }
  else
  {
    v6.receiver = v10;
    v6.super_class = (Class)_UIButtonBarButtonAccessibility;
    id v11 = [(_UIButtonBarButtonAccessibility *)&v6 _accessibilityNativeFocusPreferredElement];
  }
  int v7 = 1;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v9, 0);
  CGFloat v2 = v11;

  return v2;
}

@end