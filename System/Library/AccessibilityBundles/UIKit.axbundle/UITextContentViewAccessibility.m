@interface UITextContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldAnnounceFontInfo;
- (BOOL)_accessibilityShouldUpdateTextCache;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5;
- (BOOL)keyboardInput:(id)a3 shouldReplaceTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)keyboardInputChanged:(id)a3;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (_NSRange)_accessibilitySelectedTextRange;
- (id)_accessibilityAttributedTextRetrieval;
- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3;
- (id)_accessibilityCapturedImages;
- (id)_accessibilityDataDetectorScheme:(CGPoint)a3;
- (id)_accessibilitySupplementaryHeaderViews;
- (id)_accessibilityTextViewTextOperationResponder;
- (id)accessibilityCustomRotors;
- (id)accessibilityValue;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)_accessibilitySetShouldUpdateCache:(BOOL)a3;
- (void)_accessibilitySetValue:(id)a3;
- (void)keyboardInputChangedSelection:(id)a3;
@end

@implementation UITextContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITextContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  id v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = @"UITextContentView";
  v4 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"keyboardInput: shouldInsertText: isMarkedText:", "@", "@", v4, 0);
  v6 = "{_NSRange=QQ}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"keyboardInput: shouldReplaceTextInRange: replacementText:", v4, v3, "{_NSRange=QQ}", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"keyboardInputChangedSelection:", "v", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"keyboardInputChanged:", v4, v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"selectedRange", v6, 0);
  objc_storeStrong(v8, v7);
}

- (id)_accessibilitySupplementaryHeaderViews
{
  v7[2] = self;
  v7[1] = (id)a2;
  id v3 = (id)[(UITextContentViewAccessibility *)self _accessibleNonSupplementarySubviews];
  v7[0] = (id)[v3 mutableCopy];

  id v4 = v7[0];
  id v5 = (id)[v7[0] indexesOfObjectsPassingTest:&__block_literal_global_43];
  objc_msgSend(v4, "removeObjectsAtIndexes:");

  id v6 = v7[0];
  objc_storeStrong(v7, 0);

  return v6;
}

BOOL __72__UITextContentViewAccessibility__accessibilitySupplementaryHeaderViews__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  BOOL v4 = ([location[0] _accessibilityIsWebDocumentView] & 1) != 0;
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)_accessibilityShouldAnnounceFontInfo
{
  return 0;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  id v3 = (id)[(UITextContentViewAccessibility *)self safeValueForKey:@"canBecomeFirstResponder"];
  char v4 = [v3 BOOLValue];

  return v4 & 1;
}

- (BOOL)accessibilityActivate
{
  BOOL v4 = 0;
  if ([(UITextContentViewAccessibility *)self _accessibilitySupportsActivateAction])
  {
    [(UITextContentViewAccessibility *)self becomeFirstResponder];
    if ([(UITextContentViewAccessibility *)self isFirstResponder]) {
      return 1;
    }
  }
  return v4;
}

- (id)_accessibilityDataDetectorScheme:(CGPoint)a3
{
  id v4 = (id)[(UITextContentViewAccessibility *)self safeValueForKey:@"m_webView"];
  id v5 = (id)objc_msgSend(v4, "_accessibilityDataDetectorScheme:", a3.x, a3.y);

  return v5;
}

