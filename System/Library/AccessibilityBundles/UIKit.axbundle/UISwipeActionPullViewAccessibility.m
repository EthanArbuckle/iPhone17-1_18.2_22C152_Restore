@interface UISwipeActionPullViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOverridesInvalidFrames;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation UISwipeActionPullViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UISwipeActionPullView";
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
  v3 = @"UISwipeActionPullView";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  [location[0] validateClass:v3 hasInstanceVariable:@"_buttons" withType:"NSMutableArray"];
  [location[0] validateClass:v3 hasInstanceVariable:@"_actions" withType:"NSArray"];
  objc_storeStrong(v5, obj);
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v21 = self;
  SEL v20 = a2;
  v19.receiver = self;
  v19.super_class = (Class)UISwipeActionPullViewAccessibility;
  [(UISwipeActionPullViewAccessibility *)&v19 _accessibilityLoadAccessibilityInformation];
  char v17 = 0;
  objc_opt_class();
  id v4 = (id)[(UISwipeActionPullViewAccessibility *)v21 safeValueForKey:@"_buttons"];
  id v16 = (id)__UIAccessibilityCastAsClass();

  id v15 = v16;
  objc_storeStrong(&v16, 0);
  id v18 = v15;
  char v13 = 0;
  objc_opt_class();
  id v3 = (id)[(UISwipeActionPullViewAccessibility *)v21 safeValueForKey:@"_actions"];
  id v12 = (id)__UIAccessibilityCastAsClass();

  id v11 = v12;
  objc_storeStrong(&v12, 0);
  id v14 = v11;
  id v2 = v18;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __80__UISwipeActionPullViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9 = &unk_2650AE910;
  id v10 = v11;
  [v2 enumerateObjectsUsingBlock:&v5];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v18, 0);
}

void __80__UISwipeActionPullViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id *a1, void *a2, unint64_t a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  unint64_t v14 = a3;
  v13[2] = a4;
  v13[1] = a1;
  if ([a1[4] count] > a3)
  {
    v13[0] = (id)[a1[4] objectAtIndexedSubscript:v14];
    id v6 = location[0];
    id v7 = (id)[v13[0] accessibilityLabel];
    char v11 = 0;
    if ([v7 length])
    {
      id v12 = (id)[v13[0] accessibilityLabel];
      char v11 = 1;
      [v6 setAccessibilityLabel:v12];
    }
    else
    {
      [v6 setAccessibilityLabel:0];
    }
    if (v11) {

    }
    id v4 = location[0];
    id v5 = (id)[v13[0] accessibilityIdentifier];
    objc_msgSend(v4, "setAccessibilityIdentifier:");

    objc_storeStrong(v13, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)layoutSubviews
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISwipeActionPullViewAccessibility;
  [(UISwipeActionPullViewAccessibility *)&v2 layoutSubviews];
  [(UISwipeActionPullViewAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
}

@end