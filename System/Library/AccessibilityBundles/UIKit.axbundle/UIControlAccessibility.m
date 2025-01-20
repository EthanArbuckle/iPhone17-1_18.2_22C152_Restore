@interface UIControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityAuditIssuesWithOptions:(id)a3;
- (id)_accessibilityObscuredScreenAllowedViews;
- (id)_systemDefaultFocusGroupIdentifier;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UIControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"UIView";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"UIControl");
  v4 = "@";
  [location[0] validateClass:@"UIView" hasInstanceMethod:@"_containingScrollView" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"_systemDefaultFocusGroupIdentifier", v4, 0);
  objc_storeStrong(v6, obj);
}

- (id)_systemDefaultFocusGroupIdentifier
{
  v9 = self;
  SEL v8 = a2;
  char v6 = 0;
  BOOL v4 = 0;
  if ([(UIControlAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    id v7 = (id)[(UIControlAccessibility *)v9 safeValueForKey:@"_containingScrollView"];
    char v6 = 1;
    BOOL v4 = v7 != 0;
  }
  if (v6) {

  }
  if (v4)
  {
    id v10 = 0;
  }
  else
  {
    v5.receiver = v9;
    v5.super_class = (Class)UIControlAccessibility;
    id v10 = [(UIControlAccessibility *)&v5 _systemDefaultFocusGroupIdentifier];
  }
  v2 = v10;

  return v2;
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  id v10 = self;
  v9[1] = (id)a2;
  id v4 = (id)[(UIControlAccessibility *)self accessibilityIdentification];
  char v5 = [v4 isEqualToString:@"UISearchControlDimmingView"];

  if (v5)
  {
    v9[0] = (id)[(UIControlAccessibility *)v10 safeValueForKey:@"superview"];
    id v8 = (id)[MEMORY[0x263EFF980] array];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id location = (id)[v9[0] _accessibilitySupplementaryHeaderViews];
      if ([location count]) {
        [v8 addObjectsFromArray:location];
      }
      objc_storeStrong(&location, 0);
    }
    id v11 = v8;
    objc_storeStrong(&v8, 0);
    objc_storeStrong(v9, 0);
  }
  else
  {
    v6.receiver = v10;
    v6.super_class = (Class)UIControlAccessibility;
    id v11 = [(UIControlAccessibility *)&v6 _accessibilityObscuredScreenAllowedViews];
  }
  v2 = v11;

  return v2;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  id v8 = self;
  SEL v7 = a2;
  if (!_accessibilitySupportsActivateAction_BaseActivateAction)
  {
    v2 = (objc_class *)objc_opt_class();
    _accessibilitySupportsActivateAction_BaseActivateAction = (uint64_t)class_getInstanceMethod(v2, sel_accessibilityActivate);
  }
  v3 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v3, sel_accessibilityActivate);
  BOOL v9 = InstanceMethod != (Method)_accessibilitySupportsActivateAction_BaseActivateAction
    || (v5.receiver = v8,
        v5.super_class = (Class)UIControlAccessibility,
        [(UIControlAccessibility *)&v5 _accessibilitySupportsActivateAction]);
  return v9;
}

- (BOOL)accessibilityActivate
{
  objc_super v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIControlAccessibility;
  return [(UIControlAccessibility *)&v3 accessibilityActivate];
}

- (id)accessibilityLabel
{
  objc_super v6 = self;
  location[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)UIControlAccessibility;
  location[0] = [(UIControlAccessibility *)&v4 accessibilityLabel];
  if (location[0]) {
    id v7 = location[0];
  }
  else {
    id v7 = -[UIViewAccessibility _accessibilityRetrieveIvarText](v6);
  }
  objc_storeStrong(location, 0);
  v2 = v7;

  return v2;
}