- (void)_accessibilitySetValue:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (id)[(UITextContentViewAccessibility *)v7 safeValueForKey:@"isFirstResponder"];
    char v5 = [v4 BOOLValue];

    if ((v5 & 1) == 0) {
      id v3 = (id)[(UITextContentViewAccessibility *)v7 safeValueForKey:@"becomeFirstResponder"];
    }
    [(UITextContentViewAccessibility *)v7 setText:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilitySetShouldUpdateCache:(BOOL)a3
{
}

- (BOOL)_accessibilityShouldUpdateTextCache
{
  return ([(UITextContentViewAccessibility *)self _accessibilityBoolValueForKey:@"AXAttrCacheIsClean", a2, self] ^ 1) & 1;
}

- (BOOL)keyboardInputChanged:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v6 = 0;
  v5.receiver = v8;
  v5.super_class = (Class)UITextContentViewAccessibility;
  char v6 = [(UITextContentViewAccessibility *)&v5 keyboardInputChanged:location[0]];
  [(UITextContentViewAccessibility *)v8 _accessibilitySetBoolValue:0 forKey:@"AXAttrCacheIsClean"];
  char v4 = v6;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (unint64_t)_accessibilityAutomationType
{
  return 52;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  return (id)[(UITextContentViewAccessibility *)self safeValueForKey:@"webView", a2, self];
}

- (void)keyboardInputChangedSelection:(id)a3
{
  objc_super v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UITextContentViewAccessibility;
  [(UITextContentViewAccessibility *)&v3 keyboardInputChangedSelection:location[0]];
  _UIAccessibilitySetAssociatedElementContextForNextNotification();
  UIAccessibilityPostNotification(*MEMORY[0x263F81340], 0);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3
{
  v27 = self;
  SEL v26 = a2;
  v25 = a3;
  id v24 = 0;
  id v23 = (id)[(UITextContentViewAccessibility *)self _accessibilityAXAttributedValue];
  id v22 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = (id)[v23 cfAttributedString];
    id v4 = v22;
    id v22 = v3;
  }
  else if (v23)
  {
    objc_super v5 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v23];
    id v6 = v22;
    id v22 = v5;
  }
  NSUInteger length = v25->length;
  NSUInteger v28 = v25->location;
  NSUInteger v29 = length;
  if (v28 + length <= [v23 length])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v19 = (id)objc_msgSend(v22, "attributedSubstringFromRange:", v25->location, v25->length);
      v8 = (void *)[v19 mutableCopy];
      id v9 = v24;
      id v24 = v8;
    }
  }
  if (!v24)
  {
    id location = (id)[(UITextContentViewAccessibility *)v27 safeValueForKey:@"m_webView"];
    if ([location _accessibilityIsWebDocumentView])
    {
      id v18 = (id)[location _accessibilityAttributedValueForRange:v25];
      v10 = (void *)[v18 mutableCopy];
      id v11 = v24;
      id v24 = v10;
    }
    if (![v24 length])
    {
      v20.receiver = v27;
      v20.super_class = (Class)UITextContentViewAccessibility;
      id v17 = [(UITextContentViewAccessibility *)&v20 _accessibilityAttributedValueForRange:v25];
      v12 = (void *)[v17 mutableCopy];
      id v13 = v24;
      id v24 = v12;
    }
    objc_storeStrong(&location, 0);
  }
  -[UITextContentViewAccessibility _accessibilityConvertStyleAttributesToAccessibility:](v27, "_accessibilityConvertStyleAttributesToAccessibility:", v24, &v24);
  [(UITextContentViewAccessibility *)v27 _accessibilityAddMispellingsToAttributedString:v24];
  id v16 = v24;
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(v15, 0);

  return v16;
}

- (id)accessibilityValue
{
  v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)[(UITextContentViewAccessibility *)self accessibilityUserDefinedValue];
  if (!v14[0])
  {
    v14[0] = (id)[(UITextContentViewAccessibility *)v15 safeValueForKey:@"attributedText"];

    id v2 = (id)UIAccessibilityConvertAttachmentsInAttributedStringToAX();
    id v3 = v14[0];
    v14[0] = v2;

    if (!v14[0])
    {
      v14[0] = (id)[(UITextContentViewAccessibility *)v15 safeValueForKey:@"text"];
    }
  }
  uint64_t v4 = [(UITextContentViewAccessibility *)v15 accessibilityTraits];
  if ((v4 & *MEMORY[0x263F813D8]) == *MEMORY[0x263F813D8])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = (id)[v14[0] string];
      id v6 = v14[0];
      v14[0] = v5;
    }
    char v13 = 0;
    objc_opt_class();
    id v12 = (id)__UIAccessibilityCastAsClass();
    id v11 = v12;
    objc_storeStrong(&v12, 0);
    id v7 = -[UIView _accessibilitySecureTextForString:]((uint64_t)v11, v14[0]);
    id v8 = v14[0];
    v14[0] = v7;
  }
  id v10 = v14[0];
  objc_storeStrong(v14, 0);

  return v10;
}

