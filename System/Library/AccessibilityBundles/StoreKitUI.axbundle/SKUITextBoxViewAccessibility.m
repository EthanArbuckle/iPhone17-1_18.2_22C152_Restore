@interface SKUITextBoxViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)isAccessibilityElement:(id)a3;
- (CGRect)accessibilityFrame:(id)a3;
- (id)accessibilityElements;
- (id)accessibilityLabel:(id)a3;
- (unint64_t)accessibilityTraits:(id)a3;
- (void)_accessibilitySwitchOrderedChildrenFrom:(id)a3;
@end

@implementation SKUITextBoxViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUITextBoxView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SKUITextBoxView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"SKUITextBoxView" hasInstanceVariable:@"_subtitleLabel" withType:"UILabel"];
  [v3 validateClass:@"SKUITextBoxView" hasInstanceVariable:@"_ratingLabel" withType:"UILabel"];
  [v3 validateClass:@"SKUITextBoxView" hasInstanceVariable:@"_ratingImageView" withType:"UIImageView"];
  [v3 validateClass:@"SKUITextBoxView" hasInstanceVariable:@"_underlyingText" withType:"NSString"];
  [v3 validateClass:@"SKUITextBoxView" hasInstanceVariable:@"_textFrame" withType:"^{__CTFrame=}"];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  id v3 = (void *)MEMORY[0x263F81490];
  v4 = [(SKUITextBoxViewAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (!v4)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v5 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
    [v5 setAccessibilityDelegate:self];
    [v5 setAccessibilityIdentifier:@"ElementIDHeader"];
    [v4 addObject:v5];
    v6 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:self];
    [v6 setAccessibilityDelegate:self];
    [v6 setAccessibilityIdentifier:@"ElementIDContent"];
    [v4 addObject:v6];
    [(SKUITextBoxViewAccessibility *)self _accessibilitySetRetainedValue:v4 forKey:*v3];
  }

  return v4;
}

- (BOOL)isAccessibilityElement:(id)a3
{
  id v3 = [a3 accessibilityLabel];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (id)accessibilityLabel:(id)a3
{
  id v4 = a3;
  v5 = [v4 accessibilityIdentifier];
  int v6 = [v5 isEqualToString:@"ElementIDHeader"];

  if (v6)
  {
    v7 = [(SKUITextBoxViewAccessibility *)self safeValueForKey:@"_titleLabel"];
    v8 = [v7 accessibilityLabel];
  }
  else
  {
    v9 = [v4 accessibilityIdentifier];
    int v10 = [v9 isEqualToString:@"ElementIDContent"];

    if (!v10)
    {
      v19.receiver = self;
      v19.super_class = (Class)SKUITextBoxViewAccessibility;
      v8 = [(SKUITextBoxViewAccessibility *)&v19 accessibilityLabel];
      goto LABEL_10;
    }
    v7 = [(SKUITextBoxViewAccessibility *)self safeValueForKey:@"_subtitleLabel"];
    v11 = [(SKUITextBoxViewAccessibility *)self safeValueForKey:@"_ratingLabel"];
    v12 = [(SKUITextBoxViewAccessibility *)self safeValueForKey:@"_ratingImageView"];
    [(SKUITextBoxViewAccessibility *)self safeIvarForKey:@"_textFrame"];
    v13 = UIAccessibilitySafeTextForCoreTextObject();
    v14 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v15 = [v13 stringByTrimmingCharactersInSet:v14];

    if ([v15 length]) {
      objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 4, v7, v11, v12, v13);
    }
    else {
    v16 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 3, v7, v11, v12, v18);
    }
    v8 = MEMORY[0x2455E57F0]();
  }
LABEL_10:

  return v8;
}

- (CGRect)accessibilityFrame:(id)a3
{
  id v4 = a3;
  v5 = [v4 accessibilityIdentifier];
  int v6 = [v5 isEqualToString:@"ElementIDHeader"];

  if (v6)
  {
    v7 = [(SKUITextBoxViewAccessibility *)self safeValueForKey:@"_titleLabel"];
    [v7 accessibilityFrame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    v16 = [v4 accessibilityIdentifier];
    int v17 = [v16 isEqualToString:@"ElementIDContent"];

    if (v17)
    {
      [(SKUITextBoxViewAccessibility *)self accessibilityFrame];
    }
    else
    {
      v26.receiver = self;
      v26.super_class = (Class)SKUITextBoxViewAccessibility;
      [(SKUITextBoxViewAccessibility *)&v26 accessibilityFrame];
    }
    double v9 = v18;
    double v11 = v19;
    double v13 = v20;
    double v15 = v21;
  }

  double v22 = v9;
  double v23 = v11;
  double v24 = v13;
  double v25 = v15;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (unint64_t)accessibilityTraits:(id)a3
{
  id v4 = a3;
  v5 = [v4 accessibilityIdentifier];
  int v6 = [v5 isEqualToString:@"ElementIDHeader"];

  if (v6)
  {
    v7 = [v4 accessibilityLabel];

    uint64_t v8 = [v7 length];
    if (v8) {
      double v9 = (unint64_t *)MEMORY[0x263F1CEF8];
    }
    else {
      double v9 = (unint64_t *)MEMORY[0x263F813E8];
    }
  }
  else
  {
    double v10 = [v4 accessibilityIdentifier];

    int v11 = [v10 isEqualToString:@"ElementIDContent"];
    if (!v11)
    {
      v13.receiver = self;
      v13.super_class = (Class)SKUITextBoxViewAccessibility;
      return (unint64_t)[(SKUITextBoxViewAccessibility *)&v13 accessibilityTraits];
    }
    double v9 = (unint64_t *)MEMORY[0x263F1CF18];
  }
  return *v9;
}

- (void)_accessibilitySwitchOrderedChildrenFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F81490];
  int v6 = [v4 _accessibilityValueForKey:*MEMORY[0x263F81490]];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v11 setAccessibilityDelegate:self];
        [v11 setAccessibilityContainer:self];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  [(SKUITextBoxViewAccessibility *)self _accessibilitySetRetainedValue:v6 forKey:*v5];
  [v4 _accessibilityRemoveValueForKey:*v5];
}

@end