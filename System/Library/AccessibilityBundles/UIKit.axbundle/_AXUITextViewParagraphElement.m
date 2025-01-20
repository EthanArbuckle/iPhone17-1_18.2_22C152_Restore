@interface _AXUITextViewParagraphElement
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityRespondsToUserInteraction;
- (CGPoint)accessibilityActivationPoint:(id)a3;
- (CGRect)accessibilityFrame;
- (_NSRange)_accessibilitySelectedTextRange;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityElements;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityLanguage;
- (id)accessibilityValue;
- (id)automationElements;
- (id)initWithAccessibilityContainer:(uint64_t)a3 textRange:(uint64_t)a4 links:(void *)a5;
- (uint64_t)_accessibilityContent;
- (uint64_t)links;
- (uint64_t)textRange;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)setAccessibilityRespondsToUserInteraction:(BOOL)a3;
- (void)setLinks:(uint64_t)a1;
- (void)set_accessibilityContent:(uint64_t)a1;
@end

@implementation _AXUITextViewParagraphElement

- (uint64_t)links
{
  if (a1) {
    return *(void *)(a1 + 72);
  }
  else {
    return 0;
  }
}

- (id)initWithAccessibilityContainer:(uint64_t)a3 textRange:(uint64_t)a4 links:(void *)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  *(void *)&long long v41 = a3;
  *((void *)&v41 + 1) = a4;
  id v40 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v38 = 0;
  objc_storeStrong(&v38, a5);
  if (v40)
  {
    id v5 = v40;
    id v40 = 0;
    v36.receiver = v5;
    v36.super_class = (Class)_AXUITextViewParagraphElement;
    id v40 = objc_msgSendSuper2(&v36, sel_initWithAccessibilityContainer_, location);
    objc_storeStrong(&v40, v40);
    if (v40)
    {
      *((_OWORD *)v40 + 5) = v41;
      objc_storeStrong((id *)v40 + 9, v38);
      memset(__b, 0, sizeof(__b));
      id v13 = v38;
      uint64_t v14 = [v13 countByEnumeratingWithState:__b objects:v43 count:16];
      if (v14)
      {
        uint64_t v10 = *(void *)__b[2];
        uint64_t v11 = 0;
        unint64_t v12 = v14;
        while (1)
        {
          uint64_t v9 = v11;
          if (*(void *)__b[2] != v10) {
            objc_enumerationMutation(v13);
          }
          id v35 = *(id *)(__b[1] + 8 * v11);
          [v35 setAccessibilityContainer:v40];
          objc_initWeak(&v33, v35);
          objc_initWeak(&from, location);
          id v8 = v35;
          uint64_t v25 = MEMORY[0x263EF8330];
          int v26 = -1073741824;
          int v27 = 0;
          v28 = __80___AXUITextViewParagraphElement_initWithAccessibilityContainer_textRange_links___block_invoke;
          v29 = &unk_2650AF6C8;
          objc_copyWeak(&v30, &from);
          objc_copyWeak(&v31, &v33);
          [v8 _setAccessibilityFrameBlock:&v25];
          id v7 = v35;
          uint64_t v18 = MEMORY[0x263EF8330];
          int v19 = -1073741824;
          int v20 = 0;
          v21 = __80___AXUITextViewParagraphElement_initWithAccessibilityContainer_textRange_links___block_invoke_2;
          v22 = &unk_2650AF628;
          objc_copyWeak(&v23, &from);
          objc_copyWeak(&v24, &v33);
          [v7 _setAccessibilityActivateBlock:&v18];
          objc_destroyWeak(&v24);
          objc_destroyWeak(&v23);
          objc_destroyWeak(&v31);
          objc_destroyWeak(&v30);
          objc_destroyWeak(&from);
          objc_destroyWeak(&v33);
          ++v11;
          if (v9 + 1 >= v12)
          {
            uint64_t v11 = 0;
            unint64_t v12 = [v13 countByEnumeratingWithState:__b objects:v43 count:16];
            if (!v12) {
              break;
            }
          }
        }
      }

      unint64_t v17 = 0;
      v16.receiver = v40;
      v16.super_class = (Class)_AXUITextViewParagraphElement;
      unint64_t v17 = (unint64_t)objc_msgSendSuper2(&v16, sel_accessibilityTraits) | *MEMORY[0x263F1CF48];
      if ([location isSelectable]) {
        v17 |= *MEMORY[0x263F21B60];
      }
      [v40 setAccessibilityTraits:v17];
    }
    id v42 = v40;
    int v37 = 1;
  }
  else
  {
    id v42 = 0;
    int v37 = 1;
  }
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v40, 0);
  return v42;
}

