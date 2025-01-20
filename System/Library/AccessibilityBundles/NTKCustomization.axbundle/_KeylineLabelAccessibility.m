@interface _KeylineLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (_KeylineLabelAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation _KeylineLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_KeylineLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3 = [(_KeylineLabelAccessibility *)self safeValueForKey:@"_label"];
  [v3 setIsAccessibilityElement:0];

  v4.receiver = self;
  v4.super_class = (Class)_KeylineLabelAccessibility;
  [(_KeylineLabelAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
}

- (_KeylineLabelAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_KeylineLabelAccessibility;
  v3 = -[_KeylineLabelAccessibility initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_KeylineLabelAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  return v3;
}

@end