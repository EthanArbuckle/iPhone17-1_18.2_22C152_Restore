@interface _UICollectionViewListCellReorderControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (unint64_t)accessibilityTraits;
@end

@implementation _UICollectionViewListCellReorderControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UICollectionViewListCellReorderControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"_UICollectionViewListCellReorderControl" isKindOfClass:@"UIView"];
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8] | *MEMORY[0x263F81380];
}

- (id)accessibilityLabel
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v32[2] = self;
  v32[1] = (id)a2;
  v32[0] = (id)[(_UICollectionViewListCellReorderControlAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v30 = (id)[v32[0] _accessibilityBriefLabel];
    if ([v30 length])
    {
      id v29 = v30;
      if ([v30 isAXAttributedString])
      {
        id v2 = (id)[v30 string];
        id v3 = v29;
        id v29 = v2;
      }
      v19 = NSString;
      id v20 = accessibilityLocalizedString(@"table.view.reorder.control.label");
      id v28 = (id)[v19 stringWithFormat:v29];

      uint64_t v26 = [v28 rangeOfString:v29];
      uint64_t v27 = v4;
      id v25 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v28];
      if ([v30 isAXAttributedString])
      {
        v24[0] = 0;
        v24[1] = 0;
        id location = (id)[v30 attributesAtIndex:0 effectiveRange:v24];
        memset(__b, 0, sizeof(__b));
        id obj = location;
        uint64_t v18 = [obj countByEnumeratingWithState:__b objects:v34 count:16];
        if (v18)
        {
          uint64_t v14 = *(void *)__b[2];
          uint64_t v15 = 0;
          unint64_t v16 = v18;
          while (1)
          {
            uint64_t v13 = v15;
            if (*(void *)__b[2] != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v22 = *(void *)(__b[1] + 8 * v15);
            id v11 = v25;
            id v12 = (id)[location objectForKey:v22];
            objc_msgSend(v11, "setAttribute:forKey:withRange:");

            ++v15;
            if (v13 + 1 >= v16)
            {
              uint64_t v15 = 0;
              unint64_t v16 = [obj countByEnumeratingWithState:__b objects:v34 count:16];
              if (!v16) {
                break;
              }
            }
          }
        }

        objc_storeStrong(&location, 0);
      }
      id v9 = (id)[v32[0] accessibilityLanguage];
      BOOL v10 = 0;
      if (v9) {
        BOOL v10 = v26 != 0x7FFFFFFFFFFFFFFFLL;
      }

      if (v10)
      {
        id v7 = v25;
        id v8 = (id)[v32[0] accessibilityLanguage];
        objc_msgSend(v7, "setAttribute:forKey:withRange:");
      }
      id v33 = v25;
      int v31 = 1;
      objc_storeStrong(&v25, 0);
      objc_storeStrong(&v28, 0);
      objc_storeStrong(&v29, 0);
    }
    else
    {
      id v33 = accessibilityLocalizedString(@"table.view.reorder.control");
      int v31 = 1;
    }
    objc_storeStrong(&v30, 0);
  }
  else
  {
    id v33 = 0;
    int v31 = 1;
  }
  objc_storeStrong(v32, 0);
  v5 = v33;

  return v5;
}

- (id)accessibilityPath
{
  id v7 = (void *)MEMORY[0x263F1C478];
  [(_UICollectionViewListCellReorderControlAccessibility *)self accessibilityFrame];
  return (id)objc_msgSend(v7, "bezierPathWithRect:", v2, v3, v4, v5);
}

@end