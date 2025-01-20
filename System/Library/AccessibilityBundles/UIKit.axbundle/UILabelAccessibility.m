@interface UILabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityOverridesPotentiallyAttributedAPISelector:(SEL)a3;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (double)_accessibilityFontSize;
- (id)_accessibilityBackgroundTextColorAttribute;
- (id)_accessibilityForegroundTextColorAttribute;
- (id)_accessibilityLabel:(void *)a1;
- (id)_axCleanupNewlines:(uint64_t)a1;
- (id)_axOriginalLabelText:(void *)a1;
- (id)accessibilityAttributedLabel;
- (id)accessibilityCustomRotors;
- (id)accessibilityLabel;
- (id)accessibilityLocalizationBundleID;
- (id)accessibilityLocalizationBundlePath;
- (id)accessibilityLocalizedStringKey;
- (id)accessibilityLocalizedStringTableName;
- (id)accessibilityValue;
- (id)copyAttributedText:(id)a3 withAttributes:(id)a4;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
@end

@implementation UILabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UILabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_accessibilityAutomationType
{
  return 48;
}

- (double)_accessibilityFontSize
{
  id v4 = (id)[(UILabelAccessibility *)self font];
  [v4 pointSize];
  double v5 = v2;

  return v5;
}

- (BOOL)isAccessibilityElement
{
  v17 = self;
  SEL v16 = a2;
  id v2 = (id)[(UILabelAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v11 = v2 == 0;

  if (v11)
  {
    char v15 = 0;
    [(UILabelAccessibility *)v17 alpha];
    if (v3 <= 0.0 || (char v9 = 1, ([(UILabelAccessibility *)v17 isHidden] & 1) != 0)) {
      char v9 = [(UILabelAccessibility *)v17 _accessibilityOverridesInvisibility];
    }
    char v15 = v9 & 1;
    if (v9)
    {
      context = (void *)MEMORY[0x2455E6F00]();
      id v14 = -[UILabelAccessibility _accessibilityLabel:](v17, 0);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v4 = (void *)[objc_alloc(MEMORY[0x263F21660]) initWithStringOrAttributedString:v14];
        id v5 = v14;
        id v14 = v4;
      }
      id v7 = (id)[MEMORY[0x263F08708] whitespaceCharacterSet];
      id location = (id)objc_msgSend(v14, "stringByTrimmingCharactersInSet:");

      if ([location length])
      {
        int v12 = 0;
      }
      else
      {
        char v18 = 0;
        int v12 = 1;
      }
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v14, 0);
      if (!v12) {
        char v18 = 1;
      }
    }
    else
    {
      char v18 = 0;
    }
  }
  else
  {
    id v10 = (id)[(UILabelAccessibility *)v17 isAccessibilityUserDefinedElement];
    char v18 = [v10 BOOLValue] & 1;
  }
  return v18 & 1;
}

