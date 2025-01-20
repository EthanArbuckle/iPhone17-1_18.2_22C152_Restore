@interface _UIDatePickerLinkedLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityElementsHidden;
- (id)accessibilityLabel;
@end

@implementation _UIDatePickerLinkedLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIDatePickerLinkedLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"_UIDatePickerLinkedLabel" hasInstanceVariable:@"_renderingLabel" withType:"UILabel"];
  objc_storeStrong(location, 0);
}

- (id)accessibilityLabel
{
  id v3 = (id)[(_UIDatePickerLinkedLabelAccessibility *)self safeUIViewForKey:@"_renderingLabel"];
  id v4 = (id)[v3 accessibilityLabel];

  return v4;
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

@end