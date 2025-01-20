@interface UIButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityElementHasImage;
- (BOOL)_accessibilityIsEmptyShellOfAButton;
- (BOOL)_accessibilityIsMacVisualAppearance;
- (BOOL)_accessibilityOverridesInvalidFrames;
- (BOOL)_accessibilityUseAccessibilityFrameForHittest;
- (BOOL)_axButtonTypeIsModernCircle;
- (BOOL)accessibilityPerformEscape;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)_accessibilityButtonChildrenCombinedFrame;
- (CGRect)accessibilityFrame;
- (id)_accessibilityAuditIssuesWithOptions:(id)a3;
- (id)_accessibilityButtonMacCatalystPopupButtonCell;
- (id)_accessibilityImagePath;
- (id)_contentForState:(unint64_t)a3;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)accessibilityValue;
- (id)automationElements;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)_accessibilityNativeTraits;
- (unint64_t)accessibilityTraits;
@end

@implementation UIButtonAccessibility

- (id)_contentForState:(unint64_t)a3
{
  v12 = self;
  SEL v11 = a2;
  unint64_t v10 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIButtonAccessibility;
  id v9 = [(UIButtonAccessibility *)&v8 _contentForState:a3];
  if (!v9
    && ([(UIButtonAccessibility *)v12 _accessibilityIsFKARunningForFocusItem] & 1) != 0)
  {
    if ((v10 & 8) != 0 && ((v10 & 1) != 0 || (v10 & 2) != 0 || (v10 & 4) != 0)) {
      v10 &= ~8uLL;
    }
    v7.receiver = v12;
    v7.super_class = (Class)UIButtonAccessibility;
    id v3 = [(UIButtonAccessibility *)&v7 _contentForState:v10];
    id v4 = v9;
    id v9 = v3;
  }
  id v6 = v9;
  objc_storeStrong(&v9, 0);

  return v6;
}

+ (id)safeCategoryTargetClassName
{
  return @"UIButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  objc_super v7 = location;
  id v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = @"UIButton";
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "Q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_imageView", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_backgroundView", v5, 0);
  id v3 = @"_UIButtonConfiguration";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"attributedTitle", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_currentConfiguration", v5, 0);
  objc_storeStrong(v7, v6);
}

- (id)automationElements
{
  id v6 = self;
  SEL v5 = a2;
  if ([(UIButtonAccessibility *)self _accessibilityHasOrderedChildren])
  {
    v4.receiver = v6;
    v4.super_class = (Class)UIButtonAccessibility;
    id v7 = [(UIButtonAccessibility *)&v4 automationElements];
  }
  else
  {
    id v7 = (id)[(UIButtonAccessibility *)v6 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_12];
  }
  v2 = v7;

  return v2;
}

uint64_t __43__UIButtonAccessibility_automationElements__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (id)_accessibilityImagePath
{
  id v6 = self;
  v5[1] = (id)a2;
  v5[0] = (id)[(UIButtonAccessibility *)self imageForState:0];
  if (!v5[0])
  {
    v5[0] = (id)[(UIButtonAccessibility *)v6 backgroundImageForState:0];
  }
  id v4 = (id)objc_msgSend(v5[0], "accessibilityIdentifier", v5);
  objc_storeStrong(location, 0);

  return v4;
}

