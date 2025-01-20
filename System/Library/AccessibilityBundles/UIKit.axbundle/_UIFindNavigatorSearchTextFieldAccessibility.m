@interface _UIFindNavigatorSearchTextFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIFindNavigatorSearchTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIFindNavigatorSearchTextField";
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
  [location[0] validateClass:@"_UIFindNavigatorSearchTextField" isKindOfClass:@"UITextField"];
  objc_storeStrong(location, 0);
}

- (unint64_t)accessibilityTraits
{
  v10 = self;
  SEL v9 = a2;
  unint64_t v8 = 0;
  v7.receiver = self;
  v7.super_class = (Class)_UIFindNavigatorSearchTextFieldAccessibility;
  unint64_t v8 = [(_UIFindNavigatorSearchTextFieldAccessibility *)&v7 accessibilityTraits];
  char v6 = 0;
  objc_opt_class();
  id v5 = (id)__UIAccessibilityCastAsClass();
  id v4 = v5;
  objc_storeStrong(&v5, 0);
  BOOL v3 = [v4 returnKeyType] != 6;

  if (!v3) {
    v8 |= *MEMORY[0x263F1CF30];
  }
  return v8;
}

- (id)automationElements
{
  v6[2] = self;
  v6[1] = (id)a2;
  v5.receiver = self;
  v5.super_class = (Class)_UIFindNavigatorSearchTextFieldAccessibility;
  v6[0] = [(_UIFindNavigatorSearchTextFieldAccessibility *)&v5 automationElements];
  if ([v6[0] count])
  {
    id v4 = (id)[MEMORY[0x263EFF9D8] orderedSetWithArray:v6[0]];
    id v7 = (id)[v4 array];
    objc_storeStrong(&v4, 0);
  }
  else
  {
    id v7 = v6[0];
  }
  objc_storeStrong(v6, 0);
  v2 = v7;

  return v2;
}

@end