- (BOOL)isAccessibilityElement
{
  v12 = self;
  location[1] = (id)a2;
  id v2 = (id)[(UIControlAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v8 = v2 == 0;

  if (v8)
  {
    id v5 = (id)[(UIControlAccessibility *)v12 _accessibilitySubviews];
    BOOL v6 = [v5 count] != 0;

    if (v6
      || ((location[0] = -[UIViewAccessibility _accessibilityRetrieveIvarText](v12),
           [(UIControlAccessibility *)v12 bounds],
           double v10 = v3,
           ![location[0] length])
       || (AXDeviceGetMainScreenPixelBounds(), v10 >= CGRectGetHeight(v14) / 2.0)
        ? (int v9 = 0)
        : (v13 = 1, int v9 = 1),
          objc_storeStrong(location, 0),
          !v9))
    {
      char v13 = 0;
    }
  }
  else
  {
    id v7 = (id)[(UIControlAccessibility *)v12 isAccessibilityUserDefinedElement];
    char v13 = [v7 BOOLValue] & 1;
  }
  return v13 & 1;
}

- (unint64_t)accessibilityTraits
{
  CGRect v14 = self;
  SEL v13 = a2;
  id v2 = (id)[(UIControlAccessibility *)self accessibilityUserDefinedTraits];
  BOOL v10 = v2 == 0;

  if (v10)
  {
    unint64_t v12 = 0;
    v11.receiver = v14;
    v11.super_class = (Class)UIControlAccessibility;
    unint64_t v12 = [(UIControlAccessibility *)&v11 accessibilityTraits];
    id v7 = (id)[(UIControlAccessibility *)v14 safeValueForKey:@"isUserInteractionEnabled"];
    char v8 = [v7 BOOLValue];

    if ((v8 & 1) == 0) {
      v12 |= *MEMORY[0x263F1CF20];
    }
    unint64_t v6 = v12;
    if ([(UIControlAccessibility *)v14 safeBoolForKey:@"isEnabled"]) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = *MEMORY[0x263F1CF20];
    }
    if ([(UIControlAccessibility *)v14 safeBoolForKey:@"isSelected"]) {
      uint64_t v4 = *MEMORY[0x263F1CF38];
    }
    else {
      uint64_t v4 = 0;
    }
    return v6 | v5 | v4;
  }
  else
  {
    id v9 = (id)[(UIControlAccessibility *)v14 accessibilityUserDefinedTraits];
    unint64_t v15 = [v9 unsignedLongLongValue];
  }
  return v15;
}

- (id)_accessibilityAuditIssuesWithOptions:(id)a3
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13.receiver = v16;
  v13.super_class = (Class)UIControlAccessibility;
  id v14 = [(UIControlAccessibility *)&v13 _accessibilityAuditIssuesWithOptions:location[0]];
  if (!v14)
  {
    id v3 = (id)[MEMORY[0x263EFF980] array];
    id v4 = v14;
    id v14 = v3;
  }
  id v12 = (id)[MEMORY[0x263F81180] optionsDictionaryForAuditTest:*MEMORY[0x263F215C0] inDictionary:location[0]];
  char v11 = 0;
  char v11 = [MEMORY[0x263F81180] checkBoolValueForOptionsKey:*MEMORY[0x263F215D0] inDictionary:v12] & 1;
  if (v11)
  {
    char v10 = [(UIControlAccessibility *)v16 safeBoolForKey:@"isEnabled"] & 1;
    uint64_t v9 = [(UIControlAccessibility *)v16 accessibilityTraits];
    if ((v10 & 1) == 0 && (v9 & *MEMORY[0x263F1CF20]) != *MEMORY[0x263F1CF20])
    {
      id v8 = (id)[MEMORY[0x263F811D8] _axAuditGetTextFromObject:v16];
      id v7 = (id)objc_msgSend(MEMORY[0x263F81180], "dictionaryWithAXAuditIssue:element:additionalInfo:identifier:foregroundColor:backgroundColor:fontSize:elementRect:text:", 1003, v16, 0, 0, 0, 0, 0, v8);
      [v14 addObject:v7];
      objc_storeStrong(&v7, 0);
      objc_storeStrong(&v8, 0);
    }
  }
  id v6 = v14;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);

  return v6;
}

- (BOOL)canBecomeFocused
{
  id v7 = self;
  SEL v6 = a2;
  char v5 = 0;
  v4.receiver = self;
  v4.super_class = (Class)UIControlAccessibility;
  char v5 = [(UIControlAccessibility *)&v4 canBecomeFocused];
  if (([(UIControlAccessibility *)v7 _accessibilityIsFKARunningForFocusItem] & 1) == 0) {
    return v5 & 1;
  }
  char v3 = 0;
  if ([(UIControlAccessibility *)v7 isAccessibilityElement]) {
    char v3 = [(UIControlAccessibility *)v7 accessibilityRespondsToUserInteraction];
  }
  return v3 & 1;
}

@end