- (id)accessibilityLabel
{
  v60 = self;
  v59[1] = (id)a2;
  id v2 = (id)[(UIButtonAccessibility *)self accessibilityUserDefinedLabel];
  BOOL v41 = v2 == 0;

  if (v41)
  {
    v59[0] = 0;
    if (![0 length])
    {
      id location = (id)[(UIButtonAccessibility *)v60 currentAttributedTitle];
      id v39 = (id)[location string];
      BOOL v40 = [v39 length] != 0;

      if (v40)
      {
        if ([location length])
        {
          id v5 = (id)UIAccessibilityConvertAttachmentsInAttributedStringToAX();
          id v6 = v59[0];
          v59[0] = v5;

          if (!v59[0])
          {
            v59[0] = (id)[location string];
          }
        }
      }
      else
      {
        id v3 = (id)[(UIButtonAccessibility *)v60 safeValueForKey:@"currentTitle"];
        id v4 = v59[0];
        v59[0] = v3;
      }
      objc_storeStrong(&location, 0);
    }
    if (![v59[0] length])
    {
      char v55 = 0;
      objc_opt_class();
      id v38 = (id)[(UIButtonAccessibility *)v60 safeValueForKey:@"_currentConfiguration"];
      id v54 = (id)__UIAccessibilityCastAsClass();

      id v53 = v54;
      objc_storeStrong(&v54, 0);
      id v56 = v53;
      if (v53)
      {
        id v7 = (id)[v56 title];
        id v8 = v59[0];
        v59[0] = v7;
      }
      objc_storeStrong(&v56, 0);
    }
    id v36 = (id)[(UIButtonAccessibility *)v60 safeValueForKey:@"isSelected"];
    char v37 = [v36 BOOLValue];

    if (v37)
    {
      id v35 = (id)[(UIButtonAccessibility *)v60 attributedTitleForState:4];
      id v52 = (id)[v35 string];

      if (!v52)
      {
        id v52 = (id)[(UIButtonAccessibility *)v60 titleForState:4];
      }
      if (![v59[0] length] || v52) {
        objc_storeStrong(v59, v52);
      }
      objc_storeStrong(&v52, 0);
    }
    if (![v59[0] length])
    {
      id v34 = (id)[(UIButtonAccessibility *)v60 attributedTitleForState:0];
      id v9 = (id)[v34 string];
      id v10 = v59[0];
      v59[0] = v9;

      if (![v59[0] length])
      {
        id v11 = (id)[(UIButtonAccessibility *)v60 titleForState:0];
        id v12 = v59[0];
        v59[0] = v11;
      }
    }
    id v51 = (id)[(UIButtonAccessibility *)v60 safeValueForKey:@"currentImage"];
    if ([v59[0] length]) {
      goto LABEL_75;
    }
    id v50 = (id)[v51 accessibilityIdentifier];
    id v32 = (id)UIImageGetTableNextButton();
    char v33 = 1;
    if ((objc_msgSend(v51, "isEqual:") & 1) == 0) {
      char v33 = [v50 hasPrefix:@"UIAccessoryButtonInfo"];
    }

    if (v33)
    {
      id v61 = accessibilityLocalizedString(@"more.info.button");
      int v49 = 1;
    }
    else if ([v50 hasPrefix:@"UINavigationBarBackIndicatorDefault"])
    {
      id v61 = accessibilityLocalizedString(@"uibutton.navbar.back.button.title");
      int v49 = 1;
    }
    else if ([v50 hasPrefix:@"UIButtonBarAction"])
    {
      id v61 = accessibilityLocalizedString(@"action.button");
      int v49 = 1;
    }
    else if ([v50 isEqualToString:@"UITextFieldClearButton"])
    {
      id v61 = accessibilityLocalizedString(@"clear.button.text");
      int v49 = 1;
    }
    else
    {
      int v49 = 0;
    }
    objc_storeStrong(&v50, 0);
    if (!v49)
    {
LABEL_75:
      if (![v59[0] length])
      {
        id v48 = (id)[(UIButtonAccessibility *)v60 imageView];
        id v30 = (id)[v48 accessibilityLabel];
        BOOL v31 = [v30 length] == 0;

        if (!v31)
        {
          id v13 = (id)[v48 accessibilityLabel];
          id v14 = v59[0];
          v59[0] = v13;
        }
        objc_storeStrong(&v48, 0);
      }
      if ([v59[0] length]
        || ((id v47 = (id)-[UIButtonAccessibility accessibilityIdentification](v60, "accessibilityIdentification"), ([v47 isEqualToString:@"UITableCellViewDisclosure"] & 1) == 0)&& -[UIButtonAccessibility buttonType](v60, "buttonType") != 4&& -[UIButtonAccessibility buttonType](v60, "buttonType") != 3&& -[UIButtonAccessibility buttonType](v60, "buttonType") != 2? ((objc_msgSend(v47, "isEqualToString:", @"UIClearButton") & 1) == 0? (-[UIButtonAccessibility buttonType](v60, "buttonType") != 122&& -[UIButtonAccessibility buttonType](v60, "buttonType") != 7? (v49 = 0): (v61 = accessibilityLocalizedString(@"close.button"), v49 = 1)): (v61 = accessibilityLocalizedString(@"clear.button.text"), v49 = 1)): (v61 = accessibilityLocalizedString(@"more.info.button"), v49 = 1), objc_storeStrong(&v47, 0), !v49))
      {
        if (![v59[0] length])
        {
          id v15 = (id)[v51 _accessibilityAXAttributedLabel];
          id v16 = v59[0];
          v59[0] = v15;
        }
        if (![v59[0] length])
        {
          id v46 = [(UIButtonAccessibility *)v60 _accessibilityImagePath];
          if (![v46 length]
            || (uint64_t v44 = [v46 rangeOfString:@"ForgotPasswordButton"],
                uint64_t v45 = v17,
                v44 == 0x7FFFFFFFFFFFFFFFLL))
          {
            id v20 = (id)[(UIButtonAccessibility *)v60 _accessibilityRetrieveImagePathLabel:v46];
            id v21 = v59[0];
            v59[0] = v20;

            if ([v59[0] length])
            {
              id v43 = (id)objc_msgSend(MEMORY[0x263F81180], "dictionaryWithAXAuditIssue:element:additionalInfo:identifier:foregroundColor:backgroundColor:fontSize:elementRect:text:", 1001, v60, 0, 0, 0, 0, 0, 0);
              [(UIButtonAccessibility *)v60 _accessibilitySetAuditIssueDict:v43];
              objc_storeStrong(&v43, 0);
            }
          }
          else
          {
            id v18 = accessibilityLocalizedString(@"help.button");
            id v19 = v59[0];
            v59[0] = v18;
          }
          objc_storeStrong(&v46, 0);
        }
        if ([v59[0] length]
          || (id v28 = (id)[v51 accessibilityLabel],
              BOOL v29 = [v28 length] == 0,
              v28,
              v29))
        {
          id v22 = (id)[v59[0] stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
          id v23 = v59[0];
          v59[0] = v22;

          id v26 = (id)[v59[0] uppercaseString];
          char v27 = [v26 isEqualToString:v59[0]];

          if (v27)
          {
            id v42 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v59[0]];
            [v42 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21710]];
            objc_storeStrong(v59, v42);
            objc_storeStrong(&v42, 0);
          }
          id v61 = v59[0];
          int v49 = 1;
        }
        else
        {
          id v61 = (id)[v51 accessibilityLabel];
          int v49 = 1;
        }
      }
    }
    objc_storeStrong(&v51, 0);
    objc_storeStrong(v59, 0);
  }
  else
  {
    id v61 = (id)[(UIButtonAccessibility *)v60 accessibilityUserDefinedLabel];
  }
  v24 = v61;

  return v24;
}