- (id)_accessibilityLabel:(void *)a1
{
  v6 = a1;
  char v5 = a2 & 1;
  if (a1)
  {
    id location = (id)[v6 accessibilityUserDefinedLabel];
    if (location) {
      id v7 = location;
    }
    else {
      id v7 = -[UILabelAccessibility _axOriginalLabelText:](v6, v5 & 1);
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    id v7 = 0;
  }
  id v2 = v7;

  return v2;
}

- (id)_axCleanupNewlines:(uint64_t)a1
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v26 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v26)
  {
    if (location)
    {
      v29 = (dispatch_once_t *)&_axCleanupNewlines__onceToken;
      id v28 = 0;
      objc_storeStrong(&v28, &__block_literal_global_25);
      if (*v29 != -1) {
        dispatch_once(v29, v28);
      }
      objc_storeStrong(&v28, 0);
      SEL v16 = (void *)_axCleanupNewlines__Regex;
      id v15 = location;
      id v2 = (void *)[location length];
      uint64_t v31 = 0;
      v30 = v2;
      uint64_t v32 = 0;
      v33 = v2;
      v22[1] = 0;
      v22[2] = v2;
      id v23 = (id)objc_msgSend(v16, "matchesInString:options:range:", v15, 0, 0, v2);
      if ([v23 count])
      {
        objc_opt_class();
        char v20 = 0;
        if (objc_opt_isKindOfClass())
        {
          id v3 = location;
        }
        else
        {
          id v21 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:location];
          char v20 = 1;
          id v3 = v21;
        }
        v22[0] = v3;
        if (v20) {

        }
        memset(__b, 0, sizeof(__b));
        id v12 = (id)[v23 reverseObjectEnumerator];
        id obj = (id)[v12 allObjects];

        uint64_t v14 = [obj countByEnumeratingWithState:__b objects:v34 count:16];
        if (v14)
        {
          uint64_t v9 = *(void *)__b[2];
          uint64_t v10 = 0;
          unint64_t v11 = v14;
          while (1)
          {
            uint64_t v8 = v10;
            if (*(void *)__b[2] != v9) {
              objc_enumerationMutation(obj);
            }
            id v19 = *(id *)(__b[1] + 8 * v10);
            id v7 = v22[0];
            uint64_t v17 = [v19 range];
            objc_msgSend(v7, "replaceCharactersInRange:withString:", v17, v4, @" ");
            ++v10;
            if (v8 + 1 >= v11)
            {
              uint64_t v10 = 0;
              unint64_t v11 = [obj countByEnumeratingWithState:__b objects:v34 count:16];
              if (!v11) {
                break;
              }
            }
          }
        }

        id v27 = v22[0];
        int v24 = 1;
        objc_storeStrong(v22, 0);
      }
      else
      {
        id v27 = location;
        int v24 = 1;
      }
      objc_storeStrong(&v23, 0);
    }
    else
    {
      id v27 = 0;
      int v24 = 1;
    }
  }
  else
  {
    id v27 = 0;
    int v24 = 1;
  }
  objc_storeStrong(&location, 0);
  char v5 = v27;

  return v5;
}

void __43__UILabelAccessibility__axCleanupNewlines___block_invoke(uint64_t a1)
{
  id v1 = (id)objc_msgSend(MEMORY[0x263F08AE8], "regularExpressionWithPattern:options:error:", @"(?<!\n)\n{1}(?!\n)", 0, 0, a1, a1);
  id v2 = (void *)_axCleanupNewlines__Regex;
  _axCleanupNewlines__Regex = (uint64_t)v1;
}

- (BOOL)_accessibilityOverridesPotentiallyAttributedAPISelector:(SEL)a3
{
  uint64_t v9 = self;
  SEL v8 = a2;
  SEL name = a3;
  id v12 = (dispatch_once_t *)&_accessibilityOverridesPotentiallyAttributedAPISelector__onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_283);
  if (*v12 != -1) {
    dispatch_once(v12, location);
  }
  objc_storeStrong(&location, 0);
  id v3 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v3, name);
  if (name == sel_accessibilityLabel) {
    return InstanceMethod != (Method)_accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityLabelBaseMethod;
  }
  if (name == sel_accessibilityAttributedLabel) {
    return InstanceMethod != (Method)_accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedLabelBaseMethod;
  }
  v5.receiver = v9;
  v5.super_class = (Class)UILabelAccessibility;
  return [(UILabelAccessibility *)&v5 _accessibilityOverridesPotentiallyAttributedAPISelector:name];
}

Method __80__UILabelAccessibility__accessibilityOverridesPotentiallyAttributedAPISelector___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityLabelBaseMethod = (uint64_t)class_getInstanceMethod(v0, sel_accessibilityLabel);
  id v1 = (objc_class *)objc_opt_class();
  Method result = class_getInstanceMethod(v1, sel_accessibilityAttributedLabel);
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedLabelBaseMethod = (uint64_t)result;
  return result;
}

- (id)accessibilityCustomRotors
{
  return (id)[(UILabelAccessibility *)self _accessibilityInternalTextLinkCustomRotors];
}

- (id)accessibilityValue
{
  v6 = self;
  SEL v5 = a2;
  if ([(UILabelAccessibility *)self accessibilityExposeLabelAsValue])
  {
    id v7 = -[UILabelAccessibility _axOriginalLabelText:](v6, 1);
  }
  else
  {
    v4.receiver = v6;
    v4.super_class = (Class)UILabelAccessibility;
    id v7 = [(UILabelAccessibility *)&v4 accessibilityValue];
  }
  id v2 = v7;

  return v2;
}