- (BOOL)isAccessibilityElement
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITextContentViewAccessibility *)self isAccessibilityUserDefinedElement];
  if (location[0]) {
    char v4 = [location[0] BOOLValue] & 1;
  }
  else {
    char v4 = 1;
  }
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (CGRect)accessibilityFrame
{
  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  id v29 = (id)[(UITextContentViewAccessibility *)self superview];
  while (v29)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong(location, v29);
      break;
    }
    id v2 = (id)[v29 superview];
    id v3 = v29;
    id v29 = v2;
  }
  if (location[0])
  {
    [(UITextContentViewAccessibility *)v31 bounds];
    uint64_t v25 = v4;
    uint64_t v26 = v5;
    uint64_t v27 = v6;
    [location[0] bounds];
    uint64_t v21 = v7;
    uint64_t v22 = v8;
    uint64_t v23 = v9;
    uint64_t v24 = v10;
    uint64_t v28 = v10;
    UIAccessibilityFrameForBounds();
  }
  else
  {
    v19.receiver = v31;
    v19.super_class = (Class)UITextContentViewAccessibility;
    [(UITextContentViewAccessibility *)&v19 accessibilityFrame];
  }
  double v32 = v11;
  double v33 = v12;
  double v34 = v13;
  double v35 = v14;
  int v20 = 1;
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  double v15 = v32;
  double v16 = v33;
  double v17 = v34;
  double v18 = v35;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)_accessibilityAttributedTextRetrieval
{
  return (id)[(UITextContentViewAccessibility *)self attributedText];
}

- (id)accessibilityCustomRotors
{
  uint64_t v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)[MEMORY[0x263EFF980] array];
  id v6 = (id)[(UITextContentViewAccessibility *)v8 _accessibilityInternalTextLinkCustomRotors];
  objc_msgSend(v7[0], "axSafelyAddObjectsFromArray:");

  if ([(UITextContentViewAccessibility *)v8 isEditable])
  {
    id v5 = (id)[(UITextContentViewAccessibility *)v8 _accessibilityCommonStylingRotors];
    objc_msgSend(v7[0], "axSafelyAddObjectsFromArray:");

    if (!AXUIKeyboardTypeSupportsMisspelledRotor([(UITextContentViewAccessibility *)v8 keyboardType]))
    {
      id v4 = (id)[(UITextContentViewAccessibility *)v8 _accessibilityMisspelledRotor];
      objc_msgSend(v7[0], "removeObject:");
    }
  }
  id v3 = v7[0];
  objc_storeStrong(v7, 0);

  return v3;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v21 = self;
  SEL v20 = a2;
  unint64_t v19 = 0;
  if ([(UITextContentViewAccessibility *)self isEditable]) {
    unint64_t v19 = *MEMORY[0x263F81408] | *MEMORY[0x263F21B60];
  }
  else {
    unint64_t v19 = *MEMORY[0x263F1CF48] | *MEMORY[0x263F21B60];
  }
  id v6 = (id)[(UITextContentViewAccessibility *)v21 safeValueForKey:@"selectedRange"];
  uint64_t v17 = [v6 rangeValue];
  uint64_t v18 = v2;

  id v7 = (id)[(UITextContentViewAccessibility *)v21 safeValueForKey:@"isEditing"];
  char v15 = 0;
  char v13 = 0;
  BOOL v8 = 0;
  if ([v7 BOOLValue])
  {
    BOOL v8 = 0;
    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v16 = (id)[(UITextContentViewAccessibility *)v21 _accessibilityWindow];
      char v15 = 1;
      double v14 = (UITextContentViewAccessibility *)(id)[v16 firstResponder];
      char v13 = 1;
      BOOL v8 = v14 == v21;
    }
  }
  if (v13) {

  }
  if (v15) {
  if (v8
  }
    && (([(id)*MEMORY[0x263F1D020] _accessibilityHardwareKeyboardActive] & 1) != 0
     || ([(id)*MEMORY[0x263F1D020] _accessibilitySoftwareKeyboardActive] & 1) != 0
     || _AXSMossdeepEnabled()))
  {
    v19 |= *MEMORY[0x263F81398];
  }
  id v12 = (id)[(UITextContentViewAccessibility *)v21 accessibilityUserDefinedTraits];
  if (v12) {
    v19 |= [v12 unsignedLongLongValue];
  }
  char v11 = 0;
  objc_opt_class();
  id v10 = (id)__UIAccessibilityCastAsClass();
  id v9 = v10;
  objc_storeStrong(&v10, 0);
  uint64_t v3 = -[UIView _accessibilityTextAreaTraits](v9);
  v19 |= v3;

  unint64_t v5 = v19;
  objc_storeStrong(&v12, 0);
  return v5;
}

