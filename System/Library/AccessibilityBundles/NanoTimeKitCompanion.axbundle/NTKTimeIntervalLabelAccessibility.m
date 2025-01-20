@interface NTKTimeIntervalLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation NTKTimeIntervalLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKTimeIntervalLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v3 = [(NTKTimeIntervalLabelAccessibility *)self safeValueForKey:@"_label"];
  v4 = [v3 accessibilityLabel];

  if ([v4 length])
  {
    id v5 = [objc_alloc((Class)AXAttributedString) initWithString:v4];
    [v5 setAttribute:&__kCFBooleanTrue forKey:UIAccessibilityTokenDurationTimeHHMMSS];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKTimeIntervalLabelAccessibility;
    id v5 = [(NTKTimeIntervalLabelAccessibility *)&v7 accessibilityLabel];
  }

  return v5;
}

@end