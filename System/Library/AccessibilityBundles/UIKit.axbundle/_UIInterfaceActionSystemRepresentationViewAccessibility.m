@interface _UIInterfaceActionSystemRepresentationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIInterfaceActionSystemRepresentationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIInterfaceActionSystemRepresentationView";
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
  [location[0] validateClass:@"_UIInterfaceActionSystemRepresentationView" hasInstanceVariable:@"_labelsView" withType:"_UIInterfaceActionLabelsPropertyView"];
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:@"_UIInterfaceActionLabelsPropertyView" hasInstanceVariable:@"_classificationLabel" withType:"UILabel"];
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  v10 = self;
  v9[1] = (id)a2;
  id v6 = (id)-[_UIInterfaceActionSystemRepresentationViewAccessibility safeValueForKey:](self, "safeValueForKey:");
  v9[0] = (id)[v6 safeValueForKey:@"_titleLabel"];

  id v7 = (id)[(_UIInterfaceActionSystemRepresentationViewAccessibility *)v10 safeValueForKey:@"_labelsView"];
  id location = (id)[v7 safeValueForKey:@"_classificationLabel"];

  if (([location _accessibilityViewIsVisible] & 1) == 0) {
    objc_storeStrong(&location, 0);
  }
  id v4 = (id)[v9[0] accessibilityLabel];
  id v3 = (id)[location accessibilityLabel];
  id v5 = (id)__UIAXStringForVariables();

  objc_storeStrong(&location, 0);
  objc_storeStrong(v9, 0);

  return v5;
}

@end