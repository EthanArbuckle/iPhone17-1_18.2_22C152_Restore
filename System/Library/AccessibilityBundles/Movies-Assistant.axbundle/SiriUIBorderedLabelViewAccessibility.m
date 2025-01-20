@interface SiriUIBorderedLabelViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SiriUIBorderedLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriUIBorderedLabelView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v2 = [(SiriUIBorderedLabelViewAccessibility *)self safeValueForKey:@"_ratingLabel"];
  v3 = [v2 accessibilityLabel];

  if ([v3 length])
  {
    v4 = NSString;
    v5 = accessibilityLocalizedString(@"movie.rating");
    v6 = objc_msgSend(v4, "stringWithFormat:", v5, v3);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end