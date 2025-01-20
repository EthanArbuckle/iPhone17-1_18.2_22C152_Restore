@interface NavTrayStackedLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation NavTrayStackedLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NavTrayStackedLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavTrayStackedLabel", @"topLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavTrayStackedLabel", @"bottomLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v3 setNumberStyle:1];
  v4 = [(NavTrayStackedLabelAccessibility *)self accessibilityIdentification];
  int v5 = [v4 isEqualToString:@"ETA"];

  if (v5)
  {
    v6 = [(NavTrayStackedLabelAccessibility *)self safeValueForKey:@"topLabel"];
    v7 = [v6 accessibilityLabel];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [MEMORY[0x263F21660] axAttributedStringWithString:v7];
    }
    else
    {
      id v8 = v7;
    }
    v14 = v8;
    [v8 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21708]];
    v15 = [(NavTrayStackedLabelAccessibility *)self safeValueForKey:@"bottomLabel"];
    v16 = [v15 accessibilityLabel];
    goto LABEL_26;
  }
  v9 = [(NavTrayStackedLabelAccessibility *)self accessibilityIdentification];
  int v10 = [v9 isEqualToString:@"RemainingTime"];

  if (v10)
  {
    v11 = [(NavTrayStackedLabelAccessibility *)self safeValueForKey:@"topLabel"];
    v12 = [v11 accessibilityLabel];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = [v12 string];
    }
    else
    {
      id v13 = v12;
    }
    v21 = v13;
    v22 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@":-."];
    if ([v21 rangeOfCharacterFromSet:v22] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v23 = [(NavTrayStackedLabelAccessibility *)self safeValueForKey:@"bottomLabel"];
      v24 = [v23 text];
      v25 = [v24 accessibilityIdentifier];

      v26 = [v3 numberFromString:v21];
      v27 = (void *)[v26 intValue];

      if (v25)
      {
        v28 = NSString;
        v29 = AXLocalizedString();
        v27 = objc_msgSend(v28, "localizedStringWithFormat:", v29, v27);

        int v30 = 1;
      }
      else
      {
        int v30 = 0;
      }
    }
    else
    {
      v27 = [MEMORY[0x263F21660] axAttributedStringWithString:v21];
      [v27 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21738]];
      int v30 = 1;
    }

    if (v30) {
      goto LABEL_28;
    }
    goto LABEL_25;
  }
  v17 = [(NavTrayStackedLabelAccessibility *)self accessibilityIdentification];
  int v18 = [v17 isEqualToString:@"RemainingDistance"];

  if (!v18)
  {
LABEL_25:
    v7 = [(NavTrayStackedLabelAccessibility *)self safeValueForKey:@"topLabel"];
    v14 = [v7 accessibilityLabel];
    v15 = [(NavTrayStackedLabelAccessibility *)self safeValueForKey:@"bottomLabel"];
    v16 = [v15 accessibilityLabel];
LABEL_26:
    uint64_t v37 = __UIAXStringForVariables();
    goto LABEL_27;
  }
  v19 = [(NavTrayStackedLabelAccessibility *)self safeValueForKey:@"topLabel"];
  v7 = [v19 accessibilityLabel];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = [v7 string];
  }
  else
  {
    id v20 = v7;
  }
  v14 = v20;
  v31 = [v3 numberFromString:v20];
  [v31 doubleValue];
  uint64_t v33 = v32;

  v34 = [(NavTrayStackedLabelAccessibility *)self safeValueForKey:@"bottomLabel"];
  v35 = [v34 text];
  v15 = [v35 accessibilityIdentifier];

  if (!v15)
  {

    goto LABEL_25;
  }
  v36 = NSString;
  v16 = AXLocalizedString();
  uint64_t v37 = objc_msgSend(v36, "localizedStringWithFormat:", v16, v33);
LABEL_27:
  v27 = (void *)v37;

LABEL_28:

  return v27;
}

@end