- (void)setLinks:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (void)set_accessibilityContent:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (id)accessibilityLabel
{
  v6 = self;
  SEL v5 = a2;
  if (AXDoesRequestingClientDeserveAutomation())
  {
    id v7 = (id)-[_AXUITextViewParagraphElement _accessibilityContent]((uint64_t)v6);
  }
  else
  {
    v4.receiver = v6;
    v4.super_class = (Class)_AXUITextViewParagraphElement;
    id v7 = [(_AXUITextViewParagraphElement *)&v4 accessibilityLabel];
  }
  v2 = v7;

  return v2;
}

- (uint64_t)_accessibilityContent
{
  if (a1) {
    return *(void *)(a1 + 56);
  }
  else {
    return 0;
  }
}

- (id)accessibilityValue
{
  if (AXDoesRequestingClientDeserveAutomation()) {
    id v4 = 0;
  }
  else {
    id v4 = (id)-[_AXUITextViewParagraphElement _accessibilityContent]((uint64_t)self);
  }

  return v4;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  uint64_t v18 = self;
  v17[1] = (id)a2;
  char v16 = 0;
  id v9 = (id)[(_AXUITextViewParagraphElement *)self accessibilityContainer];
  id v15 = (id)__UIAccessibilitySafeClass();

  id v14 = v15;
  objc_storeStrong(&v15, 0);
  v17[0] = v14;
  unint64_t v12 = [v14 _accessibilitySelectedTextRange];
  NSUInteger v13 = v2;
  if (([v17[0] isEditable] & 1) == 0)
  {
    id v7 = (id)[v17[0] text];
    BOOL v8 = v12 != [v7 length];

    if (!v8) {
      unint64_t v12 = 0;
    }
  }
  if (v12 < v18->_textRange.location
    || (length = v18->_textRange.length, NSUInteger location = v18->_textRange.location, v22 = length, v12 > location + length))
  {
    v10.receiver = v18;
    v10.super_class = (Class)_AXUITextViewParagraphElement;
    id v19 = [(_AXUITextViewParagraphElement *)&v10 _accessibilitySelectedTextRange];
    NSUInteger v20 = v4;
    int v11 = 1;
  }
  else
  {
    id v24 = (void *)(v12 - v18->_textRange.location);
    NSUInteger v23 = v13;
    uint64_t v25 = v24;
    NSUInteger v26 = v13;
    id v19 = v24;
    NSUInteger v20 = v13;
    int v11 = 1;
  }
  objc_storeStrong(v17, 0);
  NSUInteger v5 = (NSUInteger)v19;
  NSUInteger v6 = v20;
  result.NSUInteger length = v6;
  result.NSUInteger location = v5;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  _NSRange v11 = a3;
  objc_super v10 = self;
  v9[1] = (id)a2;
  char v8 = 0;
  id v5 = (id)[(_AXUITextViewParagraphElement *)self accessibilityContainer];
  id v7 = (id)__UIAccessibilitySafeClass();

  id v6 = v7;
  objc_storeStrong(&v7, 0);
  v9[0] = v6;
  [v6 _accessibilitySelectedTextRange];
  if (!v3) {
    [v9[0] select:v10];
  }
  v11.location += v10->_textRange.location;
  id v4 = (id)[(_AXUITextViewParagraphElement *)v10 accessibilityContainer];
  objc_msgSend(v4, "_accessibilitySetSelectedTextRange:", v11.location, v11.length);

  objc_storeStrong(v9, 0);
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  if (self->__accessibilityRespondsToUserInteractionOverride) {
    return [(NSNumber *)self->__accessibilityRespondsToUserInteractionOverride BOOLValue];
  }
  id v3 = (id)[MEMORY[0x263F22938] sharedInstance];
  BOOL v4 = 0;
  if ([v3 assistiveTouchScannerSpeechEnabled]) {
    BOOL v4 = AXRequestingClient() == 4;
  }
  BOOL v5 = v4;

  return v5;
}