- (id)_axOriginalLabelText:(void *)a1
{
  id v40 = a1;
  char v39 = a2 & 1;
  if (!a1)
  {
    id v41 = 0;
    goto LABEL_35;
  }
  id v38 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%p-_axOriginalLabelText", v40);
  id v2 = (id)[(id)*MEMORY[0x263F81160] objectForKeyedSubscript:v38];
  BOOL v20 = v2 == 0;

  if (v20)
  {
    id v18 = (id)[v40 accessibilityIdentification];
    char v19 = [v18 isEqualToString:@"doubleHeightLabel"];

    if (v19)
    {
      id v36 = (id)[v40 safeValueForKey:@"text"];
      if (v39)
      {
        id v35 = 0;
        uint64_t v33 = 0;
        uint64_t v34 = 0;
        id v32 = 0;
        uint64_t DurationRangeInString = _accessibilityFindDurationRangeInString(v36, &v32);
        uint64_t v17 = v3;
        objc_storeStrong(&v35, v32);
        uint64_t v33 = DurationRangeInString;
        uint64_t v34 = v17;
        if (DurationRangeInString == 0x7FFFFFFFFFFFFFFFLL)
        {
          int v37 = 0;
        }
        else
        {
          id v4 = objc_allocWithZone(MEMORY[0x263F21660]);
          id v31 = (id)[v4 initWithString:v36];
          objc_msgSend(v31, "setAttribute:forKey:withRange:", *MEMORY[0x263EFFB40], v35, v33, v34);
          [(id)*MEMORY[0x263F81160] setObject:v31 forKeyedSubscript:v38];
          id v41 = v31;
          int v37 = 1;
          objc_storeStrong(&v31, 0);
        }
        objc_storeStrong(&v35, 0);
      }
      else
      {
        [(id)*MEMORY[0x263F81160] setObject:v36 forKeyedSubscript:v38];
        id v41 = v36;
        int v37 = 1;
      }
      objc_storeStrong(&v36, 0);
      if (v37) {
        goto LABEL_34;
      }
    }
    char v29 = 0;
    objc_opt_class();
    id v15 = (id)[v40 safeValueForKey:@"attributedText"];
    id v28 = (id)__UIAccessibilityCastAsClass();

    id v27 = v28;
    objc_storeStrong(&v28, 0);
    id v30 = v27;
    id v26 = 0;
    if ([v27 length])
    {
      if ((v39 & 1) == 0)
      {
        id v5 = (id)[v30 string];
        id v6 = v26;
        id v26 = v5;

        [(id)*MEMORY[0x263F81160] setObject:v26 forKeyedSubscript:v38];
        id v41 = v26;
        int v37 = 1;
LABEL_33:
        objc_storeStrong(&v26, 0);
        objc_storeStrong(&v30, 0);
        goto LABEL_34;
      }
      id v25 = (id)UIAccessibilityConvertAttachmentsInAttributedStringToAX();
      if (v25)
      {
        v43 = (dispatch_once_t *)&_axOriginalLabelText__onceToken;
        id v42 = 0;
        objc_storeStrong(&v42, &__block_literal_global_325);
        if (*v43 != -1) {
          dispatch_once(v43, v42);
        }
        objc_storeStrong(&v42, 0);
        if (!AXDoesRequestingClientDeserveAutomation()) {
          [v25 removeAttributes:_axOriginalLabelText__Attributes];
        }
        id v24 = (id)[v40 _accessibilityValueForKey:*MEMORY[0x263F81480]];
        if (v24)
        {
          id obj = (id)[v25 stringByReplacingOccurrencesOfString:v24 withString:@","];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_storeStrong(&v25, obj);
          }
          objc_storeStrong(&obj, 0);
        }
        id v22 = -[UILabelAccessibility _axCleanupNewlines:]((uint64_t)v40, v25);
        [(id)*MEMORY[0x263F81160] setObject:v22 forKeyedSubscript:v38];
        id v41 = v22;
        int v37 = 1;
        objc_storeStrong(&v22, 0);
        objc_storeStrong(&v24, 0);
      }
      else
      {
        int v37 = 0;
      }
      objc_storeStrong(&v25, 0);
      if (v37) {
        goto LABEL_33;
      }
    }
    if (![v26 length])
    {
      id v7 = (id)[v40 safeValueForKey:@"text"];
      id v8 = v26;
      id v26 = v7;
    }
    id v9 = -[UILabelAccessibility _axCleanupNewlines:]((uint64_t)v40, v26);
    id v10 = v26;
    id v26 = v9;

    id v21 = (id)[v40 _accessibilityValueForKey:*MEMORY[0x263F81480]];
    if (v21)
    {
      id v11 = (id)[v26 stringByReplacingOccurrencesOfString:v21 withString:@","];
      id v12 = v26;
      id v26 = v11;
    }
    [(id)*MEMORY[0x263F81160] setObject:v26 forKeyedSubscript:v38];
    id v41 = v26;
    int v37 = 1;
    objc_storeStrong(&v21, 0);
    goto LABEL_33;
  }
  id v41 = (id)[(id)*MEMORY[0x263F81160] objectForKeyedSubscript:v38];
  int v37 = 1;
