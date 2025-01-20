@interface ComposePlaceholderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityValue;
@end

@implementation ComposePlaceholderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ComposePlaceholderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ComposePlaceholderView", @"subjectField", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeSubjectView", @"text", "@", 0);
}

- (id)accessibilityValue
{
  v2 = [(ComposePlaceholderViewAccessibility *)self safeValueForKey:@"subjectField"];
  id v3 = [v2 safeStringForKey:@"text"];

  return v3;
}

@end