- (void)setAccessibilityRespondsToUserInteraction:(BOOL)a3
{
  id v3 = (NSNumber *)(id)[NSNumber numberWithBool:a3];
  accessibilityRespondsToUserInteractionOverride = self->__accessibilityRespondsToUserInteractionOverride;
  self->__accessibilityRespondsToUserInteractionOverride = v3;
}

- (CGPoint)accessibilityActivationPoint:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] accessibilityFrame];
  AX_CGRectGetCenter();
  double v8 = v3;
  double v9 = v4;
  objc_storeStrong(location, 0);
  double v5 = v8;
  double v6 = v9;
  result.y = v6;
  result.x = v5;
  return result;
}

- (id)accessibilityHint
{
  double v8 = self;
  SEL v7 = a2;
  id v4 = (id)-[_AXUITextViewParagraphElement links]((uint64_t)self);
  BOOL v5 = [v4 count] != 1;

  if (v5)
  {
    v6.receiver = v8;
    v6.super_class = (Class)_AXUITextViewParagraphElement;
    id v9 = [(_AXUITextViewParagraphElement *)&v6 accessibilityHint];
  }
  else
  {
    id v9 = accessibilityLocalizedString(@"hint.activate.embedded.link");
  }
  NSUInteger v2 = v9;

  return v2;
}

- (id)automationElements
{
  return (id)-[_AXUITextViewParagraphElement links]((uint64_t)self);
}

- (id)accessibilityElements
{
  return (id)-[_AXUITextViewParagraphElement links]((uint64_t)self);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  CGPoint v23 = a3;
  NSUInteger v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if (!AXDoesRequestingClientDeserveAutomation()) {
    goto LABEL_12;
  }
  memset(__b, 0, sizeof(__b));
  id obj = (id)-[_AXUITextViewParagraphElement links]((uint64_t)v22);
  uint64_t v14 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
  if (v14)
  {
    uint64_t v10 = *(void *)__b[2];
    uint64_t v11 = 0;
    unint64_t v12 = v14;
    while (1)
    {
      uint64_t v9 = v11;
      if (*(void *)__b[2] != v10) {
        objc_enumerationMutation(obj);
      }
      id v20 = *(id *)(__b[1] + 8 * v11);
      id v8 = (id)[(_AXUITextViewParagraphElement *)v22 _accessibilityParentView];
      UIAccessibilityPointForPoint();
      point.x = v4;
      point.y = v5;

      [v20 accessibilityFrame];
      CGRect rect = v28;
      if (CGRectContainsPoint(v28, point)) {
        break;
      }
      ++v11;
      if (v9 + 1 >= v12)
      {
        uint64_t v11 = 0;
        unint64_t v12 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
        if (!v12) {
          goto LABEL_10;
        }
      }
    }
    id v24 = v20;
    int v16 = 1;
  }
  else
  {
LABEL_10:
    int v16 = 0;
  }

  if (!v16)
  {
LABEL_12:
    v15.receiver = v22;
    v15.super_class = (Class)_AXUITextViewParagraphElement;
    id v24 = -[_AXUITextViewParagraphElement _accessibilityHitTest:withEvent:](&v15, sel__accessibilityHitTest_withEvent_, location[0], v23.x, v23.y);
    int v16 = 1;
  }
  objc_storeStrong(location, 0);
  objc_super v6 = v24;

  return v6;
}