LABEL_34:
  objc_storeStrong(&v38, 0);
LABEL_35:
  v13 = v41;

  return v13;
}

- (id)accessibilityLabel
{
  return -[UILabelAccessibility _accessibilityLabel:](self, 1);
}

- (id)accessibilityAttributedLabel
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = [(UILabelAccessibility *)self accessibilityLabel];
  if ([location[0] isAXAttributedString])
  {
    id v5 = (id)[location[0] cfAttributedString];
  }
  else if (location[0])
  {
    id v5 = (id)[objc_alloc(MEMORY[0x263F086A0]) initWithString:location[0]];
  }
  else
  {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  id v2 = v5;

  return v2;
}

- (id)copyAttributedText:(id)a3 withAttributes:(id)a4
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  char v14 = 0;
  id v10 = (id)[(UILabelAccessibility *)v18 safeValueForKey:@"defaultAttributes"];
  id v13 = (id)__UIAccessibilitySafeClass();

  id v12 = v13;
  objc_storeStrong(&v13, 0);
  id v15 = (id)[v12 mutableCopy];

  id v4 = objc_alloc(MEMORY[0x263F089B8]);
  id v11 = (id)[v4 initWithString:location[0] attributes:v15];
  id v6 = v11;
  id v7 = (id)[location[0] _accessibilityAttributedLocalizedString];
  objc_msgSend(v6, "_setAccessibilityAttributedLocalizedString:");

  id v8 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)accessibilityLocalizedStringKey
{
  id v11 = self;
  v10[1] = (id)a2;
  char v9 = 0;
  objc_opt_class();
  id v4 = (id)[(UILabelAccessibility *)v11 safeValueForKey:@"attributedText"];
  id v8 = (id)__UIAccessibilityCastAsClass();

  id v7 = v8;
  objc_storeStrong(&v8, 0);
  v10[0] = v7;
  id v6 = (id)[v7 _accessibilityAttributedLocalizedString];
  id v5 = (id)[v6 attributeValueForKey:@"UIAccessibilityTokenLocalizedStringKey"];
  id v3 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v10, 0);

  return v3;
}

- (id)accessibilityLocalizationBundleID
{
  id v11 = self;
  v10[1] = (id)a2;
  char v9 = 0;
  objc_opt_class();
  id v4 = (id)[(UILabelAccessibility *)v11 safeValueForKey:@"attributedText"];
  id v8 = (id)__UIAccessibilityCastAsClass();

  id v7 = v8;
  objc_storeStrong(&v8, 0);
  v10[0] = v7;
  id v6 = (id)[v7 _accessibilityAttributedLocalizedString];
  id v5 = (id)[v6 attributeValueForKey:@"UIAccessibilityTokenLocalizedStringBundleID"];
  id v3 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v10, 0);

  return v3;
}

- (id)accessibilityLocalizationBundlePath
{
  id v11 = self;
  v10[1] = (id)a2;
  char v9 = 0;
  objc_opt_class();
  id v4 = (id)[(UILabelAccessibility *)v11 safeValueForKey:@"attributedText"];
  id v8 = (id)__UIAccessibilityCastAsClass();

  id v7 = v8;
  objc_storeStrong(&v8, 0);
  v10[0] = v7;
  id v6 = (id)[v7 _accessibilityAttributedLocalizedString];
  id v5 = (id)[v6 attributeValueForKey:@"UIAccessibilityTokenLocalizationBundlePath"];
  id v3 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v10, 0);

  return v3;
}

- (id)accessibilityLocalizedStringTableName
{
  id v11 = self;
  v10[1] = (id)a2;
  char v9 = 0;
  objc_opt_class();
  id v4 = (id)[(UILabelAccessibility *)v11 safeValueForKey:@"attributedText"];
  id v8 = (id)__UIAccessibilityCastAsClass();

  id v7 = v8;
  objc_storeStrong(&v8, 0);
  v10[0] = v7;
  id v6 = (id)[v7 _accessibilityAttributedLocalizedString];
  id v5 = (id)[v6 attributeValueForKey:@"UIAccessibilityTokenLocalizedStringTableName"];
  id v3 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v10, 0);

  return v3;
}

void __45__UILabelAccessibility__axOriginalLabelText___block_invoke(uint64_t a1)
{
  v3[5] = *MEMORY[0x263EF8340];
  v3[0] = *MEMORY[0x263F814F0];
  v3[1] = *MEMORY[0x263F814B8];
  v3[2] = *MEMORY[0x263F81560];
  v3[3] = *MEMORY[0x263F81540];
  v3[4] = *MEMORY[0x263F81500];
  id v1 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v3, 5, a1, a1);
  id v2 = (void *)_axOriginalLabelText__Attributes;
  _axOriginalLabelText__Attributes = (uint64_t)v1;
}

- (id)_accessibilityForegroundTextColorAttribute
{
  return (id)[(UILabelAccessibility *)self textColor];
}

- (id)_accessibilityBackgroundTextColorAttribute
{
  return (id)[(UILabelAccessibility *)self backgroundColor];
}

- (unint64_t)accessibilityTraits
{
  char v19 = self;
  SEL v18 = a2;
  id v2 = (id)[(UILabelAccessibility *)self accessibilityUserDefinedTraits];
  BOOL v9 = v2 == 0;

  if (v9)
  {
    unint64_t v17 = 0;
    uint64_t v5 = *MEMORY[0x263F1CF48];
    v16.receiver = v19;
    v16.super_class = (Class)UILabelAccessibility;
    unint64_t v17 = v5 | [(UILabelAccessibility *)&v16 accessibilityTraits];
    id v6 = (id)[(UILabelAccessibility *)v19 accessibilityIdentification];
    char v7 = [v6 isEqualToString:@"doubleHeightLabel"];

    if (v7) {
      v17 |= *MEMORY[0x263F1CF68];
    }
    id v15 = v19;
    char v10 = 0;
    char HasButtonLikeGesture = 0;
    if ([v15 isUserInteractionEnabled])
    {
      char v14 = 0;
      objc_opt_class();
      id v13 = (id)__UIAccessibilityCastAsSafeCategory();
      id v12 = v13;
      objc_storeStrong(&v13, 0);
      id v11 = v12;
      char v10 = 1;
      char HasButtonLikeGesture = -[UIViewAccessibility _accessibilityHasButtonLikeGestureRecognizer](v12);
    }
    if (v10) {

    }
    if (HasButtonLikeGesture) {
      v17 |= *MEMORY[0x263F1CEE8];
    }
    unint64_t v20 = v17;
    objc_storeStrong(&v15, 0);
  }
  else
  {
    id v8 = (id)[(UILabelAccessibility *)v19 accessibilityUserDefinedTraits];
    unint64_t v20 = [v8 unsignedLongLongValue];
  }
  return v20;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  char v10 = self;
  SEL v9 = a2;
  id v6 = (id)[(UILabelAccessibility *)self accessibilityIdentification];
  char v7 = [v6 isEqualToString:@"doubleHeightLabel"];

  if (v7) {
    return 1;
  }
  id v2 = (id)[(UILabelAccessibility *)v10 storedAccessibilityRespondsToUserInteraction];
  BOOL v5 = v2 == 0;

  if (v5)
  {
    if ([(UILabelAccessibility *)v10 _accessibilityIsFKARunningForFocusItem])
    {
      return 0;
    }
    else
    {
      v8.receiver = v10;
      v8.super_class = (Class)UILabelAccessibility;
      return [(UILabelAccessibility *)&v8 accessibilityRespondsToUserInteraction];
    }
  }
  else
  {
    id v4 = (id)[(UILabelAccessibility *)v10 storedAccessibilityRespondsToUserInteraction];
    BOOL v11 = [v4 BOOLValue] & 1;
  }
  return v11;
}

@end