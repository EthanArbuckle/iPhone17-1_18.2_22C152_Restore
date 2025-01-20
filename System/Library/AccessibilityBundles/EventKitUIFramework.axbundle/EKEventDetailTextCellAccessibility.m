@interface EKEventDetailTextCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3;
- (CGRect)_accessibilityChargedLineBoundsForRange:(_NSRange)a3;
- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3;
- (id)_accessibilityDataDetectorScheme:(CGPoint)a3;
- (id)_accessibilityInternalTextLinks;
- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
@end

@implementation EKEventDetailTextCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKEventDetailTextCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"EKEventDetailTextCell" hasInstanceVariable:@"_textView" withType:"UITextView"];
  [v3 validateClass:@"EKEventDetailTextCell" hasInstanceVariable:@"_title" withType:"NSString"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)_accessibilityAutomationType
{
  return 52;
}

- (id)accessibilityLabel
{
  return (id)[(EKEventDetailTextCellAccessibility *)self safeStringForKey:@"_title"];
}

- (id)accessibilityValue
{
  v2 = [(EKEventDetailTextCellAccessibility *)self safeValueForKey:@"_textView"];
  id v3 = [v2 accessibilityValue];

  return v3;
}

- (id)_accessibilityDataDetectorScheme:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(EKEventDetailTextCellAccessibility *)self safeValueForKey:@"_textView"];
  -[EKEventDetailTextCellAccessibility convertPoint:toView:](self, "convertPoint:toView:", v6, x, y);
  double v8 = v7;
  double v10 = v9;

  v11 = [(EKEventDetailTextCellAccessibility *)self safeValueForKey:@"_textView"];
  v12 = objc_msgSend(v11, "_accessibilityDataDetectorScheme:", v8, v10);

  return v12;
}

- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = [(EKEventDetailTextCellAccessibility *)self safeValueForKey:@"_textView"];
  v6 = objc_msgSend(v5, "_accessibilityLineNumberAndColumnForPoint:", x, y);

  return v6;
}

- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3
{
  id v4 = a3;
  v5 = [(EKEventDetailTextCellAccessibility *)self safeValueForKey:@"_textView"];
  uint64_t v6 = [v5 _accessibilityRangeForLineNumberAndColumn:v4];
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (CGRect)_accessibilityChargedLineBoundsForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v5 = [(EKEventDetailTextCellAccessibility *)self safeValueForKey:@"_textView"];
  objc_msgSend(v5, "_accessibilityChargedLineBoundsForRange:", location, length);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v5 = [(EKEventDetailTextCellAccessibility *)self safeValueForKey:@"_textView"];
  objc_msgSend(v5, "_accessibilityBoundsForRange:", location, length);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (id)_accessibilityInternalTextLinks
{
  v2 = [(EKEventDetailTextCellAccessibility *)self safeValueForKey:@"_textView"];
  id v3 = [v2 _accessibilityInternalTextLinks];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F21B60];
}

@end