- (BOOL)_accessibilityElementHasImage
{
  id v2 = (id)[(UIButtonAccessibility *)self imageForState:0];
  BOOL v6 = v2 == 0;

  if (!v6) {
    return 1;
  }
  id v3 = (id)[(UIButtonAccessibility *)self backgroundImageForState:0];
  BOOL v5 = v3 == 0;

  return !v5;
}

- (id)accessibilityValue
{
  id v13 = self;
  v12[1] = (id)a2;
  v11.receiver = self;
  v11.super_class = (Class)UIButtonAccessibility;
  v12[0] = [(UIButtonAccessibility *)&v11 accessibilityValue];
  if (![v12[0] length])
  {
    char v9 = 0;
    objc_opt_class();
    id v6 = (id)[(UIButtonAccessibility *)v13 safeValueForKey:@"_currentConfiguration"];
    id v8 = (id)__UIAccessibilityCastAsClass();

    id v7 = v8;
    objc_storeStrong(&v8, 0);
    id v10 = v7;
    if (v7)
    {
      id v2 = (id)[v10 subtitle];
      id v3 = v12[0];
      v12[0] = v2;
    }
    objc_storeStrong(&v10, 0);
  }
  id v5 = v12[0];
  objc_storeStrong(v12, 0);

  return v5;
}

