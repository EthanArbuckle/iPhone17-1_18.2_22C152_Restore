@interface _TVRatingViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_isAccessibilityExplorerElement;
- (BOOL)isAccessibilityElement;
- (_NSRange)accessibilityRowRange;
- (id)accessibilityHint;
- (id)accessibilityLabel;
@end

@implementation _TVRatingViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVRatingViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v9.receiver = self;
  v9.super_class = (Class)_TVRatingViewCellAccessibility;
  v3 = (char *)[(_TVRatingViewCellAccessibility *)&v9 accessibilityRowRange] + 1;
  if ((unint64_t)v3 > 0x7FFFFFFFFFFFFFFELL)
  {
    v8.receiver = self;
    v8.super_class = (Class)_TVRatingViewCellAccessibility;
    v6 = [(_TVRatingViewCellAccessibility *)&v8 accessibilityLabel];
  }
  else
  {
    v4 = NSString;
    v5 = accessibilityLocalizedString(@"star.rating");
    v6 = objc_msgSend(v4, "stringWithFormat:", v5, v3);
  }

  return v6;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"star.rating.hint");
}

- (BOOL)_isAccessibilityExplorerElement
{
  return 0;
}

- (_NSRange)accessibilityRowRange
{
  NSUInteger v2 = 0x7FFFFFFFLL;
  NSUInteger v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

@end