- (CGPoint)accessibilityActivationPoint
{
  double v14 = self;
  SEL v13 = a2;
  unint64_t v2 = [(UITextContentViewAccessibility *)self accessibilityTraits];
  if ((v2 & *MEMORY[0x263F81398]) != 0)
  {
    id v10 = (id)[(UITextContentViewAccessibility *)v14 safeValueForKey:@"m_webView"];
    id v9 = (id)[v10 safeValueForKey:@"caretRect"];
    [v9 rectValue];

    UIAccessibilityFrameForBounds();
    v12.origin.x = v3;
    v12.origin.y = v4;
    v12.size.width = v5;
    v12.size.height = v6;
    CGRectGetMidX(v12);
    CGRectGetMidY(v12);
    CGPointMake_8();
  }
  else
  {
    v11.receiver = v14;
    v11.super_class = (Class)UITextContentViewAccessibility;
    [(UITextContentViewAccessibility *)&v11 accessibilityActivationPoint];
  }
  result.y = v8;
  result.x = v7;
  return result;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  NSUInteger v2 = [(UITextContentViewAccessibility *)self selectedRange];
  result.NSUInteger length = v3;
  result.id location = v2;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  _NSRange v5 = a3;
  CGFloat v4 = self;
  location[1] = (id)a2;
  location[0] = [(UITextContentViewAccessibility *)self accessibilityValue];
  if (!location[0])
  {
    location[0] = (id)[(UITextContentViewAccessibility *)v4 accessibilityLabel];
  }
  if (v5.length || (v6 = v5.location, uint64_t v7 = 0, v5.location > [location[0] length]))
  {
    if (v5.length) {
      [v4 _accessibilitySetTextSelection:v5.length];
    }
  }
  else
  {
    -[UITextContentViewAccessibility setSelectedRange:](v4, "setSelectedRange:", v5.location, v5.length);
  }
  objc_storeStrong(location, 0);
}

- (BOOL)keyboardInput:(id)a3 shouldReplaceTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  _NSRange v13 = a4;
  CGRect v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a5);
  char v9 = 0;
  v8.receiver = v12;
  v8.super_class = (Class)UITextContentViewAccessibility;
  char v9 = -[UITextContentViewAccessibility keyboardInput:shouldReplaceTextInRange:replacementText:](&v8, sel_keyboardInput_shouldReplaceTextInRange_replacementText_, location[0], v13.location, v13.length, v10);
  if (!v9) {
    UIAccessibilityPostNotification(*MEMORY[0x263F812C8], 0);
  }
  char v6 = v9;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  double v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  BOOL v11 = a5;
  char v10 = 0;
  v9.receiver = v14;
  v9.super_class = (Class)UITextContentViewAccessibility;
  char v10 = [(UITextContentViewAccessibility *)&v9 keyboardInput:location[0] shouldInsertText:v12 isMarkedText:a5];
  if ((v10 & 1) == 0) {
    UIAccessibilityPostNotification(*MEMORY[0x263F812C8], 0);
  }
  char v6 = v10;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (id)_accessibilityCapturedImages
{
  return 0;
}

@end