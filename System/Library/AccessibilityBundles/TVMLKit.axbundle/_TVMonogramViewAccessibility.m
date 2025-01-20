@interface _TVMonogramViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityPath;
@end

@implementation _TVMonogramViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVMonogramView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVMonogramView", @"imageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVMonogramView", @"configuration", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVMonogramView", @"monogramDescription", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TVMonogramViewConfiguration", @"focusedSizeIncrease", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVMonogramDescription", @"cornerRadius", "d", 0);
}

- (id)accessibilityPath
{
  objc_opt_class();
  id v3 = [(_TVMonogramViewAccessibility *)self safeValueForKey:@"imageView"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 _accessibilityCirclePathBasedOnBoundsWidth];

  return v5;
}

@end