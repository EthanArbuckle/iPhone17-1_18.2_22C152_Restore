@interface _UIAlertControllerActionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityUserTestingIsCancelButton;
- (BOOL)_accessibilityUserTestingIsDefaultButton;
- (BOOL)_accessibilityUserTestingIsDestructiveButton;
- (BOOL)_accessibilityUserTestingIsPreferredButton;
- (BOOL)isAccessibilityElement;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityLanguage;
- (id)accessibilityLocalizedStringTableName;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIAlertControllerActionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIAlertControllerActionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v10 = location;
  id v9 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"_UIAlertControllerActionView";
  v3 = "UILabel";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:@"_UIAlertControllerActionView" hasInstanceVariable:@"_descriptiveLabel" withType:"UILabel"];
  v7 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", @"_UIAlertControllerActionView", @"_hasDescriptiveText");
  v8 = "@";
  [location[0] validateClass:@"_UIAlertControllerActionView" hasInstanceMethod:@"action" withFullSignature:0];
  v5 = @"UIAlertAction";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_contentViewController", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"style", "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, @"_isPreferred", v7, 0);
  [location[0] validateClass:@"UIInterfaceActionRepresentationView"];
  v6 = @"UIInterfaceActionGroupView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"_UIAlertControllerInterfaceActionGroupView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"actionSelectionController", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIInterfaceActionCustomViewRepresentationView", @"setHighlighted:", "v", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIInterfaceActionSelectionTrackingController", @"_allActionViewsIncludingCooperatingActionViews", v8, 0);
  objc_storeStrong(v10, v9);
}

- (unint64_t)accessibilityTraits
{
  v15 = self;
  SEL v14 = a2;
  unint64_t v13 = 0;
  id v2 = (id)[(_UIAlertControllerActionViewAccessibility *)self accessibilityUserDefinedTraits];
  BOOL v7 = v2 == 0;

  if (v7)
  {
    v12.receiver = v15;
    v12.super_class = (Class)_UIAlertControllerActionViewAccessibility;
    unint64_t v13 = [(_UIAlertControllerActionViewAccessibility *)&v12 accessibilityTraits] | *MEMORY[0x263F1CEE8];
  }
  else
  {
    id v6 = (id)[(_UIAlertControllerActionViewAccessibility *)v15 accessibilityUserDefinedTraits];
    unint64_t v13 = [v6 unsignedLongLongValue];
  }
  char v10 = 0;
  objc_opt_class();
  id v5 = (id)[(_UIAlertControllerActionViewAccessibility *)v15 safeValueForKey:@"action"];
  id v9 = (id)__UIAccessibilityCastAsClass();

  id v8 = v9;
  objc_storeStrong(&v9, 0);
  id v11 = v8;
  if ([v8 safeBoolForKey:@"isEnabled"]) {
    v13 &= ~*MEMORY[0x263F1CF20];
  }
  else {
    v13 |= *MEMORY[0x263F1CF20];
  }
  if ([v11 safeBoolForKey:@"_checked"]) {
    v13 |= *MEMORY[0x263F1CF38];
  }
  unint64_t v4 = v13;
  objc_storeStrong(&v11, 0);
  return v4;
}

