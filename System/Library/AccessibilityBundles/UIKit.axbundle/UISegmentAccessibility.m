@interface UISegmentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHasNativeFocus;
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)isAccessibilityElement;
- (_NSRange)accessibilityRowRange;
- (id)_accessibilitySegmentedControlParent;
- (id)_axLabelFromInfoObject:(void *)a1;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityLanguage;
- (id)accessibilityValue;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
@end

@implementation UISegmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISegment";
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
  [location[0] validateClass:@"UISegment" hasInstanceVariable:@"_objectValue" withType:"@"];
  objc_storeStrong(location, 0);
}

- (id)accessibilityLanguage
{
  v11 = self;
  v10[1] = (id)a2;
  v9.receiver = self;
  v9.super_class = (Class)UISegmentAccessibility;
  v10[0] = [(UISegmentAccessibility *)&v9 accessibilityLanguage];
  if (v10[0])
  {
    id v12 = v10[0];
    int v8 = 1;
  }
  else
  {
    id location = (id)[(UISegmentAccessibility *)v11 safeValueForKey:@"info"];
    id v2 = (id)[location accessibilityLanguage];
    id v3 = v10[0];
    v10[0] = v2;

    if (v10[0])
    {
      id v12 = v10[0];
    }
    else
    {
      id v6 = (id)[(UISegmentAccessibility *)v11 safeValueForKey:@"superview"];
      id v12 = (id)[v6 accessibilityLanguage];
    }
    int v8 = 1;
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v10, 0);
  v4 = v12;

  return v4;
}

- (BOOL)isAccessibilityElement
{
  id v6 = self;
  v5[1] = (id)a2;
  v5[0] = (id)[(UISegmentAccessibility *)self isAccessibilityUserDefinedElement];
  if (v5[0])
  {
    char v7 = [v5[0] BOOLValue] & 1;
    int v4 = 1;
  }
  else
  {
    id location = (id)[(UISegmentAccessibility *)v6 safeValueForKey:@"info"];
    v5[0] = (id)[location isAccessibilityUserDefinedElement];

    if (v5[0]) {
      char v7 = [v5[0] BOOLValue] & 1;
    }
    else {
      char v7 = 1;
    }
    int v4 = 1;
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v5, 0);
  return v7 & 1;
}

- (id)_axLabelFromInfoObject:(void *)a1
{
  id v35 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v35)
  {
    id v32 = 0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v28 = (id)[location text];
      id v2 = (id)[v28 _accessibilityAXAttributedLabel];
      BOOL v29 = v2 == 0;

      if (v29)
      {
        id v25 = (id)[location attributedText];
        id v5 = (id)[v25 _accessibilityAXAttributedLabel];
        BOOL v26 = v5 == 0;

        if (v26)
        {
          id v8 = (id)[location _accessibilityAXAttributedLabel];
          id v9 = v32;
          id v32 = v8;
        }
        else
        {
          id v24 = (id)[location attributedText];
          id v6 = (id)[v24 _accessibilityAXAttributedLabel];
          id v7 = v32;
          id v32 = v6;
        }
      }
      else
      {
        id v27 = (id)[location text];
        id v3 = (id)[v27 _accessibilityAXAttributedLabel];
        id v4 = v32;
        id v32 = v3;
      }
    }
    if (![v32 length])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = (id)[location _accessibilityAXAttributedLabel];
        BOOL v23 = v10 == 0;

        if (v23)
        {
          objc_storeStrong(&v32, location);
        }
        else
        {
          id v11 = (id)[location _accessibilityAXAttributedLabel];
          id v12 = v32;
          id v32 = v11;
        }
      }
    }
    if (![v32 length])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {

        id v13 = (id)[location _accessibilityAXAttributedLabel];
        id v14 = v32;
        id v32 = v13;
      }
    }
    if (![v32 length])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v31 = (id)[location accessibilityLabel];
        if ([v31 length])
        {
          objc_storeStrong(&v32, v31);
        }
        else
        {
          id v30 = (id)[location accessibilityIdentification];
          if (![v30 length])
          {
            id v15 = (id)[location accessibilityIdentifier];
            id v16 = v30;
            id v30 = v15;
          }
          if ([v30 length])
          {
            id v17 = (id)[v35 _accessibilityRetrieveImagePathLabel:v30];
            id v18 = v32;
            id v32 = v17;
          }
          objc_storeStrong(&v30, 0);
        }
        objc_storeStrong(&v31, 0);
      }
    }
    if (![v32 length])
    {
      id v19 = (id)[location _accessibilityAXAttributedLabel];
      id v20 = v32;
      id v32 = v19;
    }
    id v36 = v32;
    int v33 = 1;
    objc_storeStrong(&v32, 0);
  }
  else
  {
    id v36 = 0;
    int v33 = 1;
  }
  objc_storeStrong(&location, 0);
  v21 = v36;

  return v21;
}

