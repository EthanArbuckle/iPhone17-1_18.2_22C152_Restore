@interface SBMainSwitcherControllerCoordinatorInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_axWindowsForInverColors;
- (void)_accessibilityAppleInvertToMainSwitcherIfNecessary;
- (void)_accessibilityLoadInvertColors;
- (void)_activateNeighboringAppLayoutRequiringActiveAppLayout:(BOOL)a3 appLayoutEnvironment:(int64_t)a4 inForwardDirection:(BOOL)a5 windowScene:(id)a6 eventLabel:(id)a7;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SBMainSwitcherControllerCoordinatorInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBMainSwitcherControllerCoordinator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityAppleInvertToMainSwitcherIfNecessary
{
  v3 = [UIApp safeValueForKey:@"windowSceneManager"];
  v4 = [v3 safeValueForKey:@"embeddedDisplayWindowScene"];
  id v5 = [v4 safeValueForKey:@"switcherController"];

  -[SBMainSwitcherControllerCoordinatorInvertColorsAccessibility _accessibilityApplyInvertView:](self, "_accessibilityApplyInvertView:", [v5 safeBoolForKey:@"isMainSwitcherVisible"]);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBMainSwitcherControllerCoordinatorInvertColorsAccessibility;
  [(SBMainSwitcherControllerCoordinatorInvertColorsAccessibility *)&v4 viewWillAppear:a3];
  [(SBMainSwitcherControllerCoordinatorInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)_activateNeighboringAppLayoutRequiringActiveAppLayout:(BOOL)a3 appLayoutEnvironment:(int64_t)a4 inForwardDirection:(BOOL)a5 windowScene:(id)a6 eventLabel:(id)a7
{
  BOOL v8 = a5;
  BOOL v10 = a3;
  id v12 = a7;
  id v13 = a6;
  [(SBMainSwitcherControllerCoordinatorInvertColorsAccessibility *)self _accessibilityApplyInvertView:1];
  v14.receiver = self;
  v14.super_class = (Class)SBMainSwitcherControllerCoordinatorInvertColorsAccessibility;
  [(SBMainSwitcherControllerCoordinatorInvertColorsAccessibility *)&v14 _activateNeighboringAppLayoutRequiringActiveAppLayout:v10 appLayoutEnvironment:a4 inForwardDirection:v8 windowScene:v13 eventLabel:v12];
}

- (id)_axWindowsForInverColors
{
  v3 = +[NSMutableArray array];
  char v20 = 0;
  objc_opt_class();
  objc_super v4 = [(SBMainSwitcherControllerCoordinatorInvertColorsAccessibility *)self safeValueForKey:@"_switcherControllersByWindowScene"];
  id v5 = __UIAccessibilityCastAsClass();

  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v15 = v5;
  v6 = [v5 objectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        char v20 = 0;
        objc_opt_class();
        id v12 = [v11 safeValueForKey:@"switcherWindow"];
        id v13 = __UIAccessibilityCastAsClass();

        if (v20) {
          abort();
        }
        [v3 axSafelyAddObject:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v8);
  }

  return v3;
}

- (void)_accessibilityLoadInvertColors
{
}

@end