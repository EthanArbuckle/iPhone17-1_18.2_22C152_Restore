@interface CKMessageEntryViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
@end

@implementation CKMessageEntryViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKMessageEntryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  objc_opt_class();
  v3 = [(CKMessageEntryViewInvertColorsAccessibility *)self safeValueForKey:@"collpasedPlaceholderLabel"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 setAccessibilityIgnoresInvertColors:1];
  if (UIAccessibilityIsInvertColorsEnabled())
  {
    v5 = +[UIColor whiteColor];
    [v4 setTextColor:v5];
  }
  else
  {
    [v4 setTextColor:0];
  }
}

@end