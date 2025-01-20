@interface _UIMorphingPlatterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation _UIMorphingPlatterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIMorphingPlatterView";
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIMorphingPlatterView", @"expandedTransformView", "@", 0);
  objc_storeStrong(v4, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)_UIMorphingPlatterViewAccessibility;
  [(_UIMorphingPlatterViewAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  char v5 = 0;
  objc_opt_class();
  id v2 = (id)[(_UIMorphingPlatterViewAccessibility *)v8 safeValueForKey:@"expandedTransformView"];
  id v4 = (id)__UIAccessibilityCastAsSafeCategory();

  id v3 = v4;
  objc_storeStrong(&v4, 0);
  -[_UIPlatterTransformViewAccessibility _accessibilitySetIsExpandedTransformView:]((uint64_t)v3);
}

@end