- (id)_accessibilityAuditIssuesWithOptions:(id)a3
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11.receiver = v14;
  v11.super_class = (Class)UIButtonAccessibility;
  id v12 = [(UIButtonAccessibility *)&v11 _accessibilityAuditIssuesWithOptions:location[0]];
  id v10 = (id)[MEMORY[0x263F81180] optionsDictionaryForAuditTest:*MEMORY[0x263F21588] inDictionary:location[0]];
  char v9 = 0;
  char v9 = [MEMORY[0x263F81180] checkBoolValueForOptionsKey:*MEMORY[0x263F215D0] inDictionary:v10] & 1;
  if (v9)
  {
    id v3 = [(UIButtonAccessibility *)v14 accessibilityLabel];
    id v8 = (id)[(UIButtonAccessibility *)v14 _accessibilityValueForKey:*MEMORY[0x263F81460]];
    id v6 = v12;
    id v7 = (id)[v8 allObjects];
    objc_msgSend(v6, "addObjectsFromArray:");

    objc_storeStrong(&v8, 0);
  }
  id v5 = v12;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);

  return v5;
}

- (unint64_t)_accessibilityAutomationType
{
  return 9;
}

- (BOOL)isAccessibilityElement
{
  id v2 = (id)[(UIButtonAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v13 = v2 == 0;

  if (v13)
  {
    id v10 = (id)[(UIButtonAccessibility *)self accessibilityIdentification];
    char v11 = [v10 isEqualToString:@"UITableCellViewDisclosure"];

    if (v11)
    {
      return 1;
    }
    else
    {
      [(UIButtonAccessibility *)self accessibilityFrame];
      if (__CGSizeEqualToSize(v3, v4, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8))
        && ([(UIButtonAccessibility *)self frame],
            __CGSizeEqualToSize(*MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8), v5, v6)))
      {
        return 0;
      }
      else
      {
        BOOL v9 = 0;
        if (([(UIButtonAccessibility *)self isHiddenOrHasHiddenAncestor] & 1) == 0)
        {
          [(UIButtonAccessibility *)self alpha];
          return v7 > 0.0;
        }
        return v9;
      }
    }
  }
  else
  {
    id v12 = (id)[(UIButtonAccessibility *)self isAccessibilityUserDefinedElement];
    BOOL v15 = [v12 BOOLValue] & 1;
  }
  return v15;
}

- (BOOL)_accessibilityIsEmptyShellOfAButton
{
  [(UIButtonAccessibility *)self bounds];
  if (!__CGSizeEqualToSize(*MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8), v2, v3)) {
    return 0;
  }
  id v4 = (id)[(UIButtonAccessibility *)self configuration];
  BOOL v7 = v4 != 0;

  return v7;
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return [(UIButtonAccessibility *)self _accessibilityIsEmptyShellOfAButton];
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return [(UIButtonAccessibility *)self _accessibilityIsEmptyShellOfAButton];
}

