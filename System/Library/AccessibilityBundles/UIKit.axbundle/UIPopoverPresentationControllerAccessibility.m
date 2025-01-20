@interface UIPopoverPresentationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)preferredFocusEnvironments;
- (id)preferredFocusedView;
- (void)presentationTransitionWillBegin;
@end

@implementation UIPopoverPresentationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPopoverPresentationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"UIPopoverPresentationController";
  v4 = @"UIPresentationController";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIPopoverPresentationController", @"presentationTransitionWillBegin", "v", 0);
  v5 = "@";
  [location[0] validateClass:v4 hasInstanceMethod:@"preferredFocusedView" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"preferredFocusEnvironments", v5, 0);
  objc_storeStrong(v7, obj);
}

- (id)preferredFocusedView
{
  v13 = self;
  v12[1] = (id)a2;
  char v11 = 0;
  objc_opt_class();
  id v10 = (id)__UIAccessibilityCastAsClass();
  id v9 = v10;
  objc_storeStrong(&v10, 0);
  v12[0] = v9;
  id v5 = (id)[v9 presentedView];
  char v6 = [v5 _accessibilityIsFKARunningForFocusItem];

  if (v6)
  {
    id v4 = (id)[v12[0] passthroughViews];
    id v14 = (id)[v4 firstObject];
  }
  else
  {
    v7.receiver = v13;
    v7.super_class = (Class)UIPopoverPresentationControllerAccessibility;
    id v14 = [(UIPopoverPresentationControllerAccessibility *)&v7 preferredFocusedView];
  }
  int v8 = 1;
  objc_storeStrong(v12, 0);
  v2 = v14;

  return v2;
}

- (id)preferredFocusEnvironments
{
  v18 = self;
  v17[1] = (id)a2;
  char v16 = 0;
  objc_opt_class();
  id v15 = (id)__UIAccessibilityCastAsClass();
  id v14 = v15;
  objc_storeStrong(&v15, 0);
  v17[0] = v14;
  id v8 = (id)[v14 presentedView];
  char v9 = [v8 _accessibilityIsFKARunningForFocusItem];

  if (v9)
  {
    id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v4 = v13;
    id v5 = (id)[(UIPopoverPresentationControllerAccessibility *)v18 safeArrayForKey:@"passthroughViews"];
    objc_msgSend(v4, "axSafelyAddObjectsFromArray:");

    id v6 = v13;
    v12.receiver = v18;
    v12.super_class = (Class)UIPopoverPresentationControllerAccessibility;
    id v7 = [(UIPopoverPresentationControllerAccessibility *)&v12 preferredFocusEnvironments];
    objc_msgSend(v6, "axSafelyAddObjectsFromArray:");

    id v19 = v13;
    int v11 = 1;
    objc_storeStrong(&v13, 0);
  }
  else
  {
    v10.receiver = v18;
    v10.super_class = (Class)UIPopoverPresentationControllerAccessibility;
    id v19 = [(UIPopoverPresentationControllerAccessibility *)&v10 preferredFocusEnvironments];
    int v11 = 1;
  }
  objc_storeStrong(v17, 0);
  v2 = v19;

  return v2;
}

- (void)presentationTransitionWillBegin
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIPopoverPresentationControllerAccessibility;
  [(UIPopoverPresentationControllerAccessibility *)&v2 presentationTransitionWillBegin];
}

@end