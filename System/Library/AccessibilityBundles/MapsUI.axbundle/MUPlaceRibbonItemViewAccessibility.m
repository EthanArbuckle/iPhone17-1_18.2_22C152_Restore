@interface MUPlaceRibbonItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation MUPlaceRibbonItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MUPlaceRibbonItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MUPlaceRibbonItemView" hasInstanceVariable:@"_titleLabel" withType:"UIView<MULabelViewProtocol>"];
  [v3 validateClass:@"MUPlaceRibbonItemView" hasInstanceVariable:@"_valueLabel" withType:"UIView<MULabelViewProtocol>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MUPlaceRibbonItemView", @"viewModel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  id v3 = [(MUPlaceRibbonItemViewAccessibility *)self safeValueForKey:@"viewModel"];
  if ([v3 _accessibilityIntegerValueForKey:@"RibbonItemViewTypeKey"] == 7)
  {
    v7.receiver = self;
    v7.super_class = (Class)MUPlaceRibbonItemViewAccessibility;
    unint64_t v4 = ([(MUPlaceRibbonItemViewAccessibility *)&v7 accessibilityTraits] | *MEMORY[0x263F1CEE8]) != 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MUPlaceRibbonItemViewAccessibility;
    unint64_t v4 = [(MUPlaceRibbonItemViewAccessibility *)&v6 accessibilityTraits];
  }

  return v4;
}

- (id)accessibilityLabel
{
  id v3 = [(MUPlaceRibbonItemViewAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  unint64_t v4 = [v3 accessibilityLabel];

  v5 = [(MUPlaceRibbonItemViewAccessibility *)self safeValueForKey:@"viewModel"];
  if ([v5 _accessibilityIntegerValueForKey:@"RibbonItemViewTypeKey"] == 2 {
    && [v4 containsString:@"("]
  }
  {
    v8 = accessibilityLocalizedString(@"RATINGS");
    uint64_t v6 = __AXStringForVariables();

    unint64_t v4 = (void *)v6;
  }

  return v4;
}

- (id)accessibilityValue
{
  id v3 = [(MUPlaceRibbonItemViewAccessibility *)self safeValueForKey:@"viewModel"];
  uint64_t v4 = [v3 _accessibilityIntegerValueForKey:@"RibbonItemViewTypeKey"];
  v5 = [(MUPlaceRibbonItemViewAccessibility *)self safeUIViewForKey:@"_valueLabel"];
  uint64_t v6 = [v5 accessibilityLabel];

  objc_super v7 = [(MUPlaceRibbonItemViewAccessibility *)self safeUIViewForKey:@"_valueLabel"];
  v8 = [v7 safeValueForKey:@"attributedText"];

  switch(v4)
  {
    case 2:
      v9 = [v8 string];
      char v10 = [v9 containsString:@"%"];

      if (v10)
      {
        v11 = NSString;
        v12 = accessibilityLocalizedString(@"RECOMMEND");
        id v13 = [v11 stringWithFormat:@"%@ %@", v6, v12];

        goto LABEL_19;
      }
      v24 = [v8 string];
      v25 = [v24 substringFromIndex:1];
      [v25 floatValue];

      uint64_t v26 = UIAXStarRatingStringForRating();
      goto LABEL_18;
    case 3:
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x3032000000;
      v36 = __Block_byref_object_copy__0;
      v37 = __Block_byref_object_dispose__0;
      v38 = &stru_26F6F4CD0;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = [v8 length];
        uint64_t v15 = *MEMORY[0x263F1C208];
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __56__MUPlaceRibbonItemViewAccessibility_accessibilityValue__block_invoke_2;
        v29[3] = &unk_26512F058;
        v29[4] = &v33;
        objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v15, 0, v14, 0, v29);
        v28 = [v8 string];
        uint64_t v16 = __UIAXStringForVariables();
        v17 = (void *)v34[5];
        v34[5] = v16;
      }
      id v13 = (id)v34[5];
      goto LABEL_10;
    case 4:
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x3032000000;
      v36 = __Block_byref_object_copy__0;
      v37 = __Block_byref_object_dispose__0;
      v38 = &stru_26F6F4CD0;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v18 = [v8 length];
        uint64_t v19 = *MEMORY[0x263F1C240];
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __56__MUPlaceRibbonItemViewAccessibility_accessibilityValue__block_invoke;
        v30[3] = &unk_26512F030;
        v32 = &v33;
        id v31 = v8;
        objc_msgSend(v31, "enumerateAttribute:inRange:options:usingBlock:", v19, 0, v18, 0, v30);
      }
      id v13 = [MEMORY[0x263F21660] axAttributedStringWithString:v34[5]];
      uint64_t v20 = *MEMORY[0x263F218A0];
      uint64_t v21 = [(id)v34[5] length];
      objc_msgSend(v13, "setAttribute:forKey:withRange:", MEMORY[0x263EFFA88], v20, 0, v21);
LABEL_10:

      _Block_object_dispose(&v33, 8);
      goto LABEL_19;
    case 7:
      uint64_t v22 = [v3 _accessibilityIntegerValueForKey:@"RibbonItemViewRatingStateKey"];
      if (v22 == 2)
      {
        v23 = @"LIKED";
      }
      else if (v22 == 1)
      {
        v23 = @"DISLIKED";
      }
      else
      {
        v23 = @"NOT RATED";
      }
      uint64_t v26 = accessibilityLocalizedString(v23);
LABEL_18:
      id v13 = (id)v26;

LABEL_19:
      uint64_t v6 = v13;
      break;
    default:
      break;
  }

  return v6;
}

void __56__MUPlaceRibbonItemViewAccessibility_accessibilityValue__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  objc_super v7 = (void *)MEMORY[0x263F1C550];
  id v8 = a2;
  id v9 = [v7 systemGrayColor];

  if (v9 != v8)
  {
    id v13 = [*(id *)(a1 + 32) string];
    uint64_t v10 = objc_msgSend(v13, "substringWithRange:", a3, a4);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

void __56__MUPlaceRibbonItemViewAccessibility_accessibilityValue__block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  MEMORY[0x2456534B0](@"NSTextAttachment");
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v8 image];
    objc_super v7 = [v3 accessibilityLabel];
    uint64_t v4 = __UIAXStringForVariables();
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

@end