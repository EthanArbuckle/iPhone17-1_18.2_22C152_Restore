@interface _UITabBarItemBridgedElementAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityAttributedHint;
- (id)accessibilityAttributedLabel;
- (id)accessibilityAttributedValue;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation _UITabBarItemBridgedElementAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UITabBarItemBridgedElement";
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
  v3 = @"_UITabBarItemBridgedElement";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UITabBarItemBridgedElement", @"tabBarItem", "@", 0);
  objc_storeStrong(v5, obj);
}

- (id)accessibilityLabel
{
  id v3 = (id)[(_UITabBarItemBridgedElementAccessibility *)self safeValueForKey:@"tabBarItem"];
  id v4 = (id)[v3 accessibilityLabel];

  return v4;
}

- (id)accessibilityAttributedLabel
{
  id v3 = (id)[(_UITabBarItemBridgedElementAccessibility *)self safeValueForKey:@"tabBarItem"];
  id v4 = (id)[v3 accessibilityAttributedLabel];

  return v4;
}

- (id)accessibilityValue
{
  id v3 = (id)[(_UITabBarItemBridgedElementAccessibility *)self safeValueForKey:@"tabBarItem"];
  id v4 = (id)[v3 accessibilityValue];

  return v4;
}

- (id)accessibilityAttributedValue
{
  id v3 = (id)[(_UITabBarItemBridgedElementAccessibility *)self safeValueForKey:@"tabBarItem"];
  id v4 = (id)[v3 accessibilityAttributedValue];

  return v4;
}

- (id)accessibilityHint
{
  id v3 = (id)[(_UITabBarItemBridgedElementAccessibility *)self safeValueForKey:@"tabBarItem"];
  id v4 = (id)[v3 accessibilityHint];

  return v4;
}

- (id)accessibilityAttributedHint
{
  id v3 = (id)[(_UITabBarItemBridgedElementAccessibility *)self safeValueForKey:@"tabBarItem"];
  id v4 = (id)[v3 accessibilityAttributedHint];

  return v4;
}

- (unint64_t)accessibilityTraits
{
  id v3 = (id)[(_UITabBarItemBridgedElementAccessibility *)self safeValueForKey:@"tabBarItem"];
  unint64_t v4 = [v3 accessibilityTraits];

  return v4;
}

- (id)accessibilityIdentifier
{
  id v3 = (id)[(_UITabBarItemBridgedElementAccessibility *)self safeValueForKey:@"tabBarItem"];
  id v4 = (id)[v3 accessibilityIdentifier];

  return v4;
}

- (id)accessibilityUserInputLabels
{
  id v3 = (id)[(_UITabBarItemBridgedElementAccessibility *)self safeValueForKey:@"tabBarItem"];
  id v4 = (id)[v3 accessibilityUserInputLabels];

  return v4;
}

- (id)accessibilityCustomActions
{
  id v3 = (id)[(_UITabBarItemBridgedElementAccessibility *)self safeValueForKey:@"tabBarItem"];
  id v4 = (id)[v3 accessibilityCustomActions];

  return v4;
}

@end