- (BOOL)isAccessibilityElement
{
  unint64_t v13 = self;
  v12[1] = (id)a2;
  id v2 = (id)[(_UIAlertControllerActionViewAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v8 = v2 == 0;

  if (v8)
  {
    char v11 = 0;
    objc_opt_class();
    id v6 = (id)[(_UIAlertControllerActionViewAccessibility *)v13 safeValueForKey:@"action"];
    id v10 = (id)__UIAccessibilityCastAsClass();

    id v9 = v10;
    objc_storeStrong(&v10, 0);
    v12[0] = v9;
    id v3 = (id)[v9 safeValueForKey:@"_contentViewController"];
    BOOL v5 = v3 == 0;

    char v14 = v5
       && ([(_UIAlertControllerActionViewAccessibility *)v13 accessibilityElementsHidden] & 1) == 0;
    objc_storeStrong(v12, 0);
  }
  else
  {
    id v7 = (id)[(_UIAlertControllerActionViewAccessibility *)v13 isAccessibilityUserDefinedElement];
    char v14 = [v7 BOOLValue] & 1;
  }
  return v14 & 1;
}

- (id)accessibilityLabel
{
  v15 = self;
  v14[1] = (id)a2;
  id v2 = (id)[(_UIAlertControllerActionViewAccessibility *)self accessibilityUserDefinedLabel];
  BOOL v11 = v2 == 0;

  if (v11)
  {
    id v10 = (id)[(_UIAlertControllerActionViewAccessibility *)v15 safeValueForKey:@"action"];
    v14[0] = (id)[v10 accessibilityLabel];

    if ([v14[0] length])
    {
      id v16 = v14[0];
      int v13 = 1;
    }
    else
    {
      id v9 = (id)[(_UIAlertControllerActionViewAccessibility *)v15 safeValueForKey:@"label"];
      id v12 = (id)[v9 accessibilityLabel];

      if ([(_UIAlertControllerActionViewAccessibility *)v15 safeBoolForKey:@"_hasDescriptiveText"])
      {
        id v8 = (id)[(_UIAlertControllerActionViewAccessibility *)v15 safeValueForKey:@"_descriptiveLabel"];
        id v7 = (id)[v8 accessibilityLabel];
        id v3 = (id)__UIAXStringForVariables();
        id v4 = v12;
        id v12 = v3;
      }
      id v16 = v12;
      int v13 = 1;
      objc_storeStrong(&v12, 0);
    }
    objc_storeStrong(v14, 0);
  }
  else
  {
    id v16 = (id)[(_UIAlertControllerActionViewAccessibility *)v15 accessibilityUserDefinedLabel];
  }
  BOOL v5 = v16;

  return v5;
}

- (id)accessibilityLocalizedStringTableName
{
  return (id)[(_UIAlertControllerActionViewAccessibility *)self _accessibilityRetrieveLocalizedStringTableName];
}

- (id)accessibilityLanguage
{
  id v8 = self;
  location[1] = (id)a2;
  id v4 = (id)[(_UIAlertControllerActionViewAccessibility *)self safeValueForKey:@"action"];
  location[0] = (id)[v4 accessibilityLanguage];

  if ([location[0] length])
  {
    id v9 = location[0];
  }
  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)_UIAlertControllerActionViewAccessibility;
    id v9 = [(_UIAlertControllerActionViewAccessibility *)&v5 accessibilityLanguage];
  }
  int v6 = 1;
  objc_storeStrong(location, 0);
  id v2 = v9;

  return v2;
}

- (id)accessibilityIdentifier
{
  id v8 = self;
  location[1] = (id)a2;
  id v4 = (id)[(_UIAlertControllerActionViewAccessibility *)self safeValueForKey:@"action"];
  location[0] = (id)[v4 accessibilityIdentifier];

  if ([location[0] length])
  {
    id v9 = location[0];
  }
  else
  {
    v5.receiver = v8;
    v5.super_class = (Class)_UIAlertControllerActionViewAccessibility;
    id v9 = [(_UIAlertControllerActionViewAccessibility *)&v5 accessibilityIdentifier];
  }
  int v6 = 1;
  objc_storeStrong(location, 0);
  id v2 = v9;

  return v2;
}

- (BOOL)_accessibilityUserTestingIsDefaultButton
{
  id v3 = (id)[(_UIAlertControllerActionViewAccessibility *)self safeValueForKey:@"action"];
  BOOL v4 = [v3 safeIntegerForKey:@"style"] == 0;

  return v4;
}

- (BOOL)_accessibilityUserTestingIsCancelButton
{
  id v3 = (id)[(_UIAlertControllerActionViewAccessibility *)self safeValueForKey:@"action"];
  BOOL v4 = [v3 safeIntegerForKey:@"style"] == 1;

  return v4;
}

- (BOOL)_accessibilityUserTestingIsDestructiveButton
{
  id v3 = (id)[(_UIAlertControllerActionViewAccessibility *)self safeValueForKey:@"action"];
  BOOL v4 = [v3 safeIntegerForKey:@"style"] == 2;

  return v4;
}

- (BOOL)_accessibilityUserTestingIsPreferredButton
{
  id v3 = (id)[(_UIAlertControllerActionViewAccessibility *)self safeValueForKey:@"action"];
  char v4 = [v3 safeBoolForKey:@"_isPreferred"];

  return v4 & 1;
}

@end