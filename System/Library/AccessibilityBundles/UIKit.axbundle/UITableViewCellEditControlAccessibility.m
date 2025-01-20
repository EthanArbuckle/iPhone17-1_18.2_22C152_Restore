@interface UITableViewCellEditControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityElementsHidden;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (id)_multiSelectNotSelectedImage;
- (id)_multiSelectSelectedImage;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation UITableViewCellEditControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITableViewCellEditControl";
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
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"UITableViewCellEditControl";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCellEditControl", @"isRotated", "B", 0);
  v3 = "@";
  [location[0] validateClass:v4 hasInstanceMethod:@"_currentImage" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_multiSelectNotSelectedImage", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_multiSelectSelectedImage", v3, 0);
  [location[0] validateClass:v4 hasInstanceVariable:@"_imageView" withType:"UIImageView"];
  objc_storeStrong(v6, obj);
}

- (BOOL)accessibilityElementsHidden
{
  id v2 = (id)[(UITableViewCellEditControlAccessibility *)self safeValueForKey:@"_currentImage"];
  BOOL v4 = v2 != 0;

  return !v4;
}

- (BOOL)isAccessibilityElement
{
  v12 = self;
  location[1] = (id)a2;
  id v2 = (id)[(UITableViewCellEditControlAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v9 = v2 == 0;

  if (v9)
  {
    location[0] = (id)[(UITableViewCellEditControlAccessibility *)v12 _accessibilityViewAncestorIsKindOf:objc_opt_class()];
    id v6 = (id)[location[0] safeValueForKey:@"editingStyle"];
    int v7 = [v6 intValue];

    uint64_t v10 = AXRequestingClient();
    if (v10 == 3 || v10 == 4)
    {
      char v13 = (v7 - 1) > 2;
    }
    else
    {
      char v5 = 1;
      if (v7 != 3)
      {
        char v4 = 0;
        if (v7 == 2) {
          char v4 = [location[0] _accessibilityBoolValueForKey:@"accessibilityShouldNotBeAnElementIfInsertEditStyle"];
        }
        char v5 = v4;
      }
      char v13 = (v5 ^ 1) & 1;
    }
    objc_storeStrong(location, 0);
  }
  else
  {
    id v8 = (id)[(UITableViewCellEditControlAccessibility *)v12 isAccessibilityUserDefinedElement];
    char v13 = [v8 BOOLValue] & 1;
  }
  return v13 & 1;
}

- (id)accessibilityValue
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITableViewCellEditControlAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  id v7 = (id)[location[0] safeValueForKey:@"editingStyle"];
  int v8 = [v7 intValue];

  int v13 = v8;
  if (v8 == 3)
  {
    id v5 = (id)[(UITableViewCellEditControlAccessibility *)v15 safeValueForKey:@"isHighlighted"];
    char v11 = 0;
    char v6 = 1;
    if (([v5 BOOLValue] & 1) == 0)
    {
      id v12 = (id)[(UITableViewCellEditControlAccessibility *)v15 safeValueForKey:@"isSelected"];
      char v11 = 1;
      char v6 = [v12 BOOLValue];
    }
    if (v6) {
      id v2 = @"1";
    }
    else {
      id v2 = @"0";
    }
    v16 = v2;
    if (v11) {

    }
    int v10 = 1;
  }
  else
  {
    v9.receiver = v15;
    v9.super_class = (Class)UITableViewCellEditControlAccessibility;
    v16 = (__CFString *)[(UITableViewCellEditControlAccessibility *)&v9 accessibilityValue];
    int v10 = 1;
  }
  objc_storeStrong(location, 0);
  v3 = v16;

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v15 = self;
  SEL v14 = a2;
  unint64_t v13 = 0;
  v12.receiver = self;
  v12.super_class = (Class)UITableViewCellEditControlAccessibility;
  unint64_t v13 = [(UITableViewCellEditControlAccessibility *)&v12 accessibilityTraits] | *MEMORY[0x263F1CEE8];
  id location = (id)[(UITableViewCellEditControlAccessibility *)v15 _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  id v7 = (id)[location safeValueForKey:@"editingStyle"];
  unsigned int v8 = [v7 intValue];

  if (v8)
  {
    uint64_t v3 = v8;
    char v2 = 1;
  }
  else
  {
    uint64_t v3 = 0;
    char v2 = 0;
  }
  if ((v2 & 1) == 0)
  {
    switch(v3)
    {
      case 0:
      case 2:
        break;
      case 1:
        if (AXRequestingClient() != 5 && AXRequestingClient() != 7) {
          v13 |= *MEMORY[0x263F813E8];
        }
        break;
      case 3:
        v13 |= *MEMORY[0x263F1CF60];
        break;
      default:
        JUMPOUT(0);
    }
  }
  char v9 = 0;
  if (v8 == 3 || (char v6 = 0, !v8))
  {
    id v10 = (id)[(UITableViewCellEditControlAccessibility *)v15 safeValueForKey:@"isEnabled"];
    char v9 = 1;
    char v6 = [v10 BOOLValue];
  }
  if (v9) {

  }
  if (v6) {
    v13 &= ~*MEMORY[0x263F1CF20];
  }
  unint64_t v5 = v13;
  objc_storeStrong(&location, 0);
  return v5;
}

- (id)accessibilityLabel
{
  v20 = self;
  v19[1] = (id)a2;
  id v2 = (id)[(UITableViewCellEditControlAccessibility *)self accessibilityUserDefinedLabel];
  BOOL v13 = v2 == 0;

  if (v13)
  {
    v19[0] = (id)[(UITableViewCellEditControlAccessibility *)v20 _accessibilityViewAncestorIsKindOf:objc_opt_class()];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = (id)[v19[0] safeValueForKey:@"editingStyle"];
      uint64_t v12 = [v11 integerValue];

      uint64_t v17 = v12;
      if (v12 == 1)
      {
        id location = (id)[v19[0] safeValueForKey:@"_accessibilityTextElementText"];
        if ([location length])
        {
          char v9 = NSString;
          id v10 = accessibilityLocalizedString(@"remove.control.text.with.label");
          id v21 = (id)[v9 stringWithFormat:location];
        }
        else
        {
          id v21 = accessibilityLocalizedString(@"remove.control.text");
        }
        int v18 = 1;
        objc_storeStrong(&location, 0);
      }
      else if (v17 == 2)
      {
        id v15 = (id)[v19[0] safeValueForKey:@"_accessibilityTextElementText"];
        if ([v15 length])
        {
          id v7 = NSString;
          id v8 = accessibilityLocalizedString(@"insert.control.text.with.label");
          id v21 = (id)[v7 stringWithFormat:v15];
        }
        else
        {
          id v21 = accessibilityLocalizedString(@"insert.control.text");
        }
        int v18 = 1;
        objc_storeStrong(&v15, 0);
      }
      else if (v17 == 3)
      {
        id v14 = (id)[v19[0] safeValueForKey:@"_accessibilityTextElementText"];
        if ([v14 length])
        {
          unint64_t v5 = NSString;
          id v6 = accessibilityLocalizedString(@"select.control.text.with.label");
          id v21 = (id)[v5 stringWithFormat:v14];
        }
        else
        {
          id v21 = accessibilityLocalizedString(@"select.control.text");
        }
        int v18 = 1;
        objc_storeStrong(&v14, 0);
      }
      else
      {
        id v21 = 0;
        int v18 = 1;
      }
    }
    else
    {
      id v21 = 0;
      int v18 = 1;
    }
    objc_storeStrong(v19, 0);
  }
  else
  {
    id v21 = (id)[(UITableViewCellEditControlAccessibility *)v20 accessibilityUserDefinedLabel];
  }
  uint64_t v3 = v21;

  return v3;
}

- (id)accessibilityHint
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITableViewCellEditControlAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (id)[location[0] safeValueForKey:@"editingStyle"];
    uint64_t v5 = [v4 integerValue];

    if (v5 == 1) {
      id v7 = accessibilityLocalizedString(@"remove.control.hint");
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  objc_storeStrong(location, 0);
  id v2 = v7;

  return v2;
}

- (BOOL)canBecomeFocused
{
  id v8 = self;
  SEL v7 = a2;
  char v5 = 0;
  BOOL v3 = 0;
  if ([(UITableViewCellEditControlAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    id v6 = (id)[(UITableViewCellEditControlAccessibility *)v8 safeValueForKey:@"_currentImage"];
    char v5 = 1;
    BOOL v3 = v6 == 0;
  }
  if (v5) {

  }
  if (v3) {
    return 0;
  }
  v4.receiver = v8;
  v4.super_class = (Class)UITableViewCellEditControlAccessibility;
  return [(UITableViewCellEditControlAccessibility *)&v4 canBecomeFocused];
}

- (id)_multiSelectNotSelectedImage
{
  v5[2] = self;
  v5[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellEditControlAccessibility;
  v5[0] = [(UITableViewCellEditControlAccessibility *)&v4 _multiSelectNotSelectedImage];
  [v5[0] setAccessibilityIdentifier:@"circle"];
  id v3 = v5[0];
  objc_storeStrong(v5, 0);

  return v3;
}

- (id)_multiSelectSelectedImage
{
  v5[2] = self;
  v5[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellEditControlAccessibility;
  v5[0] = [(UITableViewCellEditControlAccessibility *)&v4 _multiSelectSelectedImage];
  [v5[0] setAccessibilityIdentifier:@"selected"];
  id v3 = v5[0];
  objc_storeStrong(v5, 0);

  return v3;
}

@end