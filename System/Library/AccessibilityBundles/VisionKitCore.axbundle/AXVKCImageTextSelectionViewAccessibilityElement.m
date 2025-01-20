@interface AXVKCImageTextSelectionViewAccessibilityElement
- (AXVKCImageTextSelectionViewAccessibilityElement)initWithAccessibilityContainer:(id)a3 textRange:(_NSRange)a4;
- (CGRect)accessibilityFrame;
- (NSString)_accessibilityContent;
- (_NSRange)_accessibilitySelectedTextRange;
- (_NSRange)textRange;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)set_accessibilityContent:(id)a3;
@end

@implementation AXVKCImageTextSelectionViewAccessibilityElement

- (AXVKCImageTextSelectionViewAccessibilityElement)initWithAccessibilityContainer:(id)a3 textRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AXVKCImageTextSelectionViewAccessibilityElement;
  v8 = [(AXVKCImageTextSelectionViewAccessibilityElement *)&v15 initWithAccessibilityContainer:v7];
  v9 = v8;
  if (v8)
  {
    v8->_textRange.NSUInteger location = location;
    v8->_textRange.NSUInteger length = length;
    v14.receiver = v8;
    v14.super_class = (Class)AXVKCImageTextSelectionViewAccessibilityElement;
    unint64_t v10 = *MEMORY[0x263F1CF48] | (unint64_t)[(AXVKCImageTextSelectionViewAccessibilityElement *)&v14 accessibilityTraits];
    int v11 = [v7 safeBoolForKey:@"selectable"];
    uint64_t v12 = *MEMORY[0x263F21B60];
    if (!v11) {
      uint64_t v12 = 0;
    }
    [(AXVKCImageTextSelectionViewAccessibilityElement *)v9 setAccessibilityTraits:v10 | v12];
  }

  return v9;
}

- (CGRect)accessibilityFrame
{
  char v20 = 0;
  objc_opt_class();
  v3 = [(AXVKCImageTextSelectionViewAccessibilityElement *)self accessibilityContainer];
  v4 = __UIAccessibilityCastAsSafeCategory();

  if (v4)
  {
    uint64_t v5 = [(AXVKCImageTextSelectionViewAccessibilityElement *)self textRange];
    objc_msgSend(v4, "_accessibilityBoundsForRange:", v5, v6);
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)AXVKCImageTextSelectionViewAccessibilityElement;
    [(AXVKCImageTextSelectionViewAccessibilityElement *)&v19 accessibilityFrame];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  v3 = [(AXVKCImageTextSelectionViewAccessibilityElement *)self accessibilityContainer];
  unint64_t v4 = [v3 _accessibilitySelectedTextRange];
  NSUInteger v6 = v5;
  if (([v3 safeBoolForKey:@"isEditable"] & 1) == 0)
  {
    double v7 = [v3 safeStringForKey:@"text"];
    BOOL v8 = v4 == [v7 length];

    if (v8) {
      unint64_t v4 = 0;
    }
  }
  NSUInteger location = self->_textRange.location;
  id v10 = (id)(v4 - location);
  if (v4 < location || v4 > self->_textRange.length + location)
  {
    v14.receiver = self;
    v14.super_class = (Class)AXVKCImageTextSelectionViewAccessibilityElement;
    id v10 = [(AXVKCImageTextSelectionViewAccessibilityElement *)&v14 _accessibilitySelectedTextRange];
    NSUInteger v6 = v11;
  }

  NSUInteger v12 = (NSUInteger)v10;
  NSUInteger v13 = v6;
  result.NSUInteger length = v13;
  result.NSUInteger location = v12;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger v4 = self->_textRange.location + a3.location;
  id v5 = [(AXVKCImageTextSelectionViewAccessibilityElement *)self accessibilityContainer];
  objc_msgSend(v5, "_accessibilitySetSelectedTextRange:", v4, length);
}

- (_NSRange)textRange
{
  p_textRange = &self->_textRange;
  NSUInteger location = self->_textRange.location;
  NSUInteger length = p_textRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSString)_accessibilityContent
{
  return self->__accessibilityContent;
}

- (void)set_accessibilityContent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end