@interface MailStatusLabelViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation MailStatusLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MailStatusLabelView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailStatusLabelView", @"primaryLabelText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailStatusLabelView", @"secondaryLabelText", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(MailStatusLabelViewAccessibility *)self safeValueForKey:@"primaryLabelText"];
  v6 = [(MailStatusLabelViewAccessibility *)self safeValueForKey:@"secondaryLabelText"];
  v4 = __UIAXStringForVariables();

  return v4;
}

@end