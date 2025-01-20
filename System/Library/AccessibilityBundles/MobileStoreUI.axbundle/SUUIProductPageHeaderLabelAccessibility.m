@interface SUUIProductPageHeaderLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SUUIProductPageHeaderLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIProductPageHeaderLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIProductPageHeaderLabel", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIProductPageHeaderLabel", @"contentRating", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(SUUIProductPageHeaderLabelAccessibility *)self safeValueForKey:@"text"];
  v4 = [(SUUIProductPageHeaderLabelAccessibility *)self safeValueForKey:@"contentRating"];
  if (v4)
  {
    v5 = v4;
    v6 = [v4 stringByReplacingOccurrencesOfString:@"+" withString:&stru_26F7296D0];

    v7 = NSString;
    v8 = accessibilityLocalizedString(@"app.rating.label");
    objc_msgSend(v7, "stringWithFormat:", v8, v6);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_26F7296D0;
  }
  v10 = __UIAXStringForVariables();

  return v10;
}

@end