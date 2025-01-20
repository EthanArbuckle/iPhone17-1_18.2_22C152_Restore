@interface TextViewLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsHandwriting;
- (BOOL)isAccessibilityElement;
- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3;
- (_NSRange)_accessibilitySelectedTextRange;
- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3;
- (id)_accessibilityTextViewTextOperationResponder;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
@end

@implementation TextViewLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.TextViewLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  uint64_t v3 = objc_opt_class();

  return (id)[(TextViewLabelAccessibility *)self _accessibilityDescendantOfType:v3];
}

- (id)accessibilityLabel
{
  return 0;
}

- (id)accessibilityValue
{
  v2 = [(TextViewLabelAccessibility *)self _accessibilityTextViewTextOperationResponder];
  uint64_t v3 = [v2 accessibilityValue];

  return v3;
}

- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = [(TextViewLabelAccessibility *)self _accessibilityTextViewTextOperationResponder];
  v6 = objc_msgSend(v5, "_accessibilityLineNumberAndColumnForPoint:", x, y);

  return v6;
}

- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3
{
  id v4 = a3;
  v5 = [(TextViewLabelAccessibility *)self _accessibilityTextViewTextOperationResponder];
  uint64_t v6 = [v5 _accessibilityRangeForLineNumberAndColumn:v4];
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(TextViewLabelAccessibility *)self _accessibilityTextViewTextOperationResponder];
  objc_msgSend(v5, "_accessibilitySetSelectedTextRange:", location, length);
}

- (_NSRange)_accessibilitySelectedTextRange
{
  v2 = [(TextViewLabelAccessibility *)self _accessibilityTextViewTextOperationResponder];
  uint64_t v3 = [v2 _accessibilitySelectedTextRange];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(TextViewLabelAccessibility *)self _accessibilityTextViewTextOperationResponder];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (BOOL)_accessibilitySupportsHandwriting
{
  unint64_t v3 = [(TextViewLabelAccessibility *)self accessibilityTraits];
  if ((*MEMORY[0x263F81398] & ~v3) == 0) {
    return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)TextViewLabelAccessibility;
  return [(TextViewLabelAccessibility *)&v5 _accessibilitySupportsHandwriting];
}

- (unint64_t)_accessibilityAutomationType
{
  return 52;
}

@end