- (CGRect)_accessibilityButtonChildrenCombinedFrame
{
  id v18 = self;
  v17[1] = (id)a2;
  v17[0] = (id)objc_msgSend(NSString, "stringWithFormat:", @"ButtonFrameKey-%p", self);
  id location = (id)[(id)*MEMORY[0x263F81160] objectForKeyedSubscript:v17[0]];
  if (location)
  {
    [location rectValue];
    *(void *)&long long v19 = v2;
    *((void *)&v19 + 1) = v3;
    *(void *)&long long v20 = v4;
    *((void *)&v20 + 1) = v5;
  }
  else
  {
    id v14 = (id)[(UIButtonAccessibility *)v18 subviews];
    UIAXFrameForElements();
    *(void *)&long long v19 = v6;
    *((void *)&v19 + 1) = v7;
    *(void *)&long long v20 = v8;
    *((void *)&v20 + 1) = v9;

    id v15 = (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v19, v20);
    objc_msgSend((id)*MEMORY[0x263F81160], "setObject:forKeyedSubscript:");
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v17, 0);
  double v11 = *((double *)&v19 + 1);
  double v10 = *(double *)&v19;
  double v13 = *((double *)&v20 + 1);
  double v12 = *(double *)&v20;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)accessibilityFrame
{
  uint64_t v8 = self;
  SEL v7 = a2;
  if ([(UIButtonAccessibility *)self _accessibilityIsEmptyShellOfAButton])
  {
    [(UIButtonAccessibility *)v8 _accessibilityButtonChildrenCombinedFrame];
  }
  else
  {
    v6.receiver = v8;
    v6.super_class = (Class)UIButtonAccessibility;
    [(UIButtonAccessibility *)&v6 accessibilityFrame];
  }
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  [(UIButtonAccessibility *)self _accessibilityButtonChildrenCombinedFrame];
  AX_CGRectGetCenter();
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)accessibilityPerformEscape
{
  objc_super v6 = self;
  SEL v5 = a2;
  unint64_t v2 = [(UIButtonAccessibility *)self accessibilityTraits];
  if ((v2 & *MEMORY[0x263F81370]) != 0
    && ([(UIButtonAccessibility *)v6 _accessibilityViewIsVisible] & 1) != 0)
  {
    return [(UIButtonAccessibility *)v6 accessibilityActivate] & 1;
  }
  v4.receiver = v6;
  v4.super_class = (Class)UIButtonAccessibility;
  return [(UIButtonAccessibility *)&v4 accessibilityPerformEscape];
}

- (unint64_t)_accessibilityNativeTraits
{
  id v18 = self;
  SEL v17 = a2;
  unint64_t v16 = 0;
  v15.receiver = self;
  v15.super_class = (Class)UIButtonAccessibility;
  unint64_t v16 = [(UIButtonAccessibility *)&v15 accessibilityTraits];
  id location = (id)[(UIButtonAccessibility *)v18 safeValueForKey:@"currentImage"];
  id v7 = (id)[location accessibilityIdentifier];
  char v11 = 0;
  BOOL v8 = 0;
  if ([v7 hasPrefix:@"UINavigationBarBackIndicatorDefault"])
  {
    id v6 = (id)[(UIButtonAccessibility *)v18 imageView];
    id v12 = v6;
    char v11 = 1;
    if (v6) {
      [v6 transform];
    }
    else {
      memset(&__b, 0, sizeof(__b));
    }
    memcpy(&__dst, MEMORY[0x263F000D0], sizeof(__dst));
    BOOL v8 = CGAffineTransformEqualToTransform(&__b, &__dst);
  }
  if (v11) {

  }
  if (v8) {
    v16 |= *MEMORY[0x263F81370];
  }
  id v2 = [(UIButtonAccessibility *)v18 _accessibilityButtonMacCatalystPopupButtonCell];
  BOOL v5 = v2 == 0;

  if (v5)
  {
    uint64_t v9 = [(UIButtonAccessibility *)v18 buttonType];
    if (v9 == 125 || v9 == 124) {
      v16 |= *MEMORY[0x263F813C0];
    }
  }
  else
  {
    v16 |= *MEMORY[0x263F813C0];
  }
  unint64_t v4 = v16 | *MEMORY[0x263F1CEE8];
  objc_storeStrong(&location, 0);
  return v4;
}

- (unint64_t)accessibilityTraits
{
  id v2 = (id)[(UIButtonAccessibility *)self accessibilityUserDefinedTraits];
  BOOL v5 = v2 == 0;

  if (v5) {
    return [(UIButtonAccessibility *)self _accessibilityNativeTraits];
  }
  id v4 = (id)[(UIButtonAccessibility *)self accessibilityUserDefinedTraits];
  unint64_t v7 = [v4 unsignedLongLongValue];

  return v7;
}

