@interface SUUIGiftTextTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3;
- (_NSRange)_accessibilitySelectedTextRange;
- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3;
- (id)_accessibilityTextViewTextOperationResponder;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
@end

@implementation SUUIGiftTextTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIGiftTextTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SUUIGiftTextTableViewCell" hasInstanceVariable:@"_textView" withType:"UITextView"];
  [v3 validateClass:@"SUUIGiftTextTableViewCell" hasInstanceVariable:@"_placeholderLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(SUUIGiftTextTableViewCellAccessibility *)self safeValueForKey:@"label"];
}

- (id)accessibilityValue
{
  id v3 = [(SUUIGiftTextTableViewCellAccessibility *)self safeValueForKey:@"_placeholderLabel"];
  char v4 = [v3 isHidden];

  if (v4)
  {
    v5 = [(SUUIGiftTextTableViewCellAccessibility *)self _accessibilityTextViewTextOperationResponder];
    [v5 accessibilityValue];
  }
  else
  {
    v5 = [(SUUIGiftTextTableViewCellAccessibility *)self safeValueForKey:@"_placeholderLabel"];
    [v5 accessibilityLabel];
  v6 = };

  return v6;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(SUUIGiftTextTableViewCellAccessibility *)self _accessibilityTextViewTextOperationResponder];
  objc_msgSend(v5, "_accessibilitySetSelectedTextRange:", location, length);
}

- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(SUUIGiftTextTableViewCellAccessibility *)self _accessibilityTextViewTextOperationResponder];
  v6 = objc_msgSend(v5, "_accessibilityLineNumberAndColumnForPoint:", x, y);

  return v6;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  v2 = [(SUUIGiftTextTableViewCellAccessibility *)self _accessibilityTextViewTextOperationResponder];
  uint64_t v3 = [v2 _accessibilitySelectedTextRange];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(SUUIGiftTextTableViewCellAccessibility *)self _accessibilityTextViewTextOperationResponder];
  uint64_t v6 = [v5 _accessibilityRangeForLineNumberAndColumn:v4];
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  return (id)[(SUUIGiftTextTableViewCellAccessibility *)self safeValueForKey:@"_textView"];
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3 = [(SUUIGiftTextTableViewCellAccessibility *)self safeValueForKey:@"_placeholderLabel"];
  int v4 = [v3 isHidden];

  if (!v4) {
    return 0;
  }
  NSUInteger v5 = [(SUUIGiftTextTableViewCellAccessibility *)self _accessibilityTextViewTextOperationResponder];
  unint64_t v6 = [v5 accessibilityTraits];

  return v6;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(SUUIGiftTextTableViewCellAccessibility *)self _accessibilityTextViewTextOperationResponder];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

@end