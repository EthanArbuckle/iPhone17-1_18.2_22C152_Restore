@interface UITabBarButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityElementHasImage;
- (BOOL)_accessibilityRetainsFocusOnScreenChange;
- (BOOL)_axIsSelected:(void *)a1;
- (BOOL)isAccessibilityElement;
- (_NSRange)accessibilityRowRange;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)_currentItemState;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
@end

@implementation UITabBarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITabBarButton";
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
  v4 = @"UITabBarButton";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:@"UITabBarButton" hasInstanceVariable:@"_imageView" withType:"UITabBarSwappableImageView"];
  v3 = @"UIImageView";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  [location[0] validateClass:@"UITabBarSwappableImageView" isKindOfClass:v3];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_currentItemState", "q", 0);
  objc_storeStrong(v6, obj);
}

- (BOOL)isAccessibilityElement
{
  id v2 = (id)[(UITabBarButtonAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v5 = v2 == 0;

  if (v5) {
    return 1;
  }
  id v4 = (id)[(UITabBarButtonAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v7 = [v4 BOOLValue] & 1;

  return v7;
}

- (BOOL)_accessibilityElementHasImage
{
  id v2 = (id)[(UITabBarButtonAccessibility *)self safeValueForKey:@"_imageView"];
  BOOL v4 = v2 != 0;

  return v4;
}

- (unint64_t)_accessibilityAutomationType
{
  return 9;
}

- (id)accessibilityValue
{
  v19 = self;
  v18[1] = (id)a2;
  id v2 = (id)[(UITabBarButtonAccessibility *)self accessibilityUserDefinedValue];
  BOOL v12 = v2 == 0;

  if (v12)
  {
    id v11 = (id)[(UITabBarButtonAccessibility *)v19 safeValueForKey:@"_badge"];
    id v10 = (id)[v11 accessibilityLabel];
    id v9 = (id)[MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v18[0] = (id)objc_msgSend(v10, "stringByTrimmingCharactersInSet:");

    if ([v18[0] length])
    {
      id v17 = (id)objc_opt_new();
      [v17 setUsesGroupingSeparator:1];
      if ([v18[0] isAXAttributedString])
      {
        id v3 = (id)[v18[0] string];
        id v4 = v18[0];
        v18[0] = v3;
      }
      id location = (id)[v17 numberFromString:v18[0]];
      if (location)
      {
        uint64_t v15 = (int)[location intValue];
        BOOL v7 = NSString;
        id v8 = accessibilityLocalizedString(@"badge.count");
        id v20 = (id)[v7 localizedStringWithFormat:v15];
      }
      else
      {
        id v20 = v18[0];
      }
      int v14 = 1;
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v17, 0);
    }
    else
    {
      v13.receiver = v19;
      v13.super_class = (Class)UITabBarButtonAccessibility;
      id v20 = [(UITabBarButtonAccessibility *)&v13 accessibilityValue];
      int v14 = 1;
    }
    objc_storeStrong(v18, 0);
  }
  else
  {
    id v20 = (id)[(UITabBarButtonAccessibility *)v19 accessibilityUserDefinedValue];
  }
  BOOL v5 = v20;

  return v5;
}

- (id)accessibilityLabel
{
  v46 = self;
  v45[1] = (id)a2;
  v44.receiver = self;
  v44.super_class = (Class)UITabBarButtonAccessibility;
  v45[0] = [(UITabBarButtonAccessibility *)&v44 accessibilityLabel];
  if ([v45[0] length])
  {
    id v47 = v45[0];
    int v43 = 1;
  }
  else
  {
    id v40 = (id)[(UITabBarButtonAccessibility *)v46 safeValueForKey:@"_label"];
    id v2 = (id)[v40 accessibilityLabel];
    id v3 = v45[0];
    v45[0] = v2;

    if (![v45[0] length])
    {
      id location = (id)[(UITabBarButtonAccessibility *)v46 accessibilityIdentification];
      if (location)
      {
        uint64_t v4 = [location integerValue];
        if (v4)
        {
          uint64_t v6 = v4;
          char v5 = 1;
        }
        else
        {
          uint64_t v6 = 0;
          char v5 = 0;
        }
        if ((v5 & 1) == 0)
        {
          switch(v6)
          {
            case 0:
              id v7 = accessibilityLocalizedString(@"more.button");
              id v8 = v45[0];
              v45[0] = v7;

              break;
            case 1:
              id v9 = accessibilityLocalizedString(@"favorites.button");
              id v10 = v45[0];
              v45[0] = v9;

              break;
            case 2:
              id v11 = accessibilityLocalizedString(@"featured.button");
              id v12 = v45[0];
              v45[0] = v11;

              break;
            case 3:
              id v13 = accessibilityLocalizedString(@"top.rated.button");
              id v14 = v45[0];
              v45[0] = v13;

              break;
            case 4:
              id v15 = accessibilityLocalizedString(@"recents.button");
              id v16 = v45[0];
              v45[0] = v15;

              break;
            case 5:
              id v17 = accessibilityLocalizedString(@"contacts.button");
              id v18 = v45[0];
              v45[0] = v17;

              break;
            case 6:
              id v19 = accessibilityLocalizedString(@"history.button");
              id v20 = v45[0];
              v45[0] = v19;

              break;
            case 7:
              id v21 = accessibilityLocalizedString(@"bookmarks.button");
              id v22 = v45[0];
              v45[0] = v21;

              break;
            case 8:
              id v23 = accessibilityLocalizedString(@"search.button");
              id v24 = v45[0];
              v45[0] = v23;

              break;
            case 9:
              id v25 = accessibilityLocalizedString(@"downloads.button");
              id v26 = v45[0];
              v45[0] = v25;

              break;
            case 10:
              id v27 = accessibilityLocalizedString(@"most.recent.button");
              id v28 = v45[0];
              v45[0] = v27;

              break;
            case 11:
              id v29 = accessibilityLocalizedString(@"most.viewed.button");
              id v30 = v45[0];
              v45[0] = v29;

              break;
            default:
              JUMPOUT(0);
          }
        }
      }
      objc_storeStrong(&location, 0);
    }
    if (![v45[0] length])
    {
      id v39 = (id)[(UITabBarButtonAccessibility *)v46 _accessibilityAncestorIsKindOf:objc_opt_class()];
      id v41 = (id)[v39 safeValueForKey:@"delegate"];

      id v31 = (id)[v41 _accessibililtyLabelForTabBarButton:v46];
      id v32 = v45[0];
      v45[0] = v31;

      objc_storeStrong(&v41, 0);
    }
    if (![v45[0] length])
    {
      id v38 = (id)[(UITabBarButtonAccessibility *)v46 safeValueForKey:@"_imageView"];
      id v37 = (id)[v38 safeValueForKey:@"image"];
      id v33 = (id)[v37 accessibilityLabel];
      id v34 = v45[0];
      v45[0] = v33;
    }
    id v47 = v45[0];
    int v43 = 1;
  }
  objc_storeStrong(v45, 0);
  v35 = v47;

  return v35;
}

- (id)accessibilityHint
{
  id v12 = self;
  v11[1] = (id)a2;
  v10.receiver = self;
  v10.super_class = (Class)UITabBarButtonAccessibility;
  v11[0] = [(UITabBarButtonAccessibility *)&v10 accessibilityHint];
  if ([v11[0] length])
  {
    id v13 = v11[0];
    int v9 = 1;
  }
  else
  {
    id location = (id)[(UITabBarButtonAccessibility *)v12 _accessibilityAncestorIsKindOf:objc_opt_class()];
    char v6 = 0;
    LOBYTE(v4) = 0;
    if ([location isCustomizing])
    {
      id v7 = (id)[(UITabBarButtonAccessibility *)v12 superview];
      char v6 = 1;
      NSClassFromString(&cfstr_Uitabbarcustom.isa);
      int v4 = objc_opt_isKindOfClass() ^ 1;
    }
    if (v6) {

    }
    if (v4)
    {
      id v13 = accessibilityLocalizedString(@"non.editing.tab.bar.item.hint");
    }
    else
    {
      v5.receiver = v12;
      v5.super_class = (Class)UITabBarButtonAccessibility;
      id v13 = [(UITabBarButtonAccessibility *)&v5 accessibilityHint];
    }
    int v9 = 1;
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v11, 0);
  id v2 = v13;

  return v2;
}

- (BOOL)_axIsSelected:(void *)a1
{
  id v6 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v6)
  {
    id v4 = (id)[location safeValueForKey:@"selectedItem"];
    id v2 = (id)[v4 safeValueForKey:@"_view"];
    BOOL v7 = v2 == v6;
  }
  else
  {
    BOOL v7 = 0;
  }
  objc_storeStrong(&location, 0);
  return v7;
}

- (unint64_t)accessibilityTraits
{
  id v8 = self;
  SEL v7 = a2;
  unint64_t v6 = 0;
  unint64_t v6 = *MEMORY[0x263F1CEE8];
  id v4 = (id)[(UITabBarButtonAccessibility *)self safeValueForKey:@"superview"];
  id location = v4;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (-[UITabBarButtonAccessibility _axIsSelected:](v8, location))
    {
      v6 |= *MEMORY[0x263F1CF38];
    }
    else if ([location isCustomizing])
    {
      v6 |= *MEMORY[0x263F81380];
    }
  }
  else
  {
    NSClassFromString(&cfstr_Uitabbarcustom.isa);
    if (objc_opt_isKindOfClass()) {
      v6 |= *MEMORY[0x263F81380];
    }
  }
  v6 |= *MEMORY[0x263F813F8];
  unint64_t v3 = v6;
  objc_storeStrong(&location, 0);
  return v3;
}

- (BOOL)_accessibilityRetainsFocusOnScreenChange
{
  return 1;
}

- (_NSRange)accessibilityRowRange
{
  id v29 = self;
  v28[1] = (id)a2;
  v28[0] = (id)[(UITabBarButtonAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  uint64_t v21 = 0;
  id v22 = &v21;
  int v23 = 0x10000000;
  int v24 = 48;
  id v25 = &unk_24046C852;
  uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v31 = 0;
  uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v34 = 0;
  uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v27 = 0;
  id v7 = v28[0];
  uint64_t v14 = MEMORY[0x263EF8330];
  int v15 = -1073741824;
  int v16 = 0;
  id v17 = __52__UITabBarButtonAccessibility_accessibilityRowRange__block_invoke;
  id v18 = &unk_2650AF248;
  id v19 = v29;
  id v20 = (id)[v7 _accessibilityFindSubviewDescendantsPassingTest:&v14];
  id v2 = (id)[(UITabBarButtonAccessibility *)v29 _accessibilityGeometrySortedElements:v20];
  id v3 = v20;
  id v20 = v2;

  id v6 = v20;
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = __52__UITabBarButtonAccessibility_accessibilityRowRange__block_invoke_2;
  id v12 = &unk_2650AEEA8;
  v13[0] = v29;
  v13[1] = &v21;
  [v6 enumerateObjectsUsingBlock:&v8];
  long long v30 = *((_OWORD *)v22 + 2);
  objc_storeStrong(v13, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong((id *)&v19, 0);
  _Block_object_dispose(&v21, 8);
  objc_storeStrong(v28, 0);
  NSUInteger v5 = *((void *)&v30 + 1);
  NSUInteger v4 = v30;
  result.length = v5;
  result.id location = v4;
  return result;
}

uint64_t __52__UITabBarButtonAccessibility_accessibilityRowRange__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

void __52__UITabBarButtonAccessibility_accessibilityRowRange__block_invoke_2(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (location[0] == *(id *)(a1 + 32)) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
  }
                                                                            + 40);
  NSClassFromString(&cfstr_Uitabbarbutton.isa);
  if (objc_opt_isKindOfClass()) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  objc_storeStrong(location, 0);
}

- (int64_t)_currentItemState
{
  id v6 = self;
  SEL v5 = a2;
  id v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UITabBarButtonAccessibility;
  id v4 = [(UITabBarButtonAccessibility *)&v3 _currentItemState];
  if ([(UITabBarButtonAccessibility *)v6 _accessibilityIsFKARunningForFocusItem] & 1) != 0&& v4 == (id)4&& ([(UITabBarButtonAccessibility *)v6 safeBoolForKey:@"_isSelected"])
  {
    return 2;
  }
  return (int64_t)v4;
}

@end