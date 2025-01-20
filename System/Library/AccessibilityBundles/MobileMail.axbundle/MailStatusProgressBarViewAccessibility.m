@interface MailStatusProgressBarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation MailStatusProgressBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MailStatusProgressBarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailStatusLabelView", @"primaryLabelText", "@", 0);
  [v3 validateClass:@"MailStatusProgressBarView" isKindOfClass:@"MailStatusLabelView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MailStatusProgressBarView", @"toolbarView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFProgressToolbar", @"progressView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIProgressView", @"progress", "f", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(MailStatusProgressBarViewAccessibility *)self safeValueForKey:@"toolbarView"];
  v4 = [v3 safeValueForKey:@"progressView"];
  [v4 safeFloatForKey:@"progress"];

  v5 = [(MailStatusProgressBarViewAccessibility *)self safeValueForKey:@"primaryLabelText"];
  id v6 = (id)AXFormatFloatWithPercentage();
  if (v5)
  {
    v9 = AXFormatFloatWithPercentage();
    v7 = __UIAXStringForVariables();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end