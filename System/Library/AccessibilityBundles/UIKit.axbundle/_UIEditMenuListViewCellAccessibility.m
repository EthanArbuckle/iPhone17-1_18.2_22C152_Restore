@interface _UIEditMenuListViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIEditMenuListViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIEditMenuListViewCell";
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
  objc_msgSend(location[0], "validateClass:hasProperty:withType:");
  [location[0] validateClass:@"_UIEditMenuListViewCell" hasProperty:@"titleLabel" withType:"@"];
  [location[0] validateClass:@"_UIEditMenuListViewCell" hasProperty:@"imageView" withType:"@"];
  objc_storeStrong(location, 0);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F813B0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v7 = self;
  location[1] = (id)a2;
  id v5 = (id)[(_UIEditMenuListViewCellAccessibility *)self safeValueForKey:@"titleLabel"];
  location[0] = (id)[v5 accessibilityLabel];

  if ([location[0] length])
  {
    id v8 = location[0];
  }
  else
  {
    id v4 = (id)[(_UIEditMenuListViewCellAccessibility *)v7 safeValueForKey:@"imageView"];
    id v8 = (id)[v4 accessibilityLabel];
  }
  objc_storeStrong(location, 0);
  v2 = v8;

  return v2;
}

- (id)automationElements
{
  v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = (id)[(_UIEditMenuListViewCellAccessibility *)self safeValueForKey:@"contentStackView"];
  id v5 = (id)objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 1, v4);

  return v5;
}

@end