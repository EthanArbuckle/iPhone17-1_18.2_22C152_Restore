@interface SUICStreamingTextViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation SUICStreamingTextViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUICStreamingTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  objc_opt_class();
  v3 = [(SUICStreamingTextViewInvertColorsAccessibility *)self safeValueForKey:@"_endTextColor"];
  v4 = __UIAccessibilityCastAsClass();

  AXColorGetLuma();
  BOOL v6 = v5 > 0.5;

  return v6;
}

@end