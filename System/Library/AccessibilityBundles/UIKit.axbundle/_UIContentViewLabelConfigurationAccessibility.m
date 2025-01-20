@interface _UIContentViewLabelConfigurationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation _UIContentViewLabelConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIContentViewLabelConfiguration";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIContentViewLabelConfiguration", @"text", "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)accessibilityLabel
{
  return (id)[(_UIContentViewLabelConfigurationAccessibility *)self safeStringForKey:@"text", a2, self];
}

@end