- (id)accessibilityPath
{
  id v35 = self;
  v34[1] = (id)a2;
  v34[0] = 0;
  char v32 = 0;
  objc_opt_class();
  id v17 = (id)[(UIButtonAccessibility *)v35 currentAttributedTitle];
  id v31 = (id)__UIAccessibilityCastAsClass();

  id v30 = v31;
  objc_storeStrong(&v31, 0);
  id v33 = v30;
  id v15 = (id)[v30 string];
  BOOL v16 = [v15 length] != 0;

  if (v16)
  {
    if ([v33 length])
    {
      id v4 = (id)UIAccessibilityConvertAttachmentsInAttributedStringToAX();
      id v5 = v34[0];
      v34[0] = v4;

      if (!v34[0])
      {
        id v6 = (id)[v33 string];
        id v7 = v34[0];
        v34[0] = v6;
      }
    }
  }
  else
  {
    id v2 = (id)[(UIButtonAccessibility *)v35 safeValueForKey:@"currentTitle"];
    id v3 = v34[0];
    v34[0] = v2;
  }
  v28[1] = COERCE_ID(3.0);
  if (![(UIButtonAccessibility *)v35 _axButtonTypeIsModernCircle]
    || [v34[0] length])
  {
    goto LABEL_19;
  }
  v28[0] = (id)[(UIButtonAccessibility *)v35 safeUIViewForKey:@"_imageView"];
  BOOL v27 = 0;
  BOOL v14 = 1;
  if ([(UIButtonAccessibility *)v35 buttonType] != 7) {
    BOOL v14 = v28[0] == 0;
  }
  BOOL v27 = v14;
  char v24 = 0;
  if (v14)
  {
    id v25 = (id)[(UIButtonAccessibility *)v35 safeUIViewForKey:@"_backgroundView"];
    char v24 = 1;
    id v8 = v25;
  }
  else
  {
    id v8 = v28[0];
  }
  id v26 = v8;
  if (v24) {

  }
  [v26 accessibilityFrame];
  CGRect rect = v38;
  if (CGRectIsEmpty(v38))
  {
    int v19 = 0;
  }
  else
  {
    double v13 = (void *)MEMORY[0x263F1C478];
    AX_CGRectGetCenter();
    double v20 = v9;
    double v21 = v10;
    id v22 = (id)objc_msgSend(v13, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v9, v10, rect.size.width / 2.0 + 3.0, 0.0, 6.28318531);
    id v36 = v22;
    int v19 = 1;
    objc_storeStrong(&v22, 0);
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(v28, 0);
  if (!v19)
  {
LABEL_19:
    v18.receiver = v35;
    v18.super_class = (Class)UIButtonAccessibility;
    id v36 = [(UIButtonAccessibility *)&v18 accessibilityPath];
    int v19 = 1;
  }
  objc_storeStrong(&v33, 0);
  objc_storeStrong(v34, 0);
  char v11 = v36;

  return v11;
}

- (BOOL)_axButtonTypeIsModernCircle
{
  uint64_t v4 = [(UIButtonAccessibility *)self buttonType];
  BOOL v3 = 1;
  if (v4 != 3)
  {
    BOOL v3 = 1;
    if (v4 != 4)
    {
      BOOL v3 = 1;
      if (v4 != 5)
      {
        BOOL v3 = 1;
        if (v4 != 2)
        {
          BOOL v3 = 1;
          if (v4 != 7)
          {
            BOOL v3 = 1;
            if (v4 != 118)
            {
              BOOL v3 = 1;
              if (v4 != 119)
              {
                BOOL v3 = 1;
                if (v4 != 120)
                {
                  BOOL v3 = 1;
                  if (v4 != 121)
                  {
                    BOOL v3 = 1;
                    if (v4 != 122) {
                      return v4 == 123;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v3;
}

- (BOOL)_accessibilityIsMacVisualAppearance
{
  return 0;
}

- (id)_accessibilityButtonMacCatalystPopupButtonCell
{
  return 0;
}

@end