- (CGRect)accessibilityFrame
{
  v21 = self;
  v20[1] = (id)a2;
  char v19 = 0;
  objc_opt_class();
  id v12 = (id)[(_AXUITextViewParagraphElement *)v21 accessibilityContainer];
  id v18 = (id)__UIAccessibilityCastAsSafeCategory();

  id v17 = v18;
  objc_storeStrong(&v18, 0);
  v20[0] = v17;
  if (v17)
  {
    id v11 = v20[0];
    uint64_t v15 = -[_AXUITextViewParagraphElement textRange]((uint64_t)v21);
    uint64_t v16 = v2;
    objc_msgSend(v11, "_accessibilityBoundsForRange:", v15, v2);
  }
  else
  {
    v13.receiver = v21;
    v13.super_class = (Class)_AXUITextViewParagraphElement;
    [(_AXUITextViewParagraphElement *)&v13 accessibilityFrame];
  }
  double v22 = v3;
  double v23 = v4;
  double v24 = v5;
  double v25 = v6;
  int v14 = 1;
  objc_storeStrong(v20, 0);
  double v7 = v22;
  double v8 = v23;
  double v9 = v24;
  double v10 = v25;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (uint64_t)textRange
{
  if (a1) {
    return *(_OWORD *)(a1 + 80);
  }
  else {
    *(void *)&long long v2 = 0;
  }
  return v2;
}

- (BOOL)accessibilityActivate
{
  char v19 = self;
  v18[1] = (id)a2;
  char v17 = 0;
  objc_opt_class();
  id v10 = (id)[(_AXUITextViewParagraphElement *)v19 accessibilityContainer];
  id v16 = (id)__UIAccessibilityCastAsSafeCategory();

  id v15 = v16;
  objc_storeStrong(&v16, 0);
  v18[0] = v15;
  if (v15)
  {
    id v8 = (id)-[_AXUITextViewParagraphElement links]((uint64_t)v19);
    BOOL v9 = [v8 count] == 0;

    if (v9)
    {
      id v4 = v18[0];
      uint64_t v12 = -[_AXUITextViewParagraphElement textRange]((uint64_t)v19);
      uint64_t v13 = v2;
      char v20 = objc_msgSend(v4, "_accessibilityActivateParagraphInTextViewRange:", v12, v2) & 1;
    }
    else
    {
      id v5 = v18[0];
      id v7 = (id)-[_AXUITextViewParagraphElement links]((uint64_t)v19);
      id v6 = (id)[v7 firstObject];
      char v20 = -[UITextViewAccessibility _accessibilityActivateLink:](v5, v6) & 1;
    }
    int v14 = 1;
  }
  else
  {
    v11.receiver = v19;
    v11.super_class = (Class)_AXUITextViewParagraphElement;
    char v20 = [(_AXUITextViewParagraphElement *)&v11 accessibilityActivate];
    int v14 = 1;
  }
  objc_storeStrong(v18, 0);
  return v20 & 1;
}

- (unint64_t)accessibilityTraits
{
  BOOL v9 = self;
  SEL v8 = a2;
  unint64_t v7 = 0;
  v6.receiver = self;
  v6.super_class = (Class)_AXUITextViewParagraphElement;
  unint64_t v7 = [(_AXUITextViewParagraphElement *)&v6 accessibilityTraits];
  id location = (id)[(_AXUITextViewParagraphElement *)v9 accessibilityContainer];
  uint64_t v2 = [location accessibilityTraits];
  if ((v2 & *MEMORY[0x263F1CEF8]) != 0) {
    v7 |= *MEMORY[0x263F1CEF8];
  }
  unint64_t v4 = v7;
  objc_storeStrong(&location, 0);
  return v4;
}

- (id)accessibilityLanguage
{
  objc_super v11 = self;
  v10[1] = (id)a2;
  char v9 = 0;
  objc_opt_class();
  id v4 = (id)[(_AXUITextViewParagraphElement *)v11 accessibilityContainer];
  id v8 = (id)__UIAccessibilityCastAsSafeCategory();

  id v7 = v8;
  objc_storeStrong(&v8, 0);
  v10[0] = v7;
  if (v7)
  {
    id v12 = (id)[v10[0] accessibilityLanguage];
  }
  else
  {
    v5.receiver = v11;
    v5.super_class = (Class)_AXUITextViewParagraphElement;
    id v12 = [(_AXUITextViewParagraphElement *)&v5 accessibilityLanguage];
  }
  int v6 = 1;
  objc_storeStrong(v10, 0);
  uint64_t v2 = v12;

  return v2;
}

- (void).cxx_destruct
{
}

@end