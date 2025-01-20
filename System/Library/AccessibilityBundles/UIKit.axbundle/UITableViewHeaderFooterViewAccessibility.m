@interface UITableViewHeaderFooterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityScrollToVisibleForNextElementRetrieval:(int64_t)a3;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UITableViewHeaderFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITableViewHeaderFooterView";
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
  v4 = @"UITableViewHeaderFooterView";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v3 = "@";
  [location[0] validateClass:v4 hasInstanceMethod:@"text" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"contentConfiguration", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"sectionHeader", "B", 0);
  objc_storeStrong(v6, obj);
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  id v2 = (id)[(UITableViewHeaderFooterViewAccessibility *)self storedAccessibilityRespondsToUserInteraction];
  BOOL v12 = v2 == 0;

  if (v12)
  {
    id v9 = (id)[(UITableViewHeaderFooterViewAccessibility *)self accessibilityCustomActions];
    BOOL v10 = [v9 count] == 0;

    if (v10)
    {
      char v13 = 0;
      char v8 = 0;
      if (AXRequestingClient() == 4)
      {
        id v14 = (id)[MEMORY[0x263F22938] sharedInstance];
        char v13 = 1;
        char v8 = [v14 assistiveTouchScannerSpeechEnabled];
      }
      if (v13) {

      }
      if (v8)
      {
        id v7 = [(UITableViewHeaderFooterViewAccessibility *)self accessibilityLabel];
        id v6 = (id)[MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
        id v5 = (id)objc_msgSend(v7, "stringByTrimmingCharactersInSet:");
        BOOL v16 = [v5 length] != 0;
      }
      else
      {
        id v4 = (id)[(UITableViewHeaderFooterViewAccessibility *)self _accessibilityInternalTextLinks];
        BOOL v16 = [v4 count] != 0;
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    id v11 = (id)[(UITableViewHeaderFooterViewAccessibility *)self storedAccessibilityRespondsToUserInteraction];
    BOOL v16 = [v11 BOOLValue] & 1;
  }
  return v16;
}

- (BOOL)isAccessibilityElement
{
  id v2 = (id)[(UITableViewHeaderFooterViewAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v9 = v2 == 0;

  if (v9)
  {
    id v6 = [(UITableViewHeaderFooterViewAccessibility *)self accessibilityLabel];
    id v5 = (id)[MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    id v4 = (id)objc_msgSend(v6, "stringByTrimmingCharactersInSet:");
    BOOL v7 = [v4 length] != 0;

    return v7;
  }
  else
  {
    id v8 = (id)[(UITableViewHeaderFooterViewAccessibility *)self isAccessibilityUserDefinedElement];
    BOOL v11 = [v8 BOOLValue] & 1;
  }
  return v11;
}

- (id)accessibilityLabel
{
  BOOL v10 = self;
  v9[1] = (id)a2;
  v9[0] = (id)[(UITableViewHeaderFooterViewAccessibility *)self accessibilityUserDefinedLabel];
  if (!v9[0])
  {
    v9[0] = (id)[(UITableViewHeaderFooterViewAccessibility *)v10 safeValueForKey:@"text"];
  }
  if (![v9[0] length])
  {
    id v8 = (id)[(UITableViewHeaderFooterViewAccessibility *)v10 safeValueForKey:@"contentConfiguration"];
    id v2 = (id)[v8 accessibilityLabel];
    id v3 = v9[0];
    v9[0] = v2;
  }
  if (([v9[0] isAXAttributedString] & 1) == 0)
  {
    id v4 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v9[0]];
    id v5 = v9[0];
    v9[0] = v4;
  }
  if ((-[UITableViewHeaderFooterViewAccessibility _accessibilityBoolValueForKey:](v10, "_accessibilityBoolValueForKey:", @"SkipConvertToLowercase") & 1) == 0)[v9[0] setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21710]]; {
  id v7 = v9[0];
  }
  objc_storeStrong(v9, 0);

  return v7;
}

- (unint64_t)accessibilityTraits
{
  id v8 = self;
  SEL v7 = a2;
  unint64_t v6 = 0;
  v5.receiver = self;
  v5.super_class = (Class)UITableViewHeaderFooterViewAccessibility;
  unint64_t v6 = [(UITableViewHeaderFooterViewAccessibility *)&v5 accessibilityTraits];
  id v3 = (id)[(UITableViewHeaderFooterViewAccessibility *)v8 safeValueForKey:@"sectionHeader"];
  char v4 = [v3 BOOLValue];

  if (v4) {
    v6 |= *MEMORY[0x263F1CEF8];
  }
  return v6;
}

- (BOOL)_accessibilityScrollToVisibleForNextElementRetrieval:(int64_t)a3
{
  v42 = (UIView *)self;
  SEL v41 = a2;
  int64_t v40 = a3;
  id location = (id)[(UITableViewHeaderFooterViewAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  if (([location isScrollEnabled] & 1) == 0) {
    goto LABEL_12;
  }
  [location frame];
  uint64_t v34 = v3;
  uint64_t v35 = v4;
  uint64_t v36 = v5;
  double v37 = v6;
  double v38 = v6;
  id v20 = (id)[location visibleCells];
  BOOL v21 = 1;
  if ([v20 count])
  {
    [(UIView *)v42 frame];
    uint64_t v30 = v7;
    uint64_t v31 = v8;
    uint64_t v32 = v9;
    double v33 = v10;
    BOOL v21 = v10 >= v38;
  }

  if (v21)
  {
    [(UIView *)v42 bounds];
    rect.origin.x = v11;
    rect.origin.y = v12;
    rect.size.width = v13;
    rect.size.height = v14;
    if (v40 == 1)
    {
      rect.origin.y = rect.origin.y + rect.size.height - v38 / 2.0;
      [location contentSize];
      uint64_t v27 = v15;
      double v28 = v16;
      if (rect.origin.y > v16)
      {
        objc_msgSend(location, "contentSize", rect.origin.y);
        uint64_t v25 = v17;
        double v26 = v18;
        rect.origin.y = v18 - 1.0;
      }
    }
    else
    {
      rect.origin.y = rect.origin.y - (rect.size.height - v38 / 2.0);
      if (rect.origin.y < 0.0) {
        rect.origin.y = 0.0;
      }
    }
    CGRect v44 = UIAccessibilityConvertFrameToScreenCoordinates(rect, v42);
    CGRect v24 = v44;
    objc_msgSend(location, "_accessibilityScrollToFrame:forView:", v42, v44.origin.x, v44.origin.y, v44.size.width, v44.size.height);
    [location _accessibilityOpaqueElementScrollCleanup];
    char v43 = 1;
    int v23 = 1;
  }
  else
  {
LABEL_12:
    v22.receiver = v42;
    v22.super_class = (Class)UITableViewHeaderFooterViewAccessibility;
    char v43 = [(UITableViewHeaderFooterViewAccessibility *)&v22 _accessibilityScrollToVisible] & 1;
    int v23 = 1;
  }
  objc_storeStrong(&location, 0);
  return v43 & 1;
}

@end