- (id)accessibilityLabel
{
  id v10 = self;
  v9[1] = (id)a2;
  v9[0] = (id)[(UISegmentAccessibility *)self accessibilityUserDefinedLabel];
  if (v9[0])
  {
    id v11 = v9[0];
    int v8 = 1;
  }
  else
  {
    id v6 = (id)[(UISegmentAccessibility *)v10 safeValueForKey:@"_objectValue"];
    v9[0] = -[UISegmentAccessibility _axLabelFromInfoObject:](v10, v6);

    if (![v9[0] length])
    {
      id v7 = (id)[(UISegmentAccessibility *)v10 safeValueForKey:@"info"];
      id v2 = -[UISegmentAccessibility _axLabelFromInfoObject:](v10, v7);
      id v3 = v9[0];
      v9[0] = v2;

      objc_storeStrong(&v7, 0);
    }
    id v11 = v9[0];
    int v8 = 1;
  }
  objc_storeStrong(v9, 0);
  id v4 = v11;

  return v4;
}

- (id)accessibilityValue
{
  id v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)[(UISegmentAccessibility *)self accessibilityUserDefinedValue];
  if (!v14[0])
  {
    v13.receiver = v15;
    v13.super_class = (Class)UISegmentAccessibility;
    id v2 = [(UISegmentAccessibility *)&v13 accessibilityValue];
    id v3 = v14[0];
    v14[0] = v2;
  }
  id v10 = (id)[(UISegmentAccessibility *)v15 safeValueForKey:@"_badgeView"];
  id v12 = (id)[v10 accessibilityLabel];

  id v11 = 0;
  if ([v12 length] && (int)objc_msgSend(v12, "intValue") >= 0)
  {
    int v8 = NSString;
    id v9 = accessibilityLocalizedString(@"badge.count");
    id v4 = (id)objc_msgSend(v8, "localizedStringWithFormat:", v9, objc_msgSend(v12, "integerValue"));
    id v5 = v11;
    id v11 = v4;
  }
  id v7 = (id)__UIAXStringForVariables();
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v14, 0);

  return v7;
}

- (_NSRange)accessibilityRowRange
{
  int v8 = self;
  v7[1] = (id)a2;
  v7[0] = [(UISegmentAccessibility *)self _accessibilitySegmentedControlParent];
  if (v7[0])
  {
    id v6 = (id)[v7[0] safeValueForKey:@"_segments"];
    uint64_t v5 = [v6 indexOfObject:v8];
    uint64_t v2 = [v6 count];
    uint64_t v16 = v5;
    uint64_t v15 = v2;
    uint64_t v17 = v5;
    uint64_t v18 = v2;
    uint64_t v9 = v5;
    NSUInteger v10 = v2;
    objc_storeStrong(&v6, 0);
  }
  else
  {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v11 = 0;
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v14 = 0;
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v10 = 0;
  }
  objc_storeStrong(v7, 0);
  NSUInteger v3 = v9;
  NSUInteger v4 = v10;
  result.length = v4;
  result.id location = v3;
  return result;
}

- (id)accessibilityIdentifier
{
  uint64_t v9 = self;
  location[1] = (id)a2;
  location[0] = (id)[(UISegmentAccessibility *)self accessibilityUserDefinedIdentifier];
  if (location[0])
  {
    id v10 = location[0];
    int v7 = 1;
  }
  else
  {
    id v4 = [(UISegmentAccessibility *)v9 accessibilityLabel];
    BOOL v5 = [v4 length] == 0;

    if (v5)
    {
      v6.receiver = v9;
      v6.super_class = (Class)UISegmentAccessibility;
      id v10 = [(UISegmentAccessibility *)&v6 accessibilityIdentifier];
    }
    else
    {
      id v10 = 0;
    }
    int v7 = 1;
  }
  objc_storeStrong(location, 0);
  uint64_t v2 = v10;

  return v2;
}

- (id)accessibilityHint
{
  int v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)[(UISegmentAccessibility *)self safeValueForKey:@"info"];
  id location = (id)[v7[0] _accessibilityAXAttributedHint];
  if (location)
  {
    id v9 = location;
  }
  else
  {
    v4.receiver = v8;
    v4.super_class = (Class)UISegmentAccessibility;
    id v9 = [(UISegmentAccessibility *)&v4 accessibilityHint];
  }
  int v5 = 1;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v7, 0);
  uint64_t v2 = v9;

  return v2;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)[(UISegmentAccessibility *)self safeValueForKey:@"info"];
  id v13 = (id)[v14[0] accessibilityUserDefinedTraits];
  if (v13
    || (id v13 = (id)[(UISegmentAccessibility *)v15 accessibilityUserDefinedTraits], 0, v13))
  {
    unint64_t v16 = [v13 unsignedLongLongValue];
    int v12 = 1;
  }
  else
  {
    unint64_t v11 = 0;
    unint64_t v11 = *MEMORY[0x263F1CEE8];
    id v10 = [(UISegmentAccessibility *)v15 _accessibilitySegmentedControlParent];
    if (v10)
    {
      uint64_t v9 = [v10 selectedSegmentIndex];
      id location = (id)[v10 safeValueForKey:@"segments"];
      char v6 = 0;
      BOOL v5 = 0;
      if (v9 >= 0)
      {
        BOOL v5 = 0;
        if (v9 < (unint64_t)[location count])
        {
          int v7 = (UISegmentAccessibility *)(id)[location objectAtIndex:v9];
          char v6 = 1;
          BOOL v5 = v15 == v7;
        }
      }
      if (v6) {

      }
      if (v5)
      {
        v11 |= *MEMORY[0x263F1CF38];
      }
      else if (([v10 isEnabled] & 1) == 0)
      {
        v11 |= *MEMORY[0x263F1CF20];
      }
      id v3 = (id)[(UISegmentAccessibility *)v15 safeValueForKey:@"isEnabled"];
      char v4 = [v3 BOOLValue];

      if ((v4 & 1) == 0) {
        v11 |= *MEMORY[0x263F1CF20];
      }
      unint64_t v16 = v11;
      int v12 = 1;
      objc_storeStrong(&location, 0);
    }
    else
    {
      unint64_t v16 = v11;
      int v12 = 1;
    }
    objc_storeStrong(&v10, 0);
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v14, 0);
  return v16;
}

- (BOOL)_accessibilityHasNativeFocus
{
  unint64_t v11 = self;
  v10[1] = (id)a2;
  v10[0] = [(UISegmentAccessibility *)self _accessibilitySegmentedControlParent];
  if (([v10[0] _accessibilityUIKitHasNativeFocus] & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v9 = [v10[0] selectedSegmentIndex];
  id location = (id)[v10[0] safeValueForKey:@"segments"];
  char v6 = 0;
  BOOL v3 = 0;
  if (v9 >= 0)
  {
    BOOL v3 = 0;
    if (v9 < (unint64_t)[location count])
    {
      int v7 = (UISegmentAccessibility *)(id)[location objectAtIndex:v9];
      char v6 = 1;
      BOOL v3 = v11 == v7;
    }
  }
  if (v6) {

  }
  if (v3)
  {
    char v12 = 1;
    int v5 = 1;
  }
  else
  {
    int v5 = 0;
  }
  objc_storeStrong(&location, 0);
  if (!v5)
  {
LABEL_11:
    v4.receiver = v11;
    v4.super_class = (Class)UISegmentAccessibility;
    char v12 = [(UISegmentAccessibility *)&v4 _accessibilityHasNativeFocus];
    int v5 = 1;
  }
  objc_storeStrong(v10, 0);
  return v12 & 1;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  unint64_t v2 = [(UISegmentAccessibility *)self accessibilityTraits];
  return (v2 & *MEMORY[0x263F1CF38]) != 0;
}

- (unint64_t)_accessibilityAutomationType
{
  return 9;
}

- (id)_accessibilitySegmentedControlParent
{
  return (id)[(UISegmentAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
}

@end