@interface TextComponentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation TextComponentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CoreDynamicUIPlugin.TextComponent";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(TextComponentAccessibility *)self safeSwiftValueForKey:@"label"];
  v3 = __UIAXStringForVariables();

  return v3;
}

@end