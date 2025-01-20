@interface UIAccessibilityTextLineElement
- (_NSRange)_accessibilitySelectedTextRange;
- (id)accessibilityHint;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
@end

@implementation UIAccessibilityTextLineElement

- (id)accessibilityValue
{
  v7 = self;
  location[1] = (id)a2;
  id v5 = (id)[(UIAccessibilityTextLineElement *)self accessibilityContainer];
  location[0] = (id)[v5 _accessibilityAXAttributedValue];

  NSUInteger length = v7->_range.length;
  NSUInteger v9 = v7->_range.location;
  NSUInteger v10 = length;
  if (v9 + length > [location[0] length]) {
    id v8 = 0;
  }
  else {
    id v8 = (id)objc_msgSend(location[0], "substringWithRange:", v7->_range.location, v7->_range.length);
  }
  objc_storeStrong(location, 0);
  v3 = v8;

  return v3;
}

- (unint64_t)accessibilityTraits
{
  id v3 = (id)[(UIAccessibilityTextLineElement *)self accessibilityContainer];
  unint64_t v4 = [v3 accessibilityTraits];

  return v4;
}

- (id)accessibilityHint
{
  id v3 = (id)[(UIAccessibilityTextLineElement *)self accessibilityContainer];
  id v4 = (id)[v3 _accessibilityAXAttributedHint];

  return v4;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  id v5 = (id)[(UIAccessibilityTextLineElement *)self accessibilityContainer];
  uint64_t v6 = [v5 _accessibilitySelectedTextRange];
  NSUInteger v7 = v2;

  NSUInteger v3 = v6;
  NSUInteger v4 = v7;
  result.NSUInteger length = v4;
  result.location = v3;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  _NSRange range = self->_range;
  if ((uint64_t)a3.location <= (uint64_t)range.length) {
    range.location += a3.location;
  }
  id v3 = (id)[(UIAccessibilityTextLineElement *)self accessibilityContainer];
  [v3 _accessibilitySetSelectedTextRange:range];
}

@end