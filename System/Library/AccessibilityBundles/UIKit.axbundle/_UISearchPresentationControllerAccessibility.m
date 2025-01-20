@interface _UISearchPresentationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityPresentationControllerModalizes;
@end

@implementation _UISearchPresentationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UISearchPresentationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"UIPresentationController";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"_UISearchPresentationController");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIPresentationController", @"_accessibilityPresentationControllerModalizes", "B", 0);
  objc_storeStrong(v5, obj);
}

- (BOOL)_accessibilityPresentationControllerModalizes
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UISearchPresentationControllerAccessibility;
  return [(_UISearchPresentationControllerAccessibility *)&v3 _accessibilityPresentationControllerModalizes];
}

@end