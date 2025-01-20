@interface _UIAlertControllerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsGroupedParent;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityViewIsModal;
- (id)accessibilityHeaderElements;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_prepareDetailMessageLabel;
- (void)_prepareMesssageLabel;
- (void)_prepareTitleLabel;
@end

@implementation _UIAlertControllerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIAlertControllerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v11 = location;
  id v10 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"_UIAlertControllerActionView";
  v4 = @"action";
  v7 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIAlertControllerView", @"alertController", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, v4, v7, 0);
  v8 = @"UIAlertController";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  [location[0] validateClass:@"UIAlertAction" hasInstanceVariable:@"_checked" withType:"BOOL"];
  v6 = @"_UIAlertControllerPhoneTVMacView";
  v5 = "UILabel";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:v6 hasInstanceVariable:@"_messageLabel" withType:v5];
  [location[0] validateClass:v6 hasInstanceVariable:@"_detailMessageLabel" withType:v5];
  v9 = "v";
  [location[0] validateClass:v6 hasInstanceMethod:@"_prepareTitleLabel" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"_prepareMesssageLabel", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"_prepareDetailMessageLabel", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"_dismissAnimated: triggeringAction:", v9, "B", v7, 0);
  objc_storeStrong(v11, v10);
}

- (BOOL)_accessibilityIsGroupedParent
{
  return 0;
}

- (unint64_t)_accessibilityAutomationType
{
  v6 = self;
  SEL v5 = a2;
  unint64_t v2 = [(_UIAlertControllerViewAccessibility *)self accessibilityTraits];
  if ((v2 & *MEMORY[0x263F81360]) == *MEMORY[0x263F81360]) {
    return 6;
  }
  v4.receiver = v6;
  v4.super_class = (Class)_UIAlertControllerViewAccessibility;
  return [(_UIAlertControllerViewAccessibility *)&v4 _accessibilityAutomationType];
}

- (unint64_t)accessibilityTraits
{
  v8 = self;
  v7[1] = (id)a2;
  char v6 = 0;
  objc_opt_class();
  id v3 = (id)[(_UIAlertControllerViewAccessibility *)v8 safeValueForKey:@"alertController"];
  id v5 = (id)__UIAccessibilityCastAsClass();

  id v4 = v5;
  objc_storeStrong(&v5, 0);
  v7[0] = v4;
  if ([v4 preferredStyle] == 1) {
    unint64_t v9 = *MEMORY[0x263F81360];
  }
  else {
    unint64_t v9 = *MEMORY[0x263F1CF18];
  }
  objc_storeStrong(v7, 0);
  return v9;
}

- (id)accessibilityLabel
{
  unint64_t v9 = self;
  v8[1] = (id)a2;
  char v7 = 0;
  objc_opt_class();
  id v4 = (id)[(_UIAlertControllerViewAccessibility *)v9 safeValueForKey:@"alertController"];
  id v6 = (id)__UIAccessibilityCastAsClass();

  id v5 = v6;
  objc_storeStrong(&v6, 0);
  v8[0] = v5;
  id v3 = (id)[v5 title];
  objc_storeStrong(v8, 0);

  return v3;
}

- (int64_t)accessibilityContainerType
{
  return 10;
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIAlertControllerViewAccessibility;
  [(_UIAlertControllerViewAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

- (void)_prepareTitleLabel
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIAlertControllerViewAccessibility;
  [(_UIAlertControllerViewAccessibility *)&v2 _prepareTitleLabel];
  [(_UIAlertControllerViewAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
}

- (void)_prepareMesssageLabel
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIAlertControllerViewAccessibility;
  [(_UIAlertControllerViewAccessibility *)&v2 _prepareMesssageLabel];
  [(_UIAlertControllerViewAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
}

- (void)_prepareDetailMessageLabel
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIAlertControllerViewAccessibility;
  [(_UIAlertControllerViewAccessibility *)&v2 _prepareDetailMessageLabel];
  [(_UIAlertControllerViewAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
}

- (BOOL)accessibilityPerformEscape
{
  v15 = self;
  v14[1] = (id)a2;
  char v13 = 0;
  objc_opt_class();
  id v4 = (id)[(_UIAlertControllerViewAccessibility *)v15 safeValueForKey:@"cancelAction"];
  id v12 = (id)__UIAccessibilityCastAsClass();

  id v11 = v12;
  objc_storeStrong(&v12, 0);
  v14[0] = v11;
  char v9 = 0;
  objc_opt_class();
  id v3 = (id)[(_UIAlertControllerViewAccessibility *)v15 safeValueForKey:@"alertController"];
  id v8 = (id)__UIAccessibilityCastAsClass();

  id v7 = v8;
  objc_storeStrong(&v8, 0);
  id v10 = v7;
  if (v14[0])
  {
    id v5 = v10;
    id v6 = v14[0];
    AXPerformSafeBlock();
    objc_storeStrong(&v6, 0);
    objc_storeStrong(&v5, 0);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(v14, 0);
  return 1;
}

- (id)accessibilityHeaderElements
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIAlertControllerViewAccessibility;
  return [(_UIAlertControllerViewAccessibility *)&v3 accessibilityHeaderElements];
}

@end