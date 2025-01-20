@interface _UIDeepestPreferredEnvironmentSearchAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_overridingPreferredFocusEnvironmentForPreferredEnvironment:(id)a3 visitedFocusEnvironments:(id)a4;
@end

@implementation _UIDeepestPreferredEnvironmentSearchAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIDeepestPreferredEnvironmentSearch";
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIDeepestPreferredEnvironmentSearch", @"_overridingPreferredFocusEnvironmentForPreferredEnvironment:visitedFocusEnvironments:", "@", "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)_overridingPreferredFocusEnvironmentForPreferredEnvironment:(id)a3 visitedFocusEnvironments:(id)a4
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  v15.receiver = v19;
  v15.super_class = (Class)_UIDeepestPreferredEnvironmentSearchAccessibility;
  id v16 = [(_UIDeepestPreferredEnvironmentSearchAccessibility *)&v15 _overridingPreferredFocusEnvironmentForPreferredEnvironment:location[0] visitedFocusEnvironments:v17];
  char v13 = 0;
  objc_opt_class();
  id v12 = (id)__UIAccessibilityCastAsClass();
  id v11 = v12;
  objc_storeStrong(&v12, 0);
  id v14 = v11;
  if (([v11 _accessibilityIsFKARunningForFocusItem] & 1) == 0) {
    goto LABEL_9;
  }
  id v10 = (id)[location[0] parentFocusEnvironment];
  while (v10)
  {
    if (v10 == v16)
    {
      id v20 = 0;
      int v9 = 1;
      goto LABEL_8;
    }
    id v4 = (id)[v10 parentFocusEnvironment];
    id v5 = v10;
    id v10 = v4;
  }
  int v9 = 0;
LABEL_8:
  objc_storeStrong(&v10, 0);
  if (!v9) {
LABEL_9:
  }
    id v20 = v16;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  v6 = v20;

  return v6;
}

@end