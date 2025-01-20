@interface UIActionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (UIActionAccessibility)initWithAction:(id)a3;
@end

@implementation UIActionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIAction";
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIAction", @"initWithAction:", "@", 0);
  objc_storeStrong(v4, obj);
}

- (UIActionAccessibility)initWithAction:(id)a3
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v17;
  v17 = 0;
  v14.receiver = v3;
  v14.super_class = (Class)UIActionAccessibility;
  v17 = [(UIActionAccessibility *)&v14 initWithAction:location[0]];
  v15 = v17;
  v5 = v15;
  id v6 = (id)[location[0] accessibilityLabel];
  -[UIActionAccessibility setAccessibilityLabel:](v5, "setAccessibilityLabel:");

  v7 = v15;
  id v8 = (id)[location[0] accessibilityValue];
  -[UIActionAccessibility setAccessibilityValue:](v7, "setAccessibilityValue:");

  v9 = v15;
  id v10 = (id)[location[0] accessibilityHint];
  -[UIActionAccessibility setAccessibilityHint:](v9, "setAccessibilityHint:");

  -[UIActionAccessibility setAccessibilityTraits:](v15, "setAccessibilityTraits:", [location[0] accessibilityTraits]);
  v11 = v15;
  id v12 = (id)[location[0] accessibilityUserInputLabels];
  -[UIActionAccessibility setAccessibilityUserInputLabels:](v11, "setAccessibilityUserInputLabels:");

  -[UIActionAccessibility setAccessibilityElementsHidden:](v15, "setAccessibilityElementsHidden:", [location[0] accessibilityElementsHidden] & 1);
  v13 = v15;
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v13;
}

@end