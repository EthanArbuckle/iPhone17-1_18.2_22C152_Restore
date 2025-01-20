@interface ACSportsSiriUIContentLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)accessibilityFrame;
@end

@implementation ACSportsSiriUIContentLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriUIContentLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (CGRect)accessibilityFrame
{
  v17.receiver = self;
  v17.super_class = (Class)ACSportsSiriUIContentLabelAccessibility;
  [(ACSportsSiriUIContentLabelAccessibility *)&v17 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(ACSportsSiriUIContentLabelAccessibility *)self _accessibilityValueForKey:@"AXIsSportsPeriodVenueLabel"];
  int v12 = [v11 BOOLValue];

  if (v12) {
    double v13 = v10 + -20.0;
  }
  else {
    double v13 = v10;
  }
  if (v12) {
    double v14 = v6 + 10.0;
  }
  else {
    double v14 = v6;
  }
  double v15 = v4;
  double v16 = v8;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v